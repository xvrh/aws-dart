import 'package:meta/meta.dart';

/// The AWS IoT 1-Click Projects API Reference
class Iot1ClickProjectsApi {
  final _client;
  Iot1ClickProjectsApi(client)
      : _client =
            client.configured('IoT 1Click Projects', serializer: 'rest-json');

  /// Associates a physical device with a placement.
  ///
  /// [projectName]: The name of the project containing the placement in which
  /// to associate the device.
  ///
  /// [placementName]: The name of the placement in which to associate the
  /// device.
  ///
  /// [deviceId]: The ID of the physical device to be associated with the given
  /// placement in the project. Note that a mandatory 4 character prefix is
  /// required for all `deviceId` values.
  ///
  /// [deviceTemplateName]: The device template name to associate with the
  /// device ID.
  Future<AssociateDeviceWithPlacementResponse> associateDeviceWithPlacement(
      {@required String projectName,
      @required String placementName,
      @required String deviceId,
      @required String deviceTemplateName}) async {
    var response_ = await _client.send('AssociateDeviceWithPlacement', {
      'projectName': projectName,
      'placementName': placementName,
      'deviceId': deviceId,
      'deviceTemplateName': deviceTemplateName,
    });
    return AssociateDeviceWithPlacementResponse.fromJson(response_);
  }

  /// Creates an empty placement.
  ///
  /// [placementName]: The name of the placement to be created.
  ///
  /// [projectName]: The name of the project in which to create the placement.
  ///
  /// [attributes]: Optional user-defined key/value pairs providing contextual
  /// data (such as location or function) for the placement.
  Future<CreatePlacementResponse> createPlacement(
      {@required String placementName,
      @required String projectName,
      Map<String, String> attributes}) async {
    var response_ = await _client.send('CreatePlacement', {
      'placementName': placementName,
      'projectName': projectName,
      if (attributes != null) 'attributes': attributes,
    });
    return CreatePlacementResponse.fromJson(response_);
  }

  /// Creates an empty project with a placement template. A project contains
  /// zero or more placements that adhere to the placement template defined in
  /// the project.
  ///
  /// [projectName]: The name of the project to create.
  ///
  /// [description]: An optional description for the project.
  ///
  /// [placementTemplate]: The schema defining the placement to be created. A
  /// placement template defines placement default attributes and device
  /// templates. You cannot add or remove device templates after the project has
  /// been created. However, you can update `callbackOverrides` for the device
  /// templates using the `UpdateProject` API.
  ///
  /// [tags]: Optional tags (metadata key/value pairs) to be associated with the
  /// project. For example, `{ {"key1": "value1", "key2": "value2"} }`. For more
  /// information, see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  Future<CreateProjectResponse> createProject(String projectName,
      {String description,
      PlacementTemplate placementTemplate,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateProject', {
      'projectName': projectName,
      if (description != null) 'description': description,
      if (placementTemplate != null) 'placementTemplate': placementTemplate,
      if (tags != null) 'tags': tags,
    });
    return CreateProjectResponse.fromJson(response_);
  }

  /// Deletes a placement. To delete a placement, it must not have any devices
  /// associated with it.
  ///
  ///
  ///
  /// When you delete a placement, all associated data becomes irretrievable.
  ///
  /// [placementName]: The name of the empty placement to delete.
  ///
  /// [projectName]: The project containing the empty placement to delete.
  Future<DeletePlacementResponse> deletePlacement(
      {@required String placementName, @required String projectName}) async {
    var response_ = await _client.send('DeletePlacement', {
      'placementName': placementName,
      'projectName': projectName,
    });
    return DeletePlacementResponse.fromJson(response_);
  }

  /// Deletes a project. To delete a project, it must not have any placements
  /// associated with it.
  ///
  ///
  ///
  /// When you delete a project, all associated data becomes irretrievable.
  ///
  /// [projectName]: The name of the empty project to delete.
  Future<DeleteProjectResponse> deleteProject(String projectName) async {
    var response_ = await _client.send('DeleteProject', {
      'projectName': projectName,
    });
    return DeleteProjectResponse.fromJson(response_);
  }

  /// Describes a placement in a project.
  ///
  /// [placementName]: The name of the placement within a project.
  ///
  /// [projectName]: The project containing the placement to be described.
  Future<DescribePlacementResponse> describePlacement(
      {@required String placementName, @required String projectName}) async {
    var response_ = await _client.send('DescribePlacement', {
      'placementName': placementName,
      'projectName': projectName,
    });
    return DescribePlacementResponse.fromJson(response_);
  }

  /// Returns an object describing a project.
  ///
  /// [projectName]: The name of the project to be described.
  Future<DescribeProjectResponse> describeProject(String projectName) async {
    var response_ = await _client.send('DescribeProject', {
      'projectName': projectName,
    });
    return DescribeProjectResponse.fromJson(response_);
  }

  /// Removes a physical device from a placement.
  ///
  /// [projectName]: The name of the project that contains the placement.
  ///
  /// [placementName]: The name of the placement that the device should be
  /// removed from.
  ///
  /// [deviceTemplateName]: The device ID that should be removed from the
  /// placement.
  Future<DisassociateDeviceFromPlacementResponse>
      disassociateDeviceFromPlacement(
          {@required String projectName,
          @required String placementName,
          @required String deviceTemplateName}) async {
    var response_ = await _client.send('DisassociateDeviceFromPlacement', {
      'projectName': projectName,
      'placementName': placementName,
      'deviceTemplateName': deviceTemplateName,
    });
    return DisassociateDeviceFromPlacementResponse.fromJson(response_);
  }

  /// Returns an object enumerating the devices in a placement.
  ///
  /// [projectName]: The name of the project containing the placement.
  ///
  /// [placementName]: The name of the placement to get the devices from.
  Future<GetDevicesInPlacementResponse> getDevicesInPlacement(
      {@required String projectName, @required String placementName}) async {
    var response_ = await _client.send('GetDevicesInPlacement', {
      'projectName': projectName,
      'placementName': placementName,
    });
    return GetDevicesInPlacementResponse.fromJson(response_);
  }

  /// Lists the placement(s) of a project.
  ///
  /// [projectName]: The project containing the placements to be listed.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return per request. If not
  /// set, a default value of 100 is used.
  Future<ListPlacementsResponse> listPlacements(String projectName,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListPlacements', {
      'projectName': projectName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListPlacementsResponse.fromJson(response_);
  }

  /// Lists the AWS IoT 1-Click project(s) associated with your AWS account and
  /// region.
  ///
  /// [nextToken]: The token to retrieve the next set of results.
  ///
  /// [maxResults]: The maximum number of results to return per request. If not
  /// set, a default value of 100 is used.
  Future<ListProjectsResponse> listProjects(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListProjects', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListProjectsResponse.fromJson(response_);
  }

  /// Lists the tags (metadata key/value pairs) which you have assigned to the
  /// resource.
  ///
  /// [resourceArn]: The ARN of the resource whose tags you want to list.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Creates or modifies tags for a resource. Tags are key/value pairs
  /// (metadata) that can be used to manage a resource. For more information,
  /// see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  ///
  /// [resourceArn]: The ARN of the resouce for which tag(s) should be added or
  /// modified.
  ///
  /// [tags]: The new or modifying tag(s) for the resource. See
  /// [AWS IoT 1-Click Service Limits](https://docs.aws.amazon.com/iot-1-click/latest/developerguide/1click-appendix.html#1click-limits)
  /// for the maximum number of tags allowed per resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes one or more tags (metadata key/value pairs) from a resource.
  ///
  /// [resourceArn]: The ARN of the resource whose tag you want to remove.
  ///
  /// [tagKeys]: The keys of those tags which you want to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates a placement with the given attributes. To clear an attribute, pass
  /// an empty value (i.e., "").
  ///
  /// [placementName]: The name of the placement to update.
  ///
  /// [projectName]: The name of the project containing the placement to be
  /// updated.
  ///
  /// [attributes]: The user-defined object of attributes used to update the
  /// placement. The maximum number of key/value pairs is 50.
  Future<UpdatePlacementResponse> updatePlacement(
      {@required String placementName,
      @required String projectName,
      Map<String, String> attributes}) async {
    var response_ = await _client.send('UpdatePlacement', {
      'placementName': placementName,
      'projectName': projectName,
      if (attributes != null) 'attributes': attributes,
    });
    return UpdatePlacementResponse.fromJson(response_);
  }

  /// Updates a project associated with your AWS account and region. With the
  /// exception of device template names, you can pass just the values that need
  /// to be updated because the update request will change only the values that
  /// are provided. To clear a value, pass the empty string (i.e., `""`).
  ///
  /// [projectName]: The name of the project to be updated.
  ///
  /// [description]: An optional user-defined description for the project.
  ///
  /// [placementTemplate]: An object defining the project update. Once a project
  /// has been created, you cannot add device template names to the project.
  /// However, for a given `placementTemplate`, you can update the associated
  /// `callbackOverrides` for the device definition using this API.
  Future<UpdateProjectResponse> updateProject(String projectName,
      {String description, PlacementTemplate placementTemplate}) async {
    var response_ = await _client.send('UpdateProject', {
      'projectName': projectName,
      if (description != null) 'description': description,
      if (placementTemplate != null) 'placementTemplate': placementTemplate,
    });
    return UpdateProjectResponse.fromJson(response_);
  }
}

class AssociateDeviceWithPlacementResponse {
  AssociateDeviceWithPlacementResponse();
  static AssociateDeviceWithPlacementResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateDeviceWithPlacementResponse();
}

class CreatePlacementResponse {
  CreatePlacementResponse();
  static CreatePlacementResponse fromJson(Map<String, dynamic> json) =>
      CreatePlacementResponse();
}

class CreateProjectResponse {
  CreateProjectResponse();
  static CreateProjectResponse fromJson(Map<String, dynamic> json) =>
      CreateProjectResponse();
}

class DeletePlacementResponse {
  DeletePlacementResponse();
  static DeletePlacementResponse fromJson(Map<String, dynamic> json) =>
      DeletePlacementResponse();
}

class DeleteProjectResponse {
  DeleteProjectResponse();
  static DeleteProjectResponse fromJson(Map<String, dynamic> json) =>
      DeleteProjectResponse();
}

class DescribePlacementResponse {
  /// An object describing the placement.
  final PlacementDescription placement;

  DescribePlacementResponse({
    @required this.placement,
  });
  static DescribePlacementResponse fromJson(Map<String, dynamic> json) =>
      DescribePlacementResponse(
        placement: PlacementDescription.fromJson(json['placement']),
      );
}

class DescribeProjectResponse {
  /// An object describing the project.
  final ProjectDescription project;

  DescribeProjectResponse({
    @required this.project,
  });
  static DescribeProjectResponse fromJson(Map<String, dynamic> json) =>
      DescribeProjectResponse(
        project: ProjectDescription.fromJson(json['project']),
      );
}

/// An object representing a device for a placement template (see
/// PlacementTemplate).
class DeviceTemplate {
  /// The device type, which currently must be `"button"`.
  final String deviceType;

  /// An optional Lambda function to invoke instead of the default Lambda
  /// function provided by the placement template.
  final Map<String, String> callbackOverrides;

  DeviceTemplate({
    this.deviceType,
    this.callbackOverrides,
  });
  static DeviceTemplate fromJson(Map<String, dynamic> json) => DeviceTemplate(
        deviceType: json.containsKey('deviceType')
            ? json['deviceType'] as String
            : null,
        callbackOverrides: json.containsKey('callbackOverrides')
            ? (json['callbackOverrides'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DisassociateDeviceFromPlacementResponse {
  DisassociateDeviceFromPlacementResponse();
  static DisassociateDeviceFromPlacementResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateDeviceFromPlacementResponse();
}

class GetDevicesInPlacementResponse {
  /// An object containing the devices (zero or more) within the placement.
  final Map<String, String> devices;

  GetDevicesInPlacementResponse({
    @required this.devices,
  });
  static GetDevicesInPlacementResponse fromJson(Map<String, dynamic> json) =>
      GetDevicesInPlacementResponse(
        devices: (json['devices'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
      );
}

class ListPlacementsResponse {
  /// An object listing the requested placements.
  final List<PlacementSummary> placements;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  final String nextToken;

  ListPlacementsResponse({
    @required this.placements,
    this.nextToken,
  });
  static ListPlacementsResponse fromJson(Map<String, dynamic> json) =>
      ListPlacementsResponse(
        placements: (json['placements'] as List)
            .map((e) => PlacementSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListProjectsResponse {
  /// An object containing the list of projects.
  final List<ProjectSummary> projects;

  /// The token used to retrieve the next set of results - will be effectively
  /// empty if there are no further results.
  final String nextToken;

  ListProjectsResponse({
    @required this.projects,
    this.nextToken,
  });
  static ListProjectsResponse fromJson(Map<String, dynamic> json) =>
      ListProjectsResponse(
        projects: (json['projects'] as List)
            .map((e) => ProjectSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags (metadata key/value pairs) which you have assigned to the
  /// resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// An object describing a project's placement.
class PlacementDescription {
  /// The name of the project containing the placement.
  final String projectName;

  /// The name of the placement.
  final String placementName;

  /// The user-defined attributes associated with the placement.
  final Map<String, String> attributes;

  /// The date when the placement was initially created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The date when the placement was last updated, in UNIX epoch time format.
  /// If the placement was not updated, then `createdDate` and `updatedDate` are
  /// the same.
  final DateTime updatedDate;

  PlacementDescription({
    @required this.projectName,
    @required this.placementName,
    @required this.attributes,
    @required this.createdDate,
    @required this.updatedDate,
  });
  static PlacementDescription fromJson(Map<String, dynamic> json) =>
      PlacementDescription(
        projectName: json['projectName'] as String,
        placementName: json['placementName'] as String,
        attributes: (json['attributes'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
        createdDate: DateTime.parse(json['createdDate']),
        updatedDate: DateTime.parse(json['updatedDate']),
      );
}

/// An object providing summary information for a particular placement.
class PlacementSummary {
  /// The name of the project containing the placement.
  final String projectName;

  /// The name of the placement being summarized.
  final String placementName;

  /// The date when the placement was originally created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The date when the placement was last updated, in UNIX epoch time format.
  /// If the placement was not updated, then `createdDate` and `updatedDate` are
  /// the same.
  final DateTime updatedDate;

  PlacementSummary({
    @required this.projectName,
    @required this.placementName,
    @required this.createdDate,
    @required this.updatedDate,
  });
  static PlacementSummary fromJson(Map<String, dynamic> json) =>
      PlacementSummary(
        projectName: json['projectName'] as String,
        placementName: json['placementName'] as String,
        createdDate: DateTime.parse(json['createdDate']),
        updatedDate: DateTime.parse(json['updatedDate']),
      );
}

/// An object defining the template for a placement.
class PlacementTemplate {
  /// The default attributes (key/value pairs) to be applied to all placements
  /// using this template.
  final Map<String, String> defaultAttributes;

  /// An object specifying the DeviceTemplate for all placements using this
  /// (PlacementTemplate) template.
  final Map<String, DeviceTemplate> deviceTemplates;

  PlacementTemplate({
    this.defaultAttributes,
    this.deviceTemplates,
  });
  static PlacementTemplate fromJson(Map<String, dynamic> json) =>
      PlacementTemplate(
        defaultAttributes: json.containsKey('defaultAttributes')
            ? (json['defaultAttributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        deviceTemplates: json.containsKey('deviceTemplates')
            ? (json['deviceTemplates'] as Map).map(
                (k, v) => MapEntry(k as String, DeviceTemplate.fromJson(v)))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object providing detailed information for a particular project associated
/// with an AWS account and region.
class ProjectDescription {
  /// The ARN of the project.
  final String arn;

  /// The name of the project for which to obtain information from.
  final String projectName;

  /// The description of the project.
  final String description;

  /// The date when the project was originally created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then `createdDate` and `updatedDate` are the
  /// same.
  final DateTime updatedDate;

  /// An object describing the project's placement specifications.
  final PlacementTemplate placementTemplate;

  /// The tags (metadata key/value pairs) associated with the project.
  final Map<String, String> tags;

  ProjectDescription({
    this.arn,
    @required this.projectName,
    this.description,
    @required this.createdDate,
    @required this.updatedDate,
    this.placementTemplate,
    this.tags,
  });
  static ProjectDescription fromJson(Map<String, dynamic> json) =>
      ProjectDescription(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        projectName: json['projectName'] as String,
        description: json.containsKey('description')
            ? json['description'] as String
            : null,
        createdDate: DateTime.parse(json['createdDate']),
        updatedDate: DateTime.parse(json['updatedDate']),
        placementTemplate: json.containsKey('placementTemplate')
            ? PlacementTemplate.fromJson(json['placementTemplate'])
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// An object providing summary information for a particular project for an
/// associated AWS account and region.
class ProjectSummary {
  /// The ARN of the project.
  final String arn;

  /// The name of the project being summarized.
  final String projectName;

  /// The date when the project was originally created, in UNIX epoch time
  /// format.
  final DateTime createdDate;

  /// The date when the project was last updated, in UNIX epoch time format. If
  /// the project was not updated, then `createdDate` and `updatedDate` are the
  /// same.
  final DateTime updatedDate;

  /// The tags (metadata key/value pairs) associated with the project.
  final Map<String, String> tags;

  ProjectSummary({
    this.arn,
    @required this.projectName,
    @required this.createdDate,
    @required this.updatedDate,
    this.tags,
  });
  static ProjectSummary fromJson(Map<String, dynamic> json) => ProjectSummary(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        projectName: json['projectName'] as String,
        createdDate: DateTime.parse(json['createdDate']),
        updatedDate: DateTime.parse(json['updatedDate']),
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdatePlacementResponse {
  UpdatePlacementResponse();
  static UpdatePlacementResponse fromJson(Map<String, dynamic> json) =>
      UpdatePlacementResponse();
}

class UpdateProjectResponse {
  UpdateProjectResponse();
  static UpdateProjectResponse fromJson(Map<String, dynamic> json) =>
      UpdateProjectResponse();
}
