import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Elastic Container Registry
///
/// Amazon Elastic Container Registry (Amazon ECR) is a managed Docker registry
/// service. Customers can use the familiar Docker CLI to push, pull, and manage
/// images. Amazon ECR provides a secure, scalable, and reliable registry.
/// Amazon ECR supports private Docker repositories with resource-based
/// permissions using IAM so that specific users or Amazon EC2 instances can
/// access repositories and images. Developers can use the Docker CLI to author
/// and manage images.
class EcrApi {
  /// Check the availability of multiple image layers in a specified registry
  /// and repository.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> batchCheckLayerAvailability(
      {String registryId,
      @required String repositoryName,
      @required List<String> layerDigests}) async {}

  /// Deletes a list of specified images within a specified repository. Images
  /// are specified with either `imageTag` or `imageDigest`.
  ///
  /// You can remove a tag from an image by specifying the image's tag in your
  /// request. When you remove the last tag from an image, the image is deleted
  /// from your repository.
  ///
  /// You can completely delete an image (and all of its tags) by specifying the
  /// image's digest in your request.
  Future<void> batchDeleteImage(
      {String registryId,
      @required String repositoryName,
      @required List<ImageIdentifier> imageIds}) async {}

  /// Gets detailed information for specified images within a specified
  /// repository. Images are specified with either `imageTag` or `imageDigest`.
  Future<void> batchGetImage(
      {String registryId,
      @required String repositoryName,
      @required List<ImageIdentifier> imageIds,
      List<String> acceptedMediaTypes}) async {}

  /// Informs Amazon ECR that the image layer upload has completed for a
  /// specified registry, repository name, and upload ID. You can optionally
  /// provide a `sha256` digest of the image layer for data validation purposes.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> completeLayerUpload(
      {String registryId,
      @required String repositoryName,
      @required String uploadId,
      @required List<String> layerDigests}) async {}

  /// Creates an image repository.
  Future<void> createRepository(String repositoryName,
      {List<Tag> tags, String imageTagMutability}) async {}

  /// Deletes the specified lifecycle policy.
  Future<void> deleteLifecyclePolicy(String repositoryName,
      {String registryId}) async {}

  /// Deletes an existing image repository. If a repository contains images, you
  /// must use the `force` option to delete it.
  Future<void> deleteRepository(String repositoryName,
      {String registryId, bool force}) async {}

  /// Deletes the repository policy from a specified repository.
  Future<void> deleteRepositoryPolicy(String repositoryName,
      {String registryId}) async {}

  /// Returns metadata about the images in a repository, including image size,
  /// image tags, and creation date.
  ///
  ///
  ///
  /// Beginning with Docker version 1.9, the Docker client compresses image
  /// layers before pushing them to a V2 Docker registry. The output of the
  /// `docker images` command shows the uncompressed image size, so it may
  /// return a larger image size than the image sizes returned by
  /// DescribeImages.
  Future<void> describeImages(String repositoryName,
      {String registryId,
      List<ImageIdentifier> imageIds,
      String nextToken,
      int maxResults,
      DescribeImagesFilter filter}) async {}

  /// Describes image repositories in a registry.
  Future<void> describeRepositories(
      {String registryId,
      List<String> repositoryNames,
      String nextToken,
      int maxResults}) async {}

  /// Retrieves a token that is valid for a specified registry for 12 hours.
  /// This command allows you to use the `docker` CLI to push and pull images
  /// with Amazon ECR. If you do not specify a registry, the default registry is
  /// assumed.
  ///
  /// The `authorizationToken` returned for each registry specified is a base64
  /// encoded string that can be decoded and used in a `docker login` command to
  /// authenticate to a registry. The AWS CLI offers an `aws ecr get-login`
  /// command that simplifies the login process.
  Future<void> getAuthorizationToken({List<String> registryIds}) async {}

  /// Retrieves the pre-signed Amazon S3 download URL corresponding to an image
  /// layer. You can only get URLs for image layers that are referenced in an
  /// image.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> getDownloadUrlForLayer(
      {String registryId,
      @required String repositoryName,
      @required String layerDigest}) async {}

  /// Retrieves the specified lifecycle policy.
  Future<void> getLifecyclePolicy(String repositoryName,
      {String registryId}) async {}

  /// Retrieves the results of the specified lifecycle policy preview request.
  Future<void> getLifecyclePolicyPreview(String repositoryName,
      {String registryId,
      List<ImageIdentifier> imageIds,
      String nextToken,
      int maxResults,
      LifecyclePolicyPreviewFilter filter}) async {}

  /// Retrieves the repository policy for a specified repository.
  Future<void> getRepositoryPolicy(String repositoryName,
      {String registryId}) async {}

  /// Notify Amazon ECR that you intend to upload an image layer.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> initiateLayerUpload(String repositoryName,
      {String registryId}) async {}

  /// Lists all the image IDs for a given repository.
  ///
  /// You can filter images based on whether or not they are tagged by setting
  /// the `tagStatus` parameter to `TAGGED` or `UNTAGGED`. For example, you can
  /// filter your results to return only `UNTAGGED` images and then pipe that
  /// result to a BatchDeleteImage operation to delete them. Or, you can filter
  /// your results to return only `TAGGED` images to list all of the tags in
  /// your repository.
  Future<void> listImages(String repositoryName,
      {String registryId,
      String nextToken,
      int maxResults,
      ListImagesFilter filter}) async {}

  /// List the tags for an Amazon ECR resource.
  Future<void> listTagsForResource(String resourceArn) async {}

  /// Creates or updates the image manifest and tags associated with an image.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> putImage(
      {String registryId,
      @required String repositoryName,
      @required String imageManifest,
      String imageTag}) async {}

  /// Updates the image tag mutability settings for a repository.
  Future<void> putImageTagMutability(
      {String registryId,
      @required String repositoryName,
      @required String imageTagMutability}) async {}

  /// Creates or updates a lifecycle policy. For information about lifecycle
  /// policy syntax, see [Lifecycle Policy
  /// Template](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html).
  Future<void> putLifecyclePolicy(
      {String registryId,
      @required String repositoryName,
      @required String lifecyclePolicyText}) async {}

  /// Applies a repository policy on a specified repository to control access
  /// permissions. For more information, see [Amazon ECR Repository
  /// Policies](https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicies.html)
  /// in the _Amazon Elastic Container Registry User Guide_.
  Future<void> setRepositoryPolicy(
      {String registryId,
      @required String repositoryName,
      @required String policyText,
      bool force}) async {}

  /// Starts a preview of the specified lifecycle policy. This allows you to see
  /// the results before creating the lifecycle policy.
  Future<void> startLifecyclePolicyPreview(String repositoryName,
      {String registryId, String lifecyclePolicyText}) async {}

  /// Adds specified tags to a resource with the specified ARN. Existing tags on
  /// a resource are not changed if they are not specified in the request
  /// parameters.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Deletes specified tags from a resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Uploads an image layer part to Amazon ECR.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  Future<void> uploadLayerPart(
      {String registryId,
      @required String repositoryName,
      @required String uploadId,
      @required BigInt partFirstByte,
      @required BigInt partLastByte,
      @required Uint8List layerPartBlob}) async {}
}

class AuthorizationData {}

class BatchCheckLayerAvailabilityResponse {}

class BatchDeleteImageResponse {}

class BatchGetImageResponse {}

class CompleteLayerUploadResponse {}

class CreateRepositoryResponse {}

class DeleteLifecyclePolicyResponse {}

class DeleteRepositoryPolicyResponse {}

class DeleteRepositoryResponse {}

class DescribeImagesFilter {}

class DescribeImagesResponse {}

class DescribeRepositoriesResponse {}

class GetAuthorizationTokenResponse {}

class GetDownloadUrlForLayerResponse {}

class GetLifecyclePolicyPreviewResponse {}

class GetLifecyclePolicyResponse {}

class GetRepositoryPolicyResponse {}

class Image {}

class ImageDetail {}

class ImageFailure {}

class ImageIdentifier {}

class InitiateLayerUploadResponse {}

class Layer {}

class LayerFailure {}

class LifecyclePolicyPreviewFilter {}

class LifecyclePolicyPreviewResult {}

class LifecyclePolicyPreviewSummary {}

class LifecyclePolicyRuleAction {}

class ListImagesFilter {}

class ListImagesResponse {}

class ListTagsForResourceResponse {}

class PutImageResponse {}

class PutImageTagMutabilityResponse {}

class PutLifecyclePolicyResponse {}

class Repository {}

class SetRepositoryPolicyResponse {}

class StartLifecyclePolicyPreviewResponse {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UploadLayerPartResponse {}
