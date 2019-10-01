import 'package:meta/meta.dart';

/// DAX is a managed caching service engineered for Amazon DynamoDB. DAX
/// dramatically speeds up database reads by caching frequently-accessed data
/// from DynamoDB, so applications can access that data with sub-millisecond
/// latency. You can create a DAX cluster easily, using the AWS Management
/// Console. With a few simple modifications to your code, your application can
/// begin taking advantage of the DAX cluster and realize significant
/// improvements in read performance.
class DaxApi {
  final _client;
  DaxApi(client) : _client = client.configured('DAX', serializer: 'json');

  /// Creates a DAX cluster. All nodes in the cluster run the same DAX caching
  /// software.
  ///
  /// [clusterName]: The cluster identifier. This parameter is stored as a
  /// lowercase string.
  ///
  ///  **Constraints:**
  ///
  /// *   A name must contain from 1 to 20 alphanumeric characters or hyphens.
  ///
  /// *   The first character must be a letter.
  ///
  /// *   A name cannot end with a hyphen or contain two consecutive hyphens.
  ///
  /// [nodeType]: The compute and memory capacity of the nodes in the cluster.
  ///
  /// [description]: A description of the cluster.
  ///
  /// [replicationFactor]: The number of nodes in the DAX cluster. A replication
  /// factor of 1 will create a single-node cluster, without any read replicas.
  /// For additional fault tolerance, you can create a multiple node cluster
  /// with one or more read replicas. To do this, set _ReplicationFactor_ to 2
  /// or more.
  ///
  ///
  ///
  /// AWS recommends that you have at least two read replicas per cluster.
  ///
  /// [availabilityZones]: The Availability Zones (AZs) in which the cluster
  /// nodes will be created. All nodes belonging to the cluster are placed in
  /// these Availability Zones. Use this parameter if you want to distribute the
  /// nodes across multiple AZs.
  ///
  /// [subnetGroupName]: The name of the subnet group to be used for the
  /// replication group.
  ///
  ///
  ///
  /// DAX clusters can only run in an Amazon VPC environment. All of the subnets
  /// that you specify in a subnet group must exist in the same VPC.
  ///
  /// [securityGroupIds]: A list of security group IDs to be assigned to each
  /// node in the DAX cluster. (Each of the security group ID is
  /// system-generated.)
  ///
  /// If this parameter is not specified, DAX assigns the default VPC security
  /// group to each node.
  ///
  /// [preferredMaintenanceWindow]: Specifies the weekly time range during which
  /// maintenance on the DAX cluster is performed. It is specified as a range in
  /// the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum
  /// maintenance window is a 60 minute period. Valid values for `ddd` are:
  ///
  /// *    `sun`
  ///
  /// *    `mon`
  ///
  /// *    `tue`
  ///
  /// *    `wed`
  ///
  /// *    `thu`
  ///
  /// *    `fri`
  ///
  /// *    `sat`
  ///
  ///
  /// Example: `sun:05:00-sun:09:00`
  ///
  ///
  ///
  /// If you don't specify a preferred maintenance window when you create or
  /// modify a cache cluster, DAX assigns a 60-minute maintenance window on a
  /// randomly selected day of the week.
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) of the Amazon SNS
  /// topic to which notifications will be sent.
  ///
  ///
  ///
  /// The Amazon SNS topic owner must be same as the DAX cluster owner.
  ///
  /// [iamRoleArn]: A valid Amazon Resource Name (ARN) that identifies an IAM
  /// role. At runtime, DAX will assume this role and use the role's permissions
  /// to access DynamoDB on your behalf.
  ///
  /// [parameterGroupName]: The parameter group to be associated with the DAX
  /// cluster.
  ///
  /// [tags]: A set of tags to associate with the DAX cluster.
  ///
  /// [sseSpecification]: Represents the settings used to enable server-side
  /// encryption on the cluster.
  Future<CreateClusterResponse> createCluster(
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
      SseSpecification sseSpecification}) async {
    var response_ = await _client.send('CreateCluster', {
      'ClusterName': clusterName,
      'NodeType': nodeType,
      if (description != null) 'Description': description,
      'ReplicationFactor': replicationFactor,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (subnetGroupName != null) 'SubnetGroupName': subnetGroupName,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (notificationTopicArn != null)
        'NotificationTopicArn': notificationTopicArn,
      'IamRoleArn': iamRoleArn,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (tags != null) 'Tags': tags,
      if (sseSpecification != null) 'SSESpecification': sseSpecification,
    });
    return CreateClusterResponse.fromJson(response_);
  }

  /// Creates a new parameter group. A parameter group is a collection of
  /// parameters that you apply to all of the nodes in a DAX cluster.
  ///
  /// [parameterGroupName]: The name of the parameter group to apply to all of
  /// the clusters in this replication group.
  ///
  /// [description]: A description of the parameter group.
  Future<CreateParameterGroupResponse> createParameterGroup(
      String parameterGroupName,
      {String description}) async {
    var response_ = await _client.send('CreateParameterGroup', {
      'ParameterGroupName': parameterGroupName,
      if (description != null) 'Description': description,
    });
    return CreateParameterGroupResponse.fromJson(response_);
  }

  /// Creates a new subnet group.
  ///
  /// [subnetGroupName]: A name for the subnet group. This value is stored as a
  /// lowercase string.
  ///
  /// [description]: A description for the subnet group
  ///
  /// [subnetIds]: A list of VPC subnet IDs for the subnet group.
  Future<CreateSubnetGroupResponse> createSubnetGroup(
      {@required String subnetGroupName,
      String description,
      @required List<String> subnetIds}) async {
    var response_ = await _client.send('CreateSubnetGroup', {
      'SubnetGroupName': subnetGroupName,
      if (description != null) 'Description': description,
      'SubnetIds': subnetIds,
    });
    return CreateSubnetGroupResponse.fromJson(response_);
  }

  /// Removes one or more nodes from a DAX cluster.
  ///
  ///
  ///
  /// You cannot use `DecreaseReplicationFactor` to remove the last node in a
  /// DAX cluster. If you need to do this, use `DeleteCluster` instead.
  ///
  /// [clusterName]: The name of the DAX cluster from which you want to remove
  /// nodes.
  ///
  /// [newReplicationFactor]: The new number of nodes for the DAX cluster.
  ///
  /// [availabilityZones]: The Availability Zone(s) from which to remove nodes.
  ///
  /// [nodeIdsToRemove]: The unique identifiers of the nodes to be removed from
  /// the cluster.
  Future<DecreaseReplicationFactorResponse> decreaseReplicationFactor(
      {@required String clusterName,
      @required int newReplicationFactor,
      List<String> availabilityZones,
      List<String> nodeIdsToRemove}) async {
    var response_ = await _client.send('DecreaseReplicationFactor', {
      'ClusterName': clusterName,
      'NewReplicationFactor': newReplicationFactor,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (nodeIdsToRemove != null) 'NodeIdsToRemove': nodeIdsToRemove,
    });
    return DecreaseReplicationFactorResponse.fromJson(response_);
  }

  /// Deletes a previously provisioned DAX cluster. _DeleteCluster_ deletes all
  /// associated nodes, node endpoints and the DAX cluster itself. When you
  /// receive a successful response from this action, DAX immediately begins
  /// deleting the cluster; you cannot cancel or revert this action.
  ///
  /// [clusterName]: The name of the cluster to be deleted.
  Future<DeleteClusterResponse> deleteCluster(String clusterName) async {
    var response_ = await _client.send('DeleteCluster', {
      'ClusterName': clusterName,
    });
    return DeleteClusterResponse.fromJson(response_);
  }

  /// Deletes the specified parameter group. You cannot delete a parameter group
  /// if it is associated with any DAX clusters.
  ///
  /// [parameterGroupName]: The name of the parameter group to delete.
  Future<DeleteParameterGroupResponse> deleteParameterGroup(
      String parameterGroupName) async {
    var response_ = await _client.send('DeleteParameterGroup', {
      'ParameterGroupName': parameterGroupName,
    });
    return DeleteParameterGroupResponse.fromJson(response_);
  }

  /// Deletes a subnet group.
  ///
  ///
  ///
  /// You cannot delete a subnet group if it is associated with any DAX
  /// clusters.
  ///
  /// [subnetGroupName]: The name of the subnet group to delete.
  Future<DeleteSubnetGroupResponse> deleteSubnetGroup(
      String subnetGroupName) async {
    var response_ = await _client.send('DeleteSubnetGroup', {
      'SubnetGroupName': subnetGroupName,
    });
    return DeleteSubnetGroupResponse.fromJson(response_);
  }

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
  ///
  /// [clusterNames]: The names of the DAX clusters being described.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeClustersResponse> describeClusters(
      {List<String> clusterNames, int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeClusters', {
      if (clusterNames != null) 'ClusterNames': clusterNames,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeClustersResponse.fromJson(response_);
  }

  /// Returns the default system parameter information for the DAX caching
  /// software.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeDefaultParametersResponse> describeDefaultParameters(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeDefaultParameters', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeDefaultParametersResponse.fromJson(response_);
  }

  /// Returns events related to DAX clusters and parameter groups. You can
  /// obtain events specific to a particular DAX cluster or parameter group by
  /// providing the name as a parameter.
  ///
  /// By default, only the events occurring within the last hour are returned;
  /// however, you can retrieve up to 14 days' worth of events if necessary.
  ///
  /// [sourceName]: The identifier of the event source for which events will be
  /// returned. If not specified, then all sources are included in the response.
  ///
  /// [sourceType]: The event source to retrieve events for. If no value is
  /// specified, all events are returned.
  ///
  /// [startTime]: The beginning of the time interval to retrieve events for,
  /// specified in ISO 8601 format.
  ///
  /// [endTime]: The end of the time interval for which to retrieve events,
  /// specified in ISO 8601 format.
  ///
  /// [duration]: The number of minutes' worth of events to retrieve.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeEventsResponse> describeEvents(
      {String sourceName,
      String sourceType,
      DateTime startTime,
      DateTime endTime,
      int duration,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeEvents', {
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceType != null) 'SourceType': sourceType,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (duration != null) 'Duration': duration,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeEventsResponse.fromJson(response_);
  }

  /// Returns a list of parameter group descriptions. If a parameter group name
  /// is specified, the list will contain only the descriptions for that group.
  ///
  /// [parameterGroupNames]: The names of the parameter groups.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeParameterGroupsResponse> describeParameterGroups(
      {List<String> parameterGroupNames,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeParameterGroups', {
      if (parameterGroupNames != null)
        'ParameterGroupNames': parameterGroupNames,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeParameterGroupsResponse.fromJson(response_);
  }

  /// Returns the detailed parameter list for a particular parameter group.
  ///
  /// [parameterGroupName]: The name of the parameter group.
  ///
  /// [source]: How the parameter is defined. For example, `system` denotes a
  /// system-defined parameter.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeParametersResponse> describeParameters(
      String parameterGroupName,
      {String source,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeParameters', {
      'ParameterGroupName': parameterGroupName,
      if (source != null) 'Source': source,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeParametersResponse.fromJson(response_);
  }

  /// Returns a list of subnet group descriptions. If a subnet group name is
  /// specified, the list will contain only the description of that group.
  ///
  /// [subnetGroupNames]: The name of the subnet group.
  ///
  /// [maxResults]: The maximum number of results to include in the response. If
  /// more results exist than the specified `MaxResults` value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// The value for `MaxResults` must be between 20 and 100.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token, up to the
  /// value specified by `MaxResults`.
  Future<DescribeSubnetGroupsResponse> describeSubnetGroups(
      {List<String> subnetGroupNames, int maxResults, String nextToken}) async {
    var response_ = await _client.send('DescribeSubnetGroups', {
      if (subnetGroupNames != null) 'SubnetGroupNames': subnetGroupNames,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeSubnetGroupsResponse.fromJson(response_);
  }

  /// Adds one or more nodes to a DAX cluster.
  ///
  /// [clusterName]: The name of the DAX cluster that will receive additional
  /// nodes.
  ///
  /// [newReplicationFactor]: The new number of nodes for the DAX cluster.
  ///
  /// [availabilityZones]: The Availability Zones (AZs) in which the cluster
  /// nodes will be created. All nodes belonging to the cluster are placed in
  /// these Availability Zones. Use this parameter if you want to distribute the
  /// nodes across multiple AZs.
  Future<IncreaseReplicationFactorResponse> increaseReplicationFactor(
      {@required String clusterName,
      @required int newReplicationFactor,
      List<String> availabilityZones}) async {
    var response_ = await _client.send('IncreaseReplicationFactor', {
      'ClusterName': clusterName,
      'NewReplicationFactor': newReplicationFactor,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
    });
    return IncreaseReplicationFactorResponse.fromJson(response_);
  }

  /// List all of the tags for a DAX cluster. You can call `ListTags` up to 10
  /// times per second, per account.
  ///
  /// [resourceName]: The name of the DAX resource to which the tags belong.
  ///
  /// [nextToken]: An optional token returned from a prior request. Use this
  /// token for pagination of results from this action. If this parameter is
  /// specified, the response includes only results beyond the token.
  Future<ListTagsResponse> listTags(String resourceName,
      {String nextToken}) async {
    var response_ = await _client.send('ListTags', {
      'ResourceName': resourceName,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListTagsResponse.fromJson(response_);
  }

  /// Reboots a single node of a DAX cluster. The reboot action takes place as
  /// soon as possible. During the reboot, the node status is set to REBOOTING.
  ///
  /// [clusterName]: The name of the DAX cluster containing the node to be
  /// rebooted.
  ///
  /// [nodeId]: The system-assigned ID of the node to be rebooted.
  Future<RebootNodeResponse> rebootNode(
      {@required String clusterName, @required String nodeId}) async {
    var response_ = await _client.send('RebootNode', {
      'ClusterName': clusterName,
      'NodeId': nodeId,
    });
    return RebootNodeResponse.fromJson(response_);
  }

  /// Associates a set of tags with a DAX resource. You can call `TagResource`
  /// up to 5 times per second, per account.
  ///
  /// [resourceName]: The name of the DAX resource to which tags should be
  /// added.
  ///
  /// [tags]: The tags to be assigned to the DAX resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceName, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceName': resourceName,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Removes the association of tags from a DAX resource. You can call
  /// `UntagResource` up to 5 times per second, per account.
  ///
  /// [resourceName]: The name of the DAX resource from which the tags should be
  /// removed.
  ///
  /// [tagKeys]: A list of tag keys. If the DAX cluster has any tags with these
  /// keys, then the tags are removed from the cluster.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceName, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceName': resourceName,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Modifies the settings for a DAX cluster. You can use this action to change
  /// one or more cluster configuration parameters by specifying the parameters
  /// and the new values.
  ///
  /// [clusterName]: The name of the DAX cluster to be modified.
  ///
  /// [description]: A description of the changes being made to the cluster.
  ///
  /// [preferredMaintenanceWindow]: A range of time when maintenance of DAX
  /// cluster software will be performed. For example: `sun:01:00-sun:09:00`.
  /// Cluster maintenance normally takes less than 30 minutes, and is performed
  /// automatically within the maintenance window.
  ///
  /// [notificationTopicArn]: The Amazon Resource Name (ARN) that identifies the
  /// topic.
  ///
  /// [notificationTopicStatus]: The current state of the topic.
  ///
  /// [parameterGroupName]: The name of a parameter group for this cluster.
  ///
  /// [securityGroupIds]: A list of user-specified security group IDs to be
  /// assigned to each node in the DAX cluster. If this parameter is not
  /// specified, DAX assigns the default VPC security group to each node.
  Future<UpdateClusterResponse> updateCluster(String clusterName,
      {String description,
      String preferredMaintenanceWindow,
      String notificationTopicArn,
      String notificationTopicStatus,
      String parameterGroupName,
      List<String> securityGroupIds}) async {
    var response_ = await _client.send('UpdateCluster', {
      'ClusterName': clusterName,
      if (description != null) 'Description': description,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (notificationTopicArn != null)
        'NotificationTopicArn': notificationTopicArn,
      if (notificationTopicStatus != null)
        'NotificationTopicStatus': notificationTopicStatus,
      if (parameterGroupName != null) 'ParameterGroupName': parameterGroupName,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
    });
    return UpdateClusterResponse.fromJson(response_);
  }

  /// Modifies the parameters of a parameter group. You can modify up to 20
  /// parameters in a single request by submitting a list parameter name and
  /// value pairs.
  ///
  /// [parameterGroupName]: The name of the parameter group.
  ///
  /// [parameterNameValues]: An array of name-value pairs for the parameters in
  /// the group. Each element in the array represents a single parameter.
  Future<UpdateParameterGroupResponse> updateParameterGroup(
      {@required String parameterGroupName,
      @required List<ParameterNameValue> parameterNameValues}) async {
    var response_ = await _client.send('UpdateParameterGroup', {
      'ParameterGroupName': parameterGroupName,
      'ParameterNameValues': parameterNameValues,
    });
    return UpdateParameterGroupResponse.fromJson(response_);
  }

  /// Modifies an existing subnet group.
  ///
  /// [subnetGroupName]: The name of the subnet group.
  ///
  /// [description]: A description of the subnet group.
  ///
  /// [subnetIds]: A list of subnet IDs in the subnet group.
  Future<UpdateSubnetGroupResponse> updateSubnetGroup(String subnetGroupName,
      {String description, List<String> subnetIds}) async {
    var response_ = await _client.send('UpdateSubnetGroup', {
      'SubnetGroupName': subnetGroupName,
      if (description != null) 'Description': description,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    });
    return UpdateSubnetGroupResponse.fromJson(response_);
  }
}

/// Contains all of the attributes of a specific DAX cluster.
class Cluster {
  /// The name of the DAX cluster.
  final String clusterName;

  /// The description of the cluster.
  final String description;

  /// The Amazon Resource Name (ARN) that uniquely identifies the cluster.
  final String clusterArn;

  /// The total number of nodes in the cluster.
  final int totalNodes;

  /// The number of nodes in the cluster that are active (i.e., capable of
  /// serving requests).
  final int activeNodes;

  /// The node type for the nodes in the cluster. (All nodes in a DAX cluster
  /// are of the same type.)
  final String nodeType;

  /// The current status of the cluster.
  final String status;

  /// The configuration endpoint for this DAX cluster, consisting of a DNS name
  /// and a port number. Client applications can specify this endpoint, rather
  /// than an individual node endpoint, and allow the DAX client software to
  /// intelligently route requests and responses to nodes in the DAX cluster.
  final Endpoint clusterDiscoveryEndpoint;

  /// A list of nodes to be removed from the cluster.
  final List<String> nodeIdsToRemove;

  /// A list of nodes that are currently in the cluster.
  final List<Node> nodes;

  /// A range of time when maintenance of DAX cluster software will be
  /// performed. For example: `sun:01:00-sun:09:00`. Cluster maintenance
  /// normally takes less than 30 minutes, and is performed automatically within
  /// the maintenance window.
  final String preferredMaintenanceWindow;

  /// Describes a notification topic and its status. Notification topics are
  /// used for publishing DAX events to subscribers using Amazon Simple
  /// Notification Service (SNS).
  final NotificationConfiguration notificationConfiguration;

  /// The subnet group where the DAX cluster is running.
  final String subnetGroup;

  /// A list of security groups, and the status of each, for the nodes in the
  /// cluster.
  final List<SecurityGroupMembership> securityGroups;

  /// A valid Amazon Resource Name (ARN) that identifies an IAM role. At
  /// runtime, DAX will assume this role and use the role's permissions to
  /// access DynamoDB on your behalf.
  final String iamRoleArn;

  /// The parameter group being used by nodes in the cluster.
  final ParameterGroupStatus parameterGroup;

  /// The description of the server-side encryption status on the specified DAX
  /// cluster.
  final SseDescription sseDescription;

  Cluster({
    this.clusterName,
    this.description,
    this.clusterArn,
    this.totalNodes,
    this.activeNodes,
    this.nodeType,
    this.status,
    this.clusterDiscoveryEndpoint,
    this.nodeIdsToRemove,
    this.nodes,
    this.preferredMaintenanceWindow,
    this.notificationConfiguration,
    this.subnetGroup,
    this.securityGroups,
    this.iamRoleArn,
    this.parameterGroup,
    this.sseDescription,
  });
  static Cluster fromJson(Map<String, dynamic> json) => Cluster(
        clusterName: json.containsKey('ClusterName')
            ? json['ClusterName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        clusterArn: json.containsKey('ClusterArn')
            ? json['ClusterArn'] as String
            : null,
        totalNodes:
            json.containsKey('TotalNodes') ? json['TotalNodes'] as int : null,
        activeNodes:
            json.containsKey('ActiveNodes') ? json['ActiveNodes'] as int : null,
        nodeType:
            json.containsKey('NodeType') ? json['NodeType'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        clusterDiscoveryEndpoint: json.containsKey('ClusterDiscoveryEndpoint')
            ? Endpoint.fromJson(json['ClusterDiscoveryEndpoint'])
            : null,
        nodeIdsToRemove: json.containsKey('NodeIdsToRemove')
            ? (json['NodeIdsToRemove'] as List).map((e) => e as String).toList()
            : null,
        nodes: json.containsKey('Nodes')
            ? (json['Nodes'] as List).map((e) => Node.fromJson(e)).toList()
            : null,
        preferredMaintenanceWindow:
            json.containsKey('PreferredMaintenanceWindow')
                ? json['PreferredMaintenanceWindow'] as String
                : null,
        notificationConfiguration: json.containsKey('NotificationConfiguration')
            ? NotificationConfiguration.fromJson(
                json['NotificationConfiguration'])
            : null,
        subnetGroup: json.containsKey('SubnetGroup')
            ? json['SubnetGroup'] as String
            : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List)
                .map((e) => SecurityGroupMembership.fromJson(e))
                .toList()
            : null,
        iamRoleArn: json.containsKey('IamRoleArn')
            ? json['IamRoleArn'] as String
            : null,
        parameterGroup: json.containsKey('ParameterGroup')
            ? ParameterGroupStatus.fromJson(json['ParameterGroup'])
            : null,
        sseDescription: json.containsKey('SSEDescription')
            ? SseDescription.fromJson(json['SSEDescription'])
            : null,
      );
}

class CreateClusterResponse {
  /// A description of the DAX cluster that you have created.
  final Cluster cluster;

  CreateClusterResponse({
    this.cluster,
  });
  static CreateClusterResponse fromJson(Map<String, dynamic> json) =>
      CreateClusterResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class CreateParameterGroupResponse {
  /// Represents the output of a _CreateParameterGroup_ action.
  final ParameterGroup parameterGroup;

  CreateParameterGroupResponse({
    this.parameterGroup,
  });
  static CreateParameterGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateParameterGroupResponse(
        parameterGroup: json.containsKey('ParameterGroup')
            ? ParameterGroup.fromJson(json['ParameterGroup'])
            : null,
      );
}

class CreateSubnetGroupResponse {
  /// Represents the output of a _CreateSubnetGroup_ operation.
  final SubnetGroup subnetGroup;

  CreateSubnetGroupResponse({
    this.subnetGroup,
  });
  static CreateSubnetGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateSubnetGroupResponse(
        subnetGroup: json.containsKey('SubnetGroup')
            ? SubnetGroup.fromJson(json['SubnetGroup'])
            : null,
      );
}

class DecreaseReplicationFactorResponse {
  /// A description of the DAX cluster, after you have decreased its replication
  /// factor.
  final Cluster cluster;

  DecreaseReplicationFactorResponse({
    this.cluster,
  });
  static DecreaseReplicationFactorResponse fromJson(
          Map<String, dynamic> json) =>
      DecreaseReplicationFactorResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class DeleteClusterResponse {
  /// A description of the DAX cluster that is being deleted.
  final Cluster cluster;

  DeleteClusterResponse({
    this.cluster,
  });
  static DeleteClusterResponse fromJson(Map<String, dynamic> json) =>
      DeleteClusterResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class DeleteParameterGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// parameter group).
  final String deletionMessage;

  DeleteParameterGroupResponse({
    this.deletionMessage,
  });
  static DeleteParameterGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteParameterGroupResponse(
        deletionMessage: json.containsKey('DeletionMessage')
            ? json['DeletionMessage'] as String
            : null,
      );
}

class DeleteSubnetGroupResponse {
  /// A user-specified message for this action (i.e., a reason for deleting the
  /// subnet group).
  final String deletionMessage;

  DeleteSubnetGroupResponse({
    this.deletionMessage,
  });
  static DeleteSubnetGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteSubnetGroupResponse(
        deletionMessage: json.containsKey('DeletionMessage')
            ? json['DeletionMessage'] as String
            : null,
      );
}

class DescribeClustersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// The descriptions of your DAX clusters, in response to a _DescribeClusters_
  /// request.
  final List<Cluster> clusters;

  DescribeClustersResponse({
    this.nextToken,
    this.clusters,
  });
  static DescribeClustersResponse fromJson(Map<String, dynamic> json) =>
      DescribeClustersResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        clusters: json.containsKey('Clusters')
            ? (json['Clusters'] as List)
                .map((e) => Cluster.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeDefaultParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// A list of parameters. Each element in the list represents one parameter.
  final List<Parameter> parameters;

  DescribeDefaultParametersResponse({
    this.nextToken,
    this.parameters,
  });
  static DescribeDefaultParametersResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDefaultParametersResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeEventsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// An array of events. Each element in the array represents one event.
  final List<Event> events;

  DescribeEventsResponse({
    this.nextToken,
    this.events,
  });
  static DescribeEventsResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
      );
}

class DescribeParameterGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// An array of parameter groups. Each element in the array represents one
  /// parameter group.
  final List<ParameterGroup> parameterGroups;

  DescribeParameterGroupsResponse({
    this.nextToken,
    this.parameterGroups,
  });
  static DescribeParameterGroupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeParameterGroupsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        parameterGroups: json.containsKey('ParameterGroups')
            ? (json['ParameterGroups'] as List)
                .map((e) => ParameterGroup.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeParametersResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// A list of parameters within a parameter group. Each element in the list
  /// represents one parameter.
  final List<Parameter> parameters;

  DescribeParametersResponse({
    this.nextToken,
    this.parameters,
  });
  static DescribeParametersResponse fromJson(Map<String, dynamic> json) =>
      DescribeParametersResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        parameters: json.containsKey('Parameters')
            ? (json['Parameters'] as List)
                .map((e) => Parameter.fromJson(e))
                .toList()
            : null,
      );
}

class DescribeSubnetGroupsResponse {
  /// Provides an identifier to allow retrieval of paginated results.
  final String nextToken;

  /// An array of subnet groups. Each element in the array represents a single
  /// subnet group.
  final List<SubnetGroup> subnetGroups;

  DescribeSubnetGroupsResponse({
    this.nextToken,
    this.subnetGroups,
  });
  static DescribeSubnetGroupsResponse fromJson(Map<String, dynamic> json) =>
      DescribeSubnetGroupsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        subnetGroups: json.containsKey('SubnetGroups')
            ? (json['SubnetGroups'] as List)
                .map((e) => SubnetGroup.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the information required for client programs to connect to the
/// configuration endpoint for a DAX cluster, or to an individual node within
/// the cluster.
class Endpoint {
  /// The DNS hostname of the endpoint.
  final String address;

  /// The port number that applications should use to connect to the endpoint.
  final int port;

  Endpoint({
    this.address,
    this.port,
  });
  static Endpoint fromJson(Map<String, dynamic> json) => Endpoint(
        address: json.containsKey('Address') ? json['Address'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
      );
}

/// Represents a single occurrence of something interesting within the system.
/// Some examples of events are creating a DAX cluster, adding or removing a
/// node, or rebooting a node.
class Event {
  /// The source of the event. For example, if the event occurred at the node
  /// level, the source would be the node ID.
  final String sourceName;

  /// Specifies the origin of this event - a cluster, a parameter group, a node
  /// ID, etc.
  final String sourceType;

  /// A user-defined message associated with the event.
  final String message;

  /// The date and time when the event occurred.
  final DateTime date;

  Event({
    this.sourceName,
    this.sourceType,
    this.message,
    this.date,
  });
  static Event fromJson(Map<String, dynamic> json) => Event(
        sourceName: json.containsKey('SourceName')
            ? json['SourceName'] as String
            : null,
        sourceType: json.containsKey('SourceType')
            ? json['SourceType'] as String
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        date: json.containsKey('Date') ? DateTime.parse(json['Date']) : null,
      );
}

class IncreaseReplicationFactorResponse {
  /// A description of the DAX cluster. with its new replication factor.
  final Cluster cluster;

  IncreaseReplicationFactorResponse({
    this.cluster,
  });
  static IncreaseReplicationFactorResponse fromJson(
          Map<String, dynamic> json) =>
      IncreaseReplicationFactorResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class ListTagsResponse {
  /// A list of tags currently associated with the DAX cluster.
  final List<Tag> tags;

  /// If this value is present, there are additional results to be displayed. To
  /// retrieve them, call `ListTags` again, with `NextToken` set to this value.
  final String nextToken;

  ListTagsResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents an individual node within a DAX cluster.
class Node {
  /// A system-generated identifier for the node.
  final String nodeId;

  /// The endpoint for the node, consisting of a DNS name and a port number.
  /// Client applications can connect directly to a node endpoint, if desired
  /// (as an alternative to allowing DAX client software to intelligently route
  /// requests and responses to nodes in the DAX cluster.
  final Endpoint endpoint;

  /// The date and time (in UNIX epoch format) when the node was launched.
  final DateTime nodeCreateTime;

  /// The Availability Zone (AZ) in which the node has been deployed.
  final String availabilityZone;

  /// The current status of the node. For example: `available`.
  final String nodeStatus;

  /// The status of the parameter group associated with this node. For example,
  /// `in-sync`.
  final String parameterGroupStatus;

  Node({
    this.nodeId,
    this.endpoint,
    this.nodeCreateTime,
    this.availabilityZone,
    this.nodeStatus,
    this.parameterGroupStatus,
  });
  static Node fromJson(Map<String, dynamic> json) => Node(
        nodeId: json.containsKey('NodeId') ? json['NodeId'] as String : null,
        endpoint: json.containsKey('Endpoint')
            ? Endpoint.fromJson(json['Endpoint'])
            : null,
        nodeCreateTime: json.containsKey('NodeCreateTime')
            ? DateTime.parse(json['NodeCreateTime'])
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        nodeStatus: json.containsKey('NodeStatus')
            ? json['NodeStatus'] as String
            : null,
        parameterGroupStatus: json.containsKey('ParameterGroupStatus')
            ? json['ParameterGroupStatus'] as String
            : null,
      );
}

/// Represents a parameter value that is applicable to a particular node type.
class NodeTypeSpecificValue {
  /// A node type to which the parameter value applies.
  final String nodeType;

  /// The parameter value for this node type.
  final String value;

  NodeTypeSpecificValue({
    this.nodeType,
    this.value,
  });
  static NodeTypeSpecificValue fromJson(Map<String, dynamic> json) =>
      NodeTypeSpecificValue(
        nodeType:
            json.containsKey('NodeType') ? json['NodeType'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

/// Describes a notification topic and its status. Notification topics are used
/// for publishing DAX events to subscribers using Amazon Simple Notification
/// Service (SNS).
class NotificationConfiguration {
  /// The Amazon Resource Name (ARN) that identifies the topic.
  final String topicArn;

  /// The current state of the topic.
  final String topicStatus;

  NotificationConfiguration({
    this.topicArn,
    this.topicStatus,
  });
  static NotificationConfiguration fromJson(Map<String, dynamic> json) =>
      NotificationConfiguration(
        topicArn:
            json.containsKey('TopicArn') ? json['TopicArn'] as String : null,
        topicStatus: json.containsKey('TopicStatus')
            ? json['TopicStatus'] as String
            : null,
      );
}

/// Describes an individual setting that controls some aspect of DAX behavior.
class Parameter {
  /// The name of the parameter.
  final String parameterName;

  /// Determines whether the parameter can be applied to any nodes, or only
  /// nodes of a particular type.
  final String parameterType;

  /// The value for the parameter.
  final String parameterValue;

  /// A list of node types, and specific parameter values for each node.
  final List<NodeTypeSpecificValue> nodeTypeSpecificValues;

  /// A description of the parameter
  final String description;

  /// How the parameter is defined. For example, `system` denotes a
  /// system-defined parameter.
  final String source;

  /// The data type of the parameter. For example, `integer`:
  final String dataType;

  /// A range of values within which the parameter can be set.
  final String allowedValues;

  /// Whether the customer is allowed to modify the parameter.
  final String isModifiable;

  /// The conditions under which changes to this parameter can be applied. For
  /// example, `requires-reboot` indicates that a new value for this parameter
  /// will only take effect if a node is rebooted.
  final String changeType;

  Parameter({
    this.parameterName,
    this.parameterType,
    this.parameterValue,
    this.nodeTypeSpecificValues,
    this.description,
    this.source,
    this.dataType,
    this.allowedValues,
    this.isModifiable,
    this.changeType,
  });
  static Parameter fromJson(Map<String, dynamic> json) => Parameter(
        parameterName: json.containsKey('ParameterName')
            ? json['ParameterName'] as String
            : null,
        parameterType: json.containsKey('ParameterType')
            ? json['ParameterType'] as String
            : null,
        parameterValue: json.containsKey('ParameterValue')
            ? json['ParameterValue'] as String
            : null,
        nodeTypeSpecificValues: json.containsKey('NodeTypeSpecificValues')
            ? (json['NodeTypeSpecificValues'] as List)
                .map((e) => NodeTypeSpecificValue.fromJson(e))
                .toList()
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        source: json.containsKey('Source') ? json['Source'] as String : null,
        dataType:
            json.containsKey('DataType') ? json['DataType'] as String : null,
        allowedValues: json.containsKey('AllowedValues')
            ? json['AllowedValues'] as String
            : null,
        isModifiable: json.containsKey('IsModifiable')
            ? json['IsModifiable'] as String
            : null,
        changeType: json.containsKey('ChangeType')
            ? json['ChangeType'] as String
            : null,
      );
}

/// A named set of parameters that are applied to all of the nodes in a DAX
/// cluster.
class ParameterGroup {
  /// The name of the parameter group.
  final String parameterGroupName;

  /// A description of the parameter group.
  final String description;

  ParameterGroup({
    this.parameterGroupName,
    this.description,
  });
  static ParameterGroup fromJson(Map<String, dynamic> json) => ParameterGroup(
        parameterGroupName: json.containsKey('ParameterGroupName')
            ? json['ParameterGroupName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
      );
}

/// The status of a parameter group.
class ParameterGroupStatus {
  /// The name of the parameter group.
  final String parameterGroupName;

  /// The status of parameter updates.
  final String parameterApplyStatus;

  /// The node IDs of one or more nodes to be rebooted.
  final List<String> nodeIdsToReboot;

  ParameterGroupStatus({
    this.parameterGroupName,
    this.parameterApplyStatus,
    this.nodeIdsToReboot,
  });
  static ParameterGroupStatus fromJson(Map<String, dynamic> json) =>
      ParameterGroupStatus(
        parameterGroupName: json.containsKey('ParameterGroupName')
            ? json['ParameterGroupName'] as String
            : null,
        parameterApplyStatus: json.containsKey('ParameterApplyStatus')
            ? json['ParameterApplyStatus'] as String
            : null,
        nodeIdsToReboot: json.containsKey('NodeIdsToReboot')
            ? (json['NodeIdsToReboot'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// An individual DAX parameter.
class ParameterNameValue {
  /// The name of the parameter.
  final String parameterName;

  /// The value of the parameter.
  final String parameterValue;

  ParameterNameValue({
    this.parameterName,
    this.parameterValue,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RebootNodeResponse {
  /// A description of the DAX cluster after a node has been rebooted.
  final Cluster cluster;

  RebootNodeResponse({
    this.cluster,
  });
  static RebootNodeResponse fromJson(Map<String, dynamic> json) =>
      RebootNodeResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

/// The description of the server-side encryption status on the specified DAX
/// cluster.
class SseDescription {
  /// The current state of server-side encryption:
  ///
  /// *    `ENABLING` - Server-side encryption is being enabled.
  ///
  /// *    `ENABLED` - Server-side encryption is enabled.
  ///
  /// *    `DISABLING` - Server-side encryption is being disabled.
  ///
  /// *    `DISABLED` - Server-side encryption is disabled.
  final String status;

  SseDescription({
    this.status,
  });
  static SseDescription fromJson(Map<String, dynamic> json) => SseDescription(
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Represents the settings used to enable server-side encryption.
class SseSpecification {
  /// Indicates whether server-side encryption is enabled (true) or disabled
  /// (false) on the cluster.
  final bool enabled;

  SseSpecification({
    @required this.enabled,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An individual VPC security group and its status.
class SecurityGroupMembership {
  /// The unique ID for this security group.
  final String securityGroupIdentifier;

  /// The status of this security group.
  final String status;

  SecurityGroupMembership({
    this.securityGroupIdentifier,
    this.status,
  });
  static SecurityGroupMembership fromJson(Map<String, dynamic> json) =>
      SecurityGroupMembership(
        securityGroupIdentifier: json.containsKey('SecurityGroupIdentifier')
            ? json['SecurityGroupIdentifier'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
      );
}

/// Represents the subnet associated with a DAX cluster. This parameter refers
/// to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used
/// with DAX.
class Subnet {
  /// The system-assigned identifier for the subnet.
  final String subnetIdentifier;

  /// The Availability Zone (AZ) for subnet subnet.
  final String subnetAvailabilityZone;

  Subnet({
    this.subnetIdentifier,
    this.subnetAvailabilityZone,
  });
  static Subnet fromJson(Map<String, dynamic> json) => Subnet(
        subnetIdentifier: json.containsKey('SubnetIdentifier')
            ? json['SubnetIdentifier'] as String
            : null,
        subnetAvailabilityZone: json.containsKey('SubnetAvailabilityZone')
            ? json['SubnetAvailabilityZone'] as String
            : null,
      );
}

/// Represents the output of one of the following actions:
///
/// *    _CreateSubnetGroup_
///
/// *    _ModifySubnetGroup_
class SubnetGroup {
  /// The name of the subnet group.
  final String subnetGroupName;

  /// The description of the subnet group.
  final String description;

  /// The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.
  final String vpcId;

  /// A list of subnets associated with the subnet group.
  final List<Subnet> subnets;

  SubnetGroup({
    this.subnetGroupName,
    this.description,
    this.vpcId,
    this.subnets,
  });
  static SubnetGroup fromJson(Map<String, dynamic> json) => SubnetGroup(
        subnetGroupName: json.containsKey('SubnetGroupName')
            ? json['SubnetGroupName'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        vpcId: json.containsKey('VpcId') ? json['VpcId'] as String : null,
        subnets: json.containsKey('Subnets')
            ? (json['Subnets'] as List).map((e) => Subnet.fromJson(e)).toList()
            : null,
      );
}

/// A description of a tag. Every tag is a key-value pair. You can add up to 50
/// tags to a single DAX cluster.
///
/// AWS-assigned tag names and values are automatically assigned the `aws:`
/// prefix, which the user cannot assign. AWS-assigned tag names do not count
/// towards the tag limit of 50. User-assigned tag names have the prefix
/// `user:`.
///
/// You cannot backdate the application of a tag.
class Tag {
  /// The key for the tag. Tag keys are case sensitive. Every DAX cluster can
  /// only have one tag with the same key. If you try to add an existing tag
  /// (same key), the existing tag value will be updated to the new value.
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagResourceResponse {
  /// The list of tags that are associated with the DAX resource.
  final List<Tag> tags;

  TagResourceResponse({
    this.tags,
  });
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class UntagResourceResponse {
  /// The tag keys that have been removed from the cluster.
  final List<Tag> tags;

  UntagResourceResponse({
    this.tags,
  });
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class UpdateClusterResponse {
  /// A description of the DAX cluster, after it has been modified.
  final Cluster cluster;

  UpdateClusterResponse({
    this.cluster,
  });
  static UpdateClusterResponse fromJson(Map<String, dynamic> json) =>
      UpdateClusterResponse(
        cluster: json.containsKey('Cluster')
            ? Cluster.fromJson(json['Cluster'])
            : null,
      );
}

class UpdateParameterGroupResponse {
  /// The parameter group that has been modified.
  final ParameterGroup parameterGroup;

  UpdateParameterGroupResponse({
    this.parameterGroup,
  });
  static UpdateParameterGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateParameterGroupResponse(
        parameterGroup: json.containsKey('ParameterGroup')
            ? ParameterGroup.fromJson(json['ParameterGroup'])
            : null,
      );
}

class UpdateSubnetGroupResponse {
  /// The subnet group that has been modified.
  final SubnetGroup subnetGroup;

  UpdateSubnetGroupResponse({
    this.subnetGroup,
  });
  static UpdateSubnetGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateSubnetGroupResponse(
        subnetGroup: json.containsKey('SubnetGroup')
            ? SubnetGroup.fromJson(json['SubnetGroup'])
            : null,
      );
}
