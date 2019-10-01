import 'package:meta/meta.dart';
import 'dart:typed_data';

/// The control plane for Amazon QLDB
class QldbApi {
  /// Creates a new ledger in your AWS account.
  ///
  /// [name]: The name of the ledger that you want to create. The name must be
  /// unique among all of your ledgers in the current AWS Region.
  ///
  /// [tags]: The key-value pairs to add as tags to the ledger that you want to
  /// create. Tag keys are case sensitive. Tag values are case sensitive and can
  /// be null.
  ///
  /// [permissionsMode]: The permissions mode to assign to the ledger that you
  /// want to create.
  ///
  /// [deletionProtection]: The flag that prevents a ledger from being deleted
  /// by any user. If not provided on ledger creation, this feature is enabled
  /// (`true`) by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  Future<CreateLedgerResponse> createLedger(
      {@required String name,
      Map<String, String> tags,
      @required String permissionsMode,
      bool deletionProtection}) async {
    return CreateLedgerResponse.fromJson({});
  }

  /// Deletes a ledger and all of its contents. This action is irreversible.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  ///
  /// [name]: The name of the ledger that you want to delete.
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
  ///
  /// [name]: The name of the ledger.
  ///
  /// [exportId]: The unique ID of the journal export job that you want to
  /// describe.
  Future<DescribeJournalS3ExportResponse> describeJournalS3Export(
      {@required String name, @required String exportId}) async {
    return DescribeJournalS3ExportResponse.fromJson({});
  }

  /// Returns information about a ledger, including its state and when it was
  /// created.
  ///
  /// [name]: The name of the ledger that you want to describe.
  Future<DescribeLedgerResponse> describeLedger(String name) async {
    return DescribeLedgerResponse.fromJson({});
  }

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
  ///
  /// [name]: The name of the ledger.
  ///
  /// [inclusiveStartTime]: The inclusive start date and time for the range of
  /// journal contents that you want to export.
  ///
  /// The `InclusiveStartTime` must be in `ISO 8601` date and time format and in
  /// Universal Coordinated Time (UTC). For example: `2019-06-13T21:36:34Z`
  ///
  /// The `InclusiveStartTime` must be before `ExclusiveEndTime`.
  ///
  /// If you provide an `InclusiveStartTime` that is before the ledger's
  /// `CreationDateTime`, Amazon QLDB defaults it to the ledger's
  /// `CreationDateTime`.
  ///
  /// [exclusiveEndTime]: The exclusive end date and time for the range of
  /// journal contents that you want to export.
  ///
  /// The `ExclusiveEndTime` must be in `ISO 8601` date and time format and in
  /// Universal Coordinated Time (UTC). For example: `2019-06-13T21:36:34Z`
  ///
  /// The `ExclusiveEndTime` must be less than or equal to the current UTC date
  /// and time.
  ///
  /// [s3ExportConfiguration]: The configuration settings of the Amazon S3
  /// bucket destination for your export request.
  ///
  /// [roleArn]: The Amazon Resource Name (ARN) of the IAM role that grants QLDB
  /// permissions for a journal export job to do the following:
  ///
  /// *   Write objects into your Amazon Simple Storage Service (Amazon S3)
  /// bucket.
  ///
  /// *   (Optional) Use your customer master key (CMK) in AWS Key Management
  /// Service (AWS KMS) for server-side encryption of your exported data.
  Future<ExportJournalToS3Response> exportJournalToS3(
      {@required String name,
      @required DateTime inclusiveStartTime,
      @required DateTime exclusiveEndTime,
      @required S3ExportConfiguration s3ExportConfiguration,
      @required String roleArn}) async {
    return ExportJournalToS3Response.fromJson({});
  }

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
  ///
  /// [name]: The name of the ledger.
  ///
  /// [blockAddress]: The location of the block that you want to request. An
  /// address is an Amazon Ion structure that has two fields: `strandId` and
  /// `sequenceNo`.
  ///
  /// For example: `{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}`
  ///
  /// [digestTipAddress]: The latest block location covered by the digest for
  /// which to request a proof. An address is an Amazon Ion structure that has
  /// two fields: `strandId` and `sequenceNo`.
  ///
  /// For example: `{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}`
  Future<GetBlockResponse> getBlock(
      {@required String name,
      @required ValueHolder blockAddress,
      ValueHolder digestTipAddress}) async {
    return GetBlockResponse.fromJson({});
  }

  /// Returns the digest of a ledger at the latest committed block in the
  /// journal. The response includes a 256-bit hash value and a block address.
  ///
  /// [name]: The name of the ledger.
  Future<GetDigestResponse> getDigest(String name) async {
    return GetDigestResponse.fromJson({});
  }

  /// Returns a revision data object for a specified document ID and block
  /// address. Also returns a proof of the specified revision for verification
  /// if `DigestTipAddress` is provided.
  ///
  /// [name]: The name of the ledger.
  ///
  /// [blockAddress]: The block location of the document revision to be
  /// verified. An address is an Amazon Ion structure that has two fields:
  /// `strandId` and `sequenceNo`.
  ///
  /// For example: `{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:14}`
  ///
  /// [documentId]: The unique ID of the document to be verified.
  ///
  /// [digestTipAddress]: The latest block location covered by the digest for
  /// which to request a proof. An address is an Amazon Ion structure that has
  /// two fields: `strandId` and `sequenceNo`.
  ///
  /// For example: `{strandId:"BlFTjlSXze9BIh1KOszcE3",sequenceNo:49}`
  Future<GetRevisionResponse> getRevision(
      {@required String name,
      @required ValueHolder blockAddress,
      @required String documentId,
      ValueHolder digestTipAddress}) async {
    return GetRevisionResponse.fromJson({});
  }

  /// Returns an array of journal export job descriptions for all ledgers that
  /// are associated with the current AWS account and Region.
  ///
  /// This action returns a maximum of `MaxResults` items, and is paginated so
  /// that you can retrieve all the items by calling `ListJournalS3Exports`
  /// multiple times.
  ///
  /// [maxResults]: The maximum number of results to return in a single
  /// `ListJournalS3Exports` request. (The actual number of results returned
  /// might be fewer.)
  ///
  /// [nextToken]: A pagination token, indicating that you want to retrieve the
  /// next page of results. If you received a value for `NextToken` in the
  /// response from a previous `ListJournalS3Exports` call, then you should use
  /// that value as input here.
  Future<ListJournalS3ExportsResponse> listJournalS3Exports(
      {int maxResults, String nextToken}) async {
    return ListJournalS3ExportsResponse.fromJson({});
  }

  /// Returns an array of journal export job descriptions for a specified
  /// ledger.
  ///
  /// This action returns a maximum of `MaxResults` items, and is paginated so
  /// that you can retrieve all the items by calling
  /// `ListJournalS3ExportsForLedger` multiple times.
  ///
  /// [name]: The name of the ledger.
  ///
  /// [maxResults]: The maximum number of results to return in a single
  /// `ListJournalS3ExportsForLedger` request. (The actual number of results
  /// returned might be fewer.)
  ///
  /// [nextToken]: A pagination token, indicating that you want to retrieve the
  /// next page of results. If you received a value for `NextToken` in the
  /// response from a previous `ListJournalS3ExportsForLedger` call, then you
  /// should use that value as input here.
  Future<ListJournalS3ExportsForLedgerResponse> listJournalS3ExportsForLedger(
      String name,
      {int maxResults,
      String nextToken}) async {
    return ListJournalS3ExportsForLedgerResponse.fromJson({});
  }

  /// Returns an array of ledger summaries that are associated with the current
  /// AWS account and Region.
  ///
  /// This action returns a maximum of 100 items and is paginated so that you
  /// can retrieve all the items by calling `ListLedgers` multiple times.
  ///
  /// [maxResults]: The maximum number of results to return in a single
  /// `ListLedgers` request. (The actual number of results returned might be
  /// fewer.)
  ///
  /// [nextToken]: A pagination token, indicating that you want to retrieve the
  /// next page of results. If you received a value for `NextToken` in the
  /// response from a previous `ListLedgers` call, then you should use that
  /// value as input here.
  Future<ListLedgersResponse> listLedgers(
      {int maxResults, String nextToken}) async {
    return ListLedgersResponse.fromJson({});
  }

  /// Returns all tags for a specified Amazon QLDB resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) for which you want to list
  /// the tags. For example:
  ///
  ///  `arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger`
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    return ListTagsForResourceResponse.fromJson({});
  }

  /// Adds one or more tags to a specified Amazon QLDB resource.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, your request fails and returns an error.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) to which you want to add the
  /// tags. For example:
  ///
  ///  `arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger`
  ///
  /// [tags]: The key-value pairs to add as tags to the specified QLDB resource.
  /// Tag keys are case sensitive. If you specify a key that already exists for
  /// the resource, your request fails and returns an error. Tag values are case
  /// sensitive and can be null.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn,
      @required Map<String, String> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes one or more tags from a specified Amazon QLDB resource. You can
  /// specify up to 50 tag keys to remove.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) from which you want to
  /// remove the tags. For example:
  ///
  ///  `arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger`
  ///
  /// [tagKeys]: The list of tag keys that you want to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates properties on a ledger.
  ///
  /// [name]: The name of the ledger.
  ///
  /// [deletionProtection]: The flag that prevents a ledger from being deleted
  /// by any user. If not provided on ledger creation, this feature is enabled
  /// (`true`) by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  Future<UpdateLedgerResponse> updateLedger(String name,
      {bool deletionProtection}) async {
    return UpdateLedgerResponse.fromJson({});
  }
}

class CreateLedgerResponse {
  /// The name of the ledger.
  final String name;

  /// The Amazon Resource Name (ARN) for the ledger.
  final String arn;

  /// The current status of the ledger.
  final String state;

  /// The date and time, in epoch time format, when the ledger was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (`true`) by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  final bool deletionProtection;

  CreateLedgerResponse({
    this.name,
    this.arn,
    this.state,
    this.creationDateTime,
    this.deletionProtection,
  });
  static CreateLedgerResponse fromJson(Map<String, dynamic> json) =>
      CreateLedgerResponse();
}

class DescribeJournalS3ExportResponse {
  /// Information about the journal export job returned by a
  /// `DescribeJournalS3Export` request.
  final JournalS3ExportDescription exportDescription;

  DescribeJournalS3ExportResponse({
    @required this.exportDescription,
  });
  static DescribeJournalS3ExportResponse fromJson(Map<String, dynamic> json) =>
      DescribeJournalS3ExportResponse();
}

class DescribeLedgerResponse {
  /// The name of the ledger.
  final String name;

  /// The Amazon Resource Name (ARN) for the ledger.
  final String arn;

  /// The current status of the ledger.
  final String state;

  /// The date and time, in epoch time format, when the ledger was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (`true`) by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  final bool deletionProtection;

  DescribeLedgerResponse({
    this.name,
    this.arn,
    this.state,
    this.creationDateTime,
    this.deletionProtection,
  });
  static DescribeLedgerResponse fromJson(Map<String, dynamic> json) =>
      DescribeLedgerResponse();
}

class ExportJournalToS3Response {
  /// The unique ID that QLDB assigns to each journal export job.
  ///
  /// To describe your export request and check the status of the job, you can
  /// use `ExportId` to call `DescribeJournalS3Export`.
  final String exportId;

  ExportJournalToS3Response({
    @required this.exportId,
  });
  static ExportJournalToS3Response fromJson(Map<String, dynamic> json) =>
      ExportJournalToS3Response();
}

class GetBlockResponse {
  /// The block data object in Amazon Ion format.
  final ValueHolder block;

  /// The proof object in Amazon Ion format returned by a `GetBlock` request. A
  /// proof contains the list of hash values required to recalculate the
  /// specified digest using a Merkle tree, starting with the specified block.
  final ValueHolder proof;

  GetBlockResponse({
    @required this.block,
    this.proof,
  });
  static GetBlockResponse fromJson(Map<String, dynamic> json) =>
      GetBlockResponse();
}

class GetDigestResponse {
  /// The 256-bit hash value representing the digest returned by a `GetDigest`
  /// request.
  final Uint8List digest;

  /// The latest block location covered by the digest that you requested. An
  /// address is an Amazon Ion structure that has two fields: `strandId` and
  /// `sequenceNo`.
  final ValueHolder digestTipAddress;

  GetDigestResponse({
    @required this.digest,
    @required this.digestTipAddress,
  });
  static GetDigestResponse fromJson(Map<String, dynamic> json) =>
      GetDigestResponse();
}

class GetRevisionResponse {
  /// The proof object in Amazon Ion format returned by a `GetRevision` request.
  /// A proof contains the list of hash values that are required to recalculate
  /// the specified digest using a Merkle tree, starting with the specified
  /// document revision.
  final ValueHolder proof;

  /// The document revision data object in Amazon Ion format.
  final ValueHolder revision;

  GetRevisionResponse({
    this.proof,
    @required this.revision,
  });
  static GetRevisionResponse fromJson(Map<String, dynamic> json) =>
      GetRevisionResponse();
}

class JournalS3ExportDescription {
  /// The name of the ledger.
  final String ledgerName;

  /// The unique ID of the journal export job.
  final String exportId;

  /// The date and time, in epoch time format, when the export job was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime exportCreationTime;

  /// The current state of the journal export job.
  final String status;

  /// The inclusive start date and time for the range of journal contents that
  /// are specified in the original export request.
  final DateTime inclusiveStartTime;

  /// The exclusive end date and time for the range of journal contents that are
  /// specified in the original export request.
  final DateTime exclusiveEndTime;

  final S3ExportConfiguration s3ExportConfiguration;

  /// The Amazon Resource Name (ARN) of the IAM role that grants QLDB
  /// permissions for a journal export job to do the following:
  ///
  /// *   Write objects into your Amazon Simple Storage Service (Amazon S3)
  /// bucket.
  ///
  /// *   (Optional) Use your customer master key (CMK) in AWS Key Management
  /// Service (AWS KMS) for server-side encryption of your exported data.
  final String roleArn;

  JournalS3ExportDescription({
    @required this.ledgerName,
    @required this.exportId,
    @required this.exportCreationTime,
    @required this.status,
    @required this.inclusiveStartTime,
    @required this.exclusiveEndTime,
    @required this.s3ExportConfiguration,
    @required this.roleArn,
  });
  static JournalS3ExportDescription fromJson(Map<String, dynamic> json) =>
      JournalS3ExportDescription();
}

class LedgerSummary {
  /// The name of the ledger.
  final String name;

  /// The current status of the ledger.
  final String state;

  /// The date and time, in epoch time format, when the ledger was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime creationDateTime;

  LedgerSummary({
    this.name,
    this.state,
    this.creationDateTime,
  });
  static LedgerSummary fromJson(Map<String, dynamic> json) => LedgerSummary();
}

class ListJournalS3ExportsForLedgerResponse {
  /// The array of journal export job descriptions that are associated with the
  /// specified ledger.
  final List<JournalS3ExportDescription> journalS3Exports;

  /// *   If `NextToken` is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  ///
  /// *   If `NextToken` is _not_ empty, then there are more results available.
  /// To retrieve the next page of results, use the value of `NextToken` in a
  /// subsequent `ListJournalS3ExportsForLedger` call.
  final String nextToken;

  ListJournalS3ExportsForLedgerResponse({
    this.journalS3Exports,
    this.nextToken,
  });
  static ListJournalS3ExportsForLedgerResponse fromJson(
          Map<String, dynamic> json) =>
      ListJournalS3ExportsForLedgerResponse();
}

class ListJournalS3ExportsResponse {
  /// The array of journal export job descriptions for all ledgers that are
  /// associated with the current AWS account and Region.
  final List<JournalS3ExportDescription> journalS3Exports;

  /// *   If `NextToken` is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  ///
  /// *   If `NextToken` is _not_ empty, then there are more results available.
  /// To retrieve the next page of results, use the value of `NextToken` in a
  /// subsequent `ListJournalS3Exports` call.
  final String nextToken;

  ListJournalS3ExportsResponse({
    this.journalS3Exports,
    this.nextToken,
  });
  static ListJournalS3ExportsResponse fromJson(Map<String, dynamic> json) =>
      ListJournalS3ExportsResponse();
}

class ListLedgersResponse {
  /// The array of ledger summaries that are associated with the current AWS
  /// account and Region.
  final List<LedgerSummary> ledgers;

  /// A pagination token, indicating whether there are more results available:
  ///
  /// *   If `NextToken` is empty, then the last page of results has been
  /// processed and there are no more results to be retrieved.
  ///
  /// *   If `NextToken` is _not_ empty, then there are more results available.
  /// To retrieve the next page of results, use the value of `NextToken` in a
  /// subsequent `ListLedgers` call.
  final String nextToken;

  ListLedgersResponse({
    this.ledgers,
    this.nextToken,
  });
  static ListLedgersResponse fromJson(Map<String, dynamic> json) =>
      ListLedgersResponse();
}

class ListTagsForResourceResponse {
  /// The tags that are currently associated with the specified Amazon QLDB
  /// resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse();
}

class S3EncryptionConfiguration {
  /// The Amazon S3 object encryption type.
  ///
  /// To learn more about server-side encryption options in Amazon S3, see
  /// [Protecting Data Using Server-Side
  /// Encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html)
  /// in the _Amazon S3 Developer Guide_.
  final String objectEncryptionType;

  /// The Amazon Resource Name (ARN) for a customer master key (CMK) in AWS Key
  /// Management Service (AWS KMS).
  ///
  /// You must provide a `KmsKeyArn` if you specify `SSE_KMS` as the
  /// `ObjectEncryptionType`.
  ///
  ///  `KmsKeyArn` is not required if you specify `SSE_S3` as the
  /// `ObjectEncryptionType`.
  final String kmsKeyArn;

  S3EncryptionConfiguration({
    @required this.objectEncryptionType,
    this.kmsKeyArn,
  });
  static S3EncryptionConfiguration fromJson(Map<String, dynamic> json) =>
      S3EncryptionConfiguration();
}

class S3ExportConfiguration {
  /// The Amazon S3 bucket name in which a journal export job writes the journal
  /// contents.
  ///
  /// The bucket name must comply with the Amazon S3 bucket naming conventions.
  /// For more information, see [Bucket Restrictions and
  /// Limitations](https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html)
  /// in the _Amazon S3 Developer Guide_.
  final String bucket;

  /// The prefix for the Amazon S3 bucket in which a journal export job writes
  /// the journal contents.
  ///
  /// The prefix must comply with Amazon S3 key naming rules and restrictions.
  /// For more information, see [Object Key and
  /// Metadata](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html)
  /// in the _Amazon S3 Developer Guide_.
  ///
  /// The following are examples of valid `Prefix` values:
  ///
  /// *    `JournalExports-ForMyLedger/Testing/`
  ///
  /// *    `JournalExports`
  ///
  /// *    `My:Tests/`
  final String prefix;

  /// The encryption settings that are used by a journal export job to write
  /// data in an Amazon S3 bucket.
  final S3EncryptionConfiguration encryptionConfiguration;

  S3ExportConfiguration({
    @required this.bucket,
    @required this.prefix,
    @required this.encryptionConfiguration,
  });
  static S3ExportConfiguration fromJson(Map<String, dynamic> json) =>
      S3ExportConfiguration();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateLedgerResponse {
  /// The name of the ledger.
  final String name;

  /// The Amazon Resource Name (ARN) for the ledger.
  final String arn;

  /// The current status of the ledger.
  final String state;

  /// The date and time, in epoch time format, when the ledger was created.
  /// (Epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.)
  final DateTime creationDateTime;

  /// The flag that prevents a ledger from being deleted by any user. If not
  /// provided on ledger creation, this feature is enabled (`true`) by default.
  ///
  /// If deletion protection is enabled, you must first disable it before you
  /// can delete the ledger using the QLDB API or the AWS Command Line Interface
  /// (AWS CLI). You can disable it by calling the `UpdateLedger` operation to
  /// set the flag to `false`. The QLDB console disables deletion protection for
  /// you when you use it to delete a ledger.
  final bool deletionProtection;

  UpdateLedgerResponse({
    this.name,
    this.arn,
    this.state,
    this.creationDateTime,
    this.deletionProtection,
  });
  static UpdateLedgerResponse fromJson(Map<String, dynamic> json) =>
      UpdateLedgerResponse();
}

class ValueHolder {
  /// An Amazon Ion plaintext value contained in a `ValueHolder` structure.
  final String ionText;

  ValueHolder({
    this.ionText,
  });
  static ValueHolder fromJson(Map<String, dynamic> json) => ValueHolder();
}
