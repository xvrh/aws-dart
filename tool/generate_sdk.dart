import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dart_style/dart_style.dart';

import 'generator/api.dart';
import 'generator/schema.dart';
import 'generator/utils/case_format.dart';
import 'generator/utils/dart_keywords.dart';
import 'generator/utils/documentation_comment.dart';
import 'generator/utils/split_words.dart';

final destination = 'lib/apis';
final _dartFormatter = DartFormatter();

main() {
  var destinationDirectory = Directory(destination);
  if (destinationDirectory.existsSync()) {
    destinationDirectory.deleteSync(recursive: true);
  }
  destinationDirectory.createSync(recursive: true);

  for (var file in Directory('aws-sdk-js/apis')
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.normal.json'))) {
    var schema = Schema.fromJson(jsonDecode(file.readAsStringSync()));
    var api = Api(schema);

    var code = StringBuffer();
    code.writeln("import 'package:meta/meta.dart';");

    var imports = <String>{
      for (var operation in api.operations) ...operation.parameterImports,
      for (var operation in api.operations) ...operation.returnDartType.imports,
      for (var declaration in api.declarations)
        for (var member in declaration.members)
          ...member.shape.dartType.imports,
    };
    for (var import in imports) {
      code.writeln("import '$import';");
    }

    code.writeln(documentationComment(api.schema.documentation, indent: 0));
    code.writeln('class ${api.apiClassName} {');
    for (var operation in api.operations) {
      code.writeln(documentationComment(operation.operation.documentation, indent: 2));

      for (var parameter in operation.parameters) {
        if (parameter.documentation != null) {
          code.writeln('  /// ');
          code.writeln(documentationComment('${parameter.documentation}', argumentName: parameter.dartName, indent: 2));
        }
      }
      //TODO(xha): ajouter toute la documentation pour les arguments et la valeur de retour

      code.writeln(
          'Future<${operation.returnDartType}> ${operation.methodName}(${operation.parametersCode}) async {');

      if (operation.output != null) {
        Structure output = operation.output;
        code.writeln('return ${output.className}.fromJson({});');
      }

      code.writeln('}');
      code.writeln('');
    }
    code.writeln('}');

    for (var declaration in api.declarations) {
      code.writeln('class ${declaration.className} {');
      var properties = declaration.properties;
      for (var property in properties) {
        code.writeln(documentationComment(property.member.documentation, indent: 2));
        code.writeln('final ${property.member.shape.dartType.name} ${property.dartName};');
        code.writeln('');
      }

      code.writeln('${declaration.className}(');
      if (properties.isNotEmpty) {
        code.write('{');
      }
      for (var property in properties) {
        code.writeln('${property.isRequired ? '@required' : ''} this.${property.dartName},');
      }
      if (properties.isNotEmpty) {
        code.write('}');
      }
      code.writeln(');');
      if (declaration.isOutput()) {
        code.writeln('static ${declaration.className} fromJson(Map<String, dynamic> json) => ${declaration.className}();');
      }

      code.writeln('}');
    }

    var formattedCode = _dartFormatter.format(code.toString());
    var destinationFile = p.join(destination, api.fileName + '.dart');
    var destinationDirectory = Directory(p.dirname(destinationFile));
    if (!destinationDirectory.existsSync()) {
      destinationDirectory.createSync(recursive: true);
    }
    File(destinationFile).writeAsStringSync(formattedCode);
  }
}
