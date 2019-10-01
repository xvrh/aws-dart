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
/// For more information about Resource Groups, see the
/// [AWS Resource Groups User Guide](https://docs.aws.amazon.com/ARG/latest/userguide/welcome.html).
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
  ///
  /// [name]: The name of the group, which is the identifier of the group in
  /// other operations. A resource group name cannot be updated after it is
  /// created. A resource group name can have a maximum of 128 characters,
  /// including letters, numbers, hyphens, dots, and underscores. The name
  /// cannot start with `AWS` or `aws`; these are reserved. A resource group
  /// name must be unique within your account.
  ///
  /// [description]: The description of the resource group. Descriptions can
  /// have a maximum of 511 characters, including letters, numbers, hyphens,
  /// underscores, punctuation, and spaces.
  ///
  /// [resourceQuery]: The resource query that determines which AWS resources
  /// are members of this group.
  ///
  /// [tags]: The tags to add to the group. A tag is a string-to-string map of
  /// key-value pairs. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<CreateGroupOutput> createGroup(
      {@required String name,
      String description,
      @required ResourceQuery resourceQuery,
      Map<String, String> tags}) async {
    return CreateGroupOutput.fromJson({});
  }

  /// Deletes a specified resource group. Deleting a resource group does not
  /// delete resources that are members of the group; it only deletes the group
  /// structure.
  ///
  /// [groupName]: The name of the resource group to delete.
  Future<DeleteGroupOutput> deleteGroup(String groupName) async {
    return DeleteGroupOutput.fromJson({});
  }

  /// Returns information about a specified resource group.
  ///
  /// [groupName]: The name of the resource group.
  Future<GetGroupOutput> getGroup(String groupName) async {
    return GetGroupOutput.fromJson({});
  }

  /// Returns the resource query associated with the specified resource group.
  ///
  /// [groupName]: The name of the resource group.
  Future<GetGroupQueryOutput> getGroupQuery(String groupName) async {
    return GetGroupQueryOutput.fromJson({});
  }

  /// Returns a list of tags that are associated with a resource group,
  /// specified by an ARN.
  ///
  /// [arn]: The ARN of the resource group for which you want a list of tags.
  /// The resource must exist within the account you are using.
  Future<GetTagsOutput> getTags(String arn) async {
    return GetTagsOutput.fromJson({});
  }

  /// Returns a list of ARNs of resources that are members of a specified
  /// resource group.
  ///
  /// [groupName]: The name of the resource group.
  ///
  /// [filters]: Filters, formatted as ResourceFilter objects, that you want to
  /// apply to a ListGroupResources operation.
  ///
  /// *    `resource-type` - Filter resources by their type. Specify up to five
  /// resource types in the format AWS::ServiceCode::ResourceType. For example,
  /// AWS::EC2::Instance, or AWS::S3::Bucket.
  ///
  /// [maxResults]: The maximum number of group member ARNs that are returned in
  /// a single call by ListGroupResources, in paginated output. By default, this
  /// number is 50.
  ///
  /// [nextToken]: The NextToken value that is returned in a paginated
  /// ListGroupResources request. To get the next page of results, run the call
  /// again, add the NextToken parameter, and specify the NextToken value.
  Future<ListGroupResourcesOutput> listGroupResources(String groupName,
      {List<ResourceFilter> filters, int maxResults, String nextToken}) async {
    return ListGroupResourcesOutput.fromJson({});
  }

  /// Returns a list of existing resource groups in your account.
  ///
  /// [filters]: Filters, formatted as GroupFilter objects, that you want to
  /// apply to a ListGroups operation.
  ///
  /// *    `resource-type` - Filter groups by resource type. Specify up to five
  /// resource types in the format AWS::ServiceCode::ResourceType. For example,
  /// AWS::EC2::Instance, or AWS::S3::Bucket.
  ///
  /// [maxResults]: The maximum number of resource group results that are
  /// returned by ListGroups in paginated output. By default, this number is 50.
  ///
  /// [nextToken]: The NextToken value that is returned in a paginated
  /// `ListGroups` request. To get the next page of results, run the call again,
  /// add the NextToken parameter, and specify the NextToken value.
  Future<ListGroupsOutput> listGroups(
      {List<GroupFilter> filters, int maxResults, String nextToken}) async {
    return ListGroupsOutput.fromJson({});
  }

  /// Returns a list of AWS resource identifiers that matches a specified query.
  /// The query uses the same format as a resource query in a CreateGroup or
  /// UpdateGroupQuery operation.
  ///
  /// [resourceQuery]: The search query, using the same formats that are
  /// supported for resource group definition.
  ///
  /// [maxResults]: The maximum number of group member ARNs returned by
  /// `SearchResources` in paginated output. By default, this number is 50.
  ///
  /// [nextToken]: The NextToken value that is returned in a paginated
  /// `SearchResources` request. To get the next page of results, run the call
  /// again, add the NextToken parameter, and specify the NextToken value.
  Future<SearchResourcesOutput> searchResources(ResourceQuery resourceQuery,
      {int maxResults, String nextToken}) async {
    return SearchResourcesOutput.fromJson({});
  }

  /// Adds tags to a resource group with the specified ARN. Existing tags on a
  /// resource group are not changed if they are not specified in the request
  /// parameters.
  ///
  /// [arn]: The ARN of the resource to which to add tags.
  ///
  /// [tags]: The tags to add to the specified resource. A tag is a
  /// string-to-string map of key-value pairs. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<TagOutput> tag(
      {@required String arn, @required Map<String, String> tags}) async {
    return TagOutput.fromJson({});
  }

  /// Deletes specified tags from a specified resource.
  ///
  /// [arn]: The ARN of the resource from which to remove tags.
  ///
  /// [keys]: The keys of the tags to be removed.
  Future<UntagOutput> untag(
      {@required String arn, @required List<String> keys}) async {
    return UntagOutput.fromJson({});
  }

  /// Updates an existing group with a new or changed description. You cannot
  /// update the name of a resource group.
  ///
  /// [groupName]: The name of the resource group for which you want to update
  /// its description.
  ///
  /// [description]: The description of the resource group. Descriptions can
  /// have a maximum of 511 characters, including letters, numbers, hyphens,
  /// underscores, punctuation, and spaces.
  Future<UpdateGroupOutput> updateGroup(String groupName,
      {String description}) async {
    return UpdateGroupOutput.fromJson({});
  }

  /// Updates the resource query of a group.
  ///
  /// [groupName]: The name of the resource group for which you want to edit the
  /// query.
  ///
  /// [resourceQuery]: The resource query that determines which AWS resources
  /// are members of the resource group.
  Future<UpdateGroupQueryOutput> updateGroupQuery(
      {@required String groupName,
      @required ResourceQuery resourceQuery}) async {
    return UpdateGroupQueryOutput.fromJson({});
  }
}

class CreateGroupOutput {
  /// A full description of the resource group after it is created.
  final Group group;

  /// The resource query associated with the group.
  final ResourceQuery resourceQuery;

  /// The tags associated with the group.
  final Map<String, String> tags;

  CreateGroupOutput({
    this.group,
    this.resourceQuery,
    this.tags,
  });
  static CreateGroupOutput fromJson(Map<String, dynamic> json) =>
      CreateGroupOutput();
}

class DeleteGroupOutput {
  /// A full description of the deleted resource group.
  final Group group;

  DeleteGroupOutput({
    this.group,
  });
  static DeleteGroupOutput fromJson(Map<String, dynamic> json) =>
      DeleteGroupOutput();
}

class GetGroupOutput {
  /// A full description of the resource group.
  final Group group;

  GetGroupOutput({
    this.group,
  });
  static GetGroupOutput fromJson(Map<String, dynamic> json) => GetGroupOutput();
}

class GetGroupQueryOutput {
  /// The resource query associated with the specified group.
  final GroupQuery groupQuery;

  GetGroupQueryOutput({
    this.groupQuery,
  });
  static GetGroupQueryOutput fromJson(Map<String, dynamic> json) =>
      GetGroupQueryOutput();
}

class GetTagsOutput {
  /// The ARN of the tagged resource group.
  final String arn;

  /// The tags associated with the specified resource group.
  final Map<String, String> tags;

  GetTagsOutput({
    this.arn,
    this.tags,
  });
  static GetTagsOutput fromJson(Map<String, dynamic> json) => GetTagsOutput();
}

/// A resource group.
class Group {
  /// The ARN of a resource group.
  final String groupArn;

  /// The name of a resource group.
  final String name;

  /// The description of the resource group.
  final String description;

  Group({
    @required this.groupArn,
    @required this.name,
    this.description,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

/// A filter name and value pair that is used to obtain more specific results
/// from a list of groups.
class GroupFilter {
  /// The name of the filter. Filter names are case-sensitive.
  final String name;

  /// One or more filter values. Allowed filter values vary by group filter
  /// name, and are case-sensitive.
  final List<String> values;

  GroupFilter({
    @required this.name,
    @required this.values,
  });
}

/// The ARN and group name of a group.
class GroupIdentifier {
  /// The name of a resource group.
  final String groupName;

  /// The ARN of a resource group.
  final String groupArn;

  GroupIdentifier({
    this.groupName,
    this.groupArn,
  });
  static GroupIdentifier fromJson(Map<String, dynamic> json) =>
      GroupIdentifier();
}

/// The underlying resource query of a resource group. Resources that match
/// query results are part of the group.
class GroupQuery {
  /// The name of a resource group that is associated with a specific resource
  /// query.
  final String groupName;

  /// The resource query which determines which AWS resources are members of the
  /// associated resource group.
  final ResourceQuery resourceQuery;

  GroupQuery({
    @required this.groupName,
    @required this.resourceQuery,
  });
  static GroupQuery fromJson(Map<String, dynamic> json) => GroupQuery();
}

class ListGroupResourcesOutput {
  /// The ARNs and resource types of resources that are members of the group
  /// that you specified.
  final List<ResourceIdentifier> resourceIdentifiers;

  /// The NextToken value to include in a subsequent `ListGroupResources`
  /// request, to get more results.
  final String nextToken;

  /// A list of `QueryError` objects. Each error is an object that contains
  /// `ErrorCode` and `Message` structures. Possible values for `ErrorCode` are
  /// `CLOUDFORMATION_STACK_INACTIVE` and `CLOUDFORMATION_STACK_NOT_EXISTING`.
  final List<QueryError> queryErrors;

  ListGroupResourcesOutput({
    this.resourceIdentifiers,
    this.nextToken,
    this.queryErrors,
  });
  static ListGroupResourcesOutput fromJson(Map<String, dynamic> json) =>
      ListGroupResourcesOutput();
}

class ListGroupsOutput {
  /// A list of GroupIdentifier objects. Each identifier is an object that
  /// contains both the GroupName and the GroupArn.
  final List<GroupIdentifier> groupIdentifiers;

  /// A list of resource groups.
  final List<Group> groups;

  /// The NextToken value to include in a subsequent `ListGroups` request, to
  /// get more results.
  final String nextToken;

  ListGroupsOutput({
    this.groupIdentifiers,
    this.groups,
    this.nextToken,
  });
  static ListGroupsOutput fromJson(Map<String, dynamic> json) =>
      ListGroupsOutput();
}

/// A two-part error structure that can occur in `ListGroupResources` or
/// `SearchResources` operations on CloudFormation stack-based queries. The
/// error occurs if the CloudFormation stack on which the query is based either
/// does not exist, or has a status that renders the stack inactive. A
/// `QueryError` occurrence does not necessarily mean that AWS Resource Groups
/// could not complete the operation, but the resulting group might have no
/// member resources.
class QueryError {
  /// Possible values are `CLOUDFORMATION_STACK_INACTIVE` and
  /// `CLOUDFORMATION_STACK_NOT_EXISTING`.
  final String errorCode;

  /// A message that explains the `ErrorCode` value. Messages might state that
  /// the specified CloudFormation stack does not exist (or no longer exists).
  /// For `CLOUDFORMATION_STACK_INACTIVE`, the message typically states that the
  /// CloudFormation stack has a status that is not (or no longer) active, such
  /// as `CREATE_FAILED`.
  final String message;

  QueryError({
    this.errorCode,
    this.message,
  });
  static QueryError fromJson(Map<String, dynamic> json) => QueryError();
}

/// A filter name and value pair that is used to obtain more specific results
/// from a list of resources.
class ResourceFilter {
  /// The name of the filter. Filter names are case-sensitive.
  final String name;

  /// One or more filter values. Allowed filter values vary by resource filter
  /// name, and are case-sensitive.
  final List<String> values;

  ResourceFilter({
    @required this.name,
    @required this.values,
  });
}

/// The ARN of a resource, and its resource type.
class ResourceIdentifier {
  /// The ARN of a resource.
  final String resourceArn;

  /// The resource type of a resource, such as `AWS::EC2::Instance`.
  final String resourceType;

  ResourceIdentifier({
    this.resourceArn,
    this.resourceType,
  });
  static ResourceIdentifier fromJson(Map<String, dynamic> json) =>
      ResourceIdentifier();
}

/// The query that is used to define a resource group or a search for resources.
class ResourceQuery {
  /// The type of the query. The valid values in this release are
  /// `TAG_FILTERS_1_0` and `CLOUDFORMATION_STACK_1_0`.
  ///
  ///   _`TAG_FILTERS_1_0:`_  A JSON syntax that lets you specify a collection
  /// of simple tag filters for resource types and tags, as supported by the AWS
  /// Tagging API
  /// [GetResources](https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html)
  /// operation. If you specify more than one tag key, only resources that match
  /// all tag keys, and at least one value of each specified tag key, are
  /// returned in your query. If you specify more than one value for a tag key,
  /// a resource matches the filter if it has a tag key value that matches _any_
  /// of the specified values.
  ///
  /// For example, consider the following sample query for resources that have
  /// two tags, `Stage` and `Version`, with two values each.
  /// (`[{"Key":"Stage","Values":["Test","Deploy"]},{"Key":"Version","Values":["1","2"]}]`)
  /// The results of this query might include the following.
  ///
  /// *   An EC2 instance that has the following two tags:
  /// `{"Key":"Stage","Value":"Deploy"}`, and `{"Key":"Version","Value":"2"}`
  ///
  /// *   An S3 bucket that has the following two tags:
  /// {"Key":"Stage","Value":"Test"}, and {"Key":"Version","Value":"1"}
  ///
  ///
  /// The query would not return the following results, however. The following
  /// EC2 instance does not have all tag keys specified in the filter, so it is
  /// rejected. The RDS database has all of the tag keys, but no values that
  /// match at least one of the specified tag key values in the filter.
  ///
  /// *   An EC2 instance that has only the following tag:
  /// `{"Key":"Stage","Value":"Deploy"}`.
  ///
  /// *   An RDS database that has the following two tags:
  /// `{"Key":"Stage","Value":"Archived"}`, and `{"Key":"Version","Value":"4"}`
  ///
  ///
  ///   _`CLOUDFORMATION_STACK_1_0:`_  A JSON syntax that lets you specify a
  /// CloudFormation stack ARN.
  final String type;

  /// The query that defines a group or a search.
  final String query;

  ResourceQuery({
    @required this.type,
    @required this.query,
  });
  static ResourceQuery fromJson(Map<String, dynamic> json) => ResourceQuery();
}

class SearchResourcesOutput {
  /// The ARNs and resource types of resources that are members of the group
  /// that you specified.
  final List<ResourceIdentifier> resourceIdentifiers;

  /// The NextToken value to include in a subsequent `SearchResources` request,
  /// to get more results.
  final String nextToken;

  /// A list of `QueryError` objects. Each error is an object that contains
  /// `ErrorCode` and `Message` structures. Possible values for `ErrorCode` are
  /// `CLOUDFORMATION_STACK_INACTIVE` and `CLOUDFORMATION_STACK_NOT_EXISTING`.
  final List<QueryError> queryErrors;

  SearchResourcesOutput({
    this.resourceIdentifiers,
    this.nextToken,
    this.queryErrors,
  });
  static SearchResourcesOutput fromJson(Map<String, dynamic> json) =>
      SearchResourcesOutput();
}

class TagOutput {
  /// The ARN of the tagged resource.
  final String arn;

  /// The tags that have been added to the specified resource.
  final Map<String, String> tags;

  TagOutput({
    this.arn,
    this.tags,
  });
  static TagOutput fromJson(Map<String, dynamic> json) => TagOutput();
}

class UntagOutput {
  /// The ARN of the resource from which tags have been removed.
  final String arn;

  /// The keys of tags that have been removed.
  final List<String> keys;

  UntagOutput({
    this.arn,
    this.keys,
  });
  static UntagOutput fromJson(Map<String, dynamic> json) => UntagOutput();
}

class UpdateGroupOutput {
  /// The full description of the resource group after it has been updated.
  final Group group;

  UpdateGroupOutput({
    this.group,
  });
  static UpdateGroupOutput fromJson(Map<String, dynamic> json) =>
      UpdateGroupOutput();
}

class UpdateGroupQueryOutput {
  /// The resource query associated with the resource group after the update.
  final GroupQuery groupQuery;

  UpdateGroupQueryOutput({
    this.groupQuery,
  });
  static UpdateGroupQueryOutput fromJson(Map<String, dynamic> json) =>
      UpdateGroupQueryOutput();
}
