import 'package:meta/meta.dart';

/// Amazon CloudFront
///
/// This is the _Amazon CloudFront API Reference_. This guide is for developers
/// who need detailed information about CloudFront API actions, data types, and
/// errors. For detailed information about CloudFront features, see the _Amazon
/// CloudFront Developer Guide_.
class CloudFrontApi {
  /// Creates a new origin access identity. If you're using Amazon S3 for your
  /// origin, you can use an origin access identity to require users to access
  /// your content using a CloudFront URL instead of the Amazon S3 URL. For more
  /// information about how to use origin access identities, see [Serving
  /// Private Content through
  /// CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon CloudFront Developer Guide_.
  Future<void> createCloudFrontOriginAccessIdentity20180618(
      CloudFrontOriginAccessIdentityConfig
          cloudFrontOriginAccessIdentityConfig) async {}

  /// Creates a new web distribution. You create a CloudFront distribution to
  /// tell CloudFront where you want content to be delivered from, and the
  /// details about how to track and manage content delivery. Send a `POST`
  /// request to the `/_CloudFront API version_/distribution`/`distribution ID`
  /// resource.
  ///
  ///  When you update a distribution, there are more required fields than when
  /// you create a distribution. When you update your distribution by using
  /// UpdateDistribution, follow the steps included in the documentation to get
  /// the current configuration and then make your updates. This helps to make
  /// sure that you include all of the required fields. To view a summary, see
  /// [Required Fields for Create Distribution and Update
  /// Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  /// If you are using Adobe Flash Media Server's RTMP protocol, you set up a
  /// different kind of CloudFront distribution. For more information, see
  /// CreateStreamingDistribution.
  Future<void> createDistribution20180618(
      DistributionConfig distributionConfig) async {}

  /// Create a new distribution with tags.
  Future<void> createDistributionWithTags20180618(
      DistributionConfigWithTags distributionConfigWithTags) async {}

  /// Create a new field-level encryption configuration.
  Future<void> createFieldLevelEncryptionConfig20180618(
      FieldLevelEncryptionConfig fieldLevelEncryptionConfig) async {}

  /// Create a field-level encryption profile.
  Future<void> createFieldLevelEncryptionProfile20180618(
      FieldLevelEncryptionProfileConfig
          fieldLevelEncryptionProfileConfig) async {}

  /// Create a new invalidation.
  Future<void> createInvalidation20180618(
      {@required String distributionId,
      @required InvalidationBatch invalidationBatch}) async {}

  /// Add a new public key to CloudFront to use, for example, for field-level
  /// encryption. You can add a maximum of 10 public keys with one AWS account.
  Future<void> createPublicKey20180618(PublicKeyConfig publicKeyConfig) async {}

  /// Creates a new RMTP distribution. An RTMP distribution is similar to a web
  /// distribution, but an RTMP distribution streams media files using the Adobe
  /// Real-Time Messaging Protocol (RTMP) instead of serving files using HTTP.
  ///
  /// To create a new web distribution, submit a `POST` request to the
  /// _CloudFront API version_/distribution resource. The request body must
  /// include a document with a _StreamingDistributionConfig_ element. The
  /// response echoes the `StreamingDistributionConfig` element and returns
  /// other information about the RTMP distribution.
  ///
  /// To get the status of your request, use the _GET StreamingDistribution_ API
  /// action. When the value of `Enabled` is `true` and the value of `Status` is
  /// `Deployed`, your distribution is ready. A distribution usually deploys in
  /// less than 15 minutes.
  ///
  /// For more information about web distributions, see [Working with RTMP
  /// Distributions](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  ///
  ///
  /// Beginning with the 2012-05-05 version of the CloudFront API, we made
  /// substantial changes to the format of the XML document that you include in
  /// the request body when you create or update a web distribution or an RTMP
  /// distribution, and when you invalidate objects. With previous versions of
  /// the API, we discovered that it was too easy to accidentally delete one or
  /// more values for an element that accepts multiple values, for example,
  /// CNAMEs and trusted signers. Our changes for the 2012-05-05 release are
  /// intended to prevent these accidental deletions and to notify you when
  /// there's a mismatch between the number of values you say you're specifying
  /// in the `Quantity` element and the number of values specified.
  Future<void> createStreamingDistribution20180618(
      StreamingDistributionConfig streamingDistributionConfig) async {}

  /// Create a new streaming distribution with tags.
  Future<void> createStreamingDistributionWithTags20180618(
      StreamingDistributionConfigWithTags
          streamingDistributionConfigWithTags) async {}

  /// Delete an origin access identity.
  Future<void> deleteCloudFrontOriginAccessIdentity20180618(String id,
      {String ifMatch}) async {}

  /// Delete a distribution.
  Future<void> deleteDistribution20180618(String id, {String ifMatch}) async {}

  /// Remove a field-level encryption configuration.
  Future<void> deleteFieldLevelEncryptionConfig20180618(String id,
      {String ifMatch}) async {}

  /// Remove a field-level encryption profile.
  Future<void> deleteFieldLevelEncryptionProfile20180618(String id,
      {String ifMatch}) async {}

  /// Remove a public key you previously added to CloudFront.
  Future<void> deletePublicKey20180618(String id, {String ifMatch}) async {}

  /// Delete a streaming distribution. To delete an RTMP distribution using the
  /// CloudFront API, perform the following steps.
  ///
  ///  **To delete an RTMP distribution using the CloudFront API**:
  ///
  /// 1.  Disable the RTMP distribution.
  ///
  /// 2.  Submit a `GET Streaming Distribution Config` request to get the
  /// current configuration and the `Etag` header for the distribution.
  ///
  /// 3.  Update the XML document that was returned in the response to your `GET
  /// Streaming Distribution Config` request to change the value of `Enabled` to
  /// `false`.
  ///
  /// 4.  Submit a `PUT Streaming Distribution Config` request to update the
  /// configuration for your distribution. In the request body, include the XML
  /// document that you updated in Step 3. Then set the value of the HTTP
  /// `If-Match` header to the value of the `ETag` header that CloudFront
  /// returned when you submitted the `GET Streaming Distribution Config`
  /// request in Step 2.
  ///
  /// 5.  Review the response to the `PUT Streaming Distribution Config` request
  /// to confirm that the distribution was successfully disabled.
  ///
  /// 6.  Submit a `GET Streaming Distribution Config` request to confirm that
  /// your changes have propagated. When propagation is complete, the value of
  /// `Status` is `Deployed`.
  ///
  /// 7.  Submit a `DELETE Streaming Distribution` request. Set the value of the
  /// HTTP `If-Match` header to the value of the `ETag` header that CloudFront
  /// returned when you submitted the `GET Streaming Distribution Config`
  /// request in Step 2.
  ///
  /// 8.  Review the response to your `DELETE Streaming Distribution` request to
  /// confirm that the distribution was successfully deleted.
  ///
  ///
  /// For information about deleting a distribution using the CloudFront
  /// console, see [Deleting a
  /// Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html)
  /// in the _Amazon CloudFront Developer Guide_.
  Future<void> deleteStreamingDistribution20180618(String id,
      {String ifMatch}) async {}

  /// Get the information about an origin access identity.
  Future<void> getCloudFrontOriginAccessIdentity20180618(String id) async {}

  /// Get the configuration information about an origin access identity.
  Future<void> getCloudFrontOriginAccessIdentityConfig20180618(
      String id) async {}

  /// Get the information about a distribution.
  Future<void> getDistribution20180618(String id) async {}

  /// Get the configuration information about a distribution.
  Future<void> getDistributionConfig20180618(String id) async {}

  /// Get the field-level encryption configuration information.
  Future<void> getFieldLevelEncryption20180618(String id) async {}

  /// Get the field-level encryption configuration information.
  Future<void> getFieldLevelEncryptionConfig20180618(String id) async {}

  /// Get the field-level encryption profile information.
  Future<void> getFieldLevelEncryptionProfile20180618(String id) async {}

  /// Get the field-level encryption profile configuration information.
  Future<void> getFieldLevelEncryptionProfileConfig20180618(String id) async {}

  /// Get the information about an invalidation.
  Future<void> getInvalidation20180618(
      {@required String distributionId, @required String id}) async {}

  /// Get the public key information.
  Future<void> getPublicKey20180618(String id) async {}

  /// Return public key configuration informaation
  Future<void> getPublicKeyConfig20180618(String id) async {}

  /// Gets information about a specified RTMP distribution, including the
  /// distribution configuration.
  Future<void> getStreamingDistribution20180618(String id) async {}

  /// Get the configuration information about a streaming distribution.
  Future<void> getStreamingDistributionConfig20180618(String id) async {}

  /// Lists origin access identities.
  Future<void> listCloudFrontOriginAccessIdentities20180618(
      {String marker, String maxItems}) async {}

  /// List distributions.
  Future<void> listDistributions20180618(
      {String marker, String maxItems}) async {}

  /// List the distributions that are associated with a specified AWS WAF web
  /// ACL.
  Future<void> listDistributionsByWebAclId20180618(String webAclId,
      {String marker, String maxItems}) async {}

  /// List all field-level encryption configurations that have been created in
  /// CloudFront for this account.
  Future<void> listFieldLevelEncryptionConfigs20180618(
      {String marker, String maxItems}) async {}

  /// Request a list of field-level encryption profiles that have been created
  /// in CloudFront for this account.
  Future<void> listFieldLevelEncryptionProfiles20180618(
      {String marker, String maxItems}) async {}

  /// Lists invalidation batches.
  Future<void> listInvalidations20180618(String distributionId,
      {String marker, String maxItems}) async {}

  /// List all public keys that have been added to CloudFront for this account.
  Future<void> listPublicKeys20180618({String marker, String maxItems}) async {}

  /// List streaming distributions.
  Future<void> listStreamingDistributions20180618(
      {String marker, String maxItems}) async {}

  /// List tags for a CloudFront resource.
  Future<void> listTagsForResource20180618(String resource) async {}

  /// Add tags to a CloudFront resource.
  Future<void> tagResource20180618(
      {@required String resource, @required Tags tags}) async {}

  /// Remove tags from a CloudFront resource.
  Future<void> untagResource20180618(
      {@required String resource, @required TagKeys tagKeys}) async {}

  /// Update an origin access identity.
  Future<void> updateCloudFrontOriginAccessIdentity20180618(
      {@required
          CloudFrontOriginAccessIdentityConfig
              cloudFrontOriginAccessIdentityConfig,
      @required
          String id,
      String ifMatch}) async {}

  /// Updates the configuration for a web distribution.
  ///
  ///  When you update a distribution, there are more required fields than when
  /// you create a distribution. When you update your distribution by using this
  /// API action, follow the steps here to get the current configuration and
  /// then make your updates, to make sure that you include all of the required
  /// fields. To view a summary, see [Required Fields for Create Distribution
  /// and Update
  /// Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  /// The update process includes getting the current distribution
  /// configuration, updating the XML document that is returned to make your
  /// changes, and then submitting an `UpdateDistribution` request to make the
  /// updates.
  ///
  /// For information about updating a distribution using the CloudFront console
  /// instead, see [Creating a
  /// Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  ///  **To update a web distribution using the CloudFront API**
  ///
  /// 1.  Submit a GetDistributionConfig request to get the current
  /// configuration and an `Etag` header for the distribution.
  ///
  ///      If you update the distribution again, you must get a new `Etag`
  /// header.
  /// 2.  Update the XML document that was returned in the response to your
  /// `GetDistributionConfig` request to include your changes.
  ///
  ///      When you edit the XML file, be aware of the following:
  ///
  ///     *   You must strip out the ETag parameter that is returned.
  ///
  ///     *   Additional fields are required when you update a distribution.
  /// There may be fields included in the XML file for features that you haven't
  /// configured for your distribution. This is expected and required to
  /// successfully update the distribution.
  ///
  ///     *   You can't change the value of `CallerReference`. If you try to
  /// change this value, CloudFront returns an `IllegalUpdate` error.
  ///
  ///     *   The new configuration replaces the existing configuration; the
  /// values that you specify in an `UpdateDistribution` request are not merged
  /// into your existing configuration. When you add, delete, or replace values
  /// in an element that allows multiple values (for example, `CNAME`), you must
  /// specify all of the values that you want to appear in the updated
  /// distribution. In addition, you must update the corresponding `Quantity`
  /// element.
  /// 3.  Submit an `UpdateDistribution` request to update the configuration for
  /// your distribution:
  ///
  ///     *   In the request body, include the XML document that you updated in
  /// Step 2. The request body must include an XML document with a
  /// `DistributionConfig` element.
  ///
  ///     *   Set the value of the HTTP `If-Match` header to the value of the
  /// `ETag` header that CloudFront returned when you submitted the
  /// `GetDistributionConfig` request in Step 1.
  ///
  ///
  /// 4.  Review the response to the `UpdateDistribution` request to confirm
  /// that the configuration was successfully updated.
  ///
  /// 5.  Optional: Submit a GetDistribution request to confirm that your
  /// changes have propagated. When propagation is complete, the value of
  /// `Status` is `Deployed`.
  Future<void> updateDistribution20180618(
      {@required DistributionConfig distributionConfig,
      @required String id,
      String ifMatch}) async {}

  /// Update a field-level encryption configuration.
  Future<void> updateFieldLevelEncryptionConfig20180618(
      {@required FieldLevelEncryptionConfig fieldLevelEncryptionConfig,
      @required String id,
      String ifMatch}) async {}

  /// Update a field-level encryption profile.
  Future<void> updateFieldLevelEncryptionProfile20180618(
      {@required
          FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig,
      @required
          String id,
      String ifMatch}) async {}

  /// Update public key information. Note that the only value you can change is
  /// the comment.
  Future<void> updatePublicKey20180618(
      {@required PublicKeyConfig publicKeyConfig,
      @required String id,
      String ifMatch}) async {}

  /// Update a streaming distribution.
  Future<void> updateStreamingDistribution20180618(
      {@required StreamingDistributionConfig streamingDistributionConfig,
      @required String id,
      String ifMatch}) async {}
}

class ActiveTrustedSigners {}

class Aliases {}

class AllowedMethods {}

class CacheBehavior {}

class CacheBehaviors {}

class CachedMethods {}

class CloudFrontOriginAccessIdentity {}

class CloudFrontOriginAccessIdentityConfig {}

class CloudFrontOriginAccessIdentityList {}

class CloudFrontOriginAccessIdentitySummary {}

class ContentTypeProfile {}

class ContentTypeProfileConfig {}

class ContentTypeProfiles {}

class CookieNames {}

class CookiePreference {}

class CreateCloudFrontOriginAccessIdentityResult {}

class CreateDistributionResult {}

class CreateDistributionWithTagsResult {}

class CreateFieldLevelEncryptionConfigResult {}

class CreateFieldLevelEncryptionProfileResult {}

class CreateInvalidationResult {}

class CreatePublicKeyResult {}

class CreateStreamingDistributionResult {}

class CreateStreamingDistributionWithTagsResult {}

class CustomErrorResponse {}

class CustomErrorResponses {}

class CustomHeaders {}

class CustomOriginConfig {}

class DefaultCacheBehavior {}

class Distribution {}

class DistributionConfig {}

class DistributionConfigWithTags {}

class DistributionList {}

class DistributionSummary {}

class EncryptionEntities {}

class EncryptionEntity {}

class FieldLevelEncryption {}

class FieldLevelEncryptionConfig {}

class FieldLevelEncryptionList {}

class FieldLevelEncryptionProfile {}

class FieldLevelEncryptionProfileConfig {}

class FieldLevelEncryptionProfileList {}

class FieldLevelEncryptionProfileSummary {}

class FieldLevelEncryptionSummary {}

class FieldPatterns {}

class ForwardedValues {}

class GeoRestriction {}

class GetCloudFrontOriginAccessIdentityConfigResult {}

class GetCloudFrontOriginAccessIdentityResult {}

class GetDistributionConfigResult {}

class GetDistributionResult {}

class GetFieldLevelEncryptionConfigResult {}

class GetFieldLevelEncryptionProfileConfigResult {}

class GetFieldLevelEncryptionProfileResult {}

class GetFieldLevelEncryptionResult {}

class GetInvalidationResult {}

class GetPublicKeyConfigResult {}

class GetPublicKeyResult {}

class GetStreamingDistributionConfigResult {}

class GetStreamingDistributionResult {}

class Headers {}

class Invalidation {}

class InvalidationBatch {}

class InvalidationList {}

class InvalidationSummary {}

class KeyPairIds {}

class LambdaFunctionAssociation {}

class LambdaFunctionAssociations {}

class ListCloudFrontOriginAccessIdentitiesResult {}

class ListDistributionsByWebAclIdResult {}

class ListDistributionsResult {}

class ListFieldLevelEncryptionConfigsResult {}

class ListFieldLevelEncryptionProfilesResult {}

class ListInvalidationsResult {}

class ListPublicKeysResult {}

class ListStreamingDistributionsResult {}

class ListTagsForResourceResult {}

class LoggingConfig {}

class Origin {}

class OriginCustomHeader {}

class OriginSslProtocols {}

class Origins {}

class Paths {}

class PublicKey {}

class PublicKeyConfig {}

class PublicKeyList {}

class PublicKeySummary {}

class QueryArgProfile {}

class QueryArgProfileConfig {}

class QueryArgProfiles {}

class QueryStringCacheKeys {}

class Restrictions {}

class S3Origin {}

class S3OriginConfig {}

class Signer {}

class StreamingDistribution {}

class StreamingDistributionConfig {}

class StreamingDistributionConfigWithTags {}

class StreamingDistributionList {}

class StreamingDistributionSummary {}

class StreamingLoggingConfig {}

class Tag {}

class TagKeys {}

class Tags {}

class TrustedSigners {}

class UpdateCloudFrontOriginAccessIdentityResult {}

class UpdateDistributionResult {}

class UpdateFieldLevelEncryptionConfigResult {}

class UpdateFieldLevelEncryptionProfileResult {}

class UpdatePublicKeyResult {}

class UpdateStreamingDistributionResult {}

class ViewerCertificate {}
