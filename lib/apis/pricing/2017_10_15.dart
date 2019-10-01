import 'package:meta/meta.dart';

/// AWS Price List Service API (AWS Price List Service) is a centralized and
/// convenient way to programmatically query Amazon Web Services for services,
/// products, and pricing information. The AWS Price List Service uses
/// standardized product attributes such as `Location`, `Storage Class`, and
/// `Operating System`, and provides prices at the SKU level. You can use the
/// AWS Price List Service to build cost control and scenario planning tools,
/// reconcile billing data, forecast future spend for budgeting purposes, and
/// provide cost benefit analysis that compare your internal workloads with AWS.
///
/// Use `GetServices` without a service code to retrieve the service codes for
/// all AWS services, then `GetServices` with a service code to retreive the
/// attribute names for that service. After you have the service code and
/// attribute names, you can use `GetAttributeValues` to see what values are
/// available for an attribute. With the service code and an attribute name and
/// value, you can use `GetProducts` to find specific products that you're
/// interested in, such as an `AmazonEC2` instance, with a `Provisioned IOPS`
/// `volumeType`.
///
/// Service Endpoint
///
/// AWS Price List Service API provides the following two endpoints:
///
/// *   https://api.pricing.us-east-1.amazonaws.com
///
/// *   https://api.pricing.ap-south-1.amazonaws.com
class PricingApi {
  /// Returns the metadata for one service or a list of the metadata for all
  /// services. Use this without a service code to get the service codes for all
  /// services. Use it with a service code, such as `AmazonEC2`, to get
  /// information specific to that service, such as the attribute names
  /// available for that service. For example, some of the attribute names
  /// available for EC2 are `volumeType`, `maxIopsVolume`, `operation`,
  /// `locationType`, and `instanceCapacity10xlarge`.
  Future<void> describeServices(
      {String serviceCode,
      String formatVersion,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of attribute values. Attibutes are similar to the details
  /// in a Price List API offer file. For a list of available attributes, see
  /// [Offer File
  /// Definitions](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs)
  /// in the [AWS Billing and Cost Management User
  /// Guide](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html).
  Future<void> getAttributeValues(
      {@required String serviceCode,
      @required String attributeName,
      String nextToken,
      int maxResults}) async {}

  /// Returns a list of all products that match the filter criteria.
  Future<void> getProducts(
      {String serviceCode,
      List<Filter> filters,
      String formatVersion,
      String nextToken,
      int maxResults}) async {}
}

class AttributeValue {}

class DescribeServicesResponse {}

class Filter {}

class GetAttributeValuesResponse {}

class GetProductsResponse {}

class Service {}
