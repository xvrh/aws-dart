import 'package:meta/meta.dart';

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
///     *    [Making API
/// Requests](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-making-api-requests.html)
///
///     *    [Amazon SQS Message
/// Attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-attributes.html)
///
///     *    [Amazon SQS Dead-Letter
/// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
///
///
/// *    [Amazon SQS in the _AWS CLI Command
/// Reference_](http://docs.aws.amazon.com/cli/latest/reference/sqs/index.html)
///
/// *    _Amazon Web Services General Reference_
///
///     *    [Regions and
/// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#sqs_region)
class SqsApi {
  /// Adds a permission to a queue for a specific
  /// [principal](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P).
  /// This allows sharing access to the queue.
  ///
  /// When you create a queue, you have full control access rights for the
  /// queue. Only you, the owner of the queue, can grant or deny permissions to
  /// the queue. For more information about these permissions, see [Allow
  /// Developers to Write Messages to a Shared
  /// Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///   *    `AddPermission` generates a policy for you. You can use
  /// `SetQueueAttributes`  to upload your policy. For more information, see
  /// [Using Custom Policies with the Amazon SQS Access Policy
  /// Language](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-creating-custom-policies.html)
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
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> addPermission(
      {@required String queueUrl,
      @required String label,
      @required List<String> awsAccountIds,
      @required List<String> actions}) async {}

  /// Changes the visibility timeout of a specified message in a queue to a new
  /// value. The default visibility timeout for a message is 30 seconds. The
  /// minimum is 0 seconds. The maximum is 12 hours. For more information, see
  /// [Visibility
  /// Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
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
  /// use to process your messages. To request a limit increase, [file a support
  /// request](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-sqs).
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
  Future<void> changeMessageVisibility(
      {@required String queueUrl,
      @required String receiptHandle,
      @required int visibilityTimeout}) async {}

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
  Future<void> changeMessageVisibilityBatch(
      {@required
          String queueUrl,
      @required
          List<ChangeMessageVisibilityBatchRequestEntry> entries}) async {}

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
  /// [Moving From a Standard Queue to a FIFO
  /// Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/FIFO-queues.html#FIFO-queues-moving)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  /// *   If you don't provide a value for an attribute, the queue is created
  /// with the default value for the attribute.
  ///
  /// *   If you delete a queue, you must wait at least 60 seconds before
  /// creating a queue with the same name.
  ///
  ///
  /// To successfully create a new queue, you must provide a queue name that
  /// adheres to the [limits related to
  /// queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/limits-queues.html)
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
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> createQueue(String queueName,
      {Map<String, String> attributes, Map<String, String> tags}) async {}

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
  Future<void> deleteMessage(
      {@required String queueUrl, @required String receiptHandle}) async {}

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
  Future<void> deleteMessageBatch(
      {@required String queueUrl,
      @required List<DeleteMessageBatchRequestEntry> entries}) async {}

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
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> deleteQueue(String queueUrl) async {}

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
  Future<void> getQueueAttributes(String queueUrl,
      {List<String> attributeNames}) async {}

  /// Returns the URL of an existing Amazon SQS queue.
  ///
  /// To access a queue that belongs to another AWS account, use the
  /// `QueueOwnerAWSAccountId` parameter to specify the account ID of the
  /// queue's owner. The queue's owner must grant you permission to access the
  /// queue. For more information about shared queue access, see
  /// `AddPermission`  or see [Allow Developers to Write Messages to a Shared
  /// Queue](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-writing-an-sqs-policy.html#write-messages-to-shared-queue)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> getQueueUrl(String queueName,
      {String queueOwnerAwsAccountId}) async {}

  /// Returns a list of your queues that have the `RedrivePolicy` queue
  /// attribute configured with a dead-letter queue.
  ///
  /// For more information about using dead-letter queues, see [Using Amazon SQS
  /// Dead-Letter
  /// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-dead-letter-queues.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> listDeadLetterSourceQueues(String queueUrl) async {}

  /// List all cost allocation tags added to the specified Amazon SQS queue. For
  /// an overview, see [Tagging Your Amazon SQS
  /// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> listQueueTags(String queueUrl) async {}

  /// Returns a list of your queues. The maximum number of queues that can be
  /// returned is 1,000. If you specify a value for the optional
  /// `QueueNamePrefix` parameter, only queues with a name that begins with the
  /// specified value are returned.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> listQueues({String queueNamePrefix}) async {}

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
  Future<void> purgeQueue(String queueUrl) async {}

  /// Retrieves one or more messages (up to 10), from the specified queue. Using
  /// the `WaitTimeSeconds` parameter enables long-poll support. For more
  /// information, see [Amazon SQS Long
  /// Polling](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html)
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
  /// message. For more information, see [Queue and Message
  /// Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// You can provide the `VisibilityTimeout` parameter in your request. The
  /// parameter is applied to the messages that Amazon SQS returns in the
  /// response. If you don't include the parameter, the overall visibility
  /// timeout for the queue is used for the returned messages. For more
  /// information, see [Visibility
  /// Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
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
  Future<void> receiveMessage(String queueUrl,
      {List<String> attributeNames,
      List<String> messageAttributeNames,
      int maxNumberOfMessages,
      int visibilityTimeout,
      int waitTimeSeconds,
      String receiveRequestAttemptId}) async {}

  /// Revokes any permissions in the queue policy that matches the specified
  /// `Label` parameter.
  ///
  ///
  ///
  /// *   Only the owner of a queue can remove permissions from it.
  ///
  /// *   Cross-account permissions don't apply to this action. For more
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   To remove the ability to change queue permissions, you must deny
  /// permission to the `AddPermission`, `RemovePermission`, and
  /// `SetQueueAttributes` actions in your IAM policy.
  Future<void> removePermission(
      {@required String queueUrl, @required String label}) async {}

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
  /// information, see the [W3C specification for
  /// characters](http://www.w3.org/TR/REC-xml/#charsets).
  Future<void> sendMessage(
      {@required String queueUrl,
      @required String messageBody,
      int delaySeconds,
      Map<String, MessageAttributeValue> messageAttributes,
      Map<String, MessageSystemAttributeValue> messageSystemAttributes,
      String messageDeduplicationId,
      String messageGroupId}) async {}

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
  /// information, see the [W3C specification for
  /// characters](http://www.w3.org/TR/REC-xml/#charsets).
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
  Future<void> sendMessageBatch(
      {@required String queueUrl,
      @required List<SendMessageBatchRequestEntry> entries}) async {}

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
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  /// *   To remove the ability to change queue permissions, you must deny
  /// permission to the `AddPermission`, `RemovePermission`, and
  /// `SetQueueAttributes` actions in your IAM policy.
  Future<void> setQueueAttributes(
      {@required String queueUrl,
      @required Map<String, String> attributes}) async {}

  /// Add cost allocation tags to the specified Amazon SQS queue. For an
  /// overview, see [Tagging Your Amazon SQS
  /// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
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
  /// For a full list of tag restrictions, see [Limits Related to
  /// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-limits.html#limits-queues)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> tagQueue(
      {@required String queueUrl, @required Map<String, String> tags}) async {}

  /// Remove cost allocation tags from the specified Amazon SQS queue. For an
  /// overview, see [Tagging Your Amazon SQS
  /// Queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  ///
  ///
  ///
  /// Cross-account permissions don't apply to this action. For more
  /// information, see [Grant Cross-Account Permissions to a Role and a User
  /// Name](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-customer-managed-policy-examples.html#grant-cross-account-permissions-to-role-and-user-name)
  /// in the _Amazon Simple Queue Service Developer Guide_.
  Future<void> untagQueue(
      {@required String queueUrl, @required List<String> tagKeys}) async {}
}

class BatchResultErrorEntry {}

class ChangeMessageVisibilityBatchRequestEntry {}

class ChangeMessageVisibilityBatchResult {}

class ChangeMessageVisibilityBatchResultEntry {}

class CreateQueueResult {}

class DeleteMessageBatchRequestEntry {}

class DeleteMessageBatchResult {}

class DeleteMessageBatchResultEntry {}

class GetQueueAttributesResult {}

class GetQueueUrlResult {}

class ListDeadLetterSourceQueuesResult {}

class ListQueueTagsResult {}

class ListQueuesResult {}

class Message {}

class MessageAttributeValue {}

class MessageSystemAttributeValue {}

class ReceiveMessageResult {}

class SendMessageBatchRequestEntry {}

class SendMessageBatchResult {}

class SendMessageBatchResultEntry {}

class SendMessageResult {}
