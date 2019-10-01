import 'package:meta/meta.dart';
import 'dart:typed_data';

///  Amazon S3 Glacier (Glacier) is a storage solution for "cold data."
///
/// Glacier is an extremely low-cost storage service that provides secure,
/// durable, and easy-to-use storage for data backup and archival. With Glacier,
/// customers can store their data cost effectively for months, years, or
/// decades. Glacier also enables customers to offload the administrative
/// burdens of operating and scaling storage to AWS, so they don't have to worry
/// about capacity planning, hardware provisioning, data replication, hardware
/// failure and recovery, or time-consuming hardware migrations.
///
/// Glacier is a great storage choice when low storage cost is paramount and
/// your data is rarely retrieved. If your application requires fast or frequent
/// access to your data, consider using Amazon S3. For more information, see
/// [Amazon Simple Storage Service (Amazon S3)](http://aws.amazon.com/s3/).
///
/// You can store any kind of data in any format. There is no maximum limit on
/// the total amount of data you can store in Glacier.
///
/// If you are a first-time user of Glacier, we recommend that you begin by
/// reading the following sections in the _Amazon S3 Glacier Developer Guide_:
///
/// *
/// [What is Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html)
/// - This section of the Developer Guide describes the underlying data model,
/// the operations it supports, and the AWS SDKs that you can use to interact
/// with the service.
///
/// *
/// [Getting Started with Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/amazon-glacier-getting-started.html)
/// - The Getting Started section walks you through the process of creating a
/// vault, uploading archives, creating jobs to download archives, retrieving
/// the job output, and deleting archives.
class GlacierApi {
  /// This operation aborts a multipart upload identified by the upload ID.
  ///
  /// After the Abort Multipart Upload request succeeds, you cannot upload any
  /// more parts to the multipart upload or complete the multipart upload.
  /// Aborting a completed upload fails. However, aborting an already-aborted
  /// upload will succeed, for a short time. For more information about
  /// uploading a part and completing a multipart upload, see
  /// UploadMultipartPart and CompleteMultipartUpload.
  ///
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Working with Archives in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html)
  /// and
  /// [Abort Multipart Upload](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-abort-upload.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [uploadId]: The upload ID of the multipart upload to delete.
  Future<void> abortMultipartUpload(
      {@required String accountId,
      @required String vaultName,
      @required String uploadId}) async {}

  /// This operation aborts the vault locking process if the vault lock is not
  /// in the `Locked` state. If the vault lock is in the `Locked` state when
  /// this operation is requested, the operation returns an
  /// `AccessDeniedException` error. Aborting the vault locking process removes
  /// the vault lock policy from the specified vault.
  ///
  /// A vault lock is put into the `InProgress` state by calling
  /// InitiateVaultLock. A vault lock is put into the `Locked` state by calling
  /// CompleteVaultLock. You can get the state of a vault lock by calling
  /// GetVaultLock. For more information about the vault locking process, see
  /// [Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html).
  /// For more information about vault lock policies, see
  /// [Amazon Glacier Access Control with Vault Lock Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html).
  ///
  /// This operation is idempotent. You can successfully invoke this operation
  /// multiple times, if the vault lock is in the `InProgress` state or if there
  /// is no policy associated with the vault.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<void> abortVaultLock(
      {@required String accountId, @required String vaultName}) async {}

  /// This operation adds the specified tags to a vault. Each tag is composed of
  /// a key and a value. Each vault can have up to 10 tags. If your request
  /// would cause the tag limit for the vault to be exceeded, the operation
  /// throws the `LimitExceededException` error. If a tag already exists on the
  /// vault under a specified key, the existing key value will be overwritten.
  /// For more information about tags, see
  /// [Tagging Amazon S3 Glacier Resources](https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [tags]: The tags to add to the vault. Each tag is composed of a key and a
  /// value. The value can be an empty string.
  Future<void> addTagsToVault(
      {@required String accountId,
      @required String vaultName,
      Map<String, String> tags}) async {}

  /// You call this operation to inform Amazon S3 Glacier (Glacier) that all the
  /// archive parts have been uploaded and that Glacier can now assemble the
  /// archive from the uploaded parts. After assembling and saving the archive
  /// to the vault, Glacier returns the URI path of the newly created archive
  /// resource. Using the URI path, you can then access the archive. After you
  /// upload an archive, you should save the archive ID returned to retrieve the
  /// archive at a later point. You can also get the vault inventory to obtain a
  /// list of archive IDs in a vault. For more information, see InitiateJob.
  ///
  /// In the request, you must include the computed SHA256 tree hash of the
  /// entire archive you have uploaded. For information about computing a SHA256
  /// tree hash, see
  /// [Computing Checksums](https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html).
  /// On the server side, Glacier also constructs the SHA256 tree hash of the
  /// assembled archive. If the values match, Glacier saves the archive to the
  /// vault; otherwise, it returns an error, and the operation fails. The
  /// ListParts operation returns a list of parts uploaded for a specific
  /// multipart upload. It includes checksum information for each uploaded part
  /// that can be used to debug a bad checksum issue.
  ///
  /// Additionally, Glacier also checks for any missing content ranges when
  /// assembling the archive, if missing content ranges are found, Glacier
  /// returns an error and the operation fails.
  ///
  /// Complete Multipart Upload is an idempotent operation. After your first
  /// successful complete multipart upload, if you call the operation again
  /// within a short period, the operation will succeed and return the same
  /// archive ID. This is useful in the event you experience a network issue
  /// that causes an aborted connection or receive a 500 server error, in which
  /// case you can repeat your Complete Multipart Upload request and get the
  /// same archive ID without creating duplicate archives. Note, however, that
  /// after the multipart upload completes, you cannot call the List Parts
  /// operation and the multipart upload will not appear in List Multipart
  /// Uploads response, even if idempotent complete is possible.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Uploading Large Archives in Parts (Multipart Upload)](https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html)
  /// and
  /// [Complete Multipart Upload](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-complete-upload.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [uploadId]: The upload ID of the multipart upload.
  ///
  /// [archiveSize]: The total size, in bytes, of the entire archive. This value
  /// should be the sum of all the sizes of the individual parts that you
  /// uploaded.
  ///
  /// [checksum]: The SHA256 tree hash of the entire archive. It is the tree
  /// hash of SHA256 tree hash of the individual parts. If the value you specify
  /// in the request does not match the SHA256 tree hash of the final assembled
  /// archive as computed by Amazon S3 Glacier (Glacier), Glacier returns an
  /// error and the request fails.
  Future<ArchiveCreationOutput> completeMultipartUpload(
      {@required String accountId,
      @required String vaultName,
      @required String uploadId,
      String archiveSize,
      String checksum}) async {
    return ArchiveCreationOutput.fromJson({});
  }

  /// This operation completes the vault locking process by transitioning the
  /// vault lock from the `InProgress` state to the `Locked` state, which causes
  /// the vault lock policy to become unchangeable. A vault lock is put into the
  /// `InProgress` state by calling InitiateVaultLock. You can obtain the state
  /// of the vault lock by calling GetVaultLock. For more information about the
  /// vault locking process,
  /// [Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html).
  ///
  /// This operation is idempotent. This request is always successful if the
  /// vault lock is in the `Locked` state and the provided lock ID matches the
  /// lock ID originally used to lock the vault.
  ///
  /// If an invalid lock ID is passed in the request when the vault lock is in
  /// the `Locked` state, the operation returns an `AccessDeniedException`
  /// error. If an invalid lock ID is passed in the request when the vault lock
  /// is in the `InProgress` state, the operation throws an `InvalidParameter`
  /// error.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [lockId]: The `lockId` value is the lock ID obtained from a
  /// InitiateVaultLock request.
  Future<void> completeVaultLock(
      {@required String accountId,
      @required String vaultName,
      @required String lockId}) async {}

  /// This operation creates a new vault with the specified name. The name of
  /// the vault must be unique within a region for an AWS account. You can
  /// create up to 1,000 vaults per account. If you need to create more vaults,
  /// contact Amazon S3 Glacier.
  ///
  /// You must use the following guidelines when naming a vault.
  ///
  /// *   Names can be between 1 and 255 characters long.
  ///
  /// *   Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen),
  /// and '.' (period).
  ///
  ///
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Creating a Vault in Amazon Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/creating-vaults.html)
  /// and
  /// [Create Vault](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-put.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon S3 Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<CreateVaultOutput> createVault(
      {@required String accountId, @required String vaultName}) async {
    return CreateVaultOutput.fromJson({});
  }

  /// This operation deletes an archive from a vault. Subsequent requests to
  /// initiate a retrieval of this archive will fail. Archive retrievals that
  /// are in progress for this archive ID may or may not succeed according to
  /// the following scenarios:
  ///
  /// *   If the archive retrieval job is actively preparing the data for
  /// download when Amazon S3 Glacier receives the delete archive request, the
  /// archival retrieval operation might fail.
  ///
  /// *   If the archive retrieval job has successfully prepared the archive for
  /// download when Amazon S3 Glacier receives the delete archive request, you
  /// will be able to download the output.
  ///
  ///
  /// This operation is idempotent. Attempting to delete an already-deleted
  /// archive does not result in an error.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Deleting an Archive in Amazon Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-an-archive.html)
  /// and
  /// [Delete Archive](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [archiveId]: The ID of the archive to delete.
  Future<void> deleteArchive(
      {@required String accountId,
      @required String vaultName,
      @required String archiveId}) async {}

  /// This operation deletes a vault. Amazon S3 Glacier will delete a vault only
  /// if there are no archives in the vault as of the last inventory and there
  /// have been no writes to the vault since the last inventory. If either of
  /// these conditions is not satisfied, the vault deletion fails (that is, the
  /// vault is not removed) and Amazon S3 Glacier returns an error. You can use
  /// DescribeVault to return the number of archives in a vault, and you can use
  /// [Initiate a Job (POST jobs)](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html)
  /// to initiate a new inventory retrieval for a vault. The inventory contains
  /// the archive IDs you use to delete archives using
  /// [Delete Archive (DELETE archive)](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html).
  ///
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Deleting a Vault in Amazon Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-vaults.html)
  /// and
  /// [Delete Vault](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-delete.html)
  ///  in the _Amazon S3 Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<void> deleteVault(
      {@required String accountId, @required String vaultName}) async {}

  /// This operation deletes the access policy associated with the specified
  /// vault. The operation is eventually consistent; that is, it might take some
  /// time for Amazon S3 Glacier to completely remove the access policy, and you
  /// might still see the effect of the policy for a short time after you send
  /// the delete request.
  ///
  /// This operation is idempotent. You can invoke delete multiple times, even
  /// if there is no policy associated with the vault. For more information
  /// about vault access policies, see
  /// [Amazon Glacier Access Control with Vault Access Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<void> deleteVaultAccessPolicy(
      {@required String accountId, @required String vaultName}) async {}

  /// This operation deletes the notification configuration set for a vault. The
  /// operation is eventually consistent; that is, it might take some time for
  /// Amazon S3 Glacier to completely disable the notifications and you might
  /// still receive some notifications for a short time after you send the
  /// delete request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Configuring Vault Notifications in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html)
  /// and
  /// [Delete Vault Notification Configuration](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-delete.html)
  ///  in the Amazon S3 Glacier Developer Guide.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<void> deleteVaultNotifications(
      {@required String accountId, @required String vaultName}) async {}

  /// This operation returns information about a job you previously initiated,
  /// including the job initiation date, the user who initiated the job, the job
  /// status code/message and the Amazon SNS topic to notify after Amazon S3
  /// Glacier (Glacier) completes the job. For more information about initiating
  /// a job, see InitiateJob.
  ///
  ///  This operation enables you to check the status of your job. However, it
  /// is strongly recommended that you set up an Amazon SNS topic and specify it
  /// in your initiate job request so that Glacier can notify the topic after it
  /// completes the job.
  ///
  /// A job ID will not expire for at least 24 hours after Glacier completes the
  /// job.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For more information about using this operation, see the documentation
  /// for the underlying REST API
  /// [Describe Job](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-describe-job-get.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [jobId]: The ID of the job to describe.
  Future<GlacierJobDescription> describeJob(
      {@required String accountId,
      @required String vaultName,
      @required String jobId}) async {
    return GlacierJobDescription.fromJson({});
  }

  /// This operation returns information about a vault, including the vault's
  /// Amazon Resource Name (ARN), the date the vault was created, the number of
  /// archives it contains, and the total size of all the archives in the vault.
  /// The number of archives and their total size are as of the last inventory
  /// generation. This means that if you add or remove an archive from a vault,
  /// and then immediately use Describe Vault, the change in contents will not
  /// be immediately reflected. If you want to retrieve the latest inventory of
  /// the vault, use InitiateJob. Amazon S3 Glacier generates vault inventories
  /// approximately daily. For more information, see
  /// [Downloading a Vault Inventory in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html).
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and underlying REST API, see
  /// [Retrieving Vault Metadata in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html)
  /// and
  /// [Describe Vault](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-get.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<DescribeVaultOutput> describeVault(
      {@required String accountId, @required String vaultName}) async {
    return DescribeVaultOutput.fromJson({});
  }

  /// This operation returns the current data retrieval policy for the account
  /// and region specified in the GET request. For more information about data
  /// retrieval policies, see
  /// [Amazon Glacier Data Retrieval Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  Future<GetDataRetrievalPolicyOutput> getDataRetrievalPolicy(
      String accountId) async {
    return GetDataRetrievalPolicyOutput.fromJson({});
  }

  /// This operation downloads the output of the job you initiated using
  /// InitiateJob. Depending on the job type you specified when you initiated
  /// the job, the output will be either the content of an archive or a vault
  /// inventory.
  ///
  /// You can download all the job output or download a portion of the output by
  /// specifying a byte range. In the case of an archive retrieval job,
  /// depending on the byte range you specify, Amazon S3 Glacier (Glacier)
  /// returns the checksum for the portion of the data. You can compute the
  /// checksum on the client and verify that the values match to ensure the
  /// portion you downloaded is the correct data.
  ///
  /// A job ID will not expire for at least 24 hours after Glacier completes the
  /// job. That a byte range. For both archive and inventory retrieval jobs, you
  /// should verify the downloaded size against the size returned in the headers
  /// from the **Get Job Output** response.
  ///
  /// For archive retrieval jobs, you should also verify that the size is what
  /// you expected. If you download a portion of the output, the expected size
  /// is based on the range of bytes you specified. For example, if you specify
  /// a range of `bytes=0-1048575`, you should verify your download size is
  /// 1,048,576 bytes. If you download an entire archive, the expected size is
  /// the size of the archive when you uploaded it to Amazon S3 Glacier The
  /// expected size is also returned in the headers from the **Get Job Output**
  /// response.
  ///
  /// In the case of an archive retrieval job, depending on the byte range you
  /// specify, Glacier returns the checksum for the portion of the data. To
  /// ensure the portion you downloaded is the correct data, compute the
  /// checksum on the client, verify that the values match, and verify that the
  /// size is what you expected.
  ///
  /// A job ID does not expire for at least 24 hours after Glacier completes the
  /// job. That is, you can download the job output within the 24 hours period
  /// after Amazon Glacier completes the job.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and the underlying REST API, see
  /// [Downloading a Vault Inventory](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html),
  /// [Downloading an Archive](https://docs.aws.amazon.com/amazonglacier/latest/dev/downloading-an-archive.html),
  /// and
  /// [Get Job Output](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-job-output-get.html)
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [jobId]: The job ID whose data is downloaded.
  ///
  /// [range]: The range of bytes to retrieve from the output. For example, if
  /// you want to download the first 1,048,576 bytes, specify the range as
  /// `bytes=0-1048575`. By default, this operation downloads the entire output.
  ///
  /// If the job output is large, then you can use a range to retrieve a portion
  /// of the output. This allows you to download the entire output in smaller
  /// chunks of bytes. For example, suppose you have 1 GB of job output you want
  /// to download and you decide to download 128 MB chunks of data at a time,
  /// which is a total of eight Get Job Output requests. You use the following
  /// process to download the job output:
  ///
  /// 1.  Download a 128 MB chunk of output by specifying the appropriate byte
  /// range. Verify that all 128 MB of data was received.
  ///
  /// 2.  Along with the data, the response includes a SHA256 tree hash of the
  /// payload. You compute the checksum of the payload on the client and compare
  /// it with the checksum you received in the response to ensure you received
  /// all the expected data.
  ///
  /// 3.  Repeat steps 1 and 2 for all the eight 128 MB chunks of output data,
  /// each time specifying the appropriate byte range.
  ///
  /// 4.  After downloading all the parts of the job output, you have a list of
  /// eight checksum values. Compute the tree hash of these values to find the
  /// checksum of the entire output. Using the DescribeJob API, obtain job
  /// information of the job that provided you the output. The response includes
  /// the checksum of the entire archive stored in Amazon S3 Glacier. You
  /// compare this value with the checksum you computed to ensure you have
  /// downloaded the entire archive content with no errors.
  Future<GetJobOutputOutput> getJobOutput(
      {@required String accountId,
      @required String vaultName,
      @required String jobId,
      String range}) async {
    return GetJobOutputOutput.fromJson({});
  }

  /// This operation retrieves the `access-policy` subresource set on the vault;
  /// for more information on setting this subresource, see
  /// [Set Vault Access Policy (PUT access-policy)](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-SetVaultAccessPolicy.html).
  /// If there is no access policy set on the vault, the operation returns a
  /// `404 Not found` error. For more information about vault access policies,
  /// see
  /// [Amazon Glacier Access Control with Vault Access Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<GetVaultAccessPolicyOutput> getVaultAccessPolicy(
      {@required String accountId, @required String vaultName}) async {
    return GetVaultAccessPolicyOutput.fromJson({});
  }

  /// This operation retrieves the following attributes from the `lock-policy`
  /// subresource set on the specified vault:
  ///
  /// *   The vault lock policy set on the vault.
  ///
  /// *   The state of the vault lock, which is either `InProgess` or `Locked`.
  ///
  /// *   When the lock ID expires. The lock ID is used to complete the vault
  /// locking process.
  ///
  /// *   When the vault lock was initiated and put into the `InProgress` state.
  ///
  ///
  /// A vault lock is put into the `InProgress` state by calling
  /// InitiateVaultLock. A vault lock is put into the `Locked` state by calling
  /// CompleteVaultLock. You can abort the vault locking process by calling
  /// AbortVaultLock. For more information about the vault locking process,
  /// [Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html).
  ///
  /// If there is no vault lock policy set on the vault, the operation returns a
  /// `404 Not found` error. For more information about vault lock policies,
  /// [Amazon Glacier Access Control with Vault Lock Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<GetVaultLockOutput> getVaultLock(
      {@required String accountId, @required String vaultName}) async {
    return GetVaultLockOutput.fromJson({});
  }

  /// This operation retrieves the `notification-configuration` subresource of
  /// the specified vault.
  ///
  /// For information about setting a notification configuration on a vault, see
  /// SetVaultNotifications. If a notification configuration for a vault is not
  /// set, the operation returns a `404 Not Found` error. For more information
  /// about vault notifications, see
  /// [Configuring Vault Notifications in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html).
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and underlying REST API, see
  /// [Configuring Vault Notifications in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html)
  /// and
  /// [Get Vault Notification Configuration](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-get.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<GetVaultNotificationsOutput> getVaultNotifications(
      {@required String accountId, @required String vaultName}) async {
    return GetVaultNotificationsOutput.fromJson({});
  }

  /// This operation initiates a job of the specified type, which can be a
  /// select, an archival retrieval, or a vault retrieval. For more information
  /// about using this operation, see the documentation for the underlying REST
  /// API
  /// [Initiate a Job](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [jobParameters]: Provides options for specifying job information.
  Future<InitiateJobOutput> initiateJob(
      {@required String accountId,
      @required String vaultName,
      JobParameters jobParameters}) async {
    return InitiateJobOutput.fromJson({});
  }

  /// This operation initiates a multipart upload. Amazon S3 Glacier creates a
  /// multipart upload resource and returns its ID in the response. The
  /// multipart upload ID is used in subsequent requests to upload parts of an
  /// archive (see UploadMultipartPart).
  ///
  /// When you initiate a multipart upload, you specify the part size in number
  /// of bytes. The part size must be a megabyte (1024 KB) multiplied by a power
  /// of 2-for example, 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608
  /// (8 MB), and so on. The minimum allowable part size is 1 MB, and the
  /// maximum is 4 GB.
  ///
  /// Every part you upload to this resource (see UploadMultipartPart), except
  /// the last one, must have the same size. The last one can be the same size
  /// or smaller. For example, suppose you want to upload a 16.2 MB file. If you
  /// initiate the multipart upload with a part size of 4 MB, you will upload
  /// four parts of 4 MB each and one part of 0.2 MB.
  ///
  ///  You don't need to know the size of the archive when you start a multipart
  /// upload because Amazon S3 Glacier does not require you to specify the
  /// overall archive size.
  ///
  /// After you complete the multipart upload, Amazon S3 Glacier (Glacier)
  /// removes the multipart upload resource referenced by the ID. Glacier also
  /// removes the multipart upload resource if you cancel the multipart upload
  /// or it may be removed if there is no activity for a period of 24 hours.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and underlying REST API, see
  /// [Uploading Large Archives in Parts (Multipart Upload)](https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html)
  /// and
  /// [Initiate Multipart Upload](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-initiate-upload.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [archiveDescription]: The archive description that you are uploading in
  /// parts.
  ///
  /// The part size must be a megabyte (1024 KB) multiplied by a power of 2, for
  /// example 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608 (8 MB),
  /// and so on. The minimum allowable part size is 1 MB, and the maximum is 4
  /// GB (4096 MB).
  ///
  /// [partSize]: The size of each part except the last, in bytes. The last part
  /// can be smaller than this part size.
  Future<InitiateMultipartUploadOutput> initiateMultipartUpload(
      {@required String accountId,
      @required String vaultName,
      String archiveDescription,
      String partSize}) async {
    return InitiateMultipartUploadOutput.fromJson({});
  }

  /// This operation initiates the vault locking process by doing the following:
  ///
  /// *   Installing a vault lock policy on the specified vault.
  ///
  /// *   Setting the lock state of vault lock to `InProgress`.
  ///
  /// *   Returning a lock ID, which is used to complete the vault locking
  /// process.
  ///
  ///
  /// You can set one vault lock policy for each vault and this policy can be up
  /// to 20 KB in size. For more information about vault lock policies, see
  /// [Amazon Glacier Access Control with Vault Lock Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html).
  ///
  /// You must complete the vault locking process within 24 hours after the
  /// vault lock enters the `InProgress` state. After the 24 hour window ends,
  /// the lock ID expires, the vault automatically exits the `InProgress` state,
  /// and the vault lock policy is removed from the vault. You call
  /// CompleteVaultLock to complete the vault locking process by setting the
  /// state of the vault lock to `Locked`.
  ///
  /// After a vault lock is in the `Locked` state, you cannot initiate a new
  /// vault lock for the vault.
  ///
  /// You can abort the vault locking process by calling AbortVaultLock. You can
  /// get the state of the vault lock by calling GetVaultLock. For more
  /// information about the vault locking process,
  /// [Amazon Glacier Vault Lock](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html).
  ///
  /// If this operation is called when the vault lock is in the `InProgress`
  /// state, the operation returns an `AccessDeniedException` error. When the
  /// vault lock is in the `InProgress` state you must call AbortVaultLock
  /// before you can initiate a new vault lock policy.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [policy]: The vault lock policy as a JSON string, which uses "" as an
  /// escape character.
  Future<InitiateVaultLockOutput> initiateVaultLock(
      {@required String accountId,
      @required String vaultName,
      VaultLockPolicy policy}) async {
    return InitiateVaultLockOutput.fromJson({});
  }

  /// This operation lists jobs for a vault, including jobs that are in-progress
  /// and jobs that have recently finished. The List Job operation returns a
  /// list of these jobs sorted by job initiation time.
  ///
  ///  Amazon Glacier retains recently completed jobs for a period before
  /// deleting them; however, it eventually removes completed jobs. The output
  /// of completed jobs can be retrieved. Retaining completed jobs for a period
  /// of time after they have completed enables you to get a job output in the
  /// event you miss the job completion notification or your first attempt to
  /// download it fails. For example, suppose you start an archive retrieval job
  /// to download an archive. After the job completes, you start to download the
  /// archive but encounter a network error. In this scenario, you can retry and
  /// download the archive while the job exists.
  ///
  /// The List Jobs operation supports pagination. You should always check the
  /// response `Marker` field. If there are no more jobs to list, the `Marker`
  /// field is set to `null`. If there are more jobs to list, the `Marker` field
  /// is set to a non-null value, which you can use to continue the pagination
  /// of the list. To return a list of jobs that begins at a specific job, set
  /// the marker request parameter to the `Marker` value for that job that you
  /// obtained from a previous List Jobs request.
  ///
  /// You can set a maximum limit for the number of jobs returned in the
  /// response by specifying the `limit` parameter in the request. The default
  /// limit is 50. The number of jobs returned might be fewer than the limit,
  /// but the number of returned jobs never exceeds the limit.
  ///
  /// Additionally, you can filter the jobs list returned by specifying the
  /// optional `statuscode` parameter or `completed` parameter, or both. Using
  /// the `statuscode` parameter, you can specify to return only jobs that match
  /// either the `InProgress`, `Succeeded`, or `Failed` status. Using the
  /// `completed` parameter, you can specify to return only jobs that were
  /// completed (`true`) or jobs that were not completed (`false`).
  ///
  /// For more information about using this operation, see the documentation for
  /// the underlying REST API
  /// [List Jobs](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-jobs-get.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [limit]: The maximum number of jobs to be returned. The default limit is
  /// 50. The number of jobs returned might be fewer than the specified limit,
  /// but the number of returned jobs never exceeds the limit.
  ///
  /// [marker]: An opaque string used for pagination. This value specifies the
  /// job at which the listing of jobs should begin. Get the marker value from a
  /// previous List Jobs response. You only need to include the marker if you
  /// are continuing the pagination of results started in a previous List Jobs
  /// request.
  ///
  /// [statuscode]: The type of job status to return. You can specify the
  /// following values: `InProgress`, `Succeeded`, or `Failed`.
  ///
  /// [completed]: The state of the jobs to return. You can specify `true` or
  /// `false`.
  Future<ListJobsOutput> listJobs(
      {@required String accountId,
      @required String vaultName,
      String limit,
      String marker,
      String statuscode,
      String completed}) async {
    return ListJobsOutput.fromJson({});
  }

  /// This operation lists in-progress multipart uploads for the specified
  /// vault. An in-progress multipart upload is a multipart upload that has been
  /// initiated by an InitiateMultipartUpload request, but has not yet been
  /// completed or aborted. The list returned in the List Multipart Upload
  /// response has no guaranteed order.
  ///
  /// The List Multipart Uploads operation supports pagination. By default, this
  /// operation returns up to 50 multipart uploads in the response. You should
  /// always check the response for a `marker` at which to continue the list; if
  /// there are no more items the `marker` is `null`. To return a list of
  /// multipart uploads that begins at a specific upload, set the `marker`
  /// request parameter to the value you obtained from a previous List Multipart
  /// Upload request. You can also limit the number of uploads returned in the
  /// response by specifying the `limit` parameter in the request.
  ///
  /// Note the difference between this operation and listing parts (ListParts).
  /// The List Multipart Uploads operation lists all multipart uploads for a
  /// vault and does not require a multipart upload ID. The List Parts operation
  /// requires a multipart upload ID since parts are associated with a single
  /// upload.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and the underlying REST API, see
  /// [Working with Archives in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html)
  /// and
  /// [List Multipart Uploads](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-uploads.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [marker]: An opaque string used for pagination. This value specifies the
  /// upload at which the listing of uploads should begin. Get the marker value
  /// from a previous List Uploads response. You need only include the marker if
  /// you are continuing the pagination of results started in a previous List
  /// Uploads request.
  ///
  /// [limit]: Specifies the maximum number of uploads returned in the response
  /// body. If this value is not specified, the List Uploads operation returns
  /// up to 50 uploads.
  Future<ListMultipartUploadsOutput> listMultipartUploads(
      {@required String accountId,
      @required String vaultName,
      String marker,
      String limit}) async {
    return ListMultipartUploadsOutput.fromJson({});
  }

  /// This operation lists the parts of an archive that have been uploaded in a
  /// specific multipart upload. You can make this request at any time during an
  /// in-progress multipart upload before you complete the upload (see
  /// CompleteMultipartUpload. List Parts returns an error for completed
  /// uploads. The list returned in the List Parts response is sorted by part
  /// range.
  ///
  /// The List Parts operation supports pagination. By default, this operation
  /// returns up to 50 uploaded parts in the response. You should always check
  /// the response for a `marker` at which to continue the list; if there are no
  /// more items the `marker` is `null`. To return a list of parts that begins
  /// at a specific part, set the `marker` request parameter to the value you
  /// obtained from a previous List Parts request. You can also limit the number
  /// of parts returned in the response by specifying the `limit` parameter in
  /// the request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and the underlying REST API, see
  /// [Working with Archives in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html)
  /// and
  /// [List Parts](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-parts.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [uploadId]: The upload ID of the multipart upload.
  ///
  /// [marker]: An opaque string used for pagination. This value specifies the
  /// part at which the listing of parts should begin. Get the marker value from
  /// the response of a previous List Parts response. You need only include the
  /// marker if you are continuing the pagination of results started in a
  /// previous List Parts request.
  ///
  /// [limit]: The maximum number of parts to be returned. The default limit is
  /// 50. The number of parts returned might be fewer than the specified limit,
  /// but the number of returned parts never exceeds the limit.
  Future<ListPartsOutput> listParts(
      {@required String accountId,
      @required String vaultName,
      @required String uploadId,
      String marker,
      String limit}) async {
    return ListPartsOutput.fromJson({});
  }

  /// This operation lists the provisioned capacity units for the specified AWS
  /// account.
  ///
  /// [accountId]: The AWS account ID of the account that owns the vault. You
  /// can either specify an AWS account ID or optionally a single '-' (hyphen),
  /// in which case Amazon S3 Glacier uses the AWS account ID associated with
  /// the credentials used to sign the request. If you use an account ID, don't
  /// include any hyphens ('-') in the ID.
  Future<ListProvisionedCapacityOutput> listProvisionedCapacity(
      String accountId) async {
    return ListProvisionedCapacityOutput.fromJson({});
  }

  /// This operation lists all the tags attached to a vault. The operation
  /// returns an empty map if there are no tags. For more information about
  /// tags, see
  /// [Tagging Amazon S3 Glacier Resources](https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  Future<ListTagsForVaultOutput> listTagsForVault(
      {@required String accountId, @required String vaultName}) async {
    return ListTagsForVaultOutput.fromJson({});
  }

  /// This operation lists all vaults owned by the calling user's account. The
  /// list returned in the response is ASCII-sorted by vault name.
  ///
  /// By default, this operation returns up to 10 items. If there are more
  /// vaults to list, the response `marker` field contains the vault Amazon
  /// Resource Name (ARN) at which to continue the list with a new List Vaults
  /// request; otherwise, the `marker` field is `null`. To return a list of
  /// vaults that begins at a specific vault, set the `marker` request parameter
  /// to the vault ARN you obtained from a previous List Vaults request. You can
  /// also limit the number of vaults returned in the response by specifying the
  /// `limit` parameter in the request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and underlying REST API, see
  /// [Retrieving Vault Metadata in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html)
  /// and
  /// [List Vaults](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vaults-get.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [marker]: A string used for pagination. The marker specifies the vault ARN
  /// after which the listing of vaults should begin.
  ///
  /// [limit]: The maximum number of vaults to be returned. The default limit is
  /// 10. The number of vaults returned might be fewer than the specified limit,
  /// but the number of returned vaults never exceeds the limit.
  Future<ListVaultsOutput> listVaults(String accountId,
      {String marker, String limit}) async {
    return ListVaultsOutput.fromJson({});
  }

  /// This operation purchases a provisioned capacity unit for an AWS account.
  ///
  /// [accountId]: The AWS account ID of the account that owns the vault. You
  /// can either specify an AWS account ID or optionally a single '-' (hyphen),
  /// in which case Amazon S3 Glacier uses the AWS account ID associated with
  /// the credentials used to sign the request. If you use an account ID, don't
  /// include any hyphens ('-') in the ID.
  Future<PurchaseProvisionedCapacityOutput> purchaseProvisionedCapacity(
      String accountId) async {
    return PurchaseProvisionedCapacityOutput.fromJson({});
  }

  /// This operation removes one or more tags from the set of tags attached to a
  /// vault. For more information about tags, see
  /// [Tagging Amazon S3 Glacier Resources](https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html).
  /// This operation is idempotent. The operation will be successful, even if
  /// there are no tags attached to the vault.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [tagKeys]: A list of tag keys. Each corresponding tag is removed from the
  /// vault.
  Future<void> removeTagsFromVault(
      {@required String accountId,
      @required String vaultName,
      List<String> tagKeys}) async {}

  /// This operation sets and then enacts a data retrieval policy in the region
  /// specified in the PUT request. You can set one policy per region for an AWS
  /// account. The policy is enacted within a few minutes of a successful PUT
  /// operation.
  ///
  /// The set policy operation does not affect retrieval jobs that were in
  /// progress before the policy was enacted. For more information about data
  /// retrieval policies, see
  /// [Amazon Glacier Data Retrieval Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '`-`' (hyphen), in which case Amazon Glacier uses the AWS account ID
  /// associated with the credentials used to sign the request. If you specify
  /// your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// [policy]: The data retrieval policy in JSON format.
  Future<void> setDataRetrievalPolicy(String accountId,
      {DataRetrievalPolicy policy}) async {}

  /// This operation configures an access policy for a vault and will overwrite
  /// an existing policy. To configure a vault access policy, send a PUT request
  /// to the `access-policy` subresource of the vault. An access policy is
  /// specific to a vault and is also called a vault subresource. You can set
  /// one access policy per vault and the policy can be up to 20 KB in size. For
  /// more information about vault access policies, see
  /// [Amazon Glacier Access Control with Vault Access Policies](https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html).
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [policy]: The vault access policy as a JSON string.
  Future<void> setVaultAccessPolicy(
      {@required String accountId,
      @required String vaultName,
      VaultAccessPolicy policy}) async {}

  /// This operation configures notifications that will be sent when specific
  /// events happen to a vault. By default, you don't get any notifications.
  ///
  /// To configure vault notifications, send a PUT request to the
  /// `notification-configuration` subresource of the vault. The request should
  /// include a JSON document that provides an Amazon SNS topic and specific
  /// events for which you want Amazon S3 Glacier to send notifications to the
  /// topic.
  ///
  /// Amazon SNS topics must grant permission to the vault to be allowed to
  /// publish notifications to the topic. You can configure a vault to publish a
  /// notification for the following vault events:
  ///
  /// *    **ArchiveRetrievalCompleted** This event occurs when a job that was
  /// initiated for an archive retrieval is completed (InitiateJob). The status
  /// of the completed job can be "Succeeded" or "Failed". The notification sent
  /// to the SNS topic is the same output as returned from DescribeJob.
  ///
  /// *    **InventoryRetrievalCompleted** This event occurs when a job that was
  /// initiated for an inventory retrieval is completed (InitiateJob). The
  /// status of the completed job can be "Succeeded" or "Failed". The
  /// notification sent to the SNS topic is the same output as returned from
  /// DescribeJob.
  ///
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  /// For conceptual information and underlying REST API, see
  /// [Configuring Vault Notifications in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html)
  /// and
  /// [Set Vault Notification Configuration](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-put.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [vaultNotificationConfig]: Provides options for specifying notification
  /// configuration.
  Future<void> setVaultNotifications(
      {@required String accountId,
      @required String vaultName,
      VaultNotificationConfig vaultNotificationConfig}) async {}

  /// This operation adds an archive to a vault. This is a synchronous
  /// operation, and for a successful upload, your data is durably persisted.
  /// Amazon S3 Glacier returns the archive ID in the `x-amz-archive-id` header
  /// of the response.
  ///
  /// You must use the archive ID to access your data in Amazon S3 Glacier.
  /// After you upload an archive, you should save the archive ID returned so
  /// that you can retrieve or delete the archive later. Besides saving the
  /// archive ID, you can also index it and give it a friendly name to allow for
  /// better searching. You can also use the optional archive description field
  /// to specify how the archive is referred to in an external index of
  /// archives, such as you might create in Amazon DynamoDB. You can also get
  /// the vault inventory to obtain a list of archive IDs in a vault. For more
  /// information, see InitiateJob.
  ///
  /// You must provide a SHA256 tree hash of the data you are uploading. For
  /// information about computing a SHA256 tree hash, see
  /// [Computing Checksums](https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html).
  ///
  /// You can optionally specify an archive description of up to 1,024 printable
  /// ASCII characters. You can get the archive description when you either
  /// retrieve the archive or get the vault inventory. For more information, see
  /// InitiateJob. Amazon Glacier does not interpret the description in any way.
  /// An archive description does not need to be unique. You cannot use the
  /// description to retrieve or sort the archive list.
  ///
  /// Archives are immutable. After you upload an archive, you cannot edit the
  /// archive or its description.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Uploading an Archive in Amazon Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-an-archive.html)
  /// and
  /// [Upload Archive](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-post.html)
  /// in the _Amazon Glacier Developer Guide_.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [archiveDescription]: The optional description of the archive you are
  /// uploading.
  ///
  /// [checksum]: The SHA256 tree hash of the data being uploaded.
  ///
  /// [body]: The data to upload.
  Future<ArchiveCreationOutput> uploadArchive(
      {@required String vaultName,
      @required String accountId,
      String archiveDescription,
      String checksum,
      Uint8List body}) async {
    return ArchiveCreationOutput.fromJson({});
  }

  /// This operation uploads a part of an archive. You can upload archive parts
  /// in any order. You can also upload them in parallel. You can upload up to
  /// 10,000 parts for a multipart upload.
  ///
  /// Amazon Glacier rejects your upload part request if any of the following
  /// conditions is true:
  ///
  /// *    **SHA256 tree hash does not match**To ensure that part data is not
  /// corrupted in transmission, you compute a SHA256 tree hash of the part and
  /// include it in your request. Upon receiving the part data, Amazon S3
  /// Glacier also computes a SHA256 tree hash. If these hash values don't
  /// match, the operation fails. For information about computing a SHA256 tree
  /// hash, see
  /// [Computing Checksums](https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html).
  ///
  /// *    **Part size does not match**The size of each part except the last
  /// must match the size specified in the corresponding InitiateMultipartUpload
  /// request. The size of the last part must be the same size as, or smaller
  /// than, the specified size.
  ///
  ///      If you upload a part whose size is smaller than the part size you
  /// specified in your initiate multipart upload request and that part is not
  /// the last part, then the upload part request will succeed. However, the
  /// subsequent Complete Multipart Upload request will fail.
  /// *    **Range does not align**The byte range value in the request does not
  /// align with the part size specified in the corresponding initiate request.
  /// For example, if you specify a part size of 4194304 bytes (4 MB), then 0 to
  /// 4194303 bytes (4 MB - 1) and 4194304 (4 MB) to 8388607 (8 MB - 1) are
  /// valid part ranges. However, if you set a range value of 2 MB to 6 MB, the
  /// range does not align with the part size and the upload will fail.
  ///
  ///
  /// This operation is idempotent. If you upload the same part multiple times,
  /// the data included in the most recent request overwrites the previously
  /// uploaded data.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see
  /// [Access Control Using AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html).
  ///
  ///  For conceptual information and underlying REST API, see
  /// [Uploading Large Archives in Parts (Multipart Upload)](https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html)
  /// and
  /// [Upload Part](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-upload-part.html)
  ///  in the _Amazon Glacier Developer Guide_.
  ///
  /// [accountId]: The `AccountId` value is the AWS account ID of the account
  /// that owns the vault. You can either specify an AWS account ID or
  /// optionally a single '`-`' (hyphen), in which case Amazon S3 Glacier uses
  /// the AWS account ID associated with the credentials used to sign the
  /// request. If you use an account ID, do not include any hyphens ('-') in the
  /// ID.
  ///
  /// [vaultName]: The name of the vault.
  ///
  /// [uploadId]: The upload ID of the multipart upload.
  ///
  /// [checksum]: The SHA256 tree hash of the data being uploaded.
  ///
  /// [range]: Identifies the range of bytes in the assembled archive that will
  /// be uploaded in this part. Amazon S3 Glacier uses this information to
  /// assemble the archive in the proper sequence. The format of this header
  /// follows RFC 2616. An example header is Content-Range:bytes 0-4194303/*.
  ///
  /// [body]: The data to upload.
  Future<UploadMultipartPartOutput> uploadMultipartPart(
      {@required String accountId,
      @required String vaultName,
      @required String uploadId,
      String checksum,
      String range,
      Uint8List body}) async {
    return UploadMultipartPartOutput.fromJson({});
  }
}

/// Contains the Amazon S3 Glacier response to your request.
///
/// For information about the underlying REST API, see
/// [Upload Archive](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-post.html).
/// For conceptual information, see
/// [Working with Archives in Amazon S3 Glacier](https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html).
class ArchiveCreationOutput {
  /// The relative URI path of the newly added archive resource.
  final String location;

  /// The checksum of the archive computed by Amazon S3 Glacier.
  final String checksum;

  /// The ID of the archive. This value is also included as part of the
  /// location.
  final String archiveId;

  ArchiveCreationOutput({
    this.location,
    this.checksum,
    this.archiveId,
  });
  static ArchiveCreationOutput fromJson(Map<String, dynamic> json) =>
      ArchiveCreationOutput();
}

/// Contains information about the comma-separated value (CSV) file to select
/// from.
class CsvInput {
  /// Describes the first line of input. Valid values are `None`, `Ignore`, and
  /// `Use`.
  final String fileHeaderInfo;

  /// A single character used to indicate that a row should be ignored when the
  /// character is present at the start of that row.
  final String comments;

  /// A single character used for escaping the quotation-mark character inside
  /// an already escaped value.
  final String quoteEscapeCharacter;

  /// A value used to separate individual records from each other.
  final String recordDelimiter;

  /// A value used to separate individual fields from each other within a
  /// record.
  final String fieldDelimiter;

  /// A value used as an escape character where the field delimiter is part of
  /// the value.
  final String quoteCharacter;

  CsvInput({
    this.fileHeaderInfo,
    this.comments,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
    this.fieldDelimiter,
    this.quoteCharacter,
  });
  static CsvInput fromJson(Map<String, dynamic> json) => CsvInput();
}

/// Contains information about the comma-separated value (CSV) file that the job
/// results are stored in.
class CsvOutput {
  /// A value that indicates whether all output fields should be contained
  /// within quotation marks.
  final String quoteFields;

  /// A single character used for escaping the quotation-mark character inside
  /// an already escaped value.
  final String quoteEscapeCharacter;

  /// A value used to separate individual records from each other.
  final String recordDelimiter;

  /// A value used to separate individual fields from each other within a
  /// record.
  final String fieldDelimiter;

  /// A value used as an escape character where the field delimiter is part of
  /// the value.
  final String quoteCharacter;

  CsvOutput({
    this.quoteFields,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
    this.fieldDelimiter,
    this.quoteCharacter,
  });
  static CsvOutput fromJson(Map<String, dynamic> json) => CsvOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class CreateVaultOutput {
  /// The URI of the vault that was created.
  final String location;

  CreateVaultOutput({
    this.location,
  });
  static CreateVaultOutput fromJson(Map<String, dynamic> json) =>
      CreateVaultOutput();
}

/// Data retrieval policy.
class DataRetrievalPolicy {
  /// The policy rule. Although this is a list type, currently there must be
  /// only one rule, which contains a Strategy field and optionally a
  /// BytesPerHour field.
  final List<DataRetrievalRule> rules;

  DataRetrievalPolicy({
    this.rules,
  });
  static DataRetrievalPolicy fromJson(Map<String, dynamic> json) =>
      DataRetrievalPolicy();
}

/// Data retrieval policy rule.
class DataRetrievalRule {
  /// The type of data retrieval policy to set.
  ///
  /// Valid values: BytesPerHour|FreeTier|None
  final String strategy;

  /// The maximum number of bytes that can be retrieved in an hour.
  ///
  /// This field is required only if the value of the Strategy field is
  /// `BytesPerHour`. Your PUT operation will be rejected if the Strategy field
  /// is not set to `BytesPerHour` and you set this field.
  final BigInt bytesPerHour;

  DataRetrievalRule({
    this.strategy,
    this.bytesPerHour,
  });
  static DataRetrievalRule fromJson(Map<String, dynamic> json) =>
      DataRetrievalRule();
}

/// Contains the Amazon S3 Glacier response to your request.
class DescribeVaultOutput {
  /// The Amazon Resource Name (ARN) of the vault.
  final String vaultArn;

  /// The name of the vault.
  final String vaultName;

  /// The Universal Coordinated Time (UTC) date when the vault was created. This
  /// value should be a string in the ISO 8601 date format, for example
  /// `2012-03-20T17:03:43.221Z`.
  final String creationDate;

  /// The Universal Coordinated Time (UTC) date when Amazon S3 Glacier completed
  /// the last vault inventory. This value should be a string in the ISO 8601
  /// date format, for example `2012-03-20T17:03:43.221Z`.
  final String lastInventoryDate;

  /// The number of archives in the vault as of the last inventory date. This
  /// field will return `null` if an inventory has not yet run on the vault, for
  /// example if you just created the vault.
  final BigInt numberOfArchives;

  /// Total size, in bytes, of the archives in the vault as of the last
  /// inventory date. This field will return null if an inventory has not yet
  /// run on the vault, for example if you just created the vault.
  final BigInt sizeInBytes;

  DescribeVaultOutput({
    this.vaultArn,
    this.vaultName,
    this.creationDate,
    this.lastInventoryDate,
    this.numberOfArchives,
    this.sizeInBytes,
  });
  static DescribeVaultOutput fromJson(Map<String, dynamic> json) =>
      DescribeVaultOutput();
}

/// Contains information about the encryption used to store the job results in
/// Amazon S3.
class Encryption {
  /// The server-side encryption algorithm used when storing job results in
  /// Amazon S3, for example `AES256` or `aws:kms`.
  final String encryptionType;

  /// The AWS KMS key ID to use for object encryption. All GET and PUT requests
  /// for an object protected by AWS KMS fail if not made by using Secure
  /// Sockets Layer (SSL) or Signature Version 4.
  final String kmsKeyId;

  /// Optional. If the encryption type is `aws:kms`, you can use this value to
  /// specify the encryption context for the job results.
  final String kmsContext;

  Encryption({
    this.encryptionType,
    this.kmsKeyId,
    this.kmsContext,
  });
  static Encryption fromJson(Map<String, dynamic> json) => Encryption();
}

/// Contains the Amazon S3 Glacier response to the `GetDataRetrievalPolicy`
/// request.
class GetDataRetrievalPolicyOutput {
  /// Contains the returned data retrieval policy in JSON format.
  final DataRetrievalPolicy policy;

  GetDataRetrievalPolicyOutput({
    this.policy,
  });
  static GetDataRetrievalPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetDataRetrievalPolicyOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class GetJobOutputOutput {
  /// The job data, either archive data or inventory data.
  final Uint8List body;

  /// The checksum of the data in the response. This header is returned only
  /// when retrieving the output for an archive retrieval job. Furthermore, this
  /// header appears only under the following conditions:
  ///
  /// *   You get the entire range of the archive.
  ///
  /// *   You request a range to return of the archive that starts and ends on a
  /// multiple of 1 MB. For example, if you have an 3.1 MB archive and you
  /// specify a range to return that starts at 1 MB and ends at 2 MB, then the
  /// x-amz-sha256-tree-hash is returned as a response header.
  ///
  /// *   You request a range of the archive to return that starts on a multiple
  /// of 1 MB and goes to the end of the archive. For example, if you have a 3.1
  /// MB archive and you specify a range that starts at 2 MB and ends at 3.1 MB
  /// (the end of the archive), then the x-amz-sha256-tree-hash is returned as a
  /// response header.
  final String checksum;

  /// The HTTP response code for a job output request. The value depends on
  /// whether a range was specified in the request.
  final int status;

  /// The range of bytes returned by Amazon S3 Glacier. If only partial output
  /// is downloaded, the response provides the range of bytes Amazon S3 Glacier
  /// returned. For example, bytes 0-1048575/8388608 returns the first 1 MB from
  /// 8 MB.
  final String contentRange;

  /// Indicates the range units accepted. For more information, see
  /// [RFC2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).
  final String acceptRanges;

  /// The Content-Type depends on whether the job output is an archive or a
  /// vault inventory. For archive data, the Content-Type is
  /// application/octet-stream. For vault inventory, if you requested CSV format
  /// when you initiated the job, the Content-Type is text/csv. Otherwise, by
  /// default, vault inventory is returned as JSON, and the Content-Type is
  /// application/json.
  final String contentType;

  /// The description of an archive.
  final String archiveDescription;

  GetJobOutputOutput({
    this.body,
    this.checksum,
    this.status,
    this.contentRange,
    this.acceptRanges,
    this.contentType,
    this.archiveDescription,
  });
  static GetJobOutputOutput fromJson(Map<String, dynamic> json) =>
      GetJobOutputOutput();
}

/// Output for GetVaultAccessPolicy.
class GetVaultAccessPolicyOutput {
  /// Contains the returned vault access policy as a JSON string.
  final VaultAccessPolicy policy;

  GetVaultAccessPolicyOutput({
    this.policy,
  });
  static GetVaultAccessPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetVaultAccessPolicyOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class GetVaultLockOutput {
  /// The vault lock policy as a JSON string, which uses "" as an escape
  /// character.
  final String policy;

  /// The state of the vault lock. `InProgress` or `Locked`.
  final String state;

  /// The UTC date and time at which the lock ID expires. This value can be
  /// `null` if the vault lock is in a `Locked` state.
  final String expirationDate;

  /// The UTC date and time at which the vault lock was put into the
  /// `InProgress` state.
  final String creationDate;

  GetVaultLockOutput({
    this.policy,
    this.state,
    this.expirationDate,
    this.creationDate,
  });
  static GetVaultLockOutput fromJson(Map<String, dynamic> json) =>
      GetVaultLockOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class GetVaultNotificationsOutput {
  /// Returns the notification configuration set on the vault.
  final VaultNotificationConfig vaultNotificationConfig;

  GetVaultNotificationsOutput({
    this.vaultNotificationConfig,
  });
  static GetVaultNotificationsOutput fromJson(Map<String, dynamic> json) =>
      GetVaultNotificationsOutput();
}

/// Contains the description of an Amazon S3 Glacier job.
class GlacierJobDescription {
  /// An opaque string that identifies an Amazon S3 Glacier job.
  final String jobId;

  /// The job description provided when initiating the job.
  final String jobDescription;

  /// The job type. This value is either `ArchiveRetrieval`,
  /// `InventoryRetrieval`, or `Select`.
  final String action;

  /// The archive ID requested for a select job or archive retrieval. Otherwise,
  /// this field is null.
  final String archiveId;

  /// The Amazon Resource Name (ARN) of the vault from which an archive
  /// retrieval was requested.
  final String vaultArn;

  /// The UTC date when the job was created. This value is a string
  /// representation of ISO 8601 date format, for example
  /// `"2012-03-20T17:03:43.221Z"`.
  final String creationDate;

  /// The job status. When a job is completed, you get the job's output using
  /// Get Job Output (GET output).
  final bool completed;

  /// The status code can be `InProgress`, `Succeeded`, or `Failed`, and
  /// indicates the status of the job.
  final String statusCode;

  /// A friendly message that describes the job status.
  final String statusMessage;

  /// For an archive retrieval job, this value is the size in bytes of the
  /// archive being requested for download. For an inventory retrieval or select
  /// job, this value is null.
  final BigInt archiveSizeInBytes;

  /// For an inventory retrieval job, this value is the size in bytes of the
  /// inventory requested for download. For an archive retrieval or select job,
  /// this value is null.
  final BigInt inventorySizeInBytes;

  /// An Amazon SNS topic that receives notification.
  final String snsTopic;

  /// The UTC time that the job request completed. While the job is in progress,
  /// the value is null.
  final String completionDate;

  /// For an archive retrieval job, this value is the checksum of the archive.
  /// Otherwise, this value is null.
  ///
  /// The SHA256 tree hash value for the requested range of an archive. If the
  /// **InitiateJob** request for an archive specified a tree-hash aligned
  /// range, then this field returns a value.
  ///
  /// If the whole archive is retrieved, this value is the same as the
  /// ArchiveSHA256TreeHash value.
  ///
  /// This field is null for the following:
  ///
  /// *   Archive retrieval jobs that specify a range that is not tree-hash
  /// aligned
  ///
  ///
  /// *   Archival jobs that specify a range that is equal to the whole archive,
  /// when the job status is `InProgress`
  ///
  ///
  /// *   Inventory jobs
  ///
  /// *   Select jobs
  final String sha256TreeHash;

  /// The SHA256 tree hash of the entire archive for an archive retrieval. For
  /// inventory retrieval or select jobs, this field is null.
  final String archiveSha256TreeHash;

  /// The retrieved byte range for archive retrieval jobs in the form
  /// _StartByteValue_-_EndByteValue_. If no range was specified in the archive
  /// retrieval, then the whole archive is retrieved. In this case,
  /// _StartByteValue_ equals 0 and _EndByteValue_ equals the size of the
  /// archive minus 1. For inventory retrieval or select jobs, this field is
  /// null.
  final String retrievalByteRange;

  /// The tier to use for a select or an archive retrieval. Valid values are
  /// `Expedited`, `Standard`, or `Bulk`. `Standard` is the default.
  final String tier;

  /// Parameters used for range inventory retrieval.
  final InventoryRetrievalJobDescription inventoryRetrievalParameters;

  /// Contains the job output location.
  final String jobOutputPath;

  /// Contains the parameters used for a select.
  final SelectParameters selectParameters;

  /// Contains the location where the data from the select job is stored.
  final OutputLocation outputLocation;

  GlacierJobDescription({
    this.jobId,
    this.jobDescription,
    this.action,
    this.archiveId,
    this.vaultArn,
    this.creationDate,
    this.completed,
    this.statusCode,
    this.statusMessage,
    this.archiveSizeInBytes,
    this.inventorySizeInBytes,
    this.snsTopic,
    this.completionDate,
    this.sha256TreeHash,
    this.archiveSha256TreeHash,
    this.retrievalByteRange,
    this.tier,
    this.inventoryRetrievalParameters,
    this.jobOutputPath,
    this.selectParameters,
    this.outputLocation,
  });
  static GlacierJobDescription fromJson(Map<String, dynamic> json) =>
      GlacierJobDescription();
}

/// Contains information about a grant.
class Grant {
  /// The grantee.
  final Grantee grantee;

  /// Specifies the permission given to the grantee.
  final String permission;

  Grant({
    this.grantee,
    this.permission,
  });
  static Grant fromJson(Map<String, dynamic> json) => Grant();
}

/// Contains information about the grantee.
class Grantee {
  /// Type of grantee
  final String type;

  /// Screen name of the grantee.
  final String displayName;

  /// URI of the grantee group.
  final String uri;

  /// The canonical user ID of the grantee.
  final String id;

  /// Email address of the grantee.
  final String emailAddress;

  Grantee({
    @required this.type,
    this.displayName,
    this.uri,
    this.id,
    this.emailAddress,
  });
  static Grantee fromJson(Map<String, dynamic> json) => Grantee();
}

/// Contains the Amazon S3 Glacier response to your request.
class InitiateJobOutput {
  /// The relative URI path of the job.
  final String location;

  /// The ID of the job.
  final String jobId;

  /// The path to the location of where the select results are stored.
  final String jobOutputPath;

  InitiateJobOutput({
    this.location,
    this.jobId,
    this.jobOutputPath,
  });
  static InitiateJobOutput fromJson(Map<String, dynamic> json) =>
      InitiateJobOutput();
}

/// The Amazon S3 Glacier response to your request.
class InitiateMultipartUploadOutput {
  /// The relative URI path of the multipart upload ID Amazon S3 Glacier
  /// created.
  final String location;

  /// The ID of the multipart upload. This value is also included as part of the
  /// location.
  final String uploadId;

  InitiateMultipartUploadOutput({
    this.location,
    this.uploadId,
  });
  static InitiateMultipartUploadOutput fromJson(Map<String, dynamic> json) =>
      InitiateMultipartUploadOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class InitiateVaultLockOutput {
  /// The lock ID, which is used to complete the vault locking process.
  final String lockId;

  InitiateVaultLockOutput({
    this.lockId,
  });
  static InitiateVaultLockOutput fromJson(Map<String, dynamic> json) =>
      InitiateVaultLockOutput();
}

/// Describes how the archive is serialized.
class InputSerialization {
  /// Describes the serialization of a CSV-encoded object.
  final CsvInput csv;

  InputSerialization({
    this.csv,
  });
  static InputSerialization fromJson(Map<String, dynamic> json) =>
      InputSerialization();
}

/// Describes the options for a range inventory retrieval job.
class InventoryRetrievalJobDescription {
  /// The output format for the vault inventory list, which is set by the
  /// **InitiateJob** request when initiating a job to retrieve a vault
  /// inventory. Valid values are `CSV` and `JSON`.
  final String format;

  /// The start of the date range in Universal Coordinated Time (UTC) for vault
  /// inventory retrieval that includes archives created on or after this date.
  /// This value should be a string in the ISO 8601 date format, for example
  /// `2013-03-20T17:03:43Z`.
  final String startDate;

  /// The end of the date range in UTC for vault inventory retrieval that
  /// includes archives created before this date. This value should be a string
  /// in the ISO 8601 date format, for example `2013-03-20T17:03:43Z`.
  final String endDate;

  /// The maximum number of inventory items returned per vault inventory
  /// retrieval request. This limit is set when initiating the job with the a
  /// **InitiateJob** request.
  final String limit;

  /// An opaque string that represents where to continue pagination of the vault
  /// inventory retrieval results. You use the marker in a new **InitiateJob**
  /// request to obtain additional inventory items. If there are no more
  /// inventory items, this value is `null`. For more information, see
  /// [Range Inventory Retrieval](https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html#api-initiate-job-post-vault-inventory-list-filtering).
  final String marker;

  InventoryRetrievalJobDescription({
    this.format,
    this.startDate,
    this.endDate,
    this.limit,
    this.marker,
  });
  static InventoryRetrievalJobDescription fromJson(Map<String, dynamic> json) =>
      InventoryRetrievalJobDescription();
}

/// Provides options for specifying a range inventory retrieval job.
class InventoryRetrievalJobInput {
  /// The start of the date range in UTC for vault inventory retrieval that
  /// includes archives created on or after this date. This value should be a
  /// string in the ISO 8601 date format, for example `2013-03-20T17:03:43Z`.
  final String startDate;

  /// The end of the date range in UTC for vault inventory retrieval that
  /// includes archives created before this date. This value should be a string
  /// in the ISO 8601 date format, for example `2013-03-20T17:03:43Z`.
  final String endDate;

  /// Specifies the maximum number of inventory items returned per vault
  /// inventory retrieval request. Valid values are greater than or equal to 1.
  final String limit;

  /// An opaque string that represents where to continue pagination of the vault
  /// inventory retrieval results. You use the marker in a new **InitiateJob**
  /// request to obtain additional inventory items. If there are no more
  /// inventory items, this value is `null`.
  final String marker;

  InventoryRetrievalJobInput({
    this.startDate,
    this.endDate,
    this.limit,
    this.marker,
  });
}

/// Provides options for defining a job.
class JobParameters {
  /// When initiating a job to retrieve a vault inventory, you can optionally
  /// add this parameter to your request to specify the output format. If you
  /// are initiating an inventory job and do not specify a Format field, JSON is
  /// the default format. Valid values are "CSV" and "JSON".
  final String format;

  /// The job type. You can initiate a job to perform a select query on an
  /// archive, retrieve an archive, or get an inventory of a vault. Valid values
  /// are "select", "archive-retrieval" and "inventory-retrieval".
  final String type;

  /// The ID of the archive that you want to retrieve. This field is required
  /// only if `Type` is set to `select` or `archive-retrieval`code>. An error
  /// occurs if you specify this request parameter for an inventory retrieval
  /// job request.
  final String archiveId;

  /// The optional description for the job. The description must be less than or
  /// equal to 1,024 bytes. The allowable characters are 7-bit ASCII without
  /// control codes-specifically, ASCII values 32-126 decimal or 0x20-0x7E
  /// hexadecimal.
  final String description;

  /// The Amazon SNS topic ARN to which Amazon S3 Glacier sends a notification
  /// when the job is completed and the output is ready for you to download. The
  /// specified topic publishes the notification to its subscribers. The SNS
  /// topic must exist.
  final String snsTopic;

  /// The byte range to retrieve for an archive retrieval. in the form
  /// "_StartByteValue_-_EndByteValue_" If not specified, the whole archive is
  /// retrieved. If specified, the byte range must be megabyte (1024*1024)
  /// aligned which means that _StartByteValue_ must be divisible by 1 MB and
  /// _EndByteValue_ plus 1 must be divisible by 1 MB or be the end of the
  /// archive specified as the archive byte size value minus 1. If
  /// RetrievalByteRange is not megabyte aligned, this operation returns a 400
  /// response.
  ///
  /// An error occurs if you specify this field for an inventory retrieval job
  /// request.
  final String retrievalByteRange;

  /// The tier to use for a select or an archive retrieval job. Valid values are
  /// `Expedited`, `Standard`, or `Bulk`. `Standard` is the default.
  final String tier;

  /// Input parameters used for range inventory retrieval.
  final InventoryRetrievalJobInput inventoryRetrievalParameters;

  /// Contains the parameters that define a job.
  final SelectParameters selectParameters;

  /// Contains information about the location where the select job results are
  /// stored.
  final OutputLocation outputLocation;

  JobParameters({
    this.format,
    this.type,
    this.archiveId,
    this.description,
    this.snsTopic,
    this.retrievalByteRange,
    this.tier,
    this.inventoryRetrievalParameters,
    this.selectParameters,
    this.outputLocation,
  });
}

/// Contains the Amazon S3 Glacier response to your request.
class ListJobsOutput {
  /// A list of job objects. Each job object contains metadata describing the
  /// job.
  final List<GlacierJobDescription> jobList;

  ///  An opaque string used for pagination that specifies the job at which the
  /// listing of jobs should begin. You get the `marker` value from a previous
  /// List Jobs response. You only need to include the marker if you are
  /// continuing the pagination of the results started in a previous List Jobs
  /// request.
  final String marker;

  ListJobsOutput({
    this.jobList,
    this.marker,
  });
  static ListJobsOutput fromJson(Map<String, dynamic> json) => ListJobsOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class ListMultipartUploadsOutput {
  /// A list of in-progress multipart uploads.
  final List<UploadListElement> uploadsList;

  /// An opaque string that represents where to continue pagination of the
  /// results. You use the marker in a new List Multipart Uploads request to
  /// obtain more uploads in the list. If there are no more uploads, this value
  /// is `null`.
  final String marker;

  ListMultipartUploadsOutput({
    this.uploadsList,
    this.marker,
  });
  static ListMultipartUploadsOutput fromJson(Map<String, dynamic> json) =>
      ListMultipartUploadsOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class ListPartsOutput {
  /// The ID of the upload to which the parts are associated.
  final String multipartUploadId;

  /// The Amazon Resource Name (ARN) of the vault to which the multipart upload
  /// was initiated.
  final String vaultArn;

  /// The description of the archive that was specified in the Initiate
  /// Multipart Upload request.
  final String archiveDescription;

  /// The part size in bytes. This is the same value that you specified in the
  /// Initiate Multipart Upload request.
  final BigInt partSizeInBytes;

  /// The UTC time at which the multipart upload was initiated.
  final String creationDate;

  /// A list of the part sizes of the multipart upload. Each object in the array
  /// contains a `RangeBytes` and `sha256-tree-hash` name/value pair.
  final List<PartListElement> parts;

  /// An opaque string that represents where to continue pagination of the
  /// results. You use the marker in a new List Parts request to obtain more
  /// jobs in the list. If there are no more parts, this value is `null`.
  final String marker;

  ListPartsOutput({
    this.multipartUploadId,
    this.vaultArn,
    this.archiveDescription,
    this.partSizeInBytes,
    this.creationDate,
    this.parts,
    this.marker,
  });
  static ListPartsOutput fromJson(Map<String, dynamic> json) =>
      ListPartsOutput();
}

class ListProvisionedCapacityOutput {
  /// The response body contains the following JSON fields.
  final List<ProvisionedCapacityDescription> provisionedCapacityList;

  ListProvisionedCapacityOutput({
    this.provisionedCapacityList,
  });
  static ListProvisionedCapacityOutput fromJson(Map<String, dynamic> json) =>
      ListProvisionedCapacityOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class ListTagsForVaultOutput {
  /// The tags attached to the vault. Each tag is composed of a key and a value.
  final Map<String, String> tags;

  ListTagsForVaultOutput({
    this.tags,
  });
  static ListTagsForVaultOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForVaultOutput();
}

/// Contains the Amazon S3 Glacier response to your request.
class ListVaultsOutput {
  /// List of vaults.
  final List<DescribeVaultOutput> vaultList;

  /// The vault ARN at which to continue pagination of the results. You use the
  /// marker in another List Vaults request to obtain more vaults in the list.
  final String marker;

  ListVaultsOutput({
    this.vaultList,
    this.marker,
  });
  static ListVaultsOutput fromJson(Map<String, dynamic> json) =>
      ListVaultsOutput();
}

/// Contains information about the location where the select job results are
/// stored.
class OutputLocation {
  /// Describes an S3 location that will receive the results of the job request.
  final S3Location s3;

  OutputLocation({
    this.s3,
  });
  static OutputLocation fromJson(Map<String, dynamic> json) => OutputLocation();
}

/// Describes how the select output is serialized.
class OutputSerialization {
  /// Describes the serialization of CSV-encoded query results.
  final CsvOutput csv;

  OutputSerialization({
    this.csv,
  });
  static OutputSerialization fromJson(Map<String, dynamic> json) =>
      OutputSerialization();
}

/// A list of the part sizes of the multipart upload.
class PartListElement {
  /// The byte range of a part, inclusive of the upper value of the range.
  final String rangeInBytes;

  /// The SHA256 tree hash value that Amazon S3 Glacier calculated for the part.
  /// This field is never `null`.
  final String sha256TreeHash;

  PartListElement({
    this.rangeInBytes,
    this.sha256TreeHash,
  });
  static PartListElement fromJson(Map<String, dynamic> json) =>
      PartListElement();
}

/// The definition for a provisioned capacity unit.
class ProvisionedCapacityDescription {
  /// The ID that identifies the provisioned capacity unit.
  final String capacityId;

  /// The date that the provisioned capacity unit was purchased, in Universal
  /// Coordinated Time (UTC).
  final String startDate;

  /// The date that the provisioned capacity unit expires, in Universal
  /// Coordinated Time (UTC).
  final String expirationDate;

  ProvisionedCapacityDescription({
    this.capacityId,
    this.startDate,
    this.expirationDate,
  });
  static ProvisionedCapacityDescription fromJson(Map<String, dynamic> json) =>
      ProvisionedCapacityDescription();
}

class PurchaseProvisionedCapacityOutput {
  /// The ID that identifies the provisioned capacity unit.
  final String capacityId;

  PurchaseProvisionedCapacityOutput({
    this.capacityId,
  });
  static PurchaseProvisionedCapacityOutput fromJson(
          Map<String, dynamic> json) =>
      PurchaseProvisionedCapacityOutput();
}

/// Contains information about the location in Amazon S3 where the select job
/// results are stored.
class S3Location {
  /// The name of the Amazon S3 bucket where the job results are stored.
  final String bucketName;

  /// The prefix that is prepended to the results for this request.
  final String prefix;

  /// Contains information about the encryption used to store the job results in
  /// Amazon S3.
  final Encryption encryption;

  /// The canned access control list (ACL) to apply to the job results.
  final String cannedAcl;

  /// A list of grants that control access to the staged results.
  final List<Grant> accessControlList;

  /// The tag-set that is applied to the job results.
  final Map<String, String> tagging;

  /// A map of metadata to store with the job results in Amazon S3.
  final Map<String, String> userMetadata;

  /// The storage class used to store the job results.
  final String storageClass;

  S3Location({
    this.bucketName,
    this.prefix,
    this.encryption,
    this.cannedAcl,
    this.accessControlList,
    this.tagging,
    this.userMetadata,
    this.storageClass,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location();
}

/// Contains information about the parameters used for a select.
class SelectParameters {
  /// Describes the serialization format of the object.
  final InputSerialization inputSerialization;

  /// The type of the provided expression, for example `SQL`.
  final String expressionType;

  /// The expression that is used to select the object.
  final String expression;

  /// Describes how the results of the select job are serialized.
  final OutputSerialization outputSerialization;

  SelectParameters({
    this.inputSerialization,
    this.expressionType,
    this.expression,
    this.outputSerialization,
  });
  static SelectParameters fromJson(Map<String, dynamic> json) =>
      SelectParameters();
}

/// A list of in-progress multipart uploads for a vault.
class UploadListElement {
  /// The ID of a multipart upload.
  final String multipartUploadId;

  /// The Amazon Resource Name (ARN) of the vault that contains the archive.
  final String vaultArn;

  /// The description of the archive that was specified in the Initiate
  /// Multipart Upload request.
  final String archiveDescription;

  /// The part size, in bytes, specified in the Initiate Multipart Upload
  /// request. This is the size of all the parts in the upload except the last
  /// part, which may be smaller than this size.
  final BigInt partSizeInBytes;

  /// The UTC time at which the multipart upload was initiated.
  final String creationDate;

  UploadListElement({
    this.multipartUploadId,
    this.vaultArn,
    this.archiveDescription,
    this.partSizeInBytes,
    this.creationDate,
  });
  static UploadListElement fromJson(Map<String, dynamic> json) =>
      UploadListElement();
}

/// Contains the Amazon S3 Glacier response to your request.
class UploadMultipartPartOutput {
  /// The SHA256 tree hash that Amazon S3 Glacier computed for the uploaded
  /// part.
  final String checksum;

  UploadMultipartPartOutput({
    this.checksum,
  });
  static UploadMultipartPartOutput fromJson(Map<String, dynamic> json) =>
      UploadMultipartPartOutput();
}

/// Contains the vault access policy.
class VaultAccessPolicy {
  /// The vault access policy.
  final String policy;

  VaultAccessPolicy({
    this.policy,
  });
  static VaultAccessPolicy fromJson(Map<String, dynamic> json) =>
      VaultAccessPolicy();
}

/// Contains the vault lock policy.
class VaultLockPolicy {
  /// The vault lock policy.
  final String policy;

  VaultLockPolicy({
    this.policy,
  });
}

/// Represents a vault's notification configuration.
class VaultNotificationConfig {
  /// The Amazon Simple Notification Service (Amazon SNS) topic Amazon Resource
  /// Name (ARN).
  final String snsTopic;

  /// A list of one or more events for which Amazon S3 Glacier will send a
  /// notification to the specified Amazon SNS topic.
  final List<String> events;

  VaultNotificationConfig({
    this.snsTopic,
    this.events,
  });
  static VaultNotificationConfig fromJson(Map<String, dynamic> json) =>
      VaultNotificationConfig();
}
