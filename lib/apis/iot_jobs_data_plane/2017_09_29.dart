import 'package:meta/meta.dart';

/// AWS IoT Jobs is a service that allows you to define a set of jobs — remote
/// operations that are sent to and executed on one or more devices connected to
/// AWS IoT. For example, you can define a job that instructs a set of devices
/// to download and install application or firmware updates, reboot, rotate
/// certificates, or perform remote troubleshooting operations.
///
///  To create a job, you make a job document which is a description of the
/// remote operations to be performed, and you specify a list of targets that
/// should perform the operations. The targets can be individual things, thing
/// groups or both.
///
///  AWS IoT Jobs sends a message to inform the targets that a job is available.
/// The target starts the execution of the job by downloading the job document,
/// performing the operations it specifies, and reporting its progress to AWS
/// IoT. The Jobs service provides commands to track the progress of a job on a
/// specific target and for all the targets of the job
class IotJobsDataPlaneApi {
  final _client;
  IotJobsDataPlaneApi(client)
      : _client =
            client.configured('IoT Jobs Data Plane', serializer: 'rest-json');

  /// Gets details of a job execution.
  ///
  /// [jobId]: The unique identifier assigned to this job when it was created.
  ///
  /// [thingName]: The thing name associated with the device the job execution
  /// is running on.
  ///
  /// [includeJobDocument]: Optional. When set to true, the response contains
  /// the job document. The default is false.
  ///
  /// [executionNumber]: Optional. A number that identifies a particular job
  /// execution on a particular device. If not specified, the latest job
  /// execution is returned.
  Future<DescribeJobExecutionResponse> describeJobExecution(
      {@required String jobId,
      @required String thingName,
      bool includeJobDocument,
      BigInt executionNumber}) async {
    var response_ = await _client.send('DescribeJobExecution', {
      'jobId': jobId,
      'thingName': thingName,
      if (includeJobDocument != null) 'includeJobDocument': includeJobDocument,
      if (executionNumber != null) 'executionNumber': executionNumber,
    });
    return DescribeJobExecutionResponse.fromJson(response_);
  }

  /// Gets the list of all jobs for a thing that are not in a terminal status.
  ///
  /// [thingName]: The name of the thing that is executing the job.
  Future<GetPendingJobExecutionsResponse> getPendingJobExecutions(
      String thingName) async {
    var response_ = await _client.send('GetPendingJobExecutions', {
      'thingName': thingName,
    });
    return GetPendingJobExecutionsResponse.fromJson(response_);
  }

  /// Gets and starts the next pending (status IN_PROGRESS or QUEUED) job
  /// execution for a thing.
  ///
  /// [thingName]: The name of the thing associated with the device.
  ///
  /// [statusDetails]: A collection of name/value pairs that describe the status
  /// of the job execution. If not specified, the statusDetails are unchanged.
  ///
  /// [stepTimeoutInMinutes]: Specifies the amount of time this device has to
  /// finish execution of this job. If the job execution status is not set to a
  /// terminal state before this timer expires, or before the timer is reset (by
  /// calling `UpdateJobExecution`, setting the status to `IN_PROGRESS` and
  /// specifying a new timeout value in field `stepTimeoutInMinutes`) the job
  /// execution status will be automatically set to `TIMED_OUT`. Note that
  /// setting this timeout has no effect on that job execution timeout which may
  /// have been specified when the job was created (`CreateJob` using field
  /// `timeoutConfig`).
  Future<StartNextPendingJobExecutionResponse> startNextPendingJobExecution(
      String thingName,
      {Map<String, String> statusDetails,
      BigInt stepTimeoutInMinutes}) async {
    var response_ = await _client.send('StartNextPendingJobExecution', {
      'thingName': thingName,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stepTimeoutInMinutes != null)
        'stepTimeoutInMinutes': stepTimeoutInMinutes,
    });
    return StartNextPendingJobExecutionResponse.fromJson(response_);
  }

  /// Updates the status of a job execution.
  ///
  /// [jobId]: The unique identifier assigned to this job when it was created.
  ///
  /// [thingName]: The name of the thing associated with the device.
  ///
  /// [status]: The new status for the job execution (IN_PROGRESS, FAILED,
  /// SUCCESS, or REJECTED). This must be specified on every update.
  ///
  /// [statusDetails]:  Optional. A collection of name/value pairs that describe
  /// the status of the job execution. If not specified, the statusDetails are
  /// unchanged.
  ///
  /// [stepTimeoutInMinutes]: Specifies the amount of time this device has to
  /// finish execution of this job. If the job execution status is not set to a
  /// terminal state before this timer expires, or before the timer is reset (by
  /// again calling `UpdateJobExecution`, setting the status to `IN_PROGRESS`
  /// and specifying a new timeout value in this field) the job execution status
  /// will be automatically set to `TIMED_OUT`. Note that setting or resetting
  /// this timeout has no effect on that job execution timeout which may have
  /// been specified when the job was created (`CreateJob` using field
  /// `timeoutConfig`).
  ///
  /// [expectedVersion]: Optional. The expected current version of the job
  /// execution. Each time you update the job execution, its version is
  /// incremented. If the version of the job execution stored in Jobs does not
  /// match, the update is rejected with a VersionMismatch error, and an
  /// ErrorResponse that contains the current job execution status data is
  /// returned. (This makes it unnecessary to perform a separate
  /// DescribeJobExecution request in order to obtain the job execution status
  /// data.)
  ///
  /// [includeJobExecutionState]: Optional. When included and set to true, the
  /// response contains the JobExecutionState data. The default is false.
  ///
  /// [includeJobDocument]: Optional. When set to true, the response contains
  /// the job document. The default is false.
  ///
  /// [executionNumber]: Optional. A number that identifies a particular job
  /// execution on a particular device.
  Future<UpdateJobExecutionResponse> updateJobExecution(
      {@required String jobId,
      @required String thingName,
      @required String status,
      Map<String, String> statusDetails,
      BigInt stepTimeoutInMinutes,
      BigInt expectedVersion,
      bool includeJobExecutionState,
      bool includeJobDocument,
      BigInt executionNumber}) async {
    var response_ = await _client.send('UpdateJobExecution', {
      'jobId': jobId,
      'thingName': thingName,
      'status': status,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (stepTimeoutInMinutes != null)
        'stepTimeoutInMinutes': stepTimeoutInMinutes,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (includeJobExecutionState != null)
        'includeJobExecutionState': includeJobExecutionState,
      if (includeJobDocument != null) 'includeJobDocument': includeJobDocument,
      if (executionNumber != null) 'executionNumber': executionNumber,
    });
    return UpdateJobExecutionResponse.fromJson(response_);
  }
}

class DescribeJobExecutionResponse {
  /// Contains data about a job execution.
  final JobExecution execution;

  DescribeJobExecutionResponse({
    this.execution,
  });
  static DescribeJobExecutionResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobExecutionResponse(
        execution: json.containsKey('execution')
            ? JobExecution.fromJson(json['execution'])
            : null,
      );
}

class GetPendingJobExecutionsResponse {
  /// A list of JobExecutionSummary objects with status IN_PROGRESS.
  final List<JobExecutionSummary> inProgressJobs;

  /// A list of JobExecutionSummary objects with status QUEUED.
  final List<JobExecutionSummary> queuedJobs;

  GetPendingJobExecutionsResponse({
    this.inProgressJobs,
    this.queuedJobs,
  });
  static GetPendingJobExecutionsResponse fromJson(Map<String, dynamic> json) =>
      GetPendingJobExecutionsResponse(
        inProgressJobs: json.containsKey('inProgressJobs')
            ? (json['inProgressJobs'] as List)
                .map((e) => JobExecutionSummary.fromJson(e))
                .toList()
            : null,
        queuedJobs: json.containsKey('queuedJobs')
            ? (json['queuedJobs'] as List)
                .map((e) => JobExecutionSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains data about a job execution.
class JobExecution {
  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// The name of the thing that is executing the job.
  final String thingName;

  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  final String status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final Map<String, String> statusDetails;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  final BigInt queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// started.
  final BigInt startedAt;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  final BigInt lastUpdatedAt;

  /// The estimated number of seconds that remain before the job execution
  /// status will be changed to `TIMED_OUT`.
  final BigInt approximateSecondsBeforeTimedOut;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final BigInt versionNumber;

  /// A number that identifies a particular job execution on a particular
  /// device. It can be used later in commands that return or update job
  /// execution information.
  final BigInt executionNumber;

  /// The content of the job document.
  final String jobDocument;

  JobExecution({
    this.jobId,
    this.thingName,
    this.status,
    this.statusDetails,
    this.queuedAt,
    this.startedAt,
    this.lastUpdatedAt,
    this.approximateSecondsBeforeTimedOut,
    this.versionNumber,
    this.executionNumber,
    this.jobDocument,
  });
  static JobExecution fromJson(Map<String, dynamic> json) => JobExecution(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusDetails: json.containsKey('statusDetails')
            ? (json['statusDetails'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        queuedAt:
            json.containsKey('queuedAt') ? BigInt.from(json['queuedAt']) : null,
        startedAt: json.containsKey('startedAt')
            ? BigInt.from(json['startedAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? BigInt.from(json['lastUpdatedAt'])
            : null,
        approximateSecondsBeforeTimedOut:
            json.containsKey('approximateSecondsBeforeTimedOut')
                ? BigInt.from(json['approximateSecondsBeforeTimedOut'])
                : null,
        versionNumber: json.containsKey('versionNumber')
            ? BigInt.from(json['versionNumber'])
            : null,
        executionNumber: json.containsKey('executionNumber')
            ? BigInt.from(json['executionNumber'])
            : null,
        jobDocument: json.containsKey('jobDocument')
            ? json['jobDocument'] as String
            : null,
      );
}

/// Contains data about the state of a job execution.
class JobExecutionState {
  /// The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS",
  /// "FAILED", "SUCCESS", "CANCELED", "REJECTED", or "REMOVED".
  final String status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final Map<String, String> statusDetails;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final BigInt versionNumber;

  JobExecutionState({
    this.status,
    this.statusDetails,
    this.versionNumber,
  });
  static JobExecutionState fromJson(Map<String, dynamic> json) =>
      JobExecutionState(
        status: json.containsKey('status') ? json['status'] as String : null,
        statusDetails: json.containsKey('statusDetails')
            ? (json['statusDetails'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        versionNumber: json.containsKey('versionNumber')
            ? BigInt.from(json['versionNumber'])
            : null,
      );
}

/// Contains a subset of information about a job execution.
class JobExecutionSummary {
  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// The time, in milliseconds since the epoch, when the job execution was
  /// enqueued.
  final BigInt queuedAt;

  /// The time, in milliseconds since the epoch, when the job execution started.
  final BigInt startedAt;

  /// The time, in milliseconds since the epoch, when the job execution was last
  /// updated.
  final BigInt lastUpdatedAt;

  /// The version of the job execution. Job execution versions are incremented
  /// each time AWS IoT Jobs receives an update from a device.
  final BigInt versionNumber;

  /// A number that identifies a particular job execution on a particular
  /// device.
  final BigInt executionNumber;

  JobExecutionSummary({
    this.jobId,
    this.queuedAt,
    this.startedAt,
    this.lastUpdatedAt,
    this.versionNumber,
    this.executionNumber,
  });
  static JobExecutionSummary fromJson(Map<String, dynamic> json) =>
      JobExecutionSummary(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        queuedAt:
            json.containsKey('queuedAt') ? BigInt.from(json['queuedAt']) : null,
        startedAt: json.containsKey('startedAt')
            ? BigInt.from(json['startedAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? BigInt.from(json['lastUpdatedAt'])
            : null,
        versionNumber: json.containsKey('versionNumber')
            ? BigInt.from(json['versionNumber'])
            : null,
        executionNumber: json.containsKey('executionNumber')
            ? BigInt.from(json['executionNumber'])
            : null,
      );
}

class StartNextPendingJobExecutionResponse {
  /// A JobExecution object.
  final JobExecution execution;

  StartNextPendingJobExecutionResponse({
    this.execution,
  });
  static StartNextPendingJobExecutionResponse fromJson(
          Map<String, dynamic> json) =>
      StartNextPendingJobExecutionResponse(
        execution: json.containsKey('execution')
            ? JobExecution.fromJson(json['execution'])
            : null,
      );
}

class UpdateJobExecutionResponse {
  /// A JobExecutionState object.
  final JobExecutionState executionState;

  /// The contents of the Job Documents.
  final String jobDocument;

  UpdateJobExecutionResponse({
    this.executionState,
    this.jobDocument,
  });
  static UpdateJobExecutionResponse fromJson(Map<String, dynamic> json) =>
      UpdateJobExecutionResponse(
        executionState: json.containsKey('executionState')
            ? JobExecutionState.fromJson(json['executionState'])
            : null,
        jobDocument: json.containsKey('jobDocument')
            ? json['jobDocument'] as String
            : null,
      );
}
