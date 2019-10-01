import 'package:meta/meta.dart';

/// The AWS Migration Hub API methods help to obtain server and application
/// migration status and integrate your resource-specific migration tool by
/// providing a programmatic interface to Migration Hub.
class MigrationHubApi {
  final _client;
  MigrationHubApi(client)
      : _client = client.configured('Migration Hub', serializer: 'json');

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
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task.
  ///
  /// [createdArtifact]: An ARN of the AWS resource related to the migration
  /// (e.g., AMI, EC2 instance, RDS instance, etc.)
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<AssociateCreatedArtifactResult> associateCreatedArtifact(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required CreatedArtifact createdArtifact,
      bool dryRun}) async {
    var response_ = await _client.send('AssociateCreatedArtifact', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'CreatedArtifact': createdArtifact,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return AssociateCreatedArtifactResult.fromJson(response_);
  }

  /// Associates a discovered resource ID from Application Discovery Service
  /// (ADS) with a migration task.
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: The identifier given to the MigrationTask.
  ///
  /// [discoveredResource]: Object representing a Resource.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<AssociateDiscoveredResourceResult> associateDiscoveredResource(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required DiscoveredResource discoveredResource,
      bool dryRun}) async {
    var response_ = await _client.send('AssociateDiscoveredResource', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'DiscoveredResource': discoveredResource,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return AssociateDiscoveredResourceResult.fromJson(response_);
  }

  /// Creates a progress update stream which is an AWS resource used for access
  /// control as well as a namespace for migration task names that is implicitly
  /// linked to your AWS account. It must uniquely identify the migration tool
  /// as it is used for all updates made by the tool; however, it does not need
  /// to be unique for each AWS account because it is scoped to the AWS account.
  ///
  /// [progressUpdateStreamName]: The name of the ProgressUpdateStream.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<CreateProgressUpdateStreamResult> createProgressUpdateStream(
      String progressUpdateStreamName,
      {bool dryRun}) async {
    var response_ = await _client.send('CreateProgressUpdateStream', {
      'ProgressUpdateStreamName': progressUpdateStreamName,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return CreateProgressUpdateStreamResult.fromJson(response_);
  }

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
  /// `NotifyMigrationTaskState`, and all Associate[*] APIs realted to the tasks
  /// belonging to the stream will throw "InvalidInputException" if the stream
  /// of the same name is in the process of being deleted.
  ///
  /// *   Once the stream and all of its resources are deleted,
  /// `CreateProgressUpdateStream` for a stream of the same name will succeed,
  /// and that stream will be an entirely new logical resource (without any
  /// resources associated with the old stream).
  ///
  /// [progressUpdateStreamName]: The name of the ProgressUpdateStream.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<DeleteProgressUpdateStreamResult> deleteProgressUpdateStream(
      String progressUpdateStreamName,
      {bool dryRun}) async {
    var response_ = await _client.send('DeleteProgressUpdateStream', {
      'ProgressUpdateStreamName': progressUpdateStreamName,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return DeleteProgressUpdateStreamResult.fromJson(response_);
  }

  /// Gets the migration status of an application.
  ///
  /// [applicationId]: The configurationId in ADS that uniquely identifies the
  /// grouped application.
  Future<DescribeApplicationStateResult> describeApplicationState(
      String applicationId) async {
    var response_ = await _client.send('DescribeApplicationState', {
      'ApplicationId': applicationId,
    });
    return DescribeApplicationStateResult.fromJson(response_);
  }

  /// Retrieves a list of all attributes associated with a specific migration
  /// task.
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: The identifier given to the MigrationTask.
  Future<DescribeMigrationTaskResult> describeMigrationTask(
      {@required String progressUpdateStream,
      @required String migrationTaskName}) async {
    var response_ = await _client.send('DescribeMigrationTask', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
    });
    return DescribeMigrationTaskResult.fromJson(response_);
  }

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
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task
  /// to be disassociated with the artifact.
  ///
  /// [createdArtifactName]: An ARN of the AWS resource related to the migration
  /// (e.g., AMI, EC2 instance, RDS instance, etc.)
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<DisassociateCreatedArtifactResult> disassociateCreatedArtifact(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required String createdArtifactName,
      bool dryRun}) async {
    var response_ = await _client.send('DisassociateCreatedArtifact', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'CreatedArtifactName': createdArtifactName,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return DisassociateCreatedArtifactResult.fromJson(response_);
  }

  /// Disassociate an Application Discovery Service (ADS) discovered resource
  /// from a migration task.
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: The identifier given to the MigrationTask.
  ///
  /// [configurationId]: ConfigurationId of the ADS resource to be
  /// disassociated.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<DisassociateDiscoveredResourceResult> disassociateDiscoveredResource(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required String configurationId,
      bool dryRun}) async {
    var response_ = await _client.send('DisassociateDiscoveredResource', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'ConfigurationId': configurationId,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return DisassociateDiscoveredResourceResult.fromJson(response_);
  }

  /// Registers a new migration task which represents a server, database, etc.,
  /// being migrated to AWS by a migration tool.
  ///
  /// This API is a prerequisite to calling the `NotifyMigrationTaskState` API
  /// as the migration tool must first register the migration task with
  /// Migration Hub.
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<ImportMigrationTaskResult> importMigrationTask(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      bool dryRun}) async {
    var response_ = await _client.send('ImportMigrationTask', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return ImportMigrationTaskResult.fromJson(response_);
  }

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
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task.
  ///
  /// [nextToken]: If a `NextToken` was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in `NextToken`.
  ///
  /// [maxResults]: Maximum number of results to be returned per page.
  Future<ListCreatedArtifactsResult> listCreatedArtifacts(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListCreatedArtifacts', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListCreatedArtifactsResult.fromJson(response_);
  }

  /// Lists discovered resources associated with the given `MigrationTask`.
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: The name of the MigrationTask.
  ///
  /// [nextToken]: If a `NextToken` was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in `NextToken`.
  ///
  /// [maxResults]: The maximum number of results returned per page.
  Future<ListDiscoveredResourcesResult> listDiscoveredResources(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListDiscoveredResources', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDiscoveredResourcesResult.fromJson(response_);
  }

  /// Lists all, or filtered by resource name, migration tasks associated with
  /// the user account making this call. This API has the following traits:
  ///
  /// *   Can show a summary list of the most recent migration tasks.
  ///
  /// *   Can show a summary list of migration tasks associated with a given
  /// discovered resource.
  ///
  /// *   Lists migration tasks in a paginated interface.
  ///
  /// [nextToken]: If a `NextToken` was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in `NextToken`.
  ///
  /// [maxResults]: Value to specify how many results are returned per page.
  ///
  /// [resourceName]: Filter migration tasks by discovered resource name.
  Future<ListMigrationTasksResult> listMigrationTasks(
      {String nextToken, int maxResults, String resourceName}) async {
    var response_ = await _client.send('ListMigrationTasks', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (resourceName != null) 'ResourceName': resourceName,
    });
    return ListMigrationTasksResult.fromJson(response_);
  }

  /// Lists progress update streams associated with the user account making this
  /// call.
  ///
  /// [nextToken]: If a `NextToken` was returned by a previous call, there are
  /// more results available. To retrieve the next page of results, make the
  /// call again using the returned token in `NextToken`.
  ///
  /// [maxResults]: Filter to limit the maximum number of results to list per
  /// page.
  Future<ListProgressUpdateStreamsResult> listProgressUpdateStreams(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListProgressUpdateStreams', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListProgressUpdateStreamsResult.fromJson(response_);
  }

  /// Sets the migration state of an application. For a given application
  /// identified by the value passed to `ApplicationId`, its status is set or
  /// updated by passing one of three values to `Status`: `NOT_STARTED |
  /// IN_PROGRESS | COMPLETED`.
  ///
  /// [applicationId]: The configurationId in ADS that uniquely identifies the
  /// grouped application.
  ///
  /// [status]: Status of the application - Not Started, In-Progress, Complete.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<NotifyApplicationStateResult> notifyApplicationState(
      {@required String applicationId,
      @required String status,
      bool dryRun}) async {
    var response_ = await _client.send('NotifyApplicationState', {
      'ApplicationId': applicationId,
      'Status': status,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return NotifyApplicationStateResult.fromJson(response_);
  }

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
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task.
  ///
  /// [task]: Information about the task's progress and status.
  ///
  /// [updateDateTime]: The timestamp when the task was gathered.
  ///
  /// [nextUpdateSeconds]: Number of seconds after the UpdateDateTime within
  /// which the Migration Hub can expect an update. If Migration Hub does not
  /// receive an update within the specified interval, then the migration task
  /// will be considered stale.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<NotifyMigrationTaskStateResult> notifyMigrationTaskState(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required Task task,
      @required DateTime updateDateTime,
      @required int nextUpdateSeconds,
      bool dryRun}) async {
    var response_ = await _client.send('NotifyMigrationTaskState', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'Task': task,
      'UpdateDateTime': updateDateTime,
      'NextUpdateSeconds': nextUpdateSeconds,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return NotifyMigrationTaskStateResult.fromJson(response_);
  }

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
  ///
  /// [progressUpdateStream]: The name of the ProgressUpdateStream.
  ///
  /// [migrationTaskName]: Unique identifier that references the migration task.
  ///
  /// [resourceAttributeList]: Information about the resource that is being
  /// migrated. This data will be used to map the task to a resource in the
  /// Application Discovery Service (ADS)'s repository.
  ///
  ///  Takes the object array of `ResourceAttribute` where the `Type` field is
  /// reserved for the following values: `IPV4_ADDRESS | IPV6_ADDRESS |
  /// MAC_ADDRESS | FQDN | VM_MANAGER_ID | VM_MANAGED_OBJECT_REFERENCE | VM_NAME
  /// | VM_PATH | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER` where the identifying
  /// value can be a string up to 256 characters.
  ///
  /// *   If any "VM" related value is set for a `ResourceAttribute` object, it
  /// is required that `VM_MANAGER_ID`, as a minimum, is always set. If
  /// `VM_MANAGER_ID` is not set, then all "VM" fields will be discarded and
  /// "VM" fields will not be used for matching the migration task to a server
  /// in Application Discovery Service (ADS)'s repository. See the
  /// [Example](https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#API_PutResourceAttributes_Examples)
  /// section below for a use case of specifying "VM" related values.
  ///
  /// *    If a server you are trying to match has multiple IP or MAC addresses,
  /// you should provide as many as you know in separate type/value pairs passed
  /// to the `ResourceAttributeList` parameter to maximize the chances of
  /// matching.
  ///
  /// [dryRun]: Optional boolean flag to indicate whether any effect should take
  /// place. Used to test if the caller has permission to make the call.
  Future<PutResourceAttributesResult> putResourceAttributes(
      {@required String progressUpdateStream,
      @required String migrationTaskName,
      @required List<ResourceAttribute> resourceAttributeList,
      bool dryRun}) async {
    var response_ = await _client.send('PutResourceAttributes', {
      'ProgressUpdateStream': progressUpdateStream,
      'MigrationTaskName': migrationTaskName,
      'ResourceAttributeList': resourceAttributeList,
      if (dryRun != null) 'DryRun': dryRun,
    });
    return PutResourceAttributesResult.fromJson(response_);
  }
}

class AssociateCreatedArtifactResult {
  AssociateCreatedArtifactResult();
  static AssociateCreatedArtifactResult fromJson(Map<String, dynamic> json) =>
      AssociateCreatedArtifactResult();
}

class AssociateDiscoveredResourceResult {
  AssociateDiscoveredResourceResult();
  static AssociateDiscoveredResourceResult fromJson(
          Map<String, dynamic> json) =>
      AssociateDiscoveredResourceResult();
}

class CreateProgressUpdateStreamResult {
  CreateProgressUpdateStreamResult();
  static CreateProgressUpdateStreamResult fromJson(Map<String, dynamic> json) =>
      CreateProgressUpdateStreamResult();
}

/// An ARN of the AWS cloud resource target receiving the migration (e.g., AMI,
/// EC2 instance, RDS instance, etc.).
class CreatedArtifact {
  /// An ARN that uniquely identifies the result of a migration task.
  final String name;

  /// A description that can be free-form text to record additional detail about
  /// the artifact for clarity or for later reference.
  final String description;

  CreatedArtifact({
    @required this.name,
    this.description,
  });
  static CreatedArtifact fromJson(Map<String, dynamic> json) => CreatedArtifact(
        name: json['Name'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteProgressUpdateStreamResult {
  DeleteProgressUpdateStreamResult();
  static DeleteProgressUpdateStreamResult fromJson(Map<String, dynamic> json) =>
      DeleteProgressUpdateStreamResult();
}

class DescribeApplicationStateResult {
  /// Status of the application - Not Started, In-Progress, Complete.
  final String applicationStatus;

  /// The timestamp when the application status was last updated.
  final DateTime lastUpdatedTime;

  DescribeApplicationStateResult({
    this.applicationStatus,
    this.lastUpdatedTime,
  });
  static DescribeApplicationStateResult fromJson(Map<String, dynamic> json) =>
      DescribeApplicationStateResult(
        applicationStatus: json.containsKey('ApplicationStatus')
            ? json['ApplicationStatus'] as String
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
      );
}

class DescribeMigrationTaskResult {
  /// Object encapsulating information about the migration task.
  final MigrationTask migrationTask;

  DescribeMigrationTaskResult({
    this.migrationTask,
  });
  static DescribeMigrationTaskResult fromJson(Map<String, dynamic> json) =>
      DescribeMigrationTaskResult(
        migrationTask: json.containsKey('MigrationTask')
            ? MigrationTask.fromJson(json['MigrationTask'])
            : null,
      );
}

class DisassociateCreatedArtifactResult {
  DisassociateCreatedArtifactResult();
  static DisassociateCreatedArtifactResult fromJson(
          Map<String, dynamic> json) =>
      DisassociateCreatedArtifactResult();
}

class DisassociateDiscoveredResourceResult {
  DisassociateDiscoveredResourceResult();
  static DisassociateDiscoveredResourceResult fromJson(
          Map<String, dynamic> json) =>
      DisassociateDiscoveredResourceResult();
}

/// Object representing the on-premises resource being migrated.
class DiscoveredResource {
  /// The configurationId in ADS that uniquely identifies the on-premise
  /// resource.
  final String configurationId;

  /// A description that can be free-form text to record additional detail about
  /// the discovered resource for clarity or later reference.
  final String description;

  DiscoveredResource({
    @required this.configurationId,
    this.description,
  });
  static DiscoveredResource fromJson(Map<String, dynamic> json) =>
      DiscoveredResource(
        configurationId: json['ConfigurationId'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ImportMigrationTaskResult {
  ImportMigrationTaskResult();
  static ImportMigrationTaskResult fromJson(Map<String, dynamic> json) =>
      ImportMigrationTaskResult();
}

class ListCreatedArtifactsResult {
  /// If there are more created artifacts than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  final String nextToken;

  /// List of created artifacts up to the maximum number of results specified in
  /// the request.
  final List<CreatedArtifact> createdArtifactList;

  ListCreatedArtifactsResult({
    this.nextToken,
    this.createdArtifactList,
  });
  static ListCreatedArtifactsResult fromJson(Map<String, dynamic> json) =>
      ListCreatedArtifactsResult(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        createdArtifactList: json.containsKey('CreatedArtifactList')
            ? (json['CreatedArtifactList'] as List)
                .map((e) => CreatedArtifact.fromJson(e))
                .toList()
            : null,
      );
}

class ListDiscoveredResourcesResult {
  /// If there are more discovered resources than the max result, return the
  /// next token to be passed to the next call as a bookmark of where to start
  /// from.
  final String nextToken;

  /// Returned list of discovered resources associated with the given
  /// MigrationTask.
  final List<DiscoveredResource> discoveredResourceList;

  ListDiscoveredResourcesResult({
    this.nextToken,
    this.discoveredResourceList,
  });
  static ListDiscoveredResourcesResult fromJson(Map<String, dynamic> json) =>
      ListDiscoveredResourcesResult(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        discoveredResourceList: json.containsKey('DiscoveredResourceList')
            ? (json['DiscoveredResourceList'] as List)
                .map((e) => DiscoveredResource.fromJson(e))
                .toList()
            : null,
      );
}

class ListMigrationTasksResult {
  /// If there are more migration tasks than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  final String nextToken;

  /// Lists the migration task's summary which includes: `MigrationTaskName`,
  /// `ProgressPercent`, `ProgressUpdateStream`, `Status`, and the
  /// `UpdateDateTime` for each task.
  final List<MigrationTaskSummary> migrationTaskSummaryList;

  ListMigrationTasksResult({
    this.nextToken,
    this.migrationTaskSummaryList,
  });
  static ListMigrationTasksResult fromJson(Map<String, dynamic> json) =>
      ListMigrationTasksResult(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        migrationTaskSummaryList: json.containsKey('MigrationTaskSummaryList')
            ? (json['MigrationTaskSummaryList'] as List)
                .map((e) => MigrationTaskSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListProgressUpdateStreamsResult {
  /// List of progress update streams up to the max number of results passed in
  /// the input.
  final List<ProgressUpdateStreamSummary> progressUpdateStreamSummaryList;

  /// If there are more streams created than the max result, return the next
  /// token to be passed to the next call as a bookmark of where to start from.
  final String nextToken;

  ListProgressUpdateStreamsResult({
    this.progressUpdateStreamSummaryList,
    this.nextToken,
  });
  static ListProgressUpdateStreamsResult fromJson(Map<String, dynamic> json) =>
      ListProgressUpdateStreamsResult(
        progressUpdateStreamSummaryList:
            json.containsKey('ProgressUpdateStreamSummaryList')
                ? (json['ProgressUpdateStreamSummaryList'] as List)
                    .map((e) => ProgressUpdateStreamSummary.fromJson(e))
                    .toList()
                : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents a migration task in a migration tool.
class MigrationTask {
  /// A name that identifies the vendor of the migration tool being used.
  final String progressUpdateStream;

  /// Unique identifier that references the migration task.
  final String migrationTaskName;

  /// Task object encapsulating task information.
  final Task task;

  /// The timestamp when the task was gathered.
  final DateTime updateDateTime;

  final List<ResourceAttribute> resourceAttributeList;

  MigrationTask({
    this.progressUpdateStream,
    this.migrationTaskName,
    this.task,
    this.updateDateTime,
    this.resourceAttributeList,
  });
  static MigrationTask fromJson(Map<String, dynamic> json) => MigrationTask(
        progressUpdateStream: json.containsKey('ProgressUpdateStream')
            ? json['ProgressUpdateStream'] as String
            : null,
        migrationTaskName: json.containsKey('MigrationTaskName')
            ? json['MigrationTaskName'] as String
            : null,
        task: json.containsKey('Task') ? Task.fromJson(json['Task']) : null,
        updateDateTime: json.containsKey('UpdateDateTime')
            ? DateTime.parse(json['UpdateDateTime'])
            : null,
        resourceAttributeList: json.containsKey('ResourceAttributeList')
            ? (json['ResourceAttributeList'] as List)
                .map((e) => ResourceAttribute.fromJson(e))
                .toList()
            : null,
      );
}

/// MigrationTaskSummary includes `MigrationTaskName`, `ProgressPercent`,
/// `ProgressUpdateStream`, `Status`, and `UpdateDateTime` for each task.
class MigrationTaskSummary {
  /// An AWS resource used for access control. It should uniquely identify the
  /// migration tool as it is used for all updates made by the tool.
  final String progressUpdateStream;

  /// Unique identifier that references the migration task.
  final String migrationTaskName;

  /// Status of the task.
  final String status;

  final int progressPercent;

  /// Detail information of what is being done within the overall status state.
  final String statusDetail;

  /// The timestamp when the task was gathered.
  final DateTime updateDateTime;

  MigrationTaskSummary({
    this.progressUpdateStream,
    this.migrationTaskName,
    this.status,
    this.progressPercent,
    this.statusDetail,
    this.updateDateTime,
  });
  static MigrationTaskSummary fromJson(Map<String, dynamic> json) =>
      MigrationTaskSummary(
        progressUpdateStream: json.containsKey('ProgressUpdateStream')
            ? json['ProgressUpdateStream'] as String
            : null,
        migrationTaskName: json.containsKey('MigrationTaskName')
            ? json['MigrationTaskName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        progressPercent: json.containsKey('ProgressPercent')
            ? json['ProgressPercent'] as int
            : null,
        statusDetail: json.containsKey('StatusDetail')
            ? json['StatusDetail'] as String
            : null,
        updateDateTime: json.containsKey('UpdateDateTime')
            ? DateTime.parse(json['UpdateDateTime'])
            : null,
      );
}

class NotifyApplicationStateResult {
  NotifyApplicationStateResult();
  static NotifyApplicationStateResult fromJson(Map<String, dynamic> json) =>
      NotifyApplicationStateResult();
}

class NotifyMigrationTaskStateResult {
  NotifyMigrationTaskStateResult();
  static NotifyMigrationTaskStateResult fromJson(Map<String, dynamic> json) =>
      NotifyMigrationTaskStateResult();
}

/// Summary of the AWS resource used for access control that is implicitly
/// linked to your AWS account.
class ProgressUpdateStreamSummary {
  /// The name of the ProgressUpdateStream.
  final String progressUpdateStreamName;

  ProgressUpdateStreamSummary({
    this.progressUpdateStreamName,
  });
  static ProgressUpdateStreamSummary fromJson(Map<String, dynamic> json) =>
      ProgressUpdateStreamSummary(
        progressUpdateStreamName: json.containsKey('ProgressUpdateStreamName')
            ? json['ProgressUpdateStreamName'] as String
            : null,
      );
}

class PutResourceAttributesResult {
  PutResourceAttributesResult();
  static PutResourceAttributesResult fromJson(Map<String, dynamic> json) =>
      PutResourceAttributesResult();
}

/// Attribute associated with a resource.
///
/// Note the corresponding format required per type listed below:
///
/// IPV4
///
///  `x.x.x.x`
///
///  _where x is an integer in the range [0,255]_
///
/// IPV6
///
///  `y : y : y : y : y : y : y : y`
///
///  _where y is a hexadecimal between 0 and FFFF. [0, FFFF]_
///
/// MAC_ADDRESS
///
///  `^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$`
///
/// FQDN
///
///  `^[^<>{}/?,=p{Cntrl}]{1,256}$`
class ResourceAttribute {
  /// Type of resource.
  final String type;

  /// Value of the resource type.
  final String value;

  ResourceAttribute({
    @required this.type,
    @required this.value,
  });
  static ResourceAttribute fromJson(Map<String, dynamic> json) =>
      ResourceAttribute(
        type: json['Type'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Task object encapsulating task information.
class Task {
  /// Status of the task - Not Started, In-Progress, Complete.
  final String status;

  /// Details of task status as notified by a migration tool. A tool might use
  /// this field to provide clarifying information about the status that is
  /// unique to that tool or that explains an error state.
  final String statusDetail;

  /// Indication of the percentage completion of the task.
  final int progressPercent;

  Task({
    @required this.status,
    this.statusDetail,
    this.progressPercent,
  });
  static Task fromJson(Map<String, dynamic> json) => Task(
        status: json['Status'] as String,
        statusDetail: json.containsKey('StatusDetail')
            ? json['StatusDetail'] as String
            : null,
        progressPercent: json.containsKey('ProgressPercent')
            ? json['ProgressPercent'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
