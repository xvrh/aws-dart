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
  /// Validates the specified pipeline and starts processing pipeline tasks. If
  /// the pipeline does not pass validation, activation fails.
  ///
  /// If you need to pause the pipeline to investigate an issue with a
  /// component, such as a data source or script, call DeactivatePipeline.
  ///
  /// To activate a finished pipeline, modify the end date for the pipeline and
  /// then activate it.
  Future<void> activatePipeline(String pipelineId,
      {List<ParameterValue> parameterValues, DateTime startTimestamp}) async {}

  /// Adds or modifies tags for the specified pipeline.
  Future<void> addTags(
      {@required String pipelineId, @required List<Tag> tags}) async {}

  /// Creates a new, empty pipeline. Use PutPipelineDefinition to populate the
  /// pipeline.
  Future<void> createPipeline(
      {@required String name,
      @required String uniqueId,
      String description,
      List<Tag> tags}) async {}

  /// Deactivates the specified running pipeline. The pipeline is set to the
  /// `DEACTIVATING` state until the deactivation process completes.
  ///
  /// To resume a deactivated pipeline, use ActivatePipeline. By default, the
  /// pipeline resumes from the last completed execution. Optionally, you can
  /// specify the date and time to resume the pipeline.
  Future<void> deactivatePipeline(String pipelineId,
      {bool cancelActive}) async {}

  /// Deletes a pipeline, its pipeline definition, and its run history. AWS Data
  /// Pipeline attempts to cancel instances associated with the pipeline that
  /// are currently being processed by task runners.
  ///
  /// Deleting a pipeline cannot be undone. You cannot query or restore a
  /// deleted pipeline. To temporarily pause a pipeline instead of deleting it,
  /// call SetStatus with the status set to `PAUSE` on individual components.
  /// Components that are paused by SetStatus can be resumed.
  Future<void> deletePipeline(String pipelineId) async {}

  /// Gets the object definitions for a set of objects associated with the
  /// pipeline. Object definitions are composed of a set of fields that define
  /// the properties of the object.
  Future<void> describeObjects(
      {@required String pipelineId,
      @required List<String> objectIds,
      bool evaluateExpressions,
      String marker}) async {}

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
  Future<void> describePipelines(List<String> pipelineIds) async {}

  /// Task runners call `EvaluateExpression` to evaluate a string in the context
  /// of the specified object. For example, a task runner can evaluate SQL
  /// queries stored in Amazon S3.
  Future<void> evaluateExpression(
      {@required String pipelineId,
      @required String objectId,
      @required String expression}) async {}

  /// Gets the definition of the specified pipeline. You can call
  /// `GetPipelineDefinition` to retrieve the pipeline definition that you
  /// provided using PutPipelineDefinition.
  Future<void> getPipelineDefinition(String pipelineId,
      {String version}) async {}

  /// Lists the pipeline identifiers for all active pipelines that you have
  /// permission to access.
  Future<void> listPipelines({String marker}) async {}

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
  Future<void> pollForTask(String workerGroup,
      {String hostname, InstanceIdentity instanceIdentity}) async {}

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
  Future<void> putPipelineDefinition(
      {@required String pipelineId,
      @required List<PipelineObject> pipelineObjects,
      List<ParameterObject> parameterObjects,
      List<ParameterValue> parameterValues}) async {}

  /// Queries the specified pipeline for the names of objects that match the
  /// specified set of conditions.
  Future<void> queryObjects(
      {@required String pipelineId,
      Query query,
      @required String sphere,
      String marker,
      int limit}) async {}

  /// Removes existing tags from the specified pipeline.
  Future<void> removeTags(
      {@required String pipelineId, @required List<String> tagKeys}) async {}

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
  Future<void> reportTaskProgress(String taskId, {List<Field> fields}) async {}

  /// Task runners call `ReportTaskRunnerHeartbeat` every 15 minutes to indicate
  /// that they are operational. If the AWS Data Pipeline Task Runner is
  /// launched on a resource managed by AWS Data Pipeline, the web service can
  /// use this call to detect when the task runner application has failed and
  /// restart a new instance.
  Future<void> reportTaskRunnerHeartbeat(String taskrunnerId,
      {String workerGroup, String hostname}) async {}

  /// Requests that the status of the specified physical or logical pipeline
  /// objects be updated in the specified pipeline. This update might not occur
  /// immediately, but is eventually consistent. The status that can be set
  /// depends on the type of object (for example, DataNode or Activity). You
  /// cannot perform this operation on `FINISHED` pipelines and attempting to do
  /// so returns `InvalidRequestException`.
  Future<void> setStatus(
      {@required String pipelineId,
      @required List<String> objectIds,
      @required String status}) async {}

  /// Task runners call `SetTaskStatus` to notify AWS Data Pipeline that a task
  /// is completed and provide information about the final status. A task runner
  /// makes this call regardless of whether the task was sucessful. A task
  /// runner does not need to call `SetTaskStatus` for tasks that are canceled
  /// by the web service during a call to ReportTaskProgress.
  Future<void> setTaskStatus(
      {@required String taskId,
      @required String taskStatus,
      String errorId,
      String errorMessage,
      String errorStackTrace}) async {}

  /// Validates the specified pipeline definition to ensure that it is well
  /// formed and can be run without error.
  Future<void> validatePipelineDefinition(
      {@required String pipelineId,
      @required List<PipelineObject> pipelineObjects,
      List<ParameterObject> parameterObjects,
      List<ParameterValue> parameterValues}) async {}
}

class ActivatePipelineOutput {}

class AddTagsOutput {}

class CreatePipelineOutput {}

class DeactivatePipelineOutput {}

class DescribeObjectsOutput {}

class DescribePipelinesOutput {}

class EvaluateExpressionOutput {}

class Field {}

class GetPipelineDefinitionOutput {}

class InstanceIdentity {}

class ListPipelinesOutput {}

class Operator {}

class ParameterAttribute {}

class ParameterObject {}

class ParameterValue {}

class PipelineDescription {}

class PipelineIdName {}

class PipelineObject {}

class PollForTaskOutput {}

class PutPipelineDefinitionOutput {}

class Query {}

class QueryObjectsOutput {}

class RemoveTagsOutput {}

class ReportTaskProgressOutput {}

class ReportTaskRunnerHeartbeatOutput {}

class Selector {}

class SetTaskStatusOutput {}

class Tag {}

class TaskObject {}

class ValidatePipelineDefinitionOutput {}

class ValidationError {}

class ValidationWarning {}
