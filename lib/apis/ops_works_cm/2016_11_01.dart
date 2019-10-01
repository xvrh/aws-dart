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
  /// "Name=_CHEF\_NODE\_PUBLIC_KEY_,Value=_public-key-pem_"`
  ///
  ///  On a Puppet server, this command is an alternative to the `puppet cert
  /// sign` command that signs a Puppet node CSR.
  ///
  ///  Example (Chef): `aws opsworks-cm associate-node --server-name _MyServer_
  /// --node-name _MyManagedNode_ --engine-attributes
  /// "Name=_PUPPET\_NODE\_CSR_,Value=_csr-pem_"`
  ///
  ///  A node can can only be associated with servers that are in a `HEALTHY`
  /// state. Otherwise, an `InvalidStateException` is thrown. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid. The AssociateNode API call can be integrated into Auto Scaling
  /// configurations, AWS Cloudformation templates, or the user data of a
  /// server's instance.
  Future<void> associateNode(
      {@required String serverName,
      @required String nodeName,
      @required List<EngineAttribute> engineAttributes}) async {}

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
  Future<void> createBackup(String serverName, {String description}) async {}

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
  Future<void> createServer(
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
      String backupId}) async {}

  ///  Deletes a backup. You can delete both manual and automated backups. This
  /// operation is asynchronous.
  ///
  ///  An `InvalidStateException` is thrown when a backup deletion is already in
  /// progress. A `ResourceNotFoundException` is thrown when the backup does not
  /// exist. A `ValidationException` is thrown when parameters of the request
  /// are not valid.
  Future<void> deleteBackup(String backupId) async {}

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
  Future<void> deleteServer(String serverName) async {}

  ///  Describes your OpsWorks-CM account attributes.
  ///
  ///  This operation is synchronous.
  Future<void> describeAccountAttributes() async {}

  ///  Describes backups. The results are ordered by time, with newest backups
  /// first. If you do not specify a BackupId or ServerName, the command returns
  /// all backups.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the backup does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  Future<void> describeBackups(
      {String backupId,
      String serverName,
      String nextToken,
      int maxResults}) async {}

  ///  Describes events for a specified server. Results are ordered by time,
  /// with newest events first.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  Future<void> describeEvents(String serverName,
      {String nextToken, int maxResults}) async {}

  ///  Returns the current status of an existing association or disassociation
  /// request.
  ///
  ///  A `ResourceNotFoundException` is thrown when no recent association or
  /// disassociation request with the specified token is found, or when the
  /// server does not exist. A `ValidationException` is raised when parameters
  /// of the request are not valid.
  Future<void> describeNodeAssociationStatus(
      {@required String nodeAssociationStatusToken,
      @required String serverName}) async {}

  ///  Lists all configuration management servers that are identified with your
  /// account. Only the stored results from Amazon DynamoDB are returned. AWS
  /// OpsWorks CM does not query other services.
  ///
  ///  This operation is synchronous.
  ///
  ///  A `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  Future<void> describeServers(
      {String serverName, String nextToken, int maxResults}) async {}

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
  Future<void> disassociateNode(
      {@required String serverName,
      @required String nodeName,
      List<EngineAttribute> engineAttributes}) async {}

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
  Future<void> exportServerEngineAttribute(
      {@required String exportAttributeName,
      @required String serverName,
      List<EngineAttribute> inputAttributes}) async {}

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
  Future<void> restoreServer(
      {@required String backupId,
      @required String serverName,
      String instanceType,
      String keyPair}) async {}

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
  Future<void> startMaintenance(String serverName,
      {List<EngineAttribute> engineAttributes}) async {}

  ///  Updates settings for a server.
  ///
  ///  This operation is synchronous.
  Future<void> updateServer(String serverName,
      {bool disableAutomatedBackup,
      int backupRetentionCount,
      String preferredMaintenanceWindow,
      String preferredBackupWindow}) async {}

  ///  Updates engine-specific attributes on a specified server. The server
  /// enters the `MODIFYING` state when this operation is in progress. Only one
  /// update can occur at a time. You can use this command to reset a Chef
  /// server's public key (`CHEF\_PIVOTAL\_KEY`) or a Puppet server's admin
  /// password (`PUPPET\_ADMIN\_PASSWORD`).
  ///
  ///  This operation is asynchronous.
  ///
  ///  This operation can only be called for servers in `HEALTHY` or `UNHEALTHY`
  /// states. Otherwise, an `InvalidStateException` is raised. A
  /// `ResourceNotFoundException` is thrown when the server does not exist. A
  /// `ValidationException` is raised when parameters of the request are not
  /// valid.
  Future<void> updateServerEngineAttributes(
      {@required String serverName,
      @required String attributeName,
      String attributeValue}) async {}
}

class AccountAttribute {}

class AssociateNodeResponse {}

class Backup {}

class CreateBackupResponse {}

class CreateServerResponse {}

class DeleteBackupResponse {}

class DeleteServerResponse {}

class DescribeAccountAttributesResponse {}

class DescribeBackupsResponse {}

class DescribeEventsResponse {}

class DescribeNodeAssociationStatusResponse {}

class DescribeServersResponse {}

class DisassociateNodeResponse {}

class EngineAttribute {}

class ExportServerEngineAttributeResponse {}

class RestoreServerResponse {}

class Server {}

class ServerEvent {}

class StartMaintenanceResponse {}

class UpdateServerEngineAttributesResponse {}

class UpdateServerResponse {}
