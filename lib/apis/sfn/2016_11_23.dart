import 'package:meta/meta.dart';

/// AWS Step Functions
///
/// AWS Step Functions is a service that lets you coordinate the components of
/// distributed applications and microservices using visual workflows.
///
/// You can use Step Functions to build applications from individual components,
/// each of which performs a discrete function, or _task_, allowing you to scale
/// and change applications quickly. Step Functions provides a console that
/// helps visualize the components of your application as a series of steps.
/// Step Functions automatically triggers and tracks each step, and retries
/// steps when there are errors, so your application executes predictably and in
/// the right order every time. Step Functions logs the state of each step, so
/// you can quickly diagnose and debug any issues.
///
/// Step Functions manages operations and underlying infrastructure to ensure
/// your application is available at any scale. You can run tasks on AWS, your
/// own servers, or any system that has access to AWS. You can access and use
/// Step Functions using the console, the AWS SDKs, or an HTTP API. For more
/// information about Step Functions, see the  _[AWS Step Functions Developer
/// Guide](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)_ .
class SfnApi {
  /// Creates an activity. An activity is a task that you write in any
  /// programming language and host on any machine that has access to AWS Step
  /// Functions. Activities must poll Step Functions using the `GetActivityTask`
  /// API action and respond using `SendTask*` API actions. This function lets
  /// Step Functions know the existence of your activity and returns an
  /// identifier for use in a state machine and when polling from the activity.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.   `CreateActivity` is an
  /// idempotent API. Subsequent requests won’t create a duplicate resource if
  /// it was already created. `CreateActivity`'s idempotency check is based on
  /// the activity `name`. If a following request has different `tags` values,
  /// Step Functions will ignore these differences and treat it as an idempotent
  /// request of the previous. In this case, `tags` will not be updated, even if
  /// they are different.
  Future<void> createActivity(String name, {List<Tag> tags}) async {}

  /// Creates a state machine. A state machine consists of a collection of
  /// states that can do work (`Task` states), determine to which states to
  /// transition next (`Choice` states), stop an execution with an error (`Fail`
  /// states), and so on. State machines are specified using a JSON-based,
  /// structured language.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.   `CreateStateMachine` is
  /// an idempotent API. Subsequent requests won’t create a duplicate resource
  /// if it was already created. `CreateStateMachine`'s idempotency check is
  /// based on the state machine `name` and `definition`. If a following request
  /// has a different `roleArn` or `tags`, Step Functions will ignore these
  /// differences and treat it as an idempotent request of the previous. In this
  /// case, `roleArn` and `tags` will not be updated, even if they are
  /// different.
  Future<void> createStateMachine(
      {@required String name,
      @required String definition,
      @required String roleArn,
      List<Tag> tags}) async {}

  /// Deletes an activity.
  Future<void> deleteActivity(String activityArn) async {}

  /// Deletes a state machine. This is an asynchronous operation: It sets the
  /// state machine's status to `DELETING` and begins the deletion process. Each
  /// state machine execution is deleted the next time it makes a state
  /// transition.
  ///
  ///
  ///
  /// The state machine itself is deleted after all executions are completed or
  /// deleted.
  Future<void> deleteStateMachine(String stateMachineArn) async {}

  /// Describes an activity.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> describeActivity(String activityArn) async {}

  /// Describes an execution.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> describeExecution(String executionArn) async {}

  /// Describes a state machine.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> describeStateMachine(String stateMachineArn) async {}

  /// Describes the state machine associated with a specific execution.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> describeStateMachineForExecution(String executionArn) async {}

  /// Used by workers to retrieve a task (with the specified activity ARN) which
  /// has been scheduled for execution by a running state machine. This
  /// initiates a long poll, where the service holds the HTTP connection open
  /// and responds as soon as a task becomes available (i.e. an execution of a
  /// task of this type is needed.) The maximum time the service holds on to the
  /// request before responding is 60 seconds. If no task is available within 60
  /// seconds, the poll returns a `taskToken` with a null string.
  ///
  ///
  ///
  /// Workers should set their client side socket timeout to at least 65 seconds
  /// (5 seconds higher than the maximum time the service may hold the poll
  /// request).
  ///
  /// Polling with `GetActivityTask` can cause latency in some implementations.
  /// See [Avoid Latency When Polling for Activity
  /// Tasks](https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html)
  /// in the Step Functions Developer Guide.
  Future<void> getActivityTask(String activityArn, {String workerName}) async {}

  /// Returns the history of the specified execution as a list of events. By
  /// default, the results are returned in ascending order of the `timeStamp` of
  /// the events. Use the `reverseOrder` parameter to get the latest events
  /// first.
  ///
  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  Future<void> getExecutionHistory(String executionArn,
      {int maxResults, bool reverseOrder, String nextToken}) async {}

  /// Lists the existing activities.
  ///
  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> listActivities({int maxResults, String nextToken}) async {}

  /// Lists the executions of a state machine that meet the filtering criteria.
  /// Results are sorted by time, with the most recent execution first.
  ///
  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> listExecutions(String stateMachineArn,
      {String statusFilter, int maxResults, String nextToken}) async {}

  /// Lists the existing state machines.
  ///
  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  Future<void> listStateMachines({int maxResults, String nextToken}) async {}

  /// List tags for a given resource.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report that the task identified by the `taskToken` failed.
  Future<void> sendTaskFailure(String taskToken,
      {String error, String cause}) async {}

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report to Step Functions that the task represented by the
  /// specified `taskToken` is still making progress. This action resets the
  /// `Heartbeat` clock. The `Heartbeat` threshold is specified in the state
  /// machine's Amazon States Language definition (`HeartbeatSeconds`). This
  /// action does not in itself create an event in the execution history.
  /// However, if the task times out, the execution history contains an
  /// `ActivityTimedOut` entry for activities, or a `TaskTimedOut` entry for for
  /// tasks using the [job
  /// run](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync)
  /// or
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern.
  ///
  ///
  ///
  /// The `Timeout` of a task, defined in the state machine's Amazon States
  /// Language definition, is its maximum allowed duration, regardless of the
  /// number of SendTaskHeartbeat requests received. Use `HeartbeatSeconds` to
  /// configure the timeout interval for heartbeats.
  Future<void> sendTaskHeartbeat(String taskToken) async {}

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report that the task identified by the `taskToken` completed
  /// successfully.
  Future<void> sendTaskSuccess(
      {@required String taskToken, @required String output}) async {}

  /// Starts a state machine execution.
  ///
  ///   `StartExecution` is idempotent. If `StartExecution` is called with the
  /// same name and input as a running execution, the call will succeed and
  /// return the same response as the original request. If the execution is
  /// closed or if the input is different, it will return a 400
  /// `ExecutionAlreadyExists` error. Names can be reused after 90 days.
  Future<void> startExecution(String stateMachineArn,
      {String name, String input}) async {}

  /// Stops an execution.
  Future<void> stopExecution(String executionArn,
      {String error, String cause}) async {}

  /// Add a tag to a Step Functions resource.
  ///
  /// An array of key-value pairs. For more information, see [Using Cost
  /// Allocation
  /// Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_, and [Controlling
  /// Access Using IAM
  /// Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Remove a tag from a Step Functions resource
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an existing state machine by modifying its `definition` and/or
  /// `roleArn`. Running executions will continue to use the previous
  /// `definition` and `roleArn`. You must include at least one of `definition`
  /// or `roleArn` or you will receive a `MissingRequiredParameter` error.
  ///
  ///
  ///
  /// All `StartExecution` calls within a few seconds will use the updated
  /// `definition` and `roleArn`. Executions started immediately after calling
  /// `UpdateStateMachine` may use the previous state machine `definition` and
  /// `roleArn`.
  Future<void> updateStateMachine(String stateMachineArn,
      {String definition, String roleArn}) async {}
}

class ActivityFailedEventDetails {}

class ActivityListItem {}

class ActivityScheduleFailedEventDetails {}

class ActivityScheduledEventDetails {}

class ActivityStartedEventDetails {}

class ActivitySucceededEventDetails {}

class ActivityTimedOutEventDetails {}

class CreateActivityOutput {}

class CreateStateMachineOutput {}

class DeleteActivityOutput {}

class DeleteStateMachineOutput {}

class DescribeActivityOutput {}

class DescribeExecutionOutput {}

class DescribeStateMachineForExecutionOutput {}

class DescribeStateMachineOutput {}

class ExecutionAbortedEventDetails {}

class ExecutionFailedEventDetails {}

class ExecutionListItem {}

class ExecutionStartedEventDetails {}

class ExecutionSucceededEventDetails {}

class ExecutionTimedOutEventDetails {}

class GetActivityTaskOutput {}

class GetExecutionHistoryOutput {}

class HistoryEvent {}

class LambdaFunctionFailedEventDetails {}

class LambdaFunctionScheduleFailedEventDetails {}

class LambdaFunctionScheduledEventDetails {}

class LambdaFunctionStartFailedEventDetails {}

class LambdaFunctionSucceededEventDetails {}

class LambdaFunctionTimedOutEventDetails {}

class ListActivitiesOutput {}

class ListExecutionsOutput {}

class ListStateMachinesOutput {}

class ListTagsForResourceOutput {}

class MapIterationEventDetails {}

class MapStateStartedEventDetails {}

class SendTaskFailureOutput {}

class SendTaskHeartbeatOutput {}

class SendTaskSuccessOutput {}

class StartExecutionOutput {}

class StateEnteredEventDetails {}

class StateExitedEventDetails {}

class StateMachineListItem {}

class StopExecutionOutput {}

class Tag {}

class TagResourceOutput {}

class TaskFailedEventDetails {}

class TaskScheduledEventDetails {}

class TaskStartFailedEventDetails {}

class TaskStartedEventDetails {}

class TaskSubmitFailedEventDetails {}

class TaskSubmittedEventDetails {}

class TaskSucceededEventDetails {}

class TaskTimedOutEventDetails {}

class UntagResourceOutput {}

class UpdateStateMachineOutput {}
