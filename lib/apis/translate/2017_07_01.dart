import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Provides translation between one source language and another of the same set
/// of languages.
class TranslateApi {
  final _client;
  TranslateApi(client)
      : _client = client.configured('Translate', serializer: 'json');

  /// A synchronous action that deletes a custom terminology.
  ///
  /// [name]: The name of the custom terminology being deleted.
  Future<void> deleteTerminology(String name) async {
    await _client.send('DeleteTerminology', {
      'Name': name,
    });
  }

  /// Retrieves a custom terminology.
  ///
  /// [name]: The name of the custom terminology being retrieved.
  ///
  /// [terminologyDataFormat]: The data format of the custom terminology being
  /// retrieved, either CSV or TMX.
  Future<GetTerminologyResponse> getTerminology(
      {@required String name, @required String terminologyDataFormat}) async {
    var response_ = await _client.send('GetTerminology', {
      'Name': name,
      'TerminologyDataFormat': terminologyDataFormat,
    });
    return GetTerminologyResponse.fromJson(response_);
  }

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
  ///
  /// [name]: The name of the custom terminology being imported.
  ///
  /// [mergeStrategy]: The merge strategy of the custom terminology being
  /// imported. Currently, only the OVERWRITE merge strategy is supported. In
  /// this case, the imported terminology will overwrite an existing terminology
  /// of the same name.
  ///
  /// [description]: The description of the custom terminology being imported.
  ///
  /// [terminologyData]: The terminology data for the custom terminology being
  /// imported.
  ///
  /// [encryptionKey]: The encryption key for the custom terminology being
  /// imported.
  Future<ImportTerminologyResponse> importTerminology(
      {@required String name,
      @required String mergeStrategy,
      String description,
      @required TerminologyData terminologyData,
      EncryptionKey encryptionKey}) async {
    var response_ = await _client.send('ImportTerminology', {
      'Name': name,
      'MergeStrategy': mergeStrategy,
      if (description != null) 'Description': description,
      'TerminologyData': terminologyData,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
    });
    return ImportTerminologyResponse.fromJson(response_);
  }

  /// Provides a list of custom terminologies associated with your account.
  ///
  /// [nextToken]: If the result of the request to ListTerminologies was
  /// truncated, include the NextToken to fetch the next group of custom
  /// terminologies.
  ///
  /// [maxResults]: The maximum number of custom terminologies returned per list
  /// request.
  Future<ListTerminologiesResponse> listTerminologies(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTerminologies', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTerminologiesResponse.fromJson(response_);
  }

  /// Translates input text from the source language to the target language. It
  /// is not necessary to use English (en) as either the source or the target
  /// language but not all language combinations are supported by Amazon
  /// Translate. For more information, see
  /// [Supported Language Pairs](http://docs.aws.amazon.com/translate/latest/dg/pairs.html).
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
  ///
  /// [text]: The text to translate. The text string can be a maximum of 5,000
  /// bytes long. Depending on your character set, this may be fewer than 5,000
  /// characters.
  ///
  /// [terminologyNames]: The TerminologyNames list that is taken as input to
  /// the TranslateText request. This has a minimum length of 0 and a maximum
  /// length of 1.
  ///
  /// [sourceLanguageCode]: The language code for the language of the source
  /// text. The language must be a language supported by Amazon Translate.
  ///
  /// To have Amazon Translate determine the source language of your text, you
  /// can specify `auto` in the `SourceLanguageCode` field. If you specify
  /// `auto`, Amazon Translate will call Amazon Comprehend to determine the
  /// source language.
  ///
  /// [targetLanguageCode]: The language code requested for the language of the
  /// target text. The language must be a language supported by Amazon
  /// Translate.
  Future<TranslateTextResponse> translateText(
      {@required String text,
      List<String> terminologyNames,
      @required String sourceLanguageCode,
      @required String targetLanguageCode}) async {
    var response_ = await _client.send('TranslateText', {
      'Text': text,
      if (terminologyNames != null) 'TerminologyNames': terminologyNames,
      'SourceLanguageCode': sourceLanguageCode,
      'TargetLanguageCode': targetLanguageCode,
    });
    return TranslateTextResponse.fromJson(response_);
  }
}

/// The custom terminology applied to the input text by Amazon Translate for the
/// translated text response. This is optional in the response and will only be
/// present if you specified terminology input in the request. Currently, only
/// one terminology can be applied per TranslateText request.
class AppliedTerminology {
  /// The name of the custom terminology applied to the input text by Amazon
  /// Translate for the translated text response.
  final String name;

  /// The specific terms of the custom terminology applied to the input text by
  /// Amazon Translate for the translated text response. A maximum of 250 terms
  /// will be returned, and the specific terms applied will be the first 250
  /// terms in the source text.
  final List<Term> terms;

  AppliedTerminology({
    this.name,
    this.terms,
  });
  static AppliedTerminology fromJson(Map<String, dynamic> json) =>
      AppliedTerminology(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        terms: json.containsKey('Terms')
            ? (json['Terms'] as List).map((e) => Term.fromJson(e)).toList()
            : null,
      );
}

/// The encryption key used to encrypt the custom terminologies used by Amazon
/// Translate.
class EncryptionKey {
  /// The type of encryption key used by Amazon Translate to encrypt custom
  /// terminologies.
  final String type;

  /// The Amazon Resource Name (ARN) of the encryption key being used to encrypt
  /// the custom terminology.
  final String id;

  EncryptionKey({
    @required this.type,
    @required this.id,
  });
  static EncryptionKey fromJson(Map<String, dynamic> json) => EncryptionKey(
        type: json['Type'] as String,
        id: json['Id'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetTerminologyResponse {
  /// The properties of the custom terminology being retrieved.
  final TerminologyProperties terminologyProperties;

  /// The data location of the custom terminology being retrieved. The custom
  /// terminology file is returned in a presigned url that has a 30 minute
  /// expiration.
  final TerminologyDataLocation terminologyDataLocation;

  GetTerminologyResponse({
    this.terminologyProperties,
    this.terminologyDataLocation,
  });
  static GetTerminologyResponse fromJson(Map<String, dynamic> json) =>
      GetTerminologyResponse(
        terminologyProperties: json.containsKey('TerminologyProperties')
            ? TerminologyProperties.fromJson(json['TerminologyProperties'])
            : null,
        terminologyDataLocation: json.containsKey('TerminologyDataLocation')
            ? TerminologyDataLocation.fromJson(json['TerminologyDataLocation'])
            : null,
      );
}

class ImportTerminologyResponse {
  /// The properties of the custom terminology being imported.
  final TerminologyProperties terminologyProperties;

  ImportTerminologyResponse({
    this.terminologyProperties,
  });
  static ImportTerminologyResponse fromJson(Map<String, dynamic> json) =>
      ImportTerminologyResponse(
        terminologyProperties: json.containsKey('TerminologyProperties')
            ? TerminologyProperties.fromJson(json['TerminologyProperties'])
            : null,
      );
}

class ListTerminologiesResponse {
  /// The properties list of the custom terminologies returned on the list
  /// request.
  final List<TerminologyProperties> terminologyPropertiesList;

  ///  If the response to the ListTerminologies was truncated, the NextToken
  /// fetches the next group of custom terminologies.
  final String nextToken;

  ListTerminologiesResponse({
    this.terminologyPropertiesList,
    this.nextToken,
  });
  static ListTerminologiesResponse fromJson(Map<String, dynamic> json) =>
      ListTerminologiesResponse(
        terminologyPropertiesList: json.containsKey('TerminologyPropertiesList')
            ? (json['TerminologyPropertiesList'] as List)
                .map((e) => TerminologyProperties.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The term being translated by the custom terminology.
class Term {
  /// The source text of the term being translated by the custom terminology.
  final String sourceText;

  /// The target text of the term being translated by the custom terminology.
  final String targetText;

  Term({
    this.sourceText,
    this.targetText,
  });
  static Term fromJson(Map<String, dynamic> json) => Term(
        sourceText: json.containsKey('SourceText')
            ? json['SourceText'] as String
            : null,
        targetText: json.containsKey('TargetText')
            ? json['TargetText'] as String
            : null,
      );
}

/// The data associated with the custom terminology.
class TerminologyData {
  /// The file containing the custom terminology data.
  final Uint8List file;

  /// The data format of the custom terminology. Either CSV or TMX.
  final String format;

  TerminologyData({
    @required this.file,
    @required this.format,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The location of the custom terminology data.
class TerminologyDataLocation {
  /// The repository type for the custom terminology data.
  final String repositoryType;

  /// The location of the custom terminology data.
  final String location;

  TerminologyDataLocation({
    @required this.repositoryType,
    @required this.location,
  });
  static TerminologyDataLocation fromJson(Map<String, dynamic> json) =>
      TerminologyDataLocation(
        repositoryType: json['RepositoryType'] as String,
        location: json['Location'] as String,
      );
}

/// The properties of the custom terminology.
class TerminologyProperties {
  /// The name of the custom terminology.
  final String name;

  /// The description of the custom terminology properties.
  final String description;

  ///  The Amazon Resource Name (ARN) of the custom terminology.
  final String arn;

  /// The language code for the source text of the translation request for which
  /// the custom terminology is being used.
  final String sourceLanguageCode;

  /// The language codes for the target languages available with the custom
  /// terminology file. All possible target languages are returned in array.
  final List<String> targetLanguageCodes;

  /// The encryption key for the custom terminology.
  final EncryptionKey encryptionKey;

  /// The size of the file used when importing a custom terminology.
  final int sizeBytes;

  /// The number of terms included in the custom terminology.
  final int termCount;

  /// The time at which the custom terminology was created, based on the
  /// timestamp.
  final DateTime createdAt;

  /// The time at which the custom terminology was last update, based on the
  /// timestamp.
  final DateTime lastUpdatedAt;

  TerminologyProperties({
    this.name,
    this.description,
    this.arn,
    this.sourceLanguageCode,
    this.targetLanguageCodes,
    this.encryptionKey,
    this.sizeBytes,
    this.termCount,
    this.createdAt,
    this.lastUpdatedAt,
  });
  static TerminologyProperties fromJson(Map<String, dynamic> json) =>
      TerminologyProperties(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        sourceLanguageCode: json.containsKey('SourceLanguageCode')
            ? json['SourceLanguageCode'] as String
            : null,
        targetLanguageCodes: json.containsKey('TargetLanguageCodes')
            ? (json['TargetLanguageCodes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        encryptionKey: json.containsKey('EncryptionKey')
            ? EncryptionKey.fromJson(json['EncryptionKey'])
            : null,
        sizeBytes:
            json.containsKey('SizeBytes') ? json['SizeBytes'] as int : null,
        termCount:
            json.containsKey('TermCount') ? json['TermCount'] as int : null,
        createdAt: json.containsKey('CreatedAt')
            ? DateTime.parse(json['CreatedAt'])
            : null,
        lastUpdatedAt: json.containsKey('LastUpdatedAt')
            ? DateTime.parse(json['LastUpdatedAt'])
            : null,
      );
}

class TranslateTextResponse {
  /// The the translated text. The maximum length of this text is 5kb.
  final String translatedText;

  /// The language code for the language of the source text.
  final String sourceLanguageCode;

  /// The language code for the language of the target text.
  final String targetLanguageCode;

  /// The names of the custom terminologies applied to the input text by Amazon
  /// Translate for the translated text response.
  final List<AppliedTerminology> appliedTerminologies;

  TranslateTextResponse({
    @required this.translatedText,
    @required this.sourceLanguageCode,
    @required this.targetLanguageCode,
    this.appliedTerminologies,
  });
  static TranslateTextResponse fromJson(Map<String, dynamic> json) =>
      TranslateTextResponse(
        translatedText: json['TranslatedText'] as String,
        sourceLanguageCode: json['SourceLanguageCode'] as String,
        targetLanguageCode: json['TargetLanguageCode'] as String,
        appliedTerminologies: json.containsKey('AppliedTerminologies')
            ? (json['AppliedTerminologies'] as List)
                .map((e) => AppliedTerminology.fromJson(e))
                .toList()
            : null,
      );
}
