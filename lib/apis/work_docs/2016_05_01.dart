import 'package:meta/meta.dart';

/// The WorkDocs API is designed for the following use cases:
///
/// *   File Migration: File migration applications are supported for users who
/// want to migrate their files from an on-premises or off-premises file system
/// or service. Users can insert files into a user directory structure, as well
/// as allow for basic metadata changes, such as modifications to the
/// permissions of files.
///
/// *   Security: Support security applications are supported for users who have
/// additional security needs, such as antivirus or data loss prevention. The
/// API actions, along with AWS CloudTrail, allow these applications to detect
/// when changes occur in Amazon WorkDocs. Then, the application can take the
/// necessary actions and replace the target file. If the target file violates
/// the policy, the application can also choose to email the user.
///
/// *   eDiscovery/Analytics: General administrative applications are supported,
/// such as eDiscovery and analytics. These applications can choose to mimic or
/// record the actions in an Amazon WorkDocs site, along with AWS CloudTrail, to
/// replicate data for eDiscovery, backup, or analytical applications.
///
///
/// All Amazon WorkDocs API actions are Amazon authenticated and
/// certificate-signed. They not only require the use of the AWS SDK, but also
/// allow for the exclusive use of IAM users and roles to help facilitate
/// access, trust, and permission policies. By creating a role and allowing an
/// IAM user to access the Amazon WorkDocs site, the IAM user gains full
/// administrative visibility into the entire Amazon WorkDocs site (or as set in
/// the IAM policy). This includes, but is not limited to, the ability to modify
/// file permissions and upload any file to any user. This allows developers to
/// perform the three use cases above, as well as give users the ability to
/// grant access on a selective basis using the IAM model.
class WorkDocsApi {
  /// Aborts the upload of the specified document version that was previously
  /// initiated by InitiateDocumentVersionUpload. The client should make this
  /// call only when it no longer intends to upload the document version, or
  /// fails to do so.
  Future<void> abortDocumentVersionUpload(
      {String authenticationToken,
      @required String documentId,
      @required String versionId}) async {}

  /// Activates the specified user. Only active users can access Amazon
  /// WorkDocs.
  Future<void> activateUser(String userId,
      {String authenticationToken}) async {}

  /// Creates a set of permissions for the specified folder or document. The
  /// resource permissions are overwritten if the principals already have
  /// different permissions.
  Future<void> addResourcePermissions(
      {String authenticationToken,
      @required String resourceId,
      @required List<SharePrincipal> principals,
      NotificationOptions notificationOptions}) async {}

  /// Adds a new comment to the specified document version.
  Future<void> createComment(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String parentId,
      String threadId,
      @required String text,
      String visibility,
      bool notifyCollaborators}) async {}

  /// Adds one or more custom properties to the specified resource (a folder,
  /// document, or version).
  Future<void> createCustomMetadata(
      {String authenticationToken,
      @required String resourceId,
      String versionId,
      @required Map<String, String> customMetadata}) async {}

  /// Creates a folder with the specified name and parent folder.
  Future<void> createFolder(String parentFolderId,
      {String authenticationToken, String name}) async {}

  /// Adds the specified list of labels to the given resource (a document or
  /// folder)
  Future<void> createLabels(
      {@required String resourceId,
      @required List<String> labels,
      String authenticationToken}) async {}

  /// Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint
  /// receives a confirmation message, and must confirm the subscription.
  ///
  /// For more information, see [Subscribe to
  /// Notifications](https://docs.aws.amazon.com/workdocs/latest/developerguide/subscribe-notifications.html)
  /// in the _Amazon WorkDocs Developer Guide_.
  Future<void> createNotificationSubscription(
      {@required String organizationId,
      @required String endpoint,
      @required String protocol,
      @required String subscriptionType}) async {}

  /// Creates a user in a Simple AD or Microsoft AD directory. The status of a
  /// newly created user is "ACTIVE". New users can access Amazon WorkDocs.
  Future<void> createUser(
      {String organizationId,
      @required String username,
      String emailAddress,
      @required String givenName,
      @required String surname,
      @required String password,
      String timeZoneId,
      StorageRuleType storageRule,
      String authenticationToken}) async {}

  /// Deactivates the specified user, which revokes the user's access to Amazon
  /// WorkDocs.
  Future<void> deactivateUser(String userId,
      {String authenticationToken}) async {}

  /// Deletes the specified comment from the document version.
  Future<void> deleteComment(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      @required String commentId}) async {}

  /// Deletes custom metadata from the specified resource.
  Future<void> deleteCustomMetadata(String resourceId,
      {String authenticationToken,
      String versionId,
      List<String> keys,
      bool deleteAll}) async {}

  /// Permanently deletes the specified document and its associated metadata.
  Future<void> deleteDocument(String documentId,
      {String authenticationToken}) async {}

  /// Permanently deletes the specified folder and its contents.
  Future<void> deleteFolder(String folderId,
      {String authenticationToken}) async {}

  /// Deletes the contents of the specified folder.
  Future<void> deleteFolderContents(String folderId,
      {String authenticationToken}) async {}

  /// Deletes the specified list of labels from a resource.
  Future<void> deleteLabels(String resourceId,
      {String authenticationToken,
      List<String> labels,
      bool deleteAll}) async {}

  /// Deletes the specified subscription from the specified organization.
  Future<void> deleteNotificationSubscription(
      {@required String subscriptionId,
      @required String organizationId}) async {}

  /// Deletes the specified user from a Simple AD or Microsoft AD directory.
  Future<void> deleteUser(String userId, {String authenticationToken}) async {}

  /// Describes the user activities in a specified time period.
  Future<void> describeActivities(
      {String authenticationToken,
      DateTime startTime,
      DateTime endTime,
      String organizationId,
      String activityTypes,
      String resourceId,
      String userId,
      bool includeIndirectActivities,
      int limit,
      String marker}) async {}

  /// List all the comments for the specified document version.
  Future<void> describeComments(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      int limit,
      String marker}) async {}

  /// Retrieves the document versions for the specified document.
  ///
  /// By default, only active versions are returned.
  Future<void> describeDocumentVersions(String documentId,
      {String authenticationToken,
      String marker,
      int limit,
      String include,
      String fields}) async {}

  /// Describes the contents of the specified folder, including its documents
  /// and subfolders.
  ///
  /// By default, Amazon WorkDocs returns the first 100 active document and
  /// folder metadata items. If there are more results, the response includes a
  /// marker that you can use to request the next set of results. You can also
  /// request initialized documents.
  Future<void> describeFolderContents(String folderId,
      {String authenticationToken,
      String sort,
      String order,
      int limit,
      String marker,
      String type,
      String include}) async {}

  /// Describes the groups specified by the query. Groups are defined by the
  /// underlying Active Directory.
  Future<void> describeGroups(String searchQuery,
      {String authenticationToken,
      String organizationId,
      String marker,
      int limit}) async {}

  /// Lists the specified notification subscriptions.
  Future<void> describeNotificationSubscriptions(String organizationId,
      {String marker, int limit}) async {}

  /// Describes the permissions of a specified resource.
  Future<void> describeResourcePermissions(String resourceId,
      {String authenticationToken,
      String principalId,
      int limit,
      String marker}) async {}

  /// Describes the current user's special folders; the `RootFolder` and the
  /// `RecycleBin`. `RootFolder` is the root of user's files and folders and
  /// `RecycleBin` is the root of recycled items. This is not a valid action for
  /// SigV4 (administrative API) clients.
  ///
  /// This action requires an authentication token. To get an authentication
  /// token, register an application with Amazon WorkDocs. For more information,
  /// see [Authentication and Access Control for User
  /// Applications](https://docs.aws.amazon.com/workdocs/latest/developerguide/wd-auth-user.html)
  /// in the _Amazon WorkDocs Developer Guide_.
  Future<void> describeRootFolders(String authenticationToken,
      {int limit, String marker}) async {}

  /// Describes the specified users. You can describe all users or filter the
  /// results (for example, by status or organization).
  ///
  /// By default, Amazon WorkDocs returns the first 24 active or pending users.
  /// If there are more results, the response includes a marker that you can use
  /// to request the next set of results.
  Future<void> describeUsers(
      {String authenticationToken,
      String organizationId,
      String userIds,
      String query,
      String include,
      String order,
      String sort,
      String marker,
      int limit,
      String fields}) async {}

  /// Retrieves details of the current user for whom the authentication token
  /// was generated. This is not a valid action for SigV4 (administrative API)
  /// clients.
  Future<void> getCurrentUser(String authenticationToken) async {}

  /// Retrieves details of a document.
  Future<void> getDocument(String documentId,
      {String authenticationToken, bool includeCustomMetadata}) async {}

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the requested document.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested document and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the names of the parent folders.
  Future<void> getDocumentPath(String documentId,
      {String authenticationToken,
      int limit,
      String fields,
      String marker}) async {}

  /// Retrieves version metadata for the specified document.
  Future<void> getDocumentVersion(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String fields,
      bool includeCustomMetadata}) async {}

  /// Retrieves the metadata of the specified folder.
  Future<void> getFolder(String folderId,
      {String authenticationToken, bool includeCustomMetadata}) async {}

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the specified folder.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested folder and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the parent folder names.
  Future<void> getFolderPath(String folderId,
      {String authenticationToken,
      int limit,
      String fields,
      String marker}) async {}

  /// Retrieves a collection of resources, including folders and documents. The
  /// only `CollectionType` supported is `SHARED\_WITH\_ME`.
  Future<void> getResources(
      {String authenticationToken,
      String userId,
      String collectionType,
      int limit,
      String marker}) async {}

  /// Creates a new document object and version object.
  ///
  /// The client specifies the parent folder ID and name of the document to
  /// upload. The ID is optionally specified when creating a new version of an
  /// existing document. This is the first step to upload a document. Next,
  /// upload the document to the URL returned from the call, and then call
  /// UpdateDocumentVersion.
  ///
  /// To cancel the document upload, call AbortDocumentVersionUpload.
  Future<void> initiateDocumentVersionUpload(String parentFolderId,
      {String authenticationToken,
      String id,
      String name,
      DateTime contentCreatedTimestamp,
      DateTime contentModifiedTimestamp,
      String contentType,
      BigInt documentSizeInBytes}) async {}

  /// Removes all the permissions from the specified resource.
  Future<void> removeAllResourcePermissions(String resourceId,
      {String authenticationToken}) async {}

  /// Removes the permission for the specified principal from the specified
  /// resource.
  Future<void> removeResourcePermission(
      {String authenticationToken,
      @required String resourceId,
      @required String principalId,
      String principalType}) async {}

  /// Updates the specified attributes of a document. The user must have access
  /// to both the document and its parent folder, if applicable.
  Future<void> updateDocument(String documentId,
      {String authenticationToken,
      String name,
      String parentFolderId,
      String resourceState}) async {}

  /// Changes the status of the document version to ACTIVE.
  ///
  /// Amazon WorkDocs also sets its document container to ACTIVE. This is the
  /// last step in a document upload, after the client uploads the document to
  /// an S3-presigned URL returned by InitiateDocumentVersionUpload.
  Future<void> updateDocumentVersion(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String versionStatus}) async {}

  /// Updates the specified attributes of the specified folder. The user must
  /// have access to both the folder and its parent folder, if applicable.
  Future<void> updateFolder(String folderId,
      {String authenticationToken,
      String name,
      String parentFolderId,
      String resourceState}) async {}

  /// Updates the specified attributes of the specified user, and grants or
  /// revokes administrative privileges to the Amazon WorkDocs site.
  Future<void> updateUser(String userId,
      {String authenticationToken,
      String givenName,
      String surname,
      String type,
      StorageRuleType storageRule,
      String timeZoneId,
      String locale,
      String grantPoweruserPrivileges}) async {}
}

class ActivateUserResponse {}

class Activity {}

class AddResourcePermissionsResponse {}

class Comment {}

class CommentMetadata {}

class CreateCommentResponse {}

class CreateCustomMetadataResponse {}

class CreateFolderResponse {}

class CreateLabelsResponse {}

class CreateNotificationSubscriptionResponse {}

class CreateUserResponse {}

class DeleteCustomMetadataResponse {}

class DeleteLabelsResponse {}

class DescribeActivitiesResponse {}

class DescribeCommentsResponse {}

class DescribeDocumentVersionsResponse {}

class DescribeFolderContentsResponse {}

class DescribeGroupsResponse {}

class DescribeNotificationSubscriptionsResponse {}

class DescribeResourcePermissionsResponse {}

class DescribeRootFoldersResponse {}

class DescribeUsersResponse {}

class DocumentMetadata {}

class DocumentVersionMetadata {}

class FolderMetadata {}

class GetCurrentUserResponse {}

class GetDocumentPathResponse {}

class GetDocumentResponse {}

class GetDocumentVersionResponse {}

class GetFolderPathResponse {}

class GetFolderResponse {}

class GetResourcesResponse {}

class GroupMetadata {}

class InitiateDocumentVersionUploadResponse {}

class NotificationOptions {}

class Participants {}

class PermissionInfo {}

class Principal {}

class ResourceMetadata {}

class ResourcePath {}

class ResourcePathComponent {}

class SharePrincipal {}

class ShareResult {}

class StorageRuleType {}

class Subscription {}

class UpdateUserResponse {}

class UploadMetadata {}

class User {}

class UserMetadata {}

class UserStorageMetadata {}
