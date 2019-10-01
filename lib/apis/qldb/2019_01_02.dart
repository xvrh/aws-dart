import 'package:meta/meta.dart';

/// The control plane for Amazon QLDB
class QldbApi {
  /// Creates a new ledger in your AWS account.
  Future<void> createLedger(
      {@required String name,
      Map<String, String> tags,
      @required String permissionsMode,
      bool deletionProtection}) async {}

  /// Deletes a ledger and all of its contents. This action is irreversible.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  Future<void> deleteLedger(String name) async {}

  /// Returns information about a journal export job, including the ledger name,
  /// export ID, when it was created, current status, and its start and end time
  /// export parameters.
  ///
  /// If the export job with the given `ExportId` doesn't exist, then throws
  /// `ResourceNotFoundException`.
  ///
  /// If the ledger with the given `Name` doesn't exist, then throws
  /// `ResourceNotFoundException`.
  Future<void> describeJournalS3Export(
      {@required String name, @required String exportId}) async {}

  /// Returns information about a ledger, including its state and when it was
  /// created.
  Future<void> describeLedger(String name) async {}

  /// Exports journal contents within a date and time range from a ledger into a
  /// specified Amazon Simple Storage Service (Amazon S3) bucket. The data is
  /// written as files in Amazon Ion format.
  ///
  /// If the ledger with the given `Name` doesn't exist, then throws
  /// `ResourceNotFoundException`.
  ///
  /// If the ledger with the given `Name` is in `CREATING` status, then throws
  /// `ResourcePreconditionNotMetException`.
  ///
  /// You can initiate up to two concurrent journal export requests for each
  /// ledger. Beyond this limit, journal export requests throw
  /// `LimitExceededException`.
  Future<void> exportJournalToS3(
      {@required String name,
      @required DateTime inclusiveStartTime,
      @required DateTime exclusiveEndTime,
      @required S3ExportConfiguration s3ExportConfiguration,
      @required String roleArn}) async {}

  /// Returns a journal block object at a specified address in a ledger. Also
  /// returns a proof of the specified block for verification if
  /// `DigestTipAddress` is provided.
  ///
  /// If the specified ledger doesn't exist or is in `DELETING` status, then
  /// throws `ResourceNotFoundException`.
  ///
  /// If the specified ledger is in `CREATING` status, then throws
  /// `ResourcePreconditionNotMetException`.
  ///
  /// If no block exists with the specified address, then throws
  /// `InvalidParameterException`.
  Future<void> getBlock(
      {@required String name,
      @required ValueHolder blockAddress,
      ValueHolder digestTipAddress}) async {}

  /// Returns the digest of a ledger at the latest committed block in the
  /// journal. The response includes a 256-bit hash value and a block address.
  Future<void> getDigest(String name) async {}

  /// Returns a revision data object for a specified document ID and block
  /// address. Also returns a proof of the specified revision for verification
  /// if `DigestTipAddress` is provided.
  Future<void> getRevision(
      {@required String name,
      @required ValueHolder blockAddress,
      @required String documentId,
      ValueHolder digestTipAddress}) async {}

  /// Returns an array of journal export job descriptions for all ledgers that
  /// are associated with the current AWS account and Region.
  ///
  /// This action returns a maximum of `MaxResults` items, and is paginated so
  /// that you can retrieve all the items by calling `ListJournalS3Exports`
  /// multiple times.
  Future<void> listJournalS3Exports({int maxResults, String nextToken}) async {}

  /// Returns an array of journal export job descriptions for a specified
  /// ledger.
  ///
  /// This action returns a maximum of `MaxResults` items, and is paginated so
  /// that you can retrieve all the items by calling
  /// `ListJournalS3ExportsForLedger` multiple times.
  Future<void> listJournalS3ExportsForLedger(String name,
      {int maxResults, String nextToken}) async {}

  /// Returns an array of ledger summaries that are associated with the current
  /// AWS account and Region.
  ///
  /// This action returns a maximum of 100 items and is paginated so that you
  /// can retrieve all the items by calling `ListLedgers` multiple times.
  Future<void> listLedgers({int maxResults, String nextToken}) async {}

  /// Returns all tags for a specified Amazon QLDB resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Adds one or more tags to a specified Amazon QLDB resource.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, your request fails and returns an error.
  Future<void> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {}

  /// Removes one or more tags from a specified Amazon QLDB resource. You can
  /// specify up to 50 tag keys to remove.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates properties on a ledger.
  Future<void> updateLedger(String name, {bool deletionProtection}) async {}
}

class CreateLedgerResponse {}

class DescribeJournalS3ExportResponse {}

class DescribeLedgerResponse {}

class ExportJournalToS3Response {}

class GetBlockResponse {}

class GetDigestResponse {}

class GetRevisionResponse {}

class JournalS3ExportDescription {}

class LedgerSummary {}

class ListJournalS3ExportsForLedgerResponse {}

class ListJournalS3ExportsResponse {}

class ListLedgersResponse {}

class ListTagsForResourceResponse {}

class S3EncryptionConfiguration {}

class S3ExportConfiguration {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateLedgerResponse {}

class ValueHolder {}
