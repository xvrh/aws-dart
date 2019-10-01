import 'package:meta/meta.dart';

///  Comprehend Medical extracts structured information from unstructured
/// clinical text. Use these actions to gain insight in your documents.
class ComprehendMedicalApi {
  ///  Inspects the clinical text for a variety of medical entities and returns
  /// specific information about them such as entity category, location, and
  /// confidence score on that information .
  ///
  /// [text]:  A UTF-8 text string containing the clinical content being
  /// examined for entities. Each string must contain fewer than 20,000 bytes of
  /// characters.
  Future<DetectEntitiesResponse> detectEntities(String text) async {
    return DetectEntitiesResponse.fromJson({});
  }

  ///  Inspects the clinical text for personal health information (PHI) entities
  /// and entity category, location, and confidence score on that information.
  ///
  /// [text]:  A UTF-8 text string containing the clinical content being
  /// examined for PHI entities. Each string must contain fewer than 20,000
  /// bytes of characters.
  Future<DetectPhiResponse> detectPhi(String text) async {
    return DetectPhiResponse.fromJson({});
  }
}

class Attribute {
  ///  The type of attribute.
  final String type;

  ///  The level of confidence that Comprehend Medical has that the segment of
  /// text is correctly recognized as an attribute.
  final double score;

  ///  The level of confidence that Comprehend Medical has that this attribute
  /// is correctly related to this entity.
  final double relationshipScore;

  ///  The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  final int id;

  ///  The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  final int beginOffset;

  ///  The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  final int endOffset;

  ///  The segment of input text extracted as this attribute.
  final String text;

  ///  Contextual information for this attribute.
  final List<Trait> traits;

  Attribute({
    this.type,
    this.score,
    this.relationshipScore,
    this.id,
    this.beginOffset,
    this.endOffset,
    this.text,
    this.traits,
  });
  static Attribute fromJson(Map<String, dynamic> json) => Attribute();
}

class DetectEntitiesResponse {
  ///  The collection of medical entities extracted from the input text and
  /// their associated information. For each entity, the response provides the
  /// entity text, the entity category, where the entity text begins and ends,
  /// and the level of confidence that Comprehend Medical has in the detection
  /// and analysis. Attributes and traits of the entity are also returned.
  final List<Entity> entities;

  ///  Attributes extracted from the input text that we were unable to relate to
  /// an entity.
  final List<UnmappedAttribute> unmappedAttributes;

  ///  If the result of the previous request to DetectEntities was truncated,
  /// include the Paginationtoken to fetch the next page of entities.
  final String paginationToken;

  DetectEntitiesResponse({
    @required this.entities,
    this.unmappedAttributes,
    this.paginationToken,
  });
  static DetectEntitiesResponse fromJson(Map<String, dynamic> json) =>
      DetectEntitiesResponse();
}

class DetectPhiResponse {
  ///  The collection of PHI entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence that Comprehend Medical has in its detection.
  final List<Entity> entities;

  ///  If the result of the previous request to DetectPHI was truncated, include
  /// the Paginationtoken to fetch the next page of PHI entities.
  final String paginationToken;

  DetectPhiResponse({
    @required this.entities,
    this.paginationToken,
  });
  static DetectPhiResponse fromJson(Map<String, dynamic> json) =>
      DetectPhiResponse();
}

class Entity {
  ///  The numeric identifier for the entity. This is a monotonically increasing
  /// id unique within this response rather than a global unique identifier.
  final int id;

  ///  The 0-based character offset in the input text that shows where the
  /// entity begins. The offset returns the UTF-8 code point in the string.
  final int beginOffset;

  ///  The 0-based character offset in the input text that shows where the
  /// entity ends. The offset returns the UTF-8 code point in the string.
  final int endOffset;

  /// The level of confidence that Comprehend Medical has in the accuracy of the
  /// detection.
  final double score;

  ///  The segment of input text extracted as this entity.
  final String text;

  ///  The category of the entity.
  final String category;

  ///  Describes the specific type of entity with category of entities.
  final String type;

  /// Contextual information for the entity
  final List<Trait> traits;

  ///  The extracted attributes that relate to this entity.
  final List<Attribute> attributes;

  Entity({
    this.id,
    this.beginOffset,
    this.endOffset,
    this.score,
    this.text,
    this.category,
    this.type,
    this.traits,
    this.attributes,
  });
  static Entity fromJson(Map<String, dynamic> json) => Entity();
}

class Trait {
  ///  Provides a name or contextual description about the trait.
  final String name;

  ///  The level of confidence that Comprehend Medical has in the accuracy of
  /// this trait.
  final double score;

  Trait({
    this.name,
    this.score,
  });
  static Trait fromJson(Map<String, dynamic> json) => Trait();
}

class UnmappedAttribute {
  ///  The type of the attribute, could be one of the following values:
  /// "MEDICATION", "MEDICAL\_CONDITION", "ANATOMY",
  /// "TEST\_AND\_TREATMENT\_PROCEDURE" or "PERSONAL\_HEALTH\_INFORMATION".
  final String type;

  ///  The specific attribute that has been extracted but not mapped to an
  /// entity.
  final Attribute attribute;

  UnmappedAttribute({
    this.type,
    this.attribute,
  });
  static UnmappedAttribute fromJson(Map<String, dynamic> json) =>
      UnmappedAttribute();
}
