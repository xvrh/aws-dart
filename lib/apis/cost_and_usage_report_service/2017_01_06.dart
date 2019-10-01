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
  Future<void> deleteReportDefinition({String reportName}) async {}

  /// Lists the AWS Cost and Usage reports available to this account.
  Future<void> describeReportDefinitions(
      {int maxResults, String nextToken}) async {}

  /// Allows you to programatically update your report preferences.
  Future<void> modifyReportDefinition(
      {@required String reportName,
      @required ReportDefinition reportDefinition}) async {}

  /// Creates a new report using the description that you provide.
  Future<void> putReportDefinition(ReportDefinition reportDefinition) async {}
}

class DeleteReportDefinitionResponse {}

class DescribeReportDefinitionsResponse {}

class ModifyReportDefinitionResponse {}

class PutReportDefinitionResponse {}

class ReportDefinition {}
