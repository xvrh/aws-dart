import 'package:meta/meta.dart';

/// AWS CodePipeline
///
///  **Overview**
///
/// This is the AWS CodePipeline API Reference. This guide provides descriptions
/// of the actions and data types for AWS CodePipeline. Some functionality for
/// your pipeline is only configurable through the API. For additional
/// information, see the
/// [AWS CodePipeline User Guide](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html).
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
/// stages and actions, also refer to the
/// [AWS CodePipeline Pipeline Structure Reference](https://docs.aws.amazon.com/codepipeline/latest/userguide/pipeline-structure.html).
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
  final _client;
  CodePipelineApi(client)
      : _client = client.configured('CodePipeline', serializer: 'json');

  /// Returns information about a specified job and whether that job has been
  /// received by the job worker. Only used for custom actions.
  ///
  /// [jobId]: The unique system-generated ID of the job for which you want to
  /// confirm receipt.
  ///
  /// [nonce]: A system-generated random number that AWS CodePipeline uses to
  /// ensure that the job is being worked on by only one job worker. Get this
  /// number from the response of the PollForJobs request that returned this
  /// job.
  Future<AcknowledgeJobOutput> acknowledgeJob(
      {@required String jobId, @required String nonce}) async {
    var response_ = await _client.send('AcknowledgeJob', {
      'jobId': jobId,
      'nonce': nonce,
    });
    return AcknowledgeJobOutput.fromJson(response_);
  }

  /// Confirms a job worker has received the specified job. Only used for
  /// partner actions.
  ///
  /// [jobId]: The unique system-generated ID of the job.
  ///
  /// [nonce]: A system-generated random number that AWS CodePipeline uses to
  /// ensure that the job is being worked on by only one job worker. Get this
  /// number from the response to a GetThirdPartyJobDetails request.
  ///
  /// [clientToken]: The clientToken portion of the clientId and clientToken
  /// pair used to verify that the calling entity is allowed access to the job
  /// and its details.
  Future<AcknowledgeThirdPartyJobOutput> acknowledgeThirdPartyJob(
      {@required String jobId,
      @required String nonce,
      @required String clientToken}) async {
    var response_ = await _client.send('AcknowledgeThirdPartyJob', {
      'jobId': jobId,
      'nonce': nonce,
      'clientToken': clientToken,
    });
    return AcknowledgeThirdPartyJobOutput.fromJson(response_);
  }

  /// Creates a new custom action that can be used in all pipelines associated
  /// with the AWS account. Only used for custom actions.
  ///
  /// [category]: The category of the custom action, such as a build action or a
  /// test action.
  ///
  ///
  ///
  /// Although `Source` and `Approval` are listed as valid values, they are not
  /// currently functional. These values are reserved for future use.
  ///
  /// [provider]: The provider of the service used in the custom action, such as
  /// AWS CodeDeploy.
  ///
  /// [version]: The version identifier of the custom action.
  ///
  /// [settings]: URLs that provide users information about this custom action.
  ///
  /// [configurationProperties]: The configuration properties for the custom
  /// action.
  ///
  ///
  ///
  /// You can refer to a name in the configuration properties of the custom
  /// action within the URL templates by following the format of {Config:name},
  /// as long as the configuration property is both required and not secret. For
  /// more information, see
  /// [Create a Custom Action for a Pipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/how-to-create-custom-action.html).
  ///
  /// [inputArtifactDetails]: The details of the input artifact for the action,
  /// such as its commit ID.
  ///
  /// [outputArtifactDetails]: The details of the output artifact of the action,
  /// such as its commit ID.
  ///
  /// [tags]: The tags for the custom action.
  Future<CreateCustomActionTypeOutput> createCustomActionType(
      {@required String category,
      @required String provider,
      @required String version,
      ActionTypeSettings settings,
      List<ActionConfigurationProperty> configurationProperties,
      @required ArtifactDetails inputArtifactDetails,
      @required ArtifactDetails outputArtifactDetails,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateCustomActionType', {
      'category': category,
      'provider': provider,
      'version': version,
      if (settings != null) 'settings': settings,
      if (configurationProperties != null)
        'configurationProperties': configurationProperties,
      'inputArtifactDetails': inputArtifactDetails,
      'outputArtifactDetails': outputArtifactDetails,
      if (tags != null) 'tags': tags,
    });
    return CreateCustomActionTypeOutput.fromJson(response_);
  }

  /// Creates a pipeline.
  ///
  ///
  ///
  /// In the pipeline structure, you must include either `artifactStore` or
  /// `artifactStores` in your pipeline, but you cannot use both. If you create
  /// a cross-region action in your pipeline, you must use `artifactStores`.
  ///
  /// [pipeline]: Represents the structure of actions and stages to be performed
  /// in the pipeline.
  ///
  /// [tags]: The tags for the pipeline.
  Future<CreatePipelineOutput> createPipeline(PipelineDeclaration pipeline,
      {List<Tag> tags}) async {
    var response_ = await _client.send('CreatePipeline', {
      'pipeline': pipeline,
      if (tags != null) 'tags': tags,
    });
    return CreatePipelineOutput.fromJson(response_);
  }

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
  ///
  /// [category]: The category of the custom action that you want to delete,
  /// such as source or deploy.
  ///
  /// [provider]: The provider of the service used in the custom action, such as
  /// AWS CodeDeploy.
  ///
  /// [version]: The version of the custom action to delete.
  Future<void> deleteCustomActionType(
      {@required String category,
      @required String provider,
      @required String version}) async {
    await _client.send('DeleteCustomActionType', {
      'category': category,
      'provider': provider,
      'version': version,
    });
  }

  /// Deletes the specified pipeline.
  ///
  /// [name]: The name of the pipeline to be deleted.
  Future<void> deletePipeline(String name) async {
    await _client.send('DeletePipeline', {
      'name': name,
    });
  }

  /// Deletes a previously created webhook by name. Deleting the webhook stops
  /// AWS CodePipeline from starting a pipeline every time an external event
  /// occurs. The API will return successfully when trying to delete a webhook
  /// that is already deleted. If a deleted webhook is re-created by calling
  /// PutWebhook with the same name, it will have a different URL.
  ///
  /// [name]: The name of the webhook you want to delete.
  Future<DeleteWebhookOutput> deleteWebhook(String name) async {
    var response_ = await _client.send('DeleteWebhook', {
      'name': name,
    });
    return DeleteWebhookOutput.fromJson(response_);
  }

  /// Removes the connection between the webhook that was created by
  /// CodePipeline and the external tool with events to be detected. Currently
  /// only supported for webhooks that target an action type of GitHub.
  ///
  /// [webhookName]: The name of the webhook you want to deregister.
  Future<DeregisterWebhookWithThirdPartyOutput> deregisterWebhookWithThirdParty(
      {String webhookName}) async {
    var response_ = await _client.send('DeregisterWebhookWithThirdParty', {
      if (webhookName != null) 'webhookName': webhookName,
    });
    return DeregisterWebhookWithThirdPartyOutput.fromJson(response_);
  }

  /// Prevents artifacts in a pipeline from transitioning to the next stage in
  /// the pipeline.
  ///
  /// [pipelineName]: The name of the pipeline in which you want to disable the
  /// flow of artifacts from one stage to another.
  ///
  /// [stageName]: The name of the stage where you want to disable the inbound
  /// or outbound transition of artifacts.
  ///
  /// [transitionType]: Specifies whether artifacts will be prevented from
  /// transitioning into the stage and being processed by the actions in that
  /// stage (inbound), or prevented from transitioning from the stage after they
  /// have been processed by the actions in that stage (outbound).
  ///
  /// [reason]: The reason given to the user why a stage is disabled, such as
  /// waiting for manual approval or manual tests. This message is displayed in
  /// the pipeline console UI.
  Future<void> disableStageTransition(
      {@required String pipelineName,
      @required String stageName,
      @required String transitionType,
      @required String reason}) async {
    await _client.send('DisableStageTransition', {
      'pipelineName': pipelineName,
      'stageName': stageName,
      'transitionType': transitionType,
      'reason': reason,
    });
  }

  /// Enables artifacts in a pipeline to transition to a stage in a pipeline.
  ///
  /// [pipelineName]: The name of the pipeline in which you want to enable the
  /// flow of artifacts from one stage to another.
  ///
  /// [stageName]: The name of the stage where you want to enable the transition
  /// of artifacts, either into the stage (inbound) or from that stage to the
  /// next stage (outbound).
  ///
  /// [transitionType]: Specifies whether artifacts will be allowed to enter the
  /// stage and be processed by the actions in that stage (inbound) or whether
  /// already-processed artifacts will be allowed to transition to the next
  /// stage (outbound).
  Future<void> enableStageTransition(
      {@required String pipelineName,
      @required String stageName,
      @required String transitionType}) async {
    await _client.send('EnableStageTransition', {
      'pipelineName': pipelineName,
      'stageName': stageName,
      'transitionType': transitionType,
    });
  }

  /// Returns information about a job. Only used for custom actions.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts. Additionally, this API returns any secret values defined for
  /// the action.
  ///
  /// [jobId]: The unique system-generated ID for the job.
  Future<GetJobDetailsOutput> getJobDetails(String jobId) async {
    var response_ = await _client.send('GetJobDetails', {
      'jobId': jobId,
    });
    return GetJobDetailsOutput.fromJson(response_);
  }

  /// Returns the metadata, structure, stages, and actions of a pipeline. Can be
  /// used to return the entire structure of a pipeline in JSON format, which
  /// can then be modified and used to update the pipeline structure with
  /// UpdatePipeline.
  ///
  /// [name]: The name of the pipeline for which you want to get information.
  /// Pipeline names must be unique under an Amazon Web Services (AWS) user
  /// account.
  ///
  /// [version]: The version number of the pipeline. If you do not specify a
  /// version, defaults to the most current version.
  Future<GetPipelineOutput> getPipeline(String name, {int version}) async {
    var response_ = await _client.send('GetPipeline', {
      'name': name,
      if (version != null) 'version': version,
    });
    return GetPipelineOutput.fromJson(response_);
  }

  /// Returns information about an execution of a pipeline, including details
  /// about artifacts, the pipeline execution ID, and the name, version, and
  /// status of the pipeline.
  ///
  /// [pipelineName]: The name of the pipeline about which you want to get
  /// execution details.
  ///
  /// [pipelineExecutionId]: The ID of the pipeline execution about which you
  /// want to get execution details.
  Future<GetPipelineExecutionOutput> getPipelineExecution(
      {@required String pipelineName,
      @required String pipelineExecutionId}) async {
    var response_ = await _client.send('GetPipelineExecution', {
      'pipelineName': pipelineName,
      'pipelineExecutionId': pipelineExecutionId,
    });
    return GetPipelineExecutionOutput.fromJson(response_);
  }

  /// Returns information about the state of a pipeline, including the stages
  /// and actions.
  ///
  ///
  ///
  /// Values returned in the `revisionId` and `revisionUrl` fields indicate the
  /// source revision information, such as the commit ID, for the current state.
  ///
  /// [name]: The name of the pipeline about which you want to get information.
  Future<GetPipelineStateOutput> getPipelineState(String name) async {
    var response_ = await _client.send('GetPipelineState', {
      'name': name,
    });
    return GetPipelineStateOutput.fromJson(response_);
  }

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
  ///
  /// [jobId]: The unique system-generated ID used for identifying the job.
  ///
  /// [clientToken]: The clientToken portion of the clientId and clientToken
  /// pair used to verify that the calling entity is allowed access to the job
  /// and its details.
  Future<GetThirdPartyJobDetailsOutput> getThirdPartyJobDetails(
      {@required String jobId, @required String clientToken}) async {
    var response_ = await _client.send('GetThirdPartyJobDetails', {
      'jobId': jobId,
      'clientToken': clientToken,
    });
    return GetThirdPartyJobDetailsOutput.fromJson(response_);
  }

  /// Lists the action executions that have occurred in a pipeline.
  ///
  /// [pipelineName]:  The name of the pipeline for which you want to list
  /// action execution history.
  ///
  /// [filter]: Input information used to filter action execution history.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// nextToken value. Action execution history is retained for up to 12 months,
  /// based on action execution start times. Default value is 100.
  ///
  ///
  ///
  /// Detailed execution history is available for executions run on or after
  /// February 21, 2019.
  ///
  /// [nextToken]: The token that was returned from the previous
  /// `ListActionExecutions` call, which can be used to return the next set of
  /// action executions in the list.
  Future<ListActionExecutionsOutput> listActionExecutions(String pipelineName,
      {ActionExecutionFilter filter, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListActionExecutions', {
      'pipelineName': pipelineName,
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListActionExecutionsOutput.fromJson(response_);
  }

  /// Gets a summary of all AWS CodePipeline action types associated with your
  /// account.
  ///
  /// [actionOwnerFilter]: Filters the list of action types to those created by
  /// a specified entity.
  ///
  /// [nextToken]: An identifier that was returned from the previous list action
  /// types call, which can be used to return the next set of action types in
  /// the list.
  Future<ListActionTypesOutput> listActionTypes(
      {String actionOwnerFilter, String nextToken}) async {
    var response_ = await _client.send('ListActionTypes', {
      if (actionOwnerFilter != null) 'actionOwnerFilter': actionOwnerFilter,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListActionTypesOutput.fromJson(response_);
  }

  /// Gets a summary of the most recent executions for a pipeline.
  ///
  /// [pipelineName]: The name of the pipeline for which you want to get
  /// execution summary information.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// nextToken value. Pipeline history is limited to the most recent 12 months,
  /// based on pipeline execution start times. Default value is 100.
  ///
  /// [nextToken]: The token that was returned from the previous
  /// `ListPipelineExecutions` call, which can be used to return the next set of
  /// pipeline executions in the list.
  Future<ListPipelineExecutionsOutput> listPipelineExecutions(
      String pipelineName,
      {int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListPipelineExecutions', {
      'pipelineName': pipelineName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListPipelineExecutionsOutput.fromJson(response_);
  }

  /// Gets a summary of all of the pipelines associated with your account.
  ///
  /// [nextToken]: An identifier that was returned from the previous list
  /// pipelines call, which can be used to return the next set of pipelines in
  /// the list.
  Future<ListPipelinesOutput> listPipelines({String nextToken}) async {
    var response_ = await _client.send('ListPipelines', {
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListPipelinesOutput.fromJson(response_);
  }

  /// Gets the set of key/value pairs (metadata) that are used to manage the
  /// resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to get tags
  /// for.
  ///
  /// [nextToken]: The token that was returned from the previous API call, which
  /// would be used to return the next page of the list. However, the
  /// ListTagsforResource call lists all available tags in one call and does not
  /// use pagination.
  ///
  /// [maxResults]: The maximum number of results to return in a single call.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Gets a listing of all the webhooks in this region for this account. The
  /// output lists all webhooks and includes the webhook URL and ARN, as well
  /// the configuration for each webhook.
  ///
  /// [nextToken]: The token that was returned from the previous ListWebhooks
  /// call, which can be used to return the next set of webhooks in the list.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// nextToken value.
  Future<ListWebhooksOutput> listWebhooks(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListWebhooks', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWebhooksOutput.fromJson(response_);
  }

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
  ///
  /// [actionTypeId]: Represents information about an action type.
  ///
  /// [maxBatchSize]: The maximum number of jobs to return in a poll for jobs
  /// call.
  ///
  /// [queryParam]: A map of property names and values. For an action type with
  /// no queryable properties, this value must be null or an empty map. For an
  /// action type with a queryable property, you must supply that property as a
  /// key in the map. Only jobs whose action configuration matches the mapped
  /// value will be returned.
  Future<PollForJobsOutput> pollForJobs(ActionTypeId actionTypeId,
      {int maxBatchSize, Map<String, String> queryParam}) async {
    var response_ = await _client.send('PollForJobs', {
      'actionTypeId': actionTypeId,
      if (maxBatchSize != null) 'maxBatchSize': maxBatchSize,
      if (queryParam != null) 'queryParam': queryParam,
    });
    return PollForJobsOutput.fromJson(response_);
  }

  /// Determines whether there are any third party jobs for a job worker to act
  /// on. Only used for partner actions.
  ///
  ///
  ///
  /// When this API is called, AWS CodePipeline returns temporary credentials
  /// for the Amazon S3 bucket used to store artifacts for the pipeline, if the
  /// action requires access to that Amazon S3 bucket for input or output
  /// artifacts.
  ///
  /// [actionTypeId]: Represents information about an action type.
  ///
  /// [maxBatchSize]: The maximum number of jobs to return in a poll for jobs
  /// call.
  Future<PollForThirdPartyJobsOutput> pollForThirdPartyJobs(
      ActionTypeId actionTypeId,
      {int maxBatchSize}) async {
    var response_ = await _client.send('PollForThirdPartyJobs', {
      'actionTypeId': actionTypeId,
      if (maxBatchSize != null) 'maxBatchSize': maxBatchSize,
    });
    return PollForThirdPartyJobsOutput.fromJson(response_);
  }

  /// Provides information to AWS CodePipeline about new revisions to a source.
  ///
  /// [pipelineName]: The name of the pipeline that will start processing the
  /// revision to the source.
  ///
  /// [stageName]: The name of the stage that contains the action that will act
  /// upon the revision.
  ///
  /// [actionName]: The name of the action that will process the revision.
  ///
  /// [actionRevision]: Represents information about the version (or revision)
  /// of an action.
  Future<PutActionRevisionOutput> putActionRevision(
      {@required String pipelineName,
      @required String stageName,
      @required String actionName,
      @required ActionRevision actionRevision}) async {
    var response_ = await _client.send('PutActionRevision', {
      'pipelineName': pipelineName,
      'stageName': stageName,
      'actionName': actionName,
      'actionRevision': actionRevision,
    });
    return PutActionRevisionOutput.fromJson(response_);
  }

  /// Provides the response to a manual approval request to AWS CodePipeline.
  /// Valid responses include Approved and Rejected.
  ///
  /// [pipelineName]: The name of the pipeline that contains the action.
  ///
  /// [stageName]: The name of the stage that contains the action.
  ///
  /// [actionName]: The name of the action for which approval is requested.
  ///
  /// [result]: Represents information about the result of the approval request.
  ///
  /// [token]: The system-generated token used to identify a unique approval
  /// request. The token for each open approval request can be obtained using
  /// the GetPipelineState action and is used to validate that the approval
  /// request corresponding to this token is still valid.
  Future<PutApprovalResultOutput> putApprovalResult(
      {@required String pipelineName,
      @required String stageName,
      @required String actionName,
      @required ApprovalResult result,
      @required String token}) async {
    var response_ = await _client.send('PutApprovalResult', {
      'pipelineName': pipelineName,
      'stageName': stageName,
      'actionName': actionName,
      'result': result,
      'token': token,
    });
    return PutApprovalResultOutput.fromJson(response_);
  }

  /// Represents the failure of a job as returned to the pipeline by a job
  /// worker. Only used for custom actions.
  ///
  /// [jobId]: The unique system-generated ID of the job that failed. This is
  /// the same ID returned from `PollForJobs`.
  ///
  /// [failureDetails]: The details about the failure of a job.
  Future<void> putJobFailureResult(
      {@required String jobId, @required FailureDetails failureDetails}) async {
    await _client.send('PutJobFailureResult', {
      'jobId': jobId,
      'failureDetails': failureDetails,
    });
  }

  /// Represents the success of a job as returned to the pipeline by a job
  /// worker. Only used for custom actions.
  ///
  /// [jobId]: The unique system-generated ID of the job that succeeded. This is
  /// the same ID returned from `PollForJobs`.
  ///
  /// [currentRevision]: The ID of the current revision of the artifact
  /// successfully worked upon by the job.
  ///
  /// [continuationToken]: A token generated by a job worker, such as an AWS
  /// CodeDeploy deployment ID, that a successful job provides to identify a
  /// custom action in progress. Future jobs will use this token in order to
  /// identify the running instance of the action. It can be reused to return
  /// additional information about the progress of the custom action. When the
  /// action is complete, no continuation token should be supplied.
  ///
  /// [executionDetails]: The execution details of the successful job, such as
  /// the actions taken by the job worker.
  Future<void> putJobSuccessResult(String jobId,
      {CurrentRevision currentRevision,
      String continuationToken,
      ExecutionDetails executionDetails}) async {
    await _client.send('PutJobSuccessResult', {
      'jobId': jobId,
      if (currentRevision != null) 'currentRevision': currentRevision,
      if (continuationToken != null) 'continuationToken': continuationToken,
      if (executionDetails != null) 'executionDetails': executionDetails,
    });
  }

  /// Represents the failure of a third party job as returned to the pipeline by
  /// a job worker. Only used for partner actions.
  ///
  /// [jobId]: The ID of the job that failed. This is the same ID returned from
  /// `PollForThirdPartyJobs`.
  ///
  /// [clientToken]: The clientToken portion of the clientId and clientToken
  /// pair used to verify that the calling entity is allowed access to the job
  /// and its details.
  ///
  /// [failureDetails]: Represents information about failure details.
  Future<void> putThirdPartyJobFailureResult(
      {@required String jobId,
      @required String clientToken,
      @required FailureDetails failureDetails}) async {
    await _client.send('PutThirdPartyJobFailureResult', {
      'jobId': jobId,
      'clientToken': clientToken,
      'failureDetails': failureDetails,
    });
  }

  /// Represents the success of a third party job as returned to the pipeline by
  /// a job worker. Only used for partner actions.
  ///
  /// [jobId]: The ID of the job that successfully completed. This is the same
  /// ID returned from `PollForThirdPartyJobs`.
  ///
  /// [clientToken]: The clientToken portion of the clientId and clientToken
  /// pair used to verify that the calling entity is allowed access to the job
  /// and its details.
  ///
  /// [currentRevision]: Represents information about a current revision.
  ///
  /// [continuationToken]: A token generated by a job worker, such as an AWS
  /// CodeDeploy deployment ID, that a successful job provides to identify a
  /// partner action in progress. Future jobs will use this token in order to
  /// identify the running instance of the action. It can be reused to return
  /// additional information about the progress of the partner action. When the
  /// action is complete, no continuation token should be supplied.
  ///
  /// [executionDetails]: The details of the actions taken and results produced
  /// on an artifact as it passes through stages in the pipeline.
  Future<void> putThirdPartyJobSuccessResult(
      {@required String jobId,
      @required String clientToken,
      CurrentRevision currentRevision,
      String continuationToken,
      ExecutionDetails executionDetails}) async {
    await _client.send('PutThirdPartyJobSuccessResult', {
      'jobId': jobId,
      'clientToken': clientToken,
      if (currentRevision != null) 'currentRevision': currentRevision,
      if (continuationToken != null) 'continuationToken': continuationToken,
      if (executionDetails != null) 'executionDetails': executionDetails,
    });
  }

  /// Defines a webhook and returns a unique webhook URL generated by
  /// CodePipeline. This URL can be supplied to third party source hosting
  /// providers to call every time there's a code change. When CodePipeline
  /// receives a POST request on this URL, the pipeline defined in the webhook
  /// is started as long as the POST request satisfied the authentication and
  /// filtering requirements supplied when defining the webhook.
  /// RegisterWebhookWithThirdParty and DeregisterWebhookWithThirdParty APIs can
  /// be used to automatically configure supported third parties to call the
  /// generated webhook URL.
  ///
  /// [webhook]: The detail provided in an input file to create the webhook,
  /// such as the webhook name, the pipeline name, and the action name. Give the
  /// webhook a unique name which identifies the webhook being defined. You may
  /// choose to name the webhook after the pipeline and action it targets so
  /// that you can easily recognize what it's used for later.
  ///
  /// [tags]: The tags for the webhook.
  Future<PutWebhookOutput> putWebhook(WebhookDefinition webhook,
      {List<Tag> tags}) async {
    var response_ = await _client.send('PutWebhook', {
      'webhook': webhook,
      if (tags != null) 'tags': tags,
    });
    return PutWebhookOutput.fromJson(response_);
  }

  /// Configures a connection between the webhook that was created and the
  /// external tool with events to be detected.
  ///
  /// [webhookName]: The name of an existing webhook created with PutWebhook to
  /// register with a supported third party.
  Future<RegisterWebhookWithThirdPartyOutput> registerWebhookWithThirdParty(
      {String webhookName}) async {
    var response_ = await _client.send('RegisterWebhookWithThirdParty', {
      if (webhookName != null) 'webhookName': webhookName,
    });
    return RegisterWebhookWithThirdPartyOutput.fromJson(response_);
  }

  /// Resumes the pipeline execution by retrying the last failed actions in a
  /// stage.
  ///
  /// [pipelineName]: The name of the pipeline that contains the failed stage.
  ///
  /// [stageName]: The name of the failed stage to be retried.
  ///
  /// [pipelineExecutionId]: The ID of the pipeline execution in the failed
  /// stage to be retried. Use the GetPipelineState action to retrieve the
  /// current pipelineExecutionId of the failed stage
  ///
  /// [retryMode]: The scope of the retry attempt. Currently, the only supported
  /// value is FAILED_ACTIONS.
  Future<RetryStageExecutionOutput> retryStageExecution(
      {@required String pipelineName,
      @required String stageName,
      @required String pipelineExecutionId,
      @required String retryMode}) async {
    var response_ = await _client.send('RetryStageExecution', {
      'pipelineName': pipelineName,
      'stageName': stageName,
      'pipelineExecutionId': pipelineExecutionId,
      'retryMode': retryMode,
    });
    return RetryStageExecutionOutput.fromJson(response_);
  }

  /// Starts the specified pipeline. Specifically, it begins processing the
  /// latest commit to the source location specified as part of the pipeline.
  ///
  /// [name]: The name of the pipeline to start.
  ///
  /// [clientRequestToken]: The system-generated unique ID used to identify a
  /// unique execution request.
  Future<StartPipelineExecutionOutput> startPipelineExecution(String name,
      {String clientRequestToken}) async {
    var response_ = await _client.send('StartPipelineExecution', {
      'name': name,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return StartPipelineExecutionOutput.fromJson(response_);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource you want to
  /// add tags to.
  ///
  /// [tags]: The tags you want to modify or add to the resource.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceOutput.fromJson(response_);
  }

  /// Removes tags from an AWS resource.
  ///
  /// [resourceArn]:  The Amazon Resource Name (ARN) of the resource to remove
  /// tags from.
  ///
  /// [tagKeys]: The list of keys for the tags to be removed from the resource.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceOutput.fromJson(response_);
  }

  /// Updates a specified pipeline with edits or changes to its structure. Use a
  /// JSON file with the pipeline structure in conjunction with `UpdatePipeline`
  /// to provide the full structure of the pipeline. Updating the pipeline
  /// increases the version number of the pipeline by 1.
  ///
  /// [pipeline]: The name of the pipeline to be updated.
  Future<UpdatePipelineOutput> updatePipeline(
      PipelineDeclaration pipeline) async {
    var response_ = await _client.send('UpdatePipeline', {
      'pipeline': pipeline,
    });
    return UpdatePipelineOutput.fromJson(response_);
  }
}

/// Represents an AWS session credentials object. These credentials are
/// temporary credentials that are issued by AWS Secure Token Service (STS).
/// They can be used to access input and output artifacts in the Amazon S3
/// bucket used to store artifact for the pipeline in AWS CodePipeline.
class AwsSessionCredentials {
  /// The access key for the session.
  final String accessKeyId;

  /// The secret access key for the session.
  final String secretAccessKey;

  /// The token for the session.
  final String sessionToken;

  AwsSessionCredentials({
    @required this.accessKeyId,
    @required this.secretAccessKey,
    @required this.sessionToken,
  });
  static AwsSessionCredentials fromJson(Map<String, dynamic> json) =>
      AwsSessionCredentials(
        accessKeyId: json['accessKeyId'] as String,
        secretAccessKey: json['secretAccessKey'] as String,
        sessionToken: json['sessionToken'] as String,
      );
}

/// Represents the output of an AcknowledgeJob action.
class AcknowledgeJobOutput {
  /// Whether the job worker has received the specified job.
  final String status;

  AcknowledgeJobOutput({
    this.status,
  });
  static AcknowledgeJobOutput fromJson(Map<String, dynamic> json) =>
      AcknowledgeJobOutput(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// Represents the output of an AcknowledgeThirdPartyJob action.
class AcknowledgeThirdPartyJobOutput {
  /// The status information for the third party job, if any.
  final String status;

  AcknowledgeThirdPartyJobOutput({
    this.status,
  });
  static AcknowledgeThirdPartyJobOutput fromJson(Map<String, dynamic> json) =>
      AcknowledgeThirdPartyJobOutput(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// Represents information about an action configuration.
class ActionConfiguration {
  /// The configuration data for the action.
  final Map<String, String> configuration;

  ActionConfiguration({
    this.configuration,
  });
  static ActionConfiguration fromJson(Map<String, dynamic> json) =>
      ActionConfiguration(
        configuration: json.containsKey('configuration')
            ? (json['configuration'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Represents information about an action configuration property.
class ActionConfigurationProperty {
  /// The name of the action configuration property.
  final String name;

  /// Whether the configuration property is a required value.
  final bool isRequired;

  /// Whether the configuration property is a key.
  final bool key;

  /// Whether the configuration property is secret. Secrets are hidden from all
  /// calls except for `GetJobDetails`, `GetThirdPartyJobDetails`,
  /// `PollForJobs`, and `PollForThirdPartyJobs`.
  ///
  /// When updating a pipeline, passing * * * * * without changing any other
  /// values of the action will preserve the prior value of the secret.
  final bool secret;

  /// Indicates that the property will be used in conjunction with
  /// `PollForJobs`. When creating a custom action, an action can have up to one
  /// queryable property. If it has one, that property must be both required and
  /// not secret.
  ///
  /// If you create a pipeline with a custom action type, and that custom action
  /// contains a queryable property, the value for that configuration property
  /// is subject to additional restrictions. The value must be less than or
  /// equal to twenty (20) characters. The value can contain only alphanumeric
  /// characters, underscores, and hyphens.
  final bool queryable;

  /// The description of the action configuration property that will be
  /// displayed to users.
  final String description;

  /// The type of the configuration property.
  final String type;

  ActionConfigurationProperty({
    @required this.name,
    @required this.isRequired,
    @required this.key,
    @required this.secret,
    this.queryable,
    this.description,
    this.type,
  });
  static ActionConfigurationProperty fromJson(Map<String, dynamic> json) =>
      ActionConfigurationProperty(
        name: json['name'] as String,
        isRequired: json['required'] as bool,
        key: json['key'] as bool,
        secret: json['secret'] as bool,
        queryable:
            json.containsKey('queryable') ? json['queryable'] as bool : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        type: json.containsKey('type') ? json['type'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the context of an action within the stage of a pipeline to a job
/// worker.
class ActionContext {
  /// The name of the action within the context of a job.
  final String name;

  /// The system-generated unique ID that corresponds to an action's execution.
  final String actionExecutionId;

  ActionContext({
    this.name,
    this.actionExecutionId,
  });
  static ActionContext fromJson(Map<String, dynamic> json) => ActionContext(
        name: json.containsKey('name') ? json['name'] as String : null,
        actionExecutionId: json.containsKey('actionExecutionId')
            ? json['actionExecutionId'] as String
            : null,
      );
}

/// Represents information about an action declaration.
class ActionDeclaration {
  /// The action declaration's name.
  final String name;

  /// Specifies the action type and the provider of the action.
  final ActionTypeId actionTypeId;

  /// The order in which actions are run.
  final int runOrder;

  /// The action's configuration. These are key-value pairs that specify input
  /// values for an action. For more information, see
  /// [Action Structure Requirements in CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements).
  /// For the list of configuration properties for the AWS CloudFormation action
  /// type in CodePipeline, see
  /// [Configuration Properties Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-action-reference.html)
  /// in the _AWS CloudFormation User Guide_. For template snippets with
  /// examples, see
  /// [Using Parameter Override Functions with CodePipeline Pipelines](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/continuous-delivery-codepipeline-parameter-override-functions.html)
  /// in the _AWS CloudFormation User Guide_.
  ///
  /// The values can be represented in either JSON or YAML format. For example,
  /// the JSON configuration item format is as follows:
  ///
  ///  _JSON:_
  ///
  ///  `"Configuration" : { Key : Value },`
  final Map<String, String> configuration;

  /// The name or ID of the result of the action declaration, such as a test or
  /// build artifact.
  final List<OutputArtifact> outputArtifacts;

  /// The name or ID of the artifact consumed by the action, such as a test or
  /// build artifact.
  final List<InputArtifact> inputArtifacts;

  /// The ARN of the IAM service role that will perform the declared action.
  /// This is assumed through the roleArn for the pipeline.
  final String roleArn;

  /// The action declaration's AWS Region, such as us-east-1.
  final String region;

  ActionDeclaration({
    @required this.name,
    @required this.actionTypeId,
    this.runOrder,
    this.configuration,
    this.outputArtifacts,
    this.inputArtifacts,
    this.roleArn,
    this.region,
  });
  static ActionDeclaration fromJson(Map<String, dynamic> json) =>
      ActionDeclaration(
        name: json['name'] as String,
        actionTypeId: ActionTypeId.fromJson(json['actionTypeId']),
        runOrder: json.containsKey('runOrder') ? json['runOrder'] as int : null,
        configuration: json.containsKey('configuration')
            ? (json['configuration'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        outputArtifacts: json.containsKey('outputArtifacts')
            ? (json['outputArtifacts'] as List)
                .map((e) => OutputArtifact.fromJson(e))
                .toList()
            : null,
        inputArtifacts: json.containsKey('inputArtifacts')
            ? (json['inputArtifacts'] as List)
                .map((e) => InputArtifact.fromJson(e))
                .toList()
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        region: json.containsKey('region') ? json['region'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about the run of an action.
class ActionExecution {
  /// The status of the action, or for a completed action, the last status of
  /// the action.
  final String status;

  /// A summary of the run of the action.
  final String summary;

  /// The last status change of the action.
  final DateTime lastStatusChange;

  /// The system-generated token used to identify a unique approval request. The
  /// token for each open approval request can be obtained using the
  /// `GetPipelineState` command and is used to validate that the approval
  /// request corresponding to this token is still valid.
  final String token;

  /// The ARN of the user who last changed the pipeline.
  final String lastUpdatedBy;

  /// The external ID of the run of the action.
  final String externalExecutionId;

  /// The URL of a resource external to AWS that will be used when running the
  /// action, for example an external repository URL.
  final String externalExecutionUrl;

  /// A percentage of completeness of the action as it runs.
  final int percentComplete;

  /// The details of an error returned by a URL external to AWS.
  final ErrorDetails errorDetails;

  ActionExecution({
    this.status,
    this.summary,
    this.lastStatusChange,
    this.token,
    this.lastUpdatedBy,
    this.externalExecutionId,
    this.externalExecutionUrl,
    this.percentComplete,
    this.errorDetails,
  });
  static ActionExecution fromJson(Map<String, dynamic> json) => ActionExecution(
        status: json.containsKey('status') ? json['status'] as String : null,
        summary: json.containsKey('summary') ? json['summary'] as String : null,
        lastStatusChange: json.containsKey('lastStatusChange')
            ? DateTime.parse(json['lastStatusChange'])
            : null,
        token: json.containsKey('token') ? json['token'] as String : null,
        lastUpdatedBy: json.containsKey('lastUpdatedBy')
            ? json['lastUpdatedBy'] as String
            : null,
        externalExecutionId: json.containsKey('externalExecutionId')
            ? json['externalExecutionId'] as String
            : null,
        externalExecutionUrl: json.containsKey('externalExecutionUrl')
            ? json['externalExecutionUrl'] as String
            : null,
        percentComplete: json.containsKey('percentComplete')
            ? json['percentComplete'] as int
            : null,
        errorDetails: json.containsKey('errorDetails')
            ? ErrorDetails.fromJson(json['errorDetails'])
            : null,
      );
}

/// Returns information about an execution of an action, including the action
/// execution ID, and the name, version, and timing of the action.
class ActionExecutionDetail {
  /// The pipeline execution ID for the action execution.
  final String pipelineExecutionId;

  /// The action execution ID.
  final String actionExecutionId;

  /// The version of the pipeline where the action was run.
  final int pipelineVersion;

  /// The name of the stage that contains the action.
  final String stageName;

  /// The name of the action.
  final String actionName;

  /// The start time of the action execution.
  final DateTime startTime;

  /// The last update time of the action execution.
  final DateTime lastUpdateTime;

  ///  The status of the action execution. Status categories are `InProgress`,
  /// `Succeeded`, and `Failed`.
  final String status;

  /// Input details for the action execution, such as role ARN, Region, and
  /// input artifacts.
  final ActionExecutionInput input;

  /// Output details for the action execution, such as the action execution
  /// result.
  final ActionExecutionOutput output;

  ActionExecutionDetail({
    this.pipelineExecutionId,
    this.actionExecutionId,
    this.pipelineVersion,
    this.stageName,
    this.actionName,
    this.startTime,
    this.lastUpdateTime,
    this.status,
    this.input,
    this.output,
  });
  static ActionExecutionDetail fromJson(Map<String, dynamic> json) =>
      ActionExecutionDetail(
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
        actionExecutionId: json.containsKey('actionExecutionId')
            ? json['actionExecutionId'] as String
            : null,
        pipelineVersion: json.containsKey('pipelineVersion')
            ? json['pipelineVersion'] as int
            : null,
        stageName:
            json.containsKey('stageName') ? json['stageName'] as String : null,
        actionName: json.containsKey('actionName')
            ? json['actionName'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        lastUpdateTime: json.containsKey('lastUpdateTime')
            ? DateTime.parse(json['lastUpdateTime'])
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        input: json.containsKey('input')
            ? ActionExecutionInput.fromJson(json['input'])
            : null,
        output: json.containsKey('output')
            ? ActionExecutionOutput.fromJson(json['output'])
            : null,
      );
}

/// Filter values for the action execution.
class ActionExecutionFilter {
  /// The pipeline execution ID used to filter action execution history.
  final String pipelineExecutionId;

  ActionExecutionFilter({
    this.pipelineExecutionId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Input information used for an action execution.
class ActionExecutionInput {
  final ActionTypeId actionTypeId;

  /// Configuration data for an action execution.
  final Map<String, String> configuration;

  /// The ARN of the IAM service role that performs the declared action. This is
  /// assumed through the roleArn for the pipeline.
  final String roleArn;

  /// The AWS Region for the action, such as us-east-1.
  final String region;

  /// Details of input artifacts of the action that correspond to the action
  /// execution.
  final List<ArtifactDetail> inputArtifacts;

  ActionExecutionInput({
    this.actionTypeId,
    this.configuration,
    this.roleArn,
    this.region,
    this.inputArtifacts,
  });
  static ActionExecutionInput fromJson(Map<String, dynamic> json) =>
      ActionExecutionInput(
        actionTypeId: json.containsKey('actionTypeId')
            ? ActionTypeId.fromJson(json['actionTypeId'])
            : null,
        configuration: json.containsKey('configuration')
            ? (json['configuration'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        region: json.containsKey('region') ? json['region'] as String : null,
        inputArtifacts: json.containsKey('inputArtifacts')
            ? (json['inputArtifacts'] as List)
                .map((e) => ArtifactDetail.fromJson(e))
                .toList()
            : null,
      );
}

/// Output details listed for an action execution, such as the action execution
/// result.
class ActionExecutionOutput {
  /// Details of output artifacts of the action that correspond to the action
  /// execution.
  final List<ArtifactDetail> outputArtifacts;

  /// Execution result information listed in the output details for an action
  /// execution.
  final ActionExecutionResult executionResult;

  ActionExecutionOutput({
    this.outputArtifacts,
    this.executionResult,
  });
  static ActionExecutionOutput fromJson(Map<String, dynamic> json) =>
      ActionExecutionOutput(
        outputArtifacts: json.containsKey('outputArtifacts')
            ? (json['outputArtifacts'] as List)
                .map((e) => ArtifactDetail.fromJson(e))
                .toList()
            : null,
        executionResult: json.containsKey('executionResult')
            ? ActionExecutionResult.fromJson(json['executionResult'])
            : null,
      );
}

/// Execution result information, such as the external execution ID.
class ActionExecutionResult {
  /// The action provider's external ID for the action execution.
  final String externalExecutionId;

  /// The action provider's summary for the action execution.
  final String externalExecutionSummary;

  /// The deepest external link to the external resource (for example, a
  /// repository URL or deployment endpoint) that is used when running the
  /// action.
  final String externalExecutionUrl;

  ActionExecutionResult({
    this.externalExecutionId,
    this.externalExecutionSummary,
    this.externalExecutionUrl,
  });
  static ActionExecutionResult fromJson(Map<String, dynamic> json) =>
      ActionExecutionResult(
        externalExecutionId: json.containsKey('externalExecutionId')
            ? json['externalExecutionId'] as String
            : null,
        externalExecutionSummary: json.containsKey('externalExecutionSummary')
            ? json['externalExecutionSummary'] as String
            : null,
        externalExecutionUrl: json.containsKey('externalExecutionUrl')
            ? json['externalExecutionUrl'] as String
            : null,
      );
}

/// Represents information about the version (or revision) of an action.
class ActionRevision {
  /// The system-generated unique ID that identifies the revision number of the
  /// action.
  final String revisionId;

  /// The unique identifier of the change that set the state to this revision,
  /// for example a deployment ID or timestamp.
  final String revisionChangeId;

  /// The date and time when the most recent version of the action was created,
  /// in timestamp format.
  final DateTime created;

  ActionRevision({
    @required this.revisionId,
    @required this.revisionChangeId,
    @required this.created,
  });
  static ActionRevision fromJson(Map<String, dynamic> json) => ActionRevision(
        revisionId: json['revisionId'] as String,
        revisionChangeId: json['revisionChangeId'] as String,
        created: DateTime.parse(json['created']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about the state of an action.
class ActionState {
  /// The name of the action.
  final String actionName;

  /// Represents information about the version (or revision) of an action.
  final ActionRevision currentRevision;

  /// Represents information about the run of an action.
  final ActionExecution latestExecution;

  /// A URL link for more information about the state of the action, such as a
  /// deployment group details page.
  final String entityUrl;

  /// A URL link for more information about the revision, such as a commit
  /// details page.
  final String revisionUrl;

  ActionState({
    this.actionName,
    this.currentRevision,
    this.latestExecution,
    this.entityUrl,
    this.revisionUrl,
  });
  static ActionState fromJson(Map<String, dynamic> json) => ActionState(
        actionName: json.containsKey('actionName')
            ? json['actionName'] as String
            : null,
        currentRevision: json.containsKey('currentRevision')
            ? ActionRevision.fromJson(json['currentRevision'])
            : null,
        latestExecution: json.containsKey('latestExecution')
            ? ActionExecution.fromJson(json['latestExecution'])
            : null,
        entityUrl:
            json.containsKey('entityUrl') ? json['entityUrl'] as String : null,
        revisionUrl: json.containsKey('revisionUrl')
            ? json['revisionUrl'] as String
            : null,
      );
}

/// Returns information about the details of an action type.
class ActionType {
  /// Represents information about an action type.
  final ActionTypeId id;

  /// The settings for the action type.
  final ActionTypeSettings settings;

  /// The configuration properties for the action type.
  final List<ActionConfigurationProperty> actionConfigurationProperties;

  /// The details of the input artifact for the action, such as its commit ID.
  final ArtifactDetails inputArtifactDetails;

  /// The details of the output artifact of the action, such as its commit ID.
  final ArtifactDetails outputArtifactDetails;

  ActionType({
    @required this.id,
    this.settings,
    this.actionConfigurationProperties,
    @required this.inputArtifactDetails,
    @required this.outputArtifactDetails,
  });
  static ActionType fromJson(Map<String, dynamic> json) => ActionType(
        id: ActionTypeId.fromJson(json['id']),
        settings: json.containsKey('settings')
            ? ActionTypeSettings.fromJson(json['settings'])
            : null,
        actionConfigurationProperties:
            json.containsKey('actionConfigurationProperties')
                ? (json['actionConfigurationProperties'] as List)
                    .map((e) => ActionConfigurationProperty.fromJson(e))
                    .toList()
                : null,
        inputArtifactDetails:
            ArtifactDetails.fromJson(json['inputArtifactDetails']),
        outputArtifactDetails:
            ArtifactDetails.fromJson(json['outputArtifactDetails']),
      );
}

/// Represents information about an action type.
class ActionTypeId {
  /// A category defines what kind of action can be taken in the stage, and
  /// constrains the provider type for the action. Valid categories are limited
  /// to one of the values below.
  final String category;

  /// The creator of the action being called.
  final String owner;

  /// The provider of the service being called by the action. Valid providers
  /// are determined by the action category. For example, an action in the
  /// Deploy category type might have a provider of AWS CodeDeploy, which would
  /// be specified as CodeDeploy. To reference a list of action providers by
  /// action type, see
  /// [Valid Action Types and Providers in CodePipeline](https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#actions-valid-providers).
  final String provider;

  /// A string that describes the action version.
  final String version;

  ActionTypeId({
    @required this.category,
    @required this.owner,
    @required this.provider,
    @required this.version,
  });
  static ActionTypeId fromJson(Map<String, dynamic> json) => ActionTypeId(
        category: json['category'] as String,
        owner: json['owner'] as String,
        provider: json['provider'] as String,
        version: json['version'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Returns information about the settings for an action type.
class ActionTypeSettings {
  /// The URL of a sign-up page where users can sign up for an external service
  /// and perform initial configuration of the action provided by that service.
  final String thirdPartyConfigurationUrl;

  /// The URL returned to the AWS CodePipeline console that provides a deep link
  /// to the resources of the external system, such as the configuration page
  /// for an AWS CodeDeploy deployment group. This link is provided as part of
  /// the action display within the pipeline.
  final String entityUrlTemplate;

  /// The URL returned to the AWS CodePipeline console that contains a link to
  /// the top-level landing page for the external system, such as console page
  /// for AWS CodeDeploy. This link is shown on the pipeline view page in the
  /// AWS CodePipeline console and provides a link to the execution entity of
  /// the external action.
  final String executionUrlTemplate;

  /// The URL returned to the AWS CodePipeline console that contains a link to
  /// the page where customers can update or change the configuration of the
  /// external action.
  final String revisionUrlTemplate;

  ActionTypeSettings({
    this.thirdPartyConfigurationUrl,
    this.entityUrlTemplate,
    this.executionUrlTemplate,
    this.revisionUrlTemplate,
  });
  static ActionTypeSettings fromJson(Map<String, dynamic> json) =>
      ActionTypeSettings(
        thirdPartyConfigurationUrl:
            json.containsKey('thirdPartyConfigurationUrl')
                ? json['thirdPartyConfigurationUrl'] as String
                : null,
        entityUrlTemplate: json.containsKey('entityUrlTemplate')
            ? json['entityUrlTemplate'] as String
            : null,
        executionUrlTemplate: json.containsKey('executionUrlTemplate')
            ? json['executionUrlTemplate'] as String
            : null,
        revisionUrlTemplate: json.containsKey('revisionUrlTemplate')
            ? json['revisionUrlTemplate'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about the result of an approval request.
class ApprovalResult {
  /// The summary of the current status of the approval request.
  final String summary;

  /// The response submitted by a reviewer assigned to an approval action
  /// request.
  final String status;

  ApprovalResult({
    @required this.summary,
    @required this.status,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about an artifact that will be worked upon by actions
/// in the pipeline.
class Artifact {
  /// The artifact's name.
  final String name;

  /// The artifact's revision ID. Depending on the type of object, this could be
  /// a commit ID (GitHub) or a revision ID (Amazon S3).
  final String revision;

  /// The location of an artifact.
  final ArtifactLocation location;

  Artifact({
    this.name,
    this.revision,
    this.location,
  });
  static Artifact fromJson(Map<String, dynamic> json) => Artifact(
        name: json.containsKey('name') ? json['name'] as String : null,
        revision:
            json.containsKey('revision') ? json['revision'] as String : null,
        location: json.containsKey('location')
            ? ArtifactLocation.fromJson(json['location'])
            : null,
      );
}

/// Artifact details for the action execution, such as the artifact location.
class ArtifactDetail {
  /// The artifact object name for the action execution.
  final String name;

  /// The Amazon S3 artifact location for the action execution.
  final S3Location s3Location;

  ArtifactDetail({
    this.name,
    this.s3Location,
  });
  static ArtifactDetail fromJson(Map<String, dynamic> json) => ArtifactDetail(
        name: json.containsKey('name') ? json['name'] as String : null,
        s3Location: json.containsKey('s3location')
            ? S3Location.fromJson(json['s3location'])
            : null,
      );
}

/// Returns information about the details of an artifact.
class ArtifactDetails {
  /// The minimum number of artifacts allowed for the action type.
  final int minimumCount;

  /// The maximum number of artifacts allowed for the action type.
  final int maximumCount;

  ArtifactDetails({
    @required this.minimumCount,
    @required this.maximumCount,
  });
  static ArtifactDetails fromJson(Map<String, dynamic> json) => ArtifactDetails(
        minimumCount: json['minimumCount'] as int,
        maximumCount: json['maximumCount'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about the location of an artifact.
class ArtifactLocation {
  /// The type of artifact in the location.
  final String type;

  /// The Amazon S3 bucket that contains the artifact.
  final S3ArtifactLocation s3Location;

  ArtifactLocation({
    this.type,
    this.s3Location,
  });
  static ArtifactLocation fromJson(Map<String, dynamic> json) =>
      ArtifactLocation(
        type: json.containsKey('type') ? json['type'] as String : null,
        s3Location: json.containsKey('s3Location')
            ? S3ArtifactLocation.fromJson(json['s3Location'])
            : null,
      );
}

/// Represents revision details of an artifact.
class ArtifactRevision {
  /// The name of an artifact. This name might be system-generated, such as
  /// "MyApp", or might be defined by the user when an action is created.
  final String name;

  /// The revision ID of the artifact.
  final String revisionId;

  /// An additional identifier for a revision, such as a commit date or, for
  /// artifacts stored in Amazon S3 buckets, the ETag value.
  final String revisionChangeIdentifier;

  /// Summary information about the most recent revision of the artifact. For
  /// GitHub and AWS CodeCommit repositories, the commit message. For Amazon S3
  /// buckets or actions, the user-provided content of a
  /// `codepipeline-artifact-revision-summary` key specified in the object
  /// metadata.
  final String revisionSummary;

  /// The date and time when the most recent revision of the artifact was
  /// created, in timestamp format.
  final DateTime created;

  /// The commit ID for the artifact revision. For artifacts stored in GitHub or
  /// AWS CodeCommit repositories, the commit ID is linked to a commit details
  /// page.
  final String revisionUrl;

  ArtifactRevision({
    this.name,
    this.revisionId,
    this.revisionChangeIdentifier,
    this.revisionSummary,
    this.created,
    this.revisionUrl,
  });
  static ArtifactRevision fromJson(Map<String, dynamic> json) =>
      ArtifactRevision(
        name: json.containsKey('name') ? json['name'] as String : null,
        revisionId: json.containsKey('revisionId')
            ? json['revisionId'] as String
            : null,
        revisionChangeIdentifier: json.containsKey('revisionChangeIdentifier')
            ? json['revisionChangeIdentifier'] as String
            : null,
        revisionSummary: json.containsKey('revisionSummary')
            ? json['revisionSummary'] as String
            : null,
        created: json.containsKey('created')
            ? DateTime.parse(json['created'])
            : null,
        revisionUrl: json.containsKey('revisionUrl')
            ? json['revisionUrl'] as String
            : null,
      );
}

/// The Amazon S3 bucket where artifacts are stored for the pipeline.
///
///
///
/// You must include either `artifactStore` or `artifactStores` in your
/// pipeline, but you cannot use both. If you create a cross-region action in
/// your pipeline, you must use `artifactStores`.
class ArtifactStore {
  /// The type of the artifact store, such as S3.
  final String type;

  /// The Amazon S3 bucket used for storing the artifacts for a pipeline. You
  /// can specify the name of an S3 bucket but not a folder within the bucket. A
  /// folder to contain the pipeline artifacts is created for you based on the
  /// name of the pipeline. You can use any Amazon S3 bucket in the same AWS
  /// Region as the pipeline to store your pipeline artifacts.
  final String location;

  /// The encryption key used to encrypt the data in the artifact store, such as
  /// an AWS Key Management Service (AWS KMS) key. If this is undefined, the
  /// default key for Amazon S3 is used.
  final EncryptionKey encryptionKey;

  ArtifactStore({
    @required this.type,
    @required this.location,
    this.encryptionKey,
  });
  static ArtifactStore fromJson(Map<String, dynamic> json) => ArtifactStore(
        type: json['type'] as String,
        location: json['location'] as String,
        encryptionKey: json.containsKey('encryptionKey')
            ? EncryptionKey.fromJson(json['encryptionKey'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Reserved for future use.
class BlockerDeclaration {
  /// Reserved for future use.
  final String name;

  /// Reserved for future use.
  final String type;

  BlockerDeclaration({
    @required this.name,
    @required this.type,
  });
  static BlockerDeclaration fromJson(Map<String, dynamic> json) =>
      BlockerDeclaration(
        name: json['name'] as String,
        type: json['type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `CreateCustomActionType` operation.
class CreateCustomActionTypeOutput {
  /// Returns information about the details of an action type.
  final ActionType actionType;

  /// Specifies the tags applied to the custom action.
  final List<Tag> tags;

  CreateCustomActionTypeOutput({
    @required this.actionType,
    this.tags,
  });
  static CreateCustomActionTypeOutput fromJson(Map<String, dynamic> json) =>
      CreateCustomActionTypeOutput(
        actionType: ActionType.fromJson(json['actionType']),
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Represents the output of a `CreatePipeline` action.
class CreatePipelineOutput {
  /// Represents the structure of actions and stages to be performed in the
  /// pipeline.
  final PipelineDeclaration pipeline;

  /// Specifies the tags applied to the pipeline.
  final List<Tag> tags;

  CreatePipelineOutput({
    this.pipeline,
    this.tags,
  });
  static CreatePipelineOutput fromJson(Map<String, dynamic> json) =>
      CreatePipelineOutput(
        pipeline: json.containsKey('pipeline')
            ? PipelineDeclaration.fromJson(json['pipeline'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Represents information about a current revision.
class CurrentRevision {
  /// The revision ID of the current version of an artifact.
  final String revision;

  /// The change identifier for the current revision.
  final String changeIdentifier;

  /// The date and time when the most recent revision of the artifact was
  /// created, in timestamp format.
  final DateTime created;

  /// The summary of the most recent revision of the artifact.
  final String revisionSummary;

  CurrentRevision({
    @required this.revision,
    @required this.changeIdentifier,
    this.created,
    this.revisionSummary,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteWebhookOutput {
  DeleteWebhookOutput();
  static DeleteWebhookOutput fromJson(Map<String, dynamic> json) =>
      DeleteWebhookOutput();
}

class DeregisterWebhookWithThirdPartyOutput {
  DeregisterWebhookWithThirdPartyOutput();
  static DeregisterWebhookWithThirdPartyOutput fromJson(
          Map<String, dynamic> json) =>
      DeregisterWebhookWithThirdPartyOutput();
}

/// Represents information about the key used to encrypt data in the artifact
/// store, such as an AWS Key Management Service (AWS KMS) key.
class EncryptionKey {
  /// The ID used to identify the key. For an AWS KMS key, you can use the key
  /// ID, the key ARN, or the alias ARN.
  ///
  ///
  ///
  /// Aliases are recognized only in the account that created the customer
  /// master key (CMK). For cross-account actions, you can only use the key ID
  /// or key ARN to identify the key.
  final String id;

  /// The type of encryption key, such as an AWS Key Management Service (AWS
  /// KMS) key. When creating or updating a pipeline, the value must be set to
  /// 'KMS'.
  final String type;

  EncryptionKey({
    @required this.id,
    @required this.type,
  });
  static EncryptionKey fromJson(Map<String, dynamic> json) => EncryptionKey(
        id: json['id'] as String,
        type: json['type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about an error in AWS CodePipeline.
class ErrorDetails {
  /// The system ID or error number code of the error.
  final String code;

  /// The text of the error message.
  final String message;

  ErrorDetails({
    this.code,
    this.message,
  });
  static ErrorDetails fromJson(Map<String, dynamic> json) => ErrorDetails(
        code: json.containsKey('code') ? json['code'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// The details of the actions taken and results produced on an artifact as it
/// passes through stages in the pipeline.
class ExecutionDetails {
  /// The summary of the current status of the actions.
  final String summary;

  /// The system-generated unique ID of this action used to identify this job
  /// worker in any external systems, such as AWS CodeDeploy.
  final String externalExecutionId;

  /// The percentage of work completed on the action, represented on a scale of
  /// zero to one hundred percent.
  final int percentComplete;

  ExecutionDetails({
    this.summary,
    this.externalExecutionId,
    this.percentComplete,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The interaction or event that started a pipeline execution.
class ExecutionTrigger {
  /// The type of change-detection method, command, or user interaction that
  /// started a pipeline execution.
  final String triggerType;

  /// Detail related to the event that started a pipeline execution, such as the
  /// webhook ARN of the webhook that triggered the pipeline execution or the
  /// user ARN for a user-initiated `start-pipeline-execution` CLI command.
  final String triggerDetail;

  ExecutionTrigger({
    this.triggerType,
    this.triggerDetail,
  });
  static ExecutionTrigger fromJson(Map<String, dynamic> json) =>
      ExecutionTrigger(
        triggerType: json.containsKey('triggerType')
            ? json['triggerType'] as String
            : null,
        triggerDetail: json.containsKey('triggerDetail')
            ? json['triggerDetail'] as String
            : null,
      );
}

/// Represents information about failure details.
class FailureDetails {
  /// The type of the failure.
  final String type;

  /// The message about the failure.
  final String message;

  /// The external ID of the run of the action that failed.
  final String externalExecutionId;

  FailureDetails({
    @required this.type,
    @required this.message,
    this.externalExecutionId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a `GetJobDetails` action.
class GetJobDetailsOutput {
  /// The details of the job.
  ///
  ///
  ///
  /// If AWSSessionCredentials is used, a long-running job can call
  /// `GetJobDetails` again to obtain new credentials.
  final JobDetails jobDetails;

  GetJobDetailsOutput({
    this.jobDetails,
  });
  static GetJobDetailsOutput fromJson(Map<String, dynamic> json) =>
      GetJobDetailsOutput(
        jobDetails: json.containsKey('jobDetails')
            ? JobDetails.fromJson(json['jobDetails'])
            : null,
      );
}

/// Represents the output of a `GetPipelineExecution` action.
class GetPipelineExecutionOutput {
  /// Represents information about the execution of a pipeline.
  final PipelineExecution pipelineExecution;

  GetPipelineExecutionOutput({
    this.pipelineExecution,
  });
  static GetPipelineExecutionOutput fromJson(Map<String, dynamic> json) =>
      GetPipelineExecutionOutput(
        pipelineExecution: json.containsKey('pipelineExecution')
            ? PipelineExecution.fromJson(json['pipelineExecution'])
            : null,
      );
}

/// Represents the output of a `GetPipeline` action.
class GetPipelineOutput {
  /// Represents the structure of actions and stages to be performed in the
  /// pipeline.
  final PipelineDeclaration pipeline;

  /// Represents the pipeline metadata information returned as part of the
  /// output of a `GetPipeline` action.
  final PipelineMetadata metadata;

  GetPipelineOutput({
    this.pipeline,
    this.metadata,
  });
  static GetPipelineOutput fromJson(Map<String, dynamic> json) =>
      GetPipelineOutput(
        pipeline: json.containsKey('pipeline')
            ? PipelineDeclaration.fromJson(json['pipeline'])
            : null,
        metadata: json.containsKey('metadata')
            ? PipelineMetadata.fromJson(json['metadata'])
            : null,
      );
}

/// Represents the output of a `GetPipelineState` action.
class GetPipelineStateOutput {
  /// The name of the pipeline for which you want to get the state.
  final String pipelineName;

  /// The version number of the pipeline.
  ///
  ///
  ///
  /// A newly-created pipeline is always assigned a version number of `1`.
  final int pipelineVersion;

  /// A list of the pipeline stage output information, including stage name,
  /// state, most recent run details, whether the stage is disabled, and other
  /// data.
  final List<StageState> stageStates;

  /// The date and time the pipeline was created, in timestamp format.
  final DateTime created;

  /// The date and time the pipeline was last updated, in timestamp format.
  final DateTime updated;

  GetPipelineStateOutput({
    this.pipelineName,
    this.pipelineVersion,
    this.stageStates,
    this.created,
    this.updated,
  });
  static GetPipelineStateOutput fromJson(Map<String, dynamic> json) =>
      GetPipelineStateOutput(
        pipelineName: json.containsKey('pipelineName')
            ? json['pipelineName'] as String
            : null,
        pipelineVersion: json.containsKey('pipelineVersion')
            ? json['pipelineVersion'] as int
            : null,
        stageStates: json.containsKey('stageStates')
            ? (json['stageStates'] as List)
                .map((e) => StageState.fromJson(e))
                .toList()
            : null,
        created: json.containsKey('created')
            ? DateTime.parse(json['created'])
            : null,
        updated: json.containsKey('updated')
            ? DateTime.parse(json['updated'])
            : null,
      );
}

/// Represents the output of a `GetThirdPartyJobDetails` action.
class GetThirdPartyJobDetailsOutput {
  /// The details of the job, including any protected values defined for the
  /// job.
  final ThirdPartyJobDetails jobDetails;

  GetThirdPartyJobDetailsOutput({
    this.jobDetails,
  });
  static GetThirdPartyJobDetailsOutput fromJson(Map<String, dynamic> json) =>
      GetThirdPartyJobDetailsOutput(
        jobDetails: json.containsKey('jobDetails')
            ? ThirdPartyJobDetails.fromJson(json['jobDetails'])
            : null,
      );
}

/// Represents information about an artifact to be worked on, such as a test or
/// build artifact.
class InputArtifact {
  /// The name of the artifact to be worked on, for example, "My App".
  ///
  /// The input artifact of an action must exactly match the output artifact
  /// declared in a preceding action, but the input artifact does not have to be
  /// the next action in strict sequence from the action that provided the
  /// output artifact. Actions in parallel can declare different output
  /// artifacts, which are in turn consumed by different following actions.
  final String name;

  InputArtifact({
    @required this.name,
  });
  static InputArtifact fromJson(Map<String, dynamic> json) => InputArtifact(
        name: json['name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about a job.
class Job {
  /// The unique system-generated ID of the job.
  final String id;

  /// Additional data about a job.
  final JobData data;

  /// A system-generated random number that AWS CodePipeline uses to ensure that
  /// the job is being worked on by only one job worker. Use this number in an
  /// AcknowledgeJob request.
  final String nonce;

  /// The ID of the AWS account to use when performing the job.
  final String accountId;

  Job({
    this.id,
    this.data,
    this.nonce,
    this.accountId,
  });
  static Job fromJson(Map<String, dynamic> json) => Job(
        id: json.containsKey('id') ? json['id'] as String : null,
        data: json.containsKey('data') ? JobData.fromJson(json['data']) : null,
        nonce: json.containsKey('nonce') ? json['nonce'] as String : null,
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
      );
}

/// Represents additional information about a job required for a job worker to
/// complete the job.
class JobData {
  /// Represents information about an action type.
  final ActionTypeId actionTypeId;

  /// Represents information about an action configuration.
  final ActionConfiguration actionConfiguration;

  /// Represents information about a pipeline to a job worker.
  ///
  ///
  ///
  /// Includes `pipelineArn` and `pipelineExecutionId` for Custom jobs.
  final PipelineContext pipelineContext;

  /// The artifact supplied to the job.
  final List<Artifact> inputArtifacts;

  /// The output of the job.
  final List<Artifact> outputArtifacts;

  /// Represents an AWS session credentials object. These credentials are
  /// temporary credentials that are issued by AWS Secure Token Service (STS).
  /// They can be used to access input and output artifacts in the Amazon S3
  /// bucket used to store artifacts for the pipeline in AWS CodePipeline.
  final AwsSessionCredentials artifactCredentials;

  /// A system-generated token, such as a AWS CodeDeploy deployment ID, that a
  /// job requires in order to continue the job asynchronously.
  final String continuationToken;

  /// Represents information about the key used to encrypt data in the artifact
  /// store, such as an AWS Key Management Service (AWS KMS) key.
  final EncryptionKey encryptionKey;

  JobData({
    this.actionTypeId,
    this.actionConfiguration,
    this.pipelineContext,
    this.inputArtifacts,
    this.outputArtifacts,
    this.artifactCredentials,
    this.continuationToken,
    this.encryptionKey,
  });
  static JobData fromJson(Map<String, dynamic> json) => JobData(
        actionTypeId: json.containsKey('actionTypeId')
            ? ActionTypeId.fromJson(json['actionTypeId'])
            : null,
        actionConfiguration: json.containsKey('actionConfiguration')
            ? ActionConfiguration.fromJson(json['actionConfiguration'])
            : null,
        pipelineContext: json.containsKey('pipelineContext')
            ? PipelineContext.fromJson(json['pipelineContext'])
            : null,
        inputArtifacts: json.containsKey('inputArtifacts')
            ? (json['inputArtifacts'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
        outputArtifacts: json.containsKey('outputArtifacts')
            ? (json['outputArtifacts'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
        artifactCredentials: json.containsKey('artifactCredentials')
            ? AwsSessionCredentials.fromJson(json['artifactCredentials'])
            : null,
        continuationToken: json.containsKey('continuationToken')
            ? json['continuationToken'] as String
            : null,
        encryptionKey: json.containsKey('encryptionKey')
            ? EncryptionKey.fromJson(json['encryptionKey'])
            : null,
      );
}

/// Represents information about the details of a job.
class JobDetails {
  /// The unique system-generated ID of the job.
  final String id;

  /// Represents additional information about a job required for a job worker to
  /// complete the job.
  final JobData data;

  /// The AWS account ID associated with the job.
  final String accountId;

  JobDetails({
    this.id,
    this.data,
    this.accountId,
  });
  static JobDetails fromJson(Map<String, dynamic> json) => JobDetails(
        id: json.containsKey('id') ? json['id'] as String : null,
        data: json.containsKey('data') ? JobData.fromJson(json['data']) : null,
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
      );
}

class ListActionExecutionsOutput {
  /// The details for a list of recent executions, such as action execution ID.
  final List<ActionExecutionDetail> actionExecutionDetails;

  /// If the amount of returned information is significantly large, an
  /// identifier is also returned and can be used in a subsequent
  /// `ListActionExecutions` call to return the next set of action executions in
  /// the list.
  final String nextToken;

  ListActionExecutionsOutput({
    this.actionExecutionDetails,
    this.nextToken,
  });
  static ListActionExecutionsOutput fromJson(Map<String, dynamic> json) =>
      ListActionExecutionsOutput(
        actionExecutionDetails: json.containsKey('actionExecutionDetails')
            ? (json['actionExecutionDetails'] as List)
                .map((e) => ActionExecutionDetail.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Represents the output of a `ListActionTypes` action.
class ListActionTypesOutput {
  /// Provides details of the action types.
  final List<ActionType> actionTypes;

  /// If the amount of returned information is significantly large, an
  /// identifier is also returned which can be used in a subsequent list action
  /// types call to return the next set of action types in the list.
  final String nextToken;

  ListActionTypesOutput({
    @required this.actionTypes,
    this.nextToken,
  });
  static ListActionTypesOutput fromJson(Map<String, dynamic> json) =>
      ListActionTypesOutput(
        actionTypes: (json['actionTypes'] as List)
            .map((e) => ActionType.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Represents the output of a `ListPipelineExecutions` action.
class ListPipelineExecutionsOutput {
  /// A list of executions in the history of a pipeline.
  final List<PipelineExecutionSummary> pipelineExecutionSummaries;

  /// A token that can be used in the next `ListPipelineExecutions` call. To
  /// view all items in the list, continue to call this operation with each
  /// subsequent token until no more nextToken values are returned.
  final String nextToken;

  ListPipelineExecutionsOutput({
    this.pipelineExecutionSummaries,
    this.nextToken,
  });
  static ListPipelineExecutionsOutput fromJson(Map<String, dynamic> json) =>
      ListPipelineExecutionsOutput(
        pipelineExecutionSummaries:
            json.containsKey('pipelineExecutionSummaries')
                ? (json['pipelineExecutionSummaries'] as List)
                    .map((e) => PipelineExecutionSummary.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Represents the output of a `ListPipelines` action.
class ListPipelinesOutput {
  /// The list of pipelines.
  final List<PipelineSummary> pipelines;

  /// If the amount of returned information is significantly large, an
  /// identifier is also returned which can be used in a subsequent list
  /// pipelines call to return the next set of pipelines in the list.
  final String nextToken;

  ListPipelinesOutput({
    this.pipelines,
    this.nextToken,
  });
  static ListPipelinesOutput fromJson(Map<String, dynamic> json) =>
      ListPipelinesOutput(
        pipelines: json.containsKey('pipelines')
            ? (json['pipelines'] as List)
                .map((e) => PipelineSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceOutput {
  /// The tags for the resource.
  final List<Tag> tags;

  /// If the amount of returned information is significantly large, an
  /// identifier is also returned and can be used in a subsequent API call to
  /// return the next page of the list. However, the ListTagsforResource call
  /// lists all available tags in one call and does not use pagination.
  final String nextToken;

  ListTagsForResourceOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The detail returned for each webhook after listing webhooks, such as the
/// webhook URL, the webhook name, and the webhook ARN.
class ListWebhookItem {
  /// The detail returned for each webhook, such as the webhook authentication
  /// type and filter rules.
  final WebhookDefinition definition;

  /// A unique URL generated by CodePipeline. When a POST request is made to
  /// this URL, the defined pipeline is started as long as the body of the post
  /// request satisfies the defined authentication and filtering conditions.
  /// Deleting and re-creating a webhook will make the old URL invalid and
  /// generate a new URL.
  final String url;

  /// The text of the error message about the webhook.
  final String errorMessage;

  /// The number code of the error.
  final String errorCode;

  /// The date and time a webhook was last successfully triggered, in timestamp
  /// format.
  final DateTime lastTriggered;

  /// The Amazon Resource Name (ARN) of the webhook.
  final String arn;

  /// Specifies the tags applied to the webhook.
  final List<Tag> tags;

  ListWebhookItem({
    @required this.definition,
    @required this.url,
    this.errorMessage,
    this.errorCode,
    this.lastTriggered,
    this.arn,
    this.tags,
  });
  static ListWebhookItem fromJson(Map<String, dynamic> json) => ListWebhookItem(
        definition: WebhookDefinition.fromJson(json['definition']),
        url: json['url'] as String,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        lastTriggered: json.containsKey('lastTriggered')
            ? DateTime.parse(json['lastTriggered'])
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class ListWebhooksOutput {
  /// The JSON detail returned for each webhook in the list output for the
  /// ListWebhooks call.
  final List<ListWebhookItem> webhooks;

  /// If the amount of returned information is significantly large, an
  /// identifier is also returned and can be used in a subsequent ListWebhooks
  /// call to return the next set of webhooks in the list.
  final String nextToken;

  ListWebhooksOutput({
    this.webhooks,
    this.nextToken,
  });
  static ListWebhooksOutput fromJson(Map<String, dynamic> json) =>
      ListWebhooksOutput(
        webhooks: json.containsKey('webhooks')
            ? (json['webhooks'] as List)
                .map((e) => ListWebhookItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents information about the output of an action.
class OutputArtifact {
  /// The name of the output of an artifact, such as "My App".
  ///
  /// The input artifact of an action must exactly match the output artifact
  /// declared in a preceding action, but the input artifact does not have to be
  /// the next action in strict sequence from the action that provided the
  /// output artifact. Actions in parallel can declare different output
  /// artifacts, which are in turn consumed by different following actions.
  ///
  /// Output artifact names must be unique within a pipeline.
  final String name;

  OutputArtifact({
    @required this.name,
  });
  static OutputArtifact fromJson(Map<String, dynamic> json) => OutputArtifact(
        name: json['name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about a pipeline to a job worker.
///
///
///
/// PipelineContext contains `pipelineArn` and `pipelineExecutionId` for custom
/// action jobs. The `pipelineArn` and `pipelineExecutionId` fields are not
/// populated for ThirdParty action jobs.
class PipelineContext {
  /// The name of the pipeline. This is a user-specified value. Pipeline names
  /// must be unique across all pipeline names under an Amazon Web Services
  /// account.
  final String pipelineName;

  /// The stage of the pipeline.
  final StageContext stage;

  /// The context of an action to a job worker within the stage of a pipeline.
  final ActionContext action;

  /// The Amazon Resource Name (ARN) of the pipeline.
  final String pipelineArn;

  /// The execution ID of the pipeline.
  final String pipelineExecutionId;

  PipelineContext({
    this.pipelineName,
    this.stage,
    this.action,
    this.pipelineArn,
    this.pipelineExecutionId,
  });
  static PipelineContext fromJson(Map<String, dynamic> json) => PipelineContext(
        pipelineName: json.containsKey('pipelineName')
            ? json['pipelineName'] as String
            : null,
        stage: json.containsKey('stage')
            ? StageContext.fromJson(json['stage'])
            : null,
        action: json.containsKey('action')
            ? ActionContext.fromJson(json['action'])
            : null,
        pipelineArn: json.containsKey('pipelineArn')
            ? json['pipelineArn'] as String
            : null,
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
      );
}

/// Represents the structure of actions and stages to be performed in the
/// pipeline.
class PipelineDeclaration {
  /// The name of the action to be performed.
  final String name;

  /// The Amazon Resource Name (ARN) for AWS CodePipeline to use to either
  /// perform actions with no `actionRoleArn`, or to use to assume roles for
  /// actions with an `actionRoleArn`.
  final String roleArn;

  /// Represents information about the Amazon S3 bucket where artifacts are
  /// stored for the pipeline.
  ///
  ///
  ///
  /// You must include either `artifactStore` or `artifactStores` in your
  /// pipeline, but you cannot use both. If you create a cross-region action in
  /// your pipeline, you must use `artifactStores`.
  final ArtifactStore artifactStore;

  /// A mapping of `artifactStore` objects and their corresponding regions.
  /// There must be an artifact store for the pipeline region and for each
  /// cross-region action within the pipeline.
  ///
  ///
  ///
  /// You must include either `artifactStore` or `artifactStores` in your
  /// pipeline, but you cannot use both. If you create a cross-region action in
  /// your pipeline, you must use `artifactStores`.
  final Map<String, ArtifactStore> artifactStores;

  /// The stage in which to perform the action.
  final List<StageDeclaration> stages;

  /// The version number of the pipeline. A new pipeline always has a version
  /// number of 1. This number is automatically incremented when a pipeline is
  /// updated.
  final int version;

  PipelineDeclaration({
    @required this.name,
    @required this.roleArn,
    this.artifactStore,
    this.artifactStores,
    @required this.stages,
    this.version,
  });
  static PipelineDeclaration fromJson(Map<String, dynamic> json) =>
      PipelineDeclaration(
        name: json['name'] as String,
        roleArn: json['roleArn'] as String,
        artifactStore: json.containsKey('artifactStore')
            ? ArtifactStore.fromJson(json['artifactStore'])
            : null,
        artifactStores: json.containsKey('artifactStores')
            ? (json['artifactStores'] as Map)
                .map((k, v) => MapEntry(k as String, ArtifactStore.fromJson(v)))
            : null,
        stages: (json['stages'] as List)
            .map((e) => StageDeclaration.fromJson(e))
            .toList(),
        version: json.containsKey('version') ? json['version'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about an execution of a pipeline.
class PipelineExecution {
  /// The name of the pipeline that was executed.
  final String pipelineName;

  /// The version number of the pipeline that was executed.
  final int pipelineVersion;

  /// The ID of the pipeline execution.
  final String pipelineExecutionId;

  /// The status of the pipeline execution.
  ///
  /// *   InProgress: The pipeline execution is currently running.
  ///
  /// *   Succeeded: The pipeline execution was completed successfully.
  ///
  /// *   Superseded: While this pipeline execution was waiting for the next
  /// stage to be completed, a newer pipeline execution advanced and continued
  /// through the pipeline instead.
  ///
  /// *   Failed: The pipeline execution was not completed successfully.
  final String status;

  /// A list of `ArtifactRevision` objects included in a pipeline execution.
  final List<ArtifactRevision> artifactRevisions;

  PipelineExecution({
    this.pipelineName,
    this.pipelineVersion,
    this.pipelineExecutionId,
    this.status,
    this.artifactRevisions,
  });
  static PipelineExecution fromJson(Map<String, dynamic> json) =>
      PipelineExecution(
        pipelineName: json.containsKey('pipelineName')
            ? json['pipelineName'] as String
            : null,
        pipelineVersion: json.containsKey('pipelineVersion')
            ? json['pipelineVersion'] as int
            : null,
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        artifactRevisions: json.containsKey('artifactRevisions')
            ? (json['artifactRevisions'] as List)
                .map((e) => ArtifactRevision.fromJson(e))
                .toList()
            : null,
      );
}

/// Summary information about a pipeline execution.
class PipelineExecutionSummary {
  /// The ID of the pipeline execution.
  final String pipelineExecutionId;

  /// The status of the pipeline execution.
  ///
  /// *   InProgress: The pipeline execution is currently running.
  ///
  /// *   Succeeded: The pipeline execution was completed successfully.
  ///
  /// *   Superseded: While this pipeline execution was waiting for the next
  /// stage to be completed, a newer pipeline execution advanced and continued
  /// through the pipeline instead.
  ///
  /// *   Failed: The pipeline execution was not completed successfully.
  final String status;

  /// The date and time when the pipeline execution began, in timestamp format.
  final DateTime startTime;

  /// The date and time of the last change to the pipeline execution, in
  /// timestamp format.
  final DateTime lastUpdateTime;

  /// A list of the source artifact revisions that initiated a pipeline
  /// execution.
  final List<SourceRevision> sourceRevisions;

  /// The interaction or event that started a pipeline execution, such as
  /// automated change detection or a `StartPipelineExecution` API call.
  final ExecutionTrigger trigger;

  PipelineExecutionSummary({
    this.pipelineExecutionId,
    this.status,
    this.startTime,
    this.lastUpdateTime,
    this.sourceRevisions,
    this.trigger,
  });
  static PipelineExecutionSummary fromJson(Map<String, dynamic> json) =>
      PipelineExecutionSummary(
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        lastUpdateTime: json.containsKey('lastUpdateTime')
            ? DateTime.parse(json['lastUpdateTime'])
            : null,
        sourceRevisions: json.containsKey('sourceRevisions')
            ? (json['sourceRevisions'] as List)
                .map((e) => SourceRevision.fromJson(e))
                .toList()
            : null,
        trigger: json.containsKey('trigger')
            ? ExecutionTrigger.fromJson(json['trigger'])
            : null,
      );
}

/// Information about a pipeline.
class PipelineMetadata {
  /// The Amazon Resource Name (ARN) of the pipeline.
  final String pipelineArn;

  /// The date and time the pipeline was created, in timestamp format.
  final DateTime created;

  /// The date and time the pipeline was last updated, in timestamp format.
  final DateTime updated;

  PipelineMetadata({
    this.pipelineArn,
    this.created,
    this.updated,
  });
  static PipelineMetadata fromJson(Map<String, dynamic> json) =>
      PipelineMetadata(
        pipelineArn: json.containsKey('pipelineArn')
            ? json['pipelineArn'] as String
            : null,
        created: json.containsKey('created')
            ? DateTime.parse(json['created'])
            : null,
        updated: json.containsKey('updated')
            ? DateTime.parse(json['updated'])
            : null,
      );
}

/// Returns a summary of a pipeline.
class PipelineSummary {
  /// The name of the pipeline.
  final String name;

  /// The version number of the pipeline.
  final int version;

  /// The date and time the pipeline was created, in timestamp format.
  final DateTime created;

  /// The date and time of the last update to the pipeline, in timestamp format.
  final DateTime updated;

  PipelineSummary({
    this.name,
    this.version,
    this.created,
    this.updated,
  });
  static PipelineSummary fromJson(Map<String, dynamic> json) => PipelineSummary(
        name: json.containsKey('name') ? json['name'] as String : null,
        version: json.containsKey('version') ? json['version'] as int : null,
        created: json.containsKey('created')
            ? DateTime.parse(json['created'])
            : null,
        updated: json.containsKey('updated')
            ? DateTime.parse(json['updated'])
            : null,
      );
}

/// Represents the output of a `PollForJobs` action.
class PollForJobsOutput {
  /// Information about the jobs to take action on.
  final List<Job> jobs;

  PollForJobsOutput({
    this.jobs,
  });
  static PollForJobsOutput fromJson(Map<String, dynamic> json) =>
      PollForJobsOutput(
        jobs: json.containsKey('jobs')
            ? (json['jobs'] as List).map((e) => Job.fromJson(e)).toList()
            : null,
      );
}

/// Represents the output of a `PollForThirdPartyJobs` action.
class PollForThirdPartyJobsOutput {
  /// Information about the jobs to take action on.
  final List<ThirdPartyJob> jobs;

  PollForThirdPartyJobsOutput({
    this.jobs,
  });
  static PollForThirdPartyJobsOutput fromJson(Map<String, dynamic> json) =>
      PollForThirdPartyJobsOutput(
        jobs: json.containsKey('jobs')
            ? (json['jobs'] as List)
                .map((e) => ThirdPartyJob.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the output of a `PutActionRevision` action.
class PutActionRevisionOutput {
  /// Indicates whether the artifact revision was previously used in an
  /// execution of the specified pipeline.
  final bool newRevision;

  /// The ID of the current workflow state of the pipeline.
  final String pipelineExecutionId;

  PutActionRevisionOutput({
    this.newRevision,
    this.pipelineExecutionId,
  });
  static PutActionRevisionOutput fromJson(Map<String, dynamic> json) =>
      PutActionRevisionOutput(
        newRevision: json.containsKey('newRevision')
            ? json['newRevision'] as bool
            : null,
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
      );
}

/// Represents the output of a `PutApprovalResult` action.
class PutApprovalResultOutput {
  /// The timestamp showing when the approval or rejection was submitted.
  final DateTime approvedAt;

  PutApprovalResultOutput({
    this.approvedAt,
  });
  static PutApprovalResultOutput fromJson(Map<String, dynamic> json) =>
      PutApprovalResultOutput(
        approvedAt: json.containsKey('approvedAt')
            ? DateTime.parse(json['approvedAt'])
            : null,
      );
}

class PutWebhookOutput {
  /// The detail returned from creating the webhook, such as the webhook name,
  /// webhook URL, and webhook ARN.
  final ListWebhookItem webhook;

  PutWebhookOutput({
    this.webhook,
  });
  static PutWebhookOutput fromJson(Map<String, dynamic> json) =>
      PutWebhookOutput(
        webhook: json.containsKey('webhook')
            ? ListWebhookItem.fromJson(json['webhook'])
            : null,
      );
}

class RegisterWebhookWithThirdPartyOutput {
  RegisterWebhookWithThirdPartyOutput();
  static RegisterWebhookWithThirdPartyOutput fromJson(
          Map<String, dynamic> json) =>
      RegisterWebhookWithThirdPartyOutput();
}

/// Represents the output of a `RetryStageExecution` action.
class RetryStageExecutionOutput {
  /// The ID of the current workflow execution in the failed stage.
  final String pipelineExecutionId;

  RetryStageExecutionOutput({
    this.pipelineExecutionId,
  });
  static RetryStageExecutionOutput fromJson(Map<String, dynamic> json) =>
      RetryStageExecutionOutput(
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
      );
}

/// The location of the Amazon S3 bucket that contains a revision.
class S3ArtifactLocation {
  /// The name of the Amazon S3 bucket.
  final String bucketName;

  /// The key of the object in the Amazon S3 bucket, which uniquely identifies
  /// the object in the bucket.
  final String objectKey;

  S3ArtifactLocation({
    @required this.bucketName,
    @required this.objectKey,
  });
  static S3ArtifactLocation fromJson(Map<String, dynamic> json) =>
      S3ArtifactLocation(
        bucketName: json['bucketName'] as String,
        objectKey: json['objectKey'] as String,
      );
}

/// The Amazon S3 artifact location for an action's artifacts.
class S3Location {
  /// The Amazon S3 artifact bucket for an action's artifacts.
  final String bucket;

  /// The artifact name.
  final String key;

  S3Location({
    this.bucket,
    this.key,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location(
        bucket: json.containsKey('bucket') ? json['bucket'] as String : null,
        key: json.containsKey('key') ? json['key'] as String : null,
      );
}

/// Information about the version (or revision) of a source artifact that
/// initiated a pipeline execution.
class SourceRevision {
  /// The name of the action that processed the revision to the source artifact.
  final String actionName;

  /// The system-generated unique ID that identifies the revision number of the
  /// artifact.
  final String revisionId;

  /// Summary information about the most recent revision of the artifact. For
  /// GitHub and AWS CodeCommit repositories, the commit message. For Amazon S3
  /// buckets or actions, the user-provided content of a
  /// `codepipeline-artifact-revision-summary` key specified in the object
  /// metadata.
  final String revisionSummary;

  /// The commit ID for the artifact revision. For artifacts stored in GitHub or
  /// AWS CodeCommit repositories, the commit ID is linked to a commit details
  /// page.
  final String revisionUrl;

  SourceRevision({
    @required this.actionName,
    this.revisionId,
    this.revisionSummary,
    this.revisionUrl,
  });
  static SourceRevision fromJson(Map<String, dynamic> json) => SourceRevision(
        actionName: json['actionName'] as String,
        revisionId: json.containsKey('revisionId')
            ? json['revisionId'] as String
            : null,
        revisionSummary: json.containsKey('revisionSummary')
            ? json['revisionSummary'] as String
            : null,
        revisionUrl: json.containsKey('revisionUrl')
            ? json['revisionUrl'] as String
            : null,
      );
}

/// Represents information about a stage to a job worker.
class StageContext {
  /// The name of the stage.
  final String name;

  StageContext({
    this.name,
  });
  static StageContext fromJson(Map<String, dynamic> json) => StageContext(
        name: json.containsKey('name') ? json['name'] as String : null,
      );
}

/// Represents information about a stage and its definition.
class StageDeclaration {
  /// The name of the stage.
  final String name;

  /// Reserved for future use.
  final List<BlockerDeclaration> blockers;

  /// The actions included in a stage.
  final List<ActionDeclaration> actions;

  StageDeclaration({
    @required this.name,
    this.blockers,
    @required this.actions,
  });
  static StageDeclaration fromJson(Map<String, dynamic> json) =>
      StageDeclaration(
        name: json['name'] as String,
        blockers: json.containsKey('blockers')
            ? (json['blockers'] as List)
                .map((e) => BlockerDeclaration.fromJson(e))
                .toList()
            : null,
        actions: (json['actions'] as List)
            .map((e) => ActionDeclaration.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about the run of a stage.
class StageExecution {
  /// The ID of the pipeline execution associated with the stage.
  final String pipelineExecutionId;

  /// The status of the stage, or for a completed stage, the last status of the
  /// stage.
  final String status;

  StageExecution({
    @required this.pipelineExecutionId,
    @required this.status,
  });
  static StageExecution fromJson(Map<String, dynamic> json) => StageExecution(
        pipelineExecutionId: json['pipelineExecutionId'] as String,
        status: json['status'] as String,
      );
}

/// Represents information about the state of the stage.
class StageState {
  /// The name of the stage.
  final String stageName;

  /// The state of the inbound transition, which is either enabled or disabled.
  final TransitionState inboundTransitionState;

  /// The state of the stage.
  final List<ActionState> actionStates;

  /// Information about the latest execution in the stage, including its ID and
  /// status.
  final StageExecution latestExecution;

  StageState({
    this.stageName,
    this.inboundTransitionState,
    this.actionStates,
    this.latestExecution,
  });
  static StageState fromJson(Map<String, dynamic> json) => StageState(
        stageName:
            json.containsKey('stageName') ? json['stageName'] as String : null,
        inboundTransitionState: json.containsKey('inboundTransitionState')
            ? TransitionState.fromJson(json['inboundTransitionState'])
            : null,
        actionStates: json.containsKey('actionStates')
            ? (json['actionStates'] as List)
                .map((e) => ActionState.fromJson(e))
                .toList()
            : null,
        latestExecution: json.containsKey('latestExecution')
            ? StageExecution.fromJson(json['latestExecution'])
            : null,
      );
}

/// Represents the output of a `StartPipelineExecution` action.
class StartPipelineExecutionOutput {
  /// The unique system-generated ID of the pipeline execution that was started.
  final String pipelineExecutionId;

  StartPipelineExecutionOutput({
    this.pipelineExecutionId,
  });
  static StartPipelineExecutionOutput fromJson(Map<String, dynamic> json) =>
      StartPipelineExecutionOutput(
        pipelineExecutionId: json.containsKey('pipelineExecutionId')
            ? json['pipelineExecutionId'] as String
            : null,
      );
}

/// A tag is a key/value pair that is used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['key'] as String,
        value: json['value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

/// A response to a `PollForThirdPartyJobs` request returned by AWS CodePipeline
/// when there is a job to be worked upon by a partner action.
class ThirdPartyJob {
  /// The `clientToken` portion of the `clientId` and `clientToken` pair used to
  /// verify that the calling entity is allowed access to the job and its
  /// details.
  final String clientId;

  /// The identifier used to identify the job in AWS CodePipeline.
  final String jobId;

  ThirdPartyJob({
    this.clientId,
    this.jobId,
  });
  static ThirdPartyJob fromJson(Map<String, dynamic> json) => ThirdPartyJob(
        clientId:
            json.containsKey('clientId') ? json['clientId'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
      );
}

/// Represents information about the job data for a partner action.
class ThirdPartyJobData {
  /// Represents information about an action type.
  final ActionTypeId actionTypeId;

  /// Represents information about an action configuration.
  final ActionConfiguration actionConfiguration;

  /// Represents information about a pipeline to a job worker.
  ///
  ///
  ///
  /// Does not include `pipelineArn` and `pipelineExecutionId` for ThirdParty
  /// jobs.
  final PipelineContext pipelineContext;

  /// The name of the artifact that will be worked upon by the action, if any.
  /// This name might be system-generated, such as "MyApp", or might be defined
  /// by the user when the action is created. The input artifact name must match
  /// the name of an output artifact generated by an action in an earlier action
  /// or stage of the pipeline.
  final List<Artifact> inputArtifacts;

  /// The name of the artifact that will be the result of the action, if any.
  /// This name might be system-generated, such as "MyBuiltApp", or might be
  /// defined by the user when the action is created.
  final List<Artifact> outputArtifacts;

  /// Represents an AWS session credentials object. These credentials are
  /// temporary credentials that are issued by AWS Secure Token Service (STS).
  /// They can be used to access input and output artifacts in the Amazon S3
  /// bucket used to store artifact for the pipeline in AWS CodePipeline.
  final AwsSessionCredentials artifactCredentials;

  /// A system-generated token, such as a AWS CodeDeploy deployment ID, that a
  /// job requires in order to continue the job asynchronously.
  final String continuationToken;

  /// The encryption key used to encrypt and decrypt data in the artifact store
  /// for the pipeline, such as an AWS Key Management Service (AWS KMS) key.
  /// This is optional and might not be present.
  final EncryptionKey encryptionKey;

  ThirdPartyJobData({
    this.actionTypeId,
    this.actionConfiguration,
    this.pipelineContext,
    this.inputArtifacts,
    this.outputArtifacts,
    this.artifactCredentials,
    this.continuationToken,
    this.encryptionKey,
  });
  static ThirdPartyJobData fromJson(Map<String, dynamic> json) =>
      ThirdPartyJobData(
        actionTypeId: json.containsKey('actionTypeId')
            ? ActionTypeId.fromJson(json['actionTypeId'])
            : null,
        actionConfiguration: json.containsKey('actionConfiguration')
            ? ActionConfiguration.fromJson(json['actionConfiguration'])
            : null,
        pipelineContext: json.containsKey('pipelineContext')
            ? PipelineContext.fromJson(json['pipelineContext'])
            : null,
        inputArtifacts: json.containsKey('inputArtifacts')
            ? (json['inputArtifacts'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
        outputArtifacts: json.containsKey('outputArtifacts')
            ? (json['outputArtifacts'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
        artifactCredentials: json.containsKey('artifactCredentials')
            ? AwsSessionCredentials.fromJson(json['artifactCredentials'])
            : null,
        continuationToken: json.containsKey('continuationToken')
            ? json['continuationToken'] as String
            : null,
        encryptionKey: json.containsKey('encryptionKey')
            ? EncryptionKey.fromJson(json['encryptionKey'])
            : null,
      );
}

/// The details of a job sent in response to a `GetThirdPartyJobDetails`
/// request.
class ThirdPartyJobDetails {
  /// The identifier used to identify the job details in AWS CodePipeline.
  final String id;

  /// The data to be returned by the third party job worker.
  final ThirdPartyJobData data;

  /// A system-generated random number that AWS CodePipeline uses to ensure that
  /// the job is being worked on by only one job worker. Use this number in an
  /// AcknowledgeThirdPartyJob request.
  final String nonce;

  ThirdPartyJobDetails({
    this.id,
    this.data,
    this.nonce,
  });
  static ThirdPartyJobDetails fromJson(Map<String, dynamic> json) =>
      ThirdPartyJobDetails(
        id: json.containsKey('id') ? json['id'] as String : null,
        data: json.containsKey('data')
            ? ThirdPartyJobData.fromJson(json['data'])
            : null,
        nonce: json.containsKey('nonce') ? json['nonce'] as String : null,
      );
}

/// Represents information about the state of transitions between one stage and
/// another stage.
class TransitionState {
  /// Whether the transition between stages is enabled (true) or disabled
  /// (false).
  final bool enabled;

  /// The ID of the user who last changed the transition state.
  final String lastChangedBy;

  /// The timestamp when the transition state was last changed.
  final DateTime lastChangedAt;

  /// The user-specified reason why the transition between two stages of a
  /// pipeline was disabled.
  final String disabledReason;

  TransitionState({
    this.enabled,
    this.lastChangedBy,
    this.lastChangedAt,
    this.disabledReason,
  });
  static TransitionState fromJson(Map<String, dynamic> json) => TransitionState(
        enabled: json.containsKey('enabled') ? json['enabled'] as bool : null,
        lastChangedBy: json.containsKey('lastChangedBy')
            ? json['lastChangedBy'] as String
            : null,
        lastChangedAt: json.containsKey('lastChangedAt')
            ? DateTime.parse(json['lastChangedAt'])
            : null,
        disabledReason: json.containsKey('disabledReason')
            ? json['disabledReason'] as String
            : null,
      );
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}

/// Represents the output of an `UpdatePipeline` action.
class UpdatePipelineOutput {
  /// The structure of the updated pipeline.
  final PipelineDeclaration pipeline;

  UpdatePipelineOutput({
    this.pipeline,
  });
  static UpdatePipelineOutput fromJson(Map<String, dynamic> json) =>
      UpdatePipelineOutput(
        pipeline: json.containsKey('pipeline')
            ? PipelineDeclaration.fromJson(json['pipeline'])
            : null,
      );
}

/// The authentication applied to incoming webhook trigger requests.
class WebhookAuthConfiguration {
  /// The property used to configure acceptance of webhooks within a specific IP
  /// range. For IP, only the `AllowedIPRange` property must be set, and this
  /// property must be set to a valid CIDR range.
  final String allowedIPRange;

  /// The property used to configure GitHub authentication. For GITHUB_HMAC,
  /// only the `SecretToken` property must be set.
  final String secretToken;

  WebhookAuthConfiguration({
    this.allowedIPRange,
    this.secretToken,
  });
  static WebhookAuthConfiguration fromJson(Map<String, dynamic> json) =>
      WebhookAuthConfiguration(
        allowedIPRange: json.containsKey('AllowedIPRange')
            ? json['AllowedIPRange'] as String
            : null,
        secretToken: json.containsKey('SecretToken')
            ? json['SecretToken'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents information about a webhook and its definition.
class WebhookDefinition {
  /// The name of the webhook.
  final String name;

  /// The name of the pipeline you want to connect to the webhook.
  final String targetPipeline;

  /// The name of the action in a pipeline you want to connect to the webhook.
  /// The action must be from the source (first) stage of the pipeline.
  final String targetAction;

  /// A list of rules applied to the body/payload sent in the POST request to a
  /// webhook URL. All defined rules must pass for the request to be accepted
  /// and the pipeline started.
  final List<WebhookFilterRule> filters;

  /// Supported options are GITHUB_HMAC, IP and UNAUTHENTICATED.
  ///
  /// *   For information about the authentication scheme implemented by
  /// GITHUB_HMAC, see
  /// [Securing your webhooks](https://developer.github.com/webhooks/securing/)
  /// on the GitHub Developer website.
  ///
  /// *    IP will reject webhooks trigger requests unless they originate from
  /// an IP within the IP range whitelisted in the authentication configuration.
  ///
  /// *    UNAUTHENTICATED will accept all webhook trigger requests regardless
  /// of origin.
  final String authentication;

  /// Properties that configure the authentication applied to incoming webhook
  /// trigger requests. The required properties depend on the authentication
  /// type. For GITHUB_HMAC, only the `SecretToken` property must be set. For
  /// IP, only the `AllowedIPRange` property must be set to a valid CIDR range.
  /// For UNAUTHENTICATED, no properties can be set.
  final WebhookAuthConfiguration authenticationConfiguration;

  WebhookDefinition({
    @required this.name,
    @required this.targetPipeline,
    @required this.targetAction,
    @required this.filters,
    @required this.authentication,
    @required this.authenticationConfiguration,
  });
  static WebhookDefinition fromJson(Map<String, dynamic> json) =>
      WebhookDefinition(
        name: json['name'] as String,
        targetPipeline: json['targetPipeline'] as String,
        targetAction: json['targetAction'] as String,
        filters: (json['filters'] as List)
            .map((e) => WebhookFilterRule.fromJson(e))
            .toList(),
        authentication: json['authentication'] as String,
        authenticationConfiguration: WebhookAuthConfiguration.fromJson(
            json['authenticationConfiguration']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The event criteria that specify when a webhook notification is sent to your
/// URL.
class WebhookFilterRule {
  /// A JsonPath expression that will be applied to the body/payload of the
  /// webhook. The value selected by the JsonPath expression must match the
  /// value specified in the `MatchEquals` field, otherwise the request will be
  /// ignored. For more information about JsonPath expressions, see
  /// [Java JsonPath implementation](https://github.com/json-path/JsonPath) in
  /// GitHub.
  final String jsonPath;

  /// The value selected by the `JsonPath` expression must match what is
  /// supplied in the `MatchEquals` field, otherwise the request will be
  /// ignored. Properties from the target action configuration can be included
  /// as placeholders in this value by surrounding the action configuration key
  /// with curly braces. For example, if the value supplied here is
  /// "refs/heads/{Branch}" and the target action has an action configuration
  /// property called "Branch" with a value of "master", the `MatchEquals` value
  /// will be evaluated as "refs/heads/master". For a list of action
  /// configuration properties for built-in action types, see
  /// [Pipeline Structure Reference Action Requirements](https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html#action-requirements).
  final String matchEquals;

  WebhookFilterRule({
    @required this.jsonPath,
    this.matchEquals,
  });
  static WebhookFilterRule fromJson(Map<String, dynamic> json) =>
      WebhookFilterRule(
        jsonPath: json['jsonPath'] as String,
        matchEquals: json.containsKey('matchEquals')
            ? json['matchEquals'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
