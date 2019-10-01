import 'package:meta/meta.dart';

/// The AWS IoT 1-Click Projects API Reference
class Iot1ClickProjectsApi {
  /// Associates a physical device with a placement.
  Future<void> associateDeviceWithPlacement(
      {@required String projectName,
      @required String placementName,
      @required String deviceId,
      @required String deviceTemplateName}) async {}

  /// Creates an empty placement.
  Future<void> createPlacement(
      {@required String placementName,
      @required String projectName,
      Map<String, String> attributes}) async {}

  /// Creates an empty project with a placement template. A project contains
  /// zero or more placements that adhere to the placement template defined in
  /// the project.
  Future<void> createProject(String projectName,
      {String description,
      PlacementTemplate placementTemplate,
      Map<String, String> tags}) async {}

  /// Deletes a placement. To delete a placement, it must not have any devices
  /// associated with it.
  ///
  ///
  ///
  /// When you delete a placement, all associated data becomes irretrievable.
  Future<void> deletePlacement(
      {@required String placementName, @required String projectName}) async {}

  /// Deletes a project. To delete a project, it must not have any placements
  /// associated with it.
  ///
  ///
  ///
  /// When you delete a project, all associated data becomes irretrievable.
  Future<void> deleteProject(String projectName) async {}

  /// Describes a placement in a project.
  Future<void> describePlacement(
      {@required String placementName, @required String projectName}) async {}

  /// Returns an object describing a project.
  Future<void> describeProject(String projectName) async {}

  /// Removes a physical device from a placement.
  Future<void> disassociateDeviceFromPlacement(
      {@required String projectName,
      @required String placementName,
      @required String deviceTemplateName}) async {}

  /// Returns an object enumerating the devices in a placement.
  Future<void> getDevicesInPlacement(
      {@required String projectName, @required String placementName}) async {}

  /// Lists the placement(s) of a project.
  Future<void> listPlacements(String projectName,
      {String nextToken, int maxResults}) async {}

  /// Lists the AWS IoT 1-Click project(s) associated with your AWS account and
  /// region.
  Future<void> listProjects({String nextToken, int maxResults}) async {}

  /// Lists the tags (metadata key/value pairs) which you have assigned to the
  /// resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Creates or modifies tags for a resource. Tags are key/value pairs
  /// (metadata) that can be used to manage a resource. For more information,
  /// see [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes one or more tags (metadata key/value pairs) from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a placement with the given attributes. To clear an attribute, pass
  /// an empty value (i.e., "").
  Future<void> updatePlacement(
      {@required String placementName,
      @required String projectName,
      Map<String, String> attributes}) async {}

  /// Updates a project associated with your AWS account and region. With the
  /// exception of device template names, you can pass just the values that need
  /// to be updated because the update request will change only the values that
  /// are provided. To clear a value, pass the empty string (i.e., `""`).
  Future<void> updateProject(String projectName,
      {String description, PlacementTemplate placementTemplate}) async {}
}

class AssociateDeviceWithPlacementResponse {}

class CreatePlacementResponse {}

class CreateProjectResponse {}

class DeletePlacementResponse {}

class DeleteProjectResponse {}

class DescribePlacementResponse {}

class DescribeProjectResponse {}

class DeviceTemplate {}

class DisassociateDeviceFromPlacementResponse {}

class GetDevicesInPlacementResponse {}

class ListPlacementsResponse {}

class ListProjectsResponse {}

class ListTagsForResourceResponse {}

class PlacementDescription {}

class PlacementSummary {}

class PlacementTemplate {}

class ProjectDescription {}

class ProjectSummary {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdatePlacementResponse {}

class UpdateProjectResponse {}
