import 'package:meta/meta.dart';

/// Operations and objects for transcribing speech to text.
class TranscribeApi {
  final _client;
  TranscribeApi(client)
      : _client = client.configured('Transcribe', serializer: 'json');

  /// Creates a new custom vocabulary that you can use to change the way Amazon
  /// Transcribe handles transcription of an audio file.
  ///
  /// [vocabularyName]: The name of the vocabulary. The name must be unique
  /// within an AWS account. The name is case-sensitive.
  ///
  /// [languageCode]: The language code of the vocabulary entries.
  ///
  /// [phrases]: An array of strings that contains the vocabulary entries.
  ///
  /// [vocabularyFileUri]: The S3 location of the text file that contains the
  /// definition of the custom vocabulary. The URI must be in the same region as
  /// the API endpoint that you are calling. The general form is
  ///
  ///
  /// `https://s3-<aws-region>.amazonaws.com/<bucket-name>/<keyprefix>/<objectkey>`
  ///
  ///
  /// For example:
  ///
  ///  `https://s3-us-east-1.amazonaws.com/examplebucket/vocab.txt`
  ///
  /// For more information about S3 object names, see
  /// [Object Keys](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys)
  /// in the _Amazon S3 Developer Guide_.
  ///
  /// For more information about custom vocabularies, see
  /// [Custom Vocabularies](http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary).
  Future<CreateVocabularyResponse> createVocabulary(
      {@required String vocabularyName,
      @required String languageCode,
      List<String> phrases,
      String vocabularyFileUri}) async {
    var response_ = await _client.send('CreateVocabulary', {
      'VocabularyName': vocabularyName,
      'LanguageCode': languageCode,
      if (phrases != null) 'Phrases': phrases,
      if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
    });
    return CreateVocabularyResponse.fromJson(response_);
  }

  /// Deletes a previously submitted transcription job along with any other
  /// generated results such as the transcription, models, and so on.
  ///
  /// [transcriptionJobName]: The name of the transcription job to be deleted.
  Future<void> deleteTranscriptionJob(String transcriptionJobName) async {
    await _client.send('DeleteTranscriptionJob', {
      'TranscriptionJobName': transcriptionJobName,
    });
  }

  /// Deletes a vocabulary from Amazon Transcribe.
  ///
  /// [vocabularyName]: The name of the vocabulary to delete.
  Future<void> deleteVocabulary(String vocabularyName) async {
    await _client.send('DeleteVocabulary', {
      'VocabularyName': vocabularyName,
    });
  }

  /// Returns information about a transcription job. To see the status of the
  /// job, check the `TranscriptionJobStatus` field. If the status is
  /// `COMPLETED`, the job is finished and you can find the results at the
  /// location specified in the `TranscriptionFileUri` field.
  ///
  /// [transcriptionJobName]: The name of the job.
  Future<GetTranscriptionJobResponse> getTranscriptionJob(
      String transcriptionJobName) async {
    var response_ = await _client.send('GetTranscriptionJob', {
      'TranscriptionJobName': transcriptionJobName,
    });
    return GetTranscriptionJobResponse.fromJson(response_);
  }

  /// Gets information about a vocabulary.
  ///
  /// [vocabularyName]: The name of the vocabulary to return information about.
  /// The name is case-sensitive.
  Future<GetVocabularyResponse> getVocabulary(String vocabularyName) async {
    var response_ = await _client.send('GetVocabulary', {
      'VocabularyName': vocabularyName,
    });
    return GetVocabularyResponse.fromJson(response_);
  }

  /// Lists transcription jobs with the specified status.
  ///
  /// [status]: When specified, returns only transcription jobs with the
  /// specified status. Jobs are ordered by creation date, with the newest jobs
  /// returned first. If you don’t specify a status, Amazon Transcribe returns
  /// all transcription jobs ordered by creation date.
  ///
  /// [jobNameContains]: When specified, the jobs returned in the list are
  /// limited to jobs whose name contains the specified string.
  ///
  /// [nextToken]: If the result of the previous request to
  /// `ListTranscriptionJobs` was truncated, include the `NextToken` to fetch
  /// the next set of jobs.
  ///
  /// [maxResults]: The maximum number of jobs to return in the response. If
  /// there are fewer results in the list, this response contains only the
  /// actual results.
  Future<ListTranscriptionJobsResponse> listTranscriptionJobs(
      {String status,
      String jobNameContains,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListTranscriptionJobs', {
      if (status != null) 'Status': status,
      if (jobNameContains != null) 'JobNameContains': jobNameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTranscriptionJobsResponse.fromJson(response_);
  }

  /// Returns a list of vocabularies that match the specified criteria. If no
  /// criteria are specified, returns the entire list of vocabularies.
  ///
  /// [nextToken]: If the result of the previous request to `ListVocabularies`
  /// was truncated, include the `NextToken` to fetch the next set of jobs.
  ///
  /// [maxResults]: The maximum number of vocabularies to return in the
  /// response. If there are fewer results in the list, this response contains
  /// only the actual results.
  ///
  /// [stateEquals]: When specified, only returns vocabularies with the
  /// `VocabularyState` field equal to the specified state.
  ///
  /// [nameContains]: When specified, the vocabularies returned in the list are
  /// limited to vocabularies whose name contains the specified string. The
  /// search is case-insensitive, `ListVocabularies` will return both
  /// "vocabularyname" and "VocabularyName" in the response list.
  Future<ListVocabulariesResponse> listVocabularies(
      {String nextToken,
      int maxResults,
      String stateEquals,
      String nameContains}) async {
    var response_ = await _client.send('ListVocabularies', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (stateEquals != null) 'StateEquals': stateEquals,
      if (nameContains != null) 'NameContains': nameContains,
    });
    return ListVocabulariesResponse.fromJson(response_);
  }

  /// Starts an asynchronous job to transcribe speech to text.
  ///
  /// [transcriptionJobName]: The name of the job. Note that you can't use the
  /// strings "." or ".." by themselves as the job name. The name must also be
  /// unique within an AWS account.
  ///
  /// [languageCode]: The language code for the language used in the input media
  /// file.
  ///
  /// [mediaSampleRateHertz]: The sample rate of the audio track in the input
  /// media file in Hertz.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe determines
  /// the sample rate. If you specify the sample rate, it must match the sample
  /// rate detected by Amazon Transcribe. In most cases, you should leave the
  /// `MediaSampleRateHertz` field blank and let Amazon Transcribe determine the
  /// sample rate.
  ///
  /// [mediaFormat]: The format of the input media file.
  ///
  ///  If you do not specify the format of the media file, Amazon Transcribe
  /// determines the format. If the format is not recognized, Amazon Transcribe
  /// returns an `InternalFailureException` exception. If you specify the
  /// format, it must match the format detected by Amazon Transcribe, otherwise
  /// you get an `InternalFailureException` exception.
  ///
  /// [media]: An object that describes the input media for a transcription job.
  ///
  /// [outputBucketName]: The location where the transcription is stored.
  ///
  /// If you set the `OutputBucketName`, Amazon Transcribe puts the
  /// transcription in the specified S3 bucket. When you call the
  /// GetTranscriptionJob operation, the operation returns this location in the
  /// `TranscriptFileUri` field. The S3 bucket must have permissions that allow
  /// Amazon Transcribe to put files in the bucket. For more information, see
  /// [Permissions Required for IAM User Roles](https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user).
  ///
  /// Amazon Transcribe uses the default Amazon S3 key for server-side
  /// encryption of transcripts that are placed in your S3 bucket. You can't
  /// specify your own encryption key.
  ///
  /// If you don't set the `OutputBucketName`, Amazon Transcribe generates a
  /// pre-signed URL, a shareable URL that provides secure access to your
  /// transcription, and returns it in the `TranscriptFileUri` field. Use this
  /// URL to download the transcription.
  ///
  /// [settings]: A `Settings` object that provides optional settings for a
  /// transcription job.
  Future<StartTranscriptionJobResponse> startTranscriptionJob(
      {@required String transcriptionJobName,
      @required String languageCode,
      int mediaSampleRateHertz,
      String mediaFormat,
      @required Media media,
      String outputBucketName,
      Settings settings}) async {
    var response_ = await _client.send('StartTranscriptionJob', {
      'TranscriptionJobName': transcriptionJobName,
      'LanguageCode': languageCode,
      if (mediaSampleRateHertz != null)
        'MediaSampleRateHertz': mediaSampleRateHertz,
      if (mediaFormat != null) 'MediaFormat': mediaFormat,
      'Media': media,
      if (outputBucketName != null) 'OutputBucketName': outputBucketName,
      if (settings != null) 'Settings': settings,
    });
    return StartTranscriptionJobResponse.fromJson(response_);
  }

  /// Updates an existing vocabulary with new values. The `UpdateVocabulary`
  /// operation overwrites all of the existing information with the values that
  /// you provide in the request.
  ///
  /// [vocabularyName]: The name of the vocabulary to update. The name is
  /// case-sensitive.
  ///
  /// [languageCode]: The language code of the vocabulary entries.
  ///
  /// [phrases]: An array of strings containing the vocabulary entries.
  ///
  /// [vocabularyFileUri]: The S3 location of the text file that contains the
  /// definition of the custom vocabulary. The URI must be in the same region as
  /// the API endpoint that you are calling. The general form is
  ///
  ///
  /// `https://s3-<aws-region>.amazonaws.com/<bucket-name>/<keyprefix>/<objectkey>`
  ///
  ///
  /// For example:
  ///
  ///  `https://s3-us-east-1.amazonaws.com/examplebucket/vocab.txt`
  ///
  /// For more information about S3 object names, see
  /// [Object Keys](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys)
  /// in the _Amazon S3 Developer Guide_.
  ///
  /// For more information about custom vocabularies, see
  /// [Custom Vocabularies](http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary).
  Future<UpdateVocabularyResponse> updateVocabulary(
      {@required String vocabularyName,
      @required String languageCode,
      List<String> phrases,
      String vocabularyFileUri}) async {
    var response_ = await _client.send('UpdateVocabulary', {
      'VocabularyName': vocabularyName,
      'LanguageCode': languageCode,
      if (phrases != null) 'Phrases': phrases,
      if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
    });
    return UpdateVocabularyResponse.fromJson(response_);
  }
}

class CreateVocabularyResponse {
  /// The name of the vocabulary.
  final String vocabularyName;

  /// The language code of the vocabulary entries.
  final String languageCode;

  /// The processing state of the vocabulary. When the `VocabularyState` field
  /// contains `READY` the vocabulary is ready to be used in a
  /// `StartTranscriptionJob` request.
  final String vocabularyState;

  /// The date and time that the vocabulary was created.
  final DateTime lastModifiedTime;

  /// If the `VocabularyState` field is `FAILED`, this field contains
  /// information about why the job failed.
  final String failureReason;

  CreateVocabularyResponse({
    this.vocabularyName,
    this.languageCode,
    this.vocabularyState,
    this.lastModifiedTime,
    this.failureReason,
  });
  static CreateVocabularyResponse fromJson(Map<String, dynamic> json) =>
      CreateVocabularyResponse(
        vocabularyName: json.containsKey('VocabularyName')
            ? json['VocabularyName'] as String
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        vocabularyState: json.containsKey('VocabularyState')
            ? json['VocabularyState'] as String
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

class GetTranscriptionJobResponse {
  /// An object that contains the results of the transcription job.
  final TranscriptionJob transcriptionJob;

  GetTranscriptionJobResponse({
    this.transcriptionJob,
  });
  static GetTranscriptionJobResponse fromJson(Map<String, dynamic> json) =>
      GetTranscriptionJobResponse(
        transcriptionJob: json.containsKey('TranscriptionJob')
            ? TranscriptionJob.fromJson(json['TranscriptionJob'])
            : null,
      );
}

class GetVocabularyResponse {
  /// The name of the vocabulary to return.
  final String vocabularyName;

  /// The language code of the vocabulary entries.
  final String languageCode;

  /// The processing state of the vocabulary.
  final String vocabularyState;

  /// The date and time that the vocabulary was last modified.
  final DateTime lastModifiedTime;

  /// If the `VocabularyState` field is `FAILED`, this field contains
  /// information about why the job failed.
  final String failureReason;

  /// The S3 location where the vocabulary is stored. Use this URI to get the
  /// contents of the vocabulary. The URI is available for a limited time.
  final String downloadUri;

  GetVocabularyResponse({
    this.vocabularyName,
    this.languageCode,
    this.vocabularyState,
    this.lastModifiedTime,
    this.failureReason,
    this.downloadUri,
  });
  static GetVocabularyResponse fromJson(Map<String, dynamic> json) =>
      GetVocabularyResponse(
        vocabularyName: json.containsKey('VocabularyName')
            ? json['VocabularyName'] as String
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        vocabularyState: json.containsKey('VocabularyState')
            ? json['VocabularyState'] as String
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        downloadUri: json.containsKey('DownloadUri')
            ? json['DownloadUri'] as String
            : null,
      );
}

class ListTranscriptionJobsResponse {
  /// The requested status of the jobs returned.
  final String status;

  /// The `ListTranscriptionJobs` operation returns a page of jobs at a time.
  /// The maximum size of the page is set by the `MaxResults` parameter. If
  /// there are more jobs in the list than the page size, Amazon Transcribe
  /// returns the `NextPage` token. Include the token in the next request to the
  /// `ListTranscriptionJobs` operation to return in the next page of jobs.
  final String nextToken;

  /// A list of objects containing summary information for a transcription job.
  final List<TranscriptionJobSummary> transcriptionJobSummaries;

  ListTranscriptionJobsResponse({
    this.status,
    this.nextToken,
    this.transcriptionJobSummaries,
  });
  static ListTranscriptionJobsResponse fromJson(Map<String, dynamic> json) =>
      ListTranscriptionJobsResponse(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        transcriptionJobSummaries: json.containsKey('TranscriptionJobSummaries')
            ? (json['TranscriptionJobSummaries'] as List)
                .map((e) => TranscriptionJobSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListVocabulariesResponse {
  /// The requested vocabulary state.
  final String status;

  /// The `ListVocabularies` operation returns a page of vocabularies at a time.
  /// The maximum size of the page is set by the `MaxResults` parameter. If
  /// there are more jobs in the list than the page size, Amazon Transcribe
  /// returns the `NextPage` token. Include the token in the next request to the
  /// `ListVocabularies` operation to return in the next page of jobs.
  final String nextToken;

  /// A list of objects that describe the vocabularies that match the search
  /// criteria in the request.
  final List<VocabularyInfo> vocabularies;

  ListVocabulariesResponse({
    this.status,
    this.nextToken,
    this.vocabularies,
  });
  static ListVocabulariesResponse fromJson(Map<String, dynamic> json) =>
      ListVocabulariesResponse(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        vocabularies: json.containsKey('Vocabularies')
            ? (json['Vocabularies'] as List)
                .map((e) => VocabularyInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes the input media file in a transcription request.
class Media {
  /// The S3 location of the input media file. The URI must be in the same
  /// region as the API endpoint that you are calling. The general form is:
  ///
  ///
  /// `https://s3-<aws-region>.amazonaws.com/<bucket-name>/<keyprefix>/<objectkey>`
  ///
  ///
  /// For example:
  ///
  ///  `https://s3-us-east-1.amazonaws.com/examplebucket/example.mp4`
  ///
  ///  `https://s3-us-east-1.amazonaws.com/examplebucket/mediadocs/example.mp4`
  ///
  /// For more information about S3 object names, see
  /// [Object Keys](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys)
  /// in the _Amazon S3 Developer Guide_.
  final String mediaFileUri;

  Media({
    this.mediaFileUri,
  });
  static Media fromJson(Map<String, dynamic> json) => Media(
        mediaFileUri: json.containsKey('MediaFileUri')
            ? json['MediaFileUri'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides optional settings for the `StartTranscriptionJob` operation.
class Settings {
  /// The name of a vocabulary to use when processing the transcription job.
  final String vocabularyName;

  /// Determines whether the transcription job uses speaker recognition to
  /// identify different speakers in the input audio. Speaker recognition labels
  /// individual speakers in the audio file. If you set the `ShowSpeakerLabels`
  /// field to true, you must also set the maximum number of speaker labels
  /// `MaxSpeakerLabels` field.
  ///
  /// You can't set both `ShowSpeakerLabels` and `ChannelIdentification` in the
  /// same request. If you set both, your request returns a
  /// `BadRequestException`.
  final bool showSpeakerLabels;

  /// The maximum number of speakers to identify in the input audio. If there
  /// are more speakers in the audio than this number, multiple speakers will be
  /// identified as a single speaker. If you specify the `MaxSpeakerLabels`
  /// field, you must set the `ShowSpeakerLabels` field to true.
  final int maxSpeakerLabels;

  /// Instructs Amazon Transcribe to process each audio channel separately and
  /// then merge the transcription output of each channel into a single
  /// transcription.
  ///
  /// Amazon Transcribe also produces a transcription of each item detected on
  /// an audio channel, including the start time and end time of the item and
  /// alternative transcriptions of the item including the confidence that
  /// Amazon Transcribe has in the transcription.
  ///
  /// You can't set both `ShowSpeakerLabels` and `ChannelIdentification` in the
  /// same request. If you set both, your request returns a
  /// `BadRequestException`.
  final bool channelIdentification;

  Settings({
    this.vocabularyName,
    this.showSpeakerLabels,
    this.maxSpeakerLabels,
    this.channelIdentification,
  });
  static Settings fromJson(Map<String, dynamic> json) => Settings(
        vocabularyName: json.containsKey('VocabularyName')
            ? json['VocabularyName'] as String
            : null,
        showSpeakerLabels: json.containsKey('ShowSpeakerLabels')
            ? json['ShowSpeakerLabels'] as bool
            : null,
        maxSpeakerLabels: json.containsKey('MaxSpeakerLabels')
            ? json['MaxSpeakerLabels'] as int
            : null,
        channelIdentification: json.containsKey('ChannelIdentification')
            ? json['ChannelIdentification'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartTranscriptionJobResponse {
  /// An object containing details of the asynchronous transcription job.
  final TranscriptionJob transcriptionJob;

  StartTranscriptionJobResponse({
    this.transcriptionJob,
  });
  static StartTranscriptionJobResponse fromJson(Map<String, dynamic> json) =>
      StartTranscriptionJobResponse(
        transcriptionJob: json.containsKey('TranscriptionJob')
            ? TranscriptionJob.fromJson(json['TranscriptionJob'])
            : null,
      );
}

/// Identifies the location of a transcription.
class Transcript {
  /// The location where the transcription is stored.
  ///
  /// Use this URI to access the transcription. If you specified an S3 bucket in
  /// the `OutputBucketName` field when you created the job, this is the URI of
  /// that bucket. If you chose to store the transcription in Amazon Transcribe,
  /// this is a shareable URL that provides secure access to that location.
  final String transcriptFileUri;

  Transcript({
    this.transcriptFileUri,
  });
  static Transcript fromJson(Map<String, dynamic> json) => Transcript(
        transcriptFileUri: json.containsKey('TranscriptFileUri')
            ? json['TranscriptFileUri'] as String
            : null,
      );
}

/// Describes an asynchronous transcription job that was created with the
/// `StartTranscriptionJob` operation.
class TranscriptionJob {
  /// The name of the transcription job.
  final String transcriptionJobName;

  /// The status of the transcription job.
  final String transcriptionJobStatus;

  /// The language code for the input speech.
  final String languageCode;

  /// The sample rate, in Hertz, of the audio track in the input media file.
  final int mediaSampleRateHertz;

  /// The format of the input media file.
  final String mediaFormat;

  /// An object that describes the input media for the transcription job.
  final Media media;

  /// An object that describes the output of the transcription job.
  final Transcript transcript;

  /// A timestamp that shows when the job was created.
  final DateTime creationTime;

  /// A timestamp that shows when the job was completed.
  final DateTime completionTime;

  /// If the `TranscriptionJobStatus` field is `FAILED`, this field contains
  /// information about why the job failed.
  ///
  /// The `FailureReason` field can contain one of the following values:
  ///
  /// *    `Unsupported media format` - The media format specified in the
  /// `MediaFormat` field of the request isn't valid. See the description of the
  /// `MediaFormat` field for a list of valid values.
  ///
  /// *    `The media format provided does not match the detected media format`
  /// - The media format of the audio file doesn't match the format specified in
  /// the `MediaFormat` field in the request. Check the media format of your
  /// media file and make sure that the two values match.
  ///
  /// *    `Invalid sample rate for audio file` - The sample rate specified in
  /// the `MediaSampleRateHertz` of the request isn't valid. The sample rate
  /// must be between 8000 and 48000 Hertz.
  ///
  /// *    `The sample rate provided does not match the detected sample rate` -
  /// The sample rate in the audio file doesn't match the sample rate specified
  /// in the `MediaSampleRateHertz` field in the request. Check the sample rate
  /// of your media file and make sure that the two values match.
  ///
  /// *    `Invalid file size: file size too large` - The size of your audio
  /// file is larger than Amazon Transcribe can process. For more information,
  /// see
  /// [Limits](https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits)
  /// in the _Amazon Transcribe Developer Guide_.
  ///
  /// *    `Invalid number of channels: number of channels too large` - Your
  /// audio contains more channels than Amazon Transcribe is configured to
  /// process. To request additional channels, see
  /// [Amazon Transcribe Limits](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe)
  /// in the _Amazon Web Services General Reference_.
  final String failureReason;

  /// Optional settings for the transcription job. Use these settings to turn on
  /// speaker recognition, to set the maximum number of speakers that should be
  /// identified and to specify a custom vocabulary to use when processing the
  /// transcription job.
  final Settings settings;

  TranscriptionJob({
    this.transcriptionJobName,
    this.transcriptionJobStatus,
    this.languageCode,
    this.mediaSampleRateHertz,
    this.mediaFormat,
    this.media,
    this.transcript,
    this.creationTime,
    this.completionTime,
    this.failureReason,
    this.settings,
  });
  static TranscriptionJob fromJson(Map<String, dynamic> json) =>
      TranscriptionJob(
        transcriptionJobName: json.containsKey('TranscriptionJobName')
            ? json['TranscriptionJobName'] as String
            : null,
        transcriptionJobStatus: json.containsKey('TranscriptionJobStatus')
            ? json['TranscriptionJobStatus'] as String
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        mediaSampleRateHertz: json.containsKey('MediaSampleRateHertz')
            ? json['MediaSampleRateHertz'] as int
            : null,
        mediaFormat: json.containsKey('MediaFormat')
            ? json['MediaFormat'] as String
            : null,
        media: json.containsKey('Media') ? Media.fromJson(json['Media']) : null,
        transcript: json.containsKey('Transcript')
            ? Transcript.fromJson(json['Transcript'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        completionTime: json.containsKey('CompletionTime')
            ? DateTime.parse(json['CompletionTime'])
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        settings: json.containsKey('Settings')
            ? Settings.fromJson(json['Settings'])
            : null,
      );
}

/// Provides a summary of information about a transcription job. .
class TranscriptionJobSummary {
  /// The name of the transcription job.
  final String transcriptionJobName;

  /// A timestamp that shows when the job was created.
  final DateTime creationTime;

  /// A timestamp that shows when the job was completed.
  final DateTime completionTime;

  /// The language code for the input speech.
  final String languageCode;

  /// The status of the transcription job. When the status is `COMPLETED`, use
  /// the `GetTranscriptionJob` operation to get the results of the
  /// transcription.
  final String transcriptionJobStatus;

  /// If the `TranscriptionJobStatus` field is `FAILED`, a description of the
  /// error.
  final String failureReason;

  /// Indicates the location of the output of the transcription job.
  ///
  /// If the value is `CUSTOMER_BUCKET` then the location is the S3 bucket
  /// specified in the `outputBucketName` field when the transcription job was
  /// started with the `StartTranscriptionJob` operation.
  ///
  /// If the value is `SERVICE_BUCKET` then the output is stored by Amazon
  /// Transcribe and can be retrieved using the URI in the `GetTranscriptionJob`
  /// response's `TranscriptFileUri` field.
  final String outputLocationType;

  TranscriptionJobSummary({
    this.transcriptionJobName,
    this.creationTime,
    this.completionTime,
    this.languageCode,
    this.transcriptionJobStatus,
    this.failureReason,
    this.outputLocationType,
  });
  static TranscriptionJobSummary fromJson(Map<String, dynamic> json) =>
      TranscriptionJobSummary(
        transcriptionJobName: json.containsKey('TranscriptionJobName')
            ? json['TranscriptionJobName'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        completionTime: json.containsKey('CompletionTime')
            ? DateTime.parse(json['CompletionTime'])
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        transcriptionJobStatus: json.containsKey('TranscriptionJobStatus')
            ? json['TranscriptionJobStatus'] as String
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        outputLocationType: json.containsKey('OutputLocationType')
            ? json['OutputLocationType'] as String
            : null,
      );
}

class UpdateVocabularyResponse {
  /// The name of the vocabulary that was updated.
  final String vocabularyName;

  /// The language code of the vocabulary entries.
  final String languageCode;

  /// The date and time that the vocabulary was updated.
  final DateTime lastModifiedTime;

  /// The processing state of the vocabulary. When the `VocabularyState` field
  /// contains `READY` the vocabulary is ready to be used in a
  /// `StartTranscriptionJob` request.
  final String vocabularyState;

  UpdateVocabularyResponse({
    this.vocabularyName,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyState,
  });
  static UpdateVocabularyResponse fromJson(Map<String, dynamic> json) =>
      UpdateVocabularyResponse(
        vocabularyName: json.containsKey('VocabularyName')
            ? json['VocabularyName'] as String
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        vocabularyState: json.containsKey('VocabularyState')
            ? json['VocabularyState'] as String
            : null,
      );
}

/// Provides information about a custom vocabulary.
class VocabularyInfo {
  /// The name of the vocabulary.
  final String vocabularyName;

  /// The language code of the vocabulary entries.
  final String languageCode;

  /// The date and time that the vocabulary was last modified.
  final DateTime lastModifiedTime;

  /// The processing state of the vocabulary. If the state is `READY` you can
  /// use the vocabulary in a `StartTranscriptionJob` request.
  final String vocabularyState;

  VocabularyInfo({
    this.vocabularyName,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyState,
  });
  static VocabularyInfo fromJson(Map<String, dynamic> json) => VocabularyInfo(
        vocabularyName: json.containsKey('VocabularyName')
            ? json['VocabularyName'] as String
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        vocabularyState: json.containsKey('VocabularyState')
            ? json['VocabularyState'] as String
            : null,
      );
}
