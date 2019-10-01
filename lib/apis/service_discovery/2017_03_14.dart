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
  Future<void> createHttpNamespace(String name,
      {String creatorRequestId, String description}) async {}

  /// Creates a private namespace based on DNS, which will be visible only
  /// inside a specified Amazon VPC. The namespace defines your service naming
  /// scheme. For example, if you name your namespace `example.com` and name
  /// your service `backend`, the resulting DNS name for the service will be
  /// `backend.example.com`. For the current limit on the number of namespaces
  /// that you can create using the same AWS account, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  Future<void> createPrivateDnsNamespace(
      {@required String name,
      String creatorRequestId,
      String description,
      @required String vpc}) async {}

  /// Creates a public namespace based on DNS, which will be visible on the
  /// internet. The namespace defines your service naming scheme. For example,
  /// if you name your namespace `example.com` and name your service `backend`,
  /// the resulting DNS name for the service will be `backend.example.com`. For
  /// the current limit on the number of namespaces that you can create using
  /// the same AWS account, see [AWS Cloud Map
  /// Limits](http://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html)
  /// in the _AWS Cloud Map Developer Guide_.
  Future<void> createPublicDnsNamespace(String name,
      {String creatorRequestId, String description}) async {}

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
  Future<void> createService(String name,
      {String namespaceId,
      String creatorRequestId,
      String description,
      DnsConfig dnsConfig,
      HealthCheckConfig healthCheckConfig,
      HealthCheckCustomConfig healthCheckCustomConfig}) async {}

  /// Deletes a namespace from the current account. If the namespace still
  /// contains one or more services, the request fails.
  Future<void> deleteNamespace(String id) async {}

  /// Deletes a specified service. If the service still contains one or more
  /// registered instances, the request fails.
  Future<void> deleteService(String id) async {}

  /// Deletes the Amazon Route 53 DNS records and health check, if any, that AWS
  /// Cloud Map created for the specified instance.
  Future<void> deregisterInstance(
      {@required String serviceId, @required String instanceId}) async {}

  /// Discovers registered instances for a specified namespace and service.
  Future<void> discoverInstances(
      {@required String namespaceName,
      @required String serviceName,
      int maxResults,
      Map<String, String> queryParameters,
      String healthStatus}) async {}

  /// Gets information about a specified instance.
  Future<void> getInstance(
      {@required String serviceId, @required String instanceId}) async {}

  /// Gets the current health status (`Healthy`, `Unhealthy`, or `Unknown`) of
  /// one or more instances that are associated with a specified service.
  ///
  ///
  ///
  /// There is a brief delay between when you register an instance and when the
  /// health status for the instance is available.
  Future<void> getInstancesHealthStatus(String serviceId,
      {List<String> instances, int maxResults, String nextToken}) async {}

  /// Gets information about a namespace.
  Future<void> getNamespace(String id) async {}

  /// Gets information about any operation that returns an operation ID in the
  /// response, such as a `CreateService` request.
  ///
  ///
  ///
  /// To get a list of operations that match specified criteria, see
  /// ListOperations.
  Future<void> getOperation(String operationId) async {}

  /// Gets the settings for a specified service.
  Future<void> getService(String id) async {}

  /// Lists summary information about the instances that you registered by using
  /// a specified service.
  Future<void> listInstances(String serviceId,
      {String nextToken, int maxResults}) async {}

  /// Lists summary information about the namespaces that were created by the
  /// current AWS account.
  Future<void> listNamespaces(
      {String nextToken,
      int maxResults,
      List<NamespaceFilter> filters}) async {}

  /// Lists operations that match the criteria that you specify.
  Future<void> listOperations(
      {String nextToken,
      int maxResults,
      List<OperationFilter> filters}) async {}

  /// Lists summary information for all the services that are associated with
  /// one or more specified namespaces.
  Future<void> listServices(
      {String nextToken, int maxResults, List<ServiceFilter> filters}) async {}

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
  Future<void> registerInstance(
      {@required String serviceId,
      @required String instanceId,
      String creatorRequestId,
      @required Map<String, String> attributes}) async {}

  /// Submits a request to change the health status of a custom health check to
  /// healthy or unhealthy.
  ///
  /// You can use `UpdateInstanceCustomHealthStatus` to change the status only
  /// for custom health checks, which you define using `HealthCheckCustomConfig`
  /// when you create a service. You can't use it to change the status for Route
  /// 53 health checks, which you define using `HealthCheckConfig`.
  ///
  /// For more information, see HealthCheckCustomConfig.
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
  Future<void> updateService(
      {@required String id, @required ServiceChange service}) async {}
}

class CreateHttpNamespaceResponse {}

class CreatePrivateDnsNamespaceResponse {}

class CreatePublicDnsNamespaceResponse {}

class CreateServiceResponse {}

class DeleteNamespaceResponse {}

class DeleteServiceResponse {}

class DeregisterInstanceResponse {}

class DiscoverInstancesResponse {}

class DnsConfig {}

class DnsConfigChange {}

class DnsProperties {}

class DnsRecord {}

class GetInstanceResponse {}

class GetInstancesHealthStatusResponse {}

class GetNamespaceResponse {}

class GetOperationResponse {}

class GetServiceResponse {}

class HealthCheckConfig {}

class HealthCheckCustomConfig {}

class HttpInstanceSummary {}

class HttpProperties {}

class Instance {}

class InstanceSummary {}

class ListInstancesResponse {}

class ListNamespacesResponse {}

class ListOperationsResponse {}

class ListServicesResponse {}

class Namespace {}

class NamespaceFilter {}

class NamespaceProperties {}

class NamespaceSummary {}

class Operation {}

class OperationFilter {}

class OperationSummary {}

class RegisterInstanceResponse {}

class Service {}

class ServiceChange {}

class ServiceFilter {}

class ServiceSummary {}

class UpdateServiceResponse {}
