import 'package:meta/meta.dart';

/// Amazon WorkSpaces Service
///
/// Amazon WorkSpaces enables you to provision virtual, cloud-based Microsoft
/// Windows and Amazon Linux desktops for your users.
class WorkSpacesApi {
  final _client;
  WorkSpacesApi(client)
      : _client = client.configured('WorkSpaces', serializer: 'json');

  /// Associates the specified IP access control group with the specified
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory.
  ///
  /// [groupIds]: The identifiers of one or more IP access control groups.
  Future<AssociateIpGroupsResult> associateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {
    var response_ = await _client.send('AssociateIpGroups', {
      'DirectoryId': directoryId,
      'GroupIds': groupIds,
    });
    return AssociateIpGroupsResult.fromJson(response_);
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
    var response_ = await _client.send('AuthorizeIpRules', {
      'GroupId': groupId,
      'UserRules': userRules,
    });
    return AuthorizeIpRulesResult.fromJson(response_);
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
    var response_ = await _client.send('CopyWorkspaceImage', {
      'Name': name,
      if (description != null) 'Description': description,
      'SourceImageId': sourceImageId,
      'SourceRegion': sourceRegion,
      if (tags != null) 'Tags': tags,
    });
    return CopyWorkspaceImageResult.fromJson(response_);
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
    var response_ = await _client.send('CreateIpGroup', {
      'GroupName': groupName,
      if (groupDesc != null) 'GroupDesc': groupDesc,
      if (userRules != null) 'UserRules': userRules,
      if (tags != null) 'Tags': tags,
    });
    return CreateIpGroupResult.fromJson(response_);
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
    var response_ = await _client.send('CreateTags', {
      'ResourceId': resourceId,
      'Tags': tags,
    });
    return CreateTagsResult.fromJson(response_);
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
    var response_ = await _client.send('CreateWorkspaces', {
      'Workspaces': workspaces,
    });
    return CreateWorkspacesResult.fromJson(response_);
  }

  /// Deletes the specified IP access control group.
  ///
  /// You cannot delete an IP access control group that is associated with a
  /// directory.
  ///
  /// [groupId]: The identifier of the IP access control group.
  Future<DeleteIpGroupResult> deleteIpGroup(String groupId) async {
    var response_ = await _client.send('DeleteIpGroup', {
      'GroupId': groupId,
    });
    return DeleteIpGroupResult.fromJson(response_);
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
    var response_ = await _client.send('DeleteTags', {
      'ResourceId': resourceId,
      'TagKeys': tagKeys,
    });
    return DeleteTagsResult.fromJson(response_);
  }

  /// Deletes the specified image from your account. To delete an image, you
  /// must first delete any bundles that are associated with the image and
  /// un-share the image if it is shared with other accounts.
  ///
  /// [imageId]: The identifier of the image.
  Future<DeleteWorkspaceImageResult> deleteWorkspaceImage(
      String imageId) async {
    var response_ = await _client.send('DeleteWorkspaceImage', {
      'ImageId': imageId,
    });
    return DeleteWorkspaceImageResult.fromJson(response_);
  }

  /// Retrieves a list that describes the configuration of bring your own
  /// license (BYOL) for the specified account.
  Future<DescribeAccountResult> describeAccount() async {
    var response_ = await _client.send('DescribeAccount', {});
    return DescribeAccountResult.fromJson(response_);
  }

  /// Retrieves a list that describes modifications to the configuration of
  /// bring your own license (BYOL) for the specified account.
  ///
  /// [nextToken]: If you received a `NextToken` from a previous call that was
  /// paginated, provide this token to receive the next set of results.
  Future<DescribeAccountModificationsResult> describeAccountModifications(
      {String nextToken}) async {
    var response_ = await _client.send('DescribeAccountModifications', {
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeAccountModificationsResult.fromJson(response_);
  }

  /// Retrieves a list that describes one or more specified Amazon WorkSpaces
  /// clients.
  ///
  /// [resourceIds]: The resource identifier, in the form of directory IDs.
  Future<DescribeClientPropertiesResult> describeClientProperties(
      List<String> resourceIds) async {
    var response_ = await _client.send('DescribeClientProperties', {
      'ResourceIds': resourceIds,
    });
    return DescribeClientPropertiesResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeIpGroups', {
      if (groupIds != null) 'GroupIds': groupIds,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeIpGroupsResult.fromJson(response_);
  }

  /// Describes the specified tags for the specified WorkSpaces resource.
  ///
  /// [resourceId]: The identifier of the WorkSpaces resource. The supported
  /// resource types are WorkSpaces, registered directories, images, custom
  /// bundles, and IP access control groups.
  Future<DescribeTagsResult> describeTags(String resourceId) async {
    var response_ = await _client.send('DescribeTags', {
      'ResourceId': resourceId,
    });
    return DescribeTagsResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeWorkspaceBundles', {
      if (bundleIds != null) 'BundleIds': bundleIds,
      if (owner != null) 'Owner': owner,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeWorkspaceBundlesResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeWorkspaceDirectories', {
      if (directoryIds != null) 'DirectoryIds': directoryIds,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeWorkspaceDirectoriesResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeWorkspaceImages', {
      if (imageIds != null) 'ImageIds': imageIds,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeWorkspaceImagesResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeWorkspaces', {
      if (workspaceIds != null) 'WorkspaceIds': workspaceIds,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (userName != null) 'UserName': userName,
      if (bundleId != null) 'BundleId': bundleId,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeWorkspacesResult.fromJson(response_);
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
    var response_ = await _client.send('DescribeWorkspacesConnectionStatus', {
      if (workspaceIds != null) 'WorkspaceIds': workspaceIds,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeWorkspacesConnectionStatusResult.fromJson(response_);
  }

  /// Disassociates the specified IP access control group from the specified
  /// directory.
  ///
  /// [directoryId]: The identifier of the directory.
  ///
  /// [groupIds]: The identifiers of one or more IP access control groups.
  Future<DisassociateIpGroupsResult> disassociateIpGroups(
      {@required String directoryId, @required List<String> groupIds}) async {
    var response_ = await _client.send('DisassociateIpGroups', {
      'DirectoryId': directoryId,
      'GroupIds': groupIds,
    });
    return DisassociateIpGroupsResult.fromJson(response_);
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
    var response_ = await _client.send('ImportWorkspaceImage', {
      'Ec2ImageId': ec2ImageId,
      'IngestionProcess': ingestionProcess,
      'ImageName': imageName,
      'ImageDescription': imageDescription,
      if (tags != null) 'Tags': tags,
    });
    return ImportWorkspaceImageResult.fromJson(response_);
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
    var response_ = await _client.send('ListAvailableManagementCidrRanges', {
      'ManagementCidrRangeConstraint': managementCidrRangeConstraint,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListAvailableManagementCidrRangesResult.fromJson(response_);
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
    var response_ = await _client.send('ModifyAccount', {
      if (dedicatedTenancySupport != null)
        'DedicatedTenancySupport': dedicatedTenancySupport,
      if (dedicatedTenancyManagementCidrRange != null)
        'DedicatedTenancyManagementCidrRange':
            dedicatedTenancyManagementCidrRange,
    });
    return ModifyAccountResult.fromJson(response_);
  }

  /// Modifies the properties of the specified Amazon WorkSpaces clients.
  ///
  /// [resourceId]: The resource identifiers, in the form of directory IDs.
  ///
  /// [clientProperties]: Information about the Amazon WorkSpaces client.
  Future<ModifyClientPropertiesResult> modifyClientProperties(
      {@required String resourceId,
      @required ClientProperties clientProperties}) async {
    var response_ = await _client.send('ModifyClientProperties', {
      'ResourceId': resourceId,
      'ClientProperties': clientProperties,
    });
    return ModifyClientPropertiesResult.fromJson(response_);
  }

  /// Modifies the specified WorkSpace properties.
  ///
  /// [workspaceId]: The identifier of the WorkSpace.
  ///
  /// [workspaceProperties]: The properties of the WorkSpace.
  Future<ModifyWorkspacePropertiesResult> modifyWorkspaceProperties(
      {@required String workspaceId,
      @required WorkspaceProperties workspaceProperties}) async {
    var response_ = await _client.send('ModifyWorkspaceProperties', {
      'WorkspaceId': workspaceId,
      'WorkspaceProperties': workspaceProperties,
    });
    return ModifyWorkspacePropertiesResult.fromJson(response_);
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
    var response_ = await _client.send('ModifyWorkspaceState', {
      'WorkspaceId': workspaceId,
      'WorkspaceState': workspaceState,
    });
    return ModifyWorkspaceStateResult.fromJson(response_);
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
    var response_ = await _client.send('RebootWorkspaces', {
      'RebootWorkspaceRequests': rebootWorkspaceRequests,
    });
    return RebootWorkspacesResult.fromJson(response_);
  }

  /// Rebuilds the specified WorkSpace.
  ///
  /// You cannot rebuild a WorkSpace unless its state is `AVAILABLE`, `ERROR`,
  /// or `UNHEALTHY`.
  ///
  /// Rebuilding a WorkSpace is a potentially destructive action that can result
  /// in the loss of data. For more information, see
  /// [Rebuild a WorkSpace](https://docs.aws.amazon.com/workspaces/latest/adminguide/reset-workspace.html).
  ///
  /// This operation is asynchronous and returns before the WorkSpaces have been
  /// completely rebuilt.
  ///
  /// [rebuildWorkspaceRequests]: The WorkSpace to rebuild. You can specify a
  /// single WorkSpace.
  Future<RebuildWorkspacesResult> rebuildWorkspaces(
      List<RebuildRequest> rebuildWorkspaceRequests) async {
    var response_ = await _client.send('RebuildWorkspaces', {
      'RebuildWorkspaceRequests': rebuildWorkspaceRequests,
    });
    return RebuildWorkspacesResult.fromJson(response_);
  }

  /// Removes one or more rules from the specified IP access control group.
  ///
  /// [groupId]: The identifier of the group.
  ///
  /// [userRules]: The rules to remove from the group.
  Future<RevokeIpRulesResult> revokeIpRules(
      {@required String groupId, @required List<String> userRules}) async {
    var response_ = await _client.send('RevokeIpRules', {
      'GroupId': groupId,
      'UserRules': userRules,
    });
    return RevokeIpRulesResult.fromJson(response_);
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
    var response_ = await _client.send('StartWorkspaces', {
      'StartWorkspaceRequests': startWorkspaceRequests,
    });
    return StartWorkspacesResult.fromJson(response_);
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
    var response_ = await _client.send('StopWorkspaces', {
      'StopWorkspaceRequests': stopWorkspaceRequests,
    });
    return StopWorkspacesResult.fromJson(response_);
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
    var response_ = await _client.send('TerminateWorkspaces', {
      'TerminateWorkspaceRequests': terminateWorkspaceRequests,
    });
    return TerminateWorkspacesResult.fromJson(response_);
  }

  /// Replaces the current rules of the specified IP access control group with
  /// the specified rules.
  ///
  /// [groupId]: The identifier of the group.
  ///
  /// [userRules]: One or more rules.
  Future<UpdateRulesOfIpGroupResult> updateRulesOfIpGroup(
      {@required String groupId, @required List<IpRuleItem> userRules}) async {
    var response_ = await _client.send('UpdateRulesOfIpGroup', {
      'GroupId': groupId,
      'UserRules': userRules,
    });
    return UpdateRulesOfIpGroupResult.fromJson(response_);
  }
}

/// Describes a modification to the configuration of bring your own license
/// (BYOL) for the specified account.
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
      AccountModification(
        modificationState: json.containsKey('ModificationState')
            ? json['ModificationState'] as String
            : null,
        dedicatedTenancySupport: json.containsKey('DedicatedTenancySupport')
            ? json['DedicatedTenancySupport'] as String
            : null,
        dedicatedTenancyManagementCidrRange:
            json.containsKey('DedicatedTenancyManagementCidrRange')
                ? json['DedicatedTenancyManagementCidrRange'] as String
                : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
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

/// Describes an Amazon WorkSpaces client.
class ClientProperties {
  /// Specifies whether users can cache their credentials on the Amazon
  /// WorkSpaces client. When enabled, users can choose to reconnect to their
  /// WorkSpaces without re-entering their credentials.
  final String reconnectEnabled;

  ClientProperties({
    this.reconnectEnabled,
  });
  static ClientProperties fromJson(Map<String, dynamic> json) =>
      ClientProperties(
        reconnectEnabled: json.containsKey('ReconnectEnabled')
            ? json['ReconnectEnabled'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the Amazon WorkSpaces client.
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
      ClientPropertiesResult(
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        clientProperties: json.containsKey('ClientProperties')
            ? ClientProperties.fromJson(json['ClientProperties'])
            : null,
      );
}

/// Describes the compute type.
class ComputeType {
  /// The compute type.
  final String name;

  ComputeType({
    this.name,
  });
  static ComputeType fromJson(Map<String, dynamic> json) => ComputeType(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class CopyWorkspaceImageResult {
  /// The identifier of the image.
  final String imageId;

  CopyWorkspaceImageResult({
    this.imageId,
  });
  static CopyWorkspaceImageResult fromJson(Map<String, dynamic> json) =>
      CopyWorkspaceImageResult(
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
      );
}

class CreateIpGroupResult {
  /// The identifier of the group.
  final String groupId;

  CreateIpGroupResult({
    this.groupId,
  });
  static CreateIpGroupResult fromJson(Map<String, dynamic> json) =>
      CreateIpGroupResult(
        groupId: json.containsKey('GroupId') ? json['GroupId'] as String : null,
      );
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
      CreateWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedCreateWorkspaceRequest.fromJson(e))
                .toList()
            : null,
        pendingRequests: json.containsKey('PendingRequests')
            ? (json['PendingRequests'] as List)
                .map((e) => Workspace.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes the default values used to create a WorkSpace.
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
      DefaultWorkspaceCreationProperties(
        enableWorkDocs: json.containsKey('EnableWorkDocs')
            ? json['EnableWorkDocs'] as bool
            : null,
        enableInternetAccess: json.containsKey('EnableInternetAccess')
            ? json['EnableInternetAccess'] as bool
            : null,
        defaultOu:
            json.containsKey('DefaultOu') ? json['DefaultOu'] as String : null,
        customSecurityGroupId: json.containsKey('CustomSecurityGroupId')
            ? json['CustomSecurityGroupId'] as String
            : null,
        userEnabledAsLocalAdministrator:
            json.containsKey('UserEnabledAsLocalAdministrator')
                ? json['UserEnabledAsLocalAdministrator'] as bool
                : null,
      );
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
      DescribeAccountModificationsResult(
        accountModifications: json.containsKey('AccountModifications')
            ? (json['AccountModifications'] as List)
                .map((e) => AccountModification.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      DescribeAccountResult(
        dedicatedTenancySupport: json.containsKey('DedicatedTenancySupport')
            ? json['DedicatedTenancySupport'] as String
            : null,
        dedicatedTenancyManagementCidrRange:
            json.containsKey('DedicatedTenancyManagementCidrRange')
                ? json['DedicatedTenancyManagementCidrRange'] as String
                : null,
      );
}

class DescribeClientPropertiesResult {
  /// Information about the specified Amazon WorkSpaces clients.
  final List<ClientPropertiesResult> clientPropertiesList;

  DescribeClientPropertiesResult({
    this.clientPropertiesList,
  });
  static DescribeClientPropertiesResult fromJson(Map<String, dynamic> json) =>
      DescribeClientPropertiesResult(
        clientPropertiesList: json.containsKey('ClientPropertiesList')
            ? (json['ClientPropertiesList'] as List)
                .map((e) => ClientPropertiesResult.fromJson(e))
                .toList()
            : null,
      );
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
      DescribeIpGroupsResult(
        result: json.containsKey('Result')
            ? (json['Result'] as List)
                .map((e) => WorkspacesIpGroup.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeTagsResult {
  /// The tags.
  final List<Tag> tagList;

  DescribeTagsResult({
    this.tagList,
  });
  static DescribeTagsResult fromJson(Map<String, dynamic> json) =>
      DescribeTagsResult(
        tagList: json.containsKey('TagList')
            ? (json['TagList'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
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
      DescribeWorkspaceBundlesResult(
        bundles: json.containsKey('Bundles')
            ? (json['Bundles'] as List)
                .map((e) => WorkspaceBundle.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      DescribeWorkspaceDirectoriesResult(
        directories: json.containsKey('Directories')
            ? (json['Directories'] as List)
                .map((e) => WorkspaceDirectory.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      DescribeWorkspaceImagesResult(
        images: json.containsKey('Images')
            ? (json['Images'] as List)
                .map((e) => WorkspaceImage.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      DescribeWorkspacesConnectionStatusResult(
        workspacesConnectionStatus:
            json.containsKey('WorkspacesConnectionStatus')
                ? (json['WorkspacesConnectionStatus'] as List)
                    .map((e) => WorkspaceConnectionStatus.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      DescribeWorkspacesResult(
        workspaces: json.containsKey('Workspaces')
            ? (json['Workspaces'] as List)
                .map((e) => Workspace.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DisassociateIpGroupsResult {
  DisassociateIpGroupsResult();
  static DisassociateIpGroupsResult fromJson(Map<String, dynamic> json) =>
      DisassociateIpGroupsResult();
}

/// Describes a WorkSpace that cannot be created.
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
      FailedCreateWorkspaceRequest(
        workspaceRequest: json.containsKey('WorkspaceRequest')
            ? WorkspaceRequest.fromJson(json['WorkspaceRequest'])
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// Describes a WorkSpace that could not be rebooted. (RebootWorkspaces),
/// rebuilt (RebuildWorkspaces), terminated (TerminateWorkspaces), started
/// (StartWorkspaces), or stopped (StopWorkspaces).
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
      FailedWorkspaceChangeRequest(
        workspaceId: json.containsKey('WorkspaceId')
            ? json['WorkspaceId'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

class ImportWorkspaceImageResult {
  /// The identifier of the WorkSpace image.
  final String imageId;

  ImportWorkspaceImageResult({
    this.imageId,
  });
  static ImportWorkspaceImageResult fromJson(Map<String, dynamic> json) =>
      ImportWorkspaceImageResult(
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
      );
}

/// Describes a rule for an IP access control group.
class IpRuleItem {
  /// The IP address range, in CIDR notation.
  final String ipRule;

  /// The description.
  final String ruleDesc;

  IpRuleItem({
    this.ipRule,
    this.ruleDesc,
  });
  static IpRuleItem fromJson(Map<String, dynamic> json) => IpRuleItem(
        ipRule: json.containsKey('ipRule') ? json['ipRule'] as String : null,
        ruleDesc:
            json.containsKey('ruleDesc') ? json['ruleDesc'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      ListAvailableManagementCidrRangesResult(
        managementCidrRanges: json.containsKey('ManagementCidrRanges')
            ? (json['ManagementCidrRanges'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes a WorkSpace modification.
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
      ModificationState(
        resource:
            json.containsKey('Resource') ? json['Resource'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
      );
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

/// The operating system that the image is running.
class OperatingSystem {
  /// The operating system.
  final String type;

  OperatingSystem({
    this.type,
  });
  static OperatingSystem fromJson(Map<String, dynamic> json) => OperatingSystem(
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
}

/// Describes the information used to reboot a WorkSpace.
class RebootRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebootRequest({
    @required this.workspaceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RebootWorkspacesResult {
  /// Information about the WorkSpaces that could not be rebooted.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebootWorkspacesResult({
    this.failedRequests,
  });
  static RebootWorkspacesResult fromJson(Map<String, dynamic> json) =>
      RebootWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedWorkspaceChangeRequest.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes the information used to rebuild a WorkSpace.
class RebuildRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  RebuildRequest({
    @required this.workspaceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RebuildWorkspacesResult {
  /// Information about the WorkSpace that could not be rebuilt.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  RebuildWorkspacesResult({
    this.failedRequests,
  });
  static RebuildWorkspacesResult fromJson(Map<String, dynamic> json) =>
      RebuildWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedWorkspaceChangeRequest.fromJson(e))
                .toList()
            : null,
      );
}

class RevokeIpRulesResult {
  RevokeIpRulesResult();
  static RevokeIpRulesResult fromJson(Map<String, dynamic> json) =>
      RevokeIpRulesResult();
}

/// Describes the root volume for a WorkSpace bundle.
class RootStorage {
  /// The size of the root volume.
  final String capacity;

  RootStorage({
    this.capacity,
  });
  static RootStorage fromJson(Map<String, dynamic> json) => RootStorage(
        capacity:
            json.containsKey('Capacity') ? json['Capacity'] as String : null,
      );
}

/// Information used to start a WorkSpace.
class StartRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  StartRequest({
    this.workspaceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartWorkspacesResult {
  /// Information about the WorkSpaces that could not be started.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StartWorkspacesResult({
    this.failedRequests,
  });
  static StartWorkspacesResult fromJson(Map<String, dynamic> json) =>
      StartWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedWorkspaceChangeRequest.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes the information used to stop a WorkSpace.
class StopRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  StopRequest({
    this.workspaceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StopWorkspacesResult {
  /// Information about the WorkSpaces that could not be stopped.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  StopWorkspacesResult({
    this.failedRequests,
  });
  static StopWorkspacesResult fromJson(Map<String, dynamic> json) =>
      StopWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedWorkspaceChangeRequest.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes a tag.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the information used to terminate a WorkSpace.
class TerminateRequest {
  /// The identifier of the WorkSpace.
  final String workspaceId;

  TerminateRequest({
    @required this.workspaceId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TerminateWorkspacesResult {
  /// Information about the WorkSpaces that could not be terminated.
  final List<FailedWorkspaceChangeRequest> failedRequests;

  TerminateWorkspacesResult({
    this.failedRequests,
  });
  static TerminateWorkspacesResult fromJson(Map<String, dynamic> json) =>
      TerminateWorkspacesResult(
        failedRequests: json.containsKey('FailedRequests')
            ? (json['FailedRequests'] as List)
                .map((e) => FailedWorkspaceChangeRequest.fromJson(e))
                .toList()
            : null,
      );
}

class UpdateRulesOfIpGroupResult {
  UpdateRulesOfIpGroupResult();
  static UpdateRulesOfIpGroupResult fromJson(Map<String, dynamic> json) =>
      UpdateRulesOfIpGroupResult();
}

/// Describes the user storage for a WorkSpace bundle.
class UserStorage {
  /// The size of the user storage.
  final String capacity;

  UserStorage({
    this.capacity,
  });
  static UserStorage fromJson(Map<String, dynamic> json) => UserStorage(
        capacity:
            json.containsKey('Capacity') ? json['Capacity'] as String : null,
      );
}

/// Describes a WorkSpace.
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
  static Workspace fromJson(Map<String, dynamic> json) => Workspace(
        workspaceId: json.containsKey('WorkspaceId')
            ? json['WorkspaceId'] as String
            : null,
        directoryId: json.containsKey('DirectoryId')
            ? json['DirectoryId'] as String
            : null,
        userName:
            json.containsKey('UserName') ? json['UserName'] as String : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        bundleId:
            json.containsKey('BundleId') ? json['BundleId'] as String : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        computerName: json.containsKey('ComputerName')
            ? json['ComputerName'] as String
            : null,
        volumeEncryptionKey: json.containsKey('VolumeEncryptionKey')
            ? json['VolumeEncryptionKey'] as String
            : null,
        userVolumeEncryptionEnabled:
            json.containsKey('UserVolumeEncryptionEnabled')
                ? json['UserVolumeEncryptionEnabled'] as bool
                : null,
        rootVolumeEncryptionEnabled:
            json.containsKey('RootVolumeEncryptionEnabled')
                ? json['RootVolumeEncryptionEnabled'] as bool
                : null,
        workspaceProperties: json.containsKey('WorkspaceProperties')
            ? WorkspaceProperties.fromJson(json['WorkspaceProperties'])
            : null,
        modificationStates: json.containsKey('ModificationStates')
            ? (json['ModificationStates'] as List)
                .map((e) => ModificationState.fromJson(e))
                .toList()
            : null,
      );
}

/// Describes a WorkSpace bundle.
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

  /// The compute type. For more information, see
  /// [Amazon WorkSpaces Bundles](http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles).
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
  static WorkspaceBundle fromJson(Map<String, dynamic> json) => WorkspaceBundle(
        bundleId:
            json.containsKey('BundleId') ? json['BundleId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        owner: json.containsKey('Owner') ? json['Owner'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        rootStorage: json.containsKey('RootStorage')
            ? RootStorage.fromJson(json['RootStorage'])
            : null,
        userStorage: json.containsKey('UserStorage')
            ? UserStorage.fromJson(json['UserStorage'])
            : null,
        computeType: json.containsKey('ComputeType')
            ? ComputeType.fromJson(json['ComputeType'])
            : null,
      );
}

/// Describes the connection status of a WorkSpace.
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
      WorkspaceConnectionStatus(
        workspaceId: json.containsKey('WorkspaceId')
            ? json['WorkspaceId'] as String
            : null,
        connectionState: json.containsKey('ConnectionState')
            ? json['ConnectionState'] as String
            : null,
        connectionStateCheckTimestamp:
            json.containsKey('ConnectionStateCheckTimestamp')
                ? DateTime.parse(json['ConnectionStateCheckTimestamp'])
                : null,
        lastKnownUserConnectionTimestamp:
            json.containsKey('LastKnownUserConnectionTimestamp')
                ? DateTime.parse(json['LastKnownUserConnectionTimestamp'])
                : null,
      );
}

/// Describes an AWS Directory Service directory that is used with Amazon
/// WorkSpaces.
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
      WorkspaceDirectory(
        directoryId: json.containsKey('DirectoryId')
            ? json['DirectoryId'] as String
            : null,
        alias: json.containsKey('Alias') ? json['Alias'] as String : null,
        directoryName: json.containsKey('DirectoryName')
            ? json['DirectoryName'] as String
            : null,
        registrationCode: json.containsKey('RegistrationCode')
            ? json['RegistrationCode'] as String
            : null,
        subnetIds: json.containsKey('SubnetIds')
            ? (json['SubnetIds'] as List).map((e) => e as String).toList()
            : null,
        dnsIpAddresses: json.containsKey('DnsIpAddresses')
            ? (json['DnsIpAddresses'] as List).map((e) => e as String).toList()
            : null,
        customerUserName: json.containsKey('CustomerUserName')
            ? json['CustomerUserName'] as String
            : null,
        iamRoleId:
            json.containsKey('IamRoleId') ? json['IamRoleId'] as String : null,
        directoryType: json.containsKey('DirectoryType')
            ? json['DirectoryType'] as String
            : null,
        workspaceSecurityGroupId: json.containsKey('WorkspaceSecurityGroupId')
            ? json['WorkspaceSecurityGroupId'] as String
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        workspaceCreationProperties:
            json.containsKey('WorkspaceCreationProperties')
                ? DefaultWorkspaceCreationProperties.fromJson(
                    json['WorkspaceCreationProperties'])
                : null,
        ipGroupIds: json.containsKey('ipGroupIds')
            ? (json['ipGroupIds'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Describes a WorkSpace image.
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
  static WorkspaceImage fromJson(Map<String, dynamic> json) => WorkspaceImage(
        imageId: json.containsKey('ImageId') ? json['ImageId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? OperatingSystem.fromJson(json['OperatingSystem'])
            : null,
        state: json.containsKey('State') ? json['State'] as String : null,
        requiredTenancy: json.containsKey('RequiredTenancy')
            ? json['RequiredTenancy'] as String
            : null,
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

/// Describes a WorkSpace.
class WorkspaceProperties {
  /// The running mode. For more information, see
  /// [Manage the WorkSpace Running Mode](https://docs.aws.amazon.com/workspaces/latest/adminguide/running-mode.html).
  final String runningMode;

  /// The time after a user logs off when WorkSpaces are automatically stopped.
  /// Configured in 60 minute intervals.
  final int runningModeAutoStopTimeoutInMinutes;

  /// The size of the root volume.
  final int rootVolumeSizeGib;

  /// The size of the user storage.
  final int userVolumeSizeGib;

  /// The compute type. For more information, see
  /// [Amazon WorkSpaces Bundles](http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles).
  final String computeTypeName;

  WorkspaceProperties({
    this.runningMode,
    this.runningModeAutoStopTimeoutInMinutes,
    this.rootVolumeSizeGib,
    this.userVolumeSizeGib,
    this.computeTypeName,
  });
  static WorkspaceProperties fromJson(Map<String, dynamic> json) =>
      WorkspaceProperties(
        runningMode: json.containsKey('RunningMode')
            ? json['RunningMode'] as String
            : null,
        runningModeAutoStopTimeoutInMinutes:
            json.containsKey('RunningModeAutoStopTimeoutInMinutes')
                ? json['RunningModeAutoStopTimeoutInMinutes'] as int
                : null,
        rootVolumeSizeGib: json.containsKey('RootVolumeSizeGib')
            ? json['RootVolumeSizeGib'] as int
            : null,
        userVolumeSizeGib: json.containsKey('UserVolumeSizeGib')
            ? json['UserVolumeSizeGib'] as int
            : null,
        computeTypeName: json.containsKey('ComputeTypeName')
            ? json['ComputeTypeName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the information used to create a WorkSpace.
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
      WorkspaceRequest(
        directoryId: json['DirectoryId'] as String,
        userName: json['UserName'] as String,
        bundleId: json['BundleId'] as String,
        volumeEncryptionKey: json.containsKey('VolumeEncryptionKey')
            ? json['VolumeEncryptionKey'] as String
            : null,
        userVolumeEncryptionEnabled:
            json.containsKey('UserVolumeEncryptionEnabled')
                ? json['UserVolumeEncryptionEnabled'] as bool
                : null,
        rootVolumeEncryptionEnabled:
            json.containsKey('RootVolumeEncryptionEnabled')
                ? json['RootVolumeEncryptionEnabled'] as bool
                : null,
        workspaceProperties: json.containsKey('WorkspaceProperties')
            ? WorkspaceProperties.fromJson(json['WorkspaceProperties'])
            : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes an IP access control group.
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
      WorkspacesIpGroup(
        groupId: json.containsKey('groupId') ? json['groupId'] as String : null,
        groupName:
            json.containsKey('groupName') ? json['groupName'] as String : null,
        groupDesc:
            json.containsKey('groupDesc') ? json['groupDesc'] as String : null,
        userRules: json.containsKey('userRules')
            ? (json['userRules'] as List)
                .map((e) => IpRuleItem.fromJson(e))
                .toList()
            : null,
      );
}
