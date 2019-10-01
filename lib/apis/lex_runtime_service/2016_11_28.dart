import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Lex provides both build and runtime endpoints. Each endpoint provides
/// a set of operations (API). Your conversational bot uses the runtime API to
/// understand user utterances (user input text or voice). For example, suppose
/// a user says "I want pizza", your bot sends this input to Amazon Lex using
/// the runtime API. Amazon Lex recognizes that the user request is for the
/// OrderPizza intent (one of the intents defined in the bot). Then Amazon Lex
/// engages in user conversation on behalf of the bot to elicit required
/// information (slot values, such as pizza size and crust type), and then
/// performs fulfillment activity (that you configured when you created the
/// bot). You use the build-time API to create and manage your Amazon Lex bot.
/// For a list of build-time operations, see the build-time API, .
class LexRuntimeServiceApi {
  /// Removes session information for a specified bot, alias, and user ID.
  ///
  /// [botName]: The name of the bot that contains the session data.
  ///
  /// [botAlias]: The alias in use for the bot that contains the session data.
  ///
  /// [userId]: The identifier of the user associated with the session data.
  Future<DeleteSessionResponse> deleteSession(
      {@required String botName,
      @required String botAlias,
      @required String userId}) async {
    return DeleteSessionResponse.fromJson({});
  }

  /// Returns session information for a specified bot, alias, and user ID.
  ///
  /// [botName]: The name of the bot that contains the session data.
  ///
  /// [botAlias]: The alias in use for the bot that contains the session data.
  ///
  /// [userId]: The ID of the client application user. Amazon Lex uses this to
  /// identify a user's conversation with your bot.
  Future<GetSessionResponse> getSession(
      {@required String botName,
      @required String botAlias,
      @required String userId}) async {
    return GetSessionResponse.fromJson({});
  }

  ///  Sends user input (text or speech) to Amazon Lex. Clients use this API to
  /// send text and audio requests to Amazon Lex at runtime. Amazon Lex
  /// interprets the user input using the machine learning model that it built
  /// for the bot.
  ///
  /// The `PostContent` operation supports audio input at 8kHz and 16kHz. You
  /// can use 8kHz audio to achieve higher speech recognition accuracy in
  /// telephone audio applications.
  ///
  ///  In response, Amazon Lex returns the next message to convey to the user.
  /// Consider the following example messages:
  ///
  /// *    For a user input "I would like a pizza," Amazon Lex might return a
  /// response with a message eliciting slot data (for example, `PizzaSize`):
  /// "What size pizza would you like?".
  ///
  /// *    After the user provides all of the pizza order information, Amazon
  /// Lex might return a response with a message to get user confirmation:
  /// "Order the pizza?".
  ///
  /// *    After the user replies "Yes" to the confirmation prompt, Amazon Lex
  /// might return a conclusion statement: "Thank you, your cheese pizza has
  /// been ordered.".
  ///
  ///
  ///  Not all Amazon Lex messages require a response from the user. For
  /// example, conclusion statements do not require a response. Some messages
  /// require only a yes or no response. In addition to the `message`, Amazon
  /// Lex provides additional context about the message in the response that you
  /// can use to enhance client behavior, such as displaying the appropriate
  /// client user interface. Consider the following examples:
  ///
  /// *    If the message is to elicit slot data, Amazon Lex returns the
  /// following context information:
  ///
  ///     *    `x-amz-lex-dialog-state` header set to `ElicitSlot`
  ///
  ///     *    `x-amz-lex-intent-name` header set to the intent name in the
  /// current context
  ///
  ///     *    `x-amz-lex-slot-to-elicit` header set to the slot name for which
  /// the `message` is eliciting information
  ///
  ///     *    `x-amz-lex-slots` header set to a map of slots configured for the
  /// intent with their current values
  ///
  ///
  /// *    If the message is a confirmation prompt, the `x-amz-lex-dialog-state`
  /// header is set to `Confirmation` and the `x-amz-lex-slot-to-elicit` header
  /// is omitted.
  ///
  /// *    If the message is a clarification prompt configured for the intent,
  /// indicating that the user intent is not understood, the
  /// `x-amz-dialog-state` header is set to `ElicitIntent` and the
  /// `x-amz-slot-to-elicit` header is omitted.
  ///
  ///
  ///  In addition, Amazon Lex also returns your application-specific
  /// `sessionAttributes`. For more information, see [Managing Conversation
  /// Context](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html).
  ///
  /// [botName]: Name of the Amazon Lex bot.
  ///
  /// [botAlias]: Alias of the Amazon Lex bot.
  ///
  /// [userId]: The ID of the client application user. Amazon Lex uses this to
  /// identify a user's conversation with your bot. At runtime, each request
  /// must contain the `userID` field.
  ///
  /// To decide the user ID to use for your application, consider the following
  /// factors.
  ///
  /// *   The `userID` field must not contain any personally identifiable
  /// information of the user, for example, name, personal identification
  /// numbers, or other end user personal information.
  ///
  /// *   If you want a user to start a conversation on one device and continue
  /// on another device, use a user-specific identifier.
  ///
  /// *   If you want the same user to be able to have two independent
  /// conversations on two different devices, choose a device-specific
  /// identifier.
  ///
  /// *   A user can't have two independent conversations with two different
  /// versions of the same bot. For example, a user can't have a conversation
  /// with the PROD and BETA versions of the same bot. If you anticipate that a
  /// user will need to have conversation with two different versions, for
  /// example, while testing, include the bot alias in the user ID to separate
  /// the two conversations.
  ///
  /// [sessionAttributes]: You pass this value as the
  /// `x-amz-lex-session-attributes` HTTP header.
  ///
  /// Application-specific information passed between Amazon Lex and a client
  /// application. The value must be a JSON serialized and base64 encoded map
  /// with string keys and values. The total size of the `sessionAttributes` and
  /// `requestAttributes` headers is limited to 12 KB.
  ///
  /// For more information, see [Setting Session
  /// Attributes](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs).
  ///
  /// [requestAttributes]: You pass this value as the
  /// `x-amz-lex-request-attributes` HTTP header.
  ///
  /// Request-specific information passed between Amazon Lex and a client
  /// application. The value must be a JSON serialized and base64 encoded map
  /// with string keys and values. The total size of the `requestAttributes` and
  /// `sessionAttributes` headers is limited to 12 KB.
  ///
  /// The namespace `x-amz-lex:` is reserved for special attributes. Don't
  /// create any request attributes with the prefix `x-amz-lex:`.
  ///
  /// For more information, see [Setting Request
  /// Attributes](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs).
  ///
  /// [contentType]:  You pass this value as the `Content-Type` HTTP header.
  ///
  ///  Indicates the audio format or text. The header value must start with one
  /// of the following prefixes:
  ///
  /// *   PCM format, audio data must be in little-endian byte order.
  ///
  ///     *   audio/l16; rate=16000; channels=1
  ///
  ///     *   audio/x-l16; sample-rate=16000; channel-count=1
  ///
  ///     *   audio/lpcm; sample-rate=8000; sample-size-bits=16;
  /// channel-count=1; is-big-endian=false
  ///
  ///
  /// *   Opus format
  ///
  ///     *   audio/x-cbr-opus-with-preamble; preamble-size=0; bit-rate=256000;
  /// frame-size-milliseconds=4
  ///
  ///
  /// *   Text format
  ///
  ///     *   text/plain; charset=utf-8
  ///
  /// [accept]:  You pass this value as the `Accept` HTTP header.
  ///
  ///  The message Amazon Lex returns in the response can be either text or
  /// speech based on the `Accept` HTTP header value in the request.
  ///
  /// *    If the value is `text/plain; charset=utf-8`, Amazon Lex returns text
  /// in the response.
  ///
  /// *    If the value begins with `audio/`, Amazon Lex returns speech in the
  /// response. Amazon Lex uses Amazon Polly to generate the speech (using the
  /// configuration you specified in the `Accept` header). For example, if you
  /// specify `audio/mpeg` as the value, Amazon Lex returns speech in the MPEG
  /// format.
  ///
  /// *   If the value is `audio/pcm`, the speech returned is `audio/pcm` in
  /// 16-bit, little endian format.
  ///
  /// *   The following are the accepted values:
  ///
  ///     *   audio/mpeg
  ///
  ///     *   audio/ogg
  ///
  ///     *   audio/pcm
  ///
  ///     *   text/plain; charset=utf-8
  ///
  ///     *   audio/* (defaults to mpeg)
  ///
  /// [inputStream]:  User input in PCM or Opus audio format or text format as
  /// described in the `Content-Type` HTTP header.
  ///
  /// You can stream audio data to Amazon Lex or you can create a local buffer
  /// that captures all of the audio data before sending. In general, you get
  /// better performance if you stream audio data rather than buffering the data
  /// locally.
  Future<PostContentResponse> postContent(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      String sessionAttributes,
      String requestAttributes,
      @required String contentType,
      String accept,
      @required Uint8List inputStream}) async {
    return PostContentResponse.fromJson({});
  }

  /// Sends user input (text or SSML) to Amazon Lex. Client applications can use
  /// this API to send requests to Amazon Lex at runtime. Amazon Lex then
  /// interprets the user input using the machine learning model it built for
  /// the bot.
  ///
  ///  In response, Amazon Lex returns the next `message` to convey to the user
  /// an optional `responseCard` to display. Consider the following example
  /// messages:
  ///
  /// *    For a user input "I would like a pizza", Amazon Lex might return a
  /// response with a message eliciting slot data (for example, PizzaSize):
  /// "What size pizza would you like?"
  ///
  /// *    After the user provides all of the pizza order information, Amazon
  /// Lex might return a response with a message to obtain user confirmation
  /// "Proceed with the pizza order?".
  ///
  /// *    After the user replies to a confirmation prompt with a "yes", Amazon
  /// Lex might return a conclusion statement: "Thank you, your cheese pizza has
  /// been ordered.".
  ///
  ///
  ///  Not all Amazon Lex messages require a user response. For example, a
  /// conclusion statement does not require a response. Some messages require
  /// only a "yes" or "no" user response. In addition to the `message`, Amazon
  /// Lex provides additional context about the message in the response that you
  /// might use to enhance client behavior, for example, to display the
  /// appropriate client user interface. These are the `slotToElicit`,
  /// `dialogState`, `intentName`, and `slots` fields in the response. Consider
  /// the following examples:
  ///
  /// *   If the message is to elicit slot data, Amazon Lex returns the
  /// following context information:
  ///
  ///     *    `dialogState` set to ElicitSlot
  ///
  ///     *    `intentName` set to the intent name in the current context
  ///
  ///     *    `slotToElicit` set to the slot name for which the `message` is
  /// eliciting information
  ///
  ///     *    `slots` set to a map of slots, configured for the intent, with
  /// currently known values
  ///
  ///
  /// *    If the message is a confirmation prompt, the `dialogState` is set to
  /// ConfirmIntent and `SlotToElicit` is set to null.
  ///
  /// *   If the message is a clarification prompt (configured for the intent)
  /// that indicates that user intent is not understood, the `dialogState` is
  /// set to ElicitIntent and `slotToElicit` is set to null.
  ///
  ///
  ///  In addition, Amazon Lex also returns your application-specific
  /// `sessionAttributes`. For more information, see [Managing Conversation
  /// Context](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html).
  ///
  /// [botName]: The name of the Amazon Lex bot.
  ///
  /// [botAlias]: The alias of the Amazon Lex bot.
  ///
  /// [userId]: The ID of the client application user. Amazon Lex uses this to
  /// identify a user's conversation with your bot. At runtime, each request
  /// must contain the `userID` field.
  ///
  /// To decide the user ID to use for your application, consider the following
  /// factors.
  ///
  /// *   The `userID` field must not contain any personally identifiable
  /// information of the user, for example, name, personal identification
  /// numbers, or other end user personal information.
  ///
  /// *   If you want a user to start a conversation on one device and continue
  /// on another device, use a user-specific identifier.
  ///
  /// *   If you want the same user to be able to have two independent
  /// conversations on two different devices, choose a device-specific
  /// identifier.
  ///
  /// *   A user can't have two independent conversations with two different
  /// versions of the same bot. For example, a user can't have a conversation
  /// with the PROD and BETA versions of the same bot. If you anticipate that a
  /// user will need to have conversation with two different versions, for
  /// example, while testing, include the bot alias in the user ID to separate
  /// the two conversations.
  ///
  /// [sessionAttributes]: Application-specific information passed between
  /// Amazon Lex and a client application.
  ///
  /// For more information, see [Setting Session
  /// Attributes](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-session-attribs).
  ///
  /// [requestAttributes]: Request-specific information passed between Amazon
  /// Lex and a client application.
  ///
  /// The namespace `x-amz-lex:` is reserved for special attributes. Don't
  /// create any request attributes with the prefix `x-amz-lex:`.
  ///
  /// For more information, see [Setting Request
  /// Attributes](https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html#context-mgmt-request-attribs).
  ///
  /// [inputText]: The text that the user entered (Amazon Lex interprets this
  /// text).
  Future<PostTextResponse> postText(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      Map<String, String> sessionAttributes,
      Map<String, String> requestAttributes,
      @required String inputText}) async {
    return PostTextResponse.fromJson({});
  }

  /// Creates a new session or modifies an existing session with an Amazon Lex
  /// bot. Use this operation to enable your application to set the state of the
  /// bot.
  ///
  /// For more information, see [Managing
  /// Sessions](https://docs.aws.amazon.com/lex/latest/dg/how-session-api.html).
  ///
  /// [botName]: The name of the bot that contains the session data.
  ///
  /// [botAlias]: The alias in use for the bot that contains the session data.
  ///
  /// [userId]: The ID of the client application user. Amazon Lex uses this to
  /// identify a user's conversation with your bot.
  ///
  /// [sessionAttributes]: Map of key/value pairs representing the
  /// session-specific context information. It contains application information
  /// passed between Amazon Lex and a client application.
  ///
  /// [dialogAction]: Sets the next action that the bot should take to fulfill
  /// the conversation.
  ///
  /// [accept]: The message that Amazon Lex returns in the response can be
  /// either text or speech based depending on the value of this field.
  ///
  /// *   If the value is `text/plain; charset=utf-8`, Amazon Lex returns text
  /// in the response.
  ///
  /// *   If the value begins with `audio/`, Amazon Lex returns speech in the
  /// response. Amazon Lex uses Amazon Polly to generate the speech in the
  /// configuration that you specify. For example, if you specify `audio/mpeg`
  /// as the value, Amazon Lex returns speech in the MPEG format.
  ///
  /// *   If the value is `audio/pcm`, the speech is returned as `audio/pcm` in
  /// 16-bit, little endian format.
  ///
  /// *   The following are the accepted values:
  ///
  ///     *    `audio/mpeg`
  ///
  ///     *    `audio/ogg`
  ///
  ///     *    `audio/pcm`
  ///
  ///     *    `audio/*` (defaults to mpeg)
  ///
  ///     *    `text/plain; charset=utf-8`
  Future<PutSessionResponse> putSession(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      Map<String, String> sessionAttributes,
      DialogAction dialogAction,
      String accept}) async {
    return PutSessionResponse.fromJson({});
  }
}

class Button {
  /// Text that is visible to the user on the button.
  final String text;

  /// The value sent to Amazon Lex when a user chooses the button. For example,
  /// consider button text "NYC." When the user chooses the button, the value
  /// sent can be "New York City."
  final String value;

  Button({
    @required this.text,
    @required this.value,
  });
  static Button fromJson(Map<String, dynamic> json) => Button();
}

class DeleteSessionResponse {
  /// The name of the bot associated with the session data.
  final String botName;

  /// The alias in use for the bot associated with the session data.
  final String botAlias;

  /// The ID of the client application user.
  final String userId;

  /// The unique identifier for the session.
  final String sessionId;

  DeleteSessionResponse({
    this.botName,
    this.botAlias,
    this.userId,
    this.sessionId,
  });
  static DeleteSessionResponse fromJson(Map<String, dynamic> json) =>
      DeleteSessionResponse();
}

class DialogAction {
  /// The next action that the bot should take in its interaction with the user.
  /// The possible values are:
  ///
  /// *    `ConfirmIntent` \- The next action is asking the user if the intent
  /// is complete and ready to be fulfilled. This is a yes/no question such as
  /// "Place the order?"
  ///
  /// *    `Close` \- Indicates that the there will not be a response from the
  /// user. For example, the statement "Your order has been placed" does not
  /// require a response.
  ///
  /// *    `Delegate` \- The next action is determined by Amazon Lex.
  ///
  /// *    `ElicitIntent` \- The next action is to determine the intent that the
  /// user wants to fulfill.
  ///
  /// *    `ElicitSlot` \- The next action is to elicit a slot value from the
  /// user.
  final String type;

  /// The name of the intent.
  final String intentName;

  /// Map of the slots that have been gathered and their values.
  final Map<String, String> slots;

  /// The name of the slot that should be elicited from the user.
  final String slotToElicit;

  /// The fulfillment state of the intent. The possible values are:
  ///
  /// *    `Failed` \- The Lambda function associated with the intent failed to
  /// fulfill the intent.
  ///
  /// *    `Fulfilled` \- The intent has fulfilled by the Lambda function
  /// associated with the intent.
  ///
  /// *    `ReadyForFulfillment` \- All of the information necessary for the
  /// intent is present and the intent ready to be fulfilled by the client
  /// application.
  final String fulfillmentState;

  /// The message that should be shown to the user. If you don't specify a
  /// message, Amazon Lex will use the message configured for the intent.
  final String message;

  /// *    `PlainText` \- The message contains plain UTF-8 text.
  ///
  /// *    `CustomPayload` \- The message is a custom format for the client.
  ///
  /// *    `SSML` \- The message contains text formatted for voice output.
  ///
  /// *    `Composite` \- The message contains an escaped JSON object containing
  /// one or more messages. For more information, see [Message
  /// Groups](https://docs.aws.amazon.com/lex/latest/dg/howitworks-manage-prompts.html).
  final String messageFormat;

  DialogAction({
    @required this.type,
    this.intentName,
    this.slots,
    this.slotToElicit,
    this.fulfillmentState,
    this.message,
    this.messageFormat,
  });
  static DialogAction fromJson(Map<String, dynamic> json) => DialogAction();
}

class GenericAttachment {
  /// The title of the option.
  final String title;

  /// The subtitle shown below the title.
  final String subTitle;

  /// The URL of an attachment to the response card.
  final String attachmentLinkUrl;

  /// The URL of an image that is displayed to the user.
  final String imageUrl;

  /// The list of options to show to the user.
  final List<Button> buttons;

  GenericAttachment({
    this.title,
    this.subTitle,
    this.attachmentLinkUrl,
    this.imageUrl,
    this.buttons,
  });
  static GenericAttachment fromJson(Map<String, dynamic> json) =>
      GenericAttachment();
}

class GetSessionResponse {
  /// An array of information about the intents used in the session. The array
  /// can contain a maximum of three summaries. If more than three intents are
  /// used in the session, the `recentIntentSummaryView` operation contains
  /// information about the last three intents used.
  final List<IntentSummary> recentIntentSummaryView;

  /// Map of key/value pairs representing the session-specific context
  /// information. It contains application information passed between Amazon Lex
  /// and a client application.
  final Map<String, String> sessionAttributes;

  /// A unique identifier for the session.
  final String sessionId;

  /// Describes the current state of the bot.
  final DialogAction dialogAction;

  GetSessionResponse({
    this.recentIntentSummaryView,
    this.sessionAttributes,
    this.sessionId,
    this.dialogAction,
  });
  static GetSessionResponse fromJson(Map<String, dynamic> json) =>
      GetSessionResponse();
}

class IntentSummary {
  /// The name of the intent.
  final String intentName;

  /// Map of the slots that have been gathered and their values.
  final Map<String, String> slots;

  /// The status of the intent after the user responds to the confirmation
  /// prompt. If the user confirms the intent, Amazon Lex sets this field to
  /// `Confirmed`. If the user denies the intent, Amazon Lex sets this value to
  /// `Denied`. The possible values are:
  ///
  /// *    `Confirmed` \- The user has responded "Yes" to the confirmation
  /// prompt, confirming that the intent is complete and that it is ready to be
  /// fulfilled.
  ///
  /// *    `Denied` \- The user has responded "No" to the confirmation prompt.
  ///
  /// *    `None` \- The user has never been prompted for confirmation; or, the
  /// user was prompted but did not confirm or deny the prompt.
  final String confirmationStatus;

  /// The next action that the bot should take in its interaction with the user.
  /// The possible values are:
  ///
  /// *    `ConfirmIntent` \- The next action is asking the user if the intent
  /// is complete and ready to be fulfilled. This is a yes/no question such as
  /// "Place the order?"
  ///
  /// *    `Close` \- Indicates that the there will not be a response from the
  /// user. For example, the statement "Your order has been placed" does not
  /// require a response.
  ///
  /// *    `ElicitIntent` \- The next action is to determine the intent that the
  /// user wants to fulfill.
  ///
  /// *    `ElicitSlot` \- The next action is to elicit a slot value from the
  /// user.
  final String dialogActionType;

  /// The fulfillment state of the intent. The possible values are:
  ///
  /// *    `Failed` \- The Lambda function associated with the intent failed to
  /// fulfill the intent.
  ///
  /// *    `Fulfilled` \- The intent has fulfilled by the Lambda function
  /// associated with the intent.
  ///
  /// *    `ReadyForFulfillment` \- All of the information necessary for the
  /// intent is present and the intent ready to be fulfilled by the client
  /// application.
  final String fulfillmentState;

  /// The next slot to elicit from the user. If there is not slot to elicit, the
  /// field is blank.
  final String slotToElicit;

  IntentSummary({
    this.intentName,
    this.slots,
    this.confirmationStatus,
    @required this.dialogActionType,
    this.fulfillmentState,
    this.slotToElicit,
  });
  static IntentSummary fromJson(Map<String, dynamic> json) => IntentSummary();
}

class PostContentResponse {
  /// Content type as specified in the `Accept` HTTP header in the request.
  final String contentType;

  /// Current user intent that Amazon Lex is aware of.
  final String intentName;

  /// Map of zero or more intent slots (name/value pairs) Amazon Lex detected
  /// from the user input during the conversation. The field is base-64 encoded.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the `valueSelectionStrategy`
  /// selected when the slot type was created or updated. If
  /// `valueSelectionStrategy` is set to `ORIGINAL_VALUE`, the value provided by
  /// the user is returned, if the user value is similar to the slot values. If
  /// `valueSelectionStrategy` is set to `TOP_RESOLUTION` Amazon Lex returns the
  /// first value in the resolution list or, if there is no resolution list,
  /// null. If you don't specify a `valueSelectionStrategy`, the default is
  /// `ORIGINAL_VALUE`.
  final String slots;

  ///  Map of key/value pairs representing the session-specific context
  /// information.
  final String sessionAttributes;

  /// The message to convey to the user. The message can come from the bot's
  /// configuration or from a Lambda function.
  ///
  /// If the intent is not configured with a Lambda function, or if the Lambda
  /// function returned `Delegate` as the `dialogAction.type` in its response,
  /// Amazon Lex decides on the next course of action and selects an appropriate
  /// message from the bot's configuration based on the current interaction
  /// context. For example, if Amazon Lex isn't able to understand user input,
  /// it uses a clarification prompt message.
  ///
  /// When you create an intent you can assign messages to groups. When messages
  /// are assigned to groups Amazon Lex returns one message from each group in
  /// the response. The message field is an escaped JSON string containing the
  /// messages. For more information about the structure of the JSON string
  /// returned, see msg-prompts-formats.
  ///
  /// If the Lambda function returns a message, Amazon Lex passes it to the
  /// client in its response.
  final String message;

  /// The format of the response message. One of the following values:
  ///
  /// *    `PlainText` \- The message contains plain UTF-8 text.
  ///
  /// *    `CustomPayload` \- The message is a custom format for the client.
  ///
  /// *    `SSML` \- The message contains text formatted for voice output.
  ///
  /// *    `Composite` \- The message contains an escaped JSON object containing
  /// one or more messages from the groups that messages were assigned to when
  /// the intent was created.
  final String messageFormat;

  /// Identifies the current state of the user interaction. Amazon Lex returns
  /// one of the following values as `dialogState`. The client can optionally
  /// use this information to customize the user interface.
  ///
  /// *    `ElicitIntent` \- Amazon Lex wants to elicit the user's intent.
  /// Consider the following examples:
  ///
  ///      For example, a user might utter an intent ("I want to order a
  /// pizza"). If Amazon Lex cannot infer the user intent from this utterance,
  /// it will return this dialog state.
  ///
  /// *    `ConfirmIntent` \- Amazon Lex is expecting a "yes" or "no" response.
  ///
  ///     For example, Amazon Lex wants user confirmation before fulfilling an
  /// intent. Instead of a simple "yes" or "no" response, a user might respond
  /// with additional information. For example, "yes, but make it a thick crust
  /// pizza" or "no, I want to order a drink." Amazon Lex can process such
  /// additional information (in these examples, update the crust type slot or
  /// change the intent from OrderPizza to OrderDrink).
  ///
  /// *    `ElicitSlot` \- Amazon Lex is expecting the value of a slot for the
  /// current intent.
  ///
  ///      For example, suppose that in the response Amazon Lex sends this
  /// message: "What size pizza would you like?". A user might reply with the
  /// slot value (e.g., "medium"). The user might also provide additional
  /// information in the response (e.g., "medium thick crust pizza"). Amazon Lex
  /// can process such additional information appropriately.
  ///
  /// *    `Fulfilled` \- Conveys that the Lambda function has successfully
  /// fulfilled the intent.
  ///
  /// *    `ReadyForFulfillment` \- Conveys that the client has to fulfill the
  /// request.
  ///
  /// *    `Failed` \- Conveys that the conversation with the user failed.
  ///
  ///      This can happen for various reasons, including that the user does not
  /// provide an appropriate response to prompts from the service (you can
  /// configure how many times Amazon Lex can prompt a user for specific
  /// information), or if the Lambda function fails to fulfill the intent.
  final String dialogState;

  ///  If the `dialogState` value is `ElicitSlot`, returns the name of the slot
  /// for which Amazon Lex is eliciting a value.
  final String slotToElicit;

  /// The text used to process the request.
  ///
  /// If the input was an audio stream, the `inputTranscript` field contains the
  /// text extracted from the audio stream. This is the text that is actually
  /// processed to recognize intents and slot values. You can use this
  /// information to determine if Amazon Lex is correctly processing the audio
  /// that you send.
  final String inputTranscript;

  /// The prompt (or statement) to convey to the user. This is based on the bot
  /// configuration and context. For example, if Amazon Lex did not understand
  /// the user intent, it sends the `clarificationPrompt` configured for the
  /// bot. If the intent requires confirmation before taking the fulfillment
  /// action, it sends the `confirmationPrompt`. Another example: Suppose that
  /// the Lambda function successfully fulfilled the intent, and sent a message
  /// to convey to the user. Then Amazon Lex sends that message in the response.
  final Uint8List audioStream;

  PostContentResponse({
    this.contentType,
    this.intentName,
    this.slots,
    this.sessionAttributes,
    this.message,
    this.messageFormat,
    this.dialogState,
    this.slotToElicit,
    this.inputTranscript,
    this.audioStream,
  });
  static PostContentResponse fromJson(Map<String, dynamic> json) =>
      PostContentResponse();
}

class PostTextResponse {
  /// The current user intent that Amazon Lex is aware of.
  final String intentName;

  ///  The intent slots that Amazon Lex detected from the user input in the
  /// conversation.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the `valueSelectionStrategy`
  /// selected when the slot type was created or updated. If
  /// `valueSelectionStrategy` is set to `ORIGINAL_VALUE`, the value provided by
  /// the user is returned, if the user value is similar to the slot values. If
  /// `valueSelectionStrategy` is set to `TOP_RESOLUTION` Amazon Lex returns the
  /// first value in the resolution list or, if there is no resolution list,
  /// null. If you don't specify a `valueSelectionStrategy`, the default is
  /// `ORIGINAL_VALUE`.
  final Map<String, String> slots;

  /// A map of key-value pairs representing the session-specific context
  /// information.
  final Map<String, String> sessionAttributes;

  /// The message to convey to the user. The message can come from the bot's
  /// configuration or from a Lambda function.
  ///
  /// If the intent is not configured with a Lambda function, or if the Lambda
  /// function returned `Delegate` as the `dialogAction.type` its response,
  /// Amazon Lex decides on the next course of action and selects an appropriate
  /// message from the bot's configuration based on the current interaction
  /// context. For example, if Amazon Lex isn't able to understand user input,
  /// it uses a clarification prompt message.
  ///
  /// When you create an intent you can assign messages to groups. When messages
  /// are assigned to groups Amazon Lex returns one message from each group in
  /// the response. The message field is an escaped JSON string containing the
  /// messages. For more information about the structure of the JSON string
  /// returned, see msg-prompts-formats.
  ///
  /// If the Lambda function returns a message, Amazon Lex passes it to the
  /// client in its response.
  final String message;

  /// The format of the response message. One of the following values:
  ///
  /// *    `PlainText` \- The message contains plain UTF-8 text.
  ///
  /// *    `CustomPayload` \- The message is a custom format defined by the
  /// Lambda function.
  ///
  /// *    `SSML` \- The message contains text formatted for voice output.
  ///
  /// *    `Composite` \- The message contains an escaped JSON object containing
  /// one or more messages from the groups that messages were assigned to when
  /// the intent was created.
  final String messageFormat;

  ///  Identifies the current state of the user interaction. Amazon Lex returns
  /// one of the following values as `dialogState`. The client can optionally
  /// use this information to customize the user interface.
  ///
  /// *    `ElicitIntent` \- Amazon Lex wants to elicit user intent.
  ///
  ///     For example, a user might utter an intent ("I want to order a pizza").
  /// If Amazon Lex cannot infer the user intent from this utterance, it will
  /// return this dialogState.
  ///
  /// *    `ConfirmIntent` \- Amazon Lex is expecting a "yes" or "no" response.
  ///
  ///      For example, Amazon Lex wants user confirmation before fulfilling an
  /// intent.
  ///
  ///     Instead of a simple "yes" or "no," a user might respond with
  /// additional information. For example, "yes, but make it thick crust pizza"
  /// or "no, I want to order a drink". Amazon Lex can process such additional
  /// information (in these examples, update the crust type slot value, or
  /// change intent from OrderPizza to OrderDrink).
  ///
  /// *    `ElicitSlot` \- Amazon Lex is expecting a slot value for the current
  /// intent.
  ///
  ///     For example, suppose that in the response Amazon Lex sends this
  /// message: "What size pizza would you like?". A user might reply with the
  /// slot value (e.g., "medium"). The user might also provide additional
  /// information in the response (e.g., "medium thick crust pizza"). Amazon Lex
  /// can process such additional information appropriately.
  ///
  /// *    `Fulfilled` \- Conveys that the Lambda function configured for the
  /// intent has successfully fulfilled the intent.
  ///
  /// *    `ReadyForFulfillment` \- Conveys that the client has to fulfill the
  /// intent.
  ///
  /// *    `Failed` \- Conveys that the conversation with the user failed.
  ///
  ///      This can happen for various reasons including that the user did not
  /// provide an appropriate response to prompts from the service (you can
  /// configure how many times Amazon Lex can prompt a user for specific
  /// information), or the Lambda function failed to fulfill the intent.
  final String dialogState;

  /// If the `dialogState` value is `ElicitSlot`, returns the name of the slot
  /// for which Amazon Lex is eliciting a value.
  final String slotToElicit;

  /// Represents the options that the user has to respond to the current prompt.
  /// Response Card can come from the bot configuration (in the Amazon Lex
  /// console, choose the settings button next to a slot) or from a code hook
  /// (Lambda function).
  final ResponseCard responseCard;

  PostTextResponse({
    this.intentName,
    this.slots,
    this.sessionAttributes,
    this.message,
    this.messageFormat,
    this.dialogState,
    this.slotToElicit,
    this.responseCard,
  });
  static PostTextResponse fromJson(Map<String, dynamic> json) =>
      PostTextResponse();
}

class PutSessionResponse {
  /// Content type as specified in the `Accept` HTTP header in the request.
  final String contentType;

  /// The name of the current intent.
  final String intentName;

  /// Map of zero or more intent slots Amazon Lex detected from the user input
  /// during the conversation.
  ///
  /// Amazon Lex creates a resolution list containing likely values for a slot.
  /// The value that it returns is determined by the `valueSelectionStrategy`
  /// selected when the slot type was created or updated. If
  /// `valueSelectionStrategy` is set to `ORIGINAL_VALUE`, the value provided by
  /// the user is returned, if the user value is similar to the slot values. If
  /// `valueSelectionStrategy` is set to `TOP_RESOLUTION` Amazon Lex returns the
  /// first value in the resolution list or, if there is no resolution list,
  /// null. If you don't specify a `valueSelectionStrategy` the default is
  /// `ORIGINAL_VALUE`.
  final String slots;

  /// Map of key/value pairs representing session-specific context information.
  final String sessionAttributes;

  /// The next message that should be presented to the user.
  final String message;

  /// The format of the response message. One of the following values:
  ///
  /// *    `PlainText` \- The message contains plain UTF-8 text.
  ///
  /// *    `CustomPayload` \- The message is a custom format for the client.
  ///
  /// *    `SSML` \- The message contains text formatted for voice output.
  ///
  /// *    `Composite` \- The message contains an escaped JSON object containing
  /// one or more messages from the groups that messages were assigned to when
  /// the intent was created.
  final String messageFormat;

  /// *    `ConfirmIntent` \- Amazon Lex is expecting a "yes" or "no" response
  /// to confirm the intent before fulfilling an intent.
  ///
  /// *    `ElicitIntent` \- Amazon Lex wants to elicit the user's intent.
  ///
  /// *    `ElicitSlot` \- Amazon Lex is expecting the value of a slot for the
  /// current intent.
  ///
  /// *    `Failed` \- Conveys that the conversation with the user has failed.
  /// This can happen for various reasons, including the user does not provide
  /// an appropriate response to prompts from the service, or if the Lambda
  /// function fails to fulfill the intent.
  ///
  /// *    `Fulfilled` \- Conveys that the Lambda function has sucessfully
  /// fulfilled the intent.
  ///
  /// *    `ReadyForFulfillment` \- Conveys that the client has to fulfill the
  /// intent.
  final String dialogState;

  /// If the `dialogState` is `ElicitSlot`, returns the name of the slot for
  /// which Amazon Lex is eliciting a value.
  final String slotToElicit;

  /// The audio version of the message to convey to the user.
  final Uint8List audioStream;

  /// A unique identifier for the session.
  final String sessionId;

  PutSessionResponse({
    this.contentType,
    this.intentName,
    this.slots,
    this.sessionAttributes,
    this.message,
    this.messageFormat,
    this.dialogState,
    this.slotToElicit,
    this.audioStream,
    this.sessionId,
  });
  static PutSessionResponse fromJson(Map<String, dynamic> json) =>
      PutSessionResponse();
}

class ResponseCard {
  /// The version of the response card format.
  final String version;

  /// The content type of the response.
  final String contentType;

  /// An array of attachment objects representing options.
  final List<GenericAttachment> genericAttachments;

  ResponseCard({
    this.version,
    this.contentType,
    this.genericAttachments,
  });
  static ResponseCard fromJson(Map<String, dynamic> json) => ResponseCard();
}
