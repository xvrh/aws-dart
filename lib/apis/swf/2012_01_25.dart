import 'package:meta/meta.dart';

/// Amazon Simple Workflow Service
///
/// The Amazon Simple Workflow Service (Amazon SWF) makes it easy to build
/// applications that use Amazon's cloud to coordinate work across distributed
/// components. In Amazon SWF, a _task_ represents a logical unit of work that
/// is performed by a component of your workflow. Coordinating tasks in a
/// workflow involves managing intertask dependencies, scheduling, and
/// concurrency in accordance with the logical flow of the application.
///
/// Amazon SWF gives you full control over implementing tasks and coordinating
/// them without worrying about underlying complexities such as tracking their
/// progress and maintaining their state.
///
/// This documentation serves as reference only. For a broader overview of the
/// Amazon SWF programming model, see the
/// _[Amazon SWF Developer Guide](https://docs.aws.amazon.com/amazonswf/latest/developerguide/)_
/// .
class SwfApi {
  final _client;
  SwfApi(client) : _client = client.configured('SWF', serializer: 'json');

  /// Returns the number of closed workflow executions within the given domain
  /// that meet the specified filtering criteria.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `tagFilter.tag`: String constraint. The key is
  /// `swf:tagFilter.tag`.
  ///
  ///     *    `typeFilter.name`: String constraint. The key is
  /// `swf:typeFilter.name`.
  ///
  ///     *    `typeFilter.version`: String constraint. The key is
  /// `swf:typeFilter.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow executions to
  /// count.
  ///
  /// [startTimeFilter]: If specified, only workflow executions that meet the
  /// start time criteria of the filter are counted.
  ///
  ///   `startTimeFilter` and `closeTimeFilter` are mutually exclusive. You must
  /// specify one of these in a request but not both.
  ///
  /// [closeTimeFilter]: If specified, only workflow executions that meet the
  /// close time criteria of the filter are counted.
  ///
  ///   `startTimeFilter` and `closeTimeFilter` are mutually exclusive. You must
  /// specify one of these in a request but not both.
  ///
  /// [executionFilter]: If specified, only workflow executions matching the
  /// `WorkflowId` in the filter are counted.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [typeFilter]: If specified, indicates the type of the workflow executions
  /// to be counted.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [tagFilter]: If specified, only executions that have a tag that matches
  /// the filter are counted.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [closeStatusFilter]: If specified, only workflow executions that match
  /// this close status are counted. This filter has an affect only if
  /// `executionStatus` is specified as `CLOSED`.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  Future<WorkflowExecutionCount> countClosedWorkflowExecutions(String domain,
      {ExecutionTimeFilter startTimeFilter,
      ExecutionTimeFilter closeTimeFilter,
      WorkflowExecutionFilter executionFilter,
      WorkflowTypeFilter typeFilter,
      TagFilter tagFilter,
      CloseStatusFilter closeStatusFilter}) async {
    var response_ = await _client.send('CountClosedWorkflowExecutions', {
      'domain': domain,
      if (startTimeFilter != null) 'startTimeFilter': startTimeFilter,
      if (closeTimeFilter != null) 'closeTimeFilter': closeTimeFilter,
      if (executionFilter != null) 'executionFilter': executionFilter,
      if (typeFilter != null) 'typeFilter': typeFilter,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (closeStatusFilter != null) 'closeStatusFilter': closeStatusFilter,
    });
    return WorkflowExecutionCount.fromJson(response_);
  }

  /// Returns the number of open workflow executions within the given domain
  /// that meet the specified filtering criteria.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `tagFilter.tag`: String constraint. The key is
  /// `swf:tagFilter.tag`.
  ///
  ///     *    `typeFilter.name`: String constraint. The key is
  /// `swf:typeFilter.name`.
  ///
  ///     *    `typeFilter.version`: String constraint. The key is
  /// `swf:typeFilter.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow executions to
  /// count.
  ///
  /// [startTimeFilter]: Specifies the start time criteria that workflow
  /// executions must meet in order to be counted.
  ///
  /// [typeFilter]: Specifies the type of the workflow executions to be counted.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  ///
  /// [tagFilter]: If specified, only executions that have a tag that matches
  /// the filter are counted.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  ///
  /// [executionFilter]: If specified, only workflow executions matching the
  /// `WorkflowId` in the filter are counted.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  Future<WorkflowExecutionCount> countOpenWorkflowExecutions(
      {@required String domain,
      @required ExecutionTimeFilter startTimeFilter,
      WorkflowTypeFilter typeFilter,
      TagFilter tagFilter,
      WorkflowExecutionFilter executionFilter}) async {
    var response_ = await _client.send('CountOpenWorkflowExecutions', {
      'domain': domain,
      'startTimeFilter': startTimeFilter,
      if (typeFilter != null) 'typeFilter': typeFilter,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (executionFilter != null) 'executionFilter': executionFilter,
    });
    return WorkflowExecutionCount.fromJson(response_);
  }

  /// Returns the estimated number of activity tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no activity task was ever scheduled in
  /// then `0` is returned.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the `taskList.name` parameter by using a `Condition` element
  /// with the `swf:taskList.name` key to allow the action to access only
  /// certain task lists.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain that contains the task list.
  ///
  /// [taskList]: The name of the task list.
  Future<PendingTaskCount> countPendingActivityTasks(
      {@required String domain, @required TaskList taskList}) async {
    var response_ = await _client.send('CountPendingActivityTasks', {
      'domain': domain,
      'taskList': taskList,
    });
    return PendingTaskCount.fromJson(response_);
  }

  /// Returns the estimated number of decision tasks in the specified task list.
  /// The count returned is an approximation and isn't guaranteed to be exact.
  /// If you specify a task list that no decision task was ever scheduled in
  /// then `0` is returned.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the `taskList.name` parameter by using a `Condition` element
  /// with the `swf:taskList.name` key to allow the action to access only
  /// certain task lists.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain that contains the task list.
  ///
  /// [taskList]: The name of the task list.
  Future<PendingTaskCount> countPendingDecisionTasks(
      {@required String domain, @required TaskList taskList}) async {
    var response_ = await _client.send('CountPendingDecisionTasks', {
      'domain': domain,
      'taskList': taskList,
    });
    return PendingTaskCount.fromJson(response_);
  }

  /// Deprecates the specified _activity type_. After an activity type has been
  /// deprecated, you cannot create new tasks of that activity type. Tasks of
  /// this type that were scheduled before the type was deprecated continue to
  /// run.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `activityType.name`: String constraint. The key is
  /// `swf:activityType.name`.
  ///
  ///     *    `activityType.version`: String constraint. The key is
  /// `swf:activityType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the activity type is registered.
  ///
  /// [activityType]: The activity type to deprecate.
  Future<void> deprecateActivityType(
      {@required String domain, @required ActivityType activityType}) async {
    await _client.send('DeprecateActivityType', {
      'domain': domain,
      'activityType': activityType,
    });
  }

  /// Deprecates the specified domain. After a domain has been deprecated it
  /// cannot be used to create new workflow executions or register new types.
  /// However, you can still use visibility actions on this domain. Deprecating
  /// a domain also deprecates all activity and workflow types registered in the
  /// domain. Executions that were started before the domain was deprecated
  /// continues to run.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [name]: The name of the domain to deprecate.
  Future<void> deprecateDomain(String name) async {
    await _client.send('DeprecateDomain', {
      'name': name,
    });
  }

  /// Deprecates the specified _workflow type_. After a workflow type has been
  /// deprecated, you cannot create new executions of that type. Executions that
  /// were started before the type was deprecated continues to run. A deprecated
  /// workflow type may still be used when calling visibility actions.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `workflowType.name`: String constraint. The key is
  /// `swf:workflowType.name`.
  ///
  ///     *    `workflowType.version`: String constraint. The key is
  /// `swf:workflowType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the workflow type is registered.
  ///
  /// [workflowType]: The workflow type to deprecate.
  Future<void> deprecateWorkflowType(
      {@required String domain, @required WorkflowType workflowType}) async {
    await _client.send('DeprecateWorkflowType', {
      'domain': domain,
      'workflowType': workflowType,
    });
  }

  /// Returns information about the specified activity type. This includes
  /// configuration settings provided when the type was registered and other
  /// general information about the type.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `activityType.name`: String constraint. The key is
  /// `swf:activityType.name`.
  ///
  ///     *    `activityType.version`: String constraint. The key is
  /// `swf:activityType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the activity type is registered.
  ///
  /// [activityType]: The activity type to get information about. Activity types
  /// are identified by the `name` and `version` that were supplied when the
  /// activity was registered.
  Future<ActivityTypeDetail> describeActivityType(
      {@required String domain, @required ActivityType activityType}) async {
    var response_ = await _client.send('DescribeActivityType', {
      'domain': domain,
      'activityType': activityType,
    });
    return ActivityTypeDetail.fromJson(response_);
  }

  /// Returns information about the specified domain, including description and
  /// status.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [name]: The name of the domain to describe.
  Future<DomainDetail> describeDomain(String name) async {
    var response_ = await _client.send('DescribeDomain', {
      'name': name,
    });
    return DomainDetail.fromJson(response_);
  }

  /// Returns information about the specified workflow execution including its
  /// type and some statistics.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow execution.
  ///
  /// [execution]: The workflow execution to describe.
  Future<WorkflowExecutionDetail> describeWorkflowExecution(
      {@required String domain, @required WorkflowExecution execution}) async {
    var response_ = await _client.send('DescribeWorkflowExecution', {
      'domain': domain,
      'execution': execution,
    });
    return WorkflowExecutionDetail.fromJson(response_);
  }

  /// Returns information about the specified _workflow type_. This includes
  /// configuration settings specified when the type was registered and other
  /// information such as creation date, current status, etc.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `workflowType.name`: String constraint. The key is
  /// `swf:workflowType.name`.
  ///
  ///     *    `workflowType.version`: String constraint. The key is
  /// `swf:workflowType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which this workflow type is
  /// registered.
  ///
  /// [workflowType]: The workflow type to describe.
  Future<WorkflowTypeDetail> describeWorkflowType(
      {@required String domain, @required WorkflowType workflowType}) async {
    var response_ = await _client.send('DescribeWorkflowType', {
      'domain': domain,
      'workflowType': workflowType,
    });
    return WorkflowTypeDetail.fromJson(response_);
  }

  /// Returns the history of the specified workflow execution. The results may
  /// be split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the `nextPageToken` returned by the initial call.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow execution.
  ///
  /// [execution]: Specifies the workflow execution for which to return the
  /// history.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the events in reverse order.
  /// By default the results are returned in ascending order of the
  /// `eventTimeStamp` of the events.
  Future<History> getWorkflowExecutionHistory(
      {@required String domain,
      @required WorkflowExecution execution,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder}) async {
    var response_ = await _client.send('GetWorkflowExecutionHistory', {
      'domain': domain,
      'execution': execution,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return History.fromJson(response_);
  }

  /// Returns information about all activities registered in the specified
  /// domain that match the specified name and registration status. The result
  /// includes information like creation date, current status of the activity,
  /// etc. The results may be split into multiple pages. To retrieve subsequent
  /// pages, make the call again using the `nextPageToken` returned by the
  /// initial call.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the activity types have been
  /// registered.
  ///
  /// [name]: If specified, only lists the activity types that have this name.
  ///
  /// [registrationStatus]: Specifies the registration status of the activity
  /// types to list.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the results in reverse order.
  /// By default, the results are returned in ascending alphabetical order by
  /// `name` of the activity types.
  Future<ActivityTypeInfos> listActivityTypes(
      {@required String domain,
      String name,
      @required String registrationStatus,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder}) async {
    var response_ = await _client.send('ListActivityTypes', {
      'domain': domain,
      if (name != null) 'name': name,
      'registrationStatus': registrationStatus,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return ActivityTypeInfos.fromJson(response_);
  }

  /// Returns a list of closed workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `tagFilter.tag`: String constraint. The key is
  /// `swf:tagFilter.tag`.
  ///
  ///     *    `typeFilter.name`: String constraint. The key is
  /// `swf:typeFilter.name`.
  ///
  ///     *    `typeFilter.version`: String constraint. The key is
  /// `swf:typeFilter.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain that contains the workflow executions to
  /// list.
  ///
  /// [startTimeFilter]: If specified, the workflow executions are included in
  /// the returned results based on whether their start times are within the
  /// range specified by this filter. Also, if this parameter is specified, the
  /// returned results are ordered by their start times.
  ///
  ///   `startTimeFilter` and `closeTimeFilter` are mutually exclusive. You must
  /// specify one of these in a request but not both.
  ///
  /// [closeTimeFilter]: If specified, the workflow executions are included in
  /// the returned results based on whether their close times are within the
  /// range specified by this filter. Also, if this parameter is specified, the
  /// returned results are ordered by their close times.
  ///
  ///   `startTimeFilter` and `closeTimeFilter` are mutually exclusive. You must
  /// specify one of these in a request but not both.
  ///
  /// [executionFilter]: If specified, only workflow executions matching the
  /// workflow ID specified in the filter are returned.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [closeStatusFilter]: If specified, only workflow executions that match
  /// this _close status_ are listed. For example, if TERMINATED is specified,
  /// then only TERMINATED workflow executions are listed.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [typeFilter]: If specified, only executions of the type specified in the
  /// filter are returned.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [tagFilter]: If specified, only executions that have the matching tag are
  /// listed.
  ///
  ///   `closeStatusFilter`, `executionFilter`, `typeFilter` and `tagFilter` are
  /// mutually exclusive. You can specify at most one of these in a request.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the results in reverse order.
  /// By default the results are returned in descending order of the start or
  /// the close time of the executions.
  Future<WorkflowExecutionInfos> listClosedWorkflowExecutions(String domain,
      {ExecutionTimeFilter startTimeFilter,
      ExecutionTimeFilter closeTimeFilter,
      WorkflowExecutionFilter executionFilter,
      CloseStatusFilter closeStatusFilter,
      WorkflowTypeFilter typeFilter,
      TagFilter tagFilter,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder}) async {
    var response_ = await _client.send('ListClosedWorkflowExecutions', {
      'domain': domain,
      if (startTimeFilter != null) 'startTimeFilter': startTimeFilter,
      if (closeTimeFilter != null) 'closeTimeFilter': closeTimeFilter,
      if (executionFilter != null) 'executionFilter': executionFilter,
      if (closeStatusFilter != null) 'closeStatusFilter': closeStatusFilter,
      if (typeFilter != null) 'typeFilter': typeFilter,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return WorkflowExecutionInfos.fromJson(response_);
  }

  /// Returns the list of domains registered in the account. The results may be
  /// split into multiple pages. To retrieve subsequent pages, make the call
  /// again using the nextPageToken returned by the initial call.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains. The element must be set to
  /// `arn:aws:swf::AccountID:domain/*`, where _AccountID_ is the account ID,
  /// with no dashes.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [registrationStatus]: Specifies the registration status of the domains to
  /// list.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the results in reverse order.
  /// By default, the results are returned in ascending alphabetical order by
  /// `name` of the domains.
  Future<DomainInfos> listDomains(String registrationStatus,
      {String nextPageToken, int maximumPageSize, bool reverseOrder}) async {
    var response_ = await _client.send('ListDomains', {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      'registrationStatus': registrationStatus,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return DomainInfos.fromJson(response_);
  }

  /// Returns a list of open workflow executions in the specified domain that
  /// meet the filtering criteria. The results may be split into multiple pages.
  /// To retrieve subsequent pages, make the call again using the nextPageToken
  /// returned by the initial call.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `tagFilter.tag`: String constraint. The key is
  /// `swf:tagFilter.tag`.
  ///
  ///     *    `typeFilter.name`: String constraint. The key is
  /// `swf:typeFilter.name`.
  ///
  ///     *    `typeFilter.version`: String constraint. The key is
  /// `swf:typeFilter.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain that contains the workflow executions to
  /// list.
  ///
  /// [startTimeFilter]: Workflow executions are included in the returned
  /// results based on whether their start times are within the range specified
  /// by this filter.
  ///
  /// [typeFilter]: If specified, only executions of the type specified in the
  /// filter are returned.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  ///
  /// [tagFilter]: If specified, only executions that have the matching tag are
  /// listed.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the results in reverse order.
  /// By default the results are returned in descending order of the start time
  /// of the executions.
  ///
  /// [executionFilter]: If specified, only workflow executions matching the
  /// workflow ID specified in the filter are returned.
  ///
  ///   `executionFilter`, `typeFilter` and `tagFilter` are mutually exclusive.
  /// You can specify at most one of these in a request.
  Future<WorkflowExecutionInfos> listOpenWorkflowExecutions(
      {@required String domain,
      @required ExecutionTimeFilter startTimeFilter,
      WorkflowTypeFilter typeFilter,
      TagFilter tagFilter,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder,
      WorkflowExecutionFilter executionFilter}) async {
    var response_ = await _client.send('ListOpenWorkflowExecutions', {
      'domain': domain,
      'startTimeFilter': startTimeFilter,
      if (typeFilter != null) 'typeFilter': typeFilter,
      if (tagFilter != null) 'tagFilter': tagFilter,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
      if (executionFilter != null) 'executionFilter': executionFilter,
    });
    return WorkflowExecutionInfos.fromJson(response_);
  }

  /// List tags for a given domain.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Amazon SWF domain.
  Future<ListTagsForResourceOutput> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Returns information about workflow types in the specified domain. The
  /// results may be split into multiple pages that can be retrieved by making
  /// the call repeatedly.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the workflow types have been
  /// registered.
  ///
  /// [name]: If specified, lists the workflow type with this name.
  ///
  /// [registrationStatus]: Specifies the registration status of the workflow
  /// types to list.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// [reverseOrder]: When set to `true`, returns the results in reverse order.
  /// By default the results are returned in ascending alphabetical order of the
  /// `name` of the workflow types.
  Future<WorkflowTypeInfos> listWorkflowTypes(
      {@required String domain,
      String name,
      @required String registrationStatus,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder}) async {
    var response_ = await _client.send('ListWorkflowTypes', {
      'domain': domain,
      if (name != null) 'name': name,
      'registrationStatus': registrationStatus,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return WorkflowTypeInfos.fromJson(response_);
  }

  /// Used by workers to get an ActivityTask from the specified activity
  /// `taskList`. This initiates a long poll, where the service holds the HTTP
  /// connection open and responds as soon as a task becomes available. The
  /// maximum time the service holds on to the request before responding is 60
  /// seconds. If no task is available within 60 seconds, the poll returns an
  /// empty result. An empty result, in this context, means that an ActivityTask
  /// is returned, but that the value of taskToken is an empty string. If a task
  /// is returned, the worker should use its type to identify and process it
  /// correctly.
  ///
  ///  Workers should set their client side socket timeout to at least 70
  /// seconds (10 seconds higher than the maximum time service may hold the poll
  /// request).
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the `taskList.name` parameter by using a `Condition` element
  /// with the `swf:taskList.name` key to allow the action to access only
  /// certain task lists.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain that contains the task lists being
  /// polled.
  ///
  /// [taskList]: Specifies the task list to poll for activity tasks.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [identity]: Identity of the worker making the request, recorded in the
  /// `ActivityTaskStarted` event in the workflow history. This enables
  /// diagnostic tracing when problems arise. The form of this identity is user
  /// defined.
  Future<ActivityTask> pollForActivityTask(
      {@required String domain,
      @required TaskList taskList,
      String identity}) async {
    var response_ = await _client.send('PollForActivityTask', {
      'domain': domain,
      'taskList': taskList,
      if (identity != null) 'identity': identity,
    });
    return ActivityTask.fromJson(response_);
  }

  /// Used by deciders to get a DecisionTask from the specified decision
  /// `taskList`. A decision task may be returned for any open workflow
  /// execution that is using the specified task list. The task includes a
  /// paginated view of the history of the workflow execution. The decider
  /// should use the workflow type and the history to determine how to properly
  /// handle the task.
  ///
  /// This action initiates a long poll, where the service holds the HTTP
  /// connection open and responds as soon a task becomes available. If no
  /// decision task is available in the specified task list before the timeout
  /// of 60 seconds expires, an empty result is returned. An empty result, in
  /// this context, means that a DecisionTask is returned, but that the value of
  /// taskToken is an empty string.
  ///
  ///  Deciders should set their client side socket timeout to at least 70
  /// seconds (10 seconds higher than the timeout).  Because the number of
  /// workflow history events for a single workflow execution might be very
  /// large, the result returned might be split up across a number of pages. To
  /// retrieve subsequent pages, make additional calls to `PollForDecisionTask`
  /// using the `nextPageToken` returned by the initial call. Note that you do
  /// _not_ call `GetWorkflowExecutionHistory` with this `nextPageToken`.
  /// Instead, call `PollForDecisionTask` again.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the `taskList.name` parameter by using a `Condition` element
  /// with the `swf:taskList.name` key to allow the action to access only
  /// certain task lists.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the task lists to poll.
  ///
  /// [taskList]: Specifies the task list to poll for decision tasks.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [identity]: Identity of the decider making the request, which is recorded
  /// in the DecisionTaskStarted event in the workflow history. This enables
  /// diagnostic tracing when problems arise. The form of this identity is user
  /// defined.
  ///
  /// [nextPageToken]: If `NextPageToken` is returned there are more results
  /// available. The value of `NextPageToken` is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the
  /// next page. Keep all other arguments unchanged. Each pagination token
  /// expires after 60 seconds. Using an expired pagination token will return a
  /// `400` error: "`Specified token has exceeded its maximum lifetime`".
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  ///
  ///
  ///
  /// The `nextPageToken` returned by this action cannot be used with
  /// GetWorkflowExecutionHistory to get the next page. You must call
  /// PollForDecisionTask again (with the `nextPageToken`) to retrieve the next
  /// page of history records. Calling PollForDecisionTask with a
  /// `nextPageToken` doesn't return a new decision task.
  ///
  /// [maximumPageSize]: The maximum number of results that are returned per
  /// call. Use `nextPageToken` to obtain further pages of results.
  ///
  /// This is an upper limit only; the actual number of results returned per
  /// call may be fewer than the specified maximum.
  ///
  /// [reverseOrder]: When set to `true`, returns the events in reverse order.
  /// By default the results are returned in ascending order of the
  /// `eventTimestamp` of the events.
  Future<DecisionTask> pollForDecisionTask(
      {@required String domain,
      @required TaskList taskList,
      String identity,
      String nextPageToken,
      int maximumPageSize,
      bool reverseOrder}) async {
    var response_ = await _client.send('PollForDecisionTask', {
      'domain': domain,
      'taskList': taskList,
      if (identity != null) 'identity': identity,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (maximumPageSize != null) 'maximumPageSize': maximumPageSize,
      if (reverseOrder != null) 'reverseOrder': reverseOrder,
    });
    return DecisionTask.fromJson(response_);
  }

  /// Used by activity workers to report to the service that the ActivityTask
  /// represented by the specified `taskToken` is still making progress. The
  /// worker can also specify details of the progress, for example percent
  /// complete, using the `details` parameter. This action can also be used by
  /// the worker as a mechanism to check if cancellation is being requested for
  /// the activity task. If a cancellation is being attempted for the specified
  /// task, then the boolean `cancelRequested` flag returned by the service is
  /// set to `true`.
  ///
  /// This action resets the `taskHeartbeatTimeout` clock. The
  /// `taskHeartbeatTimeout` is specified in RegisterActivityType.
  ///
  /// This action doesn't in itself create an event in the workflow execution
  /// history. However, if the task times out, the workflow execution history
  /// contains a `ActivityTaskTimedOut` event that contains the information from
  /// the last heartbeat generated by the activity worker.
  ///
  ///  The `taskStartToCloseTimeout` of an activity type is the maximum duration
  /// of an activity task, regardless of the number of
  /// RecordActivityTaskHeartbeat requests received. The
  /// `taskStartToCloseTimeout` is also specified in RegisterActivityType.  This
  /// operation is only useful for long-lived activities to report liveliness of
  /// the task and to determine if a cancellation is being attempted.  If the
  /// `cancelRequested` flag returns `true`, a cancellation is being attempted.
  /// If the worker can cancel the activity, it should respond with
  /// RespondActivityTaskCanceled. Otherwise, it should ignore the cancellation
  /// request.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [taskToken]: The `taskToken` of the ActivityTask.
  ///
  ///   `taskToken` is generated by the service and should be treated as an
  /// opaque value. If the task is passed to another process, its `taskToken`
  /// must also be passed. This enables it to provide its progress and respond
  /// with results.
  ///
  /// [details]: If specified, contains details about the progress of the task.
  Future<ActivityTaskStatus> recordActivityTaskHeartbeat(String taskToken,
      {String details}) async {
    var response_ = await _client.send('RecordActivityTaskHeartbeat', {
      'taskToken': taskToken,
      if (details != null) 'details': details,
    });
    return ActivityTaskStatus.fromJson(response_);
  }

  /// Registers a new _activity type_ along with its configuration settings in
  /// the specified domain.
  ///
  ///  A `TypeAlreadyExists` fault is returned if the type already exists in the
  /// domain. You cannot change any configuration settings of the type after its
  /// registration, and it must be registered as a new version.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `defaultTaskList.name`: String constraint. The key is
  /// `swf:defaultTaskList.name`.
  ///
  ///     *    `name`: String constraint. The key is `swf:name`.
  ///
  ///     *    `version`: String constraint. The key is `swf:version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which this activity is to be
  /// registered.
  ///
  /// [name]: The name of the activity type within the domain.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [version]: The version of the activity type.
  ///
  ///  The activity type consists of the name and version, the combination of
  /// which must be unique within the domain.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [description]: A textual description of the activity type.
  ///
  /// [defaultTaskStartToCloseTimeout]: If set, specifies the default maximum
  /// duration that a worker can take to process tasks of this activity type.
  /// This default can be overridden when scheduling an activity task using the
  /// `ScheduleActivityTask` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  /// [defaultTaskHeartbeatTimeout]: If set, specifies the default maximum time
  /// before which a worker processing a task of this type must report progress
  /// by calling RecordActivityTaskHeartbeat. If the timeout is exceeded, the
  /// activity task is automatically timed out. This default can be overridden
  /// when scheduling an activity task using the `ScheduleActivityTask`
  /// Decision. If the activity worker subsequently attempts to record a
  /// heartbeat or returns a result, the activity worker receives an
  /// `UnknownResource` fault. In this case, Amazon SWF no longer considers the
  /// activity task to be valid; the activity worker should clean up the
  /// activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  /// [defaultTaskList]: If set, specifies the default task list to use for
  /// scheduling tasks of this activity type. This default task list is used if
  /// a task list isn't provided when a task is scheduled through the
  /// `ScheduleActivityTask` Decision.
  ///
  /// [defaultTaskPriority]: The default task priority to assign to the activity
  /// type. If not assigned, then `0` is used. Valid values are integers that
  /// range from Java's `Integer.MIN_VALUE` (-2147483648) to `Integer.MAX_VALUE`
  /// (2147483647). Higher numbers indicate higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _in the _Amazon SWF Developer Guide_._.
  ///
  /// [defaultTaskScheduleToStartTimeout]: If set, specifies the default maximum
  /// duration that a task of this activity type can wait before being assigned
  /// to a worker. This default can be overridden when scheduling an activity
  /// task using the `ScheduleActivityTask` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  /// [defaultTaskScheduleToCloseTimeout]: If set, specifies the default maximum
  /// duration for a task of this activity type. This default can be overridden
  /// when scheduling an activity task using the `ScheduleActivityTask`
  /// Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  Future<void> registerActivityType(
      {@required String domain,
      @required String name,
      @required String version,
      String description,
      String defaultTaskStartToCloseTimeout,
      String defaultTaskHeartbeatTimeout,
      TaskList defaultTaskList,
      String defaultTaskPriority,
      String defaultTaskScheduleToStartTimeout,
      String defaultTaskScheduleToCloseTimeout}) async {
    await _client.send('RegisterActivityType', {
      'domain': domain,
      'name': name,
      'version': version,
      if (description != null) 'description': description,
      if (defaultTaskStartToCloseTimeout != null)
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
      if (defaultTaskHeartbeatTimeout != null)
        'defaultTaskHeartbeatTimeout': defaultTaskHeartbeatTimeout,
      if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
      if (defaultTaskPriority != null)
        'defaultTaskPriority': defaultTaskPriority,
      if (defaultTaskScheduleToStartTimeout != null)
        'defaultTaskScheduleToStartTimeout': defaultTaskScheduleToStartTimeout,
      if (defaultTaskScheduleToCloseTimeout != null)
        'defaultTaskScheduleToCloseTimeout': defaultTaskScheduleToCloseTimeout,
    });
  }

  /// Registers a new domain.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   You cannot use an IAM policy to control domain access for this action.
  /// The name of the domain being registered is available as the resource of
  /// this action.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [name]: Name of the domain to register. The name must be unique in the
  /// region that the domain is registered in.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [description]: A text description of the domain.
  ///
  /// [workflowExecutionRetentionPeriodInDays]: The duration (in days) that
  /// records and histories of workflow executions on the domain should be kept
  /// by the service. After the retention period, the workflow execution isn't
  /// available in the results of visibility calls.
  ///
  /// If you pass the value `NONE` or `0` (zero), then the workflow execution
  /// history isn't retained. As soon as the workflow execution completes, the
  /// execution record and its history are deleted.
  ///
  /// The maximum workflow execution retention period is 90 days. For more
  /// information about Amazon SWF service limits, see:
  /// [Amazon SWF Service Limits](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-limits.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [tags]: Tags to be added when registering a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: `_ . : / = + - @`.
  Future<void> registerDomain(
      {@required String name,
      String description,
      @required String workflowExecutionRetentionPeriodInDays,
      List<ResourceTag> tags}) async {
    await _client.send('RegisterDomain', {
      'name': name,
      if (description != null) 'description': description,
      'workflowExecutionRetentionPeriodInDays':
          workflowExecutionRetentionPeriodInDays,
      if (tags != null) 'tags': tags,
    });
  }

  /// Registers a new _workflow type_ and its configuration settings in the
  /// specified domain.
  ///
  /// The retention period for the workflow history is set by the RegisterDomain
  /// action.
  ///
  ///  If the type already exists, then a `TypeAlreadyExists` fault is returned.
  /// You cannot change the configuration settings of a workflow type once it is
  /// registered and it must be registered as a new version.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `defaultTaskList.name`: String constraint. The key is
  /// `swf:defaultTaskList.name`.
  ///
  ///     *    `name`: String constraint. The key is `swf:name`.
  ///
  ///     *    `version`: String constraint. The key is `swf:version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which to register the workflow type.
  ///
  /// [name]: The name of the workflow type.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [version]: The version of the workflow type.
  ///
  ///  The workflow type consists of the name and version, the combination of
  /// which must be unique within the domain. To get a list of all currently
  /// registered workflow types, use the ListWorkflowTypes action.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [description]: Textual description of the workflow type.
  ///
  /// [defaultTaskStartToCloseTimeout]: If set, specifies the default maximum
  /// duration of decision tasks for this workflow type. This default can be
  /// overridden when starting a workflow execution using the
  /// StartWorkflowExecution action or the `StartChildWorkflowExecution`
  /// Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  /// [defaultExecutionStartToCloseTimeout]: If set, specifies the default
  /// maximum duration for executions of this workflow type. You can override
  /// this default when starting an execution through the StartWorkflowExecution
  /// Action or `StartChildWorkflowExecution` Decision.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for `defaultExecutionStartToCloseTimeout`; there
  /// is a one-year max limit on the time that a workflow execution can run.
  /// Exceeding this limit always causes the workflow execution to time out.
  ///
  /// [defaultTaskList]: If set, specifies the default task list to use for
  /// scheduling decision tasks for executions of this workflow type. This
  /// default is used only if a task list isn't provided when starting the
  /// execution through the StartWorkflowExecution Action or
  /// `StartChildWorkflowExecution` Decision.
  ///
  /// [defaultTaskPriority]: The default task priority to assign to the workflow
  /// type. If not assigned, then `0` is used. Valid values are integers that
  /// range from Java's `Integer.MIN_VALUE` (-2147483648) to `Integer.MAX_VALUE`
  /// (2147483647). Higher numbers indicate higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [defaultChildPolicy]: If set, specifies the default policy to use for the
  /// child workflow executions when a workflow execution of this type is
  /// terminated, by calling the TerminateWorkflowExecution action explicitly or
  /// due to an expired timeout. This default can be overridden when starting a
  /// workflow execution using the StartWorkflowExecution action or the
  /// `StartChildWorkflowExecution` Decision.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  ///
  /// [defaultLambdaRole]: The default IAM role attached to this workflow type.
  ///
  ///
  ///
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't specify an IAM role when you start this workflow
  /// type, the default Lambda role is attached to the execution. For more
  /// information, see
  /// [https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html](https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html)
  /// in the _Amazon SWF Developer Guide_.
  Future<void> registerWorkflowType(
      {@required String domain,
      @required String name,
      @required String version,
      String description,
      String defaultTaskStartToCloseTimeout,
      String defaultExecutionStartToCloseTimeout,
      TaskList defaultTaskList,
      String defaultTaskPriority,
      String defaultChildPolicy,
      String defaultLambdaRole}) async {
    await _client.send('RegisterWorkflowType', {
      'domain': domain,
      'name': name,
      'version': version,
      if (description != null) 'description': description,
      if (defaultTaskStartToCloseTimeout != null)
        'defaultTaskStartToCloseTimeout': defaultTaskStartToCloseTimeout,
      if (defaultExecutionStartToCloseTimeout != null)
        'defaultExecutionStartToCloseTimeout':
            defaultExecutionStartToCloseTimeout,
      if (defaultTaskList != null) 'defaultTaskList': defaultTaskList,
      if (defaultTaskPriority != null)
        'defaultTaskPriority': defaultTaskPriority,
      if (defaultChildPolicy != null) 'defaultChildPolicy': defaultChildPolicy,
      if (defaultLambdaRole != null) 'defaultLambdaRole': defaultLambdaRole,
    });
  }

  /// Records a `WorkflowExecutionCancelRequested` event in the currently
  /// running workflow execution identified by the given domain, workflowId, and
  /// runId. This logically requests the cancellation of the workflow execution
  /// as a whole. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  ///  If the runId isn't specified, the `WorkflowExecutionCancelRequested`
  /// event is recorded in the history of the current open workflow execution
  /// with the specified workflowId in the domain.  Because this action allows
  /// the workflow to properly clean up and gracefully close, it should be used
  /// instead of TerminateWorkflowExecution when possible.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow execution to
  /// cancel.
  ///
  /// [workflowId]: The workflowId of the workflow execution to cancel.
  ///
  /// [runId]: The runId of the workflow execution to cancel.
  Future<void> requestCancelWorkflowExecution(
      {@required String domain,
      @required String workflowId,
      String runId}) async {
    await _client.send('RequestCancelWorkflowExecution', {
      'domain': domain,
      'workflowId': workflowId,
      if (runId != null) 'runId': runId,
    });
  }

  /// Used by workers to tell the service that the ActivityTask identified by
  /// the `taskToken` was successfully canceled. Additional `details` can be
  /// provided using the `details` argument.
  ///
  /// These `details` (if provided) appear in the `ActivityTaskCanceled` event
  /// added to the workflow history.
  ///
  ///  Only use this operation if the `canceled` flag of a
  /// RecordActivityTaskHeartbeat request returns `true` and if the activity can
  /// be safely undone or abandoned.
  ///
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// RespondActivityTaskCompleted, RespondActivityTaskCanceled,
  /// RespondActivityTaskFailed, or the task has
  /// [timed out](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types).
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [taskToken]: The `taskToken` of the ActivityTask.
  ///
  ///   `taskToken` is generated by the service and should be treated as an
  /// opaque value. If the task is passed to another process, its `taskToken`
  /// must also be passed. This enables it to provide its progress and respond
  /// with results.
  ///
  /// [details]:  Information about the cancellation.
  Future<void> respondActivityTaskCanceled(String taskToken,
      {String details}) async {
    await _client.send('RespondActivityTaskCanceled', {
      'taskToken': taskToken,
      if (details != null) 'details': details,
    });
  }

  /// Used by workers to tell the service that the ActivityTask identified by
  /// the `taskToken` completed successfully with a `result` (if provided). The
  /// `result` appears in the `ActivityTaskCompleted` event in the workflow
  /// history.
  ///
  ///  If the requested task doesn't complete successfully, use
  /// RespondActivityTaskFailed instead. If the worker finds that the task is
  /// canceled through the `canceled` flag returned by
  /// RecordActivityTaskHeartbeat, it should cancel the task, clean up and then
  /// call RespondActivityTaskCanceled.
  ///
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// RespondActivityTaskCompleted, RespondActivityTaskCanceled,
  /// RespondActivityTaskFailed, or the task has
  /// [timed out](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types).
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [taskToken]: The `taskToken` of the ActivityTask.
  ///
  ///   `taskToken` is generated by the service and should be treated as an
  /// opaque value. If the task is passed to another process, its `taskToken`
  /// must also be passed. This enables it to provide its progress and respond
  /// with results.
  ///
  /// [result]: The result of the activity task. It is a free form string that
  /// is implementation specific.
  Future<void> respondActivityTaskCompleted(String taskToken,
      {String result}) async {
    await _client.send('RespondActivityTaskCompleted', {
      'taskToken': taskToken,
      if (result != null) 'result': result,
    });
  }

  /// Used by workers to tell the service that the ActivityTask identified by
  /// the `taskToken` has failed with `reason` (if specified). The `reason` and
  /// `details` appear in the `ActivityTaskFailed` event added to the workflow
  /// history.
  ///
  /// A task is considered open from the time that it is scheduled until it is
  /// closed. Therefore a task is reported as open while a worker is processing
  /// it. A task is closed after it has been specified in a call to
  /// RespondActivityTaskCompleted, RespondActivityTaskCanceled,
  /// RespondActivityTaskFailed, or the task has
  /// [timed out](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types).
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [taskToken]: The `taskToken` of the ActivityTask.
  ///
  ///   `taskToken` is generated by the service and should be treated as an
  /// opaque value. If the task is passed to another process, its `taskToken`
  /// must also be passed. This enables it to provide its progress and respond
  /// with results.
  ///
  /// [reason]: Description of the error that may assist in diagnostics.
  ///
  /// [details]:  Detailed information about the failure.
  Future<void> respondActivityTaskFailed(String taskToken,
      {String reason, String details}) async {
    await _client.send('RespondActivityTaskFailed', {
      'taskToken': taskToken,
      if (reason != null) 'reason': reason,
      if (details != null) 'details': details,
    });
  }

  /// Used by deciders to tell the service that the DecisionTask identified by
  /// the `taskToken` has successfully completed. The `decisions` argument
  /// specifies the list of decisions made while processing the task.
  ///
  /// A `DecisionTaskCompleted` event is added to the workflow history. The
  /// `executionContext` specified is attached to the event in the workflow
  /// execution history.
  ///
  ///  **Access Control**
  ///
  /// If an IAM policy grants permission to use `RespondDecisionTaskCompleted`,
  /// it can express permissions for the list of decisions in the `decisions`
  /// parameter. Each of the decisions has one or more parameters, much like a
  /// regular API call. To allow for policies to be as readable as possible, you
  /// can express permissions on decisions as if they were actual API calls,
  /// including applying conditions to some parameters. For more information,
  /// see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [taskToken]: The `taskToken` from the DecisionTask.
  ///
  ///   `taskToken` is generated by the service and should be treated as an
  /// opaque value. If the task is passed to another process, its `taskToken`
  /// must also be passed. This enables it to provide its progress and respond
  /// with results.
  ///
  /// [decisions]: The list of decisions (possibly empty) made by the decider
  /// while processing this decision task. See the docs for the Decision
  /// structure for details.
  ///
  /// [executionContext]: User defined context to add to workflow execution.
  Future<void> respondDecisionTaskCompleted(String taskToken,
      {List<Decision> decisions, String executionContext}) async {
    await _client.send('RespondDecisionTaskCompleted', {
      'taskToken': taskToken,
      if (decisions != null) 'decisions': decisions,
      if (executionContext != null) 'executionContext': executionContext,
    });
  }

  /// Records a `WorkflowExecutionSignaled` event in the workflow execution
  /// history and creates a decision task for the workflow execution identified
  /// by the given domain, workflowId and runId. The event is recorded with the
  /// specified user defined signalName and input (if provided).
  ///
  ///  If a runId isn't specified, then the `WorkflowExecutionSignaled` event is
  /// recorded in the history of the current open workflow with the matching
  /// workflowId in the domain.  If the specified workflow execution isn't open,
  /// this method fails with `UnknownResource`.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain containing the workflow execution to
  /// signal.
  ///
  /// [workflowId]: The workflowId of the workflow execution to signal.
  ///
  /// [runId]: The runId of the workflow execution to signal.
  ///
  /// [signalName]: The name of the signal. This name must be meaningful to the
  /// target workflow.
  ///
  /// [input]: Data to attach to the `WorkflowExecutionSignaled` event in the
  /// target workflow execution's history.
  Future<void> signalWorkflowExecution(
      {@required String domain,
      @required String workflowId,
      String runId,
      @required String signalName,
      String input}) async {
    await _client.send('SignalWorkflowExecution', {
      'domain': domain,
      'workflowId': workflowId,
      if (runId != null) 'runId': runId,
      'signalName': signalName,
      if (input != null) 'input': input,
    });
  }

  /// Starts an execution of the workflow type in the specified domain using the
  /// provided `workflowId` and input data.
  ///
  /// This action returns the newly started workflow execution.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `tagList.member.0`: The key is `swf:tagList.member.0`.
  ///
  ///     *    `tagList.member.1`: The key is `swf:tagList.member.1`.
  ///
  ///     *    `tagList.member.2`: The key is `swf:tagList.member.2`.
  ///
  ///     *    `tagList.member.3`: The key is `swf:tagList.member.3`.
  ///
  ///     *    `tagList.member.4`: The key is `swf:tagList.member.4`.
  ///
  ///     *    `taskList`: String constraint. The key is `swf:taskList.name`.
  ///
  ///     *    `workflowType.name`: String constraint. The key is
  /// `swf:workflowType.name`.
  ///
  ///     *    `workflowType.version`: String constraint. The key is
  /// `swf:workflowType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain in which the workflow execution is
  /// created.
  ///
  /// [workflowId]: The user defined identifier associated with the workflow
  /// execution. You can use this to associate a custom identifier with the
  /// workflow execution. You may specify the same identifier if a workflow
  /// execution is logically a _restart_ of a previous execution. You cannot
  /// have two open workflow executions with the same `workflowId` at the same
  /// time within the same domain.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [workflowType]: The type of the workflow to start.
  ///
  /// [taskList]: The task list to use for the decision tasks generated for this
  /// workflow execution. This overrides the `defaultTaskList` specified when
  /// registering the workflow type.
  ///
  ///  A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration
  /// time then a fault is returned.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not _be_ the
  /// literal string `arn`.
  ///
  /// [taskPriority]: The task priority to use for this workflow execution. This
  /// overrides any default priority that was assigned when the workflow type
  /// was registered. If not set, then the default task priority for the
  /// workflow type is used. Valid values are integers that range from Java's
  /// `Integer.MIN_VALUE` (-2147483648) to `Integer.MAX_VALUE` (2147483647).
  /// Higher numbers indicate higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [input]: The input for the workflow execution. This is a free form string
  /// which should be meaningful to the workflow you are starting. This `input`
  /// is made available to the new workflow execution in the
  /// `WorkflowExecutionStarted` history event.
  ///
  /// [executionStartToCloseTimeout]: The total duration for this workflow
  /// execution. This overrides the defaultExecutionStartToCloseTimeout
  /// specified when registering the workflow type.
  ///
  /// The duration is specified in seconds; an integer greater than or equal to
  /// `0`. Exceeding this limit causes the workflow execution to time out.
  /// Unlike some of the other timeout parameters in Amazon SWF, you cannot
  /// specify a value of "NONE" for this timeout; there is a one-year max limit
  /// on the time that a workflow execution can run.
  ///
  ///
  ///
  /// An execution start-to-close timeout must be specified either through this
  /// parameter or as a default when the workflow type is registered. If neither
  /// this parameter nor a default execution start-to-close timeout is
  /// specified, a fault is returned.
  ///
  /// [tagList]: The list of tags to associate with the workflow execution. You
  /// can specify a maximum of 5 tags. You can list workflow executions with a
  /// specific tag by calling ListOpenWorkflowExecutions or
  /// ListClosedWorkflowExecutions and specifying a TagFilter.
  ///
  /// [taskStartToCloseTimeout]: Specifies the maximum duration of decision
  /// tasks for this workflow execution. This parameter overrides the
  /// `defaultTaskStartToCloseTimout` specified when registering the workflow
  /// type using RegisterWorkflowType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A task start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  ///
  /// [childPolicy]: If set, specifies the policy to use for the child workflow
  /// executions of this workflow execution if it is terminated, by calling the
  /// TerminateWorkflowExecution action explicitly or due to an expired timeout.
  /// This policy overrides the default child policy specified when registering
  /// the workflow type using RegisterWorkflowType.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  ///
  ///
  ///
  ///
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  ///
  /// [lambdaRole]: The IAM role to attach to this workflow execution.
  ///
  ///
  ///
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't attach an IAM role, any attempt to schedule a
  /// Lambda task fails. This results in a `ScheduleLambdaFunctionFailed`
  /// history event. For more information, see
  /// [https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html](https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html)
  /// in the _Amazon SWF Developer Guide_.
  Future<Run> startWorkflowExecution(
      {@required String domain,
      @required String workflowId,
      @required WorkflowType workflowType,
      TaskList taskList,
      String taskPriority,
      String input,
      String executionStartToCloseTimeout,
      List<String> tagList,
      String taskStartToCloseTimeout,
      String childPolicy,
      String lambdaRole}) async {
    var response_ = await _client.send('StartWorkflowExecution', {
      'domain': domain,
      'workflowId': workflowId,
      'workflowType': workflowType,
      if (taskList != null) 'taskList': taskList,
      if (taskPriority != null) 'taskPriority': taskPriority,
      if (input != null) 'input': input,
      if (executionStartToCloseTimeout != null)
        'executionStartToCloseTimeout': executionStartToCloseTimeout,
      if (tagList != null) 'tagList': tagList,
      if (taskStartToCloseTimeout != null)
        'taskStartToCloseTimeout': taskStartToCloseTimeout,
      if (childPolicy != null) 'childPolicy': childPolicy,
      if (lambdaRole != null) 'lambdaRole': lambdaRole,
    });
    return Run.fromJson(response_);
  }

  /// Add a tag to a Amazon SWF domain.
  ///
  ///
  ///
  /// Amazon SWF supports a maximum of 50 tags per resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// [tags]: The list of tags to add to a domain.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: `_ . : / = + - @`.
  Future<void> tagResource(
      {@required String resourceArn, @required List<ResourceTag> tags}) async {
    await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
  }

  /// Records a `WorkflowExecutionTerminated` event and forces closure of the
  /// workflow execution identified by the given domain, runId, and workflowId.
  /// The child policy, registered with the workflow type or specified when
  /// starting this execution, is applied to any open child workflow executions
  /// of this workflow execution.
  ///
  ///  If the identified workflow execution was in progress, it is terminated
  /// immediately.  If a runId isn't specified, then the
  /// `WorkflowExecutionTerminated` event is recorded in the history of the
  /// current open workflow with the matching workflowId in the domain.  You
  /// should consider using RequestCancelWorkflowExecution action instead
  /// because it allows the workflow to gracefully close while
  /// TerminateWorkflowExecution doesn't.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The domain of the workflow execution to terminate.
  ///
  /// [workflowId]: The workflowId of the workflow execution to terminate.
  ///
  /// [runId]: The runId of the workflow execution to terminate.
  ///
  /// [reason]:  A descriptive reason for terminating the workflow execution.
  ///
  /// [details]:  Details for terminating the workflow execution.
  ///
  /// [childPolicy]: If set, specifies the policy to use for the child workflow
  /// executions of the workflow execution being terminated. This policy
  /// overrides the child policy specified for the workflow execution at
  /// registration time or when starting the execution.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  ///
  ///
  ///
  ///
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  Future<void> terminateWorkflowExecution(
      {@required String domain,
      @required String workflowId,
      String runId,
      String reason,
      String details,
      String childPolicy}) async {
    await _client.send('TerminateWorkflowExecution', {
      'domain': domain,
      'workflowId': workflowId,
      if (runId != null) 'runId': runId,
      if (reason != null) 'reason': reason,
      if (details != null) 'details': details,
      if (childPolicy != null) 'childPolicy': childPolicy,
    });
  }

  /// Undeprecates a previously deprecated _activity type_. After an activity
  /// type has been undeprecated, you can create new tasks of that activity
  /// type.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `activityType.name`: String constraint. The key is
  /// `swf:activityType.name`.
  ///
  ///     *    `activityType.version`: String constraint. The key is
  /// `swf:activityType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain of the deprecated activity type.
  ///
  /// [activityType]: The activity type to undeprecate.
  Future<void> undeprecateActivityType(
      {@required String domain, @required ActivityType activityType}) async {
    await _client.send('UndeprecateActivityType', {
      'domain': domain,
      'activityType': activityType,
    });
  }

  /// Undeprecates a previously deprecated domain. After a domain has been
  /// undeprecated it can be used to create new workflow executions or register
  /// new types.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   You cannot use an IAM policy to constrain this action's parameters.
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [name]: The name of the domain of the deprecated workflow type.
  Future<void> undeprecateDomain(String name) async {
    await _client.send('UndeprecateDomain', {
      'name': name,
    });
  }

  /// Undeprecates a previously deprecated _workflow type_. After a workflow
  /// type has been undeprecated, you can create new executions of that type.
  ///
  ///  This operation is eventually consistent. The results are best effort and
  /// may not exactly reflect recent updates and changes.
  ///
  ///  **Access Control**
  ///
  /// You can use IAM policies to control this action's access to Amazon SWF
  /// resources as follows:
  ///
  /// *   Use a `Resource` element with the domain name to limit the action to
  /// only specified domains.
  ///
  /// *   Use an `Action` element to allow or deny permission to call this
  /// action.
  ///
  /// *   Constrain the following parameters by using a `Condition` element with
  /// the appropriate keys.
  ///
  ///     *    `workflowType.name`: String constraint. The key is
  /// `swf:workflowType.name`.
  ///
  ///     *    `workflowType.version`: String constraint. The key is
  /// `swf:workflowType.version`.
  ///
  ///
  ///
  /// If the caller doesn't have sufficient permissions to invoke the action, or
  /// the parameter values fall outside the specified constraints, the action
  /// fails. The associated event attribute's `cause` parameter is set to
  /// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  ///
  /// [domain]: The name of the domain of the deprecated workflow type.
  ///
  /// [workflowType]: The name of the domain of the deprecated workflow type.
  Future<void> undeprecateWorkflowType(
      {@required String domain, @required WorkflowType workflowType}) async {
    await _client.send('UndeprecateWorkflowType', {
      'domain': domain,
      'workflowType': workflowType,
    });
  }

  /// Remove a tag from a Amazon SWF domain.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for the Amazon SWF domain.
  ///
  /// [tagKeys]: The list of tags to remove from the Amazon SWF domain.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
  }
}

/// Unit of work sent to an activity worker.
class ActivityTask {
  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the
  /// system about the task.
  final String taskToken;

  /// The unique ID of the task.
  final String activityId;

  /// The ID of the `ActivityTaskStarted` event recorded in the history.
  final BigInt startedEventId;

  /// The workflow execution that started this activity task.
  final WorkflowExecution workflowExecution;

  /// The type of this activity task.
  final ActivityType activityType;

  /// The inputs provided when the activity task was scheduled. The form of the
  /// input is user defined and should be meaningful to the activity
  /// implementation.
  final String input;

  ActivityTask({
    @required this.taskToken,
    @required this.activityId,
    @required this.startedEventId,
    @required this.workflowExecution,
    @required this.activityType,
    this.input,
  });
  static ActivityTask fromJson(Map<String, dynamic> json) => ActivityTask(
        taskToken: json['taskToken'] as String,
        activityId: json['activityId'] as String,
        startedEventId: BigInt.from(json['startedEventId']),
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        activityType: ActivityType.fromJson(json['activityType']),
        input: json.containsKey('input') ? json['input'] as String : null,
      );
}

/// Provides the details of the `ActivityTaskCancelRequested` event.
class ActivityTaskCancelRequestedEventAttributes {
  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RequestCancelActivityTask` decision for this
  /// cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  /// The unique ID of the task.
  final String activityId;

  ActivityTaskCancelRequestedEventAttributes({
    @required this.decisionTaskCompletedEventId,
    @required this.activityId,
  });
  static ActivityTaskCancelRequestedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskCancelRequestedEventAttributes(
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        activityId: json['activityId'] as String,
      );
}

/// Provides the details of the `ActivityTaskCanceled` event.
class ActivityTaskCanceledEventAttributes {
  /// Details of the cancellation.
  final String details;

  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `ActivityTaskStarted` event recorded when this activity task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  /// If set, contains the ID of the last `ActivityTaskCancelRequested` event
  /// recorded for this activity task. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt latestCancelRequestedEventId;

  ActivityTaskCanceledEventAttributes({
    this.details,
    @required this.scheduledEventId,
    @required this.startedEventId,
    this.latestCancelRequestedEventId,
  });
  static ActivityTaskCanceledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskCanceledEventAttributes(
        details: json.containsKey('details') ? json['details'] as String : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
        latestCancelRequestedEventId:
            json.containsKey('latestCancelRequestedEventId')
                ? BigInt.from(json['latestCancelRequestedEventId'])
                : null,
      );
}

/// Provides the details of the `ActivityTaskCompleted` event.
class ActivityTaskCompletedEventAttributes {
  /// The results of the activity task.
  final String result;

  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `ActivityTaskStarted` event recorded when this activity task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  ActivityTaskCompletedEventAttributes({
    this.result,
    @required this.scheduledEventId,
    @required this.startedEventId,
  });
  static ActivityTaskCompletedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskCompletedEventAttributes(
        result: json.containsKey('result') ? json['result'] as String : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ActivityTaskFailed` event.
class ActivityTaskFailedEventAttributes {
  /// The reason provided for the failure.
  final String reason;

  /// The details of the failure.
  final String details;

  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `ActivityTaskStarted` event recorded when this activity task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  ActivityTaskFailedEventAttributes({
    this.reason,
    this.details,
    @required this.scheduledEventId,
    @required this.startedEventId,
  });
  static ActivityTaskFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskFailedEventAttributes(
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ActivityTaskScheduled` event.
class ActivityTaskScheduledEventAttributes {
  /// The type of the activity task.
  final ActivityType activityType;

  /// The unique ID of the activity task.
  final String activityId;

  /// The input provided to the activity task.
  final String input;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  final String control;

  /// The maximum amount of time the activity task can wait to be assigned to a
  /// worker.
  final String scheduleToStartTimeout;

  /// The maximum amount of time for this activity task.
  final String scheduleToCloseTimeout;

  /// The maximum amount of time a worker may take to process the activity task.
  final String startToCloseTimeout;

  /// The task list in which the activity task has been scheduled.
  final TaskList taskList;

  ///  The priority to assign to the scheduled activity task. If set, this
  /// overrides any default priority value that was assigned when the activity
  /// type was registered.
  ///
  /// Valid values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// that resulted in the scheduling of this activity task. This information
  /// can be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  /// The maximum time before which the worker processing this task must report
  /// progress by calling RecordActivityTaskHeartbeat. If the timeout is
  /// exceeded, the activity task is automatically timed out. If the worker
  /// subsequently attempts to record a heartbeat or return a result, it is
  /// ignored.
  final String heartbeatTimeout;

  ActivityTaskScheduledEventAttributes({
    @required this.activityType,
    @required this.activityId,
    this.input,
    this.control,
    this.scheduleToStartTimeout,
    this.scheduleToCloseTimeout,
    this.startToCloseTimeout,
    @required this.taskList,
    this.taskPriority,
    @required this.decisionTaskCompletedEventId,
    this.heartbeatTimeout,
  });
  static ActivityTaskScheduledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskScheduledEventAttributes(
        activityType: ActivityType.fromJson(json['activityType']),
        activityId: json['activityId'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
        control: json.containsKey('control') ? json['control'] as String : null,
        scheduleToStartTimeout: json.containsKey('scheduleToStartTimeout')
            ? json['scheduleToStartTimeout'] as String
            : null,
        scheduleToCloseTimeout: json.containsKey('scheduleToCloseTimeout')
            ? json['scheduleToCloseTimeout'] as String
            : null,
        startToCloseTimeout: json.containsKey('startToCloseTimeout')
            ? json['startToCloseTimeout'] as String
            : null,
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        heartbeatTimeout: json.containsKey('heartbeatTimeout')
            ? json['heartbeatTimeout'] as String
            : null,
      );
}

/// Provides the details of the `ActivityTaskStarted` event.
class ActivityTaskStartedEventAttributes {
  /// Identity of the worker that was assigned this task. This aids diagnostics
  /// when problems arise. The form of this identity is user defined.
  final String identity;

  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  ActivityTaskStartedEventAttributes({
    this.identity,
    @required this.scheduledEventId,
  });
  static ActivityTaskStartedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskStartedEventAttributes(
        identity:
            json.containsKey('identity') ? json['identity'] as String : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
      );
}

/// Status information about an activity task.
class ActivityTaskStatus {
  /// Set to `true` if cancellation of the task is requested.
  final bool cancelRequested;

  ActivityTaskStatus({
    @required this.cancelRequested,
  });
  static ActivityTaskStatus fromJson(Map<String, dynamic> json) =>
      ActivityTaskStatus(
        cancelRequested: json['cancelRequested'] as bool,
      );
}

/// Provides the details of the `ActivityTaskTimedOut` event.
class ActivityTaskTimedOutEventAttributes {
  /// The type of the timeout that caused this event.
  final String timeoutType;

  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `ActivityTaskStarted` event recorded when this activity task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  /// Contains the content of the `details` parameter for the last call made by
  /// the activity to `RecordActivityTaskHeartbeat`.
  final String details;

  ActivityTaskTimedOutEventAttributes({
    @required this.timeoutType,
    @required this.scheduledEventId,
    @required this.startedEventId,
    this.details,
  });
  static ActivityTaskTimedOutEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ActivityTaskTimedOutEventAttributes(
        timeoutType: json['timeoutType'] as String,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
        details: json.containsKey('details') ? json['details'] as String : null,
      );
}

/// Represents an activity type.
class ActivityType {
  /// The name of this activity.
  ///
  ///
  ///
  /// The combination of activity type name and version must be unique within a
  /// domain.
  final String name;

  /// The version of this activity.
  ///
  ///
  ///
  /// The combination of activity type name and version must be unique with in a
  /// domain.
  final String version;

  ActivityType({
    @required this.name,
    @required this.version,
  });
  static ActivityType fromJson(Map<String, dynamic> json) => ActivityType(
        name: json['name'] as String,
        version: json['version'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configuration settings registered with the activity type.
class ActivityTypeConfiguration {
  ///  The default maximum duration for tasks of an activity type specified when
  /// registering the activity type. You can override this default when
  /// scheduling a task through the `ScheduleActivityTask` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultTaskStartToCloseTimeout;

  ///  The default maximum time, in seconds, before which a worker processing a
  /// task must report progress by calling RecordActivityTaskHeartbeat.
  ///
  /// You can specify this value only when _registering_ an activity type. The
  /// registered default value can be overridden when you schedule a task
  /// through the `ScheduleActivityTask` Decision. If the activity worker
  /// subsequently attempts to record a heartbeat or returns a result, the
  /// activity worker receives an `UnknownResource` fault. In this case, Amazon
  /// SWF no longer considers the activity task to be valid; the activity worker
  /// should clean up the activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultTaskHeartbeatTimeout;

  ///  The default task list specified for this activity type at registration.
  /// This default is used if a task list isn't provided when a task is
  /// scheduled through the `ScheduleActivityTask` Decision. You can override
  /// the default registered task list when scheduling a task through the
  /// `ScheduleActivityTask` Decision.
  final TaskList defaultTaskList;

  ///  The default task priority for tasks of this activity type, specified at
  /// registration. If not set, then `0` is used as the default priority. This
  /// default can be overridden when scheduling an activity task.
  ///
  /// Valid values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String defaultTaskPriority;

  ///  The default maximum duration, specified when registering the activity
  /// type, that a task of an activity type can wait before being assigned to a
  /// worker. You can override this default when scheduling a task through the
  /// `ScheduleActivityTask` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultTaskScheduleToStartTimeout;

  ///  The default maximum duration, specified when registering the activity
  /// type, for tasks of this activity type. You can override this default when
  /// scheduling a task through the `ScheduleActivityTask` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultTaskScheduleToCloseTimeout;

  ActivityTypeConfiguration({
    this.defaultTaskStartToCloseTimeout,
    this.defaultTaskHeartbeatTimeout,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultTaskScheduleToStartTimeout,
    this.defaultTaskScheduleToCloseTimeout,
  });
  static ActivityTypeConfiguration fromJson(Map<String, dynamic> json) =>
      ActivityTypeConfiguration(
        defaultTaskStartToCloseTimeout:
            json.containsKey('defaultTaskStartToCloseTimeout')
                ? json['defaultTaskStartToCloseTimeout'] as String
                : null,
        defaultTaskHeartbeatTimeout:
            json.containsKey('defaultTaskHeartbeatTimeout')
                ? json['defaultTaskHeartbeatTimeout'] as String
                : null,
        defaultTaskList: json.containsKey('defaultTaskList')
            ? TaskList.fromJson(json['defaultTaskList'])
            : null,
        defaultTaskPriority: json.containsKey('defaultTaskPriority')
            ? json['defaultTaskPriority'] as String
            : null,
        defaultTaskScheduleToStartTimeout:
            json.containsKey('defaultTaskScheduleToStartTimeout')
                ? json['defaultTaskScheduleToStartTimeout'] as String
                : null,
        defaultTaskScheduleToCloseTimeout:
            json.containsKey('defaultTaskScheduleToCloseTimeout')
                ? json['defaultTaskScheduleToCloseTimeout'] as String
                : null,
      );
}

/// Detailed information about an activity type.
class ActivityTypeDetail {
  /// General information about the activity type.
  ///
  /// The status of activity type (returned in the ActivityTypeInfo structure)
  /// can be one of the following.
  ///
  /// *    `REGISTERED` – The type is registered and available. Workers
  /// supporting this type should be running.
  ///
  /// *    `DEPRECATED` – The type was deprecated using DeprecateActivityType,
  /// but is still in use. You should keep workers supporting this type running.
  /// You cannot create new tasks of this type.
  final ActivityTypeInfo typeInfo;

  /// The configuration settings registered with the activity type.
  final ActivityTypeConfiguration configuration;

  ActivityTypeDetail({
    @required this.typeInfo,
    @required this.configuration,
  });
  static ActivityTypeDetail fromJson(Map<String, dynamic> json) =>
      ActivityTypeDetail(
        typeInfo: ActivityTypeInfo.fromJson(json['typeInfo']),
        configuration:
            ActivityTypeConfiguration.fromJson(json['configuration']),
      );
}

/// Detailed information about an activity type.
class ActivityTypeInfo {
  /// The ActivityType type structure representing the activity type.
  final ActivityType activityType;

  /// The current status of the activity type.
  final String status;

  /// The description of the activity type provided in RegisterActivityType.
  final String description;

  /// The date and time this activity type was created through
  /// RegisterActivityType.
  final DateTime creationDate;

  /// If DEPRECATED, the date and time DeprecateActivityType was called.
  final DateTime deprecationDate;

  ActivityTypeInfo({
    @required this.activityType,
    @required this.status,
    this.description,
    @required this.creationDate,
    this.deprecationDate,
  });
  static ActivityTypeInfo fromJson(Map<String, dynamic> json) =>
      ActivityTypeInfo(
        activityType: ActivityType.fromJson(json['activityType']),
        status: json['status'] as String,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        creationDate: DateTime.parse(json['creationDate']),
        deprecationDate: json.containsKey('deprecationDate')
            ? DateTime.parse(json['deprecationDate'])
            : null,
      );
}

/// Contains a paginated list of activity type information structures.
class ActivityTypeInfos {
  /// List of activity type information.
  final List<ActivityTypeInfo> typeInfos;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  ActivityTypeInfos({
    @required this.typeInfos,
    this.nextPageToken,
  });
  static ActivityTypeInfos fromJson(Map<String, dynamic> json) =>
      ActivityTypeInfos(
        typeInfos: (json['typeInfos'] as List)
            .map((e) => ActivityTypeInfo.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
      );
}

/// Provides the details of the `CancelTimer` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class CancelTimerDecisionAttributes {
  ///  The unique ID of the timer to cancel.
  final String timerId;

  CancelTimerDecisionAttributes({
    @required this.timerId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `CancelTimerFailed` event.
class CancelTimerFailedEventAttributes {
  /// The timerId provided in the `CancelTimer` decision that failed.
  final String timerId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CancelTimer` decision to cancel this timer.
  /// This information can be useful for diagnosing problems by tracing back the
  /// chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  CancelTimerFailedEventAttributes({
    @required this.timerId,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static CancelTimerFailedEventAttributes fromJson(Map<String, dynamic> json) =>
      CancelTimerFailedEventAttributes(
        timerId: json['timerId'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `CancelWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class CancelWorkflowExecutionDecisionAttributes {
  ///  Details of the cancellation.
  final String details;

  CancelWorkflowExecutionDecisionAttributes({
    this.details,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `CancelWorkflowExecutionFailed` event.
class CancelWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CancelWorkflowExecution` decision for this
  /// cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  CancelWorkflowExecutionFailedEventAttributes({
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static CancelWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      CancelWorkflowExecutionFailedEventAttributes(
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provide details of the `ChildWorkflowExecutionCanceled` event.
class ChildWorkflowExecutionCanceledEventAttributes {
  /// The child workflow execution that was canceled.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// Details of the cancellation (if provided).
  final String details;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `ChildWorkflowExecutionStarted` event recorded when this
  /// child workflow execution was started. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt startedEventId;

  ChildWorkflowExecutionCanceledEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    this.details,
    @required this.initiatedEventId,
    @required this.startedEventId,
  });
  static ChildWorkflowExecutionCanceledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionCanceledEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        details: json.containsKey('details') ? json['details'] as String : null,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ChildWorkflowExecutionCompleted` event.
class ChildWorkflowExecutionCompletedEventAttributes {
  /// The child workflow execution that was completed.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The result of the child workflow execution.
  final String result;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `ChildWorkflowExecutionStarted` event recorded when this
  /// child workflow execution was started. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt startedEventId;

  ChildWorkflowExecutionCompletedEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    this.result,
    @required this.initiatedEventId,
    @required this.startedEventId,
  });
  static ChildWorkflowExecutionCompletedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionCompletedEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        result: json.containsKey('result') ? json['result'] as String : null,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ChildWorkflowExecutionFailed` event.
class ChildWorkflowExecutionFailedEventAttributes {
  /// The child workflow execution that failed.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The reason for the failure (if provided).
  final String reason;

  /// The details of the failure (if provided).
  final String details;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `ChildWorkflowExecutionStarted` event recorded when this
  /// child workflow execution was started. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt startedEventId;

  ChildWorkflowExecutionFailedEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    this.reason,
    this.details,
    @required this.initiatedEventId,
    @required this.startedEventId,
  });
  static ChildWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionFailedEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ChildWorkflowExecutionStarted` event.
class ChildWorkflowExecutionStartedEventAttributes {
  /// The child workflow execution that was started.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  ChildWorkflowExecutionStartedEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    @required this.initiatedEventId,
  });
  static ChildWorkflowExecutionStartedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionStartedEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        initiatedEventId: BigInt.from(json['initiatedEventId']),
      );
}

/// Provides the details of the `ChildWorkflowExecutionTerminated` event.
class ChildWorkflowExecutionTerminatedEventAttributes {
  /// The child workflow execution that was terminated.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `ChildWorkflowExecutionStarted` event recorded when this
  /// child workflow execution was started. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt startedEventId;

  ChildWorkflowExecutionTerminatedEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    @required this.initiatedEventId,
    @required this.startedEventId,
  });
  static ChildWorkflowExecutionTerminatedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionTerminatedEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `ChildWorkflowExecutionTimedOut` event.
class ChildWorkflowExecutionTimedOutEventAttributes {
  /// The child workflow execution that timed out.
  final WorkflowExecution workflowExecution;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// The type of the timeout that caused the child workflow execution to time
  /// out.
  final String timeoutType;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this child workflow
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `ChildWorkflowExecutionStarted` event recorded when this
  /// child workflow execution was started. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt startedEventId;

  ChildWorkflowExecutionTimedOutEventAttributes({
    @required this.workflowExecution,
    @required this.workflowType,
    @required this.timeoutType,
    @required this.initiatedEventId,
    @required this.startedEventId,
  });
  static ChildWorkflowExecutionTimedOutEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ChildWorkflowExecutionTimedOutEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        timeoutType: json['timeoutType'] as String,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Used to filter the closed workflow executions in visibility APIs by their
/// close status.
class CloseStatusFilter {
  ///  The close status that must match the close status of an execution for it
  /// to meet the criteria of this filter.
  final String status;

  CloseStatusFilter({
    @required this.status,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `CompleteWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class CompleteWorkflowExecutionDecisionAttributes {
  /// The result of the workflow execution. The form of the result is
  /// implementation defined.
  final String result;

  CompleteWorkflowExecutionDecisionAttributes({
    this.result,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `CompleteWorkflowExecutionFailed` event.
class CompleteWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CompleteWorkflowExecution` decision to complete
  /// this execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  CompleteWorkflowExecutionFailedEventAttributes({
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static CompleteWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      CompleteWorkflowExecutionFailedEventAttributes(
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `ContinueAsNewWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   Constrain the following parameters by using a `Condition` element with
/// the appropriate keys.
///
///     *    `tag` – A tag used to identify the workflow execution
///
///     *    `taskList` – String constraint. The key is `swf:taskList.name`.
///
///     *    `workflowType.version` – String constraint. The key is
/// `swf:workflowType.version`.
///
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class ContinueAsNewWorkflowExecutionDecisionAttributes {
  /// The input provided to the new workflow execution.
  final String input;

  /// If set, specifies the total duration for this workflow execution. This
  /// overrides the `defaultExecutionStartToCloseTimeout` specified when
  /// registering the workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this field.
  /// If neither this field is set nor a default execution start-to-close
  /// timeout was specified at registration time then a fault is returned.
  final String executionStartToCloseTimeout;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  final TaskList taskList;

  ///  The task priority that, if set, specifies the priority for the decision
  /// tasks for this workflow execution. This overrides the defaultTaskPriority
  /// specified when registering the workflow type. Valid values are integers
  /// that range from Java's `Integer.MIN_VALUE` (-2147483648) to
  /// `Integer.MAX_VALUE` (2147483647). Higher numbers indicate higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// Specifies the maximum duration of decision tasks for the new workflow
  /// execution. This parameter overrides the `defaultTaskStartToCloseTimout`
  /// specified when registering the workflow type using RegisterWorkflowType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A task start-to-close timeout for the new workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  final String taskStartToCloseTimeout;

  /// If set, specifies the policy to use for the child workflow executions of
  /// the new execution if it is terminated by calling the
  /// TerminateWorkflowExecution action explicitly or due to an expired timeout.
  /// This policy overrides the default child policy specified when registering
  /// the workflow type using RegisterWorkflowType.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  ///
  ///
  ///
  ///
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  final String childPolicy;

  /// The list of tags to associate with the new workflow execution. A maximum
  /// of 5 tags can be specified. You can list workflow executions with a
  /// specific tag by calling ListOpenWorkflowExecutions or
  /// ListClosedWorkflowExecutions and specifying a TagFilter.
  final List<String> tagList;

  /// The version of the workflow to start.
  final String workflowTypeVersion;

  /// The IAM role to attach to the new (continued) execution.
  final String lambdaRole;

  ContinueAsNewWorkflowExecutionDecisionAttributes({
    this.input,
    this.executionStartToCloseTimeout,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
    this.childPolicy,
    this.tagList,
    this.workflowTypeVersion,
    this.lambdaRole,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `ContinueAsNewWorkflowExecutionFailed` event.
class ContinueAsNewWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `ContinueAsNewWorkflowExecution` decision that
  /// started this execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  ContinueAsNewWorkflowExecutionFailedEventAttributes({
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static ContinueAsNewWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ContinueAsNewWorkflowExecutionFailedEventAttributes(
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Specifies a decision made by the decider. A decision can be one of these
/// types:
///
/// *    `CancelTimer` – Cancels a previously started timer and records a
/// `TimerCanceled` event in the history.
///
/// *    `CancelWorkflowExecution` – Closes the workflow execution and records a
/// `WorkflowExecutionCanceled` event in the history.
///
/// *    `CompleteWorkflowExecution` – Closes the workflow execution and records
/// a `WorkflowExecutionCompleted` event in the history .
///
/// *    `ContinueAsNewWorkflowExecution` – Closes the workflow execution and
/// starts a new workflow execution of the same type using the same workflow ID
/// and a unique run Id. A `WorkflowExecutionContinuedAsNew` event is recorded
/// in the history.
///
/// *    `FailWorkflowExecution` – Closes the workflow execution and records a
/// `WorkflowExecutionFailed` event in the history.
///
/// *    `RecordMarker` – Records a `MarkerRecorded` event in the history.
/// Markers can be used for adding custom information in the history for
/// instance to let deciders know that they don't need to look at the history
/// beyond the marker event.
///
/// *    `RequestCancelActivityTask` – Attempts to cancel a previously scheduled
/// activity task. If the activity task was scheduled but has not been assigned
/// to a worker, then it is canceled. If the activity task was already assigned
/// to a worker, then the worker is informed that cancellation has been
/// requested in the response to RecordActivityTaskHeartbeat.
///
/// *    `RequestCancelExternalWorkflowExecution` – Requests that a request be
/// made to cancel the specified external workflow execution and records a
/// `RequestCancelExternalWorkflowExecutionInitiated` event in the history.
///
/// *    `ScheduleActivityTask` – Schedules an activity task.
///
/// *    `SignalExternalWorkflowExecution` – Requests a signal to be delivered
/// to the specified external workflow execution and records a
/// `SignalExternalWorkflowExecutionInitiated` event in the history.
///
/// *    `StartChildWorkflowExecution` – Requests that a child workflow
/// execution be started and records a `StartChildWorkflowExecutionInitiated`
/// event in the history. The child workflow execution is a separate workflow
/// execution with its own history.
///
/// *    `StartTimer` – Starts a timer for this workflow execution and records a
/// `TimerStarted` event in the history. This timer fires after the specified
/// delay and record a `TimerFired` event.
///
///
///  **Access Control**
///
/// If you grant permission to use `RespondDecisionTaskCompleted`, you can use
/// IAM policies to express permissions for the list of decisions returned by
/// this action as if they were members of the API. Treating decisions as a
/// pseudo API maintains a uniform conceptual model and helps keep policies
/// readable. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
///
///  **Decision Failure**
///
/// Decisions can fail for several reasons
///
/// *   The ordering of decisions should follow a logical flow. Some decisions
/// might not make sense in the current context of the workflow execution and
/// therefore fails.
///
/// *   A limit on your account was reached.
///
/// *   The decision lacks sufficient permissions.
///
///
/// One of the following events might be added to the history to indicate an
/// error. The event attribute's `cause` parameter indicates the cause. If
/// `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed because it
/// lacked sufficient permissions. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
///
/// *    `ScheduleActivityTaskFailed` – A `ScheduleActivityTask` decision
/// failed. This could happen if the activity type specified in the decision
/// isn't registered, is in a deprecated state, or the decision isn't properly
/// configured.
///
/// *    `RequestCancelActivityTaskFailed` – A `RequestCancelActivityTask`
/// decision failed. This could happen if there is no open activity task with
/// the specified activityId.
///
/// *    `StartTimerFailed` – A `StartTimer` decision failed. This could happen
/// if there is another open timer with the same timerId.
///
/// *    `CancelTimerFailed` – A `CancelTimer` decision failed. This could
/// happen if there is no open timer with the specified timerId.
///
/// *    `StartChildWorkflowExecutionFailed` – A `StartChildWorkflowExecution`
/// decision failed. This could happen if the workflow type specified isn't
/// registered, is deprecated, or the decision isn't properly configured.
///
/// *    `SignalExternalWorkflowExecutionFailed` – A
/// `SignalExternalWorkflowExecution` decision failed. This could happen if the
/// `workflowID` specified in the decision was incorrect.
///
/// *    `RequestCancelExternalWorkflowExecutionFailed` – A
/// `RequestCancelExternalWorkflowExecution` decision failed. This could happen
/// if the `workflowID` specified in the decision was incorrect.
///
/// *    `CancelWorkflowExecutionFailed` – A `CancelWorkflowExecution` decision
/// failed. This could happen if there is an unhandled decision task pending in
/// the workflow execution.
///
/// *    `CompleteWorkflowExecutionFailed` – A `CompleteWorkflowExecution`
/// decision failed. This could happen if there is an unhandled decision task
/// pending in the workflow execution.
///
/// *    `ContinueAsNewWorkflowExecutionFailed` – A
/// `ContinueAsNewWorkflowExecution` decision failed. This could happen if there
/// is an unhandled decision task pending in the workflow execution or the
/// ContinueAsNewWorkflowExecution decision was not configured correctly.
///
/// *    `FailWorkflowExecutionFailed` – A `FailWorkflowExecution` decision
/// failed. This could happen if there is an unhandled decision task pending in
/// the workflow execution.
///
///
/// The preceding error events might occur due to an error in the decider logic,
/// which might put the workflow execution in an unstable state The cause field
/// in the event structure for the error event indicates the cause of the error.
///
///  A workflow execution may be closed by the decider by returning one of the
/// following decisions when completing a decision task:
/// `CompleteWorkflowExecution`, `FailWorkflowExecution`,
/// `CancelWorkflowExecution` and `ContinueAsNewWorkflowExecution`. An
/// `UnhandledDecision` fault is returned if a workflow closing decision is
/// specified and a signal or activity event had been added to the history while
/// the decision task was being performed by the decider. Unlike the above
/// situations which are logic issues, this fault is always possible because of
/// race conditions in a distributed system. The right action here is to call
/// RespondDecisionTaskCompleted without any decisions. This would result in
/// another decision task with these new events included in the history. The
/// decider should handle the new events and may decide to close the workflow
/// execution.
///
///  **How to Code a Decision**
///
/// You code a decision by first setting the decision type field to one of the
/// above decision values, and then set the corresponding attributes field shown
/// below:
///
/// *     `ScheduleActivityTaskDecisionAttributes`
///
/// *     `RequestCancelActivityTaskDecisionAttributes`
///
/// *     `CompleteWorkflowExecutionDecisionAttributes`
///
/// *     `FailWorkflowExecutionDecisionAttributes`
///
/// *     `CancelWorkflowExecutionDecisionAttributes`
///
/// *     `ContinueAsNewWorkflowExecutionDecisionAttributes`
///
/// *     `RecordMarkerDecisionAttributes`
///
/// *     `StartTimerDecisionAttributes`
///
/// *     `CancelTimerDecisionAttributes`
///
/// *     `SignalExternalWorkflowExecutionDecisionAttributes`
///
/// *     `RequestCancelExternalWorkflowExecutionDecisionAttributes`
///
/// *     `StartChildWorkflowExecutionDecisionAttributes`
class Decision {
  /// Specifies the type of the decision.
  final String decisionType;

  /// Provides the details of the `ScheduleActivityTask` decision. It isn't set
  /// for other decision types.
  final ScheduleActivityTaskDecisionAttributes
      scheduleActivityTaskDecisionAttributes;

  /// Provides the details of the `RequestCancelActivityTask` decision. It isn't
  /// set for other decision types.
  final RequestCancelActivityTaskDecisionAttributes
      requestCancelActivityTaskDecisionAttributes;

  /// Provides the details of the `CompleteWorkflowExecution` decision. It isn't
  /// set for other decision types.
  final CompleteWorkflowExecutionDecisionAttributes
      completeWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `FailWorkflowExecution` decision. It isn't set
  /// for other decision types.
  final FailWorkflowExecutionDecisionAttributes
      failWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `CancelWorkflowExecution` decision. It isn't
  /// set for other decision types.
  final CancelWorkflowExecutionDecisionAttributes
      cancelWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `ContinueAsNewWorkflowExecution` decision. It
  /// isn't set for other decision types.
  final ContinueAsNewWorkflowExecutionDecisionAttributes
      continueAsNewWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `RecordMarker` decision. It isn't set for
  /// other decision types.
  final RecordMarkerDecisionAttributes recordMarkerDecisionAttributes;

  /// Provides the details of the `StartTimer` decision. It isn't set for other
  /// decision types.
  final StartTimerDecisionAttributes startTimerDecisionAttributes;

  /// Provides the details of the `CancelTimer` decision. It isn't set for other
  /// decision types.
  final CancelTimerDecisionAttributes cancelTimerDecisionAttributes;

  /// Provides the details of the `SignalExternalWorkflowExecution` decision. It
  /// isn't set for other decision types.
  final SignalExternalWorkflowExecutionDecisionAttributes
      signalExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `RequestCancelExternalWorkflowExecution`
  /// decision. It isn't set for other decision types.
  final RequestCancelExternalWorkflowExecutionDecisionAttributes
      requestCancelExternalWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `StartChildWorkflowExecution` decision. It
  /// isn't set for other decision types.
  final StartChildWorkflowExecutionDecisionAttributes
      startChildWorkflowExecutionDecisionAttributes;

  /// Provides the details of the `ScheduleLambdaFunction` decision. It isn't
  /// set for other decision types.
  final ScheduleLambdaFunctionDecisionAttributes
      scheduleLambdaFunctionDecisionAttributes;

  Decision({
    @required this.decisionType,
    this.scheduleActivityTaskDecisionAttributes,
    this.requestCancelActivityTaskDecisionAttributes,
    this.completeWorkflowExecutionDecisionAttributes,
    this.failWorkflowExecutionDecisionAttributes,
    this.cancelWorkflowExecutionDecisionAttributes,
    this.continueAsNewWorkflowExecutionDecisionAttributes,
    this.recordMarkerDecisionAttributes,
    this.startTimerDecisionAttributes,
    this.cancelTimerDecisionAttributes,
    this.signalExternalWorkflowExecutionDecisionAttributes,
    this.requestCancelExternalWorkflowExecutionDecisionAttributes,
    this.startChildWorkflowExecutionDecisionAttributes,
    this.scheduleLambdaFunctionDecisionAttributes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure that represents a decision task. Decision tasks are sent to
/// deciders in order for them to make decisions.
class DecisionTask {
  /// The opaque string used as a handle on the task. This token is used by
  /// workers to communicate progress and response information back to the
  /// system about the task.
  final String taskToken;

  /// The ID of the `DecisionTaskStarted` event recorded in the history.
  final BigInt startedEventId;

  /// The workflow execution for which this decision task was created.
  final WorkflowExecution workflowExecution;

  /// The type of the workflow execution for which this decision task was
  /// created.
  final WorkflowType workflowType;

  /// A paginated list of history events of the workflow execution. The decider
  /// uses this during the processing of the decision task.
  final List<HistoryEvent> events;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  /// The ID of the DecisionTaskStarted event of the previous decision task of
  /// this workflow execution that was processed by the decider. This can be
  /// used to determine the events in the history new since the last decision
  /// task received by the decider.
  final BigInt previousStartedEventId;

  DecisionTask({
    @required this.taskToken,
    @required this.startedEventId,
    @required this.workflowExecution,
    @required this.workflowType,
    @required this.events,
    this.nextPageToken,
    this.previousStartedEventId,
  });
  static DecisionTask fromJson(Map<String, dynamic> json) => DecisionTask(
        taskToken: json['taskToken'] as String,
        startedEventId: BigInt.from(json['startedEventId']),
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        events: (json['events'] as List)
            .map((e) => HistoryEvent.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
        previousStartedEventId: json.containsKey('previousStartedEventId')
            ? BigInt.from(json['previousStartedEventId'])
            : null,
      );
}

/// Provides the details of the `DecisionTaskCompleted` event.
class DecisionTaskCompletedEventAttributes {
  /// User defined context for the workflow execution.
  final String executionContext;

  /// The ID of the `DecisionTaskScheduled` event that was recorded when this
  /// decision task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `DecisionTaskStarted` event recorded when this decision task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  DecisionTaskCompletedEventAttributes({
    this.executionContext,
    @required this.scheduledEventId,
    @required this.startedEventId,
  });
  static DecisionTaskCompletedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      DecisionTaskCompletedEventAttributes(
        executionContext: json.containsKey('executionContext')
            ? json['executionContext'] as String
            : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides details about the `DecisionTaskScheduled` event.
class DecisionTaskScheduledEventAttributes {
  /// The name of the task list in which the decision task was scheduled.
  final TaskList taskList;

  ///  A task priority that, if set, specifies the priority for this decision
  /// task. Valid values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// The maximum duration for this decision task. The task is considered timed
  /// out if it doesn't completed within this duration.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String startToCloseTimeout;

  DecisionTaskScheduledEventAttributes({
    @required this.taskList,
    this.taskPriority,
    this.startToCloseTimeout,
  });
  static DecisionTaskScheduledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      DecisionTaskScheduledEventAttributes(
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        startToCloseTimeout: json.containsKey('startToCloseTimeout')
            ? json['startToCloseTimeout'] as String
            : null,
      );
}

/// Provides the details of the `DecisionTaskStarted` event.
class DecisionTaskStartedEventAttributes {
  /// Identity of the decider making the request. This enables diagnostic
  /// tracing when problems arise. The form of this identity is user defined.
  final String identity;

  /// The ID of the `DecisionTaskScheduled` event that was recorded when this
  /// decision task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  DecisionTaskStartedEventAttributes({
    this.identity,
    @required this.scheduledEventId,
  });
  static DecisionTaskStartedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      DecisionTaskStartedEventAttributes(
        identity:
            json.containsKey('identity') ? json['identity'] as String : null,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
      );
}

/// Provides the details of the `DecisionTaskTimedOut` event.
class DecisionTaskTimedOutEventAttributes {
  /// The type of timeout that expired before the decision task could be
  /// completed.
  final String timeoutType;

  /// The ID of the `DecisionTaskScheduled` event that was recorded when this
  /// decision task was scheduled. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `DecisionTaskStarted` event recorded when this decision task
  /// was started. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt startedEventId;

  DecisionTaskTimedOutEventAttributes({
    @required this.timeoutType,
    @required this.scheduledEventId,
    @required this.startedEventId,
  });
  static DecisionTaskTimedOutEventAttributes fromJson(
          Map<String, dynamic> json) =>
      DecisionTaskTimedOutEventAttributes(
        timeoutType: json['timeoutType'] as String,
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Contains the configuration settings of a domain.
class DomainConfiguration {
  /// The retention period for workflow executions in this domain.
  final String workflowExecutionRetentionPeriodInDays;

  DomainConfiguration({
    @required this.workflowExecutionRetentionPeriodInDays,
  });
  static DomainConfiguration fromJson(Map<String, dynamic> json) =>
      DomainConfiguration(
        workflowExecutionRetentionPeriodInDays:
            json['workflowExecutionRetentionPeriodInDays'] as String,
      );
}

/// Contains details of a domain.
class DomainDetail {
  /// The basic information about a domain, such as its name, status, and
  /// description.
  final DomainInfo domainInfo;

  /// The domain configuration. Currently, this includes only the domain's
  /// retention period.
  final DomainConfiguration configuration;

  DomainDetail({
    @required this.domainInfo,
    @required this.configuration,
  });
  static DomainDetail fromJson(Map<String, dynamic> json) => DomainDetail(
        domainInfo: DomainInfo.fromJson(json['domainInfo']),
        configuration: DomainConfiguration.fromJson(json['configuration']),
      );
}

/// Contains general information about a domain.
class DomainInfo {
  /// The name of the domain. This name is unique within the account.
  final String name;

  /// The status of the domain:
  ///
  /// *    `REGISTERED` – The domain is properly registered and available. You
  /// can use this domain for registering types and creating new workflow
  /// executions.
  ///
  /// *    `DEPRECATED` – The domain was deprecated using DeprecateDomain, but
  /// is still in use. You should not create new workflow executions in this
  /// domain.
  final String status;

  /// The description of the domain provided through RegisterDomain.
  final String description;

  /// The ARN of the domain.
  final String arn;

  DomainInfo({
    @required this.name,
    @required this.status,
    this.description,
    this.arn,
  });
  static DomainInfo fromJson(Map<String, dynamic> json) => DomainInfo(
        name: json['name'] as String,
        status: json['status'] as String,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
      );
}

/// Contains a paginated collection of DomainInfo structures.
class DomainInfos {
  /// A list of DomainInfo structures.
  final List<DomainInfo> domainInfos;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  DomainInfos({
    @required this.domainInfos,
    this.nextPageToken,
  });
  static DomainInfos fromJson(Map<String, dynamic> json) => DomainInfos(
        domainInfos: (json['domainInfos'] as List)
            .map((e) => DomainInfo.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
      );
}

/// Used to filter the workflow executions in visibility APIs by various
/// time-based rules. Each parameter, if specified, defines a rule that must be
/// satisfied by each returned query result. The parameter values are in the
/// [Unix Time format](https://en.wikipedia.org/wiki/Unix_time). For example:
/// `"oldestDate": 1325376070.`
class ExecutionTimeFilter {
  /// Specifies the oldest start or close date and time to return.
  final DateTime oldestDate;

  /// Specifies the latest start or close date and time to return.
  final DateTime latestDate;

  ExecutionTimeFilter({
    @required this.oldestDate,
    this.latestDate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `ExternalWorkflowExecutionCancelRequested`
/// event.
class ExternalWorkflowExecutionCancelRequestedEventAttributes {
  /// The external workflow execution to which the cancellation request was
  /// delivered.
  final WorkflowExecution workflowExecution;

  /// The ID of the `RequestCancelExternalWorkflowExecutionInitiated` event
  /// corresponding to the `RequestCancelExternalWorkflowExecution` decision to
  /// cancel this external workflow execution. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final BigInt initiatedEventId;

  ExternalWorkflowExecutionCancelRequestedEventAttributes({
    @required this.workflowExecution,
    @required this.initiatedEventId,
  });
  static ExternalWorkflowExecutionCancelRequestedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ExternalWorkflowExecutionCancelRequestedEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        initiatedEventId: BigInt.from(json['initiatedEventId']),
      );
}

/// Provides the details of the `ExternalWorkflowExecutionSignaled` event.
class ExternalWorkflowExecutionSignaledEventAttributes {
  /// The external workflow execution that the signal was delivered to.
  final WorkflowExecution workflowExecution;

  /// The ID of the `SignalExternalWorkflowExecutionInitiated` event
  /// corresponding to the `SignalExternalWorkflowExecution` decision to request
  /// this signal. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  ExternalWorkflowExecutionSignaledEventAttributes({
    @required this.workflowExecution,
    @required this.initiatedEventId,
  });
  static ExternalWorkflowExecutionSignaledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ExternalWorkflowExecutionSignaledEventAttributes(
        workflowExecution:
            WorkflowExecution.fromJson(json['workflowExecution']),
        initiatedEventId: BigInt.from(json['initiatedEventId']),
      );
}

/// Provides the details of the `FailWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class FailWorkflowExecutionDecisionAttributes {
  /// A descriptive reason for the failure that may help in diagnostics.
  final String reason;

  ///  Details of the failure.
  final String details;

  FailWorkflowExecutionDecisionAttributes({
    this.reason,
    this.details,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `FailWorkflowExecutionFailed` event.
class FailWorkflowExecutionFailedEventAttributes {
  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `FailWorkflowExecution` decision to fail this
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  FailWorkflowExecutionFailedEventAttributes({
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static FailWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      FailWorkflowExecutionFailedEventAttributes(
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Paginated representation of a workflow history for a workflow execution.
/// This is the up to date, complete and authoritative record of the events
/// related to all tasks and events in the life of the workflow execution.
class History {
  /// The list of history events.
  final List<HistoryEvent> events;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  History({
    @required this.events,
    this.nextPageToken,
  });
  static History fromJson(Map<String, dynamic> json) => History(
        events: (json['events'] as List)
            .map((e) => HistoryEvent.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
      );
}

/// Event within a workflow execution. A history event can be one of these
/// types:
///
/// *    `ActivityTaskCancelRequested` – A `RequestCancelActivityTask` decision
/// was received by the system.
///
/// *    `ActivityTaskCanceled` – The activity task was successfully canceled.
///
/// *    `ActivityTaskCompleted` – An activity worker successfully completed an
/// activity task by calling RespondActivityTaskCompleted.
///
/// *    `ActivityTaskFailed` – An activity worker failed an activity task by
/// calling RespondActivityTaskFailed.
///
/// *    `ActivityTaskScheduled` – An activity task was scheduled for execution.
///
/// *    `ActivityTaskStarted` – The scheduled activity task was dispatched to a
/// worker.
///
/// *    `ActivityTaskTimedOut` – The activity task timed out.
///
/// *    `CancelTimerFailed` – Failed to process CancelTimer decision. This
/// happens when the decision isn't configured properly, for example no timer
/// exists with the specified timer Id.
///
/// *    `CancelWorkflowExecutionFailed` – A request to cancel a workflow
/// execution failed.
///
/// *    `ChildWorkflowExecutionCanceled` – A child workflow execution, started
/// by this workflow execution, was canceled and closed.
///
/// *    `ChildWorkflowExecutionCompleted` – A child workflow execution, started
/// by this workflow execution, completed successfully and was closed.
///
/// *    `ChildWorkflowExecutionFailed` – A child workflow execution, started by
/// this workflow execution, failed to complete successfully and was closed.
///
/// *    `ChildWorkflowExecutionStarted` – A child workflow execution was
/// successfully started.
///
/// *    `ChildWorkflowExecutionTerminated` – A child workflow execution,
/// started by this workflow execution, was terminated.
///
/// *    `ChildWorkflowExecutionTimedOut` – A child workflow execution, started
/// by this workflow execution, timed out and was closed.
///
/// *    `CompleteWorkflowExecutionFailed` – The workflow execution failed to
/// complete.
///
/// *    `ContinueAsNewWorkflowExecutionFailed` – The workflow execution failed
/// to complete after being continued as a new workflow execution.
///
/// *    `DecisionTaskCompleted` – The decider successfully completed a decision
/// task by calling RespondDecisionTaskCompleted.
///
/// *    `DecisionTaskScheduled` – A decision task was scheduled for the
/// workflow execution.
///
/// *    `DecisionTaskStarted` – The decision task was dispatched to a decider.
///
/// *    `DecisionTaskTimedOut` – The decision task timed out.
///
/// *    `ExternalWorkflowExecutionCancelRequested` – Request to cancel an
/// external workflow execution was successfully delivered to the target
/// execution.
///
/// *    `ExternalWorkflowExecutionSignaled` – A signal, requested by this
/// workflow execution, was successfully delivered to the target external
/// workflow execution.
///
/// *    `FailWorkflowExecutionFailed` – A request to mark a workflow execution
/// as failed, itself failed.
///
/// *    `MarkerRecorded` – A marker was recorded in the workflow history as the
/// result of a `RecordMarker` decision.
///
/// *    `RecordMarkerFailed` – A `RecordMarker` decision was returned as
/// failed.
///
/// *    `RequestCancelActivityTaskFailed` – Failed to process
/// RequestCancelActivityTask decision. This happens when the decision isn't
/// configured properly.
///
/// *    `RequestCancelExternalWorkflowExecutionFailed` – Request to cancel an
/// external workflow execution failed.
///
/// *    `RequestCancelExternalWorkflowExecutionInitiated` – A request was made
/// to request the cancellation of an external workflow execution.
///
/// *    `ScheduleActivityTaskFailed` – Failed to process ScheduleActivityTask
/// decision. This happens when the decision isn't configured properly, for
/// example the activity type specified isn't registered.
///
/// *    `SignalExternalWorkflowExecutionFailed` – The request to signal an
/// external workflow execution failed.
///
/// *    `SignalExternalWorkflowExecutionInitiated` – A request to signal an
/// external workflow was made.
///
/// *    `StartActivityTaskFailed` – A scheduled activity task failed to start.
///
/// *    `StartChildWorkflowExecutionFailed` – Failed to process
/// StartChildWorkflowExecution decision. This happens when the decision isn't
/// configured properly, for example the workflow type specified isn't
/// registered.
///
/// *    `StartChildWorkflowExecutionInitiated` – A request was made to start a
/// child workflow execution.
///
/// *    `StartTimerFailed` – Failed to process StartTimer decision. This
/// happens when the decision isn't configured properly, for example a timer
/// already exists with the specified timer Id.
///
/// *    `TimerCanceled` – A timer, previously started for this workflow
/// execution, was successfully canceled.
///
/// *    `TimerFired` – A timer, previously started for this workflow execution,
/// fired.
///
/// *    `TimerStarted` – A timer was started for the workflow execution due to
/// a `StartTimer` decision.
///
/// *    `WorkflowExecutionCancelRequested` – A request to cancel this workflow
/// execution was made.
///
/// *    `WorkflowExecutionCanceled` – The workflow execution was successfully
/// canceled and closed.
///
/// *    `WorkflowExecutionCompleted` – The workflow execution was closed due to
/// successful completion.
///
/// *    `WorkflowExecutionContinuedAsNew` – The workflow execution was closed
/// and a new execution of the same type was created with the same workflowId.
///
/// *    `WorkflowExecutionFailed` – The workflow execution closed due to a
/// failure.
///
/// *    `WorkflowExecutionSignaled` – An external signal was received for the
/// workflow execution.
///
/// *    `WorkflowExecutionStarted` – The workflow execution was started.
///
/// *    `WorkflowExecutionTerminated` – The workflow execution was terminated.
///
/// *    `WorkflowExecutionTimedOut` – The workflow execution was closed because
/// a time out was exceeded.
class HistoryEvent {
  /// The date and time when the event occurred.
  final DateTime eventTimestamp;

  /// The type of the history event.
  final String eventType;

  /// The system generated ID of the event. This ID uniquely identifies the
  /// event with in the workflow execution history.
  final BigInt eventId;

  /// If the event is of type `WorkflowExecutionStarted` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final WorkflowExecutionStartedEventAttributes
      workflowExecutionStartedEventAttributes;

  /// If the event is of type `WorkflowExecutionCompleted` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionCompletedEventAttributes
      workflowExecutionCompletedEventAttributes;

  /// If the event is of type `CompleteWorkflowExecutionFailed` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final CompleteWorkflowExecutionFailedEventAttributes
      completeWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `WorkflowExecutionFailed` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final WorkflowExecutionFailedEventAttributes
      workflowExecutionFailedEventAttributes;

  /// If the event is of type `FailWorkflowExecutionFailed` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final FailWorkflowExecutionFailedEventAttributes
      failWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `WorkflowExecutionTimedOut` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionTimedOutEventAttributes
      workflowExecutionTimedOutEventAttributes;

  /// If the event is of type `WorkflowExecutionCanceled` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionCanceledEventAttributes
      workflowExecutionCanceledEventAttributes;

  /// If the event is of type `CancelWorkflowExecutionFailed` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final CancelWorkflowExecutionFailedEventAttributes
      cancelWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `WorkflowExecutionContinuedAsNew` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionContinuedAsNewEventAttributes
      workflowExecutionContinuedAsNewEventAttributes;

  /// If the event is of type `ContinueAsNewWorkflowExecutionFailed` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ContinueAsNewWorkflowExecutionFailedEventAttributes
      continueAsNewWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `WorkflowExecutionTerminated` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionTerminatedEventAttributes
      workflowExecutionTerminatedEventAttributes;

  /// If the event is of type `WorkflowExecutionCancelRequested` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final WorkflowExecutionCancelRequestedEventAttributes
      workflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type `DecisionTaskScheduled` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final DecisionTaskScheduledEventAttributes
      decisionTaskScheduledEventAttributes;

  /// If the event is of type `DecisionTaskStarted` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final DecisionTaskStartedEventAttributes decisionTaskStartedEventAttributes;

  /// If the event is of type `DecisionTaskCompleted` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final DecisionTaskCompletedEventAttributes
      decisionTaskCompletedEventAttributes;

  /// If the event is of type `DecisionTaskTimedOut` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final DecisionTaskTimedOutEventAttributes decisionTaskTimedOutEventAttributes;

  /// If the event is of type `ActivityTaskScheduled` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskScheduledEventAttributes
      activityTaskScheduledEventAttributes;

  /// If the event is of type `ActivityTaskStarted` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskStartedEventAttributes activityTaskStartedEventAttributes;

  /// If the event is of type `ActivityTaskCompleted` then this member is set
  /// and provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskCompletedEventAttributes
      activityTaskCompletedEventAttributes;

  /// If the event is of type `ActivityTaskFailed` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskFailedEventAttributes activityTaskFailedEventAttributes;

  /// If the event is of type `ActivityTaskTimedOut` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskTimedOutEventAttributes activityTaskTimedOutEventAttributes;

  /// If the event is of type `ActivityTaskCanceled` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final ActivityTaskCanceledEventAttributes activityTaskCanceledEventAttributes;

  /// If the event is of type `ActivityTaskcancelRequested` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ActivityTaskCancelRequestedEventAttributes
      activityTaskCancelRequestedEventAttributes;

  /// If the event is of type `WorkflowExecutionSignaled` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final WorkflowExecutionSignaledEventAttributes
      workflowExecutionSignaledEventAttributes;

  /// If the event is of type `MarkerRecorded` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final MarkerRecordedEventAttributes markerRecordedEventAttributes;

  /// If the event is of type `DecisionTaskFailed` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final RecordMarkerFailedEventAttributes recordMarkerFailedEventAttributes;

  /// If the event is of type `TimerStarted` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final TimerStartedEventAttributes timerStartedEventAttributes;

  /// If the event is of type `TimerFired` then this member is set and provides
  /// detailed information about the event. It isn't set for other event types.
  final TimerFiredEventAttributes timerFiredEventAttributes;

  /// If the event is of type `TimerCanceled` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final TimerCanceledEventAttributes timerCanceledEventAttributes;

  /// If the event is of type `StartChildWorkflowExecutionInitiated` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final StartChildWorkflowExecutionInitiatedEventAttributes
      startChildWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionStarted` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ChildWorkflowExecutionStartedEventAttributes
      childWorkflowExecutionStartedEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionCompleted` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ChildWorkflowExecutionCompletedEventAttributes
      childWorkflowExecutionCompletedEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionFailed` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ChildWorkflowExecutionFailedEventAttributes
      childWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionTimedOut` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ChildWorkflowExecutionTimedOutEventAttributes
      childWorkflowExecutionTimedOutEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionCanceled` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ChildWorkflowExecutionCanceledEventAttributes
      childWorkflowExecutionCanceledEventAttributes;

  /// If the event is of type `ChildWorkflowExecutionTerminated` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ChildWorkflowExecutionTerminatedEventAttributes
      childWorkflowExecutionTerminatedEventAttributes;

  /// If the event is of type `SignalExternalWorkflowExecutionInitiated` then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final SignalExternalWorkflowExecutionInitiatedEventAttributes
      signalExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type `ExternalWorkflowExecutionSignaled` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final ExternalWorkflowExecutionSignaledEventAttributes
      externalWorkflowExecutionSignaledEventAttributes;

  /// If the event is of type `SignalExternalWorkflowExecutionFailed` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final SignalExternalWorkflowExecutionFailedEventAttributes
      signalExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `ExternalWorkflowExecutionCancelRequested` then
  /// this member is set and provides detailed information about the event. It
  /// isn't set for other event types.
  final ExternalWorkflowExecutionCancelRequestedEventAttributes
      externalWorkflowExecutionCancelRequestedEventAttributes;

  /// If the event is of type `RequestCancelExternalWorkflowExecutionInitiated`
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  final RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
      requestCancelExternalWorkflowExecutionInitiatedEventAttributes;

  /// If the event is of type `RequestCancelExternalWorkflowExecutionFailed`
  /// then this member is set and provides detailed information about the event.
  /// It isn't set for other event types.
  final RequestCancelExternalWorkflowExecutionFailedEventAttributes
      requestCancelExternalWorkflowExecutionFailedEventAttributes;

  /// If the event is of type `ScheduleActivityTaskFailed` then this member is
  /// set and provides detailed information about the event. It isn't set for
  /// other event types.
  final ScheduleActivityTaskFailedEventAttributes
      scheduleActivityTaskFailedEventAttributes;

  /// If the event is of type `RequestCancelActivityTaskFailed` then this member
  /// is set and provides detailed information about the event. It isn't set for
  /// other event types.
  final RequestCancelActivityTaskFailedEventAttributes
      requestCancelActivityTaskFailedEventAttributes;

  /// If the event is of type `StartTimerFailed` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final StartTimerFailedEventAttributes startTimerFailedEventAttributes;

  /// If the event is of type `CancelTimerFailed` then this member is set and
  /// provides detailed information about the event. It isn't set for other
  /// event types.
  final CancelTimerFailedEventAttributes cancelTimerFailedEventAttributes;

  /// If the event is of type `StartChildWorkflowExecutionFailed` then this
  /// member is set and provides detailed information about the event. It isn't
  /// set for other event types.
  final StartChildWorkflowExecutionFailedEventAttributes
      startChildWorkflowExecutionFailedEventAttributes;

  /// Provides the details of the `LambdaFunctionScheduled` event. It isn't set
  /// for other event types.
  final LambdaFunctionScheduledEventAttributes
      lambdaFunctionScheduledEventAttributes;

  /// Provides the details of the `LambdaFunctionStarted` event. It isn't set
  /// for other event types.
  final LambdaFunctionStartedEventAttributes
      lambdaFunctionStartedEventAttributes;

  /// Provides the details of the `LambdaFunctionCompleted` event. It isn't set
  /// for other event types.
  final LambdaFunctionCompletedEventAttributes
      lambdaFunctionCompletedEventAttributes;

  /// Provides the details of the `LambdaFunctionFailed` event. It isn't set for
  /// other event types.
  final LambdaFunctionFailedEventAttributes lambdaFunctionFailedEventAttributes;

  /// Provides the details of the `LambdaFunctionTimedOut` event. It isn't set
  /// for other event types.
  final LambdaFunctionTimedOutEventAttributes
      lambdaFunctionTimedOutEventAttributes;

  /// Provides the details of the `ScheduleLambdaFunctionFailed` event. It isn't
  /// set for other event types.
  final ScheduleLambdaFunctionFailedEventAttributes
      scheduleLambdaFunctionFailedEventAttributes;

  /// Provides the details of the `StartLambdaFunctionFailed` event. It isn't
  /// set for other event types.
  final StartLambdaFunctionFailedEventAttributes
      startLambdaFunctionFailedEventAttributes;

  HistoryEvent({
    @required this.eventTimestamp,
    @required this.eventType,
    @required this.eventId,
    this.workflowExecutionStartedEventAttributes,
    this.workflowExecutionCompletedEventAttributes,
    this.completeWorkflowExecutionFailedEventAttributes,
    this.workflowExecutionFailedEventAttributes,
    this.failWorkflowExecutionFailedEventAttributes,
    this.workflowExecutionTimedOutEventAttributes,
    this.workflowExecutionCanceledEventAttributes,
    this.cancelWorkflowExecutionFailedEventAttributes,
    this.workflowExecutionContinuedAsNewEventAttributes,
    this.continueAsNewWorkflowExecutionFailedEventAttributes,
    this.workflowExecutionTerminatedEventAttributes,
    this.workflowExecutionCancelRequestedEventAttributes,
    this.decisionTaskScheduledEventAttributes,
    this.decisionTaskStartedEventAttributes,
    this.decisionTaskCompletedEventAttributes,
    this.decisionTaskTimedOutEventAttributes,
    this.activityTaskScheduledEventAttributes,
    this.activityTaskStartedEventAttributes,
    this.activityTaskCompletedEventAttributes,
    this.activityTaskFailedEventAttributes,
    this.activityTaskTimedOutEventAttributes,
    this.activityTaskCanceledEventAttributes,
    this.activityTaskCancelRequestedEventAttributes,
    this.workflowExecutionSignaledEventAttributes,
    this.markerRecordedEventAttributes,
    this.recordMarkerFailedEventAttributes,
    this.timerStartedEventAttributes,
    this.timerFiredEventAttributes,
    this.timerCanceledEventAttributes,
    this.startChildWorkflowExecutionInitiatedEventAttributes,
    this.childWorkflowExecutionStartedEventAttributes,
    this.childWorkflowExecutionCompletedEventAttributes,
    this.childWorkflowExecutionFailedEventAttributes,
    this.childWorkflowExecutionTimedOutEventAttributes,
    this.childWorkflowExecutionCanceledEventAttributes,
    this.childWorkflowExecutionTerminatedEventAttributes,
    this.signalExternalWorkflowExecutionInitiatedEventAttributes,
    this.externalWorkflowExecutionSignaledEventAttributes,
    this.signalExternalWorkflowExecutionFailedEventAttributes,
    this.externalWorkflowExecutionCancelRequestedEventAttributes,
    this.requestCancelExternalWorkflowExecutionInitiatedEventAttributes,
    this.requestCancelExternalWorkflowExecutionFailedEventAttributes,
    this.scheduleActivityTaskFailedEventAttributes,
    this.requestCancelActivityTaskFailedEventAttributes,
    this.startTimerFailedEventAttributes,
    this.cancelTimerFailedEventAttributes,
    this.startChildWorkflowExecutionFailedEventAttributes,
    this.lambdaFunctionScheduledEventAttributes,
    this.lambdaFunctionStartedEventAttributes,
    this.lambdaFunctionCompletedEventAttributes,
    this.lambdaFunctionFailedEventAttributes,
    this.lambdaFunctionTimedOutEventAttributes,
    this.scheduleLambdaFunctionFailedEventAttributes,
    this.startLambdaFunctionFailedEventAttributes,
  });
  static HistoryEvent fromJson(Map<String, dynamic> json) => HistoryEvent(
        eventTimestamp: DateTime.parse(json['eventTimestamp']),
        eventType: json['eventType'] as String,
        eventId: BigInt.from(json['eventId']),
        workflowExecutionStartedEventAttributes:
            json.containsKey('workflowExecutionStartedEventAttributes')
                ? WorkflowExecutionStartedEventAttributes.fromJson(
                    json['workflowExecutionStartedEventAttributes'])
                : null,
        workflowExecutionCompletedEventAttributes:
            json.containsKey('workflowExecutionCompletedEventAttributes')
                ? WorkflowExecutionCompletedEventAttributes.fromJson(
                    json['workflowExecutionCompletedEventAttributes'])
                : null,
        completeWorkflowExecutionFailedEventAttributes:
            json.containsKey('completeWorkflowExecutionFailedEventAttributes')
                ? CompleteWorkflowExecutionFailedEventAttributes.fromJson(
                    json['completeWorkflowExecutionFailedEventAttributes'])
                : null,
        workflowExecutionFailedEventAttributes:
            json.containsKey('workflowExecutionFailedEventAttributes')
                ? WorkflowExecutionFailedEventAttributes.fromJson(
                    json['workflowExecutionFailedEventAttributes'])
                : null,
        failWorkflowExecutionFailedEventAttributes:
            json.containsKey('failWorkflowExecutionFailedEventAttributes')
                ? FailWorkflowExecutionFailedEventAttributes.fromJson(
                    json['failWorkflowExecutionFailedEventAttributes'])
                : null,
        workflowExecutionTimedOutEventAttributes:
            json.containsKey('workflowExecutionTimedOutEventAttributes')
                ? WorkflowExecutionTimedOutEventAttributes.fromJson(
                    json['workflowExecutionTimedOutEventAttributes'])
                : null,
        workflowExecutionCanceledEventAttributes:
            json.containsKey('workflowExecutionCanceledEventAttributes')
                ? WorkflowExecutionCanceledEventAttributes.fromJson(
                    json['workflowExecutionCanceledEventAttributes'])
                : null,
        cancelWorkflowExecutionFailedEventAttributes:
            json.containsKey('cancelWorkflowExecutionFailedEventAttributes')
                ? CancelWorkflowExecutionFailedEventAttributes.fromJson(
                    json['cancelWorkflowExecutionFailedEventAttributes'])
                : null,
        workflowExecutionContinuedAsNewEventAttributes:
            json.containsKey('workflowExecutionContinuedAsNewEventAttributes')
                ? WorkflowExecutionContinuedAsNewEventAttributes.fromJson(
                    json['workflowExecutionContinuedAsNewEventAttributes'])
                : null,
        continueAsNewWorkflowExecutionFailedEventAttributes: json.containsKey(
                'continueAsNewWorkflowExecutionFailedEventAttributes')
            ? ContinueAsNewWorkflowExecutionFailedEventAttributes.fromJson(
                json['continueAsNewWorkflowExecutionFailedEventAttributes'])
            : null,
        workflowExecutionTerminatedEventAttributes:
            json.containsKey('workflowExecutionTerminatedEventAttributes')
                ? WorkflowExecutionTerminatedEventAttributes.fromJson(
                    json['workflowExecutionTerminatedEventAttributes'])
                : null,
        workflowExecutionCancelRequestedEventAttributes:
            json.containsKey('workflowExecutionCancelRequestedEventAttributes')
                ? WorkflowExecutionCancelRequestedEventAttributes.fromJson(
                    json['workflowExecutionCancelRequestedEventAttributes'])
                : null,
        decisionTaskScheduledEventAttributes:
            json.containsKey('decisionTaskScheduledEventAttributes')
                ? DecisionTaskScheduledEventAttributes.fromJson(
                    json['decisionTaskScheduledEventAttributes'])
                : null,
        decisionTaskStartedEventAttributes:
            json.containsKey('decisionTaskStartedEventAttributes')
                ? DecisionTaskStartedEventAttributes.fromJson(
                    json['decisionTaskStartedEventAttributes'])
                : null,
        decisionTaskCompletedEventAttributes:
            json.containsKey('decisionTaskCompletedEventAttributes')
                ? DecisionTaskCompletedEventAttributes.fromJson(
                    json['decisionTaskCompletedEventAttributes'])
                : null,
        decisionTaskTimedOutEventAttributes:
            json.containsKey('decisionTaskTimedOutEventAttributes')
                ? DecisionTaskTimedOutEventAttributes.fromJson(
                    json['decisionTaskTimedOutEventAttributes'])
                : null,
        activityTaskScheduledEventAttributes:
            json.containsKey('activityTaskScheduledEventAttributes')
                ? ActivityTaskScheduledEventAttributes.fromJson(
                    json['activityTaskScheduledEventAttributes'])
                : null,
        activityTaskStartedEventAttributes:
            json.containsKey('activityTaskStartedEventAttributes')
                ? ActivityTaskStartedEventAttributes.fromJson(
                    json['activityTaskStartedEventAttributes'])
                : null,
        activityTaskCompletedEventAttributes:
            json.containsKey('activityTaskCompletedEventAttributes')
                ? ActivityTaskCompletedEventAttributes.fromJson(
                    json['activityTaskCompletedEventAttributes'])
                : null,
        activityTaskFailedEventAttributes:
            json.containsKey('activityTaskFailedEventAttributes')
                ? ActivityTaskFailedEventAttributes.fromJson(
                    json['activityTaskFailedEventAttributes'])
                : null,
        activityTaskTimedOutEventAttributes:
            json.containsKey('activityTaskTimedOutEventAttributes')
                ? ActivityTaskTimedOutEventAttributes.fromJson(
                    json['activityTaskTimedOutEventAttributes'])
                : null,
        activityTaskCanceledEventAttributes:
            json.containsKey('activityTaskCanceledEventAttributes')
                ? ActivityTaskCanceledEventAttributes.fromJson(
                    json['activityTaskCanceledEventAttributes'])
                : null,
        activityTaskCancelRequestedEventAttributes:
            json.containsKey('activityTaskCancelRequestedEventAttributes')
                ? ActivityTaskCancelRequestedEventAttributes.fromJson(
                    json['activityTaskCancelRequestedEventAttributes'])
                : null,
        workflowExecutionSignaledEventAttributes:
            json.containsKey('workflowExecutionSignaledEventAttributes')
                ? WorkflowExecutionSignaledEventAttributes.fromJson(
                    json['workflowExecutionSignaledEventAttributes'])
                : null,
        markerRecordedEventAttributes:
            json.containsKey('markerRecordedEventAttributes')
                ? MarkerRecordedEventAttributes.fromJson(
                    json['markerRecordedEventAttributes'])
                : null,
        recordMarkerFailedEventAttributes:
            json.containsKey('recordMarkerFailedEventAttributes')
                ? RecordMarkerFailedEventAttributes.fromJson(
                    json['recordMarkerFailedEventAttributes'])
                : null,
        timerStartedEventAttributes:
            json.containsKey('timerStartedEventAttributes')
                ? TimerStartedEventAttributes.fromJson(
                    json['timerStartedEventAttributes'])
                : null,
        timerFiredEventAttributes: json.containsKey('timerFiredEventAttributes')
            ? TimerFiredEventAttributes.fromJson(
                json['timerFiredEventAttributes'])
            : null,
        timerCanceledEventAttributes:
            json.containsKey('timerCanceledEventAttributes')
                ? TimerCanceledEventAttributes.fromJson(
                    json['timerCanceledEventAttributes'])
                : null,
        startChildWorkflowExecutionInitiatedEventAttributes: json.containsKey(
                'startChildWorkflowExecutionInitiatedEventAttributes')
            ? StartChildWorkflowExecutionInitiatedEventAttributes.fromJson(
                json['startChildWorkflowExecutionInitiatedEventAttributes'])
            : null,
        childWorkflowExecutionStartedEventAttributes:
            json.containsKey('childWorkflowExecutionStartedEventAttributes')
                ? ChildWorkflowExecutionStartedEventAttributes.fromJson(
                    json['childWorkflowExecutionStartedEventAttributes'])
                : null,
        childWorkflowExecutionCompletedEventAttributes:
            json.containsKey('childWorkflowExecutionCompletedEventAttributes')
                ? ChildWorkflowExecutionCompletedEventAttributes.fromJson(
                    json['childWorkflowExecutionCompletedEventAttributes'])
                : null,
        childWorkflowExecutionFailedEventAttributes:
            json.containsKey('childWorkflowExecutionFailedEventAttributes')
                ? ChildWorkflowExecutionFailedEventAttributes.fromJson(
                    json['childWorkflowExecutionFailedEventAttributes'])
                : null,
        childWorkflowExecutionTimedOutEventAttributes:
            json.containsKey('childWorkflowExecutionTimedOutEventAttributes')
                ? ChildWorkflowExecutionTimedOutEventAttributes.fromJson(
                    json['childWorkflowExecutionTimedOutEventAttributes'])
                : null,
        childWorkflowExecutionCanceledEventAttributes:
            json.containsKey('childWorkflowExecutionCanceledEventAttributes')
                ? ChildWorkflowExecutionCanceledEventAttributes.fromJson(
                    json['childWorkflowExecutionCanceledEventAttributes'])
                : null,
        childWorkflowExecutionTerminatedEventAttributes:
            json.containsKey('childWorkflowExecutionTerminatedEventAttributes')
                ? ChildWorkflowExecutionTerminatedEventAttributes.fromJson(
                    json['childWorkflowExecutionTerminatedEventAttributes'])
                : null,
        signalExternalWorkflowExecutionInitiatedEventAttributes: json
                .containsKey(
                    'signalExternalWorkflowExecutionInitiatedEventAttributes')
            ? SignalExternalWorkflowExecutionInitiatedEventAttributes.fromJson(
                json['signalExternalWorkflowExecutionInitiatedEventAttributes'])
            : null,
        externalWorkflowExecutionSignaledEventAttributes:
            json.containsKey('externalWorkflowExecutionSignaledEventAttributes')
                ? ExternalWorkflowExecutionSignaledEventAttributes.fromJson(
                    json['externalWorkflowExecutionSignaledEventAttributes'])
                : null,
        signalExternalWorkflowExecutionFailedEventAttributes: json.containsKey(
                'signalExternalWorkflowExecutionFailedEventAttributes')
            ? SignalExternalWorkflowExecutionFailedEventAttributes.fromJson(
                json['signalExternalWorkflowExecutionFailedEventAttributes'])
            : null,
        externalWorkflowExecutionCancelRequestedEventAttributes: json
                .containsKey(
                    'externalWorkflowExecutionCancelRequestedEventAttributes')
            ? ExternalWorkflowExecutionCancelRequestedEventAttributes.fromJson(
                json['externalWorkflowExecutionCancelRequestedEventAttributes'])
            : null,
        requestCancelExternalWorkflowExecutionInitiatedEventAttributes: json
                .containsKey(
                    'requestCancelExternalWorkflowExecutionInitiatedEventAttributes')
            ? RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
                .fromJson(json[
                    'requestCancelExternalWorkflowExecutionInitiatedEventAttributes'])
            : null,
        requestCancelExternalWorkflowExecutionFailedEventAttributes: json
                .containsKey(
                    'requestCancelExternalWorkflowExecutionFailedEventAttributes')
            ? RequestCancelExternalWorkflowExecutionFailedEventAttributes
                .fromJson(json[
                    'requestCancelExternalWorkflowExecutionFailedEventAttributes'])
            : null,
        scheduleActivityTaskFailedEventAttributes:
            json.containsKey('scheduleActivityTaskFailedEventAttributes')
                ? ScheduleActivityTaskFailedEventAttributes.fromJson(
                    json['scheduleActivityTaskFailedEventAttributes'])
                : null,
        requestCancelActivityTaskFailedEventAttributes:
            json.containsKey('requestCancelActivityTaskFailedEventAttributes')
                ? RequestCancelActivityTaskFailedEventAttributes.fromJson(
                    json['requestCancelActivityTaskFailedEventAttributes'])
                : null,
        startTimerFailedEventAttributes:
            json.containsKey('startTimerFailedEventAttributes')
                ? StartTimerFailedEventAttributes.fromJson(
                    json['startTimerFailedEventAttributes'])
                : null,
        cancelTimerFailedEventAttributes:
            json.containsKey('cancelTimerFailedEventAttributes')
                ? CancelTimerFailedEventAttributes.fromJson(
                    json['cancelTimerFailedEventAttributes'])
                : null,
        startChildWorkflowExecutionFailedEventAttributes:
            json.containsKey('startChildWorkflowExecutionFailedEventAttributes')
                ? StartChildWorkflowExecutionFailedEventAttributes.fromJson(
                    json['startChildWorkflowExecutionFailedEventAttributes'])
                : null,
        lambdaFunctionScheduledEventAttributes:
            json.containsKey('lambdaFunctionScheduledEventAttributes')
                ? LambdaFunctionScheduledEventAttributes.fromJson(
                    json['lambdaFunctionScheduledEventAttributes'])
                : null,
        lambdaFunctionStartedEventAttributes:
            json.containsKey('lambdaFunctionStartedEventAttributes')
                ? LambdaFunctionStartedEventAttributes.fromJson(
                    json['lambdaFunctionStartedEventAttributes'])
                : null,
        lambdaFunctionCompletedEventAttributes:
            json.containsKey('lambdaFunctionCompletedEventAttributes')
                ? LambdaFunctionCompletedEventAttributes.fromJson(
                    json['lambdaFunctionCompletedEventAttributes'])
                : null,
        lambdaFunctionFailedEventAttributes:
            json.containsKey('lambdaFunctionFailedEventAttributes')
                ? LambdaFunctionFailedEventAttributes.fromJson(
                    json['lambdaFunctionFailedEventAttributes'])
                : null,
        lambdaFunctionTimedOutEventAttributes:
            json.containsKey('lambdaFunctionTimedOutEventAttributes')
                ? LambdaFunctionTimedOutEventAttributes.fromJson(
                    json['lambdaFunctionTimedOutEventAttributes'])
                : null,
        scheduleLambdaFunctionFailedEventAttributes:
            json.containsKey('scheduleLambdaFunctionFailedEventAttributes')
                ? ScheduleLambdaFunctionFailedEventAttributes.fromJson(
                    json['scheduleLambdaFunctionFailedEventAttributes'])
                : null,
        startLambdaFunctionFailedEventAttributes:
            json.containsKey('startLambdaFunctionFailedEventAttributes')
                ? StartLambdaFunctionFailedEventAttributes.fromJson(
                    json['startLambdaFunctionFailedEventAttributes'])
                : null,
      );
}

/// Provides the details of the `LambdaFunctionCompleted` event. It isn't set
/// for other event types.
class LambdaFunctionCompletedEventAttributes {
  /// The ID of the `LambdaFunctionScheduled` event that was recorded when this
  /// Lambda task was scheduled. To help diagnose issues, use this information
  /// to trace back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `LambdaFunctionStarted` event recorded when this activity
  /// task started. To help diagnose issues, use this information to trace back
  /// the chain of events leading up to this event.
  final BigInt startedEventId;

  /// The results of the Lambda task.
  final String result;

  LambdaFunctionCompletedEventAttributes({
    @required this.scheduledEventId,
    @required this.startedEventId,
    this.result,
  });
  static LambdaFunctionCompletedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionCompletedEventAttributes(
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
        result: json.containsKey('result') ? json['result'] as String : null,
      );
}

/// Provides the details of the `LambdaFunctionFailed` event. It isn't set for
/// other event types.
class LambdaFunctionFailedEventAttributes {
  /// The ID of the `LambdaFunctionScheduled` event that was recorded when this
  /// activity task was scheduled. To help diagnose issues, use this information
  /// to trace back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `LambdaFunctionStarted` event recorded when this activity
  /// task started. To help diagnose issues, use this information to trace back
  /// the chain of events leading up to this event.
  final BigInt startedEventId;

  /// The reason provided for the failure.
  final String reason;

  /// The details of the failure.
  final String details;

  LambdaFunctionFailedEventAttributes({
    @required this.scheduledEventId,
    @required this.startedEventId,
    this.reason,
    this.details,
  });
  static LambdaFunctionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionFailedEventAttributes(
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
      );
}

/// Provides the details of the `LambdaFunctionScheduled` event. It isn't set
/// for other event types.
class LambdaFunctionScheduledEventAttributes {
  /// The unique ID of the Lambda task.
  final String id;

  /// The name of the Lambda function.
  final String name;

  /// Data attached to the event that the decider can use in subsequent workflow
  /// tasks. This data isn't sent to the Lambda task.
  final String control;

  /// The input provided to the Lambda task.
  final String input;

  /// The maximum amount of time a worker can take to process the Lambda task.
  final String startToCloseTimeout;

  /// The ID of the `LambdaFunctionCompleted` event corresponding to the
  /// decision that resulted in scheduling this activity task. To help diagnose
  /// issues, use this information to trace back the chain of events leading up
  /// to this event.
  final BigInt decisionTaskCompletedEventId;

  LambdaFunctionScheduledEventAttributes({
    @required this.id,
    @required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
    @required this.decisionTaskCompletedEventId,
  });
  static LambdaFunctionScheduledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionScheduledEventAttributes(
        id: json['id'] as String,
        name: json['name'] as String,
        control: json.containsKey('control') ? json['control'] as String : null,
        input: json.containsKey('input') ? json['input'] as String : null,
        startToCloseTimeout: json.containsKey('startToCloseTimeout')
            ? json['startToCloseTimeout'] as String
            : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `LambdaFunctionStarted` event. It isn't set for
/// other event types.
class LambdaFunctionStartedEventAttributes {
  /// The ID of the `LambdaFunctionScheduled` event that was recorded when this
  /// activity task was scheduled. To help diagnose issues, use this information
  /// to trace back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  LambdaFunctionStartedEventAttributes({
    @required this.scheduledEventId,
  });
  static LambdaFunctionStartedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionStartedEventAttributes(
        scheduledEventId: BigInt.from(json['scheduledEventId']),
      );
}

/// Provides details of the `LambdaFunctionTimedOut` event.
class LambdaFunctionTimedOutEventAttributes {
  /// The ID of the `LambdaFunctionScheduled` event that was recorded when this
  /// activity task was scheduled. To help diagnose issues, use this information
  /// to trace back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The ID of the `ActivityTaskStarted` event that was recorded when this
  /// activity task started. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  final BigInt startedEventId;

  /// The type of the timeout that caused this event.
  final String timeoutType;

  LambdaFunctionTimedOutEventAttributes({
    @required this.scheduledEventId,
    @required this.startedEventId,
    this.timeoutType,
  });
  static LambdaFunctionTimedOutEventAttributes fromJson(
          Map<String, dynamic> json) =>
      LambdaFunctionTimedOutEventAttributes(
        scheduledEventId: BigInt.from(json['scheduledEventId']),
        startedEventId: BigInt.from(json['startedEventId']),
        timeoutType: json.containsKey('timeoutType')
            ? json['timeoutType'] as String
            : null,
      );
}

class ListTagsForResourceOutput {
  /// An array of tags associated with the domain.
  final List<ResourceTag> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('tags')
            ? (json['tags'] as List)
                .map((e) => ResourceTag.fromJson(e))
                .toList()
            : null,
      );
}

/// Provides the details of the `MarkerRecorded` event.
class MarkerRecordedEventAttributes {
  /// The name of the marker.
  final String markerName;

  /// The details of the marker.
  final String details;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RecordMarker` decision that requested this
  /// marker. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  MarkerRecordedEventAttributes({
    @required this.markerName,
    this.details,
    @required this.decisionTaskCompletedEventId,
  });
  static MarkerRecordedEventAttributes fromJson(Map<String, dynamic> json) =>
      MarkerRecordedEventAttributes(
        markerName: json['markerName'] as String,
        details: json.containsKey('details') ? json['details'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Contains the count of tasks in a task list.
class PendingTaskCount {
  /// The number of tasks in the task list.
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  final bool truncated;

  PendingTaskCount({
    @required this.count,
    this.truncated,
  });
  static PendingTaskCount fromJson(Map<String, dynamic> json) =>
      PendingTaskCount(
        count: json['count'] as int,
        truncated:
            json.containsKey('truncated') ? json['truncated'] as bool : null,
      );
}

/// Provides the details of the `RecordMarker` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class RecordMarkerDecisionAttributes {
  ///  The name of the marker.
  final String markerName;

  ///  The details of the marker.
  final String details;

  RecordMarkerDecisionAttributes({
    @required this.markerName,
    this.details,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `RecordMarkerFailed` event.
class RecordMarkerFailedEventAttributes {
  /// The marker's name.
  final String markerName;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RecordMarkerFailed` decision for this
  /// cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  RecordMarkerFailedEventAttributes({
    @required this.markerName,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static RecordMarkerFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      RecordMarkerFailedEventAttributes(
        markerName: json['markerName'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `RequestCancelActivityTask` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class RequestCancelActivityTaskDecisionAttributes {
  /// The `activityId` of the activity task to be canceled.
  final String activityId;

  RequestCancelActivityTaskDecisionAttributes({
    @required this.activityId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `RequestCancelActivityTaskFailed` event.
class RequestCancelActivityTaskFailedEventAttributes {
  /// The activityId provided in the `RequestCancelActivityTask` decision that
  /// failed.
  final String activityId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RequestCancelActivityTask` decision for this
  /// cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  RequestCancelActivityTaskFailedEventAttributes({
    @required this.activityId,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static RequestCancelActivityTaskFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      RequestCancelActivityTaskFailedEventAttributes(
        activityId: json['activityId'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `RequestCancelExternalWorkflowExecution`
/// decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class RequestCancelExternalWorkflowExecutionDecisionAttributes {
  ///  The `workflowId` of the external workflow execution to cancel.
  final String workflowId;

  /// The `runId` of the external workflow execution to cancel.
  final String runId;

  /// The data attached to the event that can be used by the decider in
  /// subsequent workflow tasks.
  final String control;

  RequestCancelExternalWorkflowExecutionDecisionAttributes({
    @required this.workflowId,
    this.runId,
    this.control,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `RequestCancelExternalWorkflowExecutionFailed`
/// event.
class RequestCancelExternalWorkflowExecutionFailedEventAttributes {
  /// The `workflowId` of the external workflow to which the cancel request was
  /// to be delivered.
  final String workflowId;

  /// The `runId` of the external workflow execution.
  final String runId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `RequestCancelExternalWorkflowExecutionInitiated` event
  /// corresponding to the `RequestCancelExternalWorkflowExecution` decision to
  /// cancel this external workflow execution. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event.
  final BigInt initiatedEventId;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RequestCancelExternalWorkflowExecution`
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt decisionTaskCompletedEventId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  final String control;

  RequestCancelExternalWorkflowExecutionFailedEventAttributes({
    @required this.workflowId,
    this.runId,
    @required this.cause,
    @required this.initiatedEventId,
    @required this.decisionTaskCompletedEventId,
    this.control,
  });
  static RequestCancelExternalWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      RequestCancelExternalWorkflowExecutionFailedEventAttributes(
        workflowId: json['workflowId'] as String,
        runId: json.containsKey('runId') ? json['runId'] as String : null,
        cause: json['cause'] as String,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        control: json.containsKey('control') ? json['control'] as String : null,
      );
}

/// Provides the details of the
/// `RequestCancelExternalWorkflowExecutionInitiated` event.
class RequestCancelExternalWorkflowExecutionInitiatedEventAttributes {
  /// The `workflowId` of the external workflow execution to be canceled.
  final String workflowId;

  /// The `runId` of the external workflow execution to be canceled.
  final String runId;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `RequestCancelExternalWorkflowExecution`
  /// decision for this cancellation request. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt decisionTaskCompletedEventId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String control;

  RequestCancelExternalWorkflowExecutionInitiatedEventAttributes({
    @required this.workflowId,
    this.runId,
    @required this.decisionTaskCompletedEventId,
    this.control,
  });
  static RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
      fromJson(Map<String, dynamic> json) =>
          RequestCancelExternalWorkflowExecutionInitiatedEventAttributes(
            workflowId: json['workflowId'] as String,
            runId: json.containsKey('runId') ? json['runId'] as String : null,
            decisionTaskCompletedEventId:
                BigInt.from(json['decisionTaskCompletedEventId']),
            control:
                json.containsKey('control') ? json['control'] as String : null,
          );
}

/// Tags are key-value pairs that can be associated with Amazon SWF state
/// machines and activities.
///
/// Tags may only contain unicode letters, digits, whitespace, or these symbols:
/// `_ . : / = + - @`.
class ResourceTag {
  /// The key of a tag.
  final String key;

  /// The value of a tag.
  final String value;

  ResourceTag({
    @required this.key,
    this.value,
  });
  static ResourceTag fromJson(Map<String, dynamic> json) => ResourceTag(
        key: json['key'] as String,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the `runId` of a workflow execution.
class Run {
  /// The `runId` of a workflow execution. This ID is generated by the service
  /// and can be used to uniquely identify the workflow execution within a
  /// domain.
  final String runId;

  Run({
    this.runId,
  });
  static Run fromJson(Map<String, dynamic> json) => Run(
        runId: json.containsKey('runId') ? json['runId'] as String : null,
      );
}

/// Provides the details of the `ScheduleActivityTask` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   Constrain the following parameters by using a `Condition` element with
/// the appropriate keys.
///
///     *    `activityType.name` – String constraint. The key is
/// `swf:activityType.name`.
///
///     *    `activityType.version` – String constraint. The key is
/// `swf:activityType.version`.
///
///     *    `taskList` – String constraint. The key is `swf:taskList.name`.
///
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class ScheduleActivityTaskDecisionAttributes {
  ///  The type of the activity task to schedule.
  final ActivityType activityType;

  ///  The `activityId` of the activity task.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not contain the
  /// literal string `arn`.
  final String activityId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks. This data isn't sent to the activity.
  final String control;

  /// The input provided to the activity task.
  final String input;

  /// The maximum duration for this activity task.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A schedule-to-close timeout for this activity task must be specified
  /// either as a default for the activity type or through this field. If
  /// neither this field is set nor a default schedule-to-close timeout was
  /// specified at registration time then a fault is returned.
  final String scheduleToCloseTimeout;

  /// If set, specifies the name of the task list in which to schedule the
  /// activity task. If not specified, the `defaultTaskList` registered with the
  /// activity type is used.
  ///
  ///  A task list for this activity task must be specified either as a default
  /// for the activity type or through this field. If neither this field is set
  /// nor a default task list was specified at registration time then a fault is
  /// returned.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not contain the
  /// literal string `arn`.
  final TaskList taskList;

  ///  If set, specifies the priority with which the activity task is to be
  /// assigned to a worker. This overrides the defaultTaskPriority specified
  /// when registering the activity type using RegisterActivityType. Valid
  /// values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  ///  If set, specifies the maximum duration the activity task can wait to be
  /// assigned to a worker. This overrides the default schedule-to-start timeout
  /// specified when registering the activity type using RegisterActivityType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A schedule-to-start timeout for this activity task must be specified
  /// either as a default for the activity type or through this field. If
  /// neither this field is set nor a default schedule-to-start timeout was
  /// specified at registration time then a fault is returned.
  final String scheduleToStartTimeout;

  /// If set, specifies the maximum duration a worker may take to process this
  /// activity task. This overrides the default start-to-close timeout specified
  /// when registering the activity type using RegisterActivityType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A start-to-close timeout for this activity task must be specified either
  /// as a default for the activity type or through this field. If neither this
  /// field is set nor a default start-to-close timeout was specified at
  /// registration time then a fault is returned.
  final String startToCloseTimeout;

  /// If set, specifies the maximum time before which a worker processing a task
  /// of this type must report progress by calling RecordActivityTaskHeartbeat.
  /// If the timeout is exceeded, the activity task is automatically timed out.
  /// If the worker subsequently attempts to record a heartbeat or returns a
  /// result, it is ignored. This overrides the default heartbeat timeout
  /// specified when registering the activity type using RegisterActivityType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String heartbeatTimeout;

  ScheduleActivityTaskDecisionAttributes({
    @required this.activityType,
    @required this.activityId,
    this.control,
    this.input,
    this.scheduleToCloseTimeout,
    this.taskList,
    this.taskPriority,
    this.scheduleToStartTimeout,
    this.startToCloseTimeout,
    this.heartbeatTimeout,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `ScheduleActivityTaskFailed` event.
class ScheduleActivityTaskFailedEventAttributes {
  /// The activity type provided in the `ScheduleActivityTask` decision that
  /// failed.
  final ActivityType activityType;

  /// The activityId provided in the `ScheduleActivityTask` decision that
  /// failed.
  final String activityId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// that resulted in the scheduling of this activity task. This information
  /// can be useful for diagnosing problems by tracing back the chain of events
  /// leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  ScheduleActivityTaskFailedEventAttributes({
    @required this.activityType,
    @required this.activityId,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static ScheduleActivityTaskFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ScheduleActivityTaskFailedEventAttributes(
        activityType: ActivityType.fromJson(json['activityType']),
        activityId: json['activityId'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Decision attributes specified in `scheduleLambdaFunctionDecisionAttributes`
/// within the list of decisions `decisions` passed to
/// RespondDecisionTaskCompleted.
class ScheduleLambdaFunctionDecisionAttributes {
  /// A string that identifies the Lambda function execution in the event
  /// history.
  final String id;

  /// The name, or ARN, of the Lambda function to schedule.
  final String name;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the Lambda task.
  final String control;

  /// The optional input data to be supplied to the Lambda function.
  final String input;

  /// The timeout value, in seconds, after which the Lambda function is
  /// considered to be failed once it has started. This can be any integer from
  /// 1-300 (1s-5m). If no value is supplied, than a default value of 300s is
  /// assumed.
  final String startToCloseTimeout;

  ScheduleLambdaFunctionDecisionAttributes({
    @required this.id,
    @required this.name,
    this.control,
    this.input,
    this.startToCloseTimeout,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `ScheduleLambdaFunctionFailed` event. It isn't
/// set for other event types.
class ScheduleLambdaFunctionFailedEventAttributes {
  /// The ID provided in the `ScheduleLambdaFunction` decision that failed.
  final String id;

  /// The name of the Lambda function.
  final String name;

  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `LambdaFunctionCompleted` event corresponding to the
  /// decision that resulted in scheduling this Lambda task. To help diagnose
  /// issues, use this information to trace back the chain of events leading up
  /// to this event.
  final BigInt decisionTaskCompletedEventId;

  ScheduleLambdaFunctionFailedEventAttributes({
    @required this.id,
    @required this.name,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static ScheduleLambdaFunctionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      ScheduleLambdaFunctionFailedEventAttributes(
        id: json['id'] as String,
        name: json['name'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `SignalExternalWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class SignalExternalWorkflowExecutionDecisionAttributes {
  ///  The `workflowId` of the workflow execution to be signaled.
  final String workflowId;

  /// The `runId` of the workflow execution to be signaled.
  final String runId;

  ///  The name of the signal.The target workflow execution uses the signal name
  /// and input to process the signal.
  final String signalName;

  ///  The input data to be provided with the signal. The target workflow
  /// execution uses the signal name and input data to process the signal.
  final String input;

  /// The data attached to the event that can be used by the decider in
  /// subsequent decision tasks.
  final String control;

  SignalExternalWorkflowExecutionDecisionAttributes({
    @required this.workflowId,
    this.runId,
    @required this.signalName,
    this.input,
    this.control,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `SignalExternalWorkflowExecutionFailed` event.
class SignalExternalWorkflowExecutionFailedEventAttributes {
  /// The `workflowId` of the external workflow execution that the signal was
  /// being delivered to.
  final String workflowId;

  /// The `runId` of the external workflow execution that the signal was being
  /// delivered to.
  final String runId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `SignalExternalWorkflowExecutionInitiated` event
  /// corresponding to the `SignalExternalWorkflowExecution` decision to request
  /// this signal. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt initiatedEventId;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `SignalExternalWorkflowExecution` decision for
  /// this signal. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the workflow execution.
  final String control;

  SignalExternalWorkflowExecutionFailedEventAttributes({
    @required this.workflowId,
    this.runId,
    @required this.cause,
    @required this.initiatedEventId,
    @required this.decisionTaskCompletedEventId,
    this.control,
  });
  static SignalExternalWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      SignalExternalWorkflowExecutionFailedEventAttributes(
        workflowId: json['workflowId'] as String,
        runId: json.containsKey('runId') ? json['runId'] as String : null,
        cause: json['cause'] as String,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        control: json.containsKey('control') ? json['control'] as String : null,
      );
}

/// Provides the details of the `SignalExternalWorkflowExecutionInitiated`
/// event.
class SignalExternalWorkflowExecutionInitiatedEventAttributes {
  /// The `workflowId` of the external workflow execution.
  final String workflowId;

  /// The `runId` of the external workflow execution to send the signal to.
  final String runId;

  /// The name of the signal.
  final String signalName;

  /// The input provided to the signal.
  final String input;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `SignalExternalWorkflowExecution` decision for
  /// this signal. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks.
  final String control;

  SignalExternalWorkflowExecutionInitiatedEventAttributes({
    @required this.workflowId,
    this.runId,
    @required this.signalName,
    this.input,
    @required this.decisionTaskCompletedEventId,
    this.control,
  });
  static SignalExternalWorkflowExecutionInitiatedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      SignalExternalWorkflowExecutionInitiatedEventAttributes(
        workflowId: json['workflowId'] as String,
        runId: json.containsKey('runId') ? json['runId'] as String : null,
        signalName: json['signalName'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        control: json.containsKey('control') ? json['control'] as String : null,
      );
}

/// Provides the details of the `StartChildWorkflowExecution` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   Constrain the following parameters by using a `Condition` element with
/// the appropriate keys.
///
///     *    `tagList.member.N` – The key is "swf:tagList.N" where N is the tag
/// number from 0 to 4, inclusive.
///
///     *    `taskList` – String constraint. The key is `swf:taskList.name`.
///
///     *    `workflowType.name` – String constraint. The key is
/// `swf:workflowType.name`.
///
///     *    `workflowType.version` – String constraint. The key is
/// `swf:workflowType.version`.
///
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class StartChildWorkflowExecutionDecisionAttributes {
  ///  The type of the workflow execution to be started.
  final WorkflowType workflowType;

  ///  The `workflowId` of the workflow execution.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not contain the
  /// literal string `arn`.
  final String workflowId;

  /// The data attached to the event that can be used by the decider in
  /// subsequent workflow tasks. This data isn't sent to the child workflow
  /// execution.
  final String control;

  /// The input to be provided to the workflow execution.
  final String input;

  /// The total duration for this workflow execution. This overrides the
  /// defaultExecutionStartToCloseTimeout specified when registering the
  /// workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// An execution start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default execution
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  final String executionStartToCloseTimeout;

  /// The name of the task list to be used for decision tasks of the child
  /// workflow execution.
  ///
  ///  A task list for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default task list was specified at registration
  /// time then a fault is returned.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not contain the
  /// literal string `arn`.
  final TaskList taskList;

  ///  A task priority that, if set, specifies the priority for a decision task
  /// of this workflow execution. This overrides the defaultTaskPriority
  /// specified when registering the workflow type. Valid values are integers
  /// that range from Java's `Integer.MIN_VALUE` (-2147483648) to
  /// `Integer.MAX_VALUE` (2147483647). Higher numbers indicate higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// Specifies the maximum duration of decision tasks for this workflow
  /// execution. This parameter overrides the `defaultTaskStartToCloseTimout`
  /// specified when registering the workflow type using RegisterWorkflowType.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  ///
  ///
  ///
  /// A task start-to-close timeout for this workflow execution must be
  /// specified either as a default for the workflow type or through this
  /// parameter. If neither this parameter is set nor a default task
  /// start-to-close timeout was specified at registration time then a fault is
  /// returned.
  final String taskStartToCloseTimeout;

  ///  If set, specifies the policy to use for the child workflow executions if
  /// the workflow execution being started is terminated by calling the
  /// TerminateWorkflowExecution action explicitly or due to an expired timeout.
  /// This policy overrides the default child policy specified when registering
  /// the workflow type using RegisterWorkflowType.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  ///
  ///
  ///
  ///
  /// A child policy for this workflow execution must be specified either as a
  /// default for the workflow type or through this parameter. If neither this
  /// parameter is set nor a default child policy was specified at registration
  /// time then a fault is returned.
  final String childPolicy;

  /// The list of tags to associate with the child workflow execution. A maximum
  /// of 5 tags can be specified. You can list workflow executions with a
  /// specific tag by calling ListOpenWorkflowExecutions or
  /// ListClosedWorkflowExecutions and specifying a TagFilter.
  final List<String> tagList;

  /// The IAM role attached to the child workflow execution.
  final String lambdaRole;

  StartChildWorkflowExecutionDecisionAttributes({
    @required this.workflowType,
    @required this.workflowId,
    this.control,
    this.input,
    this.executionStartToCloseTimeout,
    this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
    this.childPolicy,
    this.tagList,
    this.lambdaRole,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `StartChildWorkflowExecutionFailed` event.
class StartChildWorkflowExecutionFailedEventAttributes {
  /// The workflow type provided in the `StartChildWorkflowExecution` Decision
  /// that failed.
  final WorkflowType workflowType;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// When `cause` is set to `OPERATION_NOT_PERMITTED`, the decision fails
  /// because it lacks sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The `workflowId` of the child workflow execution.
  final String workflowId;

  /// When the `cause` is `WORKFLOW_ALREADY_RUNNING`, `initiatedEventId` is the
  /// ID of the `StartChildWorkflowExecutionInitiated` event that corresponds to
  /// the `StartChildWorkflowExecution` Decision to start the workflow
  /// execution. You can use this information to diagnose problems by tracing
  /// back the chain of events leading up to this event.
  ///
  /// When the `cause` isn't `WORKFLOW_ALREADY_RUNNING`, `initiatedEventId` is
  /// set to `0` because the `StartChildWorkflowExecutionInitiated` event
  /// doesn't exist.
  final BigInt initiatedEventId;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `StartChildWorkflowExecution` Decision to
  /// request this child workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events.
  final BigInt decisionTaskCompletedEventId;

  /// The data attached to the event that the decider can use in subsequent
  /// workflow tasks. This data isn't sent to the child workflow execution.
  final String control;

  StartChildWorkflowExecutionFailedEventAttributes({
    @required this.workflowType,
    @required this.cause,
    @required this.workflowId,
    @required this.initiatedEventId,
    @required this.decisionTaskCompletedEventId,
    this.control,
  });
  static StartChildWorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      StartChildWorkflowExecutionFailedEventAttributes(
        workflowType: WorkflowType.fromJson(json['workflowType']),
        cause: json['cause'] as String,
        workflowId: json['workflowId'] as String,
        initiatedEventId: BigInt.from(json['initiatedEventId']),
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        control: json.containsKey('control') ? json['control'] as String : null,
      );
}

/// Provides the details of the `StartChildWorkflowExecutionInitiated` event.
class StartChildWorkflowExecutionInitiatedEventAttributes {
  /// The `workflowId` of the child workflow execution.
  final String workflowId;

  /// The type of the child workflow execution.
  final WorkflowType workflowType;

  /// Data attached to the event that can be used by the decider in subsequent
  /// decision tasks. This data isn't sent to the activity.
  final String control;

  /// The inputs provided to the child workflow execution.
  final String input;

  /// The maximum duration for the child workflow execution. If the workflow
  /// execution isn't closed within this duration, it is timed out and
  /// force-terminated.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String executionStartToCloseTimeout;

  /// The name of the task list used for the decision tasks of the child
  /// workflow execution.
  final TaskList taskList;

  ///  The priority assigned for the decision tasks for this workflow execution.
  /// Valid values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `StartChildWorkflowExecution` Decision to
  /// request this child workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the cause of events.
  final BigInt decisionTaskCompletedEventId;

  /// The policy to use for the child workflow executions if this execution gets
  /// terminated by explicitly calling the TerminateWorkflowExecution action or
  /// due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  /// The maximum duration allowed for the decision tasks for this workflow
  /// execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String taskStartToCloseTimeout;

  /// The list of tags to associated with the child workflow execution.
  final List<String> tagList;

  /// The IAM role to attach to the child workflow execution.
  final String lambdaRole;

  StartChildWorkflowExecutionInitiatedEventAttributes({
    @required this.workflowId,
    @required this.workflowType,
    this.control,
    this.input,
    this.executionStartToCloseTimeout,
    @required this.taskList,
    this.taskPriority,
    @required this.decisionTaskCompletedEventId,
    @required this.childPolicy,
    this.taskStartToCloseTimeout,
    this.tagList,
    this.lambdaRole,
  });
  static StartChildWorkflowExecutionInitiatedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      StartChildWorkflowExecutionInitiatedEventAttributes(
        workflowId: json['workflowId'] as String,
        workflowType: WorkflowType.fromJson(json['workflowType']),
        control: json.containsKey('control') ? json['control'] as String : null,
        input: json.containsKey('input') ? json['input'] as String : null,
        executionStartToCloseTimeout:
            json.containsKey('executionStartToCloseTimeout')
                ? json['executionStartToCloseTimeout'] as String
                : null,
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        childPolicy: json['childPolicy'] as String,
        taskStartToCloseTimeout: json.containsKey('taskStartToCloseTimeout')
            ? json['taskStartToCloseTimeout'] as String
            : null,
        tagList: json.containsKey('tagList')
            ? (json['tagList'] as List).map((e) => e as String).toList()
            : null,
        lambdaRole: json.containsKey('lambdaRole')
            ? json['lambdaRole'] as String
            : null,
      );
}

/// Provides the details of the `StartLambdaFunctionFailed` event. It isn't set
/// for other event types.
class StartLambdaFunctionFailedEventAttributes {
  /// The ID of the `ActivityTaskScheduled` event that was recorded when this
  /// activity task was scheduled. To help diagnose issues, use this information
  /// to trace back the chain of events leading up to this event.
  final BigInt scheduledEventId;

  /// The cause of the failure. To help diagnose issues, use this information to
  /// trace back the chain of events leading up to this event.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because the IAM role attached to the execution lacked sufficient
  /// permissions. For details and example IAM policies, see
  /// [Lambda Tasks](https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// A description that can help diagnose the cause of the fault.
  final String message;

  StartLambdaFunctionFailedEventAttributes({
    this.scheduledEventId,
    this.cause,
    this.message,
  });
  static StartLambdaFunctionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      StartLambdaFunctionFailedEventAttributes(
        scheduledEventId: json.containsKey('scheduledEventId')
            ? BigInt.from(json['scheduledEventId'])
            : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// Provides the details of the `StartTimer` decision.
///
///  **Access Control**
///
/// You can use IAM policies to control this decision's access to Amazon SWF
/// resources as follows:
///
/// *   Use a `Resource` element with the domain name to limit the action to
/// only specified domains.
///
/// *   Use an `Action` element to allow or deny permission to call this action.
///
/// *   You cannot use an IAM policy to constrain this action's parameters.
///
///
/// If the caller doesn't have sufficient permissions to invoke the action, or
/// the parameter values fall outside the specified constraints, the action
/// fails. The associated event attribute's `cause` parameter is set to
/// `OPERATION_NOT_PERMITTED`. For details and example IAM policies, see
/// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
/// in the _Amazon SWF Developer Guide_.
class StartTimerDecisionAttributes {
  ///  The unique ID of the timer.
  ///
  /// The specified string must not start or end with whitespace. It must not
  /// contain a `:` (colon), `/` (slash), `|` (vertical bar), or any control
  /// characters (`u0000-u001f` | `u007f-u009f`). Also, it must not contain the
  /// literal string `arn`.
  final String timerId;

  /// The data attached to the event that can be used by the decider in
  /// subsequent workflow tasks.
  final String control;

  ///  The duration to wait before firing the timer.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`.
  final String startToFireTimeout;

  StartTimerDecisionAttributes({
    @required this.timerId,
    this.control,
    @required this.startToFireTimeout,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `StartTimerFailed` event.
class StartTimerFailedEventAttributes {
  /// The timerId provided in the `StartTimer` decision that failed.
  final String timerId;

  /// The cause of the failure. This information is generated by the system and
  /// can be useful for diagnostic purposes.
  ///
  ///
  ///
  /// If `cause` is set to `OPERATION_NOT_PERMITTED`, the decision failed
  /// because it lacked sufficient permissions. For details and example IAM
  /// policies, see
  /// [Using IAM to Manage Access to Amazon SWF Workflows](https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html)
  /// in the _Amazon SWF Developer Guide_.
  final String cause;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `StartTimer` decision for this activity task.
  /// This information can be useful for diagnosing problems by tracing back the
  /// chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  StartTimerFailedEventAttributes({
    @required this.timerId,
    @required this.cause,
    @required this.decisionTaskCompletedEventId,
  });
  static StartTimerFailedEventAttributes fromJson(Map<String, dynamic> json) =>
      StartTimerFailedEventAttributes(
        timerId: json['timerId'] as String,
        cause: json['cause'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Used to filter the workflow executions in visibility APIs based on a tag.
class TagFilter {
  ///  Specifies the tag that must be associated with the execution for it to
  /// meet the filter criteria.
  ///
  /// Tags may only contain unicode letters, digits, whitespace, or these
  /// symbols: `_ . : / = + - @`.
  final String tag;

  TagFilter({
    @required this.tag,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a task list.
class TaskList {
  /// The name of the task list.
  final String name;

  TaskList({
    @required this.name,
  });
  static TaskList fromJson(Map<String, dynamic> json) => TaskList(
        name: json['name'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

///  Provides the details of the `TimerCanceled` event.
class TimerCanceledEventAttributes {
  /// The unique ID of the timer that was canceled.
  final String timerId;

  /// The ID of the `TimerStarted` event that was recorded when this timer was
  /// started. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  final BigInt startedEventId;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CancelTimer` decision to cancel this timer.
  /// This information can be useful for diagnosing problems by tracing back the
  /// chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  TimerCanceledEventAttributes({
    @required this.timerId,
    @required this.startedEventId,
    @required this.decisionTaskCompletedEventId,
  });
  static TimerCanceledEventAttributes fromJson(Map<String, dynamic> json) =>
      TimerCanceledEventAttributes(
        timerId: json['timerId'] as String,
        startedEventId: BigInt.from(json['startedEventId']),
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `TimerFired` event.
class TimerFiredEventAttributes {
  /// The unique ID of the timer that fired.
  final String timerId;

  /// The ID of the `TimerStarted` event that was recorded when this timer was
  /// started. This information can be useful for diagnosing problems by tracing
  /// back the chain of events leading up to this event.
  final BigInt startedEventId;

  TimerFiredEventAttributes({
    @required this.timerId,
    @required this.startedEventId,
  });
  static TimerFiredEventAttributes fromJson(Map<String, dynamic> json) =>
      TimerFiredEventAttributes(
        timerId: json['timerId'] as String,
        startedEventId: BigInt.from(json['startedEventId']),
      );
}

/// Provides the details of the `TimerStarted` event.
class TimerStartedEventAttributes {
  /// The unique ID of the timer that was started.
  final String timerId;

  /// Data attached to the event that can be used by the decider in subsequent
  /// workflow tasks.
  final String control;

  /// The duration of time after which the timer fires.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`.
  final String startToFireTimeout;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `StartTimer` decision for this activity task.
  /// This information can be useful for diagnosing problems by tracing back the
  /// chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  TimerStartedEventAttributes({
    @required this.timerId,
    this.control,
    @required this.startToFireTimeout,
    @required this.decisionTaskCompletedEventId,
  });
  static TimerStartedEventAttributes fromJson(Map<String, dynamic> json) =>
      TimerStartedEventAttributes(
        timerId: json['timerId'] as String,
        control: json.containsKey('control') ? json['control'] as String : null,
        startToFireTimeout: json['startToFireTimeout'] as String,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Represents a workflow execution.
class WorkflowExecution {
  /// The user defined identifier associated with the workflow execution.
  final String workflowId;

  /// A system-generated unique identifier for the workflow execution.
  final String runId;

  WorkflowExecution({
    @required this.workflowId,
    @required this.runId,
  });
  static WorkflowExecution fromJson(Map<String, dynamic> json) =>
      WorkflowExecution(
        workflowId: json['workflowId'] as String,
        runId: json['runId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides the details of the `WorkflowExecutionCancelRequested` event.
class WorkflowExecutionCancelRequestedEventAttributes {
  /// The external workflow execution for which the cancellation was requested.
  final WorkflowExecution externalWorkflowExecution;

  /// The ID of the `RequestCancelExternalWorkflowExecutionInitiated` event
  /// corresponding to the `RequestCancelExternalWorkflowExecution` decision to
  /// cancel this workflow execution.The source event with this ID can be found
  /// in the history of the source workflow execution. This information can be
  /// useful for diagnosing problems by tracing back the chain of events leading
  /// up to this event.
  final BigInt externalInitiatedEventId;

  /// If set, indicates that the request to cancel the workflow execution was
  /// automatically generated, and specifies the cause. This happens if the
  /// parent workflow execution times out or is terminated, and the child policy
  /// is set to cancel child executions.
  final String cause;

  WorkflowExecutionCancelRequestedEventAttributes({
    this.externalWorkflowExecution,
    this.externalInitiatedEventId,
    this.cause,
  });
  static WorkflowExecutionCancelRequestedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionCancelRequestedEventAttributes(
        externalWorkflowExecution: json.containsKey('externalWorkflowExecution')
            ? WorkflowExecution.fromJson(json['externalWorkflowExecution'])
            : null,
        externalInitiatedEventId: json.containsKey('externalInitiatedEventId')
            ? BigInt.from(json['externalInitiatedEventId'])
            : null,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Provides the details of the `WorkflowExecutionCanceled` event.
class WorkflowExecutionCanceledEventAttributes {
  /// The details of the cancellation.
  final String details;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CancelWorkflowExecution` decision for this
  /// cancellation request. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  WorkflowExecutionCanceledEventAttributes({
    this.details,
    @required this.decisionTaskCompletedEventId,
  });
  static WorkflowExecutionCanceledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionCanceledEventAttributes(
        details: json.containsKey('details') ? json['details'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Provides the details of the `WorkflowExecutionCompleted` event.
class WorkflowExecutionCompletedEventAttributes {
  /// The result produced by the workflow execution upon successful completion.
  final String result;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `CompleteWorkflowExecution` decision to complete
  /// this execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  WorkflowExecutionCompletedEventAttributes({
    this.result,
    @required this.decisionTaskCompletedEventId,
  });
  static WorkflowExecutionCompletedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionCompletedEventAttributes(
        result: json.containsKey('result') ? json['result'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// The configuration settings for a workflow execution including timeout
/// values, tasklist etc. These configuration settings are determined from the
/// defaults specified when registering the workflow type and those specified
/// when starting the workflow execution.
class WorkflowExecutionConfiguration {
  /// The maximum duration allowed for decision tasks for this workflow
  /// execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String taskStartToCloseTimeout;

  /// The total duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String executionStartToCloseTimeout;

  /// The task list used for the decision tasks generated for this workflow
  /// execution.
  final TaskList taskList;

  /// The priority assigned to decision tasks for this workflow execution. Valid
  /// values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String taskPriority;

  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the TerminateWorkflowExecution action
  /// explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  /// The IAM role attached to the child workflow execution.
  final String lambdaRole;

  WorkflowExecutionConfiguration({
    @required this.taskStartToCloseTimeout,
    @required this.executionStartToCloseTimeout,
    @required this.taskList,
    this.taskPriority,
    @required this.childPolicy,
    this.lambdaRole,
  });
  static WorkflowExecutionConfiguration fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionConfiguration(
        taskStartToCloseTimeout: json['taskStartToCloseTimeout'] as String,
        executionStartToCloseTimeout:
            json['executionStartToCloseTimeout'] as String,
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        childPolicy: json['childPolicy'] as String,
        lambdaRole: json.containsKey('lambdaRole')
            ? json['lambdaRole'] as String
            : null,
      );
}

/// Provides the details of the `WorkflowExecutionContinuedAsNew` event.
class WorkflowExecutionContinuedAsNewEventAttributes {
  /// The input provided to the new workflow execution.
  final String input;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `ContinueAsNewWorkflowExecution` decision that
  /// started this execution. This information can be useful for diagnosing
  /// problems by tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  /// The `runId` of the new workflow execution.
  final String newExecutionRunId;

  /// The total duration allowed for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String executionStartToCloseTimeout;

  /// The task list to use for the decisions of the new (continued) workflow
  /// execution.
  final TaskList taskList;

  /// The priority of the task to use for the decisions of the new (continued)
  /// workflow execution.
  final String taskPriority;

  /// The maximum duration of decision tasks for the new workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String taskStartToCloseTimeout;

  /// The policy to use for the child workflow executions of the new execution
  /// if it is terminated by calling the TerminateWorkflowExecution action
  /// explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  /// The list of tags associated with the new workflow execution.
  final List<String> tagList;

  /// The workflow type of this execution.
  final WorkflowType workflowType;

  /// The IAM role to attach to the new (continued) workflow execution.
  final String lambdaRole;

  WorkflowExecutionContinuedAsNewEventAttributes({
    this.input,
    @required this.decisionTaskCompletedEventId,
    @required this.newExecutionRunId,
    this.executionStartToCloseTimeout,
    @required this.taskList,
    this.taskPriority,
    this.taskStartToCloseTimeout,
    @required this.childPolicy,
    this.tagList,
    @required this.workflowType,
    this.lambdaRole,
  });
  static WorkflowExecutionContinuedAsNewEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionContinuedAsNewEventAttributes(
        input: json.containsKey('input') ? json['input'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
        newExecutionRunId: json['newExecutionRunId'] as String,
        executionStartToCloseTimeout:
            json.containsKey('executionStartToCloseTimeout')
                ? json['executionStartToCloseTimeout'] as String
                : null,
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        taskStartToCloseTimeout: json.containsKey('taskStartToCloseTimeout')
            ? json['taskStartToCloseTimeout'] as String
            : null,
        childPolicy: json['childPolicy'] as String,
        tagList: json.containsKey('tagList')
            ? (json['tagList'] as List).map((e) => e as String).toList()
            : null,
        workflowType: WorkflowType.fromJson(json['workflowType']),
        lambdaRole: json.containsKey('lambdaRole')
            ? json['lambdaRole'] as String
            : null,
      );
}

/// Contains the count of workflow executions returned from
/// CountOpenWorkflowExecutions or CountClosedWorkflowExecutions
class WorkflowExecutionCount {
  /// The number of workflow executions.
  final int count;

  /// If set to true, indicates that the actual count was more than the maximum
  /// supported by this API and the count returned is the truncated value.
  final bool truncated;

  WorkflowExecutionCount({
    @required this.count,
    this.truncated,
  });
  static WorkflowExecutionCount fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionCount(
        count: json['count'] as int,
        truncated:
            json.containsKey('truncated') ? json['truncated'] as bool : null,
      );
}

/// Contains details about a workflow execution.
class WorkflowExecutionDetail {
  /// Information about the workflow execution.
  final WorkflowExecutionInfo executionInfo;

  /// The configuration settings for this workflow execution including timeout
  /// values, tasklist etc.
  final WorkflowExecutionConfiguration executionConfiguration;

  /// The number of tasks for this workflow execution. This includes open and
  /// closed tasks of all types.
  final WorkflowExecutionOpenCounts openCounts;

  /// The time when the last activity task was scheduled for this workflow
  /// execution. You can use this information to determine if the workflow has
  /// not made progress for an unusually long period of time and might require a
  /// corrective action.
  final DateTime latestActivityTaskTimestamp;

  /// The latest executionContext provided by the decider for this workflow
  /// execution. A decider can provide an executionContext (a free-form string)
  /// when closing a decision task using RespondDecisionTaskCompleted.
  final String latestExecutionContext;

  WorkflowExecutionDetail({
    @required this.executionInfo,
    @required this.executionConfiguration,
    @required this.openCounts,
    this.latestActivityTaskTimestamp,
    this.latestExecutionContext,
  });
  static WorkflowExecutionDetail fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionDetail(
        executionInfo: WorkflowExecutionInfo.fromJson(json['executionInfo']),
        executionConfiguration: WorkflowExecutionConfiguration.fromJson(
            json['executionConfiguration']),
        openCounts: WorkflowExecutionOpenCounts.fromJson(json['openCounts']),
        latestActivityTaskTimestamp:
            json.containsKey('latestActivityTaskTimestamp')
                ? DateTime.parse(json['latestActivityTaskTimestamp'])
                : null,
        latestExecutionContext: json.containsKey('latestExecutionContext')
            ? json['latestExecutionContext'] as String
            : null,
      );
}

/// Provides the details of the `WorkflowExecutionFailed` event.
class WorkflowExecutionFailedEventAttributes {
  /// The descriptive reason provided for the failure.
  final String reason;

  /// The details of the failure.
  final String details;

  /// The ID of the `DecisionTaskCompleted` event corresponding to the decision
  /// task that resulted in the `FailWorkflowExecution` decision to fail this
  /// execution. This information can be useful for diagnosing problems by
  /// tracing back the chain of events leading up to this event.
  final BigInt decisionTaskCompletedEventId;

  WorkflowExecutionFailedEventAttributes({
    this.reason,
    this.details,
    @required this.decisionTaskCompletedEventId,
  });
  static WorkflowExecutionFailedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionFailedEventAttributes(
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
        decisionTaskCompletedEventId:
            BigInt.from(json['decisionTaskCompletedEventId']),
      );
}

/// Used to filter the workflow executions in visibility APIs by their
/// `workflowId`.
class WorkflowExecutionFilter {
  /// The workflowId to pass of match the criteria of this filter.
  final String workflowId;

  WorkflowExecutionFilter({
    @required this.workflowId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about a workflow execution.
class WorkflowExecutionInfo {
  /// The workflow execution this information is about.
  final WorkflowExecution execution;

  /// The type of the workflow execution.
  final WorkflowType workflowType;

  /// The time when the execution was started.
  final DateTime startTimestamp;

  /// The time when the workflow execution was closed. Set only if the execution
  /// status is CLOSED.
  final DateTime closeTimestamp;

  /// The current status of the execution.
  final String executionStatus;

  /// If the execution status is closed then this specifies how the execution
  /// was closed:
  ///
  /// *    `COMPLETED` – the execution was successfully completed.
  ///
  /// *    `CANCELED` – the execution was canceled.Cancellation allows the
  /// implementation to gracefully clean up before the execution is closed.
  ///
  /// *    `TERMINATED` – the execution was force terminated.
  ///
  /// *    `FAILED` – the execution failed to complete.
  ///
  /// *    `TIMED_OUT` – the execution did not complete in the alloted time and
  /// was automatically timed out.
  ///
  /// *    `CONTINUED_AS_NEW` – the execution is logically continued. This means
  /// the current execution was completed and a new execution was started to
  /// carry on the workflow.
  final String closeStatus;

  /// If this workflow execution is a child of another execution then contains
  /// the workflow execution that started this execution.
  final WorkflowExecution parent;

  /// The list of tags associated with the workflow execution. Tags can be used
  /// to identify and list workflow executions of interest through the
  /// visibility APIs. A workflow execution can have a maximum of 5 tags.
  final List<String> tagList;

  /// Set to true if a cancellation is requested for this workflow execution.
  final bool cancelRequested;

  WorkflowExecutionInfo({
    @required this.execution,
    @required this.workflowType,
    @required this.startTimestamp,
    this.closeTimestamp,
    @required this.executionStatus,
    this.closeStatus,
    this.parent,
    this.tagList,
    this.cancelRequested,
  });
  static WorkflowExecutionInfo fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionInfo(
        execution: WorkflowExecution.fromJson(json['execution']),
        workflowType: WorkflowType.fromJson(json['workflowType']),
        startTimestamp: DateTime.parse(json['startTimestamp']),
        closeTimestamp: json.containsKey('closeTimestamp')
            ? DateTime.parse(json['closeTimestamp'])
            : null,
        executionStatus: json['executionStatus'] as String,
        closeStatus: json.containsKey('closeStatus')
            ? json['closeStatus'] as String
            : null,
        parent: json.containsKey('parent')
            ? WorkflowExecution.fromJson(json['parent'])
            : null,
        tagList: json.containsKey('tagList')
            ? (json['tagList'] as List).map((e) => e as String).toList()
            : null,
        cancelRequested: json.containsKey('cancelRequested')
            ? json['cancelRequested'] as bool
            : null,
      );
}

/// Contains a paginated list of information about workflow executions.
class WorkflowExecutionInfos {
  /// The list of workflow information structures.
  final List<WorkflowExecutionInfo> executionInfos;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  WorkflowExecutionInfos({
    @required this.executionInfos,
    this.nextPageToken,
  });
  static WorkflowExecutionInfos fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionInfos(
        executionInfos: (json['executionInfos'] as List)
            .map((e) => WorkflowExecutionInfo.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
      );
}

/// Contains the counts of open tasks, child workflow executions and timers for
/// a workflow execution.
class WorkflowExecutionOpenCounts {
  /// The count of activity tasks whose status is `OPEN`.
  final int openActivityTasks;

  /// The count of decision tasks whose status is OPEN. A workflow execution can
  /// have at most one open decision task.
  final int openDecisionTasks;

  /// The count of timers started by this workflow execution that have not fired
  /// yet.
  final int openTimers;

  /// The count of child workflow executions whose status is `OPEN`.
  final int openChildWorkflowExecutions;

  /// The count of Lambda tasks whose status is `OPEN`.
  final int openLambdaFunctions;

  WorkflowExecutionOpenCounts({
    @required this.openActivityTasks,
    @required this.openDecisionTasks,
    @required this.openTimers,
    @required this.openChildWorkflowExecutions,
    this.openLambdaFunctions,
  });
  static WorkflowExecutionOpenCounts fromJson(Map<String, dynamic> json) =>
      WorkflowExecutionOpenCounts(
        openActivityTasks: json['openActivityTasks'] as int,
        openDecisionTasks: json['openDecisionTasks'] as int,
        openTimers: json['openTimers'] as int,
        openChildWorkflowExecutions: json['openChildWorkflowExecutions'] as int,
        openLambdaFunctions: json.containsKey('openLambdaFunctions')
            ? json['openLambdaFunctions'] as int
            : null,
      );
}

/// Provides the details of the `WorkflowExecutionSignaled` event.
class WorkflowExecutionSignaledEventAttributes {
  /// The name of the signal received. The decider can use the signal name and
  /// inputs to determine how to the process the signal.
  final String signalName;

  /// The inputs provided with the signal. The decider can use the signal name
  /// and inputs to determine how to process the signal.
  final String input;

  /// The workflow execution that sent the signal. This is set only of the
  /// signal was sent by another workflow execution.
  final WorkflowExecution externalWorkflowExecution;

  /// The ID of the `SignalExternalWorkflowExecutionInitiated` event
  /// corresponding to the `SignalExternalWorkflow` decision to signal this
  /// workflow execution.The source event with this ID can be found in the
  /// history of the source workflow execution. This information can be useful
  /// for diagnosing problems by tracing back the chain of events leading up to
  /// this event. This field is set only if the signal was initiated by another
  /// workflow execution.
  final BigInt externalInitiatedEventId;

  WorkflowExecutionSignaledEventAttributes({
    @required this.signalName,
    this.input,
    this.externalWorkflowExecution,
    this.externalInitiatedEventId,
  });
  static WorkflowExecutionSignaledEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionSignaledEventAttributes(
        signalName: json['signalName'] as String,
        input: json.containsKey('input') ? json['input'] as String : null,
        externalWorkflowExecution: json.containsKey('externalWorkflowExecution')
            ? WorkflowExecution.fromJson(json['externalWorkflowExecution'])
            : null,
        externalInitiatedEventId: json.containsKey('externalInitiatedEventId')
            ? BigInt.from(json['externalInitiatedEventId'])
            : null,
      );
}

/// Provides details of `WorkflowExecutionStarted` event.
class WorkflowExecutionStartedEventAttributes {
  /// The input provided to the workflow execution.
  final String input;

  /// The maximum duration for this workflow execution.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String executionStartToCloseTimeout;

  /// The maximum duration of decision tasks for this workflow type.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String taskStartToCloseTimeout;

  /// The policy to use for the child workflow executions if this workflow
  /// execution is terminated, by calling the TerminateWorkflowExecution action
  /// explicitly or due to an expired timeout.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  /// The name of the task list for scheduling the decision tasks for this
  /// workflow execution.
  final TaskList taskList;

  /// The priority of the decision tasks in the workflow execution.
  final String taskPriority;

  /// The workflow type of this execution.
  final WorkflowType workflowType;

  /// The list of tags associated with this workflow execution. An execution can
  /// have up to 5 tags.
  final List<String> tagList;

  /// If this workflow execution was started due to a
  /// `ContinueAsNewWorkflowExecution` decision, then it contains the `runId` of
  /// the previous workflow execution that was closed and continued as this
  /// execution.
  final String continuedExecutionRunId;

  /// The source workflow execution that started this workflow execution. The
  /// member isn't set if the workflow execution was not started by a workflow.
  final WorkflowExecution parentWorkflowExecution;

  /// The ID of the `StartChildWorkflowExecutionInitiated` event corresponding
  /// to the `StartChildWorkflowExecution` Decision to start this workflow
  /// execution. The source event with this ID can be found in the history of
  /// the source workflow execution. This information can be useful for
  /// diagnosing problems by tracing back the chain of events leading up to this
  /// event.
  final BigInt parentInitiatedEventId;

  /// The IAM role attached to the workflow execution.
  final String lambdaRole;

  WorkflowExecutionStartedEventAttributes({
    this.input,
    this.executionStartToCloseTimeout,
    this.taskStartToCloseTimeout,
    @required this.childPolicy,
    @required this.taskList,
    this.taskPriority,
    @required this.workflowType,
    this.tagList,
    this.continuedExecutionRunId,
    this.parentWorkflowExecution,
    this.parentInitiatedEventId,
    this.lambdaRole,
  });
  static WorkflowExecutionStartedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionStartedEventAttributes(
        input: json.containsKey('input') ? json['input'] as String : null,
        executionStartToCloseTimeout:
            json.containsKey('executionStartToCloseTimeout')
                ? json['executionStartToCloseTimeout'] as String
                : null,
        taskStartToCloseTimeout: json.containsKey('taskStartToCloseTimeout')
            ? json['taskStartToCloseTimeout'] as String
            : null,
        childPolicy: json['childPolicy'] as String,
        taskList: TaskList.fromJson(json['taskList']),
        taskPriority: json.containsKey('taskPriority')
            ? json['taskPriority'] as String
            : null,
        workflowType: WorkflowType.fromJson(json['workflowType']),
        tagList: json.containsKey('tagList')
            ? (json['tagList'] as List).map((e) => e as String).toList()
            : null,
        continuedExecutionRunId: json.containsKey('continuedExecutionRunId')
            ? json['continuedExecutionRunId'] as String
            : null,
        parentWorkflowExecution: json.containsKey('parentWorkflowExecution')
            ? WorkflowExecution.fromJson(json['parentWorkflowExecution'])
            : null,
        parentInitiatedEventId: json.containsKey('parentInitiatedEventId')
            ? BigInt.from(json['parentInitiatedEventId'])
            : null,
        lambdaRole: json.containsKey('lambdaRole')
            ? json['lambdaRole'] as String
            : null,
      );
}

/// Provides the details of the `WorkflowExecutionTerminated` event.
class WorkflowExecutionTerminatedEventAttributes {
  /// The reason provided for the termination.
  final String reason;

  /// The details provided for the termination.
  final String details;

  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  /// If set, indicates that the workflow execution was automatically
  /// terminated, and specifies the cause. This happens if the parent workflow
  /// execution times out or is terminated and the child policy is set to
  /// terminate child executions.
  final String cause;

  WorkflowExecutionTerminatedEventAttributes({
    this.reason,
    this.details,
    @required this.childPolicy,
    this.cause,
  });
  static WorkflowExecutionTerminatedEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionTerminatedEventAttributes(
        reason: json.containsKey('reason') ? json['reason'] as String : null,
        details: json.containsKey('details') ? json['details'] as String : null,
        childPolicy: json['childPolicy'] as String,
        cause: json.containsKey('cause') ? json['cause'] as String : null,
      );
}

/// Provides the details of the `WorkflowExecutionTimedOut` event.
class WorkflowExecutionTimedOutEventAttributes {
  /// The type of timeout that caused this event.
  final String timeoutType;

  /// The policy used for the child workflow executions of this workflow
  /// execution.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String childPolicy;

  WorkflowExecutionTimedOutEventAttributes({
    @required this.timeoutType,
    @required this.childPolicy,
  });
  static WorkflowExecutionTimedOutEventAttributes fromJson(
          Map<String, dynamic> json) =>
      WorkflowExecutionTimedOutEventAttributes(
        timeoutType: json['timeoutType'] as String,
        childPolicy: json['childPolicy'] as String,
      );
}

/// Represents a workflow type.
class WorkflowType {
  ///  The name of the workflow type.
  ///
  ///
  ///
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  final String name;

  ///  The version of the workflow type.
  ///
  ///
  ///
  /// The combination of workflow type name and version must be unique with in a
  /// domain.
  final String version;

  WorkflowType({
    @required this.name,
    @required this.version,
  });
  static WorkflowType fromJson(Map<String, dynamic> json) => WorkflowType(
        name: json['name'] as String,
        version: json['version'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The configuration settings of a workflow type.
class WorkflowTypeConfiguration {
  ///  The default maximum duration, specified when registering the workflow
  /// type, that a decision task for executions of this workflow type might take
  /// before returning completion or failure. If the task doesn'tdo close in the
  /// specified time then the task is automatically timed out and rescheduled.
  /// If the decider eventually reports a completion or failure, it is ignored.
  /// This default can be overridden when starting a workflow execution using
  /// the StartWorkflowExecution action or the `StartChildWorkflowExecution`
  /// Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultTaskStartToCloseTimeout;

  ///  The default maximum duration, specified when registering the workflow
  /// type, for executions of this workflow type. This default can be overridden
  /// when starting a workflow execution using the StartWorkflowExecution action
  /// or the `StartChildWorkflowExecution` Decision.
  ///
  /// The duration is specified in seconds, an integer greater than or equal to
  /// `0`. You can use `NONE` to specify unlimited duration.
  final String defaultExecutionStartToCloseTimeout;

  ///  The default task list, specified when registering the workflow type, for
  /// decisions tasks scheduled for workflow executions of this type. This
  /// default can be overridden when starting a workflow execution using the
  /// StartWorkflowExecution action or the `StartChildWorkflowExecution`
  /// Decision.
  final TaskList defaultTaskList;

  ///  The default task priority, specified when registering the workflow type,
  /// for all decision tasks of this workflow type. This default can be
  /// overridden when starting a workflow execution using the
  /// StartWorkflowExecution action or the `StartChildWorkflowExecution`
  /// decision.
  ///
  /// Valid values are integers that range from Java's `Integer.MIN_VALUE`
  /// (-2147483648) to `Integer.MAX_VALUE` (2147483647). Higher numbers indicate
  /// higher priority.
  ///
  /// For more information about setting task priority, see
  /// [Setting Task Priority](https://docs.aws.amazon.com/amazonswf/latest/developerguide/programming-priority.html)
  /// in the _Amazon SWF Developer Guide_.
  final String defaultTaskPriority;

  ///  The default policy to use for the child workflow executions when a
  /// workflow execution of this type is terminated, by calling the
  /// TerminateWorkflowExecution action explicitly or due to an expired timeout.
  /// This default can be overridden when starting a workflow execution using
  /// the StartWorkflowExecution action or the `StartChildWorkflowExecution`
  /// Decision.
  ///
  /// The supported child policies are:
  ///
  /// *    `TERMINATE` – The child executions are terminated.
  ///
  /// *    `REQUEST_CANCEL` – A request to cancel is attempted for each child
  /// execution by recording a `WorkflowExecutionCancelRequested` event in its
  /// history. It is up to the decider to take appropriate actions when it
  /// receives an execution history with this event.
  ///
  /// *    `ABANDON` – No action is taken. The child executions continue to run.
  final String defaultChildPolicy;

  /// The default IAM role attached to this workflow type.
  ///
  ///
  ///
  /// Executions of this workflow type need IAM roles to invoke Lambda
  /// functions. If you don't specify an IAM role when starting this workflow
  /// type, the default Lambda role is attached to the execution. For more
  /// information, see
  /// [https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html](https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html)
  /// in the _Amazon SWF Developer Guide_.
  final String defaultLambdaRole;

  WorkflowTypeConfiguration({
    this.defaultTaskStartToCloseTimeout,
    this.defaultExecutionStartToCloseTimeout,
    this.defaultTaskList,
    this.defaultTaskPriority,
    this.defaultChildPolicy,
    this.defaultLambdaRole,
  });
  static WorkflowTypeConfiguration fromJson(Map<String, dynamic> json) =>
      WorkflowTypeConfiguration(
        defaultTaskStartToCloseTimeout:
            json.containsKey('defaultTaskStartToCloseTimeout')
                ? json['defaultTaskStartToCloseTimeout'] as String
                : null,
        defaultExecutionStartToCloseTimeout:
            json.containsKey('defaultExecutionStartToCloseTimeout')
                ? json['defaultExecutionStartToCloseTimeout'] as String
                : null,
        defaultTaskList: json.containsKey('defaultTaskList')
            ? TaskList.fromJson(json['defaultTaskList'])
            : null,
        defaultTaskPriority: json.containsKey('defaultTaskPriority')
            ? json['defaultTaskPriority'] as String
            : null,
        defaultChildPolicy: json.containsKey('defaultChildPolicy')
            ? json['defaultChildPolicy'] as String
            : null,
        defaultLambdaRole: json.containsKey('defaultLambdaRole')
            ? json['defaultLambdaRole'] as String
            : null,
      );
}

/// Contains details about a workflow type.
class WorkflowTypeDetail {
  /// General information about the workflow type.
  ///
  /// The status of the workflow type (returned in the WorkflowTypeInfo
  /// structure) can be one of the following.
  ///
  /// *    `REGISTERED` – The type is registered and available. Workers
  /// supporting this type should be running.
  ///
  /// *    `DEPRECATED` – The type was deprecated using DeprecateWorkflowType,
  /// but is still in use. You should keep workers supporting this type running.
  /// You cannot create new workflow executions of this type.
  final WorkflowTypeInfo typeInfo;

  /// Configuration settings of the workflow type registered through
  /// RegisterWorkflowType
  final WorkflowTypeConfiguration configuration;

  WorkflowTypeDetail({
    @required this.typeInfo,
    @required this.configuration,
  });
  static WorkflowTypeDetail fromJson(Map<String, dynamic> json) =>
      WorkflowTypeDetail(
        typeInfo: WorkflowTypeInfo.fromJson(json['typeInfo']),
        configuration:
            WorkflowTypeConfiguration.fromJson(json['configuration']),
      );
}

/// Used to filter workflow execution query results by type. Each parameter, if
/// specified, defines a rule that must be satisfied by each returned result.
class WorkflowTypeFilter {
  ///  Name of the workflow type.
  final String name;

  /// Version of the workflow type.
  final String version;

  WorkflowTypeFilter({
    @required this.name,
    this.version,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about a workflow type.
class WorkflowTypeInfo {
  /// The workflow type this information is about.
  final WorkflowType workflowType;

  /// The current status of the workflow type.
  final String status;

  /// The description of the type registered through RegisterWorkflowType.
  final String description;

  /// The date when this type was registered.
  final DateTime creationDate;

  /// If the type is in deprecated state, then it is set to the date when the
  /// type was deprecated.
  final DateTime deprecationDate;

  WorkflowTypeInfo({
    @required this.workflowType,
    @required this.status,
    this.description,
    @required this.creationDate,
    this.deprecationDate,
  });
  static WorkflowTypeInfo fromJson(Map<String, dynamic> json) =>
      WorkflowTypeInfo(
        workflowType: WorkflowType.fromJson(json['workflowType']),
        status: json['status'] as String,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        creationDate: DateTime.parse(json['creationDate']),
        deprecationDate: json.containsKey('deprecationDate')
            ? DateTime.parse(json['deprecationDate'])
            : null,
      );
}

/// Contains a paginated list of information structures about workflow types.
class WorkflowTypeInfos {
  /// The list of workflow type information.
  final List<WorkflowTypeInfo> typeInfos;

  /// If a `NextPageToken` was returned by a previous call, there are more
  /// results available. To retrieve the next page of results, make the call
  /// again using the returned token in `nextPageToken`. Keep all other
  /// arguments unchanged.
  ///
  /// The configured `maximumPageSize` determines how many results can be
  /// returned in a single call.
  final String nextPageToken;

  WorkflowTypeInfos({
    @required this.typeInfos,
    this.nextPageToken,
  });
  static WorkflowTypeInfos fromJson(Map<String, dynamic> json) =>
      WorkflowTypeInfos(
        typeInfos: (json['typeInfos'] as List)
            .map((e) => WorkflowTypeInfo.fromJson(e))
            .toList(),
        nextPageToken: json.containsKey('nextPageToken')
            ? json['nextPageToken'] as String
            : null,
      );
}
