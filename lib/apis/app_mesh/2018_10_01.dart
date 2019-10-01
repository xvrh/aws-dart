import 'package:meta/meta.dart';

/// AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy
/// to monitor and control containerized microservices. App Mesh standardizes
/// how your microservices communicate, giving you end-to-end visibility and
/// helping to ensure high-availability for your applications.
///
/// App Mesh gives you consistent visibility and network traffic controls for
/// every microservice in an application. You can use App Mesh with Amazon ECS
/// (using the Amazon EC2 launch type), Amazon EKS, and Kubernetes on AWS.
///
///
///
/// App Mesh supports containerized microservice applications that use service
/// discovery naming for their components. To use App Mesh, you must have a
/// containerized application running on Amazon EC2 instances, hosted in either
/// Amazon ECS, Amazon EKS, or Kubernetes on AWS. For more information about
/// service discovery on Amazon ECS, see [Service
/// Discovery](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html)
/// in the _Amazon Elastic Container Service Developer Guide_. Kubernetes
/// `kube-dns` is supported. For more information, see [DNS for Services and
/// Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// in the Kubernetes documentation.
class AppMeshApi {
  /// Creates a new service mesh. A service mesh is a logical boundary for
  /// network traffic between the services that reside within it.
  ///
  /// After you create your service mesh, you can create virtual nodes, virtual
  /// routers, and routes to distribute traffic between the applications in your
  /// mesh.
  Future<void> createMesh(String meshName, {String clientToken}) async {}

  /// Creates a new route that is associated with a virtual router.
  ///
  /// You can use the `prefix` parameter in your route specification for
  /// path-based routing of requests. For example, if your virtual router
  /// service name is `my-service.local`, and you want the route to match
  /// requests to `my-service.local/metrics`, then your prefix should be
  /// `/metrics`.
  ///
  /// If your route matches a request, you can distribute traffic to one or more
  /// target virtual nodes with relative weighting.
  Future<void> createRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      @required String virtualRouterName}) async {}

  /// Creates a new virtual node within a service mesh.
  ///
  /// A virtual node acts as logical pointer to a particular task group, such as
  /// an Amazon ECS service or a Kubernetes deployment. When you create a
  /// virtual node, you must specify the DNS service discovery name for your
  /// task group.
  ///
  /// Any inbound traffic that your virtual node expects should be specified as
  /// a `listener`. Any outbound traffic that your virtual node expects to reach
  /// should be specified as a `backend`.
  ///
  /// The response metadata for your new virtual node contains the `arn` that is
  /// associated with the virtual node. Set this value (either the full ARN or
  /// the truncated resource name, for example,
  /// `mesh/default/virtualNode/simpleapp`, as the `APPMESH\_VIRTUAL\_NODE_NAME`
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
      @required String virtualNodeName}) async {}

  /// Creates a new virtual router within a service mesh.
  ///
  /// Virtual routers handle traffic for one or more service names within your
  /// mesh. After you create your virtual router, create and associate routes
  /// for your virtual router that direct incoming requests to different virtual
  /// nodes.
  Future<void> createVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      @required String virtualRouterName}) async {}

  /// Deletes an existing service mesh.
  ///
  /// You must delete all resources (routes, virtual routers, virtual nodes) in
  /// the service mesh before you can delete the mesh itself.
  Future<void> deleteMesh(String meshName) async {}

  /// Deletes an existing route.
  Future<void> deleteRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {}

  /// Deletes an existing virtual node.
  Future<void> deleteVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {}

  /// Deletes an existing virtual router.
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the router itself.
  Future<void> deleteVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {}

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

  /// Returns a list of existing service meshes.
  Future<void> listMeshes({int limit, String nextToken}) async {}

  /// Returns a list of existing routes in a service mesh.
  Future<void> listRoutes(
      {int limit,
      @required String meshName,
      String nextToken,
      @required String virtualRouterName}) async {}

  /// Returns a list of existing virtual nodes.
  Future<void> listVirtualNodes(String meshName,
      {int limit, String nextToken}) async {}

  /// Returns a list of existing virtual routers in a service mesh.
  Future<void> listVirtualRouters(String meshName,
      {int limit, String nextToken}) async {}

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
}

class DeleteMeshOutput {}

class UpdateVirtualRouterOutput {}

class WeightedTarget {}

class CreateRouteOutput {}

class DnsServiceDiscovery {}

class VirtualNodeRef {}

class DescribeRouteOutput {}

class ServiceDiscovery {}

class MeshStatus {}

class VirtualNodeData {}

class VirtualNodeSpec {}

class MeshRef {}

class DescribeVirtualRouterOutput {}

class UpdateRouteOutput {}

class HttpRouteAction {}

class CreateVirtualRouterOutput {}

class RouteStatus {}

class VirtualRouterStatus {}

class ListMeshesOutput {}

class DescribeVirtualNodeOutput {}

class CreateMeshOutput {}

class RouteData {}

class HttpRoute {}

class ListRoutesOutput {}

class RouteSpec {}

class VirtualRouterRef {}

class ListVirtualNodesOutput {}

class DeleteVirtualNodeOutput {}

class ListVirtualRoutersOutput {}

class CreateVirtualNodeOutput {}

class DeleteVirtualRouterOutput {}

class ResourceMetadata {}

class PortMapping {}

class VirtualRouterSpec {}

class DescribeMeshOutput {}

class VirtualRouterData {}

class Listener {}

class HealthCheckPolicy {}

class MeshData {}

class HttpRouteMatch {}

class DeleteRouteOutput {}

class VirtualNodeStatus {}

class RouteRef {}

class UpdateVirtualNodeOutput {}
