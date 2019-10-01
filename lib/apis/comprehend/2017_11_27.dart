import 'package:meta/meta.dart';

/// Amazon Comprehend is an AWS service for gaining insight into the content of
/// documents. Use these actions to determine the topics contained in your
/// documents, the topics they discuss, the predominant sentiment expressed in
/// them, the predominant language used, and more.
class ComprehendApi {
  /// Determines the dominant language of the input text for a batch of
  /// documents. For a list of languages that Amazon Comprehend can detect, see
  /// [Amazon Comprehend Supported
  /// Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).
  Future<void> batchDetectDominantLanguage(List<String> textList) async {}

  /// Inspects the text of a batch of documents for named entities and returns
  /// information about them. For more information about named entities, see
  /// how-entities
  Future<void> batchDetectEntities(
      {@required List<String> textList, @required String languageCode}) async {}

  /// Detects the key noun phrases found in a batch of documents.
  Future<void> batchDetectKeyPhrases(
      {@required List<String> textList, @required String languageCode}) async {}

  /// Inspects a batch of documents and returns an inference of the prevailing
  /// sentiment, `POSITIVE`, `NEUTRAL`, `MIXED`, or `NEGATIVE`, in each one.
  Future<void> batchDetectSentiment(
      {@required List<String> textList, @required String languageCode}) async {}

  /// Inspects the text of a batch of documents for the syntax and part of
  /// speech of the words in the document and returns information about them.
  /// For more information, see how-syntax.
  Future<void> batchDetectSyntax(
      {@required List<String> textList, @required String languageCode}) async {}

  /// Creates a new document classifier that you can use to categorize
  /// documents. To create a classifier you provide a set of training documents
  /// that labeled with the categories that you want to use. After the
  /// classifier is trained you can use it to categorize a set of labeled
  /// documents into the categories. For more information, see
  /// how-document-classification.
  Future<void> createDocumentClassifier(
      {@required String documentClassifierName,
      @required String dataAccessRoleArn,
      List<Tag> tags,
      @required DocumentClassifierInputDataConfig inputDataConfig,
      DocumentClassifierOutputDataConfig outputDataConfig,
      String clientRequestToken,
      @required String languageCode,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Creates an entity recognizer using submitted files. After your
  /// `CreateEntityRecognizer` request is submitted, you can check job status
  /// using the API.
  Future<void> createEntityRecognizer(
      {@required String recognizerName,
      @required String dataAccessRoleArn,
      List<Tag> tags,
      @required EntityRecognizerInputDataConfig inputDataConfig,
      String clientRequestToken,
      @required String languageCode,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Deletes a previously created document classifier
  ///
  /// Only those classifiers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// `ResourceInUseException` will be returned.
  ///
  /// This is an asynchronous action that puts the classifier into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// classifier disappears from your account and is no longer available for
  /// use.
  Future<void> deleteDocumentClassifier(String documentClassifierArn) async {}

  /// Deletes an entity recognizer.
  ///
  /// Only those recognizers that are in terminated states (IN_ERROR, TRAINED)
  /// will be deleted. If an active inference job is using the model, a
  /// `ResourceInUseException` will be returned.
  ///
  /// This is an asynchronous action that puts the recognizer into a DELETING
  /// state, and it is then removed by a background job. Once removed, the
  /// recognizer disappears from your account and is no longer available for
  /// use.
  Future<void> deleteEntityRecognizer(String entityRecognizerArn) async {}

  /// Gets the properties associated with a document classification job. Use
  /// this operation to get the status of a classification job.
  Future<void> describeDocumentClassificationJob(String jobId) async {}

  /// Gets the properties associated with a document classifier.
  Future<void> describeDocumentClassifier(String documentClassifierArn) async {}

  /// Gets the properties associated with a dominant language detection job. Use
  /// this operation to get the status of a detection job.
  Future<void> describeDominantLanguageDetectionJob(String jobId) async {}

  /// Gets the properties associated with an entities detection job. Use this
  /// operation to get the status of a detection job.
  Future<void> describeEntitiesDetectionJob(String jobId) async {}

  /// Provides details about an entity recognizer including status, S3 buckets
  /// containing training data, recognizer metadata, metrics, and so on.
  Future<void> describeEntityRecognizer(String entityRecognizerArn) async {}

  /// Gets the properties associated with a key phrases detection job. Use this
  /// operation to get the status of a detection job.
  Future<void> describeKeyPhrasesDetectionJob(String jobId) async {}

  /// Gets the properties associated with a sentiment detection job. Use this
  /// operation to get the status of a detection job.
  Future<void> describeSentimentDetectionJob(String jobId) async {}

  /// Gets the properties associated with a topic detection job. Use this
  /// operation to get the status of a detection job.
  Future<void> describeTopicsDetectionJob(String jobId) async {}

  /// Determines the dominant language of the input text. For a list of
  /// languages that Amazon Comprehend can detect, see [Amazon Comprehend
  /// Supported
  /// Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).
  Future<void> detectDominantLanguage(String text) async {}

  /// Inspects text for named entities, and returns information about them. For
  /// more information, about named entities, see how-entities.
  Future<void> detectEntities(
      {@required String text, @required String languageCode}) async {}

  /// Detects the key noun phrases found in the text.
  Future<void> detectKeyPhrases(
      {@required String text, @required String languageCode}) async {}

  /// Inspects text and returns an inference of the prevailing sentiment
  /// (`POSITIVE`, `NEUTRAL`, `MIXED`, or `NEGATIVE`).
  Future<void> detectSentiment(
      {@required String text, @required String languageCode}) async {}

  /// Inspects text for syntax and the part of speech of words in the document.
  /// For more information, how-syntax.
  Future<void> detectSyntax(
      {@required String text, @required String languageCode}) async {}

  /// Gets a list of the documentation classification jobs that you have
  /// submitted.
  Future<void> listDocumentClassificationJobs(
      {DocumentClassificationJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of the document classifiers that you have created.
  Future<void> listDocumentClassifiers(
      {DocumentClassifierFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of the dominant language detection jobs that you have
  /// submitted.
  Future<void> listDominantLanguageDetectionJobs(
      {DominantLanguageDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of the entity detection jobs that you have submitted.
  Future<void> listEntitiesDetectionJobs(
      {EntitiesDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of the properties of all entity recognizers that you created,
  /// including recognizers currently in training. Allows you to filter the list
  /// of recognizers based on criteria such as status and submission time. This
  /// call returns up to 500 entity recognizers in the list, with a default
  /// number of 100 recognizers in the list.
  ///
  /// The results of this list are not in any particular order. Please get the
  /// list and sort locally if needed.
  Future<void> listEntityRecognizers(
      {EntityRecognizerFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Get a list of key phrase detection jobs that you have submitted.
  Future<void> listKeyPhrasesDetectionJobs(
      {KeyPhrasesDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of sentiment detection jobs that you have submitted.
  Future<void> listSentimentDetectionJobs(
      {SentimentDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Lists all tags associated with a given Amazon Comprehend resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Gets a list of the topic detection jobs that you have submitted.
  Future<void> listTopicsDetectionJobs(
      {TopicsDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {}

  /// Starts an asynchronous document classification job. Use the operation to
  /// track the progress of the job.
  Future<void> startDocumentClassificationJob(
      {String jobName,
      @required String documentClassifierArn,
      @required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Starts an asynchronous dominant language detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  Future<void> startDominantLanguageDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Starts an asynchronous entity detection job for a collection of documents.
  /// Use the operation to track the status of a job.
  ///
  /// This API can be used for either standard entity detection or custom entity
  /// recognition. In order to be used for custom entity recognition, the
  /// optional `EntityRecognizerArn` must be used in order to provide access to
  /// the recognizer being used to detect the custom entity.
  Future<void> startEntitiesDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      String entityRecognizerArn,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Starts an asynchronous key phrase detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  Future<void> startKeyPhrasesDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Starts an asynchronous sentiment detection job for a collection of
  /// documents. use the operation to track the status of a job.
  Future<void> startSentimentDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Starts an asynchronous topic detection job. Use the
  /// `DescribeTopicDetectionJob` operation to track the status of a job.
  Future<void> startTopicsDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      int numberOfTopics,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {}

  /// Stops a dominant language detection job in progress.
  ///
  /// If the job state is `IN_PROGRESS` the job is marked for termination and
  /// put into the `STOP_REQUESTED` state. If the job completes before it can be
  /// stopped, it is put into the `COMPLETED` state; otherwise the job is
  /// stopped and put into the `STOPPED` state.
  ///
  /// If the job is in the `COMPLETED` or `FAILED` state when you call the
  /// `StopDominantLanguageDetectionJob` operation, the operation returns a 400
  /// Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  Future<void> stopDominantLanguageDetectionJob(String jobId) async {}

  /// Stops an entities detection job in progress.
  ///
  /// If the job state is `IN_PROGRESS` the job is marked for termination and
  /// put into the `STOP_REQUESTED` state. If the job completes before it can be
  /// stopped, it is put into the `COMPLETED` state; otherwise the job is
  /// stopped and put into the `STOPPED` state.
  ///
  /// If the job is in the `COMPLETED` or `FAILED` state when you call the
  /// `StopDominantLanguageDetectionJob` operation, the operation returns a 400
  /// Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  Future<void> stopEntitiesDetectionJob(String jobId) async {}

  /// Stops a key phrases detection job in progress.
  ///
  /// If the job state is `IN_PROGRESS` the job is marked for termination and
  /// put into the `STOP_REQUESTED` state. If the job completes before it can be
  /// stopped, it is put into the `COMPLETED` state; otherwise the job is
  /// stopped and put into the `STOPPED` state.
  ///
  /// If the job is in the `COMPLETED` or `FAILED` state when you call the
  /// `StopDominantLanguageDetectionJob` operation, the operation returns a 400
  /// Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  Future<void> stopKeyPhrasesDetectionJob(String jobId) async {}

  /// Stops a sentiment detection job in progress.
  ///
  /// If the job state is `IN_PROGRESS` the job is marked for termination and
  /// put into the `STOP_REQUESTED` state. If the job completes before it can be
  /// stopped, it is put into the `COMPLETED` state; otherwise the job is be
  /// stopped and put into the `STOPPED` state.
  ///
  /// If the job is in the `COMPLETED` or `FAILED` state when you call the
  /// `StopDominantLanguageDetectionJob` operation, the operation returns a 400
  /// Internal Request Exception.
  ///
  /// When a job is stopped, any documents already processed are written to the
  /// output location.
  Future<void> stopSentimentDetectionJob(String jobId) async {}

  /// Stops a document classifier training job while in progress.
  ///
  /// If the training job state is `TRAINING`, the job is marked for termination
  /// and put into the `STOP_REQUESTED` state. If the training job completes
  /// before it can be stopped, it is put into the `TRAINED`; otherwise the
  /// training job is stopped and put into the `STOPPED` state and the service
  /// sends back an HTTP 200 response with an empty HTTP body.
  Future<void> stopTrainingDocumentClassifier(
      String documentClassifierArn) async {}

  /// Stops an entity recognizer training job while in progress.
  ///
  /// If the training job state is `TRAINING`, the job is marked for termination
  /// and put into the `STOP_REQUESTED` state. If the training job completes
  /// before it can be stopped, it is put into the `TRAINED`; otherwise the
  /// training job is stopped and putted into the `STOPPED` state and the
  /// service sends back an HTTP 200 response with an empty HTTP body.
  Future<void> stopTrainingEntityRecognizer(String entityRecognizerArn) async {}

  /// Associates a specific tag with an Amazon Comprehend resource. A tag is a
  /// key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes a specific tag associated with an Amazon Comprehend resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}
}

class BatchDetectDominantLanguageItemResult {}

class BatchDetectDominantLanguageResponse {}

class BatchDetectEntitiesItemResult {}

class BatchDetectEntitiesResponse {}

class BatchDetectKeyPhrasesItemResult {}

class BatchDetectKeyPhrasesResponse {}

class BatchDetectSentimentItemResult {}

class BatchDetectSentimentResponse {}

class BatchDetectSyntaxItemResult {}

class BatchDetectSyntaxResponse {}

class BatchItemError {}

class ClassifierEvaluationMetrics {}

class ClassifierMetadata {}

class CreateDocumentClassifierResponse {}

class CreateEntityRecognizerResponse {}

class DeleteDocumentClassifierResponse {}

class DeleteEntityRecognizerResponse {}

class DescribeDocumentClassificationJobResponse {}

class DescribeDocumentClassifierResponse {}

class DescribeDominantLanguageDetectionJobResponse {}

class DescribeEntitiesDetectionJobResponse {}

class DescribeEntityRecognizerResponse {}

class DescribeKeyPhrasesDetectionJobResponse {}

class DescribeSentimentDetectionJobResponse {}

class DescribeTopicsDetectionJobResponse {}

class DetectDominantLanguageResponse {}

class DetectEntitiesResponse {}

class DetectKeyPhrasesResponse {}

class DetectSentimentResponse {}

class DetectSyntaxResponse {}

class DocumentClassificationJobFilter {}

class DocumentClassificationJobProperties {}

class DocumentClassifierFilter {}

class DocumentClassifierInputDataConfig {}

class DocumentClassifierOutputDataConfig {}

class DocumentClassifierProperties {}

class DominantLanguage {}

class DominantLanguageDetectionJobFilter {}

class DominantLanguageDetectionJobProperties {}

class EntitiesDetectionJobFilter {}

class EntitiesDetectionJobProperties {}

class Entity {}

class EntityRecognizerAnnotations {}

class EntityRecognizerDocuments {}

class EntityRecognizerEntityList {}

class EntityRecognizerEvaluationMetrics {}

class EntityRecognizerFilter {}

class EntityRecognizerInputDataConfig {}

class EntityRecognizerMetadata {}

class EntityRecognizerMetadataEntityTypesListItem {}

class EntityRecognizerProperties {}

class EntityTypesEvaluationMetrics {}

class EntityTypesListItem {}

class InputDataConfig {}

class KeyPhrase {}

class KeyPhrasesDetectionJobFilter {}

class KeyPhrasesDetectionJobProperties {}

class ListDocumentClassificationJobsResponse {}

class ListDocumentClassifiersResponse {}

class ListDominantLanguageDetectionJobsResponse {}

class ListEntitiesDetectionJobsResponse {}

class ListEntityRecognizersResponse {}

class ListKeyPhrasesDetectionJobsResponse {}

class ListSentimentDetectionJobsResponse {}

class ListTagsForResourceResponse {}

class ListTopicsDetectionJobsResponse {}

class OutputDataConfig {}

class PartOfSpeechTag {}

class SentimentDetectionJobFilter {}

class SentimentDetectionJobProperties {}

class SentimentScore {}

class StartDocumentClassificationJobResponse {}

class StartDominantLanguageDetectionJobResponse {}

class StartEntitiesDetectionJobResponse {}

class StartKeyPhrasesDetectionJobResponse {}

class StartSentimentDetectionJobResponse {}

class StartTopicsDetectionJobResponse {}

class StopDominantLanguageDetectionJobResponse {}

class StopEntitiesDetectionJobResponse {}

class StopKeyPhrasesDetectionJobResponse {}

class StopSentimentDetectionJobResponse {}

class StopTrainingDocumentClassifierResponse {}

class StopTrainingEntityRecognizerResponse {}

class SyntaxToken {}

class Tag {}

class TagResourceResponse {}

class TopicsDetectionJobFilter {}

class TopicsDetectionJobProperties {}

class UntagResourceResponse {}

class VpcConfig {}
