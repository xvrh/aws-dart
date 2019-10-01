import 'package:meta/meta.dart';
import 'dart:typed_data';

class S3Api {
  final _client;
  S3Api(client) : _client = client.configured('S3', serializer: 'rest-xml');

  /// Aborts a multipart upload.
  ///
  /// To verify that all parts have been removed, so you don't get charged for
  /// the part storage, you should call the List Parts operation and ensure the
  /// parts list is empty.
  ///
  /// [bucket]: Name of the bucket to which the multipart upload was initiated.
  ///
  /// [key]: Key of the object for which the multipart upload was initiated.
  ///
  /// [uploadId]: Upload ID that identifies the multipart upload.
  Future<AbortMultipartUploadOutput> abortMultipartUpload(
      {@required String bucket,
      @required String key,
      @required String uploadId,
      String requestPayer}) async {
    var response_ = await _client.send('AbortMultipartUpload', {
      'Bucket': bucket,
      'Key': key,
      'UploadId': uploadId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return AbortMultipartUploadOutput.fromJson(response_);
  }

  /// Completes a multipart upload by assembling previously uploaded parts.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [multipartUpload]:
  ///
  /// [uploadId]:
  Future<CompleteMultipartUploadOutput> completeMultipartUpload(
      {@required String bucket,
      @required String key,
      CompletedMultipartUpload multipartUpload,
      @required String uploadId,
      String requestPayer}) async {
    var response_ = await _client.send('CompleteMultipartUpload', {
      'Bucket': bucket,
      'Key': key,
      if (multipartUpload != null) 'MultipartUpload': multipartUpload,
      'UploadId': uploadId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return CompleteMultipartUploadOutput.fromJson(response_);
  }

  /// Creates a copy of an object that is already stored in Amazon S3.
  ///
  /// [acl]: The canned ACL to apply to the object.
  ///
  /// [bucket]:
  ///
  /// [cacheControl]: Specifies caching behavior along the request/reply chain.
  ///
  /// [contentDisposition]: Specifies presentational information for the object.
  ///
  /// [contentEncoding]: Specifies what content encodings have been applied to
  /// the object and thus what decoding mechanisms must be applied to obtain the
  /// media-type referenced by the Content-Type header field.
  ///
  /// [contentLanguage]: The language the content is in.
  ///
  /// [contentType]: A standard MIME type describing the format of the object
  /// data.
  ///
  /// [copySource]: The name of the source bucket and key name of the source
  /// object, separated by a slash (/). Must be URL-encoded.
  ///
  /// [copySourceIfMatch]: Copies the object if its entity tag (ETag) matches
  /// the specified tag.
  ///
  /// [copySourceIfModifiedSince]: Copies the object if it has been modified
  /// since the specified time.
  ///
  /// [copySourceIfNoneMatch]: Copies the object if its entity tag (ETag) is
  /// different than the specified ETag.
  ///
  /// [copySourceIfUnmodifiedSince]: Copies the object if it hasn't been
  /// modified since the specified time.
  ///
  /// [expires]: The date and time at which the object is no longer cacheable.
  ///
  /// [grantFullControl]: Gives the grantee READ, READ_ACP, and WRITE_ACP
  /// permissions on the object.
  ///
  /// [grantRead]: Allows grantee to read the object data and its metadata.
  ///
  /// [grantReadAcp]: Allows grantee to read the object ACL.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// object.
  ///
  /// [key]:
  ///
  /// [metadata]: A map of metadata to store with the object in S3.
  ///
  /// [metadataDirective]: Specifies whether the metadata is copied from the
  /// source object or replaced with metadata provided in the request.
  ///
  /// [taggingDirective]: Specifies whether the object tag-set are copied from
  /// the source object or replaced with tag-set provided in the request.
  ///
  /// [serverSideEncryption]: The Server-side encryption algorithm used when
  /// storing this object in S3 (e.g., AES256, aws:kms).
  ///
  /// [storageClass]: The type of storage to use for the object. Defaults to
  /// 'STANDARD'.
  ///
  /// [websiteRedirectLocation]: If the bucket is configured as a website,
  /// redirects requests for this object to another object in the same bucket or
  /// to an external URL. Amazon S3 stores the value of this header in the
  /// object metadata.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [ssekmsKeyId]: Specifies the AWS KMS key ID to use for object encryption.
  /// All GET and PUT requests for an object protected by AWS KMS will fail if
  /// not made via SSL or using SigV4. Documentation on configuring any of the
  /// officially supported AWS SDKs and CLI can be found at
  /// http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
  ///
  /// [ssekmsEncryptionContext]: Specifies the AWS KMS Encryption Context to use
  /// for object encryption. The value of this header is a base64-encoded UTF-8
  /// string holding JSON with the encryption context key-value pairs.
  ///
  /// [copySourceSseCustomerAlgorithm]: Specifies the algorithm to use when
  /// decrypting the source object (e.g., AES256).
  ///
  /// [copySourceSseCustomerKey]: Specifies the customer-provided encryption key
  /// for Amazon S3 to use to decrypt the source object. The encryption key
  /// provided in this header must be one that was used when the source object
  /// was created.
  ///
  /// [copySourceSseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the
  /// encryption key according to RFC 1321. Amazon S3 uses this header for a
  /// message integrity check to ensure the encryption key was transmitted
  /// without error.
  ///
  /// [tagging]: The tag-set for the object destination object this value must
  /// be used in conjunction with the TaggingDirective. The tag-set must be
  /// encoded as URL Query parameters
  ///
  /// [objectLockMode]: The object lock mode that you want to apply to the
  /// copied object.
  ///
  /// [objectLockRetainUntilDate]: The date and time when you want the copied
  /// object's object lock to expire.
  ///
  /// [objectLockLegalHoldStatus]: Specifies whether you want to apply a Legal
  /// Hold to the copied object.
  Future<CopyObjectOutput> copyObject(
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
      String objectLockLegalHoldStatus}) async {
    var response_ = await _client.send('CopyObject', {
      if (acl != null) 'ACL': acl,
      'Bucket': bucket,
      if (cacheControl != null) 'CacheControl': cacheControl,
      if (contentDisposition != null) 'ContentDisposition': contentDisposition,
      if (contentEncoding != null) 'ContentEncoding': contentEncoding,
      if (contentLanguage != null) 'ContentLanguage': contentLanguage,
      if (contentType != null) 'ContentType': contentType,
      'CopySource': copySource,
      if (copySourceIfMatch != null) 'CopySourceIfMatch': copySourceIfMatch,
      if (copySourceIfModifiedSince != null)
        'CopySourceIfModifiedSince': copySourceIfModifiedSince,
      if (copySourceIfNoneMatch != null)
        'CopySourceIfNoneMatch': copySourceIfNoneMatch,
      if (copySourceIfUnmodifiedSince != null)
        'CopySourceIfUnmodifiedSince': copySourceIfUnmodifiedSince,
      if (expires != null) 'Expires': expires,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
      'Key': key,
      if (metadata != null) 'Metadata': metadata,
      if (metadataDirective != null) 'MetadataDirective': metadataDirective,
      if (taggingDirective != null) 'TaggingDirective': taggingDirective,
      if (serverSideEncryption != null)
        'ServerSideEncryption': serverSideEncryption,
      if (storageClass != null) 'StorageClass': storageClass,
      if (websiteRedirectLocation != null)
        'WebsiteRedirectLocation': websiteRedirectLocation,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (ssekmsKeyId != null) 'SSEKMSKeyId': ssekmsKeyId,
      if (ssekmsEncryptionContext != null)
        'SSEKMSEncryptionContext': ssekmsEncryptionContext,
      if (copySourceSseCustomerAlgorithm != null)
        'CopySourceSSECustomerAlgorithm': copySourceSseCustomerAlgorithm,
      if (copySourceSseCustomerKey != null)
        'CopySourceSSECustomerKey': copySourceSseCustomerKey,
      if (copySourceSseCustomerKeyMd5 != null)
        'CopySourceSSECustomerKeyMD5': copySourceSseCustomerKeyMd5,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (tagging != null) 'Tagging': tagging,
      if (objectLockMode != null) 'ObjectLockMode': objectLockMode,
      if (objectLockRetainUntilDate != null)
        'ObjectLockRetainUntilDate': objectLockRetainUntilDate,
      if (objectLockLegalHoldStatus != null)
        'ObjectLockLegalHoldStatus': objectLockLegalHoldStatus,
    });
    return CopyObjectOutput.fromJson(response_);
  }

  /// Creates a new bucket.
  ///
  /// [acl]: The canned ACL to apply to the bucket.
  ///
  /// [bucket]:
  ///
  /// [createBucketConfiguration]:
  ///
  /// [grantFullControl]: Allows grantee the read, write, read ACP, and write
  /// ACP permissions on the bucket.
  ///
  /// [grantRead]: Allows grantee to list the objects in the bucket.
  ///
  /// [grantReadAcp]: Allows grantee to read the bucket ACL.
  ///
  /// [grantWrite]: Allows grantee to create, overwrite, and delete any object
  /// in the bucket.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// bucket.
  ///
  /// [objectLockEnabledForBucket]: Specifies whether you want Amazon S3 object
  /// lock to be enabled for the new bucket.
  Future<CreateBucketOutput> createBucket(String bucket,
      {String acl,
      CreateBucketConfiguration createBucketConfiguration,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWrite,
      String grantWriteAcp,
      bool objectLockEnabledForBucket}) async {
    var response_ = await _client.send('CreateBucket', {
      if (acl != null) 'ACL': acl,
      'Bucket': bucket,
      if (createBucketConfiguration != null)
        'CreateBucketConfiguration': createBucketConfiguration,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWrite != null) 'GrantWrite': grantWrite,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
      if (objectLockEnabledForBucket != null)
        'ObjectLockEnabledForBucket': objectLockEnabledForBucket,
    });
    return CreateBucketOutput.fromJson(response_);
  }

  /// Initiates a multipart upload and returns an upload ID.
  ///
  ///  **Note:** After you initiate multipart upload and upload one or more
  /// parts, you must either complete or abort multipart upload in order to stop
  /// getting charged for storage of the uploaded parts. Only after you either
  /// complete or abort multipart upload, Amazon S3 frees up the parts storage
  /// and stops charging you for the parts storage.
  ///
  /// [acl]: The canned ACL to apply to the object.
  ///
  /// [bucket]:
  ///
  /// [cacheControl]: Specifies caching behavior along the request/reply chain.
  ///
  /// [contentDisposition]: Specifies presentational information for the object.
  ///
  /// [contentEncoding]: Specifies what content encodings have been applied to
  /// the object and thus what decoding mechanisms must be applied to obtain the
  /// media-type referenced by the Content-Type header field.
  ///
  /// [contentLanguage]: The language the content is in.
  ///
  /// [contentType]: A standard MIME type describing the format of the object
  /// data.
  ///
  /// [expires]: The date and time at which the object is no longer cacheable.
  ///
  /// [grantFullControl]: Gives the grantee READ, READ_ACP, and WRITE_ACP
  /// permissions on the object.
  ///
  /// [grantRead]: Allows grantee to read the object data and its metadata.
  ///
  /// [grantReadAcp]: Allows grantee to read the object ACL.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// object.
  ///
  /// [key]:
  ///
  /// [metadata]: A map of metadata to store with the object in S3.
  ///
  /// [serverSideEncryption]: The Server-side encryption algorithm used when
  /// storing this object in S3 (e.g., AES256, aws:kms).
  ///
  /// [storageClass]: The type of storage to use for the object. Defaults to
  /// 'STANDARD'.
  ///
  /// [websiteRedirectLocation]: If the bucket is configured as a website,
  /// redirects requests for this object to another object in the same bucket or
  /// to an external URL. Amazon S3 stores the value of this header in the
  /// object metadata.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [ssekmsKeyId]: Specifies the AWS KMS key ID to use for object encryption.
  /// All GET and PUT requests for an object protected by AWS KMS will fail if
  /// not made via SSL or using SigV4. Documentation on configuring any of the
  /// officially supported AWS SDKs and CLI can be found at
  /// http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
  ///
  /// [ssekmsEncryptionContext]: Specifies the AWS KMS Encryption Context to use
  /// for object encryption. The value of this header is a base64-encoded UTF-8
  /// string holding JSON with the encryption context key-value pairs.
  ///
  /// [tagging]: The tag-set for the object. The tag-set must be encoded as URL
  /// Query parameters
  ///
  /// [objectLockMode]: Specifies the object lock mode that you want to apply to
  /// the uploaded object.
  ///
  /// [objectLockRetainUntilDate]: Specifies the date and time when you want the
  /// object lock to expire.
  ///
  /// [objectLockLegalHoldStatus]: Specifies whether you want to apply a Legal
  /// Hold to the uploaded object.
  Future<CreateMultipartUploadOutput> createMultipartUpload(
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
      String objectLockLegalHoldStatus}) async {
    var response_ = await _client.send('CreateMultipartUpload', {
      if (acl != null) 'ACL': acl,
      'Bucket': bucket,
      if (cacheControl != null) 'CacheControl': cacheControl,
      if (contentDisposition != null) 'ContentDisposition': contentDisposition,
      if (contentEncoding != null) 'ContentEncoding': contentEncoding,
      if (contentLanguage != null) 'ContentLanguage': contentLanguage,
      if (contentType != null) 'ContentType': contentType,
      if (expires != null) 'Expires': expires,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
      'Key': key,
      if (metadata != null) 'Metadata': metadata,
      if (serverSideEncryption != null)
        'ServerSideEncryption': serverSideEncryption,
      if (storageClass != null) 'StorageClass': storageClass,
      if (websiteRedirectLocation != null)
        'WebsiteRedirectLocation': websiteRedirectLocation,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (ssekmsKeyId != null) 'SSEKMSKeyId': ssekmsKeyId,
      if (ssekmsEncryptionContext != null)
        'SSEKMSEncryptionContext': ssekmsEncryptionContext,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (tagging != null) 'Tagging': tagging,
      if (objectLockMode != null) 'ObjectLockMode': objectLockMode,
      if (objectLockRetainUntilDate != null)
        'ObjectLockRetainUntilDate': objectLockRetainUntilDate,
      if (objectLockLegalHoldStatus != null)
        'ObjectLockLegalHoldStatus': objectLockLegalHoldStatus,
    });
    return CreateMultipartUploadOutput.fromJson(response_);
  }

  /// Deletes the bucket. All objects (including all object versions and Delete
  /// Markers) in the bucket must be deleted before the bucket itself can be
  /// deleted.
  ///
  /// [bucket]:
  Future<void> deleteBucket(String bucket) async {
    await _client.send('DeleteBucket', {
      'Bucket': bucket,
    });
  }

  /// Deletes an analytics configuration for the bucket (specified by the
  /// analytics configuration ID).
  ///
  /// To use this operation, you must have permissions to perform the
  /// s3:PutAnalyticsConfiguration action. The bucket owner has this permission
  /// by default. The bucket owner can grant this permission to others.
  ///
  /// [bucket]: The name of the bucket from which an analytics configuration is
  /// deleted.
  ///
  /// [id]: The ID that identifies the analytics configuration.
  Future<void> deleteBucketAnalyticsConfiguration(
      {@required String bucket, @required String id}) async {
    await _client.send('DeleteBucketAnalyticsConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
  }

  /// Deletes the CORS configuration information set for the bucket.
  ///
  /// [bucket]:
  Future<void> deleteBucketCors(String bucket) async {
    await _client.send('DeleteBucketCors', {
      'Bucket': bucket,
    });
  }

  /// Deletes the server-side encryption configuration from the bucket.
  ///
  /// [bucket]: The name of the bucket containing the server-side encryption
  /// configuration to delete.
  Future<void> deleteBucketEncryption(String bucket) async {
    await _client.send('DeleteBucketEncryption', {
      'Bucket': bucket,
    });
  }

  /// Deletes an inventory configuration (identified by the inventory ID) from
  /// the bucket.
  ///
  /// [bucket]: The name of the bucket containing the inventory configuration to
  /// delete.
  ///
  /// [id]: The ID used to identify the inventory configuration.
  Future<void> deleteBucketInventoryConfiguration(
      {@required String bucket, @required String id}) async {
    await _client.send('DeleteBucketInventoryConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
  }

  /// Deletes the lifecycle configuration from the bucket.
  ///
  /// [bucket]:
  Future<void> deleteBucketLifecycle(String bucket) async {
    await _client.send('DeleteBucketLifecycle', {
      'Bucket': bucket,
    });
  }

  /// Deletes a metrics configuration (specified by the metrics configuration
  /// ID) from the bucket.
  ///
  /// [bucket]: The name of the bucket containing the metrics configuration to
  /// delete.
  ///
  /// [id]: The ID used to identify the metrics configuration.
  Future<void> deleteBucketMetricsConfiguration(
      {@required String bucket, @required String id}) async {
    await _client.send('DeleteBucketMetricsConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
  }

  /// Deletes the policy from the bucket.
  ///
  /// [bucket]:
  Future<void> deleteBucketPolicy(String bucket) async {
    await _client.send('DeleteBucketPolicy', {
      'Bucket': bucket,
    });
  }

  ///  Deletes the replication configuration from the bucket. For information
  /// about replication configuration, see
  /// [Cross-Region Replication (CRR)](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html)
  /// in the _Amazon S3 Developer Guide_.
  ///
  /// [bucket]:  The bucket name.
  ///
  ///
  ///
  /// It can take a while to propagate the deletion of a replication
  /// configuration to all Amazon S3 systems.
  Future<void> deleteBucketReplication(String bucket) async {
    await _client.send('DeleteBucketReplication', {
      'Bucket': bucket,
    });
  }

  /// Deletes the tags from the bucket.
  ///
  /// [bucket]:
  Future<void> deleteBucketTagging(String bucket) async {
    await _client.send('DeleteBucketTagging', {
      'Bucket': bucket,
    });
  }

  /// This operation removes the website configuration from the bucket.
  ///
  /// [bucket]:
  Future<void> deleteBucketWebsite(String bucket) async {
    await _client.send('DeleteBucketWebsite', {
      'Bucket': bucket,
    });
  }

  /// Removes the null version (if there is one) of an object and inserts a
  /// delete marker, which becomes the latest version of the object. If there
  /// isn't a null version, Amazon S3 does not remove any objects.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [mfa]: The concatenation of the authentication device's serial number, a
  /// space, and the value that is displayed on your authentication device.
  ///
  /// [versionId]: VersionId used to reference a specific version of the object.
  ///
  /// [bypassGovernanceRetention]: Indicates whether Amazon S3 object lock
  /// should bypass governance-mode restrictions to process this operation.
  Future<DeleteObjectOutput> deleteObject(
      {@required String bucket,
      @required String key,
      String mfa,
      String versionId,
      String requestPayer,
      bool bypassGovernanceRetention}) async {
    var response_ = await _client.send('DeleteObject', {
      'Bucket': bucket,
      'Key': key,
      if (mfa != null) 'MFA': mfa,
      if (versionId != null) 'VersionId': versionId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (bypassGovernanceRetention != null)
        'BypassGovernanceRetention': bypassGovernanceRetention,
    });
    return DeleteObjectOutput.fromJson(response_);
  }

  /// Removes the tag-set from an existing object.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [versionId]: The versionId of the object that the tag-set will be removed
  /// from.
  Future<DeleteObjectTaggingOutput> deleteObjectTagging(
      {@required String bucket, @required String key, String versionId}) async {
    var response_ = await _client.send('DeleteObjectTagging', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
    });
    return DeleteObjectTaggingOutput.fromJson(response_);
  }

  /// This operation enables you to delete multiple objects from a bucket using
  /// a single HTTP request. You may specify up to 1000 keys.
  ///
  /// [bucket]:
  ///
  /// [delete]:
  ///
  /// [mfa]: The concatenation of the authentication device's serial number, a
  /// space, and the value that is displayed on your authentication device.
  ///
  /// [bypassGovernanceRetention]: Specifies whether you want to delete this
  /// object even if it has a Governance-type object lock in place. You must
  /// have sufficient permissions to perform this operation.
  Future<DeleteObjectsOutput> deleteObjects(
      {@required String bucket,
      @required Delete delete,
      String mfa,
      String requestPayer,
      bool bypassGovernanceRetention}) async {
    var response_ = await _client.send('DeleteObjects', {
      'Bucket': bucket,
      'Delete': delete,
      if (mfa != null) 'MFA': mfa,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (bypassGovernanceRetention != null)
        'BypassGovernanceRetention': bypassGovernanceRetention,
    });
    return DeleteObjectsOutput.fromJson(response_);
  }

  /// Removes the `PublicAccessBlock` configuration from an Amazon S3 bucket.
  ///
  /// [bucket]: The Amazon S3 bucket whose `PublicAccessBlock` configuration you
  /// want to delete.
  Future<void> deletePublicAccessBlock(String bucket) async {
    await _client.send('DeletePublicAccessBlock', {
      'Bucket': bucket,
    });
  }

  /// Returns the accelerate configuration of a bucket.
  ///
  /// [bucket]: Name of the bucket for which the accelerate configuration is
  /// retrieved.
  Future<GetBucketAccelerateConfigurationOutput>
      getBucketAccelerateConfiguration(String bucket) async {
    var response_ = await _client.send('GetBucketAccelerateConfiguration', {
      'Bucket': bucket,
    });
    return GetBucketAccelerateConfigurationOutput.fromJson(response_);
  }

  /// Gets the access control policy for the bucket.
  ///
  /// [bucket]:
  Future<GetBucketAclOutput> getBucketAcl(String bucket) async {
    var response_ = await _client.send('GetBucketAcl', {
      'Bucket': bucket,
    });
    return GetBucketAclOutput.fromJson(response_);
  }

  /// Gets an analytics configuration for the bucket (specified by the analytics
  /// configuration ID).
  ///
  /// [bucket]: The name of the bucket from which an analytics configuration is
  /// retrieved.
  ///
  /// [id]: The ID that identifies the analytics configuration.
  Future<GetBucketAnalyticsConfigurationOutput> getBucketAnalyticsConfiguration(
      {@required String bucket, @required String id}) async {
    var response_ = await _client.send('GetBucketAnalyticsConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
    return GetBucketAnalyticsConfigurationOutput.fromJson(response_);
  }

  /// Returns the CORS configuration for the bucket.
  ///
  /// [bucket]:
  Future<GetBucketCorsOutput> getBucketCors(String bucket) async {
    var response_ = await _client.send('GetBucketCors', {
      'Bucket': bucket,
    });
    return GetBucketCorsOutput.fromJson(response_);
  }

  /// Returns the server-side encryption configuration of a bucket.
  ///
  /// [bucket]: The name of the bucket from which the server-side encryption
  /// configuration is retrieved.
  Future<GetBucketEncryptionOutput> getBucketEncryption(String bucket) async {
    var response_ = await _client.send('GetBucketEncryption', {
      'Bucket': bucket,
    });
    return GetBucketEncryptionOutput.fromJson(response_);
  }

  /// Returns an inventory configuration (identified by the inventory ID) from
  /// the bucket.
  ///
  /// [bucket]: The name of the bucket containing the inventory configuration to
  /// retrieve.
  ///
  /// [id]: The ID used to identify the inventory configuration.
  Future<GetBucketInventoryConfigurationOutput> getBucketInventoryConfiguration(
      {@required String bucket, @required String id}) async {
    var response_ = await _client.send('GetBucketInventoryConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
    return GetBucketInventoryConfigurationOutput.fromJson(response_);
  }

  ///  No longer used, see the GetBucketLifecycleConfiguration operation.
  ///
  /// [bucket]:
  Future<GetBucketLifecycleOutput> getBucketLifecycle(String bucket) async {
    var response_ = await _client.send('GetBucketLifecycle', {
      'Bucket': bucket,
    });
    return GetBucketLifecycleOutput.fromJson(response_);
  }

  /// Returns the lifecycle configuration information set on the bucket.
  ///
  /// [bucket]:
  Future<GetBucketLifecycleConfigurationOutput> getBucketLifecycleConfiguration(
      String bucket) async {
    var response_ = await _client.send('GetBucketLifecycleConfiguration', {
      'Bucket': bucket,
    });
    return GetBucketLifecycleConfigurationOutput.fromJson(response_);
  }

  /// Returns the region the bucket resides in.
  ///
  /// [bucket]:
  Future<GetBucketLocationOutput> getBucketLocation(String bucket) async {
    var response_ = await _client.send('GetBucketLocation', {
      'Bucket': bucket,
    });
    return GetBucketLocationOutput.fromJson(response_);
  }

  /// Returns the logging status of a bucket and the permissions users have to
  /// view and modify that status. To use GET, you must be the bucket owner.
  ///
  /// [bucket]:
  Future<GetBucketLoggingOutput> getBucketLogging(String bucket) async {
    var response_ = await _client.send('GetBucketLogging', {
      'Bucket': bucket,
    });
    return GetBucketLoggingOutput.fromJson(response_);
  }

  /// Gets a metrics configuration (specified by the metrics configuration ID)
  /// from the bucket.
  ///
  /// [bucket]: The name of the bucket containing the metrics configuration to
  /// retrieve.
  ///
  /// [id]: The ID used to identify the metrics configuration.
  Future<GetBucketMetricsConfigurationOutput> getBucketMetricsConfiguration(
      {@required String bucket, @required String id}) async {
    var response_ = await _client.send('GetBucketMetricsConfiguration', {
      'Bucket': bucket,
      'Id': id,
    });
    return GetBucketMetricsConfigurationOutput.fromJson(response_);
  }

  ///  No longer used, see the GetBucketNotificationConfiguration operation.
  ///
  /// [bucket]: Name of the bucket to get the notification configuration for.
  Future<NotificationConfigurationDeprecated> getBucketNotification(
      String bucket) async {
    var response_ = await _client.send('GetBucketNotification', {
      'Bucket': bucket,
    });
    return NotificationConfigurationDeprecated.fromJson(response_);
  }

  /// Returns the notification configuration of a bucket.
  ///
  /// [bucket]: Name of the bucket to get the notification configuration for.
  Future<NotificationConfiguration> getBucketNotificationConfiguration(
      String bucket) async {
    var response_ = await _client.send('GetBucketNotificationConfiguration', {
      'Bucket': bucket,
    });
    return NotificationConfiguration.fromJson(response_);
  }

  /// Returns the policy of a specified bucket.
  ///
  /// [bucket]:
  Future<GetBucketPolicyOutput> getBucketPolicy(String bucket) async {
    var response_ = await _client.send('GetBucketPolicy', {
      'Bucket': bucket,
    });
    return GetBucketPolicyOutput.fromJson(response_);
  }

  /// Retrieves the policy status for an Amazon S3 bucket, indicating whether
  /// the bucket is public.
  ///
  /// [bucket]: The name of the Amazon S3 bucket whose policy status you want to
  /// retrieve.
  Future<GetBucketPolicyStatusOutput> getBucketPolicyStatus(
      String bucket) async {
    var response_ = await _client.send('GetBucketPolicyStatus', {
      'Bucket': bucket,
    });
    return GetBucketPolicyStatusOutput.fromJson(response_);
  }

  /// Returns the replication configuration of a bucket.
  ///
  ///   It can take a while to propagate the put or delete a replication
  /// configuration to all Amazon S3 systems. Therefore, a get request soon
  /// after put or delete can return a wrong result.
  ///
  /// [bucket]:
  Future<GetBucketReplicationOutput> getBucketReplication(String bucket) async {
    var response_ = await _client.send('GetBucketReplication', {
      'Bucket': bucket,
    });
    return GetBucketReplicationOutput.fromJson(response_);
  }

  /// Returns the request payment configuration of a bucket.
  ///
  /// [bucket]:
  Future<GetBucketRequestPaymentOutput> getBucketRequestPayment(
      String bucket) async {
    var response_ = await _client.send('GetBucketRequestPayment', {
      'Bucket': bucket,
    });
    return GetBucketRequestPaymentOutput.fromJson(response_);
  }

  /// Returns the tag set associated with the bucket.
  ///
  /// [bucket]:
  Future<GetBucketTaggingOutput> getBucketTagging(String bucket) async {
    var response_ = await _client.send('GetBucketTagging', {
      'Bucket': bucket,
    });
    return GetBucketTaggingOutput.fromJson(response_);
  }

  /// Returns the versioning state of a bucket.
  ///
  /// [bucket]:
  Future<GetBucketVersioningOutput> getBucketVersioning(String bucket) async {
    var response_ = await _client.send('GetBucketVersioning', {
      'Bucket': bucket,
    });
    return GetBucketVersioningOutput.fromJson(response_);
  }

  /// Returns the website configuration for a bucket.
  ///
  /// [bucket]:
  Future<GetBucketWebsiteOutput> getBucketWebsite(String bucket) async {
    var response_ = await _client.send('GetBucketWebsite', {
      'Bucket': bucket,
    });
    return GetBucketWebsiteOutput.fromJson(response_);
  }

  /// Retrieves objects from Amazon S3.
  ///
  /// [bucket]:
  ///
  /// [ifMatch]: Return the object only if its entity tag (ETag) is the same as
  /// the one specified, otherwise return a 412 (precondition failed).
  ///
  /// [ifModifiedSince]: Return the object only if it has been modified since
  /// the specified time, otherwise return a 304 (not modified).
  ///
  /// [ifNoneMatch]: Return the object only if its entity tag (ETag) is
  /// different from the one specified, otherwise return a 304 (not modified).
  ///
  /// [ifUnmodifiedSince]: Return the object only if it has not been modified
  /// since the specified time, otherwise return a 412 (precondition failed).
  ///
  /// [key]:
  ///
  /// [range]: Downloads the specified range bytes of an object. For more
  /// information about the HTTP Range header, go to
  /// http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.
  ///
  /// [responseCacheControl]: Sets the Cache-Control header of the response.
  ///
  /// [responseContentDisposition]: Sets the Content-Disposition header of the
  /// response
  ///
  /// [responseContentEncoding]: Sets the Content-Encoding header of the
  /// response.
  ///
  /// [responseContentLanguage]: Sets the Content-Language header of the
  /// response.
  ///
  /// [responseContentType]: Sets the Content-Type header of the response.
  ///
  /// [responseExpires]: Sets the Expires header of the response.
  ///
  /// [versionId]: VersionId used to reference a specific version of the object.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [partNumber]: Part number of the object being read. This is a positive
  /// integer between 1 and 10,000. Effectively performs a 'ranged' GET request
  /// for the part specified. Useful for downloading just a part of an object.
  Future<GetObjectOutput> getObject(
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
      int partNumber}) async {
    var response_ = await _client.send('GetObject', {
      'Bucket': bucket,
      if (ifMatch != null) 'IfMatch': ifMatch,
      if (ifModifiedSince != null) 'IfModifiedSince': ifModifiedSince,
      if (ifNoneMatch != null) 'IfNoneMatch': ifNoneMatch,
      if (ifUnmodifiedSince != null) 'IfUnmodifiedSince': ifUnmodifiedSince,
      'Key': key,
      if (range != null) 'Range': range,
      if (responseCacheControl != null)
        'ResponseCacheControl': responseCacheControl,
      if (responseContentDisposition != null)
        'ResponseContentDisposition': responseContentDisposition,
      if (responseContentEncoding != null)
        'ResponseContentEncoding': responseContentEncoding,
      if (responseContentLanguage != null)
        'ResponseContentLanguage': responseContentLanguage,
      if (responseContentType != null)
        'ResponseContentType': responseContentType,
      if (responseExpires != null) 'ResponseExpires': responseExpires,
      if (versionId != null) 'VersionId': versionId,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (partNumber != null) 'PartNumber': partNumber,
    });
    return GetObjectOutput.fromJson(response_);
  }

  /// Returns the access control list (ACL) of an object.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [versionId]: VersionId used to reference a specific version of the object.
  Future<GetObjectAclOutput> getObjectAcl(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {
    var response_ = await _client.send('GetObjectAcl', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return GetObjectAclOutput.fromJson(response_);
  }

  /// Gets an object's current Legal Hold status.
  ///
  /// [bucket]: The bucket containing the object whose Legal Hold status you
  /// want to retrieve.
  ///
  /// [key]: The key name for the object whose Legal Hold status you want to
  /// retrieve.
  ///
  /// [versionId]: The version ID of the object whose Legal Hold status you want
  /// to retrieve.
  Future<GetObjectLegalHoldOutput> getObjectLegalHold(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {
    var response_ = await _client.send('GetObjectLegalHold', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return GetObjectLegalHoldOutput.fromJson(response_);
  }

  /// Gets the object lock configuration for a bucket. The rule specified in the
  /// object lock configuration will be applied by default to every new object
  /// placed in the specified bucket.
  ///
  /// [bucket]: The bucket whose object lock configuration you want to retrieve.
  Future<GetObjectLockConfigurationOutput> getObjectLockConfiguration(
      String bucket) async {
    var response_ = await _client.send('GetObjectLockConfiguration', {
      'Bucket': bucket,
    });
    return GetObjectLockConfigurationOutput.fromJson(response_);
  }

  /// Retrieves an object's retention settings.
  ///
  /// [bucket]: The bucket containing the object whose retention settings you
  /// want to retrieve.
  ///
  /// [key]: The key name for the object whose retention settings you want to
  /// retrieve.
  ///
  /// [versionId]: The version ID for the object whose retention settings you
  /// want to retrieve.
  Future<GetObjectRetentionOutput> getObjectRetention(
      {@required String bucket,
      @required String key,
      String versionId,
      String requestPayer}) async {
    var response_ = await _client.send('GetObjectRetention', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return GetObjectRetentionOutput.fromJson(response_);
  }

  /// Returns the tag-set of an object.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [versionId]:
  Future<GetObjectTaggingOutput> getObjectTagging(
      {@required String bucket, @required String key, String versionId}) async {
    var response_ = await _client.send('GetObjectTagging', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
    });
    return GetObjectTaggingOutput.fromJson(response_);
  }

  /// Return torrent files from a bucket.
  ///
  /// [bucket]:
  ///
  /// [key]:
  Future<GetObjectTorrentOutput> getObjectTorrent(
      {@required String bucket,
      @required String key,
      String requestPayer}) async {
    var response_ = await _client.send('GetObjectTorrent', {
      'Bucket': bucket,
      'Key': key,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return GetObjectTorrentOutput.fromJson(response_);
  }

  /// Retrieves the `PublicAccessBlock` configuration for an Amazon S3 bucket.
  ///
  /// [bucket]: The name of the Amazon S3 bucket whose `PublicAccessBlock`
  /// configuration you want to retrieve.
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock(String bucket) async {
    var response_ = await _client.send('GetPublicAccessBlock', {
      'Bucket': bucket,
    });
    return GetPublicAccessBlockOutput.fromJson(response_);
  }

  /// This operation is useful to determine if a bucket exists and you have
  /// permission to access it.
  ///
  /// [bucket]:
  Future<void> headBucket(String bucket) async {
    await _client.send('HeadBucket', {
      'Bucket': bucket,
    });
  }

  /// The HEAD operation retrieves metadata from an object without returning the
  /// object itself. This operation is useful if you're only interested in an
  /// object's metadata. To use HEAD, you must have READ access to the object.
  ///
  /// [bucket]:
  ///
  /// [ifMatch]: Return the object only if its entity tag (ETag) is the same as
  /// the one specified, otherwise return a 412 (precondition failed).
  ///
  /// [ifModifiedSince]: Return the object only if it has been modified since
  /// the specified time, otherwise return a 304 (not modified).
  ///
  /// [ifNoneMatch]: Return the object only if its entity tag (ETag) is
  /// different from the one specified, otherwise return a 304 (not modified).
  ///
  /// [ifUnmodifiedSince]: Return the object only if it has not been modified
  /// since the specified time, otherwise return a 412 (precondition failed).
  ///
  /// [key]:
  ///
  /// [range]: Downloads the specified range bytes of an object. For more
  /// information about the HTTP Range header, go to
  /// http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35.
  ///
  /// [versionId]: VersionId used to reference a specific version of the object.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [partNumber]: Part number of the object being read. This is a positive
  /// integer between 1 and 10,000. Effectively performs a 'ranged' HEAD request
  /// for the part specified. Useful querying about the size of the part and the
  /// number of parts in this object.
  Future<HeadObjectOutput> headObject(
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
      int partNumber}) async {
    var response_ = await _client.send('HeadObject', {
      'Bucket': bucket,
      if (ifMatch != null) 'IfMatch': ifMatch,
      if (ifModifiedSince != null) 'IfModifiedSince': ifModifiedSince,
      if (ifNoneMatch != null) 'IfNoneMatch': ifNoneMatch,
      if (ifUnmodifiedSince != null) 'IfUnmodifiedSince': ifUnmodifiedSince,
      'Key': key,
      if (range != null) 'Range': range,
      if (versionId != null) 'VersionId': versionId,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (partNumber != null) 'PartNumber': partNumber,
    });
    return HeadObjectOutput.fromJson(response_);
  }

  /// Lists the analytics configurations for the bucket.
  ///
  /// [bucket]: The name of the bucket from which analytics configurations are
  /// retrieved.
  ///
  /// [continuationToken]: The ContinuationToken that represents a placeholder
  /// from where this request should begin.
  Future<ListBucketAnalyticsConfigurationsOutput>
      listBucketAnalyticsConfigurations(String bucket,
          {String continuationToken}) async {
    var response_ = await _client.send('ListBucketAnalyticsConfigurations', {
      'Bucket': bucket,
      if (continuationToken != null) 'ContinuationToken': continuationToken,
    });
    return ListBucketAnalyticsConfigurationsOutput.fromJson(response_);
  }

  /// Returns a list of inventory configurations for the bucket.
  ///
  /// [bucket]: The name of the bucket containing the inventory configurations
  /// to retrieve.
  ///
  /// [continuationToken]: The marker used to continue an inventory
  /// configuration listing that has been truncated. Use the
  /// NextContinuationToken from a previously truncated list response to
  /// continue the listing. The continuation token is an opaque value that
  /// Amazon S3 understands.
  Future<ListBucketInventoryConfigurationsOutput>
      listBucketInventoryConfigurations(String bucket,
          {String continuationToken}) async {
    var response_ = await _client.send('ListBucketInventoryConfigurations', {
      'Bucket': bucket,
      if (continuationToken != null) 'ContinuationToken': continuationToken,
    });
    return ListBucketInventoryConfigurationsOutput.fromJson(response_);
  }

  /// Lists the metrics configurations for the bucket.
  ///
  /// [bucket]: The name of the bucket containing the metrics configurations to
  /// retrieve.
  ///
  /// [continuationToken]: The marker that is used to continue a metrics
  /// configuration listing that has been truncated. Use the
  /// NextContinuationToken from a previously truncated list response to
  /// continue the listing. The continuation token is an opaque value that
  /// Amazon S3 understands.
  Future<ListBucketMetricsConfigurationsOutput> listBucketMetricsConfigurations(
      String bucket,
      {String continuationToken}) async {
    var response_ = await _client.send('ListBucketMetricsConfigurations', {
      'Bucket': bucket,
      if (continuationToken != null) 'ContinuationToken': continuationToken,
    });
    return ListBucketMetricsConfigurationsOutput.fromJson(response_);
  }

  /// Returns a list of all buckets owned by the authenticated sender of the
  /// request.
  Future<ListBucketsOutput> listBuckets() async {
    var response_ = await _client.send('ListBuckets', {});
    return ListBucketsOutput.fromJson(response_);
  }

  /// This operation lists in-progress multipart uploads.
  ///
  /// [bucket]:
  ///
  /// [delimiter]: Character you use to group keys.
  ///
  /// [keyMarker]: Together with upload-id-marker, this parameter specifies the
  /// multipart upload after which listing should begin.
  ///
  /// [maxUploads]: Sets the maximum number of multipart uploads, from 1 to
  /// 1,000, to return in the response body. 1,000 is the maximum number of
  /// uploads that can be returned in a response.
  ///
  /// [prefix]: Lists in-progress uploads only for those keys that begin with
  /// the specified prefix.
  ///
  /// [uploadIdMarker]: Together with key-marker, specifies the multipart upload
  /// after which listing should begin. If key-marker is not specified, the
  /// upload-id-marker parameter is ignored.
  Future<ListMultipartUploadsOutput> listMultipartUploads(String bucket,
      {String delimiter,
      String encodingType,
      String keyMarker,
      int maxUploads,
      String prefix,
      String uploadIdMarker}) async {
    var response_ = await _client.send('ListMultipartUploads', {
      'Bucket': bucket,
      if (delimiter != null) 'Delimiter': delimiter,
      if (encodingType != null) 'EncodingType': encodingType,
      if (keyMarker != null) 'KeyMarker': keyMarker,
      if (maxUploads != null) 'MaxUploads': maxUploads,
      if (prefix != null) 'Prefix': prefix,
      if (uploadIdMarker != null) 'UploadIdMarker': uploadIdMarker,
    });
    return ListMultipartUploadsOutput.fromJson(response_);
  }

  /// Returns metadata about all of the versions of objects in a bucket.
  ///
  /// [bucket]:
  ///
  /// [delimiter]: A delimiter is a character you use to group keys.
  ///
  /// [keyMarker]: Specifies the key to start with when listing objects in a
  /// bucket.
  ///
  /// [maxKeys]: Sets the maximum number of keys returned in the response. The
  /// response might contain fewer keys but will never contain more.
  ///
  /// [prefix]: Limits the response to keys that begin with the specified
  /// prefix.
  ///
  /// [versionIdMarker]: Specifies the object version you want to start listing
  /// from.
  Future<ListObjectVersionsOutput> listObjectVersions(String bucket,
      {String delimiter,
      String encodingType,
      String keyMarker,
      int maxKeys,
      String prefix,
      String versionIdMarker}) async {
    var response_ = await _client.send('ListObjectVersions', {
      'Bucket': bucket,
      if (delimiter != null) 'Delimiter': delimiter,
      if (encodingType != null) 'EncodingType': encodingType,
      if (keyMarker != null) 'KeyMarker': keyMarker,
      if (maxKeys != null) 'MaxKeys': maxKeys,
      if (prefix != null) 'Prefix': prefix,
      if (versionIdMarker != null) 'VersionIdMarker': versionIdMarker,
    });
    return ListObjectVersionsOutput.fromJson(response_);
  }

  /// Returns some or all (up to 1000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket.
  ///
  /// [bucket]:
  ///
  /// [delimiter]: A delimiter is a character you use to group keys.
  ///
  /// [marker]: Specifies the key to start with when listing objects in a
  /// bucket.
  ///
  /// [maxKeys]: Sets the maximum number of keys returned in the response. The
  /// response might contain fewer keys but will never contain more.
  ///
  /// [prefix]: Limits the response to keys that begin with the specified
  /// prefix.
  ///
  /// [requestPayer]: Confirms that the requester knows that she or he will be
  /// charged for the list objects request. Bucket owners need not specify this
  /// parameter in their requests.
  Future<ListObjectsOutput> listObjects(String bucket,
      {String delimiter,
      String encodingType,
      String marker,
      int maxKeys,
      String prefix,
      String requestPayer}) async {
    var response_ = await _client.send('ListObjects', {
      'Bucket': bucket,
      if (delimiter != null) 'Delimiter': delimiter,
      if (encodingType != null) 'EncodingType': encodingType,
      if (marker != null) 'Marker': marker,
      if (maxKeys != null) 'MaxKeys': maxKeys,
      if (prefix != null) 'Prefix': prefix,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return ListObjectsOutput.fromJson(response_);
  }

  /// Returns some or all (up to 1000) of the objects in a bucket. You can use
  /// the request parameters as selection criteria to return a subset of the
  /// objects in a bucket. Note: ListObjectsV2 is the revised List Objects API
  /// and we recommend you use this revised API for new application development.
  ///
  /// [bucket]: Name of the bucket to list.
  ///
  /// [delimiter]: A delimiter is a character you use to group keys.
  ///
  /// [encodingType]: Encoding type used by Amazon S3 to encode object keys in
  /// the response.
  ///
  /// [maxKeys]: Sets the maximum number of keys returned in the response. The
  /// response might contain fewer keys but will never contain more.
  ///
  /// [prefix]: Limits the response to keys that begin with the specified
  /// prefix.
  ///
  /// [continuationToken]: ContinuationToken indicates Amazon S3 that the list
  /// is being continued on this bucket with a token. ContinuationToken is
  /// obfuscated and is not a real key
  ///
  /// [fetchOwner]: The owner field is not present in listV2 by default, if you
  /// want to return owner field with each key in the result then set the fetch
  /// owner field to true
  ///
  /// [startAfter]: StartAfter is where you want Amazon S3 to start listing
  /// from. Amazon S3 starts listing after this specified key. StartAfter can be
  /// any key in the bucket
  ///
  /// [requestPayer]: Confirms that the requester knows that she or he will be
  /// charged for the list objects request in V2 style. Bucket owners need not
  /// specify this parameter in their requests.
  Future<ListObjectsV2Output> listObjectsV2(String bucket,
      {String delimiter,
      String encodingType,
      int maxKeys,
      String prefix,
      String continuationToken,
      bool fetchOwner,
      String startAfter,
      String requestPayer}) async {
    var response_ = await _client.send('ListObjectsV2', {
      'Bucket': bucket,
      if (delimiter != null) 'Delimiter': delimiter,
      if (encodingType != null) 'EncodingType': encodingType,
      if (maxKeys != null) 'MaxKeys': maxKeys,
      if (prefix != null) 'Prefix': prefix,
      if (continuationToken != null) 'ContinuationToken': continuationToken,
      if (fetchOwner != null) 'FetchOwner': fetchOwner,
      if (startAfter != null) 'StartAfter': startAfter,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return ListObjectsV2Output.fromJson(response_);
  }

  /// Lists the parts that have been uploaded for a specific multipart upload.
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [maxParts]: Sets the maximum number of parts to return.
  ///
  /// [partNumberMarker]: Specifies the part after which listing should begin.
  /// Only parts with higher part numbers will be listed.
  ///
  /// [uploadId]: Upload ID identifying the multipart upload whose parts are
  /// being listed.
  Future<ListPartsOutput> listParts(
      {@required String bucket,
      @required String key,
      int maxParts,
      int partNumberMarker,
      @required String uploadId,
      String requestPayer}) async {
    var response_ = await _client.send('ListParts', {
      'Bucket': bucket,
      'Key': key,
      if (maxParts != null) 'MaxParts': maxParts,
      if (partNumberMarker != null) 'PartNumberMarker': partNumberMarker,
      'UploadId': uploadId,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return ListPartsOutput.fromJson(response_);
  }

  /// Sets the accelerate configuration of an existing bucket.
  ///
  /// [bucket]: Name of the bucket for which the accelerate configuration is
  /// set.
  ///
  /// [accelerateConfiguration]: Specifies the Accelerate Configuration you want
  /// to set for the bucket.
  Future<void> putBucketAccelerateConfiguration(
      {@required String bucket,
      @required AccelerateConfiguration accelerateConfiguration}) async {
    await _client.send('PutBucketAccelerateConfiguration', {
      'Bucket': bucket,
      'AccelerateConfiguration': accelerateConfiguration,
    });
  }

  /// Sets the permissions on a bucket using access control lists (ACL).
  ///
  /// [acl]: The canned ACL to apply to the bucket.
  ///
  /// [accessControlPolicy]: Contains the elements that set the ACL permissions
  /// for an object per grantee.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [grantFullControl]: Allows grantee the read, write, read ACP, and write
  /// ACP permissions on the bucket.
  ///
  /// [grantRead]: Allows grantee to list the objects in the bucket.
  ///
  /// [grantReadAcp]: Allows grantee to read the bucket ACL.
  ///
  /// [grantWrite]: Allows grantee to create, overwrite, and delete any object
  /// in the bucket.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// bucket.
  Future<void> putBucketAcl(String bucket,
      {String acl,
      AccessControlPolicy accessControlPolicy,
      String contentMd5,
      String grantFullControl,
      String grantRead,
      String grantReadAcp,
      String grantWrite,
      String grantWriteAcp}) async {
    await _client.send('PutBucketAcl', {
      if (acl != null) 'ACL': acl,
      if (accessControlPolicy != null)
        'AccessControlPolicy': accessControlPolicy,
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWrite != null) 'GrantWrite': grantWrite,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
    });
  }

  /// Sets an analytics configuration for the bucket (specified by the analytics
  /// configuration ID).
  ///
  /// [bucket]: The name of the bucket to which an analytics configuration is
  /// stored.
  ///
  /// [id]: The ID that identifies the analytics configuration.
  ///
  /// [analyticsConfiguration]: The configuration and any analyses for the
  /// analytics filter.
  Future<void> putBucketAnalyticsConfiguration(
      {@required String bucket,
      @required String id,
      @required AnalyticsConfiguration analyticsConfiguration}) async {
    await _client.send('PutBucketAnalyticsConfiguration', {
      'Bucket': bucket,
      'Id': id,
      'AnalyticsConfiguration': analyticsConfiguration,
    });
  }

  /// Sets the CORS configuration for a bucket.
  ///
  /// [bucket]:
  ///
  /// [corsConfiguration]:
  ///
  /// [contentMd5]:
  Future<void> putBucketCors(
      {@required String bucket,
      @required CorsConfiguration corsConfiguration,
      String contentMd5}) async {
    await _client.send('PutBucketCors', {
      'Bucket': bucket,
      'CORSConfiguration': corsConfiguration,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
    });
  }

  /// Creates a new server-side encryption configuration (or replaces an
  /// existing one, if present).
  ///
  /// [bucket]: Specifies default encryption for a bucket using server-side
  /// encryption with Amazon S3-managed keys (SSE-S3) or AWS KMS-managed keys
  /// (SSE-KMS). For information about the Amazon S3 default encryption feature,
  /// see
  /// [Amazon S3 Default Bucket Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  ///
  /// [contentMd5]: The base64-encoded 128-bit MD5 digest of the server-side
  /// encryption configuration. This parameter is auto-populated when using the
  /// command from the CLI.
  ///
  /// [serverSideEncryptionConfiguration]:
  Future<void> putBucketEncryption(
      {@required
          String bucket,
      String contentMd5,
      @required
          ServerSideEncryptionConfiguration
              serverSideEncryptionConfiguration}) async {
    await _client.send('PutBucketEncryption', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
    });
  }

  /// Adds an inventory configuration (identified by the inventory ID) from the
  /// bucket.
  ///
  /// [bucket]: The name of the bucket where the inventory configuration will be
  /// stored.
  ///
  /// [id]: The ID used to identify the inventory configuration.
  ///
  /// [inventoryConfiguration]: Specifies the inventory configuration.
  Future<void> putBucketInventoryConfiguration(
      {@required String bucket,
      @required String id,
      @required InventoryConfiguration inventoryConfiguration}) async {
    await _client.send('PutBucketInventoryConfiguration', {
      'Bucket': bucket,
      'Id': id,
      'InventoryConfiguration': inventoryConfiguration,
    });
  }

  ///  No longer used, see the PutBucketLifecycleConfiguration operation.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [lifecycleConfiguration]:
  Future<void> putBucketLifecycle(String bucket,
      {String contentMd5,
      LifecycleConfiguration lifecycleConfiguration}) async {
    await _client.send('PutBucketLifecycle', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (lifecycleConfiguration != null)
        'LifecycleConfiguration': lifecycleConfiguration,
    });
  }

  /// Sets lifecycle configuration for your bucket. If a lifecycle configuration
  /// exists, it replaces it.
  ///
  /// [bucket]:
  ///
  /// [lifecycleConfiguration]:
  Future<void> putBucketLifecycleConfiguration(String bucket,
      {BucketLifecycleConfiguration lifecycleConfiguration}) async {
    await _client.send('PutBucketLifecycleConfiguration', {
      'Bucket': bucket,
      if (lifecycleConfiguration != null)
        'LifecycleConfiguration': lifecycleConfiguration,
    });
  }

  /// Set the logging parameters for a bucket and to specify permissions for who
  /// can view and modify the logging parameters. To set the logging status of a
  /// bucket, you must be the bucket owner.
  ///
  /// [bucket]:
  ///
  /// [bucketLoggingStatus]:
  ///
  /// [contentMd5]:
  Future<void> putBucketLogging(
      {@required String bucket,
      @required BucketLoggingStatus bucketLoggingStatus,
      String contentMd5}) async {
    await _client.send('PutBucketLogging', {
      'Bucket': bucket,
      'BucketLoggingStatus': bucketLoggingStatus,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
    });
  }

  /// Sets a metrics configuration (specified by the metrics configuration ID)
  /// for the bucket.
  ///
  /// [bucket]: The name of the bucket for which the metrics configuration is
  /// set.
  ///
  /// [id]: The ID used to identify the metrics configuration.
  ///
  /// [metricsConfiguration]: Specifies the metrics configuration.
  Future<void> putBucketMetricsConfiguration(
      {@required String bucket,
      @required String id,
      @required MetricsConfiguration metricsConfiguration}) async {
    await _client.send('PutBucketMetricsConfiguration', {
      'Bucket': bucket,
      'Id': id,
      'MetricsConfiguration': metricsConfiguration,
    });
  }

  ///  No longer used, see the PutBucketNotificationConfiguration operation.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [notificationConfiguration]:
  Future<void> putBucketNotification(
      {@required
          String bucket,
      String contentMd5,
      @required
          NotificationConfigurationDeprecated
              notificationConfiguration}) async {
    await _client.send('PutBucketNotification', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'NotificationConfiguration': notificationConfiguration,
    });
  }

  /// Enables notifications of specified events for a bucket.
  ///
  /// [bucket]:
  ///
  /// [notificationConfiguration]:
  Future<void> putBucketNotificationConfiguration(
      {@required String bucket,
      @required NotificationConfiguration notificationConfiguration}) async {
    await _client.send('PutBucketNotificationConfiguration', {
      'Bucket': bucket,
      'NotificationConfiguration': notificationConfiguration,
    });
  }

  /// Applies an Amazon S3 bucket policy to an Amazon S3 bucket.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [confirmRemoveSelfBucketAccess]: Set this parameter to true to confirm
  /// that you want to remove your permissions to change this bucket policy in
  /// the future.
  ///
  /// [policy]: The bucket policy as a JSON document.
  Future<void> putBucketPolicy(
      {@required String bucket,
      String contentMd5,
      bool confirmRemoveSelfBucketAccess,
      @required String policy}) async {
    await _client.send('PutBucketPolicy', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (confirmRemoveSelfBucketAccess != null)
        'ConfirmRemoveSelfBucketAccess': confirmRemoveSelfBucketAccess,
      'Policy': policy,
    });
  }

  ///  Creates a replication configuration or replaces an existing one. For more
  /// information, see
  /// [Cross-Region Replication (CRR)](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html)
  /// in the _Amazon S3 Developer Guide_.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]: The base64-encoded 128-bit MD5 digest of the data. You must
  /// use this header as a message integrity check to verify that the request
  /// body was not corrupted in transit.
  ///
  /// [replicationConfiguration]:
  ///
  /// [token]: A token that allows Amazon S3 object lock to be enabled for an
  /// existing bucket.
  Future<void> putBucketReplication(
      {@required String bucket,
      String contentMd5,
      @required ReplicationConfiguration replicationConfiguration,
      String token}) async {
    await _client.send('PutBucketReplication', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'ReplicationConfiguration': replicationConfiguration,
      if (token != null) 'Token': token,
    });
  }

  /// Sets the request payment configuration for a bucket. By default, the
  /// bucket owner pays for downloads from the bucket. This configuration
  /// parameter enables the bucket owner (only) to specify that the person
  /// requesting the download will be charged for the download. Documentation on
  /// requester pays buckets can be found at
  /// http://docs.aws.amazon.com/AmazonS3/latest/dev/RequesterPaysBuckets.html
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [requestPaymentConfiguration]:
  Future<void> putBucketRequestPayment(
      {@required
          String bucket,
      String contentMd5,
      @required
          RequestPaymentConfiguration requestPaymentConfiguration}) async {
    await _client.send('PutBucketRequestPayment', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'RequestPaymentConfiguration': requestPaymentConfiguration,
    });
  }

  /// Sets the tags for a bucket.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [tagging]:
  Future<void> putBucketTagging(
      {@required String bucket,
      String contentMd5,
      @required Tagging tagging}) async {
    await _client.send('PutBucketTagging', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'Tagging': tagging,
    });
  }

  /// Sets the versioning state of an existing bucket. To set the versioning
  /// state, you must be the bucket owner.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [mfa]: The concatenation of the authentication device's serial number, a
  /// space, and the value that is displayed on your authentication device.
  ///
  /// [versioningConfiguration]:
  Future<void> putBucketVersioning(
      {@required String bucket,
      String contentMd5,
      String mfa,
      @required VersioningConfiguration versioningConfiguration}) async {
    await _client.send('PutBucketVersioning', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (mfa != null) 'MFA': mfa,
      'VersioningConfiguration': versioningConfiguration,
    });
  }

  /// Set the website configuration for a bucket.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [websiteConfiguration]:
  Future<void> putBucketWebsite(
      {@required String bucket,
      String contentMd5,
      @required WebsiteConfiguration websiteConfiguration}) async {
    await _client.send('PutBucketWebsite', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'WebsiteConfiguration': websiteConfiguration,
    });
  }

  /// Adds an object to a bucket.
  ///
  /// [acl]: The canned ACL to apply to the object.
  ///
  /// [body]: Object data.
  ///
  /// [bucket]: Name of the bucket to which the PUT operation was initiated.
  ///
  /// [cacheControl]: Specifies caching behavior along the request/reply chain.
  ///
  /// [contentDisposition]: Specifies presentational information for the object.
  ///
  /// [contentEncoding]: Specifies what content encodings have been applied to
  /// the object and thus what decoding mechanisms must be applied to obtain the
  /// media-type referenced by the Content-Type header field.
  ///
  /// [contentLanguage]: The language the content is in.
  ///
  /// [contentLength]: Size of the body in bytes. This parameter is useful when
  /// the size of the body cannot be determined automatically.
  ///
  /// [contentMd5]: The base64-encoded 128-bit MD5 digest of the part data. This
  /// parameter is auto-populated when using the command from the CLI. This
  /// parameted is required if object lock parameters are specified.
  ///
  /// [contentType]: A standard MIME type describing the format of the object
  /// data.
  ///
  /// [expires]: The date and time at which the object is no longer cacheable.
  ///
  /// [grantFullControl]: Gives the grantee READ, READ_ACP, and WRITE_ACP
  /// permissions on the object.
  ///
  /// [grantRead]: Allows grantee to read the object data and its metadata.
  ///
  /// [grantReadAcp]: Allows grantee to read the object ACL.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// object.
  ///
  /// [key]: Object key for which the PUT operation was initiated.
  ///
  /// [metadata]: A map of metadata to store with the object in S3.
  ///
  /// [serverSideEncryption]: The Server-side encryption algorithm used when
  /// storing this object in S3 (e.g., AES256, aws:kms).
  ///
  /// [storageClass]: The type of storage to use for the object. Defaults to
  /// 'STANDARD'.
  ///
  /// [websiteRedirectLocation]: If the bucket is configured as a website,
  /// redirects requests for this object to another object in the same bucket or
  /// to an external URL. Amazon S3 stores the value of this header in the
  /// object metadata.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [ssekmsKeyId]: Specifies the AWS KMS key ID to use for object encryption.
  /// All GET and PUT requests for an object protected by AWS KMS will fail if
  /// not made via SSL or using SigV4. Documentation on configuring any of the
  /// officially supported AWS SDKs and CLI can be found at
  /// http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version
  ///
  /// [ssekmsEncryptionContext]: Specifies the AWS KMS Encryption Context to use
  /// for object encryption. The value of this header is a base64-encoded UTF-8
  /// string holding JSON with the encryption context key-value pairs.
  ///
  /// [tagging]: The tag-set for the object. The tag-set must be encoded as URL
  /// Query parameters. (For example, "Key1=Value1")
  ///
  /// [objectLockMode]: The object lock mode that you want to apply to this
  /// object.
  ///
  /// [objectLockRetainUntilDate]: The date and time when you want this object's
  /// object lock to expire.
  ///
  /// [objectLockLegalHoldStatus]: The Legal Hold status that you want to apply
  /// to the specified object.
  Future<PutObjectOutput> putObject(
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
      String objectLockLegalHoldStatus}) async {
    var response_ = await _client.send('PutObject', {
      if (acl != null) 'ACL': acl,
      if (body != null) 'Body': body,
      'Bucket': bucket,
      if (cacheControl != null) 'CacheControl': cacheControl,
      if (contentDisposition != null) 'ContentDisposition': contentDisposition,
      if (contentEncoding != null) 'ContentEncoding': contentEncoding,
      if (contentLanguage != null) 'ContentLanguage': contentLanguage,
      if (contentLength != null) 'ContentLength': contentLength,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (contentType != null) 'ContentType': contentType,
      if (expires != null) 'Expires': expires,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
      'Key': key,
      if (metadata != null) 'Metadata': metadata,
      if (serverSideEncryption != null)
        'ServerSideEncryption': serverSideEncryption,
      if (storageClass != null) 'StorageClass': storageClass,
      if (websiteRedirectLocation != null)
        'WebsiteRedirectLocation': websiteRedirectLocation,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (ssekmsKeyId != null) 'SSEKMSKeyId': ssekmsKeyId,
      if (ssekmsEncryptionContext != null)
        'SSEKMSEncryptionContext': ssekmsEncryptionContext,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (tagging != null) 'Tagging': tagging,
      if (objectLockMode != null) 'ObjectLockMode': objectLockMode,
      if (objectLockRetainUntilDate != null)
        'ObjectLockRetainUntilDate': objectLockRetainUntilDate,
      if (objectLockLegalHoldStatus != null)
        'ObjectLockLegalHoldStatus': objectLockLegalHoldStatus,
    });
    return PutObjectOutput.fromJson(response_);
  }

  /// uses the acl subresource to set the access control list (ACL) permissions
  /// for an object that already exists in a bucket
  ///
  /// [acl]: The canned ACL to apply to the object.
  ///
  /// [accessControlPolicy]: Contains the elements that set the ACL permissions
  /// for an object per grantee.
  ///
  /// [bucket]:
  ///
  /// [contentMd5]:
  ///
  /// [grantFullControl]: Allows grantee the read, write, read ACP, and write
  /// ACP permissions on the bucket.
  ///
  /// [grantRead]: Allows grantee to list the objects in the bucket.
  ///
  /// [grantReadAcp]: Allows grantee to read the bucket ACL.
  ///
  /// [grantWrite]: Allows grantee to create, overwrite, and delete any object
  /// in the bucket.
  ///
  /// [grantWriteAcp]: Allows grantee to write the ACL for the applicable
  /// bucket.
  ///
  /// [key]:
  ///
  /// [versionId]: VersionId used to reference a specific version of the object.
  Future<PutObjectAclOutput> putObjectAcl(
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
      String versionId}) async {
    var response_ = await _client.send('PutObjectAcl', {
      if (acl != null) 'ACL': acl,
      if (accessControlPolicy != null)
        'AccessControlPolicy': accessControlPolicy,
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      if (grantFullControl != null) 'GrantFullControl': grantFullControl,
      if (grantRead != null) 'GrantRead': grantRead,
      if (grantReadAcp != null) 'GrantReadACP': grantReadAcp,
      if (grantWrite != null) 'GrantWrite': grantWrite,
      if (grantWriteAcp != null) 'GrantWriteACP': grantWriteAcp,
      'Key': key,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (versionId != null) 'VersionId': versionId,
    });
    return PutObjectAclOutput.fromJson(response_);
  }

  /// Applies a Legal Hold configuration to the specified object.
  ///
  /// [bucket]: The bucket containing the object that you want to place a Legal
  /// Hold on.
  ///
  /// [key]: The key name for the object that you want to place a Legal Hold on.
  ///
  /// [legalHold]: Container element for the Legal Hold configuration you want
  /// to apply to the specified object.
  ///
  /// [versionId]: The version ID of the object that you want to place a Legal
  /// Hold on.
  ///
  /// [contentMd5]: The MD5 hash for the request body.
  Future<PutObjectLegalHoldOutput> putObjectLegalHold(
      {@required String bucket,
      @required String key,
      ObjectLockLegalHold legalHold,
      String requestPayer,
      String versionId,
      String contentMd5}) async {
    var response_ = await _client.send('PutObjectLegalHold', {
      'Bucket': bucket,
      'Key': key,
      if (legalHold != null) 'LegalHold': legalHold,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (versionId != null) 'VersionId': versionId,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
    });
    return PutObjectLegalHoldOutput.fromJson(response_);
  }

  /// Places an object lock configuration on the specified bucket. The rule
  /// specified in the object lock configuration will be applied by default to
  /// every new object placed in the specified bucket.
  ///
  /// [bucket]: The bucket whose object lock configuration you want to create or
  /// replace.
  ///
  /// [objectLockConfiguration]: The object lock configuration that you want to
  /// apply to the specified bucket.
  ///
  /// [token]: A token to allow Amazon S3 object lock to be enabled for an
  /// existing bucket.
  ///
  /// [contentMd5]: The MD5 hash for the request body.
  Future<PutObjectLockConfigurationOutput> putObjectLockConfiguration(
      String bucket,
      {ObjectLockConfiguration objectLockConfiguration,
      String requestPayer,
      String token,
      String contentMd5}) async {
    var response_ = await _client.send('PutObjectLockConfiguration', {
      'Bucket': bucket,
      if (objectLockConfiguration != null)
        'ObjectLockConfiguration': objectLockConfiguration,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (token != null) 'Token': token,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
    });
    return PutObjectLockConfigurationOutput.fromJson(response_);
  }

  /// Places an Object Retention configuration on an object.
  ///
  /// [bucket]: The bucket that contains the object you want to apply this
  /// Object Retention configuration to.
  ///
  /// [key]: The key name for the object that you want to apply this Object
  /// Retention configuration to.
  ///
  /// [retention]: The container element for the Object Retention configuration.
  ///
  /// [versionId]: The version ID for the object that you want to apply this
  /// Object Retention configuration to.
  ///
  /// [bypassGovernanceRetention]: Indicates whether this operation should
  /// bypass Governance-mode restrictions.j
  ///
  /// [contentMd5]: The MD5 hash for the request body.
  Future<PutObjectRetentionOutput> putObjectRetention(
      {@required String bucket,
      @required String key,
      ObjectLockRetention retention,
      String requestPayer,
      String versionId,
      bool bypassGovernanceRetention,
      String contentMd5}) async {
    var response_ = await _client.send('PutObjectRetention', {
      'Bucket': bucket,
      'Key': key,
      if (retention != null) 'Retention': retention,
      if (requestPayer != null) 'RequestPayer': requestPayer,
      if (versionId != null) 'VersionId': versionId,
      if (bypassGovernanceRetention != null)
        'BypassGovernanceRetention': bypassGovernanceRetention,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
    });
    return PutObjectRetentionOutput.fromJson(response_);
  }

  /// Sets the supplied tag-set to an object that already exists in a bucket
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [versionId]:
  ///
  /// [contentMd5]:
  ///
  /// [tagging]:
  Future<PutObjectTaggingOutput> putObjectTagging(
      {@required String bucket,
      @required String key,
      String versionId,
      String contentMd5,
      @required Tagging tagging}) async {
    var response_ = await _client.send('PutObjectTagging', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'Tagging': tagging,
    });
    return PutObjectTaggingOutput.fromJson(response_);
  }

  /// Creates or modifies the `PublicAccessBlock` configuration for an Amazon S3
  /// bucket.
  ///
  /// [bucket]: The name of the Amazon S3 bucket whose `PublicAccessBlock`
  /// configuration you want to set.
  ///
  /// [contentMd5]: The MD5 hash of the `PutPublicAccessBlock` request body.
  ///
  /// [publicAccessBlockConfiguration]: The `PublicAccessBlock` configuration
  /// that you want to apply to this Amazon S3 bucket. You can enable the
  /// configuration options in any combination. For more information about when
  /// Amazon S3 considers a bucket or object public, see
  /// [The Meaning of "Public"](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  Future<void> putPublicAccessBlock(
      {@required
          String bucket,
      String contentMd5,
      @required
          PublicAccessBlockConfiguration
              publicAccessBlockConfiguration}) async {
    await _client.send('PutPublicAccessBlock', {
      'Bucket': bucket,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
    });
  }

  /// Restores an archived copy of an object back into Amazon S3
  ///
  /// [bucket]:
  ///
  /// [key]:
  ///
  /// [versionId]:
  ///
  /// [restoreRequest]:
  Future<RestoreObjectOutput> restoreObject(
      {@required String bucket,
      @required String key,
      String versionId,
      RestoreRequest restoreRequest,
      String requestPayer}) async {
    var response_ = await _client.send('RestoreObject', {
      'Bucket': bucket,
      'Key': key,
      if (versionId != null) 'VersionId': versionId,
      if (restoreRequest != null) 'RestoreRequest': restoreRequest,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return RestoreObjectOutput.fromJson(response_);
  }

  /// This operation filters the contents of an Amazon S3 object based on a
  /// simple Structured Query Language (SQL) statement. In the request, along
  /// with the SQL expression, you must also specify a data serialization format
  /// (JSON or CSV) of the object. Amazon S3 uses this to parse object data into
  /// records, and returns only records that match the specified SQL expression.
  /// You must also specify the data serialization format for the response.
  ///
  /// [bucket]: The S3 bucket.
  ///
  /// [key]: The object key.
  ///
  /// [sseCustomerAlgorithm]: The SSE Algorithm used to encrypt the object. For
  /// more information, see
  /// [Server-Side Encryption (Using Customer-Provided Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html).
  ///
  /// [sseCustomerKey]: The SSE Customer Key. For more information, see
  /// [Server-Side Encryption (Using Customer-Provided Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html).
  ///
  /// [sseCustomerKeyMd5]: The SSE Customer Key MD5. For more information, see
  /// [Server-Side Encryption (Using Customer-Provided Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html).
  ///
  /// [expression]: The expression that is used to query the object.
  ///
  /// [expressionType]: The type of the provided expression (for example., SQL).
  ///
  /// [requestProgress]: Specifies if periodic request progress information
  /// should be enabled.
  ///
  /// [inputSerialization]: Describes the format of the data in the object that
  /// is being queried.
  ///
  /// [outputSerialization]: Describes the format of the data that you want
  /// Amazon S3 to return in response.
  Future<SelectObjectContentOutput> selectObjectContent(
      {@required String bucket,
      @required String key,
      String sseCustomerAlgorithm,
      Uint8List sseCustomerKey,
      String sseCustomerKeyMd5,
      @required String expression,
      @required String expressionType,
      RequestProgress requestProgress,
      @required InputSerialization inputSerialization,
      @required OutputSerialization outputSerialization}) async {
    var response_ = await _client.send('SelectObjectContent', {
      'Bucket': bucket,
      'Key': key,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      'Expression': expression,
      'ExpressionType': expressionType,
      if (requestProgress != null) 'RequestProgress': requestProgress,
      'InputSerialization': inputSerialization,
      'OutputSerialization': outputSerialization,
    });
    return SelectObjectContentOutput.fromJson(response_);
  }

  /// Uploads a part in a multipart upload.
  ///
  ///  **Note:** After you initiate multipart upload and upload one or more
  /// parts, you must either complete or abort multipart upload in order to stop
  /// getting charged for storage of the uploaded parts. Only after you either
  /// complete or abort multipart upload, Amazon S3 frees up the parts storage
  /// and stops charging you for the parts storage.
  ///
  /// [body]: Object data.
  ///
  /// [bucket]: Name of the bucket to which the multipart upload was initiated.
  ///
  /// [contentLength]: Size of the body in bytes. This parameter is useful when
  /// the size of the body cannot be determined automatically.
  ///
  /// [contentMd5]: The base64-encoded 128-bit MD5 digest of the part data. This
  /// parameter is auto-populated when using the command from the CLI. This
  /// parameted is required if object lock parameters are specified.
  ///
  /// [key]: Object key for which the multipart upload was initiated.
  ///
  /// [partNumber]: Part number of part being uploaded. This is a positive
  /// integer between 1 and 10,000.
  ///
  /// [uploadId]: Upload ID identifying the multipart upload whose part is being
  /// uploaded.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header. This must be the
  /// same encryption key specified in the initiate multipart upload request.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  Future<UploadPartOutput> uploadPart(
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
      String requestPayer}) async {
    var response_ = await _client.send('UploadPart', {
      if (body != null) 'Body': body,
      'Bucket': bucket,
      if (contentLength != null) 'ContentLength': contentLength,
      if (contentMd5 != null) 'ContentMD5': contentMd5,
      'Key': key,
      'PartNumber': partNumber,
      'UploadId': uploadId,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return UploadPartOutput.fromJson(response_);
  }

  /// Uploads a part by copying data from an existing object as data source.
  ///
  /// [bucket]:
  ///
  /// [copySource]: The name of the source bucket and key name of the source
  /// object, separated by a slash (/). Must be URL-encoded.
  ///
  /// [copySourceIfMatch]: Copies the object if its entity tag (ETag) matches
  /// the specified tag.
  ///
  /// [copySourceIfModifiedSince]: Copies the object if it has been modified
  /// since the specified time.
  ///
  /// [copySourceIfNoneMatch]: Copies the object if its entity tag (ETag) is
  /// different than the specified ETag.
  ///
  /// [copySourceIfUnmodifiedSince]: Copies the object if it hasn't been
  /// modified since the specified time.
  ///
  /// [copySourceRange]: The range of bytes to copy from the source object. The
  /// range value must use the form bytes=first-last, where the first and last
  /// are the zero-based byte offsets to copy. For example, bytes=0-9 indicates
  /// that you want to copy the first ten bytes of the source. You can copy a
  /// range only if the source object is greater than 5 MB.
  ///
  /// [key]:
  ///
  /// [partNumber]: Part number of part being copied. This is a positive integer
  /// between 1 and 10,000.
  ///
  /// [uploadId]: Upload ID identifying the multipart upload whose part is being
  /// copied.
  ///
  /// [sseCustomerAlgorithm]: Specifies the algorithm to use to when encrypting
  /// the object (e.g., AES256).
  ///
  /// [sseCustomerKey]: Specifies the customer-provided encryption key for
  /// Amazon S3 to use in encrypting data. This value is used to store the
  /// object and then it is discarded; Amazon does not store the encryption key.
  /// The key must be appropriate for use with the algorithm specified in the
  /// x-amz-server-side​-encryption​-customer-algorithm header. This must be the
  /// same encryption key specified in the initiate multipart upload request.
  ///
  /// [sseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the encryption
  /// key according to RFC 1321. Amazon S3 uses this header for a message
  /// integrity check to ensure the encryption key was transmitted without
  /// error.
  ///
  /// [copySourceSseCustomerAlgorithm]: Specifies the algorithm to use when
  /// decrypting the source object (e.g., AES256).
  ///
  /// [copySourceSseCustomerKey]: Specifies the customer-provided encryption key
  /// for Amazon S3 to use to decrypt the source object. The encryption key
  /// provided in this header must be one that was used when the source object
  /// was created.
  ///
  /// [copySourceSseCustomerKeyMd5]: Specifies the 128-bit MD5 digest of the
  /// encryption key according to RFC 1321. Amazon S3 uses this header for a
  /// message integrity check to ensure the encryption key was transmitted
  /// without error.
  Future<UploadPartCopyOutput> uploadPartCopy(
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
      String requestPayer}) async {
    var response_ = await _client.send('UploadPartCopy', {
      'Bucket': bucket,
      'CopySource': copySource,
      if (copySourceIfMatch != null) 'CopySourceIfMatch': copySourceIfMatch,
      if (copySourceIfModifiedSince != null)
        'CopySourceIfModifiedSince': copySourceIfModifiedSince,
      if (copySourceIfNoneMatch != null)
        'CopySourceIfNoneMatch': copySourceIfNoneMatch,
      if (copySourceIfUnmodifiedSince != null)
        'CopySourceIfUnmodifiedSince': copySourceIfUnmodifiedSince,
      if (copySourceRange != null) 'CopySourceRange': copySourceRange,
      'Key': key,
      'PartNumber': partNumber,
      'UploadId': uploadId,
      if (sseCustomerAlgorithm != null)
        'SSECustomerAlgorithm': sseCustomerAlgorithm,
      if (sseCustomerKey != null) 'SSECustomerKey': sseCustomerKey,
      if (sseCustomerKeyMd5 != null) 'SSECustomerKeyMD5': sseCustomerKeyMd5,
      if (copySourceSseCustomerAlgorithm != null)
        'CopySourceSSECustomerAlgorithm': copySourceSseCustomerAlgorithm,
      if (copySourceSseCustomerKey != null)
        'CopySourceSSECustomerKey': copySourceSseCustomerKey,
      if (copySourceSseCustomerKeyMd5 != null)
        'CopySourceSSECustomerKeyMD5': copySourceSseCustomerKeyMd5,
      if (requestPayer != null) 'RequestPayer': requestPayer,
    });
    return UploadPartCopyOutput.fromJson(response_);
  }
}

/// Specifies the days since the initiation of an incomplete multipart upload
/// that Amazon S3 will wait before permanently removing all parts of the
/// upload. For more information, see
/// [Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Policy](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config)
/// in the _Amazon Simple Storage Service Developer Guide_.
class AbortIncompleteMultipartUpload {
  /// Specifies the number of days after which Amazon S3 aborts an incomplete
  /// multipart upload.
  final int daysAfterInitiation;

  AbortIncompleteMultipartUpload({
    this.daysAfterInitiation,
  });
  static AbortIncompleteMultipartUpload fromJson(Map<String, dynamic> json) =>
      AbortIncompleteMultipartUpload(
        daysAfterInitiation: json.containsKey('DaysAfterInitiation')
            ? json['DaysAfterInitiation'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class AbortMultipartUploadOutput {
  final String requestCharged;

  AbortMultipartUploadOutput({
    this.requestCharged,
  });
  static AbortMultipartUploadOutput fromJson(Map<String, dynamic> json) =>
      AbortMultipartUploadOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

/// Configures the transfer acceleration state for an Amazon S3 bucket. For more
/// information, see
/// [Amazon S3 Transfer Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html)
/// in the _Amazon Simple Storage Service Developer Guide_.
class AccelerateConfiguration {
  /// Specifies the transfer acceleration status of the bucket.
  final String status;

  AccelerateConfiguration({
    this.status,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the elements that set the ACL permissions for an object per
/// grantee.
class AccessControlPolicy {
  /// A list of grants.
  final List<Grant> grants;

  /// Container for the bucket owner's display name and ID.
  final Owner owner;

  AccessControlPolicy({
    this.grants,
    this.owner,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for information about access control for replicas.
class AccessControlTranslation {
  /// Specifies the replica ownership. For default and valid values, see
  /// [PUT bucket replication](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html)
  /// in the _Amazon Simple Storage Service API Reference_.
  final String owner;

  AccessControlTranslation({
    @required this.owner,
  });
  static AccessControlTranslation fromJson(Map<String, dynamic> json) =>
      AccessControlTranslation(
        owner: json['Owner'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A conjunction (logical AND) of predicates, which is used in evaluating a
/// metrics filter. The operator must have at least two predicates in any
/// combination, and an object must match all of the predicates for the filter
/// to apply.
class AnalyticsAndOperator {
  /// The prefix to use when evaluating an AND predicate: The prefix that an
  /// object must have to be included in the metrics results.
  final String prefix;

  /// The list of tags to use when evaluating an AND predicate.
  final List<Tag> tags;

  AnalyticsAndOperator({
    this.prefix,
    this.tags,
  });
  static AnalyticsAndOperator fromJson(Map<String, dynamic> json) =>
      AnalyticsAndOperator(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Specifies the configuration and any analyses for the analytics filter of an
/// Amazon S3 bucket.
///
/// For more information, see
/// [GET Bucket analytics](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETAnalyticsConfig.html)
/// in the _Amazon Simple Storage Service API Reference_.
class AnalyticsConfiguration {
  /// The ID that identifies the analytics configuration.
  final String id;

  /// The filter used to describe a set of objects for analyses. A filter must
  /// have exactly one prefix, one tag, or one conjunction
  /// (AnalyticsAndOperator). If no filter is provided, all objects will be
  /// considered in any analysis.
  final AnalyticsFilter filter;

  ///  Contains data related to access patterns to be collected and made
  /// available to analyze the tradeoffs between different storage classes.
  final StorageClassAnalysis storageClassAnalysis;

  AnalyticsConfiguration({
    @required this.id,
    this.filter,
    @required this.storageClassAnalysis,
  });
  static AnalyticsConfiguration fromJson(Map<String, dynamic> json) =>
      AnalyticsConfiguration(
        id: json['Id'] as String,
        filter: json.containsKey('Filter')
            ? AnalyticsFilter.fromJson(json['Filter'])
            : null,
        storageClassAnalysis:
            StorageClassAnalysis.fromJson(json['StorageClassAnalysis']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Where to publish the analytics results.
class AnalyticsExportDestination {
  /// A destination signifying output to an S3 bucket.
  final AnalyticsS3BucketDestination s3BucketDestination;

  AnalyticsExportDestination({
    @required this.s3BucketDestination,
  });
  static AnalyticsExportDestination fromJson(Map<String, dynamic> json) =>
      AnalyticsExportDestination(
        s3BucketDestination:
            AnalyticsS3BucketDestination.fromJson(json['S3BucketDestination']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class AnalyticsFilter {
  /// The prefix to use when evaluating an analytics filter.
  final String prefix;

  /// The tag to use when evaluating an analytics filter.
  final Tag tag;

  /// A conjunction (logical AND) of predicates, which is used in evaluating an
  /// analytics filter. The operator must have at least two predicates.
  final AnalyticsAndOperator and;

  AnalyticsFilter({
    this.prefix,
    this.tag,
    this.and,
  });
  static AnalyticsFilter fromJson(Map<String, dynamic> json) => AnalyticsFilter(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tag: json.containsKey('Tag') ? Tag.fromJson(json['Tag']) : null,
        and: json.containsKey('And')
            ? AnalyticsAndOperator.fromJson(json['And'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class AnalyticsS3BucketDestination {
  /// Specifies the file format used when exporting data to Amazon S3.
  final String format;

  /// The account ID that owns the destination bucket. If no account ID is
  /// provided, the owner will not be validated prior to exporting data.
  final String bucketAccountId;

  /// The Amazon Resource Name (ARN) of the bucket to which data is exported.
  final String bucket;

  /// The prefix to use when exporting data. The prefix is prepended to all
  /// results.
  final String prefix;

  AnalyticsS3BucketDestination({
    @required this.format,
    this.bucketAccountId,
    @required this.bucket,
    this.prefix,
  });
  static AnalyticsS3BucketDestination fromJson(Map<String, dynamic> json) =>
      AnalyticsS3BucketDestination(
        format: json['Format'] as String,
        bucketAccountId: json.containsKey('BucketAccountId')
            ? json['BucketAccountId'] as String
            : null,
        bucket: json['Bucket'] as String,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Bucket {
  /// The name of the bucket.
  final String name;

  /// Date the bucket was created.
  final DateTime creationDate;

  Bucket({
    this.name,
    this.creationDate,
  });
  static Bucket fromJson(Map<String, dynamic> json) => Bucket(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
}

/// Specifies the lifecycle configuration for objects in an Amazon S3 bucket.
/// For more information, see
/// [Object Lifecycle Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)
/// in the _Amazon Simple Storage Service Developer Guide_.
class BucketLifecycleConfiguration {
  /// A lifecycle rule for individual objects in an Amazon S3 bucket.
  final List<LifecycleRule> rules;

  BucketLifecycleConfiguration({
    @required this.rules,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class BucketLoggingStatus {
  final LoggingEnabled loggingEnabled;

  BucketLoggingStatus({
    this.loggingEnabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the cross-origin access configuration for objects in an Amazon S3
/// bucket. For more information, see
/// [Enabling Cross-Origin Resource Sharing](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html)
/// in the _Amazon Simple Storage Service Developer Guide_.
class CorsConfiguration {
  /// A set of allowed origins and methods.
  final List<CorsRule> corsRules;

  CorsConfiguration({
    @required this.corsRules,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a cross-origin access rule for an Amazon S3 bucket.
class CorsRule {
  /// Headers that are specified in the `Access-Control-Request-Headers` header.
  /// These headers are allowed in a preflight OPTIONS request. In response to
  /// any preflight OPTIONS request, Amazon S3 returns any requested headers
  /// that are allowed.
  final List<String> allowedHeaders;

  /// An HTTP method that you allow the origin to execute. Valid values are
  /// `GET`, `PUT`, `HEAD`, `POST`, and `DELETE`.
  final List<String> allowedMethods;

  /// One or more origins you want customers to be able to access the bucket
  /// from.
  final List<String> allowedOrigins;

  /// One or more headers in the response that you want customers to be able to
  /// access from their applications (for example, from a JavaScript
  /// `XMLHttpRequest` object).
  final List<String> exposeHeaders;

  /// The time in seconds that your browser is to cache the preflight response
  /// for the specified resource.
  final int maxAgeSeconds;

  CorsRule({
    this.allowedHeaders,
    @required this.allowedMethods,
    @required this.allowedOrigins,
    this.exposeHeaders,
    this.maxAgeSeconds,
  });
  static CorsRule fromJson(Map<String, dynamic> json) => CorsRule(
        allowedHeaders: json.containsKey('AllowedHeaders')
            ? (json['AllowedHeaders'] as List).map((e) => e as String).toList()
            : null,
        allowedMethods:
            (json['AllowedMethods'] as List).map((e) => e as String).toList(),
        allowedOrigins:
            (json['AllowedOrigins'] as List).map((e) => e as String).toList(),
        exposeHeaders: json.containsKey('ExposeHeaders')
            ? (json['ExposeHeaders'] as List).map((e) => e as String).toList()
            : null,
        maxAgeSeconds: json.containsKey('MaxAgeSeconds')
            ? json['MaxAgeSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes how a CSV-formatted input object is formatted.
class CsvInput {
  /// Describes the first line of input. Valid values: None, Ignore, Use.
  final String fileHeaderInfo;

  /// The single character used to indicate a row should be ignored when present
  /// at the start of a row.
  final String comments;

  /// The single character used for escaping the quote character inside an
  /// already escaped value.
  final String quoteEscapeCharacter;

  /// The value used to separate individual records.
  final String recordDelimiter;

  /// The value used to separate individual fields in a record.
  final String fieldDelimiter;

  /// Value used for escaping where the field delimiter is part of the value.
  final String quoteCharacter;

  /// Specifies that CSV field values may contain quoted record delimiters and
  /// such records should be allowed. Default value is FALSE. Setting this value
  /// to TRUE may lower performance.
  final bool allowQuotedRecordDelimiter;

  CsvInput({
    this.fileHeaderInfo,
    this.comments,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
    this.fieldDelimiter,
    this.quoteCharacter,
    this.allowQuotedRecordDelimiter,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes how CSV-formatted results are formatted.
class CsvOutput {
  /// Indicates whether or not all output fields should be quoted.
  final String quoteFields;

  /// Th single character used for escaping the quote character inside an
  /// already escaped value.
  final String quoteEscapeCharacter;

  /// The value used to separate individual records.
  final String recordDelimiter;

  /// The value used to separate individual fields in a record.
  final String fieldDelimiter;

  /// The value used for escaping where the field delimiter is part of the
  /// value.
  final String quoteCharacter;

  CsvOutput({
    this.quoteFields,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
    this.fieldDelimiter,
    this.quoteCharacter,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CloudFunctionConfiguration {
  final String id;

  final String event;

  final List<String> events;

  final String cloudFunction;

  final String invocationRole;

  CloudFunctionConfiguration({
    this.id,
    this.event,
    this.events,
    this.cloudFunction,
    this.invocationRole,
  });
  static CloudFunctionConfiguration fromJson(Map<String, dynamic> json) =>
      CloudFunctionConfiguration(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        event: json.containsKey('Event') ? json['Event'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => e as String).toList()
            : null,
        cloudFunction: json.containsKey('CloudFunction')
            ? json['CloudFunction'] as String
            : null,
        invocationRole: json.containsKey('InvocationRole')
            ? json['InvocationRole'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CommonPrefix {
  final String prefix;

  CommonPrefix({
    this.prefix,
  });
  static CommonPrefix fromJson(Map<String, dynamic> json) => CommonPrefix(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
      );
}

class CompleteMultipartUploadOutput {
  final String location;

  final String bucket;

  final String key;

  /// If the object expiration is configured, this will contain the expiration
  /// date (expiry-date) and rule ID (rule-id). The value of rule-id is URL
  /// encoded.
  final String expiration;

  /// Entity tag of the object.
  final String eTag;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// Version of the object.
  final String versionId;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  final String requestCharged;

  CompleteMultipartUploadOutput({
    this.location,
    this.bucket,
    this.key,
    this.expiration,
    this.eTag,
    this.serverSideEncryption,
    this.versionId,
    this.ssekmsKeyId,
    this.requestCharged,
  });
  static CompleteMultipartUploadOutput fromJson(Map<String, dynamic> json) =>
      CompleteMultipartUploadOutput(
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        expiration: json.containsKey('Expiration')
            ? json['Expiration'] as String
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class CompletedMultipartUpload {
  final List<CompletedPart> parts;

  CompletedMultipartUpload({
    this.parts,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CompletedPart {
  /// Entity tag returned when the part was uploaded.
  final String eTag;

  /// Part number that identifies the part. This is a positive integer between 1
  /// and 10,000.
  final int partNumber;

  CompletedPart({
    this.eTag,
    this.partNumber,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a condition that must be met for a redirect to apply.
class Condition {
  /// The HTTP error code when the redirect is applied. In the event of an
  /// error, if the error code equals this value, then the specified redirect is
  /// applied. Required when parent element `Condition` is specified and sibling
  /// `KeyPrefixEquals` is not specified. If both are specified, then both must
  /// be true for the redirect to be applied.
  final String httpErrorCodeReturnedEquals;

  /// The object key name prefix when the redirect is applied. For example, to
  /// redirect requests for `ExamplePage.html`, the key prefix will be
  /// `ExamplePage.html`. To redirect request for all pages with the prefix
  /// `docs/`, the key prefix will be `/docs`, which identifies all objects in
  /// the docs/ folder. Required when the parent element `Condition` is
  /// specified and sibling `HttpErrorCodeReturnedEquals` is not specified. If
  /// both conditions are specified, both must be true for the redirect to be
  /// applied.
  final String keyPrefixEquals;

  Condition({
    this.httpErrorCodeReturnedEquals,
    this.keyPrefixEquals,
  });
  static Condition fromJson(Map<String, dynamic> json) => Condition(
        httpErrorCodeReturnedEquals:
            json.containsKey('HttpErrorCodeReturnedEquals')
                ? json['HttpErrorCodeReturnedEquals'] as String
                : null,
        keyPrefixEquals: json.containsKey('KeyPrefixEquals')
            ? json['KeyPrefixEquals'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ContinuationEvent {
  ContinuationEvent();
  static ContinuationEvent fromJson(Map<String, dynamic> json) =>
      ContinuationEvent();
}

class CopyObjectOutput {
  final CopyObjectResult copyObjectResult;

  /// If the object expiration is configured, the response includes this header.
  final String expiration;

  final String copySourceVersionId;

  /// Version ID of the newly created copy.
  final String versionId;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String ssekmsEncryptionContext;

  final String requestCharged;

  CopyObjectOutput({
    this.copyObjectResult,
    this.expiration,
    this.copySourceVersionId,
    this.versionId,
    this.serverSideEncryption,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.ssekmsEncryptionContext,
    this.requestCharged,
  });
  static CopyObjectOutput fromJson(Map<String, dynamic> json) =>
      CopyObjectOutput(
        copyObjectResult: json.containsKey('CopyObjectResult')
            ? CopyObjectResult.fromJson(json['CopyObjectResult'])
            : null,
        expiration: json.containsKey('Expiration')
            ? json['Expiration'] as String
            : null,
        copySourceVersionId: json.containsKey('CopySourceVersionId')
            ? json['CopySourceVersionId'] as String
            : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        ssekmsEncryptionContext: json.containsKey('SSEKMSEncryptionContext')
            ? json['SSEKMSEncryptionContext'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class CopyObjectResult {
  final String eTag;

  final DateTime lastModified;

  CopyObjectResult({
    this.eTag,
    this.lastModified,
  });
  static CopyObjectResult fromJson(Map<String, dynamic> json) =>
      CopyObjectResult(
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

class CopyPartResult {
  /// Entity tag of the object.
  final String eTag;

  /// Date and time at which the object was uploaded.
  final DateTime lastModified;

  CopyPartResult({
    this.eTag,
    this.lastModified,
  });
  static CopyPartResult fromJson(Map<String, dynamic> json) => CopyPartResult(
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

class CreateBucketConfiguration {
  /// Specifies the region where the bucket will be created. If you don't
  /// specify a region, the bucket is created in US East (N. Virginia) Region
  /// (us-east-1).
  final String locationConstraint;

  CreateBucketConfiguration({
    this.locationConstraint,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateBucketOutput {
  final String location;

  CreateBucketOutput({
    this.location,
  });
  static CreateBucketOutput fromJson(Map<String, dynamic> json) =>
      CreateBucketOutput(
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
      );
}

class CreateMultipartUploadOutput {
  /// Date when multipart upload will become eligible for abort operation by
  /// lifecycle.
  final DateTime abortDate;

  /// Id of the lifecycle rule that makes a multipart upload eligible for abort
  /// operation.
  final String abortRuleId;

  /// Name of the bucket to which the multipart upload was initiated.
  final String bucket;

  /// Object key for which the multipart upload was initiated.
  final String key;

  /// ID for the initiated multipart upload.
  final String uploadId;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String ssekmsEncryptionContext;

  final String requestCharged;

  CreateMultipartUploadOutput({
    this.abortDate,
    this.abortRuleId,
    this.bucket,
    this.key,
    this.uploadId,
    this.serverSideEncryption,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.ssekmsEncryptionContext,
    this.requestCharged,
  });
  static CreateMultipartUploadOutput fromJson(Map<String, dynamic> json) =>
      CreateMultipartUploadOutput(
        abortDate: json.containsKey('AbortDate')
            ? DateTime.parse(json['AbortDate'])
            : null,
        abortRuleId: json.containsKey('AbortRuleId')
            ? json['AbortRuleId'] as String
            : null,
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        uploadId:
            json.containsKey('UploadId') ? json['UploadId'] as String : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        ssekmsEncryptionContext: json.containsKey('SSEKMSEncryptionContext')
            ? json['SSEKMSEncryptionContext'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

/// The container element for specifying the default object lock retention
/// settings for new objects placed in the specified bucket.
class DefaultRetention {
  /// The default object lock retention mode you want to apply to new objects
  /// placed in the specified bucket.
  final String mode;

  /// The number of days that you want to specify for the default retention
  /// period.
  final int days;

  /// The number of years that you want to specify for the default retention
  /// period.
  final int years;

  DefaultRetention({
    this.mode,
    this.days,
    this.years,
  });
  static DefaultRetention fromJson(Map<String, dynamic> json) =>
      DefaultRetention(
        mode: json.containsKey('Mode') ? json['Mode'] as String : null,
        days: json.containsKey('Days') ? json['Days'] as int : null,
        years: json.containsKey('Years') ? json['Years'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Delete {
  final List<ObjectIdentifier> objects;

  /// Element to enable quiet mode for the request. When you add this element,
  /// you must set its value to true.
  final bool quiet;

  Delete({
    @required this.objects,
    this.quiet,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteMarkerEntry {
  final Owner owner;

  /// The object key.
  final String key;

  /// Version ID of an object.
  final String versionId;

  /// Specifies whether the object is (true) or is not (false) the latest
  /// version of an object.
  final bool isLatest;

  /// Date and time the object was last modified.
  final DateTime lastModified;

  DeleteMarkerEntry({
    this.owner,
    this.key,
    this.versionId,
    this.isLatest,
    this.lastModified,
  });
  static DeleteMarkerEntry fromJson(Map<String, dynamic> json) =>
      DeleteMarkerEntry(
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        isLatest:
            json.containsKey('IsLatest') ? json['IsLatest'] as bool : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

/// Specifies whether Amazon S3 should replicate delete makers.
class DeleteMarkerReplication {
  /// The status of the delete marker replication.
  ///
  ///   In the current implementation, Amazon S3 doesn't replicate the delete
  /// markers. The status must be `Disabled`.
  final String status;

  DeleteMarkerReplication({
    this.status,
  });
  static DeleteMarkerReplication fromJson(Map<String, dynamic> json) =>
      DeleteMarkerReplication(
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteObjectOutput {
  /// Specifies whether the versioned object that was permanently deleted was
  /// (true) or was not (false) a delete marker.
  final bool deleteMarker;

  /// Returns the version ID of the delete marker created as a result of the
  /// DELETE operation.
  final String versionId;

  final String requestCharged;

  DeleteObjectOutput({
    this.deleteMarker,
    this.versionId,
    this.requestCharged,
  });
  static DeleteObjectOutput fromJson(Map<String, dynamic> json) =>
      DeleteObjectOutput(
        deleteMarker: json.containsKey('DeleteMarker')
            ? json['DeleteMarker'] as bool
            : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class DeleteObjectTaggingOutput {
  /// The versionId of the object the tag-set was removed from.
  final String versionId;

  DeleteObjectTaggingOutput({
    this.versionId,
  });
  static DeleteObjectTaggingOutput fromJson(Map<String, dynamic> json) =>
      DeleteObjectTaggingOutput(
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
      );
}

class DeleteObjectsOutput {
  final List<DeletedObject> deleted;

  final String requestCharged;

  final List<Error> errors;

  DeleteObjectsOutput({
    this.deleted,
    this.requestCharged,
    this.errors,
  });
  static DeleteObjectsOutput fromJson(Map<String, dynamic> json) =>
      DeleteObjectsOutput(
        deleted: json.containsKey('Deleted')
            ? (json['Deleted'] as List)
                .map((e) => DeletedObject.fromJson(e))
                .toList()
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
        errors: json.containsKey('Errors')
            ? (json['Errors'] as List).map((e) => Error.fromJson(e)).toList()
            : null,
      );
}

class DeletedObject {
  final String key;

  final String versionId;

  final bool deleteMarker;

  final String deleteMarkerVersionId;

  DeletedObject({
    this.key,
    this.versionId,
    this.deleteMarker,
    this.deleteMarkerVersionId,
  });
  static DeletedObject fromJson(Map<String, dynamic> json) => DeletedObject(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        deleteMarker: json.containsKey('DeleteMarker')
            ? json['DeleteMarker'] as bool
            : null,
        deleteMarkerVersionId: json.containsKey('DeleteMarkerVersionId')
            ? json['DeleteMarkerVersionId'] as String
            : null,
      );
}

/// Specifies information about where to publish analysis or configuration
/// results for an Amazon S3 bucket.
class Destination {
  ///  The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to
  /// store replicas of the object identified by the rule.
  ///
  /// A replication configuration can replicate objects to only one destination
  /// bucket. If there are multiple rules in your replication configuration, all
  /// rules must specify the same destination bucket.
  final String bucket;

  /// Destination bucket owner account ID. In a cross-account scenario, if you
  /// direct Amazon S3 to change replica ownership to the AWS account that owns
  /// the destination bucket by specifying the `AccessControlTranslation`
  /// property, this is the account ID of the destination bucket owner. For more
  /// information, see
  /// [Cross-Region Replication Additional Configuration: Change Replica Owner](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr-change-owner.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final String account;

  ///  The storage class to use when replicating objects, such as standard or
  /// reduced redundancy. By default, Amazon S3 uses the storage class of the
  /// source object to create the object replica.
  ///
  /// For valid values, see the `StorageClass` element of the
  /// [PUT Bucket replication](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html)
  /// action in the _Amazon Simple Storage Service API Reference_.
  final String storageClass;

  /// Specify this only in a cross-account scenario (where source and
  /// destination bucket owners are not the same), and you want to change
  /// replica ownership to the AWS account that owns the destination bucket. If
  /// this is not specified in the replication configuration, the replicas are
  /// owned by same AWS account that owns the source object.
  final AccessControlTranslation accessControlTranslation;

  /// A container that provides information about encryption. If
  /// `SourceSelectionCriteria` is specified, you must specify this element.
  final EncryptionConfiguration encryptionConfiguration;

  Destination({
    @required this.bucket,
    this.account,
    this.storageClass,
    this.accessControlTranslation,
    this.encryptionConfiguration,
  });
  static Destination fromJson(Map<String, dynamic> json) => Destination(
        bucket: json['Bucket'] as String,
        account: json.containsKey('Account') ? json['Account'] as String : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        accessControlTranslation: json.containsKey('AccessControlTranslation')
            ? AccessControlTranslation.fromJson(
                json['AccessControlTranslation'])
            : null,
        encryptionConfiguration: json.containsKey('EncryptionConfiguration')
            ? EncryptionConfiguration.fromJson(json['EncryptionConfiguration'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the server-side encryption that will be applied to the restore
/// results.
class Encryption {
  /// The server-side encryption algorithm used when storing job results in
  /// Amazon S3 (e.g., AES256, aws:kms).
  final String encryptionType;

  /// If the encryption type is aws:kms, this optional value specifies the AWS
  /// KMS key ID to use for encryption of job results.
  final String kmsKeyId;

  /// If the encryption type is aws:kms, this optional value can be used to
  /// specify the encryption context for the restore results.
  final String kmsContext;

  Encryption({
    @required this.encryptionType,
    this.kmsKeyId,
    this.kmsContext,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies encryption-related information for an Amazon S3 bucket that is a
/// destination for replicated objects.
class EncryptionConfiguration {
  /// Specifies the AWS KMS Key ID (Key ARN or Alias ARN) for the destination
  /// bucket. Amazon S3 uses this key to encrypt replica objects.
  final String replicaKmsKeyID;

  EncryptionConfiguration({
    this.replicaKmsKeyID,
  });
  static EncryptionConfiguration fromJson(Map<String, dynamic> json) =>
      EncryptionConfiguration(
        replicaKmsKeyID: json.containsKey('ReplicaKmsKeyID')
            ? json['ReplicaKmsKeyID'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class EndEvent {
  EndEvent();
  static EndEvent fromJson(Map<String, dynamic> json) => EndEvent();
}

class Error {
  final String key;

  final String versionId;

  final String code;

  final String message;

  Error({
    this.key,
    this.versionId,
    this.code,
    this.message,
  });
  static Error fromJson(Map<String, dynamic> json) => Error(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        code: json.containsKey('Code') ? json['Code'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

class ErrorDocument {
  /// The object key name to use when a 4XX class error occurs.
  final String key;

  ErrorDocument({
    @required this.key,
  });
  static ErrorDocument fromJson(Map<String, dynamic> json) => ErrorDocument(
        key: json['Key'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the Amazon S3 object key name to filter on and whether to filter
/// on the suffix or prefix of the key name.
class FilterRule {
  /// The object key name prefix or suffix identifying one or more objects to
  /// which the filtering rule applies. The maximum length is 1,024 characters.
  /// Overlapping prefixes and suffixes are not supported. For more information,
  /// see
  /// [Configuring Event Notifications](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final String name;

  /// The value that the filter searches for in object key names.
  final String value;

  FilterRule({
    this.name,
    this.value,
  });
  static FilterRule fromJson(Map<String, dynamic> json) => FilterRule(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetBucketAccelerateConfigurationOutput {
  /// The accelerate configuration of the bucket.
  final String status;

  GetBucketAccelerateConfigurationOutput({
    this.status,
  });
  static GetBucketAccelerateConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBucketAccelerateConfigurationOutput(
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

class GetBucketAclOutput {
  final Owner owner;

  /// A list of grants.
  final List<Grant> grants;

  GetBucketAclOutput({
    this.owner,
    this.grants,
  });
  static GetBucketAclOutput fromJson(Map<String, dynamic> json) =>
      GetBucketAclOutput(
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
        grants: json.containsKey('Grants')
            ? (json['Grants'] as List).map((e) => Grant.fromJson(e)).toList()
            : null,
      );
}

class GetBucketAnalyticsConfigurationOutput {
  /// The configuration and any analyses for the analytics filter.
  final AnalyticsConfiguration analyticsConfiguration;

  GetBucketAnalyticsConfigurationOutput({
    this.analyticsConfiguration,
  });
  static GetBucketAnalyticsConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBucketAnalyticsConfigurationOutput(
        analyticsConfiguration: json.containsKey('AnalyticsConfiguration')
            ? AnalyticsConfiguration.fromJson(json['AnalyticsConfiguration'])
            : null,
      );
}

class GetBucketCorsOutput {
  final List<CorsRule> corsRules;

  GetBucketCorsOutput({
    this.corsRules,
  });
  static GetBucketCorsOutput fromJson(Map<String, dynamic> json) =>
      GetBucketCorsOutput(
        corsRules: json.containsKey('CORSRules')
            ? (json['CORSRules'] as List)
                .map((e) => CorsRule.fromJson(e))
                .toList()
            : null,
      );
}

class GetBucketEncryptionOutput {
  final ServerSideEncryptionConfiguration serverSideEncryptionConfiguration;

  GetBucketEncryptionOutput({
    this.serverSideEncryptionConfiguration,
  });
  static GetBucketEncryptionOutput fromJson(Map<String, dynamic> json) =>
      GetBucketEncryptionOutput(
        serverSideEncryptionConfiguration:
            json.containsKey('ServerSideEncryptionConfiguration')
                ? ServerSideEncryptionConfiguration.fromJson(
                    json['ServerSideEncryptionConfiguration'])
                : null,
      );
}

class GetBucketInventoryConfigurationOutput {
  /// Specifies the inventory configuration.
  final InventoryConfiguration inventoryConfiguration;

  GetBucketInventoryConfigurationOutput({
    this.inventoryConfiguration,
  });
  static GetBucketInventoryConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBucketInventoryConfigurationOutput(
        inventoryConfiguration: json.containsKey('InventoryConfiguration')
            ? InventoryConfiguration.fromJson(json['InventoryConfiguration'])
            : null,
      );
}

class GetBucketLifecycleConfigurationOutput {
  final List<LifecycleRule> rules;

  GetBucketLifecycleConfigurationOutput({
    this.rules,
  });
  static GetBucketLifecycleConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBucketLifecycleConfigurationOutput(
        rules: json.containsKey('Rules')
            ? (json['Rules'] as List)
                .map((e) => LifecycleRule.fromJson(e))
                .toList()
            : null,
      );
}

class GetBucketLifecycleOutput {
  final List<Rule> rules;

  GetBucketLifecycleOutput({
    this.rules,
  });
  static GetBucketLifecycleOutput fromJson(Map<String, dynamic> json) =>
      GetBucketLifecycleOutput(
        rules: json.containsKey('Rules')
            ? (json['Rules'] as List).map((e) => Rule.fromJson(e)).toList()
            : null,
      );
}

class GetBucketLocationOutput {
  final String locationConstraint;

  GetBucketLocationOutput({
    this.locationConstraint,
  });
  static GetBucketLocationOutput fromJson(Map<String, dynamic> json) =>
      GetBucketLocationOutput(
        locationConstraint: json.containsKey('LocationConstraint')
            ? json['LocationConstraint'] as String
            : null,
      );
}

class GetBucketLoggingOutput {
  final LoggingEnabled loggingEnabled;

  GetBucketLoggingOutput({
    this.loggingEnabled,
  });
  static GetBucketLoggingOutput fromJson(Map<String, dynamic> json) =>
      GetBucketLoggingOutput(
        loggingEnabled: json.containsKey('LoggingEnabled')
            ? LoggingEnabled.fromJson(json['LoggingEnabled'])
            : null,
      );
}

class GetBucketMetricsConfigurationOutput {
  /// Specifies the metrics configuration.
  final MetricsConfiguration metricsConfiguration;

  GetBucketMetricsConfigurationOutput({
    this.metricsConfiguration,
  });
  static GetBucketMetricsConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      GetBucketMetricsConfigurationOutput(
        metricsConfiguration: json.containsKey('MetricsConfiguration')
            ? MetricsConfiguration.fromJson(json['MetricsConfiguration'])
            : null,
      );
}

class GetBucketPolicyOutput {
  /// The bucket policy as a JSON document.
  final String policy;

  GetBucketPolicyOutput({
    this.policy,
  });
  static GetBucketPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetBucketPolicyOutput(
        policy: json.containsKey('Policy') ? json['Policy'] as String : null,
      );
}

class GetBucketPolicyStatusOutput {
  /// The policy status for the specified bucket.
  final PolicyStatus policyStatus;

  GetBucketPolicyStatusOutput({
    this.policyStatus,
  });
  static GetBucketPolicyStatusOutput fromJson(Map<String, dynamic> json) =>
      GetBucketPolicyStatusOutput(
        policyStatus: json.containsKey('PolicyStatus')
            ? PolicyStatus.fromJson(json['PolicyStatus'])
            : null,
      );
}

class GetBucketReplicationOutput {
  final ReplicationConfiguration replicationConfiguration;

  GetBucketReplicationOutput({
    this.replicationConfiguration,
  });
  static GetBucketReplicationOutput fromJson(Map<String, dynamic> json) =>
      GetBucketReplicationOutput(
        replicationConfiguration: json.containsKey('ReplicationConfiguration')
            ? ReplicationConfiguration.fromJson(
                json['ReplicationConfiguration'])
            : null,
      );
}

class GetBucketRequestPaymentOutput {
  /// Specifies who pays for the download and request fees.
  final String payer;

  GetBucketRequestPaymentOutput({
    this.payer,
  });
  static GetBucketRequestPaymentOutput fromJson(Map<String, dynamic> json) =>
      GetBucketRequestPaymentOutput(
        payer: json.containsKey('Payer') ? json['Payer'] as String : null,
      );
}

class GetBucketTaggingOutput {
  final List<Tag> tagSet;

  GetBucketTaggingOutput({
    @required this.tagSet,
  });
  static GetBucketTaggingOutput fromJson(Map<String, dynamic> json) =>
      GetBucketTaggingOutput(
        tagSet: (json['TagSet'] as List).map((e) => Tag.fromJson(e)).toList(),
      );
}

class GetBucketVersioningOutput {
  /// The versioning state of the bucket.
  final String status;

  /// Specifies whether MFA delete is enabled in the bucket versioning
  /// configuration. This element is only returned if the bucket has been
  /// configured with MFA delete. If the bucket has never been so configured,
  /// this element is not returned.
  final String mfaDelete;

  GetBucketVersioningOutput({
    this.status,
    this.mfaDelete,
  });
  static GetBucketVersioningOutput fromJson(Map<String, dynamic> json) =>
      GetBucketVersioningOutput(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        mfaDelete:
            json.containsKey('MFADelete') ? json['MFADelete'] as String : null,
      );
}

class GetBucketWebsiteOutput {
  final RedirectAllRequestsTo redirectAllRequestsTo;

  final IndexDocument indexDocument;

  final ErrorDocument errorDocument;

  final List<RoutingRule> routingRules;

  GetBucketWebsiteOutput({
    this.redirectAllRequestsTo,
    this.indexDocument,
    this.errorDocument,
    this.routingRules,
  });
  static GetBucketWebsiteOutput fromJson(Map<String, dynamic> json) =>
      GetBucketWebsiteOutput(
        redirectAllRequestsTo: json.containsKey('RedirectAllRequestsTo')
            ? RedirectAllRequestsTo.fromJson(json['RedirectAllRequestsTo'])
            : null,
        indexDocument: json.containsKey('IndexDocument')
            ? IndexDocument.fromJson(json['IndexDocument'])
            : null,
        errorDocument: json.containsKey('ErrorDocument')
            ? ErrorDocument.fromJson(json['ErrorDocument'])
            : null,
        routingRules: json.containsKey('RoutingRules')
            ? (json['RoutingRules'] as List)
                .map((e) => RoutingRule.fromJson(e))
                .toList()
            : null,
      );
}

class GetObjectAclOutput {
  final Owner owner;

  /// A list of grants.
  final List<Grant> grants;

  final String requestCharged;

  GetObjectAclOutput({
    this.owner,
    this.grants,
    this.requestCharged,
  });
  static GetObjectAclOutput fromJson(Map<String, dynamic> json) =>
      GetObjectAclOutput(
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
        grants: json.containsKey('Grants')
            ? (json['Grants'] as List).map((e) => Grant.fromJson(e)).toList()
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class GetObjectLegalHoldOutput {
  /// The current Legal Hold status for the specified object.
  final ObjectLockLegalHold legalHold;

  GetObjectLegalHoldOutput({
    this.legalHold,
  });
  static GetObjectLegalHoldOutput fromJson(Map<String, dynamic> json) =>
      GetObjectLegalHoldOutput(
        legalHold: json.containsKey('LegalHold')
            ? ObjectLockLegalHold.fromJson(json['LegalHold'])
            : null,
      );
}

class GetObjectLockConfigurationOutput {
  /// The specified bucket's object lock configuration.
  final ObjectLockConfiguration objectLockConfiguration;

  GetObjectLockConfigurationOutput({
    this.objectLockConfiguration,
  });
  static GetObjectLockConfigurationOutput fromJson(Map<String, dynamic> json) =>
      GetObjectLockConfigurationOutput(
        objectLockConfiguration: json.containsKey('ObjectLockConfiguration')
            ? ObjectLockConfiguration.fromJson(json['ObjectLockConfiguration'])
            : null,
      );
}

class GetObjectOutput {
  /// Object data.
  final Uint8List body;

  /// Specifies whether the object retrieved was (true) or was not (false) a
  /// Delete Marker. If false, this response header does not appear in the
  /// response.
  final bool deleteMarker;

  final String acceptRanges;

  /// If the object expiration is configured (see PUT Bucket lifecycle), the
  /// response includes this header. It includes the expiry-date and rule-id key
  /// value pairs providing object expiration information. The value of the
  /// rule-id is URL encoded.
  final String expiration;

  /// Provides information about object restoration operation and expiration
  /// time of the restored object copy.
  final String restore;

  /// Last modified date of the object
  final DateTime lastModified;

  /// Size of the body in bytes.
  final BigInt contentLength;

  /// An ETag is an opaque identifier assigned by a web server to a specific
  /// version of a resource found at a URL
  final String eTag;

  /// This is set to the number of metadata entries not returned in x-amz-meta
  /// headers. This can happen if you create metadata using an API like SOAP
  /// that supports more flexible metadata than the REST API. For example, using
  /// SOAP, you can create metadata whose values are not legal HTTP headers.
  final int missingMeta;

  /// Version of the object.
  final String versionId;

  /// Specifies caching behavior along the request/reply chain.
  final String cacheControl;

  /// Specifies presentational information for the object.
  final String contentDisposition;

  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type
  /// referenced by the Content-Type header field.
  final String contentEncoding;

  /// The language the content is in.
  final String contentLanguage;

  /// The portion of the object returned in the response.
  final String contentRange;

  /// A standard MIME type describing the format of the object data.
  final String contentType;

  /// The date and time at which the object is no longer cacheable.
  final DateTime expires;

  /// If the bucket is configured as a website, redirects requests for this
  /// object to another object in the same bucket or to an external URL. Amazon
  /// S3 stores the value of this header in the object metadata.
  final String websiteRedirectLocation;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// A map of metadata to store with the object in S3.
  final Map<String, String> metadata;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  final String storageClass;

  final String requestCharged;

  final String replicationStatus;

  /// The count of parts this object has.
  final int partsCount;

  /// The number of tags, if any, on the object.
  final int tagCount;

  /// The object lock mode currently in place for this object.
  final String objectLockMode;

  /// The date and time when this object's object lock will expire.
  final DateTime objectLockRetainUntilDate;

  /// Indicates whether this object has an active legal hold. This field is only
  /// returned if you have permission to view an object's legal hold status.
  final String objectLockLegalHoldStatus;

  GetObjectOutput({
    this.body,
    this.deleteMarker,
    this.acceptRanges,
    this.expiration,
    this.restore,
    this.lastModified,
    this.contentLength,
    this.eTag,
    this.missingMeta,
    this.versionId,
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.contentRange,
    this.contentType,
    this.expires,
    this.websiteRedirectLocation,
    this.serverSideEncryption,
    this.metadata,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.storageClass,
    this.requestCharged,
    this.replicationStatus,
    this.partsCount,
    this.tagCount,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
    this.objectLockLegalHoldStatus,
  });
  static GetObjectOutput fromJson(Map<String, dynamic> json) => GetObjectOutput(
        body: json.containsKey('Body') ? Uint8List(json['Body']) : null,
        deleteMarker: json.containsKey('DeleteMarker')
            ? json['DeleteMarker'] as bool
            : null,
        acceptRanges: json.containsKey('AcceptRanges')
            ? json['AcceptRanges'] as String
            : null,
        expiration: json.containsKey('Expiration')
            ? json['Expiration'] as String
            : null,
        restore: json.containsKey('Restore') ? json['Restore'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        missingMeta:
            json.containsKey('MissingMeta') ? json['MissingMeta'] as int : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        cacheControl: json.containsKey('CacheControl')
            ? json['CacheControl'] as String
            : null,
        contentDisposition: json.containsKey('ContentDisposition')
            ? json['ContentDisposition'] as String
            : null,
        contentEncoding: json.containsKey('ContentEncoding')
            ? json['ContentEncoding'] as String
            : null,
        contentLanguage: json.containsKey('ContentLanguage')
            ? json['ContentLanguage'] as String
            : null,
        contentRange: json.containsKey('ContentRange')
            ? json['ContentRange'] as String
            : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        expires: json.containsKey('Expires')
            ? DateTime.parse(json['Expires'])
            : null,
        websiteRedirectLocation: json.containsKey('WebsiteRedirectLocation')
            ? json['WebsiteRedirectLocation'] as String
            : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        metadata: json.containsKey('Metadata')
            ? (json['Metadata'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
        replicationStatus: json.containsKey('ReplicationStatus')
            ? json['ReplicationStatus'] as String
            : null,
        partsCount:
            json.containsKey('PartsCount') ? json['PartsCount'] as int : null,
        tagCount: json.containsKey('TagCount') ? json['TagCount'] as int : null,
        objectLockMode: json.containsKey('ObjectLockMode')
            ? json['ObjectLockMode'] as String
            : null,
        objectLockRetainUntilDate: json.containsKey('ObjectLockRetainUntilDate')
            ? DateTime.parse(json['ObjectLockRetainUntilDate'])
            : null,
        objectLockLegalHoldStatus: json.containsKey('ObjectLockLegalHoldStatus')
            ? json['ObjectLockLegalHoldStatus'] as String
            : null,
      );
}

class GetObjectRetentionOutput {
  /// The container element for an object's retention settings.
  final ObjectLockRetention retention;

  GetObjectRetentionOutput({
    this.retention,
  });
  static GetObjectRetentionOutput fromJson(Map<String, dynamic> json) =>
      GetObjectRetentionOutput(
        retention: json.containsKey('Retention')
            ? ObjectLockRetention.fromJson(json['Retention'])
            : null,
      );
}

class GetObjectTaggingOutput {
  final String versionId;

  final List<Tag> tagSet;

  GetObjectTaggingOutput({
    this.versionId,
    @required this.tagSet,
  });
  static GetObjectTaggingOutput fromJson(Map<String, dynamic> json) =>
      GetObjectTaggingOutput(
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        tagSet: (json['TagSet'] as List).map((e) => Tag.fromJson(e)).toList(),
      );
}

class GetObjectTorrentOutput {
  final Uint8List body;

  final String requestCharged;

  GetObjectTorrentOutput({
    this.body,
    this.requestCharged,
  });
  static GetObjectTorrentOutput fromJson(Map<String, dynamic> json) =>
      GetObjectTorrentOutput(
        body: json.containsKey('Body') ? Uint8List(json['Body']) : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class GetPublicAccessBlockOutput {
  /// The `PublicAccessBlock` configuration currently in effect for this Amazon
  /// S3 bucket.
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });
  static GetPublicAccessBlockOutput fromJson(Map<String, dynamic> json) =>
      GetPublicAccessBlockOutput(
        publicAccessBlockConfiguration:
            json.containsKey('PublicAccessBlockConfiguration')
                ? PublicAccessBlockConfiguration.fromJson(
                    json['PublicAccessBlockConfiguration'])
                : null,
      );
}

class GlacierJobParameters {
  /// Glacier retrieval tier at which the restore will be processed.
  final String tier;

  GlacierJobParameters({
    @required this.tier,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Grant {
  final Grantee grantee;

  /// Specifies the permission given to the grantee.
  final String permission;

  Grant({
    this.grantee,
    this.permission,
  });
  static Grant fromJson(Map<String, dynamic> json) => Grant(
        grantee: json.containsKey('Grantee')
            ? Grantee.fromJson(json['Grantee'])
            : null,
        permission: json.containsKey('Permission')
            ? json['Permission'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Grantee {
  /// Screen name of the grantee.
  final String displayName;

  /// Email address of the grantee.
  final String emailAddress;

  /// The canonical user ID of the grantee.
  final String id;

  /// Type of grantee
  final String type;

  /// URI of the grantee group.
  final String uri;

  Grantee({
    this.displayName,
    this.emailAddress,
    this.id,
    @required this.type,
    this.uri,
  });
  static Grantee fromJson(Map<String, dynamic> json) => Grantee(
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        emailAddress: json.containsKey('EmailAddress')
            ? json['EmailAddress'] as String
            : null,
        id: json.containsKey('ID') ? json['ID'] as String : null,
        type: json['Type'] as String,
        uri: json.containsKey('URI') ? json['URI'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class HeadObjectOutput {
  /// Specifies whether the object retrieved was (true) or was not (false) a
  /// Delete Marker. If false, this response header does not appear in the
  /// response.
  final bool deleteMarker;

  final String acceptRanges;

  /// If the object expiration is configured (see PUT Bucket lifecycle), the
  /// response includes this header. It includes the expiry-date and rule-id key
  /// value pairs providing object expiration information. The value of the
  /// rule-id is URL encoded.
  final String expiration;

  /// Provides information about object restoration operation and expiration
  /// time of the restored object copy.
  final String restore;

  /// Last modified date of the object
  final DateTime lastModified;

  /// Size of the body in bytes.
  final BigInt contentLength;

  /// An ETag is an opaque identifier assigned by a web server to a specific
  /// version of a resource found at a URL
  final String eTag;

  /// This is set to the number of metadata entries not returned in x-amz-meta
  /// headers. This can happen if you create metadata using an API like SOAP
  /// that supports more flexible metadata than the REST API. For example, using
  /// SOAP, you can create metadata whose values are not legal HTTP headers.
  final int missingMeta;

  /// Version of the object.
  final String versionId;

  /// Specifies caching behavior along the request/reply chain.
  final String cacheControl;

  /// Specifies presentational information for the object.
  final String contentDisposition;

  /// Specifies what content encodings have been applied to the object and thus
  /// what decoding mechanisms must be applied to obtain the media-type
  /// referenced by the Content-Type header field.
  final String contentEncoding;

  /// The language the content is in.
  final String contentLanguage;

  /// A standard MIME type describing the format of the object data.
  final String contentType;

  /// The date and time at which the object is no longer cacheable.
  final DateTime expires;

  /// If the bucket is configured as a website, redirects requests for this
  /// object to another object in the same bucket or to an external URL. Amazon
  /// S3 stores the value of this header in the object metadata.
  final String websiteRedirectLocation;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// A map of metadata to store with the object in S3.
  final Map<String, String> metadata;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  final String storageClass;

  final String requestCharged;

  final String replicationStatus;

  /// The count of parts this object has.
  final int partsCount;

  /// The object lock mode currently in place for this object.
  final String objectLockMode;

  /// The date and time when this object's object lock expires.
  final DateTime objectLockRetainUntilDate;

  /// The Legal Hold status for the specified object.
  final String objectLockLegalHoldStatus;

  HeadObjectOutput({
    this.deleteMarker,
    this.acceptRanges,
    this.expiration,
    this.restore,
    this.lastModified,
    this.contentLength,
    this.eTag,
    this.missingMeta,
    this.versionId,
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.contentType,
    this.expires,
    this.websiteRedirectLocation,
    this.serverSideEncryption,
    this.metadata,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.storageClass,
    this.requestCharged,
    this.replicationStatus,
    this.partsCount,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
    this.objectLockLegalHoldStatus,
  });
  static HeadObjectOutput fromJson(Map<String, dynamic> json) =>
      HeadObjectOutput(
        deleteMarker: json.containsKey('DeleteMarker')
            ? json['DeleteMarker'] as bool
            : null,
        acceptRanges: json.containsKey('AcceptRanges')
            ? json['AcceptRanges'] as String
            : null,
        expiration: json.containsKey('Expiration')
            ? json['Expiration'] as String
            : null,
        restore: json.containsKey('Restore') ? json['Restore'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        missingMeta:
            json.containsKey('MissingMeta') ? json['MissingMeta'] as int : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        cacheControl: json.containsKey('CacheControl')
            ? json['CacheControl'] as String
            : null,
        contentDisposition: json.containsKey('ContentDisposition')
            ? json['ContentDisposition'] as String
            : null,
        contentEncoding: json.containsKey('ContentEncoding')
            ? json['ContentEncoding'] as String
            : null,
        contentLanguage: json.containsKey('ContentLanguage')
            ? json['ContentLanguage'] as String
            : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        expires: json.containsKey('Expires')
            ? DateTime.parse(json['Expires'])
            : null,
        websiteRedirectLocation: json.containsKey('WebsiteRedirectLocation')
            ? json['WebsiteRedirectLocation'] as String
            : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        metadata: json.containsKey('Metadata')
            ? (json['Metadata'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
        replicationStatus: json.containsKey('ReplicationStatus')
            ? json['ReplicationStatus'] as String
            : null,
        partsCount:
            json.containsKey('PartsCount') ? json['PartsCount'] as int : null,
        objectLockMode: json.containsKey('ObjectLockMode')
            ? json['ObjectLockMode'] as String
            : null,
        objectLockRetainUntilDate: json.containsKey('ObjectLockRetainUntilDate')
            ? DateTime.parse(json['ObjectLockRetainUntilDate'])
            : null,
        objectLockLegalHoldStatus: json.containsKey('ObjectLockLegalHoldStatus')
            ? json['ObjectLockLegalHoldStatus'] as String
            : null,
      );
}

class IndexDocument {
  /// A suffix that is appended to a request that is for a directory on the
  /// website endpoint (e.g. if the suffix is index.html and you make a request
  /// to samplebucket/images/ the data that is returned will be for the object
  /// with the key name images/index.html) The suffix must not be empty and must
  /// not include a slash character.
  final String suffix;

  IndexDocument({
    @required this.suffix,
  });
  static IndexDocument fromJson(Map<String, dynamic> json) => IndexDocument(
        suffix: json['Suffix'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Initiator {
  /// If the principal is an AWS account, it provides the Canonical User ID. If
  /// the principal is an IAM User, it provides a user ARN value.
  final String id;

  /// Name of the Principal.
  final String displayName;

  Initiator({
    this.id,
    this.displayName,
  });
  static Initiator fromJson(Map<String, dynamic> json) => Initiator(
        id: json.containsKey('ID') ? json['ID'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
      );
}

/// Describes the serialization format of the object.
class InputSerialization {
  /// Describes the serialization of a CSV-encoded object.
  final CsvInput csv;

  /// Specifies object's compression format. Valid values: NONE, GZIP, BZIP2.
  /// Default Value: NONE.
  final String compressionType;

  /// Specifies JSON as object's input serialization format.
  final JsonInput json;

  /// Specifies Parquet as object's input serialization format.
  final ParquetInput parquet;

  InputSerialization({
    this.csv,
    this.compressionType,
    this.json,
    this.parquet,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the inventory configuration for an Amazon S3 bucket. For more
/// information, see
/// [GET Bucket inventory](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETInventoryConfig.html)
/// in the _Amazon Simple Storage Service API Reference_.
class InventoryConfiguration {
  /// Contains information about where to publish the inventory results.
  final InventoryDestination destination;

  /// Specifies whether the inventory is enabled or disabled. If set to `True`,
  /// an inventory list is generated. If set to `False`, no inventory list is
  /// generated.
  final bool isEnabled;

  /// Specifies an inventory filter. The inventory only includes objects that
  /// meet the filter's criteria.
  final InventoryFilter filter;

  /// The ID used to identify the inventory configuration.
  final String id;

  /// Object versions to include in the inventory list. If set to `All`, the
  /// list includes all the object versions, which adds the version-related
  /// fields `VersionId`, `IsLatest`, and `DeleteMarker` to the list. If set to
  /// `Current`, the list does not contain these version-related fields.
  final String includedObjectVersions;

  /// Contains the optional fields that are included in the inventory results.
  final List<String> optionalFields;

  /// Specifies the schedule for generating inventory results.
  final InventorySchedule schedule;

  InventoryConfiguration({
    @required this.destination,
    @required this.isEnabled,
    this.filter,
    @required this.id,
    @required this.includedObjectVersions,
    this.optionalFields,
    @required this.schedule,
  });
  static InventoryConfiguration fromJson(Map<String, dynamic> json) =>
      InventoryConfiguration(
        destination: InventoryDestination.fromJson(json['Destination']),
        isEnabled: json['IsEnabled'] as bool,
        filter: json.containsKey('Filter')
            ? InventoryFilter.fromJson(json['Filter'])
            : null,
        id: json['Id'] as String,
        includedObjectVersions: json['IncludedObjectVersions'] as String,
        optionalFields: json.containsKey('OptionalFields')
            ? (json['OptionalFields'] as List).map((e) => e as String).toList()
            : null,
        schedule: InventorySchedule.fromJson(json['Schedule']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class InventoryDestination {
  /// Contains the bucket name, file format, bucket owner (optional), and prefix
  /// (optional) where inventory results are published.
  final InventoryS3BucketDestination s3BucketDestination;

  InventoryDestination({
    @required this.s3BucketDestination,
  });
  static InventoryDestination fromJson(Map<String, dynamic> json) =>
      InventoryDestination(
        s3BucketDestination:
            InventoryS3BucketDestination.fromJson(json['S3BucketDestination']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the type of server-side encryption used to encrypt the inventory
/// results.
class InventoryEncryption {
  /// Specifies the use of SSE-S3 to encrypt delivered Inventory reports.
  final Sses3 sses3;

  /// Specifies the use of SSE-KMS to encrypt delivered Inventory reports.
  final Ssekms ssekms;

  InventoryEncryption({
    this.sses3,
    this.ssekms,
  });
  static InventoryEncryption fromJson(Map<String, dynamic> json) =>
      InventoryEncryption(
        sses3: json.containsKey('SSES3') ? Sses3.fromJson(json['SSES3']) : null,
        ssekms:
            json.containsKey('SSEKMS') ? Ssekms.fromJson(json['SSEKMS']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class InventoryFilter {
  /// The prefix that an object must have to be included in the inventory
  /// results.
  final String prefix;

  InventoryFilter({
    @required this.prefix,
  });
  static InventoryFilter fromJson(Map<String, dynamic> json) => InventoryFilter(
        prefix: json['Prefix'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class InventoryS3BucketDestination {
  /// The ID of the account that owns the destination bucket.
  final String accountId;

  /// The Amazon resource name (ARN) of the bucket where inventory results will
  /// be published.
  final String bucket;

  /// Specifies the output format of the inventory results.
  final String format;

  /// The prefix that is prepended to all inventory results.
  final String prefix;

  /// Contains the type of server-side encryption used to encrypt the inventory
  /// results.
  final InventoryEncryption encryption;

  InventoryS3BucketDestination({
    this.accountId,
    @required this.bucket,
    @required this.format,
    this.prefix,
    this.encryption,
  });
  static InventoryS3BucketDestination fromJson(Map<String, dynamic> json) =>
      InventoryS3BucketDestination(
        accountId:
            json.containsKey('AccountId') ? json['AccountId'] as String : null,
        bucket: json['Bucket'] as String,
        format: json['Format'] as String,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        encryption: json.containsKey('Encryption')
            ? InventoryEncryption.fromJson(json['Encryption'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class InventorySchedule {
  /// Specifies how frequently inventory results are produced.
  final String frequency;

  InventorySchedule({
    @required this.frequency,
  });
  static InventorySchedule fromJson(Map<String, dynamic> json) =>
      InventorySchedule(
        frequency: json['Frequency'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class JsonInput {
  /// The type of JSON. Valid values: Document, Lines.
  final String type;

  JsonInput({
    this.type,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class JsonOutput {
  /// The value used to separate individual records in the output.
  final String recordDelimiter;

  JsonOutput({
    this.recordDelimiter,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for specifying the configuration for AWS Lambda notifications.
class LambdaFunctionConfiguration {
  final String id;

  /// The Amazon Resource Name (ARN) of the AWS Lambda function that Amazon S3
  /// invokes when the specified event type occurs.
  final String lambdaFunctionArn;

  /// The Amazon S3 bucket event for which to invoke the AWS Lambda function.
  /// For more information, see
  /// [Supported Event Types](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final List<String> events;

  final NotificationConfigurationFilter filter;

  LambdaFunctionConfiguration({
    this.id,
    @required this.lambdaFunctionArn,
    @required this.events,
    this.filter,
  });
  static LambdaFunctionConfiguration fromJson(Map<String, dynamic> json) =>
      LambdaFunctionConfiguration(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        lambdaFunctionArn: json['LambdaFunctionArn'] as String,
        events: (json['Events'] as List).map((e) => e as String).toList(),
        filter: json.containsKey('Filter')
            ? NotificationConfigurationFilter.fromJson(json['Filter'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class LifecycleConfiguration {
  final List<Rule> rules;

  LifecycleConfiguration({
    @required this.rules,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class LifecycleExpiration {
  /// Indicates at what date the object is to be moved or deleted. Should be in
  /// GMT ISO 8601 Format.
  final DateTime date;

  /// Indicates the lifetime, in days, of the objects that are subject to the
  /// rule. The value must be a non-zero positive integer.
  final int days;

  /// Indicates whether Amazon S3 will remove a delete marker with no noncurrent
  /// versions. If set to true, the delete marker will be expired; if set to
  /// false the policy takes no action. This cannot be specified with Days or
  /// Date in a Lifecycle Expiration Policy.
  final bool expiredObjectDeleteMarker;

  LifecycleExpiration({
    this.date,
    this.days,
    this.expiredObjectDeleteMarker,
  });
  static LifecycleExpiration fromJson(Map<String, dynamic> json) =>
      LifecycleExpiration(
        date: json.containsKey('Date') ? DateTime.parse(json['Date']) : null,
        days: json.containsKey('Days') ? json['Days'] as int : null,
        expiredObjectDeleteMarker: json.containsKey('ExpiredObjectDeleteMarker')
            ? json['ExpiredObjectDeleteMarker'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class LifecycleRule {
  final LifecycleExpiration expiration;

  /// Unique identifier for the rule. The value cannot be longer than 255
  /// characters.
  final String id;

  /// Prefix identifying one or more objects to which the rule applies. This is
  /// No longer used; use Filter instead.
  final String prefix;

  final LifecycleRuleFilter filter;

  /// If 'Enabled', the rule is currently being applied. If 'Disabled', the rule
  /// is not currently being applied.
  final String status;

  final List<Transition> transitions;

  final List<NoncurrentVersionTransition> noncurrentVersionTransitions;

  final NoncurrentVersionExpiration noncurrentVersionExpiration;

  final AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  LifecycleRule({
    this.expiration,
    this.id,
    this.prefix,
    this.filter,
    @required this.status,
    this.transitions,
    this.noncurrentVersionTransitions,
    this.noncurrentVersionExpiration,
    this.abortIncompleteMultipartUpload,
  });
  static LifecycleRule fromJson(Map<String, dynamic> json) => LifecycleRule(
        expiration: json.containsKey('Expiration')
            ? LifecycleExpiration.fromJson(json['Expiration'])
            : null,
        id: json.containsKey('ID') ? json['ID'] as String : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        filter: json.containsKey('Filter')
            ? LifecycleRuleFilter.fromJson(json['Filter'])
            : null,
        status: json['Status'] as String,
        transitions: json.containsKey('Transitions')
            ? (json['Transitions'] as List)
                .map((e) => Transition.fromJson(e))
                .toList()
            : null,
        noncurrentVersionTransitions:
            json.containsKey('NoncurrentVersionTransitions')
                ? (json['NoncurrentVersionTransitions'] as List)
                    .map((e) => NoncurrentVersionTransition.fromJson(e))
                    .toList()
                : null,
        noncurrentVersionExpiration:
            json.containsKey('NoncurrentVersionExpiration')
                ? NoncurrentVersionExpiration.fromJson(
                    json['NoncurrentVersionExpiration'])
                : null,
        abortIncompleteMultipartUpload:
            json.containsKey('AbortIncompleteMultipartUpload')
                ? AbortIncompleteMultipartUpload.fromJson(
                    json['AbortIncompleteMultipartUpload'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// This is used in a Lifecycle Rule Filter to apply a logical AND to two or
/// more predicates. The Lifecycle Rule will apply to any object matching all of
/// the predicates configured inside the And operator.
class LifecycleRuleAndOperator {
  final String prefix;

  /// All of these tags must exist in the object's tag set in order for the rule
  /// to apply.
  final List<Tag> tags;

  LifecycleRuleAndOperator({
    this.prefix,
    this.tags,
  });
  static LifecycleRuleAndOperator fromJson(Map<String, dynamic> json) =>
      LifecycleRuleAndOperator(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Filter is used to identify objects that a Lifecycle Rule applies to. A
/// Filter must have exactly one of Prefix, Tag, or And specified.
class LifecycleRuleFilter {
  /// Prefix identifying one or more objects to which the rule applies.
  final String prefix;

  /// This tag must exist in the object's tag set in order for the rule to
  /// apply.
  final Tag tag;

  final LifecycleRuleAndOperator and;

  LifecycleRuleFilter({
    this.prefix,
    this.tag,
    this.and,
  });
  static LifecycleRuleFilter fromJson(Map<String, dynamic> json) =>
      LifecycleRuleFilter(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tag: json.containsKey('Tag') ? Tag.fromJson(json['Tag']) : null,
        and: json.containsKey('And')
            ? LifecycleRuleAndOperator.fromJson(json['And'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListBucketAnalyticsConfigurationsOutput {
  /// Indicates whether the returned list of analytics configurations is
  /// complete. A value of true indicates that the list is not complete and the
  /// NextContinuationToken will be provided for a subsequent request.
  final bool isTruncated;

  /// The ContinuationToken that represents where this request began.
  final String continuationToken;

  /// NextContinuationToken is sent when isTruncated is true, which indicates
  /// that there are more analytics configurations to list. The next request
  /// must include this NextContinuationToken. The token is obfuscated and is
  /// not a usable value.
  final String nextContinuationToken;

  /// The list of analytics configurations for a bucket.
  final List<AnalyticsConfiguration> analyticsConfigurationList;

  ListBucketAnalyticsConfigurationsOutput({
    this.isTruncated,
    this.continuationToken,
    this.nextContinuationToken,
    this.analyticsConfigurationList,
  });
  static ListBucketAnalyticsConfigurationsOutput fromJson(
          Map<String, dynamic> json) =>
      ListBucketAnalyticsConfigurationsOutput(
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        continuationToken: json.containsKey('ContinuationToken')
            ? json['ContinuationToken'] as String
            : null,
        nextContinuationToken: json.containsKey('NextContinuationToken')
            ? json['NextContinuationToken'] as String
            : null,
        analyticsConfigurationList:
            json.containsKey('AnalyticsConfigurationList')
                ? (json['AnalyticsConfigurationList'] as List)
                    .map((e) => AnalyticsConfiguration.fromJson(e))
                    .toList()
                : null,
      );
}

class ListBucketInventoryConfigurationsOutput {
  /// If sent in the request, the marker that is used as a starting point for
  /// this inventory configuration list response.
  final String continuationToken;

  /// The list of inventory configurations for a bucket.
  final List<InventoryConfiguration> inventoryConfigurationList;

  /// Indicates whether the returned list of inventory configurations is
  /// truncated in this response. A value of true indicates that the list is
  /// truncated.
  final bool isTruncated;

  /// The marker used to continue this inventory configuration listing. Use the
  /// NextContinuationToken from this response to continue the listing in a
  /// subsequent request. The continuation token is an opaque value that Amazon
  /// S3 understands.
  final String nextContinuationToken;

  ListBucketInventoryConfigurationsOutput({
    this.continuationToken,
    this.inventoryConfigurationList,
    this.isTruncated,
    this.nextContinuationToken,
  });
  static ListBucketInventoryConfigurationsOutput fromJson(
          Map<String, dynamic> json) =>
      ListBucketInventoryConfigurationsOutput(
        continuationToken: json.containsKey('ContinuationToken')
            ? json['ContinuationToken'] as String
            : null,
        inventoryConfigurationList:
            json.containsKey('InventoryConfigurationList')
                ? (json['InventoryConfigurationList'] as List)
                    .map((e) => InventoryConfiguration.fromJson(e))
                    .toList()
                : null,
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        nextContinuationToken: json.containsKey('NextContinuationToken')
            ? json['NextContinuationToken'] as String
            : null,
      );
}

class ListBucketMetricsConfigurationsOutput {
  /// Indicates whether the returned list of metrics configurations is complete.
  /// A value of true indicates that the list is not complete and the
  /// NextContinuationToken will be provided for a subsequent request.
  final bool isTruncated;

  /// The marker that is used as a starting point for this metrics configuration
  /// list response. This value is present if it was sent in the request.
  final String continuationToken;

  /// The marker used to continue a metrics configuration listing that has been
  /// truncated. Use the NextContinuationToken from a previously truncated list
  /// response to continue the listing. The continuation token is an opaque
  /// value that Amazon S3 understands.
  final String nextContinuationToken;

  /// The list of metrics configurations for a bucket.
  final List<MetricsConfiguration> metricsConfigurationList;

  ListBucketMetricsConfigurationsOutput({
    this.isTruncated,
    this.continuationToken,
    this.nextContinuationToken,
    this.metricsConfigurationList,
  });
  static ListBucketMetricsConfigurationsOutput fromJson(
          Map<String, dynamic> json) =>
      ListBucketMetricsConfigurationsOutput(
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        continuationToken: json.containsKey('ContinuationToken')
            ? json['ContinuationToken'] as String
            : null,
        nextContinuationToken: json.containsKey('NextContinuationToken')
            ? json['NextContinuationToken'] as String
            : null,
        metricsConfigurationList: json.containsKey('MetricsConfigurationList')
            ? (json['MetricsConfigurationList'] as List)
                .map((e) => MetricsConfiguration.fromJson(e))
                .toList()
            : null,
      );
}

class ListBucketsOutput {
  final List<Bucket> buckets;

  final Owner owner;

  ListBucketsOutput({
    this.buckets,
    this.owner,
  });
  static ListBucketsOutput fromJson(Map<String, dynamic> json) =>
      ListBucketsOutput(
        buckets: json.containsKey('Buckets')
            ? (json['Buckets'] as List).map((e) => Bucket.fromJson(e)).toList()
            : null,
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
      );
}

class ListMultipartUploadsOutput {
  /// Name of the bucket to which the multipart upload was initiated.
  final String bucket;

  /// The key at or after which the listing began.
  final String keyMarker;

  /// Upload ID after which listing began.
  final String uploadIdMarker;

  /// When a list is truncated, this element specifies the value that should be
  /// used for the key-marker request parameter in a subsequent request.
  final String nextKeyMarker;

  /// When a prefix is provided in the request, this field contains the
  /// specified prefix. The result contains only keys starting with the
  /// specified prefix.
  final String prefix;

  final String delimiter;

  /// When a list is truncated, this element specifies the value that should be
  /// used for the upload-id-marker request parameter in a subsequent request.
  final String nextUploadIdMarker;

  /// Maximum number of multipart uploads that could have been included in the
  /// response.
  final int maxUploads;

  /// Indicates whether the returned list of multipart uploads is truncated. A
  /// value of true indicates that the list was truncated. The list can be
  /// truncated if the number of multipart uploads exceeds the limit allowed or
  /// specified by max uploads.
  final bool isTruncated;

  final List<MultipartUpload> uploads;

  final List<CommonPrefix> commonPrefixes;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  final String encodingType;

  ListMultipartUploadsOutput({
    this.bucket,
    this.keyMarker,
    this.uploadIdMarker,
    this.nextKeyMarker,
    this.prefix,
    this.delimiter,
    this.nextUploadIdMarker,
    this.maxUploads,
    this.isTruncated,
    this.uploads,
    this.commonPrefixes,
    this.encodingType,
  });
  static ListMultipartUploadsOutput fromJson(Map<String, dynamic> json) =>
      ListMultipartUploadsOutput(
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        keyMarker:
            json.containsKey('KeyMarker') ? json['KeyMarker'] as String : null,
        uploadIdMarker: json.containsKey('UploadIdMarker')
            ? json['UploadIdMarker'] as String
            : null,
        nextKeyMarker: json.containsKey('NextKeyMarker')
            ? json['NextKeyMarker'] as String
            : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        delimiter:
            json.containsKey('Delimiter') ? json['Delimiter'] as String : null,
        nextUploadIdMarker: json.containsKey('NextUploadIdMarker')
            ? json['NextUploadIdMarker'] as String
            : null,
        maxUploads:
            json.containsKey('MaxUploads') ? json['MaxUploads'] as int : null,
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        uploads: json.containsKey('Uploads')
            ? (json['Uploads'] as List)
                .map((e) => MultipartUpload.fromJson(e))
                .toList()
            : null,
        commonPrefixes: json.containsKey('CommonPrefixes')
            ? (json['CommonPrefixes'] as List)
                .map((e) => CommonPrefix.fromJson(e))
                .toList()
            : null,
        encodingType: json.containsKey('EncodingType')
            ? json['EncodingType'] as String
            : null,
      );
}

class ListObjectVersionsOutput {
  /// A flag that indicates whether or not Amazon S3 returned all of the results
  /// that satisfied the search criteria. If your results were truncated, you
  /// can make a follow-up paginated request using the NextKeyMarker and
  /// NextVersionIdMarker response parameters as a starting place in another
  /// request to return the rest of the results.
  final bool isTruncated;

  /// Marks the last Key returned in a truncated response.
  final String keyMarker;

  final String versionIdMarker;

  /// Use this value for the key marker request parameter in a subsequent
  /// request.
  final String nextKeyMarker;

  /// Use this value for the next version id marker parameter in a subsequent
  /// request.
  final String nextVersionIdMarker;

  final List<ObjectVersion> versions;

  final List<DeleteMarkerEntry> deleteMarkers;

  final String name;

  final String prefix;

  final String delimiter;

  final int maxKeys;

  final List<CommonPrefix> commonPrefixes;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  final String encodingType;

  ListObjectVersionsOutput({
    this.isTruncated,
    this.keyMarker,
    this.versionIdMarker,
    this.nextKeyMarker,
    this.nextVersionIdMarker,
    this.versions,
    this.deleteMarkers,
    this.name,
    this.prefix,
    this.delimiter,
    this.maxKeys,
    this.commonPrefixes,
    this.encodingType,
  });
  static ListObjectVersionsOutput fromJson(Map<String, dynamic> json) =>
      ListObjectVersionsOutput(
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        keyMarker:
            json.containsKey('KeyMarker') ? json['KeyMarker'] as String : null,
        versionIdMarker: json.containsKey('VersionIdMarker')
            ? json['VersionIdMarker'] as String
            : null,
        nextKeyMarker: json.containsKey('NextKeyMarker')
            ? json['NextKeyMarker'] as String
            : null,
        nextVersionIdMarker: json.containsKey('NextVersionIdMarker')
            ? json['NextVersionIdMarker'] as String
            : null,
        versions: json.containsKey('Versions')
            ? (json['Versions'] as List)
                .map((e) => ObjectVersion.fromJson(e))
                .toList()
            : null,
        deleteMarkers: json.containsKey('DeleteMarkers')
            ? (json['DeleteMarkers'] as List)
                .map((e) => DeleteMarkerEntry.fromJson(e))
                .toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        delimiter:
            json.containsKey('Delimiter') ? json['Delimiter'] as String : null,
        maxKeys: json.containsKey('MaxKeys') ? json['MaxKeys'] as int : null,
        commonPrefixes: json.containsKey('CommonPrefixes')
            ? (json['CommonPrefixes'] as List)
                .map((e) => CommonPrefix.fromJson(e))
                .toList()
            : null,
        encodingType: json.containsKey('EncodingType')
            ? json['EncodingType'] as String
            : null,
      );
}

class ListObjectsOutput {
  /// A flag that indicates whether or not Amazon S3 returned all of the results
  /// that satisfied the search criteria.
  final bool isTruncated;

  final String marker;

  /// When response is truncated (the IsTruncated element value in the response
  /// is true), you can use the key name in this field as marker in the
  /// subsequent request to get next set of objects. Amazon S3 lists objects in
  /// alphabetical order Note: This element is returned only if you have
  /// delimiter request parameter specified. If response does not include the
  /// NextMaker and it is truncated, you can use the value of the last Key in
  /// the response as the marker in the subsequent request to get the next set
  /// of object keys.
  final String nextMarker;

  final List<Object> contents;

  final String name;

  final String prefix;

  final String delimiter;

  final int maxKeys;

  final List<CommonPrefix> commonPrefixes;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  final String encodingType;

  ListObjectsOutput({
    this.isTruncated,
    this.marker,
    this.nextMarker,
    this.contents,
    this.name,
    this.prefix,
    this.delimiter,
    this.maxKeys,
    this.commonPrefixes,
    this.encodingType,
  });
  static ListObjectsOutput fromJson(Map<String, dynamic> json) =>
      ListObjectsOutput(
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        marker: json.containsKey('Marker') ? json['Marker'] as String : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        contents: json.containsKey('Contents')
            ? (json['Contents'] as List).map((e) => Object.fromJson(e)).toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        delimiter:
            json.containsKey('Delimiter') ? json['Delimiter'] as String : null,
        maxKeys: json.containsKey('MaxKeys') ? json['MaxKeys'] as int : null,
        commonPrefixes: json.containsKey('CommonPrefixes')
            ? (json['CommonPrefixes'] as List)
                .map((e) => CommonPrefix.fromJson(e))
                .toList()
            : null,
        encodingType: json.containsKey('EncodingType')
            ? json['EncodingType'] as String
            : null,
      );
}

class ListObjectsV2Output {
  /// A flag that indicates whether or not Amazon S3 returned all of the results
  /// that satisfied the search criteria.
  final bool isTruncated;

  /// Metadata about each object returned.
  final List<Object> contents;

  /// Name of the bucket to list.
  final String name;

  /// Limits the response to keys that begin with the specified prefix.
  final String prefix;

  /// A delimiter is a character you use to group keys.
  final String delimiter;

  /// Sets the maximum number of keys returned in the response. The response
  /// might contain fewer keys but will never contain more.
  final int maxKeys;

  /// CommonPrefixes contains all (if there are any) keys between Prefix and the
  /// next occurrence of the string specified by delimiter
  final List<CommonPrefix> commonPrefixes;

  /// Encoding type used by Amazon S3 to encode object keys in the response.
  final String encodingType;

  /// KeyCount is the number of keys returned with this request. KeyCount will
  /// always be less than equals to MaxKeys field. Say you ask for 50 keys, your
  /// result will include less than equals 50 keys
  final int keyCount;

  /// ContinuationToken indicates Amazon S3 that the list is being continued on
  /// this bucket with a token. ContinuationToken is obfuscated and is not a
  /// real key
  final String continuationToken;

  /// NextContinuationToken is sent when isTruncated is true which means there
  /// are more keys in the bucket that can be listed. The next list requests to
  /// Amazon S3 can be continued with this NextContinuationToken.
  /// NextContinuationToken is obfuscated and is not a real key
  final String nextContinuationToken;

  /// StartAfter is where you want Amazon S3 to start listing from. Amazon S3
  /// starts listing after this specified key. StartAfter can be any key in the
  /// bucket
  final String startAfter;

  ListObjectsV2Output({
    this.isTruncated,
    this.contents,
    this.name,
    this.prefix,
    this.delimiter,
    this.maxKeys,
    this.commonPrefixes,
    this.encodingType,
    this.keyCount,
    this.continuationToken,
    this.nextContinuationToken,
    this.startAfter,
  });
  static ListObjectsV2Output fromJson(Map<String, dynamic> json) =>
      ListObjectsV2Output(
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        contents: json.containsKey('Contents')
            ? (json['Contents'] as List).map((e) => Object.fromJson(e)).toList()
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        delimiter:
            json.containsKey('Delimiter') ? json['Delimiter'] as String : null,
        maxKeys: json.containsKey('MaxKeys') ? json['MaxKeys'] as int : null,
        commonPrefixes: json.containsKey('CommonPrefixes')
            ? (json['CommonPrefixes'] as List)
                .map((e) => CommonPrefix.fromJson(e))
                .toList()
            : null,
        encodingType: json.containsKey('EncodingType')
            ? json['EncodingType'] as String
            : null,
        keyCount: json.containsKey('KeyCount') ? json['KeyCount'] as int : null,
        continuationToken: json.containsKey('ContinuationToken')
            ? json['ContinuationToken'] as String
            : null,
        nextContinuationToken: json.containsKey('NextContinuationToken')
            ? json['NextContinuationToken'] as String
            : null,
        startAfter: json.containsKey('StartAfter')
            ? json['StartAfter'] as String
            : null,
      );
}

class ListPartsOutput {
  /// Date when multipart upload will become eligible for abort operation by
  /// lifecycle.
  final DateTime abortDate;

  /// Id of the lifecycle rule that makes a multipart upload eligible for abort
  /// operation.
  final String abortRuleId;

  /// Name of the bucket to which the multipart upload was initiated.
  final String bucket;

  /// Object key for which the multipart upload was initiated.
  final String key;

  /// Upload ID identifying the multipart upload whose parts are being listed.
  final String uploadId;

  /// Part number after which listing begins.
  final int partNumberMarker;

  /// When a list is truncated, this element specifies the last part in the
  /// list, as well as the value to use for the part-number-marker request
  /// parameter in a subsequent request.
  final int nextPartNumberMarker;

  /// Maximum number of parts that were allowed in the response.
  final int maxParts;

  /// Indicates whether the returned list of parts is truncated.
  final bool isTruncated;

  final List<Part> parts;

  /// Identifies who initiated the multipart upload.
  final Initiator initiator;

  final Owner owner;

  /// The class of storage used to store the object.
  final String storageClass;

  final String requestCharged;

  ListPartsOutput({
    this.abortDate,
    this.abortRuleId,
    this.bucket,
    this.key,
    this.uploadId,
    this.partNumberMarker,
    this.nextPartNumberMarker,
    this.maxParts,
    this.isTruncated,
    this.parts,
    this.initiator,
    this.owner,
    this.storageClass,
    this.requestCharged,
  });
  static ListPartsOutput fromJson(Map<String, dynamic> json) => ListPartsOutput(
        abortDate: json.containsKey('AbortDate')
            ? DateTime.parse(json['AbortDate'])
            : null,
        abortRuleId: json.containsKey('AbortRuleId')
            ? json['AbortRuleId'] as String
            : null,
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        uploadId:
            json.containsKey('UploadId') ? json['UploadId'] as String : null,
        partNumberMarker: json.containsKey('PartNumberMarker')
            ? json['PartNumberMarker'] as int
            : null,
        nextPartNumberMarker: json.containsKey('NextPartNumberMarker')
            ? json['NextPartNumberMarker'] as int
            : null,
        maxParts: json.containsKey('MaxParts') ? json['MaxParts'] as int : null,
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
        parts: json.containsKey('Parts')
            ? (json['Parts'] as List).map((e) => Part.fromJson(e)).toList()
            : null,
        initiator: json.containsKey('Initiator')
            ? Initiator.fromJson(json['Initiator'])
            : null,
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

/// Describes where logs are stored and the prefix that Amazon S3 assigns to all
/// log object keys for a bucket. For more information, see
/// [PUT Bucket logging](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html)
/// in the _Amazon Simple Storage Service API Reference_.
class LoggingEnabled {
  /// Specifies the bucket where you want Amazon S3 to store server access logs.
  /// You can have your logs delivered to any bucket that you own, including the
  /// same bucket that is being logged. You can also configure multiple buckets
  /// to deliver their logs to the same target bucket. In this case you should
  /// choose a different TargetPrefix for each source bucket so that the
  /// delivered log files can be distinguished by key.
  final String targetBucket;

  final List<TargetGrant> targetGrants;

  /// A prefix for all log object keys. If you store log files from multiple
  /// Amazon S3 buckets in a single bucket, you can use a prefix to distinguish
  /// which log files came from which bucket.
  final String targetPrefix;

  LoggingEnabled({
    @required this.targetBucket,
    this.targetGrants,
    @required this.targetPrefix,
  });
  static LoggingEnabled fromJson(Map<String, dynamic> json) => LoggingEnabled(
        targetBucket: json['TargetBucket'] as String,
        targetGrants: json.containsKey('TargetGrants')
            ? (json['TargetGrants'] as List)
                .map((e) => TargetGrant.fromJson(e))
                .toList()
            : null,
        targetPrefix: json['TargetPrefix'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A metadata key-value pair to store with an object.
class MetadataEntry {
  final String name;

  final String value;

  MetadataEntry({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class MetricsAndOperator {
  /// The prefix used when evaluating an AND predicate.
  final String prefix;

  /// The list of tags used when evaluating an AND predicate.
  final List<Tag> tags;

  MetricsAndOperator({
    this.prefix,
    this.tags,
  });
  static MetricsAndOperator fromJson(Map<String, dynamic> json) =>
      MetricsAndOperator(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a metrics configuration for the CloudWatch request metrics
/// (specified by the metrics configuration ID) from an Amazon S3 bucket. If
/// you're updating an existing metrics configuration, note that this is a full
/// replacement of the existing metrics configuration. If you don't include the
/// elements you want to keep, they are erased. For more information, see
/// [PUT Bucket metrics](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTMetricConfiguration.html)
/// in the _Amazon Simple Storage Service API Reference_.
class MetricsConfiguration {
  /// The ID used to identify the metrics configuration.
  final String id;

  /// Specifies a metrics configuration filter. The metrics configuration will
  /// only include objects that meet the filter's criteria. A filter must be a
  /// prefix, a tag, or a conjunction (MetricsAndOperator).
  final MetricsFilter filter;

  MetricsConfiguration({
    @required this.id,
    this.filter,
  });
  static MetricsConfiguration fromJson(Map<String, dynamic> json) =>
      MetricsConfiguration(
        id: json['Id'] as String,
        filter: json.containsKey('Filter')
            ? MetricsFilter.fromJson(json['Filter'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class MetricsFilter {
  /// The prefix used when evaluating a metrics filter.
  final String prefix;

  /// The tag used when evaluating a metrics filter.
  final Tag tag;

  /// A conjunction (logical AND) of predicates, which is used in evaluating a
  /// metrics filter. The operator must have at least two predicates, and an
  /// object must match all of the predicates in order for the filter to apply.
  final MetricsAndOperator and;

  MetricsFilter({
    this.prefix,
    this.tag,
    this.and,
  });
  static MetricsFilter fromJson(Map<String, dynamic> json) => MetricsFilter(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tag: json.containsKey('Tag') ? Tag.fromJson(json['Tag']) : null,
        and: json.containsKey('And')
            ? MetricsAndOperator.fromJson(json['And'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class MultipartUpload {
  /// Upload ID that identifies the multipart upload.
  final String uploadId;

  /// Key of the object for which the multipart upload was initiated.
  final String key;

  /// Date and time at which the multipart upload was initiated.
  final DateTime initiated;

  /// The class of storage used to store the object.
  final String storageClass;

  final Owner owner;

  /// Identifies who initiated the multipart upload.
  final Initiator initiator;

  MultipartUpload({
    this.uploadId,
    this.key,
    this.initiated,
    this.storageClass,
    this.owner,
    this.initiator,
  });
  static MultipartUpload fromJson(Map<String, dynamic> json) => MultipartUpload(
        uploadId:
            json.containsKey('UploadId') ? json['UploadId'] as String : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        initiated: json.containsKey('Initiated')
            ? DateTime.parse(json['Initiated'])
            : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
        initiator: json.containsKey('Initiator')
            ? Initiator.fromJson(json['Initiator'])
            : null,
      );
}

/// Specifies when noncurrent object versions expire. Upon expiration, Amazon S3
/// permanently deletes the noncurrent object versions. You set this lifecycle
/// configuration action on a bucket that has versioning enabled (or suspended)
/// to request that Amazon S3 delete noncurrent object versions at a specific
/// period in the object's lifetime.
class NoncurrentVersionExpiration {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see
  /// [How Amazon S3 Calculates When an Object Became Noncurrent](https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations)
  /// in the Amazon Simple Storage Service Developer Guide.
  final int noncurrentDays;

  NoncurrentVersionExpiration({
    this.noncurrentDays,
  });
  static NoncurrentVersionExpiration fromJson(Map<String, dynamic> json) =>
      NoncurrentVersionExpiration(
        noncurrentDays: json.containsKey('NoncurrentDays')
            ? json['NoncurrentDays'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Container for the transition rule that describes when noncurrent objects
/// transition to the `STANDARD_IA`, `ONEZONE_IA`, `INTELLIGENT_TIERING`,
/// `GLACIER`, or `DEEP_ARCHIVE` storage class. If your bucket is
/// versioning-enabled (or versioning is suspended), you can set this action to
/// request that Amazon S3 transition noncurrent object versions to the
/// `STANDARD_IA`, `ONEZONE_IA`, `INTELLIGENT_TIERING`, `GLACIER`, or
/// `DEEP_ARCHIVE` storage class at a specific period in the object's lifetime.
class NoncurrentVersionTransition {
  /// Specifies the number of days an object is noncurrent before Amazon S3 can
  /// perform the associated action. For information about the noncurrent days
  /// calculations, see
  /// [How Amazon S3 Calculates When an Object Became Noncurrent](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final int noncurrentDays;

  /// The class of storage used to store the object.
  final String storageClass;

  NoncurrentVersionTransition({
    this.noncurrentDays,
    this.storageClass,
  });
  static NoncurrentVersionTransition fromJson(Map<String, dynamic> json) =>
      NoncurrentVersionTransition(
        noncurrentDays: json.containsKey('NoncurrentDays')
            ? json['NoncurrentDays'] as int
            : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for specifying the notification configuration of the bucket. If
/// this element is empty, notifications are turned off for the bucket.
class NotificationConfiguration {
  /// The topic to which notifications are sent and the events for which
  /// notifications are generated.
  final List<TopicConfiguration> topicConfigurations;

  /// The Amazon Simple Queue Service queues to publish messages to and the
  /// events for which to publish messages.
  final List<QueueConfiguration> queueConfigurations;

  /// Describes the AWS Lambda functions to invoke and the events for which to
  /// invoke them.
  final List<LambdaFunctionConfiguration> lambdaFunctionConfigurations;

  NotificationConfiguration({
    this.topicConfigurations,
    this.queueConfigurations,
    this.lambdaFunctionConfigurations,
  });
  static NotificationConfiguration fromJson(Map<String, dynamic> json) =>
      NotificationConfiguration(
        topicConfigurations: json.containsKey('TopicConfigurations')
            ? (json['TopicConfigurations'] as List)
                .map((e) => TopicConfiguration.fromJson(e))
                .toList()
            : null,
        queueConfigurations: json.containsKey('QueueConfigurations')
            ? (json['QueueConfigurations'] as List)
                .map((e) => QueueConfiguration.fromJson(e))
                .toList()
            : null,
        lambdaFunctionConfigurations:
            json.containsKey('LambdaFunctionConfigurations')
                ? (json['LambdaFunctionConfigurations'] as List)
                    .map((e) => LambdaFunctionConfiguration.fromJson(e))
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class NotificationConfigurationDeprecated {
  final TopicConfigurationDeprecated topicConfiguration;

  final QueueConfigurationDeprecated queueConfiguration;

  final CloudFunctionConfiguration cloudFunctionConfiguration;

  NotificationConfigurationDeprecated({
    this.topicConfiguration,
    this.queueConfiguration,
    this.cloudFunctionConfiguration,
  });
  static NotificationConfigurationDeprecated fromJson(
          Map<String, dynamic> json) =>
      NotificationConfigurationDeprecated(
        topicConfiguration: json.containsKey('TopicConfiguration')
            ? TopicConfigurationDeprecated.fromJson(json['TopicConfiguration'])
            : null,
        queueConfiguration: json.containsKey('QueueConfiguration')
            ? QueueConfigurationDeprecated.fromJson(json['QueueConfiguration'])
            : null,
        cloudFunctionConfiguration:
            json.containsKey('CloudFunctionConfiguration')
                ? CloudFunctionConfiguration.fromJson(
                    json['CloudFunctionConfiguration'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies object key name filtering rules. For information about key name
/// filtering, see
/// [Configuring Event Notifications](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
/// in the _Amazon Simple Storage Service Developer Guide_.
class NotificationConfigurationFilter {
  final S3KeyFilter key;

  NotificationConfigurationFilter({
    this.key,
  });
  static NotificationConfigurationFilter fromJson(Map<String, dynamic> json) =>
      NotificationConfigurationFilter(
        key: json.containsKey('Key') ? S3KeyFilter.fromJson(json['Key']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Object {
  final String key;

  final DateTime lastModified;

  final String eTag;

  final int size;

  /// The class of storage used to store the object.
  final String storageClass;

  final Owner owner;

  Object({
    this.key,
    this.lastModified,
    this.eTag,
    this.size,
    this.storageClass,
    this.owner,
  });
  static Object fromJson(Map<String, dynamic> json) => Object(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        size: json.containsKey('Size') ? json['Size'] as int : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
      );
}

class ObjectIdentifier {
  /// Key name of the object to delete.
  final String key;

  /// VersionId for the specific version of the object to delete.
  final String versionId;

  ObjectIdentifier({
    @required this.key,
    this.versionId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The container element for object lock configuration parameters.
class ObjectLockConfiguration {
  /// Indicates whether this bucket has an object lock configuration enabled.
  final String objectLockEnabled;

  /// The object lock rule in place for the specified object.
  final ObjectLockRule rule;

  ObjectLockConfiguration({
    this.objectLockEnabled,
    this.rule,
  });
  static ObjectLockConfiguration fromJson(Map<String, dynamic> json) =>
      ObjectLockConfiguration(
        objectLockEnabled: json.containsKey('ObjectLockEnabled')
            ? json['ObjectLockEnabled'] as String
            : null,
        rule: json.containsKey('Rule')
            ? ObjectLockRule.fromJson(json['Rule'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Legal Hold configuration for an object.
class ObjectLockLegalHold {
  /// Indicates whether the specified object has a Legal Hold in place.
  final String status;

  ObjectLockLegalHold({
    this.status,
  });
  static ObjectLockLegalHold fromJson(Map<String, dynamic> json) =>
      ObjectLockLegalHold(
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Retention configuration for an object.
class ObjectLockRetention {
  /// Indicates the Retention mode for the specified object.
  final String mode;

  /// The date on which this object lock retention expires.
  final DateTime retainUntilDate;

  ObjectLockRetention({
    this.mode,
    this.retainUntilDate,
  });
  static ObjectLockRetention fromJson(Map<String, dynamic> json) =>
      ObjectLockRetention(
        mode: json.containsKey('Mode') ? json['Mode'] as String : null,
        retainUntilDate: json.containsKey('RetainUntilDate')
            ? DateTime.parse(json['RetainUntilDate'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The container element for an object lock rule.
class ObjectLockRule {
  /// The default retention period that you want to apply to new objects placed
  /// in the specified bucket.
  final DefaultRetention defaultRetention;

  ObjectLockRule({
    this.defaultRetention,
  });
  static ObjectLockRule fromJson(Map<String, dynamic> json) => ObjectLockRule(
        defaultRetention: json.containsKey('DefaultRetention')
            ? DefaultRetention.fromJson(json['DefaultRetention'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ObjectVersion {
  final String eTag;

  /// Size in bytes of the object.
  final int size;

  /// The class of storage used to store the object.
  final String storageClass;

  /// The object key.
  final String key;

  /// Version ID of an object.
  final String versionId;

  /// Specifies whether the object is (true) or is not (false) the latest
  /// version of an object.
  final bool isLatest;

  /// Date and time the object was last modified.
  final DateTime lastModified;

  final Owner owner;

  ObjectVersion({
    this.eTag,
    this.size,
    this.storageClass,
    this.key,
    this.versionId,
    this.isLatest,
    this.lastModified,
    this.owner,
  });
  static ObjectVersion fromJson(Map<String, dynamic> json) => ObjectVersion(
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        size: json.containsKey('Size') ? json['Size'] as int : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        isLatest:
            json.containsKey('IsLatest') ? json['IsLatest'] as bool : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        owner: json.containsKey('Owner') ? Owner.fromJson(json['Owner']) : null,
      );
}

/// Describes the location where the restore job's output is stored.
class OutputLocation {
  /// Describes an S3 location that will receive the results of the restore
  /// request.
  final S3Location s3;

  OutputLocation({
    this.s3,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes how results of the Select job are serialized.
class OutputSerialization {
  /// Describes the serialization of CSV-encoded Select results.
  final CsvOutput csv;

  /// Specifies JSON as request's output serialization format.
  final JsonOutput json;

  OutputSerialization({
    this.csv,
    this.json,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Owner {
  final String displayName;

  final String id;

  Owner({
    this.displayName,
    this.id,
  });
  static Owner fromJson(Map<String, dynamic> json) => Owner(
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
        id: json.containsKey('ID') ? json['ID'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ParquetInput {
  ParquetInput();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Part {
  /// Part number identifying the part. This is a positive integer between 1 and
  /// 10,000.
  final int partNumber;

  /// Date and time at which the part was uploaded.
  final DateTime lastModified;

  /// Entity tag returned when the part was uploaded.
  final String eTag;

  /// Size in bytes of the uploaded part data.
  final int size;

  Part({
    this.partNumber,
    this.lastModified,
    this.eTag,
    this.size,
  });
  static Part fromJson(Map<String, dynamic> json) => Part(
        partNumber:
            json.containsKey('PartNumber') ? json['PartNumber'] as int : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        size: json.containsKey('Size') ? json['Size'] as int : null,
      );
}

/// The container element for a bucket's policy status.
class PolicyStatus {
  /// The policy status for this bucket. `TRUE` indicates that this bucket is
  /// public. `FALSE` indicates that the bucket is not public.
  final bool isPublic;

  PolicyStatus({
    this.isPublic,
  });
  static PolicyStatus fromJson(Map<String, dynamic> json) => PolicyStatus(
        isPublic:
            json.containsKey('IsPublic') ? json['IsPublic'] as bool : null,
      );
}

class Progress {
  /// The current number of object bytes scanned.
  final BigInt bytesScanned;

  /// The current number of uncompressed object bytes processed.
  final BigInt bytesProcessed;

  /// The current number of bytes of records payload data returned.
  final BigInt bytesReturned;

  Progress({
    this.bytesScanned,
    this.bytesProcessed,
    this.bytesReturned,
  });
  static Progress fromJson(Map<String, dynamic> json) => Progress(
        bytesScanned: json.containsKey('BytesScanned')
            ? BigInt.from(json['BytesScanned'])
            : null,
        bytesProcessed: json.containsKey('BytesProcessed')
            ? BigInt.from(json['BytesProcessed'])
            : null,
        bytesReturned: json.containsKey('BytesReturned')
            ? BigInt.from(json['BytesReturned'])
            : null,
      );
}

class ProgressEvent {
  /// The Progress event details.
  final Progress details;

  ProgressEvent({
    this.details,
  });
  static ProgressEvent fromJson(Map<String, dynamic> json) => ProgressEvent(
        details: json.containsKey('Details')
            ? Progress.fromJson(json['Details'])
            : null,
      );
}

/// Specifies the Block Public Access configuration for an Amazon S3 bucket.
class PublicAccessBlockConfiguration {
  /// Specifies whether Amazon S3 should block public access control lists
  /// (ACLs) for this bucket and objects in this bucket. Setting this element to
  /// `TRUE` causes the following behavior:
  ///
  /// *   PUT Bucket acl and PUT Object acl calls fail if the specified ACL is
  /// public.
  ///
  /// *   PUT Object calls fail if the request includes a public ACL.
  ///
  ///
  /// Enabling this setting doesn't affect existing policies or ACLs.
  final bool blockPublicAcls;

  /// Specifies whether Amazon S3 should ignore public ACLs for this bucket and
  /// objects in this bucket. Setting this element to `TRUE` causes Amazon S3 to
  /// ignore all public ACLs on this bucket and objects in this bucket.
  ///
  /// Enabling this setting doesn't affect the persistence of any existing ACLs
  /// and doesn't prevent new public ACLs from being set.
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should block public bucket policies for this
  /// bucket. Setting this element to `TRUE` causes Amazon S3 to reject calls to
  /// PUT Bucket policy if the specified bucket policy allows public access.
  ///
  /// Enabling this setting doesn't affect existing bucket policies.
  final bool blockPublicPolicy;

  /// Specifies whether Amazon S3 should restrict public bucket policies for
  /// this bucket. Setting this element to `TRUE` restricts access to this
  /// bucket to only AWS services and authorized users within this account if
  /// the bucket has a public policy.
  ///
  /// Enabling this setting doesn't affect previously stored bucket policies,
  /// except that public and cross-account access within any public bucket
  /// policy, including non-public delegation to specific accounts, is blocked.
  final bool restrictPublicBuckets;

  PublicAccessBlockConfiguration({
    this.blockPublicAcls,
    this.ignorePublicAcls,
    this.blockPublicPolicy,
    this.restrictPublicBuckets,
  });
  static PublicAccessBlockConfiguration fromJson(Map<String, dynamic> json) =>
      PublicAccessBlockConfiguration(
        blockPublicAcls: json.containsKey('BlockPublicAcls')
            ? json['BlockPublicAcls'] as bool
            : null,
        ignorePublicAcls: json.containsKey('IgnorePublicAcls')
            ? json['IgnorePublicAcls'] as bool
            : null,
        blockPublicPolicy: json.containsKey('BlockPublicPolicy')
            ? json['BlockPublicPolicy'] as bool
            : null,
        restrictPublicBuckets: json.containsKey('RestrictPublicBuckets')
            ? json['RestrictPublicBuckets'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutObjectAclOutput {
  final String requestCharged;

  PutObjectAclOutput({
    this.requestCharged,
  });
  static PutObjectAclOutput fromJson(Map<String, dynamic> json) =>
      PutObjectAclOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class PutObjectLegalHoldOutput {
  final String requestCharged;

  PutObjectLegalHoldOutput({
    this.requestCharged,
  });
  static PutObjectLegalHoldOutput fromJson(Map<String, dynamic> json) =>
      PutObjectLegalHoldOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class PutObjectLockConfigurationOutput {
  final String requestCharged;

  PutObjectLockConfigurationOutput({
    this.requestCharged,
  });
  static PutObjectLockConfigurationOutput fromJson(Map<String, dynamic> json) =>
      PutObjectLockConfigurationOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class PutObjectOutput {
  /// If the object expiration is configured, this will contain the expiration
  /// date (expiry-date) and rule ID (rule-id). The value of rule-id is URL
  /// encoded.
  final String expiration;

  /// Entity tag for the uploaded object.
  final String eTag;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// Version of the object.
  final String versionId;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  /// If present, specifies the AWS KMS Encryption Context to use for object
  /// encryption. The value of this header is a base64-encoded UTF-8 string
  /// holding JSON with the encryption context key-value pairs.
  final String ssekmsEncryptionContext;

  final String requestCharged;

  PutObjectOutput({
    this.expiration,
    this.eTag,
    this.serverSideEncryption,
    this.versionId,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.ssekmsEncryptionContext,
    this.requestCharged,
  });
  static PutObjectOutput fromJson(Map<String, dynamic> json) => PutObjectOutput(
        expiration: json.containsKey('Expiration')
            ? json['Expiration'] as String
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        ssekmsEncryptionContext: json.containsKey('SSEKMSEncryptionContext')
            ? json['SSEKMSEncryptionContext'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class PutObjectRetentionOutput {
  final String requestCharged;

  PutObjectRetentionOutput({
    this.requestCharged,
  });
  static PutObjectRetentionOutput fromJson(Map<String, dynamic> json) =>
      PutObjectRetentionOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class PutObjectTaggingOutput {
  final String versionId;

  PutObjectTaggingOutput({
    this.versionId,
  });
  static PutObjectTaggingOutput fromJson(Map<String, dynamic> json) =>
      PutObjectTaggingOutput(
        versionId:
            json.containsKey('VersionId') ? json['VersionId'] as String : null,
      );
}

/// Specifies the configuration for publishing messages to an Amazon Simple
/// Queue Service (Amazon SQS) queue when Amazon S3 detects specified events.
class QueueConfiguration {
  final String id;

  /// The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3
  /// publishes a message when it detects events of the specified type.
  final String queueArn;

  final List<String> events;

  final NotificationConfigurationFilter filter;

  QueueConfiguration({
    this.id,
    @required this.queueArn,
    @required this.events,
    this.filter,
  });
  static QueueConfiguration fromJson(Map<String, dynamic> json) =>
      QueueConfiguration(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        queueArn: json['QueueArn'] as String,
        events: (json['Events'] as List).map((e) => e as String).toList(),
        filter: json.containsKey('Filter')
            ? NotificationConfigurationFilter.fromJson(json['Filter'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class QueueConfigurationDeprecated {
  final String id;

  final String event;

  final List<String> events;

  final String queue;

  QueueConfigurationDeprecated({
    this.id,
    this.event,
    this.events,
    this.queue,
  });
  static QueueConfigurationDeprecated fromJson(Map<String, dynamic> json) =>
      QueueConfigurationDeprecated(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        event: json.containsKey('Event') ? json['Event'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => e as String).toList()
            : null,
        queue: json.containsKey('Queue') ? json['Queue'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RecordsEvent {
  /// The byte array of partial, one or more result records.
  final Uint8List payload;

  RecordsEvent({
    this.payload,
  });
  static RecordsEvent fromJson(Map<String, dynamic> json) => RecordsEvent(
        payload:
            json.containsKey('Payload') ? Uint8List(json['Payload']) : null,
      );
}

/// Specifies how requests are redirected. In the event of an error, you can
/// specify a different error code to return.
class Redirect {
  /// The host name to use in the redirect request.
  final String hostName;

  /// The HTTP redirect code to use on the response. Not required if one of the
  /// siblings is present.
  final String httpRedirectCode;

  /// Protocol to use when redirecting requests. The default is the protocol
  /// that is used in the original request.
  final String protocol;

  /// The object key prefix to use in the redirect request. For example, to
  /// redirect requests for all pages with prefix `docs/` (objects in the
  /// `docs/` folder) to `documents/`, you can set a condition block with
  /// `KeyPrefixEquals` set to `docs/` and in the Redirect set
  /// `ReplaceKeyPrefixWith` to `/documents`. Not required if one of the
  /// siblings is present. Can be present only if `ReplaceKeyWith` is not
  /// provided.
  final String replaceKeyPrefixWith;

  /// The specific object key to use in the redirect request. For example,
  /// redirect request to `error.html`. Not required if one of the siblings is
  /// present. Can be present only if `ReplaceKeyPrefixWith` is not provided.
  final String replaceKeyWith;

  Redirect({
    this.hostName,
    this.httpRedirectCode,
    this.protocol,
    this.replaceKeyPrefixWith,
    this.replaceKeyWith,
  });
  static Redirect fromJson(Map<String, dynamic> json) => Redirect(
        hostName:
            json.containsKey('HostName') ? json['HostName'] as String : null,
        httpRedirectCode: json.containsKey('HttpRedirectCode')
            ? json['HttpRedirectCode'] as String
            : null,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
        replaceKeyPrefixWith: json.containsKey('ReplaceKeyPrefixWith')
            ? json['ReplaceKeyPrefixWith'] as String
            : null,
        replaceKeyWith: json.containsKey('ReplaceKeyWith')
            ? json['ReplaceKeyWith'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the redirect behavior of all requests to a website endpoint of an
/// Amazon S3 bucket.
class RedirectAllRequestsTo {
  /// Name of the host where requests are redirected.
  final String hostName;

  /// Protocol to use when redirecting requests. The default is the protocol
  /// that is used in the original request.
  final String protocol;

  RedirectAllRequestsTo({
    @required this.hostName,
    this.protocol,
  });
  static RedirectAllRequestsTo fromJson(Map<String, dynamic> json) =>
      RedirectAllRequestsTo(
        hostName: json['HostName'] as String,
        protocol:
            json.containsKey('Protocol') ? json['Protocol'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for replication rules. You can add up to 1,000 rules. The
/// maximum size of a replication configuration is 2 MB.
class ReplicationConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that Amazon S3 assumes when replicating objects. For more
  /// information, see
  /// [How to Set Up Cross-Region Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr-how-setup.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final String role;

  /// A container for one or more replication rules. A replication configuration
  /// must have at least one rule and can contain a maximum of 1,000 rules.
  final List<ReplicationRule> rules;

  ReplicationConfiguration({
    @required this.role,
    @required this.rules,
  });
  static ReplicationConfiguration fromJson(Map<String, dynamic> json) =>
      ReplicationConfiguration(
        role: json['Role'] as String,
        rules: (json['Rules'] as List)
            .map((e) => ReplicationRule.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies which Amazon S3 objects to replicate and where to store the
/// replicas.
class ReplicationRule {
  /// A unique identifier for the rule. The maximum value is 255 characters.
  final String id;

  /// The priority associated with the rule. If you specify multiple rules in a
  /// replication configuration, Amazon S3 prioritizes the rules to prevent
  /// conflicts when filtering. If two or more rules identify the same object
  /// based on a specified filter, the rule with higher priority takes
  /// precedence. For example:
  ///
  /// *   Same object quality prefix based filter criteria If prefixes you
  /// specified in multiple rules overlap
  ///
  /// *   Same object qualify tag based filter criteria specified in multiple
  /// rules
  ///
  ///
  /// For more information, see
  /// [Cross-Region Replication (CRR)](https://docs.aws.amazon.com/AmazonS3/latest/dev/crr.html)
  /// in the _Amazon S3 Developer Guide_.
  final int priority;

  /// An object keyname prefix that identifies the object or objects to which
  /// the rule applies. The maximum prefix length is 1,024 characters. To
  /// include all objects in a bucket, specify an empty string.
  final String prefix;

  final ReplicationRuleFilter filter;

  /// Specifies whether the rule is enabled.
  final String status;

  /// A container that describes additional filters for identifying the source
  /// objects that you want to replicate. You can choose to enable or disable
  /// the replication of these objects. Currently, Amazon S3 supports only the
  /// filter that you can specify for objects created with server-side
  /// encryption using an AWS KMS-Managed Key (SSE-KMS).
  final SourceSelectionCriteria sourceSelectionCriteria;

  /// A container for information about the replication destination.
  final Destination destination;

  final DeleteMarkerReplication deleteMarkerReplication;

  ReplicationRule({
    this.id,
    this.priority,
    this.prefix,
    this.filter,
    @required this.status,
    this.sourceSelectionCriteria,
    @required this.destination,
    this.deleteMarkerReplication,
  });
  static ReplicationRule fromJson(Map<String, dynamic> json) => ReplicationRule(
        id: json.containsKey('ID') ? json['ID'] as String : null,
        priority: json.containsKey('Priority') ? json['Priority'] as int : null,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        filter: json.containsKey('Filter')
            ? ReplicationRuleFilter.fromJson(json['Filter'])
            : null,
        status: json['Status'] as String,
        sourceSelectionCriteria: json.containsKey('SourceSelectionCriteria')
            ? SourceSelectionCriteria.fromJson(json['SourceSelectionCriteria'])
            : null,
        destination: Destination.fromJson(json['Destination']),
        deleteMarkerReplication: json.containsKey('DeleteMarkerReplication')
            ? DeleteMarkerReplication.fromJson(json['DeleteMarkerReplication'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ReplicationRuleAndOperator {
  final String prefix;

  final List<Tag> tags;

  ReplicationRuleAndOperator({
    this.prefix,
    this.tags,
  });
  static ReplicationRuleAndOperator fromJson(Map<String, dynamic> json) =>
      ReplicationRuleAndOperator(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A filter that identifies the subset of objects to which the replication rule
/// applies. A `Filter` must specify exactly one `Prefix`, `Tag`, or an `And`
/// child element.
class ReplicationRuleFilter {
  /// An object keyname prefix that identifies the subset of objects to which
  /// the rule applies.
  final String prefix;

  /// A container for specifying a tag key and value.
  ///
  /// The rule applies only to objects that have the tag in their tag set.
  final Tag tag;

  /// A container for specifying rule filters. The filters determine the subset
  /// of objects to which the rule applies. This element is required only if you
  /// specify more than one filter. For example:
  ///
  /// *   If you specify both a `Prefix` and a `Tag` filter, wrap these filters
  /// in an `And` tag.
  ///
  /// *   If you specify a filter based on multiple tags, wrap the `Tag`
  /// elements in an `And` tag.
  final ReplicationRuleAndOperator and;

  ReplicationRuleFilter({
    this.prefix,
    this.tag,
    this.and,
  });
  static ReplicationRuleFilter fromJson(Map<String, dynamic> json) =>
      ReplicationRuleFilter(
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        tag: json.containsKey('Tag') ? Tag.fromJson(json['Tag']) : null,
        and: json.containsKey('And')
            ? ReplicationRuleAndOperator.fromJson(json['And'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RequestPaymentConfiguration {
  /// Specifies who pays for the download and request fees.
  final String payer;

  RequestPaymentConfiguration({
    @required this.payer,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RequestProgress {
  /// Specifies whether periodic QueryProgress frames should be sent. Valid
  /// values: TRUE, FALSE. Default value: FALSE.
  final bool enabled;

  RequestProgress({
    this.enabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RestoreObjectOutput {
  final String requestCharged;

  /// Indicates the path in the provided S3 output location where Select results
  /// will be restored to.
  final String restoreOutputPath;

  RestoreObjectOutput({
    this.requestCharged,
    this.restoreOutputPath,
  });
  static RestoreObjectOutput fromJson(Map<String, dynamic> json) =>
      RestoreObjectOutput(
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
        restoreOutputPath: json.containsKey('RestoreOutputPath')
            ? json['RestoreOutputPath'] as String
            : null,
      );
}

/// Container for restore job parameters.
class RestoreRequest {
  /// Lifetime of the active copy in days. Do not use with restores that specify
  /// OutputLocation.
  final int days;

  /// Glacier related parameters pertaining to this job. Do not use with
  /// restores that specify OutputLocation.
  final GlacierJobParameters glacierJobParameters;

  /// Type of restore request.
  final String type;

  /// Glacier retrieval tier at which the restore will be processed.
  final String tier;

  /// The optional description for the job.
  final String description;

  /// Describes the parameters for Select job types.
  final SelectParameters selectParameters;

  /// Describes the location where the restore job's output is stored.
  final OutputLocation outputLocation;

  RestoreRequest({
    this.days,
    this.glacierJobParameters,
    this.type,
    this.tier,
    this.description,
    this.selectParameters,
    this.outputLocation,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the redirect behavior and when a redirect is applied.
class RoutingRule {
  /// A container for describing a condition that must be met for the specified
  /// redirect to apply. For example, 1. If request is for pages in the `/docs`
  /// folder, redirect to the `/documents` folder. 2. If request results in HTTP
  /// error 4xx, redirect request to another host where you might process the
  /// error.
  final Condition condition;

  /// Container for redirect information. You can redirect requests to another
  /// host, to another page, or with another protocol. In the event of an error,
  /// you can specify a different error code to return.
  final Redirect redirect;

  RoutingRule({
    this.condition,
    @required this.redirect,
  });
  static RoutingRule fromJson(Map<String, dynamic> json) => RoutingRule(
        condition: json.containsKey('Condition')
            ? Condition.fromJson(json['Condition'])
            : null,
        redirect: Redirect.fromJson(json['Redirect']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies lifecycle rules for an Amazon S3 bucket. For more information, see
/// [PUT Bucket lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlifecycle.html)
/// in the _Amazon Simple Storage Service API Reference_.
class Rule {
  final LifecycleExpiration expiration;

  /// Unique identifier for the rule. The value can't be longer than 255
  /// characters.
  final String id;

  /// Object key prefix that identifies one or more objects to which this rule
  /// applies.
  final String prefix;

  /// If `Enabled`, the rule is currently being applied. If `Disabled`, the rule
  /// is not currently being applied.
  final String status;

  final Transition transition;

  final NoncurrentVersionTransition noncurrentVersionTransition;

  final NoncurrentVersionExpiration noncurrentVersionExpiration;

  final AbortIncompleteMultipartUpload abortIncompleteMultipartUpload;

  Rule({
    this.expiration,
    this.id,
    @required this.prefix,
    @required this.status,
    this.transition,
    this.noncurrentVersionTransition,
    this.noncurrentVersionExpiration,
    this.abortIncompleteMultipartUpload,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule(
        expiration: json.containsKey('Expiration')
            ? LifecycleExpiration.fromJson(json['Expiration'])
            : null,
        id: json.containsKey('ID') ? json['ID'] as String : null,
        prefix: json['Prefix'] as String,
        status: json['Status'] as String,
        transition: json.containsKey('Transition')
            ? Transition.fromJson(json['Transition'])
            : null,
        noncurrentVersionTransition:
            json.containsKey('NoncurrentVersionTransition')
                ? NoncurrentVersionTransition.fromJson(
                    json['NoncurrentVersionTransition'])
                : null,
        noncurrentVersionExpiration:
            json.containsKey('NoncurrentVersionExpiration')
                ? NoncurrentVersionExpiration.fromJson(
                    json['NoncurrentVersionExpiration'])
                : null,
        abortIncompleteMultipartUpload:
            json.containsKey('AbortIncompleteMultipartUpload')
                ? AbortIncompleteMultipartUpload.fromJson(
                    json['AbortIncompleteMultipartUpload'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for object key name prefix and suffix filtering rules.
class S3KeyFilter {
  final List<FilterRule> filterRules;

  S3KeyFilter({
    this.filterRules,
  });
  static S3KeyFilter fromJson(Map<String, dynamic> json) => S3KeyFilter(
        filterRules: json.containsKey('FilterRules')
            ? (json['FilterRules'] as List)
                .map((e) => FilterRule.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an S3 location that will receive the results of the restore
/// request.
class S3Location {
  /// The name of the bucket where the restore results will be placed.
  final String bucketName;

  /// The prefix that is prepended to the restore results for this request.
  final String prefix;

  final Encryption encryption;

  /// The canned ACL to apply to the restore results.
  final String cannedAcl;

  /// A list of grants that control access to the staged results.
  final List<Grant> accessControlList;

  /// The tag-set that is applied to the restore results.
  final Tagging tagging;

  /// A list of metadata to store with the restore results in S3.
  final List<MetadataEntry> userMetadata;

  /// The class of storage used to store the restore results.
  final String storageClass;

  S3Location({
    @required this.bucketName,
    @required this.prefix,
    this.encryption,
    this.cannedAcl,
    this.accessControlList,
    this.tagging,
    this.userMetadata,
    this.storageClass,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the use of SSE-KMS to encrypt delivered Inventory reports.
class Ssekms {
  /// Specifies the ID of the AWS Key Management Service (KMS) master encryption
  /// key to use for encrypting Inventory reports.
  final String keyId;

  Ssekms({
    @required this.keyId,
  });
  static Ssekms fromJson(Map<String, dynamic> json) => Ssekms(
        keyId: json['KeyId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the use of SSE-S3 to encrypt delivered Inventory reports.
class Sses3 {
  Sses3();
  static Sses3 fromJson(Map<String, dynamic> json) => Sses3();
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class SelectObjectContentEventStream {
  /// The Records Event.
  final RecordsEvent records;

  /// The Stats Event.
  final StatsEvent stats;

  /// The Progress Event.
  final ProgressEvent progress;

  /// The Continuation Event.
  final ContinuationEvent cont;

  /// The End Event.
  final EndEvent end;

  SelectObjectContentEventStream({
    this.records,
    this.stats,
    this.progress,
    this.cont,
    this.end,
  });
  static SelectObjectContentEventStream fromJson(Map<String, dynamic> json) =>
      SelectObjectContentEventStream(
        records: json.containsKey('Records')
            ? RecordsEvent.fromJson(json['Records'])
            : null,
        stats: json.containsKey('Stats')
            ? StatsEvent.fromJson(json['Stats'])
            : null,
        progress: json.containsKey('Progress')
            ? ProgressEvent.fromJson(json['Progress'])
            : null,
        cont: json.containsKey('Cont')
            ? ContinuationEvent.fromJson(json['Cont'])
            : null,
        end: json.containsKey('End') ? EndEvent.fromJson(json['End']) : null,
      );
}

class SelectObjectContentOutput {
  final SelectObjectContentEventStream payload;

  SelectObjectContentOutput({
    this.payload,
  });
  static SelectObjectContentOutput fromJson(Map<String, dynamic> json) =>
      SelectObjectContentOutput(
        payload: json.containsKey('Payload')
            ? SelectObjectContentEventStream.fromJson(json['Payload'])
            : null,
      );
}

/// Describes the parameters for Select job types.
class SelectParameters {
  /// Describes the serialization format of the object.
  final InputSerialization inputSerialization;

  /// The type of the provided expression (e.g., SQL).
  final String expressionType;

  /// The expression that is used to query the object.
  final String expression;

  /// Describes how the results of the Select job are serialized.
  final OutputSerialization outputSerialization;

  SelectParameters({
    @required this.inputSerialization,
    @required this.expressionType,
    @required this.expression,
    @required this.outputSerialization,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the default server-side encryption to apply to new objects in the
/// bucket. If a PUT Object request doesn't specify any server-side encryption,
/// this default encryption will be applied. For more information, see
/// [PUT Bucket encryption](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTencryption.html)
/// in the _Amazon Simple Storage Service API Reference_.
class ServerSideEncryptionByDefault {
  /// Server-side encryption algorithm to use for the default encryption.
  final String sseAlgorithm;

  /// KMS master key ID to use for the default encryption. This parameter is
  /// allowed if and only if `SSEAlgorithm` is set to `aws:kms`.
  final String kmsMasterKeyID;

  ServerSideEncryptionByDefault({
    @required this.sseAlgorithm,
    this.kmsMasterKeyID,
  });
  static ServerSideEncryptionByDefault fromJson(Map<String, dynamic> json) =>
      ServerSideEncryptionByDefault(
        sseAlgorithm: json['SSEAlgorithm'] as String,
        kmsMasterKeyID: json.containsKey('KMSMasterKeyID')
            ? json['KMSMasterKeyID'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the default server-side-encryption configuration.
class ServerSideEncryptionConfiguration {
  /// Container for information about a particular server-side encryption
  /// configuration rule.
  final List<ServerSideEncryptionRule> rules;

  ServerSideEncryptionConfiguration({
    @required this.rules,
  });
  static ServerSideEncryptionConfiguration fromJson(
          Map<String, dynamic> json) =>
      ServerSideEncryptionConfiguration(
        rules: (json['Rules'] as List)
            .map((e) => ServerSideEncryptionRule.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the default server-side encryption configuration.
class ServerSideEncryptionRule {
  /// Specifies the default server-side encryption to apply to new objects in
  /// the bucket. If a PUT Object request doesn't specify any server-side
  /// encryption, this default encryption will be applied.
  final ServerSideEncryptionByDefault applyServerSideEncryptionByDefault;

  ServerSideEncryptionRule({
    this.applyServerSideEncryptionByDefault,
  });
  static ServerSideEncryptionRule fromJson(Map<String, dynamic> json) =>
      ServerSideEncryptionRule(
        applyServerSideEncryptionByDefault:
            json.containsKey('ApplyServerSideEncryptionByDefault')
                ? ServerSideEncryptionByDefault.fromJson(
                    json['ApplyServerSideEncryptionByDefault'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container that describes additional filters for identifying the source
/// objects that you want to replicate. You can choose to enable or disable the
/// replication of these objects. Currently, Amazon S3 supports only the filter
/// that you can specify for objects created with server-side encryption using
/// an AWS KMS-Managed Key (SSE-KMS).
class SourceSelectionCriteria {
  ///  A container for filter information for the selection of Amazon S3 objects
  /// encrypted with AWS KMS. If you include `SourceSelectionCriteria` in the
  /// replication configuration, this element is required.
  final SseKmsEncryptedObjects sseKmsEncryptedObjects;

  SourceSelectionCriteria({
    this.sseKmsEncryptedObjects,
  });
  static SourceSelectionCriteria fromJson(Map<String, dynamic> json) =>
      SourceSelectionCriteria(
        sseKmsEncryptedObjects: json.containsKey('SseKmsEncryptedObjects')
            ? SseKmsEncryptedObjects.fromJson(json['SseKmsEncryptedObjects'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for filter information for the selection of S3 objects encrypted
/// with AWS KMS.
class SseKmsEncryptedObjects {
  /// Specifies whether Amazon S3 replicates objects created with server-side
  /// encryption using an AWS KMS-managed key.
  final String status;

  SseKmsEncryptedObjects({
    @required this.status,
  });
  static SseKmsEncryptedObjects fromJson(Map<String, dynamic> json) =>
      SseKmsEncryptedObjects(
        status: json['Status'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Stats {
  /// The total number of object bytes scanned.
  final BigInt bytesScanned;

  /// The total number of uncompressed object bytes processed.
  final BigInt bytesProcessed;

  /// The total number of bytes of records payload data returned.
  final BigInt bytesReturned;

  Stats({
    this.bytesScanned,
    this.bytesProcessed,
    this.bytesReturned,
  });
  static Stats fromJson(Map<String, dynamic> json) => Stats(
        bytesScanned: json.containsKey('BytesScanned')
            ? BigInt.from(json['BytesScanned'])
            : null,
        bytesProcessed: json.containsKey('BytesProcessed')
            ? BigInt.from(json['BytesProcessed'])
            : null,
        bytesReturned: json.containsKey('BytesReturned')
            ? BigInt.from(json['BytesReturned'])
            : null,
      );
}

class StatsEvent {
  /// The Stats event details.
  final Stats details;

  StatsEvent({
    this.details,
  });
  static StatsEvent fromJson(Map<String, dynamic> json) => StatsEvent(
        details: json.containsKey('Details')
            ? Stats.fromJson(json['Details'])
            : null,
      );
}

/// Specifies data related to access patterns to be collected and made available
/// to analyze the tradeoffs between different storage classes for an Amazon S3
/// bucket.
class StorageClassAnalysis {
  /// Specifies how data related to the storage class analysis for an Amazon S3
  /// bucket should be exported.
  final StorageClassAnalysisDataExport dataExport;

  StorageClassAnalysis({
    this.dataExport,
  });
  static StorageClassAnalysis fromJson(Map<String, dynamic> json) =>
      StorageClassAnalysis(
        dataExport: json.containsKey('DataExport')
            ? StorageClassAnalysisDataExport.fromJson(json['DataExport'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StorageClassAnalysisDataExport {
  /// The version of the output schema to use when exporting data. Must be
  /// `V_1`.
  final String outputSchemaVersion;

  /// The place to store the data for an analysis.
  final AnalyticsExportDestination destination;

  StorageClassAnalysisDataExport({
    @required this.outputSchemaVersion,
    @required this.destination,
  });
  static StorageClassAnalysisDataExport fromJson(Map<String, dynamic> json) =>
      StorageClassAnalysisDataExport(
        outputSchemaVersion: json['OutputSchemaVersion'] as String,
        destination: AnalyticsExportDestination.fromJson(json['Destination']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Tag {
  /// Name of the tag.
  final String key;

  /// Value of the tag.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Tagging {
  final List<Tag> tagSet;

  Tagging({
    @required this.tagSet,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TargetGrant {
  final Grantee grantee;

  /// Logging permissions assigned to the Grantee for the bucket.
  final String permission;

  TargetGrant({
    this.grantee,
    this.permission,
  });
  static TargetGrant fromJson(Map<String, dynamic> json) => TargetGrant(
        grantee: json.containsKey('Grantee')
            ? Grantee.fromJson(json['Grantee'])
            : null,
        permission: json.containsKey('Permission')
            ? json['Permission'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A container for specifying the configuration for publication of messages to
/// an Amazon Simple Notification Service (Amazon SNS) topic when Amazon S3
/// detects specified events.
class TopicConfiguration {
  final String id;

  /// The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3
  /// publishes a message when it detects events of the specified type.
  final String topicArn;

  /// The Amazon S3 bucket event about which to send notifications. For more
  /// information, see
  /// [Supported Event Types](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  final List<String> events;

  final NotificationConfigurationFilter filter;

  TopicConfiguration({
    this.id,
    @required this.topicArn,
    @required this.events,
    this.filter,
  });
  static TopicConfiguration fromJson(Map<String, dynamic> json) =>
      TopicConfiguration(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        topicArn: json['TopicArn'] as String,
        events: (json['Events'] as List).map((e) => e as String).toList(),
        filter: json.containsKey('Filter')
            ? NotificationConfigurationFilter.fromJson(json['Filter'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TopicConfigurationDeprecated {
  final String id;

  final List<String> events;

  /// Bucket event for which to send notifications.
  final String event;

  /// Amazon SNS topic to which Amazon S3 will publish a message to report the
  /// specified events for the bucket.
  final String topic;

  TopicConfigurationDeprecated({
    this.id,
    this.events,
    this.event,
    this.topic,
  });
  static TopicConfigurationDeprecated fromJson(Map<String, dynamic> json) =>
      TopicConfigurationDeprecated(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => e as String).toList()
            : null,
        event: json.containsKey('Event') ? json['Event'] as String : null,
        topic: json.containsKey('Topic') ? json['Topic'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies when an object transitions to a specified storage class.
class Transition {
  /// Indicates when objects are transitioned to the specified storage class.
  /// The date value must be in ISO 8601 format. The time is always midnight
  /// UTC.
  final DateTime date;

  /// Indicates the number of days after creation when objects are transitioned
  /// to the specified storage class. The value must be a positive integer.
  final int days;

  /// The storage class to which you want the object to transition.
  final String storageClass;

  Transition({
    this.date,
    this.days,
    this.storageClass,
  });
  static Transition fromJson(Map<String, dynamic> json) => Transition(
        date: json.containsKey('Date') ? DateTime.parse(json['Date']) : null,
        days: json.containsKey('Days') ? json['Days'] as int : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UploadPartCopyOutput {
  /// The version of the source object that was copied, if you have enabled
  /// versioning on the source bucket.
  final String copySourceVersionId;

  final CopyPartResult copyPartResult;

  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  final String requestCharged;

  UploadPartCopyOutput({
    this.copySourceVersionId,
    this.copyPartResult,
    this.serverSideEncryption,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.requestCharged,
  });
  static UploadPartCopyOutput fromJson(Map<String, dynamic> json) =>
      UploadPartCopyOutput(
        copySourceVersionId: json.containsKey('CopySourceVersionId')
            ? json['CopySourceVersionId'] as String
            : null,
        copyPartResult: json.containsKey('CopyPartResult')
            ? CopyPartResult.fromJson(json['CopyPartResult'])
            : null,
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

class UploadPartOutput {
  /// The Server-side encryption algorithm used when storing this object in S3
  /// (e.g., AES256, aws:kms).
  final String serverSideEncryption;

  /// Entity tag for the uploaded object.
  final String eTag;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header confirming the encryption
  /// algorithm used.
  final String sseCustomerAlgorithm;

  /// If server-side encryption with a customer-provided encryption key was
  /// requested, the response will include this header to provide round trip
  /// message integrity verification of the customer-provided encryption key.
  final String sseCustomerKeyMd5;

  /// If present, specifies the ID of the AWS Key Management Service (KMS)
  /// master encryption key that was used for the object.
  final String ssekmsKeyId;

  final String requestCharged;

  UploadPartOutput({
    this.serverSideEncryption,
    this.eTag,
    this.sseCustomerAlgorithm,
    this.sseCustomerKeyMd5,
    this.ssekmsKeyId,
    this.requestCharged,
  });
  static UploadPartOutput fromJson(Map<String, dynamic> json) =>
      UploadPartOutput(
        serverSideEncryption: json.containsKey('ServerSideEncryption')
            ? json['ServerSideEncryption'] as String
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        sseCustomerAlgorithm: json.containsKey('SSECustomerAlgorithm')
            ? json['SSECustomerAlgorithm'] as String
            : null,
        sseCustomerKeyMd5: json.containsKey('SSECustomerKeyMD5')
            ? json['SSECustomerKeyMD5'] as String
            : null,
        ssekmsKeyId: json.containsKey('SSEKMSKeyId')
            ? json['SSEKMSKeyId'] as String
            : null,
        requestCharged: json.containsKey('RequestCharged')
            ? json['RequestCharged'] as String
            : null,
      );
}

/// Describes the versioning state of an Amazon S3 bucket. For more information,
/// see
/// [PUT Bucket versioning](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTVersioningStatus.html)
/// in the _Amazon Simple Storage Service API Reference_.
class VersioningConfiguration {
  /// Specifies whether MFA delete is enabled in the bucket versioning
  /// configuration. This element is only returned if the bucket has been
  /// configured with MFA delete. If the bucket has never been so configured,
  /// this element is not returned.
  final String mfaDelete;

  /// The versioning state of the bucket.
  final String status;

  VersioningConfiguration({
    this.mfaDelete,
    this.status,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies website configuration parameters for an Amazon S3 bucket.
class WebsiteConfiguration {
  /// The name of the error document for the website.
  final ErrorDocument errorDocument;

  /// The name of the index document for the website.
  final IndexDocument indexDocument;

  /// The redirect behavior for every request to this bucket's website endpoint.
  ///
  ///
  ///
  /// If you specify this property, you can't specify any other property.
  final RedirectAllRequestsTo redirectAllRequestsTo;

  /// Rules that define when a redirect is applied and the redirect behavior.
  final List<RoutingRule> routingRules;

  WebsiteConfiguration({
    this.errorDocument,
    this.indexDocument,
    this.redirectAllRequestsTo,
    this.routingRules,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
