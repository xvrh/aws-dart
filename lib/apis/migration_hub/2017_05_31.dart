import 'package:meta/meta.dart';

/// The AWS Migration Hub API methods help to obtain server and application
/// migration status and integrate your resource-specific migration tool by
/// providing a programmatic interface to Migration Hub.
class MigrationHubApi {
  /// Associates a created artifact of an AWS cloud resource, the target
  /// receiving the migration, with the migration task performed by a migration
  /// tool. This API has the following traits:
  ///
  /// *   Migration tools can call the `AssociateCreatedArtifact` operation to
  /// indicate which AWS artifact is associated with a migration task.
  ///
  /// *   The created artifact name must be provided in ARN (Amazon Resource
  /// Name) format which will contain information about type and region; for
  /// example: `arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b`.
  ///
  /// *   Examples of the AWS resource behind the created artifact are, AMI's,
  /// EC2 instance, or DMS endpoint, etc.
  Future<void> associateCreatedArtifact(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required CreatedArtifact createdArtifact,
      bool dryRun}) async {}

  /// Associates a discovered resource ID from Application Discovery Service
  /// (ADS) with a migration task.
  Future<void> associateDiscoveredResource(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required DiscoveredResource discoveredResource,
      bool dryRun}) async {}

  /// Creates a progress update stream which is an AWS resource used for access
  /// control as well as a namespace for migration task names that is implicitly
  /// linked to your AWS account. It must uniquely identify the migration tool
  /// as it is used for all updates made by the tool; however, it does not need
  /// to be unique for each AWS account because it is scoped to the AWS account.
  Future<void> createProgressUpdateStream(String progressUpdateStreamName,
      {bool dryRun}) async {}

  /// Deletes a progress update stream, including all of its tasks, which was
  /// previously created as an AWS resource used for access control. This API
  /// has the following traits:
  ///
  /// *   The only parameter needed for `DeleteProgressUpdateStream` is the
  /// stream name (same as a `CreateProgressUpdateStream` call).
  ///
  /// *   The call will return, and a background process will asynchronously
  /// delete the stream and all of its resources (tasks, associated resources,
  /// resource attributes, created artifacts).
  ///
  /// *   If the stream takes time to be deleted, it might still show up on a
  /// `ListProgressUpdateStreams` call.
  ///
  /// *    `CreateProgressUpdateStream`, `ImportMigrationTask`,
  /// `NotifyMigrationTaskState`, and all Associate\[*\] APIs realted to the
  /// tasks belonging to the stream will throw "InvalidInputException" if the
  /// stream of the same name is in the process of being deleted.
  ///
  /// *   Once the stream and all of its resources are deleted,
  /// `CreateProgressUpdateStream` for a stream of the same name will succeed,
  /// and that stream will be an entirely new logical resource (without any
  /// resources associated with the old stream).
  Future<void> deleteProgressUpdateStream(String progressUpdateStreamName,
      {bool dryRun}) async {}

  /// Gets the migration status of an application.
  Future<void> describeApplicationState(String applicationId) async {}

  /// Retrieves a list of all attributes associated with a specific migration
  /// task.
  Future<void> describeMigrationTask(
      {@required String progressUpdateStream,
      @required String migrationTaskName}) async {}

  /// Disassociates a created artifact of an AWS resource with a migration task
  /// performed by a migration tool that was previously associated. This API has
  /// the following traits:
  ///
  /// *   A migration user can call the `DisassociateCreatedArtifacts` operation
  /// to disassociate a created AWS Artifact from a migration task.
  ///
  /// *   The created artifact name must be provided in ARN (Amazon Resource
  /// Name) format which will contain information about type and region; for
  /// example: `arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b`.
  ///
  /// *   Examples of the AWS resource behind the created artifact are, AMI's,
  /// EC2 instance, or RDS instance, etc.
  Future<void> disassociateCreatedArtifact(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required String createdArtifactName,
      bool dryRun}) async {}

  /// Disassociate an Application Discovery Service (ADS) discovered resource
  /// from a migration task.
  Future<void> disassociateDiscoveredResource(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required String configurationId,
      bool dryRun}) async {}

  /// Registers a new migration task which represents a server, database, etc.,
  /// being migrated to AWS by a migration tool.
  ///
  /// This API is a prerequisite to calling the `NotifyMigrationTaskState` API
  /// as the migration tool must first register the migration task with
  /// Migration Hub.
  Future<void> importMigrationTask(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      bool dryRun}) async {}

  /// Lists the created artifacts attached to a given migration task in an
  /// update stream. This API has the following traits:
  ///
  /// *   Gets the list of the created artifacts while migration is taking
  /// place.
  ///
  /// *   Shows the artifacts created by the migration tool that was associated
  /// by the `AssociateCreatedArtifact` API.
  ///
  /// *   Lists created artifacts in a paginated interface.
  Future<void> listCreatedArtifacts(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      String nextToken,
      int maxResults}) async {}

  /// Lists discovered resources associated with the given `MigrationTask`.
  Future<void> listDiscoveredResources(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      String nextToken,
      int maxResults}) async {}

  /// Lists all, or filtered by resource name, migration tasks associated with
  /// the user account making this call. This API has the following traits:
  ///
  /// *   Can show a summary list of the most recent migration tasks.
  ///
  /// *   Can show a summary list of migration tasks associated with a given
  /// discovered resource.
  ///
  /// *   Lists migration tasks in a paginated interface.
  Future<void> listMigrationTasks(
      {String nextToken, int maxResults, String resourceName}) async {}

  /// Lists progress update streams associated with the user account making this
  /// call.
  Future<void> listProgressUpdateStreams(
      {String nextToken, int maxResults}) async {}

  /// Sets the migration state of an application. For a given application
  /// identified by the value passed to `ApplicationId`, its status is set or
  /// updated by passing one of three values to `Status`: `NOT\_STARTED |
  /// IN\_PROGRESS | COMPLETED`.
  Future<void> notifyApplicationState(
      {@required String applicationId,
      @required String status,
      bool dryRun}) async {}

  /// Notifies Migration Hub of the current status, progress, or other detail
  /// regarding a migration task. This API has the following traits:
  ///
  /// *   Migration tools will call the `NotifyMigrationTaskState` API to share
  /// the latest progress and status.
  ///
  /// *    `MigrationTaskName` is used for addressing updates to the correct
  /// target.
  ///
  /// *    `ProgressUpdateStream` is used for access control and to provide a
  /// namespace for each migration tool.
  Future<void> notifyMigrationTaskState(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required Task task,
      @required DateTime updateDateTime,
      @required int nextUpdateSeconds,
      bool dryRun}) async {}

  /// Provides identifying details of the resource being migrated so that it can
  /// be associated in the Application Discovery Service (ADS)'s repository.
  /// This association occurs asynchronously after `PutResourceAttributes`
  /// returns.
  ///
  ///  *   Keep in mind that subsequent calls to PutResourceAttributes will
  /// override previously stored attributes. For example, if it is first called
  /// with a MAC address, but later, it is desired to _add_ an IP address, it
  /// will then be required to call it with _both_ the IP and MAC addresses to
  /// prevent overiding the MAC address.
  ///
  /// *   Note the instructions regarding the special use case of the
  /// [`ResourceAttributeList`](https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#migrationhub-PutResourceAttributes-request-ResourceAttributeList)
  ///  parameter when specifying any "VM" related value.
  ///
  /// Because this is an asynchronous call, it will always return 200, whether
  /// an association occurs or not. To confirm if an association was found based
  /// on the provided details, call `ListDiscoveredResources`.
  Future<void> putResourceAttributes(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required List<ResourceAttribute> resourceAttributeList,
      bool dryRun}) async {}
}

class AssociateCreatedArtifactResult {}

class AssociateDiscoveredResourceResult {}

class CreateProgressUpdateStreamResult {}

class CreatedArtifact {}

class DeleteProgressUpdateStreamResult {}

class DescribeApplicationStateResult {}

class DescribeMigrationTaskResult {}

class DisassociateCreatedArtifactResult {}

class DisassociateDiscoveredResourceResult {}

class DiscoveredResource {}

class ImportMigrationTaskResult {}

class ListCreatedArtifactsResult {}

class ListDiscoveredResourcesResult {}

class ListMigrationTasksResult {}

class ListProgressUpdateStreamsResult {}

class MigrationTask {}

class MigrationTaskSummary {}

class NotifyApplicationStateResult {}

class NotifyMigrationTaskStateResult {}

class ProgressUpdateStreamSummary {}

class PutResourceAttributesResult {}

class ResourceAttribute {}

class Task {}
