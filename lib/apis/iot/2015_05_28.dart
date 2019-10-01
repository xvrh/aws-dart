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
      {bool setAsActive}) async {}

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
    return AddThingToBillingGroupResponse.fromJson({});
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
    return AddThingToThingGroupResponse.fromJson({});
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
    return AssociateTargetsWithJobResponse.fromJson({});
  }

  /// Attaches a policy to the specified target.
  ///
  /// [policyName]: The name of the policy to attach.
  ///
  /// [target]: The
  /// [identity](https://docs.aws.amazon.com/iot/latest/developerguide/iot-security-identity.html)
  /// to which the policy is attached.
  Future<void> attachPolicy(
      {@required String policyName, @required String target}) async {}

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
      {@required String policyName, @required String principal}) async {}

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
    return AttachSecurityProfileResponse.fromJson({});
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
    return AttachThingPrincipalResponse.fromJson({});
  }

  /// Cancels a mitigation action task that is in progress. If the task is not
  /// in progress, an InvalidRequestException occurs.
  ///
  /// [taskId]: The unique identifier for the task that you want to cancel.
  Future<CancelAuditMitigationActionsTaskResponse>
      cancelAuditMitigationActionsTask(String taskId) async {
    return CancelAuditMitigationActionsTaskResponse.fromJson({});
  }

  /// Cancels an audit that is in progress. The audit can be either scheduled or
  /// on-demand. If the audit is not in progress, an "InvalidRequestException"
  /// occurs.
  ///
  /// [taskId]: The ID of the audit you want to cancel. You can only cancel an
  /// audit that is "IN_PROGRESS".
  Future<CancelAuditTaskResponse> cancelAuditTask(String taskId) async {
    return CancelAuditTaskResponse.fromJson({});
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
  Future<void> cancelCertificateTransfer(String certificateId) async {}

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
    return CancelJobResponse.fromJson({});
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
      Map<String, String> statusDetails}) async {}

  /// Clears the default authorizer.
  Future<ClearDefaultAuthorizerResponse> clearDefaultAuthorizer() async {
    return ClearDefaultAuthorizerResponse.fromJson({});
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
    return CreateAuthorizerResponse.fromJson({});
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
    return CreateBillingGroupResponse.fromJson({});
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
    return CreateCertificateFromCsrResponse.fromJson({});
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
    return CreateDynamicThingGroupResponse.fromJson({});
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
    return CreateJobResponse.fromJson({});
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
    return CreateKeysAndCertificateResponse.fromJson({});
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
    return CreateMitigationActionResponse.fromJson({});
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
    return CreateOtaUpdateResponse.fromJson({});
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
    return CreatePolicyResponse.fromJson({});
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
    return CreatePolicyVersionResponse.fromJson({});
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
    return CreateRoleAliasResponse.fromJson({});
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
    return CreateScheduledAuditResponse.fromJson({});
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
    return CreateSecurityProfileResponse.fromJson({});
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
    return CreateStreamResponse.fromJson({});
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
    return CreateThingResponse.fromJson({});
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
    return CreateThingGroupResponse.fromJson({});
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
    return CreateThingTypeResponse.fromJson({});
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
      String tags}) async {}

  /// Restores the default settings for Device Defender audits for this account.
  /// Any configuration data you entered is deleted and all audit checks are
  /// reset to disabled.
  ///
  /// [deleteScheduledAudits]: If true, all scheduled audits are deleted.
  Future<DeleteAccountAuditConfigurationResponse>
      deleteAccountAuditConfiguration({bool deleteScheduledAudits}) async {
    return DeleteAccountAuditConfigurationResponse.fromJson({});
  }

  /// Deletes an authorizer.
  ///
  /// [authorizerName]: The name of the authorizer to delete.
  Future<DeleteAuthorizerResponse> deleteAuthorizer(
      String authorizerName) async {
    return DeleteAuthorizerResponse.fromJson({});
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
    return DeleteBillingGroupResponse.fromJson({});
  }

  /// Deletes a registered CA certificate.
  ///
  /// [certificateId]: The ID of the certificate to delete. (The last part of
  /// the certificate ARN contains the certificate ID.)
  Future<DeleteCACertificateResponse> deleteCACertificate(
      String certificateId) async {
    return DeleteCACertificateResponse.fromJson({});
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
      {bool forceDelete}) async {}

  /// Deletes a dynamic thing group.
  ///
  /// [thingGroupName]: The name of the dynamic thing group to delete.
  ///
  /// [expectedVersion]: The expected version of the dynamic thing group to
  /// delete.
  Future<DeleteDynamicThingGroupResponse> deleteDynamicThingGroup(
      String thingGroupName,
      {BigInt expectedVersion}) async {
    return DeleteDynamicThingGroupResponse.fromJson({});
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
  Future<void> deleteJob(String jobId, {bool force}) async {}

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
      bool force}) async {}

  /// Deletes a defined mitigation action from your AWS account.
  ///
  /// [actionName]: The name of the mitigation action that you want to delete.
  Future<DeleteMitigationActionResponse> deleteMitigationAction(
      String actionName) async {
    return DeleteMitigationActionResponse.fromJson({});
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
    return DeleteOtaUpdateResponse.fromJson({});
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
  Future<void> deletePolicy(String policyName) async {}

  /// Deletes the specified version of the specified policy. You cannot delete
  /// the default version of a policy using this API. To delete the default
  /// version of a policy, use DeletePolicy. To find out which version of a
  /// policy is marked as the default version, use ListPolicyVersions.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// [policyVersionId]: The policy version ID.
  Future<void> deletePolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {}

  /// Deletes a CA certificate registration code.
  Future<DeleteRegistrationCodeResponse> deleteRegistrationCode() async {
    return DeleteRegistrationCodeResponse.fromJson({});
  }

  /// Deletes a role alias
  ///
  /// [roleAlias]: The role alias to delete.
  Future<DeleteRoleAliasResponse> deleteRoleAlias(String roleAlias) async {
    return DeleteRoleAliasResponse.fromJson({});
  }

  /// Deletes a scheduled audit.
  ///
  /// [scheduledAuditName]: The name of the scheduled audit you want to delete.
  Future<DeleteScheduledAuditResponse> deleteScheduledAudit(
      String scheduledAuditName) async {
    return DeleteScheduledAuditResponse.fromJson({});
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
    return DeleteSecurityProfileResponse.fromJson({});
  }

  /// Deletes a stream.
  ///
  /// [streamId]: The stream ID.
  Future<DeleteStreamResponse> deleteStream(String streamId) async {
    return DeleteStreamResponse.fromJson({});
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
    return DeleteThingResponse.fromJson({});
  }

  /// Deletes a thing group.
  ///
  /// [thingGroupName]: The name of the thing group to delete.
  ///
  /// [expectedVersion]: The expected version of the thing group to delete.
  Future<DeleteThingGroupResponse> deleteThingGroup(String thingGroupName,
      {BigInt expectedVersion}) async {
    return DeleteThingGroupResponse.fromJson({});
  }

  /// Deletes the specified thing type. You cannot delete a thing type if it has
  /// things associated with it. To delete a thing type, first mark it as
  /// deprecated by calling DeprecateThingType, then remove any associated
  /// things by calling UpdateThing to change the thing type on any associated
  /// thing, and finally use DeleteThingType to delete the thing type.
  ///
  /// [thingTypeName]: The name of the thing type.
  Future<DeleteThingTypeResponse> deleteThingType(String thingTypeName) async {
    return DeleteThingTypeResponse.fromJson({});
  }

  /// Deletes the rule.
  ///
  /// [ruleName]: The name of the rule.
  Future<void> deleteTopicRule(String ruleName) async {}

  /// Deletes a logging level.
  ///
  /// [targetType]: The type of resource for which you are configuring logging.
  /// Must be `THING_Group`.
  ///
  /// [targetName]: The name of the resource for which you are configuring
  /// logging.
  Future<void> deleteV2LoggingLevel(
      {@required String targetType, @required String targetName}) async {}

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
    return DeprecateThingTypeResponse.fromJson({});
  }

  /// Gets information about the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  Future<DescribeAccountAuditConfigurationResponse>
      describeAccountAuditConfiguration() async {
    return DescribeAccountAuditConfigurationResponse.fromJson({});
  }

  /// Gets information about a single audit finding. Properties include the
  /// reason for noncompliance, the severity of the issue, and when the audit
  /// that returned the finding was started.
  ///
  /// [findingId]: A unique identifier for a single audit finding. You can use
  /// this identifier to apply mitigation actions to the finding.
  Future<DescribeAuditFindingResponse> describeAuditFinding(
      String findingId) async {
    return DescribeAuditFindingResponse.fromJson({});
  }

  /// Gets information about an audit mitigation task that is used to apply
  /// mitigation actions to a set of audit findings. Properties include the
  /// actions being applied, the audit checks to which they're being applied,
  /// the task status, and aggregated task statistics.
  ///
  /// [taskId]: The unique identifier for the audit mitigation task.
  Future<DescribeAuditMitigationActionsTaskResponse>
      describeAuditMitigationActionsTask(String taskId) async {
    return DescribeAuditMitigationActionsTaskResponse.fromJson({});
  }

  /// Gets information about a Device Defender audit.
  ///
  /// [taskId]: The ID of the audit whose information you want to get.
  Future<DescribeAuditTaskResponse> describeAuditTask(String taskId) async {
    return DescribeAuditTaskResponse.fromJson({});
  }

  /// Describes an authorizer.
  ///
  /// [authorizerName]: The name of the authorizer to describe.
  Future<DescribeAuthorizerResponse> describeAuthorizer(
      String authorizerName) async {
    return DescribeAuthorizerResponse.fromJson({});
  }

  /// Returns information about a billing group.
  ///
  /// [billingGroupName]: The name of the billing group.
  Future<DescribeBillingGroupResponse> describeBillingGroup(
      String billingGroupName) async {
    return DescribeBillingGroupResponse.fromJson({});
  }

  /// Describes a registered CA certificate.
  ///
  /// [certificateId]: The CA certificate identifier.
  Future<DescribeCACertificateResponse> describeCACertificate(
      String certificateId) async {
    return DescribeCACertificateResponse.fromJson({});
  }

  /// Gets information about the specified certificate.
  ///
  /// [certificateId]: The ID of the certificate. (The last part of the
  /// certificate ARN contains the certificate ID.)
  Future<DescribeCertificateResponse> describeCertificate(
      String certificateId) async {
    return DescribeCertificateResponse.fromJson({});
  }

  /// Describes the default authorizer.
  Future<DescribeDefaultAuthorizerResponse> describeDefaultAuthorizer() async {
    return DescribeDefaultAuthorizerResponse.fromJson({});
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
    return DescribeEndpointResponse.fromJson({});
  }

  /// Describes event configurations.
  Future<DescribeEventConfigurationsResponse>
      describeEventConfigurations() async {
    return DescribeEventConfigurationsResponse.fromJson({});
  }

  /// Describes a search index.
  ///
  /// [indexName]: The index name.
  Future<DescribeIndexResponse> describeIndex(String indexName) async {
    return DescribeIndexResponse.fromJson({});
  }

  /// Describes a job.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  Future<DescribeJobResponse> describeJob(String jobId) async {
    return DescribeJobResponse.fromJson({});
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
    return DescribeJobExecutionResponse.fromJson({});
  }

  /// Gets information about a mitigation action.
  ///
  /// [actionName]: The friendly name that uniquely identifies the mitigation
  /// action.
  Future<DescribeMitigationActionResponse> describeMitigationAction(
      String actionName) async {
    return DescribeMitigationActionResponse.fromJson({});
  }

  /// Describes a role alias.
  ///
  /// [roleAlias]: The role alias to describe.
  Future<DescribeRoleAliasResponse> describeRoleAlias(String roleAlias) async {
    return DescribeRoleAliasResponse.fromJson({});
  }

  /// Gets information about a scheduled audit.
  ///
  /// [scheduledAuditName]: The name of the scheduled audit whose information
  /// you want to get.
  Future<DescribeScheduledAuditResponse> describeScheduledAudit(
      String scheduledAuditName) async {
    return DescribeScheduledAuditResponse.fromJson({});
  }

  /// Gets information about a Device Defender security profile.
  ///
  /// [securityProfileName]: The name of the security profile whose information
  /// you want to get.
  Future<DescribeSecurityProfileResponse> describeSecurityProfile(
      String securityProfileName) async {
    return DescribeSecurityProfileResponse.fromJson({});
  }

  /// Gets information about a stream.
  ///
  /// [streamId]: The stream ID.
  Future<DescribeStreamResponse> describeStream(String streamId) async {
    return DescribeStreamResponse.fromJson({});
  }

  /// Gets information about the specified thing.
  ///
  /// [thingName]: The name of the thing.
  Future<DescribeThingResponse> describeThing(String thingName) async {
    return DescribeThingResponse.fromJson({});
  }

  /// Describe a thing group.
  ///
  /// [thingGroupName]: The name of the thing group.
  Future<DescribeThingGroupResponse> describeThingGroup(
      String thingGroupName) async {
    return DescribeThingGroupResponse.fromJson({});
  }

  /// Describes a bulk thing provisioning task.
  ///
  /// [taskId]: The task ID.
  Future<DescribeThingRegistrationTaskResponse> describeThingRegistrationTask(
      String taskId) async {
    return DescribeThingRegistrationTaskResponse.fromJson({});
  }

  /// Gets information about the specified thing type.
  ///
  /// [thingTypeName]: The name of the thing type.
  Future<DescribeThingTypeResponse> describeThingType(
      String thingTypeName) async {
    return DescribeThingTypeResponse.fromJson({});
  }

  /// Detaches a policy from the specified target.
  ///
  /// [policyName]: The policy to detach.
  ///
  /// [target]: The target from which the policy will be detached.
  Future<void> detachPolicy(
      {@required String policyName, @required String target}) async {}

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
      {@required String policyName, @required String principal}) async {}

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
    return DetachSecurityProfileResponse.fromJson({});
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
    return DetachThingPrincipalResponse.fromJson({});
  }

  /// Disables the rule.
  ///
  /// [ruleName]: The name of the rule to disable.
  Future<void> disableTopicRule(String ruleName) async {}

  /// Enables the rule.
  ///
  /// [ruleName]: The name of the topic rule to enable.
  Future<void> enableTopicRule(String ruleName) async {}

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
    return GetEffectivePoliciesResponse.fromJson({});
  }

  /// Gets the search configuration.
  Future<GetIndexingConfigurationResponse> getIndexingConfiguration() async {
    return GetIndexingConfigurationResponse.fromJson({});
  }

  /// Gets a job document.
  ///
  /// [jobId]: The unique identifier you assigned to this job when it was
  /// created.
  Future<GetJobDocumentResponse> getJobDocument(String jobId) async {
    return GetJobDocumentResponse.fromJson({});
  }

  /// Gets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `GetV2LoggingOptions`
  /// instead.
  Future<GetLoggingOptionsResponse> getLoggingOptions() async {
    return GetLoggingOptionsResponse.fromJson({});
  }

  /// Gets an OTA update.
  ///
  /// [otaUpdateId]: The OTA update ID.
  Future<GetOtaUpdateResponse> getOtaUpdate(String otaUpdateId) async {
    return GetOtaUpdateResponse.fromJson({});
  }

  /// Gets information about the specified policy with the policy document of
  /// the default version.
  ///
  /// [policyName]: The name of the policy.
  Future<GetPolicyResponse> getPolicy(String policyName) async {
    return GetPolicyResponse.fromJson({});
  }

  /// Gets information about the specified policy version.
  ///
  /// [policyName]: The name of the policy.
  ///
  /// [policyVersionId]: The policy version ID.
  Future<GetPolicyVersionResponse> getPolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {
    return GetPolicyVersionResponse.fromJson({});
  }

  /// Gets a registration code used to register a CA certificate with AWS IoT.
  Future<GetRegistrationCodeResponse> getRegistrationCode() async {
    return GetRegistrationCodeResponse.fromJson({});
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
    return GetStatisticsResponse.fromJson({});
  }

  /// Gets information about the rule.
  ///
  /// [ruleName]: The name of the rule.
  Future<GetTopicRuleResponse> getTopicRule(String ruleName) async {
    return GetTopicRuleResponse.fromJson({});
  }

  /// Gets the fine grained logging options.
  Future<GetV2LoggingOptionsResponse> getV2LoggingOptions() async {
    return GetV2LoggingOptionsResponse.fromJson({});
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
    return ListActiveViolationsResponse.fromJson({});
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
    return ListAttachedPoliciesResponse.fromJson({});
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
    return ListAuditFindingsResponse.fromJson({});
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
    return ListAuditMitigationActionsExecutionsResponse.fromJson({});
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
    return ListAuditMitigationActionsTasksResponse.fromJson({});
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
    return ListAuditTasksResponse.fromJson({});
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
    return ListAuthorizersResponse.fromJson({});
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
    return ListBillingGroupsResponse.fromJson({});
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
    return ListCACertificatesResponse.fromJson({});
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
    return ListCertificatesResponse.fromJson({});
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
    return ListCertificatesByCAResponse.fromJson({});
  }

  /// Lists the search indices.
  ///
  /// [nextToken]: The token used to get the next set of results, or null if
  /// there are no additional results.
  ///
  /// [maxResults]: The maximum number of results to return at one time.
  Future<ListIndicesResponse> listIndices(
      {String nextToken, int maxResults}) async {
    return ListIndicesResponse.fromJson({});
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
    return ListJobExecutionsForJobResponse.fromJson({});
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
    return ListJobExecutionsForThingResponse.fromJson({});
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
    return ListJobsResponse.fromJson({});
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
    return ListMitigationActionsResponse.fromJson({});
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
    return ListOtaUpdatesResponse.fromJson({});
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
    return ListOutgoingCertificatesResponse.fromJson({});
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
    return ListPoliciesResponse.fromJson({});
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
    return ListPolicyPrincipalsResponse.fromJson({});
  }

  /// Lists the versions of the specified policy and identifies the default
  /// version.
  ///
  /// [policyName]: The policy name.
  Future<ListPolicyVersionsResponse> listPolicyVersions(
      String policyName) async {
    return ListPolicyVersionsResponse.fromJson({});
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
    return ListPrincipalPoliciesResponse.fromJson({});
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
    return ListPrincipalThingsResponse.fromJson({});
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
    return ListRoleAliasesResponse.fromJson({});
  }

  /// Lists all of your scheduled audits.
  ///
  /// [nextToken]: The token for the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return at one time. The
  /// default is 25.
  Future<ListScheduledAuditsResponse> listScheduledAudits(
      {String nextToken, int maxResults}) async {
    return ListScheduledAuditsResponse.fromJson({});
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
    return ListSecurityProfilesResponse.fromJson({});
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
    return ListSecurityProfilesForTargetResponse.fromJson({});
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
    return ListStreamsResponse.fromJson({});
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {String nextToken}) async {
    return ListTagsForResourceResponse.fromJson({});
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
    return ListTargetsForPolicyResponse.fromJson({});
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
    return ListTargetsForSecurityProfileResponse.fromJson({});
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
    return ListThingGroupsResponse.fromJson({});
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
    return ListThingGroupsForThingResponse.fromJson({});
  }

  /// Lists the principals associated with the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// [thingName]: The name of the thing.
  Future<ListThingPrincipalsResponse> listThingPrincipals(
      String thingName) async {
    return ListThingPrincipalsResponse.fromJson({});
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
    return ListThingRegistrationTaskReportsResponse.fromJson({});
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
    return ListThingRegistrationTasksResponse.fromJson({});
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
    return ListThingTypesResponse.fromJson({});
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
    return ListThingsResponse.fromJson({});
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
    return ListThingsInBillingGroupResponse.fromJson({});
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
    return ListThingsInThingGroupResponse.fromJson({});
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
    return ListTopicRulesResponse.fromJson({});
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
    return ListV2LoggingLevelsResponse.fromJson({});
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
    return ListViolationEventsResponse.fromJson({});
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
    return RegisterCACertificateResponse.fromJson({});
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
    return RegisterCertificateResponse.fromJson({});
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
    return RegisterThingResponse.fromJson({});
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
      {String rejectReason}) async {}

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
    return RemoveThingFromBillingGroupResponse.fromJson({});
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
    return RemoveThingFromThingGroupResponse.fromJson({});
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
      @required TopicRulePayload topicRulePayload}) async {}

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
    return SearchIndexResponse.fromJson({});
  }

  /// Sets the default authorizer. This will be used if a websocket connection
  /// is made without specifying an authorizer.
  ///
  /// [authorizerName]: The authorizer name.
  Future<SetDefaultAuthorizerResponse> setDefaultAuthorizer(
      String authorizerName) async {
    return SetDefaultAuthorizerResponse.fromJson({});
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
      {@required String policyName, @required String policyVersionId}) async {}

  /// Sets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `SetV2LoggingOptions`
  /// instead.
  ///
  /// [loggingOptionsPayload]: The logging options payload.
  Future<void> setLoggingOptions(
      LoggingOptionsPayload loggingOptionsPayload) async {}

  /// Sets the logging level.
  ///
  /// [logTarget]: The log target.
  ///
  /// [logLevel]: The log level.
  Future<void> setV2LoggingLevel(
      {@required LogTarget logTarget, @required String logLevel}) async {}

  /// Sets the logging options for the V2 logging service.
  ///
  /// [roleArn]: The ARN of the role that allows IoT to write to Cloudwatch
  /// logs.
  ///
  /// [defaultLogLevel]: The default logging level.
  ///
  /// [disableAllLogs]: If true all logs are disabled. The default is false.
  Future<void> setV2LoggingOptions(
      {String roleArn, String defaultLogLevel, bool disableAllLogs}) async {}

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
    return StartAuditMitigationActionsTaskResponse.fromJson({});
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
    return StartOnDemandAuditTaskResponse.fromJson({});
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
    return StartThingRegistrationTaskResponse.fromJson({});
  }

  /// Cancels a bulk thing provisioning task.
  ///
  /// [taskId]: The bulk thing provisioning task ID.
  Future<StopThingRegistrationTaskResponse> stopThingRegistrationTask(
      String taskId) async {
    return StopThingRegistrationTaskResponse.fromJson({});
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tags]: The new or modified tags for the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
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
    return TestAuthorizationResponse.fromJson({});
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
    return TestInvokeAuthorizerResponse.fromJson({});
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
    return TransferCertificateResponse.fromJson({});
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// [resourceArn]: The ARN of the resource.
  ///
  /// [tagKeys]: A list of the keys of the tags to be removed from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
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
    return UpdateAccountAuditConfigurationResponse.fromJson({});
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
    return UpdateAuthorizerResponse.fromJson({});
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
    return UpdateBillingGroupResponse.fromJson({});
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
      bool removeAutoRegistration}) async {}

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
      {@required String certificateId, @required String newStatus}) async {}

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
    return UpdateDynamicThingGroupResponse.fromJson({});
  }

  /// Updates the event configurations.
  ///
  /// [eventConfigurations]: The new event configuration values.
  Future<UpdateEventConfigurationsResponse> updateEventConfigurations(
      {Map<String, Configuration> eventConfigurations}) async {
    return UpdateEventConfigurationsResponse.fromJson({});
  }

  /// Updates the search configuration.
  ///
  /// [thingIndexingConfiguration]: Thing indexing configuration.
  ///
  /// [thingGroupIndexingConfiguration]: Thing group indexing configuration.
  Future<UpdateIndexingConfigurationResponse> updateIndexingConfiguration(
      {ThingIndexingConfiguration thingIndexingConfiguration,
      ThingGroupIndexingConfiguration thingGroupIndexingConfiguration}) async {
    return UpdateIndexingConfigurationResponse.fromJson({});
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
      TimeoutConfig timeoutConfig}) async {}

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
    return UpdateMitigationActionResponse.fromJson({});
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
    return UpdateRoleAliasResponse.fromJson({});
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
    return UpdateScheduledAuditResponse.fromJson({});
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
    return UpdateSecurityProfileResponse.fromJson({});
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
    return UpdateStreamResponse.fromJson({});
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
    return UpdateThingResponse.fromJson({});
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
    return UpdateThingGroupResponse.fromJson({});
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
    return UpdateThingGroupsForThingResponse.fromJson({});
  }

  /// Validates a Device Defender security profile behaviors specification.
  ///
  /// [behaviors]: Specifies the behaviors that, when violated by a device
  /// (thing), cause an alert.
  Future<ValidateSecurityProfileBehaviorsResponse>
      validateSecurityProfileBehaviors(List<Behavior> behaviors) async {
    return ValidateSecurityProfileBehaviorsResponse.fromJson({});
  }
}

/// Details of abort criteria to abort the job.
class AbortConfig {
  /// The list of abort criteria to define rules to abort the job.
  final List<AbortCriteria> criteriaList;

  AbortConfig({
    @required this.criteriaList,
  });
  static AbortConfig fromJson(Map<String, dynamic> json) => AbortConfig();
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
  static AbortCriteria fromJson(Map<String, dynamic> json) => AbortCriteria();
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
  static Action fromJson(Map<String, dynamic> json) => Action();
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
  static ActiveViolation fromJson(Map<String, dynamic> json) =>
      ActiveViolation();
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
      AddThingsToThingGroupParams();
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
  static AlertTarget fromJson(Map<String, dynamic> json) => AlertTarget();
}

/// Contains information that allowed the authorization.
class Allowed {
  /// A list of policies that allowed the authentication.
  final List<Policy> policies;

  Allowed({
    this.policies,
  });
  static Allowed fromJson(Map<String, dynamic> json) => Allowed();
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
      AssociateTargetsWithJobResponse();
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
      AttributePayload();
}

/// Which audit checks are enabled and disabled for this account.
class AuditCheckConfiguration {
  /// True if this audit check is enabled for this account.
  final bool enabled;

  AuditCheckConfiguration({
    this.enabled,
  });
  static AuditCheckConfiguration fromJson(Map<String, dynamic> json) =>
      AuditCheckConfiguration();
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
      AuditCheckDetails();
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
  static AuditFinding fromJson(Map<String, dynamic> json) => AuditFinding();
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
      AuditMitigationActionExecutionMetadata();
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
      AuditMitigationActionsTaskMetadata();
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
      AuditMitigationActionsTaskTarget();
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
      AuditNotificationTarget();
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
      AuditTaskMetadata();
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
  static AuthInfo fromJson(Map<String, dynamic> json) => AuthInfo();
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
  static AuthResult fromJson(Map<String, dynamic> json) => AuthResult();
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
      AuthorizerDescription();
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
      AuthorizerSummary();
}

/// Configuration for the rollout of OTA updates.
class AwsJobExecutionsRolloutConfig {
  /// The maximum number of OTA update job executions started per minute.
  final int maximumPerMinute;

  AwsJobExecutionsRolloutConfig({
    this.maximumPerMinute,
  });
  static AwsJobExecutionsRolloutConfig fromJson(Map<String, dynamic> json) =>
      AwsJobExecutionsRolloutConfig();
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
  static Behavior fromJson(Map<String, dynamic> json) => Behavior();
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
      BehaviorCriteria();
}

/// Additional information about the billing group.
class BillingGroupMetadata {
  /// The date the billing group was created.
  final DateTime creationDate;

  BillingGroupMetadata({
    this.creationDate,
  });
  static BillingGroupMetadata fromJson(Map<String, dynamic> json) =>
      BillingGroupMetadata();
}

/// The properties of a billing group.
class BillingGroupProperties {
  /// The description of the billing group.
  final String billingGroupDescription;

  BillingGroupProperties({
    this.billingGroupDescription,
  });
  static BillingGroupProperties fromJson(Map<String, dynamic> json) =>
      BillingGroupProperties();
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
  static CACertificate fromJson(Map<String, dynamic> json) => CACertificate();
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
      CACertificateDescription();
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
      CancelJobResponse();
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
  static Certificate fromJson(Map<String, dynamic> json) => Certificate();
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
      CertificateDescription();
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
      CertificateValidity();
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
      CloudwatchAlarmAction();
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
      CloudwatchMetricAction();
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
  static CodeSigning fromJson(Map<String, dynamic> json) => CodeSigning();
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
      CodeSigningCertificateChain();
}

/// Describes the signature for a file.
class CodeSigningSignature {
  /// A base64 encoded binary representation of the code signing signature.
  final Uint8List inlineDocument;

  CodeSigningSignature({
    this.inlineDocument,
  });
  static CodeSigningSignature fromJson(Map<String, dynamic> json) =>
      CodeSigningSignature();
}

/// Configuration.
class Configuration {
  /// True to enable the configuration.
  final bool enabled;

  Configuration({
    this.enabled,
  });
  static Configuration fromJson(Map<String, dynamic> json) => Configuration();
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
      CreateAuthorizerResponse();
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
      CreateBillingGroupResponse();
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
      CreateCertificateFromCsrResponse();
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
      CreateDynamicThingGroupResponse();
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
      CreateJobResponse();
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
      CreateKeysAndCertificateResponse();
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
      CreateMitigationActionResponse();
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
      CreateOtaUpdateResponse();
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
      CreatePolicyResponse();
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
      CreatePolicyVersionResponse();
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
      CreateRoleAliasResponse();
}

class CreateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  CreateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  static CreateScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      CreateScheduledAuditResponse();
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
      CreateSecurityProfileResponse();
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
      CreateStreamResponse();
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
      CreateThingGroupResponse();
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
      CreateThingResponse();
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
      CreateThingTypeResponse();
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
      CustomCodeSigning();
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
  static Denied fromJson(Map<String, dynamic> json) => Denied();
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
      DescribeAccountAuditConfigurationResponse();
}

class DescribeAuditFindingResponse {
  final AuditFinding finding;

  DescribeAuditFindingResponse({
    this.finding,
  });
  static DescribeAuditFindingResponse fromJson(Map<String, dynamic> json) =>
      DescribeAuditFindingResponse();
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
      DescribeAuditMitigationActionsTaskResponse();
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
      DescribeAuditTaskResponse();
}

class DescribeAuthorizerResponse {
  /// The authorizer description.
  final AuthorizerDescription authorizerDescription;

  DescribeAuthorizerResponse({
    this.authorizerDescription,
  });
  static DescribeAuthorizerResponse fromJson(Map<String, dynamic> json) =>
      DescribeAuthorizerResponse();
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
      DescribeBillingGroupResponse();
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
      DescribeCACertificateResponse();
}

/// The output of the DescribeCertificate operation.
class DescribeCertificateResponse {
  /// The description of the certificate.
  final CertificateDescription certificateDescription;

  DescribeCertificateResponse({
    this.certificateDescription,
  });
  static DescribeCertificateResponse fromJson(Map<String, dynamic> json) =>
      DescribeCertificateResponse();
}

class DescribeDefaultAuthorizerResponse {
  /// The default authorizer's description.
  final AuthorizerDescription authorizerDescription;

  DescribeDefaultAuthorizerResponse({
    this.authorizerDescription,
  });
  static DescribeDefaultAuthorizerResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDefaultAuthorizerResponse();
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
      DescribeEndpointResponse();
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
      DescribeEventConfigurationsResponse();
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
      DescribeIndexResponse();
}

class DescribeJobExecutionResponse {
  /// Information about the job execution.
  final JobExecution execution;

  DescribeJobExecutionResponse({
    this.execution,
  });
  static DescribeJobExecutionResponse fromJson(Map<String, dynamic> json) =>
      DescribeJobExecutionResponse();
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
      DescribeJobResponse();
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
      DescribeMitigationActionResponse();
}

class DescribeRoleAliasResponse {
  /// The role alias description.
  final RoleAliasDescription roleAliasDescription;

  DescribeRoleAliasResponse({
    this.roleAliasDescription,
  });
  static DescribeRoleAliasResponse fromJson(Map<String, dynamic> json) =>
      DescribeRoleAliasResponse();
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
      DescribeScheduledAuditResponse();
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
      DescribeSecurityProfileResponse();
}

class DescribeStreamResponse {
  /// Information about the stream.
  final StreamInfo streamInfo;

  DescribeStreamResponse({
    this.streamInfo,
  });
  static DescribeStreamResponse fromJson(Map<String, dynamic> json) =>
      DescribeStreamResponse();
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
      DescribeThingGroupResponse();
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
      DescribeThingRegistrationTaskResponse();
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
      DescribeThingResponse();
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
      DescribeThingTypeResponse();
}

/// Describes the location of the updated firmware.
class Destination {
  /// Describes the location in S3 of the updated firmware.
  final S3Destination s3Destination;

  Destination({
    this.s3Destination,
  });
  static Destination fromJson(Map<String, dynamic> json) => Destination();
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
  static DynamoDBAction fromJson(Map<String, dynamic> json) => DynamoDBAction();
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
      DynamodBv2Action();
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
  static EffectivePolicy fromJson(Map<String, dynamic> json) =>
      EffectivePolicy();
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
      ElasticsearchAction();
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
      EnableIotLoggingParams();
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
  static ErrorInfo fromJson(Map<String, dynamic> json) => ErrorInfo();
}

/// Information that explicitly denies authorization.
class ExplicitDeny {
  /// The policies that denied the authorization.
  final List<Policy> policies;

  ExplicitDeny({
    this.policies,
  });
  static ExplicitDeny fromJson(Map<String, dynamic> json) => ExplicitDeny();
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
      ExponentialRolloutRate();
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
  static FileLocation fromJson(Map<String, dynamic> json) => FileLocation();
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
  static FirehoseAction fromJson(Map<String, dynamic> json) => FirehoseAction();
}

class GetEffectivePoliciesResponse {
  /// The effective policies.
  final List<EffectivePolicy> effectivePolicies;

  GetEffectivePoliciesResponse({
    this.effectivePolicies,
  });
  static GetEffectivePoliciesResponse fromJson(Map<String, dynamic> json) =>
      GetEffectivePoliciesResponse();
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
      GetIndexingConfigurationResponse();
}

class GetJobDocumentResponse {
  /// The job document content.
  final String document;

  GetJobDocumentResponse({
    this.document,
  });
  static GetJobDocumentResponse fromJson(Map<String, dynamic> json) =>
      GetJobDocumentResponse();
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
      GetLoggingOptionsResponse();
}

class GetOtaUpdateResponse {
  /// The OTA update info.
  final OtaUpdateInfo otaUpdateInfo;

  GetOtaUpdateResponse({
    this.otaUpdateInfo,
  });
  static GetOtaUpdateResponse fromJson(Map<String, dynamic> json) =>
      GetOtaUpdateResponse();
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
      GetPolicyResponse();
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
      GetPolicyVersionResponse();
}

/// The output from the GetRegistrationCode operation.
class GetRegistrationCodeResponse {
  /// The CA certificate registration code.
  final String registrationCode;

  GetRegistrationCodeResponse({
    this.registrationCode,
  });
  static GetRegistrationCodeResponse fromJson(Map<String, dynamic> json) =>
      GetRegistrationCodeResponse();
}

class GetStatisticsResponse {
  /// The statistics returned by the Fleet Indexing service based on the query
  /// and aggregation field.
  final Statistics statistics;

  GetStatisticsResponse({
    this.statistics,
  });
  static GetStatisticsResponse fromJson(Map<String, dynamic> json) =>
      GetStatisticsResponse();
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
      GetTopicRuleResponse();
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
      GetV2LoggingOptionsResponse();
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
  static GroupNameAndArn fromJson(Map<String, dynamic> json) =>
      GroupNameAndArn();
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
  static ImplicitDeny fromJson(Map<String, dynamic> json) => ImplicitDeny();
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
      IotAnalyticsAction();
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
  static IotEventsAction fromJson(Map<String, dynamic> json) =>
      IotEventsAction();
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
  static Job fromJson(Map<String, dynamic> json) => Job();
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
  static JobExecution fromJson(Map<String, dynamic> json) => JobExecution();
}

/// Details of the job execution status.
class JobExecutionStatusDetails {
  /// The job execution status.
  final Map<String, String> detailsMap;

  JobExecutionStatusDetails({
    this.detailsMap,
  });
  static JobExecutionStatusDetails fromJson(Map<String, dynamic> json) =>
      JobExecutionStatusDetails();
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
      JobExecutionSummary();
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
      JobExecutionSummaryForJob();
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
      JobExecutionSummaryForThing();
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
      JobExecutionsRolloutConfig();
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
      JobProcessDetails();
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
  static JobSummary fromJson(Map<String, dynamic> json) => JobSummary();
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
  static KeyPair fromJson(Map<String, dynamic> json) => KeyPair();
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
  static KinesisAction fromJson(Map<String, dynamic> json) => KinesisAction();
}

/// Describes an action to invoke a Lambda function.
class LambdaAction {
  /// The ARN of the Lambda function.
  final String functionArn;

  LambdaAction({
    @required this.functionArn,
  });
  static LambdaAction fromJson(Map<String, dynamic> json) => LambdaAction();
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
      ListActiveViolationsResponse();
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
      ListAttachedPoliciesResponse();
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
      ListAuditFindingsResponse();
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
      ListAuditMitigationActionsExecutionsResponse();
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
      ListAuditMitigationActionsTasksResponse();
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
      ListAuditTasksResponse();
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
      ListAuthorizersResponse();
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
      ListBillingGroupsResponse();
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
      ListCACertificatesResponse();
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
      ListCertificatesByCAResponse();
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
      ListCertificatesResponse();
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
      ListIndicesResponse();
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
      ListJobExecutionsForJobResponse();
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
      ListJobExecutionsForThingResponse();
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
      ListJobsResponse();
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
      ListMitigationActionsResponse();
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
      ListOtaUpdatesResponse();
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
      ListOutgoingCertificatesResponse();
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
      ListPoliciesResponse();
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
      ListPolicyPrincipalsResponse();
}

/// The output from the ListPolicyVersions operation.
class ListPolicyVersionsResponse {
  /// The policy versions.
  final List<PolicyVersion> policyVersions;

  ListPolicyVersionsResponse({
    this.policyVersions,
  });
  static ListPolicyVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListPolicyVersionsResponse();
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
      ListPrincipalPoliciesResponse();
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
      ListPrincipalThingsResponse();
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
      ListRoleAliasesResponse();
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
      ListScheduledAuditsResponse();
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
      ListSecurityProfilesForTargetResponse();
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
      ListSecurityProfilesResponse();
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
      ListStreamsResponse();
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
      ListTagsForResourceResponse();
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
      ListTargetsForPolicyResponse();
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
      ListTargetsForSecurityProfileResponse();
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
      ListThingGroupsForThingResponse();
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
      ListThingGroupsResponse();
}

/// The output from the ListThingPrincipals operation.
class ListThingPrincipalsResponse {
  /// The principals associated with the thing.
  final List<String> principals;

  ListThingPrincipalsResponse({
    this.principals,
  });
  static ListThingPrincipalsResponse fromJson(Map<String, dynamic> json) =>
      ListThingPrincipalsResponse();
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
      ListThingRegistrationTaskReportsResponse();
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
      ListThingRegistrationTasksResponse();
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
      ListThingTypesResponse();
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
      ListThingsInBillingGroupResponse();
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
      ListThingsInThingGroupResponse();
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
      ListThingsResponse();
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
      ListTopicRulesResponse();
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
      ListV2LoggingLevelsResponse();
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
      ListViolationEventsResponse();
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
  static LogTarget fromJson(Map<String, dynamic> json) => LogTarget();
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
      LogTargetConfiguration();
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
  static MetricValue fromJson(Map<String, dynamic> json) => MetricValue();
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
      MitigationAction();
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
      MitigationActionIdentifier();
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
      MitigationActionParams();
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
      NonCompliantResource();
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
  static OtaUpdateFile fromJson(Map<String, dynamic> json) => OtaUpdateFile();
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
  static OtaUpdateInfo fromJson(Map<String, dynamic> json) => OtaUpdateInfo();
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
      OtaUpdateSummary();
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
      OutgoingCertificate();
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
  static Policy fromJson(Map<String, dynamic> json) => Policy();
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
  static PolicyVersion fromJson(Map<String, dynamic> json) => PolicyVersion();
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
      PolicyVersionIdentifier();
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
      PresignedUrlConfig();
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
      PublishFindingToSnsParams();
}

/// The input for the DynamoActionVS action that specifies the DynamoDB table to
/// which the message data will be written.
class PutItemInput {
  /// The table where the message data will be written.
  final String tableName;

  PutItemInput({
    @required this.tableName,
  });
  static PutItemInput fromJson(Map<String, dynamic> json) => PutItemInput();
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
      RateIncreaseCriteria();
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
      RegisterCACertificateResponse();
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
      RegisterCertificateResponse();
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
      RegisterThingResponse();
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
      RegistrationConfig();
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
  static RelatedResource fromJson(Map<String, dynamic> json) =>
      RelatedResource();
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
      ReplaceDefaultPolicyVersionParams();
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
  static RepublishAction fromJson(Map<String, dynamic> json) =>
      RepublishAction();
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
      ResourceIdentifier();
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
      RoleAliasDescription();
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
  static S3Action fromJson(Map<String, dynamic> json) => S3Action();
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
  static S3Destination fromJson(Map<String, dynamic> json) => S3Destination();
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
  static S3Location fromJson(Map<String, dynamic> json) => S3Location();
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
      SalesforceAction();
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
      ScheduledAuditMetadata();
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
      SearchIndexResponse();
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
      SecurityProfileIdentifier();
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
      SecurityProfileTarget();
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
      SecurityProfileTargetMapping();
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
      SetDefaultAuthorizerResponse();
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
      SigningProfileParameter();
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
  static SnsAction fromJson(Map<String, dynamic> json) => SnsAction();
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
  static SqsAction fromJson(Map<String, dynamic> json) => SqsAction();
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
      StartAuditMitigationActionsTaskResponse();
}

class StartOnDemandAuditTaskResponse {
  /// The ID of the on-demand audit you started.
  final String taskId;

  StartOnDemandAuditTaskResponse({
    this.taskId,
  });
  static StartOnDemandAuditTaskResponse fromJson(Map<String, dynamic> json) =>
      StartOnDemandAuditTaskResponse();
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
      StartSigningJobParameter();
}

class StartThingRegistrationTaskResponse {
  /// The bulk thing provisioning task ID.
  final String taskId;

  StartThingRegistrationTaskResponse({
    this.taskId,
  });
  static StartThingRegistrationTaskResponse fromJson(
          Map<String, dynamic> json) =>
      StartThingRegistrationTaskResponse();
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
      StatisticalThreshold();
}

/// A map of key-value pairs for all supported statistics. Currently, only count
/// is supported.
class Statistics {
  /// The count of things that match the query.
  final int count;

  Statistics({
    this.count,
  });
  static Statistics fromJson(Map<String, dynamic> json) => Statistics();
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
      StepFunctionsAction();
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
  static Stream fromJson(Map<String, dynamic> json) => Stream();
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
  static StreamFile fromJson(Map<String, dynamic> json) => StreamFile();
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
  static StreamInfo fromJson(Map<String, dynamic> json) => StreamInfo();
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
  static StreamSummary fromJson(Map<String, dynamic> json) => StreamSummary();
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
  static Tag fromJson(Map<String, dynamic> json) => Tag();
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
  static TaskStatistics fromJson(Map<String, dynamic> json) => TaskStatistics();
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
      TaskStatisticsForAuditCheck();
}

class TestAuthorizationResponse {
  /// The authentication results.
  final List<AuthResult> authResults;

  TestAuthorizationResponse({
    this.authResults,
  });
  static TestAuthorizationResponse fromJson(Map<String, dynamic> json) =>
      TestAuthorizationResponse();
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
      TestInvokeAuthorizerResponse();
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
  static ThingAttribute fromJson(Map<String, dynamic> json) => ThingAttribute();
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
      ThingConnectivity();
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
  static ThingDocument fromJson(Map<String, dynamic> json) => ThingDocument();
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
      ThingGroupDocument();
}

/// Thing group indexing configuration.
class ThingGroupIndexingConfiguration {
  /// Thing group indexing mode.
  final String thingGroupIndexingMode;

  ThingGroupIndexingConfiguration({
    @required this.thingGroupIndexingMode,
  });
  static ThingGroupIndexingConfiguration fromJson(Map<String, dynamic> json) =>
      ThingGroupIndexingConfiguration();
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
      ThingGroupMetadata();
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
      ThingGroupProperties();
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
      ThingIndexingConfiguration();
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
      ThingTypeDefinition();
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
      ThingTypeMetadata();
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
      ThingTypeProperties();
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
  static TimeoutConfig fromJson(Map<String, dynamic> json) => TimeoutConfig();
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
  static TopicRule fromJson(Map<String, dynamic> json) => TopicRule();
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
      TopicRuleListItem();
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
}

/// The output from the TransferCertificate operation.
class TransferCertificateResponse {
  /// The ARN of the certificate.
  final String transferredCertificateArn;

  TransferCertificateResponse({
    this.transferredCertificateArn,
  });
  static TransferCertificateResponse fromJson(Map<String, dynamic> json) =>
      TransferCertificateResponse();
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
  static TransferData fromJson(Map<String, dynamic> json) => TransferData();
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
      UpdateAuthorizerResponse();
}

class UpdateBillingGroupResponse {
  /// The latest version of the billing group.
  final BigInt version;

  UpdateBillingGroupResponse({
    this.version,
  });
  static UpdateBillingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateBillingGroupResponse();
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
      UpdateCACertificateParams();
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
      UpdateDeviceCertificateParams();
}

class UpdateDynamicThingGroupResponse {
  /// The dynamic thing group version.
  final BigInt version;

  UpdateDynamicThingGroupResponse({
    this.version,
  });
  static UpdateDynamicThingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateDynamicThingGroupResponse();
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
      UpdateMitigationActionResponse();
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
      UpdateRoleAliasResponse();
}

class UpdateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  final String scheduledAuditArn;

  UpdateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  static UpdateScheduledAuditResponse fromJson(Map<String, dynamic> json) =>
      UpdateScheduledAuditResponse();
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
      UpdateSecurityProfileResponse();
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
      UpdateStreamResponse();
}

class UpdateThingGroupResponse {
  /// The version of the updated thing group.
  final BigInt version;

  UpdateThingGroupResponse({
    this.version,
  });
  static UpdateThingGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateThingGroupResponse();
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
      ValidateSecurityProfileBehaviorsResponse();
}

/// Information about an error found in a behavior specification.
class ValidationError {
  /// The description of an error found in the behaviors.
  final String errorMessage;

  ValidationError({
    this.errorMessage,
  });
  static ValidationError fromJson(Map<String, dynamic> json) =>
      ValidationError();
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
  static ViolationEvent fromJson(Map<String, dynamic> json) => ViolationEvent();
}
