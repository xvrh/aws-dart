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
  Future<void> createCloudFrontOriginAccessIdentity20170325(
      CloudFrontOriginAccessIdentityConfig
          cloudFrontOriginAccessIdentityConfig) async {}

  /// Creates a new web distribution. Send a `POST` request to the `/_CloudFront
  /// API version_/distribution`/`distribution ID` resource.
  Future<void> createDistribution20170325(
      DistributionConfig distributionConfig) async {}

  /// Create a new distribution with tags.
  Future<void> createDistributionWithTags20170325(
      DistributionConfigWithTags distributionConfigWithTags) async {}

  /// Create a new invalidation.
  Future<void> createInvalidation20170325(
      {@required String distributionId,
      @required InvalidationBatch invalidationBatch}) async {}

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
  Future<void> createStreamingDistribution20170325(
      StreamingDistributionConfig streamingDistributionConfig) async {}

  /// Create a new streaming distribution with tags.
  Future<void> createStreamingDistributionWithTags20170325(
      StreamingDistributionConfigWithTags
          streamingDistributionConfigWithTags) async {}

  /// Delete an origin access identity.
  Future<void> deleteCloudFrontOriginAccessIdentity20170325(String id,
      {String ifMatch}) async {}

  /// Delete a distribution.
  Future<void> deleteDistribution20170325(String id, {String ifMatch}) async {}

  Future<void> deleteServiceLinkedRole20170325(String roleName) async {}

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
  Future<void> deleteStreamingDistribution20170325(String id,
      {String ifMatch}) async {}

  /// Get the information about an origin access identity.
  Future<void> getCloudFrontOriginAccessIdentity20170325(String id) async {}

  /// Get the configuration information about an origin access identity.
  Future<void> getCloudFrontOriginAccessIdentityConfig20170325(
      String id) async {}

  /// Get the information about a distribution.
  Future<void> getDistribution20170325(String id) async {}

  /// Get the configuration information about a distribution.
  Future<void> getDistributionConfig20170325(String id) async {}

  /// Get the information about an invalidation.
  Future<void> getInvalidation20170325(
      {@required String distributionId, @required String id}) async {}

  /// Gets information about a specified RTMP distribution, including the
  /// distribution configuration.
  Future<void> getStreamingDistribution20170325(String id) async {}

  /// Get the configuration information about a streaming distribution.
  Future<void> getStreamingDistributionConfig20170325(String id) async {}

  /// Lists origin access identities.
  Future<void> listCloudFrontOriginAccessIdentities20170325(
      {String marker, String maxItems}) async {}

  /// List distributions.
  Future<void> listDistributions20170325(
      {String marker, String maxItems}) async {}

  /// List the distributions that are associated with a specified AWS WAF web
  /// ACL.
  Future<void> listDistributionsByWebAclId20170325(String webAclId,
      {String marker, String maxItems}) async {}

  /// Lists invalidation batches.
  Future<void> listInvalidations20170325(String distributionId,
      {String marker, String maxItems}) async {}

  /// List streaming distributions.
  Future<void> listStreamingDistributions20170325(
      {String marker, String maxItems}) async {}

  /// List tags for a CloudFront resource.
  Future<void> listTagsForResource20170325(String resource) async {}

  /// Add tags to a CloudFront resource.
  Future<void> tagResource20170325(
      {@required String resource, @required Tags tags}) async {}

  /// Remove tags from a CloudFront resource.
  Future<void> untagResource20170325(
      {@required String resource, @required TagKeys tagKeys}) async {}

  /// Update an origin access identity.
  Future<void> updateCloudFrontOriginAccessIdentity20170325(
      {@required
          CloudFrontOriginAccessIdentityConfig
              cloudFrontOriginAccessIdentityConfig,
      @required
          String id,
      String ifMatch}) async {}

  /// Updates the configuration for a web distribution. Perform the following
  /// steps.
  ///
  /// For information about updating a distribution using the CloudFront
  /// console, see [Creating or Updating a Web Distribution Using the CloudFront
  /// Console](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html)
  ///  in the _Amazon CloudFront Developer Guide_.
  ///
  ///  **To update a web distribution using the CloudFront API**
  ///
  /// 1.  Submit a GetDistributionConfig request to get the current
  /// configuration and an `Etag` header for the distribution.
  ///
  ///      If you update the distribution again, you need to get a new `Etag`
  /// header.
  /// 2.  Update the XML document that was returned in the response to your
  /// `GetDistributionConfig` request to include the desired changes. You can't
  /// change the value of `CallerReference`. If you try to change this value,
  /// CloudFront returns an `IllegalUpdate` error.
  ///
  ///      The new configuration replaces the existing configuration; the values
  /// that you specify in an `UpdateDistribution` request are not merged into
  /// the existing configuration. When you add, delete, or replace values in an
  /// element that allows multiple values (for example, `CNAME`), you must
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
  ///
  ///      Beginning with the 2012-05-05 version of the CloudFront API, we made
  /// substantial changes to the format of the XML document that you include in
  /// the request body when you create or update a distribution. With previous
  /// versions of the API, we discovered that it was too easy to accidentally
  /// delete one or more values for an element that accepts multiple values, for
  /// example, CNAMEs and trusted signers. Our changes for the 2012-05-05
  /// release are intended to prevent these accidental deletions and to notify
  /// you when there's a mismatch between the number of values you say you're
  /// specifying in the `Quantity` element and the number of values you're
  /// actually specifying.
  Future<void> updateDistribution20170325(
      {@required DistributionConfig distributionConfig,
      @required String id,
      String ifMatch}) async {}

  /// Update a streaming distribution.
  Future<void> updateStreamingDistribution20170325(
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

class CookieNames {}

class CookiePreference {}

class CreateCloudFrontOriginAccessIdentityResult {}

class CreateDistributionResult {}

class CreateDistributionWithTagsResult {}

class CreateInvalidationResult {}

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

class ForwardedValues {}

class GeoRestriction {}

class GetCloudFrontOriginAccessIdentityConfigResult {}

class GetCloudFrontOriginAccessIdentityResult {}

class GetDistributionConfigResult {}

class GetDistributionResult {}

class GetInvalidationResult {}

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

class ListInvalidationsResult {}

class ListStreamingDistributionsResult {}

class ListTagsForResourceResult {}

class LoggingConfig {}

class Origin {}

class OriginCustomHeader {}

class OriginSslProtocols {}

class Origins {}

class Paths {}

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

class UpdateStreamingDistributionResult {}

class ViewerCertificate {}
