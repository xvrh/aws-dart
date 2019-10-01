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
/// using. For more information, see [AWS
/// SDKs](https://aws.amazon.com/tools/#SDKs).
///
///
///
/// Each ACM Private CA API action has a throttling limit which determines the
/// number of times the action can be called per second. For more information,
/// see [API Rate Limits in ACM Private
/// CA](https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaLimits.html#PcaLimits-api)
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
  Future<void> createCertificateAuthority(
      {@required
          CertificateAuthorityConfiguration certificateAuthorityConfiguration,
      RevocationConfiguration revocationConfiguration,
      @required
          String certificateAuthorityType,
      String idempotencyToken,
      List<Tag> tags}) async {}

  /// Creates an audit report that lists every time that your CA private key is
  /// used. The report is saved in the Amazon S3 bucket that you specify on
  /// input. The IssueCertificate and RevokeCertificate actions use the private
  /// key.
  Future<void> createCertificateAuthorityAuditReport(
      {@required String certificateAuthorityArn,
      @required String s3BucketName,
      @required String auditReportResponseFormat}) async {}

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
  Future<void> deleteCertificateAuthority(String certificateAuthorityArn,
      {int permanentDeletionTimeInDays}) async {}

  /// Revokes permissions that a private CA assigned to a designated AWS
  /// service. Permissions can be created with the CreatePermission action and
  /// listed with the ListPermissions action.
  Future<void> deletePermission(
      {@required String certificateAuthorityArn,
      @required String principal,
      String sourceAccount}) async {}

  /// Lists information about your private certificate authority (CA). You
  /// specify the private CA on input by its ARN (Amazon Resource Name). The
  /// output contains the status of your CA. This can be any of the following:
  ///
  /// *    `CREATING` \- ACM Private CA is creating your private certificate
  /// authority.
  ///
  /// *    `PENDING_CERTIFICATE` \- The certificate is pending. You must use
  /// your ACM Private CA-hosted or on-premises root or subordinate CA to sign
  /// your private CA CSR and then import it into PCA.
  ///
  /// *    `ACTIVE` \- Your private CA is active.
  ///
  /// *    `DISABLED` \- Your private CA has been disabled.
  ///
  /// *    `EXPIRED` \- Your private CA certificate has expired.
  ///
  /// *    `FAILED` \- Your private CA has failed. Your CA can fail because of
  /// problems such a network outage or backend AWS failure or other errors. A
  /// failed CA can never return to the pending state. You must create a new CA.
  ///
  /// *    `DELETED` \- Your private CA is within the restoration period, after
  /// which it is permanently deleted. The length of time remaining in the CA's
  /// restoration period is also included in this action's output.
  Future<void> describeCertificateAuthority(
      String certificateAuthorityArn) async {}

  /// Lists information about a specific audit report created by calling the
  /// CreateCertificateAuthorityAuditReport action. Audit information is created
  /// every time the certificate authority (CA) private key is used. The private
  /// key is used when you call the IssueCertificate action or the
  /// RevokeCertificate action.
  Future<void> describeCertificateAuthorityAuditReport(
      {@required String certificateAuthorityArn,
      @required String auditReportId}) async {}

  /// Retrieves a certificate from your private CA. The ARN of the certificate
  /// is returned when you call the IssueCertificate action. You must specify
  /// both the ARN of your private CA and the ARN of the issued certificate when
  /// calling the **GetCertificate** action. You can retrieve the certificate if
  /// it is in the **ISSUED** state. You can call the
  /// CreateCertificateAuthorityAuditReport action to create a report that
  /// contains information about all of the certificates issued and revoked by
  /// your private CA.
  Future<void> getCertificate(
      {@required String certificateAuthorityArn,
      @required String certificateArn}) async {}

  /// Retrieves the certificate and certificate chain for your private
  /// certificate authority (CA). Both the certificate and the chain are base64
  /// PEM-encoded. The chain does not include the CA certificate. Each
  /// certificate in the chain signs the one before it.
  Future<void> getCertificateAuthorityCertificate(
      String certificateAuthorityArn) async {}

  /// Retrieves the certificate signing request (CSR) for your private
  /// certificate authority (CA). The CSR is created when you call the
  /// CreateCertificateAuthority action. Sign the CSR with your ACM Private
  /// CA-hosted or on-premises root or subordinate CA. Then import the signed
  /// certificate back into ACM Private CA by calling the
  /// ImportCertificateAuthorityCertificate action. The CSR is returned as a
  /// base64 PEM-encoded string.
  Future<void> getCertificateAuthorityCsr(
      String certificateAuthorityArn) async {}

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
  Future<void> issueCertificate(
      {@required String certificateAuthorityArn,
      @required Uint8List csr,
      @required String signingAlgorithm,
      String templateArn,
      @required Validity validity,
      String idempotencyToken}) async {}

  /// Lists the private certificate authorities that you created by using the
  /// CreateCertificateAuthority action.
  Future<void> listCertificateAuthorities(
      {String nextToken, int maxResults}) async {}

  /// Lists all the permissions, if any, that have been assigned by a private
  /// CA. Permissions can be granted with the CreatePermission action and
  /// revoked with the DeletePermission action.
  Future<void> listPermissions(String certificateAuthorityArn,
      {String nextToken, int maxResults}) async {}

  /// Lists the tags, if any, that are associated with your private CA. Tags are
  /// labels that you can use to identify and organize your CAs. Each tag
  /// consists of a key and an optional value. Call the TagCertificateAuthority
  /// action to add one or more tags to your CA. Call the
  /// UntagCertificateAuthority action to remove tags.
  Future<void> listTags(String certificateAuthorityArn,
      {String nextToken, int maxResults}) async {}

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
  Future<void> untagCertificateAuthority(
      {@required String certificateAuthorityArn,
      @required List<Tag> tags}) async {}

  /// Updates the status or configuration of a private certificate authority
  /// (CA). Your private CA must be in the `ACTIVE` or `DISABLED` state before
  /// you can update it. You can disable a private CA that is in the `ACTIVE`
  /// state or make a CA that is in the `DISABLED` state active again.
  Future<void> updateCertificateAuthority(String certificateAuthorityArn,
      {RevocationConfiguration revocationConfiguration, String status}) async {}
}

class Asn1Subject {}

class CertificateAuthority {}

class CertificateAuthorityConfiguration {}

class CreateCertificateAuthorityAuditReportResponse {}

class CreateCertificateAuthorityResponse {}

class CrlConfiguration {}

class DescribeCertificateAuthorityAuditReportResponse {}

class DescribeCertificateAuthorityResponse {}

class GetCertificateAuthorityCertificateResponse {}

class GetCertificateAuthorityCsrResponse {}

class GetCertificateResponse {}

class IssueCertificateResponse {}

class ListCertificateAuthoritiesResponse {}

class ListPermissionsResponse {}

class ListTagsResponse {}

class Permission {}

class RevocationConfiguration {}

class Tag {}

class Validity {}
