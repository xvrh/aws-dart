import 'package:meta/meta.dart';

/// Operations and objects for transcribing speech to text.
class TranscribeApi {
  /// Creates a new custom vocabulary that you can use to change the way Amazon
  /// Transcribe handles transcription of an audio file.
  Future<void> createVocabulary(
      {@required String vocabularyName,
      @required String languageCode,
      List<String> phrases,
      String vocabularyFileUri}) async {}

  /// Deletes a previously submitted transcription job along with any other
  /// generated results such as the transcription, models, and so on.
  Future<void> deleteTranscriptionJob(String transcriptionJobName) async {}

  /// Deletes a vocabulary from Amazon Transcribe.
  Future<void> deleteVocabulary(String vocabularyName) async {}

  /// Returns information about a transcription job. To see the status of the
  /// job, check the `TranscriptionJobStatus` field. If the status is
  /// `COMPLETED`, the job is finished and you can find the results at the
  /// location specified in the `TranscriptionFileUri` field.
  Future<void> getTranscriptionJob(String transcriptionJobName) async {}

  /// Gets information about a vocabulary.
  Future<void> getVocabulary(String vocabularyName) async {}

  /// Lists transcription jobs with the specified status.
  Future<void> listTranscriptionJobs(
      {String status,
      String jobNameContains,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of vocabularies that match the specified criteria. If no
  /// criteria are specified, returns the entire list of vocabularies.
  Future<void> listVocabularies(
      {String nextToken,
      int maxResults,
      String stateEquals,
      String nameContains}) async {}

  /// Starts an asynchronous job to transcribe speech to text.
  Future<void> startTranscriptionJob(
      {@required String transcriptionJobName,
      @required String languageCode,
      int mediaSampleRateHertz,
      String mediaFormat,
      @required Media media,
      String outputBucketName,
      Settings settings}) async {}

  /// Updates an existing vocabulary with new values. The `UpdateVocabulary`
  /// operation overwrites all of the existing information with the values that
  /// you provide in the request.
  Future<void> updateVocabulary(
      {@required String vocabularyName,
      @required String languageCode,
      List<String> phrases,
      String vocabularyFileUri}) async {}
}

class CreateVocabularyResponse {}

class GetTranscriptionJobResponse {}

class GetVocabularyResponse {}

class ListTranscriptionJobsResponse {}

class ListVocabulariesResponse {}

class Media {}

class Settings {}

class StartTranscriptionJobResponse {}

class Transcript {}

class TranscriptionJob {}

class TranscriptionJobSummary {}

class UpdateVocabularyResponse {}

class VocabularyInfo {}
