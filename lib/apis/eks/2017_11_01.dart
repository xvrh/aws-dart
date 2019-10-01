import 'package:meta/meta.dart';

/// Amazon Elastic Kubernetes Service (Amazon EKS) is a managed service that
/// makes it easy for you to run Kubernetes on AWS without needing to stand up
/// or maintain your own Kubernetes control plane. Kubernetes is an open-source
/// system for automating the deployment, scaling, and management of
/// containerized applications.
///
/// Amazon EKS runs up-to-date versions of the open-source Kubernetes software,
/// so you can use all the existing plugins and tooling from the Kubernetes
/// community. Applications running on Amazon EKS are fully compatible with
/// applications running on any standard Kubernetes environment, whether running
/// in on-premises data centers or public clouds. This means that you can easily
/// migrate any standard Kubernetes application to Amazon EKS without any code
/// modification required.
class EksApi {
  final _client;
  EksApi(client) : _client = client.configured('EKS', serializer: 'rest-json');

  /// Creates an Amazon EKS control plane.
  ///
  /// The Amazon EKS control plane consists of control plane instances that run
  /// the Kubernetes software, such as `etcd` and the API server. The control
  /// plane runs in an account managed by AWS, and the Kubernetes API is exposed
  /// via the Amazon EKS API server endpoint. Each Amazon EKS cluster control
  /// plane is single-tenant and unique and runs on its own set of Amazon EC2
  /// instances.
  ///
  /// The cluster control plane is provisioned across multiple Availability
  /// Zones and fronted by an Elastic Load Balancing Network Load Balancer.
  /// Amazon EKS also provisions elastic network interfaces in your VPC subnets
  /// to provide connectivity from the control plane instances to the worker
  /// nodes (for example, to support `kubectl exec`, `logs`, and `proxy` data
  /// flows).
  ///
  /// Amazon EKS worker nodes run in your AWS account and connect to your
  /// cluster's control plane via the Kubernetes API server endpoint and a
  /// certificate file that is created for your cluster.
  ///
  /// You can use the `endpointPublicAccess` and `endpointPrivateAccess`
  /// parameters to enable or disable public and private access to your
  /// cluster's Kubernetes API server endpoint. By default, public access is
  /// enabled, and private access is disabled. For more information, see
  /// [Amazon EKS Cluster Endpoint Access Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  /// You can use the `logging` parameter to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see
  /// [Amazon EKS Cluster Control Plane Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see
  /// [Amazon CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// Cluster creation typically takes between 10 and 15 minutes. After you
  /// create an Amazon EKS cluster, you must configure your Kubernetes tooling
  /// to communicate with the API server and launch worker nodes into your
  /// cluster. For more information, see
  /// [Managing Cluster Authentication](https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html)
  /// and
  /// [Launching Amazon EKS Worker Nodes](https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html)
  /// in the _Amazon EKS User Guide_.
  ///
  /// [name]: The unique name to give to your cluster.
  ///
  /// [version]: The desired Kubernetes version for your cluster. If you don't
  /// specify a value here, the latest version available in Amazon EKS is used.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role that provides
  /// permissions for Amazon EKS to make calls to other AWS API operations on
  /// your behalf. For more information, see
  /// [Amazon EKS Service IAM Role](https://docs.aws.amazon.com/eks/latest/userguide/service_IAM_role.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  /// [resourcesVpcConfig]: The VPC configuration used by the cluster control
  /// plane. Amazon EKS VPC resources have specific requirements to work
  /// properly with Kubernetes. For more information, see
  /// [Cluster VPC Considerations](https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html)
  /// and
  /// [Cluster Security Group Considerations](https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html)
  /// in the _Amazon EKS User Guide_. You must specify at least two subnets. You
  /// can specify up to five security groups, but we recommend that you use a
  /// dedicated security group for your cluster control plane.
  ///
  /// [logging]: Enable or disable exporting the Kubernetes control plane logs
  /// for your cluster to CloudWatch Logs. By default, cluster control plane
  /// logs aren't exported to CloudWatch Logs. For more information, see
  /// [Amazon EKS Cluster Control Plane Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///
  ///
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see
  /// [Amazon CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  ///
  /// [tags]: The metadata to apply to the cluster to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both
  /// of which you define.
  Future<CreateClusterResponse> createCluster(
      {@required String name,
      String version,
      @required String roleArn,
      @required VpcConfigRequest resourcesVpcConfig,
      Logging logging,
      String clientRequestToken,
      Map<String, String> tags}) async {
    var response_ = await _client.send('CreateCluster', {
      'name': name,
      if (version != null) 'version': version,
      'roleArn': roleArn,
      'resourcesVpcConfig': resourcesVpcConfig,
      if (logging != null) 'logging': logging,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (tags != null) 'tags': tags,
    });
    return CreateClusterResponse.fromJson(response_);
  }

  /// Deletes the Amazon EKS cluster control plane.
  ///
  ///
  ///
  /// If you have active services in your cluster that are associated with a
  /// load balancer, you must delete those services before deleting the cluster
  /// so that the load balancers are deleted properly. Otherwise, you can have
  /// orphaned resources in your VPC that prevent you from being able to delete
  /// the VPC. For more information, see
  /// [Deleting a Cluster](https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html)
  /// in the _Amazon EKS User Guide_.
  ///
  /// [name]: The name of the cluster to delete.
  Future<DeleteClusterResponse> deleteCluster(String name) async {
    var response_ = await _client.send('DeleteCluster', {
      'name': name,
    });
    return DeleteClusterResponse.fromJson(response_);
  }

  /// Returns descriptive information about an Amazon EKS cluster.
  ///
  /// The API server endpoint and certificate authority data returned by this
  /// operation are required for `kubelet` and `kubectl` to communicate with
  /// your Kubernetes API server. For more information, see
  /// [Create a kubeconfig for Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html).
  ///
  ///
  ///
  /// The API server endpoint and certificate authority data aren't available
  /// until the cluster reaches the `ACTIVE` state.
  ///
  /// [name]: The name of the cluster to describe.
  Future<DescribeClusterResponse> describeCluster(String name) async {
    var response_ = await _client.send('DescribeCluster', {
      'name': name,
    });
    return DescribeClusterResponse.fromJson(response_);
  }

  /// Returns descriptive information about an update against your Amazon EKS
  /// cluster.
  ///
  /// When the status of the update is `Succeeded`, the update is complete. If
  /// an update fails, the status is `Failed`, and an error detail explains the
  /// reason for the failure.
  ///
  /// [name]: The name of the Amazon EKS cluster to update.
  ///
  /// [updateId]: The ID of the update to describe.
  Future<DescribeUpdateResponse> describeUpdate(
      {@required String name, @required String updateId}) async {
    var response_ = await _client.send('DescribeUpdate', {
      'name': name,
      'updateId': updateId,
    });
    return DescribeUpdateResponse.fromJson(response_);
  }

  /// Lists the Amazon EKS clusters in your AWS account in the specified Region.
  ///
  /// [maxResults]: The maximum number of cluster results returned by
  /// `ListClusters` in paginated output. When you use this parameter,
  /// `ListClusters` returns only `maxResults` results in a single page along
  /// with a `nextToken` response element. You can see the remaining results of
  /// the initial request by sending another `ListClusters` request with the
  /// returned `nextToken` value. This value can be between 1 and 100. If you
  /// don't use this parameter, `ListClusters` returns up to 100 results and a
  /// `nextToken` value if applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListClusters` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<ListClustersResponse> listClusters(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListClusters', {
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListClustersResponse.fromJson(response_);
  }

  /// List the tags for an Amazon EKS resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// for which to list the tags. Currently, the supported resources are Amazon
  /// EKS clusters.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Lists the updates associated with an Amazon EKS cluster in your AWS
  /// account, in the specified Region.
  ///
  /// [name]: The name of the Amazon EKS cluster to list updates for.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListUpdates` request where `maxResults` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value.
  ///
  /// [maxResults]: The maximum number of update results returned by
  /// `ListUpdates` in paginated output. When you use this parameter,
  /// `ListUpdates` returns only `maxResults` results in a single page along
  /// with a `nextToken` response element. You can see the remaining results of
  /// the initial request by sending another `ListUpdates` request with the
  /// returned `nextToken` value. This value can be between 1 and 100. If you
  /// don't use this parameter, `ListUpdates` returns up to 100 results and a
  /// `nextToken` value if applicable.
  Future<ListUpdatesResponse> listUpdates(String name,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListUpdates', {
      'name': name,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListUpdatesResponse.fromJson(response_);
  }

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to which to
  /// add tags. Currently, the supported resources are Amazon EKS clusters.
  ///
  /// [tags]: The tags to add to the resource. A tag is an array of key-value
  /// pairs.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Deletes specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource from which
  /// to delete tags. Currently, the supported resources are Amazon EKS
  /// clusters.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Updates an Amazon EKS cluster configuration. Your cluster continues to
  /// function during the update. The response output includes an update ID that
  /// you can use to track the status of your cluster update with the
  /// DescribeUpdate API operation.
  ///
  /// You can use this API operation to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see
  /// [Amazon EKS Cluster Control Plane Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see
  /// [Amazon CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// You can also use this API operation to enable or disable public and
  /// private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see
  /// [Amazon EKS Cluster Endpoint Access Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  At this time, you can not update the subnets or security group IDs for an
  /// existing cluster.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to `UPDATING` (this
  /// status transition is eventually consistent). When the update is complete
  /// (either `Failed` or `Successful`), the cluster status moves to `Active`.
  ///
  /// [name]: The name of the Amazon EKS cluster to update.
  ///
  /// [logging]: Enable or disable exporting the Kubernetes control plane logs
  /// for your cluster to CloudWatch Logs. By default, cluster control plane
  /// logs aren't exported to CloudWatch Logs. For more information, see
  /// [Amazon EKS Cluster Control Plane Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///
  ///
  /// CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see
  /// [Amazon CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  Future<UpdateClusterConfigResponse> updateClusterConfig(String name,
      {VpcConfigRequest resourcesVpcConfig,
      Logging logging,
      String clientRequestToken}) async {
    var response_ = await _client.send('UpdateClusterConfig', {
      'name': name,
      if (resourcesVpcConfig != null) 'resourcesVpcConfig': resourcesVpcConfig,
      if (logging != null) 'logging': logging,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return UpdateClusterConfigResponse.fromJson(response_);
  }

  /// Updates an Amazon EKS cluster to the specified Kubernetes version. Your
  /// cluster continues to function during the update. The response output
  /// includes an update ID that you can use to track the status of your cluster
  /// update with the DescribeUpdate API operation.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to `UPDATING` (this
  /// status transition is eventually consistent). When the update is complete
  /// (either `Failed` or `Successful`), the cluster status moves to `Active`.
  ///
  /// [name]: The name of the Amazon EKS cluster to update.
  ///
  /// [version]: The desired Kubernetes version following a successful update.
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  Future<UpdateClusterVersionResponse> updateClusterVersion(
      {@required String name,
      @required String version,
      String clientRequestToken}) async {
    var response_ = await _client.send('UpdateClusterVersion', {
      'name': name,
      'version': version,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
    });
    return UpdateClusterVersionResponse.fromJson(response_);
  }
}

/// An object representing the `certificate-authority-data` for your cluster.
class Certificate {
  /// The Base64-encoded certificate data required to communicate with your
  /// cluster. Add this to the `certificate-authority-data` section of the
  /// `kubeconfig` file for your cluster.
  final String data;

  Certificate({
    this.data,
  });
  static Certificate fromJson(Map<String, dynamic> json) => Certificate(
        data: json.containsKey('data') ? json['data'] as String : null,
      );
}

/// An object representing an Amazon EKS cluster.
class Cluster {
  /// The name of the cluster.
  final String name;

  /// The Amazon Resource Name (ARN) of the cluster.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the cluster was created.
  final DateTime createdAt;

  /// The Kubernetes server version for the cluster.
  final String version;

  /// The endpoint for your Kubernetes API server.
  final String endpoint;

  /// The Amazon Resource Name (ARN) of the IAM role that provides permissions
  /// for the Kubernetes control plane to make calls to AWS API operations on
  /// your behalf.
  final String roleArn;

  /// The VPC configuration used by the cluster control plane. Amazon EKS VPC
  /// resources have specific requirements to work properly with Kubernetes. For
  /// more information, see
  /// [Cluster VPC Considerations](https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html)
  /// and
  /// [Cluster Security Group Considerations](https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html)
  /// in the _Amazon EKS User Guide_.
  final VpcConfigResponse resourcesVpcConfig;

  /// The logging configuration for your cluster.
  final Logging logging;

  /// The identity provider information for the cluster.
  final Identity identity;

  /// The current status of the cluster.
  final String status;

  /// The `certificate-authority-data` for your cluster.
  final Certificate certificateAuthority;

  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientRequestToken;

  /// The platform version of your Amazon EKS cluster. For more information, see
  /// [Platform Versions](https://docs.aws.amazon.com/eks/latest/userguide/platform-versions.html)
  /// in the  __Amazon EKS User Guide__ .
  final String platformVersion;

  /// The metadata that you apply to the cluster to assist with categorization
  /// and organization. Each tag consists of a key and an optional value, both
  /// of which you define.
  final Map<String, String> tags;

  Cluster({
    this.name,
    this.arn,
    this.createdAt,
    this.version,
    this.endpoint,
    this.roleArn,
    this.resourcesVpcConfig,
    this.logging,
    this.identity,
    this.status,
    this.certificateAuthority,
    this.clientRequestToken,
    this.platformVersion,
    this.tags,
  });
  static Cluster fromJson(Map<String, dynamic> json) => Cluster(
        name: json.containsKey('name') ? json['name'] as String : null,
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        version: json.containsKey('version') ? json['version'] as String : null,
        endpoint:
            json.containsKey('endpoint') ? json['endpoint'] as String : null,
        roleArn: json.containsKey('roleArn') ? json['roleArn'] as String : null,
        resourcesVpcConfig: json.containsKey('resourcesVpcConfig')
            ? VpcConfigResponse.fromJson(json['resourcesVpcConfig'])
            : null,
        logging: json.containsKey('logging')
            ? Logging.fromJson(json['logging'])
            : null,
        identity: json.containsKey('identity')
            ? Identity.fromJson(json['identity'])
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        certificateAuthority: json.containsKey('certificateAuthority')
            ? Certificate.fromJson(json['certificateAuthority'])
            : null,
        clientRequestToken: json.containsKey('clientRequestToken')
            ? json['clientRequestToken'] as String
            : null,
        platformVersion: json.containsKey('platformVersion')
            ? json['platformVersion'] as String
            : null,
        tags: json.containsKey('tags')
            ? (json['tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

class CreateClusterResponse {
  /// The full description of your new cluster.
  final Cluster cluster;

  CreateClusterResponse({
    this.cluster,
  });
  static CreateClusterResponse fromJson(Map<String, dynamic> json) =>
      CreateClusterResponse(
        cluster: json.containsKey('cluster')
            ? Cluster.fromJson(json['cluster'])
            : null,
      );
}

class DeleteClusterResponse {
  /// The full description of the cluster to delete.
  final Cluster cluster;

  DeleteClusterResponse({
    this.cluster,
  });
  static DeleteClusterResponse fromJson(Map<String, dynamic> json) =>
      DeleteClusterResponse(
        cluster: json.containsKey('cluster')
            ? Cluster.fromJson(json['cluster'])
            : null,
      );
}

class DescribeClusterResponse {
  /// The full description of your specified cluster.
  final Cluster cluster;

  DescribeClusterResponse({
    this.cluster,
  });
  static DescribeClusterResponse fromJson(Map<String, dynamic> json) =>
      DescribeClusterResponse(
        cluster: json.containsKey('cluster')
            ? Cluster.fromJson(json['cluster'])
            : null,
      );
}

class DescribeUpdateResponse {
  /// The full description of the specified update.
  final Update update;

  DescribeUpdateResponse({
    this.update,
  });
  static DescribeUpdateResponse fromJson(Map<String, dynamic> json) =>
      DescribeUpdateResponse(
        update:
            json.containsKey('update') ? Update.fromJson(json['update']) : null,
      );
}

/// An object representing an error when an asynchronous operation fails.
class ErrorDetail {
  /// A brief description of the error.
  ///
  /// *    **SubnetNotFound**: We couldn't find one of the subnets associated
  /// with the cluster.
  ///
  /// *    **SecurityGroupNotFound**: We couldn't find one of the security
  /// groups associated with the cluster.
  ///
  /// *    **EniLimitReached**: You have reached the elastic network interface
  /// limit for your account.
  ///
  /// *    **IpNotAvailable**: A subnet associated with the cluster doesn't have
  /// any free IP addresses.
  ///
  /// *    **AccessDenied**: You don't have permissions to perform the specified
  /// operation.
  ///
  /// *    **OperationNotPermitted**: The service role associated with the
  /// cluster doesn't have the required access permissions for Amazon EKS.
  ///
  /// *    **VpcIdNotFound**: We couldn't find the VPC associated with the
  /// cluster.
  final String errorCode;

  /// A more complete description of the error.
  final String errorMessage;

  /// An optional field that contains the resource IDs associated with the
  /// error.
  final List<String> resourceIds;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
    this.resourceIds,
  });
  static ErrorDetail fromJson(Map<String, dynamic> json) => ErrorDetail(
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
        resourceIds: json.containsKey('resourceIds')
            ? (json['resourceIds'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// An object representing an identity provider for authentication credentials.
class Identity {
  /// The [OpenID Connect](https://openid.net/connect/) identity provider
  /// information for the cluster.
  final Oidc oidc;

  Identity({
    this.oidc,
  });
  static Identity fromJson(Map<String, dynamic> json) => Identity(
        oidc: json.containsKey('oidc') ? Oidc.fromJson(json['oidc']) : null,
      );
}

class ListClustersResponse {
  /// A list of all of the clusters for your account in the specified Region.
  final List<String> clusters;

  /// The `nextToken` value to include in a future `ListClusters` request. When
  /// the results of a `ListClusters` request exceed `maxResults`, you can use
  /// this value to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  ListClustersResponse({
    this.clusters,
    this.nextToken,
  });
  static ListClustersResponse fromJson(Map<String, dynamic> json) =>
      ListClustersResponse(
        clusters: json.containsKey('clusters')
            ? (json['clusters'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
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

class ListUpdatesResponse {
  /// A list of all the updates for the specified cluster and Region.
  final List<String> updateIds;

  /// The `nextToken` value to include in a future `ListUpdates` request. When
  /// the results of a `ListUpdates` request exceed `maxResults`, you can use
  /// this value to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  ListUpdatesResponse({
    this.updateIds,
    this.nextToken,
  });
  static ListUpdatesResponse fromJson(Map<String, dynamic> json) =>
      ListUpdatesResponse(
        updateIds: json.containsKey('updateIds')
            ? (json['updateIds'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// An object representing the enabled or disabled Kubernetes control plane logs
/// for your cluster.
class LogSetup {
  /// The available cluster control plane log types.
  final List<String> types;

  /// If a log type is enabled, that log type exports its control plane logs to
  /// CloudWatch Logs. If a log type isn't enabled, that log type doesn't export
  /// its control plane logs. Each individual log type can be enabled or
  /// disabled independently.
  final bool enabled;

  LogSetup({
    this.types,
    this.enabled,
  });
  static LogSetup fromJson(Map<String, dynamic> json) => LogSetup(
        types: json.containsKey('types')
            ? (json['types'] as List).map((e) => e as String).toList()
            : null,
        enabled: json.containsKey('enabled') ? json['enabled'] as bool : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the logging configuration for resources in your
/// cluster.
class Logging {
  /// The cluster control plane logging configuration for your cluster.
  final List<LogSetup> clusterLogging;

  Logging({
    this.clusterLogging,
  });
  static Logging fromJson(Map<String, dynamic> json) => Logging(
        clusterLogging: json.containsKey('clusterLogging')
            ? (json['clusterLogging'] as List)
                .map((e) => LogSetup.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the [OpenID Connect](https://openid.net/connect/)
/// identity provider information for the cluster.
class Oidc {
  /// The issuer URL for the OpenID Connect identity provider.
  final String issuer;

  Oidc({
    this.issuer,
  });
  static Oidc fromJson(Map<String, dynamic> json) => Oidc(
        issuer: json.containsKey('issuer') ? json['issuer'] as String : null,
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

/// An object representing an asynchronous update.
class Update {
  /// A UUID that is used to track the update.
  final String id;

  /// The current status of the update.
  final String status;

  /// The type of the update.
  final String type;

  /// A key-value map that contains the parameters associated with the update.
  final List<UpdateParam> params;

  /// The Unix epoch timestamp in seconds for when the update was created.
  final DateTime createdAt;

  /// Any errors associated with a `Failed` update.
  final List<ErrorDetail> errors;

  Update({
    this.id,
    this.status,
    this.type,
    this.params,
    this.createdAt,
    this.errors,
  });
  static Update fromJson(Map<String, dynamic> json) => Update(
        id: json.containsKey('id') ? json['id'] as String : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        type: json.containsKey('type') ? json['type'] as String : null,
        params: json.containsKey('params')
            ? (json['params'] as List)
                .map((e) => UpdateParam.fromJson(e))
                .toList()
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        errors: json.containsKey('errors')
            ? (json['errors'] as List)
                .map((e) => ErrorDetail.fromJson(e))
                .toList()
            : null,
      );
}

class UpdateClusterConfigResponse {
  final Update update;

  UpdateClusterConfigResponse({
    this.update,
  });
  static UpdateClusterConfigResponse fromJson(Map<String, dynamic> json) =>
      UpdateClusterConfigResponse(
        update:
            json.containsKey('update') ? Update.fromJson(json['update']) : null,
      );
}

class UpdateClusterVersionResponse {
  /// The full description of the specified update
  final Update update;

  UpdateClusterVersionResponse({
    this.update,
  });
  static UpdateClusterVersionResponse fromJson(Map<String, dynamic> json) =>
      UpdateClusterVersionResponse(
        update:
            json.containsKey('update') ? Update.fromJson(json['update']) : null,
      );
}

/// An object representing the details of an update request.
class UpdateParam {
  /// The keys associated with an update request.
  final String type;

  /// The value of the keys submitted as part of an update request.
  final String value;

  UpdateParam({
    this.type,
    this.value,
  });
  static UpdateParam fromJson(Map<String, dynamic> json) => UpdateParam(
        type: json.containsKey('type') ? json['type'] as String : null,
        value: json.containsKey('value') ? json['value'] as String : null,
      );
}

/// An object representing the VPC configuration to use for an Amazon EKS
/// cluster.
class VpcConfigRequest {
  /// Specify subnets for your Amazon EKS worker nodes. Amazon EKS creates
  /// cross-account elastic network interfaces in these subnets to allow
  /// communication between your worker nodes and the Kubernetes control plane.
  final List<String> subnetIds;

  /// Specify one or more security groups for the cross-account elastic network
  /// interfaces that Amazon EKS creates to use to allow communication between
  /// your worker nodes and the Kubernetes control plane. If you don't specify a
  /// security group, the default security group for your VPC is used.
  final List<String> securityGroupIds;

  /// Set this value to `false` to disable public access for your cluster's
  /// Kubernetes API server endpoint. If you disable public access, your
  /// cluster's Kubernetes API server can receive only requests from within the
  /// cluster VPC. The default value for this parameter is `true`, which enables
  /// public access for your Kubernetes API server. For more information, see
  /// [Amazon EKS Cluster Endpoint Access Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  final bool endpointPublicAccess;

  /// Set this value to `true` to enable private access for your cluster's
  /// Kubernetes API server endpoint. If you enable private access, Kubernetes
  /// API requests from within your cluster's VPC use the private VPC endpoint.
  /// The default value for this parameter is `false`, which disables private
  /// access for your Kubernetes API server. For more information, see
  /// [Amazon EKS Cluster Endpoint Access Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  final bool endpointPrivateAccess;

  VpcConfigRequest({
    this.subnetIds,
    this.securityGroupIds,
    this.endpointPublicAccess,
    this.endpointPrivateAccess,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing an Amazon EKS cluster VPC configuration response.
class VpcConfigResponse {
  /// The subnets associated with your cluster.
  final List<String> subnetIds;

  /// The security groups associated with the cross-account elastic network
  /// interfaces that are used to allow communication between your worker nodes
  /// and the Kubernetes control plane.
  final List<String> securityGroupIds;

  /// The VPC associated with your cluster.
  final String vpcId;

  /// This parameter indicates whether the Amazon EKS public API server endpoint
  /// is enabled. If the Amazon EKS public API server endpoint is disabled, your
  /// cluster's Kubernetes API server can receive only requests that originate
  /// from within the cluster VPC.
  final bool endpointPublicAccess;

  /// This parameter indicates whether the Amazon EKS private API server
  /// endpoint is enabled. If the Amazon EKS private API server endpoint is
  /// enabled, Kubernetes API requests that originate from within your cluster's
  /// VPC use the private VPC endpoint instead of traversing the internet.
  final bool endpointPrivateAccess;

  VpcConfigResponse({
    this.subnetIds,
    this.securityGroupIds,
    this.vpcId,
    this.endpointPublicAccess,
    this.endpointPrivateAccess,
  });
  static VpcConfigResponse fromJson(Map<String, dynamic> json) =>
      VpcConfigResponse(
        subnetIds: json.containsKey('subnetIds')
            ? (json['subnetIds'] as List).map((e) => e as String).toList()
            : null,
        securityGroupIds: json.containsKey('securityGroupIds')
            ? (json['securityGroupIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        vpcId: json.containsKey('vpcId') ? json['vpcId'] as String : null,
        endpointPublicAccess: json.containsKey('endpointPublicAccess')
            ? json['endpointPublicAccess'] as bool
            : null,
        endpointPrivateAccess: json.containsKey('endpointPrivateAccess')
            ? json['endpointPrivateAccess'] as bool
            : null,
      );
}
