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
  /// Adds an IAM user to the team for an AWS CodeStar project.
  Future<void> associateTeamMember(
      {@required String projectId,
      String clientRequestToken,
      @required String userArn,
      @required String projectRole,
      bool remoteAccessAllowed}) async {}

  /// Creates a project, including project resources. This action creates a
  /// project based on a submitted project request. A set of source code files
  /// and a toolchain template file can be included with the project request. If
  /// these are not provided, an empty project is created.
  Future<void> createProject(
      {@required String name,
      @required String id,
      String description,
      String clientRequestToken,
      List<Code> sourceCode,
      Toolchain toolchain,
      Map<String, String> tags}) async {}

  /// Creates a profile for a user that includes user preferences, such as the
  /// display name and email address assocciated with the user, in AWS CodeStar.
  /// The user profile is not project-specific. Information in the user profile
  /// is displayed wherever the user's information appears to other users in AWS
  /// CodeStar.
  Future<void> createUserProfile(
      {@required String userArn,
      @required String displayName,
      @required String emailAddress,
      String sshPublicKey}) async {}

  /// Deletes a project, including project resources. Does not delete users
  /// associated with the project, but does delete the IAM roles that allowed
  /// access to the project.
  Future<void> deleteProject(String id,
      {String clientRequestToken, bool deleteStack}) async {}

  /// Deletes a user profile in AWS CodeStar, including all personal preference
  /// data associated with that profile, such as display name and email address.
  /// It does not delete the history of that user, for example the history of
  /// commits made by that user.
  Future<void> deleteUserProfile(String userArn) async {}

  /// Describes a project and its resources.
  Future<void> describeProject(String id) async {}

  /// Describes a user in AWS CodeStar and the user attributes across all
  /// projects.
  Future<void> describeUserProfile(String userArn) async {}

  /// Removes a user from a project. Removing a user from a project also removes
  /// the IAM policies from that user that allowed access to the project and its
  /// resources. Disassociating a team member does not remove that user's
  /// profile from AWS CodeStar. It does not remove the user from IAM.
  Future<void> disassociateTeamMember(
      {@required String projectId, @required String userArn}) async {}

  /// Lists all projects in AWS CodeStar associated with your AWS account.
  Future<void> listProjects({String nextToken, int maxResults}) async {}

  /// Lists resources associated with a project in AWS CodeStar.
  Future<void> listResources(String projectId,
      {String nextToken, int maxResults}) async {}

  /// Gets the tags for a project.
  Future<void> listTagsForProject(String id,
      {String nextToken, int maxResults}) async {}

  /// Lists all team members associated with a project.
  Future<void> listTeamMembers(String projectId,
      {String nextToken, int maxResults}) async {}

  /// Lists all the user profiles configured for your AWS account in AWS
  /// CodeStar.
  Future<void> listUserProfiles({String nextToken, int maxResults}) async {}

  /// Adds tags to a project.
  Future<void> tagProject(
      {@required String id, @required Map<String, String> tags}) async {}

  /// Removes tags from a project.
  Future<void> untagProject(
      {@required String id, @required List<String> tags}) async {}

  /// Updates a project in AWS CodeStar.
  Future<void> updateProject(String id,
      {String name, String description}) async {}

  /// Updates a team member's attributes in an AWS CodeStar project. For
  /// example, you can change a team member's role in the project, or change
  /// whether they have remote access to project resources.
  Future<void> updateTeamMember(
      {@required String projectId,
      @required String userArn,
      String projectRole,
      bool remoteAccessAllowed}) async {}

  /// Updates a user's profile in AWS CodeStar. The user profile is not
  /// project-specific. Information in the user profile is displayed wherever
  /// the user's information appears to other users in AWS CodeStar.
  Future<void> updateUserProfile(String userArn,
      {String displayName, String emailAddress, String sshPublicKey}) async {}
}

class AssociateTeamMemberResult {}

class Code {}

class CodeCommitCodeDestination {}

class CodeDestination {}

class CodeSource {}

class CreateProjectResult {}

class CreateUserProfileResult {}

class DeleteProjectResult {}

class DeleteUserProfileResult {}

class DescribeProjectResult {}

class DescribeUserProfileResult {}

class DisassociateTeamMemberResult {}

class GitHubCodeDestination {}

class ListProjectsResult {}

class ListResourcesResult {}

class ListTagsForProjectResult {}

class ListTeamMembersResult {}

class ListUserProfilesResult {}

class ProjectStatus {}

class ProjectSummary {}

class Resource {}

class S3Location {}

class TagProjectResult {}

class TeamMember {}

class Toolchain {}

class ToolchainSource {}

class UntagProjectResult {}

class UpdateProjectResult {}

class UpdateTeamMemberResult {}

class UpdateUserProfileResult {}

class UserProfileSummary {}
