import 'package:meta/meta.dart';
import 'dart:typed_data';

/// This is the _ACM Private CA API Reference_. It provides descriptions,
/// syntax, and usage examples for each of the actions and data types involved
/// in creating and managing private certificate authorities (CA) for your
/// organization.
///
/// The documentation for each action shows the Query API request parameters and
/// the XML response. Alternatively, you can use one of the AWS SDKs to access
/// an API that's tailored to the programming language or platform that you're
/// using. For more information, see
/// [AWS SDKs](https://aws.amazon.com/tools/#SDKs).
///
///
///
/// Each ACM Private CA API action has a throttling limit which determines the
/// number of times the action can be called per second. For more information,
/// see
/// [API Rate Limits in ACM Private CA](https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaLimits.html#PcaLimits-api)
/// in the ACM Private CA user guide.
class AcmPcaApi {
  /// Creates a root or subordinate private certificate authority (CA). You must
  /// specify the CA configuration, the certificate revocation list (CRL)
  /// configuration, the CA type, and an optional idempotency token to avoid
  /// accidental creation of multiple CAs. The CA configuration specifies the
  /// name of the algorithm and key size to be used to create the CA private
  /// key, the type of signing algorithm that the CA uses, and X.500 subject
  /// information. The CRL configuration specifies the CRL expiration period in
  /// days (the validity period of the CRL), the Amazon S3 bucket that will
  /// contain the CRL, and a CNAME alias for the S3 bucket that is included in
  /// certificates issued by the CA. If successful, this action returns the
  /// Amazon Resource Name (ARN) of the CA.
  ///
  /// [certificateAuthorityConfiguration]: Name and bit size of the private key
  /// algorithm, the name of the signing algorithm, and X.500 certificate
  /// subject information.
  ///
  /// [revocationConfiguration]: Contains a Boolean value that you can use to
  /// enable a certification revocation list (CRL) for the CA, the name of the
  /// S3 bucket to which ACM Private CA will write the CRL, and an optional
  /// CNAME alias that you can use to hide the name of your bucket in the **CRL
  /// Distribution Points** extension of your CA certificate. For more
  /// information, see the CrlConfiguration structure.
  ///
  /// [certificateAuthorityType]: The type of the certificate authority.
  ///
  /// [idempotencyToken]: Alphanumeric string that can be used to distinguish
  /// between calls to **CreateCertificateAuthority**. Idempotency tokens time
  /// out after five minutes. Therefore, if you call
  /// **CreateCertificateAuthority** multiple times with the same idempotency
  /// token within a five minute period, ACM Private CA recognizes that you are
  /// requesting only one certificate. As a result, ACM Private CA issues only
  /// one. If you change the idempotency token for each call, however, ACM
  /// Private CA recognizes that you are requesting multiple certificates.
  ///
  /// [tags]: Key-value pairs that will be attached to the new private CA. You
  /// can associate up to 50 tags with a private CA. For information using tags
  /// with
  ///
  /// IAM to manage permissions, see
  /// [Controlling Access Using IAM Tags](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html).
  Future<CreateCertificateAuthorityResponse> createCertificateAuthority(
      {@required
          CertificateAuthorityConfiguration certificateAuthorityConfiguration,
      RevocationConfiguration revocationConfiguration,
      @required
          String certificateAuthorityType,
      String idempotencyToken,
      List<Tag> tags}) async {
    return CreateCertificateAuthorityResponse.fromJson({});
  }

  /// Creates an audit report that lists every time that your CA private key is
  /// used. The report is saved in the Amazon S3 bucket that you specify on
  /// input. The IssueCertificate and RevokeCertificate actions use the private
  /// key.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) of the CA to be
  /// audited. This is of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [s3BucketName]: The name of the S3 bucket that will contain the audit
  /// report.
  ///
  /// [auditReportResponseFormat]: The format in which to create the report.
  /// This can be either **JSON** or **CSV**.
  Future<CreateCertificateAuthorityAuditReportResponse>
      createCertificateAuthorityAuditReport(
          {@required String certificateAuthorityArn,
          @required String s3BucketName,
          @required String auditReportResponseFormat}) async {
    return CreateCertificateAuthorityAuditReportResponse.fromJson({});
  }

  /// Assigns permissions from a private CA to a designated AWS service.
  /// Services are specified by their service principals and can be given
  /// permission to create and retrieve certificates on a private CA. Services
  /// can also be given permission to list the active permissions that the
  /// private CA has granted. For ACM to automatically renew your private CA's
  /// certificates, you must assign all possible permissions from the CA to the
  /// ACM service principal.
  ///
  /// At this time, you can only assign permissions to ACM
  /// (`acm.amazonaws.com`). Permissions can be revoked with the
  /// DeletePermission action and listed with the ListPermissions action.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) of the CA that
  /// grants the permissions. You can find the ARN by calling the
  /// ListCertificateAuthorities action. This must have the following form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [principal]: The AWS service or identity that receives the permission. At
  /// this time, the only valid principal is `acm.amazonaws.com`.
  ///
  /// [sourceAccount]: The ID of the calling account.
  ///
  /// [actions]: The actions that the specified AWS service principal can use.
  /// These include `IssueCertificate`, `GetCertificate`, and `ListPermissions`.
  Future<void> createPermission(
      {@required String certificateAuthorityArn,
      @required String principal,
      String sourceAccount,
      @required List<String> actions}) async {}

  /// Deletes a private certificate authority (CA). You must provide the Amazon
  /// Resource Name (ARN) of the private CA that you want to delete. You can
  /// find the ARN by calling the ListCertificateAuthorities action.
  ///
  ///  Deleting a CA will invalidate other CAs and certificates below it in your
  /// CA hierarchy.
  ///
  /// Before you can delete a CA that you have created and activated, you must
  /// disable it. To do this, call the UpdateCertificateAuthority action and set
  /// the **CertificateAuthorityStatus** parameter to `DISABLED`.
  ///
  /// Additionally, you can delete a CA if you are waiting for it to be created
  /// (that is, the status of the CA is `CREATING`). You can also delete it if
  /// the CA has been created but you haven't yet imported the signed
  /// certificate into ACM Private CA (that is, the status of the CA is
  /// `PENDING_CERTIFICATE`).
  ///
  /// When you successfully call DeleteCertificateAuthority, the CA's status
  /// changes to `DELETED`. However, the CA won't be permanently deleted until
  /// the restoration period has passed. By default, if you do not set the
  /// `PermanentDeletionTimeInDays` parameter, the CA remains restorable for 30
  /// days. You can set the parameter from 7 to 30 days. The
  /// DescribeCertificateAuthority action returns the time remaining in the
  /// restoration window of a private CA in the `DELETED` state. To restore an
  /// eligible CA, call the RestoreCertificateAuthority action.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must have the
  /// following form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [permanentDeletionTimeInDays]: The number of days to make a CA restorable
  /// after it has been deleted. This can be anywhere from 7 to 30 days, with 30
  /// being the default.
  Future<void> deleteCertificateAuthority(String certificateAuthorityArn,
      {int permanentDeletionTimeInDays}) async {}

  /// Revokes permissions that a private CA assigned to a designated AWS
  /// service. Permissions can be created with the CreatePermission action and
  /// listed with the ListPermissions action.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Number (ARN) of the private
  /// CA that issued the permissions. You can find the CA's ARN by calling the
  /// ListCertificateAuthorities action. This must have the following form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [principal]: The AWS service or identity that will have its CA permissions
  /// revoked. At this time, the only valid service principal is
  /// `acm.amazonaws.com`
  ///
  /// [sourceAccount]: The AWS account that calls this action.
  Future<void> deletePermission(
      {@required String certificateAuthorityArn,
      @required String principal,
      String sourceAccount}) async {}

  /// Lists information about your private certificate authority (CA). You
  /// specify the private CA on input by its ARN (Amazon Resource Name). The
  /// output contains the status of your CA. This can be any of the following:
  ///
  /// *    `CREATING` - ACM Private CA is creating your private certificate
  /// authority.
  ///
  /// *    `PENDING_CERTIFICATE` - The certificate is pending. You must use your
  /// ACM Private CA-hosted or on-premises root or subordinate CA to sign your
  /// private CA CSR and then import it into PCA.
  ///
  /// *    `ACTIVE` - Your private CA is active.
  ///
  /// *    `DISABLED` - Your private CA has been disabled.
  ///
  /// *    `EXPIRED` - Your private CA certificate has expired.
  ///
  /// *    `FAILED` - Your private CA has failed. Your CA can fail because of
  /// problems such a network outage or backend AWS failure or other errors. A
  /// failed CA can never return to the pending state. You must create a new CA.
  ///
  /// *    `DELETED` - Your private CA is within the restoration period, after
  /// which it is permanently deleted. The length of time remaining in the CA's
  /// restoration period is also included in this action's output.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  Future<DescribeCertificateAuthorityResponse> describeCertificateAuthority(
      String certificateAuthorityArn) async {
    return DescribeCertificateAuthorityResponse.fromJson({});
  }

  /// Lists information about a specific audit report created by calling the
  /// CreateCertificateAuthorityAuditReport action. Audit information is created
  /// every time the certificate authority (CA) private key is used. The private
  /// key is used when you call the IssueCertificate action or the
  /// RevokeCertificate action.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) of the private
  /// CA. This must be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [auditReportId]: The report ID returned by calling the
  /// CreateCertificateAuthorityAuditReport action.
  Future<DescribeCertificateAuthorityAuditReportResponse>
      describeCertificateAuthorityAuditReport(
          {@required String certificateAuthorityArn,
          @required String auditReportId}) async {
    return DescribeCertificateAuthorityAuditReportResponse.fromJson({});
  }

  /// Retrieves a certificate from your private CA. The ARN of the certificate
  /// is returned when you call the IssueCertificate action. You must specify
  /// both the ARN of your private CA and the ARN of the issued certificate when
  /// calling the **GetCertificate** action. You can retrieve the certificate if
  /// it is in the **ISSUED** state. You can call the
  /// CreateCertificateAuthorityAuditReport action to create a report that
  /// contains information about all of the certificates issued and revoked by
  /// your private CA.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  ///
  /// [certificateArn]: The ARN of the issued certificate. The ARN contains the
  /// certificate serial number and must be in the following form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_/certificate/_286535153982981100925020015808220737245_`
  Future<GetCertificateResponse> getCertificate(
      {@required String certificateAuthorityArn,
      @required String certificateArn}) async {
    return GetCertificateResponse.fromJson({});
  }

  /// Retrieves the certificate and certificate chain for your private
  /// certificate authority (CA). Both the certificate and the chain are base64
  /// PEM-encoded. The chain does not include the CA certificate. Each
  /// certificate in the chain signs the one before it.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) of your private
  /// CA. This is of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  Future<GetCertificateAuthorityCertificateResponse>
      getCertificateAuthorityCertificate(String certificateAuthorityArn) async {
    return GetCertificateAuthorityCertificateResponse.fromJson({});
  }

  /// Retrieves the certificate signing request (CSR) for your private
  /// certificate authority (CA). The CSR is created when you call the
  /// CreateCertificateAuthority action. Sign the CSR with your ACM Private
  /// CA-hosted or on-premises root or subordinate CA. Then import the signed
  /// certificate back into ACM Private CA by calling the
  /// ImportCertificateAuthorityCertificate action. The CSR is returned as a
  /// base64 PEM-encoded string.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called the CreateCertificateAuthority action. This must
  /// be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  Future<GetCertificateAuthorityCsrResponse> getCertificateAuthorityCsr(
      String certificateAuthorityArn) async {
    return GetCertificateAuthorityCsrResponse.fromJson({});
  }

  /// Imports a signed private CA certificate into ACM Private CA. This action
  /// is used when you are using a chain of trust whose root is located outside
  /// ACM Private CA. Before you can call this action, the following
  /// preparations must in place:
  ///
  /// 1.  In ACM Private CA, call the CreateCertificateAuthority action to
  /// create the private CA that that you plan to back with the imported
  /// certificate.
  ///
  /// 2.  Call the GetCertificateAuthorityCsr action to generate a certificate
  /// signing request (CSR).
  ///
  /// 3.  Sign the CSR using a root or intermediate CA hosted either by an
  /// on-premises PKI hierarchy or a commercial CA..
  ///
  /// 4.  Create a certificate chain and copy the signed certificate and the
  /// certificate chain to your working directory.
  ///
  ///
  /// The following requirements apply when you import a CA certificate.
  ///
  /// *   You cannot import a non-self-signed certificate for use as a root CA.
  ///
  /// *   You cannot import a self-signed certificate for use as a subordinate
  /// CA.
  ///
  /// *   Your certificate chain must not include the private CA certificate
  /// that you are importing.
  ///
  /// *   Your ACM Private CA-hosted or on-premises CA certificate must be the
  /// last certificate in your chain. The subordinate certificate, if any, that
  /// your root CA signed must be next to last. The subordinate certificate
  /// signed by the preceding subordinate CA must come next, and so on until
  /// your chain is built.
  ///
  /// *   The chain must be PEM-encoded.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [certificate]: The PEM-encoded certificate for a private CA. This may be a
  /// self-signed certificate in the case of a root CA, or it may be signed by
  /// another CA that you control.
  ///
  /// [certificateChain]: A PEM-encoded file that contains all of your
  /// certificates, other than the certificate you're importing, chaining up to
  /// your root CA. Your ACM Private CA-hosted or on-premises root certificate
  /// is the last in the chain, and each certificate in the chain signs the one
  /// preceding.
  ///
  /// This parameter must be supplied when you import a subordinate CA. When you
  /// import a root CA, there is no chain.
  Future<void> importCertificateAuthorityCertificate(
      {@required String certificateAuthorityArn,
      @required Uint8List certificate,
      Uint8List certificateChain}) async {}

  /// Uses your private certificate authority (CA) to issue a client
  /// certificate. This action returns the Amazon Resource Name (ARN) of the
  /// certificate. You can retrieve the certificate by calling the
  /// GetCertificate action and specifying the ARN.
  ///
  ///
  ///
  /// You cannot use the ACM **ListCertificateAuthorities** action to retrieve
  /// the ARNs of the certificates that you issue by using ACM Private CA.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [csr]: The certificate signing request (CSR) for the certificate you want
  /// to issue. You can use the following OpenSSL command to create the CSR and
  /// a 2048 bit RSA private key.
  ///
  ///  `openssl req -new -newkey rsa:2048 -days 365 -keyout
  /// private/test_cert_priv_key.pem -out csr/test_cert_.csr`
  ///
  /// If you have a configuration file, you can use the following OpenSSL
  /// command. The `usr_cert` block in the configuration file contains your X509
  /// version 3 extensions.
  ///
  ///  `openssl req -new -config openssl_rsa.cnf -extensions usr_cert -newkey
  /// rsa:2048 -days -365 -keyout private/test_cert_priv_key.pem -out
  /// csr/test_cert_.csr`
  ///
  /// [signingAlgorithm]: The name of the algorithm that will be used to sign
  /// the certificate to be issued.
  ///
  /// [templateArn]: Specifies a custom configuration template to use when
  /// issuing a certificate. If this parameter is not provided, ACM Private CA
  /// defaults to the `EndEntityCertificate/V1` template.
  ///
  /// The following service-owned `TemplateArn` values are supported by ACM
  /// Private CA:
  ///
  /// *   arn:aws:acm-pca:::template/EndEntityCertificate/V1
  ///
  /// *   arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen0/V1
  ///
  /// *   arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen1/V1
  ///
  /// *   arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen2/V1
  ///
  /// *   arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen3/V1
  ///
  /// *   arn:aws:acm-pca:::template/RootCACertificate/V1
  ///
  ///
  /// For more information, see
  /// [Using Templates](https://docs.aws.amazon.com/acm-pca/latest/userguide/UsingTemplates.html).
  ///
  /// [validity]: The type of the validity period.
  ///
  /// [idempotencyToken]: Custom string that can be used to distinguish between
  /// calls to the **IssueCertificate** action. Idempotency tokens time out
  /// after one hour. Therefore, if you call **IssueCertificate** multiple times
  /// with the same idempotency token within 5 minutes, ACM Private CA
  /// recognizes that you are requesting only one certificate and will issue
  /// only one. If you change the idempotency token for each call, PCA
  /// recognizes that you are requesting multiple certificates.
  Future<IssueCertificateResponse> issueCertificate(
      {@required String certificateAuthorityArn,
      @required Uint8List csr,
      @required String signingAlgorithm,
      String templateArn,
      @required Validity validity,
      String idempotencyToken}) async {
    return IssueCertificateResponse.fromJson({});
  }

  /// Lists the private certificate authorities that you created by using the
  /// CreateCertificateAuthority action.
  ///
  /// [nextToken]: Use this parameter when paginating results in a subsequent
  /// request after you receive a response with truncated results. Set it to the
  /// value of the `NextToken` parameter from the response you just received.
  ///
  /// [maxResults]: Use this parameter when paginating results to specify the
  /// maximum number of items to return in the response on each page. If
  /// additional items exist beyond the number you specify, the `NextToken`
  /// element is sent in the response. Use this `NextToken` value in a
  /// subsequent request to retrieve additional items.
  Future<ListCertificateAuthoritiesResponse> listCertificateAuthorities(
      {String nextToken, int maxResults}) async {
    return ListCertificateAuthoritiesResponse.fromJson({});
  }

  /// Lists all the permissions, if any, that have been assigned by a private
  /// CA. Permissions can be granted with the CreatePermission action and
  /// revoked with the DeletePermission action.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Number (ARN) of the private
  /// CA to inspect. You can find the ARN by calling the
  /// ListCertificateAuthorities action. This must be of the form:
  /// `arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012`
  /// You can get a private CA's ARN by running the ListCertificateAuthorities
  /// action.
  ///
  /// [nextToken]: When paginating results, use this parameter in a subsequent
  /// request after you receive a response with truncated results. Set it to the
  /// value of **NextToken** from the response you just received.
  ///
  /// [maxResults]: When paginating results, use this parameter to specify the
  /// maximum number of items to return in the response. If additional items
  /// exist beyond the number you specify, the **NextToken** element is sent in
  /// the response. Use this **NextToken** value in a subsequent request to
  /// retrieve additional items.
  Future<ListPermissionsResponse> listPermissions(
      String certificateAuthorityArn,
      {String nextToken,
      int maxResults}) async {
    return ListPermissionsResponse.fromJson({});
  }

  /// Lists the tags, if any, that are associated with your private CA. Tags are
  /// labels that you can use to identify and organize your CAs. Each tag
  /// consists of a key and an optional value. Call the TagCertificateAuthority
  /// action to add one or more tags to your CA. Call the
  /// UntagCertificateAuthority action to remove tags.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called the CreateCertificateAuthority action. This must
  /// be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [nextToken]: Use this parameter when paginating results in a subsequent
  /// request after you receive a response with truncated results. Set it to the
  /// value of **NextToken** from the response you just received.
  ///
  /// [maxResults]: Use this parameter when paginating results to specify the
  /// maximum number of items to return in the response. If additional items
  /// exist beyond the number you specify, the **NextToken** element is sent in
  /// the response. Use this **NextToken** value in a subsequent request to
  /// retrieve additional items.
  Future<ListTagsResponse> listTags(String certificateAuthorityArn,
      {String nextToken, int maxResults}) async {
    return ListTagsResponse.fromJson({});
  }

  /// Restores a certificate authority (CA) that is in the `DELETED` state. You
  /// can restore a CA during the period that you defined in the
  /// **PermanentDeletionTimeInDays** parameter of the
  /// DeleteCertificateAuthority action. Currently, you can specify 7 to 30
  /// days. If you did not specify a **PermanentDeletionTimeInDays** value, by
  /// default you can restore the CA at any time in a 30 day period. You can
  /// check the time remaining in the restoration period of a private CA in the
  /// `DELETED` state by calling the DescribeCertificateAuthority or
  /// ListCertificateAuthorities actions. The status of a restored CA is set to
  /// its pre-deletion status when the **RestoreCertificateAuthority** action
  /// returns. To change its status to `ACTIVE`, call the
  /// UpdateCertificateAuthority action. If the private CA was in the
  /// `PENDING_CERTIFICATE` state at deletion, you must use the
  /// ImportCertificateAuthorityCertificate action to import a certificate
  /// authority into the private CA before it can be activated. You cannot
  /// restore a CA after the restoration period has ended.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called the CreateCertificateAuthority action. This must
  /// be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  Future<void> restoreCertificateAuthority(
      String certificateAuthorityArn) async {}

  /// Revokes a certificate that was issued inside ACM Private CA. If you enable
  /// a certificate revocation list (CRL) when you create or update your private
  /// CA, information about the revoked certificates will be included in the
  /// CRL. ACM Private CA writes the CRL to an S3 bucket that you specify. For
  /// more information about revocation, see the CrlConfiguration structure. ACM
  /// Private CA also writes revocation information to the audit report. For
  /// more information, see CreateCertificateAuthorityAuditReport.
  ///
  ///
  ///
  /// You cannot revoke a root CA self-signed certificate.
  ///
  /// [certificateAuthorityArn]: Amazon Resource Name (ARN) of the private CA
  /// that issued the certificate to be revoked. This must be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [certificateSerial]: Serial number of the certificate to be revoked. This
  /// must be in hexadecimal format. You can retrieve the serial number by
  /// calling GetCertificate with the Amazon Resource Name (ARN) of the
  /// certificate you want and the ARN of your private CA. The
  /// **GetCertificate** action retrieves the certificate in the PEM format. You
  /// can use the following OpenSSL command to list the certificate in text
  /// format and copy the hexadecimal serial number.
  ///
  ///  `openssl x509 -in _file_path_ -text -noout`
  ///
  /// You can also copy the serial number from the console or use the
  /// [DescribeCertificate](https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html)
  /// action in the _AWS Certificate Manager API Reference_.
  ///
  /// [revocationReason]: Specifies why you revoked the certificate.
  Future<void> revokeCertificate(
      {@required String certificateAuthorityArn,
      @required String certificateSerial,
      @required String revocationReason}) async {}

  /// Adds one or more tags to your private CA. Tags are labels that you can use
  /// to identify and organize your AWS resources. Each tag consists of a key
  /// and an optional value. You specify the private CA on input by its Amazon
  /// Resource Name (ARN). You specify the tag by using a key-value pair. You
  /// can apply a tag to just one private CA if you want to identify a specific
  /// characteristic of that CA, or you can apply the same tag to multiple
  /// private CAs if you want to filter for a common relationship among those
  /// CAs. To remove one or more tags, use the UntagCertificateAuthority action.
  /// Call the ListTags action to see what tags are associated with your CA.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [tags]: List of tags to be associated with the CA.
  Future<void> tagCertificateAuthority(
      {@required String certificateAuthorityArn,
      @required List<Tag> tags}) async {}

  /// Remove one or more tags from your private CA. A tag consists of a
  /// key-value pair. If you do not specify the value portion of the tag when
  /// calling this action, the tag will be removed regardless of value. If you
  /// specify a value, the tag is removed only if it is associated with the
  /// specified value. To add tags to a private CA, use the
  /// TagCertificateAuthority. Call the ListTags action to see what tags are
  /// associated with your CA.
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) that was
  /// returned when you called CreateCertificateAuthority. This must be of the
  /// form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [tags]: List of tags to be removed from the CA.
  Future<void> untagCertificateAuthority(
      {@required String certificateAuthorityArn,
      @required List<Tag> tags}) async {}

  /// Updates the status or configuration of a private certificate authority
  /// (CA). Your private CA must be in the `ACTIVE` or `DISABLED` state before
  /// you can update it. You can disable a private CA that is in the `ACTIVE`
  /// state or make a CA that is in the `DISABLED` state active again.
  ///
  /// [certificateAuthorityArn]: Amazon Resource Name (ARN) of the private CA
  /// that issued the certificate to be revoked. This must be of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [revocationConfiguration]: Revocation information for your private CA.
  ///
  /// [status]: Status of your private CA.
  Future<void> updateCertificateAuthority(String certificateAuthorityArn,
      {RevocationConfiguration revocationConfiguration, String status}) async {}
}

/// Contains information about the certificate subject. The certificate can be
/// one issued by your private certificate authority (CA) or it can be your
/// private CA certificate. The **Subject** field in the certificate identifies
/// the entity that owns or controls the public key in the certificate. The
/// entity can be a user, computer, device, or service. The **Subject** must
/// contain an X.500 distinguished name (DN). A DN is a sequence of relative
/// distinguished names (RDNs). The RDNs are separated by commas in the
/// certificate. The DN must be unique for each entity, but your private CA can
/// issue more than one certificate with the same DN to the same entity.
class Asn1Subject {
  /// Two-digit code that specifies the country in which the certificate subject
  /// located.
  final String country;

  /// Legal name of the organization with which the certificate subject is
  /// affiliated.
  final String organization;

  /// A subdivision or unit of the organization (such as sales or finance) with
  /// which the certificate subject is affiliated.
  final String organizationalUnit;

  /// Disambiguating information for the certificate subject.
  final String distinguishedNameQualifier;

  /// State in which the subject of the certificate is located.
  final String state;

  /// Fully qualified domain name (FQDN) associated with the certificate
  /// subject.
  final String commonName;

  /// The certificate serial number.
  final String serialNumber;

  /// The locality (such as a city or town) in which the certificate subject is
  /// located.
  final String locality;

  /// A title such as Mr. or Ms., which is pre-pended to the name to refer
  /// formally to the certificate subject.
  final String title;

  /// Family name. In the US and the UK, for example, the surname of an
  /// individual is ordered last. In Asian cultures the surname is typically
  /// ordered first.
  final String surname;

  /// First name.
  final String givenName;

  /// Concatenation that typically contains the first letter of the
  /// **GivenName**, the first letter of the middle name if one exists, and the
  /// first letter of the **SurName**.
  final String initials;

  /// Typically a shortened version of a longer **GivenName**. For example,
  /// Jonathan is often shortened to John. Elizabeth is often shortened to Beth,
  /// Liz, or Eliza.
  final String pseudonym;

  /// Typically a qualifier appended to the name of an individual. Examples
  /// include Jr. for junior, Sr. for senior, and III for third.
  final String generationQualifier;

  Asn1Subject({
    this.country,
    this.organization,
    this.organizationalUnit,
    this.distinguishedNameQualifier,
    this.state,
    this.commonName,
    this.serialNumber,
    this.locality,
    this.title,
    this.surname,
    this.givenName,
    this.initials,
    this.pseudonym,
    this.generationQualifier,
  });
  static Asn1Subject fromJson(Map<String, dynamic> json) => Asn1Subject();
}

/// Contains information about your private certificate authority (CA). Your
/// private CA can issue and revoke X.509 digital certificates. Digital
/// certificates verify that the entity named in the certificate **Subject**
/// field owns or controls the public key contained in the **Subject Public Key
/// Info** field. Call the CreateCertificateAuthority action to create your
/// private CA. You must then call the GetCertificateAuthorityCertificate action
/// to retrieve a private CA certificate signing request (CSR). Sign the CSR
/// with your ACM Private CA-hosted or on-premises root or subordinate CA
/// certificate. Call the ImportCertificateAuthorityCertificate action to import
/// the signed certificate into AWS Certificate Manager (ACM).
class CertificateAuthority {
  /// Amazon Resource Name (ARN) for your private certificate authority (CA).
  /// The format is  `_12345678-1234-1234-1234-123456789012_` .
  final String arn;

  /// Date and time at which your private CA was created.
  final DateTime createdAt;

  /// Date and time at which your private CA was last updated.
  final DateTime lastStateChangeAt;

  /// Type of your private CA.
  final String type;

  /// Serial number of your private CA.
  final String serial;

  /// Status of your private CA.
  final String status;

  /// Date and time before which your private CA certificate is not valid.
  final DateTime notBefore;

  /// Date and time after which your private CA certificate is not valid.
  final DateTime notAfter;

  /// Reason the request to create your private CA failed.
  final String failureReason;

  /// Your private CA configuration.
  final CertificateAuthorityConfiguration certificateAuthorityConfiguration;

  /// Information about the certificate revocation list (CRL) created and
  /// maintained by your private CA.
  final RevocationConfiguration revocationConfiguration;

  /// The period during which a deleted CA can be restored. For more
  /// information, see the `PermanentDeletionTimeInDays` parameter of the
  /// DeleteCertificateAuthorityRequest action.
  final DateTime restorableUntil;

  CertificateAuthority({
    this.arn,
    this.createdAt,
    this.lastStateChangeAt,
    this.type,
    this.serial,
    this.status,
    this.notBefore,
    this.notAfter,
    this.failureReason,
    this.certificateAuthorityConfiguration,
    this.revocationConfiguration,
    this.restorableUntil,
  });
  static CertificateAuthority fromJson(Map<String, dynamic> json) =>
      CertificateAuthority();
}

/// Contains configuration information for your private certificate authority
/// (CA). This includes information about the class of public key algorithm and
/// the key pair that your private CA creates when it issues a certificate. It
/// also includes the signature algorithm that it uses when issuing
/// certificates, and its X.500 distinguished name. You must specify this
/// information when you call the CreateCertificateAuthority action.
class CertificateAuthorityConfiguration {
  /// Type of the public key algorithm and size, in bits, of the key pair that
  /// your CA creates when it issues a certificate. When you create a
  /// subordinate CA, you must use a key algorithm supported by the parent CA.
  final String keyAlgorithm;

  /// Name of the algorithm your private CA uses to sign certificate requests.
  final String signingAlgorithm;

  /// Structure that contains X.500 distinguished name information for your
  /// private CA.
  final Asn1Subject subject;

  CertificateAuthorityConfiguration({
    @required this.keyAlgorithm,
    @required this.signingAlgorithm,
    @required this.subject,
  });
  static CertificateAuthorityConfiguration fromJson(
          Map<String, dynamic> json) =>
      CertificateAuthorityConfiguration();
}

class CreateCertificateAuthorityAuditReportResponse {
  /// An alphanumeric string that contains a report identifier.
  final String auditReportId;

  /// The **key** that uniquely identifies the report file in your S3 bucket.
  final String s3Key;

  CreateCertificateAuthorityAuditReportResponse({
    this.auditReportId,
    this.s3Key,
  });
  static CreateCertificateAuthorityAuditReportResponse fromJson(
          Map<String, dynamic> json) =>
      CreateCertificateAuthorityAuditReportResponse();
}

class CreateCertificateAuthorityResponse {
  /// If successful, the Amazon Resource Name (ARN) of the certificate authority
  /// (CA). This is of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_`
  /// .
  final String certificateAuthorityArn;

  CreateCertificateAuthorityResponse({
    this.certificateAuthorityArn,
  });
  static CreateCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      CreateCertificateAuthorityResponse();
}

/// Contains configuration information for a certificate revocation list (CRL).
/// Your private certificate authority (CA) creates base CRLs. Delta CRLs are
/// not supported. You can enable CRLs for your new or an existing private CA by
/// setting the **Enabled** parameter to `true`. Your private CA writes CRLs to
/// an S3 bucket that you specify in the **S3BucketName** parameter. You can
/// hide the name of your bucket by specifying a value for the **CustomCname**
/// parameter. Your private CA copies the CNAME or the S3 bucket name to the
/// **CRL Distribution Points** extension of each certificate it issues. Your S3
/// bucket policy must give write permission to ACM Private CA.
///
/// Your private CA uses the value in the **ExpirationInDays** parameter to
/// calculate the **nextUpdate** field in the CRL. The CRL is refreshed at 1/2
/// the age of next update or when a certificate is revoked. When a certificate
/// is revoked, it is recorded in the next CRL that is generated and in the next
/// audit report. Only time valid certificates are listed in the CRL. Expired
/// certificates are not included.
///
/// CRLs contain the following fields:
///
/// *    **Version**: The current version number defined in RFC 5280 is V2. The
/// integer value is 0x1.
///
/// *    **Signature Algorithm**: The name of the algorithm used to sign the
/// CRL.
///
/// *    **Issuer**: The X.500 distinguished name of your private CA that issued
/// the CRL.
///
/// *    **Last Update**: The issue date and time of this CRL.
///
/// *    **Next Update**: The day and time by which the next CRL will be issued.
///
/// *    **Revoked Certificates**: List of revoked certificates. Each list item
/// contains the following information.
///
///     *    **Serial Number**: The serial number, in hexadecimal format, of the
/// revoked certificate.
///
///     *    **Revocation Date**: Date and time the certificate was revoked.
///
///     *    **CRL Entry Extensions**: Optional extensions for the CRL entry.
///
///         *    **X509v3 CRL Reason Code**: Reason the certificate was revoked.
///
///
///
/// *    **CRL Extensions**: Optional extensions for the CRL.
///
///     *    **X509v3 Authority Key Identifier**: Identifies the public key
/// associated with the private key used to sign the certificate.
///
///     *    **X509v3 CRL Number:**: Decimal sequence number for the CRL.
///
///
/// *    **Signature Algorithm**: Algorithm used by your private CA to sign the
/// CRL.
///
/// *    **Signature Value**: Signature computed over the CRL.
///
///
/// Certificate revocation lists created by ACM Private CA are DER-encoded. You
/// can use the following OpenSSL command to list a CRL.
///
///  `openssl crl -inform DER -text -in _crl_path_ -noout`
class CrlConfiguration {
  /// Boolean value that specifies whether certificate revocation lists (CRLs)
  /// are enabled. You can use this value to enable certificate revocation for a
  /// new CA when you call the CreateCertificateAuthority action or for an
  /// existing CA when you call the UpdateCertificateAuthority action.
  final bool enabled;

  /// Number of days until a certificate expires.
  final int expirationInDays;

  /// Name inserted into the certificate **CRL Distribution Points** extension
  /// that enables the use of an alias for the CRL distribution point. Use this
  /// value if you don't want the name of your S3 bucket to be public.
  final String customCname;

  /// Name of the S3 bucket that contains the CRL. If you do not provide a value
  /// for the **CustomCname** argument, the name of your S3 bucket is placed
  /// into the **CRL Distribution Points** extension of the issued certificate.
  /// You can change the name of your bucket by calling the
  /// UpdateCertificateAuthority action. You must specify a bucket policy that
  /// allows ACM Private CA to write the CRL to your bucket.
  final String s3BucketName;

  CrlConfiguration({
    @required this.enabled,
    this.expirationInDays,
    this.customCname,
    this.s3BucketName,
  });
  static CrlConfiguration fromJson(Map<String, dynamic> json) =>
      CrlConfiguration();
}

class DescribeCertificateAuthorityAuditReportResponse {
  /// Specifies whether report creation is in progress, has succeeded, or has
  /// failed.
  final String auditReportStatus;

  /// Name of the S3 bucket that contains the report.
  final String s3BucketName;

  /// S3 **key** that uniquely identifies the report file in your S3 bucket.
  final String s3Key;

  /// The date and time at which the report was created.
  final DateTime createdAt;

  DescribeCertificateAuthorityAuditReportResponse({
    this.auditReportStatus,
    this.s3BucketName,
    this.s3Key,
    this.createdAt,
  });
  static DescribeCertificateAuthorityAuditReportResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeCertificateAuthorityAuditReportResponse();
}

class DescribeCertificateAuthorityResponse {
  /// A CertificateAuthority structure that contains information about your
  /// private CA.
  final CertificateAuthority certificateAuthority;

  DescribeCertificateAuthorityResponse({
    this.certificateAuthority,
  });
  static DescribeCertificateAuthorityResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeCertificateAuthorityResponse();
}

class GetCertificateAuthorityCertificateResponse {
  /// Base64-encoded certificate authority (CA) certificate.
  final String certificate;

  /// Base64-encoded certificate chain that includes any intermediate
  /// certificates and chains up to root on-premises certificate that you used
  /// to sign your private CA certificate. The chain does not include your
  /// private CA certificate. If this is a root CA, the value will be null.
  final String certificateChain;

  GetCertificateAuthorityCertificateResponse({
    this.certificate,
    this.certificateChain,
  });
  static GetCertificateAuthorityCertificateResponse fromJson(
          Map<String, dynamic> json) =>
      GetCertificateAuthorityCertificateResponse();
}

class GetCertificateAuthorityCsrResponse {
  /// The base64 PEM-encoded certificate signing request (CSR) for your private
  /// CA certificate.
  final String csr;

  GetCertificateAuthorityCsrResponse({
    this.csr,
  });
  static GetCertificateAuthorityCsrResponse fromJson(
          Map<String, dynamic> json) =>
      GetCertificateAuthorityCsrResponse();
}

class GetCertificateResponse {
  /// The base64 PEM-encoded certificate specified by the `CertificateArn`
  /// parameter.
  final String certificate;

  /// The base64 PEM-encoded certificate chain that chains up to the on-premises
  /// root CA certificate that you used to sign your private CA certificate.
  final String certificateChain;

  GetCertificateResponse({
    this.certificate,
    this.certificateChain,
  });
  static GetCertificateResponse fromJson(Map<String, dynamic> json) =>
      GetCertificateResponse();
}

class IssueCertificateResponse {
  /// The Amazon Resource Name (ARN) of the issued certificate and the
  /// certificate serial number. This is of the form:
  ///
  ///
  /// `arn:aws:acm-pca:_region_:_account_:certificate-authority/_12345678-1234-1234-1234-123456789012_/certificate/_286535153982981100925020015808220737245_`
  final String certificateArn;

  IssueCertificateResponse({
    this.certificateArn,
  });
  static IssueCertificateResponse fromJson(Map<String, dynamic> json) =>
      IssueCertificateResponse();
}

class ListCertificateAuthoritiesResponse {
  /// Summary information about each certificate authority you have created.
  final List<CertificateAuthority> certificateAuthorities;

  /// When the list is truncated, this value is present and should be used for
  /// the `NextToken` parameter in a subsequent pagination request.
  final String nextToken;

  ListCertificateAuthoritiesResponse({
    this.certificateAuthorities,
    this.nextToken,
  });
  static ListCertificateAuthoritiesResponse fromJson(
          Map<String, dynamic> json) =>
      ListCertificateAuthoritiesResponse();
}

class ListPermissionsResponse {
  /// Summary information about each permission assigned by the specified
  /// private CA, including the action enabled, the policy provided, and the
  /// time of creation.
  final List<Permission> permissions;

  /// When the list is truncated, this value is present and should be used for
  /// the **NextToken** parameter in a subsequent pagination request.
  final String nextToken;

  ListPermissionsResponse({
    this.permissions,
    this.nextToken,
  });
  static ListPermissionsResponse fromJson(Map<String, dynamic> json) =>
      ListPermissionsResponse();
}

class ListTagsResponse {
  /// The tags associated with your private CA.
  final List<Tag> tags;

  /// When the list is truncated, this value is present and should be used for
  /// the **NextToken** parameter in a subsequent pagination request.
  final String nextToken;

  ListTagsResponse({
    this.tags,
    this.nextToken,
  });
  static ListTagsResponse fromJson(Map<String, dynamic> json) =>
      ListTagsResponse();
}

/// Permissions designate which private CA actions can be performed by an AWS
/// service or entity. In order for ACM to automatically renew private
/// certificates, you must give the ACM service principal all available
/// permissions (`IssueCertificate`, `GetCertificate`, and `ListPermissions`).
/// Permissions can be assigned with the CreatePermission action, removed with
/// the DeletePermission action, and listed with the ListPermissions action.
class Permission {
  /// The Amazon Resource Number (ARN) of the private CA from which the
  /// permission was issued.
  final String certificateAuthorityArn;

  /// The time at which the permission was created.
  final DateTime createdAt;

  /// The AWS service or entity that holds the permission. At this time, the
  /// only valid principal is `acm.amazonaws.com`.
  final String principal;

  /// The ID of the account that assigned the permission.
  final String sourceAccount;

  /// The private CA actions that can be performed by the designated AWS
  /// service.
  final List<String> actions;

  /// The name of the policy that is associated with the permission.
  final String policy;

  Permission({
    this.certificateAuthorityArn,
    this.createdAt,
    this.principal,
    this.sourceAccount,
    this.actions,
    this.policy,
  });
  static Permission fromJson(Map<String, dynamic> json) => Permission();
}

/// Certificate revocation information used by the CreateCertificateAuthority
/// and UpdateCertificateAuthority actions. Your private certificate authority
/// (CA) can create and maintain a certificate revocation list (CRL). A CRL
/// contains information about certificates revoked by your CA. For more
/// information, see RevokeCertificate.
class RevocationConfiguration {
  /// Configuration of the certificate revocation list (CRL), if any, maintained
  /// by your private CA.
  final CrlConfiguration crlConfiguration;

  RevocationConfiguration({
    this.crlConfiguration,
  });
  static RevocationConfiguration fromJson(Map<String, dynamic> json) =>
      RevocationConfiguration();
}

/// Tags are labels that you can use to identify and organize your private CAs.
/// Each tag consists of a key and an optional value. You can associate up to 50
/// tags with a private CA. To add one or more tags to a private CA, call the
/// TagCertificateAuthority action. To remove a tag, call the
/// UntagCertificateAuthority action.
class Tag {
  /// Key (name) of the tag.
  final String key;

  /// Value of the tag.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

/// Length of time for which the certificate issued by your private certificate
/// authority (CA), or by the private CA itself, is valid in days, months, or
/// years. You can issue a certificate by calling the IssueCertificate action.
class Validity {
  /// Time period.
  final BigInt value;

  /// Specifies whether the `Value` parameter represents days, months, or years.
  final String type;

  Validity({
    @required this.value,
    @required this.type,
  });
}
