import 'package:meta/meta.dart';

/// Amazon Macie
///
/// Amazon Macie is a security service that uses machine learning to
/// automatically discover, classify, and protect sensitive data in AWS. Macie
/// recognizes sensitive data such as personally identifiable information (PII)
/// or intellectual property, and provides you with dashboards and alerts that
/// give visibility into how this data is being accessed or moved. For more
/// information, see the
/// [Macie User Guide](https://docs.aws.amazon.com/macie/latest/userguide/what-is-macie.html).
class MacieApi {
  final _client;
  MacieApi(client) : _client = client.configured('Macie', serializer: 'json');

  /// Associates a specified AWS account with Amazon Macie as a member account.
  ///
  /// [memberAccountId]: The ID of the AWS account that you want to associate
  /// with Amazon Macie as a member account.
  Future<void> associateMemberAccount(String memberAccountId) async {
    await _client.send('AssociateMemberAccount', {
      'memberAccountId': memberAccountId,
    });
  }

  /// Associates specified S3 resources with Amazon Macie for monitoring and
  /// data classification. If memberAccountId isn't specified, the action
  /// associates specified S3 resources with Macie for the current master
  /// account. If memberAccountId is specified, the action associates specified
  /// S3 resources with Macie for the specified member account.
  ///
  /// [memberAccountId]: The ID of the Amazon Macie member account whose
  /// resources you want to associate with Macie.
  ///
  /// [s3Resources]: The S3 resources that you want to associate with Amazon
  /// Macie for monitoring and data classification.
  Future<AssociateS3ResourcesResult> associateS3Resources(
      List<S3ResourceClassification> s3Resources,
      {String memberAccountId}) async {
    var response_ = await _client.send('AssociateS3Resources', {
      if (memberAccountId != null) 'memberAccountId': memberAccountId,
      's3Resources': s3Resources,
    });
    return AssociateS3ResourcesResult.fromJson(response_);
  }

  /// Removes the specified member account from Amazon Macie.
  ///
  /// [memberAccountId]: The ID of the member account that you want to remove
  /// from Amazon Macie.
  Future<void> disassociateMemberAccount(String memberAccountId) async {
    await _client.send('DisassociateMemberAccount', {
      'memberAccountId': memberAccountId,
    });
  }

  /// Removes specified S3 resources from being monitored by Amazon Macie. If
  /// memberAccountId isn't specified, the action removes specified S3 resources
  /// from Macie for the current master account. If memberAccountId is
  /// specified, the action removes specified S3 resources from Macie for the
  /// specified member account.
  ///
  /// [memberAccountId]: The ID of the Amazon Macie member account whose
  /// resources you want to remove from being monitored by Amazon Macie.
  ///
  /// [associatedS3Resources]: The S3 resources (buckets or prefixes) that you
  /// want to remove from being monitored and classified by Amazon Macie.
  Future<DisassociateS3ResourcesResult> disassociateS3Resources(
      List<S3Resource> associatedS3Resources,
      {String memberAccountId}) async {
    var response_ = await _client.send('DisassociateS3Resources', {
      if (memberAccountId != null) 'memberAccountId': memberAccountId,
      'associatedS3Resources': associatedS3Resources,
    });
    return DisassociateS3ResourcesResult.fromJson(response_);
  }

  /// Lists all Amazon Macie member accounts for the current Amazon Macie master
  /// account.
  ///
  /// [nextToken]: Use this parameter when paginating results. Set the value of
  /// this parameter to null on your first call to the ListMemberAccounts
  /// action. Subsequent calls to the action fill nextToken in the request with
  /// the value of nextToken from the previous response to continue listing
  /// data.
  ///
  /// [maxResults]: Use this parameter to indicate the maximum number of items
  /// that you want in the response. The default value is 250.
  Future<ListMemberAccountsResult> listMemberAccounts(
      {String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListMemberAccounts', {
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListMemberAccountsResult.fromJson(response_);
  }

  /// Lists all the S3 resources associated with Amazon Macie. If
  /// memberAccountId isn't specified, the action lists the S3 resources
  /// associated with Amazon Macie for the current master account. If
  /// memberAccountId is specified, the action lists the S3 resources associated
  /// with Amazon Macie for the specified member account.
  ///
  /// [memberAccountId]: The Amazon Macie member account ID whose associated S3
  /// resources you want to list.
  ///
  /// [nextToken]: Use this parameter when paginating results. Set its value to
  /// null on your first call to the ListS3Resources action. Subsequent calls to
  /// the action fill nextToken in the request with the value of nextToken from
  /// the previous response to continue listing data.
  ///
  /// [maxResults]: Use this parameter to indicate the maximum number of items
  /// that you want in the response. The default value is 250.
  Future<ListS3ResourcesResult> listS3Resources(
      {String memberAccountId, String nextToken, int maxResults}) async {
    var response_ = await _client.send('ListS3Resources', {
      if (memberAccountId != null) 'memberAccountId': memberAccountId,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return ListS3ResourcesResult.fromJson(response_);
  }

  /// Updates the classification types for the specified S3 resources. If
  /// memberAccountId isn't specified, the action updates the classification
  /// types of the S3 resources associated with Amazon Macie for the current
  /// master account. If memberAccountId is specified, the action updates the
  /// classification types of the S3 resources associated with Amazon Macie for
  /// the specified member account.
  ///
  /// [memberAccountId]: The AWS ID of the Amazon Macie member account whose S3
  /// resources' classification types you want to update.
  ///
  /// [s3ResourcesUpdate]: The S3 resources whose classification types you want
  /// to update.
  Future<UpdateS3ResourcesResult> updateS3Resources(
      List<S3ResourceClassificationUpdate> s3ResourcesUpdate,
      {String memberAccountId}) async {
    var response_ = await _client.send('UpdateS3Resources', {
      if (memberAccountId != null) 'memberAccountId': memberAccountId,
      's3ResourcesUpdate': s3ResourcesUpdate,
    });
    return UpdateS3ResourcesResult.fromJson(response_);
  }
}

class AssociateS3ResourcesResult {
  /// S3 resources that couldn't be associated with Amazon Macie. An error code
  /// and an error message are provided for each failed item.
  final List<FailedS3Resource> failedS3Resources;

  AssociateS3ResourcesResult({
    this.failedS3Resources,
  });
  static AssociateS3ResourcesResult fromJson(Map<String, dynamic> json) =>
      AssociateS3ResourcesResult(
        failedS3Resources: json.containsKey('failedS3Resources')
            ? (json['failedS3Resources'] as List)
                .map((e) => FailedS3Resource.fromJson(e))
                .toList()
            : null,
      );
}

/// The classification type that Amazon Macie applies to the associated S3
/// resources.
class ClassificationType {
  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
  final String oneTime;

  /// A continuous classification of the objects that are added to a specified
  /// S3 bucket. Amazon Macie begins performing continuous classification after
  /// a bucket is successfully associated with Amazon Macie.
  final String continuous;

  ClassificationType({
    @required this.oneTime,
    @required this.continuous,
  });
  static ClassificationType fromJson(Map<String, dynamic> json) =>
      ClassificationType(
        oneTime: json['oneTime'] as String,
        continuous: json['continuous'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The classification type that Amazon Macie applies to the associated S3
/// resources. At least one of the classification types (oneTime or continuous)
/// must be specified.
class ClassificationTypeUpdate {
  /// A one-time classification of all of the existing objects in a specified S3
  /// bucket.
  final String oneTime;

  /// A continuous classification of the objects that are added to a specified
  /// S3 bucket. Amazon Macie begins performing continuous classification after
  /// a bucket is successfully associated with Amazon Macie.
  final String continuous;

  ClassificationTypeUpdate({
    this.oneTime,
    this.continuous,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DisassociateS3ResourcesResult {
  /// S3 resources that couldn't be removed from being monitored and classified
  /// by Amazon Macie. An error code and an error message are provided for each
  /// failed item.
  final List<FailedS3Resource> failedS3Resources;

  DisassociateS3ResourcesResult({
    this.failedS3Resources,
  });
  static DisassociateS3ResourcesResult fromJson(Map<String, dynamic> json) =>
      DisassociateS3ResourcesResult(
        failedS3Resources: json.containsKey('failedS3Resources')
            ? (json['failedS3Resources'] as List)
                .map((e) => FailedS3Resource.fromJson(e))
                .toList()
            : null,
      );
}

/// Includes details about the failed S3 resources.
class FailedS3Resource {
  /// The failed S3 resources.
  final S3Resource failedItem;

  /// The status code of a failed item.
  final String errorCode;

  /// The error message of a failed item.
  final String errorMessage;

  FailedS3Resource({
    this.failedItem,
    this.errorCode,
    this.errorMessage,
  });
  static FailedS3Resource fromJson(Map<String, dynamic> json) =>
      FailedS3Resource(
        failedItem: json.containsKey('failedItem')
            ? S3Resource.fromJson(json['failedItem'])
            : null,
        errorCode:
            json.containsKey('errorCode') ? json['errorCode'] as String : null,
        errorMessage: json.containsKey('errorMessage')
            ? json['errorMessage'] as String
            : null,
      );
}

class ListMemberAccountsResult {
  /// A list of the Amazon Macie member accounts returned by the action. The
  /// current master account is also included in this list.
  final List<MemberAccount> memberAccounts;

  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no
  /// more data to be listed, this parameter is set to null.
  final String nextToken;

  ListMemberAccountsResult({
    this.memberAccounts,
    this.nextToken,
  });
  static ListMemberAccountsResult fromJson(Map<String, dynamic> json) =>
      ListMemberAccountsResult(
        memberAccounts: json.containsKey('memberAccounts')
            ? (json['memberAccounts'] as List)
                .map((e) => MemberAccount.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListS3ResourcesResult {
  /// A list of the associated S3 resources returned by the action.
  final List<S3ResourceClassification> s3Resources;

  /// When a response is generated, if there is more data to be listed, this
  /// parameter is present in the response and contains the value to use for the
  /// nextToken parameter in a subsequent pagination request. If there is no
  /// more data to be listed, this parameter is set to null.
  final String nextToken;

  ListS3ResourcesResult({
    this.s3Resources,
    this.nextToken,
  });
  static ListS3ResourcesResult fromJson(Map<String, dynamic> json) =>
      ListS3ResourcesResult(
        s3Resources: json.containsKey('s3Resources')
            ? (json['s3Resources'] as List)
                .map((e) => S3ResourceClassification.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

/// Contains information about the Amazon Macie member account.
class MemberAccount {
  /// The AWS account ID of the Amazon Macie member account.
  final String accountId;

  MemberAccount({
    this.accountId,
  });
  static MemberAccount fromJson(Map<String, dynamic> json) => MemberAccount(
        accountId:
            json.containsKey('accountId') ? json['accountId'] as String : null,
      );
}

/// Contains information about the S3 resource. This data type is used as a
/// request parameter in the DisassociateS3Resources action and can be used as a
/// response parameter in the AssociateS3Resources and UpdateS3Resources
/// actions.
class S3Resource {
  /// The name of the S3 bucket.
  final String bucketName;

  /// The prefix of the S3 bucket.
  final String prefix;

  S3Resource({
    @required this.bucketName,
    this.prefix,
  });
  static S3Resource fromJson(Map<String, dynamic> json) => S3Resource(
        bucketName: json['bucketName'] as String,
        prefix: json.containsKey('prefix') ? json['prefix'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The S3 resources that you want to associate with Amazon Macie for monitoring
/// and data classification. This data type is used as a request parameter in
/// the AssociateS3Resources action and a response parameter in the
/// ListS3Resources action.
class S3ResourceClassification {
  /// The name of the S3 bucket that you want to associate with Amazon Macie.
  final String bucketName;

  /// The prefix of the S3 bucket that you want to associate with Amazon Macie.
  final String prefix;

  /// The classification type that you want to specify for the resource
  /// associated with Amazon Macie.
  final ClassificationType classificationType;

  S3ResourceClassification({
    @required this.bucketName,
    this.prefix,
    @required this.classificationType,
  });
  static S3ResourceClassification fromJson(Map<String, dynamic> json) =>
      S3ResourceClassification(
        bucketName: json['bucketName'] as String,
        prefix: json.containsKey('prefix') ? json['prefix'] as String : null,
        classificationType:
            ClassificationType.fromJson(json['classificationType']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The S3 resources whose classification types you want to update. This data
/// type is used as a request parameter in the UpdateS3Resources action.
class S3ResourceClassificationUpdate {
  /// The name of the S3 bucket whose classification types you want to update.
  final String bucketName;

  /// The prefix of the S3 bucket whose classification types you want to update.
  final String prefix;

  /// The classification type that you want to update for the resource
  /// associated with Amazon Macie.
  final ClassificationTypeUpdate classificationTypeUpdate;

  S3ResourceClassificationUpdate({
    @required this.bucketName,
    this.prefix,
    @required this.classificationTypeUpdate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateS3ResourcesResult {
  /// The S3 resources whose classification types can't be updated. An error
  /// code and an error message are provided for each failed item.
  final List<FailedS3Resource> failedS3Resources;

  UpdateS3ResourcesResult({
    this.failedS3Resources,
  });
  static UpdateS3ResourcesResult fromJson(Map<String, dynamic> json) =>
      UpdateS3ResourcesResult(
        failedS3Resources: json.containsKey('failedS3Resources')
            ? (json['failedS3Resources'] as List)
                .map((e) => FailedS3Resource.fromJson(e))
                .toList()
            : null,
      );
}
