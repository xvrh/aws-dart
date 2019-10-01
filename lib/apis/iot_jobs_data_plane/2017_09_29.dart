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
  /// Gets details of a job execution.
  Future<void> describeJobExecution(
      {@required String jobId,
      @required String thingName,
      bool includeJobDocument,
      BigInt executionNumber}) async {}

  /// Gets the list of all jobs for a thing that are not in a terminal status.
  Future<void> getPendingJobExecutions(String thingName) async {}

  /// Gets and starts the next pending (status IN_PROGRESS or QUEUED) job
  /// execution for a thing.
  Future<void> startNextPendingJobExecution(String thingName,
      {Map<String, String> statusDetails, BigInt stepTimeoutInMinutes}) async {}

  /// Updates the status of a job execution.
  Future<void> updateJobExecution(
      {@required String jobId,
      @required String thingName,
      @required String status,
      Map<String, String> statusDetails,
      BigInt stepTimeoutInMinutes,
      BigInt expectedVersion,
      bool includeJobExecutionState,
      bool includeJobDocument,
      BigInt executionNumber}) async {}
}

class DescribeJobExecutionResponse {}

class GetPendingJobExecutionsResponse {}

class JobExecution {}

class JobExecutionState {}

class JobExecutionSummary {}

class StartNextPendingJobExecutionResponse {}

class UpdateJobExecutionResponse {}
