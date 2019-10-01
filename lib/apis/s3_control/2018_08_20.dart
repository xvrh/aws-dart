import 'package:meta/meta.dart';

///  AWS S3 Control provides access to Amazon S3 control plane operations.
class S3ControlApi {
  final _client;
  S3ControlApi(client)
      : _client = client.configured('S3 Control', serializer: 'rest-xml');

  /// Creates an Amazon S3 batch operations job.
  ///
  /// [accountId]:
  ///
  /// [confirmationRequired]: Indicates whether confirmation is required before
  /// Amazon S3 runs the job. Confirmation is only required for jobs created
  /// through the Amazon S3 console.
  ///
  /// [operation]: The operation that you want this job to perform on each
  /// object listed in the manifest. For more information about the available
  /// operations, see
  /// [Available Operations](https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html)
  /// in the _Amazon Simple Storage Service Developer Guide_.
  ///
  /// [report]: Configuration parameters for the optional job-completion report.
  ///
  /// [clientRequestToken]: An idempotency token to ensure that you don't
  /// accidentally submit the same request twice. You can use any string up to
  /// the maximum length.
  ///
  /// [manifest]: Configuration parameters for the manifest.
  ///
  /// [description]: A description for this job. You can use any string within
  /// the permitted length. Descriptions don't need to be unique and can be used
  /// for multiple jobs.
  ///
  /// [priority]: The numerical priority for this job. Higher numbers indicate
  /// higher priority.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) for the Identity and Access
  /// Management (IAM) Role that batch operations will use to execute this job's
  /// operation on each object in the manifest.
  Future<CreateJobResult> createJob(
      {@required String accountId,
      bool confirmationRequired,
      @required JobOperation operation,
      @required JobReport report,
      @required String clientRequestToken,
      @required JobManifest manifest,
      String description,
      @required int priority,
      @required String roleArn}) async {
    var response_ = await _client.send('CreateJob', {
      'AccountId': accountId,
      if (confirmationRequired != null)
        'ConfirmationRequired': confirmationRequired,
      'Operation': operation,
      'Report': report,
      'ClientRequestToken': clientRequestToken,
      'Manifest': manifest,
      if (description != null) 'Description': description,
      'Priority': priority,
      'RoleArn': roleArn,
    });
    return CreateJobResult.fromJson(response_);
  }

  /// Deletes the block public access configuration for the specified account.
  ///
  /// [accountId]: The account ID for the AWS account whose block public access
  /// configuration you want to delete.
  Future<void> deletePublicAccessBlock(String accountId) async {
    await _client.send('DeletePublicAccessBlock', {
      'AccountId': accountId,
    });
  }

  /// Retrieves the configuration parameters and status for a batch operations
  /// job.
  ///
  /// [accountId]:
  ///
  /// [jobId]: The ID for the job whose information you want to retrieve.
  Future<DescribeJobResult> describeJob(
      {@required String accountId, @required String jobId}) async {
    var response_ = await _client.send('DescribeJob', {
      'AccountId': accountId,
      'JobId': jobId,
    });
    return DescribeJobResult.fromJson(response_);
  }

  ///
  /// [accountId]:
  Future<GetPublicAccessBlockOutput> getPublicAccessBlock(
      String accountId) async {
    var response_ = await _client.send('GetPublicAccessBlock', {
      'AccountId': accountId,
    });
    return GetPublicAccessBlockOutput.fromJson(response_);
  }

  /// Lists current jobs and jobs that have ended within the last 30 days for
  /// the AWS account making the request.
  ///
  /// [accountId]:
  ///
  /// [jobStatuses]: The `List Jobs` request returns jobs that match the
  /// statuses listed in this element.
  ///
  /// [nextToken]: A pagination token to request the next page of results. Use
  /// the token that Amazon S3 returned in the `NextToken` element of the
  /// `ListJobsResult` from the previous `List Jobs` request.
  ///
  /// [maxResults]: The maximum number of jobs that Amazon S3 will include in
  /// the `List Jobs` response. If there are more jobs than this number, the
  /// response will include a pagination token in the `NextToken` field to
  /// enable you to retrieve the next page of results.
  Future<ListJobsResult> listJobs(String accountId,
      {List<String> jobStatuses, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListJobs', {
      'AccountId': accountId,
      if (jobStatuses != null) 'JobStatuses': jobStatuses,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListJobsResult.fromJson(response_);
  }

  ///
  /// [publicAccessBlockConfiguration]:
  ///
  /// [accountId]:
  Future<void> putPublicAccessBlock(
      {@required PublicAccessBlockConfiguration publicAccessBlockConfiguration,
      @required String accountId}) async {
    await _client.send('PutPublicAccessBlock', {
      'PublicAccessBlockConfiguration': publicAccessBlockConfiguration,
      'AccountId': accountId,
    });
  }

  /// Updates an existing job's priority.
  ///
  /// [accountId]:
  ///
  /// [jobId]: The ID for the job whose priority you want to update.
  ///
  /// [priority]: The priority you want to assign to this job.
  Future<UpdateJobPriorityResult> updateJobPriority(
      {@required String accountId,
      @required String jobId,
      @required int priority}) async {
    var response_ = await _client.send('UpdateJobPriority', {
      'AccountId': accountId,
      'JobId': jobId,
      'Priority': priority,
    });
    return UpdateJobPriorityResult.fromJson(response_);
  }

  /// Updates the status for the specified job. Use this operation to confirm
  /// that you want to run a job or to cancel an existing job.
  ///
  /// [accountId]:
  ///
  /// [jobId]: The ID of the job whose status you want to update.
  ///
  /// [requestedJobStatus]: The status that you want to move the specified job
  /// to.
  ///
  /// [statusUpdateReason]: A description of the reason why you want to change
  /// the specified job's status. This field can be any string up to the maximum
  /// length.
  Future<UpdateJobStatusResult> updateJobStatus(
      {@required String accountId,
      @required String jobId,
      @required String requestedJobStatus,
      String statusUpdateReason}) async {
    var response_ = await _client.send('UpdateJobStatus', {
      'AccountId': accountId,
      'JobId': jobId,
      'RequestedJobStatus': requestedJobStatus,
      if (statusUpdateReason != null) 'StatusUpdateReason': statusUpdateReason,
    });
    return UpdateJobStatusResult.fromJson(response_);
  }
}

class CreateJobResult {
  /// The ID for this job. Amazon S3 generates this ID automatically and returns
  /// it after a successful `Create Job` request.
  final String jobId;

  CreateJobResult({
    this.jobId,
  });
  static CreateJobResult fromJson(Map<String, dynamic> json) => CreateJobResult(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
      );
}

class DescribeJobResult {
  /// Contains the configuration parameters and status for the job specified in
  /// the `Describe Job` request.
  final JobDescriptor job;

  DescribeJobResult({
    this.job,
  });
  static DescribeJobResult fromJson(Map<String, dynamic> json) =>
      DescribeJobResult(
        job: json.containsKey('Job')
            ? JobDescriptor.fromJson(json['Job'])
            : null,
      );
}

class GetPublicAccessBlockOutput {
  final PublicAccessBlockConfiguration publicAccessBlockConfiguration;

  GetPublicAccessBlockOutput({
    this.publicAccessBlockConfiguration,
  });
  static GetPublicAccessBlockOutput fromJson(Map<String, dynamic> json) =>
      GetPublicAccessBlockOutput(
        publicAccessBlockConfiguration:
            json.containsKey('PublicAccessBlockConfiguration')
                ? PublicAccessBlockConfiguration.fromJson(
                    json['PublicAccessBlockConfiguration'])
                : null,
      );
}

/// A container element for the job configuration and status information
/// returned by a `Describe Job` request.
class JobDescriptor {
  /// The ID for the specified job.
  final String jobId;

  /// Indicates whether confirmation is required before Amazon S3 begins running
  /// the specified job. Confirmation is required only for jobs created through
  /// the Amazon S3 console.
  final bool confirmationRequired;

  /// The description for this job, if one was provided in this job's `Create
  /// Job` request.
  final String description;

  /// The Amazon Resource Name (ARN) for this job.
  final String jobArn;

  /// The current status of the specified job.
  final String status;

  /// The configuration information for the specified job's manifest object.
  final JobManifest manifest;

  /// The operation that the specified job is configured to execute on the
  /// objects listed in the manifest.
  final JobOperation operation;

  /// The priority of the specified job.
  final int priority;

  /// Describes the total number of tasks that the specified job has executed,
  /// the number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary progressSummary;

  final String statusUpdateReason;

  /// If the specified job failed, this field contains information describing
  /// the failure.
  final List<JobFailure> failureReasons;

  /// Contains the configuration information for the job-completion report if
  /// you requested one in the `Create Job` request.
  final JobReport report;

  /// A timestamp indicating when this job was created.
  final DateTime creationTime;

  /// A timestamp indicating when this job terminated. A job's termination date
  /// is the date and time when it succeeded, failed, or was canceled.
  final DateTime terminationDate;

  /// The Amazon Resource Name (ARN) for the Identity and Access Management
  /// (IAM) Role assigned to execute the tasks for this job.
  final String roleArn;

  /// The timestamp when this job was suspended, if it has been suspended.
  final DateTime suspendedDate;

  /// The reason why the specified job was suspended. A job is only suspended if
  /// you create it through the Amazon S3 console. When you create the job, it
  /// enters the `Suspended` state to await confirmation before running. After
  /// you confirm the job, it automatically exits the `Suspended` state.
  final String suspendedCause;

  JobDescriptor({
    this.jobId,
    this.confirmationRequired,
    this.description,
    this.jobArn,
    this.status,
    this.manifest,
    this.operation,
    this.priority,
    this.progressSummary,
    this.statusUpdateReason,
    this.failureReasons,
    this.report,
    this.creationTime,
    this.terminationDate,
    this.roleArn,
    this.suspendedDate,
    this.suspendedCause,
  });
  static JobDescriptor fromJson(Map<String, dynamic> json) => JobDescriptor(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        confirmationRequired: json.containsKey('ConfirmationRequired')
            ? json['ConfirmationRequired'] as bool
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        jobArn: json.containsKey('JobArn') ? json['JobArn'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        manifest: json.containsKey('Manifest')
            ? JobManifest.fromJson(json['Manifest'])
            : null,
        operation: json.containsKey('Operation')
            ? JobOperation.fromJson(json['Operation'])
            : null,
        priority: json.containsKey('Priority') ? json['Priority'] as int : null,
        progressSummary: json.containsKey('ProgressSummary')
            ? JobProgressSummary.fromJson(json['ProgressSummary'])
            : null,
        statusUpdateReason: json.containsKey('StatusUpdateReason')
            ? json['StatusUpdateReason'] as String
            : null,
        failureReasons: json.containsKey('FailureReasons')
            ? (json['FailureReasons'] as List)
                .map((e) => JobFailure.fromJson(e))
                .toList()
            : null,
        report: json.containsKey('Report')
            ? JobReport.fromJson(json['Report'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        terminationDate: json.containsKey('TerminationDate')
            ? DateTime.parse(json['TerminationDate'])
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        suspendedDate: json.containsKey('SuspendedDate')
            ? DateTime.parse(json['SuspendedDate'])
            : null,
        suspendedCause: json.containsKey('SuspendedCause')
            ? json['SuspendedCause'] as String
            : null,
      );
}

/// If this job failed, this element indicates why the job failed.
class JobFailure {
  /// The failure code, if any, for the specified job.
  final String failureCode;

  /// The failure reason, if any, for the specified job.
  final String failureReason;

  JobFailure({
    this.failureCode,
    this.failureReason,
  });
  static JobFailure fromJson(Map<String, dynamic> json) => JobFailure(
        failureCode: json.containsKey('FailureCode')
            ? json['FailureCode'] as String
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

/// Contains the configuration and status information for a single job retrieved
/// as part of a job list.
class JobListDescriptor {
  /// The ID for the specified job.
  final String jobId;

  /// The user-specified description that was included in the specified job's
  /// `Create Job` request.
  final String description;

  /// The operation that the specified job is configured to run on each object
  /// listed in the manifest.
  final String operation;

  /// The current priority for the specified job.
  final int priority;

  /// The specified job's current status.
  final String status;

  /// A timestamp indicating when the specified job was created.
  final DateTime creationTime;

  /// A timestamp indicating when the specified job terminated. A job's
  /// termination date is the date and time when it succeeded, failed, or was
  /// canceled.
  final DateTime terminationDate;

  /// Describes the total number of tasks that the specified job has executed,
  /// the number of tasks that succeeded, and the number of tasks that failed.
  final JobProgressSummary progressSummary;

  JobListDescriptor({
    this.jobId,
    this.description,
    this.operation,
    this.priority,
    this.status,
    this.creationTime,
    this.terminationDate,
    this.progressSummary,
  });
  static JobListDescriptor fromJson(Map<String, dynamic> json) =>
      JobListDescriptor(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        operation:
            json.containsKey('Operation') ? json['Operation'] as String : null,
        priority: json.containsKey('Priority') ? json['Priority'] as int : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        terminationDate: json.containsKey('TerminationDate')
            ? DateTime.parse(json['TerminationDate'])
            : null,
        progressSummary: json.containsKey('ProgressSummary')
            ? JobProgressSummary.fromJson(json['ProgressSummary'])
            : null,
      );
}

/// Contains the configuration information for a job's manifest.
class JobManifest {
  /// Describes the format of the specified job's manifest. If the manifest is
  /// in CSV format, also describes the columns contained within the manifest.
  final JobManifestSpec spec;

  /// Contains the information required to locate the specified job's manifest.
  final JobManifestLocation location;

  JobManifest({
    @required this.spec,
    @required this.location,
  });
  static JobManifest fromJson(Map<String, dynamic> json) => JobManifest(
        spec: JobManifestSpec.fromJson(json['Spec']),
        location: JobManifestLocation.fromJson(json['Location']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the information required to locate a manifest object.
class JobManifestLocation {
  /// The Amazon Resource Name (ARN) for a manifest object.
  final String objectArn;

  /// The optional version ID to identify a specific version of the manifest
  /// object.
  final String objectVersionId;

  /// The ETag for the specified manifest object.
  final String eTag;

  JobManifestLocation({
    @required this.objectArn,
    this.objectVersionId,
    @required this.eTag,
  });
  static JobManifestLocation fromJson(Map<String, dynamic> json) =>
      JobManifestLocation(
        objectArn: json['ObjectArn'] as String,
        objectVersionId: json.containsKey('ObjectVersionId')
            ? json['ObjectVersionId'] as String
            : null,
        eTag: json['ETag'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the format of a manifest. If the manifest is in CSV format, also
/// describes the columns contained within the manifest.
class JobManifestSpec {
  /// Indicates which of the available formats the specified manifest uses.
  final String format;

  /// If the specified manifest object is in the
  /// `S3BatchOperations_CSV_20180820` format, this element describes which
  /// columns contain the required data.
  final List<String> fields;

  JobManifestSpec({
    @required this.format,
    this.fields,
  });
  static JobManifestSpec fromJson(Map<String, dynamic> json) => JobManifestSpec(
        format: json['Format'] as String,
        fields: json.containsKey('Fields')
            ? (json['Fields'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The operation that you want this job to perform on each object listed in the
/// manifest. For more information about the available operations, see
/// [Available Operations](https://docs.aws.amazon.com/AmazonS3/latest/dev/batch-ops-operations.html)
/// in the _Amazon Simple Storage Service Developer Guide_.
class JobOperation {
  /// Directs the specified job to invoke an AWS Lambda function on each object
  /// in the manifest.
  final LambdaInvokeOperation lambdaInvoke;

  /// Directs the specified job to execute a PUT Copy object call on each object
  /// in the manifest.
  final S3CopyObjectOperation s3PutObjectCopy;

  /// Directs the specified job to execute a PUT Object acl call on each object
  /// in the manifest.
  final S3SetObjectAclOperation s3PutObjectAcl;

  /// Directs the specified job to execute a PUT Object tagging call on each
  /// object in the manifest.
  final S3SetObjectTaggingOperation s3PutObjectTagging;

  /// Directs the specified job to execute an Initiate Glacier Restore call on
  /// each object in the manifest.
  final S3InitiateRestoreObjectOperation s3InitiateRestoreObject;

  JobOperation({
    this.lambdaInvoke,
    this.s3PutObjectCopy,
    this.s3PutObjectAcl,
    this.s3PutObjectTagging,
    this.s3InitiateRestoreObject,
  });
  static JobOperation fromJson(Map<String, dynamic> json) => JobOperation(
        lambdaInvoke: json.containsKey('LambdaInvoke')
            ? LambdaInvokeOperation.fromJson(json['LambdaInvoke'])
            : null,
        s3PutObjectCopy: json.containsKey('S3PutObjectCopy')
            ? S3CopyObjectOperation.fromJson(json['S3PutObjectCopy'])
            : null,
        s3PutObjectAcl: json.containsKey('S3PutObjectAcl')
            ? S3SetObjectAclOperation.fromJson(json['S3PutObjectAcl'])
            : null,
        s3PutObjectTagging: json.containsKey('S3PutObjectTagging')
            ? S3SetObjectTaggingOperation.fromJson(json['S3PutObjectTagging'])
            : null,
        s3InitiateRestoreObject: json.containsKey('S3InitiateRestoreObject')
            ? S3InitiateRestoreObjectOperation.fromJson(
                json['S3InitiateRestoreObject'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the total number of tasks that the specified job has executed, the
/// number of tasks that succeeded, and the number of tasks that failed.
class JobProgressSummary {
  final BigInt totalNumberOfTasks;

  final BigInt numberOfTasksSucceeded;

  final BigInt numberOfTasksFailed;

  JobProgressSummary({
    this.totalNumberOfTasks,
    this.numberOfTasksSucceeded,
    this.numberOfTasksFailed,
  });
  static JobProgressSummary fromJson(Map<String, dynamic> json) =>
      JobProgressSummary(
        totalNumberOfTasks: json.containsKey('TotalNumberOfTasks')
            ? BigInt.from(json['TotalNumberOfTasks'])
            : null,
        numberOfTasksSucceeded: json.containsKey('NumberOfTasksSucceeded')
            ? BigInt.from(json['NumberOfTasksSucceeded'])
            : null,
        numberOfTasksFailed: json.containsKey('NumberOfTasksFailed')
            ? BigInt.from(json['NumberOfTasksFailed'])
            : null,
      );
}

/// Contains the configuration parameters for a job-completion report.
class JobReport {
  /// The bucket where specified job-completion report will be stored.
  final String bucket;

  /// The format of the specified job-completion report.
  final String format;

  /// Indicates whether the specified job will generate a job-completion report.
  final bool enabled;

  /// An optional prefix to describe where in the specified bucket the
  /// job-completion report will be stored. Amazon S3 will store the
  /// job-completion report at <prefix>/job-<job-id>/report.json.
  final String prefix;

  /// Indicates whether the job-completion report will include details of all
  /// tasks or only failed tasks.
  final String reportScope;

  JobReport({
    this.bucket,
    this.format,
    @required this.enabled,
    this.prefix,
    this.reportScope,
  });
  static JobReport fromJson(Map<String, dynamic> json) => JobReport(
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        format: json.containsKey('Format') ? json['Format'] as String : null,
        enabled: json['Enabled'] as bool,
        prefix: json.containsKey('Prefix') ? json['Prefix'] as String : null,
        reportScope: json.containsKey('ReportScope')
            ? json['ReportScope'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the configuration parameters for a `Lambda Invoke` operation.
class LambdaInvokeOperation {
  /// The Amazon Resource Name (ARN) for the AWS Lambda function that the
  /// specified job will invoke for each object in the manifest.
  final String functionArn;

  LambdaInvokeOperation({
    this.functionArn,
  });
  static LambdaInvokeOperation fromJson(Map<String, dynamic> json) =>
      LambdaInvokeOperation(
        functionArn: json.containsKey('FunctionArn')
            ? json['FunctionArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListJobsResult {
  /// If the `List Jobs` request produced more than the maximum number of
  /// results, you can pass this value into a subsequent `List Jobs` request in
  /// order to retrieve the next page of results.
  final String nextToken;

  /// The list of current jobs and jobs that have ended within the last 30 days.
  final List<JobListDescriptor> jobs;

  ListJobsResult({
    this.nextToken,
    this.jobs,
  });
  static ListJobsResult fromJson(Map<String, dynamic> json) => ListJobsResult(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        jobs: json.containsKey('Jobs')
            ? (json['Jobs'] as List)
                .map((e) => JobListDescriptor.fromJson(e))
                .toList()
            : null,
      );
}

class PublicAccessBlockConfiguration {
  final bool blockPublicAcls;

  final bool ignorePublicAcls;

  final bool blockPublicPolicy;

  final bool restrictPublicBuckets;

  PublicAccessBlockConfiguration({
    this.blockPublicAcls,
    this.ignorePublicAcls,
    this.blockPublicPolicy,
    this.restrictPublicBuckets,
  });
  static PublicAccessBlockConfiguration fromJson(Map<String, dynamic> json) =>
      PublicAccessBlockConfiguration(
        blockPublicAcls: json.containsKey('BlockPublicAcls')
            ? json['BlockPublicAcls'] as bool
            : null,
        ignorePublicAcls: json.containsKey('IgnorePublicAcls')
            ? json['IgnorePublicAcls'] as bool
            : null,
        blockPublicPolicy: json.containsKey('BlockPublicPolicy')
            ? json['BlockPublicPolicy'] as bool
            : null,
        restrictPublicBuckets: json.containsKey('RestrictPublicBuckets')
            ? json['RestrictPublicBuckets'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3AccessControlList {
  final S3ObjectOwner owner;

  final List<S3Grant> grants;

  S3AccessControlList({
    @required this.owner,
    this.grants,
  });
  static S3AccessControlList fromJson(Map<String, dynamic> json) =>
      S3AccessControlList(
        owner: S3ObjectOwner.fromJson(json['Owner']),
        grants: json.containsKey('Grants')
            ? (json['Grants'] as List).map((e) => S3Grant.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3AccessControlPolicy {
  final S3AccessControlList accessControlList;

  final String cannedAccessControlList;

  S3AccessControlPolicy({
    this.accessControlList,
    this.cannedAccessControlList,
  });
  static S3AccessControlPolicy fromJson(Map<String, dynamic> json) =>
      S3AccessControlPolicy(
        accessControlList: json.containsKey('AccessControlList')
            ? S3AccessControlList.fromJson(json['AccessControlList'])
            : null,
        cannedAccessControlList: json.containsKey('CannedAccessControlList')
            ? json['CannedAccessControlList'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the configuration parameters for a PUT Copy object operation.
/// Amazon S3 batch operations passes each value through to the underlying PUT
/// Copy object API. For more information about the parameters for this
/// operation, see
/// [PUT Object - Copy](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectCOPY.html).
class S3CopyObjectOperation {
  final String targetResource;

  final String cannedAccessControlList;

  final List<S3Grant> accessControlGrants;

  final String metadataDirective;

  final DateTime modifiedSinceConstraint;

  final S3ObjectMetadata newObjectMetadata;

  final List<S3Tag> newObjectTagging;

  final String redirectLocation;

  final bool requesterPays;

  final String storageClass;

  final DateTime unModifiedSinceConstraint;

  final String sseAwsKmsKeyId;

  final String targetKeyPrefix;

  final String objectLockLegalHoldStatus;

  final String objectLockMode;

  final DateTime objectLockRetainUntilDate;

  S3CopyObjectOperation({
    this.targetResource,
    this.cannedAccessControlList,
    this.accessControlGrants,
    this.metadataDirective,
    this.modifiedSinceConstraint,
    this.newObjectMetadata,
    this.newObjectTagging,
    this.redirectLocation,
    this.requesterPays,
    this.storageClass,
    this.unModifiedSinceConstraint,
    this.sseAwsKmsKeyId,
    this.targetKeyPrefix,
    this.objectLockLegalHoldStatus,
    this.objectLockMode,
    this.objectLockRetainUntilDate,
  });
  static S3CopyObjectOperation fromJson(Map<String, dynamic> json) =>
      S3CopyObjectOperation(
        targetResource: json.containsKey('TargetResource')
            ? json['TargetResource'] as String
            : null,
        cannedAccessControlList: json.containsKey('CannedAccessControlList')
            ? json['CannedAccessControlList'] as String
            : null,
        accessControlGrants: json.containsKey('AccessControlGrants')
            ? (json['AccessControlGrants'] as List)
                .map((e) => S3Grant.fromJson(e))
                .toList()
            : null,
        metadataDirective: json.containsKey('MetadataDirective')
            ? json['MetadataDirective'] as String
            : null,
        modifiedSinceConstraint: json.containsKey('ModifiedSinceConstraint')
            ? DateTime.parse(json['ModifiedSinceConstraint'])
            : null,
        newObjectMetadata: json.containsKey('NewObjectMetadata')
            ? S3ObjectMetadata.fromJson(json['NewObjectMetadata'])
            : null,
        newObjectTagging: json.containsKey('NewObjectTagging')
            ? (json['NewObjectTagging'] as List)
                .map((e) => S3Tag.fromJson(e))
                .toList()
            : null,
        redirectLocation: json.containsKey('RedirectLocation')
            ? json['RedirectLocation'] as String
            : null,
        requesterPays: json.containsKey('RequesterPays')
            ? json['RequesterPays'] as bool
            : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
        unModifiedSinceConstraint: json.containsKey('UnModifiedSinceConstraint')
            ? DateTime.parse(json['UnModifiedSinceConstraint'])
            : null,
        sseAwsKmsKeyId: json.containsKey('SSEAwsKmsKeyId')
            ? json['SSEAwsKmsKeyId'] as String
            : null,
        targetKeyPrefix: json.containsKey('TargetKeyPrefix')
            ? json['TargetKeyPrefix'] as String
            : null,
        objectLockLegalHoldStatus: json.containsKey('ObjectLockLegalHoldStatus')
            ? json['ObjectLockLegalHoldStatus'] as String
            : null,
        objectLockMode: json.containsKey('ObjectLockMode')
            ? json['ObjectLockMode'] as String
            : null,
        objectLockRetainUntilDate: json.containsKey('ObjectLockRetainUntilDate')
            ? DateTime.parse(json['ObjectLockRetainUntilDate'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3Grant {
  final S3Grantee grantee;

  final String permission;

  S3Grant({
    this.grantee,
    this.permission,
  });
  static S3Grant fromJson(Map<String, dynamic> json) => S3Grant(
        grantee: json.containsKey('Grantee')
            ? S3Grantee.fromJson(json['Grantee'])
            : null,
        permission: json.containsKey('Permission')
            ? json['Permission'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3Grantee {
  final String typeIdentifier;

  final String identifier;

  final String displayName;

  S3Grantee({
    this.typeIdentifier,
    this.identifier,
    this.displayName,
  });
  static S3Grantee fromJson(Map<String, dynamic> json) => S3Grantee(
        typeIdentifier: json.containsKey('TypeIdentifier')
            ? json['TypeIdentifier'] as String
            : null,
        identifier: json.containsKey('Identifier')
            ? json['Identifier'] as String
            : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the configuration parameters for an Initiate Glacier Restore job.
/// Amazon S3 batch operations passes each value through to the underlying POST
/// Object restore API. For more information about the parameters for this
/// operation, see
/// [Restoring Archives](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOSTrestore.html#RESTObjectPOSTrestore-restore-request).
class S3InitiateRestoreObjectOperation {
  final int expirationInDays;

  final String glacierJobTier;

  S3InitiateRestoreObjectOperation({
    this.expirationInDays,
    this.glacierJobTier,
  });
  static S3InitiateRestoreObjectOperation fromJson(Map<String, dynamic> json) =>
      S3InitiateRestoreObjectOperation(
        expirationInDays: json.containsKey('ExpirationInDays')
            ? json['ExpirationInDays'] as int
            : null,
        glacierJobTier: json.containsKey('GlacierJobTier')
            ? json['GlacierJobTier'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3ObjectMetadata {
  final String cacheControl;

  final String contentDisposition;

  final String contentEncoding;

  final String contentLanguage;

  final Map<String, String> userMetadata;

  final BigInt contentLength;

  final String contentMd5;

  final String contentType;

  final DateTime httpExpiresDate;

  final bool requesterCharged;

  final String sseAlgorithm;

  S3ObjectMetadata({
    this.cacheControl,
    this.contentDisposition,
    this.contentEncoding,
    this.contentLanguage,
    this.userMetadata,
    this.contentLength,
    this.contentMd5,
    this.contentType,
    this.httpExpiresDate,
    this.requesterCharged,
    this.sseAlgorithm,
  });
  static S3ObjectMetadata fromJson(Map<String, dynamic> json) =>
      S3ObjectMetadata(
        cacheControl: json.containsKey('CacheControl')
            ? json['CacheControl'] as String
            : null,
        contentDisposition: json.containsKey('ContentDisposition')
            ? json['ContentDisposition'] as String
            : null,
        contentEncoding: json.containsKey('ContentEncoding')
            ? json['ContentEncoding'] as String
            : null,
        contentLanguage: json.containsKey('ContentLanguage')
            ? json['ContentLanguage'] as String
            : null,
        userMetadata: json.containsKey('UserMetadata')
            ? (json['UserMetadata'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
        contentMd5: json.containsKey('ContentMD5')
            ? json['ContentMD5'] as String
            : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        httpExpiresDate: json.containsKey('HttpExpiresDate')
            ? DateTime.parse(json['HttpExpiresDate'])
            : null,
        requesterCharged: json.containsKey('RequesterCharged')
            ? json['RequesterCharged'] as bool
            : null,
        sseAlgorithm: json.containsKey('SSEAlgorithm')
            ? json['SSEAlgorithm'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3ObjectOwner {
  final String id;

  final String displayName;

  S3ObjectOwner({
    this.id,
    this.displayName,
  });
  static S3ObjectOwner fromJson(Map<String, dynamic> json) => S3ObjectOwner(
        id: json.containsKey('ID') ? json['ID'] as String : null,
        displayName: json.containsKey('DisplayName')
            ? json['DisplayName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the configuration parameters for a Set Object ACL operation. Amazon
/// S3 batch operations passes each value through to the underlying PUT Object
/// acl API. For more information about the parameters for this operation, see
/// [PUT Object acl](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTacl.html).
class S3SetObjectAclOperation {
  final S3AccessControlPolicy accessControlPolicy;

  S3SetObjectAclOperation({
    this.accessControlPolicy,
  });
  static S3SetObjectAclOperation fromJson(Map<String, dynamic> json) =>
      S3SetObjectAclOperation(
        accessControlPolicy: json.containsKey('AccessControlPolicy')
            ? S3AccessControlPolicy.fromJson(json['AccessControlPolicy'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the configuration parameters for a Set Object Tagging operation.
/// Amazon S3 batch operations passes each value through to the underlying PUT
/// Object tagging API. For more information about the parameters for this
/// operation, see
/// [PUT Object tagging](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPUTtagging.html).
class S3SetObjectTaggingOperation {
  final List<S3Tag> tagSet;

  S3SetObjectTaggingOperation({
    this.tagSet,
  });
  static S3SetObjectTaggingOperation fromJson(Map<String, dynamic> json) =>
      S3SetObjectTaggingOperation(
        tagSet: json.containsKey('TagSet')
            ? (json['TagSet'] as List).map((e) => S3Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class S3Tag {
  final String key;

  final String value;

  S3Tag({
    @required this.key,
    @required this.value,
  });
  static S3Tag fromJson(Map<String, dynamic> json) => S3Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateJobPriorityResult {
  /// The ID for the job whose priority Amazon S3 updated.
  final String jobId;

  /// The new priority assigned to the specified job.
  final int priority;

  UpdateJobPriorityResult({
    @required this.jobId,
    @required this.priority,
  });
  static UpdateJobPriorityResult fromJson(Map<String, dynamic> json) =>
      UpdateJobPriorityResult(
        jobId: json['JobId'] as String,
        priority: json['Priority'] as int,
      );
}

class UpdateJobStatusResult {
  /// The ID for the job whose status was updated.
  final String jobId;

  /// The current status for the specified job.
  final String status;

  /// The reason that the specified job's status was updated.
  final String statusUpdateReason;

  UpdateJobStatusResult({
    this.jobId,
    this.status,
    this.statusUpdateReason,
  });
  static UpdateJobStatusResult fromJson(Map<String, dynamic> json) =>
      UpdateJobStatusResult(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusUpdateReason: json.containsKey('StatusUpdateReason')
            ? json['StatusUpdateReason'] as String
            : null,
      );
}
