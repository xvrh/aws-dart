import 'package:meta/meta.dart';

/// Amazon WorkSpaces Service
///
/// Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft
/// Windows and Amazon Linux desktops for your users.
class WorkSpacesApi {
  /// Associates the specified IP access control group with the specified
  /// directory.
  Future<void> associateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {}

  /// Adds one or more rules to the specified IP access control group.
  ///
  /// This action gives users permission to access their WorkSpaces from the
  /// CIDR address ranges specified in the rules.
  Future<void> authorizeIpRules(
      {@required String groupId, @required List<IpRuleItem> userRules}) async {}

  /// Copies the specified image from the specified Region to the current
  /// Region.
  Future<void> copyWorkspaceImage(
      {@required String name,
      String description,
      @required String sourceImageId,
      @required String sourceRegion,
      List<Tag> tags}) async {}

  /// Creates an IP access control group.
  ///
  /// An IP access control group provides you with the ability to control the IP
  /// addresses from which users are allowed to access their WorkSpaces. To
  /// specify the CIDR address ranges, add rules to your IP access control group
  /// and then associate the group with your directory. You can add rules when
  /// you create the group or at any time using AuthorizeIpRules.
  ///
  /// There is a default IP access control group associated with your directory.
  /// If you don't associate an IP access control group with your directory, the
  /// default group is used. The default group includes a default rule that
  /// allows users to access their WorkSpaces from anywhere. You cannot modify
  /// the default IP access control group for your directory.
  Future<void> createIpGroup(String groupName,
      {String groupDesc, List<IpRuleItem> userRules, List<Tag> tags}) async {}

  /// Creates the specified tags for the specified WorkSpaces resource.
  Future<void> createTags(
      {@required String resourceId, @required List<Tag> tags}) async {}

  /// Creates one or more WorkSpaces.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces are
  /// created.
  Future<void> createWorkspaces(List<WorkspaceRequest> workspaces) async {}

  /// Deletes the specified IP access control group.
  ///
  /// You cannot delete an IP access control group that is associated with a
  /// directory.
  Future<void> deleteIpGroup(String groupId) async {}

  /// Deletes the specified tags from the specified WorkSpaces resource.
  Future<void> deleteTags(
      {@required String resourceId, @required List<String> tagKeys}) async {}

  /// Deletes the specified image from your account. To delete an image, you
  /// must first delete any bundles that are associated with the image and
  /// un-share the image if it is shared with other accounts.
  Future<void> deleteWorkspaceImage(String imageId) async {}

  /// Retrieves a list that describes the configuration of bring your own
  /// license (BYOL) for the specified account.
  Future<void> describeAccount() async {}

  /// Retrieves a list that describes modifications to the configuration of
  /// bring your own license (BYOL) for the specified account.
  Future<void> describeAccountModifications({String nextToken}) async {}

  /// Retrieves a list that describes one or more specified Amazon WorkSpaces
  /// clients.
  Future<void> describeClientProperties(List<String> resourceIds) async {}

  /// Describes one or more of your IP access control groups.
  Future<void> describeIpGroups(
      {List<String> groupIds, String nextToken, int maxResults}) async {}

  /// Describes the specified tags for the specified WorkSpaces resource.
  Future<void> describeTags(String resourceId) async {}

  /// Retrieves a list that describes the available WorkSpace bundles.
  ///
  /// You can filter the results using either bundle ID or owner, but not both.
  Future<void> describeWorkspaceBundles(
      {List<String> bundleIds, String owner, String nextToken}) async {}

  /// Describes the available AWS Directory Service directories that are
  /// registered with Amazon WorkSpaces.
  Future<void> describeWorkspaceDirectories(
      {List<String> directoryIds, String nextToken}) async {}

  /// Retrieves a list that describes one or more specified images, if the image
  /// identifiers are provided. Otherwise, all images in the account are
  /// described.
  Future<void> describeWorkspaceImages(
      {List<String> imageIds, String nextToken, int maxResults}) async {}

  /// Describes the specified WorkSpaces.
  ///
  /// You can filter the results by using the bundle identifier, directory
  /// identifier, or owner, but you can specify only one filter at a time.
  Future<void> describeWorkspaces(
      {List<String> workspaceIds,
      String directoryId,
      String userName,
      String bundleId,
      int limit,
      String nextToken}) async {}

  /// Describes the connection status of the specified WorkSpaces.
  Future<void> describeWorkspacesConnectionStatus(
      {List<String> workspaceIds, String nextToken}) async {}

  /// Disassociates the specified IP access control group from the specified
  /// directory.
  Future<void> disassociateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {}

  /// Imports the specified Windows 7 or Windows 10 bring your own license
  /// (BYOL) image into Amazon WorkSpaces. The image must be an already licensed
  /// EC2 image that is in your AWS account, and you must own the image.
  Future<void> importWorkspaceImage(
      {@required String ec2ImageId,
      @required String ingestionProcess,
      @required String imageName,
      @required String imageDescription,
      List<Tag> tags}) async {}

  /// Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that
  /// you can use for the network management interface when you enable bring
  /// your own license (BYOL).
  ///
  /// The management network interface is connected to a secure Amazon
  /// WorkSpaces management network. It is used for interactive streaming of the
  /// WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon
  /// WorkSpaces to manage the WorkSpace.
  Future<void> listAvailableManagementCidrRanges(
      String managementCidrRangeConstraint,
      {int maxResults,
      String nextToken}) async {}

  /// Modifies the configuration of bring your own license (BYOL) for the
  /// specified account.
  Future<void> modifyAccount(
      {String dedicatedTenancySupport,
      String dedicatedTenancyManagementCidrRange}) async {}

  /// Modifies the properties of the specified Amazon WorkSpaces clients.
  Future<void> modifyClientProperties(
      {@required String resourceId,
      @required ClientProperties clientProperties}) async {}

  /// Modifies the specified WorkSpace properties.
  Future<void> modifyWorkspaceProperties(
      {@required String workspaceId,
      @required WorkspaceProperties workspaceProperties}) async {}

  /// Sets the state of the specified WorkSpace.
  ///
  /// To maintain a WorkSpace without being interrupted, set the WorkSpace state
  /// to `ADMIN_MAINTENANCE`. WorkSpaces in this state do not respond to
  /// requests to reboot, stop, start, rebuild, or restore. An AutoStop
  /// WorkSpace in this state is not stopped. Users cannot log into a WorkSpace
  /// in the `ADMIN_MAINTENANCE` state.
  Future<void> modifyWorkspaceState(
      {@required String workspaceId, @required String workspaceState}) async {}

  /// Reboots the specified WorkSpaces.
  ///
  /// You cannot reboot a WorkSpace unless its state is `AVAILABLE` or
  /// `UNHEALTHY`.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have
  /// rebooted.
  Future<void> rebootWorkspaces(
      List<RebootRequest> rebootWorkspaceRequests) async {}

  /// Rebuilds the specified WorkSpace.
  ///
  /// You cannot rebuild a WorkSpace unless its state is `AVAILABLE`, `ERROR`,
  /// or `UNHEALTHY`.
  ///
  /// Rebuilding a WorkSpace is a potentially destructive action that can result
  /// in the loss of data. For more information, see [Rebuild a
  /// WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/reset-workspace.html).
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have been
  /// completely rebuilt.
  Future<void> rebuildWorkspaces(
      List<RebuildRequest> rebuildWorkspaceRequests) async {}

  /// Removes one or more rules from the specified IP access control group.
  Future<void> revokeIpRules(
      {@required String groupId, @required List<String> userRules}) async {}

  /// Starts the specified WorkSpaces.
  ///
  /// You cannot start a WorkSpace unless it has a running mode of `AutoStop`
  /// and a state of `STOPPED`.
  Future<void> startWorkspaces(
      List<StartRequest> startWorkspaceRequests) async {}

  ///  Stops the specified WorkSpaces.
  ///
  /// You cannot stop a WorkSpace unless it has a running mode of `AutoStop` and
  /// a state of `AVAILABLE`, `IMPAIRED`, `UNHEALTHY`, or `ERROR`.
  Future<void> stopWorkspaces(List<StopRequest> stopWorkspaceRequests) async {}

  /// Terminates the specified WorkSpaces.
  ///
  /// Terminating a WorkSpace is a permanent action and cannot be undone. The
  /// user's data is destroyed. If you need to archive any user data, contact
  /// Amazon Web Services before terminating the WorkSpace.
  ///
  /// You can terminate a WorkSpace that is in any state except `SUSPENDED`.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have been
  /// completely terminated.
  Future<void> terminateWorkspaces(
      List<TerminateRequest> terminateWorkspaceRequests) async {}

  /// Replaces the current rules of the specified IP access control group with
  /// the specified rules.
  Future<void> updateRulesOfIpGroup(
      {@required String groupId, @required List<IpRuleItem> userRules}) async {}
}

class AccountModification {}

class AssociateIpGroupsResult {}

class AuthorizeIpRulesResult {}

class ClientProperties {}

class ClientPropertiesResult {}

class ComputeType {}

class CopyWorkspaceImageResult {}

class CreateIpGroupResult {}

class CreateTagsResult {}

class CreateWorkspacesResult {}

class DefaultWorkspaceCreationProperties {}

class DeleteIpGroupResult {}

class DeleteTagsResult {}

class DeleteWorkspaceImageResult {}

class DescribeAccountModificationsResult {}

class DescribeAccountResult {}

class DescribeClientPropertiesResult {}

class DescribeIpGroupsResult {}

class DescribeTagsResult {}

class DescribeWorkspaceBundlesResult {}

class DescribeWorkspaceDirectoriesResult {}

class DescribeWorkspaceImagesResult {}

class DescribeWorkspacesConnectionStatusResult {}

class DescribeWorkspacesResult {}

class DisassociateIpGroupsResult {}

class FailedCreateWorkspaceRequest {}

class FailedWorkspaceChangeRequest {}

class ImportWorkspaceImageResult {}

class IpRuleItem {}

class ListAvailableManagementCidrRangesResult {}

class ModificationState {}

class ModifyAccountResult {}

class ModifyClientPropertiesResult {}

class ModifyWorkspacePropertiesResult {}

class ModifyWorkspaceStateResult {}

class OperatingSystem {}

class RebootRequest {}

class RebootWorkspacesResult {}

class RebuildRequest {}

class RebuildWorkspacesResult {}

class RevokeIpRulesResult {}

class RootStorage {}

class StartRequest {}

class StartWorkspacesResult {}

class StopRequest {}

class StopWorkspacesResult {}

class Tag {}

class TerminateRequest {}

class TerminateWorkspacesResult {}

class UpdateRulesOfIpGroupResult {}

class UserStorage {}

class Workspace {}

class WorkspaceBundle {}

class WorkspaceConnectionStatus {}

class WorkspaceDirectory {}

class WorkspaceImage {}

class WorkspaceProperties {}

class WorkspaceRequest {}

class WorkspacesIpGroup {}
