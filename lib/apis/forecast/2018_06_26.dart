import 'package:meta/meta.dart';

/// Provides APIs for creating and managing Amazon Forecast resources.
class ForecastApi {
  /// Creates an Amazon Forecast dataset. The information about the dataset that
  /// you provide helps Forecast understand how to consume the data for model
  /// training. This includes the following:
  ///
  /// *     _`DataFrequency`_  \- How frequently your historical time-series
  /// data is collected. Amazon Forecast uses this information when training the
  /// model and generating a forecast.
  ///
  /// *     _`Domain`_  and  _`DatasetType`_  \- Each dataset has an associated
  /// dataset domain and a type within the domain. Amazon Forecast provides a
  /// list of predefined domains and types within each domain. For each unique
  /// dataset domain and type within the domain, Amazon Forecast requires your
  /// data to include a minimum set of predefined fields.
  ///
  /// *     _`Schema`_  \- A schema specifies the fields of the dataset,
  /// including the field name and data type.
  ///
  ///
  /// After creating a dataset, you import your training data into the dataset
  /// and add the dataset to a dataset group. You then use the dataset group to
  /// create a predictor. For more information, see howitworks-datasets-groups.
  ///
  /// To get a list of all your datasets, use the ListDatasets operation.
  ///
  ///
  ///
  /// The `Status` of a dataset must be `ACTIVE` before you can import training
  /// data. Use the DescribeDataset operation to get the status.
  Future<void> createDataset(
      {@required String datasetName,
      @required String domain,
      @required String datasetType,
      String dataFrequency,
      @required Schema schema,
      EncryptionConfig encryptionConfig}) async {}

  /// Creates an Amazon Forecast dataset group, which holds a collection of
  /// related datasets. You can add datasets to the dataset group when you
  /// create the dataset group, or you can add datasets later with the
  /// UpdateDatasetGroup operation.
  ///
  /// After creating a dataset group and adding datasets, you use the dataset
  /// group when you create a predictor. For more information, see
  /// howitworks-datasets-groups.
  ///
  /// To get a list of all your datasets groups, use the ListDatasetGroups
  /// operation.
  ///
  ///
  ///
  /// The `Status` of a dataset group must be `ACTIVE` before you can create a
  /// predictor using the dataset group. Use the DescribeDatasetGroup operation
  /// to get the status.
  Future<void> createDatasetGroup(
      {@required String datasetGroupName,
      @required String domain,
      List<String> datasetArns}) async {}

  /// Imports your training data to an Amazon Forecast dataset. You provide the
  /// location of your training data in an Amazon Simple Storage Service (Amazon
  /// S3) bucket and the Amazon Resource Name (ARN) of the dataset that you want
  /// to import the data to.
  ///
  /// You must specify a DataSource object that includes an AWS Identity and
  /// Access Management (IAM) role that Amazon Forecast can assume to access the
  /// data. For more information, see aws-forecast-iam-roles.
  ///
  /// Two properties of the training data are optionally specified:
  ///
  /// *   The delimiter that separates the data fields.
  ///
  ///     The default delimiter is a comma (,), which is the only supported
  /// delimiter in this release.
  ///
  /// *   The format of timestamps.
  ///
  ///     If the format is not specified, Amazon Forecast expects the format to
  /// be "yyyy-MM-dd HH:mm:ss".
  ///
  ///
  /// When Amazon Forecast uploads your training data, it verifies that the data
  /// was collected at the `DataFrequency` specified when the target dataset was
  /// created. For more information, see CreateDataset and
  /// howitworks-datasets-groups. Amazon Forecast also verifies the delimiter
  /// and timestamp format.
  ///
  /// You can use the ListDatasetImportJobs operation to get a list of all your
  /// dataset import jobs, filtered by specified criteria.
  ///
  /// To get a list of all your dataset import jobs, filtered by the specified
  /// criteria, use the ListDatasetGroups operation.
  Future<void> createDatasetImportJob(
      {@required String datasetImportJobName,
      @required String datasetArn,
      @required DataSource dataSource,
      String timestampFormat}) async {}

  /// Creates a forecast for each item in the `TARGET\_TIME\_SERIES` dataset
  /// that was used to train the predictor. This is known as inference. To
  /// retrieve the forecast for a single item at low latency, use the operation.
  /// To export the complete forecast into your Amazon Simple Storage Service
  /// (Amazon S3), use the CreateForecastExportJob operation.
  ///
  /// The range of the forecast is determined by the `ForecastHorizon`,
  /// specified in the CreatePredictor request, multiplied by the
  /// `DataFrequency`, specified in the CreateDataset request. When you query a
  /// forecast, you can request a specific date range within the complete
  /// forecast.
  ///
  /// To get a list of all your forecasts, use the ListForecasts operation.
  ///
  ///  The forecasts generated by Amazon Forecast are in the same timezone as
  /// the dataset that was used to create the predictor.
  ///
  /// For more information, see howitworks-forecast.
  ///
  ///
  ///
  /// The `Status` of the forecast must be `ACTIVE` before you can query or
  /// export the forecast. Use the DescribeForecast operation to get the status.
  Future<void> createForecast(
      {@required String forecastName, @required String predictorArn}) async {}

  /// Exports a forecast created by the CreateForecast operation to your Amazon
  /// Simple Storage Service (Amazon S3) bucket.
  ///
  /// You must specify a DataDestination object that includes an AWS Identity
  /// and Access Management (IAM) role that Amazon Forecast can assume to access
  /// the Amazon S3 bucket. For more information, see aws-forecast-iam-roles.
  ///
  /// For more information, see howitworks-forecast.
  ///
  /// To get a list of all your forecast export jobs, use the
  /// ListForecastExportJobs operation.
  ///
  ///
  ///
  /// The `Status` of the forecast export job must be `ACTIVE` before you can
  /// access the forecast in your Amazon S3 bucket. Use the
  /// DescribeForecastExportJob operation to get the status.
  Future<void> createForecastExportJob(
      {@required String forecastExportJobName,
      @required String forecastArn,
      @required DataDestination destination}) async {}

  /// Creates an Amazon Forecast predictor.
  ///
  /// In the request, you provide a dataset group and either specify an
  /// algorithm or let Amazon Forecast choose the algorithm for you using
  /// AutoML. If you specify an algorithm, you also can override
  /// algorithm-specific hyperparameters.
  ///
  /// Amazon Forecast uses the chosen algorithm to train a model using the
  /// latest version of the datasets in the specified dataset group. The result
  /// is called a predictor. You then generate a forecast using the
  /// CreateForecast operation.
  ///
  /// After training a model, the `CreatePredictor` operation also evaluates it.
  /// To see the evaluation metrics, use the GetAccuracyMetrics operation.
  /// Always review the evaluation metrics before deciding to use the predictor
  /// to generate a forecast.
  ///
  /// Optionally, you can specify a featurization configuration to fill and
  /// aggragate the data fields in the `TARGET\_TIME\_SERIES` dataset to improve
  /// model training. For more information, see FeaturizationConfig.
  ///
  ///  **AutoML**
  ///
  /// If you set `PerformAutoML` to `true`, Amazon Forecast evaluates each
  /// algorithm and chooses the one that minimizes the `objective function`. The
  /// `objective function` is defined as the mean of the weighted p10, p50, and
  /// p90 quantile losses. For more information, see EvaluationResult.
  ///
  /// When AutoML is enabled, the following properties are disallowed:
  ///
  /// *    `AlgorithmArn`
  ///
  /// *    `HPOConfig`
  ///
  /// *    `PerformHPO`
  ///
  /// *    `TrainingParameters`
  ///
  ///
  /// To get a list of all your predictors, use the ListPredictors operation.
  ///
  ///
  ///
  /// The `Status` of the predictor must be `ACTIVE`, signifying that training
  /// has completed, before you can use the predictor to create a forecast. Use
  /// the DescribePredictor operation to get the status.
  Future<void> createPredictor(
      {@required String predictorName,
      String algorithmArn,
      @required int forecastHorizon,
      bool performAutoML,
      bool performHpo,
      Map<String, String> trainingParameters,
      EvaluationParameters evaluationParameters,
      HyperParameterTuningJobConfig hpoConfig,
      @required InputDataConfig inputDataConfig,
      @required FeaturizationConfig featurizationConfig,
      EncryptionConfig encryptionConfig}) async {}

  /// Deletes an Amazon Forecast dataset created using the CreateDataset
  /// operation. To be deleted, the dataset must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeDataset operation to get the status.
  Future<void> deleteDataset(String datasetArn) async {}

  /// Deletes a dataset group created using the CreateDatasetGroup operation. To
  /// be deleted, the dataset group must have a status of `ACTIVE`,
  /// `CREATE_FAILED`, or `UPDATE_FAILED`. Use the DescribeDatasetGroup
  /// operation to get the status.
  ///
  /// The operation deletes only the dataset group, not the datasets in the
  /// group.
  Future<void> deleteDatasetGroup(String datasetGroupArn) async {}

  /// Deletes a dataset import job created using the CreateDatasetImportJob
  /// operation. To be deleted, the import job must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeDatasetImportJob operation to get the
  /// status.
  Future<void> deleteDatasetImportJob(String datasetImportJobArn) async {}

  /// Deletes a forecast created using the CreateForecast operation. To be
  /// deleted, the forecast must have a status of `ACTIVE` or `CREATE_FAILED`.
  /// Use the DescribeForecast operation to get the status.
  ///
  /// You can't delete a forecast while it is being exported.
  Future<void> deleteForecast(String forecastArn) async {}

  /// Deletes a forecast export job created using the CreateForecastExportJob
  /// operation. To be deleted, the export job must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeForecastExportJob operation to get the
  /// status.
  Future<void> deleteForecastExportJob(String forecastExportJobArn) async {}

  /// Deletes a predictor created using the CreatePredictor operation. To be
  /// deleted, the predictor must have a status of `ACTIVE` or `CREATE_FAILED`.
  /// Use the DescribePredictor operation to get the status.
  ///
  /// Any forecasts generated by the predictor will no longer be available.
  Future<void> deletePredictor(String predictorArn) async {}

  /// Describes an Amazon Forecast dataset created using the CreateDataset
  /// operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateDataset` request, this operation includes the following properties:
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  Future<void> describeDataset(String datasetArn) async {}

  /// Describes a dataset group created using the CreateDatasetGroup operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateDatasetGroup` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetArns` \- The datasets belonging to the group.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  Future<void> describeDatasetGroup(String datasetGroupArn) async {}

  /// Describes a dataset import job created using the CreateDatasetImportJob
  /// operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateDatasetImportJob` request, this operation includes the following
  /// properties:
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `DataSize`
  ///
  /// *    `FieldStatistics`
  ///
  /// *    `Status`
  ///
  /// *    `Message` \- If an error occurred, information about the error.
  Future<void> describeDatasetImportJob(String datasetImportJobArn) async {}

  /// Describes a forecast created using the CreateForecast operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateForecast` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetGroupArn` \- The dataset group that provided the training
  /// data.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// *    `Message` \- If an error occurred, information about the error.
  Future<void> describeForecast(String forecastArn) async {}

  /// Describes a forecast export job created using the CreateForecastExportJob
  /// operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateForecastExportJob` request, this operation includes the following
  /// properties:
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// *    `Message` \- If an error occurred, information about the error.
  Future<void> describeForecastExportJob(String forecastExportJobArn) async {}

  /// Describes a predictor created using the CreatePredictor operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreatePredictor` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetImportJobArns` \- The dataset import jobs used to import
  /// training data.
  ///
  /// *    `AutoMLAlgorithmArns` \- If AutoML is performed, the algorithms
  /// evaluated.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// *    `Message` \- If an error occurred, information about the error.
  Future<void> describePredictor(String predictorArn) async {}

  /// Provides metrics on the accuracy of the models that were trained by the
  /// CreatePredictor operation. Use metrics to see how well the model performed
  /// and to decide whether to use the predictor to generate a forecast.
  ///
  /// Metrics are generated for each backtest window evaluated. For more
  /// information, see EvaluationParameters.
  ///
  /// The parameters of the `filling` method determine which items contribute to
  /// the metrics. If `zero` is specified, all items contribute. If `nan` is
  /// specified, only those items that have complete data in the range being
  /// evaluated contribute. For more information, see FeaturizationMethod.
  ///
  /// For an example of how to train a model and review metrics, see
  /// getting-started.
  Future<void> getAccuracyMetrics(String predictorArn) async {}

  /// Returns a list of dataset groups created using the CreateDatasetGroup
  /// operation. For each dataset group, a summary of its properties, including
  /// its Amazon Resource Name (ARN), is returned. You can retrieve the complete
  /// set of properties by using the ARN with the DescribeDatasetGroup
  /// operation.
  Future<void> listDatasetGroups({String nextToken, int maxResults}) async {}

  /// Returns a list of dataset import jobs created using the
  /// CreateDatasetImportJob operation. For each import job, a summary of its
  /// properties, including its Amazon Resource Name (ARN), is returned. You can
  /// retrieve the complete set of properties by using the ARN with the
  /// DescribeDatasetImportJob operation. You can filter the list by providing
  /// an array of Filter objects.
  Future<void> listDatasetImportJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Returns a list of datasets created using the CreateDataset operation. For
  /// each dataset, a summary of its properties, including its Amazon Resource
  /// Name (ARN), is returned. You can retrieve the complete set of properties
  /// by using the ARN with the DescribeDataset operation.
  Future<void> listDatasets({String nextToken, int maxResults}) async {}

  /// Returns a list of forecast export jobs created using the
  /// CreateForecastExportJob operation. For each forecast export job, a summary
  /// of its properties, including its Amazon Resource Name (ARN), is returned.
  /// You can retrieve the complete set of properties by using the ARN with the
  /// DescribeForecastExportJob operation. The list can be filtered using an
  /// array of Filter objects.
  Future<void> listForecastExportJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Returns a list of forecasts created using the CreateForecast operation.
  /// For each forecast, a summary of its properties, including its Amazon
  /// Resource Name (ARN), is returned. You can retrieve the complete set of
  /// properties by using the ARN with the DescribeForecast operation. The list
  /// can be filtered using an array of Filter objects.
  Future<void> listForecasts(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Returns a list of predictors created using the CreatePredictor operation.
  /// For each predictor, a summary of its properties, including its Amazon
  /// Resource Name (ARN), is returned. You can retrieve the complete set of
  /// properties by using the ARN with the DescribePredictor operation. The list
  /// can be filtered using an array of Filter objects.
  Future<void> listPredictors(
      {String nextToken, int maxResults, List<Filter> filters}) async {}

  /// Replaces any existing datasets in the dataset group with the specified
  /// datasets.
  ///
  ///
  ///
  /// The `Status` of the dataset group must be `ACTIVE` before creating a
  /// predictor using the dataset group. Use the DescribeDatasetGroup operation
  /// to get the status.
  Future<void> updateDatasetGroup(
      {@required String datasetGroupArn,
      @required List<String> datasetArns}) async {}
}

class CategoricalParameterRange {}

class ContinuousParameterRange {}

class CreateDatasetGroupResponse {}

class CreateDatasetImportJobResponse {}

class CreateDatasetResponse {}

class CreateForecastExportJobResponse {}

class CreateForecastResponse {}

class CreatePredictorResponse {}

class DataDestination {}

class DataSource {}

class DatasetGroupSummary {}

class DatasetImportJobSummary {}

class DatasetSummary {}

class DescribeDatasetGroupResponse {}

class DescribeDatasetImportJobResponse {}

class DescribeDatasetResponse {}

class DescribeForecastExportJobResponse {}

class DescribeForecastResponse {}

class DescribePredictorResponse {}

class EncryptionConfig {}

class EvaluationParameters {}

class EvaluationResult {}

class Featurization {}

class FeaturizationConfig {}

class FeaturizationMethod {}

class Filter {}

class ForecastExportJobSummary {}

class ForecastSummary {}

class GetAccuracyMetricsResponse {}

class HyperParameterTuningJobConfig {}

class InputDataConfig {}

class IntegerParameterRange {}

class ListDatasetGroupsResponse {}

class ListDatasetImportJobsResponse {}

class ListDatasetsResponse {}

class ListForecastExportJobsResponse {}

class ListForecastsResponse {}

class ListPredictorsResponse {}

class Metrics {}

class ParameterRanges {}

class PredictorSummary {}

class S3Config {}

class Schema {}

class SchemaAttribute {}

class Statistics {}

class SupplementaryFeature {}

class UpdateDatasetGroupResponse {}

class WeightedQuantileLoss {}

class WindowSummary {}
