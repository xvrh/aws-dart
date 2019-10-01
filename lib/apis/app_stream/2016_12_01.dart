import 'package:meta/meta.dart';

/// Amazon AppStream 2.0
///
/// This is the _Amazon AppStream 2.0 API Reference_. This documentation
/// provides descriptions and syntax for each of the actions and data types in
/// AppStream 2.0. AppStream 2.0 is a fully managed, secure application
/// streaming service that lets you stream desktop applications to users without
/// rewriting applications. AppStream 2.0 manages the AWS resources that are
/// required to host and run your applications, scales automatically, and
/// provides access to your users on demand.
///
///  You can call the AppStream 2.0 API operations by using an interface VPC
/// endpoint (interface endpoint). For more information, see [Access AppStream
/// 2.0 API Operations and CLI Commands Through an Interface VPC
/// Endpoint](https://docs.aws.amazon.com/appstream2/latest/developerguide/access-api-cli-through-interface-vpc-endpoint.html)
/// in the _Amazon AppStream 2.0 Administration Guide_.
///
/// To learn more about AppStream 2.0, see the following resources:
///
/// *    [Amazon AppStream 2.0 product page](http://aws.amazon.com/appstream2)
///
/// *    [Amazon AppStream 2.0
/// documentation](http://aws.amazon.com/documentation/appstream2)
class AppStreamApi {
  /// Associates the specified fleet with the specified stack.
  ///
  /// [fleetName]: The name of the fleet.
  ///
  /// [stackName]: The name of the stack.
  Future<AssociateFleetResult> associateFleet(
      {@required String fleetName, @required String stackName}) async {
    return AssociateFleetResult.fromJson({});
  }

  /// Associates the specified users with the specified stacks. Users in a user
  /// pool cannot be assigned to stacks with fleets that are joined to an Active
  /// Directory domain.
  ///
  /// [userStackAssociations]: The list of UserStackAssociation objects.
  Future<BatchAssociateUserStackResult> batchAssociateUserStack(
      List<UserStackAssociation> userStackAssociations) async {
    return BatchAssociateUserStackResult.fromJson({});
  }

  /// Disassociates the specified users from the specified stacks.
  ///
  /// [userStackAssociations]: The list of UserStackAssociation objects.
  Future<BatchDisassociateUserStackResult> batchDisassociateUserStack(
      List<UserStackAssociation> userStackAssociations) async {
    return BatchDisassociateUserStackResult.fromJson({});
  }

  /// Copies the image within the same region or to a new region within the same
  /// AWS account. Note that any tags you added to the image will not be copied.
  ///
  /// [sourceImageName]: The name of the image to copy.
  ///
  /// [destinationImageName]: The name that the image will have when it is
  /// copied to the destination.
  ///
  /// [destinationRegion]: The destination region to which the image will be
  /// copied. This parameter is required, even if you are copying an image
  /// within the same region.
  ///
  /// [destinationImageDescription]: The description that the image will have
  /// when it is copied to the destination.
  Future<CopyImageResponse> copyImage(
      {@required String sourceImageName,
      @required String destinationImageName,
      @required String destinationRegion,
      String destinationImageDescription}) async {
    return CopyImageResponse.fromJson({});
  }

  /// Creates a Directory Config object in AppStream 2.0. This object includes
  /// the configuration information required to join fleets and image builders
  /// to Microsoft Active Directory domains.
  ///
  /// [directoryName]: The fully qualified name of the directory (for example,
  /// corp.example.com).
  ///
  /// [organizationalUnitDistinguishedNames]: The distinguished names of the
  /// organizational units for computer accounts.
  ///
  /// [serviceAccountCredentials]: The credentials for the service account used
  /// by the fleet or image builder to connect to the directory.
  Future<CreateDirectoryConfigResult> createDirectoryConfig(
      {@required String directoryName,
      @required List<String> organizationalUnitDistinguishedNames,
      @required ServiceAccountCredentials serviceAccountCredentials}) async {
    return CreateDirectoryConfigResult.fromJson({});
  }

  /// Creates a fleet. A fleet consists of streaming instances that run a
  /// specified image.
  ///
  /// [name]: A unique name for the fleet.
  ///
  /// [imageName]: The name of the image used to create the fleet.
  ///
  /// [imageArn]: The ARN of the public, private, or shared image to use.
  ///
  /// [instanceType]: The instance type to use when launching fleet instances.
  /// The following instance types are available:
  ///
  /// *   stream.standard.medium
  ///
  /// *   stream.standard.large
  ///
  /// *   stream.compute.large
  ///
  /// *   stream.compute.xlarge
  ///
  /// *   stream.compute.2xlarge
  ///
  /// *   stream.compute.4xlarge
  ///
  /// *   stream.compute.8xlarge
  ///
  /// *   stream.memory.large
  ///
  /// *   stream.memory.xlarge
  ///
  /// *   stream.memory.2xlarge
  ///
  /// *   stream.memory.4xlarge
  ///
  /// *   stream.memory.8xlarge
  ///
  /// *   stream.graphics-design.large
  ///
  /// *   stream.graphics-design.xlarge
  ///
  /// *   stream.graphics-design.2xlarge
  ///
  /// *   stream.graphics-design.4xlarge
  ///
  /// *   stream.graphics-desktop.2xlarge
  ///
  /// *   stream.graphics-pro.4xlarge
  ///
  /// *   stream.graphics-pro.8xlarge
  ///
  /// *   stream.graphics-pro.16xlarge
  ///
  /// [fleetType]: The fleet type.
  ///
  /// ALWAYS_ON
  ///
  /// Provides users with instant-on access to their apps. You are charged for
  /// all running instances in your fleet, even if no users are streaming apps.
  ///
  /// ON_DEMAND
  ///
  /// Provide users with access to applications after they connect, which takes
  /// one to two minutes. You are charged for instance streaming when users are
  /// connected and a small hourly fee for instances that are not streaming
  /// apps.
  ///
  /// [computeCapacity]: The desired capacity for the fleet.
  ///
  /// [vpcConfig]: The VPC configuration for the fleet.
  ///
  /// [maxUserDurationInSeconds]: The maximum amount of time that a streaming
  /// session can remain active, in seconds. If users are still connected to a
  /// streaming instance five minutes before this limit is reached, they are
  /// prompted to save any open documents before being disconnected. After this
  /// time elapses, the instance is terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  ///
  /// [disconnectTimeoutInSeconds]: The amount of time that a streaming session
  /// remains active after users disconnect. If users try to reconnect to the
  /// streaming session after a disconnection or network interruption within
  /// this time interval, they are connected to their previous session.
  /// Otherwise, they are connected to a new session with a new streaming
  /// instance.
  ///
  /// Specify a value between 60 and 360000.
  ///
  /// [description]: The description to display.
  ///
  /// [displayName]: The fleet name to display.
  ///
  /// [enableDefaultInternetAccess]: Enables or disables default internet access
  /// for the fleet.
  ///
  /// [domainJoinInfo]: The name of the directory and organizational unit (OU)
  /// to use to join the fleet to a Microsoft Active Directory domain.
  ///
  /// [tags]: The tags to associate with the fleet. A tag is a key-value pair,
  /// and the value is optional. For example, Environment=Test. If you do not
  /// specify a value, Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// For more information, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [idleDisconnectTimeoutInSeconds]: The amount of time that users can be
  /// idle (inactive) before they are disconnected from their streaming session
  /// and the `DisconnectTimeoutInSeconds` time interval begins. Users are
  /// notified before they are disconnected due to inactivity. If they try to
  /// reconnect to the streaming session before the time interval specified in
  /// `DisconnectTimeoutInSeconds` elapses, they are connected to their previous
  /// session. Users are considered idle when they stop providing keyboard or
  /// mouse input during their streaming session. File uploads and downloads,
  /// audio in, audio out, and pixels changing do not qualify as user activity.
  /// If users continue to be idle after the time interval in
  /// `IdleDisconnectTimeoutInSeconds` elapses, they are disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a
  /// value of 0. Otherwise, specify a value between 60 and 3600. The default
  /// value is 0.
  ///
  ///
  ///
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120,
  /// and 180). If you don't do this, the value is rounded to the nearest
  /// minute. For example, if you specify a value of 70, users are disconnected
  /// after 1 minute of inactivity. If you specify a value that is at the
  /// midpoint between two different minutes, the value is rounded up. For
  /// example, if you specify a value of 90, users are disconnected after 2
  /// minutes of inactivity.
  ///
  /// [iamRoleArn]: The Amazon Resource Name (ARN) of the IAM role to apply to
  /// the fleet. To assume a role, a fleet instance calls the AWS Security Token
  /// Service (STS) `AssumeRole` API operation and passes the ARN of the role to
  /// use. The operation creates a new session with temporary credentials.
  Future<CreateFleetResult> createFleet(
      {@required String name,
      String imageName,
      String imageArn,
      @required String instanceType,
      String fleetType,
      @required ComputeCapacity computeCapacity,
      VpcConfig vpcConfig,
      int maxUserDurationInSeconds,
      int disconnectTimeoutInSeconds,
      String description,
      String displayName,
      bool enableDefaultInternetAccess,
      DomainJoinInfo domainJoinInfo,
      Map<String, String> tags,
      int idleDisconnectTimeoutInSeconds,
      String iamRoleArn}) async {
    return CreateFleetResult.fromJson({});
  }

  /// Creates an image builder. An image builder is a virtual machine that is
  /// used to create an image.
  ///
  /// The initial state of the builder is `PENDING`. When it is ready, the state
  /// is `RUNNING`.
  ///
  /// [name]: A unique name for the image builder.
  ///
  /// [imageName]: The name of the image used to create the image builder.
  ///
  /// [imageArn]: The ARN of the public, private, or shared image to use.
  ///
  /// [instanceType]: The instance type to use when launching the image builder.
  ///
  /// [description]: The description to display.
  ///
  /// [displayName]: The image builder name to display.
  ///
  /// [vpcConfig]: The VPC configuration for the image builder. You can specify
  /// only one subnet.
  ///
  /// [iamRoleArn]: The Amazon Resource Name (ARN) of the IAM role to apply to
  /// the image builder. To assume a role, the image builder calls the AWS
  /// Security Token Service (STS) `AssumeRole` API operation and passes the ARN
  /// of the role to use. The operation creates a new session with temporary
  /// credentials.
  ///
  /// [enableDefaultInternetAccess]: Enables or disables default internet access
  /// for the image builder.
  ///
  /// [domainJoinInfo]: The name of the directory and organizational unit (OU)
  /// to use to join the image builder to a Microsoft Active Directory domain.
  ///
  /// [appstreamAgentVersion]: The version of the AppStream 2.0 agent to use for
  /// this image builder. To use the latest version of the AppStream 2.0 agent,
  /// specify \[LATEST\].
  ///
  /// [tags]: The tags to associate with the image builder. A tag is a key-value
  /// pair, and the value is optional. For example, Environment=Test. If you do
  /// not specify a value, Environment=.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [accessEndpoints]: The list of interface VPC endpoint (interface endpoint)
  /// objects. Administrators can connect to the image builder only through the
  /// specified endpoints.
  Future<CreateImageBuilderResult> createImageBuilder(
      {@required String name,
      String imageName,
      String imageArn,
      @required String instanceType,
      String description,
      String displayName,
      VpcConfig vpcConfig,
      String iamRoleArn,
      bool enableDefaultInternetAccess,
      DomainJoinInfo domainJoinInfo,
      String appstreamAgentVersion,
      Map<String, String> tags,
      List<AccessEndpoint> accessEndpoints}) async {
    return CreateImageBuilderResult.fromJson({});
  }

  /// Creates a URL to start an image builder streaming session.
  ///
  /// [name]: The name of the image builder.
  ///
  /// [validity]: The time that the streaming URL will be valid, in seconds.
  /// Specify a value between 1 and 604800 seconds. The default is 3600 seconds.
  Future<CreateImageBuilderStreamingUrlResult> createImageBuilderStreamingUrl(
      String name,
      {BigInt validity}) async {
    return CreateImageBuilderStreamingUrlResult.fromJson({});
  }

  /// Creates a stack to start streaming applications to users. A stack consists
  /// of an associated fleet, user access policies, and storage configurations.
  ///
  /// [name]: The name of the stack.
  ///
  /// [description]: The description to display.
  ///
  /// [displayName]: The stack name to display.
  ///
  /// [storageConnectors]: The storage connectors to enable.
  ///
  /// [redirectUrl]: The URL that users are redirected to after their streaming
  /// session ends.
  ///
  /// [feedbackUrl]: The URL that users are redirected to after they click the
  /// Send Feedback link. If no URL is specified, no Send Feedback link is
  /// displayed.
  ///
  /// [userSettings]: The actions that are enabled or disabled for users during
  /// their streaming sessions. By default, these actions are enabled.
  ///
  /// [applicationSettings]: The persistent application settings for users of a
  /// stack. When these settings are enabled, changes that users make to
  /// applications and Windows settings are automatically saved after each
  /// session and applied to the next session.
  ///
  /// [tags]: The tags to associate with the stack. A tag is a key-value pair,
  /// and the value is optional. For example, Environment=Test. If you do not
  /// specify a value, Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [accessEndpoints]: The list of interface VPC endpoint (interface endpoint)
  /// objects. Users of the stack can connect to AppStream 2.0 only through the
  /// specified endpoints.
  Future<CreateStackResult> createStack(String name,
      {String description,
      String displayName,
      List<StorageConnector> storageConnectors,
      String redirectUrl,
      String feedbackUrl,
      List<UserSetting> userSettings,
      ApplicationSettings applicationSettings,
      Map<String, String> tags,
      List<AccessEndpoint> accessEndpoints}) async {
    return CreateStackResult.fromJson({});
  }

  /// Creates a temporary URL to start an AppStream 2.0 streaming session for
  /// the specified user. A streaming URL enables application streaming to be
  /// tested without user setup.
  ///
  /// [stackName]: The name of the stack.
  ///
  /// [fleetName]: The name of the fleet.
  ///
  /// [userId]: The identifier of the user.
  ///
  /// [applicationId]: The name of the application to launch after the session
  /// starts. This is the name that you specified as **Name** in the Image
  /// Assistant.
  ///
  /// [validity]: The time that the streaming URL will be valid, in seconds.
  /// Specify a value between 1 and 604800 seconds. The default is 60 seconds.
  ///
  /// [sessionContext]: The session context. For more information, see [Session
  /// Context](https://docs.aws.amazon.com/appstream2/latest/developerguide/managing-stacks-fleets.html#managing-stacks-fleets-parameters)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  Future<CreateStreamingUrlResult> createStreamingUrl(
      {@required String stackName,
      @required String fleetName,
      @required String userId,
      String applicationId,
      BigInt validity,
      String sessionContext}) async {
    return CreateStreamingUrlResult.fromJson({});
  }

  /// Creates a usage report subscription. Usage reports are generated daily.
  Future<CreateUsageReportSubscriptionResult>
      createUsageReportSubscription() async {
    return CreateUsageReportSubscriptionResult.fromJson({});
  }

  /// Creates a new user in the user pool.
  ///
  /// [userName]: The email address of the user.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive. During login, if they specify
  /// an email address that doesn't use the same capitalization as the email
  /// address specified when their user pool account was created, a "user does
  /// not exist" error message displays.
  ///
  /// [messageAction]: The action to take for the welcome email that is sent to
  /// a user after the user is created in the user pool. If you specify
  /// SUPPRESS, no email is sent. If you specify RESEND, do not specify the
  /// first name or last name of the user. If the value is null, the email is
  /// sent.
  ///
  ///
  ///
  /// The temporary password in the welcome email is valid for only 7 days. If
  /// users don’t set their passwords within 7 days, you must send them a new
  /// welcome email.
  ///
  /// [firstName]: The first name, or given name, of the user.
  ///
  /// [lastName]: The last name, or surname, of the user.
  ///
  /// [authenticationType]: The authentication type for the user. You must
  /// specify USERPOOL.
  Future<CreateUserResult> createUser(
      {@required String userName,
      String messageAction,
      String firstName,
      String lastName,
      @required String authenticationType}) async {
    return CreateUserResult.fromJson({});
  }

  /// Deletes the specified Directory Config object from AppStream 2.0. This
  /// object includes the information required to join streaming instances to an
  /// Active Directory domain.
  ///
  /// [directoryName]: The name of the directory configuration.
  Future<DeleteDirectoryConfigResult> deleteDirectoryConfig(
      String directoryName) async {
    return DeleteDirectoryConfigResult.fromJson({});
  }

  /// Deletes the specified fleet.
  ///
  /// [name]: The name of the fleet.
  Future<DeleteFleetResult> deleteFleet(String name) async {
    return DeleteFleetResult.fromJson({});
  }

  /// Deletes the specified image. You cannot delete an image when it is in use.
  /// After you delete an image, you cannot provision new capacity using the
  /// image.
  ///
  /// [name]: The name of the image.
  Future<DeleteImageResult> deleteImage(String name) async {
    return DeleteImageResult.fromJson({});
  }

  /// Deletes the specified image builder and releases the capacity.
  ///
  /// [name]: The name of the image builder.
  Future<DeleteImageBuilderResult> deleteImageBuilder(String name) async {
    return DeleteImageBuilderResult.fromJson({});
  }

  /// Deletes permissions for the specified private image. After you delete
  /// permissions for an image, AWS accounts to which you previously granted
  /// these permissions can no longer use the image.
  ///
  /// [name]: The name of the private image.
  ///
  /// [sharedAccountId]: The 12-digit identifier of the AWS account for which to
  /// delete image permissions.
  Future<DeleteImagePermissionsResult> deleteImagePermissions(
      {@required String name, @required String sharedAccountId}) async {
    return DeleteImagePermissionsResult.fromJson({});
  }

  /// Deletes the specified stack. After the stack is deleted, the application
  /// streaming environment provided by the stack is no longer available to
  /// users. Also, any reservations made for application streaming sessions for
  /// the stack are released.
  ///
  /// [name]: The name of the stack.
  Future<DeleteStackResult> deleteStack(String name) async {
    return DeleteStackResult.fromJson({});
  }

  /// Disables usage report generation.
  Future<DeleteUsageReportSubscriptionResult>
      deleteUsageReportSubscription() async {
    return DeleteUsageReportSubscriptionResult.fromJson({});
  }

  /// Deletes a user from the user pool.
  ///
  /// [userName]: The email address of the user.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive.
  ///
  /// [authenticationType]: The authentication type for the user. You must
  /// specify USERPOOL.
  Future<DeleteUserResult> deleteUser(
      {@required String userName, @required String authenticationType}) async {
    return DeleteUserResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified Directory Config
  /// objects for AppStream 2.0, if the names for these objects are provided.
  /// Otherwise, all Directory Config objects in the account are described.
  /// These objects include the configuration information required to join
  /// fleets and image builders to Microsoft Active Directory domains.
  ///
  /// Although the response syntax in this topic includes the account password,
  /// this password is not returned in the actual response.
  ///
  /// [directoryNames]: The directory names.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeDirectoryConfigsResult> describeDirectoryConfigs(
      {List<String> directoryNames, int maxResults, String nextToken}) async {
    return DescribeDirectoryConfigsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified fleets, if the fleet
  /// names are provided. Otherwise, all fleets in the account are described.
  ///
  /// [names]: The names of the fleets to describe.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeFleetsResult> describeFleets(
      {List<String> names, String nextToken}) async {
    return DescribeFleetsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified image builders, if
  /// the image builder names are provided. Otherwise, all image builders in the
  /// account are described.
  ///
  /// [names]: The names of the image builders to describe.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeImageBuildersResult> describeImageBuilders(
      {List<String> names, int maxResults, String nextToken}) async {
    return DescribeImageBuildersResult.fromJson({});
  }

  /// Retrieves a list that describes the permissions for shared AWS account IDs
  /// on a private image that you own.
  ///
  /// [name]: The name of the private image for which to describe permissions.
  /// The image must be one that you own.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [sharedAwsAccountIds]: The 12-digit identifier of one or more AWS accounts
  /// with which the image is shared.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeImagePermissionsResult> describeImagePermissions(String name,
      {int maxResults,
      List<String> sharedAwsAccountIds,
      String nextToken}) async {
    return DescribeImagePermissionsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified images, if the image
  /// names or image ARNs are provided. Otherwise, all images in the account are
  /// described.
  ///
  /// [names]: The names of the public or private images to describe.
  ///
  /// [arns]: The ARNs of the public, private, and shared images to describe.
  ///
  /// [type]: The type of image (public, private, or shared) to describe.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [maxResults]: The maximum size of each page of results.
  Future<DescribeImagesResult> describeImages(
      {List<String> names,
      List<String> arns,
      String type,
      String nextToken,
      int maxResults}) async {
    return DescribeImagesResult.fromJson({});
  }

  /// Retrieves a list that describes the streaming sessions for a specified
  /// stack and fleet. If a UserId is provided for the stack and fleet, only
  /// streaming sessions for that user are described. If an authentication type
  /// is not provided, the default is to authenticate users using a streaming
  /// URL.
  ///
  /// [stackName]: The name of the stack. This value is case-sensitive.
  ///
  /// [fleetName]: The name of the fleet. This value is case-sensitive.
  ///
  /// [userId]: The user identifier.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  ///
  /// [limit]: The size of each page of results. The default value is 20 and the
  /// maximum value is 50.
  ///
  /// [authenticationType]: The authentication method. Specify `API` for a user
  /// authenticated using a streaming URL or `SAML` for a SAML federated user.
  /// The default is to authenticate users using a streaming URL.
  Future<DescribeSessionsResult> describeSessions(
      {@required String stackName,
      @required String fleetName,
      String userId,
      String nextToken,
      int limit,
      String authenticationType}) async {
    return DescribeSessionsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified stacks, if the stack
  /// names are provided. Otherwise, all stacks in the account are described.
  ///
  /// [names]: The names of the stacks to describe.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeStacksResult> describeStacks(
      {List<String> names, String nextToken}) async {
    return DescribeStacksResult.fromJson({});
  }

  /// Retrieves a list that describes one or more usage report subscriptions.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeUsageReportSubscriptionsResult>
      describeUsageReportSubscriptions(
          {int maxResults, String nextToken}) async {
    return DescribeUsageReportSubscriptionsResult.fromJson({});
  }

  /// Retrieves a list that describes the UserStackAssociation objects. You must
  /// specify either or both of the following:
  ///
  /// *   The stack name
  ///
  /// *   The user name (email address of the user associated with the stack)
  /// and the authentication type for the user
  ///
  /// [stackName]: The name of the stack that is associated with the user.
  ///
  /// [userName]: The email address of the user who is associated with the
  /// stack.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive.
  ///
  /// [authenticationType]: The authentication type for the user who is
  /// associated with the stack. You must specify USERPOOL.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeUserStackAssociationsResult> describeUserStackAssociations(
      {String stackName,
      String userName,
      String authenticationType,
      int maxResults,
      String nextToken}) async {
    return DescribeUserStackAssociationsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified users in the user
  /// pool.
  ///
  /// [authenticationType]: The authentication type for the users in the user
  /// pool to describe. You must specify USERPOOL.
  ///
  /// [maxResults]: The maximum size of each page of results.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<DescribeUsersResult> describeUsers(String authenticationType,
      {int maxResults, String nextToken}) async {
    return DescribeUsersResult.fromJson({});
  }

  /// Disables the specified user in the user pool. Users can't sign in to
  /// AppStream 2.0 until they are re-enabled. This action does not delete the
  /// user.
  ///
  /// [userName]: The email address of the user.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive.
  ///
  /// [authenticationType]: The authentication type for the user. You must
  /// specify USERPOOL.
  Future<DisableUserResult> disableUser(
      {@required String userName, @required String authenticationType}) async {
    return DisableUserResult.fromJson({});
  }

  /// Disassociates the specified fleet from the specified stack.
  ///
  /// [fleetName]: The name of the fleet.
  ///
  /// [stackName]: The name of the stack.
  Future<DisassociateFleetResult> disassociateFleet(
      {@required String fleetName, @required String stackName}) async {
    return DisassociateFleetResult.fromJson({});
  }

  /// Enables a user in the user pool. After being enabled, users can sign in to
  /// AppStream 2.0 and open applications from the stacks to which they are
  /// assigned.
  ///
  /// [userName]: The email address of the user.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive. During login, if they specify
  /// an email address that doesn't use the same capitalization as the email
  /// address specified when their user pool account was created, a "user does
  /// not exist" error message displays.
  ///
  /// [authenticationType]: The authentication type for the user. You must
  /// specify USERPOOL.
  Future<EnableUserResult> enableUser(
      {@required String userName, @required String authenticationType}) async {
    return EnableUserResult.fromJson({});
  }

  /// Immediately stops the specified streaming session.
  ///
  /// [sessionId]: The identifier of the streaming session.
  Future<ExpireSessionResult> expireSession(String sessionId) async {
    return ExpireSessionResult.fromJson({});
  }

  /// Retrieves the name of the fleet that is associated with the specified
  /// stack.
  ///
  /// [stackName]: The name of the stack.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<ListAssociatedFleetsResult> listAssociatedFleets(String stackName,
      {String nextToken}) async {
    return ListAssociatedFleetsResult.fromJson({});
  }

  /// Retrieves the name of the stack with which the specified fleet is
  /// associated.
  ///
  /// [fleetName]: The name of the fleet.
  ///
  /// [nextToken]: The pagination token to use to retrieve the next page of
  /// results for this operation. If this value is null, it retrieves the first
  /// page.
  Future<ListAssociatedStacksResult> listAssociatedStacks(String fleetName,
      {String nextToken}) async {
    return ListAssociatedStacksResult.fromJson({});
  }

  /// Retrieves a list of all tags for the specified AppStream 2.0 resource. You
  /// can tag AppStream 2.0 image builders, images, fleets, and stacks.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Starts the specified fleet.
  ///
  /// [name]: The name of the fleet.
  Future<StartFleetResult> startFleet(String name) async {
    return StartFleetResult.fromJson({});
  }

  /// Starts the specified image builder.
  ///
  /// [name]: The name of the image builder.
  ///
  /// [appstreamAgentVersion]: The version of the AppStream 2.0 agent to use for
  /// this image builder. To use the latest version of the AppStream 2.0 agent,
  /// specify \[LATEST\].
  Future<StartImageBuilderResult> startImageBuilder(String name,
      {String appstreamAgentVersion}) async {
    return StartImageBuilderResult.fromJson({});
  }

  /// Stops the specified fleet.
  ///
  /// [name]: The name of the fleet.
  Future<StopFleetResult> stopFleet(String name) async {
    return StopFleetResult.fromJson({});
  }

  /// Stops the specified image builder.
  ///
  /// [name]: The name of the image builder.
  Future<StopImageBuilderResult> stopImageBuilder(String name) async {
    return StopImageBuilderResult.fromJson({});
  }

  /// Adds or overwrites one or more tags for the specified AppStream 2.0
  /// resource. You can tag AppStream 2.0 image builders, images, fleets, and
  /// stacks.
  ///
  /// Each tag consists of a key and an optional value. If a resource already
  /// has a tag with the same key, this operation updates its value.
  ///
  /// To list the current tags for your resources, use ListTagsForResource. To
  /// disassociate tags from your resources, use UntagResource.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tags]: The tags to associate. A tag is a key-value pair, and the value is
  /// optional. For example, Environment=Test. If you do not specify a value,
  /// Environment=.
  ///
  /// If you do not specify a value, the value is set to an empty string.
  ///
  /// Generally allowed characters are: letters, numbers, and spaces
  /// representable in UTF-8, and the following special characters:
  ///
  /// _ . : / = + \ - @
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Disassociates one or more specified tags from the specified AppStream 2.0
  /// resource.
  ///
  /// To list the current tags for your resources, use ListTagsForResource.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tagKeys]: The tag keys for the tags to disassociate.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates the specified Directory Config object in AppStream 2.0. This
  /// object includes the configuration information required to join fleets and
  /// image builders to Microsoft Active Directory domains.
  ///
  /// [directoryName]: The name of the Directory Config object.
  ///
  /// [organizationalUnitDistinguishedNames]: The distinguished names of the
  /// organizational units for computer accounts.
  ///
  /// [serviceAccountCredentials]: The credentials for the service account used
  /// by the fleet or image builder to connect to the directory.
  Future<UpdateDirectoryConfigResult> updateDirectoryConfig(
      String directoryName,
      {List<String> organizationalUnitDistinguishedNames,
      ServiceAccountCredentials serviceAccountCredentials}) async {
    return UpdateDirectoryConfigResult.fromJson({});
  }

  /// Updates the specified fleet.
  ///
  /// If the fleet is in the `STOPPED` state, you can update any attribute
  /// except the fleet name. If the fleet is in the `RUNNING` state, you can
  /// update the `DisplayName`, `ComputeCapacity`, `ImageARN`, `ImageName`,
  /// `IdleDisconnectTimeoutInSeconds`, and `DisconnectTimeoutInSeconds`
  /// attributes. If the fleet is in the `STARTING` or `STOPPING` state, you
  /// can't update it.
  ///
  /// [imageName]: The name of the image used to create the fleet.
  ///
  /// [imageArn]: The ARN of the public, private, or shared image to use.
  ///
  /// [name]: A unique name for the fleet.
  ///
  /// [instanceType]: The instance type to use when launching fleet instances.
  /// The following instance types are available:
  ///
  /// *   stream.standard.medium
  ///
  /// *   stream.standard.large
  ///
  /// *   stream.compute.large
  ///
  /// *   stream.compute.xlarge
  ///
  /// *   stream.compute.2xlarge
  ///
  /// *   stream.compute.4xlarge
  ///
  /// *   stream.compute.8xlarge
  ///
  /// *   stream.memory.large
  ///
  /// *   stream.memory.xlarge
  ///
  /// *   stream.memory.2xlarge
  ///
  /// *   stream.memory.4xlarge
  ///
  /// *   stream.memory.8xlarge
  ///
  /// *   stream.graphics-design.large
  ///
  /// *   stream.graphics-design.xlarge
  ///
  /// *   stream.graphics-design.2xlarge
  ///
  /// *   stream.graphics-design.4xlarge
  ///
  /// *   stream.graphics-desktop.2xlarge
  ///
  /// *   stream.graphics-pro.4xlarge
  ///
  /// *   stream.graphics-pro.8xlarge
  ///
  /// *   stream.graphics-pro.16xlarge
  ///
  /// [computeCapacity]: The desired capacity for the fleet.
  ///
  /// [vpcConfig]: The VPC configuration for the fleet.
  ///
  /// [maxUserDurationInSeconds]: The maximum amount of time that a streaming
  /// session can remain active, in seconds. If users are still connected to a
  /// streaming instance five minutes before this limit is reached, they are
  /// prompted to save any open documents before being disconnected. After this
  /// time elapses, the instance is terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  ///
  /// [disconnectTimeoutInSeconds]: The amount of time that a streaming session
  /// remains active after users disconnect. If users try to reconnect to the
  /// streaming session after a disconnection or network interruption within
  /// this time interval, they are connected to their previous session.
  /// Otherwise, they are connected to a new session with a new streaming
  /// instance.
  ///
  /// Specify a value between 60 and 360000.
  ///
  /// [deleteVpcConfig]: Deletes the VPC association for the specified fleet.
  ///
  /// [description]: The description to display.
  ///
  /// [displayName]: The fleet name to display.
  ///
  /// [enableDefaultInternetAccess]: Enables or disables default internet access
  /// for the fleet.
  ///
  /// [domainJoinInfo]: The name of the directory and organizational unit (OU)
  /// to use to join the fleet to a Microsoft Active Directory domain.
  ///
  /// [idleDisconnectTimeoutInSeconds]: The amount of time that users can be
  /// idle (inactive) before they are disconnected from their streaming session
  /// and the `DisconnectTimeoutInSeconds` time interval begins. Users are
  /// notified before they are disconnected due to inactivity. If users try to
  /// reconnect to the streaming session before the time interval specified in
  /// `DisconnectTimeoutInSeconds` elapses, they are connected to their previous
  /// session. Users are considered idle when they stop providing keyboard or
  /// mouse input during their streaming session. File uploads and downloads,
  /// audio in, audio out, and pixels changing do not qualify as user activity.
  /// If users continue to be idle after the time interval in
  /// `IdleDisconnectTimeoutInSeconds` elapses, they are disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a
  /// value of 0. Otherwise, specify a value between 60 and 3600. The default
  /// value is 0.
  ///
  ///
  ///
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120,
  /// and 180). If you don't do this, the value is rounded to the nearest
  /// minute. For example, if you specify a value of 70, users are disconnected
  /// after 1 minute of inactivity. If you specify a value that is at the
  /// midpoint between two different minutes, the value is rounded up. For
  /// example, if you specify a value of 90, users are disconnected after 2
  /// minutes of inactivity.
  ///
  /// [attributesToDelete]: The fleet attributes to delete.
  ///
  /// [iamRoleArn]: The Amazon Resource Name (ARN) of the IAM role to apply to
  /// the fleet. To assume a role, a fleet instance calls the AWS Security Token
  /// Service (STS) `AssumeRole` API operation and passes the ARN of the role to
  /// use. The operation creates a new session with temporary credentials.
  Future<UpdateFleetResult> updateFleet(
      {String imageName,
      String imageArn,
      String name,
      String instanceType,
      ComputeCapacity computeCapacity,
      VpcConfig vpcConfig,
      int maxUserDurationInSeconds,
      int disconnectTimeoutInSeconds,
      bool deleteVpcConfig,
      String description,
      String displayName,
      bool enableDefaultInternetAccess,
      DomainJoinInfo domainJoinInfo,
      int idleDisconnectTimeoutInSeconds,
      List<String> attributesToDelete,
      String iamRoleArn}) async {
    return UpdateFleetResult.fromJson({});
  }

  /// Adds or updates permissions for the specified private image.
  ///
  /// [name]: The name of the private image.
  ///
  /// [sharedAccountId]: The 12-digit identifier of the AWS account for which
  /// you want add or update image permissions.
  ///
  /// [imagePermissions]: The permissions for the image.
  Future<UpdateImagePermissionsResult> updateImagePermissions(
      {@required String name,
      @required String sharedAccountId,
      @required ImagePermissions imagePermissions}) async {
    return UpdateImagePermissionsResult.fromJson({});
  }

  /// Updates the specified fields for the specified stack.
  ///
  /// [displayName]: The stack name to display.
  ///
  /// [description]: The description to display.
  ///
  /// [name]: The name of the stack.
  ///
  /// [storageConnectors]: The storage connectors to enable.
  ///
  /// [deleteStorageConnectors]: Deletes the storage connectors currently
  /// enabled for the stack.
  ///
  /// [redirectUrl]: The URL that users are redirected to after their streaming
  /// session ends.
  ///
  /// [feedbackUrl]: The URL that users are redirected to after they choose the
  /// Send Feedback link. If no URL is specified, no Send Feedback link is
  /// displayed.
  ///
  /// [attributesToDelete]: The stack attributes to delete.
  ///
  /// [userSettings]: The actions that are enabled or disabled for users during
  /// their streaming sessions. By default, these actions are enabled.
  ///
  /// [applicationSettings]: The persistent application settings for users of a
  /// stack. When these settings are enabled, changes that users make to
  /// applications and Windows settings are automatically saved after each
  /// session and applied to the next session.
  ///
  /// [accessEndpoints]: The list of interface VPC endpoint (interface endpoint)
  /// objects. Users of the stack can connect to AppStream 2.0 only through the
  /// specified endpoints.
  Future<UpdateStackResult> updateStack(String name,
      {String displayName,
      String description,
      List<StorageConnector> storageConnectors,
      bool deleteStorageConnectors,
      String redirectUrl,
      String feedbackUrl,
      List<String> attributesToDelete,
      List<UserSetting> userSettings,
      ApplicationSettings applicationSettings,
      List<AccessEndpoint> accessEndpoints}) async {
    return UpdateStackResult.fromJson({});
  }
}

class AccessEndpoint {
  /// The type of interface endpoint.
  final String endpointType;

  /// The identifier (ID) of the VPC in which the interface endpoint is used.
  final String vpceId;

  AccessEndpoint({
    @required this.endpointType,
    this.vpceId,
  });
  static AccessEndpoint fromJson(Map<String, dynamic> json) => AccessEndpoint();
}

class Application {
  /// The name of the application.
  final String name;

  /// The application name to display.
  final String displayName;

  /// The URL for the application icon. This URL might be time-limited.
  final String iconUrl;

  /// The path to the application executable in the instance.
  final String launchPath;

  /// The arguments that are passed to the application at launch.
  final String launchParameters;

  /// If there is a problem, the application can be disabled after image
  /// creation.
  final bool enabled;

  /// Additional attributes that describe the application.
  final Map<String, String> metadata;

  Application({
    this.name,
    this.displayName,
    this.iconUrl,
    this.launchPath,
    this.launchParameters,
    this.enabled,
    this.metadata,
  });
  static Application fromJson(Map<String, dynamic> json) => Application();
}

class ApplicationSettings {
  /// Enables or disables persistent application settings for users during their
  /// streaming sessions.
  final bool enabled;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored. You can allow the same persistent application
  /// settings to be used across multiple stacks by specifying the same settings
  /// group for each stack.
  final String settingsGroup;

  ApplicationSettings({
    @required this.enabled,
    this.settingsGroup,
  });
}

class ApplicationSettingsResponse {
  /// Specifies whether persistent application settings are enabled for users
  /// during their streaming sessions.
  final bool enabled;

  /// The path prefix for the S3 bucket where users’ persistent application
  /// settings are stored.
  final String settingsGroup;

  /// The S3 bucket where users’ persistent application settings are stored.
  /// When persistent application settings are enabled for the first time for an
  /// account in an AWS Region, an S3 bucket is created. The bucket is unique to
  /// the AWS account and the Region.
  final String s3BucketName;

  ApplicationSettingsResponse({
    this.enabled,
    this.settingsGroup,
    this.s3BucketName,
  });
  static ApplicationSettingsResponse fromJson(Map<String, dynamic> json) =>
      ApplicationSettingsResponse();
}

class AssociateFleetResult {
  AssociateFleetResult();
  static AssociateFleetResult fromJson(Map<String, dynamic> json) =>
      AssociateFleetResult();
}

class BatchAssociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  final List<UserStackAssociationError> errors;

  BatchAssociateUserStackResult({
    this.errors,
  });
  static BatchAssociateUserStackResult fromJson(Map<String, dynamic> json) =>
      BatchAssociateUserStackResult();
}

class BatchDisassociateUserStackResult {
  /// The list of UserStackAssociationError objects.
  final List<UserStackAssociationError> errors;

  BatchDisassociateUserStackResult({
    this.errors,
  });
  static BatchDisassociateUserStackResult fromJson(Map<String, dynamic> json) =>
      BatchDisassociateUserStackResult();
}

class ComputeCapacity {
  /// The desired number of streaming instances.
  final int desiredInstances;

  ComputeCapacity({
    @required this.desiredInstances,
  });
}

class ComputeCapacityStatus {
  /// The desired number of streaming instances.
  final int desired;

  /// The total number of simultaneous streaming instances that are running.
  final int running;

  /// The number of instances in use for streaming.
  final int inUse;

  /// The number of currently available instances that can be used to stream
  /// sessions.
  final int available;

  ComputeCapacityStatus({
    @required this.desired,
    this.running,
    this.inUse,
    this.available,
  });
  static ComputeCapacityStatus fromJson(Map<String, dynamic> json) =>
      ComputeCapacityStatus();
}

class CopyImageResponse {
  /// The name of the destination image.
  final String destinationImageName;

  CopyImageResponse({
    this.destinationImageName,
  });
  static CopyImageResponse fromJson(Map<String, dynamic> json) =>
      CopyImageResponse();
}

class CreateDirectoryConfigResult {
  /// Information about the directory configuration.
  final DirectoryConfig directoryConfig;

  CreateDirectoryConfigResult({
    this.directoryConfig,
  });
  static CreateDirectoryConfigResult fromJson(Map<String, dynamic> json) =>
      CreateDirectoryConfigResult();
}

class CreateFleetResult {
  /// Information about the fleet.
  final Fleet fleet;

  CreateFleetResult({
    this.fleet,
  });
  static CreateFleetResult fromJson(Map<String, dynamic> json) =>
      CreateFleetResult();
}

class CreateImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder imageBuilder;

  CreateImageBuilderResult({
    this.imageBuilder,
  });
  static CreateImageBuilderResult fromJson(Map<String, dynamic> json) =>
      CreateImageBuilderResult();
}

class CreateImageBuilderStreamingUrlResult {
  /// The URL to start the AppStream 2.0 streaming session.
  final String streamingUrl;

  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  final DateTime expires;

  CreateImageBuilderStreamingUrlResult({
    this.streamingUrl,
    this.expires,
  });
  static CreateImageBuilderStreamingUrlResult fromJson(
          Map<String, dynamic> json) =>
      CreateImageBuilderStreamingUrlResult();
}

class CreateStackResult {
  /// Information about the stack.
  final Stack stack;

  CreateStackResult({
    this.stack,
  });
  static CreateStackResult fromJson(Map<String, dynamic> json) =>
      CreateStackResult();
}

class CreateStreamingUrlResult {
  /// The URL to start the AppStream 2.0 streaming session.
  final String streamingUrl;

  /// The elapsed time, in seconds after the Unix epoch, when this URL expires.
  final DateTime expires;

  CreateStreamingUrlResult({
    this.streamingUrl,
    this.expires,
  });
  static CreateStreamingUrlResult fromJson(Map<String, dynamic> json) =>
      CreateStreamingUrlResult();
}

class CreateUsageReportSubscriptionResult {
  /// The Amazon S3 bucket where generated reports are stored.
  ///
  /// If you enabled on-instance session scripts and Amazon S3 logging for your
  /// session script configuration, AppStream 2.0 created an S3 bucket to store
  /// the script output. The bucket is unique to your account and Region. When
  /// you enable usage reporting in this case, AppStream 2.0 uses the same
  /// bucket to store your usage reports. If you haven't already enabled
  /// on-instance session scripts, when you enable usage reports, AppStream 2.0
  /// creates a new S3 bucket.
  final String s3BucketName;

  /// The schedule for generating usage reports.
  final String schedule;

  CreateUsageReportSubscriptionResult({
    this.s3BucketName,
    this.schedule,
  });
  static CreateUsageReportSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      CreateUsageReportSubscriptionResult();
}

class CreateUserResult {
  CreateUserResult();
  static CreateUserResult fromJson(Map<String, dynamic> json) =>
      CreateUserResult();
}

class DeleteDirectoryConfigResult {
  DeleteDirectoryConfigResult();
  static DeleteDirectoryConfigResult fromJson(Map<String, dynamic> json) =>
      DeleteDirectoryConfigResult();
}

class DeleteFleetResult {
  DeleteFleetResult();
  static DeleteFleetResult fromJson(Map<String, dynamic> json) =>
      DeleteFleetResult();
}

class DeleteImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder imageBuilder;

  DeleteImageBuilderResult({
    this.imageBuilder,
  });
  static DeleteImageBuilderResult fromJson(Map<String, dynamic> json) =>
      DeleteImageBuilderResult();
}

class DeleteImagePermissionsResult {
  DeleteImagePermissionsResult();
  static DeleteImagePermissionsResult fromJson(Map<String, dynamic> json) =>
      DeleteImagePermissionsResult();
}

class DeleteImageResult {
  /// Information about the image.
  final Image image;

  DeleteImageResult({
    this.image,
  });
  static DeleteImageResult fromJson(Map<String, dynamic> json) =>
      DeleteImageResult();
}

class DeleteStackResult {
  DeleteStackResult();
  static DeleteStackResult fromJson(Map<String, dynamic> json) =>
      DeleteStackResult();
}

class DeleteUsageReportSubscriptionResult {
  DeleteUsageReportSubscriptionResult();
  static DeleteUsageReportSubscriptionResult fromJson(
          Map<String, dynamic> json) =>
      DeleteUsageReportSubscriptionResult();
}

class DeleteUserResult {
  DeleteUserResult();
  static DeleteUserResult fromJson(Map<String, dynamic> json) =>
      DeleteUserResult();
}

class DescribeDirectoryConfigsResult {
  /// Information about the directory configurations. Note that although the
  /// response syntax in this topic includes the account password, this password
  /// is not returned in the actual response.
  final List<DirectoryConfig> directoryConfigs;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeDirectoryConfigsResult({
    this.directoryConfigs,
    this.nextToken,
  });
  static DescribeDirectoryConfigsResult fromJson(Map<String, dynamic> json) =>
      DescribeDirectoryConfigsResult();
}

class DescribeFleetsResult {
  /// Information about the fleets.
  final List<Fleet> fleets;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeFleetsResult({
    this.fleets,
    this.nextToken,
  });
  static DescribeFleetsResult fromJson(Map<String, dynamic> json) =>
      DescribeFleetsResult();
}

class DescribeImageBuildersResult {
  /// Information about the image builders.
  final List<ImageBuilder> imageBuilders;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeImageBuildersResult({
    this.imageBuilders,
    this.nextToken,
  });
  static DescribeImageBuildersResult fromJson(Map<String, dynamic> json) =>
      DescribeImageBuildersResult();
}

class DescribeImagePermissionsResult {
  /// The name of the private image.
  final String name;

  /// The permissions for a private image that you own.
  final List<SharedImagePermissions> sharedImagePermissionsList;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeImagePermissionsResult({
    this.name,
    this.sharedImagePermissionsList,
    this.nextToken,
  });
  static DescribeImagePermissionsResult fromJson(Map<String, dynamic> json) =>
      DescribeImagePermissionsResult();
}

class DescribeImagesResult {
  /// Information about the images.
  final List<Image> images;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeImagesResult({
    this.images,
    this.nextToken,
  });
  static DescribeImagesResult fromJson(Map<String, dynamic> json) =>
      DescribeImagesResult();
}

class DescribeSessionsResult {
  /// Information about the streaming sessions.
  final List<Session> sessions;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeSessionsResult({
    this.sessions,
    this.nextToken,
  });
  static DescribeSessionsResult fromJson(Map<String, dynamic> json) =>
      DescribeSessionsResult();
}

class DescribeStacksResult {
  /// Information about the stacks.
  final List<Stack> stacks;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeStacksResult({
    this.stacks,
    this.nextToken,
  });
  static DescribeStacksResult fromJson(Map<String, dynamic> json) =>
      DescribeStacksResult();
}

class DescribeUsageReportSubscriptionsResult {
  /// Information about the usage report subscription.
  final List<UsageReportSubscription> usageReportSubscriptions;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeUsageReportSubscriptionsResult({
    this.usageReportSubscriptions,
    this.nextToken,
  });
  static DescribeUsageReportSubscriptionsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeUsageReportSubscriptionsResult();
}

class DescribeUserStackAssociationsResult {
  /// The UserStackAssociation objects.
  final List<UserStackAssociation> userStackAssociations;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeUserStackAssociationsResult({
    this.userStackAssociations,
    this.nextToken,
  });
  static DescribeUserStackAssociationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeUserStackAssociationsResult();
}

class DescribeUsersResult {
  /// Information about users in the user pool.
  final List<User> users;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  DescribeUsersResult({
    this.users,
    this.nextToken,
  });
  static DescribeUsersResult fromJson(Map<String, dynamic> json) =>
      DescribeUsersResult();
}

class DirectoryConfig {
  /// The fully qualified name of the directory (for example, corp.example.com).
  final String directoryName;

  /// The distinguished names of the organizational units for computer accounts.
  final List<String> organizationalUnitDistinguishedNames;

  /// The credentials for the service account used by the fleet or image builder
  /// to connect to the directory.
  final ServiceAccountCredentials serviceAccountCredentials;

  /// The time the directory configuration was created.
  final DateTime createdTime;

  DirectoryConfig({
    @required this.directoryName,
    this.organizationalUnitDistinguishedNames,
    this.serviceAccountCredentials,
    this.createdTime,
  });
  static DirectoryConfig fromJson(Map<String, dynamic> json) =>
      DirectoryConfig();
}

class DisableUserResult {
  DisableUserResult();
  static DisableUserResult fromJson(Map<String, dynamic> json) =>
      DisableUserResult();
}

class DisassociateFleetResult {
  DisassociateFleetResult();
  static DisassociateFleetResult fromJson(Map<String, dynamic> json) =>
      DisassociateFleetResult();
}

class DomainJoinInfo {
  /// The fully qualified name of the directory (for example, corp.example.com).
  final String directoryName;

  /// The distinguished name of the organizational unit for computer accounts.
  final String organizationalUnitDistinguishedName;

  DomainJoinInfo({
    this.directoryName,
    this.organizationalUnitDistinguishedName,
  });
  static DomainJoinInfo fromJson(Map<String, dynamic> json) => DomainJoinInfo();
}

class EnableUserResult {
  EnableUserResult();
  static EnableUserResult fromJson(Map<String, dynamic> json) =>
      EnableUserResult();
}

class ExpireSessionResult {
  ExpireSessionResult();
  static ExpireSessionResult fromJson(Map<String, dynamic> json) =>
      ExpireSessionResult();
}

class Fleet {
  /// The Amazon Resource Name (ARN) for the fleet.
  final String arn;

  /// The name of the fleet.
  final String name;

  /// The fleet name to display.
  final String displayName;

  /// The description to display.
  final String description;

  /// The name of the image used to create the fleet.
  final String imageName;

  /// The ARN for the public, private, or shared image.
  final String imageArn;

  /// The instance type to use when launching fleet instances.
  final String instanceType;

  /// The fleet type.
  ///
  /// ALWAYS_ON
  ///
  /// Provides users with instant-on access to their apps. You are charged for
  /// all running instances in your fleet, even if no users are streaming apps.
  ///
  /// ON_DEMAND
  ///
  /// Provide users with access to applications after they connect, which takes
  /// one to two minutes. You are charged for instance streaming when users are
  /// connected and a small hourly fee for instances that are not streaming
  /// apps.
  final String fleetType;

  /// The capacity status for the fleet.
  final ComputeCapacityStatus computeCapacityStatus;

  /// The maximum amount of time that a streaming session can remain active, in
  /// seconds. If users are still connected to a streaming instance five minutes
  /// before this limit is reached, they are prompted to save any open documents
  /// before being disconnected. After this time elapses, the instance is
  /// terminated and replaced by a new instance.
  ///
  /// Specify a value between 600 and 360000.
  final int maxUserDurationInSeconds;

  /// The amount of time that a streaming session remains active after users
  /// disconnect. If they try to reconnect to the streaming session after a
  /// disconnection or network interruption within this time interval, they are
  /// connected to their previous session. Otherwise, they are connected to a
  /// new session with a new streaming instance.
  ///
  /// Specify a value between 60 and 360000.
  final int disconnectTimeoutInSeconds;

  /// The current state for the fleet.
  final String state;

  /// The VPC configuration for the fleet.
  final VpcConfig vpcConfig;

  /// The time the fleet was created.
  final DateTime createdTime;

  /// The fleet errors.
  final List<FleetError> fleetErrors;

  /// Indicates whether default internet access is enabled for the fleet.
  final bool enableDefaultInternetAccess;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// fleet to a Microsoft Active Directory domain.
  final DomainJoinInfo domainJoinInfo;

  /// The amount of time that users can be idle (inactive) before they are
  /// disconnected from their streaming session and the
  /// `DisconnectTimeoutInSeconds` time interval begins. Users are notified
  /// before they are disconnected due to inactivity. If users try to reconnect
  /// to the streaming session before the time interval specified in
  /// `DisconnectTimeoutInSeconds` elapses, they are connected to their previous
  /// session. Users are considered idle when they stop providing keyboard or
  /// mouse input during their streaming session. File uploads and downloads,
  /// audio in, audio out, and pixels changing do not qualify as user activity.
  /// If users continue to be idle after the time interval in
  /// `IdleDisconnectTimeoutInSeconds` elapses, they are disconnected.
  ///
  /// To prevent users from being disconnected due to inactivity, specify a
  /// value of 0. Otherwise, specify a value between 60 and 3600. The default
  /// value is 0.
  ///
  ///
  ///
  /// If you enable this feature, we recommend that you specify a value that
  /// corresponds exactly to a whole number of minutes (for example, 60, 120,
  /// and 180). If you don't do this, the value is rounded to the nearest
  /// minute. For example, if you specify a value of 70, users are disconnected
  /// after 1 minute of inactivity. If you specify a value that is at the
  /// midpoint between two different minutes, the value is rounded up. For
  /// example, if you specify a value of 90, users are disconnected after 2
  /// minutes of inactivity.
  final int idleDisconnectTimeoutInSeconds;

  /// The ARN of the IAM role that is applied to the fleet. To assume a role,
  /// the fleet instance calls the AWS Security Token Service (STS) `AssumeRole`
  /// API operation and passes the ARN of the role to use. The operation creates
  /// a new session with temporary credentials.
  final String iamRoleArn;

  Fleet({
    @required this.arn,
    @required this.name,
    this.displayName,
    this.description,
    this.imageName,
    this.imageArn,
    @required this.instanceType,
    this.fleetType,
    @required this.computeCapacityStatus,
    this.maxUserDurationInSeconds,
    this.disconnectTimeoutInSeconds,
    @required this.state,
    this.vpcConfig,
    this.createdTime,
    this.fleetErrors,
    this.enableDefaultInternetAccess,
    this.domainJoinInfo,
    this.idleDisconnectTimeoutInSeconds,
    this.iamRoleArn,
  });
  static Fleet fromJson(Map<String, dynamic> json) => Fleet();
}

class FleetError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  FleetError({
    this.errorCode,
    this.errorMessage,
  });
  static FleetError fromJson(Map<String, dynamic> json) => FleetError();
}

class Image {
  /// The name of the image.
  final String name;

  /// The ARN of the image.
  final String arn;

  /// The ARN of the image from which this image was created.
  final String baseImageArn;

  /// The image name to display.
  final String displayName;

  /// The image starts in the `PENDING` state. If image creation succeeds, the
  /// state is `AVAILABLE`. If image creation fails, the state is `FAILED`.
  final String state;

  /// Indicates whether the image is public or private.
  final String visibility;

  /// Indicates whether an image builder can be launched from this image.
  final bool imageBuilderSupported;

  /// The name of the image builder that was used to create the private image.
  /// If the image is shared, this value is null.
  final String imageBuilderName;

  /// The operating system platform of the image.
  final String platform;

  /// The description to display.
  final String description;

  /// The reason why the last state change occurred.
  final ImageStateChangeReason stateChangeReason;

  /// The applications associated with the image.
  final List<Application> applications;

  /// The time the image was created.
  final DateTime createdTime;

  /// The release date of the public base image. For private images, this date
  /// is the release date of the base image from which the image was created.
  final DateTime publicBaseImageReleasedDate;

  /// The version of the AppStream 2.0 agent to use for instances that are
  /// launched from this image.
  final String appstreamAgentVersion;

  /// The permissions to provide to the destination AWS account for the
  /// specified image.
  final ImagePermissions imagePermissions;

  Image({
    @required this.name,
    this.arn,
    this.baseImageArn,
    this.displayName,
    this.state,
    this.visibility,
    this.imageBuilderSupported,
    this.imageBuilderName,
    this.platform,
    this.description,
    this.stateChangeReason,
    this.applications,
    this.createdTime,
    this.publicBaseImageReleasedDate,
    this.appstreamAgentVersion,
    this.imagePermissions,
  });
  static Image fromJson(Map<String, dynamic> json) => Image();
}

class ImageBuilder {
  /// The name of the image builder.
  final String name;

  /// The ARN for the image builder.
  final String arn;

  /// The ARN of the image from which this builder was created.
  final String imageArn;

  /// The description to display.
  final String description;

  /// The image builder name to display.
  final String displayName;

  /// The VPC configuration of the image builder.
  final VpcConfig vpcConfig;

  /// The instance type for the image builder.
  final String instanceType;

  /// The operating system platform of the image builder.
  final String platform;

  /// The ARN of the IAM role that is applied to the image builder. To assume a
  /// role, the image builder calls the AWS Security Token Service (STS)
  /// `AssumeRole` API operation and passes the ARN of the role to use. The
  /// operation creates a new session with temporary credentials.
  final String iamRoleArn;

  /// The state of the image builder.
  final String state;

  /// The reason why the last state change occurred.
  final ImageBuilderStateChangeReason stateChangeReason;

  /// The time stamp when the image builder was created.
  final DateTime createdTime;

  /// Enables or disables default internet access for the image builder.
  final bool enableDefaultInternetAccess;

  /// The name of the directory and organizational unit (OU) to use to join the
  /// image builder to a Microsoft Active Directory domain.
  final DomainJoinInfo domainJoinInfo;

  final NetworkAccessConfiguration networkAccessConfiguration;

  /// The image builder errors.
  final List<ResourceError> imageBuilderErrors;

  /// The version of the AppStream 2.0 agent that is currently being used by the
  /// image builder.
  final String appstreamAgentVersion;

  /// The list of virtual private cloud (VPC) interface endpoint objects.
  /// Administrators can connect to the image builder only through the specified
  /// endpoints.
  final List<AccessEndpoint> accessEndpoints;

  ImageBuilder({
    @required this.name,
    this.arn,
    this.imageArn,
    this.description,
    this.displayName,
    this.vpcConfig,
    this.instanceType,
    this.platform,
    this.iamRoleArn,
    this.state,
    this.stateChangeReason,
    this.createdTime,
    this.enableDefaultInternetAccess,
    this.domainJoinInfo,
    this.networkAccessConfiguration,
    this.imageBuilderErrors,
    this.appstreamAgentVersion,
    this.accessEndpoints,
  });
  static ImageBuilder fromJson(Map<String, dynamic> json) => ImageBuilder();
}

class ImageBuilderStateChangeReason {
  /// The state change reason code.
  final String code;

  /// The state change reason message.
  final String message;

  ImageBuilderStateChangeReason({
    this.code,
    this.message,
  });
  static ImageBuilderStateChangeReason fromJson(Map<String, dynamic> json) =>
      ImageBuilderStateChangeReason();
}

class ImagePermissions {
  /// Indicates whether the image can be used for a fleet.
  final bool allowFleet;

  /// Indicates whether the image can be used for an image builder.
  final bool allowImageBuilder;

  ImagePermissions({
    this.allowFleet,
    this.allowImageBuilder,
  });
  static ImagePermissions fromJson(Map<String, dynamic> json) =>
      ImagePermissions();
}

class ImageStateChangeReason {
  /// The state change reason code.
  final String code;

  /// The state change reason message.
  final String message;

  ImageStateChangeReason({
    this.code,
    this.message,
  });
  static ImageStateChangeReason fromJson(Map<String, dynamic> json) =>
      ImageStateChangeReason();
}

class LastReportGenerationExecutionError {
  /// The error code for the error that is returned when a usage report can't be
  /// generated.
  final String errorCode;

  /// The error message for the error that is returned when a usage report can't
  /// be generated.
  final String errorMessage;

  LastReportGenerationExecutionError({
    this.errorCode,
    this.errorMessage,
  });
  static LastReportGenerationExecutionError fromJson(
          Map<String, dynamic> json) =>
      LastReportGenerationExecutionError();
}

class ListAssociatedFleetsResult {
  /// The name of the fleet.
  final List<String> names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListAssociatedFleetsResult({
    this.names,
    this.nextToken,
  });
  static ListAssociatedFleetsResult fromJson(Map<String, dynamic> json) =>
      ListAssociatedFleetsResult();
}

class ListAssociatedStacksResult {
  /// The name of the stack.
  final List<String> names;

  /// The pagination token to use to retrieve the next page of results for this
  /// operation. If there are no more pages, this value is null.
  final String nextToken;

  ListAssociatedStacksResult({
    this.names,
    this.nextToken,
  });
  static ListAssociatedStacksResult fromJson(Map<String, dynamic> json) =>
      ListAssociatedStacksResult();
}

class ListTagsForResourceResponse {
  /// The information about the tags.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class NetworkAccessConfiguration {
  /// The private IP address of the elastic network interface that is attached
  /// to instances in your VPC.
  final String eniPrivateIpAddress;

  /// The resource identifier of the elastic network interface that is attached
  /// to instances in your VPC. All network interfaces have the eni-xxxxxxxx
  /// resource identifier.
  final String eniId;

  NetworkAccessConfiguration({
    this.eniPrivateIpAddress,
    this.eniId,
  });
  static NetworkAccessConfiguration fromJson(Map<String, dynamic> json) =>
      NetworkAccessConfiguration();
}

class ResourceError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  /// The time the error occurred.
  final DateTime errorTimestamp;

  ResourceError({
    this.errorCode,
    this.errorMessage,
    this.errorTimestamp,
  });
  static ResourceError fromJson(Map<String, dynamic> json) => ResourceError();
}

class ServiceAccountCredentials {
  /// The user name of the account. This account must have the following
  /// privileges: create computer objects, join computers to the domain, and
  /// change/reset the password on descendant computer objects for the
  /// organizational units specified.
  final String accountName;

  /// The password for the account.
  final String accountPassword;

  ServiceAccountCredentials({
    @required this.accountName,
    @required this.accountPassword,
  });
  static ServiceAccountCredentials fromJson(Map<String, dynamic> json) =>
      ServiceAccountCredentials();
}

class Session {
  /// The identifier of the streaming session.
  final String id;

  /// The identifier of the user for whom the session was created.
  final String userId;

  /// The name of the stack for the streaming session.
  final String stackName;

  /// The name of the fleet for the streaming session.
  final String fleetName;

  /// The current state of the streaming session.
  final String state;

  /// Specifies whether a user is connected to the streaming session.
  final String connectionState;

  /// The time when a streaming instance is dedicated for the user.
  final DateTime startTime;

  /// The time when the streaming session is set to expire. This time is based
  /// on the `MaxUserDurationinSeconds` value, which determines the maximum
  /// length of time that a streaming session can run. A streaming session might
  /// end earlier than the time specified in `SessionMaxExpirationTime`, when
  /// the `DisconnectTimeOutInSeconds` elapses or the user chooses to end his or
  /// her session. If the `DisconnectTimeOutInSeconds` elapses, or the user
  /// chooses to end his or her session, the streaming instance is terminated
  /// and the streaming session ends.
  final DateTime maxExpirationTime;

  /// The authentication method. The user is authenticated using a streaming URL
  /// (`API`) or SAML 2.0 federation (`SAML`).
  final String authenticationType;

  /// The network details for the streaming session.
  final NetworkAccessConfiguration networkAccessConfiguration;

  Session({
    @required this.id,
    @required this.userId,
    @required this.stackName,
    @required this.fleetName,
    @required this.state,
    this.connectionState,
    this.startTime,
    this.maxExpirationTime,
    this.authenticationType,
    this.networkAccessConfiguration,
  });
  static Session fromJson(Map<String, dynamic> json) => Session();
}

class SharedImagePermissions {
  /// The 12-digit identifier of the AWS account with which the image is shared.
  final String sharedAccountId;

  /// Describes the permissions for a shared image.
  final ImagePermissions imagePermissions;

  SharedImagePermissions({
    @required this.sharedAccountId,
    @required this.imagePermissions,
  });
  static SharedImagePermissions fromJson(Map<String, dynamic> json) =>
      SharedImagePermissions();
}

class Stack {
  /// The ARN of the stack.
  final String arn;

  /// The name of the stack.
  final String name;

  /// The description to display.
  final String description;

  /// The stack name to display.
  final String displayName;

  /// The time the stack was created.
  final DateTime createdTime;

  /// The storage connectors to enable.
  final List<StorageConnector> storageConnectors;

  /// The URL that users are redirected to after their streaming session ends.
  final String redirectUrl;

  /// The URL that users are redirected to after they click the Send Feedback
  /// link. If no URL is specified, no Send Feedback link is displayed.
  final String feedbackUrl;

  /// The errors for the stack.
  final List<StackError> stackErrors;

  /// The actions that are enabled or disabled for users during their streaming
  /// sessions. By default these actions are enabled.
  final List<UserSetting> userSettings;

  /// The persistent application settings for users of the stack.
  final ApplicationSettingsResponse applicationSettings;

  /// The list of virtual private cloud (VPC) interface endpoint objects. Users
  /// of the stack can connect to AppStream 2.0 only through the specified
  /// endpoints.
  final List<AccessEndpoint> accessEndpoints;

  Stack({
    this.arn,
    @required this.name,
    this.description,
    this.displayName,
    this.createdTime,
    this.storageConnectors,
    this.redirectUrl,
    this.feedbackUrl,
    this.stackErrors,
    this.userSettings,
    this.applicationSettings,
    this.accessEndpoints,
  });
  static Stack fromJson(Map<String, dynamic> json) => Stack();
}

class StackError {
  /// The error code.
  final String errorCode;

  /// The error message.
  final String errorMessage;

  StackError({
    this.errorCode,
    this.errorMessage,
  });
  static StackError fromJson(Map<String, dynamic> json) => StackError();
}

class StartFleetResult {
  StartFleetResult();
  static StartFleetResult fromJson(Map<String, dynamic> json) =>
      StartFleetResult();
}

class StartImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder imageBuilder;

  StartImageBuilderResult({
    this.imageBuilder,
  });
  static StartImageBuilderResult fromJson(Map<String, dynamic> json) =>
      StartImageBuilderResult();
}

class StopFleetResult {
  StopFleetResult();
  static StopFleetResult fromJson(Map<String, dynamic> json) =>
      StopFleetResult();
}

class StopImageBuilderResult {
  /// Information about the image builder.
  final ImageBuilder imageBuilder;

  StopImageBuilderResult({
    this.imageBuilder,
  });
  static StopImageBuilderResult fromJson(Map<String, dynamic> json) =>
      StopImageBuilderResult();
}

class StorageConnector {
  /// The type of storage connector.
  final String connectorType;

  /// The ARN of the storage connector.
  final String resourceIdentifier;

  /// The names of the domains for the account.
  final List<String> domains;

  StorageConnector({
    @required this.connectorType,
    this.resourceIdentifier,
    this.domains,
  });
  static StorageConnector fromJson(Map<String, dynamic> json) =>
      StorageConnector();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateDirectoryConfigResult {
  /// Information about the Directory Config object.
  final DirectoryConfig directoryConfig;

  UpdateDirectoryConfigResult({
    this.directoryConfig,
  });
  static UpdateDirectoryConfigResult fromJson(Map<String, dynamic> json) =>
      UpdateDirectoryConfigResult();
}

class UpdateFleetResult {
  /// Information about the fleet.
  final Fleet fleet;

  UpdateFleetResult({
    this.fleet,
  });
  static UpdateFleetResult fromJson(Map<String, dynamic> json) =>
      UpdateFleetResult();
}

class UpdateImagePermissionsResult {
  UpdateImagePermissionsResult();
  static UpdateImagePermissionsResult fromJson(Map<String, dynamic> json) =>
      UpdateImagePermissionsResult();
}

class UpdateStackResult {
  /// Information about the stack.
  final Stack stack;

  UpdateStackResult({
    this.stack,
  });
  static UpdateStackResult fromJson(Map<String, dynamic> json) =>
      UpdateStackResult();
}

class UsageReportSubscription {
  /// The Amazon S3 bucket where generated reports are stored.
  ///
  /// If you enabled on-instance session scripts and Amazon S3 logging for your
  /// session script configuration, AppStream 2.0 created an S3 bucket to store
  /// the script output. The bucket is unique to your account and Region. When
  /// you enable usage reporting in this case, AppStream 2.0 uses the same
  /// bucket to store your usage reports. If you haven't already enabled
  /// on-instance session scripts, when you enable usage reports, AppStream 2.0
  /// creates a new S3 bucket.
  final String s3BucketName;

  /// The schedule for generating usage reports.
  final String schedule;

  /// The time when the last usage report was generated.
  final DateTime lastGeneratedReportDate;

  /// The errors that were returned if usage reports couldn't be generated.
  final List<LastReportGenerationExecutionError> subscriptionErrors;

  UsageReportSubscription({
    this.s3BucketName,
    this.schedule,
    this.lastGeneratedReportDate,
    this.subscriptionErrors,
  });
  static UsageReportSubscription fromJson(Map<String, dynamic> json) =>
      UsageReportSubscription();
}

class User {
  /// The ARN of the user.
  final String arn;

  /// The email address of the user.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive.
  final String userName;

  /// Specifies whether the user in the user pool is enabled.
  final bool enabled;

  /// The status of the user in the user pool. The status can be one of the
  /// following:
  ///
  /// *   UNCONFIRMED – The user is created but not confirmed.
  ///
  /// *   CONFIRMED – The user is confirmed.
  ///
  /// *   ARCHIVED – The user is no longer active.
  ///
  /// *   COMPROMISED – The user is disabled because of a potential security
  /// threat.
  ///
  /// *   UNKNOWN – The user status is not known.
  final String status;

  /// The first name, or given name, of the user.
  final String firstName;

  /// The last name, or surname, of the user.
  final String lastName;

  /// The date and time the user was created in the user pool.
  final DateTime createdTime;

  /// The authentication type for the user.
  final String authenticationType;

  User({
    this.arn,
    this.userName,
    this.enabled,
    this.status,
    this.firstName,
    this.lastName,
    this.createdTime,
    @required this.authenticationType,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}

class UserSetting {
  /// The action that is enabled or disabled.
  final String action;

  /// Indicates whether the action is enabled or disabled.
  final String permission;

  UserSetting({
    @required this.action,
    @required this.permission,
  });
  static UserSetting fromJson(Map<String, dynamic> json) => UserSetting();
}

class UserStackAssociation {
  /// The name of the stack that is associated with the user.
  final String stackName;

  /// The email address of the user who is associated with the stack.
  ///
  ///
  ///
  /// Users' email addresses are case-sensitive.
  final String userName;

  /// The authentication type for the user.
  final String authenticationType;

  /// Specifies whether a welcome email is sent to a user after the user is
  /// created in the user pool.
  final bool sendEmailNotification;

  UserStackAssociation({
    @required this.stackName,
    @required this.userName,
    @required this.authenticationType,
    this.sendEmailNotification,
  });
  static UserStackAssociation fromJson(Map<String, dynamic> json) =>
      UserStackAssociation();
}

class UserStackAssociationError {
  /// Information about the user and associated stack.
  final UserStackAssociation userStackAssociation;

  /// The error code for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  final String errorCode;

  /// The error message for the error that is returned when a user can’t be
  /// associated with or disassociated from a stack.
  final String errorMessage;

  UserStackAssociationError({
    this.userStackAssociation,
    this.errorCode,
    this.errorMessage,
  });
  static UserStackAssociationError fromJson(Map<String, dynamic> json) =>
      UserStackAssociationError();
}

class VpcConfig {
  /// The identifiers of the subnets to which a network interface is attached
  /// from the fleet instance or image builder instance. Fleet instances use one
  /// or more subnets. Image builder instances use one subnet.
  final List<String> subnetIds;

  /// The identifiers of the security groups for the fleet or image builder.
  final List<String> securityGroupIds;

  VpcConfig({
    this.subnetIds,
    this.securityGroupIds,
  });
  static VpcConfig fromJson(Map<String, dynamic> json) => VpcConfig();
}
