import 'package:meta/meta.dart';

/// AWS CodeStar
///
/// This is the API reference for AWS CodeStar. This reference provides
/// descriptions of the operations and data types for the AWS CodeStar API along
/// with usage examples.
///
/// You can use the AWS CodeStar API to work with:
///
/// Projects and their resources, by calling the following:
///
/// *    `DeleteProject`, which deletes a project.
///
/// *    `DescribeProject`, which lists the attributes of a project.
///
/// *    `ListProjects`, which lists all projects associated with your AWS
/// account.
///
/// *    `ListResources`, which lists the resources associated with a project.
///
/// *    `ListTagsForProject`, which lists the tags associated with a project.
///
/// *    `TagProject`, which adds tags to a project.
///
/// *    `UntagProject`, which removes tags from a project.
///
/// *    `UpdateProject`, which updates the attributes of a project.
///
///
/// Teams and team members, by calling the following:
///
/// *    `AssociateTeamMember`, which adds an IAM user to the team for a
/// project.
///
/// *    `DisassociateTeamMember`, which removes an IAM user from the team for a
/// project.
///
/// *    `ListTeamMembers`, which lists all the IAM users in the team for a
/// project, including their roles and attributes.
///
/// *    `UpdateTeamMember`, which updates a team member's attributes in a
/// project.
///
///
/// Users, by calling the following:
///
/// *    `CreateUserProfile`, which creates a user profile that contains data
/// associated with the user across all projects.
///
/// *    `DeleteUserProfile`, which deletes all user profile information across
/// all projects.
///
/// *    `DescribeUserProfile`, which describes the profile of a user.
///
/// *    `ListUserProfiles`, which lists all user profiles.
///
/// *    `UpdateUserProfile`, which updates the profile for a user.
class CodeStarApi {
  final _client;
  CodeStarApi(client)
      : _client = client.configured('CodeStar', serializer: 'json');

  /// Adds an IAM user to the team for an AWS CodeStar project.
  ///
  /// [projectId]: The ID of the project to which you will add the IAM user.
  ///
  /// [clientRequestToken]: A user- or system-generated token that identifies
  /// the entity that requested the team member association to the project. This
  /// token can be used to repeat the request.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) for the IAM user you want to add
  /// to the AWS CodeStar project.
  ///
  /// [projectRole]: The AWS CodeStar project role that will apply to this user.
  /// This role determines what actions a user can take in an AWS CodeStar
  /// project.
  ///
  /// [remoteAccessAllowed]: Whether the team member is allowed to use an SSH
  /// public/private key pair to remotely access project resources, for example
  /// Amazon EC2 instances.
  Future<AssociateTeamMemberResult> associateTeamMember(
      {@required String projectId,
      String clientRequestToken,
      @required String userArn,
      @required String projectRole,
      bool remoteAccessAllowed}) async {
    var response_ = await _client.send('AssociateTeamMember', {
      'projectId': projectId,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      'userArn': userArn,
      'projectRole': projectRole,
      if (remoteAccessAllowed != null)
        'remoteAccessAllowed': remoteAccessAllowed,
    });
    return AssociateTeamMemberResult.fromJson(response_);
  }

  /// Creates a project, including project resources. This action creates a
  /// project based on a submitted project request. A set of source code files
  /// and a toolchain template file can be included with the project request. If
  /// these are not provided, an empty project is created.
  ///
  /// [name]: The display name for the project to be created in AWS CodeStar.
  ///
  /// [id]: The ID of the project to be created in AWS CodeStar.
  ///
  /// [description]: The description of the project, if any.
  ///
  /// [clientRequestToken]: A user- or system-generated token that identifies
  /// the entity that requested project creation. This token can be used to
  /// repeat the request.
  ///
  /// [sourceCode]: A list of the Code objects submitted with the project
  /// request. If this parameter is specified, the request must also include the
  /// toolchain parameter.
  ///
  /// [toolchain]: The name of the toolchain template file submitted with the
  /// project request. If this parameter is specified, the request must also
  /// include the sourceCode parameter.
  ///
  /// [tags]: The tags created for the project.
  Future<CreateProjectResult> createProject(
      {@required String name,
      @required String id,
      String description,
      String clientRequestToken,
      List<Code> sourceCode,
      Toolchain toolchain,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateProject', {
      'name': name,
      'id': id,
      if (description != null) 'description': description,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (sourceCode != null) 'sourceCode': sourceCode,
      if (toolchain != null) 'toolchain': toolchain,
      if (tags != null) 'tags': tags,
    });
    return CreateProjectResult.fromJson(response_);
  }

  /// Creates a profile for a user that includes user preferences, such as the
  /// display name and email address assocciated with the user, in AWS CodeStar.
  /// The user profile is not project-specific. Information in the user profile
  /// is displayed wherever the user's information appears to other users in AWS
  /// CodeStar.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the user in IAM.
  ///
  /// [displayName]: The name that will be displayed as the friendly name for
  /// the user in AWS CodeStar.
  ///
  /// [emailAddress]: The email address that will be displayed as part of the
  /// user's profile in AWS CodeStar.
  ///
  /// [sshPublicKey]: The SSH public key associated with the user in AWS
  /// CodeStar. If a project owner allows the user remote access to project
  /// resources, this public key will be used along with the user's private key
  /// for SSH access.
  Future<CreateUserProfileResult> createUserProfile(
      {@required String userArn,
      @required String displayName,
      @required String emailAddress,
      String sshPublicKey}) async {
    var response_ = await _client.send('CreateUserProfile', {
      'userArn': userArn,
      'displayName': displayName,
      'emailAddress': emailAddress,
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
    });
    return CreateUserProfileResult.fromJson(response_);
  }

  /// Deletes a project, including project resources. Does not delete users
  /// associated with the project, but does delete the IAM roles that allowed
  /// access to the project.
  ///
  /// [id]: The ID of the project to be deleted in AWS CodeStar.
  ///
  /// [clientRequestToken]: A user- or system-generated token that identifies
  /// the entity that requested project deletion. This token can be used to
  /// repeat the request.
  ///
  /// [deleteStack]: Whether to send a delete request for the primary stack in
  /// AWS CloudFormation originally used to generate the project and its
  /// resources. This option will delete all AWS resources for the project
  /// (except for any buckets in Amazon S3) as well as deleting the project
  /// itself. Recommended for most use cases.
  Future<DeleteProjectResult> deleteProject(String id,
      {String clientRequestToken, bool deleteStack}) async {
    var response_ = await _client.send('DeleteProject', {
      'id': id,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (deleteStack != null) 'deleteStack': deleteStack,
    });
    return DeleteProjectResult.fromJson(response_);
  }

  /// Deletes a user profile in AWS CodeStar, including all personal preference
  /// data associated with that profile, such as display name and email address.
  /// It does not delete the history of that user, for example the history of
  /// commits made by that user.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the user to delete from AWS
  /// CodeStar.
  Future<DeleteUserProfileResult> deleteUserProfile(String userArn) async {
    var response_ = await _client.send('DeleteUserProfile', {
      'userArn': userArn,
    });
    return DeleteUserProfileResult.fromJson(response_);
  }

  /// Describes a project and its resources.
  ///
  /// [id]: The ID of the project.
  Future<DescribeProjectResult> describeProject(String id) async {
    var response_ = await _client.send('DescribeProject', {
      'id': id,
    });
    return DescribeProjectResult.fromJson(response_);
  }

  /// Describes a user in AWS CodeStar and the user attributes across all
  /// projects.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the user.
  Future<DescribeUserProfileResult> describeUserProfile(String userArn) async {
    var response_ = await _client.send('DescribeUserProfile', {
      'userArn': userArn,
    });
    return DescribeUserProfileResult.fromJson(response_);
  }

  /// Removes a user from a project. Removing a user from a project also removes
  /// the IAM policies from that user that allowed access to the project and its
  /// resources. Disassociating a team member does not remove that user's
  /// profile from AWS CodeStar. It does not remove the user from IAM.
  ///
  /// [projectId]: The ID of the AWS CodeStar project from which you want to
  /// remove a team member.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the IAM user or group whom
  /// you want to remove from the project.
  Future<DisassociateTeamMemberResult> disassociateTeamMember(
      {@required String projectId, @required String userArn}) async {
    var response_ = await _client.send('DisassociateTeamMember', {
      'projectId': projectId,
      'userArn': userArn,
    });
    return DisassociateTeamMemberResult.fromJson(response_);
  }

  /// Lists all projects in AWS CodeStar associated with your AWS account.
  ///
  /// [nextToken]: The continuation token to be used to return the next set of
  /// results, if the results cannot be returned in one response.
  ///
  /// [maxResults]: The maximum amount of data that can be contained in a single
  /// set of results.
  Future<ListProjectsResult> listProjects(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListProjects', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListProjectsResult.fromJson(response_);
  }

  /// Lists resources associated with a project in AWS CodeStar.
  ///
  /// [projectId]: The ID of the project.
  ///
  /// [nextToken]: The continuation token for the next set of results, if the
  /// results cannot be returned in one response.
  ///
  /// [maxResults]: The maximum amount of data that can be contained in a single
  /// set of results.
  Future<ListResourcesResult> listResources(String projectId,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListResources', {
      'projectId': projectId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListResourcesResult.fromJson(response_);
  }

  /// Gets the tags for a project.
  ///
  /// [id]: The ID of the project to get tags for.
  ///
  /// [nextToken]: Reserved for future use.
  ///
  /// [maxResults]: Reserved for future use.
  Future<ListTagsForProjectResult> listTagsForProject(String id,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTagsForProject', {
      'id': id,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListTagsForProjectResult.fromJson(response_);
  }

  /// Lists all team members associated with a project.
  ///
  /// [projectId]: The ID of the project for which you want to list team
  /// members.
  ///
  /// [nextToken]: The continuation token for the next set of results, if the
  /// results cannot be returned in one response.
  ///
  /// [maxResults]: The maximum number of team members you want returned in a
  /// response.
  Future<ListTeamMembersResult> listTeamMembers(String projectId,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTeamMembers', {
      'projectId': projectId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListTeamMembersResult.fromJson(response_);
  }

  /// Lists all the user profiles configured for your AWS account in AWS
  /// CodeStar.
  ///
  /// [nextToken]: The continuation token for the next set of results, if the
  /// results cannot be returned in one response.
  ///
  /// [maxResults]: The maximum number of results to return in a response.
  Future<ListUserProfilesResult> listUserProfiles(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListUserProfiles', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListUserProfilesResult.fromJson(response_);
  }

  /// Adds tags to a project.
  ///
  /// [id]: The ID of the project you want to add a tag to.
  ///
  /// [tags]: The tags you want to add to the project.
  Future<TagProjectResult> tagProject(
      {@required String id, @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagProject', {
      'id': id,
      'tags': tags,
    });
    return TagProjectResult.fromJson(response_);
  }

  /// Removes tags from a project.
  ///
  /// [id]: The ID of the project to remove tags from.
  ///
  /// [tags]: The tags to remove from the project.
  Future<UntagProjectResult> untagProject(
      {@required String id, @required List<String> tags}) async {
    var response_ = await _client.send('UntagProject', {
      'id': id,
      'tags': tags,
    });
    return UntagProjectResult.fromJson(response_);
  }

  /// Updates a project in AWS CodeStar.
  ///
  /// [id]: The ID of the project you want to update.
  ///
  /// [name]: The name of the project you want to update.
  ///
  /// [description]: The description of the project, if any.
  Future<UpdateProjectResult> updateProject(String id,
      {String name, String description}) async {
    var response_ = await _client.send('UpdateProject', {
      'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
    return UpdateProjectResult.fromJson(response_);
  }

  /// Updates a team member's attributes in an AWS CodeStar project. For
  /// example, you can change a team member's role in the project, or change
  /// whether they have remote access to project resources.
  ///
  /// [projectId]: The ID of the project.
  ///
  /// [userArn]: The Amazon Resource Name (ARN) of the user for whom you want to
  /// change team membership attributes.
  ///
  /// [projectRole]: The role assigned to the user in the project. Project roles
  /// have different levels of access. For more information, see
  /// [Working with Teams](http://docs.aws.amazon.com/codestar/latest/userguide/working-with-teams.html)
  /// in the _AWS CodeStar User Guide_.
  ///
  /// [remoteAccessAllowed]: Whether a team member is allowed to remotely access
  /// project resources using the SSH public key associated with the user's
  /// profile. Even if this is set to True, the user must associate a public key
  /// with their profile before the user can access resources.
  Future<UpdateTeamMemberResult> updateTeamMember(
      {@required String projectId,
      @required String userArn,
      String projectRole,
      bool remoteAccessAllowed}) async {
    var response_ = await _client.send('UpdateTeamMember', {
      'projectId': projectId,
      'userArn': userArn,
      if (projectRole != null) 'projectRole': projectRole,
      if (remoteAccessAllowed != null)
        'remoteAccessAllowed': remoteAccessAllowed,
    });
    return UpdateTeamMemberResult.fromJson(response_);
  }

  /// Updates a user's profile in AWS CodeStar. The user profile is not
  /// project-specific. Information in the user profile is displayed wherever
  /// the user's information appears to other users in AWS CodeStar.
  ///
  /// [userArn]: The name that will be displayed as the friendly name for the
  /// user in AWS CodeStar.
  ///
  /// [displayName]: The name that is displayed as the friendly name for the
  /// user in AWS CodeStar.
  ///
  /// [emailAddress]: The email address that is displayed as part of the user's
  /// profile in AWS CodeStar.
  ///
  /// [sshPublicKey]: The SSH public key associated with the user in AWS
  /// CodeStar. If a project owner allows the user remote access to project
  /// resources, this public key will be used along with the user's private key
  /// for SSH access.
  Future<UpdateUserProfileResult> updateUserProfile(String userArn,
      {String displayName, String emailAddress, String sshPublicKey}) async {
    var response_ = await _client.send('UpdateUserProfile', {
      'userArn': userArn,
      if (displayName != null) 'displayName': displayName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (sshPublicKey != null) 'sshPublicKey': sshPublicKey,
    });
    return UpdateUserProfileResult.fromJson(response_);
  }
}

class AssociateTeamMemberResult {
  /// The user- or system-generated token from the initial request that can be
  /// used to repeat the request.
  final String clientRequestToken;

  AssociateTeamMemberResult({
    this.clientRequestToken,
  });
  static AssociateTeamMemberResult fromJson(Map<String, dynamic> json) =>
      AssociateTeamMemberResult(
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
      );
}

/// Location and destination information about the source code files provided
/// with the project request. The source code is uploaded to the new project
/// source repository after project creation.
class Code {
  /// The location where the source code files provided with the project request
  /// are stored. AWS CodeStar retrieves the files during project creation.
  final CodeSource source;

  /// The repository to be created in AWS CodeStar. Valid values are AWS
  /// CodeCommit or GitHub. After AWS CodeStar provisions the new repository,
  /// the source code files provided with the project request are placed in the
  /// repository.
  final CodeDestination destination;

  Code({
    @required this.source,
    @required this.destination,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about the AWS CodeCommit repository to be created in AWS
/// CodeStar. This is where the source code files provided with the project
/// request will be uploaded after project creation.
class CodeCommitCodeDestination {
  /// The name of the AWS CodeCommit repository to be created in AWS CodeStar.
  final String name;

  CodeCommitCodeDestination({
    @required this.name,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The repository to be created in AWS CodeStar. Valid values are AWS
/// CodeCommit or GitHub. After AWS CodeStar provisions the new repository, the
/// source code files provided with the project request are placed in the
/// repository.
class CodeDestination {
  /// Information about the AWS CodeCommit repository to be created in AWS
  /// CodeStar. This is where the source code files provided with the project
  /// request will be uploaded after project creation.
  final CodeCommitCodeDestination codeCommit;

  /// Information about the GitHub repository to be created in AWS CodeStar.
  /// This is where the source code files provided with the project request will
  /// be uploaded after project creation.
  final GitHubCodeDestination gitHub;

  CodeDestination({
    this.codeCommit,
    this.gitHub,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The location where the source code files provided with the project request
/// are stored. AWS CodeStar retrieves the files during project creation.
class CodeSource {
  /// Information about the Amazon S3 location where the source code files
  /// provided with the project request are stored.
  final S3Location s3;

  CodeSource({
    @required this.s3,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateProjectResult {
  /// The ID of the project.
  final String id;

  /// The Amazon Resource Name (ARN) of the created project.
  final String arn;

  /// A user- or system-generated token that identifies the entity that
  /// requested project creation.
  final String clientRequestToken;

  /// Reserved for future use.
  final String projectTemplateId;

  CreateProjectResult({
    @required this.id,
    @required this.arn,
    this.clientRequestToken,
    this.projectTemplateId,
  });
  static CreateProjectResult fromJson(Map<String, dynamic> json) =>
      CreateProjectResult(
        id: json['id'] as String,
        arn: json['arn'] as String,
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
        projectTemplateId: json.containsKey('projectTemplateId')
            ? json['projectTemplateId'] as String
            : null,
      );
}

class CreateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  final String displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  final String emailAddress;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to
  /// those resources.
  final String sshPublicKey;

  /// The date the user profile was created, in timestamp format.
  final DateTime createdTimestamp;

  /// The date the user profile was last modified, in timestamp format.
  final DateTime lastModifiedTimestamp;

  CreateUserProfileResult({
    @required this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
  });
  static CreateUserProfileResult fromJson(Map<String, dynamic> json) =>
      CreateUserProfileResult(
        userArn: json['userArn'] as String,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        emailAddress: json.containsKey('emailAddress')
            ? json['emailAddress'] as String
            : null,
        sshPublicKey: json.containsKey('sshPublicKey')
            ? json['sshPublicKey'] as String
            : null,
        createdTimestamp: json.containsKey('createdTimestamp')
            ? DateTime.parse(json['createdTimestamp'])
            : null,
        lastModifiedTimestamp: json.containsKey('lastModifiedTimestamp')
            ? DateTime.parse(json['lastModifiedTimestamp'])
            : null,
      );
}

class DeleteProjectResult {
  /// The ID of the primary stack in AWS CloudFormation that will be deleted as
  /// part of deleting the project and its resources.
  final String stackId;

  /// The Amazon Resource Name (ARN) of the deleted project.
  final String projectArn;

  DeleteProjectResult({
    this.stackId,
    this.projectArn,
  });
  static DeleteProjectResult fromJson(Map<String, dynamic> json) =>
      DeleteProjectResult(
        stackId: json.containsKey('stackId') ? json['stackId'] as String : null,
        projectArn: json.containsKey('projectArn')
            ? json['projectArn'] as String
            : null,
      );
}

class DeleteUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user deleted from AWS CodeStar.
  final String userArn;

  DeleteUserProfileResult({
    @required this.userArn,
  });
  static DeleteUserProfileResult fromJson(Map<String, dynamic> json) =>
      DeleteUserProfileResult(
        userArn: json['userArn'] as String,
      );
}

class DescribeProjectResult {
  /// The display name for the project.
  final String name;

  /// The ID of the project.
  final String id;

  /// The Amazon Resource Name (ARN) for the project.
  final String arn;

  /// The description of the project, if any.
  final String description;

  /// A user- or system-generated token that identifies the entity that
  /// requested project creation.
  final String clientRequestToken;

  /// The date and time the project was created, in timestamp format.
  final DateTime createdTimeStamp;

  /// The ID of the primary stack in AWS CloudFormation used to generate
  /// resources for the project.
  final String stackId;

  /// The ID for the AWS CodeStar project template used to create the project.
  final String projectTemplateId;

  /// The project creation or deletion status.
  final ProjectStatus status;

  DescribeProjectResult({
    this.name,
    this.id,
    this.arn,
    this.description,
    this.clientRequestToken,
    this.createdTimeStamp,
    this.stackId,
    this.projectTemplateId,
    this.status,
  });
  static DescribeProjectResult fromJson(Map<String, dynamic> json) =>
      DescribeProjectResult(
        name: json.containsKey('name') ? json['name'] as String : null,
        id: json.containsKey('id') ? json['id'] as String : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
        createdTimeStamp: json.containsKey('createdTimeStamp')
            ? DateTime.parse(json['createdTimeStamp'])
            : null,
        stackId: json.containsKey('stackId') ? json['stackId'] as String : null,
        projectTemplateId: json.containsKey('projectTemplateId')
            ? json['projectTemplateId'] as String
            : null,
        status: json.containsKey('status')
            ? ProjectStatus.fromJson(json['status'])
            : null,
      );
}

class DescribeUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user.
  final String userArn;

  /// The display name shown for the user in AWS CodeStar projects. For example,
  /// this could be set to both first and last name ("Mary Major") or a single
  /// name ("Mary"). The display name is also used to generate the initial icon
  /// associated with the user in AWS CodeStar projects. If spaces are included
  /// in the display name, the first character that appears after the space will
  /// be used as the second character in the user initial icon. The initial icon
  /// displays a maximum of two characters, so a display name with more than one
  /// space (for example "Mary Jane Major") would generate an initial icon using
  /// the first character and the first character after the space ("MJ", not
  /// "MM").
  final String displayName;

  /// The email address for the user. Optional.
  final String emailAddress;

  /// The SSH public key associated with the user. This SSH public key is
  /// associated with the user profile, and can be used in conjunction with the
  /// associated private key for access to project resources, such as Amazon EC2
  /// instances, if a project owner grants remote access to those resources.
  final String sshPublicKey;

  /// The date and time when the user profile was created in AWS CodeStar, in
  /// timestamp format.
  final DateTime createdTimestamp;

  /// The date and time when the user profile was last modified, in timestamp
  /// format.
  final DateTime lastModifiedTimestamp;

  DescribeUserProfileResult({
    @required this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
    @required this.createdTimestamp,
    @required this.lastModifiedTimestamp,
  });
  static DescribeUserProfileResult fromJson(Map<String, dynamic> json) =>
      DescribeUserProfileResult(
        userArn: json['userArn'] as String,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        emailAddress: json.containsKey('emailAddress')
            ? json['emailAddress'] as String
            : null,
        sshPublicKey: json.containsKey('sshPublicKey')
            ? json['sshPublicKey'] as String
            : null,
        createdTimestamp: DateTime.parse(json['createdTimestamp']),
        lastModifiedTimestamp: DateTime.parse(json['lastModifiedTimestamp']),
      );
}

class DisassociateTeamMemberResult {
  DisassociateTeamMemberResult();
  static DisassociateTeamMemberResult fromJson(Map<String, dynamic> json) =>
      DisassociateTeamMemberResult();
}

/// Information about the GitHub repository to be created in AWS CodeStar. This
/// is where the source code files provided with the project request will be
/// uploaded after project creation.
class GitHubCodeDestination {
  /// Name of the GitHub repository to be created in AWS CodeStar.
  final String name;

  /// Description for the GitHub repository to be created in AWS CodeStar. This
  /// description displays in GitHub after the repository is created.
  final String description;

  /// The type of GitHub repository to be created in AWS CodeStar. Valid values
  /// are User or Organization.
  final String type;

  /// The GitHub username for the owner of the GitHub repository to be created
  /// in AWS CodeStar. If this repository should be owned by a GitHub
  /// organization, provide its name.
  final String owner;

  /// Whether the GitHub repository is to be a private repository.
  final bool privateRepository;

  /// Whether to enable issues for the GitHub repository.
  final bool issuesEnabled;

  /// The GitHub user's personal access token for the GitHub repository.
  final String token;

  GitHubCodeDestination({
    @required this.name,
    this.description,
    @required this.type,
    @required this.owner,
    @required this.privateRepository,
    @required this.issuesEnabled,
    @required this.token,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListProjectsResult {
  /// A list of projects.
  final List<ProjectSummary> projects;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String nextToken;

  ListProjectsResult({
    @required this.projects,
    this.nextToken,
  });
  static ListProjectsResult fromJson(Map<String, dynamic> json) =>
      ListProjectsResult(
        projects: (json['projects'] as List)
            .map((e) => ProjectSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListResourcesResult {
  /// An array of resources associated with the project.
  final List<Resource> resources;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String nextToken;

  ListResourcesResult({
    this.resources,
    this.nextToken,
  });
  static ListResourcesResult fromJson(Map<String, dynamic> json) =>
      ListResourcesResult(
        resources: json.containsKey('resources')
            ? (json['resources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForProjectResult {
  /// The tags for the project.
  final Map<String, String> tags;

  /// Reserved for future use.
  final String nextToken;

  ListTagsForProjectResult({
    this.tags,
    this.nextToken,
  });
  static ListTagsForProjectResult fromJson(Map<String, dynamic> json) =>
      ListTagsForProjectResult(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTeamMembersResult {
  /// A list of team member objects for the project.
  final List<TeamMember> teamMembers;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String nextToken;

  ListTeamMembersResult({
    @required this.teamMembers,
    this.nextToken,
  });
  static ListTeamMembersResult fromJson(Map<String, dynamic> json) =>
      ListTeamMembersResult(
        teamMembers: (json['teamMembers'] as List)
            .map((e) => TeamMember.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListUserProfilesResult {
  /// All the user profiles configured in AWS CodeStar for an AWS account.
  final List<UserProfileSummary> userProfiles;

  /// The continuation token to use when requesting the next set of results, if
  /// there are more results to be returned.
  final String nextToken;

  ListUserProfilesResult({
    @required this.userProfiles,
    this.nextToken,
  });
  static ListUserProfilesResult fromJson(Map<String, dynamic> json) =>
      ListUserProfilesResult(
        userProfiles: (json['userProfiles'] as List)
            .map((e) => UserProfileSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// An indication of whether a project creation or deletion is failed or
/// successful.
class ProjectStatus {
  /// The phase of completion for a project creation or deletion.
  final String state;

  /// In the case of a project creation or deletion failure, a reason for the
  /// failure.
  final String reason;

  ProjectStatus({
    @required this.state,
    this.reason,
  });
  static ProjectStatus fromJson(Map<String, dynamic> json) => ProjectStatus(
        state: json['state'] as String,
        reason: json.containsKey('reason') ? json['reason'] as String : null,
      );
}

/// Information about the metadata for a project.
class ProjectSummary {
  /// The ID of the project.
  final String projectId;

  /// The Amazon Resource Name (ARN) of the project.
  final String projectArn;

  ProjectSummary({
    this.projectId,
    this.projectArn,
  });
  static ProjectSummary fromJson(Map<String, dynamic> json) => ProjectSummary(
        projectId:
            json.containsKey('projectId') ? json['projectId'] as String : null,
        projectArn: json.containsKey('projectArn')
            ? json['projectArn'] as String
            : null,
      );
}

/// Information about a resource for a project.
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String id;

  Resource({
    @required this.id,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        id: json['id'] as String,
      );
}

/// The Amazon S3 location where the source code files provided with the project
/// request are stored.
class S3Location {
  /// The Amazon S3 bucket name where the source code files provided with the
  /// project request are stored.
  final String bucketName;

  /// The Amazon S3 object key where the source code files provided with the
  /// project request are stored.
  final String bucketKey;

  S3Location({
    this.bucketName,
    this.bucketKey,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagProjectResult {
  /// The tags for the project.
  final Map<String, String> tags;

  TagProjectResult({
    this.tags,
  });
  static TagProjectResult fromJson(Map<String, dynamic> json) =>
      TagProjectResult(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Information about a team member in a project.
class TeamMember {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The role assigned to the user in the project. Project roles have different
  /// levels of access. For more information, see
  /// [Working with Teams](http://docs.aws.amazon.com/codestar/latest/userguide/working-with-teams.html)
  /// in the _AWS CodeStar User Guide_.
  final String projectRole;

  /// Whether the user is allowed to remotely access project resources using an
  /// SSH public/private key pair.
  final bool remoteAccessAllowed;

  TeamMember({
    @required this.userArn,
    @required this.projectRole,
    this.remoteAccessAllowed,
  });
  static TeamMember fromJson(Map<String, dynamic> json) => TeamMember(
        userArn: json['userArn'] as String,
        projectRole: json['projectRole'] as String,
        remoteAccessAllowed: json.containsKey('remoteAccessAllowed')
            ? json['remoteAccessAllowed'] as bool
            : null,
      );
}

/// The toolchain template file provided with the project request. AWS CodeStar
/// uses the template to provision the toolchain stack in AWS CloudFormation.
class Toolchain {
  /// The Amazon S3 location where the toolchain template file provided with the
  /// project request is stored. AWS CodeStar retrieves the file during project
  /// creation.
  final ToolchainSource source;

  /// The service role ARN for AWS CodeStar to use for the toolchain template
  /// during stack provisioning.
  final String roleArn;

  /// The list of parameter overrides to be passed into the toolchain template
  /// during stack provisioning, if any.
  final Map<String, String> stackParameters;

  Toolchain({
    @required this.source,
    this.roleArn,
    this.stackParameters,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Amazon S3 location where the toolchain template file provided with the
/// project request is stored. AWS CodeStar retrieves the file during project
/// creation.
class ToolchainSource {
  /// The Amazon S3 bucket where the toolchain template file provided with the
  /// project request is stored.
  final S3Location s3;

  ToolchainSource({
    @required this.s3,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagProjectResult {
  UntagProjectResult();
  static UntagProjectResult fromJson(Map<String, dynamic> json) =>
      UntagProjectResult();
}

class UpdateProjectResult {
  UpdateProjectResult();
  static UpdateProjectResult fromJson(Map<String, dynamic> json) =>
      UpdateProjectResult();
}

class UpdateTeamMemberResult {
  /// The Amazon Resource Name (ARN) of the user whose team membership
  /// attributes were updated.
  final String userArn;

  /// The project role granted to the user.
  final String projectRole;

  /// Whether a team member is allowed to remotely access project resources
  /// using the SSH public key associated with the user's profile.
  final bool remoteAccessAllowed;

  UpdateTeamMemberResult({
    this.userArn,
    this.projectRole,
    this.remoteAccessAllowed,
  });
  static UpdateTeamMemberResult fromJson(Map<String, dynamic> json) =>
      UpdateTeamMemberResult(
        userArn: json.containsKey('userArn') ? json['userArn'] as String : null,
        projectRole: json.containsKey('projectRole')
            ? json['projectRole'] as String
            : null,
        remoteAccessAllowed: json.containsKey('remoteAccessAllowed')
            ? json['remoteAccessAllowed'] as bool
            : null,
      );
}

class UpdateUserProfileResult {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The name that is displayed as the friendly name for the user in AWS
  /// CodeStar.
  final String displayName;

  /// The email address that is displayed as part of the user's profile in AWS
  /// CodeStar.
  final String emailAddress;

  /// The SSH public key associated with the user in AWS CodeStar. This is the
  /// public portion of the public/private keypair the user can use to access
  /// project resources if a project owner allows the user remote access to
  /// those resources.
  final String sshPublicKey;

  /// The date the user profile was created, in timestamp format.
  final DateTime createdTimestamp;

  /// The date the user profile was last modified, in timestamp format.
  final DateTime lastModifiedTimestamp;

  UpdateUserProfileResult({
    @required this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
  });
  static UpdateUserProfileResult fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileResult(
        userArn: json['userArn'] as String,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        emailAddress: json.containsKey('emailAddress')
            ? json['emailAddress'] as String
            : null,
        sshPublicKey: json.containsKey('sshPublicKey')
            ? json['sshPublicKey'] as String
            : null,
        createdTimestamp: json.containsKey('createdTimestamp')
            ? DateTime.parse(json['createdTimestamp'])
            : null,
        lastModifiedTimestamp: json.containsKey('lastModifiedTimestamp')
            ? DateTime.parse(json['lastModifiedTimestamp'])
            : null,
      );
}

/// Information about a user's profile in AWS CodeStar.
class UserProfileSummary {
  /// The Amazon Resource Name (ARN) of the user in IAM.
  final String userArn;

  /// The display name of a user in AWS CodeStar. For example, this could be set
  /// to both first and last name ("Mary Major") or a single name ("Mary"). The
  /// display name is also used to generate the initial icon associated with the
  /// user in AWS CodeStar projects. If spaces are included in the display name,
  /// the first character that appears after the space will be used as the
  /// second character in the user initial icon. The initial icon displays a
  /// maximum of two characters, so a display name with more than one space (for
  /// example "Mary Jane Major") would generate an initial icon using the first
  /// character and the first character after the space ("MJ", not "MM").
  final String displayName;

  /// The email address associated with the user.
  final String emailAddress;

  /// The SSH public key associated with the user in AWS CodeStar. If a project
  /// owner allows the user remote access to project resources, this public key
  /// will be used along with the user's private key for SSH access.
  final String sshPublicKey;

  UserProfileSummary({
    this.userArn,
    this.displayName,
    this.emailAddress,
    this.sshPublicKey,
  });
  static UserProfileSummary fromJson(Map<String, dynamic> json) =>
      UserProfileSummary(
        userArn: json.containsKey('userArn') ? json['userArn'] as String : null,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        emailAddress: json.containsKey('emailAddress')
            ? json['emailAddress'] as String
            : null,
        sshPublicKey: json.containsKey('sshPublicKey')
            ? json['sshPublicKey'] as String
            : null,
      );
}
