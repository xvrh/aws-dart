import 'package:meta/meta.dart';

/// AWS Cloud Map lets you configure public DNS, private DNS, or HTTP namespaces
/// that your microservice applications run in. When an instance of the service
/// becomes available, you can call the AWS Cloud Map API to register the
/// instance with AWS Cloud Map. For public or private DNS namespaces, AWS Cloud
/// Map automatically creates DNS records and an optional health check. Clients
/// that submit public or private DNS queries, or HTTP requests, for the service
/// receive an answer that contains up to eight healthy records.
class ServiceDiscoveryApi {
  /// Creates an HTTP namespace. Service instances that you register using an
  /// HTTP namespace can be discovered using a `DiscoverInstances` request but
  /// can't be discovered using DNS.
  ///
  /// For the current limit on the number of namespaces that you can create
  /// using the same AWS account, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  ///
  /// [name]: The name that you want to assign to this namespace.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed `CreateHttpNamespace` requests to be retried without the
  /// risk of executing the operation twice. `CreatorRequestId` can be any
  /// unique string, for example, a date/time stamp.
  ///
  /// [description]: A description for the namespace.
  Future<CreateHttpNamespaceResponse> createHttpNamespace(String name,
      {String creatorRequestId, String description}) async {
    return CreateHttpNamespaceResponse.fromJson({});
  }

  /// Creates a private namespace based on DNS, which will be visible only
  /// inside a specified Amazon VPC. The namespace defines your service naming
  /// scheme. For example, if you name your namespace `example.com` and name
  /// your service `backend`, the resulting DNS name for the service will be
  /// `backend.example.com`. For the current limit on the number of namespaces
  /// that you can create using the same AWS account, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  ///
  /// [name]: The name that you want to assign to this namespace. When you
  /// create a private DNS namespace, AWS Cloud Map automatically creates an
  /// Amazon Route 53 private hosted zone that has the same name as the
  /// namespace.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed `CreatePrivateDnsNamespace` requests to be retried without
  /// the risk of executing the operation twice. `CreatorRequestId` can be any
  /// unique string, for example, a date/time stamp.
  ///
  /// [description]: A description for the namespace.
  ///
  /// [vpc]: The ID of the Amazon VPC that you want to associate the namespace
  /// with.
  Future<CreatePrivateDnsNamespaceResponse> createPrivateDnsNamespace(
      {@required String name,
      String creatorRequestId,
      String description,
      @required String vpc}) async {
    return CreatePrivateDnsNamespaceResponse.fromJson({});
  }

  /// Creates a public namespace based on DNS, which will be visible on the
  /// internet. The namespace defines your service naming scheme. For example,
  /// if you name your namespace `example.com` and name your service `backend`,
  /// the resulting DNS name for the service will be `backend.example.com`. For
  /// the current limit on the number of namespaces that you can create using
  /// the same AWS account, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  ///
  /// [name]: The name that you want to assign to this namespace.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed `CreatePublicDnsNamespace` requests to be retried without
  /// the risk of executing the operation twice. `CreatorRequestId` can be any
  /// unique string, for example, a date/time stamp.
  ///
  /// [description]: A description for the namespace.
  Future<CreatePublicDnsNamespaceResponse> createPublicDnsNamespace(String name,
      {String creatorRequestId, String description}) async {
    return CreatePublicDnsNamespaceResponse.fromJson({});
  }

  /// Creates a service, which defines the configuration for the following
  /// entities:
  ///
  /// *   For public and private DNS namespaces, one of the following
  /// combinations of DNS records in Amazon Route 53:
  ///
  ///     *   A
  ///
  ///     *   AAAA
  ///
  ///     *   A and AAAA
  ///
  ///     *   SRV
  ///
  ///     *   CNAME
  ///
  ///
  /// *   Optionally, a health check
  ///
  ///
  /// After you create the service, you can submit a RegisterInstance request,
  /// and AWS Cloud Map uses the values in the configuration to create the
  /// specified entities.
  ///
  /// For the current limit on the number of instances that you can register
  /// using the same namespace and using the same service, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  ///
  /// [name]: The name that you want to assign to the service.
  ///
  /// [namespaceId]: The ID of the namespace that you want to use to create the
  /// service.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed `CreateService` requests to be retried without the risk of
  /// executing the operation twice. `CreatorRequestId` can be any unique
  /// string, for example, a date/time stamp.
  ///
  /// [description]: A description for the service.
  ///
  /// [dnsConfig]: A complex type that contains information about the Amazon
  /// Route 53 records that you want AWS Cloud Map to create when you register
  /// an instance.
  ///
  /// [healthCheckConfig]:  _Public DNS namespaces only._ A complex type that
  /// contains settings for an optional Route 53 health check. If you specify
  /// settings for a health check, AWS Cloud Map associates the health check
  /// with all the Route 53 DNS records that you specify in `DnsConfig`.
  ///
  ///  If you specify a health check configuration, you can specify either
  /// `HealthCheckCustomConfig` or `HealthCheckConfig` but not both.
  ///
  /// For information about the charges for health checks, see [AWS Cloud Map
  /// Pricing](http://aws.amazon.com/cloud-map/pricing/).
  ///
  /// [healthCheckCustomConfig]: A complex type that contains information about
  /// an optional custom health check.
  ///
  ///
  ///
  /// If you specify a health check configuration, you can specify either
  /// `HealthCheckCustomConfig` or `HealthCheckConfig` but not both.
  Future<CreateServiceResponse> createService(String name,
      {String namespaceId,
      String creatorRequestId,
      String description,
      DnsConfig dnsConfig,
      HealthCheckConfig healthCheckConfig,
      HealthCheckCustomConfig healthCheckCustomConfig}) async {
    return CreateServiceResponse.fromJson({});
  }

  /// Deletes a namespace from the current account. If the namespace still
  /// contains one or more services, the request fails.
  ///
  /// [id]: The ID of the namespace that you want to delete.
  Future<DeleteNamespaceResponse> deleteNamespace(String id) async {
    return DeleteNamespaceResponse.fromJson({});
  }

  /// Deletes a specified service. If the service still contains one or more
  /// registered instances, the request fails.
  ///
  /// [id]: The ID of the service that you want to delete.
  Future<DeleteServiceResponse> deleteService(String id) async {
    return DeleteServiceResponse.fromJson({});
  }

  /// Deletes the Amazon Route 53 DNS records and health check, if any, that AWS
  /// Cloud Map created for the specified instance.
  ///
  /// [serviceId]: The ID of the service that the instance is associated with.
  ///
  /// [instanceId]: The value that you specified for `Id` in the
  /// RegisterInstance request.
  Future<DeregisterInstanceResponse> deregisterInstance(
      {@required String serviceId, @required String instanceId}) async {
    return DeregisterInstanceResponse.fromJson({});
  }

  /// Discovers registered instances for a specified namespace and service.
  ///
  /// [namespaceName]: The name of the namespace that you specified when you
  /// registered the instance.
  ///
  /// [serviceName]: The name of the service that you specified when you
  /// registered the instance.
  ///
  /// [maxResults]: The maximum number of instances that you want Cloud Map to
  /// return in the response to a `DiscoverInstances` request. If you don't
  /// specify a value for `MaxResults`, Cloud Map returns up to 100 instances.
  ///
  /// [queryParameters]: A string map that contains attributes with values that
  /// you can use to filter instances by any custom attribute that you specified
  /// when you registered the instance. Only instances that match all the
  /// specified key/value pairs will be returned.
  ///
  /// [healthStatus]: The health status of the instances that you want to
  /// discover.
  Future<DiscoverInstancesResponse> discoverInstances(
      {@required String namespaceName,
      @required String serviceName,
      int maxResults,
      Map<String, String> queryParameters,
      String healthStatus}) async {
    return DiscoverInstancesResponse.fromJson({});
  }

  /// Gets information about a specified instance.
  ///
  /// [serviceId]: The ID of the service that the instance is associated with.
  ///
  /// [instanceId]: The ID of the instance that you want to get information
  /// about.
  Future<GetInstanceResponse> getInstance(
      {@required String serviceId, @required String instanceId}) async {
    return GetInstanceResponse.fromJson({});
  }

  /// Gets the current health status (`Healthy`, `Unhealthy`, or `Unknown`) of
  /// one or more instances that are associated with a specified service.
  ///
  ///
  ///
  /// There is a brief delay between when you register an instance and when the
  /// health status for the instance is available.
  ///
  /// [serviceId]: The ID of the service that the instance is associated with.
  ///
  /// [instances]: An array that contains the IDs of all the instances that you
  /// want to get the health status for.
  ///
  /// If you omit `Instances`, AWS Cloud Map returns the health status for all
  /// the instances that are associated with the specified service.
  ///
  ///
  ///
  /// To get the IDs for the instances that you've registered by using a
  /// specified service, submit a ListInstances request.
  ///
  /// [maxResults]: The maximum number of instances that you want AWS Cloud Map
  /// to return in the response to a `GetInstancesHealthStatus` request. If you
  /// don't specify a value for `MaxResults`, AWS Cloud Map returns up to 100
  /// instances.
  ///
  /// [nextToken]: For the first `GetInstancesHealthStatus` request, omit this
  /// value.
  ///
  /// If more than `MaxResults` instances match the specified criteria, you can
  /// submit another `GetInstancesHealthStatus` request to get the next group of
  /// results. Specify the value of `NextToken` from the previous response in
  /// the next request.
  Future<GetInstancesHealthStatusResponse> getInstancesHealthStatus(
      String serviceId,
      {List<String> instances,
      int maxResults,
      String nextToken}) async {
    return GetInstancesHealthStatusResponse.fromJson({});
  }

  /// Gets information about a namespace.
  ///
  /// [id]: The ID of the namespace that you want to get information about.
  Future<GetNamespaceResponse> getNamespace(String id) async {
    return GetNamespaceResponse.fromJson({});
  }

  /// Gets information about any operation that returns an operation ID in the
  /// response, such as a `CreateService` request.
  ///
  ///
  ///
  /// To get a list of operations that match specified criteria, see
  /// ListOperations.
  ///
  /// [operationId]: The ID of the operation that you want to get more
  /// information about.
  Future<GetOperationResponse> getOperation(String operationId) async {
    return GetOperationResponse.fromJson({});
  }

  /// Gets the settings for a specified service.
  ///
  /// [id]: The ID of the service that you want to get settings for.
  Future<GetServiceResponse> getService(String id) async {
    return GetServiceResponse.fromJson({});
  }

  /// Lists summary information about the instances that you registered by using
  /// a specified service.
  ///
  /// [serviceId]: The ID of the service that you want to list instances for.
  ///
  /// [nextToken]: For the first `ListInstances` request, omit this value.
  ///
  /// If more than `MaxResults` instances match the specified criteria, you can
  /// submit another `ListInstances` request to get the next group of results.
  /// Specify the value of `NextToken` from the previous response in the next
  /// request.
  ///
  /// [maxResults]: The maximum number of instances that you want AWS Cloud Map
  /// to return in the response to a `ListInstances` request. If you don't
  /// specify a value for `MaxResults`, AWS Cloud Map returns up to 100
  /// instances.
  Future<ListInstancesResponse> listInstances(String serviceId,
      {String nextToken, int maxResults}) async {
    return ListInstancesResponse.fromJson({});
  }

  /// Lists summary information about the namespaces that were created by the
  /// current AWS account.
  ///
  /// [nextToken]: For the first `ListNamespaces` request, omit this value.
  ///
  /// If the response contains `NextToken`, submit another `ListNamespaces`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` namespaces and then filters them based on
  /// the specified criteria. It's possible that no namespaces in the first
  /// `MaxResults` namespaces matched the specified criteria but that subsequent
  /// groups of `MaxResults` namespaces do contain namespaces that match the
  /// criteria.
  ///
  /// [maxResults]: The maximum number of namespaces that you want AWS Cloud Map
  /// to return in the response to a `ListNamespaces` request. If you don't
  /// specify a value for `MaxResults`, AWS Cloud Map returns up to 100
  /// namespaces.
  ///
  /// [filters]: A complex type that contains specifications for the namespaces
  /// that you want to list.
  ///
  /// If you specify more than one filter, a namespace must match all filters to
  /// be returned by `ListNamespaces`.
  Future<ListNamespacesResponse> listNamespaces(
      {String nextToken, int maxResults, List<NamespaceFilter> filters}) async {
    return ListNamespacesResponse.fromJson({});
  }

  /// Lists operations that match the criteria that you specify.
  ///
  /// [nextToken]: For the first `ListOperations` request, omit this value.
  ///
  /// If the response contains `NextToken`, submit another `ListOperations`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` operations and then filters them based on
  /// the specified criteria. It's possible that no operations in the first
  /// `MaxResults` operations matched the specified criteria but that subsequent
  /// groups of `MaxResults` operations do contain operations that match the
  /// criteria.
  ///
  /// [maxResults]: The maximum number of items that you want AWS Cloud Map to
  /// return in the response to a `ListOperations` request. If you don't specify
  /// a value for `MaxResults`, AWS Cloud Map returns up to 100 operations.
  ///
  /// [filters]: A complex type that contains specifications for the operations
  /// that you want to list, for example, operations that you started between a
  /// specified start date and end date.
  ///
  /// If you specify more than one filter, an operation must match all filters
  /// to be returned by `ListOperations`.
  Future<ListOperationsResponse> listOperations(
      {String nextToken, int maxResults, List<OperationFilter> filters}) async {
    return ListOperationsResponse.fromJson({});
  }

  /// Lists summary information for all the services that are associated with
  /// one or more specified namespaces.
  ///
  /// [nextToken]: For the first `ListServices` request, omit this value.
  ///
  /// If the response contains `NextToken`, submit another `ListServices`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` services and then filters them based on
  /// the specified criteria. It's possible that no services in the first
  /// `MaxResults` services matched the specified criteria but that subsequent
  /// groups of `MaxResults` services do contain services that match the
  /// criteria.
  ///
  /// [maxResults]: The maximum number of services that you want AWS Cloud Map
  /// to return in the response to a `ListServices` request. If you don't
  /// specify a value for `MaxResults`, AWS Cloud Map returns up to 100
  /// services.
  ///
  /// [filters]: A complex type that contains specifications for the namespaces
  /// that you want to list services for.
  ///
  /// If you specify more than one filter, an operation must match all filters
  /// to be returned by `ListServices`.
  Future<ListServicesResponse> listServices(
      {String nextToken, int maxResults, List<ServiceFilter> filters}) async {
    return ListServicesResponse.fromJson({});
  }

  /// Creates or updates one or more records and, optionally, creates a health
  /// check based on the settings in a specified service. When you submit a
  /// `RegisterInstance` request, the following occurs:
  ///
  /// *   For each DNS record that you define in the service that is specified
  /// by `ServiceId`, a record is created or updated in the hosted zone that is
  /// associated with the corresponding namespace.
  ///
  /// *   If the service includes `HealthCheckConfig`, a health check is created
  /// based on the settings in the health check configuration.
  ///
  /// *   The health check, if any, is associated with each of the new or
  /// updated records.
  ///
  ///
  ///  One `RegisterInstance` request must complete before you can submit
  /// another request and specify the same service ID and instance ID.
  ///
  /// For more information, see CreateService.
  ///
  /// When AWS Cloud Map receives a DNS query for the specified DNS name, it
  /// returns the applicable value:
  ///
  /// *    **If the health check is healthy**: returns all the records
  ///
  /// *    **If the health check is unhealthy**: returns the applicable value
  /// for the last healthy instance
  ///
  /// *    **If you didn't specify a health check configuration**: returns all
  /// the records
  ///
  ///
  /// For the current limit on the number of instances that you can register
  /// using the same namespace and using the same service, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  ///
  /// [serviceId]: The ID of the service that you want to use for settings for
  /// the instance.
  ///
  /// [instanceId]: An identifier that you want to associate with the instance.
  /// Note the following:
  ///
  /// *   If the service that is specified by `ServiceId` includes settings for
  /// an SRV record, the value of `InstanceId` is automatically included as part
  /// of the value for the SRV record. For more information, see DnsRecord$Type.
  ///
  /// *   You can use this value to update an existing instance.
  ///
  /// *   To register a new instance, you must specify a value that is unique
  /// among instances that you register by using the same service.
  ///
  /// *   If you specify an existing `InstanceId` and `ServiceId`, AWS Cloud Map
  /// updates the existing DNS records, if any. If there's also an existing
  /// health check, AWS Cloud Map deletes the old health check and creates a new
  /// one.
  ///
  ///      The health check isn't deleted immediately, so it will still appear
  /// for a while if you submit a `ListHealthChecks` request, for example.
  ///
  /// [creatorRequestId]: A unique string that identifies the request and that
  /// allows failed `RegisterInstance` requests to be retried without the risk
  /// of executing the operation twice. You must use a unique `CreatorRequestId`
  /// string every time you submit a `RegisterInstance` request if you're
  /// registering additional instances for the same namespace and service.
  /// `CreatorRequestId` can be any unique string, for example, a date/time
  /// stamp.
  ///
  /// [attributes]: A string map that contains the following information for the
  /// service that you specify in `ServiceId`:
  ///
  /// *   The attributes that apply to the records that are defined in the
  /// service.
  ///
  /// *   For each attribute, the applicable value.
  ///
  ///
  /// Supported attribute keys include the following:
  ///
  ///  **AWS\_ALIAS\_DNS_NAME**
  ///
  ///
  ///
  /// **
  ///
  /// If you want AWS Cloud Map to create an Amazon Route 53 alias record that
  /// routes traffic to an Elastic Load Balancing load balancer, specify the DNS
  /// name that is associated with the load balancer. For information about how
  /// to get the DNS name, see "DNSName" in the topic
  /// [AliasTarget](http://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html)
  /// in the _Route 53 API Reference_.
  ///
  /// Note the following:
  ///
  /// *   The configuration for the service that is specified by `ServiceId`
  /// must include settings for an A record, an AAAA record, or both.
  ///
  /// *   In the service that is specified by `ServiceId`, the value of
  /// `RoutingPolicy` must be `WEIGHTED`.
  ///
  /// *   If the service that is specified by `ServiceId` includes
  /// `HealthCheckConfig` settings, AWS Cloud Map will create the Route 53
  /// health check, but it won't associate the health check with the alias
  /// record.
  ///
  /// *   Auto naming currently doesn't support creating alias records that
  /// route traffic to AWS resources other than ELB load balancers.
  ///
  /// *   If you specify a value for `AWS\_ALIAS\_DNS_NAME`, don't specify
  /// values for any of the `AWS_INSTANCE` attributes.
  ///
  ///
  ///  **AWS\_INIT\_HEALTH_STATUS**
  ///
  /// If the service configuration includes `HealthCheckCustomConfig`, you can
  /// optionally use `AWS\_INIT\_HEALTH_STATUS` to specify the initial status of
  /// the custom health check, `HEALTHY` or `UNHEALTHY`. If you don't specify a
  /// value for `AWS\_INIT\_HEALTH_STATUS`, the initial status is `HEALTHY`.
  ///
  ///  **AWS\_INSTANCE\_CNAME**
  ///
  /// If the service configuration includes a CNAME record, the domain name that
  /// you want Route 53 to return in response to DNS queries, for example,
  /// `example.com`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an CNAME record.
  ///
  ///  **AWS\_INSTANCE\_IPV4**
  ///
  /// If the service configuration includes an A record, the IPv4 address that
  /// you want Route 53 to return in response to DNS queries, for example,
  /// `192.0.2.44`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an A record. If the service includes settings for an SRV
  /// record, you must specify a value for `AWS\_INSTANCE\_IPV4`,
  /// `AWS\_INSTANCE\_IPV6`, or both.
  ///
  ///  **AWS\_INSTANCE\_IPV6**
  ///
  /// If the service configuration includes an AAAA record, the IPv6 address
  /// that you want Route 53 to return in response to DNS queries, for example,
  /// `2001:0db8:85a3:0000:0000:abcd:0001:2345`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an AAAA record. If the service includes settings for an SRV
  /// record, you must specify a value for `AWS\_INSTANCE\_IPV4`,
  /// `AWS\_INSTANCE\_IPV6`, or both.
  ///
  ///  **AWS\_INSTANCE\_PORT**
  ///
  /// If the service includes an SRV record, the value that you want Route 53 to
  /// return for the port.
  ///
  /// If the service includes `HealthCheckConfig`, the port on the endpoint that
  /// you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an SRV record when
  /// you created the service.
  ///
  ///  **Custom attributes**
  ///
  /// You can add up to 30 custom attributes. For each key-value pair, the
  /// maximum length of the attribute name is 255 characters, and the maximum
  /// length of the attribute value is 1,024 characters.
  ///
  /// **
  Future<RegisterInstanceResponse> registerInstance(
      {@required String serviceId,
      @required String instanceId,
      String creatorRequestId,
      @required Map<String, String> attributes}) async {
    return RegisterInstanceResponse.fromJson({});
  }

  /// Submits a request to change the health status of a custom health check to
  /// healthy or unhealthy.
  ///
  /// You can use `UpdateInstanceCustomHealthStatus` to change the status only
  /// for custom health checks, which you define using `HealthCheckCustomConfig`
  /// when you create a service. You can't use it to change the status for Route
  /// 53 health checks, which you define using `HealthCheckConfig`.
  ///
  /// For more information, see HealthCheckCustomConfig.
  ///
  /// [serviceId]: The ID of the service that includes the configuration for the
  /// custom health check that you want to change the status for.
  ///
  /// [instanceId]: The ID of the instance that you want to change the health
  /// status for.
  ///
  /// [status]: The new status of the instance, `HEALTHY` or `UNHEALTHY`.
  Future<void> updateInstanceCustomHealthStatus(
      {@required String serviceId,
      @required String instanceId,
      @required String status}) async {}

  /// Submits a request to perform the following operations:
  ///
  /// *   Add or delete `DnsRecords` configurations
  ///
  /// *   Update the TTL setting for existing `DnsRecords` configurations
  ///
  /// *   Add, update, or delete `HealthCheckConfig` for a specified service
  ///
  ///
  /// For public and private DNS namespaces, you must specify all `DnsRecords`
  /// configurations (and, optionally, `HealthCheckConfig`) that you want to
  /// appear in the updated service. Any current configurations that don't
  /// appear in an `UpdateService` request are deleted.
  ///
  /// When you update the TTL setting for a service, AWS Cloud Map also updates
  /// the corresponding settings in all the records and health checks that were
  /// created by using the specified service.
  ///
  /// [id]: The ID of the service that you want to update.
  ///
  /// [service]: A complex type that contains the new settings for the service.
  Future<UpdateServiceResponse> updateService(
      {@required String id, @required ServiceChange service}) async {
    return UpdateServiceResponse.fromJson({});
  }
}

class CreateHttpNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  CreateHttpNamespaceResponse({
    this.operationId,
  });
  static CreateHttpNamespaceResponse fromJson(Map<String, dynamic> json) =>
      CreateHttpNamespaceResponse();
}

class CreatePrivateDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  CreatePrivateDnsNamespaceResponse({
    this.operationId,
  });
  static CreatePrivateDnsNamespaceResponse fromJson(
          Map<String, dynamic> json) =>
      CreatePrivateDnsNamespaceResponse();
}

class CreatePublicDnsNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  CreatePublicDnsNamespaceResponse({
    this.operationId,
  });
  static CreatePublicDnsNamespaceResponse fromJson(Map<String, dynamic> json) =>
      CreatePublicDnsNamespaceResponse();
}

class CreateServiceResponse {
  /// A complex type that contains information about the new service.
  final Service service;

  CreateServiceResponse({
    this.service,
  });
  static CreateServiceResponse fromJson(Map<String, dynamic> json) =>
      CreateServiceResponse();
}

class DeleteNamespaceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  DeleteNamespaceResponse({
    this.operationId,
  });
  static DeleteNamespaceResponse fromJson(Map<String, dynamic> json) =>
      DeleteNamespaceResponse();
}

class DeleteServiceResponse {
  DeleteServiceResponse();
  static DeleteServiceResponse fromJson(Map<String, dynamic> json) =>
      DeleteServiceResponse();
}

class DeregisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. For more information, see GetOperation.
  final String operationId;

  DeregisterInstanceResponse({
    this.operationId,
  });
  static DeregisterInstanceResponse fromJson(Map<String, dynamic> json) =>
      DeregisterInstanceResponse();
}

class DiscoverInstancesResponse {
  /// A complex type that contains one `HttpInstanceSummary` for each registered
  /// instance.
  final List<HttpInstanceSummary> instances;

  DiscoverInstancesResponse({
    this.instances,
  });
  static DiscoverInstancesResponse fromJson(Map<String, dynamic> json) =>
      DiscoverInstancesResponse();
}

class DnsConfig {
  /// The ID of the namespace to use for DNS configuration.
  final String namespaceId;

  /// The routing policy that you want to apply to all Route 53 DNS records that
  /// AWS Cloud Map creates when you register an instance and specify this
  /// service.
  ///
  ///  If you want to use this service to register instances that create alias
  /// records, specify `WEIGHTED` for the routing policy.
  ///
  /// You can specify the following values:
  ///
  ///  **MULTIVALUE**
  ///
  /// If you define a health check for the service and the health check is
  /// healthy, Route 53 returns the applicable value for up to eight instances.
  ///
  /// For example, suppose the service includes configurations for one A record
  /// and a health check, and you use the service to register 10 instances.
  /// Route 53 responds to DNS queries with IP addresses for up to eight healthy
  /// instances. If fewer than eight instances are healthy, Route 53 responds to
  /// every DNS query with the IP addresses for all of the healthy instances.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the values for up to eight
  /// instances.
  ///
  /// For more information about the multivalue routing policy, see [Multivalue
  /// Answer
  /// Routing](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-multivalue)
  /// in the _Route 53 Developer Guide_.
  ///
  ///  **WEIGHTED**
  ///
  /// Route 53 returns the applicable value from one randomly selected instance
  /// from among the instances that you registered using the same service.
  /// Currently, all records have the same weight, so you can't route more or
  /// less traffic to any instances.
  ///
  /// For example, suppose the service includes configurations for one A record
  /// and a health check, and you use the service to register 10 instances.
  /// Route 53 responds to DNS queries with the IP address for one randomly
  /// selected instance from among the healthy instances. If no instances are
  /// healthy, Route 53 responds to DNS queries as if all of the instances were
  /// healthy.
  ///
  /// If you don't define a health check for the service, Route 53 assumes that
  /// all instances are healthy and returns the applicable value for one
  /// randomly selected instance.
  ///
  /// For more information about the weighted routing policy, see [Weighted
  /// Routing](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted)
  /// in the _Route 53 Developer Guide_.
  final String routingPolicy;

  /// An array that contains one `DnsRecord` object for each Route 53 DNS record
  /// that you want AWS Cloud Map to create when you register an instance.
  final List<DnsRecord> dnsRecords;

  DnsConfig({
    this.namespaceId,
    this.routingPolicy,
    @required this.dnsRecords,
  });
  static DnsConfig fromJson(Map<String, dynamic> json) => DnsConfig();
}

class DnsConfigChange {
  /// An array that contains one `DnsRecord` object for each Route 53 record
  /// that you want AWS Cloud Map to create when you register an instance.
  final List<DnsRecord> dnsRecords;

  DnsConfigChange({
    @required this.dnsRecords,
  });
}

class DnsProperties {
  /// The ID for the Route 53 hosted zone that AWS Cloud Map creates when you
  /// create a namespace.
  final String hostedZoneId;

  DnsProperties({
    this.hostedZoneId,
  });
  static DnsProperties fromJson(Map<String, dynamic> json) => DnsProperties();
}

class DnsRecord {
  /// The type of the resource, which indicates the type of value that Route 53
  /// returns in response to DNS queries.
  ///
  /// Note the following:
  ///
  /// *    **A, AAAA, and SRV records:** You can specify settings for a maximum
  /// of one A, one AAAA, and one SRV record. You can specify them in any
  /// combination.
  ///
  /// *    **CNAME records:** If you specify `CNAME` for `Type`, you can't
  /// define any other records. This is a limitation of DNS: you can't create a
  /// CNAME record and any other type of record that has the same name as a
  /// CNAME record.
  ///
  /// *    **Alias records:** If you want AWS Cloud Map to create a Route 53
  /// alias record when you register an instance, specify `A` or `AAAA` for
  /// `Type`.
  ///
  /// *    **All records:** You specify settings other than `TTL` and `Type`
  /// when you register an instance.
  ///
  ///
  /// The following values are supported:
  ///
  ///  **A**
  ///
  /// Route 53 returns the IP address of the resource in IPv4 format, such as
  /// 192.0.2.44.
  ///
  ///  **AAAA**
  ///
  /// Route 53 returns the IP address of the resource in IPv6 format, such as
  /// 2001:0db8:85a3:0000:0000:abcd:0001:2345.
  ///
  ///  **CNAME**
  ///
  /// Route 53 returns the domain name of the resource, such as www.example.com.
  /// Note the following:
  ///
  /// *   You specify the domain name that you want to route traffic to when you
  /// register an instance. For more information, see
  /// RegisterInstanceRequest$Attributes.
  ///
  /// *   You must specify `WEIGHTED` for the value of `RoutingPolicy`.
  ///
  /// *   You can't specify both `CNAME` for `Type` and settings for
  /// `HealthCheckConfig`. If you do, the request will fail with an
  /// `InvalidInput` error.
  ///
  ///
  ///  **SRV**
  ///
  /// Route 53 returns the value for an SRV record. The value for an SRV record
  /// uses the following values:
  ///
  ///  `priority weight port service-hostname`
  ///
  /// Note the following about the values:
  ///
  /// *   The values of `priority` and `weight` are both set to `1` and can't be
  /// changed.
  ///
  /// *   The value of `port` comes from the value that you specify for the
  /// `AWS\_INSTANCE\_PORT` attribute when you submit a RegisterInstance
  /// request.
  ///
  /// *   The value of `service-hostname` is a concatenation of the following
  /// values:
  ///
  ///     *   The value that you specify for `InstanceId` when you register an
  /// instance.
  ///
  ///     *   The name of the service.
  ///
  ///     *   The name of the namespace.
  ///
  ///
  ///     For example, if the value of `InstanceId` is `test`, the name of the
  /// service is `backend`, and the name of the namespace is `example.com`, the
  /// value of `service-hostname` is:
  ///
  ///      `test.backend.example.com`
  ///
  ///
  /// If you specify settings for an SRV record and if you specify values for
  /// `AWS\_INSTANCE\_IPV4`, `AWS\_INSTANCE\_IPV6`, or both in the
  /// `RegisterInstance` request, AWS Cloud Map automatically creates `A` and/or
  /// `AAAA` records that have the same name as the value of `service-hostname`
  /// in the SRV record. You can ignore these records.
  final String type;

  /// The amount of time, in seconds, that you want DNS resolvers to cache the
  /// settings for this record.
  ///
  ///
  ///
  /// Alias records don't include a TTL because Route 53 uses the TTL for the
  /// AWS resource that an alias record routes traffic to. If you include the
  /// `AWS\_ALIAS\_DNS_NAME` attribute when you submit a RegisterInstance
  /// request, the `TTL` value is ignored. Always specify a TTL for the service;
  /// you can use a service to register instances that create either alias or
  /// non-alias records.
  final BigInt ttl;

  DnsRecord({
    @required this.type,
    @required this.ttl,
  });
  static DnsRecord fromJson(Map<String, dynamic> json) => DnsRecord();
}

class GetInstanceResponse {
  /// A complex type that contains information about a specified instance.
  final Instance instance;

  GetInstanceResponse({
    this.instance,
  });
  static GetInstanceResponse fromJson(Map<String, dynamic> json) =>
      GetInstanceResponse();
}

class GetInstancesHealthStatusResponse {
  /// A complex type that contains the IDs and the health status of the
  /// instances that you specified in the `GetInstancesHealthStatus` request.
  final Map<String, String> status;

  /// If more than `MaxResults` instances match the specified criteria, you can
  /// submit another `GetInstancesHealthStatus` request to get the next group of
  /// results. Specify the value of `NextToken` from the previous response in
  /// the next request.
  final String nextToken;

  GetInstancesHealthStatusResponse({
    this.status,
    this.nextToken,
  });
  static GetInstancesHealthStatusResponse fromJson(Map<String, dynamic> json) =>
      GetInstancesHealthStatusResponse();
}

class GetNamespaceResponse {
  /// A complex type that contains information about the specified namespace.
  final Namespace namespace;

  GetNamespaceResponse({
    this.namespace,
  });
  static GetNamespaceResponse fromJson(Map<String, dynamic> json) =>
      GetNamespaceResponse();
}

class GetOperationResponse {
  /// A complex type that contains information about the operation.
  final Operation operation;

  GetOperationResponse({
    this.operation,
  });
  static GetOperationResponse fromJson(Map<String, dynamic> json) =>
      GetOperationResponse();
}

class GetServiceResponse {
  /// A complex type that contains information about the service.
  final Service service;

  GetServiceResponse({
    this.service,
  });
  static GetServiceResponse fromJson(Map<String, dynamic> json) =>
      GetServiceResponse();
}

class HealthCheckConfig {
  /// The type of health check that you want to create, which indicates how
  /// Route 53 determines whether an endpoint is healthy.
  ///
  ///  You can't change the value of `Type` after you create a health check.
  ///
  /// You can create the following types of health checks:
  ///
  /// *    **HTTP**: Route 53 tries to establish a TCP connection. If
  /// successful, Route 53 submits an HTTP request and waits for an HTTP status
  /// code of 200 or greater and less than 400.
  ///
  /// *    **HTTPS**: Route 53 tries to establish a TCP connection. If
  /// successful, Route 53 submits an HTTPS request and waits for an HTTP status
  /// code of 200 or greater and less than 400.
  ///
  ///      If you specify HTTPS for the value of `Type`, the endpoint must
  /// support TLS v1.0 or later.
  /// *    **TCP**: Route 53 tries to establish a TCP connection.
  ///
  ///     If you specify `TCP` for `Type`, don't specify a value for
  /// `ResourcePath`.
  ///
  ///
  /// For more information, see [How Route 53 Determines Whether an Endpoint Is
  /// Healthy](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html)
  /// in the _Route 53 Developer Guide_.
  final String type;

  /// The path that you want Route 53 to request when performing health checks.
  /// The path can be any value for which your endpoint will return an HTTP
  /// status code of 2xx or 3xx when the endpoint is healthy, such as the file
  /// `/docs/route53-health-check.html`. Route 53 automatically adds the DNS
  /// name for the service. If you don't specify a value for `ResourcePath`, the
  /// default value is `/`.
  ///
  /// If you specify `TCP` for `Type`, you must _not_ specify a value for
  /// `ResourcePath`.
  final String resourcePath;

  /// The number of consecutive health checks that an endpoint must pass or fail
  /// for Route 53 to change the current status of the endpoint from unhealthy
  /// to healthy or vice versa. For more information, see [How Route 53
  /// Determines Whether an Endpoint Is
  /// Healthy](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html)
  /// in the _Route 53 Developer Guide_.
  final int failureThreshold;

  HealthCheckConfig({
    @required this.type,
    this.resourcePath,
    this.failureThreshold,
  });
  static HealthCheckConfig fromJson(Map<String, dynamic> json) =>
      HealthCheckConfig();
}

class HealthCheckCustomConfig {
  /// The number of 30-second intervals that you want Cloud Map to wait after
  /// receiving an `UpdateInstanceCustomHealthStatus` request before it changes
  /// the health status of a service instance. For example, suppose you specify
  /// a value of `2` for `FailureTheshold`, and then your application sends an
  /// `UpdateInstanceCustomHealthStatus` request. Cloud Map waits for
  /// approximately 60 seconds (2 x 30) before changing the status of the
  /// service instance based on that request.
  ///
  /// Sending a second or subsequent `UpdateInstanceCustomHealthStatus` request
  /// with the same value before `FailureThreshold x 30` seconds has passed
  /// doesn't accelerate the change. Cloud Map still waits `FailureThreshold x
  /// 30` seconds after the first request to make the change.
  final int failureThreshold;

  HealthCheckCustomConfig({
    this.failureThreshold,
  });
  static HealthCheckCustomConfig fromJson(Map<String, dynamic> json) =>
      HealthCheckCustomConfig();
}

class HttpInstanceSummary {
  /// The ID of an instance that matches the values that you specified in the
  /// request.
  final String instanceId;

  /// The name of the namespace that you specified when you registered the
  /// instance.
  final String namespaceName;

  /// The name of the service that you specified when you registered the
  /// instance.
  final String serviceName;

  /// If you configured health checking in the service, the current health
  /// status of the service instance.
  final String healthStatus;

  /// If you included any attributes when you registered the instance, the
  /// values of those attributes.
  final Map<String, String> attributes;

  HttpInstanceSummary({
    this.instanceId,
    this.namespaceName,
    this.serviceName,
    this.healthStatus,
    this.attributes,
  });
  static HttpInstanceSummary fromJson(Map<String, dynamic> json) =>
      HttpInstanceSummary();
}

class HttpProperties {
  /// The name of an HTTP namespace.
  final String httpName;

  HttpProperties({
    this.httpName,
  });
  static HttpProperties fromJson(Map<String, dynamic> json) => HttpProperties();
}

class Instance {
  /// An identifier that you want to associate with the instance. Note the
  /// following:
  ///
  /// *   If the service that is specified by `ServiceId` includes settings for
  /// an SRV record, the value of `InstanceId` is automatically included as part
  /// of the value for the SRV record. For more information, see DnsRecord$Type.
  ///
  /// *   You can use this value to update an existing instance.
  ///
  /// *   To register a new instance, you must specify a value that is unique
  /// among instances that you register by using the same service.
  ///
  /// *   If you specify an existing `InstanceId` and `ServiceId`, AWS Cloud Map
  /// updates the existing DNS records. If there's also an existing health
  /// check, AWS Cloud Map deletes the old health check and creates a new one.
  ///
  ///      The health check isn't deleted immediately, so it will still appear
  /// for a while if you submit a `ListHealthChecks` request, for example.
  final String id;

  /// A unique string that identifies the request and that allows failed
  /// `RegisterInstance` requests to be retried without the risk of executing
  /// the operation twice. You must use a unique `CreatorRequestId` string every
  /// time you submit a `RegisterInstance` request if you're registering
  /// additional instances for the same namespace and service.
  /// `CreatorRequestId` can be any unique string, for example, a date/time
  /// stamp.
  final String creatorRequestId;

  /// A string map that contains the following information for the service that
  /// you specify in `ServiceId`:
  ///
  /// *   The attributes that apply to the records that are defined in the
  /// service.
  ///
  /// *   For each attribute, the applicable value.
  ///
  ///
  /// Supported attribute keys include the following:
  ///
  ///  **AWS\_ALIAS\_DNS_NAME**
  ///
  ///
  ///
  /// **
  ///
  /// If you want AWS Cloud Map to create a Route 53 alias record that routes
  /// traffic to an Elastic Load Balancing load balancer, specify the DNS name
  /// that is associated with the load balancer. For information about how to
  /// get the DNS name, see "DNSName" in the topic
  /// [AliasTarget](http://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html).
  ///
  /// Note the following:
  ///
  /// *   The configuration for the service that is specified by `ServiceId`
  /// must include settings for an A record, an AAAA record, or both.
  ///
  /// *   In the service that is specified by `ServiceId`, the value of
  /// `RoutingPolicy` must be `WEIGHTED`.
  ///
  /// *   If the service that is specified by `ServiceId` includes
  /// `HealthCheckConfig` settings, AWS Cloud Map will create the health check,
  /// but it won't associate the health check with the alias record.
  ///
  /// *   Auto naming currently doesn't support creating alias records that
  /// route traffic to AWS resources other than ELB load balancers.
  ///
  /// *   If you specify a value for `AWS\_ALIAS\_DNS_NAME`, don't specify
  /// values for any of the `AWS_INSTANCE` attributes.
  ///
  ///
  ///  **AWS\_INSTANCE\_CNAME**
  ///
  /// If the service configuration includes a CNAME record, the domain name that
  /// you want Route 53 to return in response to DNS queries, for example,
  /// `example.com`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an CNAME record.
  ///
  ///  **AWS\_INSTANCE\_IPV4**
  ///
  /// If the service configuration includes an A record, the IPv4 address that
  /// you want Route 53 to return in response to DNS queries, for example,
  /// `192.0.2.44`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an A record. If the service includes settings for an SRV
  /// record, you must specify a value for `AWS\_INSTANCE\_IPV4`,
  /// `AWS\_INSTANCE\_IPV6`, or both.
  ///
  ///  **AWS\_INSTANCE\_IPV6**
  ///
  /// If the service configuration includes an AAAA record, the IPv6 address
  /// that you want Route 53 to return in response to DNS queries, for example,
  /// `2001:0db8:85a3:0000:0000:abcd:0001:2345`.
  ///
  /// This value is required if the service specified by `ServiceId` includes
  /// settings for an AAAA record. If the service includes settings for an SRV
  /// record, you must specify a value for `AWS\_INSTANCE\_IPV4`,
  /// `AWS\_INSTANCE\_IPV6`, or both.
  ///
  ///  **AWS\_INSTANCE\_PORT**
  ///
  /// If the service includes an SRV record, the value that you want Route 53 to
  /// return for the port.
  ///
  /// If the service includes `HealthCheckConfig`, the port on the endpoint that
  /// you want Route 53 to send requests to.
  ///
  /// This value is required if you specified settings for an SRV record when
  /// you created the service.
  ///
  /// **
  final Map<String, String> attributes;

  Instance({
    @required this.id,
    this.creatorRequestId,
    this.attributes,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

class InstanceSummary {
  /// The ID for an instance that you created by using a specified service.
  final String id;

  /// A string map that contains the following information:
  ///
  /// *   The attributes that are associate with the instance.
  ///
  /// *   For each attribute, the applicable value.
  ///
  ///
  /// Supported attribute keys include the following:
  ///
  /// *    `AWS\_ALIAS\_DNS_NAME`: For an alias record that routes traffic to an
  /// Elastic Load Balancing load balancer, the DNS name that is associated with
  /// the load balancer.
  ///
  /// *    `AWS\_INSTANCE\_CNAME`: For a CNAME record, the domain name that
  /// Route 53 returns in response to DNS queries, for example, `example.com`.
  ///
  /// *    `AWS\_INSTANCE\_IPV4`: For an A record, the IPv4 address that Route
  /// 53 returns in response to DNS queries, for example, `192.0.2.44`.
  ///
  /// *    `AWS\_INSTANCE\_IPV6`: For an AAAA record, the IPv6 address that
  /// Route 53 returns in response to DNS queries, for example,
  /// `2001:0db8:85a3:0000:0000:abcd:0001:2345`.
  ///
  /// *    `AWS\_INSTANCE\_PORT`: For an SRV record, the value that Route 53
  /// returns for the port. In addition, if the service includes
  /// `HealthCheckConfig`, the port on the endpoint that Route 53 sends requests
  /// to.
  final Map<String, String> attributes;

  InstanceSummary({
    this.id,
    this.attributes,
  });
  static InstanceSummary fromJson(Map<String, dynamic> json) =>
      InstanceSummary();
}

class ListInstancesResponse {
  /// Summary information about the instances that are associated with the
  /// specified service.
  final List<InstanceSummary> instances;

  /// If more than `MaxResults` instances match the specified criteria, you can
  /// submit another `ListInstances` request to get the next group of results.
  /// Specify the value of `NextToken` from the previous response in the next
  /// request.
  final String nextToken;

  ListInstancesResponse({
    this.instances,
    this.nextToken,
  });
  static ListInstancesResponse fromJson(Map<String, dynamic> json) =>
      ListInstancesResponse();
}

class ListNamespacesResponse {
  /// An array that contains one `NamespaceSummary` object for each namespace
  /// that matches the specified filter criteria.
  final List<NamespaceSummary> namespaces;

  /// If the response contains `NextToken`, submit another `ListNamespaces`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` namespaces and then filters them based on
  /// the specified criteria. It's possible that no namespaces in the first
  /// `MaxResults` namespaces matched the specified criteria but that subsequent
  /// groups of `MaxResults` namespaces do contain namespaces that match the
  /// criteria.
  final String nextToken;

  ListNamespacesResponse({
    this.namespaces,
    this.nextToken,
  });
  static ListNamespacesResponse fromJson(Map<String, dynamic> json) =>
      ListNamespacesResponse();
}

class ListOperationsResponse {
  /// Summary information about the operations that match the specified
  /// criteria.
  final List<OperationSummary> operations;

  /// If the response contains `NextToken`, submit another `ListOperations`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` operations and then filters them based on
  /// the specified criteria. It's possible that no operations in the first
  /// `MaxResults` operations matched the specified criteria but that subsequent
  /// groups of `MaxResults` operations do contain operations that match the
  /// criteria.
  final String nextToken;

  ListOperationsResponse({
    this.operations,
    this.nextToken,
  });
  static ListOperationsResponse fromJson(Map<String, dynamic> json) =>
      ListOperationsResponse();
}

class ListServicesResponse {
  /// An array that contains one `ServiceSummary` object for each service that
  /// matches the specified filter criteria.
  final List<ServiceSummary> services;

  /// If the response contains `NextToken`, submit another `ListServices`
  /// request to get the next group of results. Specify the value of `NextToken`
  /// from the previous response in the next request.
  ///
  ///
  ///
  /// AWS Cloud Map gets `MaxResults` services and then filters them based on
  /// the specified criteria. It's possible that no services in the first
  /// `MaxResults` services matched the specified criteria but that subsequent
  /// groups of `MaxResults` services do contain services that match the
  /// criteria.
  final String nextToken;

  ListServicesResponse({
    this.services,
    this.nextToken,
  });
  static ListServicesResponse fromJson(Map<String, dynamic> json) =>
      ListServicesResponse();
}

class Namespace {
  /// The ID of a namespace.
  final String id;

  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the namespace
  /// when you create it.
  final String arn;

  /// The name of the namespace, such as `example.com`.
  final String name;

  /// The type of the namespace. Valid values are `DNS_PUBLIC` and
  /// `DNS_PRIVATE`.
  final String type;

  /// The description that you specify for the namespace when you create it.
  final String description;

  /// The number of services that are associated with the namespace.
  final int serviceCount;

  /// A complex type that contains information that's specific to the type of
  /// the namespace.
  final NamespaceProperties properties;

  /// The date that the namespace was created, in Unix date/time format and
  /// Coordinated Universal Time (UTC). The value of `CreateDate` is accurate to
  /// milliseconds. For example, the value `1516925490.087` represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime createDate;

  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing an operation twice.
  final String creatorRequestId;

  Namespace({
    this.id,
    this.arn,
    this.name,
    this.type,
    this.description,
    this.serviceCount,
    this.properties,
    this.createDate,
    this.creatorRequestId,
  });
  static Namespace fromJson(Map<String, dynamic> json) => Namespace();
}

class NamespaceFilter {
  /// Specify `TYPE`.
  final String name;

  /// If you specify `EQ` for `Condition`, specify either `DNS_PUBLIC` or
  /// `DNS_PRIVATE`.
  ///
  /// If you specify `IN` for `Condition`, you can specify `DNS_PUBLIC`,
  /// `DNS_PRIVATE`, or both.
  final List<String> values;

  /// The operator that you want to use to determine whether `ListNamespaces`
  /// returns a namespace. Valid values for `condition` include:
  ///
  /// *    `EQ`: When you specify `EQ` for the condition, you can choose to list
  /// only public namespaces or private namespaces, but not both. `EQ` is the
  /// default condition and can be omitted.
  ///
  /// *    `IN`: When you specify `IN` for the condition, you can choose to list
  /// public namespaces, private namespaces, or both.
  ///
  /// *    `BETWEEN`: Not applicable
  final String condition;

  NamespaceFilter({
    @required this.name,
    @required this.values,
    this.condition,
  });
}

class NamespaceProperties {
  /// A complex type that contains the ID for the Route 53 hosted zone that AWS
  /// Cloud Map creates when you create a namespace.
  final DnsProperties dnsProperties;

  /// A complex type that contains the name of an HTTP namespace.
  final HttpProperties httpProperties;

  NamespaceProperties({
    this.dnsProperties,
    this.httpProperties,
  });
  static NamespaceProperties fromJson(Map<String, dynamic> json) =>
      NamespaceProperties();
}

class NamespaceSummary {
  /// The ID of the namespace.
  final String id;

  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the namespace
  /// when you create it.
  final String arn;

  /// The name of the namespace. When you create a namespace, AWS Cloud Map
  /// automatically creates a Route 53 hosted zone that has the same name as the
  /// namespace.
  final String name;

  /// The type of the namespace, either public or private.
  final String type;

  /// A description for the namespace.
  final String description;

  /// The number of services that were created using the namespace.
  final int serviceCount;

  final NamespaceProperties properties;

  /// The date and time that the namespace was created.
  final DateTime createDate;

  NamespaceSummary({
    this.id,
    this.arn,
    this.name,
    this.type,
    this.description,
    this.serviceCount,
    this.properties,
    this.createDate,
  });
  static NamespaceSummary fromJson(Map<String, dynamic> json) =>
      NamespaceSummary();
}

class Operation {
  /// The ID of the operation that you want to get information about.
  final String id;

  /// The name of the operation that is associated with the specified ID.
  final String type;

  /// The status of the operation. Values include the following:
  ///
  /// *    **SUBMITTED**: This is the initial state immediately after you submit
  /// a request.
  ///
  /// *    **PENDING**: AWS Cloud Map is performing the operation.
  ///
  /// *    **SUCCESS**: The operation succeeded.
  ///
  /// *    **FAIL**: The operation failed. For the failure reason, see
  /// `ErrorMessage`.
  final String status;

  /// If the value of `Status` is `FAIL`, the reason that the operation failed.
  final String errorMessage;

  /// The code associated with `ErrorMessage`. Values for `ErrorCode` include
  /// the following:
  ///
  /// *    `ACCESS_DENIED`
  ///
  /// *    `CANNOT\_CREATE\_HOSTED_ZONE`
  ///
  /// *    `EXPIRED_TOKEN`
  ///
  /// *    `HOSTED\_ZONE\_NOT_FOUND`
  ///
  /// *    `INTERNAL_FAILURE`
  ///
  /// *    `INVALID\_CHANGE\_BATCH`
  ///
  /// *    `THROTTLED_REQUEST`
  final String errorCode;

  /// The date and time that the request was submitted, in Unix date/time format
  /// and Coordinated Universal Time (UTC). The value of `CreateDate` is
  /// accurate to milliseconds. For example, the value `1516925490.087`
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime createDate;

  /// The date and time that the value of `Status` changed to the current value,
  /// in Unix date/time format and Coordinated Universal Time (UTC). The value
  /// of `UpdateDate` is accurate to milliseconds. For example, the value
  /// `1516925490.087` represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime updateDate;

  /// The name of the target entity that is associated with the operation:
  ///
  /// *    **NAMESPACE**: The namespace ID is returned in the `ResourceId`
  /// property.
  ///
  /// *    **SERVICE**: The service ID is returned in the `ResourceId` property.
  ///
  /// *    **INSTANCE**: The instance ID is returned in the `ResourceId`
  /// property.
  final Map<String, String> targets;

  Operation({
    this.id,
    this.type,
    this.status,
    this.errorMessage,
    this.errorCode,
    this.createDate,
    this.updateDate,
    this.targets,
  });
  static Operation fromJson(Map<String, dynamic> json) => Operation();
}

class OperationFilter {
  /// Specify the operations that you want to get:
  ///
  /// *    **NAMESPACE_ID**: Gets operations related to specified namespaces.
  ///
  /// *    **SERVICE_ID**: Gets operations related to specified services.
  ///
  /// *    **STATUS**: Gets operations based on the status of the operations:
  /// `SUBMITTED`, `PENDING`, `SUCCEED`, or `FAIL`.
  ///
  /// *    **TYPE**: Gets specified types of operation.
  ///
  /// *    **UPDATE_DATE**: Gets operations that changed status during a
  /// specified date/time range.
  final String name;

  /// Specify values that are applicable to the value that you specify for
  /// `Name`:
  ///
  /// *    **NAMESPACE_ID**: Specify one namespace ID.
  ///
  /// *    **SERVICE_ID**: Specify one service ID.
  ///
  /// *    **STATUS**: Specify one or more statuses: `SUBMITTED`, `PENDING`,
  /// `SUCCEED`, or `FAIL`.
  ///
  /// *    **TYPE**: Specify one or more of the following types:
  /// `CREATE_NAMESPACE`, `DELETE_NAMESPACE`, `UPDATE_SERVICE`,
  /// `REGISTER_INSTANCE`, or `DEREGISTER_INSTANCE`.
  ///
  /// *    **UPDATE_DATE**: Specify a start date and an end date in Unix
  /// date/time format and Coordinated Universal Time (UTC). The start date must
  /// be the first value.
  final List<String> values;

  /// The operator that you want to use to determine whether an operation
  /// matches the specified value. Valid values for condition include:
  ///
  /// *    `EQ`: When you specify `EQ` for the condition, you can specify only
  /// one value. `EQ` is supported for `NAMESPACE_ID`, `SERVICE_ID`, `STATUS`,
  /// and `TYPE`. `EQ` is the default condition and can be omitted.
  ///
  /// *    `IN`: When you specify `IN` for the condition, you can specify a list
  /// of one or more values. `IN` is supported for `STATUS` and `TYPE`. An
  /// operation must match one of the specified values to be returned in the
  /// response.
  ///
  /// *    `BETWEEN`: Specify a start date and an end date in Unix date/time
  /// format and Coordinated Universal Time (UTC). The start date must be the
  /// first value. `BETWEEN` is supported for `UPDATE_DATE`.
  final String condition;

  OperationFilter({
    @required this.name,
    @required this.values,
    this.condition,
  });
}

class OperationSummary {
  /// The ID for an operation.
  final String id;

  /// The status of the operation. Values include the following:
  ///
  /// *    **SUBMITTED**: This is the initial state immediately after you submit
  /// a request.
  ///
  /// *    **PENDING**: AWS Cloud Map is performing the operation.
  ///
  /// *    **SUCCESS**: The operation succeeded.
  ///
  /// *    **FAIL**: The operation failed. For the failure reason, see
  /// `ErrorMessage`.
  final String status;

  OperationSummary({
    this.id,
    this.status,
  });
  static OperationSummary fromJson(Map<String, dynamic> json) =>
      OperationSummary();
}

class RegisterInstanceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  RegisterInstanceResponse({
    this.operationId,
  });
  static RegisterInstanceResponse fromJson(Map<String, dynamic> json) =>
      RegisterInstanceResponse();
}

class Service {
  /// The ID that AWS Cloud Map assigned to the service when you created it.
  final String id;

  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the service
  /// when you create it.
  final String arn;

  /// The name of the service.
  final String name;

  /// The ID of the namespace that was used to create the service.
  final String namespaceId;

  /// The description of the service.
  final String description;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that have
  /// been deleted are not included in the count.
  final int instanceCount;

  /// A complex type that contains information about the Route 53 DNS records
  /// that you want AWS Cloud Map to create when you register an instance.
  final DnsConfig dnsConfig;

  ///  _Public DNS namespaces only._ A complex type that contains settings for
  /// an optional health check. If you specify settings for a health check, AWS
  /// Cloud Map associates the health check with the records that you specify in
  /// `DnsConfig`.
  ///
  /// For information about the charges for health checks, see [Amazon Route 53
  /// Pricing](http://aws.amazon.com/route53/pricing/).
  final HealthCheckConfig healthCheckConfig;

  /// A complex type that contains information about an optional custom health
  /// check.
  ///
  ///
  ///
  /// If you specify a health check configuration, you can specify either
  /// `HealthCheckCustomConfig` or `HealthCheckConfig` but not both.
  final HealthCheckCustomConfig healthCheckCustomConfig;

  /// The date and time that the service was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of `CreateDate` is accurate to
  /// milliseconds. For example, the value `1516925490.087` represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime createDate;

  /// A unique string that identifies the request and that allows failed
  /// requests to be retried without the risk of executing the operation twice.
  /// `CreatorRequestId` can be any unique string, for example, a date/time
  /// stamp.
  final String creatorRequestId;

  Service({
    this.id,
    this.arn,
    this.name,
    this.namespaceId,
    this.description,
    this.instanceCount,
    this.dnsConfig,
    this.healthCheckConfig,
    this.healthCheckCustomConfig,
    this.createDate,
    this.creatorRequestId,
  });
  static Service fromJson(Map<String, dynamic> json) => Service();
}

class ServiceChange {
  /// A description for the service.
  final String description;

  /// A complex type that contains information about the Route 53 DNS records
  /// that you want AWS Cloud Map to create when you register an instance.
  final DnsConfigChange dnsConfig;

  final HealthCheckConfig healthCheckConfig;

  ServiceChange({
    this.description,
    @required this.dnsConfig,
    this.healthCheckConfig,
  });
}

class ServiceFilter {
  /// Specify `NAMESPACE_ID`.
  final String name;

  /// The values that are applicable to the value that you specify for
  /// `Condition` to filter the list of services.
  final List<String> values;

  /// The operator that you want to use to determine whether a service is
  /// returned by `ListServices`. Valid values for `Condition` include the
  /// following:
  ///
  /// *    `EQ`: When you specify `EQ`, specify one namespace ID for `Values`.
  /// `EQ` is the default condition and can be omitted.
  ///
  /// *    `IN`: When you specify `IN`, specify a list of the IDs for the
  /// namespaces that you want `ListServices` to return a list of services for.
  ///
  /// *    `BETWEEN`: Not applicable.
  final String condition;

  ServiceFilter({
    @required this.name,
    @required this.values,
    this.condition,
  });
}

class ServiceSummary {
  /// The ID that AWS Cloud Map assigned to the service when you created it.
  final String id;

  /// The Amazon Resource Name (ARN) that AWS Cloud Map assigns to the service
  /// when you create it.
  final String arn;

  /// The name of the service.
  final String name;

  /// The description that you specify when you create the service.
  final String description;

  /// The number of instances that are currently associated with the service.
  /// Instances that were previously associated with the service but that have
  /// been deleted are not included in the count.
  final int instanceCount;

  final DnsConfig dnsConfig;

  final HealthCheckConfig healthCheckConfig;

  final HealthCheckCustomConfig healthCheckCustomConfig;

  /// The date and time that the service was created.
  final DateTime createDate;

  ServiceSummary({
    this.id,
    this.arn,
    this.name,
    this.description,
    this.instanceCount,
    this.dnsConfig,
    this.healthCheckConfig,
    this.healthCheckCustomConfig,
    this.createDate,
  });
  static ServiceSummary fromJson(Map<String, dynamic> json) => ServiceSummary();
}

class UpdateServiceResponse {
  /// A value that you can use to determine whether the request completed
  /// successfully. To get the status of the operation, see GetOperation.
  final String operationId;

  UpdateServiceResponse({
    this.operationId,
  });
  static UpdateServiceResponse fromJson(Map<String, dynamic> json) =>
      UpdateServiceResponse();
}
