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
  ///
  /// [sharedDirectoryId]: Identifier of the shared directory in the directory
  /// consumer account. This identifier is different for each directory owner
  /// account.
  Future<AcceptSharedDirectoryResult> acceptSharedDirectory(
      String sharedDirectoryId) async {
    return AcceptSharedDirectoryResult.fromJson({});
  }

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
  ///
  /// [directoryId]: Identifier (ID) of the directory to which to add the
  /// address block.
  ///
  /// [ipRoutes]: IP address blocks, using CIDR format, of the traffic to route.
  /// This is often the IP address block of the DNS server used for your
  /// on-premises domain.
  ///
  /// [updateSecurityGroupForDirectoryControllers]: If set to true, updates the
  /// inbound and outbound rules of the security group that has the description:
  /// "AWS created security group for _directory ID_ directory controllers."
  /// Following are the new rules:
  ///
  /// Inbound:
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source:
  /// 0.0.0.0/0
  ///
  /// *   Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source:
  /// 0.0.0.0/0
  ///
  /// *   Type: DNS (UDP), Protocol: UDP, Range: 53, Source: 0.0.0.0/0
  ///
  /// *   Type: DNS (TCP), Protocol: TCP, Range: 53, Source: 0.0.0.0/0
  ///
  /// *   Type: LDAP, Protocol: TCP, Range: 389, Source: 0.0.0.0/0
  ///
  /// *   Type: All ICMP, Protocol: All, Range: N/A, Source: 0.0.0.0/0
  ///
  ///
  /// Outbound:
  ///
  /// *   Type: All traffic, Protocol: All, Range: All, Destination: 0.0.0.0/0
  ///
  ///
  /// These security rules impact an internal network interface that is not
  /// exposed publicly.
  Future<AddIpRoutesResult> addIpRoutes(
      {@required String directoryId,
      @required List<IpRoute> ipRoutes,
      bool updateSecurityGroupForDirectoryControllers}) async {
    return AddIpRoutesResult.fromJson({});
  }

  /// Adds or overwrites one or more tags for the specified directory. Each
  /// directory can have a maximum of 50 tags. Each tag consists of a key and
  /// optional value. Tag keys must be unique to each resource.
  ///
  /// [resourceId]: Identifier (ID) for the directory to which to add the tag.
  ///
  /// [tags]: The tags to be assigned to the directory.
  Future<AddTagsToResourceResult> addTagsToResource(
      {@required String resourceId, @required List<Tag> tags}) async {
    return AddTagsToResourceResult.fromJson({});
  }

  /// Cancels an in-progress schema extension to a Microsoft AD directory. Once
  /// a schema extension has started replicating to all domain controllers, the
  /// task can no longer be canceled. A schema extension can be canceled during
  /// any of the following states; `Initializing`, `CreatingSnapshot`, and
  /// `UpdatingSchema`.
  ///
  /// [directoryId]: The identifier of the directory whose schema extension will
  /// be canceled.
  ///
  /// [schemaExtensionId]: The identifier of the schema extension that will be
  /// canceled.
  Future<CancelSchemaExtensionResult> cancelSchemaExtension(
      {@required String directoryId,
      @required String schemaExtensionId}) async {
    return CancelSchemaExtensionResult.fromJson({});
  }

  /// Creates an AD Connector to connect to an on-premises directory.
  ///
  /// Before you call `ConnectDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `ConnectDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  ///
  /// [name]: The fully qualified name of the on-premises directory, such as
  /// `corp.example.com`.
  ///
  /// [shortName]: The NetBIOS name of the on-premises directory, such as
  /// `CORP`.
  ///
  /// [password]: The password for the on-premises user account.
  ///
  /// [description]: A textual description for the directory.
  ///
  /// [size]: The size of the directory.
  ///
  /// [connectSettings]: A DirectoryConnectSettings object that contains
  /// additional information for the operation.
  ///
  /// [tags]: The tags to be assigned to AD Connector.
  Future<ConnectDirectoryResult> connectDirectory(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required String size,
      @required DirectoryConnectSettings connectSettings,
      List<Tag> tags}) async {
    return ConnectDirectoryResult.fromJson({});
  }

  /// Creates an alias for a directory and assigns the alias to the directory.
  /// The alias is used to construct the access URL for the directory, such as
  /// `http://<alias>.awsapps.com`.
  ///
  ///
  ///
  /// After an alias has been created, it cannot be deleted or reused, so this
  /// operation should only be used when absolutely necessary.
  ///
  /// [directoryId]: The identifier of the directory for which to create the
  /// alias.
  ///
  /// [alias]: The requested alias.
  ///
  /// The alias must be unique amongst all aliases in AWS. This operation throws
  /// an `EntityAlreadyExistsException` error if the alias already exists.
  Future<CreateAliasResult> createAlias(
      {@required String directoryId, @required String alias}) async {
    return CreateAliasResult.fromJson({});
  }

  /// Creates a computer account in the specified directory, and joins the
  /// computer to the directory.
  ///
  /// [directoryId]: The identifier of the directory in which to create the
  /// computer account.
  ///
  /// [computerName]: The name of the computer account.
  ///
  /// [password]: A one-time password that is used to join the computer to the
  /// directory. You should generate a random, strong password to use for this
  /// parameter.
  ///
  /// [organizationalUnitDistinguishedName]: The fully-qualified distinguished
  /// name of the organizational unit to place the computer account in.
  ///
  /// [computerAttributes]: An array of Attribute objects that contain any LDAP
  /// attributes to apply to the computer account.
  Future<CreateComputerResult> createComputer(
      {@required String directoryId,
      @required String computerName,
      @required String password,
      String organizationalUnitDistinguishedName,
      List<Attribute> computerAttributes}) async {
    return CreateComputerResult.fromJson({});
  }

  /// Creates a conditional forwarder associated with your AWS directory.
  /// Conditional forwarders are required in order to set up a trust
  /// relationship with another domain. The conditional forwarder points to the
  /// trusted domain.
  ///
  /// [directoryId]: The directory ID of the AWS directory for which you are
  /// creating the conditional forwarder.
  ///
  /// [remoteDomainName]: The fully qualified domain name (FQDN) of the remote
  /// domain with which you will set up a trust relationship.
  ///
  /// [dnsIpAddrs]: The IP addresses of the remote DNS server associated with
  /// RemoteDomainName.
  Future<CreateConditionalForwarderResult> createConditionalForwarder(
      {@required String directoryId,
      @required String remoteDomainName,
      @required List<String> dnsIpAddrs}) async {
    return CreateConditionalForwarderResult.fromJson({});
  }

  /// Creates a Simple AD directory.
  ///
  /// Before you call `CreateDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `CreateDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  ///
  /// [name]: The fully qualified name for the directory, such as
  /// `corp.example.com`.
  ///
  /// [shortName]: The short name of the directory, such as `CORP`.
  ///
  /// [password]: The password for the directory administrator. The directory
  /// creation process creates a directory administrator account with the user
  /// name `Administrator` and this password.
  ///
  /// [description]: A textual description for the directory.
  ///
  /// [size]: The size of the directory.
  ///
  /// [vpcSettings]: A DirectoryVpcSettings object that contains additional
  /// information for the operation.
  ///
  /// [tags]: The tags to be assigned to the Simple AD directory.
  Future<CreateDirectoryResult> createDirectory(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required String size,
      DirectoryVpcSettings vpcSettings,
      List<Tag> tags}) async {
    return CreateDirectoryResult.fromJson({});
  }

  /// Creates a subscription to forward real time Directory Service domain
  /// controller security logs to the specified CloudWatch log group in your AWS
  /// account.
  ///
  /// [directoryId]: Identifier (ID) of the directory to which you want to
  /// subscribe and receive real-time logs to your specified CloudWatch log
  /// group.
  ///
  /// [logGroupName]: The name of the CloudWatch log group where the real-time
  /// domain controller logs are forwarded.
  Future<CreateLogSubscriptionResult> createLogSubscription(
      {@required String directoryId, @required String logGroupName}) async {
    return CreateLogSubscriptionResult.fromJson({});
  }

  /// Creates an AWS Managed Microsoft AD directory.
  ///
  /// Before you call _CreateMicrosoftAD_, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the _CreateMicrosoftAD_
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  ///
  /// [name]: The fully qualified domain name for the directory, such as
  /// `corp.example.com`. This name will resolve inside your VPC only. It does
  /// not need to be publicly resolvable.
  ///
  /// [shortName]: The NetBIOS name for your domain. A short identifier for your
  /// domain, such as `CORP`. If you don't specify a NetBIOS name, it will
  /// default to the first part of your directory DNS. For example, `CORP` for
  /// the directory DNS `corp.example.com`.
  ///
  /// [password]: The password for the default administrative user named
  /// `Admin`.
  ///
  /// [description]: A textual description for the directory. This label will
  /// appear on the AWS console `Directory Details` page after the directory is
  /// created.
  ///
  /// [vpcSettings]: Contains VPC information for the CreateDirectory or
  /// CreateMicrosoftAD operation.
  ///
  /// [edition]: AWS Managed Microsoft AD is available in two editions: Standard
  /// and Enterprise. Enterprise is the default.
  ///
  /// [tags]: The tags to be assigned to the AWS Managed Microsoft AD directory.
  Future<CreateMicrosoftADResult> createMicrosoftAD(
      {@required String name,
      String shortName,
      @required String password,
      String description,
      @required DirectoryVpcSettings vpcSettings,
      String edition,
      List<Tag> tags}) async {
    return CreateMicrosoftADResult.fromJson({});
  }

  /// Creates a snapshot of a Simple AD or Microsoft AD directory in the AWS
  /// cloud.
  ///
  ///
  ///
  /// You cannot take snapshots of AD Connector directories.
  ///
  /// [directoryId]: The identifier of the directory of which to take a
  /// snapshot.
  ///
  /// [name]: The descriptive name to apply to the snapshot.
  Future<CreateSnapshotResult> createSnapshot(String directoryId,
      {String name}) async {
    return CreateSnapshotResult.fromJson({});
  }

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
  ///
  /// [directoryId]: The Directory ID of the AWS Managed Microsoft AD directory
  /// for which to establish the trust relationship.
  ///
  /// [remoteDomainName]: The Fully Qualified Domain Name (FQDN) of the external
  /// domain for which to create the trust relationship.
  ///
  /// [trustPassword]: The trust password. The must be the same password that
  /// was used when creating the trust relationship on the external domain.
  ///
  /// [trustDirection]: The direction of the trust relationship.
  ///
  /// [trustType]: The trust relationship type. `Forest` is the default.
  ///
  /// [conditionalForwarderIpAddrs]: The IP addresses of the remote DNS server
  /// associated with RemoteDomainName.
  ///
  /// [selectiveAuth]: Optional parameter to enable selective authentication for
  /// the trust.
  Future<CreateTrustResult> createTrust(
      {@required String directoryId,
      @required String remoteDomainName,
      @required String trustPassword,
      @required String trustDirection,
      String trustType,
      List<String> conditionalForwarderIpAddrs,
      String selectiveAuth}) async {
    return CreateTrustResult.fromJson({});
  }

  /// Deletes a conditional forwarder that has been set up for your AWS
  /// directory.
  ///
  /// [directoryId]: The directory ID for which you are deleting the conditional
  /// forwarder.
  ///
  /// [remoteDomainName]: The fully qualified domain name (FQDN) of the remote
  /// domain with which you are deleting the conditional forwarder.
  Future<DeleteConditionalForwarderResult> deleteConditionalForwarder(
      {@required String directoryId, @required String remoteDomainName}) async {
    return DeleteConditionalForwarderResult.fromJson({});
  }

  /// Deletes an AWS Directory Service directory.
  ///
  /// Before you call `DeleteDirectory`, ensure that all of the required
  /// permissions have been explicitly granted through a policy. For details
  /// about what permissions are required to run the `DeleteDirectory`
  /// operation, see [AWS Directory Service API Permissions: Actions, Resources,
  /// and Conditions
  /// Reference](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html).
  ///
  /// [directoryId]: The identifier of the directory to delete.
  Future<DeleteDirectoryResult> deleteDirectory(String directoryId) async {
    return DeleteDirectoryResult.fromJson({});
  }

  /// Deletes the specified log subscription.
  ///
  /// [directoryId]: Identifier (ID) of the directory whose log subscription you
  /// want to delete.
  Future<DeleteLogSubscriptionResult> deleteLogSubscription(
      String directoryId) async {
    return DeleteLogSubscriptionResult.fromJson({});
  }

  /// Deletes a directory snapshot.
  ///
  /// [snapshotId]: The identifier of the directory snapshot to be deleted.
  Future<DeleteSnapshotResult> deleteSnapshot(String snapshotId) async {
    return DeleteSnapshotResult.fromJson({});
  }

  /// Deletes an existing trust relationship between your AWS Managed Microsoft
  /// AD directory and an external domain.
  ///
  /// [trustId]: The Trust ID of the trust relationship to be deleted.
  ///
  /// [deleteAssociatedConditionalForwarder]: Delete a conditional forwarder as
  /// part of a DeleteTrustRequest.
  Future<DeleteTrustResult> deleteTrust(String trustId,
      {bool deleteAssociatedConditionalForwarder}) async {
    return DeleteTrustResult.fromJson({});
  }

  /// Removes the specified directory as a publisher to the specified SNS topic.
  ///
  /// [directoryId]: The Directory ID to remove as a publisher. This directory
  /// will no longer send messages to the specified SNS topic.
  ///
  /// [topicName]: The name of the SNS topic from which to remove the directory
  /// as a publisher.
  Future<DeregisterEventTopicResult> deregisterEventTopic(
      {@required String directoryId, @required String topicName}) async {
    return DeregisterEventTopicResult.fromJson({});
  }

  /// Obtains information about the conditional forwarders for this account.
  ///
  /// If no input parameters are provided for RemoteDomainNames, this request
  /// describes all conditional forwarders for the specified directory ID.
  ///
  /// [directoryId]: The directory ID for which to get the list of associated
  /// conditional forwarders.
  ///
  /// [remoteDomainNames]: The fully qualified domain names (FQDN) of the remote
  /// domains for which to get the list of associated conditional forwarders. If
  /// this member is null, all conditional forwarders are returned.
  Future<DescribeConditionalForwardersResult> describeConditionalForwarders(
      String directoryId,
      {List<String> remoteDomainNames}) async {
    return DescribeConditionalForwardersResult.fromJson({});
  }

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
  ///
  /// [directoryIds]: A list of identifiers of the directories for which to
  /// obtain the information. If this member is null, all directories that
  /// belong to the current account are returned.
  ///
  /// An empty list results in an `InvalidParameterException` being thrown.
  ///
  /// [nextToken]: The `DescribeDirectoriesResult.NextToken` value from a
  /// previous call to DescribeDirectories. Pass null if this is the first call.
  ///
  /// [limit]: The maximum number of items to return. If this value is zero, the
  /// maximum number of items is specified by the limitations of the operation.
  Future<DescribeDirectoriesResult> describeDirectories(
      {List<String> directoryIds, String nextToken, int limit}) async {
    return DescribeDirectoriesResult.fromJson({});
  }

  /// Provides information about any domain controllers in your directory.
  ///
  /// [directoryId]: Identifier of the directory for which to retrieve the
  /// domain controller information.
  ///
  /// [domainControllerIds]: A list of identifiers for the domain controllers
  /// whose information will be provided.
  ///
  /// [nextToken]: The _DescribeDomainControllers.NextToken_ value from a
  /// previous call to DescribeDomainControllers. Pass null if this is the first
  /// call.
  ///
  /// [limit]: The maximum number of items to return.
  Future<DescribeDomainControllersResult> describeDomainControllers(
      String directoryId,
      {List<String> domainControllerIds,
      String nextToken,
      int limit}) async {
    return DescribeDomainControllersResult.fromJson({});
  }

  /// Obtains information about which SNS topics receive status messages from
  /// the specified directory.
  ///
  /// If no input parameters are provided, such as DirectoryId or TopicName,
  /// this request describes all of the associations in the account.
  ///
  /// [directoryId]: The Directory ID for which to get the list of associated
  /// SNS topics. If this member is null, associations for all Directory IDs are
  /// returned.
  ///
  /// [topicNames]: A list of SNS topic names for which to obtain the
  /// information. If this member is null, all associations for the specified
  /// Directory ID are returned.
  ///
  /// An empty list results in an `InvalidParameterException` being thrown.
  Future<DescribeEventTopicsResult> describeEventTopics(
      {String directoryId, List<String> topicNames}) async {
    return DescribeEventTopicsResult.fromJson({});
  }

  /// Returns the shared directories in your account.
  ///
  /// [ownerDirectoryId]: Returns the identifier of the directory in the
  /// directory owner account.
  ///
  /// [sharedDirectoryIds]: A list of identifiers of all shared directories in
  /// your account.
  ///
  /// [nextToken]: The `DescribeSharedDirectoriesResult.NextToken` value from a
  /// previous call to DescribeSharedDirectories. Pass null if this is the first
  /// call.
  ///
  /// [limit]: The number of shared directories to return in the response
  /// object.
  Future<DescribeSharedDirectoriesResult> describeSharedDirectories(
      String ownerDirectoryId,
      {List<String> sharedDirectoryIds,
      String nextToken,
      int limit}) async {
    return DescribeSharedDirectoriesResult.fromJson({});
  }

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
  ///
  /// [directoryId]: The identifier of the directory for which to retrieve
  /// snapshot information.
  ///
  /// [snapshotIds]: A list of identifiers of the snapshots to obtain the
  /// information for. If this member is null or empty, all snapshots are
  /// returned using the _Limit_ and _NextToken_ members.
  ///
  /// [nextToken]: The _DescribeSnapshotsResult.NextToken_ value from a previous
  /// call to DescribeSnapshots. Pass null if this is the first call.
  ///
  /// [limit]: The maximum number of objects to return.
  Future<DescribeSnapshotsResult> describeSnapshots(
      {String directoryId,
      List<String> snapshotIds,
      String nextToken,
      int limit}) async {
    return DescribeSnapshotsResult.fromJson({});
  }

  /// Obtains information about the trust relationships for this account.
  ///
  /// If no input parameters are provided, such as DirectoryId or TrustIds, this
  /// request describes all the trust relationships belonging to the account.
  ///
  /// [directoryId]: The Directory ID of the AWS directory that is a part of the
  /// requested trust relationship.
  ///
  /// [trustIds]: A list of identifiers of the trust relationships for which to
  /// obtain the information. If this member is null, all trust relationships
  /// that belong to the current account are returned.
  ///
  /// An empty list results in an `InvalidParameterException` being thrown.
  ///
  /// [nextToken]: The _DescribeTrustsResult.NextToken_ value from a previous
  /// call to DescribeTrusts. Pass null if this is the first call.
  ///
  /// [limit]: The maximum number of objects to return.
  Future<DescribeTrustsResult> describeTrusts(
      {String directoryId,
      List<String> trustIds,
      String nextToken,
      int limit}) async {
    return DescribeTrustsResult.fromJson({});
  }

  /// Disables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory for which to disable MFA.
  Future<DisableRadiusResult> disableRadius(String directoryId) async {
    return DisableRadiusResult.fromJson({});
  }

  /// Disables single-sign on for a directory.
  ///
  /// [directoryId]: The identifier of the directory for which to disable
  /// single-sign on.
  ///
  /// [userName]: The username of an alternate account to use to disable
  /// single-sign on. This is only used for AD Connector directories. This
  /// account must have privileges to remove a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to remove a
  /// service principal name, you can specify an alternate account with the
  /// _UserName_ and _Password_ parameters. These credentials are only used to
  /// disable single sign-on and are not stored by the service. The AD Connector
  /// service account is not changed.
  ///
  /// [password]: The password of an alternate account to use to disable
  /// single-sign on. This is only used for AD Connector directories. For more
  /// information, see the _UserName_ parameter.
  Future<DisableSsoResult> disableSso(String directoryId,
      {String userName, String password}) async {
    return DisableSsoResult.fromJson({});
  }

  /// Enables multi-factor authentication (MFA) with the Remote Authentication
  /// Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory for which to enable MFA.
  ///
  /// [radiusSettings]: A RadiusSettings object that contains information about
  /// the RADIUS server.
  Future<EnableRadiusResult> enableRadius(
      {@required String directoryId,
      @required RadiusSettings radiusSettings}) async {
    return EnableRadiusResult.fromJson({});
  }

  /// Enables single sign-on for a directory.
  ///
  /// [directoryId]: The identifier of the directory for which to enable
  /// single-sign on.
  ///
  /// [userName]: The username of an alternate account to use to enable
  /// single-sign on. This is only used for AD Connector directories. This
  /// account must have privileges to add a service principal name.
  ///
  /// If the AD Connector service account does not have privileges to add a
  /// service principal name, you can specify an alternate account with the
  /// _UserName_ and _Password_ parameters. These credentials are only used to
  /// enable single sign-on and are not stored by the service. The AD Connector
  /// service account is not changed.
  ///
  /// [password]: The password of an alternate account to use to enable
  /// single-sign on. This is only used for AD Connector directories. For more
  /// information, see the _UserName_ parameter.
  Future<EnableSsoResult> enableSso(String directoryId,
      {String userName, String password}) async {
    return EnableSsoResult.fromJson({});
  }

  /// Obtains directory limit information for the current region.
  Future<GetDirectoryLimitsResult> getDirectoryLimits() async {
    return GetDirectoryLimitsResult.fromJson({});
  }

  /// Obtains the manual snapshot limits for a directory.
  ///
  /// [directoryId]: Contains the identifier of the directory to obtain the
  /// limits for.
  Future<GetSnapshotLimitsResult> getSnapshotLimits(String directoryId) async {
    return GetSnapshotLimitsResult.fromJson({});
  }

  /// Lists the address blocks that you have added to a directory.
  ///
  /// [directoryId]: Identifier (ID) of the directory for which you want to
  /// retrieve the IP addresses.
  ///
  /// [nextToken]: The _ListIpRoutes.NextToken_ value from a previous call to
  /// ListIpRoutes. Pass null if this is the first call.
  ///
  /// [limit]: Maximum number of items to return. If this value is zero, the
  /// maximum number of items is specified by the limitations of the operation.
  Future<ListIpRoutesResult> listIpRoutes(String directoryId,
      {String nextToken, int limit}) async {
    return ListIpRoutesResult.fromJson({});
  }

  /// Lists the active log subscriptions for the AWS account.
  ///
  /// [directoryId]: If a _DirectoryID_ is provided, lists only the log
  /// subscription associated with that directory. If no _DirectoryId_ is
  /// provided, lists all log subscriptions associated with your AWS account. If
  /// there are no log subscriptions for the AWS account or the directory, an
  /// empty list will be returned.
  ///
  /// [nextToken]: The token for the next set of items to return.
  ///
  /// [limit]: The maximum number of items returned.
  Future<ListLogSubscriptionsResult> listLogSubscriptions(
      {String directoryId, String nextToken, int limit}) async {
    return ListLogSubscriptionsResult.fromJson({});
  }

  /// Lists all schema extensions applied to a Microsoft AD Directory.
  ///
  /// [directoryId]: The identifier of the directory from which to retrieve the
  /// schema extension information.
  ///
  /// [nextToken]: The `ListSchemaExtensions.NextToken` value from a previous
  /// call to `ListSchemaExtensions`. Pass null if this is the first call.
  ///
  /// [limit]: The maximum number of items to return.
  Future<ListSchemaExtensionsResult> listSchemaExtensions(String directoryId,
      {String nextToken, int limit}) async {
    return ListSchemaExtensionsResult.fromJson({});
  }

  /// Lists all tags on a directory.
  ///
  /// [resourceId]: Identifier (ID) of the directory for which you want to
  /// retrieve tags.
  ///
  /// [nextToken]: Reserved for future use.
  ///
  /// [limit]: Reserved for future use.
  Future<ListTagsForResourceResult> listTagsForResource(String resourceId,
      {String nextToken, int limit}) async {
    return ListTagsForResourceResult.fromJson({});
  }

  /// Associates a directory with an SNS topic. This establishes the directory
  /// as a publisher to the specified SNS topic. You can then receive email or
  /// text (SMS) messages when the status of your directory changes. You get
  /// notified if your directory goes from an Active status to an Impaired or
  /// Inoperable status. You also receive a notification when the directory
  /// returns to an Active status.
  ///
  /// [directoryId]: The Directory ID that will publish status messages to the
  /// SNS topic.
  ///
  /// [topicName]: The SNS topic name to which the directory will publish status
  /// messages. This SNS topic must be in the same region as the specified
  /// Directory ID.
  Future<RegisterEventTopicResult> registerEventTopic(
      {@required String directoryId, @required String topicName}) async {
    return RegisterEventTopicResult.fromJson({});
  }

  /// Rejects a directory sharing request that was sent from the directory owner
  /// account.
  ///
  /// [sharedDirectoryId]: Identifier of the shared directory in the directory
  /// consumer account. This identifier is different for each directory owner
  /// account.
  Future<RejectSharedDirectoryResult> rejectSharedDirectory(
      String sharedDirectoryId) async {
    return RejectSharedDirectoryResult.fromJson({});
  }

  /// Removes IP address blocks from a directory.
  ///
  /// [directoryId]: Identifier (ID) of the directory from which you want to
  /// remove the IP addresses.
  ///
  /// [cidrIps]: IP address blocks that you want to remove.
  Future<RemoveIpRoutesResult> removeIpRoutes(
      {@required String directoryId, @required List<String> cidrIps}) async {
    return RemoveIpRoutesResult.fromJson({});
  }

  /// Removes tags from a directory.
  ///
  /// [resourceId]: Identifier (ID) of the directory from which to remove the
  /// tag.
  ///
  /// [tagKeys]: The tag key (name) of the tag to be removed.
  Future<RemoveTagsFromResourceResult> removeTagsFromResource(
      {@required String resourceId, @required List<String> tagKeys}) async {
    return RemoveTagsFromResourceResult.fromJson({});
  }

  /// Resets the password for any user in your AWS Managed Microsoft AD or
  /// Simple AD directory.
  ///
  /// [directoryId]: Identifier of the AWS Managed Microsoft AD or Simple AD
  /// directory in which the user resides.
  ///
  /// [userName]: The user name of the user whose password will be reset.
  ///
  /// [newPassword]: The new password that will be reset.
  Future<ResetUserPasswordResult> resetUserPassword(
      {@required String directoryId,
      @required String userName,
      @required String newPassword}) async {
    return ResetUserPasswordResult.fromJson({});
  }

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
  ///
  /// [snapshotId]: The identifier of the snapshot to restore from.
  Future<RestoreFromSnapshotResult> restoreFromSnapshot(
      String snapshotId) async {
    return RestoreFromSnapshotResult.fromJson({});
  }

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
  ///
  /// [directoryId]: Identifier of the AWS Managed Microsoft AD directory that
  /// you want to share with other AWS accounts.
  ///
  /// [shareNotes]: A directory share request that is sent by the directory
  /// owner to the directory consumer. The request includes a typed message to
  /// help the directory consumer administrator determine whether to approve or
  /// reject the share invitation.
  ///
  /// [shareTarget]: Identifier for the directory consumer account with whom the
  /// directory is to be shared.
  ///
  /// [shareMethod]: The method used when sharing a directory to determine
  /// whether the directory should be shared within your AWS organization
  /// (`ORGANIZATIONS`) or with any AWS account by sending a directory sharing
  /// request (`HANDSHAKE`).
  Future<ShareDirectoryResult> shareDirectory(
      {@required String directoryId,
      String shareNotes,
      @required ShareTarget shareTarget,
      @required String shareMethod}) async {
    return ShareDirectoryResult.fromJson({});
  }

  /// Applies a schema extension to a Microsoft AD directory.
  ///
  /// [directoryId]: The identifier of the directory for which the schema
  /// extension will be applied to.
  ///
  /// [createSnapshotBeforeSchemaExtension]: If true, creates a snapshot of the
  /// directory before applying the schema extension.
  ///
  /// [ldifContent]: The LDIF file represented as a string. To construct the
  /// LdifContent string, precede each line as it would be formatted in an ldif
  /// file with \\n. See the example request below for more details. The file
  /// size can be no larger than 1MB.
  ///
  /// [description]: A description of the schema extension.
  Future<StartSchemaExtensionResult> startSchemaExtension(
      {@required String directoryId,
      @required bool createSnapshotBeforeSchemaExtension,
      @required String ldifContent,
      @required String description}) async {
    return StartSchemaExtensionResult.fromJson({});
  }

  /// Stops the directory sharing between the directory owner and consumer
  /// accounts.
  ///
  /// [directoryId]: The identifier of the AWS Managed Microsoft AD directory
  /// that you want to stop sharing.
  ///
  /// [unshareTarget]: Identifier for the directory consumer account with whom
  /// the directory has to be unshared.
  Future<UnshareDirectoryResult> unshareDirectory(
      {@required String directoryId,
      @required UnshareTarget unshareTarget}) async {
    return UnshareDirectoryResult.fromJson({});
  }

  /// Updates a conditional forwarder that has been set up for your AWS
  /// directory.
  ///
  /// [directoryId]: The directory ID of the AWS directory for which to update
  /// the conditional forwarder.
  ///
  /// [remoteDomainName]: The fully qualified domain name (FQDN) of the remote
  /// domain with which you will set up a trust relationship.
  ///
  /// [dnsIpAddrs]: The updated IP addresses of the remote DNS server associated
  /// with the conditional forwarder.
  Future<UpdateConditionalForwarderResult> updateConditionalForwarder(
      {@required String directoryId,
      @required String remoteDomainName,
      @required List<String> dnsIpAddrs}) async {
    return UpdateConditionalForwarderResult.fromJson({});
  }

  /// Adds or removes domain controllers to or from the directory. Based on the
  /// difference between current value and new value (provided through this API
  /// call), domain controllers will be added or removed. It may take up to 45
  /// minutes for any new domain controllers to become fully active once the
  /// requested number of domain controllers is updated. During this time, you
  /// cannot make another update request.
  ///
  /// [directoryId]: Identifier of the directory to which the domain controllers
  /// will be added or removed.
  ///
  /// [desiredNumber]: The number of domain controllers desired in the
  /// directory.
  Future<UpdateNumberOfDomainControllersResult> updateNumberOfDomainControllers(
      {@required String directoryId, @required int desiredNumber}) async {
    return UpdateNumberOfDomainControllersResult.fromJson({});
  }

  /// Updates the Remote Authentication Dial In User Service (RADIUS) server
  /// information for an AD Connector or Microsoft AD directory.
  ///
  /// [directoryId]: The identifier of the directory for which to update the
  /// RADIUS server information.
  ///
  /// [radiusSettings]: A RadiusSettings object that contains information about
  /// the RADIUS server.
  Future<UpdateRadiusResult> updateRadius(
      {@required String directoryId,
      @required RadiusSettings radiusSettings}) async {
    return UpdateRadiusResult.fromJson({});
  }

  /// Updates the trust that has been set up between your AWS Managed Microsoft
  /// AD directory and an on-premises Active Directory.
  ///
  /// [trustId]: Identifier of the trust relationship.
  ///
  /// [selectiveAuth]: Updates selective authentication for the trust.
  Future<UpdateTrustResult> updateTrust(String trustId,
      {String selectiveAuth}) async {
    return UpdateTrustResult.fromJson({});
  }

  /// AWS Directory Service for Microsoft Active Directory allows you to
  /// configure and verify trust relationships.
  ///
  /// This action verifies a trust relationship between your AWS Managed
  /// Microsoft AD directory and an external domain.
  ///
  /// [trustId]: The unique Trust ID of the trust relationship to verify.
  Future<VerifyTrustResult> verifyTrust(String trustId) async {
    return VerifyTrustResult.fromJson({});
  }
}

class AcceptSharedDirectoryResult {
  /// The shared directory in the directory consumer account.
  final SharedDirectory sharedDirectory;

  AcceptSharedDirectoryResult({
    this.sharedDirectory,
  });
  static AcceptSharedDirectoryResult fromJson(Map<String, dynamic> json) =>
      AcceptSharedDirectoryResult();
}

class AddIpRoutesResult {
  AddIpRoutesResult();
  static AddIpRoutesResult fromJson(Map<String, dynamic> json) =>
      AddIpRoutesResult();
}

class AddTagsToResourceResult {
  AddTagsToResourceResult();
  static AddTagsToResourceResult fromJson(Map<String, dynamic> json) =>
      AddTagsToResourceResult();
}

class Attribute {
  /// The name of the attribute.
  final String name;

  /// The value of the attribute.
  final String value;

  Attribute({
    this.name,
    this.value,
  });
  static Attribute fromJson(Map<String, dynamic> json) => Attribute();
}

class CancelSchemaExtensionResult {
  CancelSchemaExtensionResult();
  static CancelSchemaExtensionResult fromJson(Map<String, dynamic> json) =>
      CancelSchemaExtensionResult();
}

class Computer {
  /// The identifier of the computer.
  final String computerId;

  /// The computer name.
  final String computerName;

  /// An array of Attribute objects containing the LDAP attributes that belong
  /// to the computer account.
  final List<Attribute> computerAttributes;

  Computer({
    this.computerId,
    this.computerName,
    this.computerAttributes,
  });
  static Computer fromJson(Map<String, dynamic> json) => Computer();
}

class ConditionalForwarder {
  /// The fully qualified domain name (FQDN) of the remote domains pointed to by
  /// the conditional forwarder.
  final String remoteDomainName;

  /// The IP addresses of the remote DNS server associated with
  /// RemoteDomainName. This is the IP address of the DNS server that your
  /// conditional forwarder points to.
  final List<String> dnsIpAddrs;

  /// The replication scope of the conditional forwarder. The only allowed value
  /// is `Domain`, which will replicate the conditional forwarder to all of the
  /// domain controllers for your AWS directory.
  final String replicationScope;

  ConditionalForwarder({
    this.remoteDomainName,
    this.dnsIpAddrs,
    this.replicationScope,
  });
  static ConditionalForwarder fromJson(Map<String, dynamic> json) =>
      ConditionalForwarder();
}

class ConnectDirectoryResult {
  /// The identifier of the new directory.
  final String directoryId;

  ConnectDirectoryResult({
    this.directoryId,
  });
  static ConnectDirectoryResult fromJson(Map<String, dynamic> json) =>
      ConnectDirectoryResult();
}

class CreateAliasResult {
  /// The identifier of the directory.
  final String directoryId;

  /// The alias for the directory.
  final String alias;

  CreateAliasResult({
    this.directoryId,
    this.alias,
  });
  static CreateAliasResult fromJson(Map<String, dynamic> json) =>
      CreateAliasResult();
}

class CreateComputerResult {
  /// A Computer object that represents the computer account.
  final Computer computer;

  CreateComputerResult({
    this.computer,
  });
  static CreateComputerResult fromJson(Map<String, dynamic> json) =>
      CreateComputerResult();
}

class CreateConditionalForwarderResult {
  CreateConditionalForwarderResult();
  static CreateConditionalForwarderResult fromJson(Map<String, dynamic> json) =>
      CreateConditionalForwarderResult();
}

class CreateDirectoryResult {
  /// The identifier of the directory that was created.
  final String directoryId;

  CreateDirectoryResult({
    this.directoryId,
  });
  static CreateDirectoryResult fromJson(Map<String, dynamic> json) =>
      CreateDirectoryResult();
}

class CreateLogSubscriptionResult {
  CreateLogSubscriptionResult();
  static CreateLogSubscriptionResult fromJson(Map<String, dynamic> json) =>
      CreateLogSubscriptionResult();
}

class CreateMicrosoftADResult {
  /// The identifier of the directory that was created.
  final String directoryId;

  CreateMicrosoftADResult({
    this.directoryId,
  });
  static CreateMicrosoftADResult fromJson(Map<String, dynamic> json) =>
      CreateMicrosoftADResult();
}

class CreateSnapshotResult {
  /// The identifier of the snapshot that was created.
  final String snapshotId;

  CreateSnapshotResult({
    this.snapshotId,
  });
  static CreateSnapshotResult fromJson(Map<String, dynamic> json) =>
      CreateSnapshotResult();
}

class CreateTrustResult {
  /// A unique identifier for the trust relationship that was created.
  final String trustId;

  CreateTrustResult({
    this.trustId,
  });
  static CreateTrustResult fromJson(Map<String, dynamic> json) =>
      CreateTrustResult();
}

class DeleteConditionalForwarderResult {
  DeleteConditionalForwarderResult();
  static DeleteConditionalForwarderResult fromJson(Map<String, dynamic> json) =>
      DeleteConditionalForwarderResult();
}

class DeleteDirectoryResult {
  /// The directory identifier.
  final String directoryId;

  DeleteDirectoryResult({
    this.directoryId,
  });
  static DeleteDirectoryResult fromJson(Map<String, dynamic> json) =>
      DeleteDirectoryResult();
}

class DeleteLogSubscriptionResult {
  DeleteLogSubscriptionResult();
  static DeleteLogSubscriptionResult fromJson(Map<String, dynamic> json) =>
      DeleteLogSubscriptionResult();
}

class DeleteSnapshotResult {
  /// The identifier of the directory snapshot that was deleted.
  final String snapshotId;

  DeleteSnapshotResult({
    this.snapshotId,
  });
  static DeleteSnapshotResult fromJson(Map<String, dynamic> json) =>
      DeleteSnapshotResult();
}

class DeleteTrustResult {
  /// The Trust ID of the trust relationship that was deleted.
  final String trustId;

  DeleteTrustResult({
    this.trustId,
  });
  static DeleteTrustResult fromJson(Map<String, dynamic> json) =>
      DeleteTrustResult();
}

class DeregisterEventTopicResult {
  DeregisterEventTopicResult();
  static DeregisterEventTopicResult fromJson(Map<String, dynamic> json) =>
      DeregisterEventTopicResult();
}

class DescribeConditionalForwardersResult {
  /// The list of conditional forwarders that have been created.
  final List<ConditionalForwarder> conditionalForwarders;

  DescribeConditionalForwardersResult({
    this.conditionalForwarders,
  });
  static DescribeConditionalForwardersResult fromJson(
          Map<String, dynamic> json) =>
      DescribeConditionalForwardersResult();
}

class DescribeDirectoriesResult {
  /// The list of DirectoryDescription objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the `Limit` member of the request. This occurs if there are
  /// less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  final List<DirectoryDescription> directoryDescriptions;

  /// If not null, more results are available. Pass this value for the
  /// `NextToken` parameter in a subsequent call to DescribeDirectories to
  /// retrieve the next set of items.
  final String nextToken;

  DescribeDirectoriesResult({
    this.directoryDescriptions,
    this.nextToken,
  });
  static DescribeDirectoriesResult fromJson(Map<String, dynamic> json) =>
      DescribeDirectoriesResult();
}

class DescribeDomainControllersResult {
  /// List of the DomainController objects that were retrieved.
  final List<DomainController> domainControllers;

  /// If not null, more results are available. Pass this value for the
  /// `NextToken` parameter in a subsequent call to DescribeDomainControllers
  /// retrieve the next set of items.
  final String nextToken;

  DescribeDomainControllersResult({
    this.domainControllers,
    this.nextToken,
  });
  static DescribeDomainControllersResult fromJson(Map<String, dynamic> json) =>
      DescribeDomainControllersResult();
}

class DescribeEventTopicsResult {
  /// A list of SNS topic names that receive status messages from the specified
  /// Directory ID.
  final List<EventTopic> eventTopics;

  DescribeEventTopicsResult({
    this.eventTopics,
  });
  static DescribeEventTopicsResult fromJson(Map<String, dynamic> json) =>
      DescribeEventTopicsResult();
}

class DescribeSharedDirectoriesResult {
  /// A list of all shared directories in your account.
  final List<SharedDirectory> sharedDirectories;

  /// If not null, token that indicates that more results are available. Pass
  /// this value for the `NextToken` parameter in a subsequent call to
  /// DescribeSharedDirectories to retrieve the next set of items.
  final String nextToken;

  DescribeSharedDirectoriesResult({
    this.sharedDirectories,
    this.nextToken,
  });
  static DescribeSharedDirectoriesResult fromJson(Map<String, dynamic> json) =>
      DescribeSharedDirectoriesResult();
}

class DescribeSnapshotsResult {
  /// The list of Snapshot objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the _Limit_ member of the request. This occurs if there are
  /// less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  final List<Snapshot> snapshots;

  /// If not null, more results are available. Pass this value in the
  /// _NextToken_ member of a subsequent call to DescribeSnapshots.
  final String nextToken;

  DescribeSnapshotsResult({
    this.snapshots,
    this.nextToken,
  });
  static DescribeSnapshotsResult fromJson(Map<String, dynamic> json) =>
      DescribeSnapshotsResult();
}

class DescribeTrustsResult {
  /// The list of Trust objects that were retrieved.
  ///
  /// It is possible that this list contains less than the number of items
  /// specified in the _Limit_ member of the request. This occurs if there are
  /// less than the requested number of items left to retrieve, or if the
  /// limitations of the operation have been exceeded.
  final List<Trust> trusts;

  /// If not null, more results are available. Pass this value for the
  /// _NextToken_ parameter in a subsequent call to DescribeTrusts to retrieve
  /// the next set of items.
  final String nextToken;

  DescribeTrustsResult({
    this.trusts,
    this.nextToken,
  });
  static DescribeTrustsResult fromJson(Map<String, dynamic> json) =>
      DescribeTrustsResult();
}

class DirectoryConnectSettings {
  /// The identifier of the VPC in which the AD Connector is created.
  final String vpcId;

  /// A list of subnet identifiers in the VPC in which the AD Connector is
  /// created.
  final List<String> subnetIds;

  /// A list of one or more IP addresses of DNS servers or domain controllers in
  /// the on-premises directory.
  final List<String> customerDnsIps;

  /// The user name of an account in the on-premises directory that is used to
  /// connect to the directory. This account must have the following
  /// permissions:
  ///
  /// *   Read users and groups
  ///
  /// *   Create computer objects
  ///
  /// *   Join computers to the domain
  final String customerUserName;

  DirectoryConnectSettings({
    @required this.vpcId,
    @required this.subnetIds,
    @required this.customerDnsIps,
    @required this.customerUserName,
  });
}

class DirectoryConnectSettingsDescription {
  /// The identifier of the VPC that the AD Connector is in.
  final String vpcId;

  /// A list of subnet identifiers in the VPC that the AD connector is in.
  final List<String> subnetIds;

  /// The user name of the service account in the on-premises directory.
  final String customerUserName;

  /// The security group identifier for the AD Connector directory.
  final String securityGroupId;

  /// A list of the Availability Zones that the directory is in.
  final List<String> availabilityZones;

  /// The IP addresses of the AD Connector servers.
  final List<String> connectIps;

  DirectoryConnectSettingsDescription({
    this.vpcId,
    this.subnetIds,
    this.customerUserName,
    this.securityGroupId,
    this.availabilityZones,
    this.connectIps,
  });
  static DirectoryConnectSettingsDescription fromJson(
          Map<String, dynamic> json) =>
      DirectoryConnectSettingsDescription();
}

class DirectoryDescription {
  /// The directory identifier.
  final String directoryId;

  /// The fully qualified name of the directory.
  final String name;

  /// The short name of the directory.
  final String shortName;

  /// The directory size.
  final String size;

  /// The edition associated with this directory.
  final String edition;

  /// The alias for the directory. If no alias has been created for the
  /// directory, the alias is the directory identifier, such as `d-XXXXXXXXXX`.
  final String alias;

  /// The access URL for the directory, such as `http://<alias>.awsapps.com`. If
  /// no alias has been created for the directory, `<alias>` is the directory
  /// identifier, such as `d-XXXXXXXXXX`.
  final String accessUrl;

  /// The textual description for the directory.
  final String description;

  /// The IP addresses of the DNS servers for the directory. For a Simple AD or
  /// Microsoft AD directory, these are the IP addresses of the Simple AD or
  /// Microsoft AD directory servers. For an AD Connector directory, these are
  /// the IP addresses of the DNS servers or domain controllers in the
  /// on-premises directory to which the AD Connector is connected.
  final List<String> dnsIpAddrs;

  /// The current stage of the directory.
  final String stage;

  /// Current directory status of the shared AWS Managed Microsoft AD directory.
  final String shareStatus;

  /// The method used when sharing a directory to determine whether the
  /// directory should be shared within your AWS organization (`ORGANIZATIONS`)
  /// or with any AWS account by sending a shared directory request
  /// (`HANDSHAKE`).
  final String shareMethod;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject
  /// the share invitation.
  final String shareNotes;

  /// Specifies when the directory was created.
  final DateTime launchTime;

  /// The date and time that the stage was last updated.
  final DateTime stageLastUpdatedDateTime;

  /// The directory size.
  final String type;

  /// A DirectoryVpcSettingsDescription object that contains additional
  /// information about a directory. This member is only present if the
  /// directory is a Simple AD or Managed AD directory.
  final DirectoryVpcSettingsDescription vpcSettings;

  /// A DirectoryConnectSettingsDescription object that contains additional
  /// information about an AD Connector directory. This member is only present
  /// if the directory is an AD Connector directory.
  final DirectoryConnectSettingsDescription connectSettings;

  /// A RadiusSettings object that contains information about the RADIUS server
  /// configured for this directory.
  final RadiusSettings radiusSettings;

  /// The status of the RADIUS MFA server connection.
  final String radiusStatus;

  /// Additional information about the directory stage.
  final String stageReason;

  /// Indicates if single sign-on is enabled for the directory. For more
  /// information, see EnableSso and DisableSso.
  final bool ssoEnabled;

  /// The desired number of domain controllers in the directory if the directory
  /// is Microsoft AD.
  final int desiredNumberOfDomainControllers;

  /// Describes the AWS Managed Microsoft AD directory in the directory owner
  /// account.
  final OwnerDirectoryDescription ownerDirectoryDescription;

  DirectoryDescription({
    this.directoryId,
    this.name,
    this.shortName,
    this.size,
    this.edition,
    this.alias,
    this.accessUrl,
    this.description,
    this.dnsIpAddrs,
    this.stage,
    this.shareStatus,
    this.shareMethod,
    this.shareNotes,
    this.launchTime,
    this.stageLastUpdatedDateTime,
    this.type,
    this.vpcSettings,
    this.connectSettings,
    this.radiusSettings,
    this.radiusStatus,
    this.stageReason,
    this.ssoEnabled,
    this.desiredNumberOfDomainControllers,
    this.ownerDirectoryDescription,
  });
  static DirectoryDescription fromJson(Map<String, dynamic> json) =>
      DirectoryDescription();
}

class DirectoryLimits {
  /// The maximum number of cloud directories allowed in the region.
  final int cloudOnlyDirectoriesLimit;

  /// The current number of cloud directories in the region.
  final int cloudOnlyDirectoriesCurrentCount;

  /// Indicates if the cloud directory limit has been reached.
  final bool cloudOnlyDirectoriesLimitReached;

  /// The maximum number of AWS Managed Microsoft AD directories allowed in the
  /// region.
  final int cloudOnlyMicrosoftADLimit;

  /// The current number of AWS Managed Microsoft AD directories in the region.
  final int cloudOnlyMicrosoftADCurrentCount;

  /// Indicates if the AWS Managed Microsoft AD directory limit has been
  /// reached.
  final bool cloudOnlyMicrosoftADLimitReached;

  /// The maximum number of connected directories allowed in the region.
  final int connectedDirectoriesLimit;

  /// The current number of connected directories in the region.
  final int connectedDirectoriesCurrentCount;

  /// Indicates if the connected directory limit has been reached.
  final bool connectedDirectoriesLimitReached;

  DirectoryLimits({
    this.cloudOnlyDirectoriesLimit,
    this.cloudOnlyDirectoriesCurrentCount,
    this.cloudOnlyDirectoriesLimitReached,
    this.cloudOnlyMicrosoftADLimit,
    this.cloudOnlyMicrosoftADCurrentCount,
    this.cloudOnlyMicrosoftADLimitReached,
    this.connectedDirectoriesLimit,
    this.connectedDirectoriesCurrentCount,
    this.connectedDirectoriesLimitReached,
  });
  static DirectoryLimits fromJson(Map<String, dynamic> json) =>
      DirectoryLimits();
}

class DirectoryVpcSettings {
  /// The identifier of the VPC in which to create the directory.
  final String vpcId;

  /// The identifiers of the subnets for the directory servers. The two subnets
  /// must be in different Availability Zones. AWS Directory Service creates a
  /// directory server and a DNS server in each of these subnets.
  final List<String> subnetIds;

  DirectoryVpcSettings({
    @required this.vpcId,
    @required this.subnetIds,
  });
}

class DirectoryVpcSettingsDescription {
  /// The identifier of the VPC that the directory is in.
  final String vpcId;

  /// The identifiers of the subnets for the directory servers.
  final List<String> subnetIds;

  /// The domain controller security group identifier for the directory.
  final String securityGroupId;

  /// The list of Availability Zones that the directory is in.
  final List<String> availabilityZones;

  DirectoryVpcSettingsDescription({
    this.vpcId,
    this.subnetIds,
    this.securityGroupId,
    this.availabilityZones,
  });
  static DirectoryVpcSettingsDescription fromJson(Map<String, dynamic> json) =>
      DirectoryVpcSettingsDescription();
}

class DisableRadiusResult {
  DisableRadiusResult();
  static DisableRadiusResult fromJson(Map<String, dynamic> json) =>
      DisableRadiusResult();
}

class DisableSsoResult {
  DisableSsoResult();
  static DisableSsoResult fromJson(Map<String, dynamic> json) =>
      DisableSsoResult();
}

class DomainController {
  /// Identifier of the directory where the domain controller resides.
  final String directoryId;

  /// Identifies a specific domain controller in the directory.
  final String domainControllerId;

  /// The IP address of the domain controller.
  final String dnsIpAddr;

  /// The identifier of the VPC that contains the domain controller.
  final String vpcId;

  /// Identifier of the subnet in the VPC that contains the domain controller.
  final String subnetId;

  /// The Availability Zone where the domain controller is located.
  final String availabilityZone;

  /// The status of the domain controller.
  final String status;

  /// A description of the domain controller state.
  final String statusReason;

  /// Specifies when the domain controller was created.
  final DateTime launchTime;

  /// The date and time that the status was last updated.
  final DateTime statusLastUpdatedDateTime;

  DomainController({
    this.directoryId,
    this.domainControllerId,
    this.dnsIpAddr,
    this.vpcId,
    this.subnetId,
    this.availabilityZone,
    this.status,
    this.statusReason,
    this.launchTime,
    this.statusLastUpdatedDateTime,
  });
  static DomainController fromJson(Map<String, dynamic> json) =>
      DomainController();
}

class EnableRadiusResult {
  EnableRadiusResult();
  static EnableRadiusResult fromJson(Map<String, dynamic> json) =>
      EnableRadiusResult();
}

class EnableSsoResult {
  EnableSsoResult();
  static EnableSsoResult fromJson(Map<String, dynamic> json) =>
      EnableSsoResult();
}

class EventTopic {
  /// The Directory ID of an AWS Directory Service directory that will publish
  /// status messages to an SNS topic.
  final String directoryId;

  /// The name of an AWS SNS topic the receives status messages from the
  /// directory.
  final String topicName;

  /// The SNS topic ARN (Amazon Resource Name).
  final String topicArn;

  /// The date and time of when you associated your directory with the SNS
  /// topic.
  final DateTime createdDateTime;

  /// The topic registration status.
  final String status;

  EventTopic({
    this.directoryId,
    this.topicName,
    this.topicArn,
    this.createdDateTime,
    this.status,
  });
  static EventTopic fromJson(Map<String, dynamic> json) => EventTopic();
}

class GetDirectoryLimitsResult {
  /// A DirectoryLimits object that contains the directory limits for the
  /// current region.
  final DirectoryLimits directoryLimits;

  GetDirectoryLimitsResult({
    this.directoryLimits,
  });
  static GetDirectoryLimitsResult fromJson(Map<String, dynamic> json) =>
      GetDirectoryLimitsResult();
}

class GetSnapshotLimitsResult {
  /// A SnapshotLimits object that contains the manual snapshot limits for the
  /// specified directory.
  final SnapshotLimits snapshotLimits;

  GetSnapshotLimitsResult({
    this.snapshotLimits,
  });
  static GetSnapshotLimitsResult fromJson(Map<String, dynamic> json) =>
      GetSnapshotLimitsResult();
}

class IpRoute {
  /// IP address block using CIDR format, for example 10.0.0.0/24. This is often
  /// the address block of the DNS server used for your on-premises domain. For
  /// a single IP address use a CIDR address block with /32. For example
  /// 10.0.0.0/32.
  final String cidrIp;

  /// Description of the address block.
  final String description;

  IpRoute({
    this.cidrIp,
    this.description,
  });
}

class IpRouteInfo {
  /// Identifier (ID) of the directory associated with the IP addresses.
  final String directoryId;

  /// IP address block in the IpRoute.
  final String cidrIp;

  /// The status of the IP address block.
  final String ipRouteStatusMsg;

  /// The date and time the address block was added to the directory.
  final DateTime addedDateTime;

  /// The reason for the IpRouteStatusMsg.
  final String ipRouteStatusReason;

  /// Description of the IpRouteInfo.
  final String description;

  IpRouteInfo({
    this.directoryId,
    this.cidrIp,
    this.ipRouteStatusMsg,
    this.addedDateTime,
    this.ipRouteStatusReason,
    this.description,
  });
  static IpRouteInfo fromJson(Map<String, dynamic> json) => IpRouteInfo();
}

class ListIpRoutesResult {
  /// A list of IpRoutes.
  final List<IpRouteInfo> ipRoutesInfo;

  /// If not null, more results are available. Pass this value for the
  /// _NextToken_ parameter in a subsequent call to ListIpRoutes to retrieve the
  /// next set of items.
  final String nextToken;

  ListIpRoutesResult({
    this.ipRoutesInfo,
    this.nextToken,
  });
  static ListIpRoutesResult fromJson(Map<String, dynamic> json) =>
      ListIpRoutesResult();
}

class ListLogSubscriptionsResult {
  /// A list of active LogSubscription objects for calling the AWS account.
  final List<LogSubscription> logSubscriptions;

  /// The token for the next set of items to return.
  final String nextToken;

  ListLogSubscriptionsResult({
    this.logSubscriptions,
    this.nextToken,
  });
  static ListLogSubscriptionsResult fromJson(Map<String, dynamic> json) =>
      ListLogSubscriptionsResult();
}

class ListSchemaExtensionsResult {
  /// Information about the schema extensions applied to the directory.
  final List<SchemaExtensionInfo> schemaExtensionsInfo;

  /// If not null, more results are available. Pass this value for the
  /// `NextToken` parameter in a subsequent call to `ListSchemaExtensions` to
  /// retrieve the next set of items.
  final String nextToken;

  ListSchemaExtensionsResult({
    this.schemaExtensionsInfo,
    this.nextToken,
  });
  static ListSchemaExtensionsResult fromJson(Map<String, dynamic> json) =>
      ListSchemaExtensionsResult();
}

class ListTagsForResourceResult {
  /// List of tags returned by the ListTagsForResource operation.
  final List<Tag> tags;

  /// Reserved for future use.
  final String nextToken;

  ListTagsForResourceResult({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResult fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResult();
}

class LogSubscription {
  /// Identifier (ID) of the directory that you want to associate with the log
  /// subscription.
  final String directoryId;

  /// The name of the log group.
  final String logGroupName;

  /// The date and time that the log subscription was created.
  final DateTime subscriptionCreatedDateTime;

  LogSubscription({
    this.directoryId,
    this.logGroupName,
    this.subscriptionCreatedDateTime,
  });
  static LogSubscription fromJson(Map<String, dynamic> json) =>
      LogSubscription();
}

class OwnerDirectoryDescription {
  /// Identifier of the AWS Managed Microsoft AD directory in the directory
  /// owner account.
  final String directoryId;

  /// Identifier of the directory owner account.
  final String accountId;

  /// IP address of the directory’s domain controllers.
  final List<String> dnsIpAddrs;

  /// Information about the VPC settings for the directory.
  final DirectoryVpcSettingsDescription vpcSettings;

  /// A RadiusSettings object that contains information about the RADIUS server.
  final RadiusSettings radiusSettings;

  /// Information about the status of the RADIUS server.
  final String radiusStatus;

  OwnerDirectoryDescription({
    this.directoryId,
    this.accountId,
    this.dnsIpAddrs,
    this.vpcSettings,
    this.radiusSettings,
    this.radiusStatus,
  });
  static OwnerDirectoryDescription fromJson(Map<String, dynamic> json) =>
      OwnerDirectoryDescription();
}

class RadiusSettings {
  /// An array of strings that contains the IP addresses of the RADIUS server
  /// endpoints, or the IP addresses of your RADIUS server load balancer.
  final List<String> radiusServers;

  /// The port that your RADIUS server is using for communications. Your
  /// on-premises network must allow inbound traffic over this port from the AWS
  /// Directory Service servers.
  final int radiusPort;

  /// The amount of time, in seconds, to wait for the RADIUS server to respond.
  final int radiusTimeout;

  /// The maximum number of times that communication with the RADIUS server is
  /// attempted.
  final int radiusRetries;

  /// Required for enabling RADIUS on the directory.
  final String sharedSecret;

  /// The protocol specified for your RADIUS endpoints.
  final String authenticationProtocol;

  /// Not currently used.
  final String displayLabel;

  /// Not currently used.
  final bool useSameUsername;

  RadiusSettings({
    this.radiusServers,
    this.radiusPort,
    this.radiusTimeout,
    this.radiusRetries,
    this.sharedSecret,
    this.authenticationProtocol,
    this.displayLabel,
    this.useSameUsername,
  });
  static RadiusSettings fromJson(Map<String, dynamic> json) => RadiusSettings();
}

class RegisterEventTopicResult {
  RegisterEventTopicResult();
  static RegisterEventTopicResult fromJson(Map<String, dynamic> json) =>
      RegisterEventTopicResult();
}

class RejectSharedDirectoryResult {
  /// Identifier of the shared directory in the directory consumer account.
  final String sharedDirectoryId;

  RejectSharedDirectoryResult({
    this.sharedDirectoryId,
  });
  static RejectSharedDirectoryResult fromJson(Map<String, dynamic> json) =>
      RejectSharedDirectoryResult();
}

class RemoveIpRoutesResult {
  RemoveIpRoutesResult();
  static RemoveIpRoutesResult fromJson(Map<String, dynamic> json) =>
      RemoveIpRoutesResult();
}

class RemoveTagsFromResourceResult {
  RemoveTagsFromResourceResult();
  static RemoveTagsFromResourceResult fromJson(Map<String, dynamic> json) =>
      RemoveTagsFromResourceResult();
}

class ResetUserPasswordResult {
  ResetUserPasswordResult();
  static ResetUserPasswordResult fromJson(Map<String, dynamic> json) =>
      ResetUserPasswordResult();
}

class RestoreFromSnapshotResult {
  RestoreFromSnapshotResult();
  static RestoreFromSnapshotResult fromJson(Map<String, dynamic> json) =>
      RestoreFromSnapshotResult();
}

class SchemaExtensionInfo {
  /// The identifier of the directory to which the schema extension is applied.
  final String directoryId;

  /// The identifier of the schema extension.
  final String schemaExtensionId;

  /// A description of the schema extension.
  final String description;

  /// The current status of the schema extension.
  final String schemaExtensionStatus;

  /// The reason for the `SchemaExtensionStatus`.
  final String schemaExtensionStatusReason;

  /// The date and time that the schema extension started being applied to the
  /// directory.
  final DateTime startDateTime;

  /// The date and time that the schema extension was completed.
  final DateTime endDateTime;

  SchemaExtensionInfo({
    this.directoryId,
    this.schemaExtensionId,
    this.description,
    this.schemaExtensionStatus,
    this.schemaExtensionStatusReason,
    this.startDateTime,
    this.endDateTime,
  });
  static SchemaExtensionInfo fromJson(Map<String, dynamic> json) =>
      SchemaExtensionInfo();
}

class ShareDirectoryResult {
  /// Identifier of the directory that is stored in the directory consumer
  /// account that is shared from the specified directory (`DirectoryId`).
  final String sharedDirectoryId;

  ShareDirectoryResult({
    this.sharedDirectoryId,
  });
  static ShareDirectoryResult fromJson(Map<String, dynamic> json) =>
      ShareDirectoryResult();
}

class ShareTarget {
  /// Identifier of the directory consumer account.
  final String id;

  /// Type of identifier to be used in the `Id` field.
  final String type;

  ShareTarget({
    @required this.id,
    @required this.type,
  });
}

class SharedDirectory {
  /// Identifier of the directory owner account, which contains the directory
  /// that has been shared to the consumer account.
  final String ownerAccountId;

  /// Identifier of the directory in the directory owner account.
  final String ownerDirectoryId;

  /// The method used when sharing a directory to determine whether the
  /// directory should be shared within your AWS organization (`ORGANIZATIONS`)
  /// or with any AWS account by sending a shared directory request
  /// (`HANDSHAKE`).
  final String shareMethod;

  /// Identifier of the directory consumer account that has access to the shared
  /// directory (`OwnerDirectoryId`) in the directory owner account.
  final String sharedAccountId;

  /// Identifier of the shared directory in the directory consumer account. This
  /// identifier is different for each directory owner account.
  final String sharedDirectoryId;

  /// Current directory status of the shared AWS Managed Microsoft AD directory.
  final String shareStatus;

  /// A directory share request that is sent by the directory owner to the
  /// directory consumer. The request includes a typed message to help the
  /// directory consumer administrator determine whether to approve or reject
  /// the share invitation.
  final String shareNotes;

  /// The date and time that the shared directory was created.
  final DateTime createdDateTime;

  /// The date and time that the shared directory was last updated.
  final DateTime lastUpdatedDateTime;

  SharedDirectory({
    this.ownerAccountId,
    this.ownerDirectoryId,
    this.shareMethod,
    this.sharedAccountId,
    this.sharedDirectoryId,
    this.shareStatus,
    this.shareNotes,
    this.createdDateTime,
    this.lastUpdatedDateTime,
  });
  static SharedDirectory fromJson(Map<String, dynamic> json) =>
      SharedDirectory();
}

class Snapshot {
  /// The directory identifier.
  final String directoryId;

  /// The snapshot identifier.
  final String snapshotId;

  /// The snapshot type.
  final String type;

  /// The descriptive name of the snapshot.
  final String name;

  /// The snapshot status.
  final String status;

  /// The date and time that the snapshot was taken.
  final DateTime startTime;

  Snapshot({
    this.directoryId,
    this.snapshotId,
    this.type,
    this.name,
    this.status,
    this.startTime,
  });
  static Snapshot fromJson(Map<String, dynamic> json) => Snapshot();
}

class SnapshotLimits {
  /// The maximum number of manual snapshots allowed.
  final int manualSnapshotsLimit;

  /// The current number of manual snapshots of the directory.
  final int manualSnapshotsCurrentCount;

  /// Indicates if the manual snapshot limit has been reached.
  final bool manualSnapshotsLimitReached;

  SnapshotLimits({
    this.manualSnapshotsLimit,
    this.manualSnapshotsCurrentCount,
    this.manualSnapshotsLimitReached,
  });
  static SnapshotLimits fromJson(Map<String, dynamic> json) => SnapshotLimits();
}

class StartSchemaExtensionResult {
  /// The identifier of the schema extension that will be applied.
  final String schemaExtensionId;

  StartSchemaExtensionResult({
    this.schemaExtensionId,
  });
  static StartSchemaExtensionResult fromJson(Map<String, dynamic> json) =>
      StartSchemaExtensionResult();
}

class Tag {
  /// Required name of the tag. The string value can be Unicode characters and
  /// cannot be prefixed with "aws:". The string can contain only the set of
  /// Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java
  /// regex: "^(\[\\\p{L}\\\p{Z}\\\p{N}_.:/=+\\\-\]*)$").
  final String key;

  /// The optional value of the tag. The string value can be Unicode characters.
  /// The string can contain only the set of Unicode letters, digits,
  /// white-space, '_', '.', '/', '=', '+', '-' (Java regex:
  /// "^(\[\\\p{L}\\\p{Z}\\\p{N}_.:/=+\\\-\]*)$").
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class Trust {
  /// The Directory ID of the AWS directory involved in the trust relationship.
  final String directoryId;

  /// The unique ID of the trust relationship.
  final String trustId;

  /// The Fully Qualified Domain Name (FQDN) of the external domain involved in
  /// the trust relationship.
  final String remoteDomainName;

  /// The trust relationship type. `Forest` is the default.
  final String trustType;

  /// The trust relationship direction.
  final String trustDirection;

  /// The trust relationship state.
  final String trustState;

  /// The date and time that the trust relationship was created.
  final DateTime createdDateTime;

  /// The date and time that the trust relationship was last updated.
  final DateTime lastUpdatedDateTime;

  /// The date and time that the TrustState was last updated.
  final DateTime stateLastUpdatedDateTime;

  /// The reason for the TrustState.
  final String trustStateReason;

  /// Current state of selective authentication for the trust.
  final String selectiveAuth;

  Trust({
    this.directoryId,
    this.trustId,
    this.remoteDomainName,
    this.trustType,
    this.trustDirection,
    this.trustState,
    this.createdDateTime,
    this.lastUpdatedDateTime,
    this.stateLastUpdatedDateTime,
    this.trustStateReason,
    this.selectiveAuth,
  });
  static Trust fromJson(Map<String, dynamic> json) => Trust();
}

class UnshareDirectoryResult {
  /// Identifier of the directory stored in the directory consumer account that
  /// is to be unshared from the specified directory (`DirectoryId`).
  final String sharedDirectoryId;

  UnshareDirectoryResult({
    this.sharedDirectoryId,
  });
  static UnshareDirectoryResult fromJson(Map<String, dynamic> json) =>
      UnshareDirectoryResult();
}

class UnshareTarget {
  /// Identifier of the directory consumer account.
  final String id;

  /// Type of identifier to be used in the _Id_ field.
  final String type;

  UnshareTarget({
    @required this.id,
    @required this.type,
  });
}

class UpdateConditionalForwarderResult {
  UpdateConditionalForwarderResult();
  static UpdateConditionalForwarderResult fromJson(Map<String, dynamic> json) =>
      UpdateConditionalForwarderResult();
}

class UpdateNumberOfDomainControllersResult {
  UpdateNumberOfDomainControllersResult();
  static UpdateNumberOfDomainControllersResult fromJson(
          Map<String, dynamic> json) =>
      UpdateNumberOfDomainControllersResult();
}

class UpdateRadiusResult {
  UpdateRadiusResult();
  static UpdateRadiusResult fromJson(Map<String, dynamic> json) =>
      UpdateRadiusResult();
}

class UpdateTrustResult {
  final String requestId;

  /// Identifier of the trust relationship.
  final String trustId;

  UpdateTrustResult({
    this.requestId,
    this.trustId,
  });
  static UpdateTrustResult fromJson(Map<String, dynamic> json) =>
      UpdateTrustResult();
}

class VerifyTrustResult {
  /// The unique Trust ID of the trust relationship that was verified.
  final String trustId;

  VerifyTrustResult({
    this.trustId,
  });
  static VerifyTrustResult fromJson(Map<String, dynamic> json) =>
      VerifyTrustResult();
}
