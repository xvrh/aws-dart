import 'package:meta/meta.dart';

/// API for AWS Elemental MediaLive
class MediaLiveApi {
  final _client;
  MediaLiveApi(client)
      : _client = client.configured('MediaLive', serializer: 'rest-json');

  /// Update a channel schedule
  ///
  /// [channelId]: Id of the channel whose schedule is being updated.
  ///
  /// [creates]: Schedule actions to create in the schedule.
  ///
  /// [deletes]: Schedule actions to delete from the schedule.
  Future<BatchUpdateScheduleResponse> batchUpdateSchedule(String channelId,
      {BatchScheduleActionCreateRequest creates,
      BatchScheduleActionDeleteRequest deletes}) async {
    var response_ = await _client.send('BatchUpdateSchedule', {
      'ChannelId': channelId,
      if (creates != null) 'Creates': creates,
      if (deletes != null) 'Deletes': deletes,
    });
    return BatchUpdateScheduleResponse.fromJson(response_);
  }

  /// Creates a new channel
  ///
  /// [channelClass]: The class for this channel. STANDARD for a channel with
  /// two pipelines or SINGLE_PIPELINE for a channel with one pipeline.
  ///
  /// [inputAttachments]: List of input attachments for channel.
  ///
  /// [inputSpecification]: Specification of input for this channel (max.
  /// bitrate, resolution, codec, etc.)
  ///
  /// [logLevel]: The log level to write to CloudWatch Logs.
  ///
  /// [name]: Name of channel.
  ///
  /// [requestId]: Unique request ID to be specified. This is needed to prevent
  /// retries from creating multiple resources.
  ///
  /// [reserved]: Deprecated field that's only usable by whitelisted customers.
  ///
  /// [roleArn]: An optional Amazon Resource Name (ARN) of the role to assume
  /// when running the Channel.
  ///
  /// [tags]: A collection of key-value pairs.
  Future<CreateChannelResponse> createChannel(
      {String channelClass,
      List<OutputDestination> destinations,
      EncoderSettings encoderSettings,
      List<InputAttachment> inputAttachments,
      InputSpecification inputSpecification,
      String logLevel,
      String name,
      String requestId,
      String reserved,
      String roleArn,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateChannel', {
      if (channelClass != null) 'ChannelClass': channelClass,
      if (destinations != null) 'Destinations': destinations,
      if (encoderSettings != null) 'EncoderSettings': encoderSettings,
      if (inputAttachments != null) 'InputAttachments': inputAttachments,
      if (inputSpecification != null) 'InputSpecification': inputSpecification,
      if (logLevel != null) 'LogLevel': logLevel,
      if (name != null) 'Name': name,
      if (requestId != null) 'RequestId': requestId,
      if (reserved != null) 'Reserved': reserved,
      if (roleArn != null) 'RoleArn': roleArn,
      if (tags != null) 'Tags': tags,
    });
    return CreateChannelResponse.fromJson(response_);
  }

  /// Create an input
  ///
  /// [destinations]: Destination settings for PUSH type inputs.
  ///
  /// [inputSecurityGroups]: A list of security groups referenced by IDs to
  /// attach to the input.
  ///
  /// [mediaConnectFlows]: A list of the MediaConnect Flows that you want to use
  /// in this input. You can specify as few as one Flow and presently, as many
  /// as two. The only requirement is when you have more than one is that each
  /// Flow is in a separate Availability Zone as this ensures your EML input is
  /// redundant to AZ issues.
  ///
  /// [name]: Name of the input.
  ///
  /// [requestId]: Unique identifier of the request to ensure the request is
  /// handled exactly once in case of retries.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role this input assumes
  /// during and after creation.
  ///
  /// [sources]: The source URLs for a PULL-type input. Every PULL type input
  /// needs exactly two source URLs for redundancy. Only specify sources for
  /// PULL type Inputs. Leave Destinations empty.
  ///
  /// [tags]: A collection of key-value pairs.
  Future<CreateInputResponse> createInput(
      {List<InputDestinationRequest> destinations,
      List<String> inputSecurityGroups,
      List<MediaConnectFlowRequest> mediaConnectFlows,
      String name,
      String requestId,
      String roleArn,
      List<InputSourceRequest> sources,
      Map<String, String> tags,
      String type,
      InputVpcRequest vpc}) async {
    var response_ = await _client.send('CreateInput', {
      if (destinations != null) 'Destinations': destinations,
      if (inputSecurityGroups != null)
        'InputSecurityGroups': inputSecurityGroups,
      if (mediaConnectFlows != null) 'MediaConnectFlows': mediaConnectFlows,
      if (name != null) 'Name': name,
      if (requestId != null) 'RequestId': requestId,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sources != null) 'Sources': sources,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
      if (vpc != null) 'Vpc': vpc,
    });
    return CreateInputResponse.fromJson(response_);
  }

  /// Creates a Input Security Group
  ///
  /// [tags]: A collection of key-value pairs.
  ///
  /// [whitelistRules]: List of IPv4 CIDR addresses to whitelist
  Future<CreateInputSecurityGroupResponse> createInputSecurityGroup(
      {Map<String, String> tags,
      List<InputWhitelistRuleCidr> whitelistRules}) async {
    var response_ = await _client.send('CreateInputSecurityGroup', {
      if (tags != null) 'Tags': tags,
      if (whitelistRules != null) 'WhitelistRules': whitelistRules,
    });
    return CreateInputSecurityGroupResponse.fromJson(response_);
  }

  /// Create tags for a resource
  Future<void> createTags(String resourceArn,
      {Map<String, String> tags}) async {
    await _client.send('CreateTags', {
      'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    });
  }

  /// Starts deletion of channel. The associated outputs are also deleted.
  ///
  /// [channelId]: Unique ID of the channel.
  Future<DeleteChannelResponse> deleteChannel(String channelId) async {
    var response_ = await _client.send('DeleteChannel', {
      'ChannelId': channelId,
    });
    return DeleteChannelResponse.fromJson(response_);
  }

  /// Deletes the input end point
  ///
  /// [inputId]: Unique ID of the input
  Future<DeleteInputResponse> deleteInput(String inputId) async {
    var response_ = await _client.send('DeleteInput', {
      'InputId': inputId,
    });
    return DeleteInputResponse.fromJson(response_);
  }

  /// Deletes an Input Security Group
  ///
  /// [inputSecurityGroupId]: The Input Security Group to delete
  Future<DeleteInputSecurityGroupResponse> deleteInputSecurityGroup(
      String inputSecurityGroupId) async {
    var response_ = await _client.send('DeleteInputSecurityGroup', {
      'InputSecurityGroupId': inputSecurityGroupId,
    });
    return DeleteInputSecurityGroupResponse.fromJson(response_);
  }

  /// Delete an expired reservation.
  ///
  /// [reservationId]: Unique reservation ID, e.g. '1234567'
  Future<DeleteReservationResponse> deleteReservation(
      String reservationId) async {
    var response_ = await _client.send('DeleteReservation', {
      'ReservationId': reservationId,
    });
    return DeleteReservationResponse.fromJson(response_);
  }

  /// Delete all schedule actions on a channel.
  ///
  /// [channelId]: Id of the channel whose schedule is being deleted.
  Future<DeleteScheduleResponse> deleteSchedule(String channelId) async {
    var response_ = await _client.send('DeleteSchedule', {
      'ChannelId': channelId,
    });
    return DeleteScheduleResponse.fromJson(response_);
  }

  /// Removes tags for a resource
  ///
  /// [tagKeys]: An array of tag keys to delete
  Future<void> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('DeleteTags', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
  }

  /// Gets details about a channel
  ///
  /// [channelId]: channel ID
  Future<DescribeChannelResponse> describeChannel(String channelId) async {
    var response_ = await _client.send('DescribeChannel', {
      'ChannelId': channelId,
    });
    return DescribeChannelResponse.fromJson(response_);
  }

  /// Produces details about an input
  ///
  /// [inputId]: Unique ID of the input
  Future<DescribeInputResponse> describeInput(String inputId) async {
    var response_ = await _client.send('DescribeInput', {
      'InputId': inputId,
    });
    return DescribeInputResponse.fromJson(response_);
  }

  /// Produces a summary of an Input Security Group
  ///
  /// [inputSecurityGroupId]: The id of the Input Security Group to describe
  Future<DescribeInputSecurityGroupResponse> describeInputSecurityGroup(
      String inputSecurityGroupId) async {
    var response_ = await _client.send('DescribeInputSecurityGroup', {
      'InputSecurityGroupId': inputSecurityGroupId,
    });
    return DescribeInputSecurityGroupResponse.fromJson(response_);
  }

  /// Get details for an offering.
  ///
  /// [offeringId]: Unique offering ID, e.g. '87654321'
  Future<DescribeOfferingResponse> describeOffering(String offeringId) async {
    var response_ = await _client.send('DescribeOffering', {
      'OfferingId': offeringId,
    });
    return DescribeOfferingResponse.fromJson(response_);
  }

  /// Get details for a reservation.
  ///
  /// [reservationId]: Unique reservation ID, e.g. '1234567'
  Future<DescribeReservationResponse> describeReservation(
      String reservationId) async {
    var response_ = await _client.send('DescribeReservation', {
      'ReservationId': reservationId,
    });
    return DescribeReservationResponse.fromJson(response_);
  }

  /// Get a channel schedule
  ///
  /// [channelId]: Id of the channel whose schedule is being updated.
  Future<DescribeScheduleResponse> describeSchedule(String channelId,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeSchedule', {
      'ChannelId': channelId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScheduleResponse.fromJson(response_);
  }

  /// Produces list of channels that have been created
  Future<ListChannelsResponse> listChannels(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListChannels', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListChannelsResponse.fromJson(response_);
  }

  /// Produces a list of Input Security Groups for an account
  Future<ListInputSecurityGroupsResponse> listInputSecurityGroups(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListInputSecurityGroups', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListInputSecurityGroupsResponse.fromJson(response_);
  }

  /// Produces list of inputs that have been created
  Future<ListInputsResponse> listInputs(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListInputs', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListInputsResponse.fromJson(response_);
  }

  /// List offerings available for purchase.
  ///
  /// [channelClass]: Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
  ///
  /// [channelConfiguration]: Filter to offerings that match the configuration
  /// of an existing channel, e.g. '2345678' (a channel ID)
  ///
  /// [codec]: Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'
  ///
  /// [maximumBitrate]: Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or
  /// 'MAX_50_MBPS'
  ///
  /// [maximumFramerate]: Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
  ///
  /// [resolution]: Filter by resolution, 'SD', 'HD', or 'UHD'
  ///
  /// [resourceType]: Filter by resource type, 'INPUT', 'OUTPUT', or 'CHANNEL'
  ///
  /// [specialFeature]: Filter by special feature, 'ADVANCED_AUDIO' or
  /// 'AUDIO_NORMALIZATION'
  ///
  /// [videoQuality]: Filter by video quality, 'STANDARD', 'ENHANCED', or
  /// 'PREMIUM'
  Future<ListOfferingsResponse> listOfferings(
      {String channelClass,
      String channelConfiguration,
      String codec,
      int maxResults,
      String maximumBitrate,
      String maximumFramerate,
      String nextToken,
      String resolution,
      String resourceType,
      String specialFeature,
      String videoQuality}) async {
    var response_ = await _client.send('ListOfferings', {
      if (channelClass != null) 'ChannelClass': channelClass,
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
      if (codec != null) 'Codec': codec,
      if (maxResults != null) 'MaxResults': maxResults,
      if (maximumBitrate != null) 'MaximumBitrate': maximumBitrate,
      if (maximumFramerate != null) 'MaximumFramerate': maximumFramerate,
      if (nextToken != null) 'NextToken': nextToken,
      if (resolution != null) 'Resolution': resolution,
      if (resourceType != null) 'ResourceType': resourceType,
      if (specialFeature != null) 'SpecialFeature': specialFeature,
      if (videoQuality != null) 'VideoQuality': videoQuality,
    });
    return ListOfferingsResponse.fromJson(response_);
  }

  /// List purchased reservations.
  ///
  /// [channelClass]: Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
  ///
  /// [codec]: Filter by codec, 'AVC', 'HEVC', 'MPEG2', or 'AUDIO'
  ///
  /// [maximumBitrate]: Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or
  /// 'MAX_50_MBPS'
  ///
  /// [maximumFramerate]: Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
  ///
  /// [resolution]: Filter by resolution, 'SD', 'HD', or 'UHD'
  ///
  /// [resourceType]: Filter by resource type, 'INPUT', 'OUTPUT', or 'CHANNEL'
  ///
  /// [specialFeature]: Filter by special feature, 'ADVANCED_AUDIO' or
  /// 'AUDIO_NORMALIZATION'
  ///
  /// [videoQuality]: Filter by video quality, 'STANDARD', 'ENHANCED', or
  /// 'PREMIUM'
  Future<ListReservationsResponse> listReservations(
      {String channelClass,
      String codec,
      int maxResults,
      String maximumBitrate,
      String maximumFramerate,
      String nextToken,
      String resolution,
      String resourceType,
      String specialFeature,
      String videoQuality}) async {
    var response_ = await _client.send('ListReservations', {
      if (channelClass != null) 'ChannelClass': channelClass,
      if (codec != null) 'Codec': codec,
      if (maxResults != null) 'MaxResults': maxResults,
      if (maximumBitrate != null) 'MaximumBitrate': maximumBitrate,
      if (maximumFramerate != null) 'MaximumFramerate': maximumFramerate,
      if (nextToken != null) 'NextToken': nextToken,
      if (resolution != null) 'Resolution': resolution,
      if (resourceType != null) 'ResourceType': resourceType,
      if (specialFeature != null) 'SpecialFeature': specialFeature,
      if (videoQuality != null) 'VideoQuality': videoQuality,
    });
    return ListReservationsResponse.fromJson(response_);
  }

  /// Produces list of tags that have been created for a resource
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'ResourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Purchase an offering and create a reservation.
  ///
  /// [count]: Number of resources
  ///
  /// [name]: Name for the new reservation
  ///
  /// [offeringId]: Offering to purchase, e.g. '87654321'
  ///
  /// [requestId]: Unique request ID to be specified. This is needed to prevent
  /// retries from creating multiple resources.
  ///
  /// [start]: Requested reservation start time (UTC) in ISO-8601 format. The
  /// specified time must be between the first day of the current month and one
  /// year from now. If no value is given, the default is now.
  ///
  /// [tags]: A collection of key-value pairs
  Future<PurchaseOfferingResponse> purchaseOffering(
      {@required int count,
      String name,
      @required String offeringId,
      String requestId,
      String start,
      Map<String, String> tags}) async {
    var response_ = await _client.send('PurchaseOffering', {
      'Count': count,
      if (name != null) 'Name': name,
      'OfferingId': offeringId,
      if (requestId != null) 'RequestId': requestId,
      if (start != null) 'Start': start,
      if (tags != null) 'Tags': tags,
    });
    return PurchaseOfferingResponse.fromJson(response_);
  }

  /// Starts an existing channel
  ///
  /// [channelId]: A request to start a channel
  Future<StartChannelResponse> startChannel(String channelId) async {
    var response_ = await _client.send('StartChannel', {
      'ChannelId': channelId,
    });
    return StartChannelResponse.fromJson(response_);
  }

  /// Stops a running channel
  ///
  /// [channelId]: A request to stop a running channel
  Future<StopChannelResponse> stopChannel(String channelId) async {
    var response_ = await _client.send('StopChannel', {
      'ChannelId': channelId,
    });
    return StopChannelResponse.fromJson(response_);
  }

  /// Updates a channel.
  ///
  /// [channelId]: channel ID
  ///
  /// [destinations]: A list of output destinations for this channel.
  ///
  /// [encoderSettings]: The encoder settings for this channel.
  ///
  /// [inputSpecification]: Specification of input for this channel (max.
  /// bitrate, resolution, codec, etc.)
  ///
  /// [logLevel]: The log level to write to CloudWatch Logs.
  ///
  /// [name]: The name of the channel.
  ///
  /// [roleArn]: An optional Amazon Resource Name (ARN) of the role to assume
  /// when running the Channel. If you do not specify this on an update call but
  /// the role was previously set that role will be removed.
  Future<UpdateChannelResponse> updateChannel(String channelId,
      {List<OutputDestination> destinations,
      EncoderSettings encoderSettings,
      List<InputAttachment> inputAttachments,
      InputSpecification inputSpecification,
      String logLevel,
      String name,
      String roleArn}) async {
    var response_ = await _client.send('UpdateChannel', {
      'ChannelId': channelId,
      if (destinations != null) 'Destinations': destinations,
      if (encoderSettings != null) 'EncoderSettings': encoderSettings,
      if (inputAttachments != null) 'InputAttachments': inputAttachments,
      if (inputSpecification != null) 'InputSpecification': inputSpecification,
      if (logLevel != null) 'LogLevel': logLevel,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
    });
    return UpdateChannelResponse.fromJson(response_);
  }

  /// Changes the class of the channel.
  ///
  /// [channelClass]: The channel class that you wish to update this channel to
  /// use.
  ///
  /// [channelId]: Channel Id of the channel whose class should be updated.
  ///
  /// [destinations]: A list of output destinations for this channel.
  Future<UpdateChannelClassResponse> updateChannelClass(
      {@required String channelClass,
      @required String channelId,
      List<OutputDestination> destinations}) async {
    var response_ = await _client.send('UpdateChannelClass', {
      'ChannelClass': channelClass,
      'ChannelId': channelId,
      if (destinations != null) 'Destinations': destinations,
    });
    return UpdateChannelClassResponse.fromJson(response_);
  }

  /// Updates an input.
  ///
  /// [destinations]: Destination settings for PUSH type inputs.
  ///
  /// [inputId]: Unique ID of the input.
  ///
  /// [inputSecurityGroups]: A list of security groups referenced by IDs to
  /// attach to the input.
  ///
  /// [mediaConnectFlows]: A list of the MediaConnect Flow ARNs that you want to
  /// use as the source of the input. You can specify as few as one Flow and
  /// presently, as many as two. The only requirement is when you have more than
  /// one is that each Flow is in a separate Availability Zone as this ensures
  /// your EML input is redundant to AZ issues.
  ///
  /// [name]: Name of the input.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the role this input assumes
  /// during and after creation.
  ///
  /// [sources]: The source URLs for a PULL-type input. Every PULL type input
  /// needs exactly two source URLs for redundancy. Only specify sources for
  /// PULL type Inputs. Leave Destinations empty.
  Future<UpdateInputResponse> updateInput(String inputId,
      {List<InputDestinationRequest> destinations,
      List<String> inputSecurityGroups,
      List<MediaConnectFlowRequest> mediaConnectFlows,
      String name,
      String roleArn,
      List<InputSourceRequest> sources}) async {
    var response_ = await _client.send('UpdateInput', {
      if (destinations != null) 'Destinations': destinations,
      'InputId': inputId,
      if (inputSecurityGroups != null)
        'InputSecurityGroups': inputSecurityGroups,
      if (mediaConnectFlows != null) 'MediaConnectFlows': mediaConnectFlows,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sources != null) 'Sources': sources,
    });
    return UpdateInputResponse.fromJson(response_);
  }

  /// Update an Input Security Group's Whilelists.
  ///
  /// [inputSecurityGroupId]: The id of the Input Security Group to update.
  ///
  /// [tags]: A collection of key-value pairs.
  ///
  /// [whitelistRules]: List of IPv4 CIDR addresses to whitelist
  Future<UpdateInputSecurityGroupResponse> updateInputSecurityGroup(
      String inputSecurityGroupId,
      {Map<String, String> tags,
      List<InputWhitelistRuleCidr> whitelistRules}) async {
    var response_ = await _client.send('UpdateInputSecurityGroup', {
      'InputSecurityGroupId': inputSecurityGroupId,
      if (tags != null) 'Tags': tags,
      if (whitelistRules != null) 'WhitelistRules': whitelistRules,
    });
    return UpdateInputSecurityGroupResponse.fromJson(response_);
  }

  /// Update reservation.
  ///
  /// [name]: Name of the reservation
  ///
  /// [reservationId]: Unique reservation ID, e.g. '1234567'
  Future<UpdateReservationResponse> updateReservation(String reservationId,
      {String name}) async {
    var response_ = await _client.send('UpdateReservation', {
      if (name != null) 'Name': name,
      'ReservationId': reservationId,
    });
    return UpdateReservationResponse.fromJson(response_);
  }
}

/// Aac Settings
class AacSettings {
  /// Average bitrate in bits/second. Valid values depend on rate control mode
  /// and profile.
  final double bitrate;

  /// Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control
  /// mode and profile. The adReceiverMix setting receives a stereo description
  /// plus control track and emits a mono AAC encode of the description track,
  /// with control data emitted in the PES header as per ETSI TS 101 154 Annex
  /// E.
  final String codingMode;

  /// Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD
  /// (narration) as a stereo pair. The Audio Type field (audioType) will be set
  /// to 3, which signals to downstream systems that this stream contains
  /// "broadcaster mixed AD". Note that the input received by the encoder must
  /// contain pre-mixed audio; the encoder does not perform the mixing. The
  /// values in audioTypeControl and audioType (in AudioDescription) are ignored
  /// when set to broadcasterMixedAd. Leave set to "normal" when input does not
  /// contain pre-mixed audio + AD.
  final String inputType;

  /// AAC Profile.
  final String profile;

  /// Rate Control Mode.
  final String rateControlMode;

  /// Sets LATM / LOAS AAC output for raw containers.
  final String rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  final double sampleRate;

  /// Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2
  /// Transport Stream containers.
  final String spec;

  /// VBR Quality Level - Only used if rateControlMode is VBR.
  final String vbrQuality;

  AacSettings({
    this.bitrate,
    this.codingMode,
    this.inputType,
    this.profile,
    this.rateControlMode,
    this.rawFormat,
    this.sampleRate,
    this.spec,
    this.vbrQuality,
  });
  static AacSettings fromJson(Map<String, dynamic> json) => AacSettings(
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as double : null,
        codingMode: json.containsKey('CodingMode')
            ? json['CodingMode'] as String
            : null,
        inputType:
            json.containsKey('InputType') ? json['InputType'] as String : null,
        profile: json.containsKey('Profile') ? json['Profile'] as String : null,
        rateControlMode: json.containsKey('RateControlMode')
            ? json['RateControlMode'] as String
            : null,
        rawFormat:
            json.containsKey('RawFormat') ? json['RawFormat'] as String : null,
        sampleRate: json.containsKey('SampleRate')
            ? json['SampleRate'] as double
            : null,
        spec: json.containsKey('Spec') ? json['Spec'] as String : null,
        vbrQuality: json.containsKey('VbrQuality')
            ? json['VbrQuality'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Ac3 Settings
class Ac3Settings {
  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  final double bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC
  /// A/52-2012 for background on these values.
  final String bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  final String codingMode;

  /// Sets the dialnorm for the output. If excluded and input audio is Dolby
  /// Digital, dialnorm will be passed through.
  final int dialnorm;

  /// If set to filmStandard, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  final String drcProfile;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel
  /// prior to encoding. Only valid in codingMode32Lfe mode.
  final String lfeFilter;

  /// When set to "followInput", encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  final String metadataControl;

  Ac3Settings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialnorm,
    this.drcProfile,
    this.lfeFilter,
    this.metadataControl,
  });
  static Ac3Settings fromJson(Map<String, dynamic> json) => Ac3Settings(
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as double : null,
        bitstreamMode: json.containsKey('BitstreamMode')
            ? json['BitstreamMode'] as String
            : null,
        codingMode: json.containsKey('CodingMode')
            ? json['CodingMode'] as String
            : null,
        dialnorm: json.containsKey('Dialnorm') ? json['Dialnorm'] as int : null,
        drcProfile: json.containsKey('DrcProfile')
            ? json['DrcProfile'] as String
            : null,
        lfeFilter:
            json.containsKey('LfeFilter') ? json['LfeFilter'] as String : null,
        metadataControl: json.containsKey('MetadataControl')
            ? json['MetadataControl'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Archive Container Settings
class ArchiveContainerSettings {
  final M2TsSettings m2TsSettings;

  ArchiveContainerSettings({
    this.m2TsSettings,
  });
  static ArchiveContainerSettings fromJson(Map<String, dynamic> json) =>
      ArchiveContainerSettings(
        m2TsSettings: json.containsKey('M2tsSettings')
            ? M2TsSettings.fromJson(json['M2tsSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Archive Group Settings
class ArchiveGroupSettings {
  /// A directory and base filename where archive files should be written.
  final OutputLocationRef destination;

  /// Number of seconds to write to archive file before closing and starting a
  /// new one.
  final int rolloverInterval;

  ArchiveGroupSettings({
    @required this.destination,
    this.rolloverInterval,
  });
  static ArchiveGroupSettings fromJson(Map<String, dynamic> json) =>
      ArchiveGroupSettings(
        destination: OutputLocationRef.fromJson(json['Destination']),
        rolloverInterval: json.containsKey('RolloverInterval')
            ? json['RolloverInterval'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Archive Output Settings
class ArchiveOutputSettings {
  /// Settings specific to the container type of the file.
  final ArchiveContainerSettings containerSettings;

  /// Output file extension. If excluded, this will be auto-selected from the
  /// container type.
  final String extension;

  /// String concatenated to the end of the destination filename. Required for
  /// multiple outputs of the same type.
  final String nameModifier;

  ArchiveOutputSettings({
    @required this.containerSettings,
    this.extension,
    this.nameModifier,
  });
  static ArchiveOutputSettings fromJson(Map<String, dynamic> json) =>
      ArchiveOutputSettings(
        containerSettings:
            ArchiveContainerSettings.fromJson(json['ContainerSettings']),
        extension:
            json.containsKey('Extension') ? json['Extension'] as String : null,
        nameModifier: json.containsKey('NameModifier')
            ? json['NameModifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Arib Destination Settings
class AribDestinationSettings {
  AribDestinationSettings();
  static AribDestinationSettings fromJson(Map<String, dynamic> json) =>
      AribDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Arib Source Settings
class AribSourceSettings {
  AribSourceSettings();
  static AribSourceSettings fromJson(Map<String, dynamic> json) =>
      AribSourceSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Channel Mapping
class AudioChannelMapping {
  /// Indices and gain values for each input channel that should be remixed into
  /// this output channel.
  final List<InputChannelLevel> inputChannelLevels;

  /// The index of the output channel being produced.
  final int outputChannel;

  AudioChannelMapping({
    @required this.inputChannelLevels,
    @required this.outputChannel,
  });
  static AudioChannelMapping fromJson(Map<String, dynamic> json) =>
      AudioChannelMapping(
        inputChannelLevels: (json['InputChannelLevels'] as List)
            .map((e) => InputChannelLevel.fromJson(e))
            .toList(),
        outputChannel: json['OutputChannel'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Codec Settings
class AudioCodecSettings {
  final AacSettings aacSettings;

  final Ac3Settings ac3Settings;

  final Eac3Settings eac3Settings;

  final Mp2Settings mp2Settings;

  final PassThroughSettings passThroughSettings;

  AudioCodecSettings({
    this.aacSettings,
    this.ac3Settings,
    this.eac3Settings,
    this.mp2Settings,
    this.passThroughSettings,
  });
  static AudioCodecSettings fromJson(Map<String, dynamic> json) =>
      AudioCodecSettings(
        aacSettings: json.containsKey('AacSettings')
            ? AacSettings.fromJson(json['AacSettings'])
            : null,
        ac3Settings: json.containsKey('Ac3Settings')
            ? Ac3Settings.fromJson(json['Ac3Settings'])
            : null,
        eac3Settings: json.containsKey('Eac3Settings')
            ? Eac3Settings.fromJson(json['Eac3Settings'])
            : null,
        mp2Settings: json.containsKey('Mp2Settings')
            ? Mp2Settings.fromJson(json['Mp2Settings'])
            : null,
        passThroughSettings: json.containsKey('PassThroughSettings')
            ? PassThroughSettings.fromJson(json['PassThroughSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Description
class AudioDescription {
  /// Advanced audio normalization settings.
  final AudioNormalizationSettings audioNormalizationSettings;

  /// The name of the AudioSelector used as the source for this
  /// AudioDescription.
  final String audioSelectorName;

  /// Applies only if audioTypeControl is useConfigured. The values for
  /// audioType are defined in ISO-IEC 13818-1.
  final String audioType;

  /// Determines how audio type is determined. followInput: If the input
  /// contains an ISO 639 audioType, then that value is passed through to the
  /// output. If the input contains no ISO 639 audioType, the value in Audio
  /// Type is included in the output. useConfigured: The value in Audio Type is
  /// included in the output. Note that this field and audioType are both
  /// ignored if inputType is broadcasterMixedAd.
  final String audioTypeControl;

  /// Audio codec settings.
  final AudioCodecSettings codecSettings;

  /// Indicates the language of the audio output track. Only used if
  /// languageControlMode is useConfigured, or there is no ISO 639 language code
  /// specified in the input.
  final String languageCode;

  /// Choosing followInput will cause the ISO 639 language code of the output to
  /// follow the ISO 639 language code of the input. The languageCode will be
  /// used when useConfigured is set, or when followInput is selected but there
  /// is no ISO 639 language code specified by the input.
  final String languageCodeControl;

  /// The name of this AudioDescription. Outputs will use this name to uniquely
  /// identify this AudioDescription. Description names should be unique within
  /// this Live Event.
  final String name;

  /// Settings that control how input audio channels are remixed into the output
  /// audio channels.
  final RemixSettings remixSettings;

  /// Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by
  /// the player (eg. English, or Director Commentary).
  final String streamName;

  AudioDescription({
    this.audioNormalizationSettings,
    @required this.audioSelectorName,
    this.audioType,
    this.audioTypeControl,
    this.codecSettings,
    this.languageCode,
    this.languageCodeControl,
    @required this.name,
    this.remixSettings,
    this.streamName,
  });
  static AudioDescription fromJson(Map<String, dynamic> json) =>
      AudioDescription(
        audioNormalizationSettings:
            json.containsKey('AudioNormalizationSettings')
                ? AudioNormalizationSettings.fromJson(
                    json['AudioNormalizationSettings'])
                : null,
        audioSelectorName: json['AudioSelectorName'] as String,
        audioType:
            json.containsKey('AudioType') ? json['AudioType'] as String : null,
        audioTypeControl: json.containsKey('AudioTypeControl')
            ? json['AudioTypeControl'] as String
            : null,
        codecSettings: json.containsKey('CodecSettings')
            ? AudioCodecSettings.fromJson(json['CodecSettings'])
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        languageCodeControl: json.containsKey('LanguageCodeControl')
            ? json['LanguageCodeControl'] as String
            : null,
        name: json['Name'] as String,
        remixSettings: json.containsKey('RemixSettings')
            ? RemixSettings.fromJson(json['RemixSettings'])
            : null,
        streamName: json.containsKey('StreamName')
            ? json['StreamName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Language Selection
class AudioLanguageSelection {
  /// Selects a specific three-letter language code from within an audio source.
  final String languageCode;

  /// When set to "strict", the transport stream demux strictly identifies audio
  /// streams by their language descriptor. If a PMT update occurs such that an
  /// audio stream matching the initially selected language is no longer present
  /// then mute will be encoded until the language returns. If "loose", then on
  /// a PMT update the demux will choose another audio stream in the program
  /// with the same stream type if it can't find one with the same language.
  final String languageSelectionPolicy;

  AudioLanguageSelection({
    @required this.languageCode,
    this.languageSelectionPolicy,
  });
  static AudioLanguageSelection fromJson(Map<String, dynamic> json) =>
      AudioLanguageSelection(
        languageCode: json['LanguageCode'] as String,
        languageSelectionPolicy: json.containsKey('LanguageSelectionPolicy')
            ? json['LanguageSelectionPolicy'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Normalization Settings
class AudioNormalizationSettings {
  /// Audio normalization algorithm to use. itu17701 conforms to the CALM Act
  /// specification, itu17702 conforms to the EBU R-128 specification.
  final String algorithm;

  /// When set to correctAudio the output audio is corrected using the chosen
  /// algorithm. If set to measureOnly, the audio will be measured but not
  /// adjusted.
  final String algorithmControl;

  /// Target LKFS(loudness) to adjust volume to. If no value is entered, a
  /// default value will be used according to the chosen algorithm. The CALM Act
  /// (1770-1) recommends a target of -24 LKFS. The EBU R-128 specification
  /// (1770-2) recommends a target of -23 LKFS.
  final double targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.targetLkfs,
  });
  static AudioNormalizationSettings fromJson(Map<String, dynamic> json) =>
      AudioNormalizationSettings(
        algorithm:
            json.containsKey('Algorithm') ? json['Algorithm'] as String : null,
        algorithmControl: json.containsKey('AlgorithmControl')
            ? json['AlgorithmControl'] as String
            : null,
        targetLkfs: json.containsKey('TargetLkfs')
            ? json['TargetLkfs'] as double
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Only Hls Settings
class AudioOnlyHlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  final String audioGroupId;

  /// Optional. Specifies the .jpg or .png image to use as the cover art for an
  /// audio-only output. We recommend a low bit-size file because the image
  /// increases the output audio bandwidth. The image is attached to the audio
  /// as an ID3 tag, frame type APIC, picture type 0x10, as per the "ID3 tag
  /// version 2.4.0 - Native Frames" standard.
  final InputLocation audioOnlyImage;

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

  AudioOnlyHlsSettings({
    this.audioGroupId,
    this.audioOnlyImage,
    this.audioTrackType,
  });
  static AudioOnlyHlsSettings fromJson(Map<String, dynamic> json) =>
      AudioOnlyHlsSettings(
        audioGroupId: json.containsKey('AudioGroupId')
            ? json['AudioGroupId'] as String
            : null,
        audioOnlyImage: json.containsKey('AudioOnlyImage')
            ? InputLocation.fromJson(json['AudioOnlyImage'])
            : null,
        audioTrackType: json.containsKey('AudioTrackType')
            ? json['AudioTrackType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Pid Selection
class AudioPidSelection {
  /// Selects a specific PID from within a source.
  final int pid;

  AudioPidSelection({
    @required this.pid,
  });
  static AudioPidSelection fromJson(Map<String, dynamic> json) =>
      AudioPidSelection(
        pid: json['Pid'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Selector
class AudioSelector {
  /// The name of this AudioSelector. AudioDescriptions will use this name to
  /// uniquely identify this Selector. Selector names should be unique per
  /// input.
  final String name;

  /// The audio selector settings.
  final AudioSelectorSettings selectorSettings;

  AudioSelector({
    @required this.name,
    this.selectorSettings,
  });
  static AudioSelector fromJson(Map<String, dynamic> json) => AudioSelector(
        name: json['Name'] as String,
        selectorSettings: json.containsKey('SelectorSettings')
            ? AudioSelectorSettings.fromJson(json['SelectorSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Audio Selector Settings
class AudioSelectorSettings {
  final AudioLanguageSelection audioLanguageSelection;

  final AudioPidSelection audioPidSelection;

  AudioSelectorSettings({
    this.audioLanguageSelection,
    this.audioPidSelection,
  });
  static AudioSelectorSettings fromJson(Map<String, dynamic> json) =>
      AudioSelectorSettings(
        audioLanguageSelection: json.containsKey('AudioLanguageSelection')
            ? AudioLanguageSelection.fromJson(json['AudioLanguageSelection'])
            : null,
        audioPidSelection: json.containsKey('AudioPidSelection')
            ? AudioPidSelection.fromJson(json['AudioPidSelection'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Avail Blanking
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  final InputLocation availBlankingImage;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// insertion metadata is added.
  final String state;

  AvailBlanking({
    this.availBlankingImage,
    this.state,
  });
  static AvailBlanking fromJson(Map<String, dynamic> json) => AvailBlanking(
        availBlankingImage: json.containsKey('AvailBlankingImage')
            ? InputLocation.fromJson(json['AvailBlankingImage'])
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Avail Configuration
class AvailConfiguration {
  /// Ad avail settings.
  final AvailSettings availSettings;

  AvailConfiguration({
    this.availSettings,
  });
  static AvailConfiguration fromJson(Map<String, dynamic> json) =>
      AvailConfiguration(
        availSettings: json.containsKey('AvailSettings')
            ? AvailSettings.fromJson(json['AvailSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Avail Settings
class AvailSettings {
  final Scte35SpliceInsert scte35SpliceInsert;

  final Scte35TimeSignalApos scte35TimeSignalApos;

  AvailSettings({
    this.scte35SpliceInsert,
    this.scte35TimeSignalApos,
  });
  static AvailSettings fromJson(Map<String, dynamic> json) => AvailSettings(
        scte35SpliceInsert: json.containsKey('Scte35SpliceInsert')
            ? Scte35SpliceInsert.fromJson(json['Scte35SpliceInsert'])
            : null,
        scte35TimeSignalApos: json.containsKey('Scte35TimeSignalApos')
            ? Scte35TimeSignalApos.fromJson(json['Scte35TimeSignalApos'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of schedule actions to create (in a request) or that have been
/// created (in a response).
class BatchScheduleActionCreateRequest {
  /// A list of schedule actions to create.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateRequest({
    @required this.scheduleActions,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// List of actions that have been created in the schedule.
class BatchScheduleActionCreateResult {
  /// List of actions that have been created in the schedule.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateResult({
    @required this.scheduleActions,
  });
  static BatchScheduleActionCreateResult fromJson(Map<String, dynamic> json) =>
      BatchScheduleActionCreateResult(
        scheduleActions: (json['ScheduleActions'] as List)
            .map((e) => ScheduleAction.fromJson(e))
            .toList(),
      );
}

/// A list of schedule actions to delete.
class BatchScheduleActionDeleteRequest {
  /// A list of schedule actions to delete.
  final List<String> actionNames;

  BatchScheduleActionDeleteRequest({
    @required this.actionNames,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// List of actions that have been deleted from the schedule.
class BatchScheduleActionDeleteResult {
  /// List of actions that have been deleted from the schedule.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionDeleteResult({
    @required this.scheduleActions,
  });
  static BatchScheduleActionDeleteResult fromJson(Map<String, dynamic> json) =>
      BatchScheduleActionDeleteResult(
        scheduleActions: (json['ScheduleActions'] as List)
            .map((e) => ScheduleAction.fromJson(e))
            .toList(),
      );
}

/// Placeholder documentation for BatchUpdateScheduleResponse
class BatchUpdateScheduleResponse {
  /// Schedule actions created in the schedule.
  final BatchScheduleActionCreateResult creates;

  /// Schedule actions deleted from the schedule.
  final BatchScheduleActionDeleteResult deletes;

  BatchUpdateScheduleResponse({
    this.creates,
    this.deletes,
  });
  static BatchUpdateScheduleResponse fromJson(Map<String, dynamic> json) =>
      BatchUpdateScheduleResponse(
        creates: json.containsKey('Creates')
            ? BatchScheduleActionCreateResult.fromJson(json['Creates'])
            : null,
        deletes: json.containsKey('Deletes')
            ? BatchScheduleActionDeleteResult.fromJson(json['Deletes'])
            : null,
      );
}

/// Blackout Slate
class BlackoutSlate {
  /// Blackout slate image to be used. Leave empty for solid black. Only bmp and
  /// png images are supported.
  final InputLocation blackoutSlateImage;

  /// Setting to enabled causes the encoder to blackout the video, audio, and
  /// captions, and raise the "Network Blackout Image" slate when an SCTE104/35
  /// Network End Segmentation Descriptor is encountered. The blackout will be
  /// lifted when the Network Start Segmentation Descriptor is encountered. The
  /// Network End and Network Start descriptors must contain a network ID that
  /// matches the value entered in "Network ID".
  final String networkEndBlackout;

  /// Path to local file to use as Network End Blackout image. Image will be
  /// scaled to fill the entire output raster.
  final InputLocation networkEndBlackoutImage;

  /// Provides Network ID that matches EIDR ID format (e.g.,
  /// "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").
  final String networkId;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// indicated by program metadata.
  final String state;

  BlackoutSlate({
    this.blackoutSlateImage,
    this.networkEndBlackout,
    this.networkEndBlackoutImage,
    this.networkId,
    this.state,
  });
  static BlackoutSlate fromJson(Map<String, dynamic> json) => BlackoutSlate(
        blackoutSlateImage: json.containsKey('BlackoutSlateImage')
            ? InputLocation.fromJson(json['BlackoutSlateImage'])
            : null,
        networkEndBlackout: json.containsKey('NetworkEndBlackout')
            ? json['NetworkEndBlackout'] as String
            : null,
        networkEndBlackoutImage: json.containsKey('NetworkEndBlackoutImage')
            ? InputLocation.fromJson(json['NetworkEndBlackoutImage'])
            : null,
        networkId:
            json.containsKey('NetworkId') ? json['NetworkId'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Burn In Destination Settings
class BurnInDestinationSettings {
  /// If no explicit xPosition or yPosition is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. Selecting "smart" justification will
  /// left-justify live subtitles and center-justify pre-recorded subtitles. All
  /// burn-in and DVB-Sub font settings must match.
  final String alignment;

  /// Specifies the color of the rectangle behind the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter out is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf'
  /// or 'tte'. Although the user can select output fonts for many different
  /// types of input captions, embedded, STL and teletext sources use a strict
  /// grid system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts. All burn-in and DVB-Sub font
  /// settings must match.
  final InputLocation font;

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

  /// When set to 'auto' fontSize will scale depending on the size of the
  /// output. Giving a positive integer will specify the exact font size in
  /// points. All burn-in and DVB-Sub font settings must match.
  final String fontSize;

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
  /// Leaving this parameter out is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the
  /// left. All burn-in and DVB-Sub font settings must match.
  final int shadowxOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text. All burn-in and DVB-Sub font settings must match.
  final int shadowyOffset;

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  final String teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions
  /// starting 10 pixels from the left of the output. If no explicit xPosition
  /// is provided, the horizontal caption position will be determined by the
  /// alignment parameter. All burn-in and DVB-Sub font settings must match.
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided,
  /// the caption will be positioned towards the bottom of the output. All
  /// burn-in and DVB-Sub font settings must match.
  final int yPosition;

  BurnInDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.font,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowxOffset,
    this.shadowyOffset,
    this.teletextGridControl,
    this.xPosition,
    this.yPosition,
  });
  static BurnInDestinationSettings fromJson(Map<String, dynamic> json) =>
      BurnInDestinationSettings(
        alignment:
            json.containsKey('Alignment') ? json['Alignment'] as String : null,
        backgroundColor: json.containsKey('BackgroundColor')
            ? json['BackgroundColor'] as String
            : null,
        backgroundOpacity: json.containsKey('BackgroundOpacity')
            ? json['BackgroundOpacity'] as int
            : null,
        font: json.containsKey('Font')
            ? InputLocation.fromJson(json['Font'])
            : null,
        fontColor:
            json.containsKey('FontColor') ? json['FontColor'] as String : null,
        fontOpacity:
            json.containsKey('FontOpacity') ? json['FontOpacity'] as int : null,
        fontResolution: json.containsKey('FontResolution')
            ? json['FontResolution'] as int
            : null,
        fontSize:
            json.containsKey('FontSize') ? json['FontSize'] as String : null,
        outlineColor: json.containsKey('OutlineColor')
            ? json['OutlineColor'] as String
            : null,
        outlineSize:
            json.containsKey('OutlineSize') ? json['OutlineSize'] as int : null,
        shadowColor: json.containsKey('ShadowColor')
            ? json['ShadowColor'] as String
            : null,
        shadowOpacity: json.containsKey('ShadowOpacity')
            ? json['ShadowOpacity'] as int
            : null,
        shadowxOffset: json.containsKey('ShadowXOffset')
            ? json['ShadowXOffset'] as int
            : null,
        shadowyOffset: json.containsKey('ShadowYOffset')
            ? json['ShadowYOffset'] as int
            : null,
        teletextGridControl: json.containsKey('TeletextGridControl')
            ? json['TeletextGridControl'] as String
            : null,
        xPosition:
            json.containsKey('XPosition') ? json['XPosition'] as int : null,
        yPosition:
            json.containsKey('YPosition') ? json['YPosition'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
class CaptionDescription {
  /// Specifies which input caption selector to use as a caption source when
  /// generating output captions. This field should match a captionSelector
  /// name.
  final String captionSelectorName;

  /// Additional settings for captions destination that depend on the
  /// destination type.
  final CaptionDestinationSettings destinationSettings;

  /// ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/
  final String languageCode;

  /// Human readable information to indicate captions available for players (eg.
  /// English, or Spanish).
  final String languageDescription;

  /// Name of the caption description. Used to associate a caption description
  /// with an output. Names must be unique within an event.
  final String name;

  CaptionDescription({
    @required this.captionSelectorName,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
    @required this.name,
  });
  static CaptionDescription fromJson(Map<String, dynamic> json) =>
      CaptionDescription(
        captionSelectorName: json['CaptionSelectorName'] as String,
        destinationSettings: json.containsKey('DestinationSettings')
            ? CaptionDestinationSettings.fromJson(json['DestinationSettings'])
            : null,
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        languageDescription: json.containsKey('LanguageDescription')
            ? json['LanguageDescription'] as String
            : null,
        name: json['Name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Caption Destination Settings
class CaptionDestinationSettings {
  final AribDestinationSettings aribDestinationSettings;

  final BurnInDestinationSettings burnInDestinationSettings;

  final DvbSubDestinationSettings dvbSubDestinationSettings;

  final EmbeddedDestinationSettings embeddedDestinationSettings;

  final EmbeddedPlusScte20DestinationSettings
      embeddedPlusScte20DestinationSettings;

  final RtmpCaptionInfoDestinationSettings rtmpCaptionInfoDestinationSettings;

  final Scte20PlusEmbeddedDestinationSettings
      scte20PlusEmbeddedDestinationSettings;

  final Scte27DestinationSettings scte27DestinationSettings;

  final SmpteTtDestinationSettings smpteTtDestinationSettings;

  final TeletextDestinationSettings teletextDestinationSettings;

  final TtmlDestinationSettings ttmlDestinationSettings;

  final WebvttDestinationSettings webvttDestinationSettings;

  CaptionDestinationSettings({
    this.aribDestinationSettings,
    this.burnInDestinationSettings,
    this.dvbSubDestinationSettings,
    this.embeddedDestinationSettings,
    this.embeddedPlusScte20DestinationSettings,
    this.rtmpCaptionInfoDestinationSettings,
    this.scte20PlusEmbeddedDestinationSettings,
    this.scte27DestinationSettings,
    this.smpteTtDestinationSettings,
    this.teletextDestinationSettings,
    this.ttmlDestinationSettings,
    this.webvttDestinationSettings,
  });
  static CaptionDestinationSettings fromJson(Map<String, dynamic> json) =>
      CaptionDestinationSettings(
        aribDestinationSettings: json.containsKey('AribDestinationSettings')
            ? AribDestinationSettings.fromJson(json['AribDestinationSettings'])
            : null,
        burnInDestinationSettings: json.containsKey('BurnInDestinationSettings')
            ? BurnInDestinationSettings.fromJson(
                json['BurnInDestinationSettings'])
            : null,
        dvbSubDestinationSettings: json.containsKey('DvbSubDestinationSettings')
            ? DvbSubDestinationSettings.fromJson(
                json['DvbSubDestinationSettings'])
            : null,
        embeddedDestinationSettings:
            json.containsKey('EmbeddedDestinationSettings')
                ? EmbeddedDestinationSettings.fromJson(
                    json['EmbeddedDestinationSettings'])
                : null,
        embeddedPlusScte20DestinationSettings:
            json.containsKey('EmbeddedPlusScte20DestinationSettings')
                ? EmbeddedPlusScte20DestinationSettings.fromJson(
                    json['EmbeddedPlusScte20DestinationSettings'])
                : null,
        rtmpCaptionInfoDestinationSettings:
            json.containsKey('RtmpCaptionInfoDestinationSettings')
                ? RtmpCaptionInfoDestinationSettings.fromJson(
                    json['RtmpCaptionInfoDestinationSettings'])
                : null,
        scte20PlusEmbeddedDestinationSettings:
            json.containsKey('Scte20PlusEmbeddedDestinationSettings')
                ? Scte20PlusEmbeddedDestinationSettings.fromJson(
                    json['Scte20PlusEmbeddedDestinationSettings'])
                : null,
        scte27DestinationSettings: json.containsKey('Scte27DestinationSettings')
            ? Scte27DestinationSettings.fromJson(
                json['Scte27DestinationSettings'])
            : null,
        smpteTtDestinationSettings:
            json.containsKey('SmpteTtDestinationSettings')
                ? SmpteTtDestinationSettings.fromJson(
                    json['SmpteTtDestinationSettings'])
                : null,
        teletextDestinationSettings:
            json.containsKey('TeletextDestinationSettings')
                ? TeletextDestinationSettings.fromJson(
                    json['TeletextDestinationSettings'])
                : null,
        ttmlDestinationSettings: json.containsKey('TtmlDestinationSettings')
            ? TtmlDestinationSettings.fromJson(json['TtmlDestinationSettings'])
            : null,
        webvttDestinationSettings: json.containsKey('WebvttDestinationSettings')
            ? WebvttDestinationSettings.fromJson(
                json['WebvttDestinationSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Maps a caption channel to an ISO 693-2 language code
/// (http://www.loc.gov/standards/iso639-2), with an optional description.
class CaptionLanguageMapping {
  /// The closed caption channel being described by this CaptionLanguageMapping.
  /// Each channel mapping must have a unique channel number (maximum of 4)
  final int captionChannel;

  /// Three character ISO 639-2 language code (see
  /// http://www.loc.gov/standards/iso639-2)
  final String languageCode;

  /// Textual description of language
  final String languageDescription;

  CaptionLanguageMapping({
    @required this.captionChannel,
    @required this.languageCode,
    @required this.languageDescription,
  });
  static CaptionLanguageMapping fromJson(Map<String, dynamic> json) =>
      CaptionLanguageMapping(
        captionChannel: json['CaptionChannel'] as int,
        languageCode: json['LanguageCode'] as String,
        languageDescription: json['LanguageDescription'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
class CaptionSelector {
  /// When specified this field indicates the three letter language code of the
  /// caption track to extract from the source.
  final String languageCode;

  /// Name identifier for a caption selector. This name is used to associate
  /// this caption selector with one or more caption descriptions. Names must be
  /// unique within an event.
  final String name;

  /// Caption selector settings.
  final CaptionSelectorSettings selectorSettings;

  CaptionSelector({
    this.languageCode,
    @required this.name,
    this.selectorSettings,
  });
  static CaptionSelector fromJson(Map<String, dynamic> json) => CaptionSelector(
        languageCode: json.containsKey('LanguageCode')
            ? json['LanguageCode'] as String
            : null,
        name: json['Name'] as String,
        selectorSettings: json.containsKey('SelectorSettings')
            ? CaptionSelectorSettings.fromJson(json['SelectorSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Caption Selector Settings
class CaptionSelectorSettings {
  final AribSourceSettings aribSourceSettings;

  final DvbSubSourceSettings dvbSubSourceSettings;

  final EmbeddedSourceSettings embeddedSourceSettings;

  final Scte20SourceSettings scte20SourceSettings;

  final Scte27SourceSettings scte27SourceSettings;

  final TeletextSourceSettings teletextSourceSettings;

  CaptionSelectorSettings({
    this.aribSourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.scte20SourceSettings,
    this.scte27SourceSettings,
    this.teletextSourceSettings,
  });
  static CaptionSelectorSettings fromJson(Map<String, dynamic> json) =>
      CaptionSelectorSettings(
        aribSourceSettings: json.containsKey('AribSourceSettings')
            ? AribSourceSettings.fromJson(json['AribSourceSettings'])
            : null,
        dvbSubSourceSettings: json.containsKey('DvbSubSourceSettings')
            ? DvbSubSourceSettings.fromJson(json['DvbSubSourceSettings'])
            : null,
        embeddedSourceSettings: json.containsKey('EmbeddedSourceSettings')
            ? EmbeddedSourceSettings.fromJson(json['EmbeddedSourceSettings'])
            : null,
        scte20SourceSettings: json.containsKey('Scte20SourceSettings')
            ? Scte20SourceSettings.fromJson(json['Scte20SourceSettings'])
            : null,
        scte27SourceSettings: json.containsKey('Scte27SourceSettings')
            ? Scte27SourceSettings.fromJson(json['Scte27SourceSettings'])
            : null,
        teletextSourceSettings: json.containsKey('TeletextSourceSettings')
            ? TeletextSourceSettings.fromJson(json['TeletextSourceSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for Channel
class Channel {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  Channel({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static Channel fromJson(Map<String, dynamic> json) => Channel(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        encoderSettings: json.containsKey('EncoderSettings')
            ? EncoderSettings.fromJson(json['EncoderSettings'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelineDetails: json.containsKey('PipelineDetails')
            ? (json['PipelineDetails'] as List)
                .map((e) => PipelineDetail.fromJson(e))
                .toList()
            : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Placeholder documentation for ChannelEgressEndpoint
class ChannelEgressEndpoint {
  /// Public IP of where a channel's output comes from
  final String sourceIp;

  ChannelEgressEndpoint({
    this.sourceIp,
  });
  static ChannelEgressEndpoint fromJson(Map<String, dynamic> json) =>
      ChannelEgressEndpoint(
        sourceIp:
            json.containsKey('SourceIp') ? json['SourceIp'] as String : null,
      );
}

/// Placeholder documentation for ChannelSummary
class ChannelSummary {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  ChannelSummary({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static ChannelSummary fromJson(Map<String, dynamic> json) => ChannelSummary(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Passthrough applies no color space conversion to the output
class ColorSpacePassthroughSettings {
  ColorSpacePassthroughSettings();
  static ColorSpacePassthroughSettings fromJson(Map<String, dynamic> json) =>
      ColorSpacePassthroughSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for CreateChannelResponse
class CreateChannelResponse {
  final Channel channel;

  CreateChannelResponse({
    this.channel,
  });
  static CreateChannelResponse fromJson(Map<String, dynamic> json) =>
      CreateChannelResponse(
        channel: json.containsKey('Channel')
            ? Channel.fromJson(json['Channel'])
            : null,
      );
}

/// Placeholder documentation for CreateInputResponse
class CreateInputResponse {
  final Input input;

  CreateInputResponse({
    this.input,
  });
  static CreateInputResponse fromJson(Map<String, dynamic> json) =>
      CreateInputResponse(
        input: json.containsKey('Input') ? Input.fromJson(json['Input']) : null,
      );
}

/// Placeholder documentation for CreateInputSecurityGroupResponse
class CreateInputSecurityGroupResponse {
  final InputSecurityGroup securityGroup;

  CreateInputSecurityGroupResponse({
    this.securityGroup,
  });
  static CreateInputSecurityGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateInputSecurityGroupResponse(
        securityGroup: json.containsKey('SecurityGroup')
            ? InputSecurityGroup.fromJson(json['SecurityGroup'])
            : null,
      );
}

/// Placeholder documentation for DeleteChannelResponse
class DeleteChannelResponse {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  DeleteChannelResponse({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static DeleteChannelResponse fromJson(Map<String, dynamic> json) =>
      DeleteChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        encoderSettings: json.containsKey('EncoderSettings')
            ? EncoderSettings.fromJson(json['EncoderSettings'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelineDetails: json.containsKey('PipelineDetails')
            ? (json['PipelineDetails'] as List)
                .map((e) => PipelineDetail.fromJson(e))
                .toList()
            : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Placeholder documentation for DeleteInputResponse
class DeleteInputResponse {
  DeleteInputResponse();
  static DeleteInputResponse fromJson(Map<String, dynamic> json) =>
      DeleteInputResponse();
}

/// Placeholder documentation for DeleteInputSecurityGroupResponse
class DeleteInputSecurityGroupResponse {
  DeleteInputSecurityGroupResponse();
  static DeleteInputSecurityGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteInputSecurityGroupResponse();
}

/// Placeholder documentation for DeleteReservationResponse
class DeleteReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String arn;

  /// Number of reserved resources
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String currencyCode;

  /// Lease duration, e.g. '12'
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  final String durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double fixedPrice;

  /// User specified reservation name
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final String offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  final String reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final String state;

  /// A collection of key-value pairs
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double usagePrice;

  DeleteReservationResponse({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  static DeleteReservationResponse fromJson(Map<String, dynamic> json) =>
      DeleteReservationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        durationUnits: json.containsKey('DurationUnits')
            ? json['DurationUnits'] as String
            : null,
        end: json.containsKey('End') ? json['End'] as String : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        offeringDescription: json.containsKey('OfferingDescription')
            ? json['OfferingDescription'] as String
            : null,
        offeringId: json.containsKey('OfferingId')
            ? json['OfferingId'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        reservationId: json.containsKey('ReservationId')
            ? json['ReservationId'] as String
            : null,
        resourceSpecification: json.containsKey('ResourceSpecification')
            ? ReservationResourceSpecification.fromJson(
                json['ResourceSpecification'])
            : null,
        start: json.containsKey('Start') ? json['Start'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
      );
}

/// Placeholder documentation for DeleteScheduleResponse
class DeleteScheduleResponse {
  DeleteScheduleResponse();
  static DeleteScheduleResponse fromJson(Map<String, dynamic> json) =>
      DeleteScheduleResponse();
}

/// Placeholder documentation for DescribeChannelResponse
class DescribeChannelResponse {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  DescribeChannelResponse({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static DescribeChannelResponse fromJson(Map<String, dynamic> json) =>
      DescribeChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        encoderSettings: json.containsKey('EncoderSettings')
            ? EncoderSettings.fromJson(json['EncoderSettings'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelineDetails: json.containsKey('PipelineDetails')
            ? (json['PipelineDetails'] as List)
                .map((e) => PipelineDetail.fromJson(e))
                .toList()
            : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Placeholder documentation for DescribeInputResponse
class DescribeInputResponse {
  /// The Unique ARN of the input (generated, immutable).
  final String arn;

  /// A list of channel IDs that that input is attached to (currently an input
  /// can only be attached to one channel).
  final List<String> attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  final List<InputDestination> destinations;

  /// The generated ID of the input (unique for user account, immutable).
  final String id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the
  /// channel is SINGLE_PIPELINE, only the first source will be ingested; the
  /// second source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  final String inputClass;

  /// Certain pull input sources can be dynamic, meaning that they can have
  /// their URL's dynamically changes during input switch actions. Presently,
  /// this functionality only works with MP4_FILE inputs.
  final String inputSourceType;

  /// A list of MediaConnect Flows for this input.
  final List<MediaConnectFlow> mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  final String name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  final String roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  final List<String> securityGroups;

  /// A list of the sources of the input (PULL-type).
  final List<InputSource> sources;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  final String type;

  DescribeInputResponse({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputSourceType,
    this.mediaConnectFlows,
    this.name,
    this.roleArn,
    this.securityGroups,
    this.sources,
    this.state,
    this.tags,
    this.type,
  });
  static DescribeInputResponse fromJson(Map<String, dynamic> json) =>
      DescribeInputResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        attachedChannels: json.containsKey('AttachedChannels')
            ? (json['AttachedChannels'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => InputDestination.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputClass: json.containsKey('InputClass')
            ? json['InputClass'] as String
            : null,
        inputSourceType: json.containsKey('InputSourceType')
            ? json['InputSourceType'] as String
            : null,
        mediaConnectFlows: json.containsKey('MediaConnectFlows')
            ? (json['MediaConnectFlows'] as List)
                .map((e) => MediaConnectFlow.fromJson(e))
                .toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List).map((e) => e as String).toList()
            : null,
        sources: json.containsKey('Sources')
            ? (json['Sources'] as List)
                .map((e) => InputSource.fromJson(e))
                .toList()
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
}

/// Placeholder documentation for DescribeInputSecurityGroupResponse
class DescribeInputSecurityGroupResponse {
  /// Unique ARN of Input Security Group
  final String arn;

  /// The Id of the Input Security Group
  final String id;

  /// The list of inputs currently using this Input Security Group.
  final List<String> inputs;

  /// The current state of the Input Security Group.
  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  /// Whitelist rules and their sync status
  final List<InputWhitelistRule> whitelistRules;

  DescribeInputSecurityGroupResponse({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });
  static DescribeInputSecurityGroupResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeInputSecurityGroupResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputs: json.containsKey('Inputs')
            ? (json['Inputs'] as List).map((e) => e as String).toList()
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        whitelistRules: json.containsKey('WhitelistRules')
            ? (json['WhitelistRules'] as List)
                .map((e) => InputWhitelistRule.fromJson(e))
                .toList()
            : null,
      );
}

/// Placeholder documentation for DescribeOfferingResponse
class DescribeOfferingResponse {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  final String arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String currencyCode;

  /// Lease duration, e.g. '12'
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  final String durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final String offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String region;

  /// Resource configuration details
  final ReservationResourceSpecification resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double usagePrice;

  DescribeOfferingResponse({
    this.arn,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.fixedPrice,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.resourceSpecification,
    this.usagePrice,
  });
  static DescribeOfferingResponse fromJson(Map<String, dynamic> json) =>
      DescribeOfferingResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        durationUnits: json.containsKey('DurationUnits')
            ? json['DurationUnits'] as String
            : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        offeringDescription: json.containsKey('OfferingDescription')
            ? json['OfferingDescription'] as String
            : null,
        offeringId: json.containsKey('OfferingId')
            ? json['OfferingId'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        resourceSpecification: json.containsKey('ResourceSpecification')
            ? ReservationResourceSpecification.fromJson(
                json['ResourceSpecification'])
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
      );
}

/// Placeholder documentation for DescribeReservationResponse
class DescribeReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String arn;

  /// Number of reserved resources
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String currencyCode;

  /// Lease duration, e.g. '12'
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  final String durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double fixedPrice;

  /// User specified reservation name
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final String offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  final String reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final String state;

  /// A collection of key-value pairs
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double usagePrice;

  DescribeReservationResponse({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  static DescribeReservationResponse fromJson(Map<String, dynamic> json) =>
      DescribeReservationResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        durationUnits: json.containsKey('DurationUnits')
            ? json['DurationUnits'] as String
            : null,
        end: json.containsKey('End') ? json['End'] as String : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        offeringDescription: json.containsKey('OfferingDescription')
            ? json['OfferingDescription'] as String
            : null,
        offeringId: json.containsKey('OfferingId')
            ? json['OfferingId'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        reservationId: json.containsKey('ReservationId')
            ? json['ReservationId'] as String
            : null,
        resourceSpecification: json.containsKey('ResourceSpecification')
            ? ReservationResourceSpecification.fromJson(
                json['ResourceSpecification'])
            : null,
        start: json.containsKey('Start') ? json['Start'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
      );
}

/// Placeholder documentation for DescribeScheduleResponse
class DescribeScheduleResponse {
  /// The next token; for use in pagination.
  final String nextToken;

  /// The list of actions in the schedule.
  final List<ScheduleAction> scheduleActions;

  DescribeScheduleResponse({
    this.nextToken,
    this.scheduleActions,
  });
  static DescribeScheduleResponse fromJson(Map<String, dynamic> json) =>
      DescribeScheduleResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        scheduleActions: json.containsKey('ScheduleActions')
            ? (json['ScheduleActions'] as List)
                .map((e) => ScheduleAction.fromJson(e))
                .toList()
            : null,
      );
}

/// DVB Network Information Table (NIT)
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  final int networkId;

  /// The network name text placed in the networkNameDescriptor inside the
  /// Network Information Table. Maximum length is 256 characters.
  final String networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int repInterval;

  DvbNitSettings({
    @required this.networkId,
    @required this.networkName,
    this.repInterval,
  });
  static DvbNitSettings fromJson(Map<String, dynamic> json) => DvbNitSettings(
        networkId: json['NetworkId'] as int,
        networkName: json['NetworkName'] as String,
        repInterval:
            json.containsKey('RepInterval') ? json['RepInterval'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// DVB Service Description Table (SDT)
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream. The
  /// sdtFollow setting copies SDT information from input stream to output
  /// stream. The sdtFollowIfPresent setting copies SDT information from input
  /// stream to output stream if SDT information is present in the input,
  /// otherwise it will fall back on the user-defined values. The sdtManual
  /// setting means user will enter the SDT information. The sdtNone setting
  /// means output stream will not contain SDT information.
  final String outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int repInterval;

  /// The service name placed in the serviceDescriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String serviceName;

  /// The service provider name placed in the serviceDescriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.repInterval,
    this.serviceName,
    this.serviceProviderName,
  });
  static DvbSdtSettings fromJson(Map<String, dynamic> json) => DvbSdtSettings(
        outputSdt:
            json.containsKey('OutputSdt') ? json['OutputSdt'] as String : null,
        repInterval:
            json.containsKey('RepInterval') ? json['RepInterval'] as int : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
        serviceProviderName: json.containsKey('ServiceProviderName')
            ? json['ServiceProviderName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Dvb Sub Destination Settings
class DvbSubDestinationSettings {
  /// If no explicit xPosition or yPosition is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. Selecting "smart" justification will
  /// left-justify live subtitles and center-justify pre-recorded subtitles.
  /// This option is not valid for source captions that are STL or 608/embedded.
  /// These source settings are already pre-defined by the caption stream. All
  /// burn-in and DVB-Sub font settings must match.
  final String alignment;

  /// Specifies the color of the rectangle behind the captions. All burn-in and
  /// DVB-Sub font settings must match.
  final String backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent). All burn-in and DVB-Sub font settings must match.
  final int backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf'
  /// or 'tte'. Although the user can select output fonts for many different
  /// types of input captions, embedded, STL and teletext sources use a strict
  /// grid system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts. All burn-in and DVB-Sub font
  /// settings must match.
  final InputLocation font;

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

  /// When set to auto fontSize will scale depending on the size of the output.
  /// Giving a positive integer will specify the exact font size in points. All
  /// burn-in and DVB-Sub font settings must match.
  final String fontSize;

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

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  final String teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions
  /// starting 10 pixels from the left of the output. If no explicit xPosition
  /// is provided, the horizontal caption position will be determined by the
  /// alignment parameter. This option is not valid for source captions that are
  /// STL, 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided,
  /// the caption will be positioned towards the bottom of the output. This
  /// option is not valid for source captions that are STL, 608/embedded or
  /// teletext. These source settings are already pre-defined by the caption
  /// stream. All burn-in and DVB-Sub font settings must match.
  final int yPosition;

  DvbSubDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.font,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowxOffset,
    this.shadowyOffset,
    this.teletextGridControl,
    this.xPosition,
    this.yPosition,
  });
  static DvbSubDestinationSettings fromJson(Map<String, dynamic> json) =>
      DvbSubDestinationSettings(
        alignment:
            json.containsKey('Alignment') ? json['Alignment'] as String : null,
        backgroundColor: json.containsKey('BackgroundColor')
            ? json['BackgroundColor'] as String
            : null,
        backgroundOpacity: json.containsKey('BackgroundOpacity')
            ? json['BackgroundOpacity'] as int
            : null,
        font: json.containsKey('Font')
            ? InputLocation.fromJson(json['Font'])
            : null,
        fontColor:
            json.containsKey('FontColor') ? json['FontColor'] as String : null,
        fontOpacity:
            json.containsKey('FontOpacity') ? json['FontOpacity'] as int : null,
        fontResolution: json.containsKey('FontResolution')
            ? json['FontResolution'] as int
            : null,
        fontSize:
            json.containsKey('FontSize') ? json['FontSize'] as String : null,
        outlineColor: json.containsKey('OutlineColor')
            ? json['OutlineColor'] as String
            : null,
        outlineSize:
            json.containsKey('OutlineSize') ? json['OutlineSize'] as int : null,
        shadowColor: json.containsKey('ShadowColor')
            ? json['ShadowColor'] as String
            : null,
        shadowOpacity: json.containsKey('ShadowOpacity')
            ? json['ShadowOpacity'] as int
            : null,
        shadowxOffset: json.containsKey('ShadowXOffset')
            ? json['ShadowXOffset'] as int
            : null,
        shadowyOffset: json.containsKey('ShadowYOffset')
            ? json['ShadowYOffset'] as int
            : null,
        teletextGridControl: json.containsKey('TeletextGridControl')
            ? json['TeletextGridControl'] as String
            : null,
        xPosition:
            json.containsKey('XPosition') ? json['XPosition'] as int : null,
        yPosition:
            json.containsKey('YPosition') ? json['YPosition'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Dvb Sub Source Settings
class DvbSubSourceSettings {
  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  final int pid;

  DvbSubSourceSettings({
    this.pid,
  });
  static DvbSubSourceSettings fromJson(Map<String, dynamic> json) =>
      DvbSubSourceSettings(
        pid: json.containsKey('Pid') ? json['Pid'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// DVB Time and Date Table (SDT)
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int repInterval;

  DvbTdtSettings({
    this.repInterval,
  });
  static DvbTdtSettings fromJson(Map<String, dynamic> json) => DvbTdtSettings(
        repInterval:
            json.containsKey('RepInterval') ? json['RepInterval'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Eac3 Settings
class Eac3Settings {
  /// When set to attenuate3Db, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  final String attenuationControl;

  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  final double bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See
  /// ATSC A/52-2012 (Annex E) for background on these values.
  final String bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  final String codingMode;

  /// When set to enabled, activates a DC highpass filter for all input
  /// channels.
  final String dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby
  /// Digital Plus, dialnorm will be passed through.
  final int dialnorm;

  /// Sets the Dolby dynamic range compression profile.
  final String drcLine;

  /// Sets the profile for heavy Dolby dynamic range compression, ensures that
  /// the instantaneous signal peaks do not exceed specified levels.
  final String drcRf;

  /// When encoding 3/2 audio, setting to lfe enables the LFE channel
  final String lfeControl;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel
  /// prior to encoding. Only valid with codingMode32 coding mode.
  final String lfeFilter;

  /// Left only/Right only center mix level. Only used for 3/2 coding mode.
  final double loRoCenterMixLevel;

  /// Left only/Right only surround mix level. Only used for 3/2 coding mode.
  final double loRoSurroundMixLevel;

  /// Left total/Right total center mix level. Only used for 3/2 coding mode.
  final double ltRtCenterMixLevel;

  /// Left total/Right total surround mix level. Only used for 3/2 coding mode.
  final double ltRtSurroundMixLevel;

  /// When set to followInput, encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  final String metadataControl;

  /// When set to whenPossible, input DD+ audio will be passed through if it is
  /// present on the input. This detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have
  /// a consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  final String passthroughControl;

  /// When set to shift90Degrees, applies a 90-degree phase shift to the
  /// surround channels. Only used for 3/2 coding mode.
  final String phaseControl;

  /// Stereo downmix preference. Only used for 3/2 coding mode.
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
    this.drcLine,
    this.drcRf,
    this.lfeControl,
    this.lfeFilter,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.metadataControl,
    this.passthroughControl,
    this.phaseControl,
    this.stereoDownmix,
    this.surroundExMode,
    this.surroundMode,
  });
  static Eac3Settings fromJson(Map<String, dynamic> json) => Eac3Settings(
        attenuationControl: json.containsKey('AttenuationControl')
            ? json['AttenuationControl'] as String
            : null,
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as double : null,
        bitstreamMode: json.containsKey('BitstreamMode')
            ? json['BitstreamMode'] as String
            : null,
        codingMode: json.containsKey('CodingMode')
            ? json['CodingMode'] as String
            : null,
        dcFilter:
            json.containsKey('DcFilter') ? json['DcFilter'] as String : null,
        dialnorm: json.containsKey('Dialnorm') ? json['Dialnorm'] as int : null,
        drcLine: json.containsKey('DrcLine') ? json['DrcLine'] as String : null,
        drcRf: json.containsKey('DrcRf') ? json['DrcRf'] as String : null,
        lfeControl: json.containsKey('LfeControl')
            ? json['LfeControl'] as String
            : null,
        lfeFilter:
            json.containsKey('LfeFilter') ? json['LfeFilter'] as String : null,
        loRoCenterMixLevel: json.containsKey('LoRoCenterMixLevel')
            ? json['LoRoCenterMixLevel'] as double
            : null,
        loRoSurroundMixLevel: json.containsKey('LoRoSurroundMixLevel')
            ? json['LoRoSurroundMixLevel'] as double
            : null,
        ltRtCenterMixLevel: json.containsKey('LtRtCenterMixLevel')
            ? json['LtRtCenterMixLevel'] as double
            : null,
        ltRtSurroundMixLevel: json.containsKey('LtRtSurroundMixLevel')
            ? json['LtRtSurroundMixLevel'] as double
            : null,
        metadataControl: json.containsKey('MetadataControl')
            ? json['MetadataControl'] as String
            : null,
        passthroughControl: json.containsKey('PassthroughControl')
            ? json['PassthroughControl'] as String
            : null,
        phaseControl: json.containsKey('PhaseControl')
            ? json['PhaseControl'] as String
            : null,
        stereoDownmix: json.containsKey('StereoDownmix')
            ? json['StereoDownmix'] as String
            : null,
        surroundExMode: json.containsKey('SurroundExMode')
            ? json['SurroundExMode'] as String
            : null,
        surroundMode: json.containsKey('SurroundMode')
            ? json['SurroundMode'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Embedded Destination Settings
class EmbeddedDestinationSettings {
  EmbeddedDestinationSettings();
  static EmbeddedDestinationSettings fromJson(Map<String, dynamic> json) =>
      EmbeddedDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Embedded Plus Scte20 Destination Settings
class EmbeddedPlusScte20DestinationSettings {
  EmbeddedPlusScte20DestinationSettings();
  static EmbeddedPlusScte20DestinationSettings fromJson(
          Map<String, dynamic> json) =>
      EmbeddedPlusScte20DestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Embedded Source Settings
class EmbeddedSourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  final String convert608To708;

  /// Set to "auto" to handle streams with intermittent and/or non-aligned
  /// SCTE-20 and Embedded captions.
  final String scte20Detection;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int source608ChannelNumber;

  /// This field is unused and deprecated.
  final int source608TrackNumber;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.scte20Detection,
    this.source608ChannelNumber,
    this.source608TrackNumber,
  });
  static EmbeddedSourceSettings fromJson(Map<String, dynamic> json) =>
      EmbeddedSourceSettings(
        convert608To708: json.containsKey('Convert608To708')
            ? json['Convert608To708'] as String
            : null,
        scte20Detection: json.containsKey('Scte20Detection')
            ? json['Scte20Detection'] as String
            : null,
        source608ChannelNumber: json.containsKey('Source608ChannelNumber')
            ? json['Source608ChannelNumber'] as int
            : null,
        source608TrackNumber: json.containsKey('Source608TrackNumber')
            ? json['Source608TrackNumber'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Encoder Settings
class EncoderSettings {
  final List<AudioDescription> audioDescriptions;

  /// Settings for ad avail blanking.
  final AvailBlanking availBlanking;

  /// Event-wide configuration settings for ad avail insertion.
  final AvailConfiguration availConfiguration;

  /// Settings for blackout slate.
  final BlackoutSlate blackoutSlate;

  /// Settings for caption decriptions
  final List<CaptionDescription> captionDescriptions;

  /// Configuration settings that apply to the event as a whole.
  final GlobalConfiguration globalConfiguration;

  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig timecodeConfig;

  final List<VideoDescription> videoDescriptions;

  EncoderSettings({
    @required this.audioDescriptions,
    this.availBlanking,
    this.availConfiguration,
    this.blackoutSlate,
    this.captionDescriptions,
    this.globalConfiguration,
    @required this.outputGroups,
    @required this.timecodeConfig,
    @required this.videoDescriptions,
  });
  static EncoderSettings fromJson(Map<String, dynamic> json) => EncoderSettings(
        audioDescriptions: (json['AudioDescriptions'] as List)
            .map((e) => AudioDescription.fromJson(e))
            .toList(),
        availBlanking: json.containsKey('AvailBlanking')
            ? AvailBlanking.fromJson(json['AvailBlanking'])
            : null,
        availConfiguration: json.containsKey('AvailConfiguration')
            ? AvailConfiguration.fromJson(json['AvailConfiguration'])
            : null,
        blackoutSlate: json.containsKey('BlackoutSlate')
            ? BlackoutSlate.fromJson(json['BlackoutSlate'])
            : null,
        captionDescriptions: json.containsKey('CaptionDescriptions')
            ? (json['CaptionDescriptions'] as List)
                .map((e) => CaptionDescription.fromJson(e))
                .toList()
            : null,
        globalConfiguration: json.containsKey('GlobalConfiguration')
            ? GlobalConfiguration.fromJson(json['GlobalConfiguration'])
            : null,
        outputGroups: (json['OutputGroups'] as List)
            .map((e) => OutputGroup.fromJson(e))
            .toList(),
        timecodeConfig: TimecodeConfig.fromJson(json['TimecodeConfig']),
        videoDescriptions: (json['VideoDescriptions'] as List)
            .map((e) => VideoDescription.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Fec Output Settings
class FecOutputSettings {
  /// Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.
  /// The number of transport stream packets per column error correction packet.
  /// Must be between 4 and 20, inclusive.
  final int columnDepth;

  /// Enables column only or column and row based FEC
  final String includeFec;

  /// Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.
  /// Must be between 1 and 20, inclusive. If only Column FEC is used, then
  /// larger values increase robustness. If Row FEC is used, then this is the
  /// number of transport stream packets per row error correction packet, and
  /// the value must be between 4 and 20, inclusive, if includeFec is
  /// columnAndRow. If includeFec is column, this value must be 1 to 20,
  /// inclusive.
  final int rowLength;

  FecOutputSettings({
    this.columnDepth,
    this.includeFec,
    this.rowLength,
  });
  static FecOutputSettings fromJson(Map<String, dynamic> json) =>
      FecOutputSettings(
        columnDepth:
            json.containsKey('ColumnDepth') ? json['ColumnDepth'] as int : null,
        includeFec: json.containsKey('IncludeFec')
            ? json['IncludeFec'] as String
            : null,
        rowLength:
            json.containsKey('RowLength') ? json['RowLength'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Start time for the action.
class FixedModeScheduleActionStartSettings {
  /// Start time for the action to start in the channel. (Not the time for the
  /// action to be added to the schedule: actions are always added to the
  /// schedule immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the
  /// letters are digits (for example, mm might be 01) except for the two
  /// constants "T" for time and "Z" for "UTC format".
  final String time;

  FixedModeScheduleActionStartSettings({
    @required this.time,
  });
  static FixedModeScheduleActionStartSettings fromJson(
          Map<String, dynamic> json) =>
      FixedModeScheduleActionStartSettings(
        time: json['Time'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings to specify if an action follows another.
class FollowModeScheduleActionStartSettings {
  /// Identifies whether this action starts relative to the start or relative to
  /// the end of the reference action.
  final String followPoint;

  /// The action name of another action that this one refers to.
  final String referenceActionName;

  FollowModeScheduleActionStartSettings({
    @required this.followPoint,
    @required this.referenceActionName,
  });
  static FollowModeScheduleActionStartSettings fromJson(
          Map<String, dynamic> json) =>
      FollowModeScheduleActionStartSettings(
        followPoint: json['FollowPoint'] as String,
        referenceActionName: json['ReferenceActionName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Frame Capture Group Settings
class FrameCaptureGroupSettings {
  /// The destination for the frame capture files. Either the URI for an Amazon
  /// S3 bucket and object, plus a file name prefix (for example,
  /// s3ssl://sportsDelivery/highlights/20180820/curling_) or the URI for a
  /// MediaStore container, plus a file name prefix (for example,
  /// mediastoressl://sportsDelivery/20180820/curling_). The final file names
  /// consist of the prefix from the destination field (for example, "curling_")
  /// + name modifier + the counter (5 digits, starting from 00001) + extension
  /// (which is always .jpg). For example, curlingLow.00001.jpg
  final OutputLocationRef destination;

  FrameCaptureGroupSettings({
    @required this.destination,
  });
  static FrameCaptureGroupSettings fromJson(Map<String, dynamic> json) =>
      FrameCaptureGroupSettings(
        destination: OutputLocationRef.fromJson(json['Destination']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Frame Capture Output Settings
class FrameCaptureOutputSettings {
  /// Required if the output group contains more than one output. This modifier
  /// forms part of the output file name.
  final String nameModifier;

  FrameCaptureOutputSettings({
    this.nameModifier,
  });
  static FrameCaptureOutputSettings fromJson(Map<String, dynamic> json) =>
      FrameCaptureOutputSettings(
        nameModifier: json.containsKey('NameModifier')
            ? json['NameModifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Frame Capture Settings
class FrameCaptureSettings {
  /// The frequency, in seconds, for capturing frames for inclusion in the
  /// output. For example, "10" means capture a frame every 10 seconds.
  final int captureInterval;

  FrameCaptureSettings({
    @required this.captureInterval,
  });
  static FrameCaptureSettings fromJson(Map<String, dynamic> json) =>
      FrameCaptureSettings(
        captureInterval: json['CaptureInterval'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Global Configuration
class GlobalConfiguration {
  /// Value to set the initial audio gain for the Live Event.
  final int initialAudioGain;

  /// Indicates the action to take when the current input completes (e.g.
  /// end-of-file). When switchAndLoopInputs is configured the encoder will
  /// restart at the beginning of the first input. When "none" is configured the
  /// encoder will transcode either black, a solid color, or a user specified
  /// slate images per the "Input Loss Behavior" configuration until the next
  /// input switch occurs (which is controlled through the Channel Schedule
  /// API).
  final String inputEndAction;

  /// Settings for system actions when input is lost.
  final InputLossBehavior inputLossBehavior;

  /// Indicates how MediaLive pipelines are synchronized. PIPELINELOCKING -
  /// MediaLive will attempt to synchronize the output of each pipeline to the
  /// other. EPOCHLOCKING - MediaLive will attempt to synchronize the output of
  /// each pipeline to the Unix epoch.
  final String outputLockingMode;

  /// Indicates whether the rate of frames emitted by the Live encoder should be
  /// paced by its system clock (which optionally may be locked to another
  /// source via NTP) or should be locked to the clock of the source that is
  /// providing the input stream.
  final String outputTimingSource;

  /// Adjusts video input buffer for streams with very low video framerates.
  /// This is commonly set to enabled for music channels with less than one
  /// video frame per second.
  final String supportLowFramerateInputs;

  GlobalConfiguration({
    this.initialAudioGain,
    this.inputEndAction,
    this.inputLossBehavior,
    this.outputLockingMode,
    this.outputTimingSource,
    this.supportLowFramerateInputs,
  });
  static GlobalConfiguration fromJson(Map<String, dynamic> json) =>
      GlobalConfiguration(
        initialAudioGain: json.containsKey('InitialAudioGain')
            ? json['InitialAudioGain'] as int
            : null,
        inputEndAction: json.containsKey('InputEndAction')
            ? json['InputEndAction'] as String
            : null,
        inputLossBehavior: json.containsKey('InputLossBehavior')
            ? InputLossBehavior.fromJson(json['InputLossBehavior'])
            : null,
        outputLockingMode: json.containsKey('OutputLockingMode')
            ? json['OutputLockingMode'] as String
            : null,
        outputTimingSource: json.containsKey('OutputTimingSource')
            ? json['OutputTimingSource'] as String
            : null,
        supportLowFramerateInputs: json.containsKey('SupportLowFramerateInputs')
            ? json['SupportLowFramerateInputs'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// H264 Color Space Settings
class H264ColorSpaceSettings {
  final ColorSpacePassthroughSettings colorSpacePassthroughSettings;

  final Rec601Settings rec601Settings;

  final Rec709Settings rec709Settings;

  H264ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.rec601Settings,
    this.rec709Settings,
  });
  static H264ColorSpaceSettings fromJson(Map<String, dynamic> json) =>
      H264ColorSpaceSettings(
        colorSpacePassthroughSettings:
            json.containsKey('ColorSpacePassthroughSettings')
                ? ColorSpacePassthroughSettings.fromJson(
                    json['ColorSpacePassthroughSettings'])
                : null,
        rec601Settings: json.containsKey('Rec601Settings')
            ? Rec601Settings.fromJson(json['Rec601Settings'])
            : null,
        rec709Settings: json.containsKey('Rec709Settings')
            ? Rec709Settings.fromJson(json['Rec709Settings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// H264 Settings
class H264Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final String adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream. If
  /// afdSignaling is "auto", the system will try to preserve the input AFD
  /// value (in cases where multiple AFD values are valid). If set to "fixed",
  /// the AFD value will be the value configured in the fixedAfd parameter.
  final String afdSignaling;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest
  /// multiple of 1000.
  final int bitrate;

  /// Percentage of the buffer that should initially be filled (HRD buffer
  /// model).
  final int bufFillPct;

  /// Size of buffer (HRD buffer model) in bits.
  final int bufSize;

  /// Includes colorspace metadata in the output.
  final String colorMetadata;

  /// Color Space settings
  final H264ColorSpaceSettings colorSpaceSettings;

  /// Entropy encoding mode. Use cabac (must be in Main or High profile) or
  /// cavlc.
  final String entropyEncoding;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  final String fixedAfd;

  /// If set to enabled, adjust quantization within each frame to reduce flicker
  /// or 'pop' on I-frames.
  final String flickerAq;

  /// This field indicates how the output video frame rate is specified. If
  /// "specified" is selected then the output video frame rate is determined by
  /// framerateNumerator and framerateDenominator, else if
  /// "initializeFromSource" is selected then the output video frame rate will
  /// be set equal to the input video frame rate of the first input.
  final String framerateControl;

  /// Framerate denominator.
  final int framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  final int framerateNumerator;

  /// Documentation update needed
  final String gopbReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended
  /// that this be set to 1 so a decoder joining mid-stream will receive an IDR
  /// frame as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int gopClosedCadence;

  /// Number of B-frames between reference frames.
  final int gopNumbFrames;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits. Must be greater than zero.
  final double gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  final String gopSizeUnits;

  /// H.264 Level.
  final String level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  final String lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level For VBR: Set the maximum
  /// bitrate in order to accommodate expected spikes in the complexity of the
  /// video.
  final int maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled. Enforces
  /// separation between repeated (cadence) I-frames and I-frames inserted by
  /// Scene Change Detection. If a scene change I-frame is within I-interval
  /// frames of a cadence I-frame, the GOP is shrunk and/or stretched to the
  /// scene change I-frame. GOP stretch requires enabling lookahead as well as
  /// setting I-interval. The normal cadence resumes for the next GOP. Note:
  /// Maximum GOP stretch = GOP size + Min-I-interval - 1
  final int miniInterval;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int numRefFrames;

  /// This field indicates how the output pixel aspect ratio is specified. If
  /// "specified" is selected then the output video pixel aspect ratio is
  /// determined by parNumerator and parDenominator, else if
  /// "initializeFromSource" is selected then the output pixsel aspect ratio
  /// will be set equal to the input video pixel aspect ratio of the first
  /// input.
  final String parControl;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// H.264 Profile.
  final String profile;

  /// Controls the target quality for the video encode. Applies only when the
  /// rate control mode is QVBR. Set values for the QVBR quality level field and
  /// Max bitrate field that suit your most important viewing devices.
  /// Recommended values are: - Primary screen: Quality level: 8 to 10. Max
  /// bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M -
  /// Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  final int qvbrQualityLevel;

  /// Rate control mode. QVBR: Quality will match the specified quality level
  /// except when it is constrained by the maximum bitrate. Recommended if you
  /// or your viewers pay for bandwidth. VBR: Quality and bitrate vary,
  /// depending on the video complexity. Recommended instead of QVBR if you want
  /// to maintain a specific average bitrate over the duration of the channel.
  /// CBR: Quality varies, depending on the video complexity. Recommended only
  /// if you distribute your assets to devices that cannot handle variable
  /// bitrates.
  final String rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  final String scanType;

  /// Scene change detection. - On: inserts I-frames when scene change is
  /// detected. - Off: does not force an I-frame when scene change is detected.
  final String sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half
  /// the number of macroblock rows for interlaced pictures. This field is
  /// optional; when no value is specified the encoder will choose the number of
  /// slices based on encode resolution.
  final int slices;

  /// Softness. Selects quantizer matrix, larger values reduce high-frequency
  /// content in the encoded image.
  final int softness;

  /// If set to enabled, adjust quantization within each frame based on spatial
  /// variation of content complexity.
  final String spatialAq;

  /// If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to
  /// dynamic, optimize the number of B-frames used for each sub-GOP to improve
  /// visual quality.
  final String subgopLength;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  final String syntax;

  /// If set to enabled, adjust quantization within each frame based on temporal
  /// variation of content complexity.
  final String temporalAq;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass
  /// through picture timing SEI messages from the source specified in Timecode
  /// Config
  final String timecodeInsertion;

  H264Settings({
    this.adaptiveQuantization,
    this.afdSignaling,
    this.bitrate,
    this.bufFillPct,
    this.bufSize,
    this.colorMetadata,
    this.colorSpaceSettings,
    this.entropyEncoding,
    this.fixedAfd,
    this.flickerAq,
    this.framerateControl,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopbReference,
    this.gopClosedCadence,
    this.gopNumbFrames,
    this.gopSize,
    this.gopSizeUnits,
    this.level,
    this.lookAheadRateControl,
    this.maxBitrate,
    this.miniInterval,
    this.numRefFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.profile,
    this.qvbrQualityLevel,
    this.rateControlMode,
    this.scanType,
    this.sceneChangeDetect,
    this.slices,
    this.softness,
    this.spatialAq,
    this.subgopLength,
    this.syntax,
    this.temporalAq,
    this.timecodeInsertion,
  });
  static H264Settings fromJson(Map<String, dynamic> json) => H264Settings(
        adaptiveQuantization: json.containsKey('AdaptiveQuantization')
            ? json['AdaptiveQuantization'] as String
            : null,
        afdSignaling: json.containsKey('AfdSignaling')
            ? json['AfdSignaling'] as String
            : null,
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as int : null,
        bufFillPct:
            json.containsKey('BufFillPct') ? json['BufFillPct'] as int : null,
        bufSize: json.containsKey('BufSize') ? json['BufSize'] as int : null,
        colorMetadata: json.containsKey('ColorMetadata')
            ? json['ColorMetadata'] as String
            : null,
        colorSpaceSettings: json.containsKey('ColorSpaceSettings')
            ? H264ColorSpaceSettings.fromJson(json['ColorSpaceSettings'])
            : null,
        entropyEncoding: json.containsKey('EntropyEncoding')
            ? json['EntropyEncoding'] as String
            : null,
        fixedAfd:
            json.containsKey('FixedAfd') ? json['FixedAfd'] as String : null,
        flickerAq:
            json.containsKey('FlickerAq') ? json['FlickerAq'] as String : null,
        framerateControl: json.containsKey('FramerateControl')
            ? json['FramerateControl'] as String
            : null,
        framerateDenominator: json.containsKey('FramerateDenominator')
            ? json['FramerateDenominator'] as int
            : null,
        framerateNumerator: json.containsKey('FramerateNumerator')
            ? json['FramerateNumerator'] as int
            : null,
        gopbReference: json.containsKey('GopBReference')
            ? json['GopBReference'] as String
            : null,
        gopClosedCadence: json.containsKey('GopClosedCadence')
            ? json['GopClosedCadence'] as int
            : null,
        gopNumbFrames: json.containsKey('GopNumBFrames')
            ? json['GopNumBFrames'] as int
            : null,
        gopSize: json.containsKey('GopSize') ? json['GopSize'] as double : null,
        gopSizeUnits: json.containsKey('GopSizeUnits')
            ? json['GopSizeUnits'] as String
            : null,
        level: json.containsKey('Level') ? json['Level'] as String : null,
        lookAheadRateControl: json.containsKey('LookAheadRateControl')
            ? json['LookAheadRateControl'] as String
            : null,
        maxBitrate:
            json.containsKey('MaxBitrate') ? json['MaxBitrate'] as int : null,
        miniInterval: json.containsKey('MinIInterval')
            ? json['MinIInterval'] as int
            : null,
        numRefFrames: json.containsKey('NumRefFrames')
            ? json['NumRefFrames'] as int
            : null,
        parControl: json.containsKey('ParControl')
            ? json['ParControl'] as String
            : null,
        parDenominator: json.containsKey('ParDenominator')
            ? json['ParDenominator'] as int
            : null,
        parNumerator: json.containsKey('ParNumerator')
            ? json['ParNumerator'] as int
            : null,
        profile: json.containsKey('Profile') ? json['Profile'] as String : null,
        qvbrQualityLevel: json.containsKey('QvbrQualityLevel')
            ? json['QvbrQualityLevel'] as int
            : null,
        rateControlMode: json.containsKey('RateControlMode')
            ? json['RateControlMode'] as String
            : null,
        scanType:
            json.containsKey('ScanType') ? json['ScanType'] as String : null,
        sceneChangeDetect: json.containsKey('SceneChangeDetect')
            ? json['SceneChangeDetect'] as String
            : null,
        slices: json.containsKey('Slices') ? json['Slices'] as int : null,
        softness: json.containsKey('Softness') ? json['Softness'] as int : null,
        spatialAq:
            json.containsKey('SpatialAq') ? json['SpatialAq'] as String : null,
        subgopLength: json.containsKey('SubgopLength')
            ? json['SubgopLength'] as String
            : null,
        syntax: json.containsKey('Syntax') ? json['Syntax'] as String : null,
        temporalAq: json.containsKey('TemporalAq')
            ? json['TemporalAq'] as String
            : null,
        timecodeInsertion: json.containsKey('TimecodeInsertion')
            ? json['TimecodeInsertion'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// H265 Color Space Settings
class H265ColorSpaceSettings {
  final ColorSpacePassthroughSettings colorSpacePassthroughSettings;

  final Hdr10Settings hdr10Settings;

  final Rec601Settings rec601Settings;

  final Rec709Settings rec709Settings;

  H265ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.hdr10Settings,
    this.rec601Settings,
    this.rec709Settings,
  });
  static H265ColorSpaceSettings fromJson(Map<String, dynamic> json) =>
      H265ColorSpaceSettings(
        colorSpacePassthroughSettings:
            json.containsKey('ColorSpacePassthroughSettings')
                ? ColorSpacePassthroughSettings.fromJson(
                    json['ColorSpacePassthroughSettings'])
                : null,
        hdr10Settings: json.containsKey('Hdr10Settings')
            ? Hdr10Settings.fromJson(json['Hdr10Settings'])
            : null,
        rec601Settings: json.containsKey('Rec601Settings')
            ? Rec601Settings.fromJson(json['Rec601Settings'])
            : null,
        rec709Settings: json.containsKey('Rec709Settings')
            ? Rec709Settings.fromJson(json['Rec709Settings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// H265 Settings
class H265Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final String adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream. If
  /// afdSignaling is "auto", the system will try to preserve the input AFD
  /// value (in cases where multiple AFD values are valid). If set to "fixed",
  /// the AFD value will be the value configured in the fixedAfd parameter.
  final String afdSignaling;

  /// Whether or not EML should insert an Alternative Transfer Function SEI
  /// message to support backwards compatibility with non-HDR decoders and
  /// displays.
  final String alternativeTransferFunction;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest
  /// multiple of 1000.
  final int bitrate;

  /// Size of buffer (HRD buffer model) in bits.
  final int bufSize;

  /// Includes colorspace metadata in the output.
  final String colorMetadata;

  /// Color Space settings
  final H265ColorSpaceSettings colorSpaceSettings;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  final String fixedAfd;

  /// If set to enabled, adjust quantization within each frame to reduce flicker
  /// or 'pop' on I-frames.
  final String flickerAq;

  /// Framerate denominator.
  final int framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  final int framerateNumerator;

  /// Frequency of closed GOPs. In streaming applications, it is recommended
  /// that this be set to 1 so a decoder joining mid-stream will receive an IDR
  /// frame as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int gopClosedCadence;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits. Must be greater than zero.
  final double gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  final String gopSizeUnits;

  /// H.265 Level.
  final String level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  final String lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level
  final int maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled. Enforces
  /// separation between repeated (cadence) I-frames and I-frames inserted by
  /// Scene Change Detection. If a scene change I-frame is within I-interval
  /// frames of a cadence I-frame, the GOP is shrunk and/or stretched to the
  /// scene change I-frame. GOP stretch requires enabling lookahead as well as
  /// setting I-interval. The normal cadence resumes for the next GOP. Note:
  /// Maximum GOP stretch = GOP size + Min-I-interval - 1
  final int miniInterval;

  /// Pixel Aspect Ratio denominator.
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int parNumerator;

  /// H.265 Profile.
  final String profile;

  /// Controls the target quality for the video encode. Applies only when the
  /// rate control mode is QVBR. Set values for the QVBR quality level field and
  /// Max bitrate field that suit your most important viewing devices.
  /// Recommended values are: - Primary screen: Quality level: 8 to 10. Max
  /// bitrate: 4M - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M -
  /// Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  final int qvbrQualityLevel;

  /// Rate control mode. QVBR: Quality will match the specified quality level
  /// except when it is constrained by the maximum bitrate. Recommended if you
  /// or your viewers pay for bandwidth. CBR: Quality varies, depending on the
  /// video complexity. Recommended only if you distribute your assets to
  /// devices that cannot handle variable bitrates.
  final String rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  final String scanType;

  /// Scene change detection.
  final String sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half
  /// the number of macroblock rows for interlaced pictures. This field is
  /// optional; when no value is specified the encoder will choose the number of
  /// slices based on encode resolution.
  final int slices;

  /// H.265 Tier.
  final String tier;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream. - 'disabled': Do not include timecodes - 'picTimingSei': Pass
  /// through picture timing SEI messages from the source specified in Timecode
  /// Config
  final String timecodeInsertion;

  H265Settings({
    this.adaptiveQuantization,
    this.afdSignaling,
    this.alternativeTransferFunction,
    this.bitrate,
    this.bufSize,
    this.colorMetadata,
    this.colorSpaceSettings,
    this.fixedAfd,
    this.flickerAq,
    @required this.framerateDenominator,
    @required this.framerateNumerator,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.level,
    this.lookAheadRateControl,
    this.maxBitrate,
    this.miniInterval,
    this.parDenominator,
    this.parNumerator,
    this.profile,
    this.qvbrQualityLevel,
    this.rateControlMode,
    this.scanType,
    this.sceneChangeDetect,
    this.slices,
    this.tier,
    this.timecodeInsertion,
  });
  static H265Settings fromJson(Map<String, dynamic> json) => H265Settings(
        adaptiveQuantization: json.containsKey('AdaptiveQuantization')
            ? json['AdaptiveQuantization'] as String
            : null,
        afdSignaling: json.containsKey('AfdSignaling')
            ? json['AfdSignaling'] as String
            : null,
        alternativeTransferFunction:
            json.containsKey('AlternativeTransferFunction')
                ? json['AlternativeTransferFunction'] as String
                : null,
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as int : null,
        bufSize: json.containsKey('BufSize') ? json['BufSize'] as int : null,
        colorMetadata: json.containsKey('ColorMetadata')
            ? json['ColorMetadata'] as String
            : null,
        colorSpaceSettings: json.containsKey('ColorSpaceSettings')
            ? H265ColorSpaceSettings.fromJson(json['ColorSpaceSettings'])
            : null,
        fixedAfd:
            json.containsKey('FixedAfd') ? json['FixedAfd'] as String : null,
        flickerAq:
            json.containsKey('FlickerAq') ? json['FlickerAq'] as String : null,
        framerateDenominator: json['FramerateDenominator'] as int,
        framerateNumerator: json['FramerateNumerator'] as int,
        gopClosedCadence: json.containsKey('GopClosedCadence')
            ? json['GopClosedCadence'] as int
            : null,
        gopSize: json.containsKey('GopSize') ? json['GopSize'] as double : null,
        gopSizeUnits: json.containsKey('GopSizeUnits')
            ? json['GopSizeUnits'] as String
            : null,
        level: json.containsKey('Level') ? json['Level'] as String : null,
        lookAheadRateControl: json.containsKey('LookAheadRateControl')
            ? json['LookAheadRateControl'] as String
            : null,
        maxBitrate:
            json.containsKey('MaxBitrate') ? json['MaxBitrate'] as int : null,
        miniInterval: json.containsKey('MinIInterval')
            ? json['MinIInterval'] as int
            : null,
        parDenominator: json.containsKey('ParDenominator')
            ? json['ParDenominator'] as int
            : null,
        parNumerator: json.containsKey('ParNumerator')
            ? json['ParNumerator'] as int
            : null,
        profile: json.containsKey('Profile') ? json['Profile'] as String : null,
        qvbrQualityLevel: json.containsKey('QvbrQualityLevel')
            ? json['QvbrQualityLevel'] as int
            : null,
        rateControlMode: json.containsKey('RateControlMode')
            ? json['RateControlMode'] as String
            : null,
        scanType:
            json.containsKey('ScanType') ? json['ScanType'] as String : null,
        sceneChangeDetect: json.containsKey('SceneChangeDetect')
            ? json['SceneChangeDetect'] as String
            : null,
        slices: json.containsKey('Slices') ? json['Slices'] as int : null,
        tier: json.containsKey('Tier') ? json['Tier'] as String : null,
        timecodeInsertion: json.containsKey('TimecodeInsertion')
            ? json['TimecodeInsertion'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hdr10 Settings
class Hdr10Settings {
  /// Maximum Content Light Level An integer metadata value defining the maximum
  /// light level, in nits, of any single pixel within an encoded HDR video
  /// stream or file.
  final int maxCll;

  /// Maximum Frame Average Light Level An integer metadata value defining the
  /// maximum average light level, in nits, for any single frame within an
  /// encoded HDR video stream or file.
  final int maxFall;

  Hdr10Settings({
    this.maxCll,
    this.maxFall,
  });
  static Hdr10Settings fromJson(Map<String, dynamic> json) => Hdr10Settings(
        maxCll: json.containsKey('MaxCll') ? json['MaxCll'] as int : null,
        maxFall: json.containsKey('MaxFall') ? json['MaxFall'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Akamai Settings
class HlsAkamaiSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to Akamai. User
  /// should contact Akamai to enable this feature.
  final String httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put
  /// into an error state.
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int restartDelay;

  /// Salt for authenticated Akamai.
  final String salt;

  /// Token parameter for authenticated akamai. If not specified, _gda_ is used.
  final String token;

  HlsAkamaiSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
    this.salt,
    this.token,
  });
  static HlsAkamaiSettings fromJson(Map<String, dynamic> json) =>
      HlsAkamaiSettings(
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        filecacheDuration: json.containsKey('FilecacheDuration')
            ? json['FilecacheDuration'] as int
            : null,
        httpTransferMode: json.containsKey('HttpTransferMode')
            ? json['HttpTransferMode'] as String
            : null,
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
        salt: json.containsKey('Salt') ? json['Salt'] as String : null,
        token: json.containsKey('Token') ? json['Token'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Basic Put Settings
class HlsBasicPutSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int filecacheDuration;

  /// Number of retry attempts that will be made before the Live Event is put
  /// into an error state.
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int restartDelay;

  HlsBasicPutSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.numRetries,
    this.restartDelay,
  });
  static HlsBasicPutSettings fromJson(Map<String, dynamic> json) =>
      HlsBasicPutSettings(
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        filecacheDuration: json.containsKey('FilecacheDuration')
            ? json['FilecacheDuration'] as int
            : null,
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Cdn Settings
class HlsCdnSettings {
  final HlsAkamaiSettings hlsAkamaiSettings;

  final HlsBasicPutSettings hlsBasicPutSettings;

  final HlsMediaStoreSettings hlsMediaStoreSettings;

  final HlsWebdavSettings hlsWebdavSettings;

  HlsCdnSettings({
    this.hlsAkamaiSettings,
    this.hlsBasicPutSettings,
    this.hlsMediaStoreSettings,
    this.hlsWebdavSettings,
  });
  static HlsCdnSettings fromJson(Map<String, dynamic> json) => HlsCdnSettings(
        hlsAkamaiSettings: json.containsKey('HlsAkamaiSettings')
            ? HlsAkamaiSettings.fromJson(json['HlsAkamaiSettings'])
            : null,
        hlsBasicPutSettings: json.containsKey('HlsBasicPutSettings')
            ? HlsBasicPutSettings.fromJson(json['HlsBasicPutSettings'])
            : null,
        hlsMediaStoreSettings: json.containsKey('HlsMediaStoreSettings')
            ? HlsMediaStoreSettings.fromJson(json['HlsMediaStoreSettings'])
            : null,
        hlsWebdavSettings: json.containsKey('HlsWebdavSettings')
            ? HlsWebdavSettings.fromJson(json['HlsWebdavSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Group Settings
class HlsGroupSettings {
  /// Choose one or more ad marker types to pass SCTE35 signals through to this
  /// group of Apple HLS outputs.
  final List<String> adMarkers;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String baseUrlContent;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String baseUrlManifest;

  /// Mapping of up to 4 caption channels to caption languages. Is only
  /// meaningful if captionLanguageSetting is set to "insert".
  final List<CaptionLanguageMapping> captionLanguageMappings;

  /// Applies only to 608 Embedded output captions. insert: Include
  /// CLOSED-CAPTIONS lines in the manifest. Specify at least one language in
  /// the CC1 Language Code field. One CLOSED-CAPTION line is added for each
  /// Language Code you specify. Make sure to specify the languages in the order
  /// in which they appear in the original source (if the source is embedded
  /// format) or the order of the caption selectors (if the source is other than
  /// embedded). Otherwise, languages in the manifest will not match up properly
  /// with the output captions. none: Include CLOSED-CAPTIONS=NONE line in the
  /// manifest. omit: Omit any CLOSED-CAPTIONS line from the manifest.
  final String captionLanguageSetting;

  /// When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the
  /// manifest, which prevents clients from saving media segments for later
  /// replay.
  final String clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8
  /// playlist generation.
  final String codecSpecification;

  /// For use with encryptionType. This is a 128-bit, 16-byte hex value
  /// represented by a 32-character text string. If ivSource is set to
  /// "explicit" then this parameter is required and is used as the IV for
  /// encryption.
  final String constantIv;

  /// A directory or HTTP destination for the HLS segments, manifest files, and
  /// encryption keys (if enabled).
  final OutputLocationRef destination;

  /// Place segments in subdirectories.
  final String directoryStructure;

  /// Encrypts the segments with the given encryption scheme. Exclude this
  /// parameter if no encryption is desired.
  final String encryptionType;

  /// Parameters that control interactions with the CDN.
  final HlsCdnSettings hlsCdnSettings;

  /// DISABLED: Do not create an I-frame-only manifest, but do create the master
  /// and media manifests (according to the Output Selection field). STANDARD:
  /// Create an I-frame-only manifest for each output that contains video, as
  /// well as the other manifests (according to the Output Selection field). The
  /// I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate it is
  /// I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the
  /// I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888"
  final String iFrameOnlyPlaylists;

  /// Applies only if Mode field is LIVE. Specifies the maximum number of
  /// segments in the media manifest file. After this maximum, older segments
  /// are removed from the media manifest. This number must be less than or
  /// equal to the Keep Segments field.
  final int indexnSegments;

  /// Parameter that control output group behavior on input loss.
  final String inputLossAction;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If set to
  /// "include", IV is listed in the manifest, otherwise the IV is not in the
  /// manifest.
  final String ivInManifest;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If this
  /// setting is "followsSegmentNumber", it will cause the IV to change every
  /// segment (to match the segment number). If this is set to "explicit", you
  /// must enter a constantIv value.
  final String ivSource;

  /// Applies only if Mode field is LIVE. Specifies the number of media segments
  /// (.ts files) to retain in the destination directory.
  final int keepSegments;

  /// The value specifies how the key is represented in the resource identified
  /// by the URI. If parameter is absent, an implicit value of "identity" is
  /// used. A reverse DNS string can also be given.
  final String keyFormat;

  /// Either a single positive integer version value or a slash delimited list
  /// of version values (1/2/3).
  final String keyFormatVersions;

  /// The key provider settings.
  final KeyProviderSettings keyProviderSettings;

  /// When set to gzip, compresses HLS playlist.
  final String manifestCompression;

  /// Indicates whether the output manifest should use floating point or integer
  /// values for segment duration.
  final String manifestDurationFormat;

  /// When set, minimumSegmentLength is enforced by looking ahead and back
  /// within the specified range for a nearby avail and extending the segment
  /// size if needed.
  final int minSegmentLength;

  /// If "vod", all segments are indexed and kept permanently in the destination
  /// and manifest. If "live", only the number segments specified in
  /// keepSegments and indexNSegments are kept; newer segments replace older
  /// segments, which may prevent players from rewinding all the way to the
  /// beginning of the event. VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT
  /// while the channel is running, converting it to a "VOD" type manifest on
  /// completion of the stream.
  final String mode;

  /// MANIFESTSANDSEGMENTS: Generates manifests (master manifest, if applicable,
  /// and media manifests) for this output group. SEGMENTSONLY: Does not
  /// generate any manifests for this output group.
  final String outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestampOffset.
  final String programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  final int programDateTimePeriod;

  /// ENABLED: The master manifest (.m3u8 file) for each pipeline includes
  /// information about both pipelines: first its own media files, then the
  /// media files of the other pipeline. This feature allows playout device that
  /// support stale manifest detection to switch from one manifest to the other,
  /// when the current manifest seems to be stale. There are still two
  /// destinations and two master manifests, but both master manifests reference
  /// the media files from both pipelines. DISABLED: The master manifest (.m3u8
  /// file) for each pipeline includes information about its own pipeline only.
  /// For an HLS output group with MediaPackage as the destination, the DISABLED
  /// behavior is always followed. MediaPackage regenerates the manifests it
  /// serves to players so a redundant manifest from MediaLive is irrelevant.
  final String redundantManifest;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note
  /// that segments will end on the next keyframe after this number of seconds,
  /// so actual segment length may be longer.
  final int segmentLength;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  final String segmentationMode;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be subdirectoryPerStream for this setting to have
  /// an effect.
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

  /// SEGMENTEDFILES: Emit the program as segments - multiple .ts media files.
  /// SINGLEFILE: Applies only if Mode field is VOD. Emit the program as a
  /// single .ts media file. The media manifest includes #EXT-X-BYTERANGE tags
  /// to index segments for playback. A typical use for this value is when
  /// sending the output to AWS Elemental MediaConvert, which can accept only a
  /// single media file. Playback while the channel is running is not guaranteed
  /// due to HTTP server caching.
  final String tsFileMode;

  HlsGroupSettings({
    this.adMarkers,
    this.baseUrlContent,
    this.baseUrlManifest,
    this.captionLanguageMappings,
    this.captionLanguageSetting,
    this.clientCache,
    this.codecSpecification,
    this.constantIv,
    @required this.destination,
    this.directoryStructure,
    this.encryptionType,
    this.hlsCdnSettings,
    this.iFrameOnlyPlaylists,
    this.indexnSegments,
    this.inputLossAction,
    this.ivInManifest,
    this.ivSource,
    this.keepSegments,
    this.keyFormat,
    this.keyFormatVersions,
    this.keyProviderSettings,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minSegmentLength,
    this.mode,
    this.outputSelection,
    this.programDateTime,
    this.programDateTimePeriod,
    this.redundantManifest,
    this.segmentLength,
    this.segmentationMode,
    this.segmentsPerSubdirectory,
    this.streamInfResolution,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
    this.timestampDeltaMilliseconds,
    this.tsFileMode,
  });
  static HlsGroupSettings fromJson(Map<String, dynamic> json) =>
      HlsGroupSettings(
        adMarkers: json.containsKey('AdMarkers')
            ? (json['AdMarkers'] as List).map((e) => e as String).toList()
            : null,
        baseUrlContent: json.containsKey('BaseUrlContent')
            ? json['BaseUrlContent'] as String
            : null,
        baseUrlManifest: json.containsKey('BaseUrlManifest')
            ? json['BaseUrlManifest'] as String
            : null,
        captionLanguageMappings: json.containsKey('CaptionLanguageMappings')
            ? (json['CaptionLanguageMappings'] as List)
                .map((e) => CaptionLanguageMapping.fromJson(e))
                .toList()
            : null,
        captionLanguageSetting: json.containsKey('CaptionLanguageSetting')
            ? json['CaptionLanguageSetting'] as String
            : null,
        clientCache: json.containsKey('ClientCache')
            ? json['ClientCache'] as String
            : null,
        codecSpecification: json.containsKey('CodecSpecification')
            ? json['CodecSpecification'] as String
            : null,
        constantIv: json.containsKey('ConstantIv')
            ? json['ConstantIv'] as String
            : null,
        destination: OutputLocationRef.fromJson(json['Destination']),
        directoryStructure: json.containsKey('DirectoryStructure')
            ? json['DirectoryStructure'] as String
            : null,
        encryptionType: json.containsKey('EncryptionType')
            ? json['EncryptionType'] as String
            : null,
        hlsCdnSettings: json.containsKey('HlsCdnSettings')
            ? HlsCdnSettings.fromJson(json['HlsCdnSettings'])
            : null,
        iFrameOnlyPlaylists: json.containsKey('IFrameOnlyPlaylists')
            ? json['IFrameOnlyPlaylists'] as String
            : null,
        indexnSegments: json.containsKey('IndexNSegments')
            ? json['IndexNSegments'] as int
            : null,
        inputLossAction: json.containsKey('InputLossAction')
            ? json['InputLossAction'] as String
            : null,
        ivInManifest: json.containsKey('IvInManifest')
            ? json['IvInManifest'] as String
            : null,
        ivSource:
            json.containsKey('IvSource') ? json['IvSource'] as String : null,
        keepSegments: json.containsKey('KeepSegments')
            ? json['KeepSegments'] as int
            : null,
        keyFormat:
            json.containsKey('KeyFormat') ? json['KeyFormat'] as String : null,
        keyFormatVersions: json.containsKey('KeyFormatVersions')
            ? json['KeyFormatVersions'] as String
            : null,
        keyProviderSettings: json.containsKey('KeyProviderSettings')
            ? KeyProviderSettings.fromJson(json['KeyProviderSettings'])
            : null,
        manifestCompression: json.containsKey('ManifestCompression')
            ? json['ManifestCompression'] as String
            : null,
        manifestDurationFormat: json.containsKey('ManifestDurationFormat')
            ? json['ManifestDurationFormat'] as String
            : null,
        minSegmentLength: json.containsKey('MinSegmentLength')
            ? json['MinSegmentLength'] as int
            : null,
        mode: json.containsKey('Mode') ? json['Mode'] as String : null,
        outputSelection: json.containsKey('OutputSelection')
            ? json['OutputSelection'] as String
            : null,
        programDateTime: json.containsKey('ProgramDateTime')
            ? json['ProgramDateTime'] as String
            : null,
        programDateTimePeriod: json.containsKey('ProgramDateTimePeriod')
            ? json['ProgramDateTimePeriod'] as int
            : null,
        redundantManifest: json.containsKey('RedundantManifest')
            ? json['RedundantManifest'] as String
            : null,
        segmentLength: json.containsKey('SegmentLength')
            ? json['SegmentLength'] as int
            : null,
        segmentationMode: json.containsKey('SegmentationMode')
            ? json['SegmentationMode'] as String
            : null,
        segmentsPerSubdirectory: json.containsKey('SegmentsPerSubdirectory')
            ? json['SegmentsPerSubdirectory'] as int
            : null,
        streamInfResolution: json.containsKey('StreamInfResolution')
            ? json['StreamInfResolution'] as String
            : null,
        timedMetadataId3Frame: json.containsKey('TimedMetadataId3Frame')
            ? json['TimedMetadataId3Frame'] as String
            : null,
        timedMetadataId3Period: json.containsKey('TimedMetadataId3Period')
            ? json['TimedMetadataId3Period'] as int
            : null,
        timestampDeltaMilliseconds:
            json.containsKey('TimestampDeltaMilliseconds')
                ? json['TimestampDeltaMilliseconds'] as int
                : null,
        tsFileMode: json.containsKey('TsFileMode')
            ? json['TsFileMode'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Input Settings
class HlsInputSettings {
  /// When specified the HLS stream with the m3u8 BANDWIDTH that most closely
  /// matches this value will be chosen, otherwise the highest bandwidth stream
  /// in the m3u8 will be chosen. The bitrate is specified in bits per second,
  /// as in an HLS manifest.
  final int bandwidth;

  /// When specified, reading of the HLS input will begin this many buffer
  /// segments from the end (most recently written segment). When not specified,
  /// the HLS input will begin with the first segment specified in the m3u8.
  final int bufferSegments;

  /// The number of consecutive times that attempts to read a manifest or
  /// segment must fail before the input is considered unavailable.
  final int retries;

  /// The number of seconds between retries when an attempt to read a manifest
  /// or segment fails.
  final int retryInterval;

  HlsInputSettings({
    this.bandwidth,
    this.bufferSegments,
    this.retries,
    this.retryInterval,
  });
  static HlsInputSettings fromJson(Map<String, dynamic> json) =>
      HlsInputSettings(
        bandwidth:
            json.containsKey('Bandwidth') ? json['Bandwidth'] as int : null,
        bufferSegments: json.containsKey('BufferSegments')
            ? json['BufferSegments'] as int
            : null,
        retries: json.containsKey('Retries') ? json['Retries'] as int : null,
        retryInterval: json.containsKey('RetryInterval')
            ? json['RetryInterval'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Media Store Settings
class HlsMediaStoreSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int filecacheDuration;

  /// When set to temporal, output files are stored in non-persistent memory for
  /// faster reading and writing.
  final String mediaStoreStorageClass;

  /// Number of retry attempts that will be made before the Live Event is put
  /// into an error state.
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int restartDelay;

  HlsMediaStoreSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.mediaStoreStorageClass,
    this.numRetries,
    this.restartDelay,
  });
  static HlsMediaStoreSettings fromJson(Map<String, dynamic> json) =>
      HlsMediaStoreSettings(
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        filecacheDuration: json.containsKey('FilecacheDuration')
            ? json['FilecacheDuration'] as int
            : null,
        mediaStoreStorageClass: json.containsKey('MediaStoreStorageClass')
            ? json['MediaStoreStorageClass'] as String
            : null,
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Output Settings
class HlsOutputSettings {
  /// Settings regarding the underlying stream. These settings are different for
  /// audio-only outputs.
  final HlsSettings hlsSettings;

  /// String concatenated to the end of the destination filename. Accepts
  /// "Format Identifiers":#formatIdentifierParameters.
  final String nameModifier;

  /// String concatenated to end of segment filenames.
  final String segmentModifier;

  HlsOutputSettings({
    @required this.hlsSettings,
    this.nameModifier,
    this.segmentModifier,
  });
  static HlsOutputSettings fromJson(Map<String, dynamic> json) =>
      HlsOutputSettings(
        hlsSettings: HlsSettings.fromJson(json['HlsSettings']),
        nameModifier: json.containsKey('NameModifier')
            ? json['NameModifier'] as String
            : null,
        segmentModifier: json.containsKey('SegmentModifier')
            ? json['SegmentModifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Settings
class HlsSettings {
  final AudioOnlyHlsSettings audioOnlyHlsSettings;

  final StandardHlsSettings standardHlsSettings;

  HlsSettings({
    this.audioOnlyHlsSettings,
    this.standardHlsSettings,
  });
  static HlsSettings fromJson(Map<String, dynamic> json) => HlsSettings(
        audioOnlyHlsSettings: json.containsKey('AudioOnlyHlsSettings')
            ? AudioOnlyHlsSettings.fromJson(json['AudioOnlyHlsSettings'])
            : null,
        standardHlsSettings: json.containsKey('StandardHlsSettings')
            ? StandardHlsSettings.fromJson(json['StandardHlsSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for the action to emit HLS metadata
class HlsTimedMetadataScheduleActionSettings {
  /// Base64 string formatted according to the ID3 specification:
  /// http://id3.org/id3v2.4.0-structure
  final String id3;

  HlsTimedMetadataScheduleActionSettings({
    @required this.id3,
  });
  static HlsTimedMetadataScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      HlsTimedMetadataScheduleActionSettings(
        id3: json['Id3'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Hls Webdav Settings
class HlsWebdavSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to WebDAV.
  final String httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put
  /// into an error state.
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int restartDelay;

  HlsWebdavSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
  });
  static HlsWebdavSettings fromJson(Map<String, dynamic> json) =>
      HlsWebdavSettings(
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        filecacheDuration: json.containsKey('FilecacheDuration')
            ? json['FilecacheDuration'] as int
            : null,
        httpTransferMode: json.containsKey('HttpTransferMode')
            ? json['HttpTransferMode'] as String
            : null,
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings to configure an action so that it occurs immediately. This is only
/// supported for input switch actions currently.
class ImmediateModeScheduleActionStartSettings {
  ImmediateModeScheduleActionStartSettings();
  static ImmediateModeScheduleActionStartSettings fromJson(
          Map<String, dynamic> json) =>
      ImmediateModeScheduleActionStartSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for Input
class Input {
  /// The Unique ARN of the input (generated, immutable).
  final String arn;

  /// A list of channel IDs that that input is attached to (currently an input
  /// can only be attached to one channel).
  final List<String> attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  final List<InputDestination> destinations;

  /// The generated ID of the input (unique for user account, immutable).
  final String id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the
  /// channel is SINGLE_PIPELINE, only the first source will be ingested; the
  /// second source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  final String inputClass;

  /// Certain pull input sources can be dynamic, meaning that they can have
  /// their URL's dynamically changes during input switch actions. Presently,
  /// this functionality only works with MP4_FILE inputs.
  final String inputSourceType;

  /// A list of MediaConnect Flows for this input.
  final List<MediaConnectFlow> mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  final String name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  final String roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  final List<String> securityGroups;

  /// A list of the sources of the input (PULL-type).
  final List<InputSource> sources;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  final String type;

  Input({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputSourceType,
    this.mediaConnectFlows,
    this.name,
    this.roleArn,
    this.securityGroups,
    this.sources,
    this.state,
    this.tags,
    this.type,
  });
  static Input fromJson(Map<String, dynamic> json) => Input(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        attachedChannels: json.containsKey('AttachedChannels')
            ? (json['AttachedChannels'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => InputDestination.fromJson(e))
                .toList()
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputClass: json.containsKey('InputClass')
            ? json['InputClass'] as String
            : null,
        inputSourceType: json.containsKey('InputSourceType')
            ? json['InputSourceType'] as String
            : null,
        mediaConnectFlows: json.containsKey('MediaConnectFlows')
            ? (json['MediaConnectFlows'] as List)
                .map((e) => MediaConnectFlow.fromJson(e))
                .toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List).map((e) => e as String).toList()
            : null,
        sources: json.containsKey('Sources')
            ? (json['Sources'] as List)
                .map((e) => InputSource.fromJson(e))
                .toList()
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
}

/// Placeholder documentation for InputAttachment
class InputAttachment {
  /// User-specified name for the attachment. This is required if the user wants
  /// to use this input in an input switch action.
  final String inputAttachmentName;

  /// The ID of the input
  final String inputId;

  /// Settings of an input (caption selector, etc.)
  final InputSettings inputSettings;

  InputAttachment({
    this.inputAttachmentName,
    this.inputId,
    this.inputSettings,
  });
  static InputAttachment fromJson(Map<String, dynamic> json) => InputAttachment(
        inputAttachmentName: json.containsKey('InputAttachmentName')
            ? json['InputAttachmentName'] as String
            : null,
        inputId: json.containsKey('InputId') ? json['InputId'] as String : null,
        inputSettings: json.containsKey('InputSettings')
            ? InputSettings.fromJson(json['InputSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Input Channel Level
class InputChannelLevel {
  /// Remixing value. Units are in dB and acceptable values are within the range
  /// from -60 (mute) and 6 dB.
  final int gain;

  /// The index of the input channel used as a source.
  final int inputChannel;

  InputChannelLevel({
    @required this.gain,
    @required this.inputChannel,
  });
  static InputChannelLevel fromJson(Map<String, dynamic> json) =>
      InputChannelLevel(
        gain: json['Gain'] as int,
        inputChannel: json['InputChannel'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings to let you create a clip of the file input, in order to set up the
/// input to ingest only a portion of the file.
class InputClippingSettings {
  /// The source of the timecodes in the source being clipped.
  final String inputTimecodeSource;

  /// Settings to identify the start of the clip.
  final StartTimecode startTimecode;

  /// Settings to identify the end of the clip.
  final StopTimecode stopTimecode;

  InputClippingSettings({
    @required this.inputTimecodeSource,
    this.startTimecode,
    this.stopTimecode,
  });
  static InputClippingSettings fromJson(Map<String, dynamic> json) =>
      InputClippingSettings(
        inputTimecodeSource: json['InputTimecodeSource'] as String,
        startTimecode: json.containsKey('StartTimecode')
            ? StartTimecode.fromJson(json['StartTimecode'])
            : null,
        stopTimecode: json.containsKey('StopTimecode')
            ? StopTimecode.fromJson(json['StopTimecode'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The settings for a PUSH type input.
class InputDestination {
  /// The system-generated static IP address of endpoint. It remains fixed for
  /// the lifetime of the input.
  final String ip;

  /// The port number for the input.
  final String port;

  /// This represents the endpoint that the customer stream will be pushed to.
  final String url;

  final InputDestinationVpc vpc;

  InputDestination({
    this.ip,
    this.port,
    this.url,
    this.vpc,
  });
  static InputDestination fromJson(Map<String, dynamic> json) =>
      InputDestination(
        ip: json.containsKey('Ip') ? json['Ip'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as String : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        vpc: json.containsKey('Vpc')
            ? InputDestinationVpc.fromJson(json['Vpc'])
            : null,
      );
}

/// Endpoint settings for a PUSH type input.
class InputDestinationRequest {
  /// A unique name for the location the RTMP stream is being pushed to.
  final String streamName;

  InputDestinationRequest({
    this.streamName,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The properties for a VPC type input destination.
class InputDestinationVpc {
  /// The availability zone of the Input destination.
  final String availabilityZone;

  /// The network interface ID of the Input destination in the VPC.
  final String networkInterfaceId;

  InputDestinationVpc({
    this.availabilityZone,
    this.networkInterfaceId,
  });
  static InputDestinationVpc fromJson(Map<String, dynamic> json) =>
      InputDestinationVpc(
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
      );
}

/// Input Location
class InputLocation {
  /// key used to extract the password from EC2 Parameter store
  final String passwordParam;

  /// Uniform Resource Identifier - This should be a path to a file accessible
  /// to the Live system (eg. a http:// URI) depending on the output type. For
  /// example, a RTMP destination should have a uri simliar to:
  /// "rtmp://fmsserver/live".
  final String uri;

  /// Documentation update needed
  final String username;

  InputLocation({
    this.passwordParam,
    @required this.uri,
    this.username,
  });
  static InputLocation fromJson(Map<String, dynamic> json) => InputLocation(
        passwordParam: json.containsKey('PasswordParam')
            ? json['PasswordParam'] as String
            : null,
        uri: json['Uri'] as String,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Input Loss Behavior
class InputLossBehavior {
  /// Documentation update needed
  final int blackFrameMsec;

  /// When input loss image type is "color" this field specifies the color to
  /// use. Value: 6 hex characters representing the values of RGB.
  final String inputLossImageColor;

  /// When input loss image type is "slate" these fields specify the parameters
  /// for accessing the slate.
  final InputLocation inputLossImageSlate;

  /// Indicates whether to substitute a solid color or a slate into the output
  /// after input loss exceeds blackFrameMsec.
  final String inputLossImageType;

  /// Documentation update needed
  final int repeatFrameMsec;

  InputLossBehavior({
    this.blackFrameMsec,
    this.inputLossImageColor,
    this.inputLossImageSlate,
    this.inputLossImageType,
    this.repeatFrameMsec,
  });
  static InputLossBehavior fromJson(Map<String, dynamic> json) =>
      InputLossBehavior(
        blackFrameMsec: json.containsKey('BlackFrameMsec')
            ? json['BlackFrameMsec'] as int
            : null,
        inputLossImageColor: json.containsKey('InputLossImageColor')
            ? json['InputLossImageColor'] as String
            : null,
        inputLossImageSlate: json.containsKey('InputLossImageSlate')
            ? InputLocation.fromJson(json['InputLossImageSlate'])
            : null,
        inputLossImageType: json.containsKey('InputLossImageType')
            ? json['InputLossImageType'] as String
            : null,
        repeatFrameMsec: json.containsKey('RepeatFrameMsec')
            ? json['RepeatFrameMsec'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An Input Security Group
class InputSecurityGroup {
  /// Unique ARN of Input Security Group
  final String arn;

  /// The Id of the Input Security Group
  final String id;

  /// The list of inputs currently using this Input Security Group.
  final List<String> inputs;

  /// The current state of the Input Security Group.
  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  /// Whitelist rules and their sync status
  final List<InputWhitelistRule> whitelistRules;

  InputSecurityGroup({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });
  static InputSecurityGroup fromJson(Map<String, dynamic> json) =>
      InputSecurityGroup(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputs: json.containsKey('Inputs')
            ? (json['Inputs'] as List).map((e) => e as String).toList()
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        whitelistRules: json.containsKey('WhitelistRules')
            ? (json['WhitelistRules'] as List)
                .map((e) => InputWhitelistRule.fromJson(e))
                .toList()
            : null,
      );
}

/// Live Event input parameters. There can be multiple inputs in a single Live
/// Event.
class InputSettings {
  /// Used to select the audio stream to decode for inputs that have multiple
  /// available.
  final List<AudioSelector> audioSelectors;

  /// Used to select the caption input to use for inputs that have multiple
  /// available.
  final List<CaptionSelector> captionSelectors;

  /// Enable or disable the deblock filter when filtering.
  final String deblockFilter;

  /// Enable or disable the denoise filter when filtering.
  final String denoiseFilter;

  /// Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).
  final int filterStrength;

  /// Turns on the filter for this input. MPEG-2 inputs have the deblocking
  /// filter enabled by default. 1) auto - filtering will be applied depending
  /// on input type/quality 2) disabled - no filtering will be applied to the
  /// input 3) forced - filtering will be applied regardless of input type
  final String inputFilter;

  /// Input settings.
  final NetworkInputSettings networkInputSettings;

  /// Loop input if it is a file. This allows a file input to be streamed
  /// indefinitely.
  final String sourceEndBehavior;

  /// Informs which video elementary stream to decode for input types that have
  /// multiple available.
  final VideoSelector videoSelector;

  InputSettings({
    this.audioSelectors,
    this.captionSelectors,
    this.deblockFilter,
    this.denoiseFilter,
    this.filterStrength,
    this.inputFilter,
    this.networkInputSettings,
    this.sourceEndBehavior,
    this.videoSelector,
  });
  static InputSettings fromJson(Map<String, dynamic> json) => InputSettings(
        audioSelectors: json.containsKey('AudioSelectors')
            ? (json['AudioSelectors'] as List)
                .map((e) => AudioSelector.fromJson(e))
                .toList()
            : null,
        captionSelectors: json.containsKey('CaptionSelectors')
            ? (json['CaptionSelectors'] as List)
                .map((e) => CaptionSelector.fromJson(e))
                .toList()
            : null,
        deblockFilter: json.containsKey('DeblockFilter')
            ? json['DeblockFilter'] as String
            : null,
        denoiseFilter: json.containsKey('DenoiseFilter')
            ? json['DenoiseFilter'] as String
            : null,
        filterStrength: json.containsKey('FilterStrength')
            ? json['FilterStrength'] as int
            : null,
        inputFilter: json.containsKey('InputFilter')
            ? json['InputFilter'] as String
            : null,
        networkInputSettings: json.containsKey('NetworkInputSettings')
            ? NetworkInputSettings.fromJson(json['NetworkInputSettings'])
            : null,
        sourceEndBehavior: json.containsKey('SourceEndBehavior')
            ? json['SourceEndBehavior'] as String
            : null,
        videoSelector: json.containsKey('VideoSelector')
            ? VideoSelector.fromJson(json['VideoSelector'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The settings for a PULL type input.
class InputSource {
  /// The key used to extract the password from EC2 Parameter store.
  final String passwordParam;

  /// This represents the customer's source URL where stream is pulled from.
  final String url;

  /// The username for the input source.
  final String username;

  InputSource({
    this.passwordParam,
    this.url,
    this.username,
  });
  static InputSource fromJson(Map<String, dynamic> json) => InputSource(
        passwordParam: json.containsKey('PasswordParam')
            ? json['PasswordParam'] as String
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
      );
}

/// Settings for for a PULL type input.
class InputSourceRequest {
  /// The key used to extract the password from EC2 Parameter store.
  final String passwordParam;

  /// This represents the customer's source URL where stream is pulled from.
  final String url;

  /// The username for the input source.
  final String username;

  InputSourceRequest({
    this.passwordParam,
    this.url,
    this.username,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for InputSpecification
class InputSpecification {
  /// Input codec
  final String codec;

  /// Maximum input bitrate, categorized coarsely
  final String maximumBitrate;

  /// Input resolution, categorized coarsely
  final String resolution;

  InputSpecification({
    this.codec,
    this.maximumBitrate,
    this.resolution,
  });
  static InputSpecification fromJson(Map<String, dynamic> json) =>
      InputSpecification(
        codec: json.containsKey('Codec') ? json['Codec'] as String : null,
        maximumBitrate: json.containsKey('MaximumBitrate')
            ? json['MaximumBitrate'] as String
            : null,
        resolution: json.containsKey('Resolution')
            ? json['Resolution'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for the "switch input" action: to switch from ingesting one input
/// to ingesting another input.
class InputSwitchScheduleActionSettings {
  /// The name of the input attachment (not the name of the input!) to switch
  /// to. The name is specified in the channel configuration.
  final String inputAttachmentNameReference;

  /// Settings to let you create a clip of the file input, in order to set up
  /// the input to ingest only a portion of the file.
  final InputClippingSettings inputClippingSettings;

  /// The value for the variable portion of the URL for the dynamic input, for
  /// this instance of the input. Each time you use the same dynamic input in an
  /// input switch action, you can provide a different value, in order to
  /// connect the input to a different content source.
  final List<String> urlPath;

  InputSwitchScheduleActionSettings({
    @required this.inputAttachmentNameReference,
    this.inputClippingSettings,
    this.urlPath,
  });
  static InputSwitchScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      InputSwitchScheduleActionSettings(
        inputAttachmentNameReference:
            json['InputAttachmentNameReference'] as String,
        inputClippingSettings: json.containsKey('InputClippingSettings')
            ? InputClippingSettings.fromJson(json['InputClippingSettings'])
            : null,
        urlPath: json.containsKey('UrlPath')
            ? (json['UrlPath'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for a private VPC Input. When this property is specified, the input
/// destination addresses will be created in a VPC rather than with public
/// Internet addresses. This property requires setting the roleArn property on
/// Input creation. Not compatible with the inputSecurityGroups property.
class InputVpcRequest {
  /// A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC
  /// network interfaces. Requires subnetIds. If none are specified then the VPC
  /// default security group will be used.
  final List<String> securityGroupIds;

  /// A list of 2 VPC subnet IDs from the same VPC. Subnet IDs must be mapped to
  /// two unique availability zones (AZ).
  final List<String> subnetIds;

  InputVpcRequest({
    this.securityGroupIds,
    @required this.subnetIds,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Whitelist rule
class InputWhitelistRule {
  /// The IPv4 CIDR that's whitelisted.
  final String cidr;

  InputWhitelistRule({
    this.cidr,
  });
  static InputWhitelistRule fromJson(Map<String, dynamic> json) =>
      InputWhitelistRule(
        cidr: json.containsKey('Cidr') ? json['Cidr'] as String : null,
      );
}

/// An IPv4 CIDR to whitelist.
class InputWhitelistRuleCidr {
  /// The IPv4 CIDR to whitelist.
  final String cidr;

  InputWhitelistRuleCidr({
    this.cidr,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Key Provider Settings
class KeyProviderSettings {
  final StaticKeySettings staticKeySettings;

  KeyProviderSettings({
    this.staticKeySettings,
  });
  static KeyProviderSettings fromJson(Map<String, dynamic> json) =>
      KeyProviderSettings(
        staticKeySettings: json.containsKey('StaticKeySettings')
            ? StaticKeySettings.fromJson(json['StaticKeySettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for ListChannelsResponse
class ListChannelsResponse {
  final List<ChannelSummary> channels;

  final String nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });
  static ListChannelsResponse fromJson(Map<String, dynamic> json) =>
      ListChannelsResponse(
        channels: json.containsKey('Channels')
            ? (json['Channels'] as List)
                .map((e) => ChannelSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Placeholder documentation for ListInputSecurityGroupsResponse
class ListInputSecurityGroupsResponse {
  /// List of input security groups
  final List<InputSecurityGroup> inputSecurityGroups;

  final String nextToken;

  ListInputSecurityGroupsResponse({
    this.inputSecurityGroups,
    this.nextToken,
  });
  static ListInputSecurityGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListInputSecurityGroupsResponse(
        inputSecurityGroups: json.containsKey('InputSecurityGroups')
            ? (json['InputSecurityGroups'] as List)
                .map((e) => InputSecurityGroup.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Placeholder documentation for ListInputsResponse
class ListInputsResponse {
  final List<Input> inputs;

  final String nextToken;

  ListInputsResponse({
    this.inputs,
    this.nextToken,
  });
  static ListInputsResponse fromJson(Map<String, dynamic> json) =>
      ListInputsResponse(
        inputs: json.containsKey('Inputs')
            ? (json['Inputs'] as List).map((e) => Input.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Placeholder documentation for ListOfferingsResponse
class ListOfferingsResponse {
  /// Token to retrieve the next page of results
  final String nextToken;

  /// List of offerings
  final List<Offering> offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });
  static ListOfferingsResponse fromJson(Map<String, dynamic> json) =>
      ListOfferingsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        offerings: json.containsKey('Offerings')
            ? (json['Offerings'] as List)
                .map((e) => Offering.fromJson(e))
                .toList()
            : null,
      );
}

/// Placeholder documentation for ListReservationsResponse
class ListReservationsResponse {
  /// Token to retrieve the next page of results
  final String nextToken;

  /// List of reservations
  final List<Reservation> reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });
  static ListReservationsResponse fromJson(Map<String, dynamic> json) =>
      ListReservationsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        reservations: json.containsKey('Reservations')
            ? (json['Reservations'] as List)
                .map((e) => Reservation.fromJson(e))
                .toList()
            : null,
      );
}

/// Placeholder documentation for ListTagsForResourceResponse
class ListTagsForResourceResponse {
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// M2ts Settings
class M2TsSettings {
  /// When set to drop, output audio streams will be removed from the program if
  /// the selected input audio stream is removed from the input. This allows the
  /// output audio configuration to dynamically change based on input
  /// configuration. If this is set to encodeSilence, all output audio streams
  /// will output encoded silence when not connected to an active input stream.
  final String absentInputAudioBehavior;

  /// When set to enabled, uses ARIB-compliant field muxing and removes video
  /// descriptor.
  final String arib;

  /// Packet Identifier (PID) for ARIB Captions in the transport stream. Can be
  /// entered as a decimal or hexadecimal value. Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String aribCaptionsPid;

  /// If set to auto, pid number used for ARIB Captions will be auto-selected
  /// from unused pids. If set to useConfigured, ARIB Captions will be on the
  /// configured pid number.
  final String aribCaptionsPidControl;

  /// When set to dvb, uses DVB buffer model for Dolby Digital audio. When set
  /// to atsc, the ATSC model is used.
  final String audioBufferModel;

  /// The number of audio frames to insert for each PES packet.
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or
  /// by comma separation. Can be entered as decimal or hexadecimal values. Each
  /// PID specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String audioPids;

  /// When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87
  /// for EAC3. When set to dvb, uses stream type = 0x06.
  final String audioStreamType;

  /// The output bitrate of the transport stream in bits per second. Setting to
  /// 0 lets the muxer automatically determine the appropriate bitrate.
  final int bitrate;

  /// If set to multiplex, use multiplex buffer model for accurate interleaving.
  /// Setting to bufferModel to none can lead to lower latency, but low-memory
  /// devices may not be able to play back the stream without interruptions.
  final String bufferModel;

  /// When set to enabled, generates captionServiceDescriptor in PMT.
  final String ccDescriptor;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  final DvbNitSettings dvbNitSettings;

  /// Inserts DVB Service Description Table (SDT) at the specified table
  /// repetition interval.
  final DvbSdtSettings dvbSdtSettings;

  /// Packet Identifier (PID) for input source DVB Subtitle data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values. Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  final DvbTdtSettings dvbTdtSettings;

  /// Packet Identifier (PID) for input source DVB Teletext data to this output.
  /// Can be entered as a decimal or hexadecimal value. Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String dvbTeletextPid;

  /// If set to passthrough, passes any EBIF data from the input source to this
  /// output.
  final String ebif;

  /// When videoAndFixedIntervals is selected, audio EBP markers will be added
  /// to partitions 3 and 4. The interval between these additional markers will
  /// be fixed, and will be slightly shorter than the video EBP marker interval.
  /// Only available when EBP Cablelabs segmentation markers are selected.
  /// Partitions 1 and 2 will always follow the video interval.
  final String ebpAudioInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker. The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make
  /// the lookahead accurate.
  final int ebpLookaheadMs;

  /// Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP
  /// markers will be placed on the video PID and all audio PIDs. If set to
  /// videoPid, EBP markers will be placed on only the video PID.
  final String ebpPlacement;

  /// This field is unused and deprecated.
  final String ecmPid;

  /// Include or exclude the ES Rate field in the PES header.
  final String esRateInPes;

  /// Packet Identifier (PID) for input source ETV Platform data to this output.
  /// Can be entered as a decimal or hexadecimal value. Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String etvPlatformPid;

  /// Packet Identifier (PID) for input source ETV Signal data to this output.
  /// Can be entered as a decimal or hexadecimal value. Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String etvSignalPid;

  /// The length in seconds of each fragment. Only used with EBP markers.
  final double fragmentTime;

  /// If set to passthrough, passes any KLV data from the input source to this
  /// output.
  final String klv;

  /// Packet Identifier (PID) for input source KLV data to this output. Multiple
  /// values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values. Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String klvDataPids;

  /// Value in bits per second of extra null packets to insert into the
  /// transport stream. This can be used if a downstream encryption system
  /// requires periodic null packets.
  final double nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. Valid values are 0, 10..1000.
  final int patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio
  /// elementary stream.
  final String pcrControl;

  /// Maximum time in milliseconds between Program Clock Reference (PCRs)
  /// inserted into the transport stream.
  final int pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  /// Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
  final String pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. Valid values are 0, 10..1000.
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String pmtPid;

  /// The value of the program number field in the Program Map Table.
  final int programNum;

  /// When vbr, does not insert null packets into transport stream to fill
  /// specified bitrate. The bitrate setting acts as the maximum bitrate when
  /// vbr is set.
  final String rateMode;

  /// Packet Identifier (PID) for input source SCTE-27 data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values. Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String scte27Pids;

  /// Optionally pass SCTE-35 signals from the input source to this output.
  final String scte35Control;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value. Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String scte35Pid;

  /// Inserts segmentation markers at each segmentationTime period. raiSegstart
  /// sets the Random Access Indicator bit in the adaptation field. raiAdapt
  /// sets the RAI bit and adds the current timecode in the private data bytes.
  /// psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds
  /// Encoder Boundary Point information to the adaptation field as per
  /// OpenCable specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder
  /// Boundary Point information to the adaptation field using a legacy
  /// proprietary format.
  final String segmentationMarkers;

  /// The segmentation style parameter controls how segmentation markers are
  /// inserted into the transport stream. With avails, it is possible that
  /// segments may be truncated, which can influence where future segmentation
  /// markers are inserted. When a segmentation style of "resetCadence" is
  /// selected and a segment is truncated due to an avail, we will reset the
  /// segmentation cadence. This means the subsequent segment will have a
  /// duration of $segmentationTime seconds. When a segmentation style of
  /// "maintainCadence" is selected and a segment is truncated due to an avail,
  /// we will not reset the segmentation cadence. This means the subsequent
  /// segment will likely be truncated as well. However, all segments after that
  /// will have a duration of $segmentationTime seconds. Note that EBP lookahead
  /// is a slight exception to this rule.
  final String segmentationStyle;

  /// The length in seconds of each segment. Required unless markers is set to
  /// None_.
  final double segmentationTime;

  /// When set to passthrough, timed metadata will be passed through from input
  /// to output.
  final String timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String videoPid;

  M2TsSettings({
    this.absentInputAudioBehavior,
    this.arib,
    this.aribCaptionsPid,
    this.aribCaptionsPidControl,
    this.audioBufferModel,
    this.audioFramesPerPes,
    this.audioPids,
    this.audioStreamType,
    this.bitrate,
    this.bufferModel,
    this.ccDescriptor,
    this.dvbNitSettings,
    this.dvbSdtSettings,
    this.dvbSubPids,
    this.dvbTdtSettings,
    this.dvbTeletextPid,
    this.ebif,
    this.ebpAudioInterval,
    this.ebpLookaheadMs,
    this.ebpPlacement,
    this.ecmPid,
    this.esRateInPes,
    this.etvPlatformPid,
    this.etvSignalPid,
    this.fragmentTime,
    this.klv,
    this.klvDataPids,
    this.nullPacketBitrate,
    this.patInterval,
    this.pcrControl,
    this.pcrPeriod,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.programNum,
    this.rateMode,
    this.scte27Pids,
    this.scte35Control,
    this.scte35Pid,
    this.segmentationMarkers,
    this.segmentationStyle,
    this.segmentationTime,
    this.timedMetadataBehavior,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  static M2TsSettings fromJson(Map<String, dynamic> json) => M2TsSettings(
        absentInputAudioBehavior: json.containsKey('AbsentInputAudioBehavior')
            ? json['AbsentInputAudioBehavior'] as String
            : null,
        arib: json.containsKey('Arib') ? json['Arib'] as String : null,
        aribCaptionsPid: json.containsKey('AribCaptionsPid')
            ? json['AribCaptionsPid'] as String
            : null,
        aribCaptionsPidControl: json.containsKey('AribCaptionsPidControl')
            ? json['AribCaptionsPidControl'] as String
            : null,
        audioBufferModel: json.containsKey('AudioBufferModel')
            ? json['AudioBufferModel'] as String
            : null,
        audioFramesPerPes: json.containsKey('AudioFramesPerPes')
            ? json['AudioFramesPerPes'] as int
            : null,
        audioPids:
            json.containsKey('AudioPids') ? json['AudioPids'] as String : null,
        audioStreamType: json.containsKey('AudioStreamType')
            ? json['AudioStreamType'] as String
            : null,
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as int : null,
        bufferModel: json.containsKey('BufferModel')
            ? json['BufferModel'] as String
            : null,
        ccDescriptor: json.containsKey('CcDescriptor')
            ? json['CcDescriptor'] as String
            : null,
        dvbNitSettings: json.containsKey('DvbNitSettings')
            ? DvbNitSettings.fromJson(json['DvbNitSettings'])
            : null,
        dvbSdtSettings: json.containsKey('DvbSdtSettings')
            ? DvbSdtSettings.fromJson(json['DvbSdtSettings'])
            : null,
        dvbSubPids: json.containsKey('DvbSubPids')
            ? json['DvbSubPids'] as String
            : null,
        dvbTdtSettings: json.containsKey('DvbTdtSettings')
            ? DvbTdtSettings.fromJson(json['DvbTdtSettings'])
            : null,
        dvbTeletextPid: json.containsKey('DvbTeletextPid')
            ? json['DvbTeletextPid'] as String
            : null,
        ebif: json.containsKey('Ebif') ? json['Ebif'] as String : null,
        ebpAudioInterval: json.containsKey('EbpAudioInterval')
            ? json['EbpAudioInterval'] as String
            : null,
        ebpLookaheadMs: json.containsKey('EbpLookaheadMs')
            ? json['EbpLookaheadMs'] as int
            : null,
        ebpPlacement: json.containsKey('EbpPlacement')
            ? json['EbpPlacement'] as String
            : null,
        ecmPid: json.containsKey('EcmPid') ? json['EcmPid'] as String : null,
        esRateInPes: json.containsKey('EsRateInPes')
            ? json['EsRateInPes'] as String
            : null,
        etvPlatformPid: json.containsKey('EtvPlatformPid')
            ? json['EtvPlatformPid'] as String
            : null,
        etvSignalPid: json.containsKey('EtvSignalPid')
            ? json['EtvSignalPid'] as String
            : null,
        fragmentTime: json.containsKey('FragmentTime')
            ? json['FragmentTime'] as double
            : null,
        klv: json.containsKey('Klv') ? json['Klv'] as String : null,
        klvDataPids: json.containsKey('KlvDataPids')
            ? json['KlvDataPids'] as String
            : null,
        nullPacketBitrate: json.containsKey('NullPacketBitrate')
            ? json['NullPacketBitrate'] as double
            : null,
        patInterval:
            json.containsKey('PatInterval') ? json['PatInterval'] as int : null,
        pcrControl: json.containsKey('PcrControl')
            ? json['PcrControl'] as String
            : null,
        pcrPeriod:
            json.containsKey('PcrPeriod') ? json['PcrPeriod'] as int : null,
        pcrPid: json.containsKey('PcrPid') ? json['PcrPid'] as String : null,
        pmtInterval:
            json.containsKey('PmtInterval') ? json['PmtInterval'] as int : null,
        pmtPid: json.containsKey('PmtPid') ? json['PmtPid'] as String : null,
        programNum:
            json.containsKey('ProgramNum') ? json['ProgramNum'] as int : null,
        rateMode:
            json.containsKey('RateMode') ? json['RateMode'] as String : null,
        scte27Pids: json.containsKey('Scte27Pids')
            ? json['Scte27Pids'] as String
            : null,
        scte35Control: json.containsKey('Scte35Control')
            ? json['Scte35Control'] as String
            : null,
        scte35Pid:
            json.containsKey('Scte35Pid') ? json['Scte35Pid'] as String : null,
        segmentationMarkers: json.containsKey('SegmentationMarkers')
            ? json['SegmentationMarkers'] as String
            : null,
        segmentationStyle: json.containsKey('SegmentationStyle')
            ? json['SegmentationStyle'] as String
            : null,
        segmentationTime: json.containsKey('SegmentationTime')
            ? json['SegmentationTime'] as double
            : null,
        timedMetadataBehavior: json.containsKey('TimedMetadataBehavior')
            ? json['TimedMetadataBehavior'] as String
            : null,
        timedMetadataPid: json.containsKey('TimedMetadataPid')
            ? json['TimedMetadataPid'] as String
            : null,
        transportStreamId: json.containsKey('TransportStreamId')
            ? json['TransportStreamId'] as int
            : null,
        videoPid:
            json.containsKey('VideoPid') ? json['VideoPid'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings information for the .m3u8 container
class M3U8Settings {
  /// The number of audio frames to insert for each PES packet.
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or
  /// by comma separation. Can be entered as decimal or hexadecimal values.
  final String audioPids;

  /// This parameter is unused and deprecated.
  final String ecmPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of "0" writes out the PMT once per segment file.
  final int patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio
  /// elementary stream.
  final String pcrControl;

  /// Maximum time in milliseconds between Program Clock References (PCRs)
  /// inserted into the transport stream.
  final int pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  final String pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of "0" writes out the PMT once per segment file.
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  final String pmtPid;

  /// The value of the program number field in the Program Map Table.
  final int programNum;

  /// If set to passthrough, passes any SCTE-35 signals from the input source to
  /// this output.
  final String scte35Behavior;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value.
  final String scte35Pid;

  /// When set to passthrough, timed metadata is passed through from input to
  /// output.
  final String timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  final String videoPid;

  M3U8Settings({
    this.audioFramesPerPes,
    this.audioPids,
    this.ecmPid,
    this.patInterval,
    this.pcrControl,
    this.pcrPeriod,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.programNum,
    this.scte35Behavior,
    this.scte35Pid,
    this.timedMetadataBehavior,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  static M3U8Settings fromJson(Map<String, dynamic> json) => M3U8Settings(
        audioFramesPerPes: json.containsKey('AudioFramesPerPes')
            ? json['AudioFramesPerPes'] as int
            : null,
        audioPids:
            json.containsKey('AudioPids') ? json['AudioPids'] as String : null,
        ecmPid: json.containsKey('EcmPid') ? json['EcmPid'] as String : null,
        patInterval:
            json.containsKey('PatInterval') ? json['PatInterval'] as int : null,
        pcrControl: json.containsKey('PcrControl')
            ? json['PcrControl'] as String
            : null,
        pcrPeriod:
            json.containsKey('PcrPeriod') ? json['PcrPeriod'] as int : null,
        pcrPid: json.containsKey('PcrPid') ? json['PcrPid'] as String : null,
        pmtInterval:
            json.containsKey('PmtInterval') ? json['PmtInterval'] as int : null,
        pmtPid: json.containsKey('PmtPid') ? json['PmtPid'] as String : null,
        programNum:
            json.containsKey('ProgramNum') ? json['ProgramNum'] as int : null,
        scte35Behavior: json.containsKey('Scte35Behavior')
            ? json['Scte35Behavior'] as String
            : null,
        scte35Pid:
            json.containsKey('Scte35Pid') ? json['Scte35Pid'] as String : null,
        timedMetadataBehavior: json.containsKey('TimedMetadataBehavior')
            ? json['TimedMetadataBehavior'] as String
            : null,
        timedMetadataPid: json.containsKey('TimedMetadataPid')
            ? json['TimedMetadataPid'] as String
            : null,
        transportStreamId: json.containsKey('TransportStreamId')
            ? json['TransportStreamId'] as int
            : null,
        videoPid:
            json.containsKey('VideoPid') ? json['VideoPid'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The settings for a MediaConnect Flow.
class MediaConnectFlow {
  /// The unique ARN of the MediaConnect Flow being used as a source.
  final String flowArn;

  MediaConnectFlow({
    this.flowArn,
  });
  static MediaConnectFlow fromJson(Map<String, dynamic> json) =>
      MediaConnectFlow(
        flowArn: json.containsKey('FlowArn') ? json['FlowArn'] as String : null,
      );
}

/// The settings for a MediaConnect Flow.
class MediaConnectFlowRequest {
  /// The ARN of the MediaConnect Flow that you want to use as a source.
  final String flowArn;

  MediaConnectFlowRequest({
    this.flowArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Media Package Group Settings
class MediaPackageGroupSettings {
  /// MediaPackage channel destination.
  final OutputLocationRef destination;

  MediaPackageGroupSettings({
    @required this.destination,
  });
  static MediaPackageGroupSettings fromJson(Map<String, dynamic> json) =>
      MediaPackageGroupSettings(
        destination: OutputLocationRef.fromJson(json['Destination']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// MediaPackage Output Destination Settings
class MediaPackageOutputDestinationSettings {
  /// ID of the channel in MediaPackage that is the destination for this output
  /// group. You do not need to specify the individual inputs in MediaPackage;
  /// MediaLive will handle the connection of the two MediaLive pipelines to the
  /// two MediaPackage inputs. The MediaPackage channel and MediaLive channel
  /// must be in the same region.
  final String channelId;

  MediaPackageOutputDestinationSettings({
    this.channelId,
  });
  static MediaPackageOutputDestinationSettings fromJson(
          Map<String, dynamic> json) =>
      MediaPackageOutputDestinationSettings(
        channelId:
            json.containsKey('ChannelId') ? json['ChannelId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Media Package Output Settings
class MediaPackageOutputSettings {
  MediaPackageOutputSettings();
  static MediaPackageOutputSettings fromJson(Map<String, dynamic> json) =>
      MediaPackageOutputSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Mp2 Settings
class Mp2Settings {
  /// Average bitrate in bits/second.
  final double bitrate;

  /// The MPEG2 Audio coding mode. Valid values are codingMode10 (for mono) or
  /// codingMode20 (for stereo).
  final String codingMode;

  /// Sample rate in Hz.
  final double sampleRate;

  Mp2Settings({
    this.bitrate,
    this.codingMode,
    this.sampleRate,
  });
  static Mp2Settings fromJson(Map<String, dynamic> json) => Mp2Settings(
        bitrate: json.containsKey('Bitrate') ? json['Bitrate'] as double : null,
        codingMode: json.containsKey('CodingMode')
            ? json['CodingMode'] as String
            : null,
        sampleRate: json.containsKey('SampleRate')
            ? json['SampleRate'] as double
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Ms Smooth Group Settings
class MsSmoothGroupSettings {
  /// The value of the "Acquisition Point Identity" element used in each message
  /// placed in the sparse track. Only enabled if sparseTrackType is not "none".
  final String acquisitionPointId;

  /// If set to passthrough for an audio-only MS Smooth output, the fragment
  /// absolute time will be set to the current timecode. This option does not
  /// write timecodes to the audio elementary stream.
  final String audioOnlyTimecodeControl;

  /// If set to verifyAuthenticity, verify the https certificate chain to a
  /// trusted Certificate Authority (CA). This will cause https outputs to
  /// self-signed certificates to fail.
  final String certificateMode;

  /// Number of seconds to wait before retrying connection to the IIS server if
  /// the connection is lost. Content will be cached during this time and the
  /// cache will be be delivered to the IIS server once the connection is
  /// re-established.
  final int connectionRetryInterval;

  /// Smooth Streaming publish point on an IIS server. Elemental Live acts as a
  /// "Push" encoder to IIS.
  final OutputLocationRef destination;

  /// MS Smooth event ID to be sent to the IIS server. Should only be specified
  /// if eventIdMode is set to useConfigured.
  final String eventId;

  /// Specifies whether or not to send an event ID to the IIS server. If no
  /// event ID is sent and the same Live Event is used without changing the
  /// publishing point, clients might see cached video from the previous run.
  /// Options: - "useConfigured" - use the value provided in eventId -
  /// "useTimestamp" - generate and send an event ID based on the current
  /// timestamp - "noEventId" - do not send an event ID to the IIS server.
  final String eventIdMode;

  /// When set to sendEos, send EOS signal to IIS server when stopping the event
  final String eventStopBehavior;

  /// Size in seconds of file cache for streaming outputs.
  final int filecacheDuration;

  /// Length of mp4 fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and framerate.
  final int fragmentLength;

  /// Parameter that control output group behavior on input loss.
  final String inputLossAction;

  /// Number of retry attempts.
  final int numRetries;

  /// Number of seconds before initiating a restart due to output failure, due
  /// to exhausting the numRetries on one segment, or exceeding
  /// filecacheDuration.
  final int restartDelay;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  final String segmentationMode;

  /// Number of milliseconds to delay the output from the second pipeline.
  final int sendDelayMs;

  /// If set to scte35, use incoming SCTE-35 messages to generate a sparse track
  /// in this group of MS-Smooth outputs.
  final String sparseTrackType;

  /// When set to send, send stream manifest so publishing point doesn't start
  /// until all streams start.
  final String streamManifestBehavior;

  /// Timestamp offset for the event. Only used if timestampOffsetMode is set to
  /// useConfiguredOffset.
  final String timestampOffset;

  /// Type of timestamp date offset to use. - useEventStartDate: Use the date
  /// the event was started as the offset - useConfiguredOffset: Use an
  /// explicitly configured date as the offset
  final String timestampOffsetMode;

  MsSmoothGroupSettings({
    this.acquisitionPointId,
    this.audioOnlyTimecodeControl,
    this.certificateMode,
    this.connectionRetryInterval,
    @required this.destination,
    this.eventId,
    this.eventIdMode,
    this.eventStopBehavior,
    this.filecacheDuration,
    this.fragmentLength,
    this.inputLossAction,
    this.numRetries,
    this.restartDelay,
    this.segmentationMode,
    this.sendDelayMs,
    this.sparseTrackType,
    this.streamManifestBehavior,
    this.timestampOffset,
    this.timestampOffsetMode,
  });
  static MsSmoothGroupSettings fromJson(Map<String, dynamic> json) =>
      MsSmoothGroupSettings(
        acquisitionPointId: json.containsKey('AcquisitionPointId')
            ? json['AcquisitionPointId'] as String
            : null,
        audioOnlyTimecodeControl: json.containsKey('AudioOnlyTimecodeControl')
            ? json['AudioOnlyTimecodeControl'] as String
            : null,
        certificateMode: json.containsKey('CertificateMode')
            ? json['CertificateMode'] as String
            : null,
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        destination: OutputLocationRef.fromJson(json['Destination']),
        eventId: json.containsKey('EventId') ? json['EventId'] as String : null,
        eventIdMode: json.containsKey('EventIdMode')
            ? json['EventIdMode'] as String
            : null,
        eventStopBehavior: json.containsKey('EventStopBehavior')
            ? json['EventStopBehavior'] as String
            : null,
        filecacheDuration: json.containsKey('FilecacheDuration')
            ? json['FilecacheDuration'] as int
            : null,
        fragmentLength: json.containsKey('FragmentLength')
            ? json['FragmentLength'] as int
            : null,
        inputLossAction: json.containsKey('InputLossAction')
            ? json['InputLossAction'] as String
            : null,
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
        segmentationMode: json.containsKey('SegmentationMode')
            ? json['SegmentationMode'] as String
            : null,
        sendDelayMs:
            json.containsKey('SendDelayMs') ? json['SendDelayMs'] as int : null,
        sparseTrackType: json.containsKey('SparseTrackType')
            ? json['SparseTrackType'] as String
            : null,
        streamManifestBehavior: json.containsKey('StreamManifestBehavior')
            ? json['StreamManifestBehavior'] as String
            : null,
        timestampOffset: json.containsKey('TimestampOffset')
            ? json['TimestampOffset'] as String
            : null,
        timestampOffsetMode: json.containsKey('TimestampOffsetMode')
            ? json['TimestampOffsetMode'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Ms Smooth Output Settings
class MsSmoothOutputSettings {
  /// Only applicable when this output is referencing an H.265 video
  /// description. Specifies whether MP4 segments should be packaged as HEV1 or
  /// HVC1.
  final String h265PackagingType;

  /// String concatenated to the end of the destination filename. Required for
  /// multiple outputs of the same type.
  final String nameModifier;

  MsSmoothOutputSettings({
    this.h265PackagingType,
    this.nameModifier,
  });
  static MsSmoothOutputSettings fromJson(Map<String, dynamic> json) =>
      MsSmoothOutputSettings(
        h265PackagingType: json.containsKey('H265PackagingType')
            ? json['H265PackagingType'] as String
            : null,
        nameModifier: json.containsKey('NameModifier')
            ? json['NameModifier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Network source to transcode. Must be accessible to the Elemental Live node
/// that is running the live event through a network connection.
class NetworkInputSettings {
  /// Specifies HLS input settings when the uri is for a HLS manifest.
  final HlsInputSettings hlsInputSettings;

  /// Check HTTPS server certificates. When set to checkCryptographyOnly,
  /// cryptography in the certificate will be checked, but not the server's
  /// name. Certain subdomains (notably S3 buckets that use dots in the bucket
  /// name) do not strictly match the corresponding certificate's wildcard
  /// pattern and would otherwise cause the event to error. This setting is
  /// ignored for protocols that do not use https.
  final String serverValidation;

  NetworkInputSettings({
    this.hlsInputSettings,
    this.serverValidation,
  });
  static NetworkInputSettings fromJson(Map<String, dynamic> json) =>
      NetworkInputSettings(
        hlsInputSettings: json.containsKey('HlsInputSettings')
            ? HlsInputSettings.fromJson(json['HlsInputSettings'])
            : null,
        serverValidation: json.containsKey('ServerValidation')
            ? json['ServerValidation'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Reserved resources available for purchase
class Offering {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  final String arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String currencyCode;

  /// Lease duration, e.g. '12'
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  final String durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final String offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String region;

  /// Resource configuration details
  final ReservationResourceSpecification resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double usagePrice;

  Offering({
    this.arn,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.fixedPrice,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.resourceSpecification,
    this.usagePrice,
  });
  static Offering fromJson(Map<String, dynamic> json) => Offering(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        durationUnits: json.containsKey('DurationUnits')
            ? json['DurationUnits'] as String
            : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        offeringDescription: json.containsKey('OfferingDescription')
            ? json['OfferingDescription'] as String
            : null,
        offeringId: json.containsKey('OfferingId')
            ? json['OfferingId'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        resourceSpecification: json.containsKey('ResourceSpecification')
            ? ReservationResourceSpecification.fromJson(
                json['ResourceSpecification'])
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
      );
}

/// Output settings. There can be multiple outputs within a group.
class Output {
  /// The names of the AudioDescriptions used as audio sources for this output.
  final List<String> audioDescriptionNames;

  /// The names of the CaptionDescriptions used as caption sources for this
  /// output.
  final List<String> captionDescriptionNames;

  /// The name used to identify an output.
  final String outputName;

  /// Output type-specific settings.
  final OutputSettings outputSettings;

  /// The name of the VideoDescription used as the source for this output.
  final String videoDescriptionName;

  Output({
    this.audioDescriptionNames,
    this.captionDescriptionNames,
    this.outputName,
    @required this.outputSettings,
    this.videoDescriptionName,
  });
  static Output fromJson(Map<String, dynamic> json) => Output(
        audioDescriptionNames: json.containsKey('AudioDescriptionNames')
            ? (json['AudioDescriptionNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        captionDescriptionNames: json.containsKey('CaptionDescriptionNames')
            ? (json['CaptionDescriptionNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        outputName: json.containsKey('OutputName')
            ? json['OutputName'] as String
            : null,
        outputSettings: OutputSettings.fromJson(json['OutputSettings']),
        videoDescriptionName: json.containsKey('VideoDescriptionName')
            ? json['VideoDescriptionName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for OutputDestination
class OutputDestination {
  /// User-specified id. This is used in an output group or an output.
  final String id;

  /// Destination settings for a MediaPackage output; one destination for both
  /// encoders.
  final List<MediaPackageOutputDestinationSettings> mediaPackageSettings;

  /// Destination settings for a standard output; one destination for each
  /// redundant encoder.
  final List<OutputDestinationSettings> settings;

  OutputDestination({
    this.id,
    this.mediaPackageSettings,
    this.settings,
  });
  static OutputDestination fromJson(Map<String, dynamic> json) =>
      OutputDestination(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        mediaPackageSettings: json.containsKey('MediaPackageSettings')
            ? (json['MediaPackageSettings'] as List)
                .map((e) => MediaPackageOutputDestinationSettings.fromJson(e))
                .toList()
            : null,
        settings: json.containsKey('Settings')
            ? (json['Settings'] as List)
                .map((e) => OutputDestinationSettings.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for OutputDestinationSettings
class OutputDestinationSettings {
  /// key used to extract the password from EC2 Parameter store
  final String passwordParam;

  /// Stream name for RTMP destinations (URLs of type rtmp://)
  final String streamName;

  /// A URL specifying a destination
  final String url;

  /// username for destination
  final String username;

  OutputDestinationSettings({
    this.passwordParam,
    this.streamName,
    this.url,
    this.username,
  });
  static OutputDestinationSettings fromJson(Map<String, dynamic> json) =>
      OutputDestinationSettings(
        passwordParam: json.containsKey('PasswordParam')
            ? json['PasswordParam'] as String
            : null,
        streamName: json.containsKey('StreamName')
            ? json['StreamName'] as String
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
class OutputGroup {
  /// Custom output group name optionally defined by the user. Only letters,
  /// numbers, and the underscore character allowed; only 32 characters allowed.
  final String name;

  /// Settings associated with the output group.
  final OutputGroupSettings outputGroupSettings;

  final List<Output> outputs;

  OutputGroup({
    this.name,
    @required this.outputGroupSettings,
    @required this.outputs,
  });
  static OutputGroup fromJson(Map<String, dynamic> json) => OutputGroup(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        outputGroupSettings:
            OutputGroupSettings.fromJson(json['OutputGroupSettings']),
        outputs:
            (json['Outputs'] as List).map((e) => Output.fromJson(e)).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Output Group Settings
class OutputGroupSettings {
  final ArchiveGroupSettings archiveGroupSettings;

  final FrameCaptureGroupSettings frameCaptureGroupSettings;

  final HlsGroupSettings hlsGroupSettings;

  final MediaPackageGroupSettings mediaPackageGroupSettings;

  final MsSmoothGroupSettings msSmoothGroupSettings;

  final RtmpGroupSettings rtmpGroupSettings;

  final UdpGroupSettings udpGroupSettings;

  OutputGroupSettings({
    this.archiveGroupSettings,
    this.frameCaptureGroupSettings,
    this.hlsGroupSettings,
    this.mediaPackageGroupSettings,
    this.msSmoothGroupSettings,
    this.rtmpGroupSettings,
    this.udpGroupSettings,
  });
  static OutputGroupSettings fromJson(Map<String, dynamic> json) =>
      OutputGroupSettings(
        archiveGroupSettings: json.containsKey('ArchiveGroupSettings')
            ? ArchiveGroupSettings.fromJson(json['ArchiveGroupSettings'])
            : null,
        frameCaptureGroupSettings: json.containsKey('FrameCaptureGroupSettings')
            ? FrameCaptureGroupSettings.fromJson(
                json['FrameCaptureGroupSettings'])
            : null,
        hlsGroupSettings: json.containsKey('HlsGroupSettings')
            ? HlsGroupSettings.fromJson(json['HlsGroupSettings'])
            : null,
        mediaPackageGroupSettings: json.containsKey('MediaPackageGroupSettings')
            ? MediaPackageGroupSettings.fromJson(
                json['MediaPackageGroupSettings'])
            : null,
        msSmoothGroupSettings: json.containsKey('MsSmoothGroupSettings')
            ? MsSmoothGroupSettings.fromJson(json['MsSmoothGroupSettings'])
            : null,
        rtmpGroupSettings: json.containsKey('RtmpGroupSettings')
            ? RtmpGroupSettings.fromJson(json['RtmpGroupSettings'])
            : null,
        udpGroupSettings: json.containsKey('UdpGroupSettings')
            ? UdpGroupSettings.fromJson(json['UdpGroupSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Reference to an OutputDestination ID defined in the channel
class OutputLocationRef {
  final String destinationRefId;

  OutputLocationRef({
    this.destinationRefId,
  });
  static OutputLocationRef fromJson(Map<String, dynamic> json) =>
      OutputLocationRef(
        destinationRefId: json.containsKey('DestinationRefId')
            ? json['DestinationRefId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Output Settings
class OutputSettings {
  final ArchiveOutputSettings archiveOutputSettings;

  final FrameCaptureOutputSettings frameCaptureOutputSettings;

  final HlsOutputSettings hlsOutputSettings;

  final MediaPackageOutputSettings mediaPackageOutputSettings;

  final MsSmoothOutputSettings msSmoothOutputSettings;

  final RtmpOutputSettings rtmpOutputSettings;

  final UdpOutputSettings udpOutputSettings;

  OutputSettings({
    this.archiveOutputSettings,
    this.frameCaptureOutputSettings,
    this.hlsOutputSettings,
    this.mediaPackageOutputSettings,
    this.msSmoothOutputSettings,
    this.rtmpOutputSettings,
    this.udpOutputSettings,
  });
  static OutputSettings fromJson(Map<String, dynamic> json) => OutputSettings(
        archiveOutputSettings: json.containsKey('ArchiveOutputSettings')
            ? ArchiveOutputSettings.fromJson(json['ArchiveOutputSettings'])
            : null,
        frameCaptureOutputSettings:
            json.containsKey('FrameCaptureOutputSettings')
                ? FrameCaptureOutputSettings.fromJson(
                    json['FrameCaptureOutputSettings'])
                : null,
        hlsOutputSettings: json.containsKey('HlsOutputSettings')
            ? HlsOutputSettings.fromJson(json['HlsOutputSettings'])
            : null,
        mediaPackageOutputSettings:
            json.containsKey('MediaPackageOutputSettings')
                ? MediaPackageOutputSettings.fromJson(
                    json['MediaPackageOutputSettings'])
                : null,
        msSmoothOutputSettings: json.containsKey('MsSmoothOutputSettings')
            ? MsSmoothOutputSettings.fromJson(json['MsSmoothOutputSettings'])
            : null,
        rtmpOutputSettings: json.containsKey('RtmpOutputSettings')
            ? RtmpOutputSettings.fromJson(json['RtmpOutputSettings'])
            : null,
        udpOutputSettings: json.containsKey('UdpOutputSettings')
            ? UdpOutputSettings.fromJson(json['UdpOutputSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Pass Through Settings
class PassThroughSettings {
  PassThroughSettings();
  static PassThroughSettings fromJson(Map<String, dynamic> json) =>
      PassThroughSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for the action to set pause state of a channel.
class PauseStateScheduleActionSettings {
  final List<PipelinePauseStateSettings> pipelines;

  PauseStateScheduleActionSettings({
    this.pipelines,
  });
  static PauseStateScheduleActionSettings fromJson(Map<String, dynamic> json) =>
      PauseStateScheduleActionSettings(
        pipelines: json.containsKey('Pipelines')
            ? (json['Pipelines'] as List)
                .map((e) => PipelinePauseStateSettings.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Runtime details of a pipeline when a channel is running.
class PipelineDetail {
  /// The name of the active input attachment currently being ingested by this
  /// pipeline.
  final String activeInputAttachmentName;

  /// The name of the input switch schedule action that occurred most recently
  /// and that resulted in the switch to the current input attachment for this
  /// pipeline.
  final String activeInputSwitchActionName;

  /// Pipeline ID
  final String pipelineId;

  PipelineDetail({
    this.activeInputAttachmentName,
    this.activeInputSwitchActionName,
    this.pipelineId,
  });
  static PipelineDetail fromJson(Map<String, dynamic> json) => PipelineDetail(
        activeInputAttachmentName: json.containsKey('ActiveInputAttachmentName')
            ? json['ActiveInputAttachmentName'] as String
            : null,
        activeInputSwitchActionName:
            json.containsKey('ActiveInputSwitchActionName')
                ? json['ActiveInputSwitchActionName'] as String
                : null,
        pipelineId: json.containsKey('PipelineId')
            ? json['PipelineId'] as String
            : null,
      );
}

/// Settings for pausing a pipeline.
class PipelinePauseStateSettings {
  /// Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").
  final String pipelineId;

  PipelinePauseStateSettings({
    @required this.pipelineId,
  });
  static PipelinePauseStateSettings fromJson(Map<String, dynamic> json) =>
      PipelinePauseStateSettings(
        pipelineId: json['PipelineId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for PurchaseOfferingResponse
class PurchaseOfferingResponse {
  final Reservation reservation;

  PurchaseOfferingResponse({
    this.reservation,
  });
  static PurchaseOfferingResponse fromJson(Map<String, dynamic> json) =>
      PurchaseOfferingResponse(
        reservation: json.containsKey('Reservation')
            ? Reservation.fromJson(json['Reservation'])
            : null,
      );
}

/// Rec601 Settings
class Rec601Settings {
  Rec601Settings();
  static Rec601Settings fromJson(Map<String, dynamic> json) => Rec601Settings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Rec709 Settings
class Rec709Settings {
  Rec709Settings();
  static Rec709Settings fromJson(Map<String, dynamic> json) => Rec709Settings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Remix Settings
class RemixSettings {
  /// Mapping of input channels to output channels, with appropriate gain
  /// adjustments.
  final List<AudioChannelMapping> channelMappings;

  /// Number of input channels to be used.
  final int channelsIn;

  /// Number of output channels to be produced. Valid values: 1, 2, 4, 6, 8
  final int channelsOut;

  RemixSettings({
    @required this.channelMappings,
    this.channelsIn,
    this.channelsOut,
  });
  static RemixSettings fromJson(Map<String, dynamic> json) => RemixSettings(
        channelMappings: (json['ChannelMappings'] as List)
            .map((e) => AudioChannelMapping.fromJson(e))
            .toList(),
        channelsIn:
            json.containsKey('ChannelsIn') ? json['ChannelsIn'] as int : null,
        channelsOut:
            json.containsKey('ChannelsOut') ? json['ChannelsOut'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Reserved resources available to use
class Reservation {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String arn;

  /// Number of reserved resources
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String currencyCode;

  /// Lease duration, e.g. '12'
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  final String durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double fixedPrice;

  /// User specified reservation name
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final String offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  final String reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final String state;

  /// A collection of key-value pairs
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double usagePrice;

  Reservation({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  static Reservation fromJson(Map<String, dynamic> json) => Reservation(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        currencyCode: json.containsKey('CurrencyCode')
            ? json['CurrencyCode'] as String
            : null,
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        durationUnits: json.containsKey('DurationUnits')
            ? json['DurationUnits'] as String
            : null,
        end: json.containsKey('End') ? json['End'] as String : null,
        fixedPrice: json.containsKey('FixedPrice')
            ? json['FixedPrice'] as double
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        offeringDescription: json.containsKey('OfferingDescription')
            ? json['OfferingDescription'] as String
            : null,
        offeringId: json.containsKey('OfferingId')
            ? json['OfferingId'] as String
            : null,
        offeringType: json.containsKey('OfferingType')
            ? json['OfferingType'] as String
            : null,
        region: json.containsKey('Region') ? json['Region'] as String : null,
        reservationId: json.containsKey('ReservationId')
            ? json['ReservationId'] as String
            : null,
        resourceSpecification: json.containsKey('ResourceSpecification')
            ? ReservationResourceSpecification.fromJson(
                json['ResourceSpecification'])
            : null,
        start: json.containsKey('Start') ? json['Start'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        usagePrice: json.containsKey('UsagePrice')
            ? json['UsagePrice'] as double
            : null,
      );
}

/// Resource configuration (codec, resolution, bitrate, ...)
class ReservationResourceSpecification {
  /// Channel class, e.g. 'STANDARD'
  final String channelClass;

  /// Codec, e.g. 'AVC'
  final String codec;

  /// Maximum bitrate, e.g. 'MAX_20_MBPS'
  final String maximumBitrate;

  /// Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)
  final String maximumFramerate;

  /// Resolution, e.g. 'HD'
  final String resolution;

  /// Resource type, 'INPUT', 'OUTPUT', or 'CHANNEL'
  final String resourceType;

  /// Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)
  final String specialFeature;

  /// Video quality, e.g. 'STANDARD' (Outputs only)
  final String videoQuality;

  ReservationResourceSpecification({
    this.channelClass,
    this.codec,
    this.maximumBitrate,
    this.maximumFramerate,
    this.resolution,
    this.resourceType,
    this.specialFeature,
    this.videoQuality,
  });
  static ReservationResourceSpecification fromJson(Map<String, dynamic> json) =>
      ReservationResourceSpecification(
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        codec: json.containsKey('Codec') ? json['Codec'] as String : null,
        maximumBitrate: json.containsKey('MaximumBitrate')
            ? json['MaximumBitrate'] as String
            : null,
        maximumFramerate: json.containsKey('MaximumFramerate')
            ? json['MaximumFramerate'] as String
            : null,
        resolution: json.containsKey('Resolution')
            ? json['Resolution'] as String
            : null,
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        specialFeature: json.containsKey('SpecialFeature')
            ? json['SpecialFeature'] as String
            : null,
        videoQuality: json.containsKey('VideoQuality')
            ? json['VideoQuality'] as String
            : null,
      );
}

/// Rtmp Caption Info Destination Settings
class RtmpCaptionInfoDestinationSettings {
  RtmpCaptionInfoDestinationSettings();
  static RtmpCaptionInfoDestinationSettings fromJson(
          Map<String, dynamic> json) =>
      RtmpCaptionInfoDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Rtmp Group Settings
class RtmpGroupSettings {
  /// Authentication scheme to use when connecting with CDN
  final String authenticationScheme;

  /// Controls behavior when content cache fills up. If remote origin server
  /// stalls the RTMP connection and does not accept content fast enough the
  /// 'Media Cache' will fill up. When the cache reaches the duration specified
  /// by cacheLength the cache will stop accepting new content. If set to
  /// disconnectImmediately, the RTMP output will force a disconnect. Clear the
  /// media cache, and reconnect after restartDelay seconds. If set to
  /// waitForServer, the RTMP output will wait up to 5 minutes to allow the
  /// origin server to begin accepting data again.
  final String cacheFullBehavior;

  /// Cache length, in seconds, is used to calculate buffer size.
  final int cacheLength;

  /// Controls the types of data that passes to onCaptionInfo outputs. If set to
  /// 'all' then 608 and 708 carried DTVCC data will be passed. If set to
  /// 'field1AndField2608' then DTVCC data will be stripped out, but 608 data
  /// from both fields will be passed. If set to 'field1608' then only the data
  /// carried in 608 from field 1 video will be passed.
  final String captionData;

  /// Controls the behavior of this RTMP group if input becomes unavailable. -
  /// emitOutput: Emit a slate until input returns. - pauseOutput: Stop
  /// transmitting data until input returns. This does not close the underlying
  /// RTMP connection.
  final String inputLossAction;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int restartDelay;

  RtmpGroupSettings({
    this.authenticationScheme,
    this.cacheFullBehavior,
    this.cacheLength,
    this.captionData,
    this.inputLossAction,
    this.restartDelay,
  });
  static RtmpGroupSettings fromJson(Map<String, dynamic> json) =>
      RtmpGroupSettings(
        authenticationScheme: json.containsKey('AuthenticationScheme')
            ? json['AuthenticationScheme'] as String
            : null,
        cacheFullBehavior: json.containsKey('CacheFullBehavior')
            ? json['CacheFullBehavior'] as String
            : null,
        cacheLength:
            json.containsKey('CacheLength') ? json['CacheLength'] as int : null,
        captionData: json.containsKey('CaptionData')
            ? json['CaptionData'] as String
            : null,
        inputLossAction: json.containsKey('InputLossAction')
            ? json['InputLossAction'] as String
            : null,
        restartDelay: json.containsKey('RestartDelay')
            ? json['RestartDelay'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Rtmp Output Settings
class RtmpOutputSettings {
  /// If set to verifyAuthenticity, verify the tls certificate chain to a
  /// trusted Certificate Authority (CA). This will cause rtmps outputs with
  /// self-signed certificates to fail.
  final String certificateMode;

  /// Number of seconds to wait before retrying a connection to the Flash Media
  /// server if the connection is lost.
  final int connectionRetryInterval;

  /// The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For
  /// connection to Akamai, a username and password must be supplied. URI fields
  /// accept format identifiers.
  final OutputLocationRef destination;

  /// Number of retry attempts.
  final int numRetries;

  RtmpOutputSettings({
    this.certificateMode,
    this.connectionRetryInterval,
    @required this.destination,
    this.numRetries,
  });
  static RtmpOutputSettings fromJson(Map<String, dynamic> json) =>
      RtmpOutputSettings(
        certificateMode: json.containsKey('CertificateMode')
            ? json['CertificateMode'] as String
            : null,
        connectionRetryInterval: json.containsKey('ConnectionRetryInterval')
            ? json['ConnectionRetryInterval'] as int
            : null,
        destination: OutputLocationRef.fromJson(json['Destination']),
        numRetries:
            json.containsKey('NumRetries') ? json['NumRetries'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information on a single schedule action.
class ScheduleAction {
  /// The name of the action, must be unique within the schedule. This name
  /// provides the main reference to an action once it is added to the schedule.
  /// A name is unique if it is no longer in the schedule. The schedule is
  /// automatically cleaned up to remove actions with a start time of more than
  /// 1 hour ago (approximately) so at that point a name can be reused.
  final String actionName;

  /// Settings for this schedule action.
  final ScheduleActionSettings scheduleActionSettings;

  /// The time for the action to start in the channel.
  final ScheduleActionStartSettings scheduleActionStartSettings;

  ScheduleAction({
    @required this.actionName,
    @required this.scheduleActionSettings,
    @required this.scheduleActionStartSettings,
  });
  static ScheduleAction fromJson(Map<String, dynamic> json) => ScheduleAction(
        actionName: json['ActionName'] as String,
        scheduleActionSettings:
            ScheduleActionSettings.fromJson(json['ScheduleActionSettings']),
        scheduleActionStartSettings: ScheduleActionStartSettings.fromJson(
            json['ScheduleActionStartSettings']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Holds the settings for a single schedule action.
class ScheduleActionSettings {
  /// Action to insert HLS metadata
  final HlsTimedMetadataScheduleActionSettings hlsTimedMetadataSettings;

  /// Action to switch the input
  final InputSwitchScheduleActionSettings inputSwitchSettings;

  /// Action to pause or unpause one or both channel pipelines
  final PauseStateScheduleActionSettings pauseStateSettings;

  /// Action to insert SCTE-35 return_to_network message
  final Scte35ReturnToNetworkScheduleActionSettings
      scte35ReturnToNetworkSettings;

  /// Action to insert SCTE-35 splice_insert message
  final Scte35SpliceInsertScheduleActionSettings scte35SpliceInsertSettings;

  /// Action to insert SCTE-35 time_signal message
  final Scte35TimeSignalScheduleActionSettings scte35TimeSignalSettings;

  /// Action to activate a static image overlay
  final StaticImageActivateScheduleActionSettings staticImageActivateSettings;

  /// Action to deactivate a static image overlay
  final StaticImageDeactivateScheduleActionSettings
      staticImageDeactivateSettings;

  ScheduleActionSettings({
    this.hlsTimedMetadataSettings,
    this.inputSwitchSettings,
    this.pauseStateSettings,
    this.scte35ReturnToNetworkSettings,
    this.scte35SpliceInsertSettings,
    this.scte35TimeSignalSettings,
    this.staticImageActivateSettings,
    this.staticImageDeactivateSettings,
  });
  static ScheduleActionSettings fromJson(Map<String, dynamic> json) =>
      ScheduleActionSettings(
        hlsTimedMetadataSettings: json.containsKey('HlsTimedMetadataSettings')
            ? HlsTimedMetadataScheduleActionSettings.fromJson(
                json['HlsTimedMetadataSettings'])
            : null,
        inputSwitchSettings: json.containsKey('InputSwitchSettings')
            ? InputSwitchScheduleActionSettings.fromJson(
                json['InputSwitchSettings'])
            : null,
        pauseStateSettings: json.containsKey('PauseStateSettings')
            ? PauseStateScheduleActionSettings.fromJson(
                json['PauseStateSettings'])
            : null,
        scte35ReturnToNetworkSettings:
            json.containsKey('Scte35ReturnToNetworkSettings')
                ? Scte35ReturnToNetworkScheduleActionSettings.fromJson(
                    json['Scte35ReturnToNetworkSettings'])
                : null,
        scte35SpliceInsertSettings:
            json.containsKey('Scte35SpliceInsertSettings')
                ? Scte35SpliceInsertScheduleActionSettings.fromJson(
                    json['Scte35SpliceInsertSettings'])
                : null,
        scte35TimeSignalSettings: json.containsKey('Scte35TimeSignalSettings')
            ? Scte35TimeSignalScheduleActionSettings.fromJson(
                json['Scte35TimeSignalSettings'])
            : null,
        staticImageActivateSettings:
            json.containsKey('StaticImageActivateSettings')
                ? StaticImageActivateScheduleActionSettings.fromJson(
                    json['StaticImageActivateSettings'])
                : null,
        staticImageDeactivateSettings:
            json.containsKey('StaticImageDeactivateSettings')
                ? StaticImageDeactivateScheduleActionSettings.fromJson(
                    json['StaticImageDeactivateSettings'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings to specify when an action should occur. Only one of the options
/// must be selected.
class ScheduleActionStartSettings {
  /// Option for specifying the start time for an action.
  final FixedModeScheduleActionStartSettings
      fixedModeScheduleActionStartSettings;

  /// Option for specifying an action as relative to another action.
  final FollowModeScheduleActionStartSettings
      followModeScheduleActionStartSettings;

  /// Option for specifying an action that should be applied immediately.
  final ImmediateModeScheduleActionStartSettings
      immediateModeScheduleActionStartSettings;

  ScheduleActionStartSettings({
    this.fixedModeScheduleActionStartSettings,
    this.followModeScheduleActionStartSettings,
    this.immediateModeScheduleActionStartSettings,
  });
  static ScheduleActionStartSettings fromJson(Map<String, dynamic> json) =>
      ScheduleActionStartSettings(
        fixedModeScheduleActionStartSettings:
            json.containsKey('FixedModeScheduleActionStartSettings')
                ? FixedModeScheduleActionStartSettings.fromJson(
                    json['FixedModeScheduleActionStartSettings'])
                : null,
        followModeScheduleActionStartSettings:
            json.containsKey('FollowModeScheduleActionStartSettings')
                ? FollowModeScheduleActionStartSettings.fromJson(
                    json['FollowModeScheduleActionStartSettings'])
                : null,
        immediateModeScheduleActionStartSettings:
            json.containsKey('ImmediateModeScheduleActionStartSettings')
                ? ImmediateModeScheduleActionStartSettings.fromJson(
                    json['ImmediateModeScheduleActionStartSettings'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte20 Plus Embedded Destination Settings
class Scte20PlusEmbeddedDestinationSettings {
  Scte20PlusEmbeddedDestinationSettings();
  static Scte20PlusEmbeddedDestinationSettings fromJson(
          Map<String, dynamic> json) =>
      Scte20PlusEmbeddedDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte20 Source Settings
class Scte20SourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  final String convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int source608ChannelNumber;

  Scte20SourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
  });
  static Scte20SourceSettings fromJson(Map<String, dynamic> json) =>
      Scte20SourceSettings(
        convert608To708: json.containsKey('Convert608To708')
            ? json['Convert608To708'] as String
            : null,
        source608ChannelNumber: json.containsKey('Source608ChannelNumber')
            ? json['Source608ChannelNumber'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte27 Destination Settings
class Scte27DestinationSettings {
  Scte27DestinationSettings();
  static Scte27DestinationSettings fromJson(Map<String, dynamic> json) =>
      Scte27DestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte27 Source Settings
class Scte27SourceSettings {
  /// The pid field is used in conjunction with the caption selector
  /// languageCode field as follows: - Specify PID and Language: Extracts
  /// captions from that PID; the language is "informational". - Specify PID and
  /// omit Language: Extracts the specified PID. - Omit PID and specify
  /// Language: Extracts the specified language, whichever PID that happens to
  /// be. - Omit PID and omit Language: Valid only if source is DVB-Sub that is
  /// being passed through; all languages will be passed through.
  final int pid;

  Scte27SourceSettings({
    this.pid,
  });
  static Scte27SourceSettings fromJson(Map<String, dynamic> json) =>
      Scte27SourceSettings(
        pid: json.containsKey('Pid') ? json['Pid'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare
/// delivery restrictions, include this element and its four "restriction"
/// flags. To declare that there are no restrictions, omit this element.
class Scte35DeliveryRestrictions {
  /// Corresponds to SCTE-35 archive_allowed_flag.
  final String archiveAllowedFlag;

  /// Corresponds to SCTE-35 device_restrictions parameter.
  final String deviceRestrictions;

  /// Corresponds to SCTE-35 no_regional_blackout_flag parameter.
  final String noRegionalBlackoutFlag;

  /// Corresponds to SCTE-35 web_delivery_allowed_flag parameter.
  final String webDeliveryAllowedFlag;

  Scte35DeliveryRestrictions({
    @required this.archiveAllowedFlag,
    @required this.deviceRestrictions,
    @required this.noRegionalBlackoutFlag,
    @required this.webDeliveryAllowedFlag,
  });
  static Scte35DeliveryRestrictions fromJson(Map<String, dynamic> json) =>
      Scte35DeliveryRestrictions(
        archiveAllowedFlag: json['ArchiveAllowedFlag'] as String,
        deviceRestrictions: json['DeviceRestrictions'] as String,
        noRegionalBlackoutFlag: json['NoRegionalBlackoutFlag'] as String,
        webDeliveryAllowedFlag: json['WebDeliveryAllowedFlag'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Holds one set of SCTE-35 Descriptor Settings.
class Scte35Descriptor {
  /// SCTE-35 Descriptor Settings.
  final Scte35DescriptorSettings scte35DescriptorSettings;

  Scte35Descriptor({
    @required this.scte35DescriptorSettings,
  });
  static Scte35Descriptor fromJson(Map<String, dynamic> json) =>
      Scte35Descriptor(
        scte35DescriptorSettings:
            Scte35DescriptorSettings.fromJson(json['Scte35DescriptorSettings']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// SCTE-35 Descriptor settings.
class Scte35DescriptorSettings {
  /// SCTE-35 Segmentation Descriptor.
  final Scte35SegmentationDescriptor
      segmentationDescriptorScte35DescriptorSettings;

  Scte35DescriptorSettings({
    @required this.segmentationDescriptorScte35DescriptorSettings,
  });
  static Scte35DescriptorSettings fromJson(Map<String, dynamic> json) =>
      Scte35DescriptorSettings(
        segmentationDescriptorScte35DescriptorSettings:
            Scte35SegmentationDescriptor.fromJson(
                json['SegmentationDescriptorScte35DescriptorSettings']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for a SCTE-35 return_to_network message.
class Scte35ReturnToNetworkScheduleActionSettings {
  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  final BigInt spliceEventId;

  Scte35ReturnToNetworkScheduleActionSettings({
    @required this.spliceEventId,
  });
  static Scte35ReturnToNetworkScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      Scte35ReturnToNetworkScheduleActionSettings(
        spliceEventId: BigInt.from(json['SpliceEventId']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Corresponds to SCTE-35 segmentation_descriptor.
class Scte35SegmentationDescriptor {
  /// Holds the four SCTE-35 delivery restriction parameters.
  final Scte35DeliveryRestrictions deliveryRestrictions;

  /// Corresponds to SCTE-35 segment_num. A value that is valid for the
  /// specified segmentation_type_id.
  final int segmentNum;

  /// Corresponds to SCTE-35 segmentation_event_cancel_indicator.
  final String segmentationCancelIndicator;

  /// Corresponds to SCTE-35 segmentation_duration. Optional. The duration for
  /// the time_signal, in 90 KHz ticks. To convert seconds to ticks, multiple
  /// the seconds by 90,000. Enter time in 90 KHz clock ticks. If you do not
  /// enter a duration, the time_signal will continue until you insert a
  /// cancellation message.
  final BigInt segmentationDuration;

  /// Corresponds to SCTE-35 segmentation_event_id.
  final BigInt segmentationEventId;

  /// Corresponds to SCTE-35 segmentation_type_id. One of the
  /// segmentation_type_id values listed in the SCTE-35 specification. On the
  /// console, enter the ID in decimal (for example, "52"). In the CLI, API, or
  /// an SDK, enter the ID in hex (for example, "0x34") or decimal (for example,
  /// "52").
  final int segmentationTypeId;

  /// Corresponds to SCTE-35 segmentation_upid. Enter a string containing the
  /// hexadecimal representation of the characters that make up the SCTE-35
  /// segmentation_upid value. Must contain an even number of hex characters. Do
  /// not include spaces between each hex pair. For example, the ASCII "ADS
  /// Information" becomes hex "41445320496e666f726d6174696f6e.
  final String segmentationUpid;

  /// Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one
  /// of the types listed in the SCTE-35 specification, converted to a decimal.
  /// For example, "0x0C" hex from the specification is "12" in decimal. In the
  /// CLI, API, or an SDK, enter one of the types listed in the SCTE-35
  /// specification, in either hex (for example, "0x0C" ) or in decimal (for
  /// example, "12").
  final int segmentationUpidType;

  /// Corresponds to SCTE-35 segments_expected. A value that is valid for the
  /// specified segmentation_type_id.
  final int segmentsExpected;

  /// Corresponds to SCTE-35 sub_segment_num. A value that is valid for the
  /// specified segmentation_type_id.
  final int subSegmentNum;

  /// Corresponds to SCTE-35 sub_segments_expected. A value that is valid for
  /// the specified segmentation_type_id.
  final int subSegmentsExpected;

  Scte35SegmentationDescriptor({
    this.deliveryRestrictions,
    this.segmentNum,
    @required this.segmentationCancelIndicator,
    this.segmentationDuration,
    @required this.segmentationEventId,
    this.segmentationTypeId,
    this.segmentationUpid,
    this.segmentationUpidType,
    this.segmentsExpected,
    this.subSegmentNum,
    this.subSegmentsExpected,
  });
  static Scte35SegmentationDescriptor fromJson(Map<String, dynamic> json) =>
      Scte35SegmentationDescriptor(
        deliveryRestrictions: json.containsKey('DeliveryRestrictions')
            ? Scte35DeliveryRestrictions.fromJson(json['DeliveryRestrictions'])
            : null,
        segmentNum:
            json.containsKey('SegmentNum') ? json['SegmentNum'] as int : null,
        segmentationCancelIndicator:
            json['SegmentationCancelIndicator'] as String,
        segmentationDuration: json.containsKey('SegmentationDuration')
            ? BigInt.from(json['SegmentationDuration'])
            : null,
        segmentationEventId: BigInt.from(json['SegmentationEventId']),
        segmentationTypeId: json.containsKey('SegmentationTypeId')
            ? json['SegmentationTypeId'] as int
            : null,
        segmentationUpid: json.containsKey('SegmentationUpid')
            ? json['SegmentationUpid'] as String
            : null,
        segmentationUpidType: json.containsKey('SegmentationUpidType')
            ? json['SegmentationUpidType'] as int
            : null,
        segmentsExpected: json.containsKey('SegmentsExpected')
            ? json['SegmentsExpected'] as int
            : null,
        subSegmentNum: json.containsKey('SubSegmentNum')
            ? json['SubSegmentNum'] as int
            : null,
        subSegmentsExpected: json.containsKey('SubSegmentsExpected')
            ? json['SubSegmentsExpected'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte35 Splice Insert
class Scte35SpliceInsert {
  /// When specified, this offset (in milliseconds) is added to the input Ad
  /// Avail PTS time. This only applies to embedded SCTE 104/35 messages and
  /// does not apply to OOB messages.
  final int adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to
  /// 0 will no longer trigger blackouts or Ad Avail slates
  final String noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to
  /// 0 will no longer trigger blackouts or Ad Avail slates
  final String webDeliveryAllowedFlag;

  Scte35SpliceInsert({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });
  static Scte35SpliceInsert fromJson(Map<String, dynamic> json) =>
      Scte35SpliceInsert(
        adAvailOffset: json.containsKey('AdAvailOffset')
            ? json['AdAvailOffset'] as int
            : null,
        noRegionalBlackoutFlag: json.containsKey('NoRegionalBlackoutFlag')
            ? json['NoRegionalBlackoutFlag'] as String
            : null,
        webDeliveryAllowedFlag: json.containsKey('WebDeliveryAllowedFlag')
            ? json['WebDeliveryAllowedFlag'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for a SCTE-35 splice_insert message.
class Scte35SpliceInsertScheduleActionSettings {
  /// Optional, the duration for the splice_insert, in 90 KHz ticks. To convert
  /// seconds to ticks, multiple the seconds by 90,000. If you enter a duration,
  /// there is an expectation that the downstream system can read the duration
  /// and cue in at that time. If you do not enter a duration, the splice_insert
  /// will continue indefinitely and there is an expectation that you will enter
  /// a return_to_network to end the splice_insert at the appropriate time.
  final BigInt duration;

  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  final BigInt spliceEventId;

  Scte35SpliceInsertScheduleActionSettings({
    this.duration,
    @required this.spliceEventId,
  });
  static Scte35SpliceInsertScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      Scte35SpliceInsertScheduleActionSettings(
        duration:
            json.containsKey('Duration') ? BigInt.from(json['Duration']) : null,
        spliceEventId: BigInt.from(json['SpliceEventId']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Scte35 Time Signal Apos
class Scte35TimeSignalApos {
  /// When specified, this offset (in milliseconds) is added to the input Ad
  /// Avail PTS time. This only applies to embedded SCTE 104/35 messages and
  /// does not apply to OOB messages.
  final int adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to
  /// 0 will no longer trigger blackouts or Ad Avail slates
  final String noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to
  /// 0 will no longer trigger blackouts or Ad Avail slates
  final String webDeliveryAllowedFlag;

  Scte35TimeSignalApos({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });
  static Scte35TimeSignalApos fromJson(Map<String, dynamic> json) =>
      Scte35TimeSignalApos(
        adAvailOffset: json.containsKey('AdAvailOffset')
            ? json['AdAvailOffset'] as int
            : null,
        noRegionalBlackoutFlag: json.containsKey('NoRegionalBlackoutFlag')
            ? json['NoRegionalBlackoutFlag'] as String
            : null,
        webDeliveryAllowedFlag: json.containsKey('WebDeliveryAllowedFlag')
            ? json['WebDeliveryAllowedFlag'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for a SCTE-35 time_signal.
class Scte35TimeSignalScheduleActionSettings {
  /// The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.
  final List<Scte35Descriptor> scte35Descriptors;

  Scte35TimeSignalScheduleActionSettings({
    @required this.scte35Descriptors,
  });
  static Scte35TimeSignalScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      Scte35TimeSignalScheduleActionSettings(
        scte35Descriptors: (json['Scte35Descriptors'] as List)
            .map((e) => Scte35Descriptor.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Smpte Tt Destination Settings
class SmpteTtDestinationSettings {
  SmpteTtDestinationSettings();
  static SmpteTtDestinationSettings fromJson(Map<String, dynamic> json) =>
      SmpteTtDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Standard Hls Settings
class StandardHlsSettings {
  /// List all the audio groups that are used with the video output stream.
  /// Input all the audio GROUP-IDs that are associated to the video, separate
  /// by ','.
  final String audioRenditionSets;

  final M3U8Settings m3U8Settings;

  StandardHlsSettings({
    this.audioRenditionSets,
    @required this.m3U8Settings,
  });
  static StandardHlsSettings fromJson(Map<String, dynamic> json) =>
      StandardHlsSettings(
        audioRenditionSets: json.containsKey('AudioRenditionSets')
            ? json['AudioRenditionSets'] as String
            : null,
        m3U8Settings: M3U8Settings.fromJson(json['M3u8Settings']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for StartChannelResponse
class StartChannelResponse {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  StartChannelResponse({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static StartChannelResponse fromJson(Map<String, dynamic> json) =>
      StartChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        encoderSettings: json.containsKey('EncoderSettings')
            ? EncoderSettings.fromJson(json['EncoderSettings'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelineDetails: json.containsKey('PipelineDetails')
            ? (json['PipelineDetails'] as List)
                .map((e) => PipelineDetail.fromJson(e))
                .toList()
            : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Settings to identify the start of the clip.
class StartTimecode {
  /// The timecode for the frame where you want to start the clip. Optional; if
  /// not specified, the clip starts at first frame in the file. Enter the
  /// timecode as HH:MM:SS:FF or HH:MM:SS;FF.
  final String timecode;

  StartTimecode({
    this.timecode,
  });
  static StartTimecode fromJson(Map<String, dynamic> json) => StartTimecode(
        timecode:
            json.containsKey('Timecode') ? json['Timecode'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for the action to activate a static image.
class StaticImageActivateScheduleActionSettings {
  /// The duration in milliseconds for the image to remain on the video. If
  /// omitted or set to 0 the duration is unlimited and the image will remain
  /// until it is explicitly deactivated.
  final int duration;

  /// The time in milliseconds for the image to fade in. The fade-in starts at
  /// the start time of the overlay. Default is 0 (no fade-in).
  final int fadeIn;

  /// Applies only if a duration is specified. The time in milliseconds for the
  /// image to fade out. The fade-out starts when the duration time is hit, so
  /// it effectively extends the duration. Default is 0 (no fade-out).
  final int fadeOut;

  /// The height of the image when inserted into the video, in pixels. The
  /// overlay will be scaled up or down to the specified height. Leave blank to
  /// use the native height of the overlay.
  final int height;

  /// The location and filename of the image file to overlay on the video. The
  /// file must be a 32-bit BMP, PNG, or TGA file, and must not be larger (in
  /// pixels) than the input video.
  final InputLocation image;

  /// Placement of the left edge of the overlay relative to the left edge of the
  /// video frame, in pixels. 0 (the default) is the left edge of the frame. If
  /// the placement causes the overlay to extend beyond the right edge of the
  /// underlying video, then the overlay is cropped on the right.
  final int imagex;

  /// Placement of the top edge of the overlay relative to the top edge of the
  /// video frame, in pixels. 0 (the default) is the top edge of the frame. If
  /// the placement causes the overlay to extend beyond the bottom edge of the
  /// underlying video, then the overlay is cropped on the bottom.
  final int imagey;

  /// The number of the layer, 0 to 7. There are 8 layers that can be overlaid
  /// on the video, each layer with a different image. The layers are in Z
  /// order, which means that overlays with higher values of layer are inserted
  /// on top of overlays with lower values of layer. Default is 0.
  final int layer;

  /// Opacity of image where 0 is transparent and 100 is fully opaque. Default
  /// is 100.
  final int opacity;

  /// The width of the image when inserted into the video, in pixels. The
  /// overlay will be scaled up or down to the specified width. Leave blank to
  /// use the native width of the overlay.
  final int width;

  StaticImageActivateScheduleActionSettings({
    this.duration,
    this.fadeIn,
    this.fadeOut,
    this.height,
    @required this.image,
    this.imagex,
    this.imagey,
    this.layer,
    this.opacity,
    this.width,
  });
  static StaticImageActivateScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      StaticImageActivateScheduleActionSettings(
        duration: json.containsKey('Duration') ? json['Duration'] as int : null,
        fadeIn: json.containsKey('FadeIn') ? json['FadeIn'] as int : null,
        fadeOut: json.containsKey('FadeOut') ? json['FadeOut'] as int : null,
        height: json.containsKey('Height') ? json['Height'] as int : null,
        image: InputLocation.fromJson(json['Image']),
        imagex: json.containsKey('ImageX') ? json['ImageX'] as int : null,
        imagey: json.containsKey('ImageY') ? json['ImageY'] as int : null,
        layer: json.containsKey('Layer') ? json['Layer'] as int : null,
        opacity: json.containsKey('Opacity') ? json['Opacity'] as int : null,
        width: json.containsKey('Width') ? json['Width'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Settings for the action to deactivate the image in a specific layer.
class StaticImageDeactivateScheduleActionSettings {
  /// The time in milliseconds for the image to fade out. Default is 0 (no
  /// fade-out).
  final int fadeOut;

  /// The image overlay layer to deactivate, 0 to 7. Default is 0.
  final int layer;

  StaticImageDeactivateScheduleActionSettings({
    this.fadeOut,
    this.layer,
  });
  static StaticImageDeactivateScheduleActionSettings fromJson(
          Map<String, dynamic> json) =>
      StaticImageDeactivateScheduleActionSettings(
        fadeOut: json.containsKey('FadeOut') ? json['FadeOut'] as int : null,
        layer: json.containsKey('Layer') ? json['Layer'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Static Key Settings
class StaticKeySettings {
  /// The URL of the license server used for protecting content.
  final InputLocation keyProviderServer;

  /// Static key value as a 32 character hexadecimal string.
  final String staticKeyValue;

  StaticKeySettings({
    this.keyProviderServer,
    @required this.staticKeyValue,
  });
  static StaticKeySettings fromJson(Map<String, dynamic> json) =>
      StaticKeySettings(
        keyProviderServer: json.containsKey('KeyProviderServer')
            ? InputLocation.fromJson(json['KeyProviderServer'])
            : null,
        staticKeyValue: json['StaticKeyValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for StopChannelResponse
class StopChannelResponse {
  /// The unique arn of the channel.
  final String arn;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final String channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is one
  /// destination per packager.
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint> egressEndpoints;

  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  final String id;

  /// List of input attachments for channel.
  final List<InputAttachment> inputAttachments;

  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final String logLevel;

  /// The name of the channel. (user-mutable)
  final String name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the
  /// Channel.
  final String roleArn;

  final String state;

  /// A collection of key-value pairs.
  final Map<String, String> tags;

  StopChannelResponse({
    this.arn,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  static StopChannelResponse fromJson(Map<String, dynamic> json) =>
      StopChannelResponse(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        channelClass: json.containsKey('ChannelClass')
            ? json['ChannelClass'] as String
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => OutputDestination.fromJson(e))
                .toList()
            : null,
        egressEndpoints: json.containsKey('EgressEndpoints')
            ? (json['EgressEndpoints'] as List)
                .map((e) => ChannelEgressEndpoint.fromJson(e))
                .toList()
            : null,
        encoderSettings: json.containsKey('EncoderSettings')
            ? EncoderSettings.fromJson(json['EncoderSettings'])
            : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        inputAttachments: json.containsKey('InputAttachments')
            ? (json['InputAttachments'] as List)
                .map((e) => InputAttachment.fromJson(e))
                .toList()
            : null,
        inputSpecification: json.containsKey('InputSpecification')
            ? InputSpecification.fromJson(json['InputSpecification'])
            : null,
        logLevel:
            json.containsKey('LogLevel') ? json['LogLevel'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        pipelineDetails: json.containsKey('PipelineDetails')
            ? (json['PipelineDetails'] as List)
                .map((e) => PipelineDetail.fromJson(e))
                .toList()
            : null,
        pipelinesRunningCount: json.containsKey('PipelinesRunningCount')
            ? json['PipelinesRunningCount'] as int
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Settings to identify the end of the clip.
class StopTimecode {
  /// If you specify a StopTimecode in an input (in order to clip the file), you
  /// can specify if you want the clip to exclude (the default) or include the
  /// frame specified by the timecode.
  final String lastFrameClippingBehavior;

  /// The timecode for the frame where you want to stop the clip. Optional; if
  /// not specified, the clip continues to the end of the file. Enter the
  /// timecode as HH:MM:SS:FF or HH:MM:SS;FF.
  final String timecode;

  StopTimecode({
    this.lastFrameClippingBehavior,
    this.timecode,
  });
  static StopTimecode fromJson(Map<String, dynamic> json) => StopTimecode(
        lastFrameClippingBehavior: json.containsKey('LastFrameClippingBehavior')
            ? json['LastFrameClippingBehavior'] as String
            : null,
        timecode:
            json.containsKey('Timecode') ? json['Timecode'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Teletext Destination Settings
class TeletextDestinationSettings {
  TeletextDestinationSettings();
  static TeletextDestinationSettings fromJson(Map<String, dynamic> json) =>
      TeletextDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Teletext Source Settings
class TeletextSourceSettings {
  /// Specifies the teletext page number within the data stream from which to
  /// extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for
  /// passthrough. Should be specified as a hexadecimal string with no "0x"
  /// prefix.
  final String pageNumber;

  TeletextSourceSettings({
    this.pageNumber,
  });
  static TeletextSourceSettings fromJson(Map<String, dynamic> json) =>
      TeletextSourceSettings(
        pageNumber: json.containsKey('PageNumber')
            ? json['PageNumber'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Timecode Config
class TimecodeConfig {
  /// Identifies the source for the timecode that will be associated with the
  /// events outputs. -Embedded (embedded): Initialize the output timecode with
  /// timecode from the the source. If no embedded timecode is detected in the
  /// source, the system falls back to using "Start at 0" (zerobased). -System
  /// Clock (systemclock): Use the UTC time. -Start at 0 (zerobased): The time
  /// of the first frame of the event will be 00:00:00:00.
  final String source;

  /// Threshold in frames beyond which output timecode is resynchronized to the
  /// input timecode. Discrepancies below this threshold are permitted to avoid
  /// unnecessary discontinuities in the output timecode. No timecode sync when
  /// this is not specified.
  final int syncThreshold;

  TimecodeConfig({
    @required this.source,
    this.syncThreshold,
  });
  static TimecodeConfig fromJson(Map<String, dynamic> json) => TimecodeConfig(
        source: json['Source'] as String,
        syncThreshold: json.containsKey('SyncThreshold')
            ? json['SyncThreshold'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Ttml Destination Settings
class TtmlDestinationSettings {
  /// When set to passthrough, passes through style and position information
  /// from a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT
  /// output or TTML output.
  final String styleControl;

  TtmlDestinationSettings({
    this.styleControl,
  });
  static TtmlDestinationSettings fromJson(Map<String, dynamic> json) =>
      TtmlDestinationSettings(
        styleControl: json.containsKey('StyleControl')
            ? json['StyleControl'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Udp Container Settings
class UdpContainerSettings {
  final M2TsSettings m2TsSettings;

  UdpContainerSettings({
    this.m2TsSettings,
  });
  static UdpContainerSettings fromJson(Map<String, dynamic> json) =>
      UdpContainerSettings(
        m2TsSettings: json.containsKey('M2tsSettings')
            ? M2TsSettings.fromJson(json['M2tsSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Udp Group Settings
class UdpGroupSettings {
  /// Specifies behavior of last resort when input video is lost, and no more
  /// backup inputs are available. When dropTs is selected the entire transport
  /// stream will stop being emitted. When dropProgram is selected the program
  /// can be dropped from the transport stream (and replaced with null packets
  /// to meet the TS bitrate requirement). Or, when emitProgram is chosen the
  /// transport stream will continue to be produced normally with repeat frames,
  /// black frames, or slate frames substituted for the absent input video.
  final String inputLossAction;

  /// Indicates ID3 frame that has the timecode.
  final String timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  final int timedMetadataId3Period;

  UdpGroupSettings({
    this.inputLossAction,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
  });
  static UdpGroupSettings fromJson(Map<String, dynamic> json) =>
      UdpGroupSettings(
        inputLossAction: json.containsKey('InputLossAction')
            ? json['InputLossAction'] as String
            : null,
        timedMetadataId3Frame: json.containsKey('TimedMetadataId3Frame')
            ? json['TimedMetadataId3Frame'] as String
            : null,
        timedMetadataId3Period: json.containsKey('TimedMetadataId3Period')
            ? json['TimedMetadataId3Period'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Udp Output Settings
class UdpOutputSettings {
  /// UDP output buffering in milliseconds. Larger values increase latency
  /// through the transcoder but simultaneously assist the transcoder in
  /// maintaining a constant, low-jitter UDP/RTP output while accommodating
  /// clock recovery, input switching, input disruptions, picture reordering,
  /// etc.
  final int bufferMsec;

  final UdpContainerSettings containerSettings;

  /// Destination address and port number for RTP or UDP packets. Can be unicast
  /// or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or
  /// udp://10.100.100.100:5002).
  final OutputLocationRef destination;

  /// Settings for enabling and adjusting Forward Error Correction on UDP
  /// outputs.
  final FecOutputSettings fecOutputSettings;

  UdpOutputSettings({
    this.bufferMsec,
    @required this.containerSettings,
    @required this.destination,
    this.fecOutputSettings,
  });
  static UdpOutputSettings fromJson(Map<String, dynamic> json) =>
      UdpOutputSettings(
        bufferMsec:
            json.containsKey('BufferMsec') ? json['BufferMsec'] as int : null,
        containerSettings:
            UdpContainerSettings.fromJson(json['ContainerSettings']),
        destination: OutputLocationRef.fromJson(json['Destination']),
        fecOutputSettings: json.containsKey('FecOutputSettings')
            ? FecOutputSettings.fromJson(json['FecOutputSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Placeholder documentation for UpdateChannelClassResponse
class UpdateChannelClassResponse {
  final Channel channel;

  UpdateChannelClassResponse({
    this.channel,
  });
  static UpdateChannelClassResponse fromJson(Map<String, dynamic> json) =>
      UpdateChannelClassResponse(
        channel: json.containsKey('Channel')
            ? Channel.fromJson(json['Channel'])
            : null,
      );
}

/// Placeholder documentation for UpdateChannelResponse
class UpdateChannelResponse {
  final Channel channel;

  UpdateChannelResponse({
    this.channel,
  });
  static UpdateChannelResponse fromJson(Map<String, dynamic> json) =>
      UpdateChannelResponse(
        channel: json.containsKey('Channel')
            ? Channel.fromJson(json['Channel'])
            : null,
      );
}

/// Placeholder documentation for UpdateInputResponse
class UpdateInputResponse {
  final Input input;

  UpdateInputResponse({
    this.input,
  });
  static UpdateInputResponse fromJson(Map<String, dynamic> json) =>
      UpdateInputResponse(
        input: json.containsKey('Input') ? Input.fromJson(json['Input']) : null,
      );
}

/// Placeholder documentation for UpdateInputSecurityGroupResponse
class UpdateInputSecurityGroupResponse {
  final InputSecurityGroup securityGroup;

  UpdateInputSecurityGroupResponse({
    this.securityGroup,
  });
  static UpdateInputSecurityGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateInputSecurityGroupResponse(
        securityGroup: json.containsKey('SecurityGroup')
            ? InputSecurityGroup.fromJson(json['SecurityGroup'])
            : null,
      );
}

/// Placeholder documentation for UpdateReservationResponse
class UpdateReservationResponse {
  final Reservation reservation;

  UpdateReservationResponse({
    this.reservation,
  });
  static UpdateReservationResponse fromJson(Map<String, dynamic> json) =>
      UpdateReservationResponse(
        reservation: json.containsKey('Reservation')
            ? Reservation.fromJson(json['Reservation'])
            : null,
      );
}

/// Video Codec Settings
class VideoCodecSettings {
  final FrameCaptureSettings frameCaptureSettings;

  final H264Settings h264Settings;

  final H265Settings h265Settings;

  VideoCodecSettings({
    this.frameCaptureSettings,
    this.h264Settings,
    this.h265Settings,
  });
  static VideoCodecSettings fromJson(Map<String, dynamic> json) =>
      VideoCodecSettings(
        frameCaptureSettings: json.containsKey('FrameCaptureSettings')
            ? FrameCaptureSettings.fromJson(json['FrameCaptureSettings'])
            : null,
        h264Settings: json.containsKey('H264Settings')
            ? H264Settings.fromJson(json['H264Settings'])
            : null,
        h265Settings: json.containsKey('H265Settings')
            ? H265Settings.fromJson(json['H265Settings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Video settings for this stream.
class VideoDescription {
  /// Video codec settings.
  final VideoCodecSettings codecSettings;

  /// Output video height, in pixels. Must be an even number. For most codecs,
  /// you can leave this field and width blank in order to use the height and
  /// width (resolution) from the source. Note, however, that leaving blank is
  /// not recommended. For the Frame Capture codec, height and width are
  /// required.
  final int height;

  /// The name of this VideoDescription. Outputs will use this name to uniquely
  /// identify this Description. Description names should be unique within this
  /// Live Event.
  final String name;

  /// Indicates how to respond to the AFD values in the input stream. RESPOND
  /// causes input video to be clipped, depending on the AFD value, input
  /// display aspect ratio, and output display aspect ratio, and (except for
  /// FRAMECAPTURE codec) includes the values in the output. PASSTHROUGH (does
  /// not apply to FRAMECAPTURE codec) ignores the AFD values and includes the
  /// values in the output, so input video is not clipped. NONE ignores the AFD
  /// values and does not include the values through to the output, so input
  /// video is not clipped.
  final String respondToAfd;

  /// STRETCHTOOUTPUT configures the output position to stretch the video to the
  /// specified output resolution (height and width). This option will override
  /// any position value. DEFAULT may insert black boxes (pillar boxes or letter
  /// boxes) around the video to provide the specified output resolution.
  final String scalingBehavior;

  /// Changes the strength of the anti-alias filter used for scaling. 0 is the
  /// softest setting, 100 is the sharpest. A setting of 50 is recommended for
  /// most content.
  final int sharpness;

  /// Output video width, in pixels. Must be an even number. For most codecs,
  /// you can leave this field and height blank in order to use the height and
  /// width (resolution) from the source. Note, however, that leaving blank is
  /// not recommended. For the Frame Capture codec, height and width are
  /// required.
  final int width;

  VideoDescription({
    this.codecSettings,
    this.height,
    @required this.name,
    this.respondToAfd,
    this.scalingBehavior,
    this.sharpness,
    this.width,
  });
  static VideoDescription fromJson(Map<String, dynamic> json) =>
      VideoDescription(
        codecSettings: json.containsKey('CodecSettings')
            ? VideoCodecSettings.fromJson(json['CodecSettings'])
            : null,
        height: json.containsKey('Height') ? json['Height'] as int : null,
        name: json['Name'] as String,
        respondToAfd: json.containsKey('RespondToAfd')
            ? json['RespondToAfd'] as String
            : null,
        scalingBehavior: json.containsKey('ScalingBehavior')
            ? json['ScalingBehavior'] as String
            : null,
        sharpness:
            json.containsKey('Sharpness') ? json['Sharpness'] as int : null,
        width: json.containsKey('Width') ? json['Width'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a particular video stream within an input source. An input may
/// have only a single video selector.
class VideoSelector {
  /// Specifies the color space of an input. This setting works in tandem with
  /// colorSpaceUsage and a video description's colorSpaceSettingsChoice to
  /// determine if any conversion will be performed.
  final String colorSpace;

  /// Applies only if colorSpace is a value other than follow. This field
  /// controls how the value in the colorSpace field will be used. fallback
  /// means that when the input does include color space data, that data will be
  /// used, but when the input has no color space data, the value in colorSpace
  /// will be used. Choose fallback if your input is sometimes missing color
  /// space data, but when it does have color space data, that data is correct.
  /// force means to always use the value in colorSpace. Choose force if your
  /// input usually has no color space data or might have unreliable color space
  /// data.
  final String colorSpaceUsage;

  /// The video selector settings.
  final VideoSelectorSettings selectorSettings;

  VideoSelector({
    this.colorSpace,
    this.colorSpaceUsage,
    this.selectorSettings,
  });
  static VideoSelector fromJson(Map<String, dynamic> json) => VideoSelector(
        colorSpace: json.containsKey('ColorSpace')
            ? json['ColorSpace'] as String
            : null,
        colorSpaceUsage: json.containsKey('ColorSpaceUsage')
            ? json['ColorSpaceUsage'] as String
            : null,
        selectorSettings: json.containsKey('SelectorSettings')
            ? VideoSelectorSettings.fromJson(json['SelectorSettings'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Video Selector Pid
class VideoSelectorPid {
  /// Selects a specific PID from within a video source.
  final int pid;

  VideoSelectorPid({
    this.pid,
  });
  static VideoSelectorPid fromJson(Map<String, dynamic> json) =>
      VideoSelectorPid(
        pid: json.containsKey('Pid') ? json['Pid'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Video Selector Program Id
class VideoSelectorProgramId {
  /// Selects a specific program from within a multi-program transport stream.
  /// If the program doesn't exist, the first program within the transport
  /// stream will be selected by default.
  final int programId;

  VideoSelectorProgramId({
    this.programId,
  });
  static VideoSelectorProgramId fromJson(Map<String, dynamic> json) =>
      VideoSelectorProgramId(
        programId:
            json.containsKey('ProgramId') ? json['ProgramId'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Video Selector Settings
class VideoSelectorSettings {
  final VideoSelectorPid videoSelectorPid;

  final VideoSelectorProgramId videoSelectorProgramId;

  VideoSelectorSettings({
    this.videoSelectorPid,
    this.videoSelectorProgramId,
  });
  static VideoSelectorSettings fromJson(Map<String, dynamic> json) =>
      VideoSelectorSettings(
        videoSelectorPid: json.containsKey('VideoSelectorPid')
            ? VideoSelectorPid.fromJson(json['VideoSelectorPid'])
            : null,
        videoSelectorProgramId: json.containsKey('VideoSelectorProgramId')
            ? VideoSelectorProgramId.fromJson(json['VideoSelectorProgramId'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Webvtt Destination Settings
class WebvttDestinationSettings {
  WebvttDestinationSettings();
  static WebvttDestinationSettings fromJson(Map<String, dynamic> json) =>
      WebvttDestinationSettings();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
