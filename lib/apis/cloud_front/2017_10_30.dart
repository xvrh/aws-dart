import 'package:meta/meta.dart';

/// Amazon CloudFront
///
/// This is the _Amazon CloudFront API Reference_. This guide is for developers
/// who need detailed information about CloudFront API actions, data types, and
/// errors. For detailed information about CloudFront features, see the _Amazon
/// CloudFront Developer Guide_.
class CloudFrontApi {
  final _client;
  CloudFrontApi(client)
      : _client = client.configured('CloudFront', serializer: 'rest-xml');

  /// Creates a new origin access identity. If you're using Amazon S3 for your
  /// origin, you can use an origin access identity to require users to access
  /// your content using a CloudFront URL instead of the Amazon S3 URL. For more
  /// information about how to use origin access identities, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  /// [cloudFrontOriginAccessIdentityConfig]: The current configuration
  /// information for the identity.
  Future<CreateCloudFrontOriginAccessIdentityResult>
      createCloudFrontOriginAccessIdentity20171030(
          CloudFrontOriginAccessIdentityConfig
              cloudFrontOriginAccessIdentityConfig) async {
    var response_ =
        await _client.send('CreateCloudFrontOriginAccessIdentity2017_10_30', {
      'CloudFrontOriginAccessIdentityConfig':
          cloudFrontOriginAccessIdentityConfig,
    });
    return CreateCloudFrontOriginAccessIdentityResult.fromJson(response_);
  }

  /// Creates a new web distribution. Send a `POST` request to the `/_CloudFront
  /// API version_/distribution`/`distribution ID` resource.
  ///
  /// [distributionConfig]: The distribution's configuration information.
  Future<CreateDistributionResult> createDistribution20171030(
      DistributionConfig distributionConfig) async {
    var response_ = await _client.send('CreateDistribution2017_10_30', {
      'DistributionConfig': distributionConfig,
    });
    return CreateDistributionResult.fromJson(response_);
  }

  /// Create a new distribution with tags.
  ///
  /// [distributionConfigWithTags]: The distribution's configuration
  /// information.
  Future<CreateDistributionWithTagsResult> createDistributionWithTags20171030(
      DistributionConfigWithTags distributionConfigWithTags) async {
    var response_ = await _client.send('CreateDistributionWithTags2017_10_30', {
      'DistributionConfigWithTags': distributionConfigWithTags,
    });
    return CreateDistributionWithTagsResult.fromJson(response_);
  }

  /// Create a new field-level encryption configuration.
  ///
  /// [fieldLevelEncryptionConfig]: The request to create a new field-level
  /// encryption configuration.
  Future<CreateFieldLevelEncryptionConfigResult>
      createFieldLevelEncryptionConfig20171030(
          FieldLevelEncryptionConfig fieldLevelEncryptionConfig) async {
    var response_ =
        await _client.send('CreateFieldLevelEncryptionConfig2017_10_30', {
      'FieldLevelEncryptionConfig': fieldLevelEncryptionConfig,
    });
    return CreateFieldLevelEncryptionConfigResult.fromJson(response_);
  }

  /// Create a field-level encryption profile.
  ///
  /// [fieldLevelEncryptionProfileConfig]: The request to create a field-level
  /// encryption profile.
  Future<CreateFieldLevelEncryptionProfileResult>
      createFieldLevelEncryptionProfile20171030(
          FieldLevelEncryptionProfileConfig
              fieldLevelEncryptionProfileConfig) async {
    var response_ =
        await _client.send('CreateFieldLevelEncryptionProfile2017_10_30', {
      'FieldLevelEncryptionProfileConfig': fieldLevelEncryptionProfileConfig,
    });
    return CreateFieldLevelEncryptionProfileResult.fromJson(response_);
  }

  /// Create a new invalidation.
  ///
  /// [distributionId]: The distribution's id.
  ///
  /// [invalidationBatch]: The batch information for the invalidation.
  Future<CreateInvalidationResult> createInvalidation20171030(
      {@required String distributionId,
      @required InvalidationBatch invalidationBatch}) async {
    var response_ = await _client.send('CreateInvalidation2017_10_30', {
      'DistributionId': distributionId,
      'InvalidationBatch': invalidationBatch,
    });
    return CreateInvalidationResult.fromJson(response_);
  }

  /// Add a new public key to CloudFront to use, for example, for field-level
  /// encryption. You can add a maximum of 10 public keys with one AWS account.
  ///
  /// [publicKeyConfig]: The request to add a public key to CloudFront.
  Future<CreatePublicKeyResult> createPublicKey20171030(
      PublicKeyConfig publicKeyConfig) async {
    var response_ = await _client.send('CreatePublicKey2017_10_30', {
      'PublicKeyConfig': publicKeyConfig,
    });
    return CreatePublicKeyResult.fromJson(response_);
  }

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
  /// For more information about web distributions, see
  /// [Working with RTMP Distributions](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html)
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
  ///
  /// [streamingDistributionConfig]: The streaming distribution's configuration
  /// information.
  Future<CreateStreamingDistributionResult> createStreamingDistribution20171030(
      StreamingDistributionConfig streamingDistributionConfig) async {
    var response_ =
        await _client.send('CreateStreamingDistribution2017_10_30', {
      'StreamingDistributionConfig': streamingDistributionConfig,
    });
    return CreateStreamingDistributionResult.fromJson(response_);
  }

  /// Create a new streaming distribution with tags.
  ///
  /// [streamingDistributionConfigWithTags]:  The streaming distribution's
  /// configuration information.
  Future<CreateStreamingDistributionWithTagsResult>
      createStreamingDistributionWithTags20171030(
          StreamingDistributionConfigWithTags
              streamingDistributionConfigWithTags) async {
    var response_ =
        await _client.send('CreateStreamingDistributionWithTags2017_10_30', {
      'StreamingDistributionConfigWithTags':
          streamingDistributionConfigWithTags,
    });
    return CreateStreamingDistributionWithTagsResult.fromJson(response_);
  }

  /// Delete an origin access identity.
  ///
  /// [id]: The origin access identity's ID.
  ///
  /// [ifMatch]: The value of the `ETag` header you received from a previous
  /// `GET` or `PUT` request. For example: `E2QWRUHAPOMQZL`.
  Future<void> deleteCloudFrontOriginAccessIdentity20171030(String id,
      {String ifMatch}) async {
    await _client.send('DeleteCloudFrontOriginAccessIdentity2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

  /// Delete a distribution.
  ///
  /// [id]: The distribution ID.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when you
  /// disabled the distribution. For example: `E2QWRUHAPOMQZL`.
  Future<void> deleteDistribution20171030(String id, {String ifMatch}) async {
    await _client.send('DeleteDistribution2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

  /// Remove a field-level encryption configuration.
  ///
  /// [id]: The ID of the configuration you want to delete from CloudFront.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the configuration identity to delete. For example:
  /// `E2QWRUHAPOMQZL`.
  Future<void> deleteFieldLevelEncryptionConfig20171030(String id,
      {String ifMatch}) async {
    await _client.send('DeleteFieldLevelEncryptionConfig2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

  /// Remove a field-level encryption profile.
  ///
  /// [id]: Request the ID of the profile you want to delete from CloudFront.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the profile to delete. For example: `E2QWRUHAPOMQZL`.
  Future<void> deleteFieldLevelEncryptionProfile20171030(String id,
      {String ifMatch}) async {
    await _client.send('DeleteFieldLevelEncryptionProfile2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

  /// Remove a public key you previously added to CloudFront.
  ///
  /// [id]: The ID of the public key you want to remove from CloudFront.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the public key identity to delete. For example:
  /// `E2QWRUHAPOMQZL`.
  Future<void> deletePublicKey20171030(String id, {String ifMatch}) async {
    await _client.send('DeletePublicKey2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

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
  /// console, see
  /// [Deleting a Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  /// [id]: The distribution ID.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when you
  /// disabled the streaming distribution. For example: `E2QWRUHAPOMQZL`.
  Future<void> deleteStreamingDistribution20171030(String id,
      {String ifMatch}) async {
    await _client.send('DeleteStreamingDistribution2017_10_30', {
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
  }

  /// Get the information about an origin access identity.
  ///
  /// [id]: The identity's ID.
  Future<GetCloudFrontOriginAccessIdentityResult>
      getCloudFrontOriginAccessIdentity20171030(String id) async {
    var response_ =
        await _client.send('GetCloudFrontOriginAccessIdentity2017_10_30', {
      'Id': id,
    });
    return GetCloudFrontOriginAccessIdentityResult.fromJson(response_);
  }

  /// Get the configuration information about an origin access identity.
  ///
  /// [id]: The identity's ID.
  Future<GetCloudFrontOriginAccessIdentityConfigResult>
      getCloudFrontOriginAccessIdentityConfig20171030(String id) async {
    var response_ = await _client
        .send('GetCloudFrontOriginAccessIdentityConfig2017_10_30', {
      'Id': id,
    });
    return GetCloudFrontOriginAccessIdentityConfigResult.fromJson(response_);
  }

  /// Get the information about a distribution.
  ///
  /// [id]: The distribution's ID.
  Future<GetDistributionResult> getDistribution20171030(String id) async {
    var response_ = await _client.send('GetDistribution2017_10_30', {
      'Id': id,
    });
    return GetDistributionResult.fromJson(response_);
  }

  /// Get the configuration information about a distribution.
  ///
  /// [id]: The distribution's ID.
  Future<GetDistributionConfigResult> getDistributionConfig20171030(
      String id) async {
    var response_ = await _client.send('GetDistributionConfig2017_10_30', {
      'Id': id,
    });
    return GetDistributionConfigResult.fromJson(response_);
  }

  /// Get the field-level encryption configuration information.
  ///
  /// [id]: Request the ID for the field-level encryption configuration
  /// information.
  Future<GetFieldLevelEncryptionResult> getFieldLevelEncryption20171030(
      String id) async {
    var response_ = await _client.send('GetFieldLevelEncryption2017_10_30', {
      'Id': id,
    });
    return GetFieldLevelEncryptionResult.fromJson(response_);
  }

  /// Get the field-level encryption configuration information.
  ///
  /// [id]: Request the ID for the field-level encryption configuration
  /// information.
  Future<GetFieldLevelEncryptionConfigResult>
      getFieldLevelEncryptionConfig20171030(String id) async {
    var response_ =
        await _client.send('GetFieldLevelEncryptionConfig2017_10_30', {
      'Id': id,
    });
    return GetFieldLevelEncryptionConfigResult.fromJson(response_);
  }

  /// Get the field-level encryption profile information.
  ///
  /// [id]: Get the ID for the field-level encryption profile information.
  Future<GetFieldLevelEncryptionProfileResult>
      getFieldLevelEncryptionProfile20171030(String id) async {
    var response_ =
        await _client.send('GetFieldLevelEncryptionProfile2017_10_30', {
      'Id': id,
    });
    return GetFieldLevelEncryptionProfileResult.fromJson(response_);
  }

  /// Get the field-level encryption profile configuration information.
  ///
  /// [id]: Get the ID for the field-level encryption profile configuration
  /// information.
  Future<GetFieldLevelEncryptionProfileConfigResult>
      getFieldLevelEncryptionProfileConfig20171030(String id) async {
    var response_ =
        await _client.send('GetFieldLevelEncryptionProfileConfig2017_10_30', {
      'Id': id,
    });
    return GetFieldLevelEncryptionProfileConfigResult.fromJson(response_);
  }

  /// Get the information about an invalidation.
  ///
  /// [distributionId]: The distribution's ID.
  ///
  /// [id]: The identifier for the invalidation request, for example,
  /// `IDFDVBD632BHDS5`.
  Future<GetInvalidationResult> getInvalidation20171030(
      {@required String distributionId, @required String id}) async {
    var response_ = await _client.send('GetInvalidation2017_10_30', {
      'DistributionId': distributionId,
      'Id': id,
    });
    return GetInvalidationResult.fromJson(response_);
  }

  /// Get the public key information.
  ///
  /// [id]: Request the ID for the public key.
  Future<GetPublicKeyResult> getPublicKey20171030(String id) async {
    var response_ = await _client.send('GetPublicKey2017_10_30', {
      'Id': id,
    });
    return GetPublicKeyResult.fromJson(response_);
  }

  /// Return public key configuration informaation
  ///
  /// [id]: Request the ID for the public key configuration.
  Future<GetPublicKeyConfigResult> getPublicKeyConfig20171030(String id) async {
    var response_ = await _client.send('GetPublicKeyConfig2017_10_30', {
      'Id': id,
    });
    return GetPublicKeyConfigResult.fromJson(response_);
  }

  /// Gets information about a specified RTMP distribution, including the
  /// distribution configuration.
  ///
  /// [id]: The streaming distribution's ID.
  Future<GetStreamingDistributionResult> getStreamingDistribution20171030(
      String id) async {
    var response_ = await _client.send('GetStreamingDistribution2017_10_30', {
      'Id': id,
    });
    return GetStreamingDistributionResult.fromJson(response_);
  }

  /// Get the configuration information about a streaming distribution.
  ///
  /// [id]: The streaming distribution's ID.
  Future<GetStreamingDistributionConfigResult>
      getStreamingDistributionConfig20171030(String id) async {
    var response_ =
        await _client.send('GetStreamingDistributionConfig2017_10_30', {
      'Id': id,
    });
    return GetStreamingDistributionConfigResult.fromJson(response_);
  }

  /// Lists origin access identities.
  ///
  /// [marker]: Use this when paginating results to indicate where to begin in
  /// your list of origin access identities. The results include identities in
  /// the list that occur after the marker. To get the next page of results, set
  /// the `Marker` to the value of the `NextMarker` from the current page's
  /// response (which is also the ID of the last identity on that page).
  ///
  /// [maxItems]: The maximum number of origin access identities you want in the
  /// response body.
  Future<ListCloudFrontOriginAccessIdentitiesResult>
      listCloudFrontOriginAccessIdentities20171030(
          {String marker, String maxItems}) async {
    var response_ =
        await _client.send('ListCloudFrontOriginAccessIdentities2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListCloudFrontOriginAccessIdentitiesResult.fromJson(response_);
  }

  /// List distributions.
  ///
  /// [marker]: Use this when paginating results to indicate where to begin in
  /// your list of distributions. The results include distributions in the list
  /// that occur after the marker. To get the next page of results, set the
  /// `Marker` to the value of the `NextMarker` from the current page's response
  /// (which is also the ID of the last distribution on that page).
  ///
  /// [maxItems]: The maximum number of distributions you want in the response
  /// body.
  Future<ListDistributionsResult> listDistributions20171030(
      {String marker, String maxItems}) async {
    var response_ = await _client.send('ListDistributions2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListDistributionsResult.fromJson(response_);
  }

  /// List the distributions that are associated with a specified AWS WAF web
  /// ACL.
  ///
  /// [marker]: Use `Marker` and `MaxItems` to control pagination of results. If
  /// you have more than `MaxItems` distributions that satisfy the request, the
  /// response includes a `NextMarker` element. To get the next page of results,
  /// submit another request. For the value of `Marker`, specify the value of
  /// `NextMarker` from the last response. (For the first request, omit
  /// `Marker`.)
  ///
  /// [maxItems]: The maximum number of distributions that you want CloudFront
  /// to return in the response body. The maximum and default values are both
  /// 100.
  ///
  /// [webAclId]: The ID of the AWS WAF web ACL that you want to list the
  /// associated distributions. If you specify "null" for the ID, the request
  /// returns a list of the distributions that aren't associated with a web ACL.
  Future<ListDistributionsByWebAclIdResult> listDistributionsByWebAclId20171030(
      String webAclId,
      {String marker,
      String maxItems}) async {
    var response_ =
        await _client.send('ListDistributionsByWebACLId2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
      'WebACLId': webAclId,
    });
    return ListDistributionsByWebAclIdResult.fromJson(response_);
  }

  /// List all field-level encryption configurations that have been created in
  /// CloudFront for this account.
  ///
  /// [marker]: Use this when paginating results to indicate where to begin in
  /// your list of configurations. The results include configurations in the
  /// list that occur after the marker. To get the next page of results, set the
  /// `Marker` to the value of the `NextMarker` from the current page's response
  /// (which is also the ID of the last configuration on that page).
  ///
  /// [maxItems]: The maximum number of field-level encryption configurations
  /// you want in the response body.
  Future<ListFieldLevelEncryptionConfigsResult>
      listFieldLevelEncryptionConfigs20171030(
          {String marker, String maxItems}) async {
    var response_ =
        await _client.send('ListFieldLevelEncryptionConfigs2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListFieldLevelEncryptionConfigsResult.fromJson(response_);
  }

  /// Request a list of field-level encryption profiles that have been created
  /// in CloudFront for this account.
  ///
  /// [marker]: Use this when paginating results to indicate where to begin in
  /// your list of profiles. The results include profiles in the list that occur
  /// after the marker. To get the next page of results, set the `Marker` to the
  /// value of the `NextMarker` from the current page's response (which is also
  /// the ID of the last profile on that page).
  ///
  /// [maxItems]: The maximum number of field-level encryption profiles you want
  /// in the response body.
  Future<ListFieldLevelEncryptionProfilesResult>
      listFieldLevelEncryptionProfiles20171030(
          {String marker, String maxItems}) async {
    var response_ =
        await _client.send('ListFieldLevelEncryptionProfiles2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListFieldLevelEncryptionProfilesResult.fromJson(response_);
  }

  /// Lists invalidation batches.
  ///
  /// [distributionId]: The distribution's ID.
  ///
  /// [marker]: Use this parameter when paginating results to indicate where to
  /// begin in your list of invalidation batches. Because the results are
  /// returned in decreasing order from most recent to oldest, the most recent
  /// results are on the first page, the second page will contain earlier
  /// results, and so on. To get the next page of results, set `Marker` to the
  /// value of the `NextMarker` from the current page's response. This value is
  /// the same as the ID of the last invalidation batch on that page.
  ///
  /// [maxItems]: The maximum number of invalidation batches that you want in
  /// the response body.
  Future<ListInvalidationsResult> listInvalidations20171030(
      String distributionId,
      {String marker,
      String maxItems}) async {
    var response_ = await _client.send('ListInvalidations2017_10_30', {
      'DistributionId': distributionId,
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListInvalidationsResult.fromJson(response_);
  }

  /// List all public keys that have been added to CloudFront for this account.
  ///
  /// [marker]: Use this when paginating results to indicate where to begin in
  /// your list of public keys. The results include public keys in the list that
  /// occur after the marker. To get the next page of results, set the `Marker`
  /// to the value of the `NextMarker` from the current page's response (which
  /// is also the ID of the last public key on that page).
  ///
  /// [maxItems]: The maximum number of public keys you want in the response
  /// body.
  Future<ListPublicKeysResult> listPublicKeys20171030(
      {String marker, String maxItems}) async {
    var response_ = await _client.send('ListPublicKeys2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListPublicKeysResult.fromJson(response_);
  }

  /// List streaming distributions.
  ///
  /// [marker]: The value that you provided for the `Marker` request parameter.
  ///
  /// [maxItems]: The value that you provided for the `MaxItems` request
  /// parameter.
  Future<ListStreamingDistributionsResult> listStreamingDistributions20171030(
      {String marker, String maxItems}) async {
    var response_ = await _client.send('ListStreamingDistributions2017_10_30', {
      if (marker != null) 'Marker': marker,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListStreamingDistributionsResult.fromJson(response_);
  }

  /// List tags for a CloudFront resource.
  ///
  /// [resource]:  An ARN of a CloudFront resource.
  Future<ListTagsForResourceResult> listTagsForResource20171030(
      String resource) async {
    var response_ = await _client.send('ListTagsForResource2017_10_30', {
      'Resource': resource,
    });
    return ListTagsForResourceResult.fromJson(response_);
  }

  /// Add tags to a CloudFront resource.
  ///
  /// [resource]:  An ARN of a CloudFront resource.
  ///
  /// [tags]:  A complex type that contains zero or more `Tag` elements.
  Future<void> tagResource20171030(
      {@required String resource, @required Tags tags}) async {
    await _client.send('TagResource2017_10_30', {
      'Resource': resource,
      'Tags': tags,
    });
  }

  /// Remove tags from a CloudFront resource.
  ///
  /// [resource]:  An ARN of a CloudFront resource.
  ///
  /// [tagKeys]:  A complex type that contains zero or more `Tag` key elements.
  Future<void> untagResource20171030(
      {@required String resource, @required TagKeys tagKeys}) async {
    await _client.send('UntagResource2017_10_30', {
      'Resource': resource,
      'TagKeys': tagKeys,
    });
  }

  /// Update an origin access identity.
  ///
  /// [cloudFrontOriginAccessIdentityConfig]: The identity's configuration
  /// information.
  ///
  /// [id]: The identity's id.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the identity's configuration. For example: `E2QWRUHAPOMQZL`.
  Future<UpdateCloudFrontOriginAccessIdentityResult>
      updateCloudFrontOriginAccessIdentity20171030(
          {@required
              CloudFrontOriginAccessIdentityConfig
                  cloudFrontOriginAccessIdentityConfig,
          @required
              String id,
          String ifMatch}) async {
    var response_ =
        await _client.send('UpdateCloudFrontOriginAccessIdentity2017_10_30', {
      'CloudFrontOriginAccessIdentityConfig':
          cloudFrontOriginAccessIdentityConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdateCloudFrontOriginAccessIdentityResult.fromJson(response_);
  }

  /// Updates the configuration for a web distribution. Perform the following
  /// steps.
  ///
  /// For information about updating a distribution using the CloudFront
  /// console, see
  /// [Creating or Updating a Web Distribution Using the CloudFront Console](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html)
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
  ///
  /// [distributionConfig]: The distribution's configuration information.
  ///
  /// [id]: The distribution's id.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the distribution's configuration. For example:
  /// `E2QWRUHAPOMQZL`.
  Future<UpdateDistributionResult> updateDistribution20171030(
      {@required DistributionConfig distributionConfig,
      @required String id,
      String ifMatch}) async {
    var response_ = await _client.send('UpdateDistribution2017_10_30', {
      'DistributionConfig': distributionConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdateDistributionResult.fromJson(response_);
  }

  /// Update a field-level encryption configuration.
  ///
  /// [fieldLevelEncryptionConfig]: Request to update a field-level encryption
  /// configuration.
  ///
  /// [id]: The ID of the configuration you want to update.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the configuration identity to update. For example:
  /// `E2QWRUHAPOMQZL`.
  Future<UpdateFieldLevelEncryptionConfigResult>
      updateFieldLevelEncryptionConfig20171030(
          {@required FieldLevelEncryptionConfig fieldLevelEncryptionConfig,
          @required String id,
          String ifMatch}) async {
    var response_ =
        await _client.send('UpdateFieldLevelEncryptionConfig2017_10_30', {
      'FieldLevelEncryptionConfig': fieldLevelEncryptionConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdateFieldLevelEncryptionConfigResult.fromJson(response_);
  }

  /// Update a field-level encryption profile.
  ///
  /// [fieldLevelEncryptionProfileConfig]: Request to update a field-level
  /// encryption profile.
  ///
  /// [id]: The ID of the field-level encryption profile request.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the profile identity to update. For example: `E2QWRUHAPOMQZL`.
  Future<UpdateFieldLevelEncryptionProfileResult>
      updateFieldLevelEncryptionProfile20171030(
          {@required
              FieldLevelEncryptionProfileConfig
                  fieldLevelEncryptionProfileConfig,
          @required
              String id,
          String ifMatch}) async {
    var response_ =
        await _client.send('UpdateFieldLevelEncryptionProfile2017_10_30', {
      'FieldLevelEncryptionProfileConfig': fieldLevelEncryptionProfileConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdateFieldLevelEncryptionProfileResult.fromJson(response_);
  }

  /// Update public key information. Note that the only value you can change is
  /// the comment.
  ///
  /// [publicKeyConfig]: Request to update public key information.
  ///
  /// [id]: ID of the public key to be updated.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the public key to update. For example: `E2QWRUHAPOMQZL`.
  Future<UpdatePublicKeyResult> updatePublicKey20171030(
      {@required PublicKeyConfig publicKeyConfig,
      @required String id,
      String ifMatch}) async {
    var response_ = await _client.send('UpdatePublicKey2017_10_30', {
      'PublicKeyConfig': publicKeyConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdatePublicKeyResult.fromJson(response_);
  }

  /// Update a streaming distribution.
  ///
  /// [streamingDistributionConfig]: The streaming distribution's configuration
  /// information.
  ///
  /// [id]: The streaming distribution's id.
  ///
  /// [ifMatch]: The value of the `ETag` header that you received when
  /// retrieving the streaming distribution's configuration. For example:
  /// `E2QWRUHAPOMQZL`.
  Future<UpdateStreamingDistributionResult> updateStreamingDistribution20171030(
      {@required StreamingDistributionConfig streamingDistributionConfig,
      @required String id,
      String ifMatch}) async {
    var response_ =
        await _client.send('UpdateStreamingDistribution2017_10_30', {
      'StreamingDistributionConfig': streamingDistributionConfig,
      'Id': id,
      if (ifMatch != null) 'IfMatch': ifMatch,
    });
    return UpdateStreamingDistributionResult.fromJson(response_);
  }
}

/// A complex type that lists the AWS accounts, if any, that you included in the
/// `TrustedSigners` complex type for this distribution. These are the accounts
/// that you want to allow to create signed URLs for private content.
///
/// The `Signer` complex type lists the AWS account number of the trusted signer
/// or `self` if the signer is the AWS account that created the distribution.
/// The `Signer` element also includes the IDs of any active CloudFront key
/// pairs that are associated with the trusted signer's AWS account. If no
/// `KeyPairId` element appears for a `Signer`, that signer can't create signed
/// URLs.
///
/// For more information, see
/// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
/// in the _Amazon CloudFront Developer Guide_.
class ActiveTrustedSigners {
  /// Enabled is `true` if any of the AWS accounts listed in the
  /// `TrustedSigners` complex type for this RTMP distribution have active
  /// CloudFront key pairs. If not, `Enabled` is `false`.
  ///
  /// For more information, see ActiveTrustedSigners.
  final bool enabled;

  /// A complex type that contains one `Signer` complex type for each trusted
  /// signer specified in the `TrustedSigners` complex type.
  ///
  /// For more information, see ActiveTrustedSigners.
  final int quantity;

  /// A complex type that contains one `Signer` complex type for each trusted
  /// signer that is specified in the `TrustedSigners` complex type.
  ///
  /// For more information, see ActiveTrustedSigners.
  final List<Signer> items;

  ActiveTrustedSigners({
    @required this.enabled,
    @required this.quantity,
    this.items,
  });
  static ActiveTrustedSigners fromJson(Map<String, dynamic> json) =>
      ActiveTrustedSigners(
        enabled: json['Enabled'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Signer.fromJson(e)).toList()
            : null,
      );
}

/// A complex type that contains information about CNAMEs (alternate domain
/// names), if any, for this distribution.
class Aliases {
  /// The number of CNAME aliases, if any, that you want to associate with this
  /// distribution.
  final int quantity;

  /// A complex type that contains the CNAME aliases, if any, that you want to
  /// associate with this distribution.
  final List<String> items;

  Aliases({
    @required this.quantity,
    this.items,
  });
  static Aliases fromJson(Map<String, dynamic> json) => Aliases(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that controls which HTTP methods CloudFront processes and
/// forwards to your Amazon S3 bucket or your custom origin. There are three
/// choices:
///
/// *   CloudFront forwards only `GET` and `HEAD` requests.
///
/// *   CloudFront forwards only `GET`, `HEAD`, and `OPTIONS` requests.
///
/// *   CloudFront forwards `GET, HEAD, OPTIONS, PUT, PATCH, POST`, and `DELETE`
/// requests.
///
///
/// If you pick the third choice, you may need to restrict access to your Amazon
/// S3 bucket or to your custom origin so users can't perform operations that
/// you don't want them to. For example, you might not want users to have
/// permissions to delete objects from your origin.
class AllowedMethods {
  /// The number of HTTP methods that you want CloudFront to forward to your
  /// origin. Valid values are 2 (for `GET` and `HEAD` requests), 3 (for `GET`,
  /// `HEAD`, and `OPTIONS` requests) and 7 (for `GET, HEAD, OPTIONS, PUT,
  /// PATCH, POST`, and `DELETE` requests).
  final int quantity;

  /// A complex type that contains the HTTP methods that you want CloudFront to
  /// process and forward to your origin.
  final List<String> items;

  final CachedMethods cachedMethods;

  AllowedMethods({
    @required this.quantity,
    @required this.items,
    this.cachedMethods,
  });
  static AllowedMethods fromJson(Map<String, dynamic> json) => AllowedMethods(
        quantity: json['Quantity'] as int,
        items: (json['Items'] as List).map((e) => e as String).toList(),
        cachedMethods: json.containsKey('CachedMethods')
            ? CachedMethods.fromJson(json['CachedMethods'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that describes how CloudFront processes requests.
///
/// You must create at least as many cache behaviors (including the default
/// cache behavior) as you have origins if you want CloudFront to distribute
/// objects from all of the origins. Each cache behavior specifies the one
/// origin from which you want CloudFront to get objects. If you have two
/// origins and only the default cache behavior, the default cache behavior will
/// cause CloudFront to get objects from one of the origins, but the other
/// origin is never used.
///
/// For the current limit on the number of cache behaviors that you can add to a
/// distribution, see
/// [Amazon CloudFront Limits](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront)
/// in the _AWS General Reference_.
///
/// If you don't want to specify any cache behaviors, include only an empty
/// `CacheBehaviors` element. Don't include an empty `CacheBehavior` element, or
/// CloudFront returns a `MalformedXML` error.
///
/// To delete all cache behaviors in an existing distribution, update the
/// distribution configuration and include only an empty `CacheBehaviors`
/// element.
///
/// To add, change, or remove one or more cache behaviors, update the
/// distribution configuration and specify all of the cache behaviors that you
/// want to include in the updated distribution.
///
/// For more information about cache behaviors, see
/// [Cache Behaviors](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior)
/// in the _Amazon CloudFront Developer Guide_.
class CacheBehavior {
  /// The pattern (for example, `images/*.jpg`) that specifies which requests to
  /// apply the behavior to. When CloudFront receives a viewer request, the
  /// requested path is compared with path patterns in the order in which cache
  /// behaviors are listed in the distribution.
  ///
  ///  You can optionally include a slash (`/`) at the beginning of the path
  /// pattern. For example, `/images/*.jpg`. CloudFront behavior is the same
  /// with or without the leading `/`.
  ///
  /// The path pattern for the default cache behavior is `*` and cannot be
  /// changed. If the request for an object does not match the path pattern for
  /// any cache behaviors, CloudFront applies the behavior in the default cache
  /// behavior.
  ///
  /// For more information, see
  /// [Path Pattern](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesPathPattern)
  /// in the  _Amazon CloudFront Developer Guide_.
  final String pathPattern;

  /// The value of `ID` for the origin that you want CloudFront to route
  /// requests to when a request matches the path pattern either for a cache
  /// behavior or for the default cache behavior.
  final String targetOriginId;

  /// A complex type that specifies how CloudFront handles query strings and
  /// cookies.
  final ForwardedValues forwardedValues;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content.
  ///
  /// If you want to require signed URLs in requests for objects in the target
  /// origin that match the `PathPattern` for this cache behavior, specify
  /// `true` for `Enabled`, and specify the applicable values for `Quantity` and
  /// `Items`. For more information, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  ///
  /// If you don't want to require signed URLs in requests for objects that
  /// match `PathPattern`, specify `false` for `Enabled` and `0` for `Quantity`.
  /// Omit `Items`.
  ///
  /// To add, change, or remove one or more trusted signers, change `Enabled` to
  /// `true` (if it's currently `false`), change `Quantity` as applicable, and
  /// specify all of the trusted signers that you want to include in the updated
  /// distribution.
  final TrustedSigners trustedSigners;

  /// The protocol that viewers can use to access the files in the origin
  /// specified by `TargetOriginId` when a request matches the path pattern in
  /// `PathPattern`. You can specify the following options:
  ///
  /// *    `allow-all`: Viewers can use HTTP or HTTPS.
  ///
  /// *    `redirect-to-https`: If a viewer submits an HTTP request, CloudFront
  /// returns an HTTP status code of 301 (Moved Permanently) to the viewer along
  /// with the HTTPS URL. The viewer then resubmits the request using the new
  /// URL.
  ///
  /// *    `https-only`: If a viewer sends an HTTP request, CloudFront returns
  /// an HTTP status code of 403 (Forbidden).
  ///
  ///
  /// For more information about requiring the HTTPS protocol, see
  /// [Using an HTTPS Connection to Access Your Objects](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  ///
  ///
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch
  /// the object. If you have recently changed from HTTP to HTTPS, we recommend
  /// that you clear your objects' cache because cached objects are protocol
  /// agnostic. That means that an edge location will return an object from the
  /// cache regardless of whether the current request protocol matches the
  /// protocol used previously. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final String viewerProtocolPolicy;

  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  ///
  /// You must specify `0` for `MinTTL` if you configure CloudFront to forward
  /// all headers to your origin (under `Headers`, if you specify `1` for
  /// `Quantity` and `*` for `Name`).
  final BigInt minTtl;

  final AllowedMethods allowedMethods;

  /// Indicates whether you want to distribute media files in the Microsoft
  /// Smooth Streaming format using the origin that is associated with this
  /// cache behavior. If so, specify `true`; if not, specify `false`. If you
  /// specify `true` for `SmoothStreaming`, you can still distribute other
  /// content using this cache behavior if the content matches the value of
  /// `PathPattern`.
  final bool smoothStreaming;

  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// `Cache-Control max-age`, `Cache-Control s-maxage`, and `Expires` to
  /// objects. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final BigInt defaultTtl;

  /// The maximum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin adds HTTP headers such as `Cache-Control
  /// max-age`, `Cache-Control s-maxage`, and `Expires` to objects. For more
  /// information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final BigInt maxTtl;

  /// Whether you want CloudFront to automatically compress certain files for
  /// this cache behavior. If so, specify true; if not, specify false. For more
  /// information, see
  /// [Serving Compressed Files](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final bool compress;

  /// A complex type that contains zero or more Lambda function associations for
  /// a cache behavior.
  final LambdaFunctionAssociations lambdaFunctionAssociations;

  final String fieldLevelEncryptionId;

  CacheBehavior({
    @required this.pathPattern,
    @required this.targetOriginId,
    @required this.forwardedValues,
    @required this.trustedSigners,
    @required this.viewerProtocolPolicy,
    @required this.minTtl,
    this.allowedMethods,
    this.smoothStreaming,
    this.defaultTtl,
    this.maxTtl,
    this.compress,
    this.lambdaFunctionAssociations,
    this.fieldLevelEncryptionId,
  });
  static CacheBehavior fromJson(Map<String, dynamic> json) => CacheBehavior(
        pathPattern: json['PathPattern'] as String,
        targetOriginId: json['TargetOriginId'] as String,
        forwardedValues: ForwardedValues.fromJson(json['ForwardedValues']),
        trustedSigners: TrustedSigners.fromJson(json['TrustedSigners']),
        viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String,
        minTtl: BigInt.from(json['MinTTL']),
        allowedMethods: json.containsKey('AllowedMethods')
            ? AllowedMethods.fromJson(json['AllowedMethods'])
            : null,
        smoothStreaming: json.containsKey('SmoothStreaming')
            ? json['SmoothStreaming'] as bool
            : null,
        defaultTtl: json.containsKey('DefaultTTL')
            ? BigInt.from(json['DefaultTTL'])
            : null,
        maxTtl: json.containsKey('MaxTTL') ? BigInt.from(json['MaxTTL']) : null,
        compress:
            json.containsKey('Compress') ? json['Compress'] as bool : null,
        lambdaFunctionAssociations:
            json.containsKey('LambdaFunctionAssociations')
                ? LambdaFunctionAssociations.fromJson(
                    json['LambdaFunctionAssociations'])
                : null,
        fieldLevelEncryptionId: json.containsKey('FieldLevelEncryptionId')
            ? json['FieldLevelEncryptionId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains zero or more `CacheBehavior` elements.
class CacheBehaviors {
  /// The number of cache behaviors for this distribution.
  final int quantity;

  /// Optional: A complex type that contains cache behaviors for this
  /// distribution. If `Quantity` is `0`, you can omit `Items`.
  final List<CacheBehavior> items;

  CacheBehaviors({
    @required this.quantity,
    this.items,
  });
  static CacheBehaviors fromJson(Map<String, dynamic> json) => CacheBehaviors(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => CacheBehavior.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that controls whether CloudFront caches the response to
/// requests using the specified HTTP methods. There are two choices:
///
/// *   CloudFront caches responses to `GET` and `HEAD` requests.
///
/// *   CloudFront caches responses to `GET`, `HEAD`, and `OPTIONS` requests.
///
///
/// If you pick the second choice for your Amazon S3 Origin, you may need to
/// forward Access-Control-Request-Method, Access-Control-Request-Headers, and
/// Origin headers for the responses to be cached correctly.
class CachedMethods {
  /// The number of HTTP methods for which you want CloudFront to cache
  /// responses. Valid values are `2` (for caching responses to `GET` and `HEAD`
  /// requests) and `3` (for caching responses to `GET`, `HEAD`, and `OPTIONS`
  /// requests).
  final int quantity;

  /// A complex type that contains the HTTP methods that you want CloudFront to
  /// cache responses to.
  final List<String> items;

  CachedMethods({
    @required this.quantity,
    @required this.items,
  });
  static CachedMethods fromJson(Map<String, dynamic> json) => CachedMethods(
        quantity: json['Quantity'] as int,
        items: (json['Items'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// CloudFront origin access identity.
class CloudFrontOriginAccessIdentity {
  /// The ID for the origin access identity, for example, `E74FTE3AJFJ256A`.
  final String id;

  /// The Amazon S3 canonical user ID for the origin access identity, used when
  /// giving the origin access identity read permission to an object in Amazon
  /// S3.
  final String s3CanonicalUserId;

  /// The current configuration information for the identity.
  final CloudFrontOriginAccessIdentityConfig
      cloudFrontOriginAccessIdentityConfig;

  CloudFrontOriginAccessIdentity({
    @required this.id,
    @required this.s3CanonicalUserId,
    this.cloudFrontOriginAccessIdentityConfig,
  });
  static CloudFrontOriginAccessIdentity fromJson(Map<String, dynamic> json) =>
      CloudFrontOriginAccessIdentity(
        id: json['Id'] as String,
        s3CanonicalUserId: json['S3CanonicalUserId'] as String,
        cloudFrontOriginAccessIdentityConfig:
            json.containsKey('CloudFrontOriginAccessIdentityConfig')
                ? CloudFrontOriginAccessIdentityConfig.fromJson(
                    json['CloudFrontOriginAccessIdentityConfig'])
                : null,
      );
}

/// Origin access identity configuration. Send a `GET` request to the
/// `/_CloudFront API version_/CloudFront/identity ID/config` resource.
class CloudFrontOriginAccessIdentityConfig {
  /// A unique number that ensures the request can't be replayed.
  ///
  /// If the `CallerReference` is new (no matter the content of the
  /// `CloudFrontOriginAccessIdentityConfig` object), a new origin access
  /// identity is created.
  ///
  /// If the `CallerReference` is a value already sent in a previous identity
  /// request, and the content of the `CloudFrontOriginAccessIdentityConfig` is
  /// identical to the original request (ignoring white space), the response
  /// includes the same information returned to the original request.
  ///
  /// If the `CallerReference` is a value you already sent in a previous request
  /// to create an identity, but the content of the
  /// `CloudFrontOriginAccessIdentityConfig` is different from the original
  /// request, CloudFront returns a
  /// `CloudFrontOriginAccessIdentityAlreadyExists` error.
  final String callerReference;

  /// Any comments you want to include about the origin access identity.
  final String comment;

  CloudFrontOriginAccessIdentityConfig({
    @required this.callerReference,
    @required this.comment,
  });
  static CloudFrontOriginAccessIdentityConfig fromJson(
          Map<String, dynamic> json) =>
      CloudFrontOriginAccessIdentityConfig(
        callerReference: json['CallerReference'] as String,
        comment: json['Comment'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Lists the origin access identities for CloudFront.Send a `GET` request to
/// the `/_CloudFront API version_/origin-access-identity/cloudfront` resource.
/// The response includes a `CloudFrontOriginAccessIdentityList` element with
/// zero or more `CloudFrontOriginAccessIdentitySummary` child elements. By
/// default, your entire list of origin access identities is returned in one
/// single page. If the list is long, you can paginate it using the `MaxItems`
/// and `Marker` parameters.
class CloudFrontOriginAccessIdentityList {
  /// Use this when paginating results to indicate where to begin in your list
  /// of origin access identities. The results include identities in the list
  /// that occur after the marker. To get the next page of results, set the
  /// `Marker` to the value of the `NextMarker` from the current page's response
  /// (which is also the ID of the last identity on that page).
  final String marker;

  /// If `IsTruncated` is `true`, this element is present and contains the value
  /// you can use for the `Marker` request parameter to continue listing your
  /// origin access identities where they left off.
  final String nextMarker;

  /// The maximum number of origin access identities you want in the response
  /// body.
  final int maxItems;

  /// A flag that indicates whether more origin access identities remain to be
  /// listed. If your results were truncated, you can make a follow-up
  /// pagination request using the `Marker` request parameter to retrieve more
  /// items in the list.
  final bool isTruncated;

  /// The number of CloudFront origin access identities that were created by the
  /// current AWS account.
  final int quantity;

  /// A complex type that contains one `CloudFrontOriginAccessIdentitySummary`
  /// element for each origin access identity that was created by the current
  /// AWS account.
  final List<CloudFrontOriginAccessIdentitySummary> items;

  CloudFrontOriginAccessIdentityList({
    @required this.marker,
    this.nextMarker,
    @required this.maxItems,
    @required this.isTruncated,
    @required this.quantity,
    this.items,
  });
  static CloudFrontOriginAccessIdentityList fromJson(
          Map<String, dynamic> json) =>
      CloudFrontOriginAccessIdentityList(
        marker: json['Marker'] as String,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        isTruncated: json['IsTruncated'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => CloudFrontOriginAccessIdentitySummary.fromJson(e))
                .toList()
            : null,
      );
}

/// Summary of the information about a CloudFront origin access identity.
class CloudFrontOriginAccessIdentitySummary {
  /// The ID for the origin access identity. For example: `E74FTE3AJFJ256A`.
  final String id;

  /// The Amazon S3 canonical user ID for the origin access identity, which you
  /// use when giving the origin access identity read permission to an object in
  /// Amazon S3.
  final String s3CanonicalUserId;

  /// The comment for this origin access identity, as originally specified when
  /// created.
  final String comment;

  CloudFrontOriginAccessIdentitySummary({
    @required this.id,
    @required this.s3CanonicalUserId,
    @required this.comment,
  });
  static CloudFrontOriginAccessIdentitySummary fromJson(
          Map<String, dynamic> json) =>
      CloudFrontOriginAccessIdentitySummary(
        id: json['Id'] as String,
        s3CanonicalUserId: json['S3CanonicalUserId'] as String,
        comment: json['Comment'] as String,
      );
}

/// A field-level encryption content type profile.
class ContentTypeProfile {
  /// The format for a field-level encryption content type-profile mapping.
  final String format;

  /// The profile ID for a field-level encryption content type-profile mapping.
  final String profileId;

  /// The content type for a field-level encryption content type-profile
  /// mapping.
  final String contentType;

  ContentTypeProfile({
    @required this.format,
    this.profileId,
    @required this.contentType,
  });
  static ContentTypeProfile fromJson(Map<String, dynamic> json) =>
      ContentTypeProfile(
        format: json['Format'] as String,
        profileId:
            json.containsKey('ProfileId') ? json['ProfileId'] as String : null,
        contentType: json['ContentType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The configuration for a field-level encryption content type-profile mapping.
class ContentTypeProfileConfig {
  /// The setting in a field-level encryption content type-profile mapping that
  /// specifies what to do when an unknown content type is provided for the
  /// profile. If true, content is forwarded without being encrypted when the
  /// content type is unknown. If false (the default), an error is returned when
  /// the content type is unknown.
  final bool forwardWhenContentTypeIsUnknown;

  /// The configuration for a field-level encryption content type-profile.
  final ContentTypeProfiles contentTypeProfiles;

  ContentTypeProfileConfig({
    @required this.forwardWhenContentTypeIsUnknown,
    this.contentTypeProfiles,
  });
  static ContentTypeProfileConfig fromJson(Map<String, dynamic> json) =>
      ContentTypeProfileConfig(
        forwardWhenContentTypeIsUnknown:
            json['ForwardWhenContentTypeIsUnknown'] as bool,
        contentTypeProfiles: json.containsKey('ContentTypeProfiles')
            ? ContentTypeProfiles.fromJson(json['ContentTypeProfiles'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Field-level encryption content type-profile.
class ContentTypeProfiles {
  /// The number of field-level encryption content type-profile mappings.
  final int quantity;

  /// Items in a field-level encryption content type-profile mapping.
  final List<ContentTypeProfile> items;

  ContentTypeProfiles({
    @required this.quantity,
    this.items,
  });
  static ContentTypeProfiles fromJson(Map<String, dynamic> json) =>
      ContentTypeProfiles(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => ContentTypeProfile.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that specifies whether you want CloudFront to forward cookies
/// to the origin and, if so, which ones. For more information about forwarding
/// cookies to the origin, see
/// [How CloudFront Forwards, Caches, and Logs Cookies](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html)
/// in the _Amazon CloudFront Developer Guide_.
class CookieNames {
  /// The number of different cookies that you want CloudFront to forward to the
  /// origin for this cache behavior.
  final int quantity;

  /// A complex type that contains one `Name` element for each cookie that you
  /// want CloudFront to forward to the origin for this cache behavior.
  final List<String> items;

  CookieNames({
    @required this.quantity,
    this.items,
  });
  static CookieNames fromJson(Map<String, dynamic> json) => CookieNames(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that specifies whether you want CloudFront to forward cookies
/// to the origin and, if so, which ones. For more information about forwarding
/// cookies to the origin, see
/// [How CloudFront Forwards, Caches, and Logs Cookies](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html)
/// in the _Amazon CloudFront Developer Guide_.
class CookiePreference {
  /// Specifies which cookies to forward to the origin for this cache behavior:
  /// all, none, or the list of cookies specified in the `WhitelistedNames`
  /// complex type.
  ///
  /// Amazon S3 doesn't process cookies. When the cache behavior is forwarding
  /// requests to an Amazon S3 origin, specify none for the `Forward` element.
  final String forward;

  /// Required if you specify `whitelist` for the value of `Forward:`. A complex
  /// type that specifies how many different cookies you want CloudFront to
  /// forward to the origin for this cache behavior and, if you want to forward
  /// selected cookies, the names of those cookies.
  ///
  /// If you specify `all` or none for the value of `Forward`, omit
  /// `WhitelistedNames`. If you change the value of `Forward` from `whitelist`
  /// to all or none and you don't delete the `WhitelistedNames` element and its
  /// child elements, CloudFront deletes them automatically.
  ///
  /// For the current limit on the number of cookie names that you can whitelist
  /// for each cache behavior, see
  /// [Amazon CloudFront Limits](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront)
  /// in the _AWS General Reference_.
  final CookieNames whitelistedNames;

  CookiePreference({
    @required this.forward,
    this.whitelistedNames,
  });
  static CookiePreference fromJson(Map<String, dynamic> json) =>
      CookiePreference(
        forward: json['Forward'] as String,
        whitelistedNames: json.containsKey('WhitelistedNames')
            ? CookieNames.fromJson(json['WhitelistedNames'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The returned result of the corresponding request.
class CreateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The fully qualified URI of the new origin access identity just created.
  /// For example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/origin-access-identity/cloudfront/E74FTE3AJFJ256A`.
  final String location;

  /// The current version of the origin access identity created.
  final String eTag;

  CreateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.location,
    this.eTag,
  });
  static CreateCloudFrontOriginAccessIdentityResult fromJson(
          Map<String, dynamic> json) =>
      CreateCloudFrontOriginAccessIdentityResult(
        cloudFrontOriginAccessIdentity:
            json.containsKey('CloudFrontOriginAccessIdentity')
                ? CloudFrontOriginAccessIdentity.fromJson(
                    json['CloudFrontOriginAccessIdentity'])
                : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class CreateDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The fully qualified URI of the new distribution resource just created. For
  /// example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5`.
  final String location;

  /// The current version of the distribution created.
  final String eTag;

  CreateDistributionResult({
    this.distribution,
    this.location,
    this.eTag,
  });
  static CreateDistributionResult fromJson(Map<String, dynamic> json) =>
      CreateDistributionResult(
        distribution: json.containsKey('Distribution')
            ? Distribution.fromJson(json['Distribution'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class CreateDistributionWithTagsResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The fully qualified URI of the new distribution resource just created. For
  /// example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5`.
  final String location;

  /// The current version of the distribution created.
  final String eTag;

  CreateDistributionWithTagsResult({
    this.distribution,
    this.location,
    this.eTag,
  });
  static CreateDistributionWithTagsResult fromJson(Map<String, dynamic> json) =>
      CreateDistributionWithTagsResult(
        distribution: json.containsKey('Distribution')
            ? Distribution.fromJson(json['Distribution'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class CreateFieldLevelEncryptionConfigResult {
  /// Returned when you create a new field-level encryption configuration.
  final FieldLevelEncryption fieldLevelEncryption;

  /// The fully qualified URI of the new configuration resource just created.
  /// For example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/field-level-encryption-config/EDFDVBD632BHDS5`.
  final String location;

  /// The current version of the field level encryption configuration. For
  /// example: `E2QWRUHAPOMQZL`.
  final String eTag;

  CreateFieldLevelEncryptionConfigResult({
    this.fieldLevelEncryption,
    this.location,
    this.eTag,
  });
  static CreateFieldLevelEncryptionConfigResult fromJson(
          Map<String, dynamic> json) =>
      CreateFieldLevelEncryptionConfigResult(
        fieldLevelEncryption: json.containsKey('FieldLevelEncryption')
            ? FieldLevelEncryption.fromJson(json['FieldLevelEncryption'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class CreateFieldLevelEncryptionProfileResult {
  /// Returned when you create a new field-level encryption profile.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  /// The fully qualified URI of the new profile resource just created. For
  /// example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/field-level-encryption-profile/EDFDVBD632BHDS5`.
  final String location;

  /// The current version of the field level encryption profile. For example:
  /// `E2QWRUHAPOMQZL`.
  final String eTag;

  CreateFieldLevelEncryptionProfileResult({
    this.fieldLevelEncryptionProfile,
    this.location,
    this.eTag,
  });
  static CreateFieldLevelEncryptionProfileResult fromJson(
          Map<String, dynamic> json) =>
      CreateFieldLevelEncryptionProfileResult(
        fieldLevelEncryptionProfile:
            json.containsKey('FieldLevelEncryptionProfile')
                ? FieldLevelEncryptionProfile.fromJson(
                    json['FieldLevelEncryptionProfile'])
                : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class CreateInvalidationResult {
  /// The fully qualified URI of the distribution and invalidation batch
  /// request, including the `Invalidation ID`.
  final String location;

  /// The invalidation's information.
  final Invalidation invalidation;

  CreateInvalidationResult({
    this.location,
    this.invalidation,
  });
  static CreateInvalidationResult fromJson(Map<String, dynamic> json) =>
      CreateInvalidationResult(
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        invalidation: json.containsKey('Invalidation')
            ? Invalidation.fromJson(json['Invalidation'])
            : null,
      );
}

class CreatePublicKeyResult {
  /// Returned when you add a public key.
  final PublicKey publicKey;

  /// The fully qualified URI of the new public key resource just created. For
  /// example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/cloudfront-public-key/EDFDVBD632BHDS5`.
  final String location;

  /// The current version of the public key. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  CreatePublicKeyResult({
    this.publicKey,
    this.location,
    this.eTag,
  });
  static CreatePublicKeyResult fromJson(Map<String, dynamic> json) =>
      CreatePublicKeyResult(
        publicKey: json.containsKey('PublicKey')
            ? PublicKey.fromJson(json['PublicKey'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionResult {
  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created. For example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8`.
  final String location;

  /// The current version of the streaming distribution created.
  final String eTag;

  CreateStreamingDistributionResult({
    this.streamingDistribution,
    this.location,
    this.eTag,
  });
  static CreateStreamingDistributionResult fromJson(
          Map<String, dynamic> json) =>
      CreateStreamingDistributionResult(
        streamingDistribution: json.containsKey('StreamingDistribution')
            ? StreamingDistribution.fromJson(json['StreamingDistribution'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionWithTagsResult {
  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created. For example:
  /// `https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8`.
  final String location;

  final String eTag;

  CreateStreamingDistributionWithTagsResult({
    this.streamingDistribution,
    this.location,
    this.eTag,
  });
  static CreateStreamingDistributionWithTagsResult fromJson(
          Map<String, dynamic> json) =>
      CreateStreamingDistributionWithTagsResult(
        streamingDistribution: json.containsKey('StreamingDistribution')
            ? StreamingDistribution.fromJson(json['StreamingDistribution'])
            : null,
        location:
            json.containsKey('Location') ? json['Location'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// A complex type that controls:
///
/// *   Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range
/// with custom error messages before returning the response to the viewer.
///
/// *   How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
///
///
/// For more information about custom error pages, see
/// [Customizing Error Responses](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html)
/// in the _Amazon CloudFront Developer Guide_.
class CustomErrorResponse {
  /// The HTTP status code for which you want to specify a custom error page
  /// and/or a caching duration.
  final int errorCode;

  /// The path to the custom error page that you want CloudFront to return to a
  /// viewer when your origin returns the HTTP status code specified by
  /// `ErrorCode`, for example, `/4xx-errors/403-forbidden.html`. If you want to
  /// store your objects and your custom error pages in different locations,
  /// your distribution must include a cache behavior for which the following is
  /// true:
  ///
  /// *   The value of `PathPattern` matches the path to your custom error
  /// messages. For example, suppose you saved custom error pages for 4xx errors
  /// in an Amazon S3 bucket in a directory named `/4xx-errors`. Your
  /// distribution must include a cache behavior for which the path pattern
  /// routes requests for your custom error pages to that location, for example,
  /// `/4xx-errors/*`.
  ///
  /// *   The value of `TargetOriginId` specifies the value of the `ID` element
  /// for the origin that contains your custom error pages.
  ///
  ///
  /// If you specify a value for `ResponsePagePath`, you must also specify a
  /// value for `ResponseCode`. If you don't want to specify a value, include an
  /// empty element, `<ResponsePagePath>`, in the XML document.
  ///
  /// We recommend that you store custom error pages in an Amazon S3 bucket. If
  /// you store custom error pages on an HTTP server and the server starts to
  /// return 5xx errors, CloudFront can't get the files that you want to return
  /// to viewers because the origin server is unavailable.
  final String responsePagePath;

  /// The HTTP status code that you want CloudFront to return to the viewer
  /// along with the custom error page. There are a variety of reasons that you
  /// might want CloudFront to return a status code different from the status
  /// code that your origin returned to CloudFront, for example:
  ///
  /// *   Some Internet devices (some firewalls and corporate proxies, for
  /// example) intercept HTTP 4xx and 5xx and prevent the response from being
  /// returned to the viewer. If you substitute `200`, the response typically
  /// won't be intercepted.
  ///
  /// *   If you don't care about distinguishing among different client errors
  /// or server errors, you can specify `400` or `500` as the `ResponseCode` for
  /// all 4xx or 5xx errors.
  ///
  /// *   You might want to return a `200` status code (OK) and static website
  /// so your customers don't know that your website is down.
  ///
  ///
  /// If you specify a value for `ResponseCode`, you must also specify a value
  /// for `ResponsePagePath`. If you don't want to specify a value, include an
  /// empty element, `<ResponseCode>`, in the XML document.
  final String responseCode;

  /// The minimum amount of time, in seconds, that you want CloudFront to cache
  /// the HTTP status code specified in `ErrorCode`. When this time period has
  /// elapsed, CloudFront queries your origin to see whether the problem that
  /// caused the error has been resolved and the requested object is now
  /// available.
  ///
  /// If you don't want to specify a value, include an empty element,
  /// `<ErrorCachingMinTTL>`, in the XML document.
  ///
  /// For more information, see
  /// [Customizing Error Responses](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final BigInt errorCachingMinTtl;

  CustomErrorResponse({
    @required this.errorCode,
    this.responsePagePath,
    this.responseCode,
    this.errorCachingMinTtl,
  });
  static CustomErrorResponse fromJson(Map<String, dynamic> json) =>
      CustomErrorResponse(
        errorCode: json['ErrorCode'] as int,
        responsePagePath: json.containsKey('ResponsePagePath')
            ? json['ResponsePagePath'] as String
            : null,
        responseCode: json.containsKey('ResponseCode')
            ? json['ResponseCode'] as String
            : null,
        errorCachingMinTtl: json.containsKey('ErrorCachingMinTTL')
            ? BigInt.from(json['ErrorCachingMinTTL'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that controls:
///
/// *   Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range
/// with custom error messages before returning the response to the viewer.
///
/// *   How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
///
///
/// For more information about custom error pages, see
/// [Customizing Error Responses](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html)
/// in the _Amazon CloudFront Developer Guide_.
class CustomErrorResponses {
  /// The number of HTTP status codes for which you want to specify a custom
  /// error page and/or a caching duration. If `Quantity` is `0`, you can omit
  /// `Items`.
  final int quantity;

  /// A complex type that contains a `CustomErrorResponse` element for each HTTP
  /// status code for which you want to specify a custom error page and/or a
  /// caching duration.
  final List<CustomErrorResponse> items;

  CustomErrorResponses({
    @required this.quantity,
    this.items,
  });
  static CustomErrorResponses fromJson(Map<String, dynamic> json) =>
      CustomErrorResponses(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => CustomErrorResponse.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains the list of Custom Headers for each origin.
class CustomHeaders {
  /// The number of custom headers, if any, for this distribution.
  final int quantity;

  ///  **Optional**: A list that contains one `OriginCustomHeader` element for
  /// each custom header that you want CloudFront to forward to the origin. If
  /// Quantity is `0`, omit `Items`.
  final List<OriginCustomHeader> items;

  CustomHeaders({
    @required this.quantity,
    this.items,
  });
  static CustomHeaders fromJson(Map<String, dynamic> json) => CustomHeaders(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => OriginCustomHeader.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A customer origin.
class CustomOriginConfig {
  /// The HTTP port the custom origin listens on.
  final int httpPort;

  /// The HTTPS port the custom origin listens on.
  final int httpsPort;

  /// The origin protocol policy to apply to your origin.
  final String originProtocolPolicy;

  /// The SSL/TLS protocols that you want CloudFront to use when communicating
  /// with your origin over HTTPS.
  final OriginSslProtocols originSslProtocols;

  /// You can create a custom origin read timeout. All timeout units are in
  /// seconds. The default origin read timeout is 30 seconds, but you can
  /// configure custom timeout lengths using the CloudFront API. The minimum
  /// timeout length is 4 seconds; the maximum is 60 seconds.
  ///
  /// If you need to increase the maximum time limit, contact the
  /// [AWS Support Center](https://console.aws.amazon.com/support/home#/).
  final int originReadTimeout;

  /// You can create a custom keep-alive timeout. All timeout units are in
  /// seconds. The default keep-alive timeout is 5 seconds, but you can
  /// configure custom timeout lengths using the CloudFront API. The minimum
  /// timeout length is 1 second; the maximum is 60 seconds.
  ///
  /// If you need to increase the maximum time limit, contact the
  /// [AWS Support Center](https://console.aws.amazon.com/support/home#/).
  final int originKeepaliveTimeout;

  CustomOriginConfig({
    @required this.httpPort,
    @required this.httpsPort,
    @required this.originProtocolPolicy,
    this.originSslProtocols,
    this.originReadTimeout,
    this.originKeepaliveTimeout,
  });
  static CustomOriginConfig fromJson(Map<String, dynamic> json) =>
      CustomOriginConfig(
        httpPort: json['HTTPPort'] as int,
        httpsPort: json['HTTPSPort'] as int,
        originProtocolPolicy: json['OriginProtocolPolicy'] as String,
        originSslProtocols: json.containsKey('OriginSslProtocols')
            ? OriginSslProtocols.fromJson(json['OriginSslProtocols'])
            : null,
        originReadTimeout: json.containsKey('OriginReadTimeout')
            ? json['OriginReadTimeout'] as int
            : null,
        originKeepaliveTimeout: json.containsKey('OriginKeepaliveTimeout')
            ? json['OriginKeepaliveTimeout'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that describes the default cache behavior if you don't
/// specify a `CacheBehavior` element or if files don't match any of the values
/// of `PathPattern` in `CacheBehavior` elements. You must create exactly one
/// default cache behavior.
class DefaultCacheBehavior {
  /// The value of `ID` for the origin that you want CloudFront to route
  /// requests to when a request matches the path pattern either for a cache
  /// behavior or for the default cache behavior.
  final String targetOriginId;

  /// A complex type that specifies how CloudFront handles query strings and
  /// cookies.
  final ForwardedValues forwardedValues;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content.
  ///
  /// If you want to require signed URLs in requests for objects in the target
  /// origin that match the `PathPattern` for this cache behavior, specify
  /// `true` for `Enabled`, and specify the applicable values for `Quantity` and
  /// `Items`. For more information, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  ///
  /// If you don't want to require signed URLs in requests for objects that
  /// match `PathPattern`, specify `false` for `Enabled` and `0` for `Quantity`.
  /// Omit `Items`.
  ///
  /// To add, change, or remove one or more trusted signers, change `Enabled` to
  /// `true` (if it's currently `false`), change `Quantity` as applicable, and
  /// specify all of the trusted signers that you want to include in the updated
  /// distribution.
  final TrustedSigners trustedSigners;

  /// The protocol that viewers can use to access the files in the origin
  /// specified by `TargetOriginId` when a request matches the path pattern in
  /// `PathPattern`. You can specify the following options:
  ///
  /// *    `allow-all`: Viewers can use HTTP or HTTPS.
  ///
  /// *    `redirect-to-https`: If a viewer submits an HTTP request, CloudFront
  /// returns an HTTP status code of 301 (Moved Permanently) to the viewer along
  /// with the HTTPS URL. The viewer then resubmits the request using the new
  /// URL.
  ///
  /// *    `https-only`: If a viewer sends an HTTP request, CloudFront returns
  /// an HTTP status code of 403 (Forbidden).
  ///
  ///
  /// For more information about requiring the HTTPS protocol, see
  /// [Using an HTTPS Connection to Access Your Objects](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  ///
  ///
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch
  /// the object. If you have recently changed from HTTP to HTTPS, we recommend
  /// that you clear your objects' cache because cached objects are protocol
  /// agnostic. That means that an edge location will return an object from the
  /// cache regardless of whether the current request protocol matches the
  /// protocol used previously. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final String viewerProtocolPolicy;

  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  ///
  /// You must specify `0` for `MinTTL` if you configure CloudFront to forward
  /// all headers to your origin (under `Headers`, if you specify `1` for
  /// `Quantity` and `*` for `Name`).
  final BigInt minTtl;

  final AllowedMethods allowedMethods;

  /// Indicates whether you want to distribute media files in the Microsoft
  /// Smooth Streaming format using the origin that is associated with this
  /// cache behavior. If so, specify `true`; if not, specify `false`. If you
  /// specify `true` for `SmoothStreaming`, you can still distribute other
  /// content using this cache behavior if the content matches the value of
  /// `PathPattern`.
  final bool smoothStreaming;

  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// `Cache-Control max-age`, `Cache-Control s-maxage`, and `Expires` to
  /// objects. For more information, see
  /// [Specifying How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final BigInt defaultTtl;

  final BigInt maxTtl;

  /// Whether you want CloudFront to automatically compress certain files for
  /// this cache behavior. If so, specify `true`; if not, specify `false`. For
  /// more information, see
  /// [Serving Compressed Files](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final bool compress;

  /// A complex type that contains zero or more Lambda function associations for
  /// a cache behavior.
  final LambdaFunctionAssociations lambdaFunctionAssociations;

  final String fieldLevelEncryptionId;

  DefaultCacheBehavior({
    @required this.targetOriginId,
    @required this.forwardedValues,
    @required this.trustedSigners,
    @required this.viewerProtocolPolicy,
    @required this.minTtl,
    this.allowedMethods,
    this.smoothStreaming,
    this.defaultTtl,
    this.maxTtl,
    this.compress,
    this.lambdaFunctionAssociations,
    this.fieldLevelEncryptionId,
  });
  static DefaultCacheBehavior fromJson(Map<String, dynamic> json) =>
      DefaultCacheBehavior(
        targetOriginId: json['TargetOriginId'] as String,
        forwardedValues: ForwardedValues.fromJson(json['ForwardedValues']),
        trustedSigners: TrustedSigners.fromJson(json['TrustedSigners']),
        viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String,
        minTtl: BigInt.from(json['MinTTL']),
        allowedMethods: json.containsKey('AllowedMethods')
            ? AllowedMethods.fromJson(json['AllowedMethods'])
            : null,
        smoothStreaming: json.containsKey('SmoothStreaming')
            ? json['SmoothStreaming'] as bool
            : null,
        defaultTtl: json.containsKey('DefaultTTL')
            ? BigInt.from(json['DefaultTTL'])
            : null,
        maxTtl: json.containsKey('MaxTTL') ? BigInt.from(json['MaxTTL']) : null,
        compress:
            json.containsKey('Compress') ? json['Compress'] as bool : null,
        lambdaFunctionAssociations:
            json.containsKey('LambdaFunctionAssociations')
                ? LambdaFunctionAssociations.fromJson(
                    json['LambdaFunctionAssociations'])
                : null,
        fieldLevelEncryptionId: json.containsKey('FieldLevelEncryptionId')
            ? json['FieldLevelEncryptionId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The distribution's information.
class Distribution {
  /// The identifier for the distribution. For example: `EDFDVBD632BHDS5`.
  final String id;

  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// `arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5`, where
  /// `123456789012` is your AWS account ID.
  final String arn;

  /// This response element indicates the current status of the distribution.
  /// When the status is `Deployed`, the distribution's information is fully
  /// propagated to all CloudFront edge locations.
  final String status;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// The number of invalidation batches currently in progress.
  final int inProgressInvalidationBatches;

  /// The domain name corresponding to the distribution, for example,
  /// `d111111abcdef8.cloudfront.net`.
  final String domainName;

  /// CloudFront automatically adds this element to the response only if you've
  /// set up the distribution to serve private content with signed URLs. The
  /// element lists the key pair IDs that CloudFront is aware of for each
  /// trusted signer. The `Signer` child element lists the AWS account number of
  /// the trusted signer (or an empty `Self` element if the signer is you). The
  /// `Signer` element also includes the IDs of any active key pairs associated
  /// with the trusted signer's AWS account. If no `KeyPairId` element appears
  /// for a `Signer`, that signer can't create working signed URLs.
  final ActiveTrustedSigners activeTrustedSigners;

  /// The current configuration information for the distribution. Send a `GET`
  /// request to the `/_CloudFront API version_/distribution ID/config`
  /// resource.
  final DistributionConfig distributionConfig;

  Distribution({
    @required this.id,
    @required this.arn,
    @required this.status,
    @required this.lastModifiedTime,
    @required this.inProgressInvalidationBatches,
    @required this.domainName,
    @required this.activeTrustedSigners,
    @required this.distributionConfig,
  });
  static Distribution fromJson(Map<String, dynamic> json) => Distribution(
        id: json['Id'] as String,
        arn: json['ARN'] as String,
        status: json['Status'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        inProgressInvalidationBatches:
            json['InProgressInvalidationBatches'] as int,
        domainName: json['DomainName'] as String,
        activeTrustedSigners:
            ActiveTrustedSigners.fromJson(json['ActiveTrustedSigners']),
        distributionConfig:
            DistributionConfig.fromJson(json['DistributionConfig']),
      );
}

/// A distribution configuration.
class DistributionConfig {
  /// A unique value (for example, a date-time stamp) that ensures that the
  /// request can't be replayed.
  ///
  /// If the value of `CallerReference` is new (regardless of the content of the
  /// `DistributionConfig` object), CloudFront creates a new distribution.
  ///
  /// If `CallerReference` is a value you already sent in a previous request to
  /// create a distribution, and if the content of the `DistributionConfig` is
  /// identical to the original request (ignoring white space), CloudFront
  /// returns the same the response that it returned to the original request.
  ///
  /// If `CallerReference` is a value you already sent in a previous request to
  /// create a distribution but the content of the `DistributionConfig` is
  /// different from the original request, CloudFront returns a
  /// `DistributionAlreadyExists` error.
  final String callerReference;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this distribution.
  final Aliases aliases;

  /// The object that you want CloudFront to request from your origin (for
  /// example, `index.html`) when a viewer requests the root URL for your
  /// distribution (`http://www.example.com`) instead of an object in your
  /// distribution (`http://www.example.com/product-description.html`).
  /// Specifying a default root object avoids exposing the contents of your
  /// distribution.
  ///
  /// Specify only the object name, for example, `index.html`. Don't add a `/`
  /// before the object name.
  ///
  /// If you don't want to specify a default root object when you create a
  /// distribution, include an empty `DefaultRootObject` element.
  ///
  /// To delete the default root object from an existing distribution, update
  /// the distribution configuration and include an empty `DefaultRootObject`
  /// element.
  ///
  /// To replace the default root object, update the distribution configuration
  /// and specify the new object.
  ///
  /// For more information about the default root object, see
  /// [Creating a Default Root Object](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DefaultRootObject.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final String defaultRootObject;

  /// A complex type that contains information about origins for this
  /// distribution.
  final Origins origins;

  /// A complex type that describes the default cache behavior if you don't
  /// specify a `CacheBehavior` element or if files don't match any of the
  /// values of `PathPattern` in `CacheBehavior` elements. You must create
  /// exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// A complex type that contains zero or more `CacheBehavior` elements.
  final CacheBehaviors cacheBehaviors;

  /// A complex type that controls the following:
  ///
  /// *   Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range
  /// with custom error messages before returning the response to the viewer.
  ///
  /// *   How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
  ///
  ///
  /// For more information about custom error pages, see
  /// [Customizing Error Responses](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final CustomErrorResponses customErrorResponses;

  /// Any comments you want to include about the distribution.
  ///
  /// If you don't want to specify a comment, include an empty `Comment`
  /// element.
  ///
  /// To delete an existing comment, update the distribution configuration and
  /// include an empty `Comment` element.
  ///
  /// To add or change a comment, update the distribution configuration and
  /// specify the new comment.
  final String comment;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  ///
  /// For more information about logging, see
  /// [Access Logs](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final LoggingConfig logging;

  /// The price class that corresponds with the maximum price that you want to
  /// pay for CloudFront service. If you specify `PriceClass_All`, CloudFront
  /// responds to requests for your objects from all CloudFront edge locations.
  ///
  /// If you specify a price class other than `PriceClass_All`, CloudFront
  /// serves your objects from the CloudFront edge location that has the lowest
  /// latency among the edge locations in your price class. Viewers who are in
  /// or near regions that are excluded from your specified price class may
  /// encounter slower performance.
  ///
  /// For more information about price classes, see
  /// [Choosing the Price Class for a CloudFront Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html)
  /// in the _Amazon CloudFront Developer Guide_. For information about
  /// CloudFront pricing, including how price classes map to CloudFront regions,
  /// see
  /// [Amazon CloudFront Pricing](https://aws.amazon.com/cloudfront/pricing/).
  final String priceClass;

  /// From this field, you can enable or disable the selected distribution.
  ///
  /// If you specify `false` for `Enabled` but you specify values for `Bucket`
  /// and `Prefix`, the values are automatically deleted.
  final bool enabled;

  final ViewerCertificate viewerCertificate;

  final Restrictions restrictions;

  /// A unique identifier that specifies the AWS WAF web ACL, if any, to
  /// associate with this distribution.
  ///
  /// AWS WAF is a web application firewall that lets you monitor the HTTP and
  /// HTTPS requests that are forwarded to CloudFront, and lets you control
  /// access to your content. Based on conditions that you specify, such as the
  /// IP addresses that requests originate from or the values of query strings,
  /// CloudFront responds to requests either with the requested content or with
  /// an HTTP 403 status code (Forbidden). You can also configure CloudFront to
  /// return a custom error page when a request is blocked. For more information
  /// about AWS WAF, see the
  /// [AWS WAF Developer Guide](http://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html).
  final String webAclId;

  /// (Optional) Specify the maximum HTTP version that you want viewers to use
  /// to communicate with CloudFront. The default value for new web
  /// distributions is http2. Viewers that don't support HTTP/2 automatically
  /// use an earlier HTTP version.
  ///
  /// For viewers and CloudFront to use HTTP/2, viewers must support TLS 1.2 or
  /// later, and must support Server Name Identification (SNI).
  ///
  /// In general, configuring CloudFront to communicate with viewers using
  /// HTTP/2 reduces latency. You can improve performance by optimizing for
  /// HTTP/2. For more information, do an Internet search for "http/2
  /// optimization."
  final String httpVersion;

  /// If you want CloudFront to respond to IPv6 DNS requests with an IPv6
  /// address for your distribution, specify `true`. If you specify `false`,
  /// CloudFront responds to IPv6 DNS requests with the DNS response code
  /// `NOERROR` and with no IP addresses. This allows viewers to submit a second
  /// request, for an IPv4 address for your distribution.
  ///
  /// In general, you should enable IPv6 if you have users on IPv6 networks who
  /// want to access your content. However, if you're using signed URLs or
  /// signed cookies to restrict access to your content, and if you're using a
  /// custom policy that includes the `IpAddress` parameter to restrict the IP
  /// addresses that can access your content, don't enable IPv6. If you want to
  /// restrict access to some content by IP address and not restrict access to
  /// other content (or restrict access but not by IP address), you can create
  /// two distributions. For more information, see
  /// [Creating a Signed URL Using a Custom Policy](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-creating-signed-url-custom-policy.html)
  /// in the _Amazon CloudFront Developer Guide_.
  ///
  /// If you're using an Amazon Route 53 alias resource record set to route
  /// traffic to your CloudFront distribution, you need to create a second alias
  /// resource record set when both of the following are true:
  ///
  /// *   You enable IPv6 for the distribution
  ///
  /// *   You're using alternate domain names in the URLs for your objects
  ///
  ///
  /// For more information, see
  /// [Routing Traffic to an Amazon CloudFront Web Distribution by Using Your Domain Name](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// If you created a CNAME resource record set, either with Amazon Route 53 or
  /// with another DNS service, you don't need to make any changes. A CNAME
  /// record will route traffic to your distribution regardless of the IP
  /// address format of the viewer request.
  final bool isIpv6Enabled;

  DistributionConfig({
    @required this.callerReference,
    this.aliases,
    this.defaultRootObject,
    @required this.origins,
    @required this.defaultCacheBehavior,
    this.cacheBehaviors,
    this.customErrorResponses,
    @required this.comment,
    this.logging,
    this.priceClass,
    @required this.enabled,
    this.viewerCertificate,
    this.restrictions,
    this.webAclId,
    this.httpVersion,
    this.isIpv6Enabled,
  });
  static DistributionConfig fromJson(Map<String, dynamic> json) =>
      DistributionConfig(
        callerReference: json['CallerReference'] as String,
        aliases: json.containsKey('Aliases')
            ? Aliases.fromJson(json['Aliases'])
            : null,
        defaultRootObject: json.containsKey('DefaultRootObject')
            ? json['DefaultRootObject'] as String
            : null,
        origins: Origins.fromJson(json['Origins']),
        defaultCacheBehavior:
            DefaultCacheBehavior.fromJson(json['DefaultCacheBehavior']),
        cacheBehaviors: json.containsKey('CacheBehaviors')
            ? CacheBehaviors.fromJson(json['CacheBehaviors'])
            : null,
        customErrorResponses: json.containsKey('CustomErrorResponses')
            ? CustomErrorResponses.fromJson(json['CustomErrorResponses'])
            : null,
        comment: json['Comment'] as String,
        logging: json.containsKey('Logging')
            ? LoggingConfig.fromJson(json['Logging'])
            : null,
        priceClass: json.containsKey('PriceClass')
            ? json['PriceClass'] as String
            : null,
        enabled: json['Enabled'] as bool,
        viewerCertificate: json.containsKey('ViewerCertificate')
            ? ViewerCertificate.fromJson(json['ViewerCertificate'])
            : null,
        restrictions: json.containsKey('Restrictions')
            ? Restrictions.fromJson(json['Restrictions'])
            : null,
        webAclId:
            json.containsKey('WebACLId') ? json['WebACLId'] as String : null,
        httpVersion: json.containsKey('HttpVersion')
            ? json['HttpVersion'] as String
            : null,
        isIpv6Enabled: json.containsKey('IsIPV6Enabled')
            ? json['IsIPV6Enabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A distribution Configuration and a list of tags to be associated with the
/// distribution.
class DistributionConfigWithTags {
  /// A distribution configuration.
  final DistributionConfig distributionConfig;

  /// A complex type that contains zero or more `Tag` elements.
  final Tags tags;

  DistributionConfigWithTags({
    @required this.distributionConfig,
    @required this.tags,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A distribution list.
class DistributionList {
  /// The value you provided for the `Marker` request parameter.
  final String marker;

  /// If `IsTruncated` is `true`, this element is present and contains the value
  /// you can use for the `Marker` request parameter to continue listing your
  /// distributions where they left off.
  final String nextMarker;

  /// The value you provided for the `MaxItems` request parameter.
  final int maxItems;

  /// A flag that indicates whether more distributions remain to be listed. If
  /// your results were truncated, you can make a follow-up pagination request
  /// using the `Marker` request parameter to retrieve more distributions in the
  /// list.
  final bool isTruncated;

  /// The number of distributions that were created by the current AWS account.
  final int quantity;

  /// A complex type that contains one `DistributionSummary` element for each
  /// distribution that was created by the current AWS account.
  final List<DistributionSummary> items;

  DistributionList({
    @required this.marker,
    this.nextMarker,
    @required this.maxItems,
    @required this.isTruncated,
    @required this.quantity,
    this.items,
  });
  static DistributionList fromJson(Map<String, dynamic> json) =>
      DistributionList(
        marker: json['Marker'] as String,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        isTruncated: json['IsTruncated'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => DistributionSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// A summary of the information about a CloudFront distribution.
class DistributionSummary {
  /// The identifier for the distribution. For example: `EDFDVBD632BHDS5`.
  final String id;

  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// `arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5`, where
  /// `123456789012` is your AWS account ID.
  final String arn;

  /// The current status of the distribution. When the status is `Deployed`, the
  /// distribution's information is propagated to all CloudFront edge locations.
  final String status;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// The domain name that corresponds to the distribution, for example,
  /// `d111111abcdef8.cloudfront.net`.
  final String domainName;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this distribution.
  final Aliases aliases;

  /// A complex type that contains information about origins for this
  /// distribution.
  final Origins origins;

  /// A complex type that describes the default cache behavior if you don't
  /// specify a `CacheBehavior` element or if files don't match any of the
  /// values of `PathPattern` in `CacheBehavior` elements. You must create
  /// exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// A complex type that contains zero or more `CacheBehavior` elements.
  final CacheBehaviors cacheBehaviors;

  /// A complex type that contains zero or more `CustomErrorResponses` elements.
  final CustomErrorResponses customErrorResponses;

  /// The comment originally specified when this distribution was created.
  final String comment;

  final String priceClass;

  /// Whether the distribution is enabled to accept user requests for content.
  final bool enabled;

  final ViewerCertificate viewerCertificate;

  final Restrictions restrictions;

  /// The Web ACL Id (if any) associated with the distribution.
  final String webAclId;

  ///  Specify the maximum HTTP version that you want viewers to use to
  /// communicate with CloudFront. The default value for new web distributions
  /// is `http2`. Viewers that don't support `HTTP/2` will automatically use an
  /// earlier version.
  final String httpVersion;

  /// Whether CloudFront responds to IPv6 DNS requests with an IPv6 address for
  /// your distribution.
  final bool isIpv6Enabled;

  DistributionSummary({
    @required this.id,
    @required this.arn,
    @required this.status,
    @required this.lastModifiedTime,
    @required this.domainName,
    @required this.aliases,
    @required this.origins,
    @required this.defaultCacheBehavior,
    @required this.cacheBehaviors,
    @required this.customErrorResponses,
    @required this.comment,
    @required this.priceClass,
    @required this.enabled,
    @required this.viewerCertificate,
    @required this.restrictions,
    @required this.webAclId,
    @required this.httpVersion,
    @required this.isIpv6Enabled,
  });
  static DistributionSummary fromJson(Map<String, dynamic> json) =>
      DistributionSummary(
        id: json['Id'] as String,
        arn: json['ARN'] as String,
        status: json['Status'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        domainName: json['DomainName'] as String,
        aliases: Aliases.fromJson(json['Aliases']),
        origins: Origins.fromJson(json['Origins']),
        defaultCacheBehavior:
            DefaultCacheBehavior.fromJson(json['DefaultCacheBehavior']),
        cacheBehaviors: CacheBehaviors.fromJson(json['CacheBehaviors']),
        customErrorResponses:
            CustomErrorResponses.fromJson(json['CustomErrorResponses']),
        comment: json['Comment'] as String,
        priceClass: json['PriceClass'] as String,
        enabled: json['Enabled'] as bool,
        viewerCertificate:
            ViewerCertificate.fromJson(json['ViewerCertificate']),
        restrictions: Restrictions.fromJson(json['Restrictions']),
        webAclId: json['WebACLId'] as String,
        httpVersion: json['HttpVersion'] as String,
        isIpv6Enabled: json['IsIPV6Enabled'] as bool,
      );
}

/// Complex data type for field-level encryption profiles that includes all of
/// the encryption entities.
class EncryptionEntities {
  /// Number of field pattern items in a field-level encryption content
  /// type-profile mapping.
  final int quantity;

  /// An array of field patterns in a field-level encryption content
  /// type-profile mapping.
  final List<EncryptionEntity> items;

  EncryptionEntities({
    @required this.quantity,
    this.items,
  });
  static EncryptionEntities fromJson(Map<String, dynamic> json) =>
      EncryptionEntities(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => EncryptionEntity.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Complex data type for field-level encryption profiles that includes the
/// encryption key and field pattern specifications.
class EncryptionEntity {
  /// The public key associated with a set of field-level encryption patterns,
  /// to be used when encrypting the fields that match the patterns.
  final String publicKeyId;

  /// The provider associated with the public key being used for encryption.
  /// This value must also be provided with the private key for applications to
  /// be able to decrypt data.
  final String providerId;

  /// Field patterns in a field-level encryption content type profile specify
  /// the fields that you want to be encrypted. You can provide the full field
  /// name, or any beginning characters followed by a wildcard (*). You can't
  /// overlap field patterns. For example, you can't have both ABC* and AB*.
  /// Note that field patterns are case-sensitive.
  final FieldPatterns fieldPatterns;

  EncryptionEntity({
    @required this.publicKeyId,
    @required this.providerId,
    @required this.fieldPatterns,
  });
  static EncryptionEntity fromJson(Map<String, dynamic> json) =>
      EncryptionEntity(
        publicKeyId: json['PublicKeyId'] as String,
        providerId: json['ProviderId'] as String,
        fieldPatterns: FieldPatterns.fromJson(json['FieldPatterns']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex data type that includes the profile configurations and other
/// options specified for field-level encryption.
class FieldLevelEncryption {
  /// The configuration ID for a field-level encryption configuration which
  /// includes a set of profiles that specify certain selected data fields to be
  /// encrypted by specific public keys.
  final String id;

  /// The last time the field-level encryption configuration was changed.
  final DateTime lastModifiedTime;

  /// A complex data type that includes the profile configurations specified for
  /// field-level encryption.
  final FieldLevelEncryptionConfig fieldLevelEncryptionConfig;

  FieldLevelEncryption({
    @required this.id,
    @required this.lastModifiedTime,
    @required this.fieldLevelEncryptionConfig,
  });
  static FieldLevelEncryption fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryption(
        id: json['Id'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        fieldLevelEncryptionConfig: FieldLevelEncryptionConfig.fromJson(
            json['FieldLevelEncryptionConfig']),
      );
}

/// A complex data type that includes the profile configurations specified for
/// field-level encryption.
class FieldLevelEncryptionConfig {
  /// A unique number that ensures the request can't be replayed.
  final String callerReference;

  /// An optional comment about the configuration.
  final String comment;

  /// A complex data type that specifies when to forward content if a profile
  /// isn't found and the profile that can be provided as a query argument in a
  /// request.
  final QueryArgProfileConfig queryArgProfileConfig;

  /// A complex data type that specifies when to forward content if a content
  /// type isn't recognized and profiles to use as by default in a request if a
  /// query argument doesn't specify a profile to use.
  final ContentTypeProfileConfig contentTypeProfileConfig;

  FieldLevelEncryptionConfig({
    @required this.callerReference,
    this.comment,
    this.queryArgProfileConfig,
    this.contentTypeProfileConfig,
  });
  static FieldLevelEncryptionConfig fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryptionConfig(
        callerReference: json['CallerReference'] as String,
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
        queryArgProfileConfig: json.containsKey('QueryArgProfileConfig')
            ? QueryArgProfileConfig.fromJson(json['QueryArgProfileConfig'])
            : null,
        contentTypeProfileConfig: json.containsKey('ContentTypeProfileConfig')
            ? ContentTypeProfileConfig.fromJson(
                json['ContentTypeProfileConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// List of field-level encrpytion configurations.
class FieldLevelEncryptionList {
  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the `Marker` request parameter to
  /// continue listing your configurations where you left off.
  final String nextMarker;

  /// The maximum number of elements you want in the response body.
  final int maxItems;

  /// The number of field-level encryption items.
  final int quantity;

  /// An array of field-level encryption items.
  final List<FieldLevelEncryptionSummary> items;

  FieldLevelEncryptionList({
    this.nextMarker,
    @required this.maxItems,
    @required this.quantity,
    this.items,
  });
  static FieldLevelEncryptionList fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryptionList(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => FieldLevelEncryptionSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// A complex data type for field-level encryption profiles.
class FieldLevelEncryptionProfile {
  /// The ID for a field-level encryption profile configuration which includes a
  /// set of profiles that specify certain selected data fields to be encrypted
  /// by specific public keys.
  final String id;

  /// The last time the field-level encryption profile was updated.
  final DateTime lastModifiedTime;

  /// A complex data type that includes the profile name and the encryption
  /// entities for the field-level encryption profile.
  final FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig;

  FieldLevelEncryptionProfile({
    @required this.id,
    @required this.lastModifiedTime,
    @required this.fieldLevelEncryptionProfileConfig,
  });
  static FieldLevelEncryptionProfile fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryptionProfile(
        id: json['Id'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        fieldLevelEncryptionProfileConfig:
            FieldLevelEncryptionProfileConfig.fromJson(
                json['FieldLevelEncryptionProfileConfig']),
      );
}

/// A complex data type of profiles for the field-level encryption.
class FieldLevelEncryptionProfileConfig {
  /// Profile name for the field-level encryption profile.
  final String name;

  /// A unique number that ensures the request can't be replayed.
  final String callerReference;

  /// An optional comment for the field-level encryption profile.
  final String comment;

  /// A complex data type of encryption entities for the field-level encryption
  /// profile that include the public key ID, provider, and field patterns for
  /// specifying which fields to encrypt with this key.
  final EncryptionEntities encryptionEntities;

  FieldLevelEncryptionProfileConfig({
    @required this.name,
    @required this.callerReference,
    this.comment,
    @required this.encryptionEntities,
  });
  static FieldLevelEncryptionProfileConfig fromJson(
          Map<String, dynamic> json) =>
      FieldLevelEncryptionProfileConfig(
        name: json['Name'] as String,
        callerReference: json['CallerReference'] as String,
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
        encryptionEntities:
            EncryptionEntities.fromJson(json['EncryptionEntities']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// List of field-level encryption profiles.
class FieldLevelEncryptionProfileList {
  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the `Marker` request parameter to
  /// continue listing your profiles where you left off.
  final String nextMarker;

  /// The maximum number of field-level encryption profiles you want in the
  /// response body.
  final int maxItems;

  /// The number of field-level encryption profiles.
  final int quantity;

  /// The field-level encryption profile items.
  final List<FieldLevelEncryptionProfileSummary> items;

  FieldLevelEncryptionProfileList({
    this.nextMarker,
    @required this.maxItems,
    @required this.quantity,
    this.items,
  });
  static FieldLevelEncryptionProfileList fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryptionProfileList(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => FieldLevelEncryptionProfileSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// The field-level encryption profile summary.
class FieldLevelEncryptionProfileSummary {
  /// ID for the field-level encryption profile summary.
  final String id;

  /// The time when the the field-level encryption profile summary was last
  /// updated.
  final DateTime lastModifiedTime;

  /// Name for the field-level encryption profile summary.
  final String name;

  /// A complex data type of encryption entities for the field-level encryption
  /// profile that include the public key ID, provider, and field patterns for
  /// specifying which fields to encrypt with this key.
  final EncryptionEntities encryptionEntities;

  /// An optional comment for the field-level encryption profile summary.
  final String comment;

  FieldLevelEncryptionProfileSummary({
    @required this.id,
    @required this.lastModifiedTime,
    @required this.name,
    @required this.encryptionEntities,
    this.comment,
  });
  static FieldLevelEncryptionProfileSummary fromJson(
          Map<String, dynamic> json) =>
      FieldLevelEncryptionProfileSummary(
        id: json['Id'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        name: json['Name'] as String,
        encryptionEntities:
            EncryptionEntities.fromJson(json['EncryptionEntities']),
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
      );
}

/// A summary of a field-level encryption item.
class FieldLevelEncryptionSummary {
  /// The unique ID of a field-level encryption item.
  final String id;

  /// The last time that the summary of field-level encryption items was
  /// modified.
  final DateTime lastModifiedTime;

  /// An optional comment about the field-level encryption item.
  final String comment;

  ///  A summary of a query argument-profile mapping.
  final QueryArgProfileConfig queryArgProfileConfig;

  ///  A summary of a content type-profile mapping.
  final ContentTypeProfileConfig contentTypeProfileConfig;

  FieldLevelEncryptionSummary({
    @required this.id,
    @required this.lastModifiedTime,
    this.comment,
    this.queryArgProfileConfig,
    this.contentTypeProfileConfig,
  });
  static FieldLevelEncryptionSummary fromJson(Map<String, dynamic> json) =>
      FieldLevelEncryptionSummary(
        id: json['Id'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
        queryArgProfileConfig: json.containsKey('QueryArgProfileConfig')
            ? QueryArgProfileConfig.fromJson(json['QueryArgProfileConfig'])
            : null,
        contentTypeProfileConfig: json.containsKey('ContentTypeProfileConfig')
            ? ContentTypeProfileConfig.fromJson(
                json['ContentTypeProfileConfig'])
            : null,
      );
}

/// A complex data type that includes the field patterns to match for
/// field-level encryption.
class FieldPatterns {
  /// The number of field-level encryption field patterns.
  final int quantity;

  /// An array of the field-level encryption field patterns.
  final List<String> items;

  FieldPatterns({
    @required this.quantity,
    this.items,
  });
  static FieldPatterns fromJson(Map<String, dynamic> json) => FieldPatterns(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that specifies how CloudFront handles query strings and
/// cookies.
class ForwardedValues {
  /// Indicates whether you want CloudFront to forward query strings to the
  /// origin that is associated with this cache behavior and cache based on the
  /// query string parameters. CloudFront behavior depends on the value of
  /// `QueryString` and on the values that you specify for
  /// `QueryStringCacheKeys`, if any:
  ///
  /// If you specify true for `QueryString` and you don't specify any values for
  /// `QueryStringCacheKeys`, CloudFront forwards all query string parameters to
  /// the origin and caches based on all query string parameters. Depending on
  /// how many query string parameters and values you have, this can adversely
  /// affect performance because CloudFront must forward more requests to the
  /// origin.
  ///
  /// If you specify true for `QueryString` and you specify one or more values
  /// for `QueryStringCacheKeys`, CloudFront forwards all query string
  /// parameters to the origin, but it only caches based on the query string
  /// parameters that you specify.
  ///
  /// If you specify false for `QueryString`, CloudFront doesn't forward any
  /// query string parameters to the origin, and doesn't cache based on query
  /// string parameters.
  ///
  /// For more information, see
  /// [Configuring CloudFront to Cache Based on Query String Parameters](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/QueryStringParameters.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final bool queryString;

  /// A complex type that specifies whether you want CloudFront to forward
  /// cookies to the origin and, if so, which ones. For more information about
  /// forwarding cookies to the origin, see
  /// [How CloudFront Forwards, Caches, and Logs Cookies](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final CookiePreference cookies;

  /// A complex type that specifies the `Headers`, if any, that you want
  /// CloudFront to base caching on for this cache behavior.
  final Headers headers;

  /// A complex type that contains information about the query string parameters
  /// that you want CloudFront to use for caching for this cache behavior.
  final QueryStringCacheKeys queryStringCacheKeys;

  ForwardedValues({
    @required this.queryString,
    @required this.cookies,
    this.headers,
    this.queryStringCacheKeys,
  });
  static ForwardedValues fromJson(Map<String, dynamic> json) => ForwardedValues(
        queryString: json['QueryString'] as bool,
        cookies: CookiePreference.fromJson(json['Cookies']),
        headers: json.containsKey('Headers')
            ? Headers.fromJson(json['Headers'])
            : null,
        queryStringCacheKeys: json.containsKey('QueryStringCacheKeys')
            ? QueryStringCacheKeys.fromJson(json['QueryStringCacheKeys'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that controls the countries in which your content is
/// distributed. CloudFront determines the location of your users using
/// `MaxMind` GeoIP databases.
class GeoRestriction {
  /// The method that you want to use to restrict distribution of your content
  /// by country:
  ///
  /// *    `none`: No geo restriction is enabled, meaning access to content is
  /// not restricted by client geo location.
  ///
  /// *    `blacklist`: The `Location` elements specify the countries in which
  /// you don't want CloudFront to distribute your content.
  ///
  /// *    `whitelist`: The `Location` elements specify the countries in which
  /// you want CloudFront to distribute your content.
  final String restrictionType;

  /// When geo restriction is `enabled`, this is the number of countries in your
  /// `whitelist` or `blacklist`. Otherwise, when it is not enabled, `Quantity`
  /// is `0`, and you can omit `Items`.
  final int quantity;

  ///  A complex type that contains a `Location` element for each country in
  /// which you want CloudFront either to distribute your content (`whitelist`)
  /// or not distribute your content (`blacklist`).
  ///
  /// The `Location` element is a two-letter, uppercase country code for a
  /// country that you want to include in your `blacklist` or `whitelist`.
  /// Include one `Location` element for each country.
  ///
  /// CloudFront and `MaxMind` both use `ISO 3166` country codes. For the
  /// current list of countries and the corresponding codes, see `ISO
  /// 3166-1-alpha-2` code on the _International Organization for
  /// Standardization_ website. You can also refer to the country list on the
  /// CloudFront console, which includes both country names and codes.
  final List<String> items;

  GeoRestriction({
    @required this.restrictionType,
    @required this.quantity,
    this.items,
  });
  static GeoRestriction fromJson(Map<String, dynamic> json) => GeoRestriction(
        restrictionType: json['RestrictionType'] as String,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityConfigResult {
  /// The origin access identity's configuration information.
  final CloudFrontOriginAccessIdentityConfig
      cloudFrontOriginAccessIdentityConfig;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetCloudFrontOriginAccessIdentityConfigResult({
    this.cloudFrontOriginAccessIdentityConfig,
    this.eTag,
  });
  static GetCloudFrontOriginAccessIdentityConfigResult fromJson(
          Map<String, dynamic> json) =>
      GetCloudFrontOriginAccessIdentityConfigResult(
        cloudFrontOriginAccessIdentityConfig:
            json.containsKey('CloudFrontOriginAccessIdentityConfig')
                ? CloudFrontOriginAccessIdentityConfig.fromJson(
                    json['CloudFrontOriginAccessIdentityConfig'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The current version of the origin access identity's information. For
  /// example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });
  static GetCloudFrontOriginAccessIdentityResult fromJson(
          Map<String, dynamic> json) =>
      GetCloudFrontOriginAccessIdentityResult(
        cloudFrontOriginAccessIdentity:
            json.containsKey('CloudFrontOriginAccessIdentity')
                ? CloudFrontOriginAccessIdentity.fromJson(
                    json['CloudFrontOriginAccessIdentity'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetDistributionConfigResult {
  /// The distribution's configuration information.
  final DistributionConfig distributionConfig;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetDistributionConfigResult({
    this.distributionConfig,
    this.eTag,
  });
  static GetDistributionConfigResult fromJson(Map<String, dynamic> json) =>
      GetDistributionConfigResult(
        distributionConfig: json.containsKey('DistributionConfig')
            ? DistributionConfig.fromJson(json['DistributionConfig'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the distribution's information. For example:
  /// `E2QWRUHAPOMQZL`.
  final String eTag;

  GetDistributionResult({
    this.distribution,
    this.eTag,
  });
  static GetDistributionResult fromJson(Map<String, dynamic> json) =>
      GetDistributionResult(
        distribution: json.containsKey('Distribution')
            ? Distribution.fromJson(json['Distribution'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class GetFieldLevelEncryptionConfigResult {
  /// Return the field-level encryption configuration information.
  final FieldLevelEncryptionConfig fieldLevelEncryptionConfig;

  /// The current version of the field level encryption configuration. For
  /// example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetFieldLevelEncryptionConfigResult({
    this.fieldLevelEncryptionConfig,
    this.eTag,
  });
  static GetFieldLevelEncryptionConfigResult fromJson(
          Map<String, dynamic> json) =>
      GetFieldLevelEncryptionConfigResult(
        fieldLevelEncryptionConfig:
            json.containsKey('FieldLevelEncryptionConfig')
                ? FieldLevelEncryptionConfig.fromJson(
                    json['FieldLevelEncryptionConfig'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class GetFieldLevelEncryptionProfileConfigResult {
  /// Return the field-level encryption profile configuration information.
  final FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig;

  /// The current version of the field-level encryption profile configuration
  /// result. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetFieldLevelEncryptionProfileConfigResult({
    this.fieldLevelEncryptionProfileConfig,
    this.eTag,
  });
  static GetFieldLevelEncryptionProfileConfigResult fromJson(
          Map<String, dynamic> json) =>
      GetFieldLevelEncryptionProfileConfigResult(
        fieldLevelEncryptionProfileConfig:
            json.containsKey('FieldLevelEncryptionProfileConfig')
                ? FieldLevelEncryptionProfileConfig.fromJson(
                    json['FieldLevelEncryptionProfileConfig'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class GetFieldLevelEncryptionProfileResult {
  /// Return the field-level encryption profile information.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  /// The current version of the field level encryption profile. For example:
  /// `E2QWRUHAPOMQZL`.
  final String eTag;

  GetFieldLevelEncryptionProfileResult({
    this.fieldLevelEncryptionProfile,
    this.eTag,
  });
  static GetFieldLevelEncryptionProfileResult fromJson(
          Map<String, dynamic> json) =>
      GetFieldLevelEncryptionProfileResult(
        fieldLevelEncryptionProfile:
            json.containsKey('FieldLevelEncryptionProfile')
                ? FieldLevelEncryptionProfile.fromJson(
                    json['FieldLevelEncryptionProfile'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class GetFieldLevelEncryptionResult {
  /// Return the field-level encryption configuration information.
  final FieldLevelEncryption fieldLevelEncryption;

  /// The current version of the field level encryption configuration. For
  /// example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetFieldLevelEncryptionResult({
    this.fieldLevelEncryption,
    this.eTag,
  });
  static GetFieldLevelEncryptionResult fromJson(Map<String, dynamic> json) =>
      GetFieldLevelEncryptionResult(
        fieldLevelEncryption: json.containsKey('FieldLevelEncryption')
            ? FieldLevelEncryption.fromJson(json['FieldLevelEncryption'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetInvalidationResult {
  /// The invalidation's information. For more information, see
  /// [Invalidation Complex Type](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/InvalidationDatatype.html).
  final Invalidation invalidation;

  GetInvalidationResult({
    this.invalidation,
  });
  static GetInvalidationResult fromJson(Map<String, dynamic> json) =>
      GetInvalidationResult(
        invalidation: json.containsKey('Invalidation')
            ? Invalidation.fromJson(json['Invalidation'])
            : null,
      );
}

class GetPublicKeyConfigResult {
  /// Return the result for the public key configuration.
  final PublicKeyConfig publicKeyConfig;

  /// The current version of the public key configuration. For example:
  /// `E2QWRUHAPOMQZL`.
  final String eTag;

  GetPublicKeyConfigResult({
    this.publicKeyConfig,
    this.eTag,
  });
  static GetPublicKeyConfigResult fromJson(Map<String, dynamic> json) =>
      GetPublicKeyConfigResult(
        publicKeyConfig: json.containsKey('PublicKeyConfig')
            ? PublicKeyConfig.fromJson(json['PublicKeyConfig'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class GetPublicKeyResult {
  /// Return the public key.
  final PublicKey publicKey;

  /// The current version of the public key. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetPublicKeyResult({
    this.publicKey,
    this.eTag,
  });
  static GetPublicKeyResult fromJson(Map<String, dynamic> json) =>
      GetPublicKeyResult(
        publicKey: json.containsKey('PublicKey')
            ? PublicKey.fromJson(json['PublicKey'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetStreamingDistributionConfigResult {
  /// The streaming distribution's configuration information.
  final StreamingDistributionConfig streamingDistributionConfig;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetStreamingDistributionConfigResult({
    this.streamingDistributionConfig,
    this.eTag,
  });
  static GetStreamingDistributionConfigResult fromJson(
          Map<String, dynamic> json) =>
      GetStreamingDistributionConfigResult(
        streamingDistributionConfig:
            json.containsKey('StreamingDistributionConfig')
                ? StreamingDistributionConfig.fromJson(
                    json['StreamingDistributionConfig'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class GetStreamingDistributionResult {
  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  /// The current version of the streaming distribution's information. For
  /// example: `E2QWRUHAPOMQZL`.
  final String eTag;

  GetStreamingDistributionResult({
    this.streamingDistribution,
    this.eTag,
  });
  static GetStreamingDistributionResult fromJson(Map<String, dynamic> json) =>
      GetStreamingDistributionResult(
        streamingDistribution: json.containsKey('StreamingDistribution')
            ? StreamingDistribution.fromJson(json['StreamingDistribution'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// A complex type that specifies the request headers, if any, that you want
/// CloudFront to base caching on for this cache behavior.
///
/// For the headers that you specify, CloudFront caches separate versions of a
/// specified object based on the header values in viewer requests. For example,
/// suppose viewer requests for `logo.jpg` contain a custom `product` header
/// that has a value of either `acme` or `apex`, and you configure CloudFront to
/// cache your content based on values in the `product` header. CloudFront
/// forwards the `product` header to the origin and caches the response from the
/// origin once for each header value. For more information about caching based
/// on header values, see
/// [How CloudFront Forwards and Caches Headers](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html)
/// in the _Amazon CloudFront Developer Guide_.
class Headers {
  /// The number of different headers that you want CloudFront to base caching
  /// on for this cache behavior. You can configure each cache behavior in a web
  /// distribution to do one of the following:
  ///
  /// *    **Forward all headers to your origin**: Specify `1` for `Quantity`
  /// and `*` for `Name`.
  ///
  ///      CloudFront doesn't cache the objects that are associated with this
  /// cache behavior. Instead, CloudFront sends every request to the origin.
  /// *    **Forward a whitelist of headers you specify**: Specify the number of
  /// headers that you want CloudFront to base caching on. Then specify the
  /// header names in `Name` elements. CloudFront caches your objects based on
  /// the values in the specified headers.
  ///
  /// *    **Forward only the default headers**: Specify `0` for `Quantity` and
  /// omit `Items`. In this configuration, CloudFront doesn't cache based on the
  /// values in the request headers.
  ///
  ///
  /// Regardless of which option you choose, CloudFront forwards headers to your
  /// origin based on whether the origin is an S3 bucket or a custom origin. See
  /// the following documentation:
  ///
  /// *    **S3 bucket**: See
  /// [HTTP Request Headers That CloudFront Removes or Updates](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorS3Origin.html#request-s3-removed-headers)
  ///
  /// *    **Custom origin**: See
  /// [HTTP Request Headers and CloudFront Behavior](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorCustomOrigin.html#request-custom-headers-behavior)
  final int quantity;

  /// A list that contains one `Name` element for each header that you want
  /// CloudFront to use for caching in this cache behavior. If `Quantity` is
  /// `0`, omit `Items`.
  final List<String> items;

  Headers({
    @required this.quantity,
    this.items,
  });
  static Headers fromJson(Map<String, dynamic> json) => Headers(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An invalidation.
class Invalidation {
  /// The identifier for the invalidation request. For example:
  /// `IDFDVBD632BHDS5`.
  final String id;

  /// The status of the invalidation request. When the invalidation batch is
  /// finished, the status is `Completed`.
  final String status;

  /// The date and time the invalidation request was first made.
  final DateTime createTime;

  /// The current invalidation information for the batch request.
  final InvalidationBatch invalidationBatch;

  Invalidation({
    @required this.id,
    @required this.status,
    @required this.createTime,
    @required this.invalidationBatch,
  });
  static Invalidation fromJson(Map<String, dynamic> json) => Invalidation(
        id: json['Id'] as String,
        status: json['Status'] as String,
        createTime: DateTime.parse(json['CreateTime']),
        invalidationBatch:
            InvalidationBatch.fromJson(json['InvalidationBatch']),
      );
}

/// An invalidation batch.
class InvalidationBatch {
  /// A complex type that contains information about the objects that you want
  /// to invalidate. For more information, see
  /// [Specifying the Objects to Invalidate](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects)
  /// in the _Amazon CloudFront Developer Guide_.
  final Paths paths;

  /// A value that you specify to uniquely identify an invalidation request.
  /// CloudFront uses the value to prevent you from accidentally resubmitting an
  /// identical request. Whenever you create a new invalidation request, you
  /// must specify a new value for `CallerReference` and change other values in
  /// the request as applicable. One way to ensure that the value of
  /// `CallerReference` is unique is to use a `timestamp`, for example,
  /// `20120301090000`.
  ///
  /// If you make a second invalidation request with the same value for
  /// `CallerReference`, and if the rest of the request is the same, CloudFront
  /// doesn't create a new invalidation request. Instead, CloudFront returns
  /// information about the invalidation request that you previously created
  /// with the same `CallerReference`.
  ///
  /// If `CallerReference` is a value you already sent in a previous
  /// invalidation batch request but the content of any `Path` is different from
  /// the original request, CloudFront returns an
  /// `InvalidationBatchAlreadyExists` error.
  final String callerReference;

  InvalidationBatch({
    @required this.paths,
    @required this.callerReference,
  });
  static InvalidationBatch fromJson(Map<String, dynamic> json) =>
      InvalidationBatch(
        paths: Paths.fromJson(json['Paths']),
        callerReference: json['CallerReference'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The `InvalidationList` complex type describes the list of invalidation
/// objects. For more information about invalidation, see
/// [Invalidating Objects (Web Distributions Only)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html)
/// in the _Amazon CloudFront Developer Guide_.
class InvalidationList {
  /// The value that you provided for the `Marker` request parameter.
  final String marker;

  /// If `IsTruncated` is `true`, this element is present and contains the value
  /// that you can use for the `Marker` request parameter to continue listing
  /// your invalidation batches where they left off.
  final String nextMarker;

  /// The value that you provided for the `MaxItems` request parameter.
  final int maxItems;

  /// A flag that indicates whether more invalidation batch requests remain to
  /// be listed. If your results were truncated, you can make a follow-up
  /// pagination request using the `Marker` request parameter to retrieve more
  /// invalidation batches in the list.
  final bool isTruncated;

  /// The number of invalidation batches that were created by the current AWS
  /// account.
  final int quantity;

  /// A complex type that contains one `InvalidationSummary` element for each
  /// invalidation batch created by the current AWS account.
  final List<InvalidationSummary> items;

  InvalidationList({
    @required this.marker,
    this.nextMarker,
    @required this.maxItems,
    @required this.isTruncated,
    @required this.quantity,
    this.items,
  });
  static InvalidationList fromJson(Map<String, dynamic> json) =>
      InvalidationList(
        marker: json['Marker'] as String,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        isTruncated: json['IsTruncated'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => InvalidationSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// A summary of an invalidation request.
class InvalidationSummary {
  /// The unique ID for an invalidation request.
  final String id;

  final DateTime createTime;

  /// The status of an invalidation request.
  final String status;

  InvalidationSummary({
    @required this.id,
    @required this.createTime,
    @required this.status,
  });
  static InvalidationSummary fromJson(Map<String, dynamic> json) =>
      InvalidationSummary(
        id: json['Id'] as String,
        createTime: DateTime.parse(json['CreateTime']),
        status: json['Status'] as String,
      );
}

/// A complex type that lists the active CloudFront key pairs, if any, that are
/// associated with `AwsAccountNumber`.
///
/// For more information, see ActiveTrustedSigners.
class KeyPairIds {
  /// The number of active CloudFront key pairs for `AwsAccountNumber`.
  ///
  /// For more information, see ActiveTrustedSigners.
  final int quantity;

  /// A complex type that lists the active CloudFront key pairs, if any, that
  /// are associated with `AwsAccountNumber`.
  ///
  /// For more information, see ActiveTrustedSigners.
  final List<String> items;

  KeyPairIds({
    @required this.quantity,
    this.items,
  });
  static KeyPairIds fromJson(Map<String, dynamic> json) => KeyPairIds(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// A complex type that contains a Lambda function association.
class LambdaFunctionAssociation {
  /// The ARN of the Lambda function. You must specify the ARN of a function
  /// version; you can't specify a Lambda alias or $LATEST.
  final String lambdaFunctionArn;

  /// Specifies the event type that triggers a Lambda function invocation. You
  /// can specify the following values:
  ///
  /// *    `viewer-request`: The function executes when CloudFront receives a
  /// request from a viewer and before it checks to see whether the requested
  /// object is in the edge cache.
  ///
  /// *    `origin-request`: The function executes only when CloudFront forwards
  /// a request to your origin. When the requested object is in the edge cache,
  /// the function doesn't execute.
  ///
  /// *    `origin-response`: The function executes after CloudFront receives a
  /// response from the origin and before it caches the object in the response.
  /// When the requested object is in the edge cache, the function doesn't
  /// execute.
  ///
  ///     If the origin returns an HTTP status code other than HTTP 200 (OK),
  /// the function doesn't execute.
  ///
  /// *    `viewer-response`: The function executes before CloudFront returns
  /// the requested object to the viewer. The function executes regardless of
  /// whether the object was already in the edge cache.
  ///
  ///     If the origin returns an HTTP status code other than HTTP 200 (OK),
  /// the function doesn't execute.
  final String eventType;

  LambdaFunctionAssociation({
    @required this.lambdaFunctionArn,
    @required this.eventType,
  });
  static LambdaFunctionAssociation fromJson(Map<String, dynamic> json) =>
      LambdaFunctionAssociation(
        lambdaFunctionArn: json['LambdaFunctionARN'] as String,
        eventType: json['EventType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that specifies a list of Lambda functions associations for a
/// cache behavior.
///
/// If you want to invoke one or more Lambda functions triggered by requests
/// that match the `PathPattern` of the cache behavior, specify the applicable
/// values for `Quantity` and `Items`. Note that there can be up to 4
/// `LambdaFunctionAssociation` items in this list (one for each possible value
/// of `EventType`) and each `EventType` can be associated with the Lambda
/// function only once.
///
/// If you don't want to invoke any Lambda functions for the requests that match
/// `PathPattern`, specify `0` for `Quantity` and omit `Items`.
class LambdaFunctionAssociations {
  /// The number of Lambda function associations for this cache behavior.
  final int quantity;

  ///  **Optional**: A complex type that contains `LambdaFunctionAssociation`
  /// items for this cache behavior. If `Quantity` is `0`, you can omit `Items`.
  final List<LambdaFunctionAssociation> items;

  LambdaFunctionAssociations({
    @required this.quantity,
    this.items,
  });
  static LambdaFunctionAssociations fromJson(Map<String, dynamic> json) =>
      LambdaFunctionAssociations(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => LambdaFunctionAssociation.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The returned result of the corresponding request.
class ListCloudFrontOriginAccessIdentitiesResult {
  /// The `CloudFrontOriginAccessIdentityList` type.
  final CloudFrontOriginAccessIdentityList cloudFrontOriginAccessIdentityList;

  ListCloudFrontOriginAccessIdentitiesResult({
    this.cloudFrontOriginAccessIdentityList,
  });
  static ListCloudFrontOriginAccessIdentitiesResult fromJson(
          Map<String, dynamic> json) =>
      ListCloudFrontOriginAccessIdentitiesResult(
        cloudFrontOriginAccessIdentityList:
            json.containsKey('CloudFrontOriginAccessIdentityList')
                ? CloudFrontOriginAccessIdentityList.fromJson(
                    json['CloudFrontOriginAccessIdentityList'])
                : null,
      );
}

/// The response to a request to list the distributions that are associated with
/// a specified AWS WAF web ACL.
class ListDistributionsByWebAclIdResult {
  /// The `DistributionList` type.
  final DistributionList distributionList;

  ListDistributionsByWebAclIdResult({
    this.distributionList,
  });
  static ListDistributionsByWebAclIdResult fromJson(
          Map<String, dynamic> json) =>
      ListDistributionsByWebAclIdResult(
        distributionList: json.containsKey('DistributionList')
            ? DistributionList.fromJson(json['DistributionList'])
            : null,
      );
}

/// The returned result of the corresponding request.
class ListDistributionsResult {
  /// The `DistributionList` type.
  final DistributionList distributionList;

  ListDistributionsResult({
    this.distributionList,
  });
  static ListDistributionsResult fromJson(Map<String, dynamic> json) =>
      ListDistributionsResult(
        distributionList: json.containsKey('DistributionList')
            ? DistributionList.fromJson(json['DistributionList'])
            : null,
      );
}

class ListFieldLevelEncryptionConfigsResult {
  /// Returns a list of all field-level encryption configurations that have been
  /// created in CloudFront for this account.
  final FieldLevelEncryptionList fieldLevelEncryptionList;

  ListFieldLevelEncryptionConfigsResult({
    this.fieldLevelEncryptionList,
  });
  static ListFieldLevelEncryptionConfigsResult fromJson(
          Map<String, dynamic> json) =>
      ListFieldLevelEncryptionConfigsResult(
        fieldLevelEncryptionList: json.containsKey('FieldLevelEncryptionList')
            ? FieldLevelEncryptionList.fromJson(
                json['FieldLevelEncryptionList'])
            : null,
      );
}

class ListFieldLevelEncryptionProfilesResult {
  /// Returns a list of the field-level encryption profiles that have been
  /// created in CloudFront for this account.
  final FieldLevelEncryptionProfileList fieldLevelEncryptionProfileList;

  ListFieldLevelEncryptionProfilesResult({
    this.fieldLevelEncryptionProfileList,
  });
  static ListFieldLevelEncryptionProfilesResult fromJson(
          Map<String, dynamic> json) =>
      ListFieldLevelEncryptionProfilesResult(
        fieldLevelEncryptionProfileList:
            json.containsKey('FieldLevelEncryptionProfileList')
                ? FieldLevelEncryptionProfileList.fromJson(
                    json['FieldLevelEncryptionProfileList'])
                : null,
      );
}

/// The returned result of the corresponding request.
class ListInvalidationsResult {
  /// Information about invalidation batches.
  final InvalidationList invalidationList;

  ListInvalidationsResult({
    this.invalidationList,
  });
  static ListInvalidationsResult fromJson(Map<String, dynamic> json) =>
      ListInvalidationsResult(
        invalidationList: json.containsKey('InvalidationList')
            ? InvalidationList.fromJson(json['InvalidationList'])
            : null,
      );
}

class ListPublicKeysResult {
  /// Returns a list of all public keys that have been added to CloudFront for
  /// this account.
  final PublicKeyList publicKeyList;

  ListPublicKeysResult({
    this.publicKeyList,
  });
  static ListPublicKeysResult fromJson(Map<String, dynamic> json) =>
      ListPublicKeysResult(
        publicKeyList: json.containsKey('PublicKeyList')
            ? PublicKeyList.fromJson(json['PublicKeyList'])
            : null,
      );
}

/// The returned result of the corresponding request.
class ListStreamingDistributionsResult {
  /// The `StreamingDistributionList` type.
  final StreamingDistributionList streamingDistributionList;

  ListStreamingDistributionsResult({
    this.streamingDistributionList,
  });
  static ListStreamingDistributionsResult fromJson(Map<String, dynamic> json) =>
      ListStreamingDistributionsResult(
        streamingDistributionList: json.containsKey('StreamingDistributionList')
            ? StreamingDistributionList.fromJson(
                json['StreamingDistributionList'])
            : null,
      );
}

///  The returned result of the corresponding request.
class ListTagsForResourceResult {
  ///  A complex type that contains zero or more `Tag` elements.
  final Tags tags;

  ListTagsForResourceResult({
    @required this.tags,
  });
  static ListTagsForResourceResult fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResult(
        tags: Tags.fromJson(json['Tags']),
      );
}

/// A complex type that controls whether access logs are written for the
/// distribution.
class LoggingConfig {
  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you don't want to enable logging when you create a distribution
  /// or if you want to disable logging for an existing distribution, specify
  /// `false` for `Enabled`, and specify empty `Bucket` and `Prefix` elements.
  /// If you specify `false` for `Enabled` but you specify values for `Bucket`,
  /// `prefix`, and `IncludeCookies`, the values are automatically deleted.
  final bool enabled;

  /// Specifies whether you want CloudFront to include cookies in access logs,
  /// specify `true` for `IncludeCookies`. If you choose to include cookies in
  /// logs, CloudFront logs all cookies regardless of how you configure the
  /// cache behaviors for this distribution. If you don't want to include
  /// cookies when you create a distribution or if you want to disable include
  /// cookies for an existing distribution, specify `false` for
  /// `IncludeCookies`.
  final bool includeCookies;

  /// The Amazon S3 bucket to store the access logs in, for example,
  /// `myawslogbucket.s3.amazonaws.com`.
  final String bucket;

  /// An optional string that you want CloudFront to prefix to the access log
  /// `filenames` for this distribution, for example, `myprefix/`. If you want
  /// to enable logging, but you don't want to specify a prefix, you still must
  /// include an empty `Prefix` element in the `Logging` element.
  final String prefix;

  LoggingConfig({
    @required this.enabled,
    @required this.includeCookies,
    @required this.bucket,
    @required this.prefix,
  });
  static LoggingConfig fromJson(Map<String, dynamic> json) => LoggingConfig(
        enabled: json['Enabled'] as bool,
        includeCookies: json['IncludeCookies'] as bool,
        bucket: json['Bucket'] as String,
        prefix: json['Prefix'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that describes the Amazon S3 bucket or the HTTP server (for
/// example, a web server) from which CloudFront gets your files. You must
/// create at least one origin.
///
/// For the current limit on the number of origins that you can create for a
/// distribution, see
/// [Amazon CloudFront Limits](http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront)
/// in the _AWS General Reference_.
class Origin {
  /// A unique identifier for the origin. The value of `Id` must be unique
  /// within the distribution.
  ///
  /// When you specify the value of `TargetOriginId` for the default cache
  /// behavior or for another cache behavior, you indicate the origin to which
  /// you want the cache behavior to route requests by specifying the value of
  /// the `Id` element for that origin. When a request matches the path pattern
  /// for that cache behavior, CloudFront routes the request to the specified
  /// origin. For more information, see
  /// [Cache Behavior Settings](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior)
  /// in the _Amazon CloudFront Developer Guide_.
  final String id;

  ///  **Amazon S3 origins**: The DNS name of the Amazon S3 bucket from which
  /// you want CloudFront to get objects for this origin, for example,
  /// `myawsbucket.s3.amazonaws.com`.
  ///
  /// Constraints for Amazon S3 origins:
  ///
  /// *   If you configured Amazon S3 Transfer Acceleration for your bucket,
  /// don't specify the `s3-accelerate` endpoint for `DomainName`.
  ///
  /// *   The bucket name must be between 3 and 63 characters long (inclusive).
  ///
  /// *   The bucket name must contain only lowercase characters, numbers,
  /// periods, underscores, and dashes.
  ///
  /// *   The bucket name must not contain adjacent periods.
  ///
  ///
  ///  **Custom Origins**: The DNS domain name for the HTTP server from which
  /// you want CloudFront to get objects for this origin, for example,
  /// `www.example.com`.
  ///
  /// Constraints for custom origins:
  ///
  /// *    `DomainName` must be a valid DNS name that contains only a-z, A-Z,
  /// 0-9, dot (.), hyphen (-), or underscore (_) characters.
  ///
  /// *   The name cannot exceed 128 characters.
  final String domainName;

  /// An optional element that causes CloudFront to request your content from a
  /// directory in your Amazon S3 bucket or your custom origin. When you include
  /// the `OriginPath` element, specify the directory name, beginning with a
  /// `/`. CloudFront appends the directory name to the value of `DomainName`,
  /// for example, `example.com/production`. Do not include a `/` at the end of
  /// the directory name.
  ///
  /// For example, suppose you've specified the following values for your
  /// distribution:
  ///
  /// *    `DomainName`: An Amazon S3 bucket named `myawsbucket`.
  ///
  /// *    `OriginPath`: `/production`
  ///
  /// *    `CNAME`: `example.com`
  ///
  ///
  /// When a user enters `example.com/index.html` in a browser, CloudFront sends
  /// a request to Amazon S3 for `myawsbucket/production/index.html`.
  ///
  /// When a user enters `example.com/acme/index.html` in a browser, CloudFront
  /// sends a request to Amazon S3 for `myawsbucket/production/acme/index.html`.
  final String originPath;

  /// A complex type that contains names and values for the custom headers that
  /// you want.
  final CustomHeaders customHeaders;

  /// A complex type that contains information about the Amazon S3 origin. If
  /// the origin is a custom origin, use the `CustomOriginConfig` element
  /// instead.
  final S3OriginConfig s3OriginConfig;

  /// A complex type that contains information about a custom origin. If the
  /// origin is an Amazon S3 bucket, use the `S3OriginConfig` element instead.
  final CustomOriginConfig customOriginConfig;

  Origin({
    @required this.id,
    @required this.domainName,
    this.originPath,
    this.customHeaders,
    this.s3OriginConfig,
    this.customOriginConfig,
  });
  static Origin fromJson(Map<String, dynamic> json) => Origin(
        id: json['Id'] as String,
        domainName: json['DomainName'] as String,
        originPath: json.containsKey('OriginPath')
            ? json['OriginPath'] as String
            : null,
        customHeaders: json.containsKey('CustomHeaders')
            ? CustomHeaders.fromJson(json['CustomHeaders'])
            : null,
        s3OriginConfig: json.containsKey('S3OriginConfig')
            ? S3OriginConfig.fromJson(json['S3OriginConfig'])
            : null,
        customOriginConfig: json.containsKey('CustomOriginConfig')
            ? CustomOriginConfig.fromJson(json['CustomOriginConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains `HeaderName` and `HeaderValue` elements, if
/// any, for this distribution.
class OriginCustomHeader {
  /// The name of a header that you want CloudFront to forward to your origin.
  /// For more information, see
  /// [Forwarding Custom Headers to Your Origin (Web Distributions Only)](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/forward-custom-headers.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  final String headerName;

  /// The value for the header that you specified in the `HeaderName` field.
  final String headerValue;

  OriginCustomHeader({
    @required this.headerName,
    @required this.headerValue,
  });
  static OriginCustomHeader fromJson(Map<String, dynamic> json) =>
      OriginCustomHeader(
        headerName: json['HeaderName'] as String,
        headerValue: json['HeaderValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains information about the SSL/TLS protocols that
/// CloudFront can use when establishing an HTTPS connection with your origin.
class OriginSslProtocols {
  /// The number of SSL/TLS protocols that you want to allow CloudFront to use
  /// when establishing an HTTPS connection with this origin.
  final int quantity;

  /// A list that contains allowed SSL/TLS protocols for this distribution.
  final List<String> items;

  OriginSslProtocols({
    @required this.quantity,
    @required this.items,
  });
  static OriginSslProtocols fromJson(Map<String, dynamic> json) =>
      OriginSslProtocols(
        quantity: json['Quantity'] as int,
        items: (json['Items'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains information about origins for this
/// distribution.
class Origins {
  /// The number of origins for this distribution.
  final int quantity;

  /// A complex type that contains origins for this distribution.
  final List<Origin> items;

  Origins({
    @required this.quantity,
    this.items,
  });
  static Origins fromJson(Map<String, dynamic> json) => Origins(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Origin.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains information about the objects that you want to
/// invalidate. For more information, see
/// [Specifying the Objects to Invalidate](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects)
/// in the _Amazon CloudFront Developer Guide_.
class Paths {
  /// The number of objects that you want to invalidate.
  final int quantity;

  /// A complex type that contains a list of the paths that you want to
  /// invalidate.
  final List<String> items;

  Paths({
    @required this.quantity,
    this.items,
  });
  static Paths fromJson(Map<String, dynamic> json) => Paths(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex data type of public keys you add to CloudFront to use with
/// features like field-level encryption.
class PublicKey {
  /// A unique ID assigned to a public key you've added to CloudFront.
  final String id;

  /// A time you added a public key to CloudFront.
  final DateTime createdTime;

  /// A complex data type for a public key you add to CloudFront to use with
  /// features like field-level encryption.
  final PublicKeyConfig publicKeyConfig;

  PublicKey({
    @required this.id,
    @required this.createdTime,
    @required this.publicKeyConfig,
  });
  static PublicKey fromJson(Map<String, dynamic> json) => PublicKey(
        id: json['Id'] as String,
        createdTime: DateTime.parse(json['CreatedTime']),
        publicKeyConfig: PublicKeyConfig.fromJson(json['PublicKeyConfig']),
      );
}

/// Information about a public key you add to CloudFront to use with features
/// like field-level encryption.
class PublicKeyConfig {
  /// A unique number that ensures the request can't be replayed.
  final String callerReference;

  /// The name for a public key you add to CloudFront to use with features like
  /// field-level encryption.
  final String name;

  /// The encoded public key that you want to add to CloudFront to use with
  /// features like field-level encryption.
  final String encodedKey;

  /// An optional comment about a public key.
  final String comment;

  PublicKeyConfig({
    @required this.callerReference,
    @required this.name,
    @required this.encodedKey,
    this.comment,
  });
  static PublicKeyConfig fromJson(Map<String, dynamic> json) => PublicKeyConfig(
        callerReference: json['CallerReference'] as String,
        name: json['Name'] as String,
        encodedKey: json['EncodedKey'] as String,
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of public keys you've added to CloudFront to use with features like
/// field-level encryption.
class PublicKeyList {
  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the `Marker` request parameter to
  /// continue listing your public keys where you left off.
  final String nextMarker;

  /// The maximum number of public keys you want in the response body.
  final int maxItems;

  /// The number of public keys you added to CloudFront to use with features
  /// like field-level encryption.
  final int quantity;

  /// An array of information about a public key you add to CloudFront to use
  /// with features like field-level encryption.
  final List<PublicKeySummary> items;

  PublicKeyList({
    this.nextMarker,
    @required this.maxItems,
    @required this.quantity,
    this.items,
  });
  static PublicKeyList fromJson(Map<String, dynamic> json) => PublicKeyList(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => PublicKeySummary.fromJson(e))
                .toList()
            : null,
      );
}

///  Public key information summary.
class PublicKeySummary {
  ///  ID for public key information summary.
  final String id;

  ///  Name for public key information summary.
  final String name;

  ///  Creation time for public key information summary.
  final DateTime createdTime;

  ///  Encoded key for public key information summary.
  final String encodedKey;

  ///  Comment for public key information summary.
  final String comment;

  PublicKeySummary({
    @required this.id,
    @required this.name,
    @required this.createdTime,
    @required this.encodedKey,
    this.comment,
  });
  static PublicKeySummary fromJson(Map<String, dynamic> json) =>
      PublicKeySummary(
        id: json['Id'] as String,
        name: json['Name'] as String,
        createdTime: DateTime.parse(json['CreatedTime']),
        encodedKey: json['EncodedKey'] as String,
        comment: json.containsKey('Comment') ? json['Comment'] as String : null,
      );
}

/// Query argument-profile mapping for field-level encryption.
class QueryArgProfile {
  /// Query argument for field-level encryption query argument-profile mapping.
  final String queryArg;

  /// ID of profile to use for field-level encryption query argument-profile
  /// mapping
  final String profileId;

  QueryArgProfile({
    @required this.queryArg,
    @required this.profileId,
  });
  static QueryArgProfile fromJson(Map<String, dynamic> json) => QueryArgProfile(
        queryArg: json['QueryArg'] as String,
        profileId: json['ProfileId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configuration for query argument-profile mapping for field-level encryption.
class QueryArgProfileConfig {
  /// Flag to set if you want a request to be forwarded to the origin even if
  /// the profile specified by the field-level encryption query argument,
  /// fle-profile, is unknown.
  final bool forwardWhenQueryArgProfileIsUnknown;

  /// Profiles specified for query argument-profile mapping for field-level
  /// encryption.
  final QueryArgProfiles queryArgProfiles;

  QueryArgProfileConfig({
    @required this.forwardWhenQueryArgProfileIsUnknown,
    this.queryArgProfiles,
  });
  static QueryArgProfileConfig fromJson(Map<String, dynamic> json) =>
      QueryArgProfileConfig(
        forwardWhenQueryArgProfileIsUnknown:
            json['ForwardWhenQueryArgProfileIsUnknown'] as bool,
        queryArgProfiles: json.containsKey('QueryArgProfiles')
            ? QueryArgProfiles.fromJson(json['QueryArgProfiles'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Query argument-profile mapping for field-level encryption.
class QueryArgProfiles {
  /// Number of profiles for query argument-profile mapping for field-level
  /// encryption.
  final int quantity;

  /// Number of items for query argument-profile mapping for field-level
  /// encryption.
  final List<QueryArgProfile> items;

  QueryArgProfiles({
    @required this.quantity,
    this.items,
  });
  static QueryArgProfiles fromJson(Map<String, dynamic> json) =>
      QueryArgProfiles(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => QueryArgProfile.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class QueryStringCacheKeys {
  /// The number of `whitelisted` query string parameters for this cache
  /// behavior.
  final int quantity;

  /// (Optional) A list that contains the query string parameters that you want
  /// CloudFront to use as a basis for caching for this cache behavior. If
  /// `Quantity` is 0, you can omit `Items`.
  final List<String> items;

  QueryStringCacheKeys({
    @required this.quantity,
    this.items,
  });
  static QueryStringCacheKeys fromJson(Map<String, dynamic> json) =>
      QueryStringCacheKeys(
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that identifies ways in which you want to restrict
/// distribution of your content.
class Restrictions {
  final GeoRestriction geoRestriction;

  Restrictions({
    @required this.geoRestriction,
  });
  static Restrictions fromJson(Map<String, dynamic> json) => Restrictions(
        geoRestriction: GeoRestriction.fromJson(json['GeoRestriction']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains information about the Amazon S3 bucket from
/// which you want CloudFront to get your media files for distribution.
class S3Origin {
  /// The DNS name of the Amazon S3 origin.
  final String domainName;

  /// The CloudFront origin access identity to associate with the RTMP
  /// distribution. Use an origin access identity to configure the distribution
  /// so that end users can only access objects in an Amazon S3 bucket through
  /// CloudFront.
  ///
  /// If you want end users to be able to access objects using either the
  /// CloudFront URL or the Amazon S3 URL, specify an empty
  /// `OriginAccessIdentity` element.
  ///
  /// To delete the origin access identity from an existing distribution, update
  /// the distribution configuration and include an empty `OriginAccessIdentity`
  /// element.
  ///
  /// To replace the origin access identity, update the distribution
  /// configuration and specify the new origin access identity.
  ///
  /// For more information, see
  /// [Using an Origin Access Identity to Restrict Access to Your Amazon S3 Content](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)
  /// in the _Amazon Amazon CloudFront Developer Guide_.
  final String originAccessIdentity;

  S3Origin({
    @required this.domainName,
    @required this.originAccessIdentity,
  });
  static S3Origin fromJson(Map<String, dynamic> json) => S3Origin(
        domainName: json['DomainName'] as String,
        originAccessIdentity: json['OriginAccessIdentity'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains information about the Amazon S3 origin. If the
/// origin is a custom origin, use the `CustomOriginConfig` element instead.
class S3OriginConfig {
  /// The CloudFront origin access identity to associate with the origin. Use an
  /// origin access identity to configure the origin so that viewers can _only_
  /// access objects in an Amazon S3 bucket through CloudFront. The format of
  /// the value is:
  ///
  /// origin-access-identity/cloudfront/_ID-of-origin-access-identity_
  ///
  /// where  `_ID-of-origin-access-identity_`  is the value that CloudFront
  /// returned in the `ID` element when you created the origin access identity.
  ///
  /// If you want viewers to be able to access objects using either the
  /// CloudFront URL or the Amazon S3 URL, specify an empty
  /// `OriginAccessIdentity` element.
  ///
  /// To delete the origin access identity from an existing distribution, update
  /// the distribution configuration and include an empty `OriginAccessIdentity`
  /// element.
  ///
  /// To replace the origin access identity, update the distribution
  /// configuration and specify the new origin access identity.
  ///
  /// For more information about the origin access identity, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final String originAccessIdentity;

  S3OriginConfig({
    @required this.originAccessIdentity,
  });
  static S3OriginConfig fromJson(Map<String, dynamic> json) => S3OriginConfig(
        originAccessIdentity: json['OriginAccessIdentity'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that lists the AWS accounts that were included in the
/// `TrustedSigners` complex type, as well as their active CloudFront key pair
/// IDs, if any.
class Signer {
  /// An AWS account that is included in the `TrustedSigners` complex type for
  /// this RTMP distribution. Valid values include:
  ///
  /// *    `self`, which is the AWS account used to create the distribution.
  ///
  /// *   An AWS account number.
  final String awsAccountNumber;

  /// A complex type that lists the active CloudFront key pairs, if any, that
  /// are associated with `AwsAccountNumber`.
  final KeyPairIds keyPairIds;

  Signer({
    this.awsAccountNumber,
    this.keyPairIds,
  });
  static Signer fromJson(Map<String, dynamic> json) => Signer(
        awsAccountNumber: json.containsKey('AwsAccountNumber')
            ? json['AwsAccountNumber'] as String
            : null,
        keyPairIds: json.containsKey('KeyPairIds')
            ? KeyPairIds.fromJson(json['KeyPairIds'])
            : null,
      );
}

/// A streaming distribution.
class StreamingDistribution {
  /// The identifier for the RTMP distribution. For example: `EGTXBD79EXAMPLE`.
  final String id;

  final String arn;

  /// The current status of the RTMP distribution. When the status is
  /// `Deployed`, the distribution's information is propagated to all CloudFront
  /// edge locations.
  final String status;

  /// The date and time that the distribution was last modified.
  final DateTime lastModifiedTime;

  /// The domain name that corresponds to the streaming distribution, for
  /// example, `s5c39gqb8ow64r.cloudfront.net`.
  final String domainName;

  /// A complex type that lists the AWS accounts, if any, that you included in
  /// the `TrustedSigners` complex type for this distribution. These are the
  /// accounts that you want to allow to create signed URLs for private content.
  ///
  /// The `Signer` complex type lists the AWS account number of the trusted
  /// signer or `self` if the signer is the AWS account that created the
  /// distribution. The `Signer` element also includes the IDs of any active
  /// CloudFront key pairs that are associated with the trusted signer's AWS
  /// account. If no `KeyPairId` element appears for a `Signer`, that signer
  /// can't create signed URLs.
  ///
  /// For more information, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final ActiveTrustedSigners activeTrustedSigners;

  /// The current configuration information for the RTMP distribution.
  final StreamingDistributionConfig streamingDistributionConfig;

  StreamingDistribution({
    @required this.id,
    @required this.arn,
    @required this.status,
    this.lastModifiedTime,
    @required this.domainName,
    @required this.activeTrustedSigners,
    @required this.streamingDistributionConfig,
  });
  static StreamingDistribution fromJson(Map<String, dynamic> json) =>
      StreamingDistribution(
        id: json['Id'] as String,
        arn: json['ARN'] as String,
        status: json['Status'] as String,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        domainName: json['DomainName'] as String,
        activeTrustedSigners:
            ActiveTrustedSigners.fromJson(json['ActiveTrustedSigners']),
        streamingDistributionConfig: StreamingDistributionConfig.fromJson(
            json['StreamingDistributionConfig']),
      );
}

/// The RTMP distribution's configuration information.
class StreamingDistributionConfig {
  /// A unique number that ensures that the request can't be replayed. If the
  /// `CallerReference` is new (no matter the content of the
  /// `StreamingDistributionConfig` object), a new streaming distribution is
  /// created. If the `CallerReference` is a value that you already sent in a
  /// previous request to create a streaming distribution, and the content of
  /// the `StreamingDistributionConfig` is identical to the original request
  /// (ignoring white space), the response includes the same information
  /// returned to the original request. If the `CallerReference` is a value that
  /// you already sent in a previous request to create a streaming distribution
  /// but the content of the `StreamingDistributionConfig` is different from the
  /// original request, CloudFront returns a `DistributionAlreadyExists` error.
  final String callerReference;

  /// A complex type that contains information about the Amazon S3 bucket from
  /// which you want CloudFront to get your media files for distribution.
  final S3Origin s3Origin;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this streaming distribution.
  final Aliases aliases;

  /// Any comments you want to include about the streaming distribution.
  final String comment;

  /// A complex type that controls whether access logs are written for the
  /// streaming distribution.
  final StreamingLoggingConfig logging;

  /// A complex type that specifies any AWS accounts that you want to permit to
  /// create signed URLs for private content. If you want the distribution to
  /// use signed URLs, include this element; if you want the distribution to use
  /// public URLs, remove this element. For more information, see
  /// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final TrustedSigners trustedSigners;

  /// A complex type that contains information about price class for this
  /// streaming distribution.
  final String priceClass;

  /// Whether the streaming distribution is enabled to accept user requests for
  /// content.
  final bool enabled;

  StreamingDistributionConfig({
    @required this.callerReference,
    @required this.s3Origin,
    this.aliases,
    @required this.comment,
    this.logging,
    @required this.trustedSigners,
    this.priceClass,
    @required this.enabled,
  });
  static StreamingDistributionConfig fromJson(Map<String, dynamic> json) =>
      StreamingDistributionConfig(
        callerReference: json['CallerReference'] as String,
        s3Origin: S3Origin.fromJson(json['S3Origin']),
        aliases: json.containsKey('Aliases')
            ? Aliases.fromJson(json['Aliases'])
            : null,
        comment: json['Comment'] as String,
        logging: json.containsKey('Logging')
            ? StreamingLoggingConfig.fromJson(json['Logging'])
            : null,
        trustedSigners: TrustedSigners.fromJson(json['TrustedSigners']),
        priceClass: json.containsKey('PriceClass')
            ? json['PriceClass'] as String
            : null,
        enabled: json['Enabled'] as bool,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A streaming distribution Configuration and a list of tags to be associated
/// with the streaming distribution.
class StreamingDistributionConfigWithTags {
  /// A streaming distribution Configuration.
  final StreamingDistributionConfig streamingDistributionConfig;

  /// A complex type that contains zero or more `Tag` elements.
  final Tags tags;

  StreamingDistributionConfigWithTags({
    @required this.streamingDistributionConfig,
    @required this.tags,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A streaming distribution list.
class StreamingDistributionList {
  /// The value you provided for the `Marker` request parameter.
  final String marker;

  /// If `IsTruncated` is `true`, this element is present and contains the value
  /// you can use for the `Marker` request parameter to continue listing your
  /// RTMP distributions where they left off.
  final String nextMarker;

  /// The value you provided for the `MaxItems` request parameter.
  final int maxItems;

  /// A flag that indicates whether more streaming distributions remain to be
  /// listed. If your results were truncated, you can make a follow-up
  /// pagination request using the `Marker` request parameter to retrieve more
  /// distributions in the list.
  final bool isTruncated;

  /// The number of streaming distributions that were created by the current AWS
  /// account.
  final int quantity;

  /// A complex type that contains one `StreamingDistributionSummary` element
  /// for each distribution that was created by the current AWS account.
  final List<StreamingDistributionSummary> items;

  StreamingDistributionList({
    @required this.marker,
    this.nextMarker,
    @required this.maxItems,
    @required this.isTruncated,
    @required this.quantity,
    this.items,
  });
  static StreamingDistributionList fromJson(Map<String, dynamic> json) =>
      StreamingDistributionList(
        marker: json['Marker'] as String,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        maxItems: json['MaxItems'] as int,
        isTruncated: json['IsTruncated'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List)
                .map((e) => StreamingDistributionSummary.fromJson(e))
                .toList()
            : null,
      );
}

///  A summary of the information for an Amazon CloudFront streaming
/// distribution.
class StreamingDistributionSummary {
  /// The identifier for the distribution, for example, `EDFDVBD632BHDS5`.
  final String id;

  ///  The ARN (Amazon Resource Name) for the streaming distribution. For
  /// example:
  /// `arn:aws:cloudfront::123456789012:streaming-distribution/EDFDVBD632BHDS5`,
  /// where `123456789012` is your AWS account ID.
  final String arn;

  ///  Indicates the current status of the distribution. When the status is
  /// `Deployed`, the distribution's information is fully propagated throughout
  /// the Amazon CloudFront system.
  final String status;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// The domain name corresponding to the distribution, for example,
  /// `d111111abcdef8.cloudfront.net`.
  final String domainName;

  /// A complex type that contains information about the Amazon S3 bucket from
  /// which you want CloudFront to get your media files for distribution.
  final S3Origin s3Origin;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this streaming distribution.
  final Aliases aliases;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content. If you want to require
  /// signed URLs in requests for objects in the target origin that match the
  /// `PathPattern` for this cache behavior, specify `true` for `Enabled`, and
  /// specify the applicable values for `Quantity` and `Items`.If you don't want
  /// to require signed URLs in requests for objects that match `PathPattern`,
  /// specify `false` for `Enabled` and `0` for `Quantity`. Omit `Items`. To
  /// add, change, or remove one or more trusted signers, change `Enabled` to
  /// `true` (if it's currently `false`), change `Quantity` as applicable, and
  /// specify all of the trusted signers that you want to include in the updated
  /// distribution.
  final TrustedSigners trustedSigners;

  /// The comment originally specified when this distribution was created.
  final String comment;

  final String priceClass;

  /// Whether the distribution is enabled to accept end user requests for
  /// content.
  final bool enabled;

  StreamingDistributionSummary({
    @required this.id,
    @required this.arn,
    @required this.status,
    @required this.lastModifiedTime,
    @required this.domainName,
    @required this.s3Origin,
    @required this.aliases,
    @required this.trustedSigners,
    @required this.comment,
    @required this.priceClass,
    @required this.enabled,
  });
  static StreamingDistributionSummary fromJson(Map<String, dynamic> json) =>
      StreamingDistributionSummary(
        id: json['Id'] as String,
        arn: json['ARN'] as String,
        status: json['Status'] as String,
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        domainName: json['DomainName'] as String,
        s3Origin: S3Origin.fromJson(json['S3Origin']),
        aliases: Aliases.fromJson(json['Aliases']),
        trustedSigners: TrustedSigners.fromJson(json['TrustedSigners']),
        comment: json['Comment'] as String,
        priceClass: json['PriceClass'] as String,
        enabled: json['Enabled'] as bool,
      );
}

/// A complex type that controls whether access logs are written for this
/// streaming distribution.
class StreamingLoggingConfig {
  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you don't want to enable logging when you create a streaming
  /// distribution or if you want to disable logging for an existing streaming
  /// distribution, specify `false` for `Enabled`, and specify `empty Bucket`
  /// and `Prefix` elements. If you specify `false` for `Enabled` but you
  /// specify values for `Bucket` and `Prefix`, the values are automatically
  /// deleted.
  final bool enabled;

  /// The Amazon S3 bucket to store the access logs in, for example,
  /// `myawslogbucket.s3.amazonaws.com`.
  final String bucket;

  /// An optional string that you want CloudFront to prefix to the access log
  /// filenames for this streaming distribution, for example, `myprefix/`. If
  /// you want to enable logging, but you don't want to specify a prefix, you
  /// still must include an empty `Prefix` element in the `Logging` element.
  final String prefix;

  StreamingLoggingConfig({
    @required this.enabled,
    @required this.bucket,
    @required this.prefix,
  });
  static StreamingLoggingConfig fromJson(Map<String, dynamic> json) =>
      StreamingLoggingConfig(
        enabled: json['Enabled'] as bool,
        bucket: json['Bucket'] as String,
        prefix: json['Prefix'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  A complex type that contains `Tag` key and `Tag` value.
class Tag {
  ///  A string that contains `Tag` key.
  ///
  /// The string length should be between 1 and 128 characters. Valid characters
  /// include `a-z`, `A-Z`, `0-9`, space, and the special characters `_ - . : /
  /// = + @`.
  final String key;

  ///  A string that contains an optional `Tag` value.
  ///
  /// The string length should be between 0 and 256 characters. Valid characters
  /// include `a-z`, `A-Z`, `0-9`, space, and the special characters `_ - . : /
  /// = + @`.
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

///  A complex type that contains zero or more `Tag` elements.
class TagKeys {
  ///  A complex type that contains `Tag` key elements.
  final List<String> items;

  TagKeys({
    this.items,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  A complex type that contains zero or more `Tag` elements.
class Tags {
  ///  A complex type that contains `Tag` elements.
  final List<Tag> items;

  Tags({
    this.items,
  });
  static Tags fromJson(Map<String, dynamic> json) => Tags(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that specifies the AWS accounts, if any, that you want to
/// allow to create signed URLs for private content.
///
/// If you want to require signed URLs in requests for objects in the target
/// origin that match the `PathPattern` for this cache behavior, specify `true`
/// for `Enabled`, and specify the applicable values for `Quantity` and `Items`.
/// For more information, see
/// [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
/// in the _Amazon Amazon CloudFront Developer Guide_.
///
/// If you don't want to require signed URLs in requests for objects that match
/// `PathPattern`, specify `false` for `Enabled` and `0` for `Quantity`. Omit
/// `Items`.
///
/// To add, change, or remove one or more trusted signers, change `Enabled` to
/// `true` (if it's currently `false`), change `Quantity` as applicable, and
/// specify all of the trusted signers that you want to include in the updated
/// distribution.
///
/// For more information about updating the distribution configuration, see
/// DistributionConfig .
class TrustedSigners {
  /// Specifies whether you want to require viewers to use signed URLs to access
  /// the files specified by `PathPattern` and `TargetOriginId`.
  final bool enabled;

  /// The number of trusted signers for this cache behavior.
  final int quantity;

  ///  **Optional**: A complex type that contains trusted signers for this cache
  /// behavior. If `Quantity` is `0`, you can omit `Items`.
  final List<String> items;

  TrustedSigners({
    @required this.enabled,
    @required this.quantity,
    this.items,
  });
  static TrustedSigners fromJson(Map<String, dynamic> json) => TrustedSigners(
        enabled: json['Enabled'] as bool,
        quantity: json['Quantity'] as int,
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The returned result of the corresponding request.
class UpdateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  UpdateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });
  static UpdateCloudFrontOriginAccessIdentityResult fromJson(
          Map<String, dynamic> json) =>
      UpdateCloudFrontOriginAccessIdentityResult(
        cloudFrontOriginAccessIdentity:
            json.containsKey('CloudFrontOriginAccessIdentity')
                ? CloudFrontOriginAccessIdentity.fromJson(
                    json['CloudFrontOriginAccessIdentity'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class UpdateDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  UpdateDistributionResult({
    this.distribution,
    this.eTag,
  });
  static UpdateDistributionResult fromJson(Map<String, dynamic> json) =>
      UpdateDistributionResult(
        distribution: json.containsKey('Distribution')
            ? Distribution.fromJson(json['Distribution'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class UpdateFieldLevelEncryptionConfigResult {
  /// Return the results of updating the configuration.
  final FieldLevelEncryption fieldLevelEncryption;

  /// The value of the `ETag` header that you received when updating the
  /// configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  UpdateFieldLevelEncryptionConfigResult({
    this.fieldLevelEncryption,
    this.eTag,
  });
  static UpdateFieldLevelEncryptionConfigResult fromJson(
          Map<String, dynamic> json) =>
      UpdateFieldLevelEncryptionConfigResult(
        fieldLevelEncryption: json.containsKey('FieldLevelEncryption')
            ? FieldLevelEncryption.fromJson(json['FieldLevelEncryption'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class UpdateFieldLevelEncryptionProfileResult {
  /// Return the results of updating the profile.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  /// The result of the field-level encryption profile request.
  final String eTag;

  UpdateFieldLevelEncryptionProfileResult({
    this.fieldLevelEncryptionProfile,
    this.eTag,
  });
  static UpdateFieldLevelEncryptionProfileResult fromJson(
          Map<String, dynamic> json) =>
      UpdateFieldLevelEncryptionProfileResult(
        fieldLevelEncryptionProfile:
            json.containsKey('FieldLevelEncryptionProfile')
                ? FieldLevelEncryptionProfile.fromJson(
                    json['FieldLevelEncryptionProfile'])
                : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

class UpdatePublicKeyResult {
  /// Return the results of updating the public key.
  final PublicKey publicKey;

  /// The current version of the update public key result. For example:
  /// `E2QWRUHAPOMQZL`.
  final String eTag;

  UpdatePublicKeyResult({
    this.publicKey,
    this.eTag,
  });
  static UpdatePublicKeyResult fromJson(Map<String, dynamic> json) =>
      UpdatePublicKeyResult(
        publicKey: json.containsKey('PublicKey')
            ? PublicKey.fromJson(json['PublicKey'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// The returned result of the corresponding request.
class UpdateStreamingDistributionResult {
  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  /// The current version of the configuration. For example: `E2QWRUHAPOMQZL`.
  final String eTag;

  UpdateStreamingDistributionResult({
    this.streamingDistribution,
    this.eTag,
  });
  static UpdateStreamingDistributionResult fromJson(
          Map<String, dynamic> json) =>
      UpdateStreamingDistributionResult(
        streamingDistribution: json.containsKey('StreamingDistribution')
            ? StreamingDistribution.fromJson(json['StreamingDistribution'])
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
      );
}

/// A complex type that specifies the following:
///
/// *   Whether you want viewers to use HTTP or HTTPS to request your objects.
///
/// *   If you want viewers to use HTTPS, whether you're using an alternate
/// domain name such as `example.com` or the CloudFront domain name for your
/// distribution, such as `d111111abcdef8.cloudfront.net`.
///
/// *   If you're using an alternate domain name, whether AWS Certificate
/// Manager (ACM) provided the certificate, or you purchased a certificate from
/// a third-party certificate authority and imported it into ACM or uploaded it
/// to the IAM certificate store.
///
///
/// You must specify only one of the following values:
///
/// *    ViewerCertificate$ACMCertificateArn
///
/// *    ViewerCertificate$IAMCertificateId
///
/// *    ViewerCertificate$CloudFrontDefaultCertificate
///
///
/// Don't specify `false` for `CloudFrontDefaultCertificate`.
///
///  **If you want viewers to use HTTP instead of HTTPS to request your
/// objects**: Specify the following value:
///
///  `<CloudFrontDefaultCertificate>true<CloudFrontDefaultCertificate>`
///
/// In addition, specify `allow-all` for `ViewerProtocolPolicy` for all of your
/// cache behaviors.
///
///  **If you want viewers to use HTTPS to request your objects**: Choose the
/// type of certificate that you want to use based on whether you're using an
/// alternate domain name for your objects or the CloudFront domain name:
///
/// *    **If you're using an alternate domain name, such as example.com**:
/// Specify one of the following values, depending on whether ACM provided your
/// certificate or you purchased your certificate from third-party certificate
/// authority:
///
///     *    `<ACMCertificateArn>_ARN for ACM SSL/TLS
/// certificate_<ACMCertificateArn>` where  `_ARN for ACM SSL/TLS certificate_`
/// is the ARN for the ACM SSL/TLS certificate that you want to use for this
/// distribution.
///
///     *    `<IAMCertificateId>_IAM certificate ID_<IAMCertificateId>` where
/// `_IAM certificate ID_`  is the ID that IAM returned when you added the
/// certificate to the IAM certificate store.
///
///
///     If you specify `ACMCertificateArn` or `IAMCertificateId`, you must also
/// specify a value for `SSLSupportMethod`.
///
///     If you choose to use an ACM certificate or a certificate in the IAM
/// certificate store, we recommend that you use only an alternate domain name
/// in your object URLs (`https://example.com/logo.jpg`). If you use the domain
/// name that is associated with your CloudFront distribution (such as
/// `https://d111111abcdef8.cloudfront.net/logo.jpg`) and the viewer supports
/// `SNI`, then CloudFront behaves normally. However, if the browser does not
/// support SNI, the user's experience depends on the value that you choose for
/// `SSLSupportMethod`:
///
///     *    `vip`: The viewer displays a warning because there is a mismatch
/// between the CloudFront domain name and the domain name in your SSL/TLS
/// certificate.
///
///     *    `sni-only`: CloudFront drops the connection with the browser
/// without returning the object.
///
///
/// *    **If you're using the CloudFront domain name for your distribution,
/// such as `d111111abcdef8.cloudfront.net`** : Specify the following value:
///
///      `<CloudFrontDefaultCertificate>true<CloudFrontDefaultCertificate>`
///
///
/// If you want viewers to use HTTPS, you must also specify one of the following
/// values in your cache behaviors:
///
/// *     `<ViewerProtocolPolicy>https-only<ViewerProtocolPolicy>`
///
/// *    `<ViewerProtocolPolicy>redirect-to-https<ViewerProtocolPolicy>`
///
///
/// You can also optionally require that CloudFront use HTTPS to communicate
/// with your origin by specifying one of the following values for the
/// applicable origins:
///
/// *    `<OriginProtocolPolicy>https-only<OriginProtocolPolicy>`
///
/// *    `<OriginProtocolPolicy>match-viewer<OriginProtocolPolicy>`
///
///
/// For more information, see
/// [Using Alternate Domain Names and HTTPS](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#CNAMEsAndHTTPS)
/// in the _Amazon CloudFront Developer Guide_.
class ViewerCertificate {
  /// For information about how and when to use `CloudFrontDefaultCertificate`,
  /// see ViewerCertificate.
  final bool cloudFrontDefaultCertificate;

  /// For information about how and when to use `IAMCertificateId`, see
  /// ViewerCertificate.
  final String iamCertificateId;

  /// For information about how and when to use `ACMCertificateArn`, see
  /// ViewerCertificate.
  final String acmCertificateArn;

  /// If you specify a value for ViewerCertificate$ACMCertificateArn or for
  /// ViewerCertificate$IAMCertificateId, you must also specify how you want
  /// CloudFront to serve HTTPS requests: using a method that works for all
  /// clients or one that works for most clients:
  ///
  /// *    `vip`: CloudFront uses dedicated IP addresses for your content and
  /// can respond to HTTPS requests from any viewer. However, you will incur
  /// additional monthly charges.
  ///
  /// *    `sni-only`: CloudFront can respond to HTTPS requests from viewers
  /// that support Server Name Indication (SNI). All modern browsers support
  /// SNI, but some browsers still in use don't support SNI. If some of your
  /// users' browsers don't support SNI, we recommend that you do one of the
  /// following:
  ///
  ///     *   Use the `vip` option (dedicated IP addresses) instead of
  /// `sni-only`.
  ///
  ///     *   Use the CloudFront SSL/TLS certificate instead of a custom
  /// certificate. This requires that you use the CloudFront domain name of your
  /// distribution in the URLs for your objects, for example,
  /// `https://d111111abcdef8.cloudfront.net/logo.png`.
  ///
  ///     *   If you can control which browser your users use, upgrade the
  /// browser to one that supports SNI.
  ///
  ///     *   Use HTTP instead of HTTPS.
  ///
  ///
  ///
  /// Don't specify a value for `SSLSupportMethod` if you specified
  /// `<CloudFrontDefaultCertificate>true<CloudFrontDefaultCertificate>`.
  ///
  /// For more information, see
  /// [Using Alternate Domain Names and HTTPS](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#CNAMEsAndHTTPS.html)
  /// in the _Amazon CloudFront Developer Guide_.
  final String sslSupportMethod;

  /// Specify the security policy that you want CloudFront to use for HTTPS
  /// connections. A security policy determines two settings:
  ///
  /// *   The minimum SSL/TLS protocol that CloudFront uses to communicate with
  /// viewers
  ///
  /// *   The cipher that CloudFront uses to encrypt the content that it returns
  /// to viewers
  ///
  ///
  ///  On the CloudFront console, this setting is called **Security policy**.
  ///
  /// We recommend that you specify `TLSv1.1_2016` unless your users are using
  /// browsers or devices that do not support TLSv1.1 or later.
  ///
  /// When both of the following are true, you must specify `TLSv1` or later for
  /// the security policy:
  ///
  /// *   You're using a custom certificate: you specified a value for
  /// `ACMCertificateArn` or for `IAMCertificateId`
  ///
  /// *   You're using SNI: you specified `sni-only` for `SSLSupportMethod`
  ///
  ///
  /// If you specify `true` for `CloudFrontDefaultCertificate`, CloudFront
  /// automatically sets the security policy to `TLSv1` regardless of the value
  /// that you specify for `MinimumProtocolVersion`.
  ///
  /// For information about the relationship between the security policy that
  /// you choose and the protocols and ciphers that CloudFront uses to
  /// communicate with viewers, see
  /// [Supported SSL/TLS Protocols and Ciphers for Communication Between Viewers and CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/secure-connections-supported-viewer-protocols-ciphers.html#secure-connections-supported-ciphers)
  /// in the _Amazon CloudFront Developer Guide_.
  final String minimumProtocolVersion;

  /// This field has been deprecated. Use one of the following fields instead:
  ///
  /// *    ViewerCertificate$ACMCertificateArn
  ///
  /// *    ViewerCertificate$IAMCertificateId
  ///
  /// *    ViewerCertificate$CloudFrontDefaultCertificate
  final String certificate;

  /// This field has been deprecated. Use one of the following fields instead:
  ///
  /// *    ViewerCertificate$ACMCertificateArn
  ///
  /// *    ViewerCertificate$IAMCertificateId
  ///
  /// *    ViewerCertificate$CloudFrontDefaultCertificate
  final String certificateSource;

  ViewerCertificate({
    this.cloudFrontDefaultCertificate,
    this.iamCertificateId,
    this.acmCertificateArn,
    this.sslSupportMethod,
    this.minimumProtocolVersion,
    this.certificate,
    this.certificateSource,
  });
  static ViewerCertificate fromJson(Map<String, dynamic> json) =>
      ViewerCertificate(
        cloudFrontDefaultCertificate:
            json.containsKey('CloudFrontDefaultCertificate')
                ? json['CloudFrontDefaultCertificate'] as bool
                : null,
        iamCertificateId: json.containsKey('IAMCertificateId')
            ? json['IAMCertificateId'] as String
            : null,
        acmCertificateArn: json.containsKey('ACMCertificateArn')
            ? json['ACMCertificateArn'] as String
            : null,
        sslSupportMethod: json.containsKey('SSLSupportMethod')
            ? json['SSLSupportMethod'] as String
            : null,
        minimumProtocolVersion: json.containsKey('MinimumProtocolVersion')
            ? json['MinimumProtocolVersion'] as String
            : null,
        certificate: json.containsKey('Certificate')
            ? json['Certificate'] as String
            : null,
        certificateSource: json.containsKey('CertificateSource')
            ? json['CertificateSource'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
