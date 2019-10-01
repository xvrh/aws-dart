import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Cloud Directory
///
/// Amazon Cloud Directory is a component of the AWS Directory Service that
/// simplifies the development and management of cloud-scale web, mobile, and
/// IoT applications. This guide describes the Cloud Directory operations that
/// you can call programmatically and includes detailed information on data
/// types and errors. For information about AWS Directory Services features, see
/// [AWS Directory Service](https://aws.amazon.com/directoryservice/) and the
/// [AWS Directory Service Administration Guide](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html).
class CloudDirectoryApi {
  /// Adds a new Facet to an object. An object can have more than one facet
  /// applied on it.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [schemaFacet]: Identifiers for the facet that you are adding to the
  /// object. See SchemaFacet for details.
  ///
  /// [objectAttributeList]: Attributes on the facet that you are adding to the
  /// object.
  ///
  /// [objectReference]: A reference to the object you are adding the specified
  /// facet to.
  Future<AddFacetToObjectResponse> addFacetToObject(
      {@required String directoryArn,
      @required SchemaFacet schemaFacet,
      List<AttributeKeyAndValue> objectAttributeList,
      @required ObjectReference objectReference}) async {
    return AddFacetToObjectResponse.fromJson({});
  }

  /// Copies the input published schema, at the specified version, into the
  /// Directory with the same name and version as that of the published schema.
  ///
  /// [publishedSchemaArn]: Published schema Amazon Resource Name (ARN) that
  /// needs to be copied. For more information, see arns.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory into which the schema is copied. For more information, see arns.
  Future<ApplySchemaResponse> applySchema(
      {@required String publishedSchemaArn,
      @required String directoryArn}) async {
    return ApplySchemaResponse.fromJson({});
  }

  /// Attaches an existing object to another object. An object can be accessed
  /// in two ways:
  ///
  /// 1.  Using the path
  ///
  /// 2.  Using `ObjectIdentifier`
  ///
  /// [directoryArn]: Amazon Resource Name (ARN) that is associated with the
  /// Directory where both objects reside. For more information, see arns.
  ///
  /// [parentReference]: The parent object reference.
  ///
  /// [childReference]: The child object reference to be attached to the object.
  ///
  /// [linkName]: The link name with which the child object is attached to the
  /// parent.
  Future<AttachObjectResponse> attachObject(
      {@required String directoryArn,
      @required ObjectReference parentReference,
      @required ObjectReference childReference,
      @required String linkName}) async {
    return AttachObjectResponse.fromJson({});
  }

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where both objects reside. For more information, see arns.
  ///
  /// [policyReference]: The reference that is associated with the policy
  /// object.
  ///
  /// [objectReference]: The reference that identifies the object to which the
  /// policy will be attached.
  Future<AttachPolicyResponse> attachPolicy(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      @required ObjectReference objectReference}) async {
    return AttachPolicyResponse.fromJson({});
  }

  /// Attaches the specified object to the specified index.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory where the
  /// object and index exist.
  ///
  /// [indexReference]: A reference to the index that you are attaching the
  /// object to.
  ///
  /// [targetReference]: A reference to the object that you are attaching to the
  /// index.
  Future<AttachToIndexResponse> attachToIndex(
      {@required String directoryArn,
      @required ObjectReference indexReference,
      @required ObjectReference targetReference}) async {
    return AttachToIndexResponse.fromJson({});
  }

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory where you
  /// want to attach the typed link.
  ///
  /// [sourceObjectReference]: Identifies the source object that the typed link
  /// will attach to.
  ///
  /// [targetObjectReference]: Identifies the target object that the typed link
  /// will attach to.
  ///
  /// [typedLinkFacet]: Identifies the typed link facet that is associated with
  /// the typed link.
  ///
  /// [attributes]: A set of attributes that are associated with the typed link.
  Future<AttachTypedLinkResponse> attachTypedLink(
      {@required String directoryArn,
      @required ObjectReference sourceObjectReference,
      @required ObjectReference targetObjectReference,
      @required TypedLinkSchemaAndFacetName typedLinkFacet,
      @required List<AttributeNameAndValue> attributes}) async {
    return AttachTypedLinkResponse.fromJson({});
  }

  /// Performs all the read operations in a batch.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory. For more information, see arns.
  ///
  /// [operations]: A list of operations that are part of the batch.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  Future<BatchReadResponse> batchRead(
      {@required String directoryArn,
      @required List<BatchReadOperation> operations,
      String consistencyLevel}) async {
    return BatchReadResponse.fromJson({});
  }

  /// Performs all the write operations in a batch. Either all the operations
  /// succeed or none.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory. For more information, see arns.
  ///
  /// [operations]: A list of operations that are part of the batch.
  Future<BatchWriteResponse> batchWrite(
      {@required String directoryArn,
      @required List<BatchWriteOperation> operations}) async {
    return BatchWriteResponse.fromJson({});
  }

  /// Creates a Directory by copying the published schema into the directory. A
  /// directory cannot be created without a schema.
  ///
  /// [name]: The name of the Directory. Should be unique per account, per
  /// region.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) of the published schema that
  /// will be copied into the data Directory. For more information, see arns.
  Future<CreateDirectoryResponse> createDirectory(
      {@required String name, @required String schemaArn}) async {
    return CreateDirectoryResponse.fromJson({});
  }

  /// Creates a new Facet in a schema. Facet creation is allowed only in
  /// development or applied schemas.
  ///
  /// [schemaArn]: The schema ARN in which the new Facet will be created. For
  /// more information, see arns.
  ///
  /// [name]: The name of the Facet, which is unique for a given schema.
  ///
  /// [attributes]: The attributes that are associated with the Facet.
  ///
  /// [objectType]: Specifies whether a given object created from this facet is
  /// of type node, leaf node, policy or index.
  ///
  /// *   Node: Can have multiple children but one parent.
  ///
  ///
  /// *   Leaf node: Cannot have children but can have multiple parents.
  ///
  ///
  /// *   Policy: Allows you to store a policy document and policy type. For
  /// more information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  ///
  ///
  /// *   Index: Can be created with the Index API.
  Future<CreateFacetResponse> createFacet(
      {@required String schemaArn,
      @required String name,
      List<FacetAttribute> attributes,
      @required String objectType}) async {
    return CreateFacetResponse.fromJson({});
  }

  /// Creates an index object. See
  /// [Indexing](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_indexing.html)
  /// for more information.
  ///
  /// [directoryArn]: The ARN of the directory where the index should be
  /// created.
  ///
  /// [orderedIndexedAttributeList]: Specifies the attributes that should be
  /// indexed on. Currently only a single attribute is supported.
  ///
  /// [isUnique]: Indicates whether the attribute that is being indexed has
  /// unique values or not.
  ///
  /// [parentReference]: A reference to the parent object that contains the
  /// index object.
  ///
  /// [linkName]: The name of the link between the parent object and the index
  /// object.
  Future<CreateIndexResponse> createIndex(
      {@required String directoryArn,
      @required List<AttributeKey> orderedIndexedAttributeList,
      @required bool isUnique,
      ObjectReference parentReference,
      String linkName}) async {
    return CreateIndexResponse.fromJson({});
  }

  /// Creates an object in a Directory. Additionally attaches the object to a
  /// parent, if a parent reference and `LinkName` is specified. An object is
  /// simply a collection of Facet attributes. You can also use this API call to
  /// create a policy object, if the facet from which you create the object is a
  /// policy facet.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory in which the object will be created. For more information, see
  /// arns.
  ///
  /// [schemaFacets]: A list of schema facets to be associated with the object.
  /// Do not provide minor version components. See SchemaFacet for details.
  ///
  /// [objectAttributeList]: The attribute map whose attribute ARN contains the
  /// key and attribute value as the map value.
  ///
  /// [parentReference]: If specified, the parent reference to which this object
  /// will be attached.
  ///
  /// [linkName]: The name of link that is used to attach this object to a
  /// parent.
  Future<CreateObjectResponse> createObject(
      {@required String directoryArn,
      @required List<SchemaFacet> schemaFacets,
      List<AttributeKeyAndValue> objectAttributeList,
      ObjectReference parentReference,
      String linkName}) async {
    return CreateObjectResponse.fromJson({});
  }

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
  ///
  /// [name]: The name that is associated with the schema. This is unique to
  /// each account and in each region.
  Future<CreateSchemaResponse> createSchema(String name) async {
    return CreateSchemaResponse.fromJson({});
  }

  /// Creates a TypedLinkFacet. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [facet]:  Facet structure that is associated with the typed link facet.
  Future<CreateTypedLinkFacetResponse> createTypedLinkFacet(
      {@required String schemaArn, @required TypedLinkFacet facet}) async {
    return CreateTypedLinkFacetResponse.fromJson({});
  }

  /// Deletes a directory. Only disabled directories can be deleted. A deleted
  /// directory cannot be undone. Exercise extreme caution when deleting
  /// directories.
  ///
  /// [directoryArn]: The ARN of the directory to delete.
  Future<DeleteDirectoryResponse> deleteDirectory(String directoryArn) async {
    return DeleteDirectoryResponse.fromJson({});
  }

  /// Deletes a given Facet. All attributes and Rules that are associated with
  /// the facet will be deleted. Only development schema facets are allowed
  /// deletion.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Facet. For more information, see arns.
  ///
  /// [name]: The name of the facet to delete.
  Future<DeleteFacetResponse> deleteFacet(
      {@required String schemaArn, @required String name}) async {
    return DeleteFacetResponse.fromJson({});
  }

  /// Deletes an object and its associated attributes. Only objects with no
  /// children and no parents can be deleted.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [objectReference]: A reference that identifies the object.
  Future<DeleteObjectResponse> deleteObject(
      {@required String directoryArn,
      @required ObjectReference objectReference}) async {
    return DeleteObjectResponse.fromJson({});
  }

  /// Deletes a given schema. Schemas in a development and published state can
  /// only be deleted.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) of the development schema. For
  /// more information, see arns.
  Future<DeleteSchemaResponse> deleteSchema(String schemaArn) async {
    return DeleteSchemaResponse.fromJson({});
  }

  /// Deletes a TypedLinkFacet. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [name]: The unique name of the typed link facet.
  Future<DeleteTypedLinkFacetResponse> deleteTypedLinkFacet(
      {@required String schemaArn, @required String name}) async {
    return DeleteTypedLinkFacetResponse.fromJson({});
  }

  /// Detaches the specified object from the specified index.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory the index
  /// and object exist in.
  ///
  /// [indexReference]: A reference to the index object.
  ///
  /// [targetReference]: A reference to the object being detached from the
  /// index.
  Future<DetachFromIndexResponse> detachFromIndex(
      {@required String directoryArn,
      @required ObjectReference indexReference,
      @required ObjectReference targetReference}) async {
    return DetachFromIndexResponse.fromJson({});
  }

  /// Detaches a given object from the parent object. The object that is to be
  /// detached from the parent is specified by the link name.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where objects reside. For more information, see arns.
  ///
  /// [parentReference]: The parent reference from which the object with the
  /// specified link name is detached.
  ///
  /// [linkName]: The link name associated with the object that needs to be
  /// detached.
  Future<DetachObjectResponse> detachObject(
      {@required String directoryArn,
      @required ObjectReference parentReference,
      @required String linkName}) async {
    return DetachObjectResponse.fromJson({});
  }

  /// Detaches a policy from an object.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where both objects reside. For more information, see arns.
  ///
  /// [policyReference]: Reference that identifies the policy object.
  ///
  /// [objectReference]: Reference that identifies the object whose policy
  /// object will be detached.
  Future<DetachPolicyResponse> detachPolicy(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      @required ObjectReference objectReference}) async {
    return DetachPolicyResponse.fromJson({});
  }

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory where you
  /// want to detach the typed link.
  ///
  /// [typedLinkSpecifier]: Used to accept a typed link specifier as input.
  Future<void> detachTypedLink(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier}) async {}

  /// Disables the specified directory. Disabled directories cannot be read or
  /// written to. Only enabled directories can be disabled. Disabled directories
  /// may be reenabled.
  ///
  /// [directoryArn]: The ARN of the directory to disable.
  Future<DisableDirectoryResponse> disableDirectory(String directoryArn) async {
    return DisableDirectoryResponse.fromJson({});
  }

  /// Enables the specified directory. Only disabled directories can be enabled.
  /// Once enabled, the directory can then be read and written to.
  ///
  /// [directoryArn]: The ARN of the directory to enable.
  Future<EnableDirectoryResponse> enableDirectory(String directoryArn) async {
    return EnableDirectoryResponse.fromJson({});
  }

  /// Returns current applied schema version ARN, including the minor version in
  /// use.
  ///
  /// [schemaArn]: The ARN of the applied schema.
  Future<GetAppliedSchemaVersionResponse> getAppliedSchemaVersion(
      String schemaArn) async {
    return GetAppliedSchemaVersionResponse.fromJson({});
  }

  /// Retrieves metadata about a directory.
  ///
  /// [directoryArn]: The ARN of the directory.
  Future<GetDirectoryResponse> getDirectory(String directoryArn) async {
    return GetDirectoryResponse.fromJson({});
  }

  /// Gets details of the Facet, such as facet name, attributes, Rules, or
  /// `ObjectType`. You can call this on all kinds of schema facets --
  /// published, development, or applied.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Facet. For more information, see arns.
  ///
  /// [name]: The name of the facet to retrieve.
  Future<GetFacetResponse> getFacet(
      {@required String schemaArn, @required String name}) async {
    return GetFacetResponse.fromJson({});
  }

  /// Retrieves attributes that are associated with a typed link.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the typed link resides. For more information, see arns or
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [typedLinkSpecifier]: Allows a typed link specifier to be accepted as
  /// input.
  ///
  /// [attributeNames]: A list of attribute names whose values will be
  /// retrieved.
  ///
  /// [consistencyLevel]: The consistency level at which to retrieve the
  /// attributes on a typed link.
  Future<GetLinkAttributesResponse> getLinkAttributes(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier,
      @required List<String> attributeNames,
      String consistencyLevel}) async {
    return GetLinkAttributesResponse.fromJson({});
  }

  /// Retrieves attributes within a facet that are associated with an object.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides.
  ///
  /// [objectReference]: Reference that identifies the object whose attributes
  /// will be retrieved.
  ///
  /// [consistencyLevel]: The consistency level at which to retrieve the
  /// attributes on an object.
  ///
  /// [schemaFacet]: Identifier for the facet whose attributes will be
  /// retrieved. See SchemaFacet for details.
  ///
  /// [attributeNames]: List of attribute names whose values will be retrieved.
  Future<GetObjectAttributesResponse> getObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String consistencyLevel,
      @required SchemaFacet schemaFacet,
      @required List<String> attributeNames}) async {
    return GetObjectAttributesResponse.fromJson({});
  }

  /// Retrieves metadata about an object.
  ///
  /// [directoryArn]: The ARN of the directory being retrieved.
  ///
  /// [objectReference]: A reference to the object.
  ///
  /// [consistencyLevel]: The consistency level at which to retrieve the object
  /// information.
  Future<GetObjectInformationResponse> getObjectInformation(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String consistencyLevel}) async {
    return GetObjectInformationResponse.fromJson({});
  }

  /// Retrieves a JSON representation of the schema. See
  /// [JSON Schema Format](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_schemas.html#jsonformat)
  /// for more information.
  ///
  /// [schemaArn]: The ARN of the schema to retrieve.
  Future<GetSchemaAsJsonResponse> getSchemaAsJson(String schemaArn) async {
    return GetSchemaAsJsonResponse.fromJson({});
  }

  /// Returns the identity attribute order for a specific TypedLinkFacet. For
  /// more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [name]: The unique name of the typed link facet.
  Future<GetTypedLinkFacetInformationResponse> getTypedLinkFacetInformation(
      {@required String schemaArn, @required String name}) async {
    return GetTypedLinkFacetInformationResponse.fromJson({});
  }

  /// Lists schema major versions applied to a directory. If `SchemaArn` is
  /// provided, lists the minor version.
  ///
  /// [directoryArn]: The ARN of the directory you are listing.
  ///
  /// [schemaArn]: The response for `ListAppliedSchemaArns` when this parameter
  /// is used will list all minor version ARNs for a major version.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListAppliedSchemaArnsResponse> listAppliedSchemaArns(
      String directoryArn,
      {String schemaArn,
      String nextToken,
      int maxResults}) async {
    return ListAppliedSchemaArnsResponse.fromJson({});
  }

  /// Lists indices attached to the specified object.
  ///
  /// [directoryArn]: The ARN of the directory.
  ///
  /// [targetReference]: A reference to the object that has indices attached.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  ///
  /// [consistencyLevel]: The consistency level to use for this operation.
  Future<ListAttachedIndicesResponse> listAttachedIndices(
      {@required String directoryArn,
      @required ObjectReference targetReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListAttachedIndicesResponse.fromJson({});
  }

  /// Retrieves each Amazon Resource Name (ARN) of schemas in the development
  /// state.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListDevelopmentSchemaArnsResponse> listDevelopmentSchemaArns(
      {String nextToken, int maxResults}) async {
    return ListDevelopmentSchemaArnsResponse.fromJson({});
  }

  /// Lists directories created within an account.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  ///
  /// [state]: The state of the directories in the list. Can be either Enabled,
  /// Disabled, or Deleted.
  Future<ListDirectoriesResponse> listDirectories(
      {String nextToken, int maxResults, String state}) async {
    return ListDirectoriesResponse.fromJson({});
  }

  /// Retrieves attributes attached to the facet.
  ///
  /// [schemaArn]: The ARN of the schema where the facet resides.
  ///
  /// [name]: The name of the facet whose attributes will be retrieved.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListFacetAttributesResponse> listFacetAttributes(
      {@required String schemaArn,
      @required String name,
      String nextToken,
      int maxResults}) async {
    return ListFacetAttributesResponse.fromJson({});
  }

  /// Retrieves the names of facets that exist in a schema.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) to retrieve facet names from.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListFacetNamesResponse> listFacetNames(String schemaArn,
      {String nextToken, int maxResults}) async {
    return ListFacetNamesResponse.fromJson({});
  }

  /// Returns a paginated list of all the incoming TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory where you
  /// want to list the typed links.
  ///
  /// [objectReference]: Reference that identifies the object whose attributes
  /// will be listed.
  ///
  /// [filterAttributeRanges]: Provides range filters for multiple attributes.
  /// When providing ranges to typed link selection, any inexact ranges must be
  /// specified at the end. Any attributes that do not have a range specified
  /// are presumed to match the entire range.
  ///
  /// [filterTypedLink]: Filters are interpreted in the order of the attributes
  /// on the typed link facet, not the order in which they are supplied to any
  /// API calls.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  ///
  /// [consistencyLevel]: The consistency level to execute the request at.
  Future<ListIncomingTypedLinksResponse> listIncomingTypedLinks(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      List<TypedLinkAttributeRange> filterAttributeRanges,
      TypedLinkSchemaAndFacetName filterTypedLink,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListIncomingTypedLinksResponse.fromJson({});
  }

  /// Lists objects attached to the specified index.
  ///
  /// [directoryArn]: The ARN of the directory that the index exists in.
  ///
  /// [rangesOnIndexedValues]: Specifies the ranges of indexed values that you
  /// want to query.
  ///
  /// [indexReference]: The reference to the index to list.
  ///
  /// [maxResults]: The maximum number of objects in a single page to retrieve
  /// from the index during a request. For more information, see
  /// [AWS Directory Service Limits](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/limits.html#limits_cd).
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [consistencyLevel]: The consistency level to execute the request at.
  Future<ListIndexResponse> listIndex(
      {@required String directoryArn,
      List<ObjectAttributeRange> rangesOnIndexedValues,
      @required ObjectReference indexReference,
      int maxResults,
      String nextToken,
      String consistencyLevel}) async {
    return ListIndexResponse.fromJson({});
  }

  /// Lists all attributes that are associated with an object.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [objectReference]: The reference that identifies the object whose
  /// attributes will be listed.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  ///
  /// [facetFilter]: Used to filter the list of object attributes that are
  /// associated with a certain facet.
  Future<ListObjectAttributesResponse> listObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel,
      SchemaFacet facetFilter}) async {
    return ListObjectAttributesResponse.fromJson({});
  }

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [objectReference]: The reference that identifies the object for which
  /// child objects are being listed.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  Future<ListObjectChildrenResponse> listObjectChildren(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListObjectChildrenResponse.fromJson({});
  }

  /// Retrieves all available parent paths for any object type such as node,
  /// leaf node, policy node, and index node objects. For more information about
  /// objects, see
  /// [Directory Structure](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#dirstructure).
  ///
  /// Use this API to evaluate all parents for an object. The call returns all
  /// objects from the root of the directory up to the requested object. The API
  /// returns the number of paths based on user-defined `MaxResults`, in case
  /// there are multiple paths to the parent. The order of the paths and nodes
  /// returned is consistent among multiple API calls unless the objects are
  /// deleted or moved. Paths not leading to the directory root are ignored from
  /// the target object.
  ///
  /// [directoryArn]: The ARN of the directory to which the parent path applies.
  ///
  /// [objectReference]: The reference that identifies the object whose parent
  /// paths are listed.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  Future<ListObjectParentPathsResponse> listObjectParentPaths(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults}) async {
    return ListObjectParentPathsResponse.fromJson({});
  }

  /// Lists parent objects that are associated with a given object in pagination
  /// fashion.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [objectReference]: The reference that identifies the object for which
  /// parent objects are being listed.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  Future<ListObjectParentsResponse> listObjectParents(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListObjectParentsResponse.fromJson({});
  }

  /// Returns policies attached to an object in pagination fashion.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where objects reside. For more information, see arns.
  ///
  /// [objectReference]: Reference that identifies the object for which policies
  /// will be listed.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  Future<ListObjectPoliciesResponse> listObjectPolicies(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListObjectPoliciesResponse.fromJson({});
  }

  /// Returns a paginated list of all the outgoing TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) of the directory where you
  /// want to list the typed links.
  ///
  /// [objectReference]: A reference that identifies the object whose attributes
  /// will be listed.
  ///
  /// [filterAttributeRanges]: Provides range filters for multiple attributes.
  /// When providing ranges to typed link selection, any inexact ranges must be
  /// specified at the end. Any attributes that do not have a range specified
  /// are presumed to match the entire range.
  ///
  /// [filterTypedLink]: Filters are interpreted in the order of the attributes
  /// defined on the typed link facet, not the order they are supplied to any
  /// API calls.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  ///
  /// [consistencyLevel]: The consistency level to execute the request at.
  Future<ListOutgoingTypedLinksResponse> listOutgoingTypedLinks(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      List<TypedLinkAttributeRange> filterAttributeRanges,
      TypedLinkSchemaAndFacetName filterTypedLink,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListOutgoingTypedLinksResponse.fromJson({});
  }

  /// Returns all of the `ObjectIdentifiers` to which a given policy is
  /// attached.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where objects reside. For more information, see arns.
  ///
  /// [policyReference]: The reference that identifies the policy object.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  ///
  /// [consistencyLevel]: Represents the manner and timing in which the
  /// successful write or update of an object is reflected in a subsequent read
  /// operation of that same object.
  Future<ListPolicyAttachmentsResponse> listPolicyAttachments(
      {@required String directoryArn,
      @required ObjectReference policyReference,
      String nextToken,
      int maxResults,
      String consistencyLevel}) async {
    return ListPolicyAttachmentsResponse.fromJson({});
  }

  /// Lists the major version families of each published schema. If a major
  /// version ARN is provided as `SchemaArn`, the minor version revisions in
  /// that family are listed instead.
  ///
  /// [schemaArn]: The response for `ListPublishedSchemaArns` when this
  /// parameter is used will list all minor version ARNs for a major version.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListPublishedSchemaArnsResponse> listPublishedSchemaArns(
      {String schemaArn, String nextToken, int maxResults}) async {
    return ListPublishedSchemaArnsResponse.fromJson({});
  }

  /// Returns tags for a resource. Tagging is currently supported only for
  /// directories with a limit of 50 tags per directory. All 50 tags are
  /// returned for a given directory with this API call.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource. Tagging is
  /// only supported for directories.
  ///
  /// [nextToken]: The pagination token. This is for future use. Currently
  /// pagination is not supported for tagging.
  ///
  /// [maxResults]: The `MaxResults` parameter sets the maximum number of
  /// results returned in a single page. This is for future use and is not
  /// supported currently.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {String nextToken, int maxResults}) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Returns a paginated list of all attribute definitions for a particular
  /// TypedLinkFacet. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [name]: The unique name of the typed link facet.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListTypedLinkFacetAttributesResponse> listTypedLinkFacetAttributes(
      {@required String schemaArn,
      @required String name,
      String nextToken,
      int maxResults}) async {
    return ListTypedLinkFacetAttributesResponse.fromJson({});
  }

  /// Returns a paginated list of `TypedLink` facet names for a particular
  /// schema. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [nextToken]: The pagination token.
  ///
  /// [maxResults]: The maximum number of results to retrieve.
  Future<ListTypedLinkFacetNamesResponse> listTypedLinkFacetNames(
      String schemaArn,
      {String nextToken,
      int maxResults}) async {
    return ListTypedLinkFacetNamesResponse.fromJson({});
  }

  /// Lists all policies from the root of the Directory to the object specified.
  /// If there are no policies present, an empty list is returned. If policies
  /// are present, and if some objects don't have the policies attached, it
  /// returns the `ObjectIdentifier` for such objects. If policies are present,
  /// it returns `ObjectIdentifier`, `policyId`, and `policyType`. Paths that
  /// don't lead to the root from the target object are ignored. For more
  /// information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory. For more information, see arns.
  ///
  /// [objectReference]: Reference that identifies the object whose policies
  /// will be looked up.
  ///
  /// [nextToken]: The token to request the next page of results.
  ///
  /// [maxResults]: The maximum number of items to be retrieved in a single
  /// call. This is an approximate number.
  Future<LookupPolicyResponse> lookupPolicy(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      String nextToken,
      int maxResults}) async {
    return LookupPolicyResponse.fromJson({});
  }

  /// Publishes a development schema with a major version and a recommended
  /// minor version.
  ///
  /// [developmentSchemaArn]: The Amazon Resource Name (ARN) that is associated
  /// with the development schema. For more information, see arns.
  ///
  /// [version]: The major version under which the schema will be published.
  /// Schemas have both a major and minor version associated with them.
  ///
  /// [minorVersion]: The minor version under which the schema will be
  /// published. This parameter is recommended. Schemas have both a major and
  /// minor version associated with them.
  ///
  /// [name]: The new name under which the schema will be published. If this is
  /// not provided, the development schema is considered.
  Future<PublishSchemaResponse> publishSchema(
      {@required String developmentSchemaArn,
      @required String version,
      String minorVersion,
      String name}) async {
    return PublishSchemaResponse.fromJson({});
  }

  /// Allows a schema to be updated using JSON upload. Only available for
  /// development schemas. See
  /// [JSON Schema Format](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_schemas.html#jsonformat)
  /// for more information.
  ///
  /// [schemaArn]: The ARN of the schema to update.
  ///
  /// [document]: The replacement JSON schema.
  Future<PutSchemaFromJsonResponse> putSchemaFromJson(
      {@required String schemaArn, @required String document}) async {
    return PutSchemaFromJsonResponse.fromJson({});
  }

  /// Removes the specified facet from the specified object.
  ///
  /// [directoryArn]: The ARN of the directory in which the object resides.
  ///
  /// [schemaFacet]: The facet to remove. See SchemaFacet for details.
  ///
  /// [objectReference]: A reference to the object to remove the facet from.
  Future<RemoveFacetFromObjectResponse> removeFacetFromObject(
      {@required String directoryArn,
      @required SchemaFacet schemaFacet,
      @required ObjectReference objectReference}) async {
    return RemoveFacetFromObjectResponse.fromJson({});
  }

  /// An API operation for adding tags to a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource. Tagging is
  /// only supported for directories.
  ///
  /// [tags]: A list of tag key-value pairs.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// An API operation for removing tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource. Tagging is
  /// only supported for directories.
  ///
  /// [tagKeys]: Keys of the tag that need to be removed from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Does the following:
  ///
  /// 1.  Adds new `Attributes`, `Rules`, or `ObjectTypes`.
  ///
  /// 2.  Updates existing `Attributes`, `Rules`, or `ObjectTypes`.
  ///
  /// 3.  Deletes existing `Attributes`, `Rules`, or `ObjectTypes`.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Facet. For more information, see arns.
  ///
  /// [name]: The name of the facet.
  ///
  /// [attributeUpdates]: List of attributes that need to be updated in a given
  /// schema Facet. Each attribute is followed by `AttributeAction`, which
  /// specifies the type of update operation to perform.
  ///
  /// [objectType]: The object type that is associated with the facet. See
  /// CreateFacetRequest$ObjectType for more details.
  Future<UpdateFacetResponse> updateFacet(
      {@required String schemaArn,
      @required String name,
      List<FacetAttributeUpdate> attributeUpdates,
      String objectType}) async {
    return UpdateFacetResponse.fromJson({});
  }

  /// Updates a given typed link’s attributes. Attributes to be updated must not
  /// contribute to the typed link’s identity, as defined by its
  /// `IdentityAttributeOrder`.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the updated typed link resides. For more information, see
  /// arns or
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [typedLinkSpecifier]: Allows a typed link specifier to be accepted as
  /// input.
  ///
  /// [attributeUpdates]: The attributes update structure.
  Future<UpdateLinkAttributesResponse> updateLinkAttributes(
      {@required String directoryArn,
      @required TypedLinkSpecifier typedLinkSpecifier,
      @required List<LinkAttributeUpdate> attributeUpdates}) async {
    return UpdateLinkAttributesResponse.fromJson({});
  }

  /// Updates a given object's attributes.
  ///
  /// [directoryArn]: The Amazon Resource Name (ARN) that is associated with the
  /// Directory where the object resides. For more information, see arns.
  ///
  /// [objectReference]: The reference that identifies the object.
  ///
  /// [attributeUpdates]: The attributes update structure.
  Future<UpdateObjectAttributesResponse> updateObjectAttributes(
      {@required String directoryArn,
      @required ObjectReference objectReference,
      @required List<ObjectAttributeUpdate> attributeUpdates}) async {
    return UpdateObjectAttributesResponse.fromJson({});
  }

  /// Updates the schema name with a new name. Only development schema names can
  /// be updated.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) of the development schema. For
  /// more information, see arns.
  ///
  /// [name]: The name of the schema.
  Future<UpdateSchemaResponse> updateSchema(
      {@required String schemaArn, @required String name}) async {
    return UpdateSchemaResponse.fromJson({});
  }

  /// Updates a TypedLinkFacet. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) that is associated with the
  /// schema. For more information, see arns.
  ///
  /// [name]: The unique name of the typed link facet.
  ///
  /// [attributeUpdates]: Attributes update structure.
  ///
  /// [identityAttributeOrder]: The order of identity attributes for the facet,
  /// from most significant to least significant. The ability to filter typed
  /// links considers the order that the attributes are defined on the typed
  /// link facet. When providing ranges to a typed link selection, any inexact
  /// ranges must be specified at the end. Any attributes that do not have a
  /// range specified are presumed to match the entire range. Filters are
  /// interpreted in the order of the attributes on the typed link facet, not
  /// the order in which they are supplied to any API calls. For more
  /// information about identity attributes, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  Future<UpdateTypedLinkFacetResponse> updateTypedLinkFacet(
      {@required String schemaArn,
      @required String name,
      @required List<TypedLinkFacetAttributeUpdate> attributeUpdates,
      @required List<String> identityAttributeOrder}) async {
    return UpdateTypedLinkFacetResponse.fromJson({});
  }

  /// Upgrades a single directory in-place using the `PublishedSchemaArn` with
  /// schema updates found in `MinorVersion`. Backwards-compatible minor version
  /// upgrades are instantaneously available for readers on all objects in the
  /// directory. Note: This is a synchronous API call and upgrades only one
  /// schema on a given directory per call. To upgrade multiple directories from
  /// one schema, you would need to call this API on each directory.
  ///
  /// [publishedSchemaArn]: The revision of the published schema to upgrade the
  /// directory to.
  ///
  /// [directoryArn]: The ARN for the directory to which the upgraded schema
  /// will be applied.
  ///
  /// [dryRun]: Used for testing whether the major version schemas are backward
  /// compatible or not. If schema compatibility fails, an exception would be
  /// thrown else the call would succeed but no changes will be saved. This
  /// parameter is optional.
  Future<UpgradeAppliedSchemaResponse> upgradeAppliedSchema(
      {@required String publishedSchemaArn,
      @required String directoryArn,
      bool dryRun}) async {
    return UpgradeAppliedSchemaResponse.fromJson({});
  }

  /// Upgrades a published schema under a new minor version revision using the
  /// current contents of `DevelopmentSchemaArn`.
  ///
  /// [developmentSchemaArn]: The ARN of the development schema with the changes
  /// used for the upgrade.
  ///
  /// [publishedSchemaArn]: The ARN of the published schema to be upgraded.
  ///
  /// [minorVersion]: Identifies the minor version of the published schema that
  /// will be created. This parameter is NOT optional.
  ///
  /// [dryRun]: Used for testing whether the Development schema provided is
  /// backwards compatible, or not, with the publish schema provided by the user
  /// to be upgraded. If schema compatibility fails, an exception would be
  /// thrown else the call would succeed. This parameter is optional and
  /// defaults to false.
  Future<UpgradePublishedSchemaResponse> upgradePublishedSchema(
      {@required String developmentSchemaArn,
      @required String publishedSchemaArn,
      @required String minorVersion,
      bool dryRun}) async {
    return UpgradePublishedSchemaResponse.fromJson({});
  }
}

class AddFacetToObjectResponse {
  AddFacetToObjectResponse();
  static AddFacetToObjectResponse fromJson(Map<String, dynamic> json) =>
      AddFacetToObjectResponse();
}

class ApplySchemaResponse {
  /// The applied schema ARN that is associated with the copied schema in the
  /// Directory. You can use this ARN to describe the schema information applied
  /// on this directory. For more information, see arns.
  final String appliedSchemaArn;

  /// The ARN that is associated with the Directory. For more information, see
  /// arns.
  final String directoryArn;

  ApplySchemaResponse({
    this.appliedSchemaArn,
    this.directoryArn,
  });
  static ApplySchemaResponse fromJson(Map<String, dynamic> json) =>
      ApplySchemaResponse();
}

class AttachObjectResponse {
  /// The attached `ObjectIdentifier`, which is the child `ObjectIdentifier`.
  final String attachedObjectIdentifier;

  AttachObjectResponse({
    this.attachedObjectIdentifier,
  });
  static AttachObjectResponse fromJson(Map<String, dynamic> json) =>
      AttachObjectResponse();
}

class AttachPolicyResponse {
  AttachPolicyResponse();
  static AttachPolicyResponse fromJson(Map<String, dynamic> json) =>
      AttachPolicyResponse();
}

class AttachToIndexResponse {
  /// The `ObjectIdentifier` of the object that was attached to the index.
  final String attachedObjectIdentifier;

  AttachToIndexResponse({
    this.attachedObjectIdentifier,
  });
  static AttachToIndexResponse fromJson(Map<String, dynamic> json) =>
      AttachToIndexResponse();
}

class AttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  final TypedLinkSpecifier typedLinkSpecifier;

  AttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });
  static AttachTypedLinkResponse fromJson(Map<String, dynamic> json) =>
      AttachTypedLinkResponse();
}

/// A unique identifier for an attribute.
class AttributeKey {
  /// The Amazon Resource Name (ARN) of the schema that contains the facet and
  /// attribute.
  final String schemaArn;

  /// The name of the facet that the attribute exists within.
  final String facetName;

  /// The name of the attribute.
  final String name;

  AttributeKey({
    @required this.schemaArn,
    @required this.facetName,
    @required this.name,
  });
  static AttributeKey fromJson(Map<String, dynamic> json) => AttributeKey();
}

/// The combination of an attribute key and an attribute value.
class AttributeKeyAndValue {
  /// The key of the attribute.
  final AttributeKey key;

  /// The value of the attribute.
  final TypedAttributeValue value;

  AttributeKeyAndValue({
    @required this.key,
    @required this.value,
  });
  static AttributeKeyAndValue fromJson(Map<String, dynamic> json) =>
      AttributeKeyAndValue();
}

/// Identifies the attribute name and value for a typed link.
class AttributeNameAndValue {
  /// The attribute name of the typed link.
  final String attributeName;

  /// The value for the typed link.
  final TypedAttributeValue value;

  AttributeNameAndValue({
    @required this.attributeName,
    @required this.value,
  });
  static AttributeNameAndValue fromJson(Map<String, dynamic> json) =>
      AttributeNameAndValue();
}

/// Represents the output of a batch add facet to object operation.
class BatchAddFacetToObject {
  /// Represents the facet being added to the object.
  final SchemaFacet schemaFacet;

  /// The attributes to set on the object.
  final List<AttributeKeyAndValue> objectAttributeList;

  /// A reference to the object being mutated.
  final ObjectReference objectReference;

  BatchAddFacetToObject({
    @required this.schemaFacet,
    @required this.objectAttributeList,
    @required this.objectReference,
  });
}

/// The result of a batch add facet to object operation.
class BatchAddFacetToObjectResponse {
  BatchAddFacetToObjectResponse();
  static BatchAddFacetToObjectResponse fromJson(Map<String, dynamic> json) =>
      BatchAddFacetToObjectResponse();
}

/// Represents the output of an AttachObject operation.
class BatchAttachObject {
  /// The parent object reference.
  final ObjectReference parentReference;

  /// The child object reference that is to be attached to the object.
  final ObjectReference childReference;

  /// The name of the link.
  final String linkName;

  BatchAttachObject({
    @required this.parentReference,
    @required this.childReference,
    @required this.linkName,
  });
}

/// Represents the output batch AttachObject response operation.
class BatchAttachObjectResponse {
  /// The `ObjectIdentifier` of the object that has been attached.
  final String attachedObjectIdentifier;

  BatchAttachObjectResponse({
    this.attachedObjectIdentifier,
  });
  static BatchAttachObjectResponse fromJson(Map<String, dynamic> json) =>
      BatchAttachObjectResponse();
}

/// Attaches a policy object to a regular object inside a BatchRead
/// operation. For more information, see AttachPolicy and
/// BatchReadRequest$Operations.
class BatchAttachPolicy {
  /// The reference that is associated with the policy object.
  final ObjectReference policyReference;

  /// The reference that identifies the object to which the policy will be
  /// attached.
  final ObjectReference objectReference;

  BatchAttachPolicy({
    @required this.policyReference,
    @required this.objectReference,
  });
}

/// Represents the output of an AttachPolicy response operation.
class BatchAttachPolicyResponse {
  BatchAttachPolicyResponse();
  static BatchAttachPolicyResponse fromJson(Map<String, dynamic> json) =>
      BatchAttachPolicyResponse();
}

/// Attaches the specified object to the specified index inside a BatchRead
/// operation. For more information, see AttachToIndex and
/// BatchReadRequest$Operations.
class BatchAttachToIndex {
  /// A reference to the index that you are attaching the object to.
  final ObjectReference indexReference;

  /// A reference to the object that you are attaching to the index.
  final ObjectReference targetReference;

  BatchAttachToIndex({
    @required this.indexReference,
    @required this.targetReference,
  });
}

/// Represents the output of a AttachToIndex response operation.
class BatchAttachToIndexResponse {
  /// The `ObjectIdentifier` of the object that was attached to the index.
  final String attachedObjectIdentifier;

  BatchAttachToIndexResponse({
    this.attachedObjectIdentifier,
  });
  static BatchAttachToIndexResponse fromJson(Map<String, dynamic> json) =>
      BatchAttachToIndexResponse();
}

/// Attaches a typed link to a specified source and target object inside a
/// BatchRead operation. For more information, see AttachTypedLink and
/// BatchReadRequest$Operations.
class BatchAttachTypedLink {
  /// Identifies the source object that the typed link will attach to.
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  final ObjectReference targetObjectReference;

  /// Identifies the typed link facet that is associated with the typed link.
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  /// A set of attributes that are associated with the typed link.
  final List<AttributeNameAndValue> attributes;

  BatchAttachTypedLink({
    @required this.sourceObjectReference,
    @required this.targetObjectReference,
    @required this.typedLinkFacet,
    @required this.attributes,
  });
}

/// Represents the output of a AttachTypedLink response operation.
class BatchAttachTypedLinkResponse {
  /// Returns a typed link specifier as output.
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchAttachTypedLinkResponse({
    this.typedLinkSpecifier,
  });
  static BatchAttachTypedLinkResponse fromJson(Map<String, dynamic> json) =>
      BatchAttachTypedLinkResponse();
}

/// Creates an index object inside of a BatchRead operation. For more
/// information, see CreateIndex and BatchReadRequest$Operations.
class BatchCreateIndex {
  /// Specifies the attributes that should be indexed on. Currently only a
  /// single attribute is supported.
  final List<AttributeKey> orderedIndexedAttributeList;

  /// Indicates whether the attribute that is being indexed has unique values or
  /// not.
  final bool isUnique;

  /// A reference to the parent object that contains the index object.
  final ObjectReference parentReference;

  /// The name of the link between the parent object and the index object.
  final String linkName;

  /// The batch reference name. See
  /// [Batches](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#batches)
  /// for more information.
  final String batchReferenceName;

  BatchCreateIndex({
    @required this.orderedIndexedAttributeList,
    @required this.isUnique,
    this.parentReference,
    this.linkName,
    this.batchReferenceName,
  });
}

/// Represents the output of a CreateIndex response operation.
class BatchCreateIndexResponse {
  /// The `ObjectIdentifier` of the index created by this operation.
  final String objectIdentifier;

  BatchCreateIndexResponse({
    this.objectIdentifier,
  });
  static BatchCreateIndexResponse fromJson(Map<String, dynamic> json) =>
      BatchCreateIndexResponse();
}

/// Represents the output of a CreateObject operation.
class BatchCreateObject {
  /// A list of `FacetArns` that will be associated with the object. For more
  /// information, see arns.
  final List<SchemaFacet> schemaFacet;

  /// An attribute map, which contains an attribute ARN as the key and attribute
  /// value as the map value.
  final List<AttributeKeyAndValue> objectAttributeList;

  /// If specified, the parent reference to which this object will be attached.
  final ObjectReference parentReference;

  /// The name of the link.
  final String linkName;

  /// The batch reference name. See
  /// [Batches](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#batches)
  /// for more information.
  final String batchReferenceName;

  BatchCreateObject({
    @required this.schemaFacet,
    @required this.objectAttributeList,
    this.parentReference,
    this.linkName,
    this.batchReferenceName,
  });
}

/// Represents the output of a CreateObject response operation.
class BatchCreateObjectResponse {
  /// The ID that is associated with the object.
  final String objectIdentifier;

  BatchCreateObjectResponse({
    this.objectIdentifier,
  });
  static BatchCreateObjectResponse fromJson(Map<String, dynamic> json) =>
      BatchCreateObjectResponse();
}

/// Represents the output of a DeleteObject operation.
class BatchDeleteObject {
  /// The reference that identifies the object.
  final ObjectReference objectReference;

  BatchDeleteObject({
    @required this.objectReference,
  });
}

/// Represents the output of a DeleteObject response operation.
class BatchDeleteObjectResponse {
  BatchDeleteObjectResponse();
  static BatchDeleteObjectResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteObjectResponse();
}

/// Detaches the specified object from the specified index inside a BatchRead
/// operation. For more information, see DetachFromIndex and
/// BatchReadRequest$Operations.
class BatchDetachFromIndex {
  /// A reference to the index object.
  final ObjectReference indexReference;

  /// A reference to the object being detached from the index.
  final ObjectReference targetReference;

  BatchDetachFromIndex({
    @required this.indexReference,
    @required this.targetReference,
  });
}

/// Represents the output of a DetachFromIndex response operation.
class BatchDetachFromIndexResponse {
  /// The `ObjectIdentifier` of the object that was detached from the index.
  final String detachedObjectIdentifier;

  BatchDetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });
  static BatchDetachFromIndexResponse fromJson(Map<String, dynamic> json) =>
      BatchDetachFromIndexResponse();
}

/// Represents the output of a DetachObject operation.
class BatchDetachObject {
  /// Parent reference from which the object with the specified link name is
  /// detached.
  final ObjectReference parentReference;

  /// The name of the link.
  final String linkName;

  /// The batch reference name. See
  /// [Batches](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#batches)
  /// for more information.
  final String batchReferenceName;

  BatchDetachObject({
    @required this.parentReference,
    @required this.linkName,
    this.batchReferenceName,
  });
}

/// Represents the output of a DetachObject response operation.
class BatchDetachObjectResponse {
  /// The `ObjectIdentifier` of the detached object.
  final String detachedObjectIdentifier;

  BatchDetachObjectResponse({
    this.detachedObjectIdentifier,
  });
  static BatchDetachObjectResponse fromJson(Map<String, dynamic> json) =>
      BatchDetachObjectResponse();
}

/// Detaches the specified policy from the specified directory inside a
/// BatchWrite operation. For more information, see DetachPolicy and
/// BatchWriteRequest$Operations.
class BatchDetachPolicy {
  /// Reference that identifies the policy object.
  final ObjectReference policyReference;

  /// Reference that identifies the object whose policy object will be detached.
  final ObjectReference objectReference;

  BatchDetachPolicy({
    @required this.policyReference,
    @required this.objectReference,
  });
}

/// Represents the output of a DetachPolicy response operation.
class BatchDetachPolicyResponse {
  BatchDetachPolicyResponse();
  static BatchDetachPolicyResponse fromJson(Map<String, dynamic> json) =>
      BatchDetachPolicyResponse();
}

/// Detaches a typed link from a specified source and target object inside a
/// BatchRead operation. For more information, see DetachTypedLink and
/// BatchReadRequest$Operations.
class BatchDetachTypedLink {
  /// Used to accept a typed link specifier as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  BatchDetachTypedLink({
    @required this.typedLinkSpecifier,
  });
}

/// Represents the output of a DetachTypedLink response operation.
class BatchDetachTypedLinkResponse {
  BatchDetachTypedLinkResponse();
  static BatchDetachTypedLinkResponse fromJson(Map<String, dynamic> json) =>
      BatchDetachTypedLinkResponse();
}

/// Retrieves attributes that are associated with a typed link inside a
/// BatchRead operation. For more information, see GetLinkAttributes and
/// BatchReadRequest$Operations.
class BatchGetLinkAttributes {
  /// Allows a typed link specifier to be accepted as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  /// A list of attribute names whose values will be retrieved.
  final List<String> attributeNames;

  BatchGetLinkAttributes({
    @required this.typedLinkSpecifier,
    @required this.attributeNames,
  });
}

/// Represents the output of a GetLinkAttributes response operation.
class BatchGetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  final List<AttributeKeyAndValue> attributes;

  BatchGetLinkAttributesResponse({
    this.attributes,
  });
  static BatchGetLinkAttributesResponse fromJson(Map<String, dynamic> json) =>
      BatchGetLinkAttributesResponse();
}

/// Retrieves attributes within a facet that are associated with an object
/// inside an BatchRead operation. For more information, see GetObjectAttributes
/// and BatchReadRequest$Operations.
class BatchGetObjectAttributes {
  /// Reference that identifies the object whose attributes will be retrieved.
  final ObjectReference objectReference;

  /// Identifier for the facet whose attributes will be retrieved. See
  /// SchemaFacet for details.
  final SchemaFacet schemaFacet;

  /// List of attribute names whose values will be retrieved.
  final List<String> attributeNames;

  BatchGetObjectAttributes({
    @required this.objectReference,
    @required this.schemaFacet,
    @required this.attributeNames,
  });
}

/// Represents the output of a GetObjectAttributes response operation.
class BatchGetObjectAttributesResponse {
  /// The attribute values that are associated with an object.
  final List<AttributeKeyAndValue> attributes;

  BatchGetObjectAttributesResponse({
    this.attributes,
  });
  static BatchGetObjectAttributesResponse fromJson(Map<String, dynamic> json) =>
      BatchGetObjectAttributesResponse();
}

/// Retrieves metadata about an object inside a BatchRead operation. For more
/// information, see GetObjectInformation and BatchReadRequest$Operations.
class BatchGetObjectInformation {
  /// A reference to the object.
  final ObjectReference objectReference;

  BatchGetObjectInformation({
    @required this.objectReference,
  });
}

/// Represents the output of a GetObjectInformation response operation.
class BatchGetObjectInformationResponse {
  /// The facets attached to the specified object.
  final List<SchemaFacet> schemaFacets;

  /// The `ObjectIdentifier` of the specified object.
  final String objectIdentifier;

  BatchGetObjectInformationResponse({
    this.schemaFacets,
    this.objectIdentifier,
  });
  static BatchGetObjectInformationResponse fromJson(
          Map<String, dynamic> json) =>
      BatchGetObjectInformationResponse();
}

/// Lists indices attached to an object inside a BatchRead operation. For more
/// information, see ListAttachedIndices and BatchReadRequest$Operations.
class BatchListAttachedIndices {
  /// A reference to the object that has indices attached.
  final ObjectReference targetReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListAttachedIndices({
    @required this.targetReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListAttachedIndices response operation.
class BatchListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  final String nextToken;

  BatchListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });
  static BatchListAttachedIndicesResponse fromJson(Map<String, dynamic> json) =>
      BatchListAttachedIndicesResponse();
}

/// Returns a paginated list of all the incoming TypedLinkSpecifier information
/// for an object inside a BatchRead operation. For more information, see
/// ListIncomingTypedLinks and BatchReadRequest$Operations.
class BatchListIncomingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  final List<TypedLinkAttributeRange> filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes on the typed link
  /// facet, not the order in which they are supplied to any API calls.
  final TypedLinkSchemaAndFacetName filterTypedLink;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListIncomingTypedLinks({
    @required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListIncomingTypedLinks response operation.
class BatchListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  final List<TypedLinkSpecifier> linkSpecifiers;

  /// The pagination token.
  final String nextToken;

  BatchListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });
  static BatchListIncomingTypedLinksResponse fromJson(
          Map<String, dynamic> json) =>
      BatchListIncomingTypedLinksResponse();
}

/// Lists objects attached to the specified index inside a BatchRead operation.
/// For more information, see ListIndex and BatchReadRequest$Operations.
class BatchListIndex {
  /// Specifies the ranges of indexed values that you want to query.
  final List<ObjectAttributeRange> rangesOnIndexedValues;

  /// The reference to the index to list.
  final ObjectReference indexReference;

  /// The maximum number of results to retrieve.
  final int maxResults;

  /// The pagination token.
  final String nextToken;

  BatchListIndex({
    this.rangesOnIndexedValues,
    @required this.indexReference,
    this.maxResults,
    this.nextToken,
  });
}

/// Represents the output of a ListIndex response operation.
class BatchListIndexResponse {
  /// The objects and indexed values attached to the index.
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  final String nextToken;

  BatchListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });
  static BatchListIndexResponse fromJson(Map<String, dynamic> json) =>
      BatchListIndexResponse();
}

/// Represents the output of a ListObjectAttributes operation.
class BatchListObjectAttributes {
  /// Reference of the object whose attributes need to be listed.
  final ObjectReference objectReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  final int maxResults;

  /// Used to filter the list of object attributes that are associated with a
  /// certain facet.
  final SchemaFacet facetFilter;

  BatchListObjectAttributes({
    @required this.objectReference,
    this.nextToken,
    this.maxResults,
    this.facetFilter,
  });
}

/// Represents the output of a ListObjectAttributes response operation.
class BatchListObjectAttributesResponse {
  /// The attributes map that is associated with the object. `AttributeArn` is
  /// the key; attribute value is the value.
  final List<AttributeKeyAndValue> attributes;

  /// The pagination token.
  final String nextToken;

  BatchListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  static BatchListObjectAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      BatchListObjectAttributesResponse();
}

/// Represents the output of a ListObjectChildren operation.
class BatchListObjectChildren {
  /// Reference of the object for which child objects are being listed.
  final ObjectReference objectReference;

  /// The pagination token.
  final String nextToken;

  /// Maximum number of items to be retrieved in a single call. This is an
  /// approximate number.
  final int maxResults;

  BatchListObjectChildren({
    @required this.objectReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListObjectChildren response operation.
class BatchListObjectChildrenResponse {
  /// The children structure, which is a map with the key as the `LinkName` and
  /// `ObjectIdentifier` as the value.
  final Map<String, String> children;

  /// The pagination token.
  final String nextToken;

  BatchListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });
  static BatchListObjectChildrenResponse fromJson(Map<String, dynamic> json) =>
      BatchListObjectChildrenResponse();
}

/// Retrieves all available parent paths for any object type such as node, leaf
/// node, policy node, and index node objects inside a BatchRead operation. For
/// more information, see ListObjectParentPaths and BatchReadRequest$Operations.
class BatchListObjectParentPaths {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListObjectParentPaths({
    @required this.objectReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListObjectParentPaths response operation.
class BatchListObjectParentPathsResponse {
  /// Returns the path to the `ObjectIdentifiers` that are associated with the
  /// directory.
  final List<PathToObjectIdentifiers> pathToObjectIdentifiersList;

  /// The pagination token.
  final String nextToken;

  BatchListObjectParentPathsResponse({
    this.pathToObjectIdentifiersList,
    this.nextToken,
  });
  static BatchListObjectParentPathsResponse fromJson(
          Map<String, dynamic> json) =>
      BatchListObjectParentPathsResponse();
}

/// Returns policies attached to an object in pagination fashion inside a
/// BatchRead operation. For more information, see ListObjectPolicies and
/// BatchReadRequest$Operations.
class BatchListObjectPolicies {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListObjectPolicies({
    @required this.objectReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListObjectPolicies response operation.
class BatchListObjectPoliciesResponse {
  /// A list of policy `ObjectIdentifiers`, that are attached to the object.
  final List<String> attachedPolicyIds;

  /// The pagination token.
  final String nextToken;

  BatchListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });
  static BatchListObjectPoliciesResponse fromJson(Map<String, dynamic> json) =>
      BatchListObjectPoliciesResponse();
}

/// Returns a paginated list of all the outgoing TypedLinkSpecifier information
/// for an object inside a BatchRead operation. For more information, see
/// ListOutgoingTypedLinks and BatchReadRequest$Operations.
class BatchListOutgoingTypedLinks {
  /// The reference that identifies the object whose attributes will be listed.
  final ObjectReference objectReference;

  /// Provides range filters for multiple attributes. When providing ranges to
  /// typed link selection, any inexact ranges must be specified at the end. Any
  /// attributes that do not have a range specified are presumed to match the
  /// entire range.
  final List<TypedLinkAttributeRange> filterAttributeRanges;

  /// Filters are interpreted in the order of the attributes defined on the
  /// typed link facet, not the order they are supplied to any API calls.
  final TypedLinkSchemaAndFacetName filterTypedLink;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListOutgoingTypedLinks({
    @required this.objectReference,
    this.filterAttributeRanges,
    this.filterTypedLink,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListOutgoingTypedLinks response operation.
class BatchListOutgoingTypedLinksResponse {
  /// Returns a typed link specifier as output.
  final List<TypedLinkSpecifier> typedLinkSpecifiers;

  /// The pagination token.
  final String nextToken;

  BatchListOutgoingTypedLinksResponse({
    this.typedLinkSpecifiers,
    this.nextToken,
  });
  static BatchListOutgoingTypedLinksResponse fromJson(
          Map<String, dynamic> json) =>
      BatchListOutgoingTypedLinksResponse();
}

/// Returns all of the `ObjectIdentifiers` to which a given policy is attached
/// inside a BatchRead operation. For more information, see
/// ListPolicyAttachments and BatchReadRequest$Operations.
class BatchListPolicyAttachments {
  /// The reference that identifies the policy object.
  final ObjectReference policyReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchListPolicyAttachments({
    @required this.policyReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a ListPolicyAttachments response operation.
class BatchListPolicyAttachmentsResponse {
  /// A list of `ObjectIdentifiers` to which the policy is attached.
  final List<String> objectIdentifiers;

  /// The pagination token.
  final String nextToken;

  BatchListPolicyAttachmentsResponse({
    this.objectIdentifiers,
    this.nextToken,
  });
  static BatchListPolicyAttachmentsResponse fromJson(
          Map<String, dynamic> json) =>
      BatchListPolicyAttachmentsResponse();
}

/// Lists all policies from the root of the Directory to the object specified
/// inside a BatchRead operation. For more information, see LookupPolicy and
/// BatchReadRequest$Operations.
class BatchLookupPolicy {
  /// Reference that identifies the object whose policies will be looked up.
  final ObjectReference objectReference;

  /// The pagination token.
  final String nextToken;

  /// The maximum number of results to retrieve.
  final int maxResults;

  BatchLookupPolicy({
    @required this.objectReference,
    this.nextToken,
    this.maxResults,
  });
}

/// Represents the output of a LookupPolicy response operation.
class BatchLookupPolicyResponse {
  /// Provides list of path to policies. Policies contain `PolicyId`,
  /// `ObjectIdentifier`, and `PolicyType`. For more information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  final List<PolicyToPath> policyToPathList;

  /// The pagination token.
  final String nextToken;

  BatchLookupPolicyResponse({
    this.policyToPathList,
    this.nextToken,
  });
  static BatchLookupPolicyResponse fromJson(Map<String, dynamic> json) =>
      BatchLookupPolicyResponse();
}

/// The batch read exception structure, which contains the exception type and
/// message.
class BatchReadException {
  /// A type of exception, such as `InvalidArnException`.
  final String type;

  /// An exception message that is associated with the failure.
  final String message;

  BatchReadException({
    this.type,
    this.message,
  });
  static BatchReadException fromJson(Map<String, dynamic> json) =>
      BatchReadException();
}

/// Represents the output of a `BatchRead` operation.
class BatchReadOperation {
  /// Lists all attributes that are associated with an object.
  final BatchListObjectAttributes listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  final BatchListObjectChildren listObjectChildren;

  /// Lists indices attached to an object.
  final BatchListAttachedIndices listAttachedIndices;

  /// Retrieves all available parent paths for any object type such as node,
  /// leaf node, policy node, and index node objects. For more information about
  /// objects, see
  /// [Directory Structure](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#dirstructure).
  final BatchListObjectParentPaths listObjectParentPaths;

  /// Retrieves metadata about an object.
  final BatchGetObjectInformation getObjectInformation;

  /// Retrieves attributes within a facet that are associated with an object.
  final BatchGetObjectAttributes getObjectAttributes;

  /// Returns policies attached to an object in pagination fashion.
  final BatchListObjectPolicies listObjectPolicies;

  /// Returns all of the `ObjectIdentifiers` to which a given policy is
  /// attached.
  final BatchListPolicyAttachments listPolicyAttachments;

  /// Lists all policies from the root of the Directory to the object specified.
  /// If there are no policies present, an empty list is returned. If policies
  /// are present, and if some objects don't have the policies attached, it
  /// returns the `ObjectIdentifier` for such objects. If policies are present,
  /// it returns `ObjectIdentifier`, `policyId`, and `policyType`. Paths that
  /// don't lead to the root from the target object are ignored. For more
  /// information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  final BatchLookupPolicy lookupPolicy;

  /// Lists objects attached to the specified index.
  final BatchListIndex listIndex;

  /// Returns a paginated list of all the outgoing TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchListOutgoingTypedLinks listOutgoingTypedLinks;

  /// Returns a paginated list of all the incoming TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchListIncomingTypedLinks listIncomingTypedLinks;

  /// Retrieves attributes that are associated with a typed link.
  final BatchGetLinkAttributes getLinkAttributes;

  BatchReadOperation({
    this.listObjectAttributes,
    this.listObjectChildren,
    this.listAttachedIndices,
    this.listObjectParentPaths,
    this.getObjectInformation,
    this.getObjectAttributes,
    this.listObjectPolicies,
    this.listPolicyAttachments,
    this.lookupPolicy,
    this.listIndex,
    this.listOutgoingTypedLinks,
    this.listIncomingTypedLinks,
    this.getLinkAttributes,
  });
}

/// Represents the output of a `BatchRead` response operation.
class BatchReadOperationResponse {
  /// Identifies which operation in a batch has succeeded.
  final BatchReadSuccessfulResponse successfulResponse;

  /// Identifies which operation in a batch has failed.
  final BatchReadException exceptionResponse;

  BatchReadOperationResponse({
    this.successfulResponse,
    this.exceptionResponse,
  });
  static BatchReadOperationResponse fromJson(Map<String, dynamic> json) =>
      BatchReadOperationResponse();
}

class BatchReadResponse {
  /// A list of all the responses for each batch read.
  final List<BatchReadOperationResponse> responses;

  BatchReadResponse({
    this.responses,
  });
  static BatchReadResponse fromJson(Map<String, dynamic> json) =>
      BatchReadResponse();
}

/// Represents the output of a `BatchRead` success response operation.
class BatchReadSuccessfulResponse {
  /// Lists all attributes that are associated with an object.
  final BatchListObjectAttributesResponse listObjectAttributes;

  /// Returns a paginated list of child objects that are associated with a given
  /// object.
  final BatchListObjectChildrenResponse listObjectChildren;

  /// Retrieves metadata about an object.
  final BatchGetObjectInformationResponse getObjectInformation;

  /// Retrieves attributes within a facet that are associated with an object.
  final BatchGetObjectAttributesResponse getObjectAttributes;

  /// Lists indices attached to an object.
  final BatchListAttachedIndicesResponse listAttachedIndices;

  /// Retrieves all available parent paths for any object type such as node,
  /// leaf node, policy node, and index node objects. For more information about
  /// objects, see
  /// [Directory Structure](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#dirstructure).
  final BatchListObjectParentPathsResponse listObjectParentPaths;

  /// Returns policies attached to an object in pagination fashion.
  final BatchListObjectPoliciesResponse listObjectPolicies;

  /// Returns all of the `ObjectIdentifiers` to which a given policy is
  /// attached.
  final BatchListPolicyAttachmentsResponse listPolicyAttachments;

  /// Lists all policies from the root of the Directory to the object specified.
  /// If there are no policies present, an empty list is returned. If policies
  /// are present, and if some objects don't have the policies attached, it
  /// returns the `ObjectIdentifier` for such objects. If policies are present,
  /// it returns `ObjectIdentifier`, `policyId`, and `policyType`. Paths that
  /// don't lead to the root from the target object are ignored. For more
  /// information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  final BatchLookupPolicyResponse lookupPolicy;

  /// Lists objects attached to the specified index.
  final BatchListIndexResponse listIndex;

  /// Returns a paginated list of all the outgoing TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchListOutgoingTypedLinksResponse listOutgoingTypedLinks;

  /// Returns a paginated list of all the incoming TypedLinkSpecifier
  /// information for an object. It also supports filtering by typed link facet
  /// and identity attributes. For more information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchListIncomingTypedLinksResponse listIncomingTypedLinks;

  /// The list of attributes to retrieve from the typed link.
  final BatchGetLinkAttributesResponse getLinkAttributes;

  BatchReadSuccessfulResponse({
    this.listObjectAttributes,
    this.listObjectChildren,
    this.getObjectInformation,
    this.getObjectAttributes,
    this.listAttachedIndices,
    this.listObjectParentPaths,
    this.listObjectPolicies,
    this.listPolicyAttachments,
    this.lookupPolicy,
    this.listIndex,
    this.listOutgoingTypedLinks,
    this.listIncomingTypedLinks,
    this.getLinkAttributes,
  });
  static BatchReadSuccessfulResponse fromJson(Map<String, dynamic> json) =>
      BatchReadSuccessfulResponse();
}

/// A batch operation to remove a facet from an object.
class BatchRemoveFacetFromObject {
  /// The facet to remove from the object.
  final SchemaFacet schemaFacet;

  /// A reference to the object whose facet will be removed.
  final ObjectReference objectReference;

  BatchRemoveFacetFromObject({
    @required this.schemaFacet,
    @required this.objectReference,
  });
}

/// An empty result that represents success.
class BatchRemoveFacetFromObjectResponse {
  BatchRemoveFacetFromObjectResponse();
  static BatchRemoveFacetFromObjectResponse fromJson(
          Map<String, dynamic> json) =>
      BatchRemoveFacetFromObjectResponse();
}

/// Updates a given typed link’s attributes inside a BatchRead operation.
/// Attributes to be updated must not contribute to the typed link’s identity,
/// as defined by its `IdentityAttributeOrder`. For more information, see
/// UpdateLinkAttributes and BatchReadRequest$Operations.
class BatchUpdateLinkAttributes {
  /// Allows a typed link specifier to be accepted as input.
  final TypedLinkSpecifier typedLinkSpecifier;

  /// The attributes update structure.
  final List<LinkAttributeUpdate> attributeUpdates;

  BatchUpdateLinkAttributes({
    @required this.typedLinkSpecifier,
    @required this.attributeUpdates,
  });
}

/// Represents the output of a UpdateLinkAttributes response operation.
class BatchUpdateLinkAttributesResponse {
  BatchUpdateLinkAttributesResponse();
  static BatchUpdateLinkAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      BatchUpdateLinkAttributesResponse();
}

/// Represents the output of a `BatchUpdate` operation.
class BatchUpdateObjectAttributes {
  /// Reference that identifies the object.
  final ObjectReference objectReference;

  /// Attributes update structure.
  final List<ObjectAttributeUpdate> attributeUpdates;

  BatchUpdateObjectAttributes({
    @required this.objectReference,
    @required this.attributeUpdates,
  });
}

/// Represents the output of a `BatchUpdate` response operation.
class BatchUpdateObjectAttributesResponse {
  /// ID that is associated with the object.
  final String objectIdentifier;

  BatchUpdateObjectAttributesResponse({
    this.objectIdentifier,
  });
  static BatchUpdateObjectAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      BatchUpdateObjectAttributesResponse();
}

/// Represents the output of a `BatchWrite` operation.
class BatchWriteOperation {
  /// Creates an object.
  final BatchCreateObject createObject;

  /// Attaches an object to a Directory.
  final BatchAttachObject attachObject;

  /// Detaches an object from a Directory.
  final BatchDetachObject detachObject;

  /// Updates a given object's attributes.
  final BatchUpdateObjectAttributes updateObjectAttributes;

  /// Deletes an object in a Directory.
  final BatchDeleteObject deleteObject;

  /// A batch operation that adds a facet to an object.
  final BatchAddFacetToObject addFacetToObject;

  /// A batch operation that removes a facet from an object.
  final BatchRemoveFacetFromObject removeFacetFromObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  final BatchAttachPolicy attachPolicy;

  /// Detaches a policy from a Directory.
  final BatchDetachPolicy detachPolicy;

  /// Creates an index object. See
  /// [Indexing](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_indexing.html)
  /// for more information.
  final BatchCreateIndex createIndex;

  /// Attaches the specified object to the specified index.
  final BatchAttachToIndex attachToIndex;

  /// Detaches the specified object from the specified index.
  final BatchDetachFromIndex detachFromIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchAttachTypedLink attachTypedLink;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchDetachTypedLink detachTypedLink;

  /// Updates a given object's attributes.
  final BatchUpdateLinkAttributes updateLinkAttributes;

  BatchWriteOperation({
    this.createObject,
    this.attachObject,
    this.detachObject,
    this.updateObjectAttributes,
    this.deleteObject,
    this.addFacetToObject,
    this.removeFacetFromObject,
    this.attachPolicy,
    this.detachPolicy,
    this.createIndex,
    this.attachToIndex,
    this.detachFromIndex,
    this.attachTypedLink,
    this.detachTypedLink,
    this.updateLinkAttributes,
  });
}

/// Represents the output of a `BatchWrite` response operation.
class BatchWriteOperationResponse {
  /// Creates an object in a Directory.
  final BatchCreateObjectResponse createObject;

  /// Attaches an object to a Directory.
  final BatchAttachObjectResponse attachObject;

  /// Detaches an object from a Directory.
  final BatchDetachObjectResponse detachObject;

  /// Updates a given object’s attributes.
  final BatchUpdateObjectAttributesResponse updateObjectAttributes;

  /// Deletes an object in a Directory.
  final BatchDeleteObjectResponse deleteObject;

  /// The result of an add facet to object batch operation.
  final BatchAddFacetToObjectResponse addFacetToObject;

  /// The result of a batch remove facet from object operation.
  final BatchRemoveFacetFromObjectResponse removeFacetFromObject;

  /// Attaches a policy object to a regular object. An object can have a limited
  /// number of attached policies.
  final BatchAttachPolicyResponse attachPolicy;

  /// Detaches a policy from a Directory.
  final BatchDetachPolicyResponse detachPolicy;

  /// Creates an index object. See
  /// [Indexing](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_indexing.html)
  /// for more information.
  final BatchCreateIndexResponse createIndex;

  /// Attaches the specified object to the specified index.
  final BatchAttachToIndexResponse attachToIndex;

  /// Detaches the specified object from the specified index.
  final BatchDetachFromIndexResponse detachFromIndex;

  /// Attaches a typed link to a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchAttachTypedLinkResponse attachTypedLink;

  /// Detaches a typed link from a specified source and target object. For more
  /// information, see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final BatchDetachTypedLinkResponse detachTypedLink;

  /// Represents the output of a `BatchWrite` response operation.
  final BatchUpdateLinkAttributesResponse updateLinkAttributes;

  BatchWriteOperationResponse({
    this.createObject,
    this.attachObject,
    this.detachObject,
    this.updateObjectAttributes,
    this.deleteObject,
    this.addFacetToObject,
    this.removeFacetFromObject,
    this.attachPolicy,
    this.detachPolicy,
    this.createIndex,
    this.attachToIndex,
    this.detachFromIndex,
    this.attachTypedLink,
    this.detachTypedLink,
    this.updateLinkAttributes,
  });
  static BatchWriteOperationResponse fromJson(Map<String, dynamic> json) =>
      BatchWriteOperationResponse();
}

class BatchWriteResponse {
  /// A list of all the responses for each batch write.
  final List<BatchWriteOperationResponse> responses;

  BatchWriteResponse({
    this.responses,
  });
  static BatchWriteResponse fromJson(Map<String, dynamic> json) =>
      BatchWriteResponse();
}

class CreateDirectoryResponse {
  /// The ARN that is associated with the Directory. For more information, see
  /// arns.
  final String directoryArn;

  /// The name of the Directory.
  final String name;

  /// The root object node of the created directory.
  final String objectIdentifier;

  /// The ARN of the published schema in the Directory. Once a published schema
  /// is copied into the directory, it has its own ARN, which is referred to
  /// applied schema ARN. For more information, see arns.
  final String appliedSchemaArn;

  CreateDirectoryResponse({
    @required this.directoryArn,
    @required this.name,
    @required this.objectIdentifier,
    @required this.appliedSchemaArn,
  });
  static CreateDirectoryResponse fromJson(Map<String, dynamic> json) =>
      CreateDirectoryResponse();
}

class CreateFacetResponse {
  CreateFacetResponse();
  static CreateFacetResponse fromJson(Map<String, dynamic> json) =>
      CreateFacetResponse();
}

class CreateIndexResponse {
  /// The `ObjectIdentifier` of the index created by this operation.
  final String objectIdentifier;

  CreateIndexResponse({
    this.objectIdentifier,
  });
  static CreateIndexResponse fromJson(Map<String, dynamic> json) =>
      CreateIndexResponse();
}

class CreateObjectResponse {
  /// The identifier that is associated with the object.
  final String objectIdentifier;

  CreateObjectResponse({
    this.objectIdentifier,
  });
  static CreateObjectResponse fromJson(Map<String, dynamic> json) =>
      CreateObjectResponse();
}

class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see arns.
  final String schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });
  static CreateSchemaResponse fromJson(Map<String, dynamic> json) =>
      CreateSchemaResponse();
}

class CreateTypedLinkFacetResponse {
  CreateTypedLinkFacetResponse();
  static CreateTypedLinkFacetResponse fromJson(Map<String, dynamic> json) =>
      CreateTypedLinkFacetResponse();
}

class DeleteDirectoryResponse {
  /// The ARN of the deleted directory.
  final String directoryArn;

  DeleteDirectoryResponse({
    @required this.directoryArn,
  });
  static DeleteDirectoryResponse fromJson(Map<String, dynamic> json) =>
      DeleteDirectoryResponse();
}

class DeleteFacetResponse {
  DeleteFacetResponse();
  static DeleteFacetResponse fromJson(Map<String, dynamic> json) =>
      DeleteFacetResponse();
}

class DeleteObjectResponse {
  DeleteObjectResponse();
  static DeleteObjectResponse fromJson(Map<String, dynamic> json) =>
      DeleteObjectResponse();
}

class DeleteSchemaResponse {
  /// The input ARN that is returned as part of the response. For more
  /// information, see arns.
  final String schemaArn;

  DeleteSchemaResponse({
    this.schemaArn,
  });
  static DeleteSchemaResponse fromJson(Map<String, dynamic> json) =>
      DeleteSchemaResponse();
}

class DeleteTypedLinkFacetResponse {
  DeleteTypedLinkFacetResponse();
  static DeleteTypedLinkFacetResponse fromJson(Map<String, dynamic> json) =>
      DeleteTypedLinkFacetResponse();
}

class DetachFromIndexResponse {
  /// The `ObjectIdentifier` of the object that was detached from the index.
  final String detachedObjectIdentifier;

  DetachFromIndexResponse({
    this.detachedObjectIdentifier,
  });
  static DetachFromIndexResponse fromJson(Map<String, dynamic> json) =>
      DetachFromIndexResponse();
}

class DetachObjectResponse {
  /// The `ObjectIdentifier` that was detached from the object.
  final String detachedObjectIdentifier;

  DetachObjectResponse({
    this.detachedObjectIdentifier,
  });
  static DetachObjectResponse fromJson(Map<String, dynamic> json) =>
      DetachObjectResponse();
}

class DetachPolicyResponse {
  DetachPolicyResponse();
  static DetachPolicyResponse fromJson(Map<String, dynamic> json) =>
      DetachPolicyResponse();
}

/// Directory structure that includes the directory name and directory ARN.
class Directory {
  /// The name of the directory.
  final String name;

  /// The Amazon Resource Name (ARN) that is associated with the directory. For
  /// more information, see arns.
  final String directoryArn;

  /// The state of the directory. Can be either `Enabled`, `Disabled`, or
  /// `Deleted`.
  final String state;

  /// The date and time when the directory was created.
  final DateTime creationDateTime;

  Directory({
    this.name,
    this.directoryArn,
    this.state,
    this.creationDateTime,
  });
  static Directory fromJson(Map<String, dynamic> json) => Directory();
}

class DisableDirectoryResponse {
  /// The ARN of the directory that has been disabled.
  final String directoryArn;

  DisableDirectoryResponse({
    @required this.directoryArn,
  });
  static DisableDirectoryResponse fromJson(Map<String, dynamic> json) =>
      DisableDirectoryResponse();
}

class EnableDirectoryResponse {
  /// The ARN of the enabled directory.
  final String directoryArn;

  EnableDirectoryResponse({
    @required this.directoryArn,
  });
  static EnableDirectoryResponse fromJson(Map<String, dynamic> json) =>
      EnableDirectoryResponse();
}

/// A structure that contains `Name`, `ARN`, `Attributes`,  `Rules`, and
/// `ObjectTypes`. See
/// [Facets](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/whatarefacets.html)
/// for more information.
class Facet {
  /// The name of the Facet.
  final String name;

  /// The object type that is associated with the facet. See
  /// CreateFacetRequest$ObjectType for more details.
  final String objectType;

  Facet({
    this.name,
    this.objectType,
  });
  static Facet fromJson(Map<String, dynamic> json) => Facet();
}

/// An attribute that is associated with the Facet.
class FacetAttribute {
  /// The name of the facet attribute.
  final String name;

  /// A facet attribute consists of either a definition or a reference. This
  /// structure contains the attribute definition. See
  /// [Attribute References](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#attributereferences)
  /// for more information.
  final FacetAttributeDefinition attributeDefinition;

  /// An attribute reference that is associated with the attribute. See
  /// [Attribute References](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#attributereferences)
  /// for more information.
  final FacetAttributeReference attributeReference;

  /// The required behavior of the `FacetAttribute`.
  final String requiredBehavior;

  FacetAttribute({
    @required this.name,
    this.attributeDefinition,
    this.attributeReference,
    this.requiredBehavior,
  });
  static FacetAttribute fromJson(Map<String, dynamic> json) => FacetAttribute();
}

/// A facet attribute definition. See
/// [Attribute References](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#attributereferences)
/// for more information.
class FacetAttributeDefinition {
  /// The type of the attribute.
  final String type;

  /// The default value of the attribute (if configured).
  final TypedAttributeValue defaultValue;

  /// Whether the attribute is mutable or not.
  final bool isImmutable;

  /// Validation rules attached to the attribute definition.
  final Map<String, Rule> rules;

  FacetAttributeDefinition({
    @required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
  });
  static FacetAttributeDefinition fromJson(Map<String, dynamic> json) =>
      FacetAttributeDefinition();
}

/// The facet attribute reference that specifies the attribute definition that
/// contains the attribute facet name and attribute name.
class FacetAttributeReference {
  /// The target facet name that is associated with the facet reference. See
  /// [Attribute References](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#attributereferences)
  /// for more information.
  final String targetFacetName;

  /// The target attribute name that is associated with the facet reference. See
  /// [Attribute References](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_advanced.html#attributereferences)
  /// for more information.
  final String targetAttributeName;

  FacetAttributeReference({
    @required this.targetFacetName,
    @required this.targetAttributeName,
  });
  static FacetAttributeReference fromJson(Map<String, dynamic> json) =>
      FacetAttributeReference();
}

/// A structure that contains information used to update an attribute.
class FacetAttributeUpdate {
  /// The attribute to update.
  final FacetAttribute attribute;

  /// The action to perform when updating the attribute.
  final String action;

  FacetAttributeUpdate({
    this.attribute,
    this.action,
  });
}

class GetAppliedSchemaVersionResponse {
  /// Current applied schema ARN, including the minor version in use if one was
  /// provided.
  final String appliedSchemaArn;

  GetAppliedSchemaVersionResponse({
    this.appliedSchemaArn,
  });
  static GetAppliedSchemaVersionResponse fromJson(Map<String, dynamic> json) =>
      GetAppliedSchemaVersionResponse();
}

class GetDirectoryResponse {
  /// Metadata about the directory.
  final Directory directory;

  GetDirectoryResponse({
    @required this.directory,
  });
  static GetDirectoryResponse fromJson(Map<String, dynamic> json) =>
      GetDirectoryResponse();
}

class GetFacetResponse {
  /// The Facet structure that is associated with the facet.
  final Facet facet;

  GetFacetResponse({
    this.facet,
  });
  static GetFacetResponse fromJson(Map<String, dynamic> json) =>
      GetFacetResponse();
}

class GetLinkAttributesResponse {
  /// The attributes that are associated with the typed link.
  final List<AttributeKeyAndValue> attributes;

  GetLinkAttributesResponse({
    this.attributes,
  });
  static GetLinkAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetLinkAttributesResponse();
}

class GetObjectAttributesResponse {
  /// The attributes that are associated with the object.
  final List<AttributeKeyAndValue> attributes;

  GetObjectAttributesResponse({
    this.attributes,
  });
  static GetObjectAttributesResponse fromJson(Map<String, dynamic> json) =>
      GetObjectAttributesResponse();
}

class GetObjectInformationResponse {
  /// The facets attached to the specified object. Although the response does
  /// not include minor version information, the most recently applied minor
  /// version of each Facet is in effect. See GetAppliedSchemaVersion for
  /// details.
  final List<SchemaFacet> schemaFacets;

  /// The `ObjectIdentifier` of the specified object.
  final String objectIdentifier;

  GetObjectInformationResponse({
    this.schemaFacets,
    this.objectIdentifier,
  });
  static GetObjectInformationResponse fromJson(Map<String, dynamic> json) =>
      GetObjectInformationResponse();
}

class GetSchemaAsJsonResponse {
  /// The name of the retrieved schema.
  final String name;

  /// The JSON representation of the schema document.
  final String document;

  GetSchemaAsJsonResponse({
    this.name,
    this.document,
  });
  static GetSchemaAsJsonResponse fromJson(Map<String, dynamic> json) =>
      GetSchemaAsJsonResponse();
}

class GetTypedLinkFacetInformationResponse {
  /// The order of identity attributes for the facet, from most significant to
  /// least significant. The ability to filter typed links considers the order
  /// that the attributes are defined on the typed link facet. When providing
  /// ranges to typed link selection, any inexact ranges must be specified at
  /// the end. Any attributes that do not have a range specified are presumed to
  /// match the entire range. Filters are interpreted in the order of the
  /// attributes on the typed link facet, not the order in which they are
  /// supplied to any API calls. For more information about identity attributes,
  /// see
  /// [Typed link](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#typedlink).
  final List<String> identityAttributeOrder;

  GetTypedLinkFacetInformationResponse({
    this.identityAttributeOrder,
  });
  static GetTypedLinkFacetInformationResponse fromJson(
          Map<String, dynamic> json) =>
      GetTypedLinkFacetInformationResponse();
}

/// Represents an index and an attached object.
class IndexAttachment {
  /// The indexed attribute values.
  final List<AttributeKeyAndValue> indexedAttributes;

  /// In response to ListIndex, the `ObjectIdentifier` of the object attached to
  /// the index. In response to ListAttachedIndices, the `ObjectIdentifier` of
  /// the index attached to the object. This field will always contain the
  /// `ObjectIdentifier` of the object on the opposite side of the attachment
  /// specified in the query.
  final String objectIdentifier;

  IndexAttachment({
    this.indexedAttributes,
    this.objectIdentifier,
  });
  static IndexAttachment fromJson(Map<String, dynamic> json) =>
      IndexAttachment();
}

/// The action to take on a typed link attribute value. Updates are only
/// supported for attributes which don’t contribute to link identity.
class LinkAttributeAction {
  /// A type that can be either `UPDATE_OR_CREATE` or `DELETE`.
  final String attributeActionType;

  /// The value that you want to update to.
  final TypedAttributeValue attributeUpdateValue;

  LinkAttributeAction({
    this.attributeActionType,
    this.attributeUpdateValue,
  });
}

/// Structure that contains attribute update information.
class LinkAttributeUpdate {
  /// The key of the attribute being updated.
  final AttributeKey attributeKey;

  /// The action to perform as part of the attribute update.
  final LinkAttributeAction attributeAction;

  LinkAttributeUpdate({
    this.attributeKey,
    this.attributeAction,
  });
}

class ListAppliedSchemaArnsResponse {
  /// The ARNs of schemas that are applied to the directory.
  final List<String> schemaArns;

  /// The pagination token.
  final String nextToken;

  ListAppliedSchemaArnsResponse({
    this.schemaArns,
    this.nextToken,
  });
  static ListAppliedSchemaArnsResponse fromJson(Map<String, dynamic> json) =>
      ListAppliedSchemaArnsResponse();
}

class ListAttachedIndicesResponse {
  /// The indices attached to the specified object.
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  final String nextToken;

  ListAttachedIndicesResponse({
    this.indexAttachments,
    this.nextToken,
  });
  static ListAttachedIndicesResponse fromJson(Map<String, dynamic> json) =>
      ListAttachedIndicesResponse();
}

class ListDevelopmentSchemaArnsResponse {
  /// The ARNs of retrieved development schemas.
  final List<String> schemaArns;

  /// The pagination token.
  final String nextToken;

  ListDevelopmentSchemaArnsResponse({
    this.schemaArns,
    this.nextToken,
  });
  static ListDevelopmentSchemaArnsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDevelopmentSchemaArnsResponse();
}

class ListDirectoriesResponse {
  /// Lists all directories that are associated with your account in pagination
  /// fashion.
  final List<Directory> directories;

  /// The pagination token.
  final String nextToken;

  ListDirectoriesResponse({
    @required this.directories,
    this.nextToken,
  });
  static ListDirectoriesResponse fromJson(Map<String, dynamic> json) =>
      ListDirectoriesResponse();
}

class ListFacetAttributesResponse {
  /// The attributes attached to the facet.
  final List<FacetAttribute> attributes;

  /// The pagination token.
  final String nextToken;

  ListFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  static ListFacetAttributesResponse fromJson(Map<String, dynamic> json) =>
      ListFacetAttributesResponse();
}

class ListFacetNamesResponse {
  /// The names of facets that exist within the schema.
  final List<String> facetNames;

  /// The pagination token.
  final String nextToken;

  ListFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });
  static ListFacetNamesResponse fromJson(Map<String, dynamic> json) =>
      ListFacetNamesResponse();
}

class ListIncomingTypedLinksResponse {
  /// Returns one or more typed link specifiers as output.
  final List<TypedLinkSpecifier> linkSpecifiers;

  /// The pagination token.
  final String nextToken;

  ListIncomingTypedLinksResponse({
    this.linkSpecifiers,
    this.nextToken,
  });
  static ListIncomingTypedLinksResponse fromJson(Map<String, dynamic> json) =>
      ListIncomingTypedLinksResponse();
}

class ListIndexResponse {
  /// The objects and indexed values attached to the index.
  final List<IndexAttachment> indexAttachments;

  /// The pagination token.
  final String nextToken;

  ListIndexResponse({
    this.indexAttachments,
    this.nextToken,
  });
  static ListIndexResponse fromJson(Map<String, dynamic> json) =>
      ListIndexResponse();
}

class ListObjectAttributesResponse {
  /// Attributes map that is associated with the object. `AttributeArn` is the
  /// key, and attribute value is the value.
  final List<AttributeKeyAndValue> attributes;

  /// The pagination token.
  final String nextToken;

  ListObjectAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  static ListObjectAttributesResponse fromJson(Map<String, dynamic> json) =>
      ListObjectAttributesResponse();
}

class ListObjectChildrenResponse {
  /// Children structure, which is a map with key as the `LinkName` and
  /// `ObjectIdentifier` as the value.
  final Map<String, String> children;

  /// The pagination token.
  final String nextToken;

  ListObjectChildrenResponse({
    this.children,
    this.nextToken,
  });
  static ListObjectChildrenResponse fromJson(Map<String, dynamic> json) =>
      ListObjectChildrenResponse();
}

class ListObjectParentPathsResponse {
  /// Returns the path to the `ObjectIdentifiers` that are associated with the
  /// directory.
  final List<PathToObjectIdentifiers> pathToObjectIdentifiersList;

  /// The pagination token.
  final String nextToken;

  ListObjectParentPathsResponse({
    this.pathToObjectIdentifiersList,
    this.nextToken,
  });
  static ListObjectParentPathsResponse fromJson(Map<String, dynamic> json) =>
      ListObjectParentPathsResponse();
}

class ListObjectParentsResponse {
  /// The parent structure, which is a map with key as the `ObjectIdentifier`
  /// and LinkName as the value.
  final Map<String, String> parents;

  /// The pagination token.
  final String nextToken;

  ListObjectParentsResponse({
    this.parents,
    this.nextToken,
  });
  static ListObjectParentsResponse fromJson(Map<String, dynamic> json) =>
      ListObjectParentsResponse();
}

class ListObjectPoliciesResponse {
  /// A list of policy `ObjectIdentifiers`, that are attached to the object.
  final List<String> attachedPolicyIds;

  /// The pagination token.
  final String nextToken;

  ListObjectPoliciesResponse({
    this.attachedPolicyIds,
    this.nextToken,
  });
  static ListObjectPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListObjectPoliciesResponse();
}

class ListOutgoingTypedLinksResponse {
  /// Returns a typed link specifier as output.
  final List<TypedLinkSpecifier> typedLinkSpecifiers;

  /// The pagination token.
  final String nextToken;

  ListOutgoingTypedLinksResponse({
    this.typedLinkSpecifiers,
    this.nextToken,
  });
  static ListOutgoingTypedLinksResponse fromJson(Map<String, dynamic> json) =>
      ListOutgoingTypedLinksResponse();
}

class ListPolicyAttachmentsResponse {
  /// A list of `ObjectIdentifiers` to which the policy is attached.
  final List<String> objectIdentifiers;

  /// The pagination token.
  final String nextToken;

  ListPolicyAttachmentsResponse({
    this.objectIdentifiers,
    this.nextToken,
  });
  static ListPolicyAttachmentsResponse fromJson(Map<String, dynamic> json) =>
      ListPolicyAttachmentsResponse();
}

class ListPublishedSchemaArnsResponse {
  /// The ARNs of published schemas.
  final List<String> schemaArns;

  /// The pagination token.
  final String nextToken;

  ListPublishedSchemaArnsResponse({
    this.schemaArns,
    this.nextToken,
  });
  static ListPublishedSchemaArnsResponse fromJson(Map<String, dynamic> json) =>
      ListPublishedSchemaArnsResponse();
}

class ListTagsForResourceResponse {
  /// A list of tag key value pairs that are associated with the response.
  final List<Tag> tags;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTypedLinkFacetAttributesResponse {
  /// An ordered set of attributes associate with the typed link.
  final List<TypedLinkAttributeDefinition> attributes;

  /// The pagination token.
  final String nextToken;

  ListTypedLinkFacetAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  static ListTypedLinkFacetAttributesResponse fromJson(
          Map<String, dynamic> json) =>
      ListTypedLinkFacetAttributesResponse();
}

class ListTypedLinkFacetNamesResponse {
  /// The names of typed link facets that exist within the schema.
  final List<String> facetNames;

  /// The pagination token.
  final String nextToken;

  ListTypedLinkFacetNamesResponse({
    this.facetNames,
    this.nextToken,
  });
  static ListTypedLinkFacetNamesResponse fromJson(Map<String, dynamic> json) =>
      ListTypedLinkFacetNamesResponse();
}

class LookupPolicyResponse {
  /// Provides list of path to policies. Policies contain `PolicyId`,
  /// `ObjectIdentifier`, and `PolicyType`. For more information, see
  /// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
  final List<PolicyToPath> policyToPathList;

  /// The pagination token.
  final String nextToken;

  LookupPolicyResponse({
    this.policyToPathList,
    this.nextToken,
  });
  static LookupPolicyResponse fromJson(Map<String, dynamic> json) =>
      LookupPolicyResponse();
}

/// The action to take on the object attribute.
class ObjectAttributeAction {
  /// A type that can be either `Update` or `Delete`.
  final String objectAttributeActionType;

  /// The value that you want to update to.
  final TypedAttributeValue objectAttributeUpdateValue;

  ObjectAttributeAction({
    this.objectAttributeActionType,
    this.objectAttributeUpdateValue,
  });
}

/// A range of attributes.
class ObjectAttributeRange {
  /// The key of the attribute that the attribute range covers.
  final AttributeKey attributeKey;

  /// The range of attribute values being selected.
  final TypedAttributeValueRange range;

  ObjectAttributeRange({
    this.attributeKey,
    this.range,
  });
}

/// Structure that contains attribute update information.
class ObjectAttributeUpdate {
  /// The key of the attribute being updated.
  final AttributeKey objectAttributeKey;

  /// The action to perform as part of the attribute update.
  final ObjectAttributeAction objectAttributeAction;

  ObjectAttributeUpdate({
    this.objectAttributeKey,
    this.objectAttributeAction,
  });
}

/// The reference that identifies an object.
class ObjectReference {
  /// A path selector supports easy selection of an object by the parent/child
  /// links leading to it from the directory root. Use the link names from each
  /// parent/child link to construct the path. Path selectors start with a slash
  /// (/) and link names are separated by slashes. For more information about
  /// paths, see
  /// [Accessing Objects](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#accessingobjects).
  /// You can identify an object in one of the following ways:
  ///
  /// *    _$ObjectIdentifier_ - An object identifier is an opaque string
  /// provided by Amazon Cloud Directory. When creating objects, the system will
  /// provide you with the identifier of the created object. An object’s
  /// identifier is immutable and no two objects will ever share the same object
  /// identifier
  ///
  /// *    _/some/path_ - Identifies the object based on path
  ///
  /// *    _#SomeBatchReference_ - Identifies the object in a batch call
  final String selector;

  ObjectReference({
    this.selector,
  });
  static ObjectReference fromJson(Map<String, dynamic> json) =>
      ObjectReference();
}

/// Returns the path to the `ObjectIdentifiers` that is associated with the
/// directory.
class PathToObjectIdentifiers {
  /// The path that is used to identify the object starting from directory root.
  final String path;

  /// Lists `ObjectIdentifiers` starting from directory root to the object in
  /// the request.
  final List<String> objectIdentifiers;

  PathToObjectIdentifiers({
    this.path,
    this.objectIdentifiers,
  });
  static PathToObjectIdentifiers fromJson(Map<String, dynamic> json) =>
      PathToObjectIdentifiers();
}

/// Contains the `PolicyType`, `PolicyId`, and the `ObjectIdentifier` to which
/// it is attached. For more information, see
/// [Policies](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cd_key_concepts.html#policies).
class PolicyAttachment {
  /// The ID of `PolicyAttachment`.
  final String policyId;

  /// The `ObjectIdentifier` that is associated with `PolicyAttachment`.
  final String objectIdentifier;

  /// The type of policy that can be associated with `PolicyAttachment`.
  final String policyType;

  PolicyAttachment({
    this.policyId,
    this.objectIdentifier,
    this.policyType,
  });
  static PolicyAttachment fromJson(Map<String, dynamic> json) =>
      PolicyAttachment();
}

/// Used when a regular object exists in a Directory and you want to find all of
/// the policies that are associated with that object and the parent to that
/// object.
class PolicyToPath {
  /// The path that is referenced from the root.
  final String path;

  /// List of policy objects.
  final List<PolicyAttachment> policies;

  PolicyToPath({
    this.path,
    this.policies,
  });
  static PolicyToPath fromJson(Map<String, dynamic> json) => PolicyToPath();
}

class PublishSchemaResponse {
  /// The ARN that is associated with the published schema. For more
  /// information, see arns.
  final String publishedSchemaArn;

  PublishSchemaResponse({
    this.publishedSchemaArn,
  });
  static PublishSchemaResponse fromJson(Map<String, dynamic> json) =>
      PublishSchemaResponse();
}

class PutSchemaFromJsonResponse {
  /// The ARN of the schema to update.
  final String arn;

  PutSchemaFromJsonResponse({
    this.arn,
  });
  static PutSchemaFromJsonResponse fromJson(Map<String, dynamic> json) =>
      PutSchemaFromJsonResponse();
}

class RemoveFacetFromObjectResponse {
  RemoveFacetFromObjectResponse();
  static RemoveFacetFromObjectResponse fromJson(Map<String, dynamic> json) =>
      RemoveFacetFromObjectResponse();
}

/// Contains an Amazon Resource Name (ARN) and parameters that are associated
/// with the rule.
class Rule {
  /// The type of attribute validation rule.
  final String type;

  /// The minimum and maximum parameters that are associated with the rule.
  final Map<String, String> parameters;

  Rule({
    this.type,
    this.parameters,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule();
}

/// A facet.
class SchemaFacet {
  /// The ARN of the schema that contains the facet with no minor component. See
  /// arns and
  /// [In-Place Schema Upgrade](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/inplaceschemaupgrade.html)
  /// for a description of when to provide minor versions.
  final String schemaArn;

  /// The name of the facet.
  final String facetName;

  SchemaFacet({
    this.schemaArn,
    this.facetName,
  });
  static SchemaFacet fromJson(Map<String, dynamic> json) => SchemaFacet();
}

/// The tag structure that contains a tag key and value.
class Tag {
  /// The key that is associated with the tag.
  final String key;

  /// The value that is associated with the tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Represents the data for a typed attribute. You can set one, and only one, of
/// the elements. Each attribute in an item is a name-value pair. Attributes
/// have a single value.
class TypedAttributeValue {
  /// A string data value.
  final String stringValue;

  /// A binary data value.
  final Uint8List binaryValue;

  /// A Boolean data value.
  final bool booleanValue;

  /// A number data value.
  final String numberValue;

  /// A date and time value.
  final DateTime datetimeValue;

  TypedAttributeValue({
    this.stringValue,
    this.binaryValue,
    this.booleanValue,
    this.numberValue,
    this.datetimeValue,
  });
  static TypedAttributeValue fromJson(Map<String, dynamic> json) =>
      TypedAttributeValue();
}

/// A range of attribute values. For more information, see
/// [Range Filters](http://docs.aws.amazon.com/directoryservice/latest/admin-guide/objectsandlinks.html#rangefilters).
class TypedAttributeValueRange {
  /// The inclusive or exclusive range start.
  final String startMode;

  /// The value to start the range at.
  final TypedAttributeValue startValue;

  /// The inclusive or exclusive range end.
  final String endMode;

  /// The attribute value to terminate the range at.
  final TypedAttributeValue endValue;

  TypedAttributeValueRange({
    @required this.startMode,
    this.startValue,
    @required this.endMode,
    this.endValue,
  });
}

/// A typed link attribute definition.
class TypedLinkAttributeDefinition {
  /// The unique name of the typed link attribute.
  final String name;

  /// The type of the attribute.
  final String type;

  /// The default value of the attribute (if configured).
  final TypedAttributeValue defaultValue;

  /// Whether the attribute is mutable or not.
  final bool isImmutable;

  /// Validation rules that are attached to the attribute definition.
  final Map<String, Rule> rules;

  /// The required behavior of the `TypedLinkAttributeDefinition`.
  final String requiredBehavior;

  TypedLinkAttributeDefinition({
    @required this.name,
    @required this.type,
    this.defaultValue,
    this.isImmutable,
    this.rules,
    @required this.requiredBehavior,
  });
  static TypedLinkAttributeDefinition fromJson(Map<String, dynamic> json) =>
      TypedLinkAttributeDefinition();
}

/// Identifies the range of attributes that are used by a specified filter.
class TypedLinkAttributeRange {
  /// The unique name of the typed link attribute.
  final String attributeName;

  /// The range of attribute values that are being selected.
  final TypedAttributeValueRange range;

  TypedLinkAttributeRange({
    this.attributeName,
    @required this.range,
  });
}

/// Defines the typed links structure and its attributes. To create a typed link
/// facet, use the CreateTypedLinkFacet API.
class TypedLinkFacet {
  /// The unique name of the typed link facet.
  final String name;

  /// A set of key-value pairs associated with the typed link. Typed link
  /// attributes are used when you have data values that are related to the link
  /// itself, and not to one of the two objects being linked. Identity
  /// attributes also serve to distinguish the link from others of the same type
  /// between the same objects.
  final List<TypedLinkAttributeDefinition> attributes;

  /// The set of attributes that distinguish links made from this facet from
  /// each other, in the order of significance. Listing typed links can filter
  /// on the values of these attributes. See ListOutgoingTypedLinks and
  /// ListIncomingTypedLinks for details.
  final List<String> identityAttributeOrder;

  TypedLinkFacet({
    @required this.name,
    @required this.attributes,
    @required this.identityAttributeOrder,
  });
}

/// A typed link facet attribute update.
class TypedLinkFacetAttributeUpdate {
  /// The attribute to update.
  final TypedLinkAttributeDefinition attribute;

  /// The action to perform when updating the attribute.
  final String action;

  TypedLinkFacetAttributeUpdate({
    @required this.attribute,
    @required this.action,
  });
}

/// Identifies the schema Amazon Resource Name (ARN) and facet name for the
/// typed link.
class TypedLinkSchemaAndFacetName {
  /// The Amazon Resource Name (ARN) that is associated with the schema. For
  /// more information, see arns.
  final String schemaArn;

  /// The unique name of the typed link facet.
  final String typedLinkName;

  TypedLinkSchemaAndFacetName({
    @required this.schemaArn,
    @required this.typedLinkName,
  });
  static TypedLinkSchemaAndFacetName fromJson(Map<String, dynamic> json) =>
      TypedLinkSchemaAndFacetName();
}

/// Contains all the information that is used to uniquely identify a typed link.
/// The parameters discussed in this topic are used to uniquely specify the
/// typed link being operated on. The AttachTypedLink API returns a typed link
/// specifier while the DetachTypedLink API accepts one as input. Similarly, the
/// ListIncomingTypedLinks and ListOutgoingTypedLinks API operations provide
/// typed link specifiers as output. You can also construct a typed link
/// specifier from scratch.
class TypedLinkSpecifier {
  /// Identifies the typed link facet that is associated with the typed link.
  final TypedLinkSchemaAndFacetName typedLinkFacet;

  /// Identifies the source object that the typed link will attach to.
  final ObjectReference sourceObjectReference;

  /// Identifies the target object that the typed link will attach to.
  final ObjectReference targetObjectReference;

  /// Identifies the attribute value to update.
  final List<AttributeNameAndValue> identityAttributeValues;

  TypedLinkSpecifier({
    @required this.typedLinkFacet,
    @required this.sourceObjectReference,
    @required this.targetObjectReference,
    @required this.identityAttributeValues,
  });
  static TypedLinkSpecifier fromJson(Map<String, dynamic> json) =>
      TypedLinkSpecifier();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateFacetResponse {
  UpdateFacetResponse();
  static UpdateFacetResponse fromJson(Map<String, dynamic> json) =>
      UpdateFacetResponse();
}

class UpdateLinkAttributesResponse {
  UpdateLinkAttributesResponse();
  static UpdateLinkAttributesResponse fromJson(Map<String, dynamic> json) =>
      UpdateLinkAttributesResponse();
}

class UpdateObjectAttributesResponse {
  /// The `ObjectIdentifier` of the updated object.
  final String objectIdentifier;

  UpdateObjectAttributesResponse({
    this.objectIdentifier,
  });
  static UpdateObjectAttributesResponse fromJson(Map<String, dynamic> json) =>
      UpdateObjectAttributesResponse();
}

class UpdateSchemaResponse {
  /// The ARN that is associated with the updated schema. For more information,
  /// see arns.
  final String schemaArn;

  UpdateSchemaResponse({
    this.schemaArn,
  });
  static UpdateSchemaResponse fromJson(Map<String, dynamic> json) =>
      UpdateSchemaResponse();
}

class UpdateTypedLinkFacetResponse {
  UpdateTypedLinkFacetResponse();
  static UpdateTypedLinkFacetResponse fromJson(Map<String, dynamic> json) =>
      UpdateTypedLinkFacetResponse();
}

class UpgradeAppliedSchemaResponse {
  /// The ARN of the upgraded schema that is returned as part of the response.
  final String upgradedSchemaArn;

  /// The ARN of the directory that is returned as part of the response.
  final String directoryArn;

  UpgradeAppliedSchemaResponse({
    this.upgradedSchemaArn,
    this.directoryArn,
  });
  static UpgradeAppliedSchemaResponse fromJson(Map<String, dynamic> json) =>
      UpgradeAppliedSchemaResponse();
}

class UpgradePublishedSchemaResponse {
  /// The ARN of the upgraded schema that is returned as part of the response.
  final String upgradedSchemaArn;

  UpgradePublishedSchemaResponse({
    this.upgradedSchemaArn,
  });
  static UpgradePublishedSchemaResponse fromJson(Map<String, dynamic> json) =>
      UpgradePublishedSchemaResponse();
}
