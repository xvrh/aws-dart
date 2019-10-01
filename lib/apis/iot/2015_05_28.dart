import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS IoT
///
/// AWS IoT provides secure, bi-directional communication between
/// Internet-connected devices (such as sensors, actuators, embedded devices, or
/// smart appliances) and the AWS cloud. You can discover your custom IoT-Data
/// endpoint to communicate with, configure rules for data processing and
/// integration with other services, organize resources associated with each
/// device (Registry), configure logging, and create and manage policies and
/// credentials to authenticate devices.
///
/// For more information about how AWS IoT works, see the
/// [Developer Guide](https://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html).
///
/// For information about how to use the credentials provider for AWS IoT, see
/// [Authorizing Direct Calls to AWS Services](https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html).
class IotApi {
  final _client;
  IotApi(client) : _client = client.configured('IoT', serializer: 'rest-json');

  /// Accepts a pending certificate transfer. The default state of the
  /// certificate is INACTIVE.
  ///
  /// To check for pending certificate transfers, call ListCertificates to
  /// enumerate your certificates.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  ///
  /// [setAsActive]: Specifies whether the certificate is active.
  Future<void> acceptCertificateTransfer(String certificateId,
      {bool setAsActive}) async {
    await _client.send('AcceptCertificateTransfer', {
      'certificateId': certificateId,
      if (setAsActive != null) 'setAsActive': setAsActive,
    });
  }

  /// Adds a thing to a billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  ///
  /// [billingGroupArn]: The ARN of the billing group.
  ///
  /// [thingName]: The name of the thing to be added to the billing group.
  ///
  /// [thingArn]: The ARN of the thing to be added to the billing group.
  Future<AddThingToBillingGroupResponse> addThingToBillingGroup(
      {String billingGroupName,
      String billingGroupArn,
      String thingName,
      String thingArn}) async {
    var response_ = await _client.send('AddThingToBillingGroup', {
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (thingName != null) 'thingName': thingName,
      if (thingArn != null) 'thingArn': thingArn,
    });
    return AddThingToBillingGroupResponse.fromJson(response_);
  }

  /// Adds a thing to a thing group.
  ///
  /// [thingGroupName]: The name of the group to which you are adding a thing.
  ///
  /// [thingGroupArn]: The ARN of the group to which you are adding a thing.
  ///
  /// [thingName]: The name of the thing to add to a group.
  ///
  /// [thingArn]: The ARN of the thing to add to a group.
  ///
  /// [overrideDynamicGroups]: Override dynamic thing groups with static thing
  /// groups when 10-group limit is reached. If a thing belongs to 10 thing
  /// groups, and one or more of those groups are dynamic thing groups, adding a
  /// thing to a static group removes the thing from the last dynamic group.
  Future<AddThingToThingGroupResponse> addThingToThingGroup(
      {String thingGroupName,
      String thingGroupArn,
      String thingName,
      String thingArn,
      bool overrideDynamicGroups}) async {
    var response_ = await _client.send('AddThingToThingGroup', {
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingName != null) 'thingName': thingName,
      if (thingArn != null) 'thingArn': thingArn,
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
    });
    return AddThingToThingGroupResponse.fromJson(response_);
  }

  /// Associates a group with a continuous job. The following criteria must be
  /// met:
  ///
  /// *   The job must have been created with the `targetSelection` field set to
  /// "CONTINUOUS".
  ///
  /// *   The job status must currently be "IN_PROGRESS".
  ///
  /// *   The total number of targets associated with a job must not exceed 100.
  ///
  /// [targets]: A list of thing group ARNs that define the targets of the job.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  ///
  /// [comment]: An optional comment string describing why the job was
  /// associated with the targets.
  Future<AssociateTargetsWithJobResponse> associateTargetsWithJob(
      {@required List<String> targets,
      @required String jobId,
      String comment}) async {
    var response_ = await _client.send('AssociateTargetsWithJob', {
      'targets': targets,
      'jobId': jobId,
      if (comment != null) 'comment': comment,
    });
    return AssociateTargetsWithJobResponse.fromJson(response_);
  }

  /// Attaches a policy to the specified target.
  ///
  /// [policyName]: The name of the policy to attach.
  ///
  /// [target]: The
  /// [identity](https://docs.aws.amazon.com/iot/latest/developerguide/iot-security-identity.html)
  /// to which the policy is attached.
  Future<void> attachPolicy(
      {@required String policyName, @required String target}) async {
    await _client.send('AttachPolicy', {
      'policyName': policyName,
      'target': target,
    });
  }

  /// Attaches the specified policy to the specified principal (certificate or
  /// other credential).
  ///
  ///  **Note:** This API is deprecated. Please use AttachPolicy instead.
  ///
  /// [policyName]: The policy name.
  ///
  /// [principal]: The principal, which can be a certificate ARN (as returned
  /// from the CreateCertificate operation) or an Amazon Cognito ID.
  Future<void> attachPrincipalPolicy(
      {@required String policyName, @required String principal}) async {
    await _client.send('AttachPrincipalPolicy', {
      'policyName': policyName,
      'principal': principal,
    });
  }

  /// Associates a Device Defender security profile with a thing group or this
  /// account. Each thing group or account can have up to five security profiles
  /// associated with it.
  ///
  /// [securityProfileName]: The security profile that is attached.
  ///
  /// [securityProfileTargetArn]: The ARN of the target (thing group) to which
  /// the security profile is attached.
  Future<AttachSecurityProfileResponse> attachSecurityProfile(
      {@required String securityProfileName,
      @required String securityProfileTargetArn}) async {
    var response_ = await _client.send('AttachSecurityProfile', {
      'securityProfileName': securityProfileName,
      'securityProfileTargetArn': securityProfileTargetArn,
    });
    return AttachSecurityProfileResponse.fromJson(response_);
  }

  /// Attaches the specified principal to the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// [thingName]: The name of the thing.
  ///
  /// [principal]: The principal, such as a certificate or other credential.
  Future<AttachThingPrincipalResponse> attachThingPrincipal(
      {@required String thingName, @required String principal}) async {
    var response_ = await _client.send('AttachThingPrincipal', {
      'thingName': thingName,
      'principal': principal,
    });
    return AttachThingPrincipalResponse.fromJson(response_);
  }

  /// Cancels a mitigation action task that is in progress. If the task is not
  /// in progress, an InvalidRequestException occurs.
  ///
  /// [taskId]: The unique identifier for the task that you want to cancel.
  Future<CancelAuditMitigationActionsTaskResponse>
      cancelAuditMitigationActionsTask(String taskId) async {
    var response_ = await _client.send('CancelAuditMitigationActionsTask', {
      'taskId': taskId,
    });
    return CancelAuditMitigationActionsTaskResponse.fromJson(response_);
  }

  /// Cancels an audit that is in progress. The audit can be either scheduled or
  /// on-demand. If the audit is not in progress, an "InvalidRequestException"
  /// occurs.
  ///
  /// [taskId]: The ID of the audit you want to cancel. You can only cancel an
  /// audit that is "IN_PROGRESS".
  Future<CancelAuditTaskResponse> cancelAuditTask(String taskId) async {
    var response_ = await _client.send('CancelAuditTask', {
      'taskId': taskId,
    });
    return CancelAuditTaskResponse.fromJson(response_);
  }

  /// Cancels a pending transfer for the specified certificate.
  ///
  ///  **Note** Only the transfer source account can use this operation to
  /// cancel a transfer. (Transfer destinations can use
  /// RejectCertificateTransfer instead.) After transfer, AWS IoT returns the
  /// certificate to the source account in the INACTIVE state. After the
  /// destination account has accepted the transfer, the transfer cannot be
  /// cancelled.
  ///
  /// After a certificate transfer is cancelled, the status of the certificate
  /// changes from PENDING_TRANSFER to INACTIVE.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  Future<void> cancelCertificateTransfer(String certificateId) async {
    await _client.send('CancelCertificateTransfer', {
      'certificateId': certificateId,
    });
  }

  /// Cancels a job.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  ///
  /// [reasonCode]: (Optional)A reason code string that explains why the job was
  /// canceled.
  ///
  /// [comment]: An optional comment string describing why the job was canceled.
  ///
  /// [force]: (Optional) If `true` job executions with status "IN_PROGRESS" and
  /// "QUEUED" are canceled, otherwise only job executions with status "QUEUED"
  /// are canceled. The default is `false`.
  ///
  /// Canceling a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to update the job execution status. Use
  /// caution and ensure that each device executing a job which is canceled is
  /// able to recover to a valid state.
  Future<CancelJobResponse> cancelJob(String jobId,
      {String reasonCode, String comment, bool force}) async {
    var response_ = await _client.send('CancelJob', {
      'jobId': jobId,
      if (reasonCode != null) 'reasonCode': reasonCode,
      if (comment != null) 'comment': comment,
      if (force != null) 'force': force,
    });
    return CancelJobResponse.fromJson(response_);
  }

  /// Cancels the execution of a job for a given thing.
  ///
  /// [jobId]: The ID of the job to be canceled.
  ///
  /// [thingName]: The name of the thing whose execution of the job will be
  /// canceled.
  ///
  /// [force]: (Optional) If `true` the job execution will be canceled if it has
  /// status IN_PROGRESS or QUEUED, otherwise the job execution will be canceled
  /// only if it has status QUEUED. If you attempt to cancel a job execution
  /// that is IN_PROGRESS, and you do not set `force` to `true`, then an
  /// `InvalidStateTransitionException` will be thrown. The default is `false`.
  ///
  /// Canceling a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to update the job execution status. Use caution and ensure that
  /// the device is able to recover to a valid state.
  ///
  /// [expectedVersion]: (Optional) The expected current version of the job
  /// execution. Each time you update the job execution, its version is
  /// incremented. If the version of the job execution stored in Jobs does not
  /// match, the update is rejected with a VersionMismatch error, and an
  /// ErrorResponse that contains the current job execution status data is
  /// returned. (This makes it unnecessary to perform a separate
  /// DescribeJobExecution request in order to obtain the job execution status
  /// data.)
  ///
  /// [statusDetails]: A collection of name/value pairs that describe the status
  /// of the job execution. If not specified, the statusDetails are unchanged.
  /// You can specify at most 10 name/value pairs.
  Future<void> cancelJobExecution(
      {@required String jobId,
      @required String thingName,
      bool force,
      BigInt expectedVersion,
      Map<String, String> statusDetails}) async {
    await _client.send('CancelJobExecution', {
      'jobId': jobId,
      'thingName': thingName,
      if (force != null) 'force': force,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (statusDetails != null) 'statusDetails': statusDetails,
    });
  }

  /// Clears the default authorizer.
  Future<ClearDefaultAuthorizerResponse> clearDefaultAuthorizer() async {
    var response_ = await _client.send('ClearDefaultAuthorizer', {});
    return ClearDefaultAuthorizerResponse.fromJson(response_);
  }

  /// Creates an authorizer.
  ///
  /// [authorizerName]: The authorizer name.
  ///
  /// [authorizerFunctionArn]: The ARN of the authorizer's Lambda function.
  ///
  /// [tokenKeyName]: The name of the token key used to extract the token from
  /// the HTTP headers.
  ///
  /// [tokenSigningPublicKeys]: The public keys used to verify the digital
  /// signature returned by your custom authentication service.
  ///
  /// [status]: The status of the create authorizer request.
  Future<CreateAuthorizerResponse> createAuthorizer(
      {@required String authorizerName,
      @required String authorizerFunctionArn,
      @required String tokenKeyName,
      @required Map<String, String> tokenSigningPublicKeys,
      String status}) async {
    var response_ = await _client.send('CreateAuthorizer', {
      'authorizerName': authorizerName,
      'authorizerFunctionArn': authorizerFunctionArn,
      'tokenKeyName': tokenKeyName,
      'tokenSigningPublicKeys': tokenSigningPublicKeys,
      if (status != null) 'status': status,
    });
    return CreateAuthorizerResponse.fromJson(response_);
  }

  /// Creates a billing group.
  ///
  /// [billingGroupName]: The name you wish to give to the billing group.
  ///
  /// [billingGroupProperties]: The properties of the billing group.
  ///
  /// [tags]: Metadata which can be used to manage the billing group.
  Future<CreateBillingGroupResponse> createBillingGroup(String billingGroupName,
      {BillingGroupProperties billingGroupProperties, List<Tag> tags}) async {
    var response_ = await _client.send('CreateBillingGroup', {
      'billingGroupName': billingGroupName,
      if (billingGroupProperties != null)
        'billingGroupProperties': billingGroupProperties,
      if (tags != null) 'tags': tags,
    });
    return CreateBillingGroupResponse.fromJson(response_);
  }

  /// Creates an X.509 certificate using the specified certificate signing
  /// request.
  ///
  ///  **Note:** The CSR must include a public key that is either an RSA key
  /// with a length of at least 2048 bits or an ECC key from NIST P-256 or NIST
  /// P-384 curves.
  ///
  ///  **Note:** Reusing the same certificate signing request (CSR) results in a
  /// distinct certificate.
  ///
  /// You can create multiple certificates in a batch by creating a directory,
  /// copying multiple .csr files into that directory, and then specifying that
  /// directory on the command line. The following commands show how to create a
  /// batch of certificates given a batch of CSRs.
  ///
  /// Assuming a set of CSRs are located inside of the directory
  /// my-csr-directory:
  ///
  /// On Linux and OS X, the command is:
  ///
  /// $ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr
  /// --certificate-signing-request file://my-csr-directory/{}
  ///
  /// This command lists all of the CSRs in my-csr-directory and pipes each CSR
  /// file name to the aws iot create-certificate-from-csr AWS CLI command to
  /// create a certificate for the corresponding CSR.
  ///
  /// The aws iot create-certificate-from-csr part of the command can also be
  /// run in parallel to speed up the certificate creation process:
  ///
  /// $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot
  /// create-certificate-from-csr --certificate-signing-request
  /// file://my-csr-directory/{}
  ///
  /// On Windows PowerShell, the command to create certificates for all CSRs in
  /// my-csr-directory is:
  ///
  /// > ls -Name my-csr-directory | %{aws iot create-certificate-from-csr
  /// --certificate-signing-request file://my-csr-directory/$_}
  ///
  /// On a Windows command prompt, the command to create certificates for all
  /// CSRs in my-csr-directory is:
  ///
  /// > forfiles /p my-csr-directory /c "cmd /c aws iot
  /// create-certificate-from-csr --certificate-signing-request file://@path"
  ///
  /// [certificateSigningRequest]: The certificate signing request (CSR).
  ///
  /// [setAsActive]: Specifies whether the certificate is active.
  Future<CreateCertificateFromCsrResponse> createCertificateFromCsr(
      String certificateSigningRequest,
      {bool setAsActive}) async {
    var response_ = await _client.send('CreateCertificateFromCsr', {
      'certificateSigningRequest': certificateSigningRequest,
      if (setAsActive != null) 'setAsActive': setAsActive,
    });
    return CreateCertificateFromCsrResponse.fromJson(response_);
  }

  /// Creates a dynamic thing group.
  ///
  /// [thingGroupName]: The dynamic thing group name to create.
  ///
  /// [thingGroupProperties]: The dynamic thing group properties.
  ///
  /// [indexName]: The dynamic thing group index name.
  ///
  ///
  ///
  /// Currently one index is supported: "AWS_Things".
  ///
  /// [queryString]: The dynamic thing group search query string.
  ///
  /// See
  /// [Query Syntax](https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html)
  /// for information about query string syntax.
  ///
  /// [queryVersion]: The dynamic thing group query version.
  ///
  ///
  ///
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  ///
  /// [tags]: Metadata which can be used to manage the dynamic thing group.
  Future<CreateDynamicThingGroupResponse> createDynamicThingGroup(
      {@required String thingGroupName,
      ThingGroupProperties thingGroupProperties,
      String indexName,
      @required String queryString,
      String queryVersion,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateDynamicThingGroup', {
      'thingGroupName': thingGroupName,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
      if (indexName != null) 'indexName': indexName,
      'queryString': queryString,
      if (queryVersion != null) 'queryVersion': queryVersion,
      if (tags != null) 'tags': tags,
    });
    return CreateDynamicThingGroupResponse.fromJson(response_);
  }

  /// Creates a job.
  ///
  /// [jobId]: A job identifier which must be unique for your AWS account. We
  /// recommend using a UUID. Alpha-numeric characters, "-" and "_" are valid
  /// for use here.
  ///
  /// [targets]: A list of things and thing groups to which the job should be
  /// sent.
  ///
  /// [documentSource]: An S3 link to the job document.
  ///
  /// [document]: The job document.
  ///
  ///
  ///
  /// If the job document resides in an S3 bucket, you must use a placeholder
  /// link when specifying the document.
  ///
  /// The placeholder link is of the following form:
  ///
  ///  `${aws:iot:s3-presigned-url:https://s3.amazonaws.com/_bucket_/_key_}`
  ///
  /// where _bucket_ is your bucket name and _key_ is the object in the bucket
  /// to which you are linking.
  ///
  /// [description]: A short text description of the job.
  ///
  /// [presignedUrlConfig]: Configuration information for pre-signed S3 URLs.
  ///
  /// [targetSelection]: Specifies whether the job will continue to run
  /// (CONTINUOUS), or will be complete after all those things specified as
  /// targets have completed the job (SNAPSHOT). If continuous, the job may also
  /// be run on a thing when a change is detected in a target. For example, a
  /// job will run on a thing when the thing is added to a target group, even
  /// after the job was completed by all things originally in the group.
  ///
  /// [jobExecutionsRolloutConfig]: Allows you to create a staged rollout of the
  /// job.
  ///
  /// [abortConfig]: Allows you to create criteria to abort a job.
  ///
  /// [timeoutConfig]: Specifies the amount of time each device has to finish
  /// its execution of the job. The timer is started when the job execution
  /// status is set to `IN_PROGRESS`. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to `TIMED_OUT`.
  ///
  /// [tags]: Metadata which can be used to manage the job.
  Future<CreateJobResponse> createJob(
      {@required String jobId,
      @required List<String> targets,
      String documentSource,
      String document,
      String description,
      PresignedUrlConfig presignedUrlConfig,
      String targetSelection,
      JobExecutionsRolloutConfig jobExecutionsRolloutConfig,
      AbortConfig abortConfig,
      TimeoutConfig timeoutConfig,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateJob', {
      'jobId': jobId,
      'targets': targets,
      if (documentSource != null) 'documentSource': documentSource,
      if (document != null) 'document': document,
      if (description != null) 'description': description,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (targetSelection != null) 'targetSelection': targetSelection,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
      if (tags != null) 'tags': tags,
    });
    return CreateJobResponse.fromJson(response_);
  }

  /// Creates a 2048-bit RSA key pair and issues an X.509 certificate using the
  /// issued public key.
  ///
  ///  **Note** This is the only time AWS IoT issues the private key for this
  /// certificate, so it is important to keep it in a secure location.
  ///
  /// [setAsActive]: Specifies whether the certificate is active.
  Future<CreateKeysAndCertificateResponse> createKeysAndCertificate(
      {bool setAsActive}) async {
    var response_ = await _client.send('CreateKeysAndCertificate', {
      if (setAsActive != null) 'setAsActive': setAsActive,
    });
    return CreateKeysAndCertificateResponse.fromJson(response_);
  }

  /// Defines an action that can be applied to audit findings by using
  /// StartAuditMitigationActionsTask. Each mitigation action can apply only one
  /// type of change.
  ///
  /// [actionName]: A friendly name for the action. Choose a friendly name that
  /// accurately describes the action (for example, `EnableLoggingAction`).
  ///
  /// [roleArn]: The ARN of the IAM role that is used to apply the mitigation
  /// action.
  ///
  /// [actionParams]: Defines the type of action and the parameters for that
  /// action.
  ///
  /// [tags]: Metadata that can be used to manage the mitigation action.
  Future<CreateMitigationActionResponse> createMitigationAction(
      {@required String actionName,
      @required String roleArn,
      @required MitigationActionParams actionParams,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateMitigationAction', {
      'actionName': actionName,
      'roleArn': roleArn,
      'actionParams': actionParams,
      if (tags != null) 'tags': tags,
    });
    return CreateMitigationActionResponse.fromJson(response_);
  }

  /// Creates an AWS IoT OTAUpdate on a target group of things or groups.
  ///
  /// [otaUpdateId]: The ID of the OTA update to be created.
  ///
  /// [description]: The description of the OTA update.
  ///
  /// [targets]: The targeted devices to receive OTA updates.
  ///
  /// [targetSelection]: Specifies whether the update will continue to run
  /// (CONTINUOUS), or will be complete after all the things specified as
  /// targets have completed the update (SNAPSHOT). If continuous, the update
  /// may also be run on a thing when a change is detected in a target. For
  /// example, an update will run on a thing when the thing is added to a target
  /// group, even after the update was completed by all things originally in the
  /// group. Valid values: CONTINUOUS | SNAPSHOT.
  ///
  /// [awsJobExecutionsRolloutConfig]: Configuration for the rollout of OTA
  /// updates.
  ///
  /// [files]: The files to be streamed by the OTA update.
  ///
  /// [roleArn]: The IAM role that allows access to the AWS IoT Jobs service.
  ///
  /// [additionalParameters]: A list of additional OTA update parameters which
  /// are name-value pairs.
  ///
  /// [tags]: Metadata which can be used to manage updates.
  Future<CreateOtaUpdateResponse> createOtaUpdate(
      {@required String otaUpdateId,
      String description,
      @required List<String> targets,
      String targetSelection,
      AwsJobExecutionsRolloutConfig awsJobExecutionsRolloutConfig,
      @required List<OtaUpdateFile> files,
      @required String roleArn,
      Map<String, String> additionalParameters,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateOTAUpdate', {
      'otaUpdateId': otaUpdateId,
      if (description != null) 'description': description,
      'targets': targets,
      if (targetSelection != null) 'targetSelection': targetSelection,
      if (awsJobExecutionsRolloutConfig != null)
        'awsJobExecutionsRolloutConfig': awsJobExecutionsRolloutConfig,
      'files': files,
      'roleArn': roleArn,
      if (additionalParameters != null)
        'additionalParameters': additionalParameters,
      if (tags != null) 'tags': tags,
    });
    return CreateOtaUpdateResponse.fromJson(response_);
  }

  /// Creates an AWS IoT policy.
  ///
  /// The created policy is the default version for the policy. This operation
  /// creates a policy version with a version identifier of **1** and sets **1**
  /// as the policy's default version.
  ///
  /// [policyName]: The policy name.
  ///
  /// [policyDocument]: The JSON document that describes the policy.
  /// **policyDocument** must have a minimum length of 1, with a maximum length
  /// of 2048, excluding whitespace.
  Future<CreatePolicyResponse> createPolicy(
      {@required String policyName, @required String policyDocument}) async {
    var response_ = await _client.send('CreatePolicy', {
      'policyName': policyName,
      'policyDocument': policyDocument,
    });
    return CreatePolicyResponse.fromJson(response_);
  }

  /// Creates a new version of the specified AWS IoT policy. To update a policy,
  /// create a new policy version. A managed policy can have up to five
  /// versions. If the policy has five versions, you must use
  /// DeletePolicyVersion to delete an existing version before you create a new
  /// one.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the operative version (that is, the version that is
  /// in effect for the certificates to which the policy is attached).
  ///
  /// [policyName]: The policy name.
  ///
  /// [policyDocument]: The JSON document that describes the policy. Minimum
  /// length of 1. Maximum length of 2048, excluding whitespace.
  ///
  /// [setAsDefault]: Specifies whether the policy version is set as the
  /// default. When this parameter is true, the new policy version becomes the
  /// operative version (that is, the version that is in effect for the
  /// certificates to which the policy is attached).
  Future<CreatePolicyVersionResponse> createPolicyVersion(
      {@required String policyName,
      @required String policyDocument,
      bool setAsDefault}) async {
    var response_ = await _client.send('CreatePolicyVersion', {
      'policyName': policyName,
      'policyDocument': policyDocument,
      if (setAsDefault != null) 'setAsDefault': setAsDefault,
    });
    return CreatePolicyVersionResponse.fromJson(response_);
  }

  /// Creates a role alias.
  ///
  /// [roleAlias]: The role alias that points to a role ARN. This allows you to
  /// change the role without having to update the device.
  ///
  /// [roleArn]: The role ARN.
  ///
  /// [credentialDurationSeconds]: How long (in seconds) the credentials will be
  /// valid.
  Future<CreateRoleAliasResponse> createRoleAlias(
      {@required String roleAlias,
      @required String roleArn,
      int credentialDurationSeconds}) async {
    var response_ = await _client.send('CreateRoleAlias', {
      'roleAlias': roleAlias,
      'roleArn': roleArn,
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
    });
    return CreateRoleAliasResponse.fromJson(response_);
  }

  /// Creates a scheduled audit that is run at a specified time interval.
  ///
  /// [frequency]: How often the scheduled audit takes place. Can be one of
  /// "DAILY", "WEEKLY", "BIWEEKLY" or "MONTHLY". The start time of each audit
  /// is determined by the system.
  ///
  /// [dayOfMonth]: The day of the month on which the scheduled audit takes
  /// place. Can be "1" through "31" or "LAST". This field is required if the
  /// "frequency" parameter is set to "MONTHLY". If days 29-31 are specified,
  /// and the month does not have that many days, the audit takes place on the
  /// "LAST" day of the month.
  ///
  /// [dayOfWeek]: The day of the week on which the scheduled audit takes place.
  /// Can be one of "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT". This
  /// field is required if the "frequency" parameter is set to "WEEKLY" or
  /// "BIWEEKLY".
  ///
  /// [targetCheckNames]: Which checks are performed during the scheduled audit.
  /// Checks must be enabled for your account. (Use
  /// `DescribeAccountAuditConfiguration` to see the list of all checks,
  /// including those that are enabled or use `UpdateAccountAuditConfiguration`
  /// to select which checks are enabled.)
  ///
  /// [scheduledAuditName]: The name you want to give to the scheduled audit.
  /// (Max. 128 chars)
  ///
  /// [tags]: Metadata that can be used to manage the scheduled audit.
  Future<CreateScheduledAuditResponse> createScheduledAudit(
      {@required String frequency,
      String dayOfMonth,
      String dayOfWeek,
      @required List<String> targetCheckNames,
      @required String scheduledAuditName,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateScheduledAudit', {
      'frequency': frequency,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek,
      'targetCheckNames': targetCheckNames,
      'scheduledAuditName': scheduledAuditName,
      if (tags != null) 'tags': tags,
    });
    return CreateScheduledAuditResponse.fromJson(response_);
  }

  /// Creates a Device Defender security profile.
  ///
  /// [securityProfileName]: The name you are giving to the security profile.
  ///
  /// [securityProfileDescription]: A description of the security profile.
  ///
  /// [behaviors]: Specifies the behaviors that, when violated by a device
  /// (thing), cause an alert.
  ///
  /// [alertTargets]: Specifies the destinations to which alerts are sent.
  /// (Alerts are always sent to the console.) Alerts are generated when a
  /// device (thing) violates a behavior.
  ///
  /// [additionalMetricsToRetain]: A list of metrics whose data is retained
  /// (stored). By default, data is retained for any metric used in the
  /// profile's `behaviors`, but it is also retained for any metric specified
  /// here.
  ///
  /// [tags]: Metadata that can be used to manage the security profile.
  Future<CreateSecurityProfileResponse> createSecurityProfile(
      String securityProfileName,
      {String securityProfileDescription,
      List<Behavior> behaviors,
      Map<String, AlertTarget> alertTargets,
      List<String> additionalMetricsToRetain,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateSecurityProfile', {
      'securityProfileName': securityProfileName,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
      if (behaviors != null) 'behaviors': behaviors,
      if (alertTargets != null) 'alertTargets': alertTargets,
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (tags != null) 'tags': tags,
    });
    return CreateSecurityProfileResponse.fromJson(response_);
  }

  /// Creates a stream for delivering one or more large files in chunks over
  /// MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT
  /// messages from a source like S3. You can have one or more files associated
  /// with a stream. The total size of a file associated with the stream cannot
  /// exceed more than 2 MB. The stream will be created with version 0. If a
  /// stream is created with the same streamID as a stream that existed and was
  /// deleted within last 90 days, we will resurrect that old stream by
  /// incrementing the version by 1.
  ///
  /// [streamId]: The stream ID.
  ///
  /// [description]: A description of the stream.
  ///
  /// [files]: The files to stream.
  ///
  /// [roleArn]: An IAM role that allows the IoT service principal assumes to
  /// access your S3 files.
  ///
  /// [tags]: Metadata which can be used to manage streams.
  Future<CreateStreamResponse> createStream(
      {@required String streamId,
      String description,
      @required List<StreamFile> files,
      @required String roleArn,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateStream', {
      'streamId': streamId,
      if (description != null) 'description': description,
      'files': files,
      'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    });
    return CreateStreamResponse.fromJson(response_);
  }

  /// Creates a thing record in the registry. If this call is made multiple
  /// times using the same thing name and configuration, the call will succeed.
  /// If this call is made with the same thing name but different configuration
  /// a `ResourceAlreadyExistsException` is thrown.
  ///
  ///
  ///
  /// This is a control plane operation. See
  /// [Authorization](https://docs.aws.amazon.com/iot/latest/developerguide/authorization.html)
  /// for information about authorizing control plane actions.
  ///
  /// [thingName]: The name of the thing to create.
  ///
  /// [thingTypeName]: The name of the thing type associated with the new thing.
  ///
  /// [attributePayload]: The attribute payload, which consists of up to three
  /// name/value pairs in a JSON document. For example:
  ///
  ///  `{"attributes":{"string1":"string2"}}`
  ///
  /// [billingGroupName]: The name of the billing group the thing will be added
  /// to.
  Future<CreateThingResponse> createThing(String thingName,
      {String thingTypeName,
      AttributePayload attributePayload,
      String billingGroupName}) async {
    var response_ = await _client.send('CreateThing', {
      'thingName': thingName,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
    });
    return CreateThingResponse.fromJson(response_);
  }

  /// Create a thing group.
  ///
  ///
  ///
  /// This is a control plane operation. See
  /// [Authorization](https://docs.aws.amazon.com/iot/latest/developerguide/authorization.html)
  /// for information about authorizing control plane actions.
  ///
  /// [thingGroupName]: The thing group name to create.
  ///
  /// [parentGroupName]: The name of the parent thing group.
  ///
  /// [thingGroupProperties]: The thing group properties.
  ///
  /// [tags]: Metadata which can be used to manage the thing group.
  Future<CreateThingGroupResponse> createThingGroup(String thingGroupName,
      {String parentGroupName,
      ThingGroupProperties thingGroupProperties,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateThingGroup', {
      'thingGroupName': thingGroupName,
      if (parentGroupName != null) 'parentGroupName': parentGroupName,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
      if (tags != null) 'tags': tags,
    });
    return CreateThingGroupResponse.fromJson(response_);
  }

  /// Creates a new thing type.
  ///
  /// [thingTypeName]: The name of the thing type.
  ///
  /// [thingTypeProperties]: The ThingTypeProperties for the thing type to
  /// create. It contains information about the new thing type including a
  /// description, and a list of searchable thing attribute names.
  ///
  /// [tags]: Metadata which can be used to manage the thing type.
  Future<CreateThingTypeResponse> createThingType(String thingTypeName,
      {ThingTypeProperties thingTypeProperties, List<Tag> tags}) async {
    var response_ = await _client.send('CreateThingType', {
      'thingTypeName': thingTypeName,
      if (thingTypeProperties != null)
        'thingTypeProperties': thingTypeProperties,
      if (tags != null) 'tags': tags,
    });
    return CreateThingTypeResponse.fromJson(response_);
  }

  /// Creates a rule. Creating rules is an administrator-level action. Any user
  /// who has permission to create rules will be able to access data processed
  /// by the rule.
  ///
  /// [ruleName]: The name of the rule.
  ///
  /// [topicRulePayload]: The rule payload.
  ///
  /// [tags]: Metadata which can be used to manage the topic rule.
  ///
  ///
  ///
  /// For URI Request parameters use format: ...key1=value1&key2=value2...
  ///
  /// For the CLI command-line parameter use format: --tags
  /// "key1=value1&key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&key2=value2..."
  Future<void> createTopicRule(
      {@required String ruleName,
      @required TopicRulePayload topicRulePayload,
      String tags}) async {
    await _client.send('CreateTopicRule', {
      'ruleName': ruleName,
      'topicRulePayload': topicRulePayload,
      if (tags != null) 'tags': tags,
    });
  }

  /// Restores the default settings for Device Defender audits for this account.
  /// Any configuration data you entered is deleted and all audit checks are
  /// reset to disabled.
  ///
  /// [deleteScheduledAudits]: If true, all scheduled audits are deleted.
  Future<DeleteAccountAuditConfigurationResponse>
      deleteAccountAuditConfiguration({bool deleteScheduledAudits}) async {
    var response_ = await _client.send('DeleteAccountAuditConfiguration', {
      if (deleteScheduledAudits != null)
        'deleteScheduledAudits': deleteScheduledAudits,
    });
    return DeleteAccountAuditConfigurationResponse.fromJson(response_);
  }

  /// Deletes an authorizer.
  ///
  /// [authorizerName]: The name of the authorizer to delete.
  Future<DeleteAuthorizerResponse> deleteAuthorizer(
      String authorizerName) async {
    var response_ = await _client.send('DeleteAuthorizer', {
      'authorizerName': authorizerName,
    });
    return DeleteAuthorizerResponse.fromJson(response_);
  }

  /// Deletes the billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  ///
  /// [expectedVersion]: The expected version of the billing group. If the
  /// version of the billing group does not match the expected version specified
  /// in the request, the `DeleteBillingGroup` request is rejected with a
  /// `VersionConflictException`.
  Future<DeleteBillingGroupResponse> deleteBillingGroup(String billingGroupName,
      {BigInt expectedVersion}) async {
    var response_ = await _client.send('DeleteBillingGroup', {
      'billingGroupName': billingGroupName,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return DeleteBillingGroupResponse.fromJson(response_);
  }

  /// Deletes a registered CA certificate.
  ///
  /// [certificateId]: The ID of the certificate to delete. (The last part of
  /// the certificate ARN contains the certificate ID.)
  Future<DeleteCACertificateResponse> deleteCACertificate(
      String certificateId) async {
    var response_ = await _client.send('DeleteCACertificate', {
      'certificateId': certificateId,
    });
    return DeleteCACertificateResponse.fromJson(response_);
  }

  /// Deletes the specified certificate.
  ///
  /// A certificate cannot be deleted if it has a policy or IoT thing attached
  /// to it or if its status is set to ACTIVE. To delete a certificate, first
  /// use the DetachPrincipalPolicy API to detach all policies. Next, use the
  /// UpdateCertificate API to set the certificate to the INACTIVE status.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  ///
  /// [forceDelete]: Forces the deletion of a certificate if it is inactive and
  /// is not attached to an IoT thing.
  Future<void> deleteCertificate(String certificateId,
      {bool forceDelete}) async {
    await _client.send('DeleteCertificate', {
      'certificateId': certificateId,
      if (forceDelete != null) 'forceDelete': forceDelete,
    });
  }

  /// Deletes a dynamic thing group.
  ///
  /// [thingGroupName]: The name of the dynamic thing group to delete.
  ///
  /// [expectedVersion]: The expected version of the dynamic thing group to
  /// delete.
  Future<DeleteDynamicThingGroupResponse> deleteDynamicThingGroup(
      String thingGroupName,
      {BigInt expectedVersion}) async {
    var response_ = await _client.send('DeleteDynamicThingGroup', {
      'thingGroupName': thingGroupName,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return DeleteDynamicThingGroupResponse.fromJson(response_);
  }

  /// Deletes a job and its related job executions.
  ///
  /// Deleting a job may take time, depending on the number of job executions
  /// created for the job and various other factors. While the job is being
  /// deleted, the status of the job will be shown as "DELETION_IN_PROGRESS".
  /// Attempting to delete or cancel a job whose status is already
  /// "DELETION_IN_PROGRESS" will result in an error.
  ///
  /// Only 10 jobs may have status "DELETION_IN_PROGRESS" at the same time, or a
  /// LimitExceededException will occur.
  ///
  /// [jobId]: The ID of the job to be deleted.
  ///
  /// After a job deletion is completed, you may reuse this jobId when you
  /// create a new job. However, this is not recommended, and you must ensure
  /// that your devices are not using the jobId to refer to the deleted job.
  ///
  /// [force]: (Optional) When true, you can delete a job which is
  /// "IN_PROGRESS". Otherwise, you can only delete a job which is in a terminal
  /// state ("COMPLETED" or "CANCELED") or an exception will occur. The default
  /// is false.
  ///
  ///
  ///
  /// Deleting a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to access job information or update the job
  /// execution status. Use caution and ensure that each device executing a job
  /// which is deleted is able to recover to a valid state.
  Future<void> deleteJob(String jobId, {bool force}) async {
    await _client.send('DeleteJob', {
      'jobId': jobId,
      if (force != null) 'force': force,
    });
  }

  /// Deletes a job execution.
  ///
  /// [jobId]: The ID of the job whose execution on a particular device will be
  /// deleted.
  ///
  /// [thingName]: The name of the thing whose job execution will be deleted.
  ///
  /// [executionNumber]: The ID of the job execution to be deleted. The
  /// `executionNumber` refers to the execution of a particular job on a
  /// particular device.
  ///
  /// Note that once a job execution is deleted, the `executionNumber` may be
  /// reused by IoT, so be sure you get and use the correct value here.
  ///
  /// [force]: (Optional) When true, you can delete a job execution which is
  /// "IN_PROGRESS". Otherwise, you can only delete a job execution which is in
  /// a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or
  /// "CANCELED") or an exception will occur. The default is false.
  ///
  ///
  ///
  /// Deleting a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to access job information or update the job execution status.
  /// Use caution and ensure that the device is able to recover to a valid
  /// state.
  Future<void> deleteJobExecution(
      {@required String jobId,
      @required String thingName,
      @required BigInt executionNumber,
      bool force}) async {
    await _client.send('DeleteJobExecution', {
      'jobId': jobId,
      'thingName': thingName,
      'executionNumber': executionNumber,
      if (force != null) 'force': force,
    });
  }

  /// Deletes a defined mitigation action from your AWS account.
  ///
  /// [actionName]: The name of the mitigation action that you want to delete.
  Future<DeleteMitigationActionResponse> deleteMitigationAction(
      String actionName) async {
    var response_ = await _client.send('DeleteMitigationAction', {
      'actionName': actionName,
    });
    return DeleteMitigationActionResponse.fromJson(response_);
  }

  /// Delete an OTA update.
  ///
  /// [otaUpdateId]: The OTA update ID to delete.
  ///
  /// [deleteStream]: Specifies if the stream associated with an OTA update
  /// should be deleted when the OTA update is deleted.
  ///
  /// [forceDeleteAwsJob]: Specifies if the AWS Job associated with the OTA
  /// update should be deleted with the OTA update is deleted.
  Future<DeleteOtaUpdateResponse> deleteOtaUpdate(String otaUpdateId,
      {bool deleteStream, bool forceDeleteAwsJob}) async {
    var response_ = await _client.send('DeleteOTAUpdate', {
      'otaUpdateId': otaUpdateId,
      if (deleteStream != null) 'deleteStream': deleteStream,
      if (forceDeleteAwsJob != null) 'forceDeleteAWSJob': forceDeleteAwsJob,
    });
    return DeleteOtaUpdateResponse.fromJson(response_);
  }

  /// Deletes the specified policy.
  ///
  /// A policy cannot be deleted if it has non-default versions or it is
  /// attached to any certificate.
  ///
  /// To delete a policy, use the DeletePolicyVersion API to delete all
  /// non-default versions of the policy; use the DetachPrincipalPolicy API to
  /// detach the policy from any certificate; and then use the DeletePolicy API
  /// to delete the policy.
  ///
  /// When a policy is deleted using DeletePolicy, its default version is
  /// deleted with it.
  ///
  /// [policyName]: The name of the policy to delete.
  Future<void> deletePolicy(String policyName) async {
    await _client.send('DeletePolicy', {
      'policyName': policyName,
    });
  }

  /// Deletes the specified version of the specified policy. You cannot delete
  /// the default version of a policy using this API. To delete the default
  /// version of a policy, use DeletePolicy. To find out which version of a
  /// policy is marked as the default version, use ListPolicyVersions.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// [policyVersionId]: The policy version ID.
  Future<void> deletePolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {
    await _client.send('DeletePolicyVersion', {
      'policyName': policyName,
      'policyVersionId': policyVersionId,
    });
  }

  /// Deletes a CA certificate registration code.
  Future<DeleteRegistrationCodeResponse> deleteRegistrationCode() async {
    var response_ = await _client.send('DeleteRegistrationCode', {});
    return DeleteRegistrationCodeResponse.fromJson(response_);
  }

  /// Deletes a role alias
  ///
  /// [roleAlias]: The role alias to delete.
  Future<DeleteRoleAliasResponse> deleteRoleAlias(String roleAlias) async {
    var response_ = await _client.send('DeleteRoleAlias', {
      'roleAlias': roleAlias,
    });
    return DeleteRoleAliasResponse.fromJson(response_);
  }

  /// Deletes a scheduled audit.
  ///
  /// [scheduledAuditName]: The name of the scheduled audit you want to delete.
  Future<DeleteScheduledAuditResponse> deleteScheduledAudit(
      String scheduledAuditName) async {
    var response_ = await _client.send('DeleteScheduledAudit', {
      'scheduledAuditName': scheduledAuditName,
    });
    return DeleteScheduledAuditResponse.fromJson(response_);
  }

  /// Deletes a Device Defender security profile.
  ///
  /// [securityProfileName]: The name of the security profile to be deleted.
  ///
  /// [expectedVersion]: The expected version of the security profile. A new
  /// version is generated whenever the security profile is updated. If you
  /// specify a value that is different from the actual version, a
  /// `VersionConflictException` is thrown.
  Future<DeleteSecurityProfileResponse> deleteSecurityProfile(
      String securityProfileName,
      {BigInt expectedVersion}) async {
    var response_ = await _client.send('DeleteSecurityProfile', {
      'securityProfileName': securityProfileName,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return DeleteSecurityProfileResponse.fromJson(response_);
  }

  /// Deletes a stream.
  ///
  /// [streamId]: The stream ID.
  Future<DeleteStreamResponse> deleteStream(String streamId) async {
    var response_ = await _client.send('DeleteStream', {
      'streamId': streamId,
    });
    return DeleteStreamResponse.fromJson(response_);
  }

  /// Deletes the specified thing. Returns successfully with no error if the
  /// deletion is successful or you specify a thing that doesn't exist.
  ///
  /// [thingName]: The name of the thing to delete.
  ///
  /// [expectedVersion]: The expected version of the thing record in the
  /// registry. If the version of the record in the registry does not match the
  /// expected version specified in the request, the `DeleteThing` request is
  /// rejected with a `VersionConflictException`.
  Future<DeleteThingResponse> deleteThing(String thingName,
      {BigInt expectedVersion}) async {
    var response_ = await _client.send('DeleteThing', {
      'thingName': thingName,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return DeleteThingResponse.fromJson(response_);
  }

  /// Deletes a thing group.
  ///
  /// [thingGroupName]: The name of the thing group to delete.
  ///
  /// [expectedVersion]: The expected version of the thing group to delete.
  Future<DeleteThingGroupResponse> deleteThingGroup(String thingGroupName,
      {BigInt expectedVersion}) async {
    var response_ = await _client.send('DeleteThingGroup', {
      'thingGroupName': thingGroupName,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return DeleteThingGroupResponse.fromJson(response_);
  }

  /// Deletes the specified thing type. You cannot delete a thing type if it has
  /// things associated with it. To delete a thing type, first mark it as
  /// deprecated by calling DeprecateThingType, then remove any associated
  /// things by calling UpdateThing to change the thing type on any associated
  /// thing, and finally use DeleteThingType to delete the thing type.
  ///
  /// [thingTypeName]: The name of the thing type.
  Future<DeleteThingTypeResponse> deleteThingType(String thingTypeName) async {
    var response_ = await _client.send('DeleteThingType', {
      'thingTypeName': thingTypeName,
    });
    return DeleteThingTypeResponse.fromJson(response_);
  }

  /// Deletes the rule.
  ///
  /// [ruleName]: The name of the rule.
  Future<void> deleteTopicRule(String ruleName) async {
    await _client.send('DeleteTopicRule', {
      'ruleName': ruleName,
    });
  }

  /// Deletes a logging level.
  ///
  /// [targetType]: The type of resource for which you are configuring logging.
  /// Must be `THING_Group`.
  ///
  /// [targetName]: The name of the resource for which you are configuring
  /// logging.
  Future<void> deleteV2LoggingLevel(
      {@required String targetType, @required String targetName}) async {
    await _client.send('DeleteV2LoggingLevel', {
      'targetType': targetType,
      'targetName': targetName,
    });
  }

  /// Deprecates a thing type. You can not associate new things with deprecated
  /// thing type.
  ///
  /// [thingTypeName]: The name of the thing type to deprecate.
  ///
  /// [undoDeprecate]: Whether to undeprecate a deprecated thing type. If
  /// **true**, the thing type will not be deprecated anymore and you can
  /// associate it with things.
  Future<DeprecateThingTypeResponse> deprecateThingType(String thingTypeName,
      {bool undoDeprecate}) async {
    var response_ = await _client.send('DeprecateThingType', {
      'thingTypeName': thingTypeName,
      if (undoDeprecate != null) 'undoDeprecate': undoDeprecate,
    });
    return DeprecateThingTypeResponse.fromJson(response_);
  }

  /// Gets information about the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  Future<DescribeAccountAuditConfigurationResponse>
      describeAccountAuditConfiguration() async {
    var response_ = await _client.send('DescribeAccountAuditConfiguration', {});
    return DescribeAccountAuditConfigurationResponse.fromJson(response_);
  }

  /// Gets information about a single audit finding. Properties include the
  /// reason for noncompliance, the severity of the issue, and when the audit
  /// that returned the finding was started.
  ///
  /// [findingId]: A unique identifier for a single audit finding. You can use
  /// this identifier to apply mitigation actions to the finding.
  Future<DescribeAuditFindingResponse> describeAuditFinding(
      String findingId) async {
    var response_ = await _client.send('DescribeAuditFinding', {
      'findingId': findingId,
    });
    return DescribeAuditFindingResponse.fromJson(response_);
  }

  /// Gets information about an audit mitigation task that is used to apply
  /// mitigation actions to a set of audit findings. Properties include the
  /// actions being applied, the audit checks to which they're being applied,
  /// the task status, and aggregated task statistics.
  ///
  /// [taskId]: The unique identifier for the audit mitigation task.
  Future<DescribeAuditMitigationActionsTaskResponse>
      describeAuditMitigationActionsTask(String taskId) async {
    var response_ = await _client.send('DescribeAuditMitigationActionsTask', {
      'taskId': taskId,
    });
    return DescribeAuditMitigationActionsTaskResponse.fromJson(response_);
  }

  /// Gets information about a Device Defender audit.
  ///
  /// [taskId]: The ID of the audit whose information you want to get.
  Future<DescribeAuditTaskResponse> describeAuditTask(String taskId) async {
    var response_ = await _client.send('DescribeAuditTask', {
      'taskId': taskId,
    });
    return DescribeAuditTaskResponse.fromJson(response_);
  }

  /// Describes an authorizer.
  ///
  /// [authorizerName]: The name of the authorizer to describe.
  Future<DescribeAuthorizerResponse> describeAuthorizer(
      String authorizerName) async {
    var response_ = await _client.send('DescribeAuthorizer', {
      'authorizerName': authorizerName,
    });
    return DescribeAuthorizerResponse.fromJson(response_);
  }

  /// Returns information about a billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  Future<DescribeBillingGroupResponse> describeBillingGroup(
      String billingGroupName) async {
    var response_ = await _client.send('DescribeBillingGroup', {
      'billingGroupName': billingGroupName,
    });
    return DescribeBillingGroupResponse.fromJson(response_);
  }

  /// Describes a registered CA certificate.
  ///
  /// [certificateId]: The CA certificate identifier.
  Future<DescribeCACertificateResponse> describeCACertificate(
      String certificateId) async {
    var response_ = await _client.send('DescribeCACertificate', {
      'certificateId': certificateId,
    });
    return DescribeCACertificateResponse.fromJson(response_);
  }

  /// Gets information about the specified certificate.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  Future<DescribeCertificateResponse> describeCertificate(
      String certificateId) async {
    var response_ = await _client.send('DescribeCertificate', {
      'certificateId': certificateId,
    });
    return DescribeCertificateResponse.fromJson(response_);
  }

  /// Describes the default authorizer.
  Future<DescribeDefaultAuthorizerResponse> describeDefaultAuthorizer() async {
    var response_ = await _client.send('DescribeDefaultAuthorizer', {});
    return DescribeDefaultAuthorizerResponse.fromJson(response_);
  }

  /// Returns a unique endpoint specific to the AWS account making the call.
  ///
  /// [endpointType]: The endpoint type. Valid endpoint types include:
  ///
  /// *    `iot:Data` - Returns a VeriSign signed data endpoint.
  ///
  ///
  /// *    `iot:Data-ATS` - Returns an ATS signed data endpoint.
  ///
  ///
  /// *    `iot:CredentialProvider` - Returns an AWS IoT credentials provider
  /// API endpoint.
  ///
  ///
  /// *    `iot:Jobs` - Returns an AWS IoT device management Jobs API endpoint.
  Future<DescribeEndpointResponse> describeEndpoint(
      {String endpointType}) async {
    var response_ = await _client.send('DescribeEndpoint', {
      if (endpointType != null) 'endpointType': endpointType,
    });
    return DescribeEndpointResponse.fromJson(response_);
  }

  /// Describes event configurations.
  Future<DescribeEventConfigurationsResponse>
      describeEventConfigurations() async {
    var response_ = await _client.send('DescribeEventConfigurations', {});
    return DescribeEventConfigurationsResponse.fromJson(response_);
  }

  /// Describes a search index.
  ///
  /// [indexName]: The index name.
  Future<DescribeIndexResponse> describeIndex(String indexName) async {
    var response_ = await _client.send('DescribeIndex', {
      'indexName': indexName,
    });
    return DescribeIndexResponse.fromJson(response_);
  }

  /// Describes a job.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  Future<DescribeJobResponse> describeJob(String jobId) async {
    var response_ = await _client.send('DescribeJob', {
      'jobId': jobId,
    });
    return DescribeJobResponse.fromJson(response_);
  }

  /// Describes a job execution.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  ///
  /// [thingName]: The name of the thing on which the job execution is running.
  ///
  /// [executionNumber]: A string (consisting of the digits "0" through "9"
  /// which is used to specify a particular job execution on a particular
  /// device.
  Future<DescribeJobExecutionResponse> describeJobExecution(
      {@required String jobId,
      @required String thingName,
      BigInt executionNumber}) async {
    var response_ = await _client.send('DescribeJobExecution', {
      'jobId': jobId,
      'thingName': thingName,
      if (executionNumber != null) 'executionNumber': executionNumber,
    });
    return DescribeJobExecutionResponse.fromJson(response_);
  }

  /// Gets information about a mitigation action.
  ///
  /// [actionName]: The friendly name that uniquely identifies the mitigation
  /// action.
  Future<DescribeMitigationActionResponse> describeMitigationAction(
      String actionName) async {
    var response_ = await _client.send('DescribeMitigationAction', {
      'actionName': actionName,
    });
    return DescribeMitigationActionResponse.fromJson(response_);
  }

  /// Describes a role alias.
  ///
  /// [roleAlias]: The role alias to describe.
  Future<DescribeRoleAliasResponse> describeRoleAlias(String roleAlias) async {
    var response_ = await _client.send('DescribeRoleAlias', {
      'roleAlias': roleAlias,
    });
    return DescribeRoleAliasResponse.fromJson(response_);
  }

  /// Gets information about a scheduled audit.
  ///
  /// [scheduledAuditName]: The name of the scheduled audit whose information
  /// you want to get.
  Future<DescribeScheduledAuditResponse> describeScheduledAudit(
      String scheduledAuditName) async {
    var response_ = await _client.send('DescribeScheduledAudit', {
      'scheduledAuditName': scheduledAuditName,
    });
    return DescribeScheduledAuditResponse.fromJson(response_);
  }

  /// Gets information about a Device Defender security profile.
  ///
  /// [securityProfileName]: The name of the security profile whose information
  /// you want to get.
  Future<DescribeSecurityProfileResponse> describeSecurityProfile(
      String securityProfileName) async {
    var response_ = await _client.send('DescribeSecurityProfile', {
      'securityProfileName': securityProfileName,
    });
    return DescribeSecurityProfileResponse.fromJson(response_);
  }

  /// Gets information about a stream.
  ///
  /// [streamId]: The stream ID.
  Future<DescribeStreamResponse> describeStream(String streamId) async {
    var response_ = await _client.send('DescribeStream', {
      'streamId': streamId,
    });
    return DescribeStreamResponse.fromJson(response_);
  }

  /// Gets information about the specified thing.
  ///
  /// [thingName]: The name of the thing.
  Future<DescribeThingResponse> describeThing(String thingName) async {
    var response_ = await _client.send('DescribeThing', {
      'thingName': thingName,
    });
    return DescribeThingResponse.fromJson(response_);
  }

  /// Describe a thing group.
  ///
  /// [thingGroupName]: The name of the thing group.
  Future<DescribeThingGroupResponse> describeThingGroup(
      String thingGroupName) async {
    var response_ = await _client.send('DescribeThingGroup', {
      'thingGroupName': thingGroupName,
    });
    return DescribeThingGroupResponse.fromJson(response_);
  }

  /// Describes a bulk thing provisioning task.
  ///
  /// [taskId]: The task ID.
  Future<DescribeThingRegistrationTaskResponse> describeThingRegistrationTask(
      String taskId) async {
    var response_ = await _client.send('DescribeThingRegistrationTask', {
      'taskId': taskId,
    });
    return DescribeThingRegistrationTaskResponse.fromJson(response_);
  }

  /// Gets information about the specified thing type.
  ///
  /// [thingTypeName]: The name of the thing type.
  Future<DescribeThingTypeResponse> describeThingType(
      String thingTypeName) async {
    var response_ = await _client.send('DescribeThingType', {
      'thingTypeName': thingTypeName,
    });
    return DescribeThingTypeResponse.fromJson(response_);
  }

  /// Detaches a policy from the specified target.
  ///
  /// [policyName]: The policy to detach.
  ///
  /// [target]: The target from which the policy will be detached.
  Future<void> detachPolicy(
      {@required String policyName, @required String target}) async {
    await _client.send('DetachPolicy', {
      'policyName': policyName,
      'target': target,
    });
  }

  /// Removes the specified policy from the specified certificate.
  ///
  ///  **Note:** This API is deprecated. Please use DetachPolicy instead.
  ///
  /// [policyName]: The name of the policy to detach.
  ///
  /// [principal]: The principal.
  ///
  /// If the principal is a certificate, specify the certificate ARN. If the
  /// principal is an Amazon Cognito identity, specify the identity ID.
  Future<void> detachPrincipalPolicy(
      {@required String policyName, @required String principal}) async {
    await _client.send('DetachPrincipalPolicy', {
      'policyName': policyName,
      'principal': principal,
    });
  }

  /// Disassociates a Device Defender security profile from a thing group or
  /// from this account.
  ///
  /// [securityProfileName]: The security profile that is detached.
  ///
  /// [securityProfileTargetArn]: The ARN of the thing group from which the
  /// security profile is detached.
  Future<DetachSecurityProfileResponse> detachSecurityProfile(
      {@required String securityProfileName,
      @required String securityProfileTargetArn}) async {
    var response_ = await _client.send('DetachSecurityProfile', {
      'securityProfileName': securityProfileName,
      'securityProfileTargetArn': securityProfileTargetArn,
    });
    return DetachSecurityProfileResponse.fromJson(response_);
  }

  /// Detaches the specified principal from the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  ///
  ///
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  ///
  /// [thingName]: The name of the thing.
  ///
  /// [principal]: If the principal is a certificate, this value must be ARN of
  /// the certificate. If the principal is an Amazon Cognito identity, this
  /// value must be the ID of the Amazon Cognito identity.
  Future<DetachThingPrincipalResponse> detachThingPrincipal(
      {@required String thingName, @required String principal}) async {
    var response_ = await _client.send('DetachThingPrincipal', {
      'thingName': thingName,
      'principal': principal,
    });
    return DetachThingPrincipalResponse.fromJson(response_);
  }

  /// Disables the rule.
  ///
  /// [ruleName]: The name of the rule to disable.
  Future<void> disableTopicRule(String ruleName) async {
    await _client.send('DisableTopicRule', {
      'ruleName': ruleName,
    });
  }

  /// Enables the rule.
  ///
  /// [ruleName]: The name of the topic rule to enable.
  Future<void> enableTopicRule(String ruleName) async {
    await _client.send('EnableTopicRule', {
      'ruleName': ruleName,
    });
  }

  /// Gets a list of the policies that have an effect on the authorization
  /// behavior of the specified device when it connects to the AWS IoT device
  /// gateway.
  ///
  /// [principal]: The principal.
  ///
  /// [cognitoIdentityPoolId]: The Cognito identity pool ID.
  ///
  /// [thingName]: The thing name.
  Future<GetEffectivePoliciesResponse> getEffectivePolicies(
      {String principal,
      String cognitoIdentityPoolId,
      String thingName}) async {
    var response_ = await _client.send('GetEffectivePolicies', {
      if (principal != null) 'principal': principal,
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (thingName != null) 'thingName': thingName,
    });
    return GetEffectivePoliciesResponse.fromJson(response_);
  }

  /// Gets the search configuration.
  Future<GetIndexingConfigurationResponse> getIndexingConfiguration() async {
    var response_ = await _client.send('GetIndexingConfiguration', {});
    return GetIndexingConfigurationResponse.fromJson(response_);
  }

  /// Gets a job document.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  Future<GetJobDocumentResponse> getJobDocument(String jobId) async {
    var response_ = await _client.send('GetJobDocument', {
      'jobId': jobId,
    });
    return GetJobDocumentResponse.fromJson(response_);
  }

  /// Gets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `GetV2LoggingOptions`
  /// instead.
  Future<GetLoggingOptionsResponse> getLoggingOptions() async {
    var response_ = await _client.send('GetLoggingOptions', {});
    return GetLoggingOptionsResponse.fromJson(response_);
  }

  /// Gets an OTA update.
  ///
  /// [otaUpdateId]: The OTA update ID.
  Future<GetOtaUpdateResponse> getOtaUpdate(String otaUpdateId) async {
    var response_ = await _client.send('GetOTAUpdate', {
      'otaUpdateId': otaUpdateId,
    });
    return GetOtaUpdateResponse.fromJson(response_);
  }

  /// Gets information about the specified policy with the policy document of
  /// the default version.
  ///
  /// [policyName]: The name of the policy.
  Future<GetPolicyResponse> getPolicy(String policyName) async {
    var response_ = await _client.send('GetPolicy', {
      'policyName': policyName,
    });
    return GetPolicyResponse.fromJson(response_);
  }

  /// Gets information about the specified policy version.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// [policyVersionId]: The policy version ID.
  Future<GetPolicyVersionResponse> getPolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {
    var response_ = await _client.send('GetPolicyVersion', {
      'policyName': policyName,
      'policyVersionId': policyVersionId,
    });
    return GetPolicyVersionResponse.fromJson(response_);
  }

  /// Gets a registration code used to register a CA certificate with AWS IoT.
  Future<GetRegistrationCodeResponse> getRegistrationCode() async {
    var response_ = await _client.send('GetRegistrationCode', {});
    return GetRegistrationCodeResponse.fromJson(response_);
  }

  /// Gets statistics about things that match the specified query.
  ///
  /// [indexName]: The name of the index to search. The default value is
  /// `AWS_Things`.
  ///
  /// [queryString]: The query used to search. You can specify "*" for the query
  /// string to get the count of all indexed things in your AWS account.
  ///
  /// [aggregationField]: The aggregation field name. Currently not supported.
  ///
  /// [queryVersion]: The version of the query used to search.
  Future<GetStatisticsResponse> getStatistics(String queryString,
      {String indexName, String aggregationField, String queryVersion}) async {
    var response_ = await _client.send('GetStatistics', {
      if (indexName != null) 'indexName': indexName,
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (queryVersion != null) 'queryVersion': queryVersion,
    });
    return GetStatisticsResponse.fromJson(response_);
  }

  /// Gets information about the rule.
  ///
  /// [ruleName]: The name of the rule.
  Future<GetTopicRuleResponse> getTopicRule(String ruleName) async {
    var response_ = await _client.send('GetTopicRule', {
      'ruleName': ruleName,
    });
    return GetTopicRuleResponse.fromJson(response_);
  }

  /// Gets the fine grained logging options.
  Future<GetV2LoggingOptionsResponse> getV2LoggingOptions() async {
    var response_ = await _client.send('GetV2LoggingOptions', {});
    return GetV2LoggingOptionsResponse.fromJson(response_);
  }

  /// Lists the active violations for a given Device Defender security profile.
  ///
  /// [thingName]: The name of the thing whose active violations are listed.
  ///
  /// [securityProfileName]: The name of the Device Defender security profile
  /// for which violations are listed.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListActiveViolationsResponse> listActiveViolations(
      {String thingName,
      String securityProfileName,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListActiveViolations', {
      if (thingName != null) 'thingName': thingName,
      if (securityProfileName != null)
        'securityProfileName': securityProfileName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListActiveViolationsResponse.fromJson(response_);
  }

  /// Lists the policies attached to the specified thing group.
  ///
  /// [target]: The group or principal for which the policies will be listed.
  ///
  /// [recursive]: When true, recursively list attached policies.
  ///
  /// [marker]: The token to retrieve the next set of results.
  ///
  /// [pageSize]: The maximum number of results to be returned per request.
  Future<ListAttachedPoliciesResponse> listAttachedPolicies(String target,
      {bool recursive, String marker, int pageSize}) async {
    var response_ = await _client.send('ListAttachedPolicies', {
      'target': target,
      if (recursive != null) 'recursive': recursive,
      if (marker != null) 'marker': marker,
      if (pageSize != null) 'pageSize': pageSize,
    });
    return ListAttachedPoliciesResponse.fromJson(response_);
  }

  /// Lists the findings (results) of a Device Defender audit or of the audits
  /// performed during a specified time period. (Findings are retained for 180
  /// days.)
  ///
  /// [taskId]: A filter to limit results to the audit with the specified ID.
  /// You must specify either the taskId or the startTime and endTime, but not
  /// both.
  ///
  /// [checkName]: A filter to limit results to the findings for the specified
  /// audit check.
  ///
  /// [resourceIdentifier]: Information identifying the noncompliant resource.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [startTime]: A filter to limit results to those found after the specified
  /// time. You must specify either the startTime and endTime or the taskId, but
  /// not both.
  ///
  /// [endTime]: A filter to limit results to those found before the specified
  /// time. You must specify either the startTime and endTime or the taskId, but
  /// not both.
  Future<ListAuditFindingsResponse> listAuditFindings(
      {String taskId,
      String checkName,
      ResourceIdentifier resourceIdentifier,
      int maxResults,
      String nextToken,
      DateTime startTime,
      DateTime endTime}) async {
    var response_ = await _client.send('ListAuditFindings', {
      if (taskId != null) 'taskId': taskId,
      if (checkName != null) 'checkName': checkName,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
    });
    return ListAuditFindingsResponse.fromJson(response_);
  }

  /// Gets the status of audit mitigation action tasks that were executed.
  ///
  /// [taskId]: Specify this filter to limit results to actions for a specific
  /// audit mitigation actions task.
  ///
  /// [actionStatus]: Specify this filter to limit results to those with a
  /// specific status.
  ///
  /// [findingId]: Specify this filter to limit results to those that were
  /// applied to a specific audit finding.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<ListAuditMitigationActionsExecutionsResponse>
      listAuditMitigationActionsExecutions(
          {@required String taskId,
          String actionStatus,
          @required String findingId,
          int maxResults,
          String nextToken}) async {
    var response_ = await _client.send('ListAuditMitigationActionsExecutions', {
      'taskId': taskId,
      if (actionStatus != null) 'actionStatus': actionStatus,
      'findingId': findingId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListAuditMitigationActionsExecutionsResponse.fromJson(response_);
  }

  /// Gets a list of audit mitigation action tasks that match the specified
  /// filters.
  ///
  /// [auditTaskId]: Specify this filter to limit results to tasks that were
  /// applied to results for a specific audit.
  ///
  /// [findingId]: Specify this filter to limit results to tasks that were
  /// applied to a specific audit finding.
  ///
  /// [taskStatus]: Specify this filter to limit results to tasks that are in a
  /// specific state.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [startTime]: Specify this filter to limit results to tasks that began on
  /// or after a specific date and time.
  ///
  /// [endTime]: Specify this filter to limit results to tasks that were
  /// completed or canceled on or before a specific date and time.
  Future<ListAuditMitigationActionsTasksResponse>
      listAuditMitigationActionsTasks(
          {String auditTaskId,
          String findingId,
          String taskStatus,
          int maxResults,
          String nextToken,
          @required DateTime startTime,
          @required DateTime endTime}) async {
    var response_ = await _client.send('ListAuditMitigationActionsTasks', {
      if (auditTaskId != null) 'auditTaskId': auditTaskId,
      if (findingId != null) 'findingId': findingId,
      if (taskStatus != null) 'taskStatus': taskStatus,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      'startTime': startTime,
      'endTime': endTime,
    });
    return ListAuditMitigationActionsTasksResponse.fromJson(response_);
  }

  /// Lists the Device Defender audits that have been performed during a given
  /// time period.
  ///
  /// [startTime]: The beginning of the time period. Audit information is
  /// retained for a limited time (180 days). Requesting a start time prior to
  /// what is retained results in an "InvalidRequestException".
  ///
  /// [endTime]: The end of the time period.
  ///
  /// [taskType]: A filter to limit the output to the specified type of audit:
  /// can be one of "ON_DEMAND_AUDIT_TASK" or "SCHEDULED__AUDIT_TASK".
  ///
  /// [taskStatus]: A filter to limit the output to audits with the specified
  /// completion status: can be one of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  Future<ListAuditTasksResponse> listAuditTasks(
      {@required DateTime startTime,
      @required DateTime endTime,
      String taskType,
      String taskStatus,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListAuditTasks', {
      'startTime': startTime,
      'endTime': endTime,
      if (taskType != null) 'taskType': taskType,
      if (taskStatus != null) 'taskStatus': taskStatus,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListAuditTasksResponse.fromJson(response_);
  }

  /// Lists the authorizers registered in your account.
  ///
  /// [pageSize]: The maximum number of results to return at one time.
  ///
  /// [marker]: A marker used to get the next set of results.
  ///
  /// [ascendingOrder]: Return the list of authorizers in ascending alphabetical
  /// order.
  ///
  /// [status]: The status of the list authorizers request.
  Future<ListAuthorizersResponse> listAuthorizers(
      {int pageSize, String marker, bool ascendingOrder, String status}) async {
    var response_ = await _client.send('ListAuthorizers', {
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
      if (status != null) 'status': status,
    });
    return ListAuthorizersResponse.fromJson(response_);
  }

  /// Lists the billing groups you have created.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return per request.
  ///
  /// [namePrefixFilter]: Limit the results to billing groups whose names have
  /// the given prefix.
  Future<ListBillingGroupsResponse> listBillingGroups(
      {String nextToken, int maxResults, String namePrefixFilter}) async {
    var response_ = await _client.send('ListBillingGroups', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (namePrefixFilter != null) 'namePrefixFilter': namePrefixFilter,
    });
    return ListBillingGroupsResponse.fromJson(response_);
  }

  /// Lists the CA certificates registered for your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [ascendingOrder]: Determines the order of the results.
  Future<ListCACertificatesResponse> listCACertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {
    var response_ = await _client.send('ListCACertificates', {
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListCACertificatesResponse.fromJson(response_);
  }

  /// Lists the certificates registered in your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [ascendingOrder]: Specifies the order for results. If True, the results
  /// are returned in ascending order, based on the creation date.
  Future<ListCertificatesResponse> listCertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {
    var response_ = await _client.send('ListCertificates', {
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListCertificatesResponse.fromJson(response_);
  }

  /// List the device certificates signed by the specified CA certificate.
  ///
  /// [caCertificateId]: The ID of the CA certificate. This operation will list
  /// all registered device certificate that were signed by this CA certificate.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [ascendingOrder]: Specifies the order for results. If True, the results
  /// are returned in ascending order, based on the creation date.
  Future<ListCertificatesByCAResponse> listCertificatesByCA(
      String caCertificateId,
      {int pageSize,
      String marker,
      bool ascendingOrder}) async {
    var response_ = await _client.send('ListCertificatesByCA', {
      'caCertificateId': caCertificateId,
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListCertificatesByCAResponse.fromJson(response_);
  }

  /// Lists the search indices.
  ///
  /// [nextToken]: The token used to get the next set of results, or null if
  /// there are no additional results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListIndicesResponse> listIndices(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListIndices', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListIndicesResponse.fromJson(response_);
  }

  /// Lists the job executions for a job.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  ///
  /// [status]: The status of the job.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  Future<ListJobExecutionsForJobResponse> listJobExecutionsForJob(String jobId,
      {String status, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListJobExecutionsForJob', {
      'jobId': jobId,
      if (status != null) 'status': status,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListJobExecutionsForJobResponse.fromJson(response_);
  }

  /// Lists the job executions for the specified thing.
  ///
  /// [thingName]: The thing name.
  ///
  /// [status]: An optional filter that lets you search for jobs that have the
  /// specified status.
  ///
  /// [maxResults]: The maximum number of results to be returned per request.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  Future<ListJobExecutionsForThingResponse> listJobExecutionsForThing(
      String thingName,
      {String status,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListJobExecutionsForThing', {
      'thingName': thingName,
      if (status != null) 'status': status,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListJobExecutionsForThingResponse.fromJson(response_);
  }

  /// Lists jobs.
  ///
  /// [status]: An optional filter that lets you search for jobs that have the
  /// specified status.
  ///
  /// [targetSelection]: Specifies whether the job will continue to run
  /// (CONTINUOUS), or will be complete after all those things specified as
  /// targets have completed the job (SNAPSHOT). If continuous, the job may also
  /// be run on a thing when a change is detected in a target. For example, a
  /// job will run on a thing when the thing is added to a target group, even
  /// after the job was completed by all things originally in the group.
  ///
  /// [maxResults]: The maximum number of results to return per request.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [thingGroupName]: A filter that limits the returned jobs to those for the
  /// specified group.
  ///
  /// [thingGroupId]: A filter that limits the returned jobs to those for the
  /// specified group.
  Future<ListJobsResponse> listJobs(
      {String status,
      String targetSelection,
      int maxResults,
      String nextToken,
      String thingGroupName,
      String thingGroupId}) async {
    var response_ = await _client.send('ListJobs', {
      if (status != null) 'status': status,
      if (targetSelection != null) 'targetSelection': targetSelection,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingGroupId != null) 'thingGroupId': thingGroupId,
    });
    return ListJobsResponse.fromJson(response_);
  }

  /// Gets a list of all mitigation actions that match the specified filter
  /// criteria.
  ///
  /// [actionType]: Specify a value to limit the result to mitigation actions
  /// with a specific action type.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<ListMitigationActionsResponse> listMitigationActions(
      {String actionType, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListMitigationActions', {
      if (actionType != null) 'actionType': actionType,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListMitigationActionsResponse.fromJson(response_);
  }

  /// Lists OTA updates.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  ///
  /// [nextToken]: A token used to retrieve the next set of results.
  ///
  /// [otaUpdateStatus]: The OTA update job status.
  Future<ListOtaUpdatesResponse> listOtaUpdates(
      {int maxResults, String nextToken, String otaUpdateStatus}) async {
    var response_ = await _client.send('ListOTAUpdates', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (otaUpdateStatus != null) 'otaUpdateStatus': otaUpdateStatus,
    });
    return ListOtaUpdatesResponse.fromJson(response_);
  }

  /// Lists certificates that are being transferred but not yet accepted.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [ascendingOrder]: Specifies the order for results. If True, the results
  /// are returned in ascending order, based on the creation date.
  Future<ListOutgoingCertificatesResponse> listOutgoingCertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {
    var response_ = await _client.send('ListOutgoingCertificates', {
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListOutgoingCertificatesResponse.fromJson(response_);
  }

  /// Lists your policies.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [ascendingOrder]: Specifies the order for results. If true, the results
  /// are returned in ascending creation order.
  Future<ListPoliciesResponse> listPolicies(
      {String marker, int pageSize, bool ascendingOrder}) async {
    var response_ = await _client.send('ListPolicies', {
      if (marker != null) 'marker': marker,
      if (pageSize != null) 'pageSize': pageSize,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListPoliciesResponse.fromJson(response_);
  }

  /// Lists the principals associated with the specified policy.
  ///
  ///  **Note:** This API is deprecated. Please use ListTargetsForPolicy
  /// instead.
  ///
  /// [policyName]: The policy name.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [ascendingOrder]: Specifies the order for results. If true, the results
  /// are returned in ascending creation order.
  Future<ListPolicyPrincipalsResponse> listPolicyPrincipals(String policyName,
      {String marker, int pageSize, bool ascendingOrder}) async {
    var response_ = await _client.send('ListPolicyPrincipals', {
      'policyName': policyName,
      if (marker != null) 'marker': marker,
      if (pageSize != null) 'pageSize': pageSize,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListPolicyPrincipalsResponse.fromJson(response_);
  }

  /// Lists the versions of the specified policy and identifies the default
  /// version.
  ///
  /// [policyName]: The policy name.
  Future<ListPolicyVersionsResponse> listPolicyVersions(
      String policyName) async {
    var response_ = await _client.send('ListPolicyVersions', {
      'policyName': policyName,
    });
    return ListPolicyVersionsResponse.fromJson(response_);
  }

  /// Lists the policies attached to the specified principal. If you use an
  /// Cognito identity, the ID must be in
  /// [AmazonCognito Identity format](https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax).
  ///
  ///  **Note:** This API is deprecated. Please use ListAttachedPolicies
  /// instead.
  ///
  /// [principal]: The principal.
  ///
  /// [marker]: The marker for the next set of results.
  ///
  /// [pageSize]: The result page size.
  ///
  /// [ascendingOrder]: Specifies the order for results. If true, results are
  /// returned in ascending creation order.
  Future<ListPrincipalPoliciesResponse> listPrincipalPolicies(String principal,
      {String marker, int pageSize, bool ascendingOrder}) async {
    var response_ = await _client.send('ListPrincipalPolicies', {
      'principal': principal,
      if (marker != null) 'marker': marker,
      if (pageSize != null) 'pageSize': pageSize,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListPrincipalPoliciesResponse.fromJson(response_);
  }

  /// Lists the things associated with the specified principal. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this operation.
  ///
  /// [principal]: The principal.
  Future<ListPrincipalThingsResponse> listPrincipalThings(String principal,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListPrincipalThings', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      'principal': principal,
    });
    return ListPrincipalThingsResponse.fromJson(response_);
  }

  /// Lists the role aliases registered in your account.
  ///
  /// [pageSize]: The maximum number of results to return at one time.
  ///
  /// [marker]: A marker used to get the next set of results.
  ///
  /// [ascendingOrder]: Return the list of role aliases in ascending
  /// alphabetical order.
  Future<ListRoleAliasesResponse> listRoleAliases(
      {int pageSize, String marker, bool ascendingOrder}) async {
    var response_ = await _client.send('ListRoleAliases', {
      if (pageSize != null) 'pageSize': pageSize,
      if (marker != null) 'marker': marker,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListRoleAliasesResponse.fromJson(response_);
  }

  /// Lists all of your scheduled audits.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  Future<ListScheduledAuditsResponse> listScheduledAudits(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListScheduledAudits', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListScheduledAuditsResponse.fromJson(response_);
  }

  /// Lists the Device Defender security profiles you have created. You can use
  /// filters to list only those security profiles associated with a thing group
  /// or only those associated with your account.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListSecurityProfilesResponse> listSecurityProfiles(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListSecurityProfiles', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListSecurityProfilesResponse.fromJson(response_);
  }

  /// Lists the Device Defender security profiles attached to a target (thing
  /// group).
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  ///
  /// [recursive]: If true, return child groups too.
  ///
  /// [securityProfileTargetArn]: The ARN of the target (thing group) whose
  /// attached security profiles you want to get.
  Future<ListSecurityProfilesForTargetResponse> listSecurityProfilesForTarget(
      String securityProfileTargetArn,
      {String nextToken,
      int maxResults,
      bool recursive}) async {
    var response_ = await _client.send('ListSecurityProfilesForTarget', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (recursive != null) 'recursive': recursive,
      'securityProfileTargetArn': securityProfileTargetArn,
    });
    return ListSecurityProfilesForTargetResponse.fromJson(response_);
  }

  /// Lists all of the streams in your AWS account.
  ///
  /// [maxResults]: The maximum number of results to return at a time.
  ///
  /// [nextToken]: A token used to get the next set of results.
  ///
  /// [ascendingOrder]: Set to true to return the list of streams in ascending
  /// order.
  Future<ListStreamsResponse> listStreams(
      {int maxResults, String nextToken, bool ascendingOrder}) async {
    var response_ = await _client.send('ListStreams', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
    });
    return ListStreamsResponse.fromJson(response_);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// List targets for the specified policy.
  ///
  /// [policyName]: The policy name.
  ///
  /// [marker]: A marker used to get the next set of results.
  ///
  /// [pageSize]: The maximum number of results to return at one time.
  Future<ListTargetsForPolicyResponse> listTargetsForPolicy(String policyName,
      {String marker, int pageSize}) async {
    var response_ = await _client.send('ListTargetsForPolicy', {
      'policyName': policyName,
      if (marker != null) 'marker': marker,
      if (pageSize != null) 'pageSize': pageSize,
    });
    return ListTargetsForPolicyResponse.fromJson(response_);
  }

  /// Lists the targets (thing groups) associated with a given Device Defender
  /// security profile.
  ///
  /// [securityProfileName]: The security profile.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListTargetsForSecurityProfileResponse> listTargetsForSecurityProfile(
      String securityProfileName,
      {String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListTargetsForSecurityProfile', {
      'securityProfileName': securityProfileName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListTargetsForSecurityProfileResponse.fromJson(response_);
  }

  /// List the thing groups in your account.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  ///
  /// [parentGroup]: A filter that limits the results to those with the
  /// specified parent group.
  ///
  /// [namePrefixFilter]: A filter that limits the results to those with the
  /// specified name prefix.
  ///
  /// [recursive]: If true, return child groups as well.
  Future<ListThingGroupsResponse> listThingGroups(
      {String nextToken,
      int maxResults,
      String parentGroup,
      String namePrefixFilter,
      bool recursive}) async {
    var response_ = await _client.send('ListThingGroups', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (parentGroup != null) 'parentGroup': parentGroup,
      if (namePrefixFilter != null) 'namePrefixFilter': namePrefixFilter,
      if (recursive != null) 'recursive': recursive,
    });
    return ListThingGroupsResponse.fromJson(response_);
  }

  /// List the thing groups to which the specified thing belongs.
  ///
  /// [thingName]: The thing name.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListThingGroupsForThingResponse> listThingGroupsForThing(
      String thingName,
      {String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListThingGroupsForThing', {
      'thingName': thingName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListThingGroupsForThingResponse.fromJson(response_);
  }

  /// Lists the principals associated with the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// [thingName]: The name of the thing.
  Future<ListThingPrincipalsResponse> listThingPrincipals(
      String thingName) async {
    var response_ = await _client.send('ListThingPrincipals', {
      'thingName': thingName,
    });
    return ListThingPrincipalsResponse.fromJson(response_);
  }

  /// Information about the thing registration tasks.
  ///
  /// [taskId]: The id of the task.
  ///
  /// [reportType]: The type of task report.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return per request.
  Future<ListThingRegistrationTaskReportsResponse>
      listThingRegistrationTaskReports(
          {@required String taskId,
          @required String reportType,
          String nextToken,
          int maxResults}) async {
    var response_ = await _client.send('ListThingRegistrationTaskReports', {
      'taskId': taskId,
      'reportType': reportType,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListThingRegistrationTaskReportsResponse.fromJson(response_);
  }

  /// List bulk thing provisioning tasks.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  ///
  /// [status]: The status of the bulk thing provisioning task.
  Future<ListThingRegistrationTasksResponse> listThingRegistrationTasks(
      {String nextToken, int maxResults, String status}) async {
    var response_ = await _client.send('ListThingRegistrationTasks', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (status != null) 'status': status,
    });
    return ListThingRegistrationTasksResponse.fromJson(response_);
  }

  /// Lists the existing thing types.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this operation.
  ///
  /// [thingTypeName]: The name of the thing type.
  Future<ListThingTypesResponse> listThingTypes(
      {String nextToken, int maxResults, String thingTypeName}) async {
    var response_ = await _client.send('ListThingTypes', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    });
    return ListThingTypesResponse.fromJson(response_);
  }

  /// Lists your things. Use the **attributeName** and **attributeValue**
  /// parameters to filter your things. For example, calling `ListThings` with
  /// attributeName=Color and attributeValue=Red retrieves all things in the
  /// registry that contain an attribute **Color** with the value **Red**.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return in this operation.
  ///
  /// [attributeName]: The attribute name used to search for things.
  ///
  /// [attributeValue]: The attribute value used to search for things.
  ///
  /// [thingTypeName]: The name of the thing type used to search for things.
  Future<ListThingsResponse> listThings(
      {String nextToken,
      int maxResults,
      String attributeName,
      String attributeValue,
      String thingTypeName}) async {
    var response_ = await _client.send('ListThings', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (attributeName != null) 'attributeName': attributeName,
      if (attributeValue != null) 'attributeValue': attributeValue,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    });
    return ListThingsResponse.fromJson(response_);
  }

  /// Lists the things you have added to the given billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return per request.
  Future<ListThingsInBillingGroupResponse> listThingsInBillingGroup(
      String billingGroupName,
      {String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListThingsInBillingGroup', {
      'billingGroupName': billingGroupName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListThingsInBillingGroupResponse.fromJson(response_);
  }

  /// Lists the things in the specified group.
  ///
  /// [thingGroupName]: The thing group name.
  ///
  /// [recursive]: When true, list things in this thing group and in all child
  /// groups as well.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListThingsInThingGroupResponse> listThingsInThingGroup(
      String thingGroupName,
      {bool recursive,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListThingsInThingGroup', {
      'thingGroupName': thingGroupName,
      if (recursive != null) 'recursive': recursive,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListThingsInThingGroupResponse.fromJson(response_);
  }

  /// Lists the rules for the specific topic.
  ///
  /// [topic]: The topic.
  ///
  /// [maxResults]: The maximum number of results to return.
  ///
  /// [nextToken]: A token used to retrieve the next value.
  ///
  /// [ruleDisabled]: Specifies whether the rule is disabled.
  Future<ListTopicRulesResponse> listTopicRules(
      {String topic,
      int maxResults,
      String nextToken,
      bool ruleDisabled}) async {
    var response_ = await _client.send('ListTopicRules', {
      if (topic != null) 'topic': topic,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (ruleDisabled != null) 'ruleDisabled': ruleDisabled,
    });
    return ListTopicRulesResponse.fromJson(response_);
  }

  /// Lists logging levels.
  ///
  /// [targetType]: The type of resource for which you are configuring logging.
  /// Must be `THING_Group`.
  ///
  /// [nextToken]: The token used to get the next set of results, or **null** if
  /// there are no additional results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListV2LoggingLevelsResponse> listV2LoggingLevels(
      {String targetType, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListV2LoggingLevels', {
      if (targetType != null) 'targetType': targetType,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListV2LoggingLevelsResponse.fromJson(response_);
  }

  /// Lists the Device Defender security profile violations discovered during
  /// the given time period. You can use filters to limit the results to those
  /// alerts issued for a particular security profile, behavior, or thing
  /// (device).
  ///
  /// [startTime]: The start time for the alerts to be listed.
  ///
  /// [endTime]: The end time for the alerts to be listed.
  ///
  /// [thingName]: A filter to limit results to those alerts caused by the
  /// specified thing.
  ///
  /// [securityProfileName]: A filter to limit results to those alerts generated
  /// by the specified security profile.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListViolationEventsResponse> listViolationEvents(
      {@required DateTime startTime,
      @required DateTime endTime,
      String thingName,
      String securityProfileName,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListViolationEvents', {
      'startTime': startTime,
      'endTime': endTime,
      if (thingName != null) 'thingName': thingName,
      if (securityProfileName != null)
        'securityProfileName': securityProfileName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListViolationEventsResponse.fromJson(response_);
  }

  /// Registers a CA certificate with AWS IoT. This CA certificate can then be
  /// used to sign device certificates, which can be then registered with AWS
  /// IoT. You can register up to 10 CA certificates per AWS account that have
  /// the same subject field. This enables you to have up to 10 certificate
  /// authorities sign your device certificates. If you have more than one CA
  /// certificate registered, make sure you pass the CA certificate when you
  /// register your device certificates with the RegisterCertificate API.
  ///
  /// [caCertificate]: The CA certificate.
  ///
  /// [verificationCertificate]: The private key verification certificate.
  ///
  /// [setAsActive]: A boolean value that specifies if the CA certificate is set
  /// to active.
  ///
  /// [allowAutoRegistration]: Allows this CA certificate to be used for auto
  /// registration of device certificates.
  ///
  /// [registrationConfig]: Information about the registration configuration.
  Future<RegisterCACertificateResponse> registerCACertificate(
      {@required String caCertificate,
      @required String verificationCertificate,
      bool setAsActive,
      bool allowAutoRegistration,
      RegistrationConfig registrationConfig}) async {
    var response_ = await _client.send('RegisterCACertificate', {
      'caCertificate': caCertificate,
      'verificationCertificate': verificationCertificate,
      if (setAsActive != null) 'setAsActive': setAsActive,
      if (allowAutoRegistration != null)
        'allowAutoRegistration': allowAutoRegistration,
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
    });
    return RegisterCACertificateResponse.fromJson(response_);
  }

  /// Registers a device certificate with AWS IoT. If you have more than one CA
  /// certificate that has the same subject field, you must specify the CA
  /// certificate that was used to sign the device certificate being registered.
  ///
  /// [certificatePem]: The certificate data, in PEM format.
  ///
  /// [caCertificatePem]: The CA certificate used to sign the device certificate
  /// being registered.
  ///
  /// [setAsActive]: A boolean value that specifies if the certificate is set to
  /// active.
  ///
  /// [status]: The status of the register certificate request.
  Future<RegisterCertificateResponse> registerCertificate(String certificatePem,
      {String caCertificatePem, bool setAsActive, String status}) async {
    var response_ = await _client.send('RegisterCertificate', {
      'certificatePem': certificatePem,
      if (caCertificatePem != null) 'caCertificatePem': caCertificatePem,
      if (setAsActive != null) 'setAsActive': setAsActive,
      if (status != null) 'status': status,
    });
    return RegisterCertificateResponse.fromJson(response_);
  }

  /// Provisions a thing.
  ///
  /// [templateBody]: The provisioning template. See
  /// [Programmatic Provisioning](https://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html)
  /// for more information.
  ///
  /// [parameters]: The parameters for provisioning a thing. See
  /// [Programmatic Provisioning](https://docs.aws.amazon.com/iot/latest/developerguide/programmatic-provisioning.html)
  /// for more information.
  Future<RegisterThingResponse> registerThing(String templateBody,
      {Map<String, String> parameters}) async {
    var response_ = await _client.send('RegisterThing', {
      'templateBody': templateBody,
      if (parameters != null) 'parameters': parameters,
    });
    return RegisterThingResponse.fromJson(response_);
  }

  /// Rejects a pending certificate transfer. After AWS IoT rejects a
  /// certificate transfer, the certificate status changes from
  /// **PENDING_TRANSFER** to **INACTIVE**.
  ///
  /// To check for pending certificate transfers, call ListCertificates to
  /// enumerate your certificates.
  ///
  /// This operation can only be called by the transfer destination. After it is
  /// called, the certificate will be returned to the source's account in the
  /// INACTIVE state.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  ///
  /// [rejectReason]: The reason the certificate transfer was rejected.
  Future<void> rejectCertificateTransfer(String certificateId,
      {String rejectReason}) async {
    await _client.send('RejectCertificateTransfer', {
      'certificateId': certificateId,
      if (rejectReason != null) 'rejectReason': rejectReason,
    });
  }

  /// Removes the given thing from the billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  ///
  /// [billingGroupArn]: The ARN of the billing group.
  ///
  /// [thingName]: The name of the thing to be removed from the billing group.
  ///
  /// [thingArn]: The ARN of the thing to be removed from the billing group.
  Future<RemoveThingFromBillingGroupResponse> removeThingFromBillingGroup(
      {String billingGroupName,
      String billingGroupArn,
      String thingName,
      String thingArn}) async {
    var response_ = await _client.send('RemoveThingFromBillingGroup', {
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (thingName != null) 'thingName': thingName,
      if (thingArn != null) 'thingArn': thingArn,
    });
    return RemoveThingFromBillingGroupResponse.fromJson(response_);
  }

  /// Remove the specified thing from the specified group.
  ///
  /// [thingGroupName]: The group name.
  ///
  /// [thingGroupArn]: The group ARN.
  ///
  /// [thingName]: The name of the thing to remove from the group.
  ///
  /// [thingArn]: The ARN of the thing to remove from the group.
  Future<RemoveThingFromThingGroupResponse> removeThingFromThingGroup(
      {String thingGroupName,
      String thingGroupArn,
      String thingName,
      String thingArn}) async {
    var response_ = await _client.send('RemoveThingFromThingGroup', {
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingName != null) 'thingName': thingName,
      if (thingArn != null) 'thingArn': thingArn,
    });
    return RemoveThingFromThingGroupResponse.fromJson(response_);
  }

  /// Replaces the rule. You must specify all parameters for the new rule.
  /// Creating rules is an administrator-level action. Any user who has
  /// permission to create rules will be able to access data processed by the
  /// rule.
  ///
  /// [ruleName]: The name of the rule.
  ///
  /// [topicRulePayload]: The rule payload.
  Future<void> replaceTopicRule(
      {@required String ruleName,
      @required TopicRulePayload topicRulePayload}) async {
    await _client.send('ReplaceTopicRule', {
      'ruleName': ruleName,
      'topicRulePayload': topicRulePayload,
    });
  }

  /// The query search index.
  ///
  /// [indexName]: The search index name.
  ///
  /// [queryString]: The search query string.
  ///
  /// [nextToken]: The token used to get the next set of results, or null if
  /// there are no additional results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  ///
  /// [queryVersion]: The query version.
  Future<SearchIndexResponse> searchIndex(String queryString,
      {String indexName,
      String nextToken,
      int maxResults,
      String queryVersion}) async {
    var response_ = await _client.send('SearchIndex', {
      if (indexName != null) 'indexName': indexName,
      'queryString': queryString,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (queryVersion != null) 'queryVersion': queryVersion,
    });
    return SearchIndexResponse.fromJson(response_);
  }

  /// Sets the default authorizer. This will be used if a websocket connection
  /// is made without specifying an authorizer.
  ///
  /// [authorizerName]: The authorizer name.
  Future<SetDefaultAuthorizerResponse> setDefaultAuthorizer(
      String authorizerName) async {
    var response_ = await _client.send('SetDefaultAuthorizer', {
      'authorizerName': authorizerName,
    });
    return SetDefaultAuthorizerResponse.fromJson(response_);
  }

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version. This action affects all certificates to which the
  /// policy is attached. To list the principals the policy is attached to, use
  /// the ListPrincipalPolicy API.
  ///
  /// [policyName]: The policy name.
  ///
  /// [policyVersionId]: The policy version ID.
  Future<void> setDefaultPolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {
    await _client.send('SetDefaultPolicyVersion', {
      'policyName': policyName,
      'policyVersionId': policyVersionId,
    });
  }

  /// Sets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `SetV2LoggingOptions`
  /// instead.
  ///
  /// [loggingOptionsPayload]: The logging options payload.
  Future<void> setLoggingOptions(
      LoggingOptionsPayload loggingOptionsPayload) async {
    await _client.send('SetLoggingOptions', {
      'loggingOptionsPayload': loggingOptionsPayload,
    });
  }

  /// Sets the logging level.
  ///
  /// [logTarget]: The log target.
  ///
  /// [logLevel]: The log level.
  Future<void> setV2LoggingLevel(
      {@required LogTarget logTarget, @required String logLevel}) async {
    await _client.send('SetV2LoggingLevel', {
      'logTarget': logTarget,
      'logLevel': logLevel,
    });
  }

  /// Sets the logging options for the V2 logging service.
  ///
  /// [roleArn]: The ARN of the role that allows IoT to write to Cloudwatch
  /// logs.
  ///
  /// [defaultLogLevel]: The default logging level.
  ///
  /// [disableAllLogs]: If true all logs are disabled. The default is false.
  Future<void> setV2LoggingOptions(
      {String roleArn, String defaultLogLevel, bool disableAllLogs}) async {
    await _client.send('SetV2LoggingOptions', {
      if (roleArn != null) 'roleArn': roleArn,
      if (defaultLogLevel != null) 'defaultLogLevel': defaultLogLevel,
      if (disableAllLogs != null) 'disableAllLogs': disableAllLogs,
    });
  }

  /// Starts a task that applies a set of mitigation actions to the specified
  /// target.
  ///
  /// [taskId]: A unique identifier for the task. You can use this identifier to
  /// check the status of the task or to cancel it.
  ///
  /// [target]: Specifies the audit findings to which the mitigation actions are
  /// applied. You can apply them to a type of audit check, to all findings from
  /// an audit, or to a speecific set of findings.
  ///
  /// [auditCheckToActionsMapping]: For an audit check, specifies which
  /// mitigation actions to apply. Those actions must be defined in your AWS
  /// account.
  ///
  /// [clientRequestToken]: Each audit mitigation task must have a unique client
  /// request token. If you try to start a new task with the same token as a
  /// task that already exists, an exception occurs. If you omit this value, a
  /// unique client request token is generated automatically.
  Future<StartAuditMitigationActionsTaskResponse>
      startAuditMitigationActionsTask(
          {@required String taskId,
          @required AuditMitigationActionsTaskTarget target,
          @required Map<String, List<String>> auditCheckToActionsMapping,
          @required String clientRequestToken}) async {
    var response_ = await _client.send('StartAuditMitigationActionsTask', {
      'taskId': taskId,
      'target': target,
      'auditCheckToActionsMapping': auditCheckToActionsMapping,
      'clientRequestToken': clientRequestToken,
    });
    return StartAuditMitigationActionsTaskResponse.fromJson(response_);
  }

  /// Starts an on-demand Device Defender audit.
  ///
  /// [targetCheckNames]: Which checks are performed during the audit. The
  /// checks you specify must be enabled for your account or an exception
  /// occurs. Use `DescribeAccountAuditConfiguration` to see the list of all
  /// checks, including those that are enabled or
  /// `UpdateAccountAuditConfiguration` to select which checks are enabled.
  Future<StartOnDemandAuditTaskResponse> startOnDemandAuditTask(
      List<String> targetCheckNames) async {
    var response_ = await _client.send('StartOnDemandAuditTask', {
      'targetCheckNames': targetCheckNames,
    });
    return StartOnDemandAuditTaskResponse.fromJson(response_);
  }

  /// Creates a bulk thing provisioning task.
  ///
  /// [templateBody]: The provisioning template.
  ///
  /// [inputFileBucket]: The S3 bucket that contains the input file.
  ///
  /// [inputFileKey]: The name of input file within the S3 bucket. This file
  /// contains a newline delimited JSON file. Each line contains the parameter
  /// values to provision one device (thing).
  ///
  /// [roleArn]: The IAM role ARN that grants permission the input file.
  Future<StartThingRegistrationTaskResponse> startThingRegistrationTask(
      {@required String templateBody,
      @required String inputFileBucket,
      @required String inputFileKey,
      @required String roleArn}) async {
    var response_ = await _client.send('StartThingRegistrationTask', {
      'templateBody': templateBody,
      'inputFileBucket': inputFileBucket,
      'inputFileKey': inputFileKey,
      'roleArn': roleArn,
    });
    return StartThingRegistrationTaskResponse.fromJson(response_);
  }

  /// Cancels a bulk thing provisioning task.
  ///
  /// [taskId]: The bulk thing provisioning task ID.
  Future<StopThingRegistrationTaskResponse> stopThingRegistrationTask(
      String taskId) async {
    var response_ = await _client.send('StopThingRegistrationTask', {
      'taskId': taskId,
    });
    return StopThingRegistrationTaskResponse.fromJson(response_);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tags]: The new or modified tags for the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Tests if a specified principal is authorized to perform an AWS IoT action
  /// on a specified resource. Use this to test and debug the authorization
  /// behavior of devices that connect to the AWS IoT device gateway.
  ///
  /// [principal]: The principal.
  ///
  /// [cognitoIdentityPoolId]: The Cognito identity pool ID.
  ///
  /// [authInfos]: A list of authorization info objects. Simulating
  /// authorization will create a response for each `authInfo` object in the
  /// list.
  ///
  /// [clientId]: The MQTT client ID.
  ///
  /// [policyNamesToAdd]: When testing custom authorization, the policies
  /// specified here are treated as if they are attached to the principal being
  /// authorized.
  ///
  /// [policyNamesToSkip]: When testing custom authorization, the policies
  /// specified here are treated as if they are not attached to the principal
  /// being authorized.
  Future<TestAuthorizationResponse> testAuthorization(List<AuthInfo> authInfos,
      {String principal,
      String cognitoIdentityPoolId,
      String clientId,
      List<String> policyNamesToAdd,
      List<String> policyNamesToSkip}) async {
    var response_ = await _client.send('TestAuthorization', {
      if (principal != null) 'principal': principal,
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      'authInfos': authInfos,
      if (clientId != null) 'clientId': clientId,
      if (policyNamesToAdd != null) 'policyNamesToAdd': policyNamesToAdd,
      if (policyNamesToSkip != null) 'policyNamesToSkip': policyNamesToSkip,
    });
    return TestAuthorizationResponse.fromJson(response_);
  }

  /// Tests a custom authorization behavior by invoking a specified custom
  /// authorizer. Use this to test and debug the custom authorization behavior
  /// of devices that connect to the AWS IoT device gateway.
  ///
  /// [authorizerName]: The custom authorizer name.
  ///
  /// [token]: The token returned by your custom authentication service.
  ///
  /// [tokenSignature]: The signature made with the token and your custom
  /// authentication service's private key.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer(
      {@required String authorizerName,
      @required String token,
      @required String tokenSignature}) async {
    var response_ = await _client.send('TestInvokeAuthorizer', {
      'authorizerName': authorizerName,
      'token': token,
      'tokenSignature': tokenSignature,
    });
    return TestInvokeAuthorizerResponse.fromJson(response_);
  }

  /// Transfers the specified certificate to the specified AWS account.
  ///
  /// You can cancel the transfer until it is acknowledged by the recipient.
  ///
  /// No notification is sent to the transfer destination's account. It is up to
  /// the caller to notify the transfer target.
  ///
  /// The certificate being transferred must not be in the ACTIVE state. You can
  /// use the UpdateCertificate API to deactivate it.
  ///
  /// The certificate must not have any policies attached to it. You can use the
  /// DetachPrincipalPolicy API to detach them.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  ///
  /// [targetAwsAccount]: The AWS account.
  ///
  /// [transferMessage]: The transfer message.
  Future<TransferCertificateResponse> transferCertificate(
      {@required String certificateId,
      @required String targetAwsAccount,
      String transferMessage}) async {
    var response_ = await _client.send('TransferCertificate', {
      'certificateId': certificateId,
      'targetAwsAccount': targetAwsAccount,
      if (transferMessage != null) 'transferMessage': transferMessage,
    });
    return TransferCertificateResponse.fromJson(response_);
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tagKeys]: A list of the keys of the tags to be removed from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Configures or reconfigures the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  ///
  /// [roleArn]: The ARN of the role that grants permission to AWS IoT to access
  /// information about your devices, policies, certificates and other items as
  /// required when performing an audit.
  ///
  /// [auditNotificationTargetConfigurations]: Information about the targets to
  /// which audit notifications are sent.
  ///
  /// [auditCheckConfigurations]: Specifies which audit checks are enabled and
  /// disabled for this account. Use `DescribeAccountAuditConfiguration` to see
  /// the list of all checks, including those that are currently enabled.
  ///
  /// Some data collection might start immediately when certain checks are
  /// enabled. When a check is disabled, any data collected so far in relation
  /// to the check is deleted.
  ///
  /// You cannot disable a check if it is used by any scheduled audit. You must
  /// first delete the check from the scheduled audit or delete the scheduled
  /// audit itself.
  ///
  /// On the first call to `UpdateAccountAuditConfiguration`, this parameter is
  /// required and must specify at least one enabled check.
  Future<UpdateAccountAuditConfigurationResponse>
      updateAccountAuditConfiguration(
          {String roleArn,
          Map<String, AuditNotificationTarget>
              auditNotificationTargetConfigurations,
          Map<String, AuditCheckConfiguration>
              auditCheckConfigurations}) async {
    var response_ = await _client.send('UpdateAccountAuditConfiguration', {
      if (roleArn != null) 'roleArn': roleArn,
      if (auditNotificationTargetConfigurations != null)
        'auditNotificationTargetConfigurations':
            auditNotificationTargetConfigurations,
      if (auditCheckConfigurations != null)
        'auditCheckConfigurations': auditCheckConfigurations,
    });
    return UpdateAccountAuditConfigurationResponse.fromJson(response_);
  }

  /// Updates an authorizer.
  ///
  /// [authorizerName]: The authorizer name.
  ///
  /// [authorizerFunctionArn]: The ARN of the authorizer's Lambda function.
  ///
  /// [tokenKeyName]: The key used to extract the token from the HTTP headers.
  ///
  /// [tokenSigningPublicKeys]: The public keys used to verify the token
  /// signature.
  ///
  /// [status]: The status of the update authorizer request.
  Future<UpdateAuthorizerResponse> updateAuthorizer(String authorizerName,
      {String authorizerFunctionArn,
      String tokenKeyName,
      Map<String, String> tokenSigningPublicKeys,
      String status}) async {
    var response_ = await _client.send('UpdateAuthorizer', {
      'authorizerName': authorizerName,
      if (authorizerFunctionArn != null)
        'authorizerFunctionArn': authorizerFunctionArn,
      if (tokenKeyName != null) 'tokenKeyName': tokenKeyName,
      if (tokenSigningPublicKeys != null)
        'tokenSigningPublicKeys': tokenSigningPublicKeys,
      if (status != null) 'status': status,
    });
    return UpdateAuthorizerResponse.fromJson(response_);
  }

  /// Updates information about the billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  ///
  /// [billingGroupProperties]: The properties of the billing group.
  ///
  /// [expectedVersion]: The expected version of the billing group. If the
  /// version of the billing group does not match the expected version specified
  /// in the request, the `UpdateBillingGroup` request is rejected with a
  /// `VersionConflictException`.
  Future<UpdateBillingGroupResponse> updateBillingGroup(
      {@required String billingGroupName,
      @required BillingGroupProperties billingGroupProperties,
      BigInt expectedVersion}) async {
    var response_ = await _client.send('UpdateBillingGroup', {
      'billingGroupName': billingGroupName,
      'billingGroupProperties': billingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return UpdateBillingGroupResponse.fromJson(response_);
  }

  /// Updates a registered CA certificate.
  ///
  /// [certificateId]: The CA certificate identifier.
  ///
  /// [newStatus]: The updated status of the CA certificate.
  ///
  ///  **Note:** The status value REGISTER_INACTIVE is deprecated and should not
  /// be used.
  ///
  /// [newAutoRegistrationStatus]: The new value for the auto registration
  /// status. Valid values are: "ENABLE" or "DISABLE".
  ///
  /// [registrationConfig]: Information about the registration configuration.
  ///
  /// [removeAutoRegistration]: If true, removes auto registration.
  Future<void> updateCACertificate(String certificateId,
      {String newStatus,
      String newAutoRegistrationStatus,
      RegistrationConfig registrationConfig,
      bool removeAutoRegistration}) async {
    await _client.send('UpdateCACertificate', {
      'certificateId': certificateId,
      if (newStatus != null) 'newStatus': newStatus,
      if (newAutoRegistrationStatus != null)
        'newAutoRegistrationStatus': newAutoRegistrationStatus,
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
      if (removeAutoRegistration != null)
        'removeAutoRegistration': removeAutoRegistration,
    });
  }

  /// Updates the status of the specified certificate. This operation is
  /// idempotent.
  ///
  /// Moving a certificate from the ACTIVE state (including REVOKED) will not
  /// disconnect currently connected devices, but these devices will be unable
  /// to reconnect.
  ///
  /// The ACTIVE state is required to authenticate devices connecting to AWS IoT
  /// using a certificate.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  ///
  /// [newStatus]: The new status.
  ///
  ///  **Note:** Setting the status to PENDING_TRANSFER will result in an
  /// exception being thrown. PENDING_TRANSFER is a status used internally by
  /// AWS IoT. It is not intended for developer use.
  ///
  ///  **Note:** The status value REGISTER_INACTIVE is deprecated and should not
  /// be used.
  Future<void> updateCertificate(
      {@required String certificateId, @required String newStatus}) async {
    await _client.send('UpdateCertificate', {
      'certificateId': certificateId,
      'newStatus': newStatus,
    });
  }

  /// Updates a dynamic thing group.
  ///
  /// [thingGroupName]: The name of the dynamic thing group to update.
  ///
  /// [thingGroupProperties]: The dynamic thing group properties to update.
  ///
  /// [expectedVersion]: The expected version of the dynamic thing group to
  /// update.
  ///
  /// [indexName]: The dynamic thing group index to update.
  ///
  ///
  ///
  /// Currently one index is supported: 'AWS_Things'.
  ///
  /// [queryString]: The dynamic thing group search query string to update.
  ///
  /// [queryVersion]: The dynamic thing group query version to update.
  ///
  ///
  ///
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  Future<UpdateDynamicThingGroupResponse> updateDynamicThingGroup(
      {@required String thingGroupName,
      @required ThingGroupProperties thingGroupProperties,
      BigInt expectedVersion,
      String indexName,
      String queryString,
      String queryVersion}) async {
    var response_ = await _client.send('UpdateDynamicThingGroup', {
      'thingGroupName': thingGroupName,
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (indexName != null) 'indexName': indexName,
      if (queryString != null) 'queryString': queryString,
      if (queryVersion != null) 'queryVersion': queryVersion,
    });
    return UpdateDynamicThingGroupResponse.fromJson(response_);
  }

  /// Updates the event configurations.
  ///
  /// [eventConfigurations]: The new event configuration values.
  Future<UpdateEventConfigurationsResponse> updateEventConfigurations(
      {Map<String, Configuration> eventConfigurations}) async {
    var response_ = await _client.send('UpdateEventConfigurations', {
      if (eventConfigurations != null)
        'eventConfigurations': eventConfigurations,
    });
    return UpdateEventConfigurationsResponse.fromJson(response_);
  }

  /// Updates the search configuration.
  ///
  /// [thingIndexingConfiguration]: Thing indexing configuration.
  ///
  /// [thingGroupIndexingConfiguration]: Thing group indexing configuration.
  Future<UpdateIndexingConfigurationResponse> updateIndexingConfiguration(
      {ThingIndexingConfiguration thingIndexingConfiguration,
      ThingGroupIndexingConfiguration thingGroupIndexingConfiguration}) async {
    var response_ = await _client.send('UpdateIndexingConfiguration', {
      if (thingIndexingConfiguration != null)
        'thingIndexingConfiguration': thingIndexingConfiguration,
      if (thingGroupIndexingConfiguration != null)
        'thingGroupIndexingConfiguration': thingGroupIndexingConfiguration,
    });
    return UpdateIndexingConfigurationResponse.fromJson(response_);
  }

  /// Updates supported fields of the specified job.
  ///
  /// [jobId]: The ID of the job to be updated.
  ///
  /// [description]: A short text description of the job.
  ///
  /// [presignedUrlConfig]: Configuration information for pre-signed S3 URLs.
  ///
  /// [jobExecutionsRolloutConfig]: Allows you to create a staged rollout of the
  /// job.
  ///
  /// [abortConfig]: Allows you to create criteria to abort a job.
  ///
  /// [timeoutConfig]: Specifies the amount of time each device has to finish
  /// its execution of the job. The timer is started when the job execution
  /// status is set to `IN_PROGRESS`. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to `TIMED_OUT`.
  Future<void> updateJob(String jobId,
      {String description,
      PresignedUrlConfig presignedUrlConfig,
      JobExecutionsRolloutConfig jobExecutionsRolloutConfig,
      AbortConfig abortConfig,
      TimeoutConfig timeoutConfig}) async {
    await _client.send('UpdateJob', {
      'jobId': jobId,
      if (description != null) 'description': description,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    });
  }

  /// Updates the definition for the specified mitigation action.
  ///
  /// [actionName]: The friendly name for the mitigation action. You can't
  /// change the name by using `UpdateMitigationAction`. Instead, you must
  /// delete and re-create the mitigation action with the new name.
  ///
  /// [roleArn]: The ARN of the IAM role that is used to apply the mitigation
  /// action.
  ///
  /// [actionParams]: Defines the type of action and the parameters for that
  /// action.
  Future<UpdateMitigationActionResponse> updateMitigationAction(
      String actionName,
      {String roleArn,
      MitigationActionParams actionParams}) async {
    var response_ = await _client.send('UpdateMitigationAction', {
      'actionName': actionName,
      if (roleArn != null) 'roleArn': roleArn,
      if (actionParams != null) 'actionParams': actionParams,
    });
    return UpdateMitigationActionResponse.fromJson(response_);
  }

  /// Updates a role alias.
  ///
  /// [roleAlias]: The role alias to update.
  ///
  /// [roleArn]: The role ARN.
  ///
  /// [credentialDurationSeconds]: The number of seconds the credential will be
  /// valid.
  Future<UpdateRoleAliasResponse> updateRoleAlias(String roleAlias,
      {String roleArn, int credentialDurationSeconds}) async {
    var response_ = await _client.send('UpdateRoleAlias', {
      'roleAlias': roleAlias,
      if (roleArn != null) 'roleArn': roleArn,
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
    });
    return UpdateRoleAliasResponse.fromJson(response_);
  }

  /// Updates a scheduled audit, including which checks are performed and how
  /// often the audit takes place.
  ///
  /// [frequency]: How often the scheduled audit takes place. Can be one of
  /// "DAILY", "WEEKLY", "BIWEEKLY", or "MONTHLY". The start time of each audit
  /// is determined by the system.
  ///
  /// [dayOfMonth]: The day of the month on which the scheduled audit takes
  /// place. Can be "1" through "31" or "LAST". This field is required if the
  /// "frequency" parameter is set to "MONTHLY". If days 29-31 are specified,
  /// and the month does not have that many days, the audit takes place on the
  /// "LAST" day of the month.
  ///
  /// [dayOfWeek]: The day of the week on which the scheduled audit takes place.
  /// Can be one of "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT". This
  /// field is required if the "frequency" parameter is set to "WEEKLY" or
  /// "BIWEEKLY".
  ///
  /// [targetCheckNames]: Which checks are performed during the scheduled audit.
  /// Checks must be enabled for your account. (Use
  /// `DescribeAccountAuditConfiguration` to see the list of all checks,
  /// including those that are enabled or use `UpdateAccountAuditConfiguration`
  /// to select which checks are enabled.)
  ///
  /// [scheduledAuditName]: The name of the scheduled audit. (Max. 128 chars)
  Future<UpdateScheduledAuditResponse> updateScheduledAudit(
      String scheduledAuditName,
      {String frequency,
      String dayOfMonth,
      String dayOfWeek,
      List<String> targetCheckNames}) async {
    var response_ = await _client.send('UpdateScheduledAudit', {
      if (frequency != null) 'frequency': frequency,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek,
      if (targetCheckNames != null) 'targetCheckNames': targetCheckNames,
      'scheduledAuditName': scheduledAuditName,
    });
    return UpdateScheduledAuditResponse.fromJson(response_);
  }

  /// Updates a Device Defender security profile.
  ///
  /// [securityProfileName]: The name of the security profile you want to
  /// update.
  ///
  /// [securityProfileDescription]: A description of the security profile.
  ///
  /// [behaviors]: Specifies the behaviors that, when violated by a device
  /// (thing), cause an alert.
  ///
  /// [alertTargets]: Where the alerts are sent. (Alerts are always sent to the
  /// console.)
  ///
  /// [additionalMetricsToRetain]: A list of metrics whose data is retained
  /// (stored). By default, data is retained for any metric used in the
  /// profile's `behaviors`, but it is also retained for any metric specified
  /// here.
  ///
  /// [deleteBehaviors]: If true, delete all `behaviors` defined for this
  /// security profile. If any `behaviors` are defined in the current
  /// invocation, an exception occurs.
  ///
  /// [deleteAlertTargets]: If true, delete all `alertTargets` defined for this
  /// security profile. If any `alertTargets` are defined in the current
  /// invocation, an exception occurs.
  ///
  /// [deleteAdditionalMetricsToRetain]: If true, delete all
  /// `additionalMetricsToRetain` defined for this security profile. If any
  /// `additionalMetricsToRetain` are defined in the current invocation, an
  /// exception occurs.
  ///
  /// [expectedVersion]: The expected version of the security profile. A new
  /// version is generated whenever the security profile is updated. If you
  /// specify a value that is different from the actual version, a
  /// `VersionConflictException` is thrown.
  Future<UpdateSecurityProfileResponse> updateSecurityProfile(
      String securityProfileName,
      {String securityProfileDescription,
      List<Behavior> behaviors,
      Map<String, AlertTarget> alertTargets,
      List<String> additionalMetricsToRetain,
      bool deleteBehaviors,
      bool deleteAlertTargets,
      bool deleteAdditionalMetricsToRetain,
      BigInt expectedVersion}) async {
    var response_ = await _client.send('UpdateSecurityProfile', {
      'securityProfileName': securityProfileName,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
      if (behaviors != null) 'behaviors': behaviors,
      if (alertTargets != null) 'alertTargets': alertTargets,
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (deleteBehaviors != null) 'deleteBehaviors': deleteBehaviors,
      if (deleteAlertTargets != null) 'deleteAlertTargets': deleteAlertTargets,
      if (deleteAdditionalMetricsToRetain != null)
        'deleteAdditionalMetricsToRetain': deleteAdditionalMetricsToRetain,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return UpdateSecurityProfileResponse.fromJson(response_);
  }

  /// Updates an existing stream. The stream version will be incremented by one.
  ///
  /// [streamId]: The stream ID.
  ///
  /// [description]: The description of the stream.
  ///
  /// [files]: The files associated with the stream.
  ///
  /// [roleArn]: An IAM role that allows the IoT service principal assumes to
  /// access your S3 files.
  Future<UpdateStreamResponse> updateStream(String streamId,
      {String description, List<StreamFile> files, String roleArn}) async {
    var response_ = await _client.send('UpdateStream', {
      'streamId': streamId,
      if (description != null) 'description': description,
      if (files != null) 'files': files,
      if (roleArn != null) 'roleArn': roleArn,
    });
    return UpdateStreamResponse.fromJson(response_);
  }

  /// Updates the data for a thing.
  ///
  /// [thingName]: The name of the thing to update.
  ///
  /// [thingTypeName]: The name of the thing type.
  ///
  /// [attributePayload]: A list of thing attributes, a JSON string containing
  /// name-value pairs. For example:
  ///
  ///  `{"attributes":{"name1":"value2"}}`
  ///
  /// This data is used to add new attributes or update existing attributes.
  ///
  /// [expectedVersion]: The expected version of the thing record in the
  /// registry. If the version of the record in the registry does not match the
  /// expected version specified in the request, the `UpdateThing` request is
  /// rejected with a `VersionConflictException`.
  ///
  /// [removeThingType]: Remove a thing type association. If **true**, the
  /// association is removed.
  Future<UpdateThingResponse> updateThing(String thingName,
      {String thingTypeName,
      AttributePayload attributePayload,
      BigInt expectedVersion,
      bool removeThingType}) async {
    var response_ = await _client.send('UpdateThing', {
      'thingName': thingName,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (removeThingType != null) 'removeThingType': removeThingType,
    });
    return UpdateThingResponse.fromJson(response_);
  }

  /// Update a thing group.
  ///
  /// [thingGroupName]: The thing group to update.
  ///
  /// [thingGroupProperties]: The thing group properties.
  ///
  /// [expectedVersion]: The expected version of the thing group. If this does
  /// not match the version of the thing group being updated, the update will
  /// fail.
  Future<UpdateThingGroupResponse> updateThingGroup(
      {@required String thingGroupName,
      @required ThingGroupProperties thingGroupProperties,
      BigInt expectedVersion}) async {
    var response_ = await _client.send('UpdateThingGroup', {
      'thingGroupName': thingGroupName,
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    });
    return UpdateThingGroupResponse.fromJson(response_);
  }

  /// Updates the groups to which the thing belongs.
  ///
  /// [thingName]: The thing whose group memberships will be updated.
  ///
  /// [thingGroupsToAdd]: The groups to which the thing will be added.
  ///
  /// [thingGroupsToRemove]: The groups from which the thing will be removed.
  ///
  /// [overrideDynamicGroups]: Override dynamic thing groups with static thing
  /// groups when 10-group limit is reached. If a thing belongs to 10 thing
  /// groups, and one or more of those groups are dynamic thing groups, adding a
  /// thing to a static group removes the thing from the last dynamic group.
  Future<UpdateThingGroupsForThingResponse> updateThingGroupsForThing(
      {String thingName,
      List<String> thingGroupsToAdd,
      List<String> thingGroupsToRemove,
      bool overrideDynamicGroups}) async {
    var response_ = await _client.send('UpdateThingGroupsForThing', {
      if (thingName != null) 'thingName': thingName,
      if (thingGroupsToAdd != null) 'thingGroupsToAdd': thingGroupsToAdd,
      if (thingGroupsToRemove != null)
        'thingGroupsToRemove': thingGroupsToRemove,
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
    });
    return UpdateThingGroupsForThingResponse.fromJson(response_);
  }

  /// Validates a Device Defender security profile behaviors specification.
  ///
  /// [behaviors]: Specifies the behaviors that, when violated by a device
  /// (thing), cause an alert.
  Future<ValidateSecurityProfileBehaviorsResponse>
      validateSecurityProfileBehaviors(List<Behavior> behaviors) async {
    var response_ = await _client.send('ValidateSecurityProfileBehaviors', {
      'behaviors': behaviors,
    });
    return ValidateSecurityProfileBehaviorsResponse.fromJson(response_);
  }
}

/// Details of abort criteria to abort the job.
class AbortConfig {
  /// The list of abort criteria to define rules to abort the job.
  final List<AbortCriteria> criteriaList;

  AbortConfig({
    @required this.criteriaList,
  });
  static AbortConfig fromJson(Map<String, dynamic> json) => AbortConfig(
        criteriaList: (json['criteriaList'] as List)
            .map((e) => AbortCriteria.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Details of abort criteria to define rules to abort the job.
class AbortCriteria {
  /// The type of job execution failure to define a rule to initiate a job
  /// abort.
  final String failureType;

  /// The type of abort action to initiate a job abort.
  final String action;

  /// The threshold as a percentage of the total number of executed things that
  /// will initiate a job abort.
  ///
  /// AWS IoT supports up to two digits after the decimal (for example, 10.9 and
  /// 10.99, but not 10.999).
  final double thresholdPercentage;

  /// Minimum number of executed things before evaluating an abort rule.
  final int minNumberOfExecutedThings;

  AbortCriteria({
    @required this.failureType,
    @required this.action,
    @required this.thresholdPercentage,
    @required this.minNumberOfExecutedThings,
  });
  static AbortCriteria fromJson(Map<String, dynamic> json) => AbortCriteria(
        failureType: json['failureType'] as String,
        action: json['action'] as String,
        thresholdPercentage: json['thresholdPercentage'] as double,
        minNumberOfExecutedThings: json['minNumberOfExecutedThings'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the actions associated with a rule.
class Action {
  /// Write to a DynamoDB table.
  final DynamoDBAction dynamoDB;

  /// Write to a DynamoDB table. This is a new version of the DynamoDB action.
  /// It allows you to write each attribute in an MQTT message payload into a
  /// separate DynamoDB column.
  final DynamodBv2Action dynamodBv2;

  /// Invoke a Lambda function.
  final LambdaAction lambda;

  /// Publish to an Amazon SNS topic.
  final SnsAction sns;

  /// Publish to an Amazon SQS queue.
  final SqsAction sqs;

  /// Write data to an Amazon Kinesis stream.
  final KinesisAction kinesis;

  /// Publish to another MQTT topic.
  final RepublishAction republish;

  /// Write to an Amazon S3 bucket.
  final S3Action s3;

  /// Write to an Amazon Kinesis Firehose stream.
  final FirehoseAction firehose;

  /// Capture a CloudWatch metric.
  final CloudwatchMetricAction cloudwatchMetric;

  /// Change the state of a CloudWatch alarm.
  final CloudwatchAlarmAction cloudwatchAlarm;

  /// Write data to an Amazon Elasticsearch Service domain.
  final ElasticsearchAction elasticsearch;

  /// Send a message to a Salesforce IoT Cloud Input Stream.
  final SalesforceAction salesforce;

  /// Sends message data to an AWS IoT Analytics channel.
  final IotAnalyticsAction iotAnalytics;

  /// Sends an input to an AWS IoT Events detector.
  final IotEventsAction iotEvents;

  /// Starts execution of a Step Functions state machine.
  final StepFunctionsAction stepFunctions;

  Action({
    this.dynamoDB,
    this.dynamodBv2,
    this.lambda,
    this.sns,
    this.sqs,
    this.kinesis,
    this.republish,
    this.s3,
    this.firehose,
    this.cloudwatchMetric,
    this.cloudwatchAlarm,
    this.elasticsearch,
    this.salesforce,
    this.iotAnalytics,
    this.iotEvents,
    this.stepFunctions,
  });
  static Action fromJson(Map<String, dynamic> json) => Action(
        dynamoDB: json.containsKey('dynamoDB')
            ? DynamoDBAction.fromJson(json['dynamoDB'])
            : null,
        dynamodBv2: json.containsKey('dynamoDBv2')
            ? DynamodBv2Action.fromJson(json['dynamoDBv2'])
            : null,
        lambda: json.containsKey('lambda')
            ? LambdaAction.fromJson(json['lambda'])
            : null,
        sns: json.containsKey('sns') ? SnsAction.fromJson(json['sns']) : null,
        sqs: json.containsKey('sqs') ? SqsAction.fromJson(json['sqs']) : null,
        kinesis: json.containsKey('kinesis')
            ? KinesisAction.fromJson(json['kinesis'])
            : null,
        republish: json.containsKey('republish')
            ? RepublishAction.fromJson(json['republish'])
            : null,
        s3: json.containsKey('s3') ? S3Action.fromJson(json['s3']) : null,
        firehose: json.containsKey('firehose')
            ? FirehoseAction.fromJson(json['firehose'])
            : null,
        cloudwatchMetric: json.containsKey('cloudwatchMetric')
            ? CloudwatchMetricAction.fromJson(json['cloudwatchMetric'])
            : null,
        cloudwatchAlarm: json.containsKey('cloudwatchAlarm')
            ? CloudwatchAlarmAction.fromJson(json['cloudwatchAlarm'])
            : null,
        elasticsearch: json.containsKey('elasticsearch')
            ? ElasticsearchAction.fromJson(json['elasticsearch'])
            : null,
        salesforce: json.containsKey('salesforce')
            ? SalesforceAction.fromJson(json['salesforce'])
            : null,
        iotAnalytics: json.containsKey('iotAnalytics')
            ? IotAnalyticsAction.fromJson(json['iotAnalytics'])
            : null,
        iotEvents: json.containsKey('iotEvents')
            ? IotEventsAction.fromJson(json['iotEvents'])
            : null,
        stepFunctions: json.containsKey('stepFunctions')
            ? StepFunctionsAction.fromJson(json['stepFunctions'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about an active Device Defender security profile behavior
/// violation.
class ActiveViolation {
  /// The ID of the active violation.
  final String violationId;

  /// The name of the thing responsible for the active violation.
  final String thingName;

  /// The security profile whose behavior is in violation.
  final String securityProfileName;

  /// The behavior which is being violated.
  final Behavior behavior;

  /// The value of the metric (the measurement) which caused the most recent
  /// violation.
  final MetricValue lastViolationValue;

  /// The time the most recent violation occurred.
  final DateTime lastViolationTime;

  /// The time the violation started.
  final DateTime violationStartTime;

  ActiveViolation({
    this.violationId,
    this.thingName,
    this.securityProfileName,
    this.behavior,
    this.lastViolationValue,
    this.lastViolationTime,
    this.violationStartTime,
  });
  static ActiveViolation fromJson(Map<String, dynamic> json) => ActiveViolation(
        violationId: json.containsKey('violationId')
            ? json['violationId'] as String
            : null,
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        securityProfileName: json.containsKey('securityProfileName')
            ? json['securityProfileName'] as String
            : null,
        behavior: json.containsKey('behavior')
            ? Behavior.fromJson(json['behavior'])
            : null,
        lastViolationValue: json.containsKey('lastViolationValue')
            ? MetricValue.fromJson(json['lastViolationValue'])
            : null,
        lastViolationTime: json.containsKey('lastViolationTime')
            ? DateTime.parse(json['lastViolationTime'])
            : null,
        violationStartTime: json.containsKey('violationStartTime')
            ? DateTime.parse(json['violationStartTime'])
            : null,
      );
}

class AddThingToBillingGroupResponse {
  AddThingToBillingGroupResponse();
  static AddThingToBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      AddThingToBillingGroupResponse();
}

class AddThingToThingGroupResponse {
  AddThingToThingGroupResponse();
  static AddThingToThingGroupResponse fromJson(Map<String, dynamic> json) =>
      AddThingToThingGroupResponse();
}

/// Parameters used when defining a mitigation action that move a set of things
/// to a thing group.
class AddThingsToThingGroupParams {
  /// The list of groups to which you want to add the things that triggered the
  /// mitigation action. You can add a thing to a maximum of 10 groups, but you
  /// cannot add a thing to more than one group in the same hierarchy.
  final List<String> thingGroupNames;

  /// Specifies if this mitigation action can move the things that triggered the
  /// mitigation action even if they are part of one or more dynamic things
  /// groups.
  final bool overrideDynamicGroups;

  AddThingsToThingGroupParams({
    @required this.thingGroupNames,
    this.overrideDynamicGroups,
  });
  static AddThingsToThingGroupParams fromJson(Map<String, dynamic> json) =>
      AddThingsToThingGroupParams(
        thingGroupNames:
            (json['thingGroupNames'] as List).map((e) => e as String).toList(),
        overrideDynamicGroups: json.containsKey('overrideDynamicGroups')
            ? json['overrideDynamicGroups'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A structure containing the alert target ARN and the role ARN.
class AlertTarget {
  /// The ARN of the notification target to which alerts are sent.
  final String alertTargetArn;

  /// The ARN of the role that grants permission to send alerts to the
  /// notification target.
  final String roleArn;

  AlertTarget({
    @required this.alertTargetArn,
    @required this.roleArn,
  });
  static AlertTarget fromJson(Map<String, dynamic> json) => AlertTarget(
        alertTargetArn: json['alertTargetArn'] as String,
        roleArn: json['roleArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information that allowed the authorization.
class Allowed {
  /// A list of policies that allowed the authentication.
  final List<Policy> policies;

  Allowed({
    this.policies,
  });
  static Allowed fromJson(Map<String, dynamic> json) => Allowed(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
      );
}

class AssociateTargetsWithJobResponse {
  /// An ARN identifying the job.
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// A short text description of the job.
  final String description;

  AssociateTargetsWithJobResponse({
    this.jobArn,
    this.jobId,
    this.description,
  });
  static AssociateTargetsWithJobResponse fromJson(Map<String, dynamic> json) =>
      AssociateTargetsWithJobResponse(
        jobArn: json.containsKey('jobArn') ? json['jobArn'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
      );
}

class AttachSecurityProfileResponse {
  AttachSecurityProfileResponse();
  static AttachSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      AttachSecurityProfileResponse();
}

/// The output from the AttachThingPrincipal operation.
class AttachThingPrincipalResponse {
  AttachThingPrincipalResponse();
  static AttachThingPrincipalResponse fromJson(Map<String, dynamic> json) =>
      AttachThingPrincipalResponse();
}

/// The attribute payload.
class AttributePayload {
  /// A JSON string containing up to three key-value pair in JSON format. For
  /// example:
  ///
  ///  `{"attributes":{"string1":"string2"}}`
  final Map<String, String> attributes;

  /// Specifies whether the list of attributes provided in the
  /// `AttributePayload` is merged with the attributes stored in the registry,
  /// instead of overwriting them.
  ///
  /// To remove an attribute, call `UpdateThing` with an empty attribute value.
  ///
  ///
  ///
  /// The `merge` attribute is only valid when calling `UpdateThing` or
  /// `UpdateThingGroup`.
  final bool merge;

  AttributePayload({
    this.attributes,
    this.merge,
  });
  static AttributePayload fromJson(Map<String, dynamic> json) =>
      AttributePayload(
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        merge: json.containsKey('merge') ? json['merge'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Which audit checks are enabled and disabled for this account.
class AuditCheckConfiguration {
  /// True if this audit check is enabled for this account.
  final bool enabled;

  AuditCheckConfiguration({
    this.enabled,
  });
  static AuditCheckConfiguration fromJson(Map<String, dynamic> json) =>
      AuditCheckConfiguration(
        enabled: json.containsKey('enabled') ? json['enabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the audit check.
class AuditCheckDetails {
  /// The completion status of this check. One of "IN_PROGRESS",
  /// "WAITING_FOR_DATA_COLLECTION", "CANCELED", "COMPLETED_COMPLIANT",
  /// "COMPLETED_NON_COMPLIANT", or "FAILED".
  final String checkRunStatus;

  /// True if the check is complete and found all resources compliant.
  final bool checkCompliant;

  /// The number of resources on which the check was performed.
  final BigInt totalResourcesCount;

  /// The number of resources that were found noncompliant during the check.
  final BigInt nonCompliantResourcesCount;

  /// The code of any error encountered when this check is performed during this
  /// audit. One of "INSUFFICIENT_PERMISSIONS" or "AUDIT_CHECK_DISABLED".
  final String errorCode;

  /// The message associated with any error encountered when this check is
  /// performed during this audit.
  final String message;

  AuditCheckDetails({
    this.checkRunStatus,
    this.checkCompliant,
    this.totalResourcesCount,
    this.nonCompliantResourcesCount,
    this.errorCode,
    this.message,
  });
  static AuditCheckDetails fromJson(Map<String, dynamic> json) =>
      AuditCheckDetails(
        checkRunStatus: json.containsKey('checkRunStatus')
            ? json['checkRunStatus'] as String
            : null,
        checkCompliant: json.containsKey('checkCompliant')
            ? json['checkCompliant'] as bool
            : null,
        totalResourcesCount: json.containsKey('totalResourcesCount')
            ? BigInt.from(json['totalResourcesCount'])
            : null,
        nonCompliantResourcesCount:
            json.containsKey('nonCompliantResourcesCount')
                ? BigInt.from(json['nonCompliantResourcesCount'])
                : null,
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// The findings (results) of the audit.
class AuditFinding {
  /// A unique identifier for this set of audit findings. This identifier is
  /// used to apply mitigation tasks to one or more sets of findings.
  final String findingId;

  /// The ID of the audit that generated this result (finding).
  final String taskId;

  /// The audit check that generated this result.
  final String checkName;

  /// The time the audit started.
  final DateTime taskStartTime;

  /// The time the result (finding) was discovered.
  final DateTime findingTime;

  /// The severity of the result (finding).
  final String severity;

  /// The resource that was found to be noncompliant with the audit check.
  final NonCompliantResource nonCompliantResource;

  /// The list of related resources.
  final List<RelatedResource> relatedResources;

  /// The reason the resource was noncompliant.
  final String reasonForNonCompliance;

  /// A code that indicates the reason that the resource was noncompliant.
  final String reasonForNonComplianceCode;

  AuditFinding({
    this.findingId,
    this.taskId,
    this.checkName,
    this.taskStartTime,
    this.findingTime,
    this.severity,
    this.nonCompliantResource,
    this.relatedResources,
    this.reasonForNonCompliance,
    this.reasonForNonComplianceCode,
  });
  static AuditFinding fromJson(Map<String, dynamic> json) => AuditFinding(
        findingId:
            json.containsKey('findingId') ? json['findingId'] as String : null,
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        checkName:
            json.containsKey('checkName') ? json['checkName'] as String : null,
        taskStartTime: json.containsKey('taskStartTime')
            ? DateTime.parse(json['taskStartTime'])
            : null,
        findingTime: json.containsKey('findingTime')
            ? DateTime.parse(json['findingTime'])
            : null,
        severity:
            json.containsKey('severity') ? json['severity'] as String : null,
        nonCompliantResource: json.containsKey('nonCompliantResource')
            ? NonCompliantResource.fromJson(json['nonCompliantResource'])
            : null,
        relatedResources: json.containsKey('relatedResources')
            ? (json['relatedResources'] as List)
                .map((e) => RelatedResource.fromJson(e))
                .toList()
            : null,
        reasonForNonCompliance: json.containsKey('reasonForNonCompliance')
            ? json['reasonForNonCompliance'] as String
            : null,
        reasonForNonComplianceCode:
            json.containsKey('reasonForNonComplianceCode')
                ? json['reasonForNonComplianceCode'] as String
                : null,
      );
}

/// Returned by ListAuditMitigationActionsTask, this object contains information
/// that describes a mitigation action that has been started.
class AuditMitigationActionExecutionMetadata {
  /// The unique identifier for the task that applies the mitigation action.
  final String taskId;

  /// The unique identifier for the findings to which the task and associated
  /// mitigation action are applied.
  final String findingId;

  /// The friendly name of the mitigation action being applied by the task.
  final String actionName;

  /// The unique identifier for the mitigation action being applied by the task.
  final String actionId;

  /// The current status of the task being executed.
  final String status;

  /// The date and time when the task was started.
  final DateTime startTime;

  /// The date and time when the task was completed or canceled. Blank if the
  /// task is still running.
  final DateTime endTime;

  /// If an error occurred, the code that indicates which type of error
  /// occurred.
  final String errorCode;

  /// If an error occurred, a message that describes the error.
  final String message;

  AuditMitigationActionExecutionMetadata({
    this.taskId,
    this.findingId,
    this.actionName,
    this.actionId,
    this.status,
    this.startTime,
    this.endTime,
    this.errorCode,
    this.message,
  });
  static AuditMitigationActionExecutionMetadata fromJson(
          Map<String, dynamic> json) =>
      AuditMitigationActionExecutionMetadata(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        findingId:
            json.containsKey('findingId') ? json['findingId'] as String : null,
        actionName: json.containsKey('actionName')
            ? json['actionName'] as String
            : null,
        actionId:
            json.containsKey('actionId') ? json['actionId'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// Information about an audit mitigation actions task that is returned by
/// `ListAuditMitigationActionsTasks`.
class AuditMitigationActionsTaskMetadata {
  /// The unique identifier for the task.
  final String taskId;

  /// The time at which the audit mitigation actions task was started.
  final DateTime startTime;

  /// The current state of the audit mitigation actions task.
  final String taskStatus;

  AuditMitigationActionsTaskMetadata({
    this.taskId,
    this.startTime,
    this.taskStatus,
  });
  static AuditMitigationActionsTaskMetadata fromJson(
          Map<String, dynamic> json) =>
      AuditMitigationActionsTaskMetadata(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        taskStatus: json.containsKey('taskStatus')
            ? json['taskStatus'] as String
            : null,
      );
}

/// Used in MitigationActionParams, this information identifies the target
/// findings to which the mitigation actions are applied. Only one entry
/// appears.
class AuditMitigationActionsTaskTarget {
  /// If the task will apply a mitigation action to findings from a specific
  /// audit, this value uniquely identifies the audit.
  final String auditTaskId;

  /// If the task will apply a mitigation action to one or more listed findings,
  /// this value uniquely identifies those findings.
  final List<String> findingIds;

  /// Specifies a filter in the form of an audit check and set of reason codes
  /// that identify the findings from the audit to which the audit mitigation
  /// actions task apply.
  final Map<String, List<String>> auditCheckToReasonCodeFilter;

  AuditMitigationActionsTaskTarget({
    this.auditTaskId,
    this.findingIds,
    this.auditCheckToReasonCodeFilter,
  });
  static AuditMitigationActionsTaskTarget fromJson(Map<String, dynamic> json) =>
      AuditMitigationActionsTaskTarget(
        auditTaskId: json.containsKey('auditTaskId')
            ? json['auditTaskId'] as String
            : null,
        findingIds: json.containsKey('findingIds')
            ? (json['findingIds'] as List).map((e) => e as String).toList()
            : null,
        auditCheckToReasonCodeFilter: json
                .containsKey('auditCheckToReasonCodeFilter')
            ? (json['auditCheckToReasonCodeFilter'] as Map).map((k, v) =>
                MapEntry(
                    k as String, (v as List).map((e) => e as String).toList()))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the targets to which audit notifications are sent.
class AuditNotificationTarget {
  /// The ARN of the target (SNS topic) to which audit notifications are sent.
  final String targetArn;

  /// The ARN of the role that grants permission to send notifications to the
  /// target.
  final String roleArn;

  /// True if notifications to the target are enabled.
  final bool enabled;

  AuditNotificationTarget({
    this.targetArn,
    this.roleArn,
    this.enabled,
  });
  static AuditNotificationTarget fromJson(Map<String, dynamic> json) =>
      AuditNotificationTarget(
        targetArn:
            json.containsKey('targetArn') ? json['targetArn'] as String : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        enabled: json.containsKey('enabled') ? json['enabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The audits that were performed.
class AuditTaskMetadata {
  /// The ID of this audit.
  final String taskId;

  /// The status of this audit. One of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  final String taskStatus;

  /// The type of this audit. One of "ON_DEMAND_AUDIT_TASK" or
  /// "SCHEDULED_AUDIT_TASK".
  final String taskType;

  AuditTaskMetadata({
    this.taskId,
    this.taskStatus,
    this.taskType,
  });
  static AuditTaskMetadata fromJson(Map<String, dynamic> json) =>
      AuditTaskMetadata(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        taskStatus: json.containsKey('taskStatus')
            ? json['taskStatus'] as String
            : null,
        taskType:
            json.containsKey('taskType') ? json['taskType'] as String : null,
      );
}

/// A collection of authorization information.
class AuthInfo {
  /// The type of action for which the principal is being authorized.
  final String actionType;

  /// The resources for which the principal is being authorized to perform the
  /// specified action.
  final List<String> resources;

  AuthInfo({
    this.actionType,
    this.resources,
  });
  static AuthInfo fromJson(Map<String, dynamic> json) => AuthInfo(
        actionType: json.containsKey('actionType')
            ? json['actionType'] as String
            : null,
        resources: json.containsKey('resources')
            ? (json['resources'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The authorizer result.
class AuthResult {
  /// Authorization information.
  final AuthInfo authInfo;

  /// The policies and statements that allowed the specified action.
  final Allowed allowed;

  /// The policies and statements that denied the specified action.
  final Denied denied;

  /// The final authorization decision of this scenario. Multiple statements are
  /// taken into account when determining the authorization decision. An
  /// explicit deny statement can override multiple allow statements.
  final String authDecision;

  /// Contains any missing context values found while evaluating policy.
  final List<String> missingContextValues;

  AuthResult({
    this.authInfo,
    this.allowed,
    this.denied,
    this.authDecision,
    this.missingContextValues,
  });
  static AuthResult fromJson(Map<String, dynamic> json) => AuthResult(
        authInfo: json.containsKey('authInfo')
            ? AuthInfo.fromJson(json['authInfo'])
            : null,
        allowed: json.containsKey('allowed')
            ? Allowed.fromJson(json['allowed'])
            : null,
        denied:
            json.containsKey('denied') ? Denied.fromJson(json['denied']) : null,
        authDecision: json.containsKey('authDecision')
            ? json['authDecision'] as String
            : null,
        missingContextValues: json.containsKey('missingContextValues')
            ? (json['missingContextValues'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// The authorizer description.
class AuthorizerDescription {
  /// The authorizer name.
  final String authorizerName;

  /// The authorizer ARN.
  final String authorizerArn;

  /// The authorizer's Lambda function ARN.
  final String authorizerFunctionArn;

  /// The key used to extract the token from the HTTP headers.
  final String tokenKeyName;

  /// The public keys used to validate the token signature returned by your
  /// custom authentication service.
  final Map<String, String> tokenSigningPublicKeys;

  /// The status of the authorizer.
  final String status;

  /// The UNIX timestamp of when the authorizer was created.
  final DateTime creationDate;

  /// The UNIX timestamp of when the authorizer was last updated.
  final DateTime lastModifiedDate;

  AuthorizerDescription({
    this.authorizerName,
    this.authorizerArn,
    this.authorizerFunctionArn,
    this.tokenKeyName,
    this.tokenSigningPublicKeys,
    this.status,
    this.creationDate,
    this.lastModifiedDate,
  });
  static AuthorizerDescription fromJson(Map<String, dynamic> json) =>
      AuthorizerDescription(
        authorizerName: json.containsKey('authorizerName')
            ? json['authorizerName'] as String
            : null,
        authorizerArn: json.containsKey('authorizerArn')
            ? json['authorizerArn'] as String
            : null,
        authorizerFunctionArn: json.containsKey('authorizerFunctionArn')
            ? json['authorizerFunctionArn'] as String
            : null,
        tokenKeyName: json.containsKey('tokenKeyName')
            ? json['tokenKeyName'] as String
            : null,
        tokenSigningPublicKeys: json.containsKey('tokenSigningPublicKeys')
            ? (json['tokenSigningPublicKeys'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

/// The authorizer summary.
class AuthorizerSummary {
  /// The authorizer name.
  final String authorizerName;

  /// The authorizer ARN.
  final String authorizerArn;

  AuthorizerSummary({
    this.authorizerName,
    this.authorizerArn,
  });
  static AuthorizerSummary fromJson(Map<String, dynamic> json) =>
      AuthorizerSummary(
        authorizerName: json.containsKey('authorizerName')
            ? json['authorizerName'] as String
            : null,
        authorizerArn: json.containsKey('authorizerArn')
            ? json['authorizerArn'] as String
            : null,
      );
}

/// Configuration for the rollout of OTA updates.
class AwsJobExecutionsRolloutConfig {
  /// The maximum number of OTA update job executions started per minute.
  final int maximumPerMinute;

  AwsJobExecutionsRolloutConfig({
    this.maximumPerMinute,
  });
  static AwsJobExecutionsRolloutConfig fromJson(Map<String, dynamic> json) =>
      AwsJobExecutionsRolloutConfig(
        maximumPerMinute: json.containsKey('maximumPerMinute')
            ? json['maximumPerMinute'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A Device Defender security profile behavior.
class Behavior {
  /// The name you have given to the behavior.
  final String name;

  /// What is measured by the behavior.
  final String metric;

  /// The criteria that determine if a device is behaving normally in regard to
  /// the `metric`.
  final BehaviorCriteria criteria;

  Behavior({
    @required this.name,
    this.metric,
    this.criteria,
  });
  static Behavior fromJson(Map<String, dynamic> json) => Behavior(
        name: json['name'] as String,
        metric: json.containsKey('metric') ? json['metric'] as String : null,
        criteria: json.containsKey('criteria')
            ? BehaviorCriteria.fromJson(json['criteria'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The criteria by which the behavior is determined to be normal.
class BehaviorCriteria {
  /// The operator that relates the thing measured (`metric`) to the criteria
  /// (containing a `value` or `statisticalThreshold`).
  final String comparisonOperator;

  /// The value to be compared with the `metric`.
  final MetricValue value;

  /// Use this to specify the time duration over which the behavior is
  /// evaluated, for those criteria which have a time dimension (for example,
  /// `NUM_MESSAGES_SENT`). For a `statisticalThreshhold` metric comparison,
  /// measurements from all devices are accumulated over this time duration
  /// before being used to calculate percentiles, and later, measurements from
  /// an individual device are also accumulated over this time duration before
  /// being given a percentile rank.
  final int durationSeconds;

  /// If a device is in violation of the behavior for the specified number of
  /// consecutive datapoints, an alarm occurs. If not specified, the default is
  /// 1.
  final int consecutiveDatapointsToAlarm;

  /// If an alarm has occurred and the offending device is no longer in
  /// violation of the behavior for the specified number of consecutive
  /// datapoints, the alarm is cleared. If not specified, the default is 1.
  final int consecutiveDatapointsToClear;

  /// A statistical ranking (percentile) which indicates a threshold value by
  /// which a behavior is determined to be in compliance or in violation of the
  /// behavior.
  final StatisticalThreshold statisticalThreshold;

  BehaviorCriteria({
    this.comparisonOperator,
    this.value,
    this.durationSeconds,
    this.consecutiveDatapointsToAlarm,
    this.consecutiveDatapointsToClear,
    this.statisticalThreshold,
  });
  static BehaviorCriteria fromJson(Map<String, dynamic> json) =>
      BehaviorCriteria(
        comparisonOperator: json.containsKey('comparisonOperator')
            ? json['comparisonOperator'] as String
            : null,
        value: json.containsKey('value')
            ? MetricValue.fromJson(json['value'])
            : null,
        durationSeconds: json.containsKey('durationSeconds')
            ? json['durationSeconds'] as int
            : null,
        consecutiveDatapointsToAlarm:
            json.containsKey('consecutiveDatapointsToAlarm')
                ? json['consecutiveDatapointsToAlarm'] as int
                : null,
        consecutiveDatapointsToClear:
            json.containsKey('consecutiveDatapointsToClear')
                ? json['consecutiveDatapointsToClear'] as int
                : null,
        statisticalThreshold: json.containsKey('statisticalThreshold')
            ? StatisticalThreshold.fromJson(json['statisticalThreshold'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Additional information about the billing group.
class BillingGroupMetadata {
  /// The date the billing group was created.
  final DateTime creationDate;

  BillingGroupMetadata({
    this.creationDate,
  });
  static BillingGroupMetadata fromJson(Map<String, dynamic> json) =>
      BillingGroupMetadata(
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// The properties of a billing group.
class BillingGroupProperties {
  /// The description of the billing group.
  final String billingGroupDescription;

  BillingGroupProperties({
    this.billingGroupDescription,
  });
  static BillingGroupProperties fromJson(Map<String, dynamic> json) =>
      BillingGroupProperties(
        billingGroupDescription: json.containsKey('billingGroupDescription')
            ? json['billingGroupDescription'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A CA certificate.
class CACertificate {
  /// The ARN of the CA certificate.
  final String certificateArn;

  /// The ID of the CA certificate.
  final String certificateId;

  /// The status of the CA certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  final String status;

  /// The date the CA certificate was created.
  final DateTime creationDate;

  CACertificate({
    this.certificateArn,
    this.certificateId,
    this.status,
    this.creationDate,
  });
  static CACertificate fromJson(Map<String, dynamic> json) => CACertificate(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// Describes a CA certificate.
class CACertificateDescription {
  /// The CA certificate ARN.
  final String certificateArn;

  /// The CA certificate ID.
  final String certificateId;

  /// The status of a CA certificate.
  final String status;

  /// The CA certificate data, in PEM format.
  final String certificatePem;

  /// The owner of the CA certificate.
  final String ownedBy;

  /// The date the CA certificate was created.
  final DateTime creationDate;

  /// Whether the CA certificate configured for auto registration of device
  /// certificates. Valid values are "ENABLE" and "DISABLE"
  final String autoRegistrationStatus;

  /// The date the CA certificate was last modified.
  final DateTime lastModifiedDate;

  /// The customer version of the CA certificate.
  final int customerVersion;

  /// The generation ID of the CA certificate.
  final String generationId;

  /// When the CA certificate is valid.
  final CertificateValidity validity;

  CACertificateDescription({
    this.certificateArn,
    this.certificateId,
    this.status,
    this.certificatePem,
    this.ownedBy,
    this.creationDate,
    this.autoRegistrationStatus,
    this.lastModifiedDate,
    this.customerVersion,
    this.generationId,
    this.validity,
  });
  static CACertificateDescription fromJson(Map<String, dynamic> json) =>
      CACertificateDescription(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        certificatePem: json.containsKey('certificatePem')
            ? json['certificatePem'] as String
            : null,
        ownedBy: json.containsKey('ownedBy') ? json['ownedBy'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        autoRegistrationStatus: json.containsKey('autoRegistrationStatus')
            ? json['autoRegistrationStatus'] as String
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        customerVersion: json.containsKey('customerVersion')
            ? json['customerVersion'] as int
            : null,
        generationId: json.containsKey('generationId')
            ? json['generationId'] as String
            : null,
        validity: json.containsKey('validity')
            ? CertificateValidity.fromJson(json['validity'])
            : null,
      );
}

class CancelAuditMitigationActionsTaskResponse {
  CancelAuditMitigationActionsTaskResponse();
  static CancelAuditMitigationActionsTaskResponse fromJson(
          Map<String, dynamic> json) =>
      CancelAuditMitigationActionsTaskResponse();
}

class CancelAuditTaskResponse {
  CancelAuditTaskResponse();
  static CancelAuditTaskResponse fromJson(Map<String, dynamic> json) =>
      CancelAuditTaskResponse();
}

class CancelJobResponse {
  /// The job ARN.
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// A short text description of the job.
  final String description;

  CancelJobResponse({
    this.jobArn,
    this.jobId,
    this.description,
  });
  static CancelJobResponse fromJson(Map<String, dynamic> json) =>
      CancelJobResponse(
        jobArn: json.containsKey('jobArn') ? json['jobArn'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
      );
}

/// Information about a certificate.
class Certificate {
  /// The ARN of the certificate.
  final String certificateArn;

  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  final String certificateId;

  /// The status of the certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  final String status;

  /// The date and time the certificate was created.
  final DateTime creationDate;

  Certificate({
    this.certificateArn,
    this.certificateId,
    this.status,
    this.creationDate,
  });
  static Certificate fromJson(Map<String, dynamic> json) => Certificate(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// Describes a certificate.
class CertificateDescription {
  /// The ARN of the certificate.
  final String certificateArn;

  /// The ID of the certificate.
  final String certificateId;

  /// The certificate ID of the CA certificate used to sign this certificate.
  final String caCertificateId;

  /// The status of the certificate.
  final String status;

  /// The certificate data, in PEM format.
  final String certificatePem;

  /// The ID of the AWS account that owns the certificate.
  final String ownedBy;

  /// The ID of the AWS account of the previous owner of the certificate.
  final String previousOwnedBy;

  /// The date and time the certificate was created.
  final DateTime creationDate;

  /// The date and time the certificate was last modified.
  final DateTime lastModifiedDate;

  /// The customer version of the certificate.
  final int customerVersion;

  /// The transfer data.
  final TransferData transferData;

  /// The generation ID of the certificate.
  final String generationId;

  /// When the certificate is valid.
  final CertificateValidity validity;

  CertificateDescription({
    this.certificateArn,
    this.certificateId,
    this.caCertificateId,
    this.status,
    this.certificatePem,
    this.ownedBy,
    this.previousOwnedBy,
    this.creationDate,
    this.lastModifiedDate,
    this.customerVersion,
    this.transferData,
    this.generationId,
    this.validity,
  });
  static CertificateDescription fromJson(Map<String, dynamic> json) =>
      CertificateDescription(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        caCertificateId: json.containsKey('caCertificateId')
            ? json['caCertificateId'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        certificatePem: json.containsKey('certificatePem')
            ? json['certificatePem'] as String
            : null,
        ownedBy: json.containsKey('ownedBy') ? json['ownedBy'] as String : null,
        previousOwnedBy: json.containsKey('previousOwnedBy')
            ? json['previousOwnedBy'] as String
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        customerVersion: json.containsKey('customerVersion')
            ? json['customerVersion'] as int
            : null,
        transferData: json.containsKey('transferData')
            ? TransferData.fromJson(json['transferData'])
            : null,
        generationId: json.containsKey('generationId')
            ? json['generationId'] as String
            : null,
        validity: json.containsKey('validity')
            ? CertificateValidity.fromJson(json['validity'])
            : null,
      );
}

/// When the certificate is valid.
class CertificateValidity {
  /// The certificate is not valid before this date.
  final DateTime notBefore;

  /// The certificate is not valid after this date.
  final DateTime notAfter;

  CertificateValidity({
    this.notBefore,
    this.notAfter,
  });
  static CertificateValidity fromJson(Map<String, dynamic> json) =>
      CertificateValidity(
        notBefore: json.containsKey('notBefore')
            ? DateTime.parse(json['notBefore'])
            : null,
        notAfter: json.containsKey('notAfter')
            ? DateTime.parse(json['notAfter'])
            : null,
      );
}

class ClearDefaultAuthorizerResponse {
  ClearDefaultAuthorizerResponse();
  static ClearDefaultAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      ClearDefaultAuthorizerResponse();
}

/// Describes an action that updates a CloudWatch alarm.
class CloudwatchAlarmAction {
  /// The IAM role that allows access to the CloudWatch alarm.
  final String roleArn;

  /// The CloudWatch alarm name.
  final String alarmName;

  /// The reason for the alarm change.
  final String stateReason;

  /// The value of the alarm state. Acceptable values are: OK, ALARM,
  /// INSUFFICIENT_DATA.
  final String stateValue;

  CloudwatchAlarmAction({
    @required this.roleArn,
    @required this.alarmName,
    @required this.stateReason,
    @required this.stateValue,
  });
  static CloudwatchAlarmAction fromJson(Map<String, dynamic> json) =>
      CloudwatchAlarmAction(
        roleArn: json['roleArn'] as String,
        alarmName: json['alarmName'] as String,
        stateReason: json['stateReason'] as String,
        stateValue: json['stateValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action that captures a CloudWatch metric.
class CloudwatchMetricAction {
  /// The IAM role that allows access to the CloudWatch metric.
  final String roleArn;

  /// The CloudWatch metric namespace name.
  final String metricNamespace;

  /// The CloudWatch metric name.
  final String metricName;

  /// The CloudWatch metric value.
  final String metricValue;

  /// The
  /// [metric unit](https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit)
  /// supported by CloudWatch.
  final String metricUnit;

  /// An optional
  /// [Unix timestamp](https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp).
  final String metricTimestamp;

  CloudwatchMetricAction({
    @required this.roleArn,
    @required this.metricNamespace,
    @required this.metricName,
    @required this.metricValue,
    @required this.metricUnit,
    this.metricTimestamp,
  });
  static CloudwatchMetricAction fromJson(Map<String, dynamic> json) =>
      CloudwatchMetricAction(
        roleArn: json['roleArn'] as String,
        metricNamespace: json['metricNamespace'] as String,
        metricName: json['metricName'] as String,
        metricValue: json['metricValue'] as String,
        metricUnit: json['metricUnit'] as String,
        metricTimestamp: json.containsKey('metricTimestamp')
            ? json['metricTimestamp'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the method to use when code signing a file.
class CodeSigning {
  /// The ID of the AWSSignerJob which was created to sign the file.
  final String awsSignerJobId;

  /// Describes the code-signing job.
  final StartSigningJobParameter startSigningJobParameter;

  /// A custom method for code signing a file.
  final CustomCodeSigning customCodeSigning;

  CodeSigning({
    this.awsSignerJobId,
    this.startSigningJobParameter,
    this.customCodeSigning,
  });
  static CodeSigning fromJson(Map<String, dynamic> json) => CodeSigning(
        awsSignerJobId: json.containsKey('awsSignerJobId')
            ? json['awsSignerJobId'] as String
            : null,
        startSigningJobParameter: json.containsKey('startSigningJobParameter')
            ? StartSigningJobParameter.fromJson(
                json['startSigningJobParameter'])
            : null,
        customCodeSigning: json.containsKey('customCodeSigning')
            ? CustomCodeSigning.fromJson(json['customCodeSigning'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the certificate chain being used when code signing a file.
class CodeSigningCertificateChain {
  /// The name of the certificate.
  final String certificateName;

  /// A base64 encoded binary representation of the code signing certificate
  /// chain.
  final String inlineDocument;

  CodeSigningCertificateChain({
    this.certificateName,
    this.inlineDocument,
  });
  static CodeSigningCertificateChain fromJson(Map<String, dynamic> json) =>
      CodeSigningCertificateChain(
        certificateName: json.containsKey('certificateName')
            ? json['certificateName'] as String
            : null,
        inlineDocument: json.containsKey('inlineDocument')
            ? json['inlineDocument'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the signature for a file.
class CodeSigningSignature {
  /// A base64 encoded binary representation of the code signing signature.
  final Uint8List inlineDocument;

  CodeSigningSignature({
    this.inlineDocument,
  });
  static CodeSigningSignature fromJson(Map<String, dynamic> json) =>
      CodeSigningSignature(
        inlineDocument: json.containsKey('inlineDocument')
            ? Uint8List(json['inlineDocument'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configuration.
class Configuration {
  /// True to enable the configuration.
  final bool enabled;

  Configuration({
    this.enabled,
  });
  static Configuration fromJson(Map<String, dynamic> json) => Configuration(
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateAuthorizerResponse {
  /// The authorizer's name.
  final String authorizerName;

  /// The authorizer ARN.
  final String authorizerArn;

  CreateAuthorizerResponse({
    this.authorizerName,
    this.authorizerArn,
  });
  static CreateAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      CreateAuthorizerResponse(
        authorizerName: json.containsKey('authorizerName')
            ? json['authorizerName'] as String
            : null,
        authorizerArn: json.containsKey('authorizerArn')
            ? json['authorizerArn'] as String
            : null,
      );
}

class CreateBillingGroupResponse {
  /// The name you gave to the billing group.
  final String billingGroupName;

  /// The ARN of the billing group.
  final String billingGroupArn;

  /// The ID of the billing group.
  final String billingGroupId;

  CreateBillingGroupResponse({
    this.billingGroupName,
    this.billingGroupArn,
    this.billingGroupId,
  });
  static CreateBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateBillingGroupResponse(
        billingGroupName: json.containsKey('billingGroupName')
            ? json['billingGroupName'] as String
            : null,
        billingGroupArn: json.containsKey('billingGroupArn')
            ? json['billingGroupArn'] as String
            : null,
        billingGroupId: json.containsKey('billingGroupId')
            ? json['billingGroupId'] as String
            : null,
      );
}

/// The output from the CreateCertificateFromCsr operation.
class CreateCertificateFromCsrResponse {
  /// The Amazon Resource Name (ARN) of the certificate. You can use the ARN as
  /// a principal for policy operations.
  final String certificateArn;

  /// The ID of the certificate. Certificate management operations only take a
  /// certificateId.
  final String certificateId;

  /// The certificate data, in PEM format.
  final String certificatePem;

  CreateCertificateFromCsrResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
  });
  static CreateCertificateFromCsrResponse fromJson(Map<String, dynamic> json) =>
      CreateCertificateFromCsrResponse(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        certificatePem: json.containsKey('certificatePem')
            ? json['certificatePem'] as String
            : null,
      );
}

class CreateDynamicThingGroupResponse {
  /// The dynamic thing group name.
  final String thingGroupName;

  /// The dynamic thing group ARN.
  final String thingGroupArn;

  /// The dynamic thing group ID.
  final String thingGroupId;

  /// The dynamic thing group index name.
  final String indexName;

  /// The dynamic thing group search query string.
  final String queryString;

  /// The dynamic thing group query version.
  final String queryVersion;

  CreateDynamicThingGroupResponse({
    this.thingGroupName,
    this.thingGroupArn,
    this.thingGroupId,
    this.indexName,
    this.queryString,
    this.queryVersion,
  });
  static CreateDynamicThingGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateDynamicThingGroupResponse(
        thingGroupName: json.containsKey('thingGroupName')
            ? json['thingGroupName'] as String
            : null,
        thingGroupArn: json.containsKey('thingGroupArn')
            ? json['thingGroupArn'] as String
            : null,
        thingGroupId: json.containsKey('thingGroupId')
            ? json['thingGroupId'] as String
            : null,
        indexName:
            json.containsKey('indexName') ? json['indexName'] as String : null,
        queryString: json.containsKey('queryString')
            ? json['queryString'] as String
            : null,
        queryVersion: json.containsKey('queryVersion')
            ? json['queryVersion'] as String
            : null,
      );
}

class CreateJobResponse {
  /// The job ARN.
  final String jobArn;

  /// The unique identifier you assigned to this job.
  final String jobId;

  /// The job description.
  final String description;

  CreateJobResponse({
    this.jobArn,
    this.jobId,
    this.description,
  });
  static CreateJobResponse fromJson(Map<String, dynamic> json) =>
      CreateJobResponse(
        jobArn: json.containsKey('jobArn') ? json['jobArn'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
      );
}

/// The output of the CreateKeysAndCertificate operation.
class CreateKeysAndCertificateResponse {
  /// The ARN of the certificate.
  final String certificateArn;

  /// The ID of the certificate. AWS IoT issues a default subject name for the
  /// certificate (for example, AWS IoT Certificate).
  final String certificateId;

  /// The certificate data, in PEM format.
  final String certificatePem;

  /// The generated key pair.
  final KeyPair keyPair;

  CreateKeysAndCertificateResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
    this.keyPair,
  });
  static CreateKeysAndCertificateResponse fromJson(Map<String, dynamic> json) =>
      CreateKeysAndCertificateResponse(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        certificatePem: json.containsKey('certificatePem')
            ? json['certificatePem'] as String
            : null,
        keyPair: json.containsKey('keyPair')
            ? KeyPair.fromJson(json['keyPair'])
            : null,
      );
}

class CreateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  final String actionArn;

  /// A unique identifier for the new mitigation action.
  final String actionId;

  CreateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });
  static CreateMitigationActionResponse fromJson(Map<String, dynamic> json) =>
      CreateMitigationActionResponse(
        actionArn:
            json.containsKey('actionArn') ? json['actionArn'] as String : null,
        actionId:
            json.containsKey('actionId') ? json['actionId'] as String : null,
      );
}

class CreateOtaUpdateResponse {
  /// The OTA update ID.
  final String otaUpdateId;

  /// The AWS IoT job ID associated with the OTA update.
  final String awsIotJobId;

  /// The OTA update ARN.
  final String otaUpdateArn;

  /// The AWS IoT job ARN associated with the OTA update.
  final String awsIotJobArn;

  /// The OTA update status.
  final String otaUpdateStatus;

  CreateOtaUpdateResponse({
    this.otaUpdateId,
    this.awsIotJobId,
    this.otaUpdateArn,
    this.awsIotJobArn,
    this.otaUpdateStatus,
  });
  static CreateOtaUpdateResponse fromJson(Map<String, dynamic> json) =>
      CreateOtaUpdateResponse(
        otaUpdateId: json.containsKey('otaUpdateId')
            ? json['otaUpdateId'] as String
            : null,
        awsIotJobId: json.containsKey('awsIotJobId')
            ? json['awsIotJobId'] as String
            : null,
        otaUpdateArn: json.containsKey('otaUpdateArn')
            ? json['otaUpdateArn'] as String
            : null,
        awsIotJobArn: json.containsKey('awsIotJobArn')
            ? json['awsIotJobArn'] as String
            : null,
        otaUpdateStatus: json.containsKey('otaUpdateStatus')
            ? json['otaUpdateStatus'] as String
            : null,
      );
}

/// The output from the CreatePolicy operation.
class CreatePolicyResponse {
  /// The policy name.
  final String policyName;

  /// The policy ARN.
  final String policyArn;

  /// The JSON document that describes the policy.
  final String policyDocument;

  /// The policy version ID.
  final String policyVersionId;

  CreatePolicyResponse({
    this.policyName,
    this.policyArn,
    this.policyDocument,
    this.policyVersionId,
  });
  static CreatePolicyResponse fromJson(Map<String, dynamic> json) =>
      CreatePolicyResponse(
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
        policyDocument: json.containsKey('policyDocument')
            ? json['policyDocument'] as String
            : null,
        policyVersionId: json.containsKey('policyVersionId')
            ? json['policyVersionId'] as String
            : null,
      );
}

/// The output of the CreatePolicyVersion operation.
class CreatePolicyVersionResponse {
  /// The policy ARN.
  final String policyArn;

  /// The JSON document that describes the policy.
  final String policyDocument;

  /// The policy version ID.
  final String policyVersionId;

  /// Specifies whether the policy version is the default.
  final bool isDefaultVersion;

  CreatePolicyVersionResponse({
    this.policyArn,
    this.policyDocument,
    this.policyVersionId,
    this.isDefaultVersion,
  });
  static CreatePolicyVersionResponse fromJson(Map<String, dynamic> json) =>
      CreatePolicyVersionResponse(
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
        policyDocument: json.containsKey('policyDocument')
            ? json['policyDocument'] as String
            : null,
        policyVersionId: json.containsKey('policyVersionId')
            ? json['policyVersionId'] as String
            : null,
        isDefaultVersion: json.containsKey('isDefaultVersion')
            ? json['isDefaultVersion'] as bool
            : null,
      );
}

class CreateRoleAliasResponse {
  /// The role alias.
  final String roleAlias;

  /// The role alias ARN.
  final String roleAliasArn;

  CreateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });
  static CreateRoleAliasResponse fromJson(Map<String, dynamic> json) =>
      CreateRoleAliasResponse(
        roleAlias:
            json.containsKey('roleAlias') ? json['roleAlias'] as String : null,
        roleAliasArn: json.containsKey('roleAliasArn')
            ? json['roleAliasArn'] as String
            : null,
      );
}

class CreateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  CreateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  static CreateScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      CreateScheduledAuditResponse(
        scheduledAuditArn: json.containsKey('scheduledAuditArn')
            ? json['scheduledAuditArn'] as String
            : null,
      );
}

class CreateSecurityProfileResponse {
  /// The name you gave to the security profile.
  final String securityProfileName;

  /// The ARN of the security profile.
  final String securityProfileArn;

  CreateSecurityProfileResponse({
    this.securityProfileName,
    this.securityProfileArn,
  });
  static CreateSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      CreateSecurityProfileResponse(
        securityProfileName: json.containsKey('securityProfileName')
            ? json['securityProfileName'] as String
            : null,
        securityProfileArn: json.containsKey('securityProfileArn')
            ? json['securityProfileArn'] as String
            : null,
      );
}

class CreateStreamResponse {
  /// The stream ID.
  final String streamId;

  /// The stream ARN.
  final String streamArn;

  /// A description of the stream.
  final String description;

  /// The version of the stream.
  final int streamVersion;

  CreateStreamResponse({
    this.streamId,
    this.streamArn,
    this.description,
    this.streamVersion,
  });
  static CreateStreamResponse fromJson(Map<String, dynamic> json) =>
      CreateStreamResponse(
        streamId:
            json.containsKey('streamId') ? json['streamId'] as String : null,
        streamArn:
            json.containsKey('streamArn') ? json['streamArn'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        streamVersion: json.containsKey('streamVersion')
            ? json['streamVersion'] as int
            : null,
      );
}

class CreateThingGroupResponse {
  /// The thing group name.
  final String thingGroupName;

  /// The thing group ARN.
  final String thingGroupArn;

  /// The thing group ID.
  final String thingGroupId;

  CreateThingGroupResponse({
    this.thingGroupName,
    this.thingGroupArn,
    this.thingGroupId,
  });
  static CreateThingGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateThingGroupResponse(
        thingGroupName: json.containsKey('thingGroupName')
            ? json['thingGroupName'] as String
            : null,
        thingGroupArn: json.containsKey('thingGroupArn')
            ? json['thingGroupArn'] as String
            : null,
        thingGroupId: json.containsKey('thingGroupId')
            ? json['thingGroupId'] as String
            : null,
      );
}

/// The output of the CreateThing operation.
class CreateThingResponse {
  /// The name of the new thing.
  final String thingName;

  /// The ARN of the new thing.
  final String thingArn;

  /// The thing ID.
  final String thingId;

  CreateThingResponse({
    this.thingName,
    this.thingArn,
    this.thingId,
  });
  static CreateThingResponse fromJson(Map<String, dynamic> json) =>
      CreateThingResponse(
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        thingArn:
            json.containsKey('thingArn') ? json['thingArn'] as String : null,
        thingId: json.containsKey('thingId') ? json['thingId'] as String : null,
      );
}

/// The output of the CreateThingType operation.
class CreateThingTypeResponse {
  /// The name of the thing type.
  final String thingTypeName;

  /// The Amazon Resource Name (ARN) of the thing type.
  final String thingTypeArn;

  /// The thing type ID.
  final String thingTypeId;

  CreateThingTypeResponse({
    this.thingTypeName,
    this.thingTypeArn,
    this.thingTypeId,
  });
  static CreateThingTypeResponse fromJson(Map<String, dynamic> json) =>
      CreateThingTypeResponse(
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        thingTypeArn: json.containsKey('thingTypeArn')
            ? json['thingTypeArn'] as String
            : null,
        thingTypeId: json.containsKey('thingTypeId')
            ? json['thingTypeId'] as String
            : null,
      );
}

/// Describes a custom method used to code sign a file.
class CustomCodeSigning {
  /// The signature for the file.
  final CodeSigningSignature signature;

  /// The certificate chain.
  final CodeSigningCertificateChain certificateChain;

  /// The hash algorithm used to code sign the file.
  final String hashAlgorithm;

  /// The signature algorithm used to code sign the file.
  final String signatureAlgorithm;

  CustomCodeSigning({
    this.signature,
    this.certificateChain,
    this.hashAlgorithm,
    this.signatureAlgorithm,
  });
  static CustomCodeSigning fromJson(Map<String, dynamic> json) =>
      CustomCodeSigning(
        signature: json.containsKey('signature')
            ? CodeSigningSignature.fromJson(json['signature'])
            : null,
        certificateChain: json.containsKey('certificateChain')
            ? CodeSigningCertificateChain.fromJson(json['certificateChain'])
            : null,
        hashAlgorithm: json.containsKey('hashAlgorithm')
            ? json['hashAlgorithm'] as String
            : null,
        signatureAlgorithm: json.containsKey('signatureAlgorithm')
            ? json['signatureAlgorithm'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteAccountAuditConfigurationResponse {
  DeleteAccountAuditConfigurationResponse();
  static DeleteAccountAuditConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteAccountAuditConfigurationResponse();
}

class DeleteAuthorizerResponse {
  DeleteAuthorizerResponse();
  static DeleteAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      DeleteAuthorizerResponse();
}

class DeleteBillingGroupResponse {
  DeleteBillingGroupResponse();
  static DeleteBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteBillingGroupResponse();
}

/// The output for the DeleteCACertificate operation.
class DeleteCACertificateResponse {
  DeleteCACertificateResponse();
  static DeleteCACertificateResponse fromJson(Map<String, dynamic> json) =>
      DeleteCACertificateResponse();
}

class DeleteDynamicThingGroupResponse {
  DeleteDynamicThingGroupResponse();
  static DeleteDynamicThingGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteDynamicThingGroupResponse();
}

class DeleteMitigationActionResponse {
  DeleteMitigationActionResponse();
  static DeleteMitigationActionResponse fromJson(Map<String, dynamic> json) =>
      DeleteMitigationActionResponse();
}

class DeleteOtaUpdateResponse {
  DeleteOtaUpdateResponse();
  static DeleteOtaUpdateResponse fromJson(Map<String, dynamic> json) =>
      DeleteOtaUpdateResponse();
}

/// The output for the DeleteRegistrationCode operation.
class DeleteRegistrationCodeResponse {
  DeleteRegistrationCodeResponse();
  static DeleteRegistrationCodeResponse fromJson(Map<String, dynamic> json) =>
      DeleteRegistrationCodeResponse();
}

class DeleteRoleAliasResponse {
  DeleteRoleAliasResponse();
  static DeleteRoleAliasResponse fromJson(Map<String, dynamic> json) =>
      DeleteRoleAliasResponse();
}

class DeleteScheduledAuditResponse {
  DeleteScheduledAuditResponse();
  static DeleteScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      DeleteScheduledAuditResponse();
}

class DeleteSecurityProfileResponse {
  DeleteSecurityProfileResponse();
  static DeleteSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      DeleteSecurityProfileResponse();
}

class DeleteStreamResponse {
  DeleteStreamResponse();
  static DeleteStreamResponse fromJson(Map<String, dynamic> json) =>
      DeleteStreamResponse();
}

class DeleteThingGroupResponse {
  DeleteThingGroupResponse();
  static DeleteThingGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteThingGroupResponse();
}

/// The output of the DeleteThing operation.
class DeleteThingResponse {
  DeleteThingResponse();
  static DeleteThingResponse fromJson(Map<String, dynamic> json) =>
      DeleteThingResponse();
}

/// The output for the DeleteThingType operation.
class DeleteThingTypeResponse {
  DeleteThingTypeResponse();
  static DeleteThingTypeResponse fromJson(Map<String, dynamic> json) =>
      DeleteThingTypeResponse();
}

/// Contains information that denied the authorization.
class Denied {
  /// Information that implicitly denies the authorization. When a policy
  /// doesn't explicitly deny or allow an action on a resource it is considered
  /// an implicit deny.
  final ImplicitDeny implicitDeny;

  /// Information that explicitly denies the authorization.
  final ExplicitDeny explicitDeny;

  Denied({
    this.implicitDeny,
    this.explicitDeny,
  });
  static Denied fromJson(Map<String, dynamic> json) => Denied(
        implicitDeny: json.containsKey('implicitDeny')
            ? ImplicitDeny.fromJson(json['implicitDeny'])
            : null,
        explicitDeny: json.containsKey('explicitDeny')
            ? ExplicitDeny.fromJson(json['explicitDeny'])
            : null,
      );
}

/// The output for the DeprecateThingType operation.
class DeprecateThingTypeResponse {
  DeprecateThingTypeResponse();
  static DeprecateThingTypeResponse fromJson(Map<String, dynamic> json) =>
      DeprecateThingTypeResponse();
}

class DescribeAccountAuditConfigurationResponse {
  /// The ARN of the role that grants permission to AWS IoT to access
  /// information about your devices, policies, certificates, and other items as
  /// required when performing an audit.
  ///
  /// On the first call to `UpdateAccountAuditConfiguration`, this parameter is
  /// required.
  final String roleArn;

  /// Information about the targets to which audit notifications are sent for
  /// this account.
  final Map<String, AuditNotificationTarget>
      auditNotificationTargetConfigurations;

  /// Which audit checks are enabled and disabled for this account.
  final Map<String, AuditCheckConfiguration> auditCheckConfigurations;

  DescribeAccountAuditConfigurationResponse({
    this.roleArn,
    this.auditNotificationTargetConfigurations,
    this.auditCheckConfigurations,
  });
  static DescribeAccountAuditConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAccountAuditConfigurationResponse(
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        auditNotificationTargetConfigurations: json
                .containsKey('auditNotificationTargetConfigurations')
            ? (json['auditNotificationTargetConfigurations'] as Map).map(
                (k, v) =>
                    MapEntry(k as String, AuditNotificationTarget.fromJson(v)))
            : null,
        auditCheckConfigurations: json.containsKey('auditCheckConfigurations')
            ? (json['auditCheckConfigurations'] as Map).map((k, v) =>
                MapEntry(k as String, AuditCheckConfiguration.fromJson(v)))
            : null,
      );
}

class DescribeAuditFindingResponse {
  final AuditFinding finding;

  DescribeAuditFindingResponse({
    this.finding,
  });
  static DescribeAuditFindingResponse fromJson(Map<String, dynamic> json) =>
      DescribeAuditFindingResponse(
        finding: json.containsKey('finding')
            ? AuditFinding.fromJson(json['finding'])
            : null,
      );
}

class DescribeAuditMitigationActionsTaskResponse {
  /// The current status of the task.
  final String taskStatus;

  /// The date and time when the task was started.
  final DateTime startTime;

  /// The date and time when the task was completed or canceled.
  final DateTime endTime;

  /// Aggregate counts of the results when the mitigation tasks were applied to
  /// the findings for this audit mitigation actions task.
  final Map<String, TaskStatisticsForAuditCheck> taskStatistics;

  /// Identifies the findings to which the mitigation actions are applied. This
  /// can be by audit checks, by audit task, or a set of findings.
  final AuditMitigationActionsTaskTarget target;

  /// Specifies the mitigation actions that should be applied to specific audit
  /// checks.
  final Map<String, List<String>> auditCheckToActionsMapping;

  /// Specifies the mitigation actions and their parameters that are applied as
  /// part of this task.
  final List<MitigationAction> actionsDefinition;

  DescribeAuditMitigationActionsTaskResponse({
    this.taskStatus,
    this.startTime,
    this.endTime,
    this.taskStatistics,
    this.target,
    this.auditCheckToActionsMapping,
    this.actionsDefinition,
  });
  static DescribeAuditMitigationActionsTaskResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAuditMitigationActionsTaskResponse(
        taskStatus: json.containsKey('taskStatus')
            ? json['taskStatus'] as String
            : null,
        startTime: json.containsKey('startTime')
            ? DateTime.parse(json['startTime'])
            : null,
        endTime: json.containsKey('endTime')
            ? DateTime.parse(json['endTime'])
            : null,
        taskStatistics: json.containsKey('taskStatistics')
            ? (json['taskStatistics'] as Map).map((k, v) =>
                MapEntry(k as String, TaskStatisticsForAuditCheck.fromJson(v)))
            : null,
        target: json.containsKey('target')
            ? AuditMitigationActionsTaskTarget.fromJson(json['target'])
            : null,
        auditCheckToActionsMapping: json
                .containsKey('auditCheckToActionsMapping')
            ? (json['auditCheckToActionsMapping'] as Map).map((k, v) =>
                MapEntry(
                    k as String, (v as List).map((e) => e as String).toList()))
            : null,
        actionsDefinition: json.containsKey('actionsDefinition')
            ? (json['actionsDefinition'] as List)
                .map((e) => MitigationAction.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeAuditTaskResponse {
  /// The status of the audit: one of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  final String taskStatus;

  /// The type of audit: "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".
  final String taskType;

  /// The time the audit started.
  final DateTime taskStartTime;

  /// Statistical information about the audit.
  final TaskStatistics taskStatistics;

  /// The name of the scheduled audit (only if the audit was a scheduled audit).
  final String scheduledAuditName;

  /// Detailed information about each check performed during this audit.
  final Map<String, AuditCheckDetails> auditDetails;

  DescribeAuditTaskResponse({
    this.taskStatus,
    this.taskType,
    this.taskStartTime,
    this.taskStatistics,
    this.scheduledAuditName,
    this.auditDetails,
  });
  static DescribeAuditTaskResponse fromJson(Map<String, dynamic> json) =>
      DescribeAuditTaskResponse(
        taskStatus: json.containsKey('taskStatus')
            ? json['taskStatus'] as String
            : null,
        taskType:
            json.containsKey('taskType') ? json['taskType'] as String : null,
        taskStartTime: json.containsKey('taskStartTime')
            ? DateTime.parse(json['taskStartTime'])
            : null,
        taskStatistics: json.containsKey('taskStatistics')
            ? TaskStatistics.fromJson(json['taskStatistics'])
            : null,
        scheduledAuditName: json.containsKey('scheduledAuditName')
            ? json['scheduledAuditName'] as String
            : null,
        auditDetails: json.containsKey('auditDetails')
            ? (json['auditDetails'] as Map).map(
                (k, v) => MapEntry(k as String, AuditCheckDetails.fromJson(v)))
            : null,
      );
}

class DescribeAuthorizerResponse {
  /// The authorizer description.
  final AuthorizerDescription authorizerDescription;

  DescribeAuthorizerResponse({
    this.authorizerDescription,
  });
  static DescribeAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      DescribeAuthorizerResponse(
        authorizerDescription: json.containsKey('authorizerDescription')
            ? AuthorizerDescription.fromJson(json['authorizerDescription'])
            : null,
      );
}

class DescribeBillingGroupResponse {
  /// The name of the billing group.
  final String billingGroupName;

  /// The ID of the billing group.
  final String billingGroupId;

  /// The ARN of the billing group.
  final String billingGroupArn;

  /// The version of the billing group.
  final BigInt version;

  /// The properties of the billing group.
  final BillingGroupProperties billingGroupProperties;

  /// Additional information about the billing group.
  final BillingGroupMetadata billingGroupMetadata;

  DescribeBillingGroupResponse({
    this.billingGroupName,
    this.billingGroupId,
    this.billingGroupArn,
    this.version,
    this.billingGroupProperties,
    this.billingGroupMetadata,
  });
  static DescribeBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeBillingGroupResponse(
        billingGroupName: json.containsKey('billingGroupName')
            ? json['billingGroupName'] as String
            : null,
        billingGroupId: json.containsKey('billingGroupId')
            ? json['billingGroupId'] as String
            : null,
        billingGroupArn: json.containsKey('billingGroupArn')
            ? json['billingGroupArn'] as String
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
        billingGroupProperties: json.containsKey('billingGroupProperties')
            ? BillingGroupProperties.fromJson(json['billingGroupProperties'])
            : null,
        billingGroupMetadata: json.containsKey('billingGroupMetadata')
            ? BillingGroupMetadata.fromJson(json['billingGroupMetadata'])
            : null,
      );
}

/// The output from the DescribeCACertificate operation.
class DescribeCACertificateResponse {
  /// The CA certificate description.
  final CACertificateDescription certificateDescription;

  /// Information about the registration configuration.
  final RegistrationConfig registrationConfig;

  DescribeCACertificateResponse({
    this.certificateDescription,
    this.registrationConfig,
  });
  static DescribeCACertificateResponse fromJson(Map<String, dynamic> json) =>
      DescribeCACertificateResponse(
        certificateDescription: json.containsKey('certificateDescription')
            ? CACertificateDescription.fromJson(json['certificateDescription'])
            : null,
        registrationConfig: json.containsKey('registrationConfig')
            ? RegistrationConfig.fromJson(json['registrationConfig'])
            : null,
      );
}

/// The output of the DescribeCertificate operation.
class DescribeCertificateResponse {
  /// The description of the certificate.
  final CertificateDescription certificateDescription;

  DescribeCertificateResponse({
    this.certificateDescription,
  });
  static DescribeCertificateResponse fromJson(Map<String, dynamic> json) =>
      DescribeCertificateResponse(
        certificateDescription: json.containsKey('certificateDescription')
            ? CertificateDescription.fromJson(json['certificateDescription'])
            : null,
      );
}

class DescribeDefaultAuthorizerResponse {
  /// The default authorizer's description.
  final AuthorizerDescription authorizerDescription;

  DescribeDefaultAuthorizerResponse({
    this.authorizerDescription,
  });
  static DescribeDefaultAuthorizerResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDefaultAuthorizerResponse(
        authorizerDescription: json.containsKey('authorizerDescription')
            ? AuthorizerDescription.fromJson(json['authorizerDescription'])
            : null,
      );
}

/// The output from the DescribeEndpoint operation.
class DescribeEndpointResponse {
  /// The endpoint. The format of the endpoint is as follows:
  /// _identifier_.iot._region_.amazonaws.com.
  final String endpointAddress;

  DescribeEndpointResponse({
    this.endpointAddress,
  });
  static DescribeEndpointResponse fromJson(Map<String, dynamic> json) =>
      DescribeEndpointResponse(
        endpointAddress: json.containsKey('endpointAddress')
            ? json['endpointAddress'] as String
            : null,
      );
}

class DescribeEventConfigurationsResponse {
  /// The event configurations.
  final Map<String, Configuration> eventConfigurations;

  /// The creation date of the event configuration.
  final DateTime creationDate;

  /// The date the event configurations were last modified.
  final DateTime lastModifiedDate;

  DescribeEventConfigurationsResponse({
    this.eventConfigurations,
    this.creationDate,
    this.lastModifiedDate,
  });
  static DescribeEventConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeEventConfigurationsResponse(
        eventConfigurations: json.containsKey('eventConfigurations')
            ? (json['eventConfigurations'] as Map)
                .map((k, v) => MapEntry(k as String, Configuration.fromJson(v)))
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

class DescribeIndexResponse {
  /// The index name.
  final String indexName;

  /// The index status.
  final String indexStatus;

  /// Contains a value that specifies the type of indexing performed. Valid
  /// values are:
  ///
  /// *   REGISTRY – Your thing index contains only registry data.
  ///
  /// *   REGISTRY_AND_SHADOW - Your thing index contains registry data and
  /// shadow data.
  ///
  /// *   REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry
  /// data and thing connectivity status data.
  ///
  /// *   REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index
  /// contains registry data, shadow data, and thing connectivity status data.
  final String schema;

  DescribeIndexResponse({
    this.indexName,
    this.indexStatus,
    this.schema,
  });
  static DescribeIndexResponse fromJson(Map<String, dynamic> json) =>
      DescribeIndexResponse(
        indexName:
            json.containsKey('indexName') ? json['indexName'] as String : null,
        indexStatus: json.containsKey('indexStatus')
            ? json['indexStatus'] as String
            : null,
        schema: json.containsKey('schema') ? json['schema'] as String : null,
      );
}

class DescribeJobExecutionResponse {
  /// Information about the job execution.
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

class DescribeJobResponse {
  /// An S3 link to the job document.
  final String documentSource;

  /// Information about the job.
  final Job job;

  DescribeJobResponse({
    this.documentSource,
    this.job,
  });
  static DescribeJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobResponse(
        documentSource: json.containsKey('documentSource')
            ? json['documentSource'] as String
            : null,
        job: json.containsKey('job') ? Job.fromJson(json['job']) : null,
      );
}

class DescribeMitigationActionResponse {
  /// The friendly name that uniquely identifies the mitigation action.
  final String actionName;

  /// The type of mitigation action.
  final String actionType;

  /// The ARN that identifies this migration action.
  final String actionArn;

  /// A unique identifier for this action.
  final String actionId;

  /// The ARN of the IAM role used to apply this action.
  final String roleArn;

  /// Parameters that control how the mitigation action is applied, specific to
  /// the type of mitigation action.
  final MitigationActionParams actionParams;

  /// The date and time when the mitigation action was added to your AWS
  /// account.
  final DateTime creationDate;

  /// The date and time when the mitigation action was last changed.
  final DateTime lastModifiedDate;

  DescribeMitigationActionResponse({
    this.actionName,
    this.actionType,
    this.actionArn,
    this.actionId,
    this.roleArn,
    this.actionParams,
    this.creationDate,
    this.lastModifiedDate,
  });
  static DescribeMitigationActionResponse fromJson(Map<String, dynamic> json) =>
      DescribeMitigationActionResponse(
        actionName: json.containsKey('actionName')
            ? json['actionName'] as String
            : null,
        actionType: json.containsKey('actionType')
            ? json['actionType'] as String
            : null,
        actionArn:
            json.containsKey('actionArn') ? json['actionArn'] as String : null,
        actionId:
            json.containsKey('actionId') ? json['actionId'] as String : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        actionParams: json.containsKey('actionParams')
            ? MitigationActionParams.fromJson(json['actionParams'])
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

class DescribeRoleAliasResponse {
  /// The role alias description.
  final RoleAliasDescription roleAliasDescription;

  DescribeRoleAliasResponse({
    this.roleAliasDescription,
  });
  static DescribeRoleAliasResponse fromJson(Map<String, dynamic> json) =>
      DescribeRoleAliasResponse(
        roleAliasDescription: json.containsKey('roleAliasDescription')
            ? RoleAliasDescription.fromJson(json['roleAliasDescription'])
            : null,
      );
}

class DescribeScheduledAuditResponse {
  /// How often the scheduled audit takes place. One of "DAILY", "WEEKLY",
  /// "BIWEEKLY", or "MONTHLY". The start time of each audit is determined by
  /// the system.
  final String frequency;

  /// The day of the month on which the scheduled audit takes place. Will be "1"
  /// through "31" or "LAST". If days 29-31 are specified, and the month does
  /// not have that many days, the audit takes place on the "LAST" day of the
  /// month.
  final String dayOfMonth;

  /// The day of the week on which the scheduled audit takes place. One of
  /// "SUN", "MON", "TUE", "WED", "THU", "FRI", or "SAT".
  final String dayOfWeek;

  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use `DescribeAccountAuditConfiguration` to see
  /// the list of all checks, including those that are enabled or use
  /// `UpdateAccountAuditConfiguration` to select which checks are enabled.)
  final List<String> targetCheckNames;

  /// The name of the scheduled audit.
  final String scheduledAuditName;

  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  DescribeScheduledAuditResponse({
    this.frequency,
    this.dayOfMonth,
    this.dayOfWeek,
    this.targetCheckNames,
    this.scheduledAuditName,
    this.scheduledAuditArn,
  });
  static DescribeScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      DescribeScheduledAuditResponse(
        frequency:
            json.containsKey('frequency') ? json['frequency'] as String : null,
        dayOfMonth: json.containsKey('dayOfMonth')
            ? json['dayOfMonth'] as String
            : null,
        dayOfWeek:
            json.containsKey('dayOfWeek') ? json['dayOfWeek'] as String : null,
        targetCheckNames: json.containsKey('targetCheckNames')
            ? (json['targetCheckNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        scheduledAuditName: json.containsKey('scheduledAuditName')
            ? json['scheduledAuditName'] as String
            : null,
        scheduledAuditArn: json.containsKey('scheduledAuditArn')
            ? json['scheduledAuditArn'] as String
            : null,
      );
}

class DescribeSecurityProfileResponse {
  /// The name of the security profile.
  final String securityProfileName;

  /// The ARN of the security profile.
  final String securityProfileArn;

  /// A description of the security profile (associated with the security
  /// profile when it was created or updated).
  final String securityProfileDescription;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  final List<Behavior> behaviors;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  final Map<String, AlertTarget> alertTargets;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's `behaviors`, but it is also
  /// retained for any metric specified here.
  final List<String> additionalMetricsToRetain;

  /// The version of the security profile. A new version is generated whenever
  /// the security profile is updated.
  final BigInt version;

  /// The time the security profile was created.
  final DateTime creationDate;

  /// The time the security profile was last modified.
  final DateTime lastModifiedDate;

  DescribeSecurityProfileResponse({
    this.securityProfileName,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.behaviors,
    this.alertTargets,
    this.additionalMetricsToRetain,
    this.version,
    this.creationDate,
    this.lastModifiedDate,
  });
  static DescribeSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      DescribeSecurityProfileResponse(
        securityProfileName: json.containsKey('securityProfileName')
            ? json['securityProfileName'] as String
            : null,
        securityProfileArn: json.containsKey('securityProfileArn')
            ? json['securityProfileArn'] as String
            : null,
        securityProfileDescription:
            json.containsKey('securityProfileDescription')
                ? json['securityProfileDescription'] as String
                : null,
        behaviors: json.containsKey('behaviors')
            ? (json['behaviors'] as List)
                .map((e) => Behavior.fromJson(e))
                .toList()
            : null,
        alertTargets: json.containsKey('alertTargets')
            ? (json['alertTargets'] as Map)
                .map((k, v) => MapEntry(k as String, AlertTarget.fromJson(v)))
            : null,
        additionalMetricsToRetain: json.containsKey('additionalMetricsToRetain')
            ? (json['additionalMetricsToRetain'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

class DescribeStreamResponse {
  /// Information about the stream.
  final StreamInfo streamInfo;

  DescribeStreamResponse({
    this.streamInfo,
  });
  static DescribeStreamResponse fromJson(Map<String, dynamic> json) =>
      DescribeStreamResponse(
        streamInfo: json.containsKey('streamInfo')
            ? StreamInfo.fromJson(json['streamInfo'])
            : null,
      );
}

class DescribeThingGroupResponse {
  /// The name of the thing group.
  final String thingGroupName;

  /// The thing group ID.
  final String thingGroupId;

  /// The thing group ARN.
  final String thingGroupArn;

  /// The version of the thing group.
  final BigInt version;

  /// The thing group properties.
  final ThingGroupProperties thingGroupProperties;

  /// Thing group metadata.
  final ThingGroupMetadata thingGroupMetadata;

  /// The dynamic thing group index name.
  final String indexName;

  /// The dynamic thing group search query string.
  final String queryString;

  /// The dynamic thing group query version.
  final String queryVersion;

  /// The dynamic thing group status.
  final String status;

  DescribeThingGroupResponse({
    this.thingGroupName,
    this.thingGroupId,
    this.thingGroupArn,
    this.version,
    this.thingGroupProperties,
    this.thingGroupMetadata,
    this.indexName,
    this.queryString,
    this.queryVersion,
    this.status,
  });
  static DescribeThingGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeThingGroupResponse(
        thingGroupName: json.containsKey('thingGroupName')
            ? json['thingGroupName'] as String
            : null,
        thingGroupId: json.containsKey('thingGroupId')
            ? json['thingGroupId'] as String
            : null,
        thingGroupArn: json.containsKey('thingGroupArn')
            ? json['thingGroupArn'] as String
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
        thingGroupProperties: json.containsKey('thingGroupProperties')
            ? ThingGroupProperties.fromJson(json['thingGroupProperties'])
            : null,
        thingGroupMetadata: json.containsKey('thingGroupMetadata')
            ? ThingGroupMetadata.fromJson(json['thingGroupMetadata'])
            : null,
        indexName:
            json.containsKey('indexName') ? json['indexName'] as String : null,
        queryString: json.containsKey('queryString')
            ? json['queryString'] as String
            : null,
        queryVersion: json.containsKey('queryVersion')
            ? json['queryVersion'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

class DescribeThingRegistrationTaskResponse {
  /// The task ID.
  final String taskId;

  /// The task creation date.
  final DateTime creationDate;

  /// The date when the task was last modified.
  final DateTime lastModifiedDate;

  /// The task's template.
  final String templateBody;

  /// The S3 bucket that contains the input file.
  final String inputFileBucket;

  /// The input file key.
  final String inputFileKey;

  /// The role ARN that grants access to the input file bucket.
  final String roleArn;

  /// The status of the bulk thing provisioning task.
  final String status;

  /// The message.
  final String message;

  /// The number of things successfully provisioned.
  final int successCount;

  /// The number of things that failed to be provisioned.
  final int failureCount;

  /// The progress of the bulk provisioning task expressed as a percentage.
  final int percentageProgress;

  DescribeThingRegistrationTaskResponse({
    this.taskId,
    this.creationDate,
    this.lastModifiedDate,
    this.templateBody,
    this.inputFileBucket,
    this.inputFileKey,
    this.roleArn,
    this.status,
    this.message,
    this.successCount,
    this.failureCount,
    this.percentageProgress,
  });
  static DescribeThingRegistrationTaskResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeThingRegistrationTaskResponse(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        templateBody: json.containsKey('templateBody')
            ? json['templateBody'] as String
            : null,
        inputFileBucket: json.containsKey('inputFileBucket')
            ? json['inputFileBucket'] as String
            : null,
        inputFileKey: json.containsKey('inputFileKey')
            ? json['inputFileKey'] as String
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
        successCount: json.containsKey('successCount')
            ? json['successCount'] as int
            : null,
        failureCount: json.containsKey('failureCount')
            ? json['failureCount'] as int
            : null,
        percentageProgress: json.containsKey('percentageProgress')
            ? json['percentageProgress'] as int
            : null,
      );
}

/// The output from the DescribeThing operation.
class DescribeThingResponse {
  /// The default client ID.
  final String defaultClientId;

  /// The name of the thing.
  final String thingName;

  /// The ID of the thing to describe.
  final String thingId;

  /// The ARN of the thing to describe.
  final String thingArn;

  /// The thing type name.
  final String thingTypeName;

  /// The thing attributes.
  final Map<String, String> attributes;

  /// The current version of the thing record in the registry.
  ///
  ///
  ///
  /// To avoid unintentional changes to the information in the registry, you can
  /// pass the version information in the `expectedVersion` parameter of the
  /// `UpdateThing` and `DeleteThing` calls.
  final BigInt version;

  /// The name of the billing group the thing belongs to.
  final String billingGroupName;

  DescribeThingResponse({
    this.defaultClientId,
    this.thingName,
    this.thingId,
    this.thingArn,
    this.thingTypeName,
    this.attributes,
    this.version,
    this.billingGroupName,
  });
  static DescribeThingResponse fromJson(Map<String, dynamic> json) =>
      DescribeThingResponse(
        defaultClientId: json.containsKey('defaultClientId')
            ? json['defaultClientId'] as String
            : null,
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        thingId: json.containsKey('thingId') ? json['thingId'] as String : null,
        thingArn:
            json.containsKey('thingArn') ? json['thingArn'] as String : null,
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
        billingGroupName: json.containsKey('billingGroupName')
            ? json['billingGroupName'] as String
            : null,
      );
}

/// The output for the DescribeThingType operation.
class DescribeThingTypeResponse {
  /// The name of the thing type.
  final String thingTypeName;

  /// The thing type ID.
  final String thingTypeId;

  /// The thing type ARN.
  final String thingTypeArn;

  /// The ThingTypeProperties contains information about the thing type
  /// including description, and a list of searchable thing attribute names.
  final ThingTypeProperties thingTypeProperties;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing
  /// type is deprecated, and a date and time when it was deprecated.
  final ThingTypeMetadata thingTypeMetadata;

  DescribeThingTypeResponse({
    this.thingTypeName,
    this.thingTypeId,
    this.thingTypeArn,
    this.thingTypeProperties,
    this.thingTypeMetadata,
  });
  static DescribeThingTypeResponse fromJson(Map<String, dynamic> json) =>
      DescribeThingTypeResponse(
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        thingTypeId: json.containsKey('thingTypeId')
            ? json['thingTypeId'] as String
            : null,
        thingTypeArn: json.containsKey('thingTypeArn')
            ? json['thingTypeArn'] as String
            : null,
        thingTypeProperties: json.containsKey('thingTypeProperties')
            ? ThingTypeProperties.fromJson(json['thingTypeProperties'])
            : null,
        thingTypeMetadata: json.containsKey('thingTypeMetadata')
            ? ThingTypeMetadata.fromJson(json['thingTypeMetadata'])
            : null,
      );
}

/// Describes the location of the updated firmware.
class Destination {
  /// Describes the location in S3 of the updated firmware.
  final S3Destination s3Destination;

  Destination({
    this.s3Destination,
  });
  static Destination fromJson(Map<String, dynamic> json) => Destination(
        s3Destination: json.containsKey('s3Destination')
            ? S3Destination.fromJson(json['s3Destination'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DetachSecurityProfileResponse {
  DetachSecurityProfileResponse();
  static DetachSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      DetachSecurityProfileResponse();
}

/// The output from the DetachThingPrincipal operation.
class DetachThingPrincipalResponse {
  DetachThingPrincipalResponse();
  static DetachThingPrincipalResponse fromJson(Map<String, dynamic> json) =>
      DetachThingPrincipalResponse();
}

/// Describes an action to write to a DynamoDB table.
///
/// The `tableName`, `hashKeyField`, and `rangeKeyField` values must match the
/// values used when you created the table.
///
/// The `hashKeyValue` and `rangeKeyvalue` fields use a substitution template
/// syntax. These templates provide data at runtime. The syntax is as follows:
/// ${_sql-expression_}.
///
/// You can specify any valid expression in a WHERE or SELECT clause, including
/// JSON properties, comparisons, calculations, and functions. For example, the
/// following field uses the third level of the topic:
///
///  `"hashKeyValue": "${topic(3)}"`
///
/// The following field uses the timestamp:
///
///  `"rangeKeyValue": "${timestamp()}"`
class DynamoDBAction {
  /// The name of the DynamoDB table.
  final String tableName;

  /// The ARN of the IAM role that grants access to the DynamoDB table.
  final String roleArn;

  /// The type of operation to be performed. This follows the substitution
  /// template, so it can be `${operation}`, but the substitution must result in
  /// one of the following: `INSERT`, `UPDATE`, or `DELETE`.
  final String operation;

  /// The hash key name.
  final String hashKeyField;

  /// The hash key value.
  final String hashKeyValue;

  /// The hash key type. Valid values are "STRING" or "NUMBER"
  final String hashKeyType;

  /// The range key name.
  final String rangeKeyField;

  /// The range key value.
  final String rangeKeyValue;

  /// The range key type. Valid values are "STRING" or "NUMBER"
  final String rangeKeyType;

  /// The action payload. This name can be customized.
  final String payloadField;

  DynamoDBAction({
    @required this.tableName,
    @required this.roleArn,
    this.operation,
    @required this.hashKeyField,
    @required this.hashKeyValue,
    this.hashKeyType,
    this.rangeKeyField,
    this.rangeKeyValue,
    this.rangeKeyType,
    this.payloadField,
  });
  static DynamoDBAction fromJson(Map<String, dynamic> json) => DynamoDBAction(
        tableName: json['tableName'] as String,
        roleArn: json['roleArn'] as String,
        operation:
            json.containsKey('operation') ? json['operation'] as String : null,
        hashKeyField: json['hashKeyField'] as String,
        hashKeyValue: json['hashKeyValue'] as String,
        hashKeyType: json.containsKey('hashKeyType')
            ? json['hashKeyType'] as String
            : null,
        rangeKeyField: json.containsKey('rangeKeyField')
            ? json['rangeKeyField'] as String
            : null,
        rangeKeyValue: json.containsKey('rangeKeyValue')
            ? json['rangeKeyValue'] as String
            : null,
        rangeKeyType: json.containsKey('rangeKeyType')
            ? json['rangeKeyType'] as String
            : null,
        payloadField: json.containsKey('payloadField')
            ? json['payloadField'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to write to a DynamoDB table.
///
/// This DynamoDB action writes each attribute in the message payload into it's
/// own column in the DynamoDB table.
class DynamodBv2Action {
  /// The ARN of the IAM role that grants access to the DynamoDB table.
  final String roleArn;

  /// Specifies the DynamoDB table to which the message data will be written.
  /// For example:
  ///
  ///  `{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": {
  /// "tableName": "my-table" } } }`
  ///
  /// Each attribute in the message payload will be written to a separate column
  /// in the DynamoDB database.
  final PutItemInput putItem;

  DynamodBv2Action({
    @required this.roleArn,
    @required this.putItem,
  });
  static DynamodBv2Action fromJson(Map<String, dynamic> json) =>
      DynamodBv2Action(
        roleArn: json['roleArn'] as String,
        putItem: PutItemInput.fromJson(json['putItem']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The policy that has the effect on the authorization results.
class EffectivePolicy {
  /// The policy name.
  final String policyName;

  /// The policy ARN.
  final String policyArn;

  /// The IAM policy document.
  final String policyDocument;

  EffectivePolicy({
    this.policyName,
    this.policyArn,
    this.policyDocument,
  });
  static EffectivePolicy fromJson(Map<String, dynamic> json) => EffectivePolicy(
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
        policyDocument: json.containsKey('policyDocument')
            ? json['policyDocument'] as String
            : null,
      );
}

/// Describes an action that writes data to an Amazon Elasticsearch Service
/// domain.
class ElasticsearchAction {
  /// The IAM role ARN that has access to Elasticsearch.
  final String roleArn;

  /// The endpoint of your Elasticsearch domain.
  final String endpoint;

  /// The Elasticsearch index where you want to store your data.
  final String index;

  /// The type of document you are storing.
  final String type;

  /// The unique identifier for the document you are storing.
  final String id;

  ElasticsearchAction({
    @required this.roleArn,
    @required this.endpoint,
    @required this.index,
    @required this.type,
    @required this.id,
  });
  static ElasticsearchAction fromJson(Map<String, dynamic> json) =>
      ElasticsearchAction(
        roleArn: json['roleArn'] as String,
        endpoint: json['endpoint'] as String,
        index: json['index'] as String,
        type: json['type'] as String,
        id: json['id'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Parameters used when defining a mitigation action that enable AWS IoT
/// logging.
class EnableIotLoggingParams {
  /// The ARN of the IAM role used for logging.
  final String roleArnForLogging;

  /// Specifies the types of information to be logged.
  final String logLevel;

  EnableIotLoggingParams({
    @required this.roleArnForLogging,
    @required this.logLevel,
  });
  static EnableIotLoggingParams fromJson(Map<String, dynamic> json) =>
      EnableIotLoggingParams(
        roleArnForLogging: json['roleArnForLogging'] as String,
        logLevel: json['logLevel'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Error information.
class ErrorInfo {
  /// The error code.
  final String code;

  /// The error message.
  final String message;

  ErrorInfo({
    this.code,
    this.message,
  });
  static ErrorInfo fromJson(Map<String, dynamic> json) => ErrorInfo(
        code: json.containsKey('code') ? json['code'] as String : null,
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// Information that explicitly denies authorization.
class ExplicitDeny {
  /// The policies that denied the authorization.
  final List<Policy> policies;

  ExplicitDeny({
    this.policies,
  });
  static ExplicitDeny fromJson(Map<String, dynamic> json) => ExplicitDeny(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
      );
}

/// Allows you to create an exponential rate of rollout for a job.
class ExponentialRolloutRate {
  /// The minimum number of things that will be notified of a pending job, per
  /// minute at the start of job rollout. This parameter allows you to define
  /// the initial rate of rollout.
  final int baseRatePerMinute;

  /// The exponential factor to increase the rate of rollout for a job.
  final double incrementFactor;

  /// The criteria to initiate the increase in rate of rollout for a job.
  ///
  /// AWS IoT supports up to one digit after the decimal (for example, 1.5, but
  /// not 1.55).
  final RateIncreaseCriteria rateIncreaseCriteria;

  ExponentialRolloutRate({
    @required this.baseRatePerMinute,
    @required this.incrementFactor,
    @required this.rateIncreaseCriteria,
  });
  static ExponentialRolloutRate fromJson(Map<String, dynamic> json) =>
      ExponentialRolloutRate(
        baseRatePerMinute: json['baseRatePerMinute'] as int,
        incrementFactor: json['incrementFactor'] as double,
        rateIncreaseCriteria:
            RateIncreaseCriteria.fromJson(json['rateIncreaseCriteria']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The location of the OTA update.
class FileLocation {
  /// The stream that contains the OTA update.
  final Stream stream;

  /// The location of the updated firmware in S3.
  final S3Location s3Location;

  FileLocation({
    this.stream,
    this.s3Location,
  });
  static FileLocation fromJson(Map<String, dynamic> json) => FileLocation(
        stream:
            json.containsKey('stream') ? Stream.fromJson(json['stream']) : null,
        s3Location: json.containsKey('s3Location')
            ? S3Location.fromJson(json['s3Location'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action that writes data to an Amazon Kinesis Firehose stream.
class FirehoseAction {
  /// The IAM role that grants access to the Amazon Kinesis Firehose stream.
  final String roleArn;

  /// The delivery stream name.
  final String deliveryStreamName;

  /// A character separator that will be used to separate records written to the
  /// Firehose stream. Valid values are: 'n' (newline), 't' (tab), 'rn' (Windows
  /// newline), ',' (comma).
  final String separator;

  FirehoseAction({
    @required this.roleArn,
    @required this.deliveryStreamName,
    this.separator,
  });
  static FirehoseAction fromJson(Map<String, dynamic> json) => FirehoseAction(
        roleArn: json['roleArn'] as String,
        deliveryStreamName: json['deliveryStreamName'] as String,
        separator:
            json.containsKey('separator') ? json['separator'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetEffectivePoliciesResponse {
  /// The effective policies.
  final List<EffectivePolicy> effectivePolicies;

  GetEffectivePoliciesResponse({
    this.effectivePolicies,
  });
  static GetEffectivePoliciesResponse fromJson(Map<String, dynamic> json) =>
      GetEffectivePoliciesResponse(
        effectivePolicies: json.containsKey('effectivePolicies')
            ? (json['effectivePolicies'] as List)
                .map((e) => EffectivePolicy.fromJson(e))
                .toList()
            : null,
      );
}

class GetIndexingConfigurationResponse {
  /// Thing indexing configuration.
  final ThingIndexingConfiguration thingIndexingConfiguration;

  /// The index configuration.
  final ThingGroupIndexingConfiguration thingGroupIndexingConfiguration;

  GetIndexingConfigurationResponse({
    this.thingIndexingConfiguration,
    this.thingGroupIndexingConfiguration,
  });
  static GetIndexingConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetIndexingConfigurationResponse(
        thingIndexingConfiguration:
            json.containsKey('thingIndexingConfiguration')
                ? ThingIndexingConfiguration.fromJson(
                    json['thingIndexingConfiguration'])
                : null,
        thingGroupIndexingConfiguration:
            json.containsKey('thingGroupIndexingConfiguration')
                ? ThingGroupIndexingConfiguration.fromJson(
                    json['thingGroupIndexingConfiguration'])
                : null,
      );
}

class GetJobDocumentResponse {
  /// The job document content.
  final String document;

  GetJobDocumentResponse({
    this.document,
  });
  static GetJobDocumentResponse fromJson(Map<String, dynamic> json) =>
      GetJobDocumentResponse(
        document:
            json.containsKey('document') ? json['document'] as String : null,
      );
}

/// The output from the GetLoggingOptions operation.
class GetLoggingOptionsResponse {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The logging level.
  final String logLevel;

  GetLoggingOptionsResponse({
    this.roleArn,
    this.logLevel,
  });
  static GetLoggingOptionsResponse fromJson(Map<String, dynamic> json) =>
      GetLoggingOptionsResponse(
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        logLevel:
            json.containsKey('logLevel') ? json['logLevel'] as String : null,
      );
}

class GetOtaUpdateResponse {
  /// The OTA update info.
  final OtaUpdateInfo otaUpdateInfo;

  GetOtaUpdateResponse({
    this.otaUpdateInfo,
  });
  static GetOtaUpdateResponse fromJson(Map<String, dynamic> json) =>
      GetOtaUpdateResponse(
        otaUpdateInfo: json.containsKey('otaUpdateInfo')
            ? OtaUpdateInfo.fromJson(json['otaUpdateInfo'])
            : null,
      );
}

/// The output from the GetPolicy operation.
class GetPolicyResponse {
  /// The policy name.
  final String policyName;

  /// The policy ARN.
  final String policyArn;

  /// The JSON document that describes the policy.
  final String policyDocument;

  /// The default policy version ID.
  final String defaultVersionId;

  /// The date the policy was created.
  final DateTime creationDate;

  /// The date the policy was last modified.
  final DateTime lastModifiedDate;

  /// The generation ID of the policy.
  final String generationId;

  GetPolicyResponse({
    this.policyName,
    this.policyArn,
    this.policyDocument,
    this.defaultVersionId,
    this.creationDate,
    this.lastModifiedDate,
    this.generationId,
  });
  static GetPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyResponse(
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
        policyDocument: json.containsKey('policyDocument')
            ? json['policyDocument'] as String
            : null,
        defaultVersionId: json.containsKey('defaultVersionId')
            ? json['defaultVersionId'] as String
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        generationId: json.containsKey('generationId')
            ? json['generationId'] as String
            : null,
      );
}

/// The output from the GetPolicyVersion operation.
class GetPolicyVersionResponse {
  /// The policy ARN.
  final String policyArn;

  /// The policy name.
  final String policyName;

  /// The JSON document that describes the policy.
  final String policyDocument;

  /// The policy version ID.
  final String policyVersionId;

  /// Specifies whether the policy version is the default.
  final bool isDefaultVersion;

  /// The date the policy version was created.
  final DateTime creationDate;

  /// The date the policy version was last modified.
  final DateTime lastModifiedDate;

  /// The generation ID of the policy version.
  final String generationId;

  GetPolicyVersionResponse({
    this.policyArn,
    this.policyName,
    this.policyDocument,
    this.policyVersionId,
    this.isDefaultVersion,
    this.creationDate,
    this.lastModifiedDate,
    this.generationId,
  });
  static GetPolicyVersionResponse fromJson(Map<String, dynamic> json) =>
      GetPolicyVersionResponse(
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyDocument: json.containsKey('policyDocument')
            ? json['policyDocument'] as String
            : null,
        policyVersionId: json.containsKey('policyVersionId')
            ? json['policyVersionId'] as String
            : null,
        isDefaultVersion: json.containsKey('isDefaultVersion')
            ? json['isDefaultVersion'] as bool
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        generationId: json.containsKey('generationId')
            ? json['generationId'] as String
            : null,
      );
}

/// The output from the GetRegistrationCode operation.
class GetRegistrationCodeResponse {
  /// The CA certificate registration code.
  final String registrationCode;

  GetRegistrationCodeResponse({
    this.registrationCode,
  });
  static GetRegistrationCodeResponse fromJson(Map<String, dynamic> json) =>
      GetRegistrationCodeResponse(
        registrationCode: json.containsKey('registrationCode')
            ? json['registrationCode'] as String
            : null,
      );
}

class GetStatisticsResponse {
  /// The statistics returned by the Fleet Indexing service based on the query
  /// and aggregation field.
  final Statistics statistics;

  GetStatisticsResponse({
    this.statistics,
  });
  static GetStatisticsResponse fromJson(Map<String, dynamic> json) =>
      GetStatisticsResponse(
        statistics: json.containsKey('statistics')
            ? Statistics.fromJson(json['statistics'])
            : null,
      );
}

/// The output from the GetTopicRule operation.
class GetTopicRuleResponse {
  /// The rule ARN.
  final String ruleArn;

  /// The rule.
  final TopicRule rule;

  GetTopicRuleResponse({
    this.ruleArn,
    this.rule,
  });
  static GetTopicRuleResponse fromJson(Map<String, dynamic> json) =>
      GetTopicRuleResponse(
        ruleArn: json.containsKey('ruleArn') ? json['ruleArn'] as String : null,
        rule:
            json.containsKey('rule') ? TopicRule.fromJson(json['rule']) : null,
      );
}

class GetV2LoggingOptionsResponse {
  /// The IAM role ARN AWS IoT uses to write to your CloudWatch logs.
  final String roleArn;

  /// The default log level.
  final String defaultLogLevel;

  /// Disables all logs.
  final bool disableAllLogs;

  GetV2LoggingOptionsResponse({
    this.roleArn,
    this.defaultLogLevel,
    this.disableAllLogs,
  });
  static GetV2LoggingOptionsResponse fromJson(Map<String, dynamic> json) =>
      GetV2LoggingOptionsResponse(
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        defaultLogLevel: json.containsKey('defaultLogLevel')
            ? json['defaultLogLevel'] as String
            : null,
        disableAllLogs: json.containsKey('disableAllLogs')
            ? json['disableAllLogs'] as bool
            : null,
      );
}

/// The name and ARN of a group.
class GroupNameAndArn {
  /// The group name.
  final String groupName;

  /// The group ARN.
  final String groupArn;

  GroupNameAndArn({
    this.groupName,
    this.groupArn,
  });
  static GroupNameAndArn fromJson(Map<String, dynamic> json) => GroupNameAndArn(
        groupName:
            json.containsKey('groupName') ? json['groupName'] as String : null,
        groupArn:
            json.containsKey('groupArn') ? json['groupArn'] as String : null,
      );
}

/// Information that implicitly denies authorization. When policy doesn't
/// explicitly deny or allow an action on a resource it is considered an
/// implicit deny.
class ImplicitDeny {
  /// Policies that don't contain a matching allow or deny statement for the
  /// specified action on the specified resource.
  final List<Policy> policies;

  ImplicitDeny({
    this.policies,
  });
  static ImplicitDeny fromJson(Map<String, dynamic> json) => ImplicitDeny(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
      );
}

/// Sends message data to an AWS IoT Analytics channel.
class IotAnalyticsAction {
  /// (deprecated) The ARN of the IoT Analytics channel to which message data
  /// will be sent.
  final String channelArn;

  /// The name of the IoT Analytics channel to which message data will be sent.
  final String channelName;

  /// The ARN of the role which has a policy that grants IoT Analytics
  /// permission to send message data via IoT Analytics
  /// (iotanalytics:BatchPutMessage).
  final String roleArn;

  IotAnalyticsAction({
    this.channelArn,
    this.channelName,
    this.roleArn,
  });
  static IotAnalyticsAction fromJson(Map<String, dynamic> json) =>
      IotAnalyticsAction(
        channelArn: json.containsKey('channelArn')
            ? json['channelArn'] as String
            : null,
        channelName: json.containsKey('channelName')
            ? json['channelName'] as String
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Sends an input to an AWS IoT Events detector.
class IotEventsAction {
  /// The name of the AWS IoT Events input.
  final String inputName;

  /// [Optional] Use this to ensure that only one input (message) with a given
  /// messageId will be processed by an AWS IoT Events detector.
  final String messageId;

  /// The ARN of the role that grants AWS IoT permission to send an input to an
  /// AWS IoT Events detector. ("Action":"iotevents:BatchPutMessage").
  final String roleArn;

  IotEventsAction({
    @required this.inputName,
    this.messageId,
    @required this.roleArn,
  });
  static IotEventsAction fromJson(Map<String, dynamic> json) => IotEventsAction(
        inputName: json['inputName'] as String,
        messageId:
            json.containsKey('messageId') ? json['messageId'] as String : null,
        roleArn: json['roleArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The `Job` object contains details about a job.
class Job {
  /// An ARN identifying the job with format
  /// "arn:aws:iot:region:account:job/jobId".
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a device
  /// when the thing representing the device is added to a target group, even
  /// after the job was completed by all things originally in the group.
  final String targetSelection;

  /// The status of the job, one of `IN_PROGRESS`, `CANCELED`,
  /// `DELETION_IN_PROGRESS` or `COMPLETED`.
  final String status;

  /// Will be `true` if the job was canceled with the optional `force` parameter
  /// set to `true`.
  final bool forceCanceled;

  /// If the job was updated, provides the reason code for the update.
  final String reasonCode;

  /// If the job was updated, describes the reason for the update.
  final String comment;

  /// A list of IoT things and thing groups to which the job should be sent.
  final List<String> targets;

  /// A short text description of the job.
  final String description;

  /// Configuration for pre-signed S3 URLs.
  final PresignedUrlConfig presignedUrlConfig;

  /// Allows you to create a staged rollout of a job.
  final JobExecutionsRolloutConfig jobExecutionsRolloutConfig;

  /// Configuration for criteria to abort the job.
  final AbortConfig abortConfig;

  /// The time, in seconds since the epoch, when the job was created.
  final DateTime createdAt;

  /// The time, in seconds since the epoch, when the job was last updated.
  final DateTime lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job was completed.
  final DateTime completedAt;

  /// Details about the job process.
  final JobProcessDetails jobProcessDetails;

  /// Specifies the amount of time each device has to finish its execution of
  /// the job. A timer is started when the job execution status is set to
  /// `IN_PROGRESS`. If the job execution status is not set to another terminal
  /// state before the timer expires, it will be automatically set to
  /// `TIMED_OUT`.
  final TimeoutConfig timeoutConfig;

  Job({
    this.jobArn,
    this.jobId,
    this.targetSelection,
    this.status,
    this.forceCanceled,
    this.reasonCode,
    this.comment,
    this.targets,
    this.description,
    this.presignedUrlConfig,
    this.jobExecutionsRolloutConfig,
    this.abortConfig,
    this.createdAt,
    this.lastUpdatedAt,
    this.completedAt,
    this.jobProcessDetails,
    this.timeoutConfig,
  });
  static Job fromJson(Map<String, dynamic> json) => Job(
        jobArn: json.containsKey('jobArn') ? json['jobArn'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        targetSelection: json.containsKey('targetSelection')
            ? json['targetSelection'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        forceCanceled: json.containsKey('forceCanceled')
            ? json['forceCanceled'] as bool
            : null,
        reasonCode: json.containsKey('reasonCode')
            ? json['reasonCode'] as String
            : null,
        comment: json.containsKey('comment') ? json['comment'] as String : null,
        targets: json.containsKey('targets')
            ? (json['targets'] as List).map((e) => e as String).toList()
            : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        presignedUrlConfig: json.containsKey('presignedUrlConfig')
            ? PresignedUrlConfig.fromJson(json['presignedUrlConfig'])
            : null,
        jobExecutionsRolloutConfig:
            json.containsKey('jobExecutionsRolloutConfig')
                ? JobExecutionsRolloutConfig.fromJson(
                    json['jobExecutionsRolloutConfig'])
                : null,
        abortConfig: json.containsKey('abortConfig')
            ? AbortConfig.fromJson(json['abortConfig'])
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        completedAt: json.containsKey('completedAt')
            ? DateTime.parse(json['completedAt'])
            : null,
        jobProcessDetails: json.containsKey('jobProcessDetails')
            ? JobProcessDetails.fromJson(json['jobProcessDetails'])
            : null,
        timeoutConfig: json.containsKey('timeoutConfig')
            ? TimeoutConfig.fromJson(json['timeoutConfig'])
            : null,
      );
}

/// The job execution object represents the execution of a job on a particular
/// device.
class JobExecution {
  /// The unique identifier you assigned to the job when it was created.
  final String jobId;

  /// The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED,
  /// TIMED_OUT, CANCELED, or REJECTED).
  final String status;

  /// Will be `true` if the job execution was canceled with the optional `force`
  /// parameter set to `true`.
  final bool forceCanceled;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  final JobExecutionStatusDetails statusDetails;

  /// The ARN of the thing on which the job execution is running.
  final String thingArn;

  /// The time, in seconds since the epoch, when the job execution was queued.
  final DateTime queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  final DateTime startedAt;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final DateTime lastUpdatedAt;

  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used in
  /// commands which return or update job execution information.
  final BigInt executionNumber;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  final BigInt versionNumber;

  /// The estimated number of seconds that remain before the job execution
  /// status will be changed to `TIMED_OUT`. The timeout interval can be
  /// anywhere between 1 minute and 7 days (1 to 10080 minutes). The actual job
  /// execution timeout can occur up to 60 seconds later than the estimated
  /// duration. This value will not be included if the job execution has reached
  /// a terminal status.
  final BigInt approximateSecondsBeforeTimedOut;

  JobExecution({
    this.jobId,
    this.status,
    this.forceCanceled,
    this.statusDetails,
    this.thingArn,
    this.queuedAt,
    this.startedAt,
    this.lastUpdatedAt,
    this.executionNumber,
    this.versionNumber,
    this.approximateSecondsBeforeTimedOut,
  });
  static JobExecution fromJson(Map<String, dynamic> json) => JobExecution(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        forceCanceled: json.containsKey('forceCanceled')
            ? json['forceCanceled'] as bool
            : null,
        statusDetails: json.containsKey('statusDetails')
            ? JobExecutionStatusDetails.fromJson(json['statusDetails'])
            : null,
        thingArn:
            json.containsKey('thingArn') ? json['thingArn'] as String : null,
        queuedAt: json.containsKey('queuedAt')
            ? DateTime.parse(json['queuedAt'])
            : null,
        startedAt: json.containsKey('startedAt')
            ? DateTime.parse(json['startedAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        executionNumber: json.containsKey('executionNumber')
            ? BigInt.from(json['executionNumber'])
            : null,
        versionNumber: json.containsKey('versionNumber')
            ? BigInt.from(json['versionNumber'])
            : null,
        approximateSecondsBeforeTimedOut:
            json.containsKey('approximateSecondsBeforeTimedOut')
                ? BigInt.from(json['approximateSecondsBeforeTimedOut'])
                : null,
      );
}

/// Details of the job execution status.
class JobExecutionStatusDetails {
  /// The job execution status.
  final Map<String, String> detailsMap;

  JobExecutionStatusDetails({
    this.detailsMap,
  });
  static JobExecutionStatusDetails fromJson(Map<String, dynamic> json) =>
      JobExecutionStatusDetails(
        detailsMap: json.containsKey('detailsMap')
            ? (json['detailsMap'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The job execution summary.
class JobExecutionSummary {
  /// The status of the job execution.
  final String status;

  /// The time, in seconds since the epoch, when the job execution was queued.
  final DateTime queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  final DateTime startedAt;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  final DateTime lastUpdatedAt;

  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used later
  /// in commands which return or update job execution information.
  final BigInt executionNumber;

  JobExecutionSummary({
    this.status,
    this.queuedAt,
    this.startedAt,
    this.lastUpdatedAt,
    this.executionNumber,
  });
  static JobExecutionSummary fromJson(Map<String, dynamic> json) =>
      JobExecutionSummary(
        status: json.containsKey('status') ? json['status'] as String : null,
        queuedAt: json.containsKey('queuedAt')
            ? DateTime.parse(json['queuedAt'])
            : null,
        startedAt: json.containsKey('startedAt')
            ? DateTime.parse(json['startedAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        executionNumber: json.containsKey('executionNumber')
            ? BigInt.from(json['executionNumber'])
            : null,
      );
}

/// Contains a summary of information about job executions for a specific job.
class JobExecutionSummaryForJob {
  /// The ARN of the thing on which the job execution is running.
  final String thingArn;

  /// Contains a subset of information about a job execution.
  final JobExecutionSummary jobExecutionSummary;

  JobExecutionSummaryForJob({
    this.thingArn,
    this.jobExecutionSummary,
  });
  static JobExecutionSummaryForJob fromJson(Map<String, dynamic> json) =>
      JobExecutionSummaryForJob(
        thingArn:
            json.containsKey('thingArn') ? json['thingArn'] as String : null,
        jobExecutionSummary: json.containsKey('jobExecutionSummary')
            ? JobExecutionSummary.fromJson(json['jobExecutionSummary'])
            : null,
      );
}

/// The job execution summary for a thing.
class JobExecutionSummaryForThing {
  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// Contains a subset of information about a job execution.
  final JobExecutionSummary jobExecutionSummary;

  JobExecutionSummaryForThing({
    this.jobId,
    this.jobExecutionSummary,
  });
  static JobExecutionSummaryForThing fromJson(Map<String, dynamic> json) =>
      JobExecutionSummaryForThing(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        jobExecutionSummary: json.containsKey('jobExecutionSummary')
            ? JobExecutionSummary.fromJson(json['jobExecutionSummary'])
            : null,
      );
}

/// Allows you to create a staged rollout of a job.
class JobExecutionsRolloutConfig {
  /// The maximum number of things that will be notified of a pending job, per
  /// minute. This parameter allows you to create a staged rollout.
  final int maximumPerMinute;

  /// The rate of increase for a job rollout. This parameter allows you to
  /// define an exponential rate for a job rollout.
  final ExponentialRolloutRate exponentialRate;

  JobExecutionsRolloutConfig({
    this.maximumPerMinute,
    this.exponentialRate,
  });
  static JobExecutionsRolloutConfig fromJson(Map<String, dynamic> json) =>
      JobExecutionsRolloutConfig(
        maximumPerMinute: json.containsKey('maximumPerMinute')
            ? json['maximumPerMinute'] as int
            : null,
        exponentialRate: json.containsKey('exponentialRate')
            ? ExponentialRolloutRate.fromJson(json['exponentialRate'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The job process details.
class JobProcessDetails {
  /// The target devices to which the job execution is being rolled out. This
  /// value will be null after the job execution has finished rolling out to all
  /// the target devices.
  final List<String> processingTargets;

  /// The number of things that cancelled the job.
  final int numberOfCanceledThings;

  /// The number of things which successfully completed the job.
  final int numberOfSucceededThings;

  /// The number of things that failed executing the job.
  final int numberOfFailedThings;

  /// The number of things that rejected the job.
  final int numberOfRejectedThings;

  /// The number of things that are awaiting execution of the job.
  final int numberOfQueuedThings;

  /// The number of things currently executing the job.
  final int numberOfInProgressThings;

  /// The number of things that are no longer scheduled to execute the job
  /// because they have been deleted or have been removed from the group that
  /// was a target of the job.
  final int numberOfRemovedThings;

  /// The number of things whose job execution status is `TIMED_OUT`.
  final int numberOfTimedOutThings;

  JobProcessDetails({
    this.processingTargets,
    this.numberOfCanceledThings,
    this.numberOfSucceededThings,
    this.numberOfFailedThings,
    this.numberOfRejectedThings,
    this.numberOfQueuedThings,
    this.numberOfInProgressThings,
    this.numberOfRemovedThings,
    this.numberOfTimedOutThings,
  });
  static JobProcessDetails fromJson(Map<String, dynamic> json) =>
      JobProcessDetails(
        processingTargets: json.containsKey('processingTargets')
            ? (json['processingTargets'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        numberOfCanceledThings: json.containsKey('numberOfCanceledThings')
            ? json['numberOfCanceledThings'] as int
            : null,
        numberOfSucceededThings: json.containsKey('numberOfSucceededThings')
            ? json['numberOfSucceededThings'] as int
            : null,
        numberOfFailedThings: json.containsKey('numberOfFailedThings')
            ? json['numberOfFailedThings'] as int
            : null,
        numberOfRejectedThings: json.containsKey('numberOfRejectedThings')
            ? json['numberOfRejectedThings'] as int
            : null,
        numberOfQueuedThings: json.containsKey('numberOfQueuedThings')
            ? json['numberOfQueuedThings'] as int
            : null,
        numberOfInProgressThings: json.containsKey('numberOfInProgressThings')
            ? json['numberOfInProgressThings'] as int
            : null,
        numberOfRemovedThings: json.containsKey('numberOfRemovedThings')
            ? json['numberOfRemovedThings'] as int
            : null,
        numberOfTimedOutThings: json.containsKey('numberOfTimedOutThings')
            ? json['numberOfTimedOutThings'] as int
            : null,
      );
}

/// The job summary.
class JobSummary {
  /// The job ARN.
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  final String jobId;

  /// The ID of the thing group.
  final String thingGroupId;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a thing
  /// when the thing is added to a target group, even after the job was
  /// completed by all things originally in the group.
  final String targetSelection;

  /// The job summary status.
  final String status;

  /// The time, in seconds since the epoch, when the job was created.
  final DateTime createdAt;

  /// The time, in seconds since the epoch, when the job was last updated.
  final DateTime lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job completed.
  final DateTime completedAt;

  JobSummary({
    this.jobArn,
    this.jobId,
    this.thingGroupId,
    this.targetSelection,
    this.status,
    this.createdAt,
    this.lastUpdatedAt,
    this.completedAt,
  });
  static JobSummary fromJson(Map<String, dynamic> json) => JobSummary(
        jobArn: json.containsKey('jobArn') ? json['jobArn'] as String : null,
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        thingGroupId: json.containsKey('thingGroupId')
            ? json['thingGroupId'] as String
            : null,
        targetSelection: json.containsKey('targetSelection')
            ? json['targetSelection'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        completedAt: json.containsKey('completedAt')
            ? DateTime.parse(json['completedAt'])
            : null,
      );
}

/// Describes a key pair.
class KeyPair {
  /// The public key.
  final String publicKey;

  /// The private key.
  final String privateKey;

  KeyPair({
    this.publicKey,
    this.privateKey,
  });
  static KeyPair fromJson(Map<String, dynamic> json) => KeyPair(
        publicKey:
            json.containsKey('PublicKey') ? json['PublicKey'] as String : null,
        privateKey: json.containsKey('PrivateKey')
            ? json['PrivateKey'] as String
            : null,
      );
}

/// Describes an action to write data to an Amazon Kinesis stream.
class KinesisAction {
  /// The ARN of the IAM role that grants access to the Amazon Kinesis stream.
  final String roleArn;

  /// The name of the Amazon Kinesis stream.
  final String streamName;

  /// The partition key.
  final String partitionKey;

  KinesisAction({
    @required this.roleArn,
    @required this.streamName,
    this.partitionKey,
  });
  static KinesisAction fromJson(Map<String, dynamic> json) => KinesisAction(
        roleArn: json['roleArn'] as String,
        streamName: json['streamName'] as String,
        partitionKey: json.containsKey('partitionKey')
            ? json['partitionKey'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to invoke a Lambda function.
class LambdaAction {
  /// The ARN of the Lambda function.
  final String functionArn;

  LambdaAction({
    @required this.functionArn,
  });
  static LambdaAction fromJson(Map<String, dynamic> json) => LambdaAction(
        functionArn: json['functionArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListActiveViolationsResponse {
  /// The list of active violations.
  final List<ActiveViolation> activeViolations;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListActiveViolationsResponse({
    this.activeViolations,
    this.nextToken,
  });
  static ListActiveViolationsResponse fromJson(Map<String, dynamic> json) =>
      ListActiveViolationsResponse(
        activeViolations: json.containsKey('activeViolations')
            ? (json['activeViolations'] as List)
                .map((e) => ActiveViolation.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListAttachedPoliciesResponse {
  /// The policies.
  final List<Policy> policies;

  /// The token to retrieve the next set of results, or ``null`` if there are no
  /// more results.
  final String nextMarker;

  ListAttachedPoliciesResponse({
    this.policies,
    this.nextMarker,
  });
  static ListAttachedPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListAttachedPoliciesResponse(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

class ListAuditFindingsResponse {
  /// The findings (results) of the audit.
  final List<AuditFinding> findings;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListAuditFindingsResponse({
    this.findings,
    this.nextToken,
  });
  static ListAuditFindingsResponse fromJson(Map<String, dynamic> json) =>
      ListAuditFindingsResponse(
        findings: json.containsKey('findings')
            ? (json['findings'] as List)
                .map((e) => AuditFinding.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListAuditMitigationActionsExecutionsResponse {
  /// A set of task execution results based on the input parameters. Details
  /// include the mitigation action applied, start time, and task status.
  final List<AuditMitigationActionExecutionMetadata> actionsExecutions;

  /// The token for the next set of results.
  final String nextToken;

  ListAuditMitigationActionsExecutionsResponse({
    this.actionsExecutions,
    this.nextToken,
  });
  static ListAuditMitigationActionsExecutionsResponse fromJson(
          Map<String, dynamic> json) =>
      ListAuditMitigationActionsExecutionsResponse(
        actionsExecutions: json.containsKey('actionsExecutions')
            ? (json['actionsExecutions'] as List)
                .map((e) => AuditMitigationActionExecutionMetadata.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListAuditMitigationActionsTasksResponse {
  /// The collection of audit mitigation tasks that matched the filter criteria.
  final List<AuditMitigationActionsTaskMetadata> tasks;

  /// The token for the next set of results.
  final String nextToken;

  ListAuditMitigationActionsTasksResponse({
    this.tasks,
    this.nextToken,
  });
  static ListAuditMitigationActionsTasksResponse fromJson(
          Map<String, dynamic> json) =>
      ListAuditMitigationActionsTasksResponse(
        tasks: json.containsKey('tasks')
            ? (json['tasks'] as List)
                .map((e) => AuditMitigationActionsTaskMetadata.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListAuditTasksResponse {
  /// The audits that were performed during the specified time period.
  final List<AuditTaskMetadata> tasks;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListAuditTasksResponse({
    this.tasks,
    this.nextToken,
  });
  static ListAuditTasksResponse fromJson(Map<String, dynamic> json) =>
      ListAuditTasksResponse(
        tasks: json.containsKey('tasks')
            ? (json['tasks'] as List)
                .map((e) => AuditTaskMetadata.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListAuthorizersResponse {
  /// The authorizers.
  final List<AuthorizerSummary> authorizers;

  /// A marker used to get the next set of results.
  final String nextMarker;

  ListAuthorizersResponse({
    this.authorizers,
    this.nextMarker,
  });
  static ListAuthorizersResponse fromJson(Map<String, dynamic> json) =>
      ListAuthorizersResponse(
        authorizers: json.containsKey('authorizers')
            ? (json['authorizers'] as List)
                .map((e) => AuthorizerSummary.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

class ListBillingGroupsResponse {
  /// The list of billing groups.
  final List<GroupNameAndArn> billingGroups;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListBillingGroupsResponse({
    this.billingGroups,
    this.nextToken,
  });
  static ListBillingGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListBillingGroupsResponse(
        billingGroups: json.containsKey('billingGroups')
            ? (json['billingGroups'] as List)
                .map((e) => GroupNameAndArn.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output from the ListCACertificates operation.
class ListCACertificatesResponse {
  /// The CA certificates registered in your AWS account.
  final List<CACertificate> certificates;

  /// The current position within the list of CA certificates.
  final String nextMarker;

  ListCACertificatesResponse({
    this.certificates,
    this.nextMarker,
  });
  static ListCACertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListCACertificatesResponse(
        certificates: json.containsKey('certificates')
            ? (json['certificates'] as List)
                .map((e) => CACertificate.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output of the ListCertificatesByCA operation.
class ListCertificatesByCAResponse {
  /// The device certificates signed by the specified CA certificate.
  final List<Certificate> certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String nextMarker;

  ListCertificatesByCAResponse({
    this.certificates,
    this.nextMarker,
  });
  static ListCertificatesByCAResponse fromJson(Map<String, dynamic> json) =>
      ListCertificatesByCAResponse(
        certificates: json.containsKey('certificates')
            ? (json['certificates'] as List)
                .map((e) => Certificate.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output of the ListCertificates operation.
class ListCertificatesResponse {
  /// The descriptions of the certificates.
  final List<Certificate> certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String nextMarker;

  ListCertificatesResponse({
    this.certificates,
    this.nextMarker,
  });
  static ListCertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListCertificatesResponse(
        certificates: json.containsKey('certificates')
            ? (json['certificates'] as List)
                .map((e) => Certificate.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

class ListIndicesResponse {
  /// The index names.
  final List<String> indexNames;

  /// The token used to get the next set of results, or null if there are no
  /// additional results.
  final String nextToken;

  ListIndicesResponse({
    this.indexNames,
    this.nextToken,
  });
  static ListIndicesResponse fromJson(Map<String, dynamic> json) =>
      ListIndicesResponse(
        indexNames: json.containsKey('indexNames')
            ? (json['indexNames'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListJobExecutionsForJobResponse {
  /// A list of job execution summaries.
  final List<JobExecutionSummaryForJob> executionSummaries;

  /// The token for the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListJobExecutionsForJobResponse({
    this.executionSummaries,
    this.nextToken,
  });
  static ListJobExecutionsForJobResponse fromJson(Map<String, dynamic> json) =>
      ListJobExecutionsForJobResponse(
        executionSummaries: json.containsKey('executionSummaries')
            ? (json['executionSummaries'] as List)
                .map((e) => JobExecutionSummaryForJob.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListJobExecutionsForThingResponse {
  /// A list of job execution summaries.
  final List<JobExecutionSummaryForThing> executionSummaries;

  /// The token for the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListJobExecutionsForThingResponse({
    this.executionSummaries,
    this.nextToken,
  });
  static ListJobExecutionsForThingResponse fromJson(
          Map<String, dynamic> json) =>
      ListJobExecutionsForThingResponse(
        executionSummaries: json.containsKey('executionSummaries')
            ? (json['executionSummaries'] as List)
                .map((e) => JobExecutionSummaryForThing.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListJobsResponse {
  /// A list of jobs.
  final List<JobSummary> jobs;

  /// The token for the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  static ListJobsResponse fromJson(Map<String, dynamic> json) =>
      ListJobsResponse(
        jobs: json.containsKey('jobs')
            ? (json['jobs'] as List).map((e) => JobSummary.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListMitigationActionsResponse {
  /// A set of actions that matched the specified filter criteria.
  final List<MitigationActionIdentifier> actionIdentifiers;

  /// The token for the next set of results.
  final String nextToken;

  ListMitigationActionsResponse({
    this.actionIdentifiers,
    this.nextToken,
  });
  static ListMitigationActionsResponse fromJson(Map<String, dynamic> json) =>
      ListMitigationActionsResponse(
        actionIdentifiers: json.containsKey('actionIdentifiers')
            ? (json['actionIdentifiers'] as List)
                .map((e) => MitigationActionIdentifier.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListOtaUpdatesResponse {
  /// A list of OTA update jobs.
  final List<OtaUpdateSummary> otaUpdates;

  /// A token to use to get the next set of results.
  final String nextToken;

  ListOtaUpdatesResponse({
    this.otaUpdates,
    this.nextToken,
  });
  static ListOtaUpdatesResponse fromJson(Map<String, dynamic> json) =>
      ListOtaUpdatesResponse(
        otaUpdates: json.containsKey('otaUpdates')
            ? (json['otaUpdates'] as List)
                .map((e) => OtaUpdateSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output from the ListOutgoingCertificates operation.
class ListOutgoingCertificatesResponse {
  /// The certificates that are being transferred but not yet accepted.
  final List<OutgoingCertificate> outgoingCertificates;

  /// The marker for the next set of results.
  final String nextMarker;

  ListOutgoingCertificatesResponse({
    this.outgoingCertificates,
    this.nextMarker,
  });
  static ListOutgoingCertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListOutgoingCertificatesResponse(
        outgoingCertificates: json.containsKey('outgoingCertificates')
            ? (json['outgoingCertificates'] as List)
                .map((e) => OutgoingCertificate.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output from the ListPolicies operation.
class ListPoliciesResponse {
  /// The descriptions of the policies.
  final List<Policy> policies;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String nextMarker;

  ListPoliciesResponse({
    this.policies,
    this.nextMarker,
  });
  static ListPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListPoliciesResponse(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output from the ListPolicyPrincipals operation.
class ListPolicyPrincipalsResponse {
  /// The descriptions of the principals.
  final List<String> principals;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String nextMarker;

  ListPolicyPrincipalsResponse({
    this.principals,
    this.nextMarker,
  });
  static ListPolicyPrincipalsResponse fromJson(Map<String, dynamic> json) =>
      ListPolicyPrincipalsResponse(
        principals: json.containsKey('principals')
            ? (json['principals'] as List).map((e) => e as String).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output from the ListPolicyVersions operation.
class ListPolicyVersionsResponse {
  /// The policy versions.
  final List<PolicyVersion> policyVersions;

  ListPolicyVersionsResponse({
    this.policyVersions,
  });
  static ListPolicyVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListPolicyVersionsResponse(
        policyVersions: json.containsKey('policyVersions')
            ? (json['policyVersions'] as List)
                .map((e) => PolicyVersion.fromJson(e))
                .toList()
            : null,
      );
}

/// The output from the ListPrincipalPolicies operation.
class ListPrincipalPoliciesResponse {
  /// The policies.
  final List<Policy> policies;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  final String nextMarker;

  ListPrincipalPoliciesResponse({
    this.policies,
    this.nextMarker,
  });
  static ListPrincipalPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListPrincipalPoliciesResponse(
        policies: json.containsKey('policies')
            ? (json['policies'] as List).map((e) => Policy.fromJson(e)).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

/// The output from the ListPrincipalThings operation.
class ListPrincipalThingsResponse {
  /// The things.
  final List<String> things;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListPrincipalThingsResponse({
    this.things,
    this.nextToken,
  });
  static ListPrincipalThingsResponse fromJson(Map<String, dynamic> json) =>
      ListPrincipalThingsResponse(
        things: json.containsKey('things')
            ? (json['things'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListRoleAliasesResponse {
  /// The role aliases.
  final List<String> roleAliases;

  /// A marker used to get the next set of results.
  final String nextMarker;

  ListRoleAliasesResponse({
    this.roleAliases,
    this.nextMarker,
  });
  static ListRoleAliasesResponse fromJson(Map<String, dynamic> json) =>
      ListRoleAliasesResponse(
        roleAliases: json.containsKey('roleAliases')
            ? (json['roleAliases'] as List).map((e) => e as String).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

class ListScheduledAuditsResponse {
  /// The list of scheduled audits.
  final List<ScheduledAuditMetadata> scheduledAudits;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListScheduledAuditsResponse({
    this.scheduledAudits,
    this.nextToken,
  });
  static ListScheduledAuditsResponse fromJson(Map<String, dynamic> json) =>
      ListScheduledAuditsResponse(
        scheduledAudits: json.containsKey('scheduledAudits')
            ? (json['scheduledAudits'] as List)
                .map((e) => ScheduledAuditMetadata.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListSecurityProfilesForTargetResponse {
  /// A list of security profiles and their associated targets.
  final List<SecurityProfileTargetMapping> securityProfileTargetMappings;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListSecurityProfilesForTargetResponse({
    this.securityProfileTargetMappings,
    this.nextToken,
  });
  static ListSecurityProfilesForTargetResponse fromJson(
          Map<String, dynamic> json) =>
      ListSecurityProfilesForTargetResponse(
        securityProfileTargetMappings:
            json.containsKey('securityProfileTargetMappings')
                ? (json['securityProfileTargetMappings'] as List)
                    .map((e) => SecurityProfileTargetMapping.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListSecurityProfilesResponse {
  /// A list of security profile identifiers (names and ARNs).
  final List<SecurityProfileIdentifier> securityProfileIdentifiers;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListSecurityProfilesResponse({
    this.securityProfileIdentifiers,
    this.nextToken,
  });
  static ListSecurityProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListSecurityProfilesResponse(
        securityProfileIdentifiers:
            json.containsKey('securityProfileIdentifiers')
                ? (json['securityProfileIdentifiers'] as List)
                    .map((e) => SecurityProfileIdentifier.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListStreamsResponse {
  /// A list of streams.
  final List<StreamSummary> streams;

  /// A token used to get the next set of results.
  final String nextToken;

  ListStreamsResponse({
    this.streams,
    this.nextToken,
  });
  static ListStreamsResponse fromJson(Map<String, dynamic> json) =>
      ListStreamsResponse(
        streams: json.containsKey('streams')
            ? (json['streams'] as List)
                .map((e) => StreamSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  final List<Tag> tags;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTargetsForPolicyResponse {
  /// The policy targets.
  final List<String> targets;

  /// A marker used to get the next set of results.
  final String nextMarker;

  ListTargetsForPolicyResponse({
    this.targets,
    this.nextMarker,
  });
  static ListTargetsForPolicyResponse fromJson(Map<String, dynamic> json) =>
      ListTargetsForPolicyResponse(
        targets: json.containsKey('targets')
            ? (json['targets'] as List).map((e) => e as String).toList()
            : null,
        nextMarker: json.containsKey('nextMarker')
            ? json['nextMarker'] as String
            : null,
      );
}

class ListTargetsForSecurityProfileResponse {
  /// The thing groups to which the security profile is attached.
  final List<SecurityProfileTarget> securityProfileTargets;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListTargetsForSecurityProfileResponse({
    this.securityProfileTargets,
    this.nextToken,
  });
  static ListTargetsForSecurityProfileResponse fromJson(
          Map<String, dynamic> json) =>
      ListTargetsForSecurityProfileResponse(
        securityProfileTargets: json.containsKey('securityProfileTargets')
            ? (json['securityProfileTargets'] as List)
                .map((e) => SecurityProfileTarget.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListThingGroupsForThingResponse {
  /// The thing groups.
  final List<GroupNameAndArn> thingGroups;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingGroupsForThingResponse({
    this.thingGroups,
    this.nextToken,
  });
  static ListThingGroupsForThingResponse fromJson(Map<String, dynamic> json) =>
      ListThingGroupsForThingResponse(
        thingGroups: json.containsKey('thingGroups')
            ? (json['thingGroups'] as List)
                .map((e) => GroupNameAndArn.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListThingGroupsResponse {
  /// The thing groups.
  final List<GroupNameAndArn> thingGroups;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingGroupsResponse({
    this.thingGroups,
    this.nextToken,
  });
  static ListThingGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListThingGroupsResponse(
        thingGroups: json.containsKey('thingGroups')
            ? (json['thingGroups'] as List)
                .map((e) => GroupNameAndArn.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output from the ListThingPrincipals operation.
class ListThingPrincipalsResponse {
  /// The principals associated with the thing.
  final List<String> principals;

  ListThingPrincipalsResponse({
    this.principals,
  });
  static ListThingPrincipalsResponse fromJson(Map<String, dynamic> json) =>
      ListThingPrincipalsResponse(
        principals: json.containsKey('principals')
            ? (json['principals'] as List).map((e) => e as String).toList()
            : null,
      );
}

class ListThingRegistrationTaskReportsResponse {
  /// Links to the task resources.
  final List<String> resourceLinks;

  /// The type of task report.
  final String reportType;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingRegistrationTaskReportsResponse({
    this.resourceLinks,
    this.reportType,
    this.nextToken,
  });
  static ListThingRegistrationTaskReportsResponse fromJson(
          Map<String, dynamic> json) =>
      ListThingRegistrationTaskReportsResponse(
        resourceLinks: json.containsKey('resourceLinks')
            ? (json['resourceLinks'] as List).map((e) => e as String).toList()
            : null,
        reportType: json.containsKey('reportType')
            ? json['reportType'] as String
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListThingRegistrationTasksResponse {
  /// A list of bulk thing provisioning task IDs.
  final List<String> taskIds;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingRegistrationTasksResponse({
    this.taskIds,
    this.nextToken,
  });
  static ListThingRegistrationTasksResponse fromJson(
          Map<String, dynamic> json) =>
      ListThingRegistrationTasksResponse(
        taskIds: json.containsKey('taskIds')
            ? (json['taskIds'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output for the ListThingTypes operation.
class ListThingTypesResponse {
  /// The thing types.
  final List<ThingTypeDefinition> thingTypes;

  /// The token for the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingTypesResponse({
    this.thingTypes,
    this.nextToken,
  });
  static ListThingTypesResponse fromJson(Map<String, dynamic> json) =>
      ListThingTypesResponse(
        thingTypes: json.containsKey('thingTypes')
            ? (json['thingTypes'] as List)
                .map((e) => ThingTypeDefinition.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListThingsInBillingGroupResponse {
  /// A list of things in the billing group.
  final List<String> things;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingsInBillingGroupResponse({
    this.things,
    this.nextToken,
  });
  static ListThingsInBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      ListThingsInBillingGroupResponse(
        things: json.containsKey('things')
            ? (json['things'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListThingsInThingGroupResponse {
  /// The things in the specified thing group.
  final List<String> things;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingsInThingGroupResponse({
    this.things,
    this.nextToken,
  });
  static ListThingsInThingGroupResponse fromJson(Map<String, dynamic> json) =>
      ListThingsInThingGroupResponse(
        things: json.containsKey('things')
            ? (json['things'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output from the ListThings operation.
class ListThingsResponse {
  /// The things.
  final List<ThingAttribute> things;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListThingsResponse({
    this.things,
    this.nextToken,
  });
  static ListThingsResponse fromJson(Map<String, dynamic> json) =>
      ListThingsResponse(
        things: json.containsKey('things')
            ? (json['things'] as List)
                .map((e) => ThingAttribute.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// The output from the ListTopicRules operation.
class ListTopicRulesResponse {
  /// The rules.
  final List<TopicRuleListItem> rules;

  /// A token used to retrieve the next value.
  final String nextToken;

  ListTopicRulesResponse({
    this.rules,
    this.nextToken,
  });
  static ListTopicRulesResponse fromJson(Map<String, dynamic> json) =>
      ListTopicRulesResponse(
        rules: json.containsKey('rules')
            ? (json['rules'] as List)
                .map((e) => TopicRuleListItem.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListV2LoggingLevelsResponse {
  /// The logging configuration for a target.
  final List<LogTargetConfiguration> logTargetConfigurations;

  /// The token used to get the next set of results, or **null** if there are no
  /// additional results.
  final String nextToken;

  ListV2LoggingLevelsResponse({
    this.logTargetConfigurations,
    this.nextToken,
  });
  static ListV2LoggingLevelsResponse fromJson(Map<String, dynamic> json) =>
      ListV2LoggingLevelsResponse(
        logTargetConfigurations: json.containsKey('logTargetConfigurations')
            ? (json['logTargetConfigurations'] as List)
                .map((e) => LogTargetConfiguration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListViolationEventsResponse {
  /// The security profile violation alerts issued for this account during the
  /// given time period, potentially filtered by security profile, behavior
  /// violated, or thing (device) violating.
  final List<ViolationEvent> violationEvents;

  /// A token that can be used to retrieve the next set of results, or `null` if
  /// there are no additional results.
  final String nextToken;

  ListViolationEventsResponse({
    this.violationEvents,
    this.nextToken,
  });
  static ListViolationEventsResponse fromJson(Map<String, dynamic> json) =>
      ListViolationEventsResponse(
        violationEvents: json.containsKey('violationEvents')
            ? (json['violationEvents'] as List)
                .map((e) => ViolationEvent.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// A log target.
class LogTarget {
  /// The target type.
  final String targetType;

  /// The target name.
  final String targetName;

  LogTarget({
    @required this.targetType,
    this.targetName,
  });
  static LogTarget fromJson(Map<String, dynamic> json) => LogTarget(
        targetType: json['targetType'] as String,
        targetName: json.containsKey('targetName')
            ? json['targetName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The target configuration.
class LogTargetConfiguration {
  /// A log target
  final LogTarget logTarget;

  /// The logging level.
  final String logLevel;

  LogTargetConfiguration({
    this.logTarget,
    this.logLevel,
  });
  static LogTargetConfiguration fromJson(Map<String, dynamic> json) =>
      LogTargetConfiguration(
        logTarget: json.containsKey('logTarget')
            ? LogTarget.fromJson(json['logTarget'])
            : null,
        logLevel:
            json.containsKey('logLevel') ? json['logLevel'] as String : null,
      );
}

/// Describes the logging options payload.
class LoggingOptionsPayload {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The log level.
  final String logLevel;

  LoggingOptionsPayload({
    @required this.roleArn,
    this.logLevel,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The value to be compared with the `metric`.
class MetricValue {
  /// If the `comparisonOperator` calls for a numeric value, use this to specify
  /// that numeric value to be compared with the `metric`.
  final BigInt count;

  /// If the `comparisonOperator` calls for a set of CIDRs, use this to specify
  /// that set to be compared with the `metric`.
  final List<String> cidrs;

  /// If the `comparisonOperator` calls for a set of ports, use this to specify
  /// that set to be compared with the `metric`.
  final List<int> ports;

  MetricValue({
    this.count,
    this.cidrs,
    this.ports,
  });
  static MetricValue fromJson(Map<String, dynamic> json) => MetricValue(
        count: json.containsKey('count') ? BigInt.from(json['count']) : null,
        cidrs: json.containsKey('cidrs')
            ? (json['cidrs'] as List).map((e) => e as String).toList()
            : null,
        ports: json.containsKey('ports')
            ? (json['ports'] as List).map((e) => e as int).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes which changes should be applied as part of a mitigation action.
class MitigationAction {
  /// A user-friendly name for the mitigation action.
  final String name;

  /// A unique identifier for the mitigation action.
  final String id;

  /// The IAM role ARN used to apply this mitigation action.
  final String roleArn;

  /// The set of parameters for this mitigation action. The parameters vary,
  /// depending on the kind of action you apply.
  final MitigationActionParams actionParams;

  MitigationAction({
    this.name,
    this.id,
    this.roleArn,
    this.actionParams,
  });
  static MitigationAction fromJson(Map<String, dynamic> json) =>
      MitigationAction(
        name: json.containsKey('name') ? json['name'] as String : null,
        id: json.containsKey('id') ? json['id'] as String : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        actionParams: json.containsKey('actionParams')
            ? MitigationActionParams.fromJson(json['actionParams'])
            : null,
      );
}

/// Information that identifies a mitigation action. This information is
/// returned by ListMitigationActions.
class MitigationActionIdentifier {
  /// The friendly name of the mitigation action.
  final String actionName;

  /// The IAM role ARN used to apply this mitigation action.
  final String actionArn;

  /// The date when this mitigation action was created.
  final DateTime creationDate;

  MitigationActionIdentifier({
    this.actionName,
    this.actionArn,
    this.creationDate,
  });
  static MitigationActionIdentifier fromJson(Map<String, dynamic> json) =>
      MitigationActionIdentifier(
        actionName: json.containsKey('actionName')
            ? json['actionName'] as String
            : null,
        actionArn:
            json.containsKey('actionArn') ? json['actionArn'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// The set of parameters for this mitigation action. You can specify only one
/// type of parameter (in other words, you can apply only one action for each
/// defined mitigation action).
class MitigationActionParams {
  /// Parameters to define a mitigation action that changes the state of the
  /// device certificate to inactive.
  final UpdateDeviceCertificateParams updateDeviceCertificateParams;

  /// Parameters to define a mitigation action that changes the state of the CA
  /// certificate to inactive.
  final UpdateCACertificateParams updateCACertificateParams;

  /// Parameters to define a mitigation action that moves devices associated
  /// with a certificate to one or more specified thing groups, typically for
  /// quarantine.
  final AddThingsToThingGroupParams addThingsToThingGroupParams;

  /// Parameters to define a mitigation action that adds a blank policy to
  /// restrict permissions.
  final ReplaceDefaultPolicyVersionParams replaceDefaultPolicyVersionParams;

  /// Parameters to define a mitigation action that enables AWS IoT logging at a
  /// specified level of detail.
  final EnableIotLoggingParams enableIotLoggingParams;

  /// Parameters to define a mitigation action that publishes findings to Amazon
  /// SNS. You can implement your own custom actions in response to the Amazon
  /// SNS messages.
  final PublishFindingToSnsParams publishFindingToSnsParams;

  MitigationActionParams({
    this.updateDeviceCertificateParams,
    this.updateCACertificateParams,
    this.addThingsToThingGroupParams,
    this.replaceDefaultPolicyVersionParams,
    this.enableIotLoggingParams,
    this.publishFindingToSnsParams,
  });
  static MitigationActionParams fromJson(Map<String, dynamic> json) =>
      MitigationActionParams(
        updateDeviceCertificateParams:
            json.containsKey('updateDeviceCertificateParams')
                ? UpdateDeviceCertificateParams.fromJson(
                    json['updateDeviceCertificateParams'])
                : null,
        updateCACertificateParams: json.containsKey('updateCACertificateParams')
            ? UpdateCACertificateParams.fromJson(
                json['updateCACertificateParams'])
            : null,
        addThingsToThingGroupParams:
            json.containsKey('addThingsToThingGroupParams')
                ? AddThingsToThingGroupParams.fromJson(
                    json['addThingsToThingGroupParams'])
                : null,
        replaceDefaultPolicyVersionParams:
            json.containsKey('replaceDefaultPolicyVersionParams')
                ? ReplaceDefaultPolicyVersionParams.fromJson(
                    json['replaceDefaultPolicyVersionParams'])
                : null,
        enableIotLoggingParams: json.containsKey('enableIoTLoggingParams')
            ? EnableIotLoggingParams.fromJson(json['enableIoTLoggingParams'])
            : null,
        publishFindingToSnsParams: json.containsKey('publishFindingToSnsParams')
            ? PublishFindingToSnsParams.fromJson(
                json['publishFindingToSnsParams'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the resource that was noncompliant with the audit check.
class NonCompliantResource {
  /// The type of the noncompliant resource.
  final String resourceType;

  /// Information that identifies the noncompliant resource.
  final ResourceIdentifier resourceIdentifier;

  /// Other information about the noncompliant resource.
  final Map<String, String> additionalInfo;

  NonCompliantResource({
    this.resourceType,
    this.resourceIdentifier,
    this.additionalInfo,
  });
  static NonCompliantResource fromJson(Map<String, dynamic> json) =>
      NonCompliantResource(
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceIdentifier: json.containsKey('resourceIdentifier')
            ? ResourceIdentifier.fromJson(json['resourceIdentifier'])
            : null,
        additionalInfo: json.containsKey('additionalInfo')
            ? (json['additionalInfo'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Describes a file to be associated with an OTA update.
class OtaUpdateFile {
  /// The name of the file.
  final String fileName;

  /// The file version.
  final String fileVersion;

  /// The location of the updated firmware.
  final FileLocation fileLocation;

  /// The code signing method of the file.
  final CodeSigning codeSigning;

  /// A list of name/attribute pairs.
  final Map<String, String> attributes;

  OtaUpdateFile({
    this.fileName,
    this.fileVersion,
    this.fileLocation,
    this.codeSigning,
    this.attributes,
  });
  static OtaUpdateFile fromJson(Map<String, dynamic> json) => OtaUpdateFile(
        fileName:
            json.containsKey('fileName') ? json['fileName'] as String : null,
        fileVersion: json.containsKey('fileVersion')
            ? json['fileVersion'] as String
            : null,
        fileLocation: json.containsKey('fileLocation')
            ? FileLocation.fromJson(json['fileLocation'])
            : null,
        codeSigning: json.containsKey('codeSigning')
            ? CodeSigning.fromJson(json['codeSigning'])
            : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about an OTA update.
class OtaUpdateInfo {
  /// The OTA update ID.
  final String otaUpdateId;

  /// The OTA update ARN.
  final String otaUpdateArn;

  /// The date when the OTA update was created.
  final DateTime creationDate;

  /// The date when the OTA update was last updated.
  final DateTime lastModifiedDate;

  /// A description of the OTA update.
  final String description;

  /// The targets of the OTA update.
  final List<String> targets;

  /// Configuration for the rollout of OTA updates.
  final AwsJobExecutionsRolloutConfig awsJobExecutionsRolloutConfig;

  /// Specifies whether the OTA update will continue to run (CONTINUOUS), or
  /// will be complete after all those things specified as targets have
  /// completed the OTA update (SNAPSHOT). If continuous, the OTA update may
  /// also be run on a thing when a change is detected in a target. For example,
  /// an OTA update will run on a thing when the thing is added to a target
  /// group, even after the OTA update was completed by all things originally in
  /// the group.
  final String targetSelection;

  /// A list of files associated with the OTA update.
  final List<OtaUpdateFile> otaUpdateFiles;

  /// The status of the OTA update.
  final String otaUpdateStatus;

  /// The AWS IoT job ID associated with the OTA update.
  final String awsIotJobId;

  /// The AWS IoT job ARN associated with the OTA update.
  final String awsIotJobArn;

  /// Error information associated with the OTA update.
  final ErrorInfo errorInfo;

  /// A collection of name/value pairs
  final Map<String, String> additionalParameters;

  OtaUpdateInfo({
    this.otaUpdateId,
    this.otaUpdateArn,
    this.creationDate,
    this.lastModifiedDate,
    this.description,
    this.targets,
    this.awsJobExecutionsRolloutConfig,
    this.targetSelection,
    this.otaUpdateFiles,
    this.otaUpdateStatus,
    this.awsIotJobId,
    this.awsIotJobArn,
    this.errorInfo,
    this.additionalParameters,
  });
  static OtaUpdateInfo fromJson(Map<String, dynamic> json) => OtaUpdateInfo(
        otaUpdateId: json.containsKey('otaUpdateId')
            ? json['otaUpdateId'] as String
            : null,
        otaUpdateArn: json.containsKey('otaUpdateArn')
            ? json['otaUpdateArn'] as String
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        targets: json.containsKey('targets')
            ? (json['targets'] as List).map((e) => e as String).toList()
            : null,
        awsJobExecutionsRolloutConfig:
            json.containsKey('awsJobExecutionsRolloutConfig')
                ? AwsJobExecutionsRolloutConfig.fromJson(
                    json['awsJobExecutionsRolloutConfig'])
                : null,
        targetSelection: json.containsKey('targetSelection')
            ? json['targetSelection'] as String
            : null,
        otaUpdateFiles: json.containsKey('otaUpdateFiles')
            ? (json['otaUpdateFiles'] as List)
                .map((e) => OtaUpdateFile.fromJson(e))
                .toList()
            : null,
        otaUpdateStatus: json.containsKey('otaUpdateStatus')
            ? json['otaUpdateStatus'] as String
            : null,
        awsIotJobId: json.containsKey('awsIotJobId')
            ? json['awsIotJobId'] as String
            : null,
        awsIotJobArn: json.containsKey('awsIotJobArn')
            ? json['awsIotJobArn'] as String
            : null,
        errorInfo: json.containsKey('errorInfo')
            ? ErrorInfo.fromJson(json['errorInfo'])
            : null,
        additionalParameters: json.containsKey('additionalParameters')
            ? (json['additionalParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// An OTA update summary.
class OtaUpdateSummary {
  /// The OTA update ID.
  final String otaUpdateId;

  /// The OTA update ARN.
  final String otaUpdateArn;

  /// The date when the OTA update was created.
  final DateTime creationDate;

  OtaUpdateSummary({
    this.otaUpdateId,
    this.otaUpdateArn,
    this.creationDate,
  });
  static OtaUpdateSummary fromJson(Map<String, dynamic> json) =>
      OtaUpdateSummary(
        otaUpdateId: json.containsKey('otaUpdateId')
            ? json['otaUpdateId'] as String
            : null,
        otaUpdateArn: json.containsKey('otaUpdateArn')
            ? json['otaUpdateArn'] as String
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// A certificate that has been transferred but not yet accepted.
class OutgoingCertificate {
  /// The certificate ARN.
  final String certificateArn;

  /// The certificate ID.
  final String certificateId;

  /// The AWS account to which the transfer was made.
  final String transferredTo;

  /// The date the transfer was initiated.
  final DateTime transferDate;

  /// The transfer message.
  final String transferMessage;

  /// The certificate creation date.
  final DateTime creationDate;

  OutgoingCertificate({
    this.certificateArn,
    this.certificateId,
    this.transferredTo,
    this.transferDate,
    this.transferMessage,
    this.creationDate,
  });
  static OutgoingCertificate fromJson(Map<String, dynamic> json) =>
      OutgoingCertificate(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
        transferredTo: json.containsKey('transferredTo')
            ? json['transferredTo'] as String
            : null,
        transferDate: json.containsKey('transferDate')
            ? DateTime.parse(json['transferDate'])
            : null,
        transferMessage: json.containsKey('transferMessage')
            ? json['transferMessage'] as String
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// Describes an AWS IoT policy.
class Policy {
  /// The policy name.
  final String policyName;

  /// The policy ARN.
  final String policyArn;

  Policy({
    this.policyName,
    this.policyArn,
  });
  static Policy fromJson(Map<String, dynamic> json) => Policy(
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyArn:
            json.containsKey('policyArn') ? json['policyArn'] as String : null,
      );
}

/// Describes a policy version.
class PolicyVersion {
  /// The policy version ID.
  final String versionId;

  /// Specifies whether the policy version is the default.
  final bool isDefaultVersion;

  /// The date and time the policy was created.
  final DateTime createDate;

  PolicyVersion({
    this.versionId,
    this.isDefaultVersion,
    this.createDate,
  });
  static PolicyVersion fromJson(Map<String, dynamic> json) => PolicyVersion(
        versionId:
            json.containsKey('versionId') ? json['versionId'] as String : null,
        isDefaultVersion: json.containsKey('isDefaultVersion')
            ? json['isDefaultVersion'] as bool
            : null,
        createDate: json.containsKey('createDate')
            ? DateTime.parse(json['createDate'])
            : null,
      );
}

/// Information about the version of the policy associated with the resource.
class PolicyVersionIdentifier {
  /// The name of the policy.
  final String policyName;

  /// The ID of the version of the policy associated with the resource.
  final String policyVersionId;

  PolicyVersionIdentifier({
    this.policyName,
    this.policyVersionId,
  });
  static PolicyVersionIdentifier fromJson(Map<String, dynamic> json) =>
      PolicyVersionIdentifier(
        policyName: json.containsKey('policyName')
            ? json['policyName'] as String
            : null,
        policyVersionId: json.containsKey('policyVersionId')
            ? json['policyVersionId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configuration for pre-signed S3 URLs.
class PresignedUrlConfig {
  /// The ARN of an IAM role that grants grants permission to download files
  /// from the S3 bucket where the job data/updates are stored. The role must
  /// also grant permission for IoT to download the files.
  final String roleArn;

  /// How long (in seconds) pre-signed URLs are valid. Valid values are 60 -
  /// 3600, the default value is 3600 seconds. Pre-signed URLs are generated
  /// when Jobs receives an MQTT request for the job document.
  final BigInt expiresInSec;

  PresignedUrlConfig({
    this.roleArn,
    this.expiresInSec,
  });
  static PresignedUrlConfig fromJson(Map<String, dynamic> json) =>
      PresignedUrlConfig(
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        expiresInSec: json.containsKey('expiresInSec')
            ? BigInt.from(json['expiresInSec'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Parameters to define a mitigation action that publishes findings to Amazon
/// SNS. You can implement your own custom actions in response to the Amazon SNS
/// messages.
class PublishFindingToSnsParams {
  /// The ARN of the topic to which you want to publish the findings.
  final String topicArn;

  PublishFindingToSnsParams({
    @required this.topicArn,
  });
  static PublishFindingToSnsParams fromJson(Map<String, dynamic> json) =>
      PublishFindingToSnsParams(
        topicArn: json['topicArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The input for the DynamoActionVS action that specifies the DynamoDB table to
/// which the message data will be written.
class PutItemInput {
  /// The table where the message data will be written.
  final String tableName;

  PutItemInput({
    @required this.tableName,
  });
  static PutItemInput fromJson(Map<String, dynamic> json) => PutItemInput(
        tableName: json['tableName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Allows you to define a criteria to initiate the increase in rate of rollout
/// for a job.
class RateIncreaseCriteria {
  /// The threshold for number of notified things that will initiate the
  /// increase in rate of rollout.
  final int numberOfNotifiedThings;

  /// The threshold for number of succeeded things that will initiate the
  /// increase in rate of rollout.
  final int numberOfSucceededThings;

  RateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });
  static RateIncreaseCriteria fromJson(Map<String, dynamic> json) =>
      RateIncreaseCriteria(
        numberOfNotifiedThings: json.containsKey('numberOfNotifiedThings')
            ? json['numberOfNotifiedThings'] as int
            : null,
        numberOfSucceededThings: json.containsKey('numberOfSucceededThings')
            ? json['numberOfSucceededThings'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The output from the RegisterCACertificateResponse operation.
class RegisterCACertificateResponse {
  /// The CA certificate ARN.
  final String certificateArn;

  /// The CA certificate identifier.
  final String certificateId;

  RegisterCACertificateResponse({
    this.certificateArn,
    this.certificateId,
  });
  static RegisterCACertificateResponse fromJson(Map<String, dynamic> json) =>
      RegisterCACertificateResponse(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
      );
}

/// The output from the RegisterCertificate operation.
class RegisterCertificateResponse {
  /// The certificate ARN.
  final String certificateArn;

  /// The certificate identifier.
  final String certificateId;

  RegisterCertificateResponse({
    this.certificateArn,
    this.certificateId,
  });
  static RegisterCertificateResponse fromJson(Map<String, dynamic> json) =>
      RegisterCertificateResponse(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        certificateId: json.containsKey('certificateId')
            ? json['certificateId'] as String
            : null,
      );
}

class RegisterThingResponse {
  /// .
  final String certificatePem;

  /// ARNs for the generated resources.
  final Map<String, String> resourceArns;

  RegisterThingResponse({
    this.certificatePem,
    this.resourceArns,
  });
  static RegisterThingResponse fromJson(Map<String, dynamic> json) =>
      RegisterThingResponse(
        certificatePem: json.containsKey('certificatePem')
            ? json['certificatePem'] as String
            : null,
        resourceArns: json.containsKey('resourceArns')
            ? (json['resourceArns'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The registration configuration.
class RegistrationConfig {
  /// The template body.
  final String templateBody;

  /// The ARN of the role.
  final String roleArn;

  RegistrationConfig({
    this.templateBody,
    this.roleArn,
  });
  static RegistrationConfig fromJson(Map<String, dynamic> json) =>
      RegistrationConfig(
        templateBody: json.containsKey('templateBody')
            ? json['templateBody'] as String
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a related resource.
class RelatedResource {
  /// The type of resource.
  final String resourceType;

  /// Information that identifies the resource.
  final ResourceIdentifier resourceIdentifier;

  /// Other information about the resource.
  final Map<String, String> additionalInfo;

  RelatedResource({
    this.resourceType,
    this.resourceIdentifier,
    this.additionalInfo,
  });
  static RelatedResource fromJson(Map<String, dynamic> json) => RelatedResource(
        resourceType: json.containsKey('resourceType')
            ? json['resourceType'] as String
            : null,
        resourceIdentifier: json.containsKey('resourceIdentifier')
            ? ResourceIdentifier.fromJson(json['resourceIdentifier'])
            : null,
        additionalInfo: json.containsKey('additionalInfo')
            ? (json['additionalInfo'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class RemoveThingFromBillingGroupResponse {
  RemoveThingFromBillingGroupResponse();
  static RemoveThingFromBillingGroupResponse fromJson(
          Map<String, dynamic> json) =>
      RemoveThingFromBillingGroupResponse();
}

class RemoveThingFromThingGroupResponse {
  RemoveThingFromThingGroupResponse();
  static RemoveThingFromThingGroupResponse fromJson(
          Map<String, dynamic> json) =>
      RemoveThingFromThingGroupResponse();
}

/// Parameters to define a mitigation action that adds a blank policy to
/// restrict permissions.
class ReplaceDefaultPolicyVersionParams {
  /// The name of the template to be applied. The only supported value is
  /// `BLANK_POLICY`.
  final String templateName;

  ReplaceDefaultPolicyVersionParams({
    @required this.templateName,
  });
  static ReplaceDefaultPolicyVersionParams fromJson(
          Map<String, dynamic> json) =>
      ReplaceDefaultPolicyVersionParams(
        templateName: json['templateName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to republish to another topic.
class RepublishAction {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The name of the MQTT topic.
  final String topic;

  /// The Quality of Service (QoS) level to use when republishing messages.
  final int qos;

  RepublishAction({
    @required this.roleArn,
    @required this.topic,
    this.qos,
  });
  static RepublishAction fromJson(Map<String, dynamic> json) => RepublishAction(
        roleArn: json['roleArn'] as String,
        topic: json['topic'] as String,
        qos: json.containsKey('qos') ? json['qos'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information that identifies the noncompliant resource.
class ResourceIdentifier {
  /// The ID of the certificate attached to the resource.
  final String deviceCertificateId;

  /// The ID of the CA certificate used to authorize the certificate.
  final String caCertificateId;

  /// The ID of the Amazon Cognito identity pool.
  final String cognitoIdentityPoolId;

  /// The client ID.
  final String clientId;

  /// The version of the policy associated with the resource.
  final PolicyVersionIdentifier policyVersionIdentifier;

  /// The account with which the resource is associated.
  final String account;

  ResourceIdentifier({
    this.deviceCertificateId,
    this.caCertificateId,
    this.cognitoIdentityPoolId,
    this.clientId,
    this.policyVersionIdentifier,
    this.account,
  });
  static ResourceIdentifier fromJson(Map<String, dynamic> json) =>
      ResourceIdentifier(
        deviceCertificateId: json.containsKey('deviceCertificateId')
            ? json['deviceCertificateId'] as String
            : null,
        caCertificateId: json.containsKey('caCertificateId')
            ? json['caCertificateId'] as String
            : null,
        cognitoIdentityPoolId: json.containsKey('cognitoIdentityPoolId')
            ? json['cognitoIdentityPoolId'] as String
            : null,
        clientId:
            json.containsKey('clientId') ? json['clientId'] as String : null,
        policyVersionIdentifier: json.containsKey('policyVersionIdentifier')
            ? PolicyVersionIdentifier.fromJson(json['policyVersionIdentifier'])
            : null,
        account: json.containsKey('account') ? json['account'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Role alias description.
class RoleAliasDescription {
  /// The role alias.
  final String roleAlias;

  /// The ARN of the role alias.
  final String roleAliasArn;

  /// The role ARN.
  final String roleArn;

  /// The role alias owner.
  final String owner;

  /// The number of seconds for which the credential is valid.
  final int credentialDurationSeconds;

  /// The UNIX timestamp of when the role alias was created.
  final DateTime creationDate;

  /// The UNIX timestamp of when the role alias was last modified.
  final DateTime lastModifiedDate;

  RoleAliasDescription({
    this.roleAlias,
    this.roleAliasArn,
    this.roleArn,
    this.owner,
    this.credentialDurationSeconds,
    this.creationDate,
    this.lastModifiedDate,
  });
  static RoleAliasDescription fromJson(Map<String, dynamic> json) =>
      RoleAliasDescription(
        roleAlias:
            json.containsKey('roleAlias') ? json['roleAlias'] as String : null,
        roleAliasArn: json.containsKey('roleAliasArn')
            ? json['roleAliasArn'] as String
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        owner: json.containsKey('owner') ? json['owner'] as String : null,
        credentialDurationSeconds: json.containsKey('credentialDurationSeconds')
            ? json['credentialDurationSeconds'] as int
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

/// Describes an action to write data to an Amazon S3 bucket.
class S3Action {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The Amazon S3 bucket.
  final String bucketName;

  /// The object key.
  final String key;

  /// The Amazon S3 canned ACL that controls access to the object identified by
  /// the object key. For more information, see
  /// [S3 canned ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl).
  final String cannedAcl;

  S3Action({
    @required this.roleArn,
    @required this.bucketName,
    @required this.key,
    this.cannedAcl,
  });
  static S3Action fromJson(Map<String, dynamic> json) => S3Action(
        roleArn: json['roleArn'] as String,
        bucketName: json['bucketName'] as String,
        key: json['key'] as String,
        cannedAcl:
            json.containsKey('cannedAcl') ? json['cannedAcl'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the location of updated firmware in S3.
class S3Destination {
  /// The S3 bucket that contains the updated firmware.
  final String bucket;

  /// The S3 prefix.
  final String prefix;

  S3Destination({
    this.bucket,
    this.prefix,
  });
  static S3Destination fromJson(Map<String, dynamic> json) => S3Destination(
        bucket: json.containsKey('bucket') ? json['bucket'] as String : null,
        prefix: json.containsKey('prefix') ? json['prefix'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The S3 location.
class S3Location {
  /// The S3 bucket.
  final String bucket;

  /// The S3 key.
  final String key;

  /// The S3 bucket version.
  final String version;

  S3Location({
    this.bucket,
    this.key,
    this.version,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location(
        bucket: json.containsKey('bucket') ? json['bucket'] as String : null,
        key: json.containsKey('key') ? json['key'] as String : null,
        version: json.containsKey('version') ? json['version'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to write a message to a Salesforce IoT Cloud Input
/// Stream.
class SalesforceAction {
  /// The token used to authenticate access to the Salesforce IoT Cloud Input
  /// Stream. The token is available from the Salesforce IoT Cloud platform
  /// after creation of the Input Stream.
  final String token;

  /// The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is
  /// available from the Salesforce IoT Cloud platform after creation of the
  /// Input Stream.
  final String url;

  SalesforceAction({
    @required this.token,
    @required this.url,
  });
  static SalesforceAction fromJson(Map<String, dynamic> json) =>
      SalesforceAction(
        token: json['token'] as String,
        url: json['url'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the scheduled audit.
class ScheduledAuditMetadata {
  /// The name of the scheduled audit.
  final String scheduledAuditName;

  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  /// How often the scheduled audit occurs.
  final String frequency;

  /// The day of the month on which the scheduled audit is run (if the
  /// `frequency` is "MONTHLY"). If days 29-31 are specified, and the month does
  /// not have that many days, the audit takes place on the "LAST" day of the
  /// month.
  final String dayOfMonth;

  /// The day of the week on which the scheduled audit is run (if the
  /// `frequency` is "WEEKLY" or "BIWEEKLY").
  final String dayOfWeek;

  ScheduledAuditMetadata({
    this.scheduledAuditName,
    this.scheduledAuditArn,
    this.frequency,
    this.dayOfMonth,
    this.dayOfWeek,
  });
  static ScheduledAuditMetadata fromJson(Map<String, dynamic> json) =>
      ScheduledAuditMetadata(
        scheduledAuditName: json.containsKey('scheduledAuditName')
            ? json['scheduledAuditName'] as String
            : null,
        scheduledAuditArn: json.containsKey('scheduledAuditArn')
            ? json['scheduledAuditArn'] as String
            : null,
        frequency:
            json.containsKey('frequency') ? json['frequency'] as String : null,
        dayOfMonth: json.containsKey('dayOfMonth')
            ? json['dayOfMonth'] as String
            : null,
        dayOfWeek:
            json.containsKey('dayOfWeek') ? json['dayOfWeek'] as String : null,
      );
}

class SearchIndexResponse {
  /// The token used to get the next set of results, or null if there are no
  /// additional results.
  final String nextToken;

  /// The things that match the search query.
  final List<ThingDocument> things;

  /// The thing groups that match the search query.
  final List<ThingGroupDocument> thingGroups;

  SearchIndexResponse({
    this.nextToken,
    this.things,
    this.thingGroups,
  });
  static SearchIndexResponse fromJson(Map<String, dynamic> json) =>
      SearchIndexResponse(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        things: json.containsKey('things')
            ? (json['things'] as List)
                .map((e) => ThingDocument.fromJson(e))
                .toList()
            : null,
        thingGroups: json.containsKey('thingGroups')
            ? (json['thingGroups'] as List)
                .map((e) => ThingGroupDocument.fromJson(e))
                .toList()
            : null,
      );
}

/// Identifying information for a Device Defender security profile.
class SecurityProfileIdentifier {
  /// The name you have given to the security profile.
  final String name;

  /// The ARN of the security profile.
  final String arn;

  SecurityProfileIdentifier({
    @required this.name,
    @required this.arn,
  });
  static SecurityProfileIdentifier fromJson(Map<String, dynamic> json) =>
      SecurityProfileIdentifier(
        name: json['name'] as String,
        arn: json['arn'] as String,
      );
}

/// A target to which an alert is sent when a security profile behavior is
/// violated.
class SecurityProfileTarget {
  /// The ARN of the security profile.
  final String arn;

  SecurityProfileTarget({
    @required this.arn,
  });
  static SecurityProfileTarget fromJson(Map<String, dynamic> json) =>
      SecurityProfileTarget(
        arn: json['arn'] as String,
      );
}

/// Information about a security profile and the target associated with it.
class SecurityProfileTargetMapping {
  /// Information that identifies the security profile.
  final SecurityProfileIdentifier securityProfileIdentifier;

  /// Information about the target (thing group) associated with the security
  /// profile.
  final SecurityProfileTarget target;

  SecurityProfileTargetMapping({
    this.securityProfileIdentifier,
    this.target,
  });
  static SecurityProfileTargetMapping fromJson(Map<String, dynamic> json) =>
      SecurityProfileTargetMapping(
        securityProfileIdentifier: json.containsKey('securityProfileIdentifier')
            ? SecurityProfileIdentifier.fromJson(
                json['securityProfileIdentifier'])
            : null,
        target: json.containsKey('target')
            ? SecurityProfileTarget.fromJson(json['target'])
            : null,
      );
}

class SetDefaultAuthorizerResponse {
  /// The authorizer name.
  final String authorizerName;

  /// The authorizer ARN.
  final String authorizerArn;

  SetDefaultAuthorizerResponse({
    this.authorizerName,
    this.authorizerArn,
  });
  static SetDefaultAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      SetDefaultAuthorizerResponse(
        authorizerName: json.containsKey('authorizerName')
            ? json['authorizerName'] as String
            : null,
        authorizerArn: json.containsKey('authorizerArn')
            ? json['authorizerArn'] as String
            : null,
      );
}

/// Describes the code-signing profile.
class SigningProfileParameter {
  /// Certificate ARN.
  final String certificateArn;

  /// The hardware platform of your device.
  final String platform;

  /// The location of the code-signing certificate on your device.
  final String certificatePathOnDevice;

  SigningProfileParameter({
    this.certificateArn,
    this.platform,
    this.certificatePathOnDevice,
  });
  static SigningProfileParameter fromJson(Map<String, dynamic> json) =>
      SigningProfileParameter(
        certificateArn: json.containsKey('certificateArn')
            ? json['certificateArn'] as String
            : null,
        platform:
            json.containsKey('platform') ? json['platform'] as String : null,
        certificatePathOnDevice: json.containsKey('certificatePathOnDevice')
            ? json['certificatePathOnDevice'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to publish to an Amazon SNS topic.
class SnsAction {
  /// The ARN of the SNS topic.
  final String targetArn;

  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// (Optional) The message format of the message to publish. Accepted values
  /// are "JSON" and "RAW". The default value of the attribute is "RAW". SNS
  /// uses this setting to determine if the payload should be parsed and
  /// relevant platform-specific bits of the payload should be extracted. To
  /// read more about SNS message formats, see
  /// [https://docs.aws.amazon.com/sns/latest/dg/json-formats.html](https://docs.aws.amazon.com/sns/latest/dg/json-formats.html)
  /// refer to their official documentation.
  final String messageFormat;

  SnsAction({
    @required this.targetArn,
    @required this.roleArn,
    this.messageFormat,
  });
  static SnsAction fromJson(Map<String, dynamic> json) => SnsAction(
        targetArn: json['targetArn'] as String,
        roleArn: json['roleArn'] as String,
        messageFormat: json.containsKey('messageFormat')
            ? json['messageFormat'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an action to publish data to an Amazon SQS queue.
class SqsAction {
  /// The ARN of the IAM role that grants access.
  final String roleArn;

  /// The URL of the Amazon SQS queue.
  final String queueUrl;

  /// Specifies whether to use Base64 encoding.
  final bool useBase64;

  SqsAction({
    @required this.roleArn,
    @required this.queueUrl,
    this.useBase64,
  });
  static SqsAction fromJson(Map<String, dynamic> json) => SqsAction(
        roleArn: json['roleArn'] as String,
        queueUrl: json['queueUrl'] as String,
        useBase64:
            json.containsKey('useBase64') ? json['useBase64'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartAuditMitigationActionsTaskResponse {
  /// The unique identifier for the audit mitigation task. This matches the
  /// `taskId` that you specified in the request.
  final String taskId;

  StartAuditMitigationActionsTaskResponse({
    this.taskId,
  });
  static StartAuditMitigationActionsTaskResponse fromJson(
          Map<String, dynamic> json) =>
      StartAuditMitigationActionsTaskResponse(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
      );
}

class StartOnDemandAuditTaskResponse {
  /// The ID of the on-demand audit you started.
  final String taskId;

  StartOnDemandAuditTaskResponse({
    this.taskId,
  });
  static StartOnDemandAuditTaskResponse fromJson(Map<String, dynamic> json) =>
      StartOnDemandAuditTaskResponse(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
      );
}

/// Information required to start a signing job.
class StartSigningJobParameter {
  /// Describes the code-signing profile.
  final SigningProfileParameter signingProfileParameter;

  /// The code-signing profile name.
  final String signingProfileName;

  /// The location to write the code-signed file.
  final Destination destination;

  StartSigningJobParameter({
    this.signingProfileParameter,
    this.signingProfileName,
    this.destination,
  });
  static StartSigningJobParameter fromJson(Map<String, dynamic> json) =>
      StartSigningJobParameter(
        signingProfileParameter: json.containsKey('signingProfileParameter')
            ? SigningProfileParameter.fromJson(json['signingProfileParameter'])
            : null,
        signingProfileName: json.containsKey('signingProfileName')
            ? json['signingProfileName'] as String
            : null,
        destination: json.containsKey('destination')
            ? Destination.fromJson(json['destination'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartThingRegistrationTaskResponse {
  /// The bulk thing provisioning task ID.
  final String taskId;

  StartThingRegistrationTaskResponse({
    this.taskId,
  });
  static StartThingRegistrationTaskResponse fromJson(
          Map<String, dynamic> json) =>
      StartThingRegistrationTaskResponse(
        taskId: json.containsKey('taskId') ? json['taskId'] as String : null,
      );
}

/// A statistical ranking (percentile) which indicates a threshold value by
/// which a behavior is determined to be in compliance or in violation of the
/// behavior.
class StatisticalThreshold {
  /// The percentile which resolves to a threshold value by which compliance
  /// with a behavior is determined. Metrics are collected over the specified
  /// period (`durationSeconds`) from all reporting devices in your account and
  /// statistical ranks are calculated. Then, the measurements from a device are
  /// collected over the same period. If the accumulated measurements from the
  /// device fall above or below (`comparisonOperator`) the value associated
  /// with the percentile specified, then the device is considered to be in
  /// compliance with the behavior, otherwise a violation occurs.
  final String statistic;

  StatisticalThreshold({
    this.statistic,
  });
  static StatisticalThreshold fromJson(Map<String, dynamic> json) =>
      StatisticalThreshold(
        statistic:
            json.containsKey('statistic') ? json['statistic'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A map of key-value pairs for all supported statistics. Currently, only count
/// is supported.
class Statistics {
  /// The count of things that match the query.
  final int count;

  Statistics({
    this.count,
  });
  static Statistics fromJson(Map<String, dynamic> json) => Statistics(
        count: json.containsKey('count') ? json['count'] as int : null,
      );
}

/// Starts execution of a Step Functions state machine.
class StepFunctionsAction {
  /// (Optional) A name will be given to the state machine execution consisting
  /// of this prefix followed by a UUID. Step Functions automatically creates a
  /// unique name for each state machine execution if one is not provided.
  final String executionNamePrefix;

  /// The name of the Step Functions state machine whose execution will be
  /// started.
  final String stateMachineName;

  /// The ARN of the role that grants IoT permission to start execution of a
  /// state machine ("Action":"states:StartExecution").
  final String roleArn;

  StepFunctionsAction({
    this.executionNamePrefix,
    @required this.stateMachineName,
    @required this.roleArn,
  });
  static StepFunctionsAction fromJson(Map<String, dynamic> json) =>
      StepFunctionsAction(
        executionNamePrefix: json.containsKey('executionNamePrefix')
            ? json['executionNamePrefix'] as String
            : null,
        stateMachineName: json['stateMachineName'] as String,
        roleArn: json['roleArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StopThingRegistrationTaskResponse {
  StopThingRegistrationTaskResponse();
  static StopThingRegistrationTaskResponse fromJson(
          Map<String, dynamic> json) =>
      StopThingRegistrationTaskResponse();
}

/// Describes a group of files that can be streamed.
class Stream {
  /// The stream ID.
  final String streamId;

  /// The ID of a file associated with a stream.
  final int fileId;

  Stream({
    this.streamId,
    this.fileId,
  });
  static Stream fromJson(Map<String, dynamic> json) => Stream(
        streamId:
            json.containsKey('streamId') ? json['streamId'] as String : null,
        fileId: json.containsKey('fileId') ? json['fileId'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a file to stream.
class StreamFile {
  /// The file ID.
  final int fileId;

  /// The location of the file in S3.
  final S3Location s3Location;

  StreamFile({
    this.fileId,
    this.s3Location,
  });
  static StreamFile fromJson(Map<String, dynamic> json) => StreamFile(
        fileId: json.containsKey('fileId') ? json['fileId'] as int : null,
        s3Location: json.containsKey('s3Location')
            ? S3Location.fromJson(json['s3Location'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a stream.
class StreamInfo {
  /// The stream ID.
  final String streamId;

  /// The stream ARN.
  final String streamArn;

  /// The stream version.
  final int streamVersion;

  /// The description of the stream.
  final String description;

  /// The files to stream.
  final List<StreamFile> files;

  /// The date when the stream was created.
  final DateTime createdAt;

  /// The date when the stream was last updated.
  final DateTime lastUpdatedAt;

  /// An IAM role AWS IoT assumes to access your S3 files.
  final String roleArn;

  StreamInfo({
    this.streamId,
    this.streamArn,
    this.streamVersion,
    this.description,
    this.files,
    this.createdAt,
    this.lastUpdatedAt,
    this.roleArn,
  });
  static StreamInfo fromJson(Map<String, dynamic> json) => StreamInfo(
        streamId:
            json.containsKey('streamId') ? json['streamId'] as String : null,
        streamArn:
            json.containsKey('streamArn') ? json['streamArn'] as String : null,
        streamVersion: json.containsKey('streamVersion')
            ? json['streamVersion'] as int
            : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        files: json.containsKey('files')
            ? (json['files'] as List)
                .map((e) => StreamFile.fromJson(e))
                .toList()
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
      );
}

/// A summary of a stream.
class StreamSummary {
  /// The stream ID.
  final String streamId;

  /// The stream ARN.
  final String streamArn;

  /// The stream version.
  final int streamVersion;

  /// A description of the stream.
  final String description;

  StreamSummary({
    this.streamId,
    this.streamArn,
    this.streamVersion,
    this.description,
  });
  static StreamSummary fromJson(Map<String, dynamic> json) => StreamSummary(
        streamId:
            json.containsKey('streamId') ? json['streamId'] as String : null,
        streamArn:
            json.containsKey('streamArn') ? json['streamArn'] as String : null,
        streamVersion: json.containsKey('streamVersion')
            ? json['streamVersion'] as int
            : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
      );
}

/// A set of key/value pairs that are used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Statistics for the checks performed during the audit.
class TaskStatistics {
  /// The number of checks in this audit.
  final int totalChecks;

  /// The number of checks in progress.
  final int inProgressChecks;

  /// The number of checks waiting for data collection.
  final int waitingForDataCollectionChecks;

  /// The number of checks that found compliant resources.
  final int compliantChecks;

  /// The number of checks that found noncompliant resources.
  final int nonCompliantChecks;

  /// The number of checks.
  final int failedChecks;

  /// The number of checks that did not run because the audit was canceled.
  final int canceledChecks;

  TaskStatistics({
    this.totalChecks,
    this.inProgressChecks,
    this.waitingForDataCollectionChecks,
    this.compliantChecks,
    this.nonCompliantChecks,
    this.failedChecks,
    this.canceledChecks,
  });
  static TaskStatistics fromJson(Map<String, dynamic> json) => TaskStatistics(
        totalChecks:
            json.containsKey('totalChecks') ? json['totalChecks'] as int : null,
        inProgressChecks: json.containsKey('inProgressChecks')
            ? json['inProgressChecks'] as int
            : null,
        waitingForDataCollectionChecks:
            json.containsKey('waitingForDataCollectionChecks')
                ? json['waitingForDataCollectionChecks'] as int
                : null,
        compliantChecks: json.containsKey('compliantChecks')
            ? json['compliantChecks'] as int
            : null,
        nonCompliantChecks: json.containsKey('nonCompliantChecks')
            ? json['nonCompliantChecks'] as int
            : null,
        failedChecks: json.containsKey('failedChecks')
            ? json['failedChecks'] as int
            : null,
        canceledChecks: json.containsKey('canceledChecks')
            ? json['canceledChecks'] as int
            : null,
      );
}

/// Provides summary counts of how many tasks for findings are in a particular
/// state. This information is included in the response from
/// DescribeAuditMitigationActionsTask.
class TaskStatisticsForAuditCheck {
  /// The total number of findings to which a task is being applied.
  final BigInt totalFindingsCount;

  /// The number of findings for which at least one of the actions failed when
  /// applied.
  final BigInt failedFindingsCount;

  /// The number of findings for which all mitigation actions succeeded when
  /// applied.
  final BigInt succeededFindingsCount;

  /// The number of findings skipped because of filter conditions provided in
  /// the parameters to the command.
  final BigInt skippedFindingsCount;

  /// The number of findings to which the mitigation action task was canceled
  /// when applied.
  final BigInt canceledFindingsCount;

  TaskStatisticsForAuditCheck({
    this.totalFindingsCount,
    this.failedFindingsCount,
    this.succeededFindingsCount,
    this.skippedFindingsCount,
    this.canceledFindingsCount,
  });
  static TaskStatisticsForAuditCheck fromJson(Map<String, dynamic> json) =>
      TaskStatisticsForAuditCheck(
        totalFindingsCount: json.containsKey('totalFindingsCount')
            ? BigInt.from(json['totalFindingsCount'])
            : null,
        failedFindingsCount: json.containsKey('failedFindingsCount')
            ? BigInt.from(json['failedFindingsCount'])
            : null,
        succeededFindingsCount: json.containsKey('succeededFindingsCount')
            ? BigInt.from(json['succeededFindingsCount'])
            : null,
        skippedFindingsCount: json.containsKey('skippedFindingsCount')
            ? BigInt.from(json['skippedFindingsCount'])
            : null,
        canceledFindingsCount: json.containsKey('canceledFindingsCount')
            ? BigInt.from(json['canceledFindingsCount'])
            : null,
      );
}

class TestAuthorizationResponse {
  /// The authentication results.
  final List<AuthResult> authResults;

  TestAuthorizationResponse({
    this.authResults,
  });
  static TestAuthorizationResponse fromJson(Map<String, dynamic> json) =>
      TestAuthorizationResponse(
        authResults: json.containsKey('authResults')
            ? (json['authResults'] as List)
                .map((e) => AuthResult.fromJson(e))
                .toList()
            : null,
      );
}

class TestInvokeAuthorizerResponse {
  /// True if the token is authenticated, otherwise false.
  final bool isAuthenticated;

  /// The principal ID.
  final String principalId;

  /// IAM policy documents.
  final List<String> policyDocuments;

  /// The number of seconds after which the temporary credentials are refreshed.
  final int refreshAfterInSeconds;

  /// The number of seconds after which the connection is terminated.
  final int disconnectAfterInSeconds;

  TestInvokeAuthorizerResponse({
    this.isAuthenticated,
    this.principalId,
    this.policyDocuments,
    this.refreshAfterInSeconds,
    this.disconnectAfterInSeconds,
  });
  static TestInvokeAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      TestInvokeAuthorizerResponse(
        isAuthenticated: json.containsKey('isAuthenticated')
            ? json['isAuthenticated'] as bool
            : null,
        principalId: json.containsKey('principalId')
            ? json['principalId'] as String
            : null,
        policyDocuments: json.containsKey('policyDocuments')
            ? (json['policyDocuments'] as List).map((e) => e as String).toList()
            : null,
        refreshAfterInSeconds: json.containsKey('refreshAfterInSeconds')
            ? json['refreshAfterInSeconds'] as int
            : null,
        disconnectAfterInSeconds: json.containsKey('disconnectAfterInSeconds')
            ? json['disconnectAfterInSeconds'] as int
            : null,
      );
}

/// The properties of the thing, including thing name, thing type name, and a
/// list of thing attributes.
class ThingAttribute {
  /// The name of the thing.
  final String thingName;

  /// The name of the thing type, if the thing has been associated with a type.
  final String thingTypeName;

  /// The thing ARN.
  final String thingArn;

  /// A list of thing attributes which are name-value pairs.
  final Map<String, String> attributes;

  /// The version of the thing record in the registry.
  final BigInt version;

  ThingAttribute({
    this.thingName,
    this.thingTypeName,
    this.thingArn,
    this.attributes,
    this.version,
  });
  static ThingAttribute fromJson(Map<String, dynamic> json) => ThingAttribute(
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        thingArn:
            json.containsKey('thingArn') ? json['thingArn'] as String : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
      );
}

/// The connectivity status of the thing.
class ThingConnectivity {
  /// True if the thing is connected to the AWS IoT service; false if it is not
  /// connected.
  final bool connected;

  /// The epoch time (in milliseconds) when the thing last connected or
  /// disconnected. If the thing has been disconnected for more than a few
  /// weeks, the time value might be missing.
  final BigInt timestamp;

  ThingConnectivity({
    this.connected,
    this.timestamp,
  });
  static ThingConnectivity fromJson(Map<String, dynamic> json) =>
      ThingConnectivity(
        connected:
            json.containsKey('connected') ? json['connected'] as bool : null,
        timestamp: json.containsKey('timestamp')
            ? BigInt.from(json['timestamp'])
            : null,
      );
}

/// The thing search index document.
class ThingDocument {
  /// The thing name.
  final String thingName;

  /// The thing ID.
  final String thingId;

  /// The thing type name.
  final String thingTypeName;

  /// Thing group names.
  final List<String> thingGroupNames;

  /// The attributes.
  final Map<String, String> attributes;

  /// The shadow.
  final String shadow;

  /// Indicates whether the thing is connected to the AWS IoT service.
  final ThingConnectivity connectivity;

  ThingDocument({
    this.thingName,
    this.thingId,
    this.thingTypeName,
    this.thingGroupNames,
    this.attributes,
    this.shadow,
    this.connectivity,
  });
  static ThingDocument fromJson(Map<String, dynamic> json) => ThingDocument(
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        thingId: json.containsKey('thingId') ? json['thingId'] as String : null,
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        thingGroupNames: json.containsKey('thingGroupNames')
            ? (json['thingGroupNames'] as List).map((e) => e as String).toList()
            : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        shadow: json.containsKey('shadow') ? json['shadow'] as String : null,
        connectivity: json.containsKey('connectivity')
            ? ThingConnectivity.fromJson(json['connectivity'])
            : null,
      );
}

/// The thing group search index document.
class ThingGroupDocument {
  /// The thing group name.
  final String thingGroupName;

  /// The thing group ID.
  final String thingGroupId;

  /// The thing group description.
  final String thingGroupDescription;

  /// The thing group attributes.
  final Map<String, String> attributes;

  /// Parent group names.
  final List<String> parentGroupNames;

  ThingGroupDocument({
    this.thingGroupName,
    this.thingGroupId,
    this.thingGroupDescription,
    this.attributes,
    this.parentGroupNames,
  });
  static ThingGroupDocument fromJson(Map<String, dynamic> json) =>
      ThingGroupDocument(
        thingGroupName: json.containsKey('thingGroupName')
            ? json['thingGroupName'] as String
            : null,
        thingGroupId: json.containsKey('thingGroupId')
            ? json['thingGroupId'] as String
            : null,
        thingGroupDescription: json.containsKey('thingGroupDescription')
            ? json['thingGroupDescription'] as String
            : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        parentGroupNames: json.containsKey('parentGroupNames')
            ? (json['parentGroupNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Thing group indexing configuration.
class ThingGroupIndexingConfiguration {
  /// Thing group indexing mode.
  final String thingGroupIndexingMode;

  ThingGroupIndexingConfiguration({
    @required this.thingGroupIndexingMode,
  });
  static ThingGroupIndexingConfiguration fromJson(Map<String, dynamic> json) =>
      ThingGroupIndexingConfiguration(
        thingGroupIndexingMode: json['thingGroupIndexingMode'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Thing group metadata.
class ThingGroupMetadata {
  /// The parent thing group name.
  final String parentGroupName;

  /// The root parent thing group.
  final List<GroupNameAndArn> rootToParentThingGroups;

  /// The UNIX timestamp of when the thing group was created.
  final DateTime creationDate;

  ThingGroupMetadata({
    this.parentGroupName,
    this.rootToParentThingGroups,
    this.creationDate,
  });
  static ThingGroupMetadata fromJson(Map<String, dynamic> json) =>
      ThingGroupMetadata(
        parentGroupName: json.containsKey('parentGroupName')
            ? json['parentGroupName'] as String
            : null,
        rootToParentThingGroups: json.containsKey('rootToParentThingGroups')
            ? (json['rootToParentThingGroups'] as List)
                .map((e) => GroupNameAndArn.fromJson(e))
                .toList()
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// Thing group properties.
class ThingGroupProperties {
  /// The thing group description.
  final String thingGroupDescription;

  /// The thing group attributes in JSON format.
  final AttributePayload attributePayload;

  ThingGroupProperties({
    this.thingGroupDescription,
    this.attributePayload,
  });
  static ThingGroupProperties fromJson(Map<String, dynamic> json) =>
      ThingGroupProperties(
        thingGroupDescription: json.containsKey('thingGroupDescription')
            ? json['thingGroupDescription'] as String
            : null,
        attributePayload: json.containsKey('attributePayload')
            ? AttributePayload.fromJson(json['attributePayload'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The thing indexing configuration. For more information, see
/// [Managing Thing Indexing](https://docs.aws.amazon.com/iot/latest/developerguide/managing-index.html).
class ThingIndexingConfiguration {
  /// Thing indexing mode. Valid values are:
  ///
  /// *   REGISTRY – Your thing index contains registry data only.
  ///
  /// *   REGISTRY_AND_SHADOW - Your thing index contains registry and shadow
  /// data.
  ///
  /// *   OFF - Thing indexing is disabled.
  final String thingIndexingMode;

  /// Thing connectivity indexing mode. Valid values are:
  ///
  /// *   STATUS – Your thing index contains connectivity status. To enable
  /// thing connectivity indexing, thingIndexMode must not be set to OFF.
  ///
  /// *   OFF - Thing connectivity status indexing is disabled.
  final String thingConnectivityIndexingMode;

  ThingIndexingConfiguration({
    @required this.thingIndexingMode,
    this.thingConnectivityIndexingMode,
  });
  static ThingIndexingConfiguration fromJson(Map<String, dynamic> json) =>
      ThingIndexingConfiguration(
        thingIndexingMode: json['thingIndexingMode'] as String,
        thingConnectivityIndexingMode:
            json.containsKey('thingConnectivityIndexingMode')
                ? json['thingConnectivityIndexingMode'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The definition of the thing type, including thing type name and description.
class ThingTypeDefinition {
  /// The name of the thing type.
  final String thingTypeName;

  /// The thing type ARN.
  final String thingTypeArn;

  /// The ThingTypeProperties for the thing type.
  final ThingTypeProperties thingTypeProperties;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing
  /// type is deprecated, and a date and time when it was deprecated.
  final ThingTypeMetadata thingTypeMetadata;

  ThingTypeDefinition({
    this.thingTypeName,
    this.thingTypeArn,
    this.thingTypeProperties,
    this.thingTypeMetadata,
  });
  static ThingTypeDefinition fromJson(Map<String, dynamic> json) =>
      ThingTypeDefinition(
        thingTypeName: json.containsKey('thingTypeName')
            ? json['thingTypeName'] as String
            : null,
        thingTypeArn: json.containsKey('thingTypeArn')
            ? json['thingTypeArn'] as String
            : null,
        thingTypeProperties: json.containsKey('thingTypeProperties')
            ? ThingTypeProperties.fromJson(json['thingTypeProperties'])
            : null,
        thingTypeMetadata: json.containsKey('thingTypeMetadata')
            ? ThingTypeMetadata.fromJson(json['thingTypeMetadata'])
            : null,
      );
}

/// The ThingTypeMetadata contains additional information about the thing type
/// including: creation date and time, a value indicating whether the thing type
/// is deprecated, and a date and time when time was deprecated.
class ThingTypeMetadata {
  /// Whether the thing type is deprecated. If **true**, no new things could be
  /// associated with this type.
  final bool deprecated;

  /// The date and time when the thing type was deprecated.
  final DateTime deprecationDate;

  /// The date and time when the thing type was created.
  final DateTime creationDate;

  ThingTypeMetadata({
    this.deprecated,
    this.deprecationDate,
    this.creationDate,
  });
  static ThingTypeMetadata fromJson(Map<String, dynamic> json) =>
      ThingTypeMetadata(
        deprecated:
            json.containsKey('deprecated') ? json['deprecated'] as bool : null,
        deprecationDate: json.containsKey('deprecationDate')
            ? DateTime.parse(json['deprecationDate'])
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
      );
}

/// The ThingTypeProperties contains information about the thing type including:
/// a thing type description, and a list of searchable thing attribute names.
class ThingTypeProperties {
  /// The description of the thing type.
  final String thingTypeDescription;

  /// A list of searchable thing attribute names.
  final List<String> searchableAttributes;

  ThingTypeProperties({
    this.thingTypeDescription,
    this.searchableAttributes,
  });
  static ThingTypeProperties fromJson(Map<String, dynamic> json) =>
      ThingTypeProperties(
        thingTypeDescription: json.containsKey('thingTypeDescription')
            ? json['thingTypeDescription'] as String
            : null,
        searchableAttributes: json.containsKey('searchableAttributes')
            ? (json['searchableAttributes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the amount of time each device has to finish its execution of the
/// job. A timer is started when the job execution status is set to
/// `IN_PROGRESS`. If the job execution status is not set to another terminal
/// state before the timer expires, it will be automatically set to `TIMED_OUT`.
class TimeoutConfig {
  /// Specifies the amount of time, in minutes, this device has to finish
  /// execution of this job. The timeout interval can be anywhere between 1
  /// minute and 7 days (1 to 10080 minutes). The in progress timer can't be
  /// updated and will apply to all job executions for the job. Whenever a job
  /// execution remains in the IN_PROGRESS status for longer than this interval,
  /// the job execution will fail and switch to the terminal `TIMED_OUT` status.
  final BigInt inProgressTimeoutInMinutes;

  TimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });
  static TimeoutConfig fromJson(Map<String, dynamic> json) => TimeoutConfig(
        inProgressTimeoutInMinutes:
            json.containsKey('inProgressTimeoutInMinutes')
                ? BigInt.from(json['inProgressTimeoutInMinutes'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a rule.
class TopicRule {
  /// The name of the rule.
  final String ruleName;

  /// The SQL statement used to query the topic. When using a SQL query with
  /// multiple lines, be sure to escape the newline characters.
  final String sql;

  /// The description of the rule.
  final String description;

  /// The date and time the rule was created.
  final DateTime createdAt;

  /// The actions associated with the rule.
  final List<Action> actions;

  /// Specifies whether the rule is disabled.
  final bool ruleDisabled;

  /// The version of the SQL rules engine to use when evaluating the rule.
  final String awsIotSqlVersion;

  /// The action to perform when an error occurs.
  final Action errorAction;

  TopicRule({
    this.ruleName,
    this.sql,
    this.description,
    this.createdAt,
    this.actions,
    this.ruleDisabled,
    this.awsIotSqlVersion,
    this.errorAction,
  });
  static TopicRule fromJson(Map<String, dynamic> json) => TopicRule(
        ruleName:
            json.containsKey('ruleName') ? json['ruleName'] as String : null,
        sql: json.containsKey('sql') ? json['sql'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        actions: json.containsKey('actions')
            ? (json['actions'] as List).map((e) => Action.fromJson(e)).toList()
            : null,
        ruleDisabled: json.containsKey('ruleDisabled')
            ? json['ruleDisabled'] as bool
            : null,
        awsIotSqlVersion: json.containsKey('awsIotSqlVersion')
            ? json['awsIotSqlVersion'] as String
            : null,
        errorAction: json.containsKey('errorAction')
            ? Action.fromJson(json['errorAction'])
            : null,
      );
}

/// Describes a rule.
class TopicRuleListItem {
  /// The rule ARN.
  final String ruleArn;

  /// The name of the rule.
  final String ruleName;

  /// The pattern for the topic names that apply.
  final String topicPattern;

  /// The date and time the rule was created.
  final DateTime createdAt;

  /// Specifies whether the rule is disabled.
  final bool ruleDisabled;

  TopicRuleListItem({
    this.ruleArn,
    this.ruleName,
    this.topicPattern,
    this.createdAt,
    this.ruleDisabled,
  });
  static TopicRuleListItem fromJson(Map<String, dynamic> json) =>
      TopicRuleListItem(
        ruleArn: json.containsKey('ruleArn') ? json['ruleArn'] as String : null,
        ruleName:
            json.containsKey('ruleName') ? json['ruleName'] as String : null,
        topicPattern: json.containsKey('topicPattern')
            ? json['topicPattern'] as String
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        ruleDisabled: json.containsKey('ruleDisabled')
            ? json['ruleDisabled'] as bool
            : null,
      );
}

/// Describes a rule.
class TopicRulePayload {
  /// The SQL statement used to query the topic. For more information, see
  /// [AWS IoT SQL Reference](https://docs.aws.amazon.com/iot/latest/developerguide/iot-rules.html#aws-iot-sql-reference)
  /// in the _AWS IoT Developer Guide_.
  final String sql;

  /// The description of the rule.
  final String description;

  /// The actions associated with the rule.
  final List<Action> actions;

  /// Specifies whether the rule is disabled.
  final bool ruleDisabled;

  /// The version of the SQL rules engine to use when evaluating the rule.
  final String awsIotSqlVersion;

  /// The action to take when an error occurs.
  final Action errorAction;

  TopicRulePayload({
    @required this.sql,
    this.description,
    @required this.actions,
    this.ruleDisabled,
    this.awsIotSqlVersion,
    this.errorAction,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The output from the TransferCertificate operation.
class TransferCertificateResponse {
  /// The ARN of the certificate.
  final String transferredCertificateArn;

  TransferCertificateResponse({
    this.transferredCertificateArn,
  });
  static TransferCertificateResponse fromJson(Map<String, dynamic> json) =>
      TransferCertificateResponse(
        transferredCertificateArn: json.containsKey('transferredCertificateArn')
            ? json['transferredCertificateArn'] as String
            : null,
      );
}

/// Data used to transfer a certificate to an AWS account.
class TransferData {
  /// The transfer message.
  final String transferMessage;

  /// The reason why the transfer was rejected.
  final String rejectReason;

  /// The date the transfer took place.
  final DateTime transferDate;

  /// The date the transfer was accepted.
  final DateTime acceptDate;

  /// The date the transfer was rejected.
  final DateTime rejectDate;

  TransferData({
    this.transferMessage,
    this.rejectReason,
    this.transferDate,
    this.acceptDate,
    this.rejectDate,
  });
  static TransferData fromJson(Map<String, dynamic> json) => TransferData(
        transferMessage: json.containsKey('transferMessage')
            ? json['transferMessage'] as String
            : null,
        rejectReason: json.containsKey('rejectReason')
            ? json['rejectReason'] as String
            : null,
        transferDate: json.containsKey('transferDate')
            ? DateTime.parse(json['transferDate'])
            : null,
        acceptDate: json.containsKey('acceptDate')
            ? DateTime.parse(json['acceptDate'])
            : null,
        rejectDate: json.containsKey('rejectDate')
            ? DateTime.parse(json['rejectDate'])
            : null,
      );
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateAccountAuditConfigurationResponse {
  UpdateAccountAuditConfigurationResponse();
  static UpdateAccountAuditConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateAccountAuditConfigurationResponse();
}

class UpdateAuthorizerResponse {
  /// The authorizer name.
  final String authorizerName;

  /// The authorizer ARN.
  final String authorizerArn;

  UpdateAuthorizerResponse({
    this.authorizerName,
    this.authorizerArn,
  });
  static UpdateAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      UpdateAuthorizerResponse(
        authorizerName: json.containsKey('authorizerName')
            ? json['authorizerName'] as String
            : null,
        authorizerArn: json.containsKey('authorizerArn')
            ? json['authorizerArn'] as String
            : null,
      );
}

class UpdateBillingGroupResponse {
  /// The latest version of the billing group.
  final BigInt version;

  UpdateBillingGroupResponse({
    this.version,
  });
  static UpdateBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateBillingGroupResponse(
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
      );
}

/// Parameters to define a mitigation action that changes the state of the CA
/// certificate to inactive.
class UpdateCACertificateParams {
  /// The action that you want to apply to the CA cerrtificate. The only
  /// supported value is `DEACTIVATE`.
  final String action;

  UpdateCACertificateParams({
    @required this.action,
  });
  static UpdateCACertificateParams fromJson(Map<String, dynamic> json) =>
      UpdateCACertificateParams(
        action: json['action'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Parameters to define a mitigation action that changes the state of the
/// device certificate to inactive.
class UpdateDeviceCertificateParams {
  /// The action that you want to apply to the device cerrtificate. The only
  /// supported value is `DEACTIVATE`.
  final String action;

  UpdateDeviceCertificateParams({
    @required this.action,
  });
  static UpdateDeviceCertificateParams fromJson(Map<String, dynamic> json) =>
      UpdateDeviceCertificateParams(
        action: json['action'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateDynamicThingGroupResponse {
  /// The dynamic thing group version.
  final BigInt version;

  UpdateDynamicThingGroupResponse({
    this.version,
  });
  static UpdateDynamicThingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateDynamicThingGroupResponse(
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
      );
}

class UpdateEventConfigurationsResponse {
  UpdateEventConfigurationsResponse();
  static UpdateEventConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateEventConfigurationsResponse();
}

class UpdateIndexingConfigurationResponse {
  UpdateIndexingConfigurationResponse();
  static UpdateIndexingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateIndexingConfigurationResponse();
}

class UpdateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  final String actionArn;

  /// A unique identifier for the mitigation action.
  final String actionId;

  UpdateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });
  static UpdateMitigationActionResponse fromJson(Map<String, dynamic> json) =>
      UpdateMitigationActionResponse(
        actionArn:
            json.containsKey('actionArn') ? json['actionArn'] as String : null,
        actionId:
            json.containsKey('actionId') ? json['actionId'] as String : null,
      );
}

class UpdateRoleAliasResponse {
  /// The role alias.
  final String roleAlias;

  /// The role alias ARN.
  final String roleAliasArn;

  UpdateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });
  static UpdateRoleAliasResponse fromJson(Map<String, dynamic> json) =>
      UpdateRoleAliasResponse(
        roleAlias:
            json.containsKey('roleAlias') ? json['roleAlias'] as String : null,
        roleAliasArn: json.containsKey('roleAliasArn')
            ? json['roleAliasArn'] as String
            : null,
      );
}

class UpdateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  UpdateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  static UpdateScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      UpdateScheduledAuditResponse(
        scheduledAuditArn: json.containsKey('scheduledAuditArn')
            ? json['scheduledAuditArn'] as String
            : null,
      );
}

class UpdateSecurityProfileResponse {
  /// The name of the security profile that was updated.
  final String securityProfileName;

  /// The ARN of the security profile that was updated.
  final String securityProfileArn;

  /// The description of the security profile.
  final String securityProfileDescription;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  final List<Behavior> behaviors;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  final Map<String, AlertTarget> alertTargets;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the security profile's `behaviors`, but it
  /// is also retained for any metric specified here.
  final List<String> additionalMetricsToRetain;

  /// The updated version of the security profile.
  final BigInt version;

  /// The time the security profile was created.
  final DateTime creationDate;

  /// The time the security profile was last modified.
  final DateTime lastModifiedDate;

  UpdateSecurityProfileResponse({
    this.securityProfileName,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.behaviors,
    this.alertTargets,
    this.additionalMetricsToRetain,
    this.version,
    this.creationDate,
    this.lastModifiedDate,
  });
  static UpdateSecurityProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateSecurityProfileResponse(
        securityProfileName: json.containsKey('securityProfileName')
            ? json['securityProfileName'] as String
            : null,
        securityProfileArn: json.containsKey('securityProfileArn')
            ? json['securityProfileArn'] as String
            : null,
        securityProfileDescription:
            json.containsKey('securityProfileDescription')
                ? json['securityProfileDescription'] as String
                : null,
        behaviors: json.containsKey('behaviors')
            ? (json['behaviors'] as List)
                .map((e) => Behavior.fromJson(e))
                .toList()
            : null,
        alertTargets: json.containsKey('alertTargets')
            ? (json['alertTargets'] as Map)
                .map((k, v) => MapEntry(k as String, AlertTarget.fromJson(v)))
            : null,
        additionalMetricsToRetain: json.containsKey('additionalMetricsToRetain')
            ? (json['additionalMetricsToRetain'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
      );
}

class UpdateStreamResponse {
  /// The stream ID.
  final String streamId;

  /// The stream ARN.
  final String streamArn;

  /// A description of the stream.
  final String description;

  /// The stream version.
  final int streamVersion;

  UpdateStreamResponse({
    this.streamId,
    this.streamArn,
    this.description,
    this.streamVersion,
  });
  static UpdateStreamResponse fromJson(Map<String, dynamic> json) =>
      UpdateStreamResponse(
        streamId:
            json.containsKey('streamId') ? json['streamId'] as String : null,
        streamArn:
            json.containsKey('streamArn') ? json['streamArn'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        streamVersion: json.containsKey('streamVersion')
            ? json['streamVersion'] as int
            : null,
      );
}

class UpdateThingGroupResponse {
  /// The version of the updated thing group.
  final BigInt version;

  UpdateThingGroupResponse({
    this.version,
  });
  static UpdateThingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateThingGroupResponse(
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
      );
}

class UpdateThingGroupsForThingResponse {
  UpdateThingGroupsForThingResponse();
  static UpdateThingGroupsForThingResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateThingGroupsForThingResponse();
}

/// The output from the UpdateThing operation.
class UpdateThingResponse {
  UpdateThingResponse();
  static UpdateThingResponse fromJson(Map<String, dynamic> json) =>
      UpdateThingResponse();
}

class ValidateSecurityProfileBehaviorsResponse {
  /// True if the behaviors were valid.
  final bool valid;

  /// The list of any errors found in the behaviors.
  final List<ValidationError> validationErrors;

  ValidateSecurityProfileBehaviorsResponse({
    this.valid,
    this.validationErrors,
  });
  static ValidateSecurityProfileBehaviorsResponse fromJson(
          Map<String, dynamic> json) =>
      ValidateSecurityProfileBehaviorsResponse(
        valid: json.containsKey('valid') ? json['valid'] as bool : null,
        validationErrors: json.containsKey('validationErrors')
            ? (json['validationErrors'] as List)
                .map((e) => ValidationError.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about an error found in a behavior specification.
class ValidationError {
  /// The description of an error found in the behaviors.
  final String errorMessage;

  ValidationError({
    this.errorMessage,
  });
  static ValidationError fromJson(Map<String, dynamic> json) => ValidationError(
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
      );
}

/// Information about a Device Defender security profile behavior violation.
class ViolationEvent {
  /// The ID of the violation event.
  final String violationId;

  /// The name of the thing responsible for the violation event.
  final String thingName;

  /// The name of the security profile whose behavior was violated.
  final String securityProfileName;

  /// The behavior which was violated.
  final Behavior behavior;

  /// The value of the metric (the measurement).
  final MetricValue metricValue;

  /// The type of violation event.
  final String violationEventType;

  /// The time the violation event occurred.
  final DateTime violationEventTime;

  ViolationEvent({
    this.violationId,
    this.thingName,
    this.securityProfileName,
    this.behavior,
    this.metricValue,
    this.violationEventType,
    this.violationEventTime,
  });
  static ViolationEvent fromJson(Map<String, dynamic> json) => ViolationEvent(
        violationId: json.containsKey('violationId')
            ? json['violationId'] as String
            : null,
        thingName:
            json.containsKey('thingName') ? json['thingName'] as String : null,
        securityProfileName: json.containsKey('securityProfileName')
            ? json['securityProfileName'] as String
            : null,
        behavior: json.containsKey('behavior')
            ? Behavior.fromJson(json['behavior'])
            : null,
        metricValue: json.containsKey('metricValue')
            ? MetricValue.fromJson(json['metricValue'])
            : null,
        violationEventType: json.containsKey('violationEventType')
            ? json['violationEventType'] as String
            : null,
        violationEventTime: json.containsKey('violationEventTime')
            ? DateTime.parse(json['violationEventTime'])
            : null,
      );
}
