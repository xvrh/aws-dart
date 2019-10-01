import 'package:meta/meta.dart';

/// The AWS Cost and Usage Report API enables you to programmatically create,
/// query, and delete AWS Cost and Usage report definitions.
///
/// AWS Cost and Usage reports track the monthly AWS costs and usage associated
/// with your AWS account. The report contains line items for each unique
/// combination of AWS product, usage type, and operation that your AWS account
/// uses. You can configure the AWS Cost and Usage report to show only the data
/// that you want, using the AWS Cost and Usage API.
///
/// Service Endpoint
///
/// The AWS Cost and Usage Report API provides the following endpoint:
///
/// *   cur.us-east-1.amazonaws.com
class CostAndUsageReportServiceApi {
  /// Deletes the specified report.
  Future<DeleteReportDefinitionResponse> deleteReportDefinition(
      {String reportName}) async {
    return DeleteReportDefinitionResponse.fromJson({});
  }

  /// Lists the AWS Cost and Usage reports available to this account.
  Future<DescribeReportDefinitionsResponse> describeReportDefinitions(
      {int maxResults, String nextToken}) async {
    return DescribeReportDefinitionsResponse.fromJson({});
  }

  /// Allows you to programatically update your report preferences.
  Future<ModifyReportDefinitionResponse> modifyReportDefinition(
      {@required String reportName,
      @required ReportDefinition reportDefinition}) async {
    return ModifyReportDefinitionResponse.fromJson({});
  }

  /// Creates a new report using the description that you provide.
  ///
  /// [reportDefinition]: Represents the output of the PutReportDefinition
  /// operation. The content consists of the detailed metadata and data file
  /// information.
  Future<PutReportDefinitionResponse> putReportDefinition(
      ReportDefinition reportDefinition) async {
    return PutReportDefinitionResponse.fromJson({});
  }
}

class DeleteReportDefinitionResponse {
  final String responseMessage;

  DeleteReportDefinitionResponse({
    this.responseMessage,
  });
  static DeleteReportDefinitionResponse fromJson(Map<String, dynamic> json) =>
      DeleteReportDefinitionResponse();
}

class DescribeReportDefinitionsResponse {
  /// A list of AWS Cost and Usage reports owned by the account.
  final List<ReportDefinition> reportDefinitions;

  final String nextToken;

  DescribeReportDefinitionsResponse({
    this.reportDefinitions,
    this.nextToken,
  });
  static DescribeReportDefinitionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeReportDefinitionsResponse();
}

class ModifyReportDefinitionResponse {
  ModifyReportDefinitionResponse();
  static ModifyReportDefinitionResponse fromJson(Map<String, dynamic> json) =>
      ModifyReportDefinitionResponse();
}

class PutReportDefinitionResponse {
  PutReportDefinitionResponse();
  static PutReportDefinitionResponse fromJson(Map<String, dynamic> json) =>
      PutReportDefinitionResponse();
}

class ReportDefinition {
  final String reportName;

  final String timeUnit;

  final String format;

  final String compression;

  /// A list of strings that indicate additional content that Amazon Web
  /// Services includes in the report, such as individual resource IDs.
  final List<String> additionalSchemaElements;

  final String s3Bucket;

  final String s3Prefix;

  final String s3Region;

  /// A list of manifests that you want Amazon Web Services to create for this
  /// report.
  final List<String> additionalArtifacts;

  /// Whether you want Amazon Web Services to update your reports after they
  /// have been finalized if Amazon Web Services detects charges related to
  /// previous months. These charges can include refunds, credits, or support
  /// fees.
  final bool refreshClosedReports;

  /// Whether you want Amazon Web Services to overwrite the previous version of
  /// each report or to deliver the report in addition to the previous versions.
  final String reportVersioning;

  ReportDefinition({
    @required this.reportName,
    @required this.timeUnit,
    @required this.format,
    @required this.compression,
    @required this.additionalSchemaElements,
    @required this.s3Bucket,
    @required this.s3Prefix,
    @required this.s3Region,
    this.additionalArtifacts,
    this.refreshClosedReports,
    this.reportVersioning,
  });
  static ReportDefinition fromJson(Map<String, dynamic> json) =>
      ReportDefinition();
}
