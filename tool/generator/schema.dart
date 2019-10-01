import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable(createToJson: false)
class Schema {
   Map<String, Operation> operations;
   Map<String, Shape> shapes;
   Metadata metadata;
   String documentation;

   Schema();
   factory Schema.fromJson(Map<String, dynamic> json) => _$SchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class Metadata {
   String apiVersion,
      endpointPrefix,
      protocol,
      serviceAbbreviation,
      serviceFullName,
      serviceId,
      signatureVersion,
      targetPrefix,
      uid;

   Metadata();
  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}

@JsonSerializable(createToJson: false)
class Operation {
  String name, documentation;
  Ref input, output;
  List<Ref> errors;
  Http http;

  Operation();
  factory Operation.fromJson(Map<String, dynamic> json) => _$OperationFromJson(json);
}

@JsonSerializable(createToJson: false)
class Ref {
  String shape;
  String documentation;
  String location;
  String locationName;

  Ref();
  factory Ref.fromJson(Map<String, dynamic> json) => _$RefFromJson(json);
}

@JsonSerializable(createToJson: false)
class Http {
  String method, requestUri;

  Http();
  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}

@JsonSerializable(createToJson: false)
class Shape {
  String type;
  String documentation;
  List<String> required;
  Map<String, Ref> members;
  Ref member, key, value;
  int max, min;
  String pattern;

  @JsonKey(name: 'enum')
  List<String> enums;

  Shape();
  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
}
