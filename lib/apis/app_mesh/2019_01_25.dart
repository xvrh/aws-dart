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
/// Amazon ECS, see
/// [Service Discovery](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html)
/// in the _Amazon Elastic Container Service Developer Guide_. Kubernetes
/// `kube-dns` and `coredns` are supported. For more information, see
/// [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// in the Kubernetes documentation.
class AppMeshApi {
  /// Creates a service mesh. A service mesh is a logical boundary for network
  /// traffic between the services that reside within it.
  ///
  /// After you create your service mesh, you can create virtual services,
  /// virtual nodes, virtual routers, and routes to distribute traffic between
  /// the applications in your mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name to use for the service mesh.
  ///
  /// [spec]: The service mesh specification to apply.
  ///
  /// [tags]: Optional metadata that you can apply to the service mesh to assist
  /// with categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateMeshOutput> createMesh(String meshName,
      {String clientToken, MeshSpec spec, List<TagRef> tags}) async {
    return CreateMeshOutput.fromJson({});
  }

  /// Creates a route that is associated with a virtual router.
  ///
  /// You can use the `prefix` parameter in your route specification for
  /// path-based routing of requests. For example, if your virtual service name
  /// is `my-service.local` and you want the route to match requests to
  /// `my-service.local/metrics`, your prefix should be `/metrics`.
  ///
  /// If your route matches a request, you can distribute traffic to one or more
  /// target virtual nodes with relative weighting.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh to create the route in.
  ///
  /// [routeName]: The name to use for the route.
  ///
  /// [spec]: The route specification to apply.
  ///
  /// [tags]: Optional metadata that you can apply to the route to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  ///
  /// [virtualRouterName]: The name of the virtual router in which to create the
  /// route.
  Future<CreateRouteOutput> createRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      List<TagRef> tags,
      @required String virtualRouterName}) async {
    return CreateRouteOutput.fromJson({});
  }

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
  /// `mesh/default/virtualNode/simpleapp`) as the `APPMESH_VIRTUAL_NODE_NAME`
  /// environment variable for your task group's Envoy proxy container in your
  /// task definition or pod spec. This is then mapped to the `node.id` and
  /// `node.cluster` Envoy parameters.
  ///
  ///
  ///
  /// If you require your Envoy stats or tracing to use a different name, you
  /// can override the `node.cluster` value that is set by
  /// `APPMESH_VIRTUAL_NODE_NAME` with the `APPMESH_VIRTUAL_NODE_CLUSTER`
  /// environment variable.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh to create the virtual node in.
  ///
  /// [spec]: The virtual node specification to apply.
  ///
  /// [tags]: Optional metadata that you can apply to the virtual node to assist
  /// with categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  ///
  /// [virtualNodeName]: The name to use for the virtual node.
  Future<CreateVirtualNodeOutput> createVirtualNode(
      {String clientToken,
      @required String meshName,
      @required VirtualNodeSpec spec,
      List<TagRef> tags,
      @required String virtualNodeName}) async {
    return CreateVirtualNodeOutput.fromJson({});
  }

  /// Creates a virtual router within a service mesh.
  ///
  /// Any inbound traffic that your virtual router expects should be specified
  /// as a `listener`.
  ///
  /// Virtual routers handle traffic for one or more virtual services within
  /// your mesh. After you create your virtual router, create and associate
  /// routes for your virtual router that direct incoming requests to different
  /// virtual nodes.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh to create the virtual router in.
  ///
  /// [spec]: The virtual router specification to apply.
  ///
  /// [tags]: Optional metadata that you can apply to the virtual router to
  /// assist with categorization and organization. Each tag consists of a key
  /// and an optional value, both of which you define. Tag keys can have a
  /// maximum character length of 128 characters, and tag values can have a
  /// maximum length of 256 characters.
  ///
  /// [virtualRouterName]: The name to use for the virtual router.
  Future<CreateVirtualRouterOutput> createVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      List<TagRef> tags,
      @required String virtualRouterName}) async {
    return CreateVirtualRouterOutput.fromJson({});
  }

  /// Creates a virtual service within a service mesh.
  ///
  /// A virtual service is an abstraction of a real service that is provided by
  /// a virtual node directly or indirectly by means of a virtual router.
  /// Dependent services call your virtual service by its `virtualServiceName`,
  /// and those requests are routed to the virtual node or virtual router that
  /// is specified as the provider for the virtual service.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh to create the virtual service in.
  ///
  /// [spec]: The virtual service specification to apply.
  ///
  /// [tags]: Optional metadata that you can apply to the virtual service to
  /// assist with categorization and organization. Each tag consists of a key
  /// and an optional value, both of which you define. Tag keys can have a
  /// maximum character length of 128 characters, and tag values can have a
  /// maximum length of 256 characters.
  ///
  /// [virtualServiceName]: The name to use for the virtual service.
  Future<CreateVirtualServiceOutput> createVirtualService(
      {String clientToken,
      @required String meshName,
      @required VirtualServiceSpec spec,
      List<TagRef> tags,
      @required String virtualServiceName}) async {
    return CreateVirtualServiceOutput.fromJson({});
  }

  /// Deletes an existing service mesh.
  ///
  /// You must delete all resources (virtual services, routes, virtual routers,
  /// and virtual nodes) in the service mesh before you can delete the mesh
  /// itself.
  ///
  /// [meshName]: The name of the service mesh to delete.
  Future<DeleteMeshOutput> deleteMesh(String meshName) async {
    return DeleteMeshOutput.fromJson({});
  }

  /// Deletes an existing route.
  ///
  /// [meshName]: The name of the service mesh to delete the route in.
  ///
  /// [routeName]: The name of the route to delete.
  ///
  /// [virtualRouterName]: The name of the virtual router to delete the route
  /// in.
  Future<DeleteRouteOutput> deleteRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {
    return DeleteRouteOutput.fromJson({});
  }

  /// Deletes an existing virtual node.
  ///
  /// You must delete any virtual services that list a virtual node as a service
  /// provider before you can delete the virtual node itself.
  ///
  /// [meshName]: The name of the service mesh to delete the virtual node in.
  ///
  /// [virtualNodeName]: The name of the virtual node to delete.
  Future<DeleteVirtualNodeOutput> deleteVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {
    return DeleteVirtualNodeOutput.fromJson({});
  }

  /// Deletes an existing virtual router.
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the router itself.
  ///
  /// [meshName]: The name of the service mesh to delete the virtual router in.
  ///
  /// [virtualRouterName]: The name of the virtual router to delete.
  Future<DeleteVirtualRouterOutput> deleteVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {
    return DeleteVirtualRouterOutput.fromJson({});
  }

  /// Deletes an existing virtual service.
  ///
  /// [meshName]: The name of the service mesh to delete the virtual service in.
  ///
  /// [virtualServiceName]: The name of the virtual service to delete.
  Future<DeleteVirtualServiceOutput> deleteVirtualService(
      {@required String meshName, @required String virtualServiceName}) async {
    return DeleteVirtualServiceOutput.fromJson({});
  }

  /// Describes an existing service mesh.
  ///
  /// [meshName]: The name of the service mesh to describe.
  Future<DescribeMeshOutput> describeMesh(String meshName) async {
    return DescribeMeshOutput.fromJson({});
  }

  /// Describes an existing route.
  ///
  /// [meshName]: The name of the service mesh that the route resides in.
  ///
  /// [routeName]: The name of the route to describe.
  ///
  /// [virtualRouterName]: The name of the virtual router that the route is
  /// associated with.
  Future<DescribeRouteOutput> describeRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {
    return DescribeRouteOutput.fromJson({});
  }

  /// Describes an existing virtual node.
  ///
  /// [meshName]: The name of the service mesh that the virtual node resides in.
  ///
  /// [virtualNodeName]: The name of the virtual node to describe.
  Future<DescribeVirtualNodeOutput> describeVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {
    return DescribeVirtualNodeOutput.fromJson({});
  }

  /// Describes an existing virtual router.
  ///
  /// [meshName]: The name of the service mesh that the virtual router resides
  /// in.
  ///
  /// [virtualRouterName]: The name of the virtual router to describe.
  Future<DescribeVirtualRouterOutput> describeVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {
    return DescribeVirtualRouterOutput.fromJson({});
  }

  /// Describes an existing virtual service.
  ///
  /// [meshName]: The name of the service mesh that the virtual service resides
  /// in.
  ///
  /// [virtualServiceName]: The name of the virtual service to describe.
  Future<DescribeVirtualServiceOutput> describeVirtualService(
      {@required String meshName, @required String virtualServiceName}) async {
    return DescribeVirtualServiceOutput.fromJson({});
  }

  /// Returns a list of existing service meshes.
  ///
  /// [limit]: The maximum number of results returned by `ListMeshes` in
  /// paginated output. When you use this parameter, `ListMeshes` returns only
  /// `limit` results in a single page along with a `nextToken` response
  /// element. You can see the remaining results of the initial request by
  /// sending another `ListMeshes` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If you don't use this parameter,
  /// `ListMeshes` returns up to 100 results and a `nextToken` value if
  /// applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListMeshes` request where `limit` was used and the results exceeded the
  /// value of that parameter. Pagination continues from the end of the previous
  /// results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<ListMeshesOutput> listMeshes({int limit, String nextToken}) async {
    return ListMeshesOutput.fromJson({});
  }

  /// Returns a list of existing routes in a service mesh.
  ///
  /// [limit]: The maximum number of results returned by `ListRoutes` in
  /// paginated output. When you use this parameter, `ListRoutes` returns only
  /// `limit` results in a single page along with a `nextToken` response
  /// element. You can see the remaining results of the initial request by
  /// sending another `ListRoutes` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If you don't use this parameter,
  /// `ListRoutes` returns up to 100 results and a `nextToken` value if
  /// applicable.
  ///
  /// [meshName]: The name of the service mesh to list routes in.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListRoutes` request where `limit` was used and the results exceeded the
  /// value of that parameter. Pagination continues from the end of the previous
  /// results that returned the `nextToken` value.
  ///
  /// [virtualRouterName]: The name of the virtual router to list routes in.
  Future<ListRoutesOutput> listRoutes(
      {int limit,
      @required String meshName,
      String nextToken,
      @required String virtualRouterName}) async {
    return ListRoutesOutput.fromJson({});
  }

  /// List the tags for an App Mesh resource.
  ///
  /// [limit]: The maximum number of tag results returned by
  /// `ListTagsForResource` in paginated output. When this parameter is used,
  /// `ListTagsForResource` returns only `limit` results in a single page along
  /// with a `nextToken` response element. You can see the remaining results of
  /// the initial request by sending another `ListTagsForResource` request with
  /// the returned `nextToken` value. This value can be between 1 and 100. If
  /// you don't use this parameter, `ListTagsForResource` returns up to 100
  /// results and a `nextToken` value if applicable.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListTagsForResource` request where `limit` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// to list the tags for.
  Future<ListTagsForResourceOutput> listTagsForResource(String resourceArn,
      {int limit, String nextToken}) async {
    return ListTagsForResourceOutput.fromJson({});
  }

  /// Returns a list of existing virtual nodes.
  ///
  /// [limit]: The maximum number of results returned by `ListVirtualNodes` in
  /// paginated output. When you use this parameter, `ListVirtualNodes` returns
  /// only `limit` results in a single page along with a `nextToken` response
  /// element. You can see the remaining results of the initial request by
  /// sending another `ListVirtualNodes` request with the returned `nextToken`
  /// value. This value can be between 1 and 100. If you don't use this
  /// parameter, `ListVirtualNodes` returns up to 100 results and a `nextToken`
  /// value if applicable.
  ///
  /// [meshName]: The name of the service mesh to list virtual nodes in.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListVirtualNodes` request where `limit` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value.
  Future<ListVirtualNodesOutput> listVirtualNodes(String meshName,
      {int limit, String nextToken}) async {
    return ListVirtualNodesOutput.fromJson({});
  }

  /// Returns a list of existing virtual routers in a service mesh.
  ///
  /// [limit]: The maximum number of results returned by `ListVirtualRouters` in
  /// paginated output. When you use this parameter, `ListVirtualRouters`
  /// returns only `limit` results in a single page along with a `nextToken`
  /// response element. You can see the remaining results of the initial request
  /// by sending another `ListVirtualRouters` request with the returned
  /// `nextToken` value. This value can be between 1 and 100. If you don't use
  /// this parameter, `ListVirtualRouters` returns up to 100 results and a
  /// `nextToken` value if applicable.
  ///
  /// [meshName]: The name of the service mesh to list virtual routers in.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListVirtualRouters` request where `limit` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  Future<ListVirtualRoutersOutput> listVirtualRouters(String meshName,
      {int limit, String nextToken}) async {
    return ListVirtualRoutersOutput.fromJson({});
  }

  /// Returns a list of existing virtual services in a service mesh.
  ///
  /// [limit]: The maximum number of results returned by `ListVirtualServices`
  /// in paginated output. When you use this parameter, `ListVirtualServices`
  /// returns only `limit` results in a single page along with a `nextToken`
  /// response element. You can see the remaining results of the initial request
  /// by sending another `ListVirtualServices` request with the returned
  /// `nextToken` value. This value can be between 1 and 100. If you don't use
  /// this parameter, `ListVirtualServices` returns up to 100 results and a
  /// `nextToken` value if applicable.
  ///
  /// [meshName]: The name of the service mesh to list virtual services in.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListVirtualServices` request where `limit` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  Future<ListVirtualServicesOutput> listVirtualServices(String meshName,
      {int limit, String nextToken}) async {
    return ListVirtualServicesOutput.fromJson({});
  }

  /// Associates the specified tags to a resource with the specified
  /// `resourceArn`. If existing tags on a resource aren't specified in the
  /// request parameters, they aren't changed. When a resource is deleted, the
  /// tags associated with that resource are also deleted.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to add tags
  /// to.
  ///
  /// [tags]: The tags to add to the resource. A tag is an array of key-value
  /// pairs. Tag keys can have a maximum character length of 128 characters, and
  /// tag values can have a maximum length of 256 characters.
  Future<TagResourceOutput> tagResource(
      {@required String resourceArn, @required List<TagRef> tags}) async {
    return TagResourceOutput.fromJson({});
  }

  /// Deletes specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource to delete
  /// tags from.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<UntagResourceOutput> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceOutput.fromJson({});
  }

  /// Updates an existing service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh to update.
  ///
  /// [spec]: The service mesh specification to apply.
  Future<UpdateMeshOutput> updateMesh(String meshName,
      {String clientToken, MeshSpec spec}) async {
    return UpdateMeshOutput.fromJson({});
  }

  /// Updates an existing route for a specified service mesh and virtual router.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh that the route resides in.
  ///
  /// [routeName]: The name of the route to update.
  ///
  /// [spec]: The new route specification to apply. This overwrites the existing
  /// data.
  ///
  /// [virtualRouterName]: The name of the virtual router that the route is
  /// associated with.
  Future<UpdateRouteOutput> updateRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      @required String virtualRouterName}) async {
    return UpdateRouteOutput.fromJson({});
  }

  /// Updates an existing virtual node in a specified service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh that the virtual node resides in.
  ///
  /// [spec]: The new virtual node specification to apply. This overwrites the
  /// existing data.
  ///
  /// [virtualNodeName]: The name of the virtual node to update.
  Future<UpdateVirtualNodeOutput> updateVirtualNode(
      {String clientToken,
      @required String meshName,
      @required VirtualNodeSpec spec,
      @required String virtualNodeName}) async {
    return UpdateVirtualNodeOutput.fromJson({});
  }

  /// Updates an existing virtual router in a specified service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh that the virtual router resides
  /// in.
  ///
  /// [spec]: The new virtual router specification to apply. This overwrites the
  /// existing data.
  ///
  /// [virtualRouterName]: The name of the virtual router to update.
  Future<UpdateVirtualRouterOutput> updateVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      @required String virtualRouterName}) async {
    return UpdateVirtualRouterOutput.fromJson({});
  }

  /// Updates an existing virtual service in a specified service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh that the virtual service resides
  /// in.
  ///
  /// [spec]: The new virtual service specification to apply. This overwrites
  /// the existing data.
  ///
  /// [virtualServiceName]: The name of the virtual service to update.
  Future<UpdateVirtualServiceOutput> updateVirtualService(
      {String clientToken,
      @required String meshName,
      @required VirtualServiceSpec spec,
      @required String virtualServiceName}) async {
    return UpdateVirtualServiceOutput.fromJson({});
  }
}

/// An object representing a virtual router listener.
class VirtualRouterListener {
  final PortMapping portMapping;

  VirtualRouterListener({
    @required this.portMapping,
  });
  static VirtualRouterListener fromJson(Map<String, dynamic> json) =>
      VirtualRouterListener();
}

class CreateVirtualNodeOutput {
  /// The full description of your virtual node following the create call.
  final VirtualNodeData virtualNode;

  CreateVirtualNodeOutput({
    @required this.virtualNode,
  });
  static CreateVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      CreateVirtualNodeOutput();
}

/// An object representing the logging information for a virtual node.
class Logging {
  /// The access log configuration for a virtual node.
  final AccessLog accessLog;

  Logging({
    this.accessLog,
  });
  static Logging fromJson(Map<String, dynamic> json) => Logging();
}

class UpdateVirtualRouterOutput {
  /// A full description of the virtual router that was updated.
  final VirtualRouterData virtualRouter;

  UpdateVirtualRouterOutput({
    @required this.virtualRouter,
  });
  static UpdateVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      UpdateVirtualRouterOutput();
}

class DescribeMeshOutput {
  /// The full description of your service mesh.
  final MeshData mesh;

  DescribeMeshOutput({
    @required this.mesh,
  });
  static DescribeMeshOutput fromJson(Map<String, dynamic> json) =>
      DescribeMeshOutput();
}

class ListVirtualRoutersOutput {
  /// The `nextToken` value to include in a future `ListVirtualRouters` request.
  /// When the results of a `ListVirtualRouters` request exceed `limit`, you can
  /// use this value to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  /// The list of existing virtual routers for the specified service mesh.
  final List<VirtualRouterRef> virtualRouters;

  ListVirtualRoutersOutput({
    this.nextToken,
    @required this.virtualRouters,
  });
  static ListVirtualRoutersOutput fromJson(Map<String, dynamic> json) =>
      ListVirtualRoutersOutput();
}

class DeleteRouteOutput {
  /// The route that was deleted.
  final RouteData route;

  DeleteRouteOutput({
    @required this.route,
  });
  static DeleteRouteOutput fromJson(Map<String, dynamic> json) =>
      DeleteRouteOutput();
}

/// An object representing metadata for a resource.
class ResourceMetadata {
  /// The full Amazon Resource Name (ARN) for the resource.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last
  /// updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier for the resource.
  final String uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final BigInt version;

  ResourceMetadata({
    @required this.arn,
    @required this.createdAt,
    @required this.lastUpdatedAt,
    @required this.uid,
    @required this.version,
  });
  static ResourceMetadata fromJson(Map<String, dynamic> json) =>
      ResourceMetadata();
}

class UpdateVirtualNodeOutput {
  /// A full description of the virtual node that was updated.
  final VirtualNodeData virtualNode;

  UpdateVirtualNodeOutput({
    @required this.virtualNode,
  });
  static UpdateVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      UpdateVirtualNodeOutput();
}

class ListRoutesOutput {
  /// The `nextToken` value to include in a future `ListRoutes` request. When
  /// the results of a `ListRoutes` request exceed `limit`, you can use this
  /// value to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  /// The list of existing routes for the specified service mesh and virtual
  /// router.
  final List<RouteRef> routes;

  ListRoutesOutput({
    this.nextToken,
    @required this.routes,
  });
  static ListRoutesOutput fromJson(Map<String, dynamic> json) =>
      ListRoutesOutput();
}

/// An object representing a virtual service backend for a virtual node.
class VirtualServiceBackend {
  /// The name of the virtual service that is acting as a virtual node backend.
  final String virtualServiceName;

  VirtualServiceBackend({
    @required this.virtualServiceName,
  });
  static VirtualServiceBackend fromJson(Map<String, dynamic> json) =>
      VirtualServiceBackend();
}

class UpdateRouteOutput {
  /// A full description of the route that was updated.
  final RouteData route;

  UpdateRouteOutput({
    @required this.route,
  });
  static UpdateRouteOutput fromJson(Map<String, dynamic> json) =>
      UpdateRouteOutput();
}

/// An object representing the traffic distribution requirements for matched
/// HTTP requests.
class HttpRouteAction {
  /// The targets that traffic is routed to when a request matches the route.
  /// You can specify one or more targets and their relative weights to
  /// distribute traffic with.
  final List<WeightedTarget> weightedTargets;

  HttpRouteAction({
    @required this.weightedTargets,
  });
  static HttpRouteAction fromJson(Map<String, dynamic> json) =>
      HttpRouteAction();
}

/// An object representing the health check policy for a virtual node's
/// listener.
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring listener healthy.
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  final BigInt intervalMillis;

  /// The destination path for the health check request. This is required only
  /// if the specified protocol is HTTP. If the protocol is TCP, this parameter
  /// is ignored.
  final String path;

  /// The destination port for the health check request. This port must match
  /// the port defined in the PortMapping for the listener.
  final int port;

  /// The protocol for the health check request.
  final String protocol;

  /// The amount of time to wait when receiving a response from the health
  /// check, in milliseconds.
  final BigInt timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a virtual node unhealthy.
  final int unhealthyThreshold;

  HealthCheckPolicy({
    @required this.healthyThreshold,
    @required this.intervalMillis,
    this.path,
    this.port,
    @required this.protocol,
    @required this.timeoutMillis,
    @required this.unhealthyThreshold,
  });
  static HealthCheckPolicy fromJson(Map<String, dynamic> json) =>
      HealthCheckPolicy();
}

/// An object representing a virtual service returned by a list operation.
class VirtualServiceRef {
  /// The full Amazon Resource Name (ARN) for the virtual service.
  final String arn;

  /// The name of the service mesh that the virtual service resides in.
  final String meshName;

  /// The name of the virtual service.
  final String virtualServiceName;

  VirtualServiceRef({
    @required this.arn,
    @required this.meshName,
    @required this.virtualServiceName,
  });
  static VirtualServiceRef fromJson(Map<String, dynamic> json) =>
      VirtualServiceRef();
}

/// An object representing the egress filter rules for a service mesh.
class EgressFilter {
  /// The egress filter type. By default, the type is `DROP_ALL`, which allows
  /// egress only from virtual nodes to other defined resources in the service
  /// mesh (and any traffic to `*.amazonaws.com` for AWS API calls). You can set
  /// the egress filter type to `ALLOW_ALL` to allow egress to any endpoint
  /// inside or outside of the service mesh.
  final String type;

  EgressFilter({
    @required this.type,
  });
  static EgressFilter fromJson(Map<String, dynamic> json) => EgressFilter();
}

/// An object representing the current status of the virtual node.
class VirtualNodeStatus {
  /// The current status of the virtual node.
  final String status;

  VirtualNodeStatus({
    @required this.status,
  });
  static VirtualNodeStatus fromJson(Map<String, dynamic> json) =>
      VirtualNodeStatus();
}

/// An object representing a virtual router returned by a list operation.
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  final String arn;

  /// The name of the service mesh that the virtual router resides in.
  final String meshName;

  /// The name of the virtual router.
  final String virtualRouterName;

  VirtualRouterRef({
    @required this.arn,
    @required this.meshName,
    @required this.virtualRouterName,
  });
  static VirtualRouterRef fromJson(Map<String, dynamic> json) =>
      VirtualRouterRef();
}

/// An object representing a virtual service returned by a describe operation.
class VirtualServiceData {
  /// The name of the service mesh that the virtual service resides in.
  final String meshName;

  final ResourceMetadata metadata;

  /// The specifications of the virtual service.
  final VirtualServiceSpec spec;

  /// The current status of the virtual service.
  final VirtualServiceStatus status;

  /// The name of the virtual service.
  final String virtualServiceName;

  VirtualServiceData({
    @required this.meshName,
    @required this.metadata,
    @required this.spec,
    @required this.status,
    @required this.virtualServiceName,
  });
  static VirtualServiceData fromJson(Map<String, dynamic> json) =>
      VirtualServiceData();
}

/// An object representing the HTTP header in the request.
class HttpRouteHeader {
  /// Specify `True` to match the opposite of the `HeaderMatchMethod` method and
  /// value. The default value is `False`.
  final bool invert;

  /// The `HeaderMatchMethod` object.
  final HeaderMatchMethod match;

  /// A name for the HTTP header in the client request that will be matched on.
  final String name;

  HttpRouteHeader({
    this.invert,
    this.match,
    @required this.name,
  });
  static HttpRouteHeader fromJson(Map<String, dynamic> json) =>
      HttpRouteHeader();
}

class DescribeVirtualServiceOutput {
  /// The full description of your virtual service.
  final VirtualServiceData virtualService;

  DescribeVirtualServiceOutput({
    @required this.virtualService,
  });
  static DescribeVirtualServiceOutput fromJson(Map<String, dynamic> json) =>
      DescribeVirtualServiceOutput();
}

/// An object representing a virtual node returned by a list operation.
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  final String arn;

  /// The name of the service mesh that the virtual node resides in.
  final String meshName;

  /// The name of the virtual node.
  final String virtualNodeName;

  VirtualNodeRef({
    @required this.arn,
    @required this.meshName,
    @required this.virtualNodeName,
  });
  static VirtualNodeRef fromJson(Map<String, dynamic> json) => VirtualNodeRef();
}

class DescribeVirtualNodeOutput {
  /// The full description of your virtual node.
  final VirtualNodeData virtualNode;

  DescribeVirtualNodeOutput({
    @required this.virtualNode,
  });
  static DescribeVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      DescribeVirtualNodeOutput();
}

class UpdateMeshOutput {
  final MeshData mesh;

  UpdateMeshOutput({
    @required this.mesh,
  });
  static UpdateMeshOutput fromJson(Map<String, dynamic> json) =>
      UpdateMeshOutput();
}

class CreateRouteOutput {
  /// The full description of your mesh following the create call.
  final RouteData route;

  CreateRouteOutput({
    @required this.route,
  });
  static CreateRouteOutput fromJson(Map<String, dynamic> json) =>
      CreateRouteOutput();
}

/// An object representing the DNS service discovery information for your
/// virtual node.
class DnsServiceDiscovery {
  /// Specifies the DNS service discovery hostname for the virtual node.
  final String hostname;

  DnsServiceDiscovery({
    @required this.hostname,
  });
  static DnsServiceDiscovery fromJson(Map<String, dynamic> json) =>
      DnsServiceDiscovery();
}

/// An object representing a virtual node returned by a describe operation.
class VirtualNodeData {
  /// The name of the service mesh that the virtual node resides in.
  final String meshName;

  /// The associated metadata for the virtual node.
  final ResourceMetadata metadata;

  /// The specifications of the virtual node.
  final VirtualNodeSpec spec;

  /// The current status for the virtual node.
  final VirtualNodeStatus status;

  /// The name of the virtual node.
  final String virtualNodeName;

  VirtualNodeData({
    @required this.meshName,
    @required this.metadata,
    @required this.spec,
    @required this.status,
    @required this.virtualNodeName,
  });
  static VirtualNodeData fromJson(Map<String, dynamic> json) =>
      VirtualNodeData();
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}

/// An object representing the AWS Cloud Map attribute information for your
/// virtual node.
class AwsCloudMapInstanceAttribute {
  /// The name of an AWS Cloud Map service instance attribute key. Any AWS Cloud
  /// Map service instance that contains the specified key and value is
  /// returned.
  final String key;

  /// The value of an AWS Cloud Map service instance attribute key. Any AWS
  /// Cloud Map service instance that contains the specified key and value is
  /// returned.
  final String value;

  AwsCloudMapInstanceAttribute({
    @required this.key,
    @required this.value,
  });
  static AwsCloudMapInstanceAttribute fromJson(Map<String, dynamic> json) =>
      AwsCloudMapInstanceAttribute();
}

/// An object representing the specification of a virtual service.
class VirtualServiceSpec {
  /// The App Mesh object that is acting as the provider for a virtual service.
  /// You can specify a single virtual node or virtual router.
  final VirtualServiceProvider provider;

  VirtualServiceSpec({
    this.provider,
  });
  static VirtualServiceSpec fromJson(Map<String, dynamic> json) =>
      VirtualServiceSpec();
}

/// An object representing the backends that a virtual node is expected to send
/// outbound traffic to.
class Backend {
  /// Specifies a virtual service to use as a backend for a virtual node.
  final VirtualServiceBackend virtualService;

  Backend({
    this.virtualService,
  });
  static Backend fromJson(Map<String, dynamic> json) => Backend();
}

/// The range of values to match on. The first character of the range is
/// included in the range, though the last character is not. For example, if the
/// range specified were 1-100, only values 1-99 would be matched.
class MatchRange {
  /// The end of the range.
  final BigInt end;

  /// The start of the range.
  final BigInt start;

  MatchRange({
    @required this.end,
    @required this.start,
  });
  static MatchRange fromJson(Map<String, dynamic> json) => MatchRange();
}

/// An object representing the TCP routing specification for a route.
class TcpRoute {
  /// The action to take if a match is determined.
  final TcpRouteAction action;

  TcpRoute({
    @required this.action,
  });
  static TcpRoute fromJson(Map<String, dynamic> json) => TcpRoute();
}

/// An object representing a virtual router returned by a describe operation.
class VirtualRouterData {
  /// The name of the service mesh that the virtual router resides in.
  final String meshName;

  /// The associated metadata for the virtual router.
  final ResourceMetadata metadata;

  /// The specifications of the virtual router.
  final VirtualRouterSpec spec;

  /// The current status of the virtual router.
  final VirtualRouterStatus status;

  /// The name of the virtual router.
  final String virtualRouterName;

  VirtualRouterData({
    @required this.meshName,
    @required this.metadata,
    @required this.spec,
    @required this.status,
    @required this.virtualRouterName,
  });
  static VirtualRouterData fromJson(Map<String, dynamic> json) =>
      VirtualRouterData();
}

/// An object representing the access logging information for a virtual node.
class AccessLog {
  /// The file object to send virtual node access logs to.
  final FileAccessLog file;

  AccessLog({
    this.file,
  });
  static AccessLog fromJson(Map<String, dynamic> json) => AccessLog();
}

class DescribeVirtualRouterOutput {
  /// The full description of your virtual router.
  final VirtualRouterData virtualRouter;

  DescribeVirtualRouterOutput({
    @required this.virtualRouter,
  });
  static DescribeVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      DescribeVirtualRouterOutput();
}

class CreateMeshOutput {
  /// The full description of your service mesh following the create call.
  final MeshData mesh;

  CreateMeshOutput({
    @required this.mesh,
  });
  static CreateMeshOutput fromJson(Map<String, dynamic> json) =>
      CreateMeshOutput();
}

class CreateVirtualRouterOutput {
  /// The full description of your virtual router following the create call.
  final VirtualRouterData virtualRouter;

  CreateVirtualRouterOutput({
    @required this.virtualRouter,
  });
  static CreateVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      CreateVirtualRouterOutput();
}

/// An object representing the status of a virtual service.
class VirtualServiceStatus {
  /// The current status of the virtual service.
  final String status;

  VirtualServiceStatus({
    @required this.status,
  });
  static VirtualServiceStatus fromJson(Map<String, dynamic> json) =>
      VirtualServiceStatus();
}

/// An object representing the specification of a virtual router.
class VirtualRouterSpec {
  /// The listeners that the virtual router is expected to receive inbound
  /// traffic from. Currently only one listener is supported per virtual router.
  final List<VirtualRouterListener> listeners;

  VirtualRouterSpec({
    this.listeners,
  });
  static VirtualRouterSpec fromJson(Map<String, dynamic> json) =>
      VirtualRouterSpec();
}

/// An object representing the specification of a virtual node.
class VirtualNodeSpec {
  /// The backends that the virtual node is expected to send outbound traffic
  /// to.
  final List<Backend> backends;

  /// The listeners that the virtual node is expected to receive inbound traffic
  /// from. Currently only one listener is supported per virtual node.
  final List<Listener> listeners;

  /// The inbound and outbound access logging information for the virtual node.
  final Logging logging;

  /// The service discovery information for the virtual node. If your virtual
  /// node does not expect ingress traffic, you can omit this parameter.
  final ServiceDiscovery serviceDiscovery;

  VirtualNodeSpec({
    this.backends,
    this.listeners,
    this.logging,
    this.serviceDiscovery,
  });
  static VirtualNodeSpec fromJson(Map<String, dynamic> json) =>
      VirtualNodeSpec();
}

class ListMeshesOutput {
  /// The list of existing service meshes.
  final List<MeshRef> meshes;

  /// The `nextToken` value to include in a future `ListMeshes` request. When
  /// the results of a `ListMeshes` request exceed `limit`, you can use this
  /// value to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  ListMeshesOutput({
    @required this.meshes,
    this.nextToken,
  });
  static ListMeshesOutput fromJson(Map<String, dynamic> json) =>
      ListMeshesOutput();
}

/// An object representing the duration between retry attempts.
class Duration {
  /// The unit of time between retry attempts.
  final String unit;

  /// The duration of time between retry attempts.
  final BigInt value;

  Duration({
    this.unit,
    this.value,
  });
  static Duration fromJson(Map<String, dynamic> json) => Duration();
}

class DescribeRouteOutput {
  /// The full description of your route.
  final RouteData route;

  DescribeRouteOutput({
    @required this.route,
  });
  static DescribeRouteOutput fromJson(Map<String, dynamic> json) =>
      DescribeRouteOutput();
}

/// An object representing the requirements for a route to match HTTP requests
/// for a virtual router.
class HttpRouteMatch {
  /// The client request headers to match on.
  final List<HttpRouteHeader> headers;

  /// The client request header method to match on.
  final String method;

  /// Specifies the path to match requests with. This parameter must always
  /// start with `/`, which by itself matches all requests to the virtual
  /// service name. You can also match for path-based routing of requests. For
  /// example, if your virtual service name is `my-service.local` and you want
  /// the route to match requests to `my-service.local/metrics`, your prefix
  /// should be `/metrics`.
  final String prefix;

  /// The client request header scheme to match on.
  final String scheme;

  HttpRouteMatch({
    this.headers,
    this.method,
    @required this.prefix,
    this.scheme,
  });
  static HttpRouteMatch fromJson(Map<String, dynamic> json) => HttpRouteMatch();
}

/// Optional metadata that you apply to a resource to assist with categorization
/// and organization. Each tag consists of a key and an optional value, both of
/// which you define. Tag keys can have a maximum character length of 128
/// characters, and tag values can have a maximum length of 256 characters.
class TagRef {
  /// One part of a key-value pair that make up a tag. A `key` is a general
  /// label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A `value` acts
  /// as a descriptor within a tag category (key).
  final String value;

  TagRef({
    @required this.key,
    this.value,
  });
  static TagRef fromJson(Map<String, dynamic> json) => TagRef();
}

/// An object representing a service mesh returned by a list operation.
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  final String arn;

  /// The name of the service mesh.
  final String meshName;

  MeshRef({
    @required this.arn,
    @required this.meshName,
  });
  static MeshRef fromJson(Map<String, dynamic> json) => MeshRef();
}

/// An object representing a virtual node or virtual router listener port
/// mapping.
class PortMapping {
  /// The port used for the port mapping.
  final int port;

  /// The protocol used for the port mapping.
  final String protocol;

  PortMapping({
    @required this.port,
    @required this.protocol,
  });
  static PortMapping fromJson(Map<String, dynamic> json) => PortMapping();
}

/// An object representing a service mesh returned by a describe operation.
class MeshData {
  /// The name of the service mesh.
  final String meshName;

  /// The associated metadata for the service mesh.
  final ResourceMetadata metadata;

  /// The associated specification for the service mesh.
  final MeshSpec spec;

  /// The status of the service mesh.
  final MeshStatus status;

  MeshData({
    @required this.meshName,
    @required this.metadata,
    @required this.spec,
    @required this.status,
  });
  static MeshData fromJson(Map<String, dynamic> json) => MeshData();
}

/// An object representing the status of a virtual router.
class VirtualRouterStatus {
  /// The current status of the virtual router.
  final String status;

  VirtualRouterStatus({
    @required this.status,
  });
  static VirtualRouterStatus fromJson(Map<String, dynamic> json) =>
      VirtualRouterStatus();
}

class ListVirtualServicesOutput {
  /// The `nextToken` value to include in a future `ListVirtualServices`
  /// request. When the results of a `ListVirtualServices` request exceed
  /// `limit`, you can use this value to retrieve the next page of results. This
  /// value is `null` when there are no more results to return.
  final String nextToken;

  /// The list of existing virtual services for the specified service mesh.
  final List<VirtualServiceRef> virtualServices;

  ListVirtualServicesOutput({
    this.nextToken,
    @required this.virtualServices,
  });
  static ListVirtualServicesOutput fromJson(Map<String, dynamic> json) =>
      ListVirtualServicesOutput();
}

/// An object representing a target and its relative weight. Traffic is
/// distributed across targets according to their relative weight. For example,
/// a weighted target with a relative weight of 50 receives five times as much
/// traffic as one with a relative weight of 10.
class WeightedTarget {
  /// The virtual node to associate with the weighted target.
  final String virtualNode;

  /// The relative weight of the weighted target.
  final int weight;

  WeightedTarget({
    @required this.virtualNode,
    @required this.weight,
  });
  static WeightedTarget fromJson(Map<String, dynamic> json) => WeightedTarget();
}

/// An object representing the traffic distribution requirements for matched TCP
/// requests.
class TcpRouteAction {
  /// The targets that traffic is routed to when a request matches the route.
  /// You can specify one or more targets and their relative weights to
  /// distribute traffic with.
  final List<WeightedTarget> weightedTargets;

  TcpRouteAction({
    @required this.weightedTargets,
  });
  static TcpRouteAction fromJson(Map<String, dynamic> json) => TcpRouteAction();
}

/// An object representing the current status of a route.
class RouteStatus {
  /// The current status for the route.
  final String status;

  RouteStatus({
    @required this.status,
  });
  static RouteStatus fromJson(Map<String, dynamic> json) => RouteStatus();
}

/// An object representing a route returned by a list operation.
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  final String arn;

  /// The name of the service mesh that the route resides in.
  final String meshName;

  /// The name of the route.
  final String routeName;

  /// The virtual router that the route is associated with.
  final String virtualRouterName;

  RouteRef({
    @required this.arn,
    @required this.meshName,
    @required this.routeName,
    @required this.virtualRouterName,
  });
  static RouteRef fromJson(Map<String, dynamic> json) => RouteRef();
}

/// An object representing a listener for a virtual node.
class Listener {
  /// The health check information for the listener.
  final HealthCheckPolicy healthCheck;

  /// The port mapping information for the listener.
  final PortMapping portMapping;

  Listener({
    this.healthCheck,
    @required this.portMapping,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener();
}

/// An object representing a route returned by a describe operation.
class RouteData {
  /// The name of the service mesh that the route resides in.
  final String meshName;

  /// The associated metadata for the route.
  final ResourceMetadata metadata;

  /// The name of the route.
  final String routeName;

  /// The specifications of the route.
  final RouteSpec spec;

  /// The status of the route.
  final RouteStatus status;

  /// The virtual router that the route is associated with.
  final String virtualRouterName;

  RouteData({
    @required this.meshName,
    @required this.metadata,
    @required this.routeName,
    @required this.spec,
    @required this.status,
    @required this.virtualRouterName,
  });
  static RouteData fromJson(Map<String, dynamic> json) => RouteData();
}

class DeleteVirtualServiceOutput {
  /// The virtual service that was deleted.
  final VirtualServiceData virtualService;

  DeleteVirtualServiceOutput({
    @required this.virtualService,
  });
  static DeleteVirtualServiceOutput fromJson(Map<String, dynamic> json) =>
      DeleteVirtualServiceOutput();
}

/// An object representing a virtual node service provider.
class VirtualNodeServiceProvider {
  /// The name of the virtual node that is acting as a service provider.
  final String virtualNodeName;

  VirtualNodeServiceProvider({
    @required this.virtualNodeName,
  });
  static VirtualNodeServiceProvider fromJson(Map<String, dynamic> json) =>
      VirtualNodeServiceProvider();
}

/// An object that represents a retry policy.
class HttpRetryPolicy {
  /// Specify at least one of the following values.
  ///
  /// *    **server-error** – HTTP status codes 500, 501, 502, 503, 504, 505,
  /// 506, 507, 508, 510, and 511
  ///
  /// *    **gateway-error** – HTTP status codes 502, 503, and 504
  ///
  /// *    **client-error** – HTTP status code 409
  ///
  /// *    **stream-error** – Retry on refused stream
  final List<String> httpRetryEvents;

  /// The maximum number of retry attempts. If no value is specified, the
  /// default is 1.
  final BigInt maxRetries;

  /// An object that represents the retry duration.
  final Duration perRetryTimeout;

  /// Specify a valid value.
  final List<String> tcpRetryEvents;

  HttpRetryPolicy({
    this.httpRetryEvents,
    @required this.maxRetries,
    @required this.perRetryTimeout,
    this.tcpRetryEvents,
  });
  static HttpRetryPolicy fromJson(Map<String, dynamic> json) =>
      HttpRetryPolicy();
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

/// An object representing the method and value to match the header value sent
/// with a request. Specify one match method.
class HeaderMatchMethod {
  /// The header value sent by the client must match the specified value
  /// exactly.
  final String exact;

  /// The header value sent by the client must begin with the specified
  /// characters.
  final String prefix;

  /// The object that specifies the range of numbers that the header value sent
  /// by the client must be included in.
  final MatchRange range;

  /// The header value sent by the client must include the specified characters.
  final String regex;

  /// The header value sent by the client must end with the specified
  /// characters.
  final String suffix;

  HeaderMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });
  static HeaderMatchMethod fromJson(Map<String, dynamic> json) =>
      HeaderMatchMethod();
}

class DeleteMeshOutput {
  /// The service mesh that was deleted.
  final MeshData mesh;

  DeleteMeshOutput({
    @required this.mesh,
  });
  static DeleteMeshOutput fromJson(Map<String, dynamic> json) =>
      DeleteMeshOutput();
}

/// An object representing the provider for a virtual service.
class VirtualServiceProvider {
  /// The virtual node associated with a virtual service.
  final VirtualNodeServiceProvider virtualNode;

  /// The virtual router associated with a virtual service.
  final VirtualRouterServiceProvider virtualRouter;

  VirtualServiceProvider({
    this.virtualNode,
    this.virtualRouter,
  });
  static VirtualServiceProvider fromJson(Map<String, dynamic> json) =>
      VirtualServiceProvider();
}

/// An object representing the AWS Cloud Map service discovery information for
/// your virtual node.
class AwsCloudMapServiceDiscovery {
  /// A string map that contains attributes with values that you can use to
  /// filter instances by any custom attribute that you specified when you
  /// registered the instance. Only instances that match all of the specified
  /// key/value pairs will be returned.
  final List<AwsCloudMapInstanceAttribute> attributes;

  /// The name of the AWS Cloud Map namespace to use.
  final String namespaceName;

  /// The name of the AWS Cloud Map service to use.
  final String serviceName;

  AwsCloudMapServiceDiscovery({
    this.attributes,
    @required this.namespaceName,
    @required this.serviceName,
  });
  static AwsCloudMapServiceDiscovery fromJson(Map<String, dynamic> json) =>
      AwsCloudMapServiceDiscovery();
}

class UpdateVirtualServiceOutput {
  /// A full description of the virtual service that was updated.
  final VirtualServiceData virtualService;

  UpdateVirtualServiceOutput({
    @required this.virtualService,
  });
  static UpdateVirtualServiceOutput fromJson(Map<String, dynamic> json) =>
      UpdateVirtualServiceOutput();
}

/// An object representing the status of a service mesh.
class MeshStatus {
  /// The current mesh status.
  final String status;

  MeshStatus({
    this.status,
  });
  static MeshStatus fromJson(Map<String, dynamic> json) => MeshStatus();
}

/// An object representing the specification of a route.
class RouteSpec {
  /// The HTTP routing information for the route.
  final HttpRoute httpRoute;

  /// The priority for the route. Routes are matched based on the specified
  /// value, where 0 is the highest priority.
  final int priority;

  /// The TCP routing information for the route.
  final TcpRoute tcpRoute;

  RouteSpec({
    this.httpRoute,
    this.priority,
    this.tcpRoute,
  });
  static RouteSpec fromJson(Map<String, dynamic> json) => RouteSpec();
}

/// An object representing the HTTP routing specification for a route.
class HttpRoute {
  /// The action to take if a match is determined.
  final HttpRouteAction action;

  /// The criteria for determining an HTTP request match.
  final HttpRouteMatch match;

  /// An object that represents a retry policy.
  final HttpRetryPolicy retryPolicy;

  HttpRoute({
    @required this.action,
    @required this.match,
    this.retryPolicy,
  });
  static HttpRoute fromJson(Map<String, dynamic> json) => HttpRoute();
}

/// An object representing the specification of a service mesh.
class MeshSpec {
  /// The egress filter rules for the service mesh.
  final EgressFilter egressFilter;

  MeshSpec({
    this.egressFilter,
  });
  static MeshSpec fromJson(Map<String, dynamic> json) => MeshSpec();
}

class CreateVirtualServiceOutput {
  /// The full description of your virtual service following the create call.
  final VirtualServiceData virtualService;

  CreateVirtualServiceOutput({
    @required this.virtualService,
  });
  static CreateVirtualServiceOutput fromJson(Map<String, dynamic> json) =>
      CreateVirtualServiceOutput();
}

/// An object representing an access log file.
class FileAccessLog {
  /// The file path to write access logs to. You can use `/dev/stdout` to send
  /// access logs to standard out and configure your Envoy container to use a
  /// log driver, such as `awslogs`, to export the access logs to a log storage
  /// service such as Amazon CloudWatch Logs. You can also specify a path in the
  /// Envoy container's file system to write the files to disk.
  ///
  ///
  ///
  /// The Envoy process must have write permissions to the path that you specify
  /// here. Otherwise, Envoy fails to bootstrap properly.
  final String path;

  FileAccessLog({
    @required this.path,
  });
  static FileAccessLog fromJson(Map<String, dynamic> json) => FileAccessLog();
}

/// An object representing a virtual node service provider.
class VirtualRouterServiceProvider {
  /// The name of the virtual router that is acting as a service provider.
  final String virtualRouterName;

  VirtualRouterServiceProvider({
    @required this.virtualRouterName,
  });
  static VirtualRouterServiceProvider fromJson(Map<String, dynamic> json) =>
      VirtualRouterServiceProvider();
}

class ListTagsForResourceOutput {
  /// The `nextToken` value to include in a future `ListTagsForResource`
  /// request. When the results of a `ListTagsForResource` request exceed
  /// `limit`, you can use this value to retrieve the next page of results. This
  /// value is `null` when there are no more results to return.
  final String nextToken;

  /// The tags for the resource.
  final List<TagRef> tags;

  ListTagsForResourceOutput({
    this.nextToken,
    @required this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput();
}

/// An object representing the service discovery information for a virtual node.
class ServiceDiscovery {
  /// Specifies any AWS Cloud Map information for the virtual node.
  final AwsCloudMapServiceDiscovery awsCloudMap;

  /// Specifies the DNS information for the virtual node.
  final DnsServiceDiscovery dns;

  ServiceDiscovery({
    this.awsCloudMap,
    this.dns,
  });
  static ServiceDiscovery fromJson(Map<String, dynamic> json) =>
      ServiceDiscovery();
}

class ListVirtualNodesOutput {
  /// The `nextToken` value to include in a future `ListVirtualNodes` request.
  /// When the results of a `ListVirtualNodes` request exceed `limit`, you can
  /// use this value to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  /// The list of existing virtual nodes for the specified service mesh.
  final List<VirtualNodeRef> virtualNodes;

  ListVirtualNodesOutput({
    this.nextToken,
    @required this.virtualNodes,
  });
  static ListVirtualNodesOutput fromJson(Map<String, dynamic> json) =>
      ListVirtualNodesOutput();
}

class DeleteVirtualRouterOutput {
  /// The virtual router that was deleted.
  final VirtualRouterData virtualRouter;

  DeleteVirtualRouterOutput({
    @required this.virtualRouter,
  });
  static DeleteVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      DeleteVirtualRouterOutput();
}

class DeleteVirtualNodeOutput {
  /// The virtual node that was deleted.
  final VirtualNodeData virtualNode;

  DeleteVirtualNodeOutput({
    @required this.virtualNode,
  });
  static DeleteVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      DeleteVirtualNodeOutput();
}
