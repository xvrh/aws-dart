import 'package:meta/meta.dart';

/// This section provides documentation for the AWS RoboMaker API operations.
class RoboMakerApi {
  /// Describes one or more simulation jobs.
  ///
  /// [jobs]: A list of Amazon Resource Names (ARNs) of simulation jobs to
  /// describe.
  Future<BatchDescribeSimulationJobResponse> batchDescribeSimulationJob(
      List<String> jobs) async {
    return BatchDescribeSimulationJobResponse.fromJson({});
  }

  /// Cancels the specified deployment job.
  ///
  /// [job]: The deployment job ARN to cancel.
  Future<CancelDeploymentJobResponse> cancelDeploymentJob(String job) async {
    return CancelDeploymentJobResponse.fromJson({});
  }

  /// Cancels the specified simulation job.
  ///
  /// [job]: The simulation job ARN to cancel.
  Future<CancelSimulationJobResponse> cancelSimulationJob(String job) async {
    return CancelSimulationJobResponse.fromJson({});
  }

  /// Deploys a specific version of a robot application to robots in a fleet.
  ///
  /// The robot application must have a numbered `applicationVersion` for
  /// consistency reasons. To create a new version, use
  /// `CreateRobotApplicationVersion` or see
  /// [Creating a Robot Application Version](https://docs.aws.amazon.com/robomaker/latest/dg/create-robot-application-version.html).
  ///
  ///
  ///
  /// After 90 days, deployment jobs expire and will be deleted. They will no
  /// longer be accessible.
  ///
  /// [deploymentConfig]: The requested deployment configuration.
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  ///
  /// [fleet]: The Amazon Resource Name (ARN) of the fleet to deploy.
  ///
  /// [deploymentApplicationConfigs]: The deployment application configuration.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the deployment job.
  Future<CreateDeploymentJobResponse> createDeploymentJob(
      {DeploymentConfig deploymentConfig,
      @required String clientRequestToken,
      @required String fleet,
      @required List<DeploymentApplicationConfig> deploymentApplicationConfigs,
      Map<String, String> tags}) async {
    return CreateDeploymentJobResponse.fromJson({});
  }

  /// Creates a fleet, a logical group of robots running the same robot
  /// application.
  ///
  /// [name]: The name of the fleet.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the fleet.
  Future<CreateFleetResponse> createFleet(String name,
      {Map<String, String> tags}) async {
    return CreateFleetResponse.fromJson({});
  }

  /// Creates a robot.
  ///
  /// [name]: The name for the robot.
  ///
  /// [architecture]: The target architecture of the robot.
  ///
  /// [greengrassGroupId]: The Greengrass group id.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the robot.
  Future<CreateRobotResponse> createRobot(
      {@required String name,
      @required String architecture,
      @required String greengrassGroupId,
      Map<String, String> tags}) async {
    return CreateRobotResponse.fromJson({});
  }

  /// Creates a robot application.
  ///
  /// [name]: The name of the robot application.
  ///
  /// [sources]: The sources of the robot application.
  ///
  /// [robotSoftwareSuite]: The robot software suite used by the robot
  /// application.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the robot application.
  Future<CreateRobotApplicationResponse> createRobotApplication(
      {@required String name,
      @required List<SourceConfig> sources,
      @required RobotSoftwareSuite robotSoftwareSuite,
      Map<String, String> tags}) async {
    return CreateRobotApplicationResponse.fromJson({});
  }

  /// Creates a version of a robot application.
  ///
  /// [application]: The application information for the robot application.
  ///
  /// [currentRevisionId]: The current revision id for the robot application. If
  /// you provide a value and it matches the latest revision ID, a new version
  /// will be created.
  Future<CreateRobotApplicationVersionResponse> createRobotApplicationVersion(
      String application,
      {String currentRevisionId}) async {
    return CreateRobotApplicationVersionResponse.fromJson({});
  }

  /// Creates a simulation application.
  ///
  /// [name]: The name of the simulation application.
  ///
  /// [sources]: The sources of the simulation application.
  ///
  /// [simulationSoftwareSuite]: The simulation software suite used by the
  /// simulation application.
  ///
  /// [robotSoftwareSuite]: The robot software suite of the simulation
  /// application.
  ///
  /// [renderingEngine]: The rendering engine for the simulation application.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the simulation application.
  Future<CreateSimulationApplicationResponse> createSimulationApplication(
      {@required String name,
      @required List<SourceConfig> sources,
      @required SimulationSoftwareSuite simulationSoftwareSuite,
      @required RobotSoftwareSuite robotSoftwareSuite,
      RenderingEngine renderingEngine,
      Map<String, String> tags}) async {
    return CreateSimulationApplicationResponse.fromJson({});
  }

  /// Creates a simulation application with a specific revision id.
  ///
  /// [application]: The application information for the simulation application.
  ///
  /// [currentRevisionId]: The current revision id for the simulation
  /// application. If you provide a value and it matches the latest revision ID,
  /// a new version will be created.
  Future<CreateSimulationApplicationVersionResponse>
      createSimulationApplicationVersion(String application,
          {String currentRevisionId}) async {
    return CreateSimulationApplicationVersionResponse.fromJson({});
  }

  /// Creates a simulation job.
  ///
  ///
  ///
  /// After 90 days, simulation jobs expire and will be deleted. They will no
  /// longer be accessible.
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  ///
  /// [outputLocation]: Location for output files generated by the simulation
  /// job.
  ///
  /// [loggingConfig]: The logging configuration.
  ///
  /// [maxJobDurationInSeconds]: The maximum simulation job duration in seconds
  /// (up to 14 days or 1,209,600 seconds. When `maxJobDurationInSeconds` is
  /// reached, the simulation job will status will transition to `Completed`.
  ///
  /// [iamRole]: The IAM role name that allows the simulation instance to call
  /// the AWS APIs that are specified in its associated policies on your behalf.
  /// This is how credentials are passed in to your simulation job.
  ///
  /// [failureBehavior]: The failure behavior the simulation job.
  ///
  /// Continue
  ///
  /// Restart the simulation job in the same host instance.
  ///
  /// Fail
  ///
  /// Stop the simulation job and terminate the instance.
  ///
  /// [robotApplications]: The robot application to use in the simulation job.
  ///
  /// [simulationApplications]: The simulation application to use in the
  /// simulation job.
  ///
  /// [dataSources]: The data sources for the simulation job.
  ///
  ///
  ///
  /// There is a limit of 100 files and a combined size of 25GB for all
  /// `DataSourceConfig` objects.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the simulation job.
  ///
  /// [vpcConfig]: If your simulation job accesses resources in a VPC, you
  /// provide this parameter identifying the list of security group IDs and
  /// subnet IDs. These must belong to the same VPC. You must provide at least
  /// one security group and one subnet ID.
  Future<CreateSimulationJobResponse> createSimulationJob(
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
      VpcConfig vpcConfig}) async {
    return CreateSimulationJobResponse.fromJson({});
  }

  /// Deletes a fleet.
  ///
  /// [fleet]: The Amazon Resource Name (ARN) of the fleet.
  Future<DeleteFleetResponse> deleteFleet(String fleet) async {
    return DeleteFleetResponse.fromJson({});
  }

  /// Deletes a robot.
  ///
  /// [robot]: The Amazon Resource Name (ARN) of the robot.
  Future<DeleteRobotResponse> deleteRobot(String robot) async {
    return DeleteRobotResponse.fromJson({});
  }

  /// Deletes a robot application.
  ///
  /// [application]: The Amazon Resource Name (ARN) of the the robot
  /// application.
  ///
  /// [applicationVersion]: The version of the robot application to delete.
  Future<DeleteRobotApplicationResponse> deleteRobotApplication(
      String application,
      {String applicationVersion}) async {
    return DeleteRobotApplicationResponse.fromJson({});
  }

  /// Deletes a simulation application.
  ///
  /// [application]: The application information for the simulation application
  /// to delete.
  ///
  /// [applicationVersion]: The version of the simulation application to delete.
  Future<DeleteSimulationApplicationResponse> deleteSimulationApplication(
      String application,
      {String applicationVersion}) async {
    return DeleteSimulationApplicationResponse.fromJson({});
  }

  /// Deregisters a robot.
  ///
  /// [fleet]: The Amazon Resource Name (ARN) of the fleet.
  ///
  /// [robot]: The Amazon Resource Name (ARN) of the robot.
  Future<DeregisterRobotResponse> deregisterRobot(
      {@required String fleet, @required String robot}) async {
    return DeregisterRobotResponse.fromJson({});
  }

  /// Describes a deployment job.
  ///
  /// [job]: The Amazon Resource Name (ARN) of the deployment job.
  Future<DescribeDeploymentJobResponse> describeDeploymentJob(
      String job) async {
    return DescribeDeploymentJobResponse.fromJson({});
  }

  /// Describes a fleet.
  ///
  /// [fleet]: The Amazon Resource Name (ARN) of the fleet.
  Future<DescribeFleetResponse> describeFleet(String fleet) async {
    return DescribeFleetResponse.fromJson({});
  }

  /// Describes a robot.
  ///
  /// [robot]: The Amazon Resource Name (ARN) of the robot to be described.
  Future<DescribeRobotResponse> describeRobot(String robot) async {
    return DescribeRobotResponse.fromJson({});
  }

  /// Describes a robot application.
  ///
  /// [application]: The Amazon Resource Name (ARN) of the robot application.
  ///
  /// [applicationVersion]: The version of the robot application to describe.
  Future<DescribeRobotApplicationResponse> describeRobotApplication(
      String application,
      {String applicationVersion}) async {
    return DescribeRobotApplicationResponse.fromJson({});
  }

  /// Describes a simulation application.
  ///
  /// [application]: The application information for the simulation application.
  ///
  /// [applicationVersion]: The version of the simulation application to
  /// describe.
  Future<DescribeSimulationApplicationResponse> describeSimulationApplication(
      String application,
      {String applicationVersion}) async {
    return DescribeSimulationApplicationResponse.fromJson({});
  }

  /// Describes a simulation job.
  ///
  /// [job]: The Amazon Resource Name (ARN) of the simulation job to be
  /// described.
  Future<DescribeSimulationJobResponse> describeSimulationJob(
      String job) async {
    return DescribeSimulationJobResponse.fromJson({});
  }

  /// Returns a list of deployment jobs for a fleet. You can optionally provide
  /// filters to retrieve specific deployment jobs.
  ///
  /// [filters]: Optional filters to limit results.
  ///
  /// The filter names `status` and `fleetName` are supported. When filtering,
  /// you must use the complete value of the filtered item. You can use up to
  /// three filters, but they must be for the same named item. For example, if
  /// you are looking for items with the status `InProgress` or the status
  /// `Pending`.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListDeploymentJobs` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListDeploymentJobs` in paginated output. When this parameter is used,
  /// `ListDeploymentJobs` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element. The remaining results of the
  /// initial request can be seen by sending another `ListDeploymentJobs`
  /// request with the returned `nextToken` value. This value can be between 1
  /// and 100. If this parameter is not used, then `ListDeploymentJobs` returns
  /// up to 100 results and a `nextToken` value if applicable.
  Future<ListDeploymentJobsResponse> listDeploymentJobs(
      {List<Filter> filters, String nextToken, int maxResults}) async {
    return ListDeploymentJobsResponse.fromJson({});
  }

  /// Returns a list of fleets. You can optionally provide filters to retrieve
  /// specific fleets.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListFleets` request where `maxResults` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListFleets` in paginated output. When this parameter is used,
  /// `ListFleets` only returns `maxResults` results in a single page along with
  /// a `nextToken` response element. The remaining results of the initial
  /// request can be seen by sending another `ListFleets` request with the
  /// returned `nextToken` value. This value can be between 1 and 100. If this
  /// parameter is not used, then `ListFleets` returns up to 100 results and a
  /// `nextToken` value if applicable.
  ///
  /// [filters]: Optional filters to limit results.
  ///
  /// The filter name `name` is supported. When filtering, you must use the
  /// complete value of the filtered item. You can use up to three filters.
  Future<ListFleetsResponse> listFleets(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    return ListFleetsResponse.fromJson({});
  }

  /// Returns a list of robot application. You can optionally provide filters to
  /// retrieve specific robot applications.
  ///
  /// [versionQualifier]: The version qualifier of the robot application.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListRobotApplications` request where `maxResults` was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListRobotApplications` in paginated output. When this parameter is used,
  /// `ListRobotApplications` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element. The remaining results of the
  /// initial request can be seen by sending another `ListRobotApplications`
  /// request with the returned `nextToken` value. This value can be between 1
  /// and 100. If this parameter is not used, then `ListRobotApplications`
  /// returns up to 100 results and a `nextToken` value if applicable.
  ///
  /// [filters]: Optional filters to limit results.
  ///
  /// The filter name `name` is supported. When filtering, you must use the
  /// complete value of the filtered item. You can use up to three filters.
  Future<ListRobotApplicationsResponse> listRobotApplications(
      {String versionQualifier,
      String nextToken,
      int maxResults,
      List<Filter> filters}) async {
    return ListRobotApplicationsResponse.fromJson({});
  }

  /// Returns a list of robots. You can optionally provide filters to retrieve
  /// specific robots.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListRobots` request where `maxResults` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListRobots` in paginated output. When this parameter is used,
  /// `ListRobots` only returns `maxResults` results in a single page along with
  /// a `nextToken` response element. The remaining results of the initial
  /// request can be seen by sending another `ListRobots` request with the
  /// returned `nextToken` value. This value can be between 1 and 100. If this
  /// parameter is not used, then `ListRobots` returns up to 100 results and a
  /// `nextToken` value if applicable.
  ///
  /// [filters]: Optional filters to limit results.
  ///
  /// The filter names `status` and `fleetName` are supported. When filtering,
  /// you must use the complete value of the filtered item. You can use up to
  /// three filters, but they must be for the same named item. For example, if
  /// you are looking for items with the status `Registered` or the status
  /// `Available`.
  Future<ListRobotsResponse> listRobots(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    return ListRobotsResponse.fromJson({});
  }

  /// Returns a list of simulation applications. You can optionally provide
  /// filters to retrieve specific simulation applications.
  ///
  /// [versionQualifier]: The version qualifier of the simulation application.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListSimulationApplications` request where `maxResults` was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListSimulationApplications` in paginated output. When this parameter is
  /// used, `ListSimulationApplications` only returns `maxResults` results in a
  /// single page along with a `nextToken` response element. The remaining
  /// results of the initial request can be seen by sending another
  /// `ListSimulationApplications` request with the returned `nextToken` value.
  /// This value can be between 1 and 100. If this parameter is not used, then
  /// `ListSimulationApplications` returns up to 100 results and a `nextToken`
  /// value if applicable.
  ///
  /// [filters]: Optional list of filters to limit results.
  ///
  /// The filter name `name` is supported. When filtering, you must use the
  /// complete value of the filtered item. You can use up to three filters.
  Future<ListSimulationApplicationsResponse> listSimulationApplications(
      {String versionQualifier,
      String nextToken,
      int maxResults,
      List<Filter> filters}) async {
    return ListSimulationApplicationsResponse.fromJson({});
  }

  /// Returns a list of simulation jobs. You can optionally provide filters to
  /// retrieve specific simulation jobs.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListSimulationJobs` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of deployment job results returned by
  /// `ListSimulationJobs` in paginated output. When this parameter is used,
  /// `ListSimulationJobs` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element. The remaining results of the
  /// initial request can be seen by sending another `ListSimulationJobs`
  /// request with the returned `nextToken` value. This value can be between 1
  /// and 100. If this parameter is not used, then `ListSimulationJobs` returns
  /// up to 100 results and a `nextToken` value if applicable.
  ///
  /// [filters]: Optional filters to limit results.
  ///
  /// The filter names `status` and `simulationApplicationName` and
  /// `robotApplicationName` are supported. When filtering, you must use the
  /// complete value of the filtered item. You can use up to three filters, but
  /// they must be for the same named item. For example, if you are looking for
  /// items with the status `Preparing` or the status `Running`.
  Future<ListSimulationJobsResponse> listSimulationJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    return ListSimulationJobsResponse.fromJson({});
  }

  /// Lists all tags on a AWS RoboMaker resource.
  ///
  /// [resourceArn]: The AWS RoboMaker Amazon Resource Name (ARN) with tags to
  /// be listed.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Registers a robot with a fleet.
  ///
  /// [fleet]: The Amazon Resource Name (ARN) of the fleet.
  ///
  /// [robot]: The Amazon Resource Name (ARN) of the robot.
  Future<RegisterRobotResponse> registerRobot(
      {@required String fleet, @required String robot}) async {
    return RegisterRobotResponse.fromJson({});
  }

  /// Restarts a running simulation job.
  ///
  /// [job]: The Amazon Resource Name (ARN) of the simulation job.
  Future<RestartSimulationJobResponse> restartSimulationJob(String job) async {
    return RestartSimulationJobResponse.fromJson({});
  }

  /// Syncrhonizes robots in a fleet to the latest deployment. This is helpful
  /// if robots were added after a deployment.
  ///
  /// [clientRequestToken]: Unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the request.
  ///
  /// [fleet]: The target fleet for the synchronization.
  Future<SyncDeploymentJobResponse> syncDeploymentJob(
      {@required String clientRequestToken, @required String fleet}) async {
    return SyncDeploymentJobResponse.fromJson({});
  }

  /// Adds or edits tags for a AWS RoboMaker resource.
  ///
  /// Each tag consists of a tag key and a tag value. Tag keys and tag values
  /// are both required, but tag values can be empty strings.
  ///
  /// For information about the rules that apply to tag keys and tag values, see
  /// [User-Defined Tag Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the AWS RoboMaker
  /// resource you are tagging.
  ///
  /// [tags]: A map that contains tag keys and tag values that are attached to
  /// the resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes the specified tags from the specified AWS RoboMaker resource.
  ///
  /// To remove a tag, specify the tag key. To change the tag value of an
  /// existing tag key, use
  /// [`TagResource`](https://docs.aws.amazon.com/robomaker/latest/dg/API_TagResource.html)
  /// .
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the AWS RoboMaker
  /// resource you are removing tags.
  ///
  /// [tagKeys]: A map that contains tag keys and tag values that will be
  /// unattached from the resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates a robot application.
  ///
  /// [application]: The application information for the robot application.
  ///
  /// [sources]: The sources of the robot application.
  ///
  /// [robotSoftwareSuite]: The robot software suite used by the robot
  /// application.
  ///
  /// [currentRevisionId]: The revision id for the robot application.
  Future<UpdateRobotApplicationResponse> updateRobotApplication(
      {@required String application,
      @required List<SourceConfig> sources,
      @required RobotSoftwareSuite robotSoftwareSuite,
      String currentRevisionId}) async {
    return UpdateRobotApplicationResponse.fromJson({});
  }

  /// Updates a simulation application.
  ///
  /// [application]: The application information for the simulation application.
  ///
  /// [sources]: The sources of the simulation application.
  ///
  /// [simulationSoftwareSuite]: The simulation software suite used by the
  /// simulation application.
  ///
  /// [robotSoftwareSuite]: Information about the robot software suite.
  ///
  /// [renderingEngine]: The rendering engine for the simulation application.
  ///
  /// [currentRevisionId]: The revision id for the robot application.
  Future<UpdateSimulationApplicationResponse> updateSimulationApplication(
      {@required String application,
      @required List<SourceConfig> sources,
      @required SimulationSoftwareSuite simulationSoftwareSuite,
      @required RobotSoftwareSuite robotSoftwareSuite,
      RenderingEngine renderingEngine,
      String currentRevisionId}) async {
    return UpdateSimulationApplicationResponse.fromJson({});
  }
}

class BatchDescribeSimulationJobResponse {
  /// A list of simulation jobs.
  final List<SimulationJob> jobs;

  /// A list of unprocessed simulation job Amazon Resource Names (ARNs).
  final List<String> unprocessedJobs;

  BatchDescribeSimulationJobResponse({
    this.jobs,
    this.unprocessedJobs,
  });
  static BatchDescribeSimulationJobResponse fromJson(
          Map<String, dynamic> json) =>
      BatchDescribeSimulationJobResponse();
}

class CancelDeploymentJobResponse {
  CancelDeploymentJobResponse();
  static CancelDeploymentJobResponse fromJson(Map<String, dynamic> json) =>
      CancelDeploymentJobResponse();
}

class CancelSimulationJobResponse {
  CancelSimulationJobResponse();
  static CancelSimulationJobResponse fromJson(Map<String, dynamic> json) =>
      CancelSimulationJobResponse();
}

class CreateDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String arn;

  /// The target fleet for the deployment job.
  final String fleet;

  /// The status of the deployment job.
  final String status;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The failure reason of the deployment job if it failed.
  final String failureReason;

  /// The failure code of the simulation job if it failed:
  ///
  /// BadPermissionError
  ///
  /// AWS Greengrass requires a service-level role permission to access other
  /// services. The role must include the
  /// [`AWSGreengrassResourceAccessRolePolicy` managed policy](https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSGreengrassResourceAccessRolePolicy$jsonEditor).
  ///
  /// ExtractingBundleFailure
  ///
  /// The robot application could not be extracted from the bundle.
  ///
  /// FailureThresholdBreached
  ///
  /// The percentage of robots that could not be updated exceeded the percentage
  /// set for the deployment.
  ///
  /// GreengrassDeploymentFailed
  ///
  /// The robot application could not be deployed to the robot.
  ///
  /// GreengrassGroupVersionDoesNotExist
  ///
  /// The AWS Greengrass group or version associated with a robot is missing.
  ///
  /// InternalServerError
  ///
  /// An internal error has occurred. Retry your request, but if the problem
  /// persists, contact us with details.
  ///
  /// MissingRobotApplicationArchitecture
  ///
  /// The robot application does not have a source that matches the architecture
  /// of the robot.
  ///
  /// MissingRobotDeploymentResource
  ///
  /// One or more of the resources specified for the robot application are
  /// missing. For example, does the robot application have the correct launch
  /// package and launch file?
  ///
  /// PostLaunchFileFailure
  ///
  /// The post-launch script failed.
  ///
  /// PreLaunchFileFailure
  ///
  /// The pre-launch script failed.
  ///
  /// ResourceNotFound
  ///
  /// One or more deployment resources are missing. For example, do robot
  /// application source bundles still exist?
  ///
  /// RobotDeploymentNoResponse
  ///
  /// There is no response from the robot. It might not be powered on or
  /// connected to the internet.
  final String failureCode;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime createdAt;

  /// The deployment configuration.
  final DeploymentConfig deploymentConfig;

  /// The list of all tags added to the deployment job.
  final Map<String, String> tags;

  CreateDeploymentJobResponse({
    this.arn,
    this.fleet,
    this.status,
    this.deploymentApplicationConfigs,
    this.failureReason,
    this.failureCode,
    this.createdAt,
    this.deploymentConfig,
    this.tags,
  });
  static CreateDeploymentJobResponse fromJson(Map<String, dynamic> json) =>
      CreateDeploymentJobResponse();
}

class CreateFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String arn;

  /// The name of the fleet.
  final String name;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime createdAt;

  /// The list of all tags added to the fleet.
  final Map<String, String> tags;

  CreateFleetResponse({
    this.arn,
    this.name,
    this.createdAt,
    this.tags,
  });
  static CreateFleetResponse fromJson(Map<String, dynamic> json) =>
      CreateFleetResponse();
}

class CreateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String arn;

  /// The name of the robot application.
  final String name;

  /// The version of the robot application.
  final String version;

  /// The sources of the robot application.
  final List<Source> sources;

  /// The robot software suite used by the robot application.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The revision id of the robot application.
  final String revisionId;

  /// The list of all tags added to the robot application.
  final Map<String, String> tags;

  CreateRobotApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.robotSoftwareSuite,
    this.lastUpdatedAt,
    this.revisionId,
    this.tags,
  });
  static CreateRobotApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateRobotApplicationResponse();
}

class CreateRobotApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String arn;

  /// The name of the robot application.
  final String name;

  /// The version of the robot application.
  final String version;

  /// The sources of the robot application.
  final List<Source> sources;

  /// The robot software suite used by the robot application.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The revision id of the robot application.
  final String revisionId;

  CreateRobotApplicationVersionResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.robotSoftwareSuite,
    this.lastUpdatedAt,
    this.revisionId,
  });
  static CreateRobotApplicationVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateRobotApplicationVersionResponse();
}

class CreateRobotResponse {
  /// The Amazon Resource Name (ARN) of the robot.
  final String arn;

  /// The name of the robot.
  final String name;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the Greengrass group associated with the
  /// robot.
  final String greengrassGroupId;

  /// The target architecture of the robot.
  final String architecture;

  /// The list of all tags added to the robot.
  final Map<String, String> tags;

  CreateRobotResponse({
    this.arn,
    this.name,
    this.createdAt,
    this.greengrassGroupId,
    this.architecture,
    this.tags,
  });
  static CreateRobotResponse fromJson(Map<String, dynamic> json) =>
      CreateRobotResponse();
}

class CreateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  final String arn;

  /// The name of the simulation application.
  final String name;

  /// The version of the simulation application.
  final String version;

  /// The sources of the simulation application.
  final List<Source> sources;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// Information about the robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The rendering engine for the simulation application.
  final RenderingEngine renderingEngine;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime lastUpdatedAt;

  /// The revision id of the simulation application.
  final String revisionId;

  /// The list of all tags added to the simulation application.
  final Map<String, String> tags;

  CreateSimulationApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.simulationSoftwareSuite,
    this.robotSoftwareSuite,
    this.renderingEngine,
    this.lastUpdatedAt,
    this.revisionId,
    this.tags,
  });
  static CreateSimulationApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSimulationApplicationResponse();
}

class CreateSimulationApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  final String arn;

  /// The name of the simulation application.
  final String name;

  /// The version of the simulation application.
  final String version;

  /// The sources of the simulation application.
  final List<Source> sources;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// Information about the robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The rendering engine for the simulation application.
  final RenderingEngine renderingEngine;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime lastUpdatedAt;

  /// The revision ID of the simulation application.
  final String revisionId;

  CreateSimulationApplicationVersionResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.simulationSoftwareSuite,
    this.robotSoftwareSuite,
    this.renderingEngine,
    this.lastUpdatedAt,
    this.revisionId,
  });
  static CreateSimulationApplicationVersionResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSimulationApplicationVersionResponse();
}

class CreateSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String arn;

  /// The status of the simulation job.
  final String status;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last started.
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// the failure behavior for the simulation job.
  final String failureBehavior;

  /// The failure code of the simulation job if it failed:
  ///
  /// InternalServiceError
  ///
  /// Internal service error.
  ///
  /// RobotApplicationCrash
  ///
  /// Robot application exited abnormally.
  ///
  /// SimulationApplicationCrash
  ///
  ///  Simulation application exited abnormally.
  ///
  /// BadPermissionsRobotApplication
  ///
  /// Robot application bundle could not be downloaded.
  ///
  /// BadPermissionsSimulationApplication
  ///
  /// Simulation application bundle could not be downloaded.
  ///
  /// BadPermissionsS3Output
  ///
  /// Unable to publish outputs to customer-provided S3 bucket.
  ///
  /// BadPermissionsCloudwatchLogs
  ///
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  ///
  /// SubnetIpLimitExceeded
  ///
  /// Subnet IP limit exceeded.
  ///
  /// ENILimitExceeded
  ///
  /// ENI limit exceeded.
  ///
  /// BadPermissionsUserCredentials
  ///
  /// Unable to use the Role provided.
  ///
  /// InvalidBundleRobotApplication
  ///
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  ///
  /// InvalidBundleSimulationApplication
  ///
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  ///
  /// RobotApplicationVersionMismatchedEtag
  ///
  /// Etag for RobotApplication does not match value during version creation.
  ///
  /// SimulationApplicationVersionMismatchedEtag
  ///
  /// Etag for SimulationApplication does not match value during version
  /// creation.
  final String failureCode;

  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientRequestToken;

  /// Simulation job output files location.
  final OutputLocation outputLocation;

  /// The logging configuration.
  final LoggingConfig loggingConfig;

  /// The maximum simulation job duration in seconds.
  final BigInt maxJobDurationInSeconds;

  /// The simulation job execution duration in milliseconds.
  final BigInt simulationTimeMillis;

  /// The IAM role that allows the simulation job to call the AWS APIs that are
  /// specified in its associated policies on your behalf.
  final String iamRole;

  /// The robot application used by the simulation job.
  final List<RobotApplicationConfig> robotApplications;

  /// The simulation application used by the simulation job.
  final List<SimulationApplicationConfig> simulationApplications;

  /// The data sources for the simulation job.
  final List<DataSource> dataSources;

  /// The list of all tags added to the simulation job.
  final Map<String, String> tags;

  /// Information about the vpc configuration.
  final VpcConfigResponse vpcConfig;

  CreateSimulationJobResponse({
    this.arn,
    this.status,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.failureBehavior,
    this.failureCode,
    this.clientRequestToken,
    this.outputLocation,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.simulationTimeMillis,
    this.iamRole,
    this.robotApplications,
    this.simulationApplications,
    this.dataSources,
    this.tags,
    this.vpcConfig,
  });
  static CreateSimulationJobResponse fromJson(Map<String, dynamic> json) =>
      CreateSimulationJobResponse();
}

/// Information about a data source.
class DataSource {
  /// The name of the data source.
  final String name;

  /// The S3 bucket where the data files are located.
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  final List<S3KeyOutput> s3Keys;

  DataSource({
    this.name,
    this.s3Bucket,
    this.s3Keys,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource();
}

/// Information about a data source.
class DataSourceConfig {
  /// The name of the data source.
  final String name;

  /// The S3 bucket where the data files are located.
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  final List<String> s3Keys;

  DataSourceConfig({
    @required this.name,
    @required this.s3Bucket,
    @required this.s3Keys,
  });
}

class DeleteFleetResponse {
  DeleteFleetResponse();
  static DeleteFleetResponse fromJson(Map<String, dynamic> json) =>
      DeleteFleetResponse();
}

class DeleteRobotApplicationResponse {
  DeleteRobotApplicationResponse();
  static DeleteRobotApplicationResponse fromJson(Map<String, dynamic> json) =>
      DeleteRobotApplicationResponse();
}

class DeleteRobotResponse {
  DeleteRobotResponse();
  static DeleteRobotResponse fromJson(Map<String, dynamic> json) =>
      DeleteRobotResponse();
}

class DeleteSimulationApplicationResponse {
  DeleteSimulationApplicationResponse();
  static DeleteSimulationApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteSimulationApplicationResponse();
}

/// Information about a deployment application configuration.
class DeploymentApplicationConfig {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String application;

  /// The version of the application.
  final String applicationVersion;

  /// The launch configuration.
  final DeploymentLaunchConfig launchConfig;

  DeploymentApplicationConfig({
    @required this.application,
    @required this.applicationVersion,
    @required this.launchConfig,
  });
  static DeploymentApplicationConfig fromJson(Map<String, dynamic> json) =>
      DeploymentApplicationConfig();
}

/// Information about a deployment configuration.
class DeploymentConfig {
  /// The percentage of robots receiving the deployment at the same time.
  final int concurrentDeploymentPercentage;

  /// The percentage of deployments that need to fail before stopping
  /// deployment.
  final int failureThresholdPercentage;

  /// The amount of time, in seconds, to wait for deployment to a single robot
  /// to complete. Choose a time between 1 minute and 7 days. The default is 5
  /// hours.
  final BigInt robotDeploymentTimeoutInSeconds;

  DeploymentConfig({
    this.concurrentDeploymentPercentage,
    this.failureThresholdPercentage,
    this.robotDeploymentTimeoutInSeconds,
  });
  static DeploymentConfig fromJson(Map<String, dynamic> json) =>
      DeploymentConfig();
}

/// Information about a deployment job.
class DeploymentJob {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String arn;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleet;

  /// The status of the deployment job.
  final String status;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The deployment configuration.
  final DeploymentConfig deploymentConfig;

  /// A short description of the reason why the deployment job failed.
  final String failureReason;

  /// The deployment job failure code.
  final String failureCode;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  final DateTime createdAt;

  DeploymentJob({
    this.arn,
    this.fleet,
    this.status,
    this.deploymentApplicationConfigs,
    this.deploymentConfig,
    this.failureReason,
    this.failureCode,
    this.createdAt,
  });
  static DeploymentJob fromJson(Map<String, dynamic> json) => DeploymentJob();
}

/// Configuration information for a deployment launch.
class DeploymentLaunchConfig {
  /// The package name.
  final String packageName;

  /// The deployment pre-launch file. This file will be executed prior to the
  /// launch file.
  final String preLaunchFile;

  /// The launch file name.
  final String launchFile;

  /// The deployment post-launch file. This file will be executed after the
  /// launch file.
  final String postLaunchFile;

  /// An array of key/value pairs specifying environment variables for the robot
  /// application
  final Map<String, String> environmentVariables;

  DeploymentLaunchConfig({
    @required this.packageName,
    this.preLaunchFile,
    @required this.launchFile,
    this.postLaunchFile,
    this.environmentVariables,
  });
  static DeploymentLaunchConfig fromJson(Map<String, dynamic> json) =>
      DeploymentLaunchConfig();
}

class DeregisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleet;

  /// The Amazon Resource Name (ARN) of the robot.
  final String robot;

  DeregisterRobotResponse({
    this.fleet,
    this.robot,
  });
  static DeregisterRobotResponse fromJson(Map<String, dynamic> json) =>
      DeregisterRobotResponse();
}

class DescribeDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String arn;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleet;

  /// The status of the deployment job.
  final String status;

  /// The deployment configuration.
  final DeploymentConfig deploymentConfig;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// A short description of the reason why the deployment job failed.
  final String failureReason;

  /// The deployment job failure code.
  final String failureCode;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  final DateTime createdAt;

  /// A list of robot deployment summaries.
  final List<RobotDeployment> robotDeploymentSummary;

  /// The list of all tags added to the specified deployment job.
  final Map<String, String> tags;

  DescribeDeploymentJobResponse({
    this.arn,
    this.fleet,
    this.status,
    this.deploymentConfig,
    this.deploymentApplicationConfigs,
    this.failureReason,
    this.failureCode,
    this.createdAt,
    this.robotDeploymentSummary,
    this.tags,
  });
  static DescribeDeploymentJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeDeploymentJobResponse();
}

class DescribeFleetResponse {
  /// The name of the fleet.
  final String name;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String arn;

  /// A list of robots.
  final List<Robot> robots;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime createdAt;

  /// The status of the last deployment.
  final String lastDeploymentStatus;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String lastDeploymentJob;

  /// The time of the last deployment.
  final DateTime lastDeploymentTime;

  /// The list of all tags added to the specified fleet.
  final Map<String, String> tags;

  DescribeFleetResponse({
    this.name,
    this.arn,
    this.robots,
    this.createdAt,
    this.lastDeploymentStatus,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
    this.tags,
  });
  static DescribeFleetResponse fromJson(Map<String, dynamic> json) =>
      DescribeFleetResponse();
}

class DescribeRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String arn;

  /// The name of the robot application.
  final String name;

  /// The version of the robot application.
  final String version;

  /// The sources of the robot application.
  final List<Source> sources;

  /// The robot software suite used by the robot application.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The revision id of the robot application.
  final String revisionId;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The list of all tags added to the specified robot application.
  final Map<String, String> tags;

  DescribeRobotApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.robotSoftwareSuite,
    this.revisionId,
    this.lastUpdatedAt,
    this.tags,
  });
  static DescribeRobotApplicationResponse fromJson(Map<String, dynamic> json) =>
      DescribeRobotApplicationResponse();
}

class DescribeRobotResponse {
  /// The Amazon Resource Name (ARN) of the robot.
  final String arn;

  /// The name of the robot.
  final String name;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleetArn;

  /// The status of the fleet.
  final String status;

  /// The Greengrass group id.
  final String greengrassGroupId;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime createdAt;

  /// The target architecture of the robot application.
  final String architecture;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String lastDeploymentJob;

  /// The time of the last deployment job.
  final DateTime lastDeploymentTime;

  /// The list of all tags added to the specified robot.
  final Map<String, String> tags;

  DescribeRobotResponse({
    this.arn,
    this.name,
    this.fleetArn,
    this.status,
    this.greengrassGroupId,
    this.createdAt,
    this.architecture,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
    this.tags,
  });
  static DescribeRobotResponse fromJson(Map<String, dynamic> json) =>
      DescribeRobotResponse();
}

class DescribeSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot simulation application.
  final String arn;

  /// The name of the simulation application.
  final String name;

  /// The version of the simulation application.
  final String version;

  /// The sources of the simulation application.
  final List<Source> sources;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// Information about the robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The rendering engine for the simulation application.
  final RenderingEngine renderingEngine;

  /// The revision id of the simulation application.
  final String revisionId;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime lastUpdatedAt;

  /// The list of all tags added to the specified simulation application.
  final Map<String, String> tags;

  DescribeSimulationApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.simulationSoftwareSuite,
    this.robotSoftwareSuite,
    this.renderingEngine,
    this.revisionId,
    this.lastUpdatedAt,
    this.tags,
  });
  static DescribeSimulationApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeSimulationApplicationResponse();
}

class DescribeSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String arn;

  /// The name of the simulation job.
  final String name;

  /// The status of the simulation job.
  final String status;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last started.
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The failure behavior for the simulation job.
  final String failureBehavior;

  /// The failure code of the simulation job if it failed:
  ///
  /// InternalServiceError
  ///
  /// Internal service error.
  ///
  /// RobotApplicationCrash
  ///
  /// Robot application exited abnormally.
  ///
  /// SimulationApplicationCrash
  ///
  ///  Simulation application exited abnormally.
  ///
  /// BadPermissionsRobotApplication
  ///
  /// Robot application bundle could not be downloaded.
  ///
  /// BadPermissionsSimulationApplication
  ///
  /// Simulation application bundle could not be downloaded.
  ///
  /// BadPermissionsS3Output
  ///
  /// Unable to publish outputs to customer-provided S3 bucket.
  ///
  /// BadPermissionsCloudwatchLogs
  ///
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  ///
  /// SubnetIpLimitExceeded
  ///
  /// Subnet IP limit exceeded.
  ///
  /// ENILimitExceeded
  ///
  /// ENI limit exceeded.
  ///
  /// BadPermissionsUserCredentials
  ///
  /// Unable to use the Role provided.
  ///
  /// InvalidBundleRobotApplication
  ///
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  ///
  /// InvalidBundleSimulationApplication
  ///
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  ///
  /// RobotApplicationVersionMismatchedEtag
  ///
  /// Etag for RobotApplication does not match value during version creation.
  ///
  /// SimulationApplicationVersionMismatchedEtag
  ///
  /// Etag for SimulationApplication does not match value during version
  /// creation.
  final String failureCode;

  /// Details about why the simulation job failed. For more information about
  /// troubleshooting, see
  /// [Troubleshooting](https://docs.aws.amazon.com/robomaker/latest/dg/troubleshooting.html).
  final String failureReason;

  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientRequestToken;

  /// Location for output files generated by the simulation job.
  final OutputLocation outputLocation;

  /// The logging configuration.
  final LoggingConfig loggingConfig;

  /// The maximum job duration in seconds. The value must be 8 days (691,200
  /// seconds) or less.
  final BigInt maxJobDurationInSeconds;

  /// The simulation job execution duration in milliseconds.
  final BigInt simulationTimeMillis;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf.
  final String iamRole;

  /// A list of robot applications.
  final List<RobotApplicationConfig> robotApplications;

  /// A list of simulation applications.
  final List<SimulationApplicationConfig> simulationApplications;

  /// The data sources for the simulation job.
  final List<DataSource> dataSources;

  /// The list of all tags added to the specified simulation job.
  final Map<String, String> tags;

  /// The VPC configuration.
  final VpcConfigResponse vpcConfig;

  /// The network interface information for the simulation job.
  final NetworkInterface networkInterface;

  DescribeSimulationJobResponse({
    this.arn,
    this.name,
    this.status,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.failureBehavior,
    this.failureCode,
    this.failureReason,
    this.clientRequestToken,
    this.outputLocation,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.simulationTimeMillis,
    this.iamRole,
    this.robotApplications,
    this.simulationApplications,
    this.dataSources,
    this.tags,
    this.vpcConfig,
    this.networkInterface,
  });
  static DescribeSimulationJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeSimulationJobResponse();
}

/// Information about a filter.
class Filter {
  /// The name of the filter.
  final String name;

  /// A list of values.
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
}

/// Information about a fleet.
class Fleet {
  /// The name of the fleet.
  final String name;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime createdAt;

  /// The status of the last fleet deployment.
  final String lastDeploymentStatus;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String lastDeploymentJob;

  /// The time of the last deployment.
  final DateTime lastDeploymentTime;

  Fleet({
    this.name,
    this.arn,
    this.createdAt,
    this.lastDeploymentStatus,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
  });
  static Fleet fromJson(Map<String, dynamic> json) => Fleet();
}

/// Information about a launch configuration.
class LaunchConfig {
  /// The package name.
  final String packageName;

  /// The launch file name.
  final String launchFile;

  /// The environment variables for the application launch.
  final Map<String, String> environmentVariables;

  /// The port forwarding configuration.
  final PortForwardingConfig portForwardingConfig;

  LaunchConfig({
    @required this.packageName,
    @required this.launchFile,
    this.environmentVariables,
    this.portForwardingConfig,
  });
  static LaunchConfig fromJson(Map<String, dynamic> json) => LaunchConfig();
}

class ListDeploymentJobsResponse {
  /// A list of deployment jobs that meet the criteria of the request.
  final List<DeploymentJob> deploymentJobs;

  /// The `nextToken` value to include in a future `ListDeploymentJobs` request.
  /// When the results of a `ListDeploymentJobs` request exceed `maxResults`,
  /// this value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  ListDeploymentJobsResponse({
    this.deploymentJobs,
    this.nextToken,
  });
  static ListDeploymentJobsResponse fromJson(Map<String, dynamic> json) =>
      ListDeploymentJobsResponse();
}

class ListFleetsResponse {
  /// A list of fleet details meeting the request criteria.
  final List<Fleet> fleetDetails;

  /// The `nextToken` value to include in a future `ListDeploymentJobs` request.
  /// When the results of a `ListFleets` request exceed `maxResults`, this value
  /// can be used to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  ListFleetsResponse({
    this.fleetDetails,
    this.nextToken,
  });
  static ListFleetsResponse fromJson(Map<String, dynamic> json) =>
      ListFleetsResponse();
}

class ListRobotApplicationsResponse {
  /// A list of robot application summaries that meet the criteria of the
  /// request.
  final List<RobotApplicationSummary> robotApplicationSummaries;

  /// The `nextToken` value to include in a future `ListRobotApplications`
  /// request. When the results of a `ListRobotApplications` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is `null` when there are no more results to return.
  final String nextToken;

  ListRobotApplicationsResponse({
    this.robotApplicationSummaries,
    this.nextToken,
  });
  static ListRobotApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListRobotApplicationsResponse();
}

class ListRobotsResponse {
  /// A list of robots that meet the criteria of the request.
  final List<Robot> robots;

  /// The `nextToken` value to include in a future `ListRobots` request. When
  /// the results of a `ListRobot` request exceed `maxResults`, this value can
  /// be used to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  ListRobotsResponse({
    this.robots,
    this.nextToken,
  });
  static ListRobotsResponse fromJson(Map<String, dynamic> json) =>
      ListRobotsResponse();
}

class ListSimulationApplicationsResponse {
  /// A list of simulation application summaries that meet the criteria of the
  /// request.
  final List<SimulationApplicationSummary> simulationApplicationSummaries;

  /// The `nextToken` value to include in a future `ListSimulationApplications`
  /// request. When the results of a `ListRobot` request exceed `maxResults`,
  /// this value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  ListSimulationApplicationsResponse({
    this.simulationApplicationSummaries,
    this.nextToken,
  });
  static ListSimulationApplicationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListSimulationApplicationsResponse();
}

class ListSimulationJobsResponse {
  /// A list of simulation job summaries that meet the criteria of the request.
  final List<SimulationJobSummary> simulationJobSummaries;

  /// The `nextToken` value to include in a future `ListSimulationJobs` request.
  /// When the results of a `ListRobot` request exceed `maxResults`, this value
  /// can be used to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String nextToken;

  ListSimulationJobsResponse({
    @required this.simulationJobSummaries,
    this.nextToken,
  });
  static ListSimulationJobsResponse fromJson(Map<String, dynamic> json) =>
      ListSimulationJobsResponse();
}

class ListTagsForResourceResponse {
  /// The list of all tags added to the specified resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

/// The logging configuration.
class LoggingConfig {
  /// A boolean indicating whether to record all ROS topics.
  final bool recordAllRosTopics;

  LoggingConfig({
    @required this.recordAllRosTopics,
  });
  static LoggingConfig fromJson(Map<String, dynamic> json) => LoggingConfig();
}

/// Describes a network interface.
class NetworkInterface {
  /// The ID of the network interface.
  final String networkInterfaceId;

  /// The IPv4 address of the network interface within the subnet.
  final String privateIpAddress;

  /// The IPv4 public address of the network interface.
  final String publicIpAddress;

  NetworkInterface({
    this.networkInterfaceId,
    this.privateIpAddress,
    this.publicIpAddress,
  });
  static NetworkInterface fromJson(Map<String, dynamic> json) =>
      NetworkInterface();
}

/// The output location.
class OutputLocation {
  /// The S3 bucket for output.
  final String s3Bucket;

  /// The S3 folder in the `s3Bucket` where output files will be placed.
  final String s3Prefix;

  OutputLocation({
    this.s3Bucket,
    this.s3Prefix,
  });
  static OutputLocation fromJson(Map<String, dynamic> json) => OutputLocation();
}

/// Configuration information for port forwarding.
class PortForwardingConfig {
  /// The port mappings for the configuration.
  final List<PortMapping> portMappings;

  PortForwardingConfig({
    this.portMappings,
  });
  static PortForwardingConfig fromJson(Map<String, dynamic> json) =>
      PortForwardingConfig();
}

/// An object representing a port mapping.
class PortMapping {
  /// The port number on the simulation job instance to use as a remote
  /// connection point.
  final int jobPort;

  /// The port number on the application.
  final int applicationPort;

  /// A Boolean indicating whether to enable this port mapping on public IP.
  final bool enableOnPublicIp;

  PortMapping({
    @required this.jobPort,
    @required this.applicationPort,
    this.enableOnPublicIp,
  });
  static PortMapping fromJson(Map<String, dynamic> json) => PortMapping();
}

/// Information about the progress of a deployment job.
class ProgressDetail {
  /// The current progress status.
  ///
  /// Validating
  ///
  /// Validating the deployment.
  ///
  /// DownloadingExtracting
  ///
  /// Downloading and extracting the bundle on the robot.
  ///
  /// ExecutingPreLaunch
  ///
  /// Executing pre-launch script(s) if provided.
  ///
  /// Launching
  ///
  /// Launching the robot application.
  ///
  /// ExecutingPostLaunch
  ///
  /// Executing post-launch script(s) if provided.
  ///
  /// Finished
  ///
  /// Deployment is complete.
  final String currentProgress;

  /// Precentage of the step that is done. This currently only applies to the
  /// `Downloading/Extracting` step of the deployment. It is empty for other
  /// steps.
  final double percentDone;

  /// Estimated amount of time in seconds remaining in the step. This currently
  /// only applies to the `Downloading/Extracting` step of the deployment. It is
  /// empty for other steps.
  final int estimatedTimeRemainingSeconds;

  /// The Amazon Resource Name (ARN) of the deployment job.
  final String targetResource;

  ProgressDetail({
    this.currentProgress,
    this.percentDone,
    this.estimatedTimeRemainingSeconds,
    this.targetResource,
  });
  static ProgressDetail fromJson(Map<String, dynamic> json) => ProgressDetail();
}

class RegisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet that the robot will join.
  final String fleet;

  /// Information about the robot registration.
  final String robot;

  RegisterRobotResponse({
    this.fleet,
    this.robot,
  });
  static RegisterRobotResponse fromJson(Map<String, dynamic> json) =>
      RegisterRobotResponse();
}

/// Information about a rendering engine.
class RenderingEngine {
  /// The name of the rendering engine.
  final String name;

  /// The version of the rendering engine.
  final String version;

  RenderingEngine({
    this.name,
    this.version,
  });
  static RenderingEngine fromJson(Map<String, dynamic> json) =>
      RenderingEngine();
}

class RestartSimulationJobResponse {
  RestartSimulationJobResponse();
  static RestartSimulationJobResponse fromJson(Map<String, dynamic> json) =>
      RestartSimulationJobResponse();
}

/// Information about a robot.
class Robot {
  /// The Amazon Resource Name (ARN) of the robot.
  final String arn;

  /// The name of the robot.
  final String name;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleetArn;

  /// The status of the robot.
  final String status;

  /// The Greengrass group associated with the robot.
  final String greenGrassGroupId;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime createdAt;

  /// The architecture of the robot.
  final String architecture;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String lastDeploymentJob;

  /// The time of the last deployment.
  final DateTime lastDeploymentTime;

  Robot({
    this.arn,
    this.name,
    this.fleetArn,
    this.status,
    this.greenGrassGroupId,
    this.createdAt,
    this.architecture,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
  });
  static Robot fromJson(Map<String, dynamic> json) => Robot();
}

/// Application configuration information for a robot.
class RobotApplicationConfig {
  /// The application information for the robot application.
  final String application;

  /// The version of the robot application.
  final String applicationVersion;

  /// The launch configuration for the robot application.
  final LaunchConfig launchConfig;

  RobotApplicationConfig({
    @required this.application,
    this.applicationVersion,
    @required this.launchConfig,
  });
  static RobotApplicationConfig fromJson(Map<String, dynamic> json) =>
      RobotApplicationConfig();
}

/// Summary information for a robot application.
class RobotApplicationSummary {
  /// The name of the robot application.
  final String name;

  /// The Amazon Resource Name (ARN) of the robot.
  final String arn;

  /// The version of the robot application.
  final String version;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// Information about a robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  RobotApplicationSummary({
    this.name,
    this.arn,
    this.version,
    this.lastUpdatedAt,
    this.robotSoftwareSuite,
  });
  static RobotApplicationSummary fromJson(Map<String, dynamic> json) =>
      RobotApplicationSummary();
}

/// Information about a robot deployment.
class RobotDeployment {
  /// The robot deployment Amazon Resource Name (ARN).
  final String arn;

  /// The time, in milliseconds since the epoch, when the deployment was
  /// started.
  final DateTime deploymentStartTime;

  /// The time, in milliseconds since the epoch, when the deployment finished.
  final DateTime deploymentFinishTime;

  /// The status of the robot deployment.
  final String status;

  /// Information about how the deployment is progressing.
  final ProgressDetail progressDetail;

  /// A short description of the reason why the robot deployment failed.
  final String failureReason;

  /// The robot deployment failure code.
  final String failureCode;

  RobotDeployment({
    this.arn,
    this.deploymentStartTime,
    this.deploymentFinishTime,
    this.status,
    this.progressDetail,
    this.failureReason,
    this.failureCode,
  });
  static RobotDeployment fromJson(Map<String, dynamic> json) =>
      RobotDeployment();
}

/// Information about a robot software suite.
class RobotSoftwareSuite {
  /// The name of the robot software suite.
  final String name;

  /// The version of the robot software suite.
  final String version;

  RobotSoftwareSuite({
    this.name,
    this.version,
  });
  static RobotSoftwareSuite fromJson(Map<String, dynamic> json) =>
      RobotSoftwareSuite();
}

/// Information about S3 keys.
class S3KeyOutput {
  /// The S3 key.
  final String s3Key;

  /// The etag for the object.
  final String etag;

  S3KeyOutput({
    this.s3Key,
    this.etag,
  });
  static S3KeyOutput fromJson(Map<String, dynamic> json) => S3KeyOutput();
}

/// Information about a simulation application configuration.
class SimulationApplicationConfig {
  /// The application information for the simulation application.
  final String application;

  /// The version of the simulation application.
  final String applicationVersion;

  /// The launch configuration for the simulation application.
  final LaunchConfig launchConfig;

  SimulationApplicationConfig({
    @required this.application,
    this.applicationVersion,
    @required this.launchConfig,
  });
  static SimulationApplicationConfig fromJson(Map<String, dynamic> json) =>
      SimulationApplicationConfig();
}

/// Summary information for a simulation application.
class SimulationApplicationSummary {
  /// The name of the simulation application.
  final String name;

  /// The Amazon Resource Name (ARN) of the simulation application.
  final String arn;

  /// The version of the simulation application.
  final String version;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime lastUpdatedAt;

  /// Information about a robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// Information about a simulation software suite.
  final SimulationSoftwareSuite simulationSoftwareSuite;

  SimulationApplicationSummary({
    this.name,
    this.arn,
    this.version,
    this.lastUpdatedAt,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
  });
  static SimulationApplicationSummary fromJson(Map<String, dynamic> json) =>
      SimulationApplicationSummary();
}

/// Information about a simulation job.
class SimulationJob {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String arn;

  /// The name of the simulation job.
  final String name;

  /// Status of the simulation job.
  final String status;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last started.
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The failure behavior the simulation job.
  ///
  /// Continue
  ///
  /// Restart the simulation job in the same host instance.
  ///
  /// Fail
  ///
  /// Stop the simulation job and terminate the instance.
  final String failureBehavior;

  /// The failure code of the simulation job if it failed.
  final String failureCode;

  /// The reason why the simulation job failed.
  final String failureReason;

  /// A unique identifier for this `SimulationJob` request.
  final String clientRequestToken;

  /// Location for output files generated by the simulation job.
  final OutputLocation outputLocation;

  /// The logging configuration.
  final LoggingConfig loggingConfig;

  /// The maximum simulation job duration in seconds. The value must be 8 days
  /// (691,200 seconds) or less.
  final BigInt maxJobDurationInSeconds;

  /// The simulation job execution duration in milliseconds.
  final BigInt simulationTimeMillis;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  final String iamRole;

  /// A list of robot applications.
  final List<RobotApplicationConfig> robotApplications;

  /// A list of simulation applications.
  final List<SimulationApplicationConfig> simulationApplications;

  /// The data sources for the simulation job.
  final List<DataSource> dataSources;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job.
  final Map<String, String> tags;

  /// VPC configuration information.
  final VpcConfigResponse vpcConfig;

  final NetworkInterface networkInterface;

  SimulationJob({
    this.arn,
    this.name,
    this.status,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.failureBehavior,
    this.failureCode,
    this.failureReason,
    this.clientRequestToken,
    this.outputLocation,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.simulationTimeMillis,
    this.iamRole,
    this.robotApplications,
    this.simulationApplications,
    this.dataSources,
    this.tags,
    this.vpcConfig,
    this.networkInterface,
  });
  static SimulationJob fromJson(Map<String, dynamic> json) => SimulationJob();
}

/// Summary information for a simulation job.
class SimulationJobSummary {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation job was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The name of the simulation job.
  final String name;

  /// The status of the simulation job.
  final String status;

  /// A list of simulation job simulation application names.
  final List<String> simulationApplicationNames;

  /// A list of simulation job robot application names.
  final List<String> robotApplicationNames;

  /// The names of the data sources.
  final List<String> dataSourceNames;

  SimulationJobSummary({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.simulationApplicationNames,
    this.robotApplicationNames,
    this.dataSourceNames,
  });
  static SimulationJobSummary fromJson(Map<String, dynamic> json) =>
      SimulationJobSummary();
}

/// Information about a simulation software suite.
class SimulationSoftwareSuite {
  /// The name of the simulation software suite.
  final String name;

  /// The version of the simulation software suite.
  final String version;

  SimulationSoftwareSuite({
    this.name,
    this.version,
  });
  static SimulationSoftwareSuite fromJson(Map<String, dynamic> json) =>
      SimulationSoftwareSuite();
}

/// Information about a source.
class Source {
  /// The s3 bucket name.
  final String s3Bucket;

  /// The s3 object key.
  final String s3Key;

  /// A hash of the object specified by `s3Bucket` and `s3Key`.
  final String etag;

  /// The taget processor architecture for the application.
  final String architecture;

  Source({
    this.s3Bucket,
    this.s3Key,
    this.etag,
    this.architecture,
  });
  static Source fromJson(Map<String, dynamic> json) => Source();
}

/// Information about a source configuration.
class SourceConfig {
  /// The Amazon S3 bucket name.
  final String s3Bucket;

  /// The s3 object key.
  final String s3Key;

  /// The target processor architecture for the application.
  final String architecture;

  SourceConfig({
    this.s3Bucket,
    this.s3Key,
    this.architecture,
  });
}

class SyncDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the synchronization request.
  final String arn;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String fleet;

  /// The status of the synchronization job.
  final String status;

  /// Information about the deployment configuration.
  final DeploymentConfig deploymentConfig;

  /// Information about the deployment application configurations.
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The failure reason if the job fails.
  final String failureReason;

  /// The failure code if the job fails:
  ///
  /// InternalServiceError
  ///
  /// Internal service error.
  ///
  /// RobotApplicationCrash
  ///
  /// Robot application exited abnormally.
  ///
  /// SimulationApplicationCrash
  ///
  ///  Simulation application exited abnormally.
  ///
  /// BadPermissionsRobotApplication
  ///
  /// Robot application bundle could not be downloaded.
  ///
  /// BadPermissionsSimulationApplication
  ///
  /// Simulation application bundle could not be downloaded.
  ///
  /// BadPermissionsS3Output
  ///
  /// Unable to publish outputs to customer-provided S3 bucket.
  ///
  /// BadPermissionsCloudwatchLogs
  ///
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  ///
  /// SubnetIpLimitExceeded
  ///
  /// Subnet IP limit exceeded.
  ///
  /// ENILimitExceeded
  ///
  /// ENI limit exceeded.
  ///
  /// BadPermissionsUserCredentials
  ///
  /// Unable to use the Role provided.
  ///
  /// InvalidBundleRobotApplication
  ///
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  ///
  /// InvalidBundleSimulationApplication
  ///
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  ///
  /// RobotApplicationVersionMismatchedEtag
  ///
  /// Etag for RobotApplication does not match value during version creation.
  ///
  /// SimulationApplicationVersionMismatchedEtag
  ///
  /// Etag for SimulationApplication does not match value during version
  /// creation.
  final String failureCode;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime createdAt;

  SyncDeploymentJobResponse({
    this.arn,
    this.fleet,
    this.status,
    this.deploymentConfig,
    this.deploymentApplicationConfigs,
    this.failureReason,
    this.failureCode,
    this.createdAt,
  });
  static SyncDeploymentJobResponse fromJson(Map<String, dynamic> json) =>
      SyncDeploymentJobResponse();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated robot application.
  final String arn;

  /// The name of the robot application.
  final String name;

  /// The version of the robot application.
  final String version;

  /// The sources of the robot application.
  final List<Source> sources;

  /// The robot software suite used by the robot application.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime lastUpdatedAt;

  /// The revision id of the robot application.
  final String revisionId;

  UpdateRobotApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.robotSoftwareSuite,
    this.lastUpdatedAt,
    this.revisionId,
  });
  static UpdateRobotApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateRobotApplicationResponse();
}

class UpdateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated simulation application.
  final String arn;

  /// The name of the simulation application.
  final String name;

  /// The version of the robot application.
  final String version;

  /// The sources of the simulation application.
  final List<Source> sources;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// Information about the robot software suite.
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The rendering engine for the simulation application.
  final RenderingEngine renderingEngine;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime lastUpdatedAt;

  /// The revision id of the simulation application.
  final String revisionId;

  UpdateSimulationApplicationResponse({
    this.arn,
    this.name,
    this.version,
    this.sources,
    this.simulationSoftwareSuite,
    this.robotSoftwareSuite,
    this.renderingEngine,
    this.lastUpdatedAt,
    this.revisionId,
  });
  static UpdateSimulationApplicationResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateSimulationApplicationResponse();
}

/// If your simulation job accesses resources in a VPC, you provide this
/// parameter identifying the list of security group IDs and subnet IDs. These
/// must belong to the same VPC. You must provide at least one security group
/// and two subnet IDs.
class VpcConfig {
  /// A list of one or more subnet IDs in your VPC.
  final List<String> subnets;

  /// A list of one or more security groups IDs in your VPC.
  final List<String> securityGroups;

  /// A boolean indicating whether to assign a public IP address.
  final bool assignPublicIp;

  VpcConfig({
    @required this.subnets,
    this.securityGroups,
    this.assignPublicIp,
  });
}

/// VPC configuration associated with your simulation job.
class VpcConfigResponse {
  /// A list of subnet IDs associated with the simulation job.
  final List<String> subnets;

  /// A list of security group IDs associated with the simulation job.
  final List<String> securityGroups;

  /// The VPC ID associated with your simulation job.
  final String vpcId;

  /// A boolean indicating if a public IP was assigned.
  final bool assignPublicIp;

  VpcConfigResponse({
    this.subnets,
    this.securityGroups,
    this.vpcId,
    this.assignPublicIp,
  });
  static VpcConfigResponse fromJson(Map<String, dynamic> json) =>
      VpcConfigResponse();
}
