import 'package:meta/meta.dart';

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
/// For more information about how AWS IoT works, see the [Developer
/// Guide](https://docs.aws.amazon.com/iot/latest/developerguide/aws-iot-how-it-works.html).
///
/// For information about how to use the credentials provider for AWS IoT, see
/// [Authorizing Direct Calls to AWS
/// Services](https://docs.aws.amazon.com/iot/latest/developerguide/authorizing-direct-aws.html).
class IotApi {
  /// Accepts a pending certificate transfer. The default state of the
  /// certificate is INACTIVE.
  ///
  /// To check for pending certificate transfers, call ListCertificates to
  /// enumerate your certificates.
  Future<void> acceptCertificateTransfer(String certificateId,
      {bool setAsActive}) async {}

  /// Adds a thing to a billing group.
  Future<void> addThingToBillingGroup(
      {String billingGroupName,
      String billingGroupArn,
      String thingName,
      String thingArn}) async {}

  /// Adds a thing to a thing group.
  Future<void> addThingToThingGroup(
      {String thingGroupName,
      String thingGroupArn,
      String thingName,
      String thingArn,
      bool overrideDynamicGroups}) async {}

  /// Associates a group with a continuous job. The following criteria must be
  /// met:
  ///
  /// *   The job must have been created with the `targetSelection` field set to
  /// "CONTINUOUS".
  ///
  /// *   The job status must currently be "IN_PROGRESS".
  ///
  /// *   The total number of targets associated with a job must not exceed 100.
  Future<void> associateTargetsWithJob(
      {@required List<String> targets,
      @required String jobId,
      String comment}) async {}

  /// Attaches a policy to the specified target.
  Future<void> attachPolicy(
      {@required String policyName, @required String target}) async {}

  /// Attaches the specified policy to the specified principal (certificate or
  /// other credential).
  ///
  ///  **Note:** This API is deprecated. Please use AttachPolicy instead.
  Future<void> attachPrincipalPolicy(
      {@required String policyName, @required String principal}) async {}

  /// Associates a Device Defender security profile with a thing group or this
  /// account. Each thing group or account can have up to five security profiles
  /// associated with it.
  Future<void> attachSecurityProfile(
      {@required String securityProfileName,
      @required String securityProfileTargetArn}) async {}

  /// Attaches the specified principal to the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  Future<void> attachThingPrincipal(
      {@required String thingName, @required String principal}) async {}

  /// Cancels a mitigation action task that is in progress. If the task is not
  /// in progress, an InvalidRequestException occurs.
  Future<void> cancelAuditMitigationActionsTask(String taskId) async {}

  /// Cancels an audit that is in progress. The audit can be either scheduled or
  /// on-demand. If the audit is not in progress, an "InvalidRequestException"
  /// occurs.
  Future<void> cancelAuditTask(String taskId) async {}

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
  Future<void> cancelCertificateTransfer(String certificateId) async {}

  /// Cancels a job.
  Future<void> cancelJob(String jobId,
      {String reasonCode, String comment, bool force}) async {}

  /// Cancels the execution of a job for a given thing.
  Future<void> cancelJobExecution(
      {@required String jobId,
      @required String thingName,
      bool force,
      BigInt expectedVersion,
      Map<String, String> statusDetails}) async {}

  /// Clears the default authorizer.
  Future<void> clearDefaultAuthorizer() async {}

  /// Creates an authorizer.
  Future<void> createAuthorizer(
      {@required String authorizerName,
      @required String authorizerFunctionArn,
      @required String tokenKeyName,
      @required Map<String, String> tokenSigningPublicKeys,
      String status}) async {}

  /// Creates a billing group.
  Future<void> createBillingGroup(String billingGroupName,
      {BillingGroupProperties billingGroupProperties, List<Tag> tags}) async {}

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
  /// \> ls -Name my-csr-directory | %{aws iot create-certificate-from-csr
  /// --certificate-signing-request file://my-csr-directory/$_}
  ///
  /// On a Windows command prompt, the command to create certificates for all
  /// CSRs in my-csr-directory is:
  ///
  /// \> forfiles /p my-csr-directory /c "cmd /c aws iot
  /// create-certificate-from-csr --certificate-signing-request file://@path"
  Future<void> createCertificateFromCsr(String certificateSigningRequest,
      {bool setAsActive}) async {}

  /// Creates a dynamic thing group.
  Future<void> createDynamicThingGroup(
      {@required String thingGroupName,
      ThingGroupProperties thingGroupProperties,
      String indexName,
      @required String queryString,
      String queryVersion,
      List<Tag> tags}) async {}

  /// Creates a job.
  Future<void> createJob(
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
      List<Tag> tags}) async {}

  /// Creates a 2048-bit RSA key pair and issues an X.509 certificate using the
  /// issued public key.
  ///
  ///  **Note** This is the only time AWS IoT issues the private key for this
  /// certificate, so it is important to keep it in a secure location.
  Future<void> createKeysAndCertificate({bool setAsActive}) async {}

  /// Defines an action that can be applied to audit findings by using
  /// StartAuditMitigationActionsTask. Each mitigation action can apply only one
  /// type of change.
  Future<void> createMitigationAction(
      {@required String actionName,
      @required String roleArn,
      @required MitigationActionParams actionParams,
      List<Tag> tags}) async {}

  /// Creates an AWS IoT OTAUpdate on a target group of things or groups.
  Future<void> createOtaUpdate(
      {@required String otaUpdateId,
      String description,
      @required List<String> targets,
      String targetSelection,
      AwsJobExecutionsRolloutConfig awsJobExecutionsRolloutConfig,
      @required List<OtaUpdateFile> files,
      @required String roleArn,
      Map<String, String> additionalParameters,
      List<Tag> tags}) async {}

  /// Creates an AWS IoT policy.
  ///
  /// The created policy is the default version for the policy. This operation
  /// creates a policy version with a version identifier of **1** and sets **1**
  /// as the policy's default version.
  Future<void> createPolicy(
      {@required String policyName, @required String policyDocument}) async {}

  /// Creates a new version of the specified AWS IoT policy. To update a policy,
  /// create a new policy version. A managed policy can have up to five
  /// versions. If the policy has five versions, you must use
  /// DeletePolicyVersion to delete an existing version before you create a new
  /// one.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the operative version (that is, the version that is
  /// in effect for the certificates to which the policy is attached).
  Future<void> createPolicyVersion(
      {@required String policyName,
      @required String policyDocument,
      bool setAsDefault}) async {}

  /// Creates a role alias.
  Future<void> createRoleAlias(
      {@required String roleAlias,
      @required String roleArn,
      int credentialDurationSeconds}) async {}

  /// Creates a scheduled audit that is run at a specified time interval.
  Future<void> createScheduledAudit(
      {@required String frequency,
      String dayOfMonth,
      String dayOfWeek,
      @required List<String> targetCheckNames,
      @required String scheduledAuditName,
      List<Tag> tags}) async {}

  /// Creates a Device Defender security profile.
  Future<void> createSecurityProfile(String securityProfileName,
      {String securityProfileDescription,
      List<Behavior> behaviors,
      Map<String, AlertTarget> alertTargets,
      List<String> additionalMetricsToRetain,
      List<Tag> tags}) async {}

  /// Creates a stream for delivering one or more large files in chunks over
  /// MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT
  /// messages from a source like S3. You can have one or more files associated
  /// with a stream. The total size of a file associated with the stream cannot
  /// exceed more than 2 MB. The stream will be created with version 0. If a
  /// stream is created with the same streamID as a stream that existed and was
  /// deleted within last 90 days, we will resurrect that old stream by
  /// incrementing the version by 1.
  Future<void> createStream(
      {@required String streamId,
      String description,
      @required List<StreamFile> files,
      @required String roleArn,
      List<Tag> tags}) async {}

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
  Future<void> createThing(String thingName,
      {String thingTypeName,
      AttributePayload attributePayload,
      String billingGroupName}) async {}

  /// Create a thing group.
  ///
  ///
  ///
  /// This is a control plane operation. See
  /// [Authorization](https://docs.aws.amazon.com/iot/latest/developerguide/authorization.html)
  /// for information about authorizing control plane actions.
  Future<void> createThingGroup(String thingGroupName,
      {String parentGroupName,
      ThingGroupProperties thingGroupProperties,
      List<Tag> tags}) async {}

  /// Creates a new thing type.
  Future<void> createThingType(String thingTypeName,
      {ThingTypeProperties thingTypeProperties, List<Tag> tags}) async {}

  /// Creates a rule. Creating rules is an administrator-level action. Any user
  /// who has permission to create rules will be able to access data processed
  /// by the rule.
  Future<void> createTopicRule(
      {@required String ruleName,
      @required TopicRulePayload topicRulePayload,
      String tags}) async {}

  /// Restores the default settings for Device Defender audits for this account.
  /// Any configuration data you entered is deleted and all audit checks are
  /// reset to disabled.
  Future<void> deleteAccountAuditConfiguration(
      {bool deleteScheduledAudits}) async {}

  /// Deletes an authorizer.
  Future<void> deleteAuthorizer(String authorizerName) async {}

  /// Deletes the billing group.
  Future<void> deleteBillingGroup(String billingGroupName,
      {BigInt expectedVersion}) async {}

  /// Deletes a registered CA certificate.
  Future<void> deleteCACertificate(String certificateId) async {}

  /// Deletes the specified certificate.
  ///
  /// A certificate cannot be deleted if it has a policy or IoT thing attached
  /// to it or if its status is set to ACTIVE. To delete a certificate, first
  /// use the DetachPrincipalPolicy API to detach all policies. Next, use the
  /// UpdateCertificate API to set the certificate to the INACTIVE status.
  Future<void> deleteCertificate(String certificateId,
      {bool forceDelete}) async {}

  /// Deletes a dynamic thing group.
  Future<void> deleteDynamicThingGroup(String thingGroupName,
      {BigInt expectedVersion}) async {}

  /// Deletes a job and its related job executions.
  ///
  /// Deleting a job may take time, depending on the number of job executions
  /// created for the job and various other factors. While the job is being
  /// deleted, the status of the job will be shown as "DELETION\_IN\_PROGRESS".
  /// Attempting to delete or cancel a job whose status is already
  /// "DELETION\_IN\_PROGRESS" will result in an error.
  ///
  /// Only 10 jobs may have status "DELETION\_IN\_PROGRESS" at the same time, or
  /// a LimitExceededException will occur.
  Future<void> deleteJob(String jobId, {bool force}) async {}

  /// Deletes a job execution.
  Future<void> deleteJobExecution(
      {@required String jobId,
      @required String thingName,
      @required BigInt executionNumber,
      bool force}) async {}

  /// Deletes a defined mitigation action from your AWS account.
  Future<void> deleteMitigationAction(String actionName) async {}

  /// Delete an OTA update.
  Future<void> deleteOtaUpdate(String otaUpdateId,
      {bool deleteStream, bool forceDeleteAwsJob}) async {}

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
  Future<void> deletePolicy(String policyName) async {}

  /// Deletes the specified version of the specified policy. You cannot delete
  /// the default version of a policy using this API. To delete the default
  /// version of a policy, use DeletePolicy. To find out which version of a
  /// policy is marked as the default version, use ListPolicyVersions.
  Future<void> deletePolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {}

  /// Deletes a CA certificate registration code.
  Future<void> deleteRegistrationCode() async {}

  /// Deletes a role alias
  Future<void> deleteRoleAlias(String roleAlias) async {}

  /// Deletes a scheduled audit.
  Future<void> deleteScheduledAudit(String scheduledAuditName) async {}

  /// Deletes a Device Defender security profile.
  Future<void> deleteSecurityProfile(String securityProfileName,
      {BigInt expectedVersion}) async {}

  /// Deletes a stream.
  Future<void> deleteStream(String streamId) async {}

  /// Deletes the specified thing. Returns successfully with no error if the
  /// deletion is successful or you specify a thing that doesn't exist.
  Future<void> deleteThing(String thingName, {BigInt expectedVersion}) async {}

  /// Deletes a thing group.
  Future<void> deleteThingGroup(String thingGroupName,
      {BigInt expectedVersion}) async {}

  /// Deletes the specified thing type. You cannot delete a thing type if it has
  /// things associated with it. To delete a thing type, first mark it as
  /// deprecated by calling DeprecateThingType, then remove any associated
  /// things by calling UpdateThing to change the thing type on any associated
  /// thing, and finally use DeleteThingType to delete the thing type.
  Future<void> deleteThingType(String thingTypeName) async {}

  /// Deletes the rule.
  Future<void> deleteTopicRule(String ruleName) async {}

  /// Deletes a logging level.
  Future<void> deleteV2LoggingLevel(
      {@required String targetType, @required String targetName}) async {}

  /// Deprecates a thing type. You can not associate new things with deprecated
  /// thing type.
  Future<void> deprecateThingType(String thingTypeName,
      {bool undoDeprecate}) async {}

  /// Gets information about the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  Future<void> describeAccountAuditConfiguration() async {}

  /// Gets information about a single audit finding. Properties include the
  /// reason for noncompliance, the severity of the issue, and when the audit
  /// that returned the finding was started.
  Future<void> describeAuditFinding(String findingId) async {}

  /// Gets information about an audit mitigation task that is used to apply
  /// mitigation actions to a set of audit findings. Properties include the
  /// actions being applied, the audit checks to which they're being applied,
  /// the task status, and aggregated task statistics.
  Future<void> describeAuditMitigationActionsTask(String taskId) async {}

  /// Gets information about a Device Defender audit.
  Future<void> describeAuditTask(String taskId) async {}

  /// Describes an authorizer.
  Future<void> describeAuthorizer(String authorizerName) async {}

  /// Returns information about a billing group.
  Future<void> describeBillingGroup(String billingGroupName) async {}

  /// Describes a registered CA certificate.
  Future<void> describeCACertificate(String certificateId) async {}

  /// Gets information about the specified certificate.
  Future<void> describeCertificate(String certificateId) async {}

  /// Describes the default authorizer.
  Future<void> describeDefaultAuthorizer() async {}

  /// Returns a unique endpoint specific to the AWS account making the call.
  Future<void> describeEndpoint({String endpointType}) async {}

  /// Describes event configurations.
  Future<void> describeEventConfigurations() async {}

  /// Describes a search index.
  Future<void> describeIndex(String indexName) async {}

  /// Describes a job.
  Future<void> describeJob(String jobId) async {}

  /// Describes a job execution.
  Future<void> describeJobExecution(
      {@required String jobId,
      @required String thingName,
      BigInt executionNumber}) async {}

  /// Gets information about a mitigation action.
  Future<void> describeMitigationAction(String actionName) async {}

  /// Describes a role alias.
  Future<void> describeRoleAlias(String roleAlias) async {}

  /// Gets information about a scheduled audit.
  Future<void> describeScheduledAudit(String scheduledAuditName) async {}

  /// Gets information about a Device Defender security profile.
  Future<void> describeSecurityProfile(String securityProfileName) async {}

  /// Gets information about a stream.
  Future<void> describeStream(String streamId) async {}

  /// Gets information about the specified thing.
  Future<void> describeThing(String thingName) async {}

  /// Describe a thing group.
  Future<void> describeThingGroup(String thingGroupName) async {}

  /// Describes a bulk thing provisioning task.
  Future<void> describeThingRegistrationTask(String taskId) async {}

  /// Gets information about the specified thing type.
  Future<void> describeThingType(String thingTypeName) async {}

  /// Detaches a policy from the specified target.
  Future<void> detachPolicy(
      {@required String policyName, @required String target}) async {}

  /// Removes the specified policy from the specified certificate.
  ///
  ///  **Note:** This API is deprecated. Please use DetachPolicy instead.
  Future<void> detachPrincipalPolicy(
      {@required String policyName, @required String principal}) async {}

  /// Disassociates a Device Defender security profile from a thing group or
  /// from this account.
  Future<void> detachSecurityProfile(
      {@required String securityProfileName,
      @required String securityProfileTargetArn}) async {}

  /// Detaches the specified principal from the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  ///
  ///
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  Future<void> detachThingPrincipal(
      {@required String thingName, @required String principal}) async {}

  /// Disables the rule.
  Future<void> disableTopicRule(String ruleName) async {}

  /// Enables the rule.
  Future<void> enableTopicRule(String ruleName) async {}

  /// Gets a list of the policies that have an effect on the authorization
  /// behavior of the specified device when it connects to the AWS IoT device
  /// gateway.
  Future<void> getEffectivePolicies(
      {String principal,
      String cognitoIdentityPoolId,
      String thingName}) async {}

  /// Gets the search configuration.
  Future<void> getIndexingConfiguration() async {}

  /// Gets a job document.
  Future<void> getJobDocument(String jobId) async {}

  /// Gets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `GetV2LoggingOptions`
  /// instead.
  Future<void> getLoggingOptions() async {}

  /// Gets an OTA update.
  Future<void> getOtaUpdate(String otaUpdateId) async {}

  /// Gets information about the specified policy with the policy document of
  /// the default version.
  Future<void> getPolicy(String policyName) async {}

  /// Gets information about the specified policy version.
  Future<void> getPolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {}

  /// Gets a registration code used to register a CA certificate with AWS IoT.
  Future<void> getRegistrationCode() async {}

  /// Gets statistics about things that match the specified query.
  Future<void> getStatistics(String queryString,
      {String indexName, String aggregationField, String queryVersion}) async {}

  /// Gets information about the rule.
  Future<void> getTopicRule(String ruleName) async {}

  /// Gets the fine grained logging options.
  Future<void> getV2LoggingOptions() async {}

  /// Lists the active violations for a given Device Defender security profile.
  Future<void> listActiveViolations(
      {String thingName,
      String securityProfileName,
      String nextToken,
      int maxResults}) async {}

  /// Lists the policies attached to the specified thing group.
  Future<void> listAttachedPolicies(String target,
      {bool recursive, String marker, int pageSize}) async {}

  /// Lists the findings (results) of a Device Defender audit or of the audits
  /// performed during a specified time period. (Findings are retained for 180
  /// days.)
  Future<void> listAuditFindings(
      {String taskId,
      String checkName,
      ResourceIdentifier resourceIdentifier,
      int maxResults,
      String nextToken,
      DateTime startTime,
      DateTime endTime}) async {}

  /// Gets the status of audit mitigation action tasks that were executed.
  Future<void> listAuditMitigationActionsExecutions(
      {@required String taskId,
      String actionStatus,
      @required String findingId,
      int maxResults,
      String nextToken}) async {}

  /// Gets a list of audit mitigation action tasks that match the specified
  /// filters.
  Future<void> listAuditMitigationActionsTasks(
      {String auditTaskId,
      String findingId,
      String taskStatus,
      int maxResults,
      String nextToken,
      @required DateTime startTime,
      @required DateTime endTime}) async {}

  /// Lists the Device Defender audits that have been performed during a given
  /// time period.
  Future<void> listAuditTasks(
      {@required DateTime startTime,
      @required DateTime endTime,
      String taskType,
      String taskStatus,
      String nextToken,
      int maxResults}) async {}

  /// Lists the authorizers registered in your account.
  Future<void> listAuthorizers(
      {int pageSize,
      String marker,
      bool ascendingOrder,
      String status}) async {}

  /// Lists the billing groups you have created.
  Future<void> listBillingGroups(
      {String nextToken, int maxResults, String namePrefixFilter}) async {}

  /// Lists the CA certificates registered for your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  Future<void> listCACertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {}

  /// Lists the certificates registered in your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  Future<void> listCertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {}

  /// List the device certificates signed by the specified CA certificate.
  Future<void> listCertificatesByCA(String caCertificateId,
      {int pageSize, String marker, bool ascendingOrder}) async {}

  /// Lists the search indices.
  Future<void> listIndices({String nextToken, int maxResults}) async {}

  /// Lists the job executions for a job.
  Future<void> listJobExecutionsForJob(String jobId,
      {String status, int maxResults, String nextToken}) async {}

  /// Lists the job executions for the specified thing.
  Future<void> listJobExecutionsForThing(String thingName,
      {String status, int maxResults, String nextToken}) async {}

  /// Lists jobs.
  Future<void> listJobs(
      {String status,
      String targetSelection,
      int maxResults,
      String nextToken,
      String thingGroupName,
      String thingGroupId}) async {}

  /// Gets a list of all mitigation actions that match the specified filter
  /// criteria.
  Future<void> listMitigationActions(
      {String actionType, int maxResults, String nextToken}) async {}

  /// Lists OTA updates.
  Future<void> listOtaUpdates(
      {int maxResults, String nextToken, String otaUpdateStatus}) async {}

  /// Lists certificates that are being transferred but not yet accepted.
  Future<void> listOutgoingCertificates(
      {int pageSize, String marker, bool ascendingOrder}) async {}

  /// Lists your policies.
  Future<void> listPolicies(
      {String marker, int pageSize, bool ascendingOrder}) async {}

  /// Lists the principals associated with the specified policy.
  ///
  ///  **Note:** This API is deprecated. Please use ListTargetsForPolicy
  /// instead.
  Future<void> listPolicyPrincipals(String policyName,
      {String marker, int pageSize, bool ascendingOrder}) async {}

  /// Lists the versions of the specified policy and identifies the default
  /// version.
  Future<void> listPolicyVersions(String policyName) async {}

  /// Lists the policies attached to the specified principal. If you use an
  /// Cognito identity, the ID must be in [AmazonCognito Identity
  /// format](https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax).
  ///
  ///  **Note:** This API is deprecated. Please use ListAttachedPolicies
  /// instead.
  Future<void> listPrincipalPolicies(String principal,
      {String marker, int pageSize, bool ascendingOrder}) async {}

  /// Lists the things associated with the specified principal. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  Future<void> listPrincipalThings(String principal,
      {String nextToken, int maxResults}) async {}

  /// Lists the role aliases registered in your account.
  Future<void> listRoleAliases(
      {int pageSize, String marker, bool ascendingOrder}) async {}

  /// Lists all of your scheduled audits.
  Future<void> listScheduledAudits({String nextToken, int maxResults}) async {}

  /// Lists the Device Defender security profiles you have created. You can use
  /// filters to list only those security profiles associated with a thing group
  /// or only those associated with your account.
  Future<void> listSecurityProfiles({String nextToken, int maxResults}) async {}

  /// Lists the Device Defender security profiles attached to a target (thing
  /// group).
  Future<void> listSecurityProfilesForTarget(String securityProfileTargetArn,
      {String nextToken, int maxResults, bool recursive}) async {}

  /// Lists all of the streams in your AWS account.
  Future<void> listStreams(
      {int maxResults, String nextToken, bool ascendingOrder}) async {}

  /// Lists the tags (metadata) you have assigned to the resource.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken}) async {}

  /// List targets for the specified policy.
  Future<void> listTargetsForPolicy(String policyName,
      {String marker, int pageSize}) async {}

  /// Lists the targets (thing groups) associated with a given Device Defender
  /// security profile.
  Future<void> listTargetsForSecurityProfile(String securityProfileName,
      {String nextToken, int maxResults}) async {}

  /// List the thing groups in your account.
  Future<void> listThingGroups(
      {String nextToken,
      int maxResults,
      String parentGroup,
      String namePrefixFilter,
      bool recursive}) async {}

  /// List the thing groups to which the specified thing belongs.
  Future<void> listThingGroupsForThing(String thingName,
      {String nextToken, int maxResults}) async {}

  /// Lists the principals associated with the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  Future<void> listThingPrincipals(String thingName) async {}

  /// Information about the thing registration tasks.
  Future<void> listThingRegistrationTaskReports(
      {@required String taskId,
      @required String reportType,
      String nextToken,
      int maxResults}) async {}

  /// List bulk thing provisioning tasks.
  Future<void> listThingRegistrationTasks(
      {String nextToken, int maxResults, String status}) async {}

  /// Lists the existing thing types.
  Future<void> listThingTypes(
      {String nextToken, int maxResults, String thingTypeName}) async {}

  /// Lists your things. Use the **attributeName** and **attributeValue**
  /// parameters to filter your things. For example, calling `ListThings` with
  /// attributeName=Color and attributeValue=Red retrieves all things in the
  /// registry that contain an attribute **Color** with the value **Red**.
  Future<void> listThings(
      {String nextToken,
      int maxResults,
      String attributeName,
      String attributeValue,
      String thingTypeName}) async {}

  /// Lists the things you have added to the given billing group.
  Future<void> listThingsInBillingGroup(String billingGroupName,
      {String nextToken, int maxResults}) async {}

  /// Lists the things in the specified group.
  Future<void> listThingsInThingGroup(String thingGroupName,
      {bool recursive, String nextToken, int maxResults}) async {}

  /// Lists the rules for the specific topic.
  Future<void> listTopicRules(
      {String topic,
      int maxResults,
      String nextToken,
      bool ruleDisabled}) async {}

  /// Lists logging levels.
  Future<void> listV2LoggingLevels(
      {String targetType, String nextToken, int maxResults}) async {}

  /// Lists the Device Defender security profile violations discovered during
  /// the given time period. You can use filters to limit the results to those
  /// alerts issued for a particular security profile, behavior, or thing
  /// (device).
  Future<void> listViolationEvents(
      {@required DateTime startTime,
      @required DateTime endTime,
      String thingName,
      String securityProfileName,
      String nextToken,
      int maxResults}) async {}

  /// Registers a CA certificate with AWS IoT. This CA certificate can then be
  /// used to sign device certificates, which can be then registered with AWS
  /// IoT. You can register up to 10 CA certificates per AWS account that have
  /// the same subject field. This enables you to have up to 10 certificate
  /// authorities sign your device certificates. If you have more than one CA
  /// certificate registered, make sure you pass the CA certificate when you
  /// register your device certificates with the RegisterCertificate API.
  Future<void> registerCACertificate(
      {@required String caCertificate,
      @required String verificationCertificate,
      bool setAsActive,
      bool allowAutoRegistration,
      RegistrationConfig registrationConfig}) async {}

  /// Registers a device certificate with AWS IoT. If you have more than one CA
  /// certificate that has the same subject field, you must specify the CA
  /// certificate that was used to sign the device certificate being registered.
  Future<void> registerCertificate(String certificatePem,
      {String caCertificatePem, bool setAsActive, String status}) async {}

  /// Provisions a thing.
  Future<void> registerThing(String templateBody,
      {Map<String, String> parameters}) async {}

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
  Future<void> rejectCertificateTransfer(String certificateId,
      {String rejectReason}) async {}

  /// Removes the given thing from the billing group.
  Future<void> removeThingFromBillingGroup(
      {String billingGroupName,
      String billingGroupArn,
      String thingName,
      String thingArn}) async {}

  /// Remove the specified thing from the specified group.
  Future<void> removeThingFromThingGroup(
      {String thingGroupName,
      String thingGroupArn,
      String thingName,
      String thingArn}) async {}

  /// Replaces the rule. You must specify all parameters for the new rule.
  /// Creating rules is an administrator-level action. Any user who has
  /// permission to create rules will be able to access data processed by the
  /// rule.
  Future<void> replaceTopicRule(
      {@required String ruleName,
      @required TopicRulePayload topicRulePayload}) async {}

  /// The query search index.
  Future<void> searchIndex(String queryString,
      {String indexName,
      String nextToken,
      int maxResults,
      String queryVersion}) async {}

  /// Sets the default authorizer. This will be used if a websocket connection
  /// is made without specifying an authorizer.
  Future<void> setDefaultAuthorizer(String authorizerName) async {}

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version. This action affects all certificates to which the
  /// policy is attached. To list the principals the policy is attached to, use
  /// the ListPrincipalPolicy API.
  Future<void> setDefaultPolicyVersion(
      {@required String policyName, @required String policyVersionId}) async {}

  /// Sets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use `SetV2LoggingOptions`
  /// instead.
  Future<void> setLoggingOptions(
      LoggingOptionsPayload loggingOptionsPayload) async {}

  /// Sets the logging level.
  Future<void> setV2LoggingLevel(
      {@required LogTarget logTarget, @required String logLevel}) async {}

  /// Sets the logging options for the V2 logging service.
  Future<void> setV2LoggingOptions(
      {String roleArn, String defaultLogLevel, bool disableAllLogs}) async {}

  /// Starts a task that applies a set of mitigation actions to the specified
  /// target.
  Future<void> startAuditMitigationActionsTask(
      {@required String taskId,
      @required AuditMitigationActionsTaskTarget target,
      @required Map<String, List<String>> auditCheckToActionsMapping,
      @required String clientRequestToken}) async {}

  /// Starts an on-demand Device Defender audit.
  Future<void> startOnDemandAuditTask(List<String> targetCheckNames) async {}

  /// Creates a bulk thing provisioning task.
  Future<void> startThingRegistrationTask(
      {@required String templateBody,
      @required String inputFileBucket,
      @required String inputFileKey,
      @required String roleArn}) async {}

  /// Cancels a bulk thing provisioning task.
  Future<void> stopThingRegistrationTask(String taskId) async {}

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Tests if a specified principal is authorized to perform an AWS IoT action
  /// on a specified resource. Use this to test and debug the authorization
  /// behavior of devices that connect to the AWS IoT device gateway.
  Future<void> testAuthorization(List<AuthInfo> authInfos,
      {String principal,
      String cognitoIdentityPoolId,
      String clientId,
      List<String> policyNamesToAdd,
      List<String> policyNamesToSkip}) async {}

  /// Tests a custom authorization behavior by invoking a specified custom
  /// authorizer. Use this to test and debug the custom authorization behavior
  /// of devices that connect to the AWS IoT device gateway.
  Future<void> testInvokeAuthorizer(
      {@required String authorizerName,
      @required String token,
      @required String tokenSignature}) async {}

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
  Future<void> transferCertificate(
      {@required String certificateId,
      @required String targetAwsAccount,
      String transferMessage}) async {}

  /// Removes the given tags (metadata) from the resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Configures or reconfigures the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  Future<void> updateAccountAuditConfiguration(
      {String roleArn,
      Map<String, AuditNotificationTarget>
          auditNotificationTargetConfigurations,
      Map<String, AuditCheckConfiguration> auditCheckConfigurations}) async {}

  /// Updates an authorizer.
  Future<void> updateAuthorizer(String authorizerName,
      {String authorizerFunctionArn,
      String tokenKeyName,
      Map<String, String> tokenSigningPublicKeys,
      String status}) async {}

  /// Updates information about the billing group.
  Future<void> updateBillingGroup(
      {@required String billingGroupName,
      @required BillingGroupProperties billingGroupProperties,
      BigInt expectedVersion}) async {}

  /// Updates a registered CA certificate.
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
  Future<void> updateCertificate(
      {@required String certificateId, @required String newStatus}) async {}

  /// Updates a dynamic thing group.
  Future<void> updateDynamicThingGroup(
      {@required String thingGroupName,
      @required ThingGroupProperties thingGroupProperties,
      BigInt expectedVersion,
      String indexName,
      String queryString,
      String queryVersion}) async {}

  /// Updates the event configurations.
  Future<void> updateEventConfigurations(
      {Map<String, Configuration> eventConfigurations}) async {}

  /// Updates the search configuration.
  Future<void> updateIndexingConfiguration(
      {ThingIndexingConfiguration thingIndexingConfiguration,
      ThingGroupIndexingConfiguration thingGroupIndexingConfiguration}) async {}

  /// Updates supported fields of the specified job.
  Future<void> updateJob(String jobId,
      {String description,
      PresignedUrlConfig presignedUrlConfig,
      JobExecutionsRolloutConfig jobExecutionsRolloutConfig,
      AbortConfig abortConfig,
      TimeoutConfig timeoutConfig}) async {}

  /// Updates the definition for the specified mitigation action.
  Future<void> updateMitigationAction(String actionName,
      {String roleArn, MitigationActionParams actionParams}) async {}

  /// Updates a role alias.
  Future<void> updateRoleAlias(String roleAlias,
      {String roleArn, int credentialDurationSeconds}) async {}

  /// Updates a scheduled audit, including which checks are performed and how
  /// often the audit takes place.
  Future<void> updateScheduledAudit(String scheduledAuditName,
      {String frequency,
      String dayOfMonth,
      String dayOfWeek,
      List<String> targetCheckNames}) async {}

  /// Updates a Device Defender security profile.
  Future<void> updateSecurityProfile(String securityProfileName,
      {String securityProfileDescription,
      List<Behavior> behaviors,
      Map<String, AlertTarget> alertTargets,
      List<String> additionalMetricsToRetain,
      bool deleteBehaviors,
      bool deleteAlertTargets,
      bool deleteAdditionalMetricsToRetain,
      BigInt expectedVersion}) async {}

  /// Updates an existing stream. The stream version will be incremented by one.
  Future<void> updateStream(String streamId,
      {String description, List<StreamFile> files, String roleArn}) async {}

  /// Updates the data for a thing.
  Future<void> updateThing(String thingName,
      {String thingTypeName,
      AttributePayload attributePayload,
      BigInt expectedVersion,
      bool removeThingType}) async {}

  /// Update a thing group.
  Future<void> updateThingGroup(
      {@required String thingGroupName,
      @required ThingGroupProperties thingGroupProperties,
      BigInt expectedVersion}) async {}

  /// Updates the groups to which the thing belongs.
  Future<void> updateThingGroupsForThing(
      {String thingName,
      List<String> thingGroupsToAdd,
      List<String> thingGroupsToRemove,
      bool overrideDynamicGroups}) async {}

  /// Validates a Device Defender security profile behaviors specification.
  Future<void> validateSecurityProfileBehaviors(
      List<Behavior> behaviors) async {}
}

class AbortConfig {}

class AbortCriteria {}

class Action {}

class ActiveViolation {}

class AddThingToBillingGroupResponse {}

class AddThingToThingGroupResponse {}

class AddThingsToThingGroupParams {}

class AlertTarget {}

class Allowed {}

class AssociateTargetsWithJobResponse {}

class AttachSecurityProfileResponse {}

class AttachThingPrincipalResponse {}

class AttributePayload {}

class AuditCheckConfiguration {}

class AuditCheckDetails {}

class AuditFinding {}

class AuditMitigationActionExecutionMetadata {}

class AuditMitigationActionsTaskMetadata {}

class AuditMitigationActionsTaskTarget {}

class AuditNotificationTarget {}

class AuditTaskMetadata {}

class AuthInfo {}

class AuthResult {}

class AuthorizerDescription {}

class AuthorizerSummary {}

class AwsJobExecutionsRolloutConfig {}

class Behavior {}

class BehaviorCriteria {}

class BillingGroupMetadata {}

class BillingGroupProperties {}

class CACertificate {}

class CACertificateDescription {}

class CancelAuditMitigationActionsTaskResponse {}

class CancelAuditTaskResponse {}

class CancelJobResponse {}

class Certificate {}

class CertificateDescription {}

class CertificateValidity {}

class ClearDefaultAuthorizerResponse {}

class CloudwatchAlarmAction {}

class CloudwatchMetricAction {}

class CodeSigning {}

class CodeSigningCertificateChain {}

class CodeSigningSignature {}

class Configuration {}

class CreateAuthorizerResponse {}

class CreateBillingGroupResponse {}

class CreateCertificateFromCsrResponse {}

class CreateDynamicThingGroupResponse {}

class CreateJobResponse {}

class CreateKeysAndCertificateResponse {}

class CreateMitigationActionResponse {}

class CreateOtaUpdateResponse {}

class CreatePolicyResponse {}

class CreatePolicyVersionResponse {}

class CreateRoleAliasResponse {}

class CreateScheduledAuditResponse {}

class CreateSecurityProfileResponse {}

class CreateStreamResponse {}

class CreateThingGroupResponse {}

class CreateThingResponse {}

class CreateThingTypeResponse {}

class CustomCodeSigning {}

class DeleteAccountAuditConfigurationResponse {}

class DeleteAuthorizerResponse {}

class DeleteBillingGroupResponse {}

class DeleteCACertificateResponse {}

class DeleteDynamicThingGroupResponse {}

class DeleteMitigationActionResponse {}

class DeleteOtaUpdateResponse {}

class DeleteRegistrationCodeResponse {}

class DeleteRoleAliasResponse {}

class DeleteScheduledAuditResponse {}

class DeleteSecurityProfileResponse {}

class DeleteStreamResponse {}

class DeleteThingGroupResponse {}

class DeleteThingResponse {}

class DeleteThingTypeResponse {}

class Denied {}

class DeprecateThingTypeResponse {}

class DescribeAccountAuditConfigurationResponse {}

class DescribeAuditFindingResponse {}

class DescribeAuditMitigationActionsTaskResponse {}

class DescribeAuditTaskResponse {}

class DescribeAuthorizerResponse {}

class DescribeBillingGroupResponse {}

class DescribeCACertificateResponse {}

class DescribeCertificateResponse {}

class DescribeDefaultAuthorizerResponse {}

class DescribeEndpointResponse {}

class DescribeEventConfigurationsResponse {}

class DescribeIndexResponse {}

class DescribeJobExecutionResponse {}

class DescribeJobResponse {}

class DescribeMitigationActionResponse {}

class DescribeRoleAliasResponse {}

class DescribeScheduledAuditResponse {}

class DescribeSecurityProfileResponse {}

class DescribeStreamResponse {}

class DescribeThingGroupResponse {}

class DescribeThingRegistrationTaskResponse {}

class DescribeThingResponse {}

class DescribeThingTypeResponse {}

class Destination {}

class DetachSecurityProfileResponse {}

class DetachThingPrincipalResponse {}

class DynamoDBAction {}

class DynamodBv2Action {}

class EffectivePolicy {}

class ElasticsearchAction {}

class EnableIotLoggingParams {}

class ErrorInfo {}

class ExplicitDeny {}

class ExponentialRolloutRate {}

class FileLocation {}

class FirehoseAction {}

class GetEffectivePoliciesResponse {}

class GetIndexingConfigurationResponse {}

class GetJobDocumentResponse {}

class GetLoggingOptionsResponse {}

class GetOtaUpdateResponse {}

class GetPolicyResponse {}

class GetPolicyVersionResponse {}

class GetRegistrationCodeResponse {}

class GetStatisticsResponse {}

class GetTopicRuleResponse {}

class GetV2LoggingOptionsResponse {}

class GroupNameAndArn {}

class ImplicitDeny {}

class IotAnalyticsAction {}

class IotEventsAction {}

class Job {}

class JobExecution {}

class JobExecutionStatusDetails {}

class JobExecutionSummary {}

class JobExecutionSummaryForJob {}

class JobExecutionSummaryForThing {}

class JobExecutionsRolloutConfig {}

class JobProcessDetails {}

class JobSummary {}

class KeyPair {}

class KinesisAction {}

class LambdaAction {}

class ListActiveViolationsResponse {}

class ListAttachedPoliciesResponse {}

class ListAuditFindingsResponse {}

class ListAuditMitigationActionsExecutionsResponse {}

class ListAuditMitigationActionsTasksResponse {}

class ListAuditTasksResponse {}

class ListAuthorizersResponse {}

class ListBillingGroupsResponse {}

class ListCACertificatesResponse {}

class ListCertificatesByCAResponse {}

class ListCertificatesResponse {}

class ListIndicesResponse {}

class ListJobExecutionsForJobResponse {}

class ListJobExecutionsForThingResponse {}

class ListJobsResponse {}

class ListMitigationActionsResponse {}

class ListOtaUpdatesResponse {}

class ListOutgoingCertificatesResponse {}

class ListPoliciesResponse {}

class ListPolicyPrincipalsResponse {}

class ListPolicyVersionsResponse {}

class ListPrincipalPoliciesResponse {}

class ListPrincipalThingsResponse {}

class ListRoleAliasesResponse {}

class ListScheduledAuditsResponse {}

class ListSecurityProfilesForTargetResponse {}

class ListSecurityProfilesResponse {}

class ListStreamsResponse {}

class ListTagsForResourceResponse {}

class ListTargetsForPolicyResponse {}

class ListTargetsForSecurityProfileResponse {}

class ListThingGroupsForThingResponse {}

class ListThingGroupsResponse {}

class ListThingPrincipalsResponse {}

class ListThingRegistrationTaskReportsResponse {}

class ListThingRegistrationTasksResponse {}

class ListThingTypesResponse {}

class ListThingsInBillingGroupResponse {}

class ListThingsInThingGroupResponse {}

class ListThingsResponse {}

class ListTopicRulesResponse {}

class ListV2LoggingLevelsResponse {}

class ListViolationEventsResponse {}

class LogTarget {}

class LogTargetConfiguration {}

class LoggingOptionsPayload {}

class MetricValue {}

class MitigationAction {}

class MitigationActionIdentifier {}

class MitigationActionParams {}

class NonCompliantResource {}

class OtaUpdateFile {}

class OtaUpdateInfo {}

class OtaUpdateSummary {}

class OutgoingCertificate {}

class Policy {}

class PolicyVersion {}

class PolicyVersionIdentifier {}

class PresignedUrlConfig {}

class PublishFindingToSnsParams {}

class PutItemInput {}

class RateIncreaseCriteria {}

class RegisterCACertificateResponse {}

class RegisterCertificateResponse {}

class RegisterThingResponse {}

class RegistrationConfig {}

class RelatedResource {}

class RemoveThingFromBillingGroupResponse {}

class RemoveThingFromThingGroupResponse {}

class ReplaceDefaultPolicyVersionParams {}

class RepublishAction {}

class ResourceIdentifier {}

class RoleAliasDescription {}

class S3Action {}

class S3Destination {}

class S3Location {}

class SalesforceAction {}

class ScheduledAuditMetadata {}

class SearchIndexResponse {}

class SecurityProfileIdentifier {}

class SecurityProfileTarget {}

class SecurityProfileTargetMapping {}

class SetDefaultAuthorizerResponse {}

class SigningProfileParameter {}

class SnsAction {}

class SqsAction {}

class StartAuditMitigationActionsTaskResponse {}

class StartOnDemandAuditTaskResponse {}

class StartSigningJobParameter {}

class StartThingRegistrationTaskResponse {}

class StatisticalThreshold {}

class Statistics {}

class StepFunctionsAction {}

class StopThingRegistrationTaskResponse {}

class Stream {}

class StreamFile {}

class StreamInfo {}

class StreamSummary {}

class Tag {}

class TagResourceResponse {}

class TaskStatistics {}

class TaskStatisticsForAuditCheck {}

class TestAuthorizationResponse {}

class TestInvokeAuthorizerResponse {}

class ThingAttribute {}

class ThingConnectivity {}

class ThingDocument {}

class ThingGroupDocument {}

class ThingGroupIndexingConfiguration {}

class ThingGroupMetadata {}

class ThingGroupProperties {}

class ThingIndexingConfiguration {}

class ThingTypeDefinition {}

class ThingTypeMetadata {}

class ThingTypeProperties {}

class TimeoutConfig {}

class TopicRule {}

class TopicRuleListItem {}

class TopicRulePayload {}

class TransferCertificateResponse {}

class TransferData {}

class UntagResourceResponse {}

class UpdateAccountAuditConfigurationResponse {}

class UpdateAuthorizerResponse {}

class UpdateBillingGroupResponse {}

class UpdateCACertificateParams {}

class UpdateDeviceCertificateParams {}

class UpdateDynamicThingGroupResponse {}

class UpdateEventConfigurationsResponse {}

class UpdateIndexingConfigurationResponse {}

class UpdateMitigationActionResponse {}

class UpdateRoleAliasResponse {}

class UpdateScheduledAuditResponse {}

class UpdateSecurityProfileResponse {}

class UpdateStreamResponse {}

class UpdateThingGroupResponse {}

class UpdateThingGroupsForThingResponse {}

class UpdateThingResponse {}

class ValidateSecurityProfileBehaviorsResponse {}

class ValidationError {}

class ViolationEvent {}
