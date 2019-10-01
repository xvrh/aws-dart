import 'package:meta/meta.dart';

/// Provides APIs for creating and managing Amazon Forecast resources.
class ForecastApi {
  final _client;
  ForecastApi(client)
      : _client = client.configured('forecast', serializer: 'json');

  /// Creates an Amazon Forecast dataset. The information about the dataset that
  /// you provide helps Forecast understand how to consume the data for model
  /// training. This includes the following:
  ///
  /// *     _`DataFrequency`_  - How frequently your historical time-series data
  /// is collected. Amazon Forecast uses this information when training the
  /// model and generating a forecast.
  ///
  /// *     _`Domain`_  and  _`DatasetType`_  - Each dataset has an associated
  /// dataset domain and a type within the domain. Amazon Forecast provides a
  /// list of predefined domains and types within each domain. For each unique
  /// dataset domain and type within the domain, Amazon Forecast requires your
  /// data to include a minimum set of predefined fields.
  ///
  /// *     _`Schema`_  - A schema specifies the fields of the dataset,
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
  ///
  /// [datasetName]: A name for the dataset.
  ///
  /// [domain]: The domain associated with the dataset. The `Domain` and
  /// `DatasetType` that you choose determine the fields that must be present in
  /// the training data that you import to the dataset. For example, if you
  /// choose the `RETAIL` domain and `TARGET_TIME_SERIES` as the `DatasetType`,
  /// Amazon Forecast requires `item_id`, `timestamp`, and `demand` fields to be
  /// present in your data. For more information, see
  /// howitworks-datasets-groups.
  ///
  /// [datasetType]: The dataset type. Valid values depend on the chosen
  /// `Domain`.
  ///
  /// [dataFrequency]: The frequency of data collection.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour),
  /// 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5
  /// minutes), and 1min (1 minute). For example, "D" indicates every day and
  /// "15min" indicates every 15 minutes.
  ///
  /// [schema]: The schema for the dataset. The schema attributes and their
  /// order must match the fields in your data. The dataset `Domain` and
  /// `DatasetType` that you choose determine the minimum required fields in
  /// your training data. For information about the required fields for a
  /// specific dataset domain and type, see howitworks-domains-ds-types.
  ///
  /// [encryptionConfig]: An AWS Key Management Service (KMS) key and the AWS
  /// Identity and Access Management (IAM) role that Amazon Forecast can assume
  /// to access the key.
  Future<CreateDatasetResponse> createDataset(
      {@required String datasetName,
      @required String domain,
      @required String datasetType,
      String dataFrequency,
      @required Schema schema,
      EncryptionConfig encryptionConfig}) async {
    var response_ = await _client.send('CreateDataset', {
      'DatasetName': datasetName,
      'Domain': domain,
      'DatasetType': datasetType,
      if (dataFrequency != null) 'DataFrequency': dataFrequency,
      'Schema': schema,
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
    });
    return CreateDatasetResponse.fromJson(response_);
  }

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
  ///
  /// [datasetGroupName]: A name for the dataset group.
  ///
  /// [domain]: The domain associated with the dataset group. The `Domain` and
  /// `DatasetType` that you choose determine the fields that must be present in
  /// the training data that you import to the dataset. For example, if you
  /// choose the `RETAIL` domain and `TARGET_TIME_SERIES` as the `DatasetType`,
  /// Amazon Forecast requires `item_id`, `timestamp`, and `demand` fields to be
  /// present in your data. For more information, see
  /// howitworks-datasets-groups.
  ///
  /// [datasetArns]: An array of Amazon Resource Names (ARNs) of the datasets
  /// that you want to include in the dataset group.
  Future<CreateDatasetGroupResponse> createDatasetGroup(
      {@required String datasetGroupName,
      @required String domain,
      List<String> datasetArns}) async {
    var response_ = await _client.send('CreateDatasetGroup', {
      'DatasetGroupName': datasetGroupName,
      'Domain': domain,
      if (datasetArns != null) 'DatasetArns': datasetArns,
    });
    return CreateDatasetGroupResponse.fromJson(response_);
  }

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
  ///
  /// [datasetImportJobName]: The name for the dataset import job. It is
  /// recommended to include the current timestamp in the name to guard against
  /// getting a `ResourceAlreadyExistsException` exception, for example,
  /// `20190721DatasetImport`.
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the Amazon Forecast
  /// dataset that you want to import data to.
  ///
  /// [dataSource]: The location of the training data to import and an AWS
  /// Identity and Access Management (IAM) role that Amazon Forecast can assume
  /// to access the data.
  ///
  /// [timestampFormat]: The format of timestamps in the dataset. Two formats
  /// are supported, dependent on the `DataFrequency` specified when the dataset
  /// was created.
  ///
  /// *   "yyyy-MM-dd"
  ///
  ///     For data frequencies: Y, M, W, and D
  ///
  /// *   "yyyy-MM-dd HH:mm:ss"
  ///
  ///     For data frequencies: H, 30min, 15min, and 1min; and optionally, for:
  /// Y, M, W, and D
  Future<CreateDatasetImportJobResponse> createDatasetImportJob(
      {@required String datasetImportJobName,
      @required String datasetArn,
      @required DataSource dataSource,
      String timestampFormat}) async {
    var response_ = await _client.send('CreateDatasetImportJob', {
      'DatasetImportJobName': datasetImportJobName,
      'DatasetArn': datasetArn,
      'DataSource': dataSource,
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
    });
    return CreateDatasetImportJobResponse.fromJson(response_);
  }

  /// Creates a forecast for each item in the `TARGET_TIME_SERIES` dataset that
  /// was used to train the predictor. This is known as inference. To retrieve
  /// the forecast for a single item at low latency, use the operation. To
  /// export the complete forecast into your Amazon Simple Storage Service
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
  ///
  /// [forecastName]: The name for the forecast.
  ///
  /// [predictorArn]: The Amazon Resource Name (ARN) of the predictor to use to
  /// generate the forecast.
  Future<CreateForecastResponse> createForecast(
      {@required String forecastName, @required String predictorArn}) async {
    var response_ = await _client.send('CreateForecast', {
      'ForecastName': forecastName,
      'PredictorArn': predictorArn,
    });
    return CreateForecastResponse.fromJson(response_);
  }

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
  ///
  /// [forecastExportJobName]: The name for the forecast export job.
  ///
  /// [forecastArn]: The Amazon Resource Name (ARN) of the forecast that you
  /// want to export.
  ///
  /// [destination]: The path to the Amazon S3 bucket where you want to save the
  /// forecast and an AWS Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the bucket.
  Future<CreateForecastExportJobResponse> createForecastExportJob(
      {@required String forecastExportJobName,
      @required String forecastArn,
      @required DataDestination destination}) async {
    var response_ = await _client.send('CreateForecastExportJob', {
      'ForecastExportJobName': forecastExportJobName,
      'ForecastArn': forecastArn,
      'Destination': destination,
    });
    return CreateForecastExportJobResponse.fromJson(response_);
  }

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
  /// aggragate the data fields in the `TARGET_TIME_SERIES` dataset to improve
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
  ///
  /// [predictorName]: A name for the predictor.
  ///
  /// [algorithmArn]: The Amazon Resource Name (ARN) of the algorithm to use for
  /// model training. Required if `PerformAutoML` is not set to `true`.
  ///
  ///  **Supported algorithms**
  ///
  /// *    `arn:aws:forecast:::algorithm/ARIMA`
  ///
  /// *    `arn:aws:forecast:::algorithm/Deep_AR_Plus`
  ///
  ///      `- supports hyperparameter optimization (HPO)`
  ///
  /// *    `arn:aws:forecast:::algorithm/ETS`
  ///
  /// *    `arn:aws:forecast:::algorithm/NPTS`
  ///
  /// *    `arn:aws:forecast:::algorithm/Prophet`
  ///
  /// [forecastHorizon]: Specifies the number of time-steps that the model is
  /// trained to predict. The forecast horizon is also called the prediction
  /// length.
  ///
  /// For example, if you configure a dataset for daily data collection (using
  /// the `DataFrequency` parameter of the CreateDataset operation) and set the
  /// forecast horizon to 10, the model returns predictions for 10 days.
  ///
  /// [performAutoML]: Whether to perform AutoML. The default value is `false`.
  /// In this case, you are required to specify an algorithm.
  ///
  /// If you want Amazon Forecast to evaluate the algorithms it provides and
  /// choose the best algorithm and configuration for your training dataset, set
  /// `PerformAutoML` to `true`. This is a good option if you aren't sure which
  /// algorithm is suitable for your application.
  ///
  /// [performHpo]: Whether to perform hyperparameter optimization (HPO). HPO
  /// finds optimal hyperparameter values for your training data. The process of
  /// performing HPO is known as a hyperparameter tuning job.
  ///
  /// The default value is `false`. In this case, Amazon Forecast uses default
  /// hyperparameter values from the chosen algorithm.
  ///
  /// To override the default values, set `PerformHPO` to `true` and supply the
  /// HyperParameterTuningJobConfig object. The tuning job specifies an
  /// objective metric, the hyperparameters to optimize, and the valid range for
  /// each hyperparameter.
  ///
  /// The following algorithms support HPO:
  ///
  /// *   DeepAR+
  ///
  /// [trainingParameters]: The training parameters to override for model
  /// training. The parameters that you can override are listed in the
  /// individual algorithms in aws-forecast-choosing-recipes.
  ///
  /// [evaluationParameters]: Used to override the default evaluation parameters
  /// of the specified algorithm. Amazon Forecast evaluates a predictor by
  /// splitting a dataset into training data and testing data. The evaluation
  /// parameters define how to perform the split and the number of iterations.
  ///
  /// [hpoConfig]: Provides hyperparameter override values for the algorithm. If
  /// you don't provide this parameter, Amazon Forecast uses default values. The
  /// individual algorithms specify which hyperparameters support hyperparameter
  /// optimization (HPO). For more information, see
  /// aws-forecast-choosing-recipes.
  ///
  /// [inputDataConfig]: Describes the dataset group that contains the data to
  /// use to train the predictor.
  ///
  /// [featurizationConfig]: The featurization configuration.
  ///
  /// [encryptionConfig]: An AWS Key Management Service (KMS) key and the AWS
  /// Identity and Access Management (IAM) role that Amazon Forecast can assume
  /// to access the key.
  Future<CreatePredictorResponse> createPredictor(
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
      EncryptionConfig encryptionConfig}) async {
    var response_ = await _client.send('CreatePredictor', {
      'PredictorName': predictorName,
      if (algorithmArn != null) 'AlgorithmArn': algorithmArn,
      'ForecastHorizon': forecastHorizon,
      if (performAutoML != null) 'PerformAutoML': performAutoML,
      if (performHpo != null) 'PerformHPO': performHpo,
      if (trainingParameters != null) 'TrainingParameters': trainingParameters,
      if (evaluationParameters != null)
        'EvaluationParameters': evaluationParameters,
      if (hpoConfig != null) 'HPOConfig': hpoConfig,
      'InputDataConfig': inputDataConfig,
      'FeaturizationConfig': featurizationConfig,
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
    });
    return CreatePredictorResponse.fromJson(response_);
  }

  /// Deletes an Amazon Forecast dataset created using the CreateDataset
  /// operation. To be deleted, the dataset must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeDataset operation to get the status.
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the dataset to delete.
  Future<void> deleteDataset(String datasetArn) async {
    await _client.send('DeleteDataset', {
      'DatasetArn': datasetArn,
    });
  }

  /// Deletes a dataset group created using the CreateDatasetGroup operation. To
  /// be deleted, the dataset group must have a status of `ACTIVE`,
  /// `CREATE_FAILED`, or `UPDATE_FAILED`. Use the DescribeDatasetGroup
  /// operation to get the status.
  ///
  /// The operation deletes only the dataset group, not the datasets in the
  /// group.
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group to
  /// delete.
  Future<void> deleteDatasetGroup(String datasetGroupArn) async {
    await _client.send('DeleteDatasetGroup', {
      'DatasetGroupArn': datasetGroupArn,
    });
  }

  /// Deletes a dataset import job created using the CreateDatasetImportJob
  /// operation. To be deleted, the import job must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeDatasetImportJob operation to get the
  /// status.
  ///
  /// [datasetImportJobArn]: The Amazon Resource Name (ARN) of the dataset
  /// import job to delete.
  Future<void> deleteDatasetImportJob(String datasetImportJobArn) async {
    await _client.send('DeleteDatasetImportJob', {
      'DatasetImportJobArn': datasetImportJobArn,
    });
  }

  /// Deletes a forecast created using the CreateForecast operation. To be
  /// deleted, the forecast must have a status of `ACTIVE` or `CREATE_FAILED`.
  /// Use the DescribeForecast operation to get the status.
  ///
  /// You can't delete a forecast while it is being exported.
  ///
  /// [forecastArn]: The Amazon Resource Name (ARN) of the forecast to delete.
  Future<void> deleteForecast(String forecastArn) async {
    await _client.send('DeleteForecast', {
      'ForecastArn': forecastArn,
    });
  }

  /// Deletes a forecast export job created using the CreateForecastExportJob
  /// operation. To be deleted, the export job must have a status of `ACTIVE` or
  /// `CREATE_FAILED`. Use the DescribeForecastExportJob operation to get the
  /// status.
  ///
  /// [forecastExportJobArn]: The Amazon Resource Name (ARN) of the forecast
  /// export job to delete.
  Future<void> deleteForecastExportJob(String forecastExportJobArn) async {
    await _client.send('DeleteForecastExportJob', {
      'ForecastExportJobArn': forecastExportJobArn,
    });
  }

  /// Deletes a predictor created using the CreatePredictor operation. To be
  /// deleted, the predictor must have a status of `ACTIVE` or `CREATE_FAILED`.
  /// Use the DescribePredictor operation to get the status.
  ///
  /// Any forecasts generated by the predictor will no longer be available.
  ///
  /// [predictorArn]: The Amazon Resource Name (ARN) of the predictor to delete.
  Future<void> deletePredictor(String predictorArn) async {
    await _client.send('DeletePredictor', {
      'PredictorArn': predictorArn,
    });
  }

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
  ///
  /// [datasetArn]: The Amazon Resource Name (ARN) of the dataset.
  Future<DescribeDatasetResponse> describeDataset(String datasetArn) async {
    var response_ = await _client.send('DescribeDataset', {
      'DatasetArn': datasetArn,
    });
    return DescribeDatasetResponse.fromJson(response_);
  }

  /// Describes a dataset group created using the CreateDatasetGroup operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateDatasetGroup` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetArns` - The datasets belonging to the group.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// [datasetGroupArn]: The Amazon Resource Name (ARN) of the dataset group.
  Future<DescribeDatasetGroupResponse> describeDatasetGroup(
      String datasetGroupArn) async {
    var response_ = await _client.send('DescribeDatasetGroup', {
      'DatasetGroupArn': datasetGroupArn,
    });
    return DescribeDatasetGroupResponse.fromJson(response_);
  }

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
  /// *    `Message` - If an error occurred, information about the error.
  ///
  /// [datasetImportJobArn]: The Amazon Resource Name (ARN) of the dataset
  /// import job.
  Future<DescribeDatasetImportJobResponse> describeDatasetImportJob(
      String datasetImportJobArn) async {
    var response_ = await _client.send('DescribeDatasetImportJob', {
      'DatasetImportJobArn': datasetImportJobArn,
    });
    return DescribeDatasetImportJobResponse.fromJson(response_);
  }

  /// Describes a forecast created using the CreateForecast operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreateForecast` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetGroupArn` - The dataset group that provided the training
  /// data.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// *    `Message` - If an error occurred, information about the error.
  ///
  /// [forecastArn]: The Amazon Resource Name (ARN) of the forecast.
  Future<DescribeForecastResponse> describeForecast(String forecastArn) async {
    var response_ = await _client.send('DescribeForecast', {
      'ForecastArn': forecastArn,
    });
    return DescribeForecastResponse.fromJson(response_);
  }

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
  /// *    `Message` - If an error occurred, information about the error.
  ///
  /// [forecastExportJobArn]: The Amazon Resource Name (ARN) of the forecast
  /// export job.
  Future<DescribeForecastExportJobResponse> describeForecastExportJob(
      String forecastExportJobArn) async {
    var response_ = await _client.send('DescribeForecastExportJob', {
      'ForecastExportJobArn': forecastExportJobArn,
    });
    return DescribeForecastExportJobResponse.fromJson(response_);
  }

  /// Describes a predictor created using the CreatePredictor operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// `CreatePredictor` request, this operation includes the following
  /// properties:
  ///
  /// *    `DatasetImportJobArns` - The dataset import jobs used to import
  /// training data.
  ///
  /// *    `AutoMLAlgorithmArns` - If AutoML is performed, the algorithms
  /// evaluated.
  ///
  /// *    `CreationTime`
  ///
  /// *    `LastModificationTime`
  ///
  /// *    `Status`
  ///
  /// *    `Message` - If an error occurred, information about the error.
  ///
  /// [predictorArn]: The Amazon Resource Name (ARN) of the predictor that you
  /// want information about.
  Future<DescribePredictorResponse> describePredictor(
      String predictorArn) async {
    var response_ = await _client.send('DescribePredictor', {
      'PredictorArn': predictorArn,
    });
    return DescribePredictorResponse.fromJson(response_);
  }

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
  ///
  /// [predictorArn]: The Amazon Resource Name (ARN) of the predictor to get
  /// metrics for.
  Future<GetAccuracyMetricsResponse> getAccuracyMetrics(
      String predictorArn) async {
    var response_ = await _client.send('GetAccuracyMetrics', {
      'PredictorArn': predictorArn,
    });
    return GetAccuracyMetricsResponse.fromJson(response_);
  }

  /// Returns a list of dataset groups created using the CreateDatasetGroup
  /// operation. For each dataset group, a summary of its properties, including
  /// its Amazon Resource Name (ARN), is returned. You can retrieve the complete
  /// set of properties by using the ARN with the DescribeDatasetGroup
  /// operation.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  Future<ListDatasetGroupsResponse> listDatasetGroups(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListDatasetGroups', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDatasetGroupsResponse.fromJson(response_);
  }

  /// Returns a list of dataset import jobs created using the
  /// CreateDatasetImportJob operation. For each import job, a summary of its
  /// properties, including its Amazon Resource Name (ARN), is returned. You can
  /// retrieve the complete set of properties by using the ARN with the
  /// DescribeDatasetImportJob operation. You can filter the list by providing
  /// an array of Filter objects.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  ///
  /// [filters]: An array of filters. For each filter, you provide a condition
  /// and a match statement. The condition is either `IS` or `IS_NOT`, which
  /// specifies whether to include or exclude, respectively, from the list, the
  /// predictors that match the statement. The match statement consists of a key
  /// and a value. In this release, `Name` is the only valid key, which filters
  /// on the `DatasetImportJobName` property.
  ///
  /// *    `Condition` - `IS` or `IS_NOT`
  ///
  /// *    `Key` - `Name`
  ///
  /// *    `Value` - the value to match
  ///
  ///
  /// For example, to list all dataset import jobs named
  /// _my_dataset_import_job_, you would specify:
  ///
  ///  `"Filters":
  /// [ { "Condition": "IS", "Key": "Name", "Value": "my_dataset_import_job" } ]`
  Future<ListDatasetImportJobsResponse> listDatasetImportJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    var response_ = await _client.send('ListDatasetImportJobs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
    });
    return ListDatasetImportJobsResponse.fromJson(response_);
  }

  /// Returns a list of datasets created using the CreateDataset operation. For
  /// each dataset, a summary of its properties, including its Amazon Resource
  /// Name (ARN), is returned. You can retrieve the complete set of properties
  /// by using the ARN with the DescribeDataset operation.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  Future<ListDatasetsResponse> listDatasets(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListDatasets', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListDatasetsResponse.fromJson(response_);
  }

  /// Returns a list of forecast export jobs created using the
  /// CreateForecastExportJob operation. For each forecast export job, a summary
  /// of its properties, including its Amazon Resource Name (ARN), is returned.
  /// You can retrieve the complete set of properties by using the ARN with the
  /// DescribeForecastExportJob operation. The list can be filtered using an
  /// array of Filter objects.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  ///
  /// [filters]: An array of filters. For each filter, you provide a condition
  /// and a match statement. The condition is either `IS` or `IS_NOT`, which
  /// specifies whether to include or exclude, respectively, from the list, the
  /// predictors that match the statement. The match statement consists of a key
  /// and a value. In this release, `Name` is the only valid key, which filters
  /// on the `ForecastExportJobName` property.
  ///
  /// *    `Condition` - `IS` or `IS_NOT`
  ///
  /// *    `Key` - `Name`
  ///
  /// *    `Value` - the value to match
  ///
  ///
  /// For example, to list all forecast export jobs named
  /// _my_forecast_export_job_, you would specify:
  ///
  ///  `"Filters":
  /// [ { "Condition": "IS", "Key": "Name", "Value": "my_forecast_export_job" } ]`
  Future<ListForecastExportJobsResponse> listForecastExportJobs(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    var response_ = await _client.send('ListForecastExportJobs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
    });
    return ListForecastExportJobsResponse.fromJson(response_);
  }

  /// Returns a list of forecasts created using the CreateForecast operation.
  /// For each forecast, a summary of its properties, including its Amazon
  /// Resource Name (ARN), is returned. You can retrieve the complete set of
  /// properties by using the ARN with the DescribeForecast operation. The list
  /// can be filtered using an array of Filter objects.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  ///
  /// [filters]: An array of filters. For each filter, you provide a condition
  /// and a match statement. The condition is either `IS` or `IS_NOT`, which
  /// specifies whether to include or exclude, respectively, from the list, the
  /// predictors that match the statement. The match statement consists of a key
  /// and a value. In this release, `Name` is the only valid key, which filters
  /// on the `ForecastName` property.
  ///
  /// *    `Condition` - `IS` or `IS_NOT`
  ///
  /// *    `Key` - `Name`
  ///
  /// *    `Value` - the value to match
  ///
  ///
  /// For example, to list all forecasts named _my_forecast_, you would specify:
  ///
  ///  `"Filters":
  /// [ { "Condition": "IS", "Key": "Name", "Value": "my_forecast" } ]`
  Future<ListForecastsResponse> listForecasts(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    var response_ = await _client.send('ListForecasts', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
    });
    return ListForecastsResponse.fromJson(response_);
  }

  /// Returns a list of predictors created using the CreatePredictor operation.
  /// For each predictor, a summary of its properties, including its Amazon
  /// Resource Name (ARN), is returned. You can retrieve the complete set of
  /// properties by using the ARN with the DescribePredictor operation. The list
  /// can be filtered using an array of Filter objects.
  ///
  /// [nextToken]: If the result of the previous request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of results, use
  /// the token in the next request. Tokens expire after 24 hours.
  ///
  /// [maxResults]: The number of items to return in the response.
  ///
  /// [filters]: An array of filters. For each filter, you provide a condition
  /// and a match statement. The condition is either `IS` or `IS_NOT`, which
  /// specifies whether to include or exclude, respectively, from the list, the
  /// predictors that match the statement. The match statement consists of a key
  /// and a value. In this release, `Name` is the only valid key, which filters
  /// on the `PredictorName` property.
  ///
  /// *    `Condition` - `IS` or `IS_NOT`
  ///
  /// *    `Key` - `Name`
  ///
  /// *    `Value` - the value to match
  ///
  ///
  /// For example, to list all predictors named _my_predictor_, you would
  /// specify:
  ///
  ///  `"Filters":
  /// [ { "Condition": "IS", "Key": "Name", "Value": "my_predictor" } ]`
  Future<ListPredictorsResponse> listPredictors(
      {String nextToken, int maxResults, List<Filter> filters}) async {
    var response_ = await _client.send('ListPredictors', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (filters != null) 'Filters': filters,
    });
    return ListPredictorsResponse.fromJson(response_);
  }

  /// Replaces any existing datasets in the dataset group with the specified
  /// datasets.
  ///
  ///
  ///
  /// The `Status` of the dataset group must be `ACTIVE` before creating a
  /// predictor using the dataset group. Use the DescribeDatasetGroup operation
  /// to get the status.
  ///
  /// [datasetGroupArn]: The ARN of the dataset group.
  ///
  /// [datasetArns]: An array of Amazon Resource Names (ARNs) of the datasets to
  /// add to the dataset group.
  Future<UpdateDatasetGroupResponse> updateDatasetGroup(
      {@required String datasetGroupArn,
      @required List<String> datasetArns}) async {
    var response_ = await _client.send('UpdateDatasetGroup', {
      'DatasetGroupArn': datasetGroupArn,
      'DatasetArns': datasetArns,
    });
    return UpdateDatasetGroupResponse.fromJson(response_);
  }
}

/// Specifies a categorical hyperparameter and it's range of tunable values.
/// This object is part of the ParameterRanges object.
class CategoricalParameterRange {
  /// The name of the categorical hyperparameter to tune.
  final String name;

  /// A list of the tunable categories for the hyperparameter.
  final List<String> values;

  CategoricalParameterRange({
    @required this.name,
    @required this.values,
  });
  static CategoricalParameterRange fromJson(Map<String, dynamic> json) =>
      CategoricalParameterRange(
        name: json['Name'] as String,
        values: (json['Values'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a continuous hyperparameter and it's range of tunable values. This
/// object is part of the ParameterRanges object.
class ContinuousParameterRange {
  /// The name of the hyperparameter to tune.
  final String name;

  /// The maximum tunable value of the hyperparameter.
  final double maxValue;

  /// The minimum tunable value of the hyperparameter.
  final double minValue;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see
  /// [Hyperparameter Scaling](http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type).
  /// One of the following values:
  ///
  /// Auto
  ///
  /// Amazon Forecast hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  ///
  /// Linear
  ///
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  ///
  /// Logarithmic
  ///
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have only values greater
  /// than 0.
  ///
  /// ReverseLogarithmic
  ///
  /// Hyperparemeter tuning searches the values in the hyperparameter range by
  /// using a reverse logarithmic scale.
  ///
  /// Reverse logarithmic scaling works only for ranges that are entirely within
  /// the range 0 <= x < 1.0.
  final String scalingType;

  ContinuousParameterRange({
    @required this.name,
    @required this.maxValue,
    @required this.minValue,
    this.scalingType,
  });
  static ContinuousParameterRange fromJson(Map<String, dynamic> json) =>
      ContinuousParameterRange(
        name: json['Name'] as String,
        maxValue: json['MaxValue'] as double,
        minValue: json['MinValue'] as double,
        scalingType: json.containsKey('ScalingType')
            ? json['ScalingType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
  });
  static CreateDatasetGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetGroupResponse(
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
      );
}

class CreateDatasetImportJobResponse {
  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String datasetImportJobArn;

  CreateDatasetImportJobResponse({
    this.datasetImportJobArn,
  });
  static CreateDatasetImportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetImportJobResponse(
        datasetImportJobArn: json.containsKey('DatasetImportJobArn')
            ? json['DatasetImportJobArn'] as String
            : null,
      );
}

class CreateDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });
  static CreateDatasetResponse fromJson(Map<String, dynamic> json) =>
      CreateDatasetResponse(
        datasetArn: json.containsKey('DatasetArn')
            ? json['DatasetArn'] as String
            : null,
      );
}

class CreateForecastExportJobResponse {
  /// The Amazon Resource Name (ARN) of the export job.
  final String forecastExportJobArn;

  CreateForecastExportJobResponse({
    this.forecastExportJobArn,
  });
  static CreateForecastExportJobResponse fromJson(Map<String, dynamic> json) =>
      CreateForecastExportJobResponse(
        forecastExportJobArn: json.containsKey('ForecastExportJobArn')
            ? json['ForecastExportJobArn'] as String
            : null,
      );
}

class CreateForecastResponse {
  /// The Amazon Resource Name (ARN) of the forecast.
  final String forecastArn;

  CreateForecastResponse({
    this.forecastArn,
  });
  static CreateForecastResponse fromJson(Map<String, dynamic> json) =>
      CreateForecastResponse(
        forecastArn: json.containsKey('ForecastArn')
            ? json['ForecastArn'] as String
            : null,
      );
}

class CreatePredictorResponse {
  /// The Amazon Resource Name (ARN) of the predictor.
  final String predictorArn;

  CreatePredictorResponse({
    this.predictorArn,
  });
  static CreatePredictorResponse fromJson(Map<String, dynamic> json) =>
      CreatePredictorResponse(
        predictorArn: json.containsKey('PredictorArn')
            ? json['PredictorArn'] as String
            : null,
      );
}

/// The destination of an exported forecast and credentials to access the
/// location. This object is submitted in the CreateForecastExportJob request.
class DataDestination {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket along with
  /// the credentials to access the bucket.
  final S3Config s3Config;

  DataDestination({
    @required this.s3Config,
  });
  static DataDestination fromJson(Map<String, dynamic> json) => DataDestination(
        s3Config: S3Config.fromJson(json['S3Config']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The source of your training data and credentials to access the data. This
/// object is submitted in the CreateDatasetImportJob request.
class DataSource {
  /// The path to the training data stored in an Amazon Simple Storage Service
  /// (Amazon S3) bucket along with the credentials to access the data.
  final S3Config s3Config;

  DataSource({
    @required this.s3Config,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource(
        s3Config: S3Config.fromJson(json['S3Config']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a summary of the dataset group properties used in the
/// ListDatasetGroups operation. To get the complete set of properties, call the
/// DescribeDatasetGroup operation, and provide the listed `DatasetGroupArn`.
class DatasetGroupSummary {
  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// The name of the dataset group.
  final String datasetGroupName;

  /// When the datase group was created.
  final DateTime creationTime;

  /// When the dataset group was created or last updated from a call to the
  /// UpdateDatasetGroup operation. While the dataset group is being updated,
  /// `LastModificationTime` is the current query time.
  final DateTime lastModificationTime;

  DatasetGroupSummary({
    this.datasetGroupArn,
    this.datasetGroupName,
    this.creationTime,
    this.lastModificationTime,
  });
  static DatasetGroupSummary fromJson(Map<String, dynamic> json) =>
      DatasetGroupSummary(
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
        datasetGroupName: json.containsKey('DatasetGroupName')
            ? json['DatasetGroupName'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

/// Provides a summary of the dataset import job properties used in the
/// ListDatasetImportJobs operation. To get the complete set of properties, call
/// the DescribeDatasetImportJob operation, and provide the listed
/// `DatasetImportJobArn`.
class DatasetImportJobSummary {
  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String datasetImportJobArn;

  /// The name of the dataset import job.
  final String datasetImportJobName;

  /// The location of the Amazon S3 bucket that contains the training data.
  final DataSource dataSource;

  /// The status of the dataset import job. The status is reflected in the
  /// status of the dataset. For example, when the import job status is
  /// `CREATE_IN_PROGRESS`, the status of the dataset is `UPDATE_IN_PROGRESS`.
  /// States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the dataset import job was created.
  final DateTime creationTime;

  /// Dependent on the status as follows:
  ///
  /// *    `CREATE_PENDING` - same as `CreationTime`
  ///
  /// *    `CREATE_IN_PROGRESS` - the current timestamp
  ///
  /// *    `ACTIVE` or `CREATE_FAILED` - when the job finished or failed
  final DateTime lastModificationTime;

  DatasetImportJobSummary({
    this.datasetImportJobArn,
    this.datasetImportJobName,
    this.dataSource,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static DatasetImportJobSummary fromJson(Map<String, dynamic> json) =>
      DatasetImportJobSummary(
        datasetImportJobArn: json.containsKey('DatasetImportJobArn')
            ? json['DatasetImportJobArn'] as String
            : null,
        datasetImportJobName: json.containsKey('DatasetImportJobName')
            ? json['DatasetImportJobName'] as String
            : null,
        dataSource: json.containsKey('DataSource')
            ? DataSource.fromJson(json['DataSource'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

/// Provides a summary of the dataset properties used in the ListDatasets
/// operation. To get the complete set of properties, call the DescribeDataset
/// operation, and provide the listed `DatasetArn`.
class DatasetSummary {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String datasetArn;

  /// The name of the dataset.
  final String datasetName;

  /// The dataset type.
  final String datasetType;

  /// The domain associated with the dataset.
  final String domain;

  /// When the dataset was created.
  final DateTime creationTime;

  /// When the dataset is created, `LastModificationTime` is the same as
  /// `CreationTime`. After a CreateDatasetImportJob operation is called,
  /// `LastModificationTime` is when the import job finished or failed. While
  /// data is being imported to the dataset, `LastModificationTime` is the
  /// current query time.
  final DateTime lastModificationTime;

  DatasetSummary({
    this.datasetArn,
    this.datasetName,
    this.datasetType,
    this.domain,
    this.creationTime,
    this.lastModificationTime,
  });
  static DatasetSummary fromJson(Map<String, dynamic> json) => DatasetSummary(
        datasetArn: json.containsKey('DatasetArn')
            ? json['DatasetArn'] as String
            : null,
        datasetName: json.containsKey('DatasetName')
            ? json['DatasetName'] as String
            : null,
        datasetType: json.containsKey('DatasetType')
            ? json['DatasetType'] as String
            : null,
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribeDatasetGroupResponse {
  /// The name of the dataset group.
  final String datasetGroupName;

  /// The ARN of the dataset group.
  final String datasetGroupArn;

  /// An array of Amazon Resource Names (ARNs) of the datasets contained in the
  /// dataset group.
  final List<String> datasetArns;

  /// The domain associated with the dataset group. The `Domain` and
  /// `DatasetType` that you choose determine the fields that must be present in
  /// the training data that you import to the dataset. For example, if you
  /// choose the `RETAIL` domain and `TARGET_TIME_SERIES` as the `DatasetType`,
  /// Amazon Forecast requires `item_id`, `timestamp`, and `demand` fields to be
  /// present in your data. For more information, see
  /// howitworks-datasets-groups.
  final String domain;

  /// The status of the dataset group. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  /// *    `UPDATE_PENDING`, `UPDATE_IN_PROGRESS`, `UPDATE_FAILED`
  ///
  ///
  /// The `UPDATE` states apply when the UpdateDatasetGroup operation is called.
  ///
  ///
  ///
  /// The `Status` of the dataset group must be `ACTIVE` before creating a
  /// predictor using the dataset group.
  final String status;

  /// When the dataset group was created.
  final DateTime creationTime;

  /// When the dataset group was created or last updated from a call to the
  /// UpdateDatasetGroup operation. While the dataset group is being updated,
  /// `LastModificationTime` is the current query time.
  final DateTime lastModificationTime;

  DescribeDatasetGroupResponse({
    this.datasetGroupName,
    this.datasetGroupArn,
    this.datasetArns,
    this.domain,
    this.status,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribeDatasetGroupResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetGroupResponse(
        datasetGroupName: json.containsKey('DatasetGroupName')
            ? json['DatasetGroupName'] as String
            : null,
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
        datasetArns: json.containsKey('DatasetArns')
            ? (json['DatasetArns'] as List).map((e) => e as String).toList()
            : null,
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribeDatasetImportJobResponse {
  /// The name of the dataset import job.
  final String datasetImportJobName;

  /// The ARN of the dataset import job.
  final String datasetImportJobArn;

  /// The Amazon Resource Name (ARN) of the dataset that the training data was
  /// imported to.
  final String datasetArn;

  /// The format of timestamps in the dataset. Two formats are supported
  /// dependent on the `DataFrequency` specified when the dataset was created.
  ///
  /// *   "yyyy-MM-dd"
  ///
  ///     For data frequencies: Y, M, W, and D
  ///
  /// *   "yyyy-MM-dd HH:mm:ss"
  ///
  ///     For data frequencies: H, 30min, 15min, and 1min; and optionally, for:
  /// Y, M, W, and D
  final String timestampFormat;

  /// The location of the training data to import. The training data must be
  /// stored in an Amazon S3 bucket.
  final DataSource dataSource;

  /// Statistical information about each field in the input data.
  final Map<String, Statistics> fieldStatistics;

  /// The size of the dataset in gigabytes (GB) after completion of the import
  /// job.
  final double dataSize;

  /// The status of the dataset import job. The status is reflected in the
  /// status of the dataset. For example, when the import job status is
  /// `CREATE_IN_PROGRESS`, the status of the dataset is `UPDATE_IN_PROGRESS`.
  /// States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the dataset import job was created.
  final DateTime creationTime;

  /// Dependent on the status as follows:
  ///
  /// *    `CREATE_PENDING` - same as `CreationTime`
  ///
  /// *    `CREATE_IN_PROGRESS` - the current timestamp
  ///
  /// *    `ACTIVE` or `CREATE_FAILED` - when the job finished or failed
  final DateTime lastModificationTime;

  DescribeDatasetImportJobResponse({
    this.datasetImportJobName,
    this.datasetImportJobArn,
    this.datasetArn,
    this.timestampFormat,
    this.dataSource,
    this.fieldStatistics,
    this.dataSize,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribeDatasetImportJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetImportJobResponse(
        datasetImportJobName: json.containsKey('DatasetImportJobName')
            ? json['DatasetImportJobName'] as String
            : null,
        datasetImportJobArn: json.containsKey('DatasetImportJobArn')
            ? json['DatasetImportJobArn'] as String
            : null,
        datasetArn: json.containsKey('DatasetArn')
            ? json['DatasetArn'] as String
            : null,
        timestampFormat: json.containsKey('TimestampFormat')
            ? json['TimestampFormat'] as String
            : null,
        dataSource: json.containsKey('DataSource')
            ? DataSource.fromJson(json['DataSource'])
            : null,
        fieldStatistics: json.containsKey('FieldStatistics')
            ? (json['FieldStatistics'] as Map)
                .map((k, v) => MapEntry(k as String, Statistics.fromJson(v)))
            : null,
        dataSize:
            json.containsKey('DataSize') ? json['DataSize'] as double : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribeDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String datasetArn;

  /// The name of the dataset.
  final String datasetName;

  /// The dataset domain.
  final String domain;

  /// The dataset type.
  final String datasetType;

  /// The frequency of data collection.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour),
  /// 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5
  /// minutes), and 1min (1 minute). For example, "M" indicates every month and
  /// "30min" indicates every 30 minutes.
  final String dataFrequency;

  /// An array of `SchemaAttribute` objects that specify the dataset fields.
  /// Each `SchemaAttribute` specifies the name and data type of a field.
  final Schema schema;

  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  final EncryptionConfig encryptionConfig;

  /// The status of the dataset. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  /// *    `UPDATE_PENDING`, `UPDATE_IN_PROGRESS`, `UPDATE_FAILED`
  ///
  ///
  /// The `UPDATE` states apply while data is imported to the dataset from a
  /// call to the CreateDatasetImportJob operation. During this time, the status
  /// reflects the status of the dataset import job. For example, when the
  /// import job status is `CREATE_IN_PROGRESS`, the status of the dataset is
  /// `UPDATE_IN_PROGRESS`.
  ///
  ///
  ///
  /// The `Status` of the dataset must be `ACTIVE` before you can import
  /// training data.
  final String status;

  /// When the dataset was created.
  final DateTime creationTime;

  /// When the dataset is created, `LastModificationTime` is the same as
  /// `CreationTime`. After a CreateDatasetImportJob operation is called,
  /// `LastModificationTime` is when the import job finished or failed. While
  /// data is being imported to the dataset, `LastModificationTime` is the
  /// current query time.
  final DateTime lastModificationTime;

  DescribeDatasetResponse({
    this.datasetArn,
    this.datasetName,
    this.domain,
    this.datasetType,
    this.dataFrequency,
    this.schema,
    this.encryptionConfig,
    this.status,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribeDatasetResponse fromJson(Map<String, dynamic> json) =>
      DescribeDatasetResponse(
        datasetArn: json.containsKey('DatasetArn')
            ? json['DatasetArn'] as String
            : null,
        datasetName: json.containsKey('DatasetName')
            ? json['DatasetName'] as String
            : null,
        domain: json.containsKey('Domain') ? json['Domain'] as String : null,
        datasetType: json.containsKey('DatasetType')
            ? json['DatasetType'] as String
            : null,
        dataFrequency: json.containsKey('DataFrequency')
            ? json['DataFrequency'] as String
            : null,
        schema:
            json.containsKey('Schema') ? Schema.fromJson(json['Schema']) : null,
        encryptionConfig: json.containsKey('EncryptionConfig')
            ? EncryptionConfig.fromJson(json['EncryptionConfig'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribeForecastExportJobResponse {
  /// The ARN of the forecast export job.
  final String forecastExportJobArn;

  /// The name of the forecast export job.
  final String forecastExportJobName;

  /// The Amazon Resource Name (ARN) of the exported forecast.
  final String forecastArn;

  /// The path to the AWS S3 bucket where the forecast is exported.
  final DataDestination destination;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// The status of the forecast export job. One of the following states:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the forecast export job must be `ACTIVE` before you can
  /// access the forecast in your Amazon S3 bucket.
  final String status;

  /// When the forecast export job was created.
  final DateTime creationTime;

  /// When the last successful export job finished.
  final DateTime lastModificationTime;

  DescribeForecastExportJobResponse({
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.forecastArn,
    this.destination,
    this.message,
    this.status,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribeForecastExportJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeForecastExportJobResponse(
        forecastExportJobArn: json.containsKey('ForecastExportJobArn')
            ? json['ForecastExportJobArn'] as String
            : null,
        forecastExportJobName: json.containsKey('ForecastExportJobName')
            ? json['ForecastExportJobName'] as String
            : null,
        forecastArn: json.containsKey('ForecastArn')
            ? json['ForecastArn'] as String
            : null,
        destination: json.containsKey('Destination')
            ? DataDestination.fromJson(json['Destination'])
            : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribeForecastResponse {
  /// The same forecast ARN as given in the request.
  final String forecastArn;

  /// The name of the forecast.
  final String forecastName;

  /// The ARN of the predictor used to generate the forecast.
  final String predictorArn;

  /// The ARN of the dataset group that provided the data used to train the
  /// predictor.
  final String datasetGroupArn;

  /// The status of the forecast. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the forecast must be `ACTIVE` before you can query or
  /// export the forecast.
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the forecast creation task was created.
  final DateTime creationTime;

  /// Initially, the same as `CreationTime` (status is `CREATE_PENDING`).
  /// Updated when inference (creating the forecast) starts (status changed to
  /// `CREATE_IN_PROGRESS`), and when inference is complete (status changed to
  /// `ACTIVE`) or fails (status changed to `CREATE_FAILED`).
  final DateTime lastModificationTime;

  DescribeForecastResponse({
    this.forecastArn,
    this.forecastName,
    this.predictorArn,
    this.datasetGroupArn,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribeForecastResponse fromJson(Map<String, dynamic> json) =>
      DescribeForecastResponse(
        forecastArn: json.containsKey('ForecastArn')
            ? json['ForecastArn'] as String
            : null,
        forecastName: json.containsKey('ForecastName')
            ? json['ForecastName'] as String
            : null,
        predictorArn: json.containsKey('PredictorArn')
            ? json['PredictorArn'] as String
            : null,
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class DescribePredictorResponse {
  /// The ARN of the predictor.
  final String predictorArn;

  /// The name of the predictor.
  final String predictorName;

  /// The Amazon Resource Name (ARN) of the algorithm used for model training.
  final String algorithmArn;

  /// The number of time-steps of the forecast. The forecast horizon is also
  /// called the prediction length.
  final int forecastHorizon;

  /// Whether the predictor is set to perform AutoML.
  final bool performAutoML;

  /// Whether the predictor is set to perform HPO.
  final bool performHpo;

  /// The training parameters to override for model training. The parameters
  /// that you can override are listed in the individual algorithms in
  /// aws-forecast-choosing-recipes.
  final Map<String, String> trainingParameters;

  /// Used to override the default evaluation parameters of the specified
  /// algorithm. Amazon Forecast evaluates a predictor by splitting a dataset
  /// into training data and testing data. The evaluation parameters define how
  /// to perform the split and the number of iterations.
  final EvaluationParameters evaluationParameters;

  /// The hyperparameter override values for the algorithm.
  final HyperParameterTuningJobConfig hpoConfig;

  /// Describes the dataset group that contains the data to use to train the
  /// predictor.
  final InputDataConfig inputDataConfig;

  /// The featurization configuration.
  final FeaturizationConfig featurizationConfig;

  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  final EncryptionConfig encryptionConfig;

  /// An array of ARNs of the dataset import jobs used to import training data
  /// for the predictor.
  final List<String> datasetImportJobArns;

  /// When `PerformAutoML` is specified, the ARN of the chosen algorithm.
  final List<String> autoMLAlgorithmArns;

  /// The status of the predictor. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  /// *    `UPDATE_PENDING`, `UPDATE_IN_PROGRESS`, `UPDATE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the predictor must be `ACTIVE` before using the predictor
  /// to create a forecast.
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the model training task was created.
  final DateTime creationTime;

  /// Initially, the same as `CreationTime` (status is `CREATE_PENDING`).
  /// Updated when training starts (status changed to `CREATE_IN_PROGRESS`), and
  /// when training is complete (status changed to `ACTIVE`) or fails (status
  /// changed to `CREATE_FAILED`).
  final DateTime lastModificationTime;

  DescribePredictorResponse({
    this.predictorArn,
    this.predictorName,
    this.algorithmArn,
    this.forecastHorizon,
    this.performAutoML,
    this.performHpo,
    this.trainingParameters,
    this.evaluationParameters,
    this.hpoConfig,
    this.inputDataConfig,
    this.featurizationConfig,
    this.encryptionConfig,
    this.datasetImportJobArns,
    this.autoMLAlgorithmArns,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static DescribePredictorResponse fromJson(Map<String, dynamic> json) =>
      DescribePredictorResponse(
        predictorArn: json.containsKey('PredictorArn')
            ? json['PredictorArn'] as String
            : null,
        predictorName: json.containsKey('PredictorName')
            ? json['PredictorName'] as String
            : null,
        algorithmArn: json.containsKey('AlgorithmArn')
            ? json['AlgorithmArn'] as String
            : null,
        forecastHorizon: json.containsKey('ForecastHorizon')
            ? json['ForecastHorizon'] as int
            : null,
        performAutoML: json.containsKey('PerformAutoML')
            ? json['PerformAutoML'] as bool
            : null,
        performHpo:
            json.containsKey('PerformHPO') ? json['PerformHPO'] as bool : null,
        trainingParameters: json.containsKey('TrainingParameters')
            ? (json['TrainingParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        evaluationParameters: json.containsKey('EvaluationParameters')
            ? EvaluationParameters.fromJson(json['EvaluationParameters'])
            : null,
        hpoConfig: json.containsKey('HPOConfig')
            ? HyperParameterTuningJobConfig.fromJson(json['HPOConfig'])
            : null,
        inputDataConfig: json.containsKey('InputDataConfig')
            ? InputDataConfig.fromJson(json['InputDataConfig'])
            : null,
        featurizationConfig: json.containsKey('FeaturizationConfig')
            ? FeaturizationConfig.fromJson(json['FeaturizationConfig'])
            : null,
        encryptionConfig: json.containsKey('EncryptionConfig')
            ? EncryptionConfig.fromJson(json['EncryptionConfig'])
            : null,
        datasetImportJobArns: json.containsKey('DatasetImportJobArns')
            ? (json['DatasetImportJobArns'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        autoMLAlgorithmArns: json.containsKey('AutoMLAlgorithmArns')
            ? (json['AutoMLAlgorithmArns'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

/// An AWS Key Management Service (KMS) key and an AWS Identity and Access
/// Management (IAM) role that Amazon Forecast can assume to access the key.
/// This object is optionally submitted in the CreateDataset and CreatePredictor
/// requests.
class EncryptionConfig {
  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the AWS KMS key.
  ///
  /// Cross-account pass role is not allowed. If you pass a role that doesn't
  /// belong to your account, an `InvalidInputException` is thrown.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of an AWS Key Management Service (KMS) key.
  final String kmsKeyArn;

  EncryptionConfig({
    @required this.roleArn,
    @required this.kmsKeyArn,
  });
  static EncryptionConfig fromJson(Map<String, dynamic> json) =>
      EncryptionConfig(
        roleArn: json['RoleArn'] as String,
        kmsKeyArn: json['KMSKeyArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Parameters that define how to split a dataset into training data and testing
/// data, and the number of iterations to perform. These parameters are
/// specified in the predefined algorithms and can be overridden in the
/// CreatePredictor request.
///
/// For example, suppose that you have a dataset with data collection frequency
/// set to every day and you have 200 days worth of data (that is, 200 data
/// points). Now suppose that you set the `NumberOfBacktestWindows` to 2 and the
/// `BackTestWindowOffset` parameter to 20. The algorithm splits the data twice.
/// The first time, the algorithm trains the model using the first 180 data
/// points and uses the last 20 data points for evaluation. The second time, the
/// algorithm trains the model using the first 160 data points and uses the last
/// 40 data points for evaluation.
class EvaluationParameters {
  /// The number of times to split the input data. The default is 1. The range
  /// is 1 through 5.
  final int numberOfBacktestWindows;

  /// The point from the end of the dataset where you want to split the data for
  /// model training and evaluation. The value is specified as the number of
  /// data points.
  final int backTestWindowOffset;

  EvaluationParameters({
    this.numberOfBacktestWindows,
    this.backTestWindowOffset,
  });
  static EvaluationParameters fromJson(Map<String, dynamic> json) =>
      EvaluationParameters(
        numberOfBacktestWindows: json.containsKey('NumberOfBacktestWindows')
            ? json['NumberOfBacktestWindows'] as int
            : null,
        backTestWindowOffset: json.containsKey('BackTestWindowOffset')
            ? json['BackTestWindowOffset'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The results of evaluating an algorithm. Returned as part of the
/// GetAccuracyMetrics response.
class EvaluationResult {
  /// The Amazon Resource Name (ARN) of the algorithm that was evaluated.
  final String algorithmArn;

  /// The array of test windows used for evaluating the algorithm. The
  /// `NumberOfBacktestWindows` from the EvaluationParameters object determines
  /// the number of windows in the array.
  final List<WindowSummary> testWindows;

  EvaluationResult({
    this.algorithmArn,
    this.testWindows,
  });
  static EvaluationResult fromJson(Map<String, dynamic> json) =>
      EvaluationResult(
        algorithmArn: json.containsKey('AlgorithmArn')
            ? json['AlgorithmArn'] as String
            : null,
        testWindows: json.containsKey('TestWindows')
            ? (json['TestWindows'] as List)
                .map((e) => WindowSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// Provides featurization (transformation) information for a dataset field.
/// This object is part of the FeaturizationConfig object.
///
/// For example:
///
///  `{`
///
///  `"AttributeName": "demand",`
///
///  `FeaturizationPipeline [ {`
///
///  `"FeaturizationMethodName": "filling",`
///
///  `"FeaturizationMethodParameters": {"aggregation": "avg", "backfill": "nan"}`
///
///  `} ]`
///
///  `}`
class Featurization {
  /// The name of the schema attribute specifying the data field to be
  /// featurized. In this release, only the `target` field of the
  /// `TARGET_TIME_SERIES` dataset type is supported. For example, for the
  /// `RETAIL` domain, the target is `demand`, and for the `CUSTOM` domain, the
  /// target is `target_value`.
  final String attributeName;

  /// An array `FeaturizationMethod` objects that specifies the feature
  /// transformation methods. For this release, the number of methods is limited
  /// to one.
  final List<FeaturizationMethod> featurizationPipeline;

  Featurization({
    @required this.attributeName,
    this.featurizationPipeline,
  });
  static Featurization fromJson(Map<String, dynamic> json) => Featurization(
        attributeName: json['AttributeName'] as String,
        featurizationPipeline: json.containsKey('FeaturizationPipeline')
            ? (json['FeaturizationPipeline'] as List)
                .map((e) => FeaturizationMethod.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// In a CreatePredictor operation, the specified algorithm trains a model using
/// the specified dataset group. You can optionally tell the operation to modify
/// data fields prior to training a model. These modifications are referred to
/// as _featurization_.
///
/// You define featurization using the `FeaturizationConfig` object. You specify
/// an array of transformations, one for each field that you want to featurize.
/// You then include the `FeaturizationConfig` in your `CreatePredictor`
/// request. Amazon Forecast applies the featurization to the
/// `TARGET_TIME_SERIES` dataset before model training.
///
/// You can create multiple featurization configurations. For example, you might
/// call the `CreatePredictor` operation twice by specifying different
/// featurization configurations.
class FeaturizationConfig {
  /// The frequency of predictions in a forecast.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour),
  /// 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5
  /// minutes), and 1min (1 minute). For example, "Y" indicates every year and
  /// "5min" indicates every five minutes.
  final String forecastFrequency;

  /// An array of dimension (field) names that specify how to group the
  /// generated forecast.
  ///
  /// For example, suppose that you are generating a forecast for item sales
  /// across all of your stores, and your dataset contains a `store_id` field.
  /// If you want the sales forecast for each item by store, you would specify
  /// `store_id` as the dimension.
  final List<String> forecastDimensions;

  /// An array of featurization (transformation) information for the fields of a
  /// dataset. In this release, only a single featurization is supported.
  final List<Featurization> featurizations;

  FeaturizationConfig({
    @required this.forecastFrequency,
    this.forecastDimensions,
    this.featurizations,
  });
  static FeaturizationConfig fromJson(Map<String, dynamic> json) =>
      FeaturizationConfig(
        forecastFrequency: json['ForecastFrequency'] as String,
        forecastDimensions: json.containsKey('ForecastDimensions')
            ? (json['ForecastDimensions'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        featurizations: json.containsKey('Featurizations')
            ? (json['Featurizations'] as List)
                .map((e) => Featurization.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about a method that featurizes (transforms) a dataset
/// field. The method is part of the `FeaturizationPipeline` of the
/// Featurization object. If `FeaturizationMethodParameters` isn't specified,
/// Amazon Forecast uses default parameters.
///
/// For example:
///
///  `{`
///
///  `"FeaturizationMethodName": "filling",`
///
///  `"FeaturizationMethodParameters": {"aggregation": "avg", "backfill":
/// "nan"}`
///
///  `}`
class FeaturizationMethod {
  /// The name of the method. In this release, "filling" is the only supported
  /// method.
  final String featurizationMethodName;

  /// The method parameters (key-value pairs). Specify these to override the
  /// default values. The following list shows the parameters and their valid
  /// values. Bold signifies the default value.
  ///
  /// *    `aggregation`: **sum**, `avg`, `first`, `min`, `max`
  ///
  /// *    `frontfill`: **none**
  ///
  /// *    `middlefill`: **zero**, `nan` (not a number)
  ///
  /// *    `backfill`: **zero**, `nan`
  final Map<String, String> featurizationMethodParameters;

  FeaturizationMethod({
    @required this.featurizationMethodName,
    this.featurizationMethodParameters,
  });
  static FeaturizationMethod fromJson(Map<String, dynamic> json) =>
      FeaturizationMethod(
        featurizationMethodName: json['FeaturizationMethodName'] as String,
        featurizationMethodParameters:
            json.containsKey('FeaturizationMethodParameters')
                ? (json['FeaturizationMethodParameters'] as Map)
                    .map((k, v) => MapEntry(k as String, v as String))
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a filter for choosing a subset of objects. Each filter consists of
/// a condition and a match statement. The condition is either `IS` or `IS_NOT`,
/// which specifies whether to include or exclude, respectively, the objects
/// that match the statement. The match statement consists of a key and a value.
class Filter {
  /// The name of the parameter to filter on.
  final String key;

  /// A valid value for `Key`.
  final String value;

  /// The condition to apply.
  final String condition;

  Filter({
    @required this.key,
    @required this.value,
    @required this.condition,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a summary of the forecast export job properties used in the
/// ListForecastExportJobs operation. To get the complete set of properties,
/// call the DescribeForecastExportJob operation, and provide the listed
/// `ForecastExportJobArn`.
class ForecastExportJobSummary {
  /// The Amazon Resource Name (ARN) of the forecast export job.
  final String forecastExportJobArn;

  /// The name of the forecast export job.
  final String forecastExportJobName;

  /// The path to the S3 bucket where the forecast is stored.
  final DataDestination destination;

  /// The status of the forecast export job. One of the following states:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the forecast export job must be `ACTIVE` before you can
  /// access the forecast in your Amazon S3 bucket.
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the forecast export job was created.
  final DateTime creationTime;

  /// When the last successful export job finished.
  final DateTime lastModificationTime;

  ForecastExportJobSummary({
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.destination,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static ForecastExportJobSummary fromJson(Map<String, dynamic> json) =>
      ForecastExportJobSummary(
        forecastExportJobArn: json.containsKey('ForecastExportJobArn')
            ? json['ForecastExportJobArn'] as String
            : null,
        forecastExportJobName: json.containsKey('ForecastExportJobName')
            ? json['ForecastExportJobName'] as String
            : null,
        destination: json.containsKey('Destination')
            ? DataDestination.fromJson(json['Destination'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

/// Provides a summary of the forecast properties used in the ListForecasts
/// operation. To get the complete set of properties, call the DescribeForecast
/// operation, and provide the listed `ForecastArn`.
class ForecastSummary {
  /// The ARN of the forecast.
  final String forecastArn;

  /// The name of the forecast.
  final String forecastName;

  /// The ARN of the predictor used to generate the forecast.
  final String predictorArn;

  /// The Amazon Resource Name (ARN) of the dataset group that provided the data
  /// used to train the predictor.
  final String datasetGroupArn;

  /// The status of the forecast. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the forecast must be `ACTIVE` before you can query or
  /// export the forecast.
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the forecast creation task was created.
  final DateTime creationTime;

  /// Initially, the same as `CreationTime` (status is `CREATE_PENDING`).
  /// Updated when inference (creating the forecast) starts (status changed to
  /// `CREATE_IN_PROGRESS`), and when inference is complete (status changed to
  /// `ACTIVE`) or fails (status changed to `CREATE_FAILED`).
  final DateTime lastModificationTime;

  ForecastSummary({
    this.forecastArn,
    this.forecastName,
    this.predictorArn,
    this.datasetGroupArn,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static ForecastSummary fromJson(Map<String, dynamic> json) => ForecastSummary(
        forecastArn: json.containsKey('ForecastArn')
            ? json['ForecastArn'] as String
            : null,
        forecastName: json.containsKey('ForecastName')
            ? json['ForecastName'] as String
            : null,
        predictorArn: json.containsKey('PredictorArn')
            ? json['PredictorArn'] as String
            : null,
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

class GetAccuracyMetricsResponse {
  /// An array of results from evaluating the predictor.
  final List<EvaluationResult> predictorEvaluationResults;

  GetAccuracyMetricsResponse({
    this.predictorEvaluationResults,
  });
  static GetAccuracyMetricsResponse fromJson(Map<String, dynamic> json) =>
      GetAccuracyMetricsResponse(
        predictorEvaluationResults:
            json.containsKey('PredictorEvaluationResults')
                ? (json['PredictorEvaluationResults'] as List)
                    .map((e) => EvaluationResult.fromJson(e))
                    .toList()
                : null,
      );
}

/// Configuration information for a hyperparameter tuning job. This object is
/// specified in the CreatePredictor request.
///
/// A hyperparameter is a parameter that governs the model training process and
/// is set before training starts. This is as opposed to a model parameter that
/// is determined during training. The values of the hyperparameters have an
/// effect on the chosen model parameters.
///
/// A hyperparameter tuning job is the process of choosing the optimum set of
/// hyperparameter values that optimize a specified metric. This is accomplished
/// by running many training jobs over a range of hyperparameter values. The
/// optimum set of values is dependent on the algorithm, the training data, and
/// the given metric objective.
class HyperParameterTuningJobConfig {
  /// Specifies the ranges of valid values for the hyperparameters.
  final ParameterRanges parameterRanges;

  HyperParameterTuningJobConfig({
    this.parameterRanges,
  });
  static HyperParameterTuningJobConfig fromJson(Map<String, dynamic> json) =>
      HyperParameterTuningJobConfig(
        parameterRanges: json.containsKey('ParameterRanges')
            ? ParameterRanges.fromJson(json['ParameterRanges'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The data used to train a predictor. The data includes a dataset group and
/// any supplementary features. This object is specified in the CreatePredictor
/// request.
class InputDataConfig {
  /// The Amazon Resource Name (ARN) of the dataset group.
  final String datasetGroupArn;

  /// An array of supplementary features. For this release, the only supported
  /// feature is a holiday calendar.
  final List<SupplementaryFeature> supplementaryFeatures;

  InputDataConfig({
    @required this.datasetGroupArn,
    this.supplementaryFeatures,
  });
  static InputDataConfig fromJson(Map<String, dynamic> json) => InputDataConfig(
        datasetGroupArn: json['DatasetGroupArn'] as String,
        supplementaryFeatures: json.containsKey('SupplementaryFeatures')
            ? (json['SupplementaryFeatures'] as List)
                .map((e) => SupplementaryFeature.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies an integer hyperparameter and it's range of tunable values. This
/// object is part of the ParameterRanges object.
class IntegerParameterRange {
  /// The name of the hyperparameter to tune.
  final String name;

  /// The maximum tunable value of the hyperparameter.
  final int maxValue;

  /// The minimum tunable value of the hyperparameter.
  final int minValue;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see
  /// [Hyperparameter Scaling](http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type).
  /// One of the following values:
  ///
  /// Auto
  ///
  /// Amazon Forecast hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  ///
  /// Linear
  ///
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  ///
  /// Logarithmic
  ///
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have only values greater
  /// than 0.
  ///
  /// ReverseLogarithmic
  ///
  /// Not supported for `IntegerParameterRange`.
  ///
  /// Reverse logarithmic scaling works only for ranges that are entirely within
  /// the range 0 <= x < 1.0.
  final String scalingType;

  IntegerParameterRange({
    @required this.name,
    @required this.maxValue,
    @required this.minValue,
    this.scalingType,
  });
  static IntegerParameterRange fromJson(Map<String, dynamic> json) =>
      IntegerParameterRange(
        name: json['Name'] as String,
        maxValue: json['MaxValue'] as int,
        minValue: json['MinValue'] as int,
        scalingType: json.containsKey('ScalingType')
            ? json['ScalingType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListDatasetGroupsResponse {
  /// An array of objects that summarize each dataset group's properties.
  final List<DatasetGroupSummary> datasetGroups;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListDatasetGroupsResponse({
    this.datasetGroups,
    this.nextToken,
  });
  static ListDatasetGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetGroupsResponse(
        datasetGroups: json.containsKey('DatasetGroups')
            ? (json['DatasetGroups'] as List)
                .map((e) => DatasetGroupSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListDatasetImportJobsResponse {
  /// An array of objects that summarize each dataset import job's properties.
  final List<DatasetImportJobSummary> datasetImportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListDatasetImportJobsResponse({
    this.datasetImportJobs,
    this.nextToken,
  });
  static ListDatasetImportJobsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetImportJobsResponse(
        datasetImportJobs: json.containsKey('DatasetImportJobs')
            ? (json['DatasetImportJobs'] as List)
                .map((e) => DatasetImportJobSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListDatasetsResponse {
  /// An array of objects that summarize each dataset's properties.
  final List<DatasetSummary> datasets;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });
  static ListDatasetsResponse fromJson(Map<String, dynamic> json) =>
      ListDatasetsResponse(
        datasets: json.containsKey('Datasets')
            ? (json['Datasets'] as List)
                .map((e) => DatasetSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListForecastExportJobsResponse {
  /// An array of objects that summarize each export job's properties.
  final List<ForecastExportJobSummary> forecastExportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListForecastExportJobsResponse({
    this.forecastExportJobs,
    this.nextToken,
  });
  static ListForecastExportJobsResponse fromJson(Map<String, dynamic> json) =>
      ListForecastExportJobsResponse(
        forecastExportJobs: json.containsKey('ForecastExportJobs')
            ? (json['ForecastExportJobs'] as List)
                .map((e) => ForecastExportJobSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListForecastsResponse {
  /// An array of objects that summarize each forecast's properties.
  final List<ForecastSummary> forecasts;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListForecastsResponse({
    this.forecasts,
    this.nextToken,
  });
  static ListForecastsResponse fromJson(Map<String, dynamic> json) =>
      ListForecastsResponse(
        forecasts: json.containsKey('Forecasts')
            ? (json['Forecasts'] as List)
                .map((e) => ForecastSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListPredictorsResponse {
  /// An array of objects that summarize each predictor's properties.
  final List<PredictorSummary> predictors;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  final String nextToken;

  ListPredictorsResponse({
    this.predictors,
    this.nextToken,
  });
  static ListPredictorsResponse fromJson(Map<String, dynamic> json) =>
      ListPredictorsResponse(
        predictors: json.containsKey('Predictors')
            ? (json['Predictors'] as List)
                .map((e) => PredictorSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Provides metrics used to evaluate the performance of a predictor. This
/// object is part of the WindowSummary object.
class Metrics {
  /// The root mean square error (RMSE).
  final double rmse;

  /// An array of weighted quantile losses. Quantiles divide a probability
  /// distribution into regions of equal probability. The distribution in this
  /// case is the loss function.
  final List<WeightedQuantileLoss> weightedQuantileLosses;

  Metrics({
    this.rmse,
    this.weightedQuantileLosses,
  });
  static Metrics fromJson(Map<String, dynamic> json) => Metrics(
        rmse: json.containsKey('RMSE') ? json['RMSE'] as double : null,
        weightedQuantileLosses: json.containsKey('WeightedQuantileLosses')
            ? (json['WeightedQuantileLosses'] as List)
                .map((e) => WeightedQuantileLoss.fromJson(e))
                .toList()
            : null,
      );
}

/// Specifies the categorical, continuous, and integer hyperparameters, and
/// their ranges of tunable values. The range of tunable values determines which
/// values that a hyperparameter tuning job can choose for the specified
/// hyperparameter. This object is part of the HyperParameterTuningJobConfig
/// object.
class ParameterRanges {
  /// Specifies the tunable range for each categorical hyperparameter.
  final List<CategoricalParameterRange> categoricalParameterRanges;

  /// Specifies the tunable range for each continuous hyperparameter.
  final List<ContinuousParameterRange> continuousParameterRanges;

  /// Specifies the tunable range for each integer hyperparameter.
  final List<IntegerParameterRange> integerParameterRanges;

  ParameterRanges({
    this.categoricalParameterRanges,
    this.continuousParameterRanges,
    this.integerParameterRanges,
  });
  static ParameterRanges fromJson(Map<String, dynamic> json) => ParameterRanges(
        categoricalParameterRanges:
            json.containsKey('CategoricalParameterRanges')
                ? (json['CategoricalParameterRanges'] as List)
                    .map((e) => CategoricalParameterRange.fromJson(e))
                    .toList()
                : null,
        continuousParameterRanges: json.containsKey('ContinuousParameterRanges')
            ? (json['ContinuousParameterRanges'] as List)
                .map((e) => ContinuousParameterRange.fromJson(e))
                .toList()
            : null,
        integerParameterRanges: json.containsKey('IntegerParameterRanges')
            ? (json['IntegerParameterRanges'] as List)
                .map((e) => IntegerParameterRange.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a summary of the predictor properties used in the ListPredictors
/// operation. To get the complete set of properties, call the DescribePredictor
/// operation, and provide the listed `PredictorArn`.
class PredictorSummary {
  /// The ARN of the predictor.
  final String predictorArn;

  /// The name of the predictor.
  final String predictorName;

  /// The Amazon Resource Name (ARN) of the dataset group that contains the data
  /// used to train the predictor.
  final String datasetGroupArn;

  /// The status of the predictor. States include:
  ///
  /// *    `ACTIVE`
  ///
  /// *    `CREATE_PENDING`, `CREATE_IN_PROGRESS`, `CREATE_FAILED`
  ///
  /// *    `DELETE_PENDING`, `DELETE_IN_PROGRESS`, `DELETE_FAILED`
  ///
  /// *    `UPDATE_PENDING`, `UPDATE_IN_PROGRESS`, `UPDATE_FAILED`
  ///
  ///
  ///
  ///
  /// The `Status` of the predictor must be `ACTIVE` before using the predictor
  /// to create a forecast.
  final String status;

  /// If an error occurred, an informational message about the error.
  final String message;

  /// When the model training task was created.
  final DateTime creationTime;

  /// Initially, the same as `CreationTime` (status is `CREATE_PENDING`).
  /// Updated when training starts (status changed to `CREATE_IN_PROGRESS`), and
  /// when training is complete (status changed to `ACTIVE`) or fails (status
  /// changed to `CREATE_FAILED`).
  final DateTime lastModificationTime;

  PredictorSummary({
    this.predictorArn,
    this.predictorName,
    this.datasetGroupArn,
    this.status,
    this.message,
    this.creationTime,
    this.lastModificationTime,
  });
  static PredictorSummary fromJson(Map<String, dynamic> json) =>
      PredictorSummary(
        predictorArn: json.containsKey('PredictorArn')
            ? json['PredictorArn'] as String
            : null,
        predictorName: json.containsKey('PredictorName')
            ? json['PredictorName'] as String
            : null,
        datasetGroupArn: json.containsKey('DatasetGroupArn')
            ? json['DatasetGroupArn'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModificationTime: json.containsKey('LastModificationTime')
            ? DateTime.parse(json['LastModificationTime'])
            : null,
      );
}

/// The path to the file(s) in an Amazon Simple Storage Service (Amazon S3)
/// bucket, and an AWS Identity and Access Management (IAM) role that Amazon
/// Forecast can assume to access the file(s). Optionally, includes an AWS Key
/// Management Service (KMS) key. This object is submitted in the
/// CreateDatasetImportJob and CreateForecastExportJob requests.
class S3Config {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s)
  /// in an Amazon S3 bucket.
  final String path;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket or file(s).
  ///
  /// Cross-account pass role is not allowed. If you pass a role that doesn't
  /// belong to your account, an `InvalidInputException` is thrown.
  final String roleArn;

  /// The Amazon Resource Name (ARN) of an AWS Key Management Service (KMS) key.
  final String kmsKeyArn;

  S3Config({
    @required this.path,
    @required this.roleArn,
    this.kmsKeyArn,
  });
  static S3Config fromJson(Map<String, dynamic> json) => S3Config(
        path: json['Path'] as String,
        roleArn: json['RoleArn'] as String,
        kmsKeyArn:
            json.containsKey('KMSKeyArn') ? json['KMSKeyArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the fields of a dataset. This object is specified in the
/// CreateDataset request.
class Schema {
  /// An array of attributes specifying the name and type of each field in a
  /// dataset.
  final List<SchemaAttribute> attributes;

  Schema({
    this.attributes,
  });
  static Schema fromJson(Map<String, dynamic> json) => Schema(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as List)
                .map((e) => SchemaAttribute.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An attribute of a schema, which defines a field of a dataset. A schema
/// attribute is required for every field in a dataset. The Schema object
/// contains an array of `SchemaAttribute` objects.
class SchemaAttribute {
  /// The name of the dataset field.
  final String attributeName;

  /// The data type of the field.
  final String attributeType;

  SchemaAttribute({
    this.attributeName,
    this.attributeType,
  });
  static SchemaAttribute fromJson(Map<String, dynamic> json) => SchemaAttribute(
        attributeName: json.containsKey('AttributeName')
            ? json['AttributeName'] as String
            : null,
        attributeType: json.containsKey('AttributeType')
            ? json['AttributeType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides statistics for each data field imported to an Amazon Forecast
/// dataset with the CreateDatasetImportJob operation.
class Statistics {
  /// The number of values in the field.
  final int count;

  /// The number of distinct values in the field.
  final int countDistinct;

  /// The number of null values in the field.
  final int countNull;

  /// The number of NAN (not a number) values in the field.
  final int countNan;

  /// For a numeric field, the minimum value in the field.
  final String min;

  /// For a numeric field, the maximum value in the field.
  final String max;

  /// For a numeric field, the average value in the field.
  final double avg;

  /// For a numeric field, the standard deviation.
  final double stddev;

  Statistics({
    this.count,
    this.countDistinct,
    this.countNull,
    this.countNan,
    this.min,
    this.max,
    this.avg,
    this.stddev,
  });
  static Statistics fromJson(Map<String, dynamic> json) => Statistics(
        count: json.containsKey('Count') ? json['Count'] as int : null,
        countDistinct: json.containsKey('CountDistinct')
            ? json['CountDistinct'] as int
            : null,
        countNull:
            json.containsKey('CountNull') ? json['CountNull'] as int : null,
        countNan: json.containsKey('CountNan') ? json['CountNan'] as int : null,
        min: json.containsKey('Min') ? json['Min'] as String : null,
        max: json.containsKey('Max') ? json['Max'] as String : null,
        avg: json.containsKey('Avg') ? json['Avg'] as double : null,
        stddev: json.containsKey('Stddev') ? json['Stddev'] as double : null,
      );
}

/// Describes a supplementary feature of a dataset group. This object is part of
/// the InputDataConfig object.
///
/// For this release, the only supported feature is a holiday calendar. If the
/// calendar is used, all data should belong to the same country as the
/// calendar. For the calendar data, see
/// [http://jollyday.sourceforge.net/data.html](http://jollyday.sourceforge.net/data.html).
class SupplementaryFeature {
  /// The name of the feature. This must be "holiday".
  final String name;

  /// One of the following 2 letter country codes:
  ///
  /// *   "AU" - AUSTRALIA
  ///
  /// *   "DE" - GERMANY
  ///
  /// *   "JP" - JAPAN
  ///
  /// *   "US" - UNITED_STATES
  ///
  /// *   "UK" - UNITED_KINGDOM
  final String value;

  SupplementaryFeature({
    @required this.name,
    @required this.value,
  });
  static SupplementaryFeature fromJson(Map<String, dynamic> json) =>
      SupplementaryFeature(
        name: json['Name'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateDatasetGroupResponse {
  UpdateDatasetGroupResponse();
  static UpdateDatasetGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateDatasetGroupResponse();
}

/// The weighted loss value for a quantile. This object is part of the Metrics
/// object.
class WeightedQuantileLoss {
  /// The quantile. Quantiles divide a probability distribution into regions of
  /// equal probability. For example, if the distribution was divided into 5
  /// regions of equal probability, the quantiles would be 0.2, 0.4, 0.6, and
  /// 0.8.
  final double quantile;

  /// The difference between the predicted value and actual value over the
  /// quantile, weighted (normalized) by dividing by the sum over all quantiles.
  final double lossValue;

  WeightedQuantileLoss({
    this.quantile,
    this.lossValue,
  });
  static WeightedQuantileLoss fromJson(Map<String, dynamic> json) =>
      WeightedQuantileLoss(
        quantile:
            json.containsKey('Quantile') ? json['Quantile'] as double : null,
        lossValue:
            json.containsKey('LossValue') ? json['LossValue'] as double : null,
      );
}

/// The metrics for a time range within the evaluation portion of a dataset.
/// This object is part of the EvaluationResult object.
///
/// The `TestWindowStart` and `TestWindowEnd` parameters are determined by the
/// `BackTestWindowOffset` parameter of the EvaluationParameters object.
class WindowSummary {
  /// The timestamp that defines the start of the window.
  final DateTime testWindowStart;

  /// The timestamp that defines the end of the window.
  final DateTime testWindowEnd;

  /// The number of data points within the window.
  final int itemCount;

  /// The type of evaluation.
  ///
  /// *    `SUMMARY` - The average metrics across all windows.
  ///
  /// *    `COMPUTED` - The metrics for the specified window.
  final String evaluationType;

  final Metrics metrics;

  WindowSummary({
    this.testWindowStart,
    this.testWindowEnd,
    this.itemCount,
    this.evaluationType,
    this.metrics,
  });
  static WindowSummary fromJson(Map<String, dynamic> json) => WindowSummary(
        testWindowStart: json.containsKey('TestWindowStart')
            ? DateTime.parse(json['TestWindowStart'])
            : null,
        testWindowEnd: json.containsKey('TestWindowEnd')
            ? DateTime.parse(json['TestWindowEnd'])
            : null,
        itemCount:
            json.containsKey('ItemCount') ? json['ItemCount'] as int : null,
        evaluationType: json.containsKey('EvaluationType')
            ? json['EvaluationType'] as String
            : null,
        metrics: json.containsKey('Metrics')
            ? Metrics.fromJson(json['Metrics'])
            : null,
      );
}
