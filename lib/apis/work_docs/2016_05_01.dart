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
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The ID of the version.
  Future<void> abortDocumentVersionUpload(
      {String authenticationToken,
      @required String documentId,
      @required String versionId}) async {}

  /// Activates the specified user. Only active users can access Amazon
  /// WorkDocs.
  ///
  /// [userId]: The ID of the user.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  Future<ActivateUserResponse> activateUser(String userId,
      {String authenticationToken}) async {
    return ActivateUserResponse.fromJson({});
  }

  /// Creates a set of permissions for the specified folder or document. The
  /// resource permissions are overwritten if the principals already have
  /// different permissions.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [principals]: The users, groups, or organization being granted permission.
  ///
  /// [notificationOptions]: The notification options.
  Future<AddResourcePermissionsResponse> addResourcePermissions(
      {String authenticationToken,
      @required String resourceId,
      @required List<SharePrincipal> principals,
      NotificationOptions notificationOptions}) async {
    return AddResourcePermissionsResponse.fromJson({});
  }

  /// Adds a new comment to the specified document version.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The ID of the document version.
  ///
  /// [parentId]: The ID of the parent comment.
  ///
  /// [threadId]: The ID of the root comment in the thread.
  ///
  /// [text]: The text of the comment.
  ///
  /// [visibility]: The visibility of the comment. Options are either PRIVATE,
  /// where the comment is visible only to the comment author and document owner
  /// and co-owners, or PUBLIC, where the comment is visible to document owners,
  /// co-owners, and contributors.
  ///
  /// [notifyCollaborators]: Set this parameter to TRUE to send an email out to
  /// the document collaborators after the comment is created.
  Future<CreateCommentResponse> createComment(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String parentId,
      String threadId,
      @required String text,
      String visibility,
      bool notifyCollaborators}) async {
    return CreateCommentResponse.fromJson({});
  }

  /// Adds one or more custom properties to the specified resource (a folder,
  /// document, or version).
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [versionId]: The ID of the version, if the custom metadata is being added
  /// to a document version.
  ///
  /// [customMetadata]: Custom metadata in the form of name-value pairs.
  Future<CreateCustomMetadataResponse> createCustomMetadata(
      {String authenticationToken,
      @required String resourceId,
      String versionId,
      @required Map<String, String> customMetadata}) async {
    return CreateCustomMetadataResponse.fromJson({});
  }

  /// Creates a folder with the specified name and parent folder.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [name]: The name of the new folder.
  ///
  /// [parentFolderId]: The ID of the parent folder.
  Future<CreateFolderResponse> createFolder(String parentFolderId,
      {String authenticationToken, String name}) async {
    return CreateFolderResponse.fromJson({});
  }

  /// Adds the specified list of labels to the given resource (a document or
  /// folder)
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [labels]: List of labels to add to the resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  Future<CreateLabelsResponse> createLabels(
      {@required String resourceId,
      @required List<String> labels,
      String authenticationToken}) async {
    return CreateLabelsResponse.fromJson({});
  }

  /// Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint
  /// receives a confirmation message, and must confirm the subscription.
  ///
  /// For more information, see [Subscribe to
  /// Notifications](https://docs.aws.amazon.com/workdocs/latest/developerguide/subscribe-notifications.html)
  /// in the _Amazon WorkDocs Developer Guide_.
  ///
  /// [organizationId]: The ID of the organization.
  ///
  /// [endpoint]: The endpoint to receive the notifications. If the protocol is
  /// HTTPS, the endpoint is a URL that begins with `https`.
  ///
  /// [protocol]: The protocol to use. The supported value is https, which
  /// delivers JSON-encoded messages using HTTPS POST.
  ///
  /// [subscriptionType]: The notification type.
  Future<CreateNotificationSubscriptionResponse> createNotificationSubscription(
      {@required String organizationId,
      @required String endpoint,
      @required String protocol,
      @required String subscriptionType}) async {
    return CreateNotificationSubscriptionResponse.fromJson({});
  }

  /// Creates a user in a Simple AD or Microsoft AD directory. The status of a
  /// newly created user is "ACTIVE". New users can access Amazon WorkDocs.
  ///
  /// [organizationId]: The ID of the organization.
  ///
  /// [username]: The login name of the user.
  ///
  /// [emailAddress]: The email address of the user.
  ///
  /// [givenName]: The given name of the user.
  ///
  /// [surname]: The surname of the user.
  ///
  /// [password]: The password of the user.
  ///
  /// [timeZoneId]: The time zone ID of the user.
  ///
  /// [storageRule]: The amount of storage for the user.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  Future<CreateUserResponse> createUser(
      {String organizationId,
      @required String username,
      String emailAddress,
      @required String givenName,
      @required String surname,
      @required String password,
      String timeZoneId,
      StorageRuleType storageRule,
      String authenticationToken}) async {
    return CreateUserResponse.fromJson({});
  }

  /// Deactivates the specified user, which revokes the user's access to Amazon
  /// WorkDocs.
  ///
  /// [userId]: The ID of the user.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  Future<void> deactivateUser(String userId,
      {String authenticationToken}) async {}

  /// Deletes the specified comment from the document version.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The ID of the document version.
  ///
  /// [commentId]: The ID of the comment.
  Future<void> deleteComment(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      @required String commentId}) async {}

  /// Deletes custom metadata from the specified resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource, either a document or folder.
  ///
  /// [versionId]: The ID of the version, if the custom metadata is being
  /// deleted from a document version.
  ///
  /// [keys]: List of properties to remove.
  ///
  /// [deleteAll]: Flag to indicate removal of all custom metadata properties
  /// from the specified resource.
  Future<DeleteCustomMetadataResponse> deleteCustomMetadata(String resourceId,
      {String authenticationToken,
      String versionId,
      List<String> keys,
      bool deleteAll}) async {
    return DeleteCustomMetadataResponse.fromJson({});
  }

  /// Permanently deletes the specified document and its associated metadata.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  Future<void> deleteDocument(String documentId,
      {String authenticationToken}) async {}

  /// Permanently deletes the specified folder and its contents.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  Future<void> deleteFolder(String folderId,
      {String authenticationToken}) async {}

  /// Deletes the contents of the specified folder.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  Future<void> deleteFolderContents(String folderId,
      {String authenticationToken}) async {}

  /// Deletes the specified list of labels from a resource.
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [labels]: List of labels to delete from the resource.
  ///
  /// [deleteAll]: Flag to request removal of all labels from the specified
  /// resource.
  Future<DeleteLabelsResponse> deleteLabels(String resourceId,
      {String authenticationToken, List<String> labels, bool deleteAll}) async {
    return DeleteLabelsResponse.fromJson({});
  }

  /// Deletes the specified subscription from the specified organization.
  ///
  /// [subscriptionId]: The ID of the subscription.
  ///
  /// [organizationId]: The ID of the organization.
  Future<void> deleteNotificationSubscription(
      {@required String subscriptionId,
      @required String organizationId}) async {}

  /// Deletes the specified user from a Simple AD or Microsoft AD directory.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [userId]: The ID of the user.
  Future<void> deleteUser(String userId, {String authenticationToken}) async {}

  /// Describes the user activities in a specified time period.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [startTime]: The timestamp that determines the starting time of the
  /// activities. The response includes the activities performed after the
  /// specified timestamp.
  ///
  /// [endTime]: The timestamp that determines the end time of the activities.
  /// The response includes the activities performed before the specified
  /// timestamp.
  ///
  /// [organizationId]: The ID of the organization. This is a mandatory
  /// parameter when using administrative API (SigV4) requests.
  ///
  /// [activityTypes]: Specifies which activity types to include in the
  /// response. If this field is left empty, all activity types are returned.
  ///
  /// [resourceId]: The document or folder ID for which to describe activity
  /// types.
  ///
  /// [userId]: The ID of the user who performed the action. The response
  /// includes activities pertaining to this user. This is an optional parameter
  /// and is only applicable for administrative API (SigV4) requests.
  ///
  /// [includeIndirectActivities]: Includes indirect activities. An indirect
  /// activity results from a direct activity performed on a parent resource.
  /// For example, sharing a parent folder (the direct activity) shares all of
  /// the subfolders and documents within the parent folder (the indirect
  /// activity).
  ///
  /// [limit]: The maximum number of items to return.
  ///
  /// [marker]: The marker for the next set of results.
  Future<DescribeActivitiesResponse> describeActivities(
      {String authenticationToken,
      DateTime startTime,
      DateTime endTime,
      String organizationId,
      String activityTypes,
      String resourceId,
      String userId,
      bool includeIndirectActivities,
      int limit,
      String marker}) async {
    return DescribeActivitiesResponse.fromJson({});
  }

  /// List all the comments for the specified document version.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The ID of the document version.
  ///
  /// [limit]: The maximum number of items to return.
  ///
  /// [marker]: The marker for the next set of results. This marker was received
  /// from a previous call.
  Future<DescribeCommentsResponse> describeComments(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      int limit,
      String marker}) async {
    return DescribeCommentsResponse.fromJson({});
  }

  /// Retrieves the document versions for the specified document.
  ///
  /// By default, only active versions are returned.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [limit]: The maximum number of versions to return with this call.
  ///
  /// [include]: A comma-separated list of values. Specify "INITIALIZED" to
  /// include incomplete versions.
  ///
  /// [fields]: Specify "SOURCE" to include initialized versions and a URL for
  /// the source document.
  Future<DescribeDocumentVersionsResponse> describeDocumentVersions(
      String documentId,
      {String authenticationToken,
      String marker,
      int limit,
      String include,
      String fields}) async {
    return DescribeDocumentVersionsResponse.fromJson({});
  }

  /// Describes the contents of the specified folder, including its documents
  /// and subfolders.
  ///
  /// By default, Amazon WorkDocs returns the first 100 active document and
  /// folder metadata items. If there are more results, the response includes a
  /// marker that you can use to request the next set of results. You can also
  /// request initialized documents.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  ///
  /// [sort]: The sorting criteria.
  ///
  /// [order]: The order for the contents of the folder.
  ///
  /// [limit]: The maximum number of items to return with this call.
  ///
  /// [marker]: The marker for the next set of results. This marker was received
  /// from a previous call.
  ///
  /// [type]: The type of items.
  ///
  /// [include]: The contents to include. Specify "INITIALIZED" to include
  /// initialized documents.
  Future<DescribeFolderContentsResponse> describeFolderContents(String folderId,
      {String authenticationToken,
      String sort,
      String order,
      int limit,
      String marker,
      String type,
      String include}) async {
    return DescribeFolderContentsResponse.fromJson({});
  }

  /// Describes the groups specified by the query. Groups are defined by the
  /// underlying Active Directory.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [searchQuery]: A query to describe groups by group name.
  ///
  /// [organizationId]: The ID of the organization.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [limit]: The maximum number of items to return with this call.
  Future<DescribeGroupsResponse> describeGroups(String searchQuery,
      {String authenticationToken,
      String organizationId,
      String marker,
      int limit}) async {
    return DescribeGroupsResponse.fromJson({});
  }

  /// Lists the specified notification subscriptions.
  ///
  /// [organizationId]: The ID of the organization.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [limit]: The maximum number of items to return with this call.
  Future<DescribeNotificationSubscriptionsResponse>
      describeNotificationSubscriptions(String organizationId,
          {String marker, int limit}) async {
    return DescribeNotificationSubscriptionsResponse.fromJson({});
  }

  /// Describes the permissions of a specified resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [principalId]: The ID of the principal to filter permissions by.
  ///
  /// [limit]: The maximum number of items to return with this call.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call)
  Future<DescribeResourcePermissionsResponse> describeResourcePermissions(
      String resourceId,
      {String authenticationToken,
      String principalId,
      int limit,
      String marker}) async {
    return DescribeResourcePermissionsResponse.fromJson({});
  }

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
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [limit]: The maximum number of items to return.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  Future<DescribeRootFoldersResponse> describeRootFolders(
      String authenticationToken,
      {int limit,
      String marker}) async {
    return DescribeRootFoldersResponse.fromJson({});
  }

  /// Describes the specified users. You can describe all users or filter the
  /// results (for example, by status or organization).
  ///
  /// By default, Amazon WorkDocs returns the first 24 active or pending users.
  /// If there are more results, the response includes a marker that you can use
  /// to request the next set of results.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [organizationId]: The ID of the organization.
  ///
  /// [userIds]: The IDs of the users.
  ///
  /// [query]: A query to filter users by user name.
  ///
  /// [include]: The state of the users. Specify "ALL" to include inactive
  /// users.
  ///
  /// [order]: The order for the results.
  ///
  /// [sort]: The sorting criteria.
  ///
  /// [marker]: The marker for the next set of results. (You received this
  /// marker from a previous call.)
  ///
  /// [limit]: The maximum number of items to return.
  ///
  /// [fields]: A comma-separated list of values. Specify "STORAGE_METADATA" to
  /// include the user storage quota and utilization information.
  Future<DescribeUsersResponse> describeUsers(
      {String authenticationToken,
      String organizationId,
      String userIds,
      String query,
      String include,
      String order,
      String sort,
      String marker,
      int limit,
      String fields}) async {
    return DescribeUsersResponse.fromJson({});
  }

  /// Retrieves details of the current user for whom the authentication token
  /// was generated. This is not a valid action for SigV4 (administrative API)
  /// clients.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  Future<GetCurrentUserResponse> getCurrentUser(
      String authenticationToken) async {
    return GetCurrentUserResponse.fromJson({});
  }

  /// Retrieves details of a document.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [includeCustomMetadata]: Set this to `TRUE` to include custom metadata in
  /// the response.
  Future<GetDocumentResponse> getDocument(String documentId,
      {String authenticationToken, bool includeCustomMetadata}) async {
    return GetDocumentResponse.fromJson({});
  }

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the requested document.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested document and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the names of the parent folders.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [limit]: The maximum number of levels in the hierarchy to return.
  ///
  /// [fields]: A comma-separated list of values. Specify `NAME` to include the
  /// names of the parent folders.
  ///
  /// [marker]: This value is not supported.
  Future<GetDocumentPathResponse> getDocumentPath(String documentId,
      {String authenticationToken,
      int limit,
      String fields,
      String marker}) async {
    return GetDocumentPathResponse.fromJson({});
  }

  /// Retrieves version metadata for the specified document.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The version ID of the document.
  ///
  /// [fields]: A comma-separated list of values. Specify "SOURCE" to include a
  /// URL for the source document.
  ///
  /// [includeCustomMetadata]: Set this to TRUE to include custom metadata in
  /// the response.
  Future<GetDocumentVersionResponse> getDocumentVersion(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String fields,
      bool includeCustomMetadata}) async {
    return GetDocumentVersionResponse.fromJson({});
  }

  /// Retrieves the metadata of the specified folder.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  ///
  /// [includeCustomMetadata]: Set to TRUE to include custom metadata in the
  /// response.
  Future<GetFolderResponse> getFolder(String folderId,
      {String authenticationToken, bool includeCustomMetadata}) async {
    return GetFolderResponse.fromJson({});
  }

  /// Retrieves the path information (the hierarchy from the root folder) for
  /// the specified folder.
  ///
  /// By default, Amazon WorkDocs returns a maximum of 100 levels upwards from
  /// the requested folder and only includes the IDs of the parent folders in
  /// the path. You can limit the maximum number of levels. You can also request
  /// the parent folder names.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  ///
  /// [limit]: The maximum number of levels in the hierarchy to return.
  ///
  /// [fields]: A comma-separated list of values. Specify "NAME" to include the
  /// names of the parent folders.
  ///
  /// [marker]: This value is not supported.
  Future<GetFolderPathResponse> getFolderPath(String folderId,
      {String authenticationToken,
      int limit,
      String fields,
      String marker}) async {
    return GetFolderPathResponse.fromJson({});
  }

  /// Retrieves a collection of resources, including folders and documents. The
  /// only `CollectionType` supported is `SHARED\_WITH\_ME`.
  ///
  /// [authenticationToken]: The Amazon WorkDocs authentication token. Do not
  /// set this field when using administrative API actions, as in accessing the
  /// API operation using AWS credentials.
  ///
  /// [userId]: The user ID for the resource collection. This is a required
  /// field for accessing the API operation using IAM credentials.
  ///
  /// [collectionType]: The collection type.
  ///
  /// [limit]: The maximum number of resources to return.
  ///
  /// [marker]: The marker for the next set of results. This marker was received
  /// from a previous call.
  Future<GetResourcesResponse> getResources(
      {String authenticationToken,
      String userId,
      String collectionType,
      int limit,
      String marker}) async {
    return GetResourcesResponse.fromJson({});
  }

  /// Creates a new document object and version object.
  ///
  /// The client specifies the parent folder ID and name of the document to
  /// upload. The ID is optionally specified when creating a new version of an
  /// existing document. This is the first step to upload a document. Next,
  /// upload the document to the URL returned from the call, and then call
  /// UpdateDocumentVersion.
  ///
  /// To cancel the document upload, call AbortDocumentVersionUpload.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [id]: The ID of the document.
  ///
  /// [name]: The name of the document.
  ///
  /// [contentCreatedTimestamp]: The timestamp when the content of the document
  /// was originally created.
  ///
  /// [contentModifiedTimestamp]: The timestamp when the content of the document
  /// was modified.
  ///
  /// [contentType]: The content type of the document.
  ///
  /// [documentSizeInBytes]: The size of the document, in bytes.
  ///
  /// [parentFolderId]: The ID of the parent folder.
  Future<InitiateDocumentVersionUploadResponse> initiateDocumentVersionUpload(
      String parentFolderId,
      {String authenticationToken,
      String id,
      String name,
      DateTime contentCreatedTimestamp,
      DateTime contentModifiedTimestamp,
      String contentType,
      BigInt documentSizeInBytes}) async {
    return InitiateDocumentVersionUploadResponse.fromJson({});
  }

  /// Removes all the permissions from the specified resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource.
  Future<void> removeAllResourcePermissions(String resourceId,
      {String authenticationToken}) async {}

  /// Removes the permission for the specified principal from the specified
  /// resource.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [resourceId]: The ID of the resource.
  ///
  /// [principalId]: The principal ID of the resource.
  ///
  /// [principalType]: The principal type of the resource.
  Future<void> removeResourcePermission(
      {String authenticationToken,
      @required String resourceId,
      @required String principalId,
      String principalType}) async {}

  /// Updates the specified attributes of a document. The user must have access
  /// to both the document and its parent folder, if applicable.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [name]: The name of the document.
  ///
  /// [parentFolderId]: The ID of the parent folder.
  ///
  /// [resourceState]: The resource state of the document. Only ACTIVE and
  /// RECYCLED are supported.
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
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [documentId]: The ID of the document.
  ///
  /// [versionId]: The version ID of the document.
  ///
  /// [versionStatus]: The status of the version.
  Future<void> updateDocumentVersion(
      {String authenticationToken,
      @required String documentId,
      @required String versionId,
      String versionStatus}) async {}

  /// Updates the specified attributes of the specified folder. The user must
  /// have access to both the folder and its parent folder, if applicable.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [folderId]: The ID of the folder.
  ///
  /// [name]: The name of the folder.
  ///
  /// [parentFolderId]: The ID of the parent folder.
  ///
  /// [resourceState]: The resource state of the folder. Only ACTIVE and
  /// RECYCLED are accepted values from the API.
  Future<void> updateFolder(String folderId,
      {String authenticationToken,
      String name,
      String parentFolderId,
      String resourceState}) async {}

  /// Updates the specified attributes of the specified user, and grants or
  /// revokes administrative privileges to the Amazon WorkDocs site.
  ///
  /// [authenticationToken]: Amazon WorkDocs authentication token. Do not set
  /// this field when using administrative API actions, as in accessing the API
  /// using AWS credentials.
  ///
  /// [userId]: The ID of the user.
  ///
  /// [givenName]: The given name of the user.
  ///
  /// [surname]: The surname of the user.
  ///
  /// [type]: The type of the user.
  ///
  /// [storageRule]: The amount of storage for the user.
  ///
  /// [timeZoneId]: The time zone ID of the user.
  ///
  /// [locale]: The locale of the user.
  ///
  /// [grantPoweruserPrivileges]: Boolean value to determine whether the user is
  /// granted Poweruser privileges.
  Future<UpdateUserResponse> updateUser(String userId,
      {String authenticationToken,
      String givenName,
      String surname,
      String type,
      StorageRuleType storageRule,
      String timeZoneId,
      String locale,
      String grantPoweruserPrivileges}) async {
    return UpdateUserResponse.fromJson({});
  }
}

class ActivateUserResponse {
  /// The user information.
  final User user;

  ActivateUserResponse({
    this.user,
  });
  static ActivateUserResponse fromJson(Map<String, dynamic> json) =>
      ActivateUserResponse();
}

class Activity {
  /// The activity type.
  final String type;

  /// The timestamp when the action was performed.
  final DateTime timeStamp;

  /// Indicates whether an activity is indirect or direct. An indirect activity
  /// results from a direct activity performed on a parent resource. For
  /// example, sharing a parent folder (the direct activity) shares all of the
  /// subfolders and documents within the parent folder (the indirect activity).
  final bool isIndirectActivity;

  /// The ID of the organization.
  final String organizationId;

  /// The user who performed the action.
  final UserMetadata initiator;

  /// The list of users or groups impacted by this action. This is an optional
  /// field and is filled for the following sharing activities:
  /// DOCUMENT\_SHARED, DOCUMENT\_SHARED, DOCUMENT\_UNSHARED, FOLDER\_SHARED,
  /// FOLDER_UNSHARED.
  final Participants participants;

  /// The metadata of the resource involved in the user action.
  final ResourceMetadata resourceMetadata;

  /// The original parent of the resource. This is an optional field and is
  /// filled for move activities.
  final ResourceMetadata originalParent;

  /// Metadata of the commenting activity. This is an optional field and is
  /// filled for commenting activities.
  final CommentMetadata commentMetadata;

  Activity({
    this.type,
    this.timeStamp,
    this.isIndirectActivity,
    this.organizationId,
    this.initiator,
    this.participants,
    this.resourceMetadata,
    this.originalParent,
    this.commentMetadata,
  });
  static Activity fromJson(Map<String, dynamic> json) => Activity();
}

class AddResourcePermissionsResponse {
  /// The share results.
  final List<ShareResult> shareResults;

  AddResourcePermissionsResponse({
    this.shareResults,
  });
  static AddResourcePermissionsResponse fromJson(Map<String, dynamic> json) =>
      AddResourcePermissionsResponse();
}

class Comment {
  /// The ID of the comment.
  final String commentId;

  /// The ID of the parent comment.
  final String parentId;

  /// The ID of the root comment in the thread.
  final String threadId;

  /// The text of the comment.
  final String text;

  /// The details of the user who made the comment.
  final User contributor;

  /// The time that the comment was created.
  final DateTime createdTimestamp;

  /// The status of the comment.
  final String status;

  /// The visibility of the comment. Options are either PRIVATE, where the
  /// comment is visible only to the comment author and document owner and
  /// co-owners, or PUBLIC, where the comment is visible to document owners,
  /// co-owners, and contributors.
  final String visibility;

  /// If the comment is a reply to another user's comment, this field contains
  /// the user ID of the user being replied to.
  final String recipientId;

  Comment({
    @required this.commentId,
    this.parentId,
    this.threadId,
    this.text,
    this.contributor,
    this.createdTimestamp,
    this.status,
    this.visibility,
    this.recipientId,
  });
  static Comment fromJson(Map<String, dynamic> json) => Comment();
}

class CommentMetadata {
  /// The ID of the comment.
  final String commentId;

  /// The user who made the comment.
  final User contributor;

  /// The timestamp that the comment was created.
  final DateTime createdTimestamp;

  /// The status of the comment.
  final String commentStatus;

  /// The ID of the user being replied to.
  final String recipientId;

  CommentMetadata({
    this.commentId,
    this.contributor,
    this.createdTimestamp,
    this.commentStatus,
    this.recipientId,
  });
  static CommentMetadata fromJson(Map<String, dynamic> json) =>
      CommentMetadata();
}

class CreateCommentResponse {
  /// The comment that has been created.
  final Comment comment;

  CreateCommentResponse({
    this.comment,
  });
  static CreateCommentResponse fromJson(Map<String, dynamic> json) =>
      CreateCommentResponse();
}

class CreateCustomMetadataResponse {
  CreateCustomMetadataResponse();
  static CreateCustomMetadataResponse fromJson(Map<String, dynamic> json) =>
      CreateCustomMetadataResponse();
}

class CreateFolderResponse {
  /// The metadata of the folder.
  final FolderMetadata metadata;

  CreateFolderResponse({
    this.metadata,
  });
  static CreateFolderResponse fromJson(Map<String, dynamic> json) =>
      CreateFolderResponse();
}

class CreateLabelsResponse {
  CreateLabelsResponse();
  static CreateLabelsResponse fromJson(Map<String, dynamic> json) =>
      CreateLabelsResponse();
}

class CreateNotificationSubscriptionResponse {
  /// The subscription.
  final Subscription subscription;

  CreateNotificationSubscriptionResponse({
    this.subscription,
  });
  static CreateNotificationSubscriptionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateNotificationSubscriptionResponse();
}

class CreateUserResponse {
  /// The user information.
  final User user;

  CreateUserResponse({
    this.user,
  });
  static CreateUserResponse fromJson(Map<String, dynamic> json) =>
      CreateUserResponse();
}

class DeleteCustomMetadataResponse {
  DeleteCustomMetadataResponse();
  static DeleteCustomMetadataResponse fromJson(Map<String, dynamic> json) =>
      DeleteCustomMetadataResponse();
}

class DeleteLabelsResponse {
  DeleteLabelsResponse();
  static DeleteLabelsResponse fromJson(Map<String, dynamic> json) =>
      DeleteLabelsResponse();
}

class DescribeActivitiesResponse {
  /// The list of activities for the specified user and time period.
  final List<Activity> userActivities;

  /// The marker for the next set of results.
  final String marker;

  DescribeActivitiesResponse({
    this.userActivities,
    this.marker,
  });
  static DescribeActivitiesResponse fromJson(Map<String, dynamic> json) =>
      DescribeActivitiesResponse();
}

class DescribeCommentsResponse {
  /// The list of comments for the specified document version.
  final List<Comment> comments;

  /// The marker for the next set of results. This marker was received from a
  /// previous call.
  final String marker;

  DescribeCommentsResponse({
    this.comments,
    this.marker,
  });
  static DescribeCommentsResponse fromJson(Map<String, dynamic> json) =>
      DescribeCommentsResponse();
}

class DescribeDocumentVersionsResponse {
  /// The document versions.
  final List<DocumentVersionMetadata> documentVersions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeDocumentVersionsResponse({
    this.documentVersions,
    this.marker,
  });
  static DescribeDocumentVersionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeDocumentVersionsResponse();
}

class DescribeFolderContentsResponse {
  /// The subfolders in the specified folder.
  final List<FolderMetadata> folders;

  /// The documents in the specified folder.
  final List<DocumentMetadata> documents;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeFolderContentsResponse({
    this.folders,
    this.documents,
    this.marker,
  });
  static DescribeFolderContentsResponse fromJson(Map<String, dynamic> json) =>
      DescribeFolderContentsResponse();
}

class DescribeGroupsResponse {
  /// The list of groups.
  final List<GroupMetadata> groups;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeGroupsResponse({
    this.groups,
    this.marker,
  });
  static DescribeGroupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeGroupsResponse();
}

class DescribeNotificationSubscriptionsResponse {
  /// The subscriptions.
  final List<Subscription> subscriptions;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeNotificationSubscriptionsResponse({
    this.subscriptions,
    this.marker,
  });
  static DescribeNotificationSubscriptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeNotificationSubscriptionsResponse();
}

class DescribeResourcePermissionsResponse {
  /// The principals.
  final List<Principal> principals;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeResourcePermissionsResponse({
    this.principals,
    this.marker,
  });
  static DescribeResourcePermissionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeResourcePermissionsResponse();
}

class DescribeRootFoldersResponse {
  /// The user's special folders.
  final List<FolderMetadata> folders;

  /// The marker for the next set of results.
  final String marker;

  DescribeRootFoldersResponse({
    this.folders,
    this.marker,
  });
  static DescribeRootFoldersResponse fromJson(Map<String, dynamic> json) =>
      DescribeRootFoldersResponse();
}

class DescribeUsersResponse {
  /// The users.
  final List<User> users;

  /// The total number of users included in the results.
  final BigInt totalNumberOfUsers;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  DescribeUsersResponse({
    this.users,
    this.totalNumberOfUsers,
    this.marker,
  });
  static DescribeUsersResponse fromJson(Map<String, dynamic> json) =>
      DescribeUsersResponse();
}

class DocumentMetadata {
  /// The ID of the document.
  final String id;

  /// The ID of the creator.
  final String creatorId;

  /// The ID of the parent folder.
  final String parentFolderId;

  /// The time when the document was created.
  final DateTime createdTimestamp;

  /// The time when the document was updated.
  final DateTime modifiedTimestamp;

  /// The latest version of the document.
  final DocumentVersionMetadata latestVersionMetadata;

  /// The resource state.
  final String resourceState;

  /// List of labels on the document.
  final List<String> labels;

  DocumentMetadata({
    this.id,
    this.creatorId,
    this.parentFolderId,
    this.createdTimestamp,
    this.modifiedTimestamp,
    this.latestVersionMetadata,
    this.resourceState,
    this.labels,
  });
  static DocumentMetadata fromJson(Map<String, dynamic> json) =>
      DocumentMetadata();
}

class DocumentVersionMetadata {
  /// The ID of the version.
  final String id;

  /// The name of the version.
  final String name;

  /// The content type of the document.
  final String contentType;

  /// The size of the document, in bytes.
  final BigInt size;

  /// The signature of the document.
  final String signature;

  /// The status of the document.
  final String status;

  /// The timestamp when the document was first uploaded.
  final DateTime createdTimestamp;

  /// The timestamp when the document was last uploaded.
  final DateTime modifiedTimestamp;

  /// The timestamp when the content of the document was originally created.
  final DateTime contentCreatedTimestamp;

  /// The timestamp when the content of the document was modified.
  final DateTime contentModifiedTimestamp;

  /// The ID of the creator.
  final String creatorId;

  /// The thumbnail of the document.
  final Map<String, String> thumbnail;

  /// The source of the document.
  final Map<String, String> source;

  DocumentVersionMetadata({
    this.id,
    this.name,
    this.contentType,
    this.size,
    this.signature,
    this.status,
    this.createdTimestamp,
    this.modifiedTimestamp,
    this.contentCreatedTimestamp,
    this.contentModifiedTimestamp,
    this.creatorId,
    this.thumbnail,
    this.source,
  });
  static DocumentVersionMetadata fromJson(Map<String, dynamic> json) =>
      DocumentVersionMetadata();
}

class FolderMetadata {
  /// The ID of the folder.
  final String id;

  /// The name of the folder.
  final String name;

  /// The ID of the creator.
  final String creatorId;

  /// The ID of the parent folder.
  final String parentFolderId;

  /// The time when the folder was created.
  final DateTime createdTimestamp;

  /// The time when the folder was updated.
  final DateTime modifiedTimestamp;

  /// The resource state of the folder.
  final String resourceState;

  /// The unique identifier created from the subfolders and documents of the
  /// folder.
  final String signature;

  /// List of labels on the folder.
  final List<String> labels;

  /// The size of the folder metadata.
  final BigInt size;

  /// The size of the latest version of the folder metadata.
  final BigInt latestVersionSize;

  FolderMetadata({
    this.id,
    this.name,
    this.creatorId,
    this.parentFolderId,
    this.createdTimestamp,
    this.modifiedTimestamp,
    this.resourceState,
    this.signature,
    this.labels,
    this.size,
    this.latestVersionSize,
  });
  static FolderMetadata fromJson(Map<String, dynamic> json) => FolderMetadata();
}

class GetCurrentUserResponse {
  /// Metadata of the user.
  final User user;

  GetCurrentUserResponse({
    this.user,
  });
  static GetCurrentUserResponse fromJson(Map<String, dynamic> json) =>
      GetCurrentUserResponse();
}

class GetDocumentPathResponse {
  /// The path information.
  final ResourcePath path;

  GetDocumentPathResponse({
    this.path,
  });
  static GetDocumentPathResponse fromJson(Map<String, dynamic> json) =>
      GetDocumentPathResponse();
}

class GetDocumentResponse {
  /// The metadata details of the document.
  final DocumentMetadata metadata;

  /// The custom metadata on the document.
  final Map<String, String> customMetadata;

  GetDocumentResponse({
    this.metadata,
    this.customMetadata,
  });
  static GetDocumentResponse fromJson(Map<String, dynamic> json) =>
      GetDocumentResponse();
}

class GetDocumentVersionResponse {
  /// The version metadata.
  final DocumentVersionMetadata metadata;

  /// The custom metadata on the document version.
  final Map<String, String> customMetadata;

  GetDocumentVersionResponse({
    this.metadata,
    this.customMetadata,
  });
  static GetDocumentVersionResponse fromJson(Map<String, dynamic> json) =>
      GetDocumentVersionResponse();
}

class GetFolderPathResponse {
  /// The path information.
  final ResourcePath path;

  GetFolderPathResponse({
    this.path,
  });
  static GetFolderPathResponse fromJson(Map<String, dynamic> json) =>
      GetFolderPathResponse();
}

class GetFolderResponse {
  /// The metadata of the folder.
  final FolderMetadata metadata;

  /// The custom metadata on the folder.
  final Map<String, String> customMetadata;

  GetFolderResponse({
    this.metadata,
    this.customMetadata,
  });
  static GetFolderResponse fromJson(Map<String, dynamic> json) =>
      GetFolderResponse();
}

class GetResourcesResponse {
  /// The folders in the specified folder.
  final List<FolderMetadata> folders;

  /// The documents in the specified collection.
  final List<DocumentMetadata> documents;

  /// The marker to use when requesting the next set of results. If there are no
  /// additional results, the string is empty.
  final String marker;

  GetResourcesResponse({
    this.folders,
    this.documents,
    this.marker,
  });
  static GetResourcesResponse fromJson(Map<String, dynamic> json) =>
      GetResourcesResponse();
}

class GroupMetadata {
  /// The ID of the user group.
  final String id;

  /// The name of the group.
  final String name;

  GroupMetadata({
    this.id,
    this.name,
  });
  static GroupMetadata fromJson(Map<String, dynamic> json) => GroupMetadata();
}

class InitiateDocumentVersionUploadResponse {
  /// The document metadata.
  final DocumentMetadata metadata;

  /// The upload metadata.
  final UploadMetadata uploadMetadata;

  InitiateDocumentVersionUploadResponse({
    this.metadata,
    this.uploadMetadata,
  });
  static InitiateDocumentVersionUploadResponse fromJson(
          Map<String, dynamic> json) =>
      InitiateDocumentVersionUploadResponse();
}

class NotificationOptions {
  /// Boolean value to indicate an email notification should be sent to the
  /// receipients.
  final bool sendEmail;

  /// Text value to be included in the email body.
  final String emailMessage;

  NotificationOptions({
    this.sendEmail,
    this.emailMessage,
  });
}

class Participants {
  /// The list of users.
  final List<UserMetadata> users;

  /// The list of user groups.
  final List<GroupMetadata> groups;

  Participants({
    this.users,
    this.groups,
  });
  static Participants fromJson(Map<String, dynamic> json) => Participants();
}

class PermissionInfo {
  /// The role of the user.
  final String role;

  /// The type of permissions.
  final String type;

  PermissionInfo({
    this.role,
    this.type,
  });
  static PermissionInfo fromJson(Map<String, dynamic> json) => PermissionInfo();
}

class Principal {
  /// The ID of the resource.
  final String id;

  /// The type of resource.
  final String type;

  /// The permission information for the resource.
  final List<PermissionInfo> roles;

  Principal({
    this.id,
    this.type,
    this.roles,
  });
  static Principal fromJson(Map<String, dynamic> json) => Principal();
}

class ResourceMetadata {
  /// The type of resource.
  final String type;

  /// The name of the resource.
  final String name;

  /// The original name of the resource before a rename operation.
  final String originalName;

  /// The ID of the resource.
  final String id;

  /// The version ID of the resource. This is an optional field and is filled
  /// for action on document version.
  final String versionId;

  /// The owner of the resource.
  final UserMetadata owner;

  /// The parent ID of the resource before a rename operation.
  final String parentId;

  ResourceMetadata({
    this.type,
    this.name,
    this.originalName,
    this.id,
    this.versionId,
    this.owner,
    this.parentId,
  });
  static ResourceMetadata fromJson(Map<String, dynamic> json) =>
      ResourceMetadata();
}

class ResourcePath {
  /// The components of the resource path.
  final List<ResourcePathComponent> components;

  ResourcePath({
    this.components,
  });
  static ResourcePath fromJson(Map<String, dynamic> json) => ResourcePath();
}

class ResourcePathComponent {
  /// The ID of the resource path.
  final String id;

  /// The name of the resource path.
  final String name;

  ResourcePathComponent({
    this.id,
    this.name,
  });
  static ResourcePathComponent fromJson(Map<String, dynamic> json) =>
      ResourcePathComponent();
}

class SharePrincipal {
  /// The ID of the recipient.
  final String id;

  /// The type of the recipient.
  final String type;

  /// The role of the recipient.
  final String role;

  SharePrincipal({
    @required this.id,
    @required this.type,
    @required this.role,
  });
}

class ShareResult {
  /// The ID of the principal.
  final String principalId;

  /// The ID of the invited user.
  final String inviteePrincipalId;

  /// The role.
  final String role;

  /// The status.
  final String status;

  /// The ID of the resource that was shared.
  final String shareId;

  /// The status message.
  final String statusMessage;

  ShareResult({
    this.principalId,
    this.inviteePrincipalId,
    this.role,
    this.status,
    this.shareId,
    this.statusMessage,
  });
  static ShareResult fromJson(Map<String, dynamic> json) => ShareResult();
}

class StorageRuleType {
  /// The amount of storage allocated, in bytes.
  final BigInt storageAllocatedInBytes;

  /// The type of storage.
  final String storageType;

  StorageRuleType({
    this.storageAllocatedInBytes,
    this.storageType,
  });
  static StorageRuleType fromJson(Map<String, dynamic> json) =>
      StorageRuleType();
}

class Subscription {
  /// The ID of the subscription.
  final String subscriptionId;

  /// The endpoint of the subscription.
  final String endPoint;

  /// The protocol of the subscription.
  final String protocol;

  Subscription({
    this.subscriptionId,
    this.endPoint,
    this.protocol,
  });
  static Subscription fromJson(Map<String, dynamic> json) => Subscription();
}

class UpdateUserResponse {
  /// The user information.
  final User user;

  UpdateUserResponse({
    this.user,
  });
  static UpdateUserResponse fromJson(Map<String, dynamic> json) =>
      UpdateUserResponse();
}

class UploadMetadata {
  /// The URL of the upload.
  final String uploadUrl;

  /// The signed headers.
  final Map<String, String> signedHeaders;

  UploadMetadata({
    this.uploadUrl,
    this.signedHeaders,
  });
  static UploadMetadata fromJson(Map<String, dynamic> json) => UploadMetadata();
}

class User {
  /// The ID of the user.
  final String id;

  /// The login name of the user.
  final String username;

  /// The email address of the user.
  final String emailAddress;

  /// The given name of the user.
  final String givenName;

  /// The surname of the user.
  final String surname;

  /// The ID of the organization.
  final String organizationId;

  /// The ID of the root folder.
  final String rootFolderId;

  /// The ID of the recycle bin folder.
  final String recycleBinFolderId;

  /// The status of the user.
  final String status;

  /// The type of user.
  final String type;

  /// The time when the user was created.
  final DateTime createdTimestamp;

  /// The time when the user was modified.
  final DateTime modifiedTimestamp;

  /// The time zone ID of the user.
  final String timeZoneId;

  /// The locale of the user.
  final String locale;

  /// The storage for the user.
  final UserStorageMetadata storage;

  User({
    this.id,
    this.username,
    this.emailAddress,
    this.givenName,
    this.surname,
    this.organizationId,
    this.rootFolderId,
    this.recycleBinFolderId,
    this.status,
    this.type,
    this.createdTimestamp,
    this.modifiedTimestamp,
    this.timeZoneId,
    this.locale,
    this.storage,
  });
  static User fromJson(Map<String, dynamic> json) => User();
}

class UserMetadata {
  /// The ID of the user.
  final String id;

  /// The name of the user.
  final String username;

  /// The given name of the user before a rename operation.
  final String givenName;

  /// The surname of the user.
  final String surname;

  /// The email address of the user.
  final String emailAddress;

  UserMetadata({
    this.id,
    this.username,
    this.givenName,
    this.surname,
    this.emailAddress,
  });
  static UserMetadata fromJson(Map<String, dynamic> json) => UserMetadata();
}

class UserStorageMetadata {
  /// The amount of storage used, in bytes.
  final BigInt storageUtilizedInBytes;

  /// The storage for a user.
  final StorageRuleType storageRule;

  UserStorageMetadata({
    this.storageUtilizedInBytes,
    this.storageRule,
  });
  static UserStorageMetadata fromJson(Map<String, dynamic> json) =>
      UserStorageMetadata();
}
