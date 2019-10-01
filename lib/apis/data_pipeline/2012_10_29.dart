import 'package:meta/meta.dart';

/// AWS Data Pipeline configures and manages a data-driven workflow called a
/// pipeline. AWS Data Pipeline handles the details of scheduling and ensuring
/// that data dependencies are met so that your application can focus on
/// processing the data.
///
/// AWS Data Pipeline provides a JAR implementation of a task runner called AWS
/// Data Pipeline Task Runner. AWS Data Pipeline Task Runner provides logic for
/// common data management scenarios, such as performing database queries and
/// running data analysis using Amazon Elastic MapReduce (Amazon EMR). You can
/// use AWS Data Pipeline Task Runner as your task runner, or you can write your
/// own task runner to provide custom data management.
///
/// AWS Data Pipeline implements two main sets of functionality. Use the first
/// set to create a pipeline and define data sources, schedules, dependencies,
/// and the transforms to be performed on the data. Use the second set in your
/// task runner application to receive the next task ready for processing. The
/// logic for performing the task, such as querying the data, running data
/// analysis, or converting the data from one format to another, is contained
/// within the task runner. The task runner performs the task assigned to it by
/// the web service, reporting progress to the web service as it does so. When
/// the task is done, the task runner reports the final success or failure of
/// the task to the web service.
class DataPipelineApi {
  final _client;
  DataPipelineApi(client)
      : _client = client.configured('Data Pipeline', serializer: 'json');

  /// Validates the specified pipeline and starts processing pipeline tasks. If
  /// the pipeline does not pass validation, activation fails.
  ///
  /// If you need to pause the pipeline to investigate an issue with a
  /// component, such as a data source or script, call DeactivatePipeline.
  ///
  /// To activate a finished pipeline, modify the end date for the pipeline and
  /// then activate it.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [parameterValues]: A list of parameter values to pass to the pipeline at
  /// activation.
  ///
  /// [startTimestamp]: The date and time to resume the pipeline. By default,
  /// the pipeline resumes from the last completed execution.
  Future<ActivatePipelineOutput> activatePipeline(String pipelineId,
      {List<ParameterValue> parameterValues, DateTime startTimestamp}) async {
    var response_ = await _client.send('ActivatePipeline', {
      'pipelineId': pipelineId,
      if (parameterValues != null) 'parameterValues': parameterValues,
      if (startTimestamp != null) 'startTimestamp': startTimestamp,
    });
    return ActivatePipelineOutput.fromJson(response_);
  }

  /// Adds or modifies tags for the specified pipeline.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [tags]: The tags to add, as key/value pairs.
  Future<AddTagsOutput> addTags(
      {@required String pipelineId, @required List<Tag> tags}) async {
    var response_ = await _client.send('AddTags', {
      'pipelineId': pipelineId,
      'tags': tags,
    });
    return AddTagsOutput.fromJson(response_);
  }

  /// Creates a new, empty pipeline. Use PutPipelineDefinition to populate the
  /// pipeline.
  ///
  /// [name]: The name for the pipeline. You can use the same name for multiple
  /// pipelines associated with your AWS account, because AWS Data Pipeline
  /// assigns each pipeline a unique pipeline identifier.
  ///
  /// [uniqueId]: A unique identifier. This identifier is not the same as the
  /// pipeline identifier assigned by AWS Data Pipeline. You are responsible for
  /// defining the format and ensuring the uniqueness of this identifier. You
  /// use this parameter to ensure idempotency during repeated calls to
  /// `CreatePipeline`. For example, if the first call to `CreatePipeline` does
  /// not succeed, you can pass in the same unique identifier and pipeline name
  /// combination on a subsequent call to `CreatePipeline`. `CreatePipeline`
  /// ensures that if a pipeline already exists with the same name and unique
  /// identifier, a new pipeline is not created. Instead, you'll receive the
  /// pipeline identifier from the previous attempt. The uniqueness of the name
  /// and unique identifier combination is scoped to the AWS account or IAM user
  /// credentials.
  ///
  /// [description]: The description for the pipeline.
  ///
  /// [tags]: A list of tags to associate with the pipeline at creation. Tags
  /// let you control access to pipelines. For more information, see
  /// [Controlling User Access to Pipelines](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html)
  /// in the _AWS Data Pipeline Developer Guide_.
  Future<CreatePipelineOutput> createPipeline(
      {@required String name,
      @required String uniqueId,
      String description,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreatePipeline', {
      'name': name,
      'uniqueId': uniqueId,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    });
    return CreatePipelineOutput.fromJson(response_);
  }

  /// Deactivates the specified running pipeline. The pipeline is set to the
  /// `DEACTIVATING` state until the deactivation process completes.
  ///
  /// To resume a deactivated pipeline, use ActivatePipeline. By default, the
  /// pipeline resumes from the last completed execution. Optionally, you can
  /// specify the date and time to resume the pipeline.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [cancelActive]: Indicates whether to cancel any running objects. The
  /// default is true, which sets the state of any running objects to
  /// `CANCELED`. If this value is false, the pipeline is deactivated after all
  /// running objects finish.
  Future<DeactivatePipelineOutput> deactivatePipeline(String pipelineId,
      {bool cancelActive}) async {
    var response_ = await _client.send('DeactivatePipeline', {
      'pipelineId': pipelineId,
      if (cancelActive != null) 'cancelActive': cancelActive,
    });
    return DeactivatePipelineOutput.fromJson(response_);
  }

  /// Deletes a pipeline, its pipeline definition, and its run history. AWS Data
  /// Pipeline attempts to cancel instances associated with the pipeline that
  /// are currently being processed by task runners.
  ///
  /// Deleting a pipeline cannot be undone. You cannot query or restore a
  /// deleted pipeline. To temporarily pause a pipeline instead of deleting it,
  /// call SetStatus with the status set to `PAUSE` on individual components.
  /// Components that are paused by SetStatus can be resumed.
  ///
  /// [pipelineId]: The ID of the pipeline.
  Future<void> deletePipeline(String pipelineId) async {
    await _client.send('DeletePipeline', {
      'pipelineId': pipelineId,
    });
  }

  /// Gets the object definitions for a set of objects associated with the
  /// pipeline. Object definitions are composed of a set of fields that define
  /// the properties of the object.
  ///
  /// [pipelineId]: The ID of the pipeline that contains the object definitions.
  ///
  /// [objectIds]: The IDs of the pipeline objects that contain the definitions
  /// to be described. You can pass as many as 25 identifiers in a single call
  /// to `DescribeObjects`.
  ///
  /// [evaluateExpressions]: Indicates whether any expressions in the object
  /// should be evaluated when the object descriptions are returned.
  ///
  /// [marker]: The starting point for the results to be returned. For the first
  /// call, this value should be empty. As long as there are more results,
  /// continue to call `DescribeObjects` with the marker value from the previous
  /// call to retrieve the next set of results.
  Future<DescribeObjectsOutput> describeObjects(
      {@required String pipelineId,
      @required List<String> objectIds,
      bool evaluateExpressions,
      String marker}) async {
    var response_ = await _client.send('DescribeObjects', {
      'pipelineId': pipelineId,
      'objectIds': objectIds,
      if (evaluateExpressions != null)
        'evaluateExpressions': evaluateExpressions,
      if (marker != null) 'marker': marker,
    });
    return DescribeObjectsOutput.fromJson(response_);
  }

  /// Retrieves metadata about one or more pipelines. The information retrieved
  /// includes the name of the pipeline, the pipeline identifier, its current
  /// state, and the user account that owns the pipeline. Using account
  /// credentials, you can retrieve metadata about pipelines that you or your
  /// IAM users have created. If you are using an IAM user account, you can
  /// retrieve metadata about only those pipelines for which you have read
  /// permissions.
  ///
  /// To retrieve the full pipeline definition instead of metadata about the
  /// pipeline, call GetPipelineDefinition.
  ///
  /// [pipelineIds]: The IDs of the pipelines to describe. You can pass as many
  /// as 25 identifiers in a single call. To obtain pipeline IDs, call
  /// ListPipelines.
  Future<DescribePipelinesOutput> describePipelines(
      List<String> pipelineIds) async {
    var response_ = await _client.send('DescribePipelines', {
      'pipelineIds': pipelineIds,
    });
    return DescribePipelinesOutput.fromJson(response_);
  }

  /// Task runners call `EvaluateExpression` to evaluate a string in the context
  /// of the specified object. For example, a task runner can evaluate SQL
  /// queries stored in Amazon S3.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [objectId]: The ID of the object.
  ///
  /// [expression]: The expression to evaluate.
  Future<EvaluateExpressionOutput> evaluateExpression(
      {@required String pipelineId,
      @required String objectId,
      @required String expression}) async {
    var response_ = await _client.send('EvaluateExpression', {
      'pipelineId': pipelineId,
      'objectId': objectId,
      'expression': expression,
    });
    return EvaluateExpressionOutput.fromJson(response_);
  }

  /// Gets the definition of the specified pipeline. You can call
  /// `GetPipelineDefinition` to retrieve the pipeline definition that you
  /// provided using PutPipelineDefinition.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [version]: The version of the pipeline definition to retrieve. Set this
  /// parameter to `latest` (default) to use the last definition saved to the
  /// pipeline or `active` to use the last definition that was activated.
  Future<GetPipelineDefinitionOutput> getPipelineDefinition(String pipelineId,
      {String version}) async {
    var response_ = await _client.send('GetPipelineDefinition', {
      'pipelineId': pipelineId,
      if (version != null) 'version': version,
    });
    return GetPipelineDefinitionOutput.fromJson(response_);
  }

  /// Lists the pipeline identifiers for all active pipelines that you have
  /// permission to access.
  ///
  /// [marker]: The starting point for the results to be returned. For the first
  /// call, this value should be empty. As long as there are more results,
  /// continue to call `ListPipelines` with the marker value from the previous
  /// call to retrieve the next set of results.
  Future<ListPipelinesOutput> listPipelines({String marker}) async {
    var response_ = await _client.send('ListPipelines', {
      if (marker != null) 'marker': marker,
    });
    return ListPipelinesOutput.fromJson(response_);
  }

  /// Task runners call `PollForTask` to receive a task to perform from AWS Data
  /// Pipeline. The task runner specifies which tasks it can perform by setting
  /// a value for the `workerGroup` parameter. The task returned can come from
  /// any of the pipelines that match the `workerGroup` value passed in by the
  /// task runner and that was launched using the IAM user credentials specified
  /// by the task runner.
  ///
  /// If tasks are ready in the work queue, `PollForTask` returns a response
  /// immediately. If no tasks are available in the queue, `PollForTask` uses
  /// long-polling and holds on to a poll connection for up to a 90 seconds,
  /// during which time the first newly scheduled task is handed to the task
  /// runner. To accomodate this, set the socket timeout in your task runner to
  /// 90 seconds. The task runner should not call `PollForTask` again on the
  /// same `workerGroup` until it receives a response, and this can take up to
  /// 90 seconds.
  ///
  /// [workerGroup]: The type of task the task runner is configured to accept
  /// and process. The worker group is set as a field on objects in the pipeline
  /// when they are created. You can only specify a single value for
  /// `workerGroup` in the call to `PollForTask`. There are no wildcard values
  /// permitted in `workerGroup`; the string must be an exact, case-sensitive,
  /// match.
  ///
  /// [hostname]: The public DNS name of the calling task runner.
  ///
  /// [instanceIdentity]: Identity information for the EC2 instance that is
  /// hosting the task runner. You can get this value from the instance using
  /// `http://169.254.169.254/latest/meta-data/instance-id`. For more
  /// information, see
  /// [Instance Metadata](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html)
  /// in the _Amazon Elastic Compute Cloud User Guide._ Passing in this value
  /// proves that your task runner is running on an EC2 instance, and ensures
  /// the proper AWS Data Pipeline service charges are applied to your pipeline.
  Future<PollForTaskOutput> pollForTask(String workerGroup,
      {String hostname, InstanceIdentity instanceIdentity}) async {
    var response_ = await _client.send('PollForTask', {
      'workerGroup': workerGroup,
      if (hostname != null) 'hostname': hostname,
      if (instanceIdentity != null) 'instanceIdentity': instanceIdentity,
    });
    return PollForTaskOutput.fromJson(response_);
  }

  /// Adds tasks, schedules, and preconditions to the specified pipeline. You
  /// can use `PutPipelineDefinition` to populate a new pipeline.
  ///
  ///  `PutPipelineDefinition` also validates the configuration as it adds it to
  /// the pipeline. Changes to the pipeline are saved unless one of the
  /// following three validation errors exists in the pipeline.
  ///
  /// 1.  An object is missing a name or identifier field.
  /// 2.  A string or reference field is empty.
  /// 3.  The number of objects in the pipeline exceeds the maximum allowed
  /// objects.
  /// 4.  The pipeline is in a FINISHED state.
  ///
  ///  Pipeline object definitions are passed to the `PutPipelineDefinition`
  /// action and returned by the GetPipelineDefinition action.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [pipelineObjects]: The objects that define the pipeline. These objects
  /// overwrite the existing pipeline definition.
  ///
  /// [parameterObjects]: The parameter objects used with the pipeline.
  ///
  /// [parameterValues]: The parameter values used with the pipeline.
  Future<PutPipelineDefinitionOutput> putPipelineDefinition(
      {@required String pipelineId,
      @required List<PipelineObject> pipelineObjects,
      List<ParameterObject> parameterObjects,
      List<ParameterValue> parameterValues}) async {
    var response_ = await _client.send('PutPipelineDefinition', {
      'pipelineId': pipelineId,
      'pipelineObjects': pipelineObjects,
      if (parameterObjects != null) 'parameterObjects': parameterObjects,
      if (parameterValues != null) 'parameterValues': parameterValues,
    });
    return PutPipelineDefinitionOutput.fromJson(response_);
  }

  /// Queries the specified pipeline for the names of objects that match the
  /// specified set of conditions.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [query]: The query that defines the objects to be returned. The `Query`
  /// object can contain a maximum of ten selectors. The conditions in the query
  /// are limited to top-level String fields in the object. These filters can be
  /// applied to components, instances, and attempts.
  ///
  /// [sphere]: Indicates whether the query applies to components or instances.
  /// The possible values are: `COMPONENT`, `INSTANCE`, and `ATTEMPT`.
  ///
  /// [marker]: The starting point for the results to be returned. For the first
  /// call, this value should be empty. As long as there are more results,
  /// continue to call `QueryObjects` with the marker value from the previous
  /// call to retrieve the next set of results.
  ///
  /// [limit]: The maximum number of object names that `QueryObjects` will
  /// return in a single call. The default value is 100.
  Future<QueryObjectsOutput> queryObjects(
      {@required String pipelineId,
      Query query,
      @required String sphere,
      String marker,
      int limit}) async {
    var response_ = await _client.send('QueryObjects', {
      'pipelineId': pipelineId,
      if (query != null) 'query': query,
      'sphere': sphere,
      if (marker != null) 'marker': marker,
      if (limit != null) 'limit': limit,
    });
    return QueryObjectsOutput.fromJson(response_);
  }

  /// Removes existing tags from the specified pipeline.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [tagKeys]: The keys of the tags to remove.
  Future<RemoveTagsOutput> removeTags(
      {@required String pipelineId, @required List<String> tagKeys}) async {
    var response_ = await _client.send('RemoveTags', {
      'pipelineId': pipelineId,
      'tagKeys': tagKeys,
    });
    return RemoveTagsOutput.fromJson(response_);
  }

  /// Task runners call `ReportTaskProgress` when assigned a task to acknowledge
  /// that it has the task. If the web service does not receive this
  /// acknowledgement within 2 minutes, it assigns the task in a subsequent
  /// PollForTask call. After this initial acknowledgement, the task runner only
  /// needs to report progress every 15 minutes to maintain its ownership of the
  /// task. You can change this reporting time from 15 minutes by specifying a
  /// `reportProgressTimeout` field in your pipeline.
  ///
  /// If a task runner does not report its status after 5 minutes, AWS Data
  /// Pipeline assumes that the task runner is unable to process the task and
  /// reassigns the task in a subsequent response to PollForTask. Task runners
  /// should call `ReportTaskProgress` every 60 seconds.
  ///
  /// [taskId]: The ID of the task assigned to the task runner. This value is
  /// provided in the response for PollForTask.
  ///
  /// [fields]: Key-value pairs that define the properties of the
  /// ReportTaskProgressInput object.
  Future<ReportTaskProgressOutput> reportTaskProgress(String taskId,
      {List<Field> fields}) async {
    var response_ = await _client.send('ReportTaskProgress', {
      'taskId': taskId,
      if (fields != null) 'fields': fields,
    });
    return ReportTaskProgressOutput.fromJson(response_);
  }

  /// Task runners call `ReportTaskRunnerHeartbeat` every 15 minutes to indicate
  /// that they are operational. If the AWS Data Pipeline Task Runner is
  /// launched on a resource managed by AWS Data Pipeline, the web service can
  /// use this call to detect when the task runner application has failed and
  /// restart a new instance.
  ///
  /// [taskrunnerId]: The ID of the task runner. This value should be unique
  /// across your AWS account. In the case of AWS Data Pipeline Task Runner
  /// launched on a resource managed by AWS Data Pipeline, the web service
  /// provides a unique identifier when it launches the application. If you have
  /// written a custom task runner, you should assign a unique identifier for
  /// the task runner.
  ///
  /// [workerGroup]: The type of task the task runner is configured to accept
  /// and process. The worker group is set as a field on objects in the pipeline
  /// when they are created. You can only specify a single value for
  /// `workerGroup`. There are no wildcard values permitted in `workerGroup`;
  /// the string must be an exact, case-sensitive, match.
  ///
  /// [hostname]: The public DNS name of the task runner.
  Future<ReportTaskRunnerHeartbeatOutput> reportTaskRunnerHeartbeat(
      String taskrunnerId,
      {String workerGroup,
      String hostname}) async {
    var response_ = await _client.send('ReportTaskRunnerHeartbeat', {
      'taskrunnerId': taskrunnerId,
      if (workerGroup != null) 'workerGroup': workerGroup,
      if (hostname != null) 'hostname': hostname,
    });
    return ReportTaskRunnerHeartbeatOutput.fromJson(response_);
  }

  /// Requests that the status of the specified physical or logical pipeline
  /// objects be updated in the specified pipeline. This update might not occur
  /// immediately, but is eventually consistent. The status that can be set
  /// depends on the type of object (for example, DataNode or Activity). You
  /// cannot perform this operation on `FINISHED` pipelines and attempting to do
  /// so returns `InvalidRequestException`.
  ///
  /// [pipelineId]: The ID of the pipeline that contains the objects.
  ///
  /// [objectIds]: The IDs of the objects. The corresponding objects can be
  /// either physical or components, but not a mix of both types.
  ///
  /// [status]: The status to be set on all the objects specified in
  /// `objectIds`. For components, use `PAUSE` or `RESUME`. For instances, use
  /// `TRY_CANCEL`, `RERUN`, or `MARK_FINISHED`.
  Future<void> setStatus(
      {@required String pipelineId,
      @required List<String> objectIds,
      @required String status}) async {
    await _client.send('SetStatus', {
      'pipelineId': pipelineId,
      'objectIds': objectIds,
      'status': status,
    });
  }

  /// Task runners call `SetTaskStatus` to notify AWS Data Pipeline that a task
  /// is completed and provide information about the final status. A task runner
  /// makes this call regardless of whether the task was sucessful. A task
  /// runner does not need to call `SetTaskStatus` for tasks that are canceled
  /// by the web service during a call to ReportTaskProgress.
  ///
  /// [taskId]: The ID of the task assigned to the task runner. This value is
  /// provided in the response for PollForTask.
  ///
  /// [taskStatus]: If `FINISHED`, the task successfully completed. If `FAILED`,
  /// the task ended unsuccessfully. Preconditions use false.
  ///
  /// [errorId]: If an error occurred during the task, this value specifies the
  /// error code. This value is set on the physical attempt object. It is used
  /// to display error information to the user. It should not start with string
  /// "Service_" which is reserved by the system.
  ///
  /// [errorMessage]: If an error occurred during the task, this value specifies
  /// a text description of the error. This value is set on the physical attempt
  /// object. It is used to display error information to the user. The web
  /// service does not parse this value.
  ///
  /// [errorStackTrace]: If an error occurred during the task, this value
  /// specifies the stack trace associated with the error. This value is set on
  /// the physical attempt object. It is used to display error information to
  /// the user. The web service does not parse this value.
  Future<SetTaskStatusOutput> setTaskStatus(
      {@required String taskId,
      @required String taskStatus,
      String errorId,
      String errorMessage,
      String errorStackTrace}) async {
    var response_ = await _client.send('SetTaskStatus', {
      'taskId': taskId,
      'taskStatus': taskStatus,
      if (errorId != null) 'errorId': errorId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorStackTrace != null) 'errorStackTrace': errorStackTrace,
    });
    return SetTaskStatusOutput.fromJson(response_);
  }

  /// Validates the specified pipeline definition to ensure that it is well
  /// formed and can be run without error.
  ///
  /// [pipelineId]: The ID of the pipeline.
  ///
  /// [pipelineObjects]: The objects that define the pipeline changes to
  /// validate against the pipeline.
  ///
  /// [parameterObjects]: The parameter objects used with the pipeline.
  ///
  /// [parameterValues]: The parameter values used with the pipeline.
  Future<ValidatePipelineDefinitionOutput> validatePipelineDefinition(
      {@required String pipelineId,
      @required List<PipelineObject> pipelineObjects,
      List<ParameterObject> parameterObjects,
      List<ParameterValue> parameterValues}) async {
    var response_ = await _client.send('ValidatePipelineDefinition', {
      'pipelineId': pipelineId,
      'pipelineObjects': pipelineObjects,
      if (parameterObjects != null) 'parameterObjects': parameterObjects,
      if (parameterValues != null) 'parameterValues': parameterValues,
    });
    return ValidatePipelineDefinitionOutput.fromJson(response_);
  }
}

/// Contains the output of ActivatePipeline.
class ActivatePipelineOutput {
  ActivatePipelineOutput();
  static ActivatePipelineOutput fromJson(Map<String, dynamic> json) =>
      ActivatePipelineOutput();
}

/// Contains the output of AddTags.
class AddTagsOutput {
  AddTagsOutput();
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput();
}

/// Contains the output of CreatePipeline.
class CreatePipelineOutput {
  /// The ID that AWS Data Pipeline assigns the newly created pipeline. For
  /// example, `df-06372391ZG65EXAMPLE`.
  final String pipelineId;

  CreatePipelineOutput({
    @required this.pipelineId,
  });
  static CreatePipelineOutput fromJson(Map<String, dynamic> json) =>
      CreatePipelineOutput(
        pipelineId: json['pipelineId'] as String,
      );
}

/// Contains the output of DeactivatePipeline.
class DeactivatePipelineOutput {
  DeactivatePipelineOutput();
  static DeactivatePipelineOutput fromJson(Map<String, dynamic> json) =>
      DeactivatePipelineOutput();
}

/// Contains the output of DescribeObjects.
class DescribeObjectsOutput {
  /// An array of object definitions.
  final List<PipelineObject> pipelineObjects;

  /// The starting point for the next page of results. To view the next page of
  /// results, call `DescribeObjects` again with this marker value. If the value
  /// is null, there are no more results.
  final String marker;

  /// Indicates whether there are more results to return.
  final bool hasMoreResults;

  DescribeObjectsOutput({
    @required this.pipelineObjects,
    this.marker,
    this.hasMoreResults,
  });
  static DescribeObjectsOutput fromJson(Map<String, dynamic> json) =>
      DescribeObjectsOutput(
        pipelineObjects: (json['pipelineObjects'] as List)
            .map((e) => PipelineObject.fromJson(e))
            .toList(),
        marker: json.containsKey('marker') ? json['marker'] as String : null,
        hasMoreResults: json.containsKey('hasMoreResults')
            ? json['hasMoreResults'] as bool
            : null,
      );
}

/// Contains the output of DescribePipelines.
class DescribePipelinesOutput {
  /// An array of descriptions for the specified pipelines.
  final List<PipelineDescription> pipelineDescriptionList;

  DescribePipelinesOutput({
    @required this.pipelineDescriptionList,
  });
  static DescribePipelinesOutput fromJson(Map<String, dynamic> json) =>
      DescribePipelinesOutput(
        pipelineDescriptionList: (json['pipelineDescriptionList'] as List)
            .map((e) => PipelineDescription.fromJson(e))
            .toList(),
      );
}

/// Contains the output of EvaluateExpression.
class EvaluateExpressionOutput {
  /// The evaluated expression.
  final String evaluatedExpression;

  EvaluateExpressionOutput({
    @required this.evaluatedExpression,
  });
  static EvaluateExpressionOutput fromJson(Map<String, dynamic> json) =>
      EvaluateExpressionOutput(
        evaluatedExpression: json['evaluatedExpression'] as String,
      );
}

/// A key-value pair that describes a property of a pipeline object. The value
/// is specified as either a string value (`StringValue`) or a reference to
/// another object (`RefValue`) but not as both.
class Field {
  /// The field identifier.
  final String key;

  /// The field value, expressed as a String.
  final String stringValue;

  /// The field value, expressed as the identifier of another object.
  final String refValue;

  Field({
    @required this.key,
    this.stringValue,
    this.refValue,
  });
  static Field fromJson(Map<String, dynamic> json) => Field(
        key: json['key'] as String,
        stringValue: json.containsKey('stringValue')
            ? json['stringValue'] as String
            : null,
        refValue:
            json.containsKey('refValue') ? json['refValue'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the output of GetPipelineDefinition.
class GetPipelineDefinitionOutput {
  /// The objects defined in the pipeline.
  final List<PipelineObject> pipelineObjects;

  /// The parameter objects used in the pipeline definition.
  final List<ParameterObject> parameterObjects;

  /// The parameter values used in the pipeline definition.
  final List<ParameterValue> parameterValues;

  GetPipelineDefinitionOutput({
    this.pipelineObjects,
    this.parameterObjects,
    this.parameterValues,
  });
  static GetPipelineDefinitionOutput fromJson(Map<String, dynamic> json) =>
      GetPipelineDefinitionOutput(
        pipelineObjects: json.containsKey('pipelineObjects')
            ? (json['pipelineObjects'] as List)
                .map((e) => PipelineObject.fromJson(e))
                .toList()
            : null,
        parameterObjects: json.containsKey('parameterObjects')
            ? (json['parameterObjects'] as List)
                .map((e) => ParameterObject.fromJson(e))
                .toList()
            : null,
        parameterValues: json.containsKey('parameterValues')
            ? (json['parameterValues'] as List)
                .map((e) => ParameterValue.fromJson(e))
                .toList()
            : null,
      );
}

/// Identity information for the EC2 instance that is hosting the task runner.
/// You can get this value by calling a metadata URI from the EC2 instance. For
/// more information, see
/// [Instance Metadata](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html)
/// in the _Amazon Elastic Compute Cloud User Guide._ Passing in this value
/// proves that your task runner is running on an EC2 instance, and ensures the
/// proper AWS Data Pipeline service charges are applied to your pipeline.
class InstanceIdentity {
  /// A description of an EC2 instance that is generated when the instance is
  /// launched and exposed to the instance via the instance metadata service in
  /// the form of a JSON representation of an object.
  final String document;

  /// A signature which can be used to verify the accuracy and authenticity of
  /// the information provided in the instance identity document.
  final String signature;

  InstanceIdentity({
    this.document,
    this.signature,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the output of ListPipelines.
class ListPipelinesOutput {
  /// The pipeline identifiers. If you require additional information about the
  /// pipelines, you can use these identifiers to call DescribePipelines and
  /// GetPipelineDefinition.
  final List<PipelineIdName> pipelineIdList;

  /// The starting point for the next page of results. To view the next page of
  /// results, call `ListPipelinesOutput` again with this marker value. If the
  /// value is null, there are no more results.
  final String marker;

  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  final bool hasMoreResults;

  ListPipelinesOutput({
    @required this.pipelineIdList,
    this.marker,
    this.hasMoreResults,
  });
  static ListPipelinesOutput fromJson(Map<String, dynamic> json) =>
      ListPipelinesOutput(
        pipelineIdList: (json['pipelineIdList'] as List)
            .map((e) => PipelineIdName.fromJson(e))
            .toList(),
        marker: json.containsKey('marker') ? json['marker'] as String : null,
        hasMoreResults: json.containsKey('hasMoreResults')
            ? json['hasMoreResults'] as bool
            : null,
      );
}

/// Contains a logical operation for comparing the value of a field with a
/// specified value.
class Operator {
  ///  The logical operation to be performed: equal (`EQ`), equal reference
  /// (`REF_EQ`), less than or equal (`LE`), greater than or equal (`GE`), or
  /// between (`BETWEEN`). Equal reference (`REF_EQ`) can be used only with
  /// reference fields. The other comparison types can be used only with String
  /// fields. The comparison types you can use apply only to certain object
  /// fields, as detailed below.
  ///
  ///  The comparison operators EQ and REF_EQ act on the following fields:
  ///
  /// *   name
  /// *   @sphere
  /// *   parent
  /// *   @componentParent
  /// *   @instanceParent
  /// *   @status
  /// *   @scheduledStartTime
  /// *   @scheduledEndTime
  /// *   @actualStartTime
  /// *   @actualEndTime
  ///
  ///  The comparison operators `GE`, `LE`, and `BETWEEN` act on the following
  /// fields:
  ///
  /// *   @scheduledStartTime
  /// *   @scheduledEndTime
  /// *   @actualStartTime
  /// *   @actualEndTime
  ///
  /// Note that fields beginning with the at sign (@) are read-only and set by
  /// the web service. When you name fields, you should choose names containing
  /// only alpha-numeric values, as symbols may be reserved by AWS Data
  /// Pipeline. User-defined fields that you add to a pipeline should prefix
  /// their name with the string "my".
  final String type;

  /// The value that the actual field value will be compared with.
  final List<String> values;

  Operator({
    this.type,
    this.values,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The attributes allowed or specified with a parameter object.
class ParameterAttribute {
  /// The field identifier.
  final String key;

  /// The field value, expressed as a String.
  final String stringValue;

  ParameterAttribute({
    @required this.key,
    @required this.stringValue,
  });
  static ParameterAttribute fromJson(Map<String, dynamic> json) =>
      ParameterAttribute(
        key: json['key'] as String,
        stringValue: json['stringValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about a parameter object.
class ParameterObject {
  /// The ID of the parameter object.
  final String id;

  /// The attributes of the parameter object.
  final List<ParameterAttribute> attributes;

  ParameterObject({
    @required this.id,
    @required this.attributes,
  });
  static ParameterObject fromJson(Map<String, dynamic> json) => ParameterObject(
        id: json['id'] as String,
        attributes: (json['attributes'] as List)
            .map((e) => ParameterAttribute.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A value or list of parameter values.
class ParameterValue {
  /// The ID of the parameter value.
  final String id;

  /// The field value, expressed as a String.
  final String stringValue;

  ParameterValue({
    @required this.id,
    @required this.stringValue,
  });
  static ParameterValue fromJson(Map<String, dynamic> json) => ParameterValue(
        id: json['id'] as String,
        stringValue: json['stringValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains pipeline metadata.
class PipelineDescription {
  /// The pipeline identifier that was assigned by AWS Data Pipeline. This is a
  /// string of the form `df-297EG78HU43EEXAMPLE`.
  final String pipelineId;

  /// The name of the pipeline.
  final String name;

  /// A list of read-only fields that contain metadata about the pipeline:
  /// @userId, @accountId, and @pipelineState.
  final List<Field> fields;

  /// Description of the pipeline.
  final String description;

  /// A list of tags to associated with a pipeline. Tags let you control access
  /// to pipelines. For more information, see
  /// [Controlling User Access to Pipelines](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html)
  /// in the _AWS Data Pipeline Developer Guide_.
  final List<Tag> tags;

  PipelineDescription({
    @required this.pipelineId,
    @required this.name,
    @required this.fields,
    this.description,
    this.tags,
  });
  static PipelineDescription fromJson(Map<String, dynamic> json) =>
      PipelineDescription(
        pipelineId: json['pipelineId'] as String,
        name: json['name'] as String,
        fields: (json['fields'] as List).map((e) => Field.fromJson(e)).toList(),
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Contains the name and identifier of a pipeline.
class PipelineIdName {
  /// The ID of the pipeline that was assigned by AWS Data Pipeline. This is a
  /// string of the form `df-297EG78HU43EEXAMPLE`.
  final String id;

  /// The name of the pipeline.
  final String name;

  PipelineIdName({
    this.id,
    this.name,
  });
  static PipelineIdName fromJson(Map<String, dynamic> json) => PipelineIdName(
        id: json.containsKey('id') ? json['id'] as String : null,
        name: json.containsKey('name') ? json['name'] as String : null,
      );
}

/// Contains information about a pipeline object. This can be a logical,
/// physical, or physical attempt pipeline object. The complete set of
/// components of a pipeline defines the pipeline.
class PipelineObject {
  /// The ID of the object.
  final String id;

  /// The name of the object.
  final String name;

  /// Key-value pairs that define the properties of the object.
  final List<Field> fields;

  PipelineObject({
    @required this.id,
    @required this.name,
    @required this.fields,
  });
  static PipelineObject fromJson(Map<String, dynamic> json) => PipelineObject(
        id: json['id'] as String,
        name: json['name'] as String,
        fields: (json['fields'] as List).map((e) => Field.fromJson(e)).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the output of PollForTask.
class PollForTaskOutput {
  /// The information needed to complete the task that is being assigned to the
  /// task runner. One of the fields returned in this object is `taskId`, which
  /// contains an identifier for the task being assigned. The calling task
  /// runner uses `taskId` in subsequent calls to ReportTaskProgress and
  /// SetTaskStatus.
  final TaskObject taskObject;

  PollForTaskOutput({
    this.taskObject,
  });
  static PollForTaskOutput fromJson(Map<String, dynamic> json) =>
      PollForTaskOutput(
        taskObject: json.containsKey('taskObject')
            ? TaskObject.fromJson(json['taskObject'])
            : null,
      );
}

/// Contains the output of PutPipelineDefinition.
class PutPipelineDefinitionOutput {
  /// The validation errors that are associated with the objects defined in
  /// `pipelineObjects`.
  final List<ValidationError> validationErrors;

  /// The validation warnings that are associated with the objects defined in
  /// `pipelineObjects`.
  final List<ValidationWarning> validationWarnings;

  /// Indicates whether there were validation errors, and the pipeline
  /// definition is stored but cannot be activated until you correct the
  /// pipeline and call `PutPipelineDefinition` to commit the corrected
  /// pipeline.
  final bool errored;

  PutPipelineDefinitionOutput({
    this.validationErrors,
    this.validationWarnings,
    @required this.errored,
  });
  static PutPipelineDefinitionOutput fromJson(Map<String, dynamic> json) =>
      PutPipelineDefinitionOutput(
        validationErrors: json.containsKey('validationErrors')
            ? (json['validationErrors'] as List)
                .map((e) => ValidationError.fromJson(e))
                .toList()
            : null,
        validationWarnings: json.containsKey('validationWarnings')
            ? (json['validationWarnings'] as List)
                .map((e) => ValidationWarning.fromJson(e))
                .toList()
            : null,
        errored: json['errored'] as bool,
      );
}

/// Defines the query to run against an object.
class Query {
  /// List of selectors that define the query. An object must satisfy all of the
  /// selectors to match the query.
  final List<Selector> selectors;

  Query({
    this.selectors,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the output of QueryObjects.
class QueryObjectsOutput {
  /// The identifiers that match the query selectors.
  final List<String> ids;

  /// The starting point for the next page of results. To view the next page of
  /// results, call `QueryObjects` again with this marker value. If the value is
  /// null, there are no more results.
  final String marker;

  /// Indicates whether there are more results that can be obtained by a
  /// subsequent call.
  final bool hasMoreResults;

  QueryObjectsOutput({
    this.ids,
    this.marker,
    this.hasMoreResults,
  });
  static QueryObjectsOutput fromJson(Map<String, dynamic> json) =>
      QueryObjectsOutput(
        ids: json.containsKey('ids')
            ? (json['ids'] as List).map((e) => e as String).toList()
            : null,
        marker: json.containsKey('marker') ? json['marker'] as String : null,
        hasMoreResults: json.containsKey('hasMoreResults')
            ? json['hasMoreResults'] as bool
            : null,
      );
}

/// Contains the output of RemoveTags.
class RemoveTagsOutput {
  RemoveTagsOutput();
  static RemoveTagsOutput fromJson(Map<String, dynamic> json) =>
      RemoveTagsOutput();
}

/// Contains the output of ReportTaskProgress.
class ReportTaskProgressOutput {
  /// If true, the calling task runner should cancel processing of the task. The
  /// task runner does not need to call SetTaskStatus for canceled tasks.
  final bool canceled;

  ReportTaskProgressOutput({
    @required this.canceled,
  });
  static ReportTaskProgressOutput fromJson(Map<String, dynamic> json) =>
      ReportTaskProgressOutput(
        canceled: json['canceled'] as bool,
      );
}

/// Contains the output of ReportTaskRunnerHeartbeat.
class ReportTaskRunnerHeartbeatOutput {
  /// Indicates whether the calling task runner should terminate.
  final bool terminate;

  ReportTaskRunnerHeartbeatOutput({
    @required this.terminate,
  });
  static ReportTaskRunnerHeartbeatOutput fromJson(Map<String, dynamic> json) =>
      ReportTaskRunnerHeartbeatOutput(
        terminate: json['terminate'] as bool,
      );
}

/// A comparision that is used to determine whether a query should return this
/// object.
class Selector {
  /// The name of the field that the operator will be applied to. The field name
  /// is the "key" portion of the field definition in the pipeline definition
  /// syntax that is used by the AWS Data Pipeline API. If the field is not set
  /// on the object, the condition fails.
  final String fieldName;

  final Operator operator;

  Selector({
    this.fieldName,
    this.operator,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the output of SetTaskStatus.
class SetTaskStatusOutput {
  SetTaskStatusOutput();
  static SetTaskStatusOutput fromJson(Map<String, dynamic> json) =>
      SetTaskStatusOutput();
}

/// Tags are key/value pairs defined by a user and associated with a pipeline to
/// control access. AWS Data Pipeline allows you to associate ten tags per
/// pipeline. For more information, see
/// [Controlling User Access to Pipelines](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html)
/// in the _AWS Data Pipeline Developer Guide_.
class Tag {
  /// The key name of a tag defined by a user. For more information, see
  /// [Controlling User Access to Pipelines](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html)
  /// in the _AWS Data Pipeline Developer Guide_.
  final String key;

  /// The optional value portion of a tag defined by a user. For more
  /// information, see
  /// [Controlling User Access to Pipelines](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html)
  /// in the _AWS Data Pipeline Developer Guide_.
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

/// Contains information about a pipeline task that is assigned to a task
/// runner.
class TaskObject {
  /// An internal identifier for the task. This ID is passed to the
  /// SetTaskStatus and ReportTaskProgress actions.
  final String taskId;

  /// The ID of the pipeline that provided the task.
  final String pipelineId;

  /// The ID of the pipeline task attempt object. AWS Data Pipeline uses this
  /// value to track how many times a task is attempted.
  final String attemptId;

  /// Connection information for the location where the task runner will publish
  /// the output of the task.
  final Map<String, PipelineObject> objects;

  TaskObject({
    this.taskId,
    this.pipelineId,
    this.attemptId,
    this.objects,
  });
  static TaskObject fromJson(Map<String, dynamic> json) => TaskObject(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        pipelineId: json.containsKey('pipelineId')
            ? json['pipelineId'] as String
            : null,
        attemptId:
            json.containsKey('attemptId') ? json['attemptId'] as String : null,
        objects: json.containsKey('objects')
            ? (json['objects'] as Map).map(
                (k, v) => MapEntry(k as String, PipelineObject.fromJson(v)))
            : null,
      );
}

/// Contains the output of ValidatePipelineDefinition.
class ValidatePipelineDefinitionOutput {
  /// Any validation errors that were found.
  final List<ValidationError> validationErrors;

  /// Any validation warnings that were found.
  final List<ValidationWarning> validationWarnings;

  /// Indicates whether there were validation errors.
  final bool errored;

  ValidatePipelineDefinitionOutput({
    this.validationErrors,
    this.validationWarnings,
    @required this.errored,
  });
  static ValidatePipelineDefinitionOutput fromJson(Map<String, dynamic> json) =>
      ValidatePipelineDefinitionOutput(
        validationErrors: json.containsKey('validationErrors')
            ? (json['validationErrors'] as List)
                .map((e) => ValidationError.fromJson(e))
                .toList()
            : null,
        validationWarnings: json.containsKey('validationWarnings')
            ? (json['validationWarnings'] as List)
                .map((e) => ValidationWarning.fromJson(e))
                .toList()
            : null,
        errored: json['errored'] as bool,
      );
}

/// Defines a validation error. Validation errors prevent pipeline activation.
/// The set of validation errors that can be returned are defined by AWS Data
/// Pipeline.
class ValidationError {
  /// The identifier of the object that contains the validation error.
  final String id;

  /// A description of the validation error.
  final List<String> errors;

  ValidationError({
    this.id,
    this.errors,
  });
  static ValidationError fromJson(Map<String, dynamic> json) => ValidationError(
        id: json.containsKey('id') ? json['id'] as String : null,
        errors: json.containsKey('errors')
            ? (json['errors'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Defines a validation warning. Validation warnings do not prevent pipeline
/// activation. The set of validation warnings that can be returned are defined
/// by AWS Data Pipeline.
class ValidationWarning {
  /// The identifier of the object that contains the validation warning.
  final String id;

  /// A description of the validation warning.
  final List<String> warnings;

  ValidationWarning({
    this.id,
    this.warnings,
  });
  static ValidationWarning fromJson(Map<String, dynamic> json) =>
      ValidationWarning(
        id: json.containsKey('id') ? json['id'] as String : null,
        warnings: json.containsKey('warnings')
            ? (json['warnings'] as List).map((e) => e as String).toList()
            : null,
      );
}
