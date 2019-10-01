import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Support
///
/// The AWS Support API reference is intended for programmers who need detailed
/// information about the AWS Support operations and data types. This service
/// enables you to manage your AWS Support cases programmatically. It uses HTTP
/// methods that return results in JSON format.
///
/// The AWS Support service also exposes a set of
/// [Trusted Advisor](http://aws.amazon.com/premiumsupport/trustedadvisor/)
/// features. You can retrieve a list of checks and their descriptions, get
/// check results, specify checks to refresh, and get the refresh status of
/// checks.
///
/// The following list describes the AWS Support case management operations:
///
/// *    **Service names, issue categories, and available severity levels.** The
/// DescribeServices and DescribeSeverityLevels operations return AWS service
/// names, service codes, service categories, and problem severity levels. You
/// use these values when you call the CreateCase operation.
///
/// *    **Case creation, case details, and case resolution.** The CreateCase,
/// DescribeCases, DescribeAttachment, and ResolveCase operations create AWS
/// Support cases, retrieve information about cases, and resolve cases.
///
/// *    **Case communication.** The DescribeCommunications,
/// AddCommunicationToCase, and AddAttachmentsToSet operations retrieve and add
/// communications and attachments to AWS Support cases.
///
///
/// The following list describes the operations available from the AWS Support
/// service for Trusted Advisor:
///
/// *    DescribeTrustedAdvisorChecks returns the list of checks that run
/// against your AWS resources.
///
/// *   Using the `checkId` for a specific check returned by
/// DescribeTrustedAdvisorChecks, you can call DescribeTrustedAdvisorCheckResult
/// to obtain the results for the check you specified.
///
/// *    DescribeTrustedAdvisorCheckSummaries returns summarized results for one
/// or more Trusted Advisor checks.
///
/// *    RefreshTrustedAdvisorCheck requests that Trusted Advisor rerun a
/// specified check.
///
/// *    DescribeTrustedAdvisorCheckRefreshStatuses reports the refresh status
/// of one or more checks.
///
///
/// For authentication of requests, AWS Support uses
/// [Signature Version 4 Signing Process](http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
///
/// See
/// [About the AWS Support API](http://docs.aws.amazon.com/awssupport/latest/user/Welcome.html)
/// in the _AWS Support User Guide_ for information about how to use this
/// service to create and manage your support cases, and how to call Trusted
/// Advisor for results of checks on your resources.
class SupportApi {
  /// Adds one or more attachments to an attachment set. If an `attachmentSetId`
  /// is not specified, a new attachment set is created, and the ID of the set
  /// is returned in the response. If an `attachmentSetId` is specified, the
  /// attachments are added to the specified set, if it exists.
  ///
  /// An attachment set is a temporary container for attachments that are to be
  /// added to a case or case communication. The set is available for one hour
  /// after it is created; the `expiryTime` returned in the response indicates
  /// when the set expires. The maximum number of attachments in a set is 3, and
  /// the maximum size of any attachment in the set is 5 MB.
  ///
  /// [attachmentSetId]: The ID of the attachment set. If an `attachmentSetId`
  /// is not specified, a new attachment set is created, and the ID of the set
  /// is returned in the response. If an `attachmentSetId` is specified, the
  /// attachments are added to the specified set, if it exists.
  ///
  /// [attachments]: One or more attachments to add to the set. The limit is 3
  /// attachments per set, and the size limit is 5 MB per attachment.
  Future<AddAttachmentsToSetResponse> addAttachmentsToSet(
      List<Attachment> attachments,
      {String attachmentSetId}) async {
    return AddAttachmentsToSetResponse.fromJson({});
  }

  /// Adds additional customer communication to an AWS Support case. You use the
  /// `caseId` value to identify the case to add communication to. You can list
  /// a set of email addresses to copy on the communication using the
  /// `ccEmailAddresses` value. The `communicationBody` value contains the text
  /// of the communication.
  ///
  /// The response indicates the success or failure of the request.
  ///
  /// This operation implements a subset of the features of the AWS Support
  /// Center.
  ///
  /// [caseId]: The AWS Support case ID requested or returned in the call. The
  /// case ID is an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  ///
  /// [communicationBody]: The body of an email communication to add to the
  /// support case.
  ///
  /// [ccEmailAddresses]: The email addresses in the CC line of an email to be
  /// added to the support case.
  ///
  /// [attachmentSetId]: The ID of a set of one or more attachments for the
  /// communication to add to the case. Create the set by calling
  /// AddAttachmentsToSet
  Future<AddCommunicationToCaseResponse> addCommunicationToCase(
      String communicationBody,
      {String caseId,
      List<String> ccEmailAddresses,
      String attachmentSetId}) async {
    return AddCommunicationToCaseResponse.fromJson({});
  }

  /// Creates a new case in the AWS Support Center. This operation is modeled on
  /// the behavior of the AWS Support Center
  /// [Create Case](https://console.aws.amazon.com/support/home#/case/create)
  /// page. Its parameters require you to specify the following information:
  ///
  /// *    **issueType.** The type of issue for the case. You can specify either
  /// "customer-service" or "technical." If you do not indicate a value, the
  /// default is "technical."
  ///
  /// *    **serviceCode.** The code for an AWS service. You obtain the
  /// `serviceCode` by calling DescribeServices.
  ///
  /// *    **categoryCode.** The category for the service defined for the
  /// `serviceCode` value. You also obtain the category code for a service by
  /// calling DescribeServices. Each AWS service defines its own set of category
  /// codes.
  ///
  /// *    **severityCode.** A value that indicates the urgency of the case,
  /// which in turn determines the response time according to your service level
  /// agreement with AWS Support. You obtain the SeverityCode by calling
  /// DescribeSeverityLevels.
  ///
  /// *    **subject.** The **Subject** field on the AWS Support Center
  /// [Create Case](https://console.aws.amazon.com/support/home#/case/create)
  /// page.
  ///
  /// *    **communicationBody.** The **Description** field on the AWS Support
  /// Center
  /// [Create Case](https://console.aws.amazon.com/support/home#/case/create)
  /// page.
  ///
  /// *    **attachmentSetId.** The ID of a set of attachments that has been
  /// created by using AddAttachmentsToSet.
  ///
  /// *    **language.** The human language in which AWS Support handles the
  /// case. English and Japanese are currently supported.
  ///
  /// *    **ccEmailAddresses.** The AWS Support Center **CC** field on the
  /// [Create Case](https://console.aws.amazon.com/support/home#/case/create)
  /// page. You can list email addresses to be copied on any correspondence
  /// about the case. The account that opens the case is already identified by
  /// passing the AWS Credentials in the HTTP POST method or in a method or
  /// function call from one of the programming languages supported by an
  /// [AWS SDK](http://aws.amazon.com/tools/).
  ///
  ///
  ///  To add additional communication or attachments to an existing case, use
  /// AddCommunicationToCase.
  ///
  /// A successful CreateCase request returns an AWS Support case number. Case
  /// numbers are used by the DescribeCases operation to retrieve existing AWS
  /// Support cases.
  ///
  /// [subject]: The title of the AWS Support case.
  ///
  /// [serviceCode]: The code for the AWS service returned by the call to
  /// DescribeServices.
  ///
  /// [severityCode]: The code for the severity level returned by the call to
  /// DescribeSeverityLevels.
  ///
  ///
  ///
  /// The availability of severity levels depends on each customer's support
  /// subscription. In other words, your subscription may not necessarily
  /// require the urgent level of response time.
  ///
  /// [categoryCode]: The category of problem for the AWS Support case.
  ///
  /// [communicationBody]: The communication body text when you create an AWS
  /// Support case by calling CreateCase.
  ///
  /// [ccEmailAddresses]: A list of email addresses that AWS Support copies on
  /// case correspondence.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  ///
  /// [issueType]: The type of issue for the case. You can specify either
  /// "customer-service" or "technical." If you do not indicate a value, the
  /// default is "technical."
  ///
  /// [attachmentSetId]: The ID of a set of one or more attachments for the
  /// case. Create the set by using AddAttachmentsToSet.
  Future<CreateCaseResponse> createCase(
      {@required String subject,
      String serviceCode,
      String severityCode,
      String categoryCode,
      @required String communicationBody,
      List<String> ccEmailAddresses,
      String language,
      String issueType,
      String attachmentSetId}) async {
    return CreateCaseResponse.fromJson({});
  }

  /// Returns the attachment that has the specified ID. Attachment IDs are
  /// generated by the case management system when you add an attachment to a
  /// case or case communication. Attachment IDs are returned in the
  /// AttachmentDetails objects that are returned by the DescribeCommunications
  /// operation.
  ///
  /// [attachmentId]: The ID of the attachment to return. Attachment IDs are
  /// returned by the DescribeCommunications operation.
  Future<DescribeAttachmentResponse> describeAttachment(
      String attachmentId) async {
    return DescribeAttachmentResponse.fromJson({});
  }

  /// Returns a list of cases that you specify by passing one or more case IDs.
  /// In addition, you can filter the cases by date by setting values for the
  /// `afterTime` and `beforeTime` request parameters. You can set values for
  /// the `includeResolvedCases` and `includeCommunications` request parameters
  /// to control how much information is returned.
  ///
  /// Case data is available for 12 months after creation. If a case was created
  /// more than 12 months ago, a request for data might cause an error.
  ///
  /// The response returns the following in JSON format:
  ///
  /// *   One or more CaseDetails data types.
  ///
  /// *   One or more `nextToken` values, which specify where to paginate the
  /// returned records represented by the `CaseDetails` objects.
  ///
  /// [caseIdList]: A list of ID numbers of the support cases you want returned.
  /// The maximum number of cases is 100.
  ///
  /// [displayId]: The ID displayed for a case in the AWS Support Center user
  /// interface.
  ///
  /// [afterTime]: The start date for a filtered date search on support case
  /// communications. Case communications are available for 12 months after
  /// creation.
  ///
  /// [beforeTime]: The end date for a filtered date search on support case
  /// communications. Case communications are available for 12 months after
  /// creation.
  ///
  /// [includeResolvedCases]: Specifies whether resolved support cases should be
  /// included in the DescribeCases results. The default is _false_.
  ///
  /// [nextToken]: A resumption point for pagination.
  ///
  /// [maxResults]: The maximum number of results to return before paginating.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  ///
  /// [includeCommunications]: Specifies whether communications should be
  /// included in the DescribeCases results. The default is _true_.
  Future<DescribeCasesResponse> describeCases(
      {List<String> caseIdList,
      String displayId,
      String afterTime,
      String beforeTime,
      bool includeResolvedCases,
      String nextToken,
      int maxResults,
      String language,
      bool includeCommunications}) async {
    return DescribeCasesResponse.fromJson({});
  }

  /// Returns communications (and attachments) for one or more support cases.
  /// You can use the `afterTime` and `beforeTime` parameters to filter by date.
  /// You can use the `caseId` parameter to restrict the results to a particular
  /// case.
  ///
  /// Case data is available for 12 months after creation. If a case was created
  /// more than 12 months ago, a request for data might cause an error.
  ///
  /// You can use the `maxResults` and `nextToken` parameters to control the
  /// pagination of the result set. Set `maxResults` to the number of cases you
  /// want displayed on each page, and use `nextToken` to specify the resumption
  /// of pagination.
  ///
  /// [caseId]: The AWS Support case ID requested or returned in the call. The
  /// case ID is an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  ///
  /// [beforeTime]: The end date for a filtered date search on support case
  /// communications. Case communications are available for 12 months after
  /// creation.
  ///
  /// [afterTime]: The start date for a filtered date search on support case
  /// communications. Case communications are available for 12 months after
  /// creation.
  ///
  /// [nextToken]: A resumption point for pagination.
  ///
  /// [maxResults]: The maximum number of results to return before paginating.
  Future<DescribeCommunicationsResponse> describeCommunications(String caseId,
      {String beforeTime,
      String afterTime,
      String nextToken,
      int maxResults}) async {
    return DescribeCommunicationsResponse.fromJson({});
  }

  /// Returns the current list of AWS services and a list of service categories
  /// that applies to each one. You then use service names and categories in
  /// your CreateCase requests. Each AWS service has its own set of categories.
  ///
  /// The service codes and category codes correspond to the values that are
  /// displayed in the **Service** and **Category** drop-down lists on the AWS
  /// Support Center
  /// [Create Case](https://console.aws.amazon.com/support/home#/case/create)
  /// page. The values in those fields, however, do not necessarily match the
  /// service codes and categories returned by the `DescribeServices` request.
  /// Always use the service codes and categories obtained programmatically.
  /// This practice ensures that you always have the most recent set of service
  /// and category codes.
  ///
  /// [serviceCodeList]: A JSON-formatted list of service codes available for
  /// AWS services.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  Future<DescribeServicesResponse> describeServices(
      {List<String> serviceCodeList, String language}) async {
    return DescribeServicesResponse.fromJson({});
  }

  /// Returns the list of severity levels that you can assign to an AWS Support
  /// case. The severity level for a case is also a field in the CaseDetails
  /// data type included in any CreateCase request.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  Future<DescribeSeverityLevelsResponse> describeSeverityLevels(
      {String language}) async {
    return DescribeSeverityLevelsResponse.fromJson({});
  }

  /// Returns the refresh status of the Trusted Advisor checks that have the
  /// specified check IDs. Check IDs can be obtained by calling
  /// DescribeTrustedAdvisorChecks.
  ///
  ///
  ///
  /// Some checks are refreshed automatically, and their refresh statuses cannot
  /// be retrieved by using this operation. Use of the
  /// `DescribeTrustedAdvisorCheckRefreshStatuses` operation for these checks
  /// causes an `InvalidParameterValue` error.
  ///
  /// [checkIds]: The IDs of the Trusted Advisor checks to get the status of.
  /// **Note:** Specifying the check ID of a check that is automatically
  /// refreshed causes an `InvalidParameterValue` error.
  Future<DescribeTrustedAdvisorCheckRefreshStatusesResponse>
      describeTrustedAdvisorCheckRefreshStatuses(List<String> checkIds) async {
    return DescribeTrustedAdvisorCheckRefreshStatusesResponse.fromJson({});
  }

  /// Returns the results of the Trusted Advisor check that has the specified
  /// check ID. Check IDs can be obtained by calling
  /// DescribeTrustedAdvisorChecks.
  ///
  /// The response contains a TrustedAdvisorCheckResult object, which contains
  /// these three objects:
  ///
  /// *    TrustedAdvisorCategorySpecificSummary
  ///
  /// *    TrustedAdvisorResourceDetail
  ///
  /// *    TrustedAdvisorResourcesSummary
  ///
  ///
  /// In addition, the response contains these fields:
  ///
  /// *    **status.** The alert status of the check: "ok" (green), "warning"
  /// (yellow), "error" (red), or "not_available".
  ///
  /// *    **timestamp.** The time of the last refresh of the check.
  ///
  /// *    **checkId.** The unique identifier for the check.
  ///
  /// [checkId]: The unique identifier for the Trusted Advisor check.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  Future<DescribeTrustedAdvisorCheckResultResponse>
      describeTrustedAdvisorCheckResult(String checkId,
          {String language}) async {
    return DescribeTrustedAdvisorCheckResultResponse.fromJson({});
  }

  /// Returns the summaries of the results of the Trusted Advisor checks that
  /// have the specified check IDs. Check IDs can be obtained by calling
  /// DescribeTrustedAdvisorChecks.
  ///
  /// The response contains an array of TrustedAdvisorCheckSummary objects.
  ///
  /// [checkIds]: The IDs of the Trusted Advisor checks.
  Future<DescribeTrustedAdvisorCheckSummariesResponse>
      describeTrustedAdvisorCheckSummaries(List<String> checkIds) async {
    return DescribeTrustedAdvisorCheckSummariesResponse.fromJson({});
  }

  /// Returns information about all available Trusted Advisor checks, including
  /// name, ID, category, description, and metadata. You must specify a language
  /// code; English ("en") and Japanese ("ja") are currently supported. The
  /// response contains a TrustedAdvisorCheckDescription for each check.
  ///
  /// [language]: The ISO 639-1 code for the language in which AWS provides
  /// support. AWS Support currently supports English ("en") and Japanese
  /// ("ja"). Language parameters must be passed explicitly for operations that
  /// take them.
  Future<DescribeTrustedAdvisorChecksResponse> describeTrustedAdvisorChecks(
      String language) async {
    return DescribeTrustedAdvisorChecksResponse.fromJson({});
  }

  /// Requests a refresh of the Trusted Advisor check that has the specified
  /// check ID. Check IDs can be obtained by calling
  /// DescribeTrustedAdvisorChecks.
  ///
  ///  Some checks are refreshed automatically, and they cannot be refreshed by
  /// using this operation. Use of the `RefreshTrustedAdvisorCheck` operation
  /// for these checks causes an `InvalidParameterValue` error.
  ///
  /// The response contains a TrustedAdvisorCheckRefreshStatus object, which
  /// contains these fields:
  ///
  /// *    **status.** The refresh status of the check: "none", "enqueued",
  /// "processing", "success", or "abandoned".
  ///
  /// *    **millisUntilNextRefreshable.** The amount of time, in milliseconds,
  /// until the check is eligible for refresh.
  ///
  /// *    **checkId.** The unique identifier for the check.
  ///
  /// [checkId]: The unique identifier for the Trusted Advisor check to refresh.
  /// **Note:** Specifying the check ID of a check that is automatically
  /// refreshed causes an `InvalidParameterValue` error.
  Future<RefreshTrustedAdvisorCheckResponse> refreshTrustedAdvisorCheck(
      String checkId) async {
    return RefreshTrustedAdvisorCheckResponse.fromJson({});
  }

  /// Takes a `caseId` and returns the initial state of the case along with the
  /// state of the case after the call to ResolveCase completed.
  ///
  /// [caseId]: The AWS Support case ID requested or returned in the call. The
  /// case ID is an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  Future<ResolveCaseResponse> resolveCase({String caseId}) async {
    return ResolveCaseResponse.fromJson({});
  }
}

/// The ID and expiry time of the attachment set returned by the
/// AddAttachmentsToSet operation.
class AddAttachmentsToSetResponse {
  /// The ID of the attachment set. If an `attachmentSetId` was not specified, a
  /// new attachment set is created, and the ID of the set is returned in the
  /// response. If an `attachmentSetId` was specified, the attachments are added
  /// to the specified set, if it exists.
  final String attachmentSetId;

  /// The time and date when the attachment set expires.
  final String expiryTime;

  AddAttachmentsToSetResponse({
    this.attachmentSetId,
    this.expiryTime,
  });
  static AddAttachmentsToSetResponse fromJson(Map<String, dynamic> json) =>
      AddAttachmentsToSetResponse();
}

/// The result of the AddCommunicationToCase operation.
class AddCommunicationToCaseResponse {
  /// True if AddCommunicationToCase succeeds. Otherwise, returns an error.
  final bool result;

  AddCommunicationToCaseResponse({
    this.result,
  });
  static AddCommunicationToCaseResponse fromJson(Map<String, dynamic> json) =>
      AddCommunicationToCaseResponse();
}

/// An attachment to a case communication. The attachment consists of the file
/// name and the content of the file.
class Attachment {
  /// The name of the attachment file.
  final String fileName;

  /// The content of the attachment file.
  final Uint8List data;

  Attachment({
    this.fileName,
    this.data,
  });
  static Attachment fromJson(Map<String, dynamic> json) => Attachment();
}

/// The file name and ID of an attachment to a case communication. You can use
/// the ID to retrieve the attachment with the DescribeAttachment operation.
class AttachmentDetails {
  /// The ID of the attachment.
  final String attachmentId;

  /// The file name of the attachment.
  final String fileName;

  AttachmentDetails({
    this.attachmentId,
    this.fileName,
  });
  static AttachmentDetails fromJson(Map<String, dynamic> json) =>
      AttachmentDetails();
}

/// A JSON-formatted object that contains the metadata for a support case. It is
/// contained the response from a DescribeCases request. **CaseDetails**
/// contains the following fields:
///
/// *    **caseId.** The AWS Support case ID requested or returned in the call.
/// The case ID is an alphanumeric string formatted as shown in this example:
/// case-_12345678910-2013-c4c1d2bf33c5cf47_.
///
/// *    **categoryCode.** The category of problem for the AWS Support case.
/// Corresponds to the CategoryCode values returned by a call to
/// DescribeServices.
///
/// *    **displayId.** The identifier for the case on pages in the AWS Support
/// Center.
///
/// *    **language.** The ISO 639-1 code for the language in which AWS provides
/// support. AWS Support currently supports English ("en") and Japanese ("ja").
/// Language parameters must be passed explicitly for operations that take them.
///
/// *    **recentCommunications.** One or more Communication objects. Fields of
/// these objects are `attachments`, `body`, `caseId`, `submittedBy`, and
/// `timeCreated`.
///
/// *    **nextToken.** A resumption point for pagination.
///
/// *    **serviceCode.** The identifier for the AWS service that corresponds to
/// the service code defined in the call to DescribeServices.
///
/// *    **severityCode.** The severity code assigned to the case. Contains one
/// of the values returned by the call to DescribeSeverityLevels.
///
/// *    **status.** The status of the case in the AWS Support Center.
///
/// *    **subject.** The subject line of the case.
///
/// *    **submittedBy.** The email address of the account that submitted the
/// case.
///
/// *    **timeCreated.** The time the case was created, in ISO-8601 format.
class CaseDetails {
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  final String caseId;

  /// The ID displayed for the case in the AWS Support Center. This is a numeric
  /// string.
  final String displayId;

  /// The subject line for the case in the AWS Support Center.
  final String subject;

  /// The status of the case.
  final String status;

  /// The code for the AWS service returned by the call to DescribeServices.
  final String serviceCode;

  /// The category of problem for the AWS Support case.
  final String categoryCode;

  /// The code for the severity level returned by the call to
  /// DescribeSeverityLevels.
  final String severityCode;

  /// The email address of the account that submitted the case.
  final String submittedBy;

  /// The time that the case was case created in the AWS Support Center.
  final String timeCreated;

  /// The five most recent communications between you and AWS Support Center,
  /// including the IDs of any attachments to the communications. Also includes
  /// a `nextToken` that you can use to retrieve earlier communications.
  final RecentCaseCommunications recentCommunications;

  /// The email addresses that receive copies of communication about the case.
  final List<String> ccEmailAddresses;

  /// The ISO 639-1 code for the language in which AWS provides support. AWS
  /// Support currently supports English ("en") and Japanese ("ja"). Language
  /// parameters must be passed explicitly for operations that take them.
  final String language;

  CaseDetails({
    this.caseId,
    this.displayId,
    this.subject,
    this.status,
    this.serviceCode,
    this.categoryCode,
    this.severityCode,
    this.submittedBy,
    this.timeCreated,
    this.recentCommunications,
    this.ccEmailAddresses,
    this.language,
  });
  static CaseDetails fromJson(Map<String, dynamic> json) => CaseDetails();
}

/// A JSON-formatted name/value pair that represents the category name and
/// category code of the problem, selected from the DescribeServices response
/// for each AWS service.
class Category {
  /// The category code for the support case.
  final String code;

  /// The category name for the support case.
  final String name;

  Category({
    this.code,
    this.name,
  });
  static Category fromJson(Map<String, dynamic> json) => Category();
}

/// A communication associated with an AWS Support case. The communication
/// consists of the case ID, the message body, attachment information, the
/// account email address, and the date and time of the communication.
class Communication {
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  final String caseId;

  /// The text of the communication between the customer and AWS Support.
  final String body;

  /// The email address of the account that submitted the AWS Support case.
  final String submittedBy;

  /// The time the communication was created.
  final String timeCreated;

  /// Information about the attachments to the case communication.
  final List<AttachmentDetails> attachmentSet;

  Communication({
    this.caseId,
    this.body,
    this.submittedBy,
    this.timeCreated,
    this.attachmentSet,
  });
  static Communication fromJson(Map<String, dynamic> json) => Communication();
}

/// The AWS Support case ID returned by a successful completion of the
/// CreateCase operation.
class CreateCaseResponse {
  /// The AWS Support case ID requested or returned in the call. The case ID is
  /// an alphanumeric string formatted as shown in this example:
  /// case-_12345678910-2013-c4c1d2bf33c5cf47_
  final String caseId;

  CreateCaseResponse({
    this.caseId,
  });
  static CreateCaseResponse fromJson(Map<String, dynamic> json) =>
      CreateCaseResponse();
}

/// The content and file name of the attachment returned by the
/// DescribeAttachment operation.
class DescribeAttachmentResponse {
  /// The attachment content and file name.
  final Attachment attachment;

  DescribeAttachmentResponse({
    this.attachment,
  });
  static DescribeAttachmentResponse fromJson(Map<String, dynamic> json) =>
      DescribeAttachmentResponse();
}

/// Returns an array of CaseDetails objects and a `nextToken` that defines a
/// point for pagination in the result set.
class DescribeCasesResponse {
  /// The details for the cases that match the request.
  final List<CaseDetails> cases;

  /// A resumption point for pagination.
  final String nextToken;

  DescribeCasesResponse({
    this.cases,
    this.nextToken,
  });
  static DescribeCasesResponse fromJson(Map<String, dynamic> json) =>
      DescribeCasesResponse();
}

/// The communications returned by the DescribeCommunications operation.
class DescribeCommunicationsResponse {
  /// The communications for the case.
  final List<Communication> communications;

  /// A resumption point for pagination.
  final String nextToken;

  DescribeCommunicationsResponse({
    this.communications,
    this.nextToken,
  });
  static DescribeCommunicationsResponse fromJson(Map<String, dynamic> json) =>
      DescribeCommunicationsResponse();
}

/// The list of AWS services returned by the DescribeServices operation.
class DescribeServicesResponse {
  /// A JSON-formatted list of AWS services.
  final List<Service> services;

  DescribeServicesResponse({
    this.services,
  });
  static DescribeServicesResponse fromJson(Map<String, dynamic> json) =>
      DescribeServicesResponse();
}

/// The list of severity levels returned by the DescribeSeverityLevels
/// operation.
class DescribeSeverityLevelsResponse {
  /// The available severity levels for the support case. Available severity
  /// levels are defined by your service level agreement with AWS.
  final List<SeverityLevel> severityLevels;

  DescribeSeverityLevelsResponse({
    this.severityLevels,
  });
  static DescribeSeverityLevelsResponse fromJson(Map<String, dynamic> json) =>
      DescribeSeverityLevelsResponse();
}

/// The statuses of the Trusted Advisor checks returned by the
/// DescribeTrustedAdvisorCheckRefreshStatuses operation.
class DescribeTrustedAdvisorCheckRefreshStatusesResponse {
  /// The refresh status of the specified Trusted Advisor checks.
  final List<TrustedAdvisorCheckRefreshStatus> statuses;

  DescribeTrustedAdvisorCheckRefreshStatusesResponse({
    @required this.statuses,
  });
  static DescribeTrustedAdvisorCheckRefreshStatusesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeTrustedAdvisorCheckRefreshStatusesResponse();
}

/// The result of the Trusted Advisor check returned by the
/// DescribeTrustedAdvisorCheckResult operation.
class DescribeTrustedAdvisorCheckResultResponse {
  /// The detailed results of the Trusted Advisor check.
  final TrustedAdvisorCheckResult result;

  DescribeTrustedAdvisorCheckResultResponse({
    this.result,
  });
  static DescribeTrustedAdvisorCheckResultResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeTrustedAdvisorCheckResultResponse();
}

/// The summaries of the Trusted Advisor checks returned by the
/// DescribeTrustedAdvisorCheckSummaries operation.
class DescribeTrustedAdvisorCheckSummariesResponse {
  /// The summary information for the requested Trusted Advisor checks.
  final List<TrustedAdvisorCheckSummary> summaries;

  DescribeTrustedAdvisorCheckSummariesResponse({
    @required this.summaries,
  });
  static DescribeTrustedAdvisorCheckSummariesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeTrustedAdvisorCheckSummariesResponse();
}

/// Information about the Trusted Advisor checks returned by the
/// DescribeTrustedAdvisorChecks operation.
class DescribeTrustedAdvisorChecksResponse {
  /// Information about all available Trusted Advisor checks.
  final List<TrustedAdvisorCheckDescription> checks;

  DescribeTrustedAdvisorChecksResponse({
    @required this.checks,
  });
  static DescribeTrustedAdvisorChecksResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeTrustedAdvisorChecksResponse();
}

/// The five most recent communications associated with the case.
class RecentCaseCommunications {
  /// The five most recent communications associated with the case.
  final List<Communication> communications;

  /// A resumption point for pagination.
  final String nextToken;

  RecentCaseCommunications({
    this.communications,
    this.nextToken,
  });
  static RecentCaseCommunications fromJson(Map<String, dynamic> json) =>
      RecentCaseCommunications();
}

/// The current refresh status of a Trusted Advisor check.
class RefreshTrustedAdvisorCheckResponse {
  /// The current refresh status for a check, including the amount of time until
  /// the check is eligible for refresh.
  final TrustedAdvisorCheckRefreshStatus status;

  RefreshTrustedAdvisorCheckResponse({
    @required this.status,
  });
  static RefreshTrustedAdvisorCheckResponse fromJson(
          Map<String, dynamic> json) =>
      RefreshTrustedAdvisorCheckResponse();
}

/// The status of the case returned by the ResolveCase operation.
class ResolveCaseResponse {
  /// The status of the case when the ResolveCase request was sent.
  final String initialCaseStatus;

  /// The status of the case after the ResolveCase request was processed.
  final String finalCaseStatus;

  ResolveCaseResponse({
    this.initialCaseStatus,
    this.finalCaseStatus,
  });
  static ResolveCaseResponse fromJson(Map<String, dynamic> json) =>
      ResolveCaseResponse();
}

/// Information about an AWS service returned by the DescribeServices operation.
class Service {
  /// The code for an AWS service returned by the DescribeServices response. The
  /// `name` element contains the corresponding friendly name.
  final String code;

  /// The friendly name for an AWS service. The `code` element contains the
  /// corresponding code.
  final String name;

  /// A list of categories that describe the type of support issue a case
  /// describes. Categories consist of a category name and a category code.
  /// Category names and codes are passed to AWS Support when you call
  /// CreateCase.
  final List<Category> categories;

  Service({
    this.code,
    this.name,
    this.categories,
  });
  static Service fromJson(Map<String, dynamic> json) => Service();
}

/// A code and name pair that represent a severity level that can be applied to
/// a support case.
class SeverityLevel {
  /// One of four values: "low," "medium," "high," and "urgent". These values
  /// correspond to response times returned to the caller in
  /// `severityLevel.name`.
  final String code;

  /// The name of the severity level that corresponds to the severity level
  /// code.
  final String name;

  SeverityLevel({
    this.code,
    this.name,
  });
  static SeverityLevel fromJson(Map<String, dynamic> json) => SeverityLevel();
}

/// The container for summary information that relates to the category of the
/// Trusted Advisor check.
class TrustedAdvisorCategorySpecificSummary {
  /// The summary information about cost savings for a Trusted Advisor check
  /// that is in the Cost Optimizing category.
  final TrustedAdvisorCostOptimizingSummary costOptimizing;

  TrustedAdvisorCategorySpecificSummary({
    this.costOptimizing,
  });
  static TrustedAdvisorCategorySpecificSummary fromJson(
          Map<String, dynamic> json) =>
      TrustedAdvisorCategorySpecificSummary();
}

/// The description and metadata for a Trusted Advisor check.
class TrustedAdvisorCheckDescription {
  /// The unique identifier for the Trusted Advisor check.
  final String id;

  /// The display name for the Trusted Advisor check.
  final String name;

  /// The description of the Trusted Advisor check, which includes the alert
  /// criteria and recommended actions (contains HTML markup).
  final String description;

  /// The category of the Trusted Advisor check.
  final String category;

  /// The column headings for the data returned by the Trusted Advisor check.
  /// The order of the headings corresponds to the order of the data in the
  /// **Metadata** element of the TrustedAdvisorResourceDetail for the check.
  /// **Metadata** contains all the data that is shown in the Excel download,
  /// even in those cases where the UI shows just summary data.
  final List<String> metadata;

  TrustedAdvisorCheckDescription({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.category,
    @required this.metadata,
  });
  static TrustedAdvisorCheckDescription fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorCheckDescription();
}

/// The refresh status of a Trusted Advisor check.
class TrustedAdvisorCheckRefreshStatus {
  /// The unique identifier for the Trusted Advisor check.
  final String checkId;

  /// The status of the Trusted Advisor check for which a refresh has been
  /// requested: "none", "enqueued", "processing", "success", or "abandoned".
  final String status;

  /// The amount of time, in milliseconds, until the Trusted Advisor check is
  /// eligible for refresh.
  final BigInt millisUntilNextRefreshable;

  TrustedAdvisorCheckRefreshStatus({
    @required this.checkId,
    @required this.status,
    @required this.millisUntilNextRefreshable,
  });
  static TrustedAdvisorCheckRefreshStatus fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorCheckRefreshStatus();
}

/// The results of a Trusted Advisor check returned by
/// DescribeTrustedAdvisorCheckResult.
class TrustedAdvisorCheckResult {
  /// The unique identifier for the Trusted Advisor check.
  final String checkId;

  /// The time of the last refresh of the check.
  final String timestamp;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  final String status;

  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  /// The details about each resource listed in the check result.
  final List<TrustedAdvisorResourceDetail> flaggedResources;

  TrustedAdvisorCheckResult({
    @required this.checkId,
    @required this.timestamp,
    @required this.status,
    @required this.resourcesSummary,
    @required this.categorySpecificSummary,
    @required this.flaggedResources,
  });
  static TrustedAdvisorCheckResult fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorCheckResult();
}

/// A summary of a Trusted Advisor check result, including the alert status,
/// last refresh, and number of resources examined.
class TrustedAdvisorCheckSummary {
  /// The unique identifier for the Trusted Advisor check.
  final String checkId;

  /// The time of the last refresh of the check.
  final String timestamp;

  /// The alert status of the check: "ok" (green), "warning" (yellow), "error"
  /// (red), or "not_available".
  final String status;

  /// Specifies whether the Trusted Advisor check has flagged resources.
  final bool hasFlaggedResources;

  final TrustedAdvisorResourcesSummary resourcesSummary;

  /// Summary information that relates to the category of the check. Cost
  /// Optimizing is the only category that is currently supported.
  final TrustedAdvisorCategorySpecificSummary categorySpecificSummary;

  TrustedAdvisorCheckSummary({
    @required this.checkId,
    @required this.timestamp,
    @required this.status,
    this.hasFlaggedResources,
    @required this.resourcesSummary,
    @required this.categorySpecificSummary,
  });
  static TrustedAdvisorCheckSummary fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorCheckSummary();
}

/// The estimated cost savings that might be realized if the recommended actions
/// are taken.
class TrustedAdvisorCostOptimizingSummary {
  /// The estimated monthly savings that might be realized if the recommended
  /// actions are taken.
  final double estimatedMonthlySavings;

  /// The estimated percentage of savings that might be realized if the
  /// recommended actions are taken.
  final double estimatedPercentMonthlySavings;

  TrustedAdvisorCostOptimizingSummary({
    @required this.estimatedMonthlySavings,
    @required this.estimatedPercentMonthlySavings,
  });
  static TrustedAdvisorCostOptimizingSummary fromJson(
          Map<String, dynamic> json) =>
      TrustedAdvisorCostOptimizingSummary();
}

/// Contains information about a resource identified by a Trusted Advisor check.
class TrustedAdvisorResourceDetail {
  /// The status code for the resource identified in the Trusted Advisor check.
  final String status;

  /// The AWS region in which the identified resource is located.
  final String region;

  /// The unique identifier for the identified resource.
  final String resourceId;

  /// Specifies whether the AWS resource was ignored by Trusted Advisor because
  /// it was marked as suppressed by the user.
  final bool isSuppressed;

  /// Additional information about the identified resource. The exact metadata
  /// and its order can be obtained by inspecting the
  /// TrustedAdvisorCheckDescription object returned by the call to
  /// DescribeTrustedAdvisorChecks. **Metadata** contains all the data that is
  /// shown in the Excel download, even in those cases where the UI shows just
  /// summary data.
  final List<String> metadata;

  TrustedAdvisorResourceDetail({
    @required this.status,
    this.region,
    @required this.resourceId,
    this.isSuppressed,
    @required this.metadata,
  });
  static TrustedAdvisorResourceDetail fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorResourceDetail();
}

/// Details about AWS resources that were analyzed in a call to Trusted Advisor
/// DescribeTrustedAdvisorCheckSummaries.
class TrustedAdvisorResourcesSummary {
  /// The number of AWS resources that were analyzed by the Trusted Advisor
  /// check.
  final BigInt resourcesProcessed;

  /// The number of AWS resources that were flagged (listed) by the Trusted
  /// Advisor check.
  final BigInt resourcesFlagged;

  /// The number of AWS resources ignored by Trusted Advisor because information
  /// was unavailable.
  final BigInt resourcesIgnored;

  /// The number of AWS resources ignored by Trusted Advisor because they were
  /// marked as suppressed by the user.
  final BigInt resourcesSuppressed;

  TrustedAdvisorResourcesSummary({
    @required this.resourcesProcessed,
    @required this.resourcesFlagged,
    @required this.resourcesIgnored,
    @required this.resourcesSuppressed,
  });
  static TrustedAdvisorResourcesSummary fromJson(Map<String, dynamic> json) =>
      TrustedAdvisorResourcesSummary();
}
