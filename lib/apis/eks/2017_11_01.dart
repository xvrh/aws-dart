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
  /// enabled, and private access is disabled. For more information, see [Amazon
  /// EKS Cluster Endpoint Access
  /// Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  /// You can use the `logging` parameter to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see [Amazon EKS Cluster Control Plane
  /// Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see [Amazon
  /// CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// Cluster creation typically takes between 10 and 15 minutes. After you
  /// create an Amazon EKS cluster, you must configure your Kubernetes tooling
  /// to communicate with the API server and launch worker nodes into your
  /// cluster. For more information, see [Managing Cluster
  /// Authentication](https://docs.aws.amazon.com/eks/latest/userguide/managing-auth.html)
  /// and [Launching Amazon EKS Worker
  /// Nodes](https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html)
  /// in the _Amazon EKS User Guide_.
  Future<void> createCluster(
      {@required String name,
      String version,
      @required String roleArn,
      @required VpcConfigRequest resourcesVpcConfig,
      Logging logging,
      String clientRequestToken,
      Map<String, String> tags}) async {}

  /// Deletes the Amazon EKS cluster control plane.
  ///
  ///
  ///
  /// If you have active services in your cluster that are associated with a
  /// load balancer, you must delete those services before deleting the cluster
  /// so that the load balancers are deleted properly. Otherwise, you can have
  /// orphaned resources in your VPC that prevent you from being able to delete
  /// the VPC. For more information, see [Deleting a
  /// Cluster](https://docs.aws.amazon.com/eks/latest/userguide/delete-cluster.html)
  /// in the _Amazon EKS User Guide_.
  Future<void> deleteCluster(String name) async {}

  /// Returns descriptive information about an Amazon EKS cluster.
  ///
  /// The API server endpoint and certificate authority data returned by this
  /// operation are required for `kubelet` and `kubectl` to communicate with
  /// your Kubernetes API server. For more information, see [Create a kubeconfig
  /// for Amazon
  /// EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html).
  ///
  ///
  ///
  /// The API server endpoint and certificate authority data aren't available
  /// until the cluster reaches the `ACTIVE` state.
  Future<void> describeCluster(String name) async {}

  /// Returns descriptive information about an update against your Amazon EKS
  /// cluster.
  ///
  /// When the status of the update is `Succeeded`, the update is complete. If
  /// an update fails, the status is `Failed`, and an error detail explains the
  /// reason for the failure.
  Future<void> describeUpdate(
      {@required String name, @required String updateId}) async {}

  /// Lists the Amazon EKS clusters in your AWS account in the specified Region.
  Future<void> listClusters({int maxResults, String nextToken}) async {}

  /// List the tags for an Amazon EKS resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Lists the updates associated with an Amazon EKS cluster in your AWS
  /// account, in the specified Region.
  Future<void> listUpdates(String name,
      {String nextToken, int maxResults}) async {}

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Deletes specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an Amazon EKS cluster configuration. Your cluster continues to
  /// function during the update. The response output includes an update ID that
  /// you can use to track the status of your cluster update with the
  /// DescribeUpdate API operation.
  ///
  /// You can use this API operation to enable or disable exporting the
  /// Kubernetes control plane logs for your cluster to CloudWatch Logs. By
  /// default, cluster control plane logs aren't exported to CloudWatch Logs.
  /// For more information, see [Amazon EKS Cluster Control Plane
  /// Logs](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  CloudWatch Logs ingestion, archive storage, and data scanning rates apply
  /// to exported control plane logs. For more information, see [Amazon
  /// CloudWatch Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// You can also use this API operation to enable or disable public and
  /// private access to your cluster's Kubernetes API server endpoint. By
  /// default, public access is enabled, and private access is disabled. For
  /// more information, see [Amazon EKS Cluster Endpoint Access
  /// Control](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)
  /// in the  __Amazon EKS User Guide__ .
  ///
  ///  At this time, you can not update the subnets or security group IDs for an
  /// existing cluster.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to `UPDATING` (this
  /// status transition is eventually consistent). When the update is complete
  /// (either `Failed` or `Successful`), the cluster status moves to `Active`.
  Future<void> updateClusterConfig(String name,
      {VpcConfigRequest resourcesVpcConfig,
      Logging logging,
      String clientRequestToken}) async {}

  /// Updates an Amazon EKS cluster to the specified Kubernetes version. Your
  /// cluster continues to function during the update. The response output
  /// includes an update ID that you can use to track the status of your cluster
  /// update with the DescribeUpdate API operation.
  ///
  /// Cluster updates are asynchronous, and they should finish within a few
  /// minutes. During an update, the cluster status moves to `UPDATING` (this
  /// status transition is eventually consistent). When the update is complete
  /// (either `Failed` or `Successful`), the cluster status moves to `Active`.
  Future<void> updateClusterVersion(
      {@required String name,
      @required String version,
      String clientRequestToken}) async {}
}

class Certificate {}

class Cluster {}

class CreateClusterResponse {}

class DeleteClusterResponse {}

class DescribeClusterResponse {}

class DescribeUpdateResponse {}

class ErrorDetail {}

class Identity {}

class ListClustersResponse {}

class ListTagsForResourceResponse {}

class ListUpdatesResponse {}

class LogSetup {}

class Logging {}

class Oidc {}

class TagResourceResponse {}

class UntagResourceResponse {}

class Update {}

class UpdateClusterConfigResponse {}

class UpdateClusterVersionResponse {}

class UpdateParam {}

class VpcConfigRequest {}

class VpcConfigResponse {}
