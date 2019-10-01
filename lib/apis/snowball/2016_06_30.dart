import 'package:meta/meta.dart';

/// AWS Snowball is a petabyte-scale data transport solution that uses secure
/// devices to transfer large amounts of data between your on-premises data
/// centers and Amazon Simple Storage Service (Amazon S3). The commands
/// described here provide access to the same functionality that is available in
/// the AWS Snowball Management Console, which enables you to create and manage
/// jobs for Snowball and Snowball Edge devices. To transfer data locally with a
/// device, you'll need to use the Snowball client or the Amazon S3 API adapter
/// for Snowball.
class SnowballApi {
  final _client;
  SnowballApi(client)
      : _client = client.configured('Snowball', serializer: 'json');

  /// Cancels a cluster job. You can only cancel a cluster job while it's in the
  /// `AwaitingQuorum` status. You'll have at least an hour after creating a
  /// cluster job to cancel it.
  ///
  /// [clusterId]: The 39-character ID for the cluster that you want to cancel,
  /// for example `CID123e4567-e89b-12d3-a456-426655440000`.
  Future<CancelClusterResult> cancelCluster(String clusterId) async {
    var response_ = await _client.send('CancelCluster', {
      'ClusterId': clusterId,
    });
    return CancelClusterResult.fromJson(response_);
  }

  /// Cancels the specified job. You can only cancel a job before its `JobState`
  /// value changes to `PreparingAppliance`. Requesting the `ListJobs` or
  /// `DescribeJob` action returns a job's `JobState` as part of the response
  /// element data returned.
  ///
  /// [jobId]: The 39-character job ID for the job that you want to cancel, for
  /// example `JID123e4567-e89b-12d3-a456-426655440000`.
  Future<CancelJobResult> cancelJob(String jobId) async {
    var response_ = await _client.send('CancelJob', {
      'JobId': jobId,
    });
    return CancelJobResult.fromJson(response_);
  }

  /// Creates an address for a Snowball to be shipped to. In most regions,
  /// addresses are validated at the time of creation. The address you provide
  /// must be located within the serviceable area of your region. If the address
  /// is invalid or unsupported, then an exception is thrown.
  ///
  /// [address]: The address that you want the Snowball shipped to.
  Future<CreateAddressResult> createAddress(Address address) async {
    var response_ = await _client.send('CreateAddress', {
      'Address': address,
    });
    return CreateAddressResult.fromJson(response_);
  }

  /// Creates an empty cluster. Each cluster supports five nodes. You use the
  /// CreateJob action separately to create the jobs for each of these nodes.
  /// The cluster does not ship until these five node jobs have been created.
  ///
  /// [jobType]: The type of job for this cluster. Currently, the only job type
  /// supported for clusters is `LOCAL_USE`.
  ///
  /// [resources]: The resources associated with the cluster job. These
  /// resources include Amazon S3 buckets and optional AWS Lambda functions
  /// written in the Python language.
  ///
  /// [description]: An optional description of this specific cluster, for
  /// example `Environmental Data Cluster-01`.
  ///
  /// [addressId]: The ID for the address that you want the cluster shipped to.
  ///
  /// [kmsKeyArn]: The `KmsKeyARN` value that you want to associate with this
  /// cluster. `KmsKeyARN` values are created by using the
  /// [CreateKey](http://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html)
  /// API action in AWS Key Management Service (AWS KMS).
  ///
  /// [roleArn]: The `RoleARN` that you want to associate with this cluster.
  /// `RoleArn` values are created by using the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)
  /// API action in AWS Identity and Access Management (IAM).
  ///
  /// [snowballType]: The type of AWS Snowball device to use for this cluster.
  /// The only supported device types for cluster jobs are `EDGE`, `EDGE_C`, and
  /// `EDGE_CG`.
  ///
  /// [shippingOption]: The shipping speed for each node in this cluster. This
  /// speed doesn't dictate how soon you'll get each Snowball Edge device,
  /// rather it represents how quickly each device moves to its destination
  /// while in transit. Regional shipping speeds are as follows:
  ///
  /// *   In Australia, you have access to express shipping. Typically, devices
  /// shipped express are delivered in about a day.
  ///
  /// *   In the European Union (EU), you have access to express shipping.
  /// Typically, Snowball Edges shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  ///
  /// *   In India, devices are delivered in one to seven days.
  ///
  /// *   In the US, you have access to one-day shipping and two-day shipping.
  ///
  /// [notification]: The Amazon Simple Notification Service (Amazon SNS)
  /// notification settings for this cluster.
  ///
  /// [forwardingAddressId]: The forwarding address ID for a cluster. This field
  /// is not supported in most regions.
  Future<CreateClusterResult> createCluster(
      {@required String jobType,
      @required JobResource resources,
      String description,
      @required String addressId,
      String kmsKeyArn,
      @required String roleArn,
      String snowballType,
      @required String shippingOption,
      Notification notification,
      String forwardingAddressId}) async {
    var response_ = await _client.send('CreateCluster', {
      'JobType': jobType,
      'Resources': resources,
      if (description != null) 'Description': description,
      'AddressId': addressId,
      if (kmsKeyArn != null) 'KmsKeyARN': kmsKeyArn,
      'RoleARN': roleArn,
      if (snowballType != null) 'SnowballType': snowballType,
      'ShippingOption': shippingOption,
      if (notification != null) 'Notification': notification,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
    });
    return CreateClusterResult.fromJson(response_);
  }

  /// Creates a job to import or export data between Amazon S3 and your
  /// on-premises data center. Your AWS account must have the right trust
  /// policies and permissions in place to create a job for Snowball. If you're
  /// creating a job for a node in a cluster, you only need to provide the
  /// `clusterId` value; the other job attributes are inherited from the
  /// cluster.
  ///
  /// [jobType]: Defines the type of job that you're creating.
  ///
  /// [resources]: Defines the Amazon S3 buckets associated with this job.
  ///
  /// With `IMPORT` jobs, you specify the bucket or buckets that your
  /// transferred data will be imported into.
  ///
  /// With `EXPORT` jobs, you specify the bucket or buckets that your
  /// transferred data will be exported from. Optionally, you can also specify a
  /// `KeyRange` value. If you choose to export a range, you define the length
  /// of the range by providing either an inclusive `BeginMarker` value, an
  /// inclusive `EndMarker` value, or both. Ranges are UTF-8 binary sorted.
  ///
  /// [description]: Defines an optional description of this specific job, for
  /// example `Important Photos 2016-08-11`.
  ///
  /// [addressId]: The ID for the address that you want the Snowball shipped to.
  ///
  /// [kmsKeyArn]: The `KmsKeyARN` that you want to associate with this job.
  /// `KmsKeyARN`s are created using the
  /// [CreateKey](http://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html)
  /// AWS Key Management Service (KMS) API action.
  ///
  /// [roleArn]: The `RoleARN` that you want to associate with this job.
  /// `RoleArn`s are created using the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)
  /// AWS Identity and Access Management (IAM) API action.
  ///
  /// [snowballCapacityPreference]: If your job is being created in one of the
  /// US regions, you have the option of specifying what size Snowball you'd
  /// like for this job. In all other regions, Snowballs come with 80 TB in
  /// storage capacity.
  ///
  /// [shippingOption]: The shipping speed for this job. This speed doesn't
  /// dictate how soon you'll get the Snowball, rather it represents how quickly
  /// the Snowball moves to its destination while in transit. Regional shipping
  /// speeds are as follows:
  ///
  /// *   In Australia, you have access to express shipping. Typically,
  /// Snowballs shipped express are delivered in about a day.
  ///
  /// *   In the European Union (EU), you have access to express shipping.
  /// Typically, Snowballs shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  ///
  /// *   In India, Snowballs are delivered in one to seven days.
  ///
  /// *   In the US, you have access to one-day shipping and two-day shipping.
  ///
  /// [notification]: Defines the Amazon Simple Notification Service (Amazon
  /// SNS) notification settings for this job.
  ///
  /// [clusterId]: The ID of a cluster. If you're creating a job for a node in a
  /// cluster, you need to provide only this `clusterId` value. The other job
  /// attributes are inherited from the cluster.
  ///
  /// [snowballType]: The type of AWS Snowball device to use for this job. The
  /// only supported device types for cluster jobs are `EDGE`, `EDGE_C`, and
  /// `EDGE_CG`.
  ///
  /// [forwardingAddressId]: The forwarding address ID for a job. This field is
  /// not supported in most regions.
  Future<CreateJobResult> createJob(
      {String jobType,
      JobResource resources,
      String description,
      String addressId,
      String kmsKeyArn,
      String roleArn,
      String snowballCapacityPreference,
      String shippingOption,
      Notification notification,
      String clusterId,
      String snowballType,
      String forwardingAddressId}) async {
    var response_ = await _client.send('CreateJob', {
      if (jobType != null) 'JobType': jobType,
      if (resources != null) 'Resources': resources,
      if (description != null) 'Description': description,
      if (addressId != null) 'AddressId': addressId,
      if (kmsKeyArn != null) 'KmsKeyARN': kmsKeyArn,
      if (roleArn != null) 'RoleARN': roleArn,
      if (snowballCapacityPreference != null)
        'SnowballCapacityPreference': snowballCapacityPreference,
      if (shippingOption != null) 'ShippingOption': shippingOption,
      if (notification != null) 'Notification': notification,
      if (clusterId != null) 'ClusterId': clusterId,
      if (snowballType != null) 'SnowballType': snowballType,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
    });
    return CreateJobResult.fromJson(response_);
  }

  /// Takes an `AddressId` and returns specific details about that address in
  /// the form of an `Address` object.
  ///
  /// [addressId]: The automatically generated ID for a specific address.
  Future<DescribeAddressResult> describeAddress(String addressId) async {
    var response_ = await _client.send('DescribeAddress', {
      'AddressId': addressId,
    });
    return DescribeAddressResult.fromJson(response_);
  }

  /// Returns a specified number of `ADDRESS` objects. Calling this API in one
  /// of the US regions will return addresses from the list of all addresses
  /// associated with this account in all US regions.
  ///
  /// [maxResults]: The number of `ADDRESS` objects to return.
  ///
  /// [nextToken]: HTTP requests are stateless. To identify what object comes
  /// "next" in the list of `ADDRESS` objects, you have the option of specifying
  /// a value for `NextToken` as the starting point for your list of returned
  /// addresses.
  Future<DescribeAddressesResult> describeAddresses(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeAddresses', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAddressesResult.fromJson(response_);
  }

  /// Returns information about a specific cluster including shipping
  /// information, cluster status, and other important metadata.
  ///
  /// [clusterId]: The automatically generated ID for a cluster.
  Future<DescribeClusterResult> describeCluster(String clusterId) async {
    var response_ = await _client.send('DescribeCluster', {
      'ClusterId': clusterId,
    });
    return DescribeClusterResult.fromJson(response_);
  }

  /// Returns information about a specific job including shipping information,
  /// job status, and other important metadata.
  ///
  /// [jobId]: The automatically generated ID for a job, for example
  /// `JID123e4567-e89b-12d3-a456-426655440000`.
  Future<DescribeJobResult> describeJob(String jobId) async {
    var response_ = await _client.send('DescribeJob', {
      'JobId': jobId,
    });
    return DescribeJobResult.fromJson(response_);
  }

  /// Returns a link to an Amazon S3 presigned URL for the manifest file
  /// associated with the specified `JobId` value. You can access the manifest
  /// file for up to 60 minutes after this request has been made. To access the
  /// manifest file after 60 minutes have passed, you'll have to make another
  /// call to the `GetJobManifest` action.
  ///
  /// The manifest is an encrypted file that you can download after your job
  /// enters the `WithCustomer` status. The manifest is decrypted by using the
  /// `UnlockCode` code value, when you pass both values to the Snowball through
  /// the Snowball client when the client is started for the first time.
  ///
  /// As a best practice, we recommend that you don't save a copy of an
  /// `UnlockCode` value in the same location as the manifest file for that job.
  /// Saving these separately helps prevent unauthorized parties from gaining
  /// access to the Snowball associated with that job.
  ///
  /// The credentials of a given job, including its manifest file and unlock
  /// code, expire 90 days after the job is created.
  ///
  /// [jobId]: The ID for a job that you want to get the manifest file for, for
  /// example `JID123e4567-e89b-12d3-a456-426655440000`.
  Future<GetJobManifestResult> getJobManifest(String jobId) async {
    var response_ = await _client.send('GetJobManifest', {
      'JobId': jobId,
    });
    return GetJobManifestResult.fromJson(response_);
  }

  /// Returns the `UnlockCode` code value for the specified job. A particular
  /// `UnlockCode` value can be accessed for up to 90 days after the associated
  /// job has been created.
  ///
  /// The `UnlockCode` value is a 29-character code with 25 alphanumeric
  /// characters and 4 hyphens. This code is used to decrypt the manifest file
  /// when it is passed along with the manifest to the Snowball through the
  /// Snowball client when the client is started for the first time.
  ///
  /// As a best practice, we recommend that you don't save a copy of the
  /// `UnlockCode` in the same location as the manifest file for that job.
  /// Saving these separately helps prevent unauthorized parties from gaining
  /// access to the Snowball associated with that job.
  ///
  /// [jobId]: The ID for the job that you want to get the `UnlockCode` value
  /// for, for example `JID123e4567-e89b-12d3-a456-426655440000`.
  Future<GetJobUnlockCodeResult> getJobUnlockCode(String jobId) async {
    var response_ = await _client.send('GetJobUnlockCode', {
      'JobId': jobId,
    });
    return GetJobUnlockCodeResult.fromJson(response_);
  }

  /// Returns information about the Snowball service limit for your account, and
  /// also the number of Snowballs your account has in use.
  ///
  /// The default service limit for the number of Snowballs that you can have at
  /// one time is 1. If you want to increase your service limit, contact AWS
  /// Support.
  Future<GetSnowballUsageResult> getSnowballUsage() async {
    var response_ = await _client.send('GetSnowballUsage', {});
    return GetSnowballUsageResult.fromJson(response_);
  }

  /// Returns an array of `JobListEntry` objects of the specified length. Each
  /// `JobListEntry` object is for a job in the specified cluster and contains a
  /// job's state, a job's ID, and other information.
  ///
  /// [clusterId]: The 39-character ID for the cluster that you want to list,
  /// for example `CID123e4567-e89b-12d3-a456-426655440000`.
  ///
  /// [maxResults]: The number of `JobListEntry` objects to return.
  ///
  /// [nextToken]: HTTP requests are stateless. To identify what object comes
  /// "next" in the list of `JobListEntry` objects, you have the option of
  /// specifying `NextToken` as the starting point for your returned list.
  Future<ListClusterJobsResult> listClusterJobs(String clusterId,
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListClusterJobs', {
      'ClusterId': clusterId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListClusterJobsResult.fromJson(response_);
  }

  /// Returns an array of `ClusterListEntry` objects of the specified length.
  /// Each `ClusterListEntry` object contains a cluster's state, a cluster's ID,
  /// and other important status information.
  ///
  /// [maxResults]: The number of `ClusterListEntry` objects to return.
  ///
  /// [nextToken]: HTTP requests are stateless. To identify what object comes
  /// "next" in the list of `ClusterListEntry` objects, you have the option of
  /// specifying `NextToken` as the starting point for your returned list.
  Future<ListClustersResult> listClusters(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListClusters', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListClustersResult.fromJson(response_);
  }

  /// This action returns a list of the different Amazon EC2 Amazon Machine
  /// Images (AMIs) that are owned by your AWS account that would be supported
  /// for use on `EDGE`, `EDGE_C`, and `EDGE_CG` devices. For more information
  /// on compatible AMIs, see
  /// [Using Amazon EC2 Compute Instances](http://docs.aws.amazon.com/snowball/latest/developer-guide/using-ec2.html)
  /// in the _AWS Snowball Developer Guide_.
  ///
  /// [maxResults]: The maximum number of results for the list of compatible
  /// images. Currently, each supported device can store 10 AMIs.
  ///
  /// [nextToken]: HTTP requests are stateless. To identify what object comes
  /// "next" in the list of compatible images, you can specify a value for
  /// `NextToken` as the starting point for your list of returned images.
  Future<ListCompatibleImagesResult> listCompatibleImages(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListCompatibleImages', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListCompatibleImagesResult.fromJson(response_);
  }

  /// Returns an array of `JobListEntry` objects of the specified length. Each
  /// `JobListEntry` object contains a job's state, a job's ID, and a value that
  /// indicates whether the job is a job part, in the case of export jobs.
  /// Calling this API action in one of the US regions will return jobs from the
  /// list of all jobs associated with this account in all US regions.
  ///
  /// [maxResults]: The number of `JobListEntry` objects to return.
  ///
  /// [nextToken]: HTTP requests are stateless. To identify what object comes
  /// "next" in the list of `JobListEntry` objects, you have the option of
  /// specifying `NextToken` as the starting point for your returned list.
  Future<ListJobsResult> listJobs({int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListJobs', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListJobsResult.fromJson(response_);
  }

  /// While a cluster's `ClusterState` value is in the `AwaitingQuorum` state,
  /// you can update some of the information associated with a cluster. Once the
  /// cluster changes to a different job state, usually 60 minutes after the
  /// cluster being created, this action is no longer available.
  ///
  /// [clusterId]: The cluster ID of the cluster that you want to update, for
  /// example `CID123e4567-e89b-12d3-a456-426655440000`.
  ///
  /// [roleArn]: The new role Amazon Resource Name (ARN) that you want to
  /// associate with this cluster. To create a role ARN, use the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)
  /// API action in AWS Identity and Access Management (IAM).
  ///
  /// [description]: The updated description of this cluster.
  ///
  /// [resources]: The updated arrays of JobResource objects that can include
  /// updated S3Resource objects or LambdaResource objects.
  ///
  /// [addressId]: The ID of the updated Address object.
  ///
  /// [shippingOption]: The updated shipping option value of this cluster's
  /// ShippingDetails object.
  ///
  /// [notification]: The new or updated Notification object.
  ///
  /// [forwardingAddressId]: The updated ID for the forwarding address for a
  /// cluster. This field is not supported in most regions.
  Future<UpdateClusterResult> updateCluster(String clusterId,
      {String roleArn,
      String description,
      JobResource resources,
      String addressId,
      String shippingOption,
      Notification notification,
      String forwardingAddressId}) async {
    var response_ = await _client.send('UpdateCluster', {
      'ClusterId': clusterId,
      if (roleArn != null) 'RoleARN': roleArn,
      if (description != null) 'Description': description,
      if (resources != null) 'Resources': resources,
      if (addressId != null) 'AddressId': addressId,
      if (shippingOption != null) 'ShippingOption': shippingOption,
      if (notification != null) 'Notification': notification,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
    });
    return UpdateClusterResult.fromJson(response_);
  }

  /// While a job's `JobState` value is `New`, you can update some of the
  /// information associated with a job. Once the job changes to a different job
  /// state, usually within 60 minutes of the job being created, this action is
  /// no longer available.
  ///
  /// [jobId]: The job ID of the job that you want to update, for example
  /// `JID123e4567-e89b-12d3-a456-426655440000`.
  ///
  /// [roleArn]: The new role Amazon Resource Name (ARN) that you want to
  /// associate with this job. To create a role ARN, use the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)AWS
  /// Identity and Access Management (IAM) API action.
  ///
  /// [notification]: The new or updated Notification object.
  ///
  /// [resources]: The updated `JobResource` object, or the updated JobResource
  /// object.
  ///
  /// [addressId]: The ID of the updated Address object.
  ///
  /// [shippingOption]: The updated shipping option value of this job's
  /// ShippingDetails object.
  ///
  /// [description]: The updated description of this job's JobMetadata object.
  ///
  /// [snowballCapacityPreference]: The updated `SnowballCapacityPreference` of
  /// this job's JobMetadata object. The 50 TB Snowballs are only available in
  /// the US regions.
  ///
  /// [forwardingAddressId]: The updated ID for the forwarding address for a
  /// job. This field is not supported in most regions.
  Future<UpdateJobResult> updateJob(String jobId,
      {String roleArn,
      Notification notification,
      JobResource resources,
      String addressId,
      String shippingOption,
      String description,
      String snowballCapacityPreference,
      String forwardingAddressId}) async {
    var response_ = await _client.send('UpdateJob', {
      'JobId': jobId,
      if (roleArn != null) 'RoleARN': roleArn,
      if (notification != null) 'Notification': notification,
      if (resources != null) 'Resources': resources,
      if (addressId != null) 'AddressId': addressId,
      if (shippingOption != null) 'ShippingOption': shippingOption,
      if (description != null) 'Description': description,
      if (snowballCapacityPreference != null)
        'SnowballCapacityPreference': snowballCapacityPreference,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
    });
    return UpdateJobResult.fromJson(response_);
  }
}

/// The address that you want the Snowball or Snowballs associated with a
/// specific job to be shipped to. Addresses are validated at the time of
/// creation. The address you provide must be located within the serviceable
/// area of your region. Although no individual elements of the `Address` are
/// required, if the address is invalid or unsupported, then an exception is
/// thrown.
class Address {
  /// The unique ID for an address.
  final String addressId;

  /// The name of a person to receive a Snowball at an address.
  final String name;

  /// The name of the company to receive a Snowball at an address.
  final String company;

  /// The first line in a street address that a Snowball is to be delivered to.
  final String street1;

  /// The second line in a street address that a Snowball is to be delivered to.
  final String street2;

  /// The third line in a street address that a Snowball is to be delivered to.
  final String street3;

  /// The city in an address that a Snowball is to be delivered to.
  final String city;

  /// The state or province in an address that a Snowball is to be delivered to.
  final String stateOrProvince;

  /// This field is no longer used and the value is ignored.
  final String prefectureOrDistrict;

  /// This field is no longer used and the value is ignored.
  final String landmark;

  /// The country in an address that a Snowball is to be delivered to.
  final String country;

  /// The postal code in an address that a Snowball is to be delivered to.
  final String postalCode;

  /// The phone number associated with an address that a Snowball is to be
  /// delivered to.
  final String phoneNumber;

  /// If the address you are creating is a primary address, then set this option
  /// to true. This field is not supported in most regions.
  final bool isRestricted;

  Address({
    this.addressId,
    this.name,
    this.company,
    this.street1,
    this.street2,
    this.street3,
    this.city,
    this.stateOrProvince,
    this.prefectureOrDistrict,
    this.landmark,
    this.country,
    this.postalCode,
    this.phoneNumber,
    this.isRestricted,
  });
  static Address fromJson(Map<String, dynamic> json) => Address(
        addressId:
            json.containsKey('AddressId') ? json['AddressId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        company: json.containsKey('Company') ? json['Company'] as String : null,
        street1: json.containsKey('Street1') ? json['Street1'] as String : null,
        street2: json.containsKey('Street2') ? json['Street2'] as String : null,
        street3: json.containsKey('Street3') ? json['Street3'] as String : null,
        city: json.containsKey('City') ? json['City'] as String : null,
        stateOrProvince: json.containsKey('StateOrProvince')
            ? json['StateOrProvince'] as String
            : null,
        prefectureOrDistrict: json.containsKey('PrefectureOrDistrict')
            ? json['PrefectureOrDistrict'] as String
            : null,
        landmark:
            json.containsKey('Landmark') ? json['Landmark'] as String : null,
        country: json.containsKey('Country') ? json['Country'] as String : null,
        postalCode: json.containsKey('PostalCode')
            ? json['PostalCode'] as String
            : null,
        phoneNumber: json.containsKey('PhoneNumber')
            ? json['PhoneNumber'] as String
            : null,
        isRestricted: json.containsKey('IsRestricted')
            ? json['IsRestricted'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CancelClusterResult {
  CancelClusterResult();
  static CancelClusterResult fromJson(Map<String, dynamic> json) =>
      CancelClusterResult();
}

class CancelJobResult {
  CancelJobResult();
  static CancelJobResult fromJson(Map<String, dynamic> json) =>
      CancelJobResult();
}

/// Contains a cluster's state, a cluster's ID, and other important information.
class ClusterListEntry {
  /// The 39-character ID for the cluster that you want to list, for example
  /// `CID123e4567-e89b-12d3-a456-426655440000`.
  final String clusterId;

  /// The current state of this cluster. For information about the state of a
  /// specific node, see JobListEntry$JobState.
  final String clusterState;

  /// The creation date for this cluster.
  final DateTime creationDate;

  /// Defines an optional description of the cluster, for example `Environmental
  /// Data Cluster-01`.
  final String description;

  ClusterListEntry({
    this.clusterId,
    this.clusterState,
    this.creationDate,
    this.description,
  });
  static ClusterListEntry fromJson(Map<String, dynamic> json) =>
      ClusterListEntry(
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        clusterState: json.containsKey('ClusterState')
            ? json['ClusterState'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// Contains metadata about a specific cluster.
class ClusterMetadata {
  /// The automatically generated ID for a cluster.
  final String clusterId;

  /// The optional description of the cluster.
  final String description;

  /// The `KmsKeyARN` Amazon Resource Name (ARN) associated with this cluster.
  /// This ARN was created using the
  /// [CreateKey](http://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html)
  /// API action in AWS Key Management Service (AWS KMS).
  final String kmsKeyArn;

  /// The role ARN associated with this cluster. This ARN was created using the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)
  /// API action in AWS Identity and Access Management (IAM).
  final String roleArn;

  /// The current status of the cluster.
  final String clusterState;

  /// The type of job for this cluster. Currently, the only job type supported
  /// for clusters is `LOCAL_USE`.
  final String jobType;

  /// The type of AWS Snowball device to use for this cluster. The only
  /// supported device types for cluster jobs are `EDGE`, `EDGE_C`, and
  /// `EDGE_CG`.
  final String snowballType;

  /// The creation date for this cluster.
  final DateTime creationDate;

  /// The arrays of JobResource objects that can include updated S3Resource
  /// objects or LambdaResource objects.
  final JobResource resources;

  /// The automatically generated ID for a specific address.
  final String addressId;

  /// The shipping speed for each node in this cluster. This speed doesn't
  /// dictate how soon you'll get each device, rather it represents how quickly
  /// each device moves to its destination while in transit. Regional shipping
  /// speeds are as follows:
  ///
  /// *   In Australia, you have access to express shipping. Typically, devices
  /// shipped express are delivered in about a day.
  ///
  /// *   In the European Union (EU), you have access to express shipping.
  /// Typically, devices shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  ///
  /// *   In India, devices are delivered in one to seven days.
  ///
  /// *   In the US, you have access to one-day shipping and two-day shipping.
  final String shippingOption;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// for this cluster.
  final Notification notification;

  /// The ID of the address that you want a cluster shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most
  /// regions.
  final String forwardingAddressId;

  ClusterMetadata({
    this.clusterId,
    this.description,
    this.kmsKeyArn,
    this.roleArn,
    this.clusterState,
    this.jobType,
    this.snowballType,
    this.creationDate,
    this.resources,
    this.addressId,
    this.shippingOption,
    this.notification,
    this.forwardingAddressId,
  });
  static ClusterMetadata fromJson(Map<String, dynamic> json) => ClusterMetadata(
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        kmsKeyArn:
            json.containsKey('KmsKeyARN') ? json['KmsKeyARN'] as String : null,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
        clusterState: json.containsKey('ClusterState')
            ? json['ClusterState'] as String
            : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
        snowballType: json.containsKey('SnowballType')
            ? json['SnowballType'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        resources: json.containsKey('Resources')
            ? JobResource.fromJson(json['Resources'])
            : null,
        addressId:
            json.containsKey('AddressId') ? json['AddressId'] as String : null,
        shippingOption: json.containsKey('ShippingOption')
            ? json['ShippingOption'] as String
            : null,
        notification: json.containsKey('Notification')
            ? Notification.fromJson(json['Notification'])
            : null,
        forwardingAddressId: json.containsKey('ForwardingAddressId')
            ? json['ForwardingAddressId'] as String
            : null,
      );
}

/// A JSON-formatted object that describes a compatible Amazon Machine Image
/// (AMI). For more information on compatible AMIs, see
/// [Using Amazon EC2 Compute Instances](http://docs.aws.amazon.com/snowball/latest/developer-guide/using-ec2.html)
/// in the _AWS Snowball Developer Guide_.
class CompatibleImage {
  /// The unique identifier for an individual Snowball Edge AMI.
  final String amiId;

  /// The optional name of a compatible image.
  final String name;

  CompatibleImage({
    this.amiId,
    this.name,
  });
  static CompatibleImage fromJson(Map<String, dynamic> json) => CompatibleImage(
        amiId: json.containsKey('AmiId') ? json['AmiId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class CreateAddressResult {
  /// The automatically generated ID for a specific address. You'll use this ID
  /// when you create a job to specify which address you want the Snowball for
  /// that job shipped to.
  final String addressId;

  CreateAddressResult({
    this.addressId,
  });
  static CreateAddressResult fromJson(Map<String, dynamic> json) =>
      CreateAddressResult(
        addressId:
            json.containsKey('AddressId') ? json['AddressId'] as String : null,
      );
}

class CreateClusterResult {
  /// The automatically generated ID for a cluster.
  final String clusterId;

  CreateClusterResult({
    this.clusterId,
  });
  static CreateClusterResult fromJson(Map<String, dynamic> json) =>
      CreateClusterResult(
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
      );
}

class CreateJobResult {
  /// The automatically generated ID for a job, for example
  /// `JID123e4567-e89b-12d3-a456-426655440000`.
  final String jobId;

  CreateJobResult({
    this.jobId,
  });
  static CreateJobResult fromJson(Map<String, dynamic> json) => CreateJobResult(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
      );
}

/// Defines the real-time status of a Snowball's data transfer while the device
/// is at AWS. This data is only available while a job has a `JobState` value of
/// `InProgress`, for both import and export jobs.
class DataTransfer {
  /// The number of bytes transferred between a Snowball and Amazon S3.
  final BigInt bytesTransferred;

  /// The number of objects transferred between a Snowball and Amazon S3.
  final BigInt objectsTransferred;

  /// The total bytes of data for a transfer between a Snowball and Amazon S3.
  /// This value is set to 0 (zero) until all the keys that will be transferred
  /// have been listed.
  final BigInt totalBytes;

  /// The total number of objects for a transfer between a Snowball and Amazon
  /// S3. This value is set to 0 (zero) until all the keys that will be
  /// transferred have been listed.
  final BigInt totalObjects;

  DataTransfer({
    this.bytesTransferred,
    this.objectsTransferred,
    this.totalBytes,
    this.totalObjects,
  });
  static DataTransfer fromJson(Map<String, dynamic> json) => DataTransfer(
        bytesTransferred: json.containsKey('BytesTransferred')
            ? BigInt.from(json['BytesTransferred'])
            : null,
        objectsTransferred: json.containsKey('ObjectsTransferred')
            ? BigInt.from(json['ObjectsTransferred'])
            : null,
        totalBytes: json.containsKey('TotalBytes')
            ? BigInt.from(json['TotalBytes'])
            : null,
        totalObjects: json.containsKey('TotalObjects')
            ? BigInt.from(json['TotalObjects'])
            : null,
      );
}

class DescribeAddressResult {
  /// The address that you want the Snowball or Snowballs associated with a
  /// specific job to be shipped to.
  final Address address;

  DescribeAddressResult({
    this.address,
  });
  static DescribeAddressResult fromJson(Map<String, dynamic> json) =>
      DescribeAddressResult(
        address: json.containsKey('Address')
            ? Address.fromJson(json['Address'])
            : null,
      );
}

class DescribeAddressesResult {
  /// The Snowball shipping addresses that were created for this account.
  final List<Address> addresses;

  /// HTTP requests are stateless. If you use the automatically generated
  /// `NextToken` value in your next `DescribeAddresses` call, your list of
  /// returned addresses will start from this point in the array.
  final String nextToken;

  DescribeAddressesResult({
    this.addresses,
    this.nextToken,
  });
  static DescribeAddressesResult fromJson(Map<String, dynamic> json) =>
      DescribeAddressesResult(
        addresses: json.containsKey('Addresses')
            ? (json['Addresses'] as List)
                .map((e) => Address.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeClusterResult {
  /// Information about a specific cluster, including shipping information,
  /// cluster status, and other important metadata.
  final ClusterMetadata clusterMetadata;

  DescribeClusterResult({
    this.clusterMetadata,
  });
  static DescribeClusterResult fromJson(Map<String, dynamic> json) =>
      DescribeClusterResult(
        clusterMetadata: json.containsKey('ClusterMetadata')
            ? ClusterMetadata.fromJson(json['ClusterMetadata'])
            : null,
      );
}

class DescribeJobResult {
  /// Information about a specific job, including shipping information, job
  /// status, and other important metadata.
  final JobMetadata jobMetadata;

  /// Information about a specific job part (in the case of an export job),
  /// including shipping information, job status, and other important metadata.
  final List<JobMetadata> subJobMetadata;

  DescribeJobResult({
    this.jobMetadata,
    this.subJobMetadata,
  });
  static DescribeJobResult fromJson(Map<String, dynamic> json) =>
      DescribeJobResult(
        jobMetadata: json.containsKey('JobMetadata')
            ? JobMetadata.fromJson(json['JobMetadata'])
            : null,
        subJobMetadata: json.containsKey('SubJobMetadata')
            ? (json['SubJobMetadata'] as List)
                .map((e) => JobMetadata.fromJson(e))
                .toList()
            : null,
      );
}

/// A JSON-formatted object that contains the IDs for an Amazon Machine Image
/// (AMI), including the Amazon EC2 AMI ID and the Snowball Edge AMI ID. Each
/// AMI has these two IDs to simplify identifying the AMI in both the AWS Cloud
/// and on the device.
class Ec2AmiResource {
  /// The ID of the AMI in Amazon EC2.
  final String amiId;

  /// The ID of the AMI on the supported device.
  final String snowballAmiId;

  Ec2AmiResource({
    @required this.amiId,
    this.snowballAmiId,
  });
  static Ec2AmiResource fromJson(Map<String, dynamic> json) => Ec2AmiResource(
        amiId: json['AmiId'] as String,
        snowballAmiId: json.containsKey('SnowballAmiId')
            ? json['SnowballAmiId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The container for the EventTriggerDefinition$EventResourceARN.
class EventTriggerDefinition {
  /// The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an
  /// AWS Lambda function's event trigger associated with this job.
  final String eventResourceArn;

  EventTriggerDefinition({
    this.eventResourceArn,
  });
  static EventTriggerDefinition fromJson(Map<String, dynamic> json) =>
      EventTriggerDefinition(
        eventResourceArn: json.containsKey('EventResourceARN')
            ? json['EventResourceARN'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetJobManifestResult {
  /// The Amazon S3 presigned URL for the manifest file associated with the
  /// specified `JobId` value.
  final String manifestUri;

  GetJobManifestResult({
    this.manifestUri,
  });
  static GetJobManifestResult fromJson(Map<String, dynamic> json) =>
      GetJobManifestResult(
        manifestUri: json.containsKey('ManifestURI')
            ? json['ManifestURI'] as String
            : null,
      );
}

class GetJobUnlockCodeResult {
  /// The `UnlockCode` value for the specified job. The `UnlockCode` value can
  /// be accessed for up to 90 days after the job has been created.
  final String unlockCode;

  GetJobUnlockCodeResult({
    this.unlockCode,
  });
  static GetJobUnlockCodeResult fromJson(Map<String, dynamic> json) =>
      GetJobUnlockCodeResult(
        unlockCode: json.containsKey('UnlockCode')
            ? json['UnlockCode'] as String
            : null,
      );
}

class GetSnowballUsageResult {
  /// The service limit for number of Snowballs this account can have at once.
  /// The default service limit is 1 (one).
  final int snowballLimit;

  /// The number of Snowballs that this account is currently using.
  final int snowballsInUse;

  GetSnowballUsageResult({
    this.snowballLimit,
    this.snowballsInUse,
  });
  static GetSnowballUsageResult fromJson(Map<String, dynamic> json) =>
      GetSnowballUsageResult(
        snowballLimit: json.containsKey('SnowballLimit')
            ? json['SnowballLimit'] as int
            : null,
        snowballsInUse: json.containsKey('SnowballsInUse')
            ? json['SnowballsInUse'] as int
            : null,
      );
}

/// Each `JobListEntry` object contains a job's state, a job's ID, and a value
/// that indicates whether the job is a job part, in the case of an export job.
class JobListEntry {
  /// The automatically generated ID for a job, for example
  /// `JID123e4567-e89b-12d3-a456-426655440000`.
  final String jobId;

  /// The current state of this job.
  final String jobState;

  /// A value that indicates that this job is a master job. A master job
  /// represents a successful request to create an export job. Master jobs
  /// aren't associated with any Snowballs. Instead, each master job will have
  /// at least one job part, and each job part is associated with a Snowball. It
  /// might take some time before the job parts associated with a particular
  /// master job are listed, because they are created after the master job is
  /// created.
  final bool isMaster;

  /// The type of job.
  final String jobType;

  /// The type of device used with this job.
  final String snowballType;

  /// The creation date for this job.
  final DateTime creationDate;

  /// The optional description of this specific job, for example `Important
  /// Photos 2016-08-11`.
  final String description;

  JobListEntry({
    this.jobId,
    this.jobState,
    this.isMaster,
    this.jobType,
    this.snowballType,
    this.creationDate,
    this.description,
  });
  static JobListEntry fromJson(Map<String, dynamic> json) => JobListEntry(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        jobState:
            json.containsKey('JobState') ? json['JobState'] as String : null,
        isMaster:
            json.containsKey('IsMaster') ? json['IsMaster'] as bool : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
        snowballType: json.containsKey('SnowballType')
            ? json['SnowballType'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// Contains job logs. Whenever Snowball is used to import data into or export
/// data out of Amazon S3, you'll have the option of downloading a PDF job
/// report. Job logs are returned as a part of the response syntax of the
/// `DescribeJob` action in the `JobMetadata` data type. The job logs can be
/// accessed for up to 60 minutes after this request has been made. To access
/// any of the job logs after 60 minutes have passed, you'll have to make
/// another call to the `DescribeJob` action.
///
/// For import jobs, the PDF job report becomes available at the end of the
/// import process. For export jobs, your job report typically becomes available
/// while the Snowball for your job part is being delivered to you.
///
/// The job report provides you insight into the state of your Amazon S3 data
/// transfer. The report includes details about your job or job part for your
/// records.
///
/// For deeper visibility into the status of your transferred objects, you can
/// look at the two associated logs: a success log and a failure log. The logs
/// are saved in comma-separated value (CSV) format, and the name of each log
/// includes the ID of the job or job part that the log describes.
class JobLogs {
  /// A link to an Amazon S3 presigned URL where the job completion report is
  /// located.
  final String jobCompletionReportUri;

  /// A link to an Amazon S3 presigned URL where the job success log is located.
  final String jobSuccessLogUri;

  /// A link to an Amazon S3 presigned URL where the job failure log is located.
  final String jobFailureLogUri;

  JobLogs({
    this.jobCompletionReportUri,
    this.jobSuccessLogUri,
    this.jobFailureLogUri,
  });
  static JobLogs fromJson(Map<String, dynamic> json) => JobLogs(
        jobCompletionReportUri: json.containsKey('JobCompletionReportURI')
            ? json['JobCompletionReportURI'] as String
            : null,
        jobSuccessLogUri: json.containsKey('JobSuccessLogURI')
            ? json['JobSuccessLogURI'] as String
            : null,
        jobFailureLogUri: json.containsKey('JobFailureLogURI')
            ? json['JobFailureLogURI'] as String
            : null,
      );
}

/// Contains information about a specific job including shipping information,
/// job status, and other important metadata. This information is returned as a
/// part of the response syntax of the `DescribeJob` action.
class JobMetadata {
  /// The automatically generated ID for a job, for example
  /// `JID123e4567-e89b-12d3-a456-426655440000`.
  final String jobId;

  /// The current status of the jobs.
  final String jobState;

  /// The type of job.
  final String jobType;

  /// The type of device used with this job.
  final String snowballType;

  /// The creation date for this job.
  final DateTime creationDate;

  /// An array of `S3Resource` objects. Each `S3Resource` object represents an
  /// Amazon S3 bucket that your transferred data will be exported from or
  /// imported into.
  final JobResource resources;

  /// The description of the job, provided at job creation.
  final String description;

  /// The Amazon Resource Name (ARN) for the AWS Key Management Service (AWS
  /// KMS) key associated with this job. This ARN was created using the
  /// [CreateKey](http://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html)
  /// API action in AWS KMS.
  final String kmsKeyArn;

  /// The role ARN associated with this job. This ARN was created using the
  /// [CreateRole](http://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html)
  /// API action in AWS Identity and Access Management (IAM).
  final String roleArn;

  /// The ID for the address that you want the Snowball shipped to.
  final String addressId;

  /// A job's shipping information, including inbound and outbound tracking
  /// numbers and shipping speed options.
  final ShippingDetails shippingDetails;

  /// The Snowball capacity preference for this job, specified at job creation.
  /// In US regions, you can choose between 50 TB and 80 TB Snowballs. All other
  /// regions use 80 TB capacity Snowballs.
  final String snowballCapacityPreference;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// associated with a specific job. The `Notification` object is returned as a
  /// part of the response syntax of the `DescribeJob` action in the
  /// `JobMetadata` data type.
  final Notification notification;

  /// A value that defines the real-time status of a Snowball's data transfer
  /// while the device is at AWS. This data is only available while a job has a
  /// `JobState` value of `InProgress`, for both import and export jobs.
  final DataTransfer dataTransferProgress;

  /// Links to Amazon S3 presigned URLs for the job report and logs. For import
  /// jobs, the PDF job report becomes available at the end of the import
  /// process. For export jobs, your job report typically becomes available
  /// while the Snowball for your job part is being delivered to you.
  final JobLogs jobLogInfo;

  /// The 39-character ID for the cluster, for example
  /// `CID123e4567-e89b-12d3-a456-426655440000`.
  final String clusterId;

  /// The ID of the address that you want a job shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most
  /// regions.
  final String forwardingAddressId;

  JobMetadata({
    this.jobId,
    this.jobState,
    this.jobType,
    this.snowballType,
    this.creationDate,
    this.resources,
    this.description,
    this.kmsKeyArn,
    this.roleArn,
    this.addressId,
    this.shippingDetails,
    this.snowballCapacityPreference,
    this.notification,
    this.dataTransferProgress,
    this.jobLogInfo,
    this.clusterId,
    this.forwardingAddressId,
  });
  static JobMetadata fromJson(Map<String, dynamic> json) => JobMetadata(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        jobState:
            json.containsKey('JobState') ? json['JobState'] as String : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
        snowballType: json.containsKey('SnowballType')
            ? json['SnowballType'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        resources: json.containsKey('Resources')
            ? JobResource.fromJson(json['Resources'])
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        kmsKeyArn:
            json.containsKey('KmsKeyARN') ? json['KmsKeyARN'] as String : null,
        roleArn: json.containsKey('RoleARN') ? json['RoleARN'] as String : null,
        addressId:
            json.containsKey('AddressId') ? json['AddressId'] as String : null,
        shippingDetails: json.containsKey('ShippingDetails')
            ? ShippingDetails.fromJson(json['ShippingDetails'])
            : null,
        snowballCapacityPreference:
            json.containsKey('SnowballCapacityPreference')
                ? json['SnowballCapacityPreference'] as String
                : null,
        notification: json.containsKey('Notification')
            ? Notification.fromJson(json['Notification'])
            : null,
        dataTransferProgress: json.containsKey('DataTransferProgress')
            ? DataTransfer.fromJson(json['DataTransferProgress'])
            : null,
        jobLogInfo: json.containsKey('JobLogInfo')
            ? JobLogs.fromJson(json['JobLogInfo'])
            : null,
        clusterId:
            json.containsKey('ClusterId') ? json['ClusterId'] as String : null,
        forwardingAddressId: json.containsKey('ForwardingAddressId')
            ? json['ForwardingAddressId'] as String
            : null,
      );
}

/// Contains an array of AWS resource objects. Each object represents an Amazon
/// S3 bucket, an AWS Lambda function, or an Amazon Machine Image (AMI) based on
/// Amazon EC2 that is associated with a particular job.
class JobResource {
  /// An array of `S3Resource` objects.
  final List<S3Resource> s3Resources;

  /// The Python-language Lambda functions for this job.
  final List<LambdaResource> lambdaResources;

  /// The Amazon Machine Images (AMIs) associated with this job.
  final List<Ec2AmiResource> ec2AmiResources;

  JobResource({
    this.s3Resources,
    this.lambdaResources,
    this.ec2AmiResources,
  });
  static JobResource fromJson(Map<String, dynamic> json) => JobResource(
        s3Resources: json.containsKey('S3Resources')
            ? (json['S3Resources'] as List)
                .map((e) => S3Resource.fromJson(e))
                .toList()
            : null,
        lambdaResources: json.containsKey('LambdaResources')
            ? (json['LambdaResources'] as List)
                .map((e) => LambdaResource.fromJson(e))
                .toList()
            : null,
        ec2AmiResources: json.containsKey('Ec2AmiResources')
            ? (json['Ec2AmiResources'] as List)
                .map((e) => Ec2AmiResource.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains a key range. For export jobs, a `S3Resource` object can have an
/// optional `KeyRange` value. The length of the range is defined at job
/// creation, and has either an inclusive `BeginMarker`, an inclusive
/// `EndMarker`, or both. Ranges are UTF-8 binary sorted.
class KeyRange {
  /// The key that starts an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  final String beginMarker;

  /// The key that ends an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  final String endMarker;

  KeyRange({
    this.beginMarker,
    this.endMarker,
  });
  static KeyRange fromJson(Map<String, dynamic> json) => KeyRange(
        beginMarker: json.containsKey('BeginMarker')
            ? json['BeginMarker'] as String
            : null,
        endMarker:
            json.containsKey('EndMarker') ? json['EndMarker'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Identifies
class LambdaResource {
  /// An Amazon Resource Name (ARN) that represents an AWS Lambda function to be
  /// triggered by PUT object actions on the associated local Amazon S3
  /// resource.
  final String lambdaArn;

  /// The array of ARNs for S3Resource objects to trigger the LambdaResource
  /// objects associated with this job.
  final List<EventTriggerDefinition> eventTriggers;

  LambdaResource({
    this.lambdaArn,
    this.eventTriggers,
  });
  static LambdaResource fromJson(Map<String, dynamic> json) => LambdaResource(
        lambdaArn:
            json.containsKey('LambdaArn') ? json['LambdaArn'] as String : null,
        eventTriggers: json.containsKey('EventTriggers')
            ? (json['EventTriggers'] as List)
                .map((e) => EventTriggerDefinition.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListClusterJobsResult {
  /// Each `JobListEntry` object contains a job's state, a job's ID, and a value
  /// that indicates whether the job is a job part, in the case of export jobs.
  final List<JobListEntry> jobListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// `NextToken` value in your next `ListClusterJobsResult` call, your list of
  /// returned jobs will start from this point in the array.
  final String nextToken;

  ListClusterJobsResult({
    this.jobListEntries,
    this.nextToken,
  });
  static ListClusterJobsResult fromJson(Map<String, dynamic> json) =>
      ListClusterJobsResult(
        jobListEntries: json.containsKey('JobListEntries')
            ? (json['JobListEntries'] as List)
                .map((e) => JobListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListClustersResult {
  /// Each `ClusterListEntry` object contains a cluster's state, a cluster's ID,
  /// and other important status information.
  final List<ClusterListEntry> clusterListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// `NextToken` value in your next `ClusterListEntry` call, your list of
  /// returned clusters will start from this point in the array.
  final String nextToken;

  ListClustersResult({
    this.clusterListEntries,
    this.nextToken,
  });
  static ListClustersResult fromJson(Map<String, dynamic> json) =>
      ListClustersResult(
        clusterListEntries: json.containsKey('ClusterListEntries')
            ? (json['ClusterListEntries'] as List)
                .map((e) => ClusterListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListCompatibleImagesResult {
  /// A JSON-formatted object that describes a compatible AMI.
  final List<CompatibleImage> compatibleImages;

  /// Because HTTP requests are stateless, this is the starting point for your
  /// next list of returned images.
  final String nextToken;

  ListCompatibleImagesResult({
    this.compatibleImages,
    this.nextToken,
  });
  static ListCompatibleImagesResult fromJson(Map<String, dynamic> json) =>
      ListCompatibleImagesResult(
        compatibleImages: json.containsKey('CompatibleImages')
            ? (json['CompatibleImages'] as List)
                .map((e) => CompatibleImage.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListJobsResult {
  /// Each `JobListEntry` object contains a job's state, a job's ID, and a value
  /// that indicates whether the job is a job part, in the case of export jobs.
  final List<JobListEntry> jobListEntries;

  /// HTTP requests are stateless. If you use this automatically generated
  /// `NextToken` value in your next `ListJobs` call, your returned
  /// `JobListEntry` objects will start from this point in the array.
  final String nextToken;

  ListJobsResult({
    this.jobListEntries,
    this.nextToken,
  });
  static ListJobsResult fromJson(Map<String, dynamic> json) => ListJobsResult(
        jobListEntries: json.containsKey('JobListEntries')
            ? (json['JobListEntries'] as List)
                .map((e) => JobListEntry.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The Amazon Simple Notification Service (Amazon SNS) notification settings
/// associated with a specific job. The `Notification` object is returned as a
/// part of the response syntax of the `DescribeJob` action in the `JobMetadata`
/// data type.
///
/// When the notification settings are defined during job creation, you can
/// choose to notify based on a specific set of job states using the
/// `JobStatesToNotify` array of strings, or you can specify that you want to
/// have Amazon SNS notifications sent out for all job states with `NotifyAll`
/// set to true.
class Notification {
  /// The new SNS `TopicArn` that you want to associate with this job. You can
  /// create Amazon Resource Names (ARNs) for topics by using the
  /// [CreateTopic](http://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html)
  /// Amazon SNS API action.
  ///
  /// You can subscribe email addresses to an Amazon SNS topic through the AWS
  /// Management Console, or by using the
  /// [Subscribe](http://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html)
  /// AWS Simple Notification Service (SNS) API action.
  final String snsTopicArn;

  /// The list of job states that will trigger a notification for this job.
  final List<String> jobStatesToNotify;

  /// Any change in job state will trigger a notification for this job.
  final bool notifyAll;

  Notification({
    this.snsTopicArn,
    this.jobStatesToNotify,
    this.notifyAll,
  });
  static Notification fromJson(Map<String, dynamic> json) => Notification(
        snsTopicArn: json.containsKey('SnsTopicARN')
            ? json['SnsTopicARN'] as String
            : null,
        jobStatesToNotify: json.containsKey('JobStatesToNotify')
            ? (json['JobStatesToNotify'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        notifyAll:
            json.containsKey('NotifyAll') ? json['NotifyAll'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Each `S3Resource` object represents an Amazon S3 bucket that your
/// transferred data will be exported from or imported into. For export jobs,
/// this object can have an optional `KeyRange` value. The length of the range
/// is defined at job creation, and has either an inclusive `BeginMarker`, an
/// inclusive `EndMarker`, or both. Ranges are UTF-8 binary sorted.
class S3Resource {
  /// The Amazon Resource Name (ARN) of an Amazon S3 bucket.
  final String bucketArn;

  /// For export jobs, you can provide an optional `KeyRange` within a specific
  /// Amazon S3 bucket. The length of the range is defined at job creation, and
  /// has either an inclusive `BeginMarker`, an inclusive `EndMarker`, or both.
  /// Ranges are UTF-8 binary sorted.
  final KeyRange keyRange;

  S3Resource({
    this.bucketArn,
    this.keyRange,
  });
  static S3Resource fromJson(Map<String, dynamic> json) => S3Resource(
        bucketArn:
            json.containsKey('BucketArn') ? json['BucketArn'] as String : null,
        keyRange: json.containsKey('KeyRange')
            ? KeyRange.fromJson(json['KeyRange'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The `Status` and `TrackingNumber` information for an inbound or outbound
/// shipment.
class Shipment {
  /// Status information for a shipment.
  final String status;

  /// The tracking number for this job. Using this tracking number with your
  /// region's carrier's website, you can track a Snowball as the carrier
  /// transports it.
  ///
  /// For India, the carrier is Amazon Logistics. For all other regions, UPS is
  /// the carrier.
  final String trackingNumber;

  Shipment({
    this.status,
    this.trackingNumber,
  });
  static Shipment fromJson(Map<String, dynamic> json) => Shipment(
        status: json.containsKey('Status') ? json['Status'] as String : null,
        trackingNumber: json.containsKey('TrackingNumber')
            ? json['TrackingNumber'] as String
            : null,
      );
}

/// A job's shipping information, including inbound and outbound tracking
/// numbers and shipping speed options.
class ShippingDetails {
  /// The shipping speed for a particular job. This speed doesn't dictate how
  /// soon you'll get the Snowball from the job's creation date. This speed
  /// represents how quickly it moves to its destination while in transit.
  /// Regional shipping speeds are as follows:
  ///
  /// *   In Australia, you have access to express shipping. Typically,
  /// Snowballs shipped express are delivered in about a day.
  ///
  /// *   In the European Union (EU), you have access to express shipping.
  /// Typically, Snowballs shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  ///
  /// *   In India, Snowballs are delivered in one to seven days.
  ///
  /// *   In the United States of America (US), you have access to one-day
  /// shipping and two-day shipping.
  final String shippingOption;

  /// The `Status` and `TrackingNumber` values for a Snowball being returned to
  /// AWS for a particular job.
  final Shipment inboundShipment;

  /// The `Status` and `TrackingNumber` values for a Snowball being delivered to
  /// the address that you specified for a particular job.
  final Shipment outboundShipment;

  ShippingDetails({
    this.shippingOption,
    this.inboundShipment,
    this.outboundShipment,
  });
  static ShippingDetails fromJson(Map<String, dynamic> json) => ShippingDetails(
        shippingOption: json.containsKey('ShippingOption')
            ? json['ShippingOption'] as String
            : null,
        inboundShipment: json.containsKey('InboundShipment')
            ? Shipment.fromJson(json['InboundShipment'])
            : null,
        outboundShipment: json.containsKey('OutboundShipment')
            ? Shipment.fromJson(json['OutboundShipment'])
            : null,
      );
}

class UpdateClusterResult {
  UpdateClusterResult();
  static UpdateClusterResult fromJson(Map<String, dynamic> json) =>
      UpdateClusterResult();
}

class UpdateJobResult {
  UpdateJobResult();
  static UpdateJobResult fromJson(Map<String, dynamic> json) =>
      UpdateJobResult();
}
