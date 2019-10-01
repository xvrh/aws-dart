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
  final _client;
  PricingApi(client)
      : _client = client.configured('Pricing', serializer: 'json');

  /// Returns the metadata for one service or a list of the metadata for all
  /// services. Use this without a service code to get the service codes for all
  /// services. Use it with a service code, such as `AmazonEC2`, to get
  /// information specific to that service, such as the attribute names
  /// available for that service. For example, some of the attribute names
  /// available for EC2 are `volumeType`, `maxIopsVolume`, `operation`,
  /// `locationType`, and `instanceCapacity10xlarge`.
  ///
  /// [serviceCode]: The code for the service whose information you want to
  /// retrieve, such as `AmazonEC2`. You can use the `ServiceCode` to filter the
  /// results in a `GetProducts` call. To retrieve a list of all services, leave
  /// this blank.
  ///
  /// [formatVersion]: The format version that you want the response to be in.
  ///
  /// Valid values are: `aws_v1`
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// that you want to retrieve.
  ///
  /// [maxResults]: The maximum number of results that you want returned in the
  /// response.
  Future<DescribeServicesResponse> describeServices(
      {String serviceCode,
      String formatVersion,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeServices', {
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (formatVersion != null) 'FormatVersion': formatVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return DescribeServicesResponse.fromJson(response_);
  }

  /// Returns a list of attribute values. Attibutes are similar to the details
  /// in a Price List API offer file. For a list of available attributes, see
  /// [Offer File Definitions](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs)
  /// in the
  /// [AWS Billing and Cost Management User Guide](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html).
  ///
  /// [serviceCode]: The service code for the service whose attributes you want
  /// to retrieve. For example, if you want the retrieve an EC2 attribute, use
  /// `AmazonEC2`.
  ///
  /// [attributeName]: The name of the attribute that you want to retrieve the
  /// values for, such as `volumeType`.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// that you want to retrieve.
  ///
  /// [maxResults]: The maximum number of results to return in response.
  Future<GetAttributeValuesResponse> getAttributeValues(
      {@required String serviceCode,
      @required String attributeName,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetAttributeValues', {
      'ServiceCode': serviceCode,
      'AttributeName': attributeName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetAttributeValuesResponse.fromJson(response_);
  }

  /// Returns a list of all products that match the filter criteria.
  ///
  /// [serviceCode]: The code for the service whose products you want to
  /// retrieve.
  ///
  /// [filters]: The list of filters that limit the returned products. only
  /// products that match all filters are returned.
  ///
  /// [formatVersion]: The format version that you want the response to be in.
  ///
  /// Valid values are: `aws_v1`
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// that you want to retrieve.
  ///
  /// [maxResults]: The maximum number of results to return in the response.
  Future<GetProductsResponse> getProducts(
      {String serviceCode,
      List<Filter> filters,
      String formatVersion,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetProducts', {
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (filters != null) 'Filters': filters,
      if (formatVersion != null) 'FormatVersion': formatVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetProductsResponse.fromJson(response_);
  }
}

/// The values of a given attribute, such as `Throughput Optimized HDD` or
/// `Provisioned IOPS` for the `Amazon EC2` `volumeType` attribute.
class AttributeValue {
  /// The specific value of an `attributeName`.
  final String value;

  AttributeValue({
    this.value,
  });
  static AttributeValue fromJson(Map<String, dynamic> json) => AttributeValue(
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

class DescribeServicesResponse {
  /// The service metadata for the service or services in the response.
  final List<Service> services;

  /// The format version of the response. For example, `aws_v1`.
  final String formatVersion;

  /// The pagination token for the next set of retreivable results.
  final String nextToken;

  DescribeServicesResponse({
    this.services,
    this.formatVersion,
    this.nextToken,
  });
  static DescribeServicesResponse fromJson(Map<String, dynamic> json) =>
      DescribeServicesResponse(
        services: json.containsKey('Services')
            ? (json['Services'] as List)
                .map((e) => Service.fromJson(e))
                .toList()
            : null,
        formatVersion: json.containsKey('FormatVersion')
            ? json['FormatVersion'] as String
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The constraints that you want all returned products to match.
class Filter {
  /// The type of filter that you want to use.
  ///
  /// Valid values are: `TERM_MATCH`. `TERM_MATCH` returns only products that
  /// match both the given filter field and the given value.
  final String type;

  /// The product metadata field that you want to filter on. You can filter by
  /// just the service code to see all products for a specific service, filter
  /// by just the attribute name to see a specific attribute for multiple
  /// services, or use both a service code and an attribute name to retrieve
  /// only products that match both fields.
  ///
  /// Valid values include: `ServiceCode`, and all attribute names
  ///
  /// For example, you can filter by the `AmazonEC2` service code and the
  /// `volumeType` attribute name to get the prices for only Amazon EC2 volumes.
  final String field;

  /// The service code or attribute value that you want to filter by. If you are
  /// filtering by service code this is the actual service code, such as
  /// `AmazonEC2`. If you are filtering by attribute name, this is the attribute
  /// value that you want the returned products to match, such as a `Provisioned
  /// IOPS` volume.
  final String value;

  Filter({
    @required this.type,
    @required this.field,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetAttributeValuesResponse {
  /// The list of values for an attribute. For example, `Throughput Optimized
  /// HDD` and `Provisioned IOPS` are two available values for the `AmazonEC2`
  /// `volumeType`.
  final List<AttributeValue> attributeValues;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  GetAttributeValuesResponse({
    this.attributeValues,
    this.nextToken,
  });
  static GetAttributeValuesResponse fromJson(Map<String, dynamic> json) =>
      GetAttributeValuesResponse(
        attributeValues: json.containsKey('AttributeValues')
            ? (json['AttributeValues'] as List)
                .map((e) => AttributeValue.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class GetProductsResponse {
  /// The format version of the response. For example, aws_v1.
  final String formatVersion;

  /// The list of products that match your filters. The list contains both the
  /// product metadata and the price information.
  final List<String> priceList;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  GetProductsResponse({
    this.formatVersion,
    this.priceList,
    this.nextToken,
  });
  static GetProductsResponse fromJson(Map<String, dynamic> json) =>
      GetProductsResponse(
        formatVersion: json.containsKey('FormatVersion')
            ? json['FormatVersion'] as String
            : null,
        priceList: json.containsKey('PriceList')
            ? (json['PriceList'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// The metadata for a service, such as the service code and available attribute
/// names.
class Service {
  /// The code for the AWS service.
  final String serviceCode;

  /// The attributes that are available for this service.
  final List<String> attributeNames;

  Service({
    this.serviceCode,
    this.attributeNames,
  });
  static Service fromJson(Map<String, dynamic> json) => Service(
        serviceCode: json.containsKey('ServiceCode')
            ? json['ServiceCode'] as String
            : null,
        attributeNames: json.containsKey('AttributeNames')
            ? (json['AttributeNames'] as List).map((e) => e as String).toList()
            : null,
      );
}
