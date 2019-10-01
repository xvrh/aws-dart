import 'package:meta/meta.dart';

/// You can use Code Signing for Amazon FreeRTOS (AWS Signer) to sign code that
/// you created for any of the IoT devices that Amazon Web Services supports.
/// AWS Signer is integrated with Amazon FreeRTOS, AWS Certificate Manager, and
/// AWS CloudTrail. Amazon FreeRTOS customers can use AWS Signer to sign code
/// images before making them available for microcontrollers. You can use ACM to
/// import third-party certificates to be used by AWS Signer. For general
/// information about using AWS Signer, see the
/// [Code Signing for Amazon FreeRTOS Developer Guide](http://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html).
class SignerApi {
  final _client;
  SignerApi(client)
      : _client = client.configured('signer', serializer: 'rest-json');

  /// Changes the state of an `ACTIVE` signing profile to `CANCELED`. A canceled
  /// profile is still viewable with the `ListSigningProfiles` operation, but it
  /// cannot perform new signing jobs, and is deleted two years after
  /// cancelation.
  ///
  /// [profileName]: The name of the signing profile to be canceled.
  Future<void> cancelSigningProfile(String profileName) async {
    await _client.send('CancelSigningProfile', {
      'profileName': profileName,
    });
  }

  /// Returns information about a specific code signing job. You specify the job
  /// by using the `jobId` value that is returned by the StartSigningJob
  /// operation.
  ///
  /// [jobId]: The ID of the signing job on input.
  Future<DescribeSigningJobResponse> describeSigningJob(String jobId) async {
    var response_ = await _client.send('DescribeSigningJob', {
      'jobId': jobId,
    });
    return DescribeSigningJobResponse.fromJson(response_);
  }

  /// Returns information on a specific signing platform.
  ///
  /// [platformId]: The ID of the target signing platform.
  Future<GetSigningPlatformResponse> getSigningPlatform(
      String platformId) async {
    var response_ = await _client.send('GetSigningPlatform', {
      'platformId': platformId,
    });
    return GetSigningPlatformResponse.fromJson(response_);
  }

  /// Returns information on a specific signing profile.
  ///
  /// [profileName]: The name of the target signing profile.
  Future<GetSigningProfileResponse> getSigningProfile(
      String profileName) async {
    var response_ = await _client.send('GetSigningProfile', {
      'profileName': profileName,
    });
    return GetSigningProfileResponse.fromJson(response_);
  }

  /// Lists all your signing jobs. You can use the `maxResults` parameter to
  /// limit the number of signing jobs that are returned in the response. If
  /// additional jobs remain to be listed, AWS Signer returns a `nextToken`
  /// value. Use this value in subsequent calls to `ListSigningJobs` to fetch
  /// the remaining values. You can continue calling `ListSigningJobs` with your
  /// `maxResults` parameter and with new values that AWS Signer returns in the
  /// `nextToken` parameter until all of your signing jobs have been returned.
  ///
  /// [status]: A status value with which to filter your results.
  ///
  /// [platformId]: The ID of microcontroller platform that you specified for
  /// the distribution of your code image.
  ///
  /// [requestedBy]: The IAM principal that requested the signing job.
  ///
  /// [maxResults]: Specifies the maximum number of items to return in the
  /// response. Use this parameter when paginating results. If additional items
  /// exist beyond the number you specify, the `nextToken` element is set in the
  /// response. Use the `nextToken` value in a subsequent request to retrieve
  /// additional items.
  ///
  /// [nextToken]: String for specifying the next set of paginated results to
  /// return. After you receive a response with truncated results, use this
  /// parameter in a subsequent request. Set it to the value of `nextToken` from
  /// the response that you just received.
  Future<ListSigningJobsResponse> listSigningJobs(
      {String status,
      String platformId,
      String requestedBy,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListSigningJobs', {
      if (status != null) 'status': status,
      if (platformId != null) 'platformId': platformId,
      if (requestedBy != null) 'requestedBy': requestedBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListSigningJobsResponse.fromJson(response_);
  }

  /// Lists all signing platforms available in AWS Signer that match the request
  /// parameters. If additional jobs remain to be listed, AWS Signer returns a
  /// `nextToken` value. Use this value in subsequent calls to `ListSigningJobs`
  /// to fetch the remaining values. You can continue calling `ListSigningJobs`
  /// with your `maxResults` parameter and with new values that AWS Signer
  /// returns in the `nextToken` parameter until all of your signing jobs have
  /// been returned.
  ///
  /// [category]: The category type of a signing platform.
  ///
  /// [partner]: Any partner entities connected to a signing platform.
  ///
  /// [target]: The validation template that is used by the target signing
  /// platform.
  ///
  /// [maxResults]: The maximum number of results to be returned by this
  /// operation.
  ///
  /// [nextToken]: Value for specifying the next set of paginated results to
  /// return. After you receive a response with truncated results, use this
  /// parameter in a subsequent request. Set it to the value of `nextToken` from
  /// the response that you just received.
  Future<ListSigningPlatformsResponse> listSigningPlatforms(
      {String category,
      String partner,
      String target,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('ListSigningPlatforms', {
      if (category != null) 'category': category,
      if (partner != null) 'partner': partner,
      if (target != null) 'target': target,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListSigningPlatformsResponse.fromJson(response_);
  }

  /// Lists all available signing profiles in your AWS account. Returns only
  /// profiles with an `ACTIVE` status unless the `includeCanceled` request
  /// field is set to `true`. If additional jobs remain to be listed, AWS Signer
  /// returns a `nextToken` value. Use this value in subsequent calls to
  /// `ListSigningJobs` to fetch the remaining values. You can continue calling
  /// `ListSigningJobs` with your `maxResults` parameter and with new values
  /// that AWS Signer returns in the `nextToken` parameter until all of your
  /// signing jobs have been returned.
  ///
  /// [includeCanceled]: Designates whether to include profiles with the status
  /// of `CANCELED`.
  ///
  /// [maxResults]: The maximum number of profiles to be returned.
  ///
  /// [nextToken]: Value for specifying the next set of paginated results to
  /// return. After you receive a response with truncated results, use this
  /// parameter in a subsequent request. Set it to the value of `nextToken` from
  /// the response that you just received.
  Future<ListSigningProfilesResponse> listSigningProfiles(
      {bool includeCanceled, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListSigningProfiles', {
      if (includeCanceled != null) 'includeCanceled': includeCanceled,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    });
    return ListSigningProfilesResponse.fromJson(response_);
  }

  /// Creates a signing profile. A signing profile is an AWS Signer template
  /// that can be used to carry out a pre-defined signing job. For more
  /// information, see
  /// [http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html](http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html)
  ///
  /// [profileName]: The name of the signing profile to be created.
  ///
  /// [signingMaterial]: The AWS Certificate Manager certificate that will be
  /// used to sign code with the new signing profile.
  ///
  /// [platformId]: The ID of the signing profile to be created.
  ///
  /// [overrides]: A subfield of `platform`. This specifies any different
  /// configuration options that you want to apply to the chosen platform (such
  /// as a different `hash-algorithm` or `signing-algorithm`).
  ///
  /// [signingParameters]: Map of key-value pairs for signing. These can include
  /// any information that you want to use during signing.
  Future<PutSigningProfileResponse> putSigningProfile(
      {@required String profileName,
      @required SigningMaterial signingMaterial,
      @required String platformId,
      SigningPlatformOverrides overrides,
      Map<String, String> signingParameters}) async {
    var response_ = await _client.send('PutSigningProfile', {
      'profileName': profileName,
      'signingMaterial': signingMaterial,
      'platformId': platformId,
      if (overrides != null) 'overrides': overrides,
      if (signingParameters != null) 'signingParameters': signingParameters,
    });
    return PutSigningProfileResponse.fromJson(response_);
  }

  /// Initiates a signing job to be performed on the code provided. Signing jobs
  /// are viewable by the `ListSigningJobs` operation for two years after they
  /// are performed. Note the following requirements:
  ///
  /// *    You must create an Amazon S3 source bucket. For more information, see
  /// [Create a Bucket](http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html)
  /// in the _Amazon S3 Getting Started Guide_.
  ///
  /// *   Your S3 source bucket must be version enabled.
  ///
  /// *   You must create an S3 destination bucket. AWS Signer uses your S3
  /// destination bucket to write your signed code.
  ///
  /// *   You specify the name of the source and destination buckets when
  /// calling the `StartSigningJob` operation.
  ///
  /// *   You must also specify a request token that identifies your request to
  /// AWS Signer.
  ///
  ///
  /// You can call the DescribeSigningJob and the ListSigningJobs actions after
  /// you call `StartSigningJob`.
  ///
  /// For a Java example that shows how to use this action, see
  /// [http://docs.aws.amazon.com/acm/latest/userguide/](http://docs.aws.amazon.com/acm/latest/userguide/)
  ///
  /// [source]: The S3 bucket that contains the object to sign or a BLOB that
  /// contains your raw code.
  ///
  /// [destination]: The S3 bucket in which to save your signed object. The
  /// destination contains the name of your bucket and an optional prefix.
  ///
  /// [profileName]: The name of the signing profile.
  ///
  /// [clientRequestToken]: String that identifies the signing request. All
  /// calls after the first that use this token return the same response as the
  /// first call.
  Future<StartSigningJobResponse> startSigningJob(
      {@required Source source,
      @required Destination destination,
      String profileName,
      @required String clientRequestToken}) async {
    var response_ = await _client.send('StartSigningJob', {
      'source': source,
      'destination': destination,
      if (profileName != null) 'profileName': profileName,
      'clientRequestToken': clientRequestToken,
    });
    return StartSigningJobResponse.fromJson(response_);
  }
}

class DescribeSigningJobResponse {
  /// The ID of the signing job on output.
  final String jobId;

  /// The object that contains the name of your S3 bucket or your raw code.
  final Source source;

  /// Amazon Resource Name (ARN) of your code signing certificate.
  final SigningMaterial signingMaterial;

  /// The microcontroller platform to which your signed code image will be
  /// distributed.
  final String platformId;

  /// The name of the profile that initiated the signing operation.
  final String profileName;

  /// A list of any overrides that were applied to the signing operation.
  final SigningPlatformOverrides overrides;

  /// Map of user-assigned key-value pairs used during signing. These values
  /// contain any information that you specified for use in your signing job.
  final Map<String, String> signingParameters;

  /// Date and time that the signing job was created.
  final DateTime createdAt;

  /// Date and time that the signing job was completed.
  final DateTime completedAt;

  /// The IAM principal that requested the signing job.
  final String requestedBy;

  /// Status of the signing job.
  final String status;

  /// String value that contains the status reason.
  final String statusReason;

  /// Name of the S3 bucket where the signed code image is saved by AWS Signer.
  final SignedObject signedObject;

  DescribeSigningJobResponse({
    this.jobId,
    this.source,
    this.signingMaterial,
    this.platformId,
    this.profileName,
    this.overrides,
    this.signingParameters,
    this.createdAt,
    this.completedAt,
    this.requestedBy,
    this.status,
    this.statusReason,
    this.signedObject,
  });
  static DescribeSigningJobResponse fromJson(Map<String, dynamic> json) =>
      DescribeSigningJobResponse(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        source:
            json.containsKey('source') ? Source.fromJson(json['source']) : null,
        signingMaterial: json.containsKey('signingMaterial')
            ? SigningMaterial.fromJson(json['signingMaterial'])
            : null,
        platformId: json.containsKey('platformId')
            ? json['platformId'] as String
            : null,
        profileName: json.containsKey('profileName')
            ? json['profileName'] as String
            : null,
        overrides: json.containsKey('overrides')
            ? SigningPlatformOverrides.fromJson(json['overrides'])
            : null,
        signingParameters: json.containsKey('signingParameters')
            ? (json['signingParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        completedAt: json.containsKey('completedAt')
            ? DateTime.parse(json['completedAt'])
            : null,
        requestedBy: json.containsKey('requestedBy')
            ? json['requestedBy'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        statusReason: json.containsKey('statusReason')
            ? json['statusReason'] as String
            : null,
        signedObject: json.containsKey('signedObject')
            ? SignedObject.fromJson(json['signedObject'])
            : null,
      );
}

/// Points to an `S3Destination` object that contains information about your S3
/// bucket.
class Destination {
  /// The `S3Destination` object.
  final S3Destination s3;

  Destination({
    this.s3,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The encryption algorithm options that are available to an AWS Signer job.
class EncryptionAlgorithmOptions {
  /// The set of accepted encryption algorithms that are allowed in an AWS
  /// Signer job.
  final List<String> allowedValues;

  /// The default encryption algorithm that is used by an AWS Signer job.
  final String defaultValue;

  EncryptionAlgorithmOptions({
    @required this.allowedValues,
    @required this.defaultValue,
  });
  static EncryptionAlgorithmOptions fromJson(Map<String, dynamic> json) =>
      EncryptionAlgorithmOptions(
        allowedValues:
            (json['allowedValues'] as List).map((e) => e as String).toList(),
        defaultValue: json['defaultValue'] as String,
      );
}

class GetSigningPlatformResponse {
  /// The ID of the target signing platform.
  final String platformId;

  /// The display name of the target signing platform.
  final String displayName;

  /// A list of partner entities that use the target signing platform.
  final String partner;

  /// The validation template that is used by the target signing platform.
  final String target;

  /// The category type of the target signing platform.
  final String category;

  /// A list of configurations applied to the target platform at signing.
  final SigningConfiguration signingConfiguration;

  /// The format of the target platform's signing image.
  final SigningImageFormat signingImageFormat;

  /// The maximum size (in MB) of the payload that can be signed by the target
  /// platform.
  final int maxSizeInMB;

  GetSigningPlatformResponse({
    this.platformId,
    this.displayName,
    this.partner,
    this.target,
    this.category,
    this.signingConfiguration,
    this.signingImageFormat,
    this.maxSizeInMB,
  });
  static GetSigningPlatformResponse fromJson(Map<String, dynamic> json) =>
      GetSigningPlatformResponse(
        platformId: json.containsKey('platformId')
            ? json['platformId'] as String
            : null,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        partner: json.containsKey('partner') ? json['partner'] as String : null,
        target: json.containsKey('target') ? json['target'] as String : null,
        category:
            json.containsKey('category') ? json['category'] as String : null,
        signingConfiguration: json.containsKey('signingConfiguration')
            ? SigningConfiguration.fromJson(json['signingConfiguration'])
            : null,
        signingImageFormat: json.containsKey('signingImageFormat')
            ? SigningImageFormat.fromJson(json['signingImageFormat'])
            : null,
        maxSizeInMB:
            json.containsKey('maxSizeInMB') ? json['maxSizeInMB'] as int : null,
      );
}

class GetSigningProfileResponse {
  /// The name of the target signing profile.
  final String profileName;

  /// The ARN of the certificate that the target profile uses for signing
  /// operations.
  final SigningMaterial signingMaterial;

  /// The ID of the platform that is used by the target signing profile.
  final String platformId;

  /// A list of overrides applied by the target signing profile for signing
  /// operations.
  final SigningPlatformOverrides overrides;

  /// A map of key-value pairs for signing operations that is attached to the
  /// target signing profile.
  final Map<String, String> signingParameters;

  /// The status of the target signing profile.
  final String status;

  GetSigningProfileResponse({
    this.profileName,
    this.signingMaterial,
    this.platformId,
    this.overrides,
    this.signingParameters,
    this.status,
  });
  static GetSigningProfileResponse fromJson(Map<String, dynamic> json) =>
      GetSigningProfileResponse(
        profileName: json.containsKey('profileName')
            ? json['profileName'] as String
            : null,
        signingMaterial: json.containsKey('signingMaterial')
            ? SigningMaterial.fromJson(json['signingMaterial'])
            : null,
        platformId: json.containsKey('platformId')
            ? json['platformId'] as String
            : null,
        overrides: json.containsKey('overrides')
            ? SigningPlatformOverrides.fromJson(json['overrides'])
            : null,
        signingParameters: json.containsKey('signingParameters')
            ? (json['signingParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// The hash algorithms that are available to an AWS Signer job.
class HashAlgorithmOptions {
  /// The set of accepted hash algorithms allowed in an AWS Signer job.
  final List<String> allowedValues;

  /// The default hash algorithm that is used in an AWS Signer job.
  final String defaultValue;

  HashAlgorithmOptions({
    @required this.allowedValues,
    @required this.defaultValue,
  });
  static HashAlgorithmOptions fromJson(Map<String, dynamic> json) =>
      HashAlgorithmOptions(
        allowedValues:
            (json['allowedValues'] as List).map((e) => e as String).toList(),
        defaultValue: json['defaultValue'] as String,
      );
}

class ListSigningJobsResponse {
  /// A list of your signing jobs.
  final List<SigningJob> jobs;

  /// String for specifying the next set of paginated results.
  final String nextToken;

  ListSigningJobsResponse({
    this.jobs,
    this.nextToken,
  });
  static ListSigningJobsResponse fromJson(Map<String, dynamic> json) =>
      ListSigningJobsResponse(
        jobs: json.containsKey('jobs')
            ? (json['jobs'] as List).map((e) => SigningJob.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListSigningPlatformsResponse {
  /// A list of all platforms that match the request parameters.
  final List<SigningPlatform> platforms;

  /// Value for specifying the next set of paginated results to return.
  final String nextToken;

  ListSigningPlatformsResponse({
    this.platforms,
    this.nextToken,
  });
  static ListSigningPlatformsResponse fromJson(Map<String, dynamic> json) =>
      ListSigningPlatformsResponse(
        platforms: json.containsKey('platforms')
            ? (json['platforms'] as List)
                .map((e) => SigningPlatform.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListSigningProfilesResponse {
  /// A list of profiles that are available in the AWS account. This includes
  /// profiles with the status of `CANCELED` if the `includeCanceled` parameter
  /// is set to `true`.
  final List<SigningProfile> profiles;

  /// Value for specifying the next set of paginated results to return.
  final String nextToken;

  ListSigningProfilesResponse({
    this.profiles,
    this.nextToken,
  });
  static ListSigningProfilesResponse fromJson(Map<String, dynamic> json) =>
      ListSigningProfilesResponse(
        profiles: json.containsKey('profiles')
            ? (json['profiles'] as List)
                .map((e) => SigningProfile.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class PutSigningProfileResponse {
  /// The Amazon Resource Name (ARN) of the signing profile created.
  final String arn;

  PutSigningProfileResponse({
    this.arn,
  });
  static PutSigningProfileResponse fromJson(Map<String, dynamic> json) =>
      PutSigningProfileResponse(
        arn: json.containsKey('arn') ? json['arn'] as String : null,
      );
}

/// The name and prefix of the S3 bucket where AWS Signer saves your signed
/// objects.
class S3Destination {
  /// Name of the S3 bucket.
  final String bucketName;

  /// An Amazon S3 prefix that you can use to limit responses to those that
  /// begin with the specified prefix.
  final String prefix;

  S3Destination({
    this.bucketName,
    this.prefix,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The S3 bucket name and key where AWS Signer saved your signed code image.
class S3SignedObject {
  /// Name of the S3 bucket.
  final String bucketName;

  /// Key name that uniquely identifies a signed code image in your bucket.
  final String key;

  S3SignedObject({
    this.bucketName,
    this.key,
  });
  static S3SignedObject fromJson(Map<String, dynamic> json) => S3SignedObject(
        bucketName: json.containsKey('bucketName')
            ? json['bucketName'] as String
            : null,
        key: json.containsKey('key') ? json['key'] as String : null,
      );
}

/// Information about the S3 bucket where you saved your unsigned code.
class S3Source {
  /// Name of the S3 bucket.
  final String bucketName;

  /// Key name of the bucket object that contains your unsigned code.
  final String key;

  /// Version of your source image in your version enabled S3 bucket.
  final String version;

  S3Source({
    @required this.bucketName,
    @required this.key,
    @required this.version,
  });
  static S3Source fromJson(Map<String, dynamic> json) => S3Source(
        bucketName: json['bucketName'] as String,
        key: json['key'] as String,
        version: json['version'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Points to an `S3SignedObject` object that contains information about your
/// signed code image.
class SignedObject {
  /// The `S3SignedObject`.
  final S3SignedObject s3;

  SignedObject({
    this.s3,
  });
  static SignedObject fromJson(Map<String, dynamic> json) => SignedObject(
        s3: json.containsKey('s3') ? S3SignedObject.fromJson(json['s3']) : null,
      );
}

/// The configuration of an AWS Signer operation.
class SigningConfiguration {
  /// The encryption algorithm options that are available for an AWS Signer job.
  final EncryptionAlgorithmOptions encryptionAlgorithmOptions;

  /// The hash algorithm options that are available for an AWS Signer job.
  final HashAlgorithmOptions hashAlgorithmOptions;

  SigningConfiguration({
    @required this.encryptionAlgorithmOptions,
    @required this.hashAlgorithmOptions,
  });
  static SigningConfiguration fromJson(Map<String, dynamic> json) =>
      SigningConfiguration(
        encryptionAlgorithmOptions: EncryptionAlgorithmOptions.fromJson(
            json['encryptionAlgorithmOptions']),
        hashAlgorithmOptions:
            HashAlgorithmOptions.fromJson(json['hashAlgorithmOptions']),
      );
}

/// A signing configuration that overrides the default encryption or hash
/// algorithm of a signing job.
class SigningConfigurationOverrides {
  /// A specified override of the default encryption algorithm that is used in
  /// an AWS Signer job.
  final String encryptionAlgorithm;

  /// A specified override of the default hash algorithm that is used in an AWS
  /// Signer job.
  final String hashAlgorithm;

  SigningConfigurationOverrides({
    this.encryptionAlgorithm,
    this.hashAlgorithm,
  });
  static SigningConfigurationOverrides fromJson(Map<String, dynamic> json) =>
      SigningConfigurationOverrides(
        encryptionAlgorithm: json.containsKey('encryptionAlgorithm')
            ? json['encryptionAlgorithm'] as String
            : null,
        hashAlgorithm: json.containsKey('hashAlgorithm')
            ? json['hashAlgorithm'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The image format of an AWS Signer platform or profile.
class SigningImageFormat {
  /// The supported formats of an AWS Signer signing image.
  final List<String> supportedFormats;

  /// The default format of an AWS Signer signing image.
  final String defaultFormat;

  SigningImageFormat({
    @required this.supportedFormats,
    @required this.defaultFormat,
  });
  static SigningImageFormat fromJson(Map<String, dynamic> json) =>
      SigningImageFormat(
        supportedFormats:
            (json['supportedFormats'] as List).map((e) => e as String).toList(),
        defaultFormat: json['defaultFormat'] as String,
      );
}

/// Contains information about a signing job.
class SigningJob {
  /// The ID of the signing job.
  final String jobId;

  /// A `Source` that contains information about a signing job's code image
  /// source.
  final Source source;

  /// A `SignedObject` structure that contains information about a signing job's
  /// signed code image.
  final SignedObject signedObject;

  /// A `SigningMaterial` object that contains the Amazon Resource Name (ARN) of
  /// the certificate used for the signing job.
  final SigningMaterial signingMaterial;

  /// The date and time that the signing job was created.
  final DateTime createdAt;

  /// The status of the signing job.
  final String status;

  SigningJob({
    this.jobId,
    this.source,
    this.signedObject,
    this.signingMaterial,
    this.createdAt,
    this.status,
  });
  static SigningJob fromJson(Map<String, dynamic> json) => SigningJob(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
        source:
            json.containsKey('source') ? Source.fromJson(json['source']) : null,
        signedObject: json.containsKey('signedObject')
            ? SignedObject.fromJson(json['signedObject'])
            : null,
        signingMaterial: json.containsKey('signingMaterial')
            ? SigningMaterial.fromJson(json['signingMaterial'])
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// The ACM certificate that is used to sign your code.
class SigningMaterial {
  /// The Amazon Resource Name (ARN) of the certificates that is used to sign
  /// your code.
  final String certificateArn;

  SigningMaterial({
    @required this.certificateArn,
  });
  static SigningMaterial fromJson(Map<String, dynamic> json) => SigningMaterial(
        certificateArn: json['certificateArn'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about the signing configurations and parameters that is
/// used to perform an AWS Signer job.
class SigningPlatform {
  /// The ID of an AWS Signer platform.
  final String platformId;

  /// The display name of an AWS Signer platform.
  final String displayName;

  /// Any partner entities linked to an AWS Signer platform.
  final String partner;

  /// The types of targets that can be signed by an AWS Signer platform.
  final String target;

  /// The category of an AWS Signer platform.
  final String category;

  /// The configuration of an AWS Signer platform. This includes the designated
  /// hash algorithm and encryption algorithm of a signing platform.
  final SigningConfiguration signingConfiguration;

  /// The signing image format that is used by an AWS Signer platform.
  final SigningImageFormat signingImageFormat;

  /// The maximum size (in MB) of code that can be signed by a AWS Signer
  /// platform.
  final int maxSizeInMB;

  SigningPlatform({
    this.platformId,
    this.displayName,
    this.partner,
    this.target,
    this.category,
    this.signingConfiguration,
    this.signingImageFormat,
    this.maxSizeInMB,
  });
  static SigningPlatform fromJson(Map<String, dynamic> json) => SigningPlatform(
        platformId: json.containsKey('platformId')
            ? json['platformId'] as String
            : null,
        displayName: json.containsKey('displayName')
            ? json['displayName'] as String
            : null,
        partner: json.containsKey('partner') ? json['partner'] as String : null,
        target: json.containsKey('target') ? json['target'] as String : null,
        category:
            json.containsKey('category') ? json['category'] as String : null,
        signingConfiguration: json.containsKey('signingConfiguration')
            ? SigningConfiguration.fromJson(json['signingConfiguration'])
            : null,
        signingImageFormat: json.containsKey('signingImageFormat')
            ? SigningImageFormat.fromJson(json['signingImageFormat'])
            : null,
        maxSizeInMB:
            json.containsKey('maxSizeInMB') ? json['maxSizeInMB'] as int : null,
      );
}

/// Any overrides that are applied to the signing configuration of an AWS Signer
/// platform.
class SigningPlatformOverrides {
  final SigningConfigurationOverrides signingConfiguration;

  SigningPlatformOverrides({
    this.signingConfiguration,
  });
  static SigningPlatformOverrides fromJson(Map<String, dynamic> json) =>
      SigningPlatformOverrides(
        signingConfiguration: json.containsKey('signingConfiguration')
            ? SigningConfigurationOverrides.fromJson(
                json['signingConfiguration'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains information about the ACM certificates and AWS Signer configuration
/// parameters that can be used by a given AWS Signer user.
class SigningProfile {
  /// The name of the AWS Signer profile.
  final String profileName;

  /// The ACM certificate that is available for use by a signing profile.
  final SigningMaterial signingMaterial;

  /// The ID of a platform that is available for use by a signing profile.
  final String platformId;

  /// The parameters that are available for use by an AWS Signer user.
  final Map<String, String> signingParameters;

  /// The status of an AWS Signer profile.
  final String status;

  SigningProfile({
    this.profileName,
    this.signingMaterial,
    this.platformId,
    this.signingParameters,
    this.status,
  });
  static SigningProfile fromJson(Map<String, dynamic> json) => SigningProfile(
        profileName: json.containsKey('profileName')
            ? json['profileName'] as String
            : null,
        signingMaterial: json.containsKey('signingMaterial')
            ? SigningMaterial.fromJson(json['signingMaterial'])
            : null,
        platformId: json.containsKey('platformId')
            ? json['platformId'] as String
            : null,
        signingParameters: json.containsKey('signingParameters')
            ? (json['signingParameters'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// An `S3Source` object that contains information about the S3 bucket where you
/// saved your unsigned code.
class Source {
  /// The `S3Source` object.
  final S3Source s3;

  Source({
    this.s3,
  });
  static Source fromJson(Map<String, dynamic> json) => Source(
        s3: json.containsKey('s3') ? S3Source.fromJson(json['s3']) : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartSigningJobResponse {
  /// The ID of your signing job.
  final String jobId;

  StartSigningJobResponse({
    this.jobId,
  });
  static StartSigningJobResponse fromJson(Map<String, dynamic> json) =>
      StartSigningJobResponse(
        jobId: json.containsKey('jobId') ? json['jobId'] as String : null,
      );
}
