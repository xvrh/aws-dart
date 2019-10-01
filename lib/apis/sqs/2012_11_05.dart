import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Welcome to the _Amazon Simple Queue Service API Reference_.
///
/// Amazon Simple Queue Service (Amazon SQS) is a reliable, highly-scalable
/// hosted queue for storing messages as they travel between applications or
/// microservices. Amazon SQS moves data between distributed application
/// components and helps you decouple these components.
///
/// You can use [AWS SDKs](http://aws.amazon.com/tools/#sdk) to access Amazon
/// SQS using your favorite programming language. The SDKs perform tasks such as
/// the following automatically:
///
/// *   Cryptographically sign your service requests
///
/// *   Retry requests
///
/// *   Handle error responses
///
///
///  **Additional Information**
///
/// *    [Amazon SQS Product Page](http://aws.amazon.com/sqs/)
///
/// *    _Amazon Simple Queue Service Developer Guide_
///
///     *
/// [Making API Requests](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html)
///
///     *
/// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
///
///     *
/// [Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
///
///
/// *
/// [Amazon SQS in the _AWS CLI Command Reference_](http://docs.aws.amazon.com/cli/latest/reference/sqs/index.html)
///
///
/// *    _Amazon Web Services General Reference_
///
///     *
/// [Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sqs_region)
class SqsApi {
  final _client;
  SqsApi(client) : _client = client.configured('SQS', serializer: 'query');

  /// Adds a permission to a queue for a specific
  /// [principal](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P).
  /// This allows sharing access to the queue.
  ///
  /// When you create a queue, you have full control access rights for the
  /// queue. Only you, the owner of the queue, can grant or deny permissions to
  /// the queue. For more information about these permissions, see
  /// [Allow Developers to Write Messages to a Shared Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///   *    `AddPermission` generates a policy for you. You can use
  /// `SetQueueAttributes`  to upload your policy. For more information, see
  /// [Using Custom Policies with the Amazon SQS Access Policy Language](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   An Amazon SQS policy can have a maximum of 7 actions.
  ///
  /// *   To remove the ability to change queue permissions, you must deny
  /// permission to the `AddPermission`, `RemovePermission`, and
  /// `SetQueueAttributes` actions in your IAM policy.
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue to which permissions are
  /// added.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [label]: The unique identification of the permission you're setting (for
  /// example, `AliceSendMessage`). Maximum 80 characters. Allowed characters
  /// include alphanumeric characters, hyphens (`-`), and underscores (`_`).
  ///
  /// [awsAccountIds]: The AWS account number of the
  /// [principal](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P)
  /// who is given permission. The principal must have an AWS account, but does
  /// not need to be signed up for Amazon SQS. For information about locating
  /// the AWS account identification, see
  /// [Your AWS Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html#sqs-api-request-authentication)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [actions]: The action the client wants to allow for the specified
  /// principal. Valid values: the name of any action or `*`.
  ///
  /// For more information about these actions, see
  /// [Overview of Managing Access Permissions to Your Amazon Simple Queue Service Resource](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-overview-of-managing-access.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// Specifying `SendMessage`, `DeleteMessage`, or `ChangeMessageVisibility`
  /// for `ActionName.n` also grants permissions for the corresponding batch
  /// versions of those actions: `SendMessageBatch`, `DeleteMessageBatch`, and
  /// `ChangeMessageVisibilityBatch`.
  Future<void> addPermission(
      {@required String queueUrl,
      @required String label,
      @required List<String> awsAccountIds,
      @required List<String> actions}) async {
    await _client.send('AddPermission', {
      'QueueUrl': queueUrl,
      'Label': label,
      'AWSAccountIds': awsAccountIds,
      'Actions': actions,
    });
  }

  /// Changes the visibility timeout of a specified message in a queue to a new
  /// value. The default visibility timeout for a message is 30 seconds. The
  /// minimum is 0 seconds. The maximum is 12 hours. For more information, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// For example, you have a message with a visibility timeout of 5 minutes.
  /// After 3 minutes, you call `ChangeMessageVisibility` with a timeout of 10
  /// minutes. You can continue to call `ChangeMessageVisibility` to extend the
  /// visibility timeout to the maximum allowed time. If you try to extend the
  /// visibility timeout beyond the maximum, your request is rejected.
  ///
  /// An Amazon SQS message has three basic states:
  ///
  /// 1.  Sent to a queue by a producer.
  ///
  /// 2.  Received from the queue by a consumer.
  ///
  /// 3.  Deleted from the queue.
  ///
  ///
  /// A message is considered to be _stored_ after it is sent to a queue by a
  /// producer, but not yet received from the queue by a consumer (that is,
  /// between states 1 and 2). There is no limit to the number of stored
  /// messages. A message is considered to be _in flight_ after it is received
  /// from a queue by a consumer, but not yet deleted from the queue (that is,
  /// between states 2 and 3). There is a limit to the number of inflight
  /// messages.
  ///
  /// Limits that apply to inflight messages are unrelated to the _unlimited_
  /// number of stored messages.
  ///
  /// For most standard queues (depending on queue traffic and message backlog),
  /// there can be a maximum of approximately 120,000 inflight messages
  /// (received from a queue by a consumer, but not yet deleted from the queue).
  /// If you reach this limit, Amazon SQS returns the `OverLimit` error message.
  /// To avoid reaching the limit, you should delete messages from the queue
  /// after they're processed. You can also increase the number of queues you
  /// use to process your messages. To request a limit increase,
  /// [file a support request](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs).
  ///
  /// For FIFO queues, there can be a maximum of 20,000 inflight messages
  /// (received from a queue by a consumer, but not yet deleted from the queue).
  /// If you reach this limit, Amazon SQS returns no error messages.
  ///
  ///
  ///
  /// If you attempt to set the `VisibilityTimeout` to a value greater than the
  /// maximum time left, Amazon SQS returns an error. Amazon SQS doesn't
  /// automatically recalculate and increase the timeout to the maximum
  /// remaining time.
  ///
  /// Unlike with a queue, when you change the visibility timeout for a specific
  /// message the timeout value is applied immediately but isn't saved in memory
  /// for that message. If you don't delete a message after it is received, the
  /// visibility timeout for the message reverts to the original timeout value
  /// (not to the value you set using the `ChangeMessageVisibility` action) the
  /// next time the message is received.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue whose message's visibility is
  /// changed.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [receiptHandle]: The receipt handle associated with the message whose
  /// visibility timeout is changed. This parameter is returned by the
  /// `ReceiveMessage`  action.
  ///
  /// [visibilityTimeout]: The new value for the message's visibility timeout
  /// (in seconds). Values values: `0` to `43200`. Maximum: 12 hours.
  Future<void> changeMessageVisibility(
      {@required String queueUrl,
      @required String receiptHandle,
      @required int visibilityTimeout}) async {
    await _client.send('ChangeMessageVisibility', {
      'QueueUrl': queueUrl,
      'ReceiptHandle': receiptHandle,
      'VisibilityTimeout': visibilityTimeout,
    });
  }

  /// Changes the visibility timeout of multiple messages. This is a batch
  /// version of  `ChangeMessageVisibility.` The result of the action on each
  /// message is reported individually in the response. You can send up to 10
  /// `ChangeMessageVisibility`  requests with each
  /// `ChangeMessageVisibilityBatch` action.
  ///
  ///  Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of `200`.
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue whose messages' visibility is
  /// changed.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [entries]: A list of receipt handles of the messages for which the
  /// visibility timeout must be changed.
  Future<ChangeMessageVisibilityBatchResult> changeMessageVisibilityBatch(
      {@required String queueUrl,
      @required List<ChangeMessageVisibilityBatchRequestEntry> entries}) async {
    var response_ = await _client.send('ChangeMessageVisibilityBatch', {
      'QueueUrl': queueUrl,
      'Entries': entries,
    });
    return ChangeMessageVisibilityBatchResult.fromJson(response_);
  }

  /// Creates a new standard or FIFO queue. You can pass one or more attributes
  /// in the request. Keep the following caveats in mind:
  ///
  /// *   If you don't specify the `FifoQueue` attribute, Amazon SQS creates a
  /// standard queue.
  ///
  ///      You can't change the queue type after you create it and you can't
  /// convert an existing standard queue into a FIFO queue. You must either
  /// create a new FIFO queue for your application or delete your existing
  /// standard queue and recreate it as a FIFO queue. For more information, see
  /// [Moving From a Standard Queue to a FIFO Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  /// *   If you don't provide a value for an attribute, the queue is created
  /// with the default value for the attribute.
  ///
  /// *   If you delete a queue, you must wait at least 60 seconds before
  /// creating a queue with the same name.
  ///
  ///
  /// To successfully create a new queue, you must provide a queue name that
  /// adheres to the
  /// [limits related to queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html)
  /// and is unique within the scope of your queues.
  ///
  /// To get the queue URL, use the  `GetQueueUrl`  action.  `GetQueueUrl`
  /// requires only the `QueueName` parameter. be aware of existing queue names:
  ///
  /// *   If you provide the name of an existing queue along with the exact
  /// names and values of all the queue's attributes, `CreateQueue` returns the
  /// queue URL for the existing queue.
  ///
  /// *   If the queue name, attribute names, or attribute values don't match an
  /// existing queue, `CreateQueue` returns an error.
  ///
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueName]: The name of the new queue. The following limits apply to this
  /// name:
  ///
  /// *   A queue name can have up to 80 characters.
  ///
  /// *   Valid values: alphanumeric characters, hyphens (`-`), and underscores
  /// (`_`).
  ///
  /// *   A FIFO queue name must end with the `.fifo` suffix.
  ///
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [attributes]: A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `CreateQueue` action uses:
  ///
  /// *    `DelaySeconds` - The length of time, in seconds, for which the
  /// delivery of all messages in the queue is delayed. Valid values: An integer
  /// from 0 to 900 seconds (15 minutes). Default: 0.
  ///
  /// *    `MaximumMessageSize` - The limit of how many bytes a message can
  /// contain before Amazon SQS rejects it. Valid values: An integer from 1,024
  /// bytes (1 KiB) to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB).
  ///
  /// *    `MessageRetentionPeriod` - The length of time, in seconds, for which
  /// Amazon SQS retains a message. Valid values: An integer from 60 seconds (1
  /// minute) to 1,209,600 seconds (14 days). Default: 345,600 (4 days).
  ///
  /// *    `Policy` - The queue's policy. A valid AWS policy. For more
  /// information about policy structure, see
  /// [Overview of AWS IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html)
  /// in the _Amazon IAM User Guide_.
  ///
  /// *    `ReceiveMessageWaitTimeSeconds` - The length of time, in seconds, for
  /// which a  `ReceiveMessage`  action waits for a message to arrive. Valid
  /// values: An integer from 0 to 20 (seconds). Default: 0.
  ///
  /// *    `RedrivePolicy` - The string that includes the parameters for the
  /// dead-letter queue functionality of the source queue. For more information
  /// about the redrive policy and dead-letter queues, see
  /// [Using Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///     *    `deadLetterTargetArn` - The Amazon Resource Name (ARN) of the
  /// dead-letter queue to which Amazon SQS moves messages after the value of
  /// `maxReceiveCount` is exceeded.
  ///
  ///     *    `maxReceiveCount` - The number of times a message is delivered to
  /// the source queue before being moved to the dead-letter queue. When the
  /// `ReceiveCount` for a message exceeds the `maxReceiveCount` for a queue,
  /// Amazon SQS moves the message to the dead-letter-queue.
  ///
  ///
  ///      The dead-letter queue of a FIFO queue must also be a FIFO queue.
  /// Similarly, the dead-letter queue of a standard queue must also be a
  /// standard queue.
  /// *    `VisibilityTimeout` - The visibility timeout for the queue, in
  /// seconds. Valid values: An integer from 0 to 43,200 (12 hours). Default:
  /// 30. For more information about the visibility timeout, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  /// The following attributes apply only to
  /// [server-side-encryption](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html):
  ///
  /// *    `KmsMasterKeyId` - The ID of an AWS-managed customer master key (CMK)
  /// for Amazon SQS or a custom CMK. For more information, see
  /// [Key Terms](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms).
  /// While the alias of the AWS-managed CMK for Amazon SQS is always
  /// `alias/aws/sqs`, the alias of a custom CMK can, for example, be
  /// `alias/_MyAlias_` . For more examples, see
  /// [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
  /// in the _AWS Key Management Service API Reference_.
  ///
  /// *    `KmsDataKeyReusePeriodSeconds` - The length of time, in seconds, for
  /// which Amazon SQS can reuse a
  /// [data key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys)
  /// to encrypt or decrypt messages before calling AWS KMS again. An integer
  /// representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24
  /// hours). Default: 300 (5 minutes). A shorter time period provides better
  /// security but results in more calls to KMS which might incur charges after
  /// Free Tier. For more information, see
  /// [How Does the Data Key Reuse Period Work?](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work).
  ///
  ///
  /// The following attributes apply only to
  /// [FIFO (first-in-first-out) queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html):
  ///
  /// *    `FifoQueue` - Designates a queue as FIFO. Valid values: `true`,
  /// `false`. If you don't specify the `FifoQueue` attribute, Amazon SQS
  /// creates a standard queue. You can provide this attribute only during queue
  /// creation. You can't change it for an existing queue. When you set this
  /// attribute, you must also provide the `MessageGroupId` for your messages
  /// explicitly.
  ///
  ///     For more information, see
  /// [FIFO Queue Logic](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-understanding-logic)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *    `ContentBasedDeduplication` - Enables content-based deduplication.
  /// Valid values: `true`, `false`. For more information, see
  /// [Exactly-Once Processing](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///     *   Every message must have a unique `MessageDeduplicationId`,
  ///
  ///         *   You may provide a `MessageDeduplicationId` explicitly.
  ///
  ///         *   If you aren't able to provide a `MessageDeduplicationId` and
  /// you enable `ContentBasedDeduplication` for your queue, Amazon SQS uses a
  /// SHA-256 hash to generate the `MessageDeduplicationId` using the body of
  /// the message (but not the attributes of the message).
  ///
  ///         *   If you don't provide a `MessageDeduplicationId` and the queue
  /// doesn't have `ContentBasedDeduplication` set, the action fails with an
  /// error.
  ///
  ///         *   If the queue has `ContentBasedDeduplication` set, your
  /// `MessageDeduplicationId` overrides the generated one.
  ///
  ///
  ///     *   When `ContentBasedDeduplication` is in effect, messages with
  /// identical content sent within the deduplication interval are treated as
  /// duplicates and only one copy of the message is delivered.
  ///
  ///     *   If you send one message with `ContentBasedDeduplication` enabled
  /// and then another message with a `MessageDeduplicationId` that is the same
  /// as the one generated for the first `MessageDeduplicationId`, the two
  /// messages are treated as duplicates and only one copy of the message is
  /// delivered.
  ///
  /// [tags]: Add cost allocation tags to the specified Amazon SQS queue. For an
  /// overview, see
  /// [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// When you use queue tags, keep the following guidelines in mind:
  ///
  /// *   Adding more than 50 tags to a queue isn't recommended.
  ///
  /// *   Tags don't have any semantic meaning. Amazon SQS interprets tags as
  /// character strings.
  ///
  /// *   Tags are case-sensitive.
  ///
  /// *   A new tag with a key identical to that of an existing tag overwrites
  /// the existing tag.
  ///
  ///
  /// For a full list of tag restrictions, see
  /// [Limits Related to Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// To be able to tag a queue on creation, you must have the `sqs:CreateQueue`
  /// and `sqs:TagQueue` permissions.
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<CreateQueueResult> createQueue(String queueName,
      {Map<String, String> attributes, Map<String, String> tags}) async {
    var response_ = await _client.send('CreateQueue', {
      'QueueName': queueName,
      if (attributes != null) 'Attributes': attributes,
      if (tags != null) 'tags': tags,
    });
    return CreateQueueResult.fromJson(response_);
  }

  /// Deletes the specified message from the specified queue. To select the
  /// message to delete, use the `ReceiptHandle` of the message (_not_ the
  /// `MessageId` which you receive when you send the message). Amazon SQS can
  /// delete a message from a queue even if a visibility timeout setting causes
  /// the message to be locked by another consumer. Amazon SQS automatically
  /// deletes messages left in a queue longer than the retention period
  /// configured for the queue.
  ///
  ///
  ///
  /// The `ReceiptHandle` is associated with a _specific instance_ of receiving
  /// a message. If you receive a message more than once, the `ReceiptHandle` is
  /// different each time you receive a message. When you use the
  /// `DeleteMessage` action, you must provide the most recently received
  /// `ReceiptHandle` for the message (otherwise, the request succeeds, but the
  /// message might not be deleted).
  ///
  /// For standard queues, it is possible to receive a message even after you
  /// delete it. This might happen on rare occasions if one of the servers which
  /// stores a copy of the message is unavailable when you send the request to
  /// delete the message. The copy remains on the server and might be returned
  /// to you during a subsequent receive request. You should ensure that your
  /// application is idempotent, so that receiving a message more than once does
  /// not cause issues.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue from which messages are
  /// deleted.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [receiptHandle]: The receipt handle associated with the message to delete.
  Future<void> deleteMessage(
      {@required String queueUrl, @required String receiptHandle}) async {
    await _client.send('DeleteMessage', {
      'QueueUrl': queueUrl,
      'ReceiptHandle': receiptHandle,
    });
  }

  /// Deletes up to ten messages from the specified queue. This is a batch
  /// version of  `DeleteMessage.` The result of the action on each message is
  /// reported individually in the response.
  ///
  ///  Because the batch request can result in a combination of successful and
  /// unsuccessful actions, you should check for batch errors even when the call
  /// returns an HTTP status code of `200`.
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue from which messages are
  /// deleted.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [entries]: A list of receipt handles for the messages to be deleted.
  Future<DeleteMessageBatchResult> deleteMessageBatch(
      {@required String queueUrl,
      @required List<DeleteMessageBatchRequestEntry> entries}) async {
    var response_ = await _client.send('DeleteMessageBatch', {
      'QueueUrl': queueUrl,
      'Entries': entries,
    });
    return DeleteMessageBatchResult.fromJson(response_);
  }

  /// Deletes the queue specified by the `QueueUrl`, regardless of the queue's
  /// contents. If the specified queue doesn't exist, Amazon SQS returns a
  /// successful response.
  ///
  ///  Be careful with the `DeleteQueue` action: When you delete a queue, any
  /// messages in the queue are no longer available.
  ///
  /// When you delete a queue, the deletion process takes up to 60 seconds.
  /// Requests you send involving that queue during the 60 seconds might
  /// succeed. For example, a  `SendMessage`  request might succeed, but after
  /// 60 seconds the queue and the message you sent no longer exist.
  ///
  /// When you delete a queue, you must wait at least 60 seconds before creating
  /// a queue with the same name.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue to delete.
  ///
  /// Queue URLs and names are case-sensitive.
  Future<void> deleteQueue(String queueUrl) async {
    await _client.send('DeleteQueue', {
      'QueueUrl': queueUrl,
    });
  }

  /// Gets attributes for the specified queue.
  ///
  ///  To determine whether a queue is
  /// [FIFO](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html),
  /// you can check whether `QueueName` ends with the `.fifo` suffix.
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue whose attribute information is
  /// retrieved.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [attributeNames]: A list of attributes for which to retrieve information.
  ///
  ///  In the future, new attributes might be added. If you write code that
  /// calls this action, we recommend that you structure your code so that it
  /// can handle new attributes gracefully.
  ///
  /// The following attributes are supported:
  ///
  /// *    `All` - Returns all values.
  ///
  /// *    `ApproximateNumberOfMessages` - Returns the approximate number of
  /// messages available for retrieval from the queue.
  ///
  /// *    `ApproximateNumberOfMessagesDelayed` - Returns the approximate number
  /// of messages in the queue that are delayed and not available for reading
  /// immediately. This can happen when the queue is configured as a delay queue
  /// or when a message has been sent with a delay parameter.
  ///
  /// *    `ApproximateNumberOfMessagesNotVisible` - Returns the approximate
  /// number of messages that are in flight. Messages are considered to be _in
  /// flight_ if they have been sent to a client but have not yet been deleted
  /// or have not yet reached the end of their visibility window.
  ///
  /// *    `CreatedTimestamp` - Returns the time when the queue was created in
  /// seconds ([epoch time](http://en.wikipedia.org/wiki/Unix_time)).
  ///
  /// *    `DelaySeconds` - Returns the default delay on the queue in seconds.
  ///
  /// *    `LastModifiedTimestamp` - Returns the time when the queue was last
  /// changed in seconds ([epoch time](http://en.wikipedia.org/wiki/Unix_time)).
  ///
  /// *    `MaximumMessageSize` - Returns the limit of how many bytes a message
  /// can contain before Amazon SQS rejects it.
  ///
  /// *    `MessageRetentionPeriod` - Returns the length of time, in seconds,
  /// for which Amazon SQS retains a message.
  ///
  /// *    `Policy` - Returns the policy of the queue.
  ///
  /// *    `QueueArn` - Returns the Amazon resource name (ARN) of the queue.
  ///
  /// *    `ReceiveMessageWaitTimeSeconds` - Returns the length of time, in
  /// seconds, for which the `ReceiveMessage` action waits for a message to
  /// arrive.
  ///
  /// *    `RedrivePolicy` - Returns the string that includes the parameters for
  /// dead-letter queue functionality of the source queue. For more information
  /// about the redrive policy and dead-letter queues, see
  /// [Using Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///     *    `deadLetterTargetArn` - The Amazon Resource Name (ARN) of the
  /// dead-letter queue to which Amazon SQS moves messages after the value of
  /// `maxReceiveCount` is exceeded.
  ///
  ///     *    `maxReceiveCount` - The number of times a message is delivered to
  /// the source queue before being moved to the dead-letter queue. When the
  /// `ReceiveCount` for a message exceeds the `maxReceiveCount` for a queue,
  /// Amazon SQS moves the message to the dead-letter-queue.
  ///
  ///
  /// *    `VisibilityTimeout` - Returns the visibility timeout for the queue.
  /// For more information about the visibility timeout, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  /// The following attributes apply only to
  /// [server-side-encryption](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html):
  ///
  /// *    `KmsMasterKeyId` - Returns the ID of an AWS-managed customer master
  /// key (CMK) for Amazon SQS or a custom CMK. For more information, see
  /// [Key Terms](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms).
  ///
  /// *    `KmsDataKeyReusePeriodSeconds` - Returns the length of time, in
  /// seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt
  /// messages before calling AWS KMS again. For more information, see
  /// [How Does the Data Key Reuse Period Work?](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work).
  ///
  ///
  /// The following attributes apply only to
  /// [FIFO (first-in-first-out) queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html):
  ///
  /// *    `FifoQueue` - Returns whether the queue is FIFO. For more
  /// information, see
  /// [FIFO Queue Logic](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-understanding-logic)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///      To determine whether a queue is
  /// [FIFO](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html),
  /// you can check whether `QueueName` ends with the `.fifo` suffix.
  /// *    `ContentBasedDeduplication` - Returns whether content-based
  /// deduplication is enabled for the queue. For more information, see
  /// [Exactly-Once Processing](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<GetQueueAttributesResult> getQueueAttributes(String queueUrl,
      {List<String> attributeNames}) async {
    var response_ = await _client.send('GetQueueAttributes', {
      'QueueUrl': queueUrl,
      if (attributeNames != null) 'AttributeNames': attributeNames,
    });
    return GetQueueAttributesResult.fromJson(response_);
  }

  /// Returns the URL of an existing Amazon SQS queue.
  ///
  /// To access a queue that belongs to another AWS account, use the
  /// `QueueOwnerAWSAccountId` parameter to specify the account ID of the
  /// queue's owner. The queue's owner must grant you permission to access the
  /// queue. For more information about shared queue access, see
  /// `AddPermission`  or see
  /// [Allow Developers to Write Messages to a Shared Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueName]: The name of the queue whose URL must be fetched. Maximum 80
  /// characters. Valid values: alphanumeric characters, hyphens (`-`), and
  /// underscores (`_`).
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [queueOwnerAwsAccountId]: The AWS account ID of the account that created
  /// the queue.
  Future<GetQueueUrlResult> getQueueUrl(String queueName,
      {String queueOwnerAwsAccountId}) async {
    var response_ = await _client.send('GetQueueUrl', {
      'QueueName': queueName,
      if (queueOwnerAwsAccountId != null)
        'QueueOwnerAWSAccountId': queueOwnerAwsAccountId,
    });
    return GetQueueUrlResult.fromJson(response_);
  }

  /// Returns a list of your queues that have the `RedrivePolicy` queue
  /// attribute configured with a dead-letter queue.
  ///
  /// For more information about using dead-letter queues, see
  /// [Using Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of a dead-letter queue.
  ///
  /// Queue URLs and names are case-sensitive.
  Future<ListDeadLetterSourceQueuesResult> listDeadLetterSourceQueues(
      String queueUrl) async {
    var response_ = await _client.send('ListDeadLetterSourceQueues', {
      'QueueUrl': queueUrl,
    });
    return ListDeadLetterSourceQueuesResult.fromJson(response_);
  }

  /// List all cost allocation tags added to the specified Amazon SQS queue. For
  /// an overview, see
  /// [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of the queue.
  Future<ListQueueTagsResult> listQueueTags(String queueUrl) async {
    var response_ = await _client.send('ListQueueTags', {
      'QueueUrl': queueUrl,
    });
    return ListQueueTagsResult.fromJson(response_);
  }

  /// Returns a list of your queues. The maximum number of queues that can be
  /// returned is 1,000. If you specify a value for the optional
  /// `QueueNamePrefix` parameter, only queues with a name that begins with the
  /// specified value are returned.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueNamePrefix]: A string to use for filtering the list results. Only
  /// those queues whose name begins with the specified string are returned.
  ///
  /// Queue URLs and names are case-sensitive.
  Future<ListQueuesResult> listQueues({String queueNamePrefix}) async {
    var response_ = await _client.send('ListQueues', {
      if (queueNamePrefix != null) 'QueueNamePrefix': queueNamePrefix,
    });
    return ListQueuesResult.fromJson(response_);
  }

  /// Deletes the messages in a queue specified by the `QueueURL` parameter.
  ///
  ///  When you use the `PurgeQueue` action, you can't retrieve any messages
  /// deleted from a queue.
  ///
  /// The message deletion process takes up to 60 seconds. We recommend waiting
  /// for 60 seconds regardless of your queue's size.
  ///
  /// Messages sent to the queue _before_ you call `PurgeQueue` might be
  /// received but are deleted within the next minute.
  ///
  /// Messages sent to the queue _after_ you call `PurgeQueue` might be deleted
  /// while the queue is being purged.
  ///
  /// [queueUrl]: The URL of the queue from which the `PurgeQueue` action
  /// deletes messages.
  ///
  /// Queue URLs and names are case-sensitive.
  Future<void> purgeQueue(String queueUrl) async {
    await _client.send('PurgeQueue', {
      'QueueUrl': queueUrl,
    });
  }

  /// Retrieves one or more messages (up to 10), from the specified queue. Using
  /// the `WaitTimeSeconds` parameter enables long-poll support. For more
  /// information, see
  /// [Amazon SQS Long Polling](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// Short poll is the default behavior where a weighted random set of machines
  /// is sampled on a `ReceiveMessage` call. Thus, only the messages on the
  /// sampled machines are returned. If the number of messages in the queue is
  /// small (fewer than 1,000), you most likely get fewer messages than you
  /// requested per `ReceiveMessage` call. If the number of messages in the
  /// queue is extremely small, you might not receive any messages in a
  /// particular `ReceiveMessage` response. If this happens, repeat the request.
  ///
  /// For each message returned, the response includes the following:
  ///
  /// *   The message body.
  ///
  /// *   An MD5 digest of the message body. For information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  ///
  /// *   The `MessageId` you received when you sent the message to the queue.
  ///
  /// *   The receipt handle.
  ///
  /// *   The message attributes.
  ///
  /// *   An MD5 digest of the message attributes.
  ///
  ///
  /// The receipt handle is the identifier you must provide when deleting the
  /// message. For more information, see
  /// [Queue and Message Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// You can provide the `VisibilityTimeout` parameter in your request. The
  /// parameter is applied to the messages that Amazon SQS returns in the
  /// response. If you don't include the parameter, the overall visibility
  /// timeout for the queue is used for the returned messages. For more
  /// information, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// A message that isn't deleted or a message whose visibility isn't extended
  /// before the visibility timeout expires counts as a failed receive.
  /// Depending on the configuration of the queue, the message might be sent to
  /// the dead-letter queue.
  ///
  ///
  ///
  /// In the future, new attributes might be added. If you write code that calls
  /// this action, we recommend that you structure your code so that it can
  /// handle new attributes gracefully.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue from which messages are
  /// received.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [attributeNames]: A list of attributes that need to be returned along with
  /// each message. These attributes include:
  ///
  /// *    `All` - Returns all values.
  ///
  /// *    `ApproximateFirstReceiveTimestamp` - Returns the time the message was
  /// first received from the queue
  /// ([epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
  ///
  /// *    `ApproximateReceiveCount` - Returns the number of times a message has
  /// been received from the queue but not deleted.
  ///
  /// *    `AWSTraceHeader` - Returns the AWS X-Ray trace header string.
  ///
  /// *    `SenderId`
  ///
  ///     *   For an IAM user, returns the IAM user ID, for example
  /// `ABCDEFGHI1JKLMNOPQ23R`.
  ///
  ///     *   For an IAM role, returns the IAM role ID, for example
  /// `ABCDE1F2GH3I4JK5LMNOP:i-a123b456`.
  ///
  ///
  /// *    `SentTimestamp` - Returns the time the message was sent to the queue
  /// ([epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
  ///
  /// *    `MessageDeduplicationId` - Returns the value provided by the producer
  /// that calls the  `SendMessage`  action.
  ///
  /// *    `MessageGroupId` - Returns the value provided by the producer that
  /// calls the  `SendMessage`  action. Messages with the same `MessageGroupId`
  /// are returned in sequence.
  ///
  /// *    `SequenceNumber` - Returns the value provided by Amazon SQS.
  ///
  /// [messageAttributeNames]: The name of the message attribute, where _N_ is
  /// the index.
  ///
  /// *   The name can contain alphanumeric characters and the underscore (`_`),
  /// hyphen (`-`), and period (`.`).
  ///
  /// *   The name is case-sensitive and must be unique among all attribute
  /// names for the message.
  ///
  /// *   The name must not start with AWS-reserved prefixes such as `AWS.` or
  /// `Amazon.` (or any casing variants).
  ///
  /// *   The name must not start or end with a period (`.`), and it should not
  /// have periods in succession (`..`).
  ///
  /// *   The name can be up to 256 characters long.
  ///
  ///
  /// When using `ReceiveMessage`, you can send a list of attribute names to
  /// receive, or you can return all of the attributes by specifying `All` or
  /// `.*` in your request. You can also use all message attributes starting
  /// with a prefix, for example `bar.*`.
  ///
  /// [maxNumberOfMessages]: The maximum number of messages to return. Amazon
  /// SQS never returns more messages than this value (however, fewer messages
  /// might be returned). Valid values: 1 to 10. Default: 1.
  ///
  /// [visibilityTimeout]: The duration (in seconds) that the received messages
  /// are hidden from subsequent retrieve requests after being retrieved by a
  /// `ReceiveMessage` request.
  ///
  /// [waitTimeSeconds]: The duration (in seconds) for which the call waits for
  /// a message to arrive in the queue before returning. If a message is
  /// available, the call returns sooner than `WaitTimeSeconds`. If no messages
  /// are available and the wait time expires, the call returns successfully
  /// with an empty list of messages.
  ///
  /// [receiveRequestAttemptId]: This parameter applies only to FIFO
  /// (first-in-first-out) queues.
  ///
  /// The token used for deduplication of `ReceiveMessage` calls. If a
  /// networking issue occurs after a `ReceiveMessage` action, and instead of a
  /// response you receive a generic error, you can retry the same action with
  /// an identical `ReceiveRequestAttemptId` to retrieve the same set of
  /// messages, even if their visibility timeout has not yet expired.
  ///
  /// *   You can use `ReceiveRequestAttemptId` only for 5 minutes after a
  /// `ReceiveMessage` action.
  ///
  /// *   When you set `FifoQueue`, a caller of the `ReceiveMessage` action can
  /// provide a `ReceiveRequestAttemptId` explicitly.
  ///
  /// *   If a caller of the `ReceiveMessage` action doesn't provide a
  /// `ReceiveRequestAttemptId`, Amazon SQS generates a
  /// `ReceiveRequestAttemptId`.
  ///
  /// *   You can retry the `ReceiveMessage` action with the same
  /// `ReceiveRequestAttemptId` if none of the messages have been modified
  /// (deleted or had their visibility changes).
  ///
  /// *   During a visibility timeout, subsequent calls with the same
  /// `ReceiveRequestAttemptId` return the same messages and receipt handles. If
  /// a retry occurs within the deduplication interval, it resets the visibility
  /// timeout. For more information, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///      If a caller of the `ReceiveMessage` action still processes messages
  /// when the visibility timeout expires and messages become visible, another
  /// worker consuming from the same queue can receive the same messages and
  /// therefore process duplicates. Also, if a consumer whose message processing
  /// time is longer than the visibility timeout tries to delete the processed
  /// messages, the action fails with an error.
  ///
  ///     To mitigate this effect, ensure that your application observes a safe
  /// threshold before the visibility timeout expires and extend the visibility
  /// timeout as necessary.
  /// *   While messages with a particular `MessageGroupId` are invisible, no
  /// more messages belonging to the same `MessageGroupId` are returned until
  /// the visibility timeout expires. You can still receive messages with
  /// another `MessageGroupId` as long as it is also visible.
  ///
  /// *   If a caller of `ReceiveMessage` can't track the
  /// `ReceiveRequestAttemptId`, no retries work until the original visibility
  /// timeout expires. As a result, delays might occur but the messages in the
  /// queue remain in a strict order.
  ///
  ///
  /// The length of `ReceiveRequestAttemptId` is 128 characters.
  /// `ReceiveRequestAttemptId` can contain alphanumeric characters (`a-z`,
  /// `A-Z`, `0-9`) and punctuation (``!"#$%&'()*+,-./:;<=>?@[]^_`{|}~``).
  ///
  /// For best practices of using `ReceiveRequestAttemptId`, see
  /// [Using the ReceiveRequestAttemptId Request Parameter](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-receiverequestattemptid-request-parameter.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<ReceiveMessageResult> receiveMessage(String queueUrl,
      {List<String> attributeNames,
      List<String> messageAttributeNames,
      int maxNumberOfMessages,
      int visibilityTimeout,
      int waitTimeSeconds,
      String receiveRequestAttemptId}) async {
    var response_ = await _client.send('ReceiveMessage', {
      'QueueUrl': queueUrl,
      if (attributeNames != null) 'AttributeNames': attributeNames,
      if (messageAttributeNames != null)
        'MessageAttributeNames': messageAttributeNames,
      if (maxNumberOfMessages != null)
        'MaxNumberOfMessages': maxNumberOfMessages,
      if (visibilityTimeout != null) 'VisibilityTimeout': visibilityTimeout,
      if (waitTimeSeconds != null) 'WaitTimeSeconds': waitTimeSeconds,
      if (receiveRequestAttemptId != null)
        'ReceiveRequestAttemptId': receiveRequestAttemptId,
    });
    return ReceiveMessageResult.fromJson(response_);
  }

  /// Revokes any permissions in the queue policy that matches the specified
  /// `Label` parameter.
  ///
  ///
  ///
  /// *   Only the owner of a queue can remove permissions from it.
  ///
  /// *   Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   To remove the ability to change queue permissions, you must deny
  /// permission to the `AddPermission`, `RemovePermission`, and
  /// `SetQueueAttributes` actions in your IAM policy.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue from which permissions are
  /// removed.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [label]: The identification of the permission to remove. This is the label
  /// added using the  `AddPermission`  action.
  Future<void> removePermission(
      {@required String queueUrl, @required String label}) async {
    await _client.send('RemovePermission', {
      'QueueUrl': queueUrl,
      'Label': label,
    });
  }

  /// Delivers a message to the specified queue.
  ///
  ///
  ///
  /// A message can include only XML, JSON, and unformatted text. The following
  /// Unicode characters are allowed:
  ///
  ///  `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` |
  /// `#x10000` to `#x10FFFF`
  ///
  /// Any characters not included in this list will be rejected. For more
  /// information, see the
  /// [W3C specification for characters](http://www.w3.org/TR/REC-xml/#charsets).
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue to which a message is sent.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [messageBody]: The message to send. The maximum string size is 256 KB.
  ///
  ///
  ///
  /// A message can include only XML, JSON, and unformatted text. The following
  /// Unicode characters are allowed:
  ///
  ///  `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` |
  /// `#x10000` to `#x10FFFF`
  ///
  /// Any characters not included in this list will be rejected. For more
  /// information, see the
  /// [W3C specification for characters](http://www.w3.org/TR/REC-xml/#charsets).
  ///
  /// [delaySeconds]:  The length of time, in seconds, for which to delay a
  /// specific message. Valid values: 0 to 900. Maximum: 15 minutes. Messages
  /// with a positive `DelaySeconds` value become available for processing after
  /// the delay period is finished. If you don't specify a value, the default
  /// value for the queue applies.
  ///
  ///
  ///
  /// When you set `FifoQueue`, you can't set `DelaySeconds` per message. You
  /// can set this parameter only on a queue level.
  ///
  /// [messageAttributes]: Each message attribute consists of a `Name`, `Type`,
  /// and `Value`. For more information, see
  /// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [messageSystemAttributes]: The message system attribute to send. Each
  /// message system attribute consists of a `Name`, `Type`, and `Value`.
  ///
  ///
  ///
  /// *   Currently, the only supported message system attribute is
  /// `AWSTraceHeader`. Its type must be `String` and its value must be a
  /// correctly formatted AWS X-Ray trace string.
  ///
  /// *   The size of a message system attribute doesn't count towards the total
  /// size of a message.
  ///
  /// [messageDeduplicationId]: This parameter applies only to FIFO
  /// (first-in-first-out) queues.
  ///
  /// The token used for deduplication of sent messages. If a message with a
  /// particular `MessageDeduplicationId` is sent successfully, any messages
  /// sent with the same `MessageDeduplicationId` are accepted successfully but
  /// aren't delivered during the 5-minute deduplication interval. For more
  /// information, see
  /// [Exactly-Once Processing](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   Every message must have a unique `MessageDeduplicationId`,
  ///
  ///     *   You may provide a `MessageDeduplicationId` explicitly.
  ///
  ///     *   If you aren't able to provide a `MessageDeduplicationId` and you
  /// enable `ContentBasedDeduplication` for your queue, Amazon SQS uses a
  /// SHA-256 hash to generate the `MessageDeduplicationId` using the body of
  /// the message (but not the attributes of the message).
  ///
  ///     *   If you don't provide a `MessageDeduplicationId` and the queue
  /// doesn't have `ContentBasedDeduplication` set, the action fails with an
  /// error.
  ///
  ///     *   If the queue has `ContentBasedDeduplication` set, your
  /// `MessageDeduplicationId` overrides the generated one.
  ///
  ///
  /// *   When `ContentBasedDeduplication` is in effect, messages with identical
  /// content sent within the deduplication interval are treated as duplicates
  /// and only one copy of the message is delivered.
  ///
  /// *   If you send one message with `ContentBasedDeduplication` enabled and
  /// then another message with a `MessageDeduplicationId` that is the same as
  /// the one generated for the first `MessageDeduplicationId`, the two messages
  /// are treated as duplicates and only one copy of the message is delivered.
  ///
  ///
  ///  The `MessageDeduplicationId` is available to the consumer of the message
  /// (this can be useful for troubleshooting delivery issues).
  ///
  /// If a message is sent successfully but the acknowledgement is lost and the
  /// message is resent with the same `MessageDeduplicationId` after the
  /// deduplication interval, Amazon SQS can't detect duplicate messages.
  ///
  /// Amazon SQS continues to keep track of the message deduplication ID even
  /// after the message is received and deleted.
  ///
  /// The length of `MessageDeduplicationId` is 128 characters.
  /// `MessageDeduplicationId` can contain alphanumeric characters (`a-z`,
  /// `A-Z`, `0-9`) and punctuation (``!"#$%&'()*+,-./:;<=>?@[]^_`{|}~``).
  ///
  /// For best practices of using `MessageDeduplicationId`, see
  /// [Using the MessageDeduplicationId Property](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [messageGroupId]: This parameter applies only to FIFO (first-in-first-out)
  /// queues.
  ///
  /// The tag that specifies that a message belongs to a specific message group.
  /// Messages that belong to the same message group are processed in a FIFO
  /// manner (however, messages in different message groups might be processed
  /// out of order). To interleave multiple ordered streams within a single
  /// queue, use `MessageGroupId` values (for example, session data for multiple
  /// users). In this scenario, multiple consumers can process the queue, but
  /// the session data of each user is processed in a FIFO fashion.
  ///
  /// *   You must associate a non-empty `MessageGroupId` with a message. If you
  /// don't provide a `MessageGroupId`, the action fails.
  ///
  /// *    `ReceiveMessage` might return messages with multiple `MessageGroupId`
  /// values. For each `MessageGroupId`, the messages are sorted by time sent.
  /// The caller can't specify a `MessageGroupId`.
  ///
  ///
  /// The length of `MessageGroupId` is 128 characters. Valid values:
  /// alphanumeric characters and punctuation
  /// ``(!"#$%&'()*+,-./:;<=>?@[]^_`{|}~)``.
  ///
  /// For best practices of using `MessageGroupId`, see
  /// [Using the MessageGroupId Property](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///   `MessageGroupId` is required for FIFO queues. You can't use it for
  /// Standard queues.
  Future<SendMessageResult> sendMessage(
      {@required String queueUrl,
      @required String messageBody,
      int delaySeconds,
      Map<String, MessageAttributeValue> messageAttributes,
      Map<String, MessageSystemAttributeValue> messageSystemAttributes,
      String messageDeduplicationId,
      String messageGroupId}) async {
    var response_ = await _client.send('SendMessage', {
      'QueueUrl': queueUrl,
      'MessageBody': messageBody,
      if (delaySeconds != null) 'DelaySeconds': delaySeconds,
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
      if (messageSystemAttributes != null)
        'MessageSystemAttributes': messageSystemAttributes,
      if (messageDeduplicationId != null)
        'MessageDeduplicationId': messageDeduplicationId,
      if (messageGroupId != null) 'MessageGroupId': messageGroupId,
    });
    return SendMessageResult.fromJson(response_);
  }

  /// Delivers up to ten messages to the specified queue. This is a batch
  /// version of  `SendMessage.` For a FIFO queue, multiple messages within a
  /// single batch are enqueued in the order they are sent.
  ///
  /// The result of sending each message is reported individually in the
  /// response. Because the batch request can result in a combination of
  /// successful and unsuccessful actions, you should check for batch errors
  /// even when the call returns an HTTP status code of `200`.
  ///
  /// The maximum allowed individual message size and the maximum total payload
  /// size (the sum of the individual lengths of all of the batched messages)
  /// are both 256 KB (262,144 bytes).
  ///
  ///  A message can include only XML, JSON, and unformatted text. The following
  /// Unicode characters are allowed:
  ///
  ///  `#x9` | `#xA` | `#xD` | `#x20` to `#xD7FF` | `#xE000` to `#xFFFD` |
  /// `#x10000` to `#x10FFFF`
  ///
  /// Any characters not included in this list will be rejected. For more
  /// information, see the
  /// [W3C specification for characters](http://www.w3.org/TR/REC-xml/#charsets).
  ///
  ///
  /// If you don't specify the `DelaySeconds` parameter for an entry, Amazon SQS
  /// uses the default value for the queue.
  ///
  /// Some actions take lists of parameters. These lists are specified using the
  /// `param.n` notation. Values of `n` are integers starting from 1. For
  /// example, a parameter list with two elements looks like this:
  ///
  ///  `&Attribute.1=first`
  ///
  ///  `&Attribute.2=second`
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue to which batched messages are
  /// sent.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [entries]: A list of  `SendMessageBatchRequestEntry`  items.
  Future<SendMessageBatchResult> sendMessageBatch(
      {@required String queueUrl,
      @required List<SendMessageBatchRequestEntry> entries}) async {
    var response_ = await _client.send('SendMessageBatch', {
      'QueueUrl': queueUrl,
      'Entries': entries,
    });
    return SendMessageBatchResult.fromJson(response_);
  }

  /// Sets the value of one or more queue attributes. When you change a queue's
  /// attributes, the change can take up to 60 seconds for most of the
  /// attributes to propagate throughout the Amazon SQS system. Changes made to
  /// the `MessageRetentionPeriod` attribute can take up to 15 minutes.
  ///
  ///
  ///
  /// *   In the future, new attributes might be added. If you write code that
  /// calls this action, we recommend that you structure your code so that it
  /// can handle new attributes gracefully.
  ///
  /// *   Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   To remove the ability to change queue permissions, you must deny
  /// permission to the `AddPermission`, `RemovePermission`, and
  /// `SetQueueAttributes` actions in your IAM policy.
  ///
  /// [queueUrl]: The URL of the Amazon SQS queue whose attributes are set.
  ///
  /// Queue URLs and names are case-sensitive.
  ///
  /// [attributes]: A map of attributes to set.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the `SetQueueAttributes` action uses:
  ///
  /// *    `DelaySeconds` - The length of time, in seconds, for which the
  /// delivery of all messages in the queue is delayed. Valid values: An integer
  /// from 0 to 900 (15 minutes). Default: 0.
  ///
  /// *    `MaximumMessageSize` - The limit of how many bytes a message can
  /// contain before Amazon SQS rejects it. Valid values: An integer from 1,024
  /// bytes (1 KiB) up to 262,144 bytes (256 KiB). Default: 262,144 (256 KiB).
  ///
  /// *    `MessageRetentionPeriod` - The length of time, in seconds, for which
  /// Amazon SQS retains a message. Valid values: An integer representing
  /// seconds, from 60 (1 minute) to 1,209,600 (14 days). Default: 345,600 (4
  /// days).
  ///
  /// *    `Policy` - The queue's policy. A valid AWS policy. For more
  /// information about policy structure, see
  /// [Overview of AWS IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/PoliciesOverview.html)
  /// in the _Amazon IAM User Guide_.
  ///
  /// *    `ReceiveMessageWaitTimeSeconds` - The length of time, in seconds, for
  /// which a  `ReceiveMessage`  action waits for a message to arrive. Valid
  /// values: an integer from 0 to 20 (seconds). Default: 0.
  ///
  /// *    `RedrivePolicy` - The string that includes the parameters for the
  /// dead-letter queue functionality of the source queue. For more information
  /// about the redrive policy and dead-letter queues, see
  /// [Using Amazon SQS Dead-Letter Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///     *    `deadLetterTargetArn` - The Amazon Resource Name (ARN) of the
  /// dead-letter queue to which Amazon SQS moves messages after the value of
  /// `maxReceiveCount` is exceeded.
  ///
  ///     *    `maxReceiveCount` - The number of times a message is delivered to
  /// the source queue before being moved to the dead-letter queue. When the
  /// `ReceiveCount` for a message exceeds the `maxReceiveCount` for a queue,
  /// Amazon SQS moves the message to the dead-letter-queue.
  ///
  ///
  ///      The dead-letter queue of a FIFO queue must also be a FIFO queue.
  /// Similarly, the dead-letter queue of a standard queue must also be a
  /// standard queue.
  /// *    `VisibilityTimeout` - The visibility timeout for the queue, in
  /// seconds. Valid values: an integer from 0 to 43,200 (12 hours). Default:
  /// 30. For more information about the visibility timeout, see
  /// [Visibility Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  /// The following attributes apply only to
  /// [server-side-encryption](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html):
  ///
  /// *    `KmsMasterKeyId` - The ID of an AWS-managed customer master key (CMK)
  /// for Amazon SQS or a custom CMK. For more information, see
  /// [Key Terms](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-sse-key-terms).
  /// While the alias of the AWS-managed CMK for Amazon SQS is always
  /// `alias/aws/sqs`, the alias of a custom CMK can, for example, be
  /// `alias/_MyAlias_` . For more examples, see
  /// [KeyId](https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters)
  /// in the _AWS Key Management Service API Reference_.
  ///
  /// *    `KmsDataKeyReusePeriodSeconds` - The length of time, in seconds, for
  /// which Amazon SQS can reuse a
  /// [data key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys)
  /// to encrypt or decrypt messages before calling AWS KMS again. An integer
  /// representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24
  /// hours). Default: 300 (5 minutes). A shorter time period provides better
  /// security but results in more calls to KMS which might incur charges after
  /// Free Tier. For more information, see
  /// [How Does the Data Key Reuse Period Work?](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html#sqs-how-does-the-data-key-reuse-period-work).
  ///
  ///
  /// The following attribute applies only to
  /// [FIFO (first-in-first-out) queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html):
  ///
  /// *    `ContentBasedDeduplication` - Enables content-based deduplication.
  /// For more information, see
  /// [Exactly-Once Processing](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///     *   Every message must have a unique `MessageDeduplicationId`,
  ///
  ///         *   You may provide a `MessageDeduplicationId` explicitly.
  ///
  ///         *   If you aren't able to provide a `MessageDeduplicationId` and
  /// you enable `ContentBasedDeduplication` for your queue, Amazon SQS uses a
  /// SHA-256 hash to generate the `MessageDeduplicationId` using the body of
  /// the message (but not the attributes of the message).
  ///
  ///         *   If you don't provide a `MessageDeduplicationId` and the queue
  /// doesn't have `ContentBasedDeduplication` set, the action fails with an
  /// error.
  ///
  ///         *   If the queue has `ContentBasedDeduplication` set, your
  /// `MessageDeduplicationId` overrides the generated one.
  ///
  ///
  ///     *   When `ContentBasedDeduplication` is in effect, messages with
  /// identical content sent within the deduplication interval are treated as
  /// duplicates and only one copy of the message is delivered.
  ///
  ///     *   If you send one message with `ContentBasedDeduplication` enabled
  /// and then another message with a `MessageDeduplicationId` that is the same
  /// as the one generated for the first `MessageDeduplicationId`, the two
  /// messages are treated as duplicates and only one copy of the message is
  /// delivered.
  Future<void> setQueueAttributes(
      {@required String queueUrl,
      @required Map<String, String> attributes}) async {
    await _client.send('SetQueueAttributes', {
      'QueueUrl': queueUrl,
      'Attributes': attributes,
    });
  }

  /// Add cost allocation tags to the specified Amazon SQS queue. For an
  /// overview, see
  /// [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// When you use queue tags, keep the following guidelines in mind:
  ///
  /// *   Adding more than 50 tags to a queue isn't recommended.
  ///
  /// *   Tags don't have any semantic meaning. Amazon SQS interprets tags as
  /// character strings.
  ///
  /// *   Tags are case-sensitive.
  ///
  /// *   A new tag with a key identical to that of an existing tag overwrites
  /// the existing tag.
  ///
  ///
  /// For a full list of tag restrictions, see
  /// [Limits Related to Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of the queue.
  ///
  /// [tags]: The list of tags to be added to the specified queue.
  Future<void> tagQueue(
      {@required String queueUrl, @required Map<String, String> tags}) async {
    await _client.send('TagQueue', {
      'QueueUrl': queueUrl,
      'Tags': tags,
    });
  }

  /// Remove cost allocation tags from the specified Amazon SQS queue. For an
  /// overview, see
  /// [Tagging Your Amazon SQS Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see
  /// [Grant Cross-Account Permissions to a Role and a User Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// [queueUrl]: The URL of the queue.
  ///
  /// [tagKeys]: The list of tags to be removed from the specified queue.
  Future<void> untagQueue(
      {@required String queueUrl, @required List<String> tagKeys}) async {
    await _client.send('UntagQueue', {
      'QueueUrl': queueUrl,
      'TagKeys': tagKeys,
    });
  }
}

/// Gives a detailed description of the result of an action on each entry in the
/// request.
class BatchResultErrorEntry {
  /// The `Id` of an entry in a batch request.
  final String id;

  /// Specifies whether the error happened due to the producer.
  final bool senderFault;

  /// An error code representing why the action failed on this entry.
  final String code;

  /// A message explaining why the action failed on this entry.
  final String message;

  BatchResultErrorEntry({
    @required this.id,
    @required this.senderFault,
    @required this.code,
    this.message,
  });
  static BatchResultErrorEntry fromJson(Map<String, dynamic> json) =>
      BatchResultErrorEntry(
        id: json['Id'] as String,
        senderFault: json['SenderFault'] as bool,
        code: json['Code'] as String,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}

/// Encloses a receipt handle and an entry id for each message in
/// `ChangeMessageVisibilityBatch.`
///
///  All of the following list parameters must be prefixed with
/// `ChangeMessageVisibilityBatchRequestEntry.n`, where `n` is an integer value
/// starting with `1`. For example, a parameter list for this action might look
/// like this:
///
///  `&ChangeMessageVisibilityBatchRequestEntry.1.Id=change_visibility_msg_2`
///
///
/// `&ChangeMessageVisibilityBatchRequestEntry.1.ReceiptHandle=your_receipt_handle`
///
///  `&ChangeMessageVisibilityBatchRequestEntry.1.VisibilityTimeout=45`
class ChangeMessageVisibilityBatchRequestEntry {
  /// An identifier for this particular receipt handle used to communicate the
  /// result.
  ///
  ///
  ///
  /// The `Id`s of a batch request need to be unique within a request
  final String id;

  /// A receipt handle.
  final String receiptHandle;

  /// The new value (in seconds) for the message's visibility timeout.
  final int visibilityTimeout;

  ChangeMessageVisibilityBatchRequestEntry({
    @required this.id,
    @required this.receiptHandle,
    this.visibilityTimeout,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For each message in the batch, the response contains a
/// `ChangeMessageVisibilityBatchResultEntry`  tag if the message succeeds or a
/// `BatchResultErrorEntry`  tag if the message fails.
class ChangeMessageVisibilityBatchResult {
  /// A list of  `ChangeMessageVisibilityBatchResultEntry`  items.
  final List<ChangeMessageVisibilityBatchResultEntry> successful;

  /// A list of  `BatchResultErrorEntry`  items.
  final List<BatchResultErrorEntry> failed;

  ChangeMessageVisibilityBatchResult({
    @required this.successful,
    @required this.failed,
  });
  static ChangeMessageVisibilityBatchResult fromJson(
          Map<String, dynamic> json) =>
      ChangeMessageVisibilityBatchResult(
        successful: (json['Successful'] as List)
            .map((e) => ChangeMessageVisibilityBatchResultEntry.fromJson(e))
            .toList(),
        failed: (json['Failed'] as List)
            .map((e) => BatchResultErrorEntry.fromJson(e))
            .toList(),
      );
}

/// Encloses the `Id` of an entry in  `ChangeMessageVisibilityBatch.`
class ChangeMessageVisibilityBatchResultEntry {
  /// Represents a message whose visibility timeout has been changed
  /// successfully.
  final String id;

  ChangeMessageVisibilityBatchResultEntry({
    @required this.id,
  });
  static ChangeMessageVisibilityBatchResultEntry fromJson(
          Map<String, dynamic> json) =>
      ChangeMessageVisibilityBatchResultEntry(
        id: json['Id'] as String,
      );
}

/// Returns the `QueueUrl` attribute of the created queue.
class CreateQueueResult {
  /// The URL of the created Amazon SQS queue.
  final String queueUrl;

  CreateQueueResult({
    this.queueUrl,
  });
  static CreateQueueResult fromJson(Map<String, dynamic> json) =>
      CreateQueueResult(
        queueUrl:
            json.containsKey('QueueUrl') ? json['QueueUrl'] as String : null,
      );
}

/// Encloses a receipt handle and an identifier for it.
class DeleteMessageBatchRequestEntry {
  /// An identifier for this particular receipt handle. This is used to
  /// communicate the result.
  ///
  ///
  ///
  /// The `Id`s of a batch request need to be unique within a request
  final String id;

  /// A receipt handle.
  final String receiptHandle;

  DeleteMessageBatchRequestEntry({
    @required this.id,
    @required this.receiptHandle,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For each message in the batch, the response contains a
/// `DeleteMessageBatchResultEntry`  tag if the message is deleted or a
/// `BatchResultErrorEntry`  tag if the message can't be deleted.
class DeleteMessageBatchResult {
  /// A list of  `DeleteMessageBatchResultEntry`  items.
  final List<DeleteMessageBatchResultEntry> successful;

  /// A list of  `BatchResultErrorEntry`  items.
  final List<BatchResultErrorEntry> failed;

  DeleteMessageBatchResult({
    @required this.successful,
    @required this.failed,
  });
  static DeleteMessageBatchResult fromJson(Map<String, dynamic> json) =>
      DeleteMessageBatchResult(
        successful: (json['Successful'] as List)
            .map((e) => DeleteMessageBatchResultEntry.fromJson(e))
            .toList(),
        failed: (json['Failed'] as List)
            .map((e) => BatchResultErrorEntry.fromJson(e))
            .toList(),
      );
}

/// Encloses the `Id` of an entry in  `DeleteMessageBatch.`
class DeleteMessageBatchResultEntry {
  /// Represents a successfully deleted message.
  final String id;

  DeleteMessageBatchResultEntry({
    @required this.id,
  });
  static DeleteMessageBatchResultEntry fromJson(Map<String, dynamic> json) =>
      DeleteMessageBatchResultEntry(
        id: json['Id'] as String,
      );
}

/// A list of returned queue attributes.
class GetQueueAttributesResult {
  /// A map of attributes to their respective values.
  final Map<String, String> attributes;

  GetQueueAttributesResult({
    this.attributes,
  });
  static GetQueueAttributesResult fromJson(Map<String, dynamic> json) =>
      GetQueueAttributesResult(
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// For more information, see
/// [Interpreting Responses](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html)
/// in the _Amazon Simple Queue Service Developer Guide_.
class GetQueueUrlResult {
  /// The URL of the queue.
  final String queueUrl;

  GetQueueUrlResult({
    this.queueUrl,
  });
  static GetQueueUrlResult fromJson(Map<String, dynamic> json) =>
      GetQueueUrlResult(
        queueUrl:
            json.containsKey('QueueUrl') ? json['QueueUrl'] as String : null,
      );
}

/// A list of your dead letter source queues.
class ListDeadLetterSourceQueuesResult {
  /// A list of source queue URLs that have the `RedrivePolicy` queue attribute
  /// configured with a dead-letter queue.
  final List<String> queueUrls;

  ListDeadLetterSourceQueuesResult({
    @required this.queueUrls,
  });
  static ListDeadLetterSourceQueuesResult fromJson(Map<String, dynamic> json) =>
      ListDeadLetterSourceQueuesResult(
        queueUrls: (json['queueUrls'] as List).map((e) => e as String).toList(),
      );
}

class ListQueueTagsResult {
  /// The list of all tags added to the specified queue.
  final Map<String, String> tags;

  ListQueueTagsResult({
    this.tags,
  });
  static ListQueueTagsResult fromJson(Map<String, dynamic> json) =>
      ListQueueTagsResult(
        tags: json.containsKey('Tags')
            ? (json['Tags'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// A list of your queues.
class ListQueuesResult {
  /// A list of queue URLs, up to 1,000 entries.
  final List<String> queueUrls;

  ListQueuesResult({
    this.queueUrls,
  });
  static ListQueuesResult fromJson(Map<String, dynamic> json) =>
      ListQueuesResult(
        queueUrls: json.containsKey('QueueUrls')
            ? (json['QueueUrls'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// An Amazon SQS message.
class Message {
  /// A unique identifier for the message. A `MessageId`is considered unique
  /// across all AWS accounts for an extended period of time.
  final String messageId;

  /// An identifier associated with the act of receiving the message. A new
  /// receipt handle is returned every time you receive a message. When deleting
  /// a message, you provide the last received receipt handle to delete the
  /// message.
  final String receiptHandle;

  /// An MD5 digest of the non-URL-encoded message body string.
  final String md5OfBody;

  /// The message's contents (not URL-encoded).
  final String body;

  /// A map of the attributes requested in  `ReceiveMessage`  to their
  /// respective values. Supported attributes:
  ///
  /// *    `ApproximateReceiveCount`
  ///
  /// *    `ApproximateFirstReceiveTimestamp`
  ///
  /// *    `MessageDeduplicationId`
  ///
  /// *    `MessageGroupId`
  ///
  /// *    `SenderId`
  ///
  /// *    `SentTimestamp`
  ///
  /// *    `SequenceNumber`
  ///
  ///
  ///  `ApproximateFirstReceiveTimestamp` and `SentTimestamp` are each returned
  /// as an integer representing the
  /// [epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds.
  final Map<String, String> attributes;

  /// An MD5 digest of the non-URL-encoded message attribute string. You can use
  /// this attribute to verify that Amazon SQS received the message correctly.
  /// Amazon SQS URL-decodes the message before creating the MD5 digest. For
  /// information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageAttributes;

  /// Each message attribute consists of a `Name`, `Type`, and `Value`. For more
  /// information, see
  /// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final Map<String, MessageAttributeValue> messageAttributes;

  Message({
    this.messageId,
    this.receiptHandle,
    this.md5OfBody,
    this.body,
    this.attributes,
    this.md5OfMessageAttributes,
    this.messageAttributes,
  });
  static Message fromJson(Map<String, dynamic> json) => Message(
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
        receiptHandle: json.containsKey('ReceiptHandle')
            ? json['ReceiptHandle'] as String
            : null,
        md5OfBody:
            json.containsKey('MD5OfBody') ? json['MD5OfBody'] as String : null,
        body: json.containsKey('Body') ? json['Body'] as String : null,
        attributes: json.containsKey('Attributes')
            ? (json['Attributes'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        md5OfMessageAttributes: json.containsKey('MD5OfMessageAttributes')
            ? json['MD5OfMessageAttributes'] as String
            : null,
        messageAttributes: json.containsKey('MessageAttributes')
            ? (json['MessageAttributes'] as Map).map((k, v) =>
                MapEntry(k as String, MessageAttributeValue.fromJson(v)))
            : null,
      );
}

/// The user-specified message attribute value. For string data types, the
/// `Value` attribute has the same restrictions on the content as the message
/// body. For more information, see  `SendMessage.`
///
///  `Name`, `type`, `value` and the message body must not be empty or null. All
/// parts of the message attribute, including `Name`, `Type`, and `Value`, are
/// part of the message size restriction (256 KB or 262,144 bytes).
class MessageAttributeValue {
  /// Strings are Unicode with UTF-8 binary encoding. For a list of code values,
  /// see
  /// [ASCII Printable Characters](http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
  final String stringValue;

  /// Binary type attributes can store any binary data, such as compressed data,
  /// encrypted data, or images.
  final Uint8List binaryValue;

  /// Not implemented. Reserved for future use.
  final List<String> stringListValues;

  /// Not implemented. Reserved for future use.
  final List<Uint8List> binaryListValues;

  /// Amazon SQS supports the following logical data types: `String`, `Number`,
  /// and `Binary`. For the `Number` data type, you must use `StringValue`.
  ///
  /// You can also append custom labels. For more information, see
  /// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final String dataType;

  MessageAttributeValue({
    this.stringValue,
    this.binaryValue,
    this.stringListValues,
    this.binaryListValues,
    @required this.dataType,
  });
  static MessageAttributeValue fromJson(Map<String, dynamic> json) =>
      MessageAttributeValue(
        stringValue: json.containsKey('StringValue')
            ? json['StringValue'] as String
            : null,
        binaryValue: json.containsKey('BinaryValue')
            ? Uint8List(json['BinaryValue'])
            : null,
        stringListValues: json.containsKey('StringListValues')
            ? (json['StringListValues'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        binaryListValues: json.containsKey('BinaryListValues')
            ? (json['BinaryListValues'] as List)
                .map((e) => Uint8List(e))
                .toList()
            : null,
        dataType: json['DataType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The user-specified message system attribute value. For string data types,
/// the `Value` attribute has the same restrictions on the content as the
/// message body. For more information, see  `SendMessage.`
///
///  `Name`, `type`, `value` and the message body must not be empty or null.
class MessageSystemAttributeValue {
  /// Strings are Unicode with UTF-8 binary encoding. For a list of code values,
  /// see
  /// [ASCII Printable Characters](http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters).
  final String stringValue;

  /// Binary type attributes can store any binary data, such as compressed data,
  /// encrypted data, or images.
  final Uint8List binaryValue;

  /// Not implemented. Reserved for future use.
  final List<String> stringListValues;

  /// Not implemented. Reserved for future use.
  final List<Uint8List> binaryListValues;

  /// Amazon SQS supports the following logical data types: `String`, `Number`,
  /// and `Binary`. For the `Number` data type, you must use `StringValue`.
  ///
  /// You can also append custom labels. For more information, see
  /// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final String dataType;

  MessageSystemAttributeValue({
    this.stringValue,
    this.binaryValue,
    this.stringListValues,
    this.binaryListValues,
    @required this.dataType,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A list of received messages.
class ReceiveMessageResult {
  /// A list of messages.
  final List<Message> messages;

  ReceiveMessageResult({
    this.messages,
  });
  static ReceiveMessageResult fromJson(Map<String, dynamic> json) =>
      ReceiveMessageResult(
        messages: json.containsKey('Messages')
            ? (json['Messages'] as List)
                .map((e) => Message.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains the details of a single Amazon SQS message along with an `Id`.
class SendMessageBatchRequestEntry {
  /// An identifier for a message in this batch used to communicate the result.
  ///
  ///
  ///
  /// The `Id`s of a batch request need to be unique within a request
  ///
  /// This identifier can have up to 80 characters. The following characters are
  /// accepted: alphanumeric characters, hyphens(-), and underscores (_).
  final String id;

  /// The body of the message.
  final String messageBody;

  /// The length of time, in seconds, for which a specific message is delayed.
  /// Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive
  /// `DelaySeconds` value become available for processing after the delay
  /// period is finished. If you don't specify a value, the default value for
  /// the queue is applied.
  ///
  ///
  ///
  /// When you set `FifoQueue`, you can't set `DelaySeconds` per message. You
  /// can set this parameter only on a queue level.
  final int delaySeconds;

  /// Each message attribute consists of a `Name`, `Type`, and `Value`. For more
  /// information, see
  /// [Amazon SQS Message Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final Map<String, MessageAttributeValue> messageAttributes;

  /// The message system attribute to send Each message system attribute
  /// consists of a `Name`, `Type`, and `Value`.
  ///
  ///
  ///
  /// *   Currently, the only supported message system attribute is
  /// `AWSTraceHeader`. Its type must be `String` and its value must be a
  /// correctly formatted AWS X-Ray trace string.
  ///
  /// *   The size of a message system attribute doesn't count towards the total
  /// size of a message.
  final Map<String, MessageSystemAttributeValue> messageSystemAttributes;

  /// This parameter applies only to FIFO (first-in-first-out) queues.
  ///
  /// The token used for deduplication of messages within a 5-minute minimum
  /// deduplication interval. If a message with a particular
  /// `MessageDeduplicationId` is sent successfully, subsequent messages with
  /// the same `MessageDeduplicationId` are accepted successfully but aren't
  /// delivered. For more information, see
  /// [Exactly-Once Processing](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-exactly-once-processing)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   Every message must have a unique `MessageDeduplicationId`,
  ///
  ///     *   You may provide a `MessageDeduplicationId` explicitly.
  ///
  ///     *   If you aren't able to provide a `MessageDeduplicationId` and you
  /// enable `ContentBasedDeduplication` for your queue, Amazon SQS uses a
  /// SHA-256 hash to generate the `MessageDeduplicationId` using the body of
  /// the message (but not the attributes of the message).
  ///
  ///     *   If you don't provide a `MessageDeduplicationId` and the queue
  /// doesn't have `ContentBasedDeduplication` set, the action fails with an
  /// error.
  ///
  ///     *   If the queue has `ContentBasedDeduplication` set, your
  /// `MessageDeduplicationId` overrides the generated one.
  ///
  ///
  /// *   When `ContentBasedDeduplication` is in effect, messages with identical
  /// content sent within the deduplication interval are treated as duplicates
  /// and only one copy of the message is delivered.
  ///
  /// *   If you send one message with `ContentBasedDeduplication` enabled and
  /// then another message with a `MessageDeduplicationId` that is the same as
  /// the one generated for the first `MessageDeduplicationId`, the two messages
  /// are treated as duplicates and only one copy of the message is delivered.
  ///
  ///
  ///  The `MessageDeduplicationId` is available to the consumer of the message
  /// (this can be useful for troubleshooting delivery issues).
  ///
  /// If a message is sent successfully but the acknowledgement is lost and the
  /// message is resent with the same `MessageDeduplicationId` after the
  /// deduplication interval, Amazon SQS can't detect duplicate messages.
  ///
  /// Amazon SQS continues to keep track of the message deduplication ID even
  /// after the message is received and deleted.
  ///
  /// The length of `MessageDeduplicationId` is 128 characters.
  /// `MessageDeduplicationId` can contain alphanumeric characters (`a-z`,
  /// `A-Z`, `0-9`) and punctuation (``!"#$%&'()*+,-./:;<=>?@[]^_`{|}~``).
  ///
  /// For best practices of using `MessageDeduplicationId`, see
  /// [Using the MessageDeduplicationId Property](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagededuplicationid-property.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final String messageDeduplicationId;

  /// This parameter applies only to FIFO (first-in-first-out) queues.
  ///
  /// The tag that specifies that a message belongs to a specific message group.
  /// Messages that belong to the same message group are processed in a FIFO
  /// manner (however, messages in different message groups might be processed
  /// out of order). To interleave multiple ordered streams within a single
  /// queue, use `MessageGroupId` values (for example, session data for multiple
  /// users). In this scenario, multiple consumers can process the queue, but
  /// the session data of each user is processed in a FIFO fashion.
  ///
  /// *   You must associate a non-empty `MessageGroupId` with a message. If you
  /// don't provide a `MessageGroupId`, the action fails.
  ///
  /// *    `ReceiveMessage` might return messages with multiple `MessageGroupId`
  /// values. For each `MessageGroupId`, the messages are sorted by time sent.
  /// The caller can't specify a `MessageGroupId`.
  ///
  ///
  /// The length of `MessageGroupId` is 128 characters. Valid values:
  /// alphanumeric characters and punctuation
  /// ``(!"#$%&'()*+,-./:;<=>?@[]^_`{|}~)``.
  ///
  /// For best practices of using `MessageGroupId`, see
  /// [Using the MessageGroupId Property](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-messagegroupid-property.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///   `MessageGroupId` is required for FIFO queues. You can't use it for
  /// Standard queues.
  final String messageGroupId;

  SendMessageBatchRequestEntry({
    @required this.id,
    @required this.messageBody,
    this.delaySeconds,
    this.messageAttributes,
    this.messageSystemAttributes,
    this.messageDeduplicationId,
    this.messageGroupId,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// For each message in the batch, the response contains a
/// `SendMessageBatchResultEntry`  tag if the message succeeds or a
/// `BatchResultErrorEntry`  tag if the message fails.
class SendMessageBatchResult {
  /// A list of  `SendMessageBatchResultEntry`  items.
  final List<SendMessageBatchResultEntry> successful;

  /// A list of  `BatchResultErrorEntry`  items with error details about each
  /// message that can't be enqueued.
  final List<BatchResultErrorEntry> failed;

  SendMessageBatchResult({
    @required this.successful,
    @required this.failed,
  });
  static SendMessageBatchResult fromJson(Map<String, dynamic> json) =>
      SendMessageBatchResult(
        successful: (json['Successful'] as List)
            .map((e) => SendMessageBatchResultEntry.fromJson(e))
            .toList(),
        failed: (json['Failed'] as List)
            .map((e) => BatchResultErrorEntry.fromJson(e))
            .toList(),
      );
}

/// Encloses a `MessageId` for a successfully-enqueued message in a
/// `SendMessageBatch.`
class SendMessageBatchResultEntry {
  /// An identifier for the message in this batch.
  final String id;

  /// An identifier for the message.
  final String messageId;

  /// An MD5 digest of the non-URL-encoded message attribute string. You can use
  /// this attribute to verify that Amazon SQS received the message correctly.
  /// Amazon SQS URL-decodes the message before creating the MD5 digest. For
  /// information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageBody;

  /// An MD5 digest of the non-URL-encoded message attribute string. You can use
  /// this attribute to verify that Amazon SQS received the message correctly.
  /// Amazon SQS URL-decodes the message before creating the MD5 digest. For
  /// information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageAttributes;

  /// An MD5 digest of the non-URL-encoded message system attribute string. You
  /// can use this attribute to verify that Amazon SQS received the message
  /// correctly. Amazon SQS URL-decodes the message before creating the MD5
  /// digest. For information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageSystemAttributes;

  /// This parameter applies only to FIFO (first-in-first-out) queues.
  ///
  /// The large, non-consecutive number that Amazon SQS assigns to each message.
  ///
  /// The length of `SequenceNumber` is 128 bits. As `SequenceNumber` continues
  /// to increase for a particular `MessageGroupId`.
  final String sequenceNumber;

  SendMessageBatchResultEntry({
    @required this.id,
    @required this.messageId,
    @required this.md5OfMessageBody,
    this.md5OfMessageAttributes,
    this.md5OfMessageSystemAttributes,
    this.sequenceNumber,
  });
  static SendMessageBatchResultEntry fromJson(Map<String, dynamic> json) =>
      SendMessageBatchResultEntry(
        id: json['Id'] as String,
        messageId: json['MessageId'] as String,
        md5OfMessageBody: json['MD5OfMessageBody'] as String,
        md5OfMessageAttributes: json.containsKey('MD5OfMessageAttributes')
            ? json['MD5OfMessageAttributes'] as String
            : null,
        md5OfMessageSystemAttributes:
            json.containsKey('MD5OfMessageSystemAttributes')
                ? json['MD5OfMessageSystemAttributes'] as String
                : null,
        sequenceNumber: json.containsKey('SequenceNumber')
            ? json['SequenceNumber'] as String
            : null,
      );
}

/// The `MD5OfMessageBody` and `MessageId` elements.
class SendMessageResult {
  /// An MD5 digest of the non-URL-encoded message attribute string. You can use
  /// this attribute to verify that Amazon SQS received the message correctly.
  /// Amazon SQS URL-decodes the message before creating the MD5 digest. For
  /// information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageBody;

  /// An MD5 digest of the non-URL-encoded message attribute string. You can use
  /// this attribute to verify that Amazon SQS received the message correctly.
  /// Amazon SQS URL-decodes the message before creating the MD5 digest. For
  /// information about MD5, see
  /// [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
  final String md5OfMessageAttributes;

  /// An MD5 digest of the non-URL-encoded message system attribute string. You
  /// can use this attribute to verify that Amazon SQS received the message
  /// correctly. Amazon SQS URL-decodes the message before creating the MD5
  /// digest.
  final String md5OfMessageSystemAttributes;

  /// An attribute containing the `MessageId` of the message sent to the queue.
  /// For more information, see
  /// [Queue and Message Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  final String messageId;

  /// This parameter applies only to FIFO (first-in-first-out) queues.
  ///
  /// The large, non-consecutive number that Amazon SQS assigns to each message.
  ///
  /// The length of `SequenceNumber` is 128 bits. `SequenceNumber` continues to
  /// increase for a particular `MessageGroupId`.
  final String sequenceNumber;

  SendMessageResult({
    this.md5OfMessageBody,
    this.md5OfMessageAttributes,
    this.md5OfMessageSystemAttributes,
    this.messageId,
    this.sequenceNumber,
  });
  static SendMessageResult fromJson(Map<String, dynamic> json) =>
      SendMessageResult(
        md5OfMessageBody: json.containsKey('MD5OfMessageBody')
            ? json['MD5OfMessageBody'] as String
            : null,
        md5OfMessageAttributes: json.containsKey('MD5OfMessageAttributes')
            ? json['MD5OfMessageAttributes'] as String
            : null,
        md5OfMessageSystemAttributes:
            json.containsKey('MD5OfMessageSystemAttributes')
                ? json['MD5OfMessageSystemAttributes'] as String
                : null,
        messageId:
            json.containsKey('MessageId') ? json['MessageId'] as String : null,
        sequenceNumber: json.containsKey('SequenceNumber')
            ? json['SequenceNumber'] as String
            : null,
      );
}
