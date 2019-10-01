import 'package:meta/meta.dart';

///  AWS S3 Control provides access to Amazon S3 control plane operations.
class S3ControlApi {
  /// Creates an Amazon S3 batch operations job.
  Future<void> createJob(
      {@required String accountId,
      bool confirmationRequired,
      @required JobOperation operation,
      @required JobReport report,
      @required String clientRequestToken,
      @required JobManifest manifest,
      String description,
      @required int priority,
      @required String roleArn}) async {}

  /// Deletes the block public access configuration for the specified account.
  Future<void> deletePublicAccessBlock(String accountId) async {}

  /// Retrieves the configuration parameters and status for a batch operations
  /// job.
  Future<void> describeJob(
      {@required String accountId, @required String jobId}) async {}

  Future<void> getPublicAccessBlock(String accountId) async {}

  /// Lists current jobs and jobs that have ended within the last 30 days for
  /// the AWS account making the request.
  Future<void> listJobs(String accountId,
      {List<String> jobStatuses, String nextToken, int maxResults}) async {}

  Future<void> putPublicAccessBlock(
      {@required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
      @required String accountId}) async {}

  /// Updates an existing job's priority.
  Future<void> updateJobPriority(
      {@required String accountId,
      @required String jobId,
      @required int priority}) async {}

  /// Updates the status for the specified job. Use this operation to confirm
  /// that you want to run a job or to cancel an existing job.
  Future<void> updateJobStatus(
      {@required String accountId,
      @required String jobId,
      @required String requestedJobStatus,
      String statusUpdateReason}) async {}
}

class CreateJobResult {}

class DescribeJobResult {}

class GetPublicAccessBlockOutput {}

class JobDescriptor {}

class JobFailure {}

class JobListDescriptor {}

class JobManifest {}

class JobManifestLocation {}

class JobManifestSpec {}

class JobOperation {}

class JobProgressSummary {}

class JobReport {}

class LambdaInvokeOperation {}

class ListJobsResult {}

class PublicAccessBlockConfiguration {}

class S3AccessControlList {}

class S3AccessControlPolicy {}

class S3CopyObjectOperation {}

class S3Grant {}

class S3Grantee {}

class S3InitiateRestoreObjectOperation {}

class S3ObjectMetadata {}

class S3ObjectOwner {}

class S3SetObjectAclOperation {}

class S3SetObjectTaggingOperation {}

class S3Tag {}

class UpdateJobPriorityResult {}

class UpdateJobStatusResult {}
