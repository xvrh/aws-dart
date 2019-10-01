// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  return Schema()
    ..operations = (json['operations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Operation.fromJson(e as Map<String, dynamic>)),
    )
    ..shapes = (json['shapes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Shape.fromJson(e as Map<String, dynamic>)),
    )
    ..metadata = json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
    ..documentation = json['documentation'] as String;
}

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return Metadata()
    ..apiVersion = json['apiVersion'] as String
    ..endpointPrefix = json['endpointPrefix'] as String
    ..protocol = json['protocol'] as String
    ..serviceAbbreviation = json['serviceAbbreviation'] as String
    ..serviceFullName = json['serviceFullName'] as String
    ..serviceId = json['serviceId'] as String
    ..signatureVersion = json['signatureVersion'] as String
    ..targetPrefix = json['targetPrefix'] as String
    ..uid = json['uid'] as String;
}

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return Operation()
    ..name = json['name'] as String
    ..documentation = json['documentation'] as String
    ..input = json['input'] == null
        ? null
        : Ref.fromJson(json['input'] as Map<String, dynamic>)
    ..output = json['output'] == null
        ? null
        : Ref.fromJson(json['output'] as Map<String, dynamic>)
    ..errors = (json['errors'] as List)
        ?.map((e) => e == null ? null : Ref.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..http = json['http'] == null
        ? null
        : Http.fromJson(json['http'] as Map<String, dynamic>);
}

Ref _$RefFromJson(Map<String, dynamic> json) {
  return Ref()
    ..shape = json['shape'] as String
    ..documentation = json['documentation'] as String
    ..location = json['location'] as String
    ..locationName = json['locationName'] as String;
}

Http _$HttpFromJson(Map<String, dynamic> json) {
  return Http()
    ..method = json['method'] as String
    ..requestUri = json['requestUri'] as String;
}

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape()
    ..type = json['type'] as String
    ..documentation = json['documentation'] as String
    ..required = (json['required'] as List)?.map((e) => e as String)?.toList()
    ..members = (json['members'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Ref.fromJson(e as Map<String, dynamic>)),
    )
    ..member = json['member'] == null
        ? null
        : Ref.fromJson(json['member'] as Map<String, dynamic>)
    ..key = json['key'] == null
        ? null
        : Ref.fromJson(json['key'] as Map<String, dynamic>)
    ..value = json['value'] == null
        ? null
        : Ref.fromJson(json['value'] as Map<String, dynamic>)
    ..max = json['max'] as int
    ..min = json['min'] as int
    ..pattern = json['pattern'] as String
    ..enums = (json['enum'] as List)?.map((e) => e as String)?.toList();
}
