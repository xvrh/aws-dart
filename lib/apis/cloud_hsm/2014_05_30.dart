import 'package:meta/meta.dart';

/// AWS CloudHSM Service
///
/// This is documentation for **AWS CloudHSM Classic**. For more information,
/// see [AWS CloudHSM Classic
/// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
/// Classic User Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/),
/// and the [AWS CloudHSM Classic API
/// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
///
///  **For information about the current version of AWS CloudHSM**, see [AWS
/// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
/// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the [AWS
/// CloudHSM API
/// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
class CloudHsmApi {
  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Adds or overwrites one or more tags for the specified AWS CloudHSM
  /// resource.
  ///
  /// Each tag consists of a key and a value. Tag keys must be unique to each
  /// resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the AWS CloudHSM resource
  /// to tag.
  ///
  /// [tagList]: One or more tags.
  Future<AddTagsToResourceResponse> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tagList}) async {
    return AddTagsToResourceResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Creates a high-availability partition group. A high-availability partition
  /// group is a group of partitions that spans multiple physical HSMs.
  ///
  /// [label]: The label of the new high-availability partition group.
  Future<CreateHapgResponse> createHapg(String label) async {
    return CreateHapgResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Creates an uninitialized HSM instance.
  ///
  /// There is an upfront fee charged for each HSM instance that you create with
  /// the `CreateHsm` operation. If you accidentally provision an HSM and want
  /// to request a refund, delete the instance using the DeleteHsm operation, go
  /// to the [AWS Support Center](https://console.aws.amazon.com/support/home),
  /// create a new case, and select **Account and Billing Support**.
  ///
  ///
  ///
  /// It can take up to 20 minutes to create and provision an HSM. You can
  /// monitor the status of the HSM with the DescribeHsm operation. The HSM is
  /// ready to be initialized when the status changes to `RUNNING`.
  ///
  /// [subnetId]: The identifier of the subnet in your VPC in which to place the
  /// HSM.
  ///
  /// [sshKey]: The SSH public key to install on the HSM.
  ///
  /// [eniIp]: The IP address to assign to the HSM's ENI.
  ///
  /// If an IP address is not specified, an IP address will be randomly chosen
  /// from the CIDR range of the subnet.
  ///
  /// [iamRoleArn]: The ARN of an IAM role to enable the AWS CloudHSM service to
  /// allocate an ENI on your behalf.
  ///
  /// [externalId]: The external ID from `IamRoleArn`, if present.
  ///
  /// [clientToken]: A user-defined token to ensure idempotence. Subsequent
  /// calls to this operation with the same token will be ignored.
  ///
  /// [syslogIp]: The IP address for the syslog monitoring server. The AWS
  /// CloudHSM service only supports one syslog monitoring server.
  Future<CreateHsmResponse> createHsm(
      {@required String subnetId,
      @required String sshKey,
      String eniIp,
      @required String iamRoleArn,
      String externalId,
      @required String subscriptionType,
      String clientToken,
      String syslogIp}) async {
    return CreateHsmResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Creates an HSM client.
  ///
  /// [label]: The label for the client.
  ///
  /// [certificate]: The contents of a Base64-Encoded X.509 v3 certificate to be
  /// installed on the HSMs used by this client.
  Future<CreateLunaClientResponse> createLunaClient(String certificate,
      {String label}) async {
    return CreateLunaClientResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Deletes a high-availability partition group.
  ///
  /// [hapgArn]: The ARN of the high-availability partition group to delete.
  Future<DeleteHapgResponse> deleteHapg(String hapgArn) async {
    return DeleteHapgResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Deletes an HSM. After completion, this operation cannot be undone and your
  /// key material cannot be recovered.
  ///
  /// [hsmArn]: The ARN of the HSM to delete.
  Future<DeleteHsmResponse> deleteHsm(String hsmArn) async {
    return DeleteHsmResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Deletes a client.
  ///
  /// [clientArn]: The ARN of the client to delete.
  Future<DeleteLunaClientResponse> deleteLunaClient(String clientArn) async {
    return DeleteLunaClientResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Retrieves information about a high-availability partition group.
  ///
  /// [hapgArn]: The ARN of the high-availability partition group to describe.
  Future<DescribeHapgResponse> describeHapg(String hapgArn) async {
    return DescribeHapgResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Retrieves information about an HSM. You can identify the HSM by its ARN or
  /// its serial number.
  ///
  /// [hsmArn]: The ARN of the HSM. Either the `HsmArn` or the `SerialNumber`
  /// parameter must be specified.
  ///
  /// [hsmSerialNumber]: The serial number of the HSM. Either the `HsmArn` or
  /// the `HsmSerialNumber` parameter must be specified.
  Future<DescribeHsmResponse> describeHsm(
      {String hsmArn, String hsmSerialNumber}) async {
    return DescribeHsmResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Retrieves information about an HSM client.
  ///
  /// [clientArn]: The ARN of the client.
  ///
  /// [certificateFingerprint]: The certificate fingerprint.
  Future<DescribeLunaClientResponse> describeLunaClient(
      {String clientArn, String certificateFingerprint}) async {
    return DescribeLunaClientResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Gets the configuration files necessary to connect to all high availability
  /// partition groups the client is associated with.
  ///
  /// [clientArn]: The ARN of the client.
  ///
  /// [clientVersion]: The client version.
  ///
  /// [hapgList]: A list of ARNs that identify the high-availability partition
  /// groups that are associated with the client.
  Future<GetConfigResponse> getConfig(
      {@required String clientArn,
      @required String clientVersion,
      @required List<String> hapgList}) async {
    return GetConfigResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Lists the Availability Zones that have available AWS CloudHSM capacity.
  Future<ListAvailableZonesResponse> listAvailableZones() async {
    return ListAvailableZonesResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Lists the high-availability partition groups for the account.
  ///
  /// This operation supports pagination with the use of the `NextToken` member.
  /// If more results are available, the `NextToken` member of the response
  /// contains a token that you pass in the next call to `ListHapgs` to retrieve
  /// the next set of items.
  ///
  /// [nextToken]: The `NextToken` value from a previous call to `ListHapgs`.
  /// Pass null if this is the first call.
  Future<ListHapgsResponse> listHapgs({String nextToken}) async {
    return ListHapgsResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Retrieves the identifiers of all of the HSMs provisioned for the current
  /// customer.
  ///
  /// This operation supports pagination with the use of the `NextToken` member.
  /// If more results are available, the `NextToken` member of the response
  /// contains a token that you pass in the next call to `ListHsms` to retrieve
  /// the next set of items.
  ///
  /// [nextToken]: The `NextToken` value from a previous call to `ListHsms`.
  /// Pass null if this is the first call.
  Future<ListHsmsResponse> listHsms({String nextToken}) async {
    return ListHsmsResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Lists all of the clients.
  ///
  /// This operation supports pagination with the use of the `NextToken` member.
  /// If more results are available, the `NextToken` member of the response
  /// contains a token that you pass in the next call to `ListLunaClients` to
  /// retrieve the next set of items.
  ///
  /// [nextToken]: The `NextToken` value from a previous call to
  /// `ListLunaClients`. Pass null if this is the first call.
  Future<ListLunaClientsResponse> listLunaClients({String nextToken}) async {
    return ListLunaClientsResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Returns a list of all tags for the specified AWS CloudHSM resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the AWS CloudHSM
  /// resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Modifies an existing high-availability partition group.
  ///
  /// [hapgArn]: The ARN of the high-availability partition group to modify.
  ///
  /// [label]: The new label for the high-availability partition group.
  ///
  /// [partitionSerialList]: The list of partition serial numbers to make
  /// members of the high-availability partition group.
  Future<ModifyHapgResponse> modifyHapg(String hapgArn,
      {String label, List<String> partitionSerialList}) async {
    return ModifyHapgResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Modifies an HSM.
  ///
  ///
  ///
  /// This operation can result in the HSM being offline for up to 15 minutes
  /// while the AWS CloudHSM service is reconfigured. If you are modifying a
  /// production HSM, you should ensure that your AWS CloudHSM service is
  /// configured for high availability, and consider executing this operation
  /// during a maintenance window.
  ///
  /// [hsmArn]: The ARN of the HSM to modify.
  ///
  /// [subnetId]: The new identifier of the subnet that the HSM is in. The new
  /// subnet must be in the same Availability Zone as the current subnet.
  ///
  /// [eniIp]: The new IP address for the elastic network interface (ENI)
  /// attached to the HSM.
  ///
  /// If the HSM is moved to a different subnet, and an IP address is not
  /// specified, an IP address will be randomly chosen from the CIDR range of
  /// the new subnet.
  ///
  /// [iamRoleArn]: The new IAM role ARN.
  ///
  /// [externalId]: The new external ID.
  ///
  /// [syslogIp]: The new IP address for the syslog monitoring server. The AWS
  /// CloudHSM service only supports one syslog monitoring server.
  Future<ModifyHsmResponse> modifyHsm(String hsmArn,
      {String subnetId,
      String eniIp,
      String iamRoleArn,
      String externalId,
      String syslogIp}) async {
    return ModifyHsmResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Modifies the certificate used by the client.
  ///
  /// This action can potentially start a workflow to install the new
  /// certificate on the client's HSMs.
  ///
  /// [clientArn]: The ARN of the client.
  ///
  /// [certificate]: The new certificate for the client.
  Future<ModifyLunaClientResponse> modifyLunaClient(
      {@required String clientArn, @required String certificate}) async {
    return ModifyLunaClientResponse.fromJson({});
  }

  /// This is documentation for **AWS CloudHSM Classic**. For more information,
  /// see [AWS CloudHSM Classic
  /// FAQs](http://aws.amazon.com/cloudhsm/faqs-classic/), the [AWS CloudHSM
  /// Classic User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/classic/userguide/), and the
  /// [AWS CloudHSM Classic API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/classic/APIReference/).
  ///
  ///  **For information about the current version of AWS CloudHSM**, see [AWS
  /// CloudHSM](http://aws.amazon.com/cloudhsm/), the [AWS CloudHSM User
  /// Guide](http://docs.aws.amazon.com/cloudhsm/latest/userguide/), and the
  /// [AWS CloudHSM API
  /// Reference](http://docs.aws.amazon.com/cloudhsm/latest/APIReference/).
  ///
  /// Removes one or more tags from the specified AWS CloudHSM resource.
  ///
  /// To remove a tag, specify only the tag key to remove (not the value). To
  /// overwrite the value for an existing tag, use AddTagsToResource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the AWS CloudHSM
  /// resource.
  ///
  /// [tagKeyList]: The tag key or keys to remove.
  ///
  /// Specify only the tag key to remove (not the value). To overwrite the value
  /// for an existing tag, use AddTagsToResource.
  Future<RemoveTagsFromResourceResponse> removeTagsFromResource(
      {@required String resourceArn, @required List<String> tagKeyList}) async {
    return RemoveTagsFromResourceResponse.fromJson({});
  }
}

class AddTagsToResourceResponse {
  /// The status of the operation.
  final String status;

  AddTagsToResourceResponse({
    @required this.status,
  });
  static AddTagsToResourceResponse fromJson(Map<String, dynamic> json) =>
      AddTagsToResourceResponse();
}

class CreateHapgResponse {
  /// The ARN of the high-availability partition group.
  final String hapgArn;

  CreateHapgResponse({
    this.hapgArn,
  });
  static CreateHapgResponse fromJson(Map<String, dynamic> json) =>
      CreateHapgResponse();
}

class CreateHsmResponse {
  /// The ARN of the HSM.
  final String hsmArn;

  CreateHsmResponse({
    this.hsmArn,
  });
  static CreateHsmResponse fromJson(Map<String, dynamic> json) =>
      CreateHsmResponse();
}

class CreateLunaClientResponse {
  /// The ARN of the client.
  final String clientArn;

  CreateLunaClientResponse({
    this.clientArn,
  });
  static CreateLunaClientResponse fromJson(Map<String, dynamic> json) =>
      CreateLunaClientResponse();
}

class DeleteHapgResponse {
  /// The status of the action.
  final String status;

  DeleteHapgResponse({
    @required this.status,
  });
  static DeleteHapgResponse fromJson(Map<String, dynamic> json) =>
      DeleteHapgResponse();
}

class DeleteHsmResponse {
  /// The status of the operation.
  final String status;

  DeleteHsmResponse({
    @required this.status,
  });
  static DeleteHsmResponse fromJson(Map<String, dynamic> json) =>
      DeleteHsmResponse();
}

class DeleteLunaClientResponse {
  /// The status of the action.
  final String status;

  DeleteLunaClientResponse({
    @required this.status,
  });
  static DeleteLunaClientResponse fromJson(Map<String, dynamic> json) =>
      DeleteLunaClientResponse();
}

class DescribeHapgResponse {
  /// The ARN of the high-availability partition group.
  final String hapgArn;

  /// The serial number of the high-availability partition group.
  final String hapgSerial;

  final List<String> hsmsLastActionFailed;

  final List<String> hsmsPendingDeletion;

  final List<String> hsmsPendingRegistration;

  /// The label for the high-availability partition group.
  final String label;

  /// The date and time the high-availability partition group was last modified.
  final String lastModifiedTimestamp;

  /// The list of partition serial numbers that belong to the high-availability
  /// partition group.
  final List<String> partitionSerialList;

  /// The state of the high-availability partition group.
  final String state;

  DescribeHapgResponse({
    this.hapgArn,
    this.hapgSerial,
    this.hsmsLastActionFailed,
    this.hsmsPendingDeletion,
    this.hsmsPendingRegistration,
    this.label,
    this.lastModifiedTimestamp,
    this.partitionSerialList,
    this.state,
  });
  static DescribeHapgResponse fromJson(Map<String, dynamic> json) =>
      DescribeHapgResponse();
}

class DescribeHsmResponse {
  /// The ARN of the HSM.
  final String hsmArn;

  /// The status of the HSM.
  final String status;

  /// Contains additional information about the status of the HSM.
  final String statusDetails;

  /// The Availability Zone that the HSM is in.
  final String availabilityZone;

  /// The identifier of the elastic network interface (ENI) attached to the HSM.
  final String eniId;

  /// The IP address assigned to the HSM's ENI.
  final String eniIp;

  final String subscriptionType;

  /// The subscription start date.
  final String subscriptionStartDate;

  /// The subscription end date.
  final String subscriptionEndDate;

  /// The identifier of the VPC that the HSM is in.
  final String vpcId;

  /// The identifier of the subnet that the HSM is in.
  final String subnetId;

  /// The ARN of the IAM role assigned to the HSM.
  final String iamRoleArn;

  /// The serial number of the HSM.
  final String serialNumber;

  /// The name of the HSM vendor.
  final String vendorName;

  /// The HSM model type.
  final String hsmType;

  /// The HSM software version.
  final String softwareVersion;

  /// The public SSH key.
  final String sshPublicKey;

  /// The date and time that the SSH key was last updated.
  final String sshKeyLastUpdated;

  /// The URI of the certificate server.
  final String serverCertUri;

  /// The date and time that the server certificate was last updated.
  final String serverCertLastUpdated;

  /// The list of partitions on the HSM.
  final List<String> partitions;

  DescribeHsmResponse({
    this.hsmArn,
    this.status,
    this.statusDetails,
    this.availabilityZone,
    this.eniId,
    this.eniIp,
    this.subscriptionType,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.vpcId,
    this.subnetId,
    this.iamRoleArn,
    this.serialNumber,
    this.vendorName,
    this.hsmType,
    this.softwareVersion,
    this.sshPublicKey,
    this.sshKeyLastUpdated,
    this.serverCertUri,
    this.serverCertLastUpdated,
    this.partitions,
  });
  static DescribeHsmResponse fromJson(Map<String, dynamic> json) =>
      DescribeHsmResponse();
}

class DescribeLunaClientResponse {
  /// The ARN of the client.
  final String clientArn;

  /// The certificate installed on the HSMs used by this client.
  final String certificate;

  /// The certificate fingerprint.
  final String certificateFingerprint;

  /// The date and time the client was last modified.
  final String lastModifiedTimestamp;

  /// The label of the client.
  final String label;

  DescribeLunaClientResponse({
    this.clientArn,
    this.certificate,
    this.certificateFingerprint,
    this.lastModifiedTimestamp,
    this.label,
  });
  static DescribeLunaClientResponse fromJson(Map<String, dynamic> json) =>
      DescribeLunaClientResponse();
}

class GetConfigResponse {
  /// The type of credentials.
  final String configType;

  /// The chrystoki.conf configuration file.
  final String configFile;

  /// The certificate file containing the server.pem files of the HSMs.
  final String configCred;

  GetConfigResponse({
    this.configType,
    this.configFile,
    this.configCred,
  });
  static GetConfigResponse fromJson(Map<String, dynamic> json) =>
      GetConfigResponse();
}

class ListAvailableZonesResponse {
  /// The list of Availability Zones that have available AWS CloudHSM capacity.
  final List<String> azList;

  ListAvailableZonesResponse({
    this.azList,
  });
  static ListAvailableZonesResponse fromJson(Map<String, dynamic> json) =>
      ListAvailableZonesResponse();
}

class ListHapgsResponse {
  /// The list of high-availability partition groups.
  final List<String> hapgList;

  /// If not null, more results are available. Pass this value to `ListHapgs` to
  /// retrieve the next set of items.
  final String nextToken;

  ListHapgsResponse({
    @required this.hapgList,
    this.nextToken,
  });
  static ListHapgsResponse fromJson(Map<String, dynamic> json) =>
      ListHapgsResponse();
}

class ListHsmsResponse {
  /// The list of ARNs that identify the HSMs.
  final List<String> hsmList;

  /// If not null, more results are available. Pass this value to `ListHsms` to
  /// retrieve the next set of items.
  final String nextToken;

  ListHsmsResponse({
    this.hsmList,
    this.nextToken,
  });
  static ListHsmsResponse fromJson(Map<String, dynamic> json) =>
      ListHsmsResponse();
}

class ListLunaClientsResponse {
  /// The list of clients.
  final List<String> clientList;

  /// If not null, more results are available. Pass this to `ListLunaClients` to
  /// retrieve the next set of items.
  final String nextToken;

  ListLunaClientsResponse({
    @required this.clientList,
    this.nextToken,
  });
  static ListLunaClientsResponse fromJson(Map<String, dynamic> json) =>
      ListLunaClientsResponse();
}

class ListTagsForResourceResponse {
  /// One or more tags.
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    @required this.tagList,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ModifyHapgResponse {
  /// The ARN of the high-availability partition group.
  final String hapgArn;

  ModifyHapgResponse({
    this.hapgArn,
  });
  static ModifyHapgResponse fromJson(Map<String, dynamic> json) =>
      ModifyHapgResponse();
}

class ModifyHsmResponse {
  /// The ARN of the HSM.
  final String hsmArn;

  ModifyHsmResponse({
    this.hsmArn,
  });
  static ModifyHsmResponse fromJson(Map<String, dynamic> json) =>
      ModifyHsmResponse();
}

class ModifyLunaClientResponse {
  /// The ARN of the client.
  final String clientArn;

  ModifyLunaClientResponse({
    this.clientArn,
  });
  static ModifyLunaClientResponse fromJson(Map<String, dynamic> json) =>
      ModifyLunaClientResponse();
}

class RemoveTagsFromResourceResponse {
  /// The status of the operation.
  final String status;

  RemoveTagsFromResourceResponse({
    @required this.status,
  });
  static RemoveTagsFromResourceResponse fromJson(Map<String, dynamic> json) =>
      RemoveTagsFromResourceResponse();
}

class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}
