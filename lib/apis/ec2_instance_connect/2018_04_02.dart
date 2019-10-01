import 'package:meta/meta.dart';

/// AWS EC2 Connect Service is a service that enables system administrators to
/// publish temporary SSH keys to their EC2 instances in order to establish
/// connections to their instances without leaving a permanent authentication
/// option.
class Ec2InstanceConnectApi {
  /// Pushes an SSH public key to a particular OS user on a given EC2 instance
  /// for 60 seconds.
  Future<void> sendSshPublicKey(
      {@required String instanceId,
      @required String instanceOSUser,
      @required String sshPublicKey,
      @required String availabilityZone}) async {}
}

class SendSshPublicKeyResponse {}
