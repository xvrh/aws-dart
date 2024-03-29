import 'schema.dart' as s;
import 'utils/case_format.dart';
import 'utils/dart_keywords.dart';
import 'utils/split_words.dart';
import 'package:meta/meta.dart';

// 2/+ Faire la validation dans le constructeur des classes input et des paramètres inputs
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

  DartType get returnDartType {
    if (output != null) {
      return output.dartType;
    } else {
      return DartType.core('void');
    }
  }

  List<Parameter> get parameters {
    var input = this.input;
    var parameters = <Parameter>[];

    if (input != null) {
      Structure structure = input;

      for (var member in structure.members) {
        bool isRequired =
            structure.shape.required?.contains(member.key) ?? false;

        parameters.add(Parameter(member, member.key,
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
  final Member member;
  final String name;
  final bool isRequired;
  final bool isComplexType;

  Parameter(this.member, this.name,
      {@required this.isRequired, @required this.isComplexType});

  Shape get shape => member.shape;

  String get documentation => member.documentation;

  DartType get type => shape.dartType;

  String get dartName {
    return preventKeywords(dartStyleVariable(splitWords(name)));
  }

  String declarationCode({@required bool isNamed}) =>
      '${isNamed && isRequired ? '@required' : ''} ${type.name} $dartName';

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

  String fromJsonCode(String property);
}

class DartType {
  final String name;
  final Set<String> imports;

  const DartType.core(this.name) : imports = const {};

  const DartType(this.name, this.imports);

  toString() => name;
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

  String fromJsonCode(String property) => '$property as String';
}

class PrimitiveBoolean extends Primitive {
  PrimitiveBoolean(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('bool');

  String fromJsonCode(String property) => '$property as bool';
}

class PrimitiveTimestamp extends Primitive {
  PrimitiveTimestamp(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('DateTime');

  String fromJsonCode(String property) => 'DateTime.parse($property)';
}

class PrimitiveInteger extends Primitive {
  PrimitiveInteger(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('int');

  String fromJsonCode(String property) => '$property as int';
}

class PrimitiveLong extends Primitive {
  PrimitiveLong(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('BigInt');

  String fromJsonCode(String property) => 'BigInt.from($property)';
}

class PrimitiveDouble extends Primitive {
  PrimitiveDouble(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType.core('double');

  String fromJsonCode(String property) => '$property as double';
}

class PrimitiveBlob extends Primitive {
  PrimitiveBlob(String name, s.Shape shape) : super._(name, shape);

  get dartType => const DartType('Uint8List', {'dart:typed_data'});

  String fromJsonCode(String property) => 'Uint8List($property)';
}

class ShapeList extends Shape {
  Shape _itemType;

  ShapeList(String name, s.Shape shape) : super._(name, shape);

  get dartType => DartType(
      'List<${_itemType.dartType.name}>', {..._itemType.dartType.imports});

  @override
  void init(Api api) {
    super.init(api);
    _itemType = api.findShape(shape.member.shape);
  }

  get children => [_itemType];

  String fromJsonCode(String property) => '($property as List).map((e) => ${_itemType.fromJsonCode('e')}).toList()';
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

  String fromJsonCode(String property) => '($property as Map).map((k, v) => MapEntry(${_key.fromJsonCode('k')}, ${_value.fromJsonCode('v')}))';
}

class Structure extends Shape {
  final members = <Member>[];

  Structure(String name, s.Shape shape) : super._(name, shape);

  String get documentation => shape.documentation;

  get dartType => DartType('$className', const {});

  String get className => dartStyleClassName(splitWords(name));

  @override
  void init(Api api) {
    super.init(api);
    for (var member in shape.members.entries) {
      members.add(Member(member.key, api.findShape(member.value.shape), member.value.documentation));
    }
  }

  get children => members.map((m) => m.shape).toList();

  List<Property> get properties =>
      members.map((m) => Property(m,
          isRequired: shape.required?.contains(m.key) ?? false)).toList();

  String fromJsonCode(String property) => '$className.fromJson($property)';
}

class Member {
  final String key;
  final Shape shape;
  final String documentation;

  Member(this.key, this.shape, this.documentation);
}

class Property {
  final Member member;
  final bool isRequired;

  Property(this.member, {@required this.isRequired});

  String get name => member.key;

  String get dartName {
    return preventKeywords(dartStyleVariable(splitWords(member.key)));
  }

  fromJsonCode(String jsonProperty) {
    return member.shape.fromJsonCode(jsonProperty);
  }
}
