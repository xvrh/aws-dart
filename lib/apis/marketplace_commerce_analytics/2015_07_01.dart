import 'package:meta/meta.dart';

/// Provides AWS Marketplace business intelligence data on-demand.
class MarketplaceCommerceAnalyticsApi {
  final _client;
  MarketplaceCommerceAnalyticsApi(client)
      : _client = client.configured('Marketplace Commerce Analytics',
            serializer: 'json');

  /// Given a data set type and data set publication date, asynchronously
  /// publishes the requested data set to the specified S3 bucket and notifies
  /// the specified SNS topic once the data is available. Returns a unique
  /// request identifier that can be used to correlate requests with
  /// notifications from the SNS topic. Data sets will be published in
  /// comma-separated values (CSV) format with the file name
  /// {data_set_type}_YYYY-MM-DD.csv. If a file with the same name already
  /// exists (e.g. if the same data set is requested twice), the original file
  /// will be overwritten by the new file. Requires a Role with an attached
  /// permissions policy providing Allow permissions for the following actions:
  /// s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish,
  /// iam:GetRolePolicy.
  ///
  /// [dataSetType]: The desired data set type.
  ///
  /// *    **customer_subscriber_hourly_monthly_subscriptions**
  ///
  ///     From 2014-07-21 to present: Available daily by 24:00 UTC.
  ///
  /// *    **customer_subscriber_annual_subscriptions**
  ///
  ///     From 2014-07-21 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_usage_by_instance_type**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_fees**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_free_trial_conversions**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_new_instances**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_new_product_subscribers**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **daily_business_canceled_product_subscribers**
  ///
  ///     From 2015-01-26 to present: Available daily by 24:00 UTC.
  ///
  /// *    **monthly_revenue_billing_and_revenue_data**
  ///
  ///     From 2015-02 to 2017-06: Available monthly on the 4th day of the month
  /// by 24:00 UTC. Data includes metered transactions (e.g. hourly) from two
  /// months prior.
  ///
  ///     From 2017-07 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC. Data includes metered transactions (e.g. hourly) from
  /// one month prior.
  ///
  /// *    **monthly_revenue_annual_subscriptions**
  ///
  ///     From 2015-02 to 2017-06: Available monthly on the 4th day of the month
  /// by 24:00 UTC. Data includes up-front software charges (e.g. annual) from
  /// one month prior.
  ///
  ///     From 2017-07 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC. Data includes up-front software charges (e.g. annual)
  /// from one month prior.
  ///
  /// *    **monthly_revenue_field_demonstration_usage**
  ///
  ///     From 2018-03-15 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC.
  ///
  /// *    **monthly_revenue_flexible_payment_schedule**
  ///
  ///     From 2018-11-15 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC.
  ///
  /// *    **disbursed_amount_by_product**
  ///
  ///     From 2015-01-26 to present: Available every 30 days by 24:00 UTC.
  ///
  /// *    **disbursed_amount_by_product_with_uncollected_funds**
  ///
  ///     From 2012-04-19 to 2015-01-25: Available every 30 days by 24:00 UTC.
  ///
  ///     From 2015-01-26 to present: This data set was split into three data
  /// sets: disbursed_amount_by_product,
  /// disbursed_amount_by_age_of_uncollected_funds, and
  /// disbursed_amount_by_age_of_disbursed_funds.
  ///
  /// *    **disbursed_amount_by_instance_hours**
  ///
  ///     From 2012-09-04 to present: Available every 30 days by 24:00 UTC.
  ///
  /// *    **disbursed_amount_by_customer_geo**
  ///
  ///     From 2012-04-19 to present: Available every 30 days by 24:00 UTC.
  ///
  /// *    **disbursed_amount_by_age_of_uncollected_funds**
  ///
  ///     From 2015-01-26 to present: Available every 30 days by 24:00 UTC.
  ///
  /// *    **disbursed_amount_by_age_of_disbursed_funds**
  ///
  ///     From 2015-01-26 to present: Available every 30 days by 24:00 UTC.
  ///
  /// *    **customer_profile_by_industry**
  ///
  ///     From 2015-10-01 to 2017-06-29: Available daily by 24:00 UTC.
  ///
  ///     From 2017-06-30 to present: This data set is no longer available.
  ///
  /// *    **customer_profile_by_revenue**
  ///
  ///     From 2015-10-01 to 2017-06-29: Available daily by 24:00 UTC.
  ///
  ///     From 2017-06-30 to present: This data set is no longer available.
  ///
  /// *    **customer_profile_by_geography**
  ///
  ///     From 2015-10-01 to 2017-06-29: Available daily by 24:00 UTC.
  ///
  ///     From 2017-06-30 to present: This data set is no longer available.
  ///
  /// *    **sales_compensation_billed_revenue**
  ///
  ///     From 2016-12 to 2017-06: Available monthly on the 4th day of the month
  /// by 24:00 UTC. Data includes metered transactions (e.g. hourly) from two
  /// months prior, and up-front software charges (e.g. annual) from one month
  /// prior.
  ///
  ///     From 2017-06 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC. Data includes metered transactions (e.g. hourly) from
  /// one month prior, and up-front software charges (e.g. annual) from one
  /// month prior.
  ///
  /// *    **us_sales_and_use_tax_records**
  ///
  ///     From 2017-02-15 to present: Available monthly on the 15th day of the
  /// month by 24:00 UTC.
  ///
  /// [dataSetPublicationDate]: The date a data set was published. For daily
  /// data sets, provide a date with day-level granularity for the desired day.
  /// For weekly data sets, provide a date with day-level granularity within the
  /// desired week (the day value will be ignored). For monthly data sets,
  /// provide a date with month-level granularity for the desired month (the day
  /// value will be ignored).
  ///
  /// [roleNameArn]: The Amazon Resource Name (ARN) of the Role with an attached
  /// permissions policy to interact with the provided AWS services.
  ///
  /// [destinationS3BucketName]: The name (friendly name, not ARN) of the
  /// destination S3 bucket.
  ///
  /// [destinationS3Prefix]: (Optional) The desired S3 prefix for the published
  /// data set, similar to a directory path in standard file systems. For
  /// example, if given the bucket name "mybucket" and the prefix
  /// "myprefix/mydatasets", the output file "outputfile" would be published to
  /// "s3://mybucket/myprefix/mydatasets/outputfile". If the prefix directory
  /// structure does not exist, it will be created. If no prefix is provided,
  /// the data set will be published to the S3 bucket root.
  ///
  /// [snsTopicArn]: Amazon Resource Name (ARN) for the SNS Topic that will be
  /// notified when the data set has been published or if an error has occurred.
  ///
  /// [customerDefinedValues]: (Optional) Key-value pairs which will be
  /// returned, unmodified, in the Amazon SNS notification message and the data
  /// set metadata file. These key-value pairs can be used to correlated
  /// responses with tracking information from other systems.
  Future<GenerateDataSetResult> generateDataSet(
      {@required String dataSetType,
      @required DateTime dataSetPublicationDate,
      @required String roleNameArn,
      @required String destinationS3BucketName,
      String destinationS3Prefix,
      @required String snsTopicArn,
      Map<String, String> customerDefinedValues}) async {
    var response_ = await _client.send('GenerateDataSet', {
      'dataSetType': dataSetType,
      'dataSetPublicationDate': dataSetPublicationDate,
      'roleNameArn': roleNameArn,
      'destinationS3BucketName': destinationS3BucketName,
      if (destinationS3Prefix != null)
        'destinationS3Prefix': destinationS3Prefix,
      'snsTopicArn': snsTopicArn,
      if (customerDefinedValues != null)
        'customerDefinedValues': customerDefinedValues,
    });
    return GenerateDataSetResult.fromJson(response_);
  }

  /// Given a data set type and a from date, asynchronously publishes the
  /// requested customer support data to the specified S3 bucket and notifies
  /// the specified SNS topic once the data is available. Returns a unique
  /// request identifier that can be used to correlate requests with
  /// notifications from the SNS topic. Data sets will be published in
  /// comma-separated values (CSV) format with the file name
  /// {data_set_type}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If a file with the same name
  /// already exists (e.g. if the same data set is requested twice), the
  /// original file will be overwritten by the new file. Requires a Role with an
  /// attached permissions policy providing Allow permissions for the following
  /// actions: s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes,
  /// sns:Publish, iam:GetRolePolicy.
  ///
  /// [dataSetType]:  Specifies the data set type to be written to the output
  /// csv file. The data set types customer_support_contacts_data and
  /// test_customer_support_contacts_data both result in a csv file containing
  /// the following fields: Product Id, Product Code, Customer Guid,
  /// Subscription Guid, Subscription Start Date, Organization, AWS Account Id,
  /// Given Name, Surname, Telephone Number, Email, Title, Country Code, ZIP
  /// Code, Operation Type, and Operation Time.
  ///
  /// *   _customer_support_contacts_data_ Customer support contact data. The
  /// data set will contain all changes (Creates, Updates, and Deletes) to
  /// customer support contact data from the date specified in the from_date
  /// parameter.
  /// *   _test_customer_support_contacts_data_ An example data set containing
  /// static test data in the same format as customer_support_contacts_data
  ///
  /// [fromDate]: The start date from which to retrieve the data set in UTC.
  /// This parameter only affects the customer_support_contacts_data data set
  /// type.
  ///
  /// [roleNameArn]: The Amazon Resource Name (ARN) of the Role with an attached
  /// permissions policy to interact with the provided AWS services.
  ///
  /// [destinationS3BucketName]: The name (friendly name, not ARN) of the
  /// destination S3 bucket.
  ///
  /// [destinationS3Prefix]: (Optional) The desired S3 prefix for the published
  /// data set, similar to a directory path in standard file systems. For
  /// example, if given the bucket name "mybucket" and the prefix
  /// "myprefix/mydatasets", the output file "outputfile" would be published to
  /// "s3://mybucket/myprefix/mydatasets/outputfile". If the prefix directory
  /// structure does not exist, it will be created. If no prefix is provided,
  /// the data set will be published to the S3 bucket root.
  ///
  /// [snsTopicArn]: Amazon Resource Name (ARN) for the SNS Topic that will be
  /// notified when the data set has been published or if an error has occurred.
  ///
  /// [customerDefinedValues]: (Optional) Key-value pairs which will be
  /// returned, unmodified, in the Amazon SNS notification message and the data
  /// set metadata file.
  Future<StartSupportDataExportResult> startSupportDataExport(
      {@required String dataSetType,
      @required DateTime fromDate,
      @required String roleNameArn,
      @required String destinationS3BucketName,
      String destinationS3Prefix,
      @required String snsTopicArn,
      Map<String, String> customerDefinedValues}) async {
    var response_ = await _client.send('StartSupportDataExport', {
      'dataSetType': dataSetType,
      'fromDate': fromDate,
      'roleNameArn': roleNameArn,
      'destinationS3BucketName': destinationS3BucketName,
      if (destinationS3Prefix != null)
        'destinationS3Prefix': destinationS3Prefix,
      'snsTopicArn': snsTopicArn,
      if (customerDefinedValues != null)
        'customerDefinedValues': customerDefinedValues,
    });
    return StartSupportDataExportResult.fromJson(response_);
  }
}

/// Container for the result of the GenerateDataSet operation.
class GenerateDataSetResult {
  /// A unique identifier representing a specific request to the GenerateDataSet
  /// operation. This identifier can be used to correlate a request with
  /// notifications from the SNS topic.
  final String dataSetRequestId;

  GenerateDataSetResult({
    this.dataSetRequestId,
  });
  static GenerateDataSetResult fromJson(Map<String, dynamic> json) =>
      GenerateDataSetResult(
        dataSetRequestId: json.containsKey('dataSetRequestId')
            ? json['dataSetRequestId'] as String
            : null,
      );
}

/// Container for the result of the StartSupportDataExport operation.
class StartSupportDataExportResult {
  /// A unique identifier representing a specific request to the
  /// StartSupportDataExport operation. This identifier can be used to correlate
  /// a request with notifications from the SNS topic.
  final String dataSetRequestId;

  StartSupportDataExportResult({
    this.dataSetRequestId,
  });
  static StartSupportDataExportResult fromJson(Map<String, dynamic> json) =>
      StartSupportDataExportResult(
        dataSetRequestId: json.containsKey('dataSetRequestId')
            ? json['dataSetRequestId'] as String
            : null,
      );
}
