import 'package:meta/meta.dart';

/// Provides APIs for creating and managing Amazon SageMaker resources.
class SageMakerApi {
  /// Adds or overwrites one or more tags for the specified Amazon SageMaker
  /// resource. You can add tags to notebook instances, training jobs,
  /// hyperparameter tuning jobs, batch transform jobs, models, labeling jobs,
  /// work teams, endpoint configurations, and endpoints.
  ///
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource. For more information about tags, see For more information,
  /// see [AWS Tagging
  /// Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
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
  Future<void> addTags(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Create a machine learning algorithm that you can use in Amazon SageMaker
  /// and list in the AWS Marketplace.
  Future<void> createAlgorithm(
      {@required String algorithmName,
      String algorithmDescription,
      @required TrainingSpecification trainingSpecification,
      InferenceSpecification inferenceSpecification,
      AlgorithmValidationSpecification validationSpecification,
      bool certifyForMarketplace}) async {}

  /// Creates a Git repository as a resource in your Amazon SageMaker account.
  /// You can associate the repository with notebook instances so that you can
  /// use Git source control for the notebooks you create. The Git repository is
  /// a resource in your Amazon SageMaker account, so it can be associated with
  /// more than one notebook instance, and it persists independently from the
  /// lifecycle of any notebook instances it is associated with.
  ///
  /// The repository can be hosted either in [AWS
  /// CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html)
  /// or in any other Git repository.
  Future<void> createCodeRepository(
      {@required String codeRepositoryName,
      @required GitConfig gitConfig}) async {}

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
  Future<void> createCompilationJob(
      {@required String compilationJobName,
      @required String roleArn,
      @required InputConfig inputConfig,
      @required OutputConfig outputConfig,
      @required StoppingCondition stoppingCondition}) async {}

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
  /// For an example, see [Exercise 1: Using the K-Means Algorithm Provided by
  /// Amazon
  /// SageMaker](https://docs.aws.amazon.com/sagemaker/latest/dg/ex1.html).
  ///
  /// If any of the models hosted at this endpoint get model data from an Amazon
  /// S3 location, Amazon SageMaker uses AWS Security Token Service to download
  /// model artifacts from the S3 path you provided. AWS STS is activated in
  /// your IAM user account by default. If you previously deactivated AWS STS
  /// for a region, you need to reactivate AWS STS for that region. For more
  /// information, see [Activating and Deactivating AWS STS i an AWS
  /// Region](IAM/latest/UserGuide/id_credentials_temp_enable-regions.html) in
  /// the _AWS Identity and Access Management User Guide_.
  Future<void> createEndpoint(
      {@required String endpointName,
      @required String endpointConfigName,
      List<Tag> tags}) async {}

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
  Future<void> createEndpointConfig(
      {@required String endpointConfigName,
      @required List<ProductionVariant> productionVariants,
      List<Tag> tags,
      String kmsKeyId}) async {}

  /// Starts a hyperparameter tuning job. A hyperparameter tuning job finds the
  /// best version of a model by running many training jobs on your dataset
  /// using the algorithm you choose and values for hyperparameters within
  /// ranges that you specify. It then chooses the hyperparameter values that
  /// result in a model that performs the best, as measured by an objective
  /// metric that you choose.
  Future<void> createHyperParameterTuningJob(
      {@required String hyperParameterTuningJobName,
      @required HyperParameterTuningJobConfig hyperParameterTuningJobConfig,
      HyperParameterTrainingJobDefinition trainingJobDefinition,
      HyperParameterTuningJobWarmStartConfig warmStartConfig,
      List<Tag> tags}) async {}

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
  /// [Using Automated Data
  /// Labeling](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html).
  ///
  /// The data objects to be labeled are contained in an Amazon S3 bucket. You
  /// create a _manifest file_ that describes the location of each object. For
  /// more information, see [Using Input and Output
  /// Data](https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html).
  ///
  /// The output can be used as the manifest file for another labeling job or as
  /// training data for your machine learning models.
  Future<void> createLabelingJob(
      {@required String labelingJobName,
      @required String labelAttributeName,
      @required LabelingJobInputConfig inputConfig,
      @required LabelingJobOutputConfig outputConfig,
      @required String roleArn,
      String labelCategoryConfigS3Uri,
      LabelingJobStoppingConditions stoppingConditions,
      LabelingJobAlgorithmsConfig labelingJobAlgorithmsConfig,
      @required HumanTaskConfig humanTaskConfig,
      List<Tag> tags}) async {}

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
  Future<void> createModel(
      {@required String modelName,
      ContainerDefinition primaryContainer,
      List<ContainerDefinition> containers,
      @required String executionRoleArn,
      List<Tag> tags,
      VpcConfig vpcConfig,
      bool enableNetworkIsolation}) async {}

  /// Creates a model package that you can use to create Amazon SageMaker models
  /// or list on AWS Marketplace. Buyers can subscribe to model packages listed
  /// on AWS Marketplace to create models in Amazon SageMaker.
  ///
  /// To create a model package by specifying a Docker container that contains
  /// your inference code and the Amazon S3 location of your model artifacts,
  /// provide values for `InferenceSpecification`. To create a model from an
  /// algorithm resource that you created or subscribed to in AWS Marketplace,
  /// provide a value for `SourceAlgorithmSpecification`.
  Future<void> createModelPackage(String modelPackageName,
      {String modelPackageDescription,
      InferenceSpecification inferenceSpecification,
      ModelPackageValidationSpecification validationSpecification,
      SourceAlgorithmSpecification sourceAlgorithmSpecification,
      bool certifyForMarketplace}) async {}

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
  /// For more information, see [How It
  /// Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).
  Future<void> createNotebookInstance(
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
      String rootAccess}) async {}

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
  /// `\[notebook-instance-name\]/\[LifecycleConfigHook\]`.
  ///
  /// Lifecycle configuration scripts cannot run for longer than 5 minutes. If a
  /// script runs for longer than 5 minutes, it fails and the notebook instance
  /// is not created or started.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook
  /// Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  Future<void> createNotebookInstanceLifecycleConfig(
      String notebookInstanceLifecycleConfigName,
      {List<NotebookInstanceLifecycleHook> onCreate,
      List<NotebookInstanceLifecycleHook> onStart}) async {}

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
  /// the notebook instance. For more information, see [Limit Access to a
  /// Notebook Instance by IP
  /// Address](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-ip-filter.html).
  ///
  ///
  ///
  /// The URL that you get from a call to is valid only for 5 minutes. If you
  /// try to use the URL after the 5-minute limit expires, you are directed to
  /// the AWS console sign-in page.
  Future<void> createPresignedNotebookInstanceUrl(String notebookInstanceName,
      {int sessionExpirationDurationInSeconds}) async {}

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
  /// *    `AlgorithmSpecification` \- Identifies the training algorithm to use.
  ///
  /// *    `HyperParameters` \- Specify these algorithm-specific parameters to
  /// enable the estimation of model parameters during training. Hyperparameters
  /// can be tuned to optimize this learning process. For a list of
  /// hyperparameters for each training algorithm provided by Amazon SageMaker,
  /// see
  /// [Algorithms](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html).
  ///
  /// *    `InputDataConfig` \- Describes the training dataset and the Amazon
  /// S3, EFS, or FSx location where it is stored.
  ///
  /// *    `OutputDataConfig` \- Identifies the Amazon S3 bucket where you want
  /// Amazon SageMaker to save the results of model training.
  ///
  /// *    `ResourceConfig` \- Identifies the resources, ML compute instances,
  /// and ML storage volumes to deploy for model training. In distributed
  /// training, you specify more than one instance.
  ///
  /// *    `EnableManagedSpotTraining` \- Optimize the cost of training machine
  /// learning models by up to 80% by using Amazon EC2 Spot instances. For more
  /// information, see [Managed Spot
  /// Training](https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html).
  ///
  /// *    `RoleARN` \- The Amazon Resource Number (ARN) that Amazon SageMaker
  /// assumes to perform tasks on your behalf during model training. You must
  /// grant this role the necessary permissions so that Amazon SageMaker can
  /// successfully complete model training.
  ///
  /// *    `StoppingCondition` \- To help cap training costs, use
  /// `MaxRuntimeInSeconds` to set a time limit for training. Use
  /// `MaxWaitTimeInSeconds` to specify how long you are willing to to wait for
  /// a managed spot training job to complete.
  ///
  ///
  ///  For more information about Amazon SageMaker, see [How It
  /// Works](https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).
  Future<void> createTrainingJob(
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
      CheckpointConfig checkpointConfig}) async {}

  /// Starts a transform job. A transform job uses a trained model to get
  /// inferences on a dataset and saves these results to an Amazon S3 location
  /// that you specify.
  ///
  /// To perform batch transformations, you create a transform job and use the
  /// data that you have readily available.
  ///
  /// In the request body, you provide the following:
  ///
  /// *    `TransformJobName` \- Identifies the transform job. The name must be
  /// unique within an AWS Region in an AWS account.
  ///
  /// *    `ModelName` \- Identifies the model to use. `ModelName` must be the
  /// name of an existing Amazon SageMaker model in the same AWS Region and AWS
  /// account. For information on creating a model, see CreateModel.
  ///
  /// *    `TransformInput` \- Describes the dataset to be transformed and the
  /// Amazon S3 location where it is stored.
  ///
  /// *    `TransformOutput` \- Identifies the Amazon S3 location where you want
  /// Amazon SageMaker to save the results from the transform job.
  ///
  /// *    `TransformResources` \- Identifies the ML compute instances for the
  /// transform job.
  ///
  ///
  ///  For more information about how batch transformation works Amazon
  /// SageMaker, see [How It
  /// Works](https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html).
  Future<void> createTransformJob(
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
      List<Tag> tags}) async {}

  /// Creates a new work team for labeling your data. A work team is defined by
  /// one or more Amazon Cognito user pools. You must first create the user
  /// pools before you can create a work team.
  ///
  /// You cannot create more than 25 work teams in an account and region.
  Future<void> createWorkteam(
      {@required String workteamName,
      @required List<MemberDefinition> memberDefinitions,
      @required String description,
      NotificationConfiguration notificationConfiguration,
      List<Tag> tags}) async {}

  /// Removes the specified algorithm from your account.
  Future<void> deleteAlgorithm(String algorithmName) async {}

  /// Deletes the specified Git repository from your account.
  Future<void> deleteCodeRepository(String codeRepositoryName) async {}

  /// Deletes an endpoint. Amazon SageMaker frees up all of the resources that
  /// were deployed when the endpoint was created.
  ///
  /// Amazon SageMaker retires any custom KMS key grants associated with the
  /// endpoint, meaning you don't need to use the
  /// [RevokeGrant](http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html)
  /// API call.
  Future<void> deleteEndpoint(String endpointName) async {}

  /// Deletes an endpoint configuration. The `DeleteEndpointConfig` API deletes
  /// only the specified configuration. It does not delete endpoints created
  /// using the configuration.
  Future<void> deleteEndpointConfig(String endpointConfigName) async {}

  /// Deletes a model. The `DeleteModel` API deletes only the model entry that
  /// was created in Amazon SageMaker when you called the
  /// [CreateModel](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateModel.html)
  /// API. It does not delete model artifacts, inference code, or the IAM role
  /// that you specified when creating the model.
  Future<void> deleteModel(String modelName) async {}

  /// Deletes a model package.
  ///
  /// A model package is used to create Amazon SageMaker models or list on AWS
  /// Marketplace. Buyers can subscribe to model packages listed on AWS
  /// Marketplace to create models in Amazon SageMaker.
  Future<void> deleteModelPackage(String modelPackageName) async {}

  ///  Deletes an Amazon SageMaker notebook instance. Before you can delete a
  /// notebook instance, you must call the `StopNotebookInstance` API.
  ///
  ///
  ///
  /// When you delete a notebook instance, you lose all of your data. Amazon
  /// SageMaker removes the ML compute instance, and deletes the ML storage
  /// volume and the network interface associated with the notebook instance.
  Future<void> deleteNotebookInstance(String notebookInstanceName) async {}

  /// Deletes a notebook instance lifecycle configuration.
  Future<void> deleteNotebookInstanceLifecycleConfig(
      String notebookInstanceLifecycleConfigName) async {}

  /// Deletes the specified tags from an Amazon SageMaker resource.
  ///
  /// To list a resource's tags, use the `ListTags` API.
  ///
  ///
  ///
  /// When you call this API to delete tags from a hyperparameter tuning job,
  /// the deleted tags are not removed from training jobs that the
  /// hyperparameter tuning job launched before you called this API.
  Future<void> deleteTags(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Deletes an existing work team. This operation can't be undone.
  Future<void> deleteWorkteam(String workteamName) async {}

  /// Returns a description of the specified algorithm that is in your account.
  Future<void> describeAlgorithm(String algorithmName) async {}

  /// Gets details about the specified Git repository.
  Future<void> describeCodeRepository(String codeRepositoryName) async {}

  /// Returns information about a model compilation job.
  ///
  /// To create a model compilation job, use CreateCompilationJob. To get
  /// information about multiple model compilation jobs, use
  /// ListCompilationJobs.
  Future<void> describeCompilationJob(String compilationJobName) async {}

  /// Returns the description of an endpoint.
  Future<void> describeEndpoint(String endpointName) async {}

  /// Returns the description of an endpoint configuration created using the
  /// `CreateEndpointConfig` API.
  Future<void> describeEndpointConfig(String endpointConfigName) async {}

  /// Gets a description of a hyperparameter tuning job.
  Future<void> describeHyperParameterTuningJob(
      String hyperParameterTuningJobName) async {}

  /// Gets information about a labeling job.
  Future<void> describeLabelingJob(String labelingJobName) async {}

  /// Describes a model that you created using the `CreateModel` API.
  Future<void> describeModel(String modelName) async {}

  /// Returns a description of the specified model package, which is used to
  /// create Amazon SageMaker models or list them on AWS Marketplace.
  ///
  /// To create models in Amazon SageMaker, buyers can subscribe to model
  /// packages listed on AWS Marketplace.
  Future<void> describeModelPackage(String modelPackageName) async {}

  /// Returns information about a notebook instance.
  Future<void> describeNotebookInstance(String notebookInstanceName) async {}

  /// Returns a description of a notebook instance lifecycle configuration.
  ///
  /// For information about notebook instance lifestyle configurations, see
  /// [Step 2.1: (Optional) Customize a Notebook
  /// Instance](https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html).
  Future<void> describeNotebookInstanceLifecycleConfig(
      String notebookInstanceLifecycleConfigName) async {}

  /// Gets information about a work team provided by a vendor. It returns
  /// details about the subscription with a vendor in the AWS Marketplace.
  Future<void> describeSubscribedWorkteam(String workteamArn) async {}

  /// Returns information about a training job.
  Future<void> describeTrainingJob(String trainingJobName) async {}

  /// Returns information about a transform job.
  Future<void> describeTransformJob(String transformJobName) async {}

  /// Gets information about a specific work team. You can see information such
  /// as the create date, the last updated date, membership information, and the
  /// work team's Amazon Resource Name (ARN).
  Future<void> describeWorkteam(String workteamName) async {}

  /// An auto-complete API for the search functionality in the Amazon SageMaker
  /// console. It returns suggestions of possible matches for the property name
  /// to use in `Search` queries. Provides suggestions for `HyperParameters`,
  /// `Tags`, and `Metrics`.
  Future<void> getSearchSuggestions(String resource,
      {SuggestionQuery suggestionQuery}) async {}

  /// Lists the machine learning algorithms that have been created.
  Future<void> listAlgorithms(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {}

  /// Gets a list of the Git repositories in your account.
  Future<void> listCodeRepositories(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {}

  /// Lists model compilation jobs that satisfy various filters.
  ///
  /// To create a model compilation job, use CreateCompilationJob. To get
  /// information about a particular model compilation job you have created, use
  /// DescribeCompilationJob.
  Future<void> listCompilationJobs(
      {String nextToken,
      int maxResults,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder}) async {}

  /// Lists endpoint configurations.
  Future<void> listEndpointConfigs(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter}) async {}

  /// Lists endpoints.
  Future<void> listEndpoints(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter,
      DateTime lastModifiedTimeBefore,
      DateTime lastModifiedTimeAfter,
      String statusEquals}) async {}

  /// Gets a list of HyperParameterTuningJobSummary objects that describe the
  /// hyperparameter tuning jobs launched in your account.
  Future<void> listHyperParameterTuningJobs(
      {String nextToken,
      int maxResults,
      String sortBy,
      String sortOrder,
      String nameContains,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String statusEquals}) async {}

  /// Gets a list of labeling jobs.
  Future<void> listLabelingJobs(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      int maxResults,
      String nextToken,
      String nameContains,
      String sortBy,
      String sortOrder,
      String statusEquals}) async {}

  /// Gets a list of labeling jobs assigned to a specified work team.
  Future<void> listLabelingJobsForWorkteam(String workteamArn,
      {int maxResults,
      String nextToken,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      String jobReferenceCodeContains,
      String sortBy,
      String sortOrder}) async {}

  /// Lists the model packages that have been created.
  Future<void> listModelPackages(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      int maxResults,
      String nameContains,
      String nextToken,
      String sortBy,
      String sortOrder}) async {}

  /// Lists models created with the
  /// [CreateModel](https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateModel.html)
  /// API.
  Future<void> listModels(
      {String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter}) async {}

  /// Lists notebook instance lifestyle configurations created with the
  /// CreateNotebookInstanceLifecycleConfig API.
  Future<void> listNotebookInstanceLifecycleConfigs(
      {String nextToken,
      int maxResults,
      String sortBy,
      String sortOrder,
      String nameContains,
      DateTime creationTimeBefore,
      DateTime creationTimeAfter,
      DateTime lastModifiedTimeBefore,
      DateTime lastModifiedTimeAfter}) async {}

  /// Returns a list of the Amazon SageMaker notebook instances in the
  /// requester's account in an AWS Region.
  Future<void> listNotebookInstances(
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
      String additionalCodeRepositoryEquals}) async {}

  /// Gets a list of the work teams that you are subscribed to in the AWS
  /// Marketplace. The list may be empty if no work team satisfies the filter
  /// specified in the `NameContains` parameter.
  Future<void> listSubscribedWorkteams(
      {String nameContains, String nextToken, int maxResults}) async {}

  /// Returns the tags for the specified Amazon SageMaker resource.
  Future<void> listTags(String resourceArn,
      {String nextToken, int maxResults}) async {}

  /// Lists training jobs.
  Future<void> listTrainingJobs(
      {String nextToken,
      int maxResults,
      DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder}) async {}

  /// Gets a list of TrainingJobSummary objects that describe the training jobs
  /// that a hyperparameter tuning job launched.
  Future<void> listTrainingJobsForHyperParameterTuningJob(
      String hyperParameterTuningJobName,
      {String nextToken,
      int maxResults,
      String statusEquals,
      String sortBy,
      String sortOrder}) async {}

  /// Lists transform jobs.
  Future<void> listTransformJobs(
      {DateTime creationTimeAfter,
      DateTime creationTimeBefore,
      DateTime lastModifiedTimeAfter,
      DateTime lastModifiedTimeBefore,
      String nameContains,
      String statusEquals,
      String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults}) async {}

  /// Gets a list of work teams that you have defined in a region. The list may
  /// be empty if no work team satisfies the filter specified in the
  /// `NameContains` parameter.
  Future<void> listWorkteams(
      {String sortBy,
      String sortOrder,
      String nameContains,
      String nextToken,
      int maxResults}) async {}

  /// Renders the UI template so that you can preview the worker's experience.
  Future<void> renderUiTemplate(
      {@required UiTemplate uiTemplate,
      @required RenderableTask task,
      @required String roleArn}) async {}

  /// Finds Amazon SageMaker resources that match a search query. Matching
  /// resource objects are returned as a list of `SearchResult` objects in the
  /// response. You can sort the search results by any resource property in a
  /// ascending or descending order.
  ///
  /// You can query against the following value types: numerical, text,
  /// Booleans, and timestamps.
  Future<void> search(String resource,
      {SearchExpression searchExpression,
      String sortBy,
      String sortOrder,
      String nextToken,
      int maxResults}) async {}

  /// Launches an ML compute instance with the latest version of the libraries
  /// and attaches your ML storage volume. After configuring the notebook
  /// instance, Amazon SageMaker sets the notebook instance status to
  /// `InService`. A notebook instance's status must be `InService` before you
  /// can connect to your Jupyter notebook.
  Future<void> startNotebookInstance(String notebookInstanceName) async {}

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
  Future<void> stopCompilationJob(String compilationJobName) async {}

  /// Stops a running hyperparameter tuning job and all running training jobs
  /// that the tuning job launched.
  ///
  /// All model artifacts output from the training jobs are stored in Amazon
  /// Simple Storage Service (Amazon S3). All data that the training jobs write
  /// to Amazon CloudWatch Logs are still available in CloudWatch. After the
  /// tuning job moves to the `Stopped` state, it releases all reserved
  /// resources for the tuning job.
  Future<void> stopHyperParameterTuningJob(
      String hyperParameterTuningJobName) async {}

  /// Stops a running labeling job. A job that is stopped cannot be restarted.
  /// Any results obtained before the job is stopped are placed in the Amazon S3
  /// output bucket.
  Future<void> stopLabelingJob(String labelingJobName) async {}

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
  Future<void> stopNotebookInstance(String notebookInstanceName) async {}

  /// Stops a training job. To stop a job, Amazon SageMaker sends the algorithm
  /// the `SIGTERM` signal, which delays job termination for 120 seconds.
  /// Algorithms might use this 120-second window to save the model artifacts,
  /// so the results of the training is not lost.
  ///
  /// When it receives a `StopTrainingJob` request, Amazon SageMaker changes the
  /// status of the job to `Stopping`. After Amazon SageMaker stops the job, it
  /// sets the status to `Stopped`.
  Future<void> stopTrainingJob(String trainingJobName) async {}

  /// Stops a transform job.
  ///
  /// When Amazon SageMaker receives a `StopTransformJob` request, the status of
  /// the job changes to `Stopping`. After Amazon SageMaker stops the job, the
  /// status is set to `Stopped`. When you stop a transform job before it is
  /// completed, Amazon SageMaker doesn't store the job's output in Amazon S3.
  Future<void> stopTransformJob(String transformJobName) async {}

  /// Updates the specified Git repository with the specified values.
  Future<void> updateCodeRepository(String codeRepositoryName,
      {GitConfigForUpdate gitConfig}) async {}

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
  Future<void> updateEndpoint(
      {@required String endpointName,
      @required String endpointConfigName}) async {}

  /// Updates variant weight of one or more variants associated with an existing
  /// endpoint, or capacity of one variant associated with an existing endpoint.
  /// When it receives the request, Amazon SageMaker sets the endpoint status to
  /// `Updating`. After updating the endpoint, it sets the status to
  /// `InService`. To check the status of an endpoint, use the
  /// [DescribeEndpoint](https://docs.aws.amazon.com/sagemaker/latest/dg/API_DescribeEndpoint.html)
  /// API.
  Future<void> updateEndpointWeightsAndCapacities(
      {@required
          String endpointName,
      @required
          List<DesiredWeightAndCapacity> desiredWeightsAndCapacities}) async {}

  /// Updates a notebook instance. NotebookInstance updates include upgrading or
  /// downgrading the ML compute instance used for your notebook instance to
  /// accommodate changes in your workload requirements.
  Future<void> updateNotebookInstance(String notebookInstanceName,
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
      String rootAccess}) async {}

  /// Updates a notebook instance lifecycle configuration created with the
  /// CreateNotebookInstanceLifecycleConfig API.
  Future<void> updateNotebookInstanceLifecycleConfig(
      String notebookInstanceLifecycleConfigName,
      {List<NotebookInstanceLifecycleHook> onCreate,
      List<NotebookInstanceLifecycleHook> onStart}) async {}

  /// Updates an existing work team with new member definitions or description.
  Future<void> updateWorkteam(String workteamName,
      {List<MemberDefinition> memberDefinitions,
      String description,
      NotificationConfiguration notificationConfiguration}) async {}
}

class AddTagsOutput {}

class AlgorithmSpecification {}

class AlgorithmStatusDetails {}

class AlgorithmStatusItem {}

class AlgorithmSummary {}

class AlgorithmValidationProfile {}

class AlgorithmValidationSpecification {}

class AnnotationConsolidationConfig {}

class CategoricalParameterRange {}

class CategoricalParameterRangeSpecification {}

class Channel {}

class ChannelSpecification {}

class CheckpointConfig {}

class CodeRepositorySummary {}

class CognitoMemberDefinition {}

class CompilationJobSummary {}

class ContainerDefinition {}

class ContinuousParameterRange {}

class ContinuousParameterRangeSpecification {}

class CreateAlgorithmOutput {}

class CreateCodeRepositoryOutput {}

class CreateCompilationJobResponse {}

class CreateEndpointConfigOutput {}

class CreateEndpointOutput {}

class CreateHyperParameterTuningJobResponse {}

class CreateLabelingJobResponse {}

class CreateModelOutput {}

class CreateModelPackageOutput {}

class CreateNotebookInstanceLifecycleConfigOutput {}

class CreateNotebookInstanceOutput {}

class CreatePresignedNotebookInstanceUrlOutput {}

class CreateTrainingJobResponse {}

class CreateTransformJobResponse {}

class CreateWorkteamResponse {}

class DataProcessing {}

class DataSource {}

class DeleteTagsOutput {}

class DeleteWorkteamResponse {}

class DeployedImage {}

class DescribeAlgorithmOutput {}

class DescribeCodeRepositoryOutput {}

class DescribeCompilationJobResponse {}

class DescribeEndpointConfigOutput {}

class DescribeEndpointOutput {}

class DescribeHyperParameterTuningJobResponse {}

class DescribeLabelingJobResponse {}

class DescribeModelOutput {}

class DescribeModelPackageOutput {}

class DescribeNotebookInstanceLifecycleConfigOutput {}

class DescribeNotebookInstanceOutput {}

class DescribeSubscribedWorkteamResponse {}

class DescribeTrainingJobResponse {}

class DescribeTransformJobResponse {}

class DescribeWorkteamResponse {}

class DesiredWeightAndCapacity {}

class EndpointConfigSummary {}

class EndpointSummary {}

class FileSystemDataSource {}

class Filter {}

class FinalHyperParameterTuningJobObjectiveMetric {}

class GetSearchSuggestionsResponse {}

class GitConfig {}

class GitConfigForUpdate {}

class HumanTaskConfig {}

class HyperParameterAlgorithmSpecification {}

class HyperParameterSpecification {}

class HyperParameterTrainingJobDefinition {}

class HyperParameterTrainingJobSummary {}

class HyperParameterTuningJobConfig {}

class HyperParameterTuningJobObjective {}

class HyperParameterTuningJobSummary {}

class HyperParameterTuningJobWarmStartConfig {}

class InferenceSpecification {}

class InputConfig {}

class IntegerParameterRange {}

class IntegerParameterRangeSpecification {}

class LabelCounters {}

class LabelCountersForWorkteam {}

class LabelingJobAlgorithmsConfig {}

class LabelingJobDataAttributes {}

class LabelingJobDataSource {}

class LabelingJobForWorkteamSummary {}

class LabelingJobInputConfig {}

class LabelingJobOutput {}

class LabelingJobOutputConfig {}

class LabelingJobResourceConfig {}

class LabelingJobS3DataSource {}

class LabelingJobStoppingConditions {}

class LabelingJobSummary {}

class ListAlgorithmsOutput {}

class ListCodeRepositoriesOutput {}

class ListCompilationJobsResponse {}

class ListEndpointConfigsOutput {}

class ListEndpointsOutput {}

class ListHyperParameterTuningJobsResponse {}

class ListLabelingJobsForWorkteamResponse {}

class ListLabelingJobsResponse {}

class ListModelPackagesOutput {}

class ListModelsOutput {}

class ListNotebookInstanceLifecycleConfigsOutput {}

class ListNotebookInstancesOutput {}

class ListSubscribedWorkteamsResponse {}

class ListTagsOutput {}

class ListTrainingJobsForHyperParameterTuningJobResponse {}

class ListTrainingJobsResponse {}

class ListTransformJobsResponse {}

class ListWorkteamsResponse {}

class MemberDefinition {}

class MetricData {}

class MetricDefinition {}

class ModelArtifacts {}

class ModelPackageContainerDefinition {}

class ModelPackageStatusDetails {}

class ModelPackageStatusItem {}

class ModelPackageSummary {}

class ModelPackageValidationProfile {}

class ModelPackageValidationSpecification {}

class ModelSummary {}

class NestedFilters {}

class NotebookInstanceLifecycleConfigSummary {}

class NotebookInstanceLifecycleHook {}

class NotebookInstanceSummary {}

class NotificationConfiguration {}

class ObjectiveStatusCounters {}

class OutputConfig {}

class OutputDataConfig {}

class ParameterRange {}

class ParameterRanges {}

class ParentHyperParameterTuningJob {}

class ProductionVariant {}

class ProductionVariantSummary {}

class PropertyNameQuery {}

class PropertyNameSuggestion {}

class PublicWorkforceTaskPrice {}

class RenderUiTemplateResponse {}

class RenderableTask {}

class RenderingError {}

class ResourceConfig {}

class ResourceLimits {}

class S3DataSource {}

class SearchExpression {}

class SearchRecord {}

class SearchResponse {}

class SecondaryStatusTransition {}

class ShuffleConfig {}

class SourceAlgorithm {}

class SourceAlgorithmSpecification {}

class StoppingCondition {}

class SubscribedWorkteam {}

class SuggestionQuery {}

class Tag {}

class TrainingJob {}

class TrainingJobDefinition {}

class TrainingJobStatusCounters {}

class TrainingJobSummary {}

class TrainingSpecification {}

class TransformDataSource {}

class TransformInput {}

class TransformJobDefinition {}

class TransformJobSummary {}

class TransformOutput {}

class TransformResources {}

class TransformS3DataSource {}

class Usd {}

class UiConfig {}

class UiTemplate {}

class UpdateCodeRepositoryOutput {}

class UpdateEndpointOutput {}

class UpdateEndpointWeightsAndCapacitiesOutput {}

class UpdateNotebookInstanceLifecycleConfigOutput {}

class UpdateNotebookInstanceOutput {}

class UpdateWorkteamResponse {}

class VpcConfig {}

class Workteam {}
