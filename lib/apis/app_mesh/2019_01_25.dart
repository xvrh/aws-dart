import 'package:meta/meta.dart';

/// AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy
/// to monitor and control microservices. App Mesh standardizes how your
/// microservices communicate, giving you end-to-end visibility and helping to
/// ensure high availability for your applications.
///
/// App Mesh gives you consistent visibility and network traffic controls for
/// every microservice in an application. You can use App Mesh with AWS Fargate,
/// Amazon ECS, Amazon EKS, Kubernetes on AWS, and Amazon EC2.
///
///
///
/// App Mesh supports microservice applications that use service discovery
/// naming for their components. For more information about service discovery on
/// Amazon ECS, see [Service
/// Discovery](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html)
/// in the _Amazon Elastic Container Service Developer Guide_. Kubernetes
/// `kube-dns` and `coredns` are supported. For more information, see [DNS for
/// Services and
/// Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// in the Kubernetes documentation.
class AppMeshApi {
  /// Creates a service mesh. A service mesh is a logical boundary for network
  /// traffic between the services that reside within it.
  ///
  /// After you create your service mesh, you can create virtual services,
  /// virtual nodes, virtual routers, and routes to distribute traffic between
  /// the applications in your mesh.
  Future<void> createMesh(String meshName,
      {String clientToken, MeshSpec spec, List<TagRef> tags}) async {}

  /// Creates a route that is associated with a virtual router.
  ///
  /// You can use the `prefix` parameter in your route specification for
  /// path-based routing of requests. For example, if your virtual service name
  /// is `my-service.local` and you want the route to match requests to
  /// `my-service.local/metrics`, your prefix should be `/metrics`.
  ///
  /// If your route matches a request, you can distribute traffic to one or more
  /// target virtual nodes with relative weighting.
  Future<void> createRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      List<TagRef> tags,
      @required String virtualRouterName}) async {}

  /// Creates a virtual node within a service mesh.
  ///
  /// A virtual node acts as a logical pointer to a particular task group, such
  /// as an Amazon ECS service or a Kubernetes deployment. When you create a
  /// virtual node, you can specify the service discovery information for your
  /// task group.
  ///
  /// Any inbound traffic that your virtual node expects should be specified as
  /// a `listener`. Any outbound traffic that your virtual node expects to reach
  /// should be specified as a `backend`.
  ///
  /// The response metadata for your new virtual node contains the `arn` that is
  /// associated with the virtual node. Set this value (either the full ARN or
  /// the truncated resource name: for example,
  /// `mesh/default/virtualNode/simpleapp`) as the `APPMESH\_VIRTUAL\_NODE_NAME`
  /// environment variable for your task group's Envoy proxy container in your
  /// task definition or pod spec. This is then mapped to the `node.id` and
  /// `node.cluster` Envoy parameters.
  ///
  ///
  ///
  /// If you require your Envoy stats or tracing to use a different name, you
  /// can override the `node.cluster` value that is set by
  /// `APPMESH\_VIRTUAL\_NODE_NAME` with the `APPMESH\_VIRTUAL\_NODE_CLUSTER`
  /// environment variable.
  Future<void> createVirtualNode(
      {String clientToken,
      @required String meshName,
      @required VirtualNodeSpec spec,
      List<TagRef> tags,
      @required String virtualNodeName}) async {}

  /// Creates a virtual router within a service mesh.
  ///
  /// Any inbound traffic that your virtual router expects should be specified
  /// as a `listener`.
  ///
  /// Virtual routers handle traffic for one or more virtual services within
  /// your mesh. After you create your virtual router, create and associate
  /// routes for your virtual router that direct incoming requests to different
  /// virtual nodes.
  Future<void> createVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      List<TagRef> tags,
      @required String virtualRouterName}) async {}

  /// Creates a virtual service within a service mesh.
  ///
  /// A virtual service is an abstraction of a real service that is provided by
  /// a virtual node directly or indirectly by means of a virtual router.
  /// Dependent services call your virtual service by its `virtualServiceName`,
  /// and those requests are routed to the virtual node or virtual router that
  /// is specified as the provider for the virtual service.
  Future<void> createVirtualService(
      {String clientToken,
      @required String meshName,
      @required VirtualServiceSpec spec,
      List<TagRef> tags,
      @required String virtualServiceName}) async {}

  /// Deletes an existing service mesh.
  ///
  /// You must delete all resources (virtual services, routes, virtual routers,
  /// and virtual nodes) in the service mesh before you can delete the mesh
  /// itself.
  Future<void> deleteMesh(String meshName) async {}

  /// Deletes an existing route.
  Future<void> deleteRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {}

  /// Deletes an existing virtual node.
  ///
  /// You must delete any virtual services that list a virtual node as a service
  /// provider before you can delete the virtual node itself.
  Future<void> deleteVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {}

  /// Deletes an existing virtual router.
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the router itself.
  Future<void> deleteVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {}

  /// Deletes an existing virtual service.
  Future<void> deleteVirtualService(
      {@required String meshName, @required String virtualServiceName}) async {}

  /// Describes an existing service mesh.
  Future<void> describeMesh(String meshName) async {}

  /// Describes an existing route.
  Future<void> describeRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {}

  /// Describes an existing virtual node.
  Future<void> describeVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {}

  /// Describes an existing virtual router.
  Future<void> describeVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {}

  /// Describes an existing virtual service.
  Future<void> describeVirtualService(
      {@required String meshName, @required String virtualServiceName}) async {}

  /// Returns a list of existing service meshes.
  Future<void> listMeshes({int limit, String nextToken}) async {}

  /// Returns a list of existing routes in a service mesh.
  Future<void> listRoutes(
      {int limit,
      @required String meshName,
      String nextToken,
      @required String virtualRouterName}) async {}

  /// List the tags for an App Mesh resource.
  Future<void> listTagsForResource(String resourceArn,
      {int limit, String nextToken}) async {}

  /// Returns a list of existing virtual nodes.
  Future<void> listVirtualNodes(String meshName,
      {int limit, String nextToken}) async {}

  /// Returns a list of existing virtual routers in a service mesh.
  Future<void> listVirtualRouters(String meshName,
      {int limit, String nextToken}) async {}

  /// Returns a list of existing virtual services in a service mesh.
  Future<void> listVirtualServices(String meshName,
      {int limit, String nextToken}) async {}

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource aren't specified in the
  /// request parameters, they aren't changed. When a resource is deleted, the
  /// tags associated with that resource are also deleted.
  Future<void> tagResource(
      {@required String resourceArn, @required List<TagRef> tags}) async {}

  /// Deletes specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates an existing service mesh.
  Future<void> updateMesh(String meshName,
      {String clientToken, MeshSpec spec}) async {}

  /// Updates an existing route for a specified service mesh and virtual router.
  Future<void> updateRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      @required String virtualRouterName}) async {}

  /// Updates an existing virtual node in a specified service mesh.
  Future<void> updateVirtualNode(
      {String clientToken,
      @required String meshName,
      @required VirtualNodeSpec spec,
      @required String virtualNodeName}) async {}

  /// Updates an existing virtual router in a specified service mesh.
  Future<void> updateVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      @required String virtualRouterName}) async {}

  /// Updates an existing virtual service in a specified service mesh.
  Future<void> updateVirtualService(
      {String clientToken,
      @required String meshName,
      @required VirtualServiceSpec spec,
      @required String virtualServiceName}) async {}
}

class VirtualRouterListener {}

class CreateVirtualNodeOutput {}

class Logging {}

class UpdateVirtualRouterOutput {}

class DescribeMeshOutput {}

class ListVirtualRoutersOutput {}

class DeleteRouteOutput {}

class ResourceMetadata {}

class UpdateVirtualNodeOutput {}

class ListRoutesOutput {}

class VirtualServiceBackend {}

class UpdateRouteOutput {}

class HttpRouteAction {}

class HealthCheckPolicy {}

class VirtualServiceRef {}

class EgressFilter {}

class VirtualNodeStatus {}

class VirtualRouterRef {}

class VirtualServiceData {}

class HttpRouteHeader {}

class DescribeVirtualServiceOutput {}

class VirtualNodeRef {}

class DescribeVirtualNodeOutput {}

class UpdateMeshOutput {}

class CreateRouteOutput {}

class DnsServiceDiscovery {}

class VirtualNodeData {}

class UntagResourceOutput {}

class AwsCloudMapInstanceAttribute {}

class VirtualServiceSpec {}

class Backend {}

class MatchRange {}

class TcpRoute {}

class VirtualRouterData {}

class AccessLog {}

class DescribeVirtualRouterOutput {}

class CreateMeshOutput {}

class CreateVirtualRouterOutput {}

class VirtualServiceStatus {}

class VirtualRouterSpec {}

class VirtualNodeSpec {}

class ListMeshesOutput {}

class Duration {}

class DescribeRouteOutput {}

class HttpRouteMatch {}

class TagRef {}

class MeshRef {}

class PortMapping {}

class MeshData {}

class VirtualRouterStatus {}

class ListVirtualServicesOutput {}

class WeightedTarget {}

class TcpRouteAction {}

class RouteStatus {}

class RouteRef {}

class Listener {}

class RouteData {}

class DeleteVirtualServiceOutput {}

class VirtualNodeServiceProvider {}

class HttpRetryPolicy {}

class TagResourceOutput {}

class HeaderMatchMethod {}

class DeleteMeshOutput {}

class VirtualServiceProvider {}

class AwsCloudMapServiceDiscovery {}

class UpdateVirtualServiceOutput {}

class MeshStatus {}

class RouteSpec {}

class HttpRoute {}

class MeshSpec {}

class CreateVirtualServiceOutput {}

class FileAccessLog {}

class VirtualRouterServiceProvider {}

class ListTagsForResourceOutput {}

class ServiceDiscovery {}

class ListVirtualNodesOutput {}

class DeleteVirtualRouterOutput {}

class DeleteVirtualNodeOutput {}
