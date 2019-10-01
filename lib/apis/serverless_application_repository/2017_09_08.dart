import 'package:meta/meta.dart';

/// The AWS Serverless Application Repository makes it easy for developers and
/// enterprises to quickly find and deploy serverless applications in the AWS
/// Cloud. For more information about serverless applications, see Serverless
/// Computing and Applications on the AWS website.
///
/// The AWS Serverless Application Repository is deeply integrated with the AWS
/// Lambda console, so that developers of all levels can get started with
/// serverless computing without needing to learn anything new. You can use
/// category keywords to browse for applications such as web and mobile
/// backends, data processing applications, or chatbots. You can also search for
/// applications by name, publisher, or event source. To use an application, you
/// simply choose it, configure any required fields, and deploy it with a few
/// clicks.
///
/// You can also easily publish applications, sharing them publicly with the
/// community at large, or privately within your team or across your
/// organization. To publish a serverless application (or app), you can use the
/// AWS Management Console, AWS Command Line Interface (AWS CLI), or AWS SDKs to
/// upload the code. Along with the code, you upload a simple manifest file,
/// also known as the AWS Serverless Application Model (AWS SAM) template. For
/// more information about AWS SAM, see AWS Serverless Application Model (AWS
/// SAM) on the AWS Labs GitHub repository.
///
/// The AWS Serverless Application Repository Developer Guide contains more
/// information about the two developer experiences available:
///
/// *   Consuming Applications – Browse for applications and view information
/// about them, including source code and readme files. Also install, configure,
/// and deploy applications of your choosing.
///
///     Publishing Applications – Configure and upload applications to make them
/// available to other developers, and publish new versions of applications.
class ServerlessApplicationRepositoryApi {
  final _client;
  ServerlessApplicationRepositoryApi(client)
      : _client = client.configured('ServerlessApplicationRepository',
            serializer: 'rest-json');

  /// Creates an application, optionally including an AWS SAM file to create the
  /// first application version in the same call.
  ///
  /// [author]: The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  ///
  /// [description]: The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  ///
  /// [homePageUrl]: A URL with more information about the application, for
  /// example the location of your GitHub repository for the application.
  ///
  /// [labels]: Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  ///
  /// [licenseBody]: A local text file that contains the license of the app that
  /// matches the spdxLicenseID value of your application. The file has the
  /// format file://<path>/<filename>.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of licenseBody and licenseUrl; otherwise, an
  /// error results.
  ///
  /// [licenseUrl]: A link to the S3 object that contains the license of the app
  /// that matches the spdxLicenseID value of your application.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of licenseBody and licenseUrl; otherwise, an
  /// error results.
  ///
  /// [name]: The name of the application that you want to publish.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9-]+";
  ///
  /// [readmeBody]: A local text readme file in Markdown language that contains
  /// a more detailed description of the application and how it works. The file
  /// has the format file://<path>/<filename>.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of readmeBody and readmeUrl; otherwise, an error
  /// results.
  ///
  /// [readmeUrl]: A link to the S3 object in Markdown language that contains a
  /// more detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of readmeBody and readmeUrl; otherwise, an error
  /// results.
  ///
  /// [semanticVersion]: The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  ///
  /// [sourceCodeArchiveUrl]: A link to the S3 object that contains the ZIP
  /// archive of the source code for this version of your application.
  ///
  /// Maximum size 50 MB
  ///
  /// [sourceCodeUrl]: A link to a public repository for the source code of your
  /// application, for example the URL of a specific GitHub commit.
  ///
  /// [spdxLicenseId]: A valid identifier from
  /// [https://spdx.org/licenses/](https://spdx.org/licenses/).
  ///
  /// [templateBody]: The local raw packaged AWS SAM template file of your
  /// application. The file has the format file://<path>/<filename>.
  ///
  /// You can specify only one of templateBody and templateUrl; otherwise an
  /// error results.
  ///
  /// [templateUrl]: A link to the S3 object containing the packaged AWS SAM
  /// template of your application.
  ///
  /// You can specify only one of templateBody and templateUrl; otherwise an
  /// error results.
  Future<CreateApplicationResponse> createApplication(
      {@required String author,
      @required String description,
      String homePageUrl,
      List<String> labels,
      String licenseBody,
      String licenseUrl,
      @required String name,
      String readmeBody,
      String readmeUrl,
      String semanticVersion,
      String sourceCodeArchiveUrl,
      String sourceCodeUrl,
      String spdxLicenseId,
      String templateBody,
      String templateUrl}) async {
    var response_ = await _client.send('CreateApplication', {
      'Author': author,
      'Description': description,
      if (homePageUrl != null) 'HomePageUrl': homePageUrl,
      if (labels != null) 'Labels': labels,
      if (licenseBody != null) 'LicenseBody': licenseBody,
      if (licenseUrl != null) 'LicenseUrl': licenseUrl,
      'Name': name,
      if (readmeBody != null) 'ReadmeBody': readmeBody,
      if (readmeUrl != null) 'ReadmeUrl': readmeUrl,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
      if (sourceCodeArchiveUrl != null)
        'SourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'SourceCodeUrl': sourceCodeUrl,
      if (spdxLicenseId != null) 'SpdxLicenseId': spdxLicenseId,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateUrl': templateUrl,
    });
    return CreateApplicationResponse.fromJson(response_);
  }

  /// Creates an application version.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [semanticVersion]: The semantic version of the new version.
  ///
  /// [sourceCodeArchiveUrl]: A link to the S3 object that contains the ZIP
  /// archive of the source code for this version of your application.
  ///
  /// Maximum size 50 MB
  ///
  /// [sourceCodeUrl]: A link to a public repository for the source code of your
  /// application, for example the URL of a specific GitHub commit.
  ///
  /// [templateBody]: The raw packaged AWS SAM template of your application.
  ///
  /// [templateUrl]: A link to the packaged AWS SAM template of your
  /// application.
  Future<CreateApplicationVersionResponse> createApplicationVersion(
      {@required String applicationId,
      @required String semanticVersion,
      String sourceCodeArchiveUrl,
      String sourceCodeUrl,
      String templateBody,
      String templateUrl}) async {
    var response_ = await _client.send('CreateApplicationVersion', {
      'ApplicationId': applicationId,
      'SemanticVersion': semanticVersion,
      if (sourceCodeArchiveUrl != null)
        'SourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'SourceCodeUrl': sourceCodeUrl,
      if (templateBody != null) 'TemplateBody': templateBody,
      if (templateUrl != null) 'TemplateUrl': templateUrl,
    });
    return CreateApplicationVersionResponse.fromJson(response_);
  }

  /// Creates an AWS CloudFormation change set for the given application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [capabilities]: A list of values that you must specify before you can
  /// deploy certain applications. Some applications might include resources
  /// that can affect permissions in your AWS account, for example, by creating
  /// new AWS Identity and Access Management (IAM) users. For those
  /// applications, you must explicitly acknowledge their capabilities by
  /// specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html),
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html),
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// and
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html).
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM or CAPABILITY_NAMED_IAM. If the application contains IAM
  /// resources with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// [AWS::Lambda::Permission](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html),
  /// [AWS::IAM:Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// [AWS::ApplicationAutoScaling::ScalingPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html),
  /// [AWS::S3::BucketPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html),
  /// [AWS::SQS::QueuePolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html),
  /// and
  /// [AWS::SNS:TopicPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html).
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review all permissions associated with the application
  /// before deploying. If you don't specify this parameter for an application
  /// that requires capabilities, the call will fail.
  ///
  /// [changeSetName]: This property corresponds to the parameter of the same
  /// name for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [clientToken]: This property corresponds to the parameter of the same name
  /// for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [description]: This property corresponds to the parameter of the same name
  /// for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [notificationArns]: This property corresponds to the parameter of the same
  /// name for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [parameterOverrides]: A list of parameter values for the parameters of the
  /// application.
  ///
  /// [resourceTypes]: This property corresponds to the parameter of the same
  /// name for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [rollbackConfiguration]: This property corresponds to the parameter of the
  /// same name for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [semanticVersion]: The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  ///
  /// [stackName]: This property corresponds to the parameter of the same name
  /// for the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [tags]: This property corresponds to the parameter of the same name for
  /// the _AWS CloudFormation
  /// [CreateChangeSet](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet)_
  ///  API.
  ///
  /// [templateId]: The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}
  Future<CreateCloudFormationChangeSetResponse> createCloudFormationChangeSet(
      {@required String applicationId,
      List<String> capabilities,
      String changeSetName,
      String clientToken,
      String description,
      List<String> notificationArns,
      List<ParameterValue> parameterOverrides,
      List<String> resourceTypes,
      RollbackConfiguration rollbackConfiguration,
      String semanticVersion,
      @required String stackName,
      List<Tag> tags,
      String templateId}) async {
    var response_ = await _client.send('CreateCloudFormationChangeSet', {
      'ApplicationId': applicationId,
      if (capabilities != null) 'Capabilities': capabilities,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (notificationArns != null) 'NotificationArns': notificationArns,
      if (parameterOverrides != null) 'ParameterOverrides': parameterOverrides,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (rollbackConfiguration != null)
        'RollbackConfiguration': rollbackConfiguration,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
      'StackName': stackName,
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    });
    return CreateCloudFormationChangeSetResponse.fromJson(response_);
  }

  /// Creates an AWS CloudFormation template.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [semanticVersion]: The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  Future<CreateCloudFormationTemplateResponse> createCloudFormationTemplate(
      String applicationId,
      {String semanticVersion}) async {
    var response_ = await _client.send('CreateCloudFormationTemplate', {
      'ApplicationId': applicationId,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
    });
    return CreateCloudFormationTemplateResponse.fromJson(response_);
  }

  /// Deletes the specified application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  Future<void> deleteApplication(String applicationId) async {
    await _client.send('DeleteApplication', {
      'ApplicationId': applicationId,
    });
  }

  /// Gets the specified application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [semanticVersion]: The semantic version of the application to get.
  Future<GetApplicationResponse> getApplication(String applicationId,
      {String semanticVersion}) async {
    var response_ = await _client.send('GetApplication', {
      'ApplicationId': applicationId,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
    });
    return GetApplicationResponse.fromJson(response_);
  }

  /// Retrieves the policy for the application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  Future<GetApplicationPolicyResponse> getApplicationPolicy(
      String applicationId) async {
    var response_ = await _client.send('GetApplicationPolicy', {
      'ApplicationId': applicationId,
    });
    return GetApplicationPolicyResponse.fromJson(response_);
  }

  /// Gets the specified AWS CloudFormation template.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [templateId]: The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}
  Future<GetCloudFormationTemplateResponse> getCloudFormationTemplate(
      {@required String applicationId, @required String templateId}) async {
    var response_ = await _client.send('GetCloudFormationTemplate', {
      'ApplicationId': applicationId,
      'TemplateId': templateId,
    });
    return GetCloudFormationTemplateResponse.fromJson(response_);
  }

  /// Retrieves the list of applications nested in the containing application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [maxItems]: The total number of items to return.
  ///
  /// [nextToken]: A token to specify where to start paginating.
  ///
  /// [semanticVersion]: The semantic version of the application to get.
  Future<ListApplicationDependenciesResponse> listApplicationDependencies(
      String applicationId,
      {int maxItems,
      String nextToken,
      String semanticVersion}) async {
    var response_ = await _client.send('ListApplicationDependencies', {
      'ApplicationId': applicationId,
      if (maxItems != null) 'MaxItems': maxItems,
      if (nextToken != null) 'NextToken': nextToken,
      if (semanticVersion != null) 'SemanticVersion': semanticVersion,
    });
    return ListApplicationDependenciesResponse.fromJson(response_);
  }

  /// Lists versions for the specified application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [maxItems]: The total number of items to return.
  ///
  /// [nextToken]: A token to specify where to start paginating.
  Future<ListApplicationVersionsResponse> listApplicationVersions(
      String applicationId,
      {int maxItems,
      String nextToken}) async {
    var response_ = await _client.send('ListApplicationVersions', {
      'ApplicationId': applicationId,
      if (maxItems != null) 'MaxItems': maxItems,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListApplicationVersionsResponse.fromJson(response_);
  }

  /// Lists applications owned by the requester.
  ///
  /// [maxItems]: The total number of items to return.
  ///
  /// [nextToken]: A token to specify where to start paginating.
  Future<ListApplicationsResponse> listApplications(
      {int maxItems, String nextToken}) async {
    var response_ = await _client.send('ListApplications', {
      if (maxItems != null) 'MaxItems': maxItems,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListApplicationsResponse.fromJson(response_);
  }

  /// Sets the permission policy for an application. For the list of actions
  /// supported for this operation, see
  /// [Application Permissions](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions)
  /// .
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [statements]: An array of policy statements applied to the application.
  Future<PutApplicationPolicyResponse> putApplicationPolicy(
      {@required String applicationId,
      @required List<ApplicationPolicyStatement> statements}) async {
    var response_ = await _client.send('PutApplicationPolicy', {
      'ApplicationId': applicationId,
      'Statements': statements,
    });
    return PutApplicationPolicyResponse.fromJson(response_);
  }

  /// Updates the specified application.
  ///
  /// [applicationId]: The Amazon Resource Name (ARN) of the application.
  ///
  /// [author]: The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  ///
  /// [description]: The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  ///
  /// [homePageUrl]: A URL with more information about the application, for
  /// example the location of your GitHub repository for the application.
  ///
  /// [labels]: Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  ///
  /// [readmeBody]: A text readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  ///
  /// [readmeUrl]: A link to the readme file in Markdown language that contains
  /// a more detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  Future<UpdateApplicationResponse> updateApplication(String applicationId,
      {String author,
      String description,
      String homePageUrl,
      List<String> labels,
      String readmeBody,
      String readmeUrl}) async {
    var response_ = await _client.send('UpdateApplication', {
      'ApplicationId': applicationId,
      if (author != null) 'Author': author,
      if (description != null) 'Description': description,
      if (homePageUrl != null) 'HomePageUrl': homePageUrl,
      if (labels != null) 'Labels': labels,
      if (readmeBody != null) 'ReadmeBody': readmeBody,
      if (readmeUrl != null) 'ReadmeUrl': readmeUrl,
    });
    return UpdateApplicationResponse.fromJson(response_);
  }
}

/// A nested application summary.
class ApplicationDependencySummary {
  /// The Amazon Resource Name (ARN) of the nested application.
  final String applicationId;

  /// The semantic version of the nested application.
  final String semanticVersion;

  ApplicationDependencySummary({
    @required this.applicationId,
    @required this.semanticVersion,
  });
  static ApplicationDependencySummary fromJson(Map<String, dynamic> json) =>
      ApplicationDependencySummary(
        applicationId: json['ApplicationId'] as String,
        semanticVersion: json['SemanticVersion'] as String,
      );
}

/// Policy statement applied to the application.
class ApplicationPolicyStatement {
  /// For the list of actions supported for this operation, see
  /// [Application Permissions](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions).
  final List<String> actions;

  /// An array of AWS account IDs, or * to make the application public.
  final List<String> principals;

  /// A unique ID for the statement.
  final String statementId;

  ApplicationPolicyStatement({
    @required this.actions,
    @required this.principals,
    this.statementId,
  });
  static ApplicationPolicyStatement fromJson(Map<String, dynamic> json) =>
      ApplicationPolicyStatement(
        actions: (json['Actions'] as List).map((e) => e as String).toList(),
        principals:
            (json['Principals'] as List).map((e) => e as String).toList(),
        statementId: json.containsKey('StatementId')
            ? json['StatementId'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Summary of details about the application.
class ApplicationSummary {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String author;

  /// The date and time this resource was created.
  final String creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String description;

  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  final String homePageUrl;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  final List<String> labels;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9-]+";
  final String name;

  /// A valid identifier from
  /// [https://spdx.org/licenses/](https://spdx.org/licenses/).
  final String spdxLicenseId;

  ApplicationSummary({
    @required this.applicationId,
    @required this.author,
    this.creationTime,
    @required this.description,
    this.homePageUrl,
    this.labels,
    @required this.name,
    this.spdxLicenseId,
  });
  static ApplicationSummary fromJson(Map<String, dynamic> json) =>
      ApplicationSummary(
        applicationId: json['ApplicationId'] as String,
        author: json['Author'] as String,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        description: json['Description'] as String,
        homePageUrl: json.containsKey('HomePageUrl')
            ? json['HomePageUrl'] as String
            : null,
        labels: json.containsKey('Labels')
            ? (json['Labels'] as List).map((e) => e as String).toList()
            : null,
        name: json['Name'] as String,
        spdxLicenseId: json.containsKey('SpdxLicenseId')
            ? json['SpdxLicenseId'] as String
            : null,
      );
}

class CreateApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String author;

  /// The date and time this resource was created.
  final String creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String description;

  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  final String homePageUrl;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  final List<String> labels;

  /// A link to a license file of the app that matches the spdxLicenseID value
  /// of your application.
  ///
  /// Maximum size 5 MB
  final String licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9-]+";
  final String name;

  /// A link to the readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String spdxLicenseId;

  /// Version information about the application.
  final Version version;

  CreateApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.version,
  });
  static CreateApplicationResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        author: json.containsKey('Author') ? json['Author'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        homePageUrl: json.containsKey('HomePageUrl')
            ? json['HomePageUrl'] as String
            : null,
        labels: json.containsKey('Labels')
            ? (json['Labels'] as List).map((e) => e as String).toList()
            : null,
        licenseUrl: json.containsKey('LicenseUrl')
            ? json['LicenseUrl'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        readmeUrl:
            json.containsKey('ReadmeUrl') ? json['ReadmeUrl'] as String : null,
        spdxLicenseId: json.containsKey('SpdxLicenseId')
            ? json['SpdxLicenseId'] as String
            : null,
        version: json.containsKey('Version')
            ? Version.fromJson(json['Version'])
            : null,
      );
}

class CreateApplicationVersionResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// An array of parameter types supported by the application.
  final List<ParameterDefinition> parameterDefinitions;

  /// A list of values that you must specify before you can deploy certain
  /// applications. Some applications might include resources that can affect
  /// permissions in your AWS account, for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those applications, you must
  /// explicitly acknowledge their capabilities by specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html),
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html),
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// and
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html).
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM or CAPABILITY_NAMED_IAM. If the application contains IAM
  /// resources with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// [AWS::Lambda::Permission](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html),
  /// [AWS::IAM:Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// [AWS::ApplicationAutoScaling::ScalingPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html),
  /// [AWS::S3::BucketPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html),
  /// [AWS::SQS::QueuePolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html),
  /// and
  /// [AWS::SNS::TopicPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html).
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review all permissions associated with the application
  /// before deploying. If you don't specify this parameter for an application
  /// that requires capabilities, the call will fail.
  final List<String> requiredCapabilities;

  /// Whether all of the AWS resources contained in this application are
  /// supported in the region in which it is being retrieved.
  final bool resourcesSupported;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// A link to the S3 object that contains the ZIP archive of the source code
  /// for this version of your application.
  ///
  /// Maximum size 50 MB
  final String sourceCodeArchiveUrl;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String sourceCodeUrl;

  /// A link to the packaged AWS SAM template of your application.
  final String templateUrl;

  CreateApplicationVersionResponse({
    this.applicationId,
    this.creationTime,
    this.parameterDefinitions,
    this.requiredCapabilities,
    this.resourcesSupported,
    this.semanticVersion,
    this.sourceCodeArchiveUrl,
    this.sourceCodeUrl,
    this.templateUrl,
  });
  static CreateApplicationVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateApplicationVersionResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        parameterDefinitions: json.containsKey('ParameterDefinitions')
            ? (json['ParameterDefinitions'] as List)
                .map((e) => ParameterDefinition.fromJson(e))
                .toList()
            : null,
        requiredCapabilities: json.containsKey('RequiredCapabilities')
            ? (json['RequiredCapabilities'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        resourcesSupported: json.containsKey('ResourcesSupported')
            ? json['ResourcesSupported'] as bool
            : null,
        semanticVersion: json.containsKey('SemanticVersion')
            ? json['SemanticVersion'] as String
            : null,
        sourceCodeArchiveUrl: json.containsKey('SourceCodeArchiveUrl')
            ? json['SourceCodeArchiveUrl'] as String
            : null,
        sourceCodeUrl: json.containsKey('SourceCodeUrl')
            ? json['SourceCodeUrl'] as String
            : null,
        templateUrl: json.containsKey('TemplateUrl')
            ? json['TemplateUrl'] as String
            : null,
      );
}

class CreateCloudFormationChangeSetResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the change set.
  ///
  /// Length constraints: Minimum length of 1.
  ///
  /// Pattern: ARN:[-a-zA-Z0-9:/]*
  final String changeSetId;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// The unique ID of the stack.
  final String stackId;

  CreateCloudFormationChangeSetResponse({
    this.applicationId,
    this.changeSetId,
    this.semanticVersion,
    this.stackId,
  });
  static CreateCloudFormationChangeSetResponse fromJson(
          Map<String, dynamic> json) =>
      CreateCloudFormationChangeSetResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        changeSetId: json.containsKey('ChangeSetId')
            ? json['ChangeSetId'] as String
            : null,
        semanticVersion: json.containsKey('SemanticVersion')
            ? json['SemanticVersion'] as String
            : null,
        stackId: json.containsKey('StackId') ? json['StackId'] as String : null,
      );
}

class CreateCloudFormationTemplateResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// The date and time this template expires. Templates expire 1 hour after
  /// creation.
  final String expirationTime;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// Status of the template creation workflow.
  ///
  /// Possible values: PREPARING | ACTIVE | EXPIRED
  final String status;

  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}
  final String templateId;

  /// A link to the template that can be used to deploy the application using
  /// AWS CloudFormation.
  final String templateUrl;

  CreateCloudFormationTemplateResponse({
    this.applicationId,
    this.creationTime,
    this.expirationTime,
    this.semanticVersion,
    this.status,
    this.templateId,
    this.templateUrl,
  });
  static CreateCloudFormationTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      CreateCloudFormationTemplateResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        expirationTime: json.containsKey('ExpirationTime')
            ? json['ExpirationTime'] as String
            : null,
        semanticVersion: json.containsKey('SemanticVersion')
            ? json['SemanticVersion'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        templateId: json.containsKey('TemplateId')
            ? json['TemplateId'] as String
            : null,
        templateUrl: json.containsKey('TemplateUrl')
            ? json['TemplateUrl'] as String
            : null,
      );
}

class GetApplicationPolicyResponse {
  /// An array of policy statements applied to the application.
  final List<ApplicationPolicyStatement> statements;

  GetApplicationPolicyResponse({
    this.statements,
  });
  static GetApplicationPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetApplicationPolicyResponse(
        statements: json.containsKey('Statements')
            ? (json['Statements'] as List)
                .map((e) => ApplicationPolicyStatement.fromJson(e))
                .toList()
            : null,
      );
}

class GetApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String author;

  /// The date and time this resource was created.
  final String creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String description;

  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  final String homePageUrl;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  final List<String> labels;

  /// A link to a license file of the app that matches the spdxLicenseID value
  /// of your application.
  ///
  /// Maximum size 5 MB
  final String licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9-]+";
  final String name;

  /// A link to the readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String spdxLicenseId;

  /// Version information about the application.
  final Version version;

  GetApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.version,
  });
  static GetApplicationResponse fromJson(Map<String, dynamic> json) =>
      GetApplicationResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        author: json.containsKey('Author') ? json['Author'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        homePageUrl: json.containsKey('HomePageUrl')
            ? json['HomePageUrl'] as String
            : null,
        labels: json.containsKey('Labels')
            ? (json['Labels'] as List).map((e) => e as String).toList()
            : null,
        licenseUrl: json.containsKey('LicenseUrl')
            ? json['LicenseUrl'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        readmeUrl:
            json.containsKey('ReadmeUrl') ? json['ReadmeUrl'] as String : null,
        spdxLicenseId: json.containsKey('SpdxLicenseId')
            ? json['SpdxLicenseId'] as String
            : null,
        version: json.containsKey('Version')
            ? Version.fromJson(json['Version'])
            : null,
      );
}

class GetCloudFormationTemplateResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// The date and time this template expires. Templates expire 1 hour after
  /// creation.
  final String expirationTime;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// Status of the template creation workflow.
  ///
  /// Possible values: PREPARING | ACTIVE | EXPIRED
  final String status;

  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}
  final String templateId;

  /// A link to the template that can be used to deploy the application using
  /// AWS CloudFormation.
  final String templateUrl;

  GetCloudFormationTemplateResponse({
    this.applicationId,
    this.creationTime,
    this.expirationTime,
    this.semanticVersion,
    this.status,
    this.templateId,
    this.templateUrl,
  });
  static GetCloudFormationTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      GetCloudFormationTemplateResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        expirationTime: json.containsKey('ExpirationTime')
            ? json['ExpirationTime'] as String
            : null,
        semanticVersion: json.containsKey('SemanticVersion')
            ? json['SemanticVersion'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        templateId: json.containsKey('TemplateId')
            ? json['TemplateId'] as String
            : null,
        templateUrl: json.containsKey('TemplateUrl')
            ? json['TemplateUrl'] as String
            : null,
      );
}

class ListApplicationDependenciesResponse {
  /// An array of application summaries nested in the application.
  final List<ApplicationDependencySummary> dependencies;

  /// The token to request the next page of results.
  final String nextToken;

  ListApplicationDependenciesResponse({
    this.dependencies,
    this.nextToken,
  });
  static ListApplicationDependenciesResponse fromJson(
          Map<String, dynamic> json) =>
      ListApplicationDependenciesResponse(
        dependencies: json.containsKey('Dependencies')
            ? (json['Dependencies'] as List)
                .map((e) => ApplicationDependencySummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListApplicationVersionsResponse {
  /// The token to request the next page of results.
  final String nextToken;

  /// An array of version summaries for the application.
  final List<VersionSummary> versions;

  ListApplicationVersionsResponse({
    this.nextToken,
    this.versions,
  });
  static ListApplicationVersionsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationVersionsResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        versions: json.containsKey('Versions')
            ? (json['Versions'] as List)
                .map((e) => VersionSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListApplicationsResponse {
  /// An array of application summaries.
  final List<ApplicationSummary> applications;

  /// The token to request the next page of results.
  final String nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });
  static ListApplicationsResponse fromJson(Map<String, dynamic> json) =>
      ListApplicationsResponse(
        applications: json.containsKey('Applications')
            ? (json['Applications'] as List)
                .map((e) => ApplicationSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Parameters supported by the application.
class ParameterDefinition {
  /// A regular expression that represents the patterns to allow for String
  /// types.
  final String allowedPattern;

  /// An array containing the list of values allowed for the parameter.
  final List<String> allowedValues;

  /// A string that explains a constraint when the constraint is violated. For
  /// example, without a constraint description, a parameter that has an allowed
  /// pattern of [A-Za-z0-9]+ displays the following error message when the user
  /// specifies an invalid value:
  ///
  ///  Malformed input-Parameter MyParameter must match pattern [A-Za-z0-9]+
  ///
  /// By adding a constraint description, such as "must contain only uppercase
  /// and lowercase letters and numbers," you can display the following
  /// customized error message:
  ///
  ///  Malformed input-Parameter MyParameter must contain only uppercase and
  /// lowercase letters and numbers.
  final String constraintDescription;

  /// A value of the appropriate type for the template to use if no value is
  /// specified when a stack is created. If you define constraints for the
  /// parameter, you must specify a value that adheres to those constraints.
  final String defaultValue;

  /// A string of up to 4,000 characters that describes the parameter.
  final String description;

  /// An integer value that determines the largest number of characters that you
  /// want to allow for String types.
  final int maxLength;

  /// A numeric value that determines the largest numeric value that you want to
  /// allow for Number types.
  final int maxValue;

  /// An integer value that determines the smallest number of characters that
  /// you want to allow for String types.
  final int minLength;

  /// A numeric value that determines the smallest numeric value that you want
  /// to allow for Number types.
  final int minValue;

  /// The name of the parameter.
  final String name;

  /// Whether to mask the parameter value whenever anyone makes a call that
  /// describes the stack. If you set the value to true, the parameter value is
  /// masked with asterisks (*****).
  final bool noEcho;

  /// A list of AWS SAM resources that use this parameter.
  final List<String> referencedByResources;

  /// The type of the parameter.
  ///
  /// Valid values: String | Number | List<Number> | CommaDelimitedList
  ///
  ///  String: A literal string.
  ///
  /// For example, users can specify "MyUserName".
  ///
  ///  Number: An integer or float. AWS CloudFormation validates the parameter
  /// value as a number. However, when you use the parameter elsewhere in your
  /// template (for example, by using the Ref intrinsic function), the parameter
  /// value becomes a string.
  ///
  /// For example, users might specify "8888".
  ///
  ///  List<Number>: An array of integers or floats that are separated by
  /// commas. AWS CloudFormation validates the parameter value as numbers.
  /// However, when you use the parameter elsewhere in your template (for
  /// example, by using the Ref intrinsic function), the parameter value becomes
  /// a list of strings.
  ///
  /// For example, users might specify "80,20", and then Ref results in
  /// ["80","20"].
  ///
  ///  CommaDelimitedList: An array of literal strings that are separated by
  /// commas. The total number of strings should be one more than the total
  /// number of commas. Also, each member string is space-trimmed.
  ///
  /// For example, users might specify "test,dev,prod", and then Ref results in
  /// ["test","dev","prod"].
  final String type;

  ParameterDefinition({
    this.allowedPattern,
    this.allowedValues,
    this.constraintDescription,
    this.defaultValue,
    this.description,
    this.maxLength,
    this.maxValue,
    this.minLength,
    this.minValue,
    @required this.name,
    this.noEcho,
    @required this.referencedByResources,
    this.type,
  });
  static ParameterDefinition fromJson(Map<String, dynamic> json) =>
      ParameterDefinition(
        allowedPattern: json.containsKey('AllowedPattern')
            ? json['AllowedPattern'] as String
            : null,
        allowedValues: json.containsKey('AllowedValues')
            ? (json['AllowedValues'] as List).map((e) => e as String).toList()
            : null,
        constraintDescription: json.containsKey('ConstraintDescription')
            ? json['ConstraintDescription'] as String
            : null,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        maxLength:
            json.containsKey('MaxLength') ? json['MaxLength'] as int : null,
        maxValue: json.containsKey('MaxValue') ? json['MaxValue'] as int : null,
        minLength:
            json.containsKey('MinLength') ? json['MinLength'] as int : null,
        minValue: json.containsKey('MinValue') ? json['MinValue'] as int : null,
        name: json['Name'] as String,
        noEcho: json.containsKey('NoEcho') ? json['NoEcho'] as bool : null,
        referencedByResources: (json['ReferencedByResources'] as List)
            .map((e) => e as String)
            .toList(),
        type: json.containsKey('Type') ? json['Type'] as String : null,
      );
}

/// Parameter value of the application.
class ParameterValue {
  /// The key associated with the parameter. If you don't specify a key and
  /// value for a particular parameter, AWS CloudFormation uses the default
  /// value that is specified in your template.
  final String name;

  /// The input value associated with the parameter.
  final String value;

  ParameterValue({
    @required this.name,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutApplicationPolicyResponse {
  /// An array of policy statements applied to the application.
  final List<ApplicationPolicyStatement> statements;

  PutApplicationPolicyResponse({
    this.statements,
  });
  static PutApplicationPolicyResponse fromJson(Map<String, dynamic> json) =>
      PutApplicationPolicyResponse(
        statements: json.containsKey('Statements')
            ? (json['Statements'] as List)
                .map((e) => ApplicationPolicyStatement.fromJson(e))
                .toList()
            : null,
      );
}

/// This property corresponds to the _AWS CloudFormation
/// [RollbackConfiguration](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration)_
///  Data Type.
class RollbackConfiguration {
  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [RollbackConfiguration](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration)_
  ///  Data Type.
  final int monitoringTimeInMinutes;

  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [RollbackConfiguration](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration)_
  ///  Data Type.
  final List<RollbackTrigger> rollbackTriggers;

  RollbackConfiguration({
    this.monitoringTimeInMinutes,
    this.rollbackTriggers,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// This property corresponds to the _AWS CloudFormation
/// [RollbackTrigger](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger)_
///  Data Type.
class RollbackTrigger {
  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [RollbackTrigger](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger)_
  ///  Data Type.
  final String arn;

  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [RollbackTrigger](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger)_
  ///  Data Type.
  final String type;

  RollbackTrigger({
    @required this.arn,
    @required this.type,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// This property corresponds to the _AWS CloudFormation
/// [Tag](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag)_
///  Data Type.
class Tag {
  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [Tag](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag)_
  ///  Data Type.
  final String key;

  /// This property corresponds to the content of the same name for the _AWS
  /// CloudFormation
  /// [Tag](https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag)_
  ///  Data Type.
  final String value;

  Tag({
    @required this.key,
    @required this.value,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String author;

  /// The date and time this resource was created.
  final String creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String description;

  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  final String homePageUrl;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+-_:/@]+$";
  final List<String> labels;

  /// A link to a license file of the app that matches the spdxLicenseID value
  /// of your application.
  ///
  /// Maximum size 5 MB
  final String licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9-]+";
  final String name;

  /// A link to the readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String spdxLicenseId;

  /// Version information about the application.
  final Version version;

  UpdateApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.version,
  });
  static UpdateApplicationResponse fromJson(Map<String, dynamic> json) =>
      UpdateApplicationResponse(
        applicationId: json.containsKey('ApplicationId')
            ? json['ApplicationId'] as String
            : null,
        author: json.containsKey('Author') ? json['Author'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? json['CreationTime'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        homePageUrl: json.containsKey('HomePageUrl')
            ? json['HomePageUrl'] as String
            : null,
        labels: json.containsKey('Labels')
            ? (json['Labels'] as List).map((e) => e as String).toList()
            : null,
        licenseUrl: json.containsKey('LicenseUrl')
            ? json['LicenseUrl'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        readmeUrl:
            json.containsKey('ReadmeUrl') ? json['ReadmeUrl'] as String : null,
        spdxLicenseId: json.containsKey('SpdxLicenseId')
            ? json['SpdxLicenseId'] as String
            : null,
        version: json.containsKey('Version')
            ? Version.fromJson(json['Version'])
            : null,
      );
}

/// Application version details.
class Version {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// An array of parameter types supported by the application.
  final List<ParameterDefinition> parameterDefinitions;

  /// A list of values that you must specify before you can deploy certain
  /// applications. Some applications might include resources that can affect
  /// permissions in your AWS account, for example, by creating new AWS Identity
  /// and Access Management (IAM) users. For those applications, you must
  /// explicitly acknowledge their capabilities by specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// [AWS::IAM::Group](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html),
  /// [AWS::IAM::InstanceProfile](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html),
  /// [AWS::IAM::Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// and
  /// [AWS::IAM::Role](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html).
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM or CAPABILITY_NAMED_IAM. If the application contains IAM
  /// resources with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// [AWS::Lambda::Permission](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html),
  /// [AWS::IAM:Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html),
  /// [AWS::ApplicationAutoScaling::ScalingPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html),
  /// [AWS::S3::BucketPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html),
  /// [AWS::SQS::QueuePolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html),
  /// and
  /// [AWS::SNS::TopicPolicy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html).
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review all permissions associated with the application
  /// before deploying. If you don't specify this parameter for an application
  /// that requires capabilities, the call will fail.
  final List<String> requiredCapabilities;

  /// Whether all of the AWS resources contained in this application are
  /// supported in the region in which it is being retrieved.
  final bool resourcesSupported;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// A link to the S3 object that contains the ZIP archive of the source code
  /// for this version of your application.
  ///
  /// Maximum size 50 MB
  final String sourceCodeArchiveUrl;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String sourceCodeUrl;

  /// A link to the packaged AWS SAM template of your application.
  final String templateUrl;

  Version({
    @required this.applicationId,
    @required this.creationTime,
    @required this.parameterDefinitions,
    @required this.requiredCapabilities,
    @required this.resourcesSupported,
    @required this.semanticVersion,
    this.sourceCodeArchiveUrl,
    this.sourceCodeUrl,
    @required this.templateUrl,
  });
  static Version fromJson(Map<String, dynamic> json) => Version(
        applicationId: json['ApplicationId'] as String,
        creationTime: json['CreationTime'] as String,
        parameterDefinitions: (json['ParameterDefinitions'] as List)
            .map((e) => ParameterDefinition.fromJson(e))
            .toList(),
        requiredCapabilities: (json['RequiredCapabilities'] as List)
            .map((e) => e as String)
            .toList(),
        resourcesSupported: json['ResourcesSupported'] as bool,
        semanticVersion: json['SemanticVersion'] as String,
        sourceCodeArchiveUrl: json.containsKey('SourceCodeArchiveUrl')
            ? json['SourceCodeArchiveUrl'] as String
            : null,
        sourceCodeUrl: json.containsKey('SourceCodeUrl')
            ? json['SourceCodeUrl'] as String
            : null,
        templateUrl: json['TemplateUrl'] as String,
      );
}

/// An application version summary.
class VersionSummary {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// The semantic version of the application:
  ///
  ///  [https://semver.org/](https://semver.org/)
  final String semanticVersion;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String sourceCodeUrl;

  VersionSummary({
    @required this.applicationId,
    @required this.creationTime,
    @required this.semanticVersion,
    this.sourceCodeUrl,
  });
  static VersionSummary fromJson(Map<String, dynamic> json) => VersionSummary(
        applicationId: json['ApplicationId'] as String,
        creationTime: json['CreationTime'] as String,
        semanticVersion: json['SemanticVersion'] as String,
        sourceCodeUrl: json.containsKey('SourceCodeUrl')
            ? json['SourceCodeUrl'] as String
            : null,
      );
}
