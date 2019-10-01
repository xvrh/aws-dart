import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Polly is a web service that makes it easy to synthesize speech from
/// text.
///
/// The Amazon Polly service provides API operations for synthesizing
/// high-quality speech from plain text and Speech Synthesis Markup Language
/// (SSML), along with managing pronunciations lexicons that enable you to get
/// the best results for your application domain.
class PollyApi {
  /// Deletes the specified pronunciation lexicon stored in an AWS Region. A
  /// lexicon which has been deleted is not available for speech synthesis, nor
  /// is it possible to retrieve it using either the `GetLexicon` or
  /// `ListLexicon` APIs.
  ///
  /// For more information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  ///
  /// [name]: The name of the lexicon to delete. Must be an existing lexicon in
  /// the region.
  Future<DeleteLexiconOutput> deleteLexicon(String name) async {
    return DeleteLexiconOutput.fromJson({});
  }

  /// Returns the list of voices that are available for use when requesting
  /// speech synthesis. Each voice speaks a specified language, is either male
  /// or female, and is identified by an ID, which is the ASCII version of the
  /// voice name.
  ///
  /// When synthesizing speech ( `SynthesizeSpeech` ), you provide the voice ID
  /// for the voice you want from the list of voices returned by
  /// `DescribeVoices`.
  ///
  /// For example, you want your news reader application to read news in a
  /// specific language, but giving a user the option to choose the voice. Using
  /// the `DescribeVoices` operation you can provide the user with a list of
  /// available voices to select from.
  ///
  ///  You can optionally specify a language code to filter the available
  /// voices. For example, if you specify `en-US`, the operation returns a list
  /// of all available US English voices.
  ///
  /// This operation requires permissions to perform the `polly:DescribeVoices`
  /// action.
  ///
  /// [engine]: Specifies the engine (`standard` or `neural`) used by Amazon
  /// Polly when processing input text for speech synthesis.
  ///
  /// [languageCode]:  The language identification tag (ISO 639 code for the
  /// language name-ISO 3166 country code) for filtering the list of voices
  /// returned. If you don't specify this optional parameter, all available
  /// voices are returned.
  ///
  /// [includeAdditionalLanguageCodes]: Boolean value indicating whether to
  /// return any bilingual voices that use the specified language as an
  /// additional language. For instance, if you request all languages that use
  /// US English (es-US), and there is an Italian voice that speaks both Italian
  /// (it-IT) and US English, that voice will be included if you specify `yes`
  /// but not if you specify `no`.
  ///
  /// [nextToken]: An opaque pagination token returned from the previous
  /// `DescribeVoices` operation. If present, this indicates where to continue
  /// the listing.
  Future<DescribeVoicesOutput> describeVoices(
      {String engine,
      String languageCode,
      bool includeAdditionalLanguageCodes,
      String nextToken}) async {
    return DescribeVoicesOutput.fromJson({});
  }

  /// Returns the content of the specified pronunciation lexicon stored in an
  /// AWS Region. For more information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  ///
  /// [name]: Name of the lexicon.
  Future<GetLexiconOutput> getLexicon(String name) async {
    return GetLexiconOutput.fromJson({});
  }

  /// Retrieves a specific SpeechSynthesisTask object based on its TaskID. This
  /// object contains information about the given speech synthesis task,
  /// including the status of the task, and a link to the S3 bucket containing
  /// the output of the task.
  ///
  /// [taskId]: The Amazon Polly generated identifier for a speech synthesis
  /// task.
  Future<GetSpeechSynthesisTaskOutput> getSpeechSynthesisTask(
      String taskId) async {
    return GetSpeechSynthesisTaskOutput.fromJson({});
  }

  /// Returns a list of pronunciation lexicons stored in an AWS Region. For more
  /// information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  ///
  /// [nextToken]: An opaque pagination token returned from previous
  /// `ListLexicons` operation. If present, indicates where to continue the list
  /// of lexicons.
  Future<ListLexiconsOutput> listLexicons({String nextToken}) async {
    return ListLexiconsOutput.fromJson({});
  }

  /// Returns a list of SpeechSynthesisTask objects ordered by their creation
  /// date. This operation can filter the tasks by their status, for example,
  /// allowing users to list only tasks that are completed.
  ///
  /// [maxResults]: Maximum number of speech synthesis tasks returned in a List
  /// operation.
  ///
  /// [nextToken]: The pagination token to use in the next request to continue
  /// the listing of speech synthesis tasks.
  ///
  /// [status]: Status of the speech synthesis tasks returned in a List
  /// operation
  Future<ListSpeechSynthesisTasksOutput> listSpeechSynthesisTasks(
      {int maxResults, String nextToken, String status}) async {
    return ListSpeechSynthesisTasksOutput.fromJson({});
  }

  /// Stores a pronunciation lexicon in an AWS Region. If a lexicon with the
  /// same name already exists in the region, it is overwritten by the new
  /// lexicon. Lexicon operations have eventual consistency, therefore, it might
  /// take some time before the lexicon is available to the SynthesizeSpeech
  /// operation.
  ///
  /// For more information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  ///
  /// [name]: Name of the lexicon. The name must follow the regular express
  /// format \[0-9A-Za-z\]{1,20}. That is, the name is a case-sensitive
  /// alphanumeric string up to 20 characters long.
  ///
  /// [content]: Content of the PLS lexicon as string data.
  Future<PutLexiconOutput> putLexicon(
      {@required String name, @required String content}) async {
    return PutLexiconOutput.fromJson({});
  }

  /// Allows the creation of an asynchronous synthesis task, by starting a new
  /// `SpeechSynthesisTask`. This operation requires all the standard
  /// information needed for speech synthesis, plus the name of an Amazon S3
  /// bucket for the service to store the output of the synthesis task and two
  /// optional parameters (OutputS3KeyPrefix and SnsTopicArn). Once the
  /// synthesis task is created, this operation will return a
  /// SpeechSynthesisTask object, which will include an identifier of this task
  /// as well as the current status.
  ///
  /// [engine]: Specifies the engine (`standard` or `neural`) for Amazon Polly
  /// to use when processing input text for speech synthesis. Using a voice that
  /// is not supported for the engine selected will result in an error.
  ///
  /// [languageCode]: Optional language code for the Speech Synthesis request.
  /// This is only necessary if using a bilingual voice, such as Aditi, which
  /// can be used for either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly will use the default language of the bilingual voice. The default
  /// language for any voice is the one returned by the
  /// [DescribeVoices](https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html)
  /// operation for the `LanguageCode` parameter. For example, if no language
  /// code is specified, Aditi will use Indian English rather than Hindi.
  ///
  /// [lexiconNames]: List of one or more pronunciation lexicon names you want
  /// the service to apply during synthesis. Lexicons are applied only if the
  /// language of the lexicon is the same as the language of the voice.
  ///
  /// [outputFormat]: The format in which the returned output will be encoded.
  /// For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks,
  /// this will be json.
  ///
  /// [outputS3BucketName]: Amazon S3 bucket name to which the output file will
  /// be saved.
  ///
  /// [outputS3KeyPrefix]: The Amazon S3 key prefix for the output speech file.
  ///
  /// [sampleRate]: The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default
  /// value for neural voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  ///
  /// [snsTopicArn]: ARN for the SNS topic optionally used for providing status
  /// notification for a speech synthesis task.
  ///
  /// [speechMarkTypes]: The type of speech marks returned for the input text.
  ///
  /// [text]: The input text to synthesize. If you specify ssml as the TextType,
  /// follow the SSML format for the input text.
  ///
  /// [textType]: Specifies whether the input text is plain text or SSML. The
  /// default value is plain text.
  ///
  /// [voiceId]: Voice ID to use for the synthesis.
  Future<StartSpeechSynthesisTaskOutput> startSpeechSynthesisTask(
      {String engine,
      String languageCode,
      List<String> lexiconNames,
      @required String outputFormat,
      @required String outputS3BucketName,
      String outputS3KeyPrefix,
      String sampleRate,
      String snsTopicArn,
      List<String> speechMarkTypes,
      @required String text,
      String textType,
      @required String voiceId}) async {
    return StartSpeechSynthesisTaskOutput.fromJson({});
  }

  /// Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML
  /// input must be valid, well-formed SSML. Some alphabets might not be
  /// available with all the voices (for example, Cyrillic might not be read at
  /// all by English voices) unless phoneme mapping is used. For more
  /// information, see [How it
  /// Works](https://docs.aws.amazon.com/polly/latest/dg/how-text-to-speech-works.html).
  ///
  /// [engine]: Specifies the engine (`standard` or `neural`) for Amazon Polly
  /// to use when processing input text for speech synthesis. Using a voice that
  /// is not supported for the engine selected will result in an error.
  ///
  /// [languageCode]: Optional language code for the Synthesize Speech request.
  /// This is only necessary if using a bilingual voice, such as Aditi, which
  /// can be used for either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly will use the default language of the bilingual voice. The default
  /// language for any voice is the one returned by the
  /// [DescribeVoices](https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html)
  /// operation for the `LanguageCode` parameter. For example, if no language
  /// code is specified, Aditi will use Indian English rather than Hindi.
  ///
  /// [lexiconNames]: List of one or more pronunciation lexicon names you want
  /// the service to apply during synthesis. Lexicons are applied only if the
  /// language of the lexicon is the same as the language of the voice. For
  /// information about storing lexicons, see
  /// [PutLexicon](https://docs.aws.amazon.com/polly/latest/dg/API_PutLexicon.html).
  ///
  /// [outputFormat]:  The format in which the returned output will be encoded.
  /// For audio stream, this will be mp3, ogg_vorbis, or pcm. For speech marks,
  /// this will be json.
  ///
  /// When pcm is used, the content returned is audio/pcm in a signed 16-bit, 1
  /// channel (mono), little-endian format.
  ///
  /// [sampleRate]: The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default
  /// value for neural voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  ///
  /// [speechMarkTypes]: The type of speech marks returned for the input text.
  ///
  /// [text]:  Input text to synthesize. If you specify `ssml` as the
  /// `TextType`, follow the SSML format for the input text.
  ///
  /// [textType]:  Specifies whether the input text is plain text or SSML. The
  /// default value is plain text. For more information, see [Using
  /// SSML](https://docs.aws.amazon.com/polly/latest/dg/ssml.html).
  ///
  /// [voiceId]:  Voice ID to use for the synthesis. You can get a list of
  /// available voice IDs by calling the
  /// [DescribeVoices](https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html)
  /// operation.
  Future<SynthesizeSpeechOutput> synthesizeSpeech(
      {String engine,
      String languageCode,
      List<String> lexiconNames,
      @required String outputFormat,
      String sampleRate,
      List<String> speechMarkTypes,
      @required String text,
      String textType,
      @required String voiceId}) async {
    return SynthesizeSpeechOutput.fromJson({});
  }
}

class DeleteLexiconOutput {
  DeleteLexiconOutput();
  static DeleteLexiconOutput fromJson(Map<String, dynamic> json) =>
      DeleteLexiconOutput();
}

class DescribeVoicesOutput {
  /// A list of voices with their properties.
  final List<Voice> voices;

  /// The pagination token to use in the next request to continue the listing of
  /// voices. `NextToken` is returned only if the response is truncated.
  final String nextToken;

  DescribeVoicesOutput({
    this.voices,
    this.nextToken,
  });
  static DescribeVoicesOutput fromJson(Map<String, dynamic> json) =>
      DescribeVoicesOutput();
}

class GetLexiconOutput {
  /// Lexicon object that provides name and the string content of the lexicon.
  final Lexicon lexicon;

  /// Metadata of the lexicon, including phonetic alphabetic used, language
  /// code, lexicon ARN, number of lexemes defined in the lexicon, and size of
  /// lexicon in bytes.
  final LexiconAttributes lexiconAttributes;

  GetLexiconOutput({
    this.lexicon,
    this.lexiconAttributes,
  });
  static GetLexiconOutput fromJson(Map<String, dynamic> json) =>
      GetLexiconOutput();
}

class GetSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information from the requested task,
  /// including output format, creation time, task status, and so on.
  final SynthesisTask synthesisTask;

  GetSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });
  static GetSpeechSynthesisTaskOutput fromJson(Map<String, dynamic> json) =>
      GetSpeechSynthesisTaskOutput();
}

class Lexicon {
  /// Lexicon content in string format. The content of a lexicon must be in PLS
  /// format.
  final String content;

  /// Name of the lexicon.
  final String name;

  Lexicon({
    this.content,
    this.name,
  });
  static Lexicon fromJson(Map<String, dynamic> json) => Lexicon();
}

class LexiconAttributes {
  /// Phonetic alphabet used in the lexicon. Valid values are `ipa` and
  /// `x-sampa`.
  final String alphabet;

  /// Language code that the lexicon applies to. A lexicon with a language code
  /// such as "en" would be applied to all English languages (en-GB, en-US,
  /// en-AUS, en-WLS, and so on.
  final String languageCode;

  /// Date lexicon was last modified (a timestamp value).
  final DateTime lastModified;

  /// Amazon Resource Name (ARN) of the lexicon.
  final String lexiconArn;

  /// Number of lexemes in the lexicon.
  final int lexemesCount;

  /// Total size of the lexicon, in characters.
  final int size;

  LexiconAttributes({
    this.alphabet,
    this.languageCode,
    this.lastModified,
    this.lexiconArn,
    this.lexemesCount,
    this.size,
  });
  static LexiconAttributes fromJson(Map<String, dynamic> json) =>
      LexiconAttributes();
}

class LexiconDescription {
  /// Name of the lexicon.
  final String name;

  /// Provides lexicon metadata.
  final LexiconAttributes attributes;

  LexiconDescription({
    this.name,
    this.attributes,
  });
  static LexiconDescription fromJson(Map<String, dynamic> json) =>
      LexiconDescription();
}

class ListLexiconsOutput {
  /// A list of lexicon names and attributes.
  final List<LexiconDescription> lexicons;

  /// The pagination token to use in the next request to continue the listing of
  /// lexicons. `NextToken` is returned only if the response is truncated.
  final String nextToken;

  ListLexiconsOutput({
    this.lexicons,
    this.nextToken,
  });
  static ListLexiconsOutput fromJson(Map<String, dynamic> json) =>
      ListLexiconsOutput();
}

class ListSpeechSynthesisTasksOutput {
  /// An opaque pagination token returned from the previous List operation in
  /// this request. If present, this indicates where to continue the listing.
  final String nextToken;

  /// List of SynthesisTask objects that provides information from the specified
  /// task in the list request, including output format, creation time, task
  /// status, and so on.
  final List<SynthesisTask> synthesisTasks;

  ListSpeechSynthesisTasksOutput({
    this.nextToken,
    this.synthesisTasks,
  });
  static ListSpeechSynthesisTasksOutput fromJson(Map<String, dynamic> json) =>
      ListSpeechSynthesisTasksOutput();
}

class PutLexiconOutput {
  PutLexiconOutput();
  static PutLexiconOutput fromJson(Map<String, dynamic> json) =>
      PutLexiconOutput();
}

class StartSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information and attributes about a
  /// newly submitted speech synthesis task.
  final SynthesisTask synthesisTask;

  StartSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });
  static StartSpeechSynthesisTaskOutput fromJson(Map<String, dynamic> json) =>
      StartSpeechSynthesisTaskOutput();
}

class SynthesisTask {
  /// Specifies the engine (`standard` or `neural`) for Amazon Polly to use when
  /// processing input text for speech synthesis. Using a voice that is not
  /// supported for the engine selected will result in an error.
  final String engine;

  /// The Amazon Polly generated identifier for a speech synthesis task.
  final String taskId;

  /// Current status of the individual speech synthesis task.
  final String taskStatus;

  /// Reason for the current status of a specific speech synthesis task,
  /// including errors if the task has failed.
  final String taskStatusReason;

  /// Pathway for the output speech file.
  final String outputUri;

  /// Timestamp for the time the synthesis task was started.
  final DateTime creationTime;

  /// Number of billable characters synthesized.
  final int requestCharacters;

  /// ARN for the SNS topic optionally used for providing status notification
  /// for a speech synthesis task.
  final String snsTopicArn;

  /// List of one or more pronunciation lexicon names you want the service to
  /// apply during synthesis. Lexicons are applied only if the language of the
  /// lexicon is the same as the language of the voice.
  final List<String> lexiconNames;

  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json.
  final String outputFormat;

  /// The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default
  /// value for neural voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  final String sampleRate;

  /// The type of speech marks returned for the input text.
  final List<String> speechMarkTypes;

  /// Specifies whether the input text is plain text or SSML. The default value
  /// is plain text.
  final String textType;

  /// Voice ID to use for the synthesis.
  final String voiceId;

  /// Optional language code for a synthesis task. This is only necessary if
  /// using a bilingual voice, such as Aditi, which can be used for either
  /// Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly will use the default language of the bilingual voice. The default
  /// language for any voice is the one returned by the
  /// [DescribeVoices](https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html)
  /// operation for the `LanguageCode` parameter. For example, if no language
  /// code is specified, Aditi will use Indian English rather than Hindi.
  final String languageCode;

  SynthesisTask({
    this.engine,
    this.taskId,
    this.taskStatus,
    this.taskStatusReason,
    this.outputUri,
    this.creationTime,
    this.requestCharacters,
    this.snsTopicArn,
    this.lexiconNames,
    this.outputFormat,
    this.sampleRate,
    this.speechMarkTypes,
    this.textType,
    this.voiceId,
    this.languageCode,
  });
  static SynthesisTask fromJson(Map<String, dynamic> json) => SynthesisTask();
}

class SynthesizeSpeechOutput {
  ///  Stream containing the synthesized speech.
  final Uint8List audioStream;

  ///  Specifies the type audio stream. This should reflect the `OutputFormat`
  /// parameter in your request.
  ///
  /// *    If you request `mp3` as the `OutputFormat`, the `ContentType`
  /// returned is audio/mpeg.
  ///
  /// *    If you request `ogg_vorbis` as the `OutputFormat`, the `ContentType`
  /// returned is audio/ogg.
  ///
  /// *    If you request `pcm` as the `OutputFormat`, the `ContentType`
  /// returned is audio/pcm in a signed 16-bit, 1 channel (mono), little-endian
  /// format.
  ///
  /// *   If you request `json` as the `OutputFormat`, the `ContentType`
  /// returned is audio/json.
  final String contentType;

  /// Number of characters synthesized.
  final int requestCharacters;

  SynthesizeSpeechOutput({
    this.audioStream,
    this.contentType,
    this.requestCharacters,
  });
  static SynthesizeSpeechOutput fromJson(Map<String, dynamic> json) =>
      SynthesizeSpeechOutput();
}

class Voice {
  /// Gender of the voice.
  final String gender;

  /// Amazon Polly assigned voice ID. This is the ID that you specify when
  /// calling the `SynthesizeSpeech` operation.
  final String id;

  /// Language code of the voice.
  final String languageCode;

  /// Human readable name of the language in English.
  final String languageName;

  /// Name of the voice (for example, Salli, Kendra, etc.). This provides a
  /// human readable voice name that you might display in your application.
  final String name;

  /// Additional codes for languages available for the specified voice in
  /// addition to its default language.
  ///
  /// For example, the default language for Aditi is Indian English (en-IN)
  /// because it was first used for that language. Since Aditi is bilingual and
  /// fluent in both Indian English and Hindi, this parameter would show the
  /// code `hi-IN`.
  final List<String> additionalLanguageCodes;

  /// Specifies which engines (`standard` or `neural`) that are supported by a
  /// given voice.
  final List<String> supportedEngines;

  Voice({
    this.gender,
    this.id,
    this.languageCode,
    this.languageName,
    this.name,
    this.additionalLanguageCodes,
    this.supportedEngines,
  });
  static Voice fromJson(Map<String, dynamic> json) => Voice();
}
