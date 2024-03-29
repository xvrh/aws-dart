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
  final _client;
  EcrApi(client) : _client = client.configured('ECR', serializer: 'json');

  /// Check the availability of multiple image layers in a specified registry
  /// and repository.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the image layers to check. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository that is associated with the
  /// image layers to check.
  ///
  /// [layerDigests]: The digests of the image layers to check.
  Future<BatchCheckLayerAvailabilityResponse> batchCheckLayerAvailability(
      {String registryId,
      @required String repositoryName,
      @required List<String> layerDigests}) async {
    var response_ = await _client.send('BatchCheckLayerAvailability', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'layerDigests': layerDigests,
    });
    return BatchCheckLayerAvailabilityResponse.fromJson(response_);
  }

  /// Deletes a list of specified images within a specified repository. Images
  /// are specified with either `imageTag` or `imageDigest`.
  ///
  /// You can remove a tag from an image by specifying the image's tag in your
  /// request. When you remove the last tag from an image, the image is deleted
  /// from your repository.
  ///
  /// You can completely delete an image (and all of its tags) by specifying the
  /// image's digest in your request.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the image to delete. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// [repositoryName]: The repository that contains the image to delete.
  ///
  /// [imageIds]: A list of image ID references that correspond to images to
  /// delete. The format of the `imageIds` reference is `imageTag=tag` or
  /// `imageDigest=digest`.
  Future<BatchDeleteImageResponse> batchDeleteImage(
      {String registryId,
      @required String repositoryName,
      @required List<ImageIdentifier> imageIds}) async {
    var response_ = await _client.send('BatchDeleteImage', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'imageIds': imageIds,
    });
    return BatchDeleteImageResponse.fromJson(response_);
  }

  /// Gets detailed information for specified images within a specified
  /// repository. Images are specified with either `imageTag` or `imageDigest`.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the images to describe. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// [repositoryName]: The repository that contains the images to describe.
  ///
  /// [imageIds]: A list of image ID references that correspond to images to
  /// describe. The format of the `imageIds` reference is `imageTag=tag` or
  /// `imageDigest=digest`.
  ///
  /// [acceptedMediaTypes]: The accepted media types for the request.
  ///
  /// Valid values: `application/vnd.docker.distribution.manifest.v1+json` |
  /// `application/vnd.docker.distribution.manifest.v2+json` |
  /// `application/vnd.oci.image.manifest.v1+json`
  Future<BatchGetImageResponse> batchGetImage(
      {String registryId,
      @required String repositoryName,
      @required List<ImageIdentifier> imageIds,
      List<String> acceptedMediaTypes}) async {
    var response_ = await _client.send('BatchGetImage', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'imageIds': imageIds,
      if (acceptedMediaTypes != null) 'acceptedMediaTypes': acceptedMediaTypes,
    });
    return BatchGetImageResponse.fromJson(response_);
  }

  /// Informs Amazon ECR that the image layer upload has completed for a
  /// specified registry, repository name, and upload ID. You can optionally
  /// provide a `sha256` digest of the image layer for data validation purposes.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry to which to
  /// upload layers. If you do not specify a registry, the default registry is
  /// assumed.
  ///
  /// [repositoryName]: The name of the repository to associate with the image
  /// layer.
  ///
  /// [uploadId]: The upload ID from a previous InitiateLayerUpload operation to
  /// associate with the image layer.
  ///
  /// [layerDigests]: The `sha256` digest of the image layer.
  Future<CompleteLayerUploadResponse> completeLayerUpload(
      {String registryId,
      @required String repositoryName,
      @required String uploadId,
      @required List<String> layerDigests}) async {
    var response_ = await _client.send('CompleteLayerUpload', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'uploadId': uploadId,
      'layerDigests': layerDigests,
    });
    return CompleteLayerUploadResponse.fromJson(response_);
  }

  /// Creates an image repository.
  ///
  /// [repositoryName]: The name to use for the repository. The repository name
  /// may be specified on its own (such as `nginx-web-app`) or it can be
  /// prepended with a namespace to group the repository into a category (such
  /// as `project-a/nginx-web-app`).
  ///
  /// [tags]: The metadata that you apply to the repository to help you
  /// categorize and organize them. Each tag consists of a key and an optional
  /// value, both of which you define. Tag keys can have a maximum character
  /// length of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  ///
  /// [imageTagMutability]: The tag mutability setting for the repository. If
  /// this parameter is omitted, the default setting of `MUTABLE` will be used
  /// which will allow image tags to be overwritten. If `IMMUTABLE` is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  Future<CreateRepositoryResponse> createRepository(String repositoryName,
      {List<Tag> tags, String imageTagMutability}) async {
    var response_ = await _client.send('CreateRepository', {
      'repositoryName': repositoryName,
      if (tags != null) 'tags': tags,
      if (imageTagMutability != null) 'imageTagMutability': imageTagMutability,
    });
    return CreateRepositoryResponse.fromJson(response_);
  }

  /// Deletes the specified lifecycle policy.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository.
  Future<DeleteLifecyclePolicyResponse> deleteLifecyclePolicy(
      String repositoryName,
      {String registryId}) async {
    var response_ = await _client.send('DeleteLifecyclePolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
    });
    return DeleteLifecyclePolicyResponse.fromJson(response_);
  }

  /// Deletes an existing image repository. If a repository contains images, you
  /// must use the `force` option to delete it.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository to delete. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to delete.
  ///
  /// [force]:  If a repository contains images, forces the deletion.
  Future<DeleteRepositoryResponse> deleteRepository(String repositoryName,
      {String registryId, bool force}) async {
    var response_ = await _client.send('DeleteRepository', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      if (force != null) 'force': force,
    });
    return DeleteRepositoryResponse.fromJson(response_);
  }

  /// Deletes the repository policy from a specified repository.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository policy to delete. If you do not specify a
  /// registry, the default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository that is associated with the
  /// repository policy to delete.
  Future<DeleteRepositoryPolicyResponse> deleteRepositoryPolicy(
      String repositoryName,
      {String registryId}) async {
    var response_ = await _client.send('DeleteRepositoryPolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
    });
    return DeleteRepositoryPolicyResponse.fromJson(response_);
  }

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
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository in which to describe images. If you do not specify
  /// a registry, the default registry is assumed.
  ///
  /// [repositoryName]: The repository that contains the images to describe.
  ///
  /// [imageIds]: The list of image IDs for the requested repository.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeImages` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value. This value is
  /// `null` when there are no more results to return. This option cannot be
  /// used when you specify images with `imageIds`.
  ///
  /// [maxResults]: The maximum number of repository results returned by
  /// `DescribeImages` in paginated output. When this parameter is used,
  /// `DescribeImages` only returns `maxResults` results in a single page along
  /// with a `nextToken` response element. The remaining results of the initial
  /// request can be seen by sending another `DescribeImages` request with the
  /// returned `nextToken` value. This value can be between 1 and 1000. If this
  /// parameter is not used, then `DescribeImages` returns up to 100 results and
  /// a `nextToken` value, if applicable. This option cannot be used when you
  /// specify images with `imageIds`.
  ///
  /// [filter]: The filter key and value with which to filter your
  /// `DescribeImages` results.
  Future<DescribeImagesResponse> describeImages(String repositoryName,
      {String registryId,
      List<ImageIdentifier> imageIds,
      String nextToken,
      int maxResults,
      DescribeImagesFilter filter}) async {
    var response_ = await _client.send('DescribeImages', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      if (imageIds != null) 'imageIds': imageIds,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (filter != null) 'filter': filter,
    });
    return DescribeImagesResponse.fromJson(response_);
  }

  /// Describes image repositories in a registry.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repositories to be described. If you do not specify a
  /// registry, the default registry is assumed.
  ///
  /// [repositoryNames]: A list of repositories to describe. If this parameter
  /// is omitted, then all repositories in a registry are described.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `DescribeRepositories` request where `maxResults` was used and the results
  /// exceeded the value of that parameter. Pagination continues from the end of
  /// the previous results that returned the `nextToken` value. This value is
  /// `null` when there are no more results to return. This option cannot be
  /// used when you specify repositories with `repositoryNames`.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of repository results returned by
  /// `DescribeRepositories` in paginated output. When this parameter is used,
  /// `DescribeRepositories` only returns `maxResults` results in a single page
  /// along with a `nextToken` response element. The remaining results of the
  /// initial request can be seen by sending another `DescribeRepositories`
  /// request with the returned `nextToken` value. This value can be between 1
  /// and 1000. If this parameter is not used, then `DescribeRepositories`
  /// returns up to 100 results and a `nextToken` value, if applicable. This
  /// option cannot be used when you specify repositories with
  /// `repositoryNames`.
  Future<DescribeRepositoriesResponse> describeRepositories(
      {String registryId,
      List<String> repositoryNames,
      String nextToken,
      int maxResults}) async {
    var response_ = await _client.send('DescribeRepositories', {
      if (registryId != null) 'registryId': registryId,
      if (repositoryNames != null) 'repositoryNames': repositoryNames,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
    });
    return DescribeRepositoriesResponse.fromJson(response_);
  }

  /// Retrieves a token that is valid for a specified registry for 12 hours.
  /// This command allows you to use the `docker` CLI to push and pull images
  /// with Amazon ECR. If you do not specify a registry, the default registry is
  /// assumed.
  ///
  /// The `authorizationToken` returned for each registry specified is a base64
  /// encoded string that can be decoded and used in a `docker login` command to
  /// authenticate to a registry. The AWS CLI offers an `aws ecr get-login`
  /// command that simplifies the login process.
  ///
  /// [registryIds]: A list of AWS account IDs that are associated with the
  /// registries for which to get authorization tokens. If you do not specify a
  /// registry, the default registry is assumed.
  Future<GetAuthorizationTokenResponse> getAuthorizationToken(
      {List<String> registryIds}) async {
    var response_ = await _client.send('GetAuthorizationToken', {
      if (registryIds != null) 'registryIds': registryIds,
    });
    return GetAuthorizationTokenResponse.fromJson(response_);
  }

  /// Retrieves the pre-signed Amazon S3 download URL corresponding to an image
  /// layer. You can only get URLs for image layers that are referenced in an
  /// image.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the image layer to download. If you do not specify a registry,
  /// the default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository that is associated with the
  /// image layer to download.
  ///
  /// [layerDigest]: The digest of the image layer to download.
  Future<GetDownloadUrlForLayerResponse> getDownloadUrlForLayer(
      {String registryId,
      @required String repositoryName,
      @required String layerDigest}) async {
    var response_ = await _client.send('GetDownloadUrlForLayer', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'layerDigest': layerDigest,
    });
    return GetDownloadUrlForLayerResponse.fromJson(response_);
  }

  /// Retrieves the specified lifecycle policy.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy(String repositoryName,
      {String registryId}) async {
    var response_ = await _client.send('GetLifecyclePolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
    });
    return GetLifecyclePolicyResponse.fromJson(response_);
  }

  /// Retrieves the results of the specified lifecycle policy preview request.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository.
  ///
  /// [imageIds]: The list of imageIDs to be included.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  ///  `GetLifecyclePolicyPreviewRequest` request where `maxResults` was used
  /// and the
  ///  results exceeded the value of that parameter. Pagination continues from
  /// the end of the
  ///  previous results that returned the `nextToken` value. This value is
  ///  `null` when there are no more results to return. This option cannot be
  /// used when you specify images with `imageIds`.
  ///
  /// [maxResults]: The maximum number of repository results returned by
  /// `GetLifecyclePolicyPreviewRequest` in
  ///  paginated output. When this parameter is used,
  /// `GetLifecyclePolicyPreviewRequest` only returns
  ///  `maxResults` results in a single page along with a `nextToken`
  ///  response element. The remaining results of the initial request can be
  /// seen by sending
  ///  another `GetLifecyclePolicyPreviewRequest` request with the returned
  /// `nextToken`
  ///  value. This value can be between 1 and 1000. If this
  ///  parameter is not used, then `GetLifecyclePolicyPreviewRequest` returns up
  /// to
  ///  100 results and a `nextToken` value, if
  ///  applicable. This option cannot be used when you specify images with
  /// `imageIds`.
  ///
  /// [filter]: An optional parameter that filters results based on image tag
  /// status and all tags, if tagged.
  Future<GetLifecyclePolicyPreviewResponse> getLifecyclePolicyPreview(
      String repositoryName,
      {String registryId,
      List<ImageIdentifier> imageIds,
      String nextToken,
      int maxResults,
      LifecyclePolicyPreviewFilter filter}) async {
    var response_ = await _client.send('GetLifecyclePolicyPreview', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      if (imageIds != null) 'imageIds': imageIds,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (filter != null) 'filter': filter,
    });
    return GetLifecyclePolicyPreviewResponse.fromJson(response_);
  }

  /// Retrieves the repository policy for a specified repository.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository with the policy to retrieve.
  Future<GetRepositoryPolicyResponse> getRepositoryPolicy(String repositoryName,
      {String registryId}) async {
    var response_ = await _client.send('GetRepositoryPolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
    });
    return GetRepositoryPolicyResponse.fromJson(response_);
  }

  /// Notify Amazon ECR that you intend to upload an image layer.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry to which you
  /// intend to upload layers. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to which you intend to upload
  /// layers.
  Future<InitiateLayerUploadResponse> initiateLayerUpload(String repositoryName,
      {String registryId}) async {
    var response_ = await _client.send('InitiateLayerUpload', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
    });
    return InitiateLayerUploadResponse.fromJson(response_);
  }

  /// Lists all the image IDs for a given repository.
  ///
  /// You can filter images based on whether or not they are tagged by setting
  /// the `tagStatus` parameter to `TAGGED` or `UNTAGGED`. For example, you can
  /// filter your results to return only `UNTAGGED` images and then pipe that
  /// result to a BatchDeleteImage operation to delete them. Or, you can filter
  /// your results to return only `TAGGED` images to list all of the tags in
  /// your repository.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository in which to list images. If you do not specify a
  /// registry, the default registry is assumed.
  ///
  /// [repositoryName]: The repository with image IDs to be listed.
  ///
  /// [nextToken]: The `nextToken` value returned from a previous paginated
  /// `ListImages` request where `maxResults` was used and the results exceeded
  /// the value of that parameter. Pagination continues from the end of the
  /// previous results that returned the `nextToken` value. This value is `null`
  /// when there are no more results to return.
  ///
  ///
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
  /// [maxResults]: The maximum number of image results returned by `ListImages`
  /// in paginated output. When this parameter is used, `ListImages` only
  /// returns `maxResults` results in a single page along with a `nextToken`
  /// response element. The remaining results of the initial request can be seen
  /// by sending another `ListImages` request with the returned `nextToken`
  /// value. This value can be between 1 and 1000. If this parameter is not
  /// used, then `ListImages` returns up to 100 results and a `nextToken` value,
  /// if applicable.
  ///
  /// [filter]: The filter key and value with which to filter your `ListImages`
  /// results.
  Future<ListImagesResponse> listImages(String repositoryName,
      {String registryId,
      String nextToken,
      int maxResults,
      ListImagesFilter filter}) async {
    var response_ = await _client.send('ListImages', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      if (nextToken != null) 'nextToken': nextToken,
      if (maxResults != null) 'maxResults': maxResults,
      if (filter != null) 'filter': filter,
    });
    return ListImagesResponse.fromJson(response_);
  }

  /// List the tags for an Amazon ECR resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) that identifies the resource
  /// for which to list the tags. Currently, the only supported resource is an
  /// Amazon ECR repository.
  Future<ListTagsForResourceResponse> listTagsForResource(
      String resourceArn) async {
    var response_ = await _client.send('ListTagsForResource', {
      'resourceArn': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Creates or updates the image manifest and tags associated with an image.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository in which to put the image. If you do not specify a
  /// registry, the default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository in which to put the image.
  ///
  /// [imageManifest]: The image manifest corresponding to the image to be
  /// uploaded.
  ///
  /// [imageTag]: The tag to associate with the image. This parameter is
  /// required for images that use the Docker Image Manifest V2 Schema 2 or OCI
  /// formats.
  Future<PutImageResponse> putImage(
      {String registryId,
      @required String repositoryName,
      @required String imageManifest,
      String imageTag}) async {
    var response_ = await _client.send('PutImage', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'imageManifest': imageManifest,
      if (imageTag != null) 'imageTag': imageTag,
    });
    return PutImageResponse.fromJson(response_);
  }

  /// Updates the image tag mutability settings for a repository.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository in which to update the image tag mutability
  /// settings. If you do not specify a registry, the default registry is
  /// assumed.
  ///
  /// [repositoryName]: The name of the repository in which to update the image
  /// tag mutability settings.
  ///
  /// [imageTagMutability]: The tag mutability setting for the repository. If
  /// `MUTABLE` is specified, image tags can be overwritten. If `IMMUTABLE` is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  Future<PutImageTagMutabilityResponse> putImageTagMutability(
      {String registryId,
      @required String repositoryName,
      @required String imageTagMutability}) async {
    var response_ = await _client.send('PutImageTagMutability', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'imageTagMutability': imageTagMutability,
    });
    return PutImageTagMutabilityResponse.fromJson(response_);
  }

  /// Creates or updates a lifecycle policy. For information about lifecycle
  /// policy syntax, see
  /// [Lifecycle Policy Template](https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html).
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do
  ///  not specify a registry, the default registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to receive the policy.
  ///
  /// [lifecyclePolicyText]: The JSON repository policy text to apply to the
  /// repository.
  Future<PutLifecyclePolicyResponse> putLifecyclePolicy(
      {String registryId,
      @required String repositoryName,
      @required String lifecyclePolicyText}) async {
    var response_ = await _client.send('PutLifecyclePolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'lifecyclePolicyText': lifecyclePolicyText,
    });
    return PutLifecyclePolicyResponse.fromJson(response_);
  }

  /// Applies a repository policy on a specified repository to control access
  /// permissions. For more information, see
  /// [Amazon ECR Repository Policies](https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicies.html)
  /// in the _Amazon Elastic Container Registry User Guide_.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to receive the policy.
  ///
  /// [policyText]: The JSON repository policy text to apply to the repository.
  /// For more information, see
  /// [Amazon ECR Repository Policy Examples](https://docs.aws.amazon.com/AmazonECR/latest/userguide/RepositoryPolicyExamples.html)
  /// in the _Amazon Elastic Container Registry User Guide_.
  ///
  /// [force]: If the policy you are attempting to set on a repository policy
  /// would prevent you from setting another policy in the future, you must
  /// force the SetRepositoryPolicy operation. This is intended to prevent
  /// accidental repository lock outs.
  Future<SetRepositoryPolicyResponse> setRepositoryPolicy(
      {String registryId,
      @required String repositoryName,
      @required String policyText,
      bool force}) async {
    var response_ = await _client.send('SetRepositoryPolicy', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'policyText': policyText,
      if (force != null) 'force': force,
    });
    return SetRepositoryPolicyResponse.fromJson(response_);
  }

  /// Starts a preview of the specified lifecycle policy. This allows you to see
  /// the results before creating the lifecycle policy.
  ///
  /// [registryId]: The AWS account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to be evaluated.
  ///
  /// [lifecyclePolicyText]: The policy to be evaluated against. If you do not
  /// specify a policy, the current policy for the repository is used.
  Future<StartLifecyclePolicyPreviewResponse> startLifecyclePolicyPreview(
      String repositoryName,
      {String registryId,
      String lifecyclePolicyText}) async {
    var response_ = await _client.send('StartLifecyclePolicyPreview', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
    });
    return StartLifecyclePolicyPreviewResponse.fromJson(response_);
  }

  /// Adds specified tags to a resource with the specified ARN. Existing tags on
  /// a resource are not changed if they are not specified in the request
  /// parameters.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the the resource to which
  /// to add tags. Currently, the only supported resource is an Amazon ECR
  /// repository.
  ///
  /// [tags]: The tags to add to the resource. A tag is an array of key-value
  /// pairs. Tag keys can have a maximum character length of 128 characters, and
  /// tag values can have a maximum length of 256 characters.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'resourceArn': resourceArn,
      'tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  /// Deletes specified tags from a resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource from which
  /// to remove tags. Currently, the only supported resource is an Amazon ECR
  /// repository.
  ///
  /// [tagKeys]: The keys of the tags to be removed.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Uploads an image layer part to Amazon ECR.
  ///
  ///
  ///
  /// This operation is used by the Amazon ECR proxy, and it is not intended for
  /// general use by customers for pulling and pushing images. In most cases,
  /// you should use the `docker` CLI to pull, tag, and push images.
  ///
  /// [registryId]: The AWS account ID associated with the registry to which you
  /// are uploading layer parts. If you do not specify a registry, the default
  /// registry is assumed.
  ///
  /// [repositoryName]: The name of the repository to which you are uploading
  /// layer parts.
  ///
  /// [uploadId]: The upload ID from a previous InitiateLayerUpload operation to
  /// associate with the layer part upload.
  ///
  /// [partFirstByte]: The integer value of the first byte of the layer part.
  ///
  /// [partLastByte]: The integer value of the last byte of the layer part.
  ///
  /// [layerPartBlob]: The base64-encoded layer part payload.
  Future<UploadLayerPartResponse> uploadLayerPart(
      {String registryId,
      @required String repositoryName,
      @required String uploadId,
      @required BigInt partFirstByte,
      @required BigInt partLastByte,
      @required Uint8List layerPartBlob}) async {
    var response_ = await _client.send('UploadLayerPart', {
      if (registryId != null) 'registryId': registryId,
      'repositoryName': repositoryName,
      'uploadId': uploadId,
      'partFirstByte': partFirstByte,
      'partLastByte': partLastByte,
      'layerPartBlob': layerPartBlob,
    });
    return UploadLayerPartResponse.fromJson(response_);
  }
}

/// An object representing authorization data for an Amazon ECR registry.
class AuthorizationData {
  /// A base64-encoded string that contains authorization data for the specified
  /// Amazon ECR registry. When the string is decoded, it is presented in the
  /// format `user:password` for private registry authentication using `docker
  /// login`.
  final String authorizationToken;

  /// The Unix time in seconds and milliseconds when the authorization token
  /// expires. Authorization tokens are valid for 12 hours.
  final DateTime expiresAt;

  /// The registry URL to use for this authorization token in a `docker login`
  /// command. The Amazon ECR registry URL format is
  /// `https://aws_account_id.dkr.ecr.region.amazonaws.com`. For example,
  /// `https://012345678910.dkr.ecr.us-east-1.amazonaws.com`..
  final String proxyEndpoint;

  AuthorizationData({
    this.authorizationToken,
    this.expiresAt,
    this.proxyEndpoint,
  });
  static AuthorizationData fromJson(Map<String, dynamic> json) =>
      AuthorizationData(
        authorizationToken: json.containsKey('authorizationToken')
            ? json['authorizationToken'] as String
            : null,
        expiresAt: json.containsKey('expiresAt')
            ? DateTime.parse(json['expiresAt'])
            : null,
        proxyEndpoint: json.containsKey('proxyEndpoint')
            ? json['proxyEndpoint'] as String
            : null,
      );
}

class BatchCheckLayerAvailabilityResponse {
  /// A list of image layer objects corresponding to the image layer references
  /// in the request.
  final List<Layer> layers;

  /// Any failures associated with the call.
  final List<LayerFailure> failures;

  BatchCheckLayerAvailabilityResponse({
    this.layers,
    this.failures,
  });
  static BatchCheckLayerAvailabilityResponse fromJson(
          Map<String, dynamic> json) =>
      BatchCheckLayerAvailabilityResponse(
        layers: json.containsKey('layers')
            ? (json['layers'] as List).map((e) => Layer.fromJson(e)).toList()
            : null,
        failures: json.containsKey('failures')
            ? (json['failures'] as List)
                .map((e) => LayerFailure.fromJson(e))
                .toList()
            : null,
      );
}

class BatchDeleteImageResponse {
  /// The image IDs of the deleted images.
  final List<ImageIdentifier> imageIds;

  /// Any failures associated with the call.
  final List<ImageFailure> failures;

  BatchDeleteImageResponse({
    this.imageIds,
    this.failures,
  });
  static BatchDeleteImageResponse fromJson(Map<String, dynamic> json) =>
      BatchDeleteImageResponse(
        imageIds: json.containsKey('imageIds')
            ? (json['imageIds'] as List)
                .map((e) => ImageIdentifier.fromJson(e))
                .toList()
            : null,
        failures: json.containsKey('failures')
            ? (json['failures'] as List)
                .map((e) => ImageFailure.fromJson(e))
                .toList()
            : null,
      );
}

class BatchGetImageResponse {
  /// A list of image objects corresponding to the image references in the
  /// request.
  final List<Image> images;

  /// Any failures associated with the call.
  final List<ImageFailure> failures;

  BatchGetImageResponse({
    this.images,
    this.failures,
  });
  static BatchGetImageResponse fromJson(Map<String, dynamic> json) =>
      BatchGetImageResponse(
        images: json.containsKey('images')
            ? (json['images'] as List).map((e) => Image.fromJson(e)).toList()
            : null,
        failures: json.containsKey('failures')
            ? (json['failures'] as List)
                .map((e) => ImageFailure.fromJson(e))
                .toList()
            : null,
      );
}

class CompleteLayerUploadResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The upload ID associated with the layer.
  final String uploadId;

  /// The `sha256` digest of the image layer.
  final String layerDigest;

  CompleteLayerUploadResponse({
    this.registryId,
    this.repositoryName,
    this.uploadId,
    this.layerDigest,
  });
  static CompleteLayerUploadResponse fromJson(Map<String, dynamic> json) =>
      CompleteLayerUploadResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        uploadId:
            json.containsKey('uploadId') ? json['uploadId'] as String : null,
        layerDigest: json.containsKey('layerDigest')
            ? json['layerDigest'] as String
            : null,
      );
}

class CreateRepositoryResponse {
  /// The repository that was created.
  final Repository repository;

  CreateRepositoryResponse({
    this.repository,
  });
  static CreateRepositoryResponse fromJson(Map<String, dynamic> json) =>
      CreateRepositoryResponse(
        repository: json.containsKey('repository')
            ? Repository.fromJson(json['repository'])
            : null,
      );
}

class DeleteLifecyclePolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON lifecycle policy text.
  final String lifecyclePolicyText;

  /// The time stamp of the last time that the lifecycle policy was run.
  final DateTime lastEvaluatedAt;

  DeleteLifecyclePolicyResponse({
    this.registryId,
    this.repositoryName,
    this.lifecyclePolicyText,
    this.lastEvaluatedAt,
  });
  static DeleteLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteLifecyclePolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        lifecyclePolicyText: json.containsKey('lifecyclePolicyText')
            ? json['lifecyclePolicyText'] as String
            : null,
        lastEvaluatedAt: json.containsKey('lastEvaluatedAt')
            ? DateTime.parse(json['lastEvaluatedAt'])
            : null,
      );
}

class DeleteRepositoryPolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON repository policy that was deleted from the repository.
  final String policyText;

  DeleteRepositoryPolicyResponse({
    this.registryId,
    this.repositoryName,
    this.policyText,
  });
  static DeleteRepositoryPolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteRepositoryPolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        policyText: json.containsKey('policyText')
            ? json['policyText'] as String
            : null,
      );
}

class DeleteRepositoryResponse {
  /// The repository that was deleted.
  final Repository repository;

  DeleteRepositoryResponse({
    this.repository,
  });
  static DeleteRepositoryResponse fromJson(Map<String, dynamic> json) =>
      DeleteRepositoryResponse(
        repository: json.containsKey('repository')
            ? Repository.fromJson(json['repository'])
            : null,
      );
}

/// An object representing a filter on a DescribeImages operation.
class DescribeImagesFilter {
  /// The tag status with which to filter your DescribeImages results. You can
  /// filter results based on whether they are `TAGGED` or `UNTAGGED`.
  final String tagStatus;

  DescribeImagesFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DescribeImagesResponse {
  /// A list of ImageDetail objects that contain data about the image.
  final List<ImageDetail> imageDetails;

  /// The `nextToken` value to include in a future `DescribeImages` request.
  /// When the results of a `DescribeImages` request exceed `maxResults`, this
  /// value can be used to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  DescribeImagesResponse({
    this.imageDetails,
    this.nextToken,
  });
  static DescribeImagesResponse fromJson(Map<String, dynamic> json) =>
      DescribeImagesResponse(
        imageDetails: json.containsKey('imageDetails')
            ? (json['imageDetails'] as List)
                .map((e) => ImageDetail.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class DescribeRepositoriesResponse {
  /// A list of repository objects corresponding to valid repositories.
  final List<Repository> repositories;

  /// The `nextToken` value to include in a future `DescribeRepositories`
  /// request. When the results of a `DescribeRepositories` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is `null` when there are no more results to return.
  final String nextToken;

  DescribeRepositoriesResponse({
    this.repositories,
    this.nextToken,
  });
  static DescribeRepositoriesResponse fromJson(Map<String, dynamic> json) =>
      DescribeRepositoriesResponse(
        repositories: json.containsKey('repositories')
            ? (json['repositories'] as List)
                .map((e) => Repository.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class GetAuthorizationTokenResponse {
  /// A list of authorization token data objects that correspond to the
  /// `registryIds` values in the request.
  final List<AuthorizationData> authorizationData;

  GetAuthorizationTokenResponse({
    this.authorizationData,
  });
  static GetAuthorizationTokenResponse fromJson(Map<String, dynamic> json) =>
      GetAuthorizationTokenResponse(
        authorizationData: json.containsKey('authorizationData')
            ? (json['authorizationData'] as List)
                .map((e) => AuthorizationData.fromJson(e))
                .toList()
            : null,
      );
}

class GetDownloadUrlForLayerResponse {
  /// The pre-signed Amazon S3 download URL for the requested layer.
  final String downloadUrl;

  /// The digest of the image layer to download.
  final String layerDigest;

  GetDownloadUrlForLayerResponse({
    this.downloadUrl,
    this.layerDigest,
  });
  static GetDownloadUrlForLayerResponse fromJson(Map<String, dynamic> json) =>
      GetDownloadUrlForLayerResponse(
        downloadUrl: json.containsKey('downloadUrl')
            ? json['downloadUrl'] as String
            : null,
        layerDigest: json.containsKey('layerDigest')
            ? json['layerDigest'] as String
            : null,
      );
}

class GetLifecyclePolicyPreviewResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON lifecycle policy text.
  final String lifecyclePolicyText;

  /// The status of the lifecycle policy preview request.
  final String status;

  /// The `nextToken` value to include in a future `GetLifecyclePolicyPreview`
  /// request. When the results of a `GetLifecyclePolicyPreview` request exceed
  /// `maxResults`, this value can be used to retrieve the next page of results.
  /// This value is `null` when there are no more results to return.
  final String nextToken;

  /// The results of the lifecycle policy preview request.
  final List<LifecyclePolicyPreviewResult> previewResults;

  /// The list of images that is returned as a result of the action.
  final LifecyclePolicyPreviewSummary summary;

  GetLifecyclePolicyPreviewResponse({
    this.registryId,
    this.repositoryName,
    this.lifecyclePolicyText,
    this.status,
    this.nextToken,
    this.previewResults,
    this.summary,
  });
  static GetLifecyclePolicyPreviewResponse fromJson(
          Map<String, dynamic> json) =>
      GetLifecyclePolicyPreviewResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        lifecyclePolicyText: json.containsKey('lifecyclePolicyText')
            ? json['lifecyclePolicyText'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
        previewResults: json.containsKey('previewResults')
            ? (json['previewResults'] as List)
                .map((e) => LifecyclePolicyPreviewResult.fromJson(e))
                .toList()
            : null,
        summary: json.containsKey('summary')
            ? LifecyclePolicyPreviewSummary.fromJson(json['summary'])
            : null,
      );
}

class GetLifecyclePolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON lifecycle policy text.
  final String lifecyclePolicyText;

  /// The time stamp of the last time that the lifecycle policy was run.
  final DateTime lastEvaluatedAt;

  GetLifecyclePolicyResponse({
    this.registryId,
    this.repositoryName,
    this.lifecyclePolicyText,
    this.lastEvaluatedAt,
  });
  static GetLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      GetLifecyclePolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        lifecyclePolicyText: json.containsKey('lifecyclePolicyText')
            ? json['lifecyclePolicyText'] as String
            : null,
        lastEvaluatedAt: json.containsKey('lastEvaluatedAt')
            ? DateTime.parse(json['lastEvaluatedAt'])
            : null,
      );
}

class GetRepositoryPolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON repository policy text associated with the repository.
  final String policyText;

  GetRepositoryPolicyResponse({
    this.registryId,
    this.repositoryName,
    this.policyText,
  });
  static GetRepositoryPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetRepositoryPolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        policyText: json.containsKey('policyText')
            ? json['policyText'] as String
            : null,
      );
}

/// An object representing an Amazon ECR image.
class Image {
  /// The AWS account ID associated with the registry containing the image.
  final String registryId;

  /// The name of the repository associated with the image.
  final String repositoryName;

  /// An object containing the image tag and image digest associated with an
  /// image.
  final ImageIdentifier imageId;

  /// The image manifest associated with the image.
  final String imageManifest;

  Image({
    this.registryId,
    this.repositoryName,
    this.imageId,
    this.imageManifest,
  });
  static Image fromJson(Map<String, dynamic> json) => Image(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        imageId: json.containsKey('imageId')
            ? ImageIdentifier.fromJson(json['imageId'])
            : null,
        imageManifest: json.containsKey('imageManifest')
            ? json['imageManifest'] as String
            : null,
      );
}

/// An object that describes an image returned by a DescribeImages operation.
class ImageDetail {
  /// The AWS account ID associated with the registry to which this image
  /// belongs.
  final String registryId;

  /// The name of the repository to which this image belongs.
  final String repositoryName;

  /// The `sha256` digest of the image manifest.
  final String imageDigest;

  /// The list of tags associated with this image.
  final List<String> imageTags;

  /// The size, in bytes, of the image in the repository.
  ///
  ///
  ///
  /// Beginning with Docker version 1.9, the Docker client compresses image
  /// layers before pushing them to a V2 Docker registry. The output of the
  /// `docker images` command shows the uncompressed image size, so it may
  /// return a larger image size than the image sizes returned by
  /// DescribeImages.
  final BigInt imageSizeInBytes;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  final DateTime imagePushedAt;

  ImageDetail({
    this.registryId,
    this.repositoryName,
    this.imageDigest,
    this.imageTags,
    this.imageSizeInBytes,
    this.imagePushedAt,
  });
  static ImageDetail fromJson(Map<String, dynamic> json) => ImageDetail(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        imageDigest: json.containsKey('imageDigest')
            ? json['imageDigest'] as String
            : null,
        imageTags: json.containsKey('imageTags')
            ? (json['imageTags'] as List).map((e) => e as String).toList()
            : null,
        imageSizeInBytes: json.containsKey('imageSizeInBytes')
            ? BigInt.from(json['imageSizeInBytes'])
            : null,
        imagePushedAt: json.containsKey('imagePushedAt')
            ? DateTime.parse(json['imagePushedAt'])
            : null,
      );
}

/// An object representing an Amazon ECR image failure.
class ImageFailure {
  /// The image ID associated with the failure.
  final ImageIdentifier imageId;

  /// The code associated with the failure.
  final String failureCode;

  /// The reason for the failure.
  final String failureReason;

  ImageFailure({
    this.imageId,
    this.failureCode,
    this.failureReason,
  });
  static ImageFailure fromJson(Map<String, dynamic> json) => ImageFailure(
        imageId: json.containsKey('imageId')
            ? ImageIdentifier.fromJson(json['imageId'])
            : null,
        failureCode: json.containsKey('failureCode')
            ? json['failureCode'] as String
            : null,
        failureReason: json.containsKey('failureReason')
            ? json['failureReason'] as String
            : null,
      );
}

/// An object with identifying information for an Amazon ECR image.
class ImageIdentifier {
  /// The `sha256` digest of the image manifest.
  final String imageDigest;

  /// The tag used for the image.
  final String imageTag;

  ImageIdentifier({
    this.imageDigest,
    this.imageTag,
  });
  static ImageIdentifier fromJson(Map<String, dynamic> json) => ImageIdentifier(
        imageDigest: json.containsKey('imageDigest')
            ? json['imageDigest'] as String
            : null,
        imageTag:
            json.containsKey('imageTag') ? json['imageTag'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class InitiateLayerUploadResponse {
  /// The upload ID for the layer upload. This parameter is passed to further
  /// UploadLayerPart and CompleteLayerUpload operations.
  final String uploadId;

  /// The size, in bytes, that Amazon ECR expects future layer part uploads to
  /// be.
  final BigInt partSize;

  InitiateLayerUploadResponse({
    this.uploadId,
    this.partSize,
  });
  static InitiateLayerUploadResponse fromJson(Map<String, dynamic> json) =>
      InitiateLayerUploadResponse(
        uploadId:
            json.containsKey('uploadId') ? json['uploadId'] as String : null,
        partSize:
            json.containsKey('partSize') ? BigInt.from(json['partSize']) : null,
      );
}

/// An object representing an Amazon ECR image layer.
class Layer {
  /// The `sha256` digest of the image layer.
  final String layerDigest;

  /// The availability status of the image layer.
  final String layerAvailability;

  /// The size, in bytes, of the image layer.
  final BigInt layerSize;

  /// The media type of the layer, such as
  /// `application/vnd.docker.image.rootfs.diff.tar.gzip` or
  /// `application/vnd.oci.image.layer.v1.tar+gzip`.
  final String mediaType;

  Layer({
    this.layerDigest,
    this.layerAvailability,
    this.layerSize,
    this.mediaType,
  });
  static Layer fromJson(Map<String, dynamic> json) => Layer(
        layerDigest: json.containsKey('layerDigest')
            ? json['layerDigest'] as String
            : null,
        layerAvailability: json.containsKey('layerAvailability')
            ? json['layerAvailability'] as String
            : null,
        layerSize: json.containsKey('layerSize')
            ? BigInt.from(json['layerSize'])
            : null,
        mediaType:
            json.containsKey('mediaType') ? json['mediaType'] as String : null,
      );
}

/// An object representing an Amazon ECR image layer failure.
class LayerFailure {
  /// The layer digest associated with the failure.
  final String layerDigest;

  /// The failure code associated with the failure.
  final String failureCode;

  /// The reason for the failure.
  final String failureReason;

  LayerFailure({
    this.layerDigest,
    this.failureCode,
    this.failureReason,
  });
  static LayerFailure fromJson(Map<String, dynamic> json) => LayerFailure(
        layerDigest: json.containsKey('layerDigest')
            ? json['layerDigest'] as String
            : null,
        failureCode: json.containsKey('failureCode')
            ? json['failureCode'] as String
            : null,
        failureReason: json.containsKey('failureReason')
            ? json['failureReason'] as String
            : null,
      );
}

/// The filter for the lifecycle policy preview.
class LifecyclePolicyPreviewFilter {
  /// The tag status of the image.
  final String tagStatus;

  LifecyclePolicyPreviewFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The result of the lifecycle policy preview.
class LifecyclePolicyPreviewResult {
  /// The list of tags associated with this image.
  final List<String> imageTags;

  /// The `sha256` digest of the image manifest.
  final String imageDigest;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  final DateTime imagePushedAt;

  /// The type of action to be taken.
  final LifecyclePolicyRuleAction action;

  /// The priority of the applied rule.
  final int appliedRulePriority;

  LifecyclePolicyPreviewResult({
    this.imageTags,
    this.imageDigest,
    this.imagePushedAt,
    this.action,
    this.appliedRulePriority,
  });
  static LifecyclePolicyPreviewResult fromJson(Map<String, dynamic> json) =>
      LifecyclePolicyPreviewResult(
        imageTags: json.containsKey('imageTags')
            ? (json['imageTags'] as List).map((e) => e as String).toList()
            : null,
        imageDigest: json.containsKey('imageDigest')
            ? json['imageDigest'] as String
            : null,
        imagePushedAt: json.containsKey('imagePushedAt')
            ? DateTime.parse(json['imagePushedAt'])
            : null,
        action: json.containsKey('action')
            ? LifecyclePolicyRuleAction.fromJson(json['action'])
            : null,
        appliedRulePriority: json.containsKey('appliedRulePriority')
            ? json['appliedRulePriority'] as int
            : null,
      );
}

/// The summary of the lifecycle policy preview request.
class LifecyclePolicyPreviewSummary {
  /// The number of expiring images.
  final int expiringImageTotalCount;

  LifecyclePolicyPreviewSummary({
    this.expiringImageTotalCount,
  });
  static LifecyclePolicyPreviewSummary fromJson(Map<String, dynamic> json) =>
      LifecyclePolicyPreviewSummary(
        expiringImageTotalCount: json.containsKey('expiringImageTotalCount')
            ? json['expiringImageTotalCount'] as int
            : null,
      );
}

/// The type of action to be taken.
class LifecyclePolicyRuleAction {
  /// The type of action to be taken.
  final String type;

  LifecyclePolicyRuleAction({
    this.type,
  });
  static LifecyclePolicyRuleAction fromJson(Map<String, dynamic> json) =>
      LifecyclePolicyRuleAction(
        type: json.containsKey('type') ? json['type'] as String : null,
      );
}

/// An object representing a filter on a ListImages operation.
class ListImagesFilter {
  /// The tag status with which to filter your ListImages results. You can
  /// filter results based on whether they are `TAGGED` or `UNTAGGED`.
  final String tagStatus;

  ListImagesFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListImagesResponse {
  /// The list of image IDs for the requested repository.
  final List<ImageIdentifier> imageIds;

  /// The `nextToken` value to include in a future `ListImages` request. When
  /// the results of a `ListImages` request exceed `maxResults`, this value can
  /// be used to retrieve the next page of results. This value is `null` when
  /// there are no more results to return.
  final String nextToken;

  ListImagesResponse({
    this.imageIds,
    this.nextToken,
  });
  static ListImagesResponse fromJson(Map<String, dynamic> json) =>
      ListImagesResponse(
        imageIds: json.containsKey('imageIds')
            ? (json['imageIds'] as List)
                .map((e) => ImageIdentifier.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('nextToken') ? json['nextToken'] as String : null,
      );
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        tags: json.containsKey('tags')
            ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class PutImageResponse {
  /// Details of the image uploaded.
  final Image image;

  PutImageResponse({
    this.image,
  });
  static PutImageResponse fromJson(Map<String, dynamic> json) =>
      PutImageResponse(
        image: json.containsKey('image') ? Image.fromJson(json['image']) : null,
      );
}

class PutImageTagMutabilityResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The image tag mutability setting for the repository.
  final String imageTagMutability;

  PutImageTagMutabilityResponse({
    this.registryId,
    this.repositoryName,
    this.imageTagMutability,
  });
  static PutImageTagMutabilityResponse fromJson(Map<String, dynamic> json) =>
      PutImageTagMutabilityResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        imageTagMutability: json.containsKey('imageTagMutability')
            ? json['imageTagMutability'] as String
            : null,
      );
}

class PutLifecyclePolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON repository policy text.
  final String lifecyclePolicyText;

  PutLifecyclePolicyResponse({
    this.registryId,
    this.repositoryName,
    this.lifecyclePolicyText,
  });
  static PutLifecyclePolicyResponse fromJson(Map<String, dynamic> json) =>
      PutLifecyclePolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        lifecyclePolicyText: json.containsKey('lifecyclePolicyText')
            ? json['lifecyclePolicyText'] as String
            : null,
      );
}

/// An object representing a repository.
class Repository {
  /// The Amazon Resource Name (ARN) that identifies the repository. The ARN
  /// contains the `arn:aws:ecr` namespace, followed by the region of the
  /// repository, AWS account ID of the repository owner, repository namespace,
  /// and repository name. For example,
  /// `arn:aws:ecr:region:012345678910:repository/test`.
  final String repositoryArn;

  /// The AWS account ID associated with the registry that contains the
  /// repository.
  final String registryId;

  /// The name of the repository.
  final String repositoryName;

  /// The URI for the repository. You can use this URI for Docker `push` or
  /// `pull` operations.
  final String repositoryUri;

  /// The date and time, in JavaScript date format, when the repository was
  /// created.
  final DateTime createdAt;

  /// The tag mutability setting for the repository.
  final String imageTagMutability;

  Repository({
    this.repositoryArn,
    this.registryId,
    this.repositoryName,
    this.repositoryUri,
    this.createdAt,
    this.imageTagMutability,
  });
  static Repository fromJson(Map<String, dynamic> json) => Repository(
        repositoryArn: json.containsKey('repositoryArn')
            ? json['repositoryArn'] as String
            : null,
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        repositoryUri: json.containsKey('repositoryUri')
            ? json['repositoryUri'] as String
            : null,
        createdAt: json.containsKey('createdAt')
            ? DateTime.parse(json['createdAt'])
            : null,
        imageTagMutability: json.containsKey('imageTagMutability')
            ? json['imageTagMutability'] as String
            : null,
      );
}

class SetRepositoryPolicyResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON repository policy text applied to the repository.
  final String policyText;

  SetRepositoryPolicyResponse({
    this.registryId,
    this.repositoryName,
    this.policyText,
  });
  static SetRepositoryPolicyResponse fromJson(Map<String, dynamic> json) =>
      SetRepositoryPolicyResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        policyText: json.containsKey('policyText')
            ? json['policyText'] as String
            : null,
      );
}

class StartLifecyclePolicyPreviewResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The JSON repository policy text.
  final String lifecyclePolicyText;

  /// The status of the lifecycle policy preview request.
  final String status;

  StartLifecyclePolicyPreviewResponse({
    this.registryId,
    this.repositoryName,
    this.lifecyclePolicyText,
    this.status,
  });
  static StartLifecyclePolicyPreviewResponse fromJson(
          Map<String, dynamic> json) =>
      StartLifecyclePolicyPreviewResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        lifecyclePolicyText: json.containsKey('lifecyclePolicyText')
            ? json['lifecyclePolicyText'] as String
            : null,
        status: json.containsKey('status') ? json['status'] as String : null,
      );
}

/// The metadata that you apply to a resource to help you categorize and
/// organize them. Each tag consists of a key and an optional value, both of
/// which you define. Tag keys can have a maximum character length of 128
/// characters, and tag values can have a maximum length of 256 characters.
class Tag {
  /// One part of a key-value pair that make up a tag. A `key` is a general
  /// label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A `value` acts
  /// as a descriptor within a tag category (key).
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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

class UploadLayerPartResponse {
  /// The registry ID associated with the request.
  final String registryId;

  /// The repository name associated with the request.
  final String repositoryName;

  /// The upload ID associated with the request.
  final String uploadId;

  /// The integer value of the last byte received in the request.
  final BigInt lastByteReceived;

  UploadLayerPartResponse({
    this.registryId,
    this.repositoryName,
    this.uploadId,
    this.lastByteReceived,
  });
  static UploadLayerPartResponse fromJson(Map<String, dynamic> json) =>
      UploadLayerPartResponse(
        registryId: json.containsKey('registryId')
            ? json['registryId'] as String
            : null,
        repositoryName: json.containsKey('repositoryName')
            ? json['repositoryName'] as String
            : null,
        uploadId:
            json.containsKey('uploadId') ? json['uploadId'] as String : null,
        lastByteReceived: json.containsKey('lastByteReceived')
            ? BigInt.from(json['lastByteReceived'])
            : null,
      );
}
