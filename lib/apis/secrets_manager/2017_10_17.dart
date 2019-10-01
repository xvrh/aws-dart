import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Secrets Manager API Reference
///
/// AWS Secrets Manager is a web service that enables you to store, manage, and
/// retrieve, secrets.
///
/// This guide provides descriptions of the Secrets Manager API. For more
/// information about using this service, see the
/// [AWS Secrets Manager User Guide](https://docs.aws.amazon.com/secretsmanager/latest/userguide/introduction.html).
///
///  **API Version**
///
/// This version of the Secrets Manager API Reference documents the Secrets
/// Manager API version 2017-10-17.
///
///  As an alternative to using the API directly, you can use one of the AWS
/// SDKs, which consist of libraries and sample code for various programming
/// languages and platforms (such as Java, Ruby, .NET, iOS, and Android). The
/// SDKs provide a convenient way to create programmatic access to AWS Secrets
/// Manager. For example, the SDKs take care of cryptographically signing
/// requests, managing errors, and retrying requests automatically. For more
/// information about the AWS SDKs, including how to download and install them,
/// see [Tools for Amazon Web Services](http://aws.amazon.com/tools/).
///
/// We recommend that you use the AWS SDKs to make programmatic API calls to
/// Secrets Manager. However, you also can use the Secrets Manager HTTP Query
/// API to make direct calls to the Secrets Manager web service. To learn more
/// about the Secrets Manager HTTP Query API, see
/// [Making Query Requests](https://docs.aws.amazon.com/secretsmanager/latest/userguide/query-requests.html)
/// in the _AWS Secrets Manager User Guide_.
///
/// Secrets Manager supports GET and POST requests for all actions. That is, the
/// API doesn't require you to use GET for some actions and POST for others.
/// However, GET requests are subject to the limitation size of a URL.
/// Therefore, for operations that require larger sizes, use a POST request.
///
///  **Support and Feedback for AWS Secrets Manager**
///
/// We welcome your feedback. Send your comments to
/// [awssecretsmanager-feedback@amazon.com](mailto:awssecretsmanager-feedback@amazon.com),
/// or post your feedback and questions in the
/// [AWS Secrets Manager Discussion Forum](http://forums.aws.amazon.com/forum.jspa?forumID=296).
/// For more information about the AWS Discussion Forums, see
/// [Forums Help](http://forums.aws.amazon.com/help.jspa).
///
///  **How examples are presented**
///
/// The JSON that AWS Secrets Manager expects as your request parameters and
/// that the service returns as a response to HTTP query requests are single,
/// long strings without line breaks or white space formatting. The JSON shown
/// in the examples is formatted with both line breaks and white space to
/// improve readability. When example input parameters would also result in long
/// strings that extend beyond the screen, we insert line breaks to enhance
/// readability. You should always submit the input as a single JSON text
/// string.
///
///  **Logging API Requests**
///
/// AWS Secrets Manager supports AWS CloudTrail, a service that records AWS API
/// calls for your AWS account and delivers log files to an Amazon S3 bucket. By
/// using information that's collected by AWS CloudTrail, you can determine
/// which requests were successfully made to Secrets Manager, who made the
/// request, when it was made, and so on. For more about AWS Secrets Manager and
/// its support for AWS CloudTrail, see
/// [Logging AWS Secrets Manager Events with AWS CloudTrail](http://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring.html#monitoring_cloudtrail)
/// in the _AWS Secrets Manager User Guide_. To learn more about CloudTrail,
/// including how to turn it on and find your log files, see the
/// [AWS CloudTrail User Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
class SecretsManagerApi {
  /// Disables automatic scheduled rotation and cancels the rotation of a secret
  /// if one is currently in progress.
  ///
  /// To re-enable scheduled rotation, call RotateSecret with
  /// `AutomaticallyRotateAfterDays` set to a value greater than 0. This will
  /// immediately rotate your secret and then enable the automatic schedule.
  ///
  ///  If you cancel a rotation that is in progress, it can leave the
  /// `VersionStage` labels in an unexpected state. Depending on what step of
  /// the rotation was in progress, you might need to remove the staging label
  /// `AWSPENDING` from the partially created version, specified by the
  /// `VersionId` response value. You should also evaluate the partially rotated
  /// new version to see if it should be deleted, which you can do by removing
  /// all staging labels from the new version's `VersionStage` field.
  ///
  /// To successfully start a rotation, the staging label `AWSPENDING` must be
  /// in one of the following states:
  ///
  /// *   Not be attached to any version at all
  ///
  /// *   Attached to the same version as the staging label `AWSCURRENT`
  ///
  ///
  /// If the staging label `AWSPENDING` is attached to a different version than
  /// the version with `AWSCURRENT` then the attempt to rotate fails.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:CancelRotateSecret
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To configure rotation for a secret or to manually trigger a rotation,
  /// use RotateSecret.
  ///
  /// *   To get the rotation configuration details for a secret, use
  /// DescribeSecret.
  ///
  /// *   To list all of the currently available secrets, use ListSecrets.
  ///
  /// *   To list all of the versions currently associated with a secret, use
  /// ListSecretVersionIds.
  ///
  /// [secretId]: Specifies the secret for which you want to cancel a rotation
  /// request. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  Future<CancelRotateSecretResponse> cancelRotateSecret(String secretId) async {
    return CancelRotateSecretResponse.fromJson({});
  }

  /// Creates a new secret. A secret in Secrets Manager consists of both the
  /// protected secret data and the important information needed to manage the
  /// secret.
  ///
  /// Secrets Manager stores the encrypted secret data in one of a collection of
  /// "versions" associated with the secret. Each version contains a copy of the
  /// encrypted secret data. Each version is associated with one or more
  /// "staging labels" that identify where the version is in the rotation cycle.
  /// The `SecretVersionsToStages` field of the secret contains the mapping of
  /// staging labels to the active versions of the secret. Versions without a
  /// staging label are considered deprecated and are not included in the list.
  ///
  /// You provide the secret data to be encrypted by putting text in either the
  /// `SecretString` parameter or binary data in the `SecretBinary` parameter,
  /// but not both. If you include `SecretString` or `SecretBinary` then Secrets
  /// Manager also creates an initial secret version and automatically attaches
  /// the staging label `AWSCURRENT` to the new version.
  ///
  ///  *   If you call an operation that needs to encrypt or decrypt the
  /// `SecretString` or `SecretBinary` for a secret in the same account as the
  /// calling user and that secret doesn't specify a AWS KMS encryption key,
  /// Secrets Manager uses the account's default AWS managed customer master key
  /// (CMK) with the alias `aws/secretsmanager`. If this key doesn't already
  /// exist in your account then Secrets Manager creates it for you
  /// automatically. All users and roles in the same AWS account automatically
  /// have access to use the default CMK. Note that if an Secrets Manager API
  /// call results in AWS having to create the account's AWS-managed CMK, it can
  /// result in a one-time significant delay in returning the result.
  ///
  /// *   If the secret is in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the `KMSKeyId`. If you call an
  /// API that must encrypt or decrypt `SecretString` or `SecretBinary` using
  /// credentials from a different account then the AWS KMS key policy must
  /// grant cross-account access to that other account's user or role for both
  /// the kms:GenerateDataKey and kms:Decrypt operations.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:CreateSecret
  ///
  /// *   kms:GenerateDataKey - needed only if you use a customer-managed AWS
  /// KMS key to encrypt the secret. You do not need this permission to use the
  /// account's default AWS managed CMK for Secrets Manager.
  ///
  /// *   kms:Decrypt - needed only if you use a customer-managed AWS KMS key to
  /// encrypt the secret. You do not need this permission to use the account's
  /// default AWS managed CMK for Secrets Manager.
  ///
  /// *   secretsmanager:TagResource - needed only if you include the `Tags`
  /// parameter.
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To delete a secret, use DeleteSecret.
  ///
  /// *   To modify an existing secret, use UpdateSecret.
  ///
  /// *   To create a new version of a secret, use PutSecretValue.
  ///
  /// *   To retrieve the encrypted secure string and secure binary values, use
  /// GetSecretValue.
  ///
  /// *   To retrieve all other details for a secret, use DescribeSecret. This
  /// does not include the encrypted secure string and secure binary values.
  ///
  /// *   To retrieve the list of secret versions associated with the current
  /// secret, use DescribeSecret and examine the `SecretVersionsToStages`
  /// response value.
  ///
  /// [name]: Specifies the friendly name of the new secret.
  ///
  /// The secret name must be ASCII letters, digits, or the following characters
  /// : /_+=.@-
  ///
  ///
  ///
  /// Don't end your secret name with a hyphen followed by six characters. If
  /// you do so, you risk confusion and unexpected results when searching for a
  /// secret by partial ARN. This is because Secrets Manager automatically adds
  /// a hyphen and six random characters at the end of the ARN.
  ///
  /// [clientRequestToken]: (Optional) If you include `SecretString` or
  /// `SecretBinary`, then an initial version is created as part of the secret,
  /// and this parameter specifies a unique identifier for the new version.
  ///
  ///  If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes it as the value for this parameter in the request. If
  /// you don't use the SDK and instead generate a raw HTTP request to the
  /// Secrets Manager service endpoint, then you must generate a
  /// `ClientRequestToken` yourself for the new version and include that value
  /// in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during a rotation. We recommend that you generate a
  /// [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
  /// value to ensure uniqueness of your versions within the specified secret.
  ///
  /// *   If the `ClientRequestToken` value isn't already associated with a
  /// version of the secret then a new version of the secret is created.
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` and `SecretBinary` values are the same as those in the
  /// request, then the request is ignored (the operation is idempotent).
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` and `SecretBinary` values are different from those in the
  /// request then the request fails because you cannot modify an existing
  /// version. Instead, use PutSecretValue to create a new version.
  ///
  ///
  /// This value becomes the `VersionId` of the new version.
  ///
  /// [description]: (Optional) Specifies a user-provided description of the
  /// secret.
  ///
  /// [kmsKeyId]: (Optional) Specifies the ARN, Key ID, or alias of the AWS KMS
  /// customer master key (CMK) to be used to encrypt the `SecretString` or
  /// `SecretBinary` values in the versions stored in this secret.
  ///
  /// You can specify any of the supported ways to identify a AWS KMS key ID. If
  /// you need to reference a CMK in a different account, you can use only the
  /// key ARN or the alias ARN.
  ///
  /// If you don't specify this value, then Secrets Manager defaults to using
  /// the AWS account's default CMK (the one named `aws/secretsmanager`). If a
  /// AWS KMS CMK with that name doesn't yet exist, then Secrets Manager creates
  /// it for you automatically the first time it needs to encrypt a version's
  /// `SecretString` or `SecretBinary` fields.
  ///
  ///
  ///
  /// You can use the account's default CMK to encrypt and decrypt only if you
  /// call this operation using credentials from the same account that owns the
  /// secret. If the secret is in a different account, then you must create a
  /// custom CMK and specify the ARN in this field.
  ///
  /// [secretBinary]: (Optional) Specifies binary data that you want to encrypt
  /// and store in the new version of the secret. To use this parameter in the
  /// command-line tools, we recommend that you store your binary data in a file
  /// and then use the appropriate technique for your tool to pass the contents
  /// of the file as a parameter.
  ///
  /// Either `SecretString` or `SecretBinary` must have a value, but not both.
  /// They cannot both be empty.
  ///
  /// This parameter is not available using the Secrets Manager console. It can
  /// be accessed only by using the AWS CLI or one of the AWS SDKs.
  ///
  /// [secretString]: (Optional) Specifies text data that you want to encrypt
  /// and store in this new version of the secret.
  ///
  /// Either `SecretString` or `SecretBinary` must have a value, but not both.
  /// They cannot both be empty.
  ///
  /// If you create a secret by using the Secrets Manager console then Secrets
  /// Manager puts the protected secret text in only the `SecretString`
  /// parameter. The Secrets Manager console stores the information as a JSON
  /// structure of key/value pairs that the Lambda rotation function knows how
  /// to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_. For example:
  ///
  ///  `[{"username":"bob"},{"password":"abc123xyz456"}]`
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// [tags]: (Optional) Specifies a list of user-defined tags that are attached
  /// to the secret. Each tag is a "Key" and "Value" pair of strings. This
  /// operation only appends tags to the existing list of tags. To remove tags,
  /// you must use UntagResource.
  ///
  ///  *   Secrets Manager tag key names are case sensitive. A tag with the key
  /// "ABC" is a different tag from one with key "abc".
  ///
  /// *   If you check tags in IAM policy `Condition` elements as part of your
  /// security strategy, then adding or removing a tag can change permissions.
  /// If the successful completion of this operation would result in you losing
  /// your permissions for this secret, then this operation is blocked and
  /// returns an `Access Denied` error.
  ///
  /// This parameter requires a JSON text string argument. For information on
  /// how to format a JSON parameter for the various command line tool
  /// environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_. For example:
  ///
  ///
  /// `[{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]`
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// *   Maximum number of tags per secret—50
  ///
  /// *   Maximum key length—127 Unicode characters in UTF-8
  ///
  /// *   Maximum value length—255 Unicode characters in UTF-8
  ///
  /// *   Tag keys and values are case sensitive.
  ///
  /// *   Do not use the `aws:` prefix in your tag names or values because it is
  /// reserved for AWS use. You can't edit or delete tag names or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// secret limit.
  ///
  /// *   If your tagging schema will be used across multiple services and
  /// resources, remember that other services might have restrictions on allowed
  /// characters. Generally allowed characters are: letters, spaces, and numbers
  /// representable in UTF-8, plus the following special characters: + - = . _ :
  /// / @.
  Future<CreateSecretResponse> createSecret(String name,
      {String clientRequestToken,
      String description,
      String kmsKeyId,
      Uint8List secretBinary,
      String secretString,
      List<Tag> tags}) async {
    return CreateSecretResponse.fromJson({});
  }

  /// Deletes the resource-based permission policy that's attached to the
  /// secret.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:DeleteResourcePolicy
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To attach a resource policy to a secret, use PutResourcePolicy.
  ///
  /// *   To retrieve the current resource-based policy that's attached to a
  /// secret, use GetResourcePolicy.
  ///
  /// *   To list all of the currently available secrets, use ListSecrets.
  ///
  /// [secretId]: Specifies the secret that you want to delete the attached
  /// resource-based policy for. You can specify either the Amazon Resource Name
  /// (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy(
      String secretId) async {
    return DeleteResourcePolicyResponse.fromJson({});
  }

  /// Deletes an entire secret and all of its versions. You can optionally
  /// include a recovery window during which you can restore the secret. If you
  /// don't specify a recovery window value, the operation defaults to 30 days.
  /// Secrets Manager attaches a `DeletionDate` stamp to the secret that
  /// specifies the end of the recovery window. At the end of the recovery
  /// window, Secrets Manager deletes the secret permanently.
  ///
  /// At any time before recovery window ends, you can use RestoreSecret to
  /// remove the `DeletionDate` and cancel the deletion of the secret.
  ///
  /// You cannot access the encrypted secret information in any secret that is
  /// scheduled for deletion. If you need to access that information, you must
  /// cancel the deletion with RestoreSecret and then retrieve the information.
  ///
  ///  *   There is no explicit operation to delete a version of a secret.
  /// Instead, remove all staging labels from the `VersionStage` field of a
  /// version. That marks the version as deprecated and allows Secrets Manager
  /// to delete it as needed. Versions that do not have any staging labels do
  /// not show up in ListSecretVersionIds unless you specify
  /// `IncludeDeprecated`.
  ///
  /// *   The permanent secret deletion at the end of the waiting period is
  /// performed as a background task with low priority. There is no guarantee of
  /// a specific time after the recovery window for the actual delete operation
  /// to occur.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:DeleteSecret
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To create a secret, use CreateSecret.
  ///
  /// *   To cancel deletion of a version of a secret before the recovery window
  /// has expired, use RestoreSecret.
  ///
  /// [secretId]: Specifies the secret that you want to delete. You can specify
  /// either the Amazon Resource Name (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [recoveryWindowInDays]: (Optional) Specifies the number of days that
  /// Secrets Manager waits before it can delete the secret. You can't use both
  /// this parameter and the `ForceDeleteWithoutRecovery` parameter in the same
  /// API call.
  ///
  /// This value can range from 7 to 30 days. The default value is 30.
  ///
  /// [forceDeleteWithoutRecovery]: (Optional) Specifies that the secret is to
  /// be deleted without any recovery window. You can't use both this parameter
  /// and the `RecoveryWindowInDays` parameter in the same API call.
  ///
  /// An asynchronous background process performs the actual deletion, so there
  /// can be a short delay before the operation completes. If you write code to
  /// delete and then immediately recreate a secret with the same name, ensure
  /// that your code includes appropriate back off and retry logic.
  ///
  ///
  ///
  /// Use this parameter with caution. This parameter causes the operation to
  /// skip the normal waiting period before the permanent deletion that AWS
  /// would normally impose with the `RecoveryWindowInDays` parameter. If you
  /// delete a secret with the `ForceDeleteWithouRecovery` parameter, then you
  /// have no opportunity to recover the secret. It is permanently lost.
  Future<DeleteSecretResponse> deleteSecret(String secretId,
      {BigInt recoveryWindowInDays, bool forceDeleteWithoutRecovery}) async {
    return DeleteSecretResponse.fromJson({});
  }

  /// Retrieves the details of a secret. It does not include the encrypted
  /// fields. Only those fields that are populated with a value are returned in
  /// the response.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:DescribeSecret
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To create a secret, use CreateSecret.
  ///
  /// *   To modify a secret, use UpdateSecret.
  ///
  /// *   To retrieve the encrypted secret information in a version of the
  /// secret, use GetSecretValue.
  ///
  /// *   To list all of the secrets in the AWS account, use ListSecrets.
  ///
  /// [secretId]: The identifier of the secret whose details you want to
  /// retrieve. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  Future<DescribeSecretResponse> describeSecret(String secretId) async {
    return DescribeSecretResponse.fromJson({});
  }

  /// Generates a random password of the specified complexity. This operation is
  /// intended for use in the Lambda rotation function. Per best practice, we
  /// recommend that you specify the maximum length and include every character
  /// type that the system you are generating a password for can support.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:GetRandomPassword
  ///
  /// [passwordLength]: The desired length of the generated password. The
  /// default value if you do not include this parameter is 32 characters.
  ///
  /// [excludeCharacters]: A string that includes characters that should not be
  /// included in the generated password. The default is that all characters
  /// from the included sets can be used.
  ///
  /// [excludeNumbers]: Specifies that the generated password should not include
  /// digits. The default if you do not include this switch parameter is that
  /// digits can be included.
  ///
  /// [excludePunctuation]: Specifies that the generated password should not
  /// include punctuation characters. The default if you do not include this
  /// switch parameter is that punctuation characters can be included.
  ///
  /// The following are the punctuation characters that _can_ be included in the
  /// generated password if you don't explicitly exclude them with
  /// `ExcludeCharacters` or `ExcludePunctuation`:
  ///
  ///  ``! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~``
  ///
  /// [excludeUppercase]: Specifies that the generated password should not
  /// include uppercase letters. The default if you do not include this switch
  /// parameter is that uppercase letters can be included.
  ///
  /// [excludeLowercase]: Specifies that the generated password should not
  /// include lowercase letters. The default if you do not include this switch
  /// parameter is that lowercase letters can be included.
  ///
  /// [includeSpace]: Specifies that the generated password can include the
  /// space character. The default if you do not include this switch parameter
  /// is that the space character is not included.
  ///
  /// [requireEachIncludedType]: A boolean value that specifies whether the
  /// generated password must include at least one of every allowed character
  /// type. The default value is `True` and the operation requires at least one
  /// of every character type.
  Future<GetRandomPasswordResponse> getRandomPassword(
      {BigInt passwordLength,
      String excludeCharacters,
      bool excludeNumbers,
      bool excludePunctuation,
      bool excludeUppercase,
      bool excludeLowercase,
      bool includeSpace,
      bool requireEachIncludedType}) async {
    return GetRandomPasswordResponse.fromJson({});
  }

  /// Retrieves the JSON text of the resource-based policy document that's
  /// attached to the specified secret. The JSON request string input and
  /// response output are shown formatted with white space and line breaks for
  /// better readability. Submit your input as a single line JSON string.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:GetResourcePolicy
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To attach a resource policy to a secret, use PutResourcePolicy.
  ///
  /// *   To delete the resource-based policy that's attached to a secret, use
  /// DeleteResourcePolicy.
  ///
  /// *   To list all of the currently available secrets, use ListSecrets.
  ///
  /// [secretId]: Specifies the secret that you want to retrieve the attached
  /// resource-based policy for. You can specify either the Amazon Resource Name
  /// (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  Future<GetResourcePolicyResponse> getResourcePolicy(String secretId) async {
    return GetResourcePolicyResponse.fromJson({});
  }

  /// Retrieves the contents of the encrypted fields `SecretString` or
  /// `SecretBinary` from the specified version of a secret, whichever contains
  /// content.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:GetSecretValue
  ///
  /// *   kms:Decrypt - required only if you use a customer-managed AWS KMS key
  /// to encrypt the secret. You do not need this permission to use the
  /// account's default AWS managed CMK for Secrets Manager.
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To create a new version of the secret with different encrypted
  /// information, use PutSecretValue.
  ///
  /// *   To retrieve the non-encrypted details for the secret, use
  /// DescribeSecret.
  ///
  /// [secretId]: Specifies the secret containing the version that you want to
  /// retrieve. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [versionId]: Specifies the unique identifier of the version of the secret
  /// that you want to retrieve. If you specify this parameter then don't
  /// specify `VersionStage`. If you don't specify either a `VersionStage` or
  /// `VersionId` then the default is to perform the operation on the version
  /// with the `VersionStage` value of `AWSCURRENT`.
  ///
  /// This value is typically a
  /// [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
  /// value with 32 hexadecimal digits.
  ///
  /// [versionStage]: Specifies the secret version that you want to retrieve by
  /// the staging label attached to the version.
  ///
  /// Staging labels are used to keep track of different versions during the
  /// rotation process. If you use this parameter then don't specify
  /// `VersionId`. If you don't specify either a `VersionStage` or `VersionId`,
  /// then the default is to perform the operation on the version with the
  /// `VersionStage` value of `AWSCURRENT`.
  Future<GetSecretValueResponse> getSecretValue(String secretId,
      {String versionId, String versionStage}) async {
    return GetSecretValueResponse.fromJson({});
  }

  /// Lists all of the versions attached to the specified secret. The output
  /// does not include the `SecretString` or `SecretBinary` fields. By default,
  /// the list includes only versions that have at least one staging label in
  /// `VersionStage` attached.
  ///
  ///  Always check the `NextToken` response parameter when calling any of the
  /// `List*` operations. These operations can occasionally return an empty or
  /// shorter than expected list of results even when there are more results
  /// available. When this happens, the `NextToken` response parameter contains
  /// a value to pass to the next call to the same API to request the next part
  /// of the list.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:ListSecretVersionIds
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To list the secrets in an account, use ListSecrets.
  ///
  /// [secretId]: The identifier for the secret containing the versions you want
  /// to list. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, it defaults
  /// to a value that's specific to the operation. If additional items exist
  /// beyond the maximum you specify, the `NextToken` response element is
  /// present and has a value (isn't null). Include that value as the
  /// `NextToken` request parameter in the next call to the operation to get the
  /// next part of the results. Note that Secrets Manager might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [includeDeprecated]: (Optional) Specifies that you want the results to
  /// include versions that do not have any staging labels attached to them.
  /// Such versions are considered deprecated and are subject to deletion by
  /// Secrets Manager as needed.
  Future<ListSecretVersionIdsResponse> listSecretVersionIds(String secretId,
      {int maxResults, String nextToken, bool includeDeprecated}) async {
    return ListSecretVersionIdsResponse.fromJson({});
  }

  /// Lists all of the secrets that are stored by Secrets Manager in the AWS
  /// account. To list the versions currently stored for a specific secret, use
  /// ListSecretVersionIds. The encrypted fields `SecretString` and
  /// `SecretBinary` are not included in the output. To get that information,
  /// call the GetSecretValue operation.
  ///
  ///  Always check the `NextToken` response parameter when calling any of the
  /// `List*` operations. These operations can occasionally return an empty or
  /// shorter than expected list of results even when there are more results
  /// available. When this happens, the `NextToken` response parameter contains
  /// a value to pass to the next call to the same API to request the next part
  /// of the list.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:ListSecrets
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To list the versions attached to a secret, use ListSecretVersionIds.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, it defaults
  /// to a value that's specific to the operation. If additional items exist
  /// beyond the maximum you specify, the `NextToken` response element is
  /// present and has a value (isn't null). Include that value as the
  /// `NextToken` request parameter in the next call to the operation to get the
  /// next part of the results. Note that Secrets Manager might return fewer
  /// results than the maximum even when there are more results available. You
  /// should check `NextToken` after every operation to ensure that you receive
  /// all of the results.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  Future<ListSecretsResponse> listSecrets(
      {int maxResults, String nextToken}) async {
    return ListSecretsResponse.fromJson({});
  }

  /// Attaches the contents of the specified resource-based permission policy to
  /// a secret. A resource-based policy is optional. Alternatively, you can use
  /// IAM identity-based policies that specify the secret's Amazon Resource Name
  /// (ARN) in the policy statement's `Resources` element. You can also use a
  /// combination of both identity-based and resource-based policies. The
  /// affected users and roles receive the permissions that are permitted by all
  /// of the relevant policies. For more information, see
  /// [Using Resource-Based Policies for AWS Secrets Manager](http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html).
  /// For the complete description of the AWS policy syntax and grammar, see
  /// [IAM JSON Policy Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html)
  /// in the _IAM User Guide_.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:PutResourcePolicy
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To retrieve the resource policy that's attached to a secret, use
  /// GetResourcePolicy.
  ///
  /// *   To delete the resource-based policy that's attached to a secret, use
  /// DeleteResourcePolicy.
  ///
  /// *   To list all of the currently available secrets, use ListSecrets.
  ///
  /// [secretId]: Specifies the secret that you want to attach the
  /// resource-based policy to. You can specify either the ARN or the friendly
  /// name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [resourcePolicy]: A JSON-formatted string that's constructed according to
  /// the grammar and syntax for an AWS resource-based policy. The policy in the
  /// string identifies who can access or manage this secret and its versions.
  /// For information on how to format a JSON parameter for the various command
  /// line tool environments, see
  /// [Using JSON for Parameters](http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_.
  Future<PutResourcePolicyResponse> putResourcePolicy(
      {@required String secretId, @required String resourcePolicy}) async {
    return PutResourcePolicyResponse.fromJson({});
  }

  /// Stores a new encrypted secret value in the specified secret. To do this,
  /// the operation creates a new version and attaches it to the secret. The
  /// version can contain a new `SecretString` value or a new `SecretBinary`
  /// value. You can also specify the staging labels that are initially attached
  /// to the new version.
  ///
  ///  The Secrets Manager console uses only the `SecretString` field. To add
  /// binary data to a secret with the `SecretBinary` field you must use the AWS
  /// CLI or one of the AWS SDKs.
  ///
  /// *   If this operation creates the first version for the secret then
  /// Secrets Manager automatically attaches the staging label `AWSCURRENT` to
  /// the new version.
  ///
  /// *   If another version of this secret already exists, then this operation
  /// does not automatically move any staging labels other than those that you
  /// explicitly specify in the `VersionStages` parameter.
  ///
  /// *   If this operation moves the staging label `AWSCURRENT` from another
  /// version to this version (because you included it in the `StagingLabels`
  /// parameter) then Secrets Manager also automatically moves the staging label
  /// `AWSPREVIOUS` to the version that `AWSCURRENT` was removed from.
  ///
  /// *   This operation is idempotent. If a version with a `VersionId` with the
  /// same value as the `ClientRequestToken` parameter already exists and you
  /// specify the same secret data, the operation succeeds but does nothing.
  /// However, if the secret data is different, then the operation fails because
  /// you cannot modify an existing version; you can only create new ones.
  ///
  ///
  ///  *   If you call an operation that needs to encrypt or decrypt the
  /// `SecretString` or `SecretBinary` for a secret in the same account as the
  /// calling user and that secret doesn't specify a AWS KMS encryption key,
  /// Secrets Manager uses the account's default AWS managed customer master key
  /// (CMK) with the alias `aws/secretsmanager`. If this key doesn't already
  /// exist in your account then Secrets Manager creates it for you
  /// automatically. All users and roles in the same AWS account automatically
  /// have access to use the default CMK. Note that if an Secrets Manager API
  /// call results in AWS having to create the account's AWS-managed CMK, it can
  /// result in a one-time significant delay in returning the result.
  ///
  /// *   If the secret is in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the `KMSKeyId`. If you call an
  /// API that must encrypt or decrypt `SecretString` or `SecretBinary` using
  /// credentials from a different account then the AWS KMS key policy must
  /// grant cross-account access to that other account's user or role for both
  /// the kms:GenerateDataKey and kms:Decrypt operations.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:PutSecretValue
  ///
  /// *   kms:GenerateDataKey - needed only if you use a customer-managed AWS
  /// KMS key to encrypt the secret. You do not need this permission to use the
  /// account's default AWS managed CMK for Secrets Manager.
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To retrieve the encrypted value you store in the version of a secret,
  /// use GetSecretValue.
  ///
  /// *   To create a secret, use CreateSecret.
  ///
  /// *   To get the details for a secret, use DescribeSecret.
  ///
  /// *   To list the versions attached to a secret, use ListSecretVersionIds.
  ///
  /// [secretId]: Specifies the secret to which you want to add a new version.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret. The secret must already exist.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [clientRequestToken]: (Optional) Specifies a unique identifier for the new
  /// version of the secret.
  ///
  ///  If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a `ClientRequestToken` yourself for new
  /// versions and include that value in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during the Lambda rotation function's processing. We
  /// recommend that you generate a
  /// [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
  /// value to ensure uniqueness within the specified secret.
  ///
  /// *   If the `ClientRequestToken` value isn't already associated with a
  /// version of the secret then a new version of the secret is created.
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` or `SecretBinary` values are the same as those in the
  /// request then the request is ignored (the operation is idempotent).
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` and `SecretBinary` values are different from those in the
  /// request then the request fails because you cannot modify an existing
  /// secret version. You can only create new versions to store new secret
  /// values.
  ///
  ///
  /// This value becomes the `VersionId` of the new version.
  ///
  /// [secretBinary]: (Optional) Specifies binary data that you want to encrypt
  /// and store in the new version of the secret. To use this parameter in the
  /// command-line tools, we recommend that you store your binary data in a file
  /// and then use the appropriate technique for your tool to pass the contents
  /// of the file as a parameter. Either `SecretBinary` or `SecretString` must
  /// have a value, but not both. They cannot both be empty.
  ///
  /// This parameter is not accessible if the secret using the Secrets Manager
  /// console.
  ///
  /// [secretString]: (Optional) Specifies text data that you want to encrypt
  /// and store in this new version of the secret. Either `SecretString` or
  /// `SecretBinary` must have a value, but not both. They cannot both be empty.
  ///
  /// If you create this secret by using the Secrets Manager console then
  /// Secrets Manager puts the protected secret text in only the `SecretString`
  /// parameter. The Secrets Manager console stores the information as a JSON
  /// structure of key/value pairs that the default Lambda rotation function
  /// knows how to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_.
  ///
  ///  For example:
  ///
  ///  `[{"username":"bob"},{"password":"abc123xyz456"}]`
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// [versionStages]: (Optional) Specifies a list of staging labels that are
  /// attached to this version of the secret. These staging labels are used to
  /// track the versions through the rotation process by the Lambda rotation
  /// function.
  ///
  /// A staging label must be unique to a single version of the secret. If you
  /// specify a staging label that's already associated with a different version
  /// of the same secret then that staging label is automatically removed from
  /// the other version and attached to this version.
  ///
  /// If you do not specify a value for `VersionStages` then Secrets Manager
  /// automatically moves the staging label `AWSCURRENT` to this new version.
  Future<PutSecretValueResponse> putSecretValue(String secretId,
      {String clientRequestToken,
      Uint8List secretBinary,
      String secretString,
      List<String> versionStages}) async {
    return PutSecretValueResponse.fromJson({});
  }

  /// Cancels the scheduled deletion of a secret by removing the `DeletedDate`
  /// time stamp. This makes the secret accessible to query once again.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:RestoreSecret
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To delete a secret, use DeleteSecret.
  ///
  /// [secretId]: Specifies the secret that you want to restore from a
  /// previously scheduled deletion. You can specify either the Amazon Resource
  /// Name (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  Future<RestoreSecretResponse> restoreSecret(String secretId) async {
    return RestoreSecretResponse.fromJson({});
  }

  /// Configures and starts the asynchronous process of rotating this secret. If
  /// you include the configuration parameters, the operation sets those values
  /// for the secret and then immediately starts a rotation. If you do not
  /// include the configuration parameters, the operation starts a rotation with
  /// the values already stored in the secret. After the rotation completes, the
  /// protected service and its clients all use the new version of the secret.
  ///
  /// This required configuration information includes the ARN of an AWS Lambda
  /// function and the time between scheduled rotations. The Lambda rotation
  /// function creates a new version of the secret and creates or updates the
  /// credentials on the protected service to match. After testing the new
  /// credentials, the function marks the new secret with the staging label
  /// `AWSCURRENT` so that your clients all immediately begin to use the new
  /// version. For more information about rotating secrets and how to configure
  /// a Lambda function to rotate the secrets for your protected service, see
  /// [Rotating Secrets in AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html)
  /// in the _AWS Secrets Manager User Guide_.
  ///
  /// Secrets Manager schedules the next rotation when the previous one is
  /// complete. Secrets Manager schedules the date by adding the rotation
  /// interval (number of days) to the actual date of the last rotation. The
  /// service chooses the hour within that 24-hour date window randomly. The
  /// minute is also chosen somewhat randomly, but weighted towards the top of
  /// the hour and influenced by a variety of factors that help distribute load.
  ///
  /// The rotation function must end with the versions of the secret in one of
  /// two states:
  ///
  /// *   The `AWSPENDING` and `AWSCURRENT` staging labels are attached to the
  /// same version of the secret, or
  ///
  /// *   The `AWSPENDING` staging label is not attached to any version of the
  /// secret.
  ///
  ///
  /// If instead the `AWSPENDING` staging label is present but is not attached
  /// to the same version as `AWSCURRENT` then any later invocation of
  /// `RotateSecret` assumes that a previous rotation request is still in
  /// progress and returns an error.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:RotateSecret
  ///
  /// *   lambda:InvokeFunction (on the function specified in the secret's
  /// metadata)
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To list the secrets in your account, use ListSecrets.
  ///
  /// *   To get the details for a version of a secret, use DescribeSecret.
  ///
  /// *   To create a new version of a secret, use CreateSecret.
  ///
  /// *   To attach staging labels to or remove staging labels from a version of
  /// a secret, use UpdateSecretVersionStage.
  ///
  /// [secretId]: Specifies the secret that you want to rotate. You can specify
  /// either the Amazon Resource Name (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [clientRequestToken]: (Optional) Specifies a unique identifier for the new
  /// version of the secret that helps ensure idempotency.
  ///
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request for this parameter. If you don't
  /// use the SDK and instead generate a raw HTTP request to the Secrets Manager
  /// service endpoint, then you must generate a `ClientRequestToken` yourself
  /// for new versions and include that value in the request.
  ///
  /// You only need to specify your own value if you are implementing your own
  /// retry logic and want to ensure that a given secret is not created twice.
  /// We recommend that you generate a
  /// [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
  /// value to ensure uniqueness within the specified secret.
  ///
  /// Secrets Manager uses this value to prevent the accidental creation of
  /// duplicate versions if there are failures and retries during the function's
  /// processing. This value becomes the `VersionId` of the new version.
  ///
  /// [rotationLambdaArn]: (Optional) Specifies the ARN of the Lambda function
  /// that can rotate the secret.
  ///
  /// [rotationRules]: A structure that defines the rotation configuration for
  /// this secret.
  Future<RotateSecretResponse> rotateSecret(String secretId,
      {String clientRequestToken,
      String rotationLambdaArn,
      RotationRulesType rotationRules}) async {
    return RotateSecretResponse.fromJson({});
  }

  /// Attaches one or more tags, each consisting of a key name and a value, to
  /// the specified secret. Tags are part of the secret's overall metadata, and
  /// are not associated with any specific version of the secret. This operation
  /// only appends tags to the existing list of tags. To remove tags, you must
  /// use UntagResource.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// *   Maximum number of tags per secret—50
  ///
  /// *   Maximum key length—127 Unicode characters in UTF-8
  ///
  /// *   Maximum value length—255 Unicode characters in UTF-8
  ///
  /// *   Tag keys and values are case sensitive.
  ///
  /// *   Do not use the `aws:` prefix in your tag names or values because it is
  /// reserved for AWS use. You can't edit or delete tag names or values with
  /// this prefix. Tags with this prefix do not count against your tags per
  /// secret limit.
  ///
  /// *   If your tagging schema will be used across multiple services and
  /// resources, remember that other services might have restrictions on allowed
  /// characters. Generally allowed characters are: letters, spaces, and numbers
  /// representable in UTF-8, plus the following special characters: + - = . _ :
  /// / @.
  ///
  ///
  ///  If you use tags as part of your security strategy, then adding or
  /// removing a tag can change permissions. If successfully completing this
  /// operation would result in you losing your permissions for this secret,
  /// then the operation is blocked and returns an Access Denied error.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:TagResource
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To remove one or more tags from the collection attached to a secret,
  /// use UntagResource.
  ///
  /// *   To view the list of tags attached to a secret, use DescribeSecret.
  ///
  /// [secretId]: The identifier for the secret that you want to attach tags to.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [tags]: The tags to attach to the secret. Each element in the list
  /// consists of a `Key` and a `Value`.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_. For the AWS CLI, you can also use the syntax:
  /// `--Tags Key="Key1",Value="Value1",Key="Key2",Value="Value2"[,…]`
  Future<void> tagResource(
      {@required String secretId, @required List<Tag> tags}) async {}

  /// Removes one or more tags from the specified secret.
  ///
  /// This operation is idempotent. If a requested tag is not attached to the
  /// secret, no error is returned and the secret metadata is unchanged.
  ///
  ///  If you use tags as part of your security strategy, then removing a tag
  /// can change permissions. If successfully completing this operation would
  /// result in you losing your permissions for this secret, then the operation
  /// is blocked and returns an Access Denied error.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:UntagResource
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To add one or more tags to the collection attached to a secret, use
  /// TagResource.
  ///
  /// *   To view the list of tags attached to a secret, use DescribeSecret.
  ///
  /// [secretId]: The identifier for the secret that you want to remove tags
  /// from. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [tagKeys]: A list of tag key names to remove from the secret. You don't
  /// specify the value. Both the key and its associated value are removed.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_.
  Future<void> untagResource(
      {@required String secretId, @required List<String> tagKeys}) async {}

  /// Modifies many of the details of the specified secret. If you include a
  /// `ClientRequestToken` and _either_ `SecretString` or `SecretBinary` then it
  /// also creates a new version attached to the secret.
  ///
  /// To modify the rotation configuration of a secret, use RotateSecret
  /// instead.
  ///
  ///  The Secrets Manager console uses only the `SecretString` parameter and
  /// therefore limits you to encrypting and storing only a text string. To
  /// encrypt and store binary data as part of the version of a secret, you must
  /// use either the AWS CLI or one of the AWS SDKs.
  ///
  /// *   If a version with a `VersionId` with the same value as the
  /// `ClientRequestToken` parameter already exists, the operation results in an
  /// error. You cannot modify an existing version, you can only create a new
  /// version.
  ///
  /// *   If you include `SecretString` or `SecretBinary` to create a new secret
  /// version, Secrets Manager automatically attaches the staging label
  /// `AWSCURRENT` to the new version.
  ///
  ///
  ///  *   If you call an operation that needs to encrypt or decrypt the
  /// `SecretString` or `SecretBinary` for a secret in the same account as the
  /// calling user and that secret doesn't specify a AWS KMS encryption key,
  /// Secrets Manager uses the account's default AWS managed customer master key
  /// (CMK) with the alias `aws/secretsmanager`. If this key doesn't already
  /// exist in your account then Secrets Manager creates it for you
  /// automatically. All users and roles in the same AWS account automatically
  /// have access to use the default CMK. Note that if an Secrets Manager API
  /// call results in AWS having to create the account's AWS-managed CMK, it can
  /// result in a one-time significant delay in returning the result.
  ///
  /// *   If the secret is in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the `KMSKeyId`. If you call an
  /// API that must encrypt or decrypt `SecretString` or `SecretBinary` using
  /// credentials from a different account then the AWS KMS key policy must
  /// grant cross-account access to that other account's user or role for both
  /// the kms:GenerateDataKey and kms:Decrypt operations.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:UpdateSecret
  ///
  /// *   kms:GenerateDataKey - needed only if you use a custom AWS KMS key to
  /// encrypt the secret. You do not need this permission to use the account's
  /// AWS managed CMK for Secrets Manager.
  ///
  /// *   kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt
  /// the secret. You do not need this permission to use the account's AWS
  /// managed CMK for Secrets Manager.
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To create a new secret, use CreateSecret.
  ///
  /// *   To add only a new version to an existing secret, use PutSecretValue.
  ///
  /// *   To get the details for a secret, use DescribeSecret.
  ///
  /// *   To list the versions contained in a secret, use ListSecretVersionIds.
  ///
  /// [secretId]: Specifies the secret that you want to modify or to which you
  /// want to add a new version. You can specify either the Amazon Resource Name
  /// (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [clientRequestToken]: (Optional) If you want to add a new version to the
  /// secret, this parameter specifies a unique identifier for the new version
  /// that helps ensure idempotency.
  ///
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a `ClientRequestToken` yourself for new
  /// versions and include that value in the request.
  ///
  /// You typically only need to interact with this value if you implement your
  /// own retry logic and want to ensure that a given secret is not created
  /// twice. We recommend that you generate a
  /// [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
  /// value to ensure uniqueness within the specified secret.
  ///
  /// Secrets Manager uses this value to prevent the accidental creation of
  /// duplicate versions if there are failures and retries during the Lambda
  /// rotation function's processing.
  ///
  /// *   If the `ClientRequestToken` value isn't already associated with a
  /// version of the secret then a new version of the secret is created.
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` and `SecretBinary` values are the same as those in the
  /// request then the request is ignored (the operation is idempotent).
  ///
  /// *   If a version with this value already exists and that version's
  /// `SecretString` and `SecretBinary` values are different from the request
  /// then an error occurs because you cannot modify an existing secret value.
  ///
  ///
  /// This value becomes the `VersionId` of the new version.
  ///
  /// [description]: (Optional) Specifies an updated user-provided description
  /// of the secret.
  ///
  /// [kmsKeyId]: (Optional) Specifies an updated ARN or alias of the AWS KMS
  /// customer master key (CMK) to be used to encrypt the protected text in new
  /// versions of this secret.
  ///
  ///
  ///
  /// You can only use the account's default CMK to encrypt and decrypt if you
  /// call this operation using credentials from the same account that owns the
  /// secret. If the secret is in a different account, then you must create a
  /// custom CMK and provide the ARN of that CMK in this field. The user making
  /// the call must have permissions to both the secret and the CMK in their
  /// respective accounts.
  ///
  /// [secretBinary]: (Optional) Specifies updated binary data that you want to
  /// encrypt and store in the new version of the secret. To use this parameter
  /// in the command-line tools, we recommend that you store your binary data in
  /// a file and then use the appropriate technique for your tool to pass the
  /// contents of the file as a parameter. Either `SecretBinary` or
  /// `SecretString` must have a value, but not both. They cannot both be empty.
  ///
  /// This parameter is not accessible using the Secrets Manager console.
  ///
  /// [secretString]: (Optional) Specifies updated text data that you want to
  /// encrypt and store in this new version of the secret. Either `SecretBinary`
  /// or `SecretString` must have a value, but not both. They cannot both be
  /// empty.
  ///
  /// If you create this secret by using the Secrets Manager console then
  /// Secrets Manager puts the protected secret text in only the `SecretString`
  /// parameter. The Secrets Manager console stores the information as a JSON
  /// structure of key/value pairs that the default Lambda rotation function
  /// knows how to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see
  /// [Using JSON for Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json)
  /// in the _AWS CLI User Guide_. For example:
  ///
  ///  `[{"username":"bob"},{"password":"abc123xyz456"}]`
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text. You can also 'escape' the double quote
  /// character in the embedded JSON text by prefacing each with a backslash.
  /// For example, the following string is surrounded by double-quotes. All of
  /// the embedded double quotes are escaped:
  ///
  ///  `"[{"username":"bob"},{"password":"abc123xyz456"}]"`
  Future<UpdateSecretResponse> updateSecret(String secretId,
      {String clientRequestToken,
      String description,
      String kmsKeyId,
      Uint8List secretBinary,
      String secretString}) async {
    return UpdateSecretResponse.fromJson({});
  }

  /// Modifies the staging labels attached to a version of a secret. Staging
  /// labels are used to track a version as it progresses through the secret
  /// rotation process. You can attach a staging label to only one version of a
  /// secret at a time. If a staging label to be added is already attached to
  /// another version, then it is moved--removed from the other version first
  /// and then attached to this one. For more information about staging labels,
  /// see
  /// [Staging Labels](https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html#term_staging-label)
  /// in the _AWS Secrets Manager User Guide_.
  ///
  /// The staging labels that you specify in the `VersionStage` parameter are
  /// added to the existing list of staging labels--they don't replace it.
  ///
  /// You can move the `AWSCURRENT` staging label to this version by including
  /// it in this call.
  ///
  ///  Whenever you move `AWSCURRENT`, Secrets Manager automatically moves the
  /// label `AWSPREVIOUS` to the version that `AWSCURRENT` was removed from.
  ///
  /// If this action results in the last label being removed from a version,
  /// then the version is considered to be 'deprecated' and can be deleted by
  /// Secrets Manager.
  ///
  ///  **Minimum permissions**
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// *   secretsmanager:UpdateSecretVersionStage
  ///
  ///
  ///  **Related operations**
  ///
  /// *   To get the list of staging labels that are currently associated with a
  /// version of a secret, use  `DescribeSecret`  and examine the
  /// `SecretVersionsToStages` response value.
  ///
  /// [secretId]: Specifies the secret with the version whose list of staging
  /// labels you want to modify. You can specify either the Amazon Resource Name
  /// (ARN) or the friendly name of the secret.
  ///
  ///
  ///
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  ///
  /// [versionStage]: The staging label to add to this version.
  ///
  /// [removeFromVersionId]: Specifies the secret version ID of the version that
  /// the staging label is to be removed from. If the staging label you are
  /// trying to attach to one version is already attached to a different
  /// version, then you must include this parameter and specify the version that
  /// the label is to be removed from. If the label is attached and you either
  /// do not specify this parameter, or the version ID does not match, then the
  /// operation fails.
  ///
  /// [moveToVersionId]: (Optional) The secret version ID that you want to add
  /// the staging label to. If you want to remove a label from a version, then
  /// do not specify this parameter.
  ///
  /// If the staging label is already attached to a different version of the
  /// secret, then you must also specify the `RemoveFromVersionId` parameter.
  Future<UpdateSecretVersionStageResponse> updateSecretVersionStage(
      {@required String secretId,
      @required String versionStage,
      String removeFromVersionId,
      String moveToVersionId}) async {
    return UpdateSecretVersionStageResponse.fromJson({});
  }
}

class CancelRotateSecretResponse {
  /// The ARN of the secret for which rotation was canceled.
  final String arn;

  /// The friendly name of the secret for which rotation was canceled.
  final String name;

  /// The unique identifier of the version of the secret that was created during
  /// the rotation. This version might not be complete, and should be evaluated
  /// for possible deletion. At the very least, you should remove the
  /// `VersionStage` value `AWSPENDING` to enable this version to be deleted.
  /// Failing to clean up a cancelled rotation can block you from successfully
  /// starting future rotations.
  final String versionId;

  CancelRotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  static CancelRotateSecretResponse fromJson(Map<String, dynamic> json) =>
      CancelRotateSecretResponse();
}

class CreateSecretResponse {
  /// The Amazon Resource Name (ARN) of the secret that you just created.
  ///
  ///
  ///
  /// Secrets Manager automatically adds several random characters to the name
  /// at the end of the ARN when you initially create a secret. This affects
  /// only the ARN and not the actual friendly name. This ensures that if you
  /// create a new secret with the same name as an old secret that you
  /// previously deleted, then users with access to the old secret _don't_
  /// automatically get access to the new secret because the ARNs are different.
  final String arn;

  /// The friendly name of the secret that you just created.
  final String name;

  /// The unique identifier that's associated with the version of the secret you
  /// just created.
  final String versionId;

  CreateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  static CreateSecretResponse fromJson(Map<String, dynamic> json) =>
      CreateSecretResponse();
}

class DeleteResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was deleted for.
  final String arn;

  /// The friendly name of the secret that the resource-based policy was deleted
  /// for.
  final String name;

  DeleteResourcePolicyResponse({
    this.arn,
    this.name,
  });
  static DeleteResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteResourcePolicyResponse();
}

class DeleteSecretResponse {
  /// The ARN of the secret that is now scheduled for deletion.
  final String arn;

  /// The friendly name of the secret that is now scheduled for deletion.
  final String name;

  /// The date and time after which this secret can be deleted by Secrets
  /// Manager and can no longer be restored. This value is the date and time of
  /// the delete request plus the number of days specified in
  /// `RecoveryWindowInDays`.
  final DateTime deletionDate;

  DeleteSecretResponse({
    this.arn,
    this.name,
    this.deletionDate,
  });
  static DeleteSecretResponse fromJson(Map<String, dynamic> json) =>
      DeleteSecretResponse();
}

class DescribeSecretResponse {
  /// The ARN of the secret.
  final String arn;

  /// The user-provided friendly name of the secret.
  final String name;

  /// The user-provided description of the secret.
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) that's used to
  /// encrypt the `SecretString` or `SecretBinary` fields in each version of the
  /// secret. If you don't provide a key, then Secrets Manager defaults to
  /// encrypting the secret fields with the default AWS KMS CMK (the one named
  /// `awssecretsmanager`) for this account.
  final String kmsKeyId;

  /// Specifies whether automatic rotation is enabled for this secret.
  ///
  /// To enable rotation, use RotateSecret with `AutomaticallyRotateAfterDays`
  /// set to a value greater than 0. To disable rotation, use
  /// CancelRotateSecret.
  final bool rotationEnabled;

  /// The ARN of a Lambda function that's invoked by Secrets Manager to rotate
  /// the secret either automatically per the schedule or manually by a call to
  /// `RotateSecret`.
  final String rotationLambdaArn;

  /// A structure that contains the rotation configuration for this secret.
  final RotationRulesType rotationRules;

  /// The most recent date and time that the Secrets Manager rotation process
  /// was successfully completed. This value is null if the secret has never
  /// rotated.
  final DateTime lastRotatedDate;

  /// The last date and time that this secret was modified in any way.
  final DateTime lastChangedDate;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  final DateTime lastAccessedDate;

  /// This value exists if the secret is scheduled for deletion. Some time after
  /// the specified date and time, Secrets Manager deletes the secret and all of
  /// its versions.
  ///
  /// If a secret is scheduled for deletion, then its details, including the
  /// encrypted secret information, is not accessible. To cancel a scheduled
  /// deletion and restore access, use RestoreSecret.
  final DateTime deletedDate;

  /// The list of user-defined tags that are associated with the secret. To add
  /// tags to a secret, use TagResource. To remove tags, use UntagResource.
  final List<Tag> tags;

  /// A list of all of the currently assigned `VersionStage` staging labels and
  /// the `VersionId` that each is attached to. Staging labels are used to keep
  /// track of the different versions during the rotation process.
  ///
  ///
  ///
  /// A version that does not have any staging labels attached is considered
  /// deprecated and subject to deletion. Such versions are not included in this
  /// list.
  final Map<String, List<String>> versionIdsToStages;

  final String owningService;

  DescribeSecretResponse({
    this.arn,
    this.name,
    this.description,
    this.kmsKeyId,
    this.rotationEnabled,
    this.rotationLambdaArn,
    this.rotationRules,
    this.lastRotatedDate,
    this.lastChangedDate,
    this.lastAccessedDate,
    this.deletedDate,
    this.tags,
    this.versionIdsToStages,
    this.owningService,
  });
  static DescribeSecretResponse fromJson(Map<String, dynamic> json) =>
      DescribeSecretResponse();
}

class GetRandomPasswordResponse {
  /// A string with the generated password.
  final String randomPassword;

  GetRandomPasswordResponse({
    this.randomPassword,
  });
  static GetRandomPasswordResponse fromJson(Map<String, dynamic> json) =>
      GetRandomPasswordResponse();
}

class GetResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  final String arn;

  /// The friendly name of the secret that the resource-based policy was
  /// retrieved for.
  final String name;

  /// A JSON-formatted string that describes the permissions that are associated
  /// with the attached secret. These permissions are combined with any
  /// permissions that are associated with the user or role that attempts to
  /// access this secret. The combined permissions specify who can access the
  /// secret and what actions they can perform. For more information, see
  /// [Authentication and Access Control for AWS Secrets Manager](http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html)
  /// in the _AWS Secrets Manager User Guide_.
  final String resourcePolicy;

  GetResourcePolicyResponse({
    this.arn,
    this.name,
    this.resourcePolicy,
  });
  static GetResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetResourcePolicyResponse();
}

class GetSecretValueResponse {
  /// The ARN of the secret.
  final String arn;

  /// The friendly name of the secret.
  final String name;

  /// The unique identifier of this version of the secret.
  final String versionId;

  /// The decrypted part of the protected secret information that was originally
  /// provided as binary data in the form of a byte array. The response
  /// parameter represents the binary data as a
  /// [base64-encoded](https://tools.ietf.org/html/rfc4648#section-4) string.
  ///
  /// This parameter is not used if the secret is created by the Secrets Manager
  /// console.
  ///
  /// If you store custom information in this field of the secret, then you must
  /// code your Lambda rotation function to parse and interpret whatever you
  /// store in the `SecretString` or `SecretBinary` fields.
  final Uint8List secretBinary;

  /// The decrypted part of the protected secret information that was originally
  /// provided as a string.
  ///
  /// If you create this secret by using the Secrets Manager console then only
  /// the `SecretString` parameter contains data. Secrets Manager stores the
  /// information as a JSON structure of key/value pairs that the Lambda
  /// rotation function knows how to parse.
  ///
  /// If you store custom information in the secret by using the CreateSecret,
  /// UpdateSecret, or PutSecretValue API operations instead of the Secrets
  /// Manager console, or by using the **Other secret type** in the console,
  /// then you must code your Lambda rotation function to parse and interpret
  /// those values.
  final String secretString;

  /// A list of all of the staging labels currently attached to this version of
  /// the secret.
  final List<String> versionStages;

  /// The date and time that this version of the secret was created.
  final DateTime createdDate;

  GetSecretValueResponse({
    this.arn,
    this.name,
    this.versionId,
    this.secretBinary,
    this.secretString,
    this.versionStages,
    this.createdDate,
  });
  static GetSecretValueResponse fromJson(Map<String, dynamic> json) =>
      GetSecretValueResponse();
}

class ListSecretVersionIdsResponse {
  /// The list of the currently available versions of the specified secret.
  final List<SecretVersionsListEntry> versions;

  /// If present in the response, this value indicates that there's more output
  /// available than what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  /// The Amazon Resource Name (ARN) for the secret.
  ///
  ///
  ///
  /// Secrets Manager automatically adds several random characters to the name
  /// at the end of the ARN when you initially create a secret. This affects
  /// only the ARN and not the actual friendly name. This ensures that if you
  /// create a new secret with the same name as an old secret that you
  /// previously deleted, then users with access to the old secret _don't_
  /// automatically get access to the new secret because the ARNs are different.
  final String arn;

  /// The friendly name of the secret.
  final String name;

  ListSecretVersionIdsResponse({
    this.versions,
    this.nextToken,
    this.arn,
    this.name,
  });
  static ListSecretVersionIdsResponse fromJson(Map<String, dynamic> json) =>
      ListSecretVersionIdsResponse();
}

class ListSecretsResponse {
  /// A list of the secrets in the account.
  final List<SecretListEntry> secretList;

  /// If present in the response, this value indicates that there's more output
  /// available than what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  ListSecretsResponse({
    this.secretList,
    this.nextToken,
  });
  static ListSecretsResponse fromJson(Map<String, dynamic> json) =>
      ListSecretsResponse();
}

class PutResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  final String arn;

  /// The friendly name of the secret that the resource-based policy was
  /// retrieved for.
  final String name;

  PutResourcePolicyResponse({
    this.arn,
    this.name,
  });
  static PutResourcePolicyResponse fromJson(Map<String, dynamic> json) =>
      PutResourcePolicyResponse();
}

class PutSecretValueResponse {
  /// The Amazon Resource Name (ARN) for the secret for which you just created a
  /// version.
  final String arn;

  /// The friendly name of the secret for which you just created or updated a
  /// version.
  final String name;

  /// The unique identifier of the version of the secret you just created or
  /// updated.
  final String versionId;

  /// The list of staging labels that are currently attached to this version of
  /// the secret. Staging labels are used to track a version as it progresses
  /// through the secret rotation process.
  final List<String> versionStages;

  PutSecretValueResponse({
    this.arn,
    this.name,
    this.versionId,
    this.versionStages,
  });
  static PutSecretValueResponse fromJson(Map<String, dynamic> json) =>
      PutSecretValueResponse();
}

class RestoreSecretResponse {
  /// The ARN of the secret that was restored.
  final String arn;

  /// The friendly name of the secret that was restored.
  final String name;

  RestoreSecretResponse({
    this.arn,
    this.name,
  });
  static RestoreSecretResponse fromJson(Map<String, dynamic> json) =>
      RestoreSecretResponse();
}

class RotateSecretResponse {
  /// The ARN of the secret.
  final String arn;

  /// The friendly name of the secret.
  final String name;

  /// The ID of the new version of the secret created by the rotation started by
  /// this request.
  final String versionId;

  RotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  static RotateSecretResponse fromJson(Map<String, dynamic> json) =>
      RotateSecretResponse();
}

/// A structure that defines the rotation configuration for the secret.
class RotationRulesType {
  /// Specifies the number of days between automatic scheduled rotations of the
  /// secret.
  ///
  /// Secrets Manager schedules the next rotation when the previous one is
  /// complete. Secrets Manager schedules the date by adding the rotation
  /// interval (number of days) to the actual date of the last rotation. The
  /// service chooses the hour within that 24-hour date window randomly. The
  /// minute is also chosen somewhat randomly, but weighted towards the top of
  /// the hour and influenced by a variety of factors that help distribute load.
  final BigInt automaticallyAfterDays;

  RotationRulesType({
    this.automaticallyAfterDays,
  });
  static RotationRulesType fromJson(Map<String, dynamic> json) =>
      RotationRulesType();
}

/// A structure that contains the details about a secret. It does not include
/// the encrypted `SecretString` and `SecretBinary` values. To get those values,
/// use the GetSecretValue operation.
class SecretListEntry {
  /// The Amazon Resource Name (ARN) of the secret.
  ///
  /// For more information about ARNs in Secrets Manager, see
  /// [Policy Resources](https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#iam-resources)
  /// in the _AWS Secrets Manager User Guide_.
  final String arn;

  /// The friendly name of the secret. You can use forward slashes in the name
  /// to represent a path hierarchy. For example, `/prod/databases/dbserver1`
  /// could represent the secret for a server named `dbserver1` in the folder
  /// `databases` in the folder `prod`.
  final String name;

  /// The user-provided description of the secret.
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) that's used to
  /// encrypt the `SecretString` and `SecretBinary` fields in each version of
  /// the secret. If you don't provide a key, then Secrets Manager defaults to
  /// encrypting the secret fields with the default KMS CMK (the one named
  /// `awssecretsmanager`) for this account.
  final String kmsKeyId;

  /// Indicated whether automatic, scheduled rotation is enabled for this
  /// secret.
  final bool rotationEnabled;

  /// The ARN of an AWS Lambda function that's invoked by Secrets Manager to
  /// rotate and expire the secret either automatically per the schedule or
  /// manually by a call to RotateSecret.
  final String rotationLambdaArn;

  /// A structure that defines the rotation configuration for the secret.
  final RotationRulesType rotationRules;

  /// The last date and time that the rotation process for this secret was
  /// invoked.
  final DateTime lastRotatedDate;

  /// The last date and time that this secret was modified in any way.
  final DateTime lastChangedDate;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  final DateTime lastAccessedDate;

  /// The date and time on which this secret was deleted. Not present on active
  /// secrets. The secret can be recovered until the number of days in the
  /// recovery window has passed, as specified in the `RecoveryWindowInDays`
  /// parameter of the DeleteSecret operation.
  final DateTime deletedDate;

  /// The list of user-defined tags that are associated with the secret. To add
  /// tags to a secret, use TagResource. To remove tags, use UntagResource.
  final List<Tag> tags;

  /// A list of all of the currently assigned `SecretVersionStage` staging
  /// labels and the `SecretVersionId` that each is attached to. Staging labels
  /// are used to keep track of the different versions during the rotation
  /// process.
  ///
  ///
  ///
  /// A version that does not have any `SecretVersionStage` is considered
  /// deprecated and subject to deletion. Such versions are not included in this
  /// list.
  final Map<String, List<String>> secretVersionsToStages;

  final String owningService;

  SecretListEntry({
    this.arn,
    this.name,
    this.description,
    this.kmsKeyId,
    this.rotationEnabled,
    this.rotationLambdaArn,
    this.rotationRules,
    this.lastRotatedDate,
    this.lastChangedDate,
    this.lastAccessedDate,
    this.deletedDate,
    this.tags,
    this.secretVersionsToStages,
    this.owningService,
  });
  static SecretListEntry fromJson(Map<String, dynamic> json) =>
      SecretListEntry();
}

/// A structure that contains information about one version of a secret.
class SecretVersionsListEntry {
  /// The unique version identifier of this version of the secret.
  final String versionId;

  /// An array of staging labels that are currently associated with this version
  /// of the secret.
  final List<String> versionStages;

  /// The date that this version of the secret was last accessed. Note that the
  /// resolution of this field is at the date level and does not include the
  /// time.
  final DateTime lastAccessedDate;

  /// The date and time this version of the secret was created.
  final DateTime createdDate;

  SecretVersionsListEntry({
    this.versionId,
    this.versionStages,
    this.lastAccessedDate,
    this.createdDate,
  });
  static SecretVersionsListEntry fromJson(Map<String, dynamic> json) =>
      SecretVersionsListEntry();
}

/// A structure that contains information about a tag.
class Tag {
  /// The key identifier, or name, of the tag.
  final String key;

  /// The string value that's associated with the key of the tag.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class UpdateSecretResponse {
  /// The ARN of the secret that was updated.
  ///
  ///
  ///
  /// Secrets Manager automatically adds several random characters to the name
  /// at the end of the ARN when you initially create a secret. This affects
  /// only the ARN and not the actual friendly name. This ensures that if you
  /// create a new secret with the same name as an old secret that you
  /// previously deleted, then users with access to the old secret _don't_
  /// automatically get access to the new secret because the ARNs are different.
  final String arn;

  /// The friendly name of the secret that was updated.
  final String name;

  /// If a new version of the secret was created by this operation, then
  /// `VersionId` contains the unique identifier of the new version.
  final String versionId;

  UpdateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  static UpdateSecretResponse fromJson(Map<String, dynamic> json) =>
      UpdateSecretResponse();
}

class UpdateSecretVersionStageResponse {
  /// The ARN of the secret with the staging label that was modified.
  final String arn;

  /// The friendly name of the secret with the staging label that was modified.
  final String name;

  UpdateSecretVersionStageResponse({
    this.arn,
    this.name,
  });
  static UpdateSecretVersionStageResponse fromJson(Map<String, dynamic> json) =>
      UpdateSecretVersionStageResponse();
}
