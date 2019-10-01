import 'package:meta/meta.dart';

///  Comprehend Medical extracts structured information from unstructured
/// clinical text. Use these actions to gain insight in your documents.
class ComprehendMedicalApi {
  ///  Inspects the clinical text for a variety of medical entities and returns
  /// specific information about them such as entity category, location, and
  /// confidence score on that information .
  Future<void> detectEntities(String text) async {}

  ///  Inspects the clinical text for personal health information (PHI) entities
  /// and entity category, location, and confidence score on that information.
  Future<void> detectPhi(String text) async {}
}

class Attribute {}

class DetectEntitiesResponse {}

class DetectPhiResponse {}

class Entity {}

class Trait {}

class UnmappedAttribute {}
