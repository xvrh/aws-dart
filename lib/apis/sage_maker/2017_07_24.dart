import 'package:meta/meta.dart';

/// Provides APIs for creating and managing Amazon SageMaker resources.
class SageMakerApi {
  final _client;
  SageMakerApi(client)
      : _client = client.configured('SageMaker', serializer: 'json');

  /// Adds or overwrites one or more tags for the specified Amazon SageMaker
  /// resource. You can add tags to notebook instances, training jobs,
  /// hyperparameter tuning jobs, batch transform jobs, models, labeling jobs,
  /// work teams, endpoint configurations, and endpoints.
  ///
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource. For more information about tags, see For more information,
  /// see
  /// [AWS Tagging Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  ///
  ///
  ///
  /// Tags that you add to a hyperparameter tuning job by calling this API are
  /// also added to any training jobs that the hyperparameter tuning job
  /// launches after you call this API, but not to training jobs that the
  /// hyperparameter tuning job launched before you called this API. To make
  /// sure that the tags associated with a hyperparameter tuning job are also
  /// added to all training jobs that the hyperparameter tuning job launches,
  /// add the tags when you first create the tuning job by specifying them in
  /// the `Tags` parameter of CreateHyperParameterTuningJob
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource that you
  /// want to tag.
  ///
  /// [tags]: An array of `Tag` objects. Each tag is a key-value pair. Only the
  /// `key` parameter is required. If you don't specify a value, Amazon
  /// SageMaker sets the value to an empty string.
  Future<AddTagsOutput> addTags(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('AddTags', {
      'ResourceArn': resourceArn,
      'Tags': tags,
    });
    return AddTagsOutput.fromJson(response_);
  }

  /// Create a machine learning algorithm that you can use in Amazon SageMaker
  /// and list in the AWS Marketplace.
  ///
  /// [algorithmName]: The name of the algorithm.
  ///
  /// [algorithmDescription]: A description of the algorithm.
  ///
  /// [trainingSpecification]: Specifies details about training jobs run by this
  /// algorithm, including the following:
  ///
  /// *   The Amazon ECR path of the container and the version digest of the
  /// algorithm.
  ///
  /// *   The hyperparameters that the algorithm supports.
  ///
  /// *   The instance types that the algorithm supports for training.
  ///
  /// *   Whether the algorithm supports distributed training.
  ///
  /// *   The metrics that the algorithm emits to Amazon CloudWatch.
  ///
  /// *   Which metrics that the algorithm emits can be used as the objective
  /// metric for hyperparameter tuning jobs.
  ///
  /// *   The input channels that the algorithm supports for training data. For
  /// example, an algorithm might support `train`, `validation`, and `test`
  /// channels.
  ///
  /// [inferenceSpecification]: Specifies details about inference jobs that the
  /// algorithm runs, including the following:
  ///
  /// *   The Amazon ECR paths of containers that contain the inference code and
  /// model artifacts.
  ///
  /// *   The instance types that the algorithm supports for transform jobs and
  /// real-time endpoints used for inference.
  ///
  /// *   The input and output content formats that the algorithm supports for
  /// inference.
  ///
  /// [validationSpecification]: Specifies configurations for one or more
  /// training jobs and that Amazon SageMaker runs to test the algorithm's
  /// training code and, optionally, one or more batch transform jobs that
  /// Amazon SageMaker runs to test the algorithm's inference code.
  ///
  /// [certifyForMarketplace]: Whether to certify the algorithm so that it can
  /// be listed in AWS Marketplace.
  Future<CreateAlgorithmOutput> createAlgorithm(
      {@required String algorithmName,
      String algorithmDescription,
      @required TrainingSpecification trainingSpecification,
      InferenceSpecification inferenceSpecification,
      AlgorithmValidationSpecification validationSpecification,
      bool certifyForMarketplace}) async {
    var response_ = await _client.send('CreateAlgorithm', {
      'AlgorithmName': algorithmName,
      if (algorithmDescription != null)
        'AlgorithmDescription': algorithmDescription,
      'TrainingSpecification': trainingSpecification,
      if (inferenceSpecification != null)
        'InferenceSpecification': inferenceSpecification,
      if (validationSpecification != null)
        'ValidationSpecification': validationSpecification,
      if (certifyForMarketplace != null)
        'CertifyForMarketplace': certifyForMarketplace,
    });
    return CreateAlgorithmOutput.fromJson(response_);
  }

  /// Creates a Git repository as a resource in your Amazon SageMaker account.
  /// You can associate the repository with notebook instances so that you can
  /// use Git source control for the notebooks you create. The Git repository is
  /// a resource in your Amazon SageMaker account, so it can be associated with
  /// more than one notebook instance, and it persists independently from the
  /// lifecycle of any notebook instances it is associated with.
  ///
  /// The repository can be hosted either in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository.
  ///
  /// [codeRepositoryName]: The name of the Git repository. The name must have 1
  /// to 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  ///
  /// [gitConfig]: Specifies details about the repository, including the URL
  /// where the repository is located, the default branch, and credentials to
  /// use to access the repository.
  Future<CreateCodeRepositoryOutput> createCodeRepository(
      {@required String codeRepositoryName,
      @required GitConfig gitConfig}) async {
    var response_ = await _client.send('CreateCodeRepository', {
      'CodeRepositoryName': codeRepositoryName,
      'GitConfig': gitConfig,
    });
    return CreateCodeRepositoryOutput.fromJson(response_);
  }

  /// Starts a model compilation job. After the model has been compiled, Amazon
  /// SageMaker saves the resulting model artifacts to an Amazon Simple Storage
  /// Service (Amazon S3) bucket that you specify.
  ///
  /// If you choose to host your model using Amazon SageMaker hosting services,
  /// you can use the resulting model artifacts as part of the model. You can
  /// also use the artifacts with AWS IoT Greengrass. In that case, deploy them
  /// as an ML resource.
  ///
  /// In the request body, you provide the following:
  ///
  /// *   A name for the compilation job
  ///
  /// *    Information about the input model artifacts
  ///
  /// *   The output location for the compiled model and the device (target)
  /// that the model runs on
  ///
  /// *    `The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker
  /// assumes to perform the model compilation job`
  ///
  ///
  /// You can also provide a `Tag` to track the model compilation job's resource
  /// use and costs. The response body contains the `CompilationJobArn` for the
  /// compiled job.
  ///
  /// To stop a model compilation job, use StopCompilationJob. To get
  /// information about a particular model compilation job, use
  /// DescribeCompilationJob. To get information about multiple model
  /// compilation jobs, use ListCompilationJobs.
  ///
  /// [compilationJobName]: A name for the model compilation job. The name must
  /// be unique within the AWS Region and within your AWS account.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an IAM role that enables
  /// Amazon SageMaker to perform tasks on your behalf.
  ///
  /// During model compilation, Amazon SageMaker needs your permission to:
  ///
  /// *   Read input data from an S3 bucket
  ///
  /// *   Write model artifacts to an S3 bucket
  ///
  /// *   Write logs to Amazon CloudWatch Logs
  ///
  /// *   Publish metrics to Amazon CloudWatch
  ///
  ///
  /// You grant permissions for all of these tasks to an IAM role. To pass this
  /// role to Amazon SageMaker, the caller of this API must have the
  /// `iam:PassRole` permission. For more information, see
  /// [Amazon SageMaker Roles.](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html)
  ///
  /// [inputConfig]: Provides information about the location of input model
  /// artifacts, the name and shape of the expected data inputs, and the
  /// framework in which the model was trained.
  ///
  /// [outputConfig]: Provides information about the output location for the
  /// compiled model and the target device the model runs on.
  ///
  /// [stoppingCondition]: Specifies a limit to how long a model compilation job
  /// can run. When the job reaches the time limit, Amazon SageMaker ends the
  /// compilation job. Use this API to cap model training costs.
  Future<CreateCompilationJobResponse> createCompilationJob(
      {@required String compilationJobName,
      @required String roleArn,
      @required InputConfig inputConfig,
      @required OutputConfig outputConfig,
      @required StoppingCondition stoppingCondition}) async {
    var response_ = await _client.send('CreateCompilationJob', {
      'CompilationJobName': compilationJobName,
      'RoleArn': roleArn,
      'InputConfig': inputConfig,
      'OutputConfig': outputConfig,
      'StoppingCondition': stoppingCondition,
    });
    return CreateCompilationJobResponse.fromJson(response_);
  }

  /// Creates an endpoint using the endpoint configuration specified in the
  /// request. Amazon SageMaker uses the endpoint to provision resources and
  /// deploy models. You create the endpoint configuration with the
  /// [CreateEndpointConfig](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpointConfig.html)
  /// API.
  ///
  ///   Use this API only for hosting models using Amazon SageMaker hosting
  /// services.
  ///
  ///  You must not delete an `EndpointConfig` in use by an endpoint that is
  /// live or while the `UpdateEndpoint` or `CreateEndpoint` operations are
  /// being performed on the endpoint. To update an endpoint, you must create a
  /// new `EndpointConfig`.
  ///
  /// The endpoint name must be unique within an AWS Region in your AWS account.
  ///
  /// When it receives the request, Amazon SageMaker creates the endpoint,
  /// launches the resources (ML compute instances), and deploys the model(s) on
  /// them.
  ///
  /// When Amazon SageMaker receives the request, it sets the endpoint status to
  /// `Creating`. After it creates the endpoint, it sets the status to
  /// `InService`. Amazon SageMaker can then process incoming requests for
  /// inferences. To check the status of an endpoint, use the
  /// [DescribeEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_DescribeEndpoint.html)
  /// API.
  ///
  /// For an example, see
  /// [Exercise 1: Using the K-Means Algorithm Provided by Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/ex1.html).
  ///
  /// If any of the models hosted at this endpoint get model data from an Amazon
  /// S3 location, Amazon SageMaker uses AWS Security Token Service to download
  /// model artifacts from the S3 path you provided. AWS STS is activated in
  /// your IAM user account by default. If you previously deactivated AWS STS
  /// for a region, you need to reactivate AWS STS for that region. For more
  /// information, see
  /// [Activating and Deactivating AWS STS i an AWS Region](IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide_.
  ///
  /// [endpointName]: The name of the endpoint. The name must be unique within
  /// an AWS Region in your AWS account.
  ///
  /// [endpointConfigName]: The name of an endpoint configuration. For more
  /// information, see
  /// [CreateEndpointConfig](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpointConfig.html).
  ///
  /// [tags]: An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)in
  /// the _AWS Billing and Cost Management User Guide_.
  Future<CreateEndpointOutput> createEndpoint(
      {@required String endpointName,
      @required String endpointConfigName,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateEndpoint', {
      'EndpointName': endpointName,
      'EndpointConfigName': endpointConfigName,
      if (tags != null) 'Tags': tags,
    });
    return CreateEndpointOutput.fromJson(response_);
  }

  /// Creates an endpoint configuration that Amazon SageMaker hosting services
  /// uses to deploy models. In the configuration, you identify one or more
  /// models, created using the `CreateModel` API, to deploy and the resources
  /// that you want Amazon SageMaker to provision. Then you call the
  /// [CreateEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html)
  /// API.
  ///
  ///   Use this API only if you want to use Amazon SageMaker hosting services
  /// to deploy models into production.
  ///
  /// In the request, you define one or more `ProductionVariant`s, each of which
  /// identifies a model. Each `ProductionVariant` parameter also describes the
  /// resources that you want Amazon SageMaker to provision. This includes the
  /// number and type of ML compute instances to deploy.
  ///
  /// If you are hosting multiple models, you also assign a `VariantWeight` to
  /// specify how much traffic you want to allocate to each model. For example,
  /// suppose that you want to host two models, A and B, and you assign traffic
  /// weight 2 for model A and 1 for model B. Amazon SageMaker distributes
  /// two-thirds of the traffic to Model A, and one-third to model B.
  ///
  /// [endpointConfigName]: The name of the endpoint configuration. You specify
  /// this name in a
  /// [CreateEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html)
  /// request.
  ///
  /// [productionVariants]: An list of `ProductionVariant` objects, one for each
  /// model that you want to host at this endpoint.
  ///
  /// [tags]: A list of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the  _AWS Billing and Cost Management User Guide_.
  ///
  /// [kmsKeyId]: The Amazon Resource Name (ARN) of a AWS Key Management Service
  /// key that Amazon SageMaker uses to encrypt data on the storage volume
  /// attached to the ML compute instance that hosts the endpoint.
  Future<CreateEndpointConfigOutput> createEndpointConfig(
      {@required String endpointConfigName,
      @required List<ProductionVariant> productionVariants,
      List<Tag> tags,
      String kmsKeyId}) async {
    var response_ = await _client.send('CreateEndpointConfig', {
      'EndpointConfigName': endpointConfigName,
      'ProductionVariants': productionVariants,
      if (tags != null) 'Tags': tags,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    });
    return CreateEndpointConfigOutput.fromJson(response_);
  }

  /// Starts a hyperparameter tuning job. A hyperparameter tuning job finds the
  /// best version of a model by running many training jobs on your dataset
  /// using the algorithm you choose and values for hyperparameters within
  /// ranges that you specify. It then chooses the hyperparameter values that
  /// result in a model that performs the best, as measured by an objective
  /// metric that you choose.
  ///
  /// [hyperParameterTuningJobName]: The name of the tuning job. This name is
  /// the prefix for the names of all training jobs that this tuning job
  /// launches. The name must be unique within the same AWS account and AWS
  /// Region. The name must have { } to { } characters. Valid characters are
  /// a-z, A-Z, 0-9, and : + = @ _ % - (hyphen). The name is not case sensitive.
  ///
  /// [hyperParameterTuningJobConfig]: The HyperParameterTuningJobConfig object
  /// that describes the tuning job, including the search strategy, the
  /// objective metric used to evaluate training jobs, ranges of parameters to
  /// search, and resource limits for the tuning job. For more information, see
  /// automatic-model-tuning
  ///
  /// [trainingJobDefinition]: The HyperParameterTrainingJobDefinition object
  /// that describes the training jobs that this tuning job launches, including
  /// static hyperparameters, input data configuration, output data
  /// configuration, resource configuration, and stopping condition.
  ///
  /// [warmStartConfig]: Specifies the configuration for starting the
  /// hyperparameter tuning job using one or more previous tuning jobs as a
  /// starting point. The results of previous tuning jobs are used to inform
  /// which combinations of hyperparameters to search over in the new tuning
  /// job.
  ///
  /// All training jobs launched by the new hyperparameter tuning job are
  /// evaluated by using the objective metric. If you specify
  /// `IDENTICAL_DATA_AND_ALGORITHM` as the `WarmStartType` value for the warm
  /// start configuration, the training job that performs the best in the new
  /// tuning job is compared to the best training jobs from the parent tuning
  /// jobs. From these, the training job that performs the best as measured by
  /// the objective metric is returned as the overall best training job.
  ///
  ///
  ///
  /// All training jobs launched by parent hyperparameter tuning jobs and the
  /// new hyperparameter tuning jobs count against the limit of training jobs
  /// for the tuning job.
  ///
  /// [tags]: An array of key-value pairs. You can use tags to categorize your
  /// AWS resources in different ways, for example, by purpose, owner, or
  /// environment. For more information, see
  /// [AWS Tagging Strategies](https://docs.aws.amazon.com/https:/aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  ///
  /// Tags that you specify for the tuning job are also added to all training
  /// jobs that the tuning job launches.
  Future<CreateHyperParameterTuningJobResponse> createHyperParameterTuningJob(
      {@required String hyperParameterTuningJobName,
      @required HyperParameterTuningJobConfig hyperParameterTuningJobConfig,
      HyperParameterTrainingJobDefinition trainingJobDefinition,
      HyperParameterTuningJobWarmStartConfig warmStartConfig,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateHyperParameterTuningJob', {
      'HyperParameterTuningJobName': hyperParameterTuningJobName,
      'HyperParameterTuningJobConfig': hyperParameterTuningJobConfig,
      if (trainingJobDefinition != null)
        'TrainingJobDefinition': trainingJobDefinition,
      if (warmStartConfig != null) 'WarmStartConfig': warmStartConfig,
      if (tags != null) 'Tags': tags,
    });
    return CreateHyperParameterTuningJobResponse.fromJson(response_);
  }

  /// Creates a job that uses workers to label the data objects in your input
  /// dataset. You can use the labeled data to train machine learning models.
  ///
  /// You can select your workforce from one of three providers:
  ///
  /// *   A private workforce that you create. It can include employees,
  /// contractors, and outside experts. Use a private workforce when want the
  /// data to stay within your organization or when a specific set of skills is
  /// required.
  ///
  /// *   One or more vendors that you select from the AWS Marketplace. Vendors
  /// provide expertise in specific areas.
  ///
  /// *   The Amazon Mechanical Turk workforce. This is the largest workforce,
  /// but it should only be used for public data or data that has been stripped
  /// of any personally identifiable information.
  ///
  ///
  /// You can also use _automated data labeling_ to reduce the number of data
  /// objects that need to be labeled by a human. Automated data labeling uses
  /// _active learning_ to determine if a data object can be labeled by machine
  /// or if it needs to be sent to a human worker. For more information, see
  /// [Using Automated Data Labeling](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html).
  ///
  /// The data objects to be labeled are contained in an Amazon S3 bucket. You
  /// create a _manifest file_ that describes the location of each object. For
  /// more information, see
  /// [Using Input and Output Data](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html).
  ///
  /// The output can be used as the manifest file for another labeling job or as
  /// training data for your machine learning models.
  ///
  /// [labelingJobName]: The name of the labeling job. This name is used to
  /// identify the job in a list of labeling jobs.
  ///
  /// [labelAttributeName]: The attribute name to use for the label in the
  /// output manifest file. This is the key for the key/value pair formed with
  /// the label that a worker assigns to the object. The name can't end with
  /// "-metadata". If you are running a semantic segmentation labeling job, the
  /// attribute name must end with "-ref". If you are running any other kind of
  /// labeling job, the attribute name must not end with "-ref".
  ///
  /// [inputConfig]: Input data for the labeling job, such as the Amazon S3
  /// location of the data objects and the location of the manifest file that
  /// describes the data objects.
  ///
  /// [outputConfig]: The location of the output data and the AWS Key Management
  /// Service key ID for the key used to encrypt the output data, if any.
  ///
  /// [roleArn]: The Amazon Resource Number (ARN) that Amazon SageMaker assumes
  /// to perform tasks on your behalf during data labeling. You must grant this
  /// role the necessary permissions so that Amazon SageMaker can successfully
  /// complete data labeling.
  ///
  /// [labelCategoryConfigS3Uri]: The S3 URL of the file that defines the
  /// categories used to label the data objects.
  ///
  /// The file is a JSON structure in the following format:
  ///
  ///  `{`
  ///
  ///   `"document-version": "2018-11-28"`
  ///
  ///   `"labels": [`
  ///
  ///   `{`
  ///
  ///   `"label": "_label 1_"`
  ///
  ///   `},`
  ///
  ///   `{`
  ///
  ///   `"label": "_label 2_"`
  ///
  ///   `},`
  ///
  ///   `...`
  ///
  ///   `{`
  ///
  ///   `"label": "_label n_"`
  ///
  ///   `}`
  ///
  ///   `]`
  ///
  ///  `}`
  ///
  /// [stoppingConditions]: A set of conditions for stopping the labeling job.
  /// If any of the conditions are met, the job is automatically stopped. You
  /// can use these conditions to control the cost of data labeling.
  ///
  /// [labelingJobAlgorithmsConfig]: Configures the information required to
  /// perform automated data labeling.
  ///
  /// [humanTaskConfig]: Configures the information required for human workers
  /// to complete a labeling task.
  ///
  /// [tags]: An array of key/value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<CreateLabelingJobResponse> createLabelingJob(
      {@required String labelingJobName,
      @required String labelAttributeName,
      @required LabelingJobInputConfig inputConfig,
      @required LabelingJobOutputConfig outputConfig,
      @required String roleArn,
      String labelCategoryConfigS3Uri,
      LabelingJobStoppingConditions stoppingConditions,
      LabelingJobAlgorithmsConfig labelingJobAlgorithmsConfig,
      @required HumanTaskConfig humanTaskConfig,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateLabelingJob', {
      'LabelingJobName': labelingJobName,
      'LabelAttributeName': labelAttributeName,
      'InputConfig': inputConfig,
      'OutputConfig': outputConfig,
      'RoleArn': roleArn,
      if (labelCategoryConfigS3Uri != null)
        'LabelCategoryConfigS3Uri': labelCategoryConfigS3Uri,
      if (stoppingConditions != null) 'StoppingConditions': stoppingConditions,
      if (labelingJobAlgorithmsConfig != null)
        'LabelingJobAlgorithmsConfig': labelingJobAlgorithmsConfig,
      'HumanTaskConfig': humanTaskConfig,
      if (tags != null) 'Tags': tags,
    });
    return CreateLabelingJobResponse.fromJson(response_);
  }

  /// Creates a model in Amazon SageMaker. In the request, you name the model
  /// and describe a primary container. For the primary container, you specify
  /// the docker image containing inference code, artifacts (from prior
  /// training), and custom environment map that the inference code uses when
  /// you deploy the model for predictions.
  ///
  /// Use this API to create a model if you want to use Amazon SageMaker hosting
  /// services or run a batch transform job.
  ///
  /// To host your model, you create an endpoint configuration with the
  /// `CreateEndpointConfig` API, and then create an endpoint with the
  /// `CreateEndpoint` API. Amazon SageMaker then deploys all of the containers
  /// that you defined for the model in the hosting environment.
  ///
  /// To run a batch transform using your model, you start a job with the
  /// `CreateTransformJob` API. Amazon SageMaker uses your model and your
  /// dataset to get inferences which are then saved to a specified S3 location.
  ///
  /// In the `CreateModel` request, you must define a container with the
  /// `PrimaryContainer` parameter.
  ///
  /// In the request, you also provide an IAM role that Amazon SageMaker can
  /// assume to access model artifacts and docker image for deployment on ML
  /// compute hosting instances or for batch transform jobs. In addition, you
  /// also use the IAM role to manage permissions the inference code needs. For
  /// example, if the inference code access any other AWS resources, you grant
  /// necessary permissions via this role.
  ///
  /// [modelName]: The name of the new model.
  ///
  /// [primaryContainer]: The location of the primary docker image containing
  /// inference code, associated artifacts, and custom environment map that the
  /// inference code uses when the model is deployed for predictions.
  ///
  /// [containers]: Specifies the containers in the inference pipeline.
  ///
  /// [executionRoleArn]: The Amazon Resource Name (ARN) of the IAM role that
  /// Amazon SageMaker can assume to access model artifacts and docker image for
  /// deployment on ML compute instances or for batch transform jobs. Deploying
  /// on ML compute instances is part of model hosting. For more information,
  /// see
  /// [Amazon SageMaker Roles](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html).
  ///
  ///
  ///
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the `iam:PassRole` permission.
  ///
  /// [tags]: An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// [vpcConfig]: A
  /// [VpcConfig](https://docs.aws.amazon.com/sagemaker/latest/dg/API_VpcConfig.html)
  /// object that specifies the VPC that you want your model to connect to.
  /// Control access to and from your model container by configuring the VPC.
  /// `VpcConfig` is used in hosting services and in batch transform. For more
  /// information, see
  /// [Protect Endpoints by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html)
  /// and
  /// [Protect Data in Batch Transform Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-vpc.html).
  ///
  /// [enableNetworkIsolation]: Isolates the model container. No inbound or
  /// outbound network calls can be made to or from the model container.
  ///
  ///
  ///
  /// The Semantic Segmentation built-in algorithm does not support network
  /// isolation.
  Future<CreateModelOutput> createModel(
      {@required String modelName,
      ContainerDefinition primaryContainer,
      List<ContainerDefinition> containers,
      @required String executionRoleArn,
      List<Tag> tags,
      VpcConfig vpcConfig,
      bool enableNetworkIsolation}) async {
    var response_ = await _client.send('CreateModel', {
      'ModelName': modelName,
      if (primaryContainer != null) 'PrimaryContainer': primaryContainer,
      if (containers != null) 'Containers': containers,
      'ExecutionRoleArn': executionRoleArn,
      if (tags != null) 'Tags': tags,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
      if (enableNetworkIsolation != null)
        'EnableNetworkIsolation': enableNetworkIsolation,
    });
    return CreateModelOutput.fromJson(response_);
  }

  /// Creates a model package that you can use to create Amazon SageMaker models
  /// or list on AWS Marketplace. Buyers can subscribe to model packages listed
  /// on AWS Marketplace to create models in Amazon SageMaker.
  ///
  /// To create a model package by specifying a Docker container that contains
  /// your inference code and the Amazon S3 location of your model artifacts,
  /// provide values for `InferenceSpecification`. To create a model from an
  /// algorithm resource that you created or subscribed to in AWS Marketplace,
  /// provide a value for `SourceAlgorithmSpecification`.
  ///
  /// [modelPackageName]: The name of the model package. The name must have 1 to
  /// 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  ///
  /// [modelPackageDescription]: A description of the model package.
  ///
  /// [inferenceSpecification]: Specifies details about inference jobs that can
  /// be run with models based on this model package, including the following:
  ///
  /// *   The Amazon ECR paths of containers that contain the inference code and
  /// model artifacts.
  ///
  /// *   The instance types that the model package supports for transform jobs
  /// and real-time endpoints used for inference.
  ///
  /// *   The input and output content formats that the model package supports
  /// for inference.
  ///
  /// [validationSpecification]: Specifies configurations for one or more
  /// transform jobs that Amazon SageMaker runs to test the model package.
  ///
  /// [sourceAlgorithmSpecification]: Details about the algorithm that was used
  /// to create the model package.
  ///
  /// [certifyForMarketplace]: Whether to certify the model package for listing
  /// on AWS Marketplace.
  Future<CreateModelPackageOutput> createModelPackage(String modelPackageName,
      {String modelPackageDescription,
      InferenceSpecification inferenceSpecification,
      ModelPackageValidationSpecification validationSpecification,
      SourceAlgorithmSpecification sourceAlgorithmSpecification,
      bool certifyForMarketplace}) async {
    var response_ = await _client.send('CreateModelPackage', {
      'ModelPackageName': modelPackageName,
      if (modelPackageDescription != null)
        'ModelPackageDescription': modelPackageDescription,
      if (inferenceSpecification != null)
        'InferenceSpecification': inferenceSpecification,
      if (validationSpecification != null)
        'ValidationSpecification': validationSpecification,
      if (sourceAlgorithmSpecification != null)
        'SourceAlgorithmSpecification': sourceAlgorithmSpecification,
      if (certifyForMarketplace != null)
        'CertifyForMarketplace': certifyForMarketplace,
    });
    return CreateModelPackageOutput.fromJson(response_);
  }

  /// Creates an Amazon SageMaker notebook instance. A notebook instance is a
  /// machine learning (ML) compute instance running on a Jupyter notebook.
  ///
  /// In a `CreateNotebookInstance` request, specify the type of ML compute
  /// instance that you want to run. Amazon SageMaker launches the instance,
  /// installs common libraries that you can use to explore datasets for model
  /// training, and attaches an ML storage volume to the notebook instance.
  ///
  /// Amazon SageMaker also provides a set of example notebooks. Each notebook
  /// demonstrates how to use Amazon SageMaker with a specific algorithm or with
  /// a machine learning framework.
  ///
  /// After receiving the request, Amazon SageMaker does the following:
  ///
  /// 1.  Creates a network interface in the Amazon SageMaker VPC.
  ///
  /// 2.  (Option) If you specified `SubnetId`, Amazon SageMaker creates a
  /// network interface in your own VPC, which is inferred from the subnet ID
  /// that you provide in the input. When creating this network interface,
  /// Amazon SageMaker attaches the security group that you specified in the
  /// request to the network interface that it creates in your VPC.
  ///
  /// 3.  Launches an EC2 instance of the type specified in the request in the
  /// Amazon SageMaker VPC. If you specified `SubnetId` of your VPC, Amazon
  /// SageMaker specifies both network interfaces when launching this instance.
  /// This enables inbound traffic from your own VPC to the notebook instance,
  /// assuming that the security groups allow it.
  ///
  ///
  /// After creating the notebook instance, Amazon SageMaker returns its Amazon
  /// Resource Name (ARN). You can't change the name of a notebook instance
  /// after you create it.
  ///
  /// After Amazon SageMaker creates the notebook instance, you can connect to
  /// the Jupyter server and work in Jupyter notebooks. For example, you can
  /// write code to explore a dataset that you can use for model training, train
  /// a model, host models by creating Amazon SageMaker endpoints, and validate
  /// hosted models.
  ///
  /// For more information, see
  /// [How It Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).
  ///
  /// [notebookInstanceName]: The name of the new notebook instance.
  ///
  /// [instanceType]: The type of ML compute instance to launch for the notebook
  /// instance.
  ///
  /// [subnetId]: The ID of the subnet in a VPC to which you would like to have
  /// a connectivity from your ML compute instance.
  ///
  /// [securityGroupIds]: The VPC security group IDs, in the form sg-xxxxxxxx.
  /// The security groups must be for the same VPC as specified in the subnet.
  ///
  /// [roleArn]:  When you send any requests to AWS resources from the notebook
  /// instance, Amazon SageMaker assumes this role to perform tasks on your
  /// behalf. You must grant this role necessary permissions so Amazon SageMaker
  /// can perform these tasks. The policy must allow the Amazon SageMaker
  /// service principal (sagemaker.amazonaws.com) permissionsto to assume this
  /// role. For more information, see
  /// [Amazon SageMaker Roles](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html).
  ///
  ///
  ///
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the `iam:PassRole` permission.
  ///
  /// [kmsKeyId]: The Amazon Resource Name (ARN) of a AWS Key Management Service
  /// key that Amazon SageMaker uses to encrypt data on the storage volume
  /// attached to your notebook instance. The KMS key you provide must be
  /// enabled. For information, see
  /// [Enabling and Disabling Keys](https://docs.aws.amazon.com/kms/latest/developerguide/enabling-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [tags]: A list of tags to associate with the notebook instance. You can
  /// add tags later by using the `CreateTags` API.
  ///
  /// [lifecycleConfigName]: The name of a lifecycle configuration to associate
  /// with the notebook instance. For information about lifestyle
  /// configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  ///
  /// [directInternetAccess]: Sets whether Amazon SageMaker provides internet
  /// access to the notebook instance. If you set this to `Disabled` this
  /// notebook instance will be able to access resources only in your VPC, and
  /// will not be able to connect to Amazon SageMaker training and endpoint
  /// services unless your configure a NAT Gateway in your VPC.
  ///
  /// For more information, see
  /// [Notebook Instances Are Internet-Enabled by Default](https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access).
  /// You can set the value of this parameter to `Disabled` only if you set a
  /// value for the `SubnetId` parameter.
  ///
  /// [volumeSizeInGB]: The size, in GB, of the ML storage volume to attach to
  /// the notebook instance. The default value is 5 GB.
  ///
  /// [acceleratorTypes]: A list of Elastic Inference (EI) instance types to
  /// associate with this notebook instance. Currently, only one instance type
  /// can be associated with a notebook instance. For more information, see
  /// [Using Elastic Inference in Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html).
  ///
  /// [defaultCodeRepository]: A Git repository to associate with the notebook
  /// instance as its default code repository. This can be either the name of a
  /// Git repository stored as a resource in your account, or the URL of a Git
  /// repository in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. When you open a notebook instance, it
  /// opens in the directory that contains this repository. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  ///
  /// [additionalCodeRepositories]: An array of up to three Git repositories to
  /// associate with the notebook instance. These can be either the names of Git
  /// repositories stored as resources in your account, or the URL of Git
  /// repositories in [AWS CodeCommit](codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. These repositories are cloned at the same
  /// level as the default repository of your notebook instance. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  ///
  /// [rootAccess]: Whether root access is enabled or disabled for users of the
  /// notebook instance. The default value is `Enabled`.
  ///
  ///
  ///
  /// Lifecycle configurations need root access to be able to set up a notebook
  /// instance. Because of this, lifecycle configurations associated with a
  /// notebook instance always run with root access even if you disable root
  /// access for users.
  Future<CreateNotebookInstanceOutput> createNotebookInstance(
      {@required String notebookInstanceName,
      @required String instanceType,
      String subnetId,
      List<String> securityGroupIds,
      @required String roleArn,
      String kmsKeyId,
      List<Tag> tags,
      String lifecycleConfigName,
      String directInternetAccess,
      int volumeSizeInGB,
      List<String> acceleratorTypes,
      String defaultCodeRepository,
      List<String> additionalCodeRepositories,
      String rootAccess}) async {
    var response_ = await _client.send('CreateNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
      'InstanceType': instanceType,
      if (subnetId != null) 'SubnetId': subnetId,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      'RoleArn': roleArn,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (tags != null) 'Tags': tags,
      if (lifecycleConfigName != null)
        'LifecycleConfigName': lifecycleConfigName,
      if (directInternetAccess != null)
        'DirectInternetAccess': directInternetAccess,
      if (volumeSizeInGB != null) 'VolumeSizeInGB': volumeSizeInGB,
      if (acceleratorTypes != null) 'AcceleratorTypes': acceleratorTypes,
      if (defaultCodeRepository != null)
        'DefaultCodeRepository': defaultCodeRepository,
      if (additionalCodeRepositories != null)
        'AdditionalCodeRepositories': additionalCodeRepositories,
      if (rootAccess != null) 'RootAccess': rootAccess,
    });
    return CreateNotebookInstanceOutput.fromJson(response_);
  }

  /// Creates a lifecycle configuration that you can associate with a notebook
  /// instance. A _lifecycle configuration_ is a collection of shell scripts
  /// that run when you create or start a notebook instance.
  ///
  /// Each lifecycle configuration script has a limit of 16384 characters.
  ///
  /// The value of the `$PATH` environment variable that is available to both
  /// scripts is `/sbin:bin:/usr/sbin:/usr/bin`.
  ///
  /// View CloudWatch Logs for notebook instance lifecycle configurations in log
  /// group `/aws/sagemaker/NotebookInstances` in log stream
  /// `[notebook-instance-name]/[LifecycleConfigHook]`.
  ///
  /// Lifecycle configuration scripts cannot run for longer than 5 minutes. If a
  /// script runs for longer than 5 minutes, it fails and the notebook instance
  /// is not created or started.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  ///
  /// [notebookInstanceLifecycleConfigName]: The name of the lifecycle
  /// configuration.
  ///
  /// [onCreate]: A shell script that runs only once, when you create a notebook
  /// instance. The shell script must be a base64-encoded string.
  ///
  /// [onStart]: A shell script that runs every time you start a notebook
  /// instance, including when you create the notebook instance. The shell
  /// script must be a base64-encoded string.
  Future<CreateNotebookInstanceLifecycleConfigOutput>
      createNotebookInstanceLifecycleConfig(
          String notebookInstanceLifecycleConfigName,
          {List<NotebookInstanceLifecycleHook> onCreate,
          List<NotebookInstanceLifecycleHook> onStart}) async {
    var response_ =
        await _client.send('CreateNotebookInstanceLifecycleConfig', {
      'NotebookInstanceLifecycleConfigName':
          notebookInstanceLifecycleConfigName,
      if (onCreate != null) 'OnCreate': onCreate,
      if (onStart != null) 'OnStart': onStart,
    });
    return CreateNotebookInstanceLifecycleConfigOutput.fromJson(response_);
  }

  /// Returns a URL that you can use to connect to the Jupyter server from a
  /// notebook instance. In the Amazon SageMaker console, when you choose `Open`
  /// next to a notebook instance, Amazon SageMaker opens a new tab showing the
  /// Jupyter server home page from the notebook instance. The console uses this
  /// API to get the URL and show the page.
  ///
  /// IAM authorization policies for this API are also enforced for every HTTP
  /// request and WebSocket frame that attempts to connect to the notebook
  /// instance.For example, you can restrict access to this API and to the URL
  /// that it returns to a list of IP addresses that you specify. Use the
  /// `NotIpAddress` condition operator and the `aws:SourceIP` condition context
  /// key to specify the list of IP addresses that you want to have access to
  /// the notebook instance. For more information, see
  /// [Limit Access to a Notebook Instance by IP Address](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-ip-filter.html).
  ///
  ///
  ///
  /// The URL that you get from a call to is valid only for 5 minutes. If you
  /// try to use the URL after the 5-minute limit expires, you are directed to
  /// the AWS console sign-in page.
  ///
  /// [notebookInstanceName]: The name of the notebook instance.
  ///
  /// [sessionExpirationDurationInSeconds]: The duration of the session, in
  /// seconds. The default is 12 hours.
  Future<CreatePresignedNotebookInstanceUrlOutput>
      createPresignedNotebookInstanceUrl(String notebookInstanceName,
          {int sessionExpirationDurationInSeconds}) async {
    var response_ = await _client.send('CreatePresignedNotebookInstanceUrl', {
      'NotebookInstanceName': notebookInstanceName,
      if (sessionExpirationDurationInSeconds != null)
        'SessionExpirationDurationInSeconds':
            sessionExpirationDurationInSeconds,
    });
    return CreatePresignedNotebookInstanceUrlOutput.fromJson(response_);
  }

  /// Starts a model training job. After training completes, Amazon SageMaker
  /// saves the resulting model artifacts to an Amazon S3 location that you
  /// specify.
  ///
  /// If you choose to host your model using Amazon SageMaker hosting services,
  /// you can use the resulting model artifacts as part of the model. You can
  /// also use the artifacts in a machine learning service other than Amazon
  /// SageMaker, provided that you know how to use them for inferences.
  ///
  /// In the request body, you provide the following:
  ///
  /// *    `AlgorithmSpecification` - Identifies the training algorithm to use.
  ///
  /// *    `HyperParameters` - Specify these algorithm-specific parameters to
  /// enable the estimation of model parameters during training. Hyperparameters
  /// can be tuned to optimize this learning process. For a list of
  /// hyperparameters for each training algorithm provided by Amazon SageMaker,
  /// see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  ///
  /// *    `InputDataConfig` - Describes the training dataset and the Amazon S3,
  /// EFS, or FSx location where it is stored.
  ///
  /// *    `OutputDataConfig` - Identifies the Amazon S3 bucket where you want
  /// Amazon SageMaker to save the results of model training.
  ///
  /// *    `ResourceConfig` - Identifies the resources, ML compute instances,
  /// and ML storage volumes to deploy for model training. In distributed
  /// training, you specify more than one instance.
  ///
  /// *    `EnableManagedSpotTraining` - Optimize the cost of training machine
  /// learning models by up to 80% by using Amazon EC2 Spot instances. For more
  /// information, see
  /// [Managed Spot Training](https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html).
  ///
  /// *    `RoleARN` - The Amazon Resource Number (ARN) that Amazon SageMaker
  /// assumes to perform tasks on your behalf during model training. You must
  /// grant this role the necessary permissions so that Amazon SageMaker can
  /// successfully complete model training.
  ///
  /// *    `StoppingCondition` - To help cap training costs, use
  /// `MaxRuntimeInSeconds` to set a time limit for training. Use
  /// `MaxWaitTimeInSeconds` to specify how long you are willing to to wait for
  /// a managed spot training job to complete.
  ///
  ///
  ///  For more information about Amazon SageMaker, see
  /// [How It Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).
  ///
  /// [trainingJobName]: The name of the training job. The name must be unique
  /// within an AWS Region in an AWS account.
  ///
  /// [hyperParameters]: Algorithm-specific parameters that influence the
  /// quality of the model. You set hyperparameters before you start the
  /// learning process. For a list of hyperparameters for each training
  /// algorithm provided by Amazon SageMaker, see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  ///
  /// You can specify a maximum of 100 hyperparameters. Each hyperparameter is a
  /// key-value pair. Each key and value is limited to 256 characters, as
  /// specified by the `Length Constraint`.
  ///
  /// [algorithmSpecification]: The registry path of the Docker image that
  /// contains the training algorithm and algorithm-specific metadata, including
  /// the input mode. For more information about algorithms provided by Amazon
  /// SageMaker, see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  /// For information about providing your own algorithms, see
  /// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html).
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of an IAM role that Amazon
  /// SageMaker can assume to perform tasks on your behalf.
  ///
  /// During model training, Amazon SageMaker needs your permission to read
  /// input data from an S3 bucket, download a Docker image that contains
  /// training code, write model artifacts to an S3 bucket, write logs to Amazon
  /// CloudWatch Logs, and publish metrics to Amazon CloudWatch. You grant
  /// permissions for all of these tasks to an IAM role. For more information,
  /// see
  /// [Amazon SageMaker Roles](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html).
  ///
  ///
  ///
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the `iam:PassRole` permission.
  ///
  /// [inputDataConfig]: An array of `Channel` objects. Each channel is a named
  /// input source. `InputDataConfig` describes the input data and its location.
  ///
  /// Algorithms can accept input data from one or more channels. For example,
  /// an algorithm might have two channels of input data, `training_data` and
  /// `validation_data`. The configuration for each channel provides the S3,
  /// EFS, or FSx location where the input data is stored. It also provides
  /// information about the stored data: the MIME type, compression method, and
  /// whether the data is wrapped in RecordIO format.
  ///
  /// Depending on the input mode that the algorithm supports, Amazon SageMaker
  /// either copies input data files from an S3 bucket to a local directory in
  /// the Docker container, or makes it available as input streams. For example,
  /// if you specify an EFS location, input data files will be made available as
  /// input streams. They do not need to be downloaded.
  ///
  /// [outputDataConfig]: Specifies the path to the S3 location where you want
  /// to store model artifacts. Amazon SageMaker creates subfolders for the
  /// artifacts.
  ///
  /// [resourceConfig]: The resources, including the ML compute instances and ML
  /// storage volumes, to use for model training.
  ///
  /// ML storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use ML storage volumes for scratch space. If you
  /// want Amazon SageMaker to use the ML storage volume to store the training
  /// data, choose `File` as the `TrainingInputMode` in the algorithm
  /// specification. For distributed training algorithms, specify an instance
  /// count greater than 1.
  ///
  /// [vpcConfig]: A VpcConfig object that specifies the VPC that you want your
  /// training job to connect to. Control access to and from your training
  /// container by configuring the VPC. For more information, see
  /// [Protect Training Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html).
  ///
  /// [stoppingCondition]: Specifies a limit to how long a model training job
  /// can run. When the job reaches the time limit, Amazon SageMaker ends the
  /// training job. Use this API to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the `SIGTERM` signal,
  /// which delays job termination for 120 seconds. Algorithms can use this
  /// 120-second window to save the model artifacts, so the results of training
  /// are not lost.
  ///
  /// [tags]: An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// [enableNetworkIsolation]: Isolates the training container. No inbound or
  /// outbound network calls can be made, except for calls between peers within
  /// a training cluster for distributed training. If you enable network
  /// isolation for training jobs that are configured to use a VPC, Amazon
  /// SageMaker downloads and uploads customer data and model artifacts through
  /// the specified VPC, but the training container does not have network
  /// access.
  ///
  ///
  ///
  /// The Semantic Segmentation built-in algorithm does not support network
  /// isolation.
  ///
  /// [enableInterContainerTrafficEncryption]: To encrypt all communications
  /// between ML compute instances in distributed training, choose `True`.
  /// Encryption provides greater security for distributed training, but
  /// training might take longer. How long it takes depends on the amount of
  /// communication between compute instances, especially if you use a deep
  /// learning algorithm in distributed training. For more information, see
  /// [Protect Communications Between ML Compute Instances in a Distributed Training Job](https://docs.aws.amazon.com/sagemaker/latest/dg/train-encrypt.html).
  ///
  /// [enableManagedSpotTraining]: To train models using managed spot training,
  /// choose `True`. Managed spot training provides a fully managed and scalable
  /// infrastructure for training machine learning models. this option is useful
  /// when training jobs can be interrupted and when there is flexibility when
  /// the training job is run.
  ///
  /// The complete and intermediate results of jobs are stored in an Amazon S3
  /// bucket, and can be used as a starting point to train models incrementally.
  /// Amazon SageMaker provides metrics and logs in CloudWatch. They can be used
  /// to see when managed spot training jobs are running, interrupted, resumed,
  /// or completed.
  ///
  /// [checkpointConfig]: Contains information about the output location for
  /// managed spot training checkpoint data.
  Future<CreateTrainingJobResponse> createTrainingJob(
      {@required String trainingJobName,
      Map<String, String> hyperParameters,
      @required AlgorithmSpecification algorithmSpecification,
      @required String roleArn,
      List<Channel> inputDataConfig,
      @required OutputDataConfig outputDataConfig,
      @required ResourceConfig resourceConfig,
      VpcConfig vpcConfig,
      @required StoppingCondition stoppingCondition,
      List<Tag> tags,
      bool enableNetworkIsolation,
      bool enableInterContainerTrafficEncryption,
      bool enableManagedSpotTraining,
      CheckpointConfig checkpointConfig}) async {
    var response_ = await _client.send('CreateTrainingJob', {
      'TrainingJobName': trainingJobName,
      if (hyperParameters != null) 'HyperParameters': hyperParameters,
      'AlgorithmSpecification': algorithmSpecification,
      'RoleArn': roleArn,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      'OutputDataConfig': outputDataConfig,
      'ResourceConfig': resourceConfig,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
      'StoppingCondition': stoppingCondition,
      if (tags != null) 'Tags': tags,
      if (enableNetworkIsolation != null)
        'EnableNetworkIsolation': enableNetworkIsolation,
      if (enableInterContainerTrafficEncryption != null)
        'EnableInterContainerTrafficEncryption':
            enableInterContainerTrafficEncryption,
      if (enableManagedSpotTraining != null)
        'EnableManagedSpotTraining': enableManagedSpotTraining,
      if (checkpointConfig != null) 'CheckpointConfig': checkpointConfig,
    });
    return CreateTrainingJobResponse.fromJson(response_);
  }

  /// Starts a transform job. A transform job uses a trained model to get
  /// inferences on a dataset and saves these results to an Amazon S3 location
  /// that you specify.
  ///
  /// To perform batch transformations, you create a transform job and use the
  /// data that you have readily available.
  ///
  /// In the request body, you provide the following:
  ///
  /// *    `TransformJobName` - Identifies the transform job. The name must be
  /// unique within an AWS Region in an AWS account.
  ///
  /// *    `ModelName` - Identifies the model to use. `ModelName` must be the
  /// name of an existing Amazon SageMaker model in the same AWS Region and AWS
  /// account. For information on creating a model, see CreateModel.
  ///
  /// *    `TransformInput` - Describes the dataset to be transformed and the
  /// Amazon S3 location where it is stored.
  ///
  /// *    `TransformOutput` - Identifies the Amazon S3 location where you want
  /// Amazon SageMaker to save the results from the transform job.
  ///
  /// *    `TransformResources` - Identifies the ML compute instances for the
  /// transform job.
  ///
  ///
  ///  For more information about how batch transformation works Amazon
  /// SageMaker, see
  /// [How It Works](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html).
  ///
  /// [transformJobName]: The name of the transform job. The name must be unique
  /// within an AWS Region in an AWS account.
  ///
  /// [modelName]: The name of the model that you want to use for the transform
  /// job. `ModelName` must be the name of an existing Amazon SageMaker model
  /// within an AWS Region in an AWS account.
  ///
  /// [maxConcurrentTransforms]: The maximum number of parallel requests that
  /// can be sent to each instance in a transform job. If
  /// `MaxConcurrentTransforms` is set to `0` or left unset, Amazon SageMaker
  /// checks the optional execution-parameters to determine the optimal settings
  /// for your chosen algorithm. If the execution-parameters endpoint is not
  /// enabled, the default value is `1`. For more information on
  /// execution-parameters, see
  /// [How Containers Serve Requests](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-batch-code.html#your-algorithms-batch-code-how-containe-serves-requests).
  /// For built-in algorithms, you don't need to set a value for
  /// `MaxConcurrentTransforms`.
  ///
  /// [maxPayloadInMB]: The maximum allowed size of the payload, in MB. A
  /// _payload_ is the data portion of a record (without metadata). The value in
  /// `MaxPayloadInMB` must be greater than, or equal to, the size of a single
  /// record. To estimate the size of a record in MB, divide the size of your
  /// dataset by the number of records. To ensure that the records fit within
  /// the maximum payload size, we recommend using a slightly larger value. The
  /// default value is `6` MB.
  ///
  /// For cases where the payload might be arbitrarily large and is transmitted
  /// using HTTP chunked encoding, set the value to `0`. This feature works only
  /// in supported algorithms. Currently, Amazon SageMaker built-in algorithms
  /// do not support HTTP chunked encoding.
  ///
  /// [batchStrategy]: Specifies the number of records to include in a
  /// mini-batch for an HTTP inference request. A _record_  _is a single unit of
  /// input data that inference can be made on. For example, a single line in a
  /// CSV file is a record._
  ///
  /// _
  ///
  /// To enable the batch strategy, you must set `SplitType` to `Line`,
  /// `RecordIO`, or `TFRecord`.
  ///
  /// To use only one record when making an HTTP invocation request to a
  /// container, set `BatchStrategy` to `SingleRecord` and `SplitType` to
  /// `Line`.
  ///
  /// To fit as many records in a mini-batch as can fit within the
  /// `MaxPayloadInMB` limit, set `BatchStrategy` to `MultiRecord` and
  /// `SplitType` to `Line`.
  ///
  /// _
  ///
  /// [environment]: The environment variables to set in the Docker container.
  /// We support up to 16 key and values entries in the map.
  ///
  /// [transformInput]: Describes the input source and the way the transform job
  /// consumes it.
  ///
  /// [transformOutput]: Describes the results of the transform job.
  ///
  /// [transformResources]: Describes the resources, including ML instance types
  /// and ML instance count, to use for the transform job.
  ///
  /// [dataProcessing]: The data structure used to specify the data to be used
  /// for inference in a batch transform job and to associate the data that is
  /// relevant to the prediction results in the output. The input filter
  /// provided allows you to exclude input data that is not needed for inference
  /// in a batch transform job. The output filter provided allows you to include
  /// input data relevant to interpreting the predictions in the output from the
  /// job. For more information, see
  /// [Associate Prediction Results with their Corresponding Input Records](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html).
  ///
  /// [tags]: (Optional) An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<CreateTransformJobResponse> createTransformJob(
      {@required String transformJobName,
      @required String modelName,
      int maxConcurrentTransforms,
      int maxPayloadInMB,
      String batchStrategy,
      Map<String, String> environment,
      @required TransformInput transformInput,
      @required TransformOutput transformOutput,
      @required TransformResources transformResources,
      DataProcessing dataProcessing,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateTransformJob', {
      'TransformJobName': transformJobName,
      'ModelName': modelName,
      if (maxConcurrentTransforms != null)
        'MaxConcurrentTransforms': maxConcurrentTransforms,
      if (maxPayloadInMB != null) 'MaxPayloadInMB': maxPayloadInMB,
      if (batchStrategy != null) 'BatchStrategy': batchStrategy,
      if (environment != null) 'Environment': environment,
      'TransformInput': transformInput,
      'TransformOutput': transformOutput,
      'TransformResources': transformResources,
      if (dataProcessing != null) 'DataProcessing': dataProcessing,
      if (tags != null) 'Tags': tags,
    });
    return CreateTransformJobResponse.fromJson(response_);
  }

  /// Creates a new work team for labeling your data. A work team is defined by
  /// one or more Amazon Cognito user pools. You must first create the user
  /// pools before you can create a work team.
  ///
  /// You cannot create more than 25 work teams in an account and region.
  ///
  /// [workteamName]: The name of the work team. Use this name to identify the
  /// work team.
  ///
  /// [memberDefinitions]: A list of `MemberDefinition` objects that contains
  /// objects that identify the Amazon Cognito user pool that makes up the work
  /// team. For more information, see
  /// [Amazon Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html).
  ///
  /// All of the `CognitoMemberDefinition` objects that make up the member
  /// definition must have the same `ClientId` and `UserPool` values.
  ///
  /// [description]: A description of the work team.
  ///
  /// [notificationConfiguration]: Configures notification of workers regarding
  /// available or expiring work items.
  ///
  /// [tags]: An array of key-value pairs.
  ///
  /// For more information, see
  /// [Resource Tag](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html)
  /// and
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the  _AWS Billing and Cost Management User Guide_.
  Future<CreateWorkteamResponse> createWorkteam(
      {@required String workteamName,
      @required List<MemberDefinition> memberDefinitions,
      @required String description,
      NotificationConfiguration notificationConfiguration,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateWorkteam', {
      'WorkteamName': workteamName,
      'MemberDefinitions': memberDefinitions,
      'Description': description,
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
      if (tags != null) 'Tags': tags,
    });
    return CreateWorkteamResponse.fromJson(response_);
  }

  /// Removes the specified algorithm from your account.
  ///
  /// [algorithmName]: The name of the algorithm to delete.
  Future<void> deleteAlgorithm(String algorithmName) async {
    await _client.send('DeleteAlgorithm', {
      'AlgorithmName': algorithmName,
    });
  }

  /// Deletes the specified Git repository from your account.
  ///
  /// [codeRepositoryName]: The name of the Git repository to delete.
  Future<void> deleteCodeRepository(String codeRepositoryName) async {
    await _client.send('DeleteCodeRepository', {
      'CodeRepositoryName': codeRepositoryName,
    });
  }

  /// Deletes an endpoint. Amazon SageMaker frees up all of the resources that
  /// were deployed when the endpoint was created.
  ///
  /// Amazon SageMaker retires any custom KMS key grants associated with the
  /// endpoint, meaning you don't need to use the
  /// [RevokeGrant](http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html)
  /// API call.
  ///
  /// [endpointName]: The name of the endpoint that you want to delete.
  Future<void> deleteEndpoint(String endpointName) async {
    await _client.send('DeleteEndpoint', {
      'EndpointName': endpointName,
    });
  }

  /// Deletes an endpoint configuration. The `DeleteEndpointConfig` API deletes
  /// only the specified configuration. It does not delete endpoints created
  /// using the configuration.
  ///
  /// [endpointConfigName]: The name of the endpoint configuration that you want
  /// to delete.
  Future<void> deleteEndpointConfig(String endpointConfigName) async {
    await _client.send('DeleteEndpointConfig', {
      'EndpointConfigName': endpointConfigName,
    });
  }

  /// Deletes a model. The `DeleteModel` API deletes only the model entry that
  /// was created in Amazon SageMaker when you called the
  /// [CreateModel](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateModel.html)
  /// API. It does not delete model artifacts, inference code, or the IAM role
  /// that you specified when creating the model.
  ///
  /// [modelName]: The name of the model to delete.
  Future<void> deleteModel(String modelName) async {
    await _client.send('DeleteModel', {
      'ModelName': modelName,
    });
  }

  /// Deletes a model package.
  ///
  /// A model package is used to create Amazon SageMaker models or list on AWS
  /// Marketplace. Buyers can subscribe to model packages listed on AWS
  /// Marketplace to create models in Amazon SageMaker.
  ///
  /// [modelPackageName]: The name of the model package. The name must have 1 to
  /// 63 characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  Future<void> deleteModelPackage(String modelPackageName) async {
    await _client.send('DeleteModelPackage', {
      'ModelPackageName': modelPackageName,
    });
  }

  ///  Deletes an Amazon SageMaker notebook instance. Before you can delete a
  /// notebook instance, you must call the `StopNotebookInstance` API.
  ///
  ///
  ///
  /// When you delete a notebook instance, you lose all of your data. Amazon
  /// SageMaker removes the ML compute instance, and deletes the ML storage
  /// volume and the network interface associated with the notebook instance.
  ///
  /// [notebookInstanceName]: The name of the Amazon SageMaker notebook instance
  /// to delete.
  Future<void> deleteNotebookInstance(String notebookInstanceName) async {
    await _client.send('DeleteNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
    });
  }

  /// Deletes a notebook instance lifecycle configuration.
  ///
  /// [notebookInstanceLifecycleConfigName]: The name of the lifecycle
  /// configuration to delete.
  Future<void> deleteNotebookInstanceLifecycleConfig(
      String notebookInstanceLifecycleConfigName) async {
    await _client.send('DeleteNotebookInstanceLifecycleConfig', {
      'NotebookInstanceLifecycleConfigName':
          notebookInstanceLifecycleConfigName,
    });
  }

  /// Deletes the specified tags from an Amazon SageMaker resource.
  ///
  /// To list a resource's tags, use the `ListTags` API.
  ///
  ///
  ///
  /// When you call this API to delete tags from a hyperparameter tuning job,
  /// the deleted tags are not removed from training jobs that the
  /// hyperparameter tuning job launched before you called this API.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// you want to delete.
  ///
  /// [tagKeys]: An array or one or more tag keys to delete.
  Future<DeleteTagsOutput> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('DeleteTags', {
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    });
    return DeleteTagsOutput.fromJson(response_);
  }

  /// Deletes an existing work team. This operation can't be undone.
  ///
  /// [workteamName]: The name of the work team to delete.
  Future<DeleteWorkteamResponse> deleteWorkteam(String workteamName) async {
    var response_ = await _client.send('DeleteWorkteam', {
      'WorkteamName': workteamName,
    });
    return DeleteWorkteamResponse.fromJson(response_);
  }

  /// Returns a description of the specified algorithm that is in your account.
  ///
  /// [algorithmName]: The name of the algorithm to describe.
  Future<DescribeAlgorithmOutput> describeAlgorithm(
      String algorithmName) async {
    var response_ = await _client.send('DescribeAlgorithm', {
      'AlgorithmName': algorithmName,
    });
    return DescribeAlgorithmOutput.fromJson(response_);
  }

  /// Gets details about the specified Git repository.
  ///
  /// [codeRepositoryName]: The name of the Git repository to describe.
  Future<DescribeCodeRepositoryOutput> describeCodeRepository(
      String codeRepositoryName) async {
    var response_ = await _client.send('DescribeCodeRepository', {
      'CodeRepositoryName': codeRepositoryName,
    });
    return DescribeCodeRepositoryOutput.fromJson(response_);
  }

  /// Returns information about a model compilation job.
  ///
  /// To create a model compilation job, use CreateCompilationJob. To get
  /// information about multiple model compilation jobs, use
  /// ListCompilationJobs.
  ///
  /// [compilationJobName]: The name of the model compilation job that you want
  /// information about.
  Future<DescribeCompilationJobResponse> describeCompilationJob(
      String compilationJobName) async {
    var response_ = await _client.send('DescribeCompilationJob', {
      'CompilationJobName': compilationJobName,
    });
    return DescribeCompilationJobResponse.fromJson(response_);
  }

  /// Returns the description of an endpoint.
  ///
  /// [endpointName]: The name of the endpoint.
  Future<DescribeEndpointOutput> describeEndpoint(String endpointName) async {
    var response_ = await _client.send('DescribeEndpoint', {
      'EndpointName': endpointName,
    });
    return DescribeEndpointOutput.fromJson(response_);
  }

  /// Returns the description of an endpoint configuration created using the
  /// `CreateEndpointConfig` API.
  ///
  /// [endpointConfigName]: The name of the endpoint configuration.
  Future<DescribeEndpointConfigOutput> describeEndpointConfig(
      String endpointConfigName) async {
    var response_ = await _client.send('DescribeEndpointConfig', {
      'EndpointConfigName': endpointConfigName,
    });
    return DescribeEndpointConfigOutput.fromJson(response_);
  }

  /// Gets a description of a hyperparameter tuning job.
  ///
  /// [hyperParameterTuningJobName]: The name of the tuning job to describe.
  Future<DescribeHyperParameterTuningJobResponse>
      describeHyperParameterTuningJob(
          String hyperParameterTuningJobName) async {
    var response_ = await _client.send('DescribeHyperParameterTuningJob', {
      'HyperParameterTuningJobName': hyperParameterTuningJobName,
    });
    return DescribeHyperParameterTuningJobResponse.fromJson(response_);
  }

  /// Gets information about a labeling job.
  ///
  /// [labelingJobName]: The name of the labeling job to return information for.
  Future<DescribeLabelingJobResponse> describeLabelingJob(
      String labelingJobName) async {
    var response_ = await _client.send('DescribeLabelingJob', {
      'LabelingJobName': labelingJobName,
    });
    return DescribeLabelingJobResponse.fromJson(response_);
  }

  /// Describes a model that you created using the `CreateModel` API.
  ///
  /// [modelName]: The name of the model.
  Future<DescribeModelOutput> describeModel(String modelName) async {
    var response_ = await _client.send('DescribeModel', {
      'ModelName': modelName,
    });
    return DescribeModelOutput.fromJson(response_);
  }

  /// Returns a description of the specified model package, which is used to
  /// create Amazon SageMaker models or list them on AWS Marketplace.
  ///
  /// To create models in Amazon SageMaker, buyers can subscribe to model
  /// packages listed on AWS Marketplace.
  ///
  /// [modelPackageName]: The name of the model package to describe.
  Future<DescribeModelPackageOutput> describeModelPackage(
      String modelPackageName) async {
    var response_ = await _client.send('DescribeModelPackage', {
      'ModelPackageName': modelPackageName,
    });
    return DescribeModelPackageOutput.fromJson(response_);
  }

  /// Returns information about a notebook instance.
  ///
  /// [notebookInstanceName]: The name of the notebook instance that you want
  /// information about.
  Future<DescribeNotebookInstanceOutput> describeNotebookInstance(
      String notebookInstanceName) async {
    var response_ = await _client.send('DescribeNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
    });
    return DescribeNotebookInstanceOutput.fromJson(response_);
  }

  /// Returns a description of a notebook instance lifecycle configuration.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  ///
  /// [notebookInstanceLifecycleConfigName]: The name of the lifecycle
  /// configuration to describe.
  Future<DescribeNotebookInstanceLifecycleConfigOutput>
      describeNotebookInstanceLifecycleConfig(
          String notebookInstanceLifecycleConfigName) async {
    var response_ =
        await _client.send('DescribeNotebookInstanceLifecycleConfig', {
      'NotebookInstanceLifecycleConfigName':
          notebookInstanceLifecycleConfigName,
    });
    return DescribeNotebookInstanceLifecycleConfigOutput.fromJson(response_);
  }

  /// Gets information about a work team provided by a vendor. It returns
  /// details about the subscription with a vendor in the AWS Marketplace.
  ///
  /// [workteamArn]: The Amazon Resource Name (ARN) of the subscribed work team
  /// to describe.
  Future<DescribeSubscribedWorkteamResponse> describeSubscribedWorkteam(
      String workteamArn) async {
    var response_ = await _client.send('DescribeSubscribedWorkteam', {
      'WorkteamArn': workteamArn,
    });
    return DescribeSubscribedWorkteamResponse.fromJson(response_);
  }

  /// Returns information about a training job.
  ///
  /// [trainingJobName]: The name of the training job.
  Future<DescribeTrainingJobResponse> describeTrainingJob(
      String trainingJobName) async {
    var response_ = await _client.send('DescribeTrainingJob', {
      'TrainingJobName': trainingJobName,
    });
    return DescribeTrainingJobResponse.fromJson(response_);
  }

  /// Returns information about a transform job.
  ///
  /// [transformJobName]: The name of the transform job that you want to view
  /// details of.
  Future<DescribeTransformJobResponse> describeTransformJob(
      String transformJobName) async {
    var response_ = await _client.send('DescribeTransformJob', {
      'TransformJobName': transformJobName,
    });
    return DescribeTransformJobResponse.fromJson(response_);
  }

  /// Gets information about a specific work team. You can see information such
  /// as the create date, the last updated date, membership information, and the
  /// work team's Amazon Resource Name (ARN).
  ///
  /// [workteamName]: The name of the work team to return a description of.
  Future<DescribeWorkteamResponse> describeWorkteam(String workteamName) async {
    var response_ = await _client.send('DescribeWorkteam', {
      'WorkteamName': workteamName,
    });
    return DescribeWorkteamResponse.fromJson(response_);
  }

  /// An auto-complete API for the search functionality in the Amazon SageMaker
  /// console. It returns suggestions of possible matches for the property name
  /// to use in `Search` queries. Provides suggestions for `HyperParameters`,
  /// `Tags`, and `Metrics`.
  ///
  /// [resource]: The name of the Amazon SageMaker resource to Search for. The
  /// only valid `Resource` value is `TrainingJob`.
  ///
  /// [suggestionQuery]: Limits the property names that are included in the
  /// response.
  Future<GetSearchSuggestionsResponse> getSearchSuggestions(String resource,
      {SuggestionQuery suggestionQuery}) async {
    var response_ = await _client.send('GetSearchSuggestions', {
      'Resource': resource,
      if (suggestionQuery != null) 'SuggestionQuery': suggestionQuery,
    });
    return GetSearchSuggestionsResponse.fromJson(response_);
  }

  /// Lists the machine learning algorithms that have been created.
  ///
  /// [creationTimeAfter]: A filter that returns only algorithms created after
  /// the specified time (timestamp).
  ///
  /// [creationTimeBefore]: A filter that returns only algorithms created before
  /// the specified time (timestamp).
  ///
  /// [maxResults]: The maximum number of algorithms to return in the response.
  ///
  /// [nameContains]: A string in the algorithm name. This filter returns only
  /// algorithms whose name contains the specified string.
  ///
  /// [nextToken]: If the response to a previous `ListAlgorithms` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of algorithms, use the token in the next request.
  ///
  /// [sortBy]: The parameter by which to sort the results. The default is
  /// `CreationTime`.
  ///
  /// [sortOrder]: The sort order for the results. The default is `Ascending`.
  Future<ListAlgorithmsOutput> listAlgorithms(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListAlgorithms', {
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListAlgorithmsOutput.fromJson(response_);
  }

  /// Gets a list of the Git repositories in your account.
  ///
  /// [creationTimeAfter]: A filter that returns only Git repositories that were
  /// created after the specified time.
  ///
  /// [creationTimeBefore]: A filter that returns only Git repositories that
  /// were created before the specified time.
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only Git repositories that
  /// were last modified after the specified time.
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only Git repositories that
  /// were last modified before the specified time.
  ///
  /// [maxResults]: The maximum number of Git repositories to return in the
  /// response.
  ///
  /// [nameContains]: A string in the Git repositories name. This filter returns
  /// only repositories whose name contains the specified string.
  ///
  /// [nextToken]: If the result of a `ListCodeRepositoriesOutput` request was
  /// truncated, the response includes a `NextToken`. To get the next set of Git
  /// repositories, use the token in the next request.
  ///
  /// [sortBy]: The field to sort results by. The default is `Name`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  Future<ListCodeRepositoriesOutput> listCodeRepositories(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListCodeRepositories', {
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListCodeRepositoriesOutput.fromJson(response_);
  }

  /// Lists model compilation jobs that satisfy various filters.
  ///
  /// To create a model compilation job, use CreateCompilationJob. To get
  /// information about a particular model compilation job you have created, use
  /// DescribeCompilationJob.
  ///
  /// [nextToken]: If the result of the previous `ListCompilationJobs` request
  /// was truncated, the response includes a `NextToken`. To retrieve the next
  /// set of model compilation jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of model compilation jobs to return in
  /// the response.
  ///
  /// [creationTimeAfter]: A filter that returns the model compilation jobs that
  /// were created after a specified time.
  ///
  /// [creationTimeBefore]: A filter that returns the model compilation jobs
  /// that were created before a specified time.
  ///
  /// [lastModifiedTimeAfter]: A filter that returns the model compilation jobs
  /// that were modified after a specified time.
  ///
  /// [lastModifiedTimeBefore]: A filter that returns the model compilation jobs
  /// that were modified before a specified time.
  ///
  /// [nameContains]: A filter that returns the model compilation jobs whose
  /// name contains a specified string.
  ///
  /// [statusEquals]: A filter that retrieves model compilation jobs with a
  /// specific DescribeCompilationJobResponse$CompilationJobStatus status.
  ///
  /// [sortBy]: The field by which to sort results. The default is
  /// `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  Future<ListCompilationJobsResponse> listCompilationJobs(
      {String nextToken,
      int maxResults,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListCompilationJobs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (nameContains != null) 'NameContains': nameContains,
      if (statusEquals != null) 'StatusEquals': statusEquals,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListCompilationJobsResponse.fromJson(response_);
  }

  /// Lists endpoint configurations.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Descending`.
  ///
  /// [nextToken]: If the result of the previous `ListEndpointConfig` request
  /// was truncated, the response includes a `NextToken`. To retrieve the next
  /// set of endpoint configurations, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of training jobs to return in the
  /// response.
  ///
  /// [nameContains]: A string in the endpoint configuration name. This filter
  /// returns only endpoint configurations whose name contains the specified
  /// string.
  ///
  /// [creationTimeBefore]: A filter that returns only endpoint configurations
  /// created before the specified time (timestamp).
  ///
  /// [creationTimeAfter]: A filter that returns only endpoint configurations
  /// with a creation time greater than or equal to the specified time
  /// (timestamp).
  Future<ListEndpointConfigsOutput> listEndpointConfigs(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter}) async {
    var response_ = await _client.send('ListEndpointConfigs', {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
    });
    return ListEndpointConfigsOutput.fromJson(response_);
  }

  /// Lists endpoints.
  ///
  /// [sortBy]: Sorts the list of results. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Descending`.
  ///
  /// [nextToken]: If the result of a `ListEndpoints` request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of endpoints,
  /// use the token in the next request.
  ///
  /// [maxResults]: The maximum number of endpoints to return in the response.
  ///
  /// [nameContains]: A string in endpoint names. This filter returns only
  /// endpoints whose name contains the specified string.
  ///
  /// [creationTimeBefore]: A filter that returns only endpoints that were
  /// created before the specified time (timestamp).
  ///
  /// [creationTimeAfter]: A filter that returns only endpoints with a creation
  /// time greater than or equal to the specified time (timestamp).
  ///
  /// [lastModifiedTimeBefore]:  A filter that returns only endpoints that were
  /// modified before the specified timestamp.
  ///
  /// [lastModifiedTimeAfter]:  A filter that returns only endpoints that were
  /// modified after the specified timestamp.
  ///
  /// [statusEquals]:  A filter that returns only endpoints with the specified
  /// status.
  Future<ListEndpointsOutput> listEndpoints(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter,
      DateTime lastModifiedTimeBefore,
      DateTime lastModifiedTimeAfter,
      String statusEquals}) async {
    var response_ = await _client.send('ListEndpoints', {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (statusEquals != null) 'StatusEquals': statusEquals,
    });
    return ListEndpointsOutput.fromJson(response_);
  }

  /// Gets a list of HyperParameterTuningJobSummary objects that describe the
  /// hyperparameter tuning jobs launched in your account.
  ///
  /// [nextToken]: If the result of the previous `ListHyperParameterTuningJobs`
  /// request was truncated, the response includes a `NextToken`. To retrieve
  /// the next set of tuning jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of tuning jobs to return. The default
  /// value is 10.
  ///
  /// [sortBy]: The field to sort results by. The default is `Name`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  ///
  /// [nameContains]: A string in the tuning job name. This filter returns only
  /// tuning jobs whose name contains the specified string.
  ///
  /// [creationTimeAfter]: A filter that returns only tuning jobs that were
  /// created after the specified time.
  ///
  /// [creationTimeBefore]: A filter that returns only tuning jobs that were
  /// created before the specified time.
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only tuning jobs that were
  /// modified after the specified time.
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only tuning jobs that were
  /// modified before the specified time.
  ///
  /// [statusEquals]: A filter that returns only tuning jobs with the specified
  /// status.
  Future<ListHyperParameterTuningJobsResponse> listHyperParameterTuningJobs(
      {String nextToken,
      int maxResults,
      String sortBy,
      String sortOrder,
      String nameContains,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String statusEquals}) async {
    var response_ = await _client.send('ListHyperParameterTuningJobs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (statusEquals != null) 'StatusEquals': statusEquals,
    });
    return ListHyperParameterTuningJobsResponse.fromJson(response_);
  }

  /// Gets a list of labeling jobs.
  ///
  /// [creationTimeAfter]: A filter that returns only labeling jobs created
  /// after the specified time (timestamp).
  ///
  /// [creationTimeBefore]: A filter that returns only labeling jobs created
  /// before the specified time (timestamp).
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only labeling jobs modified
  /// after the specified time (timestamp).
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only labeling jobs
  /// modified before the specified time (timestamp).
  ///
  /// [maxResults]: The maximum number of labeling jobs to return in each page
  /// of the response.
  ///
  /// [nextToken]: If the result of the previous `ListLabelingJobs` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of labeling jobs, use the token in the next request.
  ///
  /// [nameContains]: A string in the labeling job name. This filter returns
  /// only labeling jobs whose name contains the specified string.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  ///
  /// [statusEquals]: A filter that retrieves only labeling jobs with a specific
  /// status.
  Future<ListLabelingJobsResponse> listLabelingJobs(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      int maxResults,
      String nextToken,
      String nameContains,
      String sortBy,
      String sortOrder,
      String statusEquals}) async {
    var response_ = await _client.send('ListLabelingJobs', {
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (nameContains != null) 'NameContains': nameContains,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (statusEquals != null) 'StatusEquals': statusEquals,
    });
    return ListLabelingJobsResponse.fromJson(response_);
  }

  /// Gets a list of labeling jobs assigned to a specified work team.
  ///
  /// [workteamArn]: The Amazon Resource Name (ARN) of the work team for which
  /// you want to see labeling jobs for.
  ///
  /// [maxResults]: The maximum number of labeling jobs to return in each page
  /// of the response.
  ///
  /// [nextToken]: If the result of the previous `ListLabelingJobsForWorkteam`
  /// request was truncated, the response includes a `NextToken`. To retrieve
  /// the next set of labeling jobs, use the token in the next request.
  ///
  /// [creationTimeAfter]: A filter that returns only labeling jobs created
  /// after the specified time (timestamp).
  ///
  /// [creationTimeBefore]: A filter that returns only labeling jobs created
  /// before the specified time (timestamp).
  ///
  /// [jobReferenceCodeContains]: A filter the limits jobs to only the ones
  /// whose job reference code contains the specified string.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  Future<ListLabelingJobsForWorkteamResponse> listLabelingJobsForWorkteam(
      String workteamArn,
      {int maxResults,
      String nextToken,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      String jobReferenceCodeContains,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListLabelingJobsForWorkteam', {
      'WorkteamArn': workteamArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (jobReferenceCodeContains != null)
        'JobReferenceCodeContains': jobReferenceCodeContains,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListLabelingJobsForWorkteamResponse.fromJson(response_);
  }

  /// Lists the model packages that have been created.
  ///
  /// [creationTimeAfter]: A filter that returns only model packages created
  /// after the specified time (timestamp).
  ///
  /// [creationTimeBefore]: A filter that returns only model packages created
  /// before the specified time (timestamp).
  ///
  /// [maxResults]: The maximum number of model packages to return in the
  /// response.
  ///
  /// [nameContains]: A string in the model package name. This filter returns
  /// only model packages whose name contains the specified string.
  ///
  /// [nextToken]: If the response to a previous `ListModelPackages` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of model packages, use the token in the next request.
  ///
  /// [sortBy]: The parameter by which to sort the results. The default is
  /// `CreationTime`.
  ///
  /// [sortOrder]: The sort order for the results. The default is `Ascending`.
  Future<ListModelPackagesOutput> listModelPackages(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListModelPackages', {
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListModelPackagesOutput.fromJson(response_);
  }

  /// Lists models created with the
  /// [CreateModel](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateModel.html)
  /// API.
  ///
  /// [sortBy]: Sorts the list of results. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Descending`.
  ///
  /// [nextToken]: If the response to a previous `ListModels` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of models, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of models to return in the response.
  ///
  /// [nameContains]: A string in the training job name. This filter returns
  /// only models in the training job whose name contains the specified string.
  ///
  /// [creationTimeBefore]: A filter that returns only models created before the
  /// specified time (timestamp).
  ///
  /// [creationTimeAfter]: A filter that returns only models with a creation
  /// time greater than or equal to the specified time (timestamp).
  Future<ListModelsOutput> listModels(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter}) async {
    var response_ = await _client.send('ListModels', {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
    });
    return ListModelsOutput.fromJson(response_);
  }

  /// Lists notebook instance lifestyle configurations created with the
  /// CreateNotebookInstanceLifecycleConfig API.
  ///
  /// [nextToken]: If the result of a `ListNotebookInstanceLifecycleConfigs`
  /// request was truncated, the response includes a `NextToken`. To get the
  /// next set of lifecycle configurations, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of lifecycle configurations to return in
  /// the response.
  ///
  /// [sortBy]: Sorts the list of results. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results.
  ///
  /// [nameContains]: A string in the lifecycle configuration name. This filter
  /// returns only lifecycle configurations whose name contains the specified
  /// string.
  ///
  /// [creationTimeBefore]: A filter that returns only lifecycle configurations
  /// that were created before the specified time (timestamp).
  ///
  /// [creationTimeAfter]: A filter that returns only lifecycle configurations
  /// that were created after the specified time (timestamp).
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only lifecycle
  /// configurations that were modified before the specified time (timestamp).
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only lifecycle
  /// configurations that were modified after the specified time (timestamp).
  Future<ListNotebookInstanceLifecycleConfigsOutput>
      listNotebookInstanceLifecycleConfigs(
          {String nextToken,
          int maxResults,
          String sortBy,
          String sortOrder,
          String nameContains,
          DateTime creationTimeBefore,
          DateTime creationTimeAfter,
          DateTime lastModifiedTimeBefore,
          DateTime lastModifiedTimeAfter}) async {
    var response_ = await _client.send('ListNotebookInstanceLifecycleConfigs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
    });
    return ListNotebookInstanceLifecycleConfigsOutput.fromJson(response_);
  }

  /// Returns a list of the Amazon SageMaker notebook instances in the
  /// requester's account in an AWS Region.
  ///
  /// [nextToken]:  If the previous call to the `ListNotebookInstances` is
  /// truncated, the response includes a `NextToken`. You can use this token in
  /// your subsequent `ListNotebookInstances` request to fetch the next set of
  /// notebook instances.
  ///
  ///
  ///
  /// You might specify a filter or a sort order in your request. When response
  /// is truncated, you must use the same values for the filer and sort order in
  /// the next request.
  ///
  /// [maxResults]: The maximum number of notebook instances to return.
  ///
  /// [sortBy]: The field to sort results by. The default is `Name`.
  ///
  /// [sortOrder]: The sort order for results.
  ///
  /// [nameContains]: A string in the notebook instances' name. This filter
  /// returns only notebook instances whose name contains the specified string.
  ///
  /// [creationTimeBefore]: A filter that returns only notebook instances that
  /// were created before the specified time (timestamp).
  ///
  /// [creationTimeAfter]: A filter that returns only notebook instances that
  /// were created after the specified time (timestamp).
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only notebook instances
  /// that were modified before the specified time (timestamp).
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only notebook instances
  /// that were modified after the specified time (timestamp).
  ///
  /// [statusEquals]: A filter that returns only notebook instances with the
  /// specified status.
  ///
  /// [notebookInstanceLifecycleConfigNameContains]: A string in the name of a
  /// notebook instances lifecycle configuration associated with this notebook
  /// instance. This filter returns only notebook instances associated with a
  /// lifecycle configuration with a name that contains the specified string.
  ///
  /// [defaultCodeRepositoryContains]: A string in the name or URL of a Git
  /// repository associated with this notebook instance. This filter returns
  /// only notebook instances associated with a git repository with a name that
  /// contains the specified string.
  ///
  /// [additionalCodeRepositoryEquals]: A filter that returns only notebook
  /// instances with associated with the specified git repository.
  Future<ListNotebookInstancesOutput> listNotebookInstances(
      {String nextToken,
      int maxResults,
      String sortBy,
      String sortOrder,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter,
      DateTime lastModifiedTimeBefore,
      DateTime lastModifiedTimeAfter,
      String statusEquals,
      String notebookInstanceLifecycleConfigNameContains,
      String defaultCodeRepositoryContains,
      String additionalCodeRepositoryEquals}) async {
    var response_ = await _client.send('ListNotebookInstances', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nameContains != null) 'NameContains': nameContains,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (statusEquals != null) 'StatusEquals': statusEquals,
      if (notebookInstanceLifecycleConfigNameContains != null)
        'NotebookInstanceLifecycleConfigNameContains':
            notebookInstanceLifecycleConfigNameContains,
      if (defaultCodeRepositoryContains != null)
        'DefaultCodeRepositoryContains': defaultCodeRepositoryContains,
      if (additionalCodeRepositoryEquals != null)
        'AdditionalCodeRepositoryEquals': additionalCodeRepositoryEquals,
    });
    return ListNotebookInstancesOutput.fromJson(response_);
  }

  /// Gets a list of the work teams that you are subscribed to in the AWS
  /// Marketplace. The list may be empty if no work team satisfies the filter
  /// specified in the `NameContains` parameter.
  ///
  /// [nameContains]: A string in the work team name. This filter returns only
  /// work teams whose name contains the specified string.
  ///
  /// [nextToken]: If the result of the previous `ListSubscribedWorkteams`
  /// request was truncated, the response includes a `NextToken`. To retrieve
  /// the next set of labeling jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of work teams to return in each page of
  /// the response.
  Future<ListSubscribedWorkteamsResponse> listSubscribedWorkteams(
      {String nameContains, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListSubscribedWorkteams', {
      if (nameContains != null) 'NameContains': nameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListSubscribedWorkteamsResponse.fromJson(response_);
  }

  /// Returns the tags for the specified Amazon SageMaker resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource whose tags
  /// you want to retrieve.
  ///
  /// [nextToken]:  If the response to the previous `ListTags` request is
  /// truncated, Amazon SageMaker returns this token. To retrieve the next set
  /// of tags, use it in the subsequent request.
  ///
  /// [maxResults]: Maximum number of tags to return.
  Future<ListTagsOutput> listTags(String resourceArn,
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListTags', {
      'ResourceArn': resourceArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTagsOutput.fromJson(response_);
  }

  /// Lists training jobs.
  ///
  /// [nextToken]: If the result of the previous `ListTrainingJobs` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of training jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of training jobs to return in the
  /// response.
  ///
  /// [creationTimeAfter]: A filter that returns only training jobs created
  /// after the specified time (timestamp).
  ///
  /// [creationTimeBefore]: A filter that returns only training jobs created
  /// before the specified time (timestamp).
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only training jobs modified
  /// after the specified time (timestamp).
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only training jobs
  /// modified before the specified time (timestamp).
  ///
  /// [nameContains]: A string in the training job name. This filter returns
  /// only training jobs whose name contains the specified string.
  ///
  /// [statusEquals]: A filter that retrieves only training jobs with a specific
  /// status.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  Future<ListTrainingJobsResponse> listTrainingJobs(
      {String nextToken,
      int maxResults,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder}) async {
    var response_ = await _client.send('ListTrainingJobs', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (nameContains != null) 'NameContains': nameContains,
      if (statusEquals != null) 'StatusEquals': statusEquals,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListTrainingJobsResponse.fromJson(response_);
  }

  /// Gets a list of TrainingJobSummary objects that describe the training jobs
  /// that a hyperparameter tuning job launched.
  ///
  /// [hyperParameterTuningJobName]: The name of the tuning job whose training
  /// jobs you want to list.
  ///
  /// [nextToken]: If the result of the previous
  /// `ListTrainingJobsForHyperParameterTuningJob` request was truncated, the
  /// response includes a `NextToken`. To retrieve the next set of training
  /// jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of training jobs to return. The default
  /// value is 10.
  ///
  /// [statusEquals]: A filter that returns only training jobs with the
  /// specified status.
  ///
  /// [sortBy]: The field to sort results by. The default is `Name`.
  ///
  /// If the value of this field is `FinalObjectiveMetricValue`, any training
  /// jobs that did not return an objective metric are not listed.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  Future<ListTrainingJobsForHyperParameterTuningJobResponse>
      listTrainingJobsForHyperParameterTuningJob(
          String hyperParameterTuningJobName,
          {String nextToken,
          int maxResults,
          String statusEquals,
          String sortBy,
          String sortOrder}) async {
    var response_ =
        await _client.send('ListTrainingJobsForHyperParameterTuningJob', {
      'HyperParameterTuningJobName': hyperParameterTuningJobName,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
      if (statusEquals != null) 'StatusEquals': statusEquals,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
    });
    return ListTrainingJobsForHyperParameterTuningJobResponse.fromJson(
        response_);
  }

  /// Lists transform jobs.
  ///
  /// [creationTimeAfter]: A filter that returns only transform jobs created
  /// after the specified time.
  ///
  /// [creationTimeBefore]: A filter that returns only transform jobs created
  /// before the specified time.
  ///
  /// [lastModifiedTimeAfter]: A filter that returns only transform jobs
  /// modified after the specified time.
  ///
  /// [lastModifiedTimeBefore]: A filter that returns only transform jobs
  /// modified before the specified time.
  ///
  /// [nameContains]: A string in the transform job name. This filter returns
  /// only transform jobs whose name contains the specified string.
  ///
  /// [statusEquals]: A filter that retrieves only transform jobs with a
  /// specific status.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Descending`.
  ///
  /// [nextToken]: If the result of the previous `ListTransformJobs` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of transform jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of transform jobs to return in the
  /// response. The default value is `10`.
  Future<ListTransformJobsResponse> listTransformJobs(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListTransformJobs', {
      if (creationTimeAfter != null) 'CreationTimeAfter': creationTimeAfter,
      if (creationTimeBefore != null) 'CreationTimeBefore': creationTimeBefore,
      if (lastModifiedTimeAfter != null)
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
      if (lastModifiedTimeBefore != null)
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
      if (nameContains != null) 'NameContains': nameContains,
      if (statusEquals != null) 'StatusEquals': statusEquals,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListTransformJobsResponse.fromJson(response_);
  }

  /// Gets a list of work teams that you have defined in a region. The list may
  /// be empty if no work team satisfies the filter specified in the
  /// `NameContains` parameter.
  ///
  /// [sortBy]: The field to sort results by. The default is `CreationTime`.
  ///
  /// [sortOrder]: The sort order for results. The default is `Ascending`.
  ///
  /// [nameContains]: A string in the work team's name. This filter returns only
  /// work teams whose name contains the specified string.
  ///
  /// [nextToken]: If the result of the previous `ListWorkteams` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of labeling jobs, use the token in the next request.
  ///
  /// [maxResults]: The maximum number of work teams to return in each page of
  /// the response.
  Future<ListWorkteamsResponse> listWorkteams(
      {String sortBy,
      String sortOrder,
      String nameContains,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('ListWorkteams', {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nameContains != null) 'NameContains': nameContains,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListWorkteamsResponse.fromJson(response_);
  }

  /// Renders the UI template so that you can preview the worker's experience.
  ///
  /// [uiTemplate]: A `Template` object containing the worker UI template to
  /// render.
  ///
  /// [task]: A `RenderableTask` object containing a representative task to
  /// render.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) that has access to the S3
  /// objects that are used by the template.
  Future<RenderUiTemplateResponse> renderUiTemplate(
      {@required UiTemplate uiTemplate,
      @required RenderableTask task,
      @required String roleArn}) async {
    var response_ = await _client.send('RenderUiTemplate', {
      'UiTemplate': uiTemplate,
      'Task': task,
      'RoleArn': roleArn,
    });
    return RenderUiTemplateResponse.fromJson(response_);
  }

  /// Finds Amazon SageMaker resources that match a search query. Matching
  /// resource objects are returned as a list of `SearchResult` objects in the
  /// response. You can sort the search results by any resource property in a
  /// ascending or descending order.
  ///
  /// You can query against the following value types: numerical, text,
  /// Booleans, and timestamps.
  ///
  /// [resource]: The name of the Amazon SageMaker resource to search for.
  /// Currently, the only valid `Resource` value is `TrainingJob`.
  ///
  /// [searchExpression]: A Boolean conditional statement. Resource objects must
  /// satisfy this condition to be included in search results. You must provide
  /// at least one subexpression, filter, or nested filter. The maximum number
  /// of recursive `SubExpressions`, `NestedFilters`, and `Filters` that can be
  /// included in a `SearchExpression` object is 50.
  ///
  /// [sortBy]: The name of the resource property used to sort the
  /// `SearchResults`. The default is `LastModifiedTime`.
  ///
  /// [sortOrder]: How `SearchResults` are ordered. Valid values are `Ascending`
  /// or `Descending`. The default is `Descending`.
  ///
  /// [nextToken]: If more than `MaxResults` resource objects match the
  /// specified `SearchExpression`, the `SearchResponse` includes a `NextToken`.
  /// The `NextToken` can be passed to the next `SearchRequest` to continue
  /// retrieving results for the specified `SearchExpression` and `Sort`
  /// parameters.
  ///
  /// [maxResults]: The maximum number of results to return in a
  /// `SearchResponse`.
  Future<SearchResponse> search(String resource,
      {SearchExpression searchExpression,
      String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('Search', {
      'Resource': resource,
      if (searchExpression != null) 'SearchExpression': searchExpression,
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return SearchResponse.fromJson(response_);
  }

  /// Launches an ML compute instance with the latest version of the libraries
  /// and attaches your ML storage volume. After configuring the notebook
  /// instance, Amazon SageMaker sets the notebook instance status to
  /// `InService`. A notebook instance's status must be `InService` before you
  /// can connect to your Jupyter notebook.
  ///
  /// [notebookInstanceName]: The name of the notebook instance to start.
  Future<void> startNotebookInstance(String notebookInstanceName) async {
    await _client.send('StartNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
    });
  }

  /// Stops a model compilation job.
  ///
  ///  To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal.
  /// This gracefully shuts the job down. If the job hasn't stopped, it sends
  /// the SIGKILL signal.
  ///
  /// When it receives a `StopCompilationJob` request, Amazon SageMaker changes
  /// the CompilationJobSummary$CompilationJobStatus of the job to `Stopping`.
  /// After Amazon SageMaker stops the job, it sets the
  /// CompilationJobSummary$CompilationJobStatus to `Stopped`.
  ///
  /// [compilationJobName]: The name of the model compilation job to stop.
  Future<void> stopCompilationJob(String compilationJobName) async {
    await _client.send('StopCompilationJob', {
      'CompilationJobName': compilationJobName,
    });
  }

  /// Stops a running hyperparameter tuning job and all running training jobs
  /// that the tuning job launched.
  ///
  /// All model artifacts output from the training jobs are stored in Amazon
  /// Simple Storage Service (Amazon S3). All data that the training jobs write
  /// to Amazon CloudWatch Logs are still available in CloudWatch. After the
  /// tuning job moves to the `Stopped` state, it releases all reserved
  /// resources for the tuning job.
  ///
  /// [hyperParameterTuningJobName]: The name of the tuning job to stop.
  Future<void> stopHyperParameterTuningJob(
      String hyperParameterTuningJobName) async {
    await _client.send('StopHyperParameterTuningJob', {
      'HyperParameterTuningJobName': hyperParameterTuningJobName,
    });
  }

  /// Stops a running labeling job. A job that is stopped cannot be restarted.
  /// Any results obtained before the job is stopped are placed in the Amazon S3
  /// output bucket.
  ///
  /// [labelingJobName]: The name of the labeling job to stop.
  Future<void> stopLabelingJob(String labelingJobName) async {
    await _client.send('StopLabelingJob', {
      'LabelingJobName': labelingJobName,
    });
  }

  /// Terminates the ML compute instance. Before terminating the instance,
  /// Amazon SageMaker disconnects the ML storage volume from it. Amazon
  /// SageMaker preserves the ML storage volume. Amazon SageMaker stops charging
  /// you for the ML compute instance when you call `StopNotebookInstance`.
  ///
  /// To access data on the ML storage volume for a notebook instance that has
  /// been terminated, call the `StartNotebookInstance` API.
  /// `StartNotebookInstance` launches another ML compute instance, configures
  /// it, and attaches the preserved ML storage volume so you can continue your
  /// work.
  ///
  /// [notebookInstanceName]: The name of the notebook instance to terminate.
  Future<void> stopNotebookInstance(String notebookInstanceName) async {
    await _client.send('StopNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
    });
  }

  /// Stops a training job. To stop a job, Amazon SageMaker sends the algorithm
  /// the `SIGTERM` signal, which delays job termination for 120 seconds.
  /// Algorithms might use this 120-second window to save the model artifacts,
  /// so the results of the training is not lost.
  ///
  /// When it receives a `StopTrainingJob` request, Amazon SageMaker changes the
  /// status of the job to `Stopping`. After Amazon SageMaker stops the job, it
  /// sets the status to `Stopped`.
  ///
  /// [trainingJobName]: The name of the training job to stop.
  Future<void> stopTrainingJob(String trainingJobName) async {
    await _client.send('StopTrainingJob', {
      'TrainingJobName': trainingJobName,
    });
  }

  /// Stops a transform job.
  ///
  /// When Amazon SageMaker receives a `StopTransformJob` request, the status of
  /// the job changes to `Stopping`. After Amazon SageMaker stops the job, the
  /// status is set to `Stopped`. When you stop a transform job before it is
  /// completed, Amazon SageMaker doesn't store the job's output in Amazon S3.
  ///
  /// [transformJobName]: The name of the transform job to stop.
  Future<void> stopTransformJob(String transformJobName) async {
    await _client.send('StopTransformJob', {
      'TransformJobName': transformJobName,
    });
  }

  /// Updates the specified Git repository with the specified values.
  ///
  /// [codeRepositoryName]: The name of the Git repository to update.
  ///
  /// [gitConfig]: The configuration of the git repository, including the URL
  /// and the Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the credentials used to access the repository. The secret must
  /// have a staging label of `AWSCURRENT` and must be in the following format:
  ///
  ///  `{"username": _UserName_, "password": _Password_}`
  Future<UpdateCodeRepositoryOutput> updateCodeRepository(
      String codeRepositoryName,
      {GitConfigForUpdate gitConfig}) async {
    var response_ = await _client.send('UpdateCodeRepository', {
      'CodeRepositoryName': codeRepositoryName,
      if (gitConfig != null) 'GitConfig': gitConfig,
    });
    return UpdateCodeRepositoryOutput.fromJson(response_);
  }

  /// Deploys the new `EndpointConfig` specified in the request, switches to
  /// using newly created endpoint, and then deletes resources provisioned for
  /// the endpoint using the previous `EndpointConfig` (there is no availability
  /// loss).
  ///
  /// When Amazon SageMaker receives the request, it sets the endpoint status to
  /// `Updating`. After updating the endpoint, it sets the status to
  /// `InService`. To check the status of an endpoint, use the
  /// [DescribeEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_DescribeEndpoint.html)
  /// API.
  ///
  ///
  ///
  /// You must not delete an `EndpointConfig` in use by an endpoint that is live
  /// or while the `UpdateEndpoint` or `CreateEndpoint` operations are being
  /// performed on the endpoint. To update an endpoint, you must create a new
  /// `EndpointConfig`.
  ///
  /// [endpointName]: The name of the endpoint whose configuration you want to
  /// update.
  ///
  /// [endpointConfigName]: The name of the new endpoint configuration.
  Future<UpdateEndpointOutput> updateEndpoint(
      {@required String endpointName,
      @required String endpointConfigName}) async {
    var response_ = await _client.send('UpdateEndpoint', {
      'EndpointName': endpointName,
      'EndpointConfigName': endpointConfigName,
    });
    return UpdateEndpointOutput.fromJson(response_);
  }

  /// Updates variant weight of one or more variants associated with an existing
  /// endpoint, or capacity of one variant associated with an existing endpoint.
  /// When it receives the request, Amazon SageMaker sets the endpoint status to
  /// `Updating`. After updating the endpoint, it sets the status to
  /// `InService`. To check the status of an endpoint, use the
  /// [DescribeEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_DescribeEndpoint.html)
  /// API.
  ///
  /// [endpointName]: The name of an existing Amazon SageMaker endpoint.
  ///
  /// [desiredWeightsAndCapacities]: An object that provides new capacity and
  /// weight values for a variant.
  Future<UpdateEndpointWeightsAndCapacitiesOutput>
      updateEndpointWeightsAndCapacities(
          {@required
              String endpointName,
          @required
              List<DesiredWeightAndCapacity>
                  desiredWeightsAndCapacities}) async {
    var response_ = await _client.send('UpdateEndpointWeightsAndCapacities', {
      'EndpointName': endpointName,
      'DesiredWeightsAndCapacities': desiredWeightsAndCapacities,
    });
    return UpdateEndpointWeightsAndCapacitiesOutput.fromJson(response_);
  }

  /// Updates a notebook instance. NotebookInstance updates include upgrading or
  /// downgrading the ML compute instance used for your notebook instance to
  /// accommodate changes in your workload requirements.
  ///
  /// [notebookInstanceName]: The name of the notebook instance to update.
  ///
  /// [instanceType]: The Amazon ML compute instance type.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role that Amazon
  /// SageMaker can assume to access the notebook instance. For more
  /// information, see
  /// [Amazon SageMaker Roles](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html).
  ///
  ///
  ///
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the `iam:PassRole` permission.
  ///
  /// [lifecycleConfigName]: The name of a lifecycle configuration to associate
  /// with the notebook instance. For information about lifestyle
  /// configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  ///
  /// [disassociateLifecycleConfig]: Set to `true` to remove the notebook
  /// instance lifecycle configuration currently associated with the notebook
  /// instance. This operation is idempotent. If you specify a lifecycle
  /// configuration that is not associated with the notebook instance when you
  /// call this method, it does not throw an error.
  ///
  /// [volumeSizeInGB]: The size, in GB, of the ML storage volume to attach to
  /// the notebook instance. The default value is 5 GB. ML storage volumes are
  /// encrypted, so Amazon SageMaker can't determine the amount of available
  /// free space on the volume. Because of this, you can increase the volume
  /// size when you update a notebook instance, but you can't decrease the
  /// volume size. If you want to decrease the size of the ML storage volume in
  /// use, create a new notebook instance with the desired size.
  ///
  /// [defaultCodeRepository]: The Git repository to associate with the notebook
  /// instance as its default code repository. This can be either the name of a
  /// Git repository stored as a resource in your account, or the URL of a Git
  /// repository in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. When you open a notebook instance, it
  /// opens in the directory that contains this repository. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  ///
  /// [additionalCodeRepositories]: An array of up to three Git repositories to
  /// associate with the notebook instance. These can be either the names of Git
  /// repositories stored as resources in your account, or the URL of Git
  /// repositories in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. These repositories are cloned at the same
  /// level as the default repository of your notebook instance. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  ///
  /// [acceleratorTypes]: A list of the Elastic Inference (EI) instance types to
  /// associate with this notebook instance. Currently only one EI instance type
  /// can be associated with a notebook instance. For more information, see
  /// [Using Elastic Inference in Amazon SageMaker](sagemaker/latest/dg/ei.html).
  ///
  /// [disassociateAcceleratorTypes]: A list of the Elastic Inference (EI)
  /// instance types to remove from this notebook instance. This operation is
  /// idempotent. If you specify an accelerator type that is not associated with
  /// the notebook instance when you call this method, it does not throw an
  /// error.
  ///
  /// [disassociateDefaultCodeRepository]: The name or URL of the default Git
  /// repository to remove from this notebook instance. This operation is
  /// idempotent. If you specify a Git repository that is not associated with
  /// the notebook instance when you call this method, it does not throw an
  /// error.
  ///
  /// [disassociateAdditionalCodeRepositories]: A list of names or URLs of the
  /// default Git repositories to remove from this notebook instance. This
  /// operation is idempotent. If you specify a Git repository that is not
  /// associated with the notebook instance when you call this method, it does
  /// not throw an error.
  ///
  /// [rootAccess]: Whether root access is enabled or disabled for users of the
  /// notebook instance. The default value is `Enabled`.
  ///
  ///
  ///
  /// If you set this to `Disabled`, users don't have root access on the
  /// notebook instance, but lifecycle configuration scripts still run with root
  /// permissions.
  Future<UpdateNotebookInstanceOutput> updateNotebookInstance(
      String notebookInstanceName,
      {String instanceType,
      String roleArn,
      String lifecycleConfigName,
      bool disassociateLifecycleConfig,
      int volumeSizeInGB,
      String defaultCodeRepository,
      List<String> additionalCodeRepositories,
      List<String> acceleratorTypes,
      bool disassociateAcceleratorTypes,
      bool disassociateDefaultCodeRepository,
      bool disassociateAdditionalCodeRepositories,
      String rootAccess}) async {
    var response_ = await _client.send('UpdateNotebookInstance', {
      'NotebookInstanceName': notebookInstanceName,
      if (instanceType != null) 'InstanceType': instanceType,
      if (roleArn != null) 'RoleArn': roleArn,
      if (lifecycleConfigName != null)
        'LifecycleConfigName': lifecycleConfigName,
      if (disassociateLifecycleConfig != null)
        'DisassociateLifecycleConfig': disassociateLifecycleConfig,
      if (volumeSizeInGB != null) 'VolumeSizeInGB': volumeSizeInGB,
      if (defaultCodeRepository != null)
        'DefaultCodeRepository': defaultCodeRepository,
      if (additionalCodeRepositories != null)
        'AdditionalCodeRepositories': additionalCodeRepositories,
      if (acceleratorTypes != null) 'AcceleratorTypes': acceleratorTypes,
      if (disassociateAcceleratorTypes != null)
        'DisassociateAcceleratorTypes': disassociateAcceleratorTypes,
      if (disassociateDefaultCodeRepository != null)
        'DisassociateDefaultCodeRepository': disassociateDefaultCodeRepository,
      if (disassociateAdditionalCodeRepositories != null)
        'DisassociateAdditionalCodeRepositories':
            disassociateAdditionalCodeRepositories,
      if (rootAccess != null) 'RootAccess': rootAccess,
    });
    return UpdateNotebookInstanceOutput.fromJson(response_);
  }

  /// Updates a notebook instance lifecycle configuration created with the
  /// CreateNotebookInstanceLifecycleConfig API.
  ///
  /// [notebookInstanceLifecycleConfigName]: The name of the lifecycle
  /// configuration.
  ///
  /// [onCreate]: The shell script that runs only once, when you create a
  /// notebook instance. The shell script must be a base64-encoded string.
  ///
  /// [onStart]: The shell script that runs every time you start a notebook
  /// instance, including when you create the notebook instance. The shell
  /// script must be a base64-encoded string.
  Future<UpdateNotebookInstanceLifecycleConfigOutput>
      updateNotebookInstanceLifecycleConfig(
          String notebookInstanceLifecycleConfigName,
          {List<NotebookInstanceLifecycleHook> onCreate,
          List<NotebookInstanceLifecycleHook> onStart}) async {
    var response_ =
        await _client.send('UpdateNotebookInstanceLifecycleConfig', {
      'NotebookInstanceLifecycleConfigName':
          notebookInstanceLifecycleConfigName,
      if (onCreate != null) 'OnCreate': onCreate,
      if (onStart != null) 'OnStart': onStart,
    });
    return UpdateNotebookInstanceLifecycleConfigOutput.fromJson(response_);
  }

  /// Updates an existing work team with new member definitions or description.
  ///
  /// [workteamName]: The name of the work team to update.
  ///
  /// [memberDefinitions]: A list of `MemberDefinition` objects that contain the
  /// updated work team members.
  ///
  /// [description]: An updated description for the work team.
  ///
  /// [notificationConfiguration]: Configures SNS topic notifications for
  /// available or expiring work items
  Future<UpdateWorkteamResponse> updateWorkteam(String workteamName,
      {List<MemberDefinition> memberDefinitions,
      String description,
      NotificationConfiguration notificationConfiguration}) async {
    var response_ = await _client.send('UpdateWorkteam', {
      'WorkteamName': workteamName,
      if (memberDefinitions != null) 'MemberDefinitions': memberDefinitions,
      if (description != null) 'Description': description,
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
    });
    return UpdateWorkteamResponse.fromJson(response_);
  }
}

class AddTagsOutput {
  /// A list of tags associated with the Amazon SageMaker resource.
  final List<Tag> tags;

  AddTagsOutput({
    this.tags,
  });
  static AddTagsOutput fromJson(Map<String, dynamic> json) => AddTagsOutput(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Specifies the training algorithm to use in a
/// [CreateTrainingJob](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateTrainingJob.html)
/// request.
///
/// For more information about algorithms provided by Amazon SageMaker, see
/// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
/// For information about using your own algorithms, see
/// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html).
class AlgorithmSpecification {
  /// The registry path of the Docker image that contains the training
  /// algorithm. For information about docker registry paths for built-in
  /// algorithms, see
  /// [Algorithms Provided by Amazon SageMaker: Common Parameters](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html).
  /// Amazon SageMaker supports both `registry/repository[:tag]` and
  /// `registry/repository[@digest]` image path formats. For more information,
  /// see
  /// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html).
  final String trainingImage;

  /// The name of the algorithm resource to use for the training job. This must
  /// be an algorithm resource that you created or subscribe to on AWS
  /// Marketplace. If you specify a value for this parameter, you can't specify
  /// a value for `TrainingImage`.
  final String algorithmName;

  /// The input mode that the algorithm supports. For the input modes that
  /// Amazon SageMaker algorithms support, see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  /// If an algorithm supports the `File` input mode, Amazon SageMaker downloads
  /// the training data from S3 to the provisioned ML storage Volume, and mounts
  /// the directory to docker volume for training container. If an algorithm
  /// supports the `Pipe` input mode, Amazon SageMaker streams data directly
  /// from S3 to the container.
  ///
  ///  In File mode, make sure you provision ML storage volume with sufficient
  /// capacity to accommodate the data download from S3. In addition to the
  /// training data, the ML storage volume also stores the output model. The
  /// algorithm container use ML storage volume to also store intermediate
  /// information, if any.
  ///
  ///  For distributed algorithms using File mode, training data is distributed
  /// uniformly, and your training duration is predictable if the input data
  /// objects size is approximately same. Amazon SageMaker does not split the
  /// files any further for model training. If the object sizes are skewed,
  /// training won't be optimal as the data distribution is also skewed where
  /// one host in a training cluster is overloaded, thus becoming bottleneck in
  /// training.
  final String trainingInputMode;

  /// A list of metric definition objects. Each object specifies the metric name
  /// and regular expressions used to parse algorithm logs. Amazon SageMaker
  /// publishes each metric to Amazon CloudWatch.
  final List<MetricDefinition> metricDefinitions;

  AlgorithmSpecification({
    this.trainingImage,
    this.algorithmName,
    @required this.trainingInputMode,
    this.metricDefinitions,
  });
  static AlgorithmSpecification fromJson(Map<String, dynamic> json) =>
      AlgorithmSpecification(
        trainingImage: json.containsKey('TrainingImage')
            ? json['TrainingImage'] as String
            : null,
        algorithmName: json.containsKey('AlgorithmName')
            ? json['AlgorithmName'] as String
            : null,
        trainingInputMode: json['TrainingInputMode'] as String,
        metricDefinitions: json.containsKey('MetricDefinitions')
            ? (json['MetricDefinitions'] as List)
                .map((e) => MetricDefinition.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the validation and image scan statuses of the algorithm.
class AlgorithmStatusDetails {
  /// The status of algorithm validation.
  final List<AlgorithmStatusItem> validationStatuses;

  /// The status of the scan of the algorithm's Docker image container.
  final List<AlgorithmStatusItem> imageScanStatuses;

  AlgorithmStatusDetails({
    this.validationStatuses,
    this.imageScanStatuses,
  });
  static AlgorithmStatusDetails fromJson(Map<String, dynamic> json) =>
      AlgorithmStatusDetails(
        validationStatuses: json.containsKey('ValidationStatuses')
            ? (json['ValidationStatuses'] as List)
                .map((e) => AlgorithmStatusItem.fromJson(e))
                .toList()
            : null,
        imageScanStatuses: json.containsKey('ImageScanStatuses')
            ? (json['ImageScanStatuses'] as List)
                .map((e) => AlgorithmStatusItem.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the overall status of an algorithm.
class AlgorithmStatusItem {
  /// The name of the algorithm for which the overall status is being reported.
  final String name;

  /// The current status.
  final String status;

  /// if the overall status is `Failed`, the reason for the failure.
  final String failureReason;

  AlgorithmStatusItem({
    @required this.name,
    @required this.status,
    this.failureReason,
  });
  static AlgorithmStatusItem fromJson(Map<String, dynamic> json) =>
      AlgorithmStatusItem(
        name: json['Name'] as String,
        status: json['Status'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

/// Provides summary information about an algorithm.
class AlgorithmSummary {
  /// The name of the algorithm that is described by the summary.
  final String algorithmName;

  /// The Amazon Resource Name (ARN) of the algorithm.
  final String algorithmArn;

  /// A brief description of the algorithm.
  final String algorithmDescription;

  /// A timestamp that shows when the algorithm was created.
  final DateTime creationTime;

  /// The overall status of the algorithm.
  final String algorithmStatus;

  AlgorithmSummary({
    @required this.algorithmName,
    @required this.algorithmArn,
    this.algorithmDescription,
    @required this.creationTime,
    @required this.algorithmStatus,
  });
  static AlgorithmSummary fromJson(Map<String, dynamic> json) =>
      AlgorithmSummary(
        algorithmName: json['AlgorithmName'] as String,
        algorithmArn: json['AlgorithmArn'] as String,
        algorithmDescription: json.containsKey('AlgorithmDescription')
            ? json['AlgorithmDescription'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        algorithmStatus: json['AlgorithmStatus'] as String,
      );
}

/// Defines a training job and a batch transform job that Amazon SageMaker runs
/// to validate your algorithm.
///
/// The data provided in the validation profile is made available to your buyers
/// on AWS Marketplace.
class AlgorithmValidationProfile {
  /// The name of the profile for the algorithm. The name must have 1 to 63
  /// characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  final String profileName;

  /// The `TrainingJobDefinition` object that describes the training job that
  /// Amazon SageMaker runs to validate your algorithm.
  final TrainingJobDefinition trainingJobDefinition;

  /// The `TransformJobDefinition` object that describes the transform job that
  /// Amazon SageMaker runs to validate your algorithm.
  final TransformJobDefinition transformJobDefinition;

  AlgorithmValidationProfile({
    @required this.profileName,
    @required this.trainingJobDefinition,
    this.transformJobDefinition,
  });
  static AlgorithmValidationProfile fromJson(Map<String, dynamic> json) =>
      AlgorithmValidationProfile(
        profileName: json['ProfileName'] as String,
        trainingJobDefinition:
            TrainingJobDefinition.fromJson(json['TrainingJobDefinition']),
        transformJobDefinition: json.containsKey('TransformJobDefinition')
            ? TransformJobDefinition.fromJson(json['TransformJobDefinition'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies configurations for one or more training jobs that Amazon SageMaker
/// runs to test the algorithm.
class AlgorithmValidationSpecification {
  /// The IAM roles that Amazon SageMaker uses to run the training jobs.
  final String validationRole;

  /// An array of `AlgorithmValidationProfile` objects, each of which specifies
  /// a training job and batch transform job that Amazon SageMaker runs to
  /// validate your algorithm.
  final List<AlgorithmValidationProfile> validationProfiles;

  AlgorithmValidationSpecification({
    @required this.validationRole,
    @required this.validationProfiles,
  });
  static AlgorithmValidationSpecification fromJson(Map<String, dynamic> json) =>
      AlgorithmValidationSpecification(
        validationRole: json['ValidationRole'] as String,
        validationProfiles: (json['ValidationProfiles'] as List)
            .map((e) => AlgorithmValidationProfile.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configures how labels are consolidated across human workers.
class AnnotationConsolidationConfig {
  /// The Amazon Resource Name (ARN) of a Lambda function implements the logic
  /// for annotation consolidation.
  ///
  /// For the built-in bounding box, image classification, semantic
  /// segmentation, and text classification task types, Amazon SageMaker Ground
  /// Truth provides the following Lambda functions:
  ///
  /// *    _Bounding box_ - Finds the most similar boxes from different workers
  /// based on the Jaccard index of the boxes.
  ///
  ///      `arn:aws:lambda:us-east-1:432418664414:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:us-east-2:266458841044:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:us-west-2:081040173940:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:eu-west-1:568282634449:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ap-south-1:565803892007:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:eu-central-1:203001061592:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:eu-west-2:487402164563:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-BoundingBox`
  ///
  ///      `arn:aws:lambda:ca-central-1:918755190332:function:ACS-BoundingBox`
  ///
  /// *    _Image classification_ - Uses a variant of the Expectation
  /// Maximization approach to estimate the true class of an image based on
  /// annotations from individual workers.
  ///
  ///      `arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClass`
  ///
  ///      `arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClass`
  ///
  ///      `arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClass`
  ///
  ///      `arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClass`
  ///
  ///      `arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClass`
  ///
  ///      `arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClass`
  ///
  /// *    _Semantic segmentation_ - Treats each pixel in an image as a
  /// multi-class classification and treats pixel annotations from workers as
  /// "votes" for the correct label.
  ///
  ///
  /// `arn:aws:lambda:us-east-1:432418664414:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:us-east-2:266458841044:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:us-west-2:081040173940:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:eu-west-1:568282634449:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ap-south-1:565803892007:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:eu-central-1:203001061592:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:eu-west-2:487402164563:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-SemanticSegmentation`
  ///
  ///
  /// `arn:aws:lambda:ca-central-1:918755190332:function:ACS-SemanticSegmentation`
  ///
  /// *    _Text classification_ - Uses a variant of the Expectation
  /// Maximization approach to estimate the true class of text based on
  /// annotations from individual workers.
  ///
  ///      `arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClass`
  ///
  ///      `arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClass`
  ///
  ///      `arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClass`
  ///
  ///      `arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClass`
  ///
  ///      `arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClass`
  ///
  ///      `arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClass`
  ///
  ///
  /// `arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClass`
  ///
  /// *    _Named entity eecognition_ - Groups similar selections and calculates
  /// aggregate boundaries, resolving to most-assigned label.
  ///
  ///
  /// `arn:aws:lambda:us-east-1:432418664414:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:us-east-2:266458841044:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:us-west-2:081040173940:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:eu-west-1:568282634449:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-south-1:565803892007:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:eu-central-1:203001061592:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:eu-west-2:487402164563:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ca-central-1:918755190332:function:ACS-NamedEntityRecognition`
  ///
  /// *    _Named entity eecognition_ - Groups similar selections and calculates
  /// aggregate boundaries, resolving to most-assigned label.
  ///
  ///
  /// `arn:aws:lambda:us-east-1:432418664414:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:us-east-2:266458841044:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:us-west-2:081040173940:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:eu-west-1:568282634449:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-NamedEntityRecognition`
  ///
  ///
  /// For more information, see
  /// [Annotation Consolidation](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html).
  final String annotationConsolidationLambdaArn;

  AnnotationConsolidationConfig({
    @required this.annotationConsolidationLambdaArn,
  });
  static AnnotationConsolidationConfig fromJson(Map<String, dynamic> json) =>
      AnnotationConsolidationConfig(
        annotationConsolidationLambdaArn:
            json['AnnotationConsolidationLambdaArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of categorical hyperparameters to tune.
class CategoricalParameterRange {
  /// The name of the categorical hyperparameter to tune.
  final String name;

  /// A list of the categories for the hyperparameter.
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

/// Defines the possible values for a categorical hyperparameter.
class CategoricalParameterRangeSpecification {
  /// The allowed categories for the hyperparameter.
  final List<String> values;

  CategoricalParameterRangeSpecification({
    @required this.values,
  });
  static CategoricalParameterRangeSpecification fromJson(
          Map<String, dynamic> json) =>
      CategoricalParameterRangeSpecification(
        values: (json['Values'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A channel is a named input source that training algorithms can consume.
class Channel {
  /// The name of the channel.
  final String channelName;

  /// The location of the channel data.
  final DataSource dataSource;

  /// The MIME type of the data.
  final String contentType;

  /// If training data is compressed, the compression type. The default value is
  /// `None`. `CompressionType` is used only in Pipe input mode. In File mode,
  /// leave this field unset or set it to None.
  final String compressionType;

  /// Specify RecordIO as the value when input data is in raw format but the
  /// training algorithm requires the RecordIO format. In this case, Amazon
  /// SageMaker wraps each individual S3 object in a RecordIO record. If the
  /// input data is already in RecordIO format, you don't need to set this
  /// attribute. For more information, see
  /// [Create a Dataset Using RecordIO](https://mxnet.incubator.apache.org/architecture/note_data_loading.html#data-format).
  ///
  /// In File mode, leave this field unset or set it to None.
  final String recordWrapperType;

  /// (Optional) The input mode to use for the data channel in a training job.
  /// If you don't set a value for `InputMode`, Amazon SageMaker uses the value
  /// set for `TrainingInputMode`. Use this parameter to override the
  /// `TrainingInputMode` setting in a AlgorithmSpecification request when you
  /// have a channel that needs a different input mode from the training job's
  /// general setting. To download the data from Amazon Simple Storage Service
  /// (Amazon S3) to the provisioned ML storage volume, and mount the directory
  /// to a Docker volume, use `File` input mode. To stream data directly from
  /// Amazon S3 to the container, choose `Pipe` input mode.
  ///
  /// To use a model for incremental training, choose `File` input model.
  final String inputMode;

  /// A configuration for a shuffle option for input data in a channel. If you
  /// use `S3Prefix` for `S3DataType`, this shuffles the results of the S3 key
  /// prefix matches. If you use `ManifestFile`, the order of the S3 object
  /// references in the `ManifestFile` is shuffled. If you use
  /// `AugmentedManifestFile`, the order of the JSON lines in the
  /// `AugmentedManifestFile` is shuffled. The shuffling order is determined
  /// using the `Seed` value.
  ///
  /// For Pipe input mode, shuffling is done at the start of every epoch. With
  /// large datasets this ensures that the order of the training data is
  /// different for each epoch, it helps reduce bias and possible overfitting.
  /// In a multi-node training job when ShuffleConfig is combined with
  /// `S3DataDistributionType` of `ShardedByS3Key`, the data is shuffled across
  /// nodes so that the content sent to a particular node on the first epoch
  /// might be sent to a different node on the second epoch.
  final ShuffleConfig shuffleConfig;

  Channel({
    @required this.channelName,
    @required this.dataSource,
    this.contentType,
    this.compressionType,
    this.recordWrapperType,
    this.inputMode,
    this.shuffleConfig,
  });
  static Channel fromJson(Map<String, dynamic> json) => Channel(
        channelName: json['ChannelName'] as String,
        dataSource: DataSource.fromJson(json['DataSource']),
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        compressionType: json.containsKey('CompressionType')
            ? json['CompressionType'] as String
            : null,
        recordWrapperType: json.containsKey('RecordWrapperType')
            ? json['RecordWrapperType'] as String
            : null,
        inputMode:
            json.containsKey('InputMode') ? json['InputMode'] as String : null,
        shuffleConfig: json.containsKey('ShuffleConfig')
            ? ShuffleConfig.fromJson(json['ShuffleConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines a named input source, called a channel, to be used by an algorithm.
class ChannelSpecification {
  /// The name of the channel.
  final String name;

  /// A brief description of the channel.
  final String description;

  /// Indicates whether the channel is required by the algorithm.
  final bool isRequired;

  /// The supported MIME types for the data.
  final List<String> supportedContentTypes;

  /// The allowed compression types, if data compression is used.
  final List<String> supportedCompressionTypes;

  /// The allowed input mode, either FILE or PIPE.
  ///
  /// In FILE mode, Amazon SageMaker copies the data from the input source onto
  /// the local Amazon Elastic Block Store (Amazon EBS) volumes before starting
  /// your training algorithm. This is the most commonly used input mode.
  ///
  /// In PIPE mode, Amazon SageMaker streams input data from the source directly
  /// to your algorithm without using the EBS volume.
  final List<String> supportedInputModes;

  ChannelSpecification({
    @required this.name,
    this.description,
    this.isRequired,
    @required this.supportedContentTypes,
    this.supportedCompressionTypes,
    @required this.supportedInputModes,
  });
  static ChannelSpecification fromJson(Map<String, dynamic> json) =>
      ChannelSpecification(
        name: json['Name'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        isRequired:
            json.containsKey('IsRequired') ? json['IsRequired'] as bool : null,
        supportedContentTypes: (json['SupportedContentTypes'] as List)
            .map((e) => e as String)
            .toList(),
        supportedCompressionTypes: json.containsKey('SupportedCompressionTypes')
            ? (json['SupportedCompressionTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        supportedInputModes: (json['SupportedInputModes'] as List)
            .map((e) => e as String)
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about the output location for managed spot training
/// checkpoint data.
class CheckpointConfig {
  /// Identifies the S3 path where you want Amazon SageMaker to store
  /// checkpoints. For example, `s3://bucket-name/key-name-prefix`.
  final String s3Uri;

  /// (Optional) The local directory where checkpoints are written. The default
  /// directory is `/opt/ml/checkpoints/`.
  final String localPath;

  CheckpointConfig({
    @required this.s3Uri,
    this.localPath,
  });
  static CheckpointConfig fromJson(Map<String, dynamic> json) =>
      CheckpointConfig(
        s3Uri: json['S3Uri'] as String,
        localPath:
            json.containsKey('LocalPath') ? json['LocalPath'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies summary information about a Git repository.
class CodeRepositorySummary {
  /// The name of the Git repository.
  final String codeRepositoryName;

  /// The Amazon Resource Name (ARN) of the Git repository.
  final String codeRepositoryArn;

  /// The date and time that the Git repository was created.
  final DateTime creationTime;

  /// The date and time that the Git repository was last modified.
  final DateTime lastModifiedTime;

  /// Configuration details for the Git repository, including the URL where it
  /// is located and the ARN of the AWS Secrets Manager secret that contains the
  /// credentials used to access the repository.
  final GitConfig gitConfig;

  CodeRepositorySummary({
    @required this.codeRepositoryName,
    @required this.codeRepositoryArn,
    @required this.creationTime,
    @required this.lastModifiedTime,
    this.gitConfig,
  });
  static CodeRepositorySummary fromJson(Map<String, dynamic> json) =>
      CodeRepositorySummary(
        codeRepositoryName: json['CodeRepositoryName'] as String,
        codeRepositoryArn: json['CodeRepositoryArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        gitConfig: json.containsKey('GitConfig')
            ? GitConfig.fromJson(json['GitConfig'])
            : null,
      );
}

/// Identifies a Amazon Cognito user group. A user group can be used in on or
/// more work teams.
class CognitoMemberDefinition {
  /// An identifier for a user pool. The user pool must be in the same region as
  /// the service that you are calling.
  final String userPool;

  /// An identifier for a user group.
  final String userGroup;

  /// An identifier for an application client. You must create the app client ID
  /// using Amazon Cognito.
  final String clientId;

  CognitoMemberDefinition({
    @required this.userPool,
    @required this.userGroup,
    @required this.clientId,
  });
  static CognitoMemberDefinition fromJson(Map<String, dynamic> json) =>
      CognitoMemberDefinition(
        userPool: json['UserPool'] as String,
        userGroup: json['UserGroup'] as String,
        clientId: json['ClientId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A summary of a model compilation job.
class CompilationJobSummary {
  /// The name of the model compilation job that you want a summary for.
  final String compilationJobName;

  /// The Amazon Resource Name (ARN) of the model compilation job.
  final String compilationJobArn;

  /// The time when the model compilation job was created.
  final DateTime creationTime;

  /// The time when the model compilation job started.
  final DateTime compilationStartTime;

  /// The time when the model compilation job completed.
  final DateTime compilationEndTime;

  /// The type of device that the model will run on after compilation has
  /// completed.
  final String compilationTargetDevice;

  /// The time when the model compilation job was last modified.
  final DateTime lastModifiedTime;

  /// The status of the model compilation job.
  final String compilationJobStatus;

  CompilationJobSummary({
    @required this.compilationJobName,
    @required this.compilationJobArn,
    @required this.creationTime,
    this.compilationStartTime,
    this.compilationEndTime,
    @required this.compilationTargetDevice,
    this.lastModifiedTime,
    @required this.compilationJobStatus,
  });
  static CompilationJobSummary fromJson(Map<String, dynamic> json) =>
      CompilationJobSummary(
        compilationJobName: json['CompilationJobName'] as String,
        compilationJobArn: json['CompilationJobArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        compilationStartTime: json.containsKey('CompilationStartTime')
            ? DateTime.parse(json['CompilationStartTime'])
            : null,
        compilationEndTime: json.containsKey('CompilationEndTime')
            ? DateTime.parse(json['CompilationEndTime'])
            : null,
        compilationTargetDevice: json['CompilationTargetDevice'] as String,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        compilationJobStatus: json['CompilationJobStatus'] as String,
      );
}

/// Describes the container, as part of model definition.
class ContainerDefinition {
  /// This parameter is ignored for models that contain only a
  /// `PrimaryContainer`.
  ///
  /// When a `ContainerDefinition` is part of an inference pipeline, the value
  /// of ths parameter uniquely identifies the container for the purposes of
  /// logging and metrics. For information, see
  /// [Use Logs and Metrics to Monitor an Inference Pipeline](https://docs.aws.amazon.com/sagemaker/latest/dg/inference-pipeline-logs-metrics.html).
  /// If you don't specify a value for this parameter for a
  /// `ContainerDefinition` that is part of an inference pipeline, a unique name
  /// is automatically assigned based on the position of the
  /// `ContainerDefinition` in the pipeline. If you specify a value for the
  /// `ContainerHostName` for any `ContainerDefinition` that is part of an
  /// inference pipeline, you must specify a value for the `ContainerHostName`
  /// parameter of every `ContainerDefinition` in that pipeline.
  final String containerHostname;

  /// The Amazon EC2 Container Registry (Amazon ECR) path where inference code
  /// is stored. If you are using your own custom algorithm instead of an
  /// algorithm provided by Amazon SageMaker, the inference code must meet
  /// Amazon SageMaker requirements. Amazon SageMaker supports both
  /// `registry/repository[:tag]` and `registry/repository[@digest]` image path
  /// formats. For more information, see
  /// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html)
  final String image;

  /// The S3 path where the model artifacts, which result from model training,
  /// are stored. This path must point to a single gzip compressed tar archive
  /// (.tar.gz suffix). The S3 path is required for Amazon SageMaker built-in
  /// algorithms, but not if you use your own algorithms. For more information
  /// on built-in algorithms, see
  /// [Common Parameters](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html).
  ///
  /// If you provide a value for this parameter, Amazon SageMaker uses AWS
  /// Security Token Service to download model artifacts from the S3 path you
  /// provide. AWS STS is activated in your IAM user account by default. If you
  /// previously deactivated AWS STS for a region, you need to reactivate AWS
  /// STS for that region. For more information, see
  /// [Activating and Deactivating AWS STS in an AWS Region](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html)
  /// in the _AWS Identity and Access Management User Guide_.
  ///
  ///
  ///
  /// If you use a built-in algorithm to create a model, Amazon SageMaker
  /// requires that you provide a S3 path to the model artifacts in
  /// `ModelDataUrl`.
  final String modelDataUrl;

  /// The environment variables to set in the Docker container. Each key and
  /// value in the `Environment` string to string map can have length of up to
  /// 1024. We support up to 16 entries in the map.
  final Map<String, String> environment;

  /// The name or Amazon Resource Name (ARN) of the model package to use to
  /// create the model.
  final String modelPackageName;

  ContainerDefinition({
    this.containerHostname,
    this.image,
    this.modelDataUrl,
    this.environment,
    this.modelPackageName,
  });
  static ContainerDefinition fromJson(Map<String, dynamic> json) =>
      ContainerDefinition(
        containerHostname: json.containsKey('ContainerHostname')
            ? json['ContainerHostname'] as String
            : null,
        image: json.containsKey('Image') ? json['Image'] as String : null,
        modelDataUrl: json.containsKey('ModelDataUrl')
            ? json['ModelDataUrl'] as String
            : null,
        environment: json.containsKey('Environment')
            ? (json['Environment'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        modelPackageName: json.containsKey('ModelPackageName')
            ? json['ModelPackageName'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of continuous hyperparameters to tune.
class ContinuousParameterRange {
  /// The name of the continuous hyperparameter to tune.
  final String name;

  /// The minimum value for the hyperparameter. The tuning job uses
  /// floating-point values between this value and `MaxValue`for tuning.
  final String minValue;

  /// The maximum value for the hyperparameter. The tuning job uses
  /// floating-point values between `MinValue` value and this value for tuning.
  final String maxValue;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see
  /// [Hyperparameter Scaling](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type).
  /// One of the following values:
  ///
  /// Auto
  ///
  /// Amazon SageMaker hyperparameter tuning chooses the best scale for the
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
  /// the range 0<=x<1.0.
  final String scalingType;

  ContinuousParameterRange({
    @required this.name,
    @required this.minValue,
    @required this.maxValue,
    this.scalingType,
  });
  static ContinuousParameterRange fromJson(Map<String, dynamic> json) =>
      ContinuousParameterRange(
        name: json['Name'] as String,
        minValue: json['MinValue'] as String,
        maxValue: json['MaxValue'] as String,
        scalingType: json.containsKey('ScalingType')
            ? json['ScalingType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the possible values for a continuous hyperparameter.
class ContinuousParameterRangeSpecification {
  /// The minimum floating-point value allowed.
  final String minValue;

  /// The maximum floating-point value allowed.
  final String maxValue;

  ContinuousParameterRangeSpecification({
    @required this.minValue,
    @required this.maxValue,
  });
  static ContinuousParameterRangeSpecification fromJson(
          Map<String, dynamic> json) =>
      ContinuousParameterRangeSpecification(
        minValue: json['MinValue'] as String,
        maxValue: json['MaxValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateAlgorithmOutput {
  /// The Amazon Resource Name (ARN) of the new algorithm.
  final String algorithmArn;

  CreateAlgorithmOutput({
    @required this.algorithmArn,
  });
  static CreateAlgorithmOutput fromJson(Map<String, dynamic> json) =>
      CreateAlgorithmOutput(
        algorithmArn: json['AlgorithmArn'] as String,
      );
}

class CreateCodeRepositoryOutput {
  /// The Amazon Resource Name (ARN) of the new repository.
  final String codeRepositoryArn;

  CreateCodeRepositoryOutput({
    @required this.codeRepositoryArn,
  });
  static CreateCodeRepositoryOutput fromJson(Map<String, dynamic> json) =>
      CreateCodeRepositoryOutput(
        codeRepositoryArn: json['CodeRepositoryArn'] as String,
      );
}

class CreateCompilationJobResponse {
  /// If the action is successful, the service sends back an HTTP 200 response.
  /// Amazon SageMaker returns the following data in JSON format:
  ///
  /// *    `CompilationJobArn`: The Amazon Resource Name (ARN) of the compiled
  /// job.
  final String compilationJobArn;

  CreateCompilationJobResponse({
    @required this.compilationJobArn,
  });
  static CreateCompilationJobResponse fromJson(Map<String, dynamic> json) =>
      CreateCompilationJobResponse(
        compilationJobArn: json['CompilationJobArn'] as String,
      );
}

class CreateEndpointConfigOutput {
  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  final String endpointConfigArn;

  CreateEndpointConfigOutput({
    @required this.endpointConfigArn,
  });
  static CreateEndpointConfigOutput fromJson(Map<String, dynamic> json) =>
      CreateEndpointConfigOutput(
        endpointConfigArn: json['EndpointConfigArn'] as String,
      );
}

class CreateEndpointOutput {
  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  CreateEndpointOutput({
    @required this.endpointArn,
  });
  static CreateEndpointOutput fromJson(Map<String, dynamic> json) =>
      CreateEndpointOutput(
        endpointArn: json['EndpointArn'] as String,
      );
}

class CreateHyperParameterTuningJobResponse {
  /// The Amazon Resource Name (ARN) of the tuning job. Amazon SageMaker assigns
  /// an ARN to a hyperparameter tuning job when you create it.
  final String hyperParameterTuningJobArn;

  CreateHyperParameterTuningJobResponse({
    @required this.hyperParameterTuningJobArn,
  });
  static CreateHyperParameterTuningJobResponse fromJson(
          Map<String, dynamic> json) =>
      CreateHyperParameterTuningJobResponse(
        hyperParameterTuningJobArn:
            json['HyperParameterTuningJobArn'] as String,
      );
}

class CreateLabelingJobResponse {
  /// The Amazon Resource Name (ARN) of the labeling job. You use this ARN to
  /// identify the labeling job.
  final String labelingJobArn;

  CreateLabelingJobResponse({
    @required this.labelingJobArn,
  });
  static CreateLabelingJobResponse fromJson(Map<String, dynamic> json) =>
      CreateLabelingJobResponse(
        labelingJobArn: json['LabelingJobArn'] as String,
      );
}

class CreateModelOutput {
  /// The ARN of the model created in Amazon SageMaker.
  final String modelArn;

  CreateModelOutput({
    @required this.modelArn,
  });
  static CreateModelOutput fromJson(Map<String, dynamic> json) =>
      CreateModelOutput(
        modelArn: json['ModelArn'] as String,
      );
}

class CreateModelPackageOutput {
  /// The Amazon Resource Name (ARN) of the new model package.
  final String modelPackageArn;

  CreateModelPackageOutput({
    @required this.modelPackageArn,
  });
  static CreateModelPackageOutput fromJson(Map<String, dynamic> json) =>
      CreateModelPackageOutput(
        modelPackageArn: json['ModelPackageArn'] as String,
      );
}

class CreateNotebookInstanceLifecycleConfigOutput {
  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  final String notebookInstanceLifecycleConfigArn;

  CreateNotebookInstanceLifecycleConfigOutput({
    this.notebookInstanceLifecycleConfigArn,
  });
  static CreateNotebookInstanceLifecycleConfigOutput fromJson(
          Map<String, dynamic> json) =>
      CreateNotebookInstanceLifecycleConfigOutput(
        notebookInstanceLifecycleConfigArn:
            json.containsKey('NotebookInstanceLifecycleConfigArn')
                ? json['NotebookInstanceLifecycleConfigArn'] as String
                : null,
      );
}

class CreateNotebookInstanceOutput {
  /// The Amazon Resource Name (ARN) of the notebook instance.
  final String notebookInstanceArn;

  CreateNotebookInstanceOutput({
    this.notebookInstanceArn,
  });
  static CreateNotebookInstanceOutput fromJson(Map<String, dynamic> json) =>
      CreateNotebookInstanceOutput(
        notebookInstanceArn: json.containsKey('NotebookInstanceArn')
            ? json['NotebookInstanceArn'] as String
            : null,
      );
}

class CreatePresignedNotebookInstanceUrlOutput {
  /// A JSON object that contains the URL string.
  final String authorizedUrl;

  CreatePresignedNotebookInstanceUrlOutput({
    this.authorizedUrl,
  });
  static CreatePresignedNotebookInstanceUrlOutput fromJson(
          Map<String, dynamic> json) =>
      CreatePresignedNotebookInstanceUrlOutput(
        authorizedUrl: json.containsKey('AuthorizedUrl')
            ? json['AuthorizedUrl'] as String
            : null,
      );
}

class CreateTrainingJobResponse {
  /// The Amazon Resource Name (ARN) of the training job.
  final String trainingJobArn;

  CreateTrainingJobResponse({
    @required this.trainingJobArn,
  });
  static CreateTrainingJobResponse fromJson(Map<String, dynamic> json) =>
      CreateTrainingJobResponse(
        trainingJobArn: json['TrainingJobArn'] as String,
      );
}

class CreateTransformJobResponse {
  /// The Amazon Resource Name (ARN) of the transform job.
  final String transformJobArn;

  CreateTransformJobResponse({
    @required this.transformJobArn,
  });
  static CreateTransformJobResponse fromJson(Map<String, dynamic> json) =>
      CreateTransformJobResponse(
        transformJobArn: json['TransformJobArn'] as String,
      );
}

class CreateWorkteamResponse {
  /// The Amazon Resource Name (ARN) of the work team. You can use this ARN to
  /// identify the work team.
  final String workteamArn;

  CreateWorkteamResponse({
    this.workteamArn,
  });
  static CreateWorkteamResponse fromJson(Map<String, dynamic> json) =>
      CreateWorkteamResponse(
        workteamArn: json.containsKey('WorkteamArn')
            ? json['WorkteamArn'] as String
            : null,
      );
}

/// The data structure used to specify the data to be used for inference in a
/// batch transform job and to associate the data that is relevant to the
/// prediction results in the output. The input filter provided allows you to
/// exclude input data that is not needed for inference in a batch transform
/// job. The output filter provided allows you to include input data relevant to
/// interpreting the predictions in the output from the job. For more
/// information, see
/// [Associate Prediction Results with their Corresponding Input Records](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html).
class DataProcessing {
  /// A
  /// [JSONPath](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators)
  /// expression used to select a portion of the input data to pass to the
  /// algorithm. Use the `InputFilter` parameter to exclude fields, such as an
  /// ID column, from the input. If you want Amazon SageMaker to pass the entire
  /// input dataset to the algorithm, accept the default value `$`.
  ///
  /// Examples: `"$"`, `"$[1:]"`, `"$.features"`
  final String inputFilter;

  /// A
  /// [JSONPath](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators)
  /// expression used to select a portion of the joined dataset to save in the
  /// output file for a batch transform job. If you want Amazon SageMaker to
  /// store the entire input dataset in the output file, leave the default
  /// value, `$`. If you specify indexes that aren't within the dimension size
  /// of the joined dataset, you get an error.
  ///
  /// Examples: `"$"`, `"$[0,5:]"`, `"$['id','SageMakerOutput']"`
  final String outputFilter;

  /// Specifies the source of the data to join with the transformed data. The
  /// valid values are `None` and `Input` The default value is `None` which
  /// specifies not to join the input with the transformed data. If you want the
  /// batch transform job to join the original input data with the transformed
  /// data, set `JoinSource` to `Input`.
  ///
  /// For JSON or JSONLines objects, such as a JSON array, Amazon SageMaker adds
  /// the transformed data to the input JSON object in an attribute called
  /// `SageMakerOutput`. The joined result for JSON must be a key-value pair
  /// object. If the input is not a key-value pair object, Amazon SageMaker
  /// creates a new JSON file. In the new JSON file, and the input data is
  /// stored under the `SageMakerInput` key and the results are stored in
  /// `SageMakerOutput`.
  ///
  /// For CSV files, Amazon SageMaker combines the transformed data with the
  /// input data at the end of the input data and stores it in the output file.
  /// The joined data has the joined input data followed by the transformed data
  /// and the output is a CSV file.
  final String joinSource;

  DataProcessing({
    this.inputFilter,
    this.outputFilter,
    this.joinSource,
  });
  static DataProcessing fromJson(Map<String, dynamic> json) => DataProcessing(
        inputFilter: json.containsKey('InputFilter')
            ? json['InputFilter'] as String
            : null,
        outputFilter: json.containsKey('OutputFilter')
            ? json['OutputFilter'] as String
            : null,
        joinSource: json.containsKey('JoinSource')
            ? json['JoinSource'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the location of the channel data.
class DataSource {
  /// The S3 location of the data source that is associated with a channel.
  final S3DataSource s3DataSource;

  /// The file system that is associated with a channel.
  final FileSystemDataSource fileSystemDataSource;

  DataSource({
    this.s3DataSource,
    this.fileSystemDataSource,
  });
  static DataSource fromJson(Map<String, dynamic> json) => DataSource(
        s3DataSource: json.containsKey('S3DataSource')
            ? S3DataSource.fromJson(json['S3DataSource'])
            : null,
        fileSystemDataSource: json.containsKey('FileSystemDataSource')
            ? FileSystemDataSource.fromJson(json['FileSystemDataSource'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteTagsOutput {
  DeleteTagsOutput();
  static DeleteTagsOutput fromJson(Map<String, dynamic> json) =>
      DeleteTagsOutput();
}

class DeleteWorkteamResponse {
  /// Returns `true` if the work team was successfully deleted; otherwise,
  /// returns `false`.
  final bool success;

  DeleteWorkteamResponse({
    @required this.success,
  });
  static DeleteWorkteamResponse fromJson(Map<String, dynamic> json) =>
      DeleteWorkteamResponse(
        success: json['Success'] as bool,
      );
}

/// Gets the Amazon EC2 Container Registry path of the docker image of the model
/// that is hosted in this ProductionVariant.
///
/// If you used the `registry/repository[:tag]` form to specify the image path
/// of the primary container when you created the model hosted in this
/// `ProductionVariant`, the path resolves to a path of the form
/// `registry/repository[@digest]`. A digest is a hash value that identifies a
/// specific version of an image. For information about Amazon ECR paths, see
/// [Pulling an Image](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html)
/// in the _Amazon ECR User Guide_.
class DeployedImage {
  /// The image path you specified when you created the model.
  final String specifiedImage;

  /// The specific digest path of the image hosted in this `ProductionVariant`.
  final String resolvedImage;

  /// The date and time when the image path for the model resolved to the
  /// `ResolvedImage`
  final DateTime resolutionTime;

  DeployedImage({
    this.specifiedImage,
    this.resolvedImage,
    this.resolutionTime,
  });
  static DeployedImage fromJson(Map<String, dynamic> json) => DeployedImage(
        specifiedImage: json.containsKey('SpecifiedImage')
            ? json['SpecifiedImage'] as String
            : null,
        resolvedImage: json.containsKey('ResolvedImage')
            ? json['ResolvedImage'] as String
            : null,
        resolutionTime: json.containsKey('ResolutionTime')
            ? DateTime.parse(json['ResolutionTime'])
            : null,
      );
}

class DescribeAlgorithmOutput {
  /// The name of the algorithm being described.
  final String algorithmName;

  /// The Amazon Resource Name (ARN) of the algorithm.
  final String algorithmArn;

  /// A brief summary about the algorithm.
  final String algorithmDescription;

  /// A timestamp specifying when the algorithm was created.
  final DateTime creationTime;

  /// Details about training jobs run by this algorithm.
  final TrainingSpecification trainingSpecification;

  /// Details about inference jobs that the algorithm runs.
  final InferenceSpecification inferenceSpecification;

  /// Details about configurations for one or more training jobs that Amazon
  /// SageMaker runs to test the algorithm.
  final AlgorithmValidationSpecification validationSpecification;

  /// The current status of the algorithm.
  final String algorithmStatus;

  /// Details about the current status of the algorithm.
  final AlgorithmStatusDetails algorithmStatusDetails;

  /// The product identifier of the algorithm.
  final String productId;

  /// Whether the algorithm is certified to be listed in AWS Marketplace.
  final bool certifyForMarketplace;

  DescribeAlgorithmOutput({
    @required this.algorithmName,
    @required this.algorithmArn,
    this.algorithmDescription,
    @required this.creationTime,
    @required this.trainingSpecification,
    this.inferenceSpecification,
    this.validationSpecification,
    @required this.algorithmStatus,
    @required this.algorithmStatusDetails,
    this.productId,
    this.certifyForMarketplace,
  });
  static DescribeAlgorithmOutput fromJson(Map<String, dynamic> json) =>
      DescribeAlgorithmOutput(
        algorithmName: json['AlgorithmName'] as String,
        algorithmArn: json['AlgorithmArn'] as String,
        algorithmDescription: json.containsKey('AlgorithmDescription')
            ? json['AlgorithmDescription'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        trainingSpecification:
            TrainingSpecification.fromJson(json['TrainingSpecification']),
        inferenceSpecification: json.containsKey('InferenceSpecification')
            ? InferenceSpecification.fromJson(json['InferenceSpecification'])
            : null,
        validationSpecification: json.containsKey('ValidationSpecification')
            ? AlgorithmValidationSpecification.fromJson(
                json['ValidationSpecification'])
            : null,
        algorithmStatus: json['AlgorithmStatus'] as String,
        algorithmStatusDetails:
            AlgorithmStatusDetails.fromJson(json['AlgorithmStatusDetails']),
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
        certifyForMarketplace: json.containsKey('CertifyForMarketplace')
            ? json['CertifyForMarketplace'] as bool
            : null,
      );
}

class DescribeCodeRepositoryOutput {
  /// The name of the Git repository.
  final String codeRepositoryName;

  /// The Amazon Resource Name (ARN) of the Git repository.
  final String codeRepositoryArn;

  /// The date and time that the repository was created.
  final DateTime creationTime;

  /// The date and time that the repository was last changed.
  final DateTime lastModifiedTime;

  /// Configuration details about the repository, including the URL where the
  /// repository is located, the default branch, and the Amazon Resource Name
  /// (ARN) of the AWS Secrets Manager secret that contains the credentials used
  /// to access the repository.
  final GitConfig gitConfig;

  DescribeCodeRepositoryOutput({
    @required this.codeRepositoryName,
    @required this.codeRepositoryArn,
    @required this.creationTime,
    @required this.lastModifiedTime,
    this.gitConfig,
  });
  static DescribeCodeRepositoryOutput fromJson(Map<String, dynamic> json) =>
      DescribeCodeRepositoryOutput(
        codeRepositoryName: json['CodeRepositoryName'] as String,
        codeRepositoryArn: json['CodeRepositoryArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        gitConfig: json.containsKey('GitConfig')
            ? GitConfig.fromJson(json['GitConfig'])
            : null,
      );
}

class DescribeCompilationJobResponse {
  /// The name of the model compilation job.
  final String compilationJobName;

  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
  /// assumes to perform the model compilation job.
  final String compilationJobArn;

  /// The status of the model compilation job.
  final String compilationJobStatus;

  /// The time when the model compilation job started the `CompilationJob`
  /// instances.
  ///
  /// You are billed for the time between this timestamp and the timestamp in
  /// the DescribeCompilationJobResponse$CompilationEndTime field. In Amazon
  /// CloudWatch Logs, the start time might be later than this time. That's
  /// because it takes time to download the compilation job, which depends on
  /// the size of the compilation job container.
  final DateTime compilationStartTime;

  /// The time when the model compilation job on a compilation job instance
  /// ended. For a successful or stopped job, this is when the job's model
  /// artifacts have finished uploading. For a failed job, this is when Amazon
  /// SageMaker detected that the job failed.
  final DateTime compilationEndTime;

  /// Specifies a limit to how long a model compilation job can run. When the
  /// job reaches the time limit, Amazon SageMaker ends the compilation job. Use
  /// this API to cap model training costs.
  final StoppingCondition stoppingCondition;

  /// The time that the model compilation job was created.
  final DateTime creationTime;

  /// The time that the status of the model compilation job was last modified.
  final DateTime lastModifiedTime;

  /// If a model compilation job failed, the reason it failed.
  final String failureReason;

  /// Information about the location in Amazon S3 that has been configured for
  /// storing the model artifacts used in the compilation job.
  final ModelArtifacts modelArtifacts;

  /// The Amazon Resource Name (ARN) of the model compilation job.
  final String roleArn;

  /// Information about the location in Amazon S3 of the input model artifacts,
  /// the name and shape of the expected data inputs, and the framework in which
  /// the model was trained.
  final InputConfig inputConfig;

  /// Information about the output location for the compiled model and the
  /// target device that the model runs on.
  final OutputConfig outputConfig;

  DescribeCompilationJobResponse({
    @required this.compilationJobName,
    @required this.compilationJobArn,
    @required this.compilationJobStatus,
    this.compilationStartTime,
    this.compilationEndTime,
    @required this.stoppingCondition,
    @required this.creationTime,
    @required this.lastModifiedTime,
    @required this.failureReason,
    @required this.modelArtifacts,
    @required this.roleArn,
    @required this.inputConfig,
    @required this.outputConfig,
  });
  static DescribeCompilationJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeCompilationJobResponse(
        compilationJobName: json['CompilationJobName'] as String,
        compilationJobArn: json['CompilationJobArn'] as String,
        compilationJobStatus: json['CompilationJobStatus'] as String,
        compilationStartTime: json.containsKey('CompilationStartTime')
            ? DateTime.parse(json['CompilationStartTime'])
            : null,
        compilationEndTime: json.containsKey('CompilationEndTime')
            ? DateTime.parse(json['CompilationEndTime'])
            : null,
        stoppingCondition:
            StoppingCondition.fromJson(json['StoppingCondition']),
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        failureReason: json['FailureReason'] as String,
        modelArtifacts: ModelArtifacts.fromJson(json['ModelArtifacts']),
        roleArn: json['RoleArn'] as String,
        inputConfig: InputConfig.fromJson(json['InputConfig']),
        outputConfig: OutputConfig.fromJson(json['OutputConfig']),
      );
}

class DescribeEndpointConfigOutput {
  /// Name of the Amazon SageMaker endpoint configuration.
  final String endpointConfigName;

  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  final String endpointConfigArn;

  /// An array of `ProductionVariant` objects, one for each model that you want
  /// to host at this endpoint.
  final List<ProductionVariant> productionVariants;

  /// AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on
  /// the ML storage volume attached to the instance.
  final String kmsKeyId;

  /// A timestamp that shows when the endpoint configuration was created.
  final DateTime creationTime;

  DescribeEndpointConfigOutput({
    @required this.endpointConfigName,
    @required this.endpointConfigArn,
    @required this.productionVariants,
    this.kmsKeyId,
    @required this.creationTime,
  });
  static DescribeEndpointConfigOutput fromJson(Map<String, dynamic> json) =>
      DescribeEndpointConfigOutput(
        endpointConfigName: json['EndpointConfigName'] as String,
        endpointConfigArn: json['EndpointConfigArn'] as String,
        productionVariants: (json['ProductionVariants'] as List)
            .map((e) => ProductionVariant.fromJson(e))
            .toList(),
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        creationTime: DateTime.parse(json['CreationTime']),
      );
}

class DescribeEndpointOutput {
  /// Name of the endpoint.
  final String endpointName;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  /// The name of the endpoint configuration associated with this endpoint.
  final String endpointConfigName;

  ///  An array of ProductionVariantSummary objects, one for each model hosted
  /// behind this endpoint.
  final List<ProductionVariantSummary> productionVariants;

  /// The status of the endpoint.
  ///
  /// *    `OutOfService`: Endpoint is not available to take incoming requests.
  ///
  /// *    `Creating`: CreateEndpoint is executing.
  ///
  /// *    `Updating`: UpdateEndpoint or UpdateEndpointWeightsAndCapacities is
  /// executing.
  ///
  /// *    `SystemUpdating`: Endpoint is undergoing maintenance and cannot be
  /// updated or deleted or re-scaled until it has completed. This maintenance
  /// operation does not change any customer-specified values such as VPC
  /// config, KMS encryption, model, instance type, or instance count.
  ///
  /// *    `RollingBack`: Endpoint fails to scale up or down or change its
  /// variant weight and is in the process of rolling back to its previous
  /// configuration. Once the rollback completes, endpoint returns to an
  /// `InService` status. This transitional status only applies to an endpoint
  /// that has autoscaling enabled and is undergoing variant weight or capacity
  /// changes as part of an UpdateEndpointWeightsAndCapacities call or when the
  /// UpdateEndpointWeightsAndCapacities operation is called explicitly.
  ///
  /// *    `InService`: Endpoint is available to process incoming requests.
  ///
  /// *    `Deleting`: DeleteEndpoint is executing.
  ///
  /// *    `Failed`: Endpoint could not be created, updated, or re-scaled. Use
  /// DescribeEndpointOutput$FailureReason for information about the failure.
  /// DeleteEndpoint is the only operation that can be performed on a failed
  /// endpoint.
  final String endpointStatus;

  /// If the status of the endpoint is `Failed`, the reason why it failed.
  final String failureReason;

  /// A timestamp that shows when the endpoint was created.
  final DateTime creationTime;

  /// A timestamp that shows when the endpoint was last modified.
  final DateTime lastModifiedTime;

  DescribeEndpointOutput({
    @required this.endpointName,
    @required this.endpointArn,
    @required this.endpointConfigName,
    this.productionVariants,
    @required this.endpointStatus,
    this.failureReason,
    @required this.creationTime,
    @required this.lastModifiedTime,
  });
  static DescribeEndpointOutput fromJson(Map<String, dynamic> json) =>
      DescribeEndpointOutput(
        endpointName: json['EndpointName'] as String,
        endpointArn: json['EndpointArn'] as String,
        endpointConfigName: json['EndpointConfigName'] as String,
        productionVariants: json.containsKey('ProductionVariants')
            ? (json['ProductionVariants'] as List)
                .map((e) => ProductionVariantSummary.fromJson(e))
                .toList()
            : null,
        endpointStatus: json['EndpointStatus'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
      );
}

class DescribeHyperParameterTuningJobResponse {
  /// The name of the tuning job.
  final String hyperParameterTuningJobName;

  /// The Amazon Resource Name (ARN) of the tuning job.
  final String hyperParameterTuningJobArn;

  /// The HyperParameterTuningJobConfig object that specifies the configuration
  /// of the tuning job.
  final HyperParameterTuningJobConfig hyperParameterTuningJobConfig;

  /// The HyperParameterTrainingJobDefinition object that specifies the
  /// definition of the training jobs that this tuning job launches.
  final HyperParameterTrainingJobDefinition trainingJobDefinition;

  /// The status of the tuning job: InProgress, Completed, Failed, Stopping, or
  /// Stopped.
  final String hyperParameterTuningJobStatus;

  /// The date and time that the tuning job started.
  final DateTime creationTime;

  /// The date and time that the tuning job ended.
  final DateTime hyperParameterTuningEndTime;

  /// The date and time that the status of the tuning job was modified.
  final DateTime lastModifiedTime;

  /// The TrainingJobStatusCounters object that specifies the number of training
  /// jobs, categorized by status, that this tuning job launched.
  final TrainingJobStatusCounters trainingJobStatusCounters;

  /// The ObjectiveStatusCounters object that specifies the number of training
  /// jobs, categorized by the status of their final objective metric, that this
  /// tuning job launched.
  final ObjectiveStatusCounters objectiveStatusCounters;

  /// A TrainingJobSummary object that describes the training job that completed
  /// with the best current HyperParameterTuningJobObjective.
  final HyperParameterTrainingJobSummary bestTrainingJob;

  /// If the hyperparameter tuning job is an warm start tuning job with a
  /// `WarmStartType` of `IDENTICAL_DATA_AND_ALGORITHM`, this is the
  /// TrainingJobSummary for the training job with the best objective metric
  /// value of all training jobs launched by this tuning job and all parent jobs
  /// specified for the warm start tuning job.
  final HyperParameterTrainingJobSummary overallBestTrainingJob;

  /// The configuration for starting the hyperparameter parameter tuning job
  /// using one or more previous tuning jobs as a starting point. The results of
  /// previous tuning jobs are used to inform which combinations of
  /// hyperparameters to search over in the new tuning job.
  final HyperParameterTuningJobWarmStartConfig warmStartConfig;

  /// If the tuning job failed, the reason it failed.
  final String failureReason;

  DescribeHyperParameterTuningJobResponse({
    @required this.hyperParameterTuningJobName,
    @required this.hyperParameterTuningJobArn,
    @required this.hyperParameterTuningJobConfig,
    this.trainingJobDefinition,
    @required this.hyperParameterTuningJobStatus,
    @required this.creationTime,
    this.hyperParameterTuningEndTime,
    this.lastModifiedTime,
    @required this.trainingJobStatusCounters,
    @required this.objectiveStatusCounters,
    this.bestTrainingJob,
    this.overallBestTrainingJob,
    this.warmStartConfig,
    this.failureReason,
  });
  static DescribeHyperParameterTuningJobResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeHyperParameterTuningJobResponse(
        hyperParameterTuningJobName:
            json['HyperParameterTuningJobName'] as String,
        hyperParameterTuningJobArn:
            json['HyperParameterTuningJobArn'] as String,
        hyperParameterTuningJobConfig: HyperParameterTuningJobConfig.fromJson(
            json['HyperParameterTuningJobConfig']),
        trainingJobDefinition: json.containsKey('TrainingJobDefinition')
            ? HyperParameterTrainingJobDefinition.fromJson(
                json['TrainingJobDefinition'])
            : null,
        hyperParameterTuningJobStatus:
            json['HyperParameterTuningJobStatus'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        hyperParameterTuningEndTime:
            json.containsKey('HyperParameterTuningEndTime')
                ? DateTime.parse(json['HyperParameterTuningEndTime'])
                : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        trainingJobStatusCounters: TrainingJobStatusCounters.fromJson(
            json['TrainingJobStatusCounters']),
        objectiveStatusCounters:
            ObjectiveStatusCounters.fromJson(json['ObjectiveStatusCounters']),
        bestTrainingJob: json.containsKey('BestTrainingJob')
            ? HyperParameterTrainingJobSummary.fromJson(json['BestTrainingJob'])
            : null,
        overallBestTrainingJob: json.containsKey('OverallBestTrainingJob')
            ? HyperParameterTrainingJobSummary.fromJson(
                json['OverallBestTrainingJob'])
            : null,
        warmStartConfig: json.containsKey('WarmStartConfig')
            ? HyperParameterTuningJobWarmStartConfig.fromJson(
                json['WarmStartConfig'])
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

class DescribeLabelingJobResponse {
  /// The processing status of the labeling job.
  final String labelingJobStatus;

  /// Provides a breakdown of the number of data objects labeled by humans, the
  /// number of objects labeled by machine, the number of objects than couldn't
  /// be labeled, and the total number of objects labeled.
  final LabelCounters labelCounters;

  /// If the job failed, the reason that it failed.
  final String failureReason;

  /// The date and time that the labeling job was created.
  final DateTime creationTime;

  /// The date and time that the labeling job was last updated.
  final DateTime lastModifiedTime;

  /// A unique identifier for work done as part of a labeling job.
  final String jobReferenceCode;

  /// The name assigned to the labeling job when it was created.
  final String labelingJobName;

  /// The Amazon Resource Name (ARN) of the labeling job.
  final String labelingJobArn;

  /// The attribute used as the label in the output manifest file.
  final String labelAttributeName;

  /// Input configuration information for the labeling job, such as the Amazon
  /// S3 location of the data objects and the location of the manifest file that
  /// describes the data objects.
  final LabelingJobInputConfig inputConfig;

  /// The location of the job's output data and the AWS Key Management Service
  /// key ID for the key used to encrypt the output data, if any.
  final LabelingJobOutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) that Amazon SageMaker assumes to perform
  /// tasks on your behalf during data labeling.
  final String roleArn;

  /// The S3 location of the JSON file that defines the categories used to label
  /// data objects.
  ///
  /// The file is a JSON structure in the following format:
  ///
  ///  `{`
  ///
  ///   `"document-version": "2018-11-28"`
  ///
  ///   `"labels": [`
  ///
  ///   `{`
  ///
  ///   `"label": "_label 1_"`
  ///
  ///   `},`
  ///
  ///   `{`
  ///
  ///   `"label": "_label 2_"`
  ///
  ///   `},`
  ///
  ///   `...`
  ///
  ///   `{`
  ///
  ///   `"label": "_label n_"`
  ///
  ///   `}`
  ///
  ///   `]`
  ///
  ///  `}`
  final String labelCategoryConfigS3Uri;

  /// A set of conditions for stopping a labeling job. If any of the conditions
  /// are met, the job is automatically stopped.
  final LabelingJobStoppingConditions stoppingConditions;

  /// Configuration information for automated data labeling.
  final LabelingJobAlgorithmsConfig labelingJobAlgorithmsConfig;

  /// Configuration information required for human workers to complete a
  /// labeling task.
  final HumanTaskConfig humanTaskConfig;

  /// An array of key/value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  final List<Tag> tags;

  /// The location of the output produced by the labeling job.
  final LabelingJobOutput labelingJobOutput;

  DescribeLabelingJobResponse({
    @required this.labelingJobStatus,
    @required this.labelCounters,
    this.failureReason,
    @required this.creationTime,
    @required this.lastModifiedTime,
    @required this.jobReferenceCode,
    @required this.labelingJobName,
    @required this.labelingJobArn,
    this.labelAttributeName,
    @required this.inputConfig,
    @required this.outputConfig,
    @required this.roleArn,
    this.labelCategoryConfigS3Uri,
    this.stoppingConditions,
    this.labelingJobAlgorithmsConfig,
    @required this.humanTaskConfig,
    this.tags,
    this.labelingJobOutput,
  });
  static DescribeLabelingJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeLabelingJobResponse(
        labelingJobStatus: json['LabelingJobStatus'] as String,
        labelCounters: LabelCounters.fromJson(json['LabelCounters']),
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        jobReferenceCode: json['JobReferenceCode'] as String,
        labelingJobName: json['LabelingJobName'] as String,
        labelingJobArn: json['LabelingJobArn'] as String,
        labelAttributeName: json.containsKey('LabelAttributeName')
            ? json['LabelAttributeName'] as String
            : null,
        inputConfig: LabelingJobInputConfig.fromJson(json['InputConfig']),
        outputConfig: LabelingJobOutputConfig.fromJson(json['OutputConfig']),
        roleArn: json['RoleArn'] as String,
        labelCategoryConfigS3Uri: json.containsKey('LabelCategoryConfigS3Uri')
            ? json['LabelCategoryConfigS3Uri'] as String
            : null,
        stoppingConditions: json.containsKey('StoppingConditions')
            ? LabelingJobStoppingConditions.fromJson(json['StoppingConditions'])
            : null,
        labelingJobAlgorithmsConfig:
            json.containsKey('LabelingJobAlgorithmsConfig')
                ? LabelingJobAlgorithmsConfig.fromJson(
                    json['LabelingJobAlgorithmsConfig'])
                : null,
        humanTaskConfig: HumanTaskConfig.fromJson(json['HumanTaskConfig']),
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        labelingJobOutput: json.containsKey('LabelingJobOutput')
            ? LabelingJobOutput.fromJson(json['LabelingJobOutput'])
            : null,
      );
}

class DescribeModelOutput {
  /// Name of the Amazon SageMaker model.
  final String modelName;

  /// The location of the primary inference code, associated artifacts, and
  /// custom environment map that the inference code uses when it is deployed in
  /// production.
  final ContainerDefinition primaryContainer;

  /// The containers in the inference pipeline.
  final List<ContainerDefinition> containers;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// model.
  final String executionRoleArn;

  /// A VpcConfig object that specifies the VPC that this model has access to.
  /// For more information, see
  /// [Protect Endpoints by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html)
  final VpcConfig vpcConfig;

  /// A timestamp that shows when the model was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model.
  final String modelArn;

  /// If `True`, no inbound or outbound network calls can be made to or from the
  /// model container.
  ///
  ///
  ///
  /// The Semantic Segmentation built-in algorithm does not support network
  /// isolation.
  final bool enableNetworkIsolation;

  DescribeModelOutput({
    @required this.modelName,
    this.primaryContainer,
    this.containers,
    @required this.executionRoleArn,
    this.vpcConfig,
    @required this.creationTime,
    @required this.modelArn,
    this.enableNetworkIsolation,
  });
  static DescribeModelOutput fromJson(Map<String, dynamic> json) =>
      DescribeModelOutput(
        modelName: json['ModelName'] as String,
        primaryContainer: json.containsKey('PrimaryContainer')
            ? ContainerDefinition.fromJson(json['PrimaryContainer'])
            : null,
        containers: json.containsKey('Containers')
            ? (json['Containers'] as List)
                .map((e) => ContainerDefinition.fromJson(e))
                .toList()
            : null,
        executionRoleArn: json['ExecutionRoleArn'] as String,
        vpcConfig: json.containsKey('VpcConfig')
            ? VpcConfig.fromJson(json['VpcConfig'])
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        modelArn: json['ModelArn'] as String,
        enableNetworkIsolation: json.containsKey('EnableNetworkIsolation')
            ? json['EnableNetworkIsolation'] as bool
            : null,
      );
}

class DescribeModelPackageOutput {
  /// The name of the model package being described.
  final String modelPackageName;

  /// The Amazon Resource Name (ARN) of the model package.
  final String modelPackageArn;

  /// A brief summary of the model package.
  final String modelPackageDescription;

  /// A timestamp specifying when the model package was created.
  final DateTime creationTime;

  /// Details about inference jobs that can be run with models based on this
  /// model package.
  final InferenceSpecification inferenceSpecification;

  /// Details about the algorithm that was used to create the model package.
  final SourceAlgorithmSpecification sourceAlgorithmSpecification;

  /// Configurations for one or more transform jobs that Amazon SageMaker runs
  /// to test the model package.
  final ModelPackageValidationSpecification validationSpecification;

  /// The current status of the model package.
  final String modelPackageStatus;

  /// Details about the current status of the model package.
  final ModelPackageStatusDetails modelPackageStatusDetails;

  /// Whether the model package is certified for listing on AWS Marketplace.
  final bool certifyForMarketplace;

  DescribeModelPackageOutput({
    @required this.modelPackageName,
    @required this.modelPackageArn,
    this.modelPackageDescription,
    @required this.creationTime,
    this.inferenceSpecification,
    this.sourceAlgorithmSpecification,
    this.validationSpecification,
    @required this.modelPackageStatus,
    @required this.modelPackageStatusDetails,
    this.certifyForMarketplace,
  });
  static DescribeModelPackageOutput fromJson(Map<String, dynamic> json) =>
      DescribeModelPackageOutput(
        modelPackageName: json['ModelPackageName'] as String,
        modelPackageArn: json['ModelPackageArn'] as String,
        modelPackageDescription: json.containsKey('ModelPackageDescription')
            ? json['ModelPackageDescription'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        inferenceSpecification: json.containsKey('InferenceSpecification')
            ? InferenceSpecification.fromJson(json['InferenceSpecification'])
            : null,
        sourceAlgorithmSpecification:
            json.containsKey('SourceAlgorithmSpecification')
                ? SourceAlgorithmSpecification.fromJson(
                    json['SourceAlgorithmSpecification'])
                : null,
        validationSpecification: json.containsKey('ValidationSpecification')
            ? ModelPackageValidationSpecification.fromJson(
                json['ValidationSpecification'])
            : null,
        modelPackageStatus: json['ModelPackageStatus'] as String,
        modelPackageStatusDetails: ModelPackageStatusDetails.fromJson(
            json['ModelPackageStatusDetails']),
        certifyForMarketplace: json.containsKey('CertifyForMarketplace')
            ? json['CertifyForMarketplace'] as bool
            : null,
      );
}

class DescribeNotebookInstanceLifecycleConfigOutput {
  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  final String notebookInstanceLifecycleConfigArn;

  /// The name of the lifecycle configuration.
  final String notebookInstanceLifecycleConfigName;

  /// The shell script that runs only once, when you create a notebook instance.
  final List<NotebookInstanceLifecycleHook> onCreate;

  /// The shell script that runs every time you start a notebook instance,
  /// including when you create the notebook instance.
  final List<NotebookInstanceLifecycleHook> onStart;

  /// A timestamp that tells when the lifecycle configuration was last modified.
  final DateTime lastModifiedTime;

  /// A timestamp that tells when the lifecycle configuration was created.
  final DateTime creationTime;

  DescribeNotebookInstanceLifecycleConfigOutput({
    this.notebookInstanceLifecycleConfigArn,
    this.notebookInstanceLifecycleConfigName,
    this.onCreate,
    this.onStart,
    this.lastModifiedTime,
    this.creationTime,
  });
  static DescribeNotebookInstanceLifecycleConfigOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeNotebookInstanceLifecycleConfigOutput(
        notebookInstanceLifecycleConfigArn:
            json.containsKey('NotebookInstanceLifecycleConfigArn')
                ? json['NotebookInstanceLifecycleConfigArn'] as String
                : null,
        notebookInstanceLifecycleConfigName:
            json.containsKey('NotebookInstanceLifecycleConfigName')
                ? json['NotebookInstanceLifecycleConfigName'] as String
                : null,
        onCreate: json.containsKey('OnCreate')
            ? (json['OnCreate'] as List)
                .map((e) => NotebookInstanceLifecycleHook.fromJson(e))
                .toList()
            : null,
        onStart: json.containsKey('OnStart')
            ? (json['OnStart'] as List)
                .map((e) => NotebookInstanceLifecycleHook.fromJson(e))
                .toList()
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

class DescribeNotebookInstanceOutput {
  /// The Amazon Resource Name (ARN) of the notebook instance.
  final String notebookInstanceArn;

  /// The name of the Amazon SageMaker notebook instance.
  final String notebookInstanceName;

  /// The status of the notebook instance.
  final String notebookInstanceStatus;

  /// If status is `Failed`, the reason it failed.
  final String failureReason;

  /// The URL that you use to connect to the Jupyter notebook that is running in
  /// your notebook instance.
  final String url;

  /// The type of ML compute instance running on the notebook instance.
  final String instanceType;

  /// The ID of the VPC subnet.
  final String subnetId;

  /// The IDs of the VPC security groups.
  final List<String> securityGroups;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the
  /// instance.
  final String roleArn;

  /// The AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it
  /// on the ML storage volume attached to the instance.
  final String kmsKeyId;

  /// The network interface IDs that Amazon SageMaker created at the time of
  /// creating the instance.
  final String networkInterfaceId;

  /// A timestamp. Use this parameter to retrieve the time when the notebook
  /// instance was last modified.
  final DateTime lastModifiedTime;

  /// A timestamp. Use this parameter to return the time when the notebook
  /// instance was created
  final DateTime creationTime;

  /// Returns the name of a notebook instance lifecycle configuration.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html)
  final String notebookInstanceLifecycleConfigName;

  /// Describes whether Amazon SageMaker provides internet access to the
  /// notebook instance. If this value is set to _Disabled_, the notebook
  /// instance does not have internet access, and cannot connect to Amazon
  /// SageMaker training and endpoint services.
  ///
  /// For more information, see
  /// [Notebook Instances Are Internet-Enabled by Default](https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access).
  final String directInternetAccess;

  /// The size, in GB, of the ML storage volume attached to the notebook
  /// instance.
  final int volumeSizeInGB;

  /// A list of the Elastic Inference (EI) instance types associated with this
  /// notebook instance. Currently only one EI instance type can be associated
  /// with a notebook instance. For more information, see
  /// [Using Elastic Inference in Amazon SageMaker](sagemaker/latest/dg/ei.html).
  final List<String> acceleratorTypes;

  /// The Git repository associated with the notebook instance as its default
  /// code repository. This can be either the name of a Git repository stored as
  /// a resource in your account, or the URL of a Git repository in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. When you open a notebook instance, it
  /// opens in the directory that contains this repository. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  final String defaultCodeRepository;

  /// An array of up to three Git repositories associated with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. These repositories are cloned at the same
  /// level as the default repository of your notebook instance. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  final List<String> additionalCodeRepositories;

  /// Whether root access is enabled or disabled for users of the notebook
  /// instance.
  ///
  ///
  ///
  /// Lifecycle configurations need root access to be able to set up a notebook
  /// instance. Because of this, lifecycle configurations associated with a
  /// notebook instance always run with root access even if you disable root
  /// access for users.
  final String rootAccess;

  DescribeNotebookInstanceOutput({
    this.notebookInstanceArn,
    this.notebookInstanceName,
    this.notebookInstanceStatus,
    this.failureReason,
    this.url,
    this.instanceType,
    this.subnetId,
    this.securityGroups,
    this.roleArn,
    this.kmsKeyId,
    this.networkInterfaceId,
    this.lastModifiedTime,
    this.creationTime,
    this.notebookInstanceLifecycleConfigName,
    this.directInternetAccess,
    this.volumeSizeInGB,
    this.acceleratorTypes,
    this.defaultCodeRepository,
    this.additionalCodeRepositories,
    this.rootAccess,
  });
  static DescribeNotebookInstanceOutput fromJson(Map<String, dynamic> json) =>
      DescribeNotebookInstanceOutput(
        notebookInstanceArn: json.containsKey('NotebookInstanceArn')
            ? json['NotebookInstanceArn'] as String
            : null,
        notebookInstanceName: json.containsKey('NotebookInstanceName')
            ? json['NotebookInstanceName'] as String
            : null,
        notebookInstanceStatus: json.containsKey('NotebookInstanceStatus')
            ? json['NotebookInstanceStatus'] as String
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        subnetId:
            json.containsKey('SubnetId') ? json['SubnetId'] as String : null,
        securityGroups: json.containsKey('SecurityGroups')
            ? (json['SecurityGroups'] as List).map((e) => e as String).toList()
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        networkInterfaceId: json.containsKey('NetworkInterfaceId')
            ? json['NetworkInterfaceId'] as String
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        notebookInstanceLifecycleConfigName:
            json.containsKey('NotebookInstanceLifecycleConfigName')
                ? json['NotebookInstanceLifecycleConfigName'] as String
                : null,
        directInternetAccess: json.containsKey('DirectInternetAccess')
            ? json['DirectInternetAccess'] as String
            : null,
        volumeSizeInGB: json.containsKey('VolumeSizeInGB')
            ? json['VolumeSizeInGB'] as int
            : null,
        acceleratorTypes: json.containsKey('AcceleratorTypes')
            ? (json['AcceleratorTypes'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        defaultCodeRepository: json.containsKey('DefaultCodeRepository')
            ? json['DefaultCodeRepository'] as String
            : null,
        additionalCodeRepositories:
            json.containsKey('AdditionalCodeRepositories')
                ? (json['AdditionalCodeRepositories'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
        rootAccess: json.containsKey('RootAccess')
            ? json['RootAccess'] as String
            : null,
      );
}

class DescribeSubscribedWorkteamResponse {
  /// A `Workteam` instance that contains information about the work team.
  final SubscribedWorkteam subscribedWorkteam;

  DescribeSubscribedWorkteamResponse({
    @required this.subscribedWorkteam,
  });
  static DescribeSubscribedWorkteamResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeSubscribedWorkteamResponse(
        subscribedWorkteam:
            SubscribedWorkteam.fromJson(json['SubscribedWorkteam']),
      );
}

class DescribeTrainingJobResponse {
  ///  Name of the model training job.
  final String trainingJobName;

  /// The Amazon Resource Name (ARN) of the training job.
  final String trainingJobArn;

  /// The Amazon Resource Name (ARN) of the associated hyperparameter tuning job
  /// if the training job was launched by a hyperparameter tuning job.
  final String tuningJobArn;

  /// The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth
  /// labeling job that created the transform or training job.
  final String labelingJobArn;

  /// Information about the Amazon S3 location that is configured for storing
  /// model artifacts.
  final ModelArtifacts modelArtifacts;

  /// The status of the training job.
  ///
  /// Amazon SageMaker provides the following training job statuses:
  ///
  /// *    `InProgress` - The training is in progress.
  ///
  /// *    `Completed` - The training job has completed.
  ///
  /// *    `Failed` - The training job has failed. To see the reason for the
  /// failure, see the `FailureReason` field in the response to a
  /// `DescribeTrainingJobResponse` call.
  ///
  /// *    `Stopping` - The training job is stopping.
  ///
  /// *    `Stopped` - The training job has stopped.
  ///
  ///
  /// For more detailed information, see `SecondaryStatus`.
  final String trainingJobStatus;

  ///  Provides detailed information about the state of the training job. For
  /// detailed information on the secondary status of the training job, see
  /// `StatusMessage` under SecondaryStatusTransition.
  ///
  /// Amazon SageMaker provides primary statuses and secondary statuses that
  /// apply to each of them:
  ///
  /// InProgress
  ///
  /// *    `Starting` - Starting the training job.
  ///
  /// *    `Downloading` - An optional stage for algorithms that support `File`
  /// training input mode. It indicates that data is being downloaded to the ML
  /// storage volumes.
  ///
  /// *    `Training` - Training is in progress.
  ///
  /// *    `Uploading` - Training is complete and the model artifacts are being
  /// uploaded to the S3 location.
  ///
  ///
  /// Completed
  ///
  /// *    `Completed` - The training job has completed.
  ///
  ///
  /// Failed
  ///
  /// *    `Failed` - The training job has failed. The reason for the failure is
  /// returned in the `FailureReason` field of `DescribeTrainingJobResponse`.
  ///
  ///
  /// Stopped
  ///
  /// *    `MaxRuntimeExceeded` - The job stopped because it exceeded the
  /// maximum allowed runtime.
  ///
  /// *    `MaxWaitTmeExceeded` - The job stopped because it exceeded the
  /// maximum allowed wait time.
  ///
  /// *    `Interrupted` - The job stopped because the managed spot training
  /// instances were interrupted.
  ///
  /// *    `Stopped` - The training job has stopped.
  ///
  ///
  /// Stopping
  ///
  /// *    `Stopping` - Stopping the training job.
  ///
  ///
  ///  Valid values for `SecondaryStatus` are subject to change.
  ///
  /// We no longer support the following secondary statuses:
  ///
  /// *    `LaunchingMLInstances`
  ///
  /// *    `PreparingTrainingStack`
  ///
  /// *    `DownloadingTrainingImage`
  final String secondaryStatus;

  /// If the training job failed, the reason it failed.
  final String failureReason;

  /// Algorithm-specific parameters.
  final Map<String, String> hyperParameters;

  /// Information about the algorithm used for training, and algorithm metadata.
  final AlgorithmSpecification algorithmSpecification;

  /// The AWS Identity and Access Management (IAM) role configured for the
  /// training job.
  final String roleArn;

  /// An array of `Channel` objects that describes each data input channel.
  final List<Channel> inputDataConfig;

  /// The S3 path where model artifacts that you configured when creating the
  /// job are stored. Amazon SageMaker creates subfolders for model artifacts.
  final OutputDataConfig outputDataConfig;

  /// Resources, including ML compute instances and ML storage volumes, that are
  /// configured for model training.
  final ResourceConfig resourceConfig;

  /// A VpcConfig object that specifies the VPC that this training job has
  /// access to. For more information, see
  /// [Protect Training Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html).
  final VpcConfig vpcConfig;

  /// Specifies a limit to how long a model training job can run. It also
  /// specifies the maximum time to wait for a spot instance. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this
  /// API to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the `SIGTERM` signal,
  /// which delays job termination for 120 seconds. Algorithms can use this
  /// 120-second window to save the model artifacts, so the results of training
  /// are not lost.
  final StoppingCondition stoppingCondition;

  /// A timestamp that indicates when the training job was created.
  final DateTime creationTime;

  /// Indicates the time when the training job starts on training instances. You
  /// are billed for the time interval between this time and the value of
  /// `TrainingEndTime`. The start time in CloudWatch Logs might be later than
  /// this time. The difference is due to the time it takes to download the
  /// training data and to the size of the training container.
  final DateTime trainingStartTime;

  /// Indicates the time when the training job ends on training instances. You
  /// are billed for the time interval between the value of `TrainingStartTime`
  /// and this time. For successful jobs and stopped jobs, this is the time
  /// after model artifacts are uploaded. For failed jobs, this is the time when
  /// Amazon SageMaker detects a job failure.
  final DateTime trainingEndTime;

  /// A timestamp that indicates when the status of the training job was last
  /// modified.
  final DateTime lastModifiedTime;

  /// A history of all of the secondary statuses that the training job has
  /// transitioned through.
  final List<SecondaryStatusTransition> secondaryStatusTransitions;

  /// A collection of `MetricData` objects that specify the names, values, and
  /// dates and times that the training algorithm emitted to Amazon CloudWatch.
  final List<MetricData> finalMetricDataList;

  /// If you want to allow inbound or outbound network calls, except for calls
  /// between peers within a training cluster for distributed training, choose
  /// `True`. If you enable network isolation for training jobs that are
  /// configured to use a VPC, Amazon SageMaker downloads and uploads customer
  /// data and model artifacts through the specified VPC, but the training
  /// container does not have network access.
  ///
  ///
  ///
  /// The Semantic Segmentation built-in algorithm does not support network
  /// isolation.
  final bool enableNetworkIsolation;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose `True`. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances,
  /// especially if you use a deep learning algorithms in distributed training.
  final bool enableInterContainerTrafficEncryption;

  /// A Boolean indicating whether managed spot training is enabled (`True`) or
  /// not (`False`).
  final bool enableManagedSpotTraining;

  final CheckpointConfig checkpointConfig;

  /// The training time in seconds.
  final int trainingTimeInSeconds;

  /// The billable time in seconds.
  ///
  /// You can calculate the savings from using managed spot training using the
  /// formula `(1 - BillableTimeInSeconds / TrainingTimeInSeconds) * 100`. For
  /// example, if `BillableTimeInSeconds` is 100 and `TrainingTimeInSeconds` is
  /// 500, the savings is 80%.
  final int billableTimeInSeconds;

  DescribeTrainingJobResponse({
    @required this.trainingJobName,
    @required this.trainingJobArn,
    this.tuningJobArn,
    this.labelingJobArn,
    @required this.modelArtifacts,
    @required this.trainingJobStatus,
    @required this.secondaryStatus,
    this.failureReason,
    this.hyperParameters,
    @required this.algorithmSpecification,
    this.roleArn,
    this.inputDataConfig,
    this.outputDataConfig,
    @required this.resourceConfig,
    this.vpcConfig,
    @required this.stoppingCondition,
    @required this.creationTime,
    this.trainingStartTime,
    this.trainingEndTime,
    this.lastModifiedTime,
    this.secondaryStatusTransitions,
    this.finalMetricDataList,
    this.enableNetworkIsolation,
    this.enableInterContainerTrafficEncryption,
    this.enableManagedSpotTraining,
    this.checkpointConfig,
    this.trainingTimeInSeconds,
    this.billableTimeInSeconds,
  });
  static DescribeTrainingJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeTrainingJobResponse(
        trainingJobName: json['TrainingJobName'] as String,
        trainingJobArn: json['TrainingJobArn'] as String,
        tuningJobArn: json.containsKey('TuningJobArn')
            ? json['TuningJobArn'] as String
            : null,
        labelingJobArn: json.containsKey('LabelingJobArn')
            ? json['LabelingJobArn'] as String
            : null,
        modelArtifacts: ModelArtifacts.fromJson(json['ModelArtifacts']),
        trainingJobStatus: json['TrainingJobStatus'] as String,
        secondaryStatus: json['SecondaryStatus'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        hyperParameters: json.containsKey('HyperParameters')
            ? (json['HyperParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        algorithmSpecification:
            AlgorithmSpecification.fromJson(json['AlgorithmSpecification']),
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        inputDataConfig: json.containsKey('InputDataConfig')
            ? (json['InputDataConfig'] as List)
                .map((e) => Channel.fromJson(e))
                .toList()
            : null,
        outputDataConfig: json.containsKey('OutputDataConfig')
            ? OutputDataConfig.fromJson(json['OutputDataConfig'])
            : null,
        resourceConfig: ResourceConfig.fromJson(json['ResourceConfig']),
        vpcConfig: json.containsKey('VpcConfig')
            ? VpcConfig.fromJson(json['VpcConfig'])
            : null,
        stoppingCondition:
            StoppingCondition.fromJson(json['StoppingCondition']),
        creationTime: DateTime.parse(json['CreationTime']),
        trainingStartTime: json.containsKey('TrainingStartTime')
            ? DateTime.parse(json['TrainingStartTime'])
            : null,
        trainingEndTime: json.containsKey('TrainingEndTime')
            ? DateTime.parse(json['TrainingEndTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        secondaryStatusTransitions:
            json.containsKey('SecondaryStatusTransitions')
                ? (json['SecondaryStatusTransitions'] as List)
                    .map((e) => SecondaryStatusTransition.fromJson(e))
                    .toList()
                : null,
        finalMetricDataList: json.containsKey('FinalMetricDataList')
            ? (json['FinalMetricDataList'] as List)
                .map((e) => MetricData.fromJson(e))
                .toList()
            : null,
        enableNetworkIsolation: json.containsKey('EnableNetworkIsolation')
            ? json['EnableNetworkIsolation'] as bool
            : null,
        enableInterContainerTrafficEncryption:
            json.containsKey('EnableInterContainerTrafficEncryption')
                ? json['EnableInterContainerTrafficEncryption'] as bool
                : null,
        enableManagedSpotTraining: json.containsKey('EnableManagedSpotTraining')
            ? json['EnableManagedSpotTraining'] as bool
            : null,
        checkpointConfig: json.containsKey('CheckpointConfig')
            ? CheckpointConfig.fromJson(json['CheckpointConfig'])
            : null,
        trainingTimeInSeconds: json.containsKey('TrainingTimeInSeconds')
            ? json['TrainingTimeInSeconds'] as int
            : null,
        billableTimeInSeconds: json.containsKey('BillableTimeInSeconds')
            ? json['BillableTimeInSeconds'] as int
            : null,
      );
}

class DescribeTransformJobResponse {
  /// The name of the transform job.
  final String transformJobName;

  /// The Amazon Resource Name (ARN) of the transform job.
  final String transformJobArn;

  /// The status of the transform job. If the transform job failed, the reason
  /// is returned in the `FailureReason` field.
  final String transformJobStatus;

  /// If the transform job failed, `FailureReason` describes why it failed. A
  /// transform job creates a log file, which includes error messages, and
  /// stores it as an Amazon S3 object. For more information, see
  /// [Log Amazon SageMaker Events with Amazon CloudWatch](https://docs.aws.amazon.com/sagemaker/latest/dg/logging-cloudwatch.html).
  final String failureReason;

  /// The name of the model used in the transform job.
  final String modelName;

  /// The maximum number of parallel requests on each instance node that can be
  /// launched in a transform job. The default value is 1.
  final int maxConcurrentTransforms;

  /// The maximum payload size, in MB, used in the transform job.
  final int maxPayloadInMB;

  /// Specifies the number of records to include in a mini-batch for an HTTP
  /// inference request. A _record_  _is a single unit of input data that
  /// inference can be made on. For example, a single line in a CSV file is a
  /// record._
  ///
  /// _
  ///
  /// To enable the batch strategy, you must set `SplitType` to `Line`,
  /// `RecordIO`, or `TFRecord`.
  ///
  /// _
  final String batchStrategy;

  /// The environment variables to set in the Docker container. We support up to
  /// 16 key and values entries in the map.
  final Map<String, String> environment;

  /// Describes the dataset to be transformed and the Amazon S3 location where
  /// it is stored.
  final TransformInput transformInput;

  /// Identifies the Amazon S3 location where you want Amazon SageMaker to save
  /// the results from the transform job.
  final TransformOutput transformOutput;

  /// Describes the resources, including ML instance types and ML instance
  /// count, to use for the transform job.
  final TransformResources transformResources;

  /// A timestamp that shows when the transform Job was created.
  final DateTime creationTime;

  /// Indicates when the transform job starts on ML instances. You are billed
  /// for the time interval between this time and the value of
  /// `TransformEndTime`.
  final DateTime transformStartTime;

  /// Indicates when the transform job has been completed, or has stopped or
  /// failed. You are billed for the time interval between this time and the
  /// value of `TransformStartTime`.
  final DateTime transformEndTime;

  /// The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth
  /// labeling job that created the transform or training job.
  final String labelingJobArn;

  final DataProcessing dataProcessing;

  DescribeTransformJobResponse({
    @required this.transformJobName,
    @required this.transformJobArn,
    @required this.transformJobStatus,
    this.failureReason,
    @required this.modelName,
    this.maxConcurrentTransforms,
    this.maxPayloadInMB,
    this.batchStrategy,
    this.environment,
    @required this.transformInput,
    this.transformOutput,
    @required this.transformResources,
    @required this.creationTime,
    this.transformStartTime,
    this.transformEndTime,
    this.labelingJobArn,
    this.dataProcessing,
  });
  static DescribeTransformJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeTransformJobResponse(
        transformJobName: json['TransformJobName'] as String,
        transformJobArn: json['TransformJobArn'] as String,
        transformJobStatus: json['TransformJobStatus'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        modelName: json['ModelName'] as String,
        maxConcurrentTransforms: json.containsKey('MaxConcurrentTransforms')
            ? json['MaxConcurrentTransforms'] as int
            : null,
        maxPayloadInMB: json.containsKey('MaxPayloadInMB')
            ? json['MaxPayloadInMB'] as int
            : null,
        batchStrategy: json.containsKey('BatchStrategy')
            ? json['BatchStrategy'] as String
            : null,
        environment: json.containsKey('Environment')
            ? (json['Environment'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        transformInput: TransformInput.fromJson(json['TransformInput']),
        transformOutput: json.containsKey('TransformOutput')
            ? TransformOutput.fromJson(json['TransformOutput'])
            : null,
        transformResources:
            TransformResources.fromJson(json['TransformResources']),
        creationTime: DateTime.parse(json['CreationTime']),
        transformStartTime: json.containsKey('TransformStartTime')
            ? DateTime.parse(json['TransformStartTime'])
            : null,
        transformEndTime: json.containsKey('TransformEndTime')
            ? DateTime.parse(json['TransformEndTime'])
            : null,
        labelingJobArn: json.containsKey('LabelingJobArn')
            ? json['LabelingJobArn'] as String
            : null,
        dataProcessing: json.containsKey('DataProcessing')
            ? DataProcessing.fromJson(json['DataProcessing'])
            : null,
      );
}

class DescribeWorkteamResponse {
  /// A `Workteam` instance that contains information about the work team.
  final Workteam workteam;

  DescribeWorkteamResponse({
    @required this.workteam,
  });
  static DescribeWorkteamResponse fromJson(Map<String, dynamic> json) =>
      DescribeWorkteamResponse(
        workteam: Workteam.fromJson(json['Workteam']),
      );
}

/// Specifies weight and capacity values for a production variant.
class DesiredWeightAndCapacity {
  /// The name of the variant to update.
  final String variantName;

  /// The variant's weight.
  final double desiredWeight;

  /// The variant's capacity.
  final int desiredInstanceCount;

  DesiredWeightAndCapacity({
    @required this.variantName,
    this.desiredWeight,
    this.desiredInstanceCount,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information for an endpoint configuration.
class EndpointConfigSummary {
  /// The name of the endpoint configuration.
  final String endpointConfigName;

  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  final String endpointConfigArn;

  /// A timestamp that shows when the endpoint configuration was created.
  final DateTime creationTime;

  EndpointConfigSummary({
    @required this.endpointConfigName,
    @required this.endpointConfigArn,
    @required this.creationTime,
  });
  static EndpointConfigSummary fromJson(Map<String, dynamic> json) =>
      EndpointConfigSummary(
        endpointConfigName: json['EndpointConfigName'] as String,
        endpointConfigArn: json['EndpointConfigArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
      );
}

/// Provides summary information for an endpoint.
class EndpointSummary {
  /// The name of the endpoint.
  final String endpointName;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  /// A timestamp that shows when the endpoint was created.
  final DateTime creationTime;

  /// A timestamp that shows when the endpoint was last modified.
  final DateTime lastModifiedTime;

  /// The status of the endpoint.
  ///
  /// *    `OutOfService`: Endpoint is not available to take incoming requests.
  ///
  /// *    `Creating`: CreateEndpoint is executing.
  ///
  /// *    `Updating`: UpdateEndpoint or UpdateEndpointWeightsAndCapacities is
  /// executing.
  ///
  /// *    `SystemUpdating`: Endpoint is undergoing maintenance and cannot be
  /// updated or deleted or re-scaled until it has completed. This maintenance
  /// operation does not change any customer-specified values such as VPC
  /// config, KMS encryption, model, instance type, or instance count.
  ///
  /// *    `RollingBack`: Endpoint fails to scale up or down or change its
  /// variant weight and is in the process of rolling back to its previous
  /// configuration. Once the rollback completes, endpoint returns to an
  /// `InService` status. This transitional status only applies to an endpoint
  /// that has autoscaling enabled and is undergoing variant weight or capacity
  /// changes as part of an UpdateEndpointWeightsAndCapacities call or when the
  /// UpdateEndpointWeightsAndCapacities operation is called explicitly.
  ///
  /// *    `InService`: Endpoint is available to process incoming requests.
  ///
  /// *    `Deleting`: DeleteEndpoint is executing.
  ///
  /// *    `Failed`: Endpoint could not be created, updated, or re-scaled. Use
  /// DescribeEndpointOutput$FailureReason for information about the failure.
  /// DeleteEndpoint is the only operation that can be performed on a failed
  /// endpoint.
  ///
  ///
  /// To get a list of endpoints with a specified status, use the
  /// ListEndpointsInput$StatusEquals filter.
  final String endpointStatus;

  EndpointSummary({
    @required this.endpointName,
    @required this.endpointArn,
    @required this.creationTime,
    @required this.lastModifiedTime,
    @required this.endpointStatus,
  });
  static EndpointSummary fromJson(Map<String, dynamic> json) => EndpointSummary(
        endpointName: json['EndpointName'] as String,
        endpointArn: json['EndpointArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        endpointStatus: json['EndpointStatus'] as String,
      );
}

/// Specifies a file system data source for a channel.
class FileSystemDataSource {
  /// The file system id.
  final String fileSystemId;

  /// The access mode of the mount of the directory associated with the channel.
  /// A directory can be mounted either in `ro` (read-only) or `rw`
  /// (read-write).
  final String fileSystemAccessMode;

  /// The file system type.
  final String fileSystemType;

  /// The full path to the directory to associate with the channel.
  final String directoryPath;

  FileSystemDataSource({
    @required this.fileSystemId,
    @required this.fileSystemAccessMode,
    @required this.fileSystemType,
    @required this.directoryPath,
  });
  static FileSystemDataSource fromJson(Map<String, dynamic> json) =>
      FileSystemDataSource(
        fileSystemId: json['FileSystemId'] as String,
        fileSystemAccessMode: json['FileSystemAccessMode'] as String,
        fileSystemType: json['FileSystemType'] as String,
        directoryPath: json['DirectoryPath'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A conditional statement for a search expression that includes a Boolean
/// operator, a resource property, and a value.
///
/// If you don't specify an `Operator` and a `Value`, the filter searches for
/// only the specified property. For example, defining a `Filter` for the
/// `FailureReason` for the `TrainingJob` `Resource` searches for training job
/// objects that have a value in the `FailureReason` field.
///
/// If you specify a `Value`, but not an `Operator`, Amazon SageMaker uses the
/// equals operator as the default.
///
/// In search, there are several property types:
///
/// Metrics
///
/// To define a metric filter, enter a value using the form `"Metrics.<name>"`,
/// where `<name>` is a metric name. For example, the following filter searches
/// for training jobs with an `"accuracy"` metric greater than `"0.9"`:
///
///  `{`
///
///  `"Name": "Metrics.accuracy",`
///
///  `"Operator": "GREATER_THAN",`
///
///  `"Value": "0.9"`
///
///  `}`
///
/// HyperParameters
///
/// To define a hyperparameter filter, enter a value with the form
/// `"HyperParameters.<name>"`. Decimal hyperparameter values are treated as a
/// decimal in a comparison if the specified `Value` is also a decimal value. If
/// the specified `Value` is an integer, the decimal hyperparameter values are
/// treated as integers. For example, the following filter is satisfied by
/// training jobs with a `"learning_rate"` hyperparameter that is less than
/// `"0.5"`:
///
///   `{`
///
///   `"Name": "HyperParameters.learning_rate",`
///
///   `"Operator": "LESS_THAN",`
///
///   `"Value": "0.5"`
///
///   `}`
///
/// Tags
///
/// To define a tag filter, enter a value with the form `"Tags.<key>"`.
class Filter {
  /// A property name. For example, `TrainingJobName`. For the list of valid
  /// property names returned in a search result for each supported resource,
  /// see TrainingJob properties. You must specify a valid property name for the
  /// resource.
  final String name;

  /// A Boolean binary operator that is used to evaluate the filter. The
  /// operator field contains one of the following values:
  ///
  /// Equals
  ///
  /// The specified resource in `Name` equals the specified `Value`.
  ///
  /// NotEquals
  ///
  /// The specified resource in `Name` does not equal the specified `Value`.
  ///
  /// GreaterThan
  ///
  /// The specified resource in `Name` is greater than the specified `Value`.
  /// Not supported for text-based properties.
  ///
  /// GreaterThanOrEqualTo
  ///
  /// The specified resource in `Name` is greater than or equal to the specified
  /// `Value`. Not supported for text-based properties.
  ///
  /// LessThan
  ///
  /// The specified resource in `Name` is less than the specified `Value`. Not
  /// supported for text-based properties.
  ///
  /// LessThanOrEqualTo
  ///
  /// The specified resource in `Name` is less than or equal to the specified
  /// `Value`. Not supported for text-based properties.
  ///
  /// Contains
  ///
  /// Only supported for text-based properties. The word-list of the property
  /// contains the specified `Value`.
  ///
  /// If you have specified a filter `Value`, the default is `Equals`.
  final String operator;

  /// A value used with `Resource` and `Operator` to determine if objects
  /// satisfy the filter's condition. For numerical properties, `Value` must be
  /// an integer or floating-point decimal. For timestamp properties, `Value`
  /// must be an ISO 8601 date-time string of the following format:
  /// `YYYY-mm-dd'T'HH:MM:SS`.
  final String value;

  Filter({
    @required this.name,
    this.operator,
    this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Shows the final value for the objective metric for a training job that was
/// launched by a hyperparameter tuning job. You define the objective metric in
/// the `HyperParameterTuningJobObjective` parameter of
/// HyperParameterTuningJobConfig.
class FinalHyperParameterTuningJobObjectiveMetric {
  /// Whether to minimize or maximize the objective metric. Valid values are
  /// Minimize and Maximize.
  final String type;

  /// The name of the objective metric.
  final String metricName;

  /// The value of the objective metric.
  final double value;

  FinalHyperParameterTuningJobObjectiveMetric({
    this.type,
    @required this.metricName,
    @required this.value,
  });
  static FinalHyperParameterTuningJobObjectiveMetric fromJson(
          Map<String, dynamic> json) =>
      FinalHyperParameterTuningJobObjectiveMetric(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        metricName: json['MetricName'] as String,
        value: json['Value'] as double,
      );
}

class GetSearchSuggestionsResponse {
  /// A list of property names for a `Resource` that match a `SuggestionQuery`.
  final List<PropertyNameSuggestion> propertyNameSuggestions;

  GetSearchSuggestionsResponse({
    this.propertyNameSuggestions,
  });
  static GetSearchSuggestionsResponse fromJson(Map<String, dynamic> json) =>
      GetSearchSuggestionsResponse(
        propertyNameSuggestions: json.containsKey('PropertyNameSuggestions')
            ? (json['PropertyNameSuggestions'] as List)
                .map((e) => PropertyNameSuggestion.fromJson(e))
                .toList()
            : null,
      );
}

/// Specifies configuration details for a Git repository in your AWS account.
class GitConfig {
  /// The URL where the Git repository is located.
  final String repositoryUrl;

  /// The default branch for the Git repository.
  final String branch;

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the credentials used to access the git repository. The secret
  /// must have a staging label of `AWSCURRENT` and must be in the following
  /// format:
  ///
  ///  `{"username": _UserName_, "password": _Password_}`
  final String secretArn;

  GitConfig({
    @required this.repositoryUrl,
    this.branch,
    this.secretArn,
  });
  static GitConfig fromJson(Map<String, dynamic> json) => GitConfig(
        repositoryUrl: json['RepositoryUrl'] as String,
        branch: json.containsKey('Branch') ? json['Branch'] as String : null,
        secretArn:
            json.containsKey('SecretArn') ? json['SecretArn'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies configuration details for a Git repository when the repository is
/// updated.
class GitConfigForUpdate {
  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the credentials used to access the git repository. The secret
  /// must have a staging label of `AWSCURRENT` and must be in the following
  /// format:
  ///
  ///  `{"username": _UserName_, "password": _Password_}`
  final String secretArn;

  GitConfigForUpdate({
    this.secretArn,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Information required for human workers to complete a labeling task.
class HumanTaskConfig {
  /// The Amazon Resource Name (ARN) of the work team assigned to complete the
  /// tasks.
  final String workteamArn;

  /// Information about the user interface that workers use to complete the
  /// labeling task.
  final UiConfig uiConfig;

  /// The Amazon Resource Name (ARN) of a Lambda function that is run before a
  /// data object is sent to a human worker. Use this function to provide input
  /// to a custom labeling job.
  ///
  /// For the built-in bounding box, image classification, semantic
  /// segmentation, and text classification task types, Amazon SageMaker Ground
  /// Truth provides the following Lambda functions:
  ///
  ///  **US East (Northern Virginia) (us-east-1):**
  ///
  /// *    `arn:aws:lambda:us-east-1:432418664414:function:PRE-BoundingBox`
  ///
  /// *    `arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-east-1:432418664414:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-east-1:432418664414:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **US East (Ohio) (us-east-2):**
  ///
  /// *    `arn:aws:lambda:us-east-2:266458841044:function:PRE-BoundingBox`
  ///
  /// *    `arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-east-2:266458841044:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-east-2:266458841044:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **US West (Oregon) (us-west-2):**
  ///
  /// *    `arn:aws:lambda:us-west-2:081040173940:function:PRE-BoundingBox`
  ///
  /// *    `arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-west-2:081040173940:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:us-west-2:081040173940:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Canada (Central) (ca-central-1):**
  ///
  /// *    `arn:awslambda:ca-central-1:918755190332:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:awslambda:ca-central-1:918755190332:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:ca-central-1:918755190332:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:awslambda:ca-central-1:918755190332:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:ca-central-1:918755190332:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **EU (Ireland) (eu-west-1):**
  ///
  /// *    `arn:aws:lambda:eu-west-1:568282634449:function:PRE-BoundingBox`
  ///
  /// *    `arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:eu-west-1:568282634449:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:eu-west-1:568282634449:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **EU (London) (eu-west-2):**
  ///
  /// *    `arn:awslambda:eu-west-2:487402164563:function:PRE-BoundingBox`
  ///
  /// *    `arn:awslambda:eu-west-2:487402164563:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:eu-west-2:487402164563:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:awslambda:eu-west-2:487402164563:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:eu-west-2:487402164563:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **EU Frankfurt (eu-central-1):**
  ///
  /// *    `arn:awslambda:eu-central-1:203001061592:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:awslambda:eu-central-1:203001061592:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:eu-central-1:203001061592:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:awslambda:eu-central-1:203001061592:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:eu-central-1:203001061592:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Asia Pacific (Tokyo) (ap-northeast-1):**
  ///
  /// *    `arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-SemanticSegmentation`
  ///
  /// *
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Asia Pacific (Seoul) (ap-northeast-2):**
  ///
  /// *    `arn:awslambda:ap-northeast-2:845288260483:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:awslambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-northeast-2:845288260483:function:PRE-SemanticSegmentation`
  ///
  /// *
  /// `arn:awslambda:ap-northeast-2:845288260483:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-northeast-2:845288260483:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Asia Pacific (Mumbai) (ap-south-1):**
  ///
  /// *    `arn:awslambda:ap-south-1:565803892007:function:PRE-BoundingBox`
  ///
  /// *    `arn:awslambda:ap-south-1:565803892007:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-south-1:565803892007:function:PRE-SemanticSegmentation`
  ///
  /// *    `arn:awslambda:ap-south-1:565803892007:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-south-1:565803892007:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Asia Pacific (Singapore) (ap-southeast-1):**
  ///
  /// *    `arn:awslambda:ap-southeast-1:377565633583:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:awslambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-southeast-1:377565633583:function:PRE-SemanticSegmentation`
  ///
  /// *
  /// `arn:awslambda:ap-southeast-1:377565633583:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:awslambda:ap-southeast-1:377565633583:function:PRE-NamedEntityRecognition`
  ///
  ///
  ///  **Asia Pacific (Sydney) (ap-southeast-2):**
  ///
  /// *    `arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-BoundingBox`
  ///
  /// *
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-SemanticSegmentation`
  ///
  /// *
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClass`
  ///
  /// *
  /// `arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-NamedEntityRecognition`
  final String preHumanTaskLambdaArn;

  /// Keywords used to describe the task so that workers on Amazon Mechanical
  /// Turk can discover the task.
  final List<String> taskKeywords;

  /// A title for the task for your human workers.
  final String taskTitle;

  /// A description of the task for your human workers.
  final String taskDescription;

  /// The number of human workers that will label an object.
  final int numberOfHumanWorkersPerDataObject;

  /// The amount of time that a worker has to complete a task.
  final int taskTimeLimitInSeconds;

  /// The length of time that a task remains available for labeling by human
  /// workers. **If you choose the Amazon Mechanical Turk workforce, the maximum
  /// is 12 hours (43200)**. For private and vendor workforces, the maximum is
  /// as listed.
  final int taskAvailabilityLifetimeInSeconds;

  /// Defines the maximum number of data objects that can be labeled by human
  /// workers at the same time. Each object may have more than one worker at one
  /// time.
  final int maxConcurrentTaskCount;

  /// Configures how labels are consolidated across human workers.
  final AnnotationConsolidationConfig annotationConsolidationConfig;

  /// The price that you pay for each task performed by an Amazon Mechanical
  /// Turk worker.
  final PublicWorkforceTaskPrice publicWorkforceTaskPrice;

  HumanTaskConfig({
    @required this.workteamArn,
    @required this.uiConfig,
    @required this.preHumanTaskLambdaArn,
    this.taskKeywords,
    @required this.taskTitle,
    @required this.taskDescription,
    @required this.numberOfHumanWorkersPerDataObject,
    @required this.taskTimeLimitInSeconds,
    this.taskAvailabilityLifetimeInSeconds,
    this.maxConcurrentTaskCount,
    @required this.annotationConsolidationConfig,
    this.publicWorkforceTaskPrice,
  });
  static HumanTaskConfig fromJson(Map<String, dynamic> json) => HumanTaskConfig(
        workteamArn: json['WorkteamArn'] as String,
        uiConfig: UiConfig.fromJson(json['UiConfig']),
        preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
        taskKeywords: json.containsKey('TaskKeywords')
            ? (json['TaskKeywords'] as List).map((e) => e as String).toList()
            : null,
        taskTitle: json['TaskTitle'] as String,
        taskDescription: json['TaskDescription'] as String,
        numberOfHumanWorkersPerDataObject:
            json['NumberOfHumanWorkersPerDataObject'] as int,
        taskTimeLimitInSeconds: json['TaskTimeLimitInSeconds'] as int,
        taskAvailabilityLifetimeInSeconds:
            json.containsKey('TaskAvailabilityLifetimeInSeconds')
                ? json['TaskAvailabilityLifetimeInSeconds'] as int
                : null,
        maxConcurrentTaskCount: json.containsKey('MaxConcurrentTaskCount')
            ? json['MaxConcurrentTaskCount'] as int
            : null,
        annotationConsolidationConfig: AnnotationConsolidationConfig.fromJson(
            json['AnnotationConsolidationConfig']),
        publicWorkforceTaskPrice: json.containsKey('PublicWorkforceTaskPrice')
            ? PublicWorkforceTaskPrice.fromJson(
                json['PublicWorkforceTaskPrice'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies which training algorithm to use for training jobs that a
/// hyperparameter tuning job launches and the metrics to monitor.
class HyperParameterAlgorithmSpecification {
  ///  The registry path of the Docker image that contains the training
  /// algorithm. For information about Docker registry paths for built-in
  /// algorithms, see
  /// [Algorithms Provided by Amazon SageMaker: Common Parameters](https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html).
  /// Amazon SageMaker supports both `registry/repository[:tag]` and
  /// `registry/repository[@digest]` image path formats. For more information,
  /// see
  /// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html).
  final String trainingImage;

  /// The input mode that the algorithm supports: File or Pipe. In File input
  /// mode, Amazon SageMaker downloads the training data from Amazon S3 to the
  /// storage volume that is attached to the training instance and mounts the
  /// directory to the Docker volume for the training container. In Pipe input
  /// mode, Amazon SageMaker streams data directly from Amazon S3 to the
  /// container.
  ///
  /// If you specify File mode, make sure that you provision the storage volume
  /// that is attached to the training instance with enough capacity to
  /// accommodate the training data downloaded from Amazon S3, the model
  /// artifacts, and intermediate information.
  ///
  /// For more information about input modes, see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  final String trainingInputMode;

  /// The name of the resource algorithm to use for the hyperparameter tuning
  /// job. If you specify a value for this parameter, do not specify a value for
  /// `TrainingImage`.
  final String algorithmName;

  /// An array of MetricDefinition objects that specify the metrics that the
  /// algorithm emits.
  final List<MetricDefinition> metricDefinitions;

  HyperParameterAlgorithmSpecification({
    this.trainingImage,
    @required this.trainingInputMode,
    this.algorithmName,
    this.metricDefinitions,
  });
  static HyperParameterAlgorithmSpecification fromJson(
          Map<String, dynamic> json) =>
      HyperParameterAlgorithmSpecification(
        trainingImage: json.containsKey('TrainingImage')
            ? json['TrainingImage'] as String
            : null,
        trainingInputMode: json['TrainingInputMode'] as String,
        algorithmName: json.containsKey('AlgorithmName')
            ? json['AlgorithmName'] as String
            : null,
        metricDefinitions: json.containsKey('MetricDefinitions')
            ? (json['MetricDefinitions'] as List)
                .map((e) => MetricDefinition.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines a hyperparameter to be used by an algorithm.
class HyperParameterSpecification {
  /// The name of this hyperparameter. The name must be unique.
  final String name;

  /// A brief description of the hyperparameter.
  final String description;

  /// The type of this hyperparameter. The valid types are `Integer`,
  /// `Continuous`, `Categorical`, and `FreeText`.
  final String type;

  /// The allowed range for this hyperparameter.
  final ParameterRange range;

  /// Indicates whether this hyperparameter is tunable in a hyperparameter
  /// tuning job.
  final bool isTunable;

  /// Indicates whether this hyperparameter is required.
  final bool isRequired;

  /// The default value for this hyperparameter. If a default value is
  /// specified, a hyperparameter cannot be required.
  final String defaultValue;

  HyperParameterSpecification({
    @required this.name,
    this.description,
    @required this.type,
    this.range,
    this.isTunable,
    this.isRequired,
    this.defaultValue,
  });
  static HyperParameterSpecification fromJson(Map<String, dynamic> json) =>
      HyperParameterSpecification(
        name: json['Name'] as String,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        type: json['Type'] as String,
        range: json.containsKey('Range')
            ? ParameterRange.fromJson(json['Range'])
            : null,
        isTunable:
            json.containsKey('IsTunable') ? json['IsTunable'] as bool : null,
        isRequired:
            json.containsKey('IsRequired') ? json['IsRequired'] as bool : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the training jobs launched by a hyperparameter tuning job.
class HyperParameterTrainingJobDefinition {
  /// Specifies the values of hyperparameters that do not change for the tuning
  /// job.
  final Map<String, String> staticHyperParameters;

  /// The HyperParameterAlgorithmSpecification object that specifies the
  /// resource algorithm to use for the training jobs that the tuning job
  /// launches.
  final HyperParameterAlgorithmSpecification algorithmSpecification;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the
  /// training jobs that the tuning job launches.
  final String roleArn;

  /// An array of Channel objects that specify the input for the training jobs
  /// that the tuning job launches.
  final List<Channel> inputDataConfig;

  /// The VpcConfig object that specifies the VPC that you want the training
  /// jobs that this hyperparameter tuning job launches to connect to. Control
  /// access to and from your training container by configuring the VPC. For
  /// more information, see
  /// [Protect Training Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html).
  final VpcConfig vpcConfig;

  /// Specifies the path to the Amazon S3 bucket where you store model artifacts
  /// from the training jobs that the tuning job launches.
  final OutputDataConfig outputDataConfig;

  /// The resources, including the compute instances and storage volumes, to use
  /// for the training jobs that the tuning job launches.
  ///
  /// Storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use storage volumes for scratch space. If you want
  /// Amazon SageMaker to use the storage volume to store the training data,
  /// choose `File` as the `TrainingInputMode` in the algorithm specification.
  /// For distributed training algorithms, specify an instance count greater
  /// than 1.
  final ResourceConfig resourceConfig;

  /// Specifies a limit to how long a model hyperparameter training job can run.
  /// It also specifies how long you are willing to wait for a managed spot
  /// training job to complete. When the job reaches the a limit, Amazon
  /// SageMaker ends the training job. Use this API to cap model training costs.
  final StoppingCondition stoppingCondition;

  /// Isolates the training container. No inbound or outbound network calls can
  /// be made, except for calls between peers within a training cluster for
  /// distributed training. If network isolation is used for training jobs that
  /// are configured to use a VPC, Amazon SageMaker downloads and uploads
  /// customer data and model artifacts through the specified VPC, but the
  /// training container does not have network access.
  ///
  ///
  ///
  /// The Semantic Segmentation built-in algorithm does not support network
  /// isolation.
  final bool enableNetworkIsolation;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose `True`. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances,
  /// especially if you use a deep learning algorithm in distributed training.
  final bool enableInterContainerTrafficEncryption;

  /// A Boolean indicating whether managed spot training is enabled (`True`) or
  /// not (`False`).
  final bool enableManagedSpotTraining;

  final CheckpointConfig checkpointConfig;

  HyperParameterTrainingJobDefinition({
    this.staticHyperParameters,
    @required this.algorithmSpecification,
    @required this.roleArn,
    this.inputDataConfig,
    this.vpcConfig,
    @required this.outputDataConfig,
    @required this.resourceConfig,
    @required this.stoppingCondition,
    this.enableNetworkIsolation,
    this.enableInterContainerTrafficEncryption,
    this.enableManagedSpotTraining,
    this.checkpointConfig,
  });
  static HyperParameterTrainingJobDefinition fromJson(
          Map<String, dynamic> json) =>
      HyperParameterTrainingJobDefinition(
        staticHyperParameters: json.containsKey('StaticHyperParameters')
            ? (json['StaticHyperParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        algorithmSpecification: HyperParameterAlgorithmSpecification.fromJson(
            json['AlgorithmSpecification']),
        roleArn: json['RoleArn'] as String,
        inputDataConfig: json.containsKey('InputDataConfig')
            ? (json['InputDataConfig'] as List)
                .map((e) => Channel.fromJson(e))
                .toList()
            : null,
        vpcConfig: json.containsKey('VpcConfig')
            ? VpcConfig.fromJson(json['VpcConfig'])
            : null,
        outputDataConfig: OutputDataConfig.fromJson(json['OutputDataConfig']),
        resourceConfig: ResourceConfig.fromJson(json['ResourceConfig']),
        stoppingCondition:
            StoppingCondition.fromJson(json['StoppingCondition']),
        enableNetworkIsolation: json.containsKey('EnableNetworkIsolation')
            ? json['EnableNetworkIsolation'] as bool
            : null,
        enableInterContainerTrafficEncryption:
            json.containsKey('EnableInterContainerTrafficEncryption')
                ? json['EnableInterContainerTrafficEncryption'] as bool
                : null,
        enableManagedSpotTraining: json.containsKey('EnableManagedSpotTraining')
            ? json['EnableManagedSpotTraining'] as bool
            : null,
        checkpointConfig: json.containsKey('CheckpointConfig')
            ? CheckpointConfig.fromJson(json['CheckpointConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies summary information about a training job.
class HyperParameterTrainingJobSummary {
  /// The name of the training job.
  final String trainingJobName;

  /// The Amazon Resource Name (ARN) of the training job.
  final String trainingJobArn;

  /// The HyperParameter tuning job that launched the training job.
  final String tuningJobName;

  /// The date and time that the training job was created.
  final DateTime creationTime;

  /// The date and time that the training job started.
  final DateTime trainingStartTime;

  /// Specifies the time when the training job ends on training instances. You
  /// are billed for the time interval between the value of `TrainingStartTime`
  /// and this time. For successful jobs and stopped jobs, this is the time
  /// after model artifacts are uploaded. For failed jobs, this is the time when
  /// Amazon SageMaker detects a job failure.
  final DateTime trainingEndTime;

  /// The status of the training job.
  final String trainingJobStatus;

  /// A list of the hyperparameters for which you specified ranges to search.
  final Map<String, String> tunedHyperParameters;

  /// The reason that the training job failed.
  final String failureReason;

  /// The FinalHyperParameterTuningJobObjectiveMetric object that specifies the
  /// value of the objective metric of the tuning job that launched this
  /// training job.
  final FinalHyperParameterTuningJobObjectiveMetric
      finalHyperParameterTuningJobObjectiveMetric;

  /// The status of the objective metric for the training job:
  ///
  /// *   Succeeded: The final objective metric for the training job was
  /// evaluated by the hyperparameter tuning job and used in the hyperparameter
  /// tuning process.
  ///
  ///
  /// *   Pending: The training job is in progress and evaluation of its final
  /// objective metric is pending.
  ///
  ///
  /// *   Failed: The final objective metric for the training job was not
  /// evaluated, and was not used in the hyperparameter tuning process. This
  /// typically occurs when the training job failed or did not emit an objective
  /// metric.
  final String objectiveStatus;

  HyperParameterTrainingJobSummary({
    @required this.trainingJobName,
    @required this.trainingJobArn,
    this.tuningJobName,
    @required this.creationTime,
    this.trainingStartTime,
    this.trainingEndTime,
    @required this.trainingJobStatus,
    @required this.tunedHyperParameters,
    this.failureReason,
    this.finalHyperParameterTuningJobObjectiveMetric,
    this.objectiveStatus,
  });
  static HyperParameterTrainingJobSummary fromJson(Map<String, dynamic> json) =>
      HyperParameterTrainingJobSummary(
        trainingJobName: json['TrainingJobName'] as String,
        trainingJobArn: json['TrainingJobArn'] as String,
        tuningJobName: json.containsKey('TuningJobName')
            ? json['TuningJobName'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        trainingStartTime: json.containsKey('TrainingStartTime')
            ? DateTime.parse(json['TrainingStartTime'])
            : null,
        trainingEndTime: json.containsKey('TrainingEndTime')
            ? DateTime.parse(json['TrainingEndTime'])
            : null,
        trainingJobStatus: json['TrainingJobStatus'] as String,
        tunedHyperParameters: (json['TunedHyperParameters'] as Map)
            .map((k, v) => MapEntry(k as String, v as String)),
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        finalHyperParameterTuningJobObjectiveMetric:
            json.containsKey('FinalHyperParameterTuningJobObjectiveMetric')
                ? FinalHyperParameterTuningJobObjectiveMetric.fromJson(
                    json['FinalHyperParameterTuningJobObjectiveMetric'])
                : null,
        objectiveStatus: json.containsKey('ObjectiveStatus')
            ? json['ObjectiveStatus'] as String
            : null,
      );
}

/// Configures a hyperparameter tuning job.
class HyperParameterTuningJobConfig {
  /// Specifies how hyperparameter tuning chooses the combinations of
  /// hyperparameter values to use for the training job it launches. To use the
  /// Bayesian search stategy, set this to `Bayesian`. To randomly search, set
  /// it to `Random`. For information about search strategies, see
  /// [How Hyperparameter Tuning Works](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html).
  final String strategy;

  /// The HyperParameterTuningJobObjective object that specifies the objective
  /// metric for this tuning job.
  final HyperParameterTuningJobObjective hyperParameterTuningJobObjective;

  /// The ResourceLimits object that specifies the maximum number of training
  /// jobs and parallel training jobs for this tuning job.
  final ResourceLimits resourceLimits;

  /// The ParameterRanges object that specifies the ranges of hyperparameters
  /// that this tuning job searches.
  final ParameterRanges parameterRanges;

  /// Specifies whether to use early stopping for training jobs launched by the
  /// hyperparameter tuning job. This can be one of the following values (the
  /// default value is `OFF`):
  ///
  /// OFF
  ///
  /// Training jobs launched by the hyperparameter tuning job do not use early
  /// stopping.
  ///
  /// AUTO
  ///
  /// Amazon SageMaker stops training jobs launched by the hyperparameter tuning
  /// job when they are unlikely to perform better than previously completed
  /// training jobs. For more information, see
  /// [Stop Training Jobs Early](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-early-stopping.html).
  final String trainingJobEarlyStoppingType;

  HyperParameterTuningJobConfig({
    @required this.strategy,
    this.hyperParameterTuningJobObjective,
    @required this.resourceLimits,
    this.parameterRanges,
    this.trainingJobEarlyStoppingType,
  });
  static HyperParameterTuningJobConfig fromJson(Map<String, dynamic> json) =>
      HyperParameterTuningJobConfig(
        strategy: json['Strategy'] as String,
        hyperParameterTuningJobObjective:
            json.containsKey('HyperParameterTuningJobObjective')
                ? HyperParameterTuningJobObjective.fromJson(
                    json['HyperParameterTuningJobObjective'])
                : null,
        resourceLimits: ResourceLimits.fromJson(json['ResourceLimits']),
        parameterRanges: json.containsKey('ParameterRanges')
            ? ParameterRanges.fromJson(json['ParameterRanges'])
            : null,
        trainingJobEarlyStoppingType:
            json.containsKey('TrainingJobEarlyStoppingType')
                ? json['TrainingJobEarlyStoppingType'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the objective metric for a hyperparameter tuning job. Hyperparameter
/// tuning uses the value of this metric to evaluate the training jobs it
/// launches, and returns the training job that results in either the highest or
/// lowest value for this metric, depending on the value you specify for the
/// `Type` parameter.
class HyperParameterTuningJobObjective {
  /// Whether to minimize or maximize the objective metric.
  final String type;

  /// The name of the metric to use for the objective metric.
  final String metricName;

  HyperParameterTuningJobObjective({
    @required this.type,
    @required this.metricName,
  });
  static HyperParameterTuningJobObjective fromJson(Map<String, dynamic> json) =>
      HyperParameterTuningJobObjective(
        type: json['Type'] as String,
        metricName: json['MetricName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information about a hyperparameter tuning job.
class HyperParameterTuningJobSummary {
  /// The name of the tuning job.
  final String hyperParameterTuningJobName;

  /// The Amazon Resource Name (ARN) of the tuning job.
  final String hyperParameterTuningJobArn;

  /// The status of the tuning job.
  final String hyperParameterTuningJobStatus;

  /// Specifies the search strategy hyperparameter tuning uses to choose which
  /// hyperparameters to use for each iteration. Currently, the only valid value
  /// is Bayesian.
  final String strategy;

  /// The date and time that the tuning job was created.
  final DateTime creationTime;

  /// The date and time that the tuning job ended.
  final DateTime hyperParameterTuningEndTime;

  /// The date and time that the tuning job was modified.
  final DateTime lastModifiedTime;

  /// The TrainingJobStatusCounters object that specifies the numbers of
  /// training jobs, categorized by status, that this tuning job launched.
  final TrainingJobStatusCounters trainingJobStatusCounters;

  /// The ObjectiveStatusCounters object that specifies the numbers of training
  /// jobs, categorized by objective metric status, that this tuning job
  /// launched.
  final ObjectiveStatusCounters objectiveStatusCounters;

  /// The ResourceLimits object that specifies the maximum number of training
  /// jobs and parallel training jobs allowed for this tuning job.
  final ResourceLimits resourceLimits;

  HyperParameterTuningJobSummary({
    @required this.hyperParameterTuningJobName,
    @required this.hyperParameterTuningJobArn,
    @required this.hyperParameterTuningJobStatus,
    @required this.strategy,
    @required this.creationTime,
    this.hyperParameterTuningEndTime,
    this.lastModifiedTime,
    @required this.trainingJobStatusCounters,
    @required this.objectiveStatusCounters,
    this.resourceLimits,
  });
  static HyperParameterTuningJobSummary fromJson(Map<String, dynamic> json) =>
      HyperParameterTuningJobSummary(
        hyperParameterTuningJobName:
            json['HyperParameterTuningJobName'] as String,
        hyperParameterTuningJobArn:
            json['HyperParameterTuningJobArn'] as String,
        hyperParameterTuningJobStatus:
            json['HyperParameterTuningJobStatus'] as String,
        strategy: json['Strategy'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        hyperParameterTuningEndTime:
            json.containsKey('HyperParameterTuningEndTime')
                ? DateTime.parse(json['HyperParameterTuningEndTime'])
                : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        trainingJobStatusCounters: TrainingJobStatusCounters.fromJson(
            json['TrainingJobStatusCounters']),
        objectiveStatusCounters:
            ObjectiveStatusCounters.fromJson(json['ObjectiveStatusCounters']),
        resourceLimits: json.containsKey('ResourceLimits')
            ? ResourceLimits.fromJson(json['ResourceLimits'])
            : null,
      );
}

/// Specifies the configuration for a hyperparameter tuning job that uses one or
/// more previous hyperparameter tuning jobs as a starting point. The results of
/// previous tuning jobs are used to inform which combinations of
/// hyperparameters to search over in the new tuning job.
///
/// All training jobs launched by the new hyperparameter tuning job are
/// evaluated by using the objective metric, and the training job that performs
/// the best is compared to the best training jobs from the parent tuning jobs.
/// From these, the training job that performs the best as measured by the
/// objective metric is returned as the overall best training job.
///
///
///
/// All training jobs launched by parent hyperparameter tuning jobs and the new
/// hyperparameter tuning jobs count against the limit of training jobs for the
/// tuning job.
class HyperParameterTuningJobWarmStartConfig {
  /// An array of hyperparameter tuning jobs that are used as the starting point
  /// for the new hyperparameter tuning job. For more information about warm
  /// starting a hyperparameter tuning job, see
  /// [Using a Previous Hyperparameter Tuning Job as a Starting Point](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-warm-start.html).
  ///
  /// Hyperparameter tuning jobs created before October 1, 2018 cannot be used
  /// as parent jobs for warm start tuning jobs.
  final List<ParentHyperParameterTuningJob> parentHyperParameterTuningJobs;

  /// Specifies one of the following:
  ///
  /// IDENTICAL_DATA_AND_ALGORITHM
  ///
  /// The new hyperparameter tuning job uses the same input data and training
  /// image as the parent tuning jobs. You can change the hyperparameter ranges
  /// to search and the maximum number of training jobs that the hyperparameter
  /// tuning job launches. You cannot use a new version of the training
  /// algorithm, unless the changes in the new version do not affect the
  /// algorithm itself. For example, changes that improve logging or adding
  /// support for a different data format are allowed. You can also change
  /// hyperparameters from tunable to static, and from static to tunable, but
  /// the total number of static plus tunable hyperparameters must remain the
  /// same as it is in all parent jobs. The objective metric for the new tuning
  /// job must be the same as for all parent jobs.
  ///
  /// TRANSFER_LEARNING
  ///
  /// The new hyperparameter tuning job can include input data, hyperparameter
  /// ranges, maximum number of concurrent training jobs, and maximum number of
  /// training jobs that are different than those of its parent hyperparameter
  /// tuning jobs. The training image can also be a different version from the
  /// version used in the parent hyperparameter tuning job. You can also change
  /// hyperparameters from tunable to static, and from static to tunable, but
  /// the total number of static plus tunable hyperparameters must remain the
  /// same as it is in all parent jobs. The objective metric for the new tuning
  /// job must be the same as for all parent jobs.
  final String warmStartType;

  HyperParameterTuningJobWarmStartConfig({
    @required this.parentHyperParameterTuningJobs,
    @required this.warmStartType,
  });
  static HyperParameterTuningJobWarmStartConfig fromJson(
          Map<String, dynamic> json) =>
      HyperParameterTuningJobWarmStartConfig(
        parentHyperParameterTuningJobs:
            (json['ParentHyperParameterTuningJobs'] as List)
                .map((e) => ParentHyperParameterTuningJob.fromJson(e))
                .toList(),
        warmStartType: json['WarmStartType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines how to perform inference generation after a training job is run.
class InferenceSpecification {
  /// The Amazon ECR registry path of the Docker image that contains the
  /// inference code.
  final List<ModelPackageContainerDefinition> containers;

  /// A list of the instance types on which a transformation job can be run or
  /// on which an endpoint can be deployed.
  final List<String> supportedTransformInstanceTypes;

  /// A list of the instance types that are used to generate inferences in
  /// real-time.
  final List<String> supportedRealtimeInferenceInstanceTypes;

  /// The supported MIME types for the input data.
  final List<String> supportedContentTypes;

  /// The supported MIME types for the output data.
  final List<String> supportedResponseMimeTypes;

  InferenceSpecification({
    @required this.containers,
    @required this.supportedTransformInstanceTypes,
    @required this.supportedRealtimeInferenceInstanceTypes,
    @required this.supportedContentTypes,
    @required this.supportedResponseMimeTypes,
  });
  static InferenceSpecification fromJson(Map<String, dynamic> json) =>
      InferenceSpecification(
        containers: (json['Containers'] as List)
            .map((e) => ModelPackageContainerDefinition.fromJson(e))
            .toList(),
        supportedTransformInstanceTypes:
            (json['SupportedTransformInstanceTypes'] as List)
                .map((e) => e as String)
                .toList(),
        supportedRealtimeInferenceInstanceTypes:
            (json['SupportedRealtimeInferenceInstanceTypes'] as List)
                .map((e) => e as String)
                .toList(),
        supportedContentTypes: (json['SupportedContentTypes'] as List)
            .map((e) => e as String)
            .toList(),
        supportedResponseMimeTypes: (json['SupportedResponseMIMETypes'] as List)
            .map((e) => e as String)
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about the location of input model artifacts, the name
/// and shape of the expected data inputs, and the framework in which the model
/// was trained.
class InputConfig {
  /// The S3 path where the model artifacts, which result from model training,
  /// are stored. This path must point to a single gzip compressed tar archive
  /// (.tar.gz suffix).
  final String s3Uri;

  /// Specifies the name and shape of the expected data inputs for your trained
  /// model with a JSON dictionary form. The data inputs are
  /// InputConfig$Framework specific.
  ///
  /// *    `TensorFlow`: You must specify the name and shape (NHWC format) of
  /// the expected data inputs using a dictionary format for your trained model.
  /// The dictionary formats required for the console and CLI are different.
  ///
  ///     *   Examples for one input:
  ///
  ///         *   If using the console, `{"input":[1,1024,1024,3]}`
  ///
  ///         *   If using the CLI, `{"input":[1,1024,1024,3]}`
  ///
  ///
  ///     *   Examples for two inputs:
  ///
  ///         *   If using the console, `{"data1": [1,28,28,1],
  /// "data2":[1,28,28,1]}`
  ///
  ///         *   If using the CLI, `{"data1": [1,28,28,1],
  /// "data2":[1,28,28,1]}`
  ///
  ///
  ///
  /// *    `MXNET/ONNX`: You must specify the name and shape (NCHW format) of
  /// the expected data inputs in order using a dictionary format for your
  /// trained model. The dictionary formats required for the console and CLI are
  /// different.
  ///
  ///     *   Examples for one input:
  ///
  ///         *   If using the console, `{"data":[1,3,1024,1024]}`
  ///
  ///         *   If using the CLI, `{"data":[1,3,1024,1024]}`
  ///
  ///
  ///     *   Examples for two inputs:
  ///
  ///         *   If using the console, `{"var1": [1,1,28,28],
  /// "var2":[1,1,28,28]}`
  ///
  ///         *   If using the CLI, `{"var1": [1,1,28,28], "var2":[1,1,28,28]}`
  ///
  ///
  ///
  /// *    `PyTorch`: You can either specify the name and shape (NCHW format) of
  /// expected data inputs in order using a dictionary format for your trained
  /// model or you can specify the shape only using a list format. The
  /// dictionary formats required for the console and CLI are different. The
  /// list formats for the console and CLI are the same.
  ///
  ///     *   Examples for one input in dictionary format:
  ///
  ///         *   If using the console, `{"input0":[1,3,224,224]}`
  ///
  ///         *   If using the CLI, `{"input0":[1,3,224,224]}`
  ///
  ///
  ///     *   Example for one input in list format: `[[1,3,224,224]]`
  ///
  ///     *   Examples for two inputs in dictionary format:
  ///
  ///         *   If using the console, `{"input0":[1,3,224,224],
  /// "input1":[1,3,224,224]}`
  ///
  ///         *   If using the CLI, `{"input0":[1,3,224,224],
  /// "input1":[1,3,224,224]}`
  ///
  ///
  ///     *   Example for two inputs in list format: `[[1,3,224,224],
  /// [1,3,224,224]]`
  ///
  ///
  /// *    `XGBOOST`: input data name and shape are not needed.
  final String dataInputConfig;

  /// Identifies the framework in which the model was trained. For example:
  /// TENSORFLOW.
  final String framework;

  InputConfig({
    @required this.s3Uri,
    @required this.dataInputConfig,
    @required this.framework,
  });
  static InputConfig fromJson(Map<String, dynamic> json) => InputConfig(
        s3Uri: json['S3Uri'] as String,
        dataInputConfig: json['DataInputConfig'] as String,
        framework: json['Framework'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For a hyperparameter of the integer type, specifies the range that a
/// hyperparameter tuning job searches.
class IntegerParameterRange {
  /// The name of the hyperparameter to search.
  final String name;

  /// The minimum value of the hyperparameter to search.
  final String minValue;

  /// The maximum value of the hyperparameter to search.
  final String maxValue;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see
  /// [Hyperparameter Scaling](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type).
  /// One of the following values:
  ///
  /// Auto
  ///
  /// Amazon SageMaker hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  ///
  /// Linear
  ///
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  ///
  /// Logarithmic
  ///
  /// Hyperparemeter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have only values greater
  /// than 0.
  final String scalingType;

  IntegerParameterRange({
    @required this.name,
    @required this.minValue,
    @required this.maxValue,
    this.scalingType,
  });
  static IntegerParameterRange fromJson(Map<String, dynamic> json) =>
      IntegerParameterRange(
        name: json['Name'] as String,
        minValue: json['MinValue'] as String,
        maxValue: json['MaxValue'] as String,
        scalingType: json.containsKey('ScalingType')
            ? json['ScalingType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the possible values for an integer hyperparameter.
class IntegerParameterRangeSpecification {
  /// The minimum integer value allowed.
  final String minValue;

  /// The maximum integer value allowed.
  final String maxValue;

  IntegerParameterRangeSpecification({
    @required this.minValue,
    @required this.maxValue,
  });
  static IntegerParameterRangeSpecification fromJson(
          Map<String, dynamic> json) =>
      IntegerParameterRangeSpecification(
        minValue: json['MinValue'] as String,
        maxValue: json['MaxValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a breakdown of the number of objects labeled.
class LabelCounters {
  /// The total number of objects labeled.
  final int totalLabeled;

  /// The total number of objects labeled by a human worker.
  final int humanLabeled;

  /// The total number of objects labeled by automated data labeling.
  final int machineLabeled;

  /// The total number of objects that could not be labeled due to an error.
  final int failedNonRetryableError;

  /// The total number of objects not yet labeled.
  final int unlabeled;

  LabelCounters({
    this.totalLabeled,
    this.humanLabeled,
    this.machineLabeled,
    this.failedNonRetryableError,
    this.unlabeled,
  });
  static LabelCounters fromJson(Map<String, dynamic> json) => LabelCounters(
        totalLabeled: json.containsKey('TotalLabeled')
            ? json['TotalLabeled'] as int
            : null,
        humanLabeled: json.containsKey('HumanLabeled')
            ? json['HumanLabeled'] as int
            : null,
        machineLabeled: json.containsKey('MachineLabeled')
            ? json['MachineLabeled'] as int
            : null,
        failedNonRetryableError: json.containsKey('FailedNonRetryableError')
            ? json['FailedNonRetryableError'] as int
            : null,
        unlabeled:
            json.containsKey('Unlabeled') ? json['Unlabeled'] as int : null,
      );
}

/// Provides counts for human-labeled tasks in the labeling job.
class LabelCountersForWorkteam {
  /// The total number of data objects labeled by a human worker.
  final int humanLabeled;

  /// The total number of data objects that need to be labeled by a human
  /// worker.
  final int pendingHuman;

  /// The total number of tasks in the labeling job.
  final int total;

  LabelCountersForWorkteam({
    this.humanLabeled,
    this.pendingHuman,
    this.total,
  });
  static LabelCountersForWorkteam fromJson(Map<String, dynamic> json) =>
      LabelCountersForWorkteam(
        humanLabeled: json.containsKey('HumanLabeled')
            ? json['HumanLabeled'] as int
            : null,
        pendingHuman: json.containsKey('PendingHuman')
            ? json['PendingHuman'] as int
            : null,
        total: json.containsKey('Total') ? json['Total'] as int : null,
      );
}

/// Provides configuration information for auto-labeling of your data objects. A
/// `LabelingJobAlgorithmsConfig` object must be supplied in order to use
/// auto-labeling.
class LabelingJobAlgorithmsConfig {
  /// Specifies the Amazon Resource Name (ARN) of the algorithm used for
  /// auto-labeling. You must select one of the following ARNs:
  ///
  /// *    _Image classification_
  ///
  ///
  /// `arn:aws:sagemaker:_region_:027400017018:labeling-job-algorithm-specification/image-classification`
  ///
  /// *    _Text classification_
  ///
  ///
  /// `arn:aws:sagemaker:_region_:027400017018:labeling-job-algorithm-specification/text-classification`
  ///
  /// *    _Object detection_
  ///
  ///
  /// `arn:aws:sagemaker:_region_:027400017018:labeling-job-algorithm-specification/object-detection`
  ///
  /// *    _Semantic Segmentation_
  ///
  ///
  /// `arn:aws:sagemaker:_region_:027400017018:labeling-job-algorithm-specification/semantic-segmentation`
  final String labelingJobAlgorithmSpecificationArn;

  /// At the end of an auto-label job Amazon SageMaker Ground Truth sends the
  /// Amazon Resource Nam (ARN) of the final model used for auto-labeling. You
  /// can use this model as the starting point for subsequent similar jobs by
  /// providing the ARN of the model here.
  final String initialActiveLearningModelArn;

  /// Provides configuration information for a labeling job.
  final LabelingJobResourceConfig labelingJobResourceConfig;

  LabelingJobAlgorithmsConfig({
    @required this.labelingJobAlgorithmSpecificationArn,
    this.initialActiveLearningModelArn,
    this.labelingJobResourceConfig,
  });
  static LabelingJobAlgorithmsConfig fromJson(Map<String, dynamic> json) =>
      LabelingJobAlgorithmsConfig(
        labelingJobAlgorithmSpecificationArn:
            json['LabelingJobAlgorithmSpecificationArn'] as String,
        initialActiveLearningModelArn:
            json.containsKey('InitialActiveLearningModelArn')
                ? json['InitialActiveLearningModelArn'] as String
                : null,
        labelingJobResourceConfig: json.containsKey('LabelingJobResourceConfig')
            ? LabelingJobResourceConfig.fromJson(
                json['LabelingJobResourceConfig'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Attributes of the data specified by the customer. Use these to describe the
/// data to be labeled.
class LabelingJobDataAttributes {
  /// Declares that your content is free of personally identifiable information
  /// or adult content. Amazon SageMaker may restrict the Amazon Mechanical Turk
  /// workers that can view your task based on this information.
  final List<String> contentClassifiers;

  LabelingJobDataAttributes({
    this.contentClassifiers,
  });
  static LabelingJobDataAttributes fromJson(Map<String, dynamic> json) =>
      LabelingJobDataAttributes(
        contentClassifiers: json.containsKey('ContentClassifiers')
            ? (json['ContentClassifiers'] as List)
                .map((e) => e as String)
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the location of input data.
class LabelingJobDataSource {
  /// The Amazon S3 location of the input data objects.
  final LabelingJobS3DataSource s3DataSource;

  LabelingJobDataSource({
    @required this.s3DataSource,
  });
  static LabelingJobDataSource fromJson(Map<String, dynamic> json) =>
      LabelingJobDataSource(
        s3DataSource: LabelingJobS3DataSource.fromJson(json['S3DataSource']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information for a work team.
class LabelingJobForWorkteamSummary {
  /// The name of the labeling job that the work team is assigned to.
  final String labelingJobName;

  /// A unique identifier for a labeling job. You can use this to refer to a
  /// specific labeling job.
  final String jobReferenceCode;

  final String workRequesterAccountId;

  /// The date and time that the labeling job was created.
  final DateTime creationTime;

  /// Provides information about the progress of a labeling job.
  final LabelCountersForWorkteam labelCounters;

  /// The configured number of workers per data object.
  final int numberOfHumanWorkersPerDataObject;

  LabelingJobForWorkteamSummary({
    this.labelingJobName,
    @required this.jobReferenceCode,
    @required this.workRequesterAccountId,
    @required this.creationTime,
    this.labelCounters,
    this.numberOfHumanWorkersPerDataObject,
  });
  static LabelingJobForWorkteamSummary fromJson(Map<String, dynamic> json) =>
      LabelingJobForWorkteamSummary(
        labelingJobName: json.containsKey('LabelingJobName')
            ? json['LabelingJobName'] as String
            : null,
        jobReferenceCode: json['JobReferenceCode'] as String,
        workRequesterAccountId: json['WorkRequesterAccountId'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        labelCounters: json.containsKey('LabelCounters')
            ? LabelCountersForWorkteam.fromJson(json['LabelCounters'])
            : null,
        numberOfHumanWorkersPerDataObject:
            json.containsKey('NumberOfHumanWorkersPerDataObject')
                ? json['NumberOfHumanWorkersPerDataObject'] as int
                : null,
      );
}

/// Input configuration information for a labeling job.
class LabelingJobInputConfig {
  /// The location of the input data.
  final LabelingJobDataSource dataSource;

  /// Attributes of the data specified by the customer.
  final LabelingJobDataAttributes dataAttributes;

  LabelingJobInputConfig({
    @required this.dataSource,
    this.dataAttributes,
  });
  static LabelingJobInputConfig fromJson(Map<String, dynamic> json) =>
      LabelingJobInputConfig(
        dataSource: LabelingJobDataSource.fromJson(json['DataSource']),
        dataAttributes: json.containsKey('DataAttributes')
            ? LabelingJobDataAttributes.fromJson(json['DataAttributes'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the location of the output produced by the labeling job.
class LabelingJobOutput {
  /// The Amazon S3 bucket location of the manifest file for labeled data.
  final String outputDatasetS3Uri;

  /// The Amazon Resource Name (ARN) for the most recent Amazon SageMaker model
  /// trained as part of automated data labeling.
  final String finalActiveLearningModelArn;

  LabelingJobOutput({
    @required this.outputDatasetS3Uri,
    this.finalActiveLearningModelArn,
  });
  static LabelingJobOutput fromJson(Map<String, dynamic> json) =>
      LabelingJobOutput(
        outputDatasetS3Uri: json['OutputDatasetS3Uri'] as String,
        finalActiveLearningModelArn:
            json.containsKey('FinalActiveLearningModelArn')
                ? json['FinalActiveLearningModelArn'] as String
                : null,
      );
}

/// Output configuration information for a labeling job.
class LabelingJobOutputConfig {
  /// The Amazon S3 location to write output data.
  final String s3OutputPath;

  /// The AWS Key Management Service ID of the key used to encrypt the output
  /// data, if any.
  ///
  /// If you use a KMS key ID or an alias of your master key, the Amazon
  /// SageMaker execution role must include permissions to call `kms:Encrypt`.
  /// If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS
  /// key for Amazon S3 for your role's account. Amazon SageMaker uses
  /// server-side encryption with KMS-managed keys for
  /// `LabelingJobOutputConfig`. If you use a bucket policy with an
  /// `s3:PutObject` permission that only allows objects with server-side
  /// encryption, set the condition key of `s3:x-amz-server-side-encryption` to
  /// `"aws:kms"`. For more information, see
  /// [KMS-Managed Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html)
  /// in the _Amazon Simple Storage Service Developer Guide._
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify
  /// in your `CreateLabelingJob` request. For more information, see
  /// [Using Key Policies in AWS KMS](http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String kmsKeyId;

  LabelingJobOutputConfig({
    @required this.s3OutputPath,
    this.kmsKeyId,
  });
  static LabelingJobOutputConfig fromJson(Map<String, dynamic> json) =>
      LabelingJobOutputConfig(
        s3OutputPath: json['S3OutputPath'] as String,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides configuration information for labeling jobs.
class LabelingJobResourceConfig {
  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the training job. The `VolumeKmsKeyId` can be any of the
  /// following formats:
  ///
  /// *   // KMS Key ID
  ///
  ///      `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key
  ///
  ///
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  LabelingJobResourceConfig({
    this.volumeKmsKeyId,
  });
  static LabelingJobResourceConfig fromJson(Map<String, dynamic> json) =>
      LabelingJobResourceConfig(
        volumeKmsKeyId: json.containsKey('VolumeKmsKeyId')
            ? json['VolumeKmsKeyId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Amazon S3 location of the input data objects.
class LabelingJobS3DataSource {
  /// The Amazon S3 location of the manifest file that describes the input data
  /// objects.
  final String manifestS3Uri;

  LabelingJobS3DataSource({
    @required this.manifestS3Uri,
  });
  static LabelingJobS3DataSource fromJson(Map<String, dynamic> json) =>
      LabelingJobS3DataSource(
        manifestS3Uri: json['ManifestS3Uri'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A set of conditions for stopping a labeling job. If any of the conditions
/// are met, the job is automatically stopped. You can use these conditions to
/// control the cost of data labeling.
class LabelingJobStoppingConditions {
  /// The maximum number of objects that can be labeled by human workers.
  final int maxHumanLabeledObjectCount;

  /// The maximum number of input data objects that should be labeled.
  final int maxPercentageOfInputDatasetLabeled;

  LabelingJobStoppingConditions({
    this.maxHumanLabeledObjectCount,
    this.maxPercentageOfInputDatasetLabeled,
  });
  static LabelingJobStoppingConditions fromJson(Map<String, dynamic> json) =>
      LabelingJobStoppingConditions(
        maxHumanLabeledObjectCount:
            json.containsKey('MaxHumanLabeledObjectCount')
                ? json['MaxHumanLabeledObjectCount'] as int
                : null,
        maxPercentageOfInputDatasetLabeled:
            json.containsKey('MaxPercentageOfInputDatasetLabeled')
                ? json['MaxPercentageOfInputDatasetLabeled'] as int
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information about a labeling job.
class LabelingJobSummary {
  /// The name of the labeling job.
  final String labelingJobName;

  /// The Amazon Resource Name (ARN) assigned to the labeling job when it was
  /// created.
  final String labelingJobArn;

  /// The date and time that the job was created (timestamp).
  final DateTime creationTime;

  /// The date and time that the job was last modified (timestamp).
  final DateTime lastModifiedTime;

  /// The current status of the labeling job.
  final String labelingJobStatus;

  /// Counts showing the progress of the labeling job.
  final LabelCounters labelCounters;

  /// The Amazon Resource Name (ARN) of the work team assigned to the job.
  final String workteamArn;

  /// The Amazon Resource Name (ARN) of a Lambda function. The function is run
  /// before each data object is sent to a worker.
  final String preHumanTaskLambdaArn;

  /// The Amazon Resource Name (ARN) of the Lambda function used to consolidate
  /// the annotations from individual workers into a label for a data object.
  /// For more information, see
  /// [Annotation Consolidation](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html).
  final String annotationConsolidationLambdaArn;

  /// If the `LabelingJobStatus` field is `Failed`, this field contains a
  /// description of the error.
  final String failureReason;

  /// The location of the output produced by the labeling job.
  final LabelingJobOutput labelingJobOutput;

  /// Input configuration for the labeling job.
  final LabelingJobInputConfig inputConfig;

  LabelingJobSummary({
    @required this.labelingJobName,
    @required this.labelingJobArn,
    @required this.creationTime,
    @required this.lastModifiedTime,
    @required this.labelingJobStatus,
    @required this.labelCounters,
    @required this.workteamArn,
    @required this.preHumanTaskLambdaArn,
    this.annotationConsolidationLambdaArn,
    this.failureReason,
    this.labelingJobOutput,
    this.inputConfig,
  });
  static LabelingJobSummary fromJson(Map<String, dynamic> json) =>
      LabelingJobSummary(
        labelingJobName: json['LabelingJobName'] as String,
        labelingJobArn: json['LabelingJobArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        lastModifiedTime: DateTime.parse(json['LastModifiedTime']),
        labelingJobStatus: json['LabelingJobStatus'] as String,
        labelCounters: LabelCounters.fromJson(json['LabelCounters']),
        workteamArn: json['WorkteamArn'] as String,
        preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
        annotationConsolidationLambdaArn:
            json.containsKey('AnnotationConsolidationLambdaArn')
                ? json['AnnotationConsolidationLambdaArn'] as String
                : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        labelingJobOutput: json.containsKey('LabelingJobOutput')
            ? LabelingJobOutput.fromJson(json['LabelingJobOutput'])
            : null,
        inputConfig: json.containsKey('InputConfig')
            ? LabelingJobInputConfig.fromJson(json['InputConfig'])
            : null,
      );
}

class ListAlgorithmsOutput {
  /// >An array of `AlgorithmSummary` objects, each of which lists an algorithm.
  final List<AlgorithmSummary> algorithmSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of algorithms, use it in the subsequent request.
  final String nextToken;

  ListAlgorithmsOutput({
    @required this.algorithmSummaryList,
    this.nextToken,
  });
  static ListAlgorithmsOutput fromJson(Map<String, dynamic> json) =>
      ListAlgorithmsOutput(
        algorithmSummaryList: (json['AlgorithmSummaryList'] as List)
            .map((e) => AlgorithmSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListCodeRepositoriesOutput {
  /// Gets a list of summaries of the Git repositories. Each summary specifies
  /// the following values for the repository:
  ///
  /// *   Name
  ///
  /// *   Amazon Resource Name (ARN)
  ///
  /// *   Creation time
  ///
  /// *   Last modified time
  ///
  /// *   Configuration information, including the URL location of the
  /// repository and the ARN of the AWS Secrets Manager secret that contains the
  /// credentials used to access the repository.
  final List<CodeRepositorySummary> codeRepositorySummaryList;

  /// If the result of a `ListCodeRepositoriesOutput` request was truncated, the
  /// response includes a `NextToken`. To get the next set of Git repositories,
  /// use the token in the next request.
  final String nextToken;

  ListCodeRepositoriesOutput({
    @required this.codeRepositorySummaryList,
    this.nextToken,
  });
  static ListCodeRepositoriesOutput fromJson(Map<String, dynamic> json) =>
      ListCodeRepositoriesOutput(
        codeRepositorySummaryList: (json['CodeRepositorySummaryList'] as List)
            .map((e) => CodeRepositorySummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListCompilationJobsResponse {
  /// An array of CompilationJobSummary objects, each describing a model
  /// compilation job.
  final List<CompilationJobSummary> compilationJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this `NextToken`.
  /// To retrieve the next set of model compilation jobs, use this token in the
  /// next request.
  final String nextToken;

  ListCompilationJobsResponse({
    @required this.compilationJobSummaries,
    this.nextToken,
  });
  static ListCompilationJobsResponse fromJson(Map<String, dynamic> json) =>
      ListCompilationJobsResponse(
        compilationJobSummaries: (json['CompilationJobSummaries'] as List)
            .map((e) => CompilationJobSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListEndpointConfigsOutput {
  /// An array of endpoint configurations.
  final List<EndpointConfigSummary> endpointConfigs;

  ///  If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of endpoint configurations, use it in the subsequent
  /// request
  final String nextToken;

  ListEndpointConfigsOutput({
    @required this.endpointConfigs,
    this.nextToken,
  });
  static ListEndpointConfigsOutput fromJson(Map<String, dynamic> json) =>
      ListEndpointConfigsOutput(
        endpointConfigs: (json['EndpointConfigs'] as List)
            .map((e) => EndpointConfigSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListEndpointsOutput {
  ///  An array or endpoint objects.
  final List<EndpointSummary> endpoints;

  ///  If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of training jobs, use it in the subsequent request.
  final String nextToken;

  ListEndpointsOutput({
    @required this.endpoints,
    this.nextToken,
  });
  static ListEndpointsOutput fromJson(Map<String, dynamic> json) =>
      ListEndpointsOutput(
        endpoints: (json['Endpoints'] as List)
            .map((e) => EndpointSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListHyperParameterTuningJobsResponse {
  /// A list of HyperParameterTuningJobSummary objects that describe the tuning
  /// jobs that the `ListHyperParameterTuningJobs` request returned.
  final List<HyperParameterTuningJobSummary> hyperParameterTuningJobSummaries;

  /// If the result of this `ListHyperParameterTuningJobs` request was
  /// truncated, the response includes a `NextToken`. To retrieve the next set
  /// of tuning jobs, use the token in the next request.
  final String nextToken;

  ListHyperParameterTuningJobsResponse({
    @required this.hyperParameterTuningJobSummaries,
    this.nextToken,
  });
  static ListHyperParameterTuningJobsResponse fromJson(
          Map<String, dynamic> json) =>
      ListHyperParameterTuningJobsResponse(
        hyperParameterTuningJobSummaries:
            (json['HyperParameterTuningJobSummaries'] as List)
                .map((e) => HyperParameterTuningJobSummary.fromJson(e))
                .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListLabelingJobsForWorkteamResponse {
  /// An array of `LabelingJobSummary` objects, each describing a labeling job.
  final List<LabelingJobForWorkteamSummary> labelingJobSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of labeling jobs, use it in the subsequent request.
  final String nextToken;

  ListLabelingJobsForWorkteamResponse({
    @required this.labelingJobSummaryList,
    this.nextToken,
  });
  static ListLabelingJobsForWorkteamResponse fromJson(
          Map<String, dynamic> json) =>
      ListLabelingJobsForWorkteamResponse(
        labelingJobSummaryList: (json['LabelingJobSummaryList'] as List)
            .map((e) => LabelingJobForWorkteamSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListLabelingJobsResponse {
  /// An array of `LabelingJobSummary` objects, each describing a labeling job.
  final List<LabelingJobSummary> labelingJobSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of labeling jobs, use it in the subsequent request.
  final String nextToken;

  ListLabelingJobsResponse({
    this.labelingJobSummaryList,
    this.nextToken,
  });
  static ListLabelingJobsResponse fromJson(Map<String, dynamic> json) =>
      ListLabelingJobsResponse(
        labelingJobSummaryList: json.containsKey('LabelingJobSummaryList')
            ? (json['LabelingJobSummaryList'] as List)
                .map((e) => LabelingJobSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListModelPackagesOutput {
  /// An array of `ModelPackageSummary` objects, each of which lists a model
  /// package.
  final List<ModelPackageSummary> modelPackageSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of model packages, use it in the subsequent request.
  final String nextToken;

  ListModelPackagesOutput({
    @required this.modelPackageSummaryList,
    this.nextToken,
  });
  static ListModelPackagesOutput fromJson(Map<String, dynamic> json) =>
      ListModelPackagesOutput(
        modelPackageSummaryList: (json['ModelPackageSummaryList'] as List)
            .map((e) => ModelPackageSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListModelsOutput {
  /// An array of `ModelSummary` objects, each of which lists a model.
  final List<ModelSummary> models;

  ///  If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of models, use it in the subsequent request.
  final String nextToken;

  ListModelsOutput({
    @required this.models,
    this.nextToken,
  });
  static ListModelsOutput fromJson(Map<String, dynamic> json) =>
      ListModelsOutput(
        models: (json['Models'] as List)
            .map((e) => ModelSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListNotebookInstanceLifecycleConfigsOutput {
  /// If the response is truncated, Amazon SageMaker returns this token. To get
  /// the next set of lifecycle configurations, use it in the next request.
  final String nextToken;

  /// An array of `NotebookInstanceLifecycleConfiguration` objects, each listing
  /// a lifecycle configuration.
  final List<NotebookInstanceLifecycleConfigSummary>
      notebookInstanceLifecycleConfigs;

  ListNotebookInstanceLifecycleConfigsOutput({
    this.nextToken,
    this.notebookInstanceLifecycleConfigs,
  });
  static ListNotebookInstanceLifecycleConfigsOutput fromJson(
          Map<String, dynamic> json) =>
      ListNotebookInstanceLifecycleConfigsOutput(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        notebookInstanceLifecycleConfigs: json
                .containsKey('NotebookInstanceLifecycleConfigs')
            ? (json['NotebookInstanceLifecycleConfigs'] as List)
                .map((e) => NotebookInstanceLifecycleConfigSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListNotebookInstancesOutput {
  /// If the response to the previous `ListNotebookInstances` request was
  /// truncated, Amazon SageMaker returns this token. To retrieve the next set
  /// of notebook instances, use the token in the next request.
  final String nextToken;

  /// An array of `NotebookInstanceSummary` objects, one for each notebook
  /// instance.
  final List<NotebookInstanceSummary> notebookInstances;

  ListNotebookInstancesOutput({
    this.nextToken,
    this.notebookInstances,
  });
  static ListNotebookInstancesOutput fromJson(Map<String, dynamic> json) =>
      ListNotebookInstancesOutput(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        notebookInstances: json.containsKey('NotebookInstances')
            ? (json['NotebookInstances'] as List)
                .map((e) => NotebookInstanceSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListSubscribedWorkteamsResponse {
  /// An array of `Workteam` objects, each describing a work team.
  final List<SubscribedWorkteam> subscribedWorkteams;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of work teams, use it in the subsequent request.
  final String nextToken;

  ListSubscribedWorkteamsResponse({
    @required this.subscribedWorkteams,
    this.nextToken,
  });
  static ListSubscribedWorkteamsResponse fromJson(Map<String, dynamic> json) =>
      ListSubscribedWorkteamsResponse(
        subscribedWorkteams: (json['SubscribedWorkteams'] as List)
            .map((e) => SubscribedWorkteam.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTagsOutput {
  /// An array of `Tag` objects, each with a tag key and a value.
  final List<Tag> tags;

  ///  If response is truncated, Amazon SageMaker includes a token in the
  /// response. You can use this token in your subsequent request to fetch next
  /// set of tokens.
  final String nextToken;

  ListTagsOutput({
    this.tags,
    this.nextToken,
  });
  static ListTagsOutput fromJson(Map<String, dynamic> json) => ListTagsOutput(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTrainingJobsForHyperParameterTuningJobResponse {
  /// A list of TrainingJobSummary objects that describe the training jobs that
  /// the `ListTrainingJobsForHyperParameterTuningJob` request returned.
  final List<HyperParameterTrainingJobSummary> trainingJobSummaries;

  /// If the result of this `ListTrainingJobsForHyperParameterTuningJob` request
  /// was truncated, the response includes a `NextToken`. To retrieve the next
  /// set of training jobs, use the token in the next request.
  final String nextToken;

  ListTrainingJobsForHyperParameterTuningJobResponse({
    @required this.trainingJobSummaries,
    this.nextToken,
  });
  static ListTrainingJobsForHyperParameterTuningJobResponse fromJson(
          Map<String, dynamic> json) =>
      ListTrainingJobsForHyperParameterTuningJobResponse(
        trainingJobSummaries: (json['TrainingJobSummaries'] as List)
            .map((e) => HyperParameterTrainingJobSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTrainingJobsResponse {
  /// An array of `TrainingJobSummary` objects, each listing a training job.
  final List<TrainingJobSummary> trainingJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of training jobs, use it in the subsequent request.
  final String nextToken;

  ListTrainingJobsResponse({
    @required this.trainingJobSummaries,
    this.nextToken,
  });
  static ListTrainingJobsResponse fromJson(Map<String, dynamic> json) =>
      ListTrainingJobsResponse(
        trainingJobSummaries: (json['TrainingJobSummaries'] as List)
            .map((e) => TrainingJobSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListTransformJobsResponse {
  /// An array of `TransformJobSummary` objects.
  final List<TransformJobSummary> transformJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of transform jobs, use it in the next request.
  final String nextToken;

  ListTransformJobsResponse({
    @required this.transformJobSummaries,
    this.nextToken,
  });
  static ListTransformJobsResponse fromJson(Map<String, dynamic> json) =>
      ListTransformJobsResponse(
        transformJobSummaries: (json['TransformJobSummaries'] as List)
            .map((e) => TransformJobSummary.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListWorkteamsResponse {
  /// An array of `Workteam` objects, each describing a work team.
  final List<Workteam> workteams;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of work teams, use it in the subsequent request.
  final String nextToken;

  ListWorkteamsResponse({
    @required this.workteams,
    this.nextToken,
  });
  static ListWorkteamsResponse fromJson(Map<String, dynamic> json) =>
      ListWorkteamsResponse(
        workteams: (json['Workteams'] as List)
            .map((e) => Workteam.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Defines the Amazon Cognito user group that is part of a work team.
class MemberDefinition {
  /// The Amazon Cognito user group that is part of the work team.
  final CognitoMemberDefinition cognitoMemberDefinition;

  MemberDefinition({
    this.cognitoMemberDefinition,
  });
  static MemberDefinition fromJson(Map<String, dynamic> json) =>
      MemberDefinition(
        cognitoMemberDefinition: json.containsKey('CognitoMemberDefinition')
            ? CognitoMemberDefinition.fromJson(json['CognitoMemberDefinition'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The name, value, and date and time of a metric that was emitted to Amazon
/// CloudWatch.
class MetricData {
  /// The name of the metric.
  final String metricName;

  /// The value of the metric.
  final double value;

  /// The date and time that the algorithm emitted the metric.
  final DateTime timestamp;

  MetricData({
    this.metricName,
    this.value,
    this.timestamp,
  });
  static MetricData fromJson(Map<String, dynamic> json) => MetricData(
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        value: json.containsKey('Value') ? json['Value'] as double : null,
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
      );
}

/// Specifies a metric that the training algorithm writes to `stderr` or
/// `stdout` . Amazon SageMakerhyperparameter tuning captures all defined
/// metrics. You specify one metric that a hyperparameter tuning job uses as its
/// objective metric to choose the best training job.
class MetricDefinition {
  /// The name of the metric.
  final String name;

  /// A regular expression that searches the output of a training job and gets
  /// the value of the metric. For more information about using regular
  /// expressions to define metrics, see
  /// [Defining Objective Metrics](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-metrics.html).
  final String regex;

  MetricDefinition({
    @required this.name,
    @required this.regex,
  });
  static MetricDefinition fromJson(Map<String, dynamic> json) =>
      MetricDefinition(
        name: json['Name'] as String,
        regex: json['Regex'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about the location that is configured for storing model
/// artifacts.
class ModelArtifacts {
  /// The path of the S3 object that contains the model artifacts. For example,
  /// `s3://bucket-name/keynameprefix/model.tar.gz`.
  final String s3ModelArtifacts;

  ModelArtifacts({
    @required this.s3ModelArtifacts,
  });
  static ModelArtifacts fromJson(Map<String, dynamic> json) => ModelArtifacts(
        s3ModelArtifacts: json['S3ModelArtifacts'] as String,
      );
}

/// Describes the Docker container for the model package.
class ModelPackageContainerDefinition {
  /// The DNS host name for the Docker container.
  final String containerHostname;

  /// The Amazon EC2 Container Registry (Amazon ECR) path where inference code
  /// is stored.
  ///
  /// If you are using your own custom algorithm instead of an algorithm
  /// provided by Amazon SageMaker, the inference code must meet Amazon
  /// SageMaker requirements. Amazon SageMaker supports both
  /// `registry/repository[:tag]` and `registry/repository[@digest]` image path
  /// formats. For more information, see
  /// [Using Your Own Algorithms with Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html).
  final String image;

  /// An MD5 hash of the training algorithm that identifies the Docker image
  /// used for training.
  final String imageDigest;

  /// The Amazon S3 path where the model artifacts, which result from model
  /// training, are stored. This path must point to a single `gzip` compressed
  /// tar archive (`.tar.gz` suffix).
  final String modelDataUrl;

  /// The AWS Marketplace product ID of the model package.
  final String productId;

  ModelPackageContainerDefinition({
    this.containerHostname,
    @required this.image,
    this.imageDigest,
    this.modelDataUrl,
    this.productId,
  });
  static ModelPackageContainerDefinition fromJson(Map<String, dynamic> json) =>
      ModelPackageContainerDefinition(
        containerHostname: json.containsKey('ContainerHostname')
            ? json['ContainerHostname'] as String
            : null,
        image: json['Image'] as String,
        imageDigest: json.containsKey('ImageDigest')
            ? json['ImageDigest'] as String
            : null,
        modelDataUrl: json.containsKey('ModelDataUrl')
            ? json['ModelDataUrl'] as String
            : null,
        productId:
            json.containsKey('ProductId') ? json['ProductId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the validation and image scan statuses of the model package.
class ModelPackageStatusDetails {
  /// The validation status of the model package.
  final List<ModelPackageStatusItem> validationStatuses;

  /// The status of the scan of the Docker image container for the model
  /// package.
  final List<ModelPackageStatusItem> imageScanStatuses;

  ModelPackageStatusDetails({
    @required this.validationStatuses,
    this.imageScanStatuses,
  });
  static ModelPackageStatusDetails fromJson(Map<String, dynamic> json) =>
      ModelPackageStatusDetails(
        validationStatuses: (json['ValidationStatuses'] as List)
            .map((e) => ModelPackageStatusItem.fromJson(e))
            .toList(),
        imageScanStatuses: json.containsKey('ImageScanStatuses')
            ? (json['ImageScanStatuses'] as List)
                .map((e) => ModelPackageStatusItem.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the overall status of a model package.
class ModelPackageStatusItem {
  /// The name of the model package for which the overall status is being
  /// reported.
  final String name;

  /// The current status.
  final String status;

  /// if the overall status is `Failed`, the reason for the failure.
  final String failureReason;

  ModelPackageStatusItem({
    @required this.name,
    @required this.status,
    this.failureReason,
  });
  static ModelPackageStatusItem fromJson(Map<String, dynamic> json) =>
      ModelPackageStatusItem(
        name: json['Name'] as String,
        status: json['Status'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

/// Provides summary information about a model package.
class ModelPackageSummary {
  /// The name of the model package.
  final String modelPackageName;

  /// The Amazon Resource Name (ARN) of the model package.
  final String modelPackageArn;

  /// A brief description of the model package.
  final String modelPackageDescription;

  /// A timestamp that shows when the model package was created.
  final DateTime creationTime;

  /// The overall status of the model package.
  final String modelPackageStatus;

  ModelPackageSummary({
    @required this.modelPackageName,
    @required this.modelPackageArn,
    this.modelPackageDescription,
    @required this.creationTime,
    @required this.modelPackageStatus,
  });
  static ModelPackageSummary fromJson(Map<String, dynamic> json) =>
      ModelPackageSummary(
        modelPackageName: json['ModelPackageName'] as String,
        modelPackageArn: json['ModelPackageArn'] as String,
        modelPackageDescription: json.containsKey('ModelPackageDescription')
            ? json['ModelPackageDescription'] as String
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
        modelPackageStatus: json['ModelPackageStatus'] as String,
      );
}

/// Contains data, such as the inputs and targeted instance types that are used
/// in the process of validating the model package.
///
/// The data provided in the validation profile is made available to your buyers
/// on AWS Marketplace.
class ModelPackageValidationProfile {
  /// The name of the profile for the model package.
  final String profileName;

  /// The `TransformJobDefinition` object that describes the transform job used
  /// for the validation of the model package.
  final TransformJobDefinition transformJobDefinition;

  ModelPackageValidationProfile({
    @required this.profileName,
    @required this.transformJobDefinition,
  });
  static ModelPackageValidationProfile fromJson(Map<String, dynamic> json) =>
      ModelPackageValidationProfile(
        profileName: json['ProfileName'] as String,
        transformJobDefinition:
            TransformJobDefinition.fromJson(json['TransformJobDefinition']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies batch transform jobs that Amazon SageMaker runs to validate your
/// model package.
class ModelPackageValidationSpecification {
  /// The IAM roles to be used for the validation of the model package.
  final String validationRole;

  /// An array of `ModelPackageValidationProfile` objects, each of which
  /// specifies a batch transform job that Amazon SageMaker runs to validate
  /// your model package.
  final List<ModelPackageValidationProfile> validationProfiles;

  ModelPackageValidationSpecification({
    @required this.validationRole,
    @required this.validationProfiles,
  });
  static ModelPackageValidationSpecification fromJson(
          Map<String, dynamic> json) =>
      ModelPackageValidationSpecification(
        validationRole: json['ValidationRole'] as String,
        validationProfiles: (json['ValidationProfiles'] as List)
            .map((e) => ModelPackageValidationProfile.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information about a model.
class ModelSummary {
  /// The name of the model that you want a summary for.
  final String modelName;

  /// The Amazon Resource Name (ARN) of the model.
  final String modelArn;

  /// A timestamp that indicates when the model was created.
  final DateTime creationTime;

  ModelSummary({
    @required this.modelName,
    @required this.modelArn,
    @required this.creationTime,
  });
  static ModelSummary fromJson(Map<String, dynamic> json) => ModelSummary(
        modelName: json['ModelName'] as String,
        modelArn: json['ModelArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
      );
}

/// Defines a list of `NestedFilters` objects. To satisfy the conditions
/// specified in the `NestedFilters` call, a resource must satisfy the
/// conditions of all of the filters.
///
/// For example, you could define a `NestedFilters` using the training job's
/// `InputDataConfig` property to filter on `Channel` objects.
///
/// A `NestedFilters` object contains multiple filters. For example, to find all
/// training jobs whose name contains `train` and that have `cat/data` in their
/// `S3Uri` (specified in `InputDataConfig`), you need to create a
/// `NestedFilters` object that specifies the `InputDataConfig` property with
/// the following `Filter` objects:
///
/// *    `'{Name:"InputDataConfig.ChannelName", "Operator":"EQUALS",
/// "Value":"train"}',`
///
/// *    `'{Name:"InputDataConfig.DataSource.S3DataSource.S3Uri",
/// "Operator":"CONTAINS", "Value":"cat/data"}'`
class NestedFilters {
  /// The name of the property to use in the nested filters. The value must
  /// match a listed property name, such as `InputDataConfig` .
  final String nestedPropertyName;

  /// A list of filters. Each filter acts on a property. Filters must contain at
  /// least one `Filters` value. For example, a `NestedFilters` call might
  /// include a filter on the `PropertyName` parameter of the `InputDataConfig`
  /// property: `InputDataConfig.DataSource.S3DataSource.S3Uri`.
  final List<Filter> filters;

  NestedFilters({
    @required this.nestedPropertyName,
    @required this.filters,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a summary of a notebook instance lifecycle configuration.
class NotebookInstanceLifecycleConfigSummary {
  /// The name of the lifecycle configuration.
  final String notebookInstanceLifecycleConfigName;

  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  final String notebookInstanceLifecycleConfigArn;

  /// A timestamp that tells when the lifecycle configuration was created.
  final DateTime creationTime;

  /// A timestamp that tells when the lifecycle configuration was last modified.
  final DateTime lastModifiedTime;

  NotebookInstanceLifecycleConfigSummary({
    @required this.notebookInstanceLifecycleConfigName,
    @required this.notebookInstanceLifecycleConfigArn,
    this.creationTime,
    this.lastModifiedTime,
  });
  static NotebookInstanceLifecycleConfigSummary fromJson(
          Map<String, dynamic> json) =>
      NotebookInstanceLifecycleConfigSummary(
        notebookInstanceLifecycleConfigName:
            json['NotebookInstanceLifecycleConfigName'] as String,
        notebookInstanceLifecycleConfigArn:
            json['NotebookInstanceLifecycleConfigArn'] as String,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
      );
}

/// Contains the notebook instance lifecycle configuration script.
///
/// Each lifecycle configuration script has a limit of 16384 characters.
///
/// The value of the `$PATH` environment variable that is available to both
/// scripts is `/sbin:bin:/usr/sbin:/usr/bin`.
///
/// View CloudWatch Logs for notebook instance lifecycle configurations in log
/// group `/aws/sagemaker/NotebookInstances` in log stream
/// `[notebook-instance-name]/[LifecycleConfigHook]`.
///
/// Lifecycle configuration scripts cannot run for longer than 5 minutes. If a
/// script runs for longer than 5 minutes, it fails and the notebook instance is
/// not created or started.
///
/// For information about notebook instance lifestyle configurations, see
/// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
class NotebookInstanceLifecycleHook {
  /// A base64-encoded string that contains a shell script for a notebook
  /// instance lifecycle configuration.
  final String content;

  NotebookInstanceLifecycleHook({
    this.content,
  });
  static NotebookInstanceLifecycleHook fromJson(Map<String, dynamic> json) =>
      NotebookInstanceLifecycleHook(
        content: json.containsKey('Content') ? json['Content'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides summary information for an Amazon SageMaker notebook instance.
class NotebookInstanceSummary {
  /// The name of the notebook instance that you want a summary for.
  final String notebookInstanceName;

  /// The Amazon Resource Name (ARN) of the notebook instance.
  final String notebookInstanceArn;

  /// The status of the notebook instance.
  final String notebookInstanceStatus;

  /// The URL that you use to connect to the Jupyter instance running in your
  /// notebook instance.
  final String url;

  /// The type of ML compute instance that the notebook instance is running on.
  final String instanceType;

  /// A timestamp that shows when the notebook instance was created.
  final DateTime creationTime;

  /// A timestamp that shows when the notebook instance was last modified.
  final DateTime lastModifiedTime;

  /// The name of a notebook instance lifecycle configuration associated with
  /// this notebook instance.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  final String notebookInstanceLifecycleConfigName;

  /// The Git repository associated with the notebook instance as its default
  /// code repository. This can be either the name of a Git repository stored as
  /// a resource in your account, or the URL of a Git repository in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. When you open a notebook instance, it
  /// opens in the directory that contains this repository. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  final String defaultCodeRepository;

  /// An array of up to three Git repositories associated with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in
  /// [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository. These repositories are cloned at the same
  /// level as the default repository of your notebook instance. For more
  /// information, see
  /// [Associating Git Repositories with Amazon SageMaker Notebook Instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html).
  final List<String> additionalCodeRepositories;

  NotebookInstanceSummary({
    @required this.notebookInstanceName,
    @required this.notebookInstanceArn,
    this.notebookInstanceStatus,
    this.url,
    this.instanceType,
    this.creationTime,
    this.lastModifiedTime,
    this.notebookInstanceLifecycleConfigName,
    this.defaultCodeRepository,
    this.additionalCodeRepositories,
  });
  static NotebookInstanceSummary fromJson(Map<String, dynamic> json) =>
      NotebookInstanceSummary(
        notebookInstanceName: json['NotebookInstanceName'] as String,
        notebookInstanceArn: json['NotebookInstanceArn'] as String,
        notebookInstanceStatus: json.containsKey('NotebookInstanceStatus')
            ? json['NotebookInstanceStatus'] as String
            : null,
        url: json.containsKey('Url') ? json['Url'] as String : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        notebookInstanceLifecycleConfigName:
            json.containsKey('NotebookInstanceLifecycleConfigName')
                ? json['NotebookInstanceLifecycleConfigName'] as String
                : null,
        defaultCodeRepository: json.containsKey('DefaultCodeRepository')
            ? json['DefaultCodeRepository'] as String
            : null,
        additionalCodeRepositories:
            json.containsKey('AdditionalCodeRepositories')
                ? (json['AdditionalCodeRepositories'] as List)
                    .map((e) => e as String)
                    .toList()
                : null,
      );
}

/// Configures SNS notifications of available or expiring work items for work
/// teams.
class NotificationConfiguration {
  /// The ARN for the SNS topic to which notifications should be published.
  final String notificationTopicArn;

  NotificationConfiguration({
    this.notificationTopicArn,
  });
  static NotificationConfiguration fromJson(Map<String, dynamic> json) =>
      NotificationConfiguration(
        notificationTopicArn: json.containsKey('NotificationTopicArn')
            ? json['NotificationTopicArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the number of training jobs that this hyperparameter tuning job
/// launched, categorized by the status of their objective metric. The objective
/// metric status shows whether the final objective metric for the training job
/// has been evaluated by the tuning job and used in the hyperparameter tuning
/// process.
class ObjectiveStatusCounters {
  /// The number of training jobs whose final objective metric was evaluated by
  /// the hyperparameter tuning job and used in the hyperparameter tuning
  /// process.
  final int succeeded;

  /// The number of training jobs that are in progress and pending evaluation of
  /// their final objective metric.
  final int pending;

  /// The number of training jobs whose final objective metric was not evaluated
  /// and used in the hyperparameter tuning process. This typically occurs when
  /// the training job failed or did not emit an objective metric.
  final int failed;

  ObjectiveStatusCounters({
    this.succeeded,
    this.pending,
    this.failed,
  });
  static ObjectiveStatusCounters fromJson(Map<String, dynamic> json) =>
      ObjectiveStatusCounters(
        succeeded:
            json.containsKey('Succeeded') ? json['Succeeded'] as int : null,
        pending: json.containsKey('Pending') ? json['Pending'] as int : null,
        failed: json.containsKey('Failed') ? json['Failed'] as int : null,
      );
}

/// Contains information about the output location for the compiled model and
/// the device (target) that the model runs on.
class OutputConfig {
  /// Identifies the S3 path where you want Amazon SageMaker to store the model
  /// artifacts. For example, s3://bucket-name/key-name-prefix.
  final String s3OutputLocation;

  /// Identifies the device that you want to run your model on after it has been
  /// compiled. For example: ml_c5.
  final String targetDevice;

  OutputConfig({
    @required this.s3OutputLocation,
    @required this.targetDevice,
  });
  static OutputConfig fromJson(Map<String, dynamic> json) => OutputConfig(
        s3OutputLocation: json['S3OutputLocation'] as String,
        targetDevice: json['TargetDevice'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides information about how to store model training results (model
/// artifacts).
class OutputDataConfig {
  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the model artifacts at rest using Amazon S3 server-side
  /// encryption. The `KmsKeyId` can be any of the following formats:
  ///
  /// *   // KMS Key ID
  ///
  ///      `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key
  ///
  ///
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // KMS Key Alias
  ///
  ///      `"alias/ExampleAlias"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key Alias
  ///
  ///      `"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"`
  ///
  ///
  /// If you use a KMS key ID or an alias of your master key, the Amazon
  /// SageMaker execution role must include permissions to call `kms:Encrypt`.
  /// If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS
  /// key for Amazon S3 for your role's account. Amazon SageMaker uses
  /// server-side encryption with KMS-managed keys for `OutputDataConfig`. If
  /// you use a bucket policy with an `s3:PutObject` permission that only allows
  /// objects with server-side encryption, set the condition key of
  /// `s3:x-amz-server-side-encryption` to `"aws:kms"`. For more information,
  /// see
  /// [KMS-Managed Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html)
  /// in the _Amazon Simple Storage Service Developer Guide._
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify
  /// in your `CreateTrainingJob`, `CreateTransformJob`, or
  /// `CreateHyperParameterTuningJob` requests. For more information, see
  /// [Using Key Policies in AWS KMS](https://docs.aws.amazon.com/http:/docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String kmsKeyId;

  /// Identifies the S3 path where you want Amazon SageMaker to store the model
  /// artifacts. For example, `s3://bucket-name/key-name-prefix`.
  final String s3OutputPath;

  OutputDataConfig({
    this.kmsKeyId,
    @required this.s3OutputPath,
  });
  static OutputDataConfig fromJson(Map<String, dynamic> json) =>
      OutputDataConfig(
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
        s3OutputPath: json['S3OutputPath'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the possible values for categorical, continuous, and integer
/// hyperparameters to be used by an algorithm.
class ParameterRange {
  /// A `IntegerParameterRangeSpecification` object that defines the possible
  /// values for an integer hyperparameter.
  final IntegerParameterRangeSpecification integerParameterRangeSpecification;

  /// A `ContinuousParameterRangeSpecification` object that defines the possible
  /// values for a continuous hyperparameter.
  final ContinuousParameterRangeSpecification
      continuousParameterRangeSpecification;

  /// A `CategoricalParameterRangeSpecification` object that defines the
  /// possible values for a categorical hyperparameter.
  final CategoricalParameterRangeSpecification
      categoricalParameterRangeSpecification;

  ParameterRange({
    this.integerParameterRangeSpecification,
    this.continuousParameterRangeSpecification,
    this.categoricalParameterRangeSpecification,
  });
  static ParameterRange fromJson(Map<String, dynamic> json) => ParameterRange(
        integerParameterRangeSpecification:
            json.containsKey('IntegerParameterRangeSpecification')
                ? IntegerParameterRangeSpecification.fromJson(
                    json['IntegerParameterRangeSpecification'])
                : null,
        continuousParameterRangeSpecification:
            json.containsKey('ContinuousParameterRangeSpecification')
                ? ContinuousParameterRangeSpecification.fromJson(
                    json['ContinuousParameterRangeSpecification'])
                : null,
        categoricalParameterRangeSpecification:
            json.containsKey('CategoricalParameterRangeSpecification')
                ? CategoricalParameterRangeSpecification.fromJson(
                    json['CategoricalParameterRangeSpecification'])
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies ranges of integer, continuous, and categorical hyperparameters
/// that a hyperparameter tuning job searches. The hyperparameter tuning job
/// launches training jobs with hyperparameter values within these ranges to
/// find the combination of values that result in the training job with the best
/// performance as measured by the objective metric of the hyperparameter tuning
/// job.
///
///
///
/// You can specify a maximum of 20 hyperparameters that a hyperparameter tuning
/// job can search over. Every possible value of a categorical parameter range
/// counts against this limit.
class ParameterRanges {
  /// The array of IntegerParameterRange objects that specify ranges of integer
  /// hyperparameters that a hyperparameter tuning job searches.
  final List<IntegerParameterRange> integerParameterRanges;

  /// The array of ContinuousParameterRange objects that specify ranges of
  /// continuous hyperparameters that a hyperparameter tuning job searches.
  final List<ContinuousParameterRange> continuousParameterRanges;

  /// The array of CategoricalParameterRange objects that specify ranges of
  /// categorical hyperparameters that a hyperparameter tuning job searches.
  final List<CategoricalParameterRange> categoricalParameterRanges;

  ParameterRanges({
    this.integerParameterRanges,
    this.continuousParameterRanges,
    this.categoricalParameterRanges,
  });
  static ParameterRanges fromJson(Map<String, dynamic> json) => ParameterRanges(
        integerParameterRanges: json.containsKey('IntegerParameterRanges')
            ? (json['IntegerParameterRanges'] as List)
                .map((e) => IntegerParameterRange.fromJson(e))
                .toList()
            : null,
        continuousParameterRanges: json.containsKey('ContinuousParameterRanges')
            ? (json['ContinuousParameterRanges'] as List)
                .map((e) => ContinuousParameterRange.fromJson(e))
                .toList()
            : null,
        categoricalParameterRanges:
            json.containsKey('CategoricalParameterRanges')
                ? (json['CategoricalParameterRanges'] as List)
                    .map((e) => CategoricalParameterRange.fromJson(e))
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A previously completed or stopped hyperparameter tuning job to be used as a
/// starting point for a new hyperparameter tuning job.
class ParentHyperParameterTuningJob {
  /// The name of the hyperparameter tuning job to be used as a starting point
  /// for a new hyperparameter tuning job.
  final String hyperParameterTuningJobName;

  ParentHyperParameterTuningJob({
    this.hyperParameterTuningJobName,
  });
  static ParentHyperParameterTuningJob fromJson(Map<String, dynamic> json) =>
      ParentHyperParameterTuningJob(
        hyperParameterTuningJobName:
            json.containsKey('HyperParameterTuningJobName')
                ? json['HyperParameterTuningJobName'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Identifies a model that you want to host and the resources to deploy for
/// hosting it. If you are deploying multiple models, tell Amazon SageMaker how
/// to distribute traffic among the models by specifying variant weights.
class ProductionVariant {
  /// The name of the production variant.
  final String variantName;

  /// The name of the model that you want to host. This is the name that you
  /// specified when creating the model.
  final String modelName;

  /// Number of instances to launch initially.
  final int initialInstanceCount;

  /// The ML compute instance type.
  final String instanceType;

  /// Determines initial traffic distribution among all of the models that you
  /// specify in the endpoint configuration. The traffic to a production variant
  /// is determined by the ratio of the `VariantWeight` to the sum of all
  /// `VariantWeight` values across all ProductionVariants. If unspecified, it
  /// defaults to 1.0.
  final double initialVariantWeight;

  /// The size of the Elastic Inference (EI) instance to use for the production
  /// variant. EI instances provide on-demand GPU computing for inference. For
  /// more information, see
  /// [Using Elastic Inference in Amazon SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html).
  final String acceleratorType;

  ProductionVariant({
    @required this.variantName,
    @required this.modelName,
    @required this.initialInstanceCount,
    @required this.instanceType,
    this.initialVariantWeight,
    this.acceleratorType,
  });
  static ProductionVariant fromJson(Map<String, dynamic> json) =>
      ProductionVariant(
        variantName: json['VariantName'] as String,
        modelName: json['ModelName'] as String,
        initialInstanceCount: json['InitialInstanceCount'] as int,
        instanceType: json['InstanceType'] as String,
        initialVariantWeight: json.containsKey('InitialVariantWeight')
            ? json['InitialVariantWeight'] as double
            : null,
        acceleratorType: json.containsKey('AcceleratorType')
            ? json['AcceleratorType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes weight and capacities for a production variant associated with an
/// endpoint. If you sent a request to the `UpdateEndpointWeightsAndCapacities`
/// API and the endpoint status is `Updating`, you get different desired and
/// current values.
class ProductionVariantSummary {
  /// The name of the variant.
  final String variantName;

  /// An array of `DeployedImage` objects that specify the Amazon EC2 Container
  /// Registry paths of the inference images deployed on instances of this
  /// `ProductionVariant`.
  final List<DeployedImage> deployedImages;

  /// The weight associated with the variant.
  final double currentWeight;

  /// The requested weight, as specified in the
  /// `UpdateEndpointWeightsAndCapacities` request.
  final double desiredWeight;

  /// The number of instances associated with the variant.
  final int currentInstanceCount;

  /// The number of instances requested in the
  /// `UpdateEndpointWeightsAndCapacities` request.
  final int desiredInstanceCount;

  ProductionVariantSummary({
    @required this.variantName,
    this.deployedImages,
    this.currentWeight,
    this.desiredWeight,
    this.currentInstanceCount,
    this.desiredInstanceCount,
  });
  static ProductionVariantSummary fromJson(Map<String, dynamic> json) =>
      ProductionVariantSummary(
        variantName: json['VariantName'] as String,
        deployedImages: json.containsKey('DeployedImages')
            ? (json['DeployedImages'] as List)
                .map((e) => DeployedImage.fromJson(e))
                .toList()
            : null,
        currentWeight: json.containsKey('CurrentWeight')
            ? json['CurrentWeight'] as double
            : null,
        desiredWeight: json.containsKey('DesiredWeight')
            ? json['DesiredWeight'] as double
            : null,
        currentInstanceCount: json.containsKey('CurrentInstanceCount')
            ? json['CurrentInstanceCount'] as int
            : null,
        desiredInstanceCount: json.containsKey('DesiredInstanceCount')
            ? json['DesiredInstanceCount'] as int
            : null,
      );
}

/// A type of `SuggestionQuery`. A suggestion query for retrieving property
/// names that match the specified hint.
class PropertyNameQuery {
  /// Text that is part of a property's name. The property names of
  /// hyperparameter, metric, and tag key names that begin with the specified
  /// text in the `PropertyNameHint`.
  final String propertyNameHint;

  PropertyNameQuery({
    @required this.propertyNameHint,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A property name returned from a `GetSearchSuggestions` call that specifies a
/// value in the `PropertyNameQuery` field.
class PropertyNameSuggestion {
  /// A suggested property name based on what you entered in the search textbox
  /// in the Amazon SageMaker console.
  final String propertyName;

  PropertyNameSuggestion({
    this.propertyName,
  });
  static PropertyNameSuggestion fromJson(Map<String, dynamic> json) =>
      PropertyNameSuggestion(
        propertyName: json.containsKey('PropertyName')
            ? json['PropertyName'] as String
            : null,
      );
}

/// Defines the amount of money paid to an Amazon Mechanical Turk worker for
/// each task performed.
///
/// Use one of the following prices for bounding box tasks. Prices are in US
/// dollars and should be based on the complexity of the task; the longer it
/// takes in your initial testing, the more you should offer.
///
/// *   0.036
///
/// *   0.048
///
/// *   0.060
///
/// *   0.072
///
/// *   0.120
///
/// *   0.240
///
/// *   0.360
///
/// *   0.480
///
/// *   0.600
///
/// *   0.720
///
/// *   0.840
///
/// *   0.960
///
/// *   1.080
///
/// *   1.200
///
///
/// Use one of the following prices for image classification, text
/// classification, and custom tasks. Prices are in US dollars.
///
/// *   0.012
///
/// *   0.024
///
/// *   0.036
///
/// *   0.048
///
/// *   0.060
///
/// *   0.072
///
/// *   0.120
///
/// *   0.240
///
/// *   0.360
///
/// *   0.480
///
/// *   0.600
///
/// *   0.720
///
/// *   0.840
///
/// *   0.960
///
/// *   1.080
///
/// *   1.200
///
///
/// Use one of the following prices for semantic segmentation tasks. Prices are
/// in US dollars.
///
/// *   0.840
///
/// *   0.960
///
/// *   1.080
///
/// *   1.200
class PublicWorkforceTaskPrice {
  /// Defines the amount of money paid to an Amazon Mechanical Turk worker in
  /// United States dollars.
  final Usd amountInUsd;

  PublicWorkforceTaskPrice({
    this.amountInUsd,
  });
  static PublicWorkforceTaskPrice fromJson(Map<String, dynamic> json) =>
      PublicWorkforceTaskPrice(
        amountInUsd: json.containsKey('AmountInUsd')
            ? Usd.fromJson(json['AmountInUsd'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class RenderUiTemplateResponse {
  /// A Liquid template that renders the HTML for the worker UI.
  final String renderedContent;

  /// A list of one or more `RenderingError` objects if any were encountered
  /// while rendering the template. If there were no errors, the list is empty.
  final List<RenderingError> errors;

  RenderUiTemplateResponse({
    @required this.renderedContent,
    @required this.errors,
  });
  static RenderUiTemplateResponse fromJson(Map<String, dynamic> json) =>
      RenderUiTemplateResponse(
        renderedContent: json['RenderedContent'] as String,
        errors: (json['Errors'] as List)
            .map((e) => RenderingError.fromJson(e))
            .toList(),
      );
}

/// Contains input values for a task.
class RenderableTask {
  /// A JSON object that contains values for the variables defined in the
  /// template. It is made available to the template under the substitution
  /// variable `task.input`. For example, if you define a variable
  /// `task.input.text` in your template, you can supply the variable in the
  /// JSON object as `"text": "sample text"`.
  final String input;

  RenderableTask({
    @required this.input,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A description of an error that occurred while rendering the template.
class RenderingError {
  /// A unique identifier for a specific class of errors.
  final String code;

  /// A human-readable message describing the error.
  final String message;

  RenderingError({
    @required this.code,
    @required this.message,
  });
  static RenderingError fromJson(Map<String, dynamic> json) => RenderingError(
        code: json['Code'] as String,
        message: json['Message'] as String,
      );
}

/// Describes the resources, including ML compute instances and ML storage
/// volumes, to use for model training.
class ResourceConfig {
  /// The ML compute instance type.
  final String instanceType;

  /// The number of ML compute instances to use. For distributed training,
  /// provide a value greater than 1.
  final int instanceCount;

  /// The size of the ML storage volume that you want to provision.
  ///
  /// ML storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use the ML storage volume for scratch space. If you
  /// want to store the training data in the ML storage volume, choose `File` as
  /// the `TrainingInputMode` in the algorithm specification.
  ///
  /// You must specify sufficient ML storage for your scenario.
  ///
  ///   Amazon SageMaker supports only the General Purpose SSD (gp2) ML storage
  /// volume type.
  final int volumeSizeInGB;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the training job. The `VolumeKmsKeyId` can be any of the
  /// following formats:
  ///
  /// *   // KMS Key ID
  ///
  ///      `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key
  ///
  ///
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  ResourceConfig({
    @required this.instanceType,
    @required this.instanceCount,
    @required this.volumeSizeInGB,
    this.volumeKmsKeyId,
  });
  static ResourceConfig fromJson(Map<String, dynamic> json) => ResourceConfig(
        instanceType: json['InstanceType'] as String,
        instanceCount: json['InstanceCount'] as int,
        volumeSizeInGB: json['VolumeSizeInGB'] as int,
        volumeKmsKeyId: json.containsKey('VolumeKmsKeyId')
            ? json['VolumeKmsKeyId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the maximum number of training jobs and parallel training jobs
/// that a hyperparameter tuning job can launch.
class ResourceLimits {
  /// The maximum number of training jobs that a hyperparameter tuning job can
  /// launch.
  final int maxNumberOfTrainingJobs;

  /// The maximum number of concurrent training jobs that a hyperparameter
  /// tuning job can launch.
  final int maxParallelTrainingJobs;

  ResourceLimits({
    @required this.maxNumberOfTrainingJobs,
    @required this.maxParallelTrainingJobs,
  });
  static ResourceLimits fromJson(Map<String, dynamic> json) => ResourceLimits(
        maxNumberOfTrainingJobs: json['MaxNumberOfTrainingJobs'] as int,
        maxParallelTrainingJobs: json['MaxParallelTrainingJobs'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the S3 data source.
class S3DataSource {
  /// If you choose `S3Prefix`, `S3Uri` identifies a key name prefix. Amazon
  /// SageMaker uses all objects that match the specified key name prefix for
  /// model training.
  ///
  /// If you choose `ManifestFile`, `S3Uri` identifies an object that is a
  /// manifest file containing a list of object keys that you want Amazon
  /// SageMaker to use for model training.
  ///
  /// If you choose `AugmentedManifestFile`, S3Uri identifies an object that is
  /// an augmented manifest file in JSON lines format. This file contains the
  /// data you want to use for model training. `AugmentedManifestFile` can only
  /// be used if the Channel's input mode is `Pipe`.
  final String s3DataType;

  /// Depending on the value specified for the `S3DataType`, identifies either a
  /// key name prefix or a manifest. For example:
  ///
  /// *    A key name prefix might look like this:
  /// `s3://bucketname/exampleprefix`.
  ///
  /// *    A manifest might look like this: `s3://bucketname/example.manifest`
  ///
  ///      The manifest is an S3 object which is a JSON file with the following
  /// format:
  ///
  ///      `[`
  ///
  ///       `{"prefix": "s3://customer_bucket/some/prefix/"},`
  ///
  ///       `"relative/path/to/custdata-1",`
  ///
  ///       `"relative/path/custdata-2",`
  ///
  ///       `...`
  ///
  ///       `]`
  ///
  ///      The preceding JSON matches the following `s3Uris`:
  ///
  ///      `s3://customer_bucket/some/prefix/relative/path/to/custdata-1`
  ///
  ///      `s3://customer_bucket/some/prefix/relative/path/custdata-2`
  ///
  ///      `...`
  ///
  ///     The complete set of `s3uris` in this manifest is the input data for
  /// the channel for this datasource. The object that each `s3uris` points to
  /// must be readable by the IAM role that Amazon SageMaker uses to perform
  /// tasks on your behalf.
  final String s3Uri;

  /// If you want Amazon SageMaker to replicate the entire dataset on each ML
  /// compute instance that is launched for model training, specify
  /// `FullyReplicated`.
  ///
  /// If you want Amazon SageMaker to replicate a subset of data on each ML
  /// compute instance that is launched for model training, specify
  /// `ShardedByS3Key`. If there are _n_ ML compute instances launched for a
  /// training job, each instance gets approximately 1/_n_ of the number of S3
  /// objects. In this case, model training on each machine uses only the subset
  /// of training data.
  ///
  /// Don't choose more ML compute instances for training than available S3
  /// objects. If you do, some nodes won't get any data and you will pay for
  /// nodes that aren't getting any training data. This applies in both File and
  /// Pipe modes. Keep this in mind when developing algorithms.
  ///
  /// In distributed training, where you use multiple ML compute EC2 instances,
  /// you might choose `ShardedByS3Key`. If the algorithm requires copying
  /// training data to the ML storage volume (when `TrainingInputMode` is set to
  /// `File`), this copies 1/_n_ of the number of objects.
  final String s3DataDistributionType;

  /// A list of one or more attribute names to use that are found in a specified
  /// augmented manifest file.
  final List<String> attributeNames;

  S3DataSource({
    @required this.s3DataType,
    @required this.s3Uri,
    this.s3DataDistributionType,
    this.attributeNames,
  });
  static S3DataSource fromJson(Map<String, dynamic> json) => S3DataSource(
        s3DataType: json['S3DataType'] as String,
        s3Uri: json['S3Uri'] as String,
        s3DataDistributionType: json.containsKey('S3DataDistributionType')
            ? json['S3DataDistributionType'] as String
            : null,
        attributeNames: json.containsKey('AttributeNames')
            ? (json['AttributeNames'] as List).map((e) => e as String).toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A multi-expression that searches for the specified resource or resources in
/// a search. All resource objects that satisfy the expression's condition are
/// included in the search results. You must specify at least one subexpression,
/// filter, or nested filter. A `SearchExpression` can contain up to twenty
/// elements.
///
/// A `SearchExpression` contains the following components:
///
/// *   A list of `Filter` objects. Each filter defines a simple Boolean
/// expression comprised of a resource property name, Boolean operator, and
/// value.
///
/// *   A list of `NestedFilter` objects. Each nested filter defines a list of
/// Boolean expressions using a list of resource properties. A nested filter is
/// satisfied if a single object in the list satisfies all Boolean expressions.
///
/// *   A list of `SearchExpression` objects. A search expression object can be
/// nested in a list of search expression objects.
///
/// *   A Boolean operator: `And` or `Or`.
class SearchExpression {
  /// A list of filter objects.
  final List<Filter> filters;

  /// A list of nested filter objects.
  final List<NestedFilters> nestedFilters;

  /// A list of search expression objects.
  final List<SearchExpression> subExpressions;

  /// A Boolean operator used to evaluate the search expression. If you want
  /// every conditional statement in all lists to be satisfied for the entire
  /// search expression to be true, specify `And`. If only a single conditional
  /// statement needs to be true for the entire search expression to be true,
  /// specify `Or`. The default value is `And`.
  final String operator;

  SearchExpression({
    this.filters,
    this.nestedFilters,
    this.subExpressions,
    this.operator,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// An individual search result record that contains a single resource object.
class SearchRecord {
  /// A `TrainingJob` object that is returned as part of a `Search` request.
  final TrainingJob trainingJob;

  SearchRecord({
    this.trainingJob,
  });
  static SearchRecord fromJson(Map<String, dynamic> json) => SearchRecord(
        trainingJob: json.containsKey('TrainingJob')
            ? TrainingJob.fromJson(json['TrainingJob'])
            : null,
      );
}

class SearchResponse {
  /// A list of `SearchResult` objects.
  final List<SearchRecord> results;

  /// If the result of the previous `Search` request was truncated, the response
  /// includes a NextToken. To retrieve the next set of results, use the token
  /// in the next request.
  final String nextToken;

  SearchResponse({
    this.results,
    this.nextToken,
  });
  static SearchResponse fromJson(Map<String, dynamic> json) => SearchResponse(
        results: json.containsKey('Results')
            ? (json['Results'] as List)
                .map((e) => SearchRecord.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// An array element of DescribeTrainingJobResponse$SecondaryStatusTransitions.
/// It provides additional details about a status that the training job has
/// transitioned through. A training job can be in one of several states, for
/// example, starting, downloading, training, or uploading. Within each state,
/// there are a number of intermediate states. For example, within the starting
/// state, Amazon SageMaker could be starting the training job or launching the
/// ML instances. These transitional states are referred to as the job's
/// secondary status.
class SecondaryStatusTransition {
  /// Contains a secondary status information from a training job.
  ///
  /// Status might be one of the following secondary statuses:
  ///
  /// InProgress
  ///
  /// *    `Starting` - Starting the training job.
  ///
  /// *    `Downloading` - An optional stage for algorithms that support `File`
  /// training input mode. It indicates that data is being downloaded to the ML
  /// storage volumes.
  ///
  /// *    `Training` - Training is in progress.
  ///
  /// *    `Uploading` - Training is complete and the model artifacts are being
  /// uploaded to the S3 location.
  ///
  ///
  /// Completed
  ///
  /// *    `Completed` - The training job has completed.
  ///
  ///
  /// Failed
  ///
  /// *    `Failed` - The training job has failed. The reason for the failure is
  /// returned in the `FailureReason` field of `DescribeTrainingJobResponse`.
  ///
  ///
  /// Stopped
  ///
  /// *    `MaxRuntimeExceeded` - The job stopped because it exceeded the
  /// maximum allowed runtime.
  ///
  /// *    `Stopped` - The training job has stopped.
  ///
  ///
  /// Stopping
  ///
  /// *    `Stopping` - Stopping the training job.
  ///
  ///
  /// We no longer support the following secondary statuses:
  ///
  /// *    `LaunchingMLInstances`
  ///
  /// *    `PreparingTrainingStack`
  ///
  /// *    `DownloadingTrainingImage`
  final String status;

  /// A timestamp that shows when the training job transitioned to the current
  /// secondary status state.
  final DateTime startTime;

  /// A timestamp that shows when the training job transitioned out of this
  /// secondary status state into another secondary status state or when the
  /// training job has ended.
  final DateTime endTime;

  /// A detailed description of the progress within a secondary status.
  ///
  /// Amazon SageMaker provides secondary statuses and status messages that
  /// apply to each of them:
  ///
  /// Starting
  ///
  /// *   Starting the training job.
  ///
  /// *   Launching requested ML instances.
  ///
  /// *   Insufficient capacity error from EC2 while launching instances,
  /// retrying!
  ///
  /// *   Launched instance was unhealthy, replacing it!
  ///
  /// *   Preparing the instances for training.
  ///
  ///
  /// Training
  ///
  /// *   Downloading the training image.
  ///
  /// *   Training image download completed. Training in progress.
  ///
  ///
  ///  Status messages are subject to change. Therefore, we recommend not
  /// including them in code that programmatically initiates actions. For
  /// examples, don't use status messages in if statements.
  ///
  /// To have an overview of your training job's progress, view
  /// `TrainingJobStatus` and `SecondaryStatus` in DescribeTrainingJob, and
  /// `StatusMessage` together. For example, at the start of a training job, you
  /// might see the following:
  ///
  /// *    `TrainingJobStatus` - InProgress
  ///
  /// *    `SecondaryStatus` - Training
  ///
  /// *    `StatusMessage` - Downloading the training image
  final String statusMessage;

  SecondaryStatusTransition({
    @required this.status,
    @required this.startTime,
    this.endTime,
    this.statusMessage,
  });
  static SecondaryStatusTransition fromJson(Map<String, dynamic> json) =>
      SecondaryStatusTransition(
        status: json['Status'] as String,
        startTime: DateTime.parse(json['StartTime']),
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
      );
}

/// A configuration for a shuffle option for input data in a channel. If you use
/// `S3Prefix` for `S3DataType`, the results of the S3 key prefix matches are
/// shuffled. If you use `ManifestFile`, the order of the S3 object references
/// in the `ManifestFile` is shuffled. If you use `AugmentedManifestFile`, the
/// order of the JSON lines in the `AugmentedManifestFile` is shuffled. The
/// shuffling order is determined using the `Seed` value.
///
/// For Pipe input mode, shuffling is done at the start of every epoch. With
/// large datasets, this ensures that the order of the training data is
/// different for each epoch, and it helps reduce bias and possible overfitting.
/// In a multi-node training job when `ShuffleConfig` is combined with
/// `S3DataDistributionType` of `ShardedByS3Key`, the data is shuffled across
/// nodes so that the content sent to a particular node on the first epoch might
/// be sent to a different node on the second epoch.
class ShuffleConfig {
  /// Determines the shuffling order in `ShuffleConfig` value.
  final BigInt seed;

  ShuffleConfig({
    @required this.seed,
  });
  static ShuffleConfig fromJson(Map<String, dynamic> json) => ShuffleConfig(
        seed: BigInt.from(json['Seed']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies an algorithm that was used to create the model package. The
/// algorithm must be either an algorithm resource in your Amazon SageMaker
/// account or an algorithm in AWS Marketplace that you are subscribed to.
class SourceAlgorithm {
  /// The Amazon S3 path where the model artifacts, which result from model
  /// training, are stored. This path must point to a single `gzip` compressed
  /// tar archive (`.tar.gz` suffix).
  final String modelDataUrl;

  /// The name of an algorithm that was used to create the model package. The
  /// algorithm must be either an algorithm resource in your Amazon SageMaker
  /// account or an algorithm in AWS Marketplace that you are subscribed to.
  final String algorithmName;

  SourceAlgorithm({
    this.modelDataUrl,
    @required this.algorithmName,
  });
  static SourceAlgorithm fromJson(Map<String, dynamic> json) => SourceAlgorithm(
        modelDataUrl: json.containsKey('ModelDataUrl')
            ? json['ModelDataUrl'] as String
            : null,
        algorithmName: json['AlgorithmName'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of algorithms that were used to create a model package.
class SourceAlgorithmSpecification {
  /// A list of the algorithms that were used to create a model package.
  final List<SourceAlgorithm> sourceAlgorithms;

  SourceAlgorithmSpecification({
    @required this.sourceAlgorithms,
  });
  static SourceAlgorithmSpecification fromJson(Map<String, dynamic> json) =>
      SourceAlgorithmSpecification(
        sourceAlgorithms: (json['SourceAlgorithms'] as List)
            .map((e) => SourceAlgorithm.fromJson(e))
            .toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies a limit to how long a model training or compilation job can run.
/// It also specifies how long you are willing to wait for a managed spot
/// training job to complete. When the job reaches the time limit, Amazon
/// SageMaker ends the training or compilation job. Use this API to cap model
/// training costs.
///
/// To stop a job, Amazon SageMaker sends the algorithm the `SIGTERM` signal,
/// which delays job termination for 120 seconds. Algorithms can use this
/// 120-second window to save the model artifacts, so the results of training
/// are not lost.
///
/// The training algorithms provided by Amazon SageMaker automatically save the
/// intermediate results of a model training job when possible. This attempt to
/// save artifacts is only a best effort case as model might not be in a state
/// from which it can be saved. For example, if training has just started, the
/// model might not be ready to save. When saved, this intermediate data is a
/// valid model artifact. You can use it to create a model with `CreateModel`.
///
///
///
/// The Neural Topic Model (NTM) currently does not support saving intermediate
/// model artifacts. When training NTMs, make sure that the maximum runtime is
/// sufficient for the training job to complete.
class StoppingCondition {
  /// The maximum length of time, in seconds, that the training or compilation
  /// job can run. If job does not complete during this time, Amazon SageMaker
  /// ends the job. If value is not specified, default value is 1 day. The
  /// maximum value is 28 days.
  final int maxRuntimeInSeconds;

  /// The maximum length of time, in seconds, how long you are willing to wait
  /// for a managed spot training job to complete. It is the amount of time
  /// spent waiting for Spot capacity plus the amount of time the training job
  /// runs. It must be equal to or greater than `MaxRuntimeInSeconds`.
  final int maxWaitTimeInSeconds;

  StoppingCondition({
    this.maxRuntimeInSeconds,
    this.maxWaitTimeInSeconds,
  });
  static StoppingCondition fromJson(Map<String, dynamic> json) =>
      StoppingCondition(
        maxRuntimeInSeconds: json.containsKey('MaxRuntimeInSeconds')
            ? json['MaxRuntimeInSeconds'] as int
            : null,
        maxWaitTimeInSeconds: json.containsKey('MaxWaitTimeInSeconds')
            ? json['MaxWaitTimeInSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a work team of a vendor that does the a labelling job.
class SubscribedWorkteam {
  /// The Amazon Resource Name (ARN) of the vendor that you have subscribed.
  final String workteamArn;

  /// The title of the service provided by the vendor in the Amazon Marketplace.
  final String marketplaceTitle;

  /// The name of the vendor in the Amazon Marketplace.
  final String sellerName;

  /// The description of the vendor from the Amazon Marketplace.
  final String marketplaceDescription;

  final String listingId;

  SubscribedWorkteam({
    @required this.workteamArn,
    this.marketplaceTitle,
    this.sellerName,
    this.marketplaceDescription,
    this.listingId,
  });
  static SubscribedWorkteam fromJson(Map<String, dynamic> json) =>
      SubscribedWorkteam(
        workteamArn: json['WorkteamArn'] as String,
        marketplaceTitle: json.containsKey('MarketplaceTitle')
            ? json['MarketplaceTitle'] as String
            : null,
        sellerName: json.containsKey('SellerName')
            ? json['SellerName'] as String
            : null,
        marketplaceDescription: json.containsKey('MarketplaceDescription')
            ? json['MarketplaceDescription'] as String
            : null,
        listingId:
            json.containsKey('ListingId') ? json['ListingId'] as String : null,
      );
}

/// Limits the property names that are included in the response.
class SuggestionQuery {
  /// A type of `SuggestionQuery`. Defines a property name hint. Only property
  /// names that match the specified hint are included in the response.
  final PropertyNameQuery propertyNameQuery;

  SuggestionQuery({
    this.propertyNameQuery,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes a tag.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about a training job.
class TrainingJob {
  /// The name of the training job.
  final String trainingJobName;

  /// The Amazon Resource Name (ARN) of the training job.
  final String trainingJobArn;

  /// The Amazon Resource Name (ARN) of the associated hyperparameter tuning job
  /// if the training job was launched by a hyperparameter tuning job.
  final String tuningJobArn;

  /// The Amazon Resource Name (ARN) of the labeling job.
  final String labelingJobArn;

  /// Information about the Amazon S3 location that is configured for storing
  /// model artifacts.
  final ModelArtifacts modelArtifacts;

  /// The status of the training job.
  ///
  /// Training job statuses are:
  ///
  /// *    `InProgress` - The training is in progress.
  ///
  /// *    `Completed` - The training job has completed.
  ///
  /// *    `Failed` - The training job has failed. To see the reason for the
  /// failure, see the `FailureReason` field in the response to a
  /// `DescribeTrainingJobResponse` call.
  ///
  /// *    `Stopping` - The training job is stopping.
  ///
  /// *    `Stopped` - The training job has stopped.
  ///
  ///
  /// For more detailed information, see `SecondaryStatus`.
  final String trainingJobStatus;

  ///  Provides detailed information about the state of the training job. For
  /// detailed information about the secondary status of the training job, see
  /// `StatusMessage` under SecondaryStatusTransition.
  ///
  /// Amazon SageMaker provides primary statuses and secondary statuses that
  /// apply to each of them:
  ///
  /// InProgress
  ///
  /// *    `Starting` - Starting the training job.
  ///
  /// *    `Downloading` - An optional stage for algorithms that support `File`
  /// training input mode. It indicates that data is being downloaded to the ML
  /// storage volumes.
  ///
  /// *    `Training` - Training is in progress.
  ///
  /// *    `Uploading` - Training is complete and the model artifacts are being
  /// uploaded to the S3 location.
  ///
  ///
  /// Completed
  ///
  /// *    `Completed` - The training job has completed.
  ///
  ///
  /// Failed
  ///
  /// *    `Failed` - The training job has failed. The reason for the failure is
  /// returned in the `FailureReason` field of `DescribeTrainingJobResponse`.
  ///
  ///
  /// Stopped
  ///
  /// *    `MaxRuntimeExceeded` - The job stopped because it exceeded the
  /// maximum allowed runtime.
  ///
  /// *    `Stopped` - The training job has stopped.
  ///
  ///
  /// Stopping
  ///
  /// *    `Stopping` - Stopping the training job.
  ///
  ///
  ///  Valid values for `SecondaryStatus` are subject to change.
  ///
  /// We no longer support the following secondary statuses:
  ///
  /// *    `LaunchingMLInstances`
  ///
  /// *    `PreparingTrainingStack`
  ///
  /// *    `DownloadingTrainingImage`
  final String secondaryStatus;

  /// If the training job failed, the reason it failed.
  final String failureReason;

  /// Algorithm-specific parameters.
  final Map<String, String> hyperParameters;

  /// Information about the algorithm used for training, and algorithm metadata.
  final AlgorithmSpecification algorithmSpecification;

  /// The AWS Identity and Access Management (IAM) role configured for the
  /// training job.
  final String roleArn;

  /// An array of `Channel` objects that describes each data input channel.
  final List<Channel> inputDataConfig;

  /// The S3 path where model artifacts that you configured when creating the
  /// job are stored. Amazon SageMaker creates subfolders for model artifacts.
  final OutputDataConfig outputDataConfig;

  /// Resources, including ML compute instances and ML storage volumes, that are
  /// configured for model training.
  final ResourceConfig resourceConfig;

  /// A VpcConfig object that specifies the VPC that this training job has
  /// access to. For more information, see
  /// [Protect Training Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html).
  final VpcConfig vpcConfig;

  /// Specifies a limit to how long a model training job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this
  /// API to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the `SIGTERM` signal,
  /// which delays job termination for 120 seconds. Algorithms can use this
  /// 120-second window to save the model artifacts, so the results of training
  /// are not lost.
  final StoppingCondition stoppingCondition;

  /// A timestamp that indicates when the training job was created.
  final DateTime creationTime;

  /// Indicates the time when the training job starts on training instances. You
  /// are billed for the time interval between this time and the value of
  /// `TrainingEndTime`. The start time in CloudWatch Logs might be later than
  /// this time. The difference is due to the time it takes to download the
  /// training data and to the size of the training container.
  final DateTime trainingStartTime;

  /// Indicates the time when the training job ends on training instances. You
  /// are billed for the time interval between the value of `TrainingStartTime`
  /// and this time. For successful jobs and stopped jobs, this is the time
  /// after model artifacts are uploaded. For failed jobs, this is the time when
  /// Amazon SageMaker detects a job failure.
  final DateTime trainingEndTime;

  /// A timestamp that indicates when the status of the training job was last
  /// modified.
  final DateTime lastModifiedTime;

  /// A history of all of the secondary statuses that the training job has
  /// transitioned through.
  final List<SecondaryStatusTransition> secondaryStatusTransitions;

  /// A list of final metric values that are set when the training job
  /// completes. Used only if the training job was configured to use metrics.
  final List<MetricData> finalMetricDataList;

  /// If the `TrainingJob` was created with network isolation, the value is set
  /// to `true`. If network isolation is enabled, nodes can't communicate beyond
  /// the VPC they run in.
  final bool enableNetworkIsolation;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose `True`. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances,
  /// especially if you use a deep learning algorithm in distributed training.
  final bool enableInterContainerTrafficEncryption;

  /// An array of key-value pairs. For more information, see
  /// [Using Cost Allocation Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what)
  /// in the _AWS Billing and Cost Management User Guide_.
  final List<Tag> tags;

  TrainingJob({
    this.trainingJobName,
    this.trainingJobArn,
    this.tuningJobArn,
    this.labelingJobArn,
    this.modelArtifacts,
    this.trainingJobStatus,
    this.secondaryStatus,
    this.failureReason,
    this.hyperParameters,
    this.algorithmSpecification,
    this.roleArn,
    this.inputDataConfig,
    this.outputDataConfig,
    this.resourceConfig,
    this.vpcConfig,
    this.stoppingCondition,
    this.creationTime,
    this.trainingStartTime,
    this.trainingEndTime,
    this.lastModifiedTime,
    this.secondaryStatusTransitions,
    this.finalMetricDataList,
    this.enableNetworkIsolation,
    this.enableInterContainerTrafficEncryption,
    this.tags,
  });
  static TrainingJob fromJson(Map<String, dynamic> json) => TrainingJob(
        trainingJobName: json.containsKey('TrainingJobName')
            ? json['TrainingJobName'] as String
            : null,
        trainingJobArn: json.containsKey('TrainingJobArn')
            ? json['TrainingJobArn'] as String
            : null,
        tuningJobArn: json.containsKey('TuningJobArn')
            ? json['TuningJobArn'] as String
            : null,
        labelingJobArn: json.containsKey('LabelingJobArn')
            ? json['LabelingJobArn'] as String
            : null,
        modelArtifacts: json.containsKey('ModelArtifacts')
            ? ModelArtifacts.fromJson(json['ModelArtifacts'])
            : null,
        trainingJobStatus: json.containsKey('TrainingJobStatus')
            ? json['TrainingJobStatus'] as String
            : null,
        secondaryStatus: json.containsKey('SecondaryStatus')
            ? json['SecondaryStatus'] as String
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        hyperParameters: json.containsKey('HyperParameters')
            ? (json['HyperParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        algorithmSpecification: json.containsKey('AlgorithmSpecification')
            ? AlgorithmSpecification.fromJson(json['AlgorithmSpecification'])
            : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        inputDataConfig: json.containsKey('InputDataConfig')
            ? (json['InputDataConfig'] as List)
                .map((e) => Channel.fromJson(e))
                .toList()
            : null,
        outputDataConfig: json.containsKey('OutputDataConfig')
            ? OutputDataConfig.fromJson(json['OutputDataConfig'])
            : null,
        resourceConfig: json.containsKey('ResourceConfig')
            ? ResourceConfig.fromJson(json['ResourceConfig'])
            : null,
        vpcConfig: json.containsKey('VpcConfig')
            ? VpcConfig.fromJson(json['VpcConfig'])
            : null,
        stoppingCondition: json.containsKey('StoppingCondition')
            ? StoppingCondition.fromJson(json['StoppingCondition'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        trainingStartTime: json.containsKey('TrainingStartTime')
            ? DateTime.parse(json['TrainingStartTime'])
            : null,
        trainingEndTime: json.containsKey('TrainingEndTime')
            ? DateTime.parse(json['TrainingEndTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        secondaryStatusTransitions:
            json.containsKey('SecondaryStatusTransitions')
                ? (json['SecondaryStatusTransitions'] as List)
                    .map((e) => SecondaryStatusTransition.fromJson(e))
                    .toList()
                : null,
        finalMetricDataList: json.containsKey('FinalMetricDataList')
            ? (json['FinalMetricDataList'] as List)
                .map((e) => MetricData.fromJson(e))
                .toList()
            : null,
        enableNetworkIsolation: json.containsKey('EnableNetworkIsolation')
            ? json['EnableNetworkIsolation'] as bool
            : null,
        enableInterContainerTrafficEncryption:
            json.containsKey('EnableInterContainerTrafficEncryption')
                ? json['EnableInterContainerTrafficEncryption'] as bool
                : null,
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Defines the input needed to run a training job using the algorithm.
class TrainingJobDefinition {
  /// The input mode used by the algorithm for the training job. For the input
  /// modes that Amazon SageMaker algorithms support, see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  ///
  /// If an algorithm supports the `File` input mode, Amazon SageMaker downloads
  /// the training data from S3 to the provisioned ML storage Volume, and mounts
  /// the directory to docker volume for training container. If an algorithm
  /// supports the `Pipe` input mode, Amazon SageMaker streams data directly
  /// from S3 to the container.
  final String trainingInputMode;

  /// The hyperparameters used for the training job.
  final Map<String, String> hyperParameters;

  /// An array of `Channel` objects, each of which specifies an input source.
  final List<Channel> inputDataConfig;

  /// the path to the S3 bucket where you want to store model artifacts. Amazon
  /// SageMaker creates subfolders for the artifacts.
  final OutputDataConfig outputDataConfig;

  /// The resources, including the ML compute instances and ML storage volumes,
  /// to use for model training.
  final ResourceConfig resourceConfig;

  /// Specifies a limit to how long a model training job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this
  /// API to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal,
  /// which delays job termination for 120 seconds. Algorithms can use this
  /// 120-second window to save the model artifacts.
  final StoppingCondition stoppingCondition;

  TrainingJobDefinition({
    @required this.trainingInputMode,
    this.hyperParameters,
    @required this.inputDataConfig,
    @required this.outputDataConfig,
    @required this.resourceConfig,
    @required this.stoppingCondition,
  });
  static TrainingJobDefinition fromJson(Map<String, dynamic> json) =>
      TrainingJobDefinition(
        trainingInputMode: json['TrainingInputMode'] as String,
        hyperParameters: json.containsKey('HyperParameters')
            ? (json['HyperParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        inputDataConfig: (json['InputDataConfig'] as List)
            .map((e) => Channel.fromJson(e))
            .toList(),
        outputDataConfig: OutputDataConfig.fromJson(json['OutputDataConfig']),
        resourceConfig: ResourceConfig.fromJson(json['ResourceConfig']),
        stoppingCondition:
            StoppingCondition.fromJson(json['StoppingCondition']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The numbers of training jobs launched by a hyperparameter tuning job,
/// categorized by status.
class TrainingJobStatusCounters {
  /// The number of completed training jobs launched by the hyperparameter
  /// tuning job.
  final int completed;

  /// The number of in-progress training jobs launched by a hyperparameter
  /// tuning job.
  final int inProgress;

  /// The number of training jobs that failed, but can be retried. A failed
  /// training job can be retried only if it failed because an internal service
  /// error occurred.
  final int retryableError;

  /// The number of training jobs that failed and can't be retried. A failed
  /// training job can't be retried if it failed because a client error
  /// occurred.
  final int nonRetryableError;

  /// The number of training jobs launched by a hyperparameter tuning job that
  /// were manually stopped.
  final int stopped;

  TrainingJobStatusCounters({
    this.completed,
    this.inProgress,
    this.retryableError,
    this.nonRetryableError,
    this.stopped,
  });
  static TrainingJobStatusCounters fromJson(Map<String, dynamic> json) =>
      TrainingJobStatusCounters(
        completed:
            json.containsKey('Completed') ? json['Completed'] as int : null,
        inProgress:
            json.containsKey('InProgress') ? json['InProgress'] as int : null,
        retryableError: json.containsKey('RetryableError')
            ? json['RetryableError'] as int
            : null,
        nonRetryableError: json.containsKey('NonRetryableError')
            ? json['NonRetryableError'] as int
            : null,
        stopped: json.containsKey('Stopped') ? json['Stopped'] as int : null,
      );
}

/// Provides summary information about a training job.
class TrainingJobSummary {
  /// The name of the training job that you want a summary for.
  final String trainingJobName;

  /// The Amazon Resource Name (ARN) of the training job.
  final String trainingJobArn;

  /// A timestamp that shows when the training job was created.
  final DateTime creationTime;

  /// A timestamp that shows when the training job ended. This field is set only
  /// if the training job has one of the terminal statuses (`Completed`,
  /// `Failed`, or `Stopped`).
  final DateTime trainingEndTime;

  ///  Timestamp when the training job was last modified.
  final DateTime lastModifiedTime;

  /// The status of the training job.
  final String trainingJobStatus;

  TrainingJobSummary({
    @required this.trainingJobName,
    @required this.trainingJobArn,
    @required this.creationTime,
    this.trainingEndTime,
    this.lastModifiedTime,
    @required this.trainingJobStatus,
  });
  static TrainingJobSummary fromJson(Map<String, dynamic> json) =>
      TrainingJobSummary(
        trainingJobName: json['TrainingJobName'] as String,
        trainingJobArn: json['TrainingJobArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        trainingEndTime: json.containsKey('TrainingEndTime')
            ? DateTime.parse(json['TrainingEndTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        trainingJobStatus: json['TrainingJobStatus'] as String,
      );
}

/// Defines how the algorithm is used for a training job.
class TrainingSpecification {
  /// The Amazon ECR registry path of the Docker image that contains the
  /// training algorithm.
  final String trainingImage;

  /// An MD5 hash of the training algorithm that identifies the Docker image
  /// used for training.
  final String trainingImageDigest;

  /// A list of the `HyperParameterSpecification` objects, that define the
  /// supported hyperparameters. This is required if the algorithm supports
  /// automatic model tuning.>
  final List<HyperParameterSpecification> supportedHyperParameters;

  /// A list of the instance types that this algorithm can use for training.
  final List<String> supportedTrainingInstanceTypes;

  /// Indicates whether the algorithm supports distributed training. If set to
  /// false, buyers can’t request more than one instance during training.
  final bool supportsDistributedTraining;

  /// A list of `MetricDefinition` objects, which are used for parsing metrics
  /// generated by the algorithm.
  final List<MetricDefinition> metricDefinitions;

  /// A list of `ChannelSpecification` objects, which specify the input sources
  /// to be used by the algorithm.
  final List<ChannelSpecification> trainingChannels;

  /// A list of the metrics that the algorithm emits that can be used as the
  /// objective metric in a hyperparameter tuning job.
  final List<HyperParameterTuningJobObjective>
      supportedTuningJobObjectiveMetrics;

  TrainingSpecification({
    @required this.trainingImage,
    this.trainingImageDigest,
    this.supportedHyperParameters,
    @required this.supportedTrainingInstanceTypes,
    this.supportsDistributedTraining,
    this.metricDefinitions,
    @required this.trainingChannels,
    this.supportedTuningJobObjectiveMetrics,
  });
  static TrainingSpecification fromJson(Map<String, dynamic> json) =>
      TrainingSpecification(
        trainingImage: json['TrainingImage'] as String,
        trainingImageDigest: json.containsKey('TrainingImageDigest')
            ? json['TrainingImageDigest'] as String
            : null,
        supportedHyperParameters: json.containsKey('SupportedHyperParameters')
            ? (json['SupportedHyperParameters'] as List)
                .map((e) => HyperParameterSpecification.fromJson(e))
                .toList()
            : null,
        supportedTrainingInstanceTypes:
            (json['SupportedTrainingInstanceTypes'] as List)
                .map((e) => e as String)
                .toList(),
        supportsDistributedTraining:
            json.containsKey('SupportsDistributedTraining')
                ? json['SupportsDistributedTraining'] as bool
                : null,
        metricDefinitions: json.containsKey('MetricDefinitions')
            ? (json['MetricDefinitions'] as List)
                .map((e) => MetricDefinition.fromJson(e))
                .toList()
            : null,
        trainingChannels: (json['TrainingChannels'] as List)
            .map((e) => ChannelSpecification.fromJson(e))
            .toList(),
        supportedTuningJobObjectiveMetrics:
            json.containsKey('SupportedTuningJobObjectiveMetrics')
                ? (json['SupportedTuningJobObjectiveMetrics'] as List)
                    .map((e) => HyperParameterTuningJobObjective.fromJson(e))
                    .toList()
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the location of the channel data.
class TransformDataSource {
  /// The S3 location of the data source that is associated with a channel.
  final TransformS3DataSource s3DataSource;

  TransformDataSource({
    @required this.s3DataSource,
  });
  static TransformDataSource fromJson(Map<String, dynamic> json) =>
      TransformDataSource(
        s3DataSource: TransformS3DataSource.fromJson(json['S3DataSource']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the input source of a transform job and the way the transform job
/// consumes it.
class TransformInput {
  /// Describes the location of the channel data, which is, the S3 location of
  /// the input data that the model can consume.
  final TransformDataSource dataSource;

  /// The multipurpose internet mail extension (MIME) type of the data. Amazon
  /// SageMaker uses the MIME type with each http call to transfer data to the
  /// transform job.
  final String contentType;

  /// If your transform data is compressed, specify the compression type. Amazon
  /// SageMaker automatically decompresses the data for the transform job
  /// accordingly. The default value is `None`.
  final String compressionType;

  /// The method to use to split the transform job's data files into smaller
  /// batches. Splitting is necessary when the total size of each object is too
  /// large to fit in a single request. You can also use data splitting to
  /// improve performance by processing multiple concurrent mini-batches. The
  /// default value for `SplitType` is `None`, which indicates that input data
  /// files are not split, and request payloads contain the entire contents of
  /// an input object. Set the value of this parameter to `Line` to split
  /// records on a newline character boundary. `SplitType` also supports a
  /// number of record-oriented binary data formats.
  ///
  /// When splitting is enabled, the size of a mini-batch depends on the values
  /// of the `BatchStrategy` and `MaxPayloadInMB` parameters. When the value of
  /// `BatchStrategy` is `MultiRecord`, Amazon SageMaker sends the maximum
  /// number of records in each request, up to the `MaxPayloadInMB` limit. If
  /// the value of `BatchStrategy` is `SingleRecord`, Amazon SageMaker sends
  /// individual records in each request.
  ///
  ///
  ///
  /// Some data formats represent a record as a binary payload wrapped with
  /// extra padding bytes. When splitting is applied to a binary data format,
  /// padding is removed if the value of `BatchStrategy` is set to
  /// `SingleRecord`. Padding is not removed if the value of `BatchStrategy` is
  /// set to `MultiRecord`.
  ///
  /// For more information about the RecordIO, see
  /// [Data Format](http://mxnet.io/architecture/note_data_loading.html#data-format)
  /// in the MXNet documentation. For more information about the TFRecord, see
  /// [Consuming TFRecord data](https://www.tensorflow.org/guide/datasets#consuming_tfrecord_data)
  /// in the TensorFlow documentation.
  final String splitType;

  TransformInput({
    @required this.dataSource,
    this.contentType,
    this.compressionType,
    this.splitType,
  });
  static TransformInput fromJson(Map<String, dynamic> json) => TransformInput(
        dataSource: TransformDataSource.fromJson(json['DataSource']),
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        compressionType: json.containsKey('CompressionType')
            ? json['CompressionType'] as String
            : null,
        splitType:
            json.containsKey('SplitType') ? json['SplitType'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Defines the input needed to run a transform job using the inference
/// specification specified in the algorithm.
class TransformJobDefinition {
  /// The maximum number of parallel requests that can be sent to each instance
  /// in a transform job. The default value is 1.
  final int maxConcurrentTransforms;

  /// The maximum payload size allowed, in MB. A payload is the data portion of
  /// a record (without metadata).
  final int maxPayloadInMB;

  /// A string that determines the number of records included in a single
  /// mini-batch.
  ///
  ///  `SingleRecord` means only one record is used per mini-batch.
  /// `MultiRecord` means a mini-batch is set to contain as many records that
  /// can fit within the `MaxPayloadInMB` limit.
  final String batchStrategy;

  /// The environment variables to set in the Docker container. We support up to
  /// 16 key and values entries in the map.
  final Map<String, String> environment;

  /// A description of the input source and the way the transform job consumes
  /// it.
  final TransformInput transformInput;

  /// Identifies the Amazon S3 location where you want Amazon SageMaker to save
  /// the results from the transform job.
  final TransformOutput transformOutput;

  /// Identifies the ML compute instances for the transform job.
  final TransformResources transformResources;

  TransformJobDefinition({
    this.maxConcurrentTransforms,
    this.maxPayloadInMB,
    this.batchStrategy,
    this.environment,
    @required this.transformInput,
    @required this.transformOutput,
    @required this.transformResources,
  });
  static TransformJobDefinition fromJson(Map<String, dynamic> json) =>
      TransformJobDefinition(
        maxConcurrentTransforms: json.containsKey('MaxConcurrentTransforms')
            ? json['MaxConcurrentTransforms'] as int
            : null,
        maxPayloadInMB: json.containsKey('MaxPayloadInMB')
            ? json['MaxPayloadInMB'] as int
            : null,
        batchStrategy: json.containsKey('BatchStrategy')
            ? json['BatchStrategy'] as String
            : null,
        environment: json.containsKey('Environment')
            ? (json['Environment'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        transformInput: TransformInput.fromJson(json['TransformInput']),
        transformOutput: TransformOutput.fromJson(json['TransformOutput']),
        transformResources:
            TransformResources.fromJson(json['TransformResources']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides a summary of a transform job. Multiple `TransformJobSummary`
/// objects are returned as a list after in response to a ListTransformJobs
/// call.
class TransformJobSummary {
  /// The name of the transform job.
  final String transformJobName;

  /// The Amazon Resource Name (ARN) of the transform job.
  final String transformJobArn;

  /// A timestamp that shows when the transform Job was created.
  final DateTime creationTime;

  /// Indicates when the transform job ends on compute instances. For successful
  /// jobs and stopped jobs, this is the exact time recorded after the results
  /// are uploaded. For failed jobs, this is when Amazon SageMaker detected that
  /// the job failed.
  final DateTime transformEndTime;

  /// Indicates when the transform job was last modified.
  final DateTime lastModifiedTime;

  /// The status of the transform job.
  final String transformJobStatus;

  /// If the transform job failed, the reason it failed.
  final String failureReason;

  TransformJobSummary({
    @required this.transformJobName,
    @required this.transformJobArn,
    @required this.creationTime,
    this.transformEndTime,
    this.lastModifiedTime,
    @required this.transformJobStatus,
    this.failureReason,
  });
  static TransformJobSummary fromJson(Map<String, dynamic> json) =>
      TransformJobSummary(
        transformJobName: json['TransformJobName'] as String,
        transformJobArn: json['TransformJobArn'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        transformEndTime: json.containsKey('TransformEndTime')
            ? DateTime.parse(json['TransformEndTime'])
            : null,
        lastModifiedTime: json.containsKey('LastModifiedTime')
            ? DateTime.parse(json['LastModifiedTime'])
            : null,
        transformJobStatus: json['TransformJobStatus'] as String,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
      );
}

/// Describes the results of a transform job.
class TransformOutput {
  /// The Amazon S3 path where you want Amazon SageMaker to store the results of
  /// the transform job. For example, `s3://bucket-name/key-name-prefix`.
  ///
  /// For every S3 object used as input for the transform job, batch transform
  /// stores the transformed data with an .`out` suffix in a corresponding
  /// subfolder in the location in the output prefix. For example, for the input
  /// data stored at `s3://bucket-name/input-name-prefix/dataset01/data.csv`,
  /// batch transform stores the transformed data at
  /// `s3://bucket-name/output-name-prefix/input-name-prefix/data.csv.out`.
  /// Batch transform doesn't upload partially processed objects. For an input
  /// S3 object that contains multiple records, it creates an .`out` file only
  /// if the transform job succeeds on the entire file. When the input contains
  /// multiple S3 objects, the batch transform job processes the listed S3
  /// objects and uploads only the output for successfully processed objects. If
  /// any object fails in the transform job batch transform marks the job as
  /// failed to prompt investigation.
  final String s3OutputPath;

  /// The MIME type used to specify the output data. Amazon SageMaker uses the
  /// MIME type with each http call to transfer data from the transform job.
  final String accept;

  /// Defines how to assemble the results of the transform job as a single S3
  /// object. Choose a format that is most convenient to you. To concatenate the
  /// results in binary format, specify `None`. To add a newline character at
  /// the end of every transformed record, specify `Line`.
  final String assembleWith;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the model artifacts at rest using Amazon S3 server-side
  /// encryption. The `KmsKeyId` can be any of the following formats:
  ///
  /// *   // KMS Key ID
  ///
  ///      `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key
  ///
  ///
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // KMS Key Alias
  ///
  ///      `"alias/ExampleAlias"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key Alias
  ///
  ///      `"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"`
  ///
  ///
  /// If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS
  /// key for Amazon S3 for your role's account. For more information, see
  /// [KMS-Managed Encryption Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html)
  /// in the _Amazon Simple Storage Service Developer Guide._
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify
  /// in your `CreateTramsformJob` request. For more information, see
  /// [Using Key Policies in AWS KMS](http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String kmsKeyId;

  TransformOutput({
    @required this.s3OutputPath,
    this.accept,
    this.assembleWith,
    this.kmsKeyId,
  });
  static TransformOutput fromJson(Map<String, dynamic> json) => TransformOutput(
        s3OutputPath: json['S3OutputPath'] as String,
        accept: json.containsKey('Accept') ? json['Accept'] as String : null,
        assembleWith: json.containsKey('AssembleWith')
            ? json['AssembleWith'] as String
            : null,
        kmsKeyId:
            json.containsKey('KmsKeyId') ? json['KmsKeyId'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the resources, including ML instance types and ML instance count,
/// to use for transform job.
class TransformResources {
  /// The ML compute instance type for the transform job. If you are using
  /// built-in algorithms to transform moderately sized datasets, we recommend
  /// using ml.m4.xlarge or `ml.m5.large` instance types.
  final String instanceType;

  /// The number of ML compute instances to use in the transform job. For
  /// distributed transform jobs, specify a value greater than 1. The default
  /// value is `1`.
  final int instanceCount;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the batch transform job. The `VolumeKmsKeyId` can be any of the
  /// following formats:
  ///
  /// *   // KMS Key ID
  ///
  ///      `"1234abcd-12ab-34cd-56ef-1234567890ab"`
  ///
  /// *   // Amazon Resource Name (ARN) of a KMS Key
  ///
  ///
  /// `"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"`
  final String volumeKmsKeyId;

  TransformResources({
    @required this.instanceType,
    @required this.instanceCount,
    this.volumeKmsKeyId,
  });
  static TransformResources fromJson(Map<String, dynamic> json) =>
      TransformResources(
        instanceType: json['InstanceType'] as String,
        instanceCount: json['InstanceCount'] as int,
        volumeKmsKeyId: json.containsKey('VolumeKmsKeyId')
            ? json['VolumeKmsKeyId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Describes the S3 data source.
class TransformS3DataSource {
  /// If you choose `S3Prefix`, `S3Uri` identifies a key name prefix. Amazon
  /// SageMaker uses all objects with the specified key name prefix for batch
  /// transform.
  ///
  /// If you choose `ManifestFile`, `S3Uri` identifies an object that is a
  /// manifest file containing a list of object keys that you want Amazon
  /// SageMaker to use for batch transform.
  ///
  /// The following values are compatible: `ManifestFile`, `S3Prefix`
  ///
  /// The following value is not compatible: `AugmentedManifestFile`
  final String s3DataType;

  /// Depending on the value specified for the `S3DataType`, identifies either a
  /// key name prefix or a manifest. For example:
  ///
  /// *    A key name prefix might look like this:
  /// `s3://bucketname/exampleprefix`.
  ///
  /// *    A manifest might look like this: `s3://bucketname/example.manifest`
  ///
  ///      The manifest is an S3 object which is a JSON file with the following
  /// format:
  ///
  ///      `[`
  ///
  ///       `{"prefix": "s3://customer_bucket/some/prefix/"},`
  ///
  ///       `"relative/path/to/custdata-1",`
  ///
  ///       `"relative/path/custdata-2",`
  ///
  ///       `...`
  ///
  ///       `]`
  ///
  ///      The preceding JSON matches the following `S3Uris`:
  ///
  ///      `s3://customer_bucket/some/prefix/relative/path/to/custdata-1`
  ///
  ///      `s3://customer_bucket/some/prefix/relative/path/custdata-1`
  ///
  ///      `...`
  ///
  ///      The complete set of `S3Uris` in this manifest constitutes the input
  /// data for the channel for this datasource. The object that each `S3Uris`
  /// points to must be readable by the IAM role that Amazon SageMaker uses to
  /// perform tasks on your behalf.
  final String s3Uri;

  TransformS3DataSource({
    @required this.s3DataType,
    @required this.s3Uri,
  });
  static TransformS3DataSource fromJson(Map<String, dynamic> json) =>
      TransformS3DataSource(
        s3DataType: json['S3DataType'] as String,
        s3Uri: json['S3Uri'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents an amount of money in United States dollars/
class Usd {
  /// The whole number of dollars in the amount.
  final int dollars;

  /// The fractional portion, in cents, of the amount.
  final int cents;

  /// Fractions of a cent, in tenths.
  final int tenthFractionsOfaCent;

  Usd({
    this.dollars,
    this.cents,
    this.tenthFractionsOfaCent,
  });
  static Usd fromJson(Map<String, dynamic> json) => Usd(
        dollars: json.containsKey('Dollars') ? json['Dollars'] as int : null,
        cents: json.containsKey('Cents') ? json['Cents'] as int : null,
        tenthFractionsOfaCent: json.containsKey('TenthFractionsOfACent')
            ? json['TenthFractionsOfACent'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provided configuration information for the worker UI for a labeling job.
class UiConfig {
  /// The Amazon S3 bucket location of the UI template. For more information
  /// about the contents of a UI template, see
  /// [Creating Your Custom Labeling Task Template](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-custom-templates-step2.html).
  final String uiTemplateS3Uri;

  UiConfig({
    @required this.uiTemplateS3Uri,
  });
  static UiConfig fromJson(Map<String, dynamic> json) => UiConfig(
        uiTemplateS3Uri: json['UiTemplateS3Uri'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The Liquid template for the worker user interface.
class UiTemplate {
  /// The content of the Liquid template for the worker user interface.
  final String content;

  UiTemplate({
    @required this.content,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateCodeRepositoryOutput {
  /// The ARN of the Git repository.
  final String codeRepositoryArn;

  UpdateCodeRepositoryOutput({
    @required this.codeRepositoryArn,
  });
  static UpdateCodeRepositoryOutput fromJson(Map<String, dynamic> json) =>
      UpdateCodeRepositoryOutput(
        codeRepositoryArn: json['CodeRepositoryArn'] as String,
      );
}

class UpdateEndpointOutput {
  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  UpdateEndpointOutput({
    @required this.endpointArn,
  });
  static UpdateEndpointOutput fromJson(Map<String, dynamic> json) =>
      UpdateEndpointOutput(
        endpointArn: json['EndpointArn'] as String,
      );
}

class UpdateEndpointWeightsAndCapacitiesOutput {
  /// The Amazon Resource Name (ARN) of the updated endpoint.
  final String endpointArn;

  UpdateEndpointWeightsAndCapacitiesOutput({
    @required this.endpointArn,
  });
  static UpdateEndpointWeightsAndCapacitiesOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateEndpointWeightsAndCapacitiesOutput(
        endpointArn: json['EndpointArn'] as String,
      );
}

class UpdateNotebookInstanceLifecycleConfigOutput {
  UpdateNotebookInstanceLifecycleConfigOutput();
  static UpdateNotebookInstanceLifecycleConfigOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateNotebookInstanceLifecycleConfigOutput();
}

class UpdateNotebookInstanceOutput {
  UpdateNotebookInstanceOutput();
  static UpdateNotebookInstanceOutput fromJson(Map<String, dynamic> json) =>
      UpdateNotebookInstanceOutput();
}

class UpdateWorkteamResponse {
  /// A `Workteam` object that describes the updated work team.
  final Workteam workteam;

  UpdateWorkteamResponse({
    @required this.workteam,
  });
  static UpdateWorkteamResponse fromJson(Map<String, dynamic> json) =>
      UpdateWorkteamResponse(
        workteam: Workteam.fromJson(json['Workteam']),
      );
}

/// Specifies a VPC that your training jobs and hosted models have access to.
/// Control access to and from your training and model containers by configuring
/// the VPC. For more information, see
/// [Protect Endpoints by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html)
/// and
/// [Protect Training Jobs by Using an Amazon Virtual Private Cloud](https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html).
class VpcConfig {
  /// The VPC security group IDs, in the form sg-xxxxxxxx. Specify the security
  /// groups for the VPC that is specified in the `Subnets` field.
  final List<String> securityGroupIds;

  /// The ID of the subnets in the VPC to which you want to connect your
  /// training job or model.
  ///
  ///
  ///
  /// Amazon EC2 P3 accelerated computing instances are not available in the
  /// c/d/e availability zones of region us-east-1. If you want to create
  /// endpoints with P3 instances in VPC mode in region us-east-1, create
  /// subnets in a/b/f availability zones instead.
  final List<String> subnets;

  VpcConfig({
    @required this.securityGroupIds,
    @required this.subnets,
  });
  static VpcConfig fromJson(Map<String, dynamic> json) => VpcConfig(
        securityGroupIds:
            (json['SecurityGroupIds'] as List).map((e) => e as String).toList(),
        subnets: (json['Subnets'] as List).map((e) => e as String).toList(),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Provides details about a labeling work team.
class Workteam {
  /// The name of the work team.
  final String workteamName;

  /// The Amazon Cognito user groups that make up the work team.
  final List<MemberDefinition> memberDefinitions;

  /// The Amazon Resource Name (ARN) that identifies the work team.
  final String workteamArn;

  /// The Amazon Marketplace identifier for a vendor's work team.
  final List<String> productListingIds;

  /// A description of the work team.
  final String description;

  /// The URI of the labeling job's user interface. Workers open this URI to
  /// start labeling your data objects.
  final String subDomain;

  /// The date and time that the work team was created (timestamp).
  final DateTime createDate;

  /// The date and time that the work team was last updated (timestamp).
  final DateTime lastUpdatedDate;

  /// Configures SNS notifications of available or expiring work items for work
  /// teams.
  final NotificationConfiguration notificationConfiguration;

  Workteam({
    @required this.workteamName,
    @required this.memberDefinitions,
    @required this.workteamArn,
    this.productListingIds,
    @required this.description,
    this.subDomain,
    this.createDate,
    this.lastUpdatedDate,
    this.notificationConfiguration,
  });
  static Workteam fromJson(Map<String, dynamic> json) => Workteam(
        workteamName: json['WorkteamName'] as String,
        memberDefinitions: (json['MemberDefinitions'] as List)
            .map((e) => MemberDefinition.fromJson(e))
            .toList(),
        workteamArn: json['WorkteamArn'] as String,
        productListingIds: json.containsKey('ProductListingIds')
            ? (json['ProductListingIds'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        description: json['Description'] as String,
        subDomain:
            json.containsKey('SubDomain') ? json['SubDomain'] as String : null,
        createDate: json.containsKey('CreateDate')
            ? DateTime.parse(json['CreateDate'])
            : null,
        lastUpdatedDate: json.containsKey('LastUpdatedDate')
            ? DateTime.parse(json['LastUpdatedDate'])
            : null,
        notificationConfiguration: json.containsKey('NotificationConfiguration')
            ? NotificationConfiguration.fromJson(
                json['NotificationConfiguration'])
            : null,
      );
}
