import 'package:meta/meta.dart';

/// Amazon Data Lifecycle Manager
///
/// With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS
/// resources. You create lifecycle policies, which are used to automate
/// operations on the specified resources.
///
/// Amazon DLM supports Amazon EBS volumes and snapshots. For information about
/// using Amazon DLM with Amazon EBS, see [Automating the Amazon EBS Snapshot
/// Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html)
/// in the _Amazon EC2 User Guide_.
class DlmApi {
  /// Creates a policy to manage the lifecycle of the specified AWS resources.
  /// You can create up to 100 lifecycle policies.
  Future<void> createLifecyclePolicy(
      {@required String executionRoleArn,
      @required String description,
      @required String state,
      @required PolicyDetails policyDetails}) async {}

  /// Deletes the specified lifecycle policy and halts the automated operations
  /// that the policy specified.
  Future<void> deleteLifecyclePolicy(String policyId) async {}

  /// Gets summary information about all or the specified data lifecycle
  /// policies.
  ///
  /// To get complete information about a policy, use GetLifecyclePolicy.
  Future<void> getLifecyclePolicies(
      {List<String> policyIds,
      String state,
      List<String> resourceTypes,
      List<String> targetTags,
      List<String> tagsToAdd}) async {}

  /// Gets detailed information about the specified lifecycle policy.
  Future<void> getLifecyclePolicy(String policyId) async {}

  /// Updates the specified lifecycle policy.
  Future<void> updateLifecyclePolicy(String policyId,
      {String executionRoleArn,
      String state,
      String description,
      PolicyDetails policyDetails}) async {}
}

class CreateLifecyclePolicyResponse {}

class CreateRule {}

class DeleteLifecyclePolicyResponse {}

class GetLifecyclePoliciesResponse {}

class GetLifecyclePolicyResponse {}

class LifecyclePolicy {}

class LifecyclePolicySummary {}

class Parameters {}

class PolicyDetails {}

class RetainRule {}

class Schedule {}

class Tag {}

class UpdateLifecyclePolicyResponse {}
