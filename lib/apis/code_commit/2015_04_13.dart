import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS CodeCommit
///
/// This is the _AWS CodeCommit API Reference_. This reference provides
/// descriptions of the operations and data types for AWS CodeCommit API along
/// with usage examples.
///
/// You can use the AWS CodeCommit API to work with the following objects:
///
/// Repositories, by calling the following:
///
/// *    BatchGetRepositories, which returns information about one or more
/// repositories associated with your AWS account.
///
/// *    CreateRepository, which creates an AWS CodeCommit repository.
///
/// *    DeleteRepository, which deletes an AWS CodeCommit repository.
///
/// *    GetRepository, which returns information about a specified repository.
///
/// *    ListRepositories, which lists all AWS CodeCommit repositories
/// associated with your AWS account.
///
/// *    UpdateRepositoryDescription, which sets or updates the description of
/// the repository.
///
/// *    UpdateRepositoryName, which changes the name of the repository. If you
/// change the name of a repository, no other users of that repository will be
/// able to access it until you send them the new HTTPS or SSH URL to use.
///
///
/// Branches, by calling the following:
///
/// *    CreateBranch, which creates a new branch in a specified repository.
///
/// *    DeleteBranch, which deletes the specified branch in a repository unless
/// it is the default branch.
///
/// *    GetBranch, which returns information about a specified branch.
///
/// *    ListBranches, which lists all branches for a specified repository.
///
/// *    UpdateDefaultBranch, which changes the default branch for a repository.
///
///
/// Files, by calling the following:
///
/// *    DeleteFile, which deletes the content of a specified file from a
/// specified branch.
///
/// *    GetBlob, which returns the base-64 encoded content of an individual Git
/// blob object within a repository.
///
/// *    GetFile, which returns the base-64 encoded content of a specified file.
///
/// *    GetFolder, which returns the contents of a specified folder or
/// directory.
///
/// *    PutFile, which adds or modifies a single file in a specified repository
/// and branch.
///
///
/// Commits, by calling the following:
///
/// *    BatchGetCommits, which returns information about one or more commits in
/// a repository
///
/// *    CreateCommit, which creates a commit for changes to a repository.
///
/// *    GetCommit, which returns information about a commit, including commit
/// messages and author and committer information.
///
/// *    GetDifferences, which returns information about the differences in a
/// valid commit specifier (such as a branch, tag, HEAD, commit ID or other
/// fully qualified reference).
///
///
/// Merges, by calling the following:
///
/// *    BatchDescribeMergeConflicts, which returns information about conflicts
/// in a merge between commits in a repository.
///
/// *    CreateUnreferencedMergeCommit, which creates an unreferenced commit
/// between two branches or commits for the purpose of comparing them and
/// identifying any potential conflicts.
///
/// *    DescribeMergeConflicts, which returns information about merge conflicts
/// between the base, source, and destination versions of a file in a potential
/// merge.
///
/// *    GetMergeCommit, which returns information about the merge between a
/// source and destination commit.
///
/// *    GetMergeConflicts, which returns information about merge conflicts
/// between the source and destination branch in a pull request.
///
/// *    GetMergeOptions, which returns information about the available merge
/// options between two branches or commit specifiers.
///
/// *    MergeBranchesByFastForward, which merges two branches using the
/// fast-forward merge option.
///
/// *    MergeBranchesBySquash, which merges two branches using the squash merge
/// option.
///
/// *    MergeBranchesByThreeWay, which merges two branches using the three-way
/// merge option.
///
///
/// Pull requests, by calling the following:
///
/// *    CreatePullRequest, which creates a pull request in a specified
/// repository.
///
/// *    DescribePullRequestEvents, which returns information about one or more
/// pull request events.
///
/// *    GetCommentsForPullRequest, which returns information about comments on
/// a specified pull request.
///
/// *    GetPullRequest, which returns information about a specified pull
/// request.
///
/// *    ListPullRequests, which lists all pull requests for a repository.
///
/// *    MergePullRequestByFastForward, which merges the source destination
/// branch of a pull request into the specified destination branch for that pull
/// request using the fast-forward merge option.
///
/// *    MergePullRequestBySquash, which merges the source destination branch of
/// a pull request into the specified destination branch for that pull request
/// using the squash merge option.
///
/// *    MergePullRequestByThreeWay. which merges the source destination branch
/// of a pull request into the specified destination branch for that pull
/// request using the three-way merge option.
///
/// *    PostCommentForPullRequest, which posts a comment to a pull request at
/// the specified line, file, or request.
///
/// *    UpdatePullRequestDescription, which updates the description of a pull
/// request.
///
/// *    UpdatePullRequestStatus, which updates the status of a pull request.
///
/// *    UpdatePullRequestTitle, which updates the title of a pull request.
///
///
/// Comments in a repository, by calling the following:
///
/// *    DeleteCommentContent, which deletes the content of a comment on a
/// commit in a repository.
///
/// *    GetComment, which returns information about a comment on a commit.
///
/// *    GetCommentsForComparedCommit, which returns information about comments
/// on the comparison between two commit specifiers in a repository.
///
/// *    PostCommentForComparedCommit, which creates a comment on the comparison
/// between two commit specifiers in a repository.
///
/// *    PostCommentReply, which creates a reply to a comment.
///
/// *    UpdateComment, which updates the content of a comment on a commit in a
/// repository.
///
///
/// Tags used to tag resources in AWS CodeCommit (not Git tags), by calling the
/// following:
///
/// *    ListTagsForResource, which gets information about AWS tags for a
/// specified Amazon Resource Name (ARN) in AWS CodeCommit.
///
/// *    TagResource, which adds or updates tags for a resource in AWS
/// CodeCommit.
///
/// *    UntagResource, which removes tags for a resource in AWS CodeCommit.
///
///
/// Triggers, by calling the following:
///
/// *    GetRepositoryTriggers, which returns information about triggers
/// configured for a repository.
///
/// *    PutRepositoryTriggers, which replaces all triggers for a repository and
/// can be used to create or delete triggers.
///
/// *    TestRepositoryTriggers, which tests the functionality of a repository
/// trigger by sending data to the trigger target.
///
///
/// For information about how to use AWS CodeCommit, see the [AWS CodeCommit
/// User
/// Guide](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html).
class CodeCommitApi {
  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy.
  Future<void> batchDescribeMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      int maxMergeHunks,
      int maxConflictFiles,
      List<String> filePaths,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String nextToken}) async {}

  /// Returns information about the contents of one or more commits in a
  /// repository.
  Future<void> batchGetCommits(
      {@required List<String> commitIds,
      @required String repositoryName}) async {}

  /// Returns information about one or more repositories.
  ///
  ///
  ///
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a web page could expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a web page.
  Future<void> batchGetRepositories(List<String> repositoryNames) async {}

  /// Creates a new branch in a repository and points the branch to a commit.
  ///
  ///
  ///
  /// Calling the create branch operation does not set a repository's default
  /// branch. To do this, call the update default branch operation.
  Future<void> createBranch(
      {@required String repositoryName,
      @required String branchName,
      @required String commitId}) async {}

  /// Creates a commit for a repository on the tip of a specified branch.
  Future<void> createCommit(
      {@required String repositoryName,
      @required String branchName,
      String parentCommitId,
      String authorName,
      String email,
      String commitMessage,
      bool keepEmptyFolders,
      List<PutFileEntry> putFiles,
      List<DeleteFileEntry> deleteFiles,
      List<SetFileModeEntry> setFileModes}) async {}

  /// Creates a pull request in the specified repository.
  Future<void> createPullRequest(
      {@required String title,
      String description,
      @required List<Target> targets,
      String clientRequestToken}) async {}

  /// Creates a new, empty repository.
  Future<void> createRepository(String repositoryName,
      {String repositoryDescription, Map<String, String> tags}) async {}

  /// Creates an unreferenced commit that represents the result of merging two
  /// branches using a specified merge strategy. This can help you determine the
  /// outcome of a potential merge. This API cannot be used with the
  /// fast-forward merge strategy, as that strategy does not create a merge
  /// commit.
  ///
  ///
  ///
  /// This unreferenced merge commit can only be accessed using the GetCommit
  /// API or through git commands such as git fetch. To retrieve this commit,
  /// you must specify its commit ID or otherwise reference it.
  Future<void> createUnreferencedMergeCommit(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      @required String mergeOption,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String authorName,
      String email,
      String commitMessage,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {}

  /// Deletes a branch from a repository, unless that branch is the default
  /// branch for the repository.
  Future<void> deleteBranch(
      {@required String repositoryName, @required String branchName}) async {}

  /// Deletes the content of a comment made on a change, file, or commit in a
  /// repository.
  Future<void> deleteCommentContent(String commentId) async {}

  /// Deletes a specified file from a specified branch. A commit is created on
  /// the branch that contains the revision. The file will still exist in the
  /// commits prior to the commit that contains the deletion.
  Future<void> deleteFile(
      {@required String repositoryName,
      @required String branchName,
      @required String filePath,
      @required String parentCommitId,
      bool keepEmptyFolders,
      String commitMessage,
      String name,
      String email}) async {}

  /// Deletes a repository. If a specified repository was already deleted, a
  /// null repository ID will be returned.
  ///
  ///
  ///
  /// Deleting a repository also deletes all associated objects and metadata.
  /// After a repository is deleted, all future push calls to the deleted
  /// repository will fail.
  Future<void> deleteRepository(String repositoryName) async {}

  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy. If the merge option for the attempted merge is specified as
  /// FAST\_FORWARD\_MERGE, an exception will be thrown.
  Future<void> describeMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      int maxMergeHunks,
      @required String filePath,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String nextToken}) async {}

  /// Returns information about one or more pull request events.
  Future<void> describePullRequestEvents(String pullRequestId,
      {String pullRequestEventType,
      String actorArn,
      String nextToken,
      int maxResults}) async {}

  /// Returns the base-64 encoded content of an individual blob within a
  /// repository.
  Future<void> getBlob(
      {@required String repositoryName, @required String blobId}) async {}

  /// Returns information about a repository branch, including its name and the
  /// last commit ID.
  Future<void> getBranch({String repositoryName, String branchName}) async {}

  /// Returns the content of a comment made on a change, file, or commit in a
  /// repository.
  Future<void> getComment(String commentId) async {}

  /// Returns information about comments made on the comparison between two
  /// commits.
  Future<void> getCommentsForComparedCommit(
      {@required String repositoryName,
      String beforeCommitId,
      @required String afterCommitId,
      String nextToken,
      int maxResults}) async {}

  /// Returns comments made on a pull request.
  Future<void> getCommentsForPullRequest(String pullRequestId,
      {String repositoryName,
      String beforeCommitId,
      String afterCommitId,
      String nextToken,
      int maxResults}) async {}

  /// Returns information about a commit, including commit message and committer
  /// information.
  Future<void> getCommit(
      {@required String repositoryName, @required String commitId}) async {}

  /// Returns information about the differences in a valid commit specifier
  /// (such as a branch, tag, HEAD, commit ID or other fully qualified
  /// reference). Results can be limited to a specified path.
  Future<void> getDifferences(
      {@required String repositoryName,
      String beforeCommitSpecifier,
      @required String afterCommitSpecifier,
      String beforePath,
      String afterPath,
      int maxResults,
      String nextToken}) async {}

  /// Returns the base-64 encoded contents of a specified file and its metadata.
  Future<void> getFile(
      {@required String repositoryName,
      String commitSpecifier,
      @required String filePath}) async {}

  /// Returns the contents of a specified folder in a repository.
  Future<void> getFolder(
      {@required String repositoryName,
      String commitSpecifier,
      @required String folderPath}) async {}

  /// Returns information about a specified merge commit.
  Future<void> getMergeCommit(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String conflictDetailLevel,
      String conflictResolutionStrategy}) async {}

  /// Returns information about merge conflicts between the before and after
  /// commit IDs for a pull request in a repository.
  Future<void> getMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      String conflictDetailLevel,
      int maxConflictFiles,
      String conflictResolutionStrategy,
      String nextToken}) async {}

  /// Returns information about the merge options available for merging two
  /// specified branches. For details about why a particular merge option is not
  /// available, use GetMergeConflicts or DescribeMergeConflicts.
  Future<void> getMergeOptions(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String conflictDetailLevel,
      String conflictResolutionStrategy}) async {}

  /// Gets information about a pull request in a specified repository.
  Future<void> getPullRequest(String pullRequestId) async {}

  /// Returns information about a repository.
  ///
  ///
  ///
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a web page could expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a web page.
  Future<void> getRepository(String repositoryName) async {}

  /// Gets information about triggers configured for a repository.
  Future<void> getRepositoryTriggers(String repositoryName) async {}

  /// Gets information about one or more branches in a repository.
  Future<void> listBranches(String repositoryName, {String nextToken}) async {}

  /// Returns a list of pull requests for a specified repository. The return
  /// list can be refined by pull request status or pull request author ARN.
  Future<void> listPullRequests(String repositoryName,
      {String authorArn,
      String pullRequestStatus,
      String nextToken,
      int maxResults}) async {}

  /// Gets information about one or more repositories.
  Future<void> listRepositories(
      {String nextToken, String sortBy, String order}) async {}

  /// Gets information about AWS tags for a specified Amazon Resource Name (ARN)
  /// in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see
  /// [CodeCommit Resources and
  /// Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken}) async {}

  /// Merges two branches using the fast-forward merge strategy.
  Future<void> mergeBranchesByFastForward(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String targetBranch}) async {}

  /// Merges two branches using the squash merge strategy.
  Future<void> mergeBranchesBySquash(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String targetBranch,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String authorName,
      String email,
      String commitMessage,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {}

  /// Merges two specified branches using the three-way merge strategy.
  Future<void> mergeBranchesByThreeWay(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String targetBranch,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String authorName,
      String email,
      String commitMessage,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {}

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// fast-forward merge strategy. If the merge is successful, it closes the
  /// pull request.
  Future<void> mergePullRequestByFastForward(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId}) async {}

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// squash merge strategy. If the merge is successful, it closes the pull
  /// request.
  Future<void> mergePullRequestBySquash(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String commitMessage,
      String authorName,
      String email,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {}

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// three-way merge strategy. If the merge is successful, it closes the pull
  /// request.
  Future<void> mergePullRequestByThreeWay(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String commitMessage,
      String authorName,
      String email,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {}

  /// Posts a comment on the comparison between two commits.
  Future<void> postCommentForComparedCommit(
      {@required String repositoryName,
      String beforeCommitId,
      @required String afterCommitId,
      Location location,
      @required String content,
      String clientRequestToken}) async {}

  /// Posts a comment on a pull request.
  Future<void> postCommentForPullRequest(
      {@required String pullRequestId,
      @required String repositoryName,
      @required String beforeCommitId,
      @required String afterCommitId,
      Location location,
      @required String content,
      String clientRequestToken}) async {}

  /// Posts a comment in reply to an existing comment on a comparison between
  /// commits or a pull request.
  Future<void> postCommentReply(
      {@required String inReplyTo,
      String clientRequestToken,
      @required String content}) async {}

  /// Adds or updates a file in a branch in an AWS CodeCommit repository, and
  /// generates a commit for the addition in the specified branch.
  Future<void> putFile(
      {@required String repositoryName,
      @required String branchName,
      @required Uint8List fileContent,
      @required String filePath,
      String fileMode,
      String parentCommitId,
      String commitMessage,
      String name,
      String email}) async {}

  /// Replaces all triggers for a repository. This can be used to create or
  /// delete triggers.
  Future<void> putRepositoryTriggers(
      {@required String repositoryName,
      @required List<RepositoryTrigger> triggers}) async {}

  /// Adds or updates tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see [CodeCommit Resources and
  /// Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Tests the functionality of repository triggers by sending information to
  /// the trigger target. If real data is available in the repository, the test
  /// will send data from the last commit. If no data is available, sample data
  /// will be generated.
  Future<void> testRepositoryTriggers(
      {@required String repositoryName,
      @required List<RepositoryTrigger> triggers}) async {}

  /// Removes tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see [CodeCommit Resources and
  /// Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Replaces the contents of a comment.
  Future<void> updateComment(
      {@required String commentId, @required String content}) async {}

  /// Sets or changes the default branch name for the specified repository.
  ///
  ///
  ///
  /// If you use this operation to change the default branch name to the current
  /// default branch name, a success message is returned even though the default
  /// branch did not change.
  Future<void> updateDefaultBranch(
      {@required String repositoryName,
      @required String defaultBranchName}) async {}

  /// Replaces the contents of the description of a pull request.
  Future<void> updatePullRequestDescription(
      {@required String pullRequestId, @required String description}) async {}

  /// Updates the status of a pull request.
  Future<void> updatePullRequestStatus(
      {@required String pullRequestId,
      @required String pullRequestStatus}) async {}

  /// Replaces the title of a pull request.
  Future<void> updatePullRequestTitle(
      {@required String pullRequestId, @required String title}) async {}

  /// Sets or changes the comment or description for a repository.
  ///
  ///
  ///
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a web page could expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a web page.
  Future<void> updateRepositoryDescription(String repositoryName,
      {String repositoryDescription}) async {}

  /// Renames a repository. The repository name must be unique across the
  /// calling AWS account. In addition, repository names are limited to 100
  /// alphanumeric, dash, and underscore characters, and cannot include certain
  /// characters. The suffix ".git" is prohibited. For a full description of the
  /// limits on repository names, see
  /// [Limits](https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html)
  /// in the AWS CodeCommit User Guide.
  Future<void> updateRepositoryName(
      {@required String oldName, @required String newName}) async {}
}

class BatchDescribeMergeConflictsError {}

class BatchDescribeMergeConflictsOutput {}

class BatchGetCommitsError {}

class BatchGetCommitsOutput {}

class BatchGetRepositoriesOutput {}

class BlobMetadata {}

class BranchInfo {}

class Comment {}

class CommentsForComparedCommit {}

class CommentsForPullRequest {}

class Commit {}

class Conflict {}

class ConflictMetadata {}

class ConflictResolution {}

class CreateCommitOutput {}

class CreatePullRequestOutput {}

class CreateRepositoryOutput {}

class CreateUnreferencedMergeCommitOutput {}

class DeleteBranchOutput {}

class DeleteCommentContentOutput {}

class DeleteFileEntry {}

class DeleteFileOutput {}

class DeleteRepositoryOutput {}

class DescribeMergeConflictsOutput {}

class DescribePullRequestEventsOutput {}

class Difference {}

class File {}

class FileMetadata {}

class FileModes {}

class FileSizes {}

class Folder {}

class GetBlobOutput {}

class GetBranchOutput {}

class GetCommentOutput {}

class GetCommentsForComparedCommitOutput {}

class GetCommentsForPullRequestOutput {}

class GetCommitOutput {}

class GetDifferencesOutput {}

class GetFileOutput {}

class GetFolderOutput {}

class GetMergeCommitOutput {}

class GetMergeConflictsOutput {}

class GetMergeOptionsOutput {}

class GetPullRequestOutput {}

class GetRepositoryOutput {}

class GetRepositoryTriggersOutput {}

class IsBinaryFile {}

class ListBranchesOutput {}

class ListPullRequestsOutput {}

class ListRepositoriesOutput {}

class ListTagsForResourceOutput {}

class Location {}

class MergeBranchesByFastForwardOutput {}

class MergeBranchesBySquashOutput {}

class MergeBranchesByThreeWayOutput {}

class MergeHunk {}

class MergeHunkDetail {}

class MergeMetadata {}

class MergeOperations {}

class MergePullRequestByFastForwardOutput {}

class MergePullRequestBySquashOutput {}

class MergePullRequestByThreeWayOutput {}

class ObjectTypes {}

class PostCommentForComparedCommitOutput {}

class PostCommentForPullRequestOutput {}

class PostCommentReplyOutput {}

class PullRequest {}

class PullRequestCreatedEventMetadata {}

class PullRequestEvent {}

class PullRequestMergedStateChangedEventMetadata {}

class PullRequestSourceReferenceUpdatedEventMetadata {}

class PullRequestStatusChangedEventMetadata {}

class PullRequestTarget {}

class PutFileEntry {}

class PutFileOutput {}

class PutRepositoryTriggersOutput {}

class ReplaceContentEntry {}

class RepositoryMetadata {}

class RepositoryNameIdPair {}

class RepositoryTrigger {}

class RepositoryTriggerExecutionFailure {}

class SetFileModeEntry {}

class SourceFileSpecifier {}

class SubModule {}

class SymbolicLink {}

class Target {}

class TestRepositoryTriggersOutput {}

class UpdateCommentOutput {}

class UpdatePullRequestDescriptionOutput {}

class UpdatePullRequestStatusOutput {}

class UpdatePullRequestTitleOutput {}

class UserInfo {}
