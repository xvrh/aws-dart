import 'package:meta/meta.dart';

/// DAX is a managed caching service engineered for Amazon DynamoDB. DAX
/// dramatically speeds up database reads by caching frequently-accessed data
/// from DynamoDB, so applications can access that data with sub-millisecond
/// latency. You can create a DAX cluster easily, using the AWS Management
/// Console. With a few simple modifications to your code, your application can
/// begin taking advantage of the DAX cluster and realize significant
/// improvements in read performance.
class DaxApi {
  /// Creates a DAX cluster. All nodes in the cluster run the same DAX caching
  /// software.
  Future<void> createCluster(
      {@required String clusterName,
      @required String nodeType,
      String description,
      @required int replicationFactor,
      List<String> availabilityZones,
      String subnetGroupName,
      List<String> securityGroupIds,
      String preferredMaintenanceWindow,
      String notificationTopicArn,
      @required String iamRoleArn,
      String parameterGroupName,
      List<Tag> tags,
      SseSpecification sseSpecification}) async {}

  /// Creates a new parameter group. A parameter group is a collection of
  /// parameters that you apply to all of the nodes in a DAX cluster.
  Future<void> createParameterGroup(String parameterGroupName,
      {String description}) async {}

  /// Creates a new subnet group.
  Future<void> createSubnetGroup(
      {@required String subnetGroupName,
      String description,
      @required List<String> subnetIds}) async {}

  /// Removes one or more nodes from a DAX cluster.
  ///
  ///
  ///
  /// You cannot use `DecreaseReplicationFactor` to remove the last node in a
  /// DAX cluster. If you need to do this, use `DeleteCluster` instead.
  Future<void> decreaseReplicationFactor(
      {@required String clusterName,
      @required int newReplicationFactor,
      List<String> availabilityZones,
      List<String> nodeIdsToRemove}) async {}

  /// Deletes a previously provisioned DAX cluster. _DeleteCluster_ deletes all
  /// associated nodes, node endpoints and the DAX cluster itself. When you
  /// receive a successful response from this action, DAX immediately begins
  /// deleting the cluster; you cannot cancel or revert this action.
  Future<void> deleteCluster(String clusterName) async {}

  /// Deletes the specified parameter group. You cannot delete a parameter group
  /// if it is associated with any DAX clusters.
  Future<void> deleteParameterGroup(String parameterGroupName) async {}

  /// Deletes a subnet group.
  ///
  ///
  ///
  /// You cannot delete a subnet group if it is associated with any DAX
  /// clusters.
  Future<void> deleteSubnetGroup(String subnetGroupName) async {}

  /// Returns information about all provisioned DAX clusters if no cluster
  /// identifier is specified, or about a specific DAX cluster if a cluster
  /// identifier is supplied.
  ///
  /// If the cluster is in the CREATING state, only cluster level information
  /// will be displayed until all of the nodes are successfully provisioned.
  ///
  /// If the cluster is in the DELETING state, only cluster level information
  /// will be displayed.
  ///
  /// If nodes are currently being added to the DAX cluster, node endpoint
  /// information and creation time for the additional nodes will not be
  /// displayed until they are completely provisioned. When the DAX cluster
  /// state is _available_, the cluster is ready for use.
  ///
  /// If nodes are currently being removed from the DAX cluster, no endpoint
  /// information for the removed nodes is displayed.
  Future<void> describeClusters(
      {List<String> clusterNames, int maxResults, String nextToken}) async {}

  /// Returns the default system parameter information for the DAX caching
  /// software.
  Future<void> describeDefaultParameters(
      {int maxResults, String nextToken}) async {}

  /// Returns events related to DAX clusters and parameter groups. You can
  /// obtain events specific to a particular DAX cluster or parameter group by
  /// providing the name as a parameter.
  ///
  /// By default, only the events occurring within the last hour are returned;
  /// however, you can retrieve up to 14 days' worth of events if necessary.
  Future<void> describeEvents(
      {String sourceName,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int maxResults,
      String nextToken}) async {}

  /// Returns a list of parameter group descriptions. If a parameter group name
  /// is specified, the list will contain only the descriptions for that group.
  Future<void> describeParameterGroups(
      {List<String> parameterGroupNames,
      int maxResults,
      String nextToken}) async {}

  /// Returns the detailed parameter list for a particular parameter group.
  Future<void> describeParameters(String parameterGroupName,
      {String source, int maxResults, String nextToken}) async {}

  /// Returns a list of subnet group descriptions. If a subnet group name is
  /// specified, the list will contain only the description of that group.
  Future<void> describeSubnetGroups(
      {List<String> subnetGroupNames,
      int maxResults,
      String nextToken}) async {}

  /// Adds one or more nodes to a DAX cluster.
  Future<void> increaseReplicationFactor(
      {@required String clusterName,
      @required int newReplicationFactor,
      List<String> availabilityZones}) async {}

  /// List all of the tags for a DAX cluster. You can call `ListTags` up to 10
  /// times per second, per account.
  Future<void> listTags(String resourceName, {String nextToken}) async {}

  /// Reboots a single node of a DAX cluster. The reboot action takes place as
  /// soon as possible. During the reboot, the node status is set to REBOOTING.
  Future<void> rebootNode(
      {@required String clusterName, @required String nodeId}) async {}

  /// Associates a set of tags with a DAX resource. You can call `TagResource`
  /// up to 5 times per second, per account.
  Future<void> tagResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Removes the association of tags from a DAX resource. You can call
  /// `UntagResource` up to 5 times per second, per account.
  Future<void> untagResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  /// Modifies the settings for a DAX cluster. You can use this action to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  Future<void> updateCluster(String clusterName,
      {String description,
      String preferredMaintenanceWindow,
      String notificationTopicArn,
      String notificationTopicStatus,
      String parameterGroupName,
      List<String> securityGroupIds}) async {}

  /// Modifies the parameters of a parameter group. You can modify up to 20
  /// parameters in a single request by submitting a list parameter name and
  /// value pairs.
  Future<void> updateParameterGroup(
      {@required String parameterGroupName,
      @required List<ParameterNameValue> parameterNameValues}) async {}

  /// Modifies an existing subnet group.
  Future<void> updateSubnetGroup(String subnetGroupName,
      {String description, List<String> subnetIds}) async {}
}

class Cluster {}

class CreateClusterResponse {}

class CreateParameterGroupResponse {}

class CreateSubnetGroupResponse {}

class DecreaseReplicationFactorResponse {}

class DeleteClusterResponse {}

class DeleteParameterGroupResponse {}

class DeleteSubnetGroupResponse {}

class DescribeClustersResponse {}

class DescribeDefaultParametersResponse {}

class DescribeEventsResponse {}

class DescribeParameterGroupsResponse {}

class DescribeParametersResponse {}

class DescribeSubnetGroupsResponse {}

class Endpoint {}

class Event {}

class IncreaseReplicationFactorResponse {}

class ListTagsResponse {}

class Node {}

class NodeTypeSpecificValue {}

class NotificationConfiguration {}

class Parameter {}

class ParameterGroup {}

class ParameterGroupStatus {}

class ParameterNameValue {}

class RebootNodeResponse {}

class SseDescription {}

class SseSpecification {}

class SecurityGroupMembership {}

class Subnet {}

class SubnetGroup {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateClusterResponse {}

class UpdateParameterGroupResponse {}

class UpdateSubnetGroupResponse {}
