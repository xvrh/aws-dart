import 'package:meta/meta.dart';

/// AWS Resource Groups
///
/// AWS Resource Groups lets you organize AWS resources such as Amazon EC2
/// instances, Amazon Relational Database Service databases, and Amazon S3
/// buckets into groups using criteria that you define as tags. A resource group
/// is a collection of resources that match the resource types specified in a
/// query, and share one or more tags or portions of tags. You can create a
/// group of resources based on their roles in your cloud infrastructure,
/// lifecycle stages, regions, application layers, or virtually any criteria.
/// Resource groups enable you to automate management tasks, such as those in
/// AWS Systems Manager Automation documents, on tag-related resources in AWS
/// Systems Manager. Groups of tagged resources also let you quickly view a
/// custom console in AWS Systems Manager that shows AWS Config compliance and
/// other monitoring data about member resources.
///
/// To create a resource group, build a resource query, and specify tags that
/// identify the criteria that members of the group have in common. Tags are
/// key-value pairs.
///
/// For more information about Resource Groups, see the [AWS Resource Groups
/// User Guide](https://docs.aws.amazon.com/ARG/latest/userguide/welcome.html).
///
/// AWS Resource Groups uses a REST-compliant API that you can use to perform
/// the following types of operations.
///
/// *   Create, Read, Update, and Delete (CRUD) operations on resource groups
/// and resource query entities
///
/// *   Applying, editing, and removing tags from resource groups
///
/// *   Resolving resource group member ARNs so they can be returned as search
/// results
///
/// *   Getting data about resources that are members of a group
///
/// *   Searching AWS resources based on a resource query
class ResourceGroupsApi {
  /// Creates a group with a specified name, description, and resource query.
  Future<void> createGroup(
      {@required String name,
      String description,
      @required ResourceQuery resourceQuery,
      Map<String, String> tags}) async {}

  /// Deletes a specified resource group. Deleting a resource group does not
  /// delete resources that are members of the group; it only deletes the group
  /// structure.
  Future<void> deleteGroup(String groupName) async {}

  /// Returns information about a specified resource group.
  Future<void> getGroup(String groupName) async {}

  /// Returns the resource query associated with the specified resource group.
  Future<void> getGroupQuery(String groupName) async {}

  /// Returns a list of tags that are associated with a resource group,
  /// specified by an ARN.
  Future<void> getTags(String arn) async {}

  /// Returns a list of ARNs of resources that are members of a specified
  /// resource group.
  Future<void> listGroupResources(String groupName,
      {List<ResourceFilter> filters, int maxResults, String nextToken}) async {}

  /// Returns a list of existing resource groups in your account.
  Future<void> listGroups(
      {List<GroupFilter> filters, int maxResults, String nextToken}) async {}

  /// Returns a list of AWS resource identifiers that matches a specified query.
  /// The query uses the same format as a resource query in a CreateGroup or
  /// UpdateGroupQuery operation.
  Future<void> searchResources(ResourceQuery resourceQuery,
      {int maxResults, String nextToken}) async {}

  /// Adds tags to a resource group with the specified ARN. Existing tags on a
  /// resource group are not changed if they are not specified in the request
  /// parameters.
  Future<void> tag(
      {@required String arn, @required Map<String, String> tags}) async {}

  /// Deletes specified tags from a specified resource.
  Future<void> untag(
      {@required String arn, @required List<String> keys}) async {}

  /// Updates an existing group with a new or changed description. You cannot
  /// update the name of a resource group.
  Future<void> updateGroup(String groupName, {String description}) async {}

  /// Updates the resource query of a group.
  Future<void> updateGroupQuery(
      {@required String groupName,
      @required ResourceQuery resourceQuery}) async {}
}

class CreateGroupOutput {}

class DeleteGroupOutput {}

class GetGroupOutput {}

class GetGroupQueryOutput {}

class GetTagsOutput {}

class Group {}

class GroupFilter {}

class GroupIdentifier {}

class GroupQuery {}

class ListGroupResourcesOutput {}

class ListGroupsOutput {}

class QueryError {}

class ResourceFilter {}

class ResourceIdentifier {}

class ResourceQuery {}

class SearchResourcesOutput {}

class TagOutput {}

class UntagOutput {}

class UpdateGroupOutput {}

class UpdateGroupQueryOutput {}
