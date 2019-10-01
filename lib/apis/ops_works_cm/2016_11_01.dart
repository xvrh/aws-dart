import 'package:meta/meta.dart';

/// AWS OpsWorks CM
///
/// AWS OpsWorks for configuration management (CM) is a service that runs and
/// manages configuration management servers. You can use AWS OpsWorks CM to
/// create and manage AWS OpsWorks for Chef Automate and AWS OpsWorks for Puppet
/// Enterprise servers, and add or remove nodes for the servers to manage.
///
///  **Glossary of terms**
///
/// *    **Server**: A configuration management server that can be
/// highly-available. The configuration management server runs on an Amazon
/// Elastic Compute Cloud (EC2) instance, and may use various other AWS
/// services, such as Amazon Relational Database Service (RDS) and Elastic Load
/// Balancing. A server is a generic abstraction over the configuration manager
/// that you want to use, much like Amazon RDS. In AWS OpsWorks CM, you do not
/// start or stop servers. After you create servers, they continue to run until
/// they are deleted.
///
/// *    **Engine**: The engine is the specific configuration manager that you
/// want to use. Valid values in this release include `ChefAutomate` and
/// `Puppet`.
///
/// *    **Backup**: This is an application-level backup of the data that the
/// configuration manager stores. AWS OpsWorks CM creates an S3 bucket for
/// backups when you launch the first server. A backup maintains a snapshot of a
/// server's configuration-related attributes at the time the backup starts.
///
/// *    **Events**: Events are always related to a server. Events are written
/// during server creation, when health checks run, when backups are created,
/// when system maintenance is performed, etc. When you delete a server, the
/// server's events are also deleted.
///
/// *    **Account attributes**: Every account has attributes that are assigned
/// in the AWS OpsWorks CM database. These attributes store information about
/// configuration limits (servers, backups, etc.) and your customer account.
///
///
///  **Endpoints**
///
/// AWS OpsWorks CM supports the following endpoints, all HTTPS. You must
/// connect to one of the following endpoints. Your servers can only be accessed
/// or managed within the endpoint in which they are created.
///
/// *   opsworks-cm.us-east-1.amazonaws.com
///
/// *   opsworks-cm.us-east-2.amazonaws.com
///
/// *   opsworks-cm.us-west-1.amazonaws.com
///
/// *   opsworks-cm.us-west-2.amazonaws.com
///
/// *   opsworks-cm.ap-northeast-1.amazonaws.com
///
/// *   opsworks-cm.ap-southeast-1.amazonaws.com
///
/// *   opsworks-cm.ap-southeast-2.amazonaws.com
///
/// *   opsworks-cm.eu-central-1.amazonaws.com
///
/// *   opsworks-cm.eu-west-1.amazonaws.com
///
///
///  **Throttling limits**
///
/// All API operations allow for five requests per second with a burst of 10
/// requests per second.
class OpsWorksCMApi {
  ///  Associates a new node with the server. For more information about how to
  /// disassociate a node, see DisassociateNode.
  ///
  ///  On a Chef server: This command is an alternative to `knife bootstrap`.
  ///
  ///  Example (Chef): `aws opsworks-cm associate-node --server-name _MyServer_
  /// --node-name _MyManagedNode_ --engine-attributes
  /// "Name=_CHEF_ORGANIZATION_,Value=default"
  /// "Name=_CHEF_NODE_PUBLIC_KEY_,Value=_public-key-pem_"`
  ///
  ///  On a Puppet server, this command is an alternative to the `puppet cert
  /// sign` command that signs a Puppet node CSR.
  ///
  ///  Example (Chef): `aws opsworks-cm associate-node --server-name _MyServer_
  /// --node-name _MyManagedNode_ --engine-attributes
  /// "Name=_PUPPET_NODE_CSR_,Value=_csr-pem_"`
  ///
  ///  A node can can only be associated with servers that are in a `HEALTHY`
  /// state. Otherwise, an `InvalidStateException` is thrown. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid. The AssociateNode API call can be integrated into Auto Scaling
  /// configurations, AWS Cloudformation templates, or the user data of a
  /// server's instance.
  ///
  /// [serverName]: The name of the server with which to associate the node.
  ///
  /// [nodeName]: The name of the node.
  ///
  /// [engineAttributes]: Engine attributes used for associating the node.
  ///
  ///  **Attributes accepted in a AssociateNode request for Chef**
  ///
  /// *    `CHEF_ORGANIZATION`: The Chef organization with which the node is
  /// associated. By default only one organization named `default` can exist.
  ///
  /// *    `CHEF_NODE_PUBLIC_KEY`: A PEM-formatted public key. This key is
  /// required for the `chef-client` agent to access the Chef API.
  ///
  ///
  ///  **Attributes accepted in a AssociateNode request for Puppet**
  ///
  /// *    `PUPPET_NODE_CSR`: A PEM-formatted certificate-signing request (CSR)
  /// that is created by the node.
  Future<AssociateNodeResponse> associateNode(
      {@required String serverName,
      @required String nodeName,
      @required List<EngineAttribute> engineAttributes}) async {
    return AssociateNodeResponse.fromJson({});
  }

  ///  Creates an application-level backup of a server. While the server is in
  /// the `BACKING_UP` state, the server cannot be changed, and no additional
  /// backup can be created.
  ///
  ///  Backups can be created for servers in `RUNNING`, `HEALTHY`, and
  /// `UNHEALTHY` states. By default, you can create a maximum of 50 manual
  /// backups.
  ///
  ///  This operation is asynchronous.
  ///
  ///  A `LimitExceededException` is thrown when the maximum number of manual
  /// backups is reached. An `InvalidStateException` is thrown when the server
  /// is not in any of the following states: RUNNING, HEALTHY, or UNHEALTHY. A
  /// `ResourceNotFoundException` is thrown when the server is not found. A
  /// `ValidationException` is thrown when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: The name of the server that you want to back up.
  ///
  /// [description]:  A user-defined description of the backup.
  Future<CreateBackupResponse> createBackup(String serverName,
      {String description}) async {
    return CreateBackupResponse.fromJson({});
  }

  ///  Creates and immedately starts a new server. The server is ready to use
  /// when it is in the `HEALTHY` state. By default, you can create a maximum of
  /// 10 servers.
  ///
  ///  This operation is asynchronous.
  ///
  ///  A `LimitExceededException` is thrown when you have created the maximum
  /// number of servers (10). A `ResourceAlreadyExistsException` is thrown when
  /// a server with the same name already exists in the account. A
  /// `ResourceNotFoundException` is thrown when you specify a backup ID that is
  /// not valid or is for a backup that does not exist. A `ValidationException`
  /// is thrown when parameters of the request are not valid.
  ///
  ///  If you do not specify a security group by adding the `SecurityGroupIds`
  /// parameter, AWS OpsWorks creates a new security group.
  ///
  ///  _Chef Automate:_ The default security group opens the Chef server to the
  /// world on TCP port 443. If a KeyName is present, AWS OpsWorks enables SSH
  /// access. SSH is also open to the world on TCP port 22.
  ///
  ///  _Puppet Enterprise:_ The default security group opens TCP ports 22, 443,
  /// 4433, 8140, 8142, 8143, and 8170. If a KeyName is present, AWS OpsWorks
  /// enables SSH access. SSH is also open to the world on TCP port 22.
  ///
  /// By default, your server is accessible from any IP address. We recommend
  /// that you update your security group rules to allow access from known IP
  /// addresses and address ranges only. To edit security group rules, open
  /// Security Groups in the navigation pane of the EC2 management console.
  ///
  /// [associatePublicIpAddress]:  Associate a public IP address with a server
  /// that you are launching. Valid values are `true` or `false`. The default
  /// value is `true`.
  ///
  /// [disableAutomatedBackup]:  Enable or disable scheduled backups. Valid
  /// values are `true` or `false`. The default value is `true`.
  ///
  /// [engine]:  The configuration management engine to use. Valid values
  /// include `ChefAutomate` and `Puppet`.
  ///
  /// [engineModel]:  The engine model of the server. Valid values in this
  /// release include `Monolithic` for Puppet and `Single` for Chef.
  ///
  /// [engineVersion]:  The major release version of the engine that you want to
  /// use. For a Chef server, the valid value for EngineVersion is currently
  /// `12`. For a Puppet server, the valid value is `2017`.
  ///
  /// [engineAttributes]: Optional engine attributes on a specified server.
  ///
  ///  **Attributes accepted in a Chef createServer request:**
  ///
  /// *    `CHEF_AUTOMATE_PIVOTAL_KEY`: A base64-encoded RSA public key. The
  /// corresponding private key is required to access the Chef API. When no
  /// CHEF_AUTOMATE_PIVOTAL_KEY is set, a private key is generated and returned
  /// in the response.
  ///
  /// *    `CHEF_AUTOMATE_ADMIN_PASSWORD`: The password for the administrative
  /// user in the Chef Automate web-based dashboard. The password length is a
  /// minimum of eight characters, and a maximum of 32. The password can contain
  /// letters, numbers, and special characters (!/@#$%^&+=_). The password must
  /// contain at least one lower case letter, one upper case letter, one number,
  /// and one special character. When no CHEF_AUTOMATE_ADMIN_PASSWORD is set,
  /// one is generated and returned in the response.
  ///
  ///
  ///  **Attributes accepted in a Puppet createServer request:**
  ///
  /// *    `PUPPET_ADMIN_PASSWORD`: To work with the Puppet Enterprise console,
  /// a password must use ASCII characters.
  ///
  /// *    `PUPPET_R10K_REMOTE`: The r10k remote is the URL of your control
  /// repository (for example,
  /// ssh://git@your.git-repo.com:user/control-repo.git). Specifying an r10k
  /// remote opens TCP port 8170.
  ///
  /// *    `PUPPET_R10K_PRIVATE_KEY`: If you are using a private Git repository,
  /// add PUPPET_R10K_PRIVATE_KEY to specify a PEM-encoded private SSH key.
  ///
  /// [backupRetentionCount]:  The number of automated backups that you want to
  /// keep. Whenever a new backup is created, AWS OpsWorks CM deletes the oldest
  /// backups if this number is exceeded. The default value is `1`.
  ///
  /// [serverName]:  The name of the server. The server name must be unique
  /// within your AWS account, within each region. Server names must start with
  /// a letter; then letters, numbers, or hyphens (-) are allowed, up to a
  /// maximum of 40 characters.
  ///
  /// [instanceProfileArn]:  The ARN of the instance profile that your Amazon
  /// EC2 instances use. Although the AWS OpsWorks console typically creates the
  /// instance profile for you, if you are using API commands instead, run the
  /// service-role-creation.yaml AWS CloudFormation template, located at
  /// https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml.
  /// This template creates a CloudFormation stack that includes the instance
  /// profile you need.
  ///
  /// [instanceType]:  The Amazon EC2 instance type to use. For example,
  /// `m5.large`.
  ///
  /// [keyPair]:  The Amazon EC2 key pair to set for the instance. This
  /// parameter is optional; if desired, you may specify this parameter to
  /// connect to your instances by using SSH.
  ///
  /// [preferredMaintenanceWindow]:  The start time for a one-hour period each
  /// week during which AWS OpsWorks CM performs maintenance on the instance.
  /// Valid values must be specified in the following format: `DDD:HH:MM`. The
  /// specified time is in coordinated universal time (UTC). The default value
  /// is a random one-hour period on Tuesday, Wednesday, or Friday. See
  /// `TimeWindowDefinition` for more information.
  ///
  ///  **Example:** `Mon:08:00`, which represents a start time of every Monday
  /// at 08:00 UTC. (8:00 a.m.)
  ///
  /// [preferredBackupWindow]:  The start time for a one-hour period during
  /// which AWS OpsWorks CM backs up application-level data on your server if
  /// automated backups are enabled. Valid values must be specified in one of
  /// the following formats:
  ///
  /// *    `HH:MM` for daily backups
  ///
  /// *    `DDD:HH:MM` for weekly backups
  ///
  ///
  /// The specified time is in coordinated universal time (UTC). The default
  /// value is a random, daily start time.
  ///
  ///  **Example:** `08:00`, which represents a daily start time of 08:00 UTC.
  ///
  ///  **Example:** `Mon:08:00`, which represents a start time of every Monday
  /// at 08:00 UTC. (8:00 a.m.)
  ///
  /// [securityGroupIds]:  A list of security group IDs to attach to the Amazon
  /// EC2 instance. If you add this parameter, the specified security groups
  /// must be within the VPC that is specified by `SubnetIds`.
  ///
  ///  If you do not specify this parameter, AWS OpsWorks CM creates one new
  /// security group that uses TCP ports 22 and 443, open to 0.0.0.0/0
  /// (everyone).
  ///
  /// [serviceRoleArn]:  The service role that the AWS OpsWorks CM service
  /// backend uses to work with your account. Although the AWS OpsWorks
  /// management console typically creates the service role for you, if you are
  /// using the AWS CLI or API commands, run the service-role-creation.yaml AWS
  /// CloudFormation template, located at
  /// https://s3.amazonaws.com/opsworks-cm-us-east-1-prod-default-assets/misc/opsworks-cm-roles.yaml.
  /// This template creates a CloudFormation stack that includes the service
  /// role and instance profile that you need.
  ///
  /// [subnetIds]:  The IDs of subnets in which to launch the server EC2
  /// instance.
  ///
  ///  Amazon EC2-Classic customers: This field is required. All servers must
  /// run within a VPC. The VPC must have "Auto Assign Public IP" enabled.
  ///
  ///  EC2-VPC customers: This field is optional. If you do not specify subnet
  /// IDs, your EC2 instances are created in a default subnet that is selected
  /// by Amazon EC2. If you specify subnet IDs, the VPC must have "Auto Assign
  /// Public IP" enabled.
  ///
  /// For more information about supported Amazon EC2 platforms, see
  /// [Supported Platforms](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html).
  ///
  /// [backupId]:  If you specify this field, AWS OpsWorks CM creates the server
  /// by using the backup represented by BackupId.
  Future<CreateServerResponse> createServer(
      {bool associatePublicIpAddress,
      bool disableAutomatedBackup,
      String engine,
      String engineModel,
      String engineVersion,
      List<EngineAttribute> engineAttributes,
      int backupRetentionCount,
      @required String serverName,
      @required String instanceProfileArn,
      @required String instanceType,
      String keyPair,
      String preferredMaintenanceWindow,
      String preferredBackupWindow,
      List<String> securityGroupIds,
      @required String serviceRoleArn,
      List<String> subnetIds,
      String backupId}) async {
    return CreateServerResponse.fromJson({});
  }

  ///  Deletes a backup. You can delete both manual and automated backups. This
  /// operation is asynchronous.
  ///
  ///  An `InvalidStateException` is thrown when a backup deletion is already in
  /// progress. A `ResourceNotFoundException` is thrown when the backup does not
  /// exist. A `ValidationException` is thrown when parameters of the request
  /// are not valid.
  ///
  /// [backupId]: The ID of the backup to delete. Run the DescribeBackups
  /// command to get a list of backup IDs. Backup IDs are in the format
  /// `ServerName-yyyyMMddHHmmssSSS`.
  Future<DeleteBackupResponse> deleteBackup(String backupId) async {
    return DeleteBackupResponse.fromJson({});
  }

  ///  Deletes the server and the underlying AWS CloudFormation stacks
  /// (including the server's EC2 instance). When you run this command, the
  /// server state is updated to `DELETING`. After the server is deleted, it is
  /// no longer returned by `DescribeServer` requests. If the AWS CloudFormation
  /// stack cannot be deleted, the server cannot be deleted.
  ///
  ///  This operation is asynchronous.
  ///
  ///  An `InvalidStateException` is thrown when a server deletion is already in
  /// progress. A `ResourceNotFoundException` is thrown when the server does not
  /// exist. A `ValidationException` is raised when parameters of the request
  /// are not valid.
  ///
  /// [serverName]: The ID of the server to delete.
  Future<DeleteServerResponse> deleteServer(String serverName) async {
    return DeleteServerResponse.fromJson({});
  }

  ///  Describes your OpsWorks-CM account attributes.
  ///
  ///  This operation is synchronous.
  Future<DescribeAccountAttributesResponse> describeAccountAttributes() async {
    return DescribeAccountAttributesResponse.fromJson({});
  }

  ///  Describes backups. The results are ordered by time, with newest backups
  /// first. If you do not specify a BackupId or ServerName, the command returns
  /// all backups.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the backup does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [backupId]: Describes a single backup.
  ///
  /// [serverName]: Returns backups for the server with the specified
  /// ServerName.
  ///
  /// [nextToken]: This is not currently implemented for `DescribeBackups`
  /// requests.
  ///
  /// [maxResults]: This is not currently implemented for `DescribeBackups`
  /// requests.
  Future<DescribeBackupsResponse> describeBackups(
      {String backupId,
      String serverName,
      String nextToken,
      int maxResults}) async {
    return DescribeBackupsResponse.fromJson({});
  }

  ///  Describes events for a specified server. Results are ordered by time,
  /// with newest events first.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: The name of the server for which you want to view events.
  ///
  /// [nextToken]: NextToken is a string that is returned in some command
  /// responses. It indicates that not all entries have been returned, and that
  /// you must run at least one more request to get remaining items. To get
  /// remaining results, call `DescribeEvents` again, and assign the token from
  /// the previous results as the value of the `nextToken` parameter. If there
  /// are no more results, the response object's `nextToken` parameter value is
  /// `null`. Setting a `nextToken` value that was not returned in your previous
  /// results causes an `InvalidNextTokenException` to occur.
  ///
  /// [maxResults]: To receive a paginated response, use this parameter to
  /// specify the maximum number of results to be returned with a single call.
  /// If the number of available results exceeds this maximum, the response
  /// includes a `NextToken` value that you can assign to the `NextToken`
  /// request parameter to get the next set of results.
  Future<DescribeEventsResponse> describeEvents(String serverName,
      {String nextToken, int maxResults}) async {
    return DescribeEventsResponse.fromJson({});
  }

  ///  Returns the current status of an existing association or disassociation
  /// request.
  ///
  ///  A `ResourceNotFoundException` is thrown when no recent association or
  /// disassociation request with the specified token is found, or when the
  /// server does not exist. A `ValidationException` is raised when parameters
  /// of the request are not valid.
  ///
  /// [nodeAssociationStatusToken]: The token returned in either the
  /// AssociateNodeResponse or the DisassociateNodeResponse.
  ///
  /// [serverName]: The name of the server from which to disassociate the node.
  Future<DescribeNodeAssociationStatusResponse> describeNodeAssociationStatus(
      {@required String nodeAssociationStatusToken,
      @required String serverName}) async {
    return DescribeNodeAssociationStatusResponse.fromJson({});
  }

  ///  Lists all configuration management servers that are identified with your
  /// account. Only the stored results from Amazon DynamoDB are returned. AWS
  /// OpsWorks CM does not query other services.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: Describes the server with the specified ServerName.
  ///
  /// [nextToken]: This is not currently implemented for `DescribeServers`
  /// requests.
  ///
  /// [maxResults]: This is not currently implemented for `DescribeServers`
  /// requests.
  Future<DescribeServersResponse> describeServers(
      {String serverName, String nextToken, int maxResults}) async {
    return DescribeServersResponse.fromJson({});
  }

  ///  Disassociates a node from an AWS OpsWorks CM server, and removes the node
  /// from the server's managed nodes. After a node is disassociated, the node
  /// key pair is no longer valid for accessing the configuration manager's API.
  /// For more information about how to associate a node, see AssociateNode.
  ///
  /// A node can can only be disassociated from a server that is in a `HEALTHY`
  /// state. Otherwise, an `InvalidStateException` is thrown. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: The name of the server from which to disassociate the node.
  ///
  /// [nodeName]: The name of the client node.
  ///
  /// [engineAttributes]: Engine attributes that are used for disassociating the
  /// node. No attributes are required for Puppet.
  ///
  ///  **Attributes required in a DisassociateNode request for Chef**
  ///
  /// *    `CHEF_ORGANIZATION`: The Chef organization with which the node was
  /// associated. By default only one organization named `default` can exist.
  Future<DisassociateNodeResponse> disassociateNode(
      {@required String serverName,
      @required String nodeName,
      List<EngineAttribute> engineAttributes}) async {
    return DisassociateNodeResponse.fromJson({});
  }

  ///  Exports a specified server engine attribute as a base64-encoded string.
  /// For example, you can export user data that you can use in EC2 to associate
  /// nodes with a server.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ValidationException` is raised when parameters of the request are not
  /// valid. A `ResourceNotFoundException` is thrown when the server does not
  /// exist. An `InvalidStateException` is thrown when the server is in any of
  /// the following states: CREATING, TERMINATED, FAILED or DELETING.
  ///
  /// [exportAttributeName]: The name of the export attribute. Currently, the
  /// supported export attribute is `Userdata`. This exports a user data script
  /// that includes parameters and values provided in the `InputAttributes`
  /// list.
  ///
  /// [serverName]: The name of the server from which you are exporting the
  /// attribute.
  ///
  /// [inputAttributes]: The list of engine attributes. The list type is
  /// `EngineAttribute`. An `EngineAttribute` list item is a pair that includes
  /// an attribute name and its value. For the `Userdata` ExportAttributeName,
  /// the following are supported engine attribute names.
  ///
  /// *    **RunList** In Chef, a list of roles or recipes that are run in the
  /// specified order. In Puppet, this parameter is ignored.
  ///
  /// *    **OrganizationName** In Chef, an organization name. AWS OpsWorks for
  /// Chef Automate always creates the organization `default`. In Puppet, this
  /// parameter is ignored.
  ///
  /// *    **NodeEnvironment** In Chef, a node environment (for example,
  /// development, staging, or one-box). In Puppet, this parameter is ignored.
  ///
  /// *    **NodeClientVersion** In Chef, the version of the Chef engine (three
  /// numbers separated by dots, such as 13.8.5). If this attribute is empty,
  /// OpsWorks for Chef Automate uses the most current version. In Puppet, this
  /// parameter is ignored.
  Future<ExportServerEngineAttributeResponse> exportServerEngineAttribute(
      {@required String exportAttributeName,
      @required String serverName,
      List<EngineAttribute> inputAttributes}) async {
    return ExportServerEngineAttributeResponse.fromJson({});
  }

  ///  Restores a backup to a server that is in a `CONNECTION_LOST`, `HEALTHY`,
  /// `RUNNING`, `UNHEALTHY`, or `TERMINATED` state. When you run RestoreServer,
  /// the server's EC2 instance is deleted, and a new EC2 instance is
  /// configured. RestoreServer maintains the existing server endpoint, so
  /// configuration management of the server's client devices (nodes) should
  /// continue to work.
  ///
  ///  This operation is asynchronous.
  ///
  ///  An `InvalidStateException` is thrown when the server is not in a valid
  /// state. A `ResourceNotFoundException` is thrown when the server does not
  /// exist. A `ValidationException` is raised when parameters of the request
  /// are not valid.
  ///
  /// [backupId]:  The ID of the backup that you want to use to restore a
  /// server.
  ///
  /// [serverName]:  The name of the server that you want to restore.
  ///
  /// [instanceType]:  The type of the instance to create. Valid values must be
  /// specified in the following format: `^([cm][34]|t2).*` For example,
  /// `m5.large`. Valid values are `m5.large`, `r5.xlarge`, and `r5.2xlarge`. If
  /// you do not specify this parameter, RestoreServer uses the instance type
  /// from the specified backup.
  ///
  /// [keyPair]:  The name of the key pair to set on the new EC2 instance. This
  /// can be helpful if the administrator no longer has the SSH key.
  Future<RestoreServerResponse> restoreServer(
      {@required String backupId,
      @required String serverName,
      String instanceType,
      String keyPair}) async {
    return RestoreServerResponse.fromJson({});
  }

  ///  Manually starts server maintenance. This command can be useful if an
  /// earlier maintenance attempt failed, and the underlying cause of
  /// maintenance failure has been resolved. The server is in an
  /// `UNDER_MAINTENANCE` state while maintenance is in progress.
  ///
  ///  Maintenance can only be started on servers in `HEALTHY` and `UNHEALTHY`
  /// states. Otherwise, an `InvalidStateException` is thrown. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: The name of the server on which to run maintenance.
  ///
  /// [engineAttributes]: Engine attributes that are specific to the server on
  /// which you want to run maintenance.
  Future<StartMaintenanceResponse> startMaintenance(String serverName,
      {List<EngineAttribute> engineAttributes}) async {
    return StartMaintenanceResponse.fromJson({});
  }

  ///  Updates settings for a server.
  ///
  ///  This operation is synchronous.
  ///
  /// [disableAutomatedBackup]: Setting DisableAutomatedBackup to `true`
  /// disables automated or scheduled backups. Automated backups are enabled by
  /// default.
  ///
  /// [backupRetentionCount]: Sets the number of automated backups that you want
  /// to keep.
  ///
  /// [serverName]: The name of the server to update.
  Future<UpdateServerResponse> updateServer(String serverName,
      {bool disableAutomatedBackup,
      int backupRetentionCount,
      String preferredMaintenanceWindow,
      String preferredBackupWindow}) async {
    return UpdateServerResponse.fromJson({});
  }

  ///  Updates engine-specific attributes on a specified server. The server
  /// enters the `MODIFYING` state when this operation is in progress. Only one
  /// update can occur at a time. You can use this command to reset a Chef
  /// server's public key (`CHEF_PIVOTAL_KEY`) or a Puppet server's admin
  /// password (`PUPPET_ADMIN_PASSWORD`).
  ///
  ///  This operation is asynchronous.
  ///
  ///  This operation can only be called for servers in `HEALTHY` or `UNHEALTHY`
  /// states. Otherwise, an `InvalidStateException` is raised. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  ///
  /// [serverName]: The name of the server to update.
  ///
  /// [attributeName]: The name of the engine attribute to update.
  ///
  /// [attributeValue]: The value to set for the attribute.
  Future<UpdateServerEngineAttributesResponse> updateServerEngineAttributes(
      {@required String serverName,
      @required String attributeName,
      String attributeValue}) async {
    return UpdateServerEngineAttributesResponse.fromJson({});
  }
}

/// Stores account attributes.
class AccountAttribute {
  ///  The attribute name. The following are supported attribute names.
  ///
  /// *    _ServerLimit:_ The number of current servers/maximum number of
  /// servers allowed. By default, you can have a maximum of 10 servers.
  ///
  /// *    _ManualBackupLimit:_ The number of current manual backups/maximum
  /// number of backups allowed. By default, you can have a maximum of 50 manual
  /// backups saved.
  final String name;

  ///  The maximum allowed value.
  final int maximum;

  ///  The current usage, such as the current number of servers that are
  /// associated with the account.
  final int used;

  AccountAttribute({
    this.name,
    this.maximum,
    this.used,
  });
  static AccountAttribute fromJson(Map<String, dynamic> json) =>
      AccountAttribute();
}

class AssociateNodeResponse {
  /// Contains a token which can be passed to the
  /// `DescribeNodeAssociationStatus` API call to get the status of the
  /// association request.
  final String nodeAssociationStatusToken;

  AssociateNodeResponse({
    this.nodeAssociationStatusToken,
  });
  static AssociateNodeResponse fromJson(Map<String, dynamic> json) =>
      AssociateNodeResponse();
}

/// Describes a single backup.
class Backup {
  /// The ARN of the backup.
  final String backupArn;

  ///  The generated ID of the backup. Example: `myServerName-yyyyMMddHHmmssSSS`
  final String backupId;

  ///  The backup type. Valid values are `automated` or `manual`.
  final String backupType;

  ///  The time stamp when the backup was created in the database. Example:
  /// `2016-07-29T13:38:47.520Z`
  final DateTime createdAt;

  ///  A user-provided description for a manual backup. This field is empty for
  /// automated backups.
  final String description;

  ///  The engine type that is obtained from the server when the backup is
  /// created.
  final String engine;

  ///  The engine model that is obtained from the server when the backup is
  /// created.
  final String engineModel;

  ///  The engine version that is obtained from the server when the backup is
  /// created.
  final String engineVersion;

  ///  The EC2 instance profile ARN that is obtained from the server when the
  /// backup is created. Because this value is stored, you are not required to
  /// provide the InstanceProfileArn again if you restore a backup.
  final String instanceProfileArn;

  ///  The instance type that is obtained from the server when the backup is
  /// created.
  final String instanceType;

  ///  The key pair that is obtained from the server when the backup is created.
  final String keyPair;

  ///  The preferred backup period that is obtained from the server when the
  /// backup is created.
  final String preferredBackupWindow;

  ///  The preferred maintenance period that is obtained from the server when
  /// the backup is created.
  final String preferredMaintenanceWindow;

  ///  This field is deprecated and is no longer used.
  final int s3DataSize;

  ///  This field is deprecated and is no longer used.
  final String s3DataUrl;

  ///  The Amazon S3 URL of the backup's log file.
  final String s3LogUrl;

  ///  The security group IDs that are obtained from the server when the backup
  /// is created.
  final List<String> securityGroupIds;

  ///  The name of the server from which the backup was made.
  final String serverName;

  ///  The service role ARN that is obtained from the server when the backup is
  /// created.
  final String serviceRoleArn;

  /// The status of a backup while in progress.
  final String status;

  ///  An informational message about backup status.
  final String statusDescription;

  ///  The subnet IDs that are obtained from the server when the backup is
  /// created.
  final List<String> subnetIds;

  ///  The version of AWS OpsWorks CM-specific tools that is obtained from the
  /// server when the backup is created.
  final String toolsVersion;

  ///  The IAM user ARN of the requester for manual backups. This field is empty
  /// for automated backups.
  final String userArn;

  Backup({
    this.backupArn,
    this.backupId,
    this.backupType,
    this.createdAt,
    this.description,
    this.engine,
    this.engineModel,
    this.engineVersion,
    this.instanceProfileArn,
    this.instanceType,
    this.keyPair,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.s3DataSize,
    this.s3DataUrl,
    this.s3LogUrl,
    this.securityGroupIds,
    this.serverName,
    this.serviceRoleArn,
    this.status,
    this.statusDescription,
    this.subnetIds,
    this.toolsVersion,
    this.userArn,
  });
  static Backup fromJson(Map<String, dynamic> json) => Backup();
}

class CreateBackupResponse {
  /// Backup created by request.
  final Backup backup;

  CreateBackupResponse({
    this.backup,
  });
  static CreateBackupResponse fromJson(Map<String, dynamic> json) =>
      CreateBackupResponse();
}

class CreateServerResponse {
  /// The server that is created by the request.
  final Server server;

  CreateServerResponse({
    this.server,
  });
  static CreateServerResponse fromJson(Map<String, dynamic> json) =>
      CreateServerResponse();
}

class DeleteBackupResponse {
  DeleteBackupResponse();
  static DeleteBackupResponse fromJson(Map<String, dynamic> json) =>
      DeleteBackupResponse();
}

class DeleteServerResponse {
  DeleteServerResponse();
  static DeleteServerResponse fromJson(Map<String, dynamic> json) =>
      DeleteServerResponse();
}

class DescribeAccountAttributesResponse {
  ///  The attributes that are currently set for the account.
  final List<AccountAttribute> attributes;

  DescribeAccountAttributesResponse({
    this.attributes,
  });
  static DescribeAccountAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAccountAttributesResponse();
}

class DescribeBackupsResponse {
  /// Contains the response to a `DescribeBackups` request.
  final List<Backup> backups;

  /// This is not currently implemented for `DescribeBackups` requests.
  final String nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });
  static DescribeBackupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeBackupsResponse();
}

class DescribeEventsResponse {
  /// Contains the response to a `DescribeEvents` request.
  final List<ServerEvent> serverEvents;

  /// NextToken is a string that is returned in some command responses. It
  /// indicates that not all entries have been returned, and that you must run
  /// at least one more request to get remaining items. To get remaining
  /// results, call `DescribeEvents` again, and assign the token from the
  /// previous results as the value of the `nextToken` parameter. If there are
  /// no more results, the response object's `nextToken` parameter value is
  /// `null`. Setting a `nextToken` value that was not returned in your previous
  /// results causes an `InvalidNextTokenException` to occur.
  final String nextToken;

  DescribeEventsResponse({
    this.serverEvents,
    this.nextToken,
  });
  static DescribeEventsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventsResponse();
}

class DescribeNodeAssociationStatusResponse {
  /// The status of the association or disassociation request.
  ///
  ///  **Possible values:**
  ///
  /// *    `SUCCESS`: The association or disassociation succeeded.
  ///
  /// *    `FAILED`: The association or disassociation failed.
  ///
  /// *    `IN_PROGRESS`: The association or disassociation is still in
  /// progress.
  final String nodeAssociationStatus;

  /// Attributes specific to the node association. In Puppet, the attibute
  /// PUPPET_NODE_CERT contains the signed certificate (the result of the CSR).
  final List<EngineAttribute> engineAttributes;

  DescribeNodeAssociationStatusResponse({
    this.nodeAssociationStatus,
    this.engineAttributes,
  });
  static DescribeNodeAssociationStatusResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeNodeAssociationStatusResponse();
}

class DescribeServersResponse {
  /// Contains the response to a `DescribeServers` request.
  ///
  ///  _For Puppet Server:_ `DescribeServersResponse$Servers$EngineAttributes`
  /// contains PUPPET_API_CA_CERT. This is the PEM-encoded CA certificate that
  /// is used by the Puppet API over TCP port number 8140. The CA certificate is
  /// also used to sign node certificates.
  final List<Server> servers;

  /// This is not currently implemented for `DescribeServers` requests.
  final String nextToken;

  DescribeServersResponse({
    this.servers,
    this.nextToken,
  });
  static DescribeServersResponse fromJson(Map<String, dynamic> json) =>
      DescribeServersResponse();
}

class DisassociateNodeResponse {
  /// Contains a token which can be passed to the
  /// `DescribeNodeAssociationStatus` API call to get the status of the
  /// disassociation request.
  final String nodeAssociationStatusToken;

  DisassociateNodeResponse({
    this.nodeAssociationStatusToken,
  });
  static DisassociateNodeResponse fromJson(Map<String, dynamic> json) =>
      DisassociateNodeResponse();
}

/// A name and value pair that is specific to the engine of the server.
class EngineAttribute {
  /// The name of the engine attribute.
  final String name;

  /// The value of the engine attribute.
  final String value;

  EngineAttribute({
    this.name,
    this.value,
  });
  static EngineAttribute fromJson(Map<String, dynamic> json) =>
      EngineAttribute();
}

class ExportServerEngineAttributeResponse {
  /// The requested engine attribute pair with attribute name and value.
  final EngineAttribute engineAttribute;

  /// The server name used in the request.
  final String serverName;

  ExportServerEngineAttributeResponse({
    this.engineAttribute,
    this.serverName,
  });
  static ExportServerEngineAttributeResponse fromJson(
          Map<String, dynamic> json) =>
      ExportServerEngineAttributeResponse();
}

class RestoreServerResponse {
  RestoreServerResponse();
  static RestoreServerResponse fromJson(Map<String, dynamic> json) =>
      RestoreServerResponse();
}

/// Describes a configuration management server.
class Server {
  /// Associate a public IP address with a server that you are launching.
  final bool associatePublicIpAddress;

  /// The number of automated backups to keep.
  final int backupRetentionCount;

  /// The name of the server.
  final String serverName;

  /// Time stamp of server creation. Example `2016-07-29T13:38:47.520Z`
  final DateTime createdAt;

  /// The ARN of the CloudFormation stack that was used to create the server.
  final String cloudFormationStackArn;

  /// Disables automated backups. The number of stored backups is dependent on
  /// the value of PreferredBackupCount.
  final bool disableAutomatedBackup;

  ///  A DNS name that can be used to access the engine. Example:
  /// `myserver-asdfghjkl.us-east-1.opsworks.io`
  final String endpoint;

  /// The engine type of the server. Valid values in this release include
  /// `ChefAutomate` and `Puppet`.
  final String engine;

  /// The engine model of the server. Valid values in this release include
  /// `Monolithic` for Puppet and `Single` for Chef.
  final String engineModel;

  /// The response of a createServer() request returns the master credential to
  /// access the server in EngineAttributes. These credentials are not stored by
  /// AWS OpsWorks CM; they are returned only as part of the result of
  /// createServer().
  ///
  ///  **Attributes returned in a createServer response for Chef**
  ///
  /// *    `CHEF_AUTOMATE_PIVOTAL_KEY`: A base64-encoded RSA private key that is
  /// generated by AWS OpsWorks for Chef Automate. This private key is required
  /// to access the Chef API.
  ///
  /// *    `CHEF_STARTER_KIT`: A base64-encoded ZIP file. The ZIP file contains
  /// a Chef starter kit, which includes a README, a configuration file, and the
  /// required RSA private key. Save this file, unzip it, and then change to the
  /// directory where you've unzipped the file contents. From this directory,
  /// you can run Knife commands.
  ///
  ///
  ///  **Attributes returned in a createServer response for Puppet**
  ///
  /// *    `PUPPET_STARTER_KIT`: A base64-encoded ZIP file. The ZIP file
  /// contains a Puppet starter kit, including a README and a required private
  /// key. Save this file, unzip it, and then change to the directory where
  /// you've unzipped the file contents.
  ///
  /// *    `PUPPET_ADMIN_PASSWORD`: An administrator password that you can use
  /// to sign in to the Puppet Enterprise console after the server is online.
  final List<EngineAttribute> engineAttributes;

  /// The engine version of the server. For a Chef server, the valid value for
  /// EngineVersion is currently `12`. For a Puppet server, the valid value is
  /// `2017`.
  final String engineVersion;

  /// The instance profile ARN of the server.
  final String instanceProfileArn;

  ///  The instance type for the server, as specified in the CloudFormation
  /// stack. This might not be the same instance type that is shown in the EC2
  /// console.
  final String instanceType;

  /// The key pair associated with the server.
  final String keyPair;

  /// The status of the most recent server maintenance run. Shows `SUCCESS` or
  /// `FAILED`.
  final String maintenanceStatus;

  /// The preferred maintenance period specified for the server.
  final String preferredMaintenanceWindow;

  /// The preferred backup period specified for the server.
  final String preferredBackupWindow;

  ///  The security group IDs for the server, as specified in the CloudFormation
  /// stack. These might not be the same security groups that are shown in the
  /// EC2 console.
  final List<String> securityGroupIds;

  /// The service role ARN used to create the server.
  final String serviceRoleArn;

  ///  The server's status. This field displays the states of actions in
  /// progress, such as creating, running, or backing up the server, as well as
  /// the server's health state.
  final String status;

  ///  Depending on the server status, this field has either a human-readable
  /// message (such as a create or backup error), or an escaped block of JSON
  /// (used for health check results).
  final String statusReason;

  ///  The subnet IDs specified in a CreateServer request.
  final List<String> subnetIds;

  /// The ARN of the server.
  final String serverArn;

  Server({
    this.associatePublicIpAddress,
    this.backupRetentionCount,
    this.serverName,
    this.createdAt,
    this.cloudFormationStackArn,
    this.disableAutomatedBackup,
    this.endpoint,
    this.engine,
    this.engineModel,
    this.engineAttributes,
    this.engineVersion,
    this.instanceProfileArn,
    this.instanceType,
    this.keyPair,
    this.maintenanceStatus,
    this.preferredMaintenanceWindow,
    this.preferredBackupWindow,
    this.securityGroupIds,
    this.serviceRoleArn,
    this.status,
    this.statusReason,
    this.subnetIds,
    this.serverArn,
  });
  static Server fromJson(Map<String, dynamic> json) => Server();
}

/// An event that is related to the server, such as the start of maintenance or
/// backup.
class ServerEvent {
  /// The time when the event occurred.
  final DateTime createdAt;

  /// The name of the server on or for which the event occurred.
  final String serverName;

  /// A human-readable informational or status message.
  final String message;

  /// The Amazon S3 URL of the event's log file.
  final String logUrl;

  ServerEvent({
    this.createdAt,
    this.serverName,
    this.message,
    this.logUrl,
  });
  static ServerEvent fromJson(Map<String, dynamic> json) => ServerEvent();
}

class StartMaintenanceResponse {
  /// Contains the response to a `StartMaintenance` request.
  final Server server;

  StartMaintenanceResponse({
    this.server,
  });
  static StartMaintenanceResponse fromJson(Map<String, dynamic> json) =>
      StartMaintenanceResponse();
}

class UpdateServerEngineAttributesResponse {
  /// Contains the response to an `UpdateServerEngineAttributes` request.
  final Server server;

  UpdateServerEngineAttributesResponse({
    this.server,
  });
  static UpdateServerEngineAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateServerEngineAttributesResponse();
}

class UpdateServerResponse {
  /// Contains the response to a `UpdateServer` request.
  final Server server;

  UpdateServerResponse({
    this.server,
  });
  static UpdateServerResponse fromJson(Map<String, dynamic> json) =>
      UpdateServerResponse();
}
