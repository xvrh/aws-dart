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
  Future<void> deleteSession(
      {@required String botName,
      @required String botAlias,
      @required String userId}) async {}

  /// Returns session information for a specified bot, alias, and user ID.
  Future<void> getSession(
      {@required String botName,
      @required String botAlias,
      @required String userId}) async {}

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
  Future<void> postContent(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      String sessionAttributes,
      String requestAttributes,
      @required String contentType,
      String accept,
      @required Uint8List inputStream}) async {}

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
  Future<void> postText(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      Map<String, String> sessionAttributes,
      Map<String, String> requestAttributes,
      @required String inputText}) async {}

  /// Creates a new session or modifies an existing session with an Amazon Lex
  /// bot. Use this operation to enable your application to set the state of the
  /// bot.
  ///
  /// For more information, see [Managing
  /// Sessions](https://docs.aws.amazon.com/lex/latest/dg/how-session-api.html).
  Future<void> putSession(
      {@required String botName,
      @required String botAlias,
      @required String userId,
      Map<String, String> sessionAttributes,
      DialogAction dialogAction,
      String accept}) async {}
}

class Button {}

class DeleteSessionResponse {}

class DialogAction {}

class GenericAttachment {}

class GetSessionResponse {}

class IntentSummary {}

class PostContentResponse {}

class PostTextResponse {}

class PutSessionResponse {}

class ResponseCard {}
