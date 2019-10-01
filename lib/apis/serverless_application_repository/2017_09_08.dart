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
  /// Creates an application, optionally including an AWS SAM file to create the
  /// first application version in the same call.
  Future<void> createApplication(
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
      String templateUrl}) async {}

  /// Creates an application version.
  Future<void> createApplicationVersion(
      {@required String applicationId,
      @required String semanticVersion,
      String sourceCodeArchiveUrl,
      String sourceCodeUrl,
      String templateBody,
      String templateUrl}) async {}

  /// Creates an AWS CloudFormation change set for the given application.
  Future<void> createCloudFormationChangeSet(
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
      String templateId}) async {}

  /// Creates an AWS CloudFormation template.
  Future<void> createCloudFormationTemplate(String applicationId,
      {String semanticVersion}) async {}

  /// Deletes the specified application.
  Future<void> deleteApplication(String applicationId) async {}

  /// Gets the specified application.
  Future<void> getApplication(String applicationId,
      {String semanticVersion}) async {}

  /// Retrieves the policy for the application.
  Future<void> getApplicationPolicy(String applicationId) async {}

  /// Gets the specified AWS CloudFormation template.
  Future<void> getCloudFormationTemplate(
      {@required String applicationId, @required String templateId}) async {}

  /// Retrieves the list of applications nested in the containing application.
  Future<void> listApplicationDependencies(String applicationId,
      {int maxItems, String nextToken, String semanticVersion}) async {}

  /// Lists versions for the specified application.
  Future<void> listApplicationVersions(String applicationId,
      {int maxItems, String nextToken}) async {}

  /// Lists applications owned by the requester.
  Future<void> listApplications({int maxItems, String nextToken}) async {}

  /// Sets the permission policy for an application. For the list of actions
  /// supported for this operation, see [Application
  /// Permissions](https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions)
  /// .
  Future<void> putApplicationPolicy(
      {@required String applicationId,
      @required List<ApplicationPolicyStatement> statements}) async {}

  /// Updates the specified application.
  Future<void> updateApplication(String applicationId,
      {String author,
      String description,
      String homePageUrl,
      List<String> labels,
      String readmeBody,
      String readmeUrl}) async {}
}

class ApplicationDependencySummary {}

class ApplicationPolicyStatement {}

class ApplicationSummary {}

class CreateApplicationResponse {}

class CreateApplicationVersionResponse {}

class CreateCloudFormationChangeSetResponse {}

class CreateCloudFormationTemplateResponse {}

class GetApplicationPolicyResponse {}

class GetApplicationResponse {}

class GetCloudFormationTemplateResponse {}

class ListApplicationDependenciesResponse {}

class ListApplicationVersionsResponse {}

class ListApplicationsResponse {}

class ParameterDefinition {}

class ParameterValue {}

class PutApplicationPolicyResponse {}

class RollbackConfiguration {}

class RollbackTrigger {}

class Tag {}

class UpdateApplicationResponse {}

class Version {}

class VersionSummary {}
