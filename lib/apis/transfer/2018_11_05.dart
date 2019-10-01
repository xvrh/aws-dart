import 'package:meta/meta.dart';

/// AWS Transfer for SFTP is a fully managed service that enables the transfer
/// of files directly into and out of Amazon S3 using the Secure File Transfer
/// Protocol (SFTP)—also known as Secure Shell (SSH) File Transfer Protocol. AWS
/// helps you seamlessly migrate your file transfer workflows to AWS Transfer
/// for SFTP—by integrating with existing authentication systems, and providing
/// DNS routing with Amazon Route 53—so nothing changes for your customers and
/// partners, or their applications. With your data in S3, you can use it with
/// AWS services for processing, analytics, machine learning, and archiving.
/// Getting started with AWS Transfer for SFTP (AWS SFTP) is easy; there is no
/// infrastructure to buy and set up.
class TransferApi {
  /// Instantiates an autoscaling virtual server based on Secure File Transfer
  /// Protocol (SFTP) in AWS. When you make updates to your server or when you
  /// work with users, use the service-generated `ServerId` property that is
  /// assigned to the newly created server.
  Future<void> createServer(
      {EndpointDetails endpointDetails,
      String endpointType,
      String hostKey,
      IdentityProviderDetails identityProviderDetails,
      String identityProviderType,
      String loggingRole,
      List<Tag> tags}) async {}

  /// Creates a user and associates them with an existing Secure File Transfer
  /// Protocol (SFTP) server. You can only create and associate users with SFTP
  /// servers that have the `IdentityProviderType` set to `SERVICE_MANAGED`.
  /// Using parameters for `CreateUser`, you can specify the user name, set the
  /// home directory, store the user's public key, and assign the user's AWS
  /// Identity and Access Management (IAM) role. You can also optionally add a
  /// scope-down policy, and assign metadata with tags that can be used to group
  /// and search for users.
  Future<void> createUser(
      {String homeDirectory,
      String policy,
      @required String role,
      @required String serverId,
      String sshPublicKeyBody,
      List<Tag> tags,
      @required String userName}) async {}

  /// Deletes the Secure File Transfer Protocol (SFTP) server that you specify.
  ///
  /// No response returns from this operation.
  Future<void> deleteServer(String serverId) async {}

  /// Deletes a user's Secure Shell (SSH) public key.
  ///
  /// No response is returned from this operation.
  Future<void> deleteSshPublicKey(
      {@required String serverId,
      @required String sshPublicKeyId,
      @required String userName}) async {}

  /// Deletes the user belonging to the server you specify.
  ///
  /// No response returns from this operation.
  ///
  ///
  ///
  /// When you delete a user from a server, the user's information is lost.
  Future<void> deleteUser(
      {@required String serverId, @required String userName}) async {}

  /// Describes the server that you specify by passing the `ServerId` parameter.
  ///
  /// The response contains a description of the server's properties.
  Future<void> describeServer(String serverId) async {}

  /// Describes the user assigned to a specific server, as identified by its
  /// `ServerId` property.
  ///
  /// The response from this call returns the properties of the user associated
  /// with the `ServerId` value that was specified.
  Future<void> describeUser(
      {@required String serverId, @required String userName}) async {}

  /// Adds a Secure Shell (SSH) public key to a user account identified by a
  /// `UserName` value assigned to a specific server, identified by `ServerId`.
  ///
  /// The response returns the `UserName` value, the `ServerId` value, and the
  /// name of the `SshPublicKeyId`.
  Future<void> importSshPublicKey(
      {@required String serverId,
      @required String sshPublicKeyBody,
      @required String userName}) async {}

  /// Lists the Secure File Transfer Protocol (SFTP) servers that are associated
  /// with your AWS account.
  Future<void> listServers({int maxResults, String nextToken}) async {}

  /// Lists all of the tags associated with the Amazon Resource Number (ARN) you
  /// specify. The resource can be a user, server, or role.
  Future<void> listTagsForResource(String arn,
      {int maxResults, String nextToken}) async {}

  /// Lists the users for the server that you specify by passing the `ServerId`
  /// parameter.
  Future<void> listUsers(String serverId,
      {int maxResults, String nextToken}) async {}

  /// Changes the state of a Secure File Transfer Protocol (SFTP) server from
  /// `OFFLINE` to `ONLINE`. It has no impact on an SFTP server that is already
  /// `ONLINE`. An `ONLINE` server can accept and process file transfer jobs.
  ///
  /// The state of `STARTING` indicates that the server is in an intermediate
  /// state, either not fully able to respond, or not fully online. The values
  /// of `START_FAILED` can indicate an error condition.
  ///
  /// No response is returned from this call.
  Future<void> startServer(String serverId) async {}

  /// Changes the state of an SFTP server from `ONLINE` to `OFFLINE`. An
  /// `OFFLINE` server cannot accept and process file transfer jobs. Information
  /// tied to your server such as server and user properties are not affected by
  /// stopping your server. Stopping a server will not reduce or impact your
  /// Secure File Transfer Protocol (SFTP) endpoint billing.
  ///
  /// The state of `STOPPING` indicates that the server is in an intermediate
  /// state, either not fully able to respond, or not fully offline. The values
  /// of `STOP_FAILED` can indicate an error condition.
  ///
  /// No response is returned from this call.
  Future<void> stopServer(String serverId) async {}

  /// Attaches a key-value pair to a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are users, servers, roles, and other
  /// entities.
  ///
  /// There is no response returned from this call.
  Future<void> tagResource(
      {@required String arn, @required List<Tag> tags}) async {}

  /// If the `IdentityProviderType` of the server is `API_Gateway`, tests
  /// whether your API Gateway is set up successfully. We highly recommend that
  /// you call this operation to test your authentication method as soon as you
  /// create your server. By doing so, you can troubleshoot issues with the API
  /// Gateway integration to ensure that your users can successfully use the
  /// service.
  Future<void> testIdentityProvider(
      {@required String serverId,
      @required String userName,
      String userPassword}) async {}

  /// Detaches a key-value pair from a resource, as identified by its Amazon
  /// Resource Name (ARN). Resources are users, servers, roles, and other
  /// entities.
  ///
  /// No response is returned from this call.
  Future<void> untagResource(
      {@required String arn, @required List<String> tagKeys}) async {}

  /// Updates the server properties after that server has been created.
  ///
  /// The `UpdateServer` call returns the `ServerId` of the Secure File Transfer
  /// Protocol (SFTP) server you updated.
  Future<void> updateServer(String serverId,
      {EndpointDetails endpointDetails,
      String endpointType,
      String hostKey,
      IdentityProviderDetails identityProviderDetails,
      String loggingRole}) async {}

  /// Assigns new properties to a user. Parameters you pass modify any or all of
  /// the following: the home directory, role, and policy for the `UserName` and
  /// `ServerId` you specify.
  ///
  /// The response returns the `ServerId` and the `UserName` for the updated
  /// user.
  Future<void> updateUser(
      {String homeDirectory,
      String policy,
      String role,
      @required String serverId,
      @required String userName}) async {}
}

class CreateServerResponse {}

class CreateUserResponse {}

class DescribeServerResponse {}

class DescribeUserResponse {}

class DescribedServer {}

class DescribedUser {}

class EndpointDetails {}

class IdentityProviderDetails {}

class ImportSshPublicKeyResponse {}

class ListServersResponse {}

class ListTagsForResourceResponse {}

class ListUsersResponse {}

class ListedServer {}

class ListedUser {}

class SshPublicKey {}

class Tag {}

class TestIdentityProviderResponse {}

class UpdateServerResponse {}

class UpdateUserResponse {}
