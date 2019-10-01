import 'package:meta/meta.dart';

/// Definition of the public APIs exposed by Amazon Machine Learning
class MachineLearningApi {
  /// Adds one or more tags to an object, up to a limit of 10. Each tag consists
  /// of a key and an optional value. If you add a tag using a key that is
  /// already associated with the ML object, `AddTags` updates the tag's value.
  ///
  /// [tags]: The key-value pairs to use to create tags. If you specify a key
  /// without specifying a value, Amazon ML creates a tag with the specified key
  /// and a value of null.
  ///
  /// [resourceId]: The ID of the ML object to tag. For example,
  /// `exampleModelId`.
  ///
  /// [resourceType]: The type of the ML object to tag.
  Future<AddTagsOutput> addTags(
      {@required List<Tag> tags,
      @required String resourceId,
      @required String resourceType}) async {
    return AddTagsOutput.fromJson({});
  }

  /// Generates predictions for a group of observations. The observations to
  /// process exist in one or more data files referenced by a `DataSource`. This
  /// operation creates a new `BatchPrediction`, and uses an `MLModel` and the
  /// data files referenced by the `DataSource` as information sources.
  ///
  /// `CreateBatchPrediction` is an asynchronous operation. In response to
  /// `CreateBatchPrediction`, Amazon Machine Learning (Amazon ML) immediately
  /// returns and sets the `BatchPrediction` status to `PENDING`. After the
  /// `BatchPrediction` completes, Amazon ML sets the status to `COMPLETED`.
  ///
  /// You can poll for status updates by using the GetBatchPrediction operation
  /// and checking the `Status` parameter of the result. After the `COMPLETED`
  /// status appears, the results are available in the location specified by the
  /// `OutputUri` parameter.
  ///
  /// [batchPredictionId]: A user-supplied ID that uniquely identifies the
  /// `BatchPrediction`.
  ///
  /// [batchPredictionName]: A user-supplied name or description of the
  /// `BatchPrediction`. `BatchPredictionName` can only use the UTF-8 character
  /// set.
  ///
  /// [mlModelId]: The ID of the `MLModel` that will generate predictions for
  /// the group of observations.
  ///
  /// [batchPredictionDataSourceId]: The ID of the `DataSource` that points to
  /// the group of observations to predict.
  ///
  /// [outputUri]: The location of an Amazon Simple Storage Service (Amazon S3)
  /// bucket or directory to store the batch prediction results. The following
  /// substrings are not allowed in the `s3 key` portion of the `outputURI`
  /// field: ':', '//', '/./', '/../'.
  ///
  /// Amazon ML needs permissions to store and retrieve the logs on your behalf.
  /// For information about how to set permissions, see the
  /// [Amazon Machine Learning Developer Guide](http://docs.aws.amazon.com/machine-learning/latest/dg).
  Future<CreateBatchPredictionOutput> createBatchPrediction(
      {@required String batchPredictionId,
      String batchPredictionName,
      @required String mlModelId,
      @required String batchPredictionDataSourceId,
      @required String outputUri}) async {
    return CreateBatchPredictionOutput.fromJson({});
  }

  /// Creates a `DataSource` object from an
  /// [Amazon Relational Database Service](http://aws.amazon.com/rds/) (Amazon
  /// RDS). A `DataSource` references data that can be used to perform
  /// `CreateMLModel`, `CreateEvaluation`, or `CreateBatchPrediction`
  /// operations.
  ///
  /// `CreateDataSourceFromRDS` is an asynchronous operation. In response to
  /// `CreateDataSourceFromRDS`, Amazon Machine Learning (Amazon ML) immediately
  /// returns and sets the `DataSource` status to `PENDING`. After the
  /// `DataSource` is created and ready for use, Amazon ML sets the `Status`
  /// parameter to `COMPLETED`. `DataSource` in the `COMPLETED` or `PENDING`
  /// state can be used only to perform `>CreateMLModel`>, `CreateEvaluation`,
  /// or `CreateBatchPrediction` operations.
  ///
  ///  If Amazon ML cannot accept the input source, it sets the `Status`
  /// parameter to `FAILED` and includes an error message in the `Message`
  /// attribute of the `GetDataSource` operation response.
  ///
  /// [dataSourceId]: A user-supplied ID that uniquely identifies the
  /// `DataSource`. Typically, an Amazon Resource Number (ARN) becomes the ID
  /// for a `DataSource`.
  ///
  /// [dataSourceName]: A user-supplied name or description of the `DataSource`.
  ///
  /// [rdsData]: The data specification of an Amazon RDS `DataSource`:
  ///
  /// *   DatabaseInformation -
  ///
  ///     *    `DatabaseName` - The name of the Amazon RDS database.
  ///     *    `InstanceIdentifier`  - A unique identifier for the Amazon RDS
  /// database instance.
  ///
  /// *   DatabaseCredentials - AWS Identity and Access Management (IAM)
  /// credentials that are used to connect to the Amazon RDS database.
  ///
  /// *   ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an
  /// EC2 instance to carry out the copy task from Amazon RDS to Amazon Simple
  /// Storage Service (Amazon S3). For more information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  ///
  /// *   ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data
  /// Pipeline service to monitor the progress of the copy task from Amazon RDS
  /// to Amazon S3. For more information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  ///
  /// *   SecurityInfo - The security information to use to access an RDS DB
  /// instance. You need to set up appropriate ingress rules for the security
  /// entity IDs provided to allow access to the Amazon RDS instance. Specify a
  /// [`SubnetId`, `SecurityGroupIds`] pair for a VPC-based RDS DB instance.
  ///
  /// *   SelectSqlQuery - A query that is used to retrieve the observation data
  /// for the `Datasource`.
  ///
  /// *   S3StagingLocation - The Amazon S3 location for staging Amazon RDS
  /// data. The data retrieved from Amazon RDS using `SelectSqlQuery` is stored
  /// in this location.
  ///
  /// *   DataSchemaUri - The Amazon S3 location of the `DataSchema`.
  ///
  /// *   DataSchema - A JSON string representing the schema. This is not
  /// required if `DataSchemaUri` is specified.
  ///
  /// *   DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the `Datasource`.
  ///
  ///
  ///
  ///      Sample -  `"{"splitting":{"percentBegin":10,"percentEnd":60}}"`
  ///
  /// [roleArn]: The role that Amazon ML assumes on behalf of the user to create
  /// and activate a data pipeline in the user's account and copy data using the
  /// `SelectSqlQuery` query from Amazon RDS to Amazon S3.
  ///
  /// [computeStatistics]: The compute statistics for a `DataSource`. The
  /// statistics are generated from the observation data referenced by a
  /// `DataSource`. Amazon ML uses the statistics internally during `MLModel`
  /// training. This parameter must be set to `true` if the DataSource needs to
  /// be used for `MLModel` training.
  Future<CreateDataSourceFromRdsOutput> createDataSourceFromRds(
      {@required String dataSourceId,
      String dataSourceName,
      @required RdsDataSpec rdsData,
      @required String roleArn,
      bool computeStatistics}) async {
    return CreateDataSourceFromRdsOutput.fromJson({});
  }

  /// Creates a `DataSource` from a database hosted on an Amazon Redshift
  /// cluster. A `DataSource` references data that can be used to perform either
  /// `CreateMLModel`, `CreateEvaluation`, or `CreateBatchPrediction`
  /// operations.
  ///
  /// `CreateDataSourceFromRedshift` is an asynchronous operation. In response
  /// to `CreateDataSourceFromRedshift`, Amazon Machine Learning (Amazon ML)
  /// immediately returns and sets the `DataSource` status to `PENDING`. After
  /// the `DataSource` is created and ready for use, Amazon ML sets the `Status`
  /// parameter to `COMPLETED`. `DataSource` in `COMPLETED` or `PENDING` states
  /// can be used to perform only `CreateMLModel`, `CreateEvaluation`, or
  /// `CreateBatchPrediction` operations.
  ///
  ///  If Amazon ML can't accept the input source, it sets the `Status`
  /// parameter to `FAILED` and includes an error message in the `Message`
  /// attribute of the `GetDataSource` operation response.
  ///
  /// The observations should be contained in the database hosted on an Amazon
  /// Redshift cluster and should be specified by a `SelectSqlQuery` query.
  /// Amazon ML executes an `Unload` command in Amazon Redshift to transfer the
  /// result set of the `SelectSqlQuery` query to `S3StagingLocation`.
  ///
  /// After the `DataSource` has been created, it's ready for use in evaluations
  /// and batch predictions. If you plan to use the `DataSource` to train an
  /// `MLModel`, the `DataSource` also requires a recipe. A recipe describes how
  /// each input variable will be used in training an `MLModel`. Will the
  /// variable be included or excluded from training? Will the variable be
  /// manipulated; for example, will it be combined with another variable or
  /// will it be split apart into word combinations? The recipe provides answers
  /// to these questions.
  ///
  /// You can't change an existing datasource, but you can copy and modify the
  /// settings from an existing Amazon Redshift datasource to create a new
  /// datasource. To do so, call `GetDataSource` for an existing datasource and
  /// copy the values to a `CreateDataSource` call. Change the settings that you
  /// want to change and make sure that all required fields have the appropriate
  /// values.
  ///
  /// [dataSourceId]: A user-supplied ID that uniquely identifies the
  /// `DataSource`.
  ///
  /// [dataSourceName]: A user-supplied name or description of the `DataSource`.
  ///
  /// [dataSpec]: The data specification of an Amazon Redshift `DataSource`:
  ///
  /// *   DatabaseInformation -
  ///
  ///     *    `DatabaseName` - The name of the Amazon Redshift database.
  ///     *     `ClusterIdentifier` - The unique ID for the Amazon Redshift
  /// cluster.
  ///
  /// *   DatabaseCredentials - The AWS Identity and Access Management (IAM)
  /// credentials that are used to connect to the Amazon Redshift database.
  ///
  /// *   SelectSqlQuery - The query that is used to retrieve the observation
  /// data for the `Datasource`.
  ///
  /// *   S3StagingLocation - The Amazon Simple Storage Service (Amazon S3)
  /// location for staging Amazon Redshift data. The data retrieved from Amazon
  /// Redshift using the `SelectSqlQuery` query is stored in this location.
  ///
  /// *   DataSchemaUri - The Amazon S3 location of the `DataSchema`.
  ///
  /// *   DataSchema - A JSON string representing the schema. This is not
  /// required if `DataSchemaUri` is specified.
  ///
  /// *   DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the `DataSource`.
  ///
  ///      Sample -  `"{"splitting":{"percentBegin":10,"percentEnd":60}}"`
  ///
  /// [roleArn]: A fully specified role Amazon Resource Name (ARN). Amazon ML
  /// assumes the role on behalf of the user to create the following:
  ///
  /// *   A security group to allow Amazon ML to execute the `SelectSqlQuery`
  /// query on an Amazon Redshift cluster
  ///
  /// *   An Amazon S3 bucket policy to grant Amazon ML read/write permissions
  /// on the `S3StagingLocation`
  ///
  /// [computeStatistics]: The compute statistics for a `DataSource`. The
  /// statistics are generated from the observation data referenced by a
  /// `DataSource`. Amazon ML uses the statistics internally during `MLModel`
  /// training. This parameter must be set to `true` if the `DataSource` needs
  /// to be used for `MLModel` training.
  Future<CreateDataSourceFromRedshiftOutput> createDataSourceFromRedshift(
      {@required String dataSourceId,
      String dataSourceName,
      @required RedshiftDataSpec dataSpec,
      @required String roleArn,
      bool computeStatistics}) async {
    return CreateDataSourceFromRedshiftOutput.fromJson({});
  }

  /// Creates a `DataSource` object. A `DataSource` references data that can be
  /// used to perform `CreateMLModel`, `CreateEvaluation`, or
  /// `CreateBatchPrediction` operations.
  ///
  /// `CreateDataSourceFromS3` is an asynchronous operation. In response to
  /// `CreateDataSourceFromS3`, Amazon Machine Learning (Amazon ML) immediately
  /// returns and sets the `DataSource` status to `PENDING`. After the
  /// `DataSource` has been created and is ready for use, Amazon ML sets the
  /// `Status` parameter to `COMPLETED`. `DataSource` in the `COMPLETED` or
  /// `PENDING` state can be used to perform only `CreateMLModel`,
  /// `CreateEvaluation` or `CreateBatchPrediction` operations.
  ///
  ///  If Amazon ML can't accept the input source, it sets the `Status`
  /// parameter to `FAILED` and includes an error message in the `Message`
  /// attribute of the `GetDataSource` operation response.
  ///
  /// The observation data used in a `DataSource` should be ready to use; that
  /// is, it should have a consistent structure, and missing data values should
  /// be kept to a minimum. The observation data must reside in one or more .csv
  /// files in an Amazon Simple Storage Service (Amazon S3) location, along with
  /// a schema that describes the data items by name and type. The same schema
  /// must be used for all of the data files referenced by the `DataSource`.
  ///
  /// After the `DataSource` has been created, it's ready to use in evaluations
  /// and batch predictions. If you plan to use the `DataSource` to train an
  /// `MLModel`, the `DataSource` also needs a recipe. A recipe describes how
  /// each input variable will be used in training an `MLModel`. Will the
  /// variable be included or excluded from training? Will the variable be
  /// manipulated; for example, will it be combined with another variable or
  /// will it be split apart into word combinations? The recipe provides answers
  /// to these questions.
  ///
  /// [dataSourceId]: A user-supplied identifier that uniquely identifies the
  /// `DataSource`.
  ///
  /// [dataSourceName]: A user-supplied name or description of the `DataSource`.
  ///
  /// [dataSpec]: The data specification of a `DataSource`:
  ///
  /// *   DataLocationS3 - The Amazon S3 location of the observation data.
  ///
  /// *   DataSchemaLocationS3 - The Amazon S3 location of the `DataSchema`.
  ///
  /// *   DataSchema - A JSON string representing the schema. This is not
  /// required if `DataSchemaUri` is specified.
  ///
  /// *   DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the `Datasource`.
  ///
  ///      Sample -  `"{"splitting":{"percentBegin":10,"percentEnd":60}}"`
  ///
  /// [computeStatistics]: The compute statistics for a `DataSource`. The
  /// statistics are generated from the observation data referenced by a
  /// `DataSource`. Amazon ML uses the statistics internally during `MLModel`
  /// training. This parameter must be set to `true` if the DataSource needs to
  /// be used for `MLModel` training.
  Future<CreateDataSourceFromS3Output> createDataSourceFromS3(
      {@required String dataSourceId,
      String dataSourceName,
      @required S3DataSpec dataSpec,
      bool computeStatistics}) async {
    return CreateDataSourceFromS3Output.fromJson({});
  }

  /// Creates a new `Evaluation` of an `MLModel`. An `MLModel` is evaluated on a
  /// set of observations associated to a `DataSource`. Like a `DataSource` for
  /// an `MLModel`, the `DataSource` for an `Evaluation` contains values for the
  /// `Target Variable`. The `Evaluation` compares the predicted result for each
  /// observation to the actual outcome and provides a summary so that you know
  /// how effective the `MLModel` functions on the test data. Evaluation
  /// generates a relevant performance metric, such as BinaryAUC, RegressionRMSE
  /// or MulticlassAvgFScore based on the corresponding `MLModelType`: `BINARY`,
  /// `REGRESSION` or `MULTICLASS`.
  ///
  /// `CreateEvaluation` is an asynchronous operation. In response to
  /// `CreateEvaluation`, Amazon Machine Learning (Amazon ML) immediately
  /// returns and sets the evaluation status to `PENDING`. After the
  /// `Evaluation` is created and ready for use, Amazon ML sets the status to
  /// `COMPLETED`.
  ///
  /// You can use the `GetEvaluation` operation to check progress of the
  /// evaluation during the creation operation.
  ///
  /// [evaluationId]: A user-supplied ID that uniquely identifies the
  /// `Evaluation`.
  ///
  /// [evaluationName]: A user-supplied name or description of the `Evaluation`.
  ///
  /// [mlModelId]: The ID of the `MLModel` to evaluate.
  ///
  /// The schema used in creating the `MLModel` must match the schema of the
  /// `DataSource` used in the `Evaluation`.
  ///
  /// [evaluationDataSourceId]: The ID of the `DataSource` for the evaluation.
  /// The schema of the `DataSource` must match the schema used to create the
  /// `MLModel`.
  Future<CreateEvaluationOutput> createEvaluation(
      {@required String evaluationId,
      String evaluationName,
      @required String mlModelId,
      @required String evaluationDataSourceId}) async {
    return CreateEvaluationOutput.fromJson({});
  }

  /// Creates a new `MLModel` using the `DataSource` and the recipe as
  /// information sources.
  ///
  /// An `MLModel` is nearly immutable. Users can update only the `MLModelName`
  /// and the `ScoreThreshold` in an `MLModel` without creating a new `MLModel`.
  ///
  /// `CreateMLModel` is an asynchronous operation. In response to
  /// `CreateMLModel`, Amazon Machine Learning (Amazon ML) immediately returns
  /// and sets the `MLModel` status to `PENDING`. After the `MLModel` has been
  /// created and ready is for use, Amazon ML sets the status to `COMPLETED`.
  ///
  /// You can use the `GetMLModel` operation to check the progress of the
  /// `MLModel` during the creation operation.
  ///
  ///  `CreateMLModel` requires a `DataSource` with computed statistics, which
  /// can be created by setting `ComputeStatistics` to `true` in
  /// `CreateDataSourceFromRDS`, `CreateDataSourceFromS3`, or
  /// `CreateDataSourceFromRedshift` operations.
  ///
  /// [mlModelId]: A user-supplied ID that uniquely identifies the `MLModel`.
  ///
  /// [mlModelName]: A user-supplied name or description of the `MLModel`.
  ///
  /// [mlModelType]: The category of supervised learning that this `MLModel`
  /// will address. Choose from the following types:
  ///
  /// *   Choose `REGRESSION` if the `MLModel` will be used to predict a numeric
  /// value.
  /// *   Choose `BINARY` if the `MLModel` result has two possible values.
  /// *   Choose `MULTICLASS` if the `MLModel` result has a limited number of
  /// values.
  ///
  ///  For more information, see the
  /// [Amazon Machine Learning Developer Guide](http://docs.aws.amazon.com/machine-learning/latest/dg).
  ///
  /// [parameters]: A list of the training parameters in the `MLModel`. The list
  /// is implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// *   `sgd.maxMLModelSizeInBytes` - The maximum allowed size of the model.
  /// Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  ///      The value is an integer that ranges from `100000` to `2147483648`.
  /// The default value is `33554432`.
  ///
  /// *   `sgd.maxPasses` - The number of times that the training process
  /// traverses the observations to build the `MLModel`. The value is an integer
  /// that ranges from `1` to `10000`. The default value is `10`.
  ///
  /// *   `sgd.shuffleType` - Whether Amazon ML shuffles the training data.
  /// Shuffling the data improves a model's ability to find the optimal solution
  /// for a variety of data types. The valid values are `auto` and `none`. The
  /// default value is `none`. We strongly recommend that you shuffle your data.
  ///
  /// *   `sgd.l1RegularizationAmount` - The coefficient regularization L1 norm.
  /// It controls overfitting the data by penalizing large coefficients. This
  /// tends to drive coefficients to zero, resulting in a sparse feature set. If
  /// you use this parameter, start by specifying a small value, such as
  /// `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L1 normalization. This parameter can't be used when
  /// `L2` is specified. Use this parameter sparingly.
  ///
  /// *   `sgd.l2RegularizationAmount` - The coefficient regularization L2 norm.
  /// It controls overfitting the data by penalizing large coefficients. This
  /// tends to drive coefficients to small, nonzero values. If you use this
  /// parameter, start by specifying a small value, such as `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L2 normalization. This parameter can't be used when
  /// `L1` is specified. Use this parameter sparingly.
  ///
  /// [trainingDataSourceId]: The `DataSource` that points to the training data.
  ///
  /// [recipe]: The data recipe for creating the `MLModel`. You must specify
  /// either the recipe or its URI. If you don't specify a recipe or its URI,
  /// Amazon ML creates a default.
  ///
  /// [recipeUri]: The Amazon Simple Storage Service (Amazon S3) location and
  /// file name that contains the `MLModel` recipe. You must specify either the
  /// recipe or its URI. If you don't specify a recipe or its URI, Amazon ML
  /// creates a default.
  Future<CreateMLModelOutput> createMLModel(
      {@required String mlModelId,
      String mlModelName,
      @required String mlModelType,
      Map<String, String> parameters,
      @required String trainingDataSourceId,
      String recipe,
      String recipeUri}) async {
    return CreateMLModelOutput.fromJson({});
  }

  /// Creates a real-time endpoint for the `MLModel`. The endpoint contains the
  /// URI of the `MLModel`; that is, the location to send real-time prediction
  /// requests for the specified `MLModel`.
  ///
  /// [mlModelId]: The ID assigned to the `MLModel` during creation.
  Future<CreateRealtimeEndpointOutput> createRealtimeEndpoint(
      String mlModelId) async {
    return CreateRealtimeEndpointOutput.fromJson({});
  }

  /// Assigns the DELETED status to a `BatchPrediction`, rendering it unusable.
  ///
  /// After using the `DeleteBatchPrediction` operation, you can use the
  /// GetBatchPrediction operation to verify that the status of the
  /// `BatchPrediction` changed to DELETED.
  ///
  /// **Caution:** The result of the `DeleteBatchPrediction` operation is
  /// irreversible.
  ///
  /// [batchPredictionId]: A user-supplied ID that uniquely identifies the
  /// `BatchPrediction`.
  Future<DeleteBatchPredictionOutput> deleteBatchPrediction(
      String batchPredictionId) async {
    return DeleteBatchPredictionOutput.fromJson({});
  }

  /// Assigns the DELETED status to a `DataSource`, rendering it unusable.
  ///
  /// After using the `DeleteDataSource` operation, you can use the
  /// GetDataSource operation to verify that the status of the `DataSource`
  /// changed to DELETED.
  ///
  /// **Caution:** The results of the `DeleteDataSource` operation are
  /// irreversible.
  ///
  /// [dataSourceId]: A user-supplied ID that uniquely identifies the
  /// `DataSource`.
  Future<DeleteDataSourceOutput> deleteDataSource(String dataSourceId) async {
    return DeleteDataSourceOutput.fromJson({});
  }

  /// Assigns the `DELETED` status to an `Evaluation`, rendering it unusable.
  ///
  /// After invoking the `DeleteEvaluation` operation, you can use the
  /// `GetEvaluation` operation to verify that the status of the `Evaluation`
  /// changed to `DELETED`.
  ///
  ///  Caution
  ///
  /// The results of the `DeleteEvaluation` operation are irreversible.
  ///
  /// [evaluationId]: A user-supplied ID that uniquely identifies the
  /// `Evaluation` to delete.
  Future<DeleteEvaluationOutput> deleteEvaluation(String evaluationId) async {
    return DeleteEvaluationOutput.fromJson({});
  }

  /// Assigns the `DELETED` status to an `MLModel`, rendering it unusable.
  ///
  /// After using the `DeleteMLModel` operation, you can use the `GetMLModel`
  /// operation to verify that the status of the `MLModel` changed to DELETED.
  ///
  /// **Caution:** The result of the `DeleteMLModel` operation is irreversible.
  ///
  /// [mlModelId]: A user-supplied ID that uniquely identifies the `MLModel`.
  Future<DeleteMLModelOutput> deleteMLModel(String mlModelId) async {
    return DeleteMLModelOutput.fromJson({});
  }

  /// Deletes a real time endpoint of an `MLModel`.
  ///
  /// [mlModelId]: The ID assigned to the `MLModel` during creation.
  Future<DeleteRealtimeEndpointOutput> deleteRealtimeEndpoint(
      String mlModelId) async {
    return DeleteRealtimeEndpointOutput.fromJson({});
  }

  /// Deletes the specified tags associated with an ML object. After this
  /// operation is complete, you can't recover deleted tags.
  ///
  /// If you specify a tag that doesn't exist, Amazon ML ignores it.
  ///
  /// [tagKeys]: One or more tags to delete.
  ///
  /// [resourceId]: The ID of the tagged ML object. For example,
  /// `exampleModelId`.
  ///
  /// [resourceType]: The type of the tagged ML object.
  Future<DeleteTagsOutput> deleteTags(
      {@required List<String> tagKeys,
      @required String resourceId,
      @required String resourceType}) async {
    return DeleteTagsOutput.fromJson({});
  }

  /// Returns a list of `BatchPrediction` operations that match the search
  /// criteria in the request.
  ///
  /// [filterVariable]: Use one of the following variables to filter a list of
  /// `BatchPrediction`:
  ///
  /// *    `CreatedAt` - Sets the search criteria to the `BatchPrediction`
  /// creation date.
  /// *    `Status` - Sets the search criteria to the `BatchPrediction` status.
  /// *    `Name` - Sets the search criteria to the contents of the
  /// `BatchPrediction`   `Name`.
  /// *    `IAMUser` - Sets the search criteria to the user account that invoked
  /// the `BatchPrediction` creation.
  /// *    `MLModelId` - Sets the search criteria to the `MLModel` used in the
  /// `BatchPrediction`.
  /// *    `DataSourceId` - Sets the search criteria to the `DataSource` used in
  /// the `BatchPrediction`.
  /// *    `DataURI` - Sets the search criteria to the data file(s) used in the
  /// `BatchPrediction`. The URL can identify either a file or an Amazon Simple
  /// Storage Solution (Amazon S3) bucket or directory.
  ///
  /// [eq]: The equal to operator. The `BatchPrediction` results will have
  /// `FilterVariable` values that exactly match the value specified with `EQ`.
  ///
  /// [gt]: The greater than operator. The `BatchPrediction` results will have
  /// `FilterVariable` values that are greater than the value specified with
  /// `GT`.
  ///
  /// [lt]: The less than operator. The `BatchPrediction` results will have
  /// `FilterVariable` values that are less than the value specified with `LT`.
  ///
  /// [ge]: The greater than or equal to operator. The `BatchPrediction` results
  /// will have `FilterVariable` values that are greater than or equal to the
  /// value specified with `GE`.
  ///
  /// [le]: The less than or equal to operator. The `BatchPrediction` results
  /// will have `FilterVariable` values that are less than or equal to the value
  /// specified with `LE`.
  ///
  /// [ne]: The not equal to operator. The `BatchPrediction` results will have
  /// `FilterVariable` values not equal to the value specified with `NE`.
  ///
  /// [prefix]: A string that is found at the beginning of a variable, such as
  /// `Name` or `Id`.
  ///
  /// For example, a `Batch Prediction` operation could have the `Name`
  /// `2014-09-09-HolidayGiftMailer`. To search for this `BatchPrediction`,
  /// select `Name` for the `FilterVariable` and any of the following strings
  /// for the `Prefix`:
  ///
  /// *   2014-09
  ///
  /// *   2014-09-09
  ///
  /// *   2014-09-09-Holiday
  ///
  /// [sortOrder]: A two-value parameter that determines the sequence of the
  /// resulting list of `MLModel`s.
  ///
  /// *    `asc` - Arranges the list in ascending order (A-Z, 0-9).
  /// *    `dsc` - Arranges the list in descending order (Z-A, 9-0).
  ///
  /// Results are sorted by `FilterVariable`.
  ///
  /// [nextToken]: An ID of the page in the paginated results.
  ///
  /// [limit]: The number of pages of information to include in the result. The
  /// range of acceptable values is `1` through `100`. The default value is
  /// `100`.
  Future<DescribeBatchPredictionsOutput> describeBatchPredictions(
      {String filterVariable,
      String eq,
      String gt,
      String lt,
      String ge,
      String le,
      String ne,
      String prefix,
      String sortOrder,
      String nextToken,
      int limit}) async {
    return DescribeBatchPredictionsOutput.fromJson({});
  }

  /// Returns a list of `DataSource` that match the search criteria in the
  /// request.
  ///
  /// [filterVariable]: Use one of the following variables to filter a list of
  /// `DataSource`:
  ///
  /// *    `CreatedAt` - Sets the search criteria to `DataSource` creation
  /// dates.
  /// *    `Status` - Sets the search criteria to `DataSource` statuses.
  /// *    `Name` - Sets the search criteria to the contents of `DataSource`
  /// `Name`.
  /// *    `DataUri` - Sets the search criteria to the URI of data files used to
  /// create the `DataSource`. The URI can identify either a file or an Amazon
  /// Simple Storage Service (Amazon S3) bucket or directory.
  /// *    `IAMUser` - Sets the search criteria to the user account that invoked
  /// the `DataSource` creation.
  ///
  /// [eq]: The equal to operator. The `DataSource` results will have
  /// `FilterVariable` values that exactly match the value specified with `EQ`.
  ///
  /// [gt]: The greater than operator. The `DataSource` results will have
  /// `FilterVariable` values that are greater than the value specified with
  /// `GT`.
  ///
  /// [lt]: The less than operator. The `DataSource` results will have
  /// `FilterVariable` values that are less than the value specified with `LT`.
  ///
  /// [ge]: The greater than or equal to operator. The `DataSource` results will
  /// have `FilterVariable` values that are greater than or equal to the value
  /// specified with `GE`.
  ///
  /// [le]: The less than or equal to operator. The `DataSource` results will
  /// have `FilterVariable` values that are less than or equal to the value
  /// specified with `LE`.
  ///
  /// [ne]: The not equal to operator. The `DataSource` results will have
  /// `FilterVariable` values not equal to the value specified with `NE`.
  ///
  /// [prefix]: A string that is found at the beginning of a variable, such as
  /// `Name` or `Id`.
  ///
  /// For example, a `DataSource` could have the `Name`
  /// `2014-09-09-HolidayGiftMailer`. To search for this `DataSource`, select
  /// `Name` for the `FilterVariable` and any of the following strings for the
  /// `Prefix`:
  ///
  /// *   2014-09
  ///
  /// *   2014-09-09
  ///
  /// *   2014-09-09-Holiday
  ///
  /// [sortOrder]: A two-value parameter that determines the sequence of the
  /// resulting list of `DataSource`.
  ///
  /// *    `asc` - Arranges the list in ascending order (A-Z, 0-9).
  /// *    `dsc` - Arranges the list in descending order (Z-A, 9-0).
  ///
  /// Results are sorted by `FilterVariable`.
  ///
  /// [nextToken]: The ID of the page in the paginated results.
  ///
  /// [limit]:  The maximum number of `DataSource` to include in the result.
  Future<DescribeDataSourcesOutput> describeDataSources(
      {String filterVariable,
      String eq,
      String gt,
      String lt,
      String ge,
      String le,
      String ne,
      String prefix,
      String sortOrder,
      String nextToken,
      int limit}) async {
    return DescribeDataSourcesOutput.fromJson({});
  }

  /// Returns a list of `DescribeEvaluations` that match the search criteria in
  /// the request.
  ///
  /// [filterVariable]: Use one of the following variable to filter a list of
  /// `Evaluation` objects:
  ///
  /// *    `CreatedAt` - Sets the search criteria to the `Evaluation` creation
  /// date.
  /// *    `Status` - Sets the search criteria to the `Evaluation` status.
  /// *    `Name` - Sets the search criteria to the contents of `Evaluation`
  /// `Name`.
  /// *    `IAMUser` - Sets the search criteria to the user account that invoked
  /// an `Evaluation`.
  /// *    `MLModelId` - Sets the search criteria to the `MLModel` that was
  /// evaluated.
  /// *    `DataSourceId` - Sets the search criteria to the `DataSource` used in
  /// `Evaluation`.
  /// *    `DataUri` - Sets the search criteria to the data file(s) used in
  /// `Evaluation`. The URL can identify either a file or an Amazon Simple
  /// Storage Solution (Amazon S3) bucket or directory.
  ///
  /// [eq]: The equal to operator. The `Evaluation` results will have
  /// `FilterVariable` values that exactly match the value specified with `EQ`.
  ///
  /// [gt]: The greater than operator. The `Evaluation` results will have
  /// `FilterVariable` values that are greater than the value specified with
  /// `GT`.
  ///
  /// [lt]: The less than operator. The `Evaluation` results will have
  /// `FilterVariable` values that are less than the value specified with `LT`.
  ///
  /// [ge]: The greater than or equal to operator. The `Evaluation` results will
  /// have `FilterVariable` values that are greater than or equal to the value
  /// specified with `GE`.
  ///
  /// [le]: The less than or equal to operator. The `Evaluation` results will
  /// have `FilterVariable` values that are less than or equal to the value
  /// specified with `LE`.
  ///
  /// [ne]: The not equal to operator. The `Evaluation` results will have
  /// `FilterVariable` values not equal to the value specified with `NE`.
  ///
  /// [prefix]: A string that is found at the beginning of a variable, such as
  /// `Name` or `Id`.
  ///
  /// For example, an `Evaluation` could have the `Name`
  /// `2014-09-09-HolidayGiftMailer`. To search for this `Evaluation`, select
  /// `Name` for the `FilterVariable` and any of the following strings for the
  /// `Prefix`:
  ///
  /// *   2014-09
  ///
  /// *   2014-09-09
  ///
  /// *   2014-09-09-Holiday
  ///
  /// [sortOrder]: A two-value parameter that determines the sequence of the
  /// resulting list of `Evaluation`.
  ///
  /// *    `asc` - Arranges the list in ascending order (A-Z, 0-9).
  /// *    `dsc` - Arranges the list in descending order (Z-A, 9-0).
  ///
  /// Results are sorted by `FilterVariable`.
  ///
  /// [nextToken]: The ID of the page in the paginated results.
  ///
  /// [limit]:  The maximum number of `Evaluation` to include in the result.
  Future<DescribeEvaluationsOutput> describeEvaluations(
      {String filterVariable,
      String eq,
      String gt,
      String lt,
      String ge,
      String le,
      String ne,
      String prefix,
      String sortOrder,
      String nextToken,
      int limit}) async {
    return DescribeEvaluationsOutput.fromJson({});
  }

  /// Returns a list of `MLModel` that match the search criteria in the request.
  ///
  /// [filterVariable]: Use one of the following variables to filter a list of
  /// `MLModel`:
  ///
  /// *    `CreatedAt` - Sets the search criteria to `MLModel` creation date.
  /// *    `Status` - Sets the search criteria to `MLModel` status.
  /// *    `Name` - Sets the search criteria to the contents of `MLModel`
  /// `Name`.
  /// *    `IAMUser` - Sets the search criteria to the user account that invoked
  /// the `MLModel` creation.
  /// *    `TrainingDataSourceId` - Sets the search criteria to the `DataSource`
  /// used to train one or more `MLModel`.
  /// *    `RealtimeEndpointStatus` - Sets the search criteria to the `MLModel`
  /// real-time endpoint status.
  /// *    `MLModelType` - Sets the search criteria to `MLModel` type: binary,
  /// regression, or multi-class.
  /// *    `Algorithm` - Sets the search criteria to the algorithm that the
  /// `MLModel` uses.
  /// *    `TrainingDataURI` - Sets the search criteria to the data file(s) used
  /// in training a `MLModel`. The URL can identify either a file or an Amazon
  /// Simple Storage Service (Amazon S3) bucket or directory.
  ///
  /// [eq]: The equal to operator. The `MLModel` results will have
  /// `FilterVariable` values that exactly match the value specified with `EQ`.
  ///
  /// [gt]: The greater than operator. The `MLModel` results will have
  /// `FilterVariable` values that are greater than the value specified with
  /// `GT`.
  ///
  /// [lt]: The less than operator. The `MLModel` results will have
  /// `FilterVariable` values that are less than the value specified with `LT`.
  ///
  /// [ge]: The greater than or equal to operator. The `MLModel` results will
  /// have `FilterVariable` values that are greater than or equal to the value
  /// specified with `GE`.
  ///
  /// [le]: The less than or equal to operator. The `MLModel` results will have
  /// `FilterVariable` values that are less than or equal to the value specified
  /// with `LE`.
  ///
  /// [ne]: The not equal to operator. The `MLModel` results will have
  /// `FilterVariable` values not equal to the value specified with `NE`.
  ///
  /// [prefix]: A string that is found at the beginning of a variable, such as
  /// `Name` or `Id`.
  ///
  /// For example, an `MLModel` could have the `Name`
  /// `2014-09-09-HolidayGiftMailer`. To search for this `MLModel`, select
  /// `Name` for the `FilterVariable` and any of the following strings for the
  /// `Prefix`:
  ///
  /// *   2014-09
  ///
  /// *   2014-09-09
  ///
  /// *   2014-09-09-Holiday
  ///
  /// [sortOrder]: A two-value parameter that determines the sequence of the
  /// resulting list of `MLModel`.
  ///
  /// *    `asc` - Arranges the list in ascending order (A-Z, 0-9).
  /// *    `dsc` - Arranges the list in descending order (Z-A, 9-0).
  ///
  /// Results are sorted by `FilterVariable`.
  ///
  /// [nextToken]: The ID of the page in the paginated results.
  ///
  /// [limit]: The number of pages of information to include in the result. The
  /// range of acceptable values is `1` through `100`. The default value is
  /// `100`.
  Future<DescribeMLModelsOutput> describeMLModels(
      {String filterVariable,
      String eq,
      String gt,
      String lt,
      String ge,
      String le,
      String ne,
      String prefix,
      String sortOrder,
      String nextToken,
      int limit}) async {
    return DescribeMLModelsOutput.fromJson({});
  }

  /// Describes one or more of the tags for your Amazon ML object.
  ///
  /// [resourceId]: The ID of the ML object. For example, `exampleModelId`.
  ///
  /// [resourceType]: The type of the ML object.
  Future<DescribeTagsOutput> describeTags(
      {@required String resourceId, @required String resourceType}) async {
    return DescribeTagsOutput.fromJson({});
  }

  /// Returns a `BatchPrediction` that includes detailed metadata, status, and
  /// data file information for a `Batch Prediction` request.
  ///
  /// [batchPredictionId]: An ID assigned to the `BatchPrediction` at creation.
  Future<GetBatchPredictionOutput> getBatchPrediction(
      String batchPredictionId) async {
    return GetBatchPredictionOutput.fromJson({});
  }

  /// Returns a `DataSource` that includes metadata and data file information,
  /// as well as the current status of the `DataSource`.
  ///
  /// `GetDataSource` provides results in normal or verbose format. The verbose
  /// format adds the schema description and the list of files pointed to by the
  /// DataSource to the normal format.
  ///
  /// [dataSourceId]: The ID assigned to the `DataSource` at creation.
  ///
  /// [verbose]: Specifies whether the `GetDataSource` operation should return
  /// `DataSourceSchema`.
  ///
  /// If true, `DataSourceSchema` is returned.
  ///
  /// If false, `DataSourceSchema` is not returned.
  Future<GetDataSourceOutput> getDataSource(String dataSourceId,
      {bool verbose}) async {
    return GetDataSourceOutput.fromJson({});
  }

  /// Returns an `Evaluation` that includes metadata as well as the current
  /// status of the `Evaluation`.
  ///
  /// [evaluationId]: The ID of the `Evaluation` to retrieve. The evaluation of
  /// each `MLModel` is recorded and cataloged. The ID provides the means to
  /// access the information.
  Future<GetEvaluationOutput> getEvaluation(String evaluationId) async {
    return GetEvaluationOutput.fromJson({});
  }

  /// Returns an `MLModel` that includes detailed metadata, data source
  /// information, and the current status of the `MLModel`.
  ///
  /// `GetMLModel` provides results in normal or verbose format.
  ///
  /// [mlModelId]: The ID assigned to the `MLModel` at creation.
  ///
  /// [verbose]: Specifies whether the `GetMLModel` operation should return
  /// `Recipe`.
  ///
  /// If true, `Recipe` is returned.
  ///
  /// If false, `Recipe` is not returned.
  Future<GetMLModelOutput> getMLModel(String mlModelId, {bool verbose}) async {
    return GetMLModelOutput.fromJson({});
  }

  /// Generates a prediction for the observation using the specified `ML Model`.
  ///
  ///  Note
  ///
  /// Not all response parameters will be populated. Whether a response
  /// parameter is populated depends on the type of model requested.
  ///
  /// [mlModelId]: A unique identifier of the `MLModel`.
  Future<PredictOutput> predict(
      {@required String mlModelId,
      @required Map<String, String> record,
      @required String predictEndpoint}) async {
    return PredictOutput.fromJson({});
  }

  /// Updates the `BatchPredictionName` of a `BatchPrediction`.
  ///
  /// You can use the `GetBatchPrediction` operation to view the contents of the
  /// updated data element.
  ///
  /// [batchPredictionId]: The ID assigned to the `BatchPrediction` during
  /// creation.
  ///
  /// [batchPredictionName]: A new user-supplied name or description of the
  /// `BatchPrediction`.
  Future<UpdateBatchPredictionOutput> updateBatchPrediction(
      {@required String batchPredictionId,
      @required String batchPredictionName}) async {
    return UpdateBatchPredictionOutput.fromJson({});
  }

  /// Updates the `DataSourceName` of a `DataSource`.
  ///
  /// You can use the `GetDataSource` operation to view the contents of the
  /// updated data element.
  ///
  /// [dataSourceId]: The ID assigned to the `DataSource` during creation.
  ///
  /// [dataSourceName]: A new user-supplied name or description of the
  /// `DataSource` that will replace the current description.
  Future<UpdateDataSourceOutput> updateDataSource(
      {@required String dataSourceId, @required String dataSourceName}) async {
    return UpdateDataSourceOutput.fromJson({});
  }

  /// Updates the `EvaluationName` of an `Evaluation`.
  ///
  /// You can use the `GetEvaluation` operation to view the contents of the
  /// updated data element.
  ///
  /// [evaluationId]: The ID assigned to the `Evaluation` during creation.
  ///
  /// [evaluationName]: A new user-supplied name or description of the
  /// `Evaluation` that will replace the current content.
  Future<UpdateEvaluationOutput> updateEvaluation(
      {@required String evaluationId, @required String evaluationName}) async {
    return UpdateEvaluationOutput.fromJson({});
  }

  /// Updates the `MLModelName` and the `ScoreThreshold` of an `MLModel`.
  ///
  /// You can use the `GetMLModel` operation to view the contents of the updated
  /// data element.
  ///
  /// [mlModelId]: The ID assigned to the `MLModel` during creation.
  ///
  /// [mlModelName]: A user-supplied name or description of the `MLModel`.
  ///
  /// [scoreThreshold]: The `ScoreThreshold` used in binary classification
  /// `MLModel` that marks the boundary between a positive prediction and a
  /// negative prediction.
  ///
  /// Output values greater than or equal to the `ScoreThreshold` receive a
  /// positive result from the `MLModel`, such as `true`. Output values less
  /// than the `ScoreThreshold` receive a negative response from the `MLModel`,
  /// such as `false`.
  Future<UpdateMLModelOutput> updateMLModel(String mlModelId,
      {String mlModelName, double scoreThreshold}) async {
    return UpdateMLModelOutput.fromJson({});
  }
}

/// Amazon ML returns the following elements.
class AddTagsOutput {
  /// The ID of the ML object that was tagged.
  final String resourceId;

  /// The type of the ML object that was tagged.
  final String resourceType;

  AddTagsOutput({
    this.resourceId,
    this.resourceType,
  });
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput();
}

///  Represents the output of a `GetBatchPrediction` operation.
///
///  The content consists of the detailed metadata, the status, and the data
/// file information of a `Batch Prediction`.
class BatchPrediction {
  /// The ID assigned to the `BatchPrediction` at creation. This value should be
  /// identical to the value of the `BatchPredictionID` in the request.
  final String batchPredictionId;

  /// The ID of the `MLModel` that generated predictions for the
  /// `BatchPrediction` request.
  final String mlModelId;

  /// The ID of the `DataSource` that points to the group of observations to
  /// predict.
  final String batchPredictionDataSourceId;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String inputDataLocationS3;

  /// The AWS user account that invoked the `BatchPrediction`. The account type
  /// can be either an AWS root account or an AWS Identity and Access Management
  /// (IAM) user account.
  final String createdByIamUser;

  /// The time that the `BatchPrediction` was created. The time is expressed in
  /// epoch time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `BatchPrediction`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `BatchPrediction`.
  final String name;

  /// The status of the `BatchPrediction`. This element can have one of the
  /// following values:
  ///
  /// *    `PENDING` - Amazon Machine Learning (Amazon ML) submitted a request
  /// to generate predictions for a batch of observations.
  /// *    `INPROGRESS` - The process is underway.
  /// *    `FAILED` - The request to perform a batch prediction did not run to
  /// completion. It is not usable.
  /// *    `COMPLETED` - The batch prediction process completed successfully.
  /// *    `DELETED` - The `BatchPrediction` is marked as deleted. It is not
  /// usable.
  final String status;

  /// The location of an Amazon S3 bucket or directory to receive the operation
  /// results. The following substrings are not allowed in the `s3 key` portion
  /// of the `outputURI` field: ':', '//', '/./', '/../'.
  final String outputUri;

  /// A description of the most recent details about processing the batch
  /// prediction request.
  final String message;

  final BigInt computeTime;

  final DateTime finishedAt;

  final DateTime startedAt;

  final BigInt totalRecordCount;

  final BigInt invalidRecordCount;

  BatchPrediction({
    this.batchPredictionId,
    this.mlModelId,
    this.batchPredictionDataSourceId,
    this.inputDataLocationS3,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.outputUri,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
    this.totalRecordCount,
    this.invalidRecordCount,
  });
  static BatchPrediction fromJson(Map<String, dynamic> json) =>
      BatchPrediction();
}

///  Represents the output of a `CreateBatchPrediction` operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// The `CreateBatchPrediction` operation is asynchronous. You can poll for
/// status updates by using the `>GetBatchPrediction` operation and checking the
/// `Status` parameter of the result.
class CreateBatchPredictionOutput {
  /// A user-supplied ID that uniquely identifies the `BatchPrediction`. This
  /// value is identical to the value of the `BatchPredictionId` in the request.
  final String batchPredictionId;

  CreateBatchPredictionOutput({
    this.batchPredictionId,
  });
  static CreateBatchPredictionOutput fromJson(Map<String, dynamic> json) =>
      CreateBatchPredictionOutput();
}

///  Represents the output of a `CreateDataSourceFromRDS` operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// The `CreateDataSourceFromRDS`> operation is asynchronous. You can poll for
/// updates by using the `GetBatchPrediction` operation and checking the
/// `Status` parameter. You can inspect the `Message` when `Status` shows up as
/// `FAILED`. You can also check the progress of the copy operation by going to
/// the `DataPipeline` console and looking up the pipeline using the
/// `pipelineId`  from the describe call.
class CreateDataSourceFromRdsOutput {
  /// A user-supplied ID that uniquely identifies the datasource. This value
  /// should be identical to the value of the `DataSourceID` in the request.
  final String dataSourceId;

  CreateDataSourceFromRdsOutput({
    this.dataSourceId,
  });
  static CreateDataSourceFromRdsOutput fromJson(Map<String, dynamic> json) =>
      CreateDataSourceFromRdsOutput();
}

///  Represents the output of a `CreateDataSourceFromRedshift` operation, and is
/// an acknowledgement that Amazon ML received the request.
///
/// The `CreateDataSourceFromRedshift` operation is asynchronous. You can poll
/// for updates by using the `GetBatchPrediction` operation and checking the
/// `Status` parameter.
class CreateDataSourceFromRedshiftOutput {
  /// A user-supplied ID that uniquely identifies the datasource. This value
  /// should be identical to the value of the `DataSourceID` in the request.
  final String dataSourceId;

  CreateDataSourceFromRedshiftOutput({
    this.dataSourceId,
  });
  static CreateDataSourceFromRedshiftOutput fromJson(
          Map<String, dynamic> json) =>
      CreateDataSourceFromRedshiftOutput();
}

///  Represents the output of a `CreateDataSourceFromS3` operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// The `CreateDataSourceFromS3` operation is asynchronous. You can poll for
/// updates by using the `GetBatchPrediction` operation and checking the
/// `Status` parameter.
class CreateDataSourceFromS3Output {
  /// A user-supplied ID that uniquely identifies the `DataSource`. This value
  /// should be identical to the value of the `DataSourceID` in the request.
  final String dataSourceId;

  CreateDataSourceFromS3Output({
    this.dataSourceId,
  });
  static CreateDataSourceFromS3Output fromJson(Map<String, dynamic> json) =>
      CreateDataSourceFromS3Output();
}

///  Represents the output of a `CreateEvaluation` operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// `CreateEvaluation` operation is asynchronous. You can poll for status
/// updates by using the `GetEvcaluation` operation and checking the `Status`
/// parameter.
class CreateEvaluationOutput {
  /// The user-supplied ID that uniquely identifies the `Evaluation`. This value
  /// should be identical to the value of the `EvaluationId` in the request.
  final String evaluationId;

  CreateEvaluationOutput({
    this.evaluationId,
  });
  static CreateEvaluationOutput fromJson(Map<String, dynamic> json) =>
      CreateEvaluationOutput();
}

///  Represents the output of a `CreateMLModel` operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// The `CreateMLModel` operation is asynchronous. You can poll for status
/// updates by using the `GetMLModel` operation and checking the `Status`
/// parameter.
class CreateMLModelOutput {
  /// A user-supplied ID that uniquely identifies the `MLModel`. This value
  /// should be identical to the value of the `MLModelId` in the request.
  final String mlModelId;

  CreateMLModelOutput({
    this.mlModelId,
  });
  static CreateMLModelOutput fromJson(Map<String, dynamic> json) =>
      CreateMLModelOutput();
}

/// Represents the output of an `CreateRealtimeEndpoint` operation.
///
/// The result contains the `MLModelId` and the endpoint information for the
/// `MLModel`.
///
///
///
/// The endpoint information includes the URI of the `MLModel`; that is, the
/// location to send online prediction requests for the specified `MLModel`.
class CreateRealtimeEndpointOutput {
  /// A user-supplied ID that uniquely identifies the `MLModel`. This value
  /// should be identical to the value of the `MLModelId` in the request.
  final String mlModelId;

  /// The endpoint information of the `MLModel`
  final RealtimeEndpointInfo realtimeEndpointInfo;

  CreateRealtimeEndpointOutput({
    this.mlModelId,
    this.realtimeEndpointInfo,
  });
  static CreateRealtimeEndpointOutput fromJson(Map<String, dynamic> json) =>
      CreateRealtimeEndpointOutput();
}

///  Represents the output of the `GetDataSource` operation.
///
///  The content consists of the detailed metadata and data file information and
/// the current status of the `DataSource`.
class DataSource {
  /// The ID that is assigned to the `DataSource` during creation.
  final String dataSourceId;

  /// The location and name of the data in Amazon Simple Storage Service (Amazon
  /// S3) that is used by a `DataSource`.
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement requirement
  /// used when this `DataSource` was created.
  final String dataRearrangement;

  /// The AWS user account from which the `DataSource` was created. The account
  /// type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  final String createdByIamUser;

  /// The time that the `DataSource` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `BatchPrediction`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// The total number of observations contained in the data files that the
  /// `DataSource` references.
  final BigInt dataSizeInBytes;

  /// The number of data files referenced by the `DataSource`.
  final BigInt numberOfFiles;

  /// A user-supplied name or description of the `DataSource`.
  final String name;

  /// The current status of the `DataSource`. This element can have one of the
  /// following values:
  ///
  /// *   PENDING - Amazon Machine Learning (Amazon ML) submitted a request to
  /// create a `DataSource`.
  /// *   INPROGRESS - The creation process is underway.
  /// *   FAILED - The request to create a `DataSource` did not run to
  /// completion. It is not usable.
  /// *   COMPLETED - The creation process completed successfully.
  /// *   DELETED - The `DataSource` is marked as deleted. It is not usable.
  final String status;

  /// A description of the most recent details about creating the `DataSource`.
  final String message;

  final RedshiftMetadata redshiftMetadata;

  final RdsMetadata rdsMetadata;

  final String roleArn;

  ///  The parameter is `true` if statistics need to be generated from the
  /// observation data.
  final bool computeStatistics;

  final BigInt computeTime;

  final DateTime finishedAt;

  final DateTime startedAt;

  DataSource({
    this.dataSourceId,
    this.dataLocationS3,
    this.dataRearrangement,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.dataSizeInBytes,
    this.numberOfFiles,
    this.name,
    this.status,
    this.message,
    this.redshiftMetadata,
    this.rdsMetadata,
    this.roleArn,
    this.computeStatistics,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource();
}

///  Represents the output of a `DeleteBatchPrediction` operation.
///
/// You can use the `GetBatchPrediction` operation and check the value of the
/// `Status` parameter to see whether a `BatchPrediction` is marked as
/// `DELETED`.
class DeleteBatchPredictionOutput {
  /// A user-supplied ID that uniquely identifies the `BatchPrediction`. This
  /// value should be identical to the value of the `BatchPredictionID` in the
  /// request.
  final String batchPredictionId;

  DeleteBatchPredictionOutput({
    this.batchPredictionId,
  });
  static DeleteBatchPredictionOutput fromJson(Map<String, dynamic> json) =>
      DeleteBatchPredictionOutput();
}

///  Represents the output of a `DeleteDataSource` operation.
class DeleteDataSourceOutput {
  /// A user-supplied ID that uniquely identifies the `DataSource`. This value
  /// should be identical to the value of the `DataSourceID` in the request.
  final String dataSourceId;

  DeleteDataSourceOutput({
    this.dataSourceId,
  });
  static DeleteDataSourceOutput fromJson(Map<String, dynamic> json) =>
      DeleteDataSourceOutput();
}

///  Represents the output of a `DeleteEvaluation` operation. The output
/// indicates that Amazon Machine Learning (Amazon ML) received the request.
///
/// You can use the `GetEvaluation` operation and check the value of the
/// `Status` parameter to see whether an `Evaluation` is marked as `DELETED`.
class DeleteEvaluationOutput {
  /// A user-supplied ID that uniquely identifies the `Evaluation`. This value
  /// should be identical to the value of the `EvaluationId` in the request.
  final String evaluationId;

  DeleteEvaluationOutput({
    this.evaluationId,
  });
  static DeleteEvaluationOutput fromJson(Map<String, dynamic> json) =>
      DeleteEvaluationOutput();
}

/// Represents the output of a `DeleteMLModel` operation.
///
/// You can use the `GetMLModel` operation and check the value of the `Status`
/// parameter to see whether an `MLModel` is marked as `DELETED`.
class DeleteMLModelOutput {
  /// A user-supplied ID that uniquely identifies the `MLModel`. This value
  /// should be identical to the value of the `MLModelID` in the request.
  final String mlModelId;

  DeleteMLModelOutput({
    this.mlModelId,
  });
  static DeleteMLModelOutput fromJson(Map<String, dynamic> json) =>
      DeleteMLModelOutput();
}

/// Represents the output of an `DeleteRealtimeEndpoint` operation.
///
/// The result contains the `MLModelId` and the endpoint information for the
/// `MLModel`.
class DeleteRealtimeEndpointOutput {
  /// A user-supplied ID that uniquely identifies the `MLModel`. This value
  /// should be identical to the value of the `MLModelId` in the request.
  final String mlModelId;

  /// The endpoint information of the `MLModel`
  final RealtimeEndpointInfo realtimeEndpointInfo;

  DeleteRealtimeEndpointOutput({
    this.mlModelId,
    this.realtimeEndpointInfo,
  });
  static DeleteRealtimeEndpointOutput fromJson(Map<String, dynamic> json) =>
      DeleteRealtimeEndpointOutput();
}

/// Amazon ML returns the following elements.
class DeleteTagsOutput {
  /// The ID of the ML object from which tags were deleted.
  final String resourceId;

  /// The type of the ML object from which tags were deleted.
  final String resourceType;

  DeleteTagsOutput({
    this.resourceId,
    this.resourceType,
  });
  static DeleteTagsOutput fromJson(Map<String, dynamic> json) =>
      DeleteTagsOutput();
}

/// Represents the output of a `DescribeBatchPredictions` operation. The content
/// is essentially a list of `BatchPrediction`s.
class DescribeBatchPredictionsOutput {
  /// A list of `BatchPrediction` objects that meet the search criteria.
  final List<BatchPrediction> results;

  /// The ID of the next page in the paginated results that indicates at least
  /// one more page follows.
  final String nextToken;

  DescribeBatchPredictionsOutput({
    this.results,
    this.nextToken,
  });
  static DescribeBatchPredictionsOutput fromJson(Map<String, dynamic> json) =>
      DescribeBatchPredictionsOutput();
}

/// Represents the query results from a DescribeDataSources operation. The
/// content is essentially a list of `DataSource`.
class DescribeDataSourcesOutput {
  /// A list of `DataSource` that meet the search criteria.
  final List<DataSource> results;

  /// An ID of the next page in the paginated results that indicates at least
  /// one more page follows.
  final String nextToken;

  DescribeDataSourcesOutput({
    this.results,
    this.nextToken,
  });
  static DescribeDataSourcesOutput fromJson(Map<String, dynamic> json) =>
      DescribeDataSourcesOutput();
}

/// Represents the query results from a `DescribeEvaluations` operation. The
/// content is essentially a list of `Evaluation`.
class DescribeEvaluationsOutput {
  /// A list of `Evaluation` that meet the search criteria.
  final List<Evaluation> results;

  /// The ID of the next page in the paginated results that indicates at least
  /// one more page follows.
  final String nextToken;

  DescribeEvaluationsOutput({
    this.results,
    this.nextToken,
  });
  static DescribeEvaluationsOutput fromJson(Map<String, dynamic> json) =>
      DescribeEvaluationsOutput();
}

/// Represents the output of a `DescribeMLModels` operation. The content is
/// essentially a list of `MLModel`.
class DescribeMLModelsOutput {
  /// A list of `MLModel` that meet the search criteria.
  final List<MLModel> results;

  /// The ID of the next page in the paginated results that indicates at least
  /// one more page follows.
  final String nextToken;

  DescribeMLModelsOutput({
    this.results,
    this.nextToken,
  });
  static DescribeMLModelsOutput fromJson(Map<String, dynamic> json) =>
      DescribeMLModelsOutput();
}

/// Amazon ML returns the following elements.
class DescribeTagsOutput {
  /// The ID of the tagged ML object.
  final String resourceId;

  /// The type of the tagged ML object.
  final String resourceType;

  /// A list of tags associated with the ML object.
  final List<Tag> tags;

  DescribeTagsOutput({
    this.resourceId,
    this.resourceType,
    this.tags,
  });
  static DescribeTagsOutput fromJson(Map<String, dynamic> json) =>
      DescribeTagsOutput();
}

///  Represents the output of `GetEvaluation` operation.
///
/// The content consists of the detailed metadata and data file information and
/// the current status of the `Evaluation`.
class Evaluation {
  /// The ID that is assigned to the `Evaluation` at creation.
  final String evaluationId;

  /// The ID of the `MLModel` that is the focus of the evaluation.
  final String mlModelId;

  /// The ID of the `DataSource` that is used to evaluate the `MLModel`.
  final String evaluationDataSourceId;

  /// The location and name of the data in Amazon Simple Storage Server (Amazon
  /// S3) that is used in the evaluation.
  final String inputDataLocationS3;

  /// The AWS user account that invoked the evaluation. The account type can be
  /// either an AWS root account or an AWS Identity and Access Management (IAM)
  /// user account.
  final String createdByIamUser;

  /// The time that the `Evaluation` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `Evaluation`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `Evaluation`.
  final String name;

  /// The status of the evaluation. This element can have one of the following
  /// values:
  ///
  /// *    `PENDING` - Amazon Machine Learning (Amazon ML) submitted a request
  /// to evaluate an `MLModel`.
  /// *    `INPROGRESS` - The evaluation is underway.
  /// *    `FAILED` - The request to evaluate an `MLModel` did not run to
  /// completion. It is not usable.
  /// *    `COMPLETED` - The evaluation process completed successfully.
  /// *    `DELETED` - The `Evaluation` is marked as deleted. It is not usable.
  final String status;

  /// Measurements of how well the `MLModel` performed, using observations
  /// referenced by the `DataSource`. One of the following metrics is returned,
  /// based on the type of the `MLModel`:
  ///
  /// *   BinaryAUC: A binary `MLModel` uses the Area Under the Curve (AUC)
  /// technique to measure performance.
  ///
  /// *   RegressionRMSE: A regression `MLModel` uses the Root Mean Square Error
  /// (RMSE) technique to measure performance. RMSE measures the difference
  /// between predicted and actual values for a single variable.
  ///
  /// *   MulticlassAvgFScore: A multiclass `MLModel` uses the F1 score
  /// technique to measure performance.
  ///
  ///
  ///  For more information about performance metrics, please see the
  /// [Amazon Machine Learning Developer Guide](http://docs.aws.amazon.com/machine-learning/latest/dg).
  final PerformanceMetrics performanceMetrics;

  /// A description of the most recent details about evaluating the `MLModel`.
  final String message;

  final BigInt computeTime;

  final DateTime finishedAt;

  final DateTime startedAt;

  Evaluation({
    this.evaluationId,
    this.mlModelId,
    this.evaluationDataSourceId,
    this.inputDataLocationS3,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.performanceMetrics,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
  });
  static Evaluation fromJson(Map<String, dynamic> json) => Evaluation();
}

/// Represents the output of a `GetBatchPrediction` operation and describes a
/// `BatchPrediction`.
class GetBatchPredictionOutput {
  /// An ID assigned to the `BatchPrediction` at creation. This value should be
  /// identical to the value of the `BatchPredictionID` in the request.
  final String batchPredictionId;

  /// The ID of the `MLModel` that generated predictions for the
  /// `BatchPrediction` request.
  final String mlModelId;

  /// The ID of the `DataSource` that was used to create the `BatchPrediction`.
  final String batchPredictionDataSourceId;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String inputDataLocationS3;

  /// The AWS user account that invoked the `BatchPrediction`. The account type
  /// can be either an AWS root account or an AWS Identity and Access Management
  /// (IAM) user account.
  final String createdByIamUser;

  /// The time when the `BatchPrediction` was created. The time is expressed in
  /// epoch time.
  final DateTime createdAt;

  /// The time of the most recent edit to `BatchPrediction`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `BatchPrediction`.
  final String name;

  /// The status of the `BatchPrediction`, which can be one of the following
  /// values:
  ///
  /// *    `PENDING` - Amazon Machine Learning (Amazon ML) submitted a request
  /// to generate batch predictions.
  /// *    `INPROGRESS` - The batch predictions are in progress.
  /// *    `FAILED` - The request to perform a batch prediction did not run to
  /// completion. It is not usable.
  /// *    `COMPLETED` - The batch prediction process completed successfully.
  /// *    `DELETED` - The `BatchPrediction` is marked as deleted. It is not
  /// usable.
  final String status;

  /// The location of an Amazon S3 bucket or directory to receive the operation
  /// results.
  final String outputUri;

  /// A link to the file that contains logs of the `CreateBatchPrediction`
  /// operation.
  final String logUri;

  /// A description of the most recent details about processing the batch
  /// prediction request.
  final String message;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning
  /// spent processing the `BatchPrediction`, normalized and scaled on
  /// computation resources. `ComputeTime` is only available if the
  /// `BatchPrediction` is in the `COMPLETED` state.
  final BigInt computeTime;

  /// The epoch time when Amazon Machine Learning marked the `BatchPrediction`
  /// as `COMPLETED` or `FAILED`. `FinishedAt` is only available when the
  /// `BatchPrediction` is in the `COMPLETED` or `FAILED` state.
  final DateTime finishedAt;

  /// The epoch time when Amazon Machine Learning marked the `BatchPrediction`
  /// as `INPROGRESS`. `StartedAt` isn't available if the `BatchPrediction` is
  /// in the `PENDING` state.
  final DateTime startedAt;

  /// The number of total records that Amazon Machine Learning saw while
  /// processing the `BatchPrediction`.
  final BigInt totalRecordCount;

  /// The number of invalid records that Amazon Machine Learning saw while
  /// processing the `BatchPrediction`.
  final BigInt invalidRecordCount;

  GetBatchPredictionOutput({
    this.batchPredictionId,
    this.mlModelId,
    this.batchPredictionDataSourceId,
    this.inputDataLocationS3,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.outputUri,
    this.logUri,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
    this.totalRecordCount,
    this.invalidRecordCount,
  });
  static GetBatchPredictionOutput fromJson(Map<String, dynamic> json) =>
      GetBatchPredictionOutput();
}

/// Represents the output of a `GetDataSource` operation and describes a
/// `DataSource`.
class GetDataSourceOutput {
  /// The ID assigned to the `DataSource` at creation. This value should be
  /// identical to the value of the `DataSourceId` in the request.
  final String dataSourceId;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement requirement
  /// used when this `DataSource` was created.
  final String dataRearrangement;

  /// The AWS user account from which the `DataSource` was created. The account
  /// type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  final String createdByIamUser;

  /// The time that the `DataSource` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `DataSource`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// The total size of observations in the data files.
  final BigInt dataSizeInBytes;

  /// The number of data files referenced by the `DataSource`.
  final BigInt numberOfFiles;

  /// A user-supplied name or description of the `DataSource`.
  final String name;

  /// The current status of the `DataSource`. This element can have one of the
  /// following values:
  ///
  /// *    `PENDING` - Amazon ML submitted a request to create a `DataSource`.
  /// *    `INPROGRESS` - The creation process is underway.
  /// *    `FAILED` - The request to create a `DataSource` did not run to
  /// completion. It is not usable.
  /// *    `COMPLETED` - The creation process completed successfully.
  /// *    `DELETED` - The `DataSource` is marked as deleted. It is not usable.
  final String status;

  /// A link to the file containing logs of `CreateDataSourceFrom*` operations.
  final String logUri;

  /// The user-supplied description of the most recent details about creating
  /// the `DataSource`.
  final String message;

  final RedshiftMetadata redshiftMetadata;

  final RdsMetadata rdsMetadata;

  final String roleArn;

  ///  The parameter is `true` if statistics need to be generated from the
  /// observation data.
  final bool computeStatistics;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning
  /// spent processing the `DataSource`, normalized and scaled on computation
  /// resources. `ComputeTime` is only available if the `DataSource` is in the
  /// `COMPLETED` state and the `ComputeStatistics` is set to true.
  final BigInt computeTime;

  /// The epoch time when Amazon Machine Learning marked the `DataSource` as
  /// `COMPLETED` or `FAILED`. `FinishedAt` is only available when the
  /// `DataSource` is in the `COMPLETED` or `FAILED` state.
  final DateTime finishedAt;

  /// The epoch time when Amazon Machine Learning marked the `DataSource` as
  /// `INPROGRESS`. `StartedAt` isn't available if the `DataSource` is in the
  /// `PENDING` state.
  final DateTime startedAt;

  /// The schema used by all of the data files of this `DataSource`.
  ///
  ///  Note
  ///
  /// This parameter is provided as part of the verbose format.
  final String dataSourceSchema;

  GetDataSourceOutput({
    this.dataSourceId,
    this.dataLocationS3,
    this.dataRearrangement,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.dataSizeInBytes,
    this.numberOfFiles,
    this.name,
    this.status,
    this.logUri,
    this.message,
    this.redshiftMetadata,
    this.rdsMetadata,
    this.roleArn,
    this.computeStatistics,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
    this.dataSourceSchema,
  });
  static GetDataSourceOutput fromJson(Map<String, dynamic> json) =>
      GetDataSourceOutput();
}

/// Represents the output of a `GetEvaluation` operation and describes an
/// `Evaluation`.
class GetEvaluationOutput {
  /// The evaluation ID which is same as the `EvaluationId` in the request.
  final String evaluationId;

  /// The ID of the `MLModel` that was the focus of the evaluation.
  final String mlModelId;

  /// The `DataSource` used for this evaluation.
  final String evaluationDataSourceId;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String inputDataLocationS3;

  /// The AWS user account that invoked the evaluation. The account type can be
  /// either an AWS root account or an AWS Identity and Access Management (IAM)
  /// user account.
  final String createdByIamUser;

  /// The time that the `Evaluation` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `Evaluation`. The time is
  /// expressed in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `Evaluation`.
  final String name;

  /// The status of the evaluation. This element can have one of the following
  /// values:
  ///
  /// *    `PENDING` - Amazon Machine Language (Amazon ML) submitted a request
  /// to evaluate an `MLModel`.
  /// *    `INPROGRESS` - The evaluation is underway.
  /// *    `FAILED` - The request to evaluate an `MLModel` did not run to
  /// completion. It is not usable.
  /// *    `COMPLETED` - The evaluation process completed successfully.
  /// *    `DELETED` - The `Evaluation` is marked as deleted. It is not usable.
  final String status;

  /// Measurements of how well the `MLModel` performed using observations
  /// referenced by the `DataSource`. One of the following metric is returned
  /// based on the type of the `MLModel`:
  ///
  /// *   BinaryAUC: A binary `MLModel` uses the Area Under the Curve (AUC)
  /// technique to measure performance.
  ///
  /// *   RegressionRMSE: A regression `MLModel` uses the Root Mean Square Error
  /// (RMSE) technique to measure performance. RMSE measures the difference
  /// between predicted and actual values for a single variable.
  ///
  /// *   MulticlassAvgFScore: A multiclass `MLModel` uses the F1 score
  /// technique to measure performance.
  ///
  ///
  ///  For more information about performance metrics, please see the
  /// [Amazon Machine Learning Developer Guide](http://docs.aws.amazon.com/machine-learning/latest/dg).
  final PerformanceMetrics performanceMetrics;

  /// A link to the file that contains logs of the `CreateEvaluation` operation.
  final String logUri;

  /// A description of the most recent details about evaluating the `MLModel`.
  final String message;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning
  /// spent processing the `Evaluation`, normalized and scaled on computation
  /// resources. `ComputeTime` is only available if the `Evaluation` is in the
  /// `COMPLETED` state.
  final BigInt computeTime;

  /// The epoch time when Amazon Machine Learning marked the `Evaluation` as
  /// `COMPLETED` or `FAILED`. `FinishedAt` is only available when the
  /// `Evaluation` is in the `COMPLETED` or `FAILED` state.
  final DateTime finishedAt;

  /// The epoch time when Amazon Machine Learning marked the `Evaluation` as
  /// `INPROGRESS`. `StartedAt` isn't available if the `Evaluation` is in the
  /// `PENDING` state.
  final DateTime startedAt;

  GetEvaluationOutput({
    this.evaluationId,
    this.mlModelId,
    this.evaluationDataSourceId,
    this.inputDataLocationS3,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.performanceMetrics,
    this.logUri,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
  });
  static GetEvaluationOutput fromJson(Map<String, dynamic> json) =>
      GetEvaluationOutput();
}

/// Represents the output of a `GetMLModel` operation, and provides detailed
/// information about a `MLModel`.
class GetMLModelOutput {
  /// The MLModel ID, which is same as the `MLModelId` in the request.
  final String mlModelId;

  /// The ID of the training `DataSource`.
  final String trainingDataSourceId;

  /// The AWS user account from which the `MLModel` was created. The account
  /// type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  final String createdByIamUser;

  /// The time that the `MLModel` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `MLModel`. The time is expressed
  /// in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `MLModel`.
  final String name;

  /// The current status of the `MLModel`. This element can have one of the
  /// following values:
  ///
  /// *    `PENDING` - Amazon Machine Learning (Amazon ML) submitted a request
  /// to describe a `MLModel`.
  /// *    `INPROGRESS` - The request is processing.
  /// *    `FAILED` - The request did not run to completion. The ML model isn't
  /// usable.
  /// *    `COMPLETED` - The request completed successfully.
  /// *    `DELETED` - The `MLModel` is marked as deleted. It isn't usable.
  final String status;

  final BigInt sizeInBytes;

  /// The current endpoint of the `MLModel`
  final RealtimeEndpointInfo endpointInfo;

  /// A list of the training parameters in the `MLModel`. The list is
  /// implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// *   `sgd.maxMLModelSizeInBytes` - The maximum allowed size of the model.
  /// Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  ///      The value is an integer that ranges from `100000` to `2147483648`.
  /// The default value is `33554432`.
  ///
  /// *   `sgd.maxPasses` - The number of times that the training process
  /// traverses the observations to build the `MLModel`. The value is an integer
  /// that ranges from `1` to `10000`. The default value is `10`.
  ///
  /// *   `sgd.shuffleType` - Whether Amazon ML shuffles the training data.
  /// Shuffling data improves a model's ability to find the optimal solution for
  /// a variety of data types. The valid values are `auto` and `none`. The
  /// default value is `none`. We strongly recommend that you shuffle your data.
  ///
  /// *   `sgd.l1RegularizationAmount` - The coefficient regularization L1 norm.
  /// It controls overfitting the data by penalizing large coefficients. This
  /// tends to drive coefficients to zero, resulting in a sparse feature set. If
  /// you use this parameter, start by specifying a small value, such as
  /// `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L1 normalization. This parameter can't be used when
  /// `L2` is specified. Use this parameter sparingly.
  ///
  /// *   `sgd.l2RegularizationAmount` - The coefficient regularization L2 norm.
  /// It controls overfitting the data by penalizing large coefficients. This
  /// tends to drive coefficients to small, nonzero values. If you use this
  /// parameter, start by specifying a small value, such as `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L2 normalization. This parameter can't be used when
  /// `L1` is specified. Use this parameter sparingly.
  final Map<String, String> trainingParameters;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String inputDataLocationS3;

  /// Identifies the `MLModel` category. The following are the available types:
  ///
  /// *   REGRESSION -- Produces a numeric result. For example, "What price
  /// should a house be listed at?"
  /// *   BINARY -- Produces one of two possible results. For example, "Is this
  /// an e-commerce website?"
  /// *   MULTICLASS -- Produces one of several possible results. For example,
  /// "Is this a HIGH, LOW or MEDIUM risk trade?"
  final String mlModelType;

  /// The scoring threshold is used in binary classification `MLModel` models.
  /// It marks the boundary between a positive prediction and a negative
  /// prediction.
  ///
  /// Output values greater than or equal to the threshold receive a positive
  /// result from the MLModel, such as `true`. Output values less than the
  /// threshold receive a negative response from the MLModel, such as `false`.
  final double scoreThreshold;

  /// The time of the most recent edit to the `ScoreThreshold`. The time is
  /// expressed in epoch time.
  final DateTime scoreThresholdLastUpdatedAt;

  /// A link to the file that contains logs of the `CreateMLModel` operation.
  final String logUri;

  /// A description of the most recent details about accessing the `MLModel`.
  final String message;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning
  /// spent processing the `MLModel`, normalized and scaled on computation
  /// resources. `ComputeTime` is only available if the `MLModel` is in the
  /// `COMPLETED` state.
  final BigInt computeTime;

  /// The epoch time when Amazon Machine Learning marked the `MLModel` as
  /// `COMPLETED` or `FAILED`. `FinishedAt` is only available when the `MLModel`
  /// is in the `COMPLETED` or `FAILED` state.
  final DateTime finishedAt;

  /// The epoch time when Amazon Machine Learning marked the `MLModel` as
  /// `INPROGRESS`. `StartedAt` isn't available if the `MLModel` is in the
  /// `PENDING` state.
  final DateTime startedAt;

  /// The recipe to use when training the `MLModel`. The `Recipe` provides
  /// detailed information about the observation data to use during training,
  /// and manipulations to perform on the observation data during training.
  ///
  ///  Note
  ///
  /// This parameter is provided as part of the verbose format.
  final String recipe;

  /// The schema used by all of the data files referenced by the `DataSource`.
  ///
  ///  Note
  ///
  /// This parameter is provided as part of the verbose format.
  final String schema;

  GetMLModelOutput({
    this.mlModelId,
    this.trainingDataSourceId,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.sizeInBytes,
    this.endpointInfo,
    this.trainingParameters,
    this.inputDataLocationS3,
    this.mlModelType,
    this.scoreThreshold,
    this.scoreThresholdLastUpdatedAt,
    this.logUri,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
    this.recipe,
    this.schema,
  });
  static GetMLModelOutput fromJson(Map<String, dynamic> json) =>
      GetMLModelOutput();
}

///  Represents the output of a `GetMLModel` operation.
///
/// The content consists of the detailed metadata and the current status of the
/// `MLModel`.
class MLModel {
  /// The ID assigned to the `MLModel` at creation.
  final String mlModelId;

  /// The ID of the training `DataSource`. The `CreateMLModel` operation uses
  /// the `TrainingDataSourceId`.
  final String trainingDataSourceId;

  /// The AWS user account from which the `MLModel` was created. The account
  /// type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  final String createdByIamUser;

  /// The time that the `MLModel` was created. The time is expressed in epoch
  /// time.
  final DateTime createdAt;

  /// The time of the most recent edit to the `MLModel`. The time is expressed
  /// in epoch time.
  final DateTime lastUpdatedAt;

  /// A user-supplied name or description of the `MLModel`.
  final String name;

  /// The current status of an `MLModel`. This element can have one of the
  /// following values:
  ///
  /// *    `PENDING` - Amazon Machine Learning (Amazon ML) submitted a request
  /// to create an `MLModel`.
  /// *    `INPROGRESS` - The creation process is underway.
  /// *    `FAILED` - The request to create an `MLModel` didn't run to
  /// completion. The model isn't usable.
  /// *    `COMPLETED` - The creation process completed successfully.
  /// *    `DELETED` - The `MLModel` is marked as deleted. It isn't usable.
  final String status;

  final BigInt sizeInBytes;

  /// The current endpoint of the `MLModel`.
  final RealtimeEndpointInfo endpointInfo;

  /// A list of the training parameters in the `MLModel`. The list is
  /// implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// *   `sgd.maxMLModelSizeInBytes` - The maximum allowed size of the model.
  /// Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  ///      The value is an integer that ranges from `100000` to `2147483648`.
  /// The default value is `33554432`.
  ///
  /// *   `sgd.maxPasses` - The number of times that the training process
  /// traverses the observations to build the `MLModel`. The value is an integer
  /// that ranges from `1` to `10000`. The default value is `10`.
  ///
  /// *   `sgd.shuffleType` - Whether Amazon ML shuffles the training data.
  /// Shuffling the data improves a model's ability to find the optimal solution
  /// for a variety of data types. The valid values are `auto` and `none`. The
  /// default value is `none`.
  ///
  /// *   `sgd.l1RegularizationAmount` - The coefficient regularization L1 norm,
  /// which controls overfitting the data by penalizing large coefficients. This
  /// parameter tends to drive coefficients to zero, resulting in sparse feature
  /// set. If you use this parameter, start by specifying a small value, such as
  /// `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L1 normalization. This parameter can't be used when
  /// `L2` is specified. Use this parameter sparingly.
  ///
  /// *   `sgd.l2RegularizationAmount` - The coefficient regularization L2 norm,
  /// which controls overfitting the data by penalizing large coefficients. This
  /// tends to drive coefficients to small, nonzero values. If you use this
  /// parameter, start by specifying a small value, such as `1.0E-08`.
  ///
  ///     The value is a double that ranges from `0` to `MAX_DOUBLE`. The
  /// default is to not use L2 normalization. This parameter can't be used when
  /// `L1` is specified. Use this parameter sparingly.
  final Map<String, String> trainingParameters;

  /// The location of the data file or directory in Amazon Simple Storage
  /// Service (Amazon S3).
  final String inputDataLocationS3;

  /// The algorithm used to train the `MLModel`. The following algorithm is
  /// supported:
  ///
  /// *    `SGD` -- Stochastic gradient descent. The goal of `SGD` is to
  /// minimize the gradient of the loss function.
  final String algorithm;

  /// Identifies the `MLModel` category. The following are the available types:
  ///
  /// *    `REGRESSION` - Produces a numeric result. For example, "What price
  /// should a house be listed at?"
  /// *    `BINARY` - Produces one of two possible results. For example, "Is
  /// this a child-friendly web site?".
  /// *    `MULTICLASS` - Produces one of several possible results. For example,
  /// "Is this a HIGH-, LOW-, or MEDIUM-risk trade?".
  final String mlModelType;

  final double scoreThreshold;

  /// The time of the most recent edit to the `ScoreThreshold`. The time is
  /// expressed in epoch time.
  final DateTime scoreThresholdLastUpdatedAt;

  /// A description of the most recent details about accessing the `MLModel`.
  final String message;

  final BigInt computeTime;

  final DateTime finishedAt;

  final DateTime startedAt;

  MLModel({
    this.mlModelId,
    this.trainingDataSourceId,
    this.createdByIamUser,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.status,
    this.sizeInBytes,
    this.endpointInfo,
    this.trainingParameters,
    this.inputDataLocationS3,
    this.algorithm,
    this.mlModelType,
    this.scoreThreshold,
    this.scoreThresholdLastUpdatedAt,
    this.message,
    this.computeTime,
    this.finishedAt,
    this.startedAt,
  });
  static MLModel fromJson(Map<String, dynamic> json) => MLModel();
}

/// Measurements of how well the `MLModel` performed on known observations. One
/// of the following metrics is returned, based on the type of the `MLModel`:
///
/// *   BinaryAUC: The binary `MLModel` uses the Area Under the Curve (AUC)
/// technique to measure performance.
///
/// *   RegressionRMSE: The regression `MLModel` uses the Root Mean Square Error
/// (RMSE) technique to measure performance. RMSE measures the difference
/// between predicted and actual values for a single variable.
///
/// *   MulticlassAvgFScore: The multiclass `MLModel` uses the F1 score
/// technique to measure performance.
///
///
///  For more information about performance metrics, please see the
/// [Amazon Machine Learning Developer Guide](http://docs.aws.amazon.com/machine-learning/latest/dg).
class PerformanceMetrics {
  final Map<String, String> properties;

  PerformanceMetrics({
    this.properties,
  });
  static PerformanceMetrics fromJson(Map<String, dynamic> json) =>
      PerformanceMetrics();
}

class PredictOutput {
  final Prediction prediction;

  PredictOutput({
    this.prediction,
  });
  static PredictOutput fromJson(Map<String, dynamic> json) => PredictOutput();
}

/// The output from a `Predict` operation:
///
/// *    `Details` - Contains the following attributes:
/// `DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS`
/// `DetailsAttributes.ALGORITHM - SGD`
///
/// *    `PredictedLabel` - Present for either a `BINARY` or `MULTICLASS`
/// `MLModel` request.
///
/// *    `PredictedScores` - Contains the raw classification score corresponding
/// to each label.
///
/// *    `PredictedValue` - Present for a `REGRESSION` `MLModel` request.
class Prediction {
  /// The prediction label for either a `BINARY` or `MULTICLASS` `MLModel`.
  final String predictedLabel;

  /// The prediction value for `REGRESSION` `MLModel`.
  final double predictedValue;

  final Map<String, double> predictedScores;

  final Map<String, String> details;

  Prediction({
    this.predictedLabel,
    this.predictedValue,
    this.predictedScores,
    this.details,
  });
  static Prediction fromJson(Map<String, dynamic> json) => Prediction();
}

/// The data specification of an Amazon Relational Database Service (Amazon RDS)
/// `DataSource`.
class RdsDataSpec {
  /// Describes the `DatabaseName` and `InstanceIdentifier` of an Amazon RDS
  /// database.
  final RdsDatabase databaseInformation;

  /// The query that is used to retrieve the observation data for the
  /// `DataSource`.
  final String selectSqlQuery;

  /// The AWS Identity and Access Management (IAM) credentials that are used
  /// connect to the Amazon RDS database.
  final RdsDatabaseCredentials databaseCredentials;

  /// The Amazon S3 location for staging Amazon RDS data. The data retrieved
  /// from Amazon RDS using `SelectSqlQuery` is stored in this location.
  final String s3StagingLocation;

  /// A JSON string that represents the splitting and rearrangement processing
  /// to be applied to a `DataSource`. If the `DataRearrangement` parameter is
  /// not provided, all of the input data is used to create the `Datasource`.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// *   **`percentBegin`**
  ///
  ///     Use `percentBegin` to indicate the beginning of the range of the data
  /// used to create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`percentEnd`**
  ///
  ///     Use `percentEnd` to indicate the end of the range of the data used to
  /// create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`complement`**
  ///
  ///     The `complement` parameter instructs Amazon ML to use the data that is
  /// not included in the range of `percentBegin` to `percentEnd` to create a
  /// datasource. The `complement` parameter is useful if you need to create
  /// complementary datasources for training and evaluation. To create a
  /// complementary datasource, use the same values for `percentBegin` and
  /// `percentEnd`, along with the `complement` parameter.
  ///
  ///     For example, the following two datasources do not share any data, and
  /// can be used to train and evaluate a model. The first datasource has 25
  /// percent of the data, and the second one has 75 percent of the data.
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}`
  ///
  /// *   **`strategy`**
  ///
  ///     To change how Amazon ML splits the data for a datasource, use the
  /// `strategy` parameter.
  ///
  ///     The default value for the `strategy` parameter is `sequential`,
  /// meaning that Amazon ML takes all of the data records between the
  /// `percentBegin` and `percentEnd` parameters for the datasource, in the
  /// order that the records appear in the input data.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}`
  ///
  ///     To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the `strategy` parameter to
  /// `random` and provide a string that is used as the seed value for the
  /// random data splitting (for example, you can use the S3 path to your data
  /// as the random seed string). If you choose the random split strategy,
  /// Amazon ML assigns each row of data a pseudo-random number between 0 and
  /// 100, and then selects the rows that have an assigned number between
  /// `percentBegin` and `percentEnd`. Pseudo-random numbers are assigned using
  /// both the input seed string value and the byte offset as a seed, so
  /// changing the data results in a different split. Any existing ordering is
  /// preserved. The random splitting strategy ensures that variables in the
  /// training and evaluation data are distributed similarly. It is useful in
  /// the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}`
  final String dataRearrangement;

  /// A JSON string that represents the schema for an Amazon RDS `DataSource`.
  /// The `DataSchema` defines the structure of the observation data in the data
  /// file(s) referenced in the `DataSource`.
  ///
  /// A `DataSchema` is not required if you specify a `DataSchemaUri`
  ///
  /// Define your `DataSchema` as a series of key-value pairs. `attributes` and
  /// `excludedVariableNames` have an array of key-value pairs for their value.
  /// Use the following format to define your `DataSchema`.
  ///
  /// { "version": "1.0",
  ///
  ///  "recordAnnotationFieldName": "F1",
  ///
  ///  "recordWeightFieldName": "F2",
  ///
  ///  "targetFieldName": "F3",
  ///
  ///  "dataFormat": "CSV",
  ///
  ///  "dataFileContainsHeader": true,
  ///
  ///  "attributes": [
  ///
  ///  { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  ///  "excludedVariableNames": [ "F6" ] }
  final String dataSchema;

  /// The Amazon S3 location of the `DataSchema`.
  final String dataSchemaUri;

  /// The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic
  /// Compute Cloud (Amazon EC2) instance to carry out the copy operation from
  /// Amazon RDS to an Amazon S3 task. For more information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  final String resourceRole;

  /// The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service to
  /// monitor the progress of the copy task from Amazon RDS to Amazon S3. For
  /// more information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  final String serviceRole;

  /// The subnet ID to be used to access a VPC-based RDS DB instance. This
  /// attribute is used by Data Pipeline to carry out the copy task from Amazon
  /// RDS to Amazon S3.
  final String subnetId;

  /// The security group IDs to be used to access a VPC-based RDS DB instance.
  /// Ensure that there are appropriate ingress rules set up to allow access to
  /// the RDS DB instance. This attribute is used by Data Pipeline to carry out
  /// the copy operation from Amazon RDS to an Amazon S3 task.
  final List<String> securityGroupIds;

  RdsDataSpec({
    @required this.databaseInformation,
    @required this.selectSqlQuery,
    @required this.databaseCredentials,
    @required this.s3StagingLocation,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaUri,
    @required this.resourceRole,
    @required this.serviceRole,
    @required this.subnetId,
    @required this.securityGroupIds,
  });
}

/// The database details of an Amazon RDS database.
class RdsDatabase {
  /// The ID of an RDS DB instance.
  final String instanceIdentifier;

  final String databaseName;

  RdsDatabase({
    @required this.instanceIdentifier,
    @required this.databaseName,
  });
  static RdsDatabase fromJson(Map<String, dynamic> json) => RdsDatabase();
}

/// The database credentials to connect to a database on an RDS DB instance.
class RdsDatabaseCredentials {
  final String username;

  final String password;

  RdsDatabaseCredentials({
    @required this.username,
    @required this.password,
  });
}

/// The datasource details that are specific to Amazon RDS.
class RdsMetadata {
  /// The database details required to connect to an Amazon RDS.
  final RdsDatabase database;

  final String databaseUserName;

  /// The SQL query that is supplied during CreateDataSourceFromRDS. Returns
  /// only if `Verbose` is true in `GetDataSourceInput`.
  final String selectSqlQuery;

  /// The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2
  /// instance to carry out the copy task from Amazon RDS to Amazon S3. For more
  /// information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  final String resourceRole;

  /// The role (DataPipelineDefaultRole) assumed by the Data Pipeline service to
  /// monitor the progress of the copy task from Amazon RDS to Amazon S3. For
  /// more information, see
  /// [Role templates](http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html)
  /// for data pipelines.
  final String serviceRole;

  /// The ID of the Data Pipeline instance that is used to carry to copy data
  /// from Amazon RDS to Amazon S3. You can use the ID to find details about the
  /// instance in the Data Pipeline console.
  final String dataPipelineId;

  RdsMetadata({
    this.database,
    this.databaseUserName,
    this.selectSqlQuery,
    this.resourceRole,
    this.serviceRole,
    this.dataPipelineId,
  });
  static RdsMetadata fromJson(Map<String, dynamic> json) => RdsMetadata();
}

///  Describes the real-time endpoint information for an `MLModel`.
class RealtimeEndpointInfo {
  ///  The maximum processing rate for the real-time endpoint for `MLModel`,
  /// measured in incoming requests per second.
  final int peakRequestsPerSecond;

  /// The time that the request to create the real-time endpoint for the
  /// `MLModel` was received. The time is expressed in epoch time.
  final DateTime createdAt;

  /// The URI that specifies where to send real-time prediction requests for the
  /// `MLModel`.
  ///
  ///  Note
  ///
  /// The application must wait until the real-time endpoint is ready before
  /// using this URI.
  final String endpointUrl;

  ///  The current status of the real-time endpoint for the `MLModel`. This
  /// element can have one of the following values:
  ///
  /// *    `NONE` - Endpoint does not exist or was previously deleted.
  /// *    `READY` - Endpoint is ready to be used for real-time predictions.
  /// *    `UPDATING` - Updating/creating the endpoint.
  final String endpointStatus;

  RealtimeEndpointInfo({
    this.peakRequestsPerSecond,
    this.createdAt,
    this.endpointUrl,
    this.endpointStatus,
  });
  static RealtimeEndpointInfo fromJson(Map<String, dynamic> json) =>
      RealtimeEndpointInfo();
}

/// Describes the data specification of an Amazon Redshift `DataSource`.
class RedshiftDataSpec {
  /// Describes the `DatabaseName` and `ClusterIdentifier` for an Amazon
  /// Redshift `DataSource`.
  final RedshiftDatabase databaseInformation;

  /// Describes the SQL Query to execute on an Amazon Redshift database for an
  /// Amazon Redshift `DataSource`.
  final String selectSqlQuery;

  /// Describes AWS Identity and Access Management (IAM) credentials that are
  /// used connect to the Amazon Redshift database.
  final RedshiftDatabaseCredentials databaseCredentials;

  /// Describes an Amazon S3 location to store the result set of the
  /// `SelectSqlQuery` query.
  final String s3StagingLocation;

  /// A JSON string that represents the splitting and rearrangement processing
  /// to be applied to a `DataSource`. If the `DataRearrangement` parameter is
  /// not provided, all of the input data is used to create the `Datasource`.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// *   **`percentBegin`**
  ///
  ///     Use `percentBegin` to indicate the beginning of the range of the data
  /// used to create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`percentEnd`**
  ///
  ///     Use `percentEnd` to indicate the end of the range of the data used to
  /// create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`complement`**
  ///
  ///     The `complement` parameter instructs Amazon ML to use the data that is
  /// not included in the range of `percentBegin` to `percentEnd` to create a
  /// datasource. The `complement` parameter is useful if you need to create
  /// complementary datasources for training and evaluation. To create a
  /// complementary datasource, use the same values for `percentBegin` and
  /// `percentEnd`, along with the `complement` parameter.
  ///
  ///     For example, the following two datasources do not share any data, and
  /// can be used to train and evaluate a model. The first datasource has 25
  /// percent of the data, and the second one has 75 percent of the data.
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}`
  ///
  /// *   **`strategy`**
  ///
  ///     To change how Amazon ML splits the data for a datasource, use the
  /// `strategy` parameter.
  ///
  ///     The default value for the `strategy` parameter is `sequential`,
  /// meaning that Amazon ML takes all of the data records between the
  /// `percentBegin` and `percentEnd` parameters for the datasource, in the
  /// order that the records appear in the input data.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}`
  ///
  ///     To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the `strategy` parameter to
  /// `random` and provide a string that is used as the seed value for the
  /// random data splitting (for example, you can use the S3 path to your data
  /// as the random seed string). If you choose the random split strategy,
  /// Amazon ML assigns each row of data a pseudo-random number between 0 and
  /// 100, and then selects the rows that have an assigned number between
  /// `percentBegin` and `percentEnd`. Pseudo-random numbers are assigned using
  /// both the input seed string value and the byte offset as a seed, so
  /// changing the data results in a different split. Any existing ordering is
  /// preserved. The random splitting strategy ensures that variables in the
  /// training and evaluation data are distributed similarly. It is useful in
  /// the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}`
  final String dataRearrangement;

  /// A JSON string that represents the schema for an Amazon Redshift
  /// `DataSource`. The `DataSchema` defines the structure of the observation
  /// data in the data file(s) referenced in the `DataSource`.
  ///
  /// A `DataSchema` is not required if you specify a `DataSchemaUri`.
  ///
  /// Define your `DataSchema` as a series of key-value pairs. `attributes` and
  /// `excludedVariableNames` have an array of key-value pairs for their value.
  /// Use the following format to define your `DataSchema`.
  ///
  /// { "version": "1.0",
  ///
  ///  "recordAnnotationFieldName": "F1",
  ///
  ///  "recordWeightFieldName": "F2",
  ///
  ///  "targetFieldName": "F3",
  ///
  ///  "dataFormat": "CSV",
  ///
  ///  "dataFileContainsHeader": true,
  ///
  ///  "attributes": [
  ///
  ///  { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  ///  "excludedVariableNames": [ "F6" ] }
  final String dataSchema;

  /// Describes the schema location for an Amazon Redshift `DataSource`.
  final String dataSchemaUri;

  RedshiftDataSpec({
    @required this.databaseInformation,
    @required this.selectSqlQuery,
    @required this.databaseCredentials,
    @required this.s3StagingLocation,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaUri,
  });
}

/// Describes the database details required to connect to an Amazon Redshift
/// database.
class RedshiftDatabase {
  final String databaseName;

  final String clusterIdentifier;

  RedshiftDatabase({
    @required this.databaseName,
    @required this.clusterIdentifier,
  });
  static RedshiftDatabase fromJson(Map<String, dynamic> json) =>
      RedshiftDatabase();
}

///  Describes the database credentials for connecting to a database on an
/// Amazon Redshift cluster.
class RedshiftDatabaseCredentials {
  final String username;

  final String password;

  RedshiftDatabaseCredentials({
    @required this.username,
    @required this.password,
  });
}

/// Describes the `DataSource` details specific to Amazon Redshift.
class RedshiftMetadata {
  final RedshiftDatabase redshiftDatabase;

  final String databaseUserName;

  ///  The SQL query that is specified during CreateDataSourceFromRedshift.
  /// Returns only if `Verbose` is true in GetDataSourceInput.
  final String selectSqlQuery;

  RedshiftMetadata({
    this.redshiftDatabase,
    this.databaseUserName,
    this.selectSqlQuery,
  });
  static RedshiftMetadata fromJson(Map<String, dynamic> json) =>
      RedshiftMetadata();
}

///  Describes the data specification of a `DataSource`.
class S3DataSpec {
  /// The location of the data file(s) used by a `DataSource`. The URI specifies
  /// a data file or an Amazon Simple Storage Service (Amazon S3) directory or
  /// bucket containing data files.
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement processing
  /// to be applied to a `DataSource`. If the `DataRearrangement` parameter is
  /// not provided, all of the input data is used to create the `Datasource`.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// *   **`percentBegin`**
  ///
  ///     Use `percentBegin` to indicate the beginning of the range of the data
  /// used to create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`percentEnd`**
  ///
  ///     Use `percentEnd` to indicate the end of the range of the data used to
  /// create the Datasource. If you do not include `percentBegin` and
  /// `percentEnd`, Amazon ML includes all of the data when creating the
  /// datasource.
  ///
  /// *   **`complement`**
  ///
  ///     The `complement` parameter instructs Amazon ML to use the data that is
  /// not included in the range of `percentBegin` to `percentEnd` to create a
  /// datasource. The `complement` parameter is useful if you need to create
  /// complementary datasources for training and evaluation. To create a
  /// complementary datasource, use the same values for `percentBegin` and
  /// `percentEnd`, along with the `complement` parameter.
  ///
  ///     For example, the following two datasources do not share any data, and
  /// can be used to train and evaluate a model. The first datasource has 25
  /// percent of the data, and the second one has 75 percent of the data.
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}`
  ///
  /// *   **`strategy`**
  ///
  ///     To change how Amazon ML splits the data for a datasource, use the
  /// `strategy` parameter.
  ///
  ///     The default value for the `strategy` parameter is `sequential`,
  /// meaning that Amazon ML takes all of the data records between the
  /// `percentBegin` and `percentEnd` parameters for the datasource, in the
  /// order that the records appear in the input data.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}`
  ///
  ///     To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the `strategy` parameter to
  /// `random` and provide a string that is used as the seed value for the
  /// random data splitting (for example, you can use the S3 path to your data
  /// as the random seed string). If you choose the random split strategy,
  /// Amazon ML assigns each row of data a pseudo-random number between 0 and
  /// 100, and then selects the rows that have an assigned number between
  /// `percentBegin` and `percentEnd`. Pseudo-random numbers are assigned using
  /// both the input seed string value and the byte offset as a seed, so
  /// changing the data results in a different split. Any existing ordering is
  /// preserved. The random splitting strategy ensures that variables in the
  /// training and evaluation data are distributed similarly. It is useful in
  /// the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  ///     The following two `DataRearrangement` lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  ///     Datasource for evaluation: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}`
  ///
  ///     Datasource for training: `{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}`
  final String dataRearrangement;

  ///  A JSON string that represents the schema for an Amazon S3 `DataSource`.
  /// The `DataSchema` defines the structure of the observation data in the data
  /// file(s) referenced in the `DataSource`.
  ///
  /// You must provide either the `DataSchema` or the `DataSchemaLocationS3`.
  ///
  /// Define your `DataSchema` as a series of key-value pairs. `attributes` and
  /// `excludedVariableNames` have an array of key-value pairs for their value.
  /// Use the following format to define your `DataSchema`.
  ///
  /// { "version": "1.0",
  ///
  ///  "recordAnnotationFieldName": "F1",
  ///
  ///  "recordWeightFieldName": "F2",
  ///
  ///  "targetFieldName": "F3",
  ///
  ///  "dataFormat": "CSV",
  ///
  ///  "dataFileContainsHeader": true,
  ///
  ///  "attributes": [
  ///
  ///  { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2", "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" }, { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5", "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, { "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName": "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  ///  "excludedVariableNames": [ "F6" ] }
  final String dataSchema;

  /// Describes the schema location in Amazon S3. You must provide either the
  /// `DataSchema` or the `DataSchemaLocationS3`.
  final String dataSchemaLocationS3;

  S3DataSpec({
    @required this.dataLocationS3,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaLocationS3,
  });
}

/// A custom key-value pair associated with an ML object, such as an ML model.
class Tag {
  /// A unique identifier for the tag. Valid characters include Unicode letters,
  /// digits, white space, _, ., /, =, +, -, %, and @.
  final String key;

  /// An optional string, typically used to describe or define the tag. Valid
  /// characters include Unicode letters, digits, white space, _, ., /, =, +, -,
  /// %, and @.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// Represents the output of an `UpdateBatchPrediction` operation.
///
/// You can see the updated content by using the `GetBatchPrediction` operation.
class UpdateBatchPredictionOutput {
  /// The ID assigned to the `BatchPrediction` during creation. This value
  /// should be identical to the value of the `BatchPredictionId` in the
  /// request.
  final String batchPredictionId;

  UpdateBatchPredictionOutput({
    this.batchPredictionId,
  });
  static UpdateBatchPredictionOutput fromJson(Map<String, dynamic> json) =>
      UpdateBatchPredictionOutput();
}

/// Represents the output of an `UpdateDataSource` operation.
///
/// You can see the updated content by using the `GetBatchPrediction` operation.
class UpdateDataSourceOutput {
  /// The ID assigned to the `DataSource` during creation. This value should be
  /// identical to the value of the `DataSourceID` in the request.
  final String dataSourceId;

  UpdateDataSourceOutput({
    this.dataSourceId,
  });
  static UpdateDataSourceOutput fromJson(Map<String, dynamic> json) =>
      UpdateDataSourceOutput();
}

/// Represents the output of an `UpdateEvaluation` operation.
///
/// You can see the updated content by using the `GetEvaluation` operation.
class UpdateEvaluationOutput {
  /// The ID assigned to the `Evaluation` during creation. This value should be
  /// identical to the value of the `Evaluation` in the request.
  final String evaluationId;

  UpdateEvaluationOutput({
    this.evaluationId,
  });
  static UpdateEvaluationOutput fromJson(Map<String, dynamic> json) =>
      UpdateEvaluationOutput();
}

/// Represents the output of an `UpdateMLModel` operation.
///
/// You can see the updated content by using the `GetMLModel` operation.
class UpdateMLModelOutput {
  /// The ID assigned to the `MLModel` during creation. This value should be
  /// identical to the value of the `MLModelID` in the request.
  final String mlModelId;

  UpdateMLModelOutput({
    this.mlModelId,
  });
  static UpdateMLModelOutput fromJson(Map<String, dynamic> json) =>
      UpdateMLModelOutput();
}
