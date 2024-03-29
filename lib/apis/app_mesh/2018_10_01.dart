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
/// service discovery on Amazon ECS, see
/// [Service Discovery](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html)
/// in the _Amazon Elastic Container Service Developer Guide_. Kubernetes
/// `kube-dns` is supported. For more information, see
/// [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
/// in the Kubernetes documentation.
class AppMeshApi {
  final _client;
  AppMeshApi(client)
      : _client = client.configured('App Mesh', serializer: 'rest-json');

  /// Creates a new service mesh. A service mesh is a logical boundary for
  /// network traffic between the services that reside within it.
  ///
  /// After you create your service mesh, you can create virtual nodes, virtual
  /// routers, and routes to distribute traffic between the applications in your
  /// mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name to use for the service mesh.
  Future<CreateMeshOutput> createMesh(String meshName,
      {String clientToken}) async {
    var response_ = await _client.send('CreateMesh', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
    });
    return CreateMeshOutput.fromJson(response_);
  }

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
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh in which to create the route.
  ///
  /// [routeName]: The name to use for the route.
  ///
  /// [spec]: The route specification to apply.
  ///
  /// [virtualRouterName]: The name of the virtual router in which to create the
  /// route.
  Future<CreateRouteOutput> createRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('CreateRoute', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'routeName': routeName,
      'spec': spec,
      'virtualRouterName': virtualRouterName,
    });
    return CreateRouteOutput.fromJson(response_);
  }

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
  /// `mesh/default/virtualNode/simpleapp`, as the `APPMESH_VIRTUAL_NODE_NAME`
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
  /// [meshName]: The name of the service mesh in which to create the virtual
  /// node.
  ///
  /// [spec]: The virtual node specification to apply.
  ///
  /// [virtualNodeName]: The name to use for the virtual node.
  Future<CreateVirtualNodeOutput> createVirtualNode(
      {String clientToken,
      @required String meshName,
      @required VirtualNodeSpec spec,
      @required String virtualNodeName}) async {
    var response_ = await _client.send('CreateVirtualNode', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'spec': spec,
      'virtualNodeName': virtualNodeName,
    });
    return CreateVirtualNodeOutput.fromJson(response_);
  }

  /// Creates a new virtual router within a service mesh.
  ///
  /// Virtual routers handle traffic for one or more service names within your
  /// mesh. After you create your virtual router, create and associate routes
  /// for your virtual router that direct incoming requests to different virtual
  /// nodes.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh in which to create the virtual
  /// router.
  ///
  /// [spec]: The virtual router specification to apply.
  ///
  /// [virtualRouterName]: The name to use for the virtual router.
  Future<CreateVirtualRouterOutput> createVirtualRouter(
      {String clientToken,
      @required String meshName,
      @required VirtualRouterSpec spec,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('CreateVirtualRouter', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'spec': spec,
      'virtualRouterName': virtualRouterName,
    });
    return CreateVirtualRouterOutput.fromJson(response_);
  }

  /// Deletes an existing service mesh.
  ///
  /// You must delete all resources (routes, virtual routers, virtual nodes) in
  /// the service mesh before you can delete the mesh itself.
  ///
  /// [meshName]: The name of the service mesh to delete.
  Future<DeleteMeshOutput> deleteMesh(String meshName) async {
    var response_ = await _client.send('DeleteMesh', {
      'meshName': meshName,
    });
    return DeleteMeshOutput.fromJson(response_);
  }

  /// Deletes an existing route.
  ///
  /// [meshName]: The name of the service mesh in which to delete the route.
  ///
  /// [routeName]: The name of the route to delete.
  ///
  /// [virtualRouterName]: The name of the virtual router in which to delete the
  /// route.
  Future<DeleteRouteOutput> deleteRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('DeleteRoute', {
      'meshName': meshName,
      'routeName': routeName,
      'virtualRouterName': virtualRouterName,
    });
    return DeleteRouteOutput.fromJson(response_);
  }

  /// Deletes an existing virtual node.
  ///
  /// [meshName]: The name of the service mesh in which to delete the virtual
  /// node.
  ///
  /// [virtualNodeName]: The name of the virtual node to delete.
  Future<DeleteVirtualNodeOutput> deleteVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {
    var response_ = await _client.send('DeleteVirtualNode', {
      'meshName': meshName,
      'virtualNodeName': virtualNodeName,
    });
    return DeleteVirtualNodeOutput.fromJson(response_);
  }

  /// Deletes an existing virtual router.
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the router itself.
  ///
  /// [meshName]: The name of the service mesh in which to delete the virtual
  /// router.
  ///
  /// [virtualRouterName]: The name of the virtual router to delete.
  Future<DeleteVirtualRouterOutput> deleteVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {
    var response_ = await _client.send('DeleteVirtualRouter', {
      'meshName': meshName,
      'virtualRouterName': virtualRouterName,
    });
    return DeleteVirtualRouterOutput.fromJson(response_);
  }

  /// Describes an existing service mesh.
  ///
  /// [meshName]: The name of the service mesh to describe.
  Future<DescribeMeshOutput> describeMesh(String meshName) async {
    var response_ = await _client.send('DescribeMesh', {
      'meshName': meshName,
    });
    return DescribeMeshOutput.fromJson(response_);
  }

  /// Describes an existing route.
  ///
  /// [meshName]: The name of the service mesh in which the route resides.
  ///
  /// [routeName]: The name of the route to describe.
  ///
  /// [virtualRouterName]: The name of the virtual router with which the route
  /// is associated.
  Future<DescribeRouteOutput> describeRoute(
      {@required String meshName,
      @required String routeName,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('DescribeRoute', {
      'meshName': meshName,
      'routeName': routeName,
      'virtualRouterName': virtualRouterName,
    });
    return DescribeRouteOutput.fromJson(response_);
  }

  /// Describes an existing virtual node.
  ///
  /// [meshName]: The name of the service mesh in which the virtual node
  /// resides.
  ///
  /// [virtualNodeName]: The name of the virtual node to describe.
  Future<DescribeVirtualNodeOutput> describeVirtualNode(
      {@required String meshName, @required String virtualNodeName}) async {
    var response_ = await _client.send('DescribeVirtualNode', {
      'meshName': meshName,
      'virtualNodeName': virtualNodeName,
    });
    return DescribeVirtualNodeOutput.fromJson(response_);
  }

  /// Describes an existing virtual router.
  ///
  /// [meshName]: The name of the service mesh in which the virtual router
  /// resides.
  ///
  /// [virtualRouterName]: The name of the virtual router to describe.
  Future<DescribeVirtualRouterOutput> describeVirtualRouter(
      {@required String meshName, @required String virtualRouterName}) async {
    var response_ = await _client.send('DescribeVirtualRouter', {
      'meshName': meshName,
      'virtualRouterName': virtualRouterName,
    });
    return DescribeVirtualRouterOutput.fromJson(response_);
  }

  /// Returns a list of existing service meshes.
  ///
  /// [limit]: The maximum number of mesh results returned by `ListMeshes` in
  /// paginated output. When this parameter is used, `ListMeshes` only returns
  /// `limit` results in a single page along with a `nextToken` response
  /// element. The remaining results of the initial request can be seen by
  /// sending another `ListMeshes` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If this parameter is not used, then
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
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  Future<ListMeshesOutput> listMeshes({int limit, String nextToken}) async {
    var response_ = await _client.send('ListMeshes', {
      if (limit != null) 'limit': limit,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListMeshesOutput.fromJson(response_);
  }

  /// Returns a list of existing routes in a service mesh.
  ///
  /// [limit]: The maximum number of mesh results returned by `ListRoutes` in
  /// paginated output. When this parameter is used, `ListRoutes` only returns
  /// `limit` results in a single page along with a `nextToken` response
  /// element. The remaining results of the initial request can be seen by
  /// sending another `ListRoutes` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If this parameter is not used, then
  /// `ListRoutes` returns up to 100 results and a `nextToken` value if
  /// applicable.
  ///
  /// [meshName]: The name of the service mesh in which to list routes.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListRoutes` request where `limit` was used and the results exceeded the
  /// value of that parameter. Pagination continues from the end of the previous
  /// results that returned the `nextToken` value.
  ///
  /// [virtualRouterName]: The name of the virtual router in which to list
  /// routes.
  Future<ListRoutesOutput> listRoutes(
      {int limit,
      @required String meshName,
      String nextToken,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('ListRoutes', {
      if (limit != null) 'limit': limit,
      'meshName': meshName,
      if (nextToken != null) 'nextToken': nextToken,
      'virtualRouterName': virtualRouterName,
    });
    return ListRoutesOutput.fromJson(response_);
  }

  /// Returns a list of existing virtual nodes.
  ///
  /// [limit]: The maximum number of mesh results returned by `ListVirtualNodes`
  /// in paginated output. When this parameter is used, `ListVirtualNodes` only
  /// returns `limit` results in a single page along with a `nextToken` response
  /// element. The remaining results of the initial request can be seen by
  /// sending another `ListVirtualNodes` request with the returned `nextToken`
  /// value. This value can be between 1 and 100. If this parameter is not used,
  /// then `ListVirtualNodes` returns up to 100 results and a `nextToken` value
  /// if applicable.
  ///
  /// [meshName]: The name of the service mesh in which to list virtual nodes.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListVirtualNodes` request where `limit` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value.
  Future<ListVirtualNodesOutput> listVirtualNodes(String meshName,
      {int limit, String nextToken}) async {
    var response_ = await _client.send('ListVirtualNodes', {
      if (limit != null) 'limit': limit,
      'meshName': meshName,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListVirtualNodesOutput.fromJson(response_);
  }

  /// Returns a list of existing virtual routers in a service mesh.
  ///
  /// [limit]: The maximum number of mesh results returned by
  /// `ListVirtualRouters` in paginated output. When this parameter is used,
  /// `ListVirtualRouters` only returns `limit` results in a single page along
  /// with a `nextToken` response element. The remaining results of the initial
  /// request can be seen by sending another `ListVirtualRouters` request with
  /// the returned `nextToken` value. This value can be between 1 and 100. If
  /// this parameter is not used, then `ListVirtualRouters` returns up to 100
  /// results and a `nextToken` value if applicable.
  ///
  /// [meshName]: The name of the service mesh in which to list virtual routers.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListVirtualRouters` request where `limit` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  Future<ListVirtualRoutersOutput> listVirtualRouters(String meshName,
      {int limit, String nextToken}) async {
    var response_ = await _client.send('ListVirtualRouters', {
      if (limit != null) 'limit': limit,
      'meshName': meshName,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListVirtualRoutersOutput.fromJson(response_);
  }

  /// Updates an existing route for a specified service mesh and virtual router.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh in which the route resides.
  ///
  /// [routeName]: The name of the route to update.
  ///
  /// [spec]: The new route specification to apply. This overwrites the existing
  /// data.
  ///
  /// [virtualRouterName]: The name of the virtual router with which the route
  /// is associated.
  Future<UpdateRouteOutput> updateRoute(
      {String clientToken,
      @required String meshName,
      @required String routeName,
      @required RouteSpec spec,
      @required String virtualRouterName}) async {
    var response_ = await _client.send('UpdateRoute', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'routeName': routeName,
      'spec': spec,
      'virtualRouterName': virtualRouterName,
    });
    return UpdateRouteOutput.fromJson(response_);
  }

  /// Updates an existing virtual node in a specified service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh in which the virtual node
  /// resides.
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
    var response_ = await _client.send('UpdateVirtualNode', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'spec': spec,
      'virtualNodeName': virtualNodeName,
    });
    return UpdateVirtualNodeOutput.fromJson(response_);
  }

  /// Updates an existing virtual router in a specified service mesh.
  ///
  /// [clientToken]: Unique, case-sensitive identifier that you provide to
  /// ensure the idempotency of the request. Up to 36 letters, numbers, hyphens,
  /// and underscores are allowed.
  ///
  /// [meshName]: The name of the service mesh in which the virtual router
  /// resides.
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
    var response_ = await _client.send('UpdateVirtualRouter', {
      if (clientToken != null) 'clientToken': clientToken,
      'meshName': meshName,
      'spec': spec,
      'virtualRouterName': virtualRouterName,
    });
    return UpdateVirtualRouterOutput.fromJson(response_);
  }
}

class DeleteMeshOutput {
  /// The service mesh that was deleted.
  final MeshData mesh;

  DeleteMeshOutput({
    this.mesh,
  });
  static DeleteMeshOutput fromJson(Map<String, dynamic> json) =>
      DeleteMeshOutput(
        mesh: json.containsKey('mesh') ? MeshData.fromJson(json['mesh']) : null,
      );
}

class UpdateVirtualRouterOutput {
  /// A full description of the virtual router that was updated.
  final VirtualRouterData virtualRouter;

  UpdateVirtualRouterOutput({
    this.virtualRouter,
  });
  static UpdateVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      UpdateVirtualRouterOutput(
        virtualRouter: json.containsKey('virtualRouter')
            ? VirtualRouterData.fromJson(json['virtualRouter'])
            : null,
      );
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
    this.virtualNode,
    this.weight,
  });
  static WeightedTarget fromJson(Map<String, dynamic> json) => WeightedTarget(
        virtualNode: json.containsKey('virtualNode')
            ? json['virtualNode'] as String
            : null,
        weight: json.containsKey('weight') ? json['weight'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateRouteOutput {
  /// The full description of your mesh following the create call.
  final RouteData route;

  CreateRouteOutput({
    this.route,
  });
  static CreateRouteOutput fromJson(Map<String, dynamic> json) =>
      CreateRouteOutput(
        route: json.containsKey('route')
            ? RouteData.fromJson(json['route'])
            : null,
      );
}

/// The DNS service discovery information for your virtual node.
class DnsServiceDiscovery {
  /// The DNS service name for your virtual node.
  final String serviceName;

  DnsServiceDiscovery({
    this.serviceName,
  });
  static DnsServiceDiscovery fromJson(Map<String, dynamic> json) =>
      DnsServiceDiscovery(
        serviceName: json.containsKey('serviceName')
            ? json['serviceName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing a virtual node returned by a list operation.
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  final String arn;

  /// The name of the service mesh in which the virtual node resides.
  final String meshName;

  /// The name of the virtual node.
  final String virtualNodeName;

  VirtualNodeRef({
    this.arn,
    this.meshName,
    this.virtualNodeName,
  });
  static VirtualNodeRef fromJson(Map<String, dynamic> json) => VirtualNodeRef(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        meshName:
            json.containsKey('meshName') ? json['meshName'] as String : null,
        virtualNodeName: json.containsKey('virtualNodeName')
            ? json['virtualNodeName'] as String
            : null,
      );
}

class DescribeRouteOutput {
  /// The full description of your route.
  final RouteData route;

  DescribeRouteOutput({
    this.route,
  });
  static DescribeRouteOutput fromJson(Map<String, dynamic> json) =>
      DescribeRouteOutput(
        route: json.containsKey('route')
            ? RouteData.fromJson(json['route'])
            : null,
      );
}

/// An object representing the service discovery information for a virtual node.
class ServiceDiscovery {
  /// Specifies the DNS service name for the virtual node.
  final DnsServiceDiscovery dns;

  ServiceDiscovery({
    this.dns,
  });
  static ServiceDiscovery fromJson(Map<String, dynamic> json) =>
      ServiceDiscovery(
        dns: json.containsKey('dns')
            ? DnsServiceDiscovery.fromJson(json['dns'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the status of a service mesh.
class MeshStatus {
  /// The current mesh status.
  final String status;

  MeshStatus({
    this.status,
  });
  static MeshStatus fromJson(Map<String, dynamic> json) => MeshStatus(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// An object representing a virtual node returned by a describe operation.
class VirtualNodeData {
  /// The name of the service mesh in which the virtual node resides.
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
    this.metadata,
    this.spec,
    this.status,
    @required this.virtualNodeName,
  });
  static VirtualNodeData fromJson(Map<String, dynamic> json) => VirtualNodeData(
        meshName: json['meshName'] as String,
        metadata: json.containsKey('metadata')
            ? ResourceMetadata.fromJson(json['metadata'])
            : null,
        spec: json.containsKey('spec')
            ? VirtualNodeSpec.fromJson(json['spec'])
            : null,
        status: json.containsKey('status')
            ? VirtualNodeStatus.fromJson(json['status'])
            : null,
        virtualNodeName: json['virtualNodeName'] as String,
      );
}

/// An object representing the specification of a virtual node.
class VirtualNodeSpec {
  /// The backends to which the virtual node is expected to send outbound
  /// traffic.
  final List<String> backends;

  /// The listeners from which the virtual node is expected to receive inbound
  /// traffic.
  final List<Listener> listeners;

  /// The service discovery information for the virtual node.
  final ServiceDiscovery serviceDiscovery;

  VirtualNodeSpec({
    this.backends,
    this.listeners,
    this.serviceDiscovery,
  });
  static VirtualNodeSpec fromJson(Map<String, dynamic> json) => VirtualNodeSpec(
        backends: json.containsKey('backends')
            ? (json['backends'] as List).map((e) => e as String).toList()
            : null,
        listeners: json.containsKey('listeners')
            ? (json['listeners'] as List)
                .map((e) => Listener.fromJson(e))
                .toList()
            : null,
        serviceDiscovery: json.containsKey('serviceDiscovery')
            ? ServiceDiscovery.fromJson(json['serviceDiscovery'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing a service mesh returned by a list operation.
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  final String arn;

  /// The name of the service mesh.
  final String meshName;

  MeshRef({
    this.arn,
    this.meshName,
  });
  static MeshRef fromJson(Map<String, dynamic> json) => MeshRef(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        meshName:
            json.containsKey('meshName') ? json['meshName'] as String : null,
      );
}

class DescribeVirtualRouterOutput {
  /// The full description of your virtual router.
  final VirtualRouterData virtualRouter;

  DescribeVirtualRouterOutput({
    this.virtualRouter,
  });
  static DescribeVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      DescribeVirtualRouterOutput(
        virtualRouter: json.containsKey('virtualRouter')
            ? VirtualRouterData.fromJson(json['virtualRouter'])
            : null,
      );
}

class UpdateRouteOutput {
  /// A full description of the route that was updated.
  final RouteData route;

  UpdateRouteOutput({
    this.route,
  });
  static UpdateRouteOutput fromJson(Map<String, dynamic> json) =>
      UpdateRouteOutput(
        route: json.containsKey('route')
            ? RouteData.fromJson(json['route'])
            : null,
      );
}

/// An object representing the traffic distribution requirements for matched
/// HTTP requests.
class HttpRouteAction {
  /// The targets that traffic is routed to when a request matches the route.
  /// You can specify one or more targets and their relative weights with which
  /// to distribute traffic.
  final List<WeightedTarget> weightedTargets;

  HttpRouteAction({
    this.weightedTargets,
  });
  static HttpRouteAction fromJson(Map<String, dynamic> json) => HttpRouteAction(
        weightedTargets: json.containsKey('weightedTargets')
            ? (json['weightedTargets'] as List)
                .map((e) => WeightedTarget.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateVirtualRouterOutput {
  /// The full description of your virtual router following the create call.
  final VirtualRouterData virtualRouter;

  CreateVirtualRouterOutput({
    this.virtualRouter,
  });
  static CreateVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      CreateVirtualRouterOutput(
        virtualRouter: json.containsKey('virtualRouter')
            ? VirtualRouterData.fromJson(json['virtualRouter'])
            : null,
      );
}

/// An object representing the current status of a route.
class RouteStatus {
  /// The current status for the route.
  final String status;

  RouteStatus({
    this.status,
  });
  static RouteStatus fromJson(Map<String, dynamic> json) => RouteStatus(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// An object representing the status of a virtual router.
class VirtualRouterStatus {
  /// The current status of the virtual router.
  final String status;

  VirtualRouterStatus({
    this.status,
  });
  static VirtualRouterStatus fromJson(Map<String, dynamic> json) =>
      VirtualRouterStatus(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

class ListMeshesOutput {
  /// The list of existing service meshes.
  final List<MeshRef> meshes;

  /// The `nextToken` value to include in a future `ListMeshes` request. When
  /// the results of a `ListMeshes` request exceed `limit`, this value can be
  /// used to retrieve the next page of results. This value is `null` when there
  /// are no more results to return.
  final String nextToken;

  ListMeshesOutput({
    @required this.meshes,
    this.nextToken,
  });
  static ListMeshesOutput fromJson(Map<String, dynamic> json) =>
      ListMeshesOutput(
        meshes:
            (json['meshes'] as List).map((e) => MeshRef.fromJson(e)).toList(),
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeVirtualNodeOutput {
  /// The full description of your virtual node.
  final VirtualNodeData virtualNode;

  DescribeVirtualNodeOutput({
    this.virtualNode,
  });
  static DescribeVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      DescribeVirtualNodeOutput(
        virtualNode: json.containsKey('virtualNode')
            ? VirtualNodeData.fromJson(json['virtualNode'])
            : null,
      );
}

class CreateMeshOutput {
  /// The full description of your service mesh following the create call.
  final MeshData mesh;

  CreateMeshOutput({
    this.mesh,
  });
  static CreateMeshOutput fromJson(Map<String, dynamic> json) =>
      CreateMeshOutput(
        mesh: json.containsKey('mesh') ? MeshData.fromJson(json['mesh']) : null,
      );
}

/// An object representing a route returned by a describe operation.
class RouteData {
  /// The name of the service mesh in which the route resides.
  final String meshName;

  /// The associated metadata for the route.
  final ResourceMetadata metadata;

  /// The name of the route.
  final String routeName;

  /// The specifications of the route.
  final RouteSpec spec;

  /// The status of the route.
  final RouteStatus status;

  /// The virtual router with which the route is associated.
  final String virtualRouterName;

  RouteData({
    @required this.meshName,
    this.metadata,
    @required this.routeName,
    this.spec,
    this.status,
    @required this.virtualRouterName,
  });
  static RouteData fromJson(Map<String, dynamic> json) => RouteData(
        meshName: json['meshName'] as String,
        metadata: json.containsKey('metadata')
            ? ResourceMetadata.fromJson(json['metadata'])
            : null,
        routeName: json['routeName'] as String,
        spec:
            json.containsKey('spec') ? RouteSpec.fromJson(json['spec']) : null,
        status: json.containsKey('status')
            ? RouteStatus.fromJson(json['status'])
            : null,
        virtualRouterName: json['virtualRouterName'] as String,
      );
}

/// An object representing the HTTP routing specification for a route.
class HttpRoute {
  /// The action to take if a match is determined.
  final HttpRouteAction action;

  /// The criteria for determining an HTTP request match.
  final HttpRouteMatch match;

  HttpRoute({
    this.action,
    this.match,
  });
  static HttpRoute fromJson(Map<String, dynamic> json) => HttpRoute(
        action: json.containsKey('action')
            ? HttpRouteAction.fromJson(json['action'])
            : null,
        match: json.containsKey('match')
            ? HttpRouteMatch.fromJson(json['match'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListRoutesOutput {
  /// The `nextToken` value to include in a future `ListRoutes` request. When
  /// the results of a `ListRoutes` request exceed `limit`, this value can be
  /// used to retrieve the next page of results. This value is `null` when there
  /// are no more results to return.
  final String nextToken;

  /// The list of existing routes for the specified service mesh and virtual
  /// router.
  final List<RouteRef> routes;

  ListRoutesOutput({
    this.nextToken,
    @required this.routes,
  });
  static ListRoutesOutput fromJson(Map<String, dynamic> json) =>
      ListRoutesOutput(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        routes:
            (json['routes'] as List).map((e) => RouteRef.fromJson(e)).toList(),
      );
}

/// An object representing the specification of a route.
class RouteSpec {
  /// The HTTP routing information for the route.
  final HttpRoute httpRoute;

  RouteSpec({
    this.httpRoute,
  });
  static RouteSpec fromJson(Map<String, dynamic> json) => RouteSpec(
        httpRoute: json.containsKey('httpRoute')
            ? HttpRoute.fromJson(json['httpRoute'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing a virtual router returned by a list operation.
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  final String arn;

  /// The name of the service mesh in which the virtual router resides.
  final String meshName;

  /// The name of the virtual router.
  final String virtualRouterName;

  VirtualRouterRef({
    this.arn,
    this.meshName,
    this.virtualRouterName,
  });
  static VirtualRouterRef fromJson(Map<String, dynamic> json) =>
      VirtualRouterRef(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        meshName:
            json.containsKey('meshName') ? json['meshName'] as String : null,
        virtualRouterName: json.containsKey('virtualRouterName')
            ? json['virtualRouterName'] as String
            : null,
      );
}

class ListVirtualNodesOutput {
  /// The `nextToken` value to include in a future `ListVirtualNodes` request.
  /// When the results of a `ListVirtualNodes` request exceed `limit`, this
  /// value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  /// The list of existing virtual nodes for the specified service mesh.
  final List<VirtualNodeRef> virtualNodes;

  ListVirtualNodesOutput({
    this.nextToken,
    @required this.virtualNodes,
  });
  static ListVirtualNodesOutput fromJson(Map<String, dynamic> json) =>
      ListVirtualNodesOutput(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        virtualNodes: (json['virtualNodes'] as List)
            .map((e) => VirtualNodeRef.fromJson(e))
            .toList(),
      );
}

class DeleteVirtualNodeOutput {
  /// The virtual node that was deleted.
  final VirtualNodeData virtualNode;

  DeleteVirtualNodeOutput({
    this.virtualNode,
  });
  static DeleteVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      DeleteVirtualNodeOutput(
        virtualNode: json.containsKey('virtualNode')
            ? VirtualNodeData.fromJson(json['virtualNode'])
            : null,
      );
}

class ListVirtualRoutersOutput {
  /// The `nextToken` value to include in a future `ListVirtualRouters` request.
  /// When the results of a `ListVirtualRouters` request exceed `limit`, this
  /// value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  /// The list of existing virtual routers for the specified service mesh.
  final List<VirtualRouterRef> virtualRouters;

  ListVirtualRoutersOutput({
    this.nextToken,
    @required this.virtualRouters,
  });
  static ListVirtualRoutersOutput fromJson(Map<String, dynamic> json) =>
      ListVirtualRoutersOutput(
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        virtualRouters: (json['virtualRouters'] as List)
            .map((e) => VirtualRouterRef.fromJson(e))
            .toList(),
      );
}

class CreateVirtualNodeOutput {
  /// The full description of your virtual node following the create call.
  final VirtualNodeData virtualNode;

  CreateVirtualNodeOutput({
    this.virtualNode,
  });
  static CreateVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      CreateVirtualNodeOutput(
        virtualNode: json.containsKey('virtualNode')
            ? VirtualNodeData.fromJson(json['virtualNode'])
            : null,
      );
}

class DeleteVirtualRouterOutput {
  /// The virtual router that was deleted.
  final VirtualRouterData virtualRouter;

  DeleteVirtualRouterOutput({
    this.virtualRouter,
  });
  static DeleteVirtualRouterOutput fromJson(Map<String, dynamic> json) =>
      DeleteVirtualRouterOutput(
        virtualRouter: json.containsKey('virtualRouter')
            ? VirtualRouterData.fromJson(json['virtualRouter'])
            : null,
      );
}

/// An object representing metadata for a resource.
class ResourceMetadata {
  /// The full Amazon Resource Name (ARN) for the resource.
  ///
  ///
  ///
  /// After you create a virtual node, set this value (either the full ARN or
  /// the truncated resource name, for example,
  /// `mesh/default/virtualNode/simpleapp`, as the `APPMESH_VIRTUAL_NODE_NAME`
  /// environment variable for your task group's Envoy proxy container in your
  /// task definition or pod spec. This is then mapped to the `node.id` and
  /// `node.cluster` Envoy parameters.
  ///
  /// If you require your Envoy stats or tracing to use a different name, you
  /// can override the `node.cluster` value that is set by
  /// `APPMESH_VIRTUAL_NODE_NAME` with the `APPMESH_VIRTUAL_NODE_CLUSTER`
  /// environment variable.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last
  /// updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier for the resource.
  final String uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time they are updated.
  final BigInt version;

  ResourceMetadata({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.uid,
    this.version,
  });
  static ResourceMetadata fromJson(Map<String, dynamic> json) =>
      ResourceMetadata(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        lastUpdatedAt: json.containsKey('lastUpdatedAt')
            ? DateTime.parse(json['lastUpdatedAt'])
            : null,
        uid: json.containsKey('uid') ? json['uid'] as String : null,
        version:
            json.containsKey('version') ? BigInt.from(json['version']) : null,
      );
}

/// An object representing a virtual node listener port mapping.
class PortMapping {
  /// The port used for the port mapping.
  final int port;

  /// The protocol used for the port mapping.
  final String protocol;

  PortMapping({
    this.port,
    this.protocol,
  });
  static PortMapping fromJson(Map<String, dynamic> json) => PortMapping(
        port: json.containsKey('port') ? json['port'] as int : null,
        protocol:
            json.containsKey('protocol') ? json['protocol'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the specification of a virtual router.
class VirtualRouterSpec {
  /// The service mesh service names to associate with the virtual router.
  final List<String> serviceNames;

  VirtualRouterSpec({
    this.serviceNames,
  });
  static VirtualRouterSpec fromJson(Map<String, dynamic> json) =>
      VirtualRouterSpec(
        serviceNames: json.containsKey('serviceNames')
            ? (json['serviceNames'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DescribeMeshOutput {
  /// The full description of your service mesh.
  final MeshData mesh;

  DescribeMeshOutput({
    this.mesh,
  });
  static DescribeMeshOutput fromJson(Map<String, dynamic> json) =>
      DescribeMeshOutput(
        mesh: json.containsKey('mesh') ? MeshData.fromJson(json['mesh']) : null,
      );
}

/// An object representing a virtual router returned by a describe operation.
class VirtualRouterData {
  /// The name of the service mesh in which the virtual router resides.
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
    this.metadata,
    this.spec,
    this.status,
    @required this.virtualRouterName,
  });
  static VirtualRouterData fromJson(Map<String, dynamic> json) =>
      VirtualRouterData(
        meshName: json['meshName'] as String,
        metadata: json.containsKey('metadata')
            ? ResourceMetadata.fromJson(json['metadata'])
            : null,
        spec: json.containsKey('spec')
            ? VirtualRouterSpec.fromJson(json['spec'])
            : null,
        status: json.containsKey('status')
            ? VirtualRouterStatus.fromJson(json['status'])
            : null,
        virtualRouterName: json['virtualRouterName'] as String,
      );
}

/// An object representing a listener for a virtual node.
class Listener {
  /// The health check information for the listener.
  final HealthCheckPolicy healthCheck;

  /// The port mapping information for the listener.
  final PortMapping portMapping;

  Listener({
    this.healthCheck,
    this.portMapping,
  });
  static Listener fromJson(Map<String, dynamic> json) => Listener(
        healthCheck: json.containsKey('healthCheck')
            ? HealthCheckPolicy.fromJson(json['healthCheck'])
            : null,
        portMapping: json.containsKey('portMapping')
            ? PortMapping.fromJson(json['portMapping'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing the health check policy for a virtual node's
/// listener.
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring listener healthy.
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  final BigInt intervalMillis;

  /// The destination path for the health check request. This is only required
  /// if the specified protocol is HTTP; if the protocol is TCP, then this
  /// parameter is ignored.
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
      HealthCheckPolicy(
        healthyThreshold: json['healthyThreshold'] as int,
        intervalMillis: BigInt.from(json['intervalMillis']),
        path: json.containsKey('path') ? json['path'] as String : null,
        port: json.containsKey('port') ? json['port'] as int : null,
        protocol: json['protocol'] as String,
        timeoutMillis: BigInt.from(json['timeoutMillis']),
        unhealthyThreshold: json['unhealthyThreshold'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An object representing a service mesh returned by a describe operation.
class MeshData {
  /// The name of the service mesh.
  final String meshName;

  /// The associated metadata for the service mesh.
  final ResourceMetadata metadata;

  /// The status of the service mesh.
  final MeshStatus status;

  MeshData({
    @required this.meshName,
    @required this.metadata,
    this.status,
  });
  static MeshData fromJson(Map<String, dynamic> json) => MeshData(
        meshName: json['meshName'] as String,
        metadata: ResourceMetadata.fromJson(json['metadata']),
        status: json.containsKey('status')
            ? MeshStatus.fromJson(json['status'])
            : null,
      );
}

/// An object representing the requirements for a route to match HTTP requests
/// for a virtual router.
class HttpRouteMatch {
  /// Specifies the path with which to match requests. This parameter must
  /// always start with `/`, which by itself matches all requests to the virtual
  /// router service name. You can also match for path-based routing of
  /// requests. For example, if your virtual router service name is
  /// `my-service.local`, and you want the route to match requests to
  /// `my-service.local/metrics`, then your prefix should be `/metrics`.
  final String prefix;

  HttpRouteMatch({
    this.prefix,
  });
  static HttpRouteMatch fromJson(Map<String, dynamic> json) => HttpRouteMatch(
        prefix: json.containsKey('prefix') ? json['prefix'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteRouteOutput {
  /// The route that was deleted.
  final RouteData route;

  DeleteRouteOutput({
    this.route,
  });
  static DeleteRouteOutput fromJson(Map<String, dynamic> json) =>
      DeleteRouteOutput(
        route: json.containsKey('route')
            ? RouteData.fromJson(json['route'])
            : null,
      );
}

/// An object representing the current status of the virtual node.
class VirtualNodeStatus {
  /// The current status of the virtual node.
  final String status;

  VirtualNodeStatus({
    this.status,
  });
  static VirtualNodeStatus fromJson(Map<String, dynamic> json) =>
      VirtualNodeStatus(
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// An object representing a route returned by a list operation.
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  final String arn;

  /// The name of the service mesh in which the route resides.
  final String meshName;

  /// The name of the route.
  final String routeName;

  /// The virtual router with which the route is associated.
  final String virtualRouterName;

  RouteRef({
    this.arn,
    this.meshName,
    this.routeName,
    this.virtualRouterName,
  });
  static RouteRef fromJson(Map<String, dynamic> json) => RouteRef(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
        meshName:
            json.containsKey('meshName') ? json['meshName'] as String : null,
        routeName:
            json.containsKey('routeName') ? json['routeName'] as String : null,
        virtualRouterName: json.containsKey('virtualRouterName')
            ? json['virtualRouterName'] as String
            : null,
      );
}

class UpdateVirtualNodeOutput {
  /// A full description of the virtual node that was updated.
  final VirtualNodeData virtualNode;

  UpdateVirtualNodeOutput({
    this.virtualNode,
  });
  static UpdateVirtualNodeOutput fromJson(Map<String, dynamic> json) =>
      UpdateVirtualNodeOutput(
        virtualNode: json.containsKey('virtualNode')
            ? VirtualNodeData.fromJson(json['virtualNode'])
            : null,
      );
}
