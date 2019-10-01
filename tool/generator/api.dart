import 'dart:convert';

import 'schema.dart' as s;
import 'utils/case_format.dart';
import 'utils/dart_keywords.dart';
import 'utils/split_words.dart';
import 'package:meta/meta.dart';

// 1/ Exposer tous les paramètres dans les méthodes (faire le renommage, marqué comme required)
//    Ajouter la validation pour chaque paramètre
//    Serializer tous les paramtères
// 2/ Générer les classes qui se retrouve dans les paramètres et faire la serialization
//    + Faire la validation dans le constructeur? Oui si les classes sont immutables
// 3/ Faire la deserialization du type de retour (pas de validation dans le constructeur).
// 4/ Faire les implémentations du client avec tous les méthodes de serialization
//    => recopier le code du sdk js pour la gestion des credentials? => non
//
class Api {
  final s.Schema schema;
  final List<Shape> shapes;
  final List<Operation> operations;

  Api(this.schema)
      : shapes =
            schema.shapes.entries.map((e) => Shape(e.key, e.value)).toList(),
        operations =
            schema.operations.values.map((o) => Operation(o)).toList() {
    shapes.forEach((s) => s.init(this));
    operations.forEach((s) => s.init(this));
  }

  String get serviceName => schema.metadata.serviceId;

  String get fileName {
    var split = splitWords(serviceName);
    return split.map((s) => s.toLowerCase()).join('_') +
        '/' +
        schema.metadata.apiVersion.replaceAll('-', '_');
  }

  String get apiClassName {
    return splitWords(serviceName)
            .map((s) => capitalize(s.length > 2 ? s.toLowerCase() : s))
            .join('') +
        'Api';
  }

  List<Structure> get declarations {
    return shapes
        .whereType<Structure>()
        .where((s) => s.isOutput() || s.isSubLevelInput())
        .toList();
  }

  Shape findShape(String name) => shapes.firstWhere((s) => s.name == name);
}

class Operation {
  final s.Operation operation;
  Shape _input, _output;
  Api _api;

  Operation(this.operation);

  void init(Api api) {
    _api = api;
    if (operation.input != null) {
      _input = api.findShape(operation.input.shape);
    }
    if (operation.output != null) {
      _output = api.findShape(operation.output.shape);
    }
  }

  Shape get input => _input;

  Shape get output => _output;

  String get methodName => dartStyleVariable(splitWords(operation.name));

  List<Parameter> get parameters {
    var input = this.input;
    var parameters = <Parameter>[];

    if (input != null) {
      Structure structure = input;

      for (var member in structure.members.entries) {
        bool isRequired =
            structure.shape.required?.contains(member.key) ?? false;

        parameters.add(Parameter(member.value.dartType, member.key,
            isRequired: isRequired, isComplexType: member is Structure));
      }
    }
    return parameters;
  }

  String get parametersCode {
    var positionals = <Parameter>[];

    var parameters = this.parameters;

    if (parameters.where((p) => p.isRequired).length == 1) {
      positionals.add(parameters.singleWhere((p) => p.isRequired));
    }
    var namedParameters =
        parameters.where((p) => !positionals.contains(p)).toList();

    var output =
        positionals.map((p) => p.declarationCode(isNamed: false)).join(', ');
    if (namedParameters.isNotEmpty) {
      if (output != '') {
        output += ', ';
      }
      output += '{';
      output += namedParameters
          .map((p) => p.declarationCode(isNamed: true))
          .join(', ');
      output += '}';
    }
    return output;
  }

  Set<String> get parameterImports =>
      parameters.map((p) => p.type.imports).expand((f) => f).toSet();
}

class Parameter {
  final DartType type;
  final String name;
  final bool isRequired;
  final bool isComplexType;

  Parameter(this.type, this.name,
      {@required this.isRequired, @required this.isComplexType});

  String get dartName {
    return preventKeywords(dartStyleVariable(splitWords(name)));
  }

  String declarationCode({@required bool isNamed}) =>
      '${isNamed && isRequired ? '@required' : ''} ${type.type} $dartName';

  toString() => declarationCode(isNamed: false);
}

abstract class Shape {
  final s.Shape shape;
  final String name;
  Api _api;

  Shape._(this.name, this.shape);

  factory Shape(String name, s.Shape shape) {
    switch (shape.type) {
      case 'structure':
        return Structure(name, shape);
      case 'string':
        return PrimitiveString(name, shape);
      case 'boolean':
        return PrimitiveBoolean(name, shape);
      case 'timestamp':
        return PrimitiveTimestamp(name, shape);
      case 'integer':
        return PrimitiveInteger(name, shape);
      case 'long':
        return PrimitiveLong(name, shape);
      case 'double':
      case 'float':
        return PrimitiveDouble(name, shape);
      case 'blob':
        return PrimitiveBlob(name, shape);
      case 'list':
        return ShapeList(name, shape);
      case 'map':
        return ShapeMap(name, shape);
      default:
        throw 'Unsupported type ${shape.type}';
    }
  }

  Api get api => _api;

  @mustCallSuper
  void init(Api api) {
    _api = api;
  }

  void postInit() {}

  List<Shape> get children;

  bool isOutput() {
    for (var operation in api.operations) {
      if (operation.output != null) {
        if (operation.output._allDescendant.contains(this)) {
          return true;
        }
      }
    }
    return false;
  }

  bool isSubLevelInput() {
    for (var operation in api.operations) {
      if (operation.input != null) {
        if (operation.input != this &&
            operation.input._allDescendant.contains(this)) {
          return true;
        }
      }
    }
    return false;
  }

  Set<Shape> get _allDescendant {
    var destination = <Shape>{};
    _collectAllDescendant(destination);
    return destination;
  }

  void _collectAllDescendant(Set<Shape> destination) {
    if (!destination.contains(this)) {
      destination.add(this);
      for (var child in children) {
        child._collectAllDescendant(destination);
      }
    }
  }

  DartType get dartType;
}

class DartType {
  final String type;
  final Set<String> imports;

  const DartType.core(this.type) : imports = const {};

  const DartType(this.type, this.imports);

  toString() => type;
}

abstract class Primitive extends Shape {
  Primitive._(String name, s.Shape shape) : super._(name, shape);

  void init(Api api) {
    super.init(api);
  }

  get children => [];
}

class PrimitiveString extends Primitive {
  PrimitiveString(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('String');
}

class PrimitiveBoolean extends Primitive {
  PrimitiveBoolean(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('bool');
}

class PrimitiveTimestamp extends Primitive {
  PrimitiveTimestamp(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('DateTime');
}

class PrimitiveInteger extends Primitive {
  PrimitiveInteger(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('int');
}

class PrimitiveLong extends Primitive {
  PrimitiveLong(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('BigInt');
}

class PrimitiveDouble extends Primitive {
  PrimitiveDouble(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('double');
}

class PrimitiveBlob extends Primitive {
  PrimitiveBlob(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType('Uint8List', {'dart:typed_data'});
}

class ShapeList extends Shape {
  Shape _itemType;

  ShapeList(String name, s.Shape shape) : super._(name, shape);

  get dartType => DartType(
      'List<${_itemType.dartType.type}>', {..._itemType.dartType.imports});

  @override
  void init(Api api) {
    super.init(api);
    _itemType = api.findShape(shape.member.shape);
  }

  get children => [_itemType];
}

class ShapeMap extends Shape {
  Shape _key, _value;

  ShapeMap(String name, s.Shape shape) : super._(name, shape);

  get dartType => DartType('Map<${_key.dartType}, ${_value.dartType}>',
      {..._key.dartType.imports, ..._value.dartType.imports});

  @override
  void init(Api api) {
    super.init(api);
    _key = api.findShape(shape.key.shape);
    _value = api.findShape(shape.value.shape);
  }

  get children => [_key, _value];
}

class Structure extends Shape {
  final members = <String, Shape>{};

  Structure(String name, s.Shape shape) : super._(name, shape);

  get dartType => DartType('$className', const {});

  String get className => dartStyleClassName(splitWords(name));

  @override
  void init(Api api) {
    super.init(api);
    for (var member in shape.members.entries) {
      members[member.key] = api.findShape(member.value.shape);
    }
  }

  get children => members.values.toList();
}


