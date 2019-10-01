import 'package:meta/meta.dart';
import 'dart:typed_data';

///  AWS Mobile Service provides mobile app and website developers with
/// capabilities required to configure AWS resources and bootstrap their
/// developer desktop projects with the necessary SDKs, constants, tools and
/// samples to make use of those resources.
class MobileApi {
  ///  Creates an AWS Mobile Hub project.
  Future<void> createProject(
      {String name,
      String region,
      Uint8List contents,
      String snapshotId}) async {}

  ///  Delets a project in AWS Mobile Hub.
  Future<void> deleteProject(String projectId) async {}

  ///  Get the bundle details for the requested bundle id.
  Future<void> describeBundle(String bundleId) async {}

  ///  Gets details about a project in AWS Mobile Hub.
  Future<void> describeProject(String projectId,
      {bool syncFromResources}) async {}

  ///  Generates customized software development kit (SDK) and or tool packages
  /// used to integrate mobile web or mobile app clients with backend AWS
  /// resources.
  Future<void> exportBundle(String bundleId,
      {String projectId, String platform}) async {}

  ///  Exports project configuration to a snapshot which can be downloaded and
  /// shared. Note that mobile app push credentials are encrypted in exported
  /// projects, so they can only be shared successfully within the same AWS
  /// account.
  Future<void> exportProject(String projectId) async {}

  ///  List all available bundles.
  Future<void> listBundles({int maxResults, String nextToken}) async {}

  ///  Lists projects in AWS Mobile Hub.
  Future<void> listProjects({int maxResults, String nextToken}) async {}

  ///  Update an existing project.
  Future<void> updateProject(String projectId, {Uint8List contents}) async {}
}

class BundleDetails {}

class CreateProjectResult {}

class DeleteProjectResult {}

class DescribeBundleResult {}

class DescribeProjectResult {}

class ExportBundleResult {}

class ExportProjectResult {}

class ListBundlesResult {}

class ListProjectsResult {}

class ProjectDetails {}

class ProjectSummary {}

class Resource {}

class UpdateProjectResult {}
