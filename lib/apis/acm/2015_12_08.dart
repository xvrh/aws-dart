import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Certificate Manager
///
/// Welcome to the AWS Certificate Manager (ACM) API documentation.
///
/// You can use ACM to manage SSL/TLS certificates for your AWS-based websites
/// and applications. For general information about using ACM, see the
/// [_AWS Certificate Manager User Guide_](https://docs.aws.amazon.com/acm/latest/userguide/)
/// .
class AcmApi {
  final _client;
  AcmApi(client) : _client = client.configured('ACM', serializer: 'json');

  /// Adds one or more tags to an ACM certificate. Tags are labels that you can
  /// use to identify and organize your AWS resources. Each tag consists of a
  /// `key` and an optional `value`. You specify the certificate on input by its
  /// Amazon Resource Name (ARN). You specify the tag by using a key-value pair.
  ///
  /// You can apply a tag to just one certificate if you want to identify a
  /// specific characteristic of that certificate, or you can apply the same tag
  /// to multiple certificates if you want to filter for a common relationship
  /// among those certificates. Similarly, you can apply the same tag to
  /// multiple resources if you want to specify a relationship among those
  /// resources. For example, you can add the same tag to an ACM certificate and
  /// an Elastic Load Balancing load balancer to indicate that they are both
  /// used by the same website. For more information, see
  /// [Tagging ACM certificates](https://docs.aws.amazon.com/acm/latest/userguide/tags.html).
  ///
  /// To remove one or more tags, use the RemoveTagsFromCertificate action. To
  /// view all of the tags that have been applied to the certificate, use the
  /// ListTagsForCertificate action.
  ///
  /// [certificateArn]: String that contains the ARN of the ACM certificate to
  /// which the tag is to be applied. This must be of the form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  ///
  /// [tags]: The key-value pair that defines the tag. The tag value is
  /// optional.
  Future<void> addTagsToCertificate(
      {@required String certificateArn, @required List<Tag> tags}) async {
    await _client.send('AddTagsToCertificate', {
      'CertificateArn': certificateArn,
      'Tags': tags,
    });
  }

  /// Deletes a certificate and its associated private key. If this action
  /// succeeds, the certificate no longer appears in the list that can be
  /// displayed by calling the ListCertificates action or be retrieved by
  /// calling the GetCertificate action. The certificate will not be available
  /// for use by AWS services integrated with ACM.
  ///
  ///
  ///
  /// You cannot delete an ACM certificate that is being used by another AWS
  /// service. To delete a certificate that is in use, the certificate
  /// association must first be removed.
  ///
  /// [certificateArn]: String that contains the ARN of the ACM certificate to
  /// be deleted. This must be of the form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<void> deleteCertificate(String certificateArn) async {
    await _client.send('DeleteCertificate', {
      'CertificateArn': certificateArn,
    });
  }

  /// Returns detailed metadata about the specified ACM certificate.
  ///
  /// [certificateArn]: The Amazon Resource Name (ARN) of the ACM certificate.
  /// The ARN must have the following form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<DescribeCertificateResponse> describeCertificate(
      String certificateArn) async {
    var response_ = await _client.send('DescribeCertificate', {
      'CertificateArn': certificateArn,
    });
    return DescribeCertificateResponse.fromJson(response_);
  }

  /// Exports a private certificate issued by a private certificate authority
  /// (CA) for use anywhere. You can export the certificate, the certificate
  /// chain, and the encrypted private key associated with the public key
  /// embedded in the certificate. You must store the private key securely. The
  /// private key is a 2048 bit RSA key. You must provide a passphrase for the
  /// private key when exporting it. You can use the following OpenSSL command
  /// to decrypt it later. Provide the passphrase when prompted.
  ///
  ///  `openssl rsa -in encrypted_key.pem -out decrypted_key.pem`
  ///
  /// [certificateArn]: An Amazon Resource Name (ARN) of the issued certificate.
  /// This must be of the form:
  ///
  ///
  /// `arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// [passphrase]: Passphrase to associate with the encrypted exported private
  /// key. If you want to later decrypt the private key, you must have the
  /// passphrase. You can use the following OpenSSL command to decrypt a private
  /// key:
  ///
  ///  `openssl rsa -in encrypted_key.pem -out decrypted_key.pem`
  Future<ExportCertificateResponse> exportCertificate(
      {@required String certificateArn, @required Uint8List passphrase}) async {
    var response_ = await _client.send('ExportCertificate', {
      'CertificateArn': certificateArn,
      'Passphrase': passphrase,
    });
    return ExportCertificateResponse.fromJson(response_);
  }

  /// Retrieves a certificate specified by an ARN and its certificate chain .
  /// The chain is an ordered list of certificates that contains the end entity
  /// certificate, intermediate certificates of subordinate CAs, and the root
  /// certificate in that order. The certificate and certificate chain are
  /// base64 encoded. If you want to decode the certificate to see the
  /// individual fields, you can use OpenSSL.
  ///
  /// [certificateArn]: String that contains a certificate ARN in the following
  /// format:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<GetCertificateResponse> getCertificate(String certificateArn) async {
    var response_ = await _client.send('GetCertificate', {
      'CertificateArn': certificateArn,
    });
    return GetCertificateResponse.fromJson(response_);
  }

  /// Imports a certificate into AWS Certificate Manager (ACM) to use with
  /// services that are integrated with ACM. Note that
  /// [integrated services](https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html)
  /// allow only certificate types and keys they support to be associated with
  /// their resources. Further, their support differs depending on whether the
  /// certificate is imported into IAM or into ACM. For more information, see
  /// the documentation for each service. For more information about importing
  /// certificates into ACM, see
  /// [Importing Certificates](https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html)
  /// in the _AWS Certificate Manager User Guide_.
  ///
  ///  ACM does not provide
  /// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html)
  /// for certificates that you import.
  ///
  /// Note the following guidelines when importing third party certificates:
  ///
  /// *   You must enter the private key that matches the certificate you are
  /// importing.
  ///
  /// *   The private key must be unencrypted. You cannot import a private key
  /// that is protected by a password or a passphrase.
  ///
  /// *   If the certificate you are importing is not self-signed, you must
  /// enter its certificate chain.
  ///
  /// *   If a certificate chain is included, the issuer must be the subject of
  /// one of the certificates in the chain.
  ///
  /// *   The certificate, private key, and certificate chain must be
  /// PEM-encoded.
  ///
  /// *   The current time must be between the `Not Before` and `Not After`
  /// certificate fields.
  ///
  /// *   The `Issuer` field must not be empty.
  ///
  /// *   The OCSP authority URL, if present, must not exceed 1000 characters.
  ///
  /// *   To import a new certificate, omit the `CertificateArn` argument.
  /// Include this argument only when you want to replace a previously imported
  /// certificate.
  ///
  /// *   When you import a certificate by using the CLI, you must specify the
  /// certificate, the certificate chain, and the private key by their file
  /// names preceded by `file://`. For example, you can specify a certificate
  /// saved in the `C:temp` folder as `file://C:tempcertificate_to_import.pem`.
  /// If you are making an HTTP or HTTPS Query request, include these arguments
  /// as BLOBs.
  ///
  /// *   When you import a certificate by using an SDK, you must specify the
  /// certificate, the certificate chain, and the private key files in the
  /// manner required by the programming language you're using.
  ///
  ///
  /// This operation returns the
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of the imported certificate.
  ///
  /// [certificateArn]: The
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of an imported certificate to replace. To import a new certificate, omit
  /// this field.
  ///
  /// [certificate]: The certificate to import.
  ///
  /// [privateKey]: The private key that matches the public key in the
  /// certificate.
  ///
  /// [certificateChain]: The PEM encoded certificate chain.
  Future<ImportCertificateResponse> importCertificate(
      {String certificateArn,
      @required Uint8List certificate,
      @required Uint8List privateKey,
      Uint8List certificateChain}) async {
    var response_ = await _client.send('ImportCertificate', {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      'Certificate': certificate,
      'PrivateKey': privateKey,
      if (certificateChain != null) 'CertificateChain': certificateChain,
    });
    return ImportCertificateResponse.fromJson(response_);
  }

  /// Retrieves a list of certificate ARNs and domain names. You can request
  /// that only certificates that match a specific status be listed. You can
  /// also filter by specific attributes of the certificate.
  ///
  /// [certificateStatuses]: Filter the certificate list by status value.
  ///
  /// [includes]: Filter the certificate list. For more information, see the
  /// Filters structure.
  ///
  /// [nextToken]: Use this parameter only when paginating results and only in a
  /// subsequent request after you receive a response with truncated results.
  /// Set it to the value of `NextToken` from the response you just received.
  ///
  /// [maxItems]: Use this parameter when paginating results to specify the
  /// maximum number of items to return in the response. If additional items
  /// exist beyond the number you specify, the `NextToken` element is sent in
  /// the response. Use this `NextToken` value in a subsequent request to
  /// retrieve additional items.
  Future<ListCertificatesResponse> listCertificates(
      {List<String> certificateStatuses,
      Filters includes,
      String nextToken,
      int maxItems}) async {
    var response_ = await _client.send('ListCertificates', {
      if (certificateStatuses != null)
        'CertificateStatuses': certificateStatuses,
      if (includes != null) 'Includes': includes,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxItems != null) 'MaxItems': maxItems,
    });
    return ListCertificatesResponse.fromJson(response_);
  }

  /// Lists the tags that have been applied to the ACM certificate. Use the
  /// certificate's Amazon Resource Name (ARN) to specify the certificate. To
  /// add a tag to an ACM certificate, use the AddTagsToCertificate action. To
  /// delete a tag, use the RemoveTagsFromCertificate action.
  ///
  /// [certificateArn]: String that contains the ARN of the ACM certificate for
  /// which you want to list the tags. This must have the following form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<ListTagsForCertificateResponse> listTagsForCertificate(
      String certificateArn) async {
    var response_ = await _client.send('ListTagsForCertificate', {
      'CertificateArn': certificateArn,
    });
    return ListTagsForCertificateResponse.fromJson(response_);
  }

  /// Remove one or more tags from an ACM certificate. A tag consists of a
  /// key-value pair. If you do not specify the value portion of the tag when
  /// calling this function, the tag will be removed regardless of value. If you
  /// specify a value, the tag is removed only if it is associated with the
  /// specified value.
  ///
  /// To add tags to a certificate, use the AddTagsToCertificate action. To view
  /// all of the tags that have been applied to a specific ACM certificate, use
  /// the ListTagsForCertificate action.
  ///
  /// [certificateArn]: String that contains the ARN of the ACM Certificate with
  /// one or more tags that you want to remove. This must be of the form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  ///
  /// [tags]: The key-value pair that defines the tag to remove.
  Future<void> removeTagsFromCertificate(
      {@required String certificateArn, @required List<Tag> tags}) async {
    await _client.send('RemoveTagsFromCertificate', {
      'CertificateArn': certificateArn,
      'Tags': tags,
    });
  }

  /// Renews an eligable ACM certificate. At this time, only exported private
  /// certificates can be renewed with this operation. In order to renew your
  /// ACM PCA certificates with ACM, you must first
  /// [grant the ACM service principal permission to do so](https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaPermissions.html).
  /// For more information, see
  /// [Testing Managed Renewal](https://docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html)
  /// in the ACM User Guide.
  ///
  /// [certificateArn]: String that contains the ARN of the ACM certificate to
  /// be renewed. This must be of the form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  Future<void> renewCertificate(String certificateArn) async {
    await _client.send('RenewCertificate', {
      'CertificateArn': certificateArn,
    });
  }

  /// Requests an ACM certificate for use with other AWS services. To request an
  /// ACM certificate, you must specify a fully qualified domain name (FQDN) in
  /// the `DomainName` parameter. You can also specify additional FQDNs in the
  /// `SubjectAlternativeNames` parameter.
  ///
  /// If you are requesting a private certificate, domain validation is not
  /// required. If you are requesting a public certificate, each domain name
  /// that you specify must be validated to verify that you own or control the
  /// domain. You can use
  /// [DNS validation](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html)
  /// or
  /// [email validation](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html).
  /// We recommend that you use DNS validation. ACM issues public certificates
  /// after receiving approval from the domain owner.
  ///
  /// [domainName]:  Fully qualified domain name (FQDN), such as
  /// www.example.com, that you want to secure with an ACM certificate. Use an
  /// asterisk (*) to create a wildcard certificate that protects several sites
  /// in the same domain. For example, *.example.com protects www.example.com,
  /// site.example.com, and images.example.com.
  ///
  ///  The first domain name you enter cannot exceed 63 octets, including
  /// periods. Each subsequent Subject Alternative Name (SAN), however, can be
  /// up to 253 octets in length.
  ///
  /// [validationMethod]: The method you want to use if you are requesting a
  /// public certificate to validate that you own or control domain. You can
  /// [validate with DNS](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html)
  /// or
  /// [validate with email](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html).
  /// We recommend that you use DNS validation.
  ///
  /// [subjectAlternativeNames]: Additional FQDNs to be included in the Subject
  /// Alternative Name extension of the ACM certificate. For example, add the
  /// name www.example.net to a certificate for which the `DomainName` field is
  /// www.example.com if users can reach your site by using either name. The
  /// maximum number of domain names that you can add to an ACM certificate is
  /// 100. However, the initial limit is 10 domain names. If you need more than
  /// 10 names, you must request a limit increase. For more information, see
  /// [Limits](https://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html).
  ///
  ///  The maximum length of a SAN DNS name is 253 octets. The name is made up
  /// of multiple labels separated by periods. No label can be longer than 63
  /// octets. Consider the following examples:
  ///
  /// *    `(63 octets).(63 octets).(63 octets).(61 octets)` is legal because
  /// the total length is 253 octets (63+1+63+1+63+1+61) and no label exceeds 63
  /// octets.
  ///
  /// *    `(64 octets).(63 octets).(63 octets).(61 octets)` is not legal
  /// because the total length exceeds 253 octets (64+1+63+1+63+1+61) and the
  /// first label exceeds 63 octets.
  ///
  /// *    `(63 octets).(63 octets).(63 octets).(62 octets)` is not legal
  /// because the total length of the DNS name (63+1+63+1+63+1+62) exceeds 253
  /// octets.
  ///
  /// [idempotencyToken]: Customer chosen string that can be used to distinguish
  /// between calls to `RequestCertificate`. Idempotency tokens time out after
  /// one hour. Therefore, if you call `RequestCertificate` multiple times with
  /// the same idempotency token within one hour, ACM recognizes that you are
  /// requesting only one certificate and will issue only one. If you change the
  /// idempotency token for each call, ACM recognizes that you are requesting
  /// multiple certificates.
  ///
  /// [domainValidationOptions]: The domain name that you want ACM to use to
  /// send you emails so that you can validate domain ownership.
  ///
  /// [options]: Currently, you can use this parameter to specify whether to add
  /// the certificate to a certificate transparency log. Certificate
  /// transparency makes it possible to detect SSL/TLS certificates that have
  /// been mistakenly or maliciously issued. Certificates that have not been
  /// logged typically produce an error message in a browser. For more
  /// information, see
  /// [Opting Out of Certificate Transparency Logging](https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency).
  ///
  /// [certificateAuthorityArn]: The Amazon Resource Name (ARN) of the private
  /// certificate authority (CA) that will be used to issue the certificate. If
  /// you do not provide an ARN and you are trying to request a private
  /// certificate, ACM will attempt to issue a public certificate. For more
  /// information about private CAs, see the
  /// [AWS Certificate Manager Private Certificate Authority (PCA)](https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaWelcome.html)
  /// user guide. The ARN must have the following form:
  ///
  ///
  /// `arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012`
  Future<RequestCertificateResponse> requestCertificate(String domainName,
      {String validationMethod,
      List<String> subjectAlternativeNames,
      String idempotencyToken,
      List<DomainValidationOption> domainValidationOptions,
      CertificateOptions options,
      String certificateAuthorityArn}) async {
    var response_ = await _client.send('RequestCertificate', {
      'DomainName': domainName,
      if (validationMethod != null) 'ValidationMethod': validationMethod,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (domainValidationOptions != null)
        'DomainValidationOptions': domainValidationOptions,
      if (options != null) 'Options': options,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
    });
    return RequestCertificateResponse.fromJson(response_);
  }

  /// Resends the email that requests domain ownership validation. The domain
  /// owner or an authorized representative must approve the ACM certificate
  /// before it can be issued. The certificate can be approved by clicking a
  /// link in the mail to navigate to the Amazon certificate approval website
  /// and then clicking **I Approve**. However, the validation email can be
  /// blocked by spam filters. Therefore, if you do not receive the original
  /// mail, you can request that the mail be resent within 72 hours of
  /// requesting the ACM certificate. If more than 72 hours have elapsed since
  /// your original request or since your last attempt to resend validation
  /// mail, you must request a new certificate. For more information about
  /// setting up your contact email addresses, see
  /// [Configure Email for your Domain](https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html).
  ///
  /// [certificateArn]: String that contains the ARN of the requested
  /// certificate. The certificate ARN is generated and returned by the
  /// RequestCertificate action as soon as the request is made. By default,
  /// using this parameter causes email to be sent to all top-level domains you
  /// specified in the certificate request. The ARN must be of the form:
  ///
  ///
  /// `arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// [domain]: The fully qualified domain name (FQDN) of the certificate that
  /// needs to be validated.
  ///
  /// [validationDomain]: The base validation domain that will act as the suffix
  /// of the email addresses that are used to send the emails. This must be the
  /// same as the `Domain` value or a superdomain of the `Domain` value. For
  /// example, if you requested a certificate for `site.subdomain.example.com`
  /// and specify a **ValidationDomain** of `subdomain.example.com`, ACM sends
  /// email to the domain registrant, technical contact, and administrative
  /// contact in WHOIS and the following five addresses:
  ///
  /// *   admin@subdomain.example.com
  ///
  /// *   administrator@subdomain.example.com
  ///
  /// *   hostmaster@subdomain.example.com
  ///
  /// *   postmaster@subdomain.example.com
  ///
  /// *   webmaster@subdomain.example.com
  Future<void> resendValidationEmail(
      {@required String certificateArn,
      @required String domain,
      @required String validationDomain}) async {
    await _client.send('ResendValidationEmail', {
      'CertificateArn': certificateArn,
      'Domain': domain,
      'ValidationDomain': validationDomain,
    });
  }

  /// Updates a certificate. Currently, you can use this function to specify
  /// whether to opt in to or out of recording your certificate in a certificate
  /// transparency log. For more information, see
  /// [Opting Out of Certificate Transparency Logging](https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency).
  ///
  /// [certificateArn]: ARN of the requested certificate to update. This must be
  /// of the form:
  ///
  ///
  /// `arn:aws:acm:us-east-1:_account_:certificate/_12345678-1234-1234-1234-123456789012_`
  ///
  /// [options]: Use to update the options for your certificate. Currently, you
  /// can specify whether to add your certificate to a transparency log.
  /// Certificate transparency makes it possible to detect SSL/TLS certificates
  /// that have been mistakenly or maliciously issued. Certificates that have
  /// not been logged typically produce an error message in a browser.
  Future<void> updateCertificateOptions(
      {@required String certificateArn,
      @required CertificateOptions options}) async {
    await _client.send('UpdateCertificateOptions', {
      'CertificateArn': certificateArn,
      'Options': options,
    });
  }
}

/// Contains metadata about an ACM certificate. This structure is returned in
/// the response to a DescribeCertificate request.
class CertificateDetail {
  /// The Amazon Resource Name (ARN) of the certificate. For more information
  /// about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// in the _AWS General Reference_.
  final String certificateArn;

  /// The fully qualified domain name for the certificate, such as
  /// www.example.com or example.com.
  final String domainName;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate. The subject alternative
  /// names include the canonical domain name (CN) of the certificate and
  /// additional domain names that can be used to connect to the website.
  final List<String> subjectAlternativeNames;

  /// Contains information about the initial validation of each domain name that
  /// occurs as a result of the RequestCertificate request. This field exists
  /// only when the certificate type is `AMAZON_ISSUED`.
  final List<DomainValidation> domainValidationOptions;

  /// The serial number of the certificate.
  final String serial;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  final String subject;

  /// The name of the certificate authority that issued and signed the
  /// certificate.
  final String issuer;

  /// The time at which the certificate was requested. This value exists only
  /// when the certificate type is `AMAZON_ISSUED`.
  final DateTime createdAt;

  /// The time at which the certificate was issued. This value exists only when
  /// the certificate type is `AMAZON_ISSUED`.
  final DateTime issuedAt;

  /// The date and time at which the certificate was imported. This value exists
  /// only when the certificate type is `IMPORTED`.
  final DateTime importedAt;

  /// The status of the certificate.
  final String status;

  /// The time at which the certificate was revoked. This value exists only when
  /// the certificate status is `REVOKED`.
  final DateTime revokedAt;

  /// The reason the certificate was revoked. This value exists only when the
  /// certificate status is `REVOKED`.
  final String revocationReason;

  /// The time before which the certificate is not valid.
  final DateTime notBefore;

  /// The time after which the certificate is not valid.
  final DateTime notAfter;

  /// The algorithm that was used to generate the public-private key pair.
  final String keyAlgorithm;

  /// The algorithm that was used to sign the certificate.
  final String signatureAlgorithm;

  /// A list of ARNs for the AWS resources that are using the certificate. A
  /// certificate can be used by multiple AWS resources.
  final List<String> inUseBy;

  /// The reason the certificate request failed. This value exists only when the
  /// certificate status is `FAILED`. For more information, see
  /// [Certificate Request Failed](https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting.html#troubleshooting-failed)
  /// in the _AWS Certificate Manager User Guide_.
  final String failureReason;

  /// The source of the certificate. For certificates provided by ACM, this
  /// value is `AMAZON_ISSUED`. For certificates that you imported with
  /// ImportCertificate, this value is `IMPORTED`. ACM does not provide
  /// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html)
  /// for imported certificates. For more information about the differences
  /// between certificates that you import and those that ACM provides, see
  /// [Importing Certificates](https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html)
  /// in the _AWS Certificate Manager User Guide_.
  final String type;

  /// Contains information about the status of ACM's
  /// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html)
  /// for the certificate. This field exists only when the certificate type is
  /// `AMAZON_ISSUED`.
  final RenewalSummary renewalSummary;

  /// A list of Key Usage X.509 v3 extension objects. Each object is a string
  /// value that identifies the purpose of the public key contained in the
  /// certificate. Possible extension values include DIGITAL_SIGNATURE,
  /// KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
  final List<KeyUsage> keyUsages;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be
  /// used and consists of a name and an object identifier (OID).
  final List<ExtendedKeyUsage> extendedKeyUsages;

  /// The Amazon Resource Name (ARN) of the ACM PCA private certificate
  /// authority (CA) that issued the certificate. This has the following format:
  ///
  ///
  /// `arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012`
  final String certificateAuthorityArn;

  /// Specifies whether the certificate is eligible for renewal. At this time,
  /// only exported private certificates can be renewed with the
  /// RenewCertificate command.
  final String renewalEligibility;

  /// Value that specifies whether to add the certificate to a transparency log.
  /// Certificate transparency makes it possible to detect SSL certificates that
  /// have been mistakenly or maliciously issued. A browser might respond to
  /// certificate that has not been logged by showing an error message. The logs
  /// are cryptographically secure.
  final CertificateOptions options;

  CertificateDetail({
    this.certificateArn,
    this.domainName,
    this.subjectAlternativeNames,
    this.domainValidationOptions,
    this.serial,
    this.subject,
    this.issuer,
    this.createdAt,
    this.issuedAt,
    this.importedAt,
    this.status,
    this.revokedAt,
    this.revocationReason,
    this.notBefore,
    this.notAfter,
    this.keyAlgorithm,
    this.signatureAlgorithm,
    this.inUseBy,
    this.failureReason,
    this.type,
    this.renewalSummary,
    this.keyUsages,
    this.extendedKeyUsages,
    this.certificateAuthorityArn,
    this.renewalEligibility,
    this.options,
  });
  static CertificateDetail fromJson(Map<String, dynamic> json) =>
      CertificateDetail(
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
        subjectAlternativeNames: json.containsKey('SubjectAlternativeNames')
            ? (json['SubjectAlternativeNames'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        domainValidationOptions: json.containsKey('DomainValidationOptions')
            ? (json['DomainValidationOptions'] as List)
                .map((e) => DomainValidation.fromJson(e))
                .toList()
            : null,
        serial: json.containsKey('Serial') ? json['Serial'] as String : null,
        subject: json.containsKey('Subject') ? json['Subject'] as String : null,
        issuer: json.containsKey('Issuer') ? json['Issuer'] as String : null,
        createdAt: json.containsKey('CreatedAt')
            ? DateTime.parse(json['CreatedAt'])
            : null,
        issuedAt: json.containsKey('IssuedAt')
            ? DateTime.parse(json['IssuedAt'])
            : null,
        importedAt: json.containsKey('ImportedAt')
            ? DateTime.parse(json['ImportedAt'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        revokedAt: json.containsKey('RevokedAt')
            ? DateTime.parse(json['RevokedAt'])
            : null,
        revocationReason: json.containsKey('RevocationReason')
            ? json['RevocationReason'] as String
            : null,
        notBefore: json.containsKey('NotBefore')
            ? DateTime.parse(json['NotBefore'])
            : null,
        notAfter: json.containsKey('NotAfter')
            ? DateTime.parse(json['NotAfter'])
            : null,
        keyAlgorithm: json.containsKey('KeyAlgorithm')
            ? json['KeyAlgorithm'] as String
            : null,
        signatureAlgorithm: json.containsKey('SignatureAlgorithm')
            ? json['SignatureAlgorithm'] as String
            : null,
        inUseBy: json.containsKey('InUseBy')
            ? (json['InUseBy'] as List).map((e) => e as String).toList()
            : null,
        failureReason: json.containsKey('FailureReason')
            ? json['FailureReason'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        renewalSummary: json.containsKey('RenewalSummary')
            ? RenewalSummary.fromJson(json['RenewalSummary'])
            : null,
        keyUsages: json.containsKey('KeyUsages')
            ? (json['KeyUsages'] as List)
                .map((e) => KeyUsage.fromJson(e))
                .toList()
            : null,
        extendedKeyUsages: json.containsKey('ExtendedKeyUsages')
            ? (json['ExtendedKeyUsages'] as List)
                .map((e) => ExtendedKeyUsage.fromJson(e))
                .toList()
            : null,
        certificateAuthorityArn: json.containsKey('CertificateAuthorityArn')
            ? json['CertificateAuthorityArn'] as String
            : null,
        renewalEligibility: json.containsKey('RenewalEligibility')
            ? json['RenewalEligibility'] as String
            : null,
        options: json.containsKey('Options')
            ? CertificateOptions.fromJson(json['Options'])
            : null,
      );
}

/// Structure that contains options for your certificate. Currently, you can use
/// this only to specify whether to opt in to or out of certificate transparency
/// logging. Some browsers require that public certificates issued for your
/// domain be recorded in a log. Certificates that are not logged typically
/// generate a browser error. Transparency makes it possible for you to detect
/// SSL/TLS certificates that have been mistakenly or maliciously issued for
/// your domain. For general information, see
/// [Certificate Transparency Logging](https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency).
class CertificateOptions {
  /// You can opt out of certificate transparency logging by specifying the
  /// `DISABLED` option. Opt in by specifying `ENABLED`.
  final String certificateTransparencyLoggingPreference;

  CertificateOptions({
    this.certificateTransparencyLoggingPreference,
  });
  static CertificateOptions fromJson(Map<String, dynamic> json) =>
      CertificateOptions(
        certificateTransparencyLoggingPreference:
            json.containsKey('CertificateTransparencyLoggingPreference')
                ? json['CertificateTransparencyLoggingPreference'] as String
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// This structure is returned in the response object of ListCertificates
/// action.
class CertificateSummary {
  /// Amazon Resource Name (ARN) of the certificate. This is of the form:
  ///
  ///
  /// `arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  ///
  /// For more information about ARNs, see
  /// [Amazon Resource Names (ARNs) and AWS Service Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).
  final String certificateArn;

  /// Fully qualified domain name (FQDN), such as www.example.com or
  /// example.com, for the certificate.
  final String domainName;

  CertificateSummary({
    this.certificateArn,
    this.domainName,
  });
  static CertificateSummary fromJson(Map<String, dynamic> json) =>
      CertificateSummary(
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
        domainName: json.containsKey('DomainName')
            ? json['DomainName'] as String
            : null,
      );
}

class DescribeCertificateResponse {
  /// Metadata about an ACM certificate.
  final CertificateDetail certificate;

  DescribeCertificateResponse({
    this.certificate,
  });
  static DescribeCertificateResponse fromJson(Map<String, dynamic> json) =>
      DescribeCertificateResponse(
        certificate: json.containsKey('Certificate')
            ? CertificateDetail.fromJson(json['Certificate'])
            : null,
      );
}

/// Contains information about the validation of each domain name in the
/// certificate.
class DomainValidation {
  /// A fully qualified domain name (FQDN) in the certificate. For example,
  /// `www.example.com` or `example.com`.
  final String domainName;

  /// A list of email addresses that ACM used to send domain validation emails.
  final List<String> validationEmails;

  /// The domain name that ACM used to send domain validation emails.
  final String validationDomain;

  /// The validation status of the domain name. This can be one of the following
  /// values:
  ///
  /// *    `PENDING_VALIDATION`
  ///
  /// *    `SUCCESS`
  ///
  ///  ``*    `FAILED` ``
  final String validationStatus;

  /// Contains the CNAME record that you add to your DNS database for domain
  /// validation. For more information, see
  /// [Use DNS to Validate Domain Ownership](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html).
  final ResourceRecord resourceRecord;

  /// Specifies the domain validation method.
  final String validationMethod;

  DomainValidation({
    @required this.domainName,
    this.validationEmails,
    this.validationDomain,
    this.validationStatus,
    this.resourceRecord,
    this.validationMethod,
  });
  static DomainValidation fromJson(Map<String, dynamic> json) =>
      DomainValidation(
        domainName: json['DomainName'] as String,
        validationEmails: json.containsKey('ValidationEmails')
            ? (json['ValidationEmails'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        validationDomain: json.containsKey('ValidationDomain')
            ? json['ValidationDomain'] as String
            : null,
        validationStatus: json.containsKey('ValidationStatus')
            ? json['ValidationStatus'] as String
            : null,
        resourceRecord: json.containsKey('ResourceRecord')
            ? ResourceRecord.fromJson(json['ResourceRecord'])
            : null,
        validationMethod: json.containsKey('ValidationMethod')
            ? json['ValidationMethod'] as String
            : null,
      );
}

/// Contains information about the domain names that you want ACM to use to send
/// you emails that enable you to validate domain ownership.
class DomainValidationOption {
  /// A fully qualified domain name (FQDN) in the certificate request.
  final String domainName;

  /// The domain name that you want ACM to use to send you validation emails.
  /// This domain name is the suffix of the email addresses that you want ACM to
  /// use. This must be the same as the `DomainName` value or a superdomain of
  /// the `DomainName` value. For example, if you request a certificate for
  /// `testing.example.com`, you can specify `example.com` for this value. In
  /// that case, ACM sends domain validation emails to the following five
  /// addresses:
  ///
  /// *   admin@example.com
  ///
  /// *   administrator@example.com
  ///
  /// *   hostmaster@example.com
  ///
  /// *   postmaster@example.com
  ///
  /// *   webmaster@example.com
  final String validationDomain;

  DomainValidationOption({
    @required this.domainName,
    @required this.validationDomain,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ExportCertificateResponse {
  /// The base64 PEM-encoded certificate.
  final String certificate;

  /// The base64 PEM-encoded certificate chain. This does not include the
  /// certificate that you are exporting.
  final String certificateChain;

  /// The encrypted private key associated with the public key in the
  /// certificate. The key is output in PKCS #8 format and is base64
  /// PEM-encoded.
  final String privateKey;

  ExportCertificateResponse({
    this.certificate,
    this.certificateChain,
    this.privateKey,
  });
  static ExportCertificateResponse fromJson(Map<String, dynamic> json) =>
      ExportCertificateResponse(
        certificate: json.containsKey('Certificate')
            ? json['Certificate'] as String
            : null,
        certificateChain: json.containsKey('CertificateChain')
            ? json['CertificateChain'] as String
            : null,
        privateKey: json.containsKey('PrivateKey')
            ? json['PrivateKey'] as String
            : null,
      );
}

/// The Extended Key Usage X.509 v3 extension defines one or more purposes for
/// which the public key can be used. This is in addition to or in place of the
/// basic purposes specified by the Key Usage extension.
class ExtendedKeyUsage {
  /// The name of an Extended Key Usage value.
  final String name;

  /// An object identifier (OID) for the extension value. OIDs are strings of
  /// numbers separated by periods. The following OIDs are defined in RFC 3280
  /// and RFC 5280.
  ///
  /// *    `1.3.6.1.5.5.7.3.1 (TLS_WEB_SERVER_AUTHENTICATION)`
  ///
  /// *    `1.3.6.1.5.5.7.3.2 (TLS_WEB_CLIENT_AUTHENTICATION)`
  ///
  /// *    `1.3.6.1.5.5.7.3.3 (CODE_SIGNING)`
  ///
  /// *    `1.3.6.1.5.5.7.3.4 (EMAIL_PROTECTION)`
  ///
  /// *    `1.3.6.1.5.5.7.3.8 (TIME_STAMPING)`
  ///
  /// *    `1.3.6.1.5.5.7.3.9 (OCSP_SIGNING)`
  ///
  /// *    `1.3.6.1.5.5.7.3.5 (IPSEC_END_SYSTEM)`
  ///
  /// *    `1.3.6.1.5.5.7.3.6 (IPSEC_TUNNEL)`
  ///
  /// *    `1.3.6.1.5.5.7.3.7 (IPSEC_USER)`
  final String oid;

  ExtendedKeyUsage({
    this.name,
    this.oid,
  });
  static ExtendedKeyUsage fromJson(Map<String, dynamic> json) =>
      ExtendedKeyUsage(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        oid: json.containsKey('OID') ? json['OID'] as String : null,
      );
}

/// This structure can be used in the ListCertificates action to filter the
/// output of the certificate list.
class Filters {
  /// Specify one or more ExtendedKeyUsage extension values.
  final List<String> extendedKeyUsage;

  /// Specify one or more KeyUsage extension values.
  final List<String> keyUsage;

  /// Specify one or more algorithms that can be used to generate key pairs.
  final List<String> keyTypes;

  Filters({
    this.extendedKeyUsage,
    this.keyUsage,
    this.keyTypes,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetCertificateResponse {
  /// String that contains the ACM certificate represented by the ARN specified
  /// at input.
  final String certificate;

  /// The certificate chain that contains the root certificate issued by the
  /// certificate authority (CA).
  final String certificateChain;

  GetCertificateResponse({
    this.certificate,
    this.certificateChain,
  });
  static GetCertificateResponse fromJson(Map<String, dynamic> json) =>
      GetCertificateResponse(
        certificate: json.containsKey('Certificate')
            ? json['Certificate'] as String
            : null,
        certificateChain: json.containsKey('CertificateChain')
            ? json['CertificateChain'] as String
            : null,
      );
}

class ImportCertificateResponse {
  /// The
  /// [Amazon Resource Name (ARN)](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)
  /// of the imported certificate.
  final String certificateArn;

  ImportCertificateResponse({
    this.certificateArn,
  });
  static ImportCertificateResponse fromJson(Map<String, dynamic> json) =>
      ImportCertificateResponse(
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
      );
}

/// The Key Usage X.509 v3 extension defines the purpose of the public key
/// contained in the certificate.
class KeyUsage {
  /// A string value that contains a Key Usage extension name.
  final String name;

  KeyUsage({
    this.name,
  });
  static KeyUsage fromJson(Map<String, dynamic> json) => KeyUsage(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

class ListCertificatesResponse {
  /// When the list is truncated, this value is present and contains the value
  /// to use for the `NextToken` parameter in a subsequent pagination request.
  final String nextToken;

  /// A list of ACM certificates.
  final List<CertificateSummary> certificateSummaryList;

  ListCertificatesResponse({
    this.nextToken,
    this.certificateSummaryList,
  });
  static ListCertificatesResponse fromJson(Map<String, dynamic> json) =>
      ListCertificatesResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        certificateSummaryList: json.containsKey('CertificateSummaryList')
            ? (json['CertificateSummaryList'] as List)
                .map((e) => CertificateSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListTagsForCertificateResponse {
  /// The key-value pairs that define the applied tags.
  final List<Tag> tags;

  ListTagsForCertificateResponse({
    this.tags,
  });
  static ListTagsForCertificateResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForCertificateResponse(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

/// Contains information about the status of ACM's
/// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html)
/// for the certificate. This structure exists only when the certificate type is
/// `AMAZON_ISSUED`.
class RenewalSummary {
  /// The status of ACM's
  /// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html)
  /// of the certificate.
  final String renewalStatus;

  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to ACM's
  /// [managed renewal](https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html).
  /// This is different from the initial validation that occurs as a result of
  /// the RequestCertificate request. This field exists only when the
  /// certificate type is `AMAZON_ISSUED`.
  final List<DomainValidation> domainValidationOptions;

  /// The reason that a renewal request was unsuccessful.
  final String renewalStatusReason;

  /// The time at which the renewal summary was last updated.
  final DateTime updatedAt;

  RenewalSummary({
    @required this.renewalStatus,
    @required this.domainValidationOptions,
    this.renewalStatusReason,
    @required this.updatedAt,
  });
  static RenewalSummary fromJson(Map<String, dynamic> json) => RenewalSummary(
        renewalStatus: json['RenewalStatus'] as String,
        domainValidationOptions: (json['DomainValidationOptions'] as List)
            .map((e) => DomainValidation.fromJson(e))
            .toList(),
        renewalStatusReason: json.containsKey('RenewalStatusReason')
            ? json['RenewalStatusReason'] as String
            : null,
        updatedAt: DateTime.parse(json['UpdatedAt']),
      );
}

class RequestCertificateResponse {
  /// String that contains the ARN of the issued certificate. This must be of
  /// the form:
  ///
  ///
  /// `arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012`
  final String certificateArn;

  RequestCertificateResponse({
    this.certificateArn,
  });
  static RequestCertificateResponse fromJson(Map<String, dynamic> json) =>
      RequestCertificateResponse(
        certificateArn: json.containsKey('CertificateArn')
            ? json['CertificateArn'] as String
            : null,
      );
}

/// Contains a DNS record value that you can use to can use to validate
/// ownership or control of a domain. This is used by the DescribeCertificate
/// action.
class ResourceRecord {
  /// The name of the DNS record to create in your domain. This is supplied by
  /// ACM.
  final String name;

  /// The type of DNS record. Currently this can be `CNAME`.
  final String type;

  /// The value of the CNAME record to add to your DNS database. This is
  /// supplied by ACM.
  final String value;

  ResourceRecord({
    @required this.name,
    @required this.type,
    @required this.value,
  });
  static ResourceRecord fromJson(Map<String, dynamic> json) => ResourceRecord(
        name: json['Name'] as String,
        type: json['Type'] as String,
        value: json['Value'] as String,
      );
}

/// A key-value pair that identifies or specifies metadata about an ACM
/// resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json['Key'] as String,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
