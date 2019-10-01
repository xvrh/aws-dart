import 'package:meta/meta.dart';
import 'dart:typed_data';

///  AWS Mobile Service provides mobile app and website developers with
/// capabilities required to configure AWS resources and bootstrap their
/// developer desktop projects with the necessary SDKs, constants, tools and
/// samples to make use of those resources.
class MobileApi {
  final _client;
  MobileApi(client)
      : _client = client.configured('Mobile', serializer: 'rest-json');

  ///  Creates an AWS Mobile Hub project.
  ///
  /// [name]:  Name of the project.
  ///
  /// [region]:  Default region where project resources should be created.
  ///
  /// [contents]:  ZIP or YAML file which contains configuration settings to be
  /// used when creating the project. This may be the contents of the file
  /// downloaded from the URL provided in an export project operation.
  ///
  /// [snapshotId]:  Unique identifier for an exported snapshot of project
  /// configuration. This snapshot identifier is included in the share URL when
  /// a project is exported.
  Future<CreateProjectResult> createProject(
      {String name,
      String region,
      Uint8List contents,
      String snapshotId}) async {
    var response_ = await _client.send('CreateProject', {
      if (name != null) 'name': name,
      if (region != null) 'region': region,
      if (contents != null) 'contents': contents,
      if (snapshotId != null) 'snapshotId': snapshotId,
    });
    return CreateProjectResult.fromJson(response_);
  }

  ///  Delets a project in AWS Mobile Hub.
  ///
  /// [projectId]:  Unique project identifier.
  Future<DeleteProjectResult> deleteProject(String projectId) async {
    var response_ = await _client.send('DeleteProject', {
      'projectId': projectId,
    });
    return DeleteProjectResult.fromJson(response_);
  }

  ///  Get the bundle details for the requested bundle id.
  ///
  /// [bundleId]:  Unique bundle identifier.
  Future<DescribeBundleResult> describeBundle(String bundleId) async {
    var response_ = await _client.send('DescribeBundle', {
      'bundleId': bundleId,
    });
    return DescribeBundleResult.fromJson(response_);
  }

  ///  Gets details about a project in AWS Mobile Hub.
  ///
  /// [projectId]:  Unique project identifier.
  ///
  /// [syncFromResources]:  If set to true, causes AWS Mobile Hub to synchronize
  /// information from other services, e.g., update state of AWS CloudFormation
  /// stacks in the AWS Mobile Hub project.
  Future<DescribeProjectResult> describeProject(String projectId,
      {bool syncFromResources}) async {
    var response_ = await _client.send('DescribeProject', {
      'projectId': projectId,
      if (syncFromResources != null) 'syncFromResources': syncFromResources,
    });
    return DescribeProjectResult.fromJson(response_);
  }

  ///  Generates customized software development kit (SDK) and or tool packages
  /// used to integrate mobile web or mobile app clients with backend AWS
  /// resources.
  ///
  /// [bundleId]:  Unique bundle identifier.
  ///
  /// [projectId]:  Unique project identifier.
  ///
  /// [platform]:  Developer desktop or target application platform.
  Future<ExportBundleResult> exportBundle(String bundleId,
      {String projectId, String platform}) async {
    var response_ = await _client.send('ExportBundle', {
      'bundleId': bundleId,
      if (projectId != null) 'projectId': projectId,
      if (platform != null) 'platform': platform,
    });
    return ExportBundleResult.fromJson(response_);
  }

  ///  Exports project configuration to a snapshot which can be downloaded and
  /// shared. Note that mobile app push credentials are encrypted in exported
  /// projects, so they can only be shared successfully within the same AWS
  /// account.
  ///
  /// [projectId]:  Unique project identifier.
  Future<ExportProjectResult> exportProject(String projectId) async {
    var response_ = await _client.send('ExportProject', {
      'projectId': projectId,
    });
    return ExportProjectResult.fromJson(response_);
  }

  ///  List all available bundles.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing bundles from
  /// start. If non-null pagination token is returned in a result, then pass its
  /// value in here in another request to list more bundles.
  Future<ListBundlesResult> listBundles(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListBundles', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListBundlesResult.fromJson(response_);
  }

  ///  Lists projects in AWS Mobile Hub.
  ///
  /// [maxResults]:  Maximum number of records to list in a single response.
  ///
  /// [nextToken]:  Pagination token. Set to null to start listing projects from
  /// start. If non-null pagination token is returned in a result, then pass its
  /// value in here in another request to list more projects.
  Future<ListProjectsResult> listProjects(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListProjects', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListProjectsResult.fromJson(response_);
  }

  ///  Update an existing project.
  ///
  /// [contents]:  ZIP or YAML file which contains project configuration to be
  /// updated. This should be the contents of the file downloaded from the URL
  /// provided in an export project operation.
  ///
  /// [projectId]:  Unique project identifier.
  Future<UpdateProjectResult> updateProject(String projectId,
      {Uint8List contents}) async {
    var response_ = await _client.send('UpdateProject', {
      if (contents != null) 'contents': contents,
      'projectId': projectId,
    });
    return UpdateProjectResult.fromJson(response_);
  }
}

///  The details of the bundle.
class BundleDetails {
  final String bundleId;

  final String title;

  final String version;

  final String description;

  final String iconUrl;

  final List<String> availablePlatforms;

  BundleDetails({
    this.bundleId,
    this.title,
    this.version,
    this.description,
    this.iconUrl,
    this.availablePlatforms,
  });
  static BundleDetails fromJson(Map<String, dynamic> json) => BundleDetails(
        bundleId:
            json.containsKey('bundleId') ? json['bundleId'] as String : null,
        title: json.containsKey('title') ? json['title'] as String : null,
        version: json.containsKey('version') ? json['version'] as String : null,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        iconUrl: json.containsKey('iconUrl') ? json['iconUrl'] as String : null,
        availablePlatforms: json.containsKey('availablePlatforms')
            ? (json['availablePlatforms'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
}

///  Result structure used in response to a request to create a project.
class CreateProjectResult {
  ///  Detailed information about the created AWS Mobile Hub project.
  final ProjectDetails details;

  CreateProjectResult({
    this.details,
  });
  static CreateProjectResult fromJson(Map<String, dynamic> json) =>
      CreateProjectResult(
        details: json.containsKey('details')
            ? ProjectDetails.fromJson(json['details'])
            : null,
      );
}

///  Result structure used in response to request to delete a project.
class DeleteProjectResult {
  ///  Resources which were deleted.
  final List<Resource> deletedResources;

  ///  Resources which were not deleted, due to a risk of losing potentially
  /// important data or files.
  final List<Resource> orphanedResources;

  DeleteProjectResult({
    this.deletedResources,
    this.orphanedResources,
  });
  static DeleteProjectResult fromJson(Map<String, dynamic> json) =>
      DeleteProjectResult(
        deletedResources: json.containsKey('deletedResources')
            ? (json['deletedResources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
        orphanedResources: json.containsKey('orphanedResources')
            ? (json['orphanedResources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
      );
}

///  Result structure contains the details of the bundle.
class DescribeBundleResult {
  ///  The details of the bundle.
  final BundleDetails details;

  DescribeBundleResult({
    this.details,
  });
  static DescribeBundleResult fromJson(Map<String, dynamic> json) =>
      DescribeBundleResult(
        details: json.containsKey('details')
            ? BundleDetails.fromJson(json['details'])
            : null,
      );
}

///  Result structure used for requests of project details.
class DescribeProjectResult {
  final ProjectDetails details;

  DescribeProjectResult({
    this.details,
  });
  static DescribeProjectResult fromJson(Map<String, dynamic> json) =>
      DescribeProjectResult(
        details: json.containsKey('details')
            ? ProjectDetails.fromJson(json['details'])
            : null,
      );
}

///  Result structure which contains link to download custom-generated SDK and
/// tool packages used to integrate mobile web or app clients with backed AWS
/// resources.
class ExportBundleResult {
  ///  URL which contains the custom-generated SDK and tool packages used to
  /// integrate the client mobile app or web app with the AWS resources created
  /// by the AWS Mobile Hub project.
  final String downloadUrl;

  ExportBundleResult({
    this.downloadUrl,
  });
  static ExportBundleResult fromJson(Map<String, dynamic> json) =>
      ExportBundleResult(
        downloadUrl: json.containsKey('downloadUrl')
            ? json['downloadUrl'] as String
            : null,
      );
}

///  Result structure used for requests to export project configuration details.
class ExportProjectResult {
  ///  URL which can be used to download the exported project configuation
  /// file(s).
  final String downloadUrl;

  ///  URL which can be shared to allow other AWS users to create their own
  /// project in AWS Mobile Hub with the same configuration as the specified
  /// project. This URL pertains to a snapshot in time of the project
  /// configuration that is created when this API is called. If you want to
  /// share additional changes to your project configuration, then you will need
  /// to create and share a new snapshot by calling this method again.
  final String shareUrl;

  ///  Unique identifier for the exported snapshot of the project configuration.
  /// This snapshot identifier is included in the share URL.
  final String snapshotId;

  ExportProjectResult({
    this.downloadUrl,
    this.shareUrl,
    this.snapshotId,
  });
  static ExportProjectResult fromJson(Map<String, dynamic> json) =>
      ExportProjectResult(
        downloadUrl: json.containsKey('downloadUrl')
            ? json['downloadUrl'] as String
            : null,
        shareUrl:
            json.containsKey('shareUrl') ? json['shareUrl'] as String : null,
        snapshotId: json.containsKey('snapshotId')
            ? json['snapshotId'] as String
            : null,
      );
}

///  Result structure contains a list of all available bundles with details.
class ListBundlesResult {
  ///  A list of bundles.
  final List<BundleDetails> bundleList;

  ///  Pagination token. If non-null pagination token is returned in a result,
  /// then pass its value in another request to fetch more entries.
  final String nextToken;

  ListBundlesResult({
    this.bundleList,
    this.nextToken,
  });
  static ListBundlesResult fromJson(Map<String, dynamic> json) =>
      ListBundlesResult(
        bundleList: json.containsKey('bundleList')
            ? (json['bundleList'] as List)
                .map((e) => BundleDetails.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

///  Result structure used for requests to list projects in AWS Mobile Hub.
class ListProjectsResult {
  final List<ProjectSummary> projects;

  final String nextToken;

  ListProjectsResult({
    this.projects,
    this.nextToken,
  });
  static ListProjectsResult fromJson(Map<String, dynamic> json) =>
      ListProjectsResult(
        projects: json.containsKey('projects')
            ? (json['projects'] as List)
                .map((e) => ProjectSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

///  Detailed information about an AWS Mobile Hub project.
class ProjectDetails {
  final String name;

  final String projectId;

  final String region;

  final String state;

  ///  Date the project was created.
  final DateTime createdDate;

  ///  Date of the last modification of the project.
  final DateTime lastUpdatedDate;

  ///  Website URL for this project in the AWS Mobile Hub console.
  final String consoleUrl;

  final List<Resource> resources;

  ProjectDetails({
    this.name,
    this.projectId,
    this.region,
    this.state,
    this.createdDate,
    this.lastUpdatedDate,
    this.consoleUrl,
    this.resources,
  });
  static ProjectDetails fromJson(Map<String, dynamic> json) => ProjectDetails(
        name: json.containsKey('name') ? json['name'] as String : null,
        projectId:
            json.containsKey('projectId') ? json['projectId'] as String : null,
        region: json.containsKey('region') ? json['region'] as String : null,
        state: json.containsKey('state') ? json['state'] as String : null,
        createdDate: json.containsKey('createdDate')
            ? DateTime.parse(json['createdDate'])
            : null,
        lastUpdatedDate: json.containsKey('lastUpdatedDate')
            ? DateTime.parse(json['lastUpdatedDate'])
            : null,
        consoleUrl: json.containsKey('consoleUrl')
            ? json['consoleUrl'] as String
            : null,
        resources: json.containsKey('resources')
            ? (json['resources'] as List)
                .map((e) => Resource.fromJson(e))
                .toList()
            : null,
      );
}

///  Summary information about an AWS Mobile Hub project.
class ProjectSummary {
  ///  Name of the project.
  final String name;

  ///  Unique project identifier.
  final String projectId;

  ProjectSummary({
    this.name,
    this.projectId,
  });
  static ProjectSummary fromJson(Map<String, dynamic> json) => ProjectSummary(
        name: json.containsKey('name') ? json['name'] as String : null,
        projectId:
            json.containsKey('projectId') ? json['projectId'] as String : null,
      );
}

///  Information about an instance of an AWS resource associated with a project.
class Resource {
  final String type;

  final String name;

  final String arn;

  final String feature;

  final Map<String, String> attributes;

  Resource({
    this.type,
    this.name,
    this.arn,
    this.feature,
    this.attributes,
  });
  static Resource fromJson(Map<String, dynamic> json) => Resource(
        type: json.containsKey('type') ? json['type'] as String : null,
        name: json.containsKey('name') ? json['name'] as String : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        feature: json.containsKey('feature') ? json['feature'] as String : null,
        attributes: json.containsKey('attributes')
            ? (json['attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

///  Result structure used for requests to updated project configuration.
class UpdateProjectResult {
  ///  Detailed information about the updated AWS Mobile Hub project.
  final ProjectDetails details;

  UpdateProjectResult({
    this.details,
  });
  static UpdateProjectResult fromJson(Map<String, dynamic> json) =>
      UpdateProjectResult(
        details: json.containsKey('details')
            ? ProjectDetails.fromJson(json['details'])
            : null,
      );
}
