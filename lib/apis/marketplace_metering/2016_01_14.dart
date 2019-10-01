import 'package:meta/meta.dart';

/// AWS Marketplace Metering Service
///
/// This reference provides descriptions of the low-level AWS Marketplace
/// Metering Service API.
///
/// AWS Marketplace sellers can use this API to submit usage data for custom
/// usage dimensions.
///
///  **Submitting Metering Records**
///
/// *    _MeterUsage_\- Submits the metering record for a Marketplace product.
/// MeterUsage is called from an EC2 instance.
///
/// *    _BatchMeterUsage_\- Submits the metering record for a set of customers.
/// BatchMeterUsage is called from a software-as-a-service (SaaS) application.
///
///
///  **Accepting New Customers**
///
/// *    _ResolveCustomer_\- Called by a SaaS application during the
/// registration process. When a buyer visits your website during the
/// registration process, the buyer submits a Registration Token through the
/// browser. The Registration Token is resolved through this API to obtain a
/// CustomerIdentifier and Product Code.
///
///
///  **Entitlement and Metering for Paid Container Products**
///
/// *    Paid container software products sold through AWS Marketplace must
/// integrate with the AWS Marketplace Metering Service and call the
/// RegisterUsage operation for software entitlement and metering. Calling
/// RegisterUsage from containers running outside of Amazon Elastic Container
/// Service (Amazon ECR) isn't supported. Free and BYOL products for ECS aren't
/// required to call RegisterUsage, but you can do so if you want to receive
/// usage data in your seller reports. For more information on using the
/// RegisterUsage operation, see [Container-Based
/// Products](https://docs.aws.amazon.com/marketplace/latest/userguide/container-based-products.html).
///
///
/// BatchMeterUsage API calls are captured by AWS CloudTrail. You can use
/// Cloudtrail to verify that the SaaS metering records that you sent are
/// accurate by searching for records with the eventName of BatchMeterUsage. You
/// can also use CloudTrail to audit records over time. For more information,
/// see the  _[AWS CloudTrail User
/// Guide](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html)_
/// .
class MarketplaceMeteringApi {
  /// BatchMeterUsage is called from a SaaS application listed on the AWS
  /// Marketplace to post metering records for a set of customers.
  ///
  /// For identical requests, the API is idempotent; requests can be retried
  /// with the same records or a subset of the input records.
  ///
  /// Every request to BatchMeterUsage is for one product. If you need to meter
  /// usage for multiple products, you must make multiple calls to
  /// BatchMeterUsage.
  ///
  /// BatchMeterUsage can process up to 25 UsageRecords at a time.
  Future<void> batchMeterUsage(
      {@required List<UsageRecord> usageRecords,
      @required String productCode}) async {}

  /// API to emit metering records. For identical requests, the API is
  /// idempotent. It simply returns the metering record ID.
  ///
  /// MeterUsage is authenticated on the buyer's AWS account, generally when
  /// running from an EC2 instance on the AWS Marketplace.
  Future<void> meterUsage(
      {@required String productCode,
      @required DateTime timestamp,
      @required String usageDimension,
      int usageQuantity,
      bool dryRun}) async {}

  /// Paid container software products sold through AWS Marketplace must
  /// integrate with the AWS Marketplace Metering Service and call the
  /// RegisterUsage operation for software entitlement and metering. Calling
  /// RegisterUsage from containers running outside of ECS is not currently
  /// supported. Free and BYOL products for ECS aren't required to call
  /// RegisterUsage, but you may choose to do so if you would like to receive
  /// usage data in your seller reports. The sections below explain the behavior
  /// of RegisterUsage. RegisterUsage performs two primary functions: metering
  /// and entitlement.
  ///
  /// *    _Entitlement_: RegisterUsage allows you to verify that the customer
  /// running your paid software is subscribed to your product on AWS
  /// Marketplace, enabling you to guard against unauthorized use. Your
  /// container image that integrates with RegisterUsage is only required to
  /// guard against unauthorized use at container startup, as such a
  /// CustomerNotSubscribedException/PlatformNotSupportedException will only be
  /// thrown on the initial call to RegisterUsage. Subsequent calls from the
  /// same Amazon ECS task instance (e.g. task-id) will not throw a
  /// CustomerNotSubscribedException, even if the customer unsubscribes while
  /// the Amazon ECS task is still running.
  ///
  /// *    _Metering_: RegisterUsage meters software use per ECS task, per hour,
  /// with usage prorated to the second. A minimum of 1 minute of usage applies
  /// to tasks that are short lived. For example, if a customer has a 10 node
  /// ECS cluster and creates an ECS service configured as a Daemon Set, then
  /// ECS will launch a task on all 10 cluster nodes and the customer will be
  /// charged: (10 * hourly_rate). Metering for software use is automatically
  /// handled by the AWS Marketplace Metering Control Plane -- your software is
  /// not required to perform any metering specific actions, other than call
  /// RegisterUsage once for metering of software use to commence. The AWS
  /// Marketplace Metering Control Plane will also continue to bill customers
  /// for running ECS tasks, regardless of the customers subscription state,
  /// removing the need for your software to perform entitlement checks at
  /// runtime.
  Future<void> registerUsage(
      {@required String productCode,
      @required int publicKeyVersion,
      String nonce}) async {}

  /// ResolveCustomer is called by a SaaS application during the registration
  /// process. When a buyer visits your website during the registration process,
  /// the buyer submits a registration token through their browser. The
  /// registration token is resolved through this API to obtain a
  /// CustomerIdentifier and product code.
  Future<void> resolveCustomer(String registrationToken) async {}
}

class BatchMeterUsageResult {}

class MeterUsageResult {}

class RegisterUsageResult {}

class ResolveCustomerResult {}

class UsageRecord {}

class UsageRecordResult {}
