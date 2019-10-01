import 'package:meta/meta.dart';
import 'dart:typed_data';

class S3Api {
  /// Aborts a multipart upload.
  ///
  /// To verify that all parts have been removed, so you don't get charged for
  /// the part storage, you should call the List Parts operation and ensure the
  /// parts list is empty.
  Future<void> abortMultipartUpload(
      {@required String bucket,
      @required String key,
      @required String uploadId,
      String requestPayer}) async {}

  /// Completes a multipart upload by assembling previously uploaded parts.
  Future<void> completeMultipartUpload(
      {@required String bucket,
      @required String key,
      CompletedMultipartUpload multipartUpload,
      @required String uploadId,
      String requestPayer}) async {}

  /// Creates a copy of an object that is already stored in Amazon S3.
  Future<void> copyObject(
      {String acl,
      @required String bucket,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      @required String copySource,
      String copySourceIfMatch,
      DateTime copySourceIfModifiedSince,
      String copySourceIfNoneMatch,
      DateTime copySourceIfUnmodifiedSince,
      DateTime expires,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWriteAcp,
      @required String key,
      Map<String, String> metadata,
      String metadataDirective,
      String taggingDirective,
      String serverSideEncryption,
      String storageClass,
      String websiteRedirectLocation,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String ssekmsKeyId,
      String ssekmsEncryptionContext,
      String copySourceSseCustomerAlgorithm,
      Uint8List copySourceSseCustomerKey,
      String copySourceSseCustomerKeyMd5,
      String requestPayer,
      String tagging,
      String objectLockMode,
      DateTime objectLockRetainUntilDate,
      String objectLockLegalHoldStatus}) async {}

  /// Creates a new bucket.
  Future<void> createBucket(String bucket,
      {String acl,
      CreateBucketConfiguration createBucketConfiguration,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWrite,
      String grantWriteAcp,
      bool objectLockEnabledForBucket}) async {}

  /// Initiates a multipart upload and returns an upload ID.
  ///
  ///  **Note:** After you initiate multipart upload and upload one or more
  /// parts, you must either complete or abort multipart upload in order to stop
  /// getting charged for storage of the uploaded parts. Only after you either
  /// complete or abort multipart upload, Amazon S3 frees up the parts storage
  /// and stops charging you for the parts storage.
  Future<void> createMultipartUpload(
      {String acl,
      @required String bucket,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      String contentType,
      DateTime expires,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWriteAcp,
      @required String key,
      Map<String, String> metadata,
      String serverSideEncryption,
      String storageClass,
      String websiteRedirectLocation,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String ssekmsKeyId,
      String ssekmsEncryptionContext,
      String requestPayer,
      String tagging,
      String objectLockMode,
      DateTime objectLockRetainUntilDate,
      String objectLockLegalHoldStatus}) async {}

  /// Deletes the bucket. All objects (including all object versions and Delete
  /// Markers) in the bucket must be deleted before the bucket itself can be
  /// deleted.
  Future<void> deleteBucket(String bucket) async {}

  /// Deletes an analytics configuration for the bucket (specified by the
  /// analytics configuration ID).
  ///
  /// To use this operation, you must have permissions to perform the
  /// s3:PutAnalyticsConfiguration action. The bucket owner has this permission
  /// by default. The bucket owner can grant this permission to others.
  Future<void> deleteBucketAnalyticsConfiguration(
      {@required String bucket, @required String id}) async {}

  /// Deletes the CORS configuration information set for the bucket.
  Future<void> deleteBucketCors(String bucket) async {}

  /// Deletes the server-side encryption configuration from the bucket.
  Future<void> deleteBucketEncryption(String bucket) async {}

  /// Deletes an inventory configuration (identified by the inventory ID) from
  /// the bucket.
  Future<void> deleteBucketInventoryConfiguration(
      {@required String bucket, @required String id}) async {}

  /// Deletes the lifecycle configuration from the bucket.
  Future<void> deleteBucketLifecycle(String bucket) async {}

  /// Deletes a metrics configuration (specified by the metrics configuration
  /// ID) from the bucket.
  Future<void> deleteBucketMetricsConfiguration(
      {@required String bucket, @required String id}) async {}

  /// Deletes the policy from the bucket.
  Future<void> deleteBucketPolicy(String bucket) async {}

  ///  Deletes the replication configuration from the bucket. For information
  /// about replication configuration, see [Cross-Region Replication
  /// (CRR)](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html) in the
  /// _Amazon S3 Developer Guide_.
  Future<void> deleteBucketReplication(String bucket) async {}

  /// Deletes the tags from the bucket.
  Future<void> deleteBucketTagging(String bucket) async {}

  /// This operation removes the website configuration from the bucket.
  Future<void> deleteBucketWebsite(String bucket) async {}

  /// Removes the null version (if there is one) of an object and inserts a
  /// delete marker, which becomes the latest version of the object. If there
  /// isn't a null version, Amazon S3 does not remove any objects.
  Future<void> deleteObject(
      {@required String bucket,
      @required String key,
      String mfa,
      String versionId,
      String requestPayer,
      bool bypassGovernanceRetention}) async {}

  /// Removes the tag-set from an existing object.
  Future<void> deleteObjectTagging(
      {@required String bucket,
      @required String key,
      String versionId}) async {}

  /// This operation enables you to delete multiple objects from a bucket using
  /// a single HTTP request. You may specify up to 1000 keys.
  Future<void> deleteObjects(
      {@required String bucket,
      @required Delete delete,
      String mfa,
      String requestPayer,
      bool bypassGovernanceRetention}) async {}

  /// Removes the `PublicAccessBlock` configuration from an Amazon S3 bucket.
  Future<void> deletePublicAccessBlock(String bucket) async {}

  /// Returns the accelerate configuration of a bucket.
  Future<void> getBucketAccelerateConfiguration(String bucket) async {}

  /// Gets the access control policy for the bucket.
  Future<void> getBucketAcl(String bucket) async {}

  /// Gets an analytics configuration for the bucket (specified by the analytics
  /// configuration ID).
  Future<void> getBucketAnalyticsConfiguration(
      {@required String bucket, @required String id}) async {}

  /// Returns the CORS configuration for the bucket.
  Future<void> getBucketCors(String bucket) async {}

  /// Returns the server-side encryption configuration of a bucket.
  Future<void> getBucketEncryption(String bucket) async {}

  /// Returns an inventory configuration (identified by the inventory ID) from
  /// the bucket.
  Future<void> getBucketInventoryConfiguration(
      {@required String bucket, @required String id}) async {}

  ///  No longer used, see the GetBucketLifecycleConfiguration operation.
  Future<void> getBucketLifecycle(String bucket) async {}

  /// Returns the lifecycle configuration information set on the bucket.
  Future<void> getBucketLifecycleConfiguration(String bucket) async {}

  /// Returns the region the bucket resides in.
  Future<void> getBucketLocation(String bucket) async {}

  /// Returns the logging status of a bucket and the permissions users have to
  /// view and modify that status. To use GET, you must be the bucket owner.
  Future<void> getBucketLogging(String bucket) async {}

  /// Gets a metrics configuration (specified by the metrics configuration ID)
  /// from the bucket.
  Future<void> getBucketMetricsConfiguration(
      {@required String bucket, @required String id}) async {}

  ///  No longer used, see the GetBucketNotificationConfiguration operation.
  Future<void> getBucketNotification(String bucket) async {}

  /// Returns the notification configuration of a bucket.
  Future<void> getBucketNotificationConfiguration(String bucket) async {}

  /// Returns the policy of a specified bucket.
  Future<void> getBucketPolicy(String bucket) async {}

  /// Retrieves the policy status for an Amazon S3 bucket, indicating whether
  /// the bucket is public.
  Future<void> getBucketPolicyStatus(String bucket) async {}

  /// Returns the replication configuration of a bucket.
  ///
  ///   It can take a while to propagate the put or delete a replication
  /// configuration to all Amazon S3 systems. Therefore, a get request soon
  /// after put or delete can return a wrong result.
  Future<void> getBucketReplication(String bucket) async {}

  /// Returns the request payment configuration of a bucket.
  Future<void> getBucketRequestPayment(String bucket) async {}

  /// Returns the tag set associated with the bucket.
  Future<void> getBucketTagging(String bucket) async {}

  /// Returns the versioning state of a bucket.
  Future<void> getBucketVersioning(String bucket) async {}

  /// Returns the website configuration for a bucket.
  Future<void> getBucketWebsite(String bucket) async {}

  /// Retrieves objects from Amazon S3.
  Future<void> getObject(
      {@required String bucket,
      String ifMatch,
      DateTime ifModifiedSince,
      String ifNoneMatch,
      DateTime ifUnmodifiedSince,
      @required String key,
      String range,
      String responseCacheControl,
      String responseContentDisposition,
      String responseContentEncoding,
      String responseContentLanguage,
      String responseContentType,
      DateTime responseExpires,
      String versionId,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String requestPayer,
      int partNumber}) async {}

  /// Returns the access control list (ACL) of an object.
  Future<void> getObjectAcl(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {}

  /// Gets an object's current Legal Hold status.
  Future<void> getObjectLegalHold(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {}

  /// Gets the object lock configuration for a bucket. The rule specified in the
  /// object lock configuration will be applied by default to every new object
  /// placed in the specified bucket.
  Future<void> getObjectLockConfiguration(String bucket) async {}

  /// Retrieves an object's retention settings.
  Future<void> getObjectRetention(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {}

  /// Returns the tag-set of an object.
  Future<void> getObjectTagging(
      {@required String bucket,
      @required String key,
      String versionId}) async {}

  /// Return torrent files from a bucket.
  Future<void> getObjectTorrent(
      {@required String bucket,
      @required String key,
      String requestPayer}) async {}

  /// Retrieves the `PublicAccessBlock` configuration for an Amazon S3 bucket.
  Future<void> getPublicAccessBlock(String bucket) async {}

  /// This operation is useful to determine if a bucket exists and you have
  /// permission to access it.
  Future<void> headBucket(String bucket) async {}

  /// The HEAD operation retrieves metadata from an object without returning the
  /// object itself. This operation is useful if you're only interested in an
  /// object's metadata. To use HEAD, you must have READ access to the object.
  Future<void> headObject(
      {@required String bucket,
      String ifMatch,
      DateTime ifModifiedSince,
      String ifNoneMatch,
      DateTime ifUnmodifiedSince,
      @required String key,
      String range,
      String versionId,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String requestPayer,
      int partNumber}) async {}

  /// Lists the analytics configurations for the bucket.
  Future<void> listBucketAnalyticsConfigurations(String bucket,
      {String continuationToken}) async {}

  /// Returns a list of inventory configurations for the bucket.
  Future<void> listBucketInventoryConfigurations(String bucket,
      {String continuationToken}) async {}

  /// Lists the metrics configurations for the bucket.
  Future<void> listBucketMetricsConfigurations(String bucket,
      {String continuationToken}) async {}

  /// Returns a list of all buckets owned by the authenticated sender of the
  /// request.
  Future<void> listBuckets() async {}

  /// This operation lists in-progress multipart uploads.
  Future<void> listMultipartUploads(String bucket,
      {String delimiter,
      String encodingType,
      String keyMarker,
      int maxUploads,
      String prefix,
      String uploadIdMarker}) async {}

  /// Returns metadata about all of the versions of objects in a bucket.
  Future<void> listObjectVersions(String bucket,
      {String delimiter,
      String encodingType,
      String keyMarker,
      int maxKeys,
      String prefix,
      String versionIdMarker}) async {}

  /// Returns some or all (up to 1000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket.
  Future<void> listObjects(String bucket,
      {String delimiter,
      String encodingType,
      String marker,
      int maxKeys,
      String prefix,
      String requestPayer}) async {}

  /// Returns some or all (up to 1000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket. Note: ListObjectsV2 is the revised List Objects API
  /// and we recommend you use this revised API for new application development.
  Future<void> listObjectsV2(String bucket,
      {String delimiter,
      String encodingType,
      int maxKeys,
      String prefix,
      String continuationToken,
      bool fetchOwner,
      String startAfter,
      String requestPayer}) async {}

  /// Lists the parts that have been uploaded for a specific multipart upload.
  Future<void> listParts(
      {@required String bucket,
      @required String key,
      int maxParts,
      int partNumberMarker,
      @required String uploadId,
      String requestPayer}) async {}

  /// Sets the accelerate configuration of an existing bucket.
  Future<void> putBucketAccelerateConfiguration(
      {@required String bucket,
      @required AccelerateConfiguration accelerateConfiguration}) async {}

  /// Sets the permissions on a bucket using access control lists (ACL).
  Future<void> putBucketAcl(String bucket,
      {String acl,
      AccessControlPolicy accessControlPolicy,
      String contentMd5,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWrite,
      String grantWriteAcp}) async {}

  /// Sets an analytics configuration for the bucket (specified by the analytics
  /// configuration ID).
  Future<void> putBucketAnalyticsConfiguration(
      {@required String bucket,
      @required String id,
      @required AnalyticsConfiguration analyticsConfiguration}) async {}

  /// Sets the CORS configuration for a bucket.
  Future<void> putBucketCors(
      {@required String bucket,
      @required CorsConfiguration corsConfiguration,
      String contentMd5}) async {}

  /// Creates a new server-side encryption configuration (or replaces an
  /// existing one, if present).
  Future<void> putBucketEncryption(
      {@required
          String bucket,
      String contentMd5,
      @required
          ServerSideEncryptionConfiguration
              serverSideEncryptionConfiguration}) async {}

  /// Adds an inventory configuration (identified by the inventory ID) from the
  /// bucket.
  Future<void> putBucketInventoryConfiguration(
      {@required String bucket,
      @required String id,
      @required InventoryConfiguration inventoryConfiguration}) async {}

  ///  No longer used, see the PutBucketLifecycleConfiguration operation.
  Future<void> putBucketLifecycle(String bucket,
      {String contentMd5,
      LifecycleConfiguration lifecycleConfiguration}) async {}

  /// Sets lifecycle configuration for your bucket. If a lifecycle configuration
  /// exists, it replaces it.
  Future<void> putBucketLifecycleConfiguration(String bucket,
      {BucketLifecycleConfiguration lifecycleConfiguration}) async {}

  /// Set the logging parameters for a bucket and to specify permissions for who
  /// can view and modify the logging parameters. To set the logging status of a
  /// bucket, you must be the bucket owner.
  Future<void> putBucketLogging(
      {@required String bucket,
      @required BucketLoggingStatus bucketLoggingStatus,
      String contentMd5}) async {}

  /// Sets a metrics configuration (specified by the metrics configuration ID)
  /// for the bucket.
  Future<void> putBucketMetricsConfiguration(
      {@required String bucket,
      @required String id,
      @required MetricsConfiguration metricsConfiguration}) async {}

  ///  No longer used, see the PutBucketNotificationConfiguration operation.
  Future<void> putBucketNotification(
      {@required
          String bucket,
      String contentMd5,
      @required
          NotificationConfigurationDeprecated
              notificationConfiguration}) async {}

  /// Enables notifications of specified events for a bucket.
  Future<void> putBucketNotificationConfiguration(
      {@required String bucket,
      @required NotificationConfiguration notificationConfiguration}) async {}

  /// Applies an Amazon S3 bucket policy to an Amazon S3 bucket.
  Future<void> putBucketPolicy(
      {@required String bucket,
      String contentMd5,
      bool confirmRemoveSelfBucketAccess,
      @required String policy}) async {}

  ///  Creates a replication configuration or replaces an existing one. For more
  /// information, see [Cross-Region Replication
  /// (CRR)](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html) in the
  /// _Amazon S3 Developer Guide_.
  Future<void> putBucketReplication(
      {@required String bucket,
      String contentMd5,
      @required ReplicationConfiguration replicationConfiguration,
      String token}) async {}

  /// Sets the request payment configuration for a bucket. By default, the
  /// bucket owner pays for downloads from the bucket. This configuration
  /// parameter enables the bucket owner (only) to specify that the person
  /// requesting the download will be charged for the download. Documentation on
  /// requester pays buckets can be found at
  /// http://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html
  Future<void> putBucketRequestPayment(
      {@required
          String bucket,
      String contentMd5,
      @required
          RequestPaymentConfiguration requestPaymentConfiguration}) async {}

  /// Sets the tags for a bucket.
  Future<void> putBucketTagging(
      {@required String bucket,
      String contentMd5,
      @required Tagging tagging}) async {}

  /// Sets the versioning state of an existing bucket. To set the versioning
  /// state, you must be the bucket owner.
  Future<void> putBucketVersioning(
      {@required String bucket,
      String contentMd5,
      String mfa,
      @required VersioningConfiguration versioningConfiguration}) async {}

  /// Set the website configuration for a bucket.
  Future<void> putBucketWebsite(
      {@required String bucket,
      String contentMd5,
      @required WebsiteConfiguration websiteConfiguration}) async {}

  /// Adds an object to a bucket.
  Future<void> putObject(
      {String acl,
      Uint8List body,
      @required String bucket,
      String cacheControl,
      String contentDisposition,
      String contentEncoding,
      String contentLanguage,
      BigInt contentLength,
      String contentMd5,
      String contentType,
      DateTime expires,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWriteAcp,
      @required String key,
      Map<String, String> metadata,
      String serverSideEncryption,
      String storageClass,
      String websiteRedirectLocation,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String ssekmsKeyId,
      String ssekmsEncryptionContext,
      String requestPayer,
      String tagging,
      String objectLockMode,
      DateTime objectLockRetainUntilDate,
      String objectLockLegalHoldStatus}) async {}

  /// uses the acl subresource to set the access control list (ACL) permissions
  /// for an object that already exists in a bucket
  Future<void> putObjectAcl(
      {String acl,
      AccessControlPolicy accessControlPolicy,
      @required String bucket,
      String contentMd5,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWrite,
      String grantWriteAcp,
      @required String key,
      String requestPayer,
      String versionId}) async {}

  /// Applies a Legal Hold configuration to the specified object.
  Future<void> putObjectLegalHold(
      {@required String bucket,
      @required String key,
      ObjectLockLegalHold legalHold,
      String requestPayer,
      String versionId,
      String contentMd5}) async {}

  /// Places an object lock configuration on the specified bucket. The rule
  /// specified in the object lock configuration will be applied by default to
  /// every new object placed in the specified bucket.
  Future<void> putObjectLockConfiguration(String bucket,
      {ObjectLockConfiguration objectLockConfiguration,
      String requestPayer,
      String token,
      String contentMd5}) async {}

  /// Places an Object Retention configuration on an object.
  Future<void> putObjectRetention(
      {@required String bucket,
      @required String key,
      ObjectLockRetention retention,
      String requestPayer,
      String versionId,
      bool bypassGovernanceRetention,
      String contentMd5}) async {}

  /// Sets the supplied tag-set to an object that already exists in a bucket
  Future<void> putObjectTagging(
      {@required String bucket,
      @required String key,
      String versionId,
      String contentMd5,
      @required Tagging tagging}) async {}

  /// Creates or modifies the `PublicAccessBlock` configuration for an Amazon S3
  /// bucket.
  Future<void> putPublicAccessBlock(
      {@required
          String bucket,
      String contentMd5,
      @required
          PublicAccessBlockConfiguration
              publicAccessBlockConfiguration}) async {}

  /// Restores an archived copy of an object back into Amazon S3
  Future<void> restoreObject(
      {@required String bucket,
      @required String key,
      String versionId,
      RestoreRequest restoreRequest,
      String requestPayer}) async {}

  /// This operation filters the contents of an Amazon S3 object based on a
  /// simple Structured Query Language (SQL) statement. In the request, along
  /// with the SQL expression, you must also specify a data serialization format
  /// (JSON or CSV) of the object. Amazon S3 uses this to parse object data into
  /// records, and returns only records that match the specified SQL expression.
  /// You must also specify the data serialization format for the response.
  Future<void> selectObjectContent(
      {@required String bucket,
      @required String key,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      @required String expression,
      @required String expressionType,
      RequestProgress requestProgress,
      @required InputSerialization inputSerialization,
      @required OutputSerialization outputSerialization}) async {}

  /// Uploads a part in a multipart upload.
  ///
  ///  **Note:** After you initiate multipart upload and upload one or more
  /// parts, you must either complete or abort multipart upload in order to stop
  /// getting charged for storage of the uploaded parts. Only after you either
  /// complete or abort multipart upload, Amazon S3 frees up the parts storage
  /// and stops charging you for the parts storage.
  Future<void> uploadPart(
      {Uint8List body,
      @required String bucket,
      BigInt contentLength,
      String contentMd5,
      @required String key,
      @required int partNumber,
      @required String uploadId,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String requestPayer}) async {}

  /// Uploads a part by copying data from an existing object as data source.
  Future<void> uploadPartCopy(
      {@required String bucket,
      @required String copySource,
      String copySourceIfMatch,
      DateTime copySourceIfModifiedSince,
      String copySourceIfNoneMatch,
      DateTime copySourceIfUnmodifiedSince,
      String copySourceRange,
      @required String key,
      @required int partNumber,
      @required String uploadId,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      String copySourceSseCustomerAlgorithm,
      Uint8List copySourceSseCustomerKey,
      String copySourceSseCustomerKeyMd5,
      String requestPayer}) async {}
}

class AbortIncompleteMultipartUpload {}

class AbortMultipartUploadOutput {}

class AccelerateConfiguration {}

class AccessControlPolicy {}

class AccessControlTranslation {}

class AnalyticsAndOperator {}

class AnalyticsConfiguration {}

class AnalyticsExportDestination {}

class AnalyticsFilter {}

class AnalyticsS3BucketDestination {}

class Bucket {}

class BucketLifecycleConfiguration {}

class BucketLoggingStatus {}

class CorsConfiguration {}

class CorsRule {}

class CsvInput {}

class CsvOutput {}

class CloudFunctionConfiguration {}

class CommonPrefix {}

class CompleteMultipartUploadOutput {}

class CompletedMultipartUpload {}

class CompletedPart {}

class Condition {}

class ContinuationEvent {}

class CopyObjectOutput {}

class CopyObjectResult {}

class CopyPartResult {}

class CreateBucketConfiguration {}

class CreateBucketOutput {}

class CreateMultipartUploadOutput {}

class DefaultRetention {}

class Delete {}

class DeleteMarkerEntry {}

class DeleteMarkerReplication {}

class DeleteObjectOutput {}

class DeleteObjectTaggingOutput {}

class DeleteObjectsOutput {}

class DeletedObject {}

class Destination {}

class Encryption {}

class EncryptionConfiguration {}

class EndEvent {}

class Error {}

class ErrorDocument {}

class FilterRule {}

class GetBucketAccelerateConfigurationOutput {}

class GetBucketAclOutput {}

class GetBucketAnalyticsConfigurationOutput {}

class GetBucketCorsOutput {}

class GetBucketEncryptionOutput {}

class GetBucketInventoryConfigurationOutput {}

class GetBucketLifecycleConfigurationOutput {}

class GetBucketLifecycleOutput {}

class GetBucketLocationOutput {}

class GetBucketLoggingOutput {}

class GetBucketMetricsConfigurationOutput {}

class GetBucketPolicyOutput {}

class GetBucketPolicyStatusOutput {}

class GetBucketReplicationOutput {}

class GetBucketRequestPaymentOutput {}

class GetBucketTaggingOutput {}

class GetBucketVersioningOutput {}

class GetBucketWebsiteOutput {}

class GetObjectAclOutput {}

class GetObjectLegalHoldOutput {}

class GetObjectLockConfigurationOutput {}

class GetObjectOutput {}

class GetObjectRetentionOutput {}

class GetObjectTaggingOutput {}

class GetObjectTorrentOutput {}

class GetPublicAccessBlockOutput {}

class GlacierJobParameters {}

class Grant {}

class Grantee {}

class HeadObjectOutput {}

class IndexDocument {}

class Initiator {}

class InputSerialization {}

class InventoryConfiguration {}

class InventoryDestination {}

class InventoryEncryption {}

class InventoryFilter {}

class InventoryS3BucketDestination {}

class InventorySchedule {}

class JsonInput {}

class JsonOutput {}

class LambdaFunctionConfiguration {}

class LifecycleConfiguration {}

class LifecycleExpiration {}

class LifecycleRule {}

class LifecycleRuleAndOperator {}

class LifecycleRuleFilter {}

class ListBucketAnalyticsConfigurationsOutput {}

class ListBucketInventoryConfigurationsOutput {}

class ListBucketMetricsConfigurationsOutput {}

class ListBucketsOutput {}

class ListMultipartUploadsOutput {}

class ListObjectVersionsOutput {}

class ListObjectsOutput {}

class ListObjectsV2Output {}

class ListPartsOutput {}

class LoggingEnabled {}

class MetadataEntry {}

class MetricsAndOperator {}

class MetricsConfiguration {}

class MetricsFilter {}

class MultipartUpload {}

class NoncurrentVersionExpiration {}

class NoncurrentVersionTransition {}

class NotificationConfiguration {}

class NotificationConfigurationDeprecated {}

class NotificationConfigurationFilter {}

class Object {}

class ObjectIdentifier {}

class ObjectLockConfiguration {}

class ObjectLockLegalHold {}

class ObjectLockRetention {}

class ObjectLockRule {}

class ObjectVersion {}

class OutputLocation {}

class OutputSerialization {}

class Owner {}

class ParquetInput {}

class Part {}

class PolicyStatus {}

class Progress {}

class ProgressEvent {}

class PublicAccessBlockConfiguration {}

class PutObjectAclOutput {}

class PutObjectLegalHoldOutput {}

class PutObjectLockConfigurationOutput {}

class PutObjectOutput {}

class PutObjectRetentionOutput {}

class PutObjectTaggingOutput {}

class QueueConfiguration {}

class QueueConfigurationDeprecated {}

class RecordsEvent {}

class Redirect {}

class RedirectAllRequestsTo {}

class ReplicationConfiguration {}

class ReplicationRule {}

class ReplicationRuleAndOperator {}

class ReplicationRuleFilter {}

class RequestPaymentConfiguration {}

class RequestProgress {}

class RestoreObjectOutput {}

class RestoreRequest {}

class RoutingRule {}

class Rule {}

class S3KeyFilter {}

class S3Location {}

class Ssekms {}

class Sses3 {}

class SelectObjectContentEventStream {}

class SelectObjectContentOutput {}

class SelectParameters {}

class ServerSideEncryptionByDefault {}

class ServerSideEncryptionConfiguration {}

class ServerSideEncryptionRule {}

class SourceSelectionCriteria {}

class SseKmsEncryptedObjects {}

class Stats {}

class StatsEvent {}

class StorageClassAnalysis {}

class StorageClassAnalysisDataExport {}

class Tag {}

class Tagging {}

class TargetGrant {}

class TopicConfiguration {}

class TopicConfigurationDeprecated {}

class Transition {}

class UploadPartCopyOutput {}

class UploadPartOutput {}

class VersioningConfiguration {}

class WebsiteConfiguration {}
