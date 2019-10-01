import 'package:meta/meta.dart';

/// Amazon Cognito Sync
///
/// Amazon Cognito Sync provides an AWS service and client library that enable
/// cross-device syncing of application-related user data. High-level client
/// libraries are available for both iOS and Android. You can use these
/// libraries to persist data locally so that it's available even if the device
/// is offline. Developer credentials don't need to be stored on the mobile
/// device to access the service. You can use Amazon Cognito to obtain a
/// normalized user ID and credentials. User data is persisted in a dataset that
/// can store up to 1 MB of key-value pairs, and you can have up to 20 datasets
/// per user identity.
///
/// With Amazon Cognito Sync, the data stored for each identity is accessible
/// only to credentials assigned to that identity. In order to use the Cognito
/// Sync service, you need to make API calls using credentials retrieved with
/// [Amazon Cognito Identity
/// service](http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/Welcome.html).
///
/// If you want to use Cognito Sync in an Android or iOS application, you will
/// probably want to make API calls via the AWS Mobile SDK. To learn more, see
/// the [Developer Guide for
/// Android](http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-sync.html)
/// and the [Developer Guide for
/// iOS](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-sync.html).
class CognitoSyncApi {
  /// Initiates a bulk publish of all existing datasets for an Identity Pool to
  /// the configured stream. Customers are limited to one successful bulk
  /// publish per 24 hours. Bulk publish is an asynchronous request, customers
  /// can see the status of the request via the GetBulkPublishDetails operation.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> bulkPublish(String identityPoolId) async {}

  /// Deletes the specific dataset. The dataset will be deleted permanently, and
  /// the action can't be undone. Datasets that this dataset was merged with
  /// will no longer report the merge. Any subsequent operation on this dataset
  /// will result in a ResourceNotFoundException.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  Future<void> deleteDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName}) async {}

  /// Gets meta data about a dataset by identity and dataset name. With Amazon
  /// Cognito Sync, each identity has access only to its own data. Thus, the
  /// credentials used to make this API call need to have access to the identity
  /// data.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials. You should use Cognito Identity
  /// credentials to make this API call.
  Future<void> describeDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName}) async {}

  /// Gets usage details (for example, data storage) about a particular identity
  /// pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> describeIdentityPoolUsage(String identityPoolId) async {}

  /// Gets usage information for an identity, including number of datasets and
  /// data usage.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  Future<void> describeIdentityUsage(
      {@required String identityPoolId, @required String identityId}) async {}

  /// Get the status of the last BulkPublish operation for an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> getBulkPublishDetails(String identityPoolId) async {}

  /// Gets the events and the corresponding Lambda functions associated with an
  /// identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> getCognitoEvents(String identityPoolId) async {}

  /// Gets the configuration settings of an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> getIdentityPoolConfiguration(String identityPoolId) async {}

  /// Lists datasets for an identity. With Amazon Cognito Sync, each identity
  /// has access only to its own data. Thus, the credentials used to make this
  /// API call need to have access to the identity data.
  ///
  /// ListDatasets can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use the Cognito
  /// Identity credentials to make this API call.
  Future<void> listDatasets(
      {@required String identityPoolId,
      @required String identityId,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of identity pools registered with Cognito.
  ///
  /// ListIdentityPoolUsage can only be called with developer credentials. You
  /// cannot make this API call with the temporary user credentials provided by
  /// Cognito Identity.
  Future<void> listIdentityPoolUsage(
      {String nextToken, int maxResults}) async {}

  /// Gets paginated records, optionally changed after a particular sync count
  /// for a dataset and identity. With Amazon Cognito Sync, each identity has
  /// access only to its own data. Thus, the credentials used to make this API
  /// call need to have access to the identity data.
  ///
  /// ListRecords can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use Cognito
  /// Identity credentials to make this API call.
  Future<void> listRecords(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      BigInt lastSyncCount,
      String nextToken,
      int maxResults,
      String syncSessionToken}) async {}

  /// Registers a device to receive push sync notifications.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  Future<void> registerDevice(
      {@required String identityPoolId,
      @required String identityId,
      @required String platform,
      @required String token}) async {}

  /// Sets the AWS Lambda function for a given event type for an identity pool.
  /// This request only updates the key/value pair specified. Other key/values
  /// pairs are not updated. To remove a key value pair, pass a empty value for
  /// the particular key.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> setCognitoEvents(
      {@required String identityPoolId,
      @required Map<String, String> events}) async {}

  /// Sets the necessary configuration for push sync.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  Future<void> setIdentityPoolConfiguration(String identityPoolId,
      {PushSync pushSync, CognitoStreams cognitoStreams}) async {}

  /// Subscribes to receive notifications when a dataset is modified by another
  /// device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  Future<void> subscribeToDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      @required String deviceId}) async {}

  /// Unsubscribes from receiving notifications when a dataset is modified by
  /// another device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  Future<void> unsubscribeFromDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      @required String deviceId}) async {}

  /// Posts updates to records and adds and deletes records for a dataset and
  /// user.
  ///
  /// The sync count in the record patch is your last known sync count for that
  /// record. The server will reject an UpdateRecords request with a
  /// ResourceConflictException if you try to patch a record with a new value
  /// but a stale sync count.
  ///
  /// For example, if the sync count on the server is 5 for a key called
  /// highScore and you try and submit a new highScore with sync count of 4, the
  /// request will be rejected. To obtain the current sync count for a record,
  /// call ListRecords. On a successful update of the record, the response
  /// returns the new sync count for that record. You should present that sync
  /// count the next time you try to update that same record. When the record
  /// does not exist, specify the sync count as 0.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  Future<void> updateRecords(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      String deviceId,
      List<RecordPatch> recordPatches,
      @required String syncSessionToken,
      String clientContext}) async {}
}

class BulkPublishResponse {}

class CognitoStreams {}

class Dataset {}

class DeleteDatasetResponse {}

class DescribeDatasetResponse {}

class DescribeIdentityPoolUsageResponse {}

class DescribeIdentityUsageResponse {}

class GetBulkPublishDetailsResponse {}

class GetCognitoEventsResponse {}

class GetIdentityPoolConfigurationResponse {}

class IdentityPoolUsage {}

class IdentityUsage {}

class ListDatasetsResponse {}

class ListIdentityPoolUsageResponse {}

class ListRecordsResponse {}

class PushSync {}

class Record {}

class RecordPatch {}

class RegisterDeviceResponse {}

class SetIdentityPoolConfigurationResponse {}

class SubscribeToDatasetResponse {}

class UnsubscribeFromDatasetResponse {}

class UpdateRecordsResponse {}
