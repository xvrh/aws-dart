import 'package:meta/meta.dart';

/// AWS Elemental MediaConvert
class MediaConvertApi {
  /// Associates an AWS Certificate Manager (ACM) Amazon Resource Name (ARN)
  /// with AWS Elemental MediaConvert.
  ///
  /// [arn]: The ARN of the ACM certificate that you want to associate with your
  /// MediaConvert resource.
  Future<AssociateCertificateResponse> associateCertificate(String arn) async {
    return AssociateCertificateResponse.fromJson({});
  }

  /// Permanently cancel a job. Once you have canceled a job, you can't start it
  /// again.
  ///
  /// [id]: The Job ID of the job to be cancelled.
  Future<CancelJobResponse> cancelJob(String id) async {
    return CancelJobResponse.fromJson({});
  }

  /// Create a new transcoding job. For information about jobs and job settings,
  /// see the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// [accelerationSettings]: Accelerated transcoding can significantly speed up
  /// jobs with long, visually complex content. Outputs that use this feature
  /// incur pro-tier pricing. For information about feature limitations, see the
  /// AWS Elemental MediaConvert User Guide.
  ///
  /// [billingTagsSource]: Optional. Choose a tag type that AWS Billing and Cost
  /// Management will use to sort your AWS Elemental MediaConvert costs on any
  /// billing report that you set up. Any transcoding outputs that don't have an
  /// associated tag will appear in your billing report unsorted. If you don't
  /// choose a valid value for this field, your job outputs will appear on the
  /// billing report unsorted.
  ///
  /// [clientRequestToken]: Idempotency token for CreateJob operation.
  ///
  /// [jobTemplate]: When you create a job, you can either specify a job
  /// template or specify the transcoding settings individually
  ///
  /// [priority]: Specify the relative priority for this job. In any given
  /// queue, the service begins processing the job with the highest value first.
  /// When more than one job has the same priority, the service begins
  /// processing the job that you submitted first. If you don't specify a
  /// priority, the service uses the default value 0.
  ///
  /// [queue]: Optional. When you create a job, you can specify a queue to send
  /// it to. If you don't specify, the job will go to the default queue. For
  /// more about queues, see the User Guide topic at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html.
  ///
  /// [role]: Required. The IAM role you use for creating this job. For details
  /// about permissions, see the User Guide topic at the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html.
  ///
  /// [settings]: JobSettings contains all the transcode settings for a job.
  ///
  /// [simulateReservedQueue]: Enable this setting when you run a test job to
  /// estimate how many reserved transcoding slots (RTS) you need. When this is
  /// enabled, MediaConvert runs your job from an on-demand queue with similar
  /// performance to what you will see with one RTS in a reserved queue. This
  /// setting is disabled by default.
  ///
  /// [statusUpdateInterval]: Specify how often MediaConvert sends STATUS_UPDATE
  /// events to Amazon CloudWatch Events. Set the interval, in seconds, between
  /// status updates. MediaConvert sends an update at this interval from the
  /// time the service begins processing your job to the time it completes the
  /// transcode or encounters an error.
  ///
  /// [userMetadata]: User-defined metadata that you want to associate with an
  /// MediaConvert job. You specify metadata in key/value pairs.
  Future<CreateJobResponse> createJob(
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
      Map<String, String> userMetadata}) async {
    return CreateJobResponse.fromJson({});
  }

  /// Create a new job template. For information about job templates see the
  /// User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// [accelerationSettings]: Accelerated transcoding can significantly speed up
  /// jobs with long, visually complex content. Outputs that use this feature
  /// incur pro-tier pricing. For information about feature limitations, see the
  /// AWS Elemental MediaConvert User Guide.
  ///
  /// [category]: Optional. A category for the job template you are creating
  ///
  /// [description]: Optional. A description of the job template you are
  /// creating.
  ///
  /// [name]: The name of the job template you are creating.
  ///
  /// [priority]: Specify the relative priority for this job. In any given
  /// queue, the service begins processing the job with the highest value first.
  /// When more than one job has the same priority, the service begins
  /// processing the job that you submitted first. If you don't specify a
  /// priority, the service uses the default value 0.
  ///
  /// [queue]: Optional. The queue that jobs created from this template are
  /// assigned to. If you don't specify this, jobs will go to the default queue.
  ///
  /// [settings]: JobTemplateSettings contains all the transcode settings saved
  /// in the template that will be applied to jobs created from it.
  ///
  /// [statusUpdateInterval]: Specify how often MediaConvert sends STATUS_UPDATE
  /// events to Amazon CloudWatch Events. Set the interval, in seconds, between
  /// status updates. MediaConvert sends an update at this interval from the
  /// time the service begins processing your job to the time it completes the
  /// transcode or encounters an error.
  ///
  /// [tags]: The tags that you want to add to the resource. You can tag
  /// resources with a key-value pair or with only a key.
  Future<CreateJobTemplateResponse> createJobTemplate(
      {AccelerationSettings accelerationSettings,
      String category,
      String description,
      @required String name,
      int priority,
      String queue,
      @required JobTemplateSettings settings,
      String statusUpdateInterval,
      Map<String, String> tags}) async {
    return CreateJobTemplateResponse.fromJson({});
  }

  /// Create a new preset. For information about job templates see the User
  /// Guide at http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  ///
  /// [category]: Optional. A category for the preset you are creating.
  ///
  /// [description]: Optional. A description of the preset you are creating.
  ///
  /// [name]: The name of the preset you are creating.
  ///
  /// [settings]: Settings for preset
  ///
  /// [tags]: The tags that you want to add to the resource. You can tag
  /// resources with a key-value pair or with only a key.
  Future<CreatePresetResponse> createPreset(
      {String category,
      String description,
      @required String name,
      @required PresetSettings settings,
      Map<String, String> tags}) async {
    return CreatePresetResponse.fromJson({});
  }

  /// Create a new transcoding queue. For information about queues, see Working
  /// With Queues in the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html
  ///
  /// [description]: Optional. A description of the queue that you are creating.
  ///
  /// [name]: The name of the queue that you are creating.
  ///
  /// [pricingPlan]: Specifies whether the pricing plan for the queue is
  /// on-demand or reserved. For on-demand, you pay per minute, billed in
  /// increments of .01 minute. For reserved, you pay for the transcoding
  /// capacity of the entire queue, regardless of how much or how little you use
  /// it. Reserved pricing requires a 12-month commitment. When you use the API
  /// to create a queue, the default is on-demand.
  ///
  /// [reservationPlanSettings]: Details about the pricing plan for your
  /// reserved queue. Required for reserved queues and not applicable to
  /// on-demand queues.
  ///
  /// [status]: Initial state of the queue. If you create a paused queue, then
  /// jobs in that queue won't begin.
  ///
  /// [tags]: The tags that you want to add to the resource. You can tag
  /// resources with a key-value pair or with only a key.
  Future<CreateQueueResponse> createQueue(String name,
      {String description,
      String pricingPlan,
      ReservationPlanSettings reservationPlanSettings,
      String status,
      Map<String, String> tags}) async {
    return CreateQueueResponse.fromJson({});
  }

  /// Permanently delete a job template you have created.
  ///
  /// [name]: The name of the job template to be deleted.
  Future<DeleteJobTemplateResponse> deleteJobTemplate(String name) async {
    return DeleteJobTemplateResponse.fromJson({});
  }

  /// Permanently delete a preset you have created.
  ///
  /// [name]: The name of the preset to be deleted.
  Future<DeletePresetResponse> deletePreset(String name) async {
    return DeletePresetResponse.fromJson({});
  }

  /// Permanently delete a queue you have created.
  ///
  /// [name]: The name of the queue that you want to delete.
  Future<DeleteQueueResponse> deleteQueue(String name) async {
    return DeleteQueueResponse.fromJson({});
  }

  /// Send an request with an empty body to the regional API endpoint to get
  /// your account API endpoint.
  ///
  /// [maxResults]: Optional. Max number of endpoints, up to twenty, that will
  /// be returned at one time.
  ///
  /// [mode]: Optional field, defaults to DEFAULT. Specify DEFAULT for this
  /// operation to return your endpoints if any exist, or to create an endpoint
  /// for you and return it if one doesn't already exist. Specify GET_ONLY to
  /// return your endpoints if any exist, or an empty list if none exist.
  ///
  /// [nextToken]: Use this string, provided with the response to a previous
  /// request, to request the next batch of endpoints.
  Future<DescribeEndpointsResponse> describeEndpoints(
      {int maxResults, String mode, String nextToken}) async {
    return DescribeEndpointsResponse.fromJson({});
  }

  /// Removes an association between the Amazon Resource Name (ARN) of an AWS
  /// Certificate Manager (ACM) certificate and an AWS Elemental MediaConvert
  /// resource.
  ///
  /// [arn]: The ARN of the ACM certificate that you want to disassociate from
  /// your MediaConvert resource.
  Future<DisassociateCertificateResponse> disassociateCertificate(
      String arn) async {
    return DisassociateCertificateResponse.fromJson({});
  }

  /// Retrieve the JSON for a specific completed transcoding job.
  ///
  /// [id]: the job ID of the job.
  Future<GetJobResponse> getJob(String id) async {
    return GetJobResponse.fromJson({});
  }

  /// Retrieve the JSON for a specific job template.
  ///
  /// [name]: The name of the job template.
  Future<GetJobTemplateResponse> getJobTemplate(String name) async {
    return GetJobTemplateResponse.fromJson({});
  }

  /// Retrieve the JSON for a specific preset.
  ///
  /// [name]: The name of the preset.
  Future<GetPresetResponse> getPreset(String name) async {
    return GetPresetResponse.fromJson({});
  }

  /// Retrieve the JSON for a specific queue.
  ///
  /// [name]: The name of the queue that you want information about.
  Future<GetQueueResponse> getQueue(String name) async {
    return GetQueueResponse.fromJson({});
  }

  /// Retrieve a JSON array of up to twenty of your job templates. This will
  /// return the templates themselves, not just a list of them. To retrieve the
  /// next twenty templates, use the nextToken string returned with the array
  ///
  /// [category]: Optionally, specify a job template category to limit responses
  /// to only job templates from that category.
  ///
  /// [listBy]: Optional. When you request a list of job templates, you can
  /// choose to list them alphabetically by NAME or chronologically by
  /// CREATION_DATE. If you don't specify, the service will list them by name.
  ///
  /// [maxResults]: Optional. Number of job templates, up to twenty, that will
  /// be returned at one time.
  ///
  /// [nextToken]: Use this string, provided with the response to a previous
  /// request, to request the next batch of job templates.
  ///
  /// [order]: When you request lists of resources, you can optionally specify
  /// whether they are sorted in ASCENDING or DESCENDING order. Default varies
  /// by resource.
  Future<ListJobTemplatesResponse> listJobTemplates(
      {String category,
      String listBy,
      int maxResults,
      String nextToken,
      String order}) async {
    return ListJobTemplatesResponse.fromJson({});
  }

  /// Retrieve a JSON array of up to twenty of your most recently created jobs.
  /// This array includes in-process, completed, and errored jobs. This will
  /// return the jobs themselves, not just a list of the jobs. To retrieve the
  /// twenty next most recent jobs, use the nextToken string returned with the
  /// array.
  ///
  /// [maxResults]: Optional. Number of jobs, up to twenty, that will be
  /// returned at one time.
  ///
  /// [nextToken]: Use this string, provided with the response to a previous
  /// request, to request the next batch of jobs.
  ///
  /// [order]: When you request lists of resources, you can optionally specify
  /// whether they are sorted in ASCENDING or DESCENDING order. Default varies
  /// by resource.
  ///
  /// [queue]: Provide a queue name to get back only jobs from that queue.
  ///
  /// [status]: A job's status can be SUBMITTED, PROGRESSING, COMPLETE,
  /// CANCELED, or ERROR.
  Future<ListJobsResponse> listJobs(
      {int maxResults,
      String nextToken,
      String order,
      String queue,
      String status}) async {
    return ListJobsResponse.fromJson({});
  }

  /// Retrieve a JSON array of up to twenty of your presets. This will return
  /// the presets themselves, not just a list of them. To retrieve the next
  /// twenty presets, use the nextToken string returned with the array.
  ///
  /// [category]: Optionally, specify a preset category to limit responses to
  /// only presets from that category.
  ///
  /// [listBy]: Optional. When you request a list of presets, you can choose to
  /// list them alphabetically by NAME or chronologically by CREATION_DATE. If
  /// you don't specify, the service will list them by name.
  ///
  /// [maxResults]: Optional. Number of presets, up to twenty, that will be
  /// returned at one time
  ///
  /// [nextToken]: Use this string, provided with the response to a previous
  /// request, to request the next batch of presets.
  ///
  /// [order]: When you request lists of resources, you can optionally specify
  /// whether they are sorted in ASCENDING or DESCENDING order. Default varies
  /// by resource.
  Future<ListPresetsResponse> listPresets(
      {String category,
      String listBy,
      int maxResults,
      String nextToken,
      String order}) async {
    return ListPresetsResponse.fromJson({});
  }

  /// Retrieve a JSON array of up to twenty of your queues. This will return the
  /// queues themselves, not just a list of them. To retrieve the next twenty
  /// queues, use the nextToken string returned with the array.
  ///
  /// [listBy]: Optional. When you request a list of queues, you can choose to
  /// list them alphabetically by NAME or chronologically by CREATION_DATE. If
  /// you don't specify, the service will list them by creation date.
  ///
  /// [maxResults]: Optional. Number of queues, up to twenty, that will be
  /// returned at one time.
  ///
  /// [nextToken]: Use this string, provided with the response to a previous
  /// request, to request the next batch of queues.
  ///
  /// [order]: When you request lists of resources, you can optionally specify
  /// whether they are sorted in ASCENDING or DESCENDING order. Default varies
  /// by resource.
  Future<ListQueuesResponse> listQueues(
      {String listBy, int maxResults, String nextToken, String order}) async {
    return ListQueuesResponse.fromJson({});
  }

  /// Retrieve the tags for a MediaConvert resource.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the resource that you want to
  /// list tags for. To get the ARN, send a GET request with the resource name.
  Future<ListTagsForResourceResponse> listTagsForResource(String arn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Add tags to a MediaConvert queue, preset, or job template. For information
  /// about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the resource that you want to
  /// tag. To get the ARN, send a GET request with the resource name.
  ///
  /// [tags]: The tags that you want to add to the resource. You can tag
  /// resources with a key-value pair or with only a key.
  Future<TagResourceResponse> tagResource(
      {@required String arn, @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Remove tags from a MediaConvert queue, preset, or job template. For
  /// information about tagging, see the User Guide at
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/tagging-resources.html
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the resource that you want to
  /// remove tags from. To get the ARN, send a GET request with the resource
  /// name.
  ///
  /// [tagKeys]: The keys of the tags that you want to remove from the resource.
  Future<UntagResourceResponse> untagResource(String arn,
      {List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Modify one of your existing job templates.
  ///
  /// [accelerationSettings]: Accelerated transcoding can significantly speed up
  /// jobs with long, visually complex content. Outputs that use this feature
  /// incur pro-tier pricing. For information about feature limitations, see the
  /// AWS Elemental MediaConvert User Guide.
  ///
  /// [category]: The new category for the job template, if you are changing it.
  ///
  /// [description]: The new description for the job template, if you are
  /// changing it.
  ///
  /// [name]: The name of the job template you are modifying
  ///
  /// [priority]: Specify the relative priority for this job. In any given
  /// queue, the service begins processing the job with the highest value first.
  /// When more than one job has the same priority, the service begins
  /// processing the job that you submitted first. If you don't specify a
  /// priority, the service uses the default value 0.
  ///
  /// [queue]: The new queue for the job template, if you are changing it.
  ///
  /// [settings]: JobTemplateSettings contains all the transcode settings saved
  /// in the template that will be applied to jobs created from it.
  ///
  /// [statusUpdateInterval]: Specify how often MediaConvert sends STATUS_UPDATE
  /// events to Amazon CloudWatch Events. Set the interval, in seconds, between
  /// status updates. MediaConvert sends an update at this interval from the
  /// time the service begins processing your job to the time it completes the
  /// transcode or encounters an error.
  Future<UpdateJobTemplateResponse> updateJobTemplate(String name,
      {AccelerationSettings accelerationSettings,
      String category,
      String description,
      int priority,
      String queue,
      JobTemplateSettings settings,
      String statusUpdateInterval}) async {
    return UpdateJobTemplateResponse.fromJson({});
  }

  /// Modify one of your existing presets.
  ///
  /// [category]: The new category for the preset, if you are changing it.
  ///
  /// [description]: The new description for the preset, if you are changing it.
  ///
  /// [name]: The name of the preset you are modifying.
  ///
  /// [settings]: Settings for preset
  Future<UpdatePresetResponse> updatePreset(String name,
      {String category, String description, PresetSettings settings}) async {
    return UpdatePresetResponse.fromJson({});
  }

  /// Modify one of your existing queues.
  ///
  /// [description]: The new description for the queue, if you are changing it.
  ///
  /// [name]: The name of the queue that you are modifying.
  ///
  /// [reservationPlanSettings]: The new details of your pricing plan for your
  /// reserved queue. When you set up a new pricing plan to replace an expired
  /// one, you enter into another 12-month commitment. When you add capacity to
  /// your queue by increasing the number of RTS, you extend the term of your
  /// commitment to 12 months from when you add capacity. After you make these
  /// commitments, you can't cancel them.
  ///
  /// [status]: Pause or activate a queue by changing its status between ACTIVE
  /// and PAUSED. If you pause a queue, jobs in that queue won't begin. Jobs
  /// that are running when you pause the queue continue to run until they
  /// finish or result in an error.
  Future<UpdateQueueResponse> updateQueue(String name,
      {String description,
      ReservationPlanSettings reservationPlanSettings,
      String status}) async {
    return UpdateQueueResponse.fromJson({});
  }
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AAC. The service accepts one of two mutually exclusive groups of
/// AAC settings--VBR and CBR. To select one of these modes, set the value of
/// Bitrate control mode (rateControlMode) to "VBR" or "CBR". In VBR mode, you
/// control the audio quality with the setting VBR quality (vbrQuality). In CBR
/// mode, you use the setting Bitrate (bitrate). Defaults and valid values
/// depend on the rate control mode.
class AacSettings {
  /// Choose BROADCASTER_MIXED_AD when the input contains pre-mixed main audio +
  /// audio description (AD) as a stereo pair. The value for AudioType will be
  /// set to 3, which signals to downstream systems that this stream contains
  /// "broadcaster mixed AD". Note that the input received by the encoder must
  /// contain pre-mixed audio; the encoder does not perform the mixing. When you
  /// choose BROADCASTER_MIXED_AD, the encoder ignores any values you provide in
  /// AudioType and FollowInputAudioType. Choose NORMAL when the input does not
  /// contain pre-mixed audio + audio description (AD). In this case, the
  /// encoder will use any values you provide for AudioType and
  /// FollowInputAudioType.
  final String audioDescriptionBroadcasterMix;

  /// Specify the average bitrate in bits per second. The set of valid values
  /// for this setting is: 6000, 8000, 10000, 12000, 14000, 16000, 20000, 24000,
  /// 28000, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000,
  /// 160000, 192000, 224000, 256000, 288000, 320000, 384000, 448000, 512000,
  /// 576000, 640000, 768000, 896000, 1024000. The value you set is also
  /// constrained by the values that you choose for Profile (codecProfile),
  /// Bitrate control mode (codingMode), and Sample rate (sampleRate). Default
  /// values depend on Bitrate control mode and Profile.
  final int bitrate;

  /// AAC Profile.
  final String codecProfile;

  /// Mono (Audio Description), Mono, Stereo, or 5.1 channel layout. Valid
  /// values depend on rate control mode and profile. "1.0 - Audio Description
  /// (Receiver Mix)" setting receives a stereo description plus control track
  /// and emits a mono AAC encode of the description track, with control data
  /// emitted in the PES header as per ETSI TS 101 154 Annex E.
  final String codingMode;

  /// Rate Control Mode.
  final String rateControlMode;

  /// Enables LATM/LOAS AAC output. Note that if you use LATM/LOAS AAC in an
  /// output, you must choose "No container" for the output container.
  final String rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  final int sampleRate;

  /// Use MPEG-2 AAC instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
  /// Stream containers.
  final String specification;

  /// VBR Quality Level - Only used if rate_control_mode is VBR.
  final String vbrQuality;

  AacSettings({
    this.audioDescriptionBroadcasterMix,
    this.bitrate,
    this.codecProfile,
    this.codingMode,
    this.rateControlMode,
    this.rawFormat,
    this.sampleRate,
    this.specification,
    this.vbrQuality,
  });
  static AacSettings fromJson(Map<String, dynamic> json) => AacSettings();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AC3.
class Ac3Settings {
  /// Specify the average bitrate in bits per second. Valid bitrates depend on
  /// the coding mode.
  final int bitrate;

  /// Specify the bitstream mode for the AC-3 stream that the encoder emits. For
  /// more information about the AC3 bitstream mode, see ATSC A/52-2012 (Annex
  /// E).
  final String bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  final String codingMode;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby
  /// Digital, dialnorm will be passed through.
  final int dialnorm;

  /// If set to FILM_STANDARD, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  final String dynamicRangeCompressionProfile;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  final String lfeFilter;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  final String metadataControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int sampleRate;

  Ac3Settings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialnorm,
    this.dynamicRangeCompressionProfile,
    this.lfeFilter,
    this.metadataControl,
    this.sampleRate,
  });
  static Ac3Settings fromJson(Map<String, dynamic> json) => Ac3Settings();
}

/// Accelerated transcoding can significantly speed up jobs with long, visually
/// complex content. Outputs that use this feature incur pro-tier pricing. For
/// information about feature limitations, see the AWS Elemental MediaConvert
/// User Guide.
class AccelerationSettings {
  /// Acceleration configuration for the job.
  final String mode;

  AccelerationSettings({
    @required this.mode,
  });
  static AccelerationSettings fromJson(Map<String, dynamic> json) =>
      AccelerationSettings();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value AIFF.
class AiffSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  final int bitDepth;

  /// Specify the number of channels in this output audio track. Valid values
  /// are 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to
  /// 64.
  final int channels;

  /// Sample rate in hz.
  final int sampleRate;

  AiffSettings({
    this.bitDepth,
    this.channels,
    this.sampleRate,
  });
  static AiffSettings fromJson(Map<String, dynamic> json) => AiffSettings();
}

/// Settings for ancillary captions source.
class AncillarySourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through
  /// using the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final String convert608To708;

  /// Specifies the 608 channel number in the ancillary data track from which to
  /// extract captions. Unused for passthrough.
  final int sourceAncillaryChannelNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  final String terminateCaptions;

  AncillarySourceSettings({
    this.convert608To708,
    this.sourceAncillaryChannelNumber,
    this.terminateCaptions,
  });
  static AncillarySourceSettings fromJson(Map<String, dynamic> json) =>
      AncillarySourceSettings();
}

class AssociateCertificateResponse {
  AssociateCertificateResponse();
  static AssociateCertificateResponse fromJson(Map<String, dynamic> json) =>
      AssociateCertificateResponse();
}

/// Audio codec settings (CodecSettings) under (AudioDescriptions) contains the
/// group of settings related to audio encoding. The settings in this group vary
/// depending on the value that you choose for Audio codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * AAC, AacSettings *
/// MP2, Mp2Settings * WAV, WavSettings * AIFF, AiffSettings * AC3, Ac3Settings
/// * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings
class AudioCodecSettings {
  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AAC. The service accepts one of two mutually exclusive groups of
  /// AAC settings--VBR and CBR. To select one of these modes, set the value of
  /// Bitrate control mode (rateControlMode) to "VBR" or "CBR". In VBR mode, you
  /// control the audio quality with the setting VBR quality (vbrQuality). In
  /// CBR mode, you use the setting Bitrate (bitrate). Defaults and valid values
  /// depend on the rate control mode.
  final AacSettings aacSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AC3.
  final Ac3Settings ac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value AIFF.
  final AiffSettings aiffSettings;

  /// Type of Audio codec.
  final String codec;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3_ATMOS.
  final Eac3AtmosSettings eac3AtmosSettings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value EAC3.
  final Eac3Settings eac3Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value MP2.
  final Mp2Settings mp2Settings;

  /// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
  /// the value WAV.
  final WavSettings wavSettings;

  AudioCodecSettings({
    this.aacSettings,
    this.ac3Settings,
    this.aiffSettings,
    this.codec,
    this.eac3AtmosSettings,
    this.eac3Settings,
    this.mp2Settings,
    this.wavSettings,
  });
  static AudioCodecSettings fromJson(Map<String, dynamic> json) =>
      AudioCodecSettings();
}

/// Description of audio output
class AudioDescription {
  /// Advanced audio normalization settings. Ignore these settings unless you
  /// need to comply with a loudness standard.
  final AudioNormalizationSettings audioNormalizationSettings;

  /// Specifies which audio data to use from each input. In the simplest case,
  /// specify an "Audio Selector":#inputs-audio_selector by name based on its
  /// order within each input. For example if you specify "Audio Selector 3",
  /// then the third audio selector will be used from each input. If an input
  /// does not have an "Audio Selector 3", then the audio selector marked as
  /// "default" in that input will be used. If there is no audio selector marked
  /// as "default", silence will be inserted for the duration of that input.
  /// Alternatively, an "Audio Selector Group":#inputs-audio_selector_group name
  /// may be specified, with similar default/silence behavior. If no
  /// audio_source_name is specified, then "Audio Selector 1" will be chosen
  /// automatically.
  final String audioSourceName;

  /// Applies only if Follow Input Audio Type is unchecked (false). A number
  /// between 0 and 255. The following are defined in ISO-IEC 13818-1: 0 =
  /// Undefined, 1 = Clean Effects, 2 = Hearing Impaired, 3 = Visually Impaired
  /// Commentary, 4-255 = Reserved.
  final int audioType;

  /// When set to FOLLOW_INPUT, if the input contains an ISO 639 audio_type,
  /// then that value is passed through to the output. If the input contains no
  /// ISO 639 audio_type, the value in Audio Type is included in the output.
  /// Otherwise the value in Audio Type is included in the output. Note that
  /// this field and audioType are both ignored if
  /// audioDescriptionBroadcasterMix is set to BROADCASTER_MIXED_AD.
  final String audioTypeControl;

  /// Audio codec settings (CodecSettings) under (AudioDescriptions) contains
  /// the group of settings related to audio encoding. The settings in this
  /// group vary depending on the value that you choose for Audio codec (Codec).
  /// For each codec enum that you choose, define the corresponding settings
  /// object. The following lists the codec enum, settings object pairs. * AAC,
  /// AacSettings * MP2, Mp2Settings * WAV, WavSettings * AIFF, AiffSettings *
  /// AC3, Ac3Settings * EAC3, Eac3Settings * EAC3_ATMOS, Eac3AtmosSettings
  final AudioCodecSettings codecSettings;

  /// Specify the language for this audio output track, using the ISO 639-2 or
  /// ISO 639-3 three-letter language code. The language specified will be used
  /// when 'Follow Input Language Code' is not selected or when 'Follow Input
  /// Language Code' is selected but there is no ISO 639 language code specified
  /// by the input.
  final String customLanguageCode;

  /// Indicates the language of the audio output track. The ISO 639 language
  /// specified in the 'Language Code' drop down will be used when 'Follow Input
  /// Language Code' is not selected or when 'Follow Input Language Code' is
  /// selected but there is no ISO 639 language code specified by the input.
  final String languageCode;

  /// Choosing FOLLOW_INPUT will cause the ISO 639 language code of the output
  /// to follow the ISO 639 language code of the input. The language specified
  /// for languageCode' will be used when USE_CONFIGURED is selected or when
  /// FOLLOW_INPUT is selected but there is no ISO 639 language code specified
  /// by the input.
  final String languageCodeControl;

  /// Advanced audio remixing settings.
  final RemixSettings remixSettings;

  /// Specify a label for this output audio stream. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the
  /// service ignores this setting.
  final String streamName;

  AudioDescription({
    this.audioNormalizationSettings,
    this.audioSourceName,
    this.audioType,
    this.audioTypeControl,
    this.codecSettings,
    this.customLanguageCode,
    this.languageCode,
    this.languageCodeControl,
    this.remixSettings,
    this.streamName,
  });
  static AudioDescription fromJson(Map<String, dynamic> json) =>
      AudioDescription();
}

/// Advanced audio normalization settings. Ignore these settings unless you need
/// to comply with a loudness standard.
class AudioNormalizationSettings {
  /// Choose one of the following audio normalization algorithms: ITU-R
  /// BS.1770-1: Ungated loudness. A measurement of ungated average loudness for
  /// an entire piece of content, suitable for measurement of short-form content
  /// under ATSC recommendation A/85. Supports up to 5.1 audio channels. ITU-R
  /// BS.1770-2: Gated loudness. A measurement of gated average loudness
  /// compliant with the requirements of EBU-R128. Supports up to 5.1 audio
  /// channels. ITU-R BS.1770-3: Modified peak. The same loudness measurement
  /// algorithm as 1770-2, with an updated true peak measurement. ITU-R
  /// BS.1770-4: Higher channel count. Allows for more audio channels than the
  /// other algorithms, including configurations such as 7.1.
  final String algorithm;

  /// When enabled the output audio is corrected using the chosen algorithm. If
  /// disabled, the audio will be measured but not adjusted.
  final String algorithmControl;

  /// Content measuring above this level will be corrected to the target level.
  /// Content measuring below this level will not be corrected. Gating only
  /// applies when not using real_time_correction.
  final int correctionGateLevel;

  /// If set to LOG, log each output's audio track loudness to a CSV file.
  final String loudnessLogging;

  /// If set to TRUE_PEAK, calculate and log the TruePeak for each output's
  /// audio track loudness.
  final String peakCalculation;

  /// When you use Audio normalization (AudioNormalizationSettings), optionally
  /// use this setting to specify a target loudness. If you don't specify a
  /// value here, the encoder chooses a value for you, based on the algorithm
  /// that you choose for Algorithm (algorithm). If you choose algorithm 1770-1,
  /// the encoder will choose -24 LKFS; otherwise, the encoder will choose -23
  /// LKFS.
  final double targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.correctionGateLevel,
    this.loudnessLogging,
    this.peakCalculation,
    this.targetLkfs,
  });
  static AudioNormalizationSettings fromJson(Map<String, dynamic> json) =>
      AudioNormalizationSettings();
}

/// Selector for Audio
class AudioSelector {
  /// Selects a specific language code from within an audio source, using the
  /// ISO 639-2 or ISO 639-3 three-letter language code
  final String customLanguageCode;

  /// Enable this setting on one audio selector to set it as the default for the
  /// job. The service uses this default for outputs where it can't find the
  /// specified input audio. If you don't set a default, those outputs have no
  /// audio.
  final String defaultSelection;

  /// Specifies audio data from an external file source.
  final String externalAudioFileInput;

  /// Selects a specific language code from within an audio source.
  final String languageCode;

  /// Specifies a time delta in milliseconds to offset the audio from the input
  /// video.
  final int offset;

  /// Selects a specific PID from within an audio source (e.g. 257 selects PID
  /// 0x101).
  final List<int> pids;

  /// Use this setting for input streams that contain Dolby E, to have the
  /// service extract specific program data from the track. To select multiple
  /// programs, create multiple selectors with the same Track and different
  /// Program numbers. In the console, this setting is visible when you set
  /// Selector type to Track. Choose the program number from the dropdown list.
  /// If you are sending a JSON file, provide the program ID, which is part of
  /// the audio metadata. If your input file has incorrect metadata, you can
  /// choose All channels instead of a program number to have the service ignore
  /// the program IDs and include all the programs in the track.
  final int programSelection;

  /// Use these settings to reorder the audio channels of one input to match
  /// those of another input. This allows you to combine the two files into a
  /// single output, one after the other.
  final RemixSettings remixSettings;

  /// Specifies the type of the audio selector.
  final String selectorType;

  /// Identify a track from the input audio to include in this selector by
  /// entering the track index number. To include several tracks in a single
  /// audio selector, specify multiple tracks as follows. Using the console,
  /// enter a comma-separated list. For examle, type "1,2,3" to include tracks 1
  /// through 3. Specifying directly in your JSON job file, provide the track
  /// numbers in an array. For example, "tracks": [1,2,3].
  final List<int> tracks;

  AudioSelector({
    this.customLanguageCode,
    this.defaultSelection,
    this.externalAudioFileInput,
    this.languageCode,
    this.offset,
    this.pids,
    this.programSelection,
    this.remixSettings,
    this.selectorType,
    this.tracks,
  });
  static AudioSelector fromJson(Map<String, dynamic> json) => AudioSelector();
}

/// Group of Audio Selectors
class AudioSelectorGroup {
  /// Name of an Audio Selector within the same input to include in the group.
  /// Audio selector names are standardized, based on their order within the
  /// input (e.g., "Audio Selector 1"). The audio selector name parameter can be
  /// repeated to add any number of audio selectors to the group.
  final List<String> audioSelectorNames;

  AudioSelectorGroup({
    this.audioSelectorNames,
  });
  static AudioSelectorGroup fromJson(Map<String, dynamic> json) =>
      AudioSelectorGroup();
}

/// Settings for Avail Blanking
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  final String availBlankingImage;

  AvailBlanking({
    this.availBlankingImage,
  });
  static AvailBlanking fromJson(Map<String, dynamic> json) => AvailBlanking();
}

/// Burn-In Destination Settings.
class BurninDestinationSettings {
  /// If no explicit x_position or y_position is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. This option is not valid for source
  /// captions that are STL, 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final String alignment;

  /// Specifies the color of the rectangle behind the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid
  /// for source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  final String fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent. All burn-in and DVB-Sub font settings must match.
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and
  /// DVB-Sub font settings must match.
  final int fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the
  /// LanguageCode is not sufficient for determining the script type. Where
  /// LanguageCode or CustomLanguageCode is sufficient, use "AUTOMATIC" or leave
  /// unset. This is used to help determine the appropriate font for rendering
  /// burn-in captions.
  final String fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  final int fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final String outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings
  /// are already pre-defined by the caption stream. All burn-in and DVB-Sub
  /// font settings must match.
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the
  /// left. All burn-in and DVB-Sub font settings must match.
  final int shadowxOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  final int shadowyOffset;

  /// Only applies to jobs with input captions in Teletext or STL formats.
  /// Specify whether the spacing between letters in your captions is set by the
  /// captions grid or varies depending on letter width. Choose fixed grid to
  /// conform to the spacing specified in the captions file more accurately.
  /// Choose proportional to make the text easier to read if the captions are
  /// closed caption.
  final String teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions
  /// starting 10 pixels from the left of the output. If no explicit x_position
  /// is provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This
  /// option is not valid for source captions that are STL, 608/embedded or
  /// teletext. These source settings are already pre-defined by the caption
  /// stream. All burn-in and DVB-Sub font settings must match.
  final int yPosition;

  BurninDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontScript,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowxOffset,
    this.shadowyOffset,
    this.teletextSpacing,
    this.xPosition,
    this.yPosition,
  });
  static BurninDestinationSettings fromJson(Map<String, dynamic> json) =>
      BurninDestinationSettings();
}

class CancelJobResponse {
  CancelJobResponse();
  static CancelJobResponse fromJson(Map<String, dynamic> json) =>
      CancelJobResponse();
}

/// Description of Caption output
class CaptionDescription {
  /// Specifies which "Caption Selector":#inputs-caption_selector to use from
  /// each input when generating captions. The name should be of the format
  /// "Caption Selector ", which denotes that the Nth Caption Selector will be
  /// used from each input.
  final String captionSelectorName;

  /// Indicates the language of the caption output track, using the ISO 639-2 or
  /// ISO 639-3 three-letter language code. For most captions output formats,
  /// the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the
  /// encoder uses this language information to choose the font language for
  /// rendering the captions text.
  final String customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  final CaptionDestinationSettings destinationSettings;

  /// Specify the language of this captions output track. For most captions
  /// output formats, the encoder puts this language information in the output
  /// captions metadata. If your output captions format is DVB-Sub or Burn in,
  /// the encoder uses this language information to choose the font language for
  /// rendering the captions text.
  final String languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the
  /// service ignores this setting.
  final String languageDescription;

  CaptionDescription({
    this.captionSelectorName,
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  static CaptionDescription fromJson(Map<String, dynamic> json) =>
      CaptionDescription();
}

/// Caption Description for preset
class CaptionDescriptionPreset {
  /// Indicates the language of the caption output track, using the ISO 639-2 or
  /// ISO 639-3 three-letter language code. For most captions output formats,
  /// the encoder puts this language information in the output captions
  /// metadata. If your output captions format is DVB-Sub or Burn in, the
  /// encoder uses this language information to choose the font language for
  /// rendering the captions text.
  final String customLanguageCode;

  /// Specific settings required by destination type. Note that
  /// burnin_destination_settings are not available if the source of the caption
  /// data is Embedded or Teletext.
  final CaptionDestinationSettings destinationSettings;

  /// Specify the language of this captions output track. For most captions
  /// output formats, the encoder puts this language information in the output
  /// captions metadata. If your output captions format is DVB-Sub or Burn in,
  /// the encoder uses this language information to choose the font language for
  /// rendering the captions text.
  final String languageCode;

  /// Specify a label for this set of output captions. For example, "English",
  /// "Director commentary", or "track_2". For streaming outputs, MediaConvert
  /// passes this information into destination manifests for display on the
  /// end-viewer's player device. For outputs in other output groups, the
  /// service ignores this setting.
  final String languageDescription;

  CaptionDescriptionPreset({
    this.customLanguageCode,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  static CaptionDescriptionPreset fromJson(Map<String, dynamic> json) =>
      CaptionDescriptionPreset();
}

/// Specific settings required by destination type. Note that
/// burnin_destination_settings are not available if the source of the caption
/// data is Embedded or Teletext.
class CaptionDestinationSettings {
  /// Burn-In Destination Settings.
  final BurninDestinationSettings burninDestinationSettings;

  /// Specify the format for this set of captions on this output. The default
  /// format is embedded without SCTE-20. Other options are embedded with
  /// SCTE-20, burn-in, DVB-sub, IMSC, SCC, SRT, teletext, TTML, and web-VTT. If
  /// you are using SCTE-20, choose SCTE-20 plus embedded (SCTE20_PLUS_EMBEDDED)
  /// to create an output that complies with the SCTE-43 spec. To create a
  /// non-compliant output where the embedded captions come first, choose
  /// Embedded plus SCTE-20 (EMBEDDED_PLUS_SCTE20).
  final String destinationType;

  /// DVB-Sub Destination Settings
  final DvbSubDestinationSettings dvbSubDestinationSettings;

  /// Settings specific to embedded/ancillary caption outputs, including 608/708
  /// Channel destination number.
  final EmbeddedDestinationSettings embeddedDestinationSettings;

  /// Settings specific to IMSC caption outputs.
  final ImscDestinationSettings imscDestinationSettings;

  /// Settings for SCC caption output.
  final SccDestinationSettings sccDestinationSettings;

  /// Settings for Teletext caption output
  final TeletextDestinationSettings teletextDestinationSettings;

  /// Settings specific to TTML caption outputs, including Pass style
  /// information (TtmlStylePassthrough).
  final TtmlDestinationSettings ttmlDestinationSettings;

  CaptionDestinationSettings({
    this.burninDestinationSettings,
    this.destinationType,
    this.dvbSubDestinationSettings,
    this.embeddedDestinationSettings,
    this.imscDestinationSettings,
    this.sccDestinationSettings,
    this.teletextDestinationSettings,
    this.ttmlDestinationSettings,
  });
  static CaptionDestinationSettings fromJson(Map<String, dynamic> json) =>
      CaptionDestinationSettings();
}

/// Set up captions in your outputs by first selecting them from your input
/// here.
class CaptionSelector {
  /// The specific language to extract from source, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code. If input is SCTE-27, complete this field
  /// and/or PID to select the caption language to extract. If input is DVB-Sub
  /// and output is Burn-in or SMPTE-TT, complete this field and/or PID to
  /// select the caption language to extract. If input is DVB-Sub that is being
  /// passed through, omit this field (and PID field); there is no way to
  /// extract a specific language with pass-through captions.
  final String customLanguageCode;

  /// The specific language to extract from source. If input is SCTE-27,
  /// complete this field and/or PID to select the caption language to extract.
  /// If input is DVB-Sub and output is Burn-in or SMPTE-TT, complete this field
  /// and/or PID to select the caption language to extract. If input is DVB-Sub
  /// that is being passed through, omit this field (and PID field); there is no
  /// way to extract a specific language with pass-through captions.
  final String languageCode;

  /// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml
  /// file, specify the URI of the input captions source file. If your input
  /// captions are IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  final CaptionSourceSettings sourceSettings;

  CaptionSelector({
    this.customLanguageCode,
    this.languageCode,
    this.sourceSettings,
  });
  static CaptionSelector fromJson(Map<String, dynamic> json) =>
      CaptionSelector();
}

/// If your input captions are SCC, TTML, STL, SMI, SRT, or IMSC in an xml file,
/// specify the URI of the input captions source file. If your input captions
/// are IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
class CaptionSourceSettings {
  /// Settings for ancillary captions source.
  final AncillarySourceSettings ancillarySourceSettings;

  /// DVB Sub Source Settings
  final DvbSubSourceSettings dvbSubSourceSettings;

  /// Settings for embedded captions Source
  final EmbeddedSourceSettings embeddedSourceSettings;

  /// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
  /// file, specify the URI of the input caption source file. If your caption
  /// source is IMSC in an IMF package, use TrackSourceSettings instead of
  /// FileSoureSettings.
  final FileSourceSettings fileSourceSettings;

  /// Use Source (SourceType) to identify the format of your input captions. The
  /// service cannot auto-detect caption format.
  final String sourceType;

  /// Settings specific to Teletext caption sources, including Page number.
  final TeletextSourceSettings teletextSourceSettings;

  /// Settings specific to caption sources that are specified by track number.
  /// Currently, this is only IMSC captions in an IMF package. If your caption
  /// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead
  /// of TrackSourceSettings.
  final TrackSourceSettings trackSourceSettings;

  CaptionSourceSettings({
    this.ancillarySourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.fileSourceSettings,
    this.sourceType,
    this.teletextSourceSettings,
    this.trackSourceSettings,
  });
  static CaptionSourceSettings fromJson(Map<String, dynamic> json) =>
      CaptionSourceSettings();
}

/// Channel mapping (ChannelMapping) contains the group of fields that hold the
/// remixing value for each channel. Units are in dB. Acceptable values are
/// within the range from -60 (mute) through 6. A setting of 0 passes the input
/// channel unchanged to the output channel (no attenuation or amplification).
class ChannelMapping {
  /// List of output channels
  final List<OutputChannelMapping> outputChannels;

  ChannelMapping({
    this.outputChannels,
  });
  static ChannelMapping fromJson(Map<String, dynamic> json) => ChannelMapping();
}

/// Settings for CMAF encryption
class CmafEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  final String constantInitializationVector;

  /// Specify the encryption scheme that you want the service to use when
  /// encrypting your CMAF segments. Choose AES-CBC subsample (SAMPLE-AES) or
  /// AES_CTR (AES-CTR).
  final String encryptionMethod;

  /// When you use DRM with CMAF outputs, choose whether the service writes the
  /// 128-bit encryption initialization vector in the HLS and DASH manifests.
  final String initializationVectorInManifest;

  /// If your output group type is CMAF, use these settings when doing DRM
  /// encryption with a SPEKE-compliant key provider. If your output group type
  /// is HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings
  /// instead.
  final SpekeKeyProviderCmaf spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  final StaticKeyProvider staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  final String type;

  CmafEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  static CmafEncryptionSettings fromJson(Map<String, dynamic> json) =>
      CmafEncryptionSettings();
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
/// single video, audio, or caption output.
class CmafGroupSettings {
  /// A partial URI prefix that will be put in the manifest file at the top
  /// level BaseURL element. Can be used if streams are delivered from a
  /// different URL than the manifest file.
  final String baseUrl;

  /// When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client
  /// from saving media segments for later replay.
  final String clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8
  /// playlist generation.
  final String codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do
  /// not specify the base filename in the URI, the service will use the
  /// filename of the input file. If your job has multiple inputs, the service
  /// uses the filename of the first input file.
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings destinationSettings;

  /// DRM settings.
  final CmafEncryptionSettings encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on
  /// the next keyframe after this number of seconds, so actual fragment length
  /// may be longer. When Emit Single File is checked, the fragmentation is
  /// internal to a single output file and it does not cause the creation of
  /// many output files as in other output types.
  final int fragmentLength;

  /// When set to GZIP, compresses HLS playlist.
  final String manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  final String manifestDurationFormat;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  final int minBufferTime;

  /// Keep this setting at the default value of 0, unless you are
  /// troubleshooting a problem with how devices play back the end of your video
  /// asset. If you know that player devices are hanging on the final segment of
  /// your video because the length of your final segment is too short, use this
  /// setting to specify a minimum final segment length, in seconds. Choose a
  /// value that is greater than or equal to 1 and less than your segment
  /// length. When you specify a value for this setting, the encoder will
  /// combine any final segment that is shorter than the length that you specify
  /// with the previous segment. For example, your segment length is 3 seconds
  /// and your final segment is .5 seconds without a minimum final segment
  /// length; when you set the minimum final segment length to 1, your final
  /// segment is 3.5 seconds.
  final double minFinalSegmentLength;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When
  /// set to SEGMENTED_FILES, separate segment files will be created.
  final String segmentControl;

  /// Use this setting to specify the length, in seconds, of each individual
  /// CMAF segment. This value applies to the whole package; that is, to every
  /// output in the output group. Note that segments end on the first keyframe
  /// after this number of seconds, so the actual segment length might be
  /// slightly longer. If you set Segment control (CmafSegmentControl) to single
  /// file, the service puts the content of each output in a single file that
  /// has metadata that marks these segments. If you set it to segmented files,
  /// the service creates multiple files for each output, each with the content
  /// of one segment.
  final int segmentLength;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag
  /// of variant manifest.
  final String streamInfResolution;

  /// When set to ENABLED, a DASH MPD manifest will be generated for this
  /// output.
  final String writeDashManifest;

  /// When set to ENABLED, an Apple HLS manifest will be generated for this
  /// output.
  final String writeHlsManifest;

  CmafGroupSettings({
    this.baseUrl,
    this.clientCache,
    this.codecSpecification,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minBufferTime,
    this.minFinalSegmentLength,
    this.segmentControl,
    this.segmentLength,
    this.streamInfResolution,
    this.writeDashManifest,
    this.writeHlsManifest,
  });
  static CmafGroupSettings fromJson(Map<String, dynamic> json) =>
      CmafGroupSettings();
}

/// Settings for color correction.
class ColorCorrector {
  /// Brightness level.
  final int brightness;

  /// Specify the color space you want for this output. The service supports
  /// conversion between HDR formats, between SDR formats, and from SDR to HDR.
  /// The service doesn't support conversion from HDR to SDR. SDR to HDR
  /// conversion doesn't upgrade the dynamic range. The converted video has an
  /// HDR format, but visually appears the same as an unconverted output.
  final String colorSpaceConversion;

  /// Contrast level.
  final int contrast;

  /// Use these settings when you convert to the HDR 10 color space. Specify the
  /// SMPTE ST 2086 Mastering Display Color Volume static metadata that you want
  /// signaled in the output. These values don't affect the pixel values that
  /// are encoded in the video stream. They are intended to help the downstream
  /// video player display content in a way that reflects the intentions of the
  /// the content creator. When you set Color space conversion
  /// (ColorSpaceConversion) to HDR 10 (FORCE_HDR10), these settings are
  /// required. You must set values for Max frame average light level
  /// (maxFrameAverageLightLevel) and Max content light level
  /// (maxContentLightLevel); these settings don't have a default value. The
  /// default values for the other HDR 10 metadata settings are defined by the
  /// P3D65 color space. For more information about MediaConvert HDR jobs, see
  /// https://docs.aws.amazon.com/console/mediaconvert/hdr.
  final Hdr10Metadata hdr10Metadata;

  /// Hue in degrees.
  final int hue;

  /// Saturation level.
  final int saturation;

  ColorCorrector({
    this.brightness,
    this.colorSpaceConversion,
    this.contrast,
    this.hdr10Metadata,
    this.hue,
    this.saturation,
  });
  static ColorCorrector fromJson(Map<String, dynamic> json) => ColorCorrector();
}

/// Container specific settings.
class ContainerSettings {
  /// Container for this output. Some containers require a container settings
  /// object. If not specified, the default object will be created.
  final String container;

  /// Settings for F4v container
  final F4vSettings f4vSettings;

  /// MPEG-2 TS container settings. These apply to outputs in a File output
  /// group when the output's container (ContainerType) is MPEG-2 Transport
  /// Stream (M2TS). In these assets, data is organized by the program map table
  /// (PMT). Each transport stream program contains subsets of data, including
  /// audio, video, and metadata. Each of these subsets of data has a numerical
  /// label called a packet identifier (PID). Each transport stream program
  /// corresponds to one MediaConvert output. The PMT lists the types of data in
  /// a program along with their PID. Downstream systems and players use the
  /// program map table to look up the PID for each type of data it accesses and
  /// then uses the PIDs to locate specific data within the asset.
  final M2TsSettings m2TsSettings;

  /// Settings for TS segments in HLS
  final M3U8Settings m3U8Settings;

  /// Settings for MOV Container.
  final MovSettings movSettings;

  /// Settings for MP4 container. You can create audio-only AAC outputs with
  /// this container.
  final Mp4Settings mp4Settings;

  ContainerSettings({
    this.container,
    this.f4vSettings,
    this.m2TsSettings,
    this.m3U8Settings,
    this.movSettings,
    this.mp4Settings,
  });
  static ContainerSettings fromJson(Map<String, dynamic> json) =>
      ContainerSettings();
}

class CreateJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final Job job;

  CreateJobResponse({
    this.job,
  });
  static CreateJobResponse fromJson(Map<String, dynamic> json) =>
      CreateJobResponse();
}

class CreateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate jobTemplate;

  CreateJobTemplateResponse({
    this.jobTemplate,
  });
  static CreateJobTemplateResponse fromJson(Map<String, dynamic> json) =>
      CreateJobTemplateResponse();
}

class CreatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that
  /// you want MediaConvert to apply to the output during the conversion
  /// process.
  final Preset preset;

  CreatePresetResponse({
    this.preset,
  });
  static CreatePresetResponse fromJson(Map<String, dynamic> json) =>
      CreatePresetResponse();
}

class CreateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you
  /// don't specify a queue, the service sends all jobs through the default
  /// queue. For more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue queue;

  CreateQueueResponse({
    this.queue,
  });
  static CreateQueueResponse fromJson(Map<String, dynamic> json) =>
      CreateQueueResponse();
}

/// Specifies DRM settings for DASH outputs.
class DashIsoEncryptionSettings {
  /// This setting can improve the compatibility of your output with video
  /// players on obsolete devices. It applies only to DASH H.264 outputs with
  /// DRM encryption. Choose Unencrypted SEI (UNENCRYPTED_SEI) only to correct
  /// problems with playback on older devices. Otherwise, keep the default
  /// setting CENC v1 (CENC_V1). If you choose Unencrypted SEI, for that output,
  /// the service will exclude the access unit delimiter and will leave the SEI
  /// NAL units unencrypted.
  final String playbackDeviceCompatibility;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider. If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider spekeKeyProvider;

  DashIsoEncryptionSettings({
    this.playbackDeviceCompatibility,
    this.spekeKeyProvider,
  });
  static DashIsoEncryptionSettings fromJson(Map<String, dynamic> json) =>
      DashIsoEncryptionSettings();
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// DASH_ISO_GROUP_SETTINGS.
class DashIsoGroupSettings {
  /// A partial URI prefix that will be put in the manifest (.mpd) file at the
  /// top level BaseURL element. Can be used if streams are delivered from a
  /// different URL than the manifest file.
  final String baseUrl;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do
  /// not specify the base filename in the URI, the service will use the
  /// filename of the input file. If your job has multiple inputs, the service
  /// uses the filename of the first input file.
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings destinationSettings;

  /// DRM settings.
  final DashIsoEncryptionSettings encryption;

  /// Length of fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and Framerate. Note that fragments will end on
  /// the next keyframe after this number of seconds, so actual fragment length
  /// may be longer. When Emit Single File is checked, the fragmentation is
  /// internal to a single output file and it does not cause the creation of
  /// many output files as in other output types.
  final int fragmentLength;

  /// Supports HbbTV specification as indicated
  final String hbbtvCompliance;

  /// Minimum time of initially buffered media that is needed to ensure smooth
  /// playout.
  final int minBufferTime;

  /// When set to SINGLE_FILE, a single output file is generated, which is
  /// internally segmented using the Fragment Length and Segment Length. When
  /// set to SEGMENTED_FILES, separate segment files will be created.
  final String segmentControl;

  /// Length of mpd segments to create (in seconds). Note that segments will end
  /// on the next keyframe after this number of seconds, so actual segment
  /// length may be longer. When Emit Single File is checked, the segmentation
  /// is internal to a single output file and it does not cause the creation of
  /// many output files as in other output types.
  final int segmentLength;

  /// When you enable Precise segment duration in manifests
  /// (writeSegmentTimelineInRepresentation), your DASH manifest shows precise
  /// segment durations. The segment duration information appears inside the
  /// SegmentTimeline element, inside SegmentTemplate at the Representation
  /// level. When this feature isn't enabled, the segment durations in your DASH
  /// manifest are approximate. The segment duration information appears in the
  /// duration attribute of the SegmentTemplate element.
  final String writeSegmentTimelineInRepresentation;

  DashIsoGroupSettings({
    this.baseUrl,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.hbbtvCompliance,
    this.minBufferTime,
    this.segmentControl,
    this.segmentLength,
    this.writeSegmentTimelineInRepresentation,
  });
  static DashIsoGroupSettings fromJson(Map<String, dynamic> json) =>
      DashIsoGroupSettings();
}

/// Settings for deinterlacer
class Deinterlacer {
  /// Only applies when you set Deinterlacer (DeinterlaceMode) to Deinterlace
  /// (DEINTERLACE) or Adaptive (ADAPTIVE). Motion adaptive interpolate
  /// (INTERPOLATE) produces sharper pictures, while blend (BLEND) produces
  /// smoother motion. Use (INTERPOLATE_TICKER) OR (BLEND_TICKER) if your source
  /// file includes a ticker, such as a scrolling headline at the bottom of the
  /// frame.
  final String algorithm;

  /// - When set to NORMAL (default), the deinterlacer does not convert frames
  /// that are tagged in metadata as progressive. It will only convert those
  /// that are tagged as some other type. - When set to FORCE_ALL_FRAMES, the
  /// deinterlacer converts every frame to progressive - even those that are
  /// already tagged as progressive. Turn Force mode on only if there is a good
  /// chance that the metadata has tagged frames as progressive when they are
  /// not progressive. Do not turn on otherwise; processing frames that are
  /// already progressive into progressive will probably result in lower quality
  /// video.
  final String control;

  /// Use Deinterlacer (DeinterlaceMode) to choose how the service will do
  /// deinterlacing. Default is Deinterlace. - Deinterlace converts interlaced
  /// to progressive. - Inverse telecine converts Hard Telecine 29.97i to
  /// progressive 23.976p. - Adaptive auto-detects and converts to progressive.
  final String mode;

  Deinterlacer({
    this.algorithm,
    this.control,
    this.mode,
  });
  static Deinterlacer fromJson(Map<String, dynamic> json) => Deinterlacer();
}

class DeleteJobTemplateResponse {
  DeleteJobTemplateResponse();
  static DeleteJobTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeleteJobTemplateResponse();
}

class DeletePresetResponse {
  DeletePresetResponse();
  static DeletePresetResponse fromJson(Map<String, dynamic> json) =>
      DeletePresetResponse();
}

class DeleteQueueResponse {
  DeleteQueueResponse();
  static DeleteQueueResponse fromJson(Map<String, dynamic> json) =>
      DeleteQueueResponse();
}

class DescribeEndpointsResponse {
  /// List of endpoints
  final List<Endpoint> endpoints;

  /// Use this string to request the next batch of endpoints.
  final String nextToken;

  DescribeEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });
  static DescribeEndpointsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointsResponse();
}

/// Settings associated with the destination. Will vary based on the type of
/// destination
class DestinationSettings {
  /// Settings associated with S3 destination
  final S3DestinationSettings s3Settings;

  DestinationSettings({
    this.s3Settings,
  });
  static DestinationSettings fromJson(Map<String, dynamic> json) =>
      DestinationSettings();
}

class DisassociateCertificateResponse {
  DisassociateCertificateResponse();
  static DisassociateCertificateResponse fromJson(Map<String, dynamic> json) =>
      DisassociateCertificateResponse();
}

/// Inserts DVB Network Information Table (NIT) at the specified table
/// repetition interval.
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  final int networkId;

  /// The network name text placed in the network_name_descriptor inside the
  /// Network Information Table. Maximum length is 256 characters.
  final String networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int nitInterval;

  DvbNitSettings({
    this.networkId,
    this.networkName,
    this.nitInterval,
  });
  static DvbNitSettings fromJson(Map<String, dynamic> json) => DvbNitSettings();
}

/// Inserts DVB Service Description Table (NIT) at the specified table
/// repetition interval.
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream. "Follow
  /// input SDT" copies SDT information from input stream to output stream.
  /// "Follow input SDT if present" copies SDT information from input stream to
  /// output stream if SDT information is present in the input, otherwise it
  /// will fall back on the user-defined values. Enter "SDT Manually" means user
  /// will enter the SDT information. "No SDT" means output stream will not
  /// contain SDT information.
  final String outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int sdtInterval;

  /// The service name placed in the service_descriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String serviceName;

  /// The service provider name placed in the service_descriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.sdtInterval,
    this.serviceName,
    this.serviceProviderName,
  });
  static DvbSdtSettings fromJson(Map<String, dynamic> json) => DvbSdtSettings();
}

/// DVB-Sub Destination Settings
class DvbSubDestinationSettings {
  /// If no explicit x_position or y_position is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. This option is not valid for source
  /// captions that are STL, 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final String alignment;

  /// Specifies the color of the rectangle behind the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int backgroundOpacity;

  /// Specifies the color of the burned-in captions. This option is not valid
  /// for source captions that are STL, 608/embedded or teletext. These source
  /// settings are already pre-defined by the caption stream. All burn-in and
  /// DVB-Sub font settings must match.
  final String fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent. All burn-in and DVB-Sub font settings must match.
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi. All burn-in and
  /// DVB-Sub font settings must match.
  final int fontResolution;

  /// Provide the font script, using an ISO 15924 script code, if the
  /// LanguageCode is not sufficient for determining the script type. Where
  /// LanguageCode or CustomLanguageCode is sufficient, use "AUTOMATIC" or leave
  /// unset. This is used to help determine the appropriate font for rendering
  /// DVB-Sub captions.
  final String fontScript;

  /// A positive integer indicates the exact font size in points. Set to 0 for
  /// automatic font size selection. All burn-in and DVB-Sub font settings must
  /// match.
  final int fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final String outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings
  /// are already pre-defined by the caption stream. All burn-in and DVB-Sub
  /// font settings must match.
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the
  /// left. All burn-in and DVB-Sub font settings must match.
  final int shadowxOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  final int shadowyOffset;

  /// Only applies to jobs with input captions in Teletext or STL formats.
  /// Specify whether the spacing between letters in your captions is set by the
  /// captions grid or varies depending on letter width. Choose fixed grid to
  /// conform to the spacing specified in the captions file more accurately.
  /// Choose proportional to make the text easier to read if the captions are
  /// closed caption.
  final String teletextSpacing;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions
  /// starting 10 pixels from the left of the output. If no explicit x_position
  /// is provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit y_position is provided,
  /// the caption will be positioned towards the bottom of the output. This
  /// option is not valid for source captions that are STL, 608/embedded or
  /// teletext. These source settings are already pre-defined by the caption
  /// stream. All burn-in and DVB-Sub font settings must match.
  final int yPosition;

  DvbSubDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontScript,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowxOffset,
    this.shadowyOffset,
    this.teletextSpacing,
    this.xPosition,
    this.yPosition,
  });
  static DvbSubDestinationSettings fromJson(Map<String, dynamic> json) =>
      DvbSubDestinationSettings();
}

/// DVB Sub Source Settings
class DvbSubSourceSettings {
  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  final int pid;

  DvbSubSourceSettings({
    this.pid,
  });
  static DvbSubSourceSettings fromJson(Map<String, dynamic> json) =>
      DvbSubSourceSettings();
}

/// Inserts DVB Time and Date Table (TDT) at the specified table repetition
/// interval.
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int tdtInterval;

  DvbTdtSettings({
    this.tdtInterval,
  });
  static DvbTdtSettings fromJson(Map<String, dynamic> json) => DvbTdtSettings();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3_ATMOS.
class Eac3AtmosSettings {
  /// Specify the average bitrate in bits per second. Valid values: 384k, 448k,
  /// 640k, 768k
  final int bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits.
  /// For more information about the EAC3 bitstream mode, see ATSC A/52-2012
  /// (Annex E).
  final String bitstreamMode;

  /// The coding mode for Dolby Digital Plus JOC (Atmos) is always 9.1.6
  /// (CODING_MODE_9_1_6).
  final String codingMode;

  /// Enable Dolby Dialogue Intelligence to adjust loudness based on dialogue
  /// analysis.
  final String dialogueIntelligence;

  /// Specify the absolute peak level for a signal with dynamic range
  /// compression.
  final String dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing
  /// the audio.
  final String dynamicRangeCompressionRf;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right
  /// only center mix (Lo/Ro center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0,
  /// 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
  final double loRoCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left only/Right
  /// only (Lo/Ro surround). MediaConvert uses this value for downmixing. How
  /// the service uses this value depends on the value that you choose for
  /// Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5, -3.0, -4.5,
  /// -6.0, and -60. The value -60 mutes the channel.
  final double loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total center mix (Lt/Rt center). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: 3.0,
  /// 1.5, 0.0, -1.5, -3.0, -4.5, and -6.0.
  final double ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Atmos setting: Left total/Right
  /// total surround mix (Lt/Rt surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3AtmosStereoDownmix). Valid values: -1.5,
  /// -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
  final double ltRtSurroundMixLevel;

  /// Choose how the service meters the loudness of your audio.
  final String meteringMode;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int sampleRate;

  /// Specify the percentage of audio content that must be speech before the
  /// encoder uses the measured speech loudness as the overall program loudness.
  final int speechThreshold;

  /// Choose how the service does stereo downmixing.
  final String stereoDownmix;

  /// Specify whether your input audio has an additional center rear surround
  /// channel matrix encoded into your left and right surround channels.
  final String surroundExMode;

  Eac3AtmosSettings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialogueIntelligence,
    this.dynamicRangeCompressionLine,
    this.dynamicRangeCompressionRf,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.meteringMode,
    this.sampleRate,
    this.speechThreshold,
    this.stereoDownmix,
    this.surroundExMode,
  });
  static Eac3AtmosSettings fromJson(Map<String, dynamic> json) =>
      Eac3AtmosSettings();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value EAC3.
class Eac3Settings {
  /// If set to ATTENUATE_3_DB, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  final String attenuationControl;

  /// Specify the average bitrate in bits per second. Valid bitrates depend on
  /// the coding mode.
  final int bitrate;

  /// Specify the bitstream mode for the E-AC-3 stream that the encoder emits.
  /// For more information about the EAC3 bitstream mode, see ATSC A/52-2012
  /// (Annex E).
  final String bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  final String codingMode;

  /// Activates a DC highpass filter for all input channels.
  final String dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby
  /// Digital Plus, dialnorm will be passed through.
  final int dialnorm;

  /// Specify the absolute peak level for a signal with dynamic range
  /// compression.
  final String dynamicRangeCompressionLine;

  /// Specify how the service limits the audio dynamic range when compressing
  /// the audio.
  final String dynamicRangeCompressionRf;

  /// When encoding 3/2 audio, controls whether the LFE channel is enabled
  final String lfeControl;

  /// Applies a 120Hz lowpass filter to the LFE channel prior to encoding. Only
  /// valid with 3_2_LFE coding mode.
  final String lfeFilter;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only center mix (Lo/Ro center). MediaConvert uses this value
  /// for downmixing. How the service uses this value depends on the value that
  /// you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
  /// This setting applies only if you keep the default value of 3/2 - L, R, C,
  /// Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If
  /// you choose a different value for Coding mode, the service ignores Left
  /// only/Right only center (loRoCenterMixLevel).
  final double loRoCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// only/Right only (Lo/Ro surround). MediaConvert uses this value for
  /// downmixing. How the service uses this value depends on the value that you
  /// choose for Stereo downmix (Eac3StereoDownmix). Valid values: -1.5, -3.0,
  /// -4.5, -6.0, and -60. The value -60 mutes the channel. This setting applies
  /// only if you keep the default value of 3/2 - L, R, C, Ls, Rs
  /// (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// only/Right only surround (loRoSurroundMixLevel).
  final double loRoSurroundMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total center mix (Lt/Rt center). MediaConvert uses this value
  /// for downmixing. How the service uses this value depends on the value that
  /// you choose for Stereo downmix (Eac3StereoDownmix). Valid values: 3.0, 1.5,
  /// 0.0, -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel.
  /// This setting applies only if you keep the default value of 3/2 - L, R, C,
  /// Ls, Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If
  /// you choose a different value for Coding mode, the service ignores Left
  /// total/Right total center (ltRtCenterMixLevel).
  final double ltRtCenterMixLevel;

  /// Specify a value for the following Dolby Digital Plus setting: Left
  /// total/Right total surround mix (Lt/Rt surround). MediaConvert uses this
  /// value for downmixing. How the service uses this value depends on the value
  /// that you choose for Stereo downmix (Eac3StereoDownmix). Valid values:
  /// -1.5, -3.0, -4.5, -6.0, and -60. The value -60 mutes the channel. This
  /// setting applies only if you keep the default value of 3/2 - L, R, C, Ls,
  /// Rs (CODING_MODE_3_2) for the setting Coding mode (Eac3CodingMode). If you
  /// choose a different value for Coding mode, the service ignores Left
  /// total/Right total surround (ltRtSurroundMixLevel).
  final double ltRtSurroundMixLevel;

  /// When set to FOLLOW_INPUT, encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  final String metadataControl;

  /// When set to WHEN_POSSIBLE, input DD+ audio will be passed through if it is
  /// present on the input. this detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have
  /// a consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  final String passthroughControl;

  /// Controls the amount of phase-shift applied to the surround channels. Only
  /// used for 3/2 coding mode.
  final String phaseControl;

  /// This value is always 48000. It represents the sample rate in Hz.
  final int sampleRate;

  /// Choose how the service does stereo downmixing. This setting only applies
  /// if you keep the default value of 3/2 - L, R, C, Ls, Rs (CODING_MODE_3_2)
  /// for the setting Coding mode (Eac3CodingMode). If you choose a different
  /// value for Coding mode, the service ignores Stereo downmix
  /// (Eac3StereoDownmix).
  final String stereoDownmix;

  /// When encoding 3/2 audio, sets whether an extra center back surround
  /// channel is matrix encoded into the left and right surround channels.
  final String surroundExMode;

  /// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded
  /// into the two channels.
  final String surroundMode;

  Eac3Settings({
    this.attenuationControl,
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dcFilter,
    this.dialnorm,
    this.dynamicRangeCompressionLine,
    this.dynamicRangeCompressionRf,
    this.lfeControl,
    this.lfeFilter,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.metadataControl,
    this.passthroughControl,
    this.phaseControl,
    this.sampleRate,
    this.stereoDownmix,
    this.surroundExMode,
    this.surroundMode,
  });
  static Eac3Settings fromJson(Map<String, dynamic> json) => Eac3Settings();
}

/// Settings specific to embedded/ancillary caption outputs, including 608/708
/// Channel destination number.
class EmbeddedDestinationSettings {
  /// Ignore this setting unless your input captions are SCC format and your
  /// output captions are embedded in the video stream. Specify a CC number for
  /// each captions channel in this output. If you have two channels, choose CC
  /// numbers that aren't in the same field. For example, choose 1 and 3. For
  /// more information, see
  /// https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
  final int destination608ChannelNumber;

  /// Ignore this setting unless your input captions are SCC format and you want
  /// both 608 and 708 captions embedded in your output stream. Optionally,
  /// specify the 708 service number for each output captions channel. Choose a
  /// different number for each channel. To use this setting, also set Force 608
  /// to 708 upconvert (Convert608To708) to Upconvert (UPCONVERT) in your input
  /// captions selector settings. If you choose to upconvert but don't specify a
  /// 708 service number, MediaConvert uses the number that you specify for CC
  /// channel number (destination608ChannelNumber) for the 708 service number.
  /// For more information, see
  /// https://docs.aws.amazon.com/console/mediaconvert/dual-scc-to-embedded.
  final int destination708ServiceNumber;

  EmbeddedDestinationSettings({
    this.destination608ChannelNumber,
    this.destination708ServiceNumber,
  });
  static EmbeddedDestinationSettings fromJson(Map<String, dynamic> json) =>
      EmbeddedDestinationSettings();
}

/// Settings for embedded captions Source
class EmbeddedSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through
  /// using the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final String convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int source608ChannelNumber;

  /// Specifies the video track index used for extracting captions. The system
  /// only supports one input video track, so this should always be set to '1'.
  final int source608TrackNumber;

  /// By default, the service terminates any unterminated captions at the end of
  /// each input. If you want the caption to continue onto your next input,
  /// disable this setting.
  final String terminateCaptions;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
    this.source608TrackNumber,
    this.terminateCaptions,
  });
  static EmbeddedSourceSettings fromJson(Map<String, dynamic> json) =>
      EmbeddedSourceSettings();
}

/// Describes an account-specific API endpoint.
class Endpoint {
  /// URL of endpoint
  final String url;

  Endpoint({
    this.url,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint();
}

/// ESAM ManifestConfirmConditionNotification defined by
/// OC-SP-ESAM-API-I03-131025.
class EsamManifestConfirmConditionNotification {
  /// Provide your ESAM ManifestConfirmConditionNotification XML document inside
  /// your JSON job settings. Form the XML document as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder will use the Manifest
  /// Conditioning instructions in the message that you supply.
  final String mccXml;

  EsamManifestConfirmConditionNotification({
    this.mccXml,
  });
  static EsamManifestConfirmConditionNotification fromJson(
          Map<String, dynamic> json) =>
      EsamManifestConfirmConditionNotification();
}

/// Settings for Event Signaling And Messaging (ESAM). If you don't do ad
/// insertion, you can ignore these settings.
class EsamSettings {
  /// Specifies an ESAM ManifestConfirmConditionNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the manifest conditioning
  /// instructions that you provide in the setting MCC XML (mccXml).
  final EsamManifestConfirmConditionNotification
      manifestConfirmConditionNotification;

  /// Specifies the stream distance, in milliseconds, between the SCTE 35
  /// messages that the transcoder places and the splice points that they refer
  /// to. If the time between the start of the asset and the SCTE-35 message is
  /// less than this value, then the transcoder places the SCTE-35 marker at the
  /// beginning of the stream.
  final int responseSignalPreroll;

  /// Specifies an ESAM SignalProcessingNotification XML as per
  /// OC-SP-ESAM-API-I03-131025. The transcoder uses the signal processing
  /// instructions that you provide in the setting SCC XML (sccXml).
  final EsamSignalProcessingNotification signalProcessingNotification;

  EsamSettings({
    this.manifestConfirmConditionNotification,
    this.responseSignalPreroll,
    this.signalProcessingNotification,
  });
  static EsamSettings fromJson(Map<String, dynamic> json) => EsamSettings();
}

/// ESAM SignalProcessingNotification data defined by OC-SP-ESAM-API-I03-131025.
class EsamSignalProcessingNotification {
  /// Provide your ESAM SignalProcessingNotification XML document inside your
  /// JSON job settings. Form the XML document as per OC-SP-ESAM-API-I03-131025.
  /// The transcoder will use the signal processing instructions in the message
  /// that you supply. Provide your ESAM SignalProcessingNotification XML
  /// document inside your JSON job settings. For your MPEG2-TS file outputs, if
  /// you want the service to place SCTE-35 markers at the insertion points you
  /// specify in the XML document, you must also enable SCTE-35 ESAM
  /// (scte35Esam). Note that you can either specify an ESAM XML document or
  /// enable SCTE-35 passthrough. You can't do both.
  final String sccXml;

  EsamSignalProcessingNotification({
    this.sccXml,
  });
  static EsamSignalProcessingNotification fromJson(Map<String, dynamic> json) =>
      EsamSignalProcessingNotification();
}

/// Settings for F4v container
class F4vSettings {
  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the
  /// beginning of the archive as required for progressive downloading.
  /// Otherwise it is placed normally at the end.
  final String moovPlacement;

  F4vSettings({
    this.moovPlacement,
  });
  static F4vSettings fromJson(Map<String, dynamic> json) => F4vSettings();
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// FILE_GROUP_SETTINGS.
class FileGroupSettings {
  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do
  /// not specify the base filename in the URI, the service will use the
  /// filename of the input file. If your job has multiple inputs, the service
  /// uses the filename of the first input file.
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings destinationSettings;

  FileGroupSettings({
    this.destination,
    this.destinationSettings,
  });
  static FileGroupSettings fromJson(Map<String, dynamic> json) =>
      FileGroupSettings();
}

/// If your input captions are SCC, SMI, SRT, STL, TTML, or IMSC 1.1 in an xml
/// file, specify the URI of the input caption source file. If your caption
/// source is IMSC in an IMF package, use TrackSourceSettings instead of
/// FileSoureSettings.
class FileSourceSettings {
  /// Specify whether this set of input captions appears in your outputs in both
  /// 608 and 708 format. If you choose Upconvert (UPCONVERT), MediaConvert
  /// includes the captions data in two ways: it passes the 608 data through
  /// using the 608 compatibility bytes fields of the 708 wrapper, and it also
  /// translates the 608 data into 708.
  final String convert608To708;

  /// External caption file used for loading captions. Accepted file extensions
  /// are 'scc', 'ttml', 'dfxp', 'stl', 'srt', 'xml', and 'smi'.
  final String sourceFile;

  /// Specifies a time delta in seconds to offset the captions from the source
  /// file.
  final int timeDelta;

  FileSourceSettings({
    this.convert608To708,
    this.sourceFile,
    this.timeDelta,
  });
  static FileSourceSettings fromJson(Map<String, dynamic> json) =>
      FileSourceSettings();
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value FRAME_CAPTURE.
class FrameCaptureSettings {
  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.n.jpg where n is the 0-based sequence
  /// number of each Capture.
  final int framerateDenominator;

  /// Frame capture will encode the first frame of the output stream, then one
  /// frame every framerateDenominator/framerateNumerator seconds. For example,
  /// settings of framerateNumerator = 1 and framerateDenominator = 3 (a rate of
  /// 1/3 frame per second) will capture the first frame, then 1 frame every 3s.
  /// Files will be named as filename.NNNNNNN.jpg where N is the 0-based frame
  /// sequence number zero padded to 7 decimal places.
  final int framerateNumerator;

  /// Maximum number of captures (encoded jpg output files).
  final int maxCaptures;

  /// JPEG Quality - a higher value equals higher quality.
  final int quality;

  FrameCaptureSettings({
    this.framerateDenominator,
    this.framerateNumerator,
    this.maxCaptures,
    this.quality,
  });
  static FrameCaptureSettings fromJson(Map<String, dynamic> json) =>
      FrameCaptureSettings();
}

class GetJobResponse {
  /// Each job converts an input file into an output file or files. For more
  /// information, see the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final Job job;

  GetJobResponse({
    this.job,
  });
  static GetJobResponse fromJson(Map<String, dynamic> json) => GetJobResponse();
}

class GetJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate jobTemplate;

  GetJobTemplateResponse({
    this.jobTemplate,
  });
  static GetJobTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetJobTemplateResponse();
}

class GetPresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that
  /// you want MediaConvert to apply to the output during the conversion
  /// process.
  final Preset preset;

  GetPresetResponse({
    this.preset,
  });
  static GetPresetResponse fromJson(Map<String, dynamic> json) =>
      GetPresetResponse();
}

class GetQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you
  /// don't specify a queue, the service sends all jobs through the default
  /// queue. For more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue queue;

  GetQueueResponse({
    this.queue,
  });
  static GetQueueResponse fromJson(Map<String, dynamic> json) =>
      GetQueueResponse();
}

/// Settings for quality-defined variable bitrate encoding with the H.264 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
class H264QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  final int maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h264Settings. Specify the target quality level for
  /// this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9.
  final int qvbrQualityLevel;

  H264QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
  });
  static H264QvbrSettings fromJson(Map<String, dynamic> json) =>
      H264QvbrSettings();
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value H_264.
class H264Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final String adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int bitrate;

  /// Specify an H.264 level that is consistent with your output video settings.
  /// If you aren't sure what level to specify, choose Auto (AUTO).
  final String codecLevel;

  /// H.264 Profile. High 4:2:2 and 10-bit profiles are only available with the
  /// AVC-I License.
  final String codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion
  /// content. This will cause the service to use fewer B-frames (which infer
  /// information based on other frames) for high-motion portions of the video
  /// and more B-frames for low-motion portions. The maximum number of B-frames
  /// is limited by the value you provide for the setting B frames between
  /// reference frames (numberBFramesBetweenReferenceFrames).
  final String dynamicSubGop;

  /// Entropy encoding mode. Use CABAC (must be in Main or High profile) or
  /// CAVLC.
  final String entropyEncoding;

  /// Choosing FORCE_FIELD disables PAFF encoding for interlaced outputs.
  final String fieldEncoding;

  /// Adjust quantization within each frame to reduce flicker or 'pop' on
  /// I-frames.
  final String flickerAdaptiveQuantization;

  /// If you are using the console, use the Framerate setting to specify the
  /// frame rate for this output. If you want to keep the same frame rate as the
  /// input video, choose Follow source. If you want to do frame rate
  /// conversion, choose a frame rate from the dropdown list or choose Custom.
  /// The framerates shown in the dropdown list are decimal approximations of
  /// fractions. If you choose Custom, specify your frame rate as a fraction. If
  /// you are creating your transcoding job specification as a JSON file without
  /// the console, use FramerateControl to specify which value the service uses
  /// for the frame rate for this output. Choose INITIALIZE_FROM_SOURCE if you
  /// want the service to use the frame rate from the input. Choose SPECIFIED if
  /// you want the service to use the frame rate you specify in the settings
  /// FramerateNumerator and FramerateDenominator.
  final String framerateControl;

  /// When set to INTERPOLATE, produces smoother motion during frame rate
  /// conversion.
  final String framerateConversionAlgorithm;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example, 24000 / 1001 = 23.976
  /// fps. Use FramerateDenominator to specify the denominator of this fraction.
  /// In this example, use 1001 for the value of FramerateDenominator. When you
  /// use the console for transcode jobs that use frame rate conversion, provide
  /// the value as a decimal number for Framerate. In this example, specify
  /// 23.976.
  final int framerateDenominator;

  /// Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 =
  /// 23.976 fps.
  final int framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames >
  /// 1.
  final String gopbReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended
  /// that this be set to 1 so a decoder joining mid-stream will receive an IDR
  /// frame as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double gopSize;

  /// Indicates if the GOP Size in H264 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run
  /// time.
  final String gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer
  /// model).
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five
  /// megabits as 5000000.
  final int hrdBufferSize;

  /// Use Interlace mode (InterlaceMode) to choose the scan line type for the
  /// output. * Top Field First (TOP_FIELD) and Bottom Field First
  /// (BOTTOM_FIELD) produce interlaced output with the entire output having the
  /// same field polarity (top or bottom first). * Follow, Default Top
  /// (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use
  /// the same field polarity as the source. Therefore, behavior depends on the
  /// input scan type, as follows. - If the source is interlaced, the output
  /// will be interlaced with the same polarity as the source (it will follow
  /// the source). The output could therefore be a mix of "top field first" and
  /// "bottom field first". - If the source is progressive, the output will be
  /// interlaced with "top field first" or "bottom field first" polarity,
  /// depending on which of the Follow options you chose.
  final String interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per
  /// second as 5000000. Required when Rate control mode is QVBR.
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as
  /// well as setting I-interval. The normal cadence resumes for the next GOP.
  /// This setting is only used when Scene Change Detect is enabled. Note:
  /// Maximum GOP stretch = GOP size + Min-I-interval - 1
  final int miniInterval;

  /// Number of B-frames between reference frames.
  final int numberbFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int numberReferenceFrames;

  /// Using the API, enable ParFollowSource if you want the service to use the
  /// pixel aspect ratio from the input. Using the console, do this by choosing
  /// Follow source for Pixel aspect ratio.
  final String parControl;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// Use Quality tuning level (H264QualityTuningLevel) to specifiy whether to
  /// use fast single-pass, high-quality singlepass, or high-quality multipass
  /// video encoding.
  final String qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.264
  /// codec. Required when you set Rate control mode to QVBR. Not valid when you
  /// set Rate control mode to a value other than QVBR, or when you don't define
  /// Rate control mode.
  final H264QvbrSettings qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  final String rateControlMode;

  /// Places a PPS header on each encoded picture, even if repeated.
  final String repeatPps;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  final String sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half
  /// the number of macroblock rows for interlaced pictures.
  final int slices;

  /// Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled
  /// as 25fps, and audio is sped up correspondingly.
  final String slowPal;

  /// Softness. Selects quantizer matrix, larger values reduce high-frequency
  /// content in the encoded image.
  final int softness;

  /// Adjust quantization within each frame based on spatial variation of
  /// content complexity.
  final String spatialAdaptiveQuantization;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  final String syntax;

  /// This field applies only if the Streams > Advanced > Framerate (framerate)
  /// field is set to 29.970. This field works with the Streams > Advanced >
  /// Preprocessors > Deinterlacer field (deinterlace_mode) and the Streams >
  /// Advanced > Interlaced Mode field (interlace_mode) to identify the scan
  /// type for the output: Progressive, Interlaced, Hard Telecine or Soft
  /// Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft:
  /// produces 23.976; the player converts this output to 29.97i.
  final String telecine;

  /// Adjust quantization within each frame based on temporal variation of
  /// content complexity.
  final String temporalAdaptiveQuantization;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  final String unregisteredSeiTimecode;

  H264Settings({
    this.adaptiveQuantization,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.entropyEncoding,
    this.fieldEncoding,
    this.flickerAdaptiveQuantization,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopbReference,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.maxBitrate,
    this.miniInterval,
    this.numberbFramesBetweenReferenceFrames,
    this.numberReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.qvbrSettings,
    this.rateControlMode,
    this.repeatPps,
    this.sceneChangeDetect,
    this.slices,
    this.slowPal,
    this.softness,
    this.spatialAdaptiveQuantization,
    this.syntax,
    this.telecine,
    this.temporalAdaptiveQuantization,
    this.unregisteredSeiTimecode,
  });
  static H264Settings fromJson(Map<String, dynamic> json) => H264Settings();
}

/// Settings for quality-defined variable bitrate encoding with the H.265 codec.
/// Required when you set Rate control mode to QVBR. Not valid when you set Rate
/// control mode to a value other than QVBR, or when you don't define Rate
/// control mode.
class H265QvbrSettings {
  /// Use this setting only when Rate control mode is QVBR and Quality tuning
  /// level is Multi-pass HQ. For Max average bitrate values suited to the
  /// complexity of your input video, the service limits the average bitrate of
  /// the video part of this output to the value that you choose. That is, the
  /// total size of the video element is less than or equal to the value you set
  /// multiplied by the number of seconds of encoded output.
  final int maxAverageBitrate;

  /// Required when you use QVBR rate control mode. That is, when you specify
  /// qvbrSettings within h265Settings. Specify the target quality level for
  /// this output, from 1 to 10. Use higher numbers for greater quality. Level
  /// 10 results in nearly lossless compression. The quality level for most
  /// broadcast-quality transcodes is between 6 and 9.
  final int qvbrQualityLevel;

  H265QvbrSettings({
    this.maxAverageBitrate,
    this.qvbrQualityLevel,
  });
  static H265QvbrSettings fromJson(Map<String, dynamic> json) =>
      H265QvbrSettings();
}

/// Settings for H265 codec
class H265Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final String adaptiveQuantization;

  /// Enables Alternate Transfer Function SEI message for outputs using Hybrid
  /// Log Gamma (HLG) Electro-Optical Transfer Function (EOTF).
  final String alternateTransferFunctionSei;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int bitrate;

  /// H.265 Level.
  final String codecLevel;

  /// Represents the Profile and Tier, per the HEVC (H.265) specification.
  /// Selections are grouped as [Profile] / [Tier], so "Main/High" represents
  /// Main Profile with High Tier. 4:2:2 profiles are only available with the
  /// HEVC 4:2:2 License.
  final String codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion
  /// content. This will cause the service to use fewer B-frames (which infer
  /// information based on other frames) for high-motion portions of the video
  /// and more B-frames for low-motion portions. The maximum number of B-frames
  /// is limited by the value you provide for the setting B frames between
  /// reference frames (numberBFramesBetweenReferenceFrames).
  final String dynamicSubGop;

  /// Adjust quantization within each frame to reduce flicker or 'pop' on
  /// I-frames.
  final String flickerAdaptiveQuantization;

  /// If you are using the console, use the Framerate setting to specify the
  /// frame rate for this output. If you want to keep the same frame rate as the
  /// input video, choose Follow source. If you want to do frame rate
  /// conversion, choose a frame rate from the dropdown list or choose Custom.
  /// The framerates shown in the dropdown list are decimal approximations of
  /// fractions. If you choose Custom, specify your frame rate as a fraction. If
  /// you are creating your transcoding job sepecification as a JSON file
  /// without the console, use FramerateControl to specify which value the
  /// service uses for the frame rate for this output. Choose
  /// INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from
  /// the input. Choose SPECIFIED if you want the service to use the frame rate
  /// you specify in the settings FramerateNumerator and FramerateDenominator.
  final String framerateControl;

  /// When set to INTERPOLATE, produces smoother motion during frame rate
  /// conversion.
  final String framerateConversionAlgorithm;

  /// Frame rate denominator.
  final int framerateDenominator;

  /// Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 =
  /// 23.976 fps.
  final int framerateNumerator;

  /// If enable, use reference B frames for GOP structures that have B frames >
  /// 1.
  final String gopbReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended
  /// that this be set to 1 so a decoder joining mid-stream will receive an IDR
  /// frame as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double gopSize;

  /// Indicates if the GOP Size in H265 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run
  /// time.
  final String gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer
  /// model).
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five
  /// megabits as 5000000.
  final int hrdBufferSize;

  /// Choose the scan line type for the output. Choose Progressive (PROGRESSIVE)
  /// to create a progressive output, regardless of the scan type of your input.
  /// Choose Top Field First (TOP_FIELD) or Bottom Field First (BOTTOM_FIELD) to
  /// create an output that's interlaced with the same field polarity
  /// throughout. Choose Follow, Default Top (FOLLOW_TOP_FIELD) or Follow,
  /// Default Bottom (FOLLOW_BOTTOM_FIELD) to create an interlaced output with
  /// the same field polarity as the source. If the source is interlaced, the
  /// output will be interlaced with the same polarity as the source (it will
  /// follow the source). The output could therefore be a mix of "top field
  /// first" and "bottom field first". If the source is progressive, your output
  /// will be interlaced with "top field first" or "bottom field first"
  /// polarity, depending on which of the Follow options you chose. If you don't
  /// choose a value, the service will default to Progressive (PROGRESSIVE).
  final String interlaceMode;

  /// Maximum bitrate in bits/second. For example, enter five megabits per
  /// second as 5000000. Required when Rate control mode is QVBR.
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as
  /// well as setting I-interval. The normal cadence resumes for the next GOP.
  /// This setting is only used when Scene Change Detect is enabled. Note:
  /// Maximum GOP stretch = GOP size + Min-I-interval - 1
  final int miniInterval;

  /// Number of B-frames between reference frames.
  final int numberbFramesBetweenReferenceFrames;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int numberReferenceFrames;

  /// Using the API, enable ParFollowSource if you want the service to use the
  /// pixel aspect ratio from the input. Using the console, do this by choosing
  /// Follow source for Pixel aspect ratio.
  final String parControl;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// Use Quality tuning level (H265QualityTuningLevel) to specifiy whether to
  /// use fast single-pass, high-quality singlepass, or high-quality multipass
  /// video encoding.
  final String qualityTuningLevel;

  /// Settings for quality-defined variable bitrate encoding with the H.265
  /// codec. Required when you set Rate control mode to QVBR. Not valid when you
  /// set Rate control mode to a value other than QVBR, or when you don't define
  /// Rate control mode.
  final H265QvbrSettings qvbrSettings;

  /// Use this setting to specify whether this output has a variable bitrate
  /// (VBR), constant bitrate (CBR) or quality-defined variable bitrate (QVBR).
  final String rateControlMode;

  /// Specify Sample Adaptive Offset (SAO) filter strength. Adaptive mode
  /// dynamically selects best strength based on content
  final String sampleAdaptiveOffsetFilterMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default. If this output uses QVBR, choose Transition detection
  /// (TRANSITION_DETECTION) for further video quality improvement. For more
  /// information about QVBR, see
  /// https://docs.aws.amazon.com/console/mediaconvert/cbr-vbr-qvbr.
  final String sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half
  /// the number of macroblock rows for interlaced pictures.
  final int slices;

  /// Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled
  /// as 25fps, and audio is sped up correspondingly.
  final String slowPal;

  /// Adjust quantization within each frame based on spatial variation of
  /// content complexity.
  final String spatialAdaptiveQuantization;

  /// This field applies only if the Streams > Advanced > Framerate (framerate)
  /// field is set to 29.970. This field works with the Streams > Advanced >
  /// Preprocessors > Deinterlacer field (deinterlace_mode) and the Streams >
  /// Advanced > Interlaced Mode field (interlace_mode) to identify the scan
  /// type for the output: Progressive, Interlaced, Hard Telecine or Soft
  /// Telecine. - Hard: produces 29.97i output from 23.976 input. - Soft:
  /// produces 23.976; the player converts this output to 29.97i.
  final String telecine;

  /// Adjust quantization within each frame based on temporal variation of
  /// content complexity.
  final String temporalAdaptiveQuantization;

  /// Enables temporal layer identifiers in the encoded bitstream. Up to 3
  /// layers are supported depending on GOP structure: I- and P-frames form one
  /// layer, reference B-frames can form a second layer and non-reference
  /// b-frames can form a third layer. Decoders can optionally decode only the
  /// lower temporal layers to generate a lower frame rate output. For example,
  /// given a bitstream with temporal IDs and with b-frames = 1 (i.e. IbPbPb
  /// display order), a decoder could decode all the frames for full frame rate
  /// output or only the I and P frames (lowest temporal layer) for a half frame
  /// rate output.
  final String temporalIds;

  /// Enable use of tiles, allowing horizontal as well as vertical subdivision
  /// of the encoded pictures.
  final String tiles;

  /// Inserts timecode for each frame as 4 bytes of an unregistered SEI message.
  final String unregisteredSeiTimecode;

  /// Use this setting only for outputs encoded with H.265 that are in CMAF or
  /// DASH output groups. If you include writeMp4PackagingType in your JSON job
  /// specification for other outputs, your video might not work properly with
  /// downstream systems and video players. If the location of parameter set NAL
  /// units don't matter in your workflow, ignore this setting. The service
  /// defaults to marking your output as HEV1. Choose HVC1 to mark your output
  /// as HVC1. This makes your output compliant with this specification: ISO
  /// IECJTC1 SC29 N13798 Text ISO/IEC FDIS 14496-15 3rd Edition. For these
  /// outputs, the service stores parameter set NAL units in the sample headers
  /// but not in the samples directly. Keep the default HEV1 to mark your output
  /// as HEV1. For these outputs, the service writes parameter set NAL units
  /// directly into the samples.
  final String writeMp4PackagingType;

  H265Settings({
    this.adaptiveQuantization,
    this.alternateTransferFunctionSei,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.flickerAdaptiveQuantization,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopbReference,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.maxBitrate,
    this.miniInterval,
    this.numberbFramesBetweenReferenceFrames,
    this.numberReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.qvbrSettings,
    this.rateControlMode,
    this.sampleAdaptiveOffsetFilterMode,
    this.sceneChangeDetect,
    this.slices,
    this.slowPal,
    this.spatialAdaptiveQuantization,
    this.telecine,
    this.temporalAdaptiveQuantization,
    this.temporalIds,
    this.tiles,
    this.unregisteredSeiTimecode,
    this.writeMp4PackagingType,
  });
  static H265Settings fromJson(Map<String, dynamic> json) => H265Settings();
}

/// Use these settings to specify static color calibration metadata, as defined
/// by SMPTE ST 2086. These values don't affect the pixel values that are
/// encoded in the video stream. They are intended to help the downstream video
/// player display content in a way that reflects the intentions of the the
/// content creator.
class Hdr10Metadata {
  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int bluePrimaryx;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int bluePrimaryy;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int greenPrimaryx;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int greenPrimaryy;

  /// Maximum light level among all samples in the coded video sequence, in
  /// units of candelas per square meter. This setting doesn't have a default
  /// value; you must specify a value that is suitable for the content.
  final int maxContentLightLevel;

  /// Maximum average light level of any frame in the coded video sequence, in
  /// units of candelas per square meter. This setting doesn't have a default
  /// value; you must specify a value that is suitable for the content.
  final int maxFrameAverageLightLevel;

  /// Nominal maximum mastering display luminance in units of of 0.0001 candelas
  /// per square meter.
  final int maxLuminance;

  /// Nominal minimum mastering display luminance in units of of 0.0001 candelas
  /// per square meter
  final int minLuminance;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int redPrimaryx;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int redPrimaryy;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int whitePointx;

  /// HDR Master Display Information must be provided by a color grader, using
  /// color grading tools. Range is 0 to 50,000, each increment represents
  /// 0.00002 in CIE1931 color coordinate. Note that this setting is not for
  /// color correction.
  final int whitePointy;

  Hdr10Metadata({
    this.bluePrimaryx,
    this.bluePrimaryy,
    this.greenPrimaryx,
    this.greenPrimaryy,
    this.maxContentLightLevel,
    this.maxFrameAverageLightLevel,
    this.maxLuminance,
    this.minLuminance,
    this.redPrimaryx,
    this.redPrimaryy,
    this.whitePointx,
    this.whitePointy,
  });
  static Hdr10Metadata fromJson(Map<String, dynamic> json) => Hdr10Metadata();
}

/// Caption Language Mapping
class HlsCaptionLanguageMapping {
  /// Caption channel.
  final int captionChannel;

  /// Specify the language for this caption channel, using the ISO 639-2 or ISO
  /// 639-3 three-letter language code
  final String customLanguageCode;

  /// Specify the language, using the ISO 639-2 three-letter code listed at
  /// https://www.loc.gov/standards/iso639-2/php/code_list.php.
  final String languageCode;

  /// Caption language description.
  final String languageDescription;

  HlsCaptionLanguageMapping({
    this.captionChannel,
    this.customLanguageCode,
    this.languageCode,
    this.languageDescription,
  });
  static HlsCaptionLanguageMapping fromJson(Map<String, dynamic> json) =>
      HlsCaptionLanguageMapping();
}

/// Settings for HLS encryption
class HlsEncryptionSettings {
  /// This is a 128-bit, 16-byte hex value represented by a 32-character text
  /// string. If this parameter is not set then the Initialization Vector will
  /// follow the segment number by default.
  final String constantInitializationVector;

  /// Encrypts the segments with the given encryption scheme. Leave blank to
  /// disable. Selecting 'Disabled' in the web interface also disables
  /// encryption.
  final String encryptionMethod;

  /// The Initialization Vector is a 128-bit number used in conjunction with the
  /// key for encrypting blocks. If set to INCLUDE, Initialization Vector is
  /// listed in the manifest. Otherwise Initialization Vector is not in the
  /// manifest.
  final String initializationVectorInManifest;

  /// Enable this setting to insert the EXT-X-SESSION-KEY element into the
  /// master playlist. This allows for offline Apple HLS FairPlay content
  /// protection.
  final String offlineEncrypted;

  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider. If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider spekeKeyProvider;

  /// Use these settings to set up encryption with a static key provider.
  final StaticKeyProvider staticKeyProvider;

  /// Specify whether your DRM encryption key is static or from a key provider
  /// that follows the SPEKE standard. For more information about SPEKE, see
  /// https://docs.aws.amazon.com/speke/latest/documentation/what-is-speke.html.
  final String type;

  HlsEncryptionSettings({
    this.constantInitializationVector,
    this.encryptionMethod,
    this.initializationVectorInManifest,
    this.offlineEncrypted,
    this.spekeKeyProvider,
    this.staticKeyProvider,
    this.type,
  });
  static HlsEncryptionSettings fromJson(Map<String, dynamic> json) =>
      HlsEncryptionSettings();
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// HLS_GROUP_SETTINGS.
class HlsGroupSettings {
  /// Choose one or more ad marker types to decorate your Apple HLS manifest.
  /// This setting does not determine whether SCTE-35 markers appear in the
  /// outputs themselves.
  final List<String> adMarkers;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String baseUrl;

  /// Language to be used on Caption outputs
  final List<HlsCaptionLanguageMapping> captionLanguageMappings;

  /// Applies only to 608 Embedded output captions. Insert: Include
  /// CLOSED-CAPTIONS lines in the manifest. Specify at least one language in
  /// the CC1 Language Code field. One CLOSED-CAPTION line is added for each
  /// Language Code you specify. Make sure to specify the languages in the order
  /// in which they appear in the original source (if the source is embedded
  /// format) or the order of the caption selectors (if the source is other than
  /// embedded). Otherwise, languages in the manifest will not match up properly
  /// with the output captions. None: Include CLOSED-CAPTIONS=NONE line in the
  /// manifest. Omit: Omit any CLOSED-CAPTIONS line from the manifest.
  final String captionLanguageSetting;

  /// When set to ENABLED, sets #EXT-X-ALLOW-CACHE:no tag, which prevents client
  /// from saving media segments for later replay.
  final String clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8
  /// playlist generation.
  final String codecSpecification;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do
  /// not specify the base filename in the URI, the service will use the
  /// filename of the input file. If your job has multiple inputs, the service
  /// uses the filename of the first input file.
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings destinationSettings;

  /// Indicates whether segments should be placed in subdirectories.
  final String directoryStructure;

  /// DRM settings.
  final HlsEncryptionSettings encryption;

  /// When set to GZIP, compresses HLS playlist.
  final String manifestCompression;

  /// Indicates whether the output manifest should use floating point values for
  /// segment duration.
  final String manifestDurationFormat;

  /// Keep this setting at the default value of 0, unless you are
  /// troubleshooting a problem with how devices play back the end of your video
  /// asset. If you know that player devices are hanging on the final segment of
  /// your video because the length of your final segment is too short, use this
  /// setting to specify a minimum final segment length, in seconds. Choose a
  /// value that is greater than or equal to 1 and less than your segment
  /// length. When you specify a value for this setting, the encoder will
  /// combine any final segment that is shorter than the length that you specify
  /// with the previous segment. For example, your segment length is 3 seconds
  /// and your final segment is .5 seconds without a minimum final segment
  /// length; when you set the minimum final segment length to 1, your final
  /// segment is 3.5 seconds.
  final double minFinalSegmentLength;

  /// When set, Minimum Segment Size is enforced by looking ahead and back
  /// within the specified range for a nearby avail and extending the segment
  /// size if needed.
  final int minSegmentLength;

  /// Indicates whether the .m3u8 manifest file should be generated for this HLS
  /// output group.
  final String outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestamp_offset.
  final String programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  final int programDateTimePeriod;

  /// When set to SINGLE_FILE, emits program as a single media resource (.ts)
  /// file, uses #EXT-X-BYTERANGE tags to index segment for playback.
  final String segmentControl;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note
  /// that segments will end on the next keyframe after this number of seconds,
  /// so actual segment length may be longer.
  final int segmentLength;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be SINGLE_DIRECTORY for this setting to have an
  /// effect.
  final int segmentsPerSubdirectory;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag
  /// of variant manifest.
  final String streamInfResolution;

  /// Indicates ID3 frame that has the timecode.
  final String timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  final int timedMetadataId3Period;

  /// Provides an extra millisecond delta offset to fine tune the timestamps.
  final int timestampDeltaMilliseconds;

  HlsGroupSettings({
    this.adMarkers,
    this.baseUrl,
    this.captionLanguageMappings,
    this.captionLanguageSetting,
    this.clientCache,
    this.codecSpecification,
    this.destination,
    this.destinationSettings,
    this.directoryStructure,
    this.encryption,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minFinalSegmentLength,
    this.minSegmentLength,
    this.outputSelection,
    this.programDateTime,
    this.programDateTimePeriod,
    this.segmentControl,
    this.segmentLength,
    this.segmentsPerSubdirectory,
    this.streamInfResolution,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
    this.timestampDeltaMilliseconds,
  });
  static HlsGroupSettings fromJson(Map<String, dynamic> json) =>
      HlsGroupSettings();
}

/// Settings for HLS output groups
class HlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  final String audioGroupId;

  /// Use this setting only in audio-only outputs. Choose MPEG-2 Transport
  /// Stream (M2TS) to create a file in an MPEG2-TS container. Keep the default
  /// value Automatic (AUTOMATIC) to create an audio-only file in a raw
  /// container. Regardless of the value that you specify here, if this output
  /// has video, the service will place the output into an MPEG2-TS container.
  final String audioOnlyContainer;

  /// List all the audio groups that are used with the video output stream.
  /// Input all the audio GROUP-IDs that are associated to the video, separate
  /// by ','.
  final String audioRenditionSets;

  /// Four types of audio-only tracks are supported: Audio-Only Variant Stream
  /// The client can play back this audio-only stream instead of video in
  /// low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS
  /// manifest. Alternate Audio, Auto Select, Default Alternate rendition that
  /// the client should try to play back by default. Represented as an
  /// EXT-X-MEDIA in the HLS manifest with DEFAULT=YES, AUTOSELECT=YES Alternate
  /// Audio, Auto Select, Not Default Alternate rendition that the client may
  /// try to play back by default. Represented as an EXT-X-MEDIA in the HLS
  /// manifest with DEFAULT=NO, AUTOSELECT=YES Alternate Audio, not Auto Select
  /// Alternate rendition that the client will not try to play back by default.
  /// Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO,
  /// AUTOSELECT=NO
  final String audioTrackType;

  /// When set to INCLUDE, writes I-Frame Only Manifest in addition to the HLS
  /// manifest
  final String iFrameOnlyManifest;

  /// String concatenated to end of segment filenames. Accepts "Format
  /// Identifiers":#format_identifier_parameters.
  final String segmentModifier;

  HlsSettings({
    this.audioGroupId,
    this.audioOnlyContainer,
    this.audioRenditionSets,
    this.audioTrackType,
    this.iFrameOnlyManifest,
    this.segmentModifier,
  });
  static HlsSettings fromJson(Map<String, dynamic> json) => HlsSettings();
}

/// To insert ID3 tags in your output, specify two values. Use ID3 tag (Id3) to
/// specify the base 64 encoded string and use Timecode (TimeCode) to specify
/// the time when the tag should be inserted. To insert multiple ID3 tags in
/// your output, create multiple instances of ID3 insertion (Id3Insertion).
class Id3Insertion {
  /// Use ID3 tag (Id3) to provide a tag value in base64-encode format.
  final String id3;

  /// Provide a Timecode (TimeCode) in HH:MM:SS:FF or HH:MM:SS;FF format.
  final String timecode;

  Id3Insertion({
    this.id3,
    this.timecode,
  });
  static Id3Insertion fromJson(Map<String, dynamic> json) => Id3Insertion();
}

/// Enable the image inserter feature to include a graphic overlay on your
/// video. Enable or disable this feature for each input or output individually.
/// This setting is disabled by default.
class ImageInserter {
  /// Specify the images that you want to overlay on your video. The images must
  /// be PNG or TGA files.
  final List<InsertableImage> insertableImages;

  ImageInserter({
    this.insertableImages,
  });
  static ImageInserter fromJson(Map<String, dynamic> json) => ImageInserter();
}

/// Settings specific to IMSC caption outputs.
class ImscDestinationSettings {
  /// Keep this setting enabled to have MediaConvert use the font style and
  /// position information from the captions source in the output. This option
  /// is available only when your input captions are CFF-TT, IMSC, SMPTE-TT, or
  /// TTML. Disable this setting for simplified output captions.
  final String stylePassthrough;

  ImscDestinationSettings({
    this.stylePassthrough,
  });
  static ImscDestinationSettings fromJson(Map<String, dynamic> json) =>
      ImscDestinationSettings();
}

/// Specifies media input
class Input {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  final Map<String, AudioSelectorGroup> audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use mutiple
  /// Audio selectors per input.
  final Map<String, AudioSelector> audioSelectors;

  /// Use Captions selectors (CaptionSelectors) to specify the captions data
  /// from the input that you will use in your outputs. You can use mutiple
  /// captions selectors per input.
  final Map<String, CaptionSelector> captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it
  /// will override any value that you specify in the output setting Cropping
  /// selection (crop).
  final Rectangle crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manaully controllable for MPEG2 and
  /// uncompressed video inputs.
  final String deblockFilter;

  /// Settings for decrypting any input files that you encrypt before you upload
  /// them to Amazon S3. MediaConvert can decrypt files only when you use AWS
  /// Key Management Service (KMS) to encrypt the data key that you use to
  /// encrypt your content.
  final InputDecryptionSettings decryptionSettings;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.
  /// Default is disabled. Only applicable to MPEG2, H.264, H.265, and
  /// uncompressed video inputs.
  final String denoiseFilter;

  /// Specify the source file for your transcoding job. You can use multiple
  /// inputs in a single job. The service concatenates these inputs, in the
  /// order that you specify them in the job, to create the outputs. If your
  /// input format is IMF, specify your input by providing the path to your CPL.
  /// For example, "s3://bucket/vf/cpl.xml". If the CPL is in an incomplete IMP,
  /// make sure to use *Supplemental IMPs* (SupplementalImps) to specify any
  /// supplemental IMPs that contain assets referenced by the CPL.
  final String fileInput;

  /// Use Filter enable (InputFilterEnable) to specify how the transcoding
  /// service applies the denoise and deblock filters. You must also enable the
  /// filters separately, with Denoise (InputDenoiseFilter) and Deblock
  /// (InputDeblockFilter). * Auto - The transcoding service determines whether
  /// to apply filtering, depending on input type and quality. * Disable - The
  /// input is not filtered. This is true even if you use the API to enable them
  /// in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is
  /// filtered regardless of input type.
  final String filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  final int filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  final ImageInserter imageInserter;

  /// (InputClippings) contains sets of start and end times that together
  /// specify a portion of the input to be used in the outputs. If you provide
  /// only a start time, the clip will be the entire input from that point to
  /// the end. If you provide only an end time, it will be the entire input up
  /// to that point. When you specify more than one input clip, the transcoding
  /// service creates the job outputs by stringing the clips together in the
  /// order you specify them.
  final List<InputClipping> inputClippings;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black.
  /// If you specify a value here, it will override any value that you specify
  /// in the output setting Selection placement (position). If you specify a
  /// value here, this will override any AFD values in your input, even if you
  /// set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a
  /// value here, this will ignore anything that you specify for the setting
  /// Scaling Behavior (scalingBehavior).
  final Rectangle position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If
  /// the program you specify doesn't exist, the transcoding service will use
  /// this default.
  final int programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  final String psiControl;

  /// Provide a list of any necessary supplemental IMPs. You need supplemental
  /// IMPs if the CPL that you're using for your input is in an incomplete IMP.
  /// Specify either the supplemental IMP directories with a trailing slash or
  /// the ASSETMAP.xml files. For example
  /// ["s3://bucket/ov/", "s3://bucket/vf2/ASSETMAP.xml"]. You don't need to
  /// specify the IMP that contains your input CPL, because the service
  /// automatically detects it.
  final List<String> supplementalImps;

  /// Use this Timecode source setting, located under the input settings
  /// (InputTimecodeSource), to specify how the service counts input video
  /// frames. This input frame count affects only the behavior of features that
  /// apply to a single input at a time, such as input clipping and
  /// synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the
  /// timecodes in your input video. Choose Start at zero (ZEROBASED) to start
  /// the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start
  /// the first frame at the timecode that you specify in the setting Start
  /// timecode (timecodeStart). If you don't specify a value for Timecode
  /// source, the service will use Embedded by default. For more information
  /// about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes,
  /// see https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String timecodeStart;

  /// Selector for video.
  final VideoSelector videoSelector;

  Input({
    this.audioSelectorGroups,
    this.audioSelectors,
    this.captionSelectors,
    this.crop,
    this.deblockFilter,
    this.decryptionSettings,
    this.denoiseFilter,
    this.fileInput,
    this.filterEnable,
    this.filterStrength,
    this.imageInserter,
    this.inputClippings,
    this.position,
    this.programNumber,
    this.psiControl,
    this.supplementalImps,
    this.timecodeSource,
    this.timecodeStart,
    this.videoSelector,
  });
  static Input fromJson(Map<String, dynamic> json) => Input();
}

/// To transcode only portions of your input (clips), include one Input clipping
/// (one instance of InputClipping in the JSON job file) for each input clip.
/// All input clips you specify will be included in every output of the job.
class InputClipping {
  /// Set End timecode (EndTimecode) to the end of the portion of the input you
  /// are clipping. The frame corresponding to the End timecode value is
  /// included in the clip. Start timecode or End timecode may be left blank,
  /// but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH is the
  /// hour, MM is the minute, SS is the second, and FF is the frame number. When
  /// choosing this value, take into account your setting for timecode source
  /// under input settings (InputTimecodeSource). For example, if you have
  /// embedded timecodes that start at 01:00:00:00 and you want your clip to end
  /// six minutes into the video, use 01:06:00:00.
  final String endTimecode;

  /// Set Start timecode (StartTimecode) to the beginning of the portion of the
  /// input you are clipping. The frame corresponding to the Start timecode
  /// value is included in the clip. Start timecode or End timecode may be left
  /// blank, but not both. Use the format HH:MM:SS:FF or HH:MM:SS;FF, where HH
  /// is the hour, MM is the minute, SS is the second, and FF is the frame
  /// number. When choosing this value, take into account your setting for Input
  /// timecode source. For example, if you have embedded timecodes that start at
  /// 01:00:00:00 and you want your clip to begin five minutes into the video,
  /// use 01:05:00:00.
  final String startTimecode;

  InputClipping({
    this.endTimecode,
    this.startTimecode,
  });
  static InputClipping fromJson(Map<String, dynamic> json) => InputClipping();
}

/// Settings for decrypting any input files that you encrypt before you upload
/// them to Amazon S3. MediaConvert can decrypt files only when you use AWS Key
/// Management Service (KMS) to encrypt the data key that you use to encrypt
/// your content.
class InputDecryptionSettings {
  /// Specify the encryption mode that you used to encrypt your input files.
  final String decryptionMode;

  /// Warning! Don't provide your encryption key in plaintext. Your job settings
  /// could be intercepted, making your encrypted content vulnerable. Specify
  /// the encrypted version of the data key that you used to encrypt your
  /// content. The data key must be encrypted by AWS Key Management Service
  /// (KMS). The key can be 128, 192, or 256 bits.
  final String encryptedDecryptionKey;

  /// Specify the initialization vector that you used when you encrypted your
  /// content before uploading it to Amazon S3. You can use a 16-byte
  /// initialization vector with any encryption mode. Or, you can use a 12-byte
  /// initialization vector with GCM or CTR. MediaConvert accepts only
  /// initialization vectors that are base64-encoded.
  final String initializationVector;

  /// Specify the AWS Region for AWS Key Management Service (KMS) that you used
  /// to encrypt your data key, if that Region is different from the one you are
  /// using for AWS Elemental MediaConvert.
  final String kmsKeyRegion;

  InputDecryptionSettings({
    this.decryptionMode,
    this.encryptedDecryptionKey,
    this.initializationVector,
    this.kmsKeyRegion,
  });
  static InputDecryptionSettings fromJson(Map<String, dynamic> json) =>
      InputDecryptionSettings();
}

/// Specified video input in a template.
class InputTemplate {
  /// Specifies set of audio selectors within an input to combine. An input may
  /// have multiple audio selector groups. See "Audio Selector
  /// Group":#inputs-audio_selector_group for more information.
  final Map<String, AudioSelectorGroup> audioSelectorGroups;

  /// Use Audio selectors (AudioSelectors) to specify a track or set of tracks
  /// from the input that you will use in your outputs. You can use mutiple
  /// Audio selectors per input.
  final Map<String, AudioSelector> audioSelectors;

  /// Use Captions selectors (CaptionSelectors) to specify the captions data
  /// from the input that you will use in your outputs. You can use mutiple
  /// captions selectors per input.
  final Map<String, CaptionSelector> captionSelectors;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame. If you specify a value here, it
  /// will override any value that you specify in the output setting Cropping
  /// selection (crop).
  final Rectangle crop;

  /// Enable Deblock (InputDeblockFilter) to produce smoother motion in the
  /// output. Default is disabled. Only manaully controllable for MPEG2 and
  /// uncompressed video inputs.
  final String deblockFilter;

  /// Enable Denoise (InputDenoiseFilter) to filter noise from the input.
  /// Default is disabled. Only applicable to MPEG2, H.264, H.265, and
  /// uncompressed video inputs.
  final String denoiseFilter;

  /// Use Filter enable (InputFilterEnable) to specify how the transcoding
  /// service applies the denoise and deblock filters. You must also enable the
  /// filters separately, with Denoise (InputDenoiseFilter) and Deblock
  /// (InputDeblockFilter). * Auto - The transcoding service determines whether
  /// to apply filtering, depending on input type and quality. * Disable - The
  /// input is not filtered. This is true even if you use the API to enable them
  /// in (InputDeblockFilter) and (InputDeblockFilter). * Force - The in put is
  /// filtered regardless of input type.
  final String filterEnable;

  /// Use Filter strength (FilterStrength) to adjust the magnitude the input
  /// filter settings (Deblock and Denoise). The range is -5 to 5. Default is 0.
  final int filterStrength;

  /// Enable the image inserter feature to include a graphic overlay on your
  /// video. Enable or disable this feature for each input individually. This
  /// setting is disabled by default.
  final ImageInserter imageInserter;

  /// (InputClippings) contains sets of start and end times that together
  /// specify a portion of the input to be used in the outputs. If you provide
  /// only a start time, the clip will be the entire input from that point to
  /// the end. If you provide only an end time, it will be the entire input up
  /// to that point. When you specify more than one input clip, the transcoding
  /// service creates the job outputs by stringing the clips together in the
  /// order you specify them.
  final List<InputClipping> inputClippings;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black.
  /// If you specify a value here, it will override any value that you specify
  /// in the output setting Selection placement (position). If you specify a
  /// value here, this will override any AFD values in your input, even if you
  /// set Respond to AFD (RespondToAfd) to Respond (RESPOND). If you specify a
  /// value here, this will ignore anything that you specify for the setting
  /// Scaling Behavior (scalingBehavior).
  final Rectangle position;

  /// Use Program (programNumber) to select a specific program from within a
  /// multi-program transport stream. Note that Quad 4K is not currently
  /// supported. Default is the first program within the transport stream. If
  /// the program you specify doesn't exist, the transcoding service will use
  /// this default.
  final int programNumber;

  /// Set PSI control (InputPsiControl) for transport stream inputs to specify
  /// which data the demux process to scans. * Ignore PSI - Scan all PIDs for
  /// audio and video. * Use PSI - Scan only PSI data.
  final String psiControl;

  /// Use this Timecode source setting, located under the input settings
  /// (InputTimecodeSource), to specify how the service counts input video
  /// frames. This input frame count affects only the behavior of features that
  /// apply to a single input at a time, such as input clipping and
  /// synchronizing some captions formats. Choose Embedded (EMBEDDED) to use the
  /// timecodes in your input video. Choose Start at zero (ZEROBASED) to start
  /// the first frame at zero. Choose Specified start (SPECIFIEDSTART) to start
  /// the first frame at the timecode that you specify in the setting Start
  /// timecode (timecodeStart). If you don't specify a value for Timecode
  /// source, the service will use Embedded by default. For more information
  /// about timecodes, see
  /// https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String timecodeSource;

  /// Specify the timecode that you want the service to use for this input's
  /// initial frame. To use this setting, you must set the Timecode source
  /// setting, located under the input settings (InputTimecodeSource), to
  /// Specified start (SPECIFIEDSTART). For more information about timecodes,
  /// see https://docs.aws.amazon.com/console/mediaconvert/timecode.
  final String timecodeStart;

  /// Selector for video.
  final VideoSelector videoSelector;

  InputTemplate({
    this.audioSelectorGroups,
    this.audioSelectors,
    this.captionSelectors,
    this.crop,
    this.deblockFilter,
    this.denoiseFilter,
    this.filterEnable,
    this.filterStrength,
    this.imageInserter,
    this.inputClippings,
    this.position,
    this.programNumber,
    this.psiControl,
    this.timecodeSource,
    this.timecodeStart,
    this.videoSelector,
  });
  static InputTemplate fromJson(Map<String, dynamic> json) => InputTemplate();
}

/// Settings that specify how your still graphic overlay appears.
class InsertableImage {
  /// Specify the time, in milliseconds, for the image to remain on the output
  /// video. This duration includes fade-in time but not fade-out time.
  final int duration;

  /// Specify the length of time, in milliseconds, between the Start time that
  /// you specify for the image insertion and the time that the image appears at
  /// full opacity. Full opacity is the level that you specify for the opacity
  /// setting. If you don't specify a value for Fade-in, the image will appear
  /// abruptly at the overlay start time.
  final int fadeIn;

  /// Specify the length of time, in milliseconds, between the end of the time
  /// that you have specified for the image overlay Duration and when the
  /// overlaid image has faded to total transparency. If you don't specify a
  /// value for Fade-out, the image will disappear abruptly at the end of the
  /// inserted image duration.
  final int fadeOut;

  /// Specify the height of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution height, the service will crop your
  /// overlaid image to fit. To use the native height of the image, keep this
  /// setting blank.
  final int height;

  /// Specify the Amazon S3 location of the image that you want to overlay on
  /// the video. Use a PNG or TGA file.
  final String imageInserterInput;

  /// Specify the distance, in pixels, between the inserted image and the left
  /// edge of the video frame. Required for any image overlay that you specify.
  final int imagex;

  /// Specify the distance, in pixels, between the overlaid image and the top
  /// edge of the video frame. Required for any image overlay that you specify.
  final int imagey;

  /// Specify how overlapping inserted images appear. Images with higher values
  /// for Layer appear on top of images with lower values for Layer.
  final int layer;

  /// Use Opacity (Opacity) to specify how much of the underlying video shows
  /// through the inserted image. 0 is transparent and 100 is fully opaque.
  /// Default is 50.
  final int opacity;

  /// Specify the timecode of the frame that you want the overlay to first
  /// appear on. This must be in timecode (HH:MM:SS:FF or HH:MM:SS;FF) format.
  /// Remember to take into account your timecode source settings.
  final String startTime;

  /// Specify the width of the inserted image in pixels. If you specify a value
  /// that's larger than the video resolution width, the service will crop your
  /// overlaid image to fit. To use the native width of the image, keep this
  /// setting blank.
  final int width;

  InsertableImage({
    this.duration,
    this.fadeIn,
    this.fadeOut,
    this.height,
    this.imageInserterInput,
    this.imagex,
    this.imagey,
    this.layer,
    this.opacity,
    this.startTime,
    this.width,
  });
  static InsertableImage fromJson(Map<String, dynamic> json) =>
      InsertableImage();
}

/// Each job converts an input file into an output file or files. For more
/// information, see the User Guide at
/// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
class Job {
  /// Accelerated transcoding can significantly speed up jobs with long,
  /// visually complex content.
  final AccelerationSettings accelerationSettings;

  /// An identifier for this resource that is unique within all of AWS.
  final String arn;

  /// Optional. Choose a tag type that AWS Billing and Cost Management will use
  /// to sort your AWS Elemental MediaConvert costs on any billing report that
  /// you set up. Any transcoding outputs that don't have an associated tag will
  /// appear in your billing report unsorted. If you don't choose a valid value
  /// for this field, your job outputs will appear on the billing report
  /// unsorted.
  final String billingTagsSource;

  /// The time, in Unix epoch format in seconds, when the job got created.
  final DateTime createdAt;

  /// A job's phase can be PROBING, TRANSCODING OR UPLOADING
  final String currentPhase;

  /// Error code for the job
  final int errorCode;

  /// Error message of Job
  final String errorMessage;

  /// A portion of the job's ARN, unique within your AWS Elemental MediaConvert
  /// resources
  final String id;

  /// An estimate of how far your job has progressed. This estimate is shown as
  /// a percentage of the total time from when your job leaves its queue to when
  /// your output files appear in your output Amazon S3 bucket. AWS Elemental
  /// MediaConvert provides jobPercentComplete in CloudWatch STATUS_UPDATE
  /// events and in the response to GetJob and ListJobs requests. The
  /// jobPercentComplete estimate is reliable for the following input
  /// containers: Quicktime, Transport Stream, MP4, and MXF. For some jobs, the
  /// service can't provide information about job progress. In those cases,
  /// jobPercentComplete returns a null value.
  final int jobPercentComplete;

  /// The job template that the job is created from, if it is created from a job
  /// template.
  final String jobTemplate;

  /// List of output group details
  final List<OutputGroupDetail> outputGroupDetails;

  /// Relative priority on the job.
  final int priority;

  /// Optional. When you create a job, you can specify a queue to send it to. If
  /// you don't specify, the job will go to the default queue. For more about
  /// queues, see the User Guide topic at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/what-is.html
  final String queue;

  /// The number of times that the service automatically attempted to process
  /// your job after encountering an error.
  final int retryCount;

  /// The IAM role you use for creating this job. For details about permissions,
  /// see the User Guide topic at the User Guide at
  /// http://docs.aws.amazon.com/mediaconvert/latest/ug/iam-role.html
  final String role;

  /// JobSettings contains all the transcode settings for a job.
  final JobSettings settings;

  /// Enable this setting when you run a test job to estimate how many reserved
  /// transcoding slots (RTS) you need. When this is enabled, MediaConvert runs
  /// your job from an on-demand queue with similar performance to what you will
  /// see with one RTS in a reserved queue. This setting is disabled by default.
  final String simulateReservedQueue;

  /// A job's status can be SUBMITTED, PROGRESSING, COMPLETE, CANCELED, or
  /// ERROR.
  final String status;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  final String statusUpdateInterval;

  /// Information about when jobs are submitted, started, and finished is
  /// specified in Unix epoch format in seconds.
  final Timing timing;

  /// User-defined metadata that you want to associate with an MediaConvert job.
  /// You specify metadata in key/value pairs.
  final Map<String, String> userMetadata;

  Job({
    this.accelerationSettings,
    this.arn,
    this.billingTagsSource,
    this.createdAt,
    this.currentPhase,
    this.errorCode,
    this.errorMessage,
    this.id,
    this.jobPercentComplete,
    this.jobTemplate,
    this.outputGroupDetails,
    this.priority,
    this.queue,
    this.retryCount,
    @required this.role,
    @required this.settings,
    this.simulateReservedQueue,
    this.status,
    this.statusUpdateInterval,
    this.timing,
    this.userMetadata,
  });
  static Job fromJson(Map<String, dynamic> json) => Job();
}

/// JobSettings contains all the transcode settings for a job.
class JobSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad
  /// Avail PTS time.
  final int adAvailOffset;

  /// Settings for ad avail blanking. Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  final AvailBlanking availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  final EsamSettings esam;

  /// Use Inputs (inputs) to define source file used in the transcode job. There
  /// can be multiple inputs add in a job. These inputs will be concantenated
  /// together to create the output.
  final List<Input> inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  final MotionImageInserter motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen
  /// measurement and analytics, ignore these settings. When you enable Nielsen
  /// configuration (nielsenConfiguration), MediaConvert enables PCM to ID3
  /// tagging for all outputs in the job. To enable Nielsen configuration
  /// programmatically, include an instance of nielsenConfiguration in your JSON
  /// job specification. Even if you don't include any children of
  /// nielsenConfiguration, you still enable the setting.
  final NielsenConfiguration nielsenConfiguration;

  /// (OutputGroups) contains one group of settings for each set of outputs that
  /// share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS,
  /// Quicktime, MXF, and no container) are grouped in a single output group as
  /// well. Required in (OutputGroups) is a group of settings that apply to the
  /// whole group. This required object depends on the value you set for (Type)
  /// under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs
  /// are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings *
  /// HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS,
  /// DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings *
  /// CMAF_GROUP_SETTINGS, CmafGroupSettings
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3
  /// tags in your job. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  final TimedMetadataInsertion timedMetadataInsertion;

  JobSettings({
    this.adAvailOffset,
    this.availBlanking,
    this.esam,
    this.inputs,
    this.motionImageInserter,
    this.nielsenConfiguration,
    this.outputGroups,
    this.timecodeConfig,
    this.timedMetadataInsertion,
  });
  static JobSettings fromJson(Map<String, dynamic> json) => JobSettings();
}

/// A job template is a pre-made set of encoding instructions that you can use
/// to quickly create a job.
class JobTemplate {
  /// Accelerated transcoding can significantly speed up jobs with long,
  /// visually complex content.
  final AccelerationSettings accelerationSettings;

  /// An identifier for this resource that is unique within all of AWS.
  final String arn;

  /// An optional category you create to organize your job templates.
  final String category;

  /// The timestamp in epoch seconds for Job template creation.
  final DateTime createdAt;

  /// An optional description you create for each job template.
  final String description;

  /// The timestamp in epoch seconds when the Job template was last updated.
  final DateTime lastUpdated;

  /// A name you create for each job template. Each name must be unique within
  /// your account.
  final String name;

  /// Relative priority on the job.
  final int priority;

  /// Optional. The queue that jobs created from this template are assigned to.
  /// If you don't specify this, jobs will go to the default queue.
  final String queue;

  /// JobTemplateSettings contains all the transcode settings saved in the
  /// template that will be applied to jobs created from it.
  final JobTemplateSettings settings;

  /// Specify how often MediaConvert sends STATUS_UPDATE events to Amazon
  /// CloudWatch Events. Set the interval, in seconds, between status updates.
  /// MediaConvert sends an update at this interval from the time the service
  /// begins processing your job to the time it completes the transcode or
  /// encounters an error.
  final String statusUpdateInterval;

  /// A job template can be of two types: system or custom. System or built-in
  /// job templates can't be modified or deleted by the user.
  final String type;

  JobTemplate({
    this.accelerationSettings,
    this.arn,
    this.category,
    this.createdAt,
    this.description,
    this.lastUpdated,
    @required this.name,
    this.priority,
    this.queue,
    @required this.settings,
    this.statusUpdateInterval,
    this.type,
  });
  static JobTemplate fromJson(Map<String, dynamic> json) => JobTemplate();
}

/// JobTemplateSettings contains all the transcode settings saved in the
/// template that will be applied to jobs created from it.
class JobTemplateSettings {
  /// When specified, this offset (in milliseconds) is added to the input Ad
  /// Avail PTS time.
  final int adAvailOffset;

  /// Settings for ad avail blanking. Video can be blanked or overlaid with an
  /// image, and audio muted during SCTE-35 triggered ad avails.
  final AvailBlanking availBlanking;

  /// Settings for Event Signaling And Messaging (ESAM).
  final EsamSettings esam;

  /// Use Inputs (inputs) to define the source file used in the transcode job.
  /// There can only be one input in a job template. Using the API, you can
  /// include multiple inputs when referencing a job template.
  final List<InputTemplate> inputs;

  /// Overlay motion graphics on top of your video. The motion graphics that you
  /// specify here appear on all outputs in all output groups.
  final MotionImageInserter motionImageInserter;

  /// Settings for your Nielsen configuration. If you don't do Nielsen
  /// measurement and analytics, ignore these settings. When you enable Nielsen
  /// configuration (nielsenConfiguration), MediaConvert enables PCM to ID3
  /// tagging for all outputs in the job. To enable Nielsen configuration
  /// programmatically, include an instance of nielsenConfiguration in your JSON
  /// job specification. Even if you don't include any children of
  /// nielsenConfiguration, you still enable the setting.
  final NielsenConfiguration nielsenConfiguration;

  /// (OutputGroups) contains one group of settings for each set of outputs that
  /// share a common package type. All unpackaged files (MPEG-4, MPEG-2 TS,
  /// Quicktime, MXF, and no container) are grouped in a single output group as
  /// well. Required in (OutputGroups) is a group of settings that apply to the
  /// whole group. This required object depends on the value you set for (Type)
  /// under (OutputGroups)>(OutputGroupSettings). Type, settings object pairs
  /// are as follows. * FILE_GROUP_SETTINGS, FileGroupSettings *
  /// HLS_GROUP_SETTINGS, HlsGroupSettings * DASH_ISO_GROUP_SETTINGS,
  /// DashIsoGroupSettings * MS_SMOOTH_GROUP_SETTINGS, MsSmoothGroupSettings *
  /// CMAF_GROUP_SETTINGS, CmafGroupSettings
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig timecodeConfig;

  /// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3
  /// tags in your job. To include timed metadata, you must enable it here,
  /// enable it in each output container, and specify tags and timecodes in ID3
  /// insertion (Id3Insertion) objects.
  final TimedMetadataInsertion timedMetadataInsertion;

  JobTemplateSettings({
    this.adAvailOffset,
    this.availBlanking,
    this.esam,
    this.inputs,
    this.motionImageInserter,
    this.nielsenConfiguration,
    this.outputGroups,
    this.timecodeConfig,
    this.timedMetadataInsertion,
  });
  static JobTemplateSettings fromJson(Map<String, dynamic> json) =>
      JobTemplateSettings();
}

class ListJobTemplatesResponse {
  /// List of Job templates.
  final List<JobTemplate> jobTemplates;

  /// Use this string to request the next batch of job templates.
  final String nextToken;

  ListJobTemplatesResponse({
    this.jobTemplates,
    this.nextToken,
  });
  static ListJobTemplatesResponse fromJson(Map<String, dynamic> json) =>
      ListJobTemplatesResponse();
}

class ListJobsResponse {
  /// List of jobs
  final List<Job> jobs;

  /// Use this string to request the next batch of jobs.
  final String nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  static ListJobsResponse fromJson(Map<String, dynamic> json) =>
      ListJobsResponse();
}

class ListPresetsResponse {
  /// Use this string to request the next batch of presets.
  final String nextToken;

  /// List of presets
  final List<Preset> presets;

  ListPresetsResponse({
    this.nextToken,
    this.presets,
  });
  static ListPresetsResponse fromJson(Map<String, dynamic> json) =>
      ListPresetsResponse();
}

class ListQueuesResponse {
  /// Use this string to request the next batch of queues.
  final String nextToken;

  /// List of queues.
  final List<Queue> queues;

  ListQueuesResponse({
    this.nextToken,
    this.queues,
  });
  static ListQueuesResponse fromJson(Map<String, dynamic> json) =>
      ListQueuesResponse();
}

class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
  /// resource.
  final ResourceTags resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// Settings for SCTE-35 signals from ESAM. Include this in your job settings to
/// put SCTE-35 markers in your HLS and transport stream outputs at the
/// insertion points that you specify in an ESAM XML document. Provide the
/// document in the setting SCC XML (sccXml).
class M2TsScte35Esam {
  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream
  /// generated by ESAM.
  final int scte35EsamPid;

  M2TsScte35Esam({
    this.scte35EsamPid,
  });
  static M2TsScte35Esam fromJson(Map<String, dynamic> json) => M2TsScte35Esam();
}

/// MPEG-2 TS container settings. These apply to outputs in a File output group
/// when the output's container (ContainerType) is MPEG-2 Transport Stream
/// (M2TS). In these assets, data is organized by the program map table (PMT).
/// Each transport stream program contains subsets of data, including audio,
/// video, and metadata. Each of these subsets of data has a numerical label
/// called a packet identifier (PID). Each transport stream program corresponds
/// to one MediaConvert output. The PMT lists the types of data in a program
/// along with their PID. Downstream systems and players use the program map
/// table to look up the PID for each type of data it accesses and then uses the
/// PIDs to locate specific data within the asset.
class M2TsSettings {
  /// Selects between the DVB and ATSC buffer models for Dolby Digital audio.
  final String audioBufferModel;

  /// The number of audio frames to insert for each PES packet.
  final int audioFramesPerPes;

  /// Specify the packet identifiers (PIDs) for any elementary audio streams you
  /// include in this output. Specify multiple PIDs as a JSON array. Default is
  /// the range 482-492.
  final List<int> audioPids;

  /// Specify the output bitrate of the transport stream in bits per second.
  /// Setting to 0 lets the muxer automatically determine the appropriate
  /// bitrate. Other common values are 3750000, 7500000, and 15000000.
  final int bitrate;

  /// Controls what buffer model to use for accurate interleaving. If set to
  /// MULTIPLEX, use multiplex buffer model. If set to NONE, this can lead to
  /// lower latency, but low-memory devices may not be able to play back the
  /// stream without interruptions.
  final String bufferModel;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  final DvbNitSettings dvbNitSettings;

  /// Inserts DVB Service Description Table (NIT) at the specified table
  /// repetition interval.
  final DvbSdtSettings dvbSdtSettings;

  /// Specify the packet identifiers (PIDs) for DVB subtitle data included in
  /// this output. Specify multiple PIDs as a JSON array. Default is the range
  /// 460-479.
  final List<int> dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  final DvbTdtSettings dvbTdtSettings;

  /// Specify the packet identifier (PID) for DVB teletext data you include in
  /// this output. Default is 499.
  final int dvbTeletextPid;

  /// When set to VIDEO_AND_FIXED_INTERVALS, audio EBP markers will be added to
  /// partitions 3 and 4. The interval between these additional markers will be
  /// fixed, and will be slightly shorter than the video EBP marker interval.
  /// When set to VIDEO_INTERVAL, these additional markers will not be inserted.
  /// Only applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  final String ebpAudioInterval;

  /// Selects which PIDs to place EBP markers on. They can either be placed only
  /// on the video PID, or on both the video PID and all audio PIDs. Only
  /// applicable when EBP segmentation markers are is selected
  /// (segmentationMarkers is EBP or EBP_LEGACY).
  final String ebpPlacement;

  /// Controls whether to include the ES Rate field in the PES header.
  final String esRateInPes;

  /// Keep the default value (DEFAULT) unless you know that your audio EBP
  /// markers are incorrectly appearing before your video EBP markers. To
  /// correct this problem, set this value to Force (FORCE).
  final String forceTsVideoEbpOrder;

  /// The length, in seconds, of each fragment. Only used with EBP markers.
  final double fragmentTime;

  /// Specify the maximum time, in milliseconds, between Program Clock
  /// References (PCRs) inserted into the transport stream.
  final int maxPcrInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker. The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make
  /// the lookahead accurate.
  final int minEbpInterval;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  final String nielsenId3;

  /// Value in bits per second of extra null packets to insert into the
  /// transport stream. This can be used if a downstream encryption system
  /// requires periodic null packets.
  final double nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int patInterval;

  /// When set to PCR_EVERY_PES_PACKET, a Program Clock Reference value is
  /// inserted for every Packetized Elementary Stream (PES) header. This is
  /// effective only when the PCR PID is the same as the video or audio
  /// elementary stream.
  final String pcrControl;

  /// Specify the packet identifier (PID) for the program clock reference (PCR)
  /// in this output. If you do not specify a value, the service will use the
  /// value for Video PID (VideoPid).
  final int pcrPid;

  /// Specify the number of milliseconds between instances of the program map
  /// table (PMT) in the output transport stream.
  final int pmtInterval;

  /// Specify the packet identifier (PID) for the program map table (PMT)
  /// itself. Default is 480.
  final int pmtPid;

  /// Specify the packet identifier (PID) of the private metadata stream.
  /// Default is 503.
  final int privateMetadataPid;

  /// Use Program number (programNumber) to specify the program number used in
  /// the program map table (PMT) for this output. Default is 1. Program numbers
  /// and program map tables are parts of MPEG-2 transport stream containers,
  /// used for organizing data.
  final int programNumber;

  /// When set to CBR, inserts null packets into transport stream to fill
  /// specified bitrate. When set to VBR, the bitrate setting acts as the
  /// maximum bitrate, but the output will not be padded up to that bitrate.
  final String rateMode;

  /// Include this in your job settings to put SCTE-35 markers in your HLS and
  /// transport stream outputs at the insertion points that you specify in an
  /// ESAM XML document. Provide the document in the setting SCC XML (sccXml).
  final M2TsScte35Esam scte35Esam;

  /// Specify the packet identifier (PID) of the SCTE-35 stream in the transport
  /// stream.
  final int scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this
  /// output. For SCTE-35 markers from an ESAM XML document-- Choose None
  /// (NONE). Also provide the ESAM XML as a string in the setting Signal
  /// processing notification XML (sccXml). Also enable ESAM SCTE-35 (include
  /// the property scte35Esam).
  final String scte35Source;

  /// Inserts segmentation markers at each segmentation_time period.
  /// rai_segstart sets the Random Access Indicator bit in the adaptation field.
  /// rai_adapt sets the RAI bit and adds the current timecode in the private
  /// data bytes. psi_segstart inserts PAT and PMT tables at the start of
  /// segments. ebp adds Encoder Boundary Point information to the adaptation
  /// field as per OpenCable specification OC-SP-EBP-I01-130118. ebp_legacy adds
  /// Encoder Boundary Point information to the adaptation field using a legacy
  /// proprietary format.
  final String segmentationMarkers;

  /// The segmentation style parameter controls how segmentation markers are
  /// inserted into the transport stream. With avails, it is possible that
  /// segments may be truncated, which can influence where future segmentation
  /// markers are inserted. When a segmentation style of "reset_cadence" is
  /// selected and a segment is truncated due to an avail, we will reset the
  /// segmentation cadence. This means the subsequent segment will have a
  /// duration of of $segmentation_time seconds. When a segmentation style of
  /// "maintain_cadence" is selected and a segment is truncated due to an avail,
  /// we will not reset the segmentation cadence. This means the subsequent
  /// segment will likely be truncated as well. However, all segments after that
  /// will have a duration of $segmentation_time seconds. Note that EBP
  /// lookahead is a slight exception to this rule.
  final String segmentationStyle;

  /// Specify the length, in seconds, of each segment. Required unless markers
  /// is set to _none_.
  final double segmentationTime;

  /// Specify the packet identifier (PID) for timed metadata in this output.
  /// Default is 502.
  final int timedMetadataPid;

  /// Specify the ID for the transport stream itself in the program map table
  /// for this output. Transport stream IDs and program map tables are parts of
  /// MPEG-2 transport stream containers, used for organizing data.
  final int transportStreamId;

  /// Specify the packet identifier (PID) of the elementary video stream in the
  /// transport stream.
  final int videoPid;

  M2TsSettings({
    this.audioBufferModel,
    this.audioFramesPerPes,
    this.audioPids,
    this.bitrate,
    this.bufferModel,
    this.dvbNitSettings,
    this.dvbSdtSettings,
    this.dvbSubPids,
    this.dvbTdtSettings,
    this.dvbTeletextPid,
    this.ebpAudioInterval,
    this.ebpPlacement,
    this.esRateInPes,
    this.forceTsVideoEbpOrder,
    this.fragmentTime,
    this.maxPcrInterval,
    this.minEbpInterval,
    this.nielsenId3,
    this.nullPacketBitrate,
    this.patInterval,
    this.pcrControl,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.privateMetadataPid,
    this.programNumber,
    this.rateMode,
    this.scte35Esam,
    this.scte35Pid,
    this.scte35Source,
    this.segmentationMarkers,
    this.segmentationStyle,
    this.segmentationTime,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  static M2TsSettings fromJson(Map<String, dynamic> json) => M2TsSettings();
}

/// Settings for TS segments in HLS
class M3U8Settings {
  /// The number of audio frames to insert for each PES packet.
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or
  /// by comma separation.
  final List<int> audioPids;

  /// If INSERT, Nielsen inaudible tones for media tracking will be detected in
  /// the input audio and an equivalent ID3 tag will be inserted in the output.
  final String nielsenId3;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int patInterval;

  /// When set to PCR_EVERY_PES_PACKET a Program Clock Reference value is
  /// inserted for every Packetized Elementary Stream (PES) header. This
  /// parameter is effective only when the PCR PID is the same as the video or
  /// audio elementary stream.
  final String pcrControl;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID.
  final int pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream.
  final int pmtPid;

  /// Packet Identifier (PID) of the private metadata stream in the transport
  /// stream.
  final int privateMetadataPid;

  /// The value of the program number field in the Program Map Table.
  final int programNumber;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream.
  final int scte35Pid;

  /// For SCTE-35 markers from your input-- Choose Passthrough (PASSTHROUGH) if
  /// you want SCTE-35 markers that appear in your input to also appear in this
  /// output. Choose None (NONE) if you don't want SCTE-35 markers in this
  /// output. For SCTE-35 markers from an ESAM XML document-- Choose None (NONE)
  /// if you don't want manifest conditioning. Choose Passthrough (PASSTHROUGH)
  /// and choose Ad markers (adMarkers) if you do want manifest conditioning. In
  /// both cases, also provide the ESAM XML as a string in the setting Signal
  /// processing notification XML (sccXml).
  final String scte35Source;

  /// Applies only to HLS outputs. Use this setting to specify whether the
  /// service inserts the ID3 timed metadata from the input in this output.
  final String timedMetadata;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream.
  final int timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream.
  final int videoPid;

  M3U8Settings({
    this.audioFramesPerPes,
    this.audioPids,
    this.nielsenId3,
    this.patInterval,
    this.pcrControl,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.privateMetadataPid,
    this.programNumber,
    this.scte35Pid,
    this.scte35Source,
    this.timedMetadata,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  static M3U8Settings fromJson(Map<String, dynamic> json) => M3U8Settings();
}

/// Overlay motion graphics on top of your video at the time that you specify.
class MotionImageInserter {
  /// If your motion graphic asset is a .mov file, keep this setting
  /// unspecified. If your motion graphic asset is a series of .png files,
  /// specify the frame rate of the overlay in frames per second, as a fraction.
  /// For example, specify 24 fps as 24/1. Make sure that the number of images
  /// in your series matches the frame rate and your intended overlay duration.
  /// For example, if you want a 30-second overlay at 30 fps, you should have
  /// 900 .png images. This overlay frame rate doesn't need to match the frame
  /// rate of the underlying video.
  final MotionImageInsertionFramerate framerate;

  /// Specify the .mov file or series of .png files that you want to overlay on
  /// your video. For .png files, provide the file name of the first file in the
  /// series. Make sure that the names of the .png files end with sequential
  /// numbers that specify the order that they are played in. For example,
  /// overlay_000.png, overlay_001.png, overlay_002.png, and so on. The sequence
  /// must start at zero, and each image file name must have the same number of
  /// digits. Pad your initial file names with enough zeros to complete the
  /// sequence. For example, if the first image is overlay_0.png, there can be
  /// only 10 images in the sequence, with the last image being overlay_9.png.
  /// But if the first image is overlay_00.png, there can be 100 images in the
  /// sequence.
  final String input;

  /// Choose the type of motion graphic asset that you are providing for your
  /// overlay. You can choose either a .mov file or a series of .png files.
  final String insertionMode;

  /// Use Offset to specify the placement of your motion graphic overlay on the
  /// video frame. Specify in pixels, from the upper-left corner of the frame.
  /// If you don't specify an offset, the service scales your overlay to the
  /// full size of the frame. Otherwise, the service inserts the overlay at its
  /// native resolution and scales the size up or down with any video scaling.
  final MotionImageInsertionOffset offset;

  /// Specify whether your motion graphic overlay repeats on a loop or plays
  /// only once.
  final String playback;

  /// Specify when the motion overlay begins. Use timecode format (HH:MM:SS:FF
  /// or HH:MM:SS;FF). Make sure that the timecode you provide here takes into
  /// account how you have set up your timecode configuration under both job
  /// settings and input settings. The simplest way to do that is to set both to
  /// start at 0. If you need to set up your job to follow timecodes embedded in
  /// your source that don't start at zero, make sure that you specify a start
  /// time that is after the first embedded timecode. For more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/setting-up-timecode.html
  /// Find job-wide and input timecode configuration settings in your JSON job
  /// settings specification at settings>timecodeConfig>source and
  /// settings>inputs>timecodeSource.
  final String startTime;

  MotionImageInserter({
    this.framerate,
    this.input,
    this.insertionMode,
    this.offset,
    this.playback,
    this.startTime,
  });
  static MotionImageInserter fromJson(Map<String, dynamic> json) =>
      MotionImageInserter();
}

/// For motion overlays that don't have a built-in frame rate, specify the frame
/// rate of the overlay in frames per second, as a fraction. For example,
/// specify 24 fps as 24/1. The overlay frame rate doesn't need to match the
/// frame rate of the underlying video.
class MotionImageInsertionFramerate {
  /// The bottom of the fraction that expresses your overlay frame rate. For
  /// example, if your frame rate is 24 fps, set this value to 1.
  final int framerateDenominator;

  /// The top of the fraction that expresses your overlay frame rate. For
  /// example, if your frame rate is 24 fps, set this value to 24.
  final int framerateNumerator;

  MotionImageInsertionFramerate({
    this.framerateDenominator,
    this.framerateNumerator,
  });
  static MotionImageInsertionFramerate fromJson(Map<String, dynamic> json) =>
      MotionImageInsertionFramerate();
}

/// Specify the offset between the upper-left corner of the video frame and the
/// top left corner of the overlay.
class MotionImageInsertionOffset {
  /// Set the distance, in pixels, between the overlay and the left edge of the
  /// video frame.
  final int imagex;

  /// Set the distance, in pixels, between the overlay and the top edge of the
  /// video frame.
  final int imagey;

  MotionImageInsertionOffset({
    this.imagex,
    this.imagey,
  });
  static MotionImageInsertionOffset fromJson(Map<String, dynamic> json) =>
      MotionImageInsertionOffset();
}

/// Settings for MOV Container.
class MovSettings {
  /// When enabled, include 'clap' atom if appropriate for the video output
  /// settings.
  final String clapAtom;

  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  final String cslgAtom;

  /// When set to XDCAM, writes MPEG2 video streams into the QuickTime file
  /// using XDCAM fourcc codes. This increases compatibility with Apple editors
  /// and players, but may decrease compatibility with other players. Only
  /// applicable when the video codec is MPEG2.
  final String mpeg2FourCCControl;

  /// If set to OMNEON, inserts Omneon-compatible padding
  final String paddingControl;

  /// Always keep the default value (SELF_CONTAINED) for this setting.
  final String reference;

  MovSettings({
    this.clapAtom,
    this.cslgAtom,
    this.mpeg2FourCCControl,
    this.paddingControl,
    this.reference,
  });
  static MovSettings fromJson(Map<String, dynamic> json) => MovSettings();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value MP2.
class Mp2Settings {
  /// Specify the average bitrate in bits per second.
  final int bitrate;

  /// Set Channels to specify the number of channels in this output audio track.
  /// Choosing Mono in the console will give you 1 output channel; choosing
  /// Stereo will give you 2. In the API, valid values are 1 and 2.
  final int channels;

  /// Sample rate in hz.
  final int sampleRate;

  Mp2Settings({
    this.bitrate,
    this.channels,
    this.sampleRate,
  });
  static Mp2Settings fromJson(Map<String, dynamic> json) => Mp2Settings();
}

/// Settings for MP4 container. You can create audio-only AAC outputs with this
/// container.
class Mp4Settings {
  /// When enabled, file composition times will start at zero, composition times
  /// in the 'ctts' (composition time to sample) box for B-frames will be
  /// negative, and a 'cslg' (composition shift least greatest) box will be
  /// included per 14496-1 amendment 1. This improves compatibility with Apple
  /// players and tools.
  final String cslgAtom;

  /// Inserts a free-space box immediately after the moov box.
  final String freeSpaceBox;

  /// If set to PROGRESSIVE_DOWNLOAD, the MOOV atom is relocated to the
  /// beginning of the archive as required for progressive downloading.
  /// Otherwise it is placed normally at the end.
  final String moovPlacement;

  /// Overrides the "Major Brand" field in the output file. Usually not
  /// necessary to specify.
  final String mp4MajorBrand;

  Mp4Settings({
    this.cslgAtom,
    this.freeSpaceBox,
    this.moovPlacement,
    this.mp4MajorBrand,
  });
  static Mp4Settings fromJson(Map<String, dynamic> json) => Mp4Settings();
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value MPEG2.
class Mpeg2Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final String adaptiveQuantization;

  /// Specify the average bitrate in bits per second. Required for VBR and CBR.
  /// For MS Smooth outputs, bitrates must be unique when rounded down to the
  /// nearest multiple of 1000.
  final int bitrate;

  /// Use Level (Mpeg2CodecLevel) to set the MPEG-2 level for the video output.
  final String codecLevel;

  /// Use Profile (Mpeg2CodecProfile) to set the MPEG-2 profile for the video
  /// output.
  final String codecProfile;

  /// Choose Adaptive to improve subjective video quality for high-motion
  /// content. This will cause the service to use fewer B-frames (which infer
  /// information based on other frames) for high-motion portions of the video
  /// and more B-frames for low-motion portions. The maximum number of B-frames
  /// is limited by the value you provide for the setting B frames between
  /// reference frames (numberBFramesBetweenReferenceFrames).
  final String dynamicSubGop;

  /// If you are using the console, use the Framerate setting to specify the
  /// frame rate for this output. If you want to keep the same frame rate as the
  /// input video, choose Follow source. If you want to do frame rate
  /// conversion, choose a frame rate from the dropdown list or choose Custom.
  /// The framerates shown in the dropdown list are decimal approximations of
  /// fractions. If you choose Custom, specify your frame rate as a fraction. If
  /// you are creating your transcoding job sepecification as a JSON file
  /// without the console, use FramerateControl to specify which value the
  /// service uses for the frame rate for this output. Choose
  /// INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from
  /// the input. Choose SPECIFIED if you want the service to use the frame rate
  /// you specify in the settings FramerateNumerator and FramerateDenominator.
  final String framerateControl;

  /// When set to INTERPOLATE, produces smoother motion during frame rate
  /// conversion.
  final String framerateConversionAlgorithm;

  /// Frame rate denominator.
  final int framerateDenominator;

  /// Frame rate numerator - frame rate is a fraction, e.g. 24000 / 1001 =
  /// 23.976 fps.
  final int framerateNumerator;

  /// Frequency of closed GOPs. In streaming applications, it is recommended
  /// that this be set to 1 so a decoder joining mid-stream will receive an IDR
  /// frame as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int gopClosedCadence;

  /// GOP Length (keyframe interval) in frames or seconds. Must be greater than
  /// zero.
  final double gopSize;

  /// Indicates if the GOP Size in MPEG2 is specified in frames or seconds. If
  /// seconds the system will convert the GOP Size into a frame count at run
  /// time.
  final String gopSizeUnits;

  /// Percentage of the buffer that should initially be filled (HRD buffer
  /// model).
  final int hrdBufferInitialFillPercentage;

  /// Size of buffer (HRD buffer model) in bits. For example, enter five
  /// megabits as 5000000.
  final int hrdBufferSize;

  /// Use Interlace mode (InterlaceMode) to choose the scan line type for the
  /// output. * Top Field First (TOP_FIELD) and Bottom Field First
  /// (BOTTOM_FIELD) produce interlaced output with the entire output having the
  /// same field polarity (top or bottom first). * Follow, Default Top
  /// (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use
  /// the same field polarity as the source. Therefore, behavior depends on the
  /// input scan type. - If the source is interlaced, the output will be
  /// interlaced with the same polarity as the source (it will follow the
  /// source). The output could therefore be a mix of "top field first" and
  /// "bottom field first". - If the source is progressive, the output will be
  /// interlaced with "top field first" or "bottom field first" polarity,
  /// depending on which of the Follow options you chose.
  final String interlaceMode;

  /// Use Intra DC precision (Mpeg2IntraDcPrecision) to set quantization
  /// precision for intra-block DC coefficients. If you choose the value auto,
  /// the service will automatically select the precision based on the per-frame
  /// compression ratio.
  final String intraDcPrecision;

  /// Maximum bitrate in bits/second. For example, enter five megabits per
  /// second as 5000000.
  final int maxBitrate;

  /// Enforces separation between repeated (cadence) I-frames and I-frames
  /// inserted by Scene Change Detection. If a scene change I-frame is within
  /// I-interval frames of a cadence I-frame, the GOP is shrunk and/or stretched
  /// to the scene change I-frame. GOP stretch requires enabling lookahead as
  /// well as setting I-interval. The normal cadence resumes for the next GOP.
  /// This setting is only used when Scene Change Detect is enabled. Note:
  /// Maximum GOP stretch = GOP size + Min-I-interval - 1
  final int miniInterval;

  /// Number of B-frames between reference frames.
  final int numberbFramesBetweenReferenceFrames;

  /// Using the API, enable ParFollowSource if you want the service to use the
  /// pixel aspect ratio from the input. Using the console, do this by choosing
  /// Follow source for Pixel aspect ratio.
  final String parControl;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// Use Quality tuning level (Mpeg2QualityTuningLevel) to specifiy whether to
  /// use single-pass or multipass video encoding.
  final String qualityTuningLevel;

  /// Use Rate control mode (Mpeg2RateControlMode) to specifiy whether the
  /// bitrate is variable (vbr) or constant (cbr).
  final String rateControlMode;

  /// Enable this setting to insert I-frames at scene changes that the service
  /// automatically detects. This improves video quality and is enabled by
  /// default.
  final String sceneChangeDetect;

  /// Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled
  /// as 25fps, and audio is sped up correspondingly.
  final String slowPal;

  /// Softness. Selects quantizer matrix, larger values reduce high-frequency
  /// content in the encoded image.
  final int softness;

  /// Adjust quantization within each frame based on spatial variation of
  /// content complexity.
  final String spatialAdaptiveQuantization;

  /// Produces a Type D-10 compatible bitstream (SMPTE 356M-2001).
  final String syntax;

  /// Only use Telecine (Mpeg2Telecine) when you set Framerate (Framerate) to
  /// 29.970. Set Telecine (Mpeg2Telecine) to Hard (hard) to produce a 29.97i
  /// output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output
  /// and leave converstion to the player.
  final String telecine;

  /// Adjust quantization within each frame based on temporal variation of
  /// content complexity.
  final String temporalAdaptiveQuantization;

  Mpeg2Settings({
    this.adaptiveQuantization,
    this.bitrate,
    this.codecLevel,
    this.codecProfile,
    this.dynamicSubGop,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.hrdBufferInitialFillPercentage,
    this.hrdBufferSize,
    this.interlaceMode,
    this.intraDcPrecision,
    this.maxBitrate,
    this.miniInterval,
    this.numberbFramesBetweenReferenceFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.qualityTuningLevel,
    this.rateControlMode,
    this.sceneChangeDetect,
    this.slowPal,
    this.softness,
    this.spatialAdaptiveQuantization,
    this.syntax,
    this.telecine,
    this.temporalAdaptiveQuantization,
  });
  static Mpeg2Settings fromJson(Map<String, dynamic> json) => Mpeg2Settings();
}

/// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to specify
/// the value SpekeKeyProvider.
class MsSmoothEncryptionSettings {
  /// If your output group type is HLS, DASH, or Microsoft Smooth, use these
  /// settings when doing DRM encryption with a SPEKE-compliant key provider. If
  /// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
  /// instead.
  final SpekeKeyProvider spekeKeyProvider;

  MsSmoothEncryptionSettings({
    this.spekeKeyProvider,
  });
  static MsSmoothEncryptionSettings fromJson(Map<String, dynamic> json) =>
      MsSmoothEncryptionSettings();
}

/// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
/// MS_SMOOTH_GROUP_SETTINGS.
class MsSmoothGroupSettings {
  /// COMBINE_DUPLICATE_STREAMS combines identical audio encoding settings
  /// across a Microsoft Smooth output group into a single audio stream.
  final String audioDeduplication;

  /// Use Destination (Destination) to specify the S3 output location and the
  /// output filename base. Destination accepts format identifiers. If you do
  /// not specify the base filename in the URI, the service will use the
  /// filename of the input file. If your job has multiple inputs, the service
  /// uses the filename of the first input file.
  final String destination;

  /// Settings associated with the destination. Will vary based on the type of
  /// destination
  final DestinationSettings destinationSettings;

  /// If you are using DRM, set DRM System (MsSmoothEncryptionSettings) to
  /// specify the value SpekeKeyProvider.
  final MsSmoothEncryptionSettings encryption;

  /// Use Fragment length (FragmentLength) to specify the mp4 fragment sizes in
  /// seconds. Fragment length must be compatible with GOP size and frame rate.
  final int fragmentLength;

  /// Use Manifest encoding (MsSmoothManifestEncoding) to specify the encoding
  /// format for the server and client manifest. Valid options are utf8 and
  /// utf16.
  final String manifestEncoding;

  MsSmoothGroupSettings({
    this.audioDeduplication,
    this.destination,
    this.destinationSettings,
    this.encryption,
    this.fragmentLength,
    this.manifestEncoding,
  });
  static MsSmoothGroupSettings fromJson(Map<String, dynamic> json) =>
      MsSmoothGroupSettings();
}

/// Settings for your Nielsen configuration. If you don't do Nielsen measurement
/// and analytics, ignore these settings. When you enable Nielsen configuration
/// (nielsenConfiguration), MediaConvert enables PCM to ID3 tagging for all
/// outputs in the job. To enable Nielsen configuration programmatically,
/// include an instance of nielsenConfiguration in your JSON job specification.
/// Even if you don't include any children of nielsenConfiguration, you still
/// enable the setting.
class NielsenConfiguration {
  /// Nielsen has discontinued the use of breakout code functionality. If you
  /// must include this property, set the value to zero.
  final int breakoutCode;

  /// Use Distributor ID (DistributorID) to specify the distributor ID that is
  /// assigned to your organization by Neilsen.
  final String distributorId;

  NielsenConfiguration({
    this.breakoutCode,
    this.distributorId,
  });
  static NielsenConfiguration fromJson(Map<String, dynamic> json) =>
      NielsenConfiguration();
}

/// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
/// video output if necessary. Enable or disable this feature for each output
/// individually. This setting is disabled by default. When you enable Noise
/// reducer (NoiseReducer), you must also select a value for Noise reducer
/// filter (NoiseReducerFilter).
class NoiseReducer {
  /// Use Noise reducer filter (NoiseReducerFilter) to select one of the
  /// following spatial image filtering functions. To use this setting, you must
  /// also enable Noise reducer (NoiseReducer). * Bilateral preserves edges
  /// while reducing noise. * Mean (softest), Gaussian, Lanczos, and Sharpen
  /// (sharpest) do convolution filtering. * Conserve does min/max noise
  /// reduction. * Spatial does frequency-domain filtering based on JND
  /// principles. * Temporal optimizes video quality for complex motion.
  final String filter;

  /// Settings for a noise reducer filter
  final NoiseReducerFilterSettings filterSettings;

  /// Noise reducer filter settings for spatial filter.
  final NoiseReducerSpatialFilterSettings spatialFilterSettings;

  /// Noise reducer filter settings for temporal filter.
  final NoiseReducerTemporalFilterSettings temporalFilterSettings;

  NoiseReducer({
    this.filter,
    this.filterSettings,
    this.spatialFilterSettings,
    this.temporalFilterSettings,
  });
  static NoiseReducer fromJson(Map<String, dynamic> json) => NoiseReducer();
}

/// Settings for a noise reducer filter
class NoiseReducerFilterSettings {
  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  final int strength;

  NoiseReducerFilterSettings({
    this.strength,
  });
  static NoiseReducerFilterSettings fromJson(Map<String, dynamic> json) =>
      NoiseReducerFilterSettings();
}

/// Noise reducer filter settings for spatial filter.
class NoiseReducerSpatialFilterSettings {
  /// Specify strength of post noise reduction sharpening filter, with 0
  /// disabling the filter and 3 enabling it at maximum strength.
  final int postFilterSharpenStrength;

  /// The speed of the filter, from -2 (lower speed) to 3 (higher speed), with 0
  /// being the nominal value.
  final int speed;

  /// Relative strength of noise reducing filter. Higher values produce stronger
  /// filtering.
  final int strength;

  NoiseReducerSpatialFilterSettings({
    this.postFilterSharpenStrength,
    this.speed,
    this.strength,
  });
  static NoiseReducerSpatialFilterSettings fromJson(
          Map<String, dynamic> json) =>
      NoiseReducerSpatialFilterSettings();
}

/// Noise reducer filter settings for temporal filter.
class NoiseReducerTemporalFilterSettings {
  /// Use Aggressive mode for content that has complex motion. Higher values
  /// produce stronger temporal filtering. This filters highly complex scenes
  /// more aggressively and creates better VQ for low bitrate outputs.
  final int aggressiveMode;

  /// The speed of the filter (higher number is faster). Low setting reduces bit
  /// rate at the cost of transcode time, high setting improves transcode time
  /// at the cost of bit rate.
  final int speed;

  /// Specify the strength of the noise reducing filter on this output. Higher
  /// values produce stronger filtering. We recommend the following value
  /// ranges, depending on the result that you want: * 0-2 for complexity
  /// reduction with minimal sharpness loss * 2-8 for complexity reduction with
  /// image preservation * 8-16 for a high level of complexity reduction
  final int strength;

  NoiseReducerTemporalFilterSettings({
    this.aggressiveMode,
    this.speed,
    this.strength,
  });
  static NoiseReducerTemporalFilterSettings fromJson(
          Map<String, dynamic> json) =>
      NoiseReducerTemporalFilterSettings();
}

/// An output object describes the settings for a single output file or stream
/// in an output group.
class Output {
  /// (AudioDescriptions) contains groups of audio encoding settings organized
  /// by audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  final List<AudioDescription> audioDescriptions;

  /// (CaptionDescriptions) contains groups of captions settings. For each
  /// output that has captions, include one instance of (CaptionDescriptions).
  /// (CaptionDescriptions) can contain multiple groups of captions settings.
  final List<CaptionDescription> captionDescriptions;

  /// Container specific settings.
  final ContainerSettings containerSettings;

  /// Use Extension (Extension) to specify the file extension for outputs in
  /// File output groups. If you do not specify a value, the service will use
  /// default extensions by container type as follows * MPEG-2 transport stream,
  /// m2ts * Quicktime, mov * MXF container, mxf * MPEG-4 container, mp4 * No
  /// Container, the service will use codec extensions (e.g. AAC, H265, H265,
  /// AC3)
  final String extension;

  /// Use Name modifier (NameModifier) to have the service add a string to the
  /// end of each output filename. You specify the base filename as part of your
  /// destination URI. When you create multiple outputs in the same output
  /// group, Name modifier (NameModifier) is required. Name modifier also
  /// accepts format identifiers. For DASH ISO outputs, if you use the format
  /// identifiers $Number$ or $Time$ in one output, you must use them in the
  /// same way in all outputs of the output group.
  final String nameModifier;

  /// Specific settings for this type of output.
  final OutputSettings outputSettings;

  /// Use Preset (Preset) to specifiy a preset for your transcoding settings.
  /// Provide the system or custom preset name. You can specify either Preset
  /// (Preset) or Container settings (ContainerSettings), but not both.
  final String preset;

  /// (VideoDescription) contains a group of video encoding settings. The
  /// specific video settings depend on the video codec that you choose when you
  /// specify a value for Video codec (codec). Include one instance of
  /// (VideoDescription) per output.
  final VideoDescription videoDescription;

  Output({
    this.audioDescriptions,
    this.captionDescriptions,
    this.containerSettings,
    this.extension,
    this.nameModifier,
    this.outputSettings,
    this.preset,
    this.videoDescription,
  });
  static Output fromJson(Map<String, dynamic> json) => Output();
}

/// OutputChannel mapping settings.
class OutputChannelMapping {
  /// List of input channels
  final List<int> inputChannels;

  OutputChannelMapping({
    this.inputChannels,
  });
  static OutputChannelMapping fromJson(Map<String, dynamic> json) =>
      OutputChannelMapping();
}

/// Details regarding output
class OutputDetail {
  /// Duration in milliseconds
  final int durationInMs;

  /// Contains details about the output's video stream
  final VideoDetail videoDetails;

  OutputDetail({
    this.durationInMs,
    this.videoDetails,
  });
  static OutputDetail fromJson(Map<String, dynamic> json) => OutputDetail();
}

/// Group of outputs
class OutputGroup {
  /// Use Custom Group Name (CustomName) to specify a name for the output group.
  /// This value is displayed on the console and can make your job settings JSON
  /// more human-readable. It does not affect your outputs. Use up to twelve
  /// characters that are either letters, numbers, spaces, or underscores.
  final String customName;

  /// Name of the output group
  final String name;

  /// Output Group settings, including type
  final OutputGroupSettings outputGroupSettings;

  /// This object holds groups of encoding settings, one group of settings per
  /// output.
  final List<Output> outputs;

  OutputGroup({
    this.customName,
    this.name,
    this.outputGroupSettings,
    this.outputs,
  });
  static OutputGroup fromJson(Map<String, dynamic> json) => OutputGroup();
}

/// Contains details about the output groups specified in the job settings.
class OutputGroupDetail {
  /// Details about the output
  final List<OutputDetail> outputDetails;

  OutputGroupDetail({
    this.outputDetails,
  });
  static OutputGroupDetail fromJson(Map<String, dynamic> json) =>
      OutputGroupDetail();
}

/// Output Group settings, including type
class OutputGroupSettings {
  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// CMAF_GROUP_SETTINGS. Each output in a CMAF Output Group may only contain a
  /// single video, audio, or caption output.
  final CmafGroupSettings cmafGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// DASH_ISO_GROUP_SETTINGS.
  final DashIsoGroupSettings dashIsoGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// FILE_GROUP_SETTINGS.
  final FileGroupSettings fileGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// HLS_GROUP_SETTINGS.
  final HlsGroupSettings hlsGroupSettings;

  /// Required when you set (Type) under (OutputGroups)>(OutputGroupSettings) to
  /// MS_SMOOTH_GROUP_SETTINGS.
  final MsSmoothGroupSettings msSmoothGroupSettings;

  /// Type of output group (File group, Apple HLS, DASH ISO, Microsoft Smooth
  /// Streaming, CMAF)
  final String type;

  OutputGroupSettings({
    this.cmafGroupSettings,
    this.dashIsoGroupSettings,
    this.fileGroupSettings,
    this.hlsGroupSettings,
    this.msSmoothGroupSettings,
    this.type,
  });
  static OutputGroupSettings fromJson(Map<String, dynamic> json) =>
      OutputGroupSettings();
}

/// Specific settings for this type of output.
class OutputSettings {
  /// Settings for HLS output groups
  final HlsSettings hlsSettings;

  OutputSettings({
    this.hlsSettings,
  });
  static OutputSettings fromJson(Map<String, dynamic> json) => OutputSettings();
}

/// A preset is a collection of preconfigured media conversion settings that you
/// want MediaConvert to apply to the output during the conversion process.
class Preset {
  /// An identifier for this resource that is unique within all of AWS.
  final String arn;

  /// An optional category you create to organize your presets.
  final String category;

  /// The timestamp in epoch seconds for preset creation.
  final DateTime createdAt;

  /// An optional description you create for each preset.
  final String description;

  /// The timestamp in epoch seconds when the preset was last updated.
  final DateTime lastUpdated;

  /// A name you create for each preset. Each name must be unique within your
  /// account.
  final String name;

  /// Settings for preset
  final PresetSettings settings;

  /// A preset can be of two types: system or custom. System or built-in preset
  /// can't be modified or deleted by the user.
  final String type;

  Preset({
    this.arn,
    this.category,
    this.createdAt,
    this.description,
    this.lastUpdated,
    @required this.name,
    @required this.settings,
    this.type,
  });
  static Preset fromJson(Map<String, dynamic> json) => Preset();
}

/// Settings for preset
class PresetSettings {
  /// (AudioDescriptions) contains groups of audio encoding settings organized
  /// by audio codec. Include one instance of (AudioDescriptions) per output.
  /// (AudioDescriptions) can contain multiple groups of encoding settings.
  final List<AudioDescription> audioDescriptions;

  /// Caption settings for this preset. There can be multiple caption settings
  /// in a single output.
  final List<CaptionDescriptionPreset> captionDescriptions;

  /// Container specific settings.
  final ContainerSettings containerSettings;

  /// (VideoDescription) contains a group of video encoding settings. The
  /// specific video settings depend on the video codec that you choose when you
  /// specify a value for Video codec (codec). Include one instance of
  /// (VideoDescription) per output.
  final VideoDescription videoDescription;

  PresetSettings({
    this.audioDescriptions,
    this.captionDescriptions,
    this.containerSettings,
    this.videoDescription,
  });
  static PresetSettings fromJson(Map<String, dynamic> json) => PresetSettings();
}

/// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
/// the value PRORES.
class ProresSettings {
  /// Use Profile (ProResCodecProfile) to specifiy the type of Apple ProRes
  /// codec to use for this output.
  final String codecProfile;

  /// If you are using the console, use the Framerate setting to specify the
  /// frame rate for this output. If you want to keep the same frame rate as the
  /// input video, choose Follow source. If you want to do frame rate
  /// conversion, choose a frame rate from the dropdown list or choose Custom.
  /// The framerates shown in the dropdown list are decimal approximations of
  /// fractions. If you choose Custom, specify your frame rate as a fraction. If
  /// you are creating your transcoding job sepecification as a JSON file
  /// without the console, use FramerateControl to specify which value the
  /// service uses for the frame rate for this output. Choose
  /// INITIALIZE_FROM_SOURCE if you want the service to use the frame rate from
  /// the input. Choose SPECIFIED if you want the service to use the frame rate
  /// you specify in the settings FramerateNumerator and FramerateDenominator.
  final String framerateControl;

  /// When set to INTERPOLATE, produces smoother motion during frame rate
  /// conversion.
  final String framerateConversionAlgorithm;

  /// Frame rate denominator.
  final int framerateDenominator;

  /// When you use the API for transcode jobs that use frame rate conversion,
  /// specify the frame rate as a fraction. For example, 24000 / 1001 = 23.976
  /// fps. Use FramerateNumerator to specify the numerator of this fraction. In
  /// this example, use 24000 for the value of FramerateNumerator.
  final int framerateNumerator;

  /// Use Interlace mode (InterlaceMode) to choose the scan line type for the
  /// output. * Top Field First (TOP_FIELD) and Bottom Field First
  /// (BOTTOM_FIELD) produce interlaced output with the entire output having the
  /// same field polarity (top or bottom first). * Follow, Default Top
  /// (FOLLOW_TOP_FIELD) and Follow, Default Bottom (FOLLOW_BOTTOM_FIELD) use
  /// the same field polarity as the source. Therefore, behavior depends on the
  /// input scan type. - If the source is interlaced, the output will be
  /// interlaced with the same polarity as the source (it will follow the
  /// source). The output could therefore be a mix of "top field first" and
  /// "bottom field first". - If the source is progressive, the output will be
  /// interlaced with "top field first" or "bottom field first" polarity,
  /// depending on which of the Follow options you chose.
  final String interlaceMode;

  /// Use (ProresParControl) to specify how the service determines the pixel
  /// aspect ratio. Set to Follow source (INITIALIZE_FROM_SOURCE) to use the
  /// pixel aspect ratio from the input. To specify a different pixel aspect
  /// ratio: Using the console, choose it from the dropdown menu. Using the API,
  /// set ProresParControl to (SPECIFIED) and provide for (ParNumerator) and
  /// (ParDenominator).
  final String parControl;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// Enables Slow PAL rate conversion. 23.976fps and 24fps input is relabeled
  /// as 25fps, and audio is sped up correspondingly.
  final String slowPal;

  /// Only use Telecine (ProresTelecine) when you set Framerate (Framerate) to
  /// 29.970. Set Telecine (ProresTelecine) to Hard (hard) to produce a 29.97i
  /// output from a 23.976 input. Set it to Soft (soft) to produce 23.976 output
  /// and leave converstion to the player.
  final String telecine;

  ProresSettings({
    this.codecProfile,
    this.framerateControl,
    this.framerateConversionAlgorithm,
    this.framerateDenominator,
    this.framerateNumerator,
    this.interlaceMode,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.slowPal,
    this.telecine,
  });
  static ProresSettings fromJson(Map<String, dynamic> json) => ProresSettings();
}

/// You can use queues to manage the resources that are available to your AWS
/// account for running multiple transcoding jobs at the same time. If you don't
/// specify a queue, the service sends all jobs through the default queue. For
/// more information, see
/// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
class Queue {
  /// An identifier for this resource that is unique within all of AWS.
  final String arn;

  /// The timestamp in epoch seconds for when you created the queue.
  final DateTime createdAt;

  /// An optional description that you create for each queue.
  final String description;

  /// The timestamp in epoch seconds for when you most recently updated the
  /// queue.
  final DateTime lastUpdated;

  /// A name that you create for each queue. Each name must be unique within
  /// your account.
  final String name;

  /// Specifies whether the pricing plan for the queue is on-demand or reserved.
  /// For on-demand, you pay per minute, billed in increments of .01 minute. For
  /// reserved, you pay for the transcoding capacity of the entire queue,
  /// regardless of how much or how little you use it. Reserved pricing requires
  /// a 12-month commitment.
  final String pricingPlan;

  /// The estimated number of jobs with a PROGRESSING status.
  final int progressingJobsCount;

  /// Details about the pricing plan for your reserved queue. Required for
  /// reserved queues and not applicable to on-demand queues.
  final ReservationPlan reservationPlan;

  /// Queues can be ACTIVE or PAUSED. If you pause a queue, the service won't
  /// begin processing jobs in that queue. Jobs that are running when you pause
  /// the queue continue to run until they finish or result in an error.
  final String status;

  /// The estimated number of jobs with a SUBMITTED status.
  final int submittedJobsCount;

  /// Specifies whether this on-demand queue is system or custom. System queues
  /// are built in. You can't modify or delete system queues. You can create and
  /// modify custom queues.
  final String type;

  Queue({
    this.arn,
    this.createdAt,
    this.description,
    this.lastUpdated,
    @required this.name,
    this.pricingPlan,
    this.progressingJobsCount,
    this.reservationPlan,
    this.status,
    this.submittedJobsCount,
    this.type,
  });
  static Queue fromJson(Map<String, dynamic> json) => Queue();
}

/// Use Rectangle to identify a specific area of the video frame.
class Rectangle {
  /// Height of rectangle in pixels. Specify only even numbers.
  final int height;

  /// Width of rectangle in pixels. Specify only even numbers.
  final int width;

  /// The distance, in pixels, between the rectangle and the left edge of the
  /// video frame. Specify only even numbers.
  final int x;

  /// The distance, in pixels, between the rectangle and the top edge of the
  /// video frame. Specify only even numbers.
  final int y;

  Rectangle({
    this.height,
    this.width,
    this.x,
    this.y,
  });
  static Rectangle fromJson(Map<String, dynamic> json) => Rectangle();
}

/// Use Manual audio remixing (RemixSettings) to adjust audio levels for each
/// audio channel in each output of your job. With audio remixing, you can
/// output more or fewer audio channels than your input audio source provides.
class RemixSettings {
  /// Channel mapping (ChannelMapping) contains the group of fields that hold
  /// the remixing value for each channel. Units are in dB. Acceptable values
  /// are within the range from -60 (mute) through 6. A setting of 0 passes the
  /// input channel unchanged to the output channel (no attenuation or
  /// amplification).
  final ChannelMapping channelMapping;

  /// Specify the number of audio channels from your input that you want to use
  /// in your output. With remixing, you might combine or split the data in
  /// these channels, so the number of channels in your final output might be
  /// different.
  final int channelsIn;

  /// Specify the number of channels in this output after remixing. Valid
  /// values: 1, 2, 4, 6, 8... 64. (1 and even numbers to 64.)
  final int channelsOut;

  RemixSettings({
    this.channelMapping,
    this.channelsIn,
    this.channelsOut,
  });
  static RemixSettings fromJson(Map<String, dynamic> json) => RemixSettings();
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
class ReservationPlan {
  /// The length of the term of your reserved queue pricing plan commitment.
  final String commitment;

  /// The timestamp in epoch seconds for when the current pricing plan term for
  /// this reserved queue expires.
  final DateTime expiresAt;

  /// The timestamp in epoch seconds for when you set up the current pricing
  /// plan for this reserved queue.
  final DateTime purchasedAt;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term.
  final String renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. When you increase this number, you
  /// extend your existing commitment with a new 12-month commitment for a
  /// larger number of RTS. The new commitment begins when you purchase the
  /// additional capacity. You can't decrease the number of RTS in your reserved
  /// queue.
  final int reservedSlots;

  /// Specifies whether the pricing plan for your reserved queue is ACTIVE or
  /// EXPIRED.
  final String status;

  ReservationPlan({
    this.commitment,
    this.expiresAt,
    this.purchasedAt,
    this.renewalType,
    this.reservedSlots,
    this.status,
  });
  static ReservationPlan fromJson(Map<String, dynamic> json) =>
      ReservationPlan();
}

/// Details about the pricing plan for your reserved queue. Required for
/// reserved queues and not applicable to on-demand queues.
class ReservationPlanSettings {
  /// The length of the term of your reserved queue pricing plan commitment.
  final String commitment;

  /// Specifies whether the term of your reserved queue pricing plan is
  /// automatically extended (AUTO_RENEW) or expires (EXPIRE) at the end of the
  /// term. When your term is auto renewed, you extend your commitment by 12
  /// months from the auto renew date. You can cancel this commitment.
  final String renewalType;

  /// Specifies the number of reserved transcode slots (RTS) for this queue. The
  /// number of RTS determines how many jobs the queue can process in parallel;
  /// each RTS can process one job at a time. You can't decrease the number of
  /// RTS in your reserved queue. You can increase the number of RTS by
  /// extending your existing commitment with a new 12-month commitment for the
  /// larger number. The new commitment begins when you purchase the additional
  /// capacity. You can't cancel your commitment or revert to your original
  /// commitment after you increase the capacity.
  final int reservedSlots;

  ReservationPlanSettings({
    @required this.commitment,
    @required this.renewalType,
    @required this.reservedSlots,
  });
}

/// The Amazon Resource Name (ARN) and tags for an AWS Elemental MediaConvert
/// resource.
class ResourceTags {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// The tags for the resource.
  final Map<String, String> tags;

  ResourceTags({
    this.arn,
    this.tags,
  });
  static ResourceTags fromJson(Map<String, dynamic> json) => ResourceTags();
}

/// Settings associated with S3 destination
class S3DestinationSettings {
  /// Settings for how your job outputs are encrypted as they are uploaded to
  /// Amazon S3.
  final S3EncryptionSettings encryption;

  S3DestinationSettings({
    this.encryption,
  });
  static S3DestinationSettings fromJson(Map<String, dynamic> json) =>
      S3DestinationSettings();
}

/// Settings for how your job outputs are encrypted as they are uploaded to
/// Amazon S3.
class S3EncryptionSettings {
  /// Specify how you want your data keys managed. AWS uses data keys to encrypt
  /// your content. AWS also encrypts the data keys themselves, using a customer
  /// master key (CMK), and then stores the encrypted data keys alongside your
  /// encrypted content. Use this setting to specify which AWS service manages
  /// the CMK. For simplest set up, choose Amazon S3
  /// (SERVER_SIDE_ENCRYPTION_S3). If you want your master key to be managed by
  /// AWS Key Management Service (KMS), choose AWS KMS
  /// (SERVER_SIDE_ENCRYPTION_KMS). By default, when you choose AWS KMS, KMS
  /// uses the AWS managed customer master key (CMK) associated with Amazon S3
  /// to encrypt your data keys. You can optionally choose to specify a
  /// different, customer managed CMK. Do so by specifying the Amazon Resource
  /// Name (ARN) of the key for the setting KMS ARN (kmsKeyArn).
  final String encryptionType;

  /// Optionally, specify the customer master key (CMK) that you want to use to
  /// encrypt the data key that AWS uses to encrypt your output content. Enter
  /// the Amazon Resource Name (ARN) of the CMK. To use this setting, you must
  /// also set Server-side encryption (S3ServerSideEncryptionType) to AWS KMS
  /// (SERVER_SIDE_ENCRYPTION_KMS). If you set Server-side encryption to AWS KMS
  /// but don't specify a CMK here, AWS uses the AWS managed CMK associated with
  /// Amazon S3.
  final String kmsKeyArn;

  S3EncryptionSettings({
    this.encryptionType,
    this.kmsKeyArn,
  });
  static S3EncryptionSettings fromJson(Map<String, dynamic> json) =>
      S3EncryptionSettings();
}

/// Settings for SCC caption output.
class SccDestinationSettings {
  /// Set Framerate (SccDestinationFramerate) to make sure that the captions and
  /// the video are synchronized in the output. Specify a frame rate that
  /// matches the frame rate of the associated video. If the video frame rate is
  /// 29.97, choose 29.97 dropframe (FRAMERATE_29_97_DROPFRAME) only if the
  /// video has video_insertion=true and drop_frame_timecode=true; otherwise,
  /// choose 29.97 non-dropframe (FRAMERATE_29_97_NON_DROPFRAME).
  final String framerate;

  SccDestinationSettings({
    this.framerate,
  });
  static SccDestinationSettings fromJson(Map<String, dynamic> json) =>
      SccDestinationSettings();
}

/// If your output group type is HLS, DASH, or Microsoft Smooth, use these
/// settings when doing DRM encryption with a SPEKE-compliant key provider. If
/// your output group type is CMAF, use the SpekeKeyProviderCmaf settings
/// instead.
class SpekeKeyProvider {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  final String certificateArn;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  final String resourceId;

  /// Relates to SPEKE implementation. DRM system identifiers. DASH output
  /// groups support a max of two system ids. Other group types support one
  /// system id. See https://dashif.org/identifiers/content_protection/ for more
  /// details.
  final List<String> systemIds;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key
  /// provider uses to provide keys for encrypting your content.
  final String url;

  SpekeKeyProvider({
    this.certificateArn,
    this.resourceId,
    this.systemIds,
    this.url,
  });
  static SpekeKeyProvider fromJson(Map<String, dynamic> json) =>
      SpekeKeyProvider();
}

/// If your output group type is CMAF, use these settings when doing DRM
/// encryption with a SPEKE-compliant key provider. If your output group type is
/// HLS, DASH, or Microsoft Smooth, use the SpekeKeyProvider settings instead.
class SpekeKeyProviderCmaf {
  /// If you want your key provider to encrypt the content keys that it provides
  /// to MediaConvert, set up a certificate with a master key using AWS
  /// Certificate Manager. Specify the certificate's Amazon Resource Name (ARN)
  /// here.
  final String certificateArn;

  /// Specify the DRM system IDs that you want signaled in the DASH manifest
  /// that MediaConvert creates as part of this CMAF package. The DASH manifest
  /// can currently signal up to three system IDs. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  final List<String> dashSignaledSystemIds;

  /// Specify the DRM system ID that you want signaled in the HLS manifest that
  /// MediaConvert creates as part of this CMAF package. The HLS manifest can
  /// currently signal only one system ID. For more information, see
  /// https://dashif.org/identifiers/content_protection/.
  final List<String> hlsSignaledSystemIds;

  /// Specify the resource ID that your SPEKE-compliant key provider uses to
  /// identify this content.
  final String resourceId;

  /// Specify the URL to the key server that your SPEKE-compliant DRM key
  /// provider uses to provide keys for encrypting your content.
  final String url;

  SpekeKeyProviderCmaf({
    this.certificateArn,
    this.dashSignaledSystemIds,
    this.hlsSignaledSystemIds,
    this.resourceId,
    this.url,
  });
  static SpekeKeyProviderCmaf fromJson(Map<String, dynamic> json) =>
      SpekeKeyProviderCmaf();
}

/// Use these settings to set up encryption with a static key provider.
class StaticKeyProvider {
  /// Relates to DRM implementation. Sets the value of the KEYFORMAT attribute.
  /// Must be 'identity' or a reverse DNS string. May be omitted to indicate an
  /// implicit value of 'identity'.
  final String keyFormat;

  /// Relates to DRM implementation. Either a single positive integer version
  /// value or a slash delimited list of version values (1/2/3).
  final String keyFormatVersions;

  /// Relates to DRM implementation. Use a 32-character hexidecimal string to
  /// specify Key Value (StaticKeyValue).
  final String staticKeyValue;

  /// Relates to DRM implementation. The location of the license server used for
  /// protecting content.
  final String url;

  StaticKeyProvider({
    this.keyFormat,
    this.keyFormatVersions,
    this.staticKeyValue,
    this.url,
  });
  static StaticKeyProvider fromJson(Map<String, dynamic> json) =>
      StaticKeyProvider();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Settings for Teletext caption output
class TeletextDestinationSettings {
  /// Set pageNumber to the Teletext page number for the destination captions
  /// for this output. This value must be a three-digit hexadecimal string;
  /// strings ending in -FF are invalid. If you are passing through the entire
  /// set of Teletext data, do not use this field.
  final String pageNumber;

  /// Specify the page types for this Teletext page. If you don't specify a
  /// value here, the service sets the page type to the default value Subtitle
  /// (PAGE_TYPE_SUBTITLE). If you pass through the entire set of Teletext data,
  /// don't use this field. When you pass through a set of Teletext pages, your
  /// output has the same page types as your input.
  final List<String> pageTypes;

  TeletextDestinationSettings({
    this.pageNumber,
    this.pageTypes,
  });
  static TeletextDestinationSettings fromJson(Map<String, dynamic> json) =>
      TeletextDestinationSettings();
}

/// Settings specific to Teletext caption sources, including Page number.
class TeletextSourceSettings {
  /// Use Page Number (PageNumber) to specify the three-digit hexadecimal page
  /// number that will be used for Teletext captions. Do not use this setting if
  /// you are passing through teletext from the input source to output.
  final String pageNumber;

  TeletextSourceSettings({
    this.pageNumber,
  });
  static TeletextSourceSettings fromJson(Map<String, dynamic> json) =>
      TeletextSourceSettings();
}

/// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
/// prefix into the output.
class TimecodeBurnin {
  /// Use Font Size (FontSize) to set the font size of any burned-in timecode.
  /// Valid values are 10, 16, 32, 48.
  final int fontSize;

  /// Use Position (Position) under under Timecode burn-in (TimecodeBurnIn) to
  /// specify the location the burned-in timecode on output video.
  final String position;

  /// Use Prefix (Prefix) to place ASCII characters before any burned-in
  /// timecode. For example, a prefix of "EZ-" will result in the timecode
  /// "EZ-00:00:00:00". Provide either the characters themselves or the ASCII
  /// code equivalents. The supported range of characters is 0x20 through 0x7e.
  /// This includes letters, numbers, and all special characters represented on
  /// a standard English keyboard.
  final String prefix;

  TimecodeBurnin({
    this.fontSize,
    this.position,
    this.prefix,
  });
  static TimecodeBurnin fromJson(Map<String, dynamic> json) => TimecodeBurnin();
}

/// These settings control how the service handles timecodes throughout the job.
/// These settings don't affect input clipping.
class TimecodeConfig {
  /// If you use an editing platform that relies on an anchor timecode, use
  /// Anchor Timecode (Anchor) to specify a timecode that will match the input
  /// video frame to the output video frame. Use 24-hour format with frame
  /// number, (HH:MM:SS:FF) or (HH:MM:SS;FF). This setting ignores frame rate
  /// conversion. System behavior for Anchor Timecode varies depending on your
  /// setting for Source (TimecodeSource). * If Source (TimecodeSource) is set
  /// to Specified Start (SPECIFIEDSTART), the first input frame is the
  /// specified value in Start Timecode (Start). Anchor Timecode (Anchor) and
  /// Start Timecode (Start) are used calculate output timecode. * If Source
  /// (TimecodeSource) is set to Start at 0 (ZEROBASED) the first frame is
  /// 00:00:00:00. * If Source (TimecodeSource) is set to Embedded (EMBEDDED),
  /// the first frame is the timecode value on the first input frame of the
  /// input.
  final String anchor;

  /// Use Source (TimecodeSource) to set how timecodes are handled within this
  /// job. To make sure that your video, audio, captions, and markers are
  /// synchronized and that time-based features, such as image inserter, work
  /// correctly, choose the Timecode source option that matches your assets. All
  /// timecodes are in a 24-hour format with frame number (HH:MM:SS:FF). *
  /// Embedded (EMBEDDED) - Use the timecode that is in the input video. If no
  /// embedded timecode is in the source, the service will use Start at 0
  /// (ZEROBASED) instead. * Start at 0 (ZEROBASED) - Set the timecode of the
  /// initial frame to 00:00:00:00. * Specified Start (SPECIFIEDSTART) - Set the
  /// timecode of the initial frame to a value other than zero. You use Start
  /// timecode (Start) to provide this value.
  final String source;

  /// Only use when you set Source (TimecodeSource) to Specified start
  /// (SPECIFIEDSTART). Use Start timecode (Start) to specify the timecode for
  /// the initial frame. Use 24-hour format with frame number, (HH:MM:SS:FF) or
  /// (HH:MM:SS;FF).
  final String start;

  /// Only applies to outputs that support program-date-time stamp. Use
  /// Timestamp offset (TimestampOffset) to overwrite the timecode date without
  /// affecting the time and frame number. Provide the new date as a string in
  /// the format "yyyy-mm-dd". To use Time stamp offset, you must also enable
  /// Insert program-date-time (InsertProgramDateTime) in the output settings.
  /// For example, if the date part of your timecodes is 2002-1-25 and you want
  /// to change it to one year later, set Timestamp offset (TimestampOffset) to
  /// 2003-1-25.
  final String timestampOffset;

  TimecodeConfig({
    this.anchor,
    this.source,
    this.start,
    this.timestampOffset,
  });
  static TimecodeConfig fromJson(Map<String, dynamic> json) => TimecodeConfig();
}

/// Enable Timed metadata insertion (TimedMetadataInsertion) to include ID3 tags
/// in your job. To include timed metadata, you must enable it here, enable it
/// in each output container, and specify tags and timecodes in ID3 insertion
/// (Id3Insertion) objects.
class TimedMetadataInsertion {
  /// Id3Insertions contains the array of Id3Insertion instances.
  final List<Id3Insertion> id3Insertions;

  TimedMetadataInsertion({
    this.id3Insertions,
  });
  static TimedMetadataInsertion fromJson(Map<String, dynamic> json) =>
      TimedMetadataInsertion();
}

/// Information about when jobs are submitted, started, and finished is
/// specified in Unix epoch format in seconds.
class Timing {
  /// The time, in Unix epoch format, that the transcoding job finished
  final DateTime finishTime;

  /// The time, in Unix epoch format, that transcoding for the job began.
  final DateTime startTime;

  /// The time, in Unix epoch format, that you submitted the job.
  final DateTime submitTime;

  Timing({
    this.finishTime,
    this.startTime,
    this.submitTime,
  });
  static Timing fromJson(Map<String, dynamic> json) => Timing();
}

/// Settings specific to caption sources that are specified by track number.
/// Currently, this is only IMSC captions in an IMF package. If your caption
/// source is IMSC 1.1 in a separate xml file, use FileSourceSettings instead of
/// TrackSourceSettings.
class TrackSourceSettings {
  /// Use this setting to select a single captions track from a source. Track
  /// numbers correspond to the order in the captions source file. For IMF
  /// sources, track numbering is based on the order that the captions appear in
  /// the CPL. For example, use 1 to select the captions asset that is listed
  /// first in the CPL. To include more than one captions track in your job
  /// outputs, create multiple input captions selectors. Specify one track per
  /// selector.
  final int trackNumber;

  TrackSourceSettings({
    this.trackNumber,
  });
  static TrackSourceSettings fromJson(Map<String, dynamic> json) =>
      TrackSourceSettings();
}

/// Settings specific to TTML caption outputs, including Pass style information
/// (TtmlStylePassthrough).
class TtmlDestinationSettings {
  /// Pass through style and position information from a TTML-like input source
  /// (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or TTML output.
  final String stylePassthrough;

  TtmlDestinationSettings({
    this.stylePassthrough,
  });
  static TtmlDestinationSettings fromJson(Map<String, dynamic> json) =>
      TtmlDestinationSettings();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateJobTemplateResponse {
  /// A job template is a pre-made set of encoding instructions that you can use
  /// to quickly create a job.
  final JobTemplate jobTemplate;

  UpdateJobTemplateResponse({
    this.jobTemplate,
  });
  static UpdateJobTemplateResponse fromJson(Map<String, dynamic> json) =>
      UpdateJobTemplateResponse();
}

class UpdatePresetResponse {
  /// A preset is a collection of preconfigured media conversion settings that
  /// you want MediaConvert to apply to the output during the conversion
  /// process.
  final Preset preset;

  UpdatePresetResponse({
    this.preset,
  });
  static UpdatePresetResponse fromJson(Map<String, dynamic> json) =>
      UpdatePresetResponse();
}

class UpdateQueueResponse {
  /// You can use queues to manage the resources that are available to your AWS
  /// account for running multiple transcoding jobs at the same time. If you
  /// don't specify a queue, the service sends all jobs through the default
  /// queue. For more information, see
  /// https://docs.aws.amazon.com/mediaconvert/latest/ug/working-with-queues.html.
  final Queue queue;

  UpdateQueueResponse({
    this.queue,
  });
  static UpdateQueueResponse fromJson(Map<String, dynamic> json) =>
      UpdateQueueResponse();
}

/// Video codec settings, (CodecSettings) under (VideoDescription), contains the
/// group of settings related to video encoding. The settings in this group vary
/// depending on the value that you choose for Video codec (Codec). For each
/// codec enum that you choose, define the corresponding settings object. The
/// following lists the codec enum, settings object pairs. * H_264, H264Settings
/// * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES, ProresSettings *
/// FRAME_CAPTURE, FrameCaptureSettings
class VideoCodecSettings {
  /// Specifies the video codec. This must be equal to one of the enum values
  /// defined by the object VideoCodec.
  final String codec;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value FRAME_CAPTURE.
  final FrameCaptureSettings frameCaptureSettings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value H_264.
  final H264Settings h264Settings;

  /// Settings for H265 codec
  final H265Settings h265Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value MPEG2.
  final Mpeg2Settings mpeg2Settings;

  /// Required when you set (Codec) under (VideoDescription)>(CodecSettings) to
  /// the value PRORES.
  final ProresSettings proresSettings;

  VideoCodecSettings({
    this.codec,
    this.frameCaptureSettings,
    this.h264Settings,
    this.h265Settings,
    this.mpeg2Settings,
    this.proresSettings,
  });
  static VideoCodecSettings fromJson(Map<String, dynamic> json) =>
      VideoCodecSettings();
}

/// Settings for video outputs
class VideoDescription {
  /// This setting only applies to H.264, H.265, and MPEG2 outputs. Use Insert
  /// AFD signaling (AfdSignaling) to specify whether the service includes AFD
  /// values in the output video data and what those values are. * Choose None
  /// to remove all AFD values from this output. * Choose Fixed to ignore input
  /// AFD values and instead encode the value specified in the job. * Choose
  /// Auto to calculate output AFD values based on the input AFD scaler data.
  final String afdSignaling;

  /// The anti-alias filter is automatically applied to all outputs. The service
  /// no longer accepts the value DISABLED for AntiAlias. If you specify that in
  /// your job, the service will ignore the setting.
  final String antiAlias;

  /// Video codec settings, (CodecSettings) under (VideoDescription), contains
  /// the group of settings related to video encoding. The settings in this
  /// group vary depending on the value that you choose for Video codec (Codec).
  /// For each codec enum that you choose, define the corresponding settings
  /// object. The following lists the codec enum, settings object pairs. *
  /// H_264, H264Settings * H_265, H265Settings * MPEG2, Mpeg2Settings * PRORES,
  /// ProresSettings * FRAME_CAPTURE, FrameCaptureSettings
  final VideoCodecSettings codecSettings;

  /// Choose Insert (INSERT) for this setting to include color metadata in this
  /// output. Choose Ignore (IGNORE) to exclude color metadata from this output.
  /// If you don't specify a value, the service sets this to Insert by default.
  final String colorMetadata;

  /// Use Cropping selection (crop) to specify the video area that the service
  /// will include in the output video frame.
  final Rectangle crop;

  /// Applies only to 29.97 fps outputs. When this feature is enabled, the
  /// service will use drop-frame timecode on outputs. If it is not possible to
  /// use drop-frame timecode, the system will fall back to non-drop-frame. This
  /// setting is enabled by default when Timecode insertion (TimecodeInsertion)
  /// is enabled.
  final String dropFrameTimecode;

  /// Applies only if you set AFD Signaling(AfdSignaling) to Fixed (FIXED). Use
  /// Fixed (FixedAfd) to specify a four-bit AFD value which the service will
  /// write on all frames of this video output.
  final int fixedAfd;

  /// Use the Height (Height) setting to define the video resolution height for
  /// this output. Specify in pixels. If you don't provide a value here, the
  /// service will use the input height.
  final int height;

  /// Use Selection placement (position) to define the video area in your output
  /// frame. The area outside of the rectangle that you specify here is black.
  final Rectangle position;

  /// Use Respond to AFD (RespondToAfd) to specify how the service changes the
  /// video itself in response to AFD values in the input. * Choose Respond to
  /// clip the input video frame according to the AFD value, input display
  /// aspect ratio, and output display aspect ratio. * Choose Passthrough to
  /// include the input AFD values. Do not choose this when AfdSignaling is set
  /// to (NONE). A preferred implementation of this workflow is to set
  /// RespondToAfd to (NONE) and set AfdSignaling to (AUTO). * Choose None to
  /// remove all input AFD values from this output.
  final String respondToAfd;

  /// Specify how the service handles outputs that have a different aspect ratio
  /// from the input aspect ratio. Choose Stretch to output (STRETCH_TO_OUTPUT)
  /// to have the service stretch your video image to fit. Keep the setting
  /// Default (DEFAULT) to have the service letterbox your video instead. This
  /// setting overrides any value that you specify for the setting Selection
  /// placement (position) in this output.
  final String scalingBehavior;

  /// Use Sharpness (Sharpness) setting to specify the strength of
  /// anti-aliasing. This setting changes the width of the anti-alias filter
  /// kernel used for scaling. Sharpness only applies if your output resolution
  /// is different from your input resolution. 0 is the softest setting, 100 the
  /// sharpest, and 50 recommended for most content.
  final int sharpness;

  /// Applies only to H.264, H.265, MPEG2, and ProRes outputs. Only enable
  /// Timecode insertion when the input frame rate is identical to the output
  /// frame rate. To include timecodes in this output, set Timecode insertion
  /// (VideoTimecodeInsertion) to PIC_TIMING_SEI. To leave them out, set it to
  /// DISABLED. Default is DISABLED. When the service inserts timecodes in an
  /// output, by default, it uses any embedded timecodes from the input. If none
  /// are present, the service will set the timecode for the first output frame
  /// to zero. To change this default behavior, adjust the settings under
  /// Timecode configuration (TimecodeConfig). In the console, these settings
  /// are located under Job > Job settings > Timecode configuration. Note -
  /// Timecode source under input settings (InputTimecodeSource) does not affect
  /// the timecodes that are inserted in the output. Source under Job settings >
  /// Timecode configuration (TimecodeSource) does.
  final String timecodeInsertion;

  /// Find additional transcoding features under Preprocessors
  /// (VideoPreprocessors). Enable the features at each output individually.
  /// These features are disabled by default.
  final VideoPreprocessor videoPreprocessors;

  /// Use Width (Width) to define the video resolution width, in pixels, for
  /// this output. If you don't provide a value here, the service will use the
  /// input width.
  final int width;

  VideoDescription({
    this.afdSignaling,
    this.antiAlias,
    this.codecSettings,
    this.colorMetadata,
    this.crop,
    this.dropFrameTimecode,
    this.fixedAfd,
    this.height,
    this.position,
    this.respondToAfd,
    this.scalingBehavior,
    this.sharpness,
    this.timecodeInsertion,
    this.videoPreprocessors,
    this.width,
  });
  static VideoDescription fromJson(Map<String, dynamic> json) =>
      VideoDescription();
}

/// Contains details about the output's video stream
class VideoDetail {
  /// Height in pixels for the output
  final int heightInPx;

  /// Width in pixels for the output
  final int widthInPx;

  VideoDetail({
    this.heightInPx,
    this.widthInPx,
  });
  static VideoDetail fromJson(Map<String, dynamic> json) => VideoDetail();
}

/// Find additional transcoding features under Preprocessors
/// (VideoPreprocessors). Enable the features at each output individually. These
/// features are disabled by default.
class VideoPreprocessor {
  /// Enable the Color corrector (ColorCorrector) feature if necessary. Enable
  /// or disable this feature for each output individually. This setting is
  /// disabled by default.
  final ColorCorrector colorCorrector;

  /// Use Deinterlacer (Deinterlacer) to produce smoother motion and a clearer
  /// picture.
  final Deinterlacer deinterlacer;

  /// Enable the Image inserter (ImageInserter) feature to include a graphic
  /// overlay on your video. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  final ImageInserter imageInserter;

  /// Enable the Noise reducer (NoiseReducer) feature to remove noise from your
  /// video output if necessary. Enable or disable this feature for each output
  /// individually. This setting is disabled by default.
  final NoiseReducer noiseReducer;

  /// Timecode burn-in (TimecodeBurnIn)--Burns the output timecode and specified
  /// prefix into the output.
  final TimecodeBurnin timecodeBurnin;

  VideoPreprocessor({
    this.colorCorrector,
    this.deinterlacer,
    this.imageInserter,
    this.noiseReducer,
    this.timecodeBurnin,
  });
  static VideoPreprocessor fromJson(Map<String, dynamic> json) =>
      VideoPreprocessor();
}

/// Selector for video.
class VideoSelector {
  /// If your input video has accurate color space metadata, or if you don't
  /// know about color space, leave this set to the default value Follow
  /// (FOLLOW). The service will automatically detect your input color space. If
  /// your input video has metadata indicating the wrong color space, specify
  /// the accurate color space here. If your input video is HDR 10 and the SMPTE
  /// ST 2086 Mastering Display Color Volume static metadata isn't present in
  /// your video stream, or if that metadata is present but not accurate, choose
  /// Force HDR 10 (FORCE_HDR10) here and specify correct values in the input
  /// HDR 10 metadata (Hdr10Metadata) settings. For more information about
  /// MediaConvert HDR jobs, see
  /// https://docs.aws.amazon.com/console/mediaconvert/hdr.
  final String colorSpace;

  /// There are two sources for color metadata, the input file and the job input
  /// settings Color space (ColorSpace) and HDR master display information
  /// settings(Hdr10Metadata). The Color space usage setting determines which
  /// takes precedence. Choose Force (FORCE) to use color metadata from the
  /// input job settings. If you don't specify values for those settings, the
  /// service defaults to using metadata from your input. FALLBACK - Choose
  /// Fallback (FALLBACK) to use color metadata from the source when it is
  /// present. If there's no color metadata in your input file, the service
  /// defaults to using values you specify in the input settings.
  final String colorSpaceUsage;

  /// Use these settings to provide HDR 10 metadata that is missing or
  /// inaccurate in your input video. Appropriate values vary depending on the
  /// input video and must be provided by a color grader. The color grader
  /// generates these values during the HDR 10 mastering process. The valid
  /// range for each of these settings is 0 to 50,000. Each increment represents
  /// 0.00002 in CIE1931 color coordinate. Related settings - When you specify
  /// these values, you must also set Color space (ColorSpace) to HDR 10
  /// (HDR10). To specify whether the the values you specify here take
  /// precedence over the values in the metadata of your input file, set Color
  /// space usage (ColorSpaceUsage). To specify whether color metadata is
  /// included in an output, set Color metadata (ColorMetadata). For more
  /// information about MediaConvert HDR jobs, see
  /// https://docs.aws.amazon.com/console/mediaconvert/hdr.
  final Hdr10Metadata hdr10Metadata;

  /// Use PID (Pid) to select specific video data from an input file. Specify
  /// this value as an integer; the system automatically converts it to the
  /// hexidecimal value. For example, 257 selects PID 0x101. A PID, or packet
  /// identifier, is an identifier for a set of data in an MPEG-2 transport
  /// stream container.
  final int pid;

  /// Selects a specific program from within a multi-program transport stream.
  /// Note that Quad 4K is not currently supported.
  final int programNumber;

  /// Use Rotate (InputRotate) to specify how the service rotates your video.
  /// You can choose automatic rotation or specify a rotation. You can specify a
  /// clockwise rotation of 0, 90, 180, or 270 degrees. If your input video
  /// container is .mov or .mp4 and your input has rotation metadata, you can
  /// choose Automatic to have the service rotate your video according to the
  /// rotation specified in the metadata. The rotation must be within one degree
  /// of 90, 180, or 270 degrees. If the rotation metadata specifies any other
  /// rotation, the service will default to no rotation. By default, the service
  /// does no rotation, even if your input video has rotation metadata. The
  /// service doesn't pass through rotation metadata.
  final String rotate;

  VideoSelector({
    this.colorSpace,
    this.colorSpaceUsage,
    this.hdr10Metadata,
    this.pid,
    this.programNumber,
    this.rotate,
  });
  static VideoSelector fromJson(Map<String, dynamic> json) => VideoSelector();
}

/// Required when you set (Codec) under (AudioDescriptions)>(CodecSettings) to
/// the value WAV.
class WavSettings {
  /// Specify Bit depth (BitDepth), in bits per sample, to choose the encoding
  /// quality for this audio track.
  final int bitDepth;

  /// Specify the number of channels in this output audio track. Valid values
  /// are 1 and even numbers up to 64. For example, 1, 2, 4, 6, and so on, up to
  /// 64.
  final int channels;

  /// The service defaults to using RIFF for WAV outputs. If your output audio
  /// is likely to exceed 4 GB in file size, or if you otherwise need the
  /// extended support of the RF64 format, set your output WAV file format to
  /// RF64.
  final String format;

  /// Sample rate in Hz.
  final int sampleRate;

  WavSettings({
    this.bitDepth,
    this.channels,
    this.format,
    this.sampleRate,
  });
  static WavSettings fromJson(Map<String, dynamic> json) => WavSettings();
}
