import 'package:meta/meta.dart';

/// AWS EC2 Connect Service is a service that enables system administrators to
/// publish temporary SSH keys to their EC2 instances in order to establish
/// connections to their instances without leaving a permanent authentication
/// option.
class Ec2InstanceConnectApi {
  final _client;
  Ec2InstanceConnectApi(client)
      : _client = client.configured('EC2 Instance Connect', serializer: 'json');

  /// Pushes an SSH public key to a particular OS user on a given EC2 instance
  /// for 60 seconds.
  ///
  /// [instanceId]: The EC2 instance you wish to publish the SSH key to.
  ///
  /// [instanceOSUser]: The OS user on the EC2 instance whom the key may be used
  /// to authenticate as.
  ///
  /// [sshPublicKey]: The public key to be published to the instance. To use it
  /// after publication you must have the matching private key.
  ///
  /// [availabilityZone]: The availability zone the EC2 instance was launched
  /// in.
  Future<SendSshPublicKeyResponse> sendSshPublicKey(
      {@required String instanceId,
      @required String instanceOSUser,
      @required String sshPublicKey,
      @required String availabilityZone}) async {
    var response_ = await _client.send('SendSSHPublicKey', {
      'InstanceId': instanceId,
      'InstanceOSUser': instanceOSUser,
      'SSHPublicKey': sshPublicKey,
      'AvailabilityZone': availabilityZone,
    });
    return SendSshPublicKeyResponse.fromJson(response_);
  }
}

class SendSshPublicKeyResponse {
  /// The request ID as logged by EC2 Connect. Please provide this when
  /// contacting AWS Support.
  final String requestId;

  /// Indicates request success.
  final bool success;

  SendSshPublicKeyResponse({
    this.requestId,
    this.success,
  });
  static SendSshPublicKeyResponse fromJson(Map<String, dynamic> json) =>
      SendSshPublicKeyResponse(
        requestId:
            json.containsKey('RequestId') ? json['RequestId'] as String : null,
        success: json.containsKey('Success') ? json['Success'] as bool : null,
      );
}
