import 'package:meta/meta.dart';

/// AWS CodePipeline
///
///  **Overview**
///
/// This is the AWS CodePipeline API Reference. This guide provides descriptions
/// of the actions and data types for AWS CodePipeline. Some functionality for
/// your pipeline is only configurable through the API. For additional
/// information, see the [AWS CodePipeline User
/// Guide](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html).
///
/// You can use the AWS CodePipeline API to work with pipelines, stages,
/// actions, and transitions, as described below.
///
///  _Pipelines_ are models of automated release processes. Each pipeline is
/// uniquely named, and consists of stages, actions, and transitions.
///
/// You can work with pipelines by calling:
///
/// *    CreatePipeline, which creates a uniquely-named pipeline.
///
/// *    DeletePipeline, which deletes the specified pipeline.
///
/// *    GetPipeline, which returns information about the pipeline structure and
/// pipeline metadata, including the pipeline Amazon Resource Name (ARN).
///
/// *    GetPipelineExecution, which returns information about a specific
/// execution of a pipeline.
///
/// *    GetPipelineState, which returns information about the current state of
/// the stages and actions of a pipeline.
///
/// *    ListActionExecutions, which returns action-level details for past
/// executions. The details include full stage and action-level details,
/// including individual action duration, status, any errors which occurred
/// during the execution, and input and output artifact location details.
///
/// *    ListPipelines, which gets a summary of all of the pipelines associated
/// with your account.
///
/// *    ListPipelineExecutions, which gets a summary of the most recent
/// executions for a pipeline.
///
/// *    StartPipelineExecution, which runs the the most recent revision of an
/// artifact through the pipeline.
///
/// *    UpdatePipeline, which updates a pipeline with edits or changes to the
/// structure of the pipeline.
///
///
/// Pipelines include _stages_. Each stage contains one or more actions that
/// must complete before the next stage begins. A stage will result in success
/// or failure. If a stage fails, then the pipeline stops at that stage and will
/// remain stopped until either a new version of an artifact appears in the
/// source location, or a user takes action to re-run the most recent artifact
/// through the pipeline. You can call GetPipelineState, which displays the
/// status of a pipeline, including the status of stages in the pipeline, or
/// GetPipeline, which returns the entire structure of the pipeline, including
/// the stages of that pipeline. For more information about the structure of
/// stages and actions, also refer to the [AWS CodePipeline Pipeline Structure
/// Reference](https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-structure.html).
///
/// Pipeline stages include _actions_, which are categorized into categories
/// such as source or build actions performed within a stage of a pipeline. For
/// example, you can use a source action to import artifacts into a pipeline
/// from a source such as Amazon S3. Like stages, you do not work with actions
/// directly in most cases, but you do define and interact with actions when
/// working with pipeline operations such as CreatePipeline and
/// GetPipelineState. Valid action categories are:
///
/// *   Source
///
/// *   Build
///
/// *   Test
///
/// *   Deploy
///
/// *   Approval
///
/// *   Invoke
///
///
/// Pipelines also include _transitions_, which allow the transition of
/// artifacts from one stage to the next in a pipeline after the actions in one
/// stage complete.
///
/// You can work with transitions by calling:
///
/// *    DisableStageTransition, which prevents artifacts from transitioning to
/// the next stage in a pipeline.
///
/// *    EnableStageTransition, which enables transition of artifacts between
/// stages in a pipeline.
///
///
///  **Using the API to integrate with AWS CodePipeline**
///
/// For third-party integrators or developers who want to create their own
/// integrations with AWS CodePipeline, the expected sequence varies from the
/// standard API user. In order to integrate with AWS CodePipeline, developers
/// will need to work with the following items:
///
///  **Jobs**, which are instances of an action. For example, a job for a source
/// action might import a revision of an artifact from a source.
///
/// You can work with jobs by calling:
///
/// *    AcknowledgeJob, which confirms whether a job worker has received the
/// specified job,
///
/// *    GetJobDetails, which returns the details of a job,
///
/// *    PollForJobs, which determines whether there are any jobs to act upon,
///
/// *    PutJobFailureResult, which provides details of a job failure, and
///
/// *    PutJobSuccessResult, which provides details of a job success.
///
///
///  **Third party jobs**, which are instances of an action created by a partner
/// action and integrated into AWS CodePipeline. Partner actions are created by
/// members of the AWS Partner Network.
///
/// You can work with third party jobs by calling:
///
/// *    AcknowledgeThirdPartyJob, which confirms whether a job worker has
/// received the specified job,
///
/// *    GetThirdPartyJobDetails, which requests the details of a job for a
/// partner action,
///
/// *    PollForThirdPartyJobs, which determines whether there are any jobs to
/// act upon,
///
/// *    PutThirdPartyJobFailureResult, which provides details of a job failure,
/// and
///
/// *    PutThirdPartyJobSuccessResult, which provides details of a job success.
class CodePipelineApi {
  /// Returns information about a specified job and whether that job has been
  /// received by the job worker. Only used for custom actions.
  Future<void> acknowledgeJob(
      {@required String jobId, @required String nonce}) async {}

  /// Confirms a job worker has received the specified job. Only used for
  /// partner actions.
  Future<void> acknowledgeThirdPartyJob(
      {@required String jobId,
      @required String nonce,
      @required String clientToken}) async {}

  /// Creates a new custom action that can be used in all pipelines associated
  /// with the AWS account. Only used for custom actions.
  Future<void> createCustomActionType(
      {@required String category,
      @required String provider,
      @required String version,
      ActionTypeSettings settings,
      List<ActionConfigurationProperty> configurationProperties,
      @required ArtifactDetails inputArtifactDetails,
      @required ArtifactDetails outputArtifactDetails,
      List<Tag> tags}) async {}

  /// Creates a pipeline.
  ///
  ///
  ///
  /// In the pipeline structure, you must include either `artifactStore` or
  /// `artifactStores` in your pipeline, but you cannot use both. If you create
  /// a cross-region action in your pipeline, you must use `artifactStores`.
  Future<void> createPipeline(PipelineDeclaration pipeline,
      {List<Tag> tags}) async {}

  /// Marks a custom action as deleted. `PollForJobs` for the custom action will
  /// fail after the action is marked for deletion. Only used for custom
  /// actions.
  ///
  ///
  ///
  /// To re-create a custom action after it has been deleted you must use a
  /// string in the version field that has never been used before. This string
  /// can be an incremented version number, for example. To restore a deleted
  /// custom action, use a JSON file that is identical to the deleted action,
  /// including the original string in the version field.
  Future<void> deleteCustomActionType(
      {@required String category,
      @required String provider,
      @required String version}) async {}

  /// Deletes the specified pipeline.
  Future<void> deletePipeline(String name) async {}

  /// Deletes a previously created webhook by name. Deleting the webhook stops
  /// AWS CodePipeline from starting a pipeline every time an external event
  /// occurs. The API will return successfully when trying to delete a webhook
  /// that is already deleted. If a deleted webhook is re-created by calling
  /// PutWebhook with the same name, it will have a different URL.
  Future<void> deleteWebhook(String name) async {}

  /// Removes the connection between the webhook that was created by
  /// CodePipeline and the external tool with events to be detected. Currently
  /// only supported for webhooks that target an action type of GitHub.
  Future<void> deregisterWebhookWithThirdParty({String webhookName}) async {}

  /// Prevents artifacts in a pipeline from transitioning to the next stage in
  /// the pipeline.
  Future<void> disableStageTransition(
      {@required String pipelineName,
      @required String stageName,
      @required String transitionType,
      @required String reason}) async {}

  /// Enables artifacts in a pipeline to transition to a stage in a pipeline.
  Future<void> enableStageTransition(
      {@required String pipelineName,
      @required String stageName,
      @required String transitionType}) async {}

  /// Returns information about a job. Only used for custom actions.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts. Additionally, this API returns any secret values defined for
  /// the action.
  Future<void> getJobDetails(String jobId) async {}

  /// Returns the metadata, structure, stages, and actions of a pipeline. Can be
  /// used to return the entire structure of a pipeline in JSON format, which
  /// can then be modified and used to update the pipeline structure with
  /// UpdatePipeline.
  Future<void> getPipeline(String name, {int version}) async {}

  /// Returns information about an execution of a pipeline, including details
  /// about artifacts, the pipeline execution ID, and the name, version, and
  /// status of the pipeline.
  Future<void> getPipelineExecution(
      {@required String pipelineName,
      @required String pipelineExecutionId}) async {}

  /// Returns information about the state of a pipeline, including the stages
  /// and actions.
  ///
  ///
  ///
  /// Values returned in the `revisionId` and `revisionUrl` fields indicate the
  /// source revision information, such as the commit ID, for the current state.
  Future<void> getPipelineState(String name) async {}

  /// Requests the details of a job for a third party action. Only used for
  /// partner actions.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts. Additionally, this API returns any secret values defined for
  /// the action.
  Future<void> getThirdPartyJobDetails(
      {@required String jobId, @required String clientToken}) async {}

  /// Lists the action executions that have occurred in a pipeline.
  Future<void> listActionExecutions(String pipelineName,
      {ActionExecutionFilter filter, int maxResults, String nextToken}) async {}

  /// Gets a summary of all AWS CodePipeline action types associated with your
  /// account.
  Future<void> listActionTypes(
      {String actionOwnerFilter, String nextToken}) async {}

  /// Gets a summary of the most recent executions for a pipeline.
  Future<void> listPipelineExecutions(String pipelineName,
      {int maxResults, String nextToken}) async {}

  /// Gets a summary of all of the pipelines associated with your account.
  Future<void> listPipelines({String nextToken}) async {}

  /// Gets the set of key/value pairs (metadata) that are used to manage the
  /// resource.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Gets a listing of all the webhooks in this region for this account. The
  /// output lists all webhooks and includes the webhook URL and ARN, as well
  /// the configuration for each webhook.
  Future<void> listWebhooks({String nextToken, int maxResults}) async {}

  /// Returns information about any jobs for AWS CodePipeline to act upon.
  /// `PollForJobs` is only valid for action types with "Custom" in the owner
  /// field. If the action type contains "AWS" or "ThirdParty" in the owner
  /// field, the `PollForJobs` action returns an error.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts. Additionally, this API returns any secret values defined for
  /// the action.
  Future<void> pollForJobs(ActionTypeId actionTypeId,
      {int maxBatchSize, Map<String, String> queryParam}) async {}

  /// Determines whether there are any third party jobs for a job worker to act
  /// on. Only used for partner actions.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts.
  Future<void> pollForThirdPartyJobs(ActionTypeId actionTypeId,
      {int maxBatchSize}) async {}

  /// Provides information to AWS CodePipeline about new revisions to a source.
  Future<void> putActionRevision(
      {@required String pipelineName,
      @required String stageName,
      @required String actionName,
      @required ActionRevision actionRevision}) async {}

  /// Provides the response to a manual approval request to AWS CodePipeline.
  /// Valid responses include Approved and Rejected.
  Future<void> putApprovalResult(
      {@required String pipelineName,
      @required String stageName,
      @required String actionName,
      @required ApprovalResult result,
      @required String token}) async {}

  /// Represents the failure of a job as returned to the pipeline by a job
  /// worker. Only used for custom actions.
  Future<void> putJobFailureResult(
      {@required String jobId,
      @required FailureDetails failureDetails}) async {}

  /// Represents the success of a job as returned to the pipeline by a job
  /// worker. Only used for custom actions.
  Future<void> putJobSuccessResult(String jobId,
      {CurrentRevision currentRevision,
      String continuationToken,
      ExecutionDetails executionDetails}) async {}

  /// Represents the failure of a third party job as returned to the pipeline by
  /// a job worker. Only used for partner actions.
  Future<void> putThirdPartyJobFailureResult(
      {@required String jobId,
      @required String clientToken,
      @required FailureDetails failureDetails}) async {}

  /// Represents the success of a third party job as returned to the pipeline by
  /// a job worker. Only used for partner actions.
  Future<void> putThirdPartyJobSuccessResult(
      {@required String jobId,
      @required String clientToken,
      CurrentRevision currentRevision,
      String continuationToken,
      ExecutionDetails executionDetails}) async {}

  /// Defines a webhook and returns a unique webhook URL generated by
  /// CodePipeline. This URL can be supplied to third party source hosting
  /// providers to call every time there's a code change. When CodePipeline
  /// receives a POST request on this URL, the pipeline defined in the webhook
  /// is started as long as the POST request satisfied the authentication and
  /// filtering requirements supplied when defining the webhook.
  /// RegisterWebhookWithThirdParty and DeregisterWebhookWithThirdParty APIs can
  /// be used to automatically configure supported third parties to call the
  /// generated webhook URL.
  Future<void> putWebhook(WebhookDefinition webhook, {List<Tag> tags}) async {}

  /// Configures a connection between the webhook that was created and the
  /// external tool with events to be detected.
  Future<void> registerWebhookWithThirdParty({String webhookName}) async {}

  /// Resumes the pipeline execution by retrying the last failed actions in a
  /// stage.
  Future<void> retryStageExecution(
      {@required String pipelineName,
      @required String stageName,
      @required String pipelineExecutionId,
      @required String retryMode}) async {}

  /// Starts the specified pipeline. Specifically, it begins processing the
  /// latest commit to the source location specified as part of the pipeline.
  Future<void> startPipelineExecution(String name,
      {String clientRequestToken}) async {}

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes tags from an AWS resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a specified pipeline with edits or changes to its structure. Use a
  /// JSON file with the pipeline structure in conjunction with `UpdatePipeline`
  /// to provide the full structure of the pipeline. Updating the pipeline
  /// increases the version number of the pipeline by 1.
  Future<void> updatePipeline(PipelineDeclaration pipeline) async {}
}

class AwsSessionCredentials {}

class AcknowledgeJobOutput {}

class AcknowledgeThirdPartyJobOutput {}

class ActionConfiguration {}

class ActionConfigurationProperty {}

class ActionContext {}

class ActionDeclaration {}

class ActionExecution {}

class ActionExecutionDetail {}

class ActionExecutionFilter {}

class ActionExecutionInput {}

class ActionExecutionOutput {}

class ActionExecutionResult {}

class ActionRevision {}

class ActionState {}

class ActionType {}

class ActionTypeId {}

class ActionTypeSettings {}

class ApprovalResult {}

class Artifact {}

class ArtifactDetail {}

class ArtifactDetails {}

class ArtifactLocation {}

class ArtifactRevision {}

class ArtifactStore {}

class BlockerDeclaration {}

class CreateCustomActionTypeOutput {}

class CreatePipelineOutput {}

class CurrentRevision {}

class DeleteWebhookOutput {}

class DeregisterWebhookWithThirdPartyOutput {}

class EncryptionKey {}

class ErrorDetails {}

class ExecutionDetails {}

class ExecutionTrigger {}

class FailureDetails {}

class GetJobDetailsOutput {}

class GetPipelineExecutionOutput {}

class GetPipelineOutput {}

class GetPipelineStateOutput {}

class GetThirdPartyJobDetailsOutput {}

class InputArtifact {}

class Job {}

class JobData {}

class JobDetails {}

class ListActionExecutionsOutput {}

class ListActionTypesOutput {}

class ListPipelineExecutionsOutput {}

class ListPipelinesOutput {}

class ListTagsForResourceOutput {}

class ListWebhookItem {}

class ListWebhooksOutput {}

class OutputArtifact {}

class PipelineContext {}

class PipelineDeclaration {}

class PipelineExecution {}

class PipelineExecutionSummary {}

class PipelineMetadata {}

class PipelineSummary {}

class PollForJobsOutput {}

class PollForThirdPartyJobsOutput {}

class PutActionRevisionOutput {}

class PutApprovalResultOutput {}

class PutWebhookOutput {}

class RegisterWebhookWithThirdPartyOutput {}

class RetryStageExecutionOutput {}

class S3ArtifactLocation {}

class S3Location {}

class SourceRevision {}

class StageContext {}

class StageDeclaration {}

class StageExecution {}

class StageState {}

class StartPipelineExecutionOutput {}

class Tag {}

class TagResourceOutput {}

class ThirdPartyJob {}

class ThirdPartyJobData {}

class ThirdPartyJobDetails {}

class TransitionState {}

class UntagResourceOutput {}

class UpdatePipelineOutput {}

class WebhookAuthConfiguration {}

class WebhookDefinition {}

class WebhookFilterRule {}
