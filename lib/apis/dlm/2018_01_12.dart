import 'package:meta/meta.dart';

/// Amazon Data Lifecycle Manager
///
/// With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS
/// resources. You create lifecycle policies, which are used to automate
/// operations on the specified resources.
///
/// Amazon DLM supports Amazon EBS volumes and snapshots. For information about
/// using Amazon DLM with Amazon EBS, see
/// [Automating the Amazon EBS Snapshot Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html)
/// in the _Amazon EC2 User Guide_.
class DlmApi {
  final _client;
  DlmApi(client) : _client = client.configured('DLM', serializer: 'rest-json');

  /// Creates a policy to manage the lifecycle of the specified AWS resources.
  /// You can create up to 100 lifecycle policies.
  ///
  /// [executionRoleArn]: The Amazon Resource Name (ARN) of the IAM role used to
  /// run the operations specified by the lifecycle policy.
  ///
  /// [description]: A description of the lifecycle policy. The characters
  /// ^[0-9A-Za-z _-]+$ are supported.
  ///
  /// [state]: The desired activation state of the lifecycle policy after
  /// creation.
  ///
  /// [policyDetails]: The configuration details of the lifecycle policy.
  ///
  /// Target tags cannot be re-used across lifecycle policies.
  Future<CreateLifecyclePolicyResponse> createLifecyclePolicy(
      {@required String executionRoleArn,
      @required String description,
      @required String state,
      @required PolicyDetails policyDetails}) async {
    var response_ = await _client.send('CreateLifecyclePolicy', {
      'ExecutionRoleArn': executionRoleArn,
      'Description': description,
      'State': state,
      'PolicyDetails': policyDetails,
    });
    return CreateLifecyclePolicyResponse.fromJson(response_);
  }

  /// Deletes the specified lifecycle policy and halts the automated operations
  /// that the policy specified.
  ///
  /// [policyId]: The identifier of the lifecycle policy.
  Future<DeleteLifecyclePolicyResponse> deleteLifecyclePolicy(
      String policyId) async {
    var response_ = await _client.send('DeleteLifecyclePolicy', {
      'PolicyId': policyId,
    });
    return DeleteLifecyclePolicyResponse.fromJson(response_);
  }

  /// Gets summary information about all or the specified data lifecycle
  /// policies.
  ///
  /// To get complete information about a policy, use GetLifecyclePolicy.
  ///
  /// [policyIds]: The identifiers of the data lifecycle policies.
  ///
  /// [state]: The activation state.
  ///
  /// [resourceTypes]: The resource type.
  ///
  /// [targetTags]: The target tag for a policy.
  ///
  /// Tags are strings in the format `key=value`.
  ///
  /// [tagsToAdd]: The tags to add to objects created by the policy.
  ///
  /// Tags are strings in the format `key=value`.
  ///
  /// These user-defined tags are added in addition to the AWS-added lifecycle
  /// tags.
  Future<GetLifecyclePoliciesResponse> getLifecyclePolicies(
      {List<String> policyIds,
      String state,
      List<String> resourceTypes,
      List<String> targetTags,
      List<String> tagsToAdd}) async {
    var response_ = await _client.send('GetLifecyclePolicies', {
      if (policyIds != null) 'PolicyIds': policyIds,
      if (state != null) 'State': state,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (targetTags != null) 'TargetTags': targetTags,
      if (tagsToAdd != null) 'TagsToAdd': tagsToAdd,
    });
    return GetLifecyclePoliciesResponse.fromJson(response_);
  }

  /// Gets detailed information about the specified lifecycle policy.
  ///
  /// [policyId]: The identifier of the lifecycle policy.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy(String policyId) async {
    var response_ = await _client.send('GetLifecyclePolicy', {
      'PolicyId': policyId,
    });
    return GetLifecyclePolicyResponse.fromJson(response_);
  }

  /// Updates the specified lifecycle policy.
  ///
  /// [policyId]: The identifier of the lifecycle policy.
  ///
  /// [executionRoleArn]: The Amazon Resource Name (ARN) of the IAM role used to
  /// run the operations specified by the lifecycle policy.
  ///
  /// [state]: The desired activation state of the lifecycle policy after
  /// creation.
  ///
  /// [description]: A description of the lifecycle policy.
  ///
  /// [policyDetails]: The configuration of the lifecycle policy.
  ///
  /// Target tags cannot be re-used across policies.
  Future<UpdateLifecyclePolicyResponse> updateLifecyclePolicy(String policyId,
      {String executionRoleArn,
      String state,
      String description,
      PolicyDetails policyDetails}) async {
    var response_ = await _client.send('UpdateLifecyclePolicy', {
      'PolicyId': policyId,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (state != null) 'State': state,
      if (description != null) 'Description': description,
      if (policyDetails != null) 'PolicyDetails': policyDetails,
    });
    return UpdateLifecyclePolicyResponse.fromJson(response_);
  }
}

class CreateLifecyclePolicyResponse {
  /// The identifier of the lifecycle policy.
  final String policyId;

  CreateLifecyclePolicyResponse({
    this.policyId,
  });
  static CreateLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      CreateLifecyclePolicyResponse(
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
      );
}

/// Specifies when to create snapshots of EBS volumes.
class CreateRule {
  /// The interval between snapshots. The supported values are 2, 3, 4, 6, 8,
  /// 12, and 24.
  final int interval;

  /// The interval unit.
  final String intervalUnit;

  /// The time, in UTC, to start the operation. The supported format is hh:mm.
  ///
  /// The operation occurs within a one-hour window following the specified
  /// time.
  final List<String> times;

  CreateRule({
    @required this.interval,
    @required this.intervalUnit,
    this.times,
  });
  static CreateRule fromJson(Map<String, dynamic> json) => CreateRule(
        interval: json['Interval'] as int,
        intervalUnit: json['IntervalUnit'] as String,
        times: json.containsKey('Times')
            ? (json['Times'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteLifecyclePolicyResponse {
  DeleteLifecyclePolicyResponse();
  static DeleteLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteLifecyclePolicyResponse();
}

class GetLifecyclePoliciesResponse {
  /// Summary information about the lifecycle policies.
  final List<LifecyclePolicySummary> policies;

  GetLifecyclePoliciesResponse({
    this.policies,
  });
  static GetLifecyclePoliciesResponse fromJson(Map<String, dynamic> json) =>
      GetLifecyclePoliciesResponse(
        policies: json.containsKey('Policies')
            ? (json['Policies'] as List)
                .map((e) => LifecyclePolicySummary.fromJson(e))
                .toList()
            : null,
      );
}

class GetLifecyclePolicyResponse {
  /// Detailed information about the lifecycle policy.
  final LifecyclePolicy policy;

  GetLifecyclePolicyResponse({
    this.policy,
  });
  static GetLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetLifecyclePolicyResponse(
        policy: json.containsKey('Policy')
            ? LifecyclePolicy.fromJson(json['Policy'])
            : null,
      );
}

/// Detailed information about a lifecycle policy.
class LifecyclePolicy {
  /// The identifier of the lifecycle policy.
  final String policyId;

  /// The description of the lifecycle policy.
  final String description;

  /// The activation state of the lifecycle policy.
  final String state;

  /// The Amazon Resource Name (ARN) of the IAM role used to run the operations
  /// specified by the lifecycle policy.
  final String executionRoleArn;

  /// The local date and time when the lifecycle policy was created.
  final DateTime dateCreated;

  /// The local date and time when the lifecycle policy was last modified.
  final DateTime dateModified;

  /// The configuration of the lifecycle policy
  final PolicyDetails policyDetails;

  LifecyclePolicy({
    this.policyId,
    this.description,
    this.state,
    this.executionRoleArn,
    this.dateCreated,
    this.dateModified,
    this.policyDetails,
  });
  static LifecyclePolicy fromJson(Map<String, dynamic> json) => LifecyclePolicy(
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        executionRoleArn: json.containsKey('ExecutionRoleArn')
            ? json['ExecutionRoleArn'] as String
            : null,
        dateCreated: json.containsKey('DateCreated')
            ? DateTime.parse(json['DateCreated'])
            : null,
        dateModified: json.containsKey('DateModified')
            ? DateTime.parse(json['DateModified'])
            : null,
        policyDetails: json.containsKey('PolicyDetails')
            ? PolicyDetails.fromJson(json['PolicyDetails'])
            : null,
      );
}

/// Summary information about a lifecycle policy.
class LifecyclePolicySummary {
  /// The identifier of the lifecycle policy.
  final String policyId;

  /// The description of the lifecycle policy.
  final String description;

  /// The activation state of the lifecycle policy.
  final String state;

  LifecyclePolicySummary({
    this.policyId,
    this.description,
    this.state,
  });
  static LifecyclePolicySummary fromJson(Map<String, dynamic> json) =>
      LifecyclePolicySummary(
        policyId:
            json.containsKey('PolicyId') ? json['PolicyId'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
}

/// Optional parameters that can be added to the policy. The set of valid
/// parameters depends on the combination of `policyType` and `resourceType`
/// values.
class Parameters {
  /// When executing an EBS Snapshot Management – Instance policy, execute all
  /// CreateSnapshots calls with the `excludeBootVolume` set to the supplied
  /// field. Defaults to false. Only valid for EBS Snapshot Management –
  /// Instance policies.
  final bool excludeBootVolume;

  Parameters({
    this.excludeBootVolume,
  });
  static Parameters fromJson(Map<String, dynamic> json) => Parameters(
        excludeBootVolume: json.containsKey('ExcludeBootVolume')
            ? json['ExcludeBootVolume'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the configuration of a lifecycle policy.
class PolicyDetails {
  /// This field determines the valid target resource types and actions a policy
  /// can manage. This field defaults to EBS_SNAPSHOT_MANAGEMENT if not present.
  final String policyType;

  /// The resource type.
  final List<String> resourceTypes;

  /// The single tag that identifies targeted resources for this policy.
  final List<Tag> targetTags;

  /// The schedule of policy-defined actions.
  final List<Schedule> schedules;

  /// A set of optional parameters that can be provided by the policy.
  final Parameters parameters;

  PolicyDetails({
    this.policyType,
    this.resourceTypes,
    this.targetTags,
    this.schedules,
    this.parameters,
  });
  static PolicyDetails fromJson(Map<String, dynamic> json) => PolicyDetails(
        policyType: json.containsKey('PolicyType')
            ? json['PolicyType'] as String
            : null,
        resourceTypes: json.containsKey('ResourceTypes')
            ? (json['ResourceTypes'] as List).map((e) => e as String).toList()
            : null,
        targetTags: json.containsKey('TargetTags')
            ? (json['TargetTags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        schedules: json.containsKey('Schedules')
            ? (json['Schedules'] as List)
                .map((e) => Schedule.fromJson(e))
                .toList()
            : null,
        parameters: json.containsKey('Parameters')
            ? Parameters.fromJson(json['Parameters'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the number of snapshots to keep for each EBS volume.
class RetainRule {
  /// The number of snapshots to keep for each volume, up to a maximum of 1000.
  final int count;

  RetainRule({
    @required this.count,
  });
  static RetainRule fromJson(Map<String, dynamic> json) => RetainRule(
        count: json['Count'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a schedule.
class Schedule {
  /// The name of the schedule.
  final String name;

  /// Copy all user-defined tags on a source volume to snapshots of the volume
  /// created by this policy.
  final bool copyTags;

  /// The tags to apply to policy-created resources. These user-defined tags are
  /// in addition to the AWS-added lifecycle tags.
  final List<Tag> tagsToAdd;

  /// A collection of key/value pairs with values determined dynamically when
  /// the policy is executed. Keys may be any valid Amazon EC2 tag key. Values
  /// must be in one of the two following formats: `$(instance-id)` or
  /// `$(timestamp)`. Variable tags are only valid for EBS Snapshot Management –
  /// Instance policies.
  final List<Tag> variableTags;

  /// The create rule.
  final CreateRule createRule;

  /// The retain rule.
  final RetainRule retainRule;

  Schedule({
    this.name,
    this.copyTags,
    this.tagsToAdd,
    this.variableTags,
    this.createRule,
    this.retainRule,
  });
  static Schedule fromJson(Map<String, dynamic> json) => Schedule(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        copyTags:
            json.containsKey('CopyTags') ? json['CopyTags'] as bool : null,
        tagsToAdd: json.containsKey('TagsToAdd')
            ? (json['TagsToAdd'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        variableTags: json.containsKey('VariableTags')
            ? (json['VariableTags'] as List)
                .map((e) => Tag.fromJson(e))
                .toList()
            : null,
        createRule: json.containsKey('CreateRule')
            ? CreateRule.fromJson(json['CreateRule'])
            : null,
        retainRule: json.containsKey('RetainRule')
            ? RetainRule.fromJson(json['RetainRule'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a tag for a resource.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateLifecyclePolicyResponse {
  UpdateLifecyclePolicyResponse();
  static UpdateLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      UpdateLifecyclePolicyResponse();
}
