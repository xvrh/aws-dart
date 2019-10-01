import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Key Management Service
///
/// AWS Key Management Service (AWS KMS) is an encryption and key management web
/// service. This guide describes the AWS KMS operations that you can call
/// programmatically. For general information about AWS KMS, see the
/// [_AWS Key Management Service Developer Guide_](https://docs.aws.amazon.com/kms/latest/developerguide/)
/// .
///
///  AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms (Java, Ruby, .Net, macOS, Android,
/// etc.). The SDKs provide a convenient way to create programmatic access to
/// AWS KMS and other AWS services. For example, the SDKs take care of tasks
/// such as signing requests (see below), managing errors, and retrying requests
/// automatically. For more information about the AWS SDKs, including how to
/// download and install them, see
/// [Tools for Amazon Web Services](http://aws.amazon.com/tools/).
///
/// We recommend that you use the AWS SDKs to make programmatic API calls to AWS
/// KMS.
///
/// Clients must support TLS (Transport Layer Security) 1.0. We recommend TLS
/// 1.2. Clients must also support cipher suites with Perfect Forward Secrecy
/// (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve Ephemeral
/// Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and later support
/// these modes.
///
///  **Signing Requests**
///
/// Requests must be signed by using an access key ID and a secret access key.
/// We strongly recommend that you _do not_ use your AWS account (root) access
/// key ID and secret key for everyday work with AWS KMS. Instead, use the
/// access key ID and secret access key for an IAM user. You can also use the
/// AWS Security Token Service to generate temporary security credentials that
/// you can use to sign requests.
///
/// All AWS KMS operations require
/// [Signature Version 4](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
///
///  **Logging API Requests**
///
/// AWS KMS supports AWS CloudTrail, a service that logs AWS API calls and
/// related events for your AWS account and delivers them to an Amazon S3 bucket
/// that you specify. By using the information collected by CloudTrail, you can
/// determine what requests were made to AWS KMS, who made the request, when it
/// was made, and so on. To learn more about CloudTrail, including how to turn
/// it on and find your log files, see the
/// [AWS CloudTrail User Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/).
///
///  **Additional Resources**
///
/// For more information about credentials and request signing, see the
/// following:
///
/// *
/// [AWS Security Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html)
/// - This topic provides general information about the types of credentials
/// used for accessing AWS.
///
/// *
/// [Temporary Security Credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html)
/// - This section of the _IAM User Guide_ describes how to create and use
/// temporary security credentials.
///
/// *
/// [Signature Version 4 Signing Process](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html)
/// - This set of topics walks you through the process of signing a request
/// using an access key ID and a secret access key.
///
///
///  **Commonly Used API Operations**
///
/// Of the API operations discussed in this guide, the following will prove the
/// most useful for most applications. You will likely perform operations other
/// than these, such as creating keys and assigning policies, by using the
/// console.
///
/// *    Encrypt
///
/// *    Decrypt
///
/// *    GenerateDataKey
///
/// *    GenerateDataKeyWithoutPlaintext
class KmsApi {
  final _client;
  KmsApi(client) : _client = client.configured('KMS', serializer: 'json');

  /// Cancels the deletion of a customer master key (CMK). When this operation
  /// is successful, the CMK is set to the `Disabled` state. To enable a CMK,
  /// use EnableKey. You cannot perform this operation on a CMK in a different
  /// AWS account.
  ///
  /// For more information about scheduling and canceling deletion of a CMK, see
  /// [Deleting Customer Master Keys](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The unique identifier for the customer master key (CMK) for which
  /// to cancel deletion.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<CancelKeyDeletionResponse> cancelKeyDeletion(String keyId) async {
    var response_ = await _client.send('CancelKeyDeletion', {
      'KeyId': keyId,
    });
    return CancelKeyDeletionResponse.fromJson(response_);
  }

  /// Connects or reconnects a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// to its associated AWS CloudHSM cluster.
  ///
  /// The custom key store must be connected before you can create customer
  /// master keys (CMKs) in the key store or use the CMKs it contains. You can
  /// disconnect and reconnect a custom key store at any time.
  ///
  /// To connect a custom key store, its associated AWS CloudHSM cluster must
  /// have at least one active HSM. To get the number of active HSMs in a
  /// cluster, use the
  /// [DescribeClusters](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html)
  /// operation. To add HSMs to the cluster, use the
  /// [CreateHsm](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html)
  /// operation.
  ///
  /// The connection process can take an extended amount of time to complete; up
  /// to 20 minutes. This operation starts the connection process, but it does
  /// not wait for it to complete. When it succeeds, this operation quickly
  /// returns an HTTP 200 response and a JSON object with no properties.
  /// However, this response does not indicate that the custom key store is
  /// connected. To get the connection state of the custom key store, use the
  /// DescribeCustomKeyStores operation.
  ///
  /// During the connection process, AWS KMS finds the AWS CloudHSM cluster that
  /// is associated with the custom key store, creates the connection
  /// infrastructure, connects to the cluster, logs into the AWS CloudHSM client
  /// as the
  /// [`kmsuser` crypto user](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser)
  /// (CU), and rotates its password.
  ///
  /// The `ConnectCustomKeyStore` operation might fail for various reasons. To
  /// find the reason, use the DescribeCustomKeyStores operation and see the
  /// `ConnectionErrorCode` in the response. For help interpreting the
  /// `ConnectionErrorCode`, see CustomKeyStoresListEntry.
  ///
  /// To fix the failure, use the DisconnectCustomKeyStore operation to
  /// disconnect the custom key store, correct the error, use the
  /// UpdateCustomKeyStore operation if necessary, and then use
  /// `ConnectCustomKeyStore` again.
  ///
  /// If you are having trouble connecting or disconnecting a custom key store,
  /// see
  /// [Troubleshooting a Custom Key Store](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [customKeyStoreId]: Enter the key store ID of the custom key store that
  /// you want to connect. To find the ID of a custom key store, use the
  /// DescribeCustomKeyStores operation.
  Future<ConnectCustomKeyStoreResponse> connectCustomKeyStore(
      String customKeyStoreId) async {
    var response_ = await _client.send('ConnectCustomKeyStore', {
      'CustomKeyStoreId': customKeyStoreId,
    });
    return ConnectCustomKeyStoreResponse.fromJson(response_);
  }

  /// Creates a display name for a customer managed customer master key (CMK).
  /// You can use an alias to identify a CMK in selected operations, such as
  /// Encrypt and GenerateDataKey.
  ///
  /// Each CMK can have multiple aliases, but each alias points to only one CMK.
  /// The alias name must be unique in the AWS account and region. To simplify
  /// code that runs in multiple regions, use the same alias name, but point it
  /// to a different CMK in each region.
  ///
  /// Because an alias is not a property of a CMK, you can delete and change the
  /// aliases of a CMK without affecting the CMK. Also, aliases do not appear in
  /// the response from the DescribeKey operation. To get the aliases of all
  /// CMKs, use the ListAliases operation.
  ///
  /// The alias name must begin with `alias/` followed by a name, such as
  /// `alias/ExampleAlias`. It can contain only alphanumeric characters, forward
  /// slashes (/), underscores (_), and dashes (-). The alias name cannot begin
  /// with `alias/aws/`. The `alias/aws/` prefix is reserved for
  /// [AWS managed CMKs](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk).
  ///
  /// The alias and the CMK it is mapped to must be in the same AWS account and
  /// the same region. You cannot perform this operation on an alias in a
  /// different AWS account.
  ///
  /// To map an existing alias to a different CMK, call UpdateAlias.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [aliasName]: Specifies the alias name. This value must begin with `alias/`
  /// followed by a name, such as `alias/ExampleAlias`. The alias name cannot
  /// begin with `alias/aws/`. The `alias/aws/` prefix is reserved for AWS
  /// managed CMKs.
  ///
  /// [targetKeyId]: Identifies the CMK to which the alias refers. Specify the
  /// key ID or the Amazon Resource Name (ARN) of the CMK. You cannot specify
  /// another alias. For help finding the key ID and ARN, see
  /// [Finding the Key ID and ARN](https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<void> createAlias(
      {@required String aliasName, @required String targetKeyId}) async {
    await _client.send('CreateAlias', {
      'AliasName': aliasName,
      'TargetKeyId': targetKeyId,
    });
  }

  /// Creates a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// that is associated with an
  /// [AWS CloudHSM cluster](https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html)
  /// that you own and manage.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// Before you create the custom key store, you must assemble the required
  /// elements, including an AWS CloudHSM cluster that fulfills the requirements
  /// for a custom key store. For details about the required elements, see
  /// [Assemble the Prerequisites](https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// When the operation completes successfully, it returns the ID of the new
  /// custom key store. Before you can use your new custom key store, you need
  /// to use the ConnectCustomKeyStore operation to connect the new key store to
  /// its AWS CloudHSM cluster. Even if you are not going to use your custom key
  /// store immediately, you might want to connect it to verify that all
  /// settings are correct and then disconnect it until you are ready to use it.
  ///
  /// For help with failures, see
  /// [Troubleshooting a Custom Key Store](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [customKeyStoreName]: Specifies a friendly name for the custom key store.
  /// The name must be unique in your AWS account.
  ///
  /// [cloudHsmClusterId]: Identifies the AWS CloudHSM cluster for the custom
  /// key store. Enter the cluster ID of any active AWS CloudHSM cluster that is
  /// not already associated with a custom key store. To find the cluster ID,
  /// use the
  /// [DescribeClusters](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html)
  /// operation.
  ///
  /// [trustAnchorCertificate]: Enter the content of the trust anchor
  /// certificate for the cluster. This is the content of the `customerCA.crt`
  /// file that you created when you
  /// [initialized the cluster](https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html).
  ///
  /// [keyStorePassword]: Enter the password of the
  /// [`kmsuser` crypto user (CU) account](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser)
  /// in the specified AWS CloudHSM cluster. AWS KMS logs into the cluster as
  /// this user to manage key material on your behalf.
  ///
  /// This parameter tells AWS KMS the `kmsuser` account password; it does not
  /// change the password in the AWS CloudHSM cluster.
  Future<CreateCustomKeyStoreResponse> createCustomKeyStore(
      {@required String customKeyStoreName,
      @required String cloudHsmClusterId,
      @required String trustAnchorCertificate,
      @required String keyStorePassword}) async {
    var response_ = await _client.send('CreateCustomKeyStore', {
      'CustomKeyStoreName': customKeyStoreName,
      'CloudHsmClusterId': cloudHsmClusterId,
      'TrustAnchorCertificate': trustAnchorCertificate,
      'KeyStorePassword': keyStorePassword,
    });
    return CreateCustomKeyStoreResponse.fromJson(response_);
  }

  /// Adds a grant to a customer master key (CMK). The grant allows the grantee
  /// principal to use the CMK when the conditions specified in the grant are
  /// met. When setting permissions, grants are an alternative to key policies.
  ///
  /// To create a grant that allows a cryptographic operation only when the
  /// encryption context in the operation request matches or includes a
  /// specified encryption context, use the `Constraints` parameter. For
  /// details, see GrantConstraints.
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN in the value of the `KeyId` parameter. For more information about
  /// grants, see
  /// [Grants](https://docs.aws.amazon.com/kms/latest/developerguide/grants.html)
  /// in the  __AWS Key Management Service Developer Guide__ .
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The unique identifier for the customer master key (CMK) that the
  /// grant applies to.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [granteePrincipal]: The principal that is given permission to perform the
  /// operations that the grant permits.
  ///
  /// To specify the principal, use the
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of an AWS principal. Valid AWS principals include AWS accounts (root), IAM
  /// users, IAM roles, federated users, and assumed role users. For examples of
  /// the ARN syntax to use for specifying a principal, see
  /// [AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam)
  /// in the Example ARNs section of the _AWS General Reference_.
  ///
  /// [retiringPrincipal]: The principal that is given permission to retire the
  /// grant by using RetireGrant operation.
  ///
  /// To specify the principal, use the
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of an AWS principal. Valid AWS principals include AWS accounts (root), IAM
  /// users, federated users, and assumed role users. For examples of the ARN
  /// syntax to use for specifying a principal, see
  /// [AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam)
  /// in the Example ARNs section of the _AWS General Reference_.
  ///
  /// [operations]: A list of operations that the grant permits.
  ///
  /// [constraints]: Allows a cryptographic operation only when the encryption
  /// context matches or includes the encryption context specified in this
  /// structure. For more information about encryption context, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context)
  /// in the  __AWS Key Management Service Developer Guide__ .
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [name]: A friendly name for identifying the grant. Use this value to
  /// prevent the unintended creation of duplicate grants when retrying this
  /// request.
  ///
  /// When this value is absent, all `CreateGrant` requests result in a new
  /// grant with a unique `GrantId` even if all the supplied parameters are
  /// identical. This can result in unintended duplicates when you retry the
  /// `CreateGrant` request.
  ///
  /// When this value is present, you can retry a `CreateGrant` request with
  /// identical parameters; if the grant already exists, the original `GrantId`
  /// is returned without creating a new grant. Note that the returned grant
  /// token is unique with every `CreateGrant` request, even when a duplicate
  /// `GrantId` is returned. All grant tokens obtained in this way can be used
  /// interchangeably.
  Future<CreateGrantResponse> createGrant(
      {@required String keyId,
      @required String granteePrincipal,
      String retiringPrincipal,
      @required List<String> operations,
      GrantConstraints constraints,
      List<String> grantTokens,
      String name}) async {
    var response_ = await _client.send('CreateGrant', {
      'KeyId': keyId,
      'GranteePrincipal': granteePrincipal,
      if (retiringPrincipal != null) 'RetiringPrincipal': retiringPrincipal,
      'Operations': operations,
      if (constraints != null) 'Constraints': constraints,
      if (grantTokens != null) 'GrantTokens': grantTokens,
      if (name != null) 'Name': name,
    });
    return CreateGrantResponse.fromJson(response_);
  }

  /// Creates a customer managed
  /// [customer master key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys)
  /// (CMK) in your AWS account.
  ///
  /// You can use a CMK to encrypt small amounts of data (up to 4096 bytes)
  /// directly. But CMKs are more commonly used to encrypt the
  /// [data keys](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys)
  /// that are used to encrypt data.
  ///
  /// To create a CMK for imported key material, use the `Origin` parameter with
  /// a value of `EXTERNAL`.
  ///
  /// To create a CMK in a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html),
  /// use the `CustomKeyStoreId` parameter to specify the custom key store. You
  /// must also use the `Origin` parameter with a value of `AWS_CLOUDHSM`. The
  /// AWS CloudHSM cluster that is associated with the custom key store must
  /// have at least two active HSMs in different Availability Zones in the AWS
  /// Region.
  ///
  /// You cannot use this operation to create a CMK in a different AWS account.
  ///
  /// [policy]: The key policy to attach to the CMK.
  ///
  /// If you provide a key policy, it must meet the following criteria:
  ///
  /// *   If you don't set `BypassPolicyLockoutSafetyCheck` to true, the key
  /// policy must allow the principal that is making the `CreateKey` request to
  /// make a subsequent PutKeyPolicy request on the CMK. This reduces the risk
  /// that the CMK becomes unmanageable. For more information, refer to the
  /// scenario in the
  /// [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam)
  /// section of the  __AWS Key Management Service Developer Guide__ .
  ///
  /// *   Each statement in the key policy must contain one or more principals.
  /// The principals in the key policy must exist and be visible to AWS KMS.
  /// When you create a new AWS principal (for example, an IAM user or role),
  /// you might need to enforce a delay before including the new principal in a
  /// key policy because the new principal might not be immediately visible to
  /// AWS KMS. For more information, see
  /// [Changes that I make are not always immediately visible](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency)
  /// in the _AWS Identity and Access Management User Guide_.
  ///
  ///
  /// If you do not provide a key policy, AWS KMS attaches a default key policy
  /// to the CMK. For more information, see
  /// [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// The key policy size limit is 32 kilobytes (32768 bytes).
  ///
  /// [description]: A description of the CMK.
  ///
  /// Use a description that helps you decide whether the CMK is appropriate for
  /// a task.
  ///
  /// [keyUsage]: The cryptographic operations for which you can use the CMK.
  /// The only valid value is `ENCRYPT_DECRYPT`, which means you can use the CMK
  /// to encrypt and decrypt data.
  ///
  /// [origin]: The source of the key material for the CMK. You cannot change
  /// the origin after you create the CMK.
  ///
  /// The default is `AWS_KMS`, which means AWS KMS creates the key material in
  /// its own key store.
  ///
  /// When the parameter value is `EXTERNAL`, AWS KMS creates a CMK without key
  /// material so that you can import key material from your existing key
  /// management infrastructure. For more information about importing key
  /// material into AWS KMS, see
  /// [Importing Key Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// When the parameter value is `AWS_CLOUDHSM`, AWS KMS creates the CMK in an
  /// AWS KMS
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// and creates its key material in the associated AWS CloudHSM cluster. You
  /// must also use the `CustomKeyStoreId` parameter to identify the custom key
  /// store.
  ///
  /// [customKeyStoreId]: Creates the CMK in the specified
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// and the key material in its associated AWS CloudHSM cluster. To create a
  /// CMK in a custom key store, you must also specify the `Origin` parameter
  /// with a value of `AWS_CLOUDHSM`. The AWS CloudHSM cluster that is
  /// associated with the custom key store must have at least two active HSMs,
  /// each in a different Availability Zone in the Region.
  ///
  /// To find the ID of a custom key store, use the DescribeCustomKeyStores
  /// operation.
  ///
  /// The response includes the custom key store ID and the ID of the AWS
  /// CloudHSM cluster.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// [bypassPolicyLockoutSafetyCheck]: A flag to indicate whether to bypass the
  /// key policy lockout safety check.
  ///
  ///  Setting this value to true increases the risk that the CMK becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the
  /// [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam)
  /// section in the  __AWS Key Management Service Developer Guide__ .
  ///
  /// Use this parameter only when you include a policy in the request and you
  /// intend to prevent the principal that is making the request from making a
  /// subsequent PutKeyPolicy request on the CMK.
  ///
  /// The default value is false.
  ///
  /// [tags]: One or more tags. Each tag consists of a tag key and a tag value.
  /// Tag keys and tag values are both required, but tag values can be empty
  /// (null) strings.
  ///
  /// Use this parameter to tag the CMK when it is created. Alternately, you can
  /// omit this parameter and instead tag the CMK after it is created using
  /// TagResource.
  Future<CreateKeyResponse> createKey(
      {String policy,
      String description,
      String keyUsage,
      String origin,
      String customKeyStoreId,
      bool bypassPolicyLockoutSafetyCheck,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateKey', {
      if (policy != null) 'Policy': policy,
      if (description != null) 'Description': description,
      if (keyUsage != null) 'KeyUsage': keyUsage,
      if (origin != null) 'Origin': origin,
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
      if (bypassPolicyLockoutSafetyCheck != null)
        'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
      if (tags != null) 'Tags': tags,
    });
    return CreateKeyResponse.fromJson(response_);
  }

  /// Decrypts ciphertext. Ciphertext is plaintext that has been previously
  /// encrypted by using any of the following operations:
  ///
  /// *    GenerateDataKey
  ///
  /// *    GenerateDataKeyWithoutPlaintext
  ///
  /// *    Encrypt
  ///
  ///
  /// Whenever possible, use key policies to give users permission to call the
  /// Decrypt operation on the CMK, instead of IAM policies. Otherwise, you
  /// might create an IAM user policy that gives the user Decrypt permission on
  /// all CMKs. This user could decrypt ciphertext that was encrypted by CMKs in
  /// other accounts if the key policy for the cross-account CMK permits it. If
  /// you must use an IAM policy for `Decrypt` permissions, limit the user to
  /// particular CMKs or particular trusted accounts.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [ciphertextBlob]: Ciphertext to be decrypted. The blob includes metadata.
  ///
  /// [encryptionContext]: The encryption context. If this was specified in the
  /// Encrypt function, it must be specified here or the decryption operation
  /// will fail. For more information, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context).
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<DecryptResponse> decrypt(Uint8List ciphertextBlob,
      {Map<String, String> encryptionContext, List<String> grantTokens}) async {
    var response_ = await _client.send('Decrypt', {
      'CiphertextBlob': ciphertextBlob,
      if (encryptionContext != null) 'EncryptionContext': encryptionContext,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return DecryptResponse.fromJson(response_);
  }

  /// Deletes the specified alias. You cannot perform this operation on an alias
  /// in a different AWS account.
  ///
  /// Because an alias is not a property of a CMK, you can delete and change the
  /// aliases of a CMK without affecting the CMK. Also, aliases do not appear in
  /// the response from the DescribeKey operation. To get the aliases of all
  /// CMKs, use the ListAliases operation.
  ///
  /// Each CMK can have multiple aliases. To change the alias of a CMK, use
  /// DeleteAlias to delete the current alias and CreateAlias to create a new
  /// alias. To associate an existing alias with a different customer master key
  /// (CMK), call UpdateAlias.
  ///
  /// [aliasName]: The alias to be deleted. The alias name must begin with
  /// `alias/` followed by the alias name, such as `alias/ExampleAlias`.
  Future<void> deleteAlias(String aliasName) async {
    await _client.send('DeleteAlias', {
      'AliasName': aliasName,
    });
  }

  /// Deletes a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html).
  /// This operation does not delete the AWS CloudHSM cluster that is associated
  /// with the custom key store, or affect any users or keys in the cluster.
  ///
  /// The custom key store that you delete cannot contain any AWS KMS
  /// [customer master keys (CMKs)](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys).
  /// Before deleting the key store, verify that you will never need to use any
  /// of the CMKs in the key store for any cryptographic operations. Then, use
  /// ScheduleKeyDeletion to delete the AWS KMS customer master keys (CMKs) from
  /// the key store. When the scheduled waiting period expires, the
  /// `ScheduleKeyDeletion` operation deletes the CMKs. Then it makes a best
  /// effort to delete the key material from the associated cluster. However,
  /// you might need to manually
  /// [delete the orphaned key material](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key)
  /// from the cluster and its backups.
  ///
  /// After all CMKs are deleted from AWS KMS, use DisconnectCustomKeyStore to
  /// disconnect the key store from AWS KMS. Then, you can delete the custom key
  /// store.
  ///
  /// Instead of deleting the custom key store, consider using
  /// DisconnectCustomKeyStore to disconnect it from AWS KMS. While the key
  /// store is disconnected, you cannot create or use the CMKs in the key store.
  /// But, you do not need to delete CMKs and you can reconnect a disconnected
  /// custom key store at any time.
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// [customKeyStoreId]: Enter the ID of the custom key store you want to
  /// delete. To find the ID of a custom key store, use the
  /// DescribeCustomKeyStores operation.
  Future<DeleteCustomKeyStoreResponse> deleteCustomKeyStore(
      String customKeyStoreId) async {
    var response_ = await _client.send('DeleteCustomKeyStore', {
      'CustomKeyStoreId': customKeyStoreId,
    });
    return DeleteCustomKeyStoreResponse.fromJson(response_);
  }

  /// Deletes key material that you previously imported. This operation makes
  /// the specified customer master key (CMK) unusable. For more information
  /// about importing key material into AWS KMS, see
  /// [Importing Key Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html)
  /// in the _AWS Key Management Service Developer Guide_. You cannot perform
  /// this operation on a CMK in a different AWS account.
  ///
  /// When the specified CMK is in the `PendingDeletion` state, this operation
  /// does not change the CMK's state. Otherwise, it changes the CMK's state to
  /// `PendingImport`.
  ///
  /// After you delete key material, you can use ImportKeyMaterial to reimport
  /// the same key material into the CMK.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: Identifies the CMK from which you are deleting imported key
  /// material. The `Origin` of the CMK must be `EXTERNAL`.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<void> deleteImportedKeyMaterial(String keyId) async {
    await _client.send('DeleteImportedKeyMaterial', {
      'KeyId': keyId,
    });
  }

  /// Gets information about
  /// [custom key stores](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// in the account and region.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// By default, this operation returns information about all custom key stores
  /// in the account and region. To get only information about a particular
  /// custom key store, use either the `CustomKeyStoreName` or
  /// `CustomKeyStoreId` parameter (but not both).
  ///
  /// To determine whether the custom key store is connected to its AWS CloudHSM
  /// cluster, use the `ConnectionState` element in the response. If an attempt
  /// to connect the custom key store failed, the `ConnectionState` value is
  /// `FAILED` and the `ConnectionErrorCode` element in the response indicates
  /// the cause of the failure. For help interpreting the `ConnectionErrorCode`,
  /// see CustomKeyStoresListEntry.
  ///
  /// Custom key stores have a `DISCONNECTED` connection state if the key store
  /// has never been connected or you use the DisconnectCustomKeyStore operation
  /// to disconnect it. If your custom key store state is `CONNECTED` but you
  /// are having trouble using it, make sure that its associated AWS CloudHSM
  /// cluster is active and contains the minimum number of HSMs required for the
  /// operation, if any.
  ///
  ///  For help repairing your custom key store, see the
  /// [Troubleshooting Custom Key Stores](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html)
  /// topic in the _AWS Key Management Service Developer Guide_.
  ///
  /// [customKeyStoreId]: Gets only information about the specified custom key
  /// store. Enter the key store ID.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and region. To limit the output to a particular custom key
  /// store, you can use either the `CustomKeyStoreId` or `CustomKeyStoreName`
  /// parameter, but not both.
  ///
  /// [customKeyStoreName]: Gets only information about the specified custom key
  /// store. Enter the friendly name of the custom key store.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and region. To limit the output to a particular custom key
  /// store, you can use either the `CustomKeyStoreId` or `CustomKeyStoreName`
  /// parameter, but not both.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  Future<DescribeCustomKeyStoresResponse> describeCustomKeyStores(
      {String customKeyStoreId,
      String customKeyStoreName,
      int limit,
      String marker}) async {
    var response_ = await _client.send('DescribeCustomKeyStores', {
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
      if (customKeyStoreName != null) 'CustomKeyStoreName': customKeyStoreName,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return DescribeCustomKeyStoresResponse.fromJson(response_);
  }

  /// Provides detailed information about the specified customer master key
  /// (CMK).
  ///
  /// You can use `DescribeKey` on a predefined AWS alias, that is, an AWS alias
  /// with no key ID. When you do, AWS KMS associates the alias with an
  /// [AWS managed CMK](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys)
  /// and returns its `KeyId` and `Arn` in the response.
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN or alias ARN in the value of the KeyId parameter.
  ///
  /// [keyId]: Describes the specified customer master key (CMK).
  ///
  /// If you specify a predefined AWS alias (an AWS alias with no key ID), KMS
  /// associates the alias with an
  /// [AWS managed CMK](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys)
  /// and returns its `KeyId` and `Arn` in the response.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with `"alias/"`. To
  /// specify a CMK in a different AWS account, you must use the key ARN or
  /// alias ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Alias name: `alias/ExampleAlias`
  ///
  /// *   Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey. To
  /// get the alias name and alias ARN, use ListAliases.
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<DescribeKeyResponse> describeKey(String keyId,
      {List<String> grantTokens}) async {
    var response_ = await _client.send('DescribeKey', {
      'KeyId': keyId,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return DescribeKeyResponse.fromJson(response_);
  }

  /// Sets the state of a customer master key (CMK) to disabled, thereby
  /// preventing its use for cryptographic operations. You cannot perform this
  /// operation on a CMK in a different AWS account.
  ///
  /// For more information about how key state affects the use of a CMK, see
  /// [How Key State Affects the Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the  __AWS Key Management Service Developer Guide__ .
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<void> disableKey(String keyId) async {
    await _client.send('DisableKey', {
      'KeyId': keyId,
    });
  }

  /// Disables
  /// [automatic rotation of the key material](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html)
  /// for the specified customer master key (CMK). You cannot perform this
  /// operation on a CMK in a different AWS account.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<void> disableKeyRotation(String keyId) async {
    await _client.send('DisableKeyRotation', {
      'KeyId': keyId,
    });
  }

  /// Disconnects the
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// from its associated AWS CloudHSM cluster. While a custom key store is
  /// disconnected, you can manage the custom key store and its customer master
  /// keys (CMKs), but you cannot create or use CMKs in the custom key store.
  /// You can reconnect the custom key store at any time.
  ///
  ///  While a custom key store is disconnected, all attempts to create customer
  /// master keys (CMKs) in the custom key store or to use existing CMKs in
  /// cryptographic operations will fail. This action can prevent users from
  /// storing and accessing sensitive data.
  ///
  /// To find the connection state of a custom key store, use the
  /// DescribeCustomKeyStores operation. To reconnect a custom key store, use
  /// the ConnectCustomKeyStore operation.
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// [customKeyStoreId]: Enter the ID of the custom key store you want to
  /// disconnect. To find the ID of a custom key store, use the
  /// DescribeCustomKeyStores operation.
  Future<DisconnectCustomKeyStoreResponse> disconnectCustomKeyStore(
      String customKeyStoreId) async {
    var response_ = await _client.send('DisconnectCustomKeyStore', {
      'CustomKeyStoreId': customKeyStoreId,
    });
    return DisconnectCustomKeyStoreResponse.fromJson(response_);
  }

  /// Sets the key state of a customer master key (CMK) to enabled. This allows
  /// you to use the CMK for cryptographic operations. You cannot perform this
  /// operation on a CMK in a different AWS account.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<void> enableKey(String keyId) async {
    await _client.send('EnableKey', {
      'KeyId': keyId,
    });
  }

  /// Enables
  /// [automatic rotation of the key material](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html)
  /// for the specified customer master key (CMK). You cannot perform this
  /// operation on a CMK in a different AWS account.
  ///
  /// You cannot enable automatic rotation of CMKs with imported key material or
  /// CMKs in a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html).
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<void> enableKeyRotation(String keyId) async {
    await _client.send('EnableKeyRotation', {
      'KeyId': keyId,
    });
  }

  /// Encrypts plaintext into ciphertext by using a customer master key (CMK).
  /// The `Encrypt` operation has two primary use cases:
  ///
  /// *   You can encrypt up to 4 kilobytes (4096 bytes) of arbitrary data such
  /// as an RSA key, a database password, or other sensitive information.
  ///
  /// *   You can use the `Encrypt` operation to move encrypted data from one
  /// AWS region to another. In the first region, generate a data key and use
  /// the plaintext key to encrypt the data. Then, in the new region, call the
  /// `Encrypt` method on same plaintext data key. Now, you can safely move the
  /// encrypted data and encrypted data key to the new region, and decrypt in
  /// the new region when necessary.
  ///
  ///
  /// You don't need use this operation to encrypt a data key within a region.
  /// The GenerateDataKey and GenerateDataKeyWithoutPlaintext operations return
  /// an encrypted data key.
  ///
  /// Also, you don't need to use this operation to encrypt data in your
  /// application. You can use the plaintext and encrypted data keys that the
  /// `GenerateDataKey` operation returns.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN or alias ARN in the value of the KeyId parameter.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with `"alias/"`. To
  /// specify a CMK in a different AWS account, you must use the key ARN or
  /// alias ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Alias name: `alias/ExampleAlias`
  ///
  /// *   Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey. To
  /// get the alias name and alias ARN, use ListAliases.
  ///
  /// [plaintext]: Data to be encrypted.
  ///
  /// [encryptionContext]: Name-value pair that specifies the encryption context
  /// to be used for authenticated encryption. If used here, the same value must
  /// be supplied to the `Decrypt` API or decryption will fail. For more
  /// information, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context).
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<EncryptResponse> encrypt(
      {@required String keyId,
      @required Uint8List plaintext,
      Map<String, String> encryptionContext,
      List<String> grantTokens}) async {
    var response_ = await _client.send('Encrypt', {
      'KeyId': keyId,
      'Plaintext': plaintext,
      if (encryptionContext != null) 'EncryptionContext': encryptionContext,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return EncryptResponse.fromJson(response_);
  }

  /// Generates a unique data key. This operation returns a plaintext copy of
  /// the data key and a copy that is encrypted under a customer master key
  /// (CMK) that you specify. You can use the plaintext key to encrypt your data
  /// outside of KMS and store the encrypted data key with the encrypted data.
  ///
  ///  `GenerateDataKey` returns a unique data key for each request. The bytes
  /// in the key are not related to the caller or CMK that is used to encrypt
  /// the data key.
  ///
  /// To generate a data key, you need to specify the customer master key (CMK)
  /// that will be used to encrypt the data key. You must also specify the
  /// length of the data key using either the `KeySpec` or `NumberOfBytes` field
  /// (but not both). For common key lengths (128-bit and 256-bit symmetric
  /// keys), we recommend that you use `KeySpec`. To perform this operation on a
  /// CMK in a different AWS account, specify the key ARN or alias ARN in the
  /// value of the KeyId parameter.
  ///
  /// You will find the plaintext copy of the data key in the `Plaintext` field
  /// of the response, and the encrypted copy of the data key in the
  /// `CiphertextBlob` field.
  ///
  /// We recommend that you use the following pattern to encrypt data locally in
  /// your application:
  ///
  /// 1.  Use the `GenerateDataKey` operation to get a data encryption key.
  ///
  /// 2.  Use the plaintext data key (returned in the `Plaintext` field of the
  /// response) to encrypt data locally, then erase the plaintext data key from
  /// memory.
  ///
  /// 3.  Store the encrypted data key (returned in the `CiphertextBlob` field
  /// of the response) alongside the locally encrypted data.
  ///
  ///
  /// To decrypt data locally:
  ///
  /// 1.  Use the Decrypt operation to decrypt the encrypted data key. The
  /// operation returns a plaintext copy of the data key.
  ///
  /// 2.  Use the plaintext data key to decrypt data locally, then erase the
  /// plaintext data key from memory.
  ///
  ///
  /// To get only an encrypted copy of the data key, use
  /// GenerateDataKeyWithoutPlaintext. To get a cryptographically secure random
  /// byte string, use GenerateRandom.
  ///
  /// You can use the optional encryption context to add additional security to
  /// your encryption operation. When you specify an `EncryptionContext` in the
  /// `GenerateDataKey` operation, you must specify the same encryption context
  /// (a case-sensitive exact match) in your request to Decrypt the data key.
  /// Otherwise, the request to decrypt fails with an
  /// `InvalidCiphertextException`. For more information, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context)
  /// in the  __AWS Key Management Service Developer Guide__ .
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: An identifier for the CMK that encrypts the data key.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with `"alias/"`. To
  /// specify a CMK in a different AWS account, you must use the key ARN or
  /// alias ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Alias name: `alias/ExampleAlias`
  ///
  /// *   Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey. To
  /// get the alias name and alias ARN, use ListAliases.
  ///
  /// [encryptionContext]: A set of key-value pairs that represents additional
  /// authenticated data.
  ///
  /// For more information, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [numberOfBytes]: The length of the data key in bytes. For example, use the
  /// value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common
  /// key lengths (128-bit and 256-bit symmetric keys), we recommend that you
  /// use the `KeySpec` field instead of this one.
  ///
  /// [keySpec]: The length of the data key. Use `AES_128` to generate a 128-bit
  /// symmetric key, or `AES_256` to generate a 256-bit symmetric key.
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<GenerateDataKeyResponse> generateDataKey(String keyId,
      {Map<String, String> encryptionContext,
      int numberOfBytes,
      String keySpec,
      List<String> grantTokens}) async {
    var response_ = await _client.send('GenerateDataKey', {
      'KeyId': keyId,
      if (encryptionContext != null) 'EncryptionContext': encryptionContext,
      if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      if (keySpec != null) 'KeySpec': keySpec,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return GenerateDataKeyResponse.fromJson(response_);
  }

  /// Generates a unique data key. This operation returns a data key that is
  /// encrypted under a customer master key (CMK) that you specify.
  /// `GenerateDataKeyWithoutPlaintext` is identical to GenerateDataKey except
  /// that returns only the encrypted copy of the data key.
  ///
  /// Like `GenerateDataKey`, `GenerateDataKeyWithoutPlaintext` returns a unique
  /// data key for each request. The bytes in the key are not related to the
  /// caller or CMK that is used to encrypt the data key.
  ///
  /// This operation is useful for systems that need to encrypt data at some
  /// point, but not immediately. When you need to encrypt the data, you call
  /// the Decrypt operation on the encrypted copy of the key.
  ///
  /// It's also useful in distributed systems with different levels of trust.
  /// For example, you might store encrypted data in containers. One component
  /// of your system creates new containers and stores an encrypted data key
  /// with each container. Then, a different component puts the data into the
  /// containers. That component first decrypts the data key, uses the plaintext
  /// data key to encrypt data, puts the encrypted data into the container, and
  /// then destroys the plaintext data key. In this system, the component that
  /// creates the containers never sees the plaintext data key.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The identifier of the customer master key (CMK) that encrypts the
  /// data key.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with `"alias/"`. To
  /// specify a CMK in a different AWS account, you must use the key ARN or
  /// alias ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Alias name: `alias/ExampleAlias`
  ///
  /// *   Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey. To
  /// get the alias name and alias ARN, use ListAliases.
  ///
  /// [encryptionContext]: A set of key-value pairs that represents additional
  /// authenticated data.
  ///
  /// For more information, see
  /// [Encryption Context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keySpec]: The length of the data key. Use `AES_128` to generate a 128-bit
  /// symmetric key, or `AES_256` to generate a 256-bit symmetric key.
  ///
  /// [numberOfBytes]: The length of the data key in bytes. For example, use the
  /// value 64 to generate a 512-bit data key (64 bytes is 512 bits). For common
  /// key lengths (128-bit and 256-bit symmetric keys), we recommend that you
  /// use the `KeySpec` field instead of this one.
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<GenerateDataKeyWithoutPlaintextResponse>
      generateDataKeyWithoutPlaintext(String keyId,
          {Map<String, String> encryptionContext,
          String keySpec,
          int numberOfBytes,
          List<String> grantTokens}) async {
    var response_ = await _client.send('GenerateDataKeyWithoutPlaintext', {
      'KeyId': keyId,
      if (encryptionContext != null) 'EncryptionContext': encryptionContext,
      if (keySpec != null) 'KeySpec': keySpec,
      if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return GenerateDataKeyWithoutPlaintextResponse.fromJson(response_);
  }

  /// Returns a random byte string that is cryptographically secure.
  ///
  /// By default, the random byte string is generated in AWS KMS. To generate
  /// the byte string in the AWS CloudHSM cluster that is associated with a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html),
  /// specify the custom key store ID.
  ///
  /// For more information about entropy and random number generation, see the
  /// [AWS Key Management Service Cryptographic Details](https://d0.awsstatic.com/whitepapers/KMS-Cryptographic-Details.pdf)
  /// whitepaper.
  ///
  /// [numberOfBytes]: The length of the byte string.
  ///
  /// [customKeyStoreId]: Generates the random byte string in the AWS CloudHSM
  /// cluster that is associated with the specified
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html).
  /// To find the ID of a custom key store, use the DescribeCustomKeyStores
  /// operation.
  Future<GenerateRandomResponse> generateRandom(
      {int numberOfBytes, String customKeyStoreId}) async {
    var response_ = await _client.send('GenerateRandom', {
      if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
    });
    return GenerateRandomResponse.fromJson(response_);
  }

  /// Gets a key policy attached to the specified customer master key (CMK). You
  /// cannot perform this operation on a CMK in a different AWS account.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [policyName]: Specifies the name of the key policy. The only valid name is
  /// `default`. To get the names of key policies, use ListKeyPolicies.
  Future<GetKeyPolicyResponse> getKeyPolicy(
      {@required String keyId, @required String policyName}) async {
    var response_ = await _client.send('GetKeyPolicy', {
      'KeyId': keyId,
      'PolicyName': policyName,
    });
    return GetKeyPolicyResponse.fromJson(response_);
  }

  /// Gets a Boolean value that indicates whether
  /// [automatic rotation of the key material](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html)
  /// is enabled for the specified customer master key (CMK).
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// *   Disabled: The key rotation status does not change when you disable a
  /// CMK. However, while the CMK is disabled, AWS KMS does not rotate the
  /// backing key.
  ///
  /// *   Pending deletion: While a CMK is pending deletion, its key rotation
  /// status is `false` and AWS KMS does not rotate the backing key. If you
  /// cancel the deletion, the original key rotation status is restored.
  ///
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN in the value of the `KeyId` parameter.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<GetKeyRotationStatusResponse> getKeyRotationStatus(
      String keyId) async {
    var response_ = await _client.send('GetKeyRotationStatus', {
      'KeyId': keyId,
    });
    return GetKeyRotationStatusResponse.fromJson(response_);
  }

  /// Returns the items you need in order to import key material into AWS KMS
  /// from your existing key management infrastructure. For more information
  /// about importing key material into AWS KMS, see
  /// [Importing Key Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// You must specify the key ID of the customer master key (CMK) into which
  /// you will import key material. This CMK's `Origin` must be `EXTERNAL`. You
  /// must also specify the wrapping algorithm and type of wrapping key (public
  /// key) that you will use to encrypt the key material. You cannot perform
  /// this operation on a CMK in a different AWS account.
  ///
  /// This operation returns a public key and an import token. Use the public
  /// key to encrypt the key material. Store the import token to send with a
  /// subsequent ImportKeyMaterial request. The public key and import token from
  /// the same response must be used together. These items are valid for 24
  /// hours. When they expire, they cannot be used for a subsequent
  /// ImportKeyMaterial request. To get new ones, send another
  /// `GetParametersForImport` request.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The identifier of the CMK into which you will import key
  /// material. The CMK's `Origin` must be `EXTERNAL`.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [wrappingAlgorithm]: The algorithm you will use to encrypt the key
  /// material before importing it with ImportKeyMaterial. For more information,
  /// see
  /// [Encrypt the Key Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [wrappingKeySpec]: The type of wrapping key (public key) to return in the
  /// response. Only 2048-bit RSA public keys are supported.
  Future<GetParametersForImportResponse> getParametersForImport(
      {@required String keyId,
      @required String wrappingAlgorithm,
      @required String wrappingKeySpec}) async {
    var response_ = await _client.send('GetParametersForImport', {
      'KeyId': keyId,
      'WrappingAlgorithm': wrappingAlgorithm,
      'WrappingKeySpec': wrappingKeySpec,
    });
    return GetParametersForImportResponse.fromJson(response_);
  }

  /// Imports key material into an existing AWS KMS customer master key (CMK)
  /// that was created without key material. You cannot perform this operation
  /// on a CMK in a different AWS account. For more information about creating
  /// CMKs with no key material and then importing key material, see
  /// [Importing Key Material](https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// Before using this operation, call GetParametersForImport. Its response
  /// includes a public key and an import token. Use the public key to encrypt
  /// the key material. Then, submit the import token from the same
  /// `GetParametersForImport` response.
  ///
  /// When calling this operation, you must specify the following values:
  ///
  /// *   The key ID or key ARN of a CMK with no key material. Its `Origin` must
  /// be `EXTERNAL`.
  ///
  ///     To create a CMK with no key material, call CreateKey and set the value
  /// of its `Origin` parameter to `EXTERNAL`. To get the `Origin` of a CMK,
  /// call DescribeKey.)
  ///
  /// *   The encrypted key material. To get the public key to encrypt the key
  /// material, call GetParametersForImport.
  ///
  /// *   The import token that GetParametersForImport returned. This token and
  /// the public key used to encrypt the key material must have come from the
  /// same response.
  ///
  /// *   Whether the key material expires and if so, when. If you set an
  /// expiration date, you can change it only by reimporting the same key
  /// material and specifying a new expiration date. If the key material
  /// expires, AWS KMS deletes the key material and the CMK becomes unusable. To
  /// use the CMK again, you must reimport the same key material.
  ///
  ///
  /// When this operation is successful, the key state of the CMK changes from
  /// `PendingImport` to `Enabled`, and you can use the CMK. After you
  /// successfully import key material into a CMK, you can reimport the same key
  /// material into that CMK, but you cannot import different key material.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The identifier of the CMK to import the key material into. The
  /// CMK's `Origin` must be `EXTERNAL`.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [importToken]: The import token that you received in the response to a
  /// previous GetParametersForImport request. It must be from the same response
  /// that contained the public key that you used to encrypt the key material.
  ///
  /// [encryptedKeyMaterial]: The encrypted key material to import. It must be
  /// encrypted with the public key that you received in the response to a
  /// previous GetParametersForImport request, using the wrapping algorithm that
  /// you specified in that request.
  ///
  /// [validTo]: The time at which the imported key material expires. When the
  /// key material expires, AWS KMS deletes the key material and the CMK becomes
  /// unusable. You must omit this parameter when the `ExpirationModel`
  /// parameter is set to `KEY_MATERIAL_DOES_NOT_EXPIRE`. Otherwise it is
  /// required.
  ///
  /// [expirationModel]: Specifies whether the key material expires. The default
  /// is `KEY_MATERIAL_EXPIRES`, in which case you must include the `ValidTo`
  /// parameter. When this parameter is set to `KEY_MATERIAL_DOES_NOT_EXPIRE`,
  /// you must omit the `ValidTo` parameter.
  Future<ImportKeyMaterialResponse> importKeyMaterial(
      {@required String keyId,
      @required Uint8List importToken,
      @required Uint8List encryptedKeyMaterial,
      DateTime validTo,
      String expirationModel}) async {
    var response_ = await _client.send('ImportKeyMaterial', {
      'KeyId': keyId,
      'ImportToken': importToken,
      'EncryptedKeyMaterial': encryptedKeyMaterial,
      if (validTo != null) 'ValidTo': validTo,
      if (expirationModel != null) 'ExpirationModel': expirationModel,
    });
    return ImportKeyMaterialResponse.fromJson(response_);
  }

  /// Gets a list of aliases in the caller's AWS account and region. You cannot
  /// list aliases in other accounts. For more information about aliases, see
  /// CreateAlias.
  ///
  /// By default, the ListAliases command returns all aliases in the account and
  /// region. To get only the aliases that point to a particular customer master
  /// key (CMK), use the `KeyId` parameter.
  ///
  /// The `ListAliases` response can include aliases that you created and
  /// associated with your customer managed CMKs, and aliases that AWS created
  /// and associated with AWS managed CMKs in your account. You can recognize
  /// AWS aliases because their names have the format `aws/<service-name>`, such
  /// as `aws/dynamodb`.
  ///
  /// The response might also include aliases that have no `TargetKeyId` field.
  /// These are predefined aliases that AWS has created but has not yet
  /// associated with a CMK. Aliases that AWS creates in your account, including
  /// predefined aliases, do not count against your
  /// [AWS KMS aliases limit](https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit).
  ///
  /// [keyId]: Lists only aliases that refer to the specified CMK. The value of
  /// this parameter can be the ID or Amazon Resource Name (ARN) of a CMK in the
  /// caller's account and region. You cannot use an alias name or alias ARN in
  /// this value.
  ///
  /// This parameter is optional. If you omit it, `ListAliases` returns all
  /// aliases in the account and region.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  Future<ListAliasesResponse> listAliases(
      {String keyId, int limit, String marker}) async {
    var response_ = await _client.send('ListAliases', {
      if (keyId != null) 'KeyId': keyId,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return ListAliasesResponse.fromJson(response_);
  }

  /// Gets a list of all grants for the specified customer master key (CMK).
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN in the value of the `KeyId` parameter.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  Future<ListGrantsResponse> listGrants(String keyId,
      {int limit, String marker}) async {
    var response_ = await _client.send('ListGrants', {
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
      'KeyId': keyId,
    });
    return ListGrantsResponse.fromJson(response_);
  }

  /// Gets the names of the key policies that are attached to a customer master
  /// key (CMK). This operation is designed to get policy names that you can use
  /// in a GetKeyPolicy operation. However, the only valid policy name is
  /// `default`. You cannot perform this operation on a CMK in a different AWS
  /// account.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 1000, inclusive. If you do not include a value, it defaults to 100.
  ///
  /// Only one policy can be attached to a key.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  Future<ListKeyPoliciesResponse> listKeyPolicies(String keyId,
      {int limit, String marker}) async {
    var response_ = await _client.send('ListKeyPolicies', {
      'KeyId': keyId,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return ListKeyPoliciesResponse.fromJson(response_);
  }

  /// Gets a list of all customer master keys (CMKs) in the caller's AWS account
  /// and region.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 1000, inclusive. If you do not include a value, it defaults to 100.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  Future<ListKeysResponse> listKeys({int limit, String marker}) async {
    var response_ = await _client.send('ListKeys', {
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return ListKeysResponse.fromJson(response_);
  }

  /// Returns a list of all tags for the specified customer master key (CMK).
  ///
  /// You cannot perform this operation on a CMK in a different AWS account.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 50, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  ///
  /// Do not attempt to construct this value. Use only the value of `NextMarker`
  /// from the truncated response you just received.
  Future<ListResourceTagsResponse> listResourceTags(String keyId,
      {int limit, String marker}) async {
    var response_ = await _client.send('ListResourceTags', {
      'KeyId': keyId,
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
    });
    return ListResourceTagsResponse.fromJson(response_);
  }

  /// Returns a list of all grants for which the grant's `RetiringPrincipal`
  /// matches the one specified.
  ///
  /// A typical use is to list all grants that you are able to retire. To retire
  /// a grant, use RetireGrant.
  ///
  /// [limit]: Use this parameter to specify the maximum number of items to
  /// return. When this value is present, AWS KMS does not return more than the
  /// specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// [marker]: Use this parameter in a subsequent request after you receive a
  /// response with truncated results. Set it to the value of `NextMarker` from
  /// the truncated response you just received.
  ///
  /// [retiringPrincipal]: The retiring principal for which to list grants.
  ///
  /// To specify the retiring principal, use the
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of an AWS principal. Valid AWS principals include AWS accounts (root), IAM
  /// users, federated users, and assumed role users. For examples of the ARN
  /// syntax for specifying a principal, see
  /// [AWS Identity and Access Management (IAM)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam)
  /// in the Example ARNs section of the _Amazon Web Services General
  /// Reference_.
  Future<ListGrantsResponse> listRetirableGrants(String retiringPrincipal,
      {int limit, String marker}) async {
    var response_ = await _client.send('ListRetirableGrants', {
      if (limit != null) 'Limit': limit,
      if (marker != null) 'Marker': marker,
      'RetiringPrincipal': retiringPrincipal,
    });
    return ListGrantsResponse.fromJson(response_);
  }

  /// Attaches a key policy to the specified customer master key (CMK). You
  /// cannot perform this operation on a CMK in a different AWS account.
  ///
  /// For more information about key policies, see
  /// [Key Policies](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [policyName]: The name of the key policy. The only valid value is
  /// `default`.
  ///
  /// [policy]: The key policy to attach to the CMK.
  ///
  /// The key policy must meet the following criteria:
  ///
  /// *   If you don't set `BypassPolicyLockoutSafetyCheck` to true, the key
  /// policy must allow the principal that is making the `PutKeyPolicy` request
  /// to make a subsequent `PutKeyPolicy` request on the CMK. This reduces the
  /// risk that the CMK becomes unmanageable. For more information, refer to the
  /// scenario in the
  /// [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam)
  /// section of the _AWS Key Management Service Developer Guide_.
  ///
  /// *   Each statement in the key policy must contain one or more principals.
  /// The principals in the key policy must exist and be visible to AWS KMS.
  /// When you create a new AWS principal (for example, an IAM user or role),
  /// you might need to enforce a delay before including the new principal in a
  /// key policy because the new principal might not be immediately visible to
  /// AWS KMS. For more information, see
  /// [Changes that I make are not always immediately visible](https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency)
  /// in the _AWS Identity and Access Management User Guide_.
  ///
  ///
  /// The key policy size limit is 32 kilobytes (32768 bytes).
  ///
  /// [bypassPolicyLockoutSafetyCheck]: A flag to indicate whether to bypass the
  /// key policy lockout safety check.
  ///
  ///  Setting this value to true increases the risk that the CMK becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the
  /// [Default Key Policy](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam)
  /// section in the _AWS Key Management Service Developer Guide_.
  ///
  /// Use this parameter only when you intend to prevent the principal that is
  /// making the request from making a subsequent `PutKeyPolicy` request on the
  /// CMK.
  ///
  /// The default value is false.
  Future<void> putKeyPolicy(
      {@required String keyId,
      @required String policyName,
      @required String policy,
      bool bypassPolicyLockoutSafetyCheck}) async {
    await _client.send('PutKeyPolicy', {
      'KeyId': keyId,
      'PolicyName': policyName,
      'Policy': policy,
      if (bypassPolicyLockoutSafetyCheck != null)
        'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
    });
  }

  /// Encrypts data on the server side with a new customer master key (CMK)
  /// without exposing the plaintext of the data on the client side. The data is
  /// first decrypted and then reencrypted. You can also use this operation to
  /// change the encryption context of a ciphertext.
  ///
  /// You can reencrypt data using CMKs in different AWS accounts.
  ///
  /// Unlike other operations, `ReEncrypt` is authorized twice, once as
  /// `ReEncryptFrom` on the source CMK and once as `ReEncryptTo` on the
  /// destination CMK. We recommend that you include the `"kms:ReEncrypt*"`
  /// permission in your
  /// [key policies](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
  /// to permit reencryption from or to the CMK. This permission is
  /// automatically included in the key policy when you create a CMK through the
  /// console. But you must include it manually when you create a CMK
  /// programmatically or when you set a key policy with the PutKeyPolicy
  /// operation.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [ciphertextBlob]: Ciphertext of the data to reencrypt.
  ///
  /// [sourceEncryptionContext]: Encryption context used to encrypt and decrypt
  /// the data specified in the `CiphertextBlob` parameter.
  ///
  /// [destinationKeyId]: A unique identifier for the CMK that is used to
  /// reencrypt the data.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with `"alias/"`. To
  /// specify a CMK in a different AWS account, you must use the key ARN or
  /// alias ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Alias name: `alias/ExampleAlias`
  ///
  /// *   Alias ARN: `arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey. To
  /// get the alias name and alias ARN, use ListAliases.
  ///
  /// [destinationEncryptionContext]: Encryption context to use when the data is
  /// reencrypted.
  ///
  /// [grantTokens]: A list of grant tokens.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  Future<ReEncryptResponse> reEncrypt(
      {@required Uint8List ciphertextBlob,
      Map<String, String> sourceEncryptionContext,
      @required String destinationKeyId,
      Map<String, String> destinationEncryptionContext,
      List<String> grantTokens}) async {
    var response_ = await _client.send('ReEncrypt', {
      'CiphertextBlob': ciphertextBlob,
      if (sourceEncryptionContext != null)
        'SourceEncryptionContext': sourceEncryptionContext,
      'DestinationKeyId': destinationKeyId,
      if (destinationEncryptionContext != null)
        'DestinationEncryptionContext': destinationEncryptionContext,
      if (grantTokens != null) 'GrantTokens': grantTokens,
    });
    return ReEncryptResponse.fromJson(response_);
  }

  /// Retires a grant. To clean up, you can retire a grant when you're done
  /// using it. You should revoke a grant when you intend to actively deny
  /// operations that depend on it. The following are permitted to call this
  /// API:
  ///
  /// *   The AWS account (root user) under which the grant was created
  ///
  /// *   The `RetiringPrincipal`, if present in the grant
  ///
  /// *   The `GranteePrincipal`, if `RetireGrant` is an operation specified in
  /// the grant
  ///
  ///
  /// You must identify the grant to retire by its grant token or by a
  /// combination of the grant ID and the Amazon Resource Name (ARN) of the
  /// customer master key (CMK). A grant token is a unique variable-length
  /// base64-encoded string. A grant ID is a 64 character unique identifier of a
  /// grant. The CreateGrant operation returns both.
  ///
  /// [grantToken]: Token that identifies the grant to be retired.
  ///
  /// [keyId]: The Amazon Resource Name (ARN) of the CMK associated with the
  /// grant.
  ///
  /// For example:
  /// `arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// [grantId]: Unique identifier of the grant to retire. The grant ID is
  /// returned in the response to a `CreateGrant` operation.
  ///
  /// *   Grant ID Example -
  /// 0123456789012345678901234567890123456789012345678901234567890123
  Future<void> retireGrant(
      {String grantToken, String keyId, String grantId}) async {
    await _client.send('RetireGrant', {
      if (grantToken != null) 'GrantToken': grantToken,
      if (keyId != null) 'KeyId': keyId,
      if (grantId != null) 'GrantId': grantId,
    });
  }

  /// Revokes the specified grant for the specified customer master key (CMK).
  /// You can revoke a grant to actively deny operations that depend on it.
  ///
  /// To perform this operation on a CMK in a different AWS account, specify the
  /// key ARN in the value of the `KeyId` parameter.
  ///
  /// [keyId]: A unique identifier for the customer master key associated with
  /// the grant.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [grantId]: Identifier of the grant to be revoked.
  Future<void> revokeGrant(
      {@required String keyId, @required String grantId}) async {
    await _client.send('RevokeGrant', {
      'KeyId': keyId,
      'GrantId': grantId,
    });
  }

  /// Schedules the deletion of a customer master key (CMK). You may provide a
  /// waiting period, specified in days, before deletion occurs. If you do not
  /// provide a waiting period, the default period of 30 days is used. When this
  /// operation is successful, the key state of the CMK changes to
  /// `PendingDeletion`. Before the waiting period ends, you can use
  /// CancelKeyDeletion to cancel the deletion of the CMK. After the waiting
  /// period ends, AWS KMS deletes the CMK and all AWS KMS data associated with
  /// it, including all aliases that refer to it.
  ///
  ///  Deleting a CMK is a destructive and potentially dangerous operation. When
  /// a CMK is deleted, all data that was encrypted under the CMK is
  /// unrecoverable. To prevent the use of a CMK without deleting it, use
  /// DisableKey.
  ///
  /// If you schedule deletion of a CMK from a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html),
  /// when the waiting period expires, `ScheduleKeyDeletion` deletes the CMK
  /// from AWS KMS. Then AWS KMS makes a best effort to delete the key material
  /// from the associated AWS CloudHSM cluster. However, you might need to
  /// manually
  /// [delete the orphaned key material](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key)
  /// from the cluster and its backups.
  ///
  /// You cannot perform this operation on a CMK in a different AWS account.
  ///
  /// For more information about scheduling a CMK for deletion, see
  /// [Deleting Customer Master Keys](https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: The unique identifier of the customer master key (CMK) to delete.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [pendingWindowInDays]: The waiting period, specified in number of days.
  /// After the waiting period ends, AWS KMS deletes the customer master key
  /// (CMK).
  ///
  /// This value is optional. If you include a value, it must be between 7 and
  /// 30, inclusive. If you do not include a value, it defaults to 30.
  Future<ScheduleKeyDeletionResponse> scheduleKeyDeletion(String keyId,
      {int pendingWindowInDays}) async {
    var response_ = await _client.send('ScheduleKeyDeletion', {
      'KeyId': keyId,
      if (pendingWindowInDays != null)
        'PendingWindowInDays': pendingWindowInDays,
    });
    return ScheduleKeyDeletionResponse.fromJson(response_);
  }

  /// Adds or edits tags for a customer master key (CMK). You cannot perform
  /// this operation on a CMK in a different AWS account.
  ///
  /// Each tag consists of a tag key and a tag value. Tag keys and tag values
  /// are both required, but tag values can be empty (null) strings.
  ///
  /// You can only use a tag key once for each CMK. If you use the tag key
  /// again, AWS KMS replaces the current tag value with the specified value.
  ///
  /// For information about the rules that apply to tag keys and tag values, see
  /// [User-Defined Tag Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the CMK you are tagging.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [tags]: One or more tags. Each tag consists of a tag key and a tag value.
  Future<void> tagResource(
      {@required String keyId, @required List<Tag> tags}) async {
    await _client.send('TagResource', {
      'KeyId': keyId,
      'Tags': tags,
    });
  }

  /// Removes the specified tags from the specified customer master key (CMK).
  /// You cannot perform this operation on a CMK in a different AWS account.
  ///
  /// To remove a tag, specify the tag key. To change the tag value of an
  /// existing tag key, use TagResource.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the CMK from which you are removing tags.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [tagKeys]: One or more tag keys. Specify only the tag keys, not the tag
  /// values.
  Future<void> untagResource(
      {@required String keyId, @required List<String> tagKeys}) async {
    await _client.send('UntagResource', {
      'KeyId': keyId,
      'TagKeys': tagKeys,
    });
  }

  /// Associates an existing alias with a different customer master key (CMK).
  /// Each CMK can have multiple aliases, but the aliases must be unique within
  /// the account and region. You cannot perform this operation on an alias in a
  /// different AWS account.
  ///
  /// This operation works only on existing aliases. To change the alias of a
  /// CMK to a new value, use CreateAlias to create a new alias and DeleteAlias
  /// to delete the old alias.
  ///
  /// Because an alias is not a property of a CMK, you can create, update, and
  /// delete the aliases of a CMK without affecting the CMK. Also, aliases do
  /// not appear in the response from the DescribeKey operation. To get the
  /// aliases of all CMKs in the account, use the ListAliases operation.
  ///
  /// The alias name must begin with `alias/` followed by a name, such as
  /// `alias/ExampleAlias`. It can contain only alphanumeric characters, forward
  /// slashes (/), underscores (_), and dashes (-). The alias name cannot begin
  /// with `alias/aws/`. The `alias/aws/` prefix is reserved for
  /// [AWS managed CMKs](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk).
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [aliasName]: Specifies the name of the alias to change. This value must
  /// begin with `alias/` followed by the alias name, such as
  /// `alias/ExampleAlias`.
  ///
  /// [targetKeyId]: Unique identifier of the customer master key (CMK) to be
  /// mapped to the alias. When the update operation completes, the alias will
  /// point to this CMK.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// To verify that the alias is mapped to the correct CMK, use ListAliases.
  Future<void> updateAlias(
      {@required String aliasName, @required String targetKeyId}) async {
    await _client.send('UpdateAlias', {
      'AliasName': aliasName,
      'TargetKeyId': targetKeyId,
    });
  }

  /// Changes the properties of a custom key store. Use the `CustomKeyStoreId`
  /// parameter to identify the custom key store you want to edit. Use the
  /// remaining parameters to change the properties of the custom key store.
  ///
  /// You can only update a custom key store that is disconnected. To disconnect
  /// the custom key store, use DisconnectCustomKeyStore. To reconnect the
  /// custom key store after the update completes, use ConnectCustomKeyStore. To
  /// find the connection state of a custom key store, use the
  /// DescribeCustomKeyStores operation.
  ///
  /// Use the parameters of `UpdateCustomKeyStore` to edit your keystore
  /// settings.
  ///
  /// *   Use the **NewCustomKeyStoreName** parameter to change the friendly
  /// name of the custom key store to the value that you specify.
  ///
  /// *   Use the **KeyStorePassword** parameter tell AWS KMS the current
  /// password of the
  /// [`kmsuser` crypto user (CU)](https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser)
  /// in the associated AWS CloudHSM cluster. You can use this parameter to
  /// [fix connection failures](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-password)
  /// that occur when AWS KMS cannot log into the associated cluster because the
  /// `kmsuser` password has changed. This value does not change the password in
  /// the AWS CloudHSM cluster.
  ///
  /// *   Use the **CloudHsmClusterId** parameter to associate the custom key
  /// store with a different, but related, AWS CloudHSM cluster. You can use
  /// this parameter to repair a custom key store if its AWS CloudHSM cluster
  /// becomes corrupted or is deleted, or when you need to create or restore a
  /// cluster from a backup.
  ///
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the
  /// [Custom Key Store feature](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// feature in AWS KMS, which combines the convenience and extensive
  /// integration of AWS KMS with the isolation and control of a single-tenant
  /// key store.
  ///
  /// [customKeyStoreId]: Identifies the custom key store that you want to
  /// update. Enter the ID of the custom key store. To find the ID of a custom
  /// key store, use the DescribeCustomKeyStores operation.
  ///
  /// [newCustomKeyStoreName]: Changes the friendly name of the custom key store
  /// to the value that you specify. The custom key store name must be unique in
  /// the AWS account.
  ///
  /// [keyStorePassword]: Enter the current password of the `kmsuser` crypto
  /// user (CU) in the AWS CloudHSM cluster that is associated with the custom
  /// key store.
  ///
  /// This parameter tells AWS KMS the current password of the `kmsuser` crypto
  /// user (CU). It does not set or change the password of any users in the AWS
  /// CloudHSM cluster.
  ///
  /// [cloudHsmClusterId]: Associates the custom key store with a related AWS
  /// CloudHSM cluster.
  ///
  /// Enter the cluster ID of the cluster that you used to create the custom key
  /// store or a cluster that shares a backup history and has the same cluster
  /// certificate as the original cluster. You cannot use this parameter to
  /// associate a custom key store with an unrelated cluster. In addition, the
  /// replacement cluster must
  /// [fulfill the requirements](https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore)
  /// for a cluster associated with a custom key store. To view the cluster
  /// certificate of a cluster, use the
  /// [DescribeClusters](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html)
  /// operation.
  Future<UpdateCustomKeyStoreResponse> updateCustomKeyStore(
      String customKeyStoreId,
      {String newCustomKeyStoreName,
      String keyStorePassword,
      String cloudHsmClusterId}) async {
    var response_ = await _client.send('UpdateCustomKeyStore', {
      'CustomKeyStoreId': customKeyStoreId,
      if (newCustomKeyStoreName != null)
        'NewCustomKeyStoreName': newCustomKeyStoreName,
      if (keyStorePassword != null) 'KeyStorePassword': keyStorePassword,
      if (cloudHsmClusterId != null) 'CloudHsmClusterId': cloudHsmClusterId,
    });
    return UpdateCustomKeyStoreResponse.fromJson(response_);
  }

  /// Updates the description of a customer master key (CMK). To see the
  /// description of a CMK, use DescribeKey.
  ///
  /// You cannot perform this operation on a CMK in a different AWS account.
  ///
  /// The result of this operation varies with the key state of the CMK. For
  /// details, see
  /// [How Key State Affects Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  ///
  /// [keyId]: A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// *   Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  /// *   Key ARN:
  /// `arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
  ///
  ///
  /// To get the key ID and key ARN for a CMK, use ListKeys or DescribeKey.
  ///
  /// [description]: New description for the CMK.
  Future<void> updateKeyDescription(
      {@required String keyId, @required String description}) async {
    await _client.send('UpdateKeyDescription', {
      'KeyId': keyId,
      'Description': description,
    });
  }
}

/// Contains information about an alias.
class AliasListEntry {
  /// String that contains the alias. This value begins with `alias/`.
  final String aliasName;

  /// String that contains the key ARN.
  final String aliasArn;

  /// String that contains the key identifier referred to by the alias.
  final String targetKeyId;

  AliasListEntry({
    this.aliasName,
    this.aliasArn,
    this.targetKeyId,
  });
  static AliasListEntry fromJson(Map<String, dynamic> json) => AliasListEntry(
        aliasName:
            json.containsKey('AliasName') ? json['AliasName'] as String : null,
        aliasArn:
            json.containsKey('AliasArn') ? json['AliasArn'] as String : null,
        targetKeyId: json.containsKey('TargetKeyId')
            ? json['TargetKeyId'] as String
            : null,
      );
}

class CancelKeyDeletionResponse {
  /// The unique identifier of the master key for which deletion is canceled.
  final String keyId;

  CancelKeyDeletionResponse({
    this.keyId,
  });
  static CancelKeyDeletionResponse fromJson(Map<String, dynamic> json) =>
      CancelKeyDeletionResponse(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
      );
}

class ConnectCustomKeyStoreResponse {
  ConnectCustomKeyStoreResponse();
  static ConnectCustomKeyStoreResponse fromJson(Map<String, dynamic> json) =>
      ConnectCustomKeyStoreResponse();
}

class CreateCustomKeyStoreResponse {
  /// A unique identifier for the new custom key store.
  final String customKeyStoreId;

  CreateCustomKeyStoreResponse({
    this.customKeyStoreId,
  });
  static CreateCustomKeyStoreResponse fromJson(Map<String, dynamic> json) =>
      CreateCustomKeyStoreResponse(
        customKeyStoreId: json.containsKey('CustomKeyStoreId')
            ? json['CustomKeyStoreId'] as String
            : null,
      );
}

class CreateGrantResponse {
  /// The grant token.
  ///
  /// For more information, see
  /// [Grant Tokens](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token)
  /// in the _AWS Key Management Service Developer Guide_.
  final String grantToken;

  /// The unique identifier for the grant.
  ///
  /// You can use the `GrantId` in a subsequent RetireGrant or RevokeGrant
  /// operation.
  final String grantId;

  CreateGrantResponse({
    this.grantToken,
    this.grantId,
  });
  static CreateGrantResponse fromJson(Map<String, dynamic> json) =>
      CreateGrantResponse(
        grantToken: json.containsKey('GrantToken')
            ? json['GrantToken'] as String
            : null,
        grantId: json.containsKey('GrantId') ? json['GrantId'] as String : null,
      );
}

class CreateKeyResponse {
  /// Metadata associated with the CMK.
  final KeyMetadata keyMetadata;

  CreateKeyResponse({
    this.keyMetadata,
  });
  static CreateKeyResponse fromJson(Map<String, dynamic> json) =>
      CreateKeyResponse(
        keyMetadata: json.containsKey('KeyMetadata')
            ? KeyMetadata.fromJson(json['KeyMetadata'])
            : null,
      );
}

/// Contains information about each custom key store in the custom key store
/// list.
class CustomKeyStoresListEntry {
  /// A unique identifier for the custom key store.
  final String customKeyStoreId;

  /// The user-specified friendly name for the custom key store.
  final String customKeyStoreName;

  /// A unique identifier for the AWS CloudHSM cluster that is associated with
  /// the custom key store.
  final String cloudHsmClusterId;

  /// The trust anchor certificate of the associated AWS CloudHSM cluster. When
  /// you
  /// [initialize the cluster](https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr),
  /// you create this certificate and save it in the `customerCA.crt` file.
  final String trustAnchorCertificate;

  /// Indicates whether the custom key store is connected to its AWS CloudHSM
  /// cluster.
  ///
  /// You can create and use CMKs in your custom key stores only when its
  /// connection state is `CONNECTED`.
  ///
  /// The value is `DISCONNECTED` if the key store has never been connected or
  /// you use the DisconnectCustomKeyStore operation to disconnect it. If the
  /// value is `CONNECTED` but you are having trouble using the custom key
  /// store, make sure that its associated AWS CloudHSM cluster is active and
  /// contains at least one active HSM.
  ///
  /// A value of `FAILED` indicates that an attempt to connect was unsuccessful.
  /// For help resolving a connection failure, see
  /// [Troubleshooting a Custom Key Store](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String connectionState;

  /// Describes the connection error. Valid values are:
  ///
  /// *    `CLUSTER_NOT_FOUND` - AWS KMS cannot find the AWS CloudHSM cluster
  /// with the specified cluster ID.
  ///
  /// *    `INSUFFICIENT_CLOUDHSM_HSMS` - The associated AWS CloudHSM cluster
  /// does not contain any active HSMs. To connect a custom key store to its AWS
  /// CloudHSM cluster, the cluster must contain at least one active HSM.
  ///
  /// *    `INTERNAL_ERROR` - AWS KMS could not complete the request due to an
  /// internal error. Retry the request. For `ConnectCustomKeyStore` requests,
  /// disconnect the custom key store before trying to connect again.
  ///
  /// *    `INVALID_CREDENTIALS` - AWS KMS does not have the correct password
  /// for the `kmsuser` crypto user in the AWS CloudHSM cluster.
  ///
  /// *    `NETWORK_ERRORS` - Network errors are preventing AWS KMS from
  /// connecting to the custom key store.
  ///
  /// *    `USER_LOCKED_OUT` - The `kmsuser` CU account is locked out of the
  /// associated AWS CloudHSM cluster due to too many failed password attempts.
  /// Before you can connect your custom key store to its AWS CloudHSM cluster,
  /// you must change the `kmsuser` account password and update the password
  /// value for the custom key store.
  ///
  ///
  /// For help with connection failures, see
  /// [Troubleshooting Custom Key Stores](https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String connectionErrorCode;

  /// The date and time when the custom key store was created.
  final DateTime creationDate;

  CustomKeyStoresListEntry({
    this.customKeyStoreId,
    this.customKeyStoreName,
    this.cloudHsmClusterId,
    this.trustAnchorCertificate,
    this.connectionState,
    this.connectionErrorCode,
    this.creationDate,
  });
  static CustomKeyStoresListEntry fromJson(Map<String, dynamic> json) =>
      CustomKeyStoresListEntry(
        customKeyStoreId: json.containsKey('CustomKeyStoreId')
            ? json['CustomKeyStoreId'] as String
            : null,
        customKeyStoreName: json.containsKey('CustomKeyStoreName')
            ? json['CustomKeyStoreName'] as String
            : null,
        cloudHsmClusterId: json.containsKey('CloudHsmClusterId')
            ? json['CloudHsmClusterId'] as String
            : null,
        trustAnchorCertificate: json.containsKey('TrustAnchorCertificate')
            ? json['TrustAnchorCertificate'] as String
            : null,
        connectionState: json.containsKey('ConnectionState')
            ? json['ConnectionState'] as String
            : null,
        connectionErrorCode: json.containsKey('ConnectionErrorCode')
            ? json['ConnectionErrorCode'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
}

class DecryptResponse {
  /// ARN of the key used to perform the decryption. This value is returned if
  /// no errors are encountered during the operation.
  final String keyId;

  /// Decrypted plaintext data. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List plaintext;

  DecryptResponse({
    this.keyId,
    this.plaintext,
  });
  static DecryptResponse fromJson(Map<String, dynamic> json) => DecryptResponse(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
        plaintext:
            json.containsKey('Plaintext') ? Uint8List(json['Plaintext']) : null,
      );
}

class DeleteCustomKeyStoreResponse {
  DeleteCustomKeyStoreResponse();
  static DeleteCustomKeyStoreResponse fromJson(Map<String, dynamic> json) =>
      DeleteCustomKeyStoreResponse();
}

class DescribeCustomKeyStoresResponse {
  /// Contains metadata about each custom key store.
  final List<CustomKeyStoresListEntry> customKeyStores;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  DescribeCustomKeyStoresResponse({
    this.customKeyStores,
    this.nextMarker,
    this.truncated,
  });
  static DescribeCustomKeyStoresResponse fromJson(Map<String, dynamic> json) =>
      DescribeCustomKeyStoresResponse(
        customKeyStores: json.containsKey('CustomKeyStores')
            ? (json['CustomKeyStores'] as List)
                .map((e) => CustomKeyStoresListEntry.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class DescribeKeyResponse {
  /// Metadata associated with the key.
  final KeyMetadata keyMetadata;

  DescribeKeyResponse({
    this.keyMetadata,
  });
  static DescribeKeyResponse fromJson(Map<String, dynamic> json) =>
      DescribeKeyResponse(
        keyMetadata: json.containsKey('KeyMetadata')
            ? KeyMetadata.fromJson(json['KeyMetadata'])
            : null,
      );
}

class DisconnectCustomKeyStoreResponse {
  DisconnectCustomKeyStoreResponse();
  static DisconnectCustomKeyStoreResponse fromJson(Map<String, dynamic> json) =>
      DisconnectCustomKeyStoreResponse();
}

class EncryptResponse {
  /// The encrypted plaintext. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List ciphertextBlob;

  /// The ID of the key used during encryption.
  final String keyId;

  EncryptResponse({
    this.ciphertextBlob,
    this.keyId,
  });
  static EncryptResponse fromJson(Map<String, dynamic> json) => EncryptResponse(
        ciphertextBlob: json.containsKey('CiphertextBlob')
            ? Uint8List(json['CiphertextBlob'])
            : null,
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
      );
}

class GenerateDataKeyResponse {
  /// The encrypted copy of the data key. When you use the HTTP API or the AWS
  /// CLI, the value is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List ciphertextBlob;

  /// The plaintext data key. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not encoded. Use this data key
  /// to encrypt your data outside of KMS. Then, remove it from memory as soon
  /// as possible.
  final Uint8List plaintext;

  /// The identifier of the CMK that encrypted the data key.
  final String keyId;

  GenerateDataKeyResponse({
    this.ciphertextBlob,
    this.plaintext,
    this.keyId,
  });
  static GenerateDataKeyResponse fromJson(Map<String, dynamic> json) =>
      GenerateDataKeyResponse(
        ciphertextBlob: json.containsKey('CiphertextBlob')
            ? Uint8List(json['CiphertextBlob'])
            : null,
        plaintext:
            json.containsKey('Plaintext') ? Uint8List(json['Plaintext']) : null,
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
      );
}

class GenerateDataKeyWithoutPlaintextResponse {
  /// The encrypted data key. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List ciphertextBlob;

  /// The identifier of the CMK that encrypted the data key.
  final String keyId;

  GenerateDataKeyWithoutPlaintextResponse({
    this.ciphertextBlob,
    this.keyId,
  });
  static GenerateDataKeyWithoutPlaintextResponse fromJson(
          Map<String, dynamic> json) =>
      GenerateDataKeyWithoutPlaintextResponse(
        ciphertextBlob: json.containsKey('CiphertextBlob')
            ? Uint8List(json['CiphertextBlob'])
            : null,
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
      );
}

class GenerateRandomResponse {
  /// The random byte string. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List plaintext;

  GenerateRandomResponse({
    this.plaintext,
  });
  static GenerateRandomResponse fromJson(Map<String, dynamic> json) =>
      GenerateRandomResponse(
        plaintext:
            json.containsKey('Plaintext') ? Uint8List(json['Plaintext']) : null,
      );
}

class GetKeyPolicyResponse {
  /// A key policy document in JSON format.
  final String policy;

  GetKeyPolicyResponse({
    this.policy,
  });
  static GetKeyPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetKeyPolicyResponse(
        policy: json.containsKey('Policy') ? json['Policy'] as String : null,
      );
}

class GetKeyRotationStatusResponse {
  /// A Boolean value that specifies whether key rotation is enabled.
  final bool keyRotationEnabled;

  GetKeyRotationStatusResponse({
    this.keyRotationEnabled,
  });
  static GetKeyRotationStatusResponse fromJson(Map<String, dynamic> json) =>
      GetKeyRotationStatusResponse(
        keyRotationEnabled: json.containsKey('KeyRotationEnabled')
            ? json['KeyRotationEnabled'] as bool
            : null,
      );
}

class GetParametersForImportResponse {
  /// The identifier of the CMK to use in a subsequent ImportKeyMaterial
  /// request. This is the same CMK specified in the `GetParametersForImport`
  /// request.
  final String keyId;

  /// The import token to send in a subsequent ImportKeyMaterial request.
  final Uint8List importToken;

  /// The public key to use to encrypt the key material before importing it with
  /// ImportKeyMaterial.
  final Uint8List publicKey;

  /// The time at which the import token and public key are no longer valid.
  /// After this time, you cannot use them to make an ImportKeyMaterial request
  /// and you must send another `GetParametersForImport` request to get new
  /// ones.
  final DateTime parametersValidTo;

  GetParametersForImportResponse({
    this.keyId,
    this.importToken,
    this.publicKey,
    this.parametersValidTo,
  });
  static GetParametersForImportResponse fromJson(Map<String, dynamic> json) =>
      GetParametersForImportResponse(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
        importToken: json.containsKey('ImportToken')
            ? Uint8List(json['ImportToken'])
            : null,
        publicKey:
            json.containsKey('PublicKey') ? Uint8List(json['PublicKey']) : null,
        parametersValidTo: json.containsKey('ParametersValidTo')
            ? DateTime.parse(json['ParametersValidTo'])
            : null,
      );
}

/// Use this structure to allow cryptographic operations in the grant only when
/// the operation request includes the specified
/// [encryption context](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context).
///
/// AWS KMS applies the grant constraints only when the grant allows a
/// cryptographic operation that accepts an encryption context as input, such as
/// the following.
///
/// *    Encrypt
///
/// *    Decrypt
///
/// *    GenerateDataKey
///
/// *    GenerateDataKeyWithoutPlaintext
///
/// *    ReEncrypt
///
///
/// AWS KMS does not apply the grant constraints to other operations, such as
/// DescribeKey or ScheduleKeyDeletion.
///
///
///
/// In a cryptographic operation, the encryption context in the decryption
/// operation must be an exact, case-sensitive match for the keys and values in
/// the encryption context of the encryption operation. Only the order of the
/// pairs can vary.
///
/// However, in a grant constraint, the key in each key-value pair is not case
/// sensitive, but the value is case sensitive.
///
/// To avoid confusion, do not use multiple encryption context pairs that differ
/// only by case. To require a fully case-sensitive encryption context, use the
/// `kms:EncryptionContext:` and `kms:EncryptionContextKeys` conditions in an
/// IAM or key policy. For details, see
/// [kms:EncryptionContext:](https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context)
/// in the  __AWS Key Management Service Developer Guide__ .
class GrantConstraints {
  /// A list of key-value pairs that must be included in the encryption context
  /// of the cryptographic operation request. The grant allows the cryptographic
  /// operation only when the encryption context in the request includes the
  /// key-value pairs specified in this constraint, although it can include
  /// additional key-value pairs.
  final Map<String, String> encryptionContextSubset;

  /// A list of key-value pairs that must match the encryption context in the
  /// cryptographic operation request. The grant allows the operation only when
  /// the encryption context in the request is the same as the encryption
  /// context specified in this constraint.
  final Map<String, String> encryptionContextEquals;

  GrantConstraints({
    this.encryptionContextSubset,
    this.encryptionContextEquals,
  });
  static GrantConstraints fromJson(Map<String, dynamic> json) =>
      GrantConstraints(
        encryptionContextSubset: json.containsKey('EncryptionContextSubset')
            ? (json['EncryptionContextSubset'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        encryptionContextEquals: json.containsKey('EncryptionContextEquals')
            ? (json['EncryptionContextEquals'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about an entry in a list of grants.
class GrantListEntry {
  /// The unique identifier for the customer master key (CMK) to which the grant
  /// applies.
  final String keyId;

  /// The unique identifier for the grant.
  final String grantId;

  /// The friendly name that identifies the grant. If a name was provided in the
  /// CreateGrant request, that name is returned. Otherwise this value is null.
  final String name;

  /// The date and time when the grant was created.
  final DateTime creationDate;

  /// The principal that receives the grant's permissions.
  final String granteePrincipal;

  /// The principal that can retire the grant.
  final String retiringPrincipal;

  /// The AWS account under which the grant was issued.
  final String issuingAccount;

  /// The list of operations permitted by the grant.
  final List<String> operations;

  /// A list of key-value pairs that must be present in the encryption context
  /// of certain subsequent operations that the grant allows.
  final GrantConstraints constraints;

  GrantListEntry({
    this.keyId,
    this.grantId,
    this.name,
    this.creationDate,
    this.granteePrincipal,
    this.retiringPrincipal,
    this.issuingAccount,
    this.operations,
    this.constraints,
  });
  static GrantListEntry fromJson(Map<String, dynamic> json) => GrantListEntry(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
        grantId: json.containsKey('GrantId') ? json['GrantId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        granteePrincipal: json.containsKey('GranteePrincipal')
            ? json['GranteePrincipal'] as String
            : null,
        retiringPrincipal: json.containsKey('RetiringPrincipal')
            ? json['RetiringPrincipal'] as String
            : null,
        issuingAccount: json.containsKey('IssuingAccount')
            ? json['IssuingAccount'] as String
            : null,
        operations: json.containsKey('Operations')
            ? (json['Operations'] as List).map((e) => e as String).toList()
            : null,
        constraints: json.containsKey('Constraints')
            ? GrantConstraints.fromJson(json['Constraints'])
            : null,
      );
}

class ImportKeyMaterialResponse {
  ImportKeyMaterialResponse();
  static ImportKeyMaterialResponse fromJson(Map<String, dynamic> json) =>
      ImportKeyMaterialResponse();
}

/// Contains information about each entry in the key list.
class KeyListEntry {
  /// Unique identifier of the key.
  final String keyId;

  /// ARN of the key.
  final String keyArn;

  KeyListEntry({
    this.keyId,
    this.keyArn,
  });
  static KeyListEntry fromJson(Map<String, dynamic> json) => KeyListEntry(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
        keyArn: json.containsKey('KeyArn') ? json['KeyArn'] as String : null,
      );
}

/// Contains metadata about a customer master key (CMK).
///
/// This data type is used as a response element for the CreateKey and
/// DescribeKey operations.
class KeyMetadata {
  /// The twelve-digit account ID of the AWS account that owns the CMK.
  final String awsAccountId;

  /// The globally unique identifier for the CMK.
  final String keyId;

  /// The Amazon Resource Name (ARN) of the CMK. For examples, see
  /// [AWS Key Management Service (AWS KMS)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms)
  /// in the Example ARNs section of the _AWS General Reference_.
  final String arn;

  /// The date and time when the CMK was created.
  final DateTime creationDate;

  /// Specifies whether the CMK is enabled. When `KeyState` is `Enabled` this
  /// value is true, otherwise it is false.
  final bool enabled;

  /// The description of the CMK.
  final String description;

  /// The cryptographic operations for which you can use the CMK. The only valid
  /// value is `ENCRYPT_DECRYPT`, which means you can use the CMK to encrypt and
  /// decrypt data.
  final String keyUsage;

  /// The state of the CMK.
  ///
  /// For more information about how key state affects the use of a CMK, see
  /// [How Key State Affects the Use of a Customer Master Key](https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html)
  /// in the _AWS Key Management Service Developer Guide_.
  final String keyState;

  /// The date and time after which AWS KMS deletes the CMK. This value is
  /// present only when `KeyState` is `PendingDeletion`.
  final DateTime deletionDate;

  /// The time at which the imported key material expires. When the key material
  /// expires, AWS KMS deletes the key material and the CMK becomes unusable.
  /// This value is present only for CMKs whose `Origin` is `EXTERNAL` and whose
  /// `ExpirationModel` is `KEY_MATERIAL_EXPIRES`, otherwise this value is
  /// omitted.
  final DateTime validTo;

  /// The source of the CMK's key material. When this value is `AWS_KMS`, AWS
  /// KMS created the key material. When this value is `EXTERNAL`, the key
  /// material was imported from your existing key management infrastructure or
  /// the CMK lacks key material. When this value is `AWS_CLOUDHSM`, the key
  /// material was created in the AWS CloudHSM cluster associated with a custom
  /// key store.
  final String origin;

  /// A unique identifier for the
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html)
  /// that contains the CMK. This value is present only when the CMK is created
  /// in a custom key store.
  final String customKeyStoreId;

  /// The cluster ID of the AWS CloudHSM cluster that contains the key material
  /// for the CMK. When you create a CMK in a
  /// [custom key store](https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html),
  /// AWS KMS creates the key material for the CMK in the associated AWS
  /// CloudHSM cluster. This value is present only when the CMK is created in a
  /// custom key store.
  final String cloudHsmClusterId;

  /// Specifies whether the CMK's key material expires. This value is present
  /// only when `Origin` is `EXTERNAL`, otherwise this value is omitted.
  final String expirationModel;

  /// The manager of the CMK. CMKs in your AWS account are either customer
  /// managed or AWS managed. For more information about the difference, see
  /// [Customer Master Keys](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys)
  /// in the _AWS Key Management Service Developer Guide_.
  final String keyManager;

  KeyMetadata({
    this.awsAccountId,
    @required this.keyId,
    this.arn,
    this.creationDate,
    this.enabled,
    this.description,
    this.keyUsage,
    this.keyState,
    this.deletionDate,
    this.validTo,
    this.origin,
    this.customKeyStoreId,
    this.cloudHsmClusterId,
    this.expirationModel,
    this.keyManager,
  });
  static KeyMetadata fromJson(Map<String, dynamic> json) => KeyMetadata(
        awsAccountId: json.containsKey('AWSAccountId')
            ? json['AWSAccountId'] as String
            : null,
        keyId: json['KeyId'] as String,
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        enabled: json.containsKey('Enabled') ? json['Enabled'] as bool : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        keyUsage:
            json.containsKey('KeyUsage') ? json['KeyUsage'] as String : null,
        keyState:
            json.containsKey('KeyState') ? json['KeyState'] as String : null,
        deletionDate: json.containsKey('DeletionDate')
            ? DateTime.parse(json['DeletionDate'])
            : null,
        validTo: json.containsKey('ValidTo')
            ? DateTime.parse(json['ValidTo'])
            : null,
        origin: json.containsKey('Origin') ? json['Origin'] as String : null,
        customKeyStoreId: json.containsKey('CustomKeyStoreId')
            ? json['CustomKeyStoreId'] as String
            : null,
        cloudHsmClusterId: json.containsKey('CloudHsmClusterId')
            ? json['CloudHsmClusterId'] as String
            : null,
        expirationModel: json.containsKey('ExpirationModel')
            ? json['ExpirationModel'] as String
            : null,
        keyManager: json.containsKey('KeyManager')
            ? json['KeyManager'] as String
            : null,
      );
}

class ListAliasesResponse {
  /// A list of aliases.
  final List<AliasListEntry> aliases;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
    this.truncated,
  });
  static ListAliasesResponse fromJson(Map<String, dynamic> json) =>
      ListAliasesResponse(
        aliases: json.containsKey('Aliases')
            ? (json['Aliases'] as List)
                .map((e) => AliasListEntry.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class ListGrantsResponse {
  /// A list of grants.
  final List<GrantListEntry> grants;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  ListGrantsResponse({
    this.grants,
    this.nextMarker,
    this.truncated,
  });
  static ListGrantsResponse fromJson(Map<String, dynamic> json) =>
      ListGrantsResponse(
        grants: json.containsKey('Grants')
            ? (json['Grants'] as List)
                .map((e) => GrantListEntry.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class ListKeyPoliciesResponse {
  /// A list of key policy names. The only valid value is `default`.
  final List<String> policyNames;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  ListKeyPoliciesResponse({
    this.policyNames,
    this.nextMarker,
    this.truncated,
  });
  static ListKeyPoliciesResponse fromJson(Map<String, dynamic> json) =>
      ListKeyPoliciesResponse(
        policyNames: json.containsKey('PolicyNames')
            ? (json['PolicyNames'] as List).map((e) => e as String).toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class ListKeysResponse {
  /// A list of customer master keys (CMKs).
  final List<KeyListEntry> keys;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  ListKeysResponse({
    this.keys,
    this.nextMarker,
    this.truncated,
  });
  static ListKeysResponse fromJson(Map<String, dynamic> json) =>
      ListKeysResponse(
        keys: json.containsKey('Keys')
            ? (json['Keys'] as List)
                .map((e) => KeyListEntry.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class ListResourceTagsResponse {
  /// A list of tags. Each tag consists of a tag key and a tag value.
  final List<Tag> tags;

  /// When `Truncated` is true, this element is present and contains the value
  /// to use for the `Marker` parameter in a subsequent request.
  ///
  /// Do not assume or infer any information from this value.
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the `NextMarker` element in thisresponse to the `Marker`
  /// parameter in a subsequent request.
  final bool truncated;

  ListResourceTagsResponse({
    this.tags,
    this.nextMarker,
    this.truncated,
  });
  static ListResourceTagsResponse fromJson(Map<String, dynamic> json) =>
      ListResourceTagsResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        truncated:
            json.containsKey('Truncated') ? json['Truncated'] as bool : null,
      );
}

class ReEncryptResponse {
  /// The reencrypted data. When you use the HTTP API or the AWS CLI, the value
  /// is Base64-encoded. Otherwise, it is not encoded.
  final Uint8List ciphertextBlob;

  /// Unique identifier of the CMK used to originally encrypt the data.
  final String sourceKeyId;

  /// Unique identifier of the CMK used to reencrypt the data.
  final String keyId;

  ReEncryptResponse({
    this.ciphertextBlob,
    this.sourceKeyId,
    this.keyId,
  });
  static ReEncryptResponse fromJson(Map<String, dynamic> json) =>
      ReEncryptResponse(
        ciphertextBlob: json.containsKey('CiphertextBlob')
            ? Uint8List(json['CiphertextBlob'])
            : null,
        sourceKeyId: json.containsKey('SourceKeyId')
            ? json['SourceKeyId'] as String
            : null,
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
      );
}

class ScheduleKeyDeletionResponse {
  /// The unique identifier of the customer master key (CMK) for which deletion
  /// is scheduled.
  final String keyId;

  /// The date and time after which AWS KMS deletes the customer master key
  /// (CMK).
  final DateTime deletionDate;

  ScheduleKeyDeletionResponse({
    this.keyId,
    this.deletionDate,
  });
  static ScheduleKeyDeletionResponse fromJson(Map<String, dynamic> json) =>
      ScheduleKeyDeletionResponse(
        keyId: json.containsKey('KeyId') ? json['KeyId'] as String : null,
        deletionDate: json.containsKey('DeletionDate')
            ? DateTime.parse(json['DeletionDate'])
            : null,
      );
}

/// A key-value pair. A tag consists of a tag key and a tag value. Tag keys and
/// tag values are both required, but tag values can be empty (null) strings.
///
/// For information about the rules that apply to tag keys and tag values, see
/// [User-Defined Tag Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html)
/// in the _AWS Billing and Cost Management User Guide_.
class Tag {
  /// The key of the tag.
  final String tagKey;

  /// The value of the tag.
  final String tagValue;

  Tag({
    @required this.tagKey,
    @required this.tagValue,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        tagKey: json['TagKey'] as String,
        tagValue: json['TagValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UpdateCustomKeyStoreResponse {
  UpdateCustomKeyStoreResponse();
  static UpdateCustomKeyStoreResponse fromJson(Map<String, dynamic> json) =>
      UpdateCustomKeyStoreResponse();
}
