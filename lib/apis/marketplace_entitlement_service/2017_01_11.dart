import 'package:meta/meta.dart';

/// AWS Marketplace Entitlement Service
///
/// This reference provides descriptions of the AWS Marketplace Entitlement
/// Service API.
///
/// AWS Marketplace Entitlement Service is used to determine the entitlement of
/// a customer to a given product. An entitlement represents capacity in a
/// product owned by the customer. For example, a customer might own some number
/// of users or seats in an SaaS application or some amount of data capacity in
/// a multi-tenant database.
///
///  **Getting Entitlement Records**
///
/// *    _GetEntitlements_- Gets the entitlements for a Marketplace product.
class MarketplaceEntitlementServiceApi {
  final _client;
  MarketplaceEntitlementServiceApi(client)
      : _client = client.configured('Marketplace Entitlement Service',
            serializer: 'json');

  /// GetEntitlements retrieves entitlement values for a given product. The
  /// results can be filtered based on customer identifier or product
  /// dimensions.
  ///
  /// [productCode]: Product code is used to uniquely identify a product in AWS
  /// Marketplace. The product code will be provided by AWS Marketplace when the
  /// product listing is created.
  ///
  /// [filter]: Filter is used to return entitlements for a specific customer or
  /// for a specific dimension. Filters are described as keys mapped to a lists
  /// of values. Filtered requests are _unioned_ for each value in the value
  /// list, and then _intersected_ for each filter key.
  ///
  /// [nextToken]: For paginated calls to GetEntitlements, pass the NextToken
  /// from the previous GetEntitlementsResult.
  ///
  /// [maxResults]: The maximum number of items to retrieve from the
  /// GetEntitlements operation. For pagination, use the NextToken field in
  /// subsequent calls to GetEntitlements.
  Future<GetEntitlementsResult> getEntitlements(String productCode,
      {Map<String, List<String>> filter,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('GetEntitlements', {
      'ProductCode': productCode,
      if (filter != null) 'Filter': filter,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return GetEntitlementsResult.fromJson(response_);
  }
}

/// An entitlement represents capacity in a product owned by the customer. For
/// example, a customer might own some number of users or seats in an SaaS
/// application or some amount of data capacity in a multi-tenant database.
class Entitlement {
  /// The product code for which the given entitlement applies. Product codes
  /// are provided by AWS Marketplace when the product listing is created.
  final String productCode;

  /// The dimension for which the given entitlement applies. Dimensions
  /// represent categories of capacity in a product and are specified when the
  /// product is listed in AWS Marketplace.
  final String dimension;

  /// The customer identifier is a handle to each unique customer in an
  /// application. Customer identifiers are obtained through the ResolveCustomer
  /// operation in AWS Marketplace Metering Service.
  final String customerIdentifier;

  /// The EntitlementValue represents the amount of capacity that the customer
  /// is entitled to for the product.
  final EntitlementValue value;

  /// The expiration date represents the minimum date through which this
  /// entitlement is expected to remain valid. For contractual products listed
  /// on AWS Marketplace, the expiration date is the date at which the customer
  /// will renew or cancel their contract. Customers who are opting to renew
  /// their contract will still have entitlements with an expiration date.
  final DateTime expirationDate;

  Entitlement({
    this.productCode,
    this.dimension,
    this.customerIdentifier,
    this.value,
    this.expirationDate,
  });
  static Entitlement fromJson(Map<String, dynamic> json) => Entitlement(
        productCode: json.containsKey('ProductCode')
            ? json['ProductCode'] as String
            : null,
        dimension:
            json.containsKey('Dimension') ? json['Dimension'] as String : null,
        customerIdentifier: json.containsKey('CustomerIdentifier')
            ? json['CustomerIdentifier'] as String
            : null,
        value: json.containsKey('Value')
            ? EntitlementValue.fromJson(json['Value'])
            : null,
        expirationDate: json.containsKey('ExpirationDate')
            ? DateTime.parse(json['ExpirationDate'])
            : null,
      );
}

/// The EntitlementValue represents the amount of capacity that the customer is
/// entitled to for the product.
class EntitlementValue {
  /// The IntegerValue field will be populated with an integer value when the
  /// entitlement is an integer type. Otherwise, the field will not be set.
  final int integerValue;

  /// The DoubleValue field will be populated with a double value when the
  /// entitlement is a double type. Otherwise, the field will not be set.
  final double doubleValue;

  /// The BooleanValue field will be populated with a boolean value when the
  /// entitlement is a boolean type. Otherwise, the field will not be set.
  final bool booleanValue;

  /// The StringValue field will be populated with a string value when the
  /// entitlement is a string type. Otherwise, the field will not be set.
  final String stringValue;

  EntitlementValue({
    this.integerValue,
    this.doubleValue,
    this.booleanValue,
    this.stringValue,
  });
  static EntitlementValue fromJson(Map<String, dynamic> json) =>
      EntitlementValue(
        integerValue: json.containsKey('IntegerValue')
            ? json['IntegerValue'] as int
            : null,
        doubleValue: json.containsKey('DoubleValue')
            ? json['DoubleValue'] as double
            : null,
        booleanValue: json.containsKey('BooleanValue')
            ? json['BooleanValue'] as bool
            : null,
        stringValue: json.containsKey('StringValue')
            ? json['StringValue'] as String
            : null,
      );
}

/// The GetEntitlementsRequest contains results from the GetEntitlements
/// operation.
class GetEntitlementsResult {
  /// The set of entitlements found through the GetEntitlements operation. If
  /// the result contains an empty set of entitlements, NextToken might still be
  /// present and should be used.
  final List<Entitlement> entitlements;

  /// For paginated results, use NextToken in subsequent calls to
  /// GetEntitlements. If the result contains an empty set of entitlements,
  /// NextToken might still be present and should be used.
  final String nextToken;

  GetEntitlementsResult({
    this.entitlements,
    this.nextToken,
  });
  static GetEntitlementsResult fromJson(Map<String, dynamic> json) =>
      GetEntitlementsResult(
        entitlements: json.containsKey('Entitlements')
            ? (json['Entitlements'] as List)
                .map((e) => Entitlement.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}
