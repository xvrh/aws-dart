import 'package:meta/meta.dart';

/// AWS Device Farm is a service that enables mobile app developers to test
/// Android, iOS, and Fire OS apps on physical phones, tablets, and other
/// devices in the cloud.
class DeviceFarmApi {
  /// Creates a device pool.
  ///
  /// [projectArn]: The ARN of the project for the device pool.
  ///
  /// [name]: The device pool's name.
  ///
  /// [description]: The device pool's description.
  ///
  /// [rules]: The device pool's rules.
  ///
  /// [maxDevices]: The number of devices that Device Farm can add to your
  /// device pool. Device Farm adds devices that are available and that meet the
  /// criteria that you assign for the `rules` parameter. Depending on how many
  /// devices meet these constraints, your device pool might contain fewer
  /// devices than the value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs
  /// that you incur by running tests.
  Future<CreateDevicePoolResult> createDevicePool(
      {@required String projectArn,
      @required String name,
      String description,
      @required List<Rule> rules,
      int maxDevices}) async {
    return CreateDevicePoolResult.fromJson({});
  }

  /// Creates a profile that can be applied to one or more private fleet device
  /// instances.
  ///
  /// [name]: The name of your instance profile.
  ///
  /// [description]: The description of your instance profile.
  ///
  /// [packageCleanup]: When set to `true`, Device Farm will remove app packages
  /// after a test run. The default value is `false` for private devices.
  ///
  /// [excludeAppPackagesFromCleanup]: An array of strings specifying the list
  /// of app packages that should not be cleaned up from the device after a test
  /// run is over.
  ///
  /// The list of packages is only considered if you set `packageCleanup` to
  /// `true`.
  ///
  /// [rebootAfterUse]: When set to `true`, Device Farm will reboot the instance
  /// after a test run. The default value is `true`.
  Future<CreateInstanceProfileResult> createInstanceProfile(String name,
      {String description,
      bool packageCleanup,
      List<String> excludeAppPackagesFromCleanup,
      bool rebootAfterUse}) async {
    return CreateInstanceProfileResult.fromJson({});
  }

  /// Creates a network profile.
  ///
  /// [projectArn]: The Amazon Resource Name (ARN) of the project for which you
  /// want to create a network profile.
  ///
  /// [name]: The name you wish to specify for the new network profile.
  ///
  /// [description]: The description of the network profile.
  ///
  /// [type]: The type of network profile you wish to create. Valid values are
  /// listed below.
  ///
  /// [uplinkBandwidthBits]: The data throughput rate in bits per second, as an
  /// integer from 0 to 104857600.
  ///
  /// [downlinkBandwidthBits]: The data throughput rate in bits per second, as
  /// an integer from 0 to 104857600.
  ///
  /// [uplinkDelayMs]: Delay time for all packets to destination in milliseconds
  /// as an integer from 0 to 2000.
  ///
  /// [downlinkDelayMs]: Delay time for all packets to destination in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [uplinkJitterMs]: Time variation in the delay of received packets in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [downlinkJitterMs]: Time variation in the delay of received packets in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [uplinkLossPercent]: Proportion of transmitted packets that fail to arrive
  /// from 0 to 100 percent.
  ///
  /// [downlinkLossPercent]: Proportion of received packets that fail to arrive
  /// from 0 to 100 percent.
  Future<CreateNetworkProfileResult> createNetworkProfile(
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
      int downlinkLossPercent}) async {
    return CreateNetworkProfileResult.fromJson({});
  }

  /// Creates a new project.
  ///
  /// [name]: The project's name.
  ///
  /// [defaultJobTimeoutMinutes]: Sets the execution timeout value (in minutes)
  /// for a project. All test runs in this project will use the specified
  /// execution timeout value unless overridden when scheduling a run.
  Future<CreateProjectResult> createProject(String name,
      {int defaultJobTimeoutMinutes}) async {
    return CreateProjectResult.fromJson({});
  }

  /// Specifies and starts a remote access session.
  ///
  /// [projectArn]: The Amazon Resource Name (ARN) of the project for which you
  /// want to create a remote access session.
  ///
  /// [deviceArn]: The Amazon Resource Name (ARN) of the device for which you
  /// want to create a remote access session.
  ///
  /// [instanceArn]: The Amazon Resource Name (ARN) of the device instance for
  /// which you want to create a remote access session.
  ///
  /// [sshPublicKey]: The public key of the `ssh` key pair you want to use for
  /// connecting to remote devices in your remote debugging session. This is
  /// only required if `remoteDebugEnabled` is set to `true`.
  ///
  /// [remoteDebugEnabled]: Set to `true` if you want to access devices remotely
  /// for debugging in your remote access session.
  ///
  /// [remoteRecordEnabled]: Set to `true` to enable remote recording for the
  /// remote access session.
  ///
  /// [remoteRecordAppArn]: The Amazon Resource Name (ARN) for the app to be
  /// recorded in the remote access session.
  ///
  /// [name]: The name of the remote access session that you wish to create.
  ///
  /// [clientId]: Unique identifier for the client. If you want access to
  /// multiple devices on the same client, you should pass the same `clientId`
  /// value in each call to `CreateRemoteAccessSession`. This is required only
  /// if `remoteDebugEnabled` is set to `true`.
  ///
  /// [configuration]: The configuration information for the remote access
  /// session request.
  ///
  /// [interactionMode]: The interaction mode of the remote access session.
  /// Valid values are:
  ///
  /// *   INTERACTIVE: You can interact with the iOS device by viewing,
  /// touching, and rotating the screen. You **cannot** run XCUITest
  /// framework-based tests in this mode.
  ///
  /// *   NO_VIDEO: You are connected to the device but cannot interact with it
  /// or view the screen. This mode has the fastest test execution speed. You
  /// **can** run XCUITest framework-based tests in this mode.
  ///
  /// *   VIDEO_ONLY: You can view the screen but cannot touch or rotate it. You
  /// **can** run XCUITest framework-based tests and watch the screen in this
  /// mode.
  ///
  /// [skipAppResign]: When set to `true`, for private devices, Device Farm will
  /// not sign your app again. For public devices, Device Farm always signs your
  /// apps again and this parameter has no effect.
  ///
  /// For more information about how Device Farm re-signs your app(s), see [Do
  /// you modify my app?](https://aws.amazon.com/device-farm/faq/) in the _AWS
  /// Device Farm FAQs_.
  Future<CreateRemoteAccessSessionResult> createRemoteAccessSession(
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
      bool skipAppResign}) async {
    return CreateRemoteAccessSessionResult.fromJson({});
  }

  /// Uploads an app or test scripts.
  ///
  /// [projectArn]: The ARN of the project for the upload.
  ///
  /// [name]: The upload's file name. The name should not contain the '/'
  /// character. If uploading an iOS app, the file name needs to end with the
  /// `.ipa` extension. If uploading an Android app, the file name needs to end
  /// with the `.apk` extension. For all others, the file name must end with the
  /// `.zip` file extension.
  ///
  /// [type]: The upload's upload type.
  ///
  /// Must be one of the following values:
  ///
  /// *   ANDROID_APP: An Android upload.
  ///
  /// *   IOS_APP: An iOS upload.
  ///
  /// *   WEB_APP: A web application upload.
  ///
  /// *   EXTERNAL_DATA: An external data upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_PACKAGE: An Appium Java JUnit test package
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_PACKAGE: An Appium Java TestNG test
  /// package upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_PACKAGE: An Appium Python test package upload.
  ///
  /// *   APPIUM\_NODE\_TEST_PACKAGE: An Appium Node.js test package upload.
  ///
  /// *   APPIUM\_RUBY\_TEST_PACKAGE: An Appium Ruby test package upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_PACKAGE: An Appium Java JUnit test
  /// package upload for a web app.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_PACKAGE: An Appium Java TestNG test
  /// package upload for a web app.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_PACKAGE: An Appium Python test package
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_PACKAGE: An Appium Node.js test package
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_PACKAGE: An Appium Ruby test package upload
  /// for a web app.
  ///
  /// *   CALABASH\_TEST\_PACKAGE: A Calabash test package upload.
  ///
  /// *   INSTRUMENTATION\_TEST\_PACKAGE: An instrumentation upload.
  ///
  /// *   UIAUTOMATION\_TEST\_PACKAGE: A uiautomation test package upload.
  ///
  /// *   UIAUTOMATOR\_TEST\_PACKAGE: A uiautomator test package upload.
  ///
  /// *   XCTEST\_TEST\_PACKAGE: An Xcode test package upload.
  ///
  /// *   XCTEST\_UI\_TEST_PACKAGE: An Xcode UI test package upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_SPEC: An Appium Java JUnit test spec
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_SPEC: An Appium Java TestNG test spec
  /// upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_SPEC: An Appium Python test spec upload.
  ///
  /// *   APPIUM\_NODE\_TEST_SPEC: An Appium Node.js test spec upload.
  ///
  /// *   APPIUM\_RUBY\_TEST_SPEC: An Appium Ruby test spec upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_SPEC: An Appium Java JUnit test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_SPEC: An Appium Java TestNG test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_SPEC: An Appium Python test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_SPEC: An Appium Node.js test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_SPEC: An Appium Ruby test spec upload for a
  /// web app.
  ///
  /// *   INSTRUMENTATION\_TEST\_SPEC: An instrumentation test spec upload.
  ///
  /// *   XCTEST\_UI\_TEST_SPEC: An Xcode UI test spec upload.
  ///
  ///
  ///  **Note** If you call `CreateUpload` with `WEB_APP` specified, AWS Device
  /// Farm throws an `ArgumentException` error.
  ///
  /// [contentType]: The upload's content type (for example,
  /// "application/octet-stream").
  Future<CreateUploadResult> createUpload(
      {@required String projectArn,
      @required String name,
      @required String type,
      String contentType}) async {
    return CreateUploadResult.fromJson({});
  }

  /// Creates a configuration record in Device Farm for your Amazon Virtual
  /// Private Cloud (VPC) endpoint.
  ///
  /// [vpceConfigurationName]: The friendly name you give to your VPC endpoint
  /// configuration, to manage your configurations more easily.
  ///
  /// [vpceServiceName]: The name of the VPC endpoint service running inside
  /// your AWS account that you want Device Farm to test.
  ///
  /// [serviceDnsName]: The DNS name of the service running in your VPC that you
  /// want Device Farm to test.
  ///
  /// [vpceConfigurationDescription]: An optional description, providing more
  /// details about your VPC endpoint configuration.
  Future<CreateVpceConfigurationResult> createVpceConfiguration(
      {@required String vpceConfigurationName,
      @required String vpceServiceName,
      @required String serviceDnsName,
      String vpceConfigurationDescription}) async {
    return CreateVpceConfigurationResult.fromJson({});
  }

  /// Deletes a device pool given the pool ARN. Does not allow deletion of
  /// curated pools owned by the system.
  ///
  /// [arn]: Represents the Amazon Resource Name (ARN) of the Device Farm device
  /// pool you wish to delete.
  Future<DeleteDevicePoolResult> deleteDevicePool(String arn) async {
    return DeleteDevicePoolResult.fromJson({});
  }

  /// Deletes a profile that can be applied to one or more private device
  /// instances.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the instance profile you are
  /// requesting to delete.
  Future<DeleteInstanceProfileResult> deleteInstanceProfile(String arn) async {
    return DeleteInstanceProfileResult.fromJson({});
  }

  /// Deletes a network profile.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the network profile you want to
  /// delete.
  Future<DeleteNetworkProfileResult> deleteNetworkProfile(String arn) async {
    return DeleteNetworkProfileResult.fromJson({});
  }

  /// Deletes an AWS Device Farm project, given the project ARN.
  ///
  ///  **Note** Deleting this resource does not stop an in-progress run.
  ///
  /// [arn]: Represents the Amazon Resource Name (ARN) of the Device Farm
  /// project you wish to delete.
  Future<DeleteProjectResult> deleteProject(String arn) async {
    return DeleteProjectResult.fromJson({});
  }

  /// Deletes a completed remote access session and its results.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the session for which you want to
  /// delete remote access.
  Future<DeleteRemoteAccessSessionResult> deleteRemoteAccessSession(
      String arn) async {
    return DeleteRemoteAccessSessionResult.fromJson({});
  }

  /// Deletes the run, given the run ARN.
  ///
  ///  **Note** Deleting this resource does not stop an in-progress run.
  ///
  /// [arn]: The Amazon Resource Name (ARN) for the run you wish to delete.
  Future<DeleteRunResult> deleteRun(String arn) async {
    return DeleteRunResult.fromJson({});
  }

  /// Deletes an upload given the upload ARN.
  ///
  /// [arn]: Represents the Amazon Resource Name (ARN) of the Device Farm upload
  /// you wish to delete.
  Future<DeleteUploadResult> deleteUpload(String arn) async {
    return DeleteUploadResult.fromJson({});
  }

  /// Deletes a configuration for your Amazon Virtual Private Cloud (VPC)
  /// endpoint.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the VPC endpoint configuration
  /// you want to delete.
  Future<DeleteVpceConfigurationResult> deleteVpceConfiguration(
      String arn) async {
    return DeleteVpceConfigurationResult.fromJson({});
  }

  /// Returns the number of unmetered iOS and/or unmetered Android devices that
  /// have been purchased by the account.
  Future<GetAccountSettingsResult> getAccountSettings() async {
    return GetAccountSettingsResult.fromJson({});
  }

  /// Gets information about a unique device type.
  ///
  /// [arn]: The device type's ARN.
  Future<GetDeviceResult> getDevice(String arn) async {
    return GetDeviceResult.fromJson({});
  }

  /// Returns information about a device instance belonging to a private device
  /// fleet.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the instance you're requesting
  /// information about.
  Future<GetDeviceInstanceResult> getDeviceInstance(String arn) async {
    return GetDeviceInstanceResult.fromJson({});
  }

  /// Gets information about a device pool.
  ///
  /// [arn]: The device pool's ARN.
  Future<GetDevicePoolResult> getDevicePool(String arn) async {
    return GetDevicePoolResult.fromJson({});
  }

  /// Gets information about compatibility with a device pool.
  ///
  /// [devicePoolArn]: The device pool's ARN.
  ///
  /// [appArn]: The ARN of the app that is associated with the specified device
  /// pool.
  ///
  /// [testType]: The test type for the specified device pool.
  ///
  /// Allowed values include the following:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  ///
  /// [test]: Information about the uploaded test to be run against the device
  /// pool.
  ///
  /// [configuration]: An object containing information about the settings for a
  /// run.
  Future<GetDevicePoolCompatibilityResult> getDevicePoolCompatibility(
      String devicePoolArn,
      {String appArn,
      String testType,
      ScheduleRunTest test,
      ScheduleRunConfiguration configuration}) async {
    return GetDevicePoolCompatibilityResult.fromJson({});
  }

  /// Returns information about the specified instance profile.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of your instance profile.
  Future<GetInstanceProfileResult> getInstanceProfile(String arn) async {
    return GetInstanceProfileResult.fromJson({});
  }

  /// Gets information about a job.
  ///
  /// [arn]: The job's ARN.
  Future<GetJobResult> getJob(String arn) async {
    return GetJobResult.fromJson({});
  }

  /// Returns information about a network profile.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the network profile you want to
  /// return information about.
  Future<GetNetworkProfileResult> getNetworkProfile(String arn) async {
    return GetNetworkProfileResult.fromJson({});
  }

  /// Gets the current status and future status of all offerings purchased by an
  /// AWS account. The response indicates how many offerings are currently
  /// available and the offerings that will be available in the next period. The
  /// API returns a `NotEligible` error if the user is not permitted to invoke
  /// the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<GetOfferingStatusResult> getOfferingStatus({String nextToken}) async {
    return GetOfferingStatusResult.fromJson({});
  }

  /// Gets information about a project.
  ///
  /// [arn]: The project's ARN.
  Future<GetProjectResult> getProject(String arn) async {
    return GetProjectResult.fromJson({});
  }

  /// Returns a link to a currently running remote access session.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the remote access session about
  /// which you want to get session information.
  Future<GetRemoteAccessSessionResult> getRemoteAccessSession(
      String arn) async {
    return GetRemoteAccessSessionResult.fromJson({});
  }

  /// Gets information about a run.
  ///
  /// [arn]: The run's ARN.
  Future<GetRunResult> getRun(String arn) async {
    return GetRunResult.fromJson({});
  }

  /// Gets information about a suite.
  ///
  /// [arn]: The suite's ARN.
  Future<GetSuiteResult> getSuite(String arn) async {
    return GetSuiteResult.fromJson({});
  }

  /// Gets information about a test.
  ///
  /// [arn]: The test's ARN.
  Future<GetTestResult> getTest(String arn) async {
    return GetTestResult.fromJson({});
  }

  /// Gets information about an upload.
  ///
  /// [arn]: The upload's ARN.
  Future<GetUploadResult> getUpload(String arn) async {
    return GetUploadResult.fromJson({});
  }

  /// Returns information about the configuration settings for your Amazon
  /// Virtual Private Cloud (VPC) endpoint.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the VPC endpoint configuration
  /// you want to describe.
  Future<GetVpceConfigurationResult> getVpceConfiguration(String arn) async {
    return GetVpceConfigurationResult.fromJson({});
  }

  /// Installs an application to the device in a remote access session. For
  /// Android applications, the file must be in .apk format. For iOS
  /// applications, the file must be in .ipa format.
  ///
  /// [remoteAccessSessionArn]: The Amazon Resource Name (ARN) of the remote
  /// access session about which you are requesting information.
  ///
  /// [appArn]: The Amazon Resource Name (ARN) of the app about which you are
  /// requesting information.
  Future<InstallToRemoteAccessSessionResult> installToRemoteAccessSession(
      {@required String remoteAccessSessionArn,
      @required String appArn}) async {
    return InstallToRemoteAccessSessionResult.fromJson({});
  }

  /// Gets information about artifacts.
  ///
  /// [arn]: The Run, Job, Suite, or Test ARN.
  ///
  /// [type]: The artifacts' type.
  ///
  /// Allowed values include:
  ///
  /// *   FILE: The artifacts are files.
  ///
  /// *   LOG: The artifacts are logs.
  ///
  /// *   SCREENSHOT: The artifacts are screenshots.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListArtifactsResult> listArtifacts(
      {@required String arn, @required String type, String nextToken}) async {
    return ListArtifactsResult.fromJson({});
  }

  /// Returns information about the private device instances associated with one
  /// or more AWS accounts.
  ///
  /// [maxResults]: An integer specifying the maximum number of items you want
  /// to return in the API response.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListDeviceInstancesResult> listDeviceInstances(
      {int maxResults, String nextToken}) async {
    return ListDeviceInstancesResult.fromJson({});
  }

  /// Gets information about device pools.
  ///
  /// [arn]: The project ARN.
  ///
  /// [type]: The device pools' type.
  ///
  /// Allowed values include:
  ///
  /// *   CURATED: A device pool that is created and managed by AWS Device Farm.
  ///
  /// *   PRIVATE: A device pool that is created and managed by the device pool
  /// developer.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListDevicePoolsResult> listDevicePools(String arn,
      {String type, String nextToken}) async {
    return ListDevicePoolsResult.fromJson({});
  }

  /// Gets information about unique device types.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  ///
  /// [filters]: Used to select a set of devices. A filter is made up of an
  /// attribute, an operator, and one or more values.
  ///
  /// *   Attribute: The aspect of a device such as platform or model used as
  /// the selection criteria in a device filter.
  ///
  ///     Allowed values include:
  ///
  ///     *   ARN: The Amazon Resource Name (ARN) of the device. For example,
  /// "arn:aws:devicefarm:us-west-2::device:12345Example".
  ///
  ///     *   PLATFORM: The device platform. Valid values are "ANDROID" or
  /// "IOS".
  ///
  ///     *   OS_VERSION: The operating system version. For example, "10.3.2".
  ///
  ///     *   MODEL: The device model. For example, "iPad 5th Gen".
  ///
  ///     *   AVAILABILITY: The current availability of the device. Valid values
  /// are "AVAILABLE", "HIGHLY\_AVAILABLE", "BUSY", or
  /// "TEMPORARY\_NOT_AVAILABLE".
  ///
  ///     *   FORM_FACTOR: The device form factor. Valid values are "PHONE" or
  /// "TABLET".
  ///
  ///     *   MANUFACTURER: The device manufacturer. For example, "Apple".
  ///
  ///     *   REMOTE\_ACCESS\_ENABLED: Whether the device is enabled for remote
  /// access. Valid values are "TRUE" or "FALSE".
  ///
  ///     *   REMOTE\_DEBUG\_ENABLED: Whether the device is enabled for remote
  /// debugging. Valid values are "TRUE" or "FALSE".
  ///
  ///     *   INSTANCE_ARN: The Amazon Resource Name (ARN) of the device
  /// instance.
  ///
  ///     *   INSTANCE_LABELS: The label of the device instance.
  ///
  ///     *   FLEET_TYPE: The fleet type. Valid values are "PUBLIC" or
  /// "PRIVATE".
  ///
  ///
  /// *   Operator: The filter operator.
  ///
  ///     *   The EQUALS operator is available for every attribute except
  /// INSTANCE_LABELS.
  ///
  ///     *   The CONTAINS operator is available for the INSTANCE_LABELS and
  /// MODEL attributes.
  ///
  ///     *   The IN and NOT\_IN operators are available for the ARN,
  /// OS\_VERSION, MODEL, MANUFACTURER, and INSTANCE_ARN attributes.
  ///
  ///     *   The LESS\_THAN, GREATER\_THAN, LESS\_THAN\_OR\_EQUALS, and
  /// GREATER\_THAN\_OR\_EQUALS operators are also available for the OS_VERSION
  /// attribute.
  ///
  ///
  /// *   Values: An array of one or more filter values.
  ///
  ///     *   The IN and NOT_IN operators take a values array that has one or
  /// more elements.
  ///
  ///     *   The other operators require an array with a single element.
  ///
  ///     *   In a request, the AVAILABILITY attribute takes "AVAILABLE",
  /// "HIGHLY\_AVAILABLE", "BUSY", or "TEMPORARY\_NOT_AVAILABLE" as values.
  Future<ListDevicesResult> listDevices(
      {String arn, String nextToken, List<DeviceFilter> filters}) async {
    return ListDevicesResult.fromJson({});
  }

  /// Returns information about all the instance profiles in an AWS account.
  ///
  /// [maxResults]: An integer specifying the maximum number of items you want
  /// to return in the API response.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListInstanceProfilesResult> listInstanceProfiles(
      {int maxResults, String nextToken}) async {
    return ListInstanceProfilesResult.fromJson({});
  }

  /// Gets information about jobs for a given test run.
  ///
  /// [arn]: The run's Amazon Resource Name (ARN).
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListJobsResult> listJobs(String arn, {String nextToken}) async {
    return ListJobsResult.fromJson({});
  }

  /// Returns the list of available network profiles.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project for which you want to
  /// list network profiles.
  ///
  /// [type]: The type of network profile you wish to return information about.
  /// Valid values are listed below.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListNetworkProfilesResult> listNetworkProfiles(String arn,
      {String type, String nextToken}) async {
    return ListNetworkProfilesResult.fromJson({});
  }

  /// Returns a list of offering promotions. Each offering promotion record
  /// contains the ID and description of the promotion. The API returns a
  /// `NotEligible` error if the caller is not permitted to invoke the
  /// operation. Contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListOfferingPromotionsResult> listOfferingPromotions(
      {String nextToken}) async {
    return ListOfferingPromotionsResult.fromJson({});
  }

  /// Returns a list of all historical purchases, renewals, and system renewal
  /// transactions for an AWS account. The list is paginated and ordered by a
  /// descending timestamp (most recent transactions are first). The API returns
  /// a `NotEligible` error if the user is not permitted to invoke the
  /// operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListOfferingTransactionsResult> listOfferingTransactions(
      {String nextToken}) async {
    return ListOfferingTransactionsResult.fromJson({});
  }

  /// Returns a list of products or offerings that the user can manage through
  /// the API. Each offering record indicates the recurring price per unit and
  /// the frequency for that offering. The API returns a `NotEligible` error if
  /// the user is not permitted to invoke the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListOfferingsResult> listOfferings({String nextToken}) async {
    return ListOfferingsResult.fromJson({});
  }

  /// Gets information about projects.
  ///
  /// [arn]: Optional. If no Amazon Resource Name (ARN) is specified, then AWS
  /// Device Farm returns a list of all projects for the AWS account. You can
  /// also specify a project ARN.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListProjectsResult> listProjects(
      {String arn, String nextToken}) async {
    return ListProjectsResult.fromJson({});
  }

  /// Returns a list of all currently running remote access sessions.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the remote access session about
  /// which you are requesting information.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListRemoteAccessSessionsResult> listRemoteAccessSessions(String arn,
      {String nextToken}) async {
    return ListRemoteAccessSessionsResult.fromJson({});
  }

  /// Gets information about runs, given an AWS Device Farm project ARN.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project for which you want to
  /// list runs.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListRunsResult> listRuns(String arn, {String nextToken}) async {
    return ListRunsResult.fromJson({});
  }

  /// Gets information about samples, given an AWS Device Farm job ARN.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the job used to list samples.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListSamplesResult> listSamples(String arn, {String nextToken}) async {
    return ListSamplesResult.fromJson({});
  }

  /// Gets information about test suites for a given job.
  ///
  /// [arn]: The job's Amazon Resource Name (ARN).
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListSuitesResult> listSuites(String arn, {String nextToken}) async {
    return ListSuitesResult.fromJson({});
  }

  /// List the tags for an AWS Device Farm resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource(s) for which
  /// to list tags. You can associate tags with the following Device Farm
  /// resources: `PROJECT`, `RUN`, `NETWORK_PROFILE`, `INSTANCE_PROFILE`,
  /// `DEVICE_INSTANCE`, `SESSION`, `DEVICE_POOL`, `DEVICE`, and
  /// `VPCE_CONFIGURATION`.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Gets information about tests in a given test suite.
  ///
  /// [arn]: The test suite's Amazon Resource Name (ARN).
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListTestsResult> listTests(String arn, {String nextToken}) async {
    return ListTestsResult.fromJson({});
  }

  /// Gets information about unique problems.
  ///
  /// [arn]: The unique problems' ARNs.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListUniqueProblemsResult> listUniqueProblems(String arn,
      {String nextToken}) async {
    return ListUniqueProblemsResult.fromJson({});
  }

  /// Gets information about uploads, given an AWS Device Farm project ARN.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project for which you want to
  /// list uploads.
  ///
  /// [type]: The type of upload.
  ///
  /// Must be one of the following values:
  ///
  /// *   ANDROID_APP: An Android upload.
  ///
  /// *   IOS_APP: An iOS upload.
  ///
  /// *   WEB_APP: A web application upload.
  ///
  /// *   EXTERNAL_DATA: An external data upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_PACKAGE: An Appium Java JUnit test package
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_PACKAGE: An Appium Java TestNG test
  /// package upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_PACKAGE: An Appium Python test package upload.
  ///
  /// *   APPIUM\_NODE\_TEST_PACKAGE: An Appium Node.js test package upload.
  ///
  /// *   APPIUM\_RUBY\_TEST_PACKAGE: An Appium Ruby test package upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_PACKAGE: An Appium Java JUnit test
  /// package upload for a web app.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_PACKAGE: An Appium Java TestNG test
  /// package upload for a web app.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_PACKAGE: An Appium Python test package
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_PACKAGE: An Appium Node.js test package
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_PACKAGE: An Appium Ruby test package upload
  /// for a web app.
  ///
  /// *   CALABASH\_TEST\_PACKAGE: A Calabash test package upload.
  ///
  /// *   INSTRUMENTATION\_TEST\_PACKAGE: An instrumentation upload.
  ///
  /// *   UIAUTOMATION\_TEST\_PACKAGE: A uiautomation test package upload.
  ///
  /// *   UIAUTOMATOR\_TEST\_PACKAGE: A uiautomator test package upload.
  ///
  /// *   XCTEST\_TEST\_PACKAGE: An Xcode test package upload.
  ///
  /// *   XCTEST\_UI\_TEST_PACKAGE: An Xcode UI test package upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_SPEC: An Appium Java JUnit test spec
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_SPEC: An Appium Java TestNG test spec
  /// upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_SPEC: An Appium Python test spec upload.
  ///
  /// *   APPIUM\_NODE\_TEST_SPEC: An Appium Node.js test spec upload.
  ///
  /// *    APPIUM\_RUBY\_TEST_SPEC: An Appium Ruby test spec upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_SPEC: An Appium Java JUnit test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_SPEC: An Appium Java TestNG test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_SPEC: An Appium Python test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_SPEC: An Appium Node.js test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_SPEC: An Appium Ruby test spec upload for a
  /// web app.
  ///
  /// *   INSTRUMENTATION\_TEST\_SPEC: An instrumentation test spec upload.
  ///
  /// *   XCTEST\_UI\_TEST_SPEC: An Xcode UI test spec upload.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListUploadsResult> listUploads(String arn,
      {String type, String nextToken}) async {
    return ListUploadsResult.fromJson({});
  }

  /// Returns information about all Amazon Virtual Private Cloud (VPC) endpoint
  /// configurations in the AWS account.
  ///
  /// [maxResults]: An integer specifying the maximum number of items you want
  /// to return in the API response.
  ///
  /// [nextToken]: An identifier that was returned from the previous call to
  /// this operation, which can be used to return the next set of items in the
  /// list.
  Future<ListVpceConfigurationsResult> listVpceConfigurations(
      {int maxResults, String nextToken}) async {
    return ListVpceConfigurationsResult.fromJson({});
  }

  /// Immediately purchases offerings for an AWS account. Offerings renew with
  /// the latest total purchased quantity for an offering, unless the renewal
  /// was overridden. The API returns a `NotEligible` error if the user is not
  /// permitted to invoke the operation. Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [offeringId]: The ID of the offering.
  ///
  /// [quantity]: The number of device slots you wish to purchase in an offering
  /// request.
  ///
  /// [offeringPromotionId]: The ID of the offering promotion to be applied to
  /// the purchase.
  Future<PurchaseOfferingResult> purchaseOffering(
      {String offeringId, int quantity, String offeringPromotionId}) async {
    return PurchaseOfferingResult.fromJson({});
  }

  /// Explicitly sets the quantity of devices to renew for an offering, starting
  /// from the `effectiveDate` of the next period. The API returns a
  /// `NotEligible` error if the user is not permitted to invoke the operation.
  /// Please contact
  /// [aws-devicefarm-support@amazon.com](mailto:aws-devicefarm-support@amazon.com)
  /// if you believe that you should be able to invoke this operation.
  ///
  /// [offeringId]: The ID of a request to renew an offering.
  ///
  /// [quantity]: The quantity requested in an offering renewal.
  Future<RenewOfferingResult> renewOffering(
      {String offeringId, int quantity}) async {
    return RenewOfferingResult.fromJson({});
  }

  /// Schedules a run.
  ///
  /// [projectArn]: The ARN of the project for the run to be scheduled.
  ///
  /// [appArn]: The ARN of the app to schedule a run.
  ///
  /// [devicePoolArn]: The ARN of the device pool for the run to be scheduled.
  ///
  /// [deviceSelectionConfiguration]: The filter criteria used to dynamically
  /// select a set of devices for a test run, as well as the maximum number of
  /// devices to be included in the run.
  ///
  /// Either  **`devicePoolArn`**  or  **`deviceSelectionConfiguration`**  is
  /// required in a request.
  ///
  /// [name]: The name for the run to be scheduled.
  ///
  /// [test]: Information about the test for the run to be scheduled.
  ///
  /// [configuration]: Information about the settings for the run to be
  /// scheduled.
  ///
  /// [executionConfiguration]: Specifies configuration information about a test
  /// run, such as the execution timeout (in minutes).
  Future<ScheduleRunResult> scheduleRun(
      {@required String projectArn,
      String appArn,
      String devicePoolArn,
      DeviceSelectionConfiguration deviceSelectionConfiguration,
      String name,
      @required ScheduleRunTest test,
      ScheduleRunConfiguration configuration,
      ExecutionConfiguration executionConfiguration}) async {
    return ScheduleRunResult.fromJson({});
  }

  /// Initiates a stop request for the current job. AWS Device Farm will
  /// immediately stop the job on the device where tests have not started
  /// executing, and you will not be billed for this device. On the device where
  /// tests have started executing, Setup Suite and Teardown Suite tests will
  /// run to completion before stopping execution on the device. You will be
  /// billed for Setup, Teardown, and any tests that were in progress or already
  /// completed.
  ///
  /// [arn]: Represents the Amazon Resource Name (ARN) of the Device Farm job
  /// you wish to stop.
  Future<StopJobResult> stopJob(String arn) async {
    return StopJobResult.fromJson({});
  }

  /// Ends a specified remote access session.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the remote access session you
  /// wish to stop.
  Future<StopRemoteAccessSessionResult> stopRemoteAccessSession(
      String arn) async {
    return StopRemoteAccessSessionResult.fromJson({});
  }

  /// Initiates a stop request for the current test run. AWS Device Farm will
  /// immediately stop the run on devices where tests have not started
  /// executing, and you will not be billed for these devices. On devices where
  /// tests have started executing, Setup Suite and Teardown Suite tests will
  /// run to completion before stopping execution on those devices. You will be
  /// billed for Setup, Teardown, and any tests that were in progress or already
  /// completed.
  ///
  /// [arn]: Represents the Amazon Resource Name (ARN) of the Device Farm run
  /// you wish to stop.
  Future<StopRunResult> stopRun(String arn) async {
    return StopRunResult.fromJson({});
  }

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource(s) to which
  /// to add tags. You can associate tags with the following Device Farm
  /// resources: `PROJECT`, `RUN`, `NETWORK_PROFILE`, `INSTANCE_PROFILE`,
  /// `DEVICE_INSTANCE`, `SESSION`, `DEVICE_POOL`, `DEVICE`, and
  /// `VPCE_CONFIGURATION`.
  ///
  /// [tags]: The tags to add to the resource. A tag is an array of key-value
  /// pairs. Tag keys can have a maximum character length of 128 characters, and
  /// tag values can have a maximum length of 256 characters.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Deletes the specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource(s) from
  /// which to delete tags. You can associate tags with the following Device
  /// Farm resources: `PROJECT`, `RUN`, `NETWORK_PROFILE`, `INSTANCE_PROFILE`,
  /// `DEVICE_INSTANCE`, `SESSION`, `DEVICE_POOL`, `DEVICE`, and
  /// `VPCE_CONFIGURATION`.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates information about an existing private device instance.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the device instance.
  ///
  /// [profileArn]: The Amazon Resource Name (ARN) of the profile that you want
  /// to associate with the device instance.
  ///
  /// [labels]: An array of strings that you want to associate with the device
  /// instance.
  Future<UpdateDeviceInstanceResult> updateDeviceInstance(String arn,
      {String profileArn, List<String> labels}) async {
    return UpdateDeviceInstanceResult.fromJson({});
  }

  /// Modifies the name, description, and rules in a device pool given the
  /// attributes and the pool ARN. Rule updates are all-or-nothing, meaning they
  /// can only be updated as a whole (or not at all).
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the Device Farm device pool you
  /// wish to update.
  ///
  /// [name]: A string representing the name of the device pool you wish to
  /// update.
  ///
  /// [description]: A description of the device pool you wish to update.
  ///
  /// [rules]: Represents the rules you wish to modify for the device pool.
  /// Updating rules is optional; however, if you choose to update rules for
  /// your request, the update will replace the existing rules.
  ///
  /// [maxDevices]: The number of devices that Device Farm can add to your
  /// device pool. Device Farm adds devices that are available and that meet the
  /// criteria that you assign for the `rules` parameter. Depending on how many
  /// devices meet these constraints, your device pool might contain fewer
  /// devices than the value for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs
  /// that you incur by running tests.
  ///
  /// If you use this parameter in your request, you cannot use the
  /// `clearMaxDevices` parameter in the same request.
  ///
  /// [clearMaxDevices]: Sets whether the `maxDevices` parameter applies to your
  /// device pool. If you set this parameter to `true`, the `maxDevices`
  /// parameter does not apply, and Device Farm does not limit the number of
  /// devices that it adds to your device pool. In this case, Device Farm adds
  /// all available devices that meet the criteria that are specified for the
  /// `rules` parameter.
  ///
  /// If you use this parameter in your request, you cannot use the `maxDevices`
  /// parameter in the same request.
  Future<UpdateDevicePoolResult> updateDevicePool(String arn,
      {String name,
      String description,
      List<Rule> rules,
      int maxDevices,
      bool clearMaxDevices}) async {
    return UpdateDevicePoolResult.fromJson({});
  }

  /// Updates information about an existing private device instance profile.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the instance profile.
  ///
  /// [name]: The updated name for your instance profile.
  ///
  /// [description]: The updated description for your instance profile.
  ///
  /// [packageCleanup]: The updated choice for whether you want to specify
  /// package cleanup. The default value is `false` for private devices.
  ///
  /// [excludeAppPackagesFromCleanup]: An array of strings specifying the list
  /// of app packages that should not be cleaned up from the device after a test
  /// run is over.
  ///
  /// The list of packages is only considered if you set `packageCleanup` to
  /// `true`.
  ///
  /// [rebootAfterUse]: The updated choice for whether you want to reboot the
  /// device after use. The default value is `true`.
  Future<UpdateInstanceProfileResult> updateInstanceProfile(String arn,
      {String name,
      String description,
      bool packageCleanup,
      List<String> excludeAppPackagesFromCleanup,
      bool rebootAfterUse}) async {
    return UpdateInstanceProfileResult.fromJson({});
  }

  /// Updates the network profile with specific settings.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project for which you want to
  /// update network profile settings.
  ///
  /// [name]: The name of the network profile about which you are returning
  /// information.
  ///
  /// [description]: The description of the network profile about which you are
  /// returning information.
  ///
  /// [type]: The type of network profile you wish to return information about.
  /// Valid values are listed below.
  ///
  /// [uplinkBandwidthBits]: The data throughput rate in bits per second, as an
  /// integer from 0 to 104857600.
  ///
  /// [downlinkBandwidthBits]: The data throughput rate in bits per second, as
  /// an integer from 0 to 104857600.
  ///
  /// [uplinkDelayMs]: Delay time for all packets to destination in milliseconds
  /// as an integer from 0 to 2000.
  ///
  /// [downlinkDelayMs]: Delay time for all packets to destination in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [uplinkJitterMs]: Time variation in the delay of received packets in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [downlinkJitterMs]: Time variation in the delay of received packets in
  /// milliseconds as an integer from 0 to 2000.
  ///
  /// [uplinkLossPercent]: Proportion of transmitted packets that fail to arrive
  /// from 0 to 100 percent.
  ///
  /// [downlinkLossPercent]: Proportion of received packets that fail to arrive
  /// from 0 to 100 percent.
  Future<UpdateNetworkProfileResult> updateNetworkProfile(String arn,
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
      int downlinkLossPercent}) async {
    return UpdateNetworkProfileResult.fromJson({});
  }

  /// Modifies the specified project name, given the project ARN and a new name.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the project whose name you wish
  /// to update.
  ///
  /// [name]: A string representing the new name of the project that you are
  /// updating.
  ///
  /// [defaultJobTimeoutMinutes]: The number of minutes a test run in the
  /// project will execute before it times out.
  Future<UpdateProjectResult> updateProject(String arn,
      {String name, int defaultJobTimeoutMinutes}) async {
    return UpdateProjectResult.fromJson({});
  }

  /// Update an uploaded test specification (test spec).
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the uploaded test spec.
  ///
  /// [name]: The upload's test spec file name. The name should not contain the
  /// '/' character. The test spec file name must end with the `.yaml` or `.yml`
  /// file extension.
  ///
  /// [contentType]: The upload's content type (for example,
  /// "application/x-yaml").
  ///
  /// [editContent]: Set to true if the YAML file has changed and needs to be
  /// updated; otherwise, set to false.
  Future<UpdateUploadResult> updateUpload(String arn,
      {String name, String contentType, bool editContent}) async {
    return UpdateUploadResult.fromJson({});
  }

  /// Updates information about an existing Amazon Virtual Private Cloud (VPC)
  /// endpoint configuration.
  ///
  /// [arn]: The Amazon Resource Name (ARN) of the VPC endpoint configuration
  /// you want to update.
  ///
  /// [vpceConfigurationName]: The friendly name you give to your VPC endpoint
  /// configuration, to manage your configurations more easily.
  ///
  /// [vpceServiceName]: The name of the VPC endpoint service running inside
  /// your AWS account that you want Device Farm to test.
  ///
  /// [serviceDnsName]: The DNS (domain) name used to connect to your private
  /// service in your Amazon VPC. The DNS name must not already be in use on the
  /// Internet.
  ///
  /// [vpceConfigurationDescription]: An optional description, providing more
  /// details about your VPC endpoint configuration.
  Future<UpdateVpceConfigurationResult> updateVpceConfiguration(String arn,
      {String vpceConfigurationName,
      String vpceServiceName,
      String serviceDnsName,
      String vpceConfigurationDescription}) async {
    return UpdateVpceConfigurationResult.fromJson({});
  }
}

class AccountSettings {
  /// The AWS account number specified in the `AccountSettings` container.
  final String awsAccountNumber;

  /// Returns the unmetered devices you have purchased or want to purchase.
  final Map<String, int> unmeteredDevices;

  /// Returns the unmetered remote access devices you have purchased or want to
  /// purchase.
  final Map<String, int> unmeteredRemoteAccessDevices;

  /// The maximum number of minutes a test run will execute before it times out.
  final int maxJobTimeoutMinutes;

  /// Information about an AWS account's usage of free trial device minutes.
  final TrialMinutes trialMinutes;

  /// The maximum number of device slots that the AWS account can purchase. Each
  /// maximum is expressed as an `offering-id:number` pair, where the
  /// `offering-id` represents one of the IDs returned by the `ListOfferings`
  /// command.
  final Map<String, int> maxSlots;

  /// The default number of minutes (at the account level) a test run will
  /// execute before it times out. The default value is 150 minutes.
  final int defaultJobTimeoutMinutes;

  /// When set to `true`, for private devices, Device Farm will not sign your
  /// app again. For public devices, Device Farm always signs your apps again
  /// and this parameter has no effect.
  ///
  /// For more information about how Device Farm re-signs your app(s), see [Do
  /// you modify my app?](https://aws.amazon.com/device-farm/faq/) in the _AWS
  /// Device Farm FAQs_.
  final bool skipAppResign;

  AccountSettings({
    this.awsAccountNumber,
    this.unmeteredDevices,
    this.unmeteredRemoteAccessDevices,
    this.maxJobTimeoutMinutes,
    this.trialMinutes,
    this.maxSlots,
    this.defaultJobTimeoutMinutes,
    this.skipAppResign,
  });
  static AccountSettings fromJson(Map<String, dynamic> json) =>
      AccountSettings();
}

class Artifact {
  /// The artifact's ARN.
  final String arn;

  /// The artifact's name.
  final String name;

  /// The artifact's type.
  ///
  /// Allowed values include the following:
  ///
  /// *   UNKNOWN: An unknown type.
  ///
  /// *   SCREENSHOT: The screenshot type.
  ///
  /// *   DEVICE_LOG: The device log type.
  ///
  /// *   MESSAGE_LOG: The message log type.
  ///
  /// *   VIDEO_LOG: The video log type.
  ///
  /// *   RESULT_LOG: The result log type.
  ///
  /// *   SERVICE_LOG: The service log type.
  ///
  /// *   WEBKIT_LOG: The web kit log type.
  ///
  /// *   INSTRUMENTATION_OUTPUT: The instrumentation type.
  ///
  /// *   EXERCISER\_MONKEY\_OUTPUT: For Android, the artifact (log) generated
  /// by an Android fuzz test.
  ///
  /// *   CALABASH\_JSON\_OUTPUT: The Calabash JSON output type.
  ///
  /// *   CALABASH\_PRETTY\_OUTPUT: The Calabash pretty output type.
  ///
  /// *   CALABASH\_STANDARD\_OUTPUT: The Calabash standard output type.
  ///
  /// *   CALABASH\_JAVA\_XML_OUTPUT: The Calabash Java XML output type.
  ///
  /// *   AUTOMATION_OUTPUT: The automation output type.
  ///
  /// *   APPIUM\_SERVER\_OUTPUT: The Appium server output type.
  ///
  /// *   APPIUM\_JAVA\_OUTPUT: The Appium Java output type.
  ///
  /// *   APPIUM\_JAVA\_XML_OUTPUT: The Appium Java XML output type.
  ///
  /// *   APPIUM\_PYTHON\_OUTPUT: The Appium Python output type.
  ///
  /// *   APPIUM\_PYTHON\_XML_OUTPUT: The Appium Python XML output type.
  ///
  /// *   EXPLORER\_EVENT\_LOG: The Explorer event log output type.
  ///
  /// *   EXPLORER\_SUMMARY\_LOG: The Explorer summary log output type.
  ///
  /// *   APPLICATION\_CRASH\_REPORT: The application crash report output type.
  ///
  /// *   XCTEST_LOG: The Xcode test output type.
  ///
  /// *   VIDEO: The Video output type.
  ///
  /// *   CUSTOMER_ARTIFACT:The Customer Artifact output type.
  ///
  /// *   CUSTOMER\_ARTIFACT\_LOG: The Customer Artifact Log output type.
  ///
  /// *   TESTSPEC_OUTPUT: The Test Spec Output type.
  final String type;

  /// The artifact's file extension.
  final String extension;

  /// The pre-signed Amazon S3 URL that can be used with a corresponding GET
  /// request to download the artifact's file.
  final String url;

  Artifact({
    this.arn,
    this.name,
    this.type,
    this.extension,
    this.url,
  });
  static Artifact fromJson(Map<String, dynamic> json) => Artifact();
}

class Cpu {
  /// The CPU's frequency.
  final String frequency;

  /// The CPU's architecture, for example x86 or ARM.
  final String architecture;

  /// The clock speed of the device's CPU, expressed in hertz (Hz). For example,
  /// a 1.2 GHz CPU is expressed as 1200000000.
  final double clock;

  Cpu({
    this.frequency,
    this.architecture,
    this.clock,
  });
  static Cpu fromJson(Map<String, dynamic> json) => Cpu();
}

class Counters {
  /// The total number of entities.
  final int total;

  /// The number of passed entities.
  final int passed;

  /// The number of failed entities.
  final int failed;

  /// The number of warned entities.
  final int warned;

  /// The number of errored entities.
  final int errored;

  /// The number of stopped entities.
  final int stopped;

  /// The number of skipped entities.
  final int skipped;

  Counters({
    this.total,
    this.passed,
    this.failed,
    this.warned,
    this.errored,
    this.stopped,
    this.skipped,
  });
  static Counters fromJson(Map<String, dynamic> json) => Counters();
}

class CreateDevicePoolResult {
  /// The newly created device pool.
  final DevicePool devicePool;

  CreateDevicePoolResult({
    this.devicePool,
  });
  static CreateDevicePoolResult fromJson(Map<String, dynamic> json) =>
      CreateDevicePoolResult();
}

class CreateInstanceProfileResult {
  /// An object containing information about your instance profile.
  final InstanceProfile instanceProfile;

  CreateInstanceProfileResult({
    this.instanceProfile,
  });
  static CreateInstanceProfileResult fromJson(Map<String, dynamic> json) =>
      CreateInstanceProfileResult();
}

class CreateNetworkProfileResult {
  /// The network profile that is returned by the create network profile
  /// request.
  final NetworkProfile networkProfile;

  CreateNetworkProfileResult({
    this.networkProfile,
  });
  static CreateNetworkProfileResult fromJson(Map<String, dynamic> json) =>
      CreateNetworkProfileResult();
}

class CreateProjectResult {
  /// The newly created project.
  final Project project;

  CreateProjectResult({
    this.project,
  });
  static CreateProjectResult fromJson(Map<String, dynamic> json) =>
      CreateProjectResult();
}

class CreateRemoteAccessSessionConfiguration {
  /// The billing method for the remote access session.
  final String billingMethod;

  /// An array of Amazon Resource Names (ARNs) included in the VPC endpoint
  /// configuration.
  final List<String> vpceConfigurationArns;

  CreateRemoteAccessSessionConfiguration({
    this.billingMethod,
    this.vpceConfigurationArns,
  });
}

class CreateRemoteAccessSessionResult {
  /// A container that describes the remote access session when the request to
  /// create a remote access session is sent.
  final RemoteAccessSession remoteAccessSession;

  CreateRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  static CreateRemoteAccessSessionResult fromJson(Map<String, dynamic> json) =>
      CreateRemoteAccessSessionResult();
}

class CreateUploadResult {
  /// The newly created upload.
  final Upload upload;

  CreateUploadResult({
    this.upload,
  });
  static CreateUploadResult fromJson(Map<String, dynamic> json) =>
      CreateUploadResult();
}

class CreateVpceConfigurationResult {
  /// An object containing information about your VPC endpoint configuration.
  final VpceConfiguration vpceConfiguration;

  CreateVpceConfigurationResult({
    this.vpceConfiguration,
  });
  static CreateVpceConfigurationResult fromJson(Map<String, dynamic> json) =>
      CreateVpceConfigurationResult();
}

class CustomerArtifactPaths {
  /// Comma-separated list of paths on the iOS device where the artifacts
  /// generated by the customer's tests will be pulled from.
  final List<String> iosPaths;

  /// Comma-separated list of paths on the Android device where the artifacts
  /// generated by the customer's tests will be pulled from.
  final List<String> androidPaths;

  /// Comma-separated list of paths in the test execution environment where the
  /// artifacts generated by the customer's tests will be pulled from.
  final List<String> deviceHostPaths;

  CustomerArtifactPaths({
    this.iosPaths,
    this.androidPaths,
    this.deviceHostPaths,
  });
  static CustomerArtifactPaths fromJson(Map<String, dynamic> json) =>
      CustomerArtifactPaths();
}

class DeleteDevicePoolResult {
  DeleteDevicePoolResult();
  static DeleteDevicePoolResult fromJson(Map<String, dynamic> json) =>
      DeleteDevicePoolResult();
}

class DeleteInstanceProfileResult {
  DeleteInstanceProfileResult();
  static DeleteInstanceProfileResult fromJson(Map<String, dynamic> json) =>
      DeleteInstanceProfileResult();
}

class DeleteNetworkProfileResult {
  DeleteNetworkProfileResult();
  static DeleteNetworkProfileResult fromJson(Map<String, dynamic> json) =>
      DeleteNetworkProfileResult();
}

class DeleteProjectResult {
  DeleteProjectResult();
  static DeleteProjectResult fromJson(Map<String, dynamic> json) =>
      DeleteProjectResult();
}

class DeleteRemoteAccessSessionResult {
  DeleteRemoteAccessSessionResult();
  static DeleteRemoteAccessSessionResult fromJson(Map<String, dynamic> json) =>
      DeleteRemoteAccessSessionResult();
}

class DeleteRunResult {
  DeleteRunResult();
  static DeleteRunResult fromJson(Map<String, dynamic> json) =>
      DeleteRunResult();
}

class DeleteUploadResult {
  DeleteUploadResult();
  static DeleteUploadResult fromJson(Map<String, dynamic> json) =>
      DeleteUploadResult();
}

class DeleteVpceConfigurationResult {
  DeleteVpceConfigurationResult();
  static DeleteVpceConfigurationResult fromJson(Map<String, dynamic> json) =>
      DeleteVpceConfigurationResult();
}

class Device {
  /// The device's ARN.
  final String arn;

  /// The device's display name.
  final String name;

  /// The device's manufacturer name.
  final String manufacturer;

  /// The device's model name.
  final String model;

  /// The device's model ID.
  final String modelId;

  /// The device's form factor.
  ///
  /// Allowed values include:
  ///
  /// *   PHONE: The phone form factor.
  ///
  /// *   TABLET: The tablet form factor.
  final String formFactor;

  /// The device's platform.
  ///
  /// Allowed values include:
  ///
  /// *   ANDROID: The Android platform.
  ///
  /// *   IOS: The iOS platform.
  final String platform;

  /// The device's operating system type.
  final String os;

  /// Information about the device's CPU.
  final Cpu cpu;

  /// The resolution of the device.
  final Resolution resolution;

  /// The device's heap size, expressed in bytes.
  final BigInt heapSize;

  /// The device's total memory size, expressed in bytes.
  final BigInt memory;

  /// The device's image name.
  final String image;

  /// The device's carrier.
  final String carrier;

  /// The device's radio.
  final String radio;

  /// Specifies whether remote access has been enabled for the specified device.
  final bool remoteAccessEnabled;

  /// This flag is set to `true` if remote debugging is enabled for the device.
  final bool remoteDebugEnabled;

  /// The type of fleet to which this device belongs. Possible values for fleet
  /// type are PRIVATE and PUBLIC.
  final String fleetType;

  /// The name of the fleet to which this device belongs.
  final String fleetName;

  /// The instances belonging to this device.
  final List<DeviceInstance> instances;

  /// Reflects how likely a device will be available for a test run. It is
  /// currently available in the ListDevices and GetDevice API methods.
  final String availability;

  Device({
    this.arn,
    this.name,
    this.manufacturer,
    this.model,
    this.modelId,
    this.formFactor,
    this.platform,
    this.os,
    this.cpu,
    this.resolution,
    this.heapSize,
    this.memory,
    this.image,
    this.carrier,
    this.radio,
    this.remoteAccessEnabled,
    this.remoteDebugEnabled,
    this.fleetType,
    this.fleetName,
    this.instances,
    this.availability,
  });
  static Device fromJson(Map<String, dynamic> json) => Device();
}

class DeviceFilter {
  /// The aspect of a device such as platform or model used as the selection
  /// criteria in a device filter.
  ///
  /// The supported operators for each attribute are provided in the following
  /// list.
  ///
  /// ARN
  ///
  /// The Amazon Resource Name (ARN) of the device. For example,
  /// "arn:aws:devicefarm:us-west-2::device:12345Example".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// PLATFORM
  ///
  /// The device platform. Valid values are "ANDROID" or "IOS".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// OS_VERSION
  ///
  /// The operating system version. For example, "10.3.2".
  ///
  ///  _Supported operators_: `EQUALS`, `GREATER_THAN`,
  /// `GREATER\_THAN\_OR_EQUALS`, `IN`, `LESS_THAN`, `LESS\_THAN\_OR_EQUALS`,
  /// `NOT_IN`
  ///
  /// MODEL
  ///
  /// The device model. For example, "iPad 5th Gen".
  ///
  ///  _Supported operators_: `CONTAINS`, `EQUALS`, `IN`, `NOT_IN`
  ///
  /// AVAILABILITY
  ///
  /// The current availability of the device. Valid values are "AVAILABLE",
  /// "HIGHLY\_AVAILABLE", "BUSY", or "TEMPORARY\_NOT_AVAILABLE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// FORM_FACTOR
  ///
  /// The device form factor. Valid values are "PHONE" or "TABLET".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// MANUFACTURER
  ///
  /// The device manufacturer. For example, "Apple".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// REMOTE\_ACCESS\_ENABLED
  ///
  /// Whether the device is enabled for remote access. Valid values are "TRUE"
  /// or "FALSE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// REMOTE\_DEBUG\_ENABLED
  ///
  /// Whether the device is enabled for remote debugging. Valid values are
  /// "TRUE" or "FALSE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// INSTANCE_ARN
  ///
  /// The Amazon Resource Name (ARN) of the device instance.
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// INSTANCE_LABELS
  ///
  /// The label of the device instance.
  ///
  ///  _Supported operators_: `CONTAINS`
  ///
  /// FLEET_TYPE
  ///
  /// The fleet type. Valid values are "PUBLIC" or "PRIVATE".
  ///
  ///  _Supported operators_: `EQUALS`
  final String attribute;

  /// Specifies how Device Farm compares the filter's attribute to the value.
  /// For the operators that are supported by each attribute, see the attribute
  /// descriptions.
  final String operator;

  /// An array of one or more filter values used in a device filter.
  ///
  ///  **Operator Values**
  ///
  /// *   The IN and NOT_IN operators can take a values array that has more than
  /// one element.
  ///
  /// *   The other operators require an array with a single element.
  ///
  ///
  ///  **Attribute Values**
  ///
  /// *   The PLATFORM attribute can be set to "ANDROID" or "IOS".
  ///
  /// *   The AVAILABILITY attribute can be set to "AVAILABLE",
  /// "HIGHLY\_AVAILABLE", "BUSY", or "TEMPORARY\_NOT_AVAILABLE".
  ///
  /// *   The FORM_FACTOR attribute can be set to "PHONE" or "TABLET".
  ///
  /// *   The FLEET_TYPE attribute can be set to "PUBLIC" or "PRIVATE".
  final List<String> values;

  DeviceFilter({
    this.attribute,
    this.operator,
    this.values,
  });
  static DeviceFilter fromJson(Map<String, dynamic> json) => DeviceFilter();
}

class DeviceInstance {
  /// The Amazon Resource Name (ARN) of the device instance.
  final String arn;

  /// The Amazon Resource Name (ARN) of the device.
  final String deviceArn;

  /// An array of strings describing the device instance.
  final List<String> labels;

  /// The status of the device instance. Valid values are listed below.
  final String status;

  /// Unique device identifier for the device instance.
  final String udid;

  /// A object containing information about the instance profile.
  final InstanceProfile instanceProfile;

  DeviceInstance({
    this.arn,
    this.deviceArn,
    this.labels,
    this.status,
    this.udid,
    this.instanceProfile,
  });
  static DeviceInstance fromJson(Map<String, dynamic> json) => DeviceInstance();
}

class DeviceMinutes {
  /// When specified, represents the total minutes used by the resource to run
  /// tests.
  final double total;

  /// When specified, represents only the sum of metered minutes used by the
  /// resource to run tests.
  final double metered;

  /// When specified, represents only the sum of unmetered minutes used by the
  /// resource to run tests.
  final double unmetered;

  DeviceMinutes({
    this.total,
    this.metered,
    this.unmetered,
  });
  static DeviceMinutes fromJson(Map<String, dynamic> json) => DeviceMinutes();
}

class DevicePool {
  /// The device pool's ARN.
  final String arn;

  /// The device pool's name.
  final String name;

  /// The device pool's description.
  final String description;

  /// The device pool's type.
  ///
  /// Allowed values include:
  ///
  /// *   CURATED: A device pool that is created and managed by AWS Device Farm.
  ///
  /// *   PRIVATE: A device pool that is created and managed by the device pool
  /// developer.
  final String type;

  /// Information about the device pool's rules.
  final List<Rule> rules;

  /// The number of devices that Device Farm can add to your device pool. Device
  /// Farm adds devices that are available and that meet the criteria that you
  /// assign for the `rules` parameter. Depending on how many devices meet these
  /// constraints, your device pool might contain fewer devices than the value
  /// for this parameter.
  ///
  /// By specifying the maximum number of devices, you can control the costs
  /// that you incur by running tests.
  final int maxDevices;

  DevicePool({
    this.arn,
    this.name,
    this.description,
    this.type,
    this.rules,
    this.maxDevices,
  });
  static DevicePool fromJson(Map<String, dynamic> json) => DevicePool();
}

class DevicePoolCompatibilityResult {
  /// The device (phone or tablet) that you wish to return information about.
  final Device device;

  /// Whether the result was compatible with the device pool.
  final bool compatible;

  /// Information about the compatibility.
  final List<IncompatibilityMessage> incompatibilityMessages;

  DevicePoolCompatibilityResult({
    this.device,
    this.compatible,
    this.incompatibilityMessages,
  });
  static DevicePoolCompatibilityResult fromJson(Map<String, dynamic> json) =>
      DevicePoolCompatibilityResult();
}

class DeviceSelectionConfiguration {
  /// Used to dynamically select a set of devices for a test run. A filter is
  /// made up of an attribute, an operator, and one or more values.
  ///
  /// *    **Attribute**
  ///
  ///     The aspect of a device such as platform or model used as the selection
  /// criteria in a device filter.
  ///
  ///     Allowed values include:
  ///
  ///     *   ARN: The Amazon Resource Name (ARN) of the device. For example,
  /// "arn:aws:devicefarm:us-west-2::device:12345Example".
  ///
  ///     *   PLATFORM: The device platform. Valid values are "ANDROID" or
  /// "IOS".
  ///
  ///     *   OS_VERSION: The operating system version. For example, "10.3.2".
  ///
  ///     *   MODEL: The device model. For example, "iPad 5th Gen".
  ///
  ///     *   AVAILABILITY: The current availability of the device. Valid values
  /// are "AVAILABLE", "HIGHLY\_AVAILABLE", "BUSY", or
  /// "TEMPORARY\_NOT_AVAILABLE".
  ///
  ///     *   FORM_FACTOR: The device form factor. Valid values are "PHONE" or
  /// "TABLET".
  ///
  ///     *   MANUFACTURER: The device manufacturer. For example, "Apple".
  ///
  ///     *   REMOTE\_ACCESS\_ENABLED: Whether the device is enabled for remote
  /// access. Valid values are "TRUE" or "FALSE".
  ///
  ///     *   REMOTE\_DEBUG\_ENABLED: Whether the device is enabled for remote
  /// debugging. Valid values are "TRUE" or "FALSE".
  ///
  ///     *   INSTANCE_ARN: The Amazon Resource Name (ARN) of the device
  /// instance.
  ///
  ///     *   INSTANCE_LABELS: The label of the device instance.
  ///
  ///     *   FLEET_TYPE: The fleet type. Valid values are "PUBLIC" or
  /// "PRIVATE".
  ///
  ///
  /// *    **Operator**
  ///
  ///     The filter operator.
  ///
  ///     *   The EQUALS operator is available for every attribute except
  /// INSTANCE_LABELS.
  ///
  ///     *   The CONTAINS operator is available for the INSTANCE_LABELS and
  /// MODEL attributes.
  ///
  ///     *   The IN and NOT\_IN operators are available for the ARN,
  /// OS\_VERSION, MODEL, MANUFACTURER, and INSTANCE_ARN attributes.
  ///
  ///     *   The LESS\_THAN, GREATER\_THAN, LESS\_THAN\_OR\_EQUALS, and
  /// GREATER\_THAN\_OR\_EQUALS operators are also available for the OS_VERSION
  /// attribute.
  ///
  ///
  /// *    **Values**
  ///
  ///     An array of one or more filter values.
  ///
  ///      **Operator Values**
  ///
  ///     *   The IN and NOT_IN operators can take a values array that has more
  /// than one element.
  ///
  ///     *   The other operators require an array with a single element.
  ///
  ///
  ///      **Attribute Values**
  ///
  ///     *   The PLATFORM attribute can be set to "ANDROID" or "IOS".
  ///
  ///     *   The AVAILABILITY attribute can be set to "AVAILABLE",
  /// "HIGHLY\_AVAILABLE", "BUSY", or "TEMPORARY\_NOT_AVAILABLE".
  ///
  ///     *   The FORM_FACTOR attribute can be set to "PHONE" or "TABLET".
  ///
  ///     *   The FLEET_TYPE attribute can be set to "PUBLIC" or "PRIVATE".
  final List<DeviceFilter> filters;

  /// The maximum number of devices to be included in a test run.
  final int maxDevices;

  DeviceSelectionConfiguration({
    @required this.filters,
    @required this.maxDevices,
  });
}

class DeviceSelectionResult {
  /// The filters in a device selection result.
  final List<DeviceFilter> filters;

  /// The number of devices that matched the device filter selection criteria.
  final int matchedDevicesCount;

  /// The maximum number of devices to be selected by a device filter and
  /// included in a test run.
  final int maxDevices;

  DeviceSelectionResult({
    this.filters,
    this.matchedDevicesCount,
    this.maxDevices,
  });
  static DeviceSelectionResult fromJson(Map<String, dynamic> json) =>
      DeviceSelectionResult();
}

class ExecutionConfiguration {
  /// The number of minutes a test run will execute before it times out.
  final int jobTimeoutMinutes;

  /// True if account cleanup is enabled at the beginning of the test;
  /// otherwise, false.
  final bool accountsCleanup;

  /// True if app package cleanup is enabled at the beginning of the test;
  /// otherwise, false.
  final bool appPackagesCleanup;

  /// Set to true to enable video capture; otherwise, set to false. The default
  /// is true.
  final bool videoCapture;

  /// When set to `true`, for private devices, Device Farm will not sign your
  /// app again. For public devices, Device Farm always signs your apps again
  /// and this parameter has no effect.
  ///
  /// For more information about how Device Farm re-signs your app(s), see [Do
  /// you modify my app?](https://aws.amazon.com/device-farm/faq/) in the _AWS
  /// Device Farm FAQs_.
  final bool skipAppResign;

  ExecutionConfiguration({
    this.jobTimeoutMinutes,
    this.accountsCleanup,
    this.appPackagesCleanup,
    this.videoCapture,
    this.skipAppResign,
  });
}

class GetAccountSettingsResult {
  /// The account settings.
  final AccountSettings accountSettings;

  GetAccountSettingsResult({
    this.accountSettings,
  });
  static GetAccountSettingsResult fromJson(Map<String, dynamic> json) =>
      GetAccountSettingsResult();
}

class GetDeviceInstanceResult {
  /// An object containing information about your device instance.
  final DeviceInstance deviceInstance;

  GetDeviceInstanceResult({
    this.deviceInstance,
  });
  static GetDeviceInstanceResult fromJson(Map<String, dynamic> json) =>
      GetDeviceInstanceResult();
}

class GetDevicePoolCompatibilityResult {
  /// Information about compatible devices.
  final List<DevicePoolCompatibilityResult> compatibleDevices;

  /// Information about incompatible devices.
  final List<DevicePoolCompatibilityResult> incompatibleDevices;

  GetDevicePoolCompatibilityResult({
    this.compatibleDevices,
    this.incompatibleDevices,
  });
  static GetDevicePoolCompatibilityResult fromJson(Map<String, dynamic> json) =>
      GetDevicePoolCompatibilityResult();
}

class GetDevicePoolResult {
  /// An object containing information about the requested device pool.
  final DevicePool devicePool;

  GetDevicePoolResult({
    this.devicePool,
  });
  static GetDevicePoolResult fromJson(Map<String, dynamic> json) =>
      GetDevicePoolResult();
}

class GetDeviceResult {
  /// An object containing information about the requested device.
  final Device device;

  GetDeviceResult({
    this.device,
  });
  static GetDeviceResult fromJson(Map<String, dynamic> json) =>
      GetDeviceResult();
}

class GetInstanceProfileResult {
  /// An object containing information about your instance profile.
  final InstanceProfile instanceProfile;

  GetInstanceProfileResult({
    this.instanceProfile,
  });
  static GetInstanceProfileResult fromJson(Map<String, dynamic> json) =>
      GetInstanceProfileResult();
}

class GetJobResult {
  /// An object containing information about the requested job.
  final Job job;

  GetJobResult({
    this.job,
  });
  static GetJobResult fromJson(Map<String, dynamic> json) => GetJobResult();
}

class GetNetworkProfileResult {
  /// The network profile.
  final NetworkProfile networkProfile;

  GetNetworkProfileResult({
    this.networkProfile,
  });
  static GetNetworkProfileResult fromJson(Map<String, dynamic> json) =>
      GetNetworkProfileResult();
}

class GetOfferingStatusResult {
  /// When specified, gets the offering status for the current period.
  final Map<String, OfferingStatus> current;

  /// When specified, gets the offering status for the next period.
  final Map<String, OfferingStatus> nextPeriod;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  GetOfferingStatusResult({
    this.current,
    this.nextPeriod,
    this.nextToken,
  });
  static GetOfferingStatusResult fromJson(Map<String, dynamic> json) =>
      GetOfferingStatusResult();
}

class GetProjectResult {
  /// The project you wish to get information about.
  final Project project;

  GetProjectResult({
    this.project,
  });
  static GetProjectResult fromJson(Map<String, dynamic> json) =>
      GetProjectResult();
}

class GetRemoteAccessSessionResult {
  /// A container that lists detailed information about the remote access
  /// session.
  final RemoteAccessSession remoteAccessSession;

  GetRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  static GetRemoteAccessSessionResult fromJson(Map<String, dynamic> json) =>
      GetRemoteAccessSessionResult();
}

class GetRunResult {
  /// The run you wish to get results from.
  final Run run;

  GetRunResult({
    this.run,
  });
  static GetRunResult fromJson(Map<String, dynamic> json) => GetRunResult();
}

class GetSuiteResult {
  /// A collection of one or more tests.
  final Suite suite;

  GetSuiteResult({
    this.suite,
  });
  static GetSuiteResult fromJson(Map<String, dynamic> json) => GetSuiteResult();
}

class GetTestResult {
  /// A test condition that is evaluated.
  final Test test;

  GetTestResult({
    this.test,
  });
  static GetTestResult fromJson(Map<String, dynamic> json) => GetTestResult();
}

class GetUploadResult {
  /// An app or a set of one or more tests to upload or that have been uploaded.
  final Upload upload;

  GetUploadResult({
    this.upload,
  });
  static GetUploadResult fromJson(Map<String, dynamic> json) =>
      GetUploadResult();
}

class GetVpceConfigurationResult {
  /// An object containing information about your VPC endpoint configuration.
  final VpceConfiguration vpceConfiguration;

  GetVpceConfigurationResult({
    this.vpceConfiguration,
  });
  static GetVpceConfigurationResult fromJson(Map<String, dynamic> json) =>
      GetVpceConfigurationResult();
}

class IncompatibilityMessage {
  /// A message about the incompatibility.
  final String message;

  /// The type of incompatibility.
  ///
  /// Allowed values include:
  ///
  /// *   ARN: The ARN.
  ///
  /// *   FORM_FACTOR: The form factor (for example, phone or tablet).
  ///
  /// *   MANUFACTURER: The manufacturer.
  ///
  /// *   PLATFORM: The platform (for example, Android or iOS).
  ///
  /// *   REMOTE\_ACCESS\_ENABLED: Whether the device is enabled for remote
  /// access.
  ///
  /// *   APPIUM_VERSION: The Appium version for the test.
  final String type;

  IncompatibilityMessage({
    this.message,
    this.type,
  });
  static IncompatibilityMessage fromJson(Map<String, dynamic> json) =>
      IncompatibilityMessage();
}

class InstallToRemoteAccessSessionResult {
  /// An app to upload or that has been uploaded.
  final Upload appUpload;

  InstallToRemoteAccessSessionResult({
    this.appUpload,
  });
  static InstallToRemoteAccessSessionResult fromJson(
          Map<String, dynamic> json) =>
      InstallToRemoteAccessSessionResult();
}

class InstanceProfile {
  /// The Amazon Resource Name (ARN) of the instance profile.
  final String arn;

  /// When set to `true`, Device Farm will remove app packages after a test run.
  /// The default value is `false` for private devices.
  final bool packageCleanup;

  /// An array of strings specifying the list of app packages that should not be
  /// cleaned up from the device after a test run is over.
  ///
  /// The list of packages is only considered if you set `packageCleanup` to
  /// `true`.
  final List<String> excludeAppPackagesFromCleanup;

  /// When set to `true`, Device Farm will reboot the instance after a test run.
  /// The default value is `true`.
  final bool rebootAfterUse;

  /// The name of the instance profile.
  final String name;

  /// The description of the instance profile.
  final String description;

  InstanceProfile({
    this.arn,
    this.packageCleanup,
    this.excludeAppPackagesFromCleanup,
    this.rebootAfterUse,
    this.name,
    this.description,
  });
  static InstanceProfile fromJson(Map<String, dynamic> json) =>
      InstanceProfile();
}

class Job {
  /// The job's ARN.
  final String arn;

  /// The job's name.
  final String name;

  /// The job's type.
  ///
  /// Allowed values include the following:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby test type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  final String type;

  /// When the job was created.
  final DateTime created;

  /// The job's status.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending status.
  ///
  /// *   PENDING_CONCURRENCY: A pending concurrency status.
  ///
  /// *   PENDING_DEVICE: A pending device status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SCHEDULING: A scheduling status.
  ///
  /// *   PREPARING: A preparing status.
  ///
  /// *   RUNNING: A running status.
  ///
  /// *   COMPLETED: A completed status.
  ///
  /// *   STOPPING: A stopping status.
  final String status;

  /// The job's result.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// The job's start time.
  final DateTime started;

  /// The job's stop time.
  final DateTime stopped;

  /// The job's result counters.
  final Counters counters;

  /// A message about the job's result.
  final String message;

  /// The device (phone or tablet).
  final Device device;

  /// The Amazon Resource Name (ARN) of the instance.
  final String instanceArn;

  /// Represents the total (metered or unmetered) minutes used by the job.
  final DeviceMinutes deviceMinutes;

  /// The endpoint for streaming device video.
  final String videoEndpoint;

  /// This value is set to true if video capture is enabled; otherwise, it is
  /// set to false.
  final bool videoCapture;

  Job({
    this.arn,
    this.name,
    this.type,
    this.created,
    this.status,
    this.result,
    this.started,
    this.stopped,
    this.counters,
    this.message,
    this.device,
    this.instanceArn,
    this.deviceMinutes,
    this.videoEndpoint,
    this.videoCapture,
  });
  static Job fromJson(Map<String, dynamic> json) => Job();
}

class ListArtifactsResult {
  /// Information about the artifacts.
  final List<Artifact> artifacts;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListArtifactsResult({
    this.artifacts,
    this.nextToken,
  });
  static ListArtifactsResult fromJson(Map<String, dynamic> json) =>
      ListArtifactsResult();
}

class ListDeviceInstancesResult {
  /// An object containing information about your device instances.
  final List<DeviceInstance> deviceInstances;

  /// An identifier that can be used in the next call to this operation to
  /// return the next set of items in the list.
  final String nextToken;

  ListDeviceInstancesResult({
    this.deviceInstances,
    this.nextToken,
  });
  static ListDeviceInstancesResult fromJson(Map<String, dynamic> json) =>
      ListDeviceInstancesResult();
}

class ListDevicePoolsResult {
  /// Information about the device pools.
  final List<DevicePool> devicePools;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListDevicePoolsResult({
    this.devicePools,
    this.nextToken,
  });
  static ListDevicePoolsResult fromJson(Map<String, dynamic> json) =>
      ListDevicePoolsResult();
}

class ListDevicesResult {
  /// Information about the devices.
  final List<Device> devices;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListDevicesResult({
    this.devices,
    this.nextToken,
  });
  static ListDevicesResult fromJson(Map<String, dynamic> json) =>
      ListDevicesResult();
}

class ListInstanceProfilesResult {
  /// An object containing information about your instance profiles.
  final List<InstanceProfile> instanceProfiles;

  /// An identifier that can be used in the next call to this operation to
  /// return the next set of items in the list.
  final String nextToken;

  ListInstanceProfilesResult({
    this.instanceProfiles,
    this.nextToken,
  });
  static ListInstanceProfilesResult fromJson(Map<String, dynamic> json) =>
      ListInstanceProfilesResult();
}

class ListJobsResult {
  /// Information about the jobs.
  final List<Job> jobs;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListJobsResult({
    this.jobs,
    this.nextToken,
  });
  static ListJobsResult fromJson(Map<String, dynamic> json) => ListJobsResult();
}

class ListNetworkProfilesResult {
  /// A list of the available network profiles.
  final List<NetworkProfile> networkProfiles;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListNetworkProfilesResult({
    this.networkProfiles,
    this.nextToken,
  });
  static ListNetworkProfilesResult fromJson(Map<String, dynamic> json) =>
      ListNetworkProfilesResult();
}

class ListOfferingPromotionsResult {
  /// Information about the offering promotions.
  final List<OfferingPromotion> offeringPromotions;

  /// An identifier to be used in the next call to this operation, to return the
  /// next set of items in the list.
  final String nextToken;

  ListOfferingPromotionsResult({
    this.offeringPromotions,
    this.nextToken,
  });
  static ListOfferingPromotionsResult fromJson(Map<String, dynamic> json) =>
      ListOfferingPromotionsResult();
}

class ListOfferingTransactionsResult {
  /// The audit log of subscriptions you have purchased and modified through AWS
  /// Device Farm.
  final List<OfferingTransaction> offeringTransactions;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListOfferingTransactionsResult({
    this.offeringTransactions,
    this.nextToken,
  });
  static ListOfferingTransactionsResult fromJson(Map<String, dynamic> json) =>
      ListOfferingTransactionsResult();
}

class ListOfferingsResult {
  /// A value representing the list offering results.
  final List<Offering> offerings;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListOfferingsResult({
    this.offerings,
    this.nextToken,
  });
  static ListOfferingsResult fromJson(Map<String, dynamic> json) =>
      ListOfferingsResult();
}

class ListProjectsResult {
  /// Information about the projects.
  final List<Project> projects;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListProjectsResult({
    this.projects,
    this.nextToken,
  });
  static ListProjectsResult fromJson(Map<String, dynamic> json) =>
      ListProjectsResult();
}

class ListRemoteAccessSessionsResult {
  /// A container representing the metadata from the service about each remote
  /// access session you are requesting.
  final List<RemoteAccessSession> remoteAccessSessions;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListRemoteAccessSessionsResult({
    this.remoteAccessSessions,
    this.nextToken,
  });
  static ListRemoteAccessSessionsResult fromJson(Map<String, dynamic> json) =>
      ListRemoteAccessSessionsResult();
}

class ListRunsResult {
  /// Information about the runs.
  final List<Run> runs;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListRunsResult({
    this.runs,
    this.nextToken,
  });
  static ListRunsResult fromJson(Map<String, dynamic> json) => ListRunsResult();
}

class ListSamplesResult {
  /// Information about the samples.
  final List<Sample> samples;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListSamplesResult({
    this.samples,
    this.nextToken,
  });
  static ListSamplesResult fromJson(Map<String, dynamic> json) =>
      ListSamplesResult();
}

class ListSuitesResult {
  /// Information about the suites.
  final List<Suite> suites;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListSuitesResult({
    this.suites,
    this.nextToken,
  });
  static ListSuitesResult fromJson(Map<String, dynamic> json) =>
      ListSuitesResult();
}

class ListTagsForResourceResponse {
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters, and tag values
  /// can have a maximum length of 256 characters.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTestsResult {
  /// Information about the tests.
  final List<Test> tests;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListTestsResult({
    this.tests,
    this.nextToken,
  });
  static ListTestsResult fromJson(Map<String, dynamic> json) =>
      ListTestsResult();
}

class ListUniqueProblemsResult {
  /// Information about the unique problems.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final Map<String, List<UniqueProblem>> uniqueProblems;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListUniqueProblemsResult({
    this.uniqueProblems,
    this.nextToken,
  });
  static ListUniqueProblemsResult fromJson(Map<String, dynamic> json) =>
      ListUniqueProblemsResult();
}

class ListUploadsResult {
  /// Information about the uploads.
  final List<Upload> uploads;

  /// If the number of items that are returned is significantly large, this is
  /// an identifier that is also returned, which can be used in a subsequent
  /// call to this operation to return the next set of items in the list.
  final String nextToken;

  ListUploadsResult({
    this.uploads,
    this.nextToken,
  });
  static ListUploadsResult fromJson(Map<String, dynamic> json) =>
      ListUploadsResult();
}

class ListVpceConfigurationsResult {
  /// An array of `VPCEConfiguration` objects containing information about your
  /// VPC endpoint configuration.
  final List<VpceConfiguration> vpceConfigurations;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String nextToken;

  ListVpceConfigurationsResult({
    this.vpceConfigurations,
    this.nextToken,
  });
  static ListVpceConfigurationsResult fromJson(Map<String, dynamic> json) =>
      ListVpceConfigurationsResult();
}

class Location {
  /// The latitude.
  final double latitude;

  /// The longitude.
  final double longitude;

  Location({
    @required this.latitude,
    @required this.longitude,
  });
  static Location fromJson(Map<String, dynamic> json) => Location();
}

class MonetaryAmount {
  /// The numerical amount of an offering or transaction.
  final double amount;

  /// The currency code of a monetary amount. For example, `USD` means "U.S.
  /// dollars."
  final String currencyCode;

  MonetaryAmount({
    this.amount,
    this.currencyCode,
  });
  static MonetaryAmount fromJson(Map<String, dynamic> json) => MonetaryAmount();
}

class NetworkProfile {
  /// The Amazon Resource Name (ARN) of the network profile.
  final String arn;

  /// The name of the network profile.
  final String name;

  /// The description of the network profile.
  final String description;

  /// The type of network profile. Valid values are listed below.
  final String type;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  final BigInt uplinkBandwidthBits;

  /// The data throughput rate in bits per second, as an integer from 0 to
  /// 104857600.
  final BigInt downlinkBandwidthBits;

  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  final BigInt uplinkDelayMs;

  /// Delay time for all packets to destination in milliseconds as an integer
  /// from 0 to 2000.
  final BigInt downlinkDelayMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  final BigInt uplinkJitterMs;

  /// Time variation in the delay of received packets in milliseconds as an
  /// integer from 0 to 2000.
  final BigInt downlinkJitterMs;

  /// Proportion of transmitted packets that fail to arrive from 0 to 100
  /// percent.
  final int uplinkLossPercent;

  /// Proportion of received packets that fail to arrive from 0 to 100 percent.
  final int downlinkLossPercent;

  NetworkProfile({
    this.arn,
    this.name,
    this.description,
    this.type,
    this.uplinkBandwidthBits,
    this.downlinkBandwidthBits,
    this.uplinkDelayMs,
    this.downlinkDelayMs,
    this.uplinkJitterMs,
    this.downlinkJitterMs,
    this.uplinkLossPercent,
    this.downlinkLossPercent,
  });
  static NetworkProfile fromJson(Map<String, dynamic> json) => NetworkProfile();
}

class Offering {
  /// The ID that corresponds to a device offering.
  final String id;

  /// A string describing the offering.
  final String description;

  /// The type of offering (e.g., "RECURRING") for a device.
  final String type;

  /// The platform of the device (e.g., ANDROID or IOS).
  final String platform;

  /// Specifies whether there are recurring charges for the offering.
  final List<RecurringCharge> recurringCharges;

  Offering({
    this.id,
    this.description,
    this.type,
    this.platform,
    this.recurringCharges,
  });
  static Offering fromJson(Map<String, dynamic> json) => Offering();
}

class OfferingPromotion {
  /// The ID of the offering promotion.
  final String id;

  /// A string describing the offering promotion.
  final String description;

  OfferingPromotion({
    this.id,
    this.description,
  });
  static OfferingPromotion fromJson(Map<String, dynamic> json) =>
      OfferingPromotion();
}

class OfferingStatus {
  /// The type specified for the offering status.
  final String type;

  /// Represents the metadata of an offering status.
  final Offering offering;

  /// The number of available devices in the offering.
  final int quantity;

  /// The date on which the offering is effective.
  final DateTime effectiveOn;

  OfferingStatus({
    this.type,
    this.offering,
    this.quantity,
    this.effectiveOn,
  });
  static OfferingStatus fromJson(Map<String, dynamic> json) => OfferingStatus();
}

class OfferingTransaction {
  /// The status of an offering transaction.
  final OfferingStatus offeringStatus;

  /// The transaction ID of the offering transaction.
  final String transactionId;

  /// The ID that corresponds to a device offering promotion.
  final String offeringPromotionId;

  /// The date on which an offering transaction was created.
  final DateTime createdOn;

  /// The cost of an offering transaction.
  final MonetaryAmount cost;

  OfferingTransaction({
    this.offeringStatus,
    this.transactionId,
    this.offeringPromotionId,
    this.createdOn,
    this.cost,
  });
  static OfferingTransaction fromJson(Map<String, dynamic> json) =>
      OfferingTransaction();
}

class Problem {
  /// Information about the associated run.
  final ProblemDetail run;

  /// Information about the associated job.
  final ProblemDetail job;

  /// Information about the associated suite.
  final ProblemDetail suite;

  /// Information about the associated test.
  final ProblemDetail test;

  /// Information about the associated device.
  final Device device;

  /// The problem's result.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// A message about the problem's result.
  final String message;

  Problem({
    this.run,
    this.job,
    this.suite,
    this.test,
    this.device,
    this.result,
    this.message,
  });
  static Problem fromJson(Map<String, dynamic> json) => Problem();
}

class ProblemDetail {
  /// The problem detail's ARN.
  final String arn;

  /// The problem detail's name.
  final String name;

  ProblemDetail({
    this.arn,
    this.name,
  });
  static ProblemDetail fromJson(Map<String, dynamic> json) => ProblemDetail();
}

class Project {
  /// The project's ARN.
  final String arn;

  /// The project's name.
  final String name;

  /// The default number of minutes (at the project level) a test run will
  /// execute before it times out. The default value is 150 minutes.
  final int defaultJobTimeoutMinutes;

  /// When the project was created.
  final DateTime created;

  Project({
    this.arn,
    this.name,
    this.defaultJobTimeoutMinutes,
    this.created,
  });
  static Project fromJson(Map<String, dynamic> json) => Project();
}

class PurchaseOfferingResult {
  /// Represents the offering transaction for the purchase result.
  final OfferingTransaction offeringTransaction;

  PurchaseOfferingResult({
    this.offeringTransaction,
  });
  static PurchaseOfferingResult fromJson(Map<String, dynamic> json) =>
      PurchaseOfferingResult();
}

class Radios {
  /// True if Wi-Fi is enabled at the beginning of the test; otherwise, false.
  final bool wifi;

  /// True if Bluetooth is enabled at the beginning of the test; otherwise,
  /// false.
  final bool bluetooth;

  /// True if NFC is enabled at the beginning of the test; otherwise, false.
  final bool nfc;

  /// True if GPS is enabled at the beginning of the test; otherwise, false.
  final bool gps;

  Radios({
    this.wifi,
    this.bluetooth,
    this.nfc,
    this.gps,
  });
  static Radios fromJson(Map<String, dynamic> json) => Radios();
}

class RecurringCharge {
  /// The cost of the recurring charge.
  final MonetaryAmount cost;

  /// The frequency in which charges will recur.
  final String frequency;

  RecurringCharge({
    this.cost,
    this.frequency,
  });
  static RecurringCharge fromJson(Map<String, dynamic> json) =>
      RecurringCharge();
}

class RemoteAccessSession {
  /// The Amazon Resource Name (ARN) of the remote access session.
  final String arn;

  /// The name of the remote access session.
  final String name;

  /// The date and time the remote access session was created.
  final DateTime created;

  /// The status of the remote access session. Can be any of the following:
  ///
  /// *   PENDING: A pending status.
  ///
  /// *   PENDING_CONCURRENCY: A pending concurrency status.
  ///
  /// *   PENDING_DEVICE: A pending device status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SCHEDULING: A scheduling status.
  ///
  /// *   PREPARING: A preparing status.
  ///
  /// *   RUNNING: A running status.
  ///
  /// *   COMPLETED: A completed status.
  ///
  /// *   STOPPING: A stopping status.
  final String status;

  /// The result of the remote access session. Can be any of the following:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// A message about the remote access session.
  final String message;

  /// The date and time the remote access session was started.
  final DateTime started;

  /// The date and time the remote access session was stopped.
  final DateTime stopped;

  /// The device (phone or tablet) used in the remote access session.
  final Device device;

  /// The Amazon Resource Name (ARN) of the instance.
  final String instanceArn;

  /// This flag is set to `true` if remote debugging is enabled for the remote
  /// access session.
  final bool remoteDebugEnabled;

  /// This flag is set to `true` if remote recording is enabled for the remote
  /// access session.
  final bool remoteRecordEnabled;

  /// The Amazon Resource Name (ARN) for the app to be recorded in the remote
  /// access session.
  final String remoteRecordAppArn;

  /// IP address of the EC2 host where you need to connect to remotely debug
  /// devices. Only returned if remote debugging is enabled for the remote
  /// access session.
  final String hostAddress;

  /// Unique identifier of your client for the remote access session. Only
  /// returned if remote debugging is enabled for the remote access session.
  final String clientId;

  /// The billing method of the remote access session. Possible values include
  /// `METERED` or `UNMETERED`. For more information about metered devices, see
  /// [AWS Device Farm
  /// terminology](https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html#welcome-terminology)."
  final String billingMethod;

  /// The number of minutes a device is used in a remote access session
  /// (including setup and teardown minutes).
  final DeviceMinutes deviceMinutes;

  /// The endpoint for the remote access sesssion.
  final String endpoint;

  /// Unique device identifier for the remote device. Only returned if remote
  /// debugging is enabled for the remote access session.
  final String deviceUdid;

  /// The interaction mode of the remote access session. Valid values are:
  ///
  /// *   INTERACTIVE: You can interact with the iOS device by viewing,
  /// touching, and rotating the screen. You **cannot** run XCUITest
  /// framework-based tests in this mode.
  ///
  /// *   NO_VIDEO: You are connected to the device but cannot interact with it
  /// or view the screen. This mode has the fastest test execution speed. You
  /// **can** run XCUITest framework-based tests in this mode.
  ///
  /// *   VIDEO_ONLY: You can view the screen but cannot touch or rotate it. You
  /// **can** run XCUITest framework-based tests and watch the screen in this
  /// mode.
  final String interactionMode;

  /// When set to `true`, for private devices, Device Farm will not sign your
  /// app again. For public devices, Device Farm always signs your apps again
  /// and this parameter has no effect.
  ///
  /// For more information about how Device Farm re-signs your app(s), see [Do
  /// you modify my app?](https://aws.amazon.com/device-farm/faq/) in the _AWS
  /// Device Farm FAQs_.
  final bool skipAppResign;

  RemoteAccessSession({
    this.arn,
    this.name,
    this.created,
    this.status,
    this.result,
    this.message,
    this.started,
    this.stopped,
    this.device,
    this.instanceArn,
    this.remoteDebugEnabled,
    this.remoteRecordEnabled,
    this.remoteRecordAppArn,
    this.hostAddress,
    this.clientId,
    this.billingMethod,
    this.deviceMinutes,
    this.endpoint,
    this.deviceUdid,
    this.interactionMode,
    this.skipAppResign,
  });
  static RemoteAccessSession fromJson(Map<String, dynamic> json) =>
      RemoteAccessSession();
}

class RenewOfferingResult {
  /// Represents the status of the offering transaction for the renewal.
  final OfferingTransaction offeringTransaction;

  RenewOfferingResult({
    this.offeringTransaction,
  });
  static RenewOfferingResult fromJson(Map<String, dynamic> json) =>
      RenewOfferingResult();
}

class Resolution {
  /// The screen resolution's width, expressed in pixels.
  final int width;

  /// The screen resolution's height, expressed in pixels.
  final int height;

  Resolution({
    this.width,
    this.height,
  });
  static Resolution fromJson(Map<String, dynamic> json) => Resolution();
}

class Rule {
  /// The rule's stringified attribute. For example, specify the value as
  /// `"\\"abc\\""`.
  ///
  /// The supported operators for each attribute are provided in the following
  /// list.
  ///
  /// APPIUM_VERSION
  ///
  /// The Appium version for the test.
  ///
  ///  _Supported operators_: `CONTAINS`
  ///
  /// ARN
  ///
  /// The Amazon Resource Name (ARN) of the device. For example,
  /// "arn:aws:devicefarm:us-west-2::device:12345Example".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// AVAILABILITY
  ///
  /// The current availability of the device. Valid values are "AVAILABLE",
  /// "HIGHLY\_AVAILABLE", "BUSY", or "TEMPORARY\_NOT_AVAILABLE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// FLEET_TYPE
  ///
  /// The fleet type. Valid values are "PUBLIC" or "PRIVATE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// FORM_FACTOR
  ///
  /// The device form factor. Valid values are "PHONE" or "TABLET".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// INSTANCE_ARN
  ///
  /// The Amazon Resource Name (ARN) of the device instance.
  ///
  ///  _Supported operators_: `IN`, `NOT_IN`
  ///
  /// INSTANCE_LABELS
  ///
  /// The label of the device instance.
  ///
  ///  _Supported operators_: `CONTAINS`
  ///
  /// MANUFACTURER
  ///
  /// The device manufacturer. For example, "Apple".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// MODEL
  ///
  /// The device model, such as "Apple iPad Air 2" or "Google Pixel".
  ///
  ///  _Supported operators_: `CONTAINS`, `EQUALS`, `IN`, `NOT_IN`
  ///
  /// OS_VERSION
  ///
  /// The operating system version. For example, "10.3.2".
  ///
  ///  _Supported operators_: `EQUALS`, `GREATER_THAN`,
  /// `GREATER\_THAN\_OR_EQUALS`, `IN`, `LESS_THAN`, `LESS\_THAN\_OR_EQUALS`,
  /// `NOT_IN`
  ///
  /// PLATFORM
  ///
  /// The device platform. Valid values are "ANDROID" or "IOS".
  ///
  ///  _Supported operators_: `EQUALS`, `IN`, `NOT_IN`
  ///
  /// REMOTE\_ACCESS\_ENABLED
  ///
  /// Whether the device is enabled for remote access. Valid values are "TRUE"
  /// or "FALSE".
  ///
  ///  _Supported operators_: `EQUALS`
  ///
  /// REMOTE\_DEBUG\_ENABLED
  ///
  /// Whether the device is enabled for remote debugging. Valid values are
  /// "TRUE" or "FALSE".
  ///
  ///  _Supported operators_: `EQUALS`
  final String attribute;

  /// Specifies how Device Farm compares the rule's attribute to the value. For
  /// the operators that are supported by each attribute, see the attribute
  /// descriptions.
  final String operator;

  /// The rule's value.
  final String value;

  Rule({
    this.attribute,
    this.operator,
    this.value,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule();
}

class Run {
  /// The run's ARN.
  final String arn;

  /// The run's name.
  final String name;

  /// The run's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  final String type;

  /// The run's platform.
  ///
  /// Allowed values include:
  ///
  /// *   ANDROID: The Android platform.
  ///
  /// *   IOS: The iOS platform.
  final String platform;

  /// When the run was created.
  final DateTime created;

  /// The run's status.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending status.
  ///
  /// *   PENDING_CONCURRENCY: A pending concurrency status.
  ///
  /// *   PENDING_DEVICE: A pending device status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SCHEDULING: A scheduling status.
  ///
  /// *   PREPARING: A preparing status.
  ///
  /// *   RUNNING: A running status.
  ///
  /// *   COMPLETED: A completed status.
  ///
  /// *   STOPPING: A stopping status.
  final String status;

  /// The run's result.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// The run's start time.
  final DateTime started;

  /// The run's stop time.
  final DateTime stopped;

  /// The run's result counters.
  final Counters counters;

  /// A message about the run's result.
  final String message;

  /// The total number of jobs for the run.
  final int totalJobs;

  /// The total number of completed jobs.
  final int completedJobs;

  /// Specifies the billing method for a test run: `metered` or `unmetered`. If
  /// the parameter is not specified, the default value is `metered`.
  final String billingMethod;

  /// Represents the total (metered or unmetered) minutes used by the test run.
  final DeviceMinutes deviceMinutes;

  /// The network profile being used for a test run.
  final NetworkProfile networkProfile;

  /// Read-only URL for an object in S3 bucket where you can get the parsing
  /// results of the test package. If the test package doesn't parse, the reason
  /// why it doesn't parse appears in the file that this URL points to.
  final String parsingResultUrl;

  /// Supporting field for the result field. Set only if `result` is `SKIPPED`.
  /// `PARSING_FAILED` if the result is skipped because of test package parsing
  /// failure.
  final String resultCode;

  /// For fuzz tests, this is a seed to use for randomizing the UI fuzz test.
  /// Using the same seed value between tests ensures identical event sequences.
  final int seed;

  /// An app to upload or that has been uploaded.
  final String appUpload;

  /// For fuzz tests, this is the number of events, between 1 and 10000, that
  /// the UI fuzz test should perform.
  final int eventCount;

  /// The number of minutes the job will execute before it times out.
  final int jobTimeoutMinutes;

  /// The ARN of the device pool for the run.
  final String devicePoolArn;

  /// Information about the locale that is used for the run.
  final String locale;

  /// Information about the radio states for the run.
  final Radios radios;

  /// Information about the location that is used for the run.
  final Location location;

  /// Output `CustomerArtifactPaths` object for the test run.
  final CustomerArtifactPaths customerArtifactPaths;

  /// The Device Farm console URL for the recording of the run.
  final String webUrl;

  /// When set to `true`, for private devices, Device Farm will not sign your
  /// app again. For public devices, Device Farm always signs your apps again
  /// and this parameter has no effect.
  ///
  /// For more information about how Device Farm re-signs your app(s), see [Do
  /// you modify my app?](https://aws.amazon.com/device-farm/faq/) in the _AWS
  /// Device Farm FAQs_.
  final bool skipAppResign;

  /// The ARN of the YAML-formatted test specification for the run.
  final String testSpecArn;

  /// The results of a device filter used to select the devices for a test run.
  final DeviceSelectionResult deviceSelectionResult;

  Run({
    this.arn,
    this.name,
    this.type,
    this.platform,
    this.created,
    this.status,
    this.result,
    this.started,
    this.stopped,
    this.counters,
    this.message,
    this.totalJobs,
    this.completedJobs,
    this.billingMethod,
    this.deviceMinutes,
    this.networkProfile,
    this.parsingResultUrl,
    this.resultCode,
    this.seed,
    this.appUpload,
    this.eventCount,
    this.jobTimeoutMinutes,
    this.devicePoolArn,
    this.locale,
    this.radios,
    this.location,
    this.customerArtifactPaths,
    this.webUrl,
    this.skipAppResign,
    this.testSpecArn,
    this.deviceSelectionResult,
  });
  static Run fromJson(Map<String, dynamic> json) => Run();
}

class Sample {
  /// The sample's ARN.
  final String arn;

  /// The sample's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   CPU: A CPU sample type. This is expressed as the app processing CPU
  /// time (including child processes) as reported by process, as a percentage.
  ///
  /// *   MEMORY: A memory usage sample type. This is expressed as the total
  /// proportional set size of an app process, in kilobytes.
  ///
  /// *   NATIVE\_AVG\_DRAWTIME
  ///
  /// *   NATIVE_FPS
  ///
  /// *   NATIVE_FRAMES
  ///
  /// *   NATIVE\_MAX\_DRAWTIME
  ///
  /// *   NATIVE\_MIN\_DRAWTIME
  ///
  /// *   OPENGL\_AVG\_DRAWTIME
  ///
  /// *   OPENGL_FPS
  ///
  /// *   OPENGL_FRAMES
  ///
  /// *   OPENGL\_MAX\_DRAWTIME
  ///
  /// *   OPENGL\_MIN\_DRAWTIME
  ///
  /// *   RX
  ///
  /// *   RX_RATE: The total number of bytes per second (TCP and UDP) that are
  /// sent, by app process.
  ///
  /// *   THREADS: A threads sample type. This is expressed as the total number
  /// of threads per app process.
  ///
  /// *   TX
  ///
  /// *   TX_RATE: The total number of bytes per second (TCP and UDP) that are
  /// received, by app process.
  final String type;

  /// The pre-signed Amazon S3 URL that can be used with a corresponding GET
  /// request to download the sample's file.
  final String url;

  Sample({
    this.arn,
    this.type,
    this.url,
  });
  static Sample fromJson(Map<String, dynamic> json) => Sample();
}

class ScheduleRunConfiguration {
  /// The ARN of the extra data for the run. The extra data is a .zip file that
  /// AWS Device Farm will extract to external data for Android or the app's
  /// sandbox for iOS.
  final String extraDataPackageArn;

  /// Reserved for internal use.
  final String networkProfileArn;

  /// Information about the locale that is used for the run.
  final String locale;

  /// Information about the location that is used for the run.
  final Location location;

  /// An array of Amazon Resource Names (ARNs) for your VPC endpoint
  /// configurations.
  final List<String> vpceConfigurationArns;

  /// Input `CustomerArtifactPaths` object for the scheduled run configuration.
  final CustomerArtifactPaths customerArtifactPaths;

  /// Information about the radio states for the run.
  final Radios radios;

  /// A list of auxiliary apps for the run.
  final List<String> auxiliaryApps;

  /// Specifies the billing method for a test run: `metered` or `unmetered`. If
  /// the parameter is not specified, the default value is `metered`.
  final String billingMethod;

  ScheduleRunConfiguration({
    this.extraDataPackageArn,
    this.networkProfileArn,
    this.locale,
    this.location,
    this.vpceConfigurationArns,
    this.customerArtifactPaths,
    this.radios,
    this.auxiliaryApps,
    this.billingMethod,
  });
}

class ScheduleRunResult {
  /// Information about the scheduled run.
  final Run run;

  ScheduleRunResult({
    this.run,
  });
  static ScheduleRunResult fromJson(Map<String, dynamic> json) =>
      ScheduleRunResult();
}

class ScheduleRunTest {
  /// The test's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  final String type;

  /// The ARN of the uploaded test that will be run.
  final String testPackageArn;

  /// The ARN of the YAML-formatted test specification.
  final String testSpecArn;

  /// The test's filter.
  final String filter;

  /// The test's parameters, such as test framework parameters and fixture
  /// settings. Parameters are represented by name-value pairs of strings.
  ///
  /// For all tests:
  ///
  /// *   app\_performance\_monitoring: Performance monitoring is enabled by
  /// default. Set this parameter to "false" to disable it.
  ///
  ///
  /// For Calabash tests:
  ///
  /// *   profile: A cucumber profile, for example, "my\_profile\_name".
  ///
  /// *   tags: You can limit execution to features or scenarios that have (or
  /// don't have) certain tags, for example, "@smoke" or "@smoke,~@wip".
  ///
  ///
  /// For Appium tests (all types):
  ///
  /// *   appium_version: The Appium version. Currently supported values are
  /// "1.6.5" (and higher), "latest", and "default".
  ///
  ///     *   “latest” will run the latest Appium version supported by Device
  /// Farm (1.9.1).
  ///
  ///     *   For “default”, Device Farm will choose a compatible version of
  /// Appium for the device. The current behavior is to run 1.7.2 on Android
  /// devices and iOS 9 and earlier, 1.7.2 for iOS 10 and later.
  ///
  ///     *   This behavior is subject to change.
  ///
  ///
  ///
  /// For Fuzz tests (Android only):
  ///
  /// *   event_count: The number of events, between 1 and 10000, that the UI
  /// fuzz test should perform.
  ///
  /// *   throttle: The time, in ms, between 0 and 1000, that the UI fuzz test
  /// should wait between events.
  ///
  /// *   seed: A seed to use for randomizing the UI fuzz test. Using the same
  /// seed value between tests ensures identical event sequences.
  ///
  ///
  /// For Explorer tests:
  ///
  /// *   username: A username to use if the Explorer encounters a login form.
  /// If not supplied, no username will be inserted.
  ///
  /// *   password: A password to use if the Explorer encounters a login form.
  /// If not supplied, no password will be inserted.
  ///
  ///
  /// For Instrumentation:
  ///
  /// *   filter: A test filter string. Examples:
  ///
  ///     *   Running a single test case: "com.android.abc.Test1"
  ///
  ///     *   Running a single test: "com.android.abc.Test1#smoke"
  ///
  ///     *   Running multiple tests:
  /// "com.android.abc.Test1,com.android.abc.Test2"
  ///
  ///
  ///
  /// For XCTest and XCTestUI:
  ///
  /// *   filter: A test filter string. Examples:
  ///
  ///     *   Running a single test class: "LoginTests"
  ///
  ///     *   Running a multiple test classes: "LoginTests,SmokeTests"
  ///
  ///     *   Running a single test: "LoginTests/testValid"
  ///
  ///     *   Running multiple tests:
  /// "LoginTests/testValid,LoginTests/testInvalid"
  ///
  ///
  ///
  /// For UIAutomator:
  ///
  /// *   filter: A test filter string. Examples:
  ///
  ///     *   Running a single test case: "com.android.abc.Test1"
  ///
  ///     *   Running a single test: "com.android.abc.Test1#smoke"
  ///
  ///     *   Running multiple tests:
  /// "com.android.abc.Test1,com.android.abc.Test2"
  final Map<String, String> parameters;

  ScheduleRunTest({
    @required this.type,
    this.testPackageArn,
    this.testSpecArn,
    this.filter,
    this.parameters,
  });
}

class StopJobResult {
  /// The job that was stopped.
  final Job job;

  StopJobResult({
    this.job,
  });
  static StopJobResult fromJson(Map<String, dynamic> json) => StopJobResult();
}

class StopRemoteAccessSessionResult {
  /// A container representing the metadata from the service about the remote
  /// access session you are stopping.
  final RemoteAccessSession remoteAccessSession;

  StopRemoteAccessSessionResult({
    this.remoteAccessSession,
  });
  static StopRemoteAccessSessionResult fromJson(Map<String, dynamic> json) =>
      StopRemoteAccessSessionResult();
}

class StopRunResult {
  /// The run that was stopped.
  final Run run;

  StopRunResult({
    this.run,
  });
  static StopRunResult fromJson(Map<String, dynamic> json) => StopRunResult();
}

class Suite {
  /// The suite's ARN.
  final String arn;

  /// The suite's name.
  final String name;

  /// The suite's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  final String type;

  /// When the suite was created.
  final DateTime created;

  /// The suite's status.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending status.
  ///
  /// *   PENDING_CONCURRENCY: A pending concurrency status.
  ///
  /// *   PENDING_DEVICE: A pending device status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SCHEDULING: A scheduling status.
  ///
  /// *   PREPARING: A preparing status.
  ///
  /// *   RUNNING: A running status.
  ///
  /// *   COMPLETED: A completed status.
  ///
  /// *   STOPPING: A stopping status.
  final String status;

  /// The suite's result.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// The suite's start time.
  final DateTime started;

  /// The suite's stop time.
  final DateTime stopped;

  /// The suite's result counters.
  final Counters counters;

  /// A message about the suite's result.
  final String message;

  /// Represents the total (metered or unmetered) minutes used by the test
  /// suite.
  final DeviceMinutes deviceMinutes;

  Suite({
    this.arn,
    this.name,
    this.type,
    this.created,
    this.status,
    this.result,
    this.started,
    this.stopped,
    this.counters,
    this.message,
    this.deviceMinutes,
  });
  static Suite fromJson(Map<String, dynamic> json) => Suite();
}

class Tag {
  /// One part of a key-value pair that make up a tag. A `key` is a general
  /// label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A `value` acts
  /// as a descriptor within a tag category (key).
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class Test {
  /// The test's ARN.
  final String arn;

  /// The test's name.
  final String name;

  /// The test's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   BUILTIN_FUZZ: The built-in fuzz type.
  ///
  /// *   BUILTIN_EXPLORER: For Android, an app explorer that will traverse an
  /// Android app, interacting with it and capturing screenshots at the same
  /// time.
  ///
  /// *   APPIUM\_JAVA\_JUNIT: The Appium Java JUnit type.
  ///
  /// *   APPIUM\_JAVA\_TESTNG: The Appium Java TestNG type.
  ///
  /// *   APPIUM_PYTHON: The Appium Python type.
  ///
  /// *   APPIUM_NODE: The Appium Node.js type.
  ///
  /// *   APPIUM_RUBY: The Appium Ruby type.
  ///
  /// *   APPIUM\_WEB\_JAVA_JUNIT: The Appium Java JUnit type for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA_TESTNG: The Appium Java TestNG type for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON: The Appium Python type for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE: The Appium Node.js type for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY: The Appium Ruby type for web apps.
  ///
  /// *   CALABASH: The Calabash type.
  ///
  /// *   INSTRUMENTATION: The Instrumentation type.
  ///
  /// *   UIAUTOMATION: The uiautomation type.
  ///
  /// *   UIAUTOMATOR: The uiautomator type.
  ///
  /// *   XCTEST: The Xcode test type.
  ///
  /// *   XCTEST_UI: The Xcode UI test type.
  final String type;

  /// When the test was created.
  final DateTime created;

  /// The test's status.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending status.
  ///
  /// *   PENDING_CONCURRENCY: A pending concurrency status.
  ///
  /// *   PENDING_DEVICE: A pending device status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SCHEDULING: A scheduling status.
  ///
  /// *   PREPARING: A preparing status.
  ///
  /// *   RUNNING: A running status.
  ///
  /// *   COMPLETED: A completed status.
  ///
  /// *   STOPPING: A stopping status.
  final String status;

  /// The test's result.
  ///
  /// Allowed values include:
  ///
  /// *   PENDING: A pending condition.
  ///
  /// *   PASSED: A passing condition.
  ///
  /// *   WARNED: A warning condition.
  ///
  /// *   FAILED: A failed condition.
  ///
  /// *   SKIPPED: A skipped condition.
  ///
  /// *   ERRORED: An error condition.
  ///
  /// *   STOPPED: A stopped condition.
  final String result;

  /// The test's start time.
  final DateTime started;

  /// The test's stop time.
  final DateTime stopped;

  /// The test's result counters.
  final Counters counters;

  /// A message about the test's result.
  final String message;

  /// Represents the total (metered or unmetered) minutes used by the test.
  final DeviceMinutes deviceMinutes;

  Test({
    this.arn,
    this.name,
    this.type,
    this.created,
    this.status,
    this.result,
    this.started,
    this.stopped,
    this.counters,
    this.message,
    this.deviceMinutes,
  });
  static Test fromJson(Map<String, dynamic> json) => Test();
}

class TrialMinutes {
  /// The total number of free trial minutes that the account started with.
  final double total;

  /// The number of free trial minutes remaining in the account.
  final double remaining;

  TrialMinutes({
    this.total,
    this.remaining,
  });
  static TrialMinutes fromJson(Map<String, dynamic> json) => TrialMinutes();
}

class UniqueProblem {
  /// A message about the unique problems' result.
  final String message;

  /// Information about the problems.
  final List<Problem> problems;

  UniqueProblem({
    this.message,
    this.problems,
  });
  static UniqueProblem fromJson(Map<String, dynamic> json) => UniqueProblem();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateDeviceInstanceResult {
  /// An object containing information about your device instance.
  final DeviceInstance deviceInstance;

  UpdateDeviceInstanceResult({
    this.deviceInstance,
  });
  static UpdateDeviceInstanceResult fromJson(Map<String, dynamic> json) =>
      UpdateDeviceInstanceResult();
}

class UpdateDevicePoolResult {
  /// The device pool you just updated.
  final DevicePool devicePool;

  UpdateDevicePoolResult({
    this.devicePool,
  });
  static UpdateDevicePoolResult fromJson(Map<String, dynamic> json) =>
      UpdateDevicePoolResult();
}

class UpdateInstanceProfileResult {
  /// An object containing information about your instance profile.
  final InstanceProfile instanceProfile;

  UpdateInstanceProfileResult({
    this.instanceProfile,
  });
  static UpdateInstanceProfileResult fromJson(Map<String, dynamic> json) =>
      UpdateInstanceProfileResult();
}

class UpdateNetworkProfileResult {
  /// A list of the available network profiles.
  final NetworkProfile networkProfile;

  UpdateNetworkProfileResult({
    this.networkProfile,
  });
  static UpdateNetworkProfileResult fromJson(Map<String, dynamic> json) =>
      UpdateNetworkProfileResult();
}

class UpdateProjectResult {
  /// The project you wish to update.
  final Project project;

  UpdateProjectResult({
    this.project,
  });
  static UpdateProjectResult fromJson(Map<String, dynamic> json) =>
      UpdateProjectResult();
}

class UpdateUploadResult {
  /// A test spec uploaded to Device Farm.
  final Upload upload;

  UpdateUploadResult({
    this.upload,
  });
  static UpdateUploadResult fromJson(Map<String, dynamic> json) =>
      UpdateUploadResult();
}

class UpdateVpceConfigurationResult {
  /// An object containing information about your VPC endpoint configuration.
  final VpceConfiguration vpceConfiguration;

  UpdateVpceConfigurationResult({
    this.vpceConfiguration,
  });
  static UpdateVpceConfigurationResult fromJson(Map<String, dynamic> json) =>
      UpdateVpceConfigurationResult();
}

class Upload {
  /// The upload's ARN.
  final String arn;

  /// The upload's file name.
  final String name;

  /// When the upload was created.
  final DateTime created;

  /// The upload's type.
  ///
  /// Must be one of the following values:
  ///
  /// *   ANDROID_APP: An Android upload.
  ///
  /// *   IOS_APP: An iOS upload.
  ///
  /// *   WEB_APP: A web application upload.
  ///
  /// *   EXTERNAL_DATA: An external data upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_PACKAGE: An Appium Java JUnit test package
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_PACKAGE: An Appium Java TestNG test
  /// package upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_PACKAGE: An Appium Python test package upload.
  ///
  /// *   APPIUM\_NODE\_TEST_PACKAGE: An Appium Node.js test package upload.
  ///
  /// *   APPIUM\_RUBY\_TEST_PACKAGE: An Appium Ruby test package upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_PACKAGE: An Appium Java JUnit test
  /// package upload for web apps.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_PACKAGE: An Appium Java TestNG test
  /// package upload for web apps.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_PACKAGE: An Appium Python test package
  /// upload for web apps.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_PACKAGE: An Appium Node.js test package
  /// upload for web apps.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_PACKAGE: An Appium Ruby test package upload
  /// for web apps.
  ///
  /// *   CALABASH\_TEST\_PACKAGE: A Calabash test package upload.
  ///
  /// *   INSTRUMENTATION\_TEST\_PACKAGE: An instrumentation upload.
  ///
  /// *   UIAUTOMATION\_TEST\_PACKAGE: A uiautomation test package upload.
  ///
  /// *   UIAUTOMATOR\_TEST\_PACKAGE: A uiautomator test package upload.
  ///
  /// *   XCTEST\_TEST\_PACKAGE: An Xcode test package upload.
  ///
  /// *   XCTEST\_UI\_TEST_PACKAGE: An Xcode UI test package upload.
  ///
  /// *   APPIUM\_JAVA\_JUNIT\_TEST\_SPEC: An Appium Java JUnit test spec
  /// upload.
  ///
  /// *   APPIUM\_JAVA\_TESTNG\_TEST\_SPEC: An Appium Java TestNG test spec
  /// upload.
  ///
  /// *   APPIUM\_PYTHON\_TEST_SPEC: An Appium Python test spec upload.
  ///
  /// *   APPIUM\_NODE\_TEST_SPEC: An Appium Node.js test spec upload.
  ///
  /// *   APPIUM\_RUBY\_TEST_SPEC: An Appium Ruby test spec upload.
  ///
  /// *   APPIUM\_WEB\_JAVA\_JUNIT\_TEST_SPEC: An Appium Java JUnit test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_JAVA\_TESTNG\_TEST_SPEC: An Appium Java TestNG test spec
  /// upload for a web app.
  ///
  /// *   APPIUM\_WEB\_PYTHON\_TEST\_SPEC: An Appium Python test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_NODE\_TEST\_SPEC: An Appium Node.js test spec upload for
  /// a web app.
  ///
  /// *   APPIUM\_WEB\_RUBY\_TEST\_SPEC: An Appium Ruby test spec upload for a
  /// web app.
  ///
  /// *   INSTRUMENTATION\_TEST\_SPEC: An instrumentation test spec upload.
  ///
  /// *   XCTEST\_UI\_TEST_SPEC: An Xcode UI test spec upload.
  final String type;

  /// The upload's status.
  ///
  /// Must be one of the following values:
  ///
  /// *   FAILED: A failed status.
  ///
  /// *   INITIALIZED: An initialized status.
  ///
  /// *   PROCESSING: A processing status.
  ///
  /// *   SUCCEEDED: A succeeded status.
  final String status;

  /// The pre-signed Amazon S3 URL that was used to store a file through a
  /// corresponding PUT request.
  final String url;

  /// The upload's metadata. For example, for Android, this contains information
  /// that is parsed from the manifest and is displayed in the AWS Device Farm
  /// console after the associated app is uploaded.
  final String metadata;

  /// The upload's content type (for example, "application/octet-stream").
  final String contentType;

  /// A message about the upload's result.
  final String message;

  /// The upload's category. Allowed values include:
  ///
  /// *   CURATED: An upload managed by AWS Device Farm.
  ///
  /// *   PRIVATE: An upload managed by the AWS Device Farm customer.
  final String category;

  Upload({
    this.arn,
    this.name,
    this.created,
    this.type,
    this.status,
    this.url,
    this.metadata,
    this.contentType,
    this.message,
    this.category,
  });
  static Upload fromJson(Map<String, dynamic> json) => Upload();
}

class VpceConfiguration {
  /// The Amazon Resource Name (ARN) of the VPC endpoint configuration.
  final String arn;

  /// The friendly name you give to your VPC endpoint configuration, to manage
  /// your configurations more easily.
  final String vpceConfigurationName;

  /// The name of the VPC endpoint service running inside your AWS account that
  /// you want Device Farm to test.
  final String vpceServiceName;

  /// The DNS name that maps to the private IP address of the service you want
  /// to access.
  final String serviceDnsName;

  /// An optional description, providing more details about your VPC endpoint
  /// configuration.
  final String vpceConfigurationDescription;

  VpceConfiguration({
    this.arn,
    this.vpceConfigurationName,
    this.vpceServiceName,
    this.serviceDnsName,
    this.vpceConfigurationDescription,
  });
  static VpceConfiguration fromJson(Map<String, dynamic> json) =>
      VpceConfiguration();
}
