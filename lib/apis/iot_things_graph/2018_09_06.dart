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
  Future<void> associateEntityToThing(
      {@required String thingName,
      @required String entityId,
      BigInt namespaceVersion}) async {}

  /// Creates a workflow template. Workflows can be created only in the user's
  /// namespace. (The public namespace contains only entities.) The workflow can
  /// contain only entities in the specified namespace. The workflow is
  /// validated against the entities in the latest version of the user's
  /// namespace unless another namespace version is specified in the request.
  Future<void> createFlowTemplate(DefinitionDocument definition,
      {BigInt compatibleNamespaceVersion}) async {}

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
  Future<void> createSystemInstance(
      {List<Tag> tags,
      @required DefinitionDocument definition,
      @required String target,
      String greengrassGroupName,
      String s3BucketName,
      MetricsConfiguration metricsConfiguration,
      String flowActionsRoleArn}) async {}

  /// Creates a system. The system is validated against the entities in the
  /// latest version of the user's namespace unless another namespace version is
  /// specified in the request.
  Future<void> createSystemTemplate(DefinitionDocument definition,
      {BigInt compatibleNamespaceVersion}) async {}

  /// Deletes a workflow. Any new system or deployment that contains this
  /// workflow will fail to update or deploy. Existing deployments that contain
  /// the workflow will continue to run (since they use a snapshot of the
  /// workflow taken at the time of deployment).
  Future<void> deleteFlowTemplate(String id) async {}

  /// Deletes the specified namespace. This action deletes all of the entities
  /// in the namespace. Delete the systems and flows that use entities in the
  /// namespace before performing this action.
  Future<void> deleteNamespace() async {}

  /// Deletes a system instance. Only system instances that have never been
  /// deployed, or that have been undeployed can be deleted.
  ///
  /// Users can create a new system instance that has the same ID as a deleted
  /// system instance.
  Future<void> deleteSystemInstance({String id}) async {}

  /// Deletes a system. New deployments can't contain the system after its
  /// deletion. Existing deployments that contain the system will continue to
  /// work because they use a snapshot of the system that is taken when it is
  /// deployed.
  Future<void> deleteSystemTemplate(String id) async {}

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
  Future<void> deploySystemInstance({String id}) async {}

  /// Deprecates the specified workflow. This action marks the workflow for
  /// deletion. Deprecated flows can't be deployed, but existing deployments
  /// will continue to run.
  Future<void> deprecateFlowTemplate(String id) async {}

  /// Deprecates the specified system.
  Future<void> deprecateSystemTemplate(String id) async {}

  /// Gets the latest version of the user's namespace and the public version
  /// that it is tracking.
  Future<void> describeNamespace({String namespaceName}) async {}

  /// Dissociates a device entity from a concrete thing. The action takes only
  /// the type of the entity that you need to dissociate because only one entity
  /// of a particular type can be associated with a thing.
  Future<void> dissociateEntityFromThing(
      {@required String thingName, @required String entityType}) async {}

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
  Future<void> getEntities(List<String> ids, {BigInt namespaceVersion}) async {}

  /// Gets the latest version of the `DefinitionDocument` and
  /// `FlowTemplateSummary` for the specified workflow.
  Future<void> getFlowTemplate(String id, {BigInt revisionNumber}) async {}

  /// Gets revisions of the specified workflow. Only the last 100 revisions are
  /// stored. If the workflow has been deprecated, this action will return
  /// revisions that occurred before the deprecation. This action won't work for
  /// workflows that have been deleted.
  Future<void> getFlowTemplateRevisions(String id,
      {String nextToken, int maxResults}) async {}

  /// Gets the status of a namespace deletion task.
  Future<void> getNamespaceDeletionStatus() async {}

  /// Gets a system instance.
  Future<void> getSystemInstance(String id) async {}

  /// Gets a system.
  Future<void> getSystemTemplate(String id, {BigInt revisionNumber}) async {}

  /// Gets revisions made to the specified system template. Only the previous
  /// 100 revisions are stored. If the system has been deprecated, this action
  /// will return the revisions that occurred before its deprecation. This
  /// action won't work with systems that have been deleted.
  Future<void> getSystemTemplateRevisions(String id,
      {String nextToken, int maxResults}) async {}

  /// Gets the status of the specified upload.
  Future<void> getUploadStatus(String uploadId) async {}

  /// Returns a list of objects that contain information about events in a flow
  /// execution.
  Future<void> listFlowExecutionMessages(String flowExecutionId,
      {String nextToken, int maxResults}) async {}

  /// Lists all tags on an AWS IoT Things Graph resource.
  Future<void> listTagsForResource(String resourceArn,
      {int maxResults, String nextToken}) async {}

  /// Searches for entities of the specified type. You can search for entities
  /// in your namespace and the public namespace that you're tracking.
  Future<void> searchEntities(List<String> entityTypes,
      {List<EntityFilter> filters,
      String nextToken,
      int maxResults,
      BigInt namespaceVersion}) async {}

  /// Searches for AWS IoT Things Graph workflow execution instances.
  Future<void> searchFlowExecutions(String systemInstanceId,
      {String flowExecutionId,
      DateTime startTime,
      DateTime endTime,
      String nextToken,
      int maxResults}) async {}

  /// Searches for summary information about workflows.
  Future<void> searchFlowTemplates(
      {List<FlowTemplateFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Searches for system instances in the user's account.
  Future<void> searchSystemInstances(
      {List<SystemInstanceFilter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Searches for summary information about systems in the user's account. You
  /// can filter by the ID of a workflow to return only systems that use the
  /// specified workflow.
  Future<void> searchSystemTemplates(
      {List<SystemTemplateFilter> filters,
      String nextToken,
      int maxResults}) async {}

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
  Future<void> searchThings(String entityId,
      {String nextToken, int maxResults, BigInt namespaceVersion}) async {}

  /// Creates a tag for the specified resource.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes a system instance from its target (Cloud or Greengrass).
  Future<void> undeploySystemInstance({String id}) async {}

  /// Removes a tag from the specified resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the specified workflow. All deployed systems and system instances
  /// that use the workflow will see the changes in the flow when it is
  /// redeployed. If you don't want this behavior, copy the workflow (creating a
  /// new workflow with a different ID), and update the copy. The workflow can
  /// contain only entities in the specified namespace.
  Future<void> updateFlowTemplate(
      {@required String id,
      @required DefinitionDocument definition,
      BigInt compatibleNamespaceVersion}) async {}

  /// Updates the specified system. You don't need to run this action after
  /// updating a workflow. Any deployment that uses the system will see the
  /// changes in the system when it is redeployed.
  Future<void> updateSystemTemplate(
      {@required String id,
      @required DefinitionDocument definition,
      BigInt compatibleNamespaceVersion}) async {}

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
  Future<void> uploadEntityDefinitions(
      {DefinitionDocument document,
      bool syncWithPublicNamespace,
      bool deprecateExistingEntities}) async {}
}

class AssociateEntityToThingResponse {}

class CreateFlowTemplateResponse {}

class CreateSystemInstanceResponse {}

class CreateSystemTemplateResponse {}

class DefinitionDocument {}

class DeleteFlowTemplateResponse {}

class DeleteNamespaceResponse {}

class DeleteSystemInstanceResponse {}

class DeleteSystemTemplateResponse {}

class DependencyRevision {}

class DeploySystemInstanceResponse {}

class DeprecateFlowTemplateResponse {}

class DeprecateSystemTemplateResponse {}

class DescribeNamespaceResponse {}

class DissociateEntityFromThingResponse {}

class EntityDescription {}

class EntityFilter {}

class FlowExecutionMessage {}

class FlowExecutionSummary {}

class FlowTemplateDescription {}

class FlowTemplateFilter {}

class FlowTemplateSummary {}

class GetEntitiesResponse {}

class GetFlowTemplateResponse {}

class GetFlowTemplateRevisionsResponse {}

class GetNamespaceDeletionStatusResponse {}

class GetSystemInstanceResponse {}

class GetSystemTemplateResponse {}

class GetSystemTemplateRevisionsResponse {}

class GetUploadStatusResponse {}

class ListFlowExecutionMessagesResponse {}

class ListTagsForResourceResponse {}

class MetricsConfiguration {}

class SearchEntitiesResponse {}

class SearchFlowExecutionsResponse {}

class SearchFlowTemplatesResponse {}

class SearchSystemInstancesResponse {}

class SearchSystemTemplatesResponse {}

class SearchThingsResponse {}

class SystemInstanceDescription {}

class SystemInstanceFilter {}

class SystemInstanceSummary {}

class SystemTemplateDescription {}

class SystemTemplateFilter {}

class SystemTemplateSummary {}

class Tag {}

class TagResourceResponse {}

class Thing {}

class UndeploySystemInstanceResponse {}

class UntagResourceResponse {}

class UpdateFlowTemplateResponse {}

class UpdateSystemTemplateResponse {}

class UploadEntityDefinitionsResponse {}
