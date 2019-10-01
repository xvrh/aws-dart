import 'package:meta/meta.dart';

/// Definition of the public APIs exposed by Amazon Machine Learning
class MachineLearningApi {
  /// Adds one or more tags to an object, up to a limit of 10. Each tag consists
  /// of a key and an optional value. If you add a tag using a key that is
  /// already associated with the ML object, `AddTags` updates the tag's value.
  Future<void> addTags(
      {@required List<Tag> tags,
      @required String resourceId,
      @required String resourceType}) async {}

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
  Future<void> createBatchPrediction(
      {@required String batchPredictionId,
      String batchPredictionName,
      @required String mlModelId,
      @required String batchPredictionDataSourceId,
      @required String outputUri}) async {}

  /// Creates a `DataSource` object from an  [Amazon Relational Database
  /// Service](http://aws.amazon.com/rds/) (Amazon RDS). A `DataSource`
  /// references data that can be used to perform `CreateMLModel`,
  /// `CreateEvaluation`, or `CreateBatchPrediction` operations.
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
  Future<void> createDataSourceFromRds(
      {@required String dataSourceId,
      String dataSourceName,
      @required RdsDataSpec rdsData,
      @required String roleArn,
      bool computeStatistics}) async {}

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
  Future<void> createDataSourceFromRedshift(
      {@required String dataSourceId,
      String dataSourceName,
      @required RedshiftDataSpec dataSpec,
      @required String roleArn,
      bool computeStatistics}) async {}

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
  Future<void> createDataSourceFromS3(
      {@required String dataSourceId,
      String dataSourceName,
      @required S3DataSpec dataSpec,
      bool computeStatistics}) async {}

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
  Future<void> createEvaluation(
      {@required String evaluationId,
      String evaluationName,
      @required String mlModelId,
      @required String evaluationDataSourceId}) async {}

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
  Future<void> createMLModel(
      {@required String mlModelId,
      String mlModelName,
      @required String mlModelType,
      Map<String, String> parameters,
      @required String trainingDataSourceId,
      String recipe,
      String recipeUri}) async {}

  /// Creates a real-time endpoint for the `MLModel`. The endpoint contains the
  /// URI of the `MLModel`; that is, the location to send real-time prediction
  /// requests for the specified `MLModel`.
  Future<void> createRealtimeEndpoint(String mlModelId) async {}

  /// Assigns the DELETED status to a `BatchPrediction`, rendering it unusable.
  ///
  /// After using the `DeleteBatchPrediction` operation, you can use the
  /// GetBatchPrediction operation to verify that the status of the
  /// `BatchPrediction` changed to DELETED.
  ///
  /// **Caution:** The result of the `DeleteBatchPrediction` operation is
  /// irreversible.
  Future<void> deleteBatchPrediction(String batchPredictionId) async {}

  /// Assigns the DELETED status to a `DataSource`, rendering it unusable.
  ///
  /// After using the `DeleteDataSource` operation, you can use the
  /// GetDataSource operation to verify that the status of the `DataSource`
  /// changed to DELETED.
  ///
  /// **Caution:** The results of the `DeleteDataSource` operation are
  /// irreversible.
  Future<void> deleteDataSource(String dataSourceId) async {}

  /// Assigns the `DELETED` status to an `Evaluation`, rendering it unusable.
  ///
  /// After invoking the `DeleteEvaluation` operation, you can use the
  /// `GetEvaluation` operation to verify that the status of the `Evaluation`
  /// changed to `DELETED`.
  ///
  ///  Caution
  ///
  /// The results of the `DeleteEvaluation` operation are irreversible.
  Future<void> deleteEvaluation(String evaluationId) async {}

  /// Assigns the `DELETED` status to an `MLModel`, rendering it unusable.
  ///
  /// After using the `DeleteMLModel` operation, you can use the `GetMLModel`
  /// operation to verify that the status of the `MLModel` changed to DELETED.
  ///
  /// **Caution:** The result of the `DeleteMLModel` operation is irreversible.
  Future<void> deleteMLModel(String mlModelId) async {}

  /// Deletes a real time endpoint of an `MLModel`.
  Future<void> deleteRealtimeEndpoint(String mlModelId) async {}

  /// Deletes the specified tags associated with an ML object. After this
  /// operation is complete, you can't recover deleted tags.
  ///
  /// If you specify a tag that doesn't exist, Amazon ML ignores it.
  Future<void> deleteTags(
      {@required List<String> tagKeys,
      @required String resourceId,
      @required String resourceType}) async {}

  /// Returns a list of `BatchPrediction` operations that match the search
  /// criteria in the request.
  Future<void> describeBatchPredictions(
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
      int limit}) async {}

  /// Returns a list of `DataSource` that match the search criteria in the
  /// request.
  Future<void> describeDataSources(
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
      int limit}) async {}

  /// Returns a list of `DescribeEvaluations` that match the search criteria in
  /// the request.
  Future<void> describeEvaluations(
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
      int limit}) async {}

  /// Returns a list of `MLModel` that match the search criteria in the request.
  Future<void> describeMLModels(
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
      int limit}) async {}

  /// Describes one or more of the tags for your Amazon ML object.
  Future<void> describeTags(
      {@required String resourceId, @required String resourceType}) async {}

  /// Returns a `BatchPrediction` that includes detailed metadata, status, and
  /// data file information for a `Batch Prediction` request.
  Future<void> getBatchPrediction(String batchPredictionId) async {}

  /// Returns a `DataSource` that includes metadata and data file information,
  /// as well as the current status of the `DataSource`.
  ///
  /// `GetDataSource` provides results in normal or verbose format. The verbose
  /// format adds the schema description and the list of files pointed to by the
  /// DataSource to the normal format.
  Future<void> getDataSource(String dataSourceId, {bool verbose}) async {}

  /// Returns an `Evaluation` that includes metadata as well as the current
  /// status of the `Evaluation`.
  Future<void> getEvaluation(String evaluationId) async {}

  /// Returns an `MLModel` that includes detailed metadata, data source
  /// information, and the current status of the `MLModel`.
  ///
  /// `GetMLModel` provides results in normal or verbose format.
  Future<void> getMLModel(String mlModelId, {bool verbose}) async {}

  /// Generates a prediction for the observation using the specified `ML Model`.
  ///
  ///  Note
  ///
  /// Not all response parameters will be populated. Whether a response
  /// parameter is populated depends on the type of model requested.
  Future<void> predict(
      {@required String mlModelId,
      @required Map<String, String> record,
      @required String predictEndpoint}) async {}

  /// Updates the `BatchPredictionName` of a `BatchPrediction`.
  ///
  /// You can use the `GetBatchPrediction` operation to view the contents of the
  /// updated data element.
  Future<void> updateBatchPrediction(
      {@required String batchPredictionId,
      @required String batchPredictionName}) async {}

  /// Updates the `DataSourceName` of a `DataSource`.
  ///
  /// You can use the `GetDataSource` operation to view the contents of the
  /// updated data element.
  Future<void> updateDataSource(
      {@required String dataSourceId, @required String dataSourceName}) async {}

  /// Updates the `EvaluationName` of an `Evaluation`.
  ///
  /// You can use the `GetEvaluation` operation to view the contents of the
  /// updated data element.
  Future<void> updateEvaluation(
      {@required String evaluationId, @required String evaluationName}) async {}

  /// Updates the `MLModelName` and the `ScoreThreshold` of an `MLModel`.
  ///
  /// You can use the `GetMLModel` operation to view the contents of the updated
  /// data element.
  Future<void> updateMLModel(String mlModelId,
      {String mlModelName, double scoreThreshold}) async {}
}

class AddTagsOutput {}

class BatchPrediction {}

class CreateBatchPredictionOutput {}

class CreateDataSourceFromRdsOutput {}

class CreateDataSourceFromRedshiftOutput {}

class CreateDataSourceFromS3Output {}

class CreateEvaluationOutput {}

class CreateMLModelOutput {}

class CreateRealtimeEndpointOutput {}

class DataSource {}

class DeleteBatchPredictionOutput {}

class DeleteDataSourceOutput {}

class DeleteEvaluationOutput {}

class DeleteMLModelOutput {}

class DeleteRealtimeEndpointOutput {}

class DeleteTagsOutput {}

class DescribeBatchPredictionsOutput {}

class DescribeDataSourcesOutput {}

class DescribeEvaluationsOutput {}

class DescribeMLModelsOutput {}

class DescribeTagsOutput {}

class Evaluation {}

class GetBatchPredictionOutput {}

class GetDataSourceOutput {}

class GetEvaluationOutput {}

class GetMLModelOutput {}

class MLModel {}

class PerformanceMetrics {}

class PredictOutput {}

class Prediction {}

class RdsDataSpec {}

class RdsDatabase {}

class RdsDatabaseCredentials {}

class RdsMetadata {}

class RealtimeEndpointInfo {}

class RedshiftDataSpec {}

class RedshiftDatabase {}

class RedshiftDatabaseCredentials {}

class RedshiftMetadata {}

class S3DataSpec {}

class Tag {}

class UpdateBatchPredictionOutput {}

class UpdateDataSourceOutput {}

class UpdateEvaluationOutput {}

class UpdateMLModelOutput {}
