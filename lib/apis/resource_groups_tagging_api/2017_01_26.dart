import 'package:meta/meta.dart';

/// Resource Groups Tagging API
///
/// This guide describes the API operations for the resource groups tagging.
///
/// A tag is a label that you assign to an AWS resource. A tag consists of a key
/// and a value, both of which you define. For example, if you have two Amazon
/// EC2 instances, you might assign both a tag key of "Stack." But the value of
/// "Stack" might be "Testing" for one and "Production" for the other.
///
/// Tagging can help you organize your resources and enables you to simplify
/// resource management, access management and cost allocation.
///
/// You can use the resource groups tagging API operations to complete the
/// following tasks:
///
/// *   Tag and untag supported resources located in the specified region for
/// the AWS account
///
/// *   Use tag-based filters to search for resources located in the specified
/// region for the AWS account
///
/// *   List all existing tag keys in the specified region for the AWS account
///
/// *   List all existing values for the specified key in the specified region
/// for the AWS account
///
///
/// To use resource groups tagging API operations, you must add the following
/// permissions to your IAM policy:
///
/// *    `tag:GetResources`
///
/// *    `tag:TagResources`
///
/// *    `tag:UntagResources`
///
/// *    `tag:GetTagKeys`
///
/// *    `tag:GetTagValues`
///
///
/// You'll also need permissions to access the resources of individual services
/// so that you can tag and untag those resources.
///
/// For more information on IAM policies, see
/// [Managing IAM Policies](http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage.html)
/// in the _IAM User Guide_.
///
/// You can use the Resource Groups Tagging API to tag resources for the
/// following AWS services.
///
/// *   Alexa for Business (a4b)
///
/// *   API Gateway
///
/// *   AWS AppStream
///
/// *   AWS AppSync
///
/// *   AWS App Mesh
///
/// *   Amazon Athena
///
/// *   Amazon Aurora
///
/// *   AWS Backup
///
/// *   AWS Certificate Manager
///
/// *   AWS Certificate Manager Private CA
///
/// *   Amazon Cloud Directory
///
/// *   AWS CloudFormation
///
/// *   Amazon CloudFront
///
/// *   AWS CloudHSM
///
/// *   AWS CloudTrail
///
/// *   Amazon CloudWatch (alarms only)
///
/// *   Amazon CloudWatch Events
///
/// *   Amazon CloudWatch Logs
///
/// *   AWS CodeBuild
///
/// *   AWS CodeCommit
///
/// *   AWS CodePipeline
///
/// *   AWS CodeStar
///
/// *   Amazon Cognito Identity
///
/// *   Amazon Cognito User Pools
///
/// *   Amazon Comprehend
///
/// *   AWS Config
///
/// *   AWS Data Pipeline
///
/// *   AWS Database Migration Service
///
/// *   AWS Datasync
///
/// *   AWS Direct Connect
///
/// *   AWS Directory Service
///
/// *   Amazon DynamoDB
///
/// *   Amazon EBS
///
/// *   Amazon EC2
///
/// *   Amazon ECR
///
/// *   Amazon ECS
///
/// *   AWS Elastic Beanstalk
///
/// *   Amazon Elastic File System
///
/// *   Elastic Load Balancing
///
/// *   Amazon ElastiCache
///
/// *   Amazon Elasticsearch Service
///
/// *   AWS Elemental MediaLive
///
/// *   AWS Elemental MediaPackage
///
/// *   AWS Elemental MediaTailor
///
/// *   Amazon EMR
///
/// *   Amazon FSx
///
/// *   Amazon Glacier
///
/// *   AWS Glue
///
/// *   Amazon Inspector
///
/// *   AWS IoT Analytics
///
/// *   AWS IoT Core
///
/// *   AWS IoT Device Defender
///
/// *   AWS IoT Device Management
///
/// *   AWS IoT Greengrass
///
/// *   AWS Key Management Service
///
/// *   Amazon Kinesis
///
/// *   Amazon Kinesis Data Analytics
///
/// *   Amazon Kinesis Data Firehose
///
/// *   AWS Lambda
///
/// *   AWS License Manager
///
/// *   Amazon Machine Learning
///
/// *   Amazon MQ
///
/// *   Amazon MSK
///
/// *   Amazon Neptune
///
/// *   AWS OpsWorks
///
/// *   Amazon RDS
///
/// *   Amazon Redshift
///
/// *   AWS Resource Access Manager
///
/// *   AWS Resource Groups
///
/// *   AWS RoboMaker
///
/// *   Amazon Route 53
///
/// *   Amazon Route 53 Resolver
///
/// *   Amazon S3 (buckets only)
///
/// *   Amazon SageMaker
///
/// *   AWS Secrets Manager
///
/// *   AWS Service Catalog
///
/// *   Amazon Simple Notification Service (SNS)
///
/// *   Amazon Simple Queue Service (SQS)
///
/// *   AWS Simple System Manager (SSM)
///
/// *   AWS Step Functions
///
/// *   AWS Storage Gateway
///
/// *   AWS Transfer for SFTP
///
/// *   Amazon VPC
///
/// *   Amazon WorkSpaces
class ResourceGroupsTaggingApiApi {
  final _client;
  ResourceGroupsTaggingApiApi(client)
      : _client = client.configured('Resource Groups Tagging API',
            serializer: 'json');

  /// Returns all the tagged or previously tagged resources that are located in
  /// the specified region for the AWS account. You can optionally specify
  /// _filters_ (tags and resource types) in your request, depending on what
  /// information you want returned. The response includes all tags that are
  /// associated with the requested resources.
  ///
  ///
  ///
  /// You can check the `PaginationToken` response parameter to determine if a
  /// query completed. Queries can occasionally return fewer results on a page
  /// than allowed. The `PaginationToken` response parameter value is `null`
  /// _only_ when there are no more results to display.
  ///
  /// [paginationToken]: A string that indicates that additional data is
  /// available. Leave this value empty for your initial request. If the
  /// response includes a `PaginationToken`, use that string for this value to
  /// request an additional page of data.
  ///
  /// [tagFilters]: A list of TagFilters (keys and values). Each TagFilter
  /// specified must contain a key with values as optional. A request can
  /// include up to 50 keys, and each key can include up to 20 values.
  ///
  /// Note the following when deciding how to use TagFilters:
  ///
  /// *   If you _do_ specify a TagFilter, the response returns only those
  /// resources that are currently associated with the specified tag.
  ///
  /// *   If you _don't_ specify a TagFilter, the response includes all
  /// resources that were ever associated with tags. Resources that currently
  /// don't have associated tags are shown with an empty tag set, like this:
  /// `"Tags": []`.
  ///
  /// *   If you specify more than one filter in a single request, the response
  /// returns only those resources that satisfy all specified filters.
  ///
  /// *   If you specify a filter that contains more than one value for a key,
  /// the response returns resources that match any of the specified values for
  /// that key.
  ///
  /// *   If you don't specify any values for a key, the response returns
  /// resources that are tagged with that key irrespective of the value.
  ///
  ///     For example, for filters: filter1 = {key1, {value1}}, filter2 = {key2,
  /// {value2,value3,value4}} , filter3 = {key3}:
  ///
  ///     *   GetResources( {filter1} ) returns resources tagged with
  /// key1=value1
  ///
  ///     *   GetResources( {filter2} ) returns resources tagged with
  /// key2=value2 or key2=value3 or key2=value4
  ///
  ///     *   GetResources( {filter3} ) returns resources tagged with any tag
  /// containing key3 as its tag key, irrespective of its value
  ///
  ///     *   GetResources( {filter1,filter2,filter3} ) returns resources tagged
  /// with ( key1=value1) and ( key2=value2 or key2=value3 or key2=value4) and
  /// (key3, irrespective of the value)
  ///
  /// [resourcesPerPage]: A limit that restricts the number of resources
  /// returned by GetResources in paginated output. You can set ResourcesPerPage
  /// to a minimum of 1 item and the maximum of 100 items.
  ///
  /// [tagsPerPage]: A limit that restricts the number of tags (key and value
  /// pairs) returned by GetResources in paginated output. A resource with no
  /// tags is counted as having one tag (one key and value pair).
  ///
  ///  `GetResources` does not split a resource and its associated tags across
  /// pages. If the specified `TagsPerPage` would cause such a break, a
  /// `PaginationToken` is returned in place of the affected resource and its
  /// tags. Use that token in another request to get the remaining data. For
  /// example, if you specify a `TagsPerPage` of `100` and the account has 22
  /// resources with 10 tags each (meaning that each resource has 10 key and
  /// value pairs), the output will consist of 3 pages, with the first page
  /// displaying the first 10 resources, each with its 10 tags, the second page
  /// displaying the next 10 resources each with its 10 tags, and the third page
  /// displaying the remaining 2 resources, each with its 10 tags.
  ///
  /// You can set `TagsPerPage` to a minimum of 100 items and the maximum of 500
  /// items.
  ///
  /// [resourceTypeFilters]: The constraints on the resources that you want
  /// returned. The format of each resource type is `service[:resourceType]`.
  /// For example, specifying a resource type of `ec2` returns all Amazon EC2
  /// resources (which includes EC2 instances). Specifying a resource type of
  /// `ec2:instance` returns only EC2 instances.
  ///
  /// The string for each service name and resource type is the same as that
  /// embedded in a resource's Amazon Resource Name (ARN). Consult the _AWS
  /// General Reference_ for the following:
  ///
  /// *   For a list of service name strings, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces).
  ///
  /// *   For resource type strings, see
  /// [Example ARNs](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax).
  ///
  /// *   For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  ///
  ///
  /// You can specify multiple resource types by using an array. The array can
  /// include up to 100 items. Note that the length constraint requirement
  /// applies to each resource type filter.
  Future<GetResourcesOutput> getResources(
      {String paginationToken,
      List<TagFilter> tagFilters,
      int resourcesPerPage,
      int tagsPerPage,
      List<String> resourceTypeFilters}) async {
    var response_ = await _client.send('GetResources', {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (tagFilters != null) 'TagFilters': tagFilters,
      if (resourcesPerPage != null) 'ResourcesPerPage': resourcesPerPage,
      if (tagsPerPage != null) 'TagsPerPage': tagsPerPage,
      if (resourceTypeFilters != null)
        'ResourceTypeFilters': resourceTypeFilters,
    });
    return GetResourcesOutput.fromJson(response_);
  }

  /// Returns all tag keys in the specified region for the AWS account.
  ///
  /// [paginationToken]: A string that indicates that additional data is
  /// available. Leave this value empty for your initial request. If the
  /// response includes a PaginationToken, use that string for this value to
  /// request an additional page of data.
  Future<GetTagKeysOutput> getTagKeys({String paginationToken}) async {
    var response_ = await _client.send('GetTagKeys', {
      if (paginationToken != null) 'PaginationToken': paginationToken,
    });
    return GetTagKeysOutput.fromJson(response_);
  }

  /// Returns all tag values for the specified key in the specified region for
  /// the AWS account.
  ///
  /// [paginationToken]: A string that indicates that additional data is
  /// available. Leave this value empty for your initial request. If the
  /// response includes a PaginationToken, use that string for this value to
  /// request an additional page of data.
  ///
  /// [key]: The key for which you want to list all existing values in the
  /// specified region for the AWS account.
  Future<GetTagValuesOutput> getTagValues(String key,
      {String paginationToken}) async {
    var response_ = await _client.send('GetTagValues', {
      if (paginationToken != null) 'PaginationToken': paginationToken,
      'Key': key,
    });
    return GetTagValuesOutput.fromJson(response_);
  }

  /// Applies one or more tags to the specified resources. Note the following:
  ///
  /// *   Not all resources can have tags. For a list of resources that support
  /// tagging, see
  /// [Supported Resources](http://docs.aws.amazon.com/ARG/latest/userguide/supported-resources.html)
  /// in the _AWS Resource Groups User Guide_.
  ///
  /// *   Each resource can have up to 50 tags. For other limits, see
  /// [Tag Restrictions](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#tag-restrictions)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// *   You can only tag resources that are located in the specified region
  /// for the AWS account.
  ///
  /// *   To add tags to a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for adding
  /// tags. For more information, see
  /// [Obtaining Permissions for Tagging](http://docs.aws.amazon.com/ARG/latest/userguide/obtaining-permissions-for-tagging.html)
  /// in the _AWS Resource Groups User Guide_.
  ///
  /// [resourceArnList]: A list of ARNs. An ARN (Amazon Resource Name) uniquely
  /// identifies a resource. You can specify a minimum of 1 and a maximum of 20
  /// ARNs (resources) to tag. An ARN can be set to a maximum of 1600
  /// characters. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [tags]: The tags that you want to add to the specified resources. A tag
  /// consists of a key and a value that you define.
  Future<TagResourcesOutput> tagResources(
      {@required List<String> resourceArnList,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResources', {
      'ResourceARNList': resourceArnList,
      'Tags': tags,
    });
    return TagResourcesOutput.fromJson(response_);
  }

  /// Removes the specified tags from the specified resources. When you specify
  /// a tag key, the action removes both that key and its associated value. The
  /// operation succeeds even if you attempt to remove tags from a resource that
  /// were already removed. Note the following:
  ///
  /// *   To remove tags from a resource, you need the necessary permissions for
  /// the service that the resource belongs to as well as permissions for
  /// removing tags. For more information, see
  /// [Obtaining Permissions for Tagging](http://docs.aws.amazon.com/ARG/latest/userguide/obtaining-permissions-for-tagging.html)
  /// in the _AWS Resource Groups User Guide_.
  ///
  /// *   You can only tag resources that are located in the specified region
  /// for the AWS account.
  ///
  /// [resourceArnList]: A list of ARNs. An ARN (Amazon Resource Name) uniquely
  /// identifies a resource. You can specify a minimum of 1 and a maximum of 20
  /// ARNs (resources) to untag. An ARN can be set to a maximum of 1600
  /// characters. For more information, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  ///
  /// [tagKeys]: A list of the tag keys that you want to remove from the
  /// specified resources.
  Future<UntagResourcesOutput> untagResources(
      {@required List<String> resourceArnList,
      @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResources', {
      'ResourceARNList': resourceArnList,
      'TagKeys': tagKeys,
    });
    return UntagResourcesOutput.fromJson(response_);
  }
}

/// Details of the common errors that all actions return.
class FailureInfo {
  /// The HTTP status code of the common error.
  final int statusCode;

  /// The code of the common error. Valid values include
  /// `InternalServiceException`, `InvalidParameterException`, and any valid
  /// error code returned by the AWS service that hosts the resource that you
  /// want to tag.
  final String errorCode;

  /// The message of the common error.
  final String errorMessage;

  FailureInfo({
    this.statusCode,
    this.errorCode,
    this.errorMessage,
  });
  static FailureInfo fromJson(Map<String, dynamic> json) => FailureInfo(
        statusCode:
            json.containsKey('StatusCode') ? json['StatusCode'] as int : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

class GetResourcesOutput {
  /// A string that indicates that the response contains more data than can be
  /// returned in a single response. To receive additional data, specify this
  /// string for the `PaginationToken` value in a subsequent request.
  final String paginationToken;

  /// A list of resource ARNs and the tags (keys and values) associated with
  /// each.
  final List<ResourceTagMapping> resourceTagMappingList;

  GetResourcesOutput({
    this.paginationToken,
    this.resourceTagMappingList,
  });
  static GetResourcesOutput fromJson(Map<String, dynamic> json) =>
      GetResourcesOutput(
        paginationToken: json.containsKey('PaginationToken')
            ? json['PaginationToken'] as String
            : null,
        resourceTagMappingList: json.containsKey('ResourceTagMappingList')
            ? (json['ResourceTagMappingList'] as List)
                .map((e) => ResourceTagMapping.fromJson(e))
                .toList()
            : null,
      );
}

class GetTagKeysOutput {
  /// A string that indicates that the response contains more data than can be
  /// returned in a single response. To receive additional data, specify this
  /// string for the `PaginationToken` value in a subsequent request.
  final String paginationToken;

  /// A list of all tag keys in the AWS account.
  final List<String> tagKeys;

  GetTagKeysOutput({
    this.paginationToken,
    this.tagKeys,
  });
  static GetTagKeysOutput fromJson(Map<String, dynamic> json) =>
      GetTagKeysOutput(
        paginationToken: json.containsKey('PaginationToken')
            ? json['PaginationToken'] as String
            : null,
        tagKeys: json.containsKey('TagKeys')
            ? (json['TagKeys'] as List).map((e) => e as String).toList()
            : null,
      );
}

class GetTagValuesOutput {
  /// A string that indicates that the response contains more data than can be
  /// returned in a single response. To receive additional data, specify this
  /// string for the `PaginationToken` value in a subsequent request.
  final String paginationToken;

  /// A list of all tag values for the specified key in the AWS account.
  final List<String> tagValues;

  GetTagValuesOutput({
    this.paginationToken,
    this.tagValues,
  });
  static GetTagValuesOutput fromJson(Map<String, dynamic> json) =>
      GetTagValuesOutput(
        paginationToken: json.containsKey('PaginationToken')
            ? json['PaginationToken'] as String
            : null,
        tagValues: json.containsKey('TagValues')
            ? (json['TagValues'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// A list of resource ARNs and the tags (keys and values) that are associated
/// with each.
class ResourceTagMapping {
  /// The ARN of the resource.
  final String resourceArn;

  /// The tags that have been applied to one or more AWS resources.
  final List<Tag> tags;

  ResourceTagMapping({
    this.resourceArn,
    this.tags,
  });
  static ResourceTagMapping fromJson(Map<String, dynamic> json) =>
      ResourceTagMapping(
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// The metadata that you apply to AWS resources to help you categorize and
/// organize them. Each tag consists of a key and an optional value, both of
/// which you define. For more information, see
/// [Tag Basics](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#tag-basics)
/// in the _Amazon EC2 User Guide for Linux Instances_.
class Tag {
  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A value acts as
  /// a descriptor within a tag category (key).
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
}

/// A list of tags (keys and values) that are used to specify the associated
/// resources.
class TagFilter {
  /// One part of a key-value pair that make up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A value acts as
  /// a descriptor within a tag category (key).
  final List<String> values;

  TagFilter({
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourcesOutput {
  /// Details of resources that could not be tagged. An error code, status code,
  /// and error message are returned for each failed item.
  final Map<String, FailureInfo> failedResourcesMap;

  TagResourcesOutput({
    this.failedResourcesMap,
  });
  static TagResourcesOutput fromJson(Map<String, dynamic> json) =>
      TagResourcesOutput(
        failedResourcesMap: json.containsKey('FailedResourcesMap')
            ? (json['FailedResourcesMap'] as Map)
                .map((k, v) => MapEntry(k as String, FailureInfo.fromJson(v)))
            : null,
      );
}

class UntagResourcesOutput {
  /// Details of resources that could not be untagged. An error code, status
  /// code, and error message are returned for each failed item.
  final Map<String, FailureInfo> failedResourcesMap;

  UntagResourcesOutput({
    this.failedResourcesMap,
  });
  static UntagResourcesOutput fromJson(Map<String, dynamic> json) =>
      UntagResourcesOutput(
        failedResourcesMap: json.containsKey('FailedResourcesMap')
            ? (json['FailedResourcesMap'] as Map)
                .map((k, v) => MapEntry(k as String, FailureInfo.fromJson(v)))
            : null,
      );
}
