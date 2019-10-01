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
  Future<void> associateFleet(
      {@required String fleetName, @required String stackName}) async {}

  /// Associates the specified users with the specified stacks. Users in a user
  /// pool cannot be assigned to stacks with fleets that are joined to an Active
  /// Directory domain.
  Future<void> batchAssociateUserStack(
      List<UserStackAssociation> userStackAssociations) async {}

  /// Disassociates the specified users from the specified stacks.
  Future<void> batchDisassociateUserStack(
      List<UserStackAssociation> userStackAssociations) async {}

  /// Copies the image within the same region or to a new region within the same
  /// AWS account. Note that any tags you added to the image will not be copied.
  Future<void> copyImage(
      {@required String sourceImageName,
      @required String destinationImageName,
      @required String destinationRegion,
      String destinationImageDescription}) async {}

  /// Creates a Directory Config object in AppStream 2.0. This object includes
  /// the configuration information required to join fleets and image builders
  /// to Microsoft Active Directory domains.
  Future<void> createDirectoryConfig(
      {@required String directoryName,
      @required List<String> organizationalUnitDistinguishedNames,
      @required ServiceAccountCredentials serviceAccountCredentials}) async {}

  /// Creates a fleet. A fleet consists of streaming instances that run a
  /// specified image.
  Future<void> createFleet(
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
      String iamRoleArn}) async {}

  /// Creates an image builder. An image builder is a virtual machine that is
  /// used to create an image.
  ///
  /// The initial state of the builder is `PENDING`. When it is ready, the state
  /// is `RUNNING`.
  Future<void> createImageBuilder(
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
      List<AccessEndpoint> accessEndpoints}) async {}

  /// Creates a URL to start an image builder streaming session.
  Future<void> createImageBuilderStreamingUrl(String name,
      {BigInt validity}) async {}

  /// Creates a stack to start streaming applications to users. A stack consists
  /// of an associated fleet, user access policies, and storage configurations.
  Future<void> createStack(String name,
      {String description,
      String displayName,
      List<StorageConnector> storageConnectors,
      String redirectUrl,
      String feedbackUrl,
      List<UserSetting> userSettings,
      ApplicationSettings applicationSettings,
      Map<String, String> tags,
      List<AccessEndpoint> accessEndpoints}) async {}

  /// Creates a temporary URL to start an AppStream 2.0 streaming session for
  /// the specified user. A streaming URL enables application streaming to be
  /// tested without user setup.
  Future<void> createStreamingUrl(
      {@required String stackName,
      @required String fleetName,
      @required String userId,
      String applicationId,
      BigInt validity,
      String sessionContext}) async {}

  /// Creates a usage report subscription. Usage reports are generated daily.
  Future<void> createUsageReportSubscription() async {}

  /// Creates a new user in the user pool.
  Future<void> createUser(
      {@required String userName,
      String messageAction,
      String firstName,
      String lastName,
      @required String authenticationType}) async {}

  /// Deletes the specified Directory Config object from AppStream 2.0. This
  /// object includes the information required to join streaming instances to an
  /// Active Directory domain.
  Future<void> deleteDirectoryConfig(String directoryName) async {}

  /// Deletes the specified fleet.
  Future<void> deleteFleet(String name) async {}

  /// Deletes the specified image. You cannot delete an image when it is in use.
  /// After you delete an image, you cannot provision new capacity using the
  /// image.
  Future<void> deleteImage(String name) async {}

  /// Deletes the specified image builder and releases the capacity.
  Future<void> deleteImageBuilder(String name) async {}

  /// Deletes permissions for the specified private image. After you delete
  /// permissions for an image, AWS accounts to which you previously granted
  /// these permissions can no longer use the image.
  Future<void> deleteImagePermissions(
      {@required String name, @required String sharedAccountId}) async {}

  /// Deletes the specified stack. After the stack is deleted, the application
  /// streaming environment provided by the stack is no longer available to
  /// users. Also, any reservations made for application streaming sessions for
  /// the stack are released.
  Future<void> deleteStack(String name) async {}

  /// Disables usage report generation.
  Future<void> deleteUsageReportSubscription() async {}

  /// Deletes a user from the user pool.
  Future<void> deleteUser(
      {@required String userName, @required String authenticationType}) async {}

  /// Retrieves a list that describes one or more specified Directory Config
  /// objects for AppStream 2.0, if the names for these objects are provided.
  /// Otherwise, all Directory Config objects in the account are described.
  /// These objects include the configuration information required to join
  /// fleets and image builders to Microsoft Active Directory domains.
  ///
  /// Although the response syntax in this topic includes the account password,
  /// this password is not returned in the actual response.
  Future<void> describeDirectoryConfigs(
      {List<String> directoryNames, int maxResults, String nextToken}) async {}

  /// Retrieves a list that describes one or more specified fleets, if the fleet
  /// names are provided. Otherwise, all fleets in the account are described.
  Future<void> describeFleets({List<String> names, String nextToken}) async {}

  /// Retrieves a list that describes one or more specified image builders, if
  /// the image builder names are provided. Otherwise, all image builders in the
  /// account are described.
  Future<void> describeImageBuilders(
      {List<String> names, int maxResults, String nextToken}) async {}

  /// Retrieves a list that describes the permissions for shared AWS account IDs
  /// on a private image that you own.
  Future<void> describeImagePermissions(String name,
      {int maxResults,
      List<String> sharedAwsAccountIds,
      String nextToken}) async {}

  /// Retrieves a list that describes one or more specified images, if the image
  /// names or image ARNs are provided. Otherwise, all images in the account are
  /// described.
  Future<void> describeImages(
      {List<String> names,
      List<String> arns,
      String type,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves a list that describes the streaming sessions for a specified
  /// stack and fleet. If a UserId is provided for the stack and fleet, only
  /// streaming sessions for that user are described. If an authentication type
  /// is not provided, the default is to authenticate users using a streaming
  /// URL.
  Future<void> describeSessions(
      {@required String stackName,
      @required String fleetName,
      String userId,
      String nextToken,
      int limit,
      String authenticationType}) async {}

  /// Retrieves a list that describes one or more specified stacks, if the stack
  /// names are provided. Otherwise, all stacks in the account are described.
  Future<void> describeStacks({List<String> names, String nextToken}) async {}

  /// Retrieves a list that describes one or more usage report subscriptions.
  Future<void> describeUsageReportSubscriptions(
      {int maxResults, String nextToken}) async {}

  /// Retrieves a list that describes the UserStackAssociation objects. You must
  /// specify either or both of the following:
  ///
  /// *   The stack name
  ///
  /// *   The user name (email address of the user associated with the stack)
  /// and the authentication type for the user
  Future<void> describeUserStackAssociations(
      {String stackName,
      String userName,
      String authenticationType,
      int maxResults,
      String nextToken}) async {}

  /// Retrieves a list that describes one or more specified users in the user
  /// pool.
  Future<void> describeUsers(String authenticationType,
      {int maxResults, String nextToken}) async {}

  /// Disables the specified user in the user pool. Users can't sign in to
  /// AppStream 2.0 until they are re-enabled. This action does not delete the
  /// user.
  Future<void> disableUser(
      {@required String userName, @required String authenticationType}) async {}

  /// Disassociates the specified fleet from the specified stack.
  Future<void> disassociateFleet(
      {@required String fleetName, @required String stackName}) async {}

  /// Enables a user in the user pool. After being enabled, users can sign in to
  /// AppStream 2.0 and open applications from the stacks to which they are
  /// assigned.
  Future<void> enableUser(
      {@required String userName, @required String authenticationType}) async {}

  /// Immediately stops the specified streaming session.
  Future<void> expireSession(String sessionId) async {}

  /// Retrieves the name of the fleet that is associated with the specified
  /// stack.
  Future<void> listAssociatedFleets(String stackName,
      {String nextToken}) async {}

  /// Retrieves the name of the stack with which the specified fleet is
  /// associated.
  Future<void> listAssociatedStacks(String fleetName,
      {String nextToken}) async {}

  /// Retrieves a list of all tags for the specified AppStream 2.0 resource. You
  /// can tag AppStream 2.0 image builders, images, fleets, and stacks.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Starts the specified fleet.
  Future<void> startFleet(String name) async {}

  /// Starts the specified image builder.
  Future<void> startImageBuilder(String name,
      {String appstreamAgentVersion}) async {}

  /// Stops the specified fleet.
  Future<void> stopFleet(String name) async {}

  /// Stops the specified image builder.
  Future<void> stopImageBuilder(String name) async {}

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
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Disassociates one or more specified tags from the specified AppStream 2.0
  /// resource.
  ///
  /// To list the current tags for your resources, use ListTagsForResource.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html)
  /// in the _Amazon AppStream 2.0 Administration Guide_.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the specified Directory Config object in AppStream 2.0. This
  /// object includes the configuration information required to join fleets and
  /// image builders to Microsoft Active Directory domains.
  Future<void> updateDirectoryConfig(String directoryName,
      {List<String> organizationalUnitDistinguishedNames,
      ServiceAccountCredentials serviceAccountCredentials}) async {}

  /// Updates the specified fleet.
  ///
  /// If the fleet is in the `STOPPED` state, you can update any attribute
  /// except the fleet name. If the fleet is in the `RUNNING` state, you can
  /// update the `DisplayName`, `ComputeCapacity`, `ImageARN`, `ImageName`,
  /// `IdleDisconnectTimeoutInSeconds`, and `DisconnectTimeoutInSeconds`
  /// attributes. If the fleet is in the `STARTING` or `STOPPING` state, you
  /// can't update it.
  Future<void> updateFleet(
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
      String iamRoleArn}) async {}

  /// Adds or updates permissions for the specified private image.
  Future<void> updateImagePermissions(
      {@required String name,
      @required String sharedAccountId,
      @required ImagePermissions imagePermissions}) async {}

  /// Updates the specified fields for the specified stack.
  Future<void> updateStack(String name,
      {String displayName,
      String description,
      List<StorageConnector> storageConnectors,
      bool deleteStorageConnectors,
      String redirectUrl,
      String feedbackUrl,
      List<String> attributesToDelete,
      List<UserSetting> userSettings,
      ApplicationSettings applicationSettings,
      List<AccessEndpoint> accessEndpoints}) async {}
}

class AccessEndpoint {}

class Application {}

class ApplicationSettings {}

class ApplicationSettingsResponse {}

class AssociateFleetResult {}

class BatchAssociateUserStackResult {}

class BatchDisassociateUserStackResult {}

class ComputeCapacity {}

class ComputeCapacityStatus {}

class CopyImageResponse {}

class CreateDirectoryConfigResult {}

class CreateFleetResult {}

class CreateImageBuilderResult {}

class CreateImageBuilderStreamingUrlResult {}

class CreateStackResult {}

class CreateStreamingUrlResult {}

class CreateUsageReportSubscriptionResult {}

class CreateUserResult {}

class DeleteDirectoryConfigResult {}

class DeleteFleetResult {}

class DeleteImageBuilderResult {}

class DeleteImagePermissionsResult {}

class DeleteImageResult {}

class DeleteStackResult {}

class DeleteUsageReportSubscriptionResult {}

class DeleteUserResult {}

class DescribeDirectoryConfigsResult {}

class DescribeFleetsResult {}

class DescribeImageBuildersResult {}

class DescribeImagePermissionsResult {}

class DescribeImagesResult {}

class DescribeSessionsResult {}

class DescribeStacksResult {}

class DescribeUsageReportSubscriptionsResult {}

class DescribeUserStackAssociationsResult {}

class DescribeUsersResult {}

class DirectoryConfig {}

class DisableUserResult {}

class DisassociateFleetResult {}

class DomainJoinInfo {}

class EnableUserResult {}

class ExpireSessionResult {}

class Fleet {}

class FleetError {}

class Image {}

class ImageBuilder {}

class ImageBuilderStateChangeReason {}

class ImagePermissions {}

class ImageStateChangeReason {}

class LastReportGenerationExecutionError {}

class ListAssociatedFleetsResult {}

class ListAssociatedStacksResult {}

class ListTagsForResourceResponse {}

class NetworkAccessConfiguration {}

class ResourceError {}

class ServiceAccountCredentials {}

class Session {}

class SharedImagePermissions {}

class Stack {}

class StackError {}

class StartFleetResult {}

class StartImageBuilderResult {}

class StopFleetResult {}

class StopImageBuilderResult {}

class StorageConnector {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateDirectoryConfigResult {}

class UpdateFleetResult {}

class UpdateImagePermissionsResult {}

class UpdateStackResult {}

class UsageReportSubscription {}

class User {}

class UserSetting {}

class UserStackAssociation {}

class UserStackAssociationError {}

class VpcConfig {}
