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
  Future<void> createCampaign(
      {@required String name,
      @required String solutionVersionArn,
      @required int minProvisionedTps}) async {}

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
  Future<void> createDataset(
      {@required String name,
      @required String schemaArn,
      @required String datasetGroupArn,
      @required String datasetType}) async {}

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
  Future<void> createDatasetGroup(String name,
      {String roleArn, String kmsKeyArn}) async {}

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
  Future<void> createDatasetImportJob(
      {@required String jobName,
      @required String datasetArn,
      @required DataSource dataSource,
      @required String roleArn}) async {}

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
  Future<void> createEventTracker(
      {@required String name, @required String datasetGroupArn}) async {}

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
  Future<void> createSchema(
      {@required String name, @required String schema}) async {}

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
  Future<void> createSolution(
      {@required String name,
      bool performHpo,
      bool performAutoML,
      String recipeArn,
      @required String datasetGroupArn,
      String eventType,
      SolutionConfig solutionConfig}) async {}

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
  Future<void> createSolutionVersion(String solutionArn) async {}

  /// Removes a campaign by deleting the solution deployment. The solution that
  /// the campaign is based on is not deleted and can be redeployed when needed.
  /// A deleted campaign can no longer be specified in a
  /// [GetRecommendations](https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html)
  /// request. For more information on campaigns, see CreateCampaign.
  Future<void> deleteCampaign(String campaignArn) async {}

  /// Deletes a dataset. You can't delete a dataset if an associated
  /// `DatasetImportJob` or `SolutionVersion` is in the CREATE PENDING or IN
  /// PROGRESS state. For more information on datasets, see CreateDataset.
  Future<void> deleteDataset(String datasetArn) async {}

  /// Deletes a dataset group. Before you delete a dataset group, you must
  /// delete the following:
  ///
  /// *   All associated event trackers.
  ///
  /// *   All associated solutions.
  ///
  /// *   All datasets in the dataset group.
  Future<void> deleteDatasetGroup(String datasetGroupArn) async {}

  /// Deletes the event tracker. Does not delete the event-interactions dataset
  /// from the associated dataset group. For more information on event trackers,
  /// see CreateEventTracker.
  Future<void> deleteEventTracker(String eventTrackerArn) async {}

  /// Deletes a schema. Before deleting a schema, you must delete all datasets
  /// referencing the schema. For more information on schemas, see CreateSchema.
  Future<void> deleteSchema(String schemaArn) async {}

  /// Deletes all versions of a solution and the `Solution` object itself.
  /// Before deleting a solution, you must delete all campaigns based on the
  /// solution. To determine what campaigns are using the solution, call
  /// ListCampaigns and supply the Amazon Resource Name (ARN) of the solution.
  /// You can't delete a solution if an associated `SolutionVersion` is in the
  /// CREATE PENDING or IN PROGRESS state. For more information on solutions,
  /// see CreateSolution.
  Future<void> deleteSolution(String solutionArn) async {}

  /// Describes the given algorithm.
  Future<void> describeAlgorithm(String algorithmArn) async {}

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
  Future<void> describeCampaign(String campaignArn) async {}

  /// Describes the given dataset. For more information on datasets, see
  /// CreateDataset.
  Future<void> describeDataset(String datasetArn) async {}

  /// Describes the given dataset group. For more information on dataset groups,
  /// see CreateDatasetGroup.
  Future<void> describeDatasetGroup(String datasetGroupArn) async {}

  /// Describes the dataset import job created by CreateDatasetImportJob,
  /// including the import job status.
  Future<void> describeDatasetImportJob(String datasetImportJobArn) async {}

  /// Describes an event tracker. The response includes the `trackingId` and
  /// `status` of the event tracker. For more information on event trackers, see
  /// CreateEventTracker.
  Future<void> describeEventTracker(String eventTrackerArn) async {}

  /// Describes the given feature transformation.
  Future<void> describeFeatureTransformation(
      String featureTransformationArn) async {}

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
  Future<void> describeRecipe(String recipeArn) async {}

  /// Describes a schema. For more information on schemas, see CreateSchema.
  Future<void> describeSchema(String schemaArn) async {}

  /// Describes a solution. For more information on solutions, see
  /// CreateSolution.
  Future<void> describeSolution(String solutionArn) async {}

  /// Describes a specific version of a solution. For more information on
  /// solutions, see CreateSolution.
  Future<void> describeSolutionVersion(String solutionVersionArn) async {}

  /// Gets the metrics for the specified solution version.
  Future<void> getSolutionMetrics(String solutionVersionArn) async {}

  /// Returns a list of campaigns that use the given solution. When a solution
  /// is not specified, all the campaigns associated with the account are
  /// listed. The response provides the properties for each campaign, including
  /// the Amazon Resource Name (ARN). For more information on campaigns, see
  /// CreateCampaign.
  Future<void> listCampaigns(
      {String solutionArn, String nextToken, int maxResults}) async {}

  /// Returns a list of dataset groups. The response provides the properties for
  /// each dataset group, including the Amazon Resource Name (ARN). For more
  /// information on dataset groups, see CreateDatasetGroup.
  Future<void> listDatasetGroups({String nextToken, int maxResults}) async {}

  /// Returns a list of dataset import jobs that use the given dataset. When a
  /// dataset is not specified, all the dataset import jobs associated with the
  /// account are listed. The response provides the properties for each dataset
  /// import job, including the Amazon Resource Name (ARN). For more information
  /// on dataset import jobs, see CreateDatasetImportJob. For more information
  /// on datasets, see CreateDataset.
  Future<void> listDatasetImportJobs(
      {String datasetArn, String nextToken, int maxResults}) async {}

  /// Returns the list of datasets contained in the given dataset group. The
  /// response provides the properties for each dataset, including the Amazon
  /// Resource Name (ARN). For more information on datasets, see CreateDataset.
  Future<void> listDatasets(
      {String datasetGroupArn, String nextToken, int maxResults}) async {}

  /// Returns the list of event trackers associated with the account. The
  /// response provides the properties for each event tracker, including the
  /// Amazon Resource Name (ARN) and tracking ID. For more information on event
  /// trackers, see CreateEventTracker.
  Future<void> listEventTrackers(
      {String datasetGroupArn, String nextToken, int maxResults}) async {}

  /// Returns a list of available recipes. The response provides the properties
  /// for each recipe, including the recipe's Amazon Resource Name (ARN).
  Future<void> listRecipes(
      {String recipeProvider, String nextToken, int maxResults}) async {}

  /// Returns the list of schemas associated with the account. The response
  /// provides the properties for each schema, including the Amazon Resource
  /// Name (ARN). For more information on schemas, see CreateSchema.
  Future<void> listSchemas({String nextToken, int maxResults}) async {}

  /// Returns a list of solution versions for the given solution. When a
  /// solution is not specified, all the solution versions associated with the
  /// account are listed. The response provides the properties for each solution
  /// version, including the Amazon Resource Name (ARN). For more information on
  /// solutions, see CreateSolution.
  Future<void> listSolutionVersions(
      {String solutionArn, String nextToken, int maxResults}) async {}

  /// Returns a list of solutions that use the given dataset group. When a
  /// dataset group is not specified, all the solutions associated with the
  /// account are listed. The response provides the properties for each
  /// solution, including the Amazon Resource Name (ARN). For more information
  /// on solutions, see CreateSolution.
  Future<void> listSolutions(
      {String datasetGroupArn, String nextToken, int maxResults}) async {}

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
  Future<void> updateCampaign(String campaignArn,
      {String solutionVersionArn, int minProvisionedTps}) async {}
}

class Algorithm {}

class AlgorithmImage {}

class AutoMLConfig {}

class AutoMLResult {}

class Campaign {}

class CampaignSummary {}

class CampaignUpdateSummary {}

class CategoricalHyperParameterRange {}

class ContinuousHyperParameterRange {}

class CreateCampaignResponse {}

class CreateDatasetGroupResponse {}

class CreateDatasetImportJobResponse {}

class CreateDatasetResponse {}

class CreateEventTrackerResponse {}

class CreateSchemaResponse {}

class CreateSolutionResponse {}

class CreateSolutionVersionResponse {}

class DataSource {}

class Dataset {}

class DatasetGroup {}

class DatasetGroupSummary {}

class DatasetImportJob {}

class DatasetImportJobSummary {}

class DatasetSchema {}

class DatasetSchemaSummary {}

class DatasetSummary {}

class DefaultCategoricalHyperParameterRange {}

class DefaultContinuousHyperParameterRange {}

class DefaultHyperParameterRanges {}

class DefaultIntegerHyperParameterRange {}

class DescribeAlgorithmResponse {}

class DescribeCampaignResponse {}

class DescribeDatasetGroupResponse {}

class DescribeDatasetImportJobResponse {}

class DescribeDatasetResponse {}

class DescribeEventTrackerResponse {}

class DescribeFeatureTransformationResponse {}

class DescribeRecipeResponse {}

class DescribeSchemaResponse {}

class DescribeSolutionResponse {}

class DescribeSolutionVersionResponse {}

class EventTracker {}

class EventTrackerSummary {}

class FeatureTransformation {}

class GetSolutionMetricsResponse {}

class HpoConfig {}

class HpoObjective {}

class HpoResourceConfig {}

class HyperParameterRanges {}

class IntegerHyperParameterRange {}

class ListCampaignsResponse {}

class ListDatasetGroupsResponse {}

class ListDatasetImportJobsResponse {}

class ListDatasetsResponse {}

class ListEventTrackersResponse {}

class ListRecipesResponse {}

class ListSchemasResponse {}

class ListSolutionVersionsResponse {}

class ListSolutionsResponse {}

class Recipe {}

class RecipeSummary {}

class Solution {}

class SolutionConfig {}

class SolutionSummary {}

class SolutionVersion {}

class SolutionVersionSummary {}

class UpdateCampaignResponse {}
