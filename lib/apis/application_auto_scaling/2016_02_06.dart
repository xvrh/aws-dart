import 'package:meta/meta.dart';

/// With Application Auto Scaling, you can configure automatic scaling for the
/// following resources:
///
/// *   Amazon ECS services
///
/// *   Amazon EC2 Spot Fleet requests
///
/// *   Amazon EMR clusters
///
/// *   Amazon AppStream 2.0 fleets
///
/// *   Amazon DynamoDB tables and global secondary indexes throughput capacity
///
/// *   Amazon Aurora Replicas
///
/// *   Amazon SageMaker endpoint variants
///
/// *   Custom resources provided by your own applications or services
///
///
///  **API Summary**
///
/// The Application Auto Scaling service API includes three key sets of actions:
///
/// *   Register and manage scalable targets - Register AWS or custom resources
/// as scalable targets (a resource that Application Auto Scaling can scale),
/// set minimum and maximum capacity limits, and retrieve information on
/// existing scalable targets.
///
/// *   Configure and manage automatic scaling - Define scaling policies to
/// dynamically scale your resources in response to CloudWatch alarms, schedule
/// one-time or recurring scaling actions, and retrieve your recent scaling
/// activity history.
///
/// *   Suspend and resume scaling - Temporarily suspend and later resume
/// automatic scaling by calling the RegisterScalableTarget action for any
/// Application Auto Scaling scalable target. You can suspend and resume,
/// individually or in combination, scale-out activities triggered by a scaling
/// policy, scale-in activities triggered by a scaling policy, and scheduled
/// scaling.
///
///
/// To learn more about Application Auto Scaling, including information about
/// granting IAM users required permissions for Application Auto Scaling
/// actions, see the
/// [Application Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
class ApplicationAutoScalingApi {
  final _client;
  ApplicationAutoScalingApi(client)
      : _client =
            client.configured('Application Auto Scaling', serializer: 'json');

  /// Deletes the specified scaling policy for an Application Auto Scaling
  /// scalable target.
  ///
  /// Deleting a step scaling policy deletes the underlying alarm action, but
  /// does not delete the CloudWatch alarm associated with the scaling policy,
  /// even if it no longer has an associated action.
  ///
  /// For more information, see
  /// [Delete a Step Scaling Policy](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy)
  /// and
  /// [Delete a Target Tracking Scaling Policy](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy)
  /// in the _Application Auto Scaling User Guide_.
  ///
  /// To create a scaling policy or update an existing one, see
  /// PutScalingPolicy.
  ///
  /// [policyName]: The name of the scaling policy.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scalable
  /// target. This string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  Future<DeleteScalingPolicyResponse> deleteScalingPolicy(
      {@required String policyName,
      @required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension}) async {
    var response_ = await _client.send('DeleteScalingPolicy', {
      'PolicyName': policyName,
      'ServiceNamespace': serviceNamespace,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
    });
    return DeleteScalingPolicyResponse.fromJson(response_);
  }

  /// Deletes the specified scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// For more information, see
  /// [Delete a Scheduled Action](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action)
  /// in the _Application Auto Scaling User Guide_.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [scheduledActionName]: The name of the scheduled action.
  ///
  /// [resourceId]: The identifier of the resource associated with the scheduled
  /// action. This string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  Future<DeleteScheduledActionResponse> deleteScheduledAction(
      {@required String serviceNamespace,
      @required String scheduledActionName,
      @required String resourceId,
      @required String scalableDimension}) async {
    var response_ = await _client.send('DeleteScheduledAction', {
      'ServiceNamespace': serviceNamespace,
      'ScheduledActionName': scheduledActionName,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
    });
    return DeleteScheduledActionResponse.fromJson(response_);
  }

  /// Deregisters an Application Auto Scaling scalable target.
  ///
  /// Deregistering a scalable target deletes the scaling policies that are
  /// associated with it.
  ///
  /// To create a scalable target or update an existing one, see
  /// RegisterScalableTarget.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scalable
  /// target. This string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension associated with the scalable
  /// target. This string consists of the service namespace, resource type, and
  /// scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  Future<DeregisterScalableTargetResponse> deregisterScalableTarget(
      {@required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension}) async {
    var response_ = await _client.send('DeregisterScalableTarget', {
      'ServiceNamespace': serviceNamespace,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
    });
    return DeregisterScalableTargetResponse.fromJson(response_);
  }

  /// Gets information about the scalable targets in the specified namespace.
  ///
  /// You can filter the results using `ResourceIds` and `ScalableDimension`.
  ///
  /// To create a scalable target or update an existing one, see
  /// RegisterScalableTarget. If you are no longer using a scalable target, you
  /// can deregister it using DeregisterScalableTarget.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceIds]: The identifier of the resource associated with the scalable
  /// target. This string consists of the resource type and unique identifier.
  /// If you specify a scalable dimension, you must also specify a resource ID.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension associated with the scalable
  /// target. This string consists of the service namespace, resource type, and
  /// scaling property. If you specify a scalable dimension, you must also
  /// specify a resource ID.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [maxResults]: The maximum number of scalable targets. This value can be
  /// between 1 and 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to `MaxResults`
  /// results at a time, along with a `NextToken` value. To get the next set of
  /// results, include the `NextToken` value in a subsequent call. If this
  /// parameter is not used, the operation returns up to 50 results and a
  /// `NextToken` value, if applicable.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScalableTargetsResponse> describeScalableTargets(
      String serviceNamespace,
      {List<String> resourceIds,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeScalableTargets', {
      'ServiceNamespace': serviceNamespace,
      if (resourceIds != null) 'ResourceIds': resourceIds,
      if (scalableDimension != null) 'ScalableDimension': scalableDimension,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScalableTargetsResponse.fromJson(response_);
  }

  /// Provides descriptive information about the scaling activities in the
  /// specified namespace from the previous six weeks.
  ///
  /// You can filter the results using `ResourceId` and `ScalableDimension`.
  ///
  /// Scaling activities are triggered by CloudWatch alarms that are associated
  /// with scaling policies. To view the scaling policies for a service
  /// namespace, see DescribeScalingPolicies. To create a scaling policy or
  /// update an existing one, see PutScalingPolicy.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scaling
  /// activity. This string consists of the resource type and unique identifier.
  /// If you specify a scalable dimension, you must also specify a resource ID.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property. If you specify a
  /// scalable dimension, you must also specify a resource ID.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [maxResults]: The maximum number of scalable targets. This value can be
  /// between 1 and 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to `MaxResults`
  /// results at a time, along with a `NextToken` value. To get the next set of
  /// results, include the `NextToken` value in a subsequent call. If this
  /// parameter is not used, the operation returns up to 50 results and a
  /// `NextToken` value, if applicable.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScalingActivitiesResponse> describeScalingActivities(
      String serviceNamespace,
      {String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeScalingActivities', {
      'ServiceNamespace': serviceNamespace,
      if (resourceId != null) 'ResourceId': resourceId,
      if (scalableDimension != null) 'ScalableDimension': scalableDimension,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScalingActivitiesResponse.fromJson(response_);
  }

  /// Describes the Application Auto Scaling scaling policies for the specified
  /// service namespace.
  ///
  /// You can filter the results using `ResourceId`, `ScalableDimension`, and
  /// `PolicyNames`.
  ///
  /// To create a scaling policy or update an existing one, see
  /// PutScalingPolicy. If you are no longer using a scaling policy, you can
  /// delete it using DeleteScalingPolicy.
  ///
  /// [policyNames]: The names of the scaling policies to describe.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scaling
  /// policy. This string consists of the resource type and unique identifier.
  /// If you specify a scalable dimension, you must also specify a resource ID.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property. If you specify a
  /// scalable dimension, you must also specify a resource ID.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [maxResults]: The maximum number of scalable targets. This value can be
  /// between 1 and 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to `MaxResults`
  /// results at a time, along with a `NextToken` value. To get the next set of
  /// results, include the `NextToken` value in a subsequent call. If this
  /// parameter is not used, the operation returns up to 50 results and a
  /// `NextToken` value, if applicable.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScalingPoliciesResponse> describeScalingPolicies(
      String serviceNamespace,
      {List<String> policyNames,
      String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeScalingPolicies', {
      if (policyNames != null) 'PolicyNames': policyNames,
      'ServiceNamespace': serviceNamespace,
      if (resourceId != null) 'ResourceId': resourceId,
      if (scalableDimension != null) 'ScalableDimension': scalableDimension,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScalingPoliciesResponse.fromJson(response_);
  }

  /// Describes the Application Auto Scaling scheduled actions for the specified
  /// service namespace.
  ///
  /// You can filter the results using the `ResourceId`, `ScalableDimension`,
  /// and `ScheduledActionNames` parameters.
  ///
  /// To create a scheduled action or update an existing one, see
  /// PutScheduledAction. If you are no longer using a scheduled action, you can
  /// delete it using DeleteScheduledAction.
  ///
  /// [scheduledActionNames]: The names of the scheduled actions to describe.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scheduled
  /// action. This string consists of the resource type and unique identifier.
  /// If you specify a scalable dimension, you must also specify a resource ID.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property. If you specify a
  /// scalable dimension, you must also specify a resource ID.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [maxResults]: The maximum number of scheduled action results. This value
  /// can be between 1 and 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to `MaxResults`
  /// results at a time, along with a `NextToken` value. To get the next set of
  /// results, include the `NextToken` value in a subsequent call. If this
  /// parameter is not used, the operation returns up to 50 results and a
  /// `NextToken` value, if applicable.
  ///
  /// [nextToken]: The token for the next set of results.
  Future<DescribeScheduledActionsResponse> describeScheduledActions(
      String serviceNamespace,
      {List<String> scheduledActionNames,
      String resourceId,
      String scalableDimension,
      int maxResults,
      String nextToken}) async {
    var response_ = await _client.send('DescribeScheduledActions', {
      if (scheduledActionNames != null)
        'ScheduledActionNames': scheduledActionNames,
      'ServiceNamespace': serviceNamespace,
      if (resourceId != null) 'ResourceId': resourceId,
      if (scalableDimension != null) 'ScalableDimension': scalableDimension,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScheduledActionsResponse.fromJson(response_);
  }

  /// Creates or updates a policy for an Application Auto Scaling scalable
  /// target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scaling policy applies to the scalable target
  /// identified by those three attributes. You cannot create a scaling policy
  /// until you have registered the resource as a scalable target using
  /// RegisterScalableTarget.
  ///
  /// To update a policy, specify its policy name and the parameters that you
  /// want to change. Any parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scaling policies for a service namespace using
  /// DescribeScalingPolicies. If you are no longer using a scaling policy, you
  /// can delete it using DeleteScalingPolicy.
  ///
  /// Multiple scaling policies can be in force at the same time for the same
  /// scalable target. You can have one or more target tracking scaling
  /// policies, one or more step scaling policies, or both. However, there is a
  /// chance that multiple policies could conflict, instructing the scalable
  /// target to scale out or in at the same time. Application Auto Scaling gives
  /// precedence to the policy that provides the largest capacity for both scale
  /// in and scale out. For example, if one policy increases capacity by 3,
  /// another policy increases capacity by 200 percent, and the current capacity
  /// is 10, Application Auto Scaling uses the policy with the highest
  /// calculated capacity (200% of 10 = 20) and scales out to 30.
  ///
  /// Learn more about how to work with scaling policies in the
  /// [Application Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
  ///
  /// [policyName]: The name of the scaling policy.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource associated with the scaling
  /// policy. This string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [policyType]: The policy type. This parameter is required if you are
  /// creating a scaling policy.
  ///
  /// The following policy types are supported:
  ///
  ///  `TargetTrackingScaling`—Not supported for Amazon EMR or AppStream
  ///
  ///  `StepScaling`—Not supported for Amazon DynamoDB
  ///
  /// For more information, see
  /// [Step Scaling Policies for Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html)
  /// and
  /// [Target Tracking Scaling Policies for Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html)
  /// in the _Application Auto Scaling User Guide_.
  ///
  /// [stepScalingPolicyConfiguration]: A step scaling policy.
  ///
  /// This parameter is required if you are creating a policy and the policy
  /// type is `StepScaling`.
  ///
  /// [targetTrackingScalingPolicyConfiguration]: A target tracking scaling
  /// policy. Includes support for predefined or customized metrics.
  ///
  /// This parameter is required if you are creating a policy and the policy
  /// type is `TargetTrackingScaling`.
  Future<PutScalingPolicyResponse> putScalingPolicy(
      {@required String policyName,
      @required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension,
      String policyType,
      StepScalingPolicyConfiguration stepScalingPolicyConfiguration,
      TargetTrackingScalingPolicyConfiguration
          targetTrackingScalingPolicyConfiguration}) async {
    var response_ = await _client.send('PutScalingPolicy', {
      'PolicyName': policyName,
      'ServiceNamespace': serviceNamespace,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
      if (policyType != null) 'PolicyType': policyType,
      if (stepScalingPolicyConfiguration != null)
        'StepScalingPolicyConfiguration': stepScalingPolicyConfiguration,
      if (targetTrackingScalingPolicyConfiguration != null)
        'TargetTrackingScalingPolicyConfiguration':
            targetTrackingScalingPolicyConfiguration,
    });
    return PutScalingPolicyResponse.fromJson(response_);
  }

  /// Creates or updates a scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scheduled action applies to the scalable target
  /// identified by those three attributes. You cannot create a scheduled action
  /// until you have registered the resource as a scalable target using
  /// RegisterScalableTarget.
  ///
  /// To update an action, specify its name and the parameters that you want to
  /// change. If you don't specify start and end times, the old values are
  /// deleted. Any other parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scheduled actions using DescribeScheduledActions. If you
  /// are no longer using a scheduled action, you can delete it using
  /// DeleteScheduledAction.
  ///
  /// Learn more about how to work with scheduled actions in the
  /// [Application Auto Scaling User Guide](https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html).
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [schedule]: The schedule for this action. The following formats are
  /// supported:
  ///
  /// *   At expressions - "`at(_yyyy_-_mm_-_dd_T_hh_:_mm_:_ss_)`"
  ///
  /// *   Rate expressions - "`rate(_value_ _unit_)`"
  ///
  /// *   Cron expressions - "`cron(_fields_)`"
  ///
  ///
  /// At expressions are useful for one-time schedules. Specify the time, in
  /// UTC.
  ///
  /// For rate expressions, _value_ is a positive integer and _unit_ is `minute`
  /// | `minutes` | `hour` | `hours` | `day` | `days`.
  ///
  /// For more information about cron expressions, see
  /// [Cron Expressions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions)
  /// in the _Amazon CloudWatch Events User Guide_.
  ///
  /// [scheduledActionName]: The name of the scheduled action.
  ///
  /// [resourceId]: The identifier of the resource associated with the scheduled
  /// action. This string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension. This string consists of the
  /// service namespace, resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [startTime]: The date and time for the scheduled action to start.
  ///
  /// [endTime]: The date and time for the scheduled action to end.
  ///
  /// [scalableTargetAction]: The new minimum and maximum capacity. You can set
  /// both values or just one. During the scheduled time, if the current
  /// capacity is below the minimum capacity, Application Auto Scaling scales
  /// out to the minimum capacity. If the current capacity is above the maximum
  /// capacity, Application Auto Scaling scales in to the maximum capacity.
  Future<PutScheduledActionResponse> putScheduledAction(
      {@required String serviceNamespace,
      String schedule,
      @required String scheduledActionName,
      @required String resourceId,
      @required String scalableDimension,
      DateTime startTime,
      DateTime endTime,
      ScalableTargetAction scalableTargetAction}) async {
    var response_ = await _client.send('PutScheduledAction', {
      'ServiceNamespace': serviceNamespace,
      if (schedule != null) 'Schedule': schedule,
      'ScheduledActionName': scheduledActionName,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (scalableTargetAction != null)
        'ScalableTargetAction': scalableTargetAction,
    });
    return PutScheduledActionResponse.fromJson(response_);
  }

  /// Registers or updates a scalable target. A scalable target is a resource
  /// that Application Auto Scaling can scale out and scale in. Scalable targets
  /// are uniquely identified by the combination of resource ID, scalable
  /// dimension, and namespace.
  ///
  /// When you register a new scalable target, you must specify values for
  /// minimum and maximum capacity. Application Auto Scaling will not scale
  /// capacity to values that are outside of this range.
  ///
  /// To update a scalable target, specify the parameter that you want to change
  /// as well as the following parameters that identify the scalable target:
  /// resource ID, scalable dimension, and namespace. Any parameters that you
  /// don't specify are not changed by this update request.
  ///
  /// After you register a scalable target, you do not need to register it again
  /// to use other Application Auto Scaling operations. To see which resources
  /// have been registered, use DescribeScalableTargets. You can also view the
  /// scaling policies for a service namespace by using DescribeScalableTargets.
  ///
  /// If you no longer need a scalable target, you can deregister it by using
  /// DeregisterScalableTarget.
  ///
  /// [serviceNamespace]: The namespace of the AWS service that provides the
  /// resource or `custom-resource` for a resource provided by your own
  /// application or service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  ///
  /// [resourceId]: The identifier of the resource that is associated with the
  /// scalable target. This string consists of the resource type and unique
  /// identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  ///
  /// [scalableDimension]: The scalable dimension associated with the scalable
  /// target. This string consists of the service namespace, resource type, and
  /// scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  ///
  /// [minCapacity]: The minimum value to scale to in response to a scale-in
  /// event. `MinCapacity` is required to register a scalable target.
  ///
  /// [maxCapacity]: The maximum value to scale to in response to a scale-out
  /// event. `MaxCapacity` is required to register a scalable target.
  ///
  /// [roleArn]: Application Auto Scaling creates a service-linked role that
  /// grants it permissions to modify the scalable target on your behalf. For
  /// more information, see
  /// [Service-Linked Roles for Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-service-linked-roles.html).
  ///
  /// For resources that are not supported using a service-linked role, this
  /// parameter is required, and it must specify the ARN of an IAM role that
  /// allows Application Auto Scaling to modify the scalable target on your
  /// behalf.
  ///
  /// [suspendedState]: An embedded object that contains attributes and
  /// attribute values that are used to suspend and resume automatic scaling.
  /// Setting the value of an attribute to `true` suspends the specified scaling
  /// activities. Setting it to `false` (default) resumes the specified scaling
  /// activities.
  ///
  ///  **Suspension Outcomes**
  ///
  /// *   For `DynamicScalingInSuspended`, while a suspension is in effect, all
  /// scale-in activities that are triggered by a scaling policy are suspended.
  ///
  /// *   For `DynamicScalingOutSuspended`, while a suspension is in effect, all
  /// scale-out activities that are triggered by a scaling policy are suspended.
  ///
  /// *   For `ScheduledScalingSuspended`, while a suspension is in effect, all
  /// scaling activities that involve scheduled actions are suspended.
  ///
  ///
  /// For more information, see
  /// [Suspend and Resume Application Auto Scaling](https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html)
  /// in the _Application Auto Scaling User Guide_.
  Future<RegisterScalableTargetResponse> registerScalableTarget(
      {@required String serviceNamespace,
      @required String resourceId,
      @required String scalableDimension,
      int minCapacity,
      int maxCapacity,
      String roleArn,
      SuspendedState suspendedState}) async {
    var response_ = await _client.send('RegisterScalableTarget', {
      'ServiceNamespace': serviceNamespace,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension,
      if (minCapacity != null) 'MinCapacity': minCapacity,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (roleArn != null) 'RoleARN': roleArn,
      if (suspendedState != null) 'SuspendedState': suspendedState,
    });
    return RegisterScalableTargetResponse.fromJson(response_);
  }
}

/// Represents a CloudWatch alarm associated with a scaling policy.
class Alarm {
  /// The name of the alarm.
  final String alarmName;

  /// The Amazon Resource Name (ARN) of the alarm.
  final String alarmArn;

  Alarm({
    @required this.alarmName,
    @required this.alarmArn,
  });
  static Alarm fromJson(Map<String, dynamic> json) => Alarm(
        alarmName: json['AlarmName'] as String,
        alarmArn: json['AlarmARN'] as String,
      );
}

/// Represents a CloudWatch metric of your choosing for a target tracking
/// scaling policy to use with Application Auto Scaling.
///
/// To create your customized metric specification:
///
/// *   Add values for each required parameter from CloudWatch. You can use an
/// existing metric, or a new metric that you create. To use your own metric,
/// you must first publish the metric to CloudWatch. For more information, see
/// [Publish Custom Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
/// in the _Amazon CloudWatch User Guide_.
///
/// *   Choose a metric that changes proportionally with capacity. The value of
/// the metric should increase or decrease in inverse proportion to the number
/// of capacity units. That is, the value of the metric should decrease when
/// capacity increases.
///
///
/// For more information about CloudWatch, see
/// [Amazon CloudWatch Concepts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html).
class CustomizedMetricSpecification {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must
  /// specify the same dimensions in your scaling policy.
  final List<MetricDimension> dimensions;

  /// The statistic of the metric.
  final String statistic;

  /// The unit of the metric.
  final String unit;

  CustomizedMetricSpecification({
    @required this.metricName,
    @required this.namespace,
    this.dimensions,
    @required this.statistic,
    this.unit,
  });
  static CustomizedMetricSpecification fromJson(Map<String, dynamic> json) =>
      CustomizedMetricSpecification(
        metricName: json['MetricName'] as String,
        namespace: json['Namespace'] as String,
        dimensions: json.containsKey('Dimensions')
            ? (json['Dimensions'] as List)
                .map((e) => MetricDimension.fromJson(e))
                .toList()
            : null,
        statistic: json['Statistic'] as String,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class DeleteScalingPolicyResponse {
  DeleteScalingPolicyResponse();
  static DeleteScalingPolicyResponse fromJson(Map<String, dynamic> json) =>
      DeleteScalingPolicyResponse();
}

class DeleteScheduledActionResponse {
  DeleteScheduledActionResponse();
  static DeleteScheduledActionResponse fromJson(Map<String, dynamic> json) =>
      DeleteScheduledActionResponse();
}

class DeregisterScalableTargetResponse {
  DeregisterScalableTargetResponse();
  static DeregisterScalableTargetResponse fromJson(Map<String, dynamic> json) =>
      DeregisterScalableTargetResponse();
}

class DescribeScalableTargetsResponse {
  /// The scalable targets that match the request parameters.
  final List<ScalableTarget> scalableTargets;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScalableTargetsResponse({
    this.scalableTargets,
    this.nextToken,
  });
  static DescribeScalableTargetsResponse fromJson(Map<String, dynamic> json) =>
      DescribeScalableTargetsResponse(
        scalableTargets: json.containsKey('ScalableTargets')
            ? (json['ScalableTargets'] as List)
                .map((e) => ScalableTarget.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeScalingActivitiesResponse {
  /// A list of scaling activity objects.
  final List<ScalingActivity> scalingActivities;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScalingActivitiesResponse({
    this.scalingActivities,
    this.nextToken,
  });
  static DescribeScalingActivitiesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeScalingActivitiesResponse(
        scalingActivities: json.containsKey('ScalingActivities')
            ? (json['ScalingActivities'] as List)
                .map((e) => ScalingActivity.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeScalingPoliciesResponse {
  /// Information about the scaling policies.
  final List<ScalingPolicy> scalingPolicies;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScalingPoliciesResponse({
    this.scalingPolicies,
    this.nextToken,
  });
  static DescribeScalingPoliciesResponse fromJson(Map<String, dynamic> json) =>
      DescribeScalingPoliciesResponse(
        scalingPolicies: json.containsKey('ScalingPolicies')
            ? (json['ScalingPolicies'] as List)
                .map((e) => ScalingPolicy.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeScheduledActionsResponse {
  /// Information about the scheduled actions.
  final List<ScheduledAction> scheduledActions;

  /// The token required to get the next set of results. This value is `null` if
  /// there are no more results to return.
  final String nextToken;

  DescribeScheduledActionsResponse({
    this.scheduledActions,
    this.nextToken,
  });
  static DescribeScheduledActionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeScheduledActionsResponse(
        scheduledActions: json.containsKey('ScheduledActions')
            ? (json['ScheduledActions'] as List)
                .map((e) => ScheduledAction.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Describes the dimension names and values associated with a metric.
class MetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  MetricDimension({
    @required this.name,
    @required this.value,
  });
  static MetricDimension fromJson(Map<String, dynamic> json) => MetricDimension(
        name: json['Name'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a predefined metric for a target tracking scaling policy to use
/// with Application Auto Scaling.
class PredefinedMetricSpecification {
  /// The metric type. The `ALBRequestCountPerTarget` metric type applies only
  /// to Spot Fleet requests and ECS services.
  final String predefinedMetricType;

  /// Identifies the resource associated with the metric type. You can't specify
  /// a resource label unless the metric type is `ALBRequestCountPerTarget` and
  /// there is a target group attached to the Spot Fleet request or ECS service.
  ///
  /// The format is
  /// app/<load-balancer-name>/<load-balancer-id>/targetgroup/<target-group-name>/<target-group-id>,
  /// where:
  ///
  /// *   app/<load-balancer-name>/<load-balancer-id> is the final portion of
  /// the load balancer ARN
  ///
  /// *   targetgroup/<target-group-name>/<target-group-id> is the final portion
  /// of the target group ARN.
  final String resourceLabel;

  PredefinedMetricSpecification({
    @required this.predefinedMetricType,
    this.resourceLabel,
  });
  static PredefinedMetricSpecification fromJson(Map<String, dynamic> json) =>
      PredefinedMetricSpecification(
        predefinedMetricType: json['PredefinedMetricType'] as String,
        resourceLabel: json.containsKey('ResourceLabel')
            ? json['ResourceLabel'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutScalingPolicyResponse {
  /// The Amazon Resource Name (ARN) of the resulting scaling policy.
  final String policyArn;

  /// The CloudWatch alarms created for the target tracking scaling policy.
  final List<Alarm> alarms;

  PutScalingPolicyResponse({
    @required this.policyArn,
    this.alarms,
  });
  static PutScalingPolicyResponse fromJson(Map<String, dynamic> json) =>
      PutScalingPolicyResponse(
        policyArn: json['PolicyARN'] as String,
        alarms: json.containsKey('Alarms')
            ? (json['Alarms'] as List).map((e) => Alarm.fromJson(e)).toList()
            : null,
      );
}

class PutScheduledActionResponse {
  PutScheduledActionResponse();
  static PutScheduledActionResponse fromJson(Map<String, dynamic> json) =>
      PutScheduledActionResponse();
}

class RegisterScalableTargetResponse {
  RegisterScalableTargetResponse();
  static RegisterScalableTargetResponse fromJson(Map<String, dynamic> json) =>
      RegisterScalableTargetResponse();
}

/// Represents a scalable target.
class ScalableTarget {
  /// The namespace of the AWS service that provides the resource or
  /// `custom-resource` for a resource provided by your own application or
  /// service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  final String serviceNamespace;

  /// The identifier of the resource associated with the scalable target. This
  /// string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  final String resourceId;

  /// The scalable dimension associated with the scalable target. This string
  /// consists of the service namespace, resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  final String scalableDimension;

  /// The minimum value to scale to in response to a scale-in event.
  final int minCapacity;

  /// The maximum value to scale to in response to a scale-out event.
  final int maxCapacity;

  /// The ARN of an IAM role that allows Application Auto Scaling to modify the
  /// scalable target on your behalf.
  final String roleArn;

  /// The Unix timestamp for when the scalable target was created.
  final DateTime creationTime;

  final SuspendedState suspendedState;

  ScalableTarget({
    @required this.serviceNamespace,
    @required this.resourceId,
    @required this.scalableDimension,
    @required this.minCapacity,
    @required this.maxCapacity,
    @required this.roleArn,
    @required this.creationTime,
    this.suspendedState,
  });
  static ScalableTarget fromJson(Map<String, dynamic> json) => ScalableTarget(
        serviceNamespace: json['ServiceNamespace'] as String,
        resourceId: json['ResourceId'] as String,
        scalableDimension: json['ScalableDimension'] as String,
        minCapacity: json['MinCapacity'] as int,
        maxCapacity: json['MaxCapacity'] as int,
        roleArn: json['RoleARN'] as String,
        creationTime: DateTime.parse(json['CreationTime']),
        suspendedState: json.containsKey('SuspendedState')
            ? SuspendedState.fromJson(json['SuspendedState'])
            : null,
      );
}

/// Represents the minimum and maximum capacity for a scheduled action.
class ScalableTargetAction {
  /// The minimum capacity.
  final int minCapacity;

  /// The maximum capacity.
  final int maxCapacity;

  ScalableTargetAction({
    this.minCapacity,
    this.maxCapacity,
  });
  static ScalableTargetAction fromJson(Map<String, dynamic> json) =>
      ScalableTargetAction(
        minCapacity:
            json.containsKey('MinCapacity') ? json['MinCapacity'] as int : null,
        maxCapacity:
            json.containsKey('MaxCapacity') ? json['MaxCapacity'] as int : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a scaling activity.
class ScalingActivity {
  /// The unique identifier of the scaling activity.
  final String activityId;

  /// The namespace of the AWS service that provides the resource or
  /// `custom-resource` for a resource provided by your own application or
  /// service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  final String serviceNamespace;

  /// The identifier of the resource associated with the scaling activity. This
  /// string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  final String resourceId;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  final String scalableDimension;

  /// A simple description of what action the scaling activity intends to
  /// accomplish.
  final String description;

  /// A simple description of what caused the scaling activity to happen.
  final String cause;

  /// The Unix timestamp for when the scaling activity began.
  final DateTime startTime;

  /// The Unix timestamp for when the scaling activity ended.
  final DateTime endTime;

  /// Indicates the status of the scaling activity.
  final String statusCode;

  /// A simple message about the current status of the scaling activity.
  final String statusMessage;

  /// The details about the scaling activity.
  final String details;

  ScalingActivity({
    @required this.activityId,
    @required this.serviceNamespace,
    @required this.resourceId,
    @required this.scalableDimension,
    @required this.description,
    @required this.cause,
    @required this.startTime,
    this.endTime,
    @required this.statusCode,
    this.statusMessage,
    this.details,
  });
  static ScalingActivity fromJson(Map<String, dynamic> json) => ScalingActivity(
        activityId: json['ActivityId'] as String,
        serviceNamespace: json['ServiceNamespace'] as String,
        resourceId: json['ResourceId'] as String,
        scalableDimension: json['ScalableDimension'] as String,
        description: json['Description'] as String,
        cause: json['Cause'] as String,
        startTime: DateTime.parse(json['StartTime']),
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        statusCode: json['StatusCode'] as String,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        details: json.containsKey('Details') ? json['Details'] as String : null,
      );
}

/// Represents a scaling policy to use with Application Auto Scaling.
class ScalingPolicy {
  /// The Amazon Resource Name (ARN) of the scaling policy.
  final String policyArn;

  /// The name of the scaling policy.
  final String policyName;

  /// The namespace of the AWS service that provides the resource or
  /// `custom-resource` for a resource provided by your own application or
  /// service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  final String serviceNamespace;

  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  final String resourceId;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  final String scalableDimension;

  /// The scaling policy type.
  final String policyType;

  /// A step scaling policy.
  final StepScalingPolicyConfiguration stepScalingPolicyConfiguration;

  /// A target tracking scaling policy.
  final TargetTrackingScalingPolicyConfiguration
      targetTrackingScalingPolicyConfiguration;

  /// The CloudWatch alarms associated with the scaling policy.
  final List<Alarm> alarms;

  /// The Unix timestamp for when the scaling policy was created.
  final DateTime creationTime;

  ScalingPolicy({
    @required this.policyArn,
    @required this.policyName,
    @required this.serviceNamespace,
    @required this.resourceId,
    @required this.scalableDimension,
    @required this.policyType,
    this.stepScalingPolicyConfiguration,
    this.targetTrackingScalingPolicyConfiguration,
    this.alarms,
    @required this.creationTime,
  });
  static ScalingPolicy fromJson(Map<String, dynamic> json) => ScalingPolicy(
        policyArn: json['PolicyARN'] as String,
        policyName: json['PolicyName'] as String,
        serviceNamespace: json['ServiceNamespace'] as String,
        resourceId: json['ResourceId'] as String,
        scalableDimension: json['ScalableDimension'] as String,
        policyType: json['PolicyType'] as String,
        stepScalingPolicyConfiguration:
            json.containsKey('StepScalingPolicyConfiguration')
                ? StepScalingPolicyConfiguration.fromJson(
                    json['StepScalingPolicyConfiguration'])
                : null,
        targetTrackingScalingPolicyConfiguration:
            json.containsKey('TargetTrackingScalingPolicyConfiguration')
                ? TargetTrackingScalingPolicyConfiguration.fromJson(
                    json['TargetTrackingScalingPolicyConfiguration'])
                : null,
        alarms: json.containsKey('Alarms')
            ? (json['Alarms'] as List).map((e) => Alarm.fromJson(e)).toList()
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
      );
}

/// Represents a scheduled action.
class ScheduledAction {
  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The Amazon Resource Name (ARN) of the scheduled action.
  final String scheduledActionArn;

  /// The namespace of the AWS service that provides the resource or
  /// `custom-resource` for a resource provided by your own application or
  /// service. For more information, see
  /// [AWS Service Namespaces](http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces)
  /// in the _Amazon Web Services General Reference_.
  final String serviceNamespace;

  /// The schedule for this action. The following formats are supported:
  ///
  /// *   At expressions - "`at(_yyyy_-_mm_-_dd_T_hh_:_mm_:_ss_)`"
  ///
  /// *   Rate expressions - "`rate(_value_ _unit_)`"
  ///
  /// *   Cron expressions - "`cron(_fields_)`"
  ///
  ///
  /// At expressions are useful for one-time schedules. Specify the time, in
  /// UTC.
  ///
  /// For rate expressions, _value_ is a positive integer and _unit_ is `minute`
  /// | `minutes` | `hour` | `hours` | `day` | `days`.
  ///
  /// For more information about cron expressions, see
  /// [Cron Expressions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions)
  /// in the _Amazon CloudWatch Events User Guide_.
  final String schedule;

  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// *   ECS service - The resource type is `service` and the unique identifier
  /// is the cluster name and service name. Example:
  /// `service/default/sample-webapp`.
  ///
  /// *   Spot Fleet request - The resource type is `spot-fleet-request` and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// `spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE`.
  ///
  /// *   EMR cluster - The resource type is `instancegroup` and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// `instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0`.
  ///
  /// *   AppStream 2.0 fleet - The resource type is `fleet` and the unique
  /// identifier is the fleet name. Example: `fleet/sample-fleet`.
  ///
  /// *   DynamoDB table - The resource type is `table` and the unique
  /// identifier is the resource ID. Example: `table/my-table`.
  ///
  /// *   DynamoDB global secondary index - The resource type is `index` and the
  /// unique identifier is the resource ID. Example:
  /// `table/my-table/index/my-table-index`.
  ///
  /// *   Aurora DB cluster - The resource type is `cluster` and the unique
  /// identifier is the cluster name. Example: `cluster:my-db-cluster`.
  ///
  /// *   Amazon SageMaker endpoint variants - The resource type is `variant`
  /// and the unique identifier is the resource ID. Example:
  /// `endpoint/my-end-point/variant/KMeansClustering`.
  ///
  /// *   Custom resources are not supported with a resource type. This
  /// parameter must specify the `OutputValue` from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our
  /// [GitHub repository](https://github.com/aws/aws-auto-scaling-custom-resource).
  final String resourceId;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// *    `ecs:service:DesiredCount` - The desired task count of an ECS
  /// service.
  ///
  /// *    `ec2:spot-fleet-request:TargetCapacity` - The target capacity of a
  /// Spot Fleet request.
  ///
  /// *    `elasticmapreduce:instancegroup:InstanceCount` - The instance count
  /// of an EMR Instance Group.
  ///
  /// *    `appstream:fleet:DesiredCapacity` - The desired capacity of an
  /// AppStream 2.0 fleet.
  ///
  /// *    `dynamodb:table:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:table:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB table.
  ///
  /// *    `dynamodb:index:ReadCapacityUnits` - The provisioned read capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `dynamodb:index:WriteCapacityUnits` - The provisioned write capacity
  /// for a DynamoDB global secondary index.
  ///
  /// *    `rds:cluster:ReadReplicaCount` - The count of Aurora Replicas in an
  /// Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  ///
  /// *    `sagemaker:variant:DesiredInstanceCount` - The number of EC2
  /// instances for an Amazon SageMaker model endpoint variant.
  ///
  /// *    `custom-resource:ResourceType:Property` - The scalable dimension for
  /// a custom resource provided by your own application or service.
  final String scalableDimension;

  /// The date and time that the action is scheduled to begin.
  final DateTime startTime;

  /// The date and time that the action is scheduled to end.
  final DateTime endTime;

  /// The new minimum and maximum capacity. You can set both values or just one.
  /// During the scheduled time, if the current capacity is below the minimum
  /// capacity, Application Auto Scaling scales out to the minimum capacity. If
  /// the current capacity is above the maximum capacity, Application Auto
  /// Scaling scales in to the maximum capacity.
  final ScalableTargetAction scalableTargetAction;

  /// The date and time that the scheduled action was created.
  final DateTime creationTime;

  ScheduledAction({
    @required this.scheduledActionName,
    @required this.scheduledActionArn,
    @required this.serviceNamespace,
    @required this.schedule,
    @required this.resourceId,
    this.scalableDimension,
    this.startTime,
    this.endTime,
    this.scalableTargetAction,
    @required this.creationTime,
  });
  static ScheduledAction fromJson(Map<String, dynamic> json) => ScheduledAction(
        scheduledActionName: json['ScheduledActionName'] as String,
        scheduledActionArn: json['ScheduledActionARN'] as String,
        serviceNamespace: json['ServiceNamespace'] as String,
        schedule: json['Schedule'] as String,
        resourceId: json['ResourceId'] as String,
        scalableDimension: json.containsKey('ScalableDimension')
            ? json['ScalableDimension'] as String
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        scalableTargetAction: json.containsKey('ScalableTargetAction')
            ? ScalableTargetAction.fromJson(json['ScalableTargetAction'])
            : null,
        creationTime: DateTime.parse(json['CreationTime']),
      );
}

/// Represents a step adjustment for a StepScalingPolicyConfiguration. Describes
/// an adjustment based on the difference between the value of the aggregated
/// CloudWatch metric and the breach threshold that you've defined for the
/// alarm.
///
/// For the following examples, suppose that you have an alarm with a breach
/// threshold of 50:
///
/// *   To trigger the adjustment when the metric is greater than or equal to 50
/// and less than 60, specify a lower bound of 0 and an upper bound of 10.
///
/// *   To trigger the adjustment when the metric is greater than 40 and less
/// than or equal to 50, specify a lower bound of -10 and an upper bound of 0.
///
///
/// There are a few rules for the step adjustments for your step policy:
///
/// *   The ranges of your step adjustments can't overlap or have a gap.
///
/// *   At most one step adjustment can have a null lower bound. If one step
/// adjustment has a negative lower bound, then there must be a step adjustment
/// with a null lower bound.
///
/// *   At most one step adjustment can have a null upper bound. If one step
/// adjustment has a positive upper bound, then there must be a step adjustment
/// with a null upper bound.
///
/// *   The upper and lower bound can't be null in the same step adjustment.
class StepAdjustment {
  /// The lower bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// lower bound is inclusive (the metric must be greater than or equal to the
  /// threshold plus the lower bound). Otherwise, it is exclusive (the metric
  /// must be greater than the threshold plus the lower bound). A null value
  /// indicates negative infinity.
  final double metricIntervalLowerBound;

  /// The upper bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// upper bound is exclusive (the metric must be less than the threshold plus
  /// the upper bound). Otherwise, it is inclusive (the metric must be less than
  /// or equal to the threshold plus the upper bound). A null value indicates
  /// positive infinity.
  ///
  /// The upper bound must be greater than the lower bound.
  final double metricIntervalUpperBound;

  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current scalable dimension while a negative
  /// number removes from the current scalable dimension.
  final int scalingAdjustment;

  StepAdjustment({
    this.metricIntervalLowerBound,
    this.metricIntervalUpperBound,
    @required this.scalingAdjustment,
  });
  static StepAdjustment fromJson(Map<String, dynamic> json) => StepAdjustment(
        metricIntervalLowerBound: json.containsKey('MetricIntervalLowerBound')
            ? json['MetricIntervalLowerBound'] as double
            : null,
        metricIntervalUpperBound: json.containsKey('MetricIntervalUpperBound')
            ? json['MetricIntervalUpperBound'] as double
            : null,
        scalingAdjustment: json['ScalingAdjustment'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a step scaling policy configuration to use with Application Auto
/// Scaling.
class StepScalingPolicyConfiguration {
  /// Specifies whether the `ScalingAdjustment` value in a StepAdjustment is an
  /// absolute number or a percentage of the current capacity.
  final String adjustmentType;

  /// A set of adjustments that enable you to scale based on the size of the
  /// alarm breach.
  final List<StepAdjustment> stepAdjustments;

  /// The minimum number to adjust your scalable dimension as a result of a
  /// scaling activity. If the adjustment type is `PercentChangeInCapacity`, the
  /// scaling policy changes the scalable dimension of the scalable target by
  /// this amount.
  ///
  /// For example, suppose that you create a step scaling policy to scale out an
  /// Amazon ECS service by 25 percent and you specify a
  /// `MinAdjustmentMagnitude` of 2. If the service has 4 tasks and the scaling
  /// policy is performed, 25 percent of 4 is 1. However, because you specified
  /// a `MinAdjustmentMagnitude` of 2, Application Auto Scaling scales out the
  /// service by 2 tasks.
  final int minAdjustmentMagnitude;

  /// The amount of time, in seconds, after a scaling activity completes where
  /// previous trigger-related scaling activities can influence future scaling
  /// events.
  ///
  /// For scale-out policies, while the cooldown period is in effect, the
  /// capacity that has been added by the previous scale-out event that
  /// initiated the cooldown is calculated as part of the desired capacity for
  /// the next scale out. The intention is to continuously (but not excessively)
  /// scale out. For example, an alarm triggers a step scaling policy to scale
  /// out an Amazon ECS service by 2 tasks, the scaling activity completes
  /// successfully, and a cooldown period of 5 minutes starts. During the
  /// cooldown period, if the alarm triggers the same policy again but at a more
  /// aggressive step adjustment to scale out the service by 3 tasks, the 2
  /// tasks that were added in the previous scale-out event are considered part
  /// of that capacity and only 1 additional task is added to the desired count.
  ///
  /// For scale-in policies, the cooldown period is used to block subsequent
  /// scale-in requests until it has expired. The intention is to scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale-out policy during the cooldown period after
  /// a scale-in, Application Auto Scaling scales out your scalable target
  /// immediately.
  final int cooldown;

  /// The aggregation type for the CloudWatch metrics. Valid values are
  /// `Minimum`, `Maximum`, and `Average`. If the aggregation type is null, the
  /// value is treated as `Average`.
  final String metricAggregationType;

  StepScalingPolicyConfiguration({
    this.adjustmentType,
    this.stepAdjustments,
    this.minAdjustmentMagnitude,
    this.cooldown,
    this.metricAggregationType,
  });
  static StepScalingPolicyConfiguration fromJson(Map<String, dynamic> json) =>
      StepScalingPolicyConfiguration(
        adjustmentType: json.containsKey('AdjustmentType')
            ? json['AdjustmentType'] as String
            : null,
        stepAdjustments: json.containsKey('StepAdjustments')
            ? (json['StepAdjustments'] as List)
                .map((e) => StepAdjustment.fromJson(e))
                .toList()
            : null,
        minAdjustmentMagnitude: json.containsKey('MinAdjustmentMagnitude')
            ? json['MinAdjustmentMagnitude'] as int
            : null,
        cooldown: json.containsKey('Cooldown') ? json['Cooldown'] as int : null,
        metricAggregationType: json.containsKey('MetricAggregationType')
            ? json['MetricAggregationType'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies whether the scaling activities for a scalable target are in a
/// suspended state.
class SuspendedState {
  /// Whether scale in by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to `true` if you don't want Application
  /// Auto Scaling to remove capacity when a scaling policy is triggered. The
  /// default is `false`.
  final bool dynamicScalingInSuspended;

  /// Whether scale out by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to `true` if you don't want Application
  /// Auto Scaling to add capacity when a scaling policy is triggered. The
  /// default is `false`.
  final bool dynamicScalingOutSuspended;

  /// Whether scheduled scaling is suspended. Set the value to `true` if you
  /// don't want Application Auto Scaling to add or remove capacity by
  /// initiating scheduled actions. The default is `false`.
  final bool scheduledScalingSuspended;

  SuspendedState({
    this.dynamicScalingInSuspended,
    this.dynamicScalingOutSuspended,
    this.scheduledScalingSuspended,
  });
  static SuspendedState fromJson(Map<String, dynamic> json) => SuspendedState(
        dynamicScalingInSuspended: json.containsKey('DynamicScalingInSuspended')
            ? json['DynamicScalingInSuspended'] as bool
            : null,
        dynamicScalingOutSuspended:
            json.containsKey('DynamicScalingOutSuspended')
                ? json['DynamicScalingOutSuspended'] as bool
                : null,
        scheduledScalingSuspended: json.containsKey('ScheduledScalingSuspended')
            ? json['ScheduledScalingSuspended'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents a target tracking scaling policy configuration to use with
/// Application Auto Scaling.
class TargetTrackingScalingPolicyConfiguration {
  /// The target value for the metric. The range is 8.515920e-109 to
  /// 1.174271e+108 (Base 10) or 2e-360 to 2e360 (Base 2).
  final double targetValue;

  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  final PredefinedMetricSpecification predefinedMetricSpecification;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  final CustomizedMetricSpecification customizedMetricSpecification;

  /// The amount of time, in seconds, after a scale-out activity completes
  /// before another scale-out activity can start.
  ///
  /// While the cooldown period is in effect, the capacity that has been added
  /// by the previous scale-out event that initiated the cooldown is calculated
  /// as part of the desired capacity for the next scale out. The intention is
  /// to continuously (but not excessively) scale out.
  final int scaleOutCooldown;

  /// The amount of time, in seconds, after a scale-in activity completes before
  /// another scale in activity can start.
  ///
  /// The cooldown period is used to block subsequent scale-in requests until it
  /// has expired. The intention is to scale in conservatively to protect your
  /// application's availability. However, if another alarm triggers a scale-out
  /// policy during the cooldown period after a scale-in, Application Auto
  /// Scaling scales out your scalable target immediately.
  final int scaleInCooldown;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is `true`, scale in is disabled and the target
  /// tracking scaling policy won't remove capacity from the scalable resource.
  /// Otherwise, scale in is enabled and the target tracking scaling policy can
  /// remove capacity from the scalable resource. The default value is `false`.
  final bool disableScaleIn;

  TargetTrackingScalingPolicyConfiguration({
    @required this.targetValue,
    this.predefinedMetricSpecification,
    this.customizedMetricSpecification,
    this.scaleOutCooldown,
    this.scaleInCooldown,
    this.disableScaleIn,
  });
  static TargetTrackingScalingPolicyConfiguration fromJson(
          Map<String, dynamic> json) =>
      TargetTrackingScalingPolicyConfiguration(
        targetValue: json['TargetValue'] as double,
        predefinedMetricSpecification:
            json.containsKey('PredefinedMetricSpecification')
                ? PredefinedMetricSpecification.fromJson(
                    json['PredefinedMetricSpecification'])
                : null,
        customizedMetricSpecification:
            json.containsKey('CustomizedMetricSpecification')
                ? CustomizedMetricSpecification.fromJson(
                    json['CustomizedMetricSpecification'])
                : null,
        scaleOutCooldown: json.containsKey('ScaleOutCooldown')
            ? json['ScaleOutCooldown'] as int
            : null,
        scaleInCooldown: json.containsKey('ScaleInCooldown')
            ? json['ScaleInCooldown'] as int
            : null,
        disableScaleIn: json.containsKey('DisableScaleIn')
            ? json['DisableScaleIn'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
