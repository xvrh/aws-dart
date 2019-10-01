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
    code.writeln('final _client;');

    code.writeln("${api.apiClassName}(client): _client = client.configured('${api.schema.metadata.serviceId}', serializer: '${api.schema.metadata.protocol}');");

    for (var operation in api.operations) {
      code.writeln(documentationComment(operation.operation.documentation, indent: 2));

      for (var parameter in operation.parameters) {
        if (parameter.documentation != null && parameter.documentation.isNotEmpty) {
          code.writeln('  /// ');
          code.writeln(documentationComment('${parameter.documentation}', argumentName: parameter.dartName, indent: 2));
        }
      }

      code.writeln(
          'Future<${operation.returnDartType}> ${operation.methodName}(${operation.parametersCode}) async {');
      //TODO(xha): ajouter la validation pour chaque argument

      var sendCode = "await _client.send('${operation.operation.name}', {";
      for (var parameter in operation.parameters) {
        if (!parameter.isRequired) {
          sendCode += 'if (${parameter.dartName} != null)';
        }
        sendCode += "'${parameter.name}' : ${parameter.dartName},";
      }

      sendCode += '})';

      if (operation.output != null) {
        code.writeln("var response_ = $sendCode;");

        Structure output = operation.output;
        code.writeln('return ${output.className}.fromJson(response_);');
      } else {
        code.writeln("$sendCode;");
      }

      code.writeln('}');
      code.writeln('');
    }
    code.writeln('}');

    for (var declaration in api.declarations) {
      code.writeln(documentationComment(declaration.documentation, indent: 0));
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
        code.writeln('static ${declaration.className} fromJson(Map<String, dynamic> json) => ${declaration.className}(');
        for (var property in properties) {
          code.writeln("${property.dartName}: ");
          var fromJsonCode = property.fromJsonCode("json['${property.name}']");
          if (!property.isRequired) {
            code.writeln("json.containsKey('${property.name}') ? $fromJsonCode : null,");
          } else {
            code.writeln('$fromJsonCode,');
          }
        }
        code.writeln(');');
      }

      if (declaration.isSubLevelInput()) {
        code.writeln('Map<String, dynamic> toJson() => <String, dynamic>{};');
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
