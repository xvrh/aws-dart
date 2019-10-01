import 'package:meta/meta.dart';

/// Amazon Inspector
///
/// Amazon Inspector enables you to analyze the behavior of your AWS resources
/// and to identify potential security issues. For more information, see
/// [Amazon Inspector User
/// Guide](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_introduction.html).
class InspectorApi {
  /// Assigns attributes (key and value pairs) to the findings that are
  /// specified by the ARNs of the findings.
  Future<void> addAttributesToFindings(
      {@required List<String> findingArns,
      @required List<Attribute> attributes}) async {}

  /// Creates a new assessment target using the ARN of the resource group that
  /// is generated by CreateResourceGroup. If resourceGroupArn is not specified,
  /// all EC2 instances in the current AWS account and region are included in
  /// the assessment target. If the [service-linked
  /// role](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html)
  /// isn’t already registered, this action also creates and registers a
  /// service-linked role to grant Amazon Inspector access to AWS Services
  /// needed to perform security assessments. You can create up to 50 assessment
  /// targets per AWS account. You can run up to 500 concurrent agents per AWS
  /// account. For more information, see  [Amazon Inspector Assessment
  /// Targets](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html).
  Future<void> createAssessmentTarget(String assessmentTargetName,
      {String resourceGroupArn}) async {}

  /// Creates an assessment template for the assessment target that is specified
  /// by the ARN of the assessment target. If the [service-linked
  /// role](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html)
  /// isn’t already registered, this action also creates and registers a
  /// service-linked role to grant Amazon Inspector access to AWS Services
  /// needed to perform security assessments.
  Future<void> createAssessmentTemplate(
      {@required String assessmentTargetArn,
      @required String assessmentTemplateName,
      @required int durationInSeconds,
      @required List<String> rulesPackageArns,
      List<Attribute> userAttributesForFindings}) async {}

  /// Starts the generation of an exclusions preview for the specified
  /// assessment template. The exclusions preview lists the potential exclusions
  /// (ExclusionPreview) that Inspector can detect before it runs the
  /// assessment.
  Future<void> createExclusionsPreview(String assessmentTemplateArn) async {}

  /// Creates a resource group using the specified set of tags (key and value
  /// pairs) that are used to select the EC2 instances to be included in an
  /// Amazon Inspector assessment target. The created resource group is then
  /// used to create an Amazon Inspector assessment target. For more
  /// information, see CreateAssessmentTarget.
  Future<void> createResourceGroup(
      List<ResourceGroupTag> resourceGroupTags) async {}

  /// Deletes the assessment run that is specified by the ARN of the assessment
  /// run.
  Future<void> deleteAssessmentRun(String assessmentRunArn) async {}

  /// Deletes the assessment target that is specified by the ARN of the
  /// assessment target.
  Future<void> deleteAssessmentTarget(String assessmentTargetArn) async {}

  /// Deletes the assessment template that is specified by the ARN of the
  /// assessment template.
  Future<void> deleteAssessmentTemplate(String assessmentTemplateArn) async {}

  /// Describes the assessment runs that are specified by the ARNs of the
  /// assessment runs.
  Future<void> describeAssessmentRuns(List<String> assessmentRunArns) async {}

  /// Describes the assessment targets that are specified by the ARNs of the
  /// assessment targets.
  Future<void> describeAssessmentTargets(
      List<String> assessmentTargetArns) async {}

  /// Describes the assessment templates that are specified by the ARNs of the
  /// assessment templates.
  Future<void> describeAssessmentTemplates(
      List<String> assessmentTemplateArns) async {}

  /// Describes the IAM role that enables Amazon Inspector to access your AWS
  /// account.
  Future<void> describeCrossAccountAccessRole() async {}

  /// Describes the exclusions that are specified by the exclusions' ARNs.
  Future<void> describeExclusions(List<String> exclusionArns,
      {String locale}) async {}

  /// Describes the findings that are specified by the ARNs of the findings.
  Future<void> describeFindings(List<String> findingArns,
      {String locale}) async {}

  /// Describes the resource groups that are specified by the ARNs of the
  /// resource groups.
  Future<void> describeResourceGroups(List<String> resourceGroupArns) async {}

  /// Describes the rules packages that are specified by the ARNs of the rules
  /// packages.
  Future<void> describeRulesPackages(List<String> rulesPackageArns,
      {String locale}) async {}

  /// Produces an assessment report that includes detailed and comprehensive
  /// results of a specified assessment run.
  Future<void> getAssessmentReport(
      {@required String assessmentRunArn,
      @required String reportFileFormat,
      @required String reportType}) async {}

  /// Retrieves the exclusions preview (a list of ExclusionPreview objects)
  /// specified by the preview token. You can obtain the preview token by
  /// running the CreateExclusionsPreview API.
  Future<void> getExclusionsPreview(
      {@required String assessmentTemplateArn,
      @required String previewToken,
      String nextToken,
      int maxResults,
      String locale}) async {}

  /// Information about the data that is collected for the specified assessment
  /// run.
  Future<void> getTelemetryMetadata(String assessmentRunArn) async {}

  /// Lists the agents of the assessment runs that are specified by the ARNs of
  /// the assessment runs.
  Future<void> listAssessmentRunAgents(String assessmentRunArn,
      {AgentFilter filter, String nextToken, int maxResults}) async {}

  /// Lists the assessment runs that correspond to the assessment templates that
  /// are specified by the ARNs of the assessment templates.
  Future<void> listAssessmentRuns(
      {List<String> assessmentTemplateArns,
      AssessmentRunFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Lists the ARNs of the assessment targets within this AWS account. For more
  /// information about assessment targets, see [Amazon Inspector Assessment
  /// Targets](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html).
  Future<void> listAssessmentTargets(
      {AssessmentTargetFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Lists the assessment templates that correspond to the assessment targets
  /// that are specified by the ARNs of the assessment targets.
  Future<void> listAssessmentTemplates(
      {List<String> assessmentTargetArns,
      AssessmentTemplateFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Lists all the event subscriptions for the assessment template that is
  /// specified by the ARN of the assessment template. For more information, see
  /// SubscribeToEvent and UnsubscribeFromEvent.
  Future<void> listEventSubscriptions(
      {String resourceArn, String nextToken, int maxResults}) async {}

  /// List exclusions that are generated by the assessment run.
  Future<void> listExclusions(String assessmentRunArn,
      {String nextToken, int maxResults}) async {}

  /// Lists findings that are generated by the assessment runs that are
  /// specified by the ARNs of the assessment runs.
  Future<void> listFindings(
      {List<String> assessmentRunArns,
      FindingFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Lists all available Amazon Inspector rules packages.
  Future<void> listRulesPackages({String nextToken, int maxResults}) async {}

  /// Lists all tags associated with an assessment template.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Previews the agents installed on the EC2 instances that are part of the
  /// specified assessment target.
  Future<void> previewAgents(String previewAgentsArn,
      {String nextToken, int maxResults}) async {}

  /// Registers the IAM role that grants Amazon Inspector access to AWS Services
  /// needed to perform security assessments.
  Future<void> registerCrossAccountAccessRole(String roleArn) async {}

  /// Removes entire attributes (key and value pairs) from the findings that are
  /// specified by the ARNs of the findings where an attribute with the
  /// specified key exists.
  Future<void> removeAttributesFromFindings(
      {@required List<String> findingArns,
      @required List<String> attributeKeys}) async {}

  /// Sets tags (key and value pairs) to the assessment template that is
  /// specified by the ARN of the assessment template.
  Future<void> setTagsForResource(String resourceArn, {List<Tag> tags}) async {}

  /// Starts the assessment run specified by the ARN of the assessment template.
  /// For this API to function properly, you must not exceed the limit of
  /// running up to 500 concurrent agents per AWS account.
  Future<void> startAssessmentRun(String assessmentTemplateArn,
      {String assessmentRunName}) async {}

  /// Stops the assessment run that is specified by the ARN of the assessment
  /// run.
  Future<void> stopAssessmentRun(String assessmentRunArn,
      {String stopAction}) async {}

  /// Enables the process of sending Amazon Simple Notification Service (SNS)
  /// notifications about a specified event to a specified SNS topic.
  Future<void> subscribeToEvent(
      {@required String resourceArn,
      @required String event,
      @required String topicArn}) async {}

  /// Disables the process of sending Amazon Simple Notification Service (SNS)
  /// notifications about a specified event to a specified SNS topic.
  Future<void> unsubscribeFromEvent(
      {@required String resourceArn,
      @required String event,
      @required String topicArn}) async {}

  /// Updates the assessment target that is specified by the ARN of the
  /// assessment target.
  ///
  /// If resourceGroupArn is not specified, all EC2 instances in the current AWS
  /// account and region are included in the assessment target.
  Future<void> updateAssessmentTarget(
      {@required String assessmentTargetArn,
      @required String assessmentTargetName,
      String resourceGroupArn}) async {}
}

class AddAttributesToFindingsResponse {}

class AgentFilter {}

class AgentPreview {}

class AssessmentRun {}

class AssessmentRunAgent {}

class AssessmentRunFilter {}

class AssessmentRunNotification {}

class AssessmentRunStateChange {}

class AssessmentTarget {}

class AssessmentTargetFilter {}

class AssessmentTemplate {}

class AssessmentTemplateFilter {}

class AssetAttributes {}

class Attribute {}

class CreateAssessmentTargetResponse {}

class CreateAssessmentTemplateResponse {}

class CreateExclusionsPreviewResponse {}

class CreateResourceGroupResponse {}

class DescribeAssessmentRunsResponse {}

class DescribeAssessmentTargetsResponse {}

class DescribeAssessmentTemplatesResponse {}

class DescribeCrossAccountAccessRoleResponse {}

class DescribeExclusionsResponse {}

class DescribeFindingsResponse {}

class DescribeResourceGroupsResponse {}

class DescribeRulesPackagesResponse {}

class DurationRange {}

class EventSubscription {}

class Exclusion {}

class ExclusionPreview {}

class FailedItemDetails {}

class Finding {}

class FindingFilter {}

class GetAssessmentReportResponse {}

class GetExclusionsPreviewResponse {}

class GetTelemetryMetadataResponse {}

class InspectorServiceAttributes {}

class ListAssessmentRunAgentsResponse {}

class ListAssessmentRunsResponse {}

class ListAssessmentTargetsResponse {}

class ListAssessmentTemplatesResponse {}

class ListEventSubscriptionsResponse {}

class ListExclusionsResponse {}

class ListFindingsResponse {}

class ListRulesPackagesResponse {}

class ListTagsForResourceResponse {}

class NetworkInterface {}

class PreviewAgentsResponse {}

class PrivateIp {}

class RemoveAttributesFromFindingsResponse {}

class ResourceGroup {}

class ResourceGroupTag {}

class RulesPackage {}

class Scope {}

class SecurityGroup {}

class StartAssessmentRunResponse {}

class Subscription {}

class Tag {}

class TelemetryMetadata {}

class TimestampRange {}