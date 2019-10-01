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
/// [Amazon Cognito Identity service](http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/Welcome.html).
///
/// If you want to use Cognito Sync in an Android or iOS application, you will
/// probably want to make API calls via the AWS Mobile SDK. To learn more, see
/// the
/// [Developer Guide for Android](http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-sync.html)
/// and the
/// [Developer Guide for iOS](http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-sync.html).
class CognitoSyncApi {
  final _client;
  CognitoSyncApi(client)
      : _client = client.configured('Cognito Sync', serializer: 'rest-json');

  /// Initiates a bulk publish of all existing datasets for an Identity Pool to
  /// the configured stream. Customers are limited to one successful bulk
  /// publish per 24 hours. Bulk publish is an asynchronous request, customers
  /// can see the status of the request via the GetBulkPublishDetails operation.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<BulkPublishResponse> bulkPublish(String identityPoolId) async {
    var response_ = await _client.send('BulkPublish', {
      'IdentityPoolId': identityPoolId,
    });
    return BulkPublishResponse.fromJson(response_);
  }

  /// Deletes the specific dataset. The dataset will be deleted permanently, and
  /// the action can't be undone. Datasets that this dataset was merged with
  /// will no longer report the merge. Any subsequent operation on this dataset
  /// will result in a ResourceNotFoundException.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [datasetName]: A string of up to 128 characters. Allowed characters are
  /// a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).
  Future<DeleteDatasetResponse> deleteDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName}) async {
    var response_ = await _client.send('DeleteDataset', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
    });
    return DeleteDatasetResponse.fromJson(response_);
  }

  /// Gets meta data about a dataset by identity and dataset name. With Amazon
  /// Cognito Sync, each identity has access only to its own data. Thus, the
  /// credentials used to make this API call need to have access to the identity
  /// data.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials. You should use Cognito Identity
  /// credentials to make this API call.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [datasetName]: A string of up to 128 characters. Allowed characters are
  /// a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).
  Future<DescribeDatasetResponse> describeDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName}) async {
    var response_ = await _client.send('DescribeDataset', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
    });
    return DescribeDatasetResponse.fromJson(response_);
  }

  /// Gets usage details (for example, data storage) about a particular identity
  /// pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DescribeIdentityPoolUsageResponse> describeIdentityPoolUsage(
      String identityPoolId) async {
    var response_ = await _client.send('DescribeIdentityPoolUsage', {
      'IdentityPoolId': identityPoolId,
    });
    return DescribeIdentityPoolUsageResponse.fromJson(response_);
  }

  /// Gets usage information for an identity, including number of datasets and
  /// data usage.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DescribeIdentityUsageResponse> describeIdentityUsage(
      {@required String identityPoolId, @required String identityId}) async {
    var response_ = await _client.send('DescribeIdentityUsage', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
    });
    return DescribeIdentityUsageResponse.fromJson(response_);
  }

  /// Get the status of the last BulkPublish operation for an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<GetBulkPublishDetailsResponse> getBulkPublishDetails(
      String identityPoolId) async {
    var response_ = await _client.send('GetBulkPublishDetails', {
      'IdentityPoolId': identityPoolId,
    });
    return GetBulkPublishDetailsResponse.fromJson(response_);
  }

  /// Gets the events and the corresponding Lambda functions associated with an
  /// identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: The Cognito Identity Pool ID for the request
  Future<GetCognitoEventsResponse> getCognitoEvents(
      String identityPoolId) async {
    var response_ = await _client.send('GetCognitoEvents', {
      'IdentityPoolId': identityPoolId,
    });
    return GetCognitoEventsResponse.fromJson(response_);
  }

  /// Gets the configuration settings of an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// This is the ID of the pool for which to return a configuration.
  Future<GetIdentityPoolConfigurationResponse> getIdentityPoolConfiguration(
      String identityPoolId) async {
    var response_ = await _client.send('GetIdentityPoolConfiguration', {
      'IdentityPoolId': identityPoolId,
    });
    return GetIdentityPoolConfigurationResponse.fromJson(response_);
  }

  /// Lists datasets for an identity. With Amazon Cognito Sync, each identity
  /// has access only to its own data. Thus, the credentials used to make this
  /// API call need to have access to the identity data.
  ///
  /// ListDatasets can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use the Cognito
  /// Identity credentials to make this API call.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [nextToken]: A pagination token for obtaining the next page of results.
  ///
  /// [maxResults]: The maximum number of results to be returned.
  Future<ListDatasetsResponse> listDatasets(
      {@required String identityPoolId,
      @required String identityId,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListDatasets', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDatasetsResponse.fromJson(response_);
  }

  /// Gets a list of identity pools registered with Cognito.
  ///
  /// ListIdentityPoolUsage can only be called with developer credentials. You
  /// cannot make this API call with the temporary user credentials provided by
  /// Cognito Identity.
  ///
  /// [nextToken]: A pagination token for obtaining the next page of results.
  ///
  /// [maxResults]: The maximum number of results to be returned.
  Future<ListIdentityPoolUsageResponse> listIdentityPoolUsage(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListIdentityPoolUsage', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListIdentityPoolUsageResponse.fromJson(response_);
  }

  /// Gets paginated records, optionally changed after a particular sync count
  /// for a dataset and identity. With Amazon Cognito Sync, each identity has
  /// access only to its own data. Thus, the credentials used to make this API
  /// call need to have access to the identity data.
  ///
  /// ListRecords can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use Cognito
  /// Identity credentials to make this API call.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [datasetName]: A string of up to 128 characters. Allowed characters are
  /// a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// [lastSyncCount]: The last server sync count for this record.
  ///
  /// [nextToken]: A pagination token for obtaining the next page of results.
  ///
  /// [maxResults]: The maximum number of results to be returned.
  ///
  /// [syncSessionToken]: A token containing a session ID, identity ID, and
  /// expiration.
  Future<ListRecordsResponse> listRecords(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      BigInt lastSyncCount,
      String nextToken,
      int maxResults,
      String syncSessionToken}) async {
    var response_ = await _client.send('ListRecords', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
      if (lastSyncCount != null) 'LastSyncCount': lastSyncCount,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (syncSessionToken != null) 'SyncSessionToken': syncSessionToken,
    });
    return ListRecordsResponse.fromJson(response_);
  }

  /// Registers a device to receive push sync notifications.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// Here, the ID of the pool that the identity belongs to.
  ///
  /// [identityId]: The unique ID for this identity.
  ///
  /// [platform]: The SNS platform type (e.g. GCM, SDM, APNS, APNS_SANDBOX).
  ///
  /// [token]: The push token.
  Future<RegisterDeviceResponse> registerDevice(
      {@required String identityPoolId,
      @required String identityId,
      @required String platform,
      @required String token}) async {
    var response_ = await _client.send('RegisterDevice', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'Platform': platform,
      'Token': token,
    });
    return RegisterDeviceResponse.fromJson(response_);
  }

  /// Sets the AWS Lambda function for a given event type for an identity pool.
  /// This request only updates the key/value pair specified. Other key/values
  /// pairs are not updated. To remove a key value pair, pass a empty value for
  /// the particular key.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: The Cognito Identity Pool to use when configuring
  /// Cognito Events
  ///
  /// [events]: The events to configure
  Future<void> setCognitoEvents(
      {@required String identityPoolId,
      @required Map<String, String> events}) async {
    await _client.send('SetCognitoEvents', {
      'IdentityPoolId': identityPoolId,
      'Events': events,
    });
  }

  /// Sets the necessary configuration for push sync.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// This is the ID of the pool to modify.
  ///
  /// [pushSync]: Options to apply to this identity pool for push
  /// synchronization.
  ///
  /// [cognitoStreams]: Options to apply to this identity pool for Amazon
  /// Cognito streams.
  Future<SetIdentityPoolConfigurationResponse> setIdentityPoolConfiguration(
      String identityPoolId,
      {PushSync pushSync,
      CognitoStreams cognitoStreams}) async {
    var response_ = await _client.send('SetIdentityPoolConfiguration', {
      'IdentityPoolId': identityPoolId,
      if (pushSync != null) 'PushSync': pushSync,
      if (cognitoStreams != null) 'CognitoStreams': cognitoStreams,
    });
    return SetIdentityPoolConfigurationResponse.fromJson(response_);
  }

  /// Subscribes to receive notifications when a dataset is modified by another
  /// device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// The ID of the pool to which the identity belongs.
  ///
  /// [identityId]: Unique ID for this identity.
  ///
  /// [datasetName]: The name of the dataset to subcribe to.
  ///
  /// [deviceId]: The unique ID generated for this device by Cognito.
  Future<SubscribeToDatasetResponse> subscribeToDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      @required String deviceId}) async {
    var response_ = await _client.send('SubscribeToDataset', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
      'DeviceId': deviceId,
    });
    return SubscribeToDatasetResponse.fromJson(response_);
  }

  /// Unsubscribes from receiving notifications when a dataset is modified by
  /// another device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// The ID of the pool to which this identity belongs.
  ///
  /// [identityId]: Unique ID for this identity.
  ///
  /// [datasetName]: The name of the dataset from which to unsubcribe.
  ///
  /// [deviceId]: The unique ID generated for this device by Cognito.
  Future<UnsubscribeFromDatasetResponse> unsubscribeFromDataset(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      @required String deviceId}) async {
    var response_ = await _client.send('UnsubscribeFromDataset', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
      'DeviceId': deviceId,
    });
    return UnsubscribeFromDatasetResponse.fromJson(response_);
  }

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
  ///
  /// [identityPoolId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [identityId]: A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// [datasetName]: A string of up to 128 characters. Allowed characters are
  /// a-z, A-Z, 0-9, '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// [deviceId]: The unique ID generated for this device by Cognito.
  ///
  /// [recordPatches]: A list of patch operations.
  ///
  /// [syncSessionToken]: The SyncSessionToken returned by a previous call to
  /// ListRecords for this dataset and identity.
  ///
  /// [clientContext]: Intended to supply a device ID that will populate the
  /// lastModifiedBy field referenced in other methods. The ClientContext field
  /// is not yet implemented.
  Future<UpdateRecordsResponse> updateRecords(
      {@required String identityPoolId,
      @required String identityId,
      @required String datasetName,
      String deviceId,
      List<RecordPatch> recordPatches,
      @required String syncSessionToken,
      String clientContext}) async {
    var response_ = await _client.send('UpdateRecords', {
      'IdentityPoolId': identityPoolId,
      'IdentityId': identityId,
      'DatasetName': datasetName,
      if (deviceId != null) 'DeviceId': deviceId,
      if (recordPatches != null) 'RecordPatches': recordPatches,
      'SyncSessionToken': syncSessionToken,
      if (clientContext != null) 'ClientContext': clientContext,
    });
    return UpdateRecordsResponse.fromJson(response_);
  }
}

/// The output for the BulkPublish operation.
class BulkPublishResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityPoolId;

  BulkPublishResponse({
    this.identityPoolId,
  });
  static BulkPublishResponse fromJson(Map<String, dynamic> json) =>
      BulkPublishResponse(
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
      );
}

/// Configuration options for configure Cognito streams.
class CognitoStreams {
  /// The name of the Cognito stream to receive updates. This stream must be in
  /// the developers account and in the same region as the identity pool.
  final String streamName;

  /// The ARN of the role Amazon Cognito can assume in order to publish to the
  /// stream. This role must grant access to Amazon Cognito (cognito-sync) to
  /// invoke PutRecord on your Cognito stream.
  final String roleArn;

  /// Status of the Cognito streams. Valid values are:
  ///
  /// ENABLED - Streaming of updates to identity pool is enabled.
  ///
  /// DISABLED - Streaming of updates to identity pool is disabled. Bulk publish
  /// will also fail if StreamingStatus is DISABLED.
  final String streamingStatus;

  CognitoStreams({
    this.streamName,
    this.roleArn,
    this.streamingStatus,
  });
  static CognitoStreams fromJson(Map<String, dynamic> json) => CognitoStreams(
        streamName: json.containsKey('StreamName')
            ? json['StreamName'] as String
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        streamingStatus: json.containsKey('StreamingStatus')
            ? json['StreamingStatus'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A collection of data for an identity pool. An identity pool can have
/// multiple datasets. A dataset is per identity and can be general or
/// associated with a particular entity in an application (like a saved game).
/// Datasets are automatically created if they don't exist. Data is synced by
/// dataset, and a dataset can hold up to 1MB of key-value pairs.
class Dataset {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityId;

  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (dash), and '.' (dot).
  final String datasetName;

  /// Date on which the dataset was created.
  final DateTime creationDate;

  /// Date when the dataset was last modified.
  final DateTime lastModifiedDate;

  /// The device that made the last change to this dataset.
  final String lastModifiedBy;

  /// Total size in bytes of the records in this dataset.
  final BigInt dataStorage;

  /// Number of records in this dataset.
  final BigInt numRecords;

  Dataset({
    this.identityId,
    this.datasetName,
    this.creationDate,
    this.lastModifiedDate,
    this.lastModifiedBy,
    this.dataStorage,
    this.numRecords,
  });
  static Dataset fromJson(Map<String, dynamic> json) => Dataset(
        identityId: json.containsKey('IdentityId')
            ? json['IdentityId'] as String
            : null,
        datasetName: json.containsKey('DatasetName')
            ? json['DatasetName'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? DateTime.parse(json['LastModifiedDate'])
            : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        dataStorage: json.containsKey('DataStorage')
            ? BigInt.from(json['DataStorage'])
            : null,
        numRecords: json.containsKey('NumRecords')
            ? BigInt.from(json['NumRecords'])
            : null,
      );
}

/// Response to a successful DeleteDataset request.
class DeleteDatasetResponse {
  /// A collection of data for an identity pool. An identity pool can have
  /// multiple datasets. A dataset is per identity and can be general or
  /// associated with a particular entity in an application (like a saved game).
  /// Datasets are automatically created if they don't exist. Data is synced by
  /// dataset, and a dataset can hold up to 1MB of key-value pairs.
  final Dataset dataset;

  DeleteDatasetResponse({
    this.dataset,
  });
  static DeleteDatasetResponse fromJson(Map<String, dynamic> json) =>
      DeleteDatasetResponse(
        dataset: json.containsKey('Dataset')
            ? Dataset.fromJson(json['Dataset'])
            : null,
      );
}

/// Response to a successful DescribeDataset request.
class DescribeDatasetResponse {
  /// Meta data for a collection of data for an identity. An identity can have
  /// multiple datasets. A dataset can be general or associated with a
  /// particular entity in an application (like a saved game). Datasets are
  /// automatically created if they don't exist. Data is synced by dataset, and
  /// a dataset can hold up to 1MB of key-value pairs.
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  static DescribeDatasetResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetResponse(
        dataset: json.containsKey('Dataset')
            ? Dataset.fromJson(json['Dataset'])
            : null,
      );
}

/// Response to a successful DescribeIdentityPoolUsage request.
class DescribeIdentityPoolUsageResponse {
  /// Information about the usage of the identity pool.
  final IdentityPoolUsage identityPoolUsage;

  DescribeIdentityPoolUsageResponse({
    this.identityPoolUsage,
  });
  static DescribeIdentityPoolUsageResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeIdentityPoolUsageResponse(
        identityPoolUsage: json.containsKey('IdentityPoolUsage')
            ? IdentityPoolUsage.fromJson(json['IdentityPoolUsage'])
            : null,
      );
}

/// The response to a successful DescribeIdentityUsage request.
class DescribeIdentityUsageResponse {
  /// Usage information for the identity.
  final IdentityUsage identityUsage;

  DescribeIdentityUsageResponse({
    this.identityUsage,
  });
  static DescribeIdentityUsageResponse fromJson(Map<String, dynamic> json) =>
      DescribeIdentityUsageResponse(
        identityUsage: json.containsKey('IdentityUsage')
            ? IdentityUsage.fromJson(json['IdentityUsage'])
            : null,
      );
}

/// The output for the GetBulkPublishDetails operation.
class GetBulkPublishDetailsResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityPoolId;

  /// The date/time at which the last bulk publish was initiated.
  final DateTime bulkPublishStartTime;

  /// If BulkPublishStatus is SUCCEEDED, the time the last bulk publish
  /// operation completed.
  final DateTime bulkPublishCompleteTime;

  /// Status of the last bulk publish operation, valid values are:
  ///
  /// NOT_STARTED - No bulk publish has been requested for this identity pool
  ///
  /// IN_PROGRESS - Data is being published to the configured stream
  ///
  /// SUCCEEDED - All data for the identity pool has been published to the
  /// configured stream
  ///
  /// FAILED - Some portion of the data has failed to publish, check
  /// FailureMessage for the cause.
  final String bulkPublishStatus;

  /// If BulkPublishStatus is FAILED this field will contain the error message
  /// that caused the bulk publish to fail.
  final String failureMessage;

  GetBulkPublishDetailsResponse({
    this.identityPoolId,
    this.bulkPublishStartTime,
    this.bulkPublishCompleteTime,
    this.bulkPublishStatus,
    this.failureMessage,
  });
  static GetBulkPublishDetailsResponse fromJson(Map<String, dynamic> json) =>
      GetBulkPublishDetailsResponse(
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
        bulkPublishStartTime: json.containsKey('BulkPublishStartTime')
            ? DateTime.parse(json['BulkPublishStartTime'])
            : null,
        bulkPublishCompleteTime: json.containsKey('BulkPublishCompleteTime')
            ? DateTime.parse(json['BulkPublishCompleteTime'])
            : null,
        bulkPublishStatus: json.containsKey('BulkPublishStatus')
            ? json['BulkPublishStatus'] as String
            : null,
        failureMessage: json.containsKey('FailureMessage')
            ? json['FailureMessage'] as String
            : null,
      );
}

/// The response from the GetCognitoEvents request
class GetCognitoEventsResponse {
  /// The Cognito Events returned from the GetCognitoEvents request
  final Map<String, String> events;

  GetCognitoEventsResponse({
    this.events,
  });
  static GetCognitoEventsResponse fromJson(Map<String, dynamic> json) =>
      GetCognitoEventsResponse(
        events: json.containsKey('Events')
            ? (json['Events'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The output for the GetIdentityPoolConfiguration operation.
class GetIdentityPoolConfigurationResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  final String identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  final PushSync pushSync;

  /// Options to apply to this identity pool for Amazon Cognito streams.
  final CognitoStreams cognitoStreams;

  GetIdentityPoolConfigurationResponse({
    this.identityPoolId,
    this.pushSync,
    this.cognitoStreams,
  });
  static GetIdentityPoolConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      GetIdentityPoolConfigurationResponse(
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
        pushSync: json.containsKey('PushSync')
            ? PushSync.fromJson(json['PushSync'])
            : null,
        cognitoStreams: json.containsKey('CognitoStreams')
            ? CognitoStreams.fromJson(json['CognitoStreams'])
            : null,
      );
}

/// Usage information for the identity pool.
class IdentityPoolUsage {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityPoolId;

  /// Number of sync sessions for the identity pool.
  final BigInt syncSessionsCount;

  /// Data storage information for the identity pool.
  final BigInt dataStorage;

  /// Date on which the identity pool was last modified.
  final DateTime lastModifiedDate;

  IdentityPoolUsage({
    this.identityPoolId,
    this.syncSessionsCount,
    this.dataStorage,
    this.lastModifiedDate,
  });
  static IdentityPoolUsage fromJson(Map<String, dynamic> json) =>
      IdentityPoolUsage(
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
        syncSessionsCount: json.containsKey('SyncSessionsCount')
            ? BigInt.from(json['SyncSessionsCount'])
            : null,
        dataStorage: json.containsKey('DataStorage')
            ? BigInt.from(json['DataStorage'])
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? DateTime.parse(json['LastModifiedDate'])
            : null,
      );
}

/// Usage information for the identity.
class IdentityUsage {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityId;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String identityPoolId;

  /// Date on which the identity was last modified.
  final DateTime lastModifiedDate;

  /// Number of datasets for the identity.
  final int datasetCount;

  /// Total data storage for this identity.
  final BigInt dataStorage;

  IdentityUsage({
    this.identityId,
    this.identityPoolId,
    this.lastModifiedDate,
    this.datasetCount,
    this.dataStorage,
  });
  static IdentityUsage fromJson(Map<String, dynamic> json) => IdentityUsage(
        identityId: json.containsKey('IdentityId')
            ? json['IdentityId'] as String
            : null,
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? DateTime.parse(json['LastModifiedDate'])
            : null,
        datasetCount: json.containsKey('DatasetCount')
            ? json['DatasetCount'] as int
            : null,
        dataStorage: json.containsKey('DataStorage')
            ? BigInt.from(json['DataStorage'])
            : null,
      );
}

/// Returned for a successful ListDatasets request.
class ListDatasetsResponse {
  /// A set of datasets.
  final List<Dataset> datasets;

  /// Number of datasets returned.
  final int count;

  /// A pagination token for obtaining the next page of results.
  final String nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.count,
    this.nextToken,
  });
  static ListDatasetsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetsResponse(
        datasets: json.containsKey('Datasets')
            ? (json['Datasets'] as List)
                .map((e) => Dataset.fromJson(e))
                .toList()
            : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Returned for a successful ListIdentityPoolUsage request.
class ListIdentityPoolUsageResponse {
  /// Usage information for the identity pools.
  final List<IdentityPoolUsage> identityPoolUsages;

  /// The maximum number of results to be returned.
  final int maxResults;

  /// Total number of identities for the identity pool.
  final int count;

  /// A pagination token for obtaining the next page of results.
  final String nextToken;

  ListIdentityPoolUsageResponse({
    this.identityPoolUsages,
    this.maxResults,
    this.count,
    this.nextToken,
  });
  static ListIdentityPoolUsageResponse fromJson(Map<String, dynamic> json) =>
      ListIdentityPoolUsageResponse(
        identityPoolUsages: json.containsKey('IdentityPoolUsages')
            ? (json['IdentityPoolUsages'] as List)
                .map((e) => IdentityPoolUsage.fromJson(e))
                .toList()
            : null,
        maxResults:
            json.containsKey('MaxResults') ? json['MaxResults'] as int : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Returned for a successful ListRecordsRequest.
class ListRecordsResponse {
  /// A list of all records.
  final List<Record> records;

  /// A pagination token for obtaining the next page of results.
  final String nextToken;

  /// Total number of records.
  final int count;

  /// Server sync count for this dataset.
  final BigInt datasetSyncCount;

  /// The user/device that made the last change to this record.
  final String lastModifiedBy;

  /// Names of merged datasets.
  final List<String> mergedDatasetNames;

  /// Indicates whether the dataset exists.
  final bool datasetExists;

  /// A boolean value specifying whether to delete the dataset locally.
  final bool datasetDeletedAfterRequestedSyncCount;

  /// A token containing a session ID, identity ID, and expiration.
  final String syncSessionToken;

  ListRecordsResponse({
    this.records,
    this.nextToken,
    this.count,
    this.datasetSyncCount,
    this.lastModifiedBy,
    this.mergedDatasetNames,
    this.datasetExists,
    this.datasetDeletedAfterRequestedSyncCount,
    this.syncSessionToken,
  });
  static ListRecordsResponse fromJson(Map<String, dynamic> json) =>
      ListRecordsResponse(
        records: json.containsKey('Records')
            ? (json['Records'] as List).map((e) => Record.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        count: json.containsKey('Count') ? json['Count'] as int : null,
        datasetSyncCount: json.containsKey('DatasetSyncCount')
            ? BigInt.from(json['DatasetSyncCount'])
            : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        mergedDatasetNames: json.containsKey('MergedDatasetNames')
            ? (json['MergedDatasetNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        datasetExists: json.containsKey('DatasetExists')
            ? json['DatasetExists'] as bool
            : null,
        datasetDeletedAfterRequestedSyncCount:
            json.containsKey('DatasetDeletedAfterRequestedSyncCount')
                ? json['DatasetDeletedAfterRequestedSyncCount'] as bool
                : null,
        syncSessionToken: json.containsKey('SyncSessionToken')
            ? json['SyncSessionToken'] as String
            : null,
      );
}

/// Configuration options to be applied to the identity pool.
class PushSync {
  /// List of SNS platform application ARNs that could be used by clients.
  final List<String> applicationArns;

  /// A role configured to allow Cognito to call SNS on behalf of the developer.
  final String roleArn;

  PushSync({
    this.applicationArns,
    this.roleArn,
  });
  static PushSync fromJson(Map<String, dynamic> json) => PushSync(
        applicationArns: json.containsKey('ApplicationArns')
            ? (json['ApplicationArns'] as List).map((e) => e as String).toList()
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The basic data structure of a dataset.
class Record {
  /// The key for the record.
  final String key;

  /// The value for the record.
  final String value;

  /// The server sync count for this record.
  final BigInt syncCount;

  /// The date on which the record was last modified.
  final DateTime lastModifiedDate;

  /// The user/device that made the last change to this record.
  final String lastModifiedBy;

  /// The last modified date of the client device.
  final DateTime deviceLastModifiedDate;

  Record({
    this.key,
    this.value,
    this.syncCount,
    this.lastModifiedDate,
    this.lastModifiedBy,
    this.deviceLastModifiedDate,
  });
  static Record fromJson(Map<String, dynamic> json) => Record(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
        syncCount: json.containsKey('SyncCount')
            ? BigInt.from(json['SyncCount'])
            : null,
        lastModifiedDate: json.containsKey('LastModifiedDate')
            ? DateTime.parse(json['LastModifiedDate'])
            : null,
        lastModifiedBy: json.containsKey('LastModifiedBy')
            ? json['LastModifiedBy'] as String
            : null,
        deviceLastModifiedDate: json.containsKey('DeviceLastModifiedDate')
            ? DateTime.parse(json['DeviceLastModifiedDate'])
            : null,
      );
}

/// An update operation for a record.
class RecordPatch {
  /// An operation, either replace or remove.
  final String op;

  /// The key associated with the record patch.
  final String key;

  /// The value associated with the record patch.
  final String value;

  /// Last known server sync count for this record. Set to 0 if unknown.
  final BigInt syncCount;

  /// The last modified date of the client device.
  final DateTime deviceLastModifiedDate;

  RecordPatch({
    @required this.op,
    @required this.key,
    this.value,
    @required this.syncCount,
    this.deviceLastModifiedDate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Response to a RegisterDevice request.
class RegisterDeviceResponse {
  /// The unique ID generated for this device by Cognito.
  final String deviceId;

  RegisterDeviceResponse({
    this.deviceId,
  });
  static RegisterDeviceResponse fromJson(Map<String, dynamic> json) =>
      RegisterDeviceResponse(
        deviceId:
            json.containsKey('DeviceId') ? json['DeviceId'] as String : null,
      );
}

/// The output for the SetIdentityPoolConfiguration operation
class SetIdentityPoolConfigurationResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  final String identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  final PushSync pushSync;

  /// Options to apply to this identity pool for Amazon Cognito streams.
  final CognitoStreams cognitoStreams;

  SetIdentityPoolConfigurationResponse({
    this.identityPoolId,
    this.pushSync,
    this.cognitoStreams,
  });
  static SetIdentityPoolConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      SetIdentityPoolConfigurationResponse(
        identityPoolId: json.containsKey('IdentityPoolId')
            ? json['IdentityPoolId'] as String
            : null,
        pushSync: json.containsKey('PushSync')
            ? PushSync.fromJson(json['PushSync'])
            : null,
        cognitoStreams: json.containsKey('CognitoStreams')
            ? CognitoStreams.fromJson(json['CognitoStreams'])
            : null,
      );
}

/// Response to a SubscribeToDataset request.
class SubscribeToDatasetResponse {
  SubscribeToDatasetResponse();
  static SubscribeToDatasetResponse fromJson(Map<String, dynamic> json) =>
      SubscribeToDatasetResponse();
}

/// Response to an UnsubscribeFromDataset request.
class UnsubscribeFromDatasetResponse {
  UnsubscribeFromDatasetResponse();
  static UnsubscribeFromDatasetResponse fromJson(Map<String, dynamic> json) =>
      UnsubscribeFromDatasetResponse();
}

/// Returned for a successful UpdateRecordsRequest.
class UpdateRecordsResponse {
  /// A list of records that have been updated.
  final List<Record> records;

  UpdateRecordsResponse({
    this.records,
  });
  static UpdateRecordsResponse fromJson(Map<String, dynamic> json) =>
      UpdateRecordsResponse(
        records: json.containsKey('Records')
            ? (json['Records'] as List).map((e) => Record.fromJson(e)).toList()
            : null,
      );
}
