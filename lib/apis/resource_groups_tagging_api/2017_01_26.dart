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
/// For more information on IAM policies, see [Managing IAM
/// Policies](http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage.html)
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
  Future<void> getResources(
      {String paginationToken,
      List<TagFilter> tagFilters,
      int resourcesPerPage,
      int tagsPerPage,
      List<String> resourceTypeFilters}) async {}

  /// Returns all tag keys in the specified region for the AWS account.
  Future<void> getTagKeys({String paginationToken}) async {}

  /// Returns all tag values for the specified key in the specified region for
  /// the AWS account.
  Future<void> getTagValues(String key, {String paginationToken}) async {}

  /// Applies one or more tags to the specified resources. Note the following:
  ///
  /// *   Not all resources can have tags. For a list of resources that support
  /// tagging, see [Supported
  /// Resources](http://docs.aws.amazon.com/ARG/latest/userguide/supported-resources.html)
  /// in the _AWS Resource Groups User Guide_.
  ///
  /// *   Each resource can have up to 50 tags. For other limits, see [Tag
  /// Restrictions](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html#tag-restrictions)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// *   You can only tag resources that are located in the specified region
  /// for the AWS account.
  ///
  /// *   To add tags to a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for adding
  /// tags. For more information, see [Obtaining Permissions for
  /// Tagging](http://docs.aws.amazon.com/ARG/latest/userguide/obtaining-permissions-for-tagging.html)
  /// in the _AWS Resource Groups User Guide_.
  Future<void> tagResources(
      {@required List<String> resourceArnList,
      @required Map<String, String> tags}) async {}

  /// Removes the specified tags from the specified resources. When you specify
  /// a tag key, the action removes both that key and its associated value. The
  /// operation succeeds even if you attempt to remove tags from a resource that
  /// were already removed. Note the following:
  ///
  /// *   To remove tags from a resource, you need the necessary permissions for
  /// the service that the resource belongs to as well as permissions for
  /// removing tags. For more information, see [Obtaining Permissions for
  /// Tagging](http://docs.aws.amazon.com/ARG/latest/userguide/obtaining-permissions-for-tagging.html)
  /// in the _AWS Resource Groups User Guide_.
  ///
  /// *   You can only tag resources that are located in the specified region
  /// for the AWS account.
  Future<void> untagResources(
      {@required List<String> resourceArnList,
      @required List<String> tagKeys}) async {}
}

class FailureInfo {}

class GetResourcesOutput {}

class GetTagKeysOutput {}

class GetTagValuesOutput {}

class ResourceTagMapping {}

class Tag {}

class TagFilter {}

class TagResourcesOutput {}

class UntagResourcesOutput {}
