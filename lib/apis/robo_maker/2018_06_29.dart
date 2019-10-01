import 'package:meta/meta.dart';

/// This section provides documentation for the AWS RoboMaker API operations.
class RoboMakerApi {
  /// Describes one or more simulation jobs.
  Future<void> batchDescribeSimulationJob(List<String> jobs) async {}

  /// Cancels the specified deployment job.
  Future<void> cancelDeploymentJob(String job) async {}

  /// Cancels the specified simulation job.
  Future<void> cancelSimulationJob(String job) async {}

  /// Deploys a specific version of a robot application to robots in a fleet.
  ///
  /// The robot application must have a numbered `applicationVersion` for
  /// consistency reasons. To create a new version, use
  /// `CreateRobotApplicationVersion` or see [Creating a Robot Application
  /// Version](https://docs.aws.amazon.com/robomaker/latest/dg/create-robot-application-version.html).
  ///
  ///
  ///
  /// After 90 days, deployment jobs expire and will be deleted. They will no
  /// longer be accessible.
  Future<void> createDeploymentJob(
      {DeploymentConfig deploymentConfig,
      @required String clientRequestToken,
      @required String fleet,
      @required List<DeploymentApplicationConfig> deploymentApplicationConfigs,
      Map<String, String> tags}) async {}

  /// Creates a fleet, a logical group of robots running the same robot
  /// application.
  Future<void> createFleet(String name, {Map<String, String> tags}) async {}

  /// Creates a robot.
  Future<void> createRobot(
      {@required String name,
      @required String architecture,
      @required String greengrassGroupId,
      Map<String, String> tags}) async {}

  /// Creates a robot application.
  Future<void> createRobotApplication(
      {@required String name,
      @required List<SourceConfig> sources,
      @required RobotSoftwareSuite robotSoftwareSuite,
      Map<String, String> tags}) async {}

  /// Creates a version of a robot application.
  Future<void> createRobotApplicationVersion(String application,
      {String currentRevisionId}) async {}

  /// Creates a simulation application.
  Future<void> createSimulationApplication(
      {@required String name,
      @required List<SourceConfig> sources,
      @required SimulationSoftwareSuite simulationSoftwareSuite,
      @required RobotSoftwareSuite robotSoftwareSuite,
      RenderingEngine renderingEngine,
      Map<String, String> tags}) async {}

  /// Creates a simulation application with a specific revision id.
  Future<void> createSimulationApplicationVersion(String application,
      {String currentRevisionId}) async {}

  /// Creates a simulation job.
  ///
  ///
  ///
  /// After 90 days, simulation jobs expire and will be deleted. They will no
  /// longer be accessible.
  Future<void> createSimulationJob(
      {String clientRequestToken,
      OutputLocation outputLocation,
      LoggingConfig loggingConfig,
      @required BigInt maxJobDurationInSeconds,
      @required String iamRole,
      String failureBehavior,
      List<RobotApplicationConfig> robotApplications,
      List<SimulationApplicationConfig> simulationApplications,
      List<DataSourceConfig> dataSources,
      Map<String, String> tags,
      VpcConfig vpcConfig}) async {}

  /// Deletes a fleet.
  Future<void> deleteFleet(String fleet) async {}

  /// Deletes a robot.
  Future<void> deleteRobot(String robot) async {}

  /// Deletes a robot application.
  Future<void> deleteRobotApplication(String application,
      {String applicationVersion}) async {}

  /// Deletes a simulation application.
  Future<void> deleteSimulationApplication(String application,
      {String applicationVersion}) async {}

  /// Deregisters a robot.
  Future<void> deregisterRobot(
      {@required String fleet, @required String robot}) async {}

  /// Describes a deployment job.
  Future<void> describeDeploymentJob(String job) async {}

  /// Describes a fleet.
  Future<void> describeFleet(String fleet) async {}

  /// Describes a robot.
  Future<void> describeRobot(String robot) async {}

  /// Describes a robot application.
  Future<void> describeRobotApplication(String application,
      {String applicationVersion}) async {}

  /// Describes a simulation application.
  Future<void> describeSimulationApplication(String application,
      {String applicationVersion}) async {}

  /// Describes a simulation job.
  Future<void> describeSimulationJob(String job) async {}

  /// Returns a list of deployment jobs for a fleet. You can optionally provide
  /// filters to retrieve specific deployment jobs.
  Future<void> listDeploymentJobs(
      {List<Filter> filters, String nextToken, int maxResults}) async {}

  /// Returns a list of fleets. You can optionally provide filters to retrieve
  /// specific fleets.
  Future<void> listFleets(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Returns a list of robot application. You can optionally provide filters to
  /// retrieve specific robot applications.
  Future<void> listRobotApplications(
      {String versionQualifier,
      String nextToken,
      int maxResults,
      List<Filter> filters}) async {}

  /// Returns a list of robots. You can optionally provide filters to retrieve
  /// specific robots.
  Future<void> listRobots(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Returns a list of simulation applications. You can optionally provide
  /// filters to retrieve specific simulation applications.
  Future<void> listSimulationApplications(
      {String versionQualifier,
      String nextToken,
      int maxResults,
      List<Filter> filters}) async {}

  /// Returns a list of simulation jobs. You can optionally provide filters to
  /// retrieve specific simulation jobs.
  Future<void> listSimulationJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Lists all tags on a AWS RoboMaker resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Registers a robot with a fleet.
  Future<void> registerRobot(
      {@required String fleet, @required String robot}) async {}

  /// Restarts a running simulation job.
  Future<void> restartSimulationJob(String job) async {}

  /// Syncrhonizes robots in a fleet to the latest deployment. This is helpful
  /// if robots were added after a deployment.
  Future<void> syncDeploymentJob(
      {@required String clientRequestToken, @required String fleet}) async {}

  /// Adds or edits tags for a AWS RoboMaker resource.
  ///
  /// Each tag consists of a tag key and a tag value. Tag keys and tag values
  /// are both required, but tag values can be empty strings.
  ///
  /// For information about the rules that apply to tag keys and tag values, see
  /// [User-Defined Tag
  /// Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes the specified tags from the specified AWS RoboMaker resource.
  ///
  /// To remove a tag, specify the tag key. To change the tag value of an
  /// existing tag key, use
  /// [`TagResource`](https://docs.aws.amazon.com/robomaker/latest/dg/API_TagResource.html)
  /// .
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates a robot application.
  Future<void> updateRobotApplication(
      {@required String application,
      @required List<SourceConfig> sources,
      @required RobotSoftwareSuite robotSoftwareSuite,
      String currentRevisionId}) async {}

  /// Updates a simulation application.
  Future<void> updateSimulationApplication(
      {@required String application,
      @required List<SourceConfig> sources,
      @required SimulationSoftwareSuite simulationSoftwareSuite,
      @required RobotSoftwareSuite robotSoftwareSuite,
      RenderingEngine renderingEngine,
      String currentRevisionId}) async {}
}

class BatchDescribeSimulationJobResponse {}

class CancelDeploymentJobResponse {}

class CancelSimulationJobResponse {}

class CreateDeploymentJobResponse {}

class CreateFleetResponse {}

class CreateRobotApplicationResponse {}

class CreateRobotApplicationVersionResponse {}

class CreateRobotResponse {}

class CreateSimulationApplicationResponse {}

class CreateSimulationApplicationVersionResponse {}

class CreateSimulationJobResponse {}

class DataSource {}

class DataSourceConfig {}

class DeleteFleetResponse {}

class DeleteRobotApplicationResponse {}

class DeleteRobotResponse {}

class DeleteSimulationApplicationResponse {}

class DeploymentApplicationConfig {}

class DeploymentConfig {}

class DeploymentJob {}

class DeploymentLaunchConfig {}

class DeregisterRobotResponse {}

class DescribeDeploymentJobResponse {}

class DescribeFleetResponse {}

class DescribeRobotApplicationResponse {}

class DescribeRobotResponse {}

class DescribeSimulationApplicationResponse {}

class DescribeSimulationJobResponse {}

class Filter {}

class Fleet {}

class LaunchConfig {}

class ListDeploymentJobsResponse {}

class ListFleetsResponse {}

class ListRobotApplicationsResponse {}

class ListRobotsResponse {}

class ListSimulationApplicationsResponse {}

class ListSimulationJobsResponse {}

class ListTagsForResourceResponse {}

class LoggingConfig {}

class NetworkInterface {}

class OutputLocation {}

class PortForwardingConfig {}

class PortMapping {}

class ProgressDetail {}

class RegisterRobotResponse {}

class RenderingEngine {}

class RestartSimulationJobResponse {}

class Robot {}

class RobotApplicationConfig {}

class RobotApplicationSummary {}

class RobotDeployment {}

class RobotSoftwareSuite {}

class S3KeyOutput {}

class SimulationApplicationConfig {}

class SimulationApplicationSummary {}

class SimulationJob {}

class SimulationJobSummary {}

class SimulationSoftwareSuite {}

class Source {}

class SourceConfig {}

class SyncDeploymentJobResponse {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateRobotApplicationResponse {}

class UpdateSimulationApplicationResponse {}

class VpcConfig {}

class VpcConfigResponse {}
