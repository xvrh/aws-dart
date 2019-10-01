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
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [opsCenterEnabled]:  When set to `true`, creates opsItems for any problems
  /// detected on an application.
  ///
  /// [opsItemSnsTopicArn]:  The SNS topic provided to Application Insights that
  /// is associated to the created opsItem. Allows you to receive notifications
  /// for updates to the opsItem.
  Future<CreateApplicationResponse> createApplication(String resourceGroupName,
      {bool opsCenterEnabled, String opsItemSnsTopicArn}) async {
    return CreateApplicationResponse.fromJson({});
  }

  /// Creates a custom component by grouping similar standalone instances to
  /// monitor.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  ///
  /// [resourceList]: The list of resource ARNs that belong to the component.
  Future<CreateComponentResponse> createComponent(
      {@required String resourceGroupName,
      @required String componentName,
      @required List<String> resourceList}) async {
    return CreateComponentResponse.fromJson({});
  }

  /// Removes the specified application from monitoring. Does not delete the
  /// application.
  ///
  /// [resourceGroupName]: The name of the resource group.
  Future<DeleteApplicationResponse> deleteApplication(
      String resourceGroupName) async {
    return DeleteApplicationResponse.fromJson({});
  }

  /// Ungroups a custom component. When you ungroup custom components, all
  /// applicable monitors that are set up for the component are removed and the
  /// instances revert to their standalone status.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  Future<DeleteComponentResponse> deleteComponent(
      {@required String resourceGroupName,
      @required String componentName}) async {
    return DeleteComponentResponse.fromJson({});
  }

  /// Describes the application.
  ///
  /// [resourceGroupName]: The name of the resource group.
  Future<DescribeApplicationResponse> describeApplication(
      String resourceGroupName) async {
    return DescribeApplicationResponse.fromJson({});
  }

  /// Describes a component and lists the resources that are grouped together in
  /// a component.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  Future<DescribeComponentResponse> describeComponent(
      {@required String resourceGroupName,
      @required String componentName}) async {
    return DescribeComponentResponse.fromJson({});
  }

  /// Describes the monitoring configuration of the component.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  Future<DescribeComponentConfigurationResponse> describeComponentConfiguration(
      {@required String resourceGroupName,
      @required String componentName}) async {
    return DescribeComponentConfigurationResponse.fromJson({});
  }

  /// Describes the recommended monitoring configuration of the component.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  ///
  /// [tier]: The tier of the application component. Supported tiers include
  /// `DOT_NET_WORKER`, `DOT_NET_WEB`, `SQL_SERVER`, and `DEFAULT`.
  Future<DescribeComponentConfigurationRecommendationResponse>
      describeComponentConfigurationRecommendation(
          {@required String resourceGroupName,
          @required String componentName,
          @required String tier}) async {
    return DescribeComponentConfigurationRecommendationResponse.fromJson({});
  }

  /// Describes an anomaly or error with the application.
  ///
  /// [observationId]: The ID of the observation.
  Future<DescribeObservationResponse> describeObservation(
      String observationId) async {
    return DescribeObservationResponse.fromJson({});
  }

  /// Describes an application problem.
  ///
  /// [problemId]: The ID of the problem.
  Future<DescribeProblemResponse> describeProblem(String problemId) async {
    return DescribeProblemResponse.fromJson({});
  }

  /// Describes the anomalies or errors associated with the problem.
  ///
  /// [problemId]: The ID of the problem.
  Future<DescribeProblemObservationsResponse> describeProblemObservations(
      String problemId) async {
    return DescribeProblemObservationsResponse.fromJson({});
  }

  /// Lists the IDs of the applications that you are monitoring.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: The token to request the next page of results.
  Future<ListApplicationsResponse> listApplications(
      {int maxResults, String nextToken}) async {
    return ListApplicationsResponse.fromJson({});
  }

  /// Lists the auto-grouped, standalone, and custom components of the
  /// application.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: The token to request the next page of results.
  Future<ListComponentsResponse> listComponents(String resourceGroupName,
      {int maxResults, String nextToken}) async {
    return ListComponentsResponse.fromJson({});
  }

  /// Lists the problems with your application.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [startTime]: The time when the problem was detected, in epoch seconds. If
  /// you don't specify a time frame for the request, problems within the past
  /// seven days are returned.
  ///
  /// [endTime]: The time when the problem ended, in epoch seconds. If not
  /// specified, problems within the past seven days are returned.
  ///
  /// [maxResults]: The maximum number of results to return in a single call. To
  /// retrieve the remaining results, make another call with the returned
  /// `NextToken` value.
  ///
  /// [nextToken]: The token to request the next page of results.
  Future<ListProblemsResponse> listProblems(
      {String resourceGroupName,
      DateTime startTime,
      DateTime endTime,
      int maxResults,
      String nextToken}) async {
    return ListProblemsResponse.fromJson({});
  }

  /// Updates the application.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [opsCenterEnabled]:  When set to `true`, creates opsItems for any problems
  /// detected on an application.
  ///
  /// [opsItemSnsTopicArn]:  The SNS topic provided to Application Insights that
  /// is associated to the created opsItem. Allows you to receive notifications
  /// for updates to the opsItem.
  ///
  /// [removeSnsTopic]:  Disassociates the SNS topic from the opsItem created
  /// for detected problems.
  Future<UpdateApplicationResponse> updateApplication(String resourceGroupName,
      {bool opsCenterEnabled,
      String opsItemSnsTopicArn,
      bool removeSnsTopic}) async {
    return UpdateApplicationResponse.fromJson({});
  }

  /// Updates the custom component name and/or the list of resources that make
  /// up the component.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  ///
  /// [newComponentName]: The new name of the component.
  ///
  /// [resourceList]: The list of resource ARNs that belong to the component.
  Future<UpdateComponentResponse> updateComponent(
      {@required String resourceGroupName,
      @required String componentName,
      String newComponentName,
      List<String> resourceList}) async {
    return UpdateComponentResponse.fromJson({});
  }

  /// Updates the monitoring configurations for the component. The configuration
  /// input parameter is an escaped JSON of the configuration and should match
  /// the schema of what is returned by
  /// `DescribeComponentConfigurationRecommendation`.
  ///
  /// [resourceGroupName]: The name of the resource group.
  ///
  /// [componentName]: The name of the component.
  ///
  /// [monitor]: Indicates whether the application component is monitored.
  ///
  /// [tier]: The tier of the application component. Supported tiers include
  /// `DOT_NET_WORKER`, `DOT_NET_WEB`, `SQL_SERVER`, and `DEFAULT`.
  ///
  /// [componentConfiguration]: The configuration settings of the component. The
  /// value is the escaped JSON of the configuration. For more information about
  /// the JSON format, see
  /// [Working with JSON](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/working-with-json.html).
  /// You can send a request to `DescribeComponentConfigurationRecommendation`
  /// to see the recommended configuration for a component.
  Future<UpdateComponentConfigurationResponse> updateComponentConfiguration(
      {@required String resourceGroupName,
      @required String componentName,
      bool monitor,
      String tier,
      String componentConfiguration}) async {
    return UpdateComponentConfigurationResponse.fromJson({});
  }
}

/// Describes a standalone resource or similarly grouped resources that the
/// application is made up of.
class ApplicationComponent {
  /// The name of the component.
  final String componentName;

  /// The resource type. Supported resource types include EC2 instances, Auto
  /// Scaling group, Classic ELB, Application ELB, and SQS Queue.
  final String resourceType;

  /// The stack tier of the application component.
  final String tier;

  /// Indicates whether the application component is monitored.
  final bool monitor;

  ApplicationComponent({
    this.componentName,
    this.resourceType,
    this.tier,
    this.monitor,
  });
  static ApplicationComponent fromJson(Map<String, dynamic> json) =>
      ApplicationComponent();
}

/// Describes the status of the application.
class ApplicationInfo {
  /// The name of the resource group used for the application.
  final String resourceGroupName;

  /// The lifecycle of the application.
  final String lifeCycle;

  ///  The SNS topic provided to Application Insights that is associated to the
  /// created opsItems to receive SNS notifications for opsItem updates.
  final String opsItemSnsTopicArn;

  ///  Indicates whether Application Insights will create opsItems for any
  /// problem detected by Application Insights for an application.
  final bool opsCenterEnabled;

  /// The issues on the user side that block Application Insights from
  /// successfully monitoring an application.
  final String remarks;

  ApplicationInfo({
    this.resourceGroupName,
    this.lifeCycle,
    this.opsItemSnsTopicArn,
    this.opsCenterEnabled,
    this.remarks,
  });
  static ApplicationInfo fromJson(Map<String, dynamic> json) =>
      ApplicationInfo();
}

class CreateApplicationResponse {
  /// Information about the application.
  final ApplicationInfo applicationInfo;

  CreateApplicationResponse({
    this.applicationInfo,
  });
  static CreateApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationResponse();
}

class CreateComponentResponse {
  CreateComponentResponse();
  static CreateComponentResponse fromJson(Map<String, dynamic> json) =>
      CreateComponentResponse();
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();
  static DeleteApplicationResponse fromJson(Map<String, dynamic> json) =>
      DeleteApplicationResponse();
}

class DeleteComponentResponse {
  DeleteComponentResponse();
  static DeleteComponentResponse fromJson(Map<String, dynamic> json) =>
      DeleteComponentResponse();
}

class DescribeApplicationResponse {
  /// Information about the application.
  final ApplicationInfo applicationInfo;

  DescribeApplicationResponse({
    this.applicationInfo,
  });
  static DescribeApplicationResponse fromJson(Map<String, dynamic> json) =>
      DescribeApplicationResponse();
}

class DescribeComponentConfigurationRecommendationResponse {
  /// The recommended configuration settings of the component. The value is the
  /// escaped JSON of the configuration.
  final String componentConfiguration;

  DescribeComponentConfigurationRecommendationResponse({
    this.componentConfiguration,
  });
  static DescribeComponentConfigurationRecommendationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeComponentConfigurationRecommendationResponse();
}

class DescribeComponentConfigurationResponse {
  /// Indicates whether the application component is monitored.
  final bool monitor;

  /// The tier of the application component. Supported tiers include
  /// `DOT_NET_WORKER`, `DOT_NET_WEB`, `SQL_SERVER`, and `DEFAULT`
  final String tier;

  /// The configuration settings of the component. The value is the escaped JSON
  /// of the configuration.
  final String componentConfiguration;

  DescribeComponentConfigurationResponse({
    this.monitor,
    this.tier,
    this.componentConfiguration,
  });
  static DescribeComponentConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeComponentConfigurationResponse();
}

class DescribeComponentResponse {
  final ApplicationComponent applicationComponent;

  /// The list of resource ARNs that belong to the component.
  final List<String> resourceList;

  DescribeComponentResponse({
    this.applicationComponent,
    this.resourceList,
  });
  static DescribeComponentResponse fromJson(Map<String, dynamic> json) =>
      DescribeComponentResponse();
}

class DescribeObservationResponse {
  /// Information about the observation.
  final Observation observation;

  DescribeObservationResponse({
    this.observation,
  });
  static DescribeObservationResponse fromJson(Map<String, dynamic> json) =>
      DescribeObservationResponse();
}

class DescribeProblemObservationsResponse {
  /// Observations related to the problem.
  final RelatedObservations relatedObservations;

  DescribeProblemObservationsResponse({
    this.relatedObservations,
  });
  static DescribeProblemObservationsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeProblemObservationsResponse();
}

class DescribeProblemResponse {
  /// Information about the problem.
  final Problem problem;

  DescribeProblemResponse({
    this.problem,
  });
  static DescribeProblemResponse fromJson(Map<String, dynamic> json) =>
      DescribeProblemResponse();
}

class ListApplicationsResponse {
  /// The list of applications.
  final List<ApplicationInfo> applicationInfoList;

  /// The token used to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  ListApplicationsResponse({
    this.applicationInfoList,
    this.nextToken,
  });
  static ListApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationsResponse();
}

class ListComponentsResponse {
  /// The list of application components.
  final List<ApplicationComponent> applicationComponentList;

  /// The token to request the next page of results.
  final String nextToken;

  ListComponentsResponse({
    this.applicationComponentList,
    this.nextToken,
  });
  static ListComponentsResponse fromJson(Map<String, dynamic> json) =>
      ListComponentsResponse();
}

class ListProblemsResponse {
  /// The list of problems.
  final List<Problem> problemList;

  /// The token used to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  ListProblemsResponse({
    this.problemList,
    this.nextToken,
  });
  static ListProblemsResponse fromJson(Map<String, dynamic> json) =>
      ListProblemsResponse();
}

/// Describes an anomaly or error with the application.
class Observation {
  /// The ID of the observation type.
  final String id;

  /// The time when the observation was first detected, in epoch seconds.
  final DateTime startTime;

  /// The time when the observation ended, in epoch seconds.
  final DateTime endTime;

  /// The source type of the observation.
  final String sourceType;

  /// The source resource ARN of the observation.
  final String sourceArn;

  /// The log group name.
  final String logGroup;

  /// The timestamp in the CloudWatch Logs that specifies when the matched line
  /// occurred.
  final DateTime lineTime;

  /// The log text of the observation.
  final String logText;

  /// The log filter of the observation.
  final String logFilter;

  /// The namespace of the observation metric.
  final String metricNamespace;

  /// The name of the observation metric.
  final String metricName;

  /// The unit of the source observation metric.
  final String unit;

  /// The value of the source observation metric.
  final double value;

  Observation({
    this.id,
    this.startTime,
    this.endTime,
    this.sourceType,
    this.sourceArn,
    this.logGroup,
    this.lineTime,
    this.logText,
    this.logFilter,
    this.metricNamespace,
    this.metricName,
    this.unit,
    this.value,
  });
  static Observation fromJson(Map<String, dynamic> json) => Observation();
}

/// Describes a problem that is detected by correlating observations.
class Problem {
  /// The ID of the problem.
  final String id;

  /// The name of the problem.
  final String title;

  /// A detailed analysis of the problem using machine learning.
  final String insights;

  /// The status of the problem.
  final String status;

  /// The resource affected by the problem.
  final String affectedResource;

  /// The time when the problem started, in epoch seconds.
  final DateTime startTime;

  /// The time when the problem ended, in epoch seconds.
  final DateTime endTime;

  /// A measure of the level of impact of the problem.
  final String severityLevel;

  /// The name of the resource group affected by the problem.
  final String resourceGroupName;

  /// Feedback provided by the user about the problem.
  final Map<String, String> feedback;

  Problem({
    this.id,
    this.title,
    this.insights,
    this.status,
    this.affectedResource,
    this.startTime,
    this.endTime,
    this.severityLevel,
    this.resourceGroupName,
    this.feedback,
  });
  static Problem fromJson(Map<String, dynamic> json) => Problem();
}

/// Describes observations related to the problem.
class RelatedObservations {
  /// The list of observations related to the problem.
  final List<Observation> observationList;

  RelatedObservations({
    this.observationList,
  });
  static RelatedObservations fromJson(Map<String, dynamic> json) =>
      RelatedObservations();
}

class UpdateApplicationResponse {
  /// Information about the application.
  final ApplicationInfo applicationInfo;

  UpdateApplicationResponse({
    this.applicationInfo,
  });
  static UpdateApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateApplicationResponse();
}

class UpdateComponentConfigurationResponse {
  UpdateComponentConfigurationResponse();
  static UpdateComponentConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateComponentConfigurationResponse();
}

class UpdateComponentResponse {
  UpdateComponentResponse();
  static UpdateComponentResponse fromJson(Map<String, dynamic> json) =>
      UpdateComponentResponse();
}
