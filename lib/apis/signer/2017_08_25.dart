import 'package:meta/meta.dart';

/// You can use Code Signing for Amazon FreeRTOS (AWS Signer) to sign code that
/// you created for any of the IoT devices that Amazon Web Services supports.
/// AWS Signer is integrated with Amazon FreeRTOS, AWS Certificate Manager, and
/// AWS CloudTrail. Amazon FreeRTOS customers can use AWS Signer to sign code
/// images before making them available for microcontrollers. You can use ACM to
/// import third-party certificates to be used by AWS Signer. For general
/// information about using AWS Signer, see the [Code Signing for Amazon
/// FreeRTOS Developer
/// Guide](http://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html).
class SignerApi {
  /// Changes the state of an `ACTIVE` signing profile to `CANCELED`. A canceled
  /// profile is still viewable with the `ListSigningProfiles` operation, but it
  /// cannot perform new signing jobs, and is deleted two years after
  /// cancelation.
  Future<void> cancelSigningProfile(String profileName) async {}

  /// Returns information about a specific code signing job. You specify the job
  /// by using the `jobId` value that is returned by the StartSigningJob
  /// operation.
  Future<void> describeSigningJob(String jobId) async {}

  /// Returns information on a specific signing platform.
  Future<void> getSigningPlatform(String platformId) async {}

  /// Returns information on a specific signing profile.
  Future<void> getSigningProfile(String profileName) async {}

  /// Lists all your signing jobs. You can use the `maxResults` parameter to
  /// limit the number of signing jobs that are returned in the response. If
  /// additional jobs remain to be listed, AWS Signer returns a `nextToken`
  /// value. Use this value in subsequent calls to `ListSigningJobs` to fetch
  /// the remaining values. You can continue calling `ListSigningJobs` with your
  /// `maxResults` parameter and with new values that AWS Signer returns in the
  /// `nextToken` parameter until all of your signing jobs have been returned.
  Future<void> listSigningJobs(
      {String status,
      String platformId,
      String requestedBy,
      int maxResults,
      String nextToken}) async {}

  /// Lists all signing platforms available in AWS Signer that match the request
  /// parameters. If additional jobs remain to be listed, AWS Signer returns a
  /// `nextToken` value. Use this value in subsequent calls to `ListSigningJobs`
  /// to fetch the remaining values. You can continue calling `ListSigningJobs`
  /// with your `maxResults` parameter and with new values that AWS Signer
  /// returns in the `nextToken` parameter until all of your signing jobs have
  /// been returned.
  Future<void> listSigningPlatforms(
      {String category,
      String partner,
      String target,
      int maxResults,
      String nextToken}) async {}

  /// Lists all available signing profiles in your AWS account. Returns only
  /// profiles with an `ACTIVE` status unless the `includeCanceled` request
  /// field is set to `true`. If additional jobs remain to be listed, AWS Signer
  /// returns a `nextToken` value. Use this value in subsequent calls to
  /// `ListSigningJobs` to fetch the remaining values. You can continue calling
  /// `ListSigningJobs` with your `maxResults` parameter and with new values
  /// that AWS Signer returns in the `nextToken` parameter until all of your
  /// signing jobs have been returned.
  Future<void> listSigningProfiles(
      {bool includeCanceled, int maxResults, String nextToken}) async {}

  /// Creates a signing profile. A signing profile is an AWS Signer template
  /// that can be used to carry out a pre-defined signing job. For more
  /// information, see
  /// [http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html](http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html)
  Future<void> putSigningProfile(
      {@required String profileName,
      @required SigningMaterial signingMaterial,
      @required String platformId,
      SigningPlatformOverrides overrides,
      Map<String, String> signingParameters}) async {}

  /// Initiates a signing job to be performed on the code provided. Signing jobs
  /// are viewable by the `ListSigningJobs` operation for two years after they
  /// are performed. Note the following requirements:
  ///
  /// *    You must create an Amazon S3 source bucket. For more information, see
  /// [Create a
  /// Bucket](http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html)
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
  Future<void> startSigningJob(
      {@required Source source,
      @required Destination destination,
      String profileName,
      @required String clientRequestToken}) async {}
}

class DescribeSigningJobResponse {}

class Destination {}

class EncryptionAlgorithmOptions {}

class GetSigningPlatformResponse {}

class GetSigningProfileResponse {}

class HashAlgorithmOptions {}

class ListSigningJobsResponse {}

class ListSigningPlatformsResponse {}

class ListSigningProfilesResponse {}

class PutSigningProfileResponse {}

class S3Destination {}

class S3SignedObject {}

class S3Source {}

class SignedObject {}

class SigningConfiguration {}

class SigningConfigurationOverrides {}

class SigningImageFormat {}

class SigningJob {}

class SigningMaterial {}

class SigningPlatform {}

class SigningPlatformOverrides {}

class SigningProfile {}

class Source {}

class StartSigningJobResponse {}
