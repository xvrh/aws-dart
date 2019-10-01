import 'package:meta/meta.dart';

/// Amazon Personalize is a machine learning service that makes it easy to add
/// individualized recommendations to customers.
class PersonalizeApi {
  /// Creates a campaign by deploying a solution version. When a client calls
  /// the
  /// [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  /// and
  /// [GetPersonalizedRanking](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html)
  /// APIs, a campaign is specified in the request.
  ///
  ///  **Minimum Provisioned TPS and Auto-Scaling**
  ///
  /// A transaction is a single `GetRecommendations` or `GetPersonalizedRanking`
  /// call. Transactions per second (TPS) is the throughput and unit of billing
  /// for Amazon Personalize. The minimum provisioned TPS (`minProvisionedTPS`)
  /// specifies the baseline throughput provisioned by Amazon Personalize, and
  /// thus, the minimum billing charge. If your TPS increases beyond
  /// `minProvisionedTPS`, Amazon Personalize auto-scales the provisioned
  /// capacity up and down, but never below `minProvisionedTPS`, to maintain a
  /// 70% utilization. There's a short time delay while the capacity is
  /// increased that might cause loss of transactions. It's recommended to start
  /// with a low `minProvisionedTPS`, track your usage using Amazon CloudWatch
  /// metrics, and then increase the `minProvisionedTPS` as necessary.
  ///
  ///  **Status**
  ///
  /// A campaign can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  ///
  ///
  /// To get the campaign status, call DescribeCampaign.
  ///
  ///  Wait until the `status` of the campaign is `ACTIVE` before asking the
  /// campaign for recommendations.
  ///
  ///  **Related APIs**
  ///
  /// *    ListCampaigns
  ///
  /// *    DescribeCampaign
  ///
  /// *    UpdateCampaign
  ///
  /// *    DeleteCampaign
  ///
  /// [name]: A name for the new campaign. The campaign name must be unique
  /// within your account.
  ///
  /// [solutionVersionArn]: The Amazon Resource Name (ARN) of the solution
  /// version to deploy.
  ///
  /// [minProvisionedTps]: Specifies the requested minimum provisioned
  /// transactions (recommendations) per second that Amazon Personalize will
  /// support.
  Future<CreateCampaignResponse> createCampaign(
      {@required String name,
      @required String solutionVersionArn,
      @required int minProvisionedTps}) async {
    return CreateCampaignResponse.fromJson({});
  }

  /// Creates an empty dataset and adds it to the specified dataset group. Use
  /// CreateDatasetImportJob to import your training data to a dataset.
  ///
  /// There are three types of datasets:
  ///
  /// *   Interactions
  ///
  /// *   Items
  ///
  /// *   Users
  ///
  ///
  /// Each dataset type has an associated schema with required field types. Only
  /// the `Interactions` dataset is required in order to train a model (also
  /// referred to as creating a solution).
  ///
  /// A dataset can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  ///
  ///
  /// To get the status of the dataset, call DescribeDataset.
  ///
  ///  **Related APIs**
  ///
  /// *    CreateDatasetGroup
  ///
  /// *    ListDatasets
  ///
  /// *    DescribeDataset
  ///
  /// *    DeleteDataset
  ///
  /// [name]: The name for the dataset.
  ///
  /// [schemaArn]: The ARN of the schema to associate with the dataset. The
  /// schema defines the dataset fields.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group to
  /// add the dataset to.
  ///
  /// [datasetType]: The type of dataset.
  ///
  /// One of the following (case insensitive) values:
  ///
  /// *   Interactions
  ///
  /// *   Items
  ///
  /// *   Users
  Future<CreateDatasetResponse> createDataset(
      {@required String name,
      @required String schemaArn,
      @required String datasetGroupArn,
      @required String datasetType}) async {
    return CreateDatasetResponse.fromJson({});
  }

  /// Creates an empty dataset group. A dataset group contains related datasets
  /// that supply data for training a model. A dataset group can contain at most
  /// three datasets, one for each type of dataset:
  ///
  /// *   Interactions
  ///
  /// *   Items
  ///
  /// *   Users
  ///
  ///
  /// To train a model (create a solution), a dataset group that contains an
  /// `Interactions` dataset is required. Call CreateDataset to add a dataset to
  /// the group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING
  ///
  ///
  /// To get the status of the dataset group, call DescribeDatasetGroup. If the
  /// status shows as CREATE FAILED, the response includes a `failureReason`
  /// key, which describes why the creation failed.
  ///
  ///  You must wait until the `status` of the dataset group is `ACTIVE` before
  /// adding a dataset to the group.
  ///
  /// You can specify an AWS Key Management Service (KMS) key to encrypt the
  /// datasets in the group. If you specify a KMS key, you must also include an
  /// AWS Identity and Access Management (IAM) role that has permission to
  /// access the key.
  ///
  ///  **APIs that require a dataset group ARN in the request**
  ///
  /// *    CreateDataset
  ///
  /// *    CreateEventTracker
  ///
  /// *    CreateSolution
  ///
  ///
  ///  **Related APIs**
  ///
  /// *    ListDatasetGroups
  ///
  /// *    DescribeDatasetGroup
  ///
  /// *    DeleteDatasetGroup
  ///
  /// [name]: The name for the new dataset group.
  ///
  /// [roleArn]: The ARN of the IAM role that has permissions to access the KMS
  /// key. Supplying an IAM role is only valid when also specifying a KMS key.
  ///
  /// [kmsKeyArn]: The Amazon Resource Name (ARN) of a KMS key used to encrypt
  /// the datasets.
  Future<CreateDatasetGroupResponse> createDatasetGroup(String name,
      {String roleArn, String kmsKeyArn}) async {
    return CreateDatasetGroupResponse.fromJson({});
  }

  /// Creates a job that imports training data from your data source (an Amazon
  /// S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize
  /// to import the training data, you must specify an AWS Identity and Access
  /// Management (IAM) role that has permission to read from the data source.
  ///
  ///  The dataset import job replaces any previous data in the dataset.
  ///
  ///  **Status**
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  ///
  /// To get the status of the import job, call DescribeDatasetImportJob,
  /// providing the Amazon Resource Name (ARN) of the dataset import job. The
  /// dataset import is complete when the status shows as ACTIVE. If the status
  /// shows as CREATE FAILED, the response includes a `failureReason` key, which
  /// describes why the job failed.
  ///
  ///  Importing takes time. You must wait until the status shows as ACTIVE
  /// before training a model using the dataset.
  ///
  ///  **Related APIs**
  ///
  /// *    ListDatasetImportJobs
  ///
  /// *    DescribeDatasetImportJob
  ///
  /// [jobName]: The name for the dataset import job.
  ///
  /// [datasetArn]: The ARN of the dataset that receives the imported data.
  ///
  /// [dataSource]: The Amazon S3 bucket that contains the training data to
  /// import.
  ///
  /// [roleArn]: The ARN of the IAM role that has permissions to read from the
  /// Amazon S3 data source.
  Future<CreateDatasetImportJobResponse> createDatasetImportJob(
      {@required String jobName,
      @required String datasetArn,
      @required DataSource dataSource,
      @required String roleArn}) async {
    return CreateDatasetImportJobResponse.fromJson({});
  }

  /// Creates an event tracker that you use when sending event data to the
  /// specified dataset group using the
  /// [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html)
  /// API.
  ///
  /// When Amazon Personalize creates an event tracker, it also creates an
  /// _event-interactions_ dataset in the dataset group associated with the
  /// event tracker. The event-interactions dataset stores the event data from
  /// the `PutEvents` call. The contents of this dataset are not available to
  /// the user.
  ///
  ///  Only one event tracker can be associated with a dataset group. You will
  /// get an error if you call `CreateEventTracker` using the same dataset group
  /// as an existing event tracker.
  ///
  /// When you send event data you include your tracking ID. The tracking ID
  /// identifies the customer and authorizes the customer to send the data.
  ///
  /// The event tracker can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  ///
  ///
  /// To get the status of the event tracker, call DescribeEventTracker.
  ///
  ///  The event tracker must be in the ACTIVE state before using the tracking
  /// ID.
  ///
  ///  **Related APIs**
  ///
  /// *    ListEventTrackers
  ///
  /// *    DescribeEventTracker
  ///
  /// *    DeleteEventTracker
  ///
  /// [name]: The name for the event tracker.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group
  /// that receives the event data.
  Future<CreateEventTrackerResponse> createEventTracker(
      {@required String name, @required String datasetGroupArn}) async {
    return CreateEventTrackerResponse.fromJson({});
  }

  /// Creates an Amazon Personalize schema from the specified schema string. The
  /// schema you create must be in Avro JSON format.
  ///
  /// Amazon Personalize recognizes three schema variants. Each schema is
  /// associated with a dataset type and has a set of required field and
  /// keywords. You specify a schema when you call CreateDataset.
  ///
  ///  **Related APIs**
  ///
  /// *    ListSchemas
  ///
  /// *    DescribeSchema
  ///
  /// *    DeleteSchema
  ///
  /// [name]: The name for the schema.
  ///
  /// [schema]: A schema in Avro JSON format.
  Future<CreateSchemaResponse> createSchema(
      {@required String name, @required String schema}) async {
    return CreateSchemaResponse.fromJson({});
  }

  /// Creates the configuration for training a model. A trained model is known
  /// as a solution. After the configuration is created, you train the model
  /// (create a solution) by calling the CreateSolutionVersion operation. Every
  /// time you call `CreateSolutionVersion`, a new version of the solution is
  /// created.
  ///
  /// After creating a solution version, you check its accuracy by calling
  /// GetSolutionMetrics. When you are satisfied with the version, you deploy it
  /// using CreateCampaign. The campaign provides recommendations to a client
  /// through the
  /// [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  /// API.
  ///
  /// To train a model, Amazon Personalize requires training data and a recipe.
  /// The training data comes from the dataset group that you provide in the
  /// request. A recipe specifies the training algorithm and a feature
  /// transformation. You can specify one of the predefined recipes provided by
  /// Amazon Personalize. Alternatively, you can specify `performAutoML` and
  /// Amazon Personalize will analyze your data and select the optimum
  /// USER_PERSONALIZATION recipe for you.
  ///
  ///  **Status**
  ///
  /// A solution can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  ///
  ///
  /// To get the status of the solution, call DescribeSolution. Wait until the
  /// status shows as ACTIVE before calling `CreateSolutionVersion`.
  ///
  ///  **Related APIs**
  ///
  /// *    ListSolutions
  ///
  /// *    CreateSolutionVersion
  ///
  /// *    DescribeSolution
  ///
  /// *    DeleteSolution
  ///
  ///
  /// *    ListSolutionVersions
  ///
  /// *    DescribeSolutionVersion
  ///
  /// [name]: The name for the solution.
  ///
  /// [performHpo]: Whether to perform hyperparameter optimization (HPO) on the
  /// specified or selected recipe. The default is `false`.
  ///
  /// When performing AutoML, this parameter is always `true` and you should not
  /// set it to `false`.
  ///
  /// [performAutoML]: Whether to perform automated machine learning (AutoML).
  /// The default is `false`. For this case, you must specify `recipeArn`.
  ///
  /// When set to `true`, Amazon Personalize analyzes your training data and
  /// selects the optimal USER_PERSONALIZATION recipe and hyperparameters. In
  /// this case, you must omit `recipeArn`. Amazon Personalize determines the
  /// optimal recipe by running tests with different values for the
  /// hyperparameters. AutoML lengthens the training process as compared to
  /// selecting a specific recipe.
  ///
  /// [recipeArn]: The ARN of the recipe to use for model training. Only
  /// specified when `performAutoML` is false.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group
  /// that provides the training data.
  ///
  /// [eventType]: When your have multiple event types (using an `EVENT_TYPE`
  /// schema field), this parameter specifies which event type (for example,
  /// 'click' or 'like') is used for training the model.
  ///
  /// [solutionConfig]: The configuration to use with the solution. When
  /// `performAutoML` is set to true, Amazon Personalize only evaluates the
  /// `autoMLConfig` section of the solution configuration.
  Future<CreateSolutionResponse> createSolution(
      {@required String name,
      bool performHpo,
      bool performAutoML,
      String recipeArn,
      @required String datasetGroupArn,
      String eventType,
      SolutionConfig solutionConfig}) async {
    return CreateSolutionResponse.fromJson({});
  }

  /// Trains or retrains an active solution. A solution is created using the
  /// CreateSolution operation and must be in the ACTIVE state before calling
  /// `CreateSolutionVersion`. A new version of the solution is created every
  /// time you call this operation.
  ///
  ///  **Status**
  ///
  /// A solution version can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  ///
  /// To get the status of the version, call DescribeSolutionVersion. Wait until
  /// the status shows as ACTIVE before calling `CreateCampaign`.
  ///
  /// If the status shows as CREATE FAILED, the response includes a
  /// `failureReason` key, which describes why the job failed.
  ///
  ///  **Related APIs**
  ///
  /// *    ListSolutionVersions
  ///
  /// *    DescribeSolutionVersion
  ///
  ///
  /// *    ListSolutions
  ///
  /// *    CreateSolution
  ///
  /// *    DescribeSolution
  ///
  /// *    DeleteSolution
  ///
  /// [solutionArn]: The Amazon Resource Name (ARN) of the solution containing
  /// the training configuration information.
  Future<CreateSolutionVersionResponse> createSolutionVersion(
      String solutionArn) async {
    return CreateSolutionVersionResponse.fromJson({});
  }

  /// Removes a campaign by deleting the solution deployment. The solution that
  /// the campaign is based on is not deleted and can be redeployed when needed.
  /// A deleted campaign can no longer be specified in a
  /// [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  /// request. For more information on campaigns, see CreateCampaign.
  ///
  /// [campaignArn]: The Amazon Resource Name (ARN) of the campaign to delete.
  Future<void> deleteCampaign(String campaignArn) async {}

  /// Deletes a dataset. You can't delete a dataset if an associated
  /// `DatasetImportJob` or `SolutionVersion` is in the CREATE PENDING or IN
  /// PROGRESS state. For more information on datasets, see CreateDataset.
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the dataset to delete.
  Future<void> deleteDataset(String datasetArn) async {}

  /// Deletes a dataset group. Before you delete a dataset group, you must
  /// delete the following:
  ///
  /// *   All associated event trackers.
  ///
  /// *   All associated solutions.
  ///
  /// *   All datasets in the dataset group.
  ///
  /// [datasetGroupArn]: The ARN of the dataset group to delete.
  Future<void> deleteDatasetGroup(String datasetGroupArn) async {}

  /// Deletes the event tracker. Does not delete the event-interactions dataset
  /// from the associated dataset group. For more information on event trackers,
  /// see CreateEventTracker.
  ///
  /// [eventTrackerArn]: The Amazon Resource Name (ARN) of the event tracker to
  /// delete.
  Future<void> deleteEventTracker(String eventTrackerArn) async {}

  /// Deletes a schema. Before deleting a schema, you must delete all datasets
  /// referencing the schema. For more information on schemas, see CreateSchema.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) of the schema to delete.
  Future<void> deleteSchema(String schemaArn) async {}

  /// Deletes all versions of a solution and the `Solution` object itself.
  /// Before deleting a solution, you must delete all campaigns based on the
  /// solution. To determine what campaigns are using the solution, call
  /// ListCampaigns and supply the Amazon Resource Name (ARN) of the solution.
  /// You can't delete a solution if an associated `SolutionVersion` is in the
  /// CREATE PENDING or IN PROGRESS state. For more information on solutions,
  /// see CreateSolution.
  ///
  /// [solutionArn]: The ARN of the solution to delete.
  Future<void> deleteSolution(String solutionArn) async {}

  /// Describes the given algorithm.
  ///
  /// [algorithmArn]: The Amazon Resource Name (ARN) of the algorithm to
  /// describe.
  Future<DescribeAlgorithmResponse> describeAlgorithm(
      String algorithmArn) async {
    return DescribeAlgorithmResponse.fromJson({});
  }

  /// Describes the given campaign, including its status.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  ///
  ///
  /// When the `status` is `CREATE FAILED`, the response includes the
  /// `failureReason` key, which describes why.
  ///
  /// For more information on campaigns, see CreateCampaign.
  ///
  /// [campaignArn]: The Amazon Resource Name (ARN) of the campaign.
  Future<DescribeCampaignResponse> describeCampaign(String campaignArn) async {
    return DescribeCampaignResponse.fromJson({});
  }

  /// Describes the given dataset. For more information on datasets, see
  /// CreateDataset.
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the dataset to describe.
  Future<DescribeDatasetResponse> describeDataset(String datasetArn) async {
    return DescribeDatasetResponse.fromJson({});
  }

  /// Describes the given dataset group. For more information on dataset groups,
  /// see CreateDatasetGroup.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group to
  /// describe.
  Future<DescribeDatasetGroupResponse> describeDatasetGroup(
      String datasetGroupArn) async {
    return DescribeDatasetGroupResponse.fromJson({});
  }

  /// Describes the dataset import job created by CreateDatasetImportJob,
  /// including the import job status.
  ///
  /// [datasetImportJobArn]: The Amazon Resource Name (ARN) of the dataset
  /// import job to describe.
  Future<DescribeDatasetImportJobResponse> describeDatasetImportJob(
      String datasetImportJobArn) async {
    return DescribeDatasetImportJobResponse.fromJson({});
  }

  /// Describes an event tracker. The response includes the `trackingId` and
  /// `status` of the event tracker. For more information on event trackers, see
  /// CreateEventTracker.
  ///
  /// [eventTrackerArn]: The Amazon Resource Name (ARN) of the event tracker to
  /// describe.
  Future<DescribeEventTrackerResponse> describeEventTracker(
      String eventTrackerArn) async {
    return DescribeEventTrackerResponse.fromJson({});
  }

  /// Describes the given feature transformation.
  ///
  /// [featureTransformationArn]: The Amazon Resource Name (ARN) of the feature
  /// transformation to describe.
  Future<DescribeFeatureTransformationResponse> describeFeatureTransformation(
      String featureTransformationArn) async {
    return DescribeFeatureTransformationResponse.fromJson({});
  }

  /// Describes a recipe.
  ///
  /// A recipe contains three items:
  ///
  /// *   An algorithm that trains a model.
  ///
  /// *   Hyperparameters that govern the training.
  ///
  /// *   Feature transformation information for modifying the input data before
  /// training.
  ///
  ///
  /// Amazon Personalize provides a set of predefined recipes. You specify a
  /// recipe when you create a solution with the CreateSolution API.
  /// `CreateSolution` trains a model by using the algorithm in the specified
  /// recipe and a training dataset. The solution, when deployed as a campaign,
  /// can provide recommendations using the
  /// [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  /// API.
  ///
  /// [recipeArn]: The Amazon Resource Name (ARN) of the recipe to describe.
  Future<DescribeRecipeResponse> describeRecipe(String recipeArn) async {
    return DescribeRecipeResponse.fromJson({});
  }

  /// Describes a schema. For more information on schemas, see CreateSchema.
  ///
  /// [schemaArn]: The Amazon Resource Name (ARN) of the schema to retrieve.
  Future<DescribeSchemaResponse> describeSchema(String schemaArn) async {
    return DescribeSchemaResponse.fromJson({});
  }

  /// Describes a solution. For more information on solutions, see
  /// CreateSolution.
  ///
  /// [solutionArn]: The Amazon Resource Name (ARN) of the solution to describe.
  Future<DescribeSolutionResponse> describeSolution(String solutionArn) async {
    return DescribeSolutionResponse.fromJson({});
  }

  /// Describes a specific version of a solution. For more information on
  /// solutions, see CreateSolution.
  ///
  /// [solutionVersionArn]: The Amazon Resource Name (ARN) of the solution
  /// version.
  Future<DescribeSolutionVersionResponse> describeSolutionVersion(
      String solutionVersionArn) async {
    return DescribeSolutionVersionResponse.fromJson({});
  }

  /// Gets the metrics for the specified solution version.
  ///
  /// [solutionVersionArn]: The Amazon Resource Name (ARN) of the solution
  /// version for which to get metrics.
  Future<GetSolutionMetricsResponse> getSolutionMetrics(
      String solutionVersionArn) async {
    return GetSolutionMetricsResponse.fromJson({});
  }

  /// Returns a list of campaigns that use the given solution. When a solution
  /// is not specified, all the campaigns associated with the account are
  /// listed. The response provides the properties for each campaign, including
  /// the Amazon Resource Name (ARN). For more information on campaigns, see
  /// CreateCampaign.
  ///
  /// [solutionArn]: The Amazon Resource Name (ARN) of the solution to list the
  /// campaigns for. When a solution is not specified, all the campaigns
  /// associated with the account are listed.
  ///
  /// [nextToken]: A token returned from the previous call to `ListCampaigns`
  /// for getting the next set of campaigns (if they exist).
  ///
  /// [maxResults]: The maximum number of campaigns to return.
  Future<ListCampaignsResponse> listCampaigns(
      {String solutionArn, String nextToken, int maxResults}) async {
    return ListCampaignsResponse.fromJson({});
  }

  /// Returns a list of dataset groups. The response provides the properties for
  /// each dataset group, including the Amazon Resource Name (ARN). For more
  /// information on dataset groups, see CreateDatasetGroup.
  ///
  /// [nextToken]: A token returned from the previous call to
  /// `ListDatasetGroups` for getting the next set of dataset groups (if they
  /// exist).
  ///
  /// [maxResults]: The maximum number of dataset groups to return.
  Future<ListDatasetGroupsResponse> listDatasetGroups(
      {String nextToken, int maxResults}) async {
    return ListDatasetGroupsResponse.fromJson({});
  }

  /// Returns a list of dataset import jobs that use the given dataset. When a
  /// dataset is not specified, all the dataset import jobs associated with the
  /// account are listed. The response provides the properties for each dataset
  /// import job, including the Amazon Resource Name (ARN). For more information
  /// on dataset import jobs, see CreateDatasetImportJob. For more information
  /// on datasets, see CreateDataset.
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the dataset to list the
  /// dataset import jobs for.
  ///
  /// [nextToken]: A token returned from the previous call to
  /// `ListDatasetImportJobs` for getting the next set of dataset import jobs
  /// (if they exist).
  ///
  /// [maxResults]: The maximum number of dataset import jobs to return.
  Future<ListDatasetImportJobsResponse> listDatasetImportJobs(
      {String datasetArn, String nextToken, int maxResults}) async {
    return ListDatasetImportJobsResponse.fromJson({});
  }

  /// Returns the list of datasets contained in the given dataset group. The
  /// response provides the properties for each dataset, including the Amazon
  /// Resource Name (ARN). For more information on datasets, see CreateDataset.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group
  /// that contains the datasets to list.
  ///
  /// [nextToken]: A token returned from the previous call to
  /// `ListDatasetImportJobs` for getting the next set of dataset import jobs
  /// (if they exist).
  ///
  /// [maxResults]: The maximum number of datasets to return.
  Future<ListDatasetsResponse> listDatasets(
      {String datasetGroupArn, String nextToken, int maxResults}) async {
    return ListDatasetsResponse.fromJson({});
  }

  /// Returns the list of event trackers associated with the account. The
  /// response provides the properties for each event tracker, including the
  /// Amazon Resource Name (ARN) and tracking ID. For more information on event
  /// trackers, see CreateEventTracker.
  ///
  /// [datasetGroupArn]: The ARN of a dataset group used to filter the response.
  ///
  /// [nextToken]: A token returned from the previous call to
  /// `ListEventTrackers` for getting the next set of event trackers (if they
  /// exist).
  ///
  /// [maxResults]: The maximum number of event trackers to return.
  Future<ListEventTrackersResponse> listEventTrackers(
      {String datasetGroupArn, String nextToken, int maxResults}) async {
    return ListEventTrackersResponse.fromJson({});
  }

  /// Returns a list of available recipes. The response provides the properties
  /// for each recipe, including the recipe's Amazon Resource Name (ARN).
  ///
  /// [recipeProvider]: The default is `SERVICE`.
  ///
  /// [nextToken]: A token returned from the previous call to `ListRecipes` for
  /// getting the next set of recipes (if they exist).
  ///
  /// [maxResults]: The maximum number of recipes to return.
  Future<ListRecipesResponse> listRecipes(
      {String recipeProvider, String nextToken, int maxResults}) async {
    return ListRecipesResponse.fromJson({});
  }

  /// Returns the list of schemas associated with the account. The response
  /// provides the properties for each schema, including the Amazon Resource
  /// Name (ARN). For more information on schemas, see CreateSchema.
  ///
  /// [nextToken]: A token returned from the previous call to `ListSchemas` for
  /// getting the next set of schemas (if they exist).
  ///
  /// [maxResults]: The maximum number of schemas to return.
  Future<ListSchemasResponse> listSchemas(
      {String nextToken, int maxResults}) async {
    return ListSchemasResponse.fromJson({});
  }

  /// Returns a list of solution versions for the given solution. When a
  /// solution is not specified, all the solution versions associated with the
  /// account are listed. The response provides the properties for each solution
  /// version, including the Amazon Resource Name (ARN). For more information on
  /// solutions, see CreateSolution.
  ///
  /// [solutionArn]: The Amazon Resource Name (ARN) of the solution.
  ///
  /// [nextToken]: A token returned from the previous call to
  /// `ListSolutionVersions` for getting the next set of solution versions (if
  /// they exist).
  ///
  /// [maxResults]: The maximum number of solution versions to return.
  Future<ListSolutionVersionsResponse> listSolutionVersions(
      {String solutionArn, String nextToken, int maxResults}) async {
    return ListSolutionVersionsResponse.fromJson({});
  }

  /// Returns a list of solutions that use the given dataset group. When a
  /// dataset group is not specified, all the solutions associated with the
  /// account are listed. The response provides the properties for each
  /// solution, including the Amazon Resource Name (ARN). For more information
  /// on solutions, see CreateSolution.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group.
  ///
  /// [nextToken]: A token returned from the previous call to `ListSolutions`
  /// for getting the next set of solutions (if they exist).
  ///
  /// [maxResults]: The maximum number of solutions to return.
  Future<ListSolutionsResponse> listSolutions(
      {String datasetGroupArn, String nextToken, int maxResults}) async {
    return ListSolutionsResponse.fromJson({});
  }

  /// Updates a campaign by either deploying a new solution or changing the
  /// value of the campaign's `minProvisionedTPS` parameter.
  ///
  /// To update a campaign, the campaign status must be ACTIVE or CREATE FAILED.
  /// Check the campaign status using the DescribeCampaign API.
  ///
  ///  You must wait until the `status` of the updated campaign is `ACTIVE`
  /// before asking the campaign for recommendations.
  ///
  /// For more information on campaigns, see CreateCampaign.
  ///
  /// [campaignArn]: The Amazon Resource Name (ARN) of the campaign.
  ///
  /// [solutionVersionArn]: The ARN of a new solution version to deploy.
  ///
  /// [minProvisionedTps]: Specifies the requested minimum provisioned
  /// transactions (recommendations) per second that Amazon Personalize will
  /// support.
  Future<UpdateCampaignResponse> updateCampaign(String campaignArn,
      {String solutionVersionArn, int minProvisionedTps}) async {
    return UpdateCampaignResponse.fromJson({});
  }
}

/// Describes a custom algorithm.
class Algorithm {
  /// The name of the algorithm.
  final String name;

  /// The Amazon Resource Name (ARN) of the algorithm.
  final String algorithmArn;

  /// The URI of the Docker container for the algorithm image.
  final AlgorithmImage algorithmImage;

  /// Specifies the default hyperparameters.
  final Map<String, String> defaultHyperParameters;

  /// Specifies the default hyperparameters, their ranges, and whether they are
  /// tunable. A tunable hyperparameter can have its value determined during
  /// hyperparameter optimization (HPO).
  final DefaultHyperParameterRanges defaultHyperParameterRanges;

  /// Specifies the default maximum number of training jobs and parallel
  /// training jobs.
  final Map<String, String> defaultResourceConfig;

  /// The training input mode.
  final String trainingInputMode;

  /// The Amazon Resource Name (ARN) of the role.
  final String roleArn;

  /// The date and time (in Unix time) that the algorithm was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the algorithm was last updated.
  final DateTime lastUpdatedDateTime;

  Algorithm({
    this.name,
    this.algorithmArn,
    this.algorithmImage,
    this.defaultHyperParameters,
    this.defaultHyperParameterRanges,
    this.defaultResourceConfig,
    this.trainingInputMode,
    this.roleArn,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static Algorithm fromJson(Map<String, dynamic> json) => Algorithm();
}

/// Describes an algorithm image.
class AlgorithmImage {
  /// The name of the algorithm image.
  final String name;

  /// The URI of the Docker container for the algorithm image.
  final String dockerUri;

  AlgorithmImage({
    this.name,
    @required this.dockerUri,
  });
  static AlgorithmImage fromJson(Map<String, dynamic> json) => AlgorithmImage();
}

/// When the solution performs AutoML (`performAutoML` is true in
/// CreateSolution), Amazon Personalize determines which recipe, from the
/// specified list, optimizes the given metric. Amazon Personalize then uses
/// that recipe for the solution.
class AutoMLConfig {
  /// The metric to optimize.
  final String metricName;

  /// The list of candidate recipes.
  final List<String> recipeList;

  AutoMLConfig({
    this.metricName,
    this.recipeList,
  });
  static AutoMLConfig fromJson(Map<String, dynamic> json) => AutoMLConfig();
}

/// When the solution performs AutoML (`performAutoML` is true in
/// CreateSolution), specifies the recipe that best optimized the specified
/// metric.
class AutoMLResult {
  /// The Amazon Resource Name (ARN) of the best recipe.
  final String bestRecipeArn;

  AutoMLResult({
    this.bestRecipeArn,
  });
  static AutoMLResult fromJson(Map<String, dynamic> json) => AutoMLResult();
}

/// Describes a deployed solution version, otherwise known as a campaign. For
/// more information on campaigns, see CreateCampaign.
class Campaign {
  /// The name of the campaign.
  final String name;

  /// The Amazon Resource Name (ARN) of the campaign.
  final String campaignArn;

  /// The Amazon Resource Name (ARN) of a specific version of the solution.
  final String solutionVersionArn;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second.
  final int minProvisionedTps;

  /// The status of the campaign.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// If a campaign fails, the reason behind the failure.
  final String failureReason;

  /// The date and time (in Unix format) that the campaign was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix format) that the campaign was last updated.
  final DateTime lastUpdatedDateTime;

  final CampaignUpdateSummary latestCampaignUpdate;

  Campaign({
    this.name,
    this.campaignArn,
    this.solutionVersionArn,
    this.minProvisionedTps,
    this.status,
    this.failureReason,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.latestCampaignUpdate,
  });
  static Campaign fromJson(Map<String, dynamic> json) => Campaign();
}

/// Provides a summary of the properties of a campaign. For a complete listing,
/// call the DescribeCampaign API.
class CampaignSummary {
  /// The name of the campaign.
  final String name;

  /// The Amazon Resource Name (ARN) of the campaign.
  final String campaignArn;

  /// The status of the campaign.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The date and time (in Unix time) that the campaign was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the campaign was last updated.
  final DateTime lastUpdatedDateTime;

  /// If a campaign fails, the reason behind the failure.
  final String failureReason;

  CampaignSummary({
    this.name,
    this.campaignArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static CampaignSummary fromJson(Map<String, dynamic> json) =>
      CampaignSummary();
}

/// Provides a summary of the properties of a campaign update. For a complete
/// listing, call the DescribeCampaign API.
class CampaignUpdateSummary {
  /// The Amazon Resource Name (ARN) of the deployed solution version.
  final String solutionVersionArn;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support.
  final int minProvisionedTps;

  /// The status of the campaign update.
  ///
  /// A campaign update can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// If a campaign update fails, the reason behind the failure.
  final String failureReason;

  /// The date and time (in Unix time) that the campaign update was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the campaign update was last
  /// updated.
  final DateTime lastUpdatedDateTime;

  CampaignUpdateSummary({
    this.solutionVersionArn,
    this.minProvisionedTps,
    this.status,
    this.failureReason,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static CampaignUpdateSummary fromJson(Map<String, dynamic> json) =>
      CampaignUpdateSummary();
}

/// Provides the name and range of a categorical hyperparameter.
class CategoricalHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// A list of the categories for the hyperparameter.
  final List<String> values;

  CategoricalHyperParameterRange({
    this.name,
    this.values,
  });
  static CategoricalHyperParameterRange fromJson(Map<String, dynamic> json) =>
      CategoricalHyperParameterRange();
}

/// Provides the name and range of a continuous hyperparameter.
class ContinuousHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// The minimum allowable value for the hyperparameter.
  final double minValue;

  /// The maximum allowable value for the hyperparameter.
  final double maxValue;

  ContinuousHyperParameterRange({
    this.name,
    this.minValue,
    this.maxValue,
  });
  static ContinuousHyperParameterRange fromJson(Map<String, dynamic> json) =>
      ContinuousHyperParameterRange();
}

class CreateCampaignResponse {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String campaignArn;

  CreateCampaignResponse({
    this.campaignArn,
  });
  static CreateCampaignResponse fromJson(Map<String, dynamic> json) =>
      CreateCampaignResponse();
}

class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the new dataset group.
  final String datasetGroupArn;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
  });
  static CreateDatasetGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetGroupResponse();
}

class CreateDatasetImportJobResponse {
  /// The ARN of the dataset import job.
  final String datasetImportJobArn;

  CreateDatasetImportJobResponse({
    this.datasetImportJobArn,
  });
  static CreateDatasetImportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetImportJobResponse();
}

class CreateDatasetResponse {
  /// The ARN of the dataset.
  final String datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });
  static CreateDatasetResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetResponse();
}

class CreateEventTrackerResponse {
  /// The ARN of the event tracker.
  final String eventTrackerArn;

  /// The ID of the event tracker. Include this ID in requests to the
  /// [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html)
  /// API.
  final String trackingId;

  CreateEventTrackerResponse({
    this.eventTrackerArn,
    this.trackingId,
  });
  static CreateEventTrackerResponse fromJson(Map<String, dynamic> json) =>
      CreateEventTrackerResponse();
}

class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) of the created schema.
  final String schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });
  static CreateSchemaResponse fromJson(Map<String, dynamic> json) =>
      CreateSchemaResponse();
}

class CreateSolutionResponse {
  /// The ARN of the solution.
  final String solutionArn;

  CreateSolutionResponse({
    this.solutionArn,
  });
  static CreateSolutionResponse fromJson(Map<String, dynamic> json) =>
      CreateSolutionResponse();
}

class CreateSolutionVersionResponse {
  /// The ARN of the new solution version.
  final String solutionVersionArn;

  CreateSolutionVersionResponse({
    this.solutionVersionArn,
  });
  static CreateSolutionVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateSolutionVersionResponse();
}

/// Describes the data source that contains the data to upload to a dataset.
class DataSource {
  /// The path to the Amazon S3 bucket where the data that you want to upload to
  /// your dataset is stored. For example:
  ///
  ///  `s3://bucket-name/training-data.csv`
  final String dataLocation;

  DataSource({
    this.dataLocation,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource();
}

/// Provides metadata for a dataset.
class Dataset {
  /// The name of the dataset.
  final String name;

  /// The Amazon Resource Name (ARN) of the dataset that you want metadata for.
  final String datasetArn;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// One of the following values:
  ///
  /// *   Interactions
  ///
  /// *   Items
  ///
  /// *   Users
  final String datasetType;

  /// The ARN of the associated schema.
  final String schemaArn;

  /// The status of the dataset.
  ///
  /// A dataset can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The creation date and time (in Unix time) of the dataset.
  final DateTime creationDateTime;

  /// A time stamp that shows when the dataset was updated.
  final DateTime lastUpdatedDateTime;

  Dataset({
    this.name,
    this.datasetArn,
    this.datasetGroupArn,
    this.datasetType,
    this.schemaArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static Dataset fromJson(Map<String, dynamic> json) => Dataset();
}

/// A dataset group is a collection of related datasets (Interactions, User, and
/// Item). You create a dataset group by calling CreateDatasetGroup. You then
/// create a dataset and add it to a dataset group by calling CreateDataset. The
/// dataset group is used to create and train a solution by calling
/// CreateSolution. A dataset group can contain only one of each type of
/// dataset.
///
/// You can specify an AWS Key Management Service (KMS) key to encrypt the
/// datasets in the group.
class DatasetGroup {
  /// The name of the dataset group.
  final String name;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// The current status of the dataset group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING
  final String status;

  /// The ARN of the IAM role that has permissions to create the dataset group.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the
  /// datasets.
  final String kmsKeyArn;

  /// The creation date and time (in Unix time) of the dataset group.
  final DateTime creationDateTime;

  /// The last update date and time (in Unix time) of the dataset group.
  final DateTime lastUpdatedDateTime;

  /// If creating a dataset group fails, provides the reason why.
  final String failureReason;

  DatasetGroup({
    this.name,
    this.datasetGroupArn,
    this.status,
    this.roleArn,
    this.kmsKeyArn,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static DatasetGroup fromJson(Map<String, dynamic> json) => DatasetGroup();
}

/// Provides a summary of the properties of a dataset group. For a complete
/// listing, call the DescribeDatasetGroup API.
class DatasetGroupSummary {
  /// The name of the dataset group.
  final String name;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// The status of the dataset group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING
  final String status;

  /// The date and time (in Unix time) that the dataset group was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the dataset group was last updated.
  final DateTime lastUpdatedDateTime;

  /// If creating a dataset group fails, the reason behind the failure.
  final String failureReason;

  DatasetGroupSummary({
    this.name,
    this.datasetGroupArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static DatasetGroupSummary fromJson(Map<String, dynamic> json) =>
      DatasetGroupSummary();
}

/// Describes a job that imports training data from a data source (Amazon S3
/// bucket) to an Amazon Personalize dataset. For more information, see
/// CreateDatasetImportJob.
///
/// A dataset import job can be in one of the following states:
///
/// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
class DatasetImportJob {
  /// The name of the import job.
  final String jobName;

  /// The ARN of the dataset import job.
  final String datasetImportJobArn;

  /// The Amazon Resource Name (ARN) of the dataset that receives the imported
  /// data.
  final String datasetArn;

  /// The Amazon S3 bucket that contains the training data to import.
  final DataSource dataSource;

  /// The ARN of the AWS Identity and Access Management (IAM) role that has
  /// permissions to read from the Amazon S3 data source.
  final String roleArn;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  final String status;

  /// The creation date and time (in Unix time) of the dataset import job.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) the dataset was last updated.
  final DateTime lastUpdatedDateTime;

  /// If a dataset import job fails, provides the reason why.
  final String failureReason;

  DatasetImportJob({
    this.jobName,
    this.datasetImportJobArn,
    this.datasetArn,
    this.dataSource,
    this.roleArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static DatasetImportJob fromJson(Map<String, dynamic> json) =>
      DatasetImportJob();
}

/// Provides a summary of the properties of a dataset import job. For a complete
/// listing, call the DescribeDatasetImportJob API.
class DatasetImportJobSummary {
  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String datasetImportJobArn;

  /// The name of the dataset import job.
  final String jobName;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  final String status;

  /// The date and time (in Unix time) that the dataset import job was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the dataset was last updated.
  final DateTime lastUpdatedDateTime;

  /// If a dataset import job fails, the reason behind the failure.
  final String failureReason;

  DatasetImportJobSummary({
    this.datasetImportJobArn,
    this.jobName,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static DatasetImportJobSummary fromJson(Map<String, dynamic> json) =>
      DatasetImportJobSummary();
}

/// Describes the schema for a dataset. For more information on schemas, see
/// CreateSchema.
class DatasetSchema {
  /// The name of the schema.
  final String name;

  /// The Amazon Resource Name (ARN) of the schema.
  final String schemaArn;

  /// The schema.
  final String schema;

  /// The date and time (in Unix time) that the schema was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  final DateTime lastUpdatedDateTime;

  DatasetSchema({
    this.name,
    this.schemaArn,
    this.schema,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static DatasetSchema fromJson(Map<String, dynamic> json) => DatasetSchema();
}

/// Provides a summary of the properties of a dataset schema. For a complete
/// listing, call the DescribeSchema API.
class DatasetSchemaSummary {
  /// The name of the schema.
  final String name;

  /// The Amazon Resource Name (ARN) of the schema.
  final String schemaArn;

  /// The date and time (in Unix time) that the schema was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  final DateTime lastUpdatedDateTime;

  DatasetSchemaSummary({
    this.name,
    this.schemaArn,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static DatasetSchemaSummary fromJson(Map<String, dynamic> json) =>
      DatasetSchemaSummary();
}

/// Provides a summary of the properties of a dataset. For a complete listing,
/// call the DescribeDataset API.
class DatasetSummary {
  /// The name of the dataset.
  final String name;

  /// The Amazon Resource Name (ARN) of the dataset.
  final String datasetArn;

  /// The dataset type. One of the following values:
  ///
  /// *   Interactions
  ///
  /// *   Items
  ///
  /// *   Users
  ///
  /// *   Event-Interactions
  final String datasetType;

  /// The status of the dataset.
  ///
  /// A dataset can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The date and time (in Unix time) that the dataset was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the dataset was last updated.
  final DateTime lastUpdatedDateTime;

  DatasetSummary({
    this.name,
    this.datasetArn,
    this.datasetType,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static DatasetSummary fromJson(Map<String, dynamic> json) => DatasetSummary();
}

/// Provides the name and default range of a categorical hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultCategoricalHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// A list of the categories for the hyperparameter.
  final List<String> values;

  /// Whether the hyperparameter is tunable.
  final bool isTunable;

  DefaultCategoricalHyperParameterRange({
    this.name,
    this.values,
    this.isTunable,
  });
  static DefaultCategoricalHyperParameterRange fromJson(
          Map<String, dynamic> json) =>
      DefaultCategoricalHyperParameterRange();
}

/// Provides the name and default range of a continuous hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultContinuousHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// The minimum allowable value for the hyperparameter.
  final double minValue;

  /// The maximum allowable value for the hyperparameter.
  final double maxValue;

  /// Whether the hyperparameter is tunable.
  final bool isTunable;

  DefaultContinuousHyperParameterRange({
    this.name,
    this.minValue,
    this.maxValue,
    this.isTunable,
  });
  static DefaultContinuousHyperParameterRange fromJson(
          Map<String, dynamic> json) =>
      DefaultContinuousHyperParameterRange();
}

/// Specifies the hyperparameters and their default ranges. Hyperparameters can
/// be categorical, continuous, or integer-valued.
class DefaultHyperParameterRanges {
  /// The integer-valued hyperparameters and their default ranges.
  final List<DefaultIntegerHyperParameterRange> integerHyperParameterRanges;

  /// The continuous hyperparameters and their default ranges.
  final List<DefaultContinuousHyperParameterRange>
      continuousHyperParameterRanges;

  /// The categorical hyperparameters and their default ranges.
  final List<DefaultCategoricalHyperParameterRange>
      categoricalHyperParameterRanges;

  DefaultHyperParameterRanges({
    this.integerHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.categoricalHyperParameterRanges,
  });
  static DefaultHyperParameterRanges fromJson(Map<String, dynamic> json) =>
      DefaultHyperParameterRanges();
}

/// Provides the name and default range of a integer-valued hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultIntegerHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// The minimum allowable value for the hyperparameter.
  final int minValue;

  /// The maximum allowable value for the hyperparameter.
  final int maxValue;

  /// Indicates whether the hyperparameter is tunable.
  final bool isTunable;

  DefaultIntegerHyperParameterRange({
    this.name,
    this.minValue,
    this.maxValue,
    this.isTunable,
  });
  static DefaultIntegerHyperParameterRange fromJson(
          Map<String, dynamic> json) =>
      DefaultIntegerHyperParameterRange();
}

class DescribeAlgorithmResponse {
  /// A listing of the properties of the algorithm.
  final Algorithm algorithm;

  DescribeAlgorithmResponse({
    this.algorithm,
  });
  static DescribeAlgorithmResponse fromJson(Map<String, dynamic> json) =>
      DescribeAlgorithmResponse();
}

class DescribeCampaignResponse {
  /// The properties of the campaign.
  final Campaign campaign;

  DescribeCampaignResponse({
    this.campaign,
  });
  static DescribeCampaignResponse fromJson(Map<String, dynamic> json) =>
      DescribeCampaignResponse();
}

class DescribeDatasetGroupResponse {
  /// A listing of the dataset group's properties.
  final DatasetGroup datasetGroup;

  DescribeDatasetGroupResponse({
    this.datasetGroup,
  });
  static DescribeDatasetGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetGroupResponse();
}

class DescribeDatasetImportJobResponse {
  /// Information about the dataset import job, including the status.
  ///
  /// The status is one of the following values:
  ///
  /// *   CREATE PENDING
  ///
  /// *   CREATE IN_PROGRESS
  ///
  /// *   ACTIVE
  ///
  /// *   CREATE FAILED
  final DatasetImportJob datasetImportJob;

  DescribeDatasetImportJobResponse({
    this.datasetImportJob,
  });
  static DescribeDatasetImportJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetImportJobResponse();
}

class DescribeDatasetResponse {
  /// A listing of the dataset's properties.
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  static DescribeDatasetResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetResponse();
}

class DescribeEventTrackerResponse {
  /// An object that describes the event tracker.
  final EventTracker eventTracker;

  DescribeEventTrackerResponse({
    this.eventTracker,
  });
  static DescribeEventTrackerResponse fromJson(Map<String, dynamic> json) =>
      DescribeEventTrackerResponse();
}

class DescribeFeatureTransformationResponse {
  /// A listing of the FeatureTransformation properties.
  final FeatureTransformation featureTransformation;

  DescribeFeatureTransformationResponse({
    this.featureTransformation,
  });
  static DescribeFeatureTransformationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeFeatureTransformationResponse();
}

class DescribeRecipeResponse {
  /// An object that describes the recipe.
  final Recipe recipe;

  DescribeRecipeResponse({
    this.recipe,
  });
  static DescribeRecipeResponse fromJson(Map<String, dynamic> json) =>
      DescribeRecipeResponse();
}

class DescribeSchemaResponse {
  /// The requested schema.
  final DatasetSchema schema;

  DescribeSchemaResponse({
    this.schema,
  });
  static DescribeSchemaResponse fromJson(Map<String, dynamic> json) =>
      DescribeSchemaResponse();
}

class DescribeSolutionResponse {
  /// An object that describes the solution.
  final Solution solution;

  DescribeSolutionResponse({
    this.solution,
  });
  static DescribeSolutionResponse fromJson(Map<String, dynamic> json) =>
      DescribeSolutionResponse();
}

class DescribeSolutionVersionResponse {
  /// The solution version.
  final SolutionVersion solutionVersion;

  DescribeSolutionVersionResponse({
    this.solutionVersion,
  });
  static DescribeSolutionVersionResponse fromJson(Map<String, dynamic> json) =>
      DescribeSolutionVersionResponse();
}

/// Provides information about an event tracker.
class EventTracker {
  /// The name of the event tracker.
  final String name;

  /// The ARN of the event tracker.
  final String eventTrackerArn;

  /// The Amazon AWS account that owns the event tracker.
  final String accountId;

  /// The ID of the event tracker. Include this ID in requests to the
  /// [PutEvents](https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html)
  /// API.
  final String trackingId;

  /// The Amazon Resource Name (ARN) of the dataset group that receives the
  /// event data.
  final String datasetGroupArn;

  /// The status of the event tracker.
  ///
  /// An event tracker can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The date and time (in Unix format) that the event tracker was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the event tracker was last updated.
  final DateTime lastUpdatedDateTime;

  EventTracker({
    this.name,
    this.eventTrackerArn,
    this.accountId,
    this.trackingId,
    this.datasetGroupArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static EventTracker fromJson(Map<String, dynamic> json) => EventTracker();
}

/// Provides a summary of the properties of an event tracker. For a complete
/// listing, call the DescribeEventTracker API.
class EventTrackerSummary {
  /// The name of the event tracker.
  final String name;

  /// The Amazon Resource Name (ARN) of the event tracker.
  final String eventTrackerArn;

  /// The status of the event tracker.
  ///
  /// An event tracker can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The date and time (in Unix time) that the event tracker was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the event tracker was last updated.
  final DateTime lastUpdatedDateTime;

  EventTrackerSummary({
    this.name,
    this.eventTrackerArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static EventTrackerSummary fromJson(Map<String, dynamic> json) =>
      EventTrackerSummary();
}

/// Provides feature transformation information. Feature transformation is the
/// process of modifying raw input data into a form more suitable for model
/// training.
class FeatureTransformation {
  /// The name of the feature transformation.
  final String name;

  /// The Amazon Resource Name (ARN) of the FeatureTransformation object.
  final String featureTransformationArn;

  /// Provides the default parameters for feature transformation.
  final Map<String, String> defaultParameters;

  /// The creation date and time (in Unix time) of the feature transformation.
  final DateTime creationDateTime;

  /// The last update date and time (in Unix time) of the feature
  /// transformation.
  final DateTime lastUpdatedDateTime;

  /// The status of the feature transformation.
  ///
  /// A feature transformation can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  final String status;

  FeatureTransformation({
    this.name,
    this.featureTransformationArn,
    this.defaultParameters,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.status,
  });
  static FeatureTransformation fromJson(Map<String, dynamic> json) =>
      FeatureTransformation();
}

class GetSolutionMetricsResponse {
  /// The same solution version ARN as specified in the request.
  final String solutionVersionArn;

  /// The metrics for the solution version.
  final Map<String, double> metrics;

  GetSolutionMetricsResponse({
    this.solutionVersionArn,
    this.metrics,
  });
  static GetSolutionMetricsResponse fromJson(Map<String, dynamic> json) =>
      GetSolutionMetricsResponse();
}

/// Describes the properties for hyperparameter optimization (HPO). For use with
/// the bring-your-own-recipe feature. Do not use for Amazon Personalize native
/// recipes.
class HpoConfig {
  /// The metric to optimize during HPO.
  final HpoObjective hpoObjective;

  /// Describes the resource configuration for HPO.
  final HpoResourceConfig hpoResourceConfig;

  /// The hyperparameters and their allowable ranges.
  final HyperParameterRanges algorithmHyperParameterRanges;

  HpoConfig({
    this.hpoObjective,
    this.hpoResourceConfig,
    this.algorithmHyperParameterRanges,
  });
  static HpoConfig fromJson(Map<String, dynamic> json) => HpoConfig();
}

/// The metric to optimize during hyperparameter optimization (HPO).
class HpoObjective {
  /// The data type of the metric.
  final String type;

  /// The name of the metric.
  final String metricName;

  /// A regular expression for finding the metric in the training job logs.
  final String metricRegex;

  HpoObjective({
    this.type,
    this.metricName,
    this.metricRegex,
  });
  static HpoObjective fromJson(Map<String, dynamic> json) => HpoObjective();
}

/// Describes the resource configuration for hyperparameter optimization (HPO).
class HpoResourceConfig {
  /// The maximum number of training jobs.
  final String maxNumberOfTrainingJobs;

  /// The maximum number of parallel training jobs.
  final String maxParallelTrainingJobs;

  HpoResourceConfig({
    this.maxNumberOfTrainingJobs,
    this.maxParallelTrainingJobs,
  });
  static HpoResourceConfig fromJson(Map<String, dynamic> json) =>
      HpoResourceConfig();
}

/// Specifies the hyperparameters and their ranges. Hyperparameters can be
/// categorical, continuous, or integer-valued.
class HyperParameterRanges {
  /// The integer-valued hyperparameters and their ranges.
  final List<IntegerHyperParameterRange> integerHyperParameterRanges;

  /// The continuous hyperparameters and their ranges.
  final List<ContinuousHyperParameterRange> continuousHyperParameterRanges;

  /// The categorical hyperparameters and their ranges.
  final List<CategoricalHyperParameterRange> categoricalHyperParameterRanges;

  HyperParameterRanges({
    this.integerHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.categoricalHyperParameterRanges,
  });
  static HyperParameterRanges fromJson(Map<String, dynamic> json) =>
      HyperParameterRanges();
}

/// Provides the name and range of an integer-valued hyperparameter.
class IntegerHyperParameterRange {
  /// The name of the hyperparameter.
  final String name;

  /// The minimum allowable value for the hyperparameter.
  final int minValue;

  /// The maximum allowable value for the hyperparameter.
  final int maxValue;

  IntegerHyperParameterRange({
    this.name,
    this.minValue,
    this.maxValue,
  });
  static IntegerHyperParameterRange fromJson(Map<String, dynamic> json) =>
      IntegerHyperParameterRange();
}

class ListCampaignsResponse {
  /// A list of the campaigns.
  final List<CampaignSummary> campaigns;

  /// A token for getting the next set of campaigns (if they exist).
  final String nextToken;

  ListCampaignsResponse({
    this.campaigns,
    this.nextToken,
  });
  static ListCampaignsResponse fromJson(Map<String, dynamic> json) =>
      ListCampaignsResponse();
}

class ListDatasetGroupsResponse {
  /// The list of your dataset groups.
  final List<DatasetGroupSummary> datasetGroups;

  /// A token for getting the next set of dataset groups (if they exist).
  final String nextToken;

  ListDatasetGroupsResponse({
    this.datasetGroups,
    this.nextToken,
  });
  static ListDatasetGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetGroupsResponse();
}

class ListDatasetImportJobsResponse {
  /// The list of dataset import jobs.
  final List<DatasetImportJobSummary> datasetImportJobs;

  /// A token for getting the next set of dataset import jobs (if they exist).
  final String nextToken;

  ListDatasetImportJobsResponse({
    this.datasetImportJobs,
    this.nextToken,
  });
  static ListDatasetImportJobsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetImportJobsResponse();
}

class ListDatasetsResponse {
  /// An array of `Dataset` objects. Each object provides metadata information.
  final List<DatasetSummary> datasets;

  /// A token for getting the next set of datasets (if they exist).
  final String nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });
  static ListDatasetsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetsResponse();
}

class ListEventTrackersResponse {
  /// A list of event trackers.
  final List<EventTrackerSummary> eventTrackers;

  /// A token for getting the next set of event trackers (if they exist).
  final String nextToken;

  ListEventTrackersResponse({
    this.eventTrackers,
    this.nextToken,
  });
  static ListEventTrackersResponse fromJson(Map<String, dynamic> json) =>
      ListEventTrackersResponse();
}

class ListRecipesResponse {
  /// The list of available recipes.
  final List<RecipeSummary> recipes;

  /// A token for getting the next set of recipes.
  final String nextToken;

  ListRecipesResponse({
    this.recipes,
    this.nextToken,
  });
  static ListRecipesResponse fromJson(Map<String, dynamic> json) =>
      ListRecipesResponse();
}

class ListSchemasResponse {
  /// A list of schemas.
  final List<DatasetSchemaSummary> schemas;

  /// A token used to get the next set of schemas (if they exist).
  final String nextToken;

  ListSchemasResponse({
    this.schemas,
    this.nextToken,
  });
  static ListSchemasResponse fromJson(Map<String, dynamic> json) =>
      ListSchemasResponse();
}

class ListSolutionVersionsResponse {
  /// A list of solution versions describing the version properties.
  final List<SolutionVersionSummary> solutionVersions;

  /// A token for getting the next set of solution versions (if they exist).
  final String nextToken;

  ListSolutionVersionsResponse({
    this.solutionVersions,
    this.nextToken,
  });
  static ListSolutionVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListSolutionVersionsResponse();
}

class ListSolutionsResponse {
  /// A list of the current solutions.
  final List<SolutionSummary> solutions;

  /// A token for getting the next set of solutions (if they exist).
  final String nextToken;

  ListSolutionsResponse({
    this.solutions,
    this.nextToken,
  });
  static ListSolutionsResponse fromJson(Map<String, dynamic> json) =>
      ListSolutionsResponse();
}

/// Provides information about a recipe. Each recipe provides an algorithm that
/// Amazon Personalize uses in model training when you use the CreateSolution
/// operation.
class Recipe {
  /// The name of the recipe.
  final String name;

  /// The Amazon Resource Name (ARN) of the recipe.
  final String recipeArn;

  /// The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize
  /// uses to train the model.
  final String algorithmArn;

  /// The ARN of the FeatureTransformation object.
  final String featureTransformationArn;

  /// The status of the recipe.
  final String status;

  /// The description of the recipe.
  final String description;

  /// The date and time (in Unix format) that the recipe was created.
  final DateTime creationDateTime;

  /// One of the following values:
  ///
  /// *   PERSONALIZED_RANKING
  ///
  /// *   RELATED_ITEMS
  ///
  /// *   USER_PERSONALIZATION
  final String recipeType;

  /// The date and time (in Unix format) that the recipe was last updated.
  final DateTime lastUpdatedDateTime;

  Recipe({
    this.name,
    this.recipeArn,
    this.algorithmArn,
    this.featureTransformationArn,
    this.status,
    this.description,
    this.creationDateTime,
    this.recipeType,
    this.lastUpdatedDateTime,
  });
  static Recipe fromJson(Map<String, dynamic> json) => Recipe();
}

/// Provides a summary of the properties of a recipe. For a complete listing,
/// call the DescribeRecipe API.
class RecipeSummary {
  /// The name of the recipe.
  final String name;

  /// The Amazon Resource Name (ARN) of the recipe.
  final String recipeArn;

  /// The status of the recipe.
  final String status;

  /// The date and time (in Unix time) that the recipe was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the recipe was last updated.
  final DateTime lastUpdatedDateTime;

  RecipeSummary({
    this.name,
    this.recipeArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static RecipeSummary fromJson(Map<String, dynamic> json) => RecipeSummary();
}

/// An object that provides information about a solution. A solution is a
/// trained model that can be deployed as a campaign.
class Solution {
  /// The name of the solution.
  final String name;

  /// The ARN of the solution.
  final String solutionArn;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is `false`.
  final bool performHpo;

  /// When true, Amazon Personalize performs a search for the best
  /// USER_PERSONALIZATION recipe from the list specified in the solution
  /// configuration (`recipeArn` must not be specified). When false (the
  /// default), Amazon Personalize uses `recipeArn` for training.
  final bool performAutoML;

  /// The ARN of the recipe used to create the solution.
  final String recipeArn;

  /// The Amazon Resource Name (ARN) of the dataset group that provides the
  /// training data.
  final String datasetGroupArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model.
  final String eventType;

  /// Describes the configuration properties for the solution.
  final SolutionConfig solutionConfig;

  /// When `performAutoML` is true, specifies the best recipe found.
  final AutoMLResult autoMLResult;

  /// The status of the solution.
  ///
  /// A solution can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The creation date and time (in Unix time) of the solution.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime lastUpdatedDateTime;

  /// Describes the latest version of the solution, including the status and the
  /// ARN.
  final SolutionVersionSummary latestSolutionVersion;

  Solution({
    this.name,
    this.solutionArn,
    this.performHpo,
    this.performAutoML,
    this.recipeArn,
    this.datasetGroupArn,
    this.eventType,
    this.solutionConfig,
    this.autoMLResult,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.latestSolutionVersion,
  });
  static Solution fromJson(Map<String, dynamic> json) => Solution();
}

/// Describes the configuration properties for the solution.
class SolutionConfig {
  /// Only events with a value greater than or equal to this threshold are used
  /// for training a model.
  final String eventValueThreshold;

  /// Describes the properties for hyperparameter optimization (HPO). For use
  /// with the bring-your-own-recipe feature. Not used with Amazon Personalize
  /// predefined recipes.
  final HpoConfig hpoConfig;

  /// Lists the hyperparameter names and ranges.
  final Map<String, String> algorithmHyperParameters;

  /// Lists the feature transformation parameters.
  final Map<String, String> featureTransformationParameters;

  /// The AutoMLConfig object containing a list of recipes to search when AutoML
  /// is performed.
  final AutoMLConfig autoMLConfig;

  SolutionConfig({
    this.eventValueThreshold,
    this.hpoConfig,
    this.algorithmHyperParameters,
    this.featureTransformationParameters,
    this.autoMLConfig,
  });
  static SolutionConfig fromJson(Map<String, dynamic> json) => SolutionConfig();
}

/// Provides a summary of the properties of a solution. For a complete listing,
/// call the DescribeSolution API.
class SolutionSummary {
  /// The name of the solution.
  final String name;

  /// The Amazon Resource Name (ARN) of the solution.
  final String solutionArn;

  /// The status of the solution.
  ///
  /// A solution can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  ///
  /// *   DELETE PENDING > DELETE IN_PROGRESS
  final String status;

  /// The date and time (in Unix time) that the solution was created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime lastUpdatedDateTime;

  SolutionSummary({
    this.name,
    this.solutionArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static SolutionSummary fromJson(Map<String, dynamic> json) =>
      SolutionSummary();
}

/// An object that provides information about a specific version of a Solution.
class SolutionVersion {
  /// The ARN of the solution version.
  final String solutionVersionArn;

  /// The ARN of the solution.
  final String solutionArn;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is `false`.
  final bool performHpo;

  /// When true, Amazon Personalize performs a search for the most optimal
  /// recipe according to the solution configuration. When false (the default),
  /// Amazon Personalize uses `recipeArn`.
  final bool performAutoML;

  /// The ARN of the recipe used in the solution.
  final String recipeArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model.
  final String eventType;

  /// The Amazon Resource Name (ARN) of the dataset group providing the training
  /// data.
  final String datasetGroupArn;

  /// Describes the configuration properties for the solution.
  final SolutionConfig solutionConfig;

  /// The status of the solution version.
  ///
  /// A solution version can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  final String status;

  /// If training a solution version fails, the reason behind the failure.
  final String failureReason;

  /// The date and time (in Unix time) that this version of the solution was
  /// created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime lastUpdatedDateTime;

  SolutionVersion({
    this.solutionVersionArn,
    this.solutionArn,
    this.performHpo,
    this.performAutoML,
    this.recipeArn,
    this.eventType,
    this.datasetGroupArn,
    this.solutionConfig,
    this.status,
    this.failureReason,
    this.creationDateTime,
    this.lastUpdatedDateTime,
  });
  static SolutionVersion fromJson(Map<String, dynamic> json) =>
      SolutionVersion();
}

/// Provides a summary of the properties of a solution version. For a complete
/// listing, call the DescribeSolutionVersion API.
class SolutionVersionSummary {
  /// The Amazon Resource Name (ARN) of the solution version.
  final String solutionVersionArn;

  /// The status of the solution version.
  ///
  /// A solution version can be in one of the following states:
  ///
  /// *   CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED
  final String status;

  /// The date and time (in Unix time) that this version of a solution was
  /// created.
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the solution version was last
  /// updated.
  final DateTime lastUpdatedDateTime;

  /// If a solution version fails, the reason behind the failure.
  final String failureReason;

  SolutionVersionSummary({
    this.solutionVersionArn,
    this.status,
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.failureReason,
  });
  static SolutionVersionSummary fromJson(Map<String, dynamic> json) =>
      SolutionVersionSummary();
}

class UpdateCampaignResponse {
  /// The same campaign ARN as given in the request.
  final String campaignArn;

  UpdateCampaignResponse({
    this.campaignArn,
  });
  static UpdateCampaignResponse fromJson(Map<String, dynamic> json) =>
      UpdateCampaignResponse();
}
