import 'package:meta/meta.dart';

/// Provides AWS Marketplace business intelligence data on-demand.
class MarketplaceCommerceAnalyticsApi {
  /// Given a data set type and data set publication date, asynchronously
  /// publishes the requested data set to the specified S3 bucket and notifies
  /// the specified SNS topic once the data is available. Returns a unique
  /// request identifier that can be used to correlate requests with
  /// notifications from the SNS topic. Data sets will be published in
  /// comma-separated values (CSV) format with the file name
  /// {data\_set\_type}_YYYY-MM-DD.csv. If a file with the same name already
  /// exists (e.g. if the same data set is requested twice), the original file
  /// will be overwritten by the new file. Requires a Role with an attached
  /// permissions policy providing Allow permissions for the following actions:
  /// s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish,
  /// iam:GetRolePolicy.
  Future<void> generateDataSet(
      {@required String dataSetType,
      @required DateTime dataSetPublicationDate,
      @required String roleNameArn,
      @required String destinationS3BucketName,
      String destinationS3Prefix,
      @required String snsTopicArn,
      Map<String, String> customerDefinedValues}) async {}

  /// Given a data set type and a from date, asynchronously publishes the
  /// requested customer support data to the specified S3 bucket and notifies
  /// the specified SNS topic once the data is available. Returns a unique
  /// request identifier that can be used to correlate requests with
  /// notifications from the SNS topic. Data sets will be published in
  /// comma-separated values (CSV) format with the file name
  /// {data\_set\_type}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If a file with the same
  /// name already exists (e.g. if the same data set is requested twice), the
  /// original file will be overwritten by the new file. Requires a Role with an
  /// attached permissions policy providing Allow permissions for the following
  /// actions: s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes,
  /// sns:Publish, iam:GetRolePolicy.
  Future<void> startSupportDataExport(
      {@required String dataSetType,
      @required DateTime fromDate,
      @required String roleNameArn,
      @required String destinationS3BucketName,
      String destinationS3Prefix,
      @required String snsTopicArn,
      Map<String, String> customerDefinedValues}) async {}
}

class GenerateDataSetResult {}

class StartSupportDataExportResult {}
