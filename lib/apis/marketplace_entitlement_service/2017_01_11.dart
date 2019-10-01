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
/// *    _GetEntitlements_\- Gets the entitlements for a Marketplace product.
class MarketplaceEntitlementServiceApi {
  /// GetEntitlements retrieves entitlement values for a given product. The
  /// results can be filtered based on customer identifier or product
  /// dimensions.
  Future<void> getEntitlements(String productCode,
      {Map<String, List<String>> filter,
      String nextToken,
      int maxResults}) async {}
}

class Entitlement {}

class EntitlementValue {}

class GetEntitlementsResult {}
