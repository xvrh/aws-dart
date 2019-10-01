import 'package:meta/meta.dart';

/// An AWS Elemental MediaStore container is a namespace that holds folders and
/// objects. You use a container endpoint to create, read, and delete objects.
class MediaStoreApi {
  /// Creates a storage container to hold objects. A container is similar to a
  /// bucket in the Amazon S3 service.
  ///
  /// [containerName]: The name for the container. The name must be from 1 to
  /// 255 characters. Container names must be unique to your AWS account within
  /// a specific region. As an example, you could create a container named
  /// `movies` in every region, as long as you don’t have an existing container
  /// with that name.
  ///
  /// [tags]: An array of key:value pairs that you define. These values can be
  /// anything that you want. Typically, the tag key represents a category (such
  /// as "environment") and the tag value represents a specific value within
  /// that category (such as "test," "development," or "production"). You can
  /// add up to 50 tags to each container. For more information about tagging,
  /// including naming and usage conventions, see [Tagging Resources in
  /// MediaStore](https://aws.amazon.com/documentation/mediastore/tagging).
  Future<CreateContainerOutput> createContainer(String containerName,
      {List<Tag> tags}) async {
    return CreateContainerOutput.fromJson({});
  }

  /// Deletes the specified container. Before you make a `DeleteContainer`
  /// request, delete any objects in the container or in any folders in the
  /// container. You can delete only empty containers.
  ///
  /// [containerName]: The name of the container to delete.
  Future<DeleteContainerOutput> deleteContainer(String containerName) async {
    return DeleteContainerOutput.fromJson({});
  }

  /// Deletes the access policy that is associated with the specified container.
  ///
  /// [containerName]: The name of the container that holds the policy.
  Future<DeleteContainerPolicyOutput> deleteContainerPolicy(
      String containerName) async {
    return DeleteContainerPolicyOutput.fromJson({});
  }

  /// Deletes the cross-origin resource sharing (CORS) configuration information
  /// that is set for the container.
  ///
  /// To use this operation, you must have permission to perform the
  /// `MediaStore:DeleteCorsPolicy` action. The container owner has this
  /// permission by default and can grant this permission to others.
  ///
  /// [containerName]: The name of the container to remove the policy from.
  Future<DeleteCorsPolicyOutput> deleteCorsPolicy(String containerName) async {
    return DeleteCorsPolicyOutput.fromJson({});
  }

  /// Removes an object lifecycle policy from a container. It takes up to 20
  /// minutes for the change to take effect.
  ///
  /// [containerName]: The name of the container that holds the object lifecycle
  /// policy.
  Future<DeleteLifecyclePolicyOutput> deleteLifecyclePolicy(
      String containerName) async {
    return DeleteLifecyclePolicyOutput.fromJson({});
  }

  /// Retrieves the properties of the requested container. This request is
  /// commonly used to retrieve the endpoint of a container. An endpoint is a
  /// value assigned by the service when a new container is created. A
  /// container's endpoint does not change after it has been assigned. The
  /// `DescribeContainer` request returns a single `Container` object based on
  /// `ContainerName`. To return all `Container` objects that are associated
  /// with a specified AWS account, use ListContainers.
  ///
  /// [containerName]: The name of the container to query.
  Future<DescribeContainerOutput> describeContainer(
      {String containerName}) async {
    return DescribeContainerOutput.fromJson({});
  }

  /// Retrieves the access policy for the specified container. For information
  /// about the data that is included in an access policy, see the [AWS Identity
  /// and Access Management User
  /// Guide](https://aws.amazon.com/documentation/iam/).
  ///
  /// [containerName]: The name of the container.
  Future<GetContainerPolicyOutput> getContainerPolicy(
      String containerName) async {
    return GetContainerPolicyOutput.fromJson({});
  }

  /// Returns the cross-origin resource sharing (CORS) configuration information
  /// that is set for the container.
  ///
  /// To use this operation, you must have permission to perform the
  /// `MediaStore:GetCorsPolicy` action. By default, the container owner has
  /// this permission and can grant it to others.
  ///
  /// [containerName]: The name of the container that the policy is assigned to.
  Future<GetCorsPolicyOutput> getCorsPolicy(String containerName) async {
    return GetCorsPolicyOutput.fromJson({});
  }

  /// Retrieves the object lifecycle policy that is assigned to a container.
  ///
  /// [containerName]: The name of the container that the object lifecycle
  /// policy is assigned to.
  Future<GetLifecyclePolicyOutput> getLifecyclePolicy(
      String containerName) async {
    return GetLifecyclePolicyOutput.fromJson({});
  }

  /// Lists the properties of all containers in AWS Elemental MediaStore.
  ///
  /// You can query to receive all the containers in one response. Or you can
  /// include the `MaxResults` parameter to receive a limited number of
  /// containers in each response. In this case, the response includes a token.
  /// To get the next set of containers, send the command again, this time with
  /// the `NextToken` parameter (with the returned token as its value). The next
  /// set of responses appears, with a token if there are still more containers
  /// to receive.
  ///
  /// See also DescribeContainer, which gets the properties of one container.
  ///
  /// [nextToken]: Only if you used `MaxResults` in the first command, enter the
  /// token (which was included in the previous response) to obtain the next set
  /// of containers. This token is included in a response only if there actually
  /// are more containers to list.
  ///
  /// [maxResults]: Enter the maximum number of containers in the response. Use
  /// from 1 to 255 characters.
  Future<ListContainersOutput> listContainers(
      {String nextToken, int maxResults}) async {
    return ListContainersOutput.fromJson({});
  }

  /// Returns a list of the tags assigned to the specified container.
  ///
  /// [resource]: The Amazon Resource Name (ARN) for the container.
  Future<ListTagsForResourceOutput> listTagsForResource(String resource) async {
    return ListTagsForResourceOutput.fromJson({});
  }

  /// Creates an access policy for the specified container to restrict the users
  /// and clients that can access it. For information about the data that is
  /// included in an access policy, see the [AWS Identity and Access Management
  /// User Guide](https://aws.amazon.com/documentation/iam/).
  ///
  /// For this release of the REST API, you can create only one policy for a
  /// container. If you enter `PutContainerPolicy` twice, the second command
  /// modifies the existing policy.
  ///
  /// [containerName]: The name of the container.
  ///
  /// [policy]: The contents of the policy, which includes the following:
  ///
  /// *   One `Version` tag
  ///
  /// *   One `Statement` tag that contains the standard tags for the policy.
  Future<PutContainerPolicyOutput> putContainerPolicy(
      {@required String containerName, @required String policy}) async {
    return PutContainerPolicyOutput.fromJson({});
  }

  /// Sets the cross-origin resource sharing (CORS) configuration on a container
  /// so that the container can service cross-origin requests. For example, you
  /// might want to enable a request whose origin is http://www.example.com to
  /// access your AWS Elemental MediaStore container at my.example.container.com
  /// by using the browser's XMLHttpRequest capability.
  ///
  /// To enable CORS on a container, you attach a CORS policy to the container.
  /// In the CORS policy, you configure rules that identify origins and the HTTP
  /// methods that can be executed on your container. The policy can contain up
  /// to 398,000 characters. You can add up to 100 rules to a CORS policy. If
  /// more than one rule applies, the service uses the first applicable rule
  /// listed.
  ///
  /// To learn more about CORS, see [Cross-Origin Resource Sharing (CORS) in AWS
  /// Elemental
  /// MediaStore](https://docs.aws.amazon.com/mediastore/latest/ug/cors-policy.html).
  ///
  /// [containerName]: The name of the container that you want to assign the
  /// CORS policy to.
  ///
  /// [corsPolicy]: The CORS policy to apply to the container.
  Future<PutCorsPolicyOutput> putCorsPolicy(
      {@required String containerName,
      @required List<CorsRule> corsPolicy}) async {
    return PutCorsPolicyOutput.fromJson({});
  }

  /// Writes an object lifecycle policy to a container. If the container already
  /// has an object lifecycle policy, the service replaces the existing policy
  /// with the new policy. It takes up to 20 minutes for the change to take
  /// effect.
  ///
  /// For information about how to construct an object lifecycle policy, see
  /// [Components of an Object Lifecycle
  /// Policy](https://docs.aws.amazon.com/mediastore/latest/ug/policies-object-lifecycle-components.html).
  ///
  /// [containerName]: The name of the container that you want to assign the
  /// object lifecycle policy to.
  ///
  /// [lifecyclePolicy]: The object lifecycle policy to apply to the container.
  Future<PutLifecyclePolicyOutput> putLifecyclePolicy(
      {@required String containerName,
      @required String lifecyclePolicy}) async {
    return PutLifecyclePolicyOutput.fromJson({});
  }

  /// Starts access logging on the specified container. When you enable access
  /// logging on a container, MediaStore delivers access logs for objects stored
  /// in that container to Amazon CloudWatch Logs.
  ///
  /// [containerName]: The name of the container that you want to start access
  /// logging on.
  Future<StartAccessLoggingOutput> startAccessLogging(
      String containerName) async {
    return StartAccessLoggingOutput.fromJson({});
  }

  /// Stops access logging on the specified container. When you stop access
  /// logging on a container, MediaStore stops sending access logs to Amazon
  /// CloudWatch Logs. These access logs are not saved and are not retrievable.
  ///
  /// [containerName]: The name of the container that you want to stop access
  /// logging on.
  Future<StopAccessLoggingOutput> stopAccessLogging(
      String containerName) async {
    return StopAccessLoggingOutput.fromJson({});
  }

  /// Adds tags to the specified AWS Elemental MediaStore container. Tags are
  /// key:value pairs that you can associate with AWS resources. For example,
  /// the tag key might be "customer" and the tag value might be "companyA." You
  /// can specify one or more tags to add to each container. You can add up to
  /// 50 tags to each container. For more information about tagging, including
  /// naming and usage conventions, see [Tagging Resources in
  /// MediaStore](https://aws.amazon.com/documentation/mediastore/tagging).
  ///
  /// [resource]: The Amazon Resource Name (ARN) for the container.
  ///
  /// [tags]: An array of key:value pairs that you want to add to the container.
  /// You need to specify only the tags that you want to add or update. For
  /// example, suppose a container already has two tags (customer:CompanyA and
  /// priority:High). You want to change the priority tag and also add a third
  /// tag (type:Contract). For TagResource, you specify the following tags:
  /// priority:Medium, type:Contract. The result is that your container has
  /// three tags: customer:CompanyA, priority:Medium, and type:Contract.
  Future<TagResourceOutput> tagResource(
      {@required String resource, @required List<Tag> tags}) async {
    return TagResourceOutput.fromJson({});
  }

  /// Removes tags from the specified container. You can specify one or more
  /// tags to remove.
  ///
  /// [resource]: The Amazon Resource Name (ARN) for the container.
  ///
  /// [tagKeys]: A comma-separated list of keys for tags that you want to remove
  /// from the container. For example, if your container has two tags
  /// (customer:CompanyA and priority:High) and you want to remove one of the
  /// tags (priority:High), you specify the key for the tag that you want to
  /// remove (priority).
  Future<UntagResourceOutput> untagResource(
      {@required String resource, @required List<String> tagKeys}) async {
    return UntagResourceOutput.fromJson({});
  }
}

class Container {
  /// The DNS endpoint of the container. Use the endpoint to identify the
  /// specific container when sending requests to the data plane. The service
  /// assigns this value when the container is created. Once the value has been
  /// assigned, it does not change.
  final String endpoint;

  /// Unix timestamp.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the container. The ARN has the following
  /// format:
  ///
  /// arn:aws:<region>:<account that owns this container>:container/<name of
  /// container>
  ///
  /// For example: arn:aws:mediastore:us-west-2:111122223333:container/movies
  final String arn;

  /// The name of the container.
  final String name;

  /// The status of container creation or deletion. The status is one of the
  /// following: `CREATING`, `ACTIVE`, or `DELETING`. While the service is
  /// creating the container, the status is `CREATING`. When the endpoint is
  /// available, the status changes to `ACTIVE`.
  final String status;

  /// The state of access logging on the container. This value is `false` by
  /// default, indicating that AWS Elemental MediaStore does not send access
  /// logs to Amazon CloudWatch Logs. When you enable access logging on the
  /// container, MediaStore changes this value to `true`, indicating that the
  /// service delivers access logs for objects stored in that container to
  /// CloudWatch Logs.
  final bool accessLoggingEnabled;

  Container({
    this.endpoint,
    this.creationTime,
    this.arn,
    this.name,
    this.status,
    this.accessLoggingEnabled,
  });
  static Container fromJson(Map<String, dynamic> json) => Container();
}

class CorsRule {
  /// One or more response headers that you want users to be able to access from
  /// their applications (for example, from a JavaScript `XMLHttpRequest`
  /// object).
  ///
  /// Each CORS rule must have at least one `AllowedOrigins` element. The string
  /// value can include only one wildcard character (*), for example,
  /// http://*.example.com. Additionally, you can specify only one wildcard
  /// character to allow cross-origin access for all origins.
  final List<String> allowedOrigins;

  /// Identifies an HTTP method that the origin that is specified in the rule is
  /// allowed to execute.
  ///
  /// Each CORS rule must contain at least one `AllowedMethods` and one
  /// `AllowedOrigins` element.
  final List<String> allowedMethods;

  /// Specifies which headers are allowed in a preflight `OPTIONS` request
  /// through the `Access-Control-Request-Headers` header. Each header name that
  /// is specified in `Access-Control-Request-Headers` must have a corresponding
  /// entry in the rule. Only the headers that were requested are sent back.
  ///
  /// This element can contain only one wildcard character (*).
  final List<String> allowedHeaders;

  /// The time in seconds that your browser caches the preflight response for
  /// the specified resource.
  ///
  /// A CORS rule can have only one `MaxAgeSeconds` element.
  final int maxAgeSeconds;

  /// One or more headers in the response that you want users to be able to
  /// access from their applications (for example, from a JavaScript
  /// `XMLHttpRequest` object).
  ///
  /// This element is optional for each rule.
  final List<String> exposeHeaders;

  CorsRule({
    @required this.allowedOrigins,
    this.allowedMethods,
    @required this.allowedHeaders,
    this.maxAgeSeconds,
    this.exposeHeaders,
  });
  static CorsRule fromJson(Map<String, dynamic> json) => CorsRule();
}

class CreateContainerOutput {
  /// ContainerARN: The Amazon Resource Name (ARN) of the newly created
  /// container. The ARN has the following format: arn:aws:<region>:<account
  /// that owns this container>:container/<name of container>. For example:
  /// arn:aws:mediastore:us-west-2:111122223333:container/movies
  ///
  /// ContainerName: The container name as specified in the request.
  ///
  /// CreationTime: Unix time stamp.
  ///
  /// Status: The status of container creation or deletion. The status is one of
  /// the following: `CREATING`, `ACTIVE`, or `DELETING`. While the service is
  /// creating the container, the status is `CREATING`. When an endpoint is
  /// available, the status changes to `ACTIVE`.
  ///
  /// The return value does not include the container's endpoint. To make
  /// downstream requests, you must obtain this value by using DescribeContainer
  /// or ListContainers.
  final Container container;

  CreateContainerOutput({
    @required this.container,
  });
  static CreateContainerOutput fromJson(Map<String, dynamic> json) =>
      CreateContainerOutput();
}

class DeleteContainerOutput {
  DeleteContainerOutput();
  static DeleteContainerOutput fromJson(Map<String, dynamic> json) =>
      DeleteContainerOutput();
}

class DeleteContainerPolicyOutput {
  DeleteContainerPolicyOutput();
  static DeleteContainerPolicyOutput fromJson(Map<String, dynamic> json) =>
      DeleteContainerPolicyOutput();
}

class DeleteCorsPolicyOutput {
  DeleteCorsPolicyOutput();
  static DeleteCorsPolicyOutput fromJson(Map<String, dynamic> json) =>
      DeleteCorsPolicyOutput();
}

class DeleteLifecyclePolicyOutput {
  DeleteLifecyclePolicyOutput();
  static DeleteLifecyclePolicyOutput fromJson(Map<String, dynamic> json) =>
      DeleteLifecyclePolicyOutput();
}

class DescribeContainerOutput {
  /// The name of the queried container.
  final Container container;

  DescribeContainerOutput({
    this.container,
  });
  static DescribeContainerOutput fromJson(Map<String, dynamic> json) =>
      DescribeContainerOutput();
}

class GetContainerPolicyOutput {
  /// The contents of the access policy.
  final String policy;

  GetContainerPolicyOutput({
    @required this.policy,
  });
  static GetContainerPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetContainerPolicyOutput();
}

class GetCorsPolicyOutput {
  /// The CORS policy assigned to the container.
  final List<CorsRule> corsPolicy;

  GetCorsPolicyOutput({
    @required this.corsPolicy,
  });
  static GetCorsPolicyOutput fromJson(Map<String, dynamic> json) =>
      GetCorsPolicyOutput();
}

class GetLifecyclePolicyOutput {
  /// The object lifecycle policy that is assigned to the container.
  final String lifecyclePolicy;

  GetLifecyclePolicyOutput({
    @required this.lifecyclePolicy,
  });
  static GetLifecyclePolicyOutput fromJson(Map<String, dynamic> json) =>
      GetLifecyclePolicyOutput();
}

class ListContainersOutput {
  /// The names of the containers.
  final List<Container> containers;

  ///  `NextToken` is the token to use in the next call to `ListContainers`.
  /// This token is returned only if you included the `MaxResults` tag in the
  /// original command, and only if there are still containers to return.
  final String nextToken;

  ListContainersOutput({
    @required this.containers,
    this.nextToken,
  });
  static ListContainersOutput fromJson(Map<String, dynamic> json) =>
      ListContainersOutput();
}

class ListTagsForResourceOutput {
  /// An array of key:value pairs that are assigned to the container.
  final List<Tag> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  static ListTagsForResourceOutput fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceOutput();
}

class PutContainerPolicyOutput {
  PutContainerPolicyOutput();
  static PutContainerPolicyOutput fromJson(Map<String, dynamic> json) =>
      PutContainerPolicyOutput();
}

class PutCorsPolicyOutput {
  PutCorsPolicyOutput();
  static PutCorsPolicyOutput fromJson(Map<String, dynamic> json) =>
      PutCorsPolicyOutput();
}

class PutLifecyclePolicyOutput {
  PutLifecyclePolicyOutput();
  static PutLifecyclePolicyOutput fromJson(Map<String, dynamic> json) =>
      PutLifecyclePolicyOutput();
}

class StartAccessLoggingOutput {
  StartAccessLoggingOutput();
  static StartAccessLoggingOutput fromJson(Map<String, dynamic> json) =>
      StartAccessLoggingOutput();
}

class StopAccessLoggingOutput {
  StopAccessLoggingOutput();
  static StopAccessLoggingOutput fromJson(Map<String, dynamic> json) =>
      StopAccessLoggingOutput();
}

class Tag {
  /// Part of the key:value pair that defines a tag. You can use a tag key to
  /// describe a category of information, such as "customer." Tag keys are
  /// case-sensitive.
  final String key;

  /// Part of the key:value pair that defines a tag. You can use a tag value to
  /// describe a specific value within a category, such as "companyA" or
  /// "companyB." Tag values are case-sensitive.
  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceOutput {
  TagResourceOutput();
  static TagResourceOutput fromJson(Map<String, dynamic> json) =>
      TagResourceOutput();
}

class UntagResourceOutput {
  UntagResourceOutput();
  static UntagResourceOutput fromJson(Map<String, dynamic> json) =>
      UntagResourceOutput();
}
