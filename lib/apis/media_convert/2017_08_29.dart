import 'package:meta/meta.dart';

/// AWS Elemental MediaConvert
class MediaConvertApi {
  /// Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN)
  /// with AWS Elemental MediaConvert.
  Future<void> associateCertificate(String arn) async {}

  /// Permanently cancel a job. Once you have canceled a job, you can't start it
  /// again.
  Future<void> cancelJob(String id) async {}

  /// Create a new transcoding job. For information about jobs and job settings,
  /// see the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  Future<void> createJob(
      {AccelerationSettings accelerationSettings,
      String billingTagsSource,
      String clientRequestToken,
      String jobTemplate,
      int priority,
      String queue,
      @required String role,
      @required JobSettings settings,
      String simulateReservedQueue,
      String statusUpdateInterval,
      Map<String, String> userMetadata}) async {}

  /// Create a new job template. For information about job templates see the
  /// User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  Future<void> createJobTemplate(
      {AccelerationSettings accelerationSettings,
      String category,
      String description,
      @required String name,
      int priority,
      String queue,
      @required JobTemplateSettings settings,
      String statusUpdateInterval,
      Map<String, String> tags}) async {}

  /// Create a new preset. For information about job templates see the User
  /// Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  Future<void> createPreset(
      {String category,
      String description,
      @required String name,
      @required PresetSettings settings,
      Map<String, String> tags}) async {}

  /// Create a new transcoding queue. For information about queues, see Working
  /// With Queues in the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
  Future<void> createQueue(String name,
      {String description,
      String pricingPlan,
      ReservationPlanSettings reservationPlanSettings,
      String status,
      Map<String, String> tags}) async {}

  /// Permanently delete a job template you have created.
  Future<void> deleteJobTemplate(String name) async {}

  /// Permanently delete a preset you have created.
  Future<void> deletePreset(String name) async {}

  /// Permanently delete a queue you have created.
  Future<void> deleteQueue(String name) async {}

  /// Send an request with an empty body to the regional API endpoint to get
  /// your account API endpoint.
  Future<void> describeEndpoints(
      {int maxResults, String mode, String nextToken}) async {}

  /// Removes an association between the Amazon Resource Name (ARN) of an AWS
  /// Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert
  /// resource.
  Future<void> disassociateCertificate(String arn) async {}

  /// Retrieve the JSON for a specific completed transcoding job.
  Future<void> getJob(String id) async {}

  /// Retrieve the JSON for a specific job template.
  Future<void> getJobTemplate(String name) async {}

  /// Retrieve the JSON for a specific preset.
  Future<void> getPreset(String name) async {}

  /// Retrieve the JSON for a specific queue.
  Future<void> getQueue(String name) async {}

  /// Retrieve a JSON array of up to twenty of your job templates. This will
  /// return the templates themselves, not just a list of them. To retrieve the
  /// next twenty templates, use the nextToken string returned with the array
  Future<void> listJobTemplates(
      {String category,
      String listBy,
      int maxResults,
      String nextToken,
      String order}) async {}

  /// Retrieve a JSON array of up to twenty of your most recently created jobs.
  /// This array includes in-process, completed, and errored jobs. This will
  /// return the jobs themselves, not just a list of the jobs. To retrieve the
  /// twenty next most recent jobs, use the nextToken string returned with the
  /// array.
  Future<void> listJobs(
      {int maxResults,
      String nextToken,
      String order,
      String queue,
      String status}) async {}

  /// Retrieve a JSON array of up to twenty of your presets. This will return
  /// the presets themselves, not just a list of them. To retrieve the next
  /// twenty presets, use the nextToken string returned with the array.
  Future<void> listPresets(
      {String category,
      String listBy,
      int maxResults,
      String nextToken,
      String order}) async {}

  /// Retrieve a JSON array of up to twenty of your queues. This will return the
  /// queues themselves, not just a list of them. To retrieve the next twenty
  /// queues, use the nextToken string returned with the array.
  Future<void> listQueues(
      {String listBy, int maxResults, String nextToken, String order}) async {}

  /// Retrieve the tags for a MediaConvert resource.
  Future<void> listTagsForResource(String arn) async {}

  /// Add tags to a MediaConvert queue, preset, or job template. For information
  /// about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  Future<void> tagResource(
      {@required String arn, @required Map<String, String> tags}) async {}

  /// Remove tags from a MediaConvert queue, preset, or job template. For
  /// information about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  Future<void> untagResource(String arn, {List<String> tagKeys}) async {}

  /// Modify one of your existing job templates.
  Future<void> updateJobTemplate(String name,
      {AccelerationSettings accelerationSettings,
      String category,
      String description,
      int priority,
      String queue,
      JobTemplateSettings settings,
      String statusUpdateInterval}) async {}

  /// Modify one of your existing presets.
  Future<void> updatePreset(String name,
      {String category, String description, PresetSettings settings}) async {}

  /// Modify one of your existing queues.
  Future<void> updateQueue(String name,
      {String description,
      ReservationPlanSettings reservationPlanSettings,
      String status}) async {}
}

class AacSettings {}

class Ac3Settings {}

class AccelerationSettings {}

class AiffSettings {}

class AncillarySourceSettings {}

class AssociateCertificateResponse {}

class AudioCodecSettings {}

class AudioDescription {}

class AudioNormalizationSettings {}

class AudioSelector {}

class AudioSelectorGroup {}

class AvailBlanking {}

class BurninDestinationSettings {}

class CancelJobResponse {}

class CaptionDescription {}

class CaptionDescriptionPreset {}

class CaptionDestinationSettings {}

class CaptionSelector {}

class CaptionSourceSettings {}

class ChannelMapping {}

class CmafEncryptionSettings {}

class CmafGroupSettings {}

class ColorCorrector {}

class ContainerSettings {}

class CreateJobResponse {}

class CreateJobTemplateResponse {}

class CreatePresetResponse {}

class CreateQueueResponse {}

class DashIsoEncryptionSettings {}

class DashIsoGroupSettings {}

class Deinterlacer {}

class DeleteJobTemplateResponse {}

class DeletePresetResponse {}

class DeleteQueueResponse {}

class DescribeEndpointsResponse {}

class DestinationSettings {}

class DisassociateCertificateResponse {}

class DvbNitSettings {}

class DvbSdtSettings {}

class DvbSubDestinationSettings {}

class DvbSubSourceSettings {}

class DvbTdtSettings {}

class Eac3AtmosSettings {}

class Eac3Settings {}

class EmbeddedDestinationSettings {}

class EmbeddedSourceSettings {}

class Endpoint {}

class EsamManifestConfirmConditionNotification {}

class EsamSettings {}

class EsamSignalProcessingNotification {}

class F4vSettings {}

class FileGroupSettings {}

class FileSourceSettings {}

class FrameCaptureSettings {}

class GetJobResponse {}

class GetJobTemplateResponse {}

class GetPresetResponse {}

class GetQueueResponse {}

class H264QvbrSettings {}

class H264Settings {}

class H265QvbrSettings {}

class H265Settings {}

class Hdr10Metadata {}

class HlsCaptionLanguageMapping {}

class HlsEncryptionSettings {}

class HlsGroupSettings {}

class HlsSettings {}

class Id3Insertion {}

class ImageInserter {}

class ImscDestinationSettings {}

class Input {}

class InputClipping {}

class InputDecryptionSettings {}

class InputTemplate {}

class InsertableImage {}

class Job {}

class JobSettings {}

class JobTemplate {}

class JobTemplateSettings {}

class ListJobTemplatesResponse {}

class ListJobsResponse {}

class ListPresetsResponse {}

class ListQueuesResponse {}

class ListTagsForResourceResponse {}

class M2TsScte35Esam {}

class M2TsSettings {}

class M3U8Settings {}

class MotionImageInserter {}

class MotionImageInsertionFramerate {}

class MotionImageInsertionOffset {}

class MovSettings {}

class Mp2Settings {}

class Mp4Settings {}

class Mpeg2Settings {}

class MsSmoothEncryptionSettings {}

class MsSmoothGroupSettings {}

class NielsenConfiguration {}

class NoiseReducer {}

class NoiseReducerFilterSettings {}

class NoiseReducerSpatialFilterSettings {}

class NoiseReducerTemporalFilterSettings {}

class Output {}

class OutputChannelMapping {}

class OutputDetail {}

class OutputGroup {}

class OutputGroupDetail {}

class OutputGroupSettings {}

class OutputSettings {}

class Preset {}

class PresetSettings {}

class ProresSettings {}

class Queue {}

class Rectangle {}

class RemixSettings {}

class ReservationPlan {}

class ReservationPlanSettings {}

class ResourceTags {}

class S3DestinationSettings {}

class S3EncryptionSettings {}

class SccDestinationSettings {}

class SpekeKeyProvider {}

class SpekeKeyProviderCmaf {}

class StaticKeyProvider {}

class TagResourceResponse {}

class TeletextDestinationSettings {}

class TeletextSourceSettings {}

class TimecodeBurnin {}

class TimecodeConfig {}

class TimedMetadataInsertion {}

class Timing {}

class TrackSourceSettings {}

class TtmlDestinationSettings {}

class UntagResourceResponse {}

class UpdateJobTemplateResponse {}

class UpdatePresetResponse {}

class UpdateQueueResponse {}

class VideoCodecSettings {}

class VideoDescription {}

class VideoDetail {}

class VideoPreprocessor {}

class VideoSelector {}

class WavSettings {}
