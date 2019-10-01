import 'package:meta/meta.dart';

/// Amazon CloudWatch Application Insights for .NET and SQL Server
///
///  Amazon CloudWatch Application Insights for .NET and SQL Server is a service
/// that helps you detect common problems with your .NET and SQL Server-based
/// applications. It enables you to pinpoint the source of issues in your
/// applications (built with technologies such as Microsoft IIS, .NET, and
/// Microsoft SQL Server), by providing key insights into detected problems.
///
/// After you onboard your application, CloudWatch Application Insights for .NET
/// and SQL Server identifies, recommends, and sets up metrics and logs. It
/// continuously analyzes and correlates your metrics and logs for unusual
/// behavior to surface actionable problems with your application. For example,
/// if your application is slow and unresponsive and leading to HTTP 500 errors
/// in your Application Load Balancer (ALB), Application Insights informs you
/// that a memory pressure problem with your SQL Server database is occurring.
/// It bases this analysis on impactful metrics and log errors.
class ApplicationInsightsApi {
  /// Adds an application that is created from a resource group.
  Future<void> createApplication(String resourceGroupName,
      {bool opsCenterEnabled, String opsItemSnsTopicArn}) async {}

  /// Creates a custom component by grouping similar standalone instances to
  /// monitor.
  Future<void> createComponent(
      {@required String resourceGroupName,
      @required String componentName,
      @required List<String> resourceList}) async {}

  /// Removes the specified application from monitoring. Does not delete the
  /// application.
  Future<void> deleteApplication(String resourceGroupName) async {}

  /// Ungroups a custom component. When you ungroup custom components, all
  /// applicable monitors that are set up for the component are removed and the
  /// instances revert to their standalone status.
  Future<void> deleteComponent(
      {@required String resourceGroupName,
      @required String componentName}) async {}

  /// Describes the application.
  Future<void> describeApplication(String resourceGroupName) async {}

  /// Describes a component and lists the resources that are grouped together in
  /// a component.
  Future<void> describeComponent(
      {@required String resourceGroupName,
      @required String componentName}) async {}

  /// Describes the monitoring configuration of the component.
  Future<void> describeComponentConfiguration(
      {@required String resourceGroupName,
      @required String componentName}) async {}

  /// Describes the recommended monitoring configuration of the component.
  Future<void> describeComponentConfigurationRecommendation(
      {@required String resourceGroupName,
      @required String componentName,
      @required String tier}) async {}

  /// Describes an anomaly or error with the application.
  Future<void> describeObservation(String observationId) async {}

  /// Describes an application problem.
  Future<void> describeProblem(String problemId) async {}

  /// Describes the anomalies or errors associated with the problem.
  Future<void> describeProblemObservations(String problemId) async {}

  /// Lists the IDs of the applications that you are monitoring.
  Future<void> listApplications({int maxResults, String nextToken}) async {}

  /// Lists the auto-grouped, standalone, and custom components of the
  /// application.
  Future<void> listComponents(String resourceGroupName,
      {int maxResults, String nextToken}) async {}

  /// Lists the problems with your application.
  Future<void> listProblems(
      {String resourceGroupName,
      DateTime startTime,
      DateTime endTime,
      int maxResults,
      String nextToken}) async {}

  /// Updates the application.
  Future<void> updateApplication(String resourceGroupName,
      {bool opsCenterEnabled,
      String opsItemSnsTopicArn,
      bool removeSnsTopic}) async {}

  /// Updates the custom component name and/or the list of resources that make
  /// up the component.
  Future<void> updateComponent(
      {@required String resourceGroupName,
      @required String componentName,
      String newComponentName,
      List<String> resourceList}) async {}

  /// Updates the monitoring configurations for the component. The configuration
  /// input parameter is an escaped JSON of the configuration and should match
  /// the schema of what is returned by
  /// `DescribeComponentConfigurationRecommendation`.
  Future<void> updateComponentConfiguration(
      {@required String resourceGroupName,
      @required String componentName,
      bool monitor,
      String tier,
      String componentConfiguration}) async {}
}

class ApplicationComponent {}

class ApplicationInfo {}

class CreateApplicationResponse {}

class CreateComponentResponse {}

class DeleteApplicationResponse {}

class DeleteComponentResponse {}

class DescribeApplicationResponse {}

class DescribeComponentConfigurationRecommendationResponse {}

class DescribeComponentConfigurationResponse {}

class DescribeComponentResponse {}

class DescribeObservationResponse {}

class DescribeProblemObservationsResponse {}

class DescribeProblemResponse {}

class ListApplicationsResponse {}

class ListComponentsResponse {}

class ListProblemsResponse {}

class Observation {}

class Problem {}

class RelatedObservations {}

class UpdateApplicationResponse {}

class UpdateComponentConfigurationResponse {}

class UpdateComponentResponse {}
