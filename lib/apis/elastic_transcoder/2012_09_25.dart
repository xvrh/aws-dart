import 'package:meta/meta.dart';

/// AWS Elastic Transcoder Service
///
/// The AWS Elastic Transcoder Service.
class ElasticTranscoderApi {
  /// The CancelJob operation cancels an unfinished job.
  ///
  ///
  ///
  /// You can only cancel a job that has a status of `Submitted`. To prevent a
  /// pipeline from starting to process a job while you're getting the job
  /// identifier, use UpdatePipelineStatus to temporarily pause the pipeline.
  Future<void> cancelJob(String id) async {}

  /// When you create a job, Elastic Transcoder returns JSON data that includes
  /// the values that you specified plus information about the job that is
  /// created.
  ///
  /// If you have specified more than one output for your jobs (for example, one
  /// output for the Kindle Fire and another output for the Apple iPhone 4s),
  /// you currently must use the Elastic Transcoder API to list the jobs (as
  /// opposed to the AWS Console).
  Future<void> createJob(String pipelineId,
      {JobInput input,
      List<JobInput> inputs,
      CreateJobOutput output,
      List<CreateJobOutput> outputs,
      String outputKeyPrefix,
      List<CreateJobPlaylist> playlists,
      Map<String, String> userMetadata}) async {}

  /// The CreatePipeline operation creates a pipeline with settings that you
  /// specify.
  Future<void> createPipeline(
      {@required String name,
      @required String inputBucket,
      String outputBucket,
      @required String role,
      String awsKmsKeyArn,
      Notifications notifications,
      PipelineOutputConfig contentConfig,
      PipelineOutputConfig thumbnailConfig}) async {}

  /// The CreatePreset operation creates a preset with settings that you
  /// specify.
  ///
  ///  Elastic Transcoder checks the CreatePreset settings to ensure that they
  /// meet Elastic Transcoder requirements and to determine whether they comply
  /// with H.264 standards. If your settings are not valid for Elastic
  /// Transcoder, Elastic Transcoder returns an HTTP 400 response
  /// (`ValidationException`) and does not create the preset. If the settings
  /// are valid for Elastic Transcoder but aren't strictly compliant with the
  /// H.264 standard, Elastic Transcoder creates the preset and returns a
  /// warning message in the response. This helps you determine whether your
  /// settings comply with the H.264 standard while giving you greater
  /// flexibility with respect to the video that Elastic Transcoder produces.
  ///
  /// Elastic Transcoder uses the H.264 video-compression format. For more
  /// information, see the International Telecommunication Union publication
  /// _Recommendation ITU-T H.264: Advanced video coding for generic audiovisual
  /// services_.
  Future<void> createPreset(
      {@required String name,
      String description,
      @required String container,
      VideoParameters video,
      AudioParameters audio,
      Thumbnails thumbnails}) async {}

  /// The DeletePipeline operation removes a pipeline.
  ///
  ///  You can only delete a pipeline that has never been used or that is not
  /// currently in use (doesn't contain any active jobs). If the pipeline is
  /// currently in use, `DeletePipeline` returns an error.
  Future<void> deletePipeline(String id) async {}

  /// The DeletePreset operation removes a preset that you've added in an AWS
  /// region.
  ///
  ///
  ///
  /// You can't delete the default presets that are included with Elastic
  /// Transcoder.
  Future<void> deletePreset(String id) async {}

  /// The ListJobsByPipeline operation gets a list of the jobs currently in a
  /// pipeline.
  ///
  /// Elastic Transcoder returns all of the jobs currently in the specified
  /// pipeline. The response body contains one element for each job that
  /// satisfies the search criteria.
  Future<void> listJobsByPipeline(String pipelineId,
      {String ascending, String pageToken}) async {}

  /// The ListJobsByStatus operation gets a list of jobs that have a specified
  /// status. The response body contains one element for each job that satisfies
  /// the search criteria.
  Future<void> listJobsByStatus(String status,
      {String ascending, String pageToken}) async {}

  /// The ListPipelines operation gets a list of the pipelines associated with
  /// the current AWS account.
  Future<void> listPipelines({String ascending, String pageToken}) async {}

  /// The ListPresets operation gets a list of the default presets included with
  /// Elastic Transcoder and the presets that you've added in an AWS region.
  Future<void> listPresets({String ascending, String pageToken}) async {}

  /// The ReadJob operation returns detailed information about a job.
  Future<void> readJob(String id) async {}

  /// The ReadPipeline operation gets detailed information about a pipeline.
  Future<void> readPipeline(String id) async {}

  /// The ReadPreset operation gets detailed information about a preset.
  Future<void> readPreset(String id) async {}

  /// The TestRole operation tests the IAM role used to create the pipeline.
  ///
  /// The `TestRole` action lets you determine whether the IAM role you are
  /// using has sufficient permissions to let Elastic Transcoder perform tasks
  /// associated with the transcoding process. The action attempts to assume the
  /// specified IAM role, checks read access to the input and output buckets,
  /// and tries to send a test notification to Amazon SNS topics that you
  /// specify.
  Future<void> testRole(
      {@required String role,
      @required String inputBucket,
      @required String outputBucket,
      @required List<String> topics}) async {}

  ///  Use the `UpdatePipeline` operation to update settings for a pipeline.
  ///
  ///
  ///
  /// When you change pipeline settings, your changes take effect immediately.
  /// Jobs that you have already submitted and that Elastic Transcoder has not
  /// started to process are affected in addition to jobs that you submit after
  /// you change settings.
  Future<void> updatePipeline(String id,
      {String name,
      String inputBucket,
      String role,
      String awsKmsKeyArn,
      Notifications notifications,
      PipelineOutputConfig contentConfig,
      PipelineOutputConfig thumbnailConfig}) async {}

  /// With the UpdatePipelineNotifications operation, you can update Amazon
  /// Simple Notification Service (Amazon SNS) notifications for a pipeline.
  ///
  /// When you update notifications for a pipeline, Elastic Transcoder returns
  /// the values that you specified in the request.
  Future<void> updatePipelineNotifications(
      {@required String id, @required Notifications notifications}) async {}

  /// The UpdatePipelineStatus operation pauses or reactivates a pipeline, so
  /// that the pipeline stops or restarts the processing of jobs.
  ///
  /// Changing the pipeline status is useful if you want to cancel one or more
  /// jobs. You can't cancel jobs after Elastic Transcoder has started
  /// processing them; if you pause the pipeline to which you submitted the
  /// jobs, you have more time to get the job IDs for the jobs that you want to
  /// cancel, and to send a CancelJob request.
  Future<void> updatePipelineStatus(
      {@required String id, @required String status}) async {}
}

class Artwork {}

class AudioCodecOptions {}

class AudioParameters {}

class CancelJobResponse {}

class CaptionFormat {}

class CaptionSource {}

class Captions {}

class Clip {}

class CreateJobOutput {}

class CreateJobPlaylist {}

class CreateJobResponse {}

class CreatePipelineResponse {}

class CreatePresetResponse {}

class DeletePipelineResponse {}

class DeletePresetResponse {}

class DetectedProperties {}

class Encryption {}

class HlsContentProtection {}

class InputCaptions {}

class Job {}

class JobAlbumArt {}

class JobInput {}

class JobOutput {}

class JobWatermark {}

class ListJobsByPipelineResponse {}

class ListJobsByStatusResponse {}

class ListPipelinesResponse {}

class ListPresetsResponse {}

class Notifications {}

class Permission {}

class Pipeline {}

class PipelineOutputConfig {}

class PlayReadyDrm {}

class Playlist {}

class Preset {}

class PresetWatermark {}

class ReadJobResponse {}

class ReadPipelineResponse {}

class ReadPresetResponse {}

class TestRoleResponse {}

class Thumbnails {}

class TimeSpan {}

class Timing {}

class UpdatePipelineNotificationsResponse {}

class UpdatePipelineResponse {}

class UpdatePipelineStatusResponse {}

class VideoParameters {}

class Warning {}
