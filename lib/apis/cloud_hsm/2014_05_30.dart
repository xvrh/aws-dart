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
  Future<void> addTagsToResource(
      {@required String resourceArn, @required List<Tag> tagList}) async {}

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
  Future<void> createHapg(String label) async {}

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
  Future<void> createHsm(
      {@required String subnetId,
      @required String sshKey,
      String eniIp,
      @required String iamRoleArn,
      String externalId,
      @required String subscriptionType,
      String clientToken,
      String syslogIp}) async {}

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
  Future<void> createLunaClient(String certificate, {String label}) async {}

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
  Future<void> deleteHapg(String hapgArn) async {}

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
  Future<void> deleteHsm(String hsmArn) async {}

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
  Future<void> deleteLunaClient(String clientArn) async {}

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
  Future<void> describeHapg(String hapgArn) async {}

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
  Future<void> describeHsm({String hsmArn, String hsmSerialNumber}) async {}

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
  Future<void> describeLunaClient(
      {String clientArn, String certificateFingerprint}) async {}

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
  Future<void> getConfig(
      {@required String clientArn,
      @required String clientVersion,
      @required List<String> hapgList}) async {}

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
  Future<void> listAvailableZones() async {}

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
  Future<void> listHapgs({String nextToken}) async {}

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
  Future<void> listHsms({String nextToken}) async {}

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
  Future<void> listLunaClients({String nextToken}) async {}

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
  Future<void> listTagsForResource(String resourceArn) async {}

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
  Future<void> modifyHapg(String hapgArn,
      {String label, List<String> partitionSerialList}) async {}

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
  Future<void> modifyHsm(String hsmArn,
      {String subnetId,
      String eniIp,
      String iamRoleArn,
      String externalId,
      String syslogIp}) async {}

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
  Future<void> modifyLunaClient(
      {@required String clientArn, @required String certificate}) async {}

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
  Future<void> removeTagsFromResource(
      {@required String resourceArn,
      @required List<String> tagKeyList}) async {}
}

class AddTagsToResourceResponse {}

class CreateHapgResponse {}

class CreateHsmResponse {}

class CreateLunaClientResponse {}

class DeleteHapgResponse {}

class DeleteHsmResponse {}

class DeleteLunaClientResponse {}

class DescribeHapgResponse {}

class DescribeHsmResponse {}

class DescribeLunaClientResponse {}

class GetConfigResponse {}

class ListAvailableZonesResponse {}

class ListHapgsResponse {}

class ListHsmsResponse {}

class ListLunaClientsResponse {}

class ListTagsForResourceResponse {}

class ModifyHapgResponse {}

class ModifyHsmResponse {}

class ModifyLunaClientResponse {}

class RemoveTagsFromResourceResponse {}

class Tag {}
