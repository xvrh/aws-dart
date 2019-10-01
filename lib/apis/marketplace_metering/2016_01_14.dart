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
  ///
  /// [usageRecords]: The set of UsageRecords to submit. BatchMeterUsage accepts
  /// up to 25 UsageRecords at a time.
  ///
  /// [productCode]: Product code is used to uniquely identify a product in AWS
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  Future<BatchMeterUsageResult> batchMeterUsage(
      {@required List<UsageRecord> usageRecords,
      @required String productCode}) async {
    return BatchMeterUsageResult.fromJson({});
  }

  /// API to emit metering records. For identical requests, the API is
  /// idempotent. It simply returns the metering record ID.
  ///
  /// MeterUsage is authenticated on the buyer's AWS account, generally when
  /// running from an EC2 instance on the AWS Marketplace.
  ///
  /// [productCode]: Product code is used to uniquely identify a product in AWS
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  ///
  /// [timestamp]: Timestamp, in UTC, for which the usage is being reported.
  /// Your application can meter usage for up to one hour in the past. Make sure
  /// the timestamp value is not before the start of the software usage.
  ///
  /// [usageDimension]: It will be one of the fcp dimension name provided during
  /// the publishing of the product.
  ///
  /// [usageQuantity]: Consumption value for the hour. Defaults to `0` if not
  /// specified.
  ///
  /// [dryRun]: Checks whether you have the permissions required for the action,
  /// but does not make the request. If you have the permissions, the request
  /// returns DryRunOperation; otherwise, it returns UnauthorizedException.
  /// Defaults to `false` if not specified.
  Future<MeterUsageResult> meterUsage(
      {@required String productCode,
      @required DateTime timestamp,
      @required String usageDimension,
      int usageQuantity,
      bool dryRun}) async {
    return MeterUsageResult.fromJson({});
  }

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
  ///
  /// [productCode]: Product code is used to uniquely identify a product in AWS
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  ///
  /// [publicKeyVersion]: Public Key Version provided by AWS Marketplace
  ///
  /// [nonce]: (Optional) To scope down the registration to a specific running
  /// software instance and guard against replay attacks.
  Future<RegisterUsageResult> registerUsage(
      {@required String productCode,
      @required int publicKeyVersion,
      String nonce}) async {
    return RegisterUsageResult.fromJson({});
  }

  /// ResolveCustomer is called by a SaaS application during the registration
  /// process. When a buyer visits your website during the registration process,
  /// the buyer submits a registration token through their browser. The
  /// registration token is resolved through this API to obtain a
  /// CustomerIdentifier and product code.
  ///
  /// [registrationToken]: When a buyer visits your website during the
  /// registration process, the buyer submits a registration token through the
  /// browser. The registration token is resolved to obtain a CustomerIdentifier
  /// and product code.
  Future<ResolveCustomerResult> resolveCustomer(
      String registrationToken) async {
    return ResolveCustomerResult.fromJson({});
  }
}

class BatchMeterUsageResult {
  /// Contains all UsageRecords processed by BatchMeterUsage. These records were
  /// either honored by AWS Marketplace Metering Service or were invalid.
  final List<UsageRecordResult> results;

  /// Contains all UsageRecords that were not processed by BatchMeterUsage. This
  /// is a list of UsageRecords. You can retry the failed request by making
  /// another BatchMeterUsage call with this list as input in the
  /// BatchMeterUsageRequest.
  final List<UsageRecord> unprocessedRecords;

  BatchMeterUsageResult({
    this.results,
    this.unprocessedRecords,
  });
  static BatchMeterUsageResult fromJson(Map<String, dynamic> json) =>
      BatchMeterUsageResult();
}

class MeterUsageResult {
  /// Metering record id.
  final String meteringRecordId;

  MeterUsageResult({
    this.meteringRecordId,
  });
  static MeterUsageResult fromJson(Map<String, dynamic> json) =>
      MeterUsageResult();
}

class RegisterUsageResult {
  /// (Optional) Only included when public key version has expired
  final DateTime publicKeyRotationTimestamp;

  /// JWT Token
  final String signature;

  RegisterUsageResult({
    this.publicKeyRotationTimestamp,
    this.signature,
  });
  static RegisterUsageResult fromJson(Map<String, dynamic> json) =>
      RegisterUsageResult();
}

class ResolveCustomerResult {
  /// The CustomerIdentifier is used to identify an individual customer in your
  /// application. Calls to BatchMeterUsage require CustomerIdentifiers for each
  /// UsageRecord.
  final String customerIdentifier;

  /// The product code is returned to confirm that the buyer is registering for
  /// your product. Subsequent BatchMeterUsage calls should be made using this
  /// product code.
  final String productCode;

  ResolveCustomerResult({
    this.customerIdentifier,
    this.productCode,
  });
  static ResolveCustomerResult fromJson(Map<String, dynamic> json) =>
      ResolveCustomerResult();
}

class UsageRecord {
  /// Timestamp, in UTC, for which the usage is being reported.
  ///
  /// Your application can meter usage for up to one hour in the past. Make sure
  /// the timestamp value is not before the start of the software usage.
  final DateTime timestamp;

  /// The CustomerIdentifier is obtained through the ResolveCustomer operation
  /// and represents an individual buyer in your application.
  final String customerIdentifier;

  /// During the process of registering a product on AWS Marketplace, up to
  /// eight dimensions are specified. These represent different units of value
  /// in your application.
  final String dimension;

  /// The quantity of usage consumed by the customer for the given dimension and
  /// time. Defaults to `0` if not specified.
  final int quantity;

  UsageRecord({
    @required this.timestamp,
    @required this.customerIdentifier,
    @required this.dimension,
    this.quantity,
  });
  static UsageRecord fromJson(Map<String, dynamic> json) => UsageRecord();
}

class UsageRecordResult {
  /// The UsageRecord that was part of the BatchMeterUsage request.
  final UsageRecord usageRecord;

  /// The MeteringRecordId is a unique identifier for this metering event.
  final String meteringRecordId;

  /// The UsageRecordResult Status indicates the status of an individual
  /// UsageRecord processed by BatchMeterUsage.
  ///
  /// *    _Success_\- The UsageRecord was accepted and honored by
  /// BatchMeterUsage.
  ///
  /// *    _CustomerNotSubscribed_\- The CustomerIdentifier specified is not
  /// subscribed to your product. The UsageRecord was not honored. Future
  /// UsageRecords for this customer will fail until the customer subscribes to
  /// your product.
  ///
  /// *    _DuplicateRecord_\- Indicates that the UsageRecord was invalid and
  /// not honored. A previously metered UsageRecord had the same customer,
  /// dimension, and time, but a different quantity.
  final String status;

  UsageRecordResult({
    this.usageRecord,
    this.meteringRecordId,
    this.status,
  });
  static UsageRecordResult fromJson(Map<String, dynamic> json) =>
      UsageRecordResult();
}
