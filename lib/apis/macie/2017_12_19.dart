import 'package:meta/meta.dart';

/// Amazon Macie
///
/// Amazon Macie is a security service that uses machine learning to
/// automatically discover, classify, and protect sensitive data in AWS. Macie
/// recognizes sensitive data such as personally identifiable information (PII)
/// or intellectual property, and provides you with dashboards and alerts that
/// give visibility into how this data is being accessed or moved. For more
/// information, see the [Macie User
/// Guide](https://docs.aws.amazon.com/macie/latest/userguide/what-is-macie.html).
class MacieApi {
  /// Associates a specified AWS account with Amazon Macie as a member account.
  Future<void> associateMemberAccount(String memberAccountId) async {}

  /// Associates specified S3 resources with Amazon Macie for monitoring and
  /// data classification. If memberAccountId isn't specified, the action
  /// associates specified S3 resources with Macie for the current master
  /// account. If memberAccountId is specified, the action associates specified
  /// S3 resources with Macie for the specified member account.
  Future<void> associateS3Resources(List<S3ResourceClassification> s3Resources,
      {String memberAccountId}) async {}

  /// Removes the specified member account from Amazon Macie.
  Future<void> disassociateMemberAccount(String memberAccountId) async {}

  /// Removes specified S3 resources from being monitored by Amazon Macie. If
  /// memberAccountId isn't specified, the action removes specified S3 resources
  /// from Macie for the current master account. If memberAccountId is
  /// specified, the action removes specified S3 resources from Macie for the
  /// specified member account.
  Future<void> disassociateS3Resources(List<S3Resource> associatedS3Resources,
      {String memberAccountId}) async {}

  /// Lists all Amazon Macie member accounts for the current Amazon Macie master
  /// account.
  Future<void> listMemberAccounts({String nextToken, int maxResults}) async {}

  /// Lists all the S3 resources associated with Amazon Macie. If
  /// memberAccountId isn't specified, the action lists the S3 resources
  /// associated with Amazon Macie for the current master account. If
  /// memberAccountId is specified, the action lists the S3 resources associated
  /// with Amazon Macie for the specified member account.
  Future<void> listS3Resources(
      {String memberAccountId, String nextToken, int maxResults}) async {}

  /// Updates the classification types for the specified S3 resources. If
  /// memberAccountId isn't specified, the action updates the classification
  /// types of the S3 resources associated with Amazon Macie for the current
  /// master account. If memberAccountId is specified, the action updates the
  /// classification types of the S3 resources associated with Amazon Macie for
  /// the specified member account.
  Future<void> updateS3Resources(
      List<S3ResourceClassificationUpdate> s3ResourcesUpdate,
      {String memberAccountId}) async {}
}

class AssociateS3ResourcesResult {}

class ClassificationType {}

class ClassificationTypeUpdate {}

class DisassociateS3ResourcesResult {}

class FailedS3Resource {}

class ListMemberAccountsResult {}

class ListS3ResourcesResult {}

class MemberAccount {}

class S3Resource {}

class S3ResourceClassification {}

class S3ResourceClassificationUpdate {}

class UpdateS3ResourcesResult {}
