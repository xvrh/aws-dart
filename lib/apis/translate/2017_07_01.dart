import 'package:meta/meta.dart';

/// Provides translation between one source language and another of the same set
/// of languages.
class TranslateApi {
  /// A synchronous action that deletes a custom terminology.
  Future<void> deleteTerminology(String name) async {}

  /// Retrieves a custom terminology.
  Future<void> getTerminology(
      {@required String name, @required String terminologyDataFormat}) async {}

  /// Creates or updates a custom terminology, depending on whether or not one
  /// already exists for the given terminology name. Importing a terminology
  /// with the same name as an existing one will merge the terminologies based
  /// on the chosen merge strategy. Currently, the only supported merge strategy
  /// is OVERWRITE, and so the imported terminology will overwrite an existing
  /// terminology of the same name.
  ///
  /// If you import a terminology that overwrites an existing one, the new
  /// terminology take up to 10 minutes to fully propagate and be available for
  /// use in a translation due to cache policies with the DataPlane service that
  /// performs the translations.
  Future<void> importTerminology(
      {@required String name,
      @required String mergeStrategy,
      String description,
      @required TerminologyData terminologyData,
      EncryptionKey encryptionKey}) async {}

  /// Provides a list of custom terminologies associated with your account.
  Future<void> listTerminologies({String nextToken, int maxResults}) async {}

  /// Translates input text from the source language to the target language. It
  /// is not necessary to use English (en) as either the source or the target
  /// language but not all language combinations are supported by Amazon
  /// Translate. For more information, see [Supported Language
  /// Pairs](http://docs.aws.amazon.com/translate/latest/dg/pairs.html).
  ///
  /// *   Arabic (ar)
  ///
  /// *   Chinese (Simplified) (zh)
  ///
  /// *   Chinese (Traditional) (zh-TW)
  ///
  /// *   Czech (cs)
  ///
  /// *   Danish (da)
  ///
  /// *   Dutch (nl)
  ///
  /// *   English (en)
  ///
  /// *   Finnish (fi)
  ///
  /// *   French (fr)
  ///
  /// *   German (de)
  ///
  /// *   Hebrew (he)
  ///
  /// *   Indonesian (id)
  ///
  /// *   Italian (it)
  ///
  /// *   Japanese (ja)
  ///
  /// *   Korean (ko)
  ///
  /// *   Polish (pl)
  ///
  /// *   Portuguese (pt)
  ///
  /// *   Russian (ru)
  ///
  /// *   Spanish (es)
  ///
  /// *   Swedish (sv)
  ///
  /// *   Turkish (tr)
  ///
  ///
  /// To have Amazon Translate determine the source language of your text, you
  /// can specify `auto` in the `SourceLanguageCode` field. If you specify
  /// `auto`, Amazon Translate will call Amazon Comprehend to determine the
  /// source language.
  Future<void> translateText(
      {@required String text,
      List<String> terminologyNames,
      @required String sourceLanguageCode,
      @required String targetLanguageCode}) async {}
}

class AppliedTerminology {}

class EncryptionKey {}

class GetTerminologyResponse {}

class ImportTerminologyResponse {}

class ListTerminologiesResponse {}

class Term {}

class TerminologyData {}

class TerminologyDataLocation {}

class TerminologyProperties {}

class TranslateTextResponse {}
