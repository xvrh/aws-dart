import 'package:meta/meta.dart';

/// AWS Cloud9
///
/// AWS Cloud9 is a collection of tools that you can use to code, build, run,
/// test, debug, and release software in the cloud.
///
/// For more information about AWS Cloud9, see the [AWS Cloud9 User
/// Guide](https://docs.aws.amazon.com/cloud9/latest/user-guide).
///
/// AWS Cloud9 supports these operations:
///
/// *    `CreateEnvironmentEC2`: Creates an AWS Cloud9 development environment,
/// launches an Amazon EC2 instance, and then connects from the instance to the
/// environment.
///
/// *    `CreateEnvironmentMembership`: Adds an environment member to an
/// environment.
///
/// *    `DeleteEnvironment`: Deletes an environment. If an Amazon EC2 instance
/// is connected to the environment, also terminates the instance.
///
/// *    `DeleteEnvironmentMembership`: Deletes an environment member from an
/// environment.
///
/// *    `DescribeEnvironmentMemberships`: Gets information about environment
/// members for an environment.
///
/// *    `DescribeEnvironments`: Gets information about environments.
///
/// *    `DescribeEnvironmentStatus`: Gets status information for an
/// environment.
///
/// *    `ListEnvironments`: Gets a list of environment identifiers.
///
/// *    `UpdateEnvironment`: Changes the settings of an existing environment.
///
/// *    `UpdateEnvironmentMembership`: Changes the settings of an existing
/// environment member for an environment.
class Cloud9Api {
  /// Creates an AWS Cloud9 development environment, launches an Amazon Elastic
  /// Compute Cloud (Amazon EC2) instance, and then connects from the instance
  /// to the environment.
  Future<void> createEnvironmentEc2(
      {@required String name,
      String description,
      String clientRequestToken,
      @required String instanceType,
      String subnetId,
      int automaticStopTimeMinutes,
      String ownerArn}) async {}

  /// Adds an environment member to an AWS Cloud9 development environment.
  Future<void> createEnvironmentMembership(
      {@required String environmentId,
      @required String userArn,
      @required String permissions}) async {}

  /// Deletes an AWS Cloud9 development environment. If an Amazon EC2 instance
  /// is connected to the environment, also terminates the instance.
  Future<void> deleteEnvironment(String environmentId) async {}

  /// Deletes an environment member from an AWS Cloud9 development environment.
  Future<void> deleteEnvironmentMembership(
      {@required String environmentId, @required String userArn}) async {}

  /// Gets information about environment members for an AWS Cloud9 development
  /// environment.
  Future<void> describeEnvironmentMemberships(
      {String userArn,
      String environmentId,
      List<String> permissions,
      String nextToken,
      int maxResults}) async {}

  /// Gets status information for an AWS Cloud9 development environment.
  Future<void> describeEnvironmentStatus(String environmentId) async {}

  /// Gets information about AWS Cloud9 development environments.
  Future<void> describeEnvironments(List<String> environmentIds) async {}

  /// Gets a list of AWS Cloud9 development environment identifiers.
  Future<void> listEnvironments({String nextToken, int maxResults}) async {}

  /// Changes the settings of an existing AWS Cloud9 development environment.
  Future<void> updateEnvironment(String environmentId,
      {String name, String description}) async {}

  /// Changes the settings of an existing environment member for an AWS Cloud9
  /// development environment.
  Future<void> updateEnvironmentMembership(
      {@required String environmentId,
      @required String userArn,
      @required String permissions}) async {}
}

class CreateEnvironmentEc2Result {}

class CreateEnvironmentMembershipResult {}

class DeleteEnvironmentMembershipResult {}

class DeleteEnvironmentResult {}

class DescribeEnvironmentMembershipsResult {}

class DescribeEnvironmentStatusResult {}

class DescribeEnvironmentsResult {}

class Environment {}

class EnvironmentLifecycle {}

class EnvironmentMember {}

class ListEnvironmentsResult {}

class UpdateEnvironmentMembershipResult {}

class UpdateEnvironmentResult {}
