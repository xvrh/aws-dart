import 'package:meta/meta.dart';

/// Amazon Comprehend is an AWS service for gaining insight into the content of
/// documents. Use these actions to determine the topics contained in your
/// documents, the topics they discuss, the predominant sentiment expressed in
/// them, the predominant language used, and more.
class ComprehendApi {
  /// Determines the dominant language of the input text for a batch of
  /// documents. For a list of languages that Amazon Comprehend can detect, see
  /// [Amazon Comprehend Supported Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).
  ///
  /// [textList]: A list containing the text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document should contain at
  /// least 20 characters and must contain fewer than 5,000 bytes of UTF-8
  /// encoded characters.
  Future<BatchDetectDominantLanguageResponse> batchDetectDominantLanguage(
      List<String> textList) async {
    return BatchDetectDominantLanguageResponse.fromJson({});
  }

  /// Inspects the text of a batch of documents for named entities and returns
  /// information about them. For more information about named entities, see
  /// how-entities
  ///
  /// [textList]: A list containing the text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document must contain fewer
  /// than 5,000 bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<BatchDetectEntitiesResponse> batchDetectEntities(
      {@required List<String> textList, @required String languageCode}) async {
    return BatchDetectEntitiesResponse.fromJson({});
  }

  /// Detects the key noun phrases found in a batch of documents.
  ///
  /// [textList]: A list containing the text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document must contain fewer
  /// that 5,000 bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<BatchDetectKeyPhrasesResponse> batchDetectKeyPhrases(
      {@required List<String> textList, @required String languageCode}) async {
    return BatchDetectKeyPhrasesResponse.fromJson({});
  }

  /// Inspects a batch of documents and returns an inference of the prevailing
  /// sentiment, `POSITIVE`, `NEUTRAL`, `MIXED`, or `NEGATIVE`, in each one.
  ///
  /// [textList]: A list containing the text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document must contain fewer
  /// that 5,000 bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<BatchDetectSentimentResponse> batchDetectSentiment(
      {@required List<String> textList, @required String languageCode}) async {
    return BatchDetectSentimentResponse.fromJson({});
  }

  /// Inspects the text of a batch of documents for the syntax and part of
  /// speech of the words in the document and returns information about them.
  /// For more information, see how-syntax.
  ///
  /// [textList]: A list containing the text of the input documents. The list
  /// can contain a maximum of 25 documents. Each document must contain fewer
  /// that 5,000 bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<BatchDetectSyntaxResponse> batchDetectSyntax(
      {@required List<String> textList, @required String languageCode}) async {
    return BatchDetectSyntaxResponse.fromJson({});
  }

  /// Creates a new document classifier that you can use to categorize
  /// documents. To create a classifier you provide a set of training documents
  /// that labeled with the categories that you want to use. After the
  /// classifier is trained you can use it to categorize a set of labeled
  /// documents into the categories. For more information, see
  /// how-document-classification.
  ///
  /// [documentClassifierName]: The name of the document classifier.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Management (IAM) role that grants Amazon Comprehend read access to
  /// your input data.
  ///
  /// [tags]: Tags to be associated with the document classifier being created.
  /// A tag is a key-value pair that adds as a metadata to a resource used by
  /// Amazon Comprehend. For example, a tag with "Sales" as the key might be
  /// added to a resource to indicate its use by the sales department.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Enables the addition of output results configuration
  /// parameters for custom classifier jobs.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you don't
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your custom
  /// classifier. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<CreateDocumentClassifierResponse> createDocumentClassifier(
      {@required String documentClassifierName,
      @required String dataAccessRoleArn,
      List<Tag> tags,
      @required DocumentClassifierInputDataConfig inputDataConfig,
      DocumentClassifierOutputDataConfig outputDataConfig,
      String clientRequestToken,
      @required String languageCode,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return CreateDocumentClassifierResponse.fromJson({});
  }

  /// Creates an entity recognizer using submitted files. After your
  /// `CreateEntityRecognizer` request is submitted, you can check job status
  /// using the API.
  ///
  /// [recognizerName]: The name given to the newly created recognizer.
  /// Recognizer names can be a maximum of 256 characters. Alphanumeric
  /// characters, hyphens (-) and underscores (_) are allowed. The name must be
  /// unique in the account/region.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Management (IAM) role that grants Amazon Comprehend read access to
  /// your input data.
  ///
  /// [tags]: Tags to be associated with the entity recognizer being created. A
  /// tag is a key-value pair that adds as a metadata to a resource used by
  /// Amazon Comprehend. For example, a tag with "Sales" as the key might be
  /// added to a resource to indicate its use by the sales department.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data.
  /// The S3 bucket containing the input data must be located in the same region
  /// as the entity recognizer being created.
  ///
  /// [clientRequestToken]:  A unique identifier for the request. If you don't
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [languageCode]:  The language of the input documents. All documents must
  /// be in the same language. Only English ("en") is currently supported.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your custom
  /// entity recognizer. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<CreateEntityRecognizerResponse> createEntityRecognizer(
      {@required String recognizerName,
      @required String dataAccessRoleArn,
      List<Tag> tags,
      @required EntityRecognizerInputDataConfig inputDataConfig,
      String clientRequestToken,
      @required String languageCode,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return CreateEntityRecognizerResponse.fromJson({});
  }

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
  ///
  /// [documentClassifierArn]: The Amazon Resource Name (ARN) that identifies
  /// the document classifier.
  Future<DeleteDocumentClassifierResponse> deleteDocumentClassifier(
      String documentClassifierArn) async {
    return DeleteDocumentClassifierResponse.fromJson({});
  }

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
  ///
  /// [entityRecognizerArn]: The Amazon Resource Name (ARN) that identifies the
  /// entity recognizer.
  Future<DeleteEntityRecognizerResponse> deleteEntityRecognizer(
      String entityRecognizerArn) async {
    return DeleteEntityRecognizerResponse.fromJson({});
  }

  /// Gets the properties associated with a document classification job. Use
  /// this operation to get the status of a classification job.
  ///
  /// [jobId]: The identifier that Amazon Comprehend generated for the job. The
  /// operation returns this identifier in its response.
  Future<DescribeDocumentClassificationJobResponse>
      describeDocumentClassificationJob(String jobId) async {
    return DescribeDocumentClassificationJobResponse.fromJson({});
  }

  /// Gets the properties associated with a document classifier.
  ///
  /// [documentClassifierArn]: The Amazon Resource Name (ARN) that identifies
  /// the document classifier. The operation returns this identifier in its
  /// response.
  Future<DescribeDocumentClassifierResponse> describeDocumentClassifier(
      String documentClassifierArn) async {
    return DescribeDocumentClassifierResponse.fromJson({});
  }

  /// Gets the properties associated with a dominant language detection job. Use
  /// this operation to get the status of a detection job.
  ///
  /// [jobId]: The identifier that Amazon Comprehend generated for the job. The
  /// operation returns this identifier in its response.
  Future<DescribeDominantLanguageDetectionJobResponse>
      describeDominantLanguageDetectionJob(String jobId) async {
    return DescribeDominantLanguageDetectionJobResponse.fromJson({});
  }

  /// Gets the properties associated with an entities detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// [jobId]: The identifier that Amazon Comprehend generated for the job. The
  /// operation returns this identifier in its response.
  Future<DescribeEntitiesDetectionJobResponse> describeEntitiesDetectionJob(
      String jobId) async {
    return DescribeEntitiesDetectionJobResponse.fromJson({});
  }

  /// Provides details about an entity recognizer including status, S3 buckets
  /// containing training data, recognizer metadata, metrics, and so on.
  ///
  /// [entityRecognizerArn]: The Amazon Resource Name (ARN) that identifies the
  /// entity recognizer.
  Future<DescribeEntityRecognizerResponse> describeEntityRecognizer(
      String entityRecognizerArn) async {
    return DescribeEntityRecognizerResponse.fromJson({});
  }

  /// Gets the properties associated with a key phrases detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// [jobId]: The identifier that Amazon Comprehend generated for the job. The
  /// operation returns this identifier in its response.
  Future<DescribeKeyPhrasesDetectionJobResponse> describeKeyPhrasesDetectionJob(
      String jobId) async {
    return DescribeKeyPhrasesDetectionJobResponse.fromJson({});
  }

  /// Gets the properties associated with a sentiment detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// [jobId]: The identifier that Amazon Comprehend generated for the job. The
  /// operation returns this identifier in its response.
  Future<DescribeSentimentDetectionJobResponse> describeSentimentDetectionJob(
      String jobId) async {
    return DescribeSentimentDetectionJobResponse.fromJson({});
  }

  /// Gets the properties associated with a topic detection job. Use this
  /// operation to get the status of a detection job.
  ///
  /// [jobId]: The identifier assigned by the user to the detection job.
  Future<DescribeTopicsDetectionJobResponse> describeTopicsDetectionJob(
      String jobId) async {
    return DescribeTopicsDetectionJobResponse.fromJson({});
  }

  /// Determines the dominant language of the input text. For a list of
  /// languages that Amazon Comprehend can detect, see
  /// [Amazon Comprehend Supported Languages](https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html).
  ///
  /// [text]: A UTF-8 text string. Each string should contain at least 20
  /// characters and must contain fewer that 5,000 bytes of UTF-8 encoded
  /// characters.
  Future<DetectDominantLanguageResponse> detectDominantLanguage(
      String text) async {
    return DetectDominantLanguageResponse.fromJson({});
  }

  /// Inspects text for named entities, and returns information about them. For
  /// more information, about named entities, see how-entities.
  ///
  /// [text]: A UTF-8 text string. Each string must contain fewer that 5,000
  /// bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<DetectEntitiesResponse> detectEntities(
      {@required String text, @required String languageCode}) async {
    return DetectEntitiesResponse.fromJson({});
  }

  /// Detects the key noun phrases found in the text.
  ///
  /// [text]: A UTF-8 text string. Each string must contain fewer that 5,000
  /// bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<DetectKeyPhrasesResponse> detectKeyPhrases(
      {@required String text, @required String languageCode}) async {
    return DetectKeyPhrasesResponse.fromJson({});
  }

  /// Inspects text and returns an inference of the prevailing sentiment
  /// (`POSITIVE`, `NEUTRAL`, `MIXED`, or `NEGATIVE`).
  ///
  /// [text]: A UTF-8 text string. Each string must contain fewer that 5,000
  /// bytes of UTF-8 encoded characters.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  Future<DetectSentimentResponse> detectSentiment(
      {@required String text, @required String languageCode}) async {
    return DetectSentimentResponse.fromJson({});
  }

  /// Inspects text for syntax and the part of speech of words in the document.
  /// For more information, how-syntax.
  ///
  /// [text]: A UTF-8 string. Each string must contain fewer that 5,000 bytes of
  /// UTF encoded characters.
  ///
  /// [languageCode]: The language code of the input documents. You can specify
  /// any of the primary languages supported by Amazon Comprehend: German
  /// ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt").
  Future<DetectSyntaxResponse> detectSyntax(
      {@required String text, @required String languageCode}) async {
    return DetectSyntaxResponse.fromJson({});
  }

  /// Gets a list of the documentation classification jobs that you have
  /// submitted.
  ///
  /// [filter]: Filters the jobs that are returned. You can filter jobs on their
  /// names, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListDocumentClassificationJobsResponse> listDocumentClassificationJobs(
      {DocumentClassificationJobFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListDocumentClassificationJobsResponse.fromJson({});
  }

  /// Gets a list of the document classifiers that you have created.
  ///
  /// [filter]: Filters the jobs that are returned. You can filter jobs on their
  /// name, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListDocumentClassifiersResponse> listDocumentClassifiers(
      {DocumentClassifierFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListDocumentClassifiersResponse.fromJson({});
  }

  /// Gets a list of the dominant language detection jobs that you have
  /// submitted.
  ///
  /// [filter]: Filters that jobs that are returned. You can filter jobs on
  /// their name, status, or the date and time that they were submitted. You can
  /// only set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListDominantLanguageDetectionJobsResponse>
      listDominantLanguageDetectionJobs(
          {DominantLanguageDetectionJobFilter filter,
          String nextToken,
          int maxResults}) async {
    return ListDominantLanguageDetectionJobsResponse.fromJson({});
  }

  /// Gets a list of the entity detection jobs that you have submitted.
  ///
  /// [filter]: Filters the jobs that are returned. You can filter jobs on their
  /// name, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListEntitiesDetectionJobsResponse> listEntitiesDetectionJobs(
      {EntitiesDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListEntitiesDetectionJobsResponse.fromJson({});
  }

  /// Gets a list of the properties of all entity recognizers that you created,
  /// including recognizers currently in training. Allows you to filter the list
  /// of recognizers based on criteria such as status and submission time. This
  /// call returns up to 500 entity recognizers in the list, with a default
  /// number of 100 recognizers in the list.
  ///
  /// The results of this list are not in any particular order. Please get the
  /// list and sort locally if needed.
  ///
  /// [filter]: Filters the list of entities returned. You can filter on
  /// `Status`, `SubmitTimeBefore`, or `SubmitTimeAfter`. You can only set one
  /// filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]:  The maximum number of results to return on each page. The
  /// default is 100.
  Future<ListEntityRecognizersResponse> listEntityRecognizers(
      {EntityRecognizerFilter filter, String nextToken, int maxResults}) async {
    return ListEntityRecognizersResponse.fromJson({});
  }

  /// Get a list of key phrase detection jobs that you have submitted.
  ///
  /// [filter]: Filters the jobs that are returned. You can filter jobs on their
  /// name, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListKeyPhrasesDetectionJobsResponse> listKeyPhrasesDetectionJobs(
      {KeyPhrasesDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListKeyPhrasesDetectionJobsResponse.fromJson({});
  }

  /// Gets a list of sentiment detection jobs that you have submitted.
  ///
  /// [filter]: Filters the jobs that are returned. You can filter jobs on their
  /// name, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListSentimentDetectionJobsResponse> listSentimentDetectionJobs(
      {SentimentDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListSentimentDetectionJobsResponse.fromJson({});
  }

  /// Lists all tags associated with a given Amazon Comprehend resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the given Amazon
  /// Comprehend resource you are querying.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Gets a list of the topic detection jobs that you have submitted.
  ///
  /// [filter]: Filters the jobs that are returned. Jobs can be filtered on
  /// their name, status, or the date and time that they were submitted. You can
  /// set only one filter at a time.
  ///
  /// [nextToken]: Identifies the next page of results to return.
  ///
  /// [maxResults]: The maximum number of results to return in each page. The
  /// default is 100.
  Future<ListTopicsDetectionJobsResponse> listTopicsDetectionJobs(
      {TopicsDetectionJobFilter filter,
      String nextToken,
      int maxResults}) async {
    return ListTopicsDetectionJobsResponse.fromJson({});
  }

  /// Starts an asynchronous document classification job. Use the operation to
  /// track the progress of the job.
  ///
  /// [jobName]: The identifier of the job.
  ///
  /// [documentClassifierArn]: The Amazon Resource Name (ARN) of the document
  /// classifier to use to process the job.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you do not
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your
  /// document classification job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartDocumentClassificationJobResponse> startDocumentClassificationJob(
      {String jobName,
      @required String documentClassifierArn,
      @required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return StartDocumentClassificationJobResponse.fromJson({});
  }

  /// Starts an asynchronous dominant language detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data. For more information, see
  /// [https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions](https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions).
  ///
  /// [jobName]: An identifier for the job.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you do not
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your
  /// dominant language detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartDominantLanguageDetectionJobResponse>
      startDominantLanguageDetectionJob(
          {@required InputDataConfig inputDataConfig,
          @required OutputDataConfig outputDataConfig,
          @required String dataAccessRoleArn,
          String jobName,
          String clientRequestToken,
          String volumeKmsKeyId,
          VpcConfig vpcConfig}) async {
    return StartDominantLanguageDetectionJobResponse.fromJson({});
  }

  /// Starts an asynchronous entity detection job for a collection of documents.
  /// Use the operation to track the status of a job.
  ///
  /// This API can be used for either standard entity detection or custom entity
  /// recognition. In order to be used for custom entity recognition, the
  /// optional `EntityRecognizerArn` must be used in order to provide access to
  /// the recognizer being used to detect the custom entity.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data. For more information, see
  /// [https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions](https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions).
  ///
  /// [jobName]: The identifier of the job.
  ///
  /// [entityRecognizerArn]: The Amazon Resource Name (ARN) that identifies the
  /// specific entity recognizer to be used by the `StartEntitiesDetectionJob`.
  /// This ARN is optional and is only used for a custom entity recognition job.
  ///
  /// [languageCode]: The language of the input documents. All documents must be
  /// in the same language. You can specify any of the languages supported by
  /// Amazon Comprehend: English ("en"), Spanish ("es"), French ("fr"), German
  /// ("de"), Italian ("it"), or Portuguese ("pt"). If custom entities
  /// recognition is used, this parameter is ignored and the language used for
  /// training the model is used instead.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you don't
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your entity
  /// detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartEntitiesDetectionJobResponse> startEntitiesDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      String entityRecognizerArn,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return StartEntitiesDetectionJobResponse.fromJson({});
  }

  /// Starts an asynchronous key phrase detection job for a collection of
  /// documents. Use the operation to track the status of a job.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data. For more information, see
  /// [https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions](https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions).
  ///
  /// [jobName]: The identifier of the job.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you don't
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]:  Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your key
  /// phrases detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartKeyPhrasesDetectionJobResponse> startKeyPhrasesDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return StartKeyPhrasesDetectionJobResponse.fromJson({});
  }

  /// Starts an asynchronous sentiment detection job for a collection of
  /// documents. use the operation to track the status of a job.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files.
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data. For more information, see
  /// [https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions](https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions).
  ///
  /// [jobName]: The identifier of the job.
  ///
  /// [languageCode]: The language of the input documents. You can specify any
  /// of the primary languages supported by Amazon Comprehend: German ("de"),
  /// English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
  /// Portuguese ("pt"). All documents must be in the same language.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you don't
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your
  /// sentiment detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartSentimentDetectionJobResponse> startSentimentDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      @required String languageCode,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return StartSentimentDetectionJobResponse.fromJson({});
  }

  /// Starts an asynchronous topic detection job. Use the
  /// `DescribeTopicDetectionJob` operation to track the status of a job.
  ///
  /// [inputDataConfig]: Specifies the format and location of the input data for
  /// the job.
  ///
  /// [outputDataConfig]: Specifies where to send the output files. The output
  /// is a compressed archive with two files, `topic-terms.csv` that lists the
  /// terms associated with each topic, and `doc-topics.csv` that lists the
  /// documents associated with each topic
  ///
  /// [dataAccessRoleArn]: The Amazon Resource Name (ARN) of the AWS Identity
  /// and Access Management (IAM) role that grants Amazon Comprehend read access
  /// to your input data. For more information, see
  /// [https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions](https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions).
  ///
  /// [jobName]: The identifier of the job.
  ///
  /// [numberOfTopics]: The number of topics to detect.
  ///
  /// [clientRequestToken]: A unique identifier for the request. If you do not
  /// set the client request token, Amazon Comprehend generates one.
  ///
  /// [volumeKmsKeyId]: ID for the AWS Key Management Service (KMS) key that
  /// Amazon Comprehend uses to encrypt data on the storage volume attached to
  /// the ML compute instance(s) that process the analysis job. The
  /// VolumeKmsKeyId can be either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// [vpcConfig]: Configuration parameters for an optional private Virtual
  /// Private Cloud (VPC) containing the resources you are using for your topic
  /// detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  Future<StartTopicsDetectionJobResponse> startTopicsDetectionJob(
      {@required InputDataConfig inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required String dataAccessRoleArn,
      String jobName,
      int numberOfTopics,
      String clientRequestToken,
      String volumeKmsKeyId,
      VpcConfig vpcConfig}) async {
    return StartTopicsDetectionJobResponse.fromJson({});
  }

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
  ///
  /// [jobId]: The identifier of the dominant language detection job to stop.
  Future<StopDominantLanguageDetectionJobResponse>
      stopDominantLanguageDetectionJob(String jobId) async {
    return StopDominantLanguageDetectionJobResponse.fromJson({});
  }

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
  ///
  /// [jobId]: The identifier of the entities detection job to stop.
  Future<StopEntitiesDetectionJobResponse> stopEntitiesDetectionJob(
      String jobId) async {
    return StopEntitiesDetectionJobResponse.fromJson({});
  }

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
  ///
  /// [jobId]: The identifier of the key phrases detection job to stop.
  Future<StopKeyPhrasesDetectionJobResponse> stopKeyPhrasesDetectionJob(
      String jobId) async {
    return StopKeyPhrasesDetectionJobResponse.fromJson({});
  }

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
  ///
  /// [jobId]: The identifier of the sentiment detection job to stop.
  Future<StopSentimentDetectionJobResponse> stopSentimentDetectionJob(
      String jobId) async {
    return StopSentimentDetectionJobResponse.fromJson({});
  }

  /// Stops a document classifier training job while in progress.
  ///
  /// If the training job state is `TRAINING`, the job is marked for termination
  /// and put into the `STOP_REQUESTED` state. If the training job completes
  /// before it can be stopped, it is put into the `TRAINED`; otherwise the
  /// training job is stopped and put into the `STOPPED` state and the service
  /// sends back an HTTP 200 response with an empty HTTP body.
  ///
  /// [documentClassifierArn]: The Amazon Resource Name (ARN) that identifies
  /// the document classifier currently being trained.
  Future<StopTrainingDocumentClassifierResponse> stopTrainingDocumentClassifier(
      String documentClassifierArn) async {
    return StopTrainingDocumentClassifierResponse.fromJson({});
  }

  /// Stops an entity recognizer training job while in progress.
  ///
  /// If the training job state is `TRAINING`, the job is marked for termination
  /// and put into the `STOP_REQUESTED` state. If the training job completes
  /// before it can be stopped, it is put into the `TRAINED`; otherwise the
  /// training job is stopped and putted into the `STOPPED` state and the
  /// service sends back an HTTP 200 response with an empty HTTP body.
  ///
  /// [entityRecognizerArn]: The Amazon Resource Name (ARN) that identifies the
  /// entity recognizer currently being trained.
  Future<StopTrainingEntityRecognizerResponse> stopTrainingEntityRecognizer(
      String entityRecognizerArn) async {
    return StopTrainingEntityRecognizerResponse.fromJson({});
  }

  /// Associates a specific tag with an Amazon Comprehend resource. A tag is a
  /// key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the given Amazon
  /// Comprehend resource to which you want to associate the tags.
  ///
  /// [tags]: Tags being associated with a specific Amazon Comprehend resource.
  /// There can be a maximum of 50 tags (both existing and pending) associated
  /// with a specific resource.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes a specific tag associated with an Amazon Comprehend resource.
  ///
  /// [resourceArn]:  The Amazon Resource Name (ARN) of the given Amazon
  /// Comprehend resource from which you want to remove the tags.
  ///
  /// [tagKeys]: The initial part of a key-value pair that forms a tag being
  /// removed from a given resource. For example, a tag with "Sales" as the key
  /// might be added to a resource to indicate its use by the sales department.
  /// Keys must be unique and cannot be duplicated for a particular resource.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectDominantLanguageItemResult {
  /// The zero-based index of the document in the input list.
  final int index;

  /// One or more DominantLanguage objects describing the dominant languages in
  /// the document.
  final List<DominantLanguage> languages;

  BatchDetectDominantLanguageItemResult({
    this.index,
    this.languages,
  });
  static BatchDetectDominantLanguageItemResult fromJson(
          Map<String, dynamic> json) =>
      BatchDetectDominantLanguageItemResult();
}

class BatchDetectDominantLanguageResponse {
  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the `Index` field and match the order of the
  /// documents in the input list. If all of the documents contain an error, the
  /// `ResultList` is empty.
  final List<BatchDetectDominantLanguageItemResult> resultList;

  /// A list containing one object for each document that contained an error.
  /// The results are sorted in ascending order by the `Index` field and match
  /// the order of the documents in the input list. If there are no errors in
  /// the batch, the `ErrorList` is empty.
  final List<BatchItemError> errorList;

  BatchDetectDominantLanguageResponse({
    @required this.resultList,
    @required this.errorList,
  });
  static BatchDetectDominantLanguageResponse fromJson(
          Map<String, dynamic> json) =>
      BatchDetectDominantLanguageResponse();
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectEntitiesItemResult {
  /// The zero-based index of the document in the input list.
  final int index;

  /// One or more Entity objects, one for each entity detected in the document.
  final List<Entity> entities;

  BatchDetectEntitiesItemResult({
    this.index,
    this.entities,
  });
  static BatchDetectEntitiesItemResult fromJson(Map<String, dynamic> json) =>
      BatchDetectEntitiesItemResult();
}

class BatchDetectEntitiesResponse {
  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the `Index` field and match the order of the
  /// documents in the input list. If all of the documents contain an error, the
  /// `ResultList` is empty.
  final List<BatchDetectEntitiesItemResult> resultList;

  /// A list containing one object for each document that contained an error.
  /// The results are sorted in ascending order by the `Index` field and match
  /// the order of the documents in the input list. If there are no errors in
  /// the batch, the `ErrorList` is empty.
  final List<BatchItemError> errorList;

  BatchDetectEntitiesResponse({
    @required this.resultList,
    @required this.errorList,
  });
  static BatchDetectEntitiesResponse fromJson(Map<String, dynamic> json) =>
      BatchDetectEntitiesResponse();
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectKeyPhrasesItemResult {
  /// The zero-based index of the document in the input list.
  final int index;

  /// One or more KeyPhrase objects, one for each key phrase detected in the
  /// document.
  final List<KeyPhrase> keyPhrases;

  BatchDetectKeyPhrasesItemResult({
    this.index,
    this.keyPhrases,
  });
  static BatchDetectKeyPhrasesItemResult fromJson(Map<String, dynamic> json) =>
      BatchDetectKeyPhrasesItemResult();
}

class BatchDetectKeyPhrasesResponse {
  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the `Index` field and match the order of the
  /// documents in the input list. If all of the documents contain an error, the
  /// `ResultList` is empty.
  final List<BatchDetectKeyPhrasesItemResult> resultList;

  /// A list containing one object for each document that contained an error.
  /// The results are sorted in ascending order by the `Index` field and match
  /// the order of the documents in the input list. If there are no errors in
  /// the batch, the `ErrorList` is empty.
  final List<BatchItemError> errorList;

  BatchDetectKeyPhrasesResponse({
    @required this.resultList,
    @required this.errorList,
  });
  static BatchDetectKeyPhrasesResponse fromJson(Map<String, dynamic> json) =>
      BatchDetectKeyPhrasesResponse();
}

/// The result of calling the operation. The operation returns one object for
/// each document that is successfully processed by the operation.
class BatchDetectSentimentItemResult {
  /// The zero-based index of the document in the input list.
  final int index;

  /// The sentiment detected in the document.
  final String sentiment;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// sentiment detection.
  final SentimentScore sentimentScore;

  BatchDetectSentimentItemResult({
    this.index,
    this.sentiment,
    this.sentimentScore,
  });
  static BatchDetectSentimentItemResult fromJson(Map<String, dynamic> json) =>
      BatchDetectSentimentItemResult();
}

class BatchDetectSentimentResponse {
  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the `Index` field and match the order of the
  /// documents in the input list. If all of the documents contain an error, the
  /// `ResultList` is empty.
  final List<BatchDetectSentimentItemResult> resultList;

  /// A list containing one object for each document that contained an error.
  /// The results are sorted in ascending order by the `Index` field and match
  /// the order of the documents in the input list. If there are no errors in
  /// the batch, the `ErrorList` is empty.
  final List<BatchItemError> errorList;

  BatchDetectSentimentResponse({
    @required this.resultList,
    @required this.errorList,
  });
  static BatchDetectSentimentResponse fromJson(Map<String, dynamic> json) =>
      BatchDetectSentimentResponse();
}

/// The result of calling the operation. The operation returns one object that
/// is successfully processed by the operation.
class BatchDetectSyntaxItemResult {
  /// The zero-based index of the document in the input list.
  final int index;

  /// The syntax tokens for the words in the document, one token for each word.
  final List<SyntaxToken> syntaxTokens;

  BatchDetectSyntaxItemResult({
    this.index,
    this.syntaxTokens,
  });
  static BatchDetectSyntaxItemResult fromJson(Map<String, dynamic> json) =>
      BatchDetectSyntaxItemResult();
}

class BatchDetectSyntaxResponse {
  /// A list of objects containing the results of the operation. The results are
  /// sorted in ascending order by the `Index` field and match the order of the
  /// documents in the input list. If all of the documents contain an error, the
  /// `ResultList` is empty.
  final List<BatchDetectSyntaxItemResult> resultList;

  /// A list containing one object for each document that contained an error.
  /// The results are sorted in ascending order by the `Index` field and match
  /// the order of the documents in the input list. If there are no errors in
  /// the batch, the `ErrorList` is empty.
  final List<BatchItemError> errorList;

  BatchDetectSyntaxResponse({
    @required this.resultList,
    @required this.errorList,
  });
  static BatchDetectSyntaxResponse fromJson(Map<String, dynamic> json) =>
      BatchDetectSyntaxResponse();
}

/// Describes an error that occurred while processing a document in a batch. The
/// operation returns on `BatchItemError` object for each document that
/// contained an error.
class BatchItemError {
  /// The zero-based index of the document in the input list.
  final int index;

  /// The numeric error code of the error.
  final String errorCode;

  /// A text description of the error.
  final String errorMessage;

  BatchItemError({
    this.index,
    this.errorCode,
    this.errorMessage,
  });
  static BatchItemError fromJson(Map<String, dynamic> json) => BatchItemError();
}

/// Describes the result metrics for the test data associated with an
/// documentation classifier.
class ClassifierEvaluationMetrics {
  /// The fraction of the labels that were correct recognized. It is computed by
  /// dividing the number of labels in the test documents that were correctly
  /// recognized by the total number of labels in the test documents.
  final double accuracy;

  /// A measure of the usefulness of the classifier results in the test data.
  /// High precision means that the classifier returned substantially more
  /// relevant results than irrelevant ones.
  final double precision;

  /// A measure of how complete the classifier results are for the test data.
  /// High recall means that the classifier returned most of the relevant
  /// results.
  final double recall;

  /// A measure of how accurate the classifier results are for the test data. It
  /// is derived from the `Precision` and `Recall` values. The `F1Score` is the
  /// harmonic average of the two scores. The highest score is 1, and the worst
  /// score is 0.
  final double f1Score;

  ClassifierEvaluationMetrics({
    this.accuracy,
    this.precision,
    this.recall,
    this.f1Score,
  });
  static ClassifierEvaluationMetrics fromJson(Map<String, dynamic> json) =>
      ClassifierEvaluationMetrics();
}

/// Provides information about a document classifier.
class ClassifierMetadata {
  /// The number of labels in the input data.
  final int numberOfLabels;

  /// The number of documents in the input data that were used to train the
  /// classifier. Typically this is 80 to 90 percent of the input documents.
  final int numberOfTrainedDocuments;

  /// The number of documents in the input data that were used to test the
  /// classifier. Typically this is 10 to 20 percent of the input documents.
  final int numberOfTestDocuments;

  ///  Describes the result metrics for the test data associated with an
  /// documentation classifier.
  final ClassifierEvaluationMetrics evaluationMetrics;

  ClassifierMetadata({
    this.numberOfLabels,
    this.numberOfTrainedDocuments,
    this.numberOfTestDocuments,
    this.evaluationMetrics,
  });
  static ClassifierMetadata fromJson(Map<String, dynamic> json) =>
      ClassifierMetadata();
}

class CreateDocumentClassifierResponse {
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String documentClassifierArn;

  CreateDocumentClassifierResponse({
    this.documentClassifierArn,
  });
  static CreateDocumentClassifierResponse fromJson(Map<String, dynamic> json) =>
      CreateDocumentClassifierResponse();
}

class CreateEntityRecognizerResponse {
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String entityRecognizerArn;

  CreateEntityRecognizerResponse({
    this.entityRecognizerArn,
  });
  static CreateEntityRecognizerResponse fromJson(Map<String, dynamic> json) =>
      CreateEntityRecognizerResponse();
}

class DeleteDocumentClassifierResponse {
  DeleteDocumentClassifierResponse();
  static DeleteDocumentClassifierResponse fromJson(Map<String, dynamic> json) =>
      DeleteDocumentClassifierResponse();
}

class DeleteEntityRecognizerResponse {
  DeleteEntityRecognizerResponse();
  static DeleteEntityRecognizerResponse fromJson(Map<String, dynamic> json) =>
      DeleteEntityRecognizerResponse();
}

class DescribeDocumentClassificationJobResponse {
  /// An object that describes the properties associated with the document
  /// classification job.
  final DocumentClassificationJobProperties documentClassificationJobProperties;

  DescribeDocumentClassificationJobResponse({
    this.documentClassificationJobProperties,
  });
  static DescribeDocumentClassificationJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDocumentClassificationJobResponse();
}

class DescribeDocumentClassifierResponse {
  /// An object that contains the properties associated with a document
  /// classifier.
  final DocumentClassifierProperties documentClassifierProperties;

  DescribeDocumentClassifierResponse({
    this.documentClassifierProperties,
  });
  static DescribeDocumentClassifierResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDocumentClassifierResponse();
}

class DescribeDominantLanguageDetectionJobResponse {
  /// An object that contains the properties associated with a dominant language
  /// detection job.
  final DominantLanguageDetectionJobProperties
      dominantLanguageDetectionJobProperties;

  DescribeDominantLanguageDetectionJobResponse({
    this.dominantLanguageDetectionJobProperties,
  });
  static DescribeDominantLanguageDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDominantLanguageDetectionJobResponse();
}

class DescribeEntitiesDetectionJobResponse {
  /// An object that contains the properties associated with an entities
  /// detection job.
  final EntitiesDetectionJobProperties entitiesDetectionJobProperties;

  DescribeEntitiesDetectionJobResponse({
    this.entitiesDetectionJobProperties,
  });
  static DescribeEntitiesDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeEntitiesDetectionJobResponse();
}

class DescribeEntityRecognizerResponse {
  /// Describes information associated with an entity recognizer.
  final EntityRecognizerProperties entityRecognizerProperties;

  DescribeEntityRecognizerResponse({
    this.entityRecognizerProperties,
  });
  static DescribeEntityRecognizerResponse fromJson(Map<String, dynamic> json) =>
      DescribeEntityRecognizerResponse();
}

class DescribeKeyPhrasesDetectionJobResponse {
  /// An object that contains the properties associated with a key phrases
  /// detection job.
  final KeyPhrasesDetectionJobProperties keyPhrasesDetectionJobProperties;

  DescribeKeyPhrasesDetectionJobResponse({
    this.keyPhrasesDetectionJobProperties,
  });
  static DescribeKeyPhrasesDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeKeyPhrasesDetectionJobResponse();
}

class DescribeSentimentDetectionJobResponse {
  /// An object that contains the properties associated with a sentiment
  /// detection job.
  final SentimentDetectionJobProperties sentimentDetectionJobProperties;

  DescribeSentimentDetectionJobResponse({
    this.sentimentDetectionJobProperties,
  });
  static DescribeSentimentDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeSentimentDetectionJobResponse();
}

class DescribeTopicsDetectionJobResponse {
  /// The list of properties for the requested job.
  final TopicsDetectionJobProperties topicsDetectionJobProperties;

  DescribeTopicsDetectionJobResponse({
    this.topicsDetectionJobProperties,
  });
  static DescribeTopicsDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeTopicsDetectionJobResponse();
}

class DetectDominantLanguageResponse {
  /// The languages that Amazon Comprehend detected in the input text. For each
  /// language, the response returns the RFC 5646 language code and the level of
  /// confidence that Amazon Comprehend has in the accuracy of its inference.
  /// For more information about RFC 5646, see
  /// [Tags for Identifying Languages](https://tools.ietf.org/html/rfc5646) on
  /// the _IETF Tools_ web site.
  final List<DominantLanguage> languages;

  DetectDominantLanguageResponse({
    this.languages,
  });
  static DetectDominantLanguageResponse fromJson(Map<String, dynamic> json) =>
      DetectDominantLanguageResponse();
}

class DetectEntitiesResponse {
  /// A collection of entities identified in the input text. For each entity,
  /// the response provides the entity text, entity type, where the entity text
  /// begins and ends, and the level of confidence that Amazon Comprehend has in
  /// the detection. For a list of entity types, see how-entities.
  final List<Entity> entities;

  DetectEntitiesResponse({
    this.entities,
  });
  static DetectEntitiesResponse fromJson(Map<String, dynamic> json) =>
      DetectEntitiesResponse();
}

class DetectKeyPhrasesResponse {
  /// A collection of key phrases that Amazon Comprehend identified in the input
  /// text. For each key phrase, the response provides the text of the key
  /// phrase, where the key phrase begins and ends, and the level of confidence
  /// that Amazon Comprehend has in the accuracy of the detection.
  final List<KeyPhrase> keyPhrases;

  DetectKeyPhrasesResponse({
    this.keyPhrases,
  });
  static DetectKeyPhrasesResponse fromJson(Map<String, dynamic> json) =>
      DetectKeyPhrasesResponse();
}

class DetectSentimentResponse {
  /// The inferred sentiment that Amazon Comprehend has the highest level of
  /// confidence in.
  final String sentiment;

  /// An object that lists the sentiments, and their corresponding confidence
  /// levels.
  final SentimentScore sentimentScore;

  DetectSentimentResponse({
    this.sentiment,
    this.sentimentScore,
  });
  static DetectSentimentResponse fromJson(Map<String, dynamic> json) =>
      DetectSentimentResponse();
}

class DetectSyntaxResponse {
  /// A collection of syntax tokens describing the text. For each token, the
  /// response provides the text, the token type, where the text begins and
  /// ends, and the level of confidence that Amazon Comprehend has that the
  /// token is correct. For a list of token types, see how-syntax.
  final List<SyntaxToken> syntaxTokens;

  DetectSyntaxResponse({
    this.syntaxTokens,
  });
  static DetectSyntaxResponse fromJson(Map<String, dynamic> json) =>
      DetectSyntaxResponse();
}

/// Provides information for filtering a list of document classification jobs.
/// For more information, see the operation. You can provide only one filter
/// parameter in each request.
class DocumentClassificationJobFilter {
  /// Filters on the name of the job.
  final String jobName;

  /// Filters the list based on job status. Returns only jobs with the specified
  /// status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in descending order, newest to oldest.
  final DateTime submitTimeAfter;

  DocumentClassificationJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about a document classification job.
class DocumentClassificationJobProperties {
  /// The identifier assigned to the document classification job.
  final String jobId;

  /// The name that you assigned to the document classification job.
  final String jobName;

  /// The current status of the document classification job. If the status is
  /// `FAILED`, the `Message` field shows the reason for the failure.
  final String jobStatus;

  /// A description of the status of the job.
  final String message;

  /// The time that the document classification job was submitted for
  /// processing.
  final DateTime submitTime;

  /// The time that the document classification job completed.
  final DateTime endTime;

  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String documentClassifierArn;

  /// The input data configuration that you supplied when you created the
  /// document classification job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration that you supplied when you created the
  /// document classification job.
  final OutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the AWS identity and Access Management
  /// (IAM) role that grants Amazon Comprehend read access to your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your document classification
  /// job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  DocumentClassificationJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.documentClassifierArn,
    this.inputDataConfig,
    this.outputDataConfig,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static DocumentClassificationJobProperties fromJson(
          Map<String, dynamic> json) =>
      DocumentClassificationJobProperties();
}

/// Provides information for filtering a list of document classifiers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the operation.
class DocumentClassifierFilter {
  /// Filters the list of classifiers based on status.
  final String status;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted before the
  /// specified time. Classifiers are returned in ascending order, oldest to
  /// newest.
  final DateTime submitTimeBefore;

  /// Filters the list of classifiers based on the time that the classifier was
  /// submitted for processing. Returns only classifiers submitted after the
  /// specified time. Classifiers are returned in descending order, newest to
  /// oldest.
  final DateTime submitTimeAfter;

  DocumentClassifierFilter({
    this.status,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// The input properties for training a document classifier.
///
/// For more information on how the input file is formatted, see
/// how-document-classification-training-data.
class DocumentClassifierInputDataConfig {
  /// The Amazon S3 URI for the input data. The S3 bucket must be in the same
  /// region as the API endpoint that you are calling. The URI can point to a
  /// single input file or it can provide the prefix for a collection of input
  /// files.
  ///
  /// For example, if you use the URI `S3://bucketName/prefix`, if the prefix is
  /// a single file, Amazon Comprehend uses that file as input. If more than one
  /// file begins with the prefix, Amazon Comprehend uses all of them as input.
  final String s3Uri;

  DocumentClassifierInputDataConfig({
    @required this.s3Uri,
  });
  static DocumentClassifierInputDataConfig fromJson(
          Map<String, dynamic> json) =>
      DocumentClassifierInputDataConfig();
}

/// Provides output results configuration parameters for custom classifier jobs.
class DocumentClassifierOutputDataConfig {
  /// When you use the `OutputDataConfig` object while creating a custom
  /// classifier, you specify the Amazon S3 location where you want to write the
  /// confusion matrix. The URI must be in the same region as the API endpoint
  /// that you are calling. The location is used as the prefix for the actual
  /// location of this output file.
  ///
  /// When the custom classifier job is finished, the service creates the output
  /// file in a directory specific to the job. The `S3Uri` field contains the
  /// location of the output file, called `output.tar.gz`. It is a compressed
  /// archive that contains the confusion matrix.
  final String s3Uri;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt the output results from an analysis job. The KmsKeyId can
  /// be one of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   KMS Key Alias: `"alias/ExampleAlias"`
  ///
  /// *   ARN of a KMS Key Alias:
  /// `"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"`
  final String kmsKeyId;

  DocumentClassifierOutputDataConfig({
    this.s3Uri,
    this.kmsKeyId,
  });
  static DocumentClassifierOutputDataConfig fromJson(
          Map<String, dynamic> json) =>
      DocumentClassifierOutputDataConfig();
}

/// Provides information about a document classifier.
class DocumentClassifierProperties {
  /// The Amazon Resource Name (ARN) that identifies the document classifier.
  final String documentClassifierArn;

  /// The language code for the language of the documents that the classifier
  /// was trained on.
  final String languageCode;

  /// The status of the document classifier. If the status is `TRAINED` the
  /// classifier is ready to use. If the status is `FAILED` you can see
  /// additional information about why the classifier wasn't trained in the
  /// `Message` field.
  final String status;

  /// Additional information about the status of the classifier.
  final String message;

  /// The time that the document classifier was submitted for training.
  final DateTime submitTime;

  /// The time that training the document classifier completed.
  final DateTime endTime;

  /// Indicates the time when the training starts on documentation classifiers.
  /// You are billed for the time interval between this time and the value of
  /// TrainingEndTime.
  final DateTime trainingStartTime;

  /// The time that training of the document classifier was completed. Indicates
  /// the time when the training completes on documentation classifiers. You are
  /// billed for the time interval between this time and the value of
  /// TrainingStartTime.
  final DateTime trainingEndTime;

  /// The input data configuration that you supplied when you created the
  /// document classifier for training.
  final DocumentClassifierInputDataConfig inputDataConfig;

  ///  Provides output results configuration parameters for custom classifier
  /// jobs.
  final DocumentClassifierOutputDataConfig outputDataConfig;

  /// Information about the document classifier, including the number of
  /// documents used for training the classifier, the number of documents used
  /// for test the classifier, and an accuracy rating.
  final ClassifierMetadata classifierMetadata;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM)
  /// role that grants Amazon Comprehend read access to your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom classifier. For
  /// more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  DocumentClassifierProperties({
    this.documentClassifierArn,
    this.languageCode,
    this.status,
    this.message,
    this.submitTime,
    this.endTime,
    this.trainingStartTime,
    this.trainingEndTime,
    this.inputDataConfig,
    this.outputDataConfig,
    this.classifierMetadata,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static DocumentClassifierProperties fromJson(Map<String, dynamic> json) =>
      DocumentClassifierProperties();
}

/// Returns the code for the dominant language in the input text and the level
/// of confidence that Amazon Comprehend has in the accuracy of the detection.
class DominantLanguage {
  /// The RFC 5646 language code for the dominant language. For more information
  /// about RFC 5646, see
  /// [Tags for Identifying Languages](https://tools.ietf.org/html/rfc5646) on
  /// the _IETF Tools_ web site.
  final String languageCode;

  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double score;

  DominantLanguage({
    this.languageCode,
    this.score,
  });
  static DominantLanguage fromJson(Map<String, dynamic> json) =>
      DominantLanguage();
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class DominantLanguageDetectionJobFilter {
  /// Filters on the name of the job.
  final String jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime submitTimeAfter;

  DominantLanguageDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about a dominant language detection job.
class DominantLanguageDetectionJobProperties {
  /// The identifier assigned to the dominant language detection job.
  final String jobId;

  /// The name that you assigned to the dominant language detection job.
  final String jobName;

  /// The current status of the dominant language detection job. If the status
  /// is `FAILED`, the `Message` field shows the reason for the failure.
  final String jobStatus;

  /// A description for the status of a job.
  final String message;

  /// The time that the dominant language detection job was submitted for
  /// processing.
  final DateTime submitTime;

  /// The time that the dominant language detection job completed.
  final DateTime endTime;

  /// The input data configuration that you supplied when you created the
  /// dominant language detection job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration that you supplied when you created the
  /// dominant language detection job.
  final OutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your dominant language
  /// detection job. For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  DominantLanguageDetectionJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.inputDataConfig,
    this.outputDataConfig,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static DominantLanguageDetectionJobProperties fromJson(
          Map<String, dynamic> json) =>
      DominantLanguageDetectionJobProperties();
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class EntitiesDetectionJobFilter {
  /// Filters on the name of the job.
  final String jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime submitTimeAfter;

  EntitiesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about an entities detection job.
class EntitiesDetectionJobProperties {
  /// The identifier assigned to the entities detection job.
  final String jobId;

  /// The name that you assigned the entities detection job.
  final String jobName;

  /// The current status of the entities detection job. If the status is
  /// `FAILED`, the `Message` field shows the reason for the failure.
  final String jobStatus;

  /// A description of the status of a job.
  final String message;

  /// The time that the entities detection job was submitted for processing.
  final DateTime submitTime;

  /// The time that the entities detection job completed
  final DateTime endTime;

  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String entityRecognizerArn;

  /// The input data configuration that you supplied when you created the
  /// entities detection job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration that you supplied when you created the
  /// entities detection job.
  final OutputDataConfig outputDataConfig;

  /// The language code of the input documents.
  final String languageCode;

  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your entity detection job. For
  /// more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  EntitiesDetectionJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.entityRecognizerArn,
    this.inputDataConfig,
    this.outputDataConfig,
    this.languageCode,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static EntitiesDetectionJobProperties fromJson(Map<String, dynamic> json) =>
      EntitiesDetectionJobProperties();
}

/// Provides information about an entity.
class Entity {
  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double score;

  /// The entity's type.
  final String type;

  /// The text of the entity.
  final String text;

  /// A character offset in the input text that shows where the entity begins
  /// (the first character is at position 0). The offset returns the position of
  /// each UTF-8 code point in the string. A _code point_ is the abstract
  /// character from a particular graphical representation. For example, a
  /// multi-byte UTF-8 character maps to a single code point.
  final int beginOffset;

  /// A character offset in the input text that shows where the entity ends. The
  /// offset returns the position of each UTF-8 code point in the string. A
  /// _code point_ is the abstract character from a particular graphical
  /// representation. For example, a multi-byte UTF-8 character maps to a single
  /// code point.
  final int endOffset;

  Entity({
    this.score,
    this.type,
    this.text,
    this.beginOffset,
    this.endOffset,
  });
  static Entity fromJson(Map<String, dynamic> json) => Entity();
}

/// Describes the annotations associated with a entity recognizer.
class EntityRecognizerAnnotations {
  ///  Specifies the Amazon S3 location where the annotations for an entity
  /// recognizer are located. The URI must be in the same region as the API
  /// endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerAnnotations({
    @required this.s3Uri,
  });
  static EntityRecognizerAnnotations fromJson(Map<String, dynamic> json) =>
      EntityRecognizerAnnotations();
}

/// Describes the training documents submitted with an entity recognizer.
class EntityRecognizerDocuments {
  ///  Specifies the Amazon S3 location where the training documents for an
  /// entity recognizer are located. The URI must be in the same region as the
  /// API endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerDocuments({
    @required this.s3Uri,
  });
  static EntityRecognizerDocuments fromJson(Map<String, dynamic> json) =>
      EntityRecognizerDocuments();
}

/// Describes the entity recognizer submitted with an entity recognizer.
class EntityRecognizerEntityList {
  /// Specifies the Amazon S3 location where the entity list is located. The URI
  /// must be in the same region as the API endpoint that you are calling.
  final String s3Uri;

  EntityRecognizerEntityList({
    @required this.s3Uri,
  });
  static EntityRecognizerEntityList fromJson(Map<String, dynamic> json) =>
      EntityRecognizerEntityList();
}

/// Detailed information about the accuracy of an entity recognizer.
class EntityRecognizerEvaluationMetrics {
  /// A measure of the usefulness of the recognizer results in the test data.
  /// High precision means that the recognizer returned substantially more
  /// relevant results than irrelevant ones.
  final double precision;

  /// A measure of how complete the recognizer results are for the test data.
  /// High recall means that the recognizer returned most of the relevant
  /// results.
  final double recall;

  /// A measure of how accurate the recognizer results are for the test data. It
  /// is derived from the `Precision` and `Recall` values. The `F1Score` is the
  /// harmonic average of the two scores. The highest score is 1, and the worst
  /// score is 0.
  final double f1Score;

  EntityRecognizerEvaluationMetrics({
    this.precision,
    this.recall,
    this.f1Score,
  });
  static EntityRecognizerEvaluationMetrics fromJson(
          Map<String, dynamic> json) =>
      EntityRecognizerEvaluationMetrics();
}

/// Provides information for filtering a list of entity recognizers. You can
/// only specify one filtering parameter in a request. For more information, see
/// the operation./>
class EntityRecognizerFilter {
  /// The status of an entity recognizer.
  final String status;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted before the specified time.
  /// Jobs are returned in descending order, newest to oldest.
  final DateTime submitTimeBefore;

  /// Filters the list of entities based on the time that the list was submitted
  /// for processing. Returns only jobs submitted after the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime submitTimeAfter;

  EntityRecognizerFilter({
    this.status,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Specifies the format and location of the input data.
class EntityRecognizerInputDataConfig {
  /// The entity types in the input data for an entity recognizer. A maximum of
  /// 12 entity types can be used at one time to train an entity recognizer.
  final List<EntityTypesListItem> entityTypes;

  /// S3 location of the documents folder for an entity recognizer
  final EntityRecognizerDocuments documents;

  /// S3 location of the annotations file for an entity recognizer.
  final EntityRecognizerAnnotations annotations;

  /// S3 location of the entity list for an entity recognizer.
  final EntityRecognizerEntityList entityList;

  EntityRecognizerInputDataConfig({
    @required this.entityTypes,
    @required this.documents,
    this.annotations,
    this.entityList,
  });
  static EntityRecognizerInputDataConfig fromJson(Map<String, dynamic> json) =>
      EntityRecognizerInputDataConfig();
}

/// Detailed information about an entity recognizer.
class EntityRecognizerMetadata {
  ///  The number of documents in the input data that were used to train the
  /// entity recognizer. Typically this is 80 to 90 percent of the input
  /// documents.
  final int numberOfTrainedDocuments;

  ///  The number of documents in the input data that were used to test the
  /// entity recognizer. Typically this is 10 to 20 percent of the input
  /// documents.
  final int numberOfTestDocuments;

  /// Detailed information about the accuracy of an entity recognizer.
  final EntityRecognizerEvaluationMetrics evaluationMetrics;

  /// Entity types from the metadata of an entity recognizer.
  final List<EntityRecognizerMetadataEntityTypesListItem> entityTypes;

  EntityRecognizerMetadata({
    this.numberOfTrainedDocuments,
    this.numberOfTestDocuments,
    this.evaluationMetrics,
    this.entityTypes,
  });
  static EntityRecognizerMetadata fromJson(Map<String, dynamic> json) =>
      EntityRecognizerMetadata();
}

/// Individual item from the list of entity types in the metadata of an entity
/// recognizer.
class EntityRecognizerMetadataEntityTypesListItem {
  /// Type of entity from the list of entity types in the metadata of an entity
  /// recognizer.
  final String type;

  /// Detailed information about the accuracy of the entity recognizer for a
  /// specific item on the list of entity types.
  final EntityTypesEvaluationMetrics evaluationMetrics;

  /// indicates the number of times the given entity name was seen in the
  /// training data.
  final int numberOfTrainMentions;

  EntityRecognizerMetadataEntityTypesListItem({
    this.type,
    this.evaluationMetrics,
    this.numberOfTrainMentions,
  });
  static EntityRecognizerMetadataEntityTypesListItem fromJson(
          Map<String, dynamic> json) =>
      EntityRecognizerMetadataEntityTypesListItem();
}

/// Describes information about an entity recognizer.
class EntityRecognizerProperties {
  /// The Amazon Resource Name (ARN) that identifies the entity recognizer.
  final String entityRecognizerArn;

  ///  The language of the input documents. All documents must be in the same
  /// language. Only English ("en") is currently supported.
  final String languageCode;

  /// Provides the status of the entity recognizer.
  final String status;

  ///  A description of the status of the recognizer.
  final String message;

  /// The time that the recognizer was submitted for processing.
  final DateTime submitTime;

  /// The time that the recognizer creation completed.
  final DateTime endTime;

  /// The time that training of the entity recognizer started.
  final DateTime trainingStartTime;

  /// The time that training of the entity recognizer was completed.
  final DateTime trainingEndTime;

  /// The input data properties of an entity recognizer.
  final EntityRecognizerInputDataConfig inputDataConfig;

  ///  Provides information about an entity recognizer.
  final EntityRecognizerMetadata recognizerMetadata;

  ///  The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM)
  /// role that grants Amazon Comprehend read access to your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your custom entity recognizer.
  /// For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  EntityRecognizerProperties({
    this.entityRecognizerArn,
    this.languageCode,
    this.status,
    this.message,
    this.submitTime,
    this.endTime,
    this.trainingStartTime,
    this.trainingEndTime,
    this.inputDataConfig,
    this.recognizerMetadata,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static EntityRecognizerProperties fromJson(Map<String, dynamic> json) =>
      EntityRecognizerProperties();
}

/// Detailed information about the accuracy of an entity recognizer for a
/// specific entity type.
class EntityTypesEvaluationMetrics {
  /// A measure of the usefulness of the recognizer results for a specific
  /// entity type in the test data. High precision means that the recognizer
  /// returned substantially more relevant results than irrelevant ones.
  final double precision;

  /// A measure of how complete the recognizer results are for a specific entity
  /// type in the test data. High recall means that the recognizer returned most
  /// of the relevant results.
  final double recall;

  /// A measure of how accurate the recognizer results are for for a specific
  /// entity type in the test data. It is derived from the `Precision` and
  /// `Recall` values. The `F1Score` is the harmonic average of the two scores.
  /// The highest score is 1, and the worst score is 0.
  final double f1Score;

  EntityTypesEvaluationMetrics({
    this.precision,
    this.recall,
    this.f1Score,
  });
  static EntityTypesEvaluationMetrics fromJson(Map<String, dynamic> json) =>
      EntityTypesEvaluationMetrics();
}

/// Information about an individual item on a list of entity types.
class EntityTypesListItem {
  /// Entity type of an item on an entity type list.
  final String type;

  EntityTypesListItem({
    @required this.type,
  });
  static EntityTypesListItem fromJson(Map<String, dynamic> json) =>
      EntityTypesListItem();
}

/// The input properties for a topic detection job.
class InputDataConfig {
  /// The Amazon S3 URI for the input data. The URI must be in same region as
  /// the API endpoint that you are calling. The URI can point to a single input
  /// file or it can provide the prefix for a collection of data files.
  ///
  /// For example, if you use the URI `S3://bucketName/prefix`, if the prefix is
  /// a single file, Amazon Comprehend uses that file as input. If more than one
  /// file begins with the prefix, Amazon Comprehend uses all of them as input.
  final String s3Uri;

  /// Specifies how the text in an input file should be processed:
  ///
  /// *    `ONE_DOC_PER_FILE` - Each file is considered a separate document. Use
  /// this option when you are processing large documents, such as newspaper
  /// articles or scientific papers.
  ///
  /// *    `ONE_DOC_PER_LINE` - Each line in a file is considered a separate
  /// document. Use this option when you are processing many short documents,
  /// such as text messages.
  final String inputFormat;

  InputDataConfig({
    @required this.s3Uri,
    this.inputFormat,
  });
  static InputDataConfig fromJson(Map<String, dynamic> json) =>
      InputDataConfig();
}

/// Describes a key noun phrase.
class KeyPhrase {
  /// The level of confidence that Amazon Comprehend has in the accuracy of the
  /// detection.
  final double score;

  /// The text of a key noun phrase.
  final String text;

  /// A character offset in the input text that shows where the key phrase
  /// begins (the first character is at position 0). The offset returns the
  /// position of each UTF-8 code point in the string. A _code point_ is the
  /// abstract character from a particular graphical representation. For
  /// example, a multi-byte UTF-8 character maps to a single code point.
  final int beginOffset;

  /// A character offset in the input text where the key phrase ends. The offset
  /// returns the position of each UTF-8 code point in the string. A `code
  /// point` is the abstract character from a particular graphical
  /// representation. For example, a multi-byte UTF-8 character maps to a single
  /// code point.
  final int endOffset;

  KeyPhrase({
    this.score,
    this.text,
    this.beginOffset,
    this.endOffset,
  });
  static KeyPhrase fromJson(Map<String, dynamic> json) => KeyPhrase();
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class KeyPhrasesDetectionJobFilter {
  /// Filters on the name of the job.
  final String jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime submitTimeAfter;

  KeyPhrasesDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about a key phrases detection job.
class KeyPhrasesDetectionJobProperties {
  /// The identifier assigned to the key phrases detection job.
  final String jobId;

  /// The name that you assigned the key phrases detection job.
  final String jobName;

  /// The current status of the key phrases detection job. If the status is
  /// `FAILED`, the `Message` field shows the reason for the failure.
  final String jobStatus;

  /// A description of the status of a job.
  final String message;

  /// The time that the key phrases detection job was submitted for processing.
  final DateTime submitTime;

  /// The time that the key phrases detection job completed.
  final DateTime endTime;

  /// The input data configuration that you supplied when you created the key
  /// phrases detection job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration that you supplied when you created the key
  /// phrases detection job.
  final OutputDataConfig outputDataConfig;

  /// The language code of the input documents.
  final String languageCode;

  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your key phrases detection job.
  /// For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  KeyPhrasesDetectionJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.inputDataConfig,
    this.outputDataConfig,
    this.languageCode,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static KeyPhrasesDetectionJobProperties fromJson(Map<String, dynamic> json) =>
      KeyPhrasesDetectionJobProperties();
}

class ListDocumentClassificationJobsResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassificationJobProperties>
      documentClassificationJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListDocumentClassificationJobsResponse({
    this.documentClassificationJobPropertiesList,
    this.nextToken,
  });
  static ListDocumentClassificationJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDocumentClassificationJobsResponse();
}

class ListDocumentClassifiersResponse {
  /// A list containing the properties of each job returned.
  final List<DocumentClassifierProperties> documentClassifierPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListDocumentClassifiersResponse({
    this.documentClassifierPropertiesList,
    this.nextToken,
  });
  static ListDocumentClassifiersResponse fromJson(Map<String, dynamic> json) =>
      ListDocumentClassifiersResponse();
}

class ListDominantLanguageDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<DominantLanguageDetectionJobProperties>
      dominantLanguageDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListDominantLanguageDetectionJobsResponse({
    this.dominantLanguageDetectionJobPropertiesList,
    this.nextToken,
  });
  static ListDominantLanguageDetectionJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListDominantLanguageDetectionJobsResponse();
}

class ListEntitiesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<EntitiesDetectionJobProperties> entitiesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListEntitiesDetectionJobsResponse({
    this.entitiesDetectionJobPropertiesList,
    this.nextToken,
  });
  static ListEntitiesDetectionJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListEntitiesDetectionJobsResponse();
}

class ListEntityRecognizersResponse {
  /// The list of properties of an entity recognizer.
  final List<EntityRecognizerProperties> entityRecognizerPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListEntityRecognizersResponse({
    this.entityRecognizerPropertiesList,
    this.nextToken,
  });
  static ListEntityRecognizersResponse fromJson(Map<String, dynamic> json) =>
      ListEntityRecognizersResponse();
}

class ListKeyPhrasesDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<KeyPhrasesDetectionJobProperties>
      keyPhrasesDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListKeyPhrasesDetectionJobsResponse({
    this.keyPhrasesDetectionJobPropertiesList,
    this.nextToken,
  });
  static ListKeyPhrasesDetectionJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListKeyPhrasesDetectionJobsResponse();
}

class ListSentimentDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<SentimentDetectionJobProperties>
      sentimentDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListSentimentDetectionJobsResponse({
    this.sentimentDetectionJobPropertiesList,
    this.nextToken,
  });
  static ListSentimentDetectionJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListSentimentDetectionJobsResponse();
}

class ListTagsForResourceResponse {
  /// The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you
  /// are querying.
  final String resourceArn;

  /// Tags associated with the Amazon Comprehend resource being queried. A tag
  /// is a key-value pair that adds as a metadata to a resource used by Amazon
  /// Comprehend. For example, a tag with "Sales" as the key might be added to a
  /// resource to indicate its use by the sales department.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.resourceArn,
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class ListTopicsDetectionJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<TopicsDetectionJobProperties> topicsDetectionJobPropertiesList;

  /// Identifies the next page of results to return.
  final String nextToken;

  ListTopicsDetectionJobsResponse({
    this.topicsDetectionJobPropertiesList,
    this.nextToken,
  });
  static ListTopicsDetectionJobsResponse fromJson(Map<String, dynamic> json) =>
      ListTopicsDetectionJobsResponse();
}

/// Provides configuration parameters for the output of topic detection jobs.
class OutputDataConfig {
  /// When you use the `OutputDataConfig` object with asynchronous operations,
  /// you specify the Amazon S3 location where you want to write the output
  /// data. The URI must be in the same region as the API endpoint that you are
  /// calling. The location is used as the prefix for the actual location of the
  /// output file.
  ///
  /// When the topic detection job is finished, the service creates an output
  /// file in a directory specific to the job. The `S3Uri` field contains the
  /// location of the output file, called `output.tar.gz`. It is a compressed
  /// archive that contains the ouput of the operation.
  final String s3Uri;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt the output results from an analysis job. The KmsKeyId can
  /// be one of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   KMS Key Alias: `"alias/ExampleAlias"`
  ///
  /// *   ARN of a KMS Key Alias:
  /// `"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"`
  final String kmsKeyId;

  OutputDataConfig({
    @required this.s3Uri,
    this.kmsKeyId,
  });
  static OutputDataConfig fromJson(Map<String, dynamic> json) =>
      OutputDataConfig();
}

/// Identifies the part of speech represented by the token and gives the
/// confidence that Amazon Comprehend has that the part of speech was correctly
/// identified. For more information about the parts of speech that Amazon
/// Comprehend can identify, see how-syntax.
class PartOfSpeechTag {
  /// Identifies the part of speech that the token represents.
  final String tag;

  /// The confidence that Amazon Comprehend has that the part of speech was
  /// correctly identified.
  final double score;

  PartOfSpeechTag({
    this.tag,
    this.score,
  });
  static PartOfSpeechTag fromJson(Map<String, dynamic> json) =>
      PartOfSpeechTag();
}

/// Provides information for filtering a list of dominant language detection
/// jobs. For more information, see the operation.
class SentimentDetectionJobFilter {
  /// Filters on the name of the job.
  final String jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs
  /// are returned in ascending order, oldest to newest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime submitTimeAfter;

  SentimentDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about a sentiment detection job.
class SentimentDetectionJobProperties {
  /// The identifier assigned to the sentiment detection job.
  final String jobId;

  /// The name that you assigned to the sentiment detection job
  final String jobName;

  /// The current status of the sentiment detection job. If the status is
  /// `FAILED`, the `Messages` field shows the reason for the failure.
  final String jobStatus;

  /// A description of the status of a job.
  final String message;

  /// The time that the sentiment detection job was submitted for processing.
  final DateTime submitTime;

  /// The time that the sentiment detection job ended.
  final DateTime endTime;

  /// The input data configuration that you supplied when you created the
  /// sentiment detection job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration that you supplied when you created the
  /// sentiment detection job.
  final OutputDataConfig outputDataConfig;

  /// The language code of the input documents.
  final String languageCode;

  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to
  /// your input data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ///  Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your sentiment detection job.
  /// For more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  SentimentDetectionJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.inputDataConfig,
    this.outputDataConfig,
    this.languageCode,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static SentimentDetectionJobProperties fromJson(Map<String, dynamic> json) =>
      SentimentDetectionJobProperties();
}

/// Describes the level of confidence that Amazon Comprehend has in the accuracy
/// of its detection of sentiments.
class SentimentScore {
  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the `POSITIVE` sentiment.
  final double positive;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the `NEGATIVE` sentiment.
  final double negative;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the `NEUTRAL` sentiment.
  final double neutral;

  /// The level of confidence that Amazon Comprehend has in the accuracy of its
  /// detection of the `MIXED` sentiment.
  final double mixed;

  SentimentScore({
    this.positive,
    this.negative,
    this.neutral,
    this.mixed,
  });
  static SentimentScore fromJson(Map<String, dynamic> json) => SentimentScore();
}

class StartDocumentClassificationJobResponse {
  /// The identifier generated for the job. To get the status of the job, use
  /// this identifier with the operation.
  final String jobId;

  /// The status of the job:
  ///
  /// *   SUBMITTED - The job has been received and queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. For details, use the operation.
  ///
  /// *   STOP_REQUESTED - Amazon Comprehend has received a stop request for the
  /// job and is processing the request.
  ///
  /// *   STOPPED - The job was successfully stopped without completing.
  final String jobStatus;

  StartDocumentClassificationJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartDocumentClassificationJobResponse fromJson(
          Map<String, dynamic> json) =>
      StartDocumentClassificationJobResponse();
}

class StartDominantLanguageDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String jobId;

  /// The status of the job.
  ///
  /// *   SUBMITTED - The job has been received and is queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. To get details, use the operation.
  final String jobStatus;

  StartDominantLanguageDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartDominantLanguageDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StartDominantLanguageDetectionJobResponse();
}

class StartEntitiesDetectionJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the operation.
  final String jobId;

  /// The status of the job.
  ///
  /// *   SUBMITTED - The job has been received and is queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. To get details, use the operation.
  ///
  /// *   STOP_REQUESTED - Amazon Comprehend has received a stop request for the
  /// job and is processing the request.
  ///
  /// *   STOPPED - The job was successfully stopped without completing.
  final String jobStatus;

  StartEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartEntitiesDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StartEntitiesDetectionJobResponse();
}

class StartKeyPhrasesDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String jobId;

  /// The status of the job.
  ///
  /// *   SUBMITTED - The job has been received and is queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. To get details, use the operation.
  final String jobStatus;

  StartKeyPhrasesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartKeyPhrasesDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StartKeyPhrasesDetectionJobResponse();
}

class StartSentimentDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the operation.
  final String jobId;

  /// The status of the job.
  ///
  /// *   SUBMITTED - The job has been received and is queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. To get details, use the operation.
  final String jobStatus;

  StartSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartSentimentDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StartSentimentDetectionJobResponse();
}

class StartTopicsDetectionJobResponse {
  /// The identifier generated for the job. To get the status of the job, use
  /// this identifier with the `DescribeTopicDetectionJob` operation.
  final String jobId;

  /// The status of the job:
  ///
  /// *   SUBMITTED - The job has been received and is queued for processing.
  ///
  /// *   IN_PROGRESS - Amazon Comprehend is processing the job.
  ///
  /// *   COMPLETED - The job was successfully completed and the output is
  /// available.
  ///
  /// *   FAILED - The job did not complete. To get details, use the
  /// `DescribeTopicDetectionJob` operation.
  final String jobStatus;

  StartTopicsDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StartTopicsDetectionJobResponse fromJson(Map<String, dynamic> json) =>
      StartTopicsDetectionJobResponse();
}

class StopDominantLanguageDetectionJobResponse {
  /// The identifier of the dominant language detection job to stop.
  final String jobId;

  /// Either `STOP_REQUESTED` if the job is currently running, or `STOPPED` if
  /// the job was previously stopped with the `StopDominantLanguageDetectionJob`
  /// operation.
  final String jobStatus;

  StopDominantLanguageDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StopDominantLanguageDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StopDominantLanguageDetectionJobResponse();
}

class StopEntitiesDetectionJobResponse {
  /// The identifier of the entities detection job to stop.
  final String jobId;

  /// Either `STOP_REQUESTED` if the job is currently running, or `STOPPED` if
  /// the job was previously stopped with the `StopEntitiesDetectionJob`
  /// operation.
  final String jobStatus;

  StopEntitiesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StopEntitiesDetectionJobResponse fromJson(Map<String, dynamic> json) =>
      StopEntitiesDetectionJobResponse();
}

class StopKeyPhrasesDetectionJobResponse {
  /// The identifier of the key phrases detection job to stop.
  final String jobId;

  /// Either `STOP_REQUESTED` if the job is currently running, or `STOPPED` if
  /// the job was previously stopped with the `StopKeyPhrasesDetectionJob`
  /// operation.
  final String jobStatus;

  StopKeyPhrasesDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StopKeyPhrasesDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StopKeyPhrasesDetectionJobResponse();
}

class StopSentimentDetectionJobResponse {
  /// The identifier of the sentiment detection job to stop.
  final String jobId;

  /// Either `STOP_REQUESTED` if the job is currently running, or `STOPPED` if
  /// the job was previously stopped with the `StopSentimentDetectionJob`
  /// operation.
  final String jobStatus;

  StopSentimentDetectionJobResponse({
    this.jobId,
    this.jobStatus,
  });
  static StopSentimentDetectionJobResponse fromJson(
          Map<String, dynamic> json) =>
      StopSentimentDetectionJobResponse();
}

class StopTrainingDocumentClassifierResponse {
  StopTrainingDocumentClassifierResponse();
  static StopTrainingDocumentClassifierResponse fromJson(
          Map<String, dynamic> json) =>
      StopTrainingDocumentClassifierResponse();
}

class StopTrainingEntityRecognizerResponse {
  StopTrainingEntityRecognizerResponse();
  static StopTrainingEntityRecognizerResponse fromJson(
          Map<String, dynamic> json) =>
      StopTrainingEntityRecognizerResponse();
}

/// Represents a work in the input text that was recognized and assigned a part
/// of speech. There is one syntax token record for each word in the source
/// text.
class SyntaxToken {
  /// A unique identifier for a token.
  final int tokenId;

  /// The word that was recognized in the source text.
  final String text;

  /// The zero-based offset from the beginning of the source text to the first
  /// character in the word.
  final int beginOffset;

  /// The zero-based offset from the beginning of the source text to the last
  /// character in the word.
  final int endOffset;

  /// Provides the part of speech label and the confidence level that Amazon
  /// Comprehend has that the part of speech was correctly identified. For more
  /// information, see how-syntax.
  final PartOfSpeechTag partOfSpeech;

  SyntaxToken({
    this.tokenId,
    this.text,
    this.beginOffset,
    this.endOffset,
    this.partOfSpeech,
  });
  static SyntaxToken fromJson(Map<String, dynamic> json) => SyntaxToken();
}

/// A key-value pair that adds as a metadata to a resource used by Amazon
/// Comprehend. For example, a tag with the key-value pair ‘Department’:’Sales’
/// might be added to a resource to indicate its use by a particular department.
class Tag {
  /// The initial part of a key-value pair that forms a tag associated with a
  /// given resource. For instance, if you want to show which resources are used
  /// by which departments, you might use “Department” as the key portion of the
  /// pair, with multiple possible values such as “sales,” “legal,” and
  /// “administration.”
  final String key;

  ///  The second part of a key-value pair that forms a tag associated with a
  /// given resource. For instance, if you want to show which resources are used
  /// by which departments, you might use “Department” as the initial (key)
  /// portion of the pair, with a value of “sales” to indicate the sales
  /// department.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// Provides information for filtering topic detection jobs. For more
/// information, see .
class TopicsDetectionJobFilter {
  final String jobName;

  /// Filters the list of topic detection jobs based on job status. Returns only
  /// jobs with the specified status.
  final String jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted before the specified time. Jobs
  /// are returned in descending order, newest to oldest.
  final DateTime submitTimeBefore;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Only returns jobs submitted after the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime submitTimeAfter;

  TopicsDetectionJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeBefore,
    this.submitTimeAfter,
  });
}

/// Provides information about a topic detection job.
class TopicsDetectionJobProperties {
  /// The identifier assigned to the topic detection job.
  final String jobId;

  /// The name of the topic detection job.
  final String jobName;

  /// The current status of the topic detection job. If the status is `Failed`,
  /// the reason for the failure is shown in the `Message` field.
  final String jobStatus;

  /// A description for the status of a job.
  final String message;

  /// The time that the topic detection job was submitted for processing.
  final DateTime submitTime;

  /// The time that the topic detection job was completed.
  final DateTime endTime;

  /// The input data configuration supplied when you created the topic detection
  /// job.
  final InputDataConfig inputDataConfig;

  /// The output data configuration supplied when you created the topic
  /// detection job.
  final OutputDataConfig outputDataConfig;

  /// The number of topics to detect supplied when you created the topic
  /// detection job. The default is 10.
  final int numberOfTopics;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM)
  /// role that grants Amazon Comprehend read access to your job data.
  final String dataAccessRoleArn;

  /// ID for the AWS Key Management Service (KMS) key that Amazon Comprehend
  /// uses to encrypt data on the storage volume attached to the ML compute
  /// instance(s) that process the analysis job. The VolumeKmsKeyId can be
  /// either of the following formats:
  ///
  /// *   KMS Key ID: `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   Amazon Resource Name (ARN) of a KMS Key:
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  /// Configuration parameters for a private Virtual Private Cloud (VPC)
  /// containing the resources you are using for your topic detection job. For
  /// more information, see
  /// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
  final VpcConfig vpcConfig;

  TopicsDetectionJobProperties({
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.submitTime,
    this.endTime,
    this.inputDataConfig,
    this.outputDataConfig,
    this.numberOfTopics,
    this.dataAccessRoleArn,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  static TopicsDetectionJobProperties fromJson(Map<String, dynamic> json) =>
      TopicsDetectionJobProperties();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

///  Configuration parameters for an optional private Virtual Private Cloud
/// (VPC) containing the resources you are using for the job. For For more
/// information, see
/// [Amazon VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
class VpcConfig {
  /// The ID number for a security group on an instance of your private VPC.
  /// Security groups on your VPC function serve as a virtual firewall to
  /// control inbound and outbound traffic and provides security for the
  /// resources that you’ll be accessing on the VPC. This ID number is preceded
  /// by "sg-", for instance: "sg-03b388029b0a285ea". For more information, see
  /// [Security Groups for your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html).
  final List<String> securityGroupIds;

  /// The ID for each subnet being used in your private VPC. This subnet is a
  /// subset of the a range of IPv4 addresses used by the VPC and is specific to
  /// a given availability zone in the VPC’s region. This ID number is preceded
  /// by "subnet-", for instance: "subnet-04ccf456919e69055". For more
  /// information, see
  /// [VPCs and Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html).
  final List<String> subnets;

  VpcConfig({
    @required this.securityGroupIds,
    @required this.subnets,
  });
  static VpcConfig fromJson(Map<String, dynamic> json) => VpcConfig();
}
