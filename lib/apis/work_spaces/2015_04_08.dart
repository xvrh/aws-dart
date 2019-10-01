import 'package:meta/meta.dart';

/// Amazon WorkSpaces Service
///
/// Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft
/// Windows and Amazon Linux desktops for your users.
class WorkSpacesApi {
  /// Associates the specified IP access control group with the specified
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory.
  ///
  /// [groupIds]: The identifiers of one or more IP access control groups.
  Future<AssociateIpGroupsResult> associateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {
    return AssociateIpGroupsResult.fromJson({});
  }

  /// Adds one or more rules to the specified IP access control group.
  ///
  /// This action gives users permission to access their WorkSpaces from the
  /// CIDR address ranges specified in the rules.
  ///
  /// [groupId]: The identifier of the group.
  ///
  /// [userRules]: The rules to add to the group.
  Future<AuthorizeIpRulesResult> authorizeIpRules(
      {@required String groupId, @required List<IpRuleItem> userRules}) async {
    return AuthorizeIpRulesResult.fromJson({});
  }

  /// Copies the specified image from the specified Region to the current
  /// Region.
  ///
  /// [name]: The name of the image.
  ///
  /// [description]: A description of the image.
  ///
  /// [sourceImageId]: The identifier of the source image.
  ///
  /// [sourceRegion]: The identifier of the source Region.
  ///
  /// [tags]: The tags for the image.
  Future<CopyWorkspaceImageResult> copyWorkspaceImage(
      {@required String name,
      String description,
      @required String sourceImageId,
      @required String sourceRegion,
      List<Tag> tags}) async {
    return CopyWorkspaceImageResult.fromJson({});
  }

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
  ///
  /// [groupName]: The name of the group.
  ///
  /// [groupDesc]: The description of the group.
  ///
  /// [userRules]: The rules to add to the group.
  ///
  /// [tags]: The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<CreateIpGroupResult> createIpGroup(String groupName,
      {String groupDesc, List<IpRuleItem> userRules, List<Tag> tags}) async {
    return CreateIpGroupResult.fromJson({});
  }

  /// Creates the specified tags for the specified WorkSpaces resource.
  ///
  /// [resourceId]: The identifier of the WorkSpaces resource. The supported
  /// resource types are WorkSpaces, registered directories, images, custom
  /// bundles, and IP access control groups.
  ///
  /// [tags]: The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<CreateTagsResult> createTags(
      {@required String resourceId, @required List<Tag> tags}) async {
    return CreateTagsResult.fromJson({});
  }

  /// Creates one or more WorkSpaces.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces are
  /// created.
  ///
  /// [workspaces]: The WorkSpaces to create. You can specify up to 25
  /// WorkSpaces.
  Future<CreateWorkspacesResult> createWorkspaces(
      List<WorkspaceRequest> workspaces) async {
    return CreateWorkspacesResult.fromJson({});
  }

  /// Deletes the specified IP access control group.
  ///
  /// You cannot delete an IP access control group that is associated with a
  /// directory.
  ///
  /// [groupId]: The identifier of the IP access control group.
  Future<DeleteIpGroupResult> deleteIpGroup(String groupId) async {
    return DeleteIpGroupResult.fromJson({});
  }

  /// Deletes the specified tags from the specified WorkSpaces resource.
  ///
  /// [resourceId]: The identifier of the WorkSpaces resource. The supported
  /// resource types are WorkSpaces, registered directories, images, custom
  /// bundles, and IP access control groups.
  ///
  /// [tagKeys]: The tag keys.
  Future<DeleteTagsResult> deleteTags(
      {@required String resourceId, @required List<String> tagKeys}) async {
    return DeleteTagsResult.fromJson({});
  }

  /// Deletes the specified image from your account. To delete an image, you
  /// must first delete any bundles that are associated with the image and
  /// un-share the image if it is shared with other accounts.
  ///
  /// [imageId]: The identifier of the image.
  Future<DeleteWorkspaceImageResult> deleteWorkspaceImage(
      String imageId) async {
    return DeleteWorkspaceImageResult.fromJson({});
  }

  /// Retrieves a list that describes the configuration of bring your own
  /// license (BYOL) for the specified account.
  Future<DescribeAccountResult> describeAccount() async {
    return DescribeAccountResult.fromJson({});
  }

  /// Retrieves a list that describes modifications to the configuration of
  /// bring your own license (BYOL) for the specified account.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeAccountModificationsResult> describeAccountModifications(
      {String nextToken}) async {
    return DescribeAccountModificationsResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified Amazon WorkSpaces
  /// clients.
  ///
  /// [resourceIds]: The resource identifier, in the form of directory IDs.
  Future<DescribeClientPropertiesResult> describeClientProperties(
      List<String> resourceIds) async {
    return DescribeClientPropertiesResult.fromJson({});
  }

  /// Describes one or more of your IP access control groups.
  ///
  /// [groupIds]: The identifiers of one or more IP access control groups.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// [maxResults]: The maximum number of items to return.
  Future<DescribeIpGroupsResult> describeIpGroups(
      {List<String> groupIds, String nextToken, int maxResults}) async {
    return DescribeIpGroupsResult.fromJson({});
  }

  /// Describes the specified tags for the specified WorkSpaces resource.
  ///
  /// [resourceId]: The identifier of the WorkSpaces resource. The supported
  /// resource types are WorkSpaces, registered directories, images, custom
  /// bundles, and IP access control groups.
  Future<DescribeTagsResult> describeTags(String resourceId) async {
    return DescribeTagsResult.fromJson({});
  }

  /// Retrieves a list that describes the available WorkSpace bundles.
  ///
  /// You can filter the results using either bundle ID or owner, but not both.
  ///
  /// [bundleIds]: The identifiers of the bundles. You cannot combine this
  /// parameter with any other filter.
  ///
  /// [owner]: The owner of the bundles. You cannot combine this parameter with
  /// any other filter.
  ///
  /// Specify `AMAZON` to describe the bundles provided by AWS or null to
  /// describe the bundles that belong to your account.
  ///
  /// [nextToken]: The token for the next set of results. (You received this
  /// token from a previous call.)
  Future<DescribeWorkspaceBundlesResult> describeWorkspaceBundles(
      {List<String> bundleIds, String owner, String nextToken}) async {
    return DescribeWorkspaceBundlesResult.fromJson({});
  }

  /// Describes the available AWS Directory Service directories that are
  /// registered with Amazon WorkSpaces.
  ///
  /// [directoryIds]: The identifiers of the directories. If the value is null,
  /// all directories are retrieved.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspaceDirectoriesResult> describeWorkspaceDirectories(
      {List<String> directoryIds, String nextToken}) async {
    return DescribeWorkspaceDirectoriesResult.fromJson({});
  }

  /// Retrieves a list that describes one or more specified images, if the image
  /// identifiers are provided. Otherwise, all images in the account are
  /// described.
  ///
  /// [imageIds]: The identifier of the image.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  ///
  /// [maxResults]: The maximum number of items to return.
  Future<DescribeWorkspaceImagesResult> describeWorkspaceImages(
      {List<String> imageIds, String nextToken, int maxResults}) async {
    return DescribeWorkspaceImagesResult.fromJson({});
  }

  /// Describes the specified WorkSpaces.
  ///
  /// You can filter the results by using the bundle identifier, directory
  /// identifier, or owner, but you can specify only one filter at a time.
  ///
  /// [workspaceIds]: The identifiers of the WorkSpaces. You cannot combine this
  /// parameter with any other filter.
  ///
  /// Because the CreateWorkspaces operation is asynchronous, the identifier it
  /// returns is not immediately available. If you immediately call
  /// DescribeWorkspaces with this identifier, no information is returned.
  ///
  /// [directoryId]: The identifier of the directory. In addition, you can
  /// optionally specify a specific directory user (see `UserName`). You cannot
  /// combine this parameter with any other filter.
  ///
  /// [userName]: The name of the directory user. You must specify this
  /// parameter with `DirectoryId`.
  ///
  /// [bundleId]: The identifier of the bundle. All WorkSpaces that are created
  /// from this bundle are retrieved. You cannot combine this parameter with any
  /// other filter.
  ///
  /// [limit]: The maximum number of items to return.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspacesResult> describeWorkspaces(
      {List<String> workspaceIds,
      String directoryId,
      String userName,
      String bundleId,
      int limit,
      String nextToken}) async {
    return DescribeWorkspacesResult.fromJson({});
  }

  /// Describes the connection status of the specified WorkSpaces.
  ///
  /// [workspaceIds]: The identifiers of the WorkSpaces. You can specify up to
  /// 25 WorkSpaces.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeWorkspacesConnectionStatusResult>
      describeWorkspacesConnectionStatus(
          {List<String> workspaceIds, String nextToken}) async {
    return DescribeWorkspacesConnectionStatusResult.fromJson({});
  }

  /// Disassociates the specified IP access control group from the specified
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory.
  ///
  /// [groupIds]: The identifiers of one or more IP access control groups.
  Future<DisassociateIpGroupsResult> disassociateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {
    return DisassociateIpGroupsResult.fromJson({});
  }

  /// Imports the specified Windows 7 or Windows 10 bring your own license
  /// (BYOL) image into Amazon WorkSpaces. The image must be an already licensed
  /// EC2 image that is in your AWS account, and you must own the image.
  ///
  /// [ec2ImageId]: The identifier of the EC2 image.
  ///
  /// [ingestionProcess]: The ingestion process to be used when importing the
  /// image.
  ///
  /// [imageName]: The name of the WorkSpace image.
  ///
  /// [imageDescription]: The description of the WorkSpace image.
  ///
  /// [tags]: The tags. Each WorkSpaces resource can have a maximum of 50 tags.
  Future<ImportWorkspaceImageResult> importWorkspaceImage(
      {@required String ec2ImageId,
      @required String ingestionProcess,
      @required String imageName,
      @required String imageDescription,
      List<Tag> tags}) async {
    return ImportWorkspaceImageResult.fromJson({});
  }

  /// Retrieves a list of IP address ranges, specified as IPv4 CIDR blocks, that
  /// you can use for the network management interface when you enable bring
  /// your own license (BYOL).
  ///
  /// The management network interface is connected to a secure Amazon
  /// WorkSpaces management network. It is used for interactive streaming of the
  /// WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon
  /// WorkSpaces to manage the WorkSpace.
  ///
  /// [managementCidrRangeConstraint]: The IP address range to search. Specify
  /// an IP address range that is compatible with your network and in CIDR
  /// notation (that is, specify the range as an IPv4 CIDR block).
  ///
  /// [maxResults]: The maximum number of items to return.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<ListAvailableManagementCidrRangesResult>
      listAvailableManagementCidrRanges(String managementCidrRangeConstraint,
          {int maxResults, String nextToken}) async {
    return ListAvailableManagementCidrRangesResult.fromJson({});
  }

  /// Modifies the configuration of bring your own license (BYOL) for the
  /// specified account.
  ///
  /// [dedicatedTenancySupport]: The status of BYOL.
  ///
  /// [dedicatedTenancyManagementCidrRange]: The IP address range, specified as
  /// an IPv4 CIDR block, for the management network interface. Specify an IP
  /// address range that is compatible with your network and in CIDR notation
  /// (that is, specify the range as an IPv4 CIDR block). The CIDR block size
  /// must be /16 (for example, 203.0.113.25/16). It must also be specified as
  /// available by the `ListAvailableManagementCidrRanges` operation.
  Future<ModifyAccountResult> modifyAccount(
      {String dedicatedTenancySupport,
      String dedicatedTenancyManagementCidrRange}) async {
    return ModifyAccountResult.fromJson({});
  }

  /// Modifies the properties of the specified Amazon WorkSpaces clients.
  ///
  /// [resourceId]: The resource identifiers, in the form of directory IDs.
  ///
  /// [clientProperties]: Information about the Amazon WorkSpaces client.
  Future<ModifyClientPropertiesResult> modifyClientProperties(
      {@required String resourceId,
      @required ClientProperties clientProperties}) async {
    return ModifyClientPropertiesResult.fromJson({});
  }

  /// Modifies the specified WorkSpace properties.
  ///
  /// [workspaceId]: The identifier of the WorkSpace.
  ///
  /// [workspaceProperties]: The properties of the WorkSpace.
  Future<ModifyWorkspacePropertiesResult> modifyWorkspaceProperties(
      {@required String workspaceId,
      @required WorkspaceProperties workspaceProperties}) async {
    return ModifyWorkspacePropertiesResult.fromJson({});
  }

  /// Sets the state of the specified WorkSpace.
  ///
  /// To maintain a WorkSpace without being interrupted, set the WorkSpace state
  /// to `ADMIN_MAINTENANCE`. WorkSpaces in this state do not respond to
  /// requests to reboot, stop, start, rebuild, or restore. An AutoStop
  /// WorkSpace in this state is not stopped. Users cannot log into a WorkSpace
  /// in the `ADMIN_MAINTENANCE` state.
  ///
  /// [workspaceId]: The identifier of the WorkSpace.
  ///
  /// [workspaceState]: The WorkSpace state.
  Future<ModifyWorkspaceStateResult> modifyWorkspaceState(
      {@required String workspaceId, @required String workspaceState}) async {
    return ModifyWorkspaceStateResult.fromJson({});
  }

  /// Reboots the specified WorkSpaces.
  ///
  /// You cannot reboot a WorkSpace unless its state is `AVAILABLE` or
  /// `UNHEALTHY`.
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have
  /// rebooted.
  ///
  /// [rebootWorkspaceRequests]: The WorkSpaces to reboot. You can specify up to
  /// 25 WorkSpaces.
  Future<RebootWorkspacesResult> rebootWorkspaces(
      List<RebootRequest> rebootWorkspaceRequests) async {
    return RebootWorkspacesResult.fromJson({});
  }

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
  ///
  /// [rebuildWorkspaceRequests]: The WorkSpace to rebuild. You can specify a
  /// single WorkSpace.
  Future<RebuildWorkspacesResult> rebuildWorkspaces(
      List<RebuildRequest> rebuildWorkspaceRequests) async {
    return RebuildWorkspacesResult.fromJson({});
  }

  /// Removes one or more rules from the specified IP access control group.
  ///
  /// [groupId]: The identifier of the group.
  ///
  /// [userRules]: The rules to remove from the group.
  Future<RevokeIpRulesResult> revokeIpRules(
      {@required String groupId, @required List<String> userRules}) async {
    return RevokeIpRulesResult.fromJson({});
  }

  /// Starts the specified WorkSpaces.
  ///
  /// You cannot start a WorkSpace unless it has a running mode of `AutoStop`
  /// and a state of `STOPPED`.
  ///
  /// [startWorkspaceRequests]: The WorkSpaces to start. You can specify up to
  /// 25 WorkSpaces.
  Future<StartWorkspacesResult> startWorkspaces(
      List<StartRequest> startWorkspaceRequests) async {
    return StartWorkspacesResult.fromJson({});
  }

  ///  Stops the specified WorkSpaces.
  ///
  /// You cannot stop a WorkSpace unless it has a running mode of `AutoStop` and
  /// a state of `AVAILABLE`, `IMPAIRED`, `UNHEALTHY`, or `ERROR`.
  ///
  /// [stopWorkspaceRequests]: The WorkSpaces to stop. You can specify up to 25
  /// WorkSpaces.
  Future<StopWorkspacesResult> stopWorkspaces(
      List<StopRequest> stopWorkspaceRequests) async {
    return StopWorkspacesResult.fromJson({});
  }

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
  ///
  /// [terminateWorkspaceRequests]: The WorkSpaces to terminate. You can specify
  /// up to 25 WorkSpaces.
  Future<TerminateWorkspacesResult> terminateWorkspaces(
      List<TerminateRequest> terminateWorkspaceRequests) async {
    return TerminateWorkspacesResult.fromJson({});
  }

  /// Replaces the current rules of the specified IP access control group with
  /// the specified rules.
  ///
  /// [groupId]: The identifier of the group.
  ///
  /// [userRules]: One or more rules.
  Future<UpdateRulesOfIpGroupResult> updateRulesOfIpGroup(
      {@required String groupId, @required List<IpRuleItem> userRules}) async {
    return UpdateRulesOfIpGroupResult.fromJson({});
  }
}

class AccountModification {
  /// The state of the modification to the configuration of BYOL.
  final String modificationState;

  /// The status of BYOL (whether BYOL is being enabled or disabled).
  final String dedicatedTenancySupport;

  /// The IP address range, specified as an IPv4 CIDR block, for the management
  /// network interface used for the account.
  final String dedicatedTenancyManagementCidrRange;

  /// The timestamp when the modification of the BYOL configuration was started.
  final DateTime startTime;

  /// The error code that is returned if the configuration of BYOL cannot be
  /// modified.
  final String errorCode;

  /// The text of the error message that is returned if the configuration of
  /// BYOL cannot be modified.
  final String errorMessage;

  AccountModification({
    this.modificationState,
    this.dedicatedTenancySupport,
    this.dedicatedTenancyManagementCidrRange,
    this.startTime,
    this.errorCode,
    this.errorMessage,
  });
  static AccountModification fromJson(Map<String, dynamic> json) =>
      AccountModification();
}

class AssociateIpGroupsResult {
  AssociateIpGroupsResult();
  static AssociateIpGroupsResult fromJson(Map<String, dynamic> json) =>
      AssociateIpGroupsResult();
}

class AuthorizeIpRulesResult {
  AuthorizeIpRulesResult();
  static AuthorizeIpRulesResult fromJson(Map<String, dynamic> json) =>
      AuthorizeIpRulesResult();
}

class ClientProperties {
  /// Specifies whether users can cache their credentials on the Amazon
  /// WorkSpaces client. When enabled, users can choose to reconnect to their
  /// WorkSpaces without re-entering their credentials.
  final String reconnectEnabled;

  ClientProperties({
    this.reconnectEnabled,
  });
  static ClientProperties fromJson(Map<String, dynamic> json) =>
      ClientProperties();
}

class ClientPropertiesResult {
  /// The resource identifier, in the form of a directory ID.
  final String resourceId;

  /// Information about the Amazon WorkSpaces client.
  final ClientProperties clientProperties;

  ClientPropertiesResult({
    this.resourceId,
    this.clientProperties,
  });
  static ClientPropertiesResult fromJson(Map<String, dynamic> json) =>
      ClientPropertiesResult();
}

class ComputeType {
  /// The compute type.
  final String name;

  ComputeType({
    this.name,
  });
  static ComputeType fromJson(Map<String, dynamic> json) => ComputeType();
}

class CopyWorkspaceImageResult {
  /// The identifier of the image.
  final String imageId;

  CopyWorkspaceImageResult({
    this.imageId,
  });
  static CopyWorkspaceImageResult fromJson(Map<String, dynamic> json) =>
      CopyWorkspaceImageResult();
}

class CreateIpGroupResult {
  /// The identifier of the group.
  final String groupId;

  CreateIpGroupResult({
    this.groupId,
  });
  static CreateIpGroupResult fromJson(Map<String, dynamic> json) =>
      CreateIpGroupResult();
}

class CreateTagsResult {
  CreateTagsResult();
  static CreateTagsResult fromJson(Map<String, dynamic> json) =>
      CreateTagsResult();
}

class CreateWorkspacesResult {
  /// Information about the WorkSpaces that could not be created.
  final List<FailedCreateWorkspaceRequest> failedRequests;

  /// Information about the WorkSpaces that were created.
  ///
  /// Because this operation is asynchronous, the identifier returned is not
  /// immediately available for use with other operations. For example, if you
  /// call DescribeWorkspaces before the WorkSpace is created, the information
  /// returned can be incomplete.
  final List<Workspace> pendingRequests;

  CreateWorkspacesResult({
    this.failedRequests,
    this.pendingRequests,
  });
  static CreateWorkspacesResult fromJson(Map<String, dynamic> json) =>
      CreateWorkspacesResult();
}

class DefaultWorkspaceCreationProperties {
  /// Specifies whether the directory is enabled for Amazon WorkDocs.
  final bool enableWorkDocs;

  /// The public IP address to attach to all WorkSpaces that are created or
  /// rebuilt.
  final bool enableInternetAccess;

  /// The organizational unit (OU) in the directory for the WorkSpace machine
  /// accounts.
  final String defaultOu;

  /// The identifier of any security groups to apply to WorkSpaces when they are
  /// created.
  final String customSecurityGroupId;

  /// Specifies whether the WorkSpace user is an administrator on the WorkSpace.
  final bool userEnabledAsLocalAdministrator;

  DefaultWorkspaceCreationProperties({
    this.enableWorkDocs,
    this.enableInternetAccess,
    this.defaultOu,
    this.customSecurityGroupId,
    this.userEnabledAsLocalAdministrator,
  });
  static DefaultWorkspaceCreationProperties fromJson(
          Map<String, dynamic> json) =>
      DefaultWorkspaceCreationProperties();
}

class DeleteIpGroupResult {
  DeleteIpGroupResult();
  static DeleteIpGroupResult fromJson(Map<String, dynamic> json) =>
      DeleteIpGroupResult();
}

class DeleteTagsResult {
  DeleteTagsResult();
  static DeleteTagsResult fromJson(Map<String, dynamic> json) =>
      DeleteTagsResult();
}

class DeleteWorkspaceImageResult {
  DeleteWorkspaceImageResult();
  static DeleteWorkspaceImageResult fromJson(Map<String, dynamic> json) =>
      DeleteWorkspaceImageResult();
}

class DescribeAccountModificationsResult {
  /// The list of modifications to the configuration of BYOL.
  final List<AccountModification> accountModifications;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeAccountModificationsResult({
    this.accountModifications,
    this.nextToken,
  });
  static DescribeAccountModificationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeAccountModificationsResult();
}

class DescribeAccountResult {
  /// The status of BYOL (whether BYOL is enabled or disabled).
  final String dedicatedTenancySupport;

  /// The IP address range, specified as an IPv4 CIDR block, used for the
  /// management network interface.
  ///
  /// The management network interface is connected to a secure Amazon
  /// WorkSpaces management network. It is used for interactive streaming of the
  /// WorkSpace desktop to Amazon WorkSpaces clients, and to allow Amazon
  /// WorkSpaces to manage the WorkSpace.
  final String dedicatedTenancyManagementCidrRange;

  DescribeAccountResult({
    this.dedicatedTenancySupport,
    this.dedicatedTenancyManagementCidrRange,
  });
  static DescribeAccountResult fromJson(Map<String, dynamic> json) =>
      DescribeAccountResult();
}

class DescribeClientPropertiesResult {
  /// Information about the specified Amazon WorkSpaces clients.
  final List<ClientPropertiesResult> clientPropertiesList;

  DescribeClientPropertiesResult({
    this.clientPropertiesList,
  });
  static DescribeClientPropertiesResult fromJson(Map<String, dynamic> json) =>
      DescribeClientPropertiesResult();
}

class DescribeIpGroupsResult {
  /// Information about the IP access control groups.
  final List<WorkspacesIpGroup> result;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeIpGroupsResult({
    this.result,
    this.nextToken,
  });
  static DescribeIpGroupsResult fromJson(Map<String, dynamic> json) =>
      DescribeIpGroupsResult();
}

class DescribeTagsResult {
  /// The tags.
  final List<Tag> tagList;

  DescribeTagsResult({
    this.tagList,
  });
  static DescribeTagsResult fromJson(Map<String, dynamic> json) =>
      DescribeTagsResult();
}

class DescribeWorkspaceBundlesResult {
  /// Information about the bundles.
  final List<WorkspaceBundle> bundles;

  /// The token to use to retrieve the next set of results, or null if there are
  /// no more results available. This token is valid for one day and must be
  /// used within that time frame.
  final String nextToken;

  DescribeWorkspaceBundlesResult({
    this.bundles,
    this.nextToken,
  });
  static DescribeWorkspaceBundlesResult fromJson(Map<String, dynamic> json) =>
      DescribeWorkspaceBundlesResult();
}

class DescribeWorkspaceDirectoriesResult {
  /// Information about the directories.
  final List<WorkspaceDirectory> directories;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeWorkspaceDirectoriesResult({
    this.directories,
    this.nextToken,
  });
  static DescribeWorkspaceDirectoriesResult fromJson(
          Map<String, dynamic> json) =>
      DescribeWorkspaceDirectoriesResult();
}

class DescribeWorkspaceImagesResult {
  /// Information about the images.
  final List<WorkspaceImage> images;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeWorkspaceImagesResult({
    this.images,
    this.nextToken,
  });
  static DescribeWorkspaceImagesResult fromJson(Map<String, dynamic> json) =>
      DescribeWorkspaceImagesResult();
}

class DescribeWorkspacesConnectionStatusResult {
  /// Information about the connection status of the WorkSpace.
  final List<WorkspaceConnectionStatus> workspacesConnectionStatus;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeWorkspacesConnectionStatusResult({
    this.workspacesConnectionStatus,
    this.nextToken,
  });
  static DescribeWorkspacesConnectionStatusResult fromJson(
          Map<String, dynamic> json) =>
      DescribeWorkspacesConnectionStatusResult();
}

class DescribeWorkspacesResult {
  /// Information about the WorkSpaces.
  ///
  /// Because CreateWorkspaces is an asynchronous operation, some of the
  /// returned information could be incomplete.
  final List<Workspace> workspaces;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  DescribeWorkspacesResult({
    this.workspaces,
    this.nextToken,
  });
  static DescribeWorkspacesResult fromJson(Map<String, dynamic> json) =>
      DescribeWorkspacesResult();
}

class DisassociateIpGroupsResult {
  DisassociateIpGroupsResult();
  static DisassociateIpGroupsResult fromJson(Map<String, dynamic> json) =>
      DisassociateIpGroupsResult();
}

class FailedCreateWorkspaceRequest {
  /// Information about the WorkSpace.
  final WorkspaceRequest workspaceRequest;

  /// The error code that is returned if the WorkSpace cannot be created.
  final String errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  final String errorMessage;

  FailedCreateWorkspaceRequest({
    this.workspaceRequest,
    this.errorCode,
    this.errorMessage,
  });
  static FailedCreateWorkspaceRequest fromJson(Map<String, dynamic> json) =>
      FailedCreateWorkspaceRequest();
}

class FailedWorkspaceChangeRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  /// The error code that is returned if the WorkSpace cannot be rebooted.
  final String errorCode;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// rebooted.
  final String errorMessage;

  FailedWorkspaceChangeRequest({
    this.workspaceId,
    this.errorCode,
    this.errorMessage,
  });
  static FailedWorkspaceChangeRequest fromJson(Map<String, dynamic> json) =>
      FailedWorkspaceChangeRequest();
}

class ImportWorkspaceImageResult {
  /// The identifier of the WorkSpace image.
  final String imageId;

  ImportWorkspaceImageResult({
    this.imageId,
  });
  static ImportWorkspaceImageResult fromJson(Map<String, dynamic> json) =>
      ImportWorkspaceImageResult();
}

class IpRuleItem {
  /// The IP address range, in CIDR notation.
  final String ipRule;

  /// The description.
  final String ruleDesc;

  IpRuleItem({
    this.ipRule,
    this.ruleDesc,
  });
  static IpRuleItem fromJson(Map<String, dynamic> json) => IpRuleItem();
}

class ListAvailableManagementCidrRangesResult {
  /// The list of available IP address ranges, specified as IPv4 CIDR blocks.
  final List<String> managementCidrRanges;

  /// The token to use to retrieve the next set of results, or null if no more
  /// results are available.
  final String nextToken;

  ListAvailableManagementCidrRangesResult({
    this.managementCidrRanges,
    this.nextToken,
  });
  static ListAvailableManagementCidrRangesResult fromJson(
          Map<String, dynamic> json) =>
      ListAvailableManagementCidrRangesResult();
}

class ModificationState {
  /// The resource.
  final String resource;

  /// The modification state.
  final String state;

  ModificationState({
    this.resource,
    this.state,
  });
  static ModificationState fromJson(Map<String, dynamic> json) =>
      ModificationState();
}

class ModifyAccountResult {
  ModifyAccountResult();
  static ModifyAccountResult fromJson(Map<String, dynamic> json) =>
      ModifyAccountResult();
}

class ModifyClientPropertiesResult {
  ModifyClientPropertiesResult();
  static ModifyClientPropertiesResult fromJson(Map<String, dynamic> json) =>
      ModifyClientPropertiesResult();
}

class ModifyWorkspacePropertiesResult {
  ModifyWorkspacePropertiesResult();
  static ModifyWorkspacePropertiesResult fromJson(Map<String, dynamic> json) =>
      ModifyWorkspacePropertiesResult();
}

class ModifyWorkspaceStateResult {
  ModifyWorkspaceStateResult();
  static ModifyWorkspaceStateResult fromJson(Map<String, dynamic> json) =>
      ModifyWorkspaceStateResult();
}

class OperatingSystem {
  /// The operating system.
  final String type;

  OperatingSystem({
    this.type,
  });
  static OperatingSystem fromJson(Map<String, dynamic> json) =>
      OperatingSystem();
}

class RebootRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebootRequest({
    @required this.workspaceId,
  });
}

class RebootWorkspacesResult {
  /// Information about the WorkSpaces that could not be rebooted.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebootWorkspacesResult({
    this.failedRequests,
  });
  static RebootWorkspacesResult fromJson(Map<String, dynamic> json) =>
      RebootWorkspacesResult();
}

class RebuildRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebuildRequest({
    @required this.workspaceId,
  });
}

class RebuildWorkspacesResult {
  /// Information about the WorkSpace that could not be rebuilt.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebuildWorkspacesResult({
    this.failedRequests,
  });
  static RebuildWorkspacesResult fromJson(Map<String, dynamic> json) =>
      RebuildWorkspacesResult();
}

class RevokeIpRulesResult {
  RevokeIpRulesResult();
  static RevokeIpRulesResult fromJson(Map<String, dynamic> json) =>
      RevokeIpRulesResult();
}

class RootStorage {
  /// The size of the root volume.
  final String capacity;

  RootStorage({
    this.capacity,
  });
  static RootStorage fromJson(Map<String, dynamic> json) => RootStorage();
}

class StartRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  StartRequest({
    this.workspaceId,
  });
}

class StartWorkspacesResult {
  /// Information about the WorkSpaces that could not be started.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StartWorkspacesResult({
    this.failedRequests,
  });
  static StartWorkspacesResult fromJson(Map<String, dynamic> json) =>
      StartWorkspacesResult();
}

class StopRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  StopRequest({
    this.workspaceId,
  });
}

class StopWorkspacesResult {
  /// Information about the WorkSpaces that could not be stopped.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StopWorkspacesResult({
    this.failedRequests,
  });
  static StopWorkspacesResult fromJson(Map<String, dynamic> json) =>
      StopWorkspacesResult();
}

class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TerminateRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  TerminateRequest({
    @required this.workspaceId,
  });
}

class TerminateWorkspacesResult {
  /// Information about the WorkSpaces that could not be terminated.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  TerminateWorkspacesResult({
    this.failedRequests,
  });
  static TerminateWorkspacesResult fromJson(Map<String, dynamic> json) =>
      TerminateWorkspacesResult();
}

class UpdateRulesOfIpGroupResult {
  UpdateRulesOfIpGroupResult();
  static UpdateRulesOfIpGroupResult fromJson(Map<String, dynamic> json) =>
      UpdateRulesOfIpGroupResult();
}

class UserStorage {
  /// The size of the user storage.
  final String capacity;

  UserStorage({
    this.capacity,
  });
  static UserStorage fromJson(Map<String, dynamic> json) => UserStorage();
}

class Workspace {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  /// The identifier of the AWS Directory Service directory for the WorkSpace.
  final String directoryId;

  /// The user for the WorkSpace.
  final String userName;

  /// The IP address of the WorkSpace.
  final String ipAddress;

  /// The operational state of the WorkSpace.
  final String state;

  /// The identifier of the bundle used to create the WorkSpace.
  final String bundleId;

  /// The identifier of the subnet for the WorkSpace.
  final String subnetId;

  /// The text of the error message that is returned if the WorkSpace cannot be
  /// created.
  final String errorMessage;

  /// The error code that is returned if the WorkSpace cannot be created.
  final String errorCode;

  /// The name of the WorkSpace, as seen by the operating system.
  final String computerName;

  /// The KMS key used to encrypt data stored on your WorkSpace.
  final String volumeEncryptionKey;

  /// Indicates whether the data stored on the user volume is encrypted.
  final bool userVolumeEncryptionEnabled;

  /// Indicates whether the data stored on the root volume is encrypted.
  final bool rootVolumeEncryptionEnabled;

  /// The properties of the WorkSpace.
  final WorkspaceProperties workspaceProperties;

  /// The modification states of the WorkSpace.
  final List<ModificationState> modificationStates;

  Workspace({
    this.workspaceId,
    this.directoryId,
    this.userName,
    this.ipAddress,
    this.state,
    this.bundleId,
    this.subnetId,
    this.errorMessage,
    this.errorCode,
    this.computerName,
    this.volumeEncryptionKey,
    this.userVolumeEncryptionEnabled,
    this.rootVolumeEncryptionEnabled,
    this.workspaceProperties,
    this.modificationStates,
  });
  static Workspace fromJson(Map<String, dynamic> json) => Workspace();
}

class WorkspaceBundle {
  /// The bundle identifier.
  final String bundleId;

  /// The name of the bundle.
  final String name;

  /// The owner of the bundle. This is the account identifier of the owner, or
  /// `AMAZON` if the bundle is provided by AWS.
  final String owner;

  /// A description.
  final String description;

  /// The size of the root volume.
  final RootStorage rootStorage;

  /// The size of the user storage.
  final UserStorage userStorage;

  /// The compute type. For more information, see [Amazon WorkSpaces
  /// Bundles](http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles).
  final ComputeType computeType;

  WorkspaceBundle({
    this.bundleId,
    this.name,
    this.owner,
    this.description,
    this.rootStorage,
    this.userStorage,
    this.computeType,
  });
  static WorkspaceBundle fromJson(Map<String, dynamic> json) =>
      WorkspaceBundle();
}

class WorkspaceConnectionStatus {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  /// The connection state of the WorkSpace. The connection state is unknown if
  /// the WorkSpace is stopped.
  final String connectionState;

  /// The timestamp of the connection status check.
  final DateTime connectionStateCheckTimestamp;

  /// The timestamp of the last known user connection.
  final DateTime lastKnownUserConnectionTimestamp;

  WorkspaceConnectionStatus({
    this.workspaceId,
    this.connectionState,
    this.connectionStateCheckTimestamp,
    this.lastKnownUserConnectionTimestamp,
  });
  static WorkspaceConnectionStatus fromJson(Map<String, dynamic> json) =>
      WorkspaceConnectionStatus();
}

class WorkspaceDirectory {
  /// The directory identifier.
  final String directoryId;

  /// The directory alias.
  final String alias;

  /// The name of the directory.
  final String directoryName;

  /// The registration code for the directory. This is the code that users enter
  /// in their Amazon WorkSpaces client application to connect to the directory.
  final String registrationCode;

  /// The identifiers of the subnets used with the directory.
  final List<String> subnetIds;

  /// The IP addresses of the DNS servers for the directory.
  final List<String> dnsIpAddresses;

  /// The user name for the service account.
  final String customerUserName;

  /// The identifier of the IAM role. This is the role that allows Amazon
  /// WorkSpaces to make calls to other services, such as Amazon EC2, on your
  /// behalf.
  final String iamRoleId;

  /// The directory type.
  final String directoryType;

  /// The identifier of the security group that is assigned to new WorkSpaces.
  final String workspaceSecurityGroupId;

  /// The state of the directory's registration with Amazon WorkSpaces
  final String state;

  /// The default creation properties for all WorkSpaces in the directory.
  final DefaultWorkspaceCreationProperties workspaceCreationProperties;

  /// The identifiers of the IP access control groups associated with the
  /// directory.
  final List<String> ipGroupIds;

  WorkspaceDirectory({
    this.directoryId,
    this.alias,
    this.directoryName,
    this.registrationCode,
    this.subnetIds,
    this.dnsIpAddresses,
    this.customerUserName,
    this.iamRoleId,
    this.directoryType,
    this.workspaceSecurityGroupId,
    this.state,
    this.workspaceCreationProperties,
    this.ipGroupIds,
  });
  static WorkspaceDirectory fromJson(Map<String, dynamic> json) =>
      WorkspaceDirectory();
}

class WorkspaceImage {
  /// The identifier of the image.
  final String imageId;

  /// The name of the image.
  final String name;

  /// The description of the image.
  final String description;

  /// The operating system that the image is running.
  final OperatingSystem operatingSystem;

  /// The status of the image.
  final String state;

  /// Specifies whether the image is running on dedicated hardware. When bring
  /// your own license (BYOL) is enabled, this value is set to DEDICATED.
  final String requiredTenancy;

  /// The error code that is returned for the image.
  final String errorCode;

  /// The text of the error message that is returned for the image.
  final String errorMessage;

  WorkspaceImage({
    this.imageId,
    this.name,
    this.description,
    this.operatingSystem,
    this.state,
    this.requiredTenancy,
    this.errorCode,
    this.errorMessage,
  });
  static WorkspaceImage fromJson(Map<String, dynamic> json) => WorkspaceImage();
}

class WorkspaceProperties {
  /// The running mode. For more information, see [Manage the WorkSpace Running
  /// Mode](https://docs.aws.amazon.com/workspaces/latest/adminguide/running-mode.html).
  final String runningMode;

  /// The time after a user logs off when WorkSpaces are automatically stopped.
  /// Configured in 60 minute intervals.
  final int runningModeAutoStopTimeoutInMinutes;

  /// The size of the root volume.
  final int rootVolumeSizeGib;

  /// The size of the user storage.
  final int userVolumeSizeGib;

  /// The compute type. For more information, see [Amazon WorkSpaces
  /// Bundles](http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles).
  final String computeTypeName;

  WorkspaceProperties({
    this.runningMode,
    this.runningModeAutoStopTimeoutInMinutes,
    this.rootVolumeSizeGib,
    this.userVolumeSizeGib,
    this.computeTypeName,
  });
  static WorkspaceProperties fromJson(Map<String, dynamic> json) =>
      WorkspaceProperties();
}

class WorkspaceRequest {
  /// The identifier of the AWS Directory Service directory for the WorkSpace.
  /// You can use DescribeWorkspaceDirectories to list the available
  /// directories.
  final String directoryId;

  /// The username of the user for the WorkSpace. This username must exist in
  /// the AWS Directory Service directory for the WorkSpace.
  final String userName;

  /// The identifier of the bundle for the WorkSpace. You can use
  /// DescribeWorkspaceBundles to list the available bundles.
  final String bundleId;

  /// The KMS key used to encrypt data stored on your WorkSpace.
  final String volumeEncryptionKey;

  /// Indicates whether the data stored on the user volume is encrypted.
  final bool userVolumeEncryptionEnabled;

  /// Indicates whether the data stored on the root volume is encrypted.
  final bool rootVolumeEncryptionEnabled;

  /// The WorkSpace properties.
  final WorkspaceProperties workspaceProperties;

  /// The tags for the WorkSpace.
  final List<Tag> tags;

  WorkspaceRequest({
    @required this.directoryId,
    @required this.userName,
    @required this.bundleId,
    this.volumeEncryptionKey,
    this.userVolumeEncryptionEnabled,
    this.rootVolumeEncryptionEnabled,
    this.workspaceProperties,
    this.tags,
  });
  static WorkspaceRequest fromJson(Map<String, dynamic> json) =>
      WorkspaceRequest();
}

class WorkspacesIpGroup {
  /// The identifier of the group.
  final String groupId;

  /// The name of the group.
  final String groupName;

  /// The description of the group.
  final String groupDesc;

  /// The rules.
  final List<IpRuleItem> userRules;

  WorkspacesIpGroup({
    this.groupId,
    this.groupName,
    this.groupDesc,
    this.userRules,
  });
  static WorkspacesIpGroup fromJson(Map<String, dynamic> json) =>
      WorkspacesIpGroup();
}
