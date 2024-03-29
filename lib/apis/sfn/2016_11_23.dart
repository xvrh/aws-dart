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
/// information about Step Functions, see the
/// _[AWS Step Functions Developer Guide](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)_
/// .
class SfnApi {
  final _client;
  SfnApi(client) : _client = client.configured('SFN', serializer: 'json');

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
  ///
  /// [name]: The name of the activity to create. This name must be unique for
  /// your AWS account and region for 90 days. For more information, see
  /// [Limits Related to State Machine Executions](https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions)
  /// in the _AWS Step Functions Developer Guide_.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  ///
  /// [tags]: The list of tags to add to a resource.
  ///
  /// An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_, and
  /// [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  Future<CreateActivityOutput> createActivity(String name,
      {List<Tag> tags}) async {
    var response_ = await _client.send('CreateActivity', {
      'name': name,
      if (tags != null) 'tags': tags,
    });
    return CreateActivityOutput.fromJson(response_);
  }

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
  ///
  /// [name]: The name of the state machine.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  ///
  /// [definition]: The Amazon States Language definition of the state machine.
  /// See
  /// [Amazon States Language](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role to use for this
  /// state machine.
  ///
  /// [tags]: Tags to be added when creating a state machine.
  ///
  /// An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_, and
  /// [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  Future<CreateStateMachineOutput> createStateMachine(
      {@required String name,
      @required String definition,
      @required String roleArn,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateStateMachine', {
      'name': name,
      'definition': definition,
      'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    });
    return CreateStateMachineOutput.fromJson(response_);
  }

  /// Deletes an activity.
  ///
  /// [activityArn]: The Amazon Resource Name (ARN) of the activity to delete.
  Future<DeleteActivityOutput> deleteActivity(String activityArn) async {
    var response_ = await _client.send('DeleteActivity', {
      'activityArn': activityArn,
    });
    return DeleteActivityOutput.fromJson(response_);
  }

  /// Deletes a state machine. This is an asynchronous operation: It sets the
  /// state machine's status to `DELETING` and begins the deletion process. Each
  /// state machine execution is deleted the next time it makes a state
  /// transition.
  ///
  ///
  ///
  /// The state machine itself is deleted after all executions are completed or
  /// deleted.
  ///
  /// [stateMachineArn]: The Amazon Resource Name (ARN) of the state machine to
  /// delete.
  Future<DeleteStateMachineOutput> deleteStateMachine(
      String stateMachineArn) async {
    var response_ = await _client.send('DeleteStateMachine', {
      'stateMachineArn': stateMachineArn,
    });
    return DeleteStateMachineOutput.fromJson(response_);
  }

  /// Describes an activity.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  ///
  /// [activityArn]: The Amazon Resource Name (ARN) of the activity to describe.
  Future<DescribeActivityOutput> describeActivity(String activityArn) async {
    var response_ = await _client.send('DescribeActivity', {
      'activityArn': activityArn,
    });
    return DescribeActivityOutput.fromJson(response_);
  }

  /// Describes an execution.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  ///
  /// [executionArn]: The Amazon Resource Name (ARN) of the execution to
  /// describe.
  Future<DescribeExecutionOutput> describeExecution(String executionArn) async {
    var response_ = await _client.send('DescribeExecution', {
      'executionArn': executionArn,
    });
    return DescribeExecutionOutput.fromJson(response_);
  }

  /// Describes a state machine.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  ///
  /// [stateMachineArn]: The Amazon Resource Name (ARN) of the state machine to
  /// describe.
  Future<DescribeStateMachineOutput> describeStateMachine(
      String stateMachineArn) async {
    var response_ = await _client.send('DescribeStateMachine', {
      'stateMachineArn': stateMachineArn,
    });
    return DescribeStateMachineOutput.fromJson(response_);
  }

  /// Describes the state machine associated with a specific execution.
  ///
  ///
  ///
  /// This operation is eventually consistent. The results are best effort and
  /// may not reflect very recent updates and changes.
  ///
  /// [executionArn]: The Amazon Resource Name (ARN) of the execution you want
  /// state machine information for.
  Future<DescribeStateMachineForExecutionOutput>
      describeStateMachineForExecution(String executionArn) async {
    var response_ = await _client.send('DescribeStateMachineForExecution', {
      'executionArn': executionArn,
    });
    return DescribeStateMachineForExecutionOutput.fromJson(response_);
  }

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
  /// See
  /// [Avoid Latency When Polling for Activity Tasks](https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html)
  /// in the Step Functions Developer Guide.
  ///
  /// [activityArn]: The Amazon Resource Name (ARN) of the activity to retrieve
  /// tasks from (assigned when you create the task using CreateActivity.)
  ///
  /// [workerName]: You can provide an arbitrary name in order to identify the
  /// worker that the task is assigned to. This name is used when it is logged
  /// in the execution history.
  Future<GetActivityTaskOutput> getActivityTask(String activityArn,
      {String workerName}) async {
    var response_ = await _client.send('GetActivityTask', {
      'activityArn': activityArn,
      if (workerName != null) 'workerName': workerName,
    });
    return GetActivityTaskOutput.fromJson(response_);
  }

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
  ///
  /// [executionArn]: The Amazon Resource Name (ARN) of the execution.
  ///
  /// [maxResults]: The maximum number of results that are returned per call.
  /// You can use `nextToken` to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// [reverseOrder]: Lists events in descending order of their `timeStamp`.
  ///
  /// [nextToken]: If `nextToken` is returned, there are more results available.
  /// The value of `nextToken` is a unique pagination token for each page. Make
  /// the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24
  /// hours. Using an expired pagination token will return an _HTTP 400
  /// InvalidToken_ error.
  Future<GetExecutionHistoryOutput> getExecutionHistory(String executionArn,
      {int maxResults, bool reverseOrder, String nextToken}) async {
    var response_ = await _client.send('GetExecutionHistory', {
      'executionArn': executionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return GetExecutionHistoryOutput.fromJson(response_);
  }

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
  ///
  /// [maxResults]: The maximum number of results that are returned per call.
  /// You can use `nextToken` to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// [nextToken]: If `nextToken` is returned, there are more results available.
  /// The value of `nextToken` is a unique pagination token for each page. Make
  /// the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24
  /// hours. Using an expired pagination token will return an _HTTP 400
  /// InvalidToken_ error.
  Future<ListActivitiesOutput> listActivities(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListActivities', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListActivitiesOutput.fromJson(response_);
  }

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
  ///
  /// [stateMachineArn]: The Amazon Resource Name (ARN) of the state machine
  /// whose executions is listed.
  ///
  /// [statusFilter]: If specified, only list the executions whose current
  /// execution status matches the given filter.
  ///
  /// [maxResults]: The maximum number of results that are returned per call.
  /// You can use `nextToken` to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// [nextToken]: If `nextToken` is returned, there are more results available.
  /// The value of `nextToken` is a unique pagination token for each page. Make
  /// the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24
  /// hours. Using an expired pagination token will return an _HTTP 400
  /// InvalidToken_ error.
  Future<ListExecutionsOutput> listExecutions(String stateMachineArn,
      {String statusFilter, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListExecutions', {
      'stateMachineArn': stateMachineArn,
      if (statusFilter != null) 'statusFilter': statusFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListExecutionsOutput.fromJson(response_);
  }

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
  ///
  /// [maxResults]: The maximum number of results that are returned per call.
  /// You can use `nextToken` to obtain further pages of results. The default is
  /// 100 and the maximum allowed page size is 1000. A value of 0 uses the
  /// default.
  ///
  /// This is only an upper limit. The actual number of results returned per
  /// call might be fewer than the specified maximum.
  ///
  /// [nextToken]: If `nextToken` is returned, there are more results available.
  /// The value of `nextToken` is a unique pagination token for each page. Make
  /// the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24
  /// hours. Using an expired pagination token will return an _HTTP 400
  /// InvalidToken_ error.
  Future<ListStateMachinesOutput> listStateMachines(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListStateMachines', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListStateMachinesOutput.fromJson(response_);
  }

  /// List tags for a given resource.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Step Functions state
  /// machine or activity.
  Future<ListTagsForResourceOutput> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report that the task identified by the `taskToken` failed.
  ///
  /// [taskToken]: The token that represents this task. Task tokens are
  /// generated by Step Functions when tasks are assigned to a worker, or in the
  /// [context object](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html)
  /// when a workflow enters a task state. See GetActivityTaskOutput$taskToken.
  ///
  /// [error]: The error code of the failure.
  ///
  /// [cause]: A more detailed explanation of the cause of the failure.
  Future<SendTaskFailureOutput> sendTaskFailure(String taskToken,
      {String error, String cause}) async {
    var response_ = await _client.send('SendTaskFailure', {
      'taskToken': taskToken,
      if (error != null) 'error': error,
      if (cause != null) 'cause': cause,
    });
    return SendTaskFailureOutput.fromJson(response_);
  }

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report to Step Functions that the task represented by the
  /// specified `taskToken` is still making progress. This action resets the
  /// `Heartbeat` clock. The `Heartbeat` threshold is specified in the state
  /// machine's Amazon States Language definition (`HeartbeatSeconds`). This
  /// action does not in itself create an event in the execution history.
  /// However, if the task times out, the execution history contains an
  /// `ActivityTimedOut` entry for activities, or a `TaskTimedOut` entry for for
  /// tasks using the
  /// [job run](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync)
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
  ///
  /// [taskToken]: The token that represents this task. Task tokens are
  /// generated by Step Functions when tasks are assigned to a worker, or in the
  /// [context object](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html)
  /// when a workflow enters a task state. See GetActivityTaskOutput$taskToken.
  Future<SendTaskHeartbeatOutput> sendTaskHeartbeat(String taskToken) async {
    var response_ = await _client.send('SendTaskHeartbeat', {
      'taskToken': taskToken,
    });
    return SendTaskHeartbeatOutput.fromJson(response_);
  }

  /// Used by activity workers and task states using the
  /// [callback](https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token)
  /// pattern to report that the task identified by the `taskToken` completed
  /// successfully.
  ///
  /// [taskToken]: The token that represents this task. Task tokens are
  /// generated by Step Functions when tasks are assigned to a worker, or in the
  /// [context object](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html)
  /// when a workflow enters a task state. See GetActivityTaskOutput$taskToken.
  ///
  /// [output]: The JSON output of the task.
  Future<SendTaskSuccessOutput> sendTaskSuccess(
      {@required String taskToken, @required String output}) async {
    var response_ = await _client.send('SendTaskSuccess', {
      'taskToken': taskToken,
      'output': output,
    });
    return SendTaskSuccessOutput.fromJson(response_);
  }

  /// Starts a state machine execution.
  ///
  ///   `StartExecution` is idempotent. If `StartExecution` is called with the
  /// same name and input as a running execution, the call will succeed and
  /// return the same response as the original request. If the execution is
  /// closed or if the input is different, it will return a 400
  /// `ExecutionAlreadyExists` error. Names can be reused after 90 days.
  ///
  /// [stateMachineArn]: The Amazon Resource Name (ARN) of the state machine to
  /// execute.
  ///
  /// [name]: The name of the execution. This name must be unique for your AWS
  /// account, region, and state machine for 90 days. For more information, see
  /// [Limits Related to State Machine Executions](https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions)
  /// in the _AWS Step Functions Developer Guide_.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  ///
  /// [input]: The string that contains the JSON input data for the execution,
  /// for example:
  ///
  ///  `"input": "{"first_name" : "test"}"`
  ///
  ///
  ///
  /// If you don't include any JSON input data, you still must include the two
  /// braces, for example: `"input": "{}"`
  Future<StartExecutionOutput> startExecution(String stateMachineArn,
      {String name, String input}) async {
    var response_ = await _client.send('StartExecution', {
      'stateMachineArn': stateMachineArn,
      if (name != null) 'name': name,
      if (input != null) 'input': input,
    });
    return StartExecutionOutput.fromJson(response_);
  }

  /// Stops an execution.
  ///
  /// [executionArn]: The Amazon Resource Name (ARN) of the execution to stop.
  ///
  /// [error]: The error code of the failure.
  ///
  /// [cause]: A more detailed explanation of the cause of the failure.
  Future<StopExecutionOutput> stopExecution(String executionArn,
      {String error, String cause}) async {
    var response_ = await _client.send('StopExecution', {
      'executionArn': executionArn,
      if (error != null) 'error': error,
      if (cause != null) 'cause': cause,
    });
    return StopExecutionOutput.fromJson(response_);
  }

  /// Add a tag to a Step Functions resource.
  ///
  /// An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_, and
  /// [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Step Functions state
  /// machine or activity.
  ///
  /// [tags]: The list of tags to add to a resource.
  ///
  /// Tags may only contain Unicode letters, digits, white space, or these
  /// symbols: `_ . : / = + - @`.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceOutput.fromJson(response_);
  }

  /// Remove a tag from a Step Functions resource
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Step Functions state
  /// machine or activity.
  ///
  /// [tagKeys]: The list of tags to remove from the resource.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceOutput.fromJson(response_);
  }

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
  ///
  /// [stateMachineArn]: The Amazon Resource Name (ARN) of the state machine.
  ///
  /// [definition]: The Amazon States Language definition of the state machine.
  /// See
  /// [Amazon States Language](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role of the state
  /// machine.
  Future<UpdateStateMachineOutput> updateStateMachine(String stateMachineArn,
      {String definition, String roleArn}) async {
    var response_ = await _client.send('UpdateStateMachine', {
      'stateMachineArn': stateMachineArn,
      if (definition != null) 'definition': definition,
      if (roleArn != null) 'roleArn': roleArn,
    });
    return UpdateStateMachineOutput.fromJson(response_);
  }
}

/// Contains details about an activity that failed during an execution.
class ActivityFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  ActivityFailedEventDetails({
    this.error,
    this.cause,
  });
  static ActivityFailedEventDetails fromJson(Map<String, dynamic> json) =>
      ActivityFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about an activity.
class ActivityListItem {
  /// The Amazon Resource Name (ARN) that identifies the activity.
  final String activityArn;

  /// The name of the activity.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The date the activity is created.
  final DateTime creationDate;

  ActivityListItem({
    @required this.activityArn,
    @required this.name,
    @required this.creationDate,
  });
  static ActivityListItem fromJson(Map<String, dynamic> json) =>
      ActivityListItem(
        activityArn: json['activityArn'] as String,
        name: json['name'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

/// Contains details about an activity schedule failure that occurred during an
/// execution.
class ActivityScheduleFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  ActivityScheduleFailedEventDetails({
    this.error,
    this.cause,
  });
  static ActivityScheduleFailedEventDetails fromJson(
          Map<String, dynamic> json) =>
      ActivityScheduleFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about an activity scheduled during an execution.
class ActivityScheduledEventDetails {
  /// The Amazon Resource Name (ARN) of the scheduled activity.
  final String resource;

  /// The JSON data input to the activity task.
  final String input;

  /// The maximum allowed duration of the activity task.
  final BigInt timeoutInSeconds;

  /// The maximum allowed duration between two heartbeats for the activity task.
  final BigInt heartbeatInSeconds;

  ActivityScheduledEventDetails({
    @required this.resource,
    this.input,
    this.timeoutInSeconds,
    this.heartbeatInSeconds,
  });
  static ActivityScheduledEventDetails fromJson(Map<String, dynamic> json) =>
      ActivityScheduledEventDetails(
        resource: json['resource'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
        timeoutInSeconds: json.containsKey('timeoutInSeconds')
            ? BigInt.from(json['timeoutInSeconds'])
            : null,
        heartbeatInSeconds: json.containsKey('heartbeatInSeconds')
            ? BigInt.from(json['heartbeatInSeconds'])
            : null,
      );
}

/// Contains details about the start of an activity during an execution.
class ActivityStartedEventDetails {
  /// The name of the worker that the task is assigned to. These names are
  /// provided by the workers when calling GetActivityTask.
  final String workerName;

  ActivityStartedEventDetails({
    this.workerName,
  });
  static ActivityStartedEventDetails fromJson(Map<String, dynamic> json) =>
      ActivityStartedEventDetails(
        workerName: json.containsKey('workerName')
            ? json['workerName'] as String
            : null,
      );
}

/// Contains details about an activity that successfully terminated during an
/// execution.
class ActivitySucceededEventDetails {
  /// The JSON data output by the activity task.
  final String output;

  ActivitySucceededEventDetails({
    this.output,
  });
  static ActivitySucceededEventDetails fromJson(Map<String, dynamic> json) =>
      ActivitySucceededEventDetails(
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about an activity timeout that occurred during an
/// execution.
class ActivityTimedOutEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the timeout.
  final String cause;

  ActivityTimedOutEventDetails({
    this.error,
    this.cause,
  });
  static ActivityTimedOutEventDetails fromJson(Map<String, dynamic> json) =>
      ActivityTimedOutEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

class CreateActivityOutput {
  /// The Amazon Resource Name (ARN) that identifies the created activity.
  final String activityArn;

  /// The date the activity is created.
  final DateTime creationDate;

  CreateActivityOutput({
    @required this.activityArn,
    @required this.creationDate,
  });
  static CreateActivityOutput fromJson(Map<String, dynamic> json) =>
      CreateActivityOutput(
        activityArn: json['activityArn'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

class CreateStateMachineOutput {
  /// The Amazon Resource Name (ARN) that identifies the created state machine.
  final String stateMachineArn;

  /// The date the state machine is created.
  final DateTime creationDate;

  CreateStateMachineOutput({
    @required this.stateMachineArn,
    @required this.creationDate,
  });
  static CreateStateMachineOutput fromJson(Map<String, dynamic> json) =>
      CreateStateMachineOutput(
        stateMachineArn: json['stateMachineArn'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

class DeleteActivityOutput {
  DeleteActivityOutput();
  static DeleteActivityOutput fromJson(Map<String, dynamic> json) =>
      DeleteActivityOutput();
}

class DeleteStateMachineOutput {
  DeleteStateMachineOutput();
  static DeleteStateMachineOutput fromJson(Map<String, dynamic> json) =>
      DeleteStateMachineOutput();
}

class DescribeActivityOutput {
  /// The Amazon Resource Name (ARN) that identifies the activity.
  final String activityArn;

  /// The name of the activity.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The date the activity is created.
  final DateTime creationDate;

  DescribeActivityOutput({
    @required this.activityArn,
    @required this.name,
    @required this.creationDate,
  });
  static DescribeActivityOutput fromJson(Map<String, dynamic> json) =>
      DescribeActivityOutput(
        activityArn: json['activityArn'] as String,
        name: json['name'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

class DescribeExecutionOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The Amazon Resource Name (ARN) of the executed stated machine.
  final String stateMachineArn;

  /// The name of the execution.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The current status of the execution.
  final String status;

  /// The date the execution is started.
  final DateTime startDate;

  /// If the execution has already ended, the date the execution stopped.
  final DateTime stopDate;

  /// The string that contains the JSON input data of the execution.
  final String input;

  /// The JSON output data of the execution.
  ///
  ///
  ///
  /// This field is set only if the execution succeeds. If the execution fails,
  /// this field is null.
  final String output;

  DescribeExecutionOutput({
    @required this.executionArn,
    @required this.stateMachineArn,
    this.name,
    @required this.status,
    @required this.startDate,
    this.stopDate,
    @required this.input,
    this.output,
  });
  static DescribeExecutionOutput fromJson(Map<String, dynamic> json) =>
      DescribeExecutionOutput(
        executionArn: json['executionArn'] as String,
        stateMachineArn: json['stateMachineArn'] as String,
        name: json.containsKey('name') ? json['name'] as String : null,
        status: json['status'] as String,
        startDate: DateTime.parse(json['startDate']),
        stopDate: json.containsKey('stopDate')
            ? DateTime.parse(json['stopDate'])
            : null,
        input: json['input'] as String,
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

class DescribeStateMachineForExecutionOutput {
  /// The Amazon Resource Name (ARN) of the state machine associated with the
  /// execution.
  final String stateMachineArn;

  /// The name of the state machine associated with the execution.
  final String name;

  /// The Amazon States Language definition of the state machine. See
  /// [Amazon States Language](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html).
  final String definition;

  /// The Amazon Resource Name (ARN) of the IAM role of the State Machine for
  /// the execution.
  final String roleArn;

  /// The date and time the state machine associated with an execution was
  /// updated. For a newly created state machine, this is the creation date.
  final DateTime updateDate;

  DescribeStateMachineForExecutionOutput({
    @required this.stateMachineArn,
    @required this.name,
    @required this.definition,
    @required this.roleArn,
    @required this.updateDate,
  });
  static DescribeStateMachineForExecutionOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeStateMachineForExecutionOutput(
        stateMachineArn: json['stateMachineArn'] as String,
        name: json['name'] as String,
        definition: json['definition'] as String,
        roleArn: json['roleArn'] as String,
        updateDate: DateTime.parse(json['updateDate']),
      );
}

class DescribeStateMachineOutput {
  /// The Amazon Resource Name (ARN) that identifies the state machine.
  final String stateMachineArn;

  /// The name of the state machine.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The current status of the state machine.
  final String status;

  /// The Amazon States Language definition of the state machine. See
  /// [Amazon States Language](https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html).
  final String definition;

  /// The Amazon Resource Name (ARN) of the IAM role used when creating this
  /// state machine. (The IAM role maintains security by granting Step Functions
  /// access to AWS resources.)
  final String roleArn;

  /// The date the state machine is created.
  final DateTime creationDate;

  DescribeStateMachineOutput({
    @required this.stateMachineArn,
    @required this.name,
    this.status,
    @required this.definition,
    @required this.roleArn,
    @required this.creationDate,
  });
  static DescribeStateMachineOutput fromJson(Map<String, dynamic> json) =>
      DescribeStateMachineOutput(
        stateMachineArn: json['stateMachineArn'] as String,
        name: json['name'] as String,
        status: json.containsKey('status') ? json['status'] as String : null,
        definition: json['definition'] as String,
        roleArn: json['roleArn'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

/// Contains details about an abort of an execution.
class ExecutionAbortedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  ExecutionAbortedEventDetails({
    this.error,
    this.cause,
  });
  static ExecutionAbortedEventDetails fromJson(Map<String, dynamic> json) =>
      ExecutionAbortedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about an execution failure event.
class ExecutionFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  ExecutionFailedEventDetails({
    this.error,
    this.cause,
  });
  static ExecutionFailedEventDetails fromJson(Map<String, dynamic> json) =>
      ExecutionFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about an execution.
class ExecutionListItem {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The Amazon Resource Name (ARN) of the executed state machine.
  final String stateMachineArn;

  /// The name of the execution.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The current status of the execution.
  final String status;

  /// The date the execution started.
  final DateTime startDate;

  /// If the execution already ended, the date the execution stopped.
  final DateTime stopDate;

  ExecutionListItem({
    @required this.executionArn,
    @required this.stateMachineArn,
    @required this.name,
    @required this.status,
    @required this.startDate,
    this.stopDate,
  });
  static ExecutionListItem fromJson(Map<String, dynamic> json) =>
      ExecutionListItem(
        executionArn: json['executionArn'] as String,
        stateMachineArn: json['stateMachineArn'] as String,
        name: json['name'] as String,
        status: json['status'] as String,
        startDate: DateTime.parse(json['startDate']),
        stopDate: json.containsKey('stopDate')
            ? DateTime.parse(json['stopDate'])
            : null,
      );
}

/// Contains details about the start of the execution.
class ExecutionStartedEventDetails {
  /// The JSON data input to the execution.
  final String input;

  /// The Amazon Resource Name (ARN) of the IAM role used for executing AWS
  /// Lambda tasks.
  final String roleArn;

  ExecutionStartedEventDetails({
    this.input,
    this.roleArn,
  });
  static ExecutionStartedEventDetails fromJson(Map<String, dynamic> json) =>
      ExecutionStartedEventDetails(
        input: json.containsKey('input') ? json['input'] as String : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
      );
}

/// Contains details about the successful termination of the execution.
class ExecutionSucceededEventDetails {
  /// The JSON data output by the execution.
  final String output;

  ExecutionSucceededEventDetails({
    this.output,
  });
  static ExecutionSucceededEventDetails fromJson(Map<String, dynamic> json) =>
      ExecutionSucceededEventDetails(
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about the execution timeout that occurred during the
/// execution.
class ExecutionTimedOutEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the timeout.
  final String cause;

  ExecutionTimedOutEventDetails({
    this.error,
    this.cause,
  });
  static ExecutionTimedOutEventDetails fromJson(Map<String, dynamic> json) =>
      ExecutionTimedOutEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

class GetActivityTaskOutput {
  /// A token that identifies the scheduled task. This token must be copied and
  /// included in subsequent calls to SendTaskHeartbeat, SendTaskSuccess or
  /// SendTaskFailure in order to report the progress or completion of the task.
  final String taskToken;

  /// The string that contains the JSON input data for the task.
  final String input;

  GetActivityTaskOutput({
    this.taskToken,
    this.input,
  });
  static GetActivityTaskOutput fromJson(Map<String, dynamic> json) =>
      GetActivityTaskOutput(
        taskToken:
            json.containsKey('taskToken') ? json['taskToken'] as String : null,
        input: json.containsKey('input') ? json['input'] as String : null,
      );
}

class GetExecutionHistoryOutput {
  /// The list of events that occurred in the execution.
  final List<HistoryEvent> events;

  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  final String nextToken;

  GetExecutionHistoryOutput({
    @required this.events,
    this.nextToken,
  });
  static GetExecutionHistoryOutput fromJson(Map<String, dynamic> json) =>
      GetExecutionHistoryOutput(
        events: (json['events'] as List)
            .map((e) => HistoryEvent.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Contains details about the events of an execution.
class HistoryEvent {
  /// The date and time the event occurred.
  final DateTime timestamp;

  /// The type of the event.
  final String type;

  /// The id of the event. Events are numbered sequentially, starting at one.
  final BigInt id;

  /// The id of the previous event.
  final BigInt previousEventId;

  final ActivityFailedEventDetails activityFailedEventDetails;

  /// Contains details about an activity schedule event that failed during an
  /// execution.
  final ActivityScheduleFailedEventDetails activityScheduleFailedEventDetails;

  final ActivityScheduledEventDetails activityScheduledEventDetails;

  final ActivityStartedEventDetails activityStartedEventDetails;

  final ActivitySucceededEventDetails activitySucceededEventDetails;

  final ActivityTimedOutEventDetails activityTimedOutEventDetails;

  /// Contains details about the failure of a task.
  final TaskFailedEventDetails taskFailedEventDetails;

  /// Contains details about a task that was scheduled.
  final TaskScheduledEventDetails taskScheduledEventDetails;

  /// Contains details about a task that failed to start.
  final TaskStartFailedEventDetails taskStartFailedEventDetails;

  /// Contains details about a task that was started.
  final TaskStartedEventDetails taskStartedEventDetails;

  /// Contains details about a task that where the submit failed.
  final TaskSubmitFailedEventDetails taskSubmitFailedEventDetails;

  /// Contains details about a submitted task.
  final TaskSubmittedEventDetails taskSubmittedEventDetails;

  /// Contains details about a task that succeeded.
  final TaskSucceededEventDetails taskSucceededEventDetails;

  /// Contains details about a task that timed out.
  final TaskTimedOutEventDetails taskTimedOutEventDetails;

  final ExecutionFailedEventDetails executionFailedEventDetails;

  final ExecutionStartedEventDetails executionStartedEventDetails;

  final ExecutionSucceededEventDetails executionSucceededEventDetails;

  final ExecutionAbortedEventDetails executionAbortedEventDetails;

  final ExecutionTimedOutEventDetails executionTimedOutEventDetails;

  /// Contains details about Map state that was started.
  final MapStateStartedEventDetails mapStateStartedEventDetails;

  /// Contains details about an iteration of a Map state that was started.
  final MapIterationEventDetails mapIterationStartedEventDetails;

  /// Contains details about an iteration of a Map state that succeeded.
  final MapIterationEventDetails mapIterationSucceededEventDetails;

  /// Contains details about an iteration of a Map state that failed.
  final MapIterationEventDetails mapIterationFailedEventDetails;

  /// Contains details about an iteration of a Map state that was aborted.
  final MapIterationEventDetails mapIterationAbortedEventDetails;

  final LambdaFunctionFailedEventDetails lambdaFunctionFailedEventDetails;

  final LambdaFunctionScheduleFailedEventDetails
      lambdaFunctionScheduleFailedEventDetails;

  final LambdaFunctionScheduledEventDetails lambdaFunctionScheduledEventDetails;

  /// Contains details about a lambda function that failed to start during an
  /// execution.
  final LambdaFunctionStartFailedEventDetails
      lambdaFunctionStartFailedEventDetails;

  /// Contains details about a lambda function that terminated successfully
  /// during an execution.
  final LambdaFunctionSucceededEventDetails lambdaFunctionSucceededEventDetails;

  final LambdaFunctionTimedOutEventDetails lambdaFunctionTimedOutEventDetails;

  final StateEnteredEventDetails stateEnteredEventDetails;

  final StateExitedEventDetails stateExitedEventDetails;

  HistoryEvent({
    @required this.timestamp,
    @required this.type,
    @required this.id,
    this.previousEventId,
    this.activityFailedEventDetails,
    this.activityScheduleFailedEventDetails,
    this.activityScheduledEventDetails,
    this.activityStartedEventDetails,
    this.activitySucceededEventDetails,
    this.activityTimedOutEventDetails,
    this.taskFailedEventDetails,
    this.taskScheduledEventDetails,
    this.taskStartFailedEventDetails,
    this.taskStartedEventDetails,
    this.taskSubmitFailedEventDetails,
    this.taskSubmittedEventDetails,
    this.taskSucceededEventDetails,
    this.taskTimedOutEventDetails,
    this.executionFailedEventDetails,
    this.executionStartedEventDetails,
    this.executionSucceededEventDetails,
    this.executionAbortedEventDetails,
    this.executionTimedOutEventDetails,
    this.mapStateStartedEventDetails,
    this.mapIterationStartedEventDetails,
    this.mapIterationSucceededEventDetails,
    this.mapIterationFailedEventDetails,
    this.mapIterationAbortedEventDetails,
    this.lambdaFunctionFailedEventDetails,
    this.lambdaFunctionScheduleFailedEventDetails,
    this.lambdaFunctionScheduledEventDetails,
    this.lambdaFunctionStartFailedEventDetails,
    this.lambdaFunctionSucceededEventDetails,
    this.lambdaFunctionTimedOutEventDetails,
    this.stateEnteredEventDetails,
    this.stateExitedEventDetails,
  });
  static HistoryEvent fromJson(Map<String, dynamic> json) => HistoryEvent(
        timestamp: DateTime.parse(json['timestamp']),
        type: json['type'] as String,
        id: BigInt.from(json['id']),
        previousEventId: json.containsKey('previousEventId')
            ? BigInt.from(json['previousEventId'])
            : null,
        activityFailedEventDetails:
            json.containsKey('activityFailedEventDetails')
                ? ActivityFailedEventDetails.fromJson(
                    json['activityFailedEventDetails'])
                : null,
        activityScheduleFailedEventDetails:
            json.containsKey('activityScheduleFailedEventDetails')
                ? ActivityScheduleFailedEventDetails.fromJson(
                    json['activityScheduleFailedEventDetails'])
                : null,
        activityScheduledEventDetails:
            json.containsKey('activityScheduledEventDetails')
                ? ActivityScheduledEventDetails.fromJson(
                    json['activityScheduledEventDetails'])
                : null,
        activityStartedEventDetails:
            json.containsKey('activityStartedEventDetails')
                ? ActivityStartedEventDetails.fromJson(
                    json['activityStartedEventDetails'])
                : null,
        activitySucceededEventDetails:
            json.containsKey('activitySucceededEventDetails')
                ? ActivitySucceededEventDetails.fromJson(
                    json['activitySucceededEventDetails'])
                : null,
        activityTimedOutEventDetails:
            json.containsKey('activityTimedOutEventDetails')
                ? ActivityTimedOutEventDetails.fromJson(
                    json['activityTimedOutEventDetails'])
                : null,
        taskFailedEventDetails: json.containsKey('taskFailedEventDetails')
            ? TaskFailedEventDetails.fromJson(json['taskFailedEventDetails'])
            : null,
        taskScheduledEventDetails: json.containsKey('taskScheduledEventDetails')
            ? TaskScheduledEventDetails.fromJson(
                json['taskScheduledEventDetails'])
            : null,
        taskStartFailedEventDetails:
            json.containsKey('taskStartFailedEventDetails')
                ? TaskStartFailedEventDetails.fromJson(
                    json['taskStartFailedEventDetails'])
                : null,
        taskStartedEventDetails: json.containsKey('taskStartedEventDetails')
            ? TaskStartedEventDetails.fromJson(json['taskStartedEventDetails'])
            : null,
        taskSubmitFailedEventDetails:
            json.containsKey('taskSubmitFailedEventDetails')
                ? TaskSubmitFailedEventDetails.fromJson(
                    json['taskSubmitFailedEventDetails'])
                : null,
        taskSubmittedEventDetails: json.containsKey('taskSubmittedEventDetails')
            ? TaskSubmittedEventDetails.fromJson(
                json['taskSubmittedEventDetails'])
            : null,
        taskSucceededEventDetails: json.containsKey('taskSucceededEventDetails')
            ? TaskSucceededEventDetails.fromJson(
                json['taskSucceededEventDetails'])
            : null,
        taskTimedOutEventDetails: json.containsKey('taskTimedOutEventDetails')
            ? TaskTimedOutEventDetails.fromJson(
                json['taskTimedOutEventDetails'])
            : null,
        executionFailedEventDetails:
            json.containsKey('executionFailedEventDetails')
                ? ExecutionFailedEventDetails.fromJson(
                    json['executionFailedEventDetails'])
                : null,
        executionStartedEventDetails:
            json.containsKey('executionStartedEventDetails')
                ? ExecutionStartedEventDetails.fromJson(
                    json['executionStartedEventDetails'])
                : null,
        executionSucceededEventDetails:
            json.containsKey('executionSucceededEventDetails')
                ? ExecutionSucceededEventDetails.fromJson(
                    json['executionSucceededEventDetails'])
                : null,
        executionAbortedEventDetails:
            json.containsKey('executionAbortedEventDetails')
                ? ExecutionAbortedEventDetails.fromJson(
                    json['executionAbortedEventDetails'])
                : null,
        executionTimedOutEventDetails:
            json.containsKey('executionTimedOutEventDetails')
                ? ExecutionTimedOutEventDetails.fromJson(
                    json['executionTimedOutEventDetails'])
                : null,
        mapStateStartedEventDetails:
            json.containsKey('mapStateStartedEventDetails')
                ? MapStateStartedEventDetails.fromJson(
                    json['mapStateStartedEventDetails'])
                : null,
        mapIterationStartedEventDetails:
            json.containsKey('mapIterationStartedEventDetails')
                ? MapIterationEventDetails.fromJson(
                    json['mapIterationStartedEventDetails'])
                : null,
        mapIterationSucceededEventDetails:
            json.containsKey('mapIterationSucceededEventDetails')
                ? MapIterationEventDetails.fromJson(
                    json['mapIterationSucceededEventDetails'])
                : null,
        mapIterationFailedEventDetails:
            json.containsKey('mapIterationFailedEventDetails')
                ? MapIterationEventDetails.fromJson(
                    json['mapIterationFailedEventDetails'])
                : null,
        mapIterationAbortedEventDetails:
            json.containsKey('mapIterationAbortedEventDetails')
                ? MapIterationEventDetails.fromJson(
                    json['mapIterationAbortedEventDetails'])
                : null,
        lambdaFunctionFailedEventDetails:
            json.containsKey('lambdaFunctionFailedEventDetails')
                ? LambdaFunctionFailedEventDetails.fromJson(
                    json['lambdaFunctionFailedEventDetails'])
                : null,
        lambdaFunctionScheduleFailedEventDetails:
            json.containsKey('lambdaFunctionScheduleFailedEventDetails')
                ? LambdaFunctionScheduleFailedEventDetails.fromJson(
                    json['lambdaFunctionScheduleFailedEventDetails'])
                : null,
        lambdaFunctionScheduledEventDetails:
            json.containsKey('lambdaFunctionScheduledEventDetails')
                ? LambdaFunctionScheduledEventDetails.fromJson(
                    json['lambdaFunctionScheduledEventDetails'])
                : null,
        lambdaFunctionStartFailedEventDetails:
            json.containsKey('lambdaFunctionStartFailedEventDetails')
                ? LambdaFunctionStartFailedEventDetails.fromJson(
                    json['lambdaFunctionStartFailedEventDetails'])
                : null,
        lambdaFunctionSucceededEventDetails:
            json.containsKey('lambdaFunctionSucceededEventDetails')
                ? LambdaFunctionSucceededEventDetails.fromJson(
                    json['lambdaFunctionSucceededEventDetails'])
                : null,
        lambdaFunctionTimedOutEventDetails:
            json.containsKey('lambdaFunctionTimedOutEventDetails')
                ? LambdaFunctionTimedOutEventDetails.fromJson(
                    json['lambdaFunctionTimedOutEventDetails'])
                : null,
        stateEnteredEventDetails: json.containsKey('stateEnteredEventDetails')
            ? StateEnteredEventDetails.fromJson(
                json['stateEnteredEventDetails'])
            : null,
        stateExitedEventDetails: json.containsKey('stateExitedEventDetails')
            ? StateExitedEventDetails.fromJson(json['stateExitedEventDetails'])
            : null,
      );
}

/// Contains details about a lambda function that failed during an execution.
class LambdaFunctionFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  LambdaFunctionFailedEventDetails({
    this.error,
    this.cause,
  });
  static LambdaFunctionFailedEventDetails fromJson(Map<String, dynamic> json) =>
      LambdaFunctionFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about a failed lambda function schedule event that occurred
/// during an execution.
class LambdaFunctionScheduleFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  LambdaFunctionScheduleFailedEventDetails({
    this.error,
    this.cause,
  });
  static LambdaFunctionScheduleFailedEventDetails fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionScheduleFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about a lambda function scheduled during an execution.
class LambdaFunctionScheduledEventDetails {
  /// The Amazon Resource Name (ARN) of the scheduled lambda function.
  final String resource;

  /// The JSON data input to the lambda function.
  final String input;

  /// The maximum allowed duration of the lambda function.
  final BigInt timeoutInSeconds;

  LambdaFunctionScheduledEventDetails({
    @required this.resource,
    this.input,
    this.timeoutInSeconds,
  });
  static LambdaFunctionScheduledEventDetails fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionScheduledEventDetails(
        resource: json['resource'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
        timeoutInSeconds: json.containsKey('timeoutInSeconds')
            ? BigInt.from(json['timeoutInSeconds'])
            : null,
      );
}

/// Contains details about a lambda function that failed to start during an
/// execution.
class LambdaFunctionStartFailedEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  LambdaFunctionStartFailedEventDetails({
    this.error,
    this.cause,
  });
  static LambdaFunctionStartFailedEventDetails fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionStartFailedEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about a lambda function that successfully terminated during
/// an execution.
class LambdaFunctionSucceededEventDetails {
  /// The JSON data output by the lambda function.
  final String output;

  LambdaFunctionSucceededEventDetails({
    this.output,
  });
  static LambdaFunctionSucceededEventDetails fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionSucceededEventDetails(
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about a lambda function timeout that occurred during an
/// execution.
class LambdaFunctionTimedOutEventDetails {
  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the timeout.
  final String cause;

  LambdaFunctionTimedOutEventDetails({
    this.error,
    this.cause,
  });
  static LambdaFunctionTimedOutEventDetails fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionTimedOutEventDetails(
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

class ListActivitiesOutput {
  /// The list of activities.
  final List<ActivityListItem> activities;

  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  final String nextToken;

  ListActivitiesOutput({
    @required this.activities,
    this.nextToken,
  });
  static ListActivitiesOutput fromJson(Map<String, dynamic> json) =>
      ListActivitiesOutput(
        activities: (json['activities'] as List)
            .map((e) => ActivityListItem.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListExecutionsOutput {
  /// The list of matching executions.
  final List<ExecutionListItem> executions;

  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  final String nextToken;

  ListExecutionsOutput({
    @required this.executions,
    this.nextToken,
  });
  static ListExecutionsOutput fromJson(Map<String, dynamic> json) =>
      ListExecutionsOutput(
        executions: (json['executions'] as List)
            .map((e) => ExecutionListItem.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListStateMachinesOutput {
  final List<StateMachineListItem> stateMachines;

  /// If `nextToken` is returned, there are more results available. The value of
  /// `nextToken` is a unique pagination token for each page. Make the call
  /// again using the returned token to retrieve the next page. Keep all other
  /// arguments unchanged. Each pagination token expires after 24 hours. Using
  /// an expired pagination token will return an _HTTP 400 InvalidToken_ error.
  final String nextToken;

  ListStateMachinesOutput({
    @required this.stateMachines,
    this.nextToken,
  });
  static ListStateMachinesOutput fromJson(Map<String, dynamic> json) =>
      ListStateMachinesOutput(
        stateMachines: (json['stateMachines'] as List)
            .map((e) => StateMachineListItem.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceOutput {
  /// An array of tags associated with the resource.
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Contains details about an iteration of a Map state.
class MapIterationEventDetails {
  /// The name of the iteration’s parent Map state.
  final String name;

  /// The index of the array belonging to the Map state iteration.
  final int index;

  MapIterationEventDetails({
    this.name,
    this.index,
  });
  static MapIterationEventDetails fromJson(Map<String, dynamic> json) =>
      MapIterationEventDetails(
        name: json.containsKey('name') ? json['name'] as String : null,
        index: json.containsKey('index') ? json['index'] as int : null,
      );
}

/// Details about a Map state that was started.
class MapStateStartedEventDetails {
  /// The size of the array for Map state iterations.
  final int length;

  MapStateStartedEventDetails({
    this.length,
  });
  static MapStateStartedEventDetails fromJson(Map<String, dynamic> json) =>
      MapStateStartedEventDetails(
        length: json.containsKey('length') ? json['length'] as int : null,
      );
}

class SendTaskFailureOutput {
  SendTaskFailureOutput();
  static SendTaskFailureOutput fromJson(Map<String, dynamic> json) =>
      SendTaskFailureOutput();
}

class SendTaskHeartbeatOutput {
  SendTaskHeartbeatOutput();
  static SendTaskHeartbeatOutput fromJson(Map<String, dynamic> json) =>
      SendTaskHeartbeatOutput();
}

class SendTaskSuccessOutput {
  SendTaskSuccessOutput();
  static SendTaskSuccessOutput fromJson(Map<String, dynamic> json) =>
      SendTaskSuccessOutput();
}

class StartExecutionOutput {
  /// The Amazon Resource Name (ARN) that identifies the execution.
  final String executionArn;

  /// The date the execution is started.
  final DateTime startDate;

  StartExecutionOutput({
    @required this.executionArn,
    @required this.startDate,
  });
  static StartExecutionOutput fromJson(Map<String, dynamic> json) =>
      StartExecutionOutput(
        executionArn: json['executionArn'] as String,
        startDate: DateTime.parse(json['startDate']),
      );
}

/// Contains details about a state entered during an execution.
class StateEnteredEventDetails {
  /// The name of the state.
  final String name;

  /// The string that contains the JSON input data for the state.
  final String input;

  StateEnteredEventDetails({
    @required this.name,
    this.input,
  });
  static StateEnteredEventDetails fromJson(Map<String, dynamic> json) =>
      StateEnteredEventDetails(
        name: json['name'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
      );
}

/// Contains details about an exit from a state during an execution.
class StateExitedEventDetails {
  /// The name of the state.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The JSON output data of the state.
  final String output;

  StateExitedEventDetails({
    @required this.name,
    this.output,
  });
  static StateExitedEventDetails fromJson(Map<String, dynamic> json) =>
      StateExitedEventDetails(
        name: json['name'] as String,
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about the state machine.
class StateMachineListItem {
  /// The Amazon Resource Name (ARN) that identifies the state machine.
  final String stateMachineArn;

  /// The name of the state machine.
  ///
  /// A name must _not_ contain:
  ///
  /// *   white space
  ///
  /// *   brackets `< > { } [ ]`
  ///
  /// *   wildcard characters `? *`
  ///
  /// *   special characters ``" # %  ^ | ~ ` $ & , ; : /``
  ///
  /// *   control characters (`U+0000-001F`, `U+007F-009F`)
  final String name;

  /// The date the state machine is created.
  final DateTime creationDate;

  StateMachineListItem({
    @required this.stateMachineArn,
    @required this.name,
    @required this.creationDate,
  });
  static StateMachineListItem fromJson(Map<String, dynamic> json) =>
      StateMachineListItem(
        stateMachineArn: json['stateMachineArn'] as String,
        name: json['name'] as String,
        creationDate: DateTime.parse(json['creationDate']),
      );
}

class StopExecutionOutput {
  /// The date the execution is stopped.
  final DateTime stopDate;

  StopExecutionOutput({
    @required this.stopDate,
  });
  static StopExecutionOutput fromJson(Map<String, dynamic> json) =>
      StopExecutionOutput(
        stopDate: DateTime.parse(json['stopDate']),
      );
}

/// Tags are key-value pairs that can be associated with Step Functions state
/// machines and activities.
///
/// An array of key-value pairs. For more information, see
/// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
/// in the _AWS Billing and Cost Management User Guide_, and
/// [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
///
/// Tags may only contain Unicode letters, digits, white space, or these
/// symbols: `_ . : / = + - @`.
class Tag {
  /// The key of a tag.
  final String key;

  /// The value of a tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('key') ? json['key'] as String : null,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

/// Contains details about a task failure event.
class TaskFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  TaskFailedEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.error,
    this.cause,
  });
  static TaskFailedEventDetails fromJson(Map<String, dynamic> json) =>
      TaskFailedEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about a task scheduled during an execution.
class TaskScheduledEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The region of the scheduled task
  final String region;

  /// The JSON data passed to the resource referenced in a task state.
  final String parameters;

  /// The maximum allowed duration of the task.
  final BigInt timeoutInSeconds;

  TaskScheduledEventDetails({
    @required this.resourceType,
    @required this.resource,
    @required this.region,
    @required this.parameters,
    this.timeoutInSeconds,
  });
  static TaskScheduledEventDetails fromJson(Map<String, dynamic> json) =>
      TaskScheduledEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        region: json['region'] as String,
        parameters: json['parameters'] as String,
        timeoutInSeconds: json.containsKey('timeoutInSeconds')
            ? BigInt.from(json['timeoutInSeconds'])
            : null,
      );
}

/// Contains details about a task that failed to start during an execution.
class TaskStartFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  TaskStartFailedEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.error,
    this.cause,
  });
  static TaskStartFailedEventDetails fromJson(Map<String, dynamic> json) =>
      TaskStartFailedEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about the start of a task during an execution.
class TaskStartedEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  TaskStartedEventDetails({
    @required this.resourceType,
    @required this.resource,
  });
  static TaskStartedEventDetails fromJson(Map<String, dynamic> json) =>
      TaskStartedEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
      );
}

/// Contains details about a task that failed to submit during an execution.
class TaskSubmitFailedEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  TaskSubmitFailedEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.error,
    this.cause,
  });
  static TaskSubmitFailedEventDetails fromJson(Map<String, dynamic> json) =>
      TaskSubmitFailedEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Contains details about a task submitted to a resource .
class TaskSubmittedEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The response from a resource when a task has started.
  final String output;

  TaskSubmittedEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.output,
  });
  static TaskSubmittedEventDetails fromJson(Map<String, dynamic> json) =>
      TaskSubmittedEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about the successful completion of a task state.
class TaskSucceededEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The full JSON response from a resource when a task has succeeded. This
  /// response becomes the output of the related task.
  final String output;

  TaskSucceededEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.output,
  });
  static TaskSucceededEventDetails fromJson(Map<String, dynamic> json) =>
      TaskSucceededEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        output: json.containsKey('output') ? json['output'] as String : null,
      );
}

/// Contains details about a resource timeout that occurred during an execution.
class TaskTimedOutEventDetails {
  /// The action of the resource called by a task state.
  final String resourceType;

  /// The service name of the resource in a task state.
  final String resource;

  /// The error code of the failure.
  final String error;

  /// A more detailed explanation of the cause of the failure.
  final String cause;

  TaskTimedOutEventDetails({
    @required this.resourceType,
    @required this.resource,
    this.error,
    this.cause,
  });
  static TaskTimedOutEventDetails fromJson(Map<String, dynamic> json) =>
      TaskTimedOutEventDetails(
        resourceType: json['resourceType'] as String,
        resource: json['resource'] as String,
        error: json.containsKey('error') ? json['error'] as String : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}

class UpdateStateMachineOutput {
  /// The date and time the state machine was updated.
  final DateTime updateDate;

  UpdateStateMachineOutput({
    @required this.updateDate,
  });
  static UpdateStateMachineOutput fromJson(Map<String, dynamic> json) =>
      UpdateStateMachineOutput(
        updateDate: DateTime.parse(json['updateDate']),
      );
}
