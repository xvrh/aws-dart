import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dart_style/dart_style.dart';

import 'generator/api.dart';
import 'generator/schema.dart';
import 'generator/utils/documentation_comment.dart';

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
      for (var operation in api.operations) ...operation.parameterImports
    };
    for (var import in imports) {
      code.writeln("import '$import';");
    }

    code.writeln(documentationComment(api.schema.documentation, indent: 0));
    code.writeln('class ${api.apiClassName} {');
    for (var operation in api.operations) {
      code.writeln(documentationComment(operation.operation.documentation, indent: 2));
      //TODO(xha): ajouter toute la documentation pour les arguments et la valeur de retour

      code.writeln(
          'Future<void> ${operation.methodName}(${operation.parametersCode}) async {');

      code.writeln('}');
      code.writeln('');
    }
    code.writeln('}');

    for (var declaration in api.declarations) {
      code.writeln('class ${declaration.className} {');

      code.writeln('}');
    }

//    Map<String, dynamic> shapes = json['shapes'];
//    for (var shapeName in shapes.keys) {
//      Map<String, dynamic> shapeInfo = shapes[shapeName];
//      var type = shapeInfo['type'];
//      if (type == 'structure') {
//        code.writeln('class $shapeName {');
//        Map<String, dynamic> members = shapeInfo['members'];
//        for (var member in members.entries) {
//          var memberInfo = member.value;
//          var memberShape = memberInfo['shape'];
//
//          code.writeln('  var ${member.key};');
//        }
//
//        code.writeln('}');
//      }
//    }

    var formattedCode = _dartFormatter.format(code.toString());
    var destinationFile = p.join(destination, api.fileName + '.dart');
    var destinationDirectory = Directory(p.dirname(destinationFile));
    if (!destinationDirectory.existsSync()) {
      destinationDirectory.createSync(recursive: true);
    }
    File(destinationFile).writeAsStringSync(formattedCode);
  }
}
