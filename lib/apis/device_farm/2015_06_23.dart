import 'package:meta/meta.dart';

/// AWS Device Farm is a service that enables mobile app developers to test
/// Android, iOS, and Fire OS apps on physical phones, tablets, and other
/// devices in the cloud.
class DeviceFarmApi {
  /// Creates a device pool.
  Future<void> createDevicePool(
      {@required String projectArn,
      @required String name,
      String description,
      @required List<Rule> rules,
      int maxDevices}) async {}

  /// Creates a profile that can be applied to one or more private fleet device
  /// instances.
  Future<void> createInstanceProfile(String name,
      {String description,
      bool packageCleanup,
      List<String> excludeAppPackagesFromCleanup,
      bool rebootAfterUse}) async {}

  /// Creates a network profile.
  Future<void> createNetworkProfile(
      {@required String projectArn,
      @required String name,
      String description,
      String type,
      BigInt uplinkBandwidthBits,
      BigInt downlinkBandwidthBits,
      BigInt uplinkDelayMs,
      BigInt downlinkDelayMs,
      BigInt uplinkJitterMs,
      BigInt downlinkJitterMs,
      int uplinkLossPercent,
      int downlinkLossPercent}) async {}

  /// Creates a new project.
  Future<void> createProject(String name,
      {int defaultJobTimeoutMinutes}) async {}

  /// Specifies and starts a remote access session.
  Future<void> createRemoteAccessSession(
      {@required String projectArn,
      @required String deviceArn,
      String instanceArn,
      String sshPublicKey,
      bool remoteDebugEnabled,
      bool remoteRecordEnabled,
      String remoteRecordAppArn,
      String name,
      String clientId,
      CreateRemoteAccessSessionConfiguration configuration,
      String interactionMode,
      bool skipAppResign}) async {}

  /// Uploads an app or test scripts.
  Future<void> createUpload(
      {@required String projectArn,
      @required String name,
      @required String type,
      String contentType}) async {}

  /// Creates a configuration record in Device Farm for your Amazon Virtual
  /// Private Cloud (VPC) endpoint.
  Future<void> createVpceConfiguration(
      {@required String vpceConfigurationName,
      @required String vpceServiceName,
      @required String serviceDnsName,
      String vpceConfigurationDescription}) async {}

  /// Deletes a device pool given the pool ARN. Does not allow deletion of
  /// curated pools owned by the system.
  Future<void> deleteDevicePool(String arn) async {}

  /// Deletes a profile that can be applied to one or more private device
  /// instances.
  Future<void> deleteInstanceProfile(String arn) async {}

  /// Deletes a network profile.
  Future<void> deleteNetworkProfile(String arn) async {}

  /// Deletes an AWS Device Farm project, given the project ARN.
  ///
  ///  **Note** Deleting this resource does not stop an in-progress run.
  Future<void> deleteProject(String arn) async {}

  /// Deletes a completed remote access session and its results.
  Future<void> deleteRemoteAccessSession(String arn) async {}

  /// Deletes the run, given the run ARN.
  ///
  ///  **Note** Deleting this resource does not stop an in-progress run.
  Future<void> deleteRun(String arn) async {}

  /// Deletes an upload given the upload ARN.
  Future<void> deleteUpload(String arn) async {}

  /// Deletes a configuration for your Amazon Virtual Private Cloud (VPC)
  /// endpoint.
  Future<void> deleteVpceConfiguration(String arn) async {}

  /// Returns the number of unmetered iOS and/or unmetered Android devices that
  /// have been purchased by the account.
  Future<void> getAccountSettings() async {}

  /// Gets information about a unique device type.
  Future<void> getDevice(String arn) async {}

  /// Returns information about a device instance belonging to a private device
  /// fleet.
  Future<void> getDeviceInstance(String arn) async {}

  /// Gets information about a device pool.
  Future<void> getDevicePool(String arn) async {}

  /// Gets information about compatibility with a device pool.
  Future<void> getDevicePoolCompatibility(String devicePoolArn,
      {String appArn,
      String testType,
      ScheduleRunTest test,
      ScheduleRunConfiguration configuration}) async {}

  /// Returns information about the specified instance profile.
  Future<void> getInstanceProfile(String arn) async {}

  /// Gets information about a job.
  Future<void> getJob(String arn) async {}

  /// Returns information about a network profile.
  Future<void> getNetworkProfile(String arn) async {}

  /// Gets the current status and future status of all offerings purchased by an
  /// AWS account. The response indicates how many offerings are currently
  /// available and the offerings that will be available in the next period. The
  /// API returns a `NotEligible` error if the user is not permitted to invoke
  /// the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> getOfferingStatus({String nextToken}) async {}

  /// Gets information about a project.
  Future<void> getProject(String arn) async {}

  /// Returns a link to a currently running remote access session.
  Future<void> getRemoteAccessSession(String arn) async {}

  /// Gets information about a run.
  Future<void> getRun(String arn) async {}

  /// Gets information about a suite.
  Future<void> getSuite(String arn) async {}

  /// Gets information about a test.
  Future<void> getTest(String arn) async {}

  /// Gets information about an upload.
  Future<void> getUpload(String arn) async {}

  /// Returns information about the configuration settings for your Amazon
  /// Virtual Private Cloud (VPC) endpoint.
  Future<void> getVpceConfiguration(String arn) async {}

  /// Installs an application to the device in a remote access session. For
  /// Android applications, the file must be in .apk format. For iOS
  /// applications, the file must be in .ipa format.
  Future<void> installToRemoteAccessSession(
      {@required String remoteAccessSessionArn,
      @required String appArn}) async {}

  /// Gets information about artifacts.
  Future<void> listArtifacts(
      {@required String arn, @required String type, String nextToken}) async {}

  /// Returns information about the private device instances associated with one
  /// or more AWS accounts.
  Future<void> listDeviceInstances({int maxResults, String nextToken}) async {}

  /// Gets information about device pools.
  Future<void> listDevicePools(String arn,
      {String type, String nextToken}) async {}

  /// Gets information about unique device types.
  Future<void> listDevices(
      {String arn, String nextToken, List<DeviceFilter> filters}) async {}

  /// Returns information about all the instance profiles in an AWS account.
  Future<void> listInstanceProfiles({int maxResults, String nextToken}) async {}

  /// Gets information about jobs for a given test run.
  Future<void> listJobs(String arn, {String nextToken}) async {}

  /// Returns the list of available network profiles.
  Future<void> listNetworkProfiles(String arn,
      {String type, String nextToken}) async {}

  /// Returns a list of offering promotions. Each offering promotion record
  /// contains the ID and description of the promotion. The API returns a
  /// `NotEligible` error if the caller is not permitted to invoke the
  /// operation. Contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> listOfferingPromotions({String nextToken}) async {}

  /// Returns a list of all historical purchases, renewals, and system renewal
  /// transactions for an AWS account. The list is paginated and ordered by a
  /// descending timestamp (most recent transactions are first). The API returns
  /// a `NotEligible` error if the user is not permitted to invoke the
  /// operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> listOfferingTransactions({String nextToken}) async {}

  /// Returns a list of products or offerings that the user can manage through
  /// the API. Each offering record indicates the recurring price per unit and
  /// the frequency for that offering. The API returns a `NotEligible` error if
  /// the user is not permitted to invoke the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> listOfferings({String nextToken}) async {}

  /// Gets information about projects.
  Future<void> listProjects({String arn, String nextToken}) async {}

  /// Returns a list of all currently running remote access sessions.
  Future<void> listRemoteAccessSessions(String arn, {String nextToken}) async {}

  /// Gets information about runs, given an AWS Device Farm project ARN.
  Future<void> listRuns(String arn, {String nextToken}) async {}

  /// Gets information about samples, given an AWS Device Farm job ARN.
  Future<void> listSamples(String arn, {String nextToken}) async {}

  /// Gets information about test suites for a given job.
  Future<void> listSuites(String arn, {String nextToken}) async {}

  /// List the tags for an AWS Device Farm resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Gets information about tests in a given test suite.
  Future<void> listTests(String arn, {String nextToken}) async {}

  /// Gets information about unique problems.
  Future<void> listUniqueProblems(String arn, {String nextToken}) async {}

  /// Gets information about uploads, given an AWS Device Farm project ARN.
  Future<void> listUploads(String arn, {String type, String nextToken}) async {}

  /// Returns information about all Amazon Virtual Private Cloud (VPC) endpoint
  /// configurations in the AWS account.
  Future<void> listVpceConfigurations(
      {int maxResults, String nextToken}) async {}

  /// Immediately purchases offerings for an AWS account. Offerings renew with
  /// the latest total purchased quantity for an offering, unless the renewal
  /// was overridden. The API returns a `NotEligible` error if the user is not
  /// permitted to invoke the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> purchaseOffering(
      {String offeringId, int quantity, String offeringPromotionId}) async {}

  /// Explicitly sets the quantity of devices to renew for an offering, starting
  /// from the `effectiveDate` of the next period. The API returns a
  /// `NotEligible` error if the user is not permitted to invoke the operation.
  /// Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  Future<void> renewOffering({String offeringId, int quantity}) async {}

  /// Schedules a run.
  Future<void> scheduleRun(
      {@required String projectArn,
      String appArn,
      String devicePoolArn,
      DeviceSelectionConfiguration deviceSelectionConfiguration,
      String name,
      @required ScheduleRunTest test,
      ScheduleRunConfiguration configuration,
      ExecutionConfiguration executionConfiguration}) async {}

  /// Initiates a stop request for the current job. AWS Device Farm will
  /// immediately stop the job on the device where tests have not started
  /// executing, and you will not be billed for this device. On the device where
  /// tests have started executing, Setup Suite and Teardown Suite tests will
  /// run to completion before stopping execution on the device. You will be
  /// billed for Setup, Teardown, and any tests that were in progress or already
  /// completed.
  Future<void> stopJob(String arn) async {}

  /// Ends a specified remote access session.
  Future<void> stopRemoteAccessSession(String arn) async {}

  /// Initiates a stop request for the current test run. AWS Device Farm will
  /// immediately stop the run on devices where tests have not started
  /// executing, and you will not be billed for these devices. On devices where
  /// tests have started executing, Setup Suite and Teardown Suite tests will
  /// run to completion before stopping execution on those devices. You will be
  /// billed for Setup, Teardown, and any tests that were in progress or already
  /// completed.
  Future<void> stopRun(String arn) async {}

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Deletes the specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates information about an existing private device instance.
  Future<void> updateDeviceInstance(String arn,
      {String profileArn, List<String> labels}) async {}

  /// Modifies the name, description, and rules in a device pool given the
  /// attributes and the pool ARN. Rule updates are all-or-nothing, meaning they
  /// can only be updated as a whole (or not at all).
  Future<void> updateDevicePool(String arn,
      {String name,
      String description,
      List<Rule> rules,
      int maxDevices,
      bool clearMaxDevices}) async {}

  /// Updates information about an existing private device instance profile.
  Future<void> updateInstanceProfile(String arn,
      {String name,
      String description,
      bool packageCleanup,
      List<String> excludeAppPackagesFromCleanup,
      bool rebootAfterUse}) async {}

  /// Updates the network profile with specific settings.
  Future<void> updateNetworkProfile(String arn,
      {String name,
      String description,
      String type,
      BigInt uplinkBandwidthBits,
      BigInt downlinkBandwidthBits,
      BigInt uplinkDelayMs,
      BigInt downlinkDelayMs,
      BigInt uplinkJitterMs,
      BigInt downlinkJitterMs,
      int uplinkLossPercent,
      int downlinkLossPercent}) async {}

  /// Modifies the specified project name, given the project ARN and a new name.
  Future<void> updateProject(String arn,
      {String name, int defaultJobTimeoutMinutes}) async {}

  /// Update an uploaded test specification (test spec).
  Future<void> updateUpload(String arn,
      {String name, String contentType, bool editContent}) async {}

  /// Updates information about an existing Amazon Virtual Private Cloud (VPC)
  /// endpoint configuration.
  Future<void> updateVpceConfiguration(String arn,
      {String vpceConfigurationName,
      String vpceServiceName,
      String serviceDnsName,
      String vpceConfigurationDescription}) async {}
}

class AccountSettings {}

class Artifact {}

class Cpu {}

class Counters {}

class CreateDevicePoolResult {}

class CreateInstanceProfileResult {}

class CreateNetworkProfileResult {}

class CreateProjectResult {}

class CreateRemoteAccessSessionConfiguration {}

class CreateRemoteAccessSessionResult {}

class CreateUploadResult {}

class CreateVpceConfigurationResult {}

class CustomerArtifactPaths {}

class DeleteDevicePoolResult {}

class DeleteInstanceProfileResult {}

class DeleteNetworkProfileResult {}

class DeleteProjectResult {}

class DeleteRemoteAccessSessionResult {}

class DeleteRunResult {}

class DeleteUploadResult {}

class DeleteVpceConfigurationResult {}

class Device {}

class DeviceFilter {}

class DeviceInstance {}

class DeviceMinutes {}

class DevicePool {}

class DevicePoolCompatibilityResult {}

class DeviceSelectionConfiguration {}

class DeviceSelectionResult {}

class ExecutionConfiguration {}

class GetAccountSettingsResult {}

class GetDeviceInstanceResult {}

class GetDevicePoolCompatibilityResult {}

class GetDevicePoolResult {}

class GetDeviceResult {}

class GetInstanceProfileResult {}

class GetJobResult {}

class GetNetworkProfileResult {}

class GetOfferingStatusResult {}

class GetProjectResult {}

class GetRemoteAccessSessionResult {}

class GetRunResult {}

class GetSuiteResult {}

class GetTestResult {}

class GetUploadResult {}

class GetVpceConfigurationResult {}

class IncompatibilityMessage {}

class InstallToRemoteAccessSessionResult {}

class InstanceProfile {}

class Job {}

class ListArtifactsResult {}

class ListDeviceInstancesResult {}

class ListDevicePoolsResult {}

class ListDevicesResult {}

class ListInstanceProfilesResult {}

class ListJobsResult {}

class ListNetworkProfilesResult {}

class ListOfferingPromotionsResult {}

class ListOfferingTransactionsResult {}

class ListOfferingsResult {}

class ListProjectsResult {}

class ListRemoteAccessSessionsResult {}

class ListRunsResult {}

class ListSamplesResult {}

class ListSuitesResult {}

class ListTagsForResourceResponse {}

class ListTestsResult {}

class ListUniqueProblemsResult {}

class ListUploadsResult {}

class ListVpceConfigurationsResult {}

class Location {}

class MonetaryAmount {}

class NetworkProfile {}

class Offering {}

class OfferingPromotion {}

class OfferingStatus {}

class OfferingTransaction {}

class Problem {}

class ProblemDetail {}

class Project {}

class PurchaseOfferingResult {}

class Radios {}

class RecurringCharge {}

class RemoteAccessSession {}

class RenewOfferingResult {}

class Resolution {}

class Rule {}

class Run {}

class Sample {}

class ScheduleRunConfiguration {}

class ScheduleRunResult {}

class ScheduleRunTest {}

class StopJobResult {}

class StopRemoteAccessSessionResult {}

class StopRunResult {}

class Suite {}

class Tag {}

class TagResourceResponse {}

class Test {}

class TrialMinutes {}

class UniqueProblem {}

class UntagResourceResponse {}

class UpdateDeviceInstanceResult {}

class UpdateDevicePoolResult {}

class UpdateInstanceProfileResult {}

class UpdateNetworkProfileResult {}

class UpdateProjectResult {}

class UpdateUploadResult {}

class UpdateVpceConfigurationResult {}

class Upload {}

class VpceConfiguration {}
