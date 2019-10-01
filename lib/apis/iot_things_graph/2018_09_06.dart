import 'package:meta/meta.dart';

/// AWS IoT Things Graph
///
/// AWS IoT Things Graph provides an integrated set of tools that enable
/// developers to connect devices and services that use different standards,
/// such as units of measure and communication protocols. AWS IoT Things Graph
/// makes it possible to build IoT applications with little to no code by
/// connecting devices and services and defining how they interact at an
/// abstract level.
///
/// For more information about how AWS IoT Things Graph works, see the [User
/// Guide](https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-whatis.html).
class IotThingsGraphApi {
  /// Associates a device with a concrete thing that is in the user's registry.
  ///
  /// A thing can be associated with only one device at a time. If you associate
  /// a thing with a new device id, its previous association will be removed.
  ///
  /// [thingName]: The name of the thing to which the entity is to be
  /// associated.
  ///
  /// [entityId]: The ID of the device to be associated with the thing.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME`
  ///
  /// [namespaceVersion]: The version of the user's namespace. Defaults to the
  /// latest version of the user's namespace.
  Future<AssociateEntityToThingResponse> associateEntityToThing(
      {@required String thingName,
      @required String entityId,
      BigInt namespaceVersion}) async {
    return AssociateEntityToThingResponse.fromJson({});
  }

  /// Creates a workflow template. Workflows can be created only in the user's
  /// namespace. (The public namespace contains only entities.) The workflow can
  /// contain only entities in the specified namespace. The workflow is
  /// validated against the entities in the latest version of the user's
  /// namespace unless another namespace version is specified in the request.
  ///
  /// [definition]: The workflow `DefinitionDocument`.
  ///
  /// [compatibleNamespaceVersion]: The namespace version in which the workflow
  /// is to be created.
  ///
  /// If no value is specified, the latest version is used by default.
  Future<CreateFlowTemplateResponse> createFlowTemplate(
      DefinitionDocument definition,
      {BigInt compatibleNamespaceVersion}) async {
    return CreateFlowTemplateResponse.fromJson({});
  }

  /// Creates a system instance.
  ///
  /// This action validates the system instance, prepares the deployment-related
  /// resources. For Greengrass deployments, it updates the Greengrass group
  /// that is specified by the `greengrassGroupName` parameter. It also adds a
  /// file to the S3 bucket specified by the `s3BucketName` parameter. You need
  /// to call `DeploySystemInstance` after running this action.
  ///
  /// For Greengrass deployments, since this action modifies and adds resources
  /// to a Greengrass group and an S3 bucket on the caller's behalf, the calling
  /// identity must have write permissions to both the specified Greengrass
  /// group and S3 bucket. Otherwise, the call will fail with an authorization
  /// error.
  ///
  /// For cloud deployments, this action requires a `flowActionsRoleArn` value.
  /// This is an IAM role that has permissions to access AWS services, such as
  /// AWS Lambda and AWS IoT, that the flow uses when it executes.
  ///
  /// If the definition document doesn't specify a version of the user's
  /// namespace, the latest version will be used by default.
  ///
  /// [tags]: Metadata, consisting of key-value pairs, that can be used to
  /// categorize your system instances.
  ///
  /// [target]: The target type of the deployment. Valid values are `GREENGRASS`
  /// and `CLOUD`.
  ///
  /// [greengrassGroupName]: The name of the Greengrass group where the system
  /// instance will be deployed. This value is required if the value of the
  /// `target` parameter is `GREENGRASS`.
  ///
  /// [s3BucketName]: The name of the Amazon Simple Storage Service bucket that
  /// will be used to store and deploy the system instance's resource file. This
  /// value is required if the value of the `target` parameter is `GREENGRASS`.
  ///
  /// [flowActionsRoleArn]: The ARN of the IAM role that AWS IoT Things Graph
  /// will assume when it executes the flow. This role must have read and write
  /// access to AWS Lambda and AWS IoT and any other AWS services that the flow
  /// uses when it executes. This value is required if the value of the `target`
  /// parameter is `CLOUD`.
  Future<CreateSystemInstanceResponse> createSystemInstance(
      {List<Tag> tags,
      @required DefinitionDocument definition,
      @required String target,
      String greengrassGroupName,
      String s3BucketName,
      MetricsConfiguration metricsConfiguration,
      String flowActionsRoleArn}) async {
    return CreateSystemInstanceResponse.fromJson({});
  }

  /// Creates a system. The system is validated against the entities in the
  /// latest version of the user's namespace unless another namespace version is
  /// specified in the request.
  ///
  /// [definition]: The `DefinitionDocument` used to create the system.
  ///
  /// [compatibleNamespaceVersion]: The namespace version in which the system is
  /// to be created.
  ///
  /// If no value is specified, the latest version is used by default.
  Future<CreateSystemTemplateResponse> createSystemTemplate(
      DefinitionDocument definition,
      {BigInt compatibleNamespaceVersion}) async {
    return CreateSystemTemplateResponse.fromJson({});
  }

  /// Deletes a workflow. Any new system or deployment that contains this
  /// workflow will fail to update or deploy. Existing deployments that contain
  /// the workflow will continue to run (since they use a snapshot of the
  /// workflow taken at the time of deployment).
  ///
  /// [id]: The ID of the workflow to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME`
  Future<DeleteFlowTemplateResponse> deleteFlowTemplate(String id) async {
    return DeleteFlowTemplateResponse.fromJson({});
  }

  /// Deletes the specified namespace. This action deletes all of the entities
  /// in the namespace. Delete the systems and flows that use entities in the
  /// namespace before performing this action.
  Future<DeleteNamespaceResponse> deleteNamespace() async {
    return DeleteNamespaceResponse.fromJson({});
  }

  /// Deletes a system instance. Only system instances that have never been
  /// deployed, or that have been undeployed can be deleted.
  ///
  /// Users can create a new system instance that has the same ID as a deleted
  /// system instance.
  ///
  /// [id]: The ID of the system instance to be deleted.
  Future<DeleteSystemInstanceResponse> deleteSystemInstance({String id}) async {
    return DeleteSystemInstanceResponse.fromJson({});
  }

  /// Deletes a system. New deployments can't contain the system after its
  /// deletion. Existing deployments that contain the system will continue to
  /// work because they use a snapshot of the system that is taken when it is
  /// deployed.
  ///
  /// [id]: The ID of the system to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME`
  Future<DeleteSystemTemplateResponse> deleteSystemTemplate(String id) async {
    return DeleteSystemTemplateResponse.fromJson({});
  }

  ///  **Greengrass and Cloud Deployments**
  ///
  /// Deploys the system instance to the target specified in
  /// `CreateSystemInstance`.
  ///
  ///  **Greengrass Deployments**
  ///
  /// If the system or any workflows and entities have been updated before this
  /// action is called, then the deployment will create a new Amazon Simple
  /// Storage Service resource file and then deploy it.
  ///
  /// Since this action creates a Greengrass deployment on the caller's behalf,
  /// the calling identity must have write permissions to the specified
  /// Greengrass group. Otherwise, the call will fail with an authorization
  /// error.
  ///
  /// For information about the artifacts that get added to your Greengrass core
  /// device when you use this API, see [AWS IoT Things Graph and AWS IoT
  /// Greengrass](https://docs.aws.amazon.com/thingsgraph/latest/ug/iot-tg-greengrass.html).
  ///
  /// [id]: The ID of the system instance. This value is returned by the
  /// `CreateSystemInstance` action.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME`
  Future<DeploySystemInstanceResponse> deploySystemInstance({String id}) async {
    return DeploySystemInstanceResponse.fromJson({});
  }

  /// Deprecates the specified workflow. This action marks the workflow for
  /// deletion. Deprecated flows can't be deployed, but existing deployments
  /// will continue to run.
  ///
  /// [id]: The ID of the workflow to be deleted.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME`
  Future<DeprecateFlowTemplateResponse> deprecateFlowTemplate(String id) async {
    return DeprecateFlowTemplateResponse.fromJson({});
  }

  /// Deprecates the specified system.
  ///
  /// [id]: The ID of the system to delete.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME`
  Future<DeprecateSystemTemplateResponse> deprecateSystemTemplate(
      String id) async {
    return DeprecateSystemTemplateResponse.fromJson({});
  }

  /// Gets the latest version of the user's namespace and the public version
  /// that it is tracking.
  ///
  /// [namespaceName]: The name of the user's namespace. Set this to `aws` to
  /// get the public namespace.
  Future<DescribeNamespaceResponse> describeNamespace(
      {String namespaceName}) async {
    return DescribeNamespaceResponse.fromJson({});
  }

  /// Dissociates a device entity from a concrete thing. The action takes only
  /// the type of the entity that you need to dissociate because only one entity
  /// of a particular type can be associated with a thing.
  ///
  /// [thingName]: The name of the thing to disassociate.
  ///
  /// [entityType]: The entity type from which to disassociate the thing.
  Future<DissociateEntityFromThingResponse> dissociateEntityFromThing(
      {@required String thingName, @required String entityType}) async {
    return DissociateEntityFromThingResponse.fromJson({});
  }

  /// Gets definitions of the specified entities. Uses the latest version of the
  /// user's namespace by default. This API returns the following TDM entities.
  ///
  /// *   Properties
  ///
  /// *   States
  ///
  /// *   Events
  ///
  /// *   Actions
  ///
  /// *   Capabilities
  ///
  /// *   Mappings
  ///
  /// *   Devices
  ///
  /// *   Device Models
  ///
  /// *   Services
  ///
  ///
  /// This action doesn't return definitions for systems, flows, and
  /// deployments.
  ///
  /// [ids]: An array of entity IDs.
  ///
  /// The IDs should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME`
  ///
  /// [namespaceVersion]: The version of the user's namespace. Defaults to the
  /// latest version of the user's namespace.
  Future<GetEntitiesResponse> getEntities(List<String> ids,
      {BigInt namespaceVersion}) async {
    return GetEntitiesResponse.fromJson({});
  }

  /// Gets the latest version of the `DefinitionDocument` and
  /// `FlowTemplateSummary` for the specified workflow.
  ///
  /// [id]: The ID of the workflow.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME`
  ///
  /// [revisionNumber]: The number of the workflow revision to retrieve.
  Future<GetFlowTemplateResponse> getFlowTemplate(String id,
      {BigInt revisionNumber}) async {
    return GetFlowTemplateResponse.fromJson({});
  }

  /// Gets revisions of the specified workflow. Only the last 100 revisions are
  /// stored. If the workflow has been deprecated, this action will return
  /// revisions that occurred before the deprecation. This action won't work for
  /// workflows that have been deleted.
  ///
  /// [id]: The ID of the workflow.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME`
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<GetFlowTemplateRevisionsResponse> getFlowTemplateRevisions(String id,
      {String nextToken, int maxResults}) async {
    return GetFlowTemplateRevisionsResponse.fromJson({});
  }

  /// Gets the status of a namespace deletion task.
  Future<GetNamespaceDeletionStatusResponse>
      getNamespaceDeletionStatus() async {
    return GetNamespaceDeletionStatusResponse.fromJson({});
  }

  /// Gets a system instance.
  ///
  /// [id]: The ID of the system deployment instance. This value is returned by
  /// `CreateSystemInstance`.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:deployment:DEPLOYMENTNAME`
  Future<GetSystemInstanceResponse> getSystemInstance(String id) async {
    return GetSystemInstanceResponse.fromJson({});
  }

  /// Gets a system.
  ///
  /// [id]: The ID of the system to get. This ID must be in the user's
  /// namespace.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME`
  ///
  /// [revisionNumber]: The number that specifies the revision of the system to
  /// get.
  Future<GetSystemTemplateResponse> getSystemTemplate(String id,
      {BigInt revisionNumber}) async {
    return GetSystemTemplateResponse.fromJson({});
  }

  /// Gets revisions made to the specified system template. Only the previous
  /// 100 revisions are stored. If the system has been deprecated, this action
  /// will return the revisions that occurred before its deprecation. This
  /// action won't work with systems that have been deleted.
  ///
  /// [id]: The ID of the system template.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME`
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<GetSystemTemplateRevisionsResponse> getSystemTemplateRevisions(
      String id,
      {String nextToken,
      int maxResults}) async {
    return GetSystemTemplateRevisionsResponse.fromJson({});
  }

  /// Gets the status of the specified upload.
  ///
  /// [uploadId]: The ID of the upload. This value is returned by the
  /// `UploadEntityDefinitions` action.
  Future<GetUploadStatusResponse> getUploadStatus(String uploadId) async {
    return GetUploadStatusResponse.fromJson({});
  }

  /// Returns a list of objects that contain information about events in a flow
  /// execution.
  ///
  /// [flowExecutionId]: The ID of the flow execution.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<ListFlowExecutionMessagesResponse> listFlowExecutionMessages(
      String flowExecutionId,
      {String nextToken,
      int maxResults}) async {
    return ListFlowExecutionMessagesResponse.fromJson({});
  }

  /// Lists all tags on an AWS IoT Things Graph resource.
  ///
  /// [maxResults]: The maximum number of tags to return.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// are to be returned.
  ///
  /// [nextToken]: The token that specifies the next page of results to return.
  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Searches for entities of the specified type. You can search for entities
  /// in your namespace and the public namespace that you're tracking.
  ///
  /// [entityTypes]: The entity types for which to search.
  ///
  /// [filters]: Optional filter to apply to the search. Valid filters are
  /// `NAME` `NAMESPACE`, `SEMANTIC\_TYPE\_PATH` and `REFERENCED\_ENTITY\_ID`.
  /// `REFERENCED\_ENTITY\_ID` filters on entities that are used by the entity
  /// in the result set. For example, you can filter on the ID of a property
  /// that is used in a state.
  ///
  /// Multiple filters function as OR criteria in the query. Multiple values
  /// passed inside the filter function as AND criteria.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  ///
  /// [namespaceVersion]: The version of the user's namespace. Defaults to the
  /// latest version of the user's namespace.
  Future<SearchEntitiesResponse> searchEntities(List<String> entityTypes,
      {List<EntityFilter> filters,
      String nextToken,
      int maxResults,
      BigInt namespaceVersion}) async {
    return SearchEntitiesResponse.fromJson({});
  }

  /// Searches for AWS IoT Things Graph workflow execution instances.
  ///
  /// [systemInstanceId]: The ID of the system instance that contains the flow.
  ///
  /// [flowExecutionId]: The ID of a flow execution.
  ///
  /// [startTime]: The date and time of the earliest flow execution to return.
  ///
  /// [endTime]: The date and time of the latest flow execution to return.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<SearchFlowExecutionsResponse> searchFlowExecutions(
      String systemInstanceId,
      {String flowExecutionId,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxResults}) async {
    return SearchFlowExecutionsResponse.fromJson({});
  }

  /// Searches for summary information about workflows.
  ///
  /// [filters]: An array of objects that limit the result set. The only valid
  /// filter is `DEVICE\_MODEL\_ID`.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<SearchFlowTemplatesResponse> searchFlowTemplates(
      {List<FlowTemplateFilter> filters,
      String nextToken,
      int maxResults}) async {
    return SearchFlowTemplatesResponse.fromJson({});
  }

  /// Searches for system instances in the user's account.
  ///
  /// [filters]: Optional filter to apply to the search. Valid filters are
  /// `SYSTEM\_TEMPLATE\_ID`, `STATUS`, and `GREENGRASS\_GROUP\_NAME`.
  ///
  /// Multiple filters function as OR criteria in the query. Multiple values
  /// passed inside the filter function as AND criteria.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<SearchSystemInstancesResponse> searchSystemInstances(
      {List<SystemInstanceFilter> filters,
      String nextToken,
      int maxResults}) async {
    return SearchSystemInstancesResponse.fromJson({});
  }

  /// Searches for summary information about systems in the user's account. You
  /// can filter by the ID of a workflow to return only systems that use the
  /// specified workflow.
  ///
  /// [filters]: An array of filters that limit the result set. The only valid
  /// filter is `FLOW\_TEMPLATE\_ID`.
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<SearchSystemTemplatesResponse> searchSystemTemplates(
      {List<SystemTemplateFilter> filters,
      String nextToken,
      int maxResults}) async {
    return SearchSystemTemplatesResponse.fromJson({});
  }

  /// Searches for things associated with the specified entity. You can search
  /// by both device and device model.
  ///
  /// For example, if two different devices, camera1 and camera2, implement the
  /// camera device model, the user can associate thing1 to camera1 and thing2
  /// to camera2. `SearchThings(camera2)` will return only thing2, but
  /// `SearchThings(camera)` will return both thing1 and thing2.
  ///
  /// This action searches for exact matches and doesn't perform partial text
  /// matching.
  ///
  /// [entityId]: The ID of the entity to which the things are associated.
  ///
  /// The IDs should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:device:DEVICENAME`
  ///
  /// [nextToken]: The string that specifies the next page of results. Use this
  /// when you're paginating results.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  ///
  /// [namespaceVersion]: The version of the user's namespace. Defaults to the
  /// latest version of the user's namespace.
  Future<SearchThingsResponse> searchThings(String entityId,
      {String nextToken, int maxResults, BigInt namespaceVersion}) async {
    return SearchThingsResponse.fromJson({});
  }

  /// Creates a tag for the specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// are returned.
  ///
  /// [tags]: A list of tags to add to the resource.>
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes a system instance from its target (Cloud or Greengrass).
  ///
  /// [id]: The ID of the system instance to remove from its target.
  Future<UndeploySystemInstanceResponse> undeploySystemInstance(
      {String id}) async {
    return UndeploySystemInstanceResponse.fromJson({});
  }

  /// Removes a tag from the specified resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// are to be removed.
  ///
  /// [tagKeys]: A list of tag key names to remove from the resource. You don't
  /// specify the value. Both the key and its associated value are removed.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see [Using JSON for
  /// Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates the specified workflow. All deployed systems and system instances
  /// that use the workflow will see the changes in the flow when it is
  /// redeployed. If you don't want this behavior, copy the workflow (creating a
  /// new workflow with a different ID), and update the copy. The workflow can
  /// contain only entities in the specified namespace.
  ///
  /// [id]: The ID of the workflow to be updated.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:workflow:WORKFLOWNAME`
  ///
  /// [definition]: The `DefinitionDocument` that contains the updated workflow
  /// definition.
  ///
  /// [compatibleNamespaceVersion]: The version of the user's namespace.
  ///
  /// If no value is specified, the latest version is used by default. Use the
  /// `GetFlowTemplateRevisions` if you want to find earlier revisions of the
  /// flow to update.
  Future<UpdateFlowTemplateResponse> updateFlowTemplate(
      {@required String id,
      @required DefinitionDocument definition,
      BigInt compatibleNamespaceVersion}) async {
    return UpdateFlowTemplateResponse.fromJson({});
  }

  /// Updates the specified system. You don't need to run this action after
  /// updating a workflow. Any deployment that uses the system will see the
  /// changes in the system when it is redeployed.
  ///
  /// [id]: The ID of the system to be updated.
  ///
  /// The ID should be in the following format.
  ///
  ///  `urn:tdm:REGION/ACCOUNT ID/default:system:SYSTEMNAME`
  ///
  /// [definition]: The `DefinitionDocument` that contains the updated system
  /// definition.
  ///
  /// [compatibleNamespaceVersion]: The version of the user's namespace.
  /// Defaults to the latest version of the user's namespace.
  ///
  /// If no value is specified, the latest version is used by default.
  Future<UpdateSystemTemplateResponse> updateSystemTemplate(
      {@required String id,
      @required DefinitionDocument definition,
      BigInt compatibleNamespaceVersion}) async {
    return UpdateSystemTemplateResponse.fromJson({});
  }

  /// Asynchronously uploads one or more entity definitions to the user's
  /// namespace. The `document` parameter is required if
  /// `syncWithPublicNamespace` and `deleteExistingEntites` are false. If the
  /// `syncWithPublicNamespace` parameter is set to `true`, the user's namespace
  /// will synchronize with the latest version of the public namespace. If
  /// `deprecateExistingEntities` is set to true, all entities in the latest
  /// version will be deleted before the new `DefinitionDocument` is uploaded.
  ///
  /// When a user uploads entity definitions for the first time, the service
  /// creates a new namespace for the user. The new namespace tracks the public
  /// namespace. Currently users can have only one namespace. The namespace
  /// version increments whenever a user uploads entity definitions that are
  /// backwards-incompatible and whenever a user sets the
  /// `syncWithPublicNamespace` parameter or the `deprecateExistingEntities`
  /// parameter to `true`.
  ///
  /// The IDs for all of the entities should be in URN format. Each entity must
  /// be in the user's namespace. Users can't create entities in the public
  /// namespace, but entity definitions can refer to entities in the public
  /// namespace.
  ///
  /// Valid entities are `Device`, `DeviceModel`, `Service`, `Capability`,
  /// `State`, `Action`, `Event`, `Property`, `Mapping`, `Enum`.
  ///
  /// [document]: The `DefinitionDocument` that defines the updated entities.
  ///
  /// [syncWithPublicNamespace]: A Boolean that specifies whether to synchronize
  /// with the latest version of the public namespace. If set to `true`, the
  /// upload will create a new namespace version.
  ///
  /// [deprecateExistingEntities]: A Boolean that specifies whether to deprecate
  /// all entities in the latest version before uploading the new
  /// `DefinitionDocument`. If set to `true`, the upload will create a new
  /// namespace version.
  Future<UploadEntityDefinitionsResponse> uploadEntityDefinitions(
      {DefinitionDocument document,
      bool syncWithPublicNamespace,
      bool deprecateExistingEntities}) async {
    return UploadEntityDefinitionsResponse.fromJson({});
  }
}

class AssociateEntityToThingResponse {
  AssociateEntityToThingResponse();
  static AssociateEntityToThingResponse fromJson(Map<String, dynamic> json) =>
      AssociateEntityToThingResponse();
}

class CreateFlowTemplateResponse {
  /// The summary object that describes the created workflow.
  final FlowTemplateSummary summary;

  CreateFlowTemplateResponse({
    this.summary,
  });
  static CreateFlowTemplateResponse fromJson(Map<String, dynamic> json) =>
      CreateFlowTemplateResponse();
}

class CreateSystemInstanceResponse {
  /// The summary object that describes the new system instance.
  final SystemInstanceSummary summary;

  CreateSystemInstanceResponse({
    this.summary,
  });
  static CreateSystemInstanceResponse fromJson(Map<String, dynamic> json) =>
      CreateSystemInstanceResponse();
}

class CreateSystemTemplateResponse {
  /// The summary object that describes the created system.
  final SystemTemplateSummary summary;

  CreateSystemTemplateResponse({
    this.summary,
  });
  static CreateSystemTemplateResponse fromJson(Map<String, dynamic> json) =>
      CreateSystemTemplateResponse();
}

class DefinitionDocument {
  /// The language used to define the entity. `GRAPHQL` is the only valid value.
  final String language;

  /// The GraphQL text that defines the entity.
  final String text;

  DefinitionDocument({
    @required this.language,
    @required this.text,
  });
  static DefinitionDocument fromJson(Map<String, dynamic> json) =>
      DefinitionDocument();
}

class DeleteFlowTemplateResponse {
  DeleteFlowTemplateResponse();
  static DeleteFlowTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeleteFlowTemplateResponse();
}

class DeleteNamespaceResponse {
  /// The ARN of the namespace to be deleted.
  final String namespaceArn;

  /// The name of the namespace to be deleted.
  final String namespaceName;

  DeleteNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
  });
  static DeleteNamespaceResponse fromJson(Map<String, dynamic> json) =>
      DeleteNamespaceResponse();
}

class DeleteSystemInstanceResponse {
  DeleteSystemInstanceResponse();
  static DeleteSystemInstanceResponse fromJson(Map<String, dynamic> json) =>
      DeleteSystemInstanceResponse();
}

class DeleteSystemTemplateResponse {
  DeleteSystemTemplateResponse();
  static DeleteSystemTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeleteSystemTemplateResponse();
}

class DependencyRevision {
  /// The ID of the workflow or system.
  final String id;

  /// The revision number of the workflow or system.
  final BigInt revisionNumber;

  DependencyRevision({
    this.id,
    this.revisionNumber,
  });
  static DependencyRevision fromJson(Map<String, dynamic> json) =>
      DependencyRevision();
}

class DeploySystemInstanceResponse {
  /// An object that contains summary information about a system instance that
  /// was deployed.
  final SystemInstanceSummary summary;

  /// The ID of the Greengrass deployment used to deploy the system instance.
  final String greengrassDeploymentId;

  DeploySystemInstanceResponse({
    @required this.summary,
    this.greengrassDeploymentId,
  });
  static DeploySystemInstanceResponse fromJson(Map<String, dynamic> json) =>
      DeploySystemInstanceResponse();
}

class DeprecateFlowTemplateResponse {
  DeprecateFlowTemplateResponse();
  static DeprecateFlowTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeprecateFlowTemplateResponse();
}

class DeprecateSystemTemplateResponse {
  DeprecateSystemTemplateResponse();
  static DeprecateSystemTemplateResponse fromJson(Map<String, dynamic> json) =>
      DeprecateSystemTemplateResponse();
}

class DescribeNamespaceResponse {
  /// The ARN of the namespace.
  final String namespaceArn;

  /// The name of the namespace.
  final String namespaceName;

  /// The name of the public namespace that the latest namespace version is
  /// tracking.
  final String trackingNamespaceName;

  /// The version of the public namespace that the latest version is tracking.
  final BigInt trackingNamespaceVersion;

  /// The version of the user's namespace to describe.
  final BigInt namespaceVersion;

  DescribeNamespaceResponse({
    this.namespaceArn,
    this.namespaceName,
    this.trackingNamespaceName,
    this.trackingNamespaceVersion,
    this.namespaceVersion,
  });
  static DescribeNamespaceResponse fromJson(Map<String, dynamic> json) =>
      DescribeNamespaceResponse();
}

class DissociateEntityFromThingResponse {
  DissociateEntityFromThingResponse();
  static DissociateEntityFromThingResponse fromJson(
          Map<String, dynamic> json) =>
      DissociateEntityFromThingResponse();
}

class EntityDescription {
  /// The entity ID.
  final String id;

  /// The entity ARN.
  final String arn;

  /// The entity type.
  final String type;

  /// The time at which the entity was created.
  final DateTime createdAt;

  /// The definition document of the entity.
  final DefinitionDocument definition;

  EntityDescription({
    this.id,
    this.arn,
    this.type,
    this.createdAt,
    this.definition,
  });
  static EntityDescription fromJson(Map<String, dynamic> json) =>
      EntityDescription();
}

class EntityFilter {
  /// The name of the entity search filter field. `REFERENCED\_ENTITY\_ID`
  /// filters on entities that are used by the entity in the result set. For
  /// example, you can filter on the ID of a property that is used in a state.
  final String name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  EntityFilter({
    this.name,
    this.value,
  });
}

class FlowExecutionMessage {
  /// The unique identifier of the message.
  final String messageId;

  /// The type of flow event .
  final String eventType;

  /// The date and time when the message was last updated.
  final DateTime timestamp;

  /// A string containing information about the flow event.
  final String payload;

  FlowExecutionMessage({
    this.messageId,
    this.eventType,
    this.timestamp,
    this.payload,
  });
  static FlowExecutionMessage fromJson(Map<String, dynamic> json) =>
      FlowExecutionMessage();
}

class FlowExecutionSummary {
  /// The ID of the flow execution.
  final String flowExecutionId;

  /// The current status of the flow execution.
  final String status;

  /// The ID of the system instance that contains the flow.
  final String systemInstanceId;

  /// The ID of the flow.
  final String flowTemplateId;

  /// The date and time when the flow execution summary was created.
  final DateTime createdAt;

  /// The date and time when the flow execution summary was last updated.
  final DateTime updatedAt;

  FlowExecutionSummary({
    this.flowExecutionId,
    this.status,
    this.systemInstanceId,
    this.flowTemplateId,
    this.createdAt,
    this.updatedAt,
  });
  static FlowExecutionSummary fromJson(Map<String, dynamic> json) =>
      FlowExecutionSummary();
}

class FlowTemplateDescription {
  /// An object that contains summary information about a workflow.
  final FlowTemplateSummary summary;

  /// A workflow's definition document.
  final DefinitionDocument definition;

  /// The version of the user's namespace against which the workflow was
  /// validated. Use this value in your system instance.
  final BigInt validatedNamespaceVersion;

  FlowTemplateDescription({
    this.summary,
    this.definition,
    this.validatedNamespaceVersion,
  });
  static FlowTemplateDescription fromJson(Map<String, dynamic> json) =>
      FlowTemplateDescription();
}

class FlowTemplateFilter {
  /// The name of the search filter field.
  final String name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  FlowTemplateFilter({
    @required this.name,
    @required this.value,
  });
}

class FlowTemplateSummary {
  /// The ID of the workflow.
  final String id;

  /// The ARN of the workflow.
  final String arn;

  /// The revision number of the workflow.
  final BigInt revisionNumber;

  /// The date when the workflow was created.
  final DateTime createdAt;

  FlowTemplateSummary({
    this.id,
    this.arn,
    this.revisionNumber,
    this.createdAt,
  });
  static FlowTemplateSummary fromJson(Map<String, dynamic> json) =>
      FlowTemplateSummary();
}

class GetEntitiesResponse {
  /// An array of descriptions for the specified entities.
  final List<EntityDescription> descriptions;

  GetEntitiesResponse({
    this.descriptions,
  });
  static GetEntitiesResponse fromJson(Map<String, dynamic> json) =>
      GetEntitiesResponse();
}

class GetFlowTemplateResponse {
  /// The object that describes the specified workflow.
  final FlowTemplateDescription description;

  GetFlowTemplateResponse({
    this.description,
  });
  static GetFlowTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetFlowTemplateResponse();
}

class GetFlowTemplateRevisionsResponse {
  /// An array of objects that provide summary data about each revision.
  final List<FlowTemplateSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  GetFlowTemplateRevisionsResponse({
    this.summaries,
    this.nextToken,
  });
  static GetFlowTemplateRevisionsResponse fromJson(Map<String, dynamic> json) =>
      GetFlowTemplateRevisionsResponse();
}

class GetNamespaceDeletionStatusResponse {
  /// The ARN of the namespace that is being deleted.
  final String namespaceArn;

  /// The name of the namespace that is being deleted.
  final String namespaceName;

  /// The status of the deletion request.
  final String status;

  /// An error code returned by the namespace deletion task.
  final String errorCode;

  /// An error code returned by the namespace deletion task.
  final String errorMessage;

  GetNamespaceDeletionStatusResponse({
    this.namespaceArn,
    this.namespaceName,
    this.status,
    this.errorCode,
    this.errorMessage,
  });
  static GetNamespaceDeletionStatusResponse fromJson(
          Map<String, dynamic> json) =>
      GetNamespaceDeletionStatusResponse();
}

class GetSystemInstanceResponse {
  /// An object that describes the system instance.
  final SystemInstanceDescription description;

  GetSystemInstanceResponse({
    this.description,
  });
  static GetSystemInstanceResponse fromJson(Map<String, dynamic> json) =>
      GetSystemInstanceResponse();
}

class GetSystemTemplateResponse {
  /// An object that contains summary data about the system.
  final SystemTemplateDescription description;

  GetSystemTemplateResponse({
    this.description,
  });
  static GetSystemTemplateResponse fromJson(Map<String, dynamic> json) =>
      GetSystemTemplateResponse();
}

class GetSystemTemplateRevisionsResponse {
  /// An array of objects that contain summary data about the system template
  /// revisions.
  final List<SystemTemplateSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  GetSystemTemplateRevisionsResponse({
    this.summaries,
    this.nextToken,
  });
  static GetSystemTemplateRevisionsResponse fromJson(
          Map<String, dynamic> json) =>
      GetSystemTemplateRevisionsResponse();
}

class GetUploadStatusResponse {
  /// The ID of the upload.
  final String uploadId;

  /// The status of the upload. The initial status is `IN_PROGRESS`. The
  /// response show all validation failures if the upload fails.
  final String uploadStatus;

  /// The ARN of the upload.
  final String namespaceArn;

  /// The name of the upload's namespace.
  final String namespaceName;

  /// The version of the user's namespace. Defaults to the latest version of the
  /// user's namespace.
  final BigInt namespaceVersion;

  /// The reason for an upload failure.
  final List<String> failureReason;

  /// The date at which the upload was created.
  final DateTime createdDate;

  GetUploadStatusResponse({
    @required this.uploadId,
    @required this.uploadStatus,
    this.namespaceArn,
    this.namespaceName,
    this.namespaceVersion,
    this.failureReason,
    @required this.createdDate,
  });
  static GetUploadStatusResponse fromJson(Map<String, dynamic> json) =>
      GetUploadStatusResponse();
}

class ListFlowExecutionMessagesResponse {
  /// A list of objects that contain information about events in the specified
  /// flow execution.
  final List<FlowExecutionMessage> messages;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  ListFlowExecutionMessagesResponse({
    this.messages,
    this.nextToken,
  });
  static ListFlowExecutionMessagesResponse fromJson(
          Map<String, dynamic> json) =>
      ListFlowExecutionMessagesResponse();
}

class ListTagsForResourceResponse {
  /// List of tags returned by the `ListTagsForResource` operation.
  final List<Tag> tags;

  /// The token that specifies the next page of results to return.
  final String nextToken;

  ListTagsForResourceResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class MetricsConfiguration {
  /// A Boolean that specifies whether cloud metrics are collected.
  final bool cloudMetricEnabled;

  /// The ARN of the role that is used to collect cloud metrics.
  final String metricRuleRoleArn;

  MetricsConfiguration({
    this.cloudMetricEnabled,
    this.metricRuleRoleArn,
  });
  static MetricsConfiguration fromJson(Map<String, dynamic> json) =>
      MetricsConfiguration();
}

class SearchEntitiesResponse {
  /// An array of descriptions for each entity returned in the search result.
  final List<EntityDescription> descriptions;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchEntitiesResponse({
    this.descriptions,
    this.nextToken,
  });
  static SearchEntitiesResponse fromJson(Map<String, dynamic> json) =>
      SearchEntitiesResponse();
}

class SearchFlowExecutionsResponse {
  /// An array of objects that contain summary information about each workflow
  /// execution in the result set.
  final List<FlowExecutionSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchFlowExecutionsResponse({
    this.summaries,
    this.nextToken,
  });
  static SearchFlowExecutionsResponse fromJson(Map<String, dynamic> json) =>
      SearchFlowExecutionsResponse();
}

class SearchFlowTemplatesResponse {
  /// An array of objects that contain summary information about each workflow
  /// in the result set.
  final List<FlowTemplateSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchFlowTemplatesResponse({
    this.summaries,
    this.nextToken,
  });
  static SearchFlowTemplatesResponse fromJson(Map<String, dynamic> json) =>
      SearchFlowTemplatesResponse();
}

class SearchSystemInstancesResponse {
  /// An array of objects that contain summary data abour the system instances
  /// in the result set.
  final List<SystemInstanceSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchSystemInstancesResponse({
    this.summaries,
    this.nextToken,
  });
  static SearchSystemInstancesResponse fromJson(Map<String, dynamic> json) =>
      SearchSystemInstancesResponse();
}

class SearchSystemTemplatesResponse {
  /// An array of objects that contain summary information about each system
  /// deployment in the result set.
  final List<SystemTemplateSummary> summaries;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchSystemTemplatesResponse({
    this.summaries,
    this.nextToken,
  });
  static SearchSystemTemplatesResponse fromJson(Map<String, dynamic> json) =>
      SearchSystemTemplatesResponse();
}

class SearchThingsResponse {
  /// An array of things in the result set.
  final List<Thing> things;

  /// The string to specify as `nextToken` when you request the next page of
  /// results.
  final String nextToken;

  SearchThingsResponse({
    this.things,
    this.nextToken,
  });
  static SearchThingsResponse fromJson(Map<String, dynamic> json) =>
      SearchThingsResponse();
}

class SystemInstanceDescription {
  /// An object that contains summary information about a system instance.
  final SystemInstanceSummary summary;

  final DefinitionDocument definition;

  /// The Amazon Simple Storage Service bucket where information about a system
  /// instance is stored.
  final String s3BucketName;

  final MetricsConfiguration metricsConfiguration;

  /// The version of the user's namespace against which the system instance was
  /// validated.
  final BigInt validatedNamespaceVersion;

  /// A list of objects that contain all of the IDs and revision numbers of
  /// workflows and systems that are used in a system instance.
  final List<DependencyRevision> validatedDependencyRevisions;

  /// The AWS Identity and Access Management (IAM) role that AWS IoT Things
  /// Graph assumes during flow execution in a cloud deployment. This role must
  /// have read and write permissionss to AWS Lambda and AWS IoT and to any
  /// other AWS services that the flow uses.
  final String flowActionsRoleArn;

  SystemInstanceDescription({
    this.summary,
    this.definition,
    this.s3BucketName,
    this.metricsConfiguration,
    this.validatedNamespaceVersion,
    this.validatedDependencyRevisions,
    this.flowActionsRoleArn,
  });
  static SystemInstanceDescription fromJson(Map<String, dynamic> json) =>
      SystemInstanceDescription();
}

class SystemInstanceFilter {
  /// The name of the search filter field.
  final String name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  SystemInstanceFilter({
    this.name,
    this.value,
  });
}

class SystemInstanceSummary {
  /// The ID of the system instance.
  final String id;

  /// The ARN of the system instance.
  final String arn;

  /// The status of the system instance.
  final String status;

  /// The target of the system instance.
  final String target;

  /// The ID of the Greengrass group where the system instance is deployed.
  final String greengrassGroupName;

  /// The date when the system instance was created.
  final DateTime createdAt;

  ///  The date and time when the system instance was last updated.
  final DateTime updatedAt;

  /// The ID of the Greengrass group where the system instance is deployed.
  final String greengrassGroupId;

  /// The version of the Greengrass group where the system instance is deployed.
  final String greengrassGroupVersionId;

  SystemInstanceSummary({
    this.id,
    this.arn,
    this.status,
    this.target,
    this.greengrassGroupName,
    this.createdAt,
    this.updatedAt,
    this.greengrassGroupId,
    this.greengrassGroupVersionId,
  });
  static SystemInstanceSummary fromJson(Map<String, dynamic> json) =>
      SystemInstanceSummary();
}

class SystemTemplateDescription {
  /// An object that contains summary information about a system.
  final SystemTemplateSummary summary;

  /// The definition document of a system.
  final DefinitionDocument definition;

  /// The namespace version against which the system was validated. Use this
  /// value in your system instance.
  final BigInt validatedNamespaceVersion;

  SystemTemplateDescription({
    this.summary,
    this.definition,
    this.validatedNamespaceVersion,
  });
  static SystemTemplateDescription fromJson(Map<String, dynamic> json) =>
      SystemTemplateDescription();
}

class SystemTemplateFilter {
  /// The name of the system search filter field.
  final String name;

  /// An array of string values for the search filter field. Multiple values
  /// function as AND criteria in the search.
  final List<String> value;

  SystemTemplateFilter({
    @required this.name,
    @required this.value,
  });
}

class SystemTemplateSummary {
  /// The ID of the system.
  final String id;

  /// The ARN of the system.
  final String arn;

  /// The revision number of the system.
  final BigInt revisionNumber;

  /// The date when the system was created.
  final DateTime createdAt;

  SystemTemplateSummary({
    this.id,
    this.arn,
    this.revisionNumber,
    this.createdAt,
  });
  static SystemTemplateSummary fromJson(Map<String, dynamic> json) =>
      SystemTemplateSummary();
}

class Tag {
  /// The required name of the tag. The string value can be from 1 to 128
  /// Unicode characters in length.
  final String key;

  /// The optional value of the tag. The string value can be from 1 to 256
  /// Unicode characters in length.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class Thing {
  /// The ARN of the thing.
  final String thingArn;

  /// The name of the thing.
  final String thingName;

  Thing({
    this.thingArn,
    this.thingName,
  });
  static Thing fromJson(Map<String, dynamic> json) => Thing();
}

class UndeploySystemInstanceResponse {
  /// An object that contains summary information about the system instance that
  /// was removed from its target.
  final SystemInstanceSummary summary;

  UndeploySystemInstanceResponse({
    this.summary,
  });
  static UndeploySystemInstanceResponse fromJson(Map<String, dynamic> json) =>
      UndeploySystemInstanceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateFlowTemplateResponse {
  /// An object containing summary information about the updated workflow.
  final FlowTemplateSummary summary;

  UpdateFlowTemplateResponse({
    this.summary,
  });
  static UpdateFlowTemplateResponse fromJson(Map<String, dynamic> json) =>
      UpdateFlowTemplateResponse();
}

class UpdateSystemTemplateResponse {
  /// An object containing summary information about the updated system.
  final SystemTemplateSummary summary;

  UpdateSystemTemplateResponse({
    this.summary,
  });
  static UpdateSystemTemplateResponse fromJson(Map<String, dynamic> json) =>
      UpdateSystemTemplateResponse();
}

class UploadEntityDefinitionsResponse {
  /// The ID that specifies the upload action. You can use this to track the
  /// status of the upload.
  final String uploadId;

  UploadEntityDefinitionsResponse({
    @required this.uploadId,
  });
  static UploadEntityDefinitionsResponse fromJson(Map<String, dynamic> json) =>
      UploadEntityDefinitionsResponse();
}
