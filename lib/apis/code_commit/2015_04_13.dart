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
/// For information about how to use AWS CodeCommit, see the
/// [AWS CodeCommit User Guide](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html).
class CodeCommitApi {
  final _client;
  CodeCommitApi(client)
      : _client = client.configured('CodeCommit', serializer: 'json');

  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy.
  ///
  /// [repositoryName]: The name of the repository that contains the merge
  /// conflicts you want to review.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [mergeOption]: The merge option or strategy you want to use to merge the
  /// code.
  ///
  /// [maxMergeHunks]: The maximum number of merge hunks to include in the
  /// output.
  ///
  /// [maxConflictFiles]: The maximum number of files to include in the output.
  ///
  /// [filePaths]: The path of the target files used to describe the conflicts.
  /// If not specified, the default is all conflict files.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  Future<BatchDescribeMergeConflictsOutput> batchDescribeMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      int maxMergeHunks,
      int maxConflictFiles,
      List<String> filePaths,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String nextToken}) async {
    var response_ = await _client.send('BatchDescribeMergeConflicts', {
      'repositoryName': repositoryName,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'mergeOption': mergeOption,
      if (maxMergeHunks != null) 'maxMergeHunks': maxMergeHunks,
      if (maxConflictFiles != null) 'maxConflictFiles': maxConflictFiles,
      if (filePaths != null) 'filePaths': filePaths,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return BatchDescribeMergeConflictsOutput.fromJson(response_);
  }

  /// Returns information about the contents of one or more commits in a
  /// repository.
  ///
  /// [commitIds]: The full commit IDs of the commits to get information about.
  ///
  ///
  ///
  /// You must supply the full SHAs of each commit. You cannot use shortened
  /// SHAs.
  ///
  /// [repositoryName]: The name of the repository that contains the commits.
  Future<BatchGetCommitsOutput> batchGetCommits(
      {@required List<String> commitIds,
      @required String repositoryName}) async {
    var response_ = await _client.send('BatchGetCommits', {
      'commitIds': commitIds,
      'repositoryName': repositoryName,
    });
    return BatchGetCommitsOutput.fromJson(response_);
  }

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
  ///
  /// [repositoryNames]: The names of the repositories to get information about.
  Future<BatchGetRepositoriesOutput> batchGetRepositories(
      List<String> repositoryNames) async {
    var response_ = await _client.send('BatchGetRepositories', {
      'repositoryNames': repositoryNames,
    });
    return BatchGetRepositoriesOutput.fromJson(response_);
  }

  /// Creates a new branch in a repository and points the branch to a commit.
  ///
  ///
  ///
  /// Calling the create branch operation does not set a repository's default
  /// branch. To do this, call the update default branch operation.
  ///
  /// [repositoryName]: The name of the repository in which you want to create
  /// the new branch.
  ///
  /// [branchName]: The name of the new branch to create.
  ///
  /// [commitId]: The ID of the commit to point the new branch to.
  Future<void> createBranch(
      {@required String repositoryName,
      @required String branchName,
      @required String commitId}) async {
    await _client.send('CreateBranch', {
      'repositoryName': repositoryName,
      'branchName': branchName,
      'commitId': commitId,
    });
  }

  /// Creates a commit for a repository on the tip of a specified branch.
  ///
  /// [repositoryName]: The name of the repository where you will create the
  /// commit.
  ///
  /// [branchName]: The name of the branch where you will create the commit.
  ///
  /// [parentCommitId]: The ID of the commit that is the parent of the commit
  /// you will create. If this is an empty repository, this is not required.
  ///
  /// [authorName]: The name of the author who created the commit. This
  /// information will be used as both the author and committer for the commit.
  ///
  /// [email]: The email address of the person who created the commit.
  ///
  /// [commitMessage]: The commit message you want to include as part of
  /// creating the commit. Commit messages are limited to 256 KB. If no message
  /// is specified, a default message will be used.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [putFiles]: The files to add or update in this commit.
  ///
  /// [deleteFiles]: The files to delete in this commit. These files will still
  /// exist in prior commits.
  ///
  /// [setFileModes]: The file modes to update for files in this commit.
  Future<CreateCommitOutput> createCommit(
      {@required String repositoryName,
      @required String branchName,
      String parentCommitId,
      String authorName,
      String email,
      String commitMessage,
      bool keepEmptyFolders,
      List<PutFileEntry> putFiles,
      List<DeleteFileEntry> deleteFiles,
      List<SetFileModeEntry> setFileModes}) async {
    var response_ = await _client.send('CreateCommit', {
      'repositoryName': repositoryName,
      'branchName': branchName,
      if (parentCommitId != null) 'parentCommitId': parentCommitId,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (putFiles != null) 'putFiles': putFiles,
      if (deleteFiles != null) 'deleteFiles': deleteFiles,
      if (setFileModes != null) 'setFileModes': setFileModes,
    });
    return CreateCommitOutput.fromJson(response_);
  }

  /// Creates a pull request in the specified repository.
  ///
  /// [title]: The title of the pull request. This title will be used to
  /// identify the pull request to other users in the repository.
  ///
  /// [description]: A description of the pull request.
  ///
  /// [targets]: The targets for the pull request, including the source of the
  /// code to be reviewed (the source branch), and the destination where the
  /// creator of the pull request intends the code to be merged after the pull
  /// request is closed (the destination branch).
  ///
  /// [clientRequestToken]: A unique, client-generated idempotency token that
  /// when provided in a request, ensures the request cannot be repeated with a
  /// changed parameter. If a request is received with the same parameters and a
  /// token is included, the request will return information about the initial
  /// request that used that token.
  ///
  ///
  ///
  /// The AWS SDKs prepopulate client request tokens. If using an AWS SDK, you
  /// do not have to generate an idempotency token, as this will be done for
  /// you.
  Future<CreatePullRequestOutput> createPullRequest(
      {@required String title,
      String description,
      @required List<Target> targets,
      String clientRequestToken}) async {
    var response_ = await _client.send('CreatePullRequest', {
      'title': title,
      if (description != null) 'description': description,
      'targets': targets,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return CreatePullRequestOutput.fromJson(response_);
  }

  /// Creates a new, empty repository.
  ///
  /// [repositoryName]: The name of the new repository to be created.
  ///
  ///
  ///
  /// The repository name must be unique across the calling AWS account. In
  /// addition, repository names are limited to 100 alphanumeric, dash, and
  /// underscore characters, and cannot include certain characters. For a full
  /// description of the limits on repository names, see
  /// [Limits](https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html)
  /// in the AWS CodeCommit User Guide. The suffix ".git" is prohibited.
  ///
  /// [repositoryDescription]: A comment or description about the new
  /// repository.
  ///
  ///
  ///
  /// The description field for a repository accepts all HTML characters and all
  /// valid Unicode characters. Applications that do not HTML-encode the
  /// description and display it in a web page could expose users to potentially
  /// malicious code. Make sure that you HTML-encode the description field in
  /// any application that uses this API to display the repository description
  /// on a web page.
  ///
  /// [tags]: One or more tag key-value pairs to use when tagging this
  /// repository.
  Future<CreateRepositoryOutput> createRepository(String repositoryName,
      {String repositoryDescription, Map<String, String> tags}) async {
    var response_ = await _client.send('CreateRepository', {
      'repositoryName': repositoryName,
      if (repositoryDescription != null)
        'repositoryDescription': repositoryDescription,
      if (tags != null) 'tags': tags,
    });
    return CreateRepositoryOutput.fromJson(response_);
  }

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
  ///
  /// [repositoryName]: The name of the repository where you want to create the
  /// unreferenced merge commit.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [mergeOption]: The merge option or strategy you want to use to merge the
  /// code.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [authorName]: The name of the author who created the unreferenced commit.
  /// This information will be used as both the author and committer for the
  /// commit.
  ///
  /// [email]: The email address for the person who created the unreferenced
  /// commit.
  ///
  /// [commitMessage]: The commit message for the unreferenced commit.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [conflictResolution]: A list of inputs to use when resolving conflicts
  /// during a merge if AUTOMERGE is chosen as the conflict resolution strategy.
  Future<CreateUnreferencedMergeCommitOutput> createUnreferencedMergeCommit(
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
      ConflictResolution conflictResolution}) async {
    var response_ = await _client.send('CreateUnreferencedMergeCommit', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      'mergeOption': mergeOption,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
    });
    return CreateUnreferencedMergeCommitOutput.fromJson(response_);
  }

  /// Deletes a branch from a repository, unless that branch is the default
  /// branch for the repository.
  ///
  /// [repositoryName]: The name of the repository that contains the branch to
  /// be deleted.
  ///
  /// [branchName]: The name of the branch to delete.
  Future<DeleteBranchOutput> deleteBranch(
      {@required String repositoryName, @required String branchName}) async {
    var response_ = await _client.send('DeleteBranch', {
      'repositoryName': repositoryName,
      'branchName': branchName,
    });
    return DeleteBranchOutput.fromJson(response_);
  }

  /// Deletes the content of a comment made on a change, file, or commit in a
  /// repository.
  ///
  /// [commentId]: The unique, system-generated ID of the comment. To get this
  /// ID, use GetCommentsForComparedCommit or GetCommentsForPullRequest.
  Future<DeleteCommentContentOutput> deleteCommentContent(
      String commentId) async {
    var response_ = await _client.send('DeleteCommentContent', {
      'commentId': commentId,
    });
    return DeleteCommentContentOutput.fromJson(response_);
  }

  /// Deletes a specified file from a specified branch. A commit is created on
  /// the branch that contains the revision. The file will still exist in the
  /// commits prior to the commit that contains the deletion.
  ///
  /// [repositoryName]: The name of the repository that contains the file to
  /// delete.
  ///
  /// [branchName]: The name of the branch where the commit will be made
  /// deleting the file.
  ///
  /// [filePath]: The fully-qualified path to the file that will be deleted,
  /// including the full name and extension of that file. For example,
  /// /examples/file.md is a fully qualified path to a file named file.md in a
  /// folder named examples.
  ///
  /// [parentCommitId]: The ID of the commit that is the tip of the branch where
  /// you want to create the commit that will delete the file. This must be the
  /// HEAD commit for the branch. The commit that deletes the file will be
  /// created from this commit ID.
  ///
  /// [keepEmptyFolders]: Specifies whether to delete the folder or directory
  /// that contains the file you want to delete if that file is the only object
  /// in the folder or directory. By default, empty folders will be deleted.
  /// This includes empty folders that are part of the directory structure. For
  /// example, if the path to a file is dir1/dir2/dir3/dir4, and dir2 and dir3
  /// are empty, deleting the last file in dir4 will also delete the empty
  /// folders dir4, dir3, and dir2.
  ///
  /// [commitMessage]: The commit message you want to include as part of
  /// deleting the file. Commit messages are limited to 256 KB. If no message is
  /// specified, a default message will be used.
  ///
  /// [name]: The name of the author of the commit that deletes the file. If no
  /// name is specified, the user's ARN will be used as the author name and
  /// committer name.
  ///
  /// [email]: The email address for the commit that deletes the file. If no
  /// email address is specified, the email address will be left blank.
  Future<DeleteFileOutput> deleteFile(
      {@required String repositoryName,
      @required String branchName,
      @required String filePath,
      @required String parentCommitId,
      bool keepEmptyFolders,
      String commitMessage,
      String name,
      String email}) async {
    var response_ = await _client.send('DeleteFile', {
      'repositoryName': repositoryName,
      'branchName': branchName,
      'filePath': filePath,
      'parentCommitId': parentCommitId,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
    return DeleteFileOutput.fromJson(response_);
  }

  /// Deletes a repository. If a specified repository was already deleted, a
  /// null repository ID will be returned.
  ///
  ///
  ///
  /// Deleting a repository also deletes all associated objects and metadata.
  /// After a repository is deleted, all future push calls to the deleted
  /// repository will fail.
  ///
  /// [repositoryName]: The name of the repository to delete.
  Future<DeleteRepositoryOutput> deleteRepository(String repositoryName) async {
    var response_ = await _client.send('DeleteRepository', {
      'repositoryName': repositoryName,
    });
    return DeleteRepositoryOutput.fromJson(response_);
  }

  /// Returns information about one or more merge conflicts in the attempted
  /// merge of two commit specifiers using the squash or three-way merge
  /// strategy. If the merge option for the attempted merge is specified as
  /// FAST_FORWARD_MERGE, an exception will be thrown.
  ///
  /// [repositoryName]: The name of the repository where you want to get
  /// information about a merge conflict.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [mergeOption]: The merge option or strategy you want to use to merge the
  /// code.
  ///
  /// [maxMergeHunks]: The maximum number of merge hunks to include in the
  /// output.
  ///
  /// [filePath]: The path of the target files used to describe the conflicts.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  Future<DescribeMergeConflictsOutput> describeMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      int maxMergeHunks,
      @required String filePath,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String nextToken}) async {
    var response_ = await _client.send('DescribeMergeConflicts', {
      'repositoryName': repositoryName,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'mergeOption': mergeOption,
      if (maxMergeHunks != null) 'maxMergeHunks': maxMergeHunks,
      'filePath': filePath,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return DescribeMergeConflictsOutput.fromJson(response_);
  }

  /// Returns information about one or more pull request events.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [pullRequestEventType]: Optional. The pull request event type about which
  /// you want to return information.
  ///
  /// [actorArn]: The Amazon Resource Name (ARN) of the user whose actions
  /// resulted in the event. Examples include updating the pull request with
  /// additional commits or changing the status of a pull request.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  ///
  /// [maxResults]: A non-negative integer used to limit the number of returned
  /// results. The default is 100 events, which is also the maximum number of
  /// events that can be returned in a result.
  Future<DescribePullRequestEventsOutput> describePullRequestEvents(
      String pullRequestId,
      {String pullRequestEventType,
      String actorArn,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribePullRequestEvents', {
      'pullRequestId': pullRequestId,
      if (pullRequestEventType != null)
        'pullRequestEventType': pullRequestEventType,
      if (actorArn != null) 'actorArn': actorArn,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return DescribePullRequestEventsOutput.fromJson(response_);
  }

  /// Returns the base-64 encoded content of an individual blob within a
  /// repository.
  ///
  /// [repositoryName]: The name of the repository that contains the blob.
  ///
  /// [blobId]: The ID of the blob, which is its SHA-1 pointer.
  Future<GetBlobOutput> getBlob(
      {@required String repositoryName, @required String blobId}) async {
    var response_ = await _client.send('GetBlob', {
      'repositoryName': repositoryName,
      'blobId': blobId,
    });
    return GetBlobOutput.fromJson(response_);
  }

  /// Returns information about a repository branch, including its name and the
  /// last commit ID.
  ///
  /// [repositoryName]: The name of the repository that contains the branch for
  /// which you want to retrieve information.
  ///
  /// [branchName]: The name of the branch for which you want to retrieve
  /// information.
  Future<GetBranchOutput> getBranch(
      {String repositoryName, String branchName}) async {
    var response_ = await _client.send('GetBranch', {
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (branchName != null) 'branchName': branchName,
    });
    return GetBranchOutput.fromJson(response_);
  }

  /// Returns the content of a comment made on a change, file, or commit in a
  /// repository.
  ///
  /// [commentId]: The unique, system-generated ID of the comment. To get this
  /// ID, use GetCommentsForComparedCommit or GetCommentsForPullRequest.
  Future<GetCommentOutput> getComment(String commentId) async {
    var response_ = await _client.send('GetComment', {
      'commentId': commentId,
    });
    return GetCommentOutput.fromJson(response_);
  }

  /// Returns information about comments made on the comparison between two
  /// commits.
  ///
  /// [repositoryName]: The name of the repository where you want to compare
  /// commits.
  ///
  /// [beforeCommitId]: To establish the directionality of the comparison, the
  /// full commit ID of the 'before' commit.
  ///
  /// [afterCommitId]: To establish the directionality of the comparison, the
  /// full commit ID of the 'after' commit.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  ///
  /// [maxResults]: A non-negative integer used to limit the number of returned
  /// results. The default is 100 comments, and is configurable up to 500.
  Future<GetCommentsForComparedCommitOutput> getCommentsForComparedCommit(
      {@required String repositoryName,
      String beforeCommitId,
      @required String afterCommitId,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetCommentsForComparedCommit', {
      'repositoryName': repositoryName,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      'afterCommitId': afterCommitId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetCommentsForComparedCommitOutput.fromJson(response_);
  }

  /// Returns comments made on a pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [repositoryName]: The name of the repository that contains the pull
  /// request.
  ///
  /// [beforeCommitId]: The full commit ID of the commit in the destination
  /// branch that was the tip of the branch at the time the pull request was
  /// created.
  ///
  /// [afterCommitId]: The full commit ID of the commit in the source branch
  /// that was the tip of the branch at the time the comment was made.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  ///
  /// [maxResults]: A non-negative integer used to limit the number of returned
  /// results. The default is 100 comments. You can return up to 500 comments
  /// with a single request.
  Future<GetCommentsForPullRequestOutput> getCommentsForPullRequest(
      String pullRequestId,
      {String repositoryName,
      String beforeCommitId,
      String afterCommitId,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetCommentsForPullRequest', {
      'pullRequestId': pullRequestId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      if (afterCommitId != null) 'afterCommitId': afterCommitId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return GetCommentsForPullRequestOutput.fromJson(response_);
  }

  /// Returns information about a commit, including commit message and committer
  /// information.
  ///
  /// [repositoryName]: The name of the repository to which the commit was made.
  ///
  /// [commitId]: The commit ID. Commit IDs are the full SHA of the commit.
  Future<GetCommitOutput> getCommit(
      {@required String repositoryName, @required String commitId}) async {
    var response_ = await _client.send('GetCommit', {
      'repositoryName': repositoryName,
      'commitId': commitId,
    });
    return GetCommitOutput.fromJson(response_);
  }

  /// Returns information about the differences in a valid commit specifier
  /// (such as a branch, tag, HEAD, commit ID or other fully qualified
  /// reference). Results can be limited to a specified path.
  ///
  /// [repositoryName]: The name of the repository where you want to get
  /// differences.
  ///
  /// [beforeCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, the full commit ID.
  /// Optional. If not specified, all changes prior to the
  /// `afterCommitSpecifier` value will be shown. If you do not use
  /// `beforeCommitSpecifier` in your request, consider limiting the results
  /// with `maxResults`.
  ///
  /// [afterCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit.
  ///
  /// [beforePath]: The file path in which to check for differences. Limits the
  /// results to this path. Can also be used to specify the previous name of a
  /// directory or folder. If `beforePath` and `afterPath` are not specified,
  /// differences will be shown for all paths.
  ///
  /// [afterPath]: The file path in which to check differences. Limits the
  /// results to this path. Can also be used to specify the changed name of a
  /// directory or folder, if it has changed. If not specified, differences will
  /// be shown for all paths.
  ///
  /// [maxResults]: A non-negative integer used to limit the number of returned
  /// results.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  Future<GetDifferencesOutput> getDifferences(
      {@required String repositoryName,
      String beforeCommitSpecifier,
      @required String afterCommitSpecifier,
      String beforePath,
      String afterPath,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('GetDifferences', {
      'repositoryName': repositoryName,
      if (beforeCommitSpecifier != null)
        'beforeCommitSpecifier': beforeCommitSpecifier,
      'afterCommitSpecifier': afterCommitSpecifier,
      if (beforePath != null) 'beforePath': beforePath,
      if (afterPath != null) 'afterPath': afterPath,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return GetDifferencesOutput.fromJson(response_);
  }

  /// Returns the base-64 encoded contents of a specified file and its metadata.
  ///
  /// [repositoryName]: The name of the repository that contains the file.
  ///
  /// [commitSpecifier]: The fully-quaified reference that identifies the commit
  /// that contains the file. For example, you could specify a full commit ID, a
  /// tag, a branch name, or a reference such as refs/heads/master. If none is
  /// provided, then the head commit will be used.
  ///
  /// [filePath]: The fully-qualified path to the file, including the full name
  /// and extension of the file. For example, /examples/file.md is the
  /// fully-qualified path to a file named file.md in a folder named examples.
  Future<GetFileOutput> getFile(
      {@required String repositoryName,
      String commitSpecifier,
      @required String filePath}) async {
    var response_ = await _client.send('GetFile', {
      'repositoryName': repositoryName,
      if (commitSpecifier != null) 'commitSpecifier': commitSpecifier,
      'filePath': filePath,
    });
    return GetFileOutput.fromJson(response_);
  }

  /// Returns the contents of a specified folder in a repository.
  ///
  /// [repositoryName]: The name of the repository.
  ///
  /// [commitSpecifier]: A fully-qualified reference used to identify a commit
  /// that contains the version of the folder's content to return. A
  /// fully-qualified reference can be a commit ID, branch name, tag, or
  /// reference such as HEAD. If no specifier is provided, the folder content
  /// will be returned as it exists in the HEAD commit.
  ///
  /// [folderPath]: The fully-qualified path to the folder whose contents will
  /// be returned, including the folder name. For example, /examples is a
  /// fully-qualified path to a folder named examples that was created off of
  /// the root directory (/) of a repository.
  Future<GetFolderOutput> getFolder(
      {@required String repositoryName,
      String commitSpecifier,
      @required String folderPath}) async {
    var response_ = await _client.send('GetFolder', {
      'repositoryName': repositoryName,
      if (commitSpecifier != null) 'commitSpecifier': commitSpecifier,
      'folderPath': folderPath,
    });
    return GetFolderOutput.fromJson(response_);
  }

  /// Returns information about a specified merge commit.
  ///
  /// [repositoryName]: The name of the repository that contains the merge
  /// commit about which you want to get information.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  Future<GetMergeCommitOutput> getMergeCommit(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String conflictDetailLevel,
      String conflictResolutionStrategy}) async {
    var response_ = await _client.send('GetMergeCommit', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
    });
    return GetMergeCommitOutput.fromJson(response_);
  }

  /// Returns information about merge conflicts between the before and after
  /// commit IDs for a pull request in a repository.
  ///
  /// [repositoryName]: The name of the repository where the pull request was
  /// created.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [mergeOption]: The merge option or strategy you want to use to merge the
  /// code.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [maxConflictFiles]: The maximum number of files to include in the output.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  Future<GetMergeConflictsOutput> getMergeConflicts(
      {@required String repositoryName,
      @required String destinationCommitSpecifier,
      @required String sourceCommitSpecifier,
      @required String mergeOption,
      String conflictDetailLevel,
      int maxConflictFiles,
      String conflictResolutionStrategy,
      String nextToken}) async {
    var response_ = await _client.send('GetMergeConflicts', {
      'repositoryName': repositoryName,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'mergeOption': mergeOption,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (maxConflictFiles != null) 'maxConflictFiles': maxConflictFiles,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return GetMergeConflictsOutput.fromJson(response_);
  }

  /// Returns information about the merge options available for merging two
  /// specified branches. For details about why a particular merge option is not
  /// available, use GetMergeConflicts or DescribeMergeConflicts.
  ///
  /// [repositoryName]: The name of the repository that contains the commits
  /// about which you want to get merge options.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  Future<GetMergeOptionsOutput> getMergeOptions(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String conflictDetailLevel,
      String conflictResolutionStrategy}) async {
    var response_ = await _client.send('GetMergeOptions', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
    });
    return GetMergeOptionsOutput.fromJson(response_);
  }

  /// Gets information about a pull request in a specified repository.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  Future<GetPullRequestOutput> getPullRequest(String pullRequestId) async {
    var response_ = await _client.send('GetPullRequest', {
      'pullRequestId': pullRequestId,
    });
    return GetPullRequestOutput.fromJson(response_);
  }

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
  ///
  /// [repositoryName]: The name of the repository to get information about.
  Future<GetRepositoryOutput> getRepository(String repositoryName) async {
    var response_ = await _client.send('GetRepository', {
      'repositoryName': repositoryName,
    });
    return GetRepositoryOutput.fromJson(response_);
  }

  /// Gets information about triggers configured for a repository.
  ///
  /// [repositoryName]: The name of the repository for which the trigger is
  /// configured.
  Future<GetRepositoryTriggersOutput> getRepositoryTriggers(
      String repositoryName) async {
    var response_ = await _client.send('GetRepositoryTriggers', {
      'repositoryName': repositoryName,
    });
    return GetRepositoryTriggersOutput.fromJson(response_);
  }

  /// Gets information about one or more branches in a repository.
  ///
  /// [repositoryName]: The name of the repository that contains the branches.
  ///
  /// [nextToken]: An enumeration token that allows the operation to batch the
  /// results.
  Future<ListBranchesOutput> listBranches(String repositoryName,
      {String nextToken}) async {
    var response_ = await _client.send('ListBranches', {
      'repositoryName': repositoryName,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListBranchesOutput.fromJson(response_);
  }

  /// Returns a list of pull requests for a specified repository. The return
  /// list can be refined by pull request status or pull request author ARN.
  ///
  /// [repositoryName]: The name of the repository for which you want to list
  /// pull requests.
  ///
  /// [authorArn]: Optional. The Amazon Resource Name (ARN) of the user who
  /// created the pull request. If used, this filters the results to pull
  /// requests created by that user.
  ///
  /// [pullRequestStatus]: Optional. The status of the pull request. If used,
  /// this refines the results to the pull requests that match the specified
  /// status.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  ///
  /// [maxResults]: A non-negative integer used to limit the number of returned
  /// results.
  Future<ListPullRequestsOutput> listPullRequests(String repositoryName,
      {String authorArn,
      String pullRequestStatus,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListPullRequests', {
      'repositoryName': repositoryName,
      if (authorArn != null) 'authorArn': authorArn,
      if (pullRequestStatus != null) 'pullRequestStatus': pullRequestStatus,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListPullRequestsOutput.fromJson(response_);
  }

  /// Gets information about one or more repositories.
  ///
  /// [nextToken]: An enumeration token that allows the operation to batch the
  /// results of the operation. Batch sizes are 1,000 for list repository
  /// operations. When the client sends the token back to AWS CodeCommit,
  /// another page of 1,000 records is retrieved.
  ///
  /// [sortBy]: The criteria used to sort the results of a list repositories
  /// operation.
  ///
  /// [order]: The order in which to sort the results of a list repositories
  /// operation.
  Future<ListRepositoriesOutput> listRepositories(
      {String nextToken, String sortBy, String order}) async {
    var response_ = await _client.send('ListRepositories', {
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
      if (order != null) 'order': order,
    });
    return ListRepositoriesOutput.fromJson(response_);
  }

  /// Gets information about AWS tags for a specified Amazon Resource Name (ARN)
  /// in AWS CodeCommit. For a list of valid resources in AWS CodeCommit, see
  /// [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource for which
  /// you want to get information about tags, if any.
  ///
  /// [nextToken]: An enumeration token that when provided in a request, returns
  /// the next batch of the results.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {String nextToken}) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListTagsForResourceOutput.fromJson(response_);
  }

  /// Merges two branches using the fast-forward merge strategy.
  ///
  /// [repositoryName]: The name of the repository where you want to merge two
  /// branches.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [targetBranch]: The branch where the merge will be applied.
  Future<MergeBranchesByFastForwardOutput> mergeBranchesByFastForward(
      {@required String repositoryName,
      @required String sourceCommitSpecifier,
      @required String destinationCommitSpecifier,
      String targetBranch}) async {
    var response_ = await _client.send('MergeBranchesByFastForward', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      if (targetBranch != null) 'targetBranch': targetBranch,
    });
    return MergeBranchesByFastForwardOutput.fromJson(response_);
  }

  /// Merges two branches using the squash merge strategy.
  ///
  /// [repositoryName]: The name of the repository where you want to merge two
  /// branches.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [targetBranch]: The branch where the merge will be applied.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [authorName]: The name of the author who created the commit. This
  /// information will be used as both the author and committer for the commit.
  ///
  /// [email]: The email address of the person merging the branches. This
  /// information will be used in the commit information for the merge.
  ///
  /// [commitMessage]: The commit message for the merge.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [conflictResolution]: A list of inputs to use when resolving conflicts
  /// during a merge if AUTOMERGE is chosen as the conflict resolution strategy.
  Future<MergeBranchesBySquashOutput> mergeBranchesBySquash(
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
      ConflictResolution conflictResolution}) async {
    var response_ = await _client.send('MergeBranchesBySquash', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      if (targetBranch != null) 'targetBranch': targetBranch,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
    });
    return MergeBranchesBySquashOutput.fromJson(response_);
  }

  /// Merges two specified branches using the three-way merge strategy.
  ///
  /// [repositoryName]: The name of the repository where you want to merge two
  /// branches.
  ///
  /// [sourceCommitSpecifier]: The branch, tag, HEAD, or other fully qualified
  /// reference used to identify a commit. For example, a branch name or a full
  /// commit ID.
  ///
  /// [destinationCommitSpecifier]: The branch, tag, HEAD, or other fully
  /// qualified reference used to identify a commit. For example, a branch name
  /// or a full commit ID.
  ///
  /// [targetBranch]: The branch where the merge will be applied.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [authorName]: The name of the author who created the commit. This
  /// information will be used as both the author and committer for the commit.
  ///
  /// [email]: The email address of the person merging the branches. This
  /// information will be used in the commit information for the merge.
  ///
  /// [commitMessage]: The commit message to include in the commit information
  /// for the merge.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [conflictResolution]: A list of inputs to use when resolving conflicts
  /// during a merge if AUTOMERGE is chosen as the conflict resolution strategy.
  Future<MergeBranchesByThreeWayOutput> mergeBranchesByThreeWay(
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
      ConflictResolution conflictResolution}) async {
    var response_ = await _client.send('MergeBranchesByThreeWay', {
      'repositoryName': repositoryName,
      'sourceCommitSpecifier': sourceCommitSpecifier,
      'destinationCommitSpecifier': destinationCommitSpecifier,
      if (targetBranch != null) 'targetBranch': targetBranch,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
    });
    return MergeBranchesByThreeWayOutput.fromJson(response_);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// fast-forward merge strategy. If the merge is successful, it closes the
  /// pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [repositoryName]: The name of the repository where the pull request was
  /// created.
  ///
  /// [sourceCommitId]: The full commit ID of the original or updated commit in
  /// the pull request source branch. Pass this value if you want an exception
  /// thrown if the current commit ID of the tip of the source branch does not
  /// match this commit ID.
  Future<MergePullRequestByFastForwardOutput> mergePullRequestByFastForward(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId}) async {
    var response_ = await _client.send('MergePullRequestByFastForward', {
      'pullRequestId': pullRequestId,
      'repositoryName': repositoryName,
      if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
    });
    return MergePullRequestByFastForwardOutput.fromJson(response_);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// squash merge strategy. If the merge is successful, it closes the pull
  /// request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [repositoryName]: The name of the repository where the pull request was
  /// created.
  ///
  /// [sourceCommitId]: The full commit ID of the original or updated commit in
  /// the pull request source branch. Pass this value if you want an exception
  /// thrown if the current commit ID of the tip of the source branch does not
  /// match this commit ID.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [commitMessage]: The commit message to include in the commit information
  /// for the merge.
  ///
  /// [authorName]: The name of the author who created the commit. This
  /// information will be used as both the author and committer for the commit.
  ///
  /// [email]: The email address of the person merging the branches. This
  /// information will be used in the commit information for the merge.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [conflictResolution]: A list of inputs to use when resolving conflicts
  /// during a merge if AUTOMERGE is chosen as the conflict resolution strategy.
  Future<MergePullRequestBySquashOutput> mergePullRequestBySquash(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String commitMessage,
      String authorName,
      String email,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {
    var response_ = await _client.send('MergePullRequestBySquash', {
      'pullRequestId': pullRequestId,
      'repositoryName': repositoryName,
      if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
    });
    return MergePullRequestBySquashOutput.fromJson(response_);
  }

  /// Attempts to merge the source commit of a pull request into the specified
  /// destination branch for that pull request at the specified commit using the
  /// three-way merge strategy. If the merge is successful, it closes the pull
  /// request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [repositoryName]: The name of the repository where the pull request was
  /// created.
  ///
  /// [sourceCommitId]: The full commit ID of the original or updated commit in
  /// the pull request source branch. Pass this value if you want an exception
  /// thrown if the current commit ID of the tip of the source branch does not
  /// match this commit ID.
  ///
  /// [conflictDetailLevel]: The level of conflict detail to use. If
  /// unspecified, the default FILE_LEVEL is used, which will return a not
  /// mergeable result if the same file has differences in both branches. If
  /// LINE_LEVEL is specified, a conflict will be considered not mergeable if
  /// the same file in both branches has differences on the same line.
  ///
  /// [conflictResolutionStrategy]: Specifies which branch to use when resolving
  /// conflicts, or whether to attempt automatically merging two versions of a
  /// file. The default is NONE, which requires any conflicts to be resolved
  /// manually before the merge operation will be successful.
  ///
  /// [commitMessage]: The commit message to include in the commit information
  /// for the merge.
  ///
  /// [authorName]: The name of the author who created the commit. This
  /// information will be used as both the author and committer for the commit.
  ///
  /// [email]: The email address of the person merging the branches. This
  /// information will be used in the commit information for the merge.
  ///
  /// [keepEmptyFolders]: If the commit contains deletions, whether to keep a
  /// folder or folder structure if the changes leave the folders empty. If this
  /// is specified as true, a .gitkeep file will be created for empty folders.
  /// The default is false.
  ///
  /// [conflictResolution]: A list of inputs to use when resolving conflicts
  /// during a merge if AUTOMERGE is chosen as the conflict resolution strategy.
  Future<MergePullRequestByThreeWayOutput> mergePullRequestByThreeWay(
      {@required String pullRequestId,
      @required String repositoryName,
      String sourceCommitId,
      String conflictDetailLevel,
      String conflictResolutionStrategy,
      String commitMessage,
      String authorName,
      String email,
      bool keepEmptyFolders,
      ConflictResolution conflictResolution}) async {
    var response_ = await _client.send('MergePullRequestByThreeWay', {
      'pullRequestId': pullRequestId,
      'repositoryName': repositoryName,
      if (sourceCommitId != null) 'sourceCommitId': sourceCommitId,
      if (conflictDetailLevel != null)
        'conflictDetailLevel': conflictDetailLevel,
      if (conflictResolutionStrategy != null)
        'conflictResolutionStrategy': conflictResolutionStrategy,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (authorName != null) 'authorName': authorName,
      if (email != null) 'email': email,
      if (keepEmptyFolders != null) 'keepEmptyFolders': keepEmptyFolders,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
    });
    return MergePullRequestByThreeWayOutput.fromJson(response_);
  }

  /// Posts a comment on the comparison between two commits.
  ///
  /// [repositoryName]: The name of the repository where you want to post a
  /// comment on the comparison between commits.
  ///
  /// [beforeCommitId]: To establish the directionality of the comparison, the
  /// full commit ID of the 'before' commit.
  ///
  ///
  ///
  /// This is required for commenting on any commit unless that commit is the
  /// initial commit.
  ///
  /// [afterCommitId]: To establish the directionality of the comparison, the
  /// full commit ID of the 'after' commit.
  ///
  /// [location]: The location of the comparison where you want to comment.
  ///
  /// [content]: The content of the comment you want to make.
  ///
  /// [clientRequestToken]: A unique, client-generated idempotency token that
  /// when provided in a request, ensures the request cannot be repeated with a
  /// changed parameter. If a request is received with the same parameters and a
  /// token is included, the request will return information about the initial
  /// request that used that token.
  Future<PostCommentForComparedCommitOutput> postCommentForComparedCommit(
      {@required String repositoryName,
      String beforeCommitId,
      @required String afterCommitId,
      Location location,
      @required String content,
      String clientRequestToken}) async {
    var response_ = await _client.send('PostCommentForComparedCommit', {
      'repositoryName': repositoryName,
      if (beforeCommitId != null) 'beforeCommitId': beforeCommitId,
      'afterCommitId': afterCommitId,
      if (location != null) 'location': location,
      'content': content,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return PostCommentForComparedCommitOutput.fromJson(response_);
  }

  /// Posts a comment on a pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [repositoryName]: The name of the repository where you want to post a
  /// comment on a pull request.
  ///
  /// [beforeCommitId]: The full commit ID of the commit in the destination
  /// branch that was the tip of the branch at the time the pull request was
  /// created.
  ///
  /// [afterCommitId]: The full commit ID of the commit in the source branch
  /// that is the current tip of the branch for the pull request when you post
  /// the comment.
  ///
  /// [location]: The location of the change where you want to post your
  /// comment. If no location is provided, the comment will be posted as a
  /// general comment on the pull request difference between the before commit
  /// ID and the after commit ID.
  ///
  /// [content]: The content of your comment on the change.
  ///
  /// [clientRequestToken]: A unique, client-generated idempotency token that
  /// when provided in a request, ensures the request cannot be repeated with a
  /// changed parameter. If a request is received with the same parameters and a
  /// token is included, the request will return information about the initial
  /// request that used that token.
  Future<PostCommentForPullRequestOutput> postCommentForPullRequest(
      {@required String pullRequestId,
      @required String repositoryName,
      @required String beforeCommitId,
      @required String afterCommitId,
      Location location,
      @required String content,
      String clientRequestToken}) async {
    var response_ = await _client.send('PostCommentForPullRequest', {
      'pullRequestId': pullRequestId,
      'repositoryName': repositoryName,
      'beforeCommitId': beforeCommitId,
      'afterCommitId': afterCommitId,
      if (location != null) 'location': location,
      'content': content,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return PostCommentForPullRequestOutput.fromJson(response_);
  }

  /// Posts a comment in reply to an existing comment on a comparison between
  /// commits or a pull request.
  ///
  /// [inReplyTo]: The system-generated ID of the comment to which you want to
  /// reply. To get this ID, use GetCommentsForComparedCommit or
  /// GetCommentsForPullRequest.
  ///
  /// [clientRequestToken]: A unique, client-generated idempotency token that
  /// when provided in a request, ensures the request cannot be repeated with a
  /// changed parameter. If a request is received with the same parameters and a
  /// token is included, the request will return information about the initial
  /// request that used that token.
  ///
  /// [content]: The contents of your reply to a comment.
  Future<PostCommentReplyOutput> postCommentReply(
      {@required String inReplyTo,
      String clientRequestToken,
      @required String content}) async {
    var response_ = await _client.send('PostCommentReply', {
      'inReplyTo': inReplyTo,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      'content': content,
    });
    return PostCommentReplyOutput.fromJson(response_);
  }

  /// Adds or updates a file in a branch in an AWS CodeCommit repository, and
  /// generates a commit for the addition in the specified branch.
  ///
  /// [repositoryName]: The name of the repository where you want to add or
  /// update the file.
  ///
  /// [branchName]: The name of the branch where you want to add or update the
  /// file. If this is an empty repository, this branch will be created.
  ///
  /// [fileContent]: The content of the file, in binary object format.
  ///
  /// [filePath]: The name of the file you want to add or update, including the
  /// relative path to the file in the repository.
  ///
  ///
  ///
  /// If the path does not currently exist in the repository, the path will be
  /// created as part of adding the file.
  ///
  /// [fileMode]: The file mode permissions of the blob. Valid file mode
  /// permissions are listed below.
  ///
  /// [parentCommitId]: The full commit ID of the head commit in the branch
  /// where you want to add or update the file. If this is an empty repository,
  /// no commit ID is required. If this is not an empty repository, a commit ID
  /// is required.
  ///
  /// The commit ID must match the ID of the head commit at the time of the
  /// operation, or an error will occur, and the file will not be added or
  /// updated.
  ///
  /// [commitMessage]: A message about why this file was added or updated. While
  /// optional, adding a message is strongly encouraged in order to provide a
  /// more useful commit history for your repository.
  ///
  /// [name]: The name of the person adding or updating the file. While
  /// optional, adding a name is strongly encouraged in order to provide a more
  /// useful commit history for your repository.
  ///
  /// [email]: An email address for the person adding or updating the file.
  Future<PutFileOutput> putFile(
      {@required String repositoryName,
      @required String branchName,
      @required Uint8List fileContent,
      @required String filePath,
      String fileMode,
      String parentCommitId,
      String commitMessage,
      String name,
      String email}) async {
    var response_ = await _client.send('PutFile', {
      'repositoryName': repositoryName,
      'branchName': branchName,
      'fileContent': fileContent,
      'filePath': filePath,
      if (fileMode != null) 'fileMode': fileMode,
      if (parentCommitId != null) 'parentCommitId': parentCommitId,
      if (commitMessage != null) 'commitMessage': commitMessage,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    });
    return PutFileOutput.fromJson(response_);
  }

  /// Replaces all triggers for a repository. This can be used to create or
  /// delete triggers.
  ///
  /// [repositoryName]: The name of the repository where you want to create or
  /// update the trigger.
  ///
  /// [triggers]: The JSON block of configuration information for each trigger.
  Future<PutRepositoryTriggersOutput> putRepositoryTriggers(
      {@required String repositoryName,
      @required List<RepositoryTrigger> triggers}) async {
    var response_ = await _client.send('PutRepositoryTriggers', {
      'repositoryName': repositoryName,
      'triggers': triggers,
    });
    return PutRepositoryTriggersOutput.fromJson(response_);
  }

  /// Adds or updates tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see
  /// [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to which you
  /// want to add or update tags.
  ///
  /// [tags]: The key-value pair to use when tagging this repository.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
  }

  /// Tests the functionality of repository triggers by sending information to
  /// the trigger target. If real data is available in the repository, the test
  /// will send data from the last commit. If no data is available, sample data
  /// will be generated.
  ///
  /// [repositoryName]: The name of the repository in which to test the
  /// triggers.
  ///
  /// [triggers]: The list of triggers to test.
  Future<TestRepositoryTriggersOutput> testRepositoryTriggers(
      {@required String repositoryName,
      @required List<RepositoryTrigger> triggers}) async {
    var response_ = await _client.send('TestRepositoryTriggers', {
      'repositoryName': repositoryName,
      'triggers': triggers,
    });
    return TestRepositoryTriggersOutput.fromJson(response_);
  }

  /// Removes tags for a resource in AWS CodeCommit. For a list of valid
  /// resources in AWS CodeCommit, see
  /// [CodeCommit Resources and Operations](https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-access-control-identity-based.html#arn-formats)
  /// in the AWS CodeCommit User Guide.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to which you
  /// want to remove tags.
  ///
  /// [tagKeys]: The tag key for each tag that you want to remove from the
  /// resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
  }

  /// Replaces the contents of a comment.
  ///
  /// [commentId]: The system-generated ID of the comment you want to update. To
  /// get this ID, use GetCommentsForComparedCommit or
  /// GetCommentsForPullRequest.
  ///
  /// [content]: The updated content with which you want to replace the existing
  /// content of the comment.
  Future<UpdateCommentOutput> updateComment(
      {@required String commentId, @required String content}) async {
    var response_ = await _client.send('UpdateComment', {
      'commentId': commentId,
      'content': content,
    });
    return UpdateCommentOutput.fromJson(response_);
  }

  /// Sets or changes the default branch name for the specified repository.
  ///
  ///
  ///
  /// If you use this operation to change the default branch name to the current
  /// default branch name, a success message is returned even though the default
  /// branch did not change.
  ///
  /// [repositoryName]: The name of the repository to set or change the default
  /// branch for.
  ///
  /// [defaultBranchName]: The name of the branch to set as the default.
  Future<void> updateDefaultBranch(
      {@required String repositoryName,
      @required String defaultBranchName}) async {
    await _client.send('UpdateDefaultBranch', {
      'repositoryName': repositoryName,
      'defaultBranchName': defaultBranchName,
    });
  }

  /// Replaces the contents of the description of a pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [description]: The updated content of the description for the pull
  /// request. This content will replace the existing description.
  Future<UpdatePullRequestDescriptionOutput> updatePullRequestDescription(
      {@required String pullRequestId, @required String description}) async {
    var response_ = await _client.send('UpdatePullRequestDescription', {
      'pullRequestId': pullRequestId,
      'description': description,
    });
    return UpdatePullRequestDescriptionOutput.fromJson(response_);
  }

  /// Updates the status of a pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [pullRequestStatus]: The status of the pull request. The only valid
  /// operations are to update the status from `OPEN` to `OPEN`, `OPEN` to
  /// `CLOSED` or from from `CLOSED` to `CLOSED`.
  Future<UpdatePullRequestStatusOutput> updatePullRequestStatus(
      {@required String pullRequestId,
      @required String pullRequestStatus}) async {
    var response_ = await _client.send('UpdatePullRequestStatus', {
      'pullRequestId': pullRequestId,
      'pullRequestStatus': pullRequestStatus,
    });
    return UpdatePullRequestStatusOutput.fromJson(response_);
  }

  /// Replaces the title of a pull request.
  ///
  /// [pullRequestId]: The system-generated ID of the pull request. To get this
  /// ID, use ListPullRequests.
  ///
  /// [title]: The updated title of the pull request. This will replace the
  /// existing title.
  Future<UpdatePullRequestTitleOutput> updatePullRequestTitle(
      {@required String pullRequestId, @required String title}) async {
    var response_ = await _client.send('UpdatePullRequestTitle', {
      'pullRequestId': pullRequestId,
      'title': title,
    });
    return UpdatePullRequestTitleOutput.fromJson(response_);
  }

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
  ///
  /// [repositoryName]: The name of the repository to set or change the comment
  /// or description for.
  ///
  /// [repositoryDescription]: The new comment or description for the specified
  /// repository. Repository descriptions are limited to 1,000 characters.
  Future<void> updateRepositoryDescription(String repositoryName,
      {String repositoryDescription}) async {
    await _client.send('UpdateRepositoryDescription', {
      'repositoryName': repositoryName,
      if (repositoryDescription != null)
        'repositoryDescription': repositoryDescription,
    });
  }

  /// Renames a repository. The repository name must be unique across the
  /// calling AWS account. In addition, repository names are limited to 100
  /// alphanumeric, dash, and underscore characters, and cannot include certain
  /// characters. The suffix ".git" is prohibited. For a full description of the
  /// limits on repository names, see
  /// [Limits](https://docs.aws.amazon.com/codecommit/latest/userguide/limits.html)
  /// in the AWS CodeCommit User Guide.
  ///
  /// [oldName]: The existing name of the repository.
  ///
  /// [newName]: The new name for the repository.
  Future<void> updateRepositoryName(
      {@required String oldName, @required String newName}) async {
    await _client.send('UpdateRepositoryName', {
      'oldName': oldName,
      'newName': newName,
    });
  }
}

/// Information about errors in a BatchDescribeMergeConflicts operation.
class BatchDescribeMergeConflictsError {
  /// The path to the file.
  final String filePath;

  /// The name of the exception.
  final String exceptionName;

  /// The message provided by the exception.
  final String message;

  BatchDescribeMergeConflictsError({
    @required this.filePath,
    @required this.exceptionName,
    @required this.message,
  });
  static BatchDescribeMergeConflictsError fromJson(Map<String, dynamic> json) =>
      BatchDescribeMergeConflictsError(
        filePath: json['filePath'] as String,
        exceptionName: json['exceptionName'] as String,
        message: json['message'] as String,
      );
}

class BatchDescribeMergeConflictsOutput {
  /// A list of conflicts for each file, including the conflict metadata and the
  /// hunks of the differences between the files.
  final List<Conflict> conflicts;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  /// A list of any errors returned while describing the merge conflicts for
  /// each file.
  final List<BatchDescribeMergeConflictsError> errors;

  /// The commit ID of the destination commit specifier that was used in the
  /// merge evaluation.
  final String destinationCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String baseCommitId;

  BatchDescribeMergeConflictsOutput({
    @required this.conflicts,
    this.nextToken,
    this.errors,
    @required this.destinationCommitId,
    @required this.sourceCommitId,
    this.baseCommitId,
  });
  static BatchDescribeMergeConflictsOutput fromJson(
          Map<String, dynamic> json) =>
      BatchDescribeMergeConflictsOutput(
        conflicts: (json['conflicts'] as List)
            .map((e) => Conflict.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        errors: json.containsKey('errors')
            ? (json['errors'] as List)
                .map((e) => BatchDescribeMergeConflictsError.fromJson(e))
                .toList()
            : null,
        destinationCommitId: json['destinationCommitId'] as String,
        sourceCommitId: json['sourceCommitId'] as String,
        baseCommitId: json.containsKey('baseCommitId')
            ? json['baseCommitId'] as String
            : null,
      );
}

/// Returns information about errors in a BatchGetCommits operation.
class BatchGetCommitsError {
  /// A commit ID that either could not be found or was not in a valid format.
  final String commitId;

  /// An error code that specifies whether the commit ID was not valid or not
  /// found.
  final String errorCode;

  /// An error message that provides detail about why the commit ID either was
  /// not found or was not valid.
  final String errorMessage;

  BatchGetCommitsError({
    this.commitId,
    this.errorCode,
    this.errorMessage,
  });
  static BatchGetCommitsError fromJson(Map<String, dynamic> json) =>
      BatchGetCommitsError(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
      );
}

class BatchGetCommitsOutput {
  /// An array of commit data type objects, each of which contains information
  /// about a specified commit.
  final List<Commit> commits;

  /// Returns any commit IDs for which information could not be found. For
  /// example, if one of the commit IDs was a shortened SHA or that commit was
  /// not found in the specified repository, the ID will return an error object
  /// with additional information.
  final List<BatchGetCommitsError> errors;

  BatchGetCommitsOutput({
    this.commits,
    this.errors,
  });
  static BatchGetCommitsOutput fromJson(Map<String, dynamic> json) =>
      BatchGetCommitsOutput(
        commits: json.containsKey('commits')
            ? (json['commits'] as List).map((e) => Commit.fromJson(e)).toList()
            : null,
        errors: json.containsKey('errors')
            ? (json['errors'] as List)
                .map((e) => BatchGetCommitsError.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the output of a batch get repositories operation.
class BatchGetRepositoriesOutput {
  /// A list of repositories returned by the batch get repositories operation.
  final List<RepositoryMetadata> repositories;

  /// Returns a list of repository names for which information could not be
  /// found.
  final List<String> repositoriesNotFound;

  BatchGetRepositoriesOutput({
    this.repositories,
    this.repositoriesNotFound,
  });
  static BatchGetRepositoriesOutput fromJson(Map<String, dynamic> json) =>
      BatchGetRepositoriesOutput(
        repositories: json.containsKey('repositories')
            ? (json['repositories'] as List)
                .map((e) => RepositoryMetadata.fromJson(e))
                .toList()
            : null,
        repositoriesNotFound: json.containsKey('repositoriesNotFound')
            ? (json['repositoriesNotFound'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

/// Returns information about a specific Git blob object.
class BlobMetadata {
  /// The full ID of the blob.
  final String blobId;

  /// The path to the blob and any associated file name, if any.
  final String path;

  /// The file mode permissions of the blob. File mode permission codes include:
  ///
  /// *    `100644` indicates read/write
  ///
  /// *    `100755` indicates read/write/execute
  ///
  /// *    `160000` indicates a submodule
  ///
  /// *    `120000` indicates a symlink
  final String mode;

  BlobMetadata({
    this.blobId,
    this.path,
    this.mode,
  });
  static BlobMetadata fromJson(Map<String, dynamic> json) => BlobMetadata(
        blobId: json.containsKey('blobId') ? json['blobId'] as String : null,
        path: json.containsKey('path') ? json['path'] as String : null,
        mode: json.containsKey('mode') ? json['mode'] as String : null,
      );
}

/// Returns information about a branch.
class BranchInfo {
  /// The name of the branch.
  final String branchName;

  /// The ID of the last commit made to the branch.
  final String commitId;

  BranchInfo({
    this.branchName,
    this.commitId,
  });
  static BranchInfo fromJson(Map<String, dynamic> json) => BranchInfo(
        branchName: json.containsKey('branchName')
            ? json['branchName'] as String
            : null,
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
      );
}

/// Returns information about a specific comment.
class Comment {
  /// The system-generated comment ID.
  final String commentId;

  /// The content of the comment.
  final String content;

  /// The ID of the comment for which this comment is a reply, if any.
  final String inReplyTo;

  /// The date and time the comment was created, in timestamp format.
  final DateTime creationDate;

  /// The date and time the comment was most recently modified, in timestamp
  /// format.
  final DateTime lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the person who posted the comment.
  final String authorArn;

  /// A Boolean value indicating whether the comment has been deleted.
  final bool deleted;

  /// A unique, client-generated idempotency token that when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request will return information about the initial request that used
  /// that token.
  final String clientRequestToken;

  Comment({
    this.commentId,
    this.content,
    this.inReplyTo,
    this.creationDate,
    this.lastModifiedDate,
    this.authorArn,
    this.deleted,
    this.clientRequestToken,
  });
  static Comment fromJson(Map<String, dynamic> json) => Comment(
        commentId:
            json.containsKey('commentId') ? json['commentId'] as String : null,
        content: json.containsKey('content') ? json['content'] as String : null,
        inReplyTo:
            json.containsKey('inReplyTo') ? json['inReplyTo'] as String : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        authorArn:
            json.containsKey('authorArn') ? json['authorArn'] as String : null,
        deleted: json.containsKey('deleted') ? json['deleted'] as bool : null,
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
      );
}

/// Returns information about comments on the comparison between two commits.
class CommentsForComparedCommit {
  /// The name of the repository that contains the compared commits.
  final String repositoryName;

  /// The full commit ID of the commit used to establish the 'before' of the
  /// comparison.
  final String beforeCommitId;

  /// The full commit ID of the commit used to establish the 'after' of the
  /// comparison.
  final String afterCommitId;

  /// The full blob ID of the commit used to establish the 'before' of the
  /// comparison.
  final String beforeBlobId;

  /// The full blob ID of the commit used to establish the 'after' of the
  /// comparison.
  final String afterBlobId;

  /// Location information about the comment on the comparison, including the
  /// file name, line number, and whether the version of the file where the
  /// comment was made is 'BEFORE' or 'AFTER'.
  final Location location;

  /// An array of comment objects. Each comment object contains information
  /// about a comment on the comparison between commits.
  final List<Comment> comments;

  CommentsForComparedCommit({
    this.repositoryName,
    this.beforeCommitId,
    this.afterCommitId,
    this.beforeBlobId,
    this.afterBlobId,
    this.location,
    this.comments,
  });
  static CommentsForComparedCommit fromJson(Map<String, dynamic> json) =>
      CommentsForComparedCommit(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        beforeCommitId: json.containsKey('beforeCommitId')
            ? json['beforeCommitId'] as String
            : null,
        afterCommitId: json.containsKey('afterCommitId')
            ? json['afterCommitId'] as String
            : null,
        beforeBlobId: json.containsKey('beforeBlobId')
            ? json['beforeBlobId'] as String
            : null,
        afterBlobId: json.containsKey('afterBlobId')
            ? json['afterBlobId'] as String
            : null,
        location: json.containsKey('location')
            ? Location.fromJson(json['location'])
            : null,
        comments: json.containsKey('comments')
            ? (json['comments'] as List)
                .map((e) => Comment.fromJson(e))
                .toList()
            : null,
      );
}

/// Returns information about comments on a pull request.
class CommentsForPullRequest {
  /// The system-generated ID of the pull request.
  final String pullRequestId;

  /// The name of the repository that contains the pull request.
  final String repositoryName;

  /// The full commit ID of the commit that was the tip of the destination
  /// branch when the pull request was created. This commit will be superceded
  /// by the after commit in the source branch when and if you merge the source
  /// branch into the destination branch.
  final String beforeCommitId;

  /// he full commit ID of the commit that was the tip of the source branch at
  /// the time the comment was made.
  final String afterCommitId;

  /// The full blob ID of the file on which you want to comment on the
  /// destination commit.
  final String beforeBlobId;

  /// The full blob ID of the file on which you want to comment on the source
  /// commit.
  final String afterBlobId;

  /// Location information about the comment on the pull request, including the
  /// file name, line number, and whether the version of the file where the
  /// comment was made is 'BEFORE' (destination branch) or 'AFTER' (source
  /// branch).
  final Location location;

  /// An array of comment objects. Each comment object contains information
  /// about a comment on the pull request.
  final List<Comment> comments;

  CommentsForPullRequest({
    this.pullRequestId,
    this.repositoryName,
    this.beforeCommitId,
    this.afterCommitId,
    this.beforeBlobId,
    this.afterBlobId,
    this.location,
    this.comments,
  });
  static CommentsForPullRequest fromJson(Map<String, dynamic> json) =>
      CommentsForPullRequest(
        pullRequestId: json.containsKey('pullRequestId')
            ? json['pullRequestId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        beforeCommitId: json.containsKey('beforeCommitId')
            ? json['beforeCommitId'] as String
            : null,
        afterCommitId: json.containsKey('afterCommitId')
            ? json['afterCommitId'] as String
            : null,
        beforeBlobId: json.containsKey('beforeBlobId')
            ? json['beforeBlobId'] as String
            : null,
        afterBlobId: json.containsKey('afterBlobId')
            ? json['afterBlobId'] as String
            : null,
        location: json.containsKey('location')
            ? Location.fromJson(json['location'])
            : null,
        comments: json.containsKey('comments')
            ? (json['comments'] as List)
                .map((e) => Comment.fromJson(e))
                .toList()
            : null,
      );
}

/// Returns information about a specific commit.
class Commit {
  /// The full SHA of the specified commit.
  final String commitId;

  /// Tree information for the specified commit.
  final String treeId;

  /// A list of parent commits for the specified commit. Each parent commit ID
  /// is the full commit ID.
  final List<String> parents;

  /// The commit message associated with the specified commit.
  final String message;

  /// Information about the author of the specified commit. Information includes
  /// the date in timestamp format with GMT offset, the name of the author, and
  /// the email address for the author, as configured in Git.
  final UserInfo author;

  /// Information about the person who committed the specified commit, also
  /// known as the committer. Information includes the date in timestamp format
  /// with GMT offset, the name of the committer, and the email address for the
  /// committer, as configured in Git.
  ///
  /// For more information about the difference between an author and a
  /// committer in Git, see
  /// [Viewing the Commit History](http://git-scm.com/book/ch2-3.html) in Pro
  /// Git by Scott Chacon and Ben Straub.
  final UserInfo committer;

  /// Any additional data associated with the specified commit.
  final String additionalData;

  Commit({
    this.commitId,
    this.treeId,
    this.parents,
    this.message,
    this.author,
    this.committer,
    this.additionalData,
  });
  static Commit fromJson(Map<String, dynamic> json) => Commit(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
        parents: json.containsKey('parents')
            ? (json['parents'] as List).map((e) => e as String).toList()
            : null,
        message: json.containsKey('message') ? json['message'] as String : null,
        author: json.containsKey('author')
            ? UserInfo.fromJson(json['author'])
            : null,
        committer: json.containsKey('committer')
            ? UserInfo.fromJson(json['committer'])
            : null,
        additionalData: json.containsKey('additionalData')
            ? json['additionalData'] as String
            : null,
      );
}

/// Information about conflicts in a merge operation.
class Conflict {
  /// Metadata about a conflict in a merge operation.
  final ConflictMetadata conflictMetadata;

  /// A list of hunks that contain the differences between files or lines
  /// causing the conflict.
  final List<MergeHunk> mergeHunks;

  Conflict({
    this.conflictMetadata,
    this.mergeHunks,
  });
  static Conflict fromJson(Map<String, dynamic> json) => Conflict(
        conflictMetadata: json.containsKey('conflictMetadata')
            ? ConflictMetadata.fromJson(json['conflictMetadata'])
            : null,
        mergeHunks: json.containsKey('mergeHunks')
            ? (json['mergeHunks'] as List)
                .map((e) => MergeHunk.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about the metadata for a conflict in a merge operation.
class ConflictMetadata {
  /// The path of the file that contains conflicts.
  final String filePath;

  /// The file sizes of the file in the source, destination, and base of the
  /// merge.
  final FileSizes fileSizes;

  /// The file modes of the file in the source, destination, and base of the
  /// merge.
  final FileModes fileModes;

  /// Information about any object type conflicts in a merge operation.
  final ObjectTypes objectTypes;

  /// The number of conflicts, including both hunk conflicts and metadata
  /// conflicts.
  final int numberOfConflicts;

  /// A boolean value (true or false) indicating whether the file is binary or
  /// textual in the source, destination, and base of the merge.
  final IsBinaryFile isBinaryFile;

  /// A boolean value indicating whether there are conflicts in the content of a
  /// file.
  final bool contentConflict;

  /// A boolean value indicating whether there are conflicts in the file mode of
  /// a file.
  final bool fileModeConflict;

  /// A boolean value (true or false) indicating whether there are conflicts
  /// between the branches in the object type of a file, folder, or submodule.
  final bool objectTypeConflict;

  /// Whether an add, modify, or delete operation caused the conflict between
  /// the source and destination of the merge.
  final MergeOperations mergeOperations;

  ConflictMetadata({
    this.filePath,
    this.fileSizes,
    this.fileModes,
    this.objectTypes,
    this.numberOfConflicts,
    this.isBinaryFile,
    this.contentConflict,
    this.fileModeConflict,
    this.objectTypeConflict,
    this.mergeOperations,
  });
  static ConflictMetadata fromJson(Map<String, dynamic> json) =>
      ConflictMetadata(
        filePath:
            json.containsKey('filePath') ? json['filePath'] as String : null,
        fileSizes: json.containsKey('fileSizes')
            ? FileSizes.fromJson(json['fileSizes'])
            : null,
        fileModes: json.containsKey('fileModes')
            ? FileModes.fromJson(json['fileModes'])
            : null,
        objectTypes: json.containsKey('objectTypes')
            ? ObjectTypes.fromJson(json['objectTypes'])
            : null,
        numberOfConflicts: json.containsKey('numberOfConflicts')
            ? json['numberOfConflicts'] as int
            : null,
        isBinaryFile: json.containsKey('isBinaryFile')
            ? IsBinaryFile.fromJson(json['isBinaryFile'])
            : null,
        contentConflict: json.containsKey('contentConflict')
            ? json['contentConflict'] as bool
            : null,
        fileModeConflict: json.containsKey('fileModeConflict')
            ? json['fileModeConflict'] as bool
            : null,
        objectTypeConflict: json.containsKey('objectTypeConflict')
            ? json['objectTypeConflict'] as bool
            : null,
        mergeOperations: json.containsKey('mergeOperations')
            ? MergeOperations.fromJson(json['mergeOperations'])
            : null,
      );
}

/// A list of inputs to use when resolving conflicts during a merge if AUTOMERGE
/// is chosen as the conflict resolution strategy.
class ConflictResolution {
  /// Files that will have content replaced as part of the merge conflict
  /// resolution.
  final List<ReplaceContentEntry> replaceContents;

  /// Files that will be deleted as part of the merge conflict resolution.
  final List<DeleteFileEntry> deleteFiles;

  /// File modes that will be set as part of the merge conflict resolution.
  final List<SetFileModeEntry> setFileModes;

  ConflictResolution({
    this.replaceContents,
    this.deleteFiles,
    this.setFileModes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateCommitOutput {
  /// The full commit ID of the commit that contains your committed file
  /// changes.
  final String commitId;

  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains the commited file changes.
  final String treeId;

  /// The files added as part of the committed file changes.
  final List<FileMetadata> filesAdded;

  /// The files updated as part of the commited file changes.
  final List<FileMetadata> filesUpdated;

  /// The files deleted as part of the committed file changes.
  final List<FileMetadata> filesDeleted;

  CreateCommitOutput({
    this.commitId,
    this.treeId,
    this.filesAdded,
    this.filesUpdated,
    this.filesDeleted,
  });
  static CreateCommitOutput fromJson(Map<String, dynamic> json) =>
      CreateCommitOutput(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
        filesAdded: json.containsKey('filesAdded')
            ? (json['filesAdded'] as List)
                .map((e) => FileMetadata.fromJson(e))
                .toList()
            : null,
        filesUpdated: json.containsKey('filesUpdated')
            ? (json['filesUpdated'] as List)
                .map((e) => FileMetadata.fromJson(e))
                .toList()
            : null,
        filesDeleted: json.containsKey('filesDeleted')
            ? (json['filesDeleted'] as List)
                .map((e) => FileMetadata.fromJson(e))
                .toList()
            : null,
      );
}

class CreatePullRequestOutput {
  /// Information about the newly created pull request.
  final PullRequest pullRequest;

  CreatePullRequestOutput({
    @required this.pullRequest,
  });
  static CreatePullRequestOutput fromJson(Map<String, dynamic> json) =>
      CreatePullRequestOutput(
        pullRequest: PullRequest.fromJson(json['pullRequest']),
      );
}

/// Represents the output of a create repository operation.
class CreateRepositoryOutput {
  /// Information about the newly created repository.
  final RepositoryMetadata repositoryMetadata;

  CreateRepositoryOutput({
    this.repositoryMetadata,
  });
  static CreateRepositoryOutput fromJson(Map<String, dynamic> json) =>
      CreateRepositoryOutput(
        repositoryMetadata: json.containsKey('repositoryMetadata')
            ? RepositoryMetadata.fromJson(json['repositoryMetadata'])
            : null,
      );
}

class CreateUnreferencedMergeCommitOutput {
  /// The full commit ID of the commit that contains your merge results.
  final String commitId;

  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains the merge results.
  final String treeId;

  CreateUnreferencedMergeCommitOutput({
    this.commitId,
    this.treeId,
  });
  static CreateUnreferencedMergeCommitOutput fromJson(
          Map<String, dynamic> json) =>
      CreateUnreferencedMergeCommitOutput(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
      );
}

/// Represents the output of a delete branch operation.
class DeleteBranchOutput {
  /// Information about the branch deleted by the operation, including the
  /// branch name and the commit ID that was the tip of the branch.
  final BranchInfo deletedBranch;

  DeleteBranchOutput({
    this.deletedBranch,
  });
  static DeleteBranchOutput fromJson(Map<String, dynamic> json) =>
      DeleteBranchOutput(
        deletedBranch: json.containsKey('deletedBranch')
            ? BranchInfo.fromJson(json['deletedBranch'])
            : null,
      );
}

class DeleteCommentContentOutput {
  /// Information about the comment you just deleted.
  final Comment comment;

  DeleteCommentContentOutput({
    this.comment,
  });
  static DeleteCommentContentOutput fromJson(Map<String, dynamic> json) =>
      DeleteCommentContentOutput(
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

/// A file that will be deleted as part of a commit.
class DeleteFileEntry {
  /// The full path of the file that will be deleted, including the name of the
  /// file.
  final String filePath;

  DeleteFileEntry({
    @required this.filePath,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteFileOutput {
  /// The full commit ID of the commit that contains the change that deletes the
  /// file.
  final String commitId;

  /// The blob ID removed from the tree as part of deleting the file.
  final String blobId;

  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains the delete file change.
  final String treeId;

  /// The fully-qualified path to the file that will be deleted, including the
  /// full name and extension of that file.
  final String filePath;

  DeleteFileOutput({
    @required this.commitId,
    @required this.blobId,
    @required this.treeId,
    @required this.filePath,
  });
  static DeleteFileOutput fromJson(Map<String, dynamic> json) =>
      DeleteFileOutput(
        commitId: json['commitId'] as String,
        blobId: json['blobId'] as String,
        treeId: json['treeId'] as String,
        filePath: json['filePath'] as String,
      );
}

/// Represents the output of a delete repository operation.
class DeleteRepositoryOutput {
  /// The ID of the repository that was deleted.
  final String repositoryId;

  DeleteRepositoryOutput({
    this.repositoryId,
  });
  static DeleteRepositoryOutput fromJson(Map<String, dynamic> json) =>
      DeleteRepositoryOutput(
        repositoryId: json.containsKey('repositoryId')
            ? json['repositoryId'] as String
            : null,
      );
}

class DescribeMergeConflictsOutput {
  /// Contains metadata about the conflicts found in the merge.
  final ConflictMetadata conflictMetadata;

  /// A list of merge hunks of the differences between the files or lines.
  final List<MergeHunk> mergeHunks;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  /// The commit ID of the destination commit specifier that was used in the
  /// merge evaluation.
  final String destinationCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String baseCommitId;

  DescribeMergeConflictsOutput({
    @required this.conflictMetadata,
    @required this.mergeHunks,
    this.nextToken,
    @required this.destinationCommitId,
    @required this.sourceCommitId,
    this.baseCommitId,
  });
  static DescribeMergeConflictsOutput fromJson(Map<String, dynamic> json) =>
      DescribeMergeConflictsOutput(
        conflictMetadata: ConflictMetadata.fromJson(json['conflictMetadata']),
        mergeHunks: (json['mergeHunks'] as List)
            .map((e) => MergeHunk.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        destinationCommitId: json['destinationCommitId'] as String,
        sourceCommitId: json['sourceCommitId'] as String,
        baseCommitId: json.containsKey('baseCommitId')
            ? json['baseCommitId'] as String
            : null,
      );
}

class DescribePullRequestEventsOutput {
  /// Information about the pull request events.
  final List<PullRequestEvent> pullRequestEvents;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  DescribePullRequestEventsOutput({
    @required this.pullRequestEvents,
    this.nextToken,
  });
  static DescribePullRequestEventsOutput fromJson(Map<String, dynamic> json) =>
      DescribePullRequestEventsOutput(
        pullRequestEvents: (json['pullRequestEvents'] as List)
            .map((e) => PullRequestEvent.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Returns information about a set of differences for a commit specifier.
class Difference {
  /// Information about a `beforeBlob` data type object, including the ID, the
  /// file mode permission code, and the path.
  final BlobMetadata beforeBlob;

  /// Information about an `afterBlob` data type object, including the ID, the
  /// file mode permission code, and the path.
  final BlobMetadata afterBlob;

  /// Whether the change type of the difference is an addition (A), deletion
  /// (D), or modification (M).
  final String changeType;

  Difference({
    this.beforeBlob,
    this.afterBlob,
    this.changeType,
  });
  static Difference fromJson(Map<String, dynamic> json) => Difference(
        beforeBlob: json.containsKey('beforeBlob')
            ? BlobMetadata.fromJson(json['beforeBlob'])
            : null,
        afterBlob: json.containsKey('afterBlob')
            ? BlobMetadata.fromJson(json['afterBlob'])
            : null,
        changeType: json.containsKey('changeType')
            ? json['changeType'] as String
            : null,
      );
}

/// Returns information about a file in a repository.
class File {
  /// The blob ID that contains the file information.
  final String blobId;

  /// The fully-qualified path to the file in the repository.
  final String absolutePath;

  /// The relative path of the file from the folder where the query originated.
  final String relativePath;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final String fileMode;

  File({
    this.blobId,
    this.absolutePath,
    this.relativePath,
    this.fileMode,
  });
  static File fromJson(Map<String, dynamic> json) => File(
        blobId: json.containsKey('blobId') ? json['blobId'] as String : null,
        absolutePath: json.containsKey('absolutePath')
            ? json['absolutePath'] as String
            : null,
        relativePath: json.containsKey('relativePath')
            ? json['relativePath'] as String
            : null,
        fileMode:
            json.containsKey('fileMode') ? json['fileMode'] as String : null,
      );
}

/// A file that will be added, updated, or deleted as part of a commit.
class FileMetadata {
  /// The full path to the file that will be added or updated, including the
  /// name of the file.
  final String absolutePath;

  /// The blob ID that contains the file information.
  final String blobId;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final String fileMode;

  FileMetadata({
    this.absolutePath,
    this.blobId,
    this.fileMode,
  });
  static FileMetadata fromJson(Map<String, dynamic> json) => FileMetadata(
        absolutePath: json.containsKey('absolutePath')
            ? json['absolutePath'] as String
            : null,
        blobId: json.containsKey('blobId') ? json['blobId'] as String : null,
        fileMode:
            json.containsKey('fileMode') ? json['fileMode'] as String : null,
      );
}

/// Information about file modes in a merge or pull request.
class FileModes {
  /// The file mode of a file in the source of a merge or pull request.
  final String source;

  /// The file mode of a file in the destination of a merge or pull request.
  final String destination;

  /// The file mode of a file in the base of a merge or pull request.
  final String base;

  FileModes({
    this.source,
    this.destination,
    this.base,
  });
  static FileModes fromJson(Map<String, dynamic> json) => FileModes(
        source: json.containsKey('source') ? json['source'] as String : null,
        destination: json.containsKey('destination')
            ? json['destination'] as String
            : null,
        base: json.containsKey('base') ? json['base'] as String : null,
      );
}

/// Information about the size of files in a merge or pull request.
class FileSizes {
  /// The size of a file in the source of a merge or pull request.
  final BigInt source;

  /// The size of a file in the destination of a merge or pull request.
  final BigInt destination;

  /// The size of a file in the base of a merge or pull request.
  final BigInt base;

  FileSizes({
    this.source,
    this.destination,
    this.base,
  });
  static FileSizes fromJson(Map<String, dynamic> json) => FileSizes(
        source: json.containsKey('source') ? BigInt.from(json['source']) : null,
        destination: json.containsKey('destination')
            ? BigInt.from(json['destination'])
            : null,
        base: json.containsKey('base') ? BigInt.from(json['base']) : null,
      );
}

/// Returns information about a folder in a repository.
class Folder {
  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains the folder.
  final String treeId;

  /// The fully-qualified path of the folder in the repository.
  final String absolutePath;

  /// The relative path of the specified folder from the folder where the query
  /// originated.
  final String relativePath;

  Folder({
    this.treeId,
    this.absolutePath,
    this.relativePath,
  });
  static Folder fromJson(Map<String, dynamic> json) => Folder(
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
        absolutePath: json.containsKey('absolutePath')
            ? json['absolutePath'] as String
            : null,
        relativePath: json.containsKey('relativePath')
            ? json['relativePath'] as String
            : null,
      );
}

/// Represents the output of a get blob operation.
class GetBlobOutput {
  /// The content of the blob, usually a file.
  final Uint8List content;

  GetBlobOutput({
    @required this.content,
  });
  static GetBlobOutput fromJson(Map<String, dynamic> json) => GetBlobOutput(
        content: Uint8List(json['content']),
      );
}

/// Represents the output of a get branch operation.
class GetBranchOutput {
  /// The name of the branch.
  final BranchInfo branch;

  GetBranchOutput({
    this.branch,
  });
  static GetBranchOutput fromJson(Map<String, dynamic> json) => GetBranchOutput(
        branch: json.containsKey('branch')
            ? BranchInfo.fromJson(json['branch'])
            : null,
      );
}

class GetCommentOutput {
  /// The contents of the comment.
  final Comment comment;

  GetCommentOutput({
    this.comment,
  });
  static GetCommentOutput fromJson(Map<String, dynamic> json) =>
      GetCommentOutput(
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

class GetCommentsForComparedCommitOutput {
  /// A list of comment objects on the compared commit.
  final List<CommentsForComparedCommit> commentsForComparedCommitData;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  GetCommentsForComparedCommitOutput({
    this.commentsForComparedCommitData,
    this.nextToken,
  });
  static GetCommentsForComparedCommitOutput fromJson(
          Map<String, dynamic> json) =>
      GetCommentsForComparedCommitOutput(
        commentsForComparedCommitData:
            json.containsKey('commentsForComparedCommitData')
                ? (json['commentsForComparedCommitData'] as List)
                    .map((e) => CommentsForComparedCommit.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class GetCommentsForPullRequestOutput {
  /// An array of comment objects on the pull request.
  final List<CommentsForPullRequest> commentsForPullRequestData;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  GetCommentsForPullRequestOutput({
    this.commentsForPullRequestData,
    this.nextToken,
  });
  static GetCommentsForPullRequestOutput fromJson(Map<String, dynamic> json) =>
      GetCommentsForPullRequestOutput(
        commentsForPullRequestData:
            json.containsKey('commentsForPullRequestData')
                ? (json['commentsForPullRequestData'] as List)
                    .map((e) => CommentsForPullRequest.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Represents the output of a get commit operation.
class GetCommitOutput {
  /// A commit data type object that contains information about the specified
  /// commit.
  final Commit commit;

  GetCommitOutput({
    @required this.commit,
  });
  static GetCommitOutput fromJson(Map<String, dynamic> json) => GetCommitOutput(
        commit: Commit.fromJson(json['commit']),
      );
}

class GetDifferencesOutput {
  /// A differences data type object that contains information about the
  /// differences, including whether the difference is added, modified, or
  /// deleted (A, D, M).
  final List<Difference> differences;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  GetDifferencesOutput({
    this.differences,
    this.nextToken,
  });
  static GetDifferencesOutput fromJson(Map<String, dynamic> json) =>
      GetDifferencesOutput(
        differences: json.containsKey('differences')
            ? (json['differences'] as List)
                .map((e) => Difference.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetFileOutput {
  /// The full commit ID of the commit that contains the content returned by
  /// GetFile.
  final String commitId;

  /// The blob ID of the object that represents the file content.
  final String blobId;

  /// The fully qualified path to the specified file. This returns the name and
  /// extension of the file.
  final String filePath;

  /// The extrapolated file mode permissions of the blob. Valid values include
  /// strings such as EXECUTABLE and not numeric values.
  ///
  ///
  ///
  /// The file mode permissions returned by this API are not the standard file
  /// mode permission values, such as 100644, but rather extrapolated values.
  /// See below for a full list of supported return values.
  final String fileMode;

  /// The size of the contents of the file, in bytes.
  final BigInt fileSize;

  /// The base-64 encoded binary data object that represents the content of the
  /// file.
  final Uint8List fileContent;

  GetFileOutput({
    @required this.commitId,
    @required this.blobId,
    @required this.filePath,
    @required this.fileMode,
    @required this.fileSize,
    @required this.fileContent,
  });
  static GetFileOutput fromJson(Map<String, dynamic> json) => GetFileOutput(
        commitId: json['commitId'] as String,
        blobId: json['blobId'] as String,
        filePath: json['filePath'] as String,
        fileMode: json['fileMode'] as String,
        fileSize: BigInt.from(json['fileSize']),
        fileContent: Uint8List(json['fileContent']),
      );
}

class GetFolderOutput {
  /// The full commit ID used as a reference for which version of the folder
  /// content is returned.
  final String commitId;

  /// The fully-qualified path of the folder whose contents are returned.
  final String folderPath;

  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains the folder.
  final String treeId;

  /// The list of folders that exist beneath the specified folder, if any.
  final List<Folder> subFolders;

  /// The list of files that exist in the specified folder, if any.
  final List<File> files;

  /// The list of symbolic links to other files and folders that exist in the
  /// specified folder, if any.
  final List<SymbolicLink> symbolicLinks;

  /// The list of submodules that exist in the specified folder, if any.
  final List<SubModule> subModules;

  GetFolderOutput({
    @required this.commitId,
    @required this.folderPath,
    this.treeId,
    this.subFolders,
    this.files,
    this.symbolicLinks,
    this.subModules,
  });
  static GetFolderOutput fromJson(Map<String, dynamic> json) => GetFolderOutput(
        commitId: json['commitId'] as String,
        folderPath: json['folderPath'] as String,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
        subFolders: json.containsKey('subFolders')
            ? (json['subFolders'] as List)
                .map((e) => Folder.fromJson(e))
                .toList()
            : null,
        files: json.containsKey('files')
            ? (json['files'] as List).map((e) => File.fromJson(e)).toList()
            : null,
        symbolicLinks: json.containsKey('symbolicLinks')
            ? (json['symbolicLinks'] as List)
                .map((e) => SymbolicLink.fromJson(e))
                .toList()
            : null,
        subModules: json.containsKey('subModules')
            ? (json['subModules'] as List)
                .map((e) => SubModule.fromJson(e))
                .toList()
            : null,
      );
}

class GetMergeCommitOutput {
  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the destination commit specifier that was used in the
  /// merge evaluation.
  final String destinationCommitId;

  /// The commit ID of the merge base.
  final String baseCommitId;

  /// The commit ID for the merge commit created when the source branch was
  /// merged into the destination branch. If the fast-forward merge strategy was
  /// used, no merge commit exists.
  final String mergedCommitId;

  GetMergeCommitOutput({
    this.sourceCommitId,
    this.destinationCommitId,
    this.baseCommitId,
    this.mergedCommitId,
  });
  static GetMergeCommitOutput fromJson(Map<String, dynamic> json) =>
      GetMergeCommitOutput(
        sourceCommitId: json.containsKey('sourceCommitId')
            ? json['sourceCommitId'] as String
            : null,
        destinationCommitId: json.containsKey('destinationCommitId')
            ? json['destinationCommitId'] as String
            : null,
        baseCommitId: json.containsKey('baseCommitId')
            ? json['baseCommitId'] as String
            : null,
        mergedCommitId: json.containsKey('mergedCommitId')
            ? json['mergedCommitId'] as String
            : null,
      );
}

class GetMergeConflictsOutput {
  /// A Boolean value that indicates whether the code is mergeable by the
  /// specified merge option.
  final bool mergeable;

  /// The commit ID of the destination commit specifier that was used in the
  /// merge evaluation.
  final String destinationCommitId;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the merge base.
  final String baseCommitId;

  /// A list of metadata for any conflicting files. If the specified merge
  /// strategy is FAST_FORWARD_MERGE, this list will always be empty.
  final List<ConflictMetadata> conflictMetadataList;

  /// An enumeration token that can be used in a request to return the next
  /// batch of the results.
  final String nextToken;

  GetMergeConflictsOutput({
    @required this.mergeable,
    @required this.destinationCommitId,
    @required this.sourceCommitId,
    this.baseCommitId,
    @required this.conflictMetadataList,
    this.nextToken,
  });
  static GetMergeConflictsOutput fromJson(Map<String, dynamic> json) =>
      GetMergeConflictsOutput(
        mergeable: json['mergeable'] as bool,
        destinationCommitId: json['destinationCommitId'] as String,
        sourceCommitId: json['sourceCommitId'] as String,
        baseCommitId: json.containsKey('baseCommitId')
            ? json['baseCommitId'] as String
            : null,
        conflictMetadataList: (json['conflictMetadataList'] as List)
            .map((e) => ConflictMetadata.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class GetMergeOptionsOutput {
  /// The merge option or strategy used to merge the code.
  final List<String> mergeOptions;

  /// The commit ID of the source commit specifier that was used in the merge
  /// evaluation.
  final String sourceCommitId;

  /// The commit ID of the destination commit specifier that was used in the
  /// merge evaluation.
  final String destinationCommitId;

  /// The commit ID of the merge base.
  final String baseCommitId;

  GetMergeOptionsOutput({
    @required this.mergeOptions,
    @required this.sourceCommitId,
    @required this.destinationCommitId,
    @required this.baseCommitId,
  });
  static GetMergeOptionsOutput fromJson(Map<String, dynamic> json) =>
      GetMergeOptionsOutput(
        mergeOptions:
            (json['mergeOptions'] as List).map((e) => e as String).toList(),
        sourceCommitId: json['sourceCommitId'] as String,
        destinationCommitId: json['destinationCommitId'] as String,
        baseCommitId: json['baseCommitId'] as String,
      );
}

class GetPullRequestOutput {
  /// Information about the specified pull request.
  final PullRequest pullRequest;

  GetPullRequestOutput({
    @required this.pullRequest,
  });
  static GetPullRequestOutput fromJson(Map<String, dynamic> json) =>
      GetPullRequestOutput(
        pullRequest: PullRequest.fromJson(json['pullRequest']),
      );
}

/// Represents the output of a get repository operation.
class GetRepositoryOutput {
  /// Information about the repository.
  final RepositoryMetadata repositoryMetadata;

  GetRepositoryOutput({
    this.repositoryMetadata,
  });
  static GetRepositoryOutput fromJson(Map<String, dynamic> json) =>
      GetRepositoryOutput(
        repositoryMetadata: json.containsKey('repositoryMetadata')
            ? RepositoryMetadata.fromJson(json['repositoryMetadata'])
            : null,
      );
}

/// Represents the output of a get repository triggers operation.
class GetRepositoryTriggersOutput {
  /// The system-generated unique ID for the trigger.
  final String configurationId;

  /// The JSON block of configuration information for each trigger.
  final List<RepositoryTrigger> triggers;

  GetRepositoryTriggersOutput({
    this.configurationId,
    this.triggers,
  });
  static GetRepositoryTriggersOutput fromJson(Map<String, dynamic> json) =>
      GetRepositoryTriggersOutput(
        configurationId: json.containsKey('configurationId')
            ? json['configurationId'] as String
            : null,
        triggers: json.containsKey('triggers')
            ? (json['triggers'] as List)
                .map((e) => RepositoryTrigger.fromJson(e))
                .toList()
            : null,
      );
}

/// Information about whether a file is binary or textual in a merge or pull
/// request operation.
class IsBinaryFile {
  /// The binary or non-binary status of file in the source of a merge or pull
  /// request.
  final bool source;

  /// The binary or non-binary status of a file in the destination of a merge or
  /// pull request.
  final bool destination;

  /// The binary or non-binary status of a file in the base of a merge or pull
  /// request.
  final bool base;

  IsBinaryFile({
    this.source,
    this.destination,
    this.base,
  });
  static IsBinaryFile fromJson(Map<String, dynamic> json) => IsBinaryFile(
        source: json.containsKey('source') ? json['source'] as bool : null,
        destination: json.containsKey('destination')
            ? json['destination'] as bool
            : null,
        base: json.containsKey('base') ? json['base'] as bool : null,
      );
}

/// Represents the output of a list branches operation.
class ListBranchesOutput {
  /// The list of branch names.
  final List<String> branches;

  /// An enumeration token that returns the batch of the results.
  final String nextToken;

  ListBranchesOutput({
    this.branches,
    this.nextToken,
  });
  static ListBranchesOutput fromJson(Map<String, dynamic> json) =>
      ListBranchesOutput(
        branches: json.containsKey('branches')
            ? (json['branches'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListPullRequestsOutput {
  /// The system-generated IDs of the pull requests.
  final List<String> pullRequestIds;

  /// An enumeration token that when provided in a request, returns the next
  /// batch of the results.
  final String nextToken;

  ListPullRequestsOutput({
    @required this.pullRequestIds,
    this.nextToken,
  });
  static ListPullRequestsOutput fromJson(Map<String, dynamic> json) =>
      ListPullRequestsOutput(
        pullRequestIds:
            (json['pullRequestIds'] as List).map((e) => e as String).toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Represents the output of a list repositories operation.
class ListRepositoriesOutput {
  /// Lists the repositories called by the list repositories operation.
  final List<RepositoryNameIdPair> repositories;

  /// An enumeration token that allows the operation to batch the results of the
  /// operation. Batch sizes are 1,000 for list repository operations. When the
  /// client sends the token back to AWS CodeCommit, another page of 1,000
  /// records is retrieved.
  final String nextToken;

  ListRepositoriesOutput({
    this.repositories,
    this.nextToken,
  });
  static ListRepositoriesOutput fromJson(Map<String, dynamic> json) =>
      ListRepositoriesOutput(
        repositories: json.containsKey('repositories')
            ? (json['repositories'] as List)
                .map((e) => RepositoryNameIdPair.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceOutput {
  /// A list of tag key and value pairs associated with the specified resource.
  final Map<String, String> tags;

  /// An enumeration token that allows the operation to batch the next results
  /// of the operation.
  final String nextToken;

  ListTagsForResourceOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Returns information about the location of a change or comment in the
/// comparison between two commits or a pull request.
class Location {
  /// The name of the file being compared, including its extension and
  /// subdirectory, if any.
  final String filePath;

  /// The position of a change within a compared file, in line number format.
  final BigInt filePosition;

  /// In a comparison of commits or a pull request, whether the change is in the
  /// 'before' or 'after' of that comparison.
  final String relativeFileVersion;

  Location({
    this.filePath,
    this.filePosition,
    this.relativeFileVersion,
  });
  static Location fromJson(Map<String, dynamic> json) => Location(
        filePath:
            json.containsKey('filePath') ? json['filePath'] as String : null,
        filePosition: json.containsKey('filePosition')
            ? BigInt.from(json['filePosition'])
            : null,
        relativeFileVersion: json.containsKey('relativeFileVersion')
            ? json['relativeFileVersion'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class MergeBranchesByFastForwardOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String treeId;

  MergeBranchesByFastForwardOutput({
    this.commitId,
    this.treeId,
  });
  static MergeBranchesByFastForwardOutput fromJson(Map<String, dynamic> json) =>
      MergeBranchesByFastForwardOutput(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
      );
}

class MergeBranchesBySquashOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String treeId;

  MergeBranchesBySquashOutput({
    this.commitId,
    this.treeId,
  });
  static MergeBranchesBySquashOutput fromJson(Map<String, dynamic> json) =>
      MergeBranchesBySquashOutput(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
      );
}

class MergeBranchesByThreeWayOutput {
  /// The commit ID of the merge in the destination or target branch.
  final String commitId;

  /// The tree ID of the merge in the destination or target branch.
  final String treeId;

  MergeBranchesByThreeWayOutput({
    this.commitId,
    this.treeId,
  });
  static MergeBranchesByThreeWayOutput fromJson(Map<String, dynamic> json) =>
      MergeBranchesByThreeWayOutput(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        treeId: json.containsKey('treeId') ? json['treeId'] as String : null,
      );
}

/// Information about merge hunks in a merge or pull request operation.
class MergeHunk {
  /// A Boolean value indicating whether a combination of hunks contains a
  /// conflict. Conflicts occur when the same file or the same lines in a file
  /// were modified in both the source and destination of a merge or pull
  /// request. Valid values include true, false, and null. This will be true
  /// when the hunk represents a conflict and one or more files contains a line
  /// conflict. File mode conflicts in a merge will not set this to be true.
  final bool isConflict;

  /// Information about the merge hunk in the source of a merge or pull request.
  final MergeHunkDetail source;

  /// Information about the merge hunk in the destination of a merge or pull
  /// request.
  final MergeHunkDetail destination;

  /// Information about the merge hunk in the base of a merge or pull request.
  final MergeHunkDetail base;

  MergeHunk({
    this.isConflict,
    this.source,
    this.destination,
    this.base,
  });
  static MergeHunk fromJson(Map<String, dynamic> json) => MergeHunk(
        isConflict:
            json.containsKey('isConflict') ? json['isConflict'] as bool : null,
        source: json.containsKey('source')
            ? MergeHunkDetail.fromJson(json['source'])
            : null,
        destination: json.containsKey('destination')
            ? MergeHunkDetail.fromJson(json['destination'])
            : null,
        base: json.containsKey('base')
            ? MergeHunkDetail.fromJson(json['base'])
            : null,
      );
}

/// Information about the details of a merge hunk that contains a conflict in a
/// merge or pull request operation.
class MergeHunkDetail {
  /// The start position of the hunk in the merge result.
  final int startLine;

  /// The end position of the hunk in the merge result.
  final int endLine;

  /// The base-64 encoded content of the hunk merged region that might or might
  /// not contain a conflict.
  final String hunkContent;

  MergeHunkDetail({
    this.startLine,
    this.endLine,
    this.hunkContent,
  });
  static MergeHunkDetail fromJson(Map<String, dynamic> json) => MergeHunkDetail(
        startLine:
            json.containsKey('startLine') ? json['startLine'] as int : null,
        endLine: json.containsKey('endLine') ? json['endLine'] as int : null,
        hunkContent: json.containsKey('hunkContent')
            ? json['hunkContent'] as String
            : null,
      );
}

/// Returns information about a merge or potential merge between a source
/// reference and a destination reference in a pull request.
class MergeMetadata {
  /// A Boolean value indicating whether the merge has been made.
  final bool isMerged;

  /// The Amazon Resource Name (ARN) of the user who merged the branches.
  final String mergedBy;

  /// The commit ID for the merge commit, if any.
  final String mergeCommitId;

  /// The merge strategy used in the merge.
  final String mergeOption;

  MergeMetadata({
    this.isMerged,
    this.mergedBy,
    this.mergeCommitId,
    this.mergeOption,
  });
  static MergeMetadata fromJson(Map<String, dynamic> json) => MergeMetadata(
        isMerged:
            json.containsKey('isMerged') ? json['isMerged'] as bool : null,
        mergedBy:
            json.containsKey('mergedBy') ? json['mergedBy'] as String : null,
        mergeCommitId: json.containsKey('mergeCommitId')
            ? json['mergeCommitId'] as String
            : null,
        mergeOption: json.containsKey('mergeOption')
            ? json['mergeOption'] as String
            : null,
      );
}

/// Information about the file operation conflicts in a merge operation.
class MergeOperations {
  /// The operation on a file (add, modify, or delete) of a file in the source
  /// of a merge or pull request.
  final String source;

  /// The operation on a file in the destination of a merge or pull request.
  final String destination;

  MergeOperations({
    this.source,
    this.destination,
  });
  static MergeOperations fromJson(Map<String, dynamic> json) => MergeOperations(
        source: json.containsKey('source') ? json['source'] as String : null,
        destination: json.containsKey('destination')
            ? json['destination'] as String
            : null,
      );
}

class MergePullRequestByFastForwardOutput {
  /// Information about the specified pull request, including information about
  /// the merge.
  final PullRequest pullRequest;

  MergePullRequestByFastForwardOutput({
    this.pullRequest,
  });
  static MergePullRequestByFastForwardOutput fromJson(
          Map<String, dynamic> json) =>
      MergePullRequestByFastForwardOutput(
        pullRequest: json.containsKey('pullRequest')
            ? PullRequest.fromJson(json['pullRequest'])
            : null,
      );
}

class MergePullRequestBySquashOutput {
  final PullRequest pullRequest;

  MergePullRequestBySquashOutput({
    this.pullRequest,
  });
  static MergePullRequestBySquashOutput fromJson(Map<String, dynamic> json) =>
      MergePullRequestBySquashOutput(
        pullRequest: json.containsKey('pullRequest')
            ? PullRequest.fromJson(json['pullRequest'])
            : null,
      );
}

class MergePullRequestByThreeWayOutput {
  final PullRequest pullRequest;

  MergePullRequestByThreeWayOutput({
    this.pullRequest,
  });
  static MergePullRequestByThreeWayOutput fromJson(Map<String, dynamic> json) =>
      MergePullRequestByThreeWayOutput(
        pullRequest: json.containsKey('pullRequest')
            ? PullRequest.fromJson(json['pullRequest'])
            : null,
      );
}

/// Information about the type of an object in a merge operation.
class ObjectTypes {
  /// The type of the object in the source branch.
  final String source;

  /// The type of the object in the destination branch.
  final String destination;

  /// The type of the object in the base commit of the merge.
  final String base;

  ObjectTypes({
    this.source,
    this.destination,
    this.base,
  });
  static ObjectTypes fromJson(Map<String, dynamic> json) => ObjectTypes(
        source: json.containsKey('source') ? json['source'] as String : null,
        destination: json.containsKey('destination')
            ? json['destination'] as String
            : null,
        base: json.containsKey('base') ? json['base'] as String : null,
      );
}

class PostCommentForComparedCommitOutput {
  /// The name of the repository where you posted a comment on the comparison
  /// between commits.
  final String repositoryName;

  /// In the directionality you established, the full commit ID of the 'before'
  /// commit.
  final String beforeCommitId;

  /// In the directionality you established, the full commit ID of the 'after'
  /// commit.
  final String afterCommitId;

  /// In the directionality you established, the blob ID of the 'before' blob.
  final String beforeBlobId;

  /// In the directionality you established, the blob ID of the 'after' blob.
  final String afterBlobId;

  /// The location of the comment in the comparison between the two commits.
  final Location location;

  /// The content of the comment you posted.
  final Comment comment;

  PostCommentForComparedCommitOutput({
    this.repositoryName,
    this.beforeCommitId,
    this.afterCommitId,
    this.beforeBlobId,
    this.afterBlobId,
    this.location,
    this.comment,
  });
  static PostCommentForComparedCommitOutput fromJson(
          Map<String, dynamic> json) =>
      PostCommentForComparedCommitOutput(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        beforeCommitId: json.containsKey('beforeCommitId')
            ? json['beforeCommitId'] as String
            : null,
        afterCommitId: json.containsKey('afterCommitId')
            ? json['afterCommitId'] as String
            : null,
        beforeBlobId: json.containsKey('beforeBlobId')
            ? json['beforeBlobId'] as String
            : null,
        afterBlobId: json.containsKey('afterBlobId')
            ? json['afterBlobId'] as String
            : null,
        location: json.containsKey('location')
            ? Location.fromJson(json['location'])
            : null,
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

class PostCommentForPullRequestOutput {
  /// The name of the repository where you posted a comment on a pull request.
  final String repositoryName;

  /// The system-generated ID of the pull request.
  final String pullRequestId;

  /// The full commit ID of the commit in the source branch used to create the
  /// pull request, or in the case of an updated pull request, the full commit
  /// ID of the commit used to update the pull request.
  final String beforeCommitId;

  /// The full commit ID of the commit in the destination branch where the pull
  /// request will be merged.
  final String afterCommitId;

  /// In the directionality of the pull request, the blob ID of the 'before'
  /// blob.
  final String beforeBlobId;

  /// In the directionality of the pull request, the blob ID of the 'after'
  /// blob.
  final String afterBlobId;

  /// The location of the change where you posted your comment.
  final Location location;

  /// The content of the comment you posted.
  final Comment comment;

  PostCommentForPullRequestOutput({
    this.repositoryName,
    this.pullRequestId,
    this.beforeCommitId,
    this.afterCommitId,
    this.beforeBlobId,
    this.afterBlobId,
    this.location,
    this.comment,
  });
  static PostCommentForPullRequestOutput fromJson(Map<String, dynamic> json) =>
      PostCommentForPullRequestOutput(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        pullRequestId: json.containsKey('pullRequestId')
            ? json['pullRequestId'] as String
            : null,
        beforeCommitId: json.containsKey('beforeCommitId')
            ? json['beforeCommitId'] as String
            : null,
        afterCommitId: json.containsKey('afterCommitId')
            ? json['afterCommitId'] as String
            : null,
        beforeBlobId: json.containsKey('beforeBlobId')
            ? json['beforeBlobId'] as String
            : null,
        afterBlobId: json.containsKey('afterBlobId')
            ? json['afterBlobId'] as String
            : null,
        location: json.containsKey('location')
            ? Location.fromJson(json['location'])
            : null,
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

class PostCommentReplyOutput {
  /// Information about the reply to a comment.
  final Comment comment;

  PostCommentReplyOutput({
    this.comment,
  });
  static PostCommentReplyOutput fromJson(Map<String, dynamic> json) =>
      PostCommentReplyOutput(
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

/// Returns information about a pull request.
class PullRequest {
  /// The system-generated ID of the pull request.
  final String pullRequestId;

  /// The user-defined title of the pull request. This title is displayed in the
  /// list of pull requests to other users of the repository.
  final String title;

  /// The user-defined description of the pull request. This description can be
  /// used to clarify what should be reviewed and other details of the request.
  final String description;

  /// The day and time of the last user or system activity on the pull request,
  /// in timestamp format.
  final DateTime lastActivityDate;

  /// The date and time the pull request was originally created, in timestamp
  /// format.
  final DateTime creationDate;

  /// The status of the pull request. Pull request status can only change from
  /// `OPEN` to `CLOSED`.
  final String pullRequestStatus;

  /// The Amazon Resource Name (ARN) of the user who created the pull request.
  final String authorArn;

  /// The targets of the pull request, including the source branch and
  /// destination branch for the pull request.
  final List<PullRequestTarget> pullRequestTargets;

  /// A unique, client-generated idempotency token that when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request is received with the same parameters and a token is included,
  /// the request will return information about the initial request that used
  /// that token.
  final String clientRequestToken;

  PullRequest({
    this.pullRequestId,
    this.title,
    this.description,
    this.lastActivityDate,
    this.creationDate,
    this.pullRequestStatus,
    this.authorArn,
    this.pullRequestTargets,
    this.clientRequestToken,
  });
  static PullRequest fromJson(Map<String, dynamic> json) => PullRequest(
        pullRequestId: json.containsKey('pullRequestId')
            ? json['pullRequestId'] as String
            : null,
        title: json.containsKey('title') ? json['title'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        lastActivityDate: json.containsKey('lastActivityDate')
            ? DateTime.parse(json['lastActivityDate'])
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        pullRequestStatus: json.containsKey('pullRequestStatus')
            ? json['pullRequestStatus'] as String
            : null,
        authorArn:
            json.containsKey('authorArn') ? json['authorArn'] as String : null,
        pullRequestTargets: json.containsKey('pullRequestTargets')
            ? (json['pullRequestTargets'] as List)
                .map((e) => PullRequestTarget.fromJson(e))
                .toList()
            : null,
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
      );
}

/// Metadata about the pull request that is used when comparing the pull request
/// source with its destination.
class PullRequestCreatedEventMetadata {
  /// The name of the repository where the pull request was created.
  final String repositoryName;

  /// The commit ID on the source branch used when the pull request was created.
  final String sourceCommitId;

  /// The commit ID of the tip of the branch specified as the destination branch
  /// when the pull request was created.
  final String destinationCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String mergeBase;

  PullRequestCreatedEventMetadata({
    this.repositoryName,
    this.sourceCommitId,
    this.destinationCommitId,
    this.mergeBase,
  });
  static PullRequestCreatedEventMetadata fromJson(Map<String, dynamic> json) =>
      PullRequestCreatedEventMetadata(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        sourceCommitId: json.containsKey('sourceCommitId')
            ? json['sourceCommitId'] as String
            : null,
        destinationCommitId: json.containsKey('destinationCommitId')
            ? json['destinationCommitId'] as String
            : null,
        mergeBase:
            json.containsKey('mergeBase') ? json['mergeBase'] as String : null,
      );
}

/// Returns information about a pull request event.
class PullRequestEvent {
  /// The system-generated ID of the pull request.
  final String pullRequestId;

  /// The day and time of the pull request event, in timestamp format.
  final DateTime eventDate;

  /// The type of the pull request event, for example a status change event
  /// (PULL_REQUEST_STATUS_CHANGED) or update event
  /// (PULL_REQUEST_SOURCE_REFERENCE_UPDATED).
  final String pullRequestEventType;

  /// The Amazon Resource Name (ARN) of the user whose actions resulted in the
  /// event. Examples include updating the pull request with additional commits
  /// or changing the status of a pull request.
  final String actorArn;

  /// Information about the source and destination branches for the pull
  /// request.
  final PullRequestCreatedEventMetadata pullRequestCreatedEventMetadata;

  /// Information about the change in status for the pull request event.
  final PullRequestStatusChangedEventMetadata
      pullRequestStatusChangedEventMetadata;

  /// Information about the updated source branch for the pull request event.
  final PullRequestSourceReferenceUpdatedEventMetadata
      pullRequestSourceReferenceUpdatedEventMetadata;

  /// Information about the change in mergability state for the pull request
  /// event.
  final PullRequestMergedStateChangedEventMetadata
      pullRequestMergedStateChangedEventMetadata;

  PullRequestEvent({
    this.pullRequestId,
    this.eventDate,
    this.pullRequestEventType,
    this.actorArn,
    this.pullRequestCreatedEventMetadata,
    this.pullRequestStatusChangedEventMetadata,
    this.pullRequestSourceReferenceUpdatedEventMetadata,
    this.pullRequestMergedStateChangedEventMetadata,
  });
  static PullRequestEvent fromJson(Map<String, dynamic> json) =>
      PullRequestEvent(
        pullRequestId: json.containsKey('pullRequestId')
            ? json['pullRequestId'] as String
            : null,
        eventDate: json.containsKey('eventDate')
            ? DateTime.parse(json['eventDate'])
            : null,
        pullRequestEventType: json.containsKey('pullRequestEventType')
            ? json['pullRequestEventType'] as String
            : null,
        actorArn:
            json.containsKey('actorArn') ? json['actorArn'] as String : null,
        pullRequestCreatedEventMetadata:
            json.containsKey('pullRequestCreatedEventMetadata')
                ? PullRequestCreatedEventMetadata.fromJson(
                    json['pullRequestCreatedEventMetadata'])
                : null,
        pullRequestStatusChangedEventMetadata:
            json.containsKey('pullRequestStatusChangedEventMetadata')
                ? PullRequestStatusChangedEventMetadata.fromJson(
                    json['pullRequestStatusChangedEventMetadata'])
                : null,
        pullRequestSourceReferenceUpdatedEventMetadata:
            json.containsKey('pullRequestSourceReferenceUpdatedEventMetadata')
                ? PullRequestSourceReferenceUpdatedEventMetadata.fromJson(
                    json['pullRequestSourceReferenceUpdatedEventMetadata'])
                : null,
        pullRequestMergedStateChangedEventMetadata:
            json.containsKey('pullRequestMergedStateChangedEventMetadata')
                ? PullRequestMergedStateChangedEventMetadata.fromJson(
                    json['pullRequestMergedStateChangedEventMetadata'])
                : null,
      );
}

/// Returns information about the change in the merge state for a pull request
/// event.
class PullRequestMergedStateChangedEventMetadata {
  /// The name of the repository where the pull request was created.
  final String repositoryName;

  /// The name of the branch that the pull request will be merged into.
  final String destinationReference;

  /// Information about the merge state change event.
  final MergeMetadata mergeMetadata;

  PullRequestMergedStateChangedEventMetadata({
    this.repositoryName,
    this.destinationReference,
    this.mergeMetadata,
  });
  static PullRequestMergedStateChangedEventMetadata fromJson(
          Map<String, dynamic> json) =>
      PullRequestMergedStateChangedEventMetadata(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        destinationReference: json.containsKey('destinationReference')
            ? json['destinationReference'] as String
            : null,
        mergeMetadata: json.containsKey('mergeMetadata')
            ? MergeMetadata.fromJson(json['mergeMetadata'])
            : null,
      );
}

/// Information about an update to the source branch of a pull request.
class PullRequestSourceReferenceUpdatedEventMetadata {
  /// The name of the repository where the pull request was updated.
  final String repositoryName;

  /// The full commit ID of the commit in the destination branch that was the
  /// tip of the branch at the time the pull request was updated.
  final String beforeCommitId;

  /// The full commit ID of the commit in the source branch that was the tip of
  /// the branch at the time the pull request was updated.
  final String afterCommitId;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String mergeBase;

  PullRequestSourceReferenceUpdatedEventMetadata({
    this.repositoryName,
    this.beforeCommitId,
    this.afterCommitId,
    this.mergeBase,
  });
  static PullRequestSourceReferenceUpdatedEventMetadata fromJson(
          Map<String, dynamic> json) =>
      PullRequestSourceReferenceUpdatedEventMetadata(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        beforeCommitId: json.containsKey('beforeCommitId')
            ? json['beforeCommitId'] as String
            : null,
        afterCommitId: json.containsKey('afterCommitId')
            ? json['afterCommitId'] as String
            : null,
        mergeBase:
            json.containsKey('mergeBase') ? json['mergeBase'] as String : null,
      );
}

/// Information about a change to the status of a pull request.
class PullRequestStatusChangedEventMetadata {
  /// The changed status of the pull request.
  final String pullRequestStatus;

  PullRequestStatusChangedEventMetadata({
    this.pullRequestStatus,
  });
  static PullRequestStatusChangedEventMetadata fromJson(
          Map<String, dynamic> json) =>
      PullRequestStatusChangedEventMetadata(
        pullRequestStatus: json.containsKey('pullRequestStatus')
            ? json['pullRequestStatus'] as String
            : null,
      );
}

/// Returns information about a pull request target.
class PullRequestTarget {
  /// The name of the repository that contains the pull request source and
  /// destination branches.
  final String repositoryName;

  /// The branch of the repository that contains the changes for the pull
  /// request. Also known as the source branch.
  final String sourceReference;

  /// The branch of the repository where the pull request changes will be merged
  /// into. Also known as the destination branch.
  final String destinationReference;

  /// The full commit ID that is the tip of the destination branch. This is the
  /// commit where the pull request was or will be merged.
  final String destinationCommit;

  /// The full commit ID of the tip of the source branch used to create the pull
  /// request. If the pull request branch is updated by a push while the pull
  /// request is open, the commit ID will change to reflect the new tip of the
  /// branch.
  final String sourceCommit;

  /// The commit ID of the most recent commit that the source branch and the
  /// destination branch have in common.
  final String mergeBase;

  /// Returns metadata about the state of the merge, including whether the merge
  /// has been made.
  final MergeMetadata mergeMetadata;

  PullRequestTarget({
    this.repositoryName,
    this.sourceReference,
    this.destinationReference,
    this.destinationCommit,
    this.sourceCommit,
    this.mergeBase,
    this.mergeMetadata,
  });
  static PullRequestTarget fromJson(Map<String, dynamic> json) =>
      PullRequestTarget(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        sourceReference: json.containsKey('sourceReference')
            ? json['sourceReference'] as String
            : null,
        destinationReference: json.containsKey('destinationReference')
            ? json['destinationReference'] as String
            : null,
        destinationCommit: json.containsKey('destinationCommit')
            ? json['destinationCommit'] as String
            : null,
        sourceCommit: json.containsKey('sourceCommit')
            ? json['sourceCommit'] as String
            : null,
        mergeBase:
            json.containsKey('mergeBase') ? json['mergeBase'] as String : null,
        mergeMetadata: json.containsKey('mergeMetadata')
            ? MergeMetadata.fromJson(json['mergeMetadata'])
            : null,
      );
}

/// Information about a file that will be added or updated as part of a commit.
class PutFileEntry {
  /// The full path to the file in the repository, including the name of the
  /// file.
  final String filePath;

  /// The extrapolated file mode permissions for the file. Valid values include
  /// EXECUTABLE and NORMAL.
  final String fileMode;

  /// The content of the file, if a source file is not specified.
  final Uint8List fileContent;

  /// The name and full path of the file that contains the changes you want to
  /// make as part of the commit, if you are not providing the file content
  /// directly.
  final SourceFileSpecifier sourceFile;

  PutFileEntry({
    @required this.filePath,
    this.fileMode,
    this.fileContent,
    this.sourceFile,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutFileOutput {
  /// The full SHA of the commit that contains this file change.
  final String commitId;

  /// The ID of the blob, which is its SHA-1 pointer.
  final String blobId;

  /// The full SHA-1 pointer of the tree information for the commit that
  /// contains this file change.
  final String treeId;

  PutFileOutput({
    @required this.commitId,
    @required this.blobId,
    @required this.treeId,
  });
  static PutFileOutput fromJson(Map<String, dynamic> json) => PutFileOutput(
        commitId: json['commitId'] as String,
        blobId: json['blobId'] as String,
        treeId: json['treeId'] as String,
      );
}

/// Represents the output of a put repository triggers operation.
class PutRepositoryTriggersOutput {
  /// The system-generated unique ID for the create or update operation.
  final String configurationId;

  PutRepositoryTriggersOutput({
    this.configurationId,
  });
  static PutRepositoryTriggersOutput fromJson(Map<String, dynamic> json) =>
      PutRepositoryTriggersOutput(
        configurationId: json.containsKey('configurationId')
            ? json['configurationId'] as String
            : null,
      );
}

/// Information about a replacement content entry in the conflict of a merge or
/// pull request operation.
class ReplaceContentEntry {
  /// The path of the conflicting file.
  final String filePath;

  /// The replacement type to use when determining how to resolve the conflict.
  final String replacementType;

  /// The base-64 encoded content to use when the replacement type is
  /// USE_NEW_CONTENT.
  final Uint8List content;

  /// The file mode to apply during conflict resoltion.
  final String fileMode;

  ReplaceContentEntry({
    @required this.filePath,
    @required this.replacementType,
    this.content,
    this.fileMode,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a repository.
class RepositoryMetadata {
  /// The ID of the AWS account associated with the repository.
  final String accountId;

  /// The ID of the repository.
  final String repositoryId;

  /// The repository's name.
  final String repositoryName;

  /// A comment or description about the repository.
  final String repositoryDescription;

  /// The repository's default branch name.
  final String defaultBranch;

  /// The date and time the repository was last modified, in timestamp format.
  final DateTime lastModifiedDate;

  /// The date and time the repository was created, in timestamp format.
  final DateTime creationDate;

  /// The URL to use for cloning the repository over HTTPS.
  final String cloneUrlHttp;

  /// The URL to use for cloning the repository over SSH.
  final String cloneUrlSsh;

  /// The Amazon Resource Name (ARN) of the repository.
  final String arn;

  RepositoryMetadata({
    this.accountId,
    this.repositoryId,
    this.repositoryName,
    this.repositoryDescription,
    this.defaultBranch,
    this.lastModifiedDate,
    this.creationDate,
    this.cloneUrlHttp,
    this.cloneUrlSsh,
    this.arn,
  });
  static RepositoryMetadata fromJson(Map<String, dynamic> json) =>
      RepositoryMetadata(
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
        repositoryId: json.containsKey('repositoryId')
            ? json['repositoryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        repositoryDescription: json.containsKey('repositoryDescription')
            ? json['repositoryDescription'] as String
            : null,
        defaultBranch: json.containsKey('defaultBranch')
            ? json['defaultBranch'] as String
            : null,
        lastModifiedDate: json.containsKey('lastModifiedDate')
            ? DateTime.parse(json['lastModifiedDate'])
            : null,
        creationDate: json.containsKey('creationDate')
            ? DateTime.parse(json['creationDate'])
            : null,
        cloneUrlHttp: json.containsKey('cloneUrlHttp')
            ? json['cloneUrlHttp'] as String
            : null,
        cloneUrlSsh: json.containsKey('cloneUrlSsh')
            ? json['cloneUrlSsh'] as String
            : null,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
      );
}

/// Information about a repository name and ID.
class RepositoryNameIdPair {
  /// The name associated with the repository.
  final String repositoryName;

  /// The ID associated with the repository.
  final String repositoryId;

  RepositoryNameIdPair({
    this.repositoryName,
    this.repositoryId,
  });
  static RepositoryNameIdPair fromJson(Map<String, dynamic> json) =>
      RepositoryNameIdPair(
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        repositoryId: json.containsKey('repositoryId')
            ? json['repositoryId'] as String
            : null,
      );
}

/// Information about a trigger for a repository.
class RepositoryTrigger {
  /// The name of the trigger.
  final String name;

  /// The ARN of the resource that is the target for a trigger. For example, the
  /// ARN of a topic in Amazon SNS.
  final String destinationArn;

  /// Any custom data associated with the trigger that will be included in the
  /// information sent to the target of the trigger.
  final String customData;

  /// The branches that will be included in the trigger configuration. If you
  /// specify an empty array, the trigger will apply to all branches.
  ///
  ///
  ///
  /// Although no content is required in the array, you must include the array
  /// itself.
  final List<String> branches;

  /// The repository events that will cause the trigger to run actions in
  /// another service, such as sending a notification through Amazon SNS.
  ///
  ///
  ///
  /// The valid value "all" cannot be used with any other values.
  final List<String> events;

  RepositoryTrigger({
    @required this.name,
    @required this.destinationArn,
    this.customData,
    this.branches,
    @required this.events,
  });
  static RepositoryTrigger fromJson(Map<String, dynamic> json) =>
      RepositoryTrigger(
        name: json['name'] as String,
        destinationArn: json['destinationArn'] as String,
        customData: json.containsKey('customData')
            ? json['customData'] as String
            : null,
        branches: json.containsKey('branches')
            ? (json['branches'] as List).map((e) => e as String).toList()
            : null,
        events: (json['events'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A trigger failed to run.
class RepositoryTriggerExecutionFailure {
  /// The name of the trigger that did not run.
  final String trigger;

  /// Additional message information about the trigger that did not run.
  final String failureMessage;

  RepositoryTriggerExecutionFailure({
    this.trigger,
    this.failureMessage,
  });
  static RepositoryTriggerExecutionFailure fromJson(
          Map<String, dynamic> json) =>
      RepositoryTriggerExecutionFailure(
        trigger: json.containsKey('trigger') ? json['trigger'] as String : null,
        failureMessage: json.containsKey('failureMessage')
            ? json['failureMessage'] as String
            : null,
      );
}

/// Information about the file mode changes.
class SetFileModeEntry {
  /// The full path to the file, including the name of the file.
  final String filePath;

  /// The file mode for the file.
  final String fileMode;

  SetFileModeEntry({
    @required this.filePath,
    @required this.fileMode,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information about a source file that is part of changes made in a commit.
class SourceFileSpecifier {
  /// The full path to the file, including the name of the file.
  final String filePath;

  /// Whether to remove the source file from the parent commit.
  final bool isMove;

  SourceFileSpecifier({
    @required this.filePath,
    this.isMove,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Returns information about a submodule reference in a repository folder.
class SubModule {
  /// The commit ID that contains the reference to the submodule.
  final String commitId;

  /// The fully qualified path to the folder that contains the reference to the
  /// submodule.
  final String absolutePath;

  /// The relative path of the submodule from the folder where the query
  /// originated.
  final String relativePath;

  SubModule({
    this.commitId,
    this.absolutePath,
    this.relativePath,
  });
  static SubModule fromJson(Map<String, dynamic> json) => SubModule(
        commitId:
            json.containsKey('commitId') ? json['commitId'] as String : null,
        absolutePath: json.containsKey('absolutePath')
            ? json['absolutePath'] as String
            : null,
        relativePath: json.containsKey('relativePath')
            ? json['relativePath'] as String
            : null,
      );
}

/// Returns information about a symbolic link in a repository folder.
class SymbolicLink {
  /// The blob ID that contains the information about the symbolic link.
  final String blobId;

  /// The fully-qualified path to the folder that contains the symbolic link.
  final String absolutePath;

  /// The relative path of the symbolic link from the folder where the query
  /// originated.
  final String relativePath;

  /// The file mode permissions of the blob that cotains information about the
  /// symbolic link.
  final String fileMode;

  SymbolicLink({
    this.blobId,
    this.absolutePath,
    this.relativePath,
    this.fileMode,
  });
  static SymbolicLink fromJson(Map<String, dynamic> json) => SymbolicLink(
        blobId: json.containsKey('blobId') ? json['blobId'] as String : null,
        absolutePath: json.containsKey('absolutePath')
            ? json['absolutePath'] as String
            : null,
        relativePath: json.containsKey('relativePath')
            ? json['relativePath'] as String
            : null,
        fileMode:
            json.containsKey('fileMode') ? json['fileMode'] as String : null,
      );
}

/// Returns information about a target for a pull request.
class Target {
  /// The name of the repository that contains the pull request.
  final String repositoryName;

  /// The branch of the repository that contains the changes for the pull
  /// request. Also known as the source branch.
  final String sourceReference;

  /// The branch of the repository where the pull request changes will be merged
  /// into. Also known as the destination branch.
  final String destinationReference;

  Target({
    @required this.repositoryName,
    @required this.sourceReference,
    this.destinationReference,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the output of a test repository triggers operation.
class TestRepositoryTriggersOutput {
  /// The list of triggers that were successfully tested. This list provides the
  /// names of the triggers that were successfully tested, separated by commas.
  final List<String> successfulExecutions;

  /// The list of triggers that were not able to be tested. This list provides
  /// the names of the triggers that could not be tested, separated by commas.
  final List<RepositoryTriggerExecutionFailure> failedExecutions;

  TestRepositoryTriggersOutput({
    this.successfulExecutions,
    this.failedExecutions,
  });
  static TestRepositoryTriggersOutput fromJson(Map<String, dynamic> json) =>
      TestRepositoryTriggersOutput(
        successfulExecutions: json.containsKey('successfulExecutions')
            ? (json['successfulExecutions'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        failedExecutions: json.containsKey('failedExecutions')
            ? (json['failedExecutions'] as List)
                .map((e) => RepositoryTriggerExecutionFailure.fromJson(e))
                .toList()
            : null,
      );
}

class UpdateCommentOutput {
  /// Information about the updated comment.
  final Comment comment;

  UpdateCommentOutput({
    this.comment,
  });
  static UpdateCommentOutput fromJson(Map<String, dynamic> json) =>
      UpdateCommentOutput(
        comment: json.containsKey('comment')
            ? Comment.fromJson(json['comment'])
            : null,
      );
}

class UpdatePullRequestDescriptionOutput {
  /// Information about the updated pull request.
  final PullRequest pullRequest;

  UpdatePullRequestDescriptionOutput({
    @required this.pullRequest,
  });
  static UpdatePullRequestDescriptionOutput fromJson(
          Map<String, dynamic> json) =>
      UpdatePullRequestDescriptionOutput(
        pullRequest: PullRequest.fromJson(json['pullRequest']),
      );
}

class UpdatePullRequestStatusOutput {
  /// Information about the pull request.
  final PullRequest pullRequest;

  UpdatePullRequestStatusOutput({
    @required this.pullRequest,
  });
  static UpdatePullRequestStatusOutput fromJson(Map<String, dynamic> json) =>
      UpdatePullRequestStatusOutput(
        pullRequest: PullRequest.fromJson(json['pullRequest']),
      );
}

class UpdatePullRequestTitleOutput {
  /// Information about the updated pull request.
  final PullRequest pullRequest;

  UpdatePullRequestTitleOutput({
    @required this.pullRequest,
  });
  static UpdatePullRequestTitleOutput fromJson(Map<String, dynamic> json) =>
      UpdatePullRequestTitleOutput(
        pullRequest: PullRequest.fromJson(json['pullRequest']),
      );
}

/// Information about the user who made a specified commit.
class UserInfo {
  /// The name of the user who made the specified commit.
  final String name;

  /// The email address associated with the user who made the commit, if any.
  final String email;

  /// The date when the specified commit was commited, in timestamp format with
  /// GMT offset.
  final String date;

  UserInfo({
    this.name,
    this.email,
    this.date,
  });
  static UserInfo fromJson(Map<String, dynamic> json) => UserInfo(
        name: json.containsKey('name') ? json['name'] as String : null,
        email: json.containsKey('email') ? json['email'] as String : null,
        date: json.containsKey('date') ? json['date'] as String : null,
      );
}
