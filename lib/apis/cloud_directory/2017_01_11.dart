import 'package:meta/meta.dart';

/// Amazon Cloud Directory
///
/// Amazon Cloud Directory is a component of the AWS Directory Service that
/// simplifies the development and management of cloud-scale web, mobile, and
/// IoT applications. This guide describes the Cloud Directory operations that
/// you can call programmatically and includes detailed information on data
/// types and errors. For information about Cloud Directory features, see [AWS
/// Directory Service](https://aws.amazon.com/directoryservice/) and the [Amazon
/// Cloud Directory Developer
/// Guide](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/what_is_cloud_directory.html).
class CloudDirectoryApi {
  /// Adds a new Facet to an object. An object can have more than one facet
  /// applied on it.
  Future<void> addFacetToObject(
      {@required String directoryArn,
      @required SchemaFacet schemaFacet,
      List<AttributeKeyAndValue> objectAttributeList,
      @required ObjectReference objectReference}) async {}

  /// Copies the input published schema, at the specified version, into the
  /// Directory with the same name and version as that of the published schema.
  Future<void> applySchema(
      {@required String publishedSchemaArn,
      @required String directoryArn}) async {}

  /// Attaches an existing object to another object. An object can be accessed
  /// in two ways:
  ///
  /// 1.  Using the path
  ///
  /// 2.  Using `ObjectIdentifier`
  Future<void> attachObject(
      {@required String directoryArn,
      @required ObjectReference parentReference,
      @required ObjectReference childReference,
      @required String linkName}) async {}

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  Future<void> attachPolicy(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      @required ObjectReference objectReference}) async {}

  /// Attaches the specified object to the specified index.
  Future<void> attachToIndex(
      {@required String directoryArn,
      @required ObjectReference indexReference,
      @required ObjectReference targetReference}) async {}

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> attachTypedLink(
      {@required String directoryArn,
      @required ObjectReference sourceObjectReference,
      @required ObjectReference targetObjectReference,
      @required TypedLinkSchemaAndFacetName typedLinkFacet,
      @required List<AttributeNameAndValue> attributes}) async {}

  /// Performs all the read operations in a batch.
  Future<void> batchRead(
      {@required String directoryArn,
      @required List<BatchReadOperation> operations,
      String consistencyLevel}) async {}

  /// Performs all the write operations in a batch. Either all the operations
  /// succeed or none.
  Future<void> batchWrite(
      {@required String directoryArn,
      @required List<BatchWriteOperation> operations}) async {}

  /// Creates a Directory by copying the published schema into the directory. A
  /// directory cannot be created without a schema.
  ///
  /// You can also quickly create a directory using a managed schema, called the
  /// `QuickStartSchema`. For more information, see [Managed
  /// Schema](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_managed.html)
  /// in the _Amazon Cloud Directory Developer Guide_.
  Future<void> createDirectory(
      {@required String name, @required String schemaArn}) async {}

  /// Creates a new Facet in a schema. Facet creation is allowed only in
  /// development or applied schemas.
  Future<void> createFacet(
      {@required String schemaArn,
      @required String name,
      List<FacetAttribute> attributes,
      String objectType,
      String facetStyle}) async {}

  /// Creates an index object. See [Indexing and
  /// search](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/indexing_search.html)
  /// for more information.
  Future<void> createIndex(
      {@required String directoryArn,
      @required List<AttributeKey> orderedIndexedAttributeList,
      @required bool isUnique,
      ObjectReference parentReference,
      String linkName}) async {}

  /// Creates an object in a Directory. Additionally attaches the object to a
  /// parent, if a parent reference and `LinkName` is specified. An object is
  /// simply a collection of Facet attributes. You can also use this API call to
  /// create a policy object, if the facet from which you create the object is a
  /// policy facet.
  Future<void> createObject(
      {@required String directoryArn,
      @required List<SchemaFacet> schemaFacets,
      List<AttributeKeyAndValue> objectAttributeList,
      ObjectReference parentReference,
      String linkName}) async {}

  /// Creates a new schema in a development state. A schema can exist in three
  /// phases:
  ///
  /// *    _Development:_ This is a mutable phase of the schema. All new schemas
  /// are in the development phase. Once the schema is finalized, it can be
  /// published.
  ///
  /// *    _Published:_ Published schemas are immutable and have a version
  /// associated with them.
  ///
  /// *    _Applied:_ Applied schemas are mutable in a way that allows you to
  /// add new schema facets. You can also add new, nonrequired attributes to
  /// existing schema facets. You can apply only published schemas to
  /// directories.
  Future<void> createSchema(String name) async {}

  /// Creates a TypedLinkFacet. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> createTypedLinkFacet(
      {@required String schemaArn, @required TypedLinkFacet facet}) async {}

  /// Deletes a directory. Only disabled directories can be deleted. A deleted
  /// directory cannot be undone. Exercise extreme caution when deleting
  /// directories.
  Future<void> deleteDirectory(String directoryArn) async {}

  /// Deletes a given Facet. All attributes and Rules that are associated with
  /// the facet will be deleted. Only development schema facets are allowed
  /// deletion.
  Future<void> deleteFacet(
      {@required String schemaArn, @required String name}) async {}

  /// Deletes an object and its associated attributes. Only objects with no
  /// children and no parents can be deleted. The maximum number of attributes
  /// that can be deleted during an object deletion is 30. For more information,
  /// see [Amazon Cloud Directory
  /// Limits](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/limits.html).
  Future<void> deleteObject(
      {@required String directoryArn,
      @required ObjectReference objectReference}) async {}

  /// Deletes a given schema. Schemas in a development and published state can
  /// only be deleted.
  Future<void> deleteSchema(String schemaArn) async {}

  /// Deletes a TypedLinkFacet. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> deleteTypedLinkFacet(
      {@required String schemaArn, @required String name}) async {}

  /// Detaches the specified object from the specified index.
  Future<void> detachFromIndex(
      {@required String directoryArn,
      @required ObjectReference indexReference,
      @required ObjectReference targetReference}) async {}

  /// Detaches a given object from the parent object. The object that is to be
  /// detached from the parent is specified by the link name.
  Future<void> detachObject(
      {@required String directoryArn,
      @required ObjectReference parentReference,
      @required String linkName}) async {}

  /// Detaches a policy from an object.
  Future<void> detachPolicy(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      @required ObjectReference objectReference}) async {}

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> detachTypedLink(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier}) async {}

  /// Disables the specified directory. Disabled directories cannot be read or
  /// written to. Only enabled directories can be disabled. Disabled directories
  /// may be reenabled.
  Future<void> disableDirectory(String directoryArn) async {}

  /// Enables the specified directory. Only disabled directories can be enabled.
  /// Once enabled, the directory can then be read and written to.
  Future<void> enableDirectory(String directoryArn) async {}

  /// Returns current applied schema version ARN, including the minor version in
  /// use.
  Future<void> getAppliedSchemaVersion(String schemaArn) async {}

  /// Retrieves metadata about a directory.
  Future<void> getDirectory(String directoryArn) async {}

  /// Gets details of the Facet, such as facet name, attributes, Rules, or
  /// `ObjectType`. You can call this on all kinds of schema facets --
  /// published, development, or applied.
  Future<void> getFacet(
      {@required String schemaArn, @required String name}) async {}

  /// Retrieves attributes that are associated with a typed link.
  Future<void> getLinkAttributes(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier,
      @required List<String> attributeNames,
      String consistencyLevel}) async {}

  /// Retrieves attributes within a facet that are associated with an object.
  Future<void> getObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String consistencyLevel,
      @required SchemaFacet schemaFacet,
      @required List<String> attributeNames}) async {}

  /// Retrieves metadata about an object.
  Future<void> getObjectInformation(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String consistencyLevel}) async {}

  /// Retrieves a JSON representation of the schema. See [JSON Schema
  /// Format](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json)
  /// for more information.
  Future<void> getSchemaAsJson(String schemaArn) async {}

  /// Returns the identity attribute order for a specific TypedLinkFacet. For
  /// more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> getTypedLinkFacetInformation(
      {@required String schemaArn, @required String name}) async {}

  /// Lists schema major versions applied to a directory. If `SchemaArn` is
  /// provided, lists the minor version.
  Future<void> listAppliedSchemaArns(String directoryArn,
      {String schemaArn, String nextToken, int maxResults}) async {}

  /// Lists indices attached to the specified object.
  Future<void> listAttachedIndices(
      {@required String directoryArn,
      @required ObjectReference targetReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Retrieves each Amazon Resource Name (ARN) of schemas in the development
  /// state.
  Future<void> listDevelopmentSchemaArns(
      {String nextToken, int maxResults}) async {}

  /// Lists directories created within an account.
  Future<void> listDirectories(
      {String nextToken, int maxResults, String state}) async {}

  /// Retrieves attributes attached to the facet.
  Future<void> listFacetAttributes(
      {@required String schemaArn,
      @required String name,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves the names of facets that exist in a schema.
  Future<void> listFacetNames(String schemaArn,
      {String nextToken, int maxResults}) async {}

  /// Returns a paginated list of all the incoming TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> listIncomingTypedLinks(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      List<TypedLinkAttributeRange> filterAttributeRanges,
      TypedLinkSchemaAndFacetName filterTypedLink,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Lists objects attached to the specified index.
  Future<void> listIndex(
      {@required String directoryArn,
      List<ObjectAttributeRange> rangesOnIndexedValues,
      @required ObjectReference indexReference,
      int maxResults,
      String nextToken,
      String consistencyLevel}) async {}

  /// Lists the major version families of each managed schema. If a major
  /// version ARN is provided as SchemaArn, the minor version revisions in that
  /// family are listed instead.
  Future<void> listManagedSchemaArns(
      {String schemaArn, String nextToken, int maxResults}) async {}

  /// Lists all attributes that are associated with an object.
  Future<void> listObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel,
      SchemaFacet facetFilter}) async {}

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  Future<void> listObjectChildren(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Retrieves all available parent paths for any object type such as node,
  /// leaf node, policy node, and index node objects. For more information about
  /// objects, see [Directory
  /// Structure](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directorystructure.html).
  ///
  /// Use this API to evaluate all parents for an object. The call returns all
  /// objects from the root of the directory up to the requested object. The API
  /// returns the number of paths based on user-defined `MaxResults`, in case
  /// there are multiple paths to the parent. The order of the paths and nodes
  /// returned is consistent among multiple API calls unless the objects are
  /// deleted or moved. Paths not leading to the directory root are ignored from
  /// the target object.
  Future<void> listObjectParentPaths(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults}) async {}

  /// Lists parent objects that are associated with a given object in pagination
  /// fashion.
  Future<void> listObjectParents(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel,
      bool includeAllLinksToEachParent}) async {}

  /// Returns policies attached to an object in pagination fashion.
  Future<void> listObjectPolicies(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Returns a paginated list of all the outgoing TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> listOutgoingTypedLinks(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      List<TypedLinkAttributeRange> filterAttributeRanges,
      TypedLinkSchemaAndFacetName filterTypedLink,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Returns all of the `ObjectIdentifiers` to which a given policy is
  /// attached.
  Future<void> listPolicyAttachments(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {}

  /// Lists the major version families of each published schema. If a major
  /// version ARN is provided as `SchemaArn`, the minor version revisions in
  /// that family are listed instead.
  Future<void> listPublishedSchemaArns(
      {String schemaArn, String nextToken, int maxResults}) async {}

  /// Returns tags for a resource. Tagging is currently supported only for
  /// directories with a limit of 50 tags per directory. All 50 tags are
  /// returned for a given directory with this API call.
  Future<void> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Returns a paginated list of all attribute definitions for a particular
  /// TypedLinkFacet. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> listTypedLinkFacetAttributes(
      {@required String schemaArn,
      @required String name,
      String nextToken,
      int maxResults}) async {}

  /// Returns a paginated list of `TypedLink` facet names for a particular
  /// schema. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> listTypedLinkFacetNames(String schemaArn,
      {String nextToken, int maxResults}) async {}

  /// Lists all policies from the root of the Directory to the object specified.
  /// If there are no policies present, an empty list is returned. If policies
  /// are present, and if some objects don't have the policies attached, it
  /// returns the `ObjectIdentifier` for such objects. If policies are present,
  /// it returns `ObjectIdentifier`, `policyId`, and `policyType`. Paths that
  /// don't lead to the root from the target object are ignored. For more
  /// information, see
  /// [Policies](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/key_concepts_directory.html#key_concepts_policies).
  Future<void> lookupPolicy(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults}) async {}

  /// Publishes a development schema with a major version and a recommended
  /// minor version.
  Future<void> publishSchema(
      {@required String developmentSchemaArn,
      @required String version,
      String minorVersion,
      String name}) async {}

  /// Allows a schema to be updated using JSON upload. Only available for
  /// development schemas. See [JSON Schema
  /// Format](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/schemas_jsonformat.html#schemas_json)
  /// for more information.
  Future<void> putSchemaFromJson(
      {@required String schemaArn, @required String document}) async {}

  /// Removes the specified facet from the specified object.
  Future<void> removeFacetFromObject(
      {@required String directoryArn,
      @required SchemaFacet schemaFacet,
      @required ObjectReference objectReference}) async {}

  /// An API operation for adding tags to a resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// An API operation for removing tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Does the following:
  ///
  /// 1.  Adds new `Attributes`, `Rules`, or `ObjectTypes`.
  ///
  /// 2.  Updates existing `Attributes`, `Rules`, or `ObjectTypes`.
  ///
  /// 3.  Deletes existing `Attributes`, `Rules`, or `ObjectTypes`.
  Future<void> updateFacet(
      {@required String schemaArn,
      @required String name,
      List<FacetAttributeUpdate> attributeUpdates,
      String objectType}) async {}

  /// Updates a given typed link’s attributes. Attributes to be updated must not
  /// contribute to the typed link’s identity, as defined by its
  /// `IdentityAttributeOrder`.
  Future<void> updateLinkAttributes(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier,
      @required List<LinkAttributeUpdate> attributeUpdates}) async {}

  /// Updates a given object's attributes.
  Future<void> updateObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      @required List<ObjectAttributeUpdate> attributeUpdates}) async {}

  /// Updates the schema name with a new name. Only development schema names can
  /// be updated.
  Future<void> updateSchema(
      {@required String schemaArn, @required String name}) async {}

  /// Updates a TypedLinkFacet. For more information, see [Typed
  /// Links](https://docs.aws.amazon.com/clouddirectory/latest/developerguide/directory_objects_links.html#directory_objects_links_typedlink).
  Future<void> updateTypedLinkFacet(
      {@required String schemaArn,
      @required String name,
      @required List<TypedLinkFacetAttributeUpdate> attributeUpdates,
      @required List<String> identityAttributeOrder}) async {}

  /// Upgrades a single directory in-place using the `PublishedSchemaArn` with
  /// schema updates found in `MinorVersion`. Backwards-compatible minor version
  /// upgrades are instantaneously available for readers on all objects in the
  /// directory. Note: This is a synchronous API call and upgrades only one
  /// schema on a given directory per call. To upgrade multiple directories from
  /// one schema, you would need to call this API on each directory.
  Future<void> upgradeAppliedSchema(
      {@required String publishedSchemaArn,
      @required String directoryArn,
      bool dryRun}) async {}

  /// Upgrades a published schema under a new minor version revision using the
  /// current contents of `DevelopmentSchemaArn`.
  Future<void> upgradePublishedSchema(
      {@required String developmentSchemaArn,
      @required String publishedSchemaArn,
      @required String minorVersion,
      bool dryRun}) async {}
}

class AddFacetToObjectResponse {}

class ApplySchemaResponse {}

class AttachObjectResponse {}

class AttachPolicyResponse {}

class AttachToIndexResponse {}

class AttachTypedLinkResponse {}

class AttributeKey {}

class AttributeKeyAndValue {}

class AttributeNameAndValue {}

class BatchAddFacetToObject {}

class BatchAddFacetToObjectResponse {}

class BatchAttachObject {}

class BatchAttachObjectResponse {}

class BatchAttachPolicy {}

class BatchAttachPolicyResponse {}

class BatchAttachToIndex {}

class BatchAttachToIndexResponse {}

class BatchAttachTypedLink {}

class BatchAttachTypedLinkResponse {}

class BatchCreateIndex {}

class BatchCreateIndexResponse {}

class BatchCreateObject {}

class BatchCreateObjectResponse {}

class BatchDeleteObject {}

class BatchDeleteObjectResponse {}

class BatchDetachFromIndex {}

class BatchDetachFromIndexResponse {}

class BatchDetachObject {}

class BatchDetachObjectResponse {}

class BatchDetachPolicy {}

class BatchDetachPolicyResponse {}

class BatchDetachTypedLink {}

class BatchDetachTypedLinkResponse {}

class BatchGetLinkAttributes {}

class BatchGetLinkAttributesResponse {}

class BatchGetObjectAttributes {}

class BatchGetObjectAttributesResponse {}

class BatchGetObjectInformation {}

class BatchGetObjectInformationResponse {}

class BatchListAttachedIndices {}

class BatchListAttachedIndicesResponse {}

class BatchListIncomingTypedLinks {}

class BatchListIncomingTypedLinksResponse {}

class BatchListIndex {}

class BatchListIndexResponse {}

class BatchListObjectAttributes {}

class BatchListObjectAttributesResponse {}

class BatchListObjectChildren {}

class BatchListObjectChildrenResponse {}

class BatchListObjectParentPaths {}

class BatchListObjectParentPathsResponse {}

class BatchListObjectParents {}

class BatchListObjectParentsResponse {}

class BatchListObjectPolicies {}

class BatchListObjectPoliciesResponse {}

class BatchListOutgoingTypedLinks {}

class BatchListOutgoingTypedLinksResponse {}

class BatchListPolicyAttachments {}

class BatchListPolicyAttachmentsResponse {}

class BatchLookupPolicy {}

class BatchLookupPolicyResponse {}

class BatchReadException {}

class BatchReadOperation {}

class BatchReadOperationResponse {}

class BatchReadResponse {}

class BatchReadSuccessfulResponse {}

class BatchRemoveFacetFromObject {}

class BatchRemoveFacetFromObjectResponse {}

class BatchUpdateLinkAttributes {}

class BatchUpdateLinkAttributesResponse {}

class BatchUpdateObjectAttributes {}

class BatchUpdateObjectAttributesResponse {}

class BatchWriteOperation {}

class BatchWriteOperationResponse {}

class BatchWriteResponse {}

class CreateDirectoryResponse {}

class CreateFacetResponse {}

class CreateIndexResponse {}

class CreateObjectResponse {}

class CreateSchemaResponse {}

class CreateTypedLinkFacetResponse {}

class DeleteDirectoryResponse {}

class DeleteFacetResponse {}

class DeleteObjectResponse {}

class DeleteSchemaResponse {}

class DeleteTypedLinkFacetResponse {}

class DetachFromIndexResponse {}

class DetachObjectResponse {}

class DetachPolicyResponse {}

class Directory {}

class DisableDirectoryResponse {}

class EnableDirectoryResponse {}

class Facet {}

class FacetAttribute {}

class FacetAttributeDefinition {}

class FacetAttributeReference {}

class FacetAttributeUpdate {}

class GetAppliedSchemaVersionResponse {}

class GetDirectoryResponse {}

class GetFacetResponse {}

class GetLinkAttributesResponse {}

class GetObjectAttributesResponse {}

class GetObjectInformationResponse {}

class GetSchemaAsJsonResponse {}

class GetTypedLinkFacetInformationResponse {}

class IndexAttachment {}

class LinkAttributeAction {}

class LinkAttributeUpdate {}

class ListAppliedSchemaArnsResponse {}

class ListAttachedIndicesResponse {}

class ListDevelopmentSchemaArnsResponse {}

class ListDirectoriesResponse {}

class ListFacetAttributesResponse {}

class ListFacetNamesResponse {}

class ListIncomingTypedLinksResponse {}

class ListIndexResponse {}

class ListManagedSchemaArnsResponse {}

class ListObjectAttributesResponse {}

class ListObjectChildrenResponse {}

class ListObjectParentPathsResponse {}

class ListObjectParentsResponse {}

class ListObjectPoliciesResponse {}

class ListOutgoingTypedLinksResponse {}

class ListPolicyAttachmentsResponse {}

class ListPublishedSchemaArnsResponse {}

class ListTagsForResourceResponse {}

class ListTypedLinkFacetAttributesResponse {}

class ListTypedLinkFacetNamesResponse {}

class LookupPolicyResponse {}

class ObjectAttributeAction {}

class ObjectAttributeRange {}

class ObjectAttributeUpdate {}

class ObjectIdentifierAndLinkNameTuple {}

class ObjectReference {}

class PathToObjectIdentifiers {}

class PolicyAttachment {}

class PolicyToPath {}

class PublishSchemaResponse {}

class PutSchemaFromJsonResponse {}

class RemoveFacetFromObjectResponse {}

class Rule {}

class SchemaFacet {}

class Tag {}

class TagResourceResponse {}

class TypedAttributeValue {}

class TypedAttributeValueRange {}

class TypedLinkAttributeDefinition {}

class TypedLinkAttributeRange {}

class TypedLinkFacet {}

class TypedLinkFacetAttributeUpdate {}

class TypedLinkSchemaAndFacetName {}

class TypedLinkSpecifier {}

class UntagResourceResponse {}

class UpdateFacetResponse {}

class UpdateLinkAttributesResponse {}

class UpdateObjectAttributesResponse {}

class UpdateSchemaResponse {}

class UpdateTypedLinkFacetResponse {}

class UpgradeAppliedSchemaResponse {}

class UpgradePublishedSchemaResponse {}
