import 'package:meta/meta.dart';

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
  Future<void> deleteLexicon(String name) async {}

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
  Future<void> describeVoices(
      {String engine,
      String languageCode,
      bool includeAdditionalLanguageCodes,
      String nextToken}) async {}

  /// Returns the content of the specified pronunciation lexicon stored in an
  /// AWS Region. For more information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  Future<void> getLexicon(String name) async {}

  /// Retrieves a specific SpeechSynthesisTask object based on its TaskID. This
  /// object contains information about the given speech synthesis task,
  /// including the status of the task, and a link to the S3 bucket containing
  /// the output of the task.
  Future<void> getSpeechSynthesisTask(String taskId) async {}

  /// Returns a list of pronunciation lexicons stored in an AWS Region. For more
  /// information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  Future<void> listLexicons({String nextToken}) async {}

  /// Returns a list of SpeechSynthesisTask objects ordered by their creation
  /// date. This operation can filter the tasks by their status, for example,
  /// allowing users to list only tasks that are completed.
  Future<void> listSpeechSynthesisTasks(
      {int maxResults, String nextToken, String status}) async {}

  /// Stores a pronunciation lexicon in an AWS Region. If a lexicon with the
  /// same name already exists in the region, it is overwritten by the new
  /// lexicon. Lexicon operations have eventual consistency, therefore, it might
  /// take some time before the lexicon is available to the SynthesizeSpeech
  /// operation.
  ///
  /// For more information, see [Managing
  /// Lexicons](https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html).
  Future<void> putLexicon(
      {@required String name, @required String content}) async {}

  /// Allows the creation of an asynchronous synthesis task, by starting a new
  /// `SpeechSynthesisTask`. This operation requires all the standard
  /// information needed for speech synthesis, plus the name of an Amazon S3
  /// bucket for the service to store the output of the synthesis task and two
  /// optional parameters (OutputS3KeyPrefix and SnsTopicArn). Once the
  /// synthesis task is created, this operation will return a
  /// SpeechSynthesisTask object, which will include an identifier of this task
  /// as well as the current status.
  Future<void> startSpeechSynthesisTask(
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
      @required String voiceId}) async {}

  /// Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML
  /// input must be valid, well-formed SSML. Some alphabets might not be
  /// available with all the voices (for example, Cyrillic might not be read at
  /// all by English voices) unless phoneme mapping is used. For more
  /// information, see [How it
  /// Works](https://docs.aws.amazon.com/polly/latest/dg/how-text-to-speech-works.html).
  Future<void> synthesizeSpeech(
      {String engine,
      String languageCode,
      List<String> lexiconNames,
      @required String outputFormat,
      String sampleRate,
      List<String> speechMarkTypes,
      @required String text,
      String textType,
      @required String voiceId}) async {}
}

class DeleteLexiconOutput {}

class DescribeVoicesOutput {}

class GetLexiconOutput {}

class GetSpeechSynthesisTaskOutput {}

class Lexicon {}

class LexiconAttributes {}

class LexiconDescription {}

class ListLexiconsOutput {}

class ListSpeechSynthesisTasksOutput {}

class PutLexiconOutput {}

class StartSpeechSynthesisTaskOutput {}

class SynthesisTask {}

class SynthesizeSpeechOutput {}

class Voice {}
