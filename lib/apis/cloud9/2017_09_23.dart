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
  ///
  /// [name]: The name of the environment to create.
  ///
  /// This name is visible to other AWS IAM users in the same AWS account.
  ///
  /// [description]: The description of the environment to create.
  ///
  /// [clientRequestToken]: A unique, case-sensitive string that helps AWS
  /// Cloud9 to ensure this operation completes no more than one time.
  ///
  /// For more information, see [Client
  /// Tokens](http://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html)
  /// in the _Amazon EC2 API Reference_.
  ///
  /// [instanceType]: The type of instance to connect to the environment (for
  /// example, `t2.micro`).
  ///
  /// [subnetId]: The ID of the subnet in Amazon VPC that AWS Cloud9 will use to
  /// communicate with the Amazon EC2 instance.
  ///
  /// [automaticStopTimeMinutes]: The number of minutes until the running
  /// instance is shut down after the environment has last been used.
  ///
  /// [ownerArn]: The Amazon Resource Name (ARN) of the environment owner. This
  /// ARN can be the ARN of any AWS IAM principal. If this value is not
  /// specified, the ARN defaults to this environment's creator.
  Future<CreateEnvironmentEc2Result> createEnvironmentEc2(
      {@required String name,
      String description,
      String clientRequestToken,
      @required String instanceType,
      String subnetId,
      int automaticStopTimeMinutes,
      String ownerArn}) async {
    return CreateEnvironmentEc2Result.fromJson({});
  }

  /// Adds an environment member to an AWS Cloud9 development environment.
  ///
  /// [environmentId]: The ID of the environment that contains the environment
  /// member you want to add.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the environment member you
  /// want to add.
  ///
  /// [permissions]: The type of environment member permissions you want to
  /// associate with this environment member. Available values include:
  ///
  /// *    `read-only`: Has read-only access to the environment.
  ///
  /// *    `read-write`: Has read-write access to the environment.
  Future<CreateEnvironmentMembershipResult> createEnvironmentMembership(
      {@required String environmentId,
      @required String userArn,
      @required String permissions}) async {
    return CreateEnvironmentMembershipResult.fromJson({});
  }

  /// Deletes an AWS Cloud9 development environment. If an Amazon EC2 instance
  /// is connected to the environment, also terminates the instance.
  ///
  /// [environmentId]: The ID of the environment to delete.
  Future<DeleteEnvironmentResult> deleteEnvironment(
      String environmentId) async {
    return DeleteEnvironmentResult.fromJson({});
  }

  /// Deletes an environment member from an AWS Cloud9 development environment.
  ///
  /// [environmentId]: The ID of the environment to delete the environment
  /// member from.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the environment member to
  /// delete from the environment.
  Future<DeleteEnvironmentMembershipResult> deleteEnvironmentMembership(
      {@required String environmentId, @required String userArn}) async {
    return DeleteEnvironmentMembershipResult.fromJson({});
  }

  /// Gets information about environment members for an AWS Cloud9 development
  /// environment.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of an individual environment
  /// member to get information about. If no value is specified, information
  /// about all environment members are returned.
  ///
  /// [environmentId]: The ID of the environment to get environment member
  /// information about.
  ///
  /// [permissions]: The type of environment member permissions to get
  /// information about. Available values include:
  ///
  /// *    `owner`: Owns the environment.
  ///
  /// *    `read-only`: Has read-only access to the environment.
  ///
  /// *    `read-write`: Has read-write access to the environment.
  ///
  ///
  /// If no value is specified, information about all environment members are
  /// returned.
  ///
  /// [nextToken]: During a previous call, if there are more than 25 items in
  /// the list, only the first 25 items are returned, along with a unique string
  /// called a _next token_. To get the next batch of items in the list, call
  /// this operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// [maxResults]: The maximum number of environment members to get information
  /// about.
  Future<DescribeEnvironmentMembershipsResult> describeEnvironmentMemberships(
      {String userArn,
      String environmentId,
      List<String> permissions,
      String nextToken,
      int maxResults}) async {
    return DescribeEnvironmentMembershipsResult.fromJson({});
  }

  /// Gets status information for an AWS Cloud9 development environment.
  ///
  /// [environmentId]: The ID of the environment to get status information
  /// about.
  Future<DescribeEnvironmentStatusResult> describeEnvironmentStatus(
      String environmentId) async {
    return DescribeEnvironmentStatusResult.fromJson({});
  }

  /// Gets information about AWS Cloud9 development environments.
  ///
  /// [environmentIds]: The IDs of individual environments to get information
  /// about.
  Future<DescribeEnvironmentsResult> describeEnvironments(
      List<String> environmentIds) async {
    return DescribeEnvironmentsResult.fromJson({});
  }

  /// Gets a list of AWS Cloud9 development environment identifiers.
  ///
  /// [nextToken]: During a previous call, if there are more than 25 items in
  /// the list, only the first 25 items are returned, along with a unique string
  /// called a _next token_. To get the next batch of items in the list, call
  /// this operation again, adding the next token to the call. To get all of the
  /// items in the list, keep calling this operation with each subsequent next
  /// token that is returned, until no more next tokens are returned.
  ///
  /// [maxResults]: The maximum number of environments to get identifiers for.
  Future<ListEnvironmentsResult> listEnvironments(
      {String nextToken, int maxResults}) async {
    return ListEnvironmentsResult.fromJson({});
  }

  /// Changes the settings of an existing AWS Cloud9 development environment.
  ///
  /// [environmentId]: The ID of the environment to change settings.
  ///
  /// [name]: A replacement name for the environment.
  ///
  /// [description]: Any new or replacement description for the environment.
  Future<UpdateEnvironmentResult> updateEnvironment(String environmentId,
      {String name, String description}) async {
    return UpdateEnvironmentResult.fromJson({});
  }

  /// Changes the settings of an existing environment member for an AWS Cloud9
  /// development environment.
  ///
  /// [environmentId]: The ID of the environment for the environment member
  /// whose settings you want to change.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the environment member whose
  /// settings you want to change.
  ///
  /// [permissions]: The replacement type of environment member permissions you
  /// want to associate with this environment member. Available values include:
  ///
  /// *    `read-only`: Has read-only access to the environment.
  ///
  /// *    `read-write`: Has read-write access to the environment.
  Future<UpdateEnvironmentMembershipResult> updateEnvironmentMembership(
      {@required String environmentId,
      @required String userArn,
      @required String permissions}) async {
    return UpdateEnvironmentMembershipResult.fromJson({});
  }
}

class CreateEnvironmentEc2Result {
  /// The ID of the environment that was created.
  final String environmentId;

  CreateEnvironmentEc2Result({
    this.environmentId,
  });
  static CreateEnvironmentEc2Result fromJson(Map<String, dynamic> json) =>
      CreateEnvironmentEc2Result();
}

class CreateEnvironmentMembershipResult {
  /// Information about the environment member that was added.
  final EnvironmentMember membership;

  CreateEnvironmentMembershipResult({
    this.membership,
  });
  static CreateEnvironmentMembershipResult fromJson(
          Map<String, dynamic> json) =>
      CreateEnvironmentMembershipResult();
}

class DeleteEnvironmentMembershipResult {
  DeleteEnvironmentMembershipResult();
  static DeleteEnvironmentMembershipResult fromJson(
          Map<String, dynamic> json) =>
      DeleteEnvironmentMembershipResult();
}

class DeleteEnvironmentResult {
  DeleteEnvironmentResult();
  static DeleteEnvironmentResult fromJson(Map<String, dynamic> json) =>
      DeleteEnvironmentResult();
}

class DescribeEnvironmentMembershipsResult {
  /// Information about the environment members for the environment.
  final List<EnvironmentMember> memberships;

  /// If there are more than 25 items in the list, only the first 25 items are
  /// returned, along with a unique string called a _next token_. To get the
  /// next batch of items in the list, call this operation again, adding the
  /// next token to the call.
  final String nextToken;

  DescribeEnvironmentMembershipsResult({
    this.memberships,
    this.nextToken,
  });
  static DescribeEnvironmentMembershipsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeEnvironmentMembershipsResult();
}

class DescribeEnvironmentStatusResult {
  /// The status of the environment. Available values include:
  ///
  /// *    `connecting`: The environment is connecting.
  ///
  /// *    `creating`: The environment is being created.
  ///
  /// *    `deleting`: The environment is being deleted.
  ///
  /// *    `error`: The environment is in an error state.
  ///
  /// *    `ready`: The environment is ready.
  ///
  /// *    `stopped`: The environment is stopped.
  ///
  /// *    `stopping`: The environment is stopping.
  final String status;

  /// Any informational message about the status of the environment.
  final String message;

  DescribeEnvironmentStatusResult({
    this.status,
    this.message,
  });
  static DescribeEnvironmentStatusResult fromJson(Map<String, dynamic> json) =>
      DescribeEnvironmentStatusResult();
}

class DescribeEnvironmentsResult {
  /// Information about the environments that are returned.
  final List<Environment> environments;

  DescribeEnvironmentsResult({
    this.environments,
  });
  static DescribeEnvironmentsResult fromJson(Map<String, dynamic> json) =>
      DescribeEnvironmentsResult();
}

class Environment {
  /// The ID of the environment.
  final String id;

  /// The name of the environment.
  final String name;

  /// The description for the environment.
  final String description;

  /// The type of environment. Valid values include the following:
  ///
  /// *    `ec2`: An Amazon Elastic Compute Cloud (Amazon EC2) instance connects
  /// to the environment.
  ///
  /// *    `ssh`: Your own server connects to the environment.
  final String type;

  /// The Amazon Resource Name (ARN) of the environment.
  final String arn;

  /// The Amazon Resource Name (ARN) of the environment owner.
  final String ownerArn;

  /// The state of the environment in its creation or deletion lifecycle.
  final EnvironmentLifecycle lifecycle;

  Environment({
    this.id,
    this.name,
    this.description,
    this.type,
    this.arn,
    this.ownerArn,
    this.lifecycle,
  });
  static Environment fromJson(Map<String, dynamic> json) => Environment();
}

class EnvironmentLifecycle {
  /// The current creation or deletion lifecycle state of the environment.
  ///
  /// *    `CREATED`: The environment was successfully created.
  ///
  /// *    `DELETE_FAILED`: The environment failed to delete.
  ///
  /// *    `DELETING`: The environment is in the process of being deleted.
  final String status;

  /// Any informational message about the lifecycle state of the environment.
  final String reason;

  /// If the environment failed to delete, the Amazon Resource Name (ARN) of the
  /// related AWS resource.
  final String failureResource;

  EnvironmentLifecycle({
    this.status,
    this.reason,
    this.failureResource,
  });
  static EnvironmentLifecycle fromJson(Map<String, dynamic> json) =>
      EnvironmentLifecycle();
}

class EnvironmentMember {
  /// The type of environment member permissions associated with this
  /// environment member. Available values include:
  ///
  /// *    `owner`: Owns the environment.
  ///
  /// *    `read-only`: Has read-only access to the environment.
  ///
  /// *    `read-write`: Has read-write access to the environment.
  final String permissions;

  /// The user ID in AWS Identity and Access Management (AWS IAM) of the
  /// environment member.
  final String userId;

  /// The Amazon Resource Name (ARN) of the environment member.
  final String userArn;

  /// The ID of the environment for the environment member.
  final String environmentId;

  /// The time, expressed in epoch time format, when the environment member last
  /// opened the environment.
  final DateTime lastAccess;

  EnvironmentMember({
    this.permissions,
    this.userId,
    this.userArn,
    this.environmentId,
    this.lastAccess,
  });
  static EnvironmentMember fromJson(Map<String, dynamic> json) =>
      EnvironmentMember();
}

class ListEnvironmentsResult {
  /// If there are more than 25 items in the list, only the first 25 items are
  /// returned, along with a unique string called a _next token_. To get the
  /// next batch of items in the list, call this operation again, adding the
  /// next token to the call.
  final String nextToken;

  /// The list of environment identifiers.
  final List<String> environmentIds;

  ListEnvironmentsResult({
    this.nextToken,
    this.environmentIds,
  });
  static ListEnvironmentsResult fromJson(Map<String, dynamic> json) =>
      ListEnvironmentsResult();
}

class UpdateEnvironmentMembershipResult {
  /// Information about the environment member whose settings were changed.
  final EnvironmentMember membership;

  UpdateEnvironmentMembershipResult({
    this.membership,
  });
  static UpdateEnvironmentMembershipResult fromJson(
          Map<String, dynamic> json) =>
      UpdateEnvironmentMembershipResult();
}

class UpdateEnvironmentResult {
  UpdateEnvironmentResult();
  static UpdateEnvironmentResult fromJson(Map<String, dynamic> json) =>
      UpdateEnvironmentResult();
}
