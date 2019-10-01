import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS CloudTrail
///
/// This is the CloudTrail API Reference. It provides descriptions of actions,
/// data types, common parameters, and common errors for CloudTrail.
///
/// CloudTrail is a web service that records AWS API calls for your AWS account
/// and delivers log files to an Amazon S3 bucket. The recorded information
/// includes the identity of the user, the start time of the AWS API call, the
/// source IP address, the request parameters, and the response elements
/// returned by the service.
///
///  As an alternative to the API, you can use one of the AWS SDKs, which
/// consist of libraries and sample code for various programming languages and
/// platforms (Java, Ruby, .NET, iOS, Android, etc.). The SDKs provide a
/// convenient way to create programmatic access to AWSCloudTrail. For example,
/// the SDKs take care of cryptographically signing requests, managing errors,
/// and retrying requests automatically. For information about the AWS SDKs,
/// including how to download and install them, see the
/// [Tools for Amazon Web Services page](http://aws.amazon.com/tools/).
///
/// See the
/// [AWS CloudTrail User Guide](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
/// for information about the data that is included with each AWS API call
/// listed in the log files.
class CloudTrailApi {
  final _client;
  CloudTrailApi(client)
      : _client = client.configured('CloudTrail', serializer: 'json');

  /// Adds one or more tags to a trail, up to a limit of 50. Tags must be unique
  /// per trail. Overwrites an existing tag's value when a new value is
  /// specified for an existing tag key. If you specify a key without a value,
  /// the tag will be created with the specified key and a value of null. You
  /// can tag a trail that applies to all regions only from the region in which
  /// the trail was created (that is, from its home region).
  ///
  /// [resourceId]: Specifies the ARN of the trail to which one or more tags
  /// will be added. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// [tagsList]: Contains a list of CloudTrail tags, up to a limit of 50
  Future<AddTagsResponse> addTags(String resourceId,
      {List<Tag> tagsList}) async {
    var response_ = await _client.send('AddTags', {
      'ResourceId': resourceId,
      if (tagsList != null) 'TagsList': tagsList,
    });
    return AddTagsResponse.fromJson(response_);
  }

  /// Creates a trail that specifies the settings for delivery of log data to an
  /// Amazon S3 bucket. A maximum of five trails can exist in a region,
  /// irrespective of the region in which they were created.
  ///
  /// [name]: Specifies the name of the trail. The name must meet the following
  /// requirements:
  ///
  /// *   Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  ///
  /// *   Start with a letter or number, and end with a letter or number
  ///
  /// *   Be between 3 and 128 characters
  ///
  /// *   Have no adjacent periods, underscores or dashes. Names like
  /// `my-_namespace` and `my--namespace` are invalid.
  ///
  /// *   Not be in IP address format (for example, 192.168.5.4)
  ///
  /// [s3BucketName]: Specifies the name of the Amazon S3 bucket designated for
  /// publishing log files. See
  /// [Amazon S3 Bucket Naming Requirements](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html).
  ///
  /// [s3KeyPrefix]: Specifies the Amazon S3 key prefix that comes after the
  /// name of the bucket you have designated for log file delivery. For more
  /// information, see
  /// [Finding Your CloudTrail Log Files](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html).
  /// The maximum length is 200 characters.
  ///
  /// [snsTopicName]: Specifies the name of the Amazon SNS topic defined for
  /// notification of log file delivery. The maximum length is 256 characters.
  ///
  /// [includeGlobalServiceEvents]: Specifies whether the trail is publishing
  /// events from global services such as IAM to the log files.
  ///
  /// [isMultiRegionTrail]: Specifies whether the trail is created in the
  /// current region or in all regions. The default is false.
  ///
  /// [enableLogFileValidation]: Specifies whether log file integrity validation
  /// is enabled. The default is false.
  ///
  ///
  ///
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail will not create digest files for log
  /// files that were delivered during a period in which log file integrity
  /// validation was disabled. For example, if you enable log file integrity
  /// validation at noon on January 1, disable it at noon on January 2, and
  /// re-enable it at noon on January 10, digest files will not be created for
  /// the log files delivered from noon on January 2 to noon on January 10. The
  /// same applies whenever you stop CloudTrail logging or delete a trail.
  ///
  /// [cloudWatchLogsLogGroupArn]: Specifies a log group name using an Amazon
  /// Resource Name (ARN), a unique identifier that represents the log group to
  /// which CloudTrail logs will be delivered. Not required unless you specify
  /// CloudWatchLogsRoleArn.
  ///
  /// [cloudWatchLogsRoleArn]: Specifies the role for the CloudWatch Logs
  /// endpoint to assume to write to a user's log group.
  ///
  /// [kmsKeyId]: Specifies the KMS key ID to use to encrypt the logs delivered
  /// by CloudTrail. The value can be an alias name prefixed by "alias/", a
  /// fully specified ARN to an alias, a fully specified ARN to a key, or a
  /// globally unique identifier.
  ///
  /// Examples:
  ///
  /// *   alias/MyAliasName
  ///
  /// *   arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
  ///
  /// *
  /// arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
  ///
  /// *   12345678-1234-1234-1234-123456789012
  ///
  /// [isOrganizationTrail]: Specifies whether the trail is created for all
  /// accounts in an organization in AWS Organizations, or only for the current
  /// AWS account. The default is false, and cannot be true unless the call is
  /// made on behalf of an AWS account that is the master account for an
  /// organization in AWS Organizations.
  Future<CreateTrailResponse> createTrail(
      {@required String name,
      @required String s3BucketName,
      String s3KeyPrefix,
      String snsTopicName,
      bool includeGlobalServiceEvents,
      bool isMultiRegionTrail,
      bool enableLogFileValidation,
      String cloudWatchLogsLogGroupArn,
      String cloudWatchLogsRoleArn,
      String kmsKeyId,
      bool isOrganizationTrail}) async {
    var response_ = await _client.send('CreateTrail', {
      'Name': name,
      'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (enableLogFileValidation != null)
        'EnableLogFileValidation': enableLogFileValidation,
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
    });
    return CreateTrailResponse.fromJson(response_);
  }

  /// Deletes a trail. This operation must be called from the region in which
  /// the trail was created. `DeleteTrail` cannot be called on the shadow trails
  /// (replicated trails in other regions) of a trail that is enabled in all
  /// regions.
  ///
  /// [name]: Specifies the name or the CloudTrail ARN of the trail to be
  /// deleted. The format of a trail ARN is:
  /// `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  Future<DeleteTrailResponse> deleteTrail(String name) async {
    var response_ = await _client.send('DeleteTrail', {
      'Name': name,
    });
    return DeleteTrailResponse.fromJson(response_);
  }

  /// Retrieves settings for the trail associated with the current region for
  /// your account.
  ///
  /// [trailNameList]: Specifies a list of trail names, trail ARNs, or both, of
  /// the trails to describe. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// If an empty list is specified, information for the trail in the current
  /// region is returned.
  ///
  /// *   If an empty list is specified and `IncludeShadowTrails` is false, then
  /// information for all trails in the current region is returned.
  ///
  /// *   If an empty list is specified and IncludeShadowTrails is null or true,
  /// then information for all trails in the current region and any associated
  /// shadow trails in other regions is returned.
  ///
  ///
  ///
  ///
  /// If one or more trail names are specified, information is returned only if
  /// the names match the names of trails belonging only to the current region.
  /// To return information about a trail in another region, you must specify
  /// its trail ARN.
  ///
  /// [includeShadowTrails]: Specifies whether to include shadow trails in the
  /// response. A shadow trail is the replication in a region of a trail that
  /// was created in a different region, or in the case of an organization
  /// trail, the replication of an organization trail in member accounts. If you
  /// do not include shadow trails, organization trails in a member account and
  /// region replication trails will not be returned. The default is true.
  Future<DescribeTrailsResponse> describeTrails(
      {List<String> trailNameList, bool includeShadowTrails}) async {
    var response_ = await _client.send('DescribeTrails', {
      if (trailNameList != null) 'trailNameList': trailNameList,
      if (includeShadowTrails != null)
        'includeShadowTrails': includeShadowTrails,
    });
    return DescribeTrailsResponse.fromJson(response_);
  }

  /// Describes the settings for the event selectors that you configured for
  /// your trail. The information returned for your event selectors includes the
  /// following:
  ///
  /// *   If your event selector includes read-only events, write-only events,
  /// or all events. This applies to both management events and data events.
  ///
  /// *   If your event selector includes management events.
  ///
  /// *   If your event selector includes data events, the Amazon S3 objects or
  /// AWS Lambda functions that you are logging for data events.
  ///
  ///
  /// For more information, see
  /// [Logging Data and Management Events for Trails](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html)
  ///  in the _AWS CloudTrail User Guide_.
  ///
  /// [trailName]: Specifies the name of the trail or trail ARN. If you specify
  /// a trail name, the string must meet the following requirements:
  ///
  /// *   Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  ///
  /// *   Start with a letter or number, and end with a letter or number
  ///
  /// *   Be between 3 and 128 characters
  ///
  /// *   Have no adjacent periods, underscores or dashes. Names like
  /// `my-_namespace` and `my--namespace` are not valid.
  ///
  /// *   Not be in IP address format (for example, 192.168.5.4)
  ///
  ///
  /// If you specify a trail ARN, it must be in the format:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  Future<GetEventSelectorsResponse> getEventSelectors(String trailName) async {
    var response_ = await _client.send('GetEventSelectors', {
      'TrailName': trailName,
    });
    return GetEventSelectorsResponse.fromJson(response_);
  }

  /// Returns a JSON-formatted list of information about the specified trail.
  /// Fields include information on delivery errors, Amazon SNS and Amazon S3
  /// errors, and start and stop logging times for each trail. This operation
  /// returns trail status from a single region. To return trail status from all
  /// regions, you must call the operation on each region.
  ///
  /// [name]: Specifies the name or the CloudTrail ARN of the trail for which
  /// you are requesting status. To get the status of a shadow trail (a
  /// replication of the trail in another region), you must specify its ARN. The
  /// format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  Future<GetTrailStatusResponse> getTrailStatus(String name) async {
    var response_ = await _client.send('GetTrailStatus', {
      'Name': name,
    });
    return GetTrailStatusResponse.fromJson(response_);
  }

  /// Returns all public keys whose private keys were used to sign the digest
  /// files within the specified time range. The public key is needed to
  /// validate digest files that were signed with its corresponding private key.
  ///
  ///
  ///
  /// CloudTrail uses different private/public key pairs per region. Each digest
  /// file is signed with a private key unique to its region. Therefore, when
  /// you validate a digest file from a particular region, you must look in the
  /// same region for its corresponding public key.
  ///
  /// [startTime]: Optionally specifies, in UTC, the start of the time range to
  /// look up public keys for CloudTrail digest files. If not specified, the
  /// current time is used, and the current public key is returned.
  ///
  /// [endTime]: Optionally specifies, in UTC, the end of the time range to look
  /// up public keys for CloudTrail digest files. If not specified, the current
  /// time is used.
  ///
  /// [nextToken]: Reserved for future use.
  Future<ListPublicKeysResponse> listPublicKeys(
      {DateTime startTime, DateTime endTime, String nextToken}) async {
    var response_ = await _client.send('ListPublicKeys', {
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListPublicKeysResponse.fromJson(response_);
  }

  /// Lists the tags for the trail in the current region.
  ///
  /// [resourceIdList]: Specifies a list of trail ARNs whose tags will be
  /// listed. The list has a limit of 20 ARNs. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// [nextToken]: Reserved for future use.
  Future<ListTagsResponse> listTags(List<String> resourceIdList,
      {String nextToken}) async {
    var response_ = await _client.send('ListTags', {
      'ResourceIdList': resourceIdList,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsResponse.fromJson(response_);
  }

  /// Looks up
  /// [management events](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events)
  /// captured by CloudTrail. Events for a region can be looked up in that
  /// region during the last 90 days. Lookup supports the following attributes:
  ///
  /// *   AWS access key
  ///
  /// *   Event ID
  ///
  /// *   Event name
  ///
  /// *   Event source
  ///
  /// *   Read only
  ///
  /// *   Resource name
  ///
  /// *   Resource type
  ///
  /// *   User name
  ///
  ///
  /// All attributes are optional. The default number of results returned is 50,
  /// with a maximum of 50 possible. The response includes a token that you can
  /// use to get the next page of results.
  ///
  ///  The rate of lookup requests is limited to one per second per account. If
  /// this limit is exceeded, a throttling error occurs.
  ///
  /// Events that occurred during the selected time range will not be available
  /// for lookup if CloudTrail logging was not enabled when the events occurred.
  ///
  /// [lookupAttributes]: Contains a list of lookup attributes. Currently the
  /// list can contain only one item.
  ///
  /// [startTime]: Specifies that only events that occur after or at the
  /// specified time are returned. If the specified start time is after the
  /// specified end time, an error is returned.
  ///
  /// [endTime]: Specifies that only events that occur before or at the
  /// specified time are returned. If the specified end time is before the
  /// specified start time, an error is returned.
  ///
  /// [maxResults]: The number of events to return. Possible values are 1
  /// through 50. The default is 50.
  ///
  /// [nextToken]: The token to use to get the next page of results after a
  /// previous API call. This token must be passed in with the same parameters
  /// that were specified in the the original call. For example, if the original
  /// call specified an AttributeKey of 'Username' with a value of 'root', the
  /// call with NextToken should include those same parameters.
  Future<LookupEventsResponse> lookupEvents(
      {List<LookupAttribute> lookupAttributes,
      DateTime startTime,
      DateTime endTime,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('LookupEvents', {
      if (lookupAttributes != null) 'LookupAttributes': lookupAttributes,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return LookupEventsResponse.fromJson(response_);
  }

  /// Configures an event selector for your trail. Use event selectors to
  /// further specify the management and data event settings for your trail. By
  /// default, trails created without specific event selectors will be
  /// configured to log all read and write management events, and no data
  /// events.
  ///
  /// When an event occurs in your account, CloudTrail evaluates the event
  /// selectors in all trails. For each trail, if the event matches any event
  /// selector, the trail processes and logs the event. If the event doesn't
  /// match any event selector, the trail doesn't log the event.
  ///
  /// Example
  ///
  /// 1.  You create an event selector for a trail and specify that you want
  /// write-only events.
  ///
  /// 2.  The EC2 `GetConsoleOutput` and `RunInstances` API operations occur in
  /// your account.
  ///
  /// 3.  CloudTrail evaluates whether the events match your event selectors.
  ///
  /// 4.  The `RunInstances` is a write-only event and it matches your event
  /// selector. The trail logs the event.
  ///
  /// 5.  The `GetConsoleOutput` is a read-only event but it doesn't match your
  /// event selector. The trail doesn't log the event.
  ///
  ///
  /// The `PutEventSelectors` operation must be called from the region in which
  /// the trail was created; otherwise, an `InvalidHomeRegionException` is
  /// thrown.
  ///
  /// You can configure up to five event selectors for each trail. For more
  /// information, see
  /// [Logging Data and Management Events for Trails](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html)
  ///  and
  /// [Limits in AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html)
  /// in the _AWS CloudTrail User Guide_.
  ///
  /// [trailName]: Specifies the name of the trail or trail ARN. If you specify
  /// a trail name, the string must meet the following requirements:
  ///
  /// *   Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  ///
  /// *   Start with a letter or number, and end with a letter or number
  ///
  /// *   Be between 3 and 128 characters
  ///
  /// *   Have no adjacent periods, underscores or dashes. Names like
  /// `my-_namespace` and `my--namespace` are invalid.
  ///
  /// *   Not be in IP address format (for example, 192.168.5.4)
  ///
  ///
  /// If you specify a trail ARN, it must be in the format:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// [eventSelectors]: Specifies the settings for your event selectors. You can
  /// configure up to five event selectors for a trail.
  Future<PutEventSelectorsResponse> putEventSelectors(
      {@required String trailName,
      @required List<EventSelector> eventSelectors}) async {
    var response_ = await _client.send('PutEventSelectors', {
      'TrailName': trailName,
      'EventSelectors': eventSelectors,
    });
    return PutEventSelectorsResponse.fromJson(response_);
  }

  /// Removes the specified tags from a trail.
  ///
  /// [resourceId]: Specifies the ARN of the trail from which tags should be
  /// removed. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// [tagsList]: Specifies a list of tags to be removed.
  Future<RemoveTagsResponse> removeTags(String resourceId,
      {List<Tag> tagsList}) async {
    var response_ = await _client.send('RemoveTags', {
      'ResourceId': resourceId,
      if (tagsList != null) 'TagsList': tagsList,
    });
    return RemoveTagsResponse.fromJson(response_);
  }

  /// Starts the recording of AWS API calls and log file delivery for a trail.
  /// For a trail that is enabled in all regions, this operation must be called
  /// from the region in which the trail was created. This operation cannot be
  /// called on the shadow trails (replicated trails in other regions) of a
  /// trail that is enabled in all regions.
  ///
  /// [name]: Specifies the name or the CloudTrail ARN of the trail for which
  /// CloudTrail logs AWS API calls. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  Future<StartLoggingResponse> startLogging(String name) async {
    var response_ = await _client.send('StartLogging', {
      'Name': name,
    });
    return StartLoggingResponse.fromJson(response_);
  }

  /// Suspends the recording of AWS API calls and log file delivery for the
  /// specified trail. Under most circumstances, there is no need to use this
  /// action. You can update a trail without stopping it first. This action is
  /// the only way to stop recording. For a trail enabled in all regions, this
  /// operation must be called from the region in which the trail was created,
  /// or an `InvalidHomeRegionException` will occur. This operation cannot be
  /// called on the shadow trails (replicated trails in other regions) of a
  /// trail enabled in all regions.
  ///
  /// [name]: Specifies the name or the CloudTrail ARN of the trail for which
  /// CloudTrail will stop logging AWS API calls. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  Future<StopLoggingResponse> stopLogging(String name) async {
    var response_ = await _client.send('StopLogging', {
      'Name': name,
    });
    return StopLoggingResponse.fromJson(response_);
  }

  /// Updates the settings that specify delivery of log files. Changes to a
  /// trail do not require stopping the CloudTrail service. Use this action to
  /// designate an existing bucket for log delivery. If the existing bucket has
  /// previously been a target for CloudTrail log files, an IAM policy exists
  /// for the bucket. `UpdateTrail` must be called from the region in which the
  /// trail was created; otherwise, an `InvalidHomeRegionException` is thrown.
  ///
  /// [name]: Specifies the name of the trail or trail ARN. If `Name` is a trail
  /// name, the string must meet the following requirements:
  ///
  /// *   Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
  /// underscores (_), or dashes (-)
  ///
  /// *   Start with a letter or number, and end with a letter or number
  ///
  /// *   Be between 3 and 128 characters
  ///
  /// *   Have no adjacent periods, underscores or dashes. Names like
  /// `my-_namespace` and `my--namespace` are invalid.
  ///
  /// *   Not be in IP address format (for example, 192.168.5.4)
  ///
  ///
  /// If `Name` is a trail ARN, it must be in the format:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  ///
  /// [s3BucketName]: Specifies the name of the Amazon S3 bucket designated for
  /// publishing log files. See
  /// [Amazon S3 Bucket Naming Requirements](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html).
  ///
  /// [s3KeyPrefix]: Specifies the Amazon S3 key prefix that comes after the
  /// name of the bucket you have designated for log file delivery. For more
  /// information, see
  /// [Finding Your CloudTrail Log Files](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html).
  /// The maximum length is 200 characters.
  ///
  /// [snsTopicName]: Specifies the name of the Amazon SNS topic defined for
  /// notification of log file delivery. The maximum length is 256 characters.
  ///
  /// [includeGlobalServiceEvents]: Specifies whether the trail is publishing
  /// events from global services such as IAM to the log files.
  ///
  /// [isMultiRegionTrail]: Specifies whether the trail applies only to the
  /// current region or to all regions. The default is false. If the trail
  /// exists only in the current region and this value is set to true, shadow
  /// trails (replications of the trail) will be created in the other regions.
  /// If the trail exists in all regions and this value is set to false, the
  /// trail will remain in the region where it was created, and its shadow
  /// trails in other regions will be deleted.
  ///
  /// [enableLogFileValidation]: Specifies whether log file validation is
  /// enabled. The default is false.
  ///
  ///
  ///
  /// When you disable log file integrity validation, the chain of digest files
  /// is broken after one hour. CloudTrail will not create digest files for log
  /// files that were delivered during a period in which log file integrity
  /// validation was disabled. For example, if you enable log file integrity
  /// validation at noon on January 1, disable it at noon on January 2, and
  /// re-enable it at noon on January 10, digest files will not be created for
  /// the log files delivered from noon on January 2 to noon on January 10. The
  /// same applies whenever you stop CloudTrail logging or delete a trail.
  ///
  /// [cloudWatchLogsLogGroupArn]: Specifies a log group name using an Amazon
  /// Resource Name (ARN), a unique identifier that represents the log group to
  /// which CloudTrail logs will be delivered. Not required unless you specify
  /// CloudWatchLogsRoleArn.
  ///
  /// [cloudWatchLogsRoleArn]: Specifies the role for the CloudWatch Logs
  /// endpoint to assume to write to a user's log group.
  ///
  /// [kmsKeyId]: Specifies the KMS key ID to use to encrypt the logs delivered
  /// by CloudTrail. The value can be an alias name prefixed by "alias/", a
  /// fully specified ARN to an alias, a fully specified ARN to a key, or a
  /// globally unique identifier.
  ///
  /// Examples:
  ///
  /// *   alias/MyAliasName
  ///
  /// *   arn:aws:kms:us-east-2:123456789012:alias/MyAliasName
  ///
  /// *
  /// arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012
  ///
  /// *   12345678-1234-1234-1234-123456789012
  ///
  /// [isOrganizationTrail]: Specifies whether the trail is applied to all
  /// accounts in an organization in AWS Organizations, or only for the current
  /// AWS account. The default is false, and cannot be true unless the call is
  /// made on behalf of an AWS account that is the master account for an
  /// organization in AWS Organizations. If the trail is not an organization
  /// trail and this is set to true, the trail will be created in all AWS
  /// accounts that belong to the organization. If the trail is an organization
  /// trail and this is set to false, the trail will remain in the current AWS
  /// account but be deleted from all member accounts in the organization.
  Future<UpdateTrailResponse> updateTrail(String name,
      {String s3BucketName,
      String s3KeyPrefix,
      String snsTopicName,
      bool includeGlobalServiceEvents,
      bool isMultiRegionTrail,
      bool enableLogFileValidation,
      String cloudWatchLogsLogGroupArn,
      String cloudWatchLogsRoleArn,
      String kmsKeyId,
      bool isOrganizationTrail}) async {
    var response_ = await _client.send('UpdateTrail', {
      'Name': name,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
      if (snsTopicName != null) 'SnsTopicName': snsTopicName,
      if (includeGlobalServiceEvents != null)
        'IncludeGlobalServiceEvents': includeGlobalServiceEvents,
      if (isMultiRegionTrail != null) 'IsMultiRegionTrail': isMultiRegionTrail,
      if (enableLogFileValidation != null)
        'EnableLogFileValidation': enableLogFileValidation,
      if (cloudWatchLogsLogGroupArn != null)
        'CloudWatchLogsLogGroupArn': cloudWatchLogsLogGroupArn,
      if (cloudWatchLogsRoleArn != null)
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (isOrganizationTrail != null)
        'IsOrganizationTrail': isOrganizationTrail,
    });
    return UpdateTrailResponse.fromJson(response_);
  }
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class AddTagsResponse {
  AddTagsResponse();
  static AddTagsResponse fromJson(Map<String, dynamic> json) =>
      AddTagsResponse();
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class CreateTrailResponse {
  /// Specifies the name of the trail.
  final String name;

  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files.
  final String s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see
  /// [Finding Your CloudTrail Log Files](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html).
  final String s3KeyPrefix;

  /// This field is deprecated. Use SnsTopicARN.
  final String snsTopicName;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  ///  `arn:aws:sns:us-east-2:123456789012:MyTopic`
  final String snsTopicArn;

  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  final bool includeGlobalServiceEvents;

  /// Specifies whether the trail exists in one region or in all regions.
  final bool isMultiRegionTrail;

  /// Specifies the ARN of the trail that was created. The format of a trail ARN
  /// is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  final String trailArn;

  /// Specifies whether log file integrity validation is enabled.
  final bool logFileValidationEnabled;

  /// Specifies the Amazon Resource Name (ARN) of the log group to which
  /// CloudTrail logs will be delivered.
  final String cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group.
  final String cloudWatchLogsRoleArn;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the format:
  ///
  ///
  /// `arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012`
  final String kmsKeyId;

  /// Specifies whether the trail is an organization trail.
  final bool isOrganizationTrail;

  CreateTrailResponse({
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicName,
    this.snsTopicArn,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.trailArn,
    this.logFileValidationEnabled,
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.kmsKeyId,
    this.isOrganizationTrail,
  });
  static CreateTrailResponse fromJson(Map<String, dynamic> json) =>
      CreateTrailResponse(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        s3BucketName: json.containsKey('S3BucketName')
            ? json['S3BucketName'] as String
            : null,
        s3KeyPrefix: json.containsKey('S3KeyPrefix')
            ? json['S3KeyPrefix'] as String
            : null,
        snsTopicName: json.containsKey('SnsTopicName')
            ? json['SnsTopicName'] as String
            : null,
        snsTopicArn: json.containsKey('SnsTopicARN')
            ? json['SnsTopicARN'] as String
            : null,
        includeGlobalServiceEvents:
            json.containsKey('IncludeGlobalServiceEvents')
                ? json['IncludeGlobalServiceEvents'] as bool
                : null,
        isMultiRegionTrail: json.containsKey('IsMultiRegionTrail')
            ? json['IsMultiRegionTrail'] as bool
            : null,
        trailArn:
            json.containsKey('TrailARN') ? json['TrailARN'] as String : null,
        logFileValidationEnabled: json.containsKey('LogFileValidationEnabled')
            ? json['LogFileValidationEnabled'] as bool
            : null,
        cloudWatchLogsLogGroupArn: json.containsKey('CloudWatchLogsLogGroupArn')
            ? json['CloudWatchLogsLogGroupArn'] as String
            : null,
        cloudWatchLogsRoleArn: json.containsKey('CloudWatchLogsRoleArn')
            ? json['CloudWatchLogsRoleArn'] as String
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        isOrganizationTrail: json.containsKey('IsOrganizationTrail')
            ? json['IsOrganizationTrail'] as bool
            : null,
      );
}

/// The Amazon S3 buckets or AWS Lambda functions that you specify in your event
/// selectors for your trail to log data events. Data events provide insight
/// into the resource operations performed on or within a resource itself. These
/// are also known as data plane operations. You can specify up to 250 data
/// resources for a trail.
///
///  The total number of allowed data resources is 250. This number can be
/// distributed between 1 and 5 event selectors, but the total cannot exceed 250
/// across all selectors.
///
/// The following example demonstrates how logging works when you configure
/// logging of all data events for an S3 bucket named `bucket-1`. In this
/// example, the CloudTrail user spcified an empty prefix, and the option to log
/// both `Read` and `Write` data events.
///
/// 1.  A user uploads an image file to `bucket-1`.
///
/// 2.  The `PutObject` API operation is an Amazon S3 object-level API. It is
/// recorded as a data event in CloudTrail. Because the CloudTrail user
/// specified an S3 bucket with an empty prefix, events that occur on any object
/// in that bucket are logged. The trail processes and logs the event.
///
/// 3.  A user uploads an object to an Amazon S3 bucket named
/// `arn:aws:s3:::bucket-2`.
///
/// 4.  The `PutObject` API operation occurred for an object in an S3 bucket
/// that the CloudTrail user didn't specify for the trail. The trail doesn’t log
/// the event.
///
///
/// The following example demonstrates how logging works when you configure
/// logging of AWS Lambda data events for a Lambda function named
/// _MyLambdaFunction_, but not for all AWS Lambda functions.
///
/// 1.  A user runs a script that includes a call to the _MyLambdaFunction_
/// function and the _MyOtherLambdaFunction_ function.
///
/// 2.  The `Invoke` API operation on _MyLambdaFunction_ is an AWS Lambda API.
/// It is recorded as a data event in CloudTrail. Because the CloudTrail user
/// specified logging data events for _MyLambdaFunction_, any invocations of
/// that function are logged. The trail processes and logs the event.
///
/// 3.  The `Invoke` API operation on _MyOtherLambdaFunction_ is an AWS Lambda
/// API. Because the CloudTrail user did not specify logging data events for all
/// Lambda functions, the `Invoke` operation for _MyOtherLambdaFunction_ does
/// not match the function specified for the trail. The trail doesn’t log the
/// event.
class DataResource {
  /// The resource type in which you want to log data events. You can specify
  /// `AWS::S3::Object` or `AWS::Lambda::Function` resources.
  final String type;

  /// An array of Amazon Resource Name (ARN) strings or partial ARN strings for
  /// the specified objects.
  ///
  /// *   To log data events for all objects in all S3 buckets in your AWS
  /// account, specify the prefix as `arn:aws:s3:::`.
  ///
  ///      This will also enable logging of data event activity performed by any
  /// user or role in your AWS account, even if that activity is performed on a
  /// bucket that belongs to another AWS account.
  /// *   To log data events for all objects in all S3 buckets that include
  /// _my-bucket_ in their names, specify the prefix as `aws:s3:::my-bucket`.
  /// The trail logs data events for all objects in all buckets whose name
  /// contains a match for _my-bucket_.
  ///
  /// *   To log data events for all objects in an S3 bucket, specify the bucket
  /// and an empty object prefix such as `arn:aws:s3:::bucket-1/`. The trail
  /// logs data events for all objects in this S3 bucket.
  ///
  /// *   To log data events for specific objects, specify the S3 bucket and
  /// object prefix such as `arn:aws:s3:::bucket-1/example-images`. The trail
  /// logs data events for objects in this S3 bucket that match the prefix.
  ///
  /// *   To log data events for all functions in your AWS account, specify the
  /// prefix as `arn:aws:lambda`.
  ///
  ///      This will also enable logging of `Invoke` activity performed by any
  /// user or role in your AWS account, even if that activity is performed on a
  /// function that belongs to another AWS account.
  /// *   To log data eents for a specific Lambda function, specify the function
  /// ARN.
  ///
  ///      Lambda function ARNs are exact. Unlike S3, you cannot use matching.
  /// For example, if you specify a function ARN
  /// _arn:aws:lambda:us-west-2:111111111111:function:helloworld_, data events
  /// will only be logged for
  /// _arn:aws:lambda:us-west-2:111111111111:function:helloworld_. They will not
  /// be logged for
  /// _arn:aws:lambda:us-west-2:111111111111:function:helloworld2_.
  final List<String> values;

  DataResource({
    this.type,
    this.values,
  });
  static DataResource fromJson(Map<String, dynamic> json) => DataResource(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        values: json.containsKey('Values')
            ? (json['Values'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class DeleteTrailResponse {
  DeleteTrailResponse();
  static DeleteTrailResponse fromJson(Map<String, dynamic> json) =>
      DeleteTrailResponse();
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class DescribeTrailsResponse {
  /// The list of trail objects.
  final List<Trail> trailList;

  DescribeTrailsResponse({
    this.trailList,
  });
  static DescribeTrailsResponse fromJson(Map<String, dynamic> json) =>
      DescribeTrailsResponse(
        trailList: json.containsKey('trailList')
            ? (json['trailList'] as List).map((e) => Trail.fromJson(e)).toList()
            : null,
      );
}

/// Contains information about an event that was returned by a lookup request.
/// The result includes a representation of a CloudTrail event.
class Event {
  /// The CloudTrail ID of the event returned.
  final String eventId;

  /// The name of the event returned.
  final String eventName;

  /// Information about whether the event is a write event or a read event.
  final String readOnly;

  /// The AWS access key ID that was used to sign the request. If the request
  /// was made with temporary security credentials, this is the access key ID of
  /// the temporary credentials.
  final String accessKeyId;

  /// The date and time of the event returned.
  final DateTime eventTime;

  /// The AWS service that the request was made to.
  final String eventSource;

  /// A user name or role name of the requester that called the API in the event
  /// returned.
  final String username;

  /// A list of resources referenced by the event returned.
  final List<Resource> resources;

  /// A JSON string that contains a representation of the event returned.
  final String cloudTrailEvent;

  Event({
    this.eventId,
    this.eventName,
    this.readOnly,
    this.accessKeyId,
    this.eventTime,
    this.eventSource,
    this.username,
    this.resources,
    this.cloudTrailEvent,
  });
  static Event fromJson(Map<String, dynamic> json) => Event(
        eventId: json.containsKey('EventId') ? json['EventId'] as String : null,
        eventName:
            json.containsKey('EventName') ? json['EventName'] as String : null,
        readOnly:
            json.containsKey('ReadOnly') ? json['ReadOnly'] as String : null,
        accessKeyId: json.containsKey('AccessKeyId')
            ? json['AccessKeyId'] as String
            : null,
        eventTime: json.containsKey('EventTime')
            ? DateTime.parse(json['EventTime'])
            : null,
        eventSource: json.containsKey('EventSource')
            ? json['EventSource'] as String
            : null,
        username:
            json.containsKey('Username') ? json['Username'] as String : null,
        resources: json.containsKey('Resources')
            ? (json['Resources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
        cloudTrailEvent: json.containsKey('CloudTrailEvent')
            ? json['CloudTrailEvent'] as String
            : null,
      );
}

/// Use event selectors to further specify the management and data event
/// settings for your trail. By default, trails created without specific event
/// selectors will be configured to log all read and write management events,
/// and no data events. When an event occurs in your account, CloudTrail
/// evaluates the event selector for all trails. For each trail, if the event
/// matches any event selector, the trail processes and logs the event. If the
/// event doesn't match any event selector, the trail doesn't log the event.
///
/// You can configure up to five event selectors for a trail.
class EventSelector {
  /// Specify if you want your trail to log read-only events, write-only events,
  /// or all. For example, the EC2 `GetConsoleOutput` is a read-only API
  /// operation and `RunInstances` is a write-only API operation.
  ///
  ///  By default, the value is `All`.
  final String readWriteType;

  /// Specify if you want your event selector to include management events for
  /// your trail.
  ///
  ///  For more information, see
  /// [Management Events](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html#logging-management-events)
  /// in the _AWS CloudTrail User Guide_.
  ///
  /// By default, the value is `true`.
  final bool includeManagementEvents;

  /// CloudTrail supports data event logging for Amazon S3 objects and AWS
  /// Lambda functions. You can specify up to 250 resources for an individual
  /// event selector, but the total number of data resources cannot exceed 250
  /// across all event selectors in a trail. This limit does not apply if you
  /// configure resource logging for all data events.
  ///
  /// For more information, see
  /// [Data Events](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-and-data-events-with-cloudtrail.html#logging-data-events)
  /// and
  /// [Limits in AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html)
  /// in the _AWS CloudTrail User Guide_.
  final List<DataResource> dataResources;

  EventSelector({
    this.readWriteType,
    this.includeManagementEvents,
    this.dataResources,
  });
  static EventSelector fromJson(Map<String, dynamic> json) => EventSelector(
        readWriteType: json.containsKey('ReadWriteType')
            ? json['ReadWriteType'] as String
            : null,
        includeManagementEvents: json.containsKey('IncludeManagementEvents')
            ? json['IncludeManagementEvents'] as bool
            : null,
        dataResources: json.containsKey('DataResources')
            ? (json['DataResources'] as List)
                .map((e) => DataResource.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetEventSelectorsResponse {
  /// The specified trail ARN that has the event selectors.
  final String trailArn;

  /// The event selectors that are configured for the trail.
  final List<EventSelector> eventSelectors;

  GetEventSelectorsResponse({
    this.trailArn,
    this.eventSelectors,
  });
  static GetEventSelectorsResponse fromJson(Map<String, dynamic> json) =>
      GetEventSelectorsResponse(
        trailArn:
            json.containsKey('TrailARN') ? json['TrailARN'] as String : null,
        eventSelectors: json.containsKey('EventSelectors')
            ? (json['EventSelectors'] as List)
                .map((e) => EventSelector.fromJson(e))
                .toList()
            : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class GetTrailStatusResponse {
  /// Whether the CloudTrail is currently logging AWS API calls.
  final bool isLogging;

  /// Displays any Amazon S3 error that CloudTrail encountered when attempting
  /// to deliver log files to the designated bucket. For more information see
  /// the topic
  /// [Error Responses](http://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html)
  /// in the Amazon S3 API Reference.
  ///
  ///
  ///
  /// This error occurs only when there is a problem with the destination S3
  /// bucket and will not occur for timeouts. To resolve the issue, create a new
  /// bucket and call `UpdateTrail` to specify the new bucket, or fix the
  /// existing objects so that CloudTrail can again write to the bucket.
  final String latestDeliveryError;

  /// Displays any Amazon SNS error that CloudTrail encountered when attempting
  /// to send a notification. For more information about Amazon SNS errors, see
  /// the
  /// [Amazon SNS Developer Guide](http://docs.aws.amazon.com/sns/latest/dg/welcome.html).
  final String latestNotificationError;

  /// Specifies the date and time that CloudTrail last delivered log files to an
  /// account's Amazon S3 bucket.
  final DateTime latestDeliveryTime;

  /// Specifies the date and time of the most recent Amazon SNS notification
  /// that CloudTrail has written a new log file to an account's Amazon S3
  /// bucket.
  final DateTime latestNotificationTime;

  /// Specifies the most recent date and time when CloudTrail started recording
  /// API calls for an AWS account.
  final DateTime startLoggingTime;

  /// Specifies the most recent date and time when CloudTrail stopped recording
  /// API calls for an AWS account.
  final DateTime stopLoggingTime;

  /// Displays any CloudWatch Logs error that CloudTrail encountered when
  /// attempting to deliver logs to CloudWatch Logs.
  final String latestCloudWatchLogsDeliveryError;

  /// Displays the most recent date and time when CloudTrail delivered logs to
  /// CloudWatch Logs.
  final DateTime latestCloudWatchLogsDeliveryTime;

  /// Specifies the date and time that CloudTrail last delivered a digest file
  /// to an account's Amazon S3 bucket.
  final DateTime latestDigestDeliveryTime;

  /// Displays any Amazon S3 error that CloudTrail encountered when attempting
  /// to deliver a digest file to the designated bucket. For more information
  /// see the topic
  /// [Error Responses](http://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html)
  /// in the Amazon S3 API Reference.
  ///
  ///
  ///
  /// This error occurs only when there is a problem with the destination S3
  /// bucket and will not occur for timeouts. To resolve the issue, create a new
  /// bucket and call `UpdateTrail` to specify the new bucket, or fix the
  /// existing objects so that CloudTrail can again write to the bucket.
  final String latestDigestDeliveryError;

  /// This field is deprecated.
  final String latestDeliveryAttemptTime;

  /// This field is deprecated.
  final String latestNotificationAttemptTime;

  /// This field is deprecated.
  final String latestNotificationAttemptSucceeded;

  /// This field is deprecated.
  final String latestDeliveryAttemptSucceeded;

  /// This field is deprecated.
  final String timeLoggingStarted;

  /// This field is deprecated.
  final String timeLoggingStopped;

  GetTrailStatusResponse({
    this.isLogging,
    this.latestDeliveryError,
    this.latestNotificationError,
    this.latestDeliveryTime,
    this.latestNotificationTime,
    this.startLoggingTime,
    this.stopLoggingTime,
    this.latestCloudWatchLogsDeliveryError,
    this.latestCloudWatchLogsDeliveryTime,
    this.latestDigestDeliveryTime,
    this.latestDigestDeliveryError,
    this.latestDeliveryAttemptTime,
    this.latestNotificationAttemptTime,
    this.latestNotificationAttemptSucceeded,
    this.latestDeliveryAttemptSucceeded,
    this.timeLoggingStarted,
    this.timeLoggingStopped,
  });
  static GetTrailStatusResponse fromJson(Map<String, dynamic> json) =>
      GetTrailStatusResponse(
        isLogging:
            json.containsKey('IsLogging') ? json['IsLogging'] as bool : null,
        latestDeliveryError: json.containsKey('LatestDeliveryError')
            ? json['LatestDeliveryError'] as String
            : null,
        latestNotificationError: json.containsKey('LatestNotificationError')
            ? json['LatestNotificationError'] as String
            : null,
        latestDeliveryTime: json.containsKey('LatestDeliveryTime')
            ? DateTime.parse(json['LatestDeliveryTime'])
            : null,
        latestNotificationTime: json.containsKey('LatestNotificationTime')
            ? DateTime.parse(json['LatestNotificationTime'])
            : null,
        startLoggingTime: json.containsKey('StartLoggingTime')
            ? DateTime.parse(json['StartLoggingTime'])
            : null,
        stopLoggingTime: json.containsKey('StopLoggingTime')
            ? DateTime.parse(json['StopLoggingTime'])
            : null,
        latestCloudWatchLogsDeliveryError:
            json.containsKey('LatestCloudWatchLogsDeliveryError')
                ? json['LatestCloudWatchLogsDeliveryError'] as String
                : null,
        latestCloudWatchLogsDeliveryTime:
            json.containsKey('LatestCloudWatchLogsDeliveryTime')
                ? DateTime.parse(json['LatestCloudWatchLogsDeliveryTime'])
                : null,
        latestDigestDeliveryTime: json.containsKey('LatestDigestDeliveryTime')
            ? DateTime.parse(json['LatestDigestDeliveryTime'])
            : null,
        latestDigestDeliveryError: json.containsKey('LatestDigestDeliveryError')
            ? json['LatestDigestDeliveryError'] as String
            : null,
        latestDeliveryAttemptTime: json.containsKey('LatestDeliveryAttemptTime')
            ? json['LatestDeliveryAttemptTime'] as String
            : null,
        latestNotificationAttemptTime:
            json.containsKey('LatestNotificationAttemptTime')
                ? json['LatestNotificationAttemptTime'] as String
                : null,
        latestNotificationAttemptSucceeded:
            json.containsKey('LatestNotificationAttemptSucceeded')
                ? json['LatestNotificationAttemptSucceeded'] as String
                : null,
        latestDeliveryAttemptSucceeded:
            json.containsKey('LatestDeliveryAttemptSucceeded')
                ? json['LatestDeliveryAttemptSucceeded'] as String
                : null,
        timeLoggingStarted: json.containsKey('TimeLoggingStarted')
            ? json['TimeLoggingStarted'] as String
            : null,
        timeLoggingStopped: json.containsKey('TimeLoggingStopped')
            ? json['TimeLoggingStopped'] as String
            : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class ListPublicKeysResponse {
  /// Contains an array of PublicKey objects.
  ///
  ///
  ///
  /// The returned public keys may have validity time ranges that overlap.
  final List<PublicKey> publicKeyList;

  /// Reserved for future use.
  final String nextToken;

  ListPublicKeysResponse({
    this.publicKeyList,
    this.nextToken,
  });
  static ListPublicKeysResponse fromJson(Map<String, dynamic> json) =>
      ListPublicKeysResponse(
        publicKeyList: json.containsKey('PublicKeyList')
            ? (json['PublicKeyList'] as List)
                .map((e) => PublicKey.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class ListTagsResponse {
  /// A list of resource tags.
  final List<ResourceTag> resourceTagList;

  /// Reserved for future use.
  final String nextToken;

  ListTagsResponse({
    this.resourceTagList,
    this.nextToken,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse(
        resourceTagList: json.containsKey('ResourceTagList')
            ? (json['ResourceTagList'] as List)
                .map((e) => ResourceTag.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Specifies an attribute and value that filter the events returned.
class LookupAttribute {
  /// Specifies an attribute on which to filter the events returned.
  final String attributeKey;

  /// Specifies a value for the specified AttributeKey.
  final String attributeValue;

  LookupAttribute({
    @required this.attributeKey,
    @required this.attributeValue,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains a response to a LookupEvents action.
class LookupEventsResponse {
  /// A list of events returned based on the lookup attributes specified and the
  /// CloudTrail event. The events list is sorted by time. The most recent event
  /// is listed first.
  final List<Event> events;

  /// The token to use to get the next page of results after a previous API
  /// call. If the token does not appear, there are no more results to return.
  /// The token must be passed in with the same parameters as the previous call.
  /// For example, if the original call specified an AttributeKey of 'Username'
  /// with a value of 'root', the call with NextToken should include those same
  /// parameters.
  final String nextToken;

  LookupEventsResponse({
    this.events,
    this.nextToken,
  });
  static LookupEventsResponse fromJson(Map<String, dynamic> json) =>
      LookupEventsResponse(
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Contains information about a returned public key.
class PublicKey {
  /// The DER encoded public key value in PKCS#1 format.
  final Uint8List value;

  /// The starting time of validity of the public key.
  final DateTime validityStartTime;

  /// The ending time of validity of the public key.
  final DateTime validityEndTime;

  /// The fingerprint of the public key.
  final String fingerprint;

  PublicKey({
    this.value,
    this.validityStartTime,
    this.validityEndTime,
    this.fingerprint,
  });
  static PublicKey fromJson(Map<String, dynamic> json) => PublicKey(
        value: json.containsKey('Value') ? Uint8List(json['Value']) : null,
        validityStartTime: json.containsKey('ValidityStartTime')
            ? DateTime.parse(json['ValidityStartTime'])
            : null,
        validityEndTime: json.containsKey('ValidityEndTime')
            ? DateTime.parse(json['ValidityEndTime'])
            : null,
        fingerprint: json.containsKey('Fingerprint')
            ? json['Fingerprint'] as String
            : null,
      );
}

class PutEventSelectorsResponse {
  /// Specifies the ARN of the trail that was updated with event selectors. The
  /// format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  final String trailArn;

  /// Specifies the event selectors configured for your trail.
  final List<EventSelector> eventSelectors;

  PutEventSelectorsResponse({
    this.trailArn,
    this.eventSelectors,
  });
  static PutEventSelectorsResponse fromJson(Map<String, dynamic> json) =>
      PutEventSelectorsResponse(
        trailArn:
            json.containsKey('TrailARN') ? json['TrailARN'] as String : null,
        eventSelectors: json.containsKey('EventSelectors')
            ? (json['EventSelectors'] as List)
                .map((e) => EventSelector.fromJson(e))
                .toList()
            : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class RemoveTagsResponse {
  RemoveTagsResponse();
  static RemoveTagsResponse fromJson(Map<String, dynamic> json) =>
      RemoveTagsResponse();
}

/// Specifies the type and name of a resource referenced by an event.
class Resource {
  /// The type of a resource referenced by the event returned. When the resource
  /// type cannot be determined, null is returned. Some examples of resource
  /// types are: **Instance** for EC2, **Trail** for CloudTrail, **DBInstance**
  /// for RDS, and **AccessKey** for IAM. For a list of resource types supported
  /// for event lookup, see
  /// [Resource Types Supported for Event Lookup](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/lookup_supported_resourcetypes.html).
  final String resourceType;

  /// The name of the resource referenced by the event returned. These are
  /// user-created names whose values will depend on the environment. For
  /// example, the resource name might be "auto-scaling-test-group" for an Auto
  /// Scaling Group or "i-1234567" for an EC2 Instance.
  final String resourceName;

  Resource({
    this.resourceType,
    this.resourceName,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        resourceType: json.containsKey('ResourceType')
            ? json['ResourceType'] as String
            : null,
        resourceName: json.containsKey('ResourceName')
            ? json['ResourceName'] as String
            : null,
      );
}

/// A resource tag.
class ResourceTag {
  /// Specifies the ARN of the resource.
  final String resourceId;

  /// A list of tags.
  final List<Tag> tagsList;

  ResourceTag({
    this.resourceId,
    this.tagsList,
  });
  static ResourceTag fromJson(Map<String, dynamic> json) => ResourceTag(
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        tagsList: json.containsKey('TagsList')
            ? (json['TagsList'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class StartLoggingResponse {
  StartLoggingResponse();
  static StartLoggingResponse fromJson(Map<String, dynamic> json) =>
      StartLoggingResponse();
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class StopLoggingResponse {
  StopLoggingResponse();
  static StopLoggingResponse fromJson(Map<String, dynamic> json) =>
      StopLoggingResponse();
}

/// A custom key-value pair associated with a resource such as a CloudTrail
/// trail.
class Tag {
  /// The key in a key-value pair. The key must be must be no longer than 128
  /// Unicode characters. The key must be unique for the resource to which it
  /// applies.
  final String key;

  /// The value in a key-value pair of a tag. The value must be no longer than
  /// 256 Unicode characters.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The settings for a trail.
class Trail {
  /// Name of the trail set by calling CreateTrail. The maximum length is 128
  /// characters.
  final String name;

  /// Name of the Amazon S3 bucket into which CloudTrail delivers your trail
  /// files. See
  /// [Amazon S3 Bucket Naming Requirements](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/create_trail_naming_policy.html).
  final String s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see
  /// [Finding Your CloudTrail Log Files](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html).The
  /// maximum length is 200 characters.
  final String s3KeyPrefix;

  /// This field is deprecated. Use SnsTopicARN.
  final String snsTopicName;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  ///  `arn:aws:sns:us-east-2:123456789012:MyTopic`
  final String snsTopicArn;

  /// Set to **True** to include AWS API calls from AWS global services such as
  /// IAM. Otherwise, **False**.
  final bool includeGlobalServiceEvents;

  /// Specifies whether the trail belongs only to one region or exists in all
  /// regions.
  final bool isMultiRegionTrail;

  /// The region in which the trail was created.
  final String homeRegion;

  /// Specifies the ARN of the trail. The format of a trail ARN is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  final String trailArn;

  /// Specifies whether log file validation is enabled.
  final bool logFileValidationEnabled;

  /// Specifies an Amazon Resource Name (ARN), a unique identifier that
  /// represents the log group to which CloudTrail logs will be delivered.
  final String cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group.
  final String cloudWatchLogsRoleArn;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the format:
  ///
  ///
  /// `arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012`
  final String kmsKeyId;

  /// Specifies if the trail has custom event selectors.
  final bool hasCustomEventSelectors;

  /// Specifies whether the trail is an organization trail.
  final bool isOrganizationTrail;

  Trail({
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicName,
    this.snsTopicArn,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.homeRegion,
    this.trailArn,
    this.logFileValidationEnabled,
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.kmsKeyId,
    this.hasCustomEventSelectors,
    this.isOrganizationTrail,
  });
  static Trail fromJson(Map<String, dynamic> json) => Trail(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        s3BucketName: json.containsKey('S3BucketName')
            ? json['S3BucketName'] as String
            : null,
        s3KeyPrefix: json.containsKey('S3KeyPrefix')
            ? json['S3KeyPrefix'] as String
            : null,
        snsTopicName: json.containsKey('SnsTopicName')
            ? json['SnsTopicName'] as String
            : null,
        snsTopicArn: json.containsKey('SnsTopicARN')
            ? json['SnsTopicARN'] as String
            : null,
        includeGlobalServiceEvents:
            json.containsKey('IncludeGlobalServiceEvents')
                ? json['IncludeGlobalServiceEvents'] as bool
                : null,
        isMultiRegionTrail: json.containsKey('IsMultiRegionTrail')
            ? json['IsMultiRegionTrail'] as bool
            : null,
        homeRegion: json.containsKey('HomeRegion')
            ? json['HomeRegion'] as String
            : null,
        trailArn:
            json.containsKey('TrailARN') ? json['TrailARN'] as String : null,
        logFileValidationEnabled: json.containsKey('LogFileValidationEnabled')
            ? json['LogFileValidationEnabled'] as bool
            : null,
        cloudWatchLogsLogGroupArn: json.containsKey('CloudWatchLogsLogGroupArn')
            ? json['CloudWatchLogsLogGroupArn'] as String
            : null,
        cloudWatchLogsRoleArn: json.containsKey('CloudWatchLogsRoleArn')
            ? json['CloudWatchLogsRoleArn'] as String
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        hasCustomEventSelectors: json.containsKey('HasCustomEventSelectors')
            ? json['HasCustomEventSelectors'] as bool
            : null,
        isOrganizationTrail: json.containsKey('IsOrganizationTrail')
            ? json['IsOrganizationTrail'] as bool
            : null,
      );
}

/// Returns the objects or data listed below if successful. Otherwise, returns
/// an error.
class UpdateTrailResponse {
  /// Specifies the name of the trail.
  final String name;

  /// Specifies the name of the Amazon S3 bucket designated for publishing log
  /// files.
  final String s3BucketName;

  /// Specifies the Amazon S3 key prefix that comes after the name of the bucket
  /// you have designated for log file delivery. For more information, see
  /// [Finding Your CloudTrail Log Files](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-find-log-files.html).
  final String s3KeyPrefix;

  /// This field is deprecated. Use SnsTopicARN.
  final String snsTopicName;

  /// Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send
  /// notifications when log files are delivered. The format of a topic ARN is:
  ///
  ///  `arn:aws:sns:us-east-2:123456789012:MyTopic`
  final String snsTopicArn;

  /// Specifies whether the trail is publishing events from global services such
  /// as IAM to the log files.
  final bool includeGlobalServiceEvents;

  /// Specifies whether the trail exists in one region or in all regions.
  final bool isMultiRegionTrail;

  /// Specifies the ARN of the trail that was updated. The format of a trail ARN
  /// is:
  ///
  ///  `arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail`
  final String trailArn;

  /// Specifies whether log file integrity validation is enabled.
  final bool logFileValidationEnabled;

  /// Specifies the Amazon Resource Name (ARN) of the log group to which
  /// CloudTrail logs will be delivered.
  final String cloudWatchLogsLogGroupArn;

  /// Specifies the role for the CloudWatch Logs endpoint to assume to write to
  /// a user's log group.
  final String cloudWatchLogsRoleArn;

  /// Specifies the KMS key ID that encrypts the logs delivered by CloudTrail.
  /// The value is a fully specified ARN to a KMS key in the format:
  ///
  ///
  /// `arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012`
  final String kmsKeyId;

  /// Specifies whether the trail is an organization trail.
  final bool isOrganizationTrail;

  UpdateTrailResponse({
    this.name,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.snsTopicName,
    this.snsTopicArn,
    this.includeGlobalServiceEvents,
    this.isMultiRegionTrail,
    this.trailArn,
    this.logFileValidationEnabled,
    this.cloudWatchLogsLogGroupArn,
    this.cloudWatchLogsRoleArn,
    this.kmsKeyId,
    this.isOrganizationTrail,
  });
  static UpdateTrailResponse fromJson(Map<String, dynamic> json) =>
      UpdateTrailResponse(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        s3BucketName: json.containsKey('S3BucketName')
            ? json['S3BucketName'] as String
            : null,
        s3KeyPrefix: json.containsKey('S3KeyPrefix')
            ? json['S3KeyPrefix'] as String
            : null,
        snsTopicName: json.containsKey('SnsTopicName')
            ? json['SnsTopicName'] as String
            : null,
        snsTopicArn: json.containsKey('SnsTopicARN')
            ? json['SnsTopicARN'] as String
            : null,
        includeGlobalServiceEvents:
            json.containsKey('IncludeGlobalServiceEvents')
                ? json['IncludeGlobalServiceEvents'] as bool
                : null,
        isMultiRegionTrail: json.containsKey('IsMultiRegionTrail')
            ? json['IsMultiRegionTrail'] as bool
            : null,
        trailArn:
            json.containsKey('TrailARN') ? json['TrailARN'] as String : null,
        logFileValidationEnabled: json.containsKey('LogFileValidationEnabled')
            ? json['LogFileValidationEnabled'] as bool
            : null,
        cloudWatchLogsLogGroupArn: json.containsKey('CloudWatchLogsLogGroupArn')
            ? json['CloudWatchLogsLogGroupArn'] as String
            : null,
        cloudWatchLogsRoleArn: json.containsKey('CloudWatchLogsRoleArn')
            ? json['CloudWatchLogsRoleArn'] as String
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        isOrganizationTrail: json.containsKey('IsOrganizationTrail')
            ? json['IsOrganizationTrail'] as bool
            : null,
      );
}
