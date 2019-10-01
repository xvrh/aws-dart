import 'package:meta/meta.dart';
import 'dart:typed_data';

///  AWS Mobile Service provides mobile app and website developers with
/// capabilities required to configure AWS resources and bootstrap their
/// developer desktop projects with the necessary SDKs, constants, tools and
/// samples to make use of those resources.
class MobileApi {
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
    return CreateProjectResult.fromJson({});
  }

  ///  Delets a project in AWS Mobile Hub.
  ///
  /// [projectId]:  Unique project identifier.
  Future<DeleteProjectResult> deleteProject(String projectId) async {
    return DeleteProjectResult.fromJson({});
  }

  ///  Get the bundle details for the requested bundle id.
  ///
  /// [bundleId]:  Unique bundle identifier.
  Future<DescribeBundleResult> describeBundle(String bundleId) async {
    return DescribeBundleResult.fromJson({});
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
    return DescribeProjectResult.fromJson({});
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
    return ExportBundleResult.fromJson({});
  }

  ///  Exports project configuration to a snapshot which can be downloaded and
  /// shared. Note that mobile app push credentials are encrypted in exported
  /// projects, so they can only be shared successfully within the same AWS
  /// account.
  ///
  /// [projectId]:  Unique project identifier.
  Future<ExportProjectResult> exportProject(String projectId) async {
    return ExportProjectResult.fromJson({});
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
    return ListBundlesResult.fromJson({});
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
    return ListProjectsResult.fromJson({});
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
    return UpdateProjectResult.fromJson({});
  }
}

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
  static BundleDetails fromJson(Map<String, dynamic> json) => BundleDetails();
}

class CreateProjectResult {
  ///  Detailed information about the created AWS Mobile Hub project.
  final ProjectDetails details;

  CreateProjectResult({
    this.details,
  });
  static CreateProjectResult fromJson(Map<String, dynamic> json) =>
      CreateProjectResult();
}

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
      DeleteProjectResult();
}

class DescribeBundleResult {
  ///  The details of the bundle.
  final BundleDetails details;

  DescribeBundleResult({
    this.details,
  });
  static DescribeBundleResult fromJson(Map<String, dynamic> json) =>
      DescribeBundleResult();
}

class DescribeProjectResult {
  final ProjectDetails details;

  DescribeProjectResult({
    this.details,
  });
  static DescribeProjectResult fromJson(Map<String, dynamic> json) =>
      DescribeProjectResult();
}

class ExportBundleResult {
  ///  URL which contains the custom-generated SDK and tool packages used to
  /// integrate the client mobile app or web app with the AWS resources created
  /// by the AWS Mobile Hub project.
  final String downloadUrl;

  ExportBundleResult({
    this.downloadUrl,
  });
  static ExportBundleResult fromJson(Map<String, dynamic> json) =>
      ExportBundleResult();
}

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
      ExportProjectResult();
}

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
      ListBundlesResult();
}

class ListProjectsResult {
  final List<ProjectSummary> projects;

  final String nextToken;

  ListProjectsResult({
    this.projects,
    this.nextToken,
  });
  static ListProjectsResult fromJson(Map<String, dynamic> json) =>
      ListProjectsResult();
}

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
  static ProjectDetails fromJson(Map<String, dynamic> json) => ProjectDetails();
}

class ProjectSummary {
  ///  Name of the project.
  final String name;

  ///  Unique project identifier.
  final String projectId;

  ProjectSummary({
    this.name,
    this.projectId,
  });
  static ProjectSummary fromJson(Map<String, dynamic> json) => ProjectSummary();
}

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
  static Resource fromJson(Map<String, dynamic> json) => Resource();
}

class UpdateProjectResult {
  ///  Detailed information about the updated AWS Mobile Hub project.
  final ProjectDetails details;

  UpdateProjectResult({
    this.details,
  });
  static UpdateProjectResult fromJson(Map<String, dynamic> json) =>
      UpdateProjectResult();
}
