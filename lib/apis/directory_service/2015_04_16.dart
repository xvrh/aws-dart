import 'package:meta/meta.dart';

/// AWS Directory Service
///
/// AWS Directory Service is a web service that makes it easy for you to setup
/// and run directories in the AWS cloud, or connect your AWS resources with an
/// existing on-premises Microsoft Active Directory. This guide provides
/// detailed information about AWS Directory Service operations, data types,
/// parameters, and errors. For information about AWS Directory Services
/// features, see [AWS Directory
/// Service](https://aws.amazon.com/directoryservice/) and the [AWS Directory
/// Service Administration
/// Guide](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html).
///
///
///
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms (Java, Ruby, .Net, iOS, Android, etc.).
/// The SDKs provide a convenient way to create programmatic access to AWS
/// Directory Service and other AWS services. For more information about the AWS
/// SDKs, including how to download and install them, see [Tools for Amazon Web
/// Services](http://aws.amazon.com/tools/).
class DirectoryServiceApi {
  /// Accepts a directory sharing request that was sent from the directory owner
  /// account.
  Future<void> acceptSharedDirectory(String sharedDirectoryId) async {}

  /// If the DNS server for your on-premises domain uses a publicly addressable
  /// IP address, you must add a CIDR address block to correctly route traffic
  /// to and from your Microsoft AD on Amazon Web Services. _AddIpRoutes_ adds
  /// this address block. You can also use _AddIpRoutes_ to facilitate routing
  /// traffic that uses public IP ranges from your Microsoft AD on AWS to a peer
  /// VPC.
  ///
  /// Before you call _AddIpRoutes_, ensure that all of the required permissions
  /// have been explicitly granted through a policy. For details about what
  /// permissions are required to run the _AddIpRoutes_ operation, see [AWS
  /// Directory Service API Permissions: Actions, Resources, and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  Future<void> addIpRoutes(
      {@required String directoryId,
      @required List<IpRoute> ipRoutes,
      bool updateSecurityGroupForDirectoryControllers}) async {}

  /// Adds or overwrites one or more tags for the specified directory. Each
  /// directory can have a maximum of 50 tags. Each tag consists of a key and
  /// optional value. Tag keys must be unique to each resource.
  Future<void> addTagsToResource(
      {@required String resourceId, @required List<Tag> tags}) async {}

  /// Cancels an in-progress schema extension to a Microsoft AD directory. Once
  /// a schema extension has started replicating to all domain controllers, the
  /// task can no longer be canceled. A schema extension can be canceled during
  /// any of the following states; `Initializing`, `CreatingSnapshot`, and
  /// `UpdatingSchema`.
  Future<void> cancelSchemaExtension(
      {@required String directoryId,
      @required String schemaExtensionId}) async {}

  /// Creates an AD Connector to connect to an on-premises directory.
  ///
  /// Before you call `ConnectDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `ConnectDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  Future<void> connectDirectory(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required String size,
      @required DirectoryConnectSettings connectSettings,
      List<Tag> tags}) async {}

  /// Creates an alias for a directory and assigns the alias to the directory.
  /// The alias is used to construct the access URL for the directory, such as
  /// `http://<alias>.awsapps.com`.
  ///
  ///
  ///
  /// After an alias has been created, it cannot be deleted or reused, so this
  /// operation should only be used when absolutely necessary.
  Future<void> createAlias(
      {@required String directoryId, @required String alias}) async {}

  /// Creates a computer account in the specified directory, and joins the
  /// computer to the directory.
  Future<void> createComputer(
      {@required String directoryId,
      @required String computerName,
      @required String password,
      String organizationalUnitDistinguishedName,
      List<Attribute> computerAttributes}) async {}

  /// Creates a conditional forwarder associated with your AWS directory.
  /// Conditional forwarders are required in order to set up a trust
  /// relationship with another domain. The conditional forwarder points to the
  /// trusted domain.
  Future<void> createConditionalForwarder(
      {@required String directoryId,
      @required String remoteDomainName,
      @required List<String> dnsIpAddrs}) async {}

  /// Creates a Simple AD directory.
  ///
  /// Before you call `CreateDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `CreateDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  Future<void> createDirectory(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required String size,
      DirectoryVpcSettings vpcSettings,
      List<Tag> tags}) async {}

  /// Creates a subscription to forward real time Directory Service domain
  /// controller security logs to the specified CloudWatch log group in your AWS
  /// account.
  Future<void> createLogSubscription(
      {@required String directoryId, @required String logGroupName}) async {}

  /// Creates an AWS Managed Microsoft AD directory.
  ///
  /// Before you call _CreateMicrosoftAD_, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the _CreateMicrosoftAD_
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  Future<void> createMicrosoftAD(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required DirectoryVpcSettings vpcSettings,
      String edition,
      List<Tag> tags}) async {}

  /// Creates a snapshot of a Simple AD or Microsoft AD directory in the AWS
  /// cloud.
  ///
  ///
  ///
  /// You cannot take snapshots of AD Connector directories.
  Future<void> createSnapshot(String directoryId, {String name}) async {}

  /// AWS Directory Service for Microsoft Active Directory allows you to
  /// configure trust relationships. For example, you can establish a trust
  /// between your AWS Managed Microsoft AD directory, and your existing
  /// on-premises Microsoft Active Directory. This would allow you to provide
  /// users and groups access to resources in either domain, with a single set
  /// of credentials.
  ///
  /// This action initiates the creation of the AWS side of a trust relationship
  /// between an AWS Managed Microsoft AD directory and an external domain. You
  /// can create either a forest trust or an external trust.
  Future<void> createTrust(
      {@required String directoryId,
      @required String remoteDomainName,
      @required String trustPassword,
      @required String trustDirection,
      String trustType,
      List<String> conditionalForwarderIpAddrs,
      String selectiveAuth}) async {}

  /// Deletes a conditional forwarder that has been set up for your AWS
  /// directory.
  Future<void> deleteConditionalForwarder(
      {@required String directoryId,
      @required String remoteDomainName}) async {}

  /// Deletes an AWS Directory Service directory.
  ///
  /// Before you call `DeleteDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `DeleteDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  Future<void> deleteDirectory(String directoryId) async {}

  /// Deletes the specified log subscription.
  Future<void> deleteLogSubscription(String directoryId) async {}

  /// Deletes a directory snapshot.
  Future<void> deleteSnapshot(String snapshotId) async {}

  /// Deletes an existing trust relationship between your AWS Managed Microsoft
  /// AD directory and an external domain.
  Future<void> deleteTrust(String trustId,
      {bool deleteAssociatedConditionalForwarder}) async {}

  /// Removes the specified directory as a publisher to the specified SNS topic.
  Future<void> deregisterEventTopic(
      {@required String directoryId, @required String topicName}) async {}

  /// Obtains information about the conditional forwarders for this account.
  ///
  /// If no input parameters are provided for RemoteDomainNames, this request
  /// describes all conditional forwarders for the specified directory ID.
  Future<void> describeConditionalForwarders(String directoryId,
      {List<String> remoteDomainNames}) async {}

  /// Obtains information about the directories that belong to this account.
  ///
  /// You can retrieve information about specific directories by passing the
  /// directory identifiers in the `DirectoryIds` parameter. Otherwise, all
  /// directories that belong to the current account are returned.
  ///
  /// This operation supports pagination with the use of the `NextToken` request
  /// and response parameters. If more results are available, the
  /// `DescribeDirectoriesResult.NextToken` member contains a token that you
  /// pass in the next call to DescribeDirectories to retrieve the next set of
  /// items.
  ///
  /// You can also specify a maximum number of return results with the `Limit`
  /// parameter.
  Future<void> describeDirectories(
      {List<String> directoryIds, String nextToken, int limit}) async {}

  /// Provides information about any domain controllers in your directory.
  Future<void> describeDomainControllers(String directoryId,
      {List<String> domainControllerIds, String nextToken, int limit}) async {}

  /// Obtains information about which SNS topics receive status messages from
  /// the specified directory.
  ///
  /// If no input parameters are provided, such as DirectoryId or TopicName,
  /// this request describes all of the associations in the account.
  Future<void> describeEventTopics(
      {String directoryId, List<String> topicNames}) async {}

  /// Returns the shared directories in your account.
  Future<void> describeSharedDirectories(String ownerDirectoryId,
      {List<String> sharedDirectoryIds, String nextToken, int limit}) async {}

  /// Obtains information about the directory snapshots that belong to this
  /// account.
  ///
  /// This operation supports pagination with the use of the _NextToken_ request
  /// and response parameters. If more results are available, the
  /// _DescribeSnapshots.NextToken_ member contains a token that you pass in the
  /// next call to DescribeSnapshots to retrieve the next set of items.
  ///
  /// You can also specify a maximum number of return results with the _Limit_
  /// parameter.
  Future<void> describeSnapshots(
      {String directoryId,
      List<String> snapshotIds,
      String nextToken,
      int limit}) async {}

  /// Obtains information about the trust relationships for this account.
  ///
  /// If no input parameters are provided, such as DirectoryId or TrustIds, this
  /// request describes all the trust relationships belonging to the account.
  Future<void> describeTrusts(
      {String directoryId,
      List<String> trustIds,
      String nextToken,
      int limit}) async {}

  /// Disables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  Future<void> disableRadius(String directoryId) async {}

  /// Disables single-sign on for a directory.
  Future<void> disableSso(String directoryId,
      {String userName, String password}) async {}

  /// Enables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  Future<void> enableRadius(
      {@required String directoryId,
      @required RadiusSettings radiusSettings}) async {}

  /// Enables single sign-on for a directory.
  Future<void> enableSso(String directoryId,
      {String userName, String password}) async {}

  /// Obtains directory limit information for the current region.
  Future<void> getDirectoryLimits() async {}

  /// Obtains the manual snapshot limits for a directory.
  Future<void> getSnapshotLimits(String directoryId) async {}

  /// Lists the address blocks that you have added to a directory.
  Future<void> listIpRoutes(String directoryId,
      {String nextToken, int limit}) async {}

  /// Lists the active log subscriptions for the AWS account.
  Future<void> listLogSubscriptions(
      {String directoryId, String nextToken, int limit}) async {}

  /// Lists all schema extensions applied to a Microsoft AD Directory.
  Future<void> listSchemaExtensions(String directoryId,
      {String nextToken, int limit}) async {}

  /// Lists all tags on a directory.
  Future<void> listTagsForResource(String resourceId,
      {String nextToken, int limit}) async {}

  /// Associates a directory with an SNS topic. This establishes the directory
  /// as a publisher to the specified SNS topic. You can then receive email or
  /// text (SMS) messages when the status of your directory changes. You get
  /// notified if your directory goes from an Active status to an Impaired or
  /// Inoperable status. You also receive a notification when the directory
  /// returns to an Active status.
  Future<void> registerEventTopic(
      {@required String directoryId, @required String topicName}) async {}

  /// Rejects a directory sharing request that was sent from the directory owner
  /// account.
  Future<void> rejectSharedDirectory(String sharedDirectoryId) async {}

  /// Removes IP address blocks from a directory.
  Future<void> removeIpRoutes(
      {@required String directoryId, @required List<String> cidrIps}) async {}

  /// Removes tags from a directory.
  Future<void> removeTagsFromResource(
      {@required String resourceId, @required List<String> tagKeys}) async {}

  /// Resets the password for any user in your AWS Managed Microsoft AD or
  /// Simple AD directory.
  Future<void> resetUserPassword(
      {@required String directoryId,
      @required String userName,
      @required String newPassword}) async {}

  /// Restores a directory using an existing directory snapshot.
  ///
  /// When you restore a directory from a snapshot, any changes made to the
  /// directory after the snapshot date are overwritten.
  ///
  /// This action returns as soon as the restore operation is initiated. You can
  /// monitor the progress of the restore operation by calling the
  /// DescribeDirectories operation with the directory identifier. When the
  /// **DirectoryDescription.Stage** value changes to `Active`, the restore
  /// operation is complete.
  Future<void> restoreFromSnapshot(String snapshotId) async {}

  /// Shares a specified directory (`DirectoryId`) in your AWS account
  /// (directory owner) with another AWS account (directory consumer). With this
  /// operation you can use your directory from any AWS account and from any
  /// Amazon VPC within an AWS Region.
  ///
  /// When you share your AWS Managed Microsoft AD directory, AWS Directory
  /// Service creates a shared directory in the directory consumer account. This
  /// shared directory contains the metadata to provide access to the directory
  /// within the directory owner account. The shared directory is visible in all
  /// VPCs in the directory consumer account.
  ///
  /// The `ShareMethod` parameter determines whether the specified directory can
  /// be shared between AWS accounts inside the same AWS organization
  /// (`ORGANIZATIONS`). It also determines whether you can share the directory
  /// with any other AWS account either inside or outside of the organization
  /// (`HANDSHAKE`).
  ///
  /// The `ShareNotes` parameter is only used when `HANDSHAKE` is called, which
  /// sends a directory sharing request to the directory consumer.
  Future<void> shareDirectory(
      {@required String directoryId,
      String shareNotes,
      @required ShareTarget shareTarget,
      @required String shareMethod}) async {}

  /// Applies a schema extension to a Microsoft AD directory.
  Future<void> startSchemaExtension(
      {@required String directoryId,
      @required bool createSnapshotBeforeSchemaExtension,
      @required String ldifContent,
      @required String description}) async {}

  /// Stops the directory sharing between the directory owner and consumer
  /// accounts.
  Future<void> unshareDirectory(
      {@required String directoryId,
      @required UnshareTarget unshareTarget}) async {}

  /// Updates a conditional forwarder that has been set up for your AWS
  /// directory.
  Future<void> updateConditionalForwarder(
      {@required String directoryId,
      @required String remoteDomainName,
      @required List<String> dnsIpAddrs}) async {}

  /// Adds or removes domain controllers to or from the directory. Based on the
  /// difference between current value and new value (provided through this API
  /// call), domain controllers will be added or removed. It may take up to 45
  /// minutes for any new domain controllers to become fully active once the
  /// requested number of domain controllers is updated. During this time, you
  /// cannot make another update request.
  Future<void> updateNumberOfDomainControllers(
      {@required String directoryId, @required int desiredNumber}) async {}

  /// Updates the Remote Authentication Dial In User Service (RADIUS) server
  /// information for an AD Connector or Microsoft AD directory.
  Future<void> updateRadius(
      {@required String directoryId,
      @required RadiusSettings radiusSettings}) async {}

  /// Updates the trust that has been set up between your AWS Managed Microsoft
  /// AD directory and an on-premises Active Directory.
  Future<void> updateTrust(String trustId, {String selectiveAuth}) async {}

  /// AWS Directory Service for Microsoft Active Directory allows you to
  /// configure and verify trust relationships.
  ///
  /// This action verifies a trust relationship between your AWS Managed
  /// Microsoft AD directory and an external domain.
  Future<void> verifyTrust(String trustId) async {}
}

class AcceptSharedDirectoryResult {}

class AddIpRoutesResult {}

class AddTagsToResourceResult {}

class Attribute {}

class CancelSchemaExtensionResult {}

class Computer {}

class ConditionalForwarder {}

class ConnectDirectoryResult {}

class CreateAliasResult {}

class CreateComputerResult {}

class CreateConditionalForwarderResult {}

class CreateDirectoryResult {}

class CreateLogSubscriptionResult {}

class CreateMicrosoftADResult {}

class CreateSnapshotResult {}

class CreateTrustResult {}

class DeleteConditionalForwarderResult {}

class DeleteDirectoryResult {}

class DeleteLogSubscriptionResult {}

class DeleteSnapshotResult {}

class DeleteTrustResult {}

class DeregisterEventTopicResult {}

class DescribeConditionalForwardersResult {}

class DescribeDirectoriesResult {}

class DescribeDomainControllersResult {}

class DescribeEventTopicsResult {}

class DescribeSharedDirectoriesResult {}

class DescribeSnapshotsResult {}

class DescribeTrustsResult {}

class DirectoryConnectSettings {}

class DirectoryConnectSettingsDescription {}

class DirectoryDescription {}

class DirectoryLimits {}

class DirectoryVpcSettings {}

class DirectoryVpcSettingsDescription {}

class DisableRadiusResult {}

class DisableSsoResult {}

class DomainController {}

class EnableRadiusResult {}

class EnableSsoResult {}

class EventTopic {}

class GetDirectoryLimitsResult {}

class GetSnapshotLimitsResult {}

class IpRoute {}

class IpRouteInfo {}

class ListIpRoutesResult {}

class ListLogSubscriptionsResult {}

class ListSchemaExtensionsResult {}

class ListTagsForResourceResult {}

class LogSubscription {}

class OwnerDirectoryDescription {}

class RadiusSettings {}

class RegisterEventTopicResult {}

class RejectSharedDirectoryResult {}

class RemoveIpRoutesResult {}

class RemoveTagsFromResourceResult {}

class ResetUserPasswordResult {}

class RestoreFromSnapshotResult {}

class SchemaExtensionInfo {}

class ShareDirectoryResult {}

class ShareTarget {}

class SharedDirectory {}

class Snapshot {}

class SnapshotLimits {}

class StartSchemaExtensionResult {}

class Tag {}

class Trust {}

class UnshareDirectoryResult {}

class UnshareTarget {}

class UpdateConditionalForwarderResult {}

class UpdateNumberOfDomainControllersResult {}

class UpdateRadiusResult {}

class UpdateTrustResult {}

class VerifyTrustResult {}
