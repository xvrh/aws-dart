import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Lex Build-Time Actions
///
///  Amazon Lex is an AWS service for building conversational voice and text
/// interfaces. Use these actions to create, update, and delete conversational
/// bots for new and existing client applications.
class LexModelBuildingServiceApi {
  /// Creates a new version of the bot based on the `$LATEST` version. If the
  /// `$LATEST` version of this resource hasn't changed since you created the
  /// last version, Amazon Lex doesn't create a new version. It returns the last
  /// created version.
  ///
  ///  You can update only the `$LATEST` version of the bot. You can't update
  /// the numbered versions that you create with the `CreateBotVersion`
  /// operation.
  ///
  ///  When you create the first version of a bot, Amazon Lex sets the version
  /// to 1. Subsequent versions increment by 1. For more information, see
  /// versioning-intro.
  ///
  ///  This operation requires permission for the `lex:CreateBotVersion` action.
  ///
  /// [name]: The name of the bot that you want to create a new version of. The
  /// name is case sensitive.
  ///
  /// [checksum]: Identifies a specific revision of the `$LATEST` version of the
  /// bot. If you specify a checksum and the `$LATEST` version of the bot has a
  /// different checksum, a `PreconditionFailedException` exception is returned
  /// and Amazon Lex doesn't publish a new version. If you don't specify a
  /// checksum, Amazon Lex publishes the `$LATEST` version.
  Future<CreateBotVersionResponse> createBotVersion(String name,
      {String checksum}) async {
    return CreateBotVersionResponse.fromJson({});
  }

  /// Creates a new version of an intent based on the `$LATEST` version of the
  /// intent. If the `$LATEST` version of this intent hasn't changed since you
  /// last updated it, Amazon Lex doesn't create a new version. It returns the
  /// last version you created.
  ///
  ///  You can update only the `$LATEST` version of the intent. You can't update
  /// the numbered versions that you create with the `CreateIntentVersion`
  /// operation.
  ///
  ///  When you create a version of an intent, Amazon Lex sets the version to 1.
  /// Subsequent versions increment by 1. For more information, see
  /// versioning-intro.
  ///
  /// This operation requires permissions to perform the
  /// `lex:CreateIntentVersion` action.
  ///
  /// [name]: The name of the intent that you want to create a new version of.
  /// The name is case sensitive.
  ///
  /// [checksum]: Checksum of the `$LATEST` version of the intent that should be
  /// used to create the new version. If you specify a checksum and the
  /// `$LATEST` version of the intent has a different checksum, Amazon Lex
  /// returns a `PreconditionFailedException` exception and doesn't publish a
  /// new version. If you don't specify a checksum, Amazon Lex publishes the
  /// `$LATEST` version.
  Future<CreateIntentVersionResponse> createIntentVersion(String name,
      {String checksum}) async {
    return CreateIntentVersionResponse.fromJson({});
  }

  /// Creates a new version of a slot type based on the `$LATEST` version of the
  /// specified slot type. If the `$LATEST` version of this resource has not
  /// changed since the last version that you created, Amazon Lex doesn't create
  /// a new version. It returns the last version that you created.
  ///
  ///  You can update only the `$LATEST` version of a slot type. You can't
  /// update the numbered versions that you create with the
  /// `CreateSlotTypeVersion` operation.
  ///
  /// When you create a version of a slot type, Amazon Lex sets the version to
  /// 1. Subsequent versions increment by 1. For more information, see
  /// versioning-intro.
  ///
  /// This operation requires permissions for the `lex:CreateSlotTypeVersion`
  /// action.
  ///
  /// [name]: The name of the slot type that you want to create a new version
  /// for. The name is case sensitive.
  ///
  /// [checksum]: Checksum for the `$LATEST` version of the slot type that you
  /// want to publish. If you specify a checksum and the `$LATEST` version of
  /// the slot type has a different checksum, Amazon Lex returns a
  /// `PreconditionFailedException` exception and doesn't publish the new
  /// version. If you don't specify a checksum, Amazon Lex publishes the
  /// `$LATEST` version.
  Future<CreateSlotTypeVersionResponse> createSlotTypeVersion(String name,
      {String checksum}) async {
    return CreateSlotTypeVersionResponse.fromJson({});
  }

  /// Deletes all versions of the bot, including the `$LATEST` version. To
  /// delete a specific version of the bot, use the DeleteBotVersion operation.
  ///
  /// If a bot has an alias, you can't delete it. Instead, the `DeleteBot`
  /// operation returns a `ResourceInUseException` exception that includes a
  /// reference to the alias that refers to the bot. To remove the reference to
  /// the bot, delete the alias. If you get the same exception again, delete the
  /// referring alias until the `DeleteBot` operation is successful.
  ///
  /// This operation requires permissions for the `lex:DeleteBot` action.
  ///
  /// [name]: The name of the bot. The name is case sensitive.
  Future<void> deleteBot(String name) async {}

  /// Deletes an alias for the specified bot.
  ///
  /// You can't delete an alias that is used in the association between a bot
  /// and a messaging channel. If an alias is used in a channel association, the
  /// `DeleteBot` operation returns a `ResourceInUseException` exception that
  /// includes a reference to the channel association that refers to the bot.
  /// You can remove the reference to the alias by deleting the channel
  /// association. If you get the same exception again, delete the referring
  /// association until the `DeleteBotAlias` operation is successful.
  ///
  /// [name]: The name of the alias to delete. The name is case sensitive.
  ///
  /// [botName]: The name of the bot that the alias points to.
  Future<void> deleteBotAlias(
      {@required String name, @required String botName}) async {}

  /// Deletes the association between an Amazon Lex bot and a messaging
  /// platform.
  ///
  /// This operation requires permission for the
  /// `lex:DeleteBotChannelAssociation` action.
  ///
  /// [name]: The name of the association. The name is case sensitive.
  ///
  /// [botName]: The name of the Amazon Lex bot.
  ///
  /// [botAlias]: An alias that points to the specific version of the Amazon Lex
  /// bot to which this association is being made.
  Future<void> deleteBotChannelAssociation(
      {@required String name,
      @required String botName,
      @required String botAlias}) async {}

  /// Deletes a specific version of a bot. To delete all versions of a bot, use
  /// the DeleteBot operation.
  ///
  /// This operation requires permissions for the `lex:DeleteBotVersion` action.
  ///
  /// [name]: The name of the bot.
  ///
  /// [version]: The version of the bot to delete. You cannot delete the
  /// `$LATEST` version of the bot. To delete the `$LATEST` version, use the
  /// DeleteBot operation.
  Future<void> deleteBotVersion(
      {@required String name, @required String version}) async {}

  /// Deletes all versions of the intent, including the `$LATEST` version. To
  /// delete a specific version of the intent, use the DeleteIntentVersion
  /// operation.
  ///
  ///  You can delete a version of an intent only if it is not referenced. To
  /// delete an intent that is referred to in one or more bots (see
  /// how-it-works), you must remove those references first.
  ///
  ///   If you get the `ResourceInUseException` exception, it provides an
  /// example reference that shows where the intent is referenced. To remove the
  /// reference to the intent, either update the bot or delete it. If you get
  /// the same exception when you attempt to delete the intent again, repeat
  /// until the intent has no references and the call to `DeleteIntent` is
  /// successful.
  ///
  ///  This operation requires permission for the `lex:DeleteIntent` action.
  ///
  /// [name]: The name of the intent. The name is case sensitive.
  Future<void> deleteIntent(String name) async {}

  /// Deletes a specific version of an intent. To delete all versions of a
  /// intent, use the DeleteIntent operation.
  ///
  /// This operation requires permissions for the `lex:DeleteIntentVersion`
  /// action.
  ///
  /// [name]: The name of the intent.
  ///
  /// [version]: The version of the intent to delete. You cannot delete the
  /// `$LATEST` version of the intent. To delete the `$LATEST` version, use the
  /// DeleteIntent operation.
  Future<void> deleteIntentVersion(
      {@required String name, @required String version}) async {}

  /// Deletes all versions of the slot type, including the `$LATEST` version. To
  /// delete a specific version of the slot type, use the DeleteSlotTypeVersion
  /// operation.
  ///
  ///  You can delete a version of a slot type only if it is not referenced. To
  /// delete a slot type that is referred to in one or more intents, you must
  /// remove those references first.
  ///
  ///   If you get the `ResourceInUseException` exception, the exception
  /// provides an example reference that shows the intent where the slot type is
  /// referenced. To remove the reference to the slot type, either update the
  /// intent or delete it. If you get the same exception when you attempt to
  /// delete the slot type again, repeat until the slot type has no references
  /// and the `DeleteSlotType` call is successful.
  ///
  /// This operation requires permission for the `lex:DeleteSlotType` action.
  ///
  /// [name]: The name of the slot type. The name is case sensitive.
  Future<void> deleteSlotType(String name) async {}

  /// Deletes a specific version of a slot type. To delete all versions of a
  /// slot type, use the DeleteSlotType operation.
  ///
  /// This operation requires permissions for the `lex:DeleteSlotTypeVersion`
  /// action.
  ///
  /// [name]: The name of the slot type.
  ///
  /// [version]: The version of the slot type to delete. You cannot delete the
  /// `$LATEST` version of the slot type. To delete the `$LATEST` version, use
  /// the DeleteSlotType operation.
  Future<void> deleteSlotTypeVersion(
      {@required String name, @required String version}) async {}

  /// Deletes stored utterances.
  ///
  /// Amazon Lex stores the utterances that users send to your bot. Utterances
  /// are stored for 15 days for use with the GetUtterancesView operation, and
  /// then stored indefinitely for use in improving the ability of your bot to
  /// respond to user input.
  ///
  /// Use the `DeleteStoredUtterances` operation to manually delete stored
  /// utterances for a specific user.
  ///
  /// This operation requires permissions for the `lex:DeleteUtterances` action.
  ///
  /// [botName]: The name of the bot that stored the utterances.
  ///
  /// [userId]:  The unique identifier for the user that made the utterances.
  /// This is the user ID that was sent in the
  /// [PostContent](http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostContent.html)
  /// or
  /// [PostText](http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html)
  /// operation request that contained the utterance.
  Future<void> deleteUtterances(
      {@required String botName, @required String userId}) async {}

  /// Returns metadata information for a specific bot. You must provide the bot
  /// name and the bot version or alias.
  ///
  ///  This operation requires permissions for the `lex:GetBot` action.
  ///
  /// [name]: The name of the bot. The name is case sensitive.
  ///
  /// [versionOrAlias]: The version or alias of the bot.
  Future<GetBotResponse> getBot(
      {@required String name, @required String versionOrAlias}) async {
    return GetBotResponse.fromJson({});
  }

  /// Returns information about an Amazon Lex bot alias. For more information
  /// about aliases, see versioning-aliases.
  ///
  /// This operation requires permissions for the `lex:GetBotAlias` action.
  ///
  /// [name]: The name of the bot alias. The name is case sensitive.
  ///
  /// [botName]: The name of the bot.
  Future<GetBotAliasResponse> getBotAlias(
      {@required String name, @required String botName}) async {
    return GetBotAliasResponse.fromJson({});
  }

  /// Returns a list of aliases for a specified Amazon Lex bot.
  ///
  /// This operation requires permissions for the `lex:GetBotAliases` action.
  ///
  /// [botName]: The name of the bot.
  ///
  /// [nextToken]: A pagination token for fetching the next page of aliases. If
  /// the response to this call is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch the next page of aliases, specify the
  /// pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of aliases to return in the response. The
  /// default is 50. .
  ///
  /// [nameContains]: Substring to match in bot alias names. An alias will be
  /// returned if any part of its name matches the substring. For example, "xyz"
  /// matches both "xyzabc" and "abcxyz."
  Future<GetBotAliasesResponse> getBotAliases(String botName,
      {String nextToken, int maxResults, String nameContains}) async {
    return GetBotAliasesResponse.fromJson({});
  }

  /// Returns information about the association between an Amazon Lex bot and a
  /// messaging platform.
  ///
  /// This operation requires permissions for the `lex:GetBotChannelAssociation`
  /// action.
  ///
  /// [name]: The name of the association between the bot and the channel. The
  /// name is case sensitive.
  ///
  /// [botName]: The name of the Amazon Lex bot.
  ///
  /// [botAlias]: An alias pointing to the specific version of the Amazon Lex
  /// bot to which this association is being made.
  Future<GetBotChannelAssociationResponse> getBotChannelAssociation(
      {@required String name,
      @required String botName,
      @required String botAlias}) async {
    return GetBotChannelAssociationResponse.fromJson({});
  }

  ///  Returns a list of all of the channels associated with the specified bot.
  ///
  /// The `GetBotChannelAssociations` operation requires permissions for the
  /// `lex:GetBotChannelAssociations` action.
  ///
  /// [botName]: The name of the Amazon Lex bot in the association.
  ///
  /// [botAlias]: An alias pointing to the specific version of the Amazon Lex
  /// bot to which this association is being made.
  ///
  /// [nextToken]: A pagination token for fetching the next page of
  /// associations. If the response to this call is truncated, Amazon Lex
  /// returns a pagination token in the response. To fetch the next page of
  /// associations, specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of associations to return in the
  /// response. The default is 50.
  ///
  /// [nameContains]: Substring to match in channel association names. An
  /// association will be returned if any part of its name matches the
  /// substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To
  /// return all bot channel associations, use a hyphen ("-") as the
  /// `nameContains` parameter.
  Future<GetBotChannelAssociationsResponse> getBotChannelAssociations(
      {@required String botName,
      @required String botAlias,
      String nextToken,
      int maxResults,
      String nameContains}) async {
    return GetBotChannelAssociationsResponse.fromJson({});
  }

  /// Gets information about all of the versions of a bot.
  ///
  /// The `GetBotVersions` operation returns a `BotMetadata` object for each
  /// version of a bot. For example, if a bot has three numbered versions, the
  /// `GetBotVersions` operation returns four `BotMetadata` objects in the
  /// response, one for each numbered version and one for the `$LATEST` version.
  ///
  /// The `GetBotVersions` operation always returns at least one version, the
  /// `$LATEST` version.
  ///
  /// This operation requires permissions for the `lex:GetBotVersions` action.
  ///
  /// [name]: The name of the bot for which versions should be returned.
  ///
  /// [nextToken]: A pagination token for fetching the next page of bot
  /// versions. If the response to this call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch the next page of versions,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of bot versions to return in the
  /// response. The default is 10.
  Future<GetBotVersionsResponse> getBotVersions(String name,
      {String nextToken, int maxResults}) async {
    return GetBotVersionsResponse.fromJson({});
  }

  /// Returns bot information as follows:
  ///
  /// *   If you provide the `nameContains` field, the response includes
  /// information for the `$LATEST` version of all bots whose name contains the
  /// specified string.
  ///
  /// *   If you don't specify the `nameContains` field, the operation returns
  /// information about the `$LATEST` version of all of your bots.
  ///
  ///
  /// This operation requires permission for the `lex:GetBots` action.
  ///
  /// [nextToken]: A pagination token that fetches the next page of bots. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of bots, specify the pagination
  /// token in the next request.
  ///
  /// [maxResults]: The maximum number of bots to return in the response that
  /// the request will return. The default is 10.
  ///
  /// [nameContains]: Substring to match in bot names. A bot will be returned if
  /// any part of its name matches the substring. For example, "xyz" matches
  /// both "xyzabc" and "abcxyz."
  Future<GetBotsResponse> getBots(
      {String nextToken, int maxResults, String nameContains}) async {
    return GetBotsResponse.fromJson({});
  }

  /// Returns information about a built-in intent.
  ///
  /// This operation requires permission for the `lex:GetBuiltinIntent` action.
  ///
  /// [signature]: The unique identifier for a built-in intent. To find the
  /// signature for an intent, see [Standard Built-in
  /// Intents](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents)
  /// in the _Alexa Skills Kit_.
  Future<GetBuiltinIntentResponse> getBuiltinIntent(String signature) async {
    return GetBuiltinIntentResponse.fromJson({});
  }

  /// Gets a list of built-in intents that meet the specified criteria.
  ///
  /// This operation requires permission for the `lex:GetBuiltinIntents` action.
  ///
  /// [locale]: A list of locales that the intent supports.
  ///
  /// [signatureContains]: Substring to match in built-in intent signatures. An
  /// intent will be returned if any part of its signature matches the
  /// substring. For example, "xyz" matches both "xyzabc" and "abcxyz." To find
  /// the signature for an intent, see [Standard Built-in
  /// Intents](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents)
  /// in the _Alexa Skills Kit_.
  ///
  /// [nextToken]: A pagination token that fetches the next page of intents. If
  /// this API call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of intents, use the pagination token in
  /// the next request.
  ///
  /// [maxResults]: The maximum number of intents to return in the response. The
  /// default is 10.
  Future<GetBuiltinIntentsResponse> getBuiltinIntents(
      {String locale,
      String signatureContains,
      String nextToken,
      int maxResults}) async {
    return GetBuiltinIntentsResponse.fromJson({});
  }

  /// Gets a list of built-in slot types that meet the specified criteria.
  ///
  /// For a list of built-in slot types, see [Slot Type
  /// Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference)
  /// in the _Alexa Skills Kit_.
  ///
  /// This operation requires permission for the `lex:GetBuiltInSlotTypes`
  /// action.
  ///
  /// [locale]: A list of locales that the slot type supports.
  ///
  /// [signatureContains]: Substring to match in built-in slot type signatures.
  /// A slot type will be returned if any part of its signature matches the
  /// substring. For example, "xyz" matches both "xyzabc" and "abcxyz."
  ///
  /// [nextToken]: A pagination token that fetches the next page of slot types.
  /// If the response to this API call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch the next page of slot types,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of slot types to return in the response.
  /// The default is 10.
  Future<GetBuiltinSlotTypesResponse> getBuiltinSlotTypes(
      {String locale,
      String signatureContains,
      String nextToken,
      int maxResults}) async {
    return GetBuiltinSlotTypesResponse.fromJson({});
  }

  /// Exports the contents of a Amazon Lex resource in a specified format.
  ///
  /// [name]: The name of the bot to export.
  ///
  /// [version]: The version of the bot to export.
  ///
  /// [resourceType]: The type of resource to export.
  ///
  /// [exportType]: The format of the exported data.
  Future<GetExportResponse> getExport(
      {@required String name,
      @required String version,
      @required String resourceType,
      @required String exportType}) async {
    return GetExportResponse.fromJson({});
  }

  /// Gets information about an import job started with the `StartImport`
  /// operation.
  ///
  /// [importId]: The identifier of the import job information to return.
  Future<GetImportResponse> getImport(String importId) async {
    return GetImportResponse.fromJson({});
  }

  ///  Returns information about an intent. In addition to the intent name, you
  /// must specify the intent version.
  ///
  ///  This operation requires permissions to perform the `lex:GetIntent`
  /// action.
  ///
  /// [name]: The name of the intent. The name is case sensitive.
  ///
  /// [version]: The version of the intent.
  Future<GetIntentResponse> getIntent(
      {@required String name, @required String version}) async {
    return GetIntentResponse.fromJson({});
  }

  /// Gets information about all of the versions of an intent.
  ///
  /// The `GetIntentVersions` operation returns an `IntentMetadata` object for
  /// each version of an intent. For example, if an intent has three numbered
  /// versions, the `GetIntentVersions` operation returns four `IntentMetadata`
  /// objects in the response, one for each numbered version and one for the
  /// `$LATEST` version.
  ///
  /// The `GetIntentVersions` operation always returns at least one version, the
  /// `$LATEST` version.
  ///
  /// This operation requires permissions for the `lex:GetIntentVersions`
  /// action.
  ///
  /// [name]: The name of the intent for which versions should be returned.
  ///
  /// [nextToken]: A pagination token for fetching the next page of intent
  /// versions. If the response to this call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch the next page of versions,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of intent versions to return in the
  /// response. The default is 10.
  Future<GetIntentVersionsResponse> getIntentVersions(String name,
      {String nextToken, int maxResults}) async {
    return GetIntentVersionsResponse.fromJson({});
  }

  /// Returns intent information as follows:
  ///
  /// *   If you specify the `nameContains` field, returns the `$LATEST` version
  /// of all intents that contain the specified string.
  ///
  /// *    If you don't specify the `nameContains` field, returns information
  /// about the `$LATEST` version of all intents.
  ///
  ///
  ///  The operation requires permission for the `lex:GetIntents` action.
  ///
  /// [nextToken]: A pagination token that fetches the next page of intents. If
  /// the response to this API call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch the next page of intents,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of intents to return in the response. The
  /// default is 10.
  ///
  /// [nameContains]: Substring to match in intent names. An intent will be
  /// returned if any part of its name matches the substring. For example, "xyz"
  /// matches both "xyzabc" and "abcxyz."
  Future<GetIntentsResponse> getIntents(
      {String nextToken, int maxResults, String nameContains}) async {
    return GetIntentsResponse.fromJson({});
  }

  /// Returns information about a specific version of a slot type. In addition
  /// to specifying the slot type name, you must specify the slot type version.
  ///
  /// This operation requires permissions for the `lex:GetSlotType` action.
  ///
  /// [name]: The name of the slot type. The name is case sensitive.
  ///
  /// [version]: The version of the slot type.
  Future<GetSlotTypeResponse> getSlotType(
      {@required String name, @required String version}) async {
    return GetSlotTypeResponse.fromJson({});
  }

  /// Gets information about all versions of a slot type.
  ///
  /// The `GetSlotTypeVersions` operation returns a `SlotTypeMetadata` object
  /// for each version of a slot type. For example, if a slot type has three
  /// numbered versions, the `GetSlotTypeVersions` operation returns four
  /// `SlotTypeMetadata` objects in the response, one for each numbered version
  /// and one for the `$LATEST` version.
  ///
  /// The `GetSlotTypeVersions` operation always returns at least one version,
  /// the `$LATEST` version.
  ///
  /// This operation requires permissions for the `lex:GetSlotTypeVersions`
  /// action.
  ///
  /// [name]: The name of the slot type for which versions should be returned.
  ///
  /// [nextToken]: A pagination token for fetching the next page of slot type
  /// versions. If the response to this call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch the next page of versions,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of slot type versions to return in the
  /// response. The default is 10.
  Future<GetSlotTypeVersionsResponse> getSlotTypeVersions(String name,
      {String nextToken, int maxResults}) async {
    return GetSlotTypeVersionsResponse.fromJson({});
  }

  /// Returns slot type information as follows:
  ///
  /// *   If you specify the `nameContains` field, returns the `$LATEST` version
  /// of all slot types that contain the specified string.
  ///
  /// *    If you don't specify the `nameContains` field, returns information
  /// about the `$LATEST` version of all slot types.
  ///
  ///
  ///  The operation requires permission for the `lex:GetSlotTypes` action.
  ///
  /// [nextToken]: A pagination token that fetches the next page of slot types.
  /// If the response to this API call is truncated, Amazon Lex returns a
  /// pagination token in the response. To fetch next page of slot types,
  /// specify the pagination token in the next request.
  ///
  /// [maxResults]: The maximum number of slot types to return in the response.
  /// The default is 10.
  ///
  /// [nameContains]: Substring to match in slot type names. A slot type will be
  /// returned if any part of its name matches the substring. For example, "xyz"
  /// matches both "xyzabc" and "abcxyz."
  Future<GetSlotTypesResponse> getSlotTypes(
      {String nextToken, int maxResults, String nameContains}) async {
    return GetSlotTypesResponse.fromJson({});
  }

  /// Use the `GetUtterancesView` operation to get information about the
  /// utterances that your users have made to your bot. You can use this list to
  /// tune the utterances that your bot responds to.
  ///
  /// For example, say that you have created a bot to order flowers. After your
  /// users have used your bot for a while, use the `GetUtterancesView`
  /// operation to see the requests that they have made and whether they have
  /// been successful. You might find that the utterance "I want flowers" is not
  /// being recognized. You could add this utterance to the `OrderFlowers`
  /// intent so that your bot recognizes that utterance.
  ///
  /// After you publish a new version of a bot, you can get information about
  /// the old version and the new so that you can compare the performance across
  /// the two versions.
  ///
  ///  Utterance statistics are generated once a day. Data is available for the
  /// last 15 days. You can request information for up to 5 versions in each
  /// request. The response contains information about a maximum of 100
  /// utterances for each version.
  ///
  /// This operation requires permissions for the `lex:GetUtterancesView`
  /// action.
  ///
  /// [botName]: The name of the bot for which utterance information should be
  /// returned.
  ///
  /// [botVersions]: An array of bot versions for which utterance information
  /// should be returned. The limit is 5 versions per request.
  ///
  /// [statusType]: To return utterances that were recognized and handled,
  /// use`Detected`. To return utterances that were not recognized, use
  /// `Missed`.
  Future<GetUtterancesViewResponse> getUtterancesView(
      {@required String botName,
      @required List<String> botVersions,
      @required String statusType}) async {
    return GetUtterancesViewResponse.fromJson({});
  }

  /// Creates an Amazon Lex conversational bot or replaces an existing bot. When
  /// you create or update a bot you are only required to specify a name, a
  /// locale, and whether the bot is directed toward children under age 13. You
  /// can use this to add intents later, or to remove intents from an existing
  /// bot. When you create a bot with the minimum information, the bot is
  /// created or updated but Amazon Lex returns the  ``response `FAILED`. You
  /// can build the bot after you add one or more intents. For more information
  /// about Amazon Lex bots, see how-it-works.``
  ///
  /// ``
  ///
  /// If you specify the name of an existing bot, the fields in the request
  /// replace the existing values in the `$LATEST` version of the bot. Amazon
  /// Lex removes any fields that you don't provide values for in the request,
  /// except for the `idleTTLInSeconds` and `privacySettings` fields, which are
  /// set to their default values. If you don't specify values for required
  /// fields, Amazon Lex throws an exception.
  ///
  /// This operation requires permissions for the `lex:PutBot` action. For more
  /// information, see auth-and-access-control.
  ///
  /// ``
  ///
  /// [name]: The name of the bot. The name is _not_ case sensitive.
  ///
  /// [description]: A description of the bot.
  ///
  /// [intents]: An array of `Intent` objects. Each intent represents a command
  /// that a user can express. For example, a pizza ordering bot might support
  /// an OrderPizza intent. For more information, see how-it-works.
  ///
  /// [clarificationPrompt]: When Amazon Lex doesn't understand the user's
  /// intent, it uses this message to get clarification. To specify how many
  /// times Amazon Lex should repeate the clarification prompt, use the
  /// `maxAttempts` field. If Amazon Lex still doesn't understand, it sends the
  /// message in the `abortStatement` field.
  ///
  /// When you create a clarification prompt, make sure that it suggests the
  /// correct response from the user. for example, for a bot that orders pizza
  /// and drinks, you might create this clarification prompt: "What would you
  /// like to do? You can say 'Order a pizza' or 'Order a drink.'"
  ///
  /// [abortStatement]: When Amazon Lex can't understand the user's input in
  /// context, it tries to elicit the information a few times. After that,
  /// Amazon Lex sends the message defined in `abortStatement` to the user, and
  /// then aborts the conversation. To set the number of retries, use the
  /// `valueElicitationPrompt` field for the slot type.
  ///
  /// For example, in a pizza ordering bot, Amazon Lex might ask a user "What
  /// type of crust would you like?" If the user's response is not one of the
  /// expected responses (for example, "thin crust, "deep dish," etc.), Amazon
  /// Lex tries to elicit a correct response a few more times.
  ///
  /// For example, in a pizza ordering application, `OrderPizza` might be one of
  /// the intents. This intent might require the `CrustType` slot. You specify
  /// the `valueElicitationPrompt` field when you create the `CrustType` slot.
  ///
  /// [idleSessionTtlInSeconds]: The maximum time in seconds that Amazon Lex
  /// retains the data gathered in a conversation.
  ///
  /// A user interaction session remains active for the amount of time
  /// specified. If no conversation occurs during this time, the session expires
  /// and Amazon Lex deletes any data provided before the timeout.
  ///
  /// For example, suppose that a user chooses the OrderPizza intent, but gets
  /// sidetracked halfway through placing an order. If the user doesn't complete
  /// the order within the specified time, Amazon Lex discards the slot
  /// information that it gathered, and the user must start over.
  ///
  /// If you don't include the `idleSessionTTLInSeconds` element in a `PutBot`
  /// operation request, Amazon Lex uses the default value. This is also true if
  /// the request replaces an existing bot.
  ///
  /// The default is 300 seconds (5 minutes).
  ///
  /// [voiceId]: The Amazon Polly voice ID that you want Amazon Lex to use for
  /// voice interactions with the user. The locale configured for the voice must
  /// match the locale of the bot. For more information, see [Available
  /// Voices](http://docs.aws.amazon.com/polly/latest/dg/voicelist.html) in the
  /// _Amazon Polly Developer Guide_.
  ///
  /// [checksum]: Identifies a specific revision of the `$LATEST` version.
  ///
  /// When you create a new bot, leave the `checksum` field blank. If you
  /// specify a checksum you get a `BadRequestException` exception.
  ///
  /// When you want to update a bot, set the `checksum` field to the checksum of
  /// the most recent revision of the `$LATEST` version. If you don't specify
  /// the  `checksum` field, or if the checksum does not match the `$LATEST`
  /// version, you get a `PreconditionFailedException` exception.
  ///
  /// [processBehavior]: If you set the `processBehavior` element to `BUILD`,
  /// Amazon Lex builds the bot so that it can be run. If you set the element to
  /// `SAVE` Amazon Lex saves the bot, but doesn't build it.
  ///
  /// If you don't specify this value, the default value is `BUILD`.
  ///
  /// [locale]:  Specifies the target locale for the bot. Any intent used in the
  /// bot must be compatible with the locale of the bot.
  ///
  /// The default is `en-US`.
  ///
  /// [childDirected]: For each Amazon Lex bot created with the Amazon Lex Model
  /// Building Service, you must specify whether your use of Amazon Lex is
  /// related to a website, program, or other application that is directed or
  /// targeted, in whole or in part, to children under age 13 and subject to the
  /// Children's Online Privacy Protection Act (COPPA) by specifying `true` or
  /// `false` in the `childDirected` field. By specifying `true` in the
  /// `childDirected` field, you confirm that your use of Amazon Lex **is**
  /// related to a website, program, or other application that is directed or
  /// targeted, in whole or in part, to children under age 13 and subject to
  /// COPPA. By specifying `false` in the `childDirected` field, you confirm
  /// that your use of Amazon Lex **is not** related to a website, program, or
  /// other application that is directed or targeted, in whole or in part, to
  /// children under age 13 and subject to COPPA. You may not specify a default
  /// value for the `childDirected` field that does not accurately reflect
  /// whether your use of Amazon Lex is related to a website, program, or other
  /// application that is directed or targeted, in whole or in part, to children
  /// under age 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age
  /// 13, you must obtain any required verifiable parental consent under COPPA.
  /// For information regarding the use of Amazon Lex in connection with
  /// websites, programs, or other applications that are directed or targeted,
  /// in whole or in part, to children under age 13, see the [Amazon Lex
  /// FAQ.](https://aws.amazon.com/lex/faqs#data-security)
  Future<PutBotResponse> putBot(
      {@required String name,
      String description,
      List<Intent> intents,
      Prompt clarificationPrompt,
      Statement abortStatement,
      int idleSessionTtlInSeconds,
      String voiceId,
      String checksum,
      String processBehavior,
      @required String locale,
      @required bool childDirected,
      bool createVersion}) async {
    return PutBotResponse.fromJson({});
  }

  /// Creates an alias for the specified version of the bot or replaces an alias
  /// for the specified bot. To change the version of the bot that the alias
  /// points to, replace the alias. For more information about aliases, see
  /// versioning-aliases.
  ///
  /// This operation requires permissions for the `lex:PutBotAlias` action.
  ///
  /// [name]: The name of the alias. The name is _not_ case sensitive.
  ///
  /// [description]: A description of the alias.
  ///
  /// [botVersion]: The version of the bot.
  ///
  /// [botName]: The name of the bot.
  ///
  /// [checksum]: Identifies a specific revision of the `$LATEST` version.
  ///
  /// When you create a new bot alias, leave the `checksum` field blank. If you
  /// specify a checksum you get a `BadRequestException` exception.
  ///
  /// When you want to update a bot alias, set the `checksum` field to the
  /// checksum of the most recent revision of the `$LATEST` version. If you
  /// don't specify the  `checksum` field, or if the checksum does not match the
  /// `$LATEST` version, you get a `PreconditionFailedException` exception.
  Future<PutBotAliasResponse> putBotAlias(
      {@required String name,
      String description,
      @required String botVersion,
      @required String botName,
      String checksum}) async {
    return PutBotAliasResponse.fromJson({});
  }

  /// Creates an intent or replaces an existing intent.
  ///
  /// To define the interaction between the user and your bot, you use one or
  /// more intents. For a pizza ordering bot, for example, you would create an
  /// `OrderPizza` intent.
  ///
  /// To create an intent or replace an existing intent, you must provide the
  /// following:
  ///
  /// *   Intent name. For example, `OrderPizza`.
  ///
  /// *   Sample utterances. For example, "Can I order a pizza, please." and "I
  /// want to order a pizza."
  ///
  /// *   Information to be gathered. You specify slot types for the information
  /// that your bot will request from the user. You can specify standard slot
  /// types, such as a date or a time, or custom slot types such as the size and
  /// crust of a pizza.
  ///
  /// *   How the intent will be fulfilled. You can provide a Lambda function or
  /// configure the intent to return the intent information to the client
  /// application. If you use a Lambda function, when all of the intent
  /// information is available, Amazon Lex invokes your Lambda function. If you
  /// configure your intent to return the intent information to the client
  /// application.
  ///
  ///
  /// You can specify other optional information in the request, such as:
  ///
  /// *   A confirmation prompt to ask the user to confirm an intent. For
  /// example, "Shall I order your pizza?"
  ///
  /// *   A conclusion statement to send to the user after the intent has been
  /// fulfilled. For example, "I placed your pizza order."
  ///
  /// *   A follow-up prompt that asks the user for additional activity. For
  /// example, asking "Do you want to order a drink with your pizza?"
  ///
  ///
  /// If you specify an existing intent name to update the intent, Amazon Lex
  /// replaces the values in the `$LATEST` version of the intent with the values
  /// in the request. Amazon Lex removes fields that you don't provide in the
  /// request. If you don't specify the required fields, Amazon Lex throws an
  /// exception. When you update the `$LATEST` version of an intent, the
  /// `status` field of any bot that uses the `$LATEST` version of the intent is
  /// set to `NOT_BUILT`.
  ///
  /// For more information, see how-it-works.
  ///
  /// This operation requires permissions for the `lex:PutIntent` action.
  ///
  /// [name]: The name of the intent. The name is _not_ case sensitive.
  ///
  /// The name can't match a built-in intent name, or a built-in intent name
  /// with "AMAZON." removed. For example, because there is a built-in intent
  /// called `AMAZON.HelpIntent`, you can't create a custom intent called
  /// `HelpIntent`.
  ///
  /// For a list of built-in intents, see [Standard Built-in
  /// Intents](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents)
  /// in the _Alexa Skills Kit_.
  ///
  /// [description]: A description of the intent.
  ///
  /// [slots]: An array of intent slots. At runtime, Amazon Lex elicits required
  /// slot values from the user using prompts defined in the slots. For more
  /// information, see how-it-works.
  ///
  /// [sampleUtterances]: An array of utterances (strings) that a user might say
  /// to signal the intent. For example, "I want {PizzaSize} pizza", "Order
  /// {Quantity} {PizzaSize} pizzas".
  ///
  /// In each utterance, a slot name is enclosed in curly braces.
  ///
  /// [confirmationPrompt]: Prompts the user to confirm the intent. This
  /// question should have a yes or no answer.
  ///
  /// Amazon Lex uses this prompt to ensure that the user acknowledges that the
  /// intent is ready for fulfillment. For example, with the `OrderPizza`
  /// intent, you might want to confirm that the order is correct before placing
  /// it. For other intents, such as intents that simply respond to user
  /// questions, you might not need to ask the user for confirmation before
  /// providing the information.
  ///
  ///
  ///
  /// You you must provide both the `rejectionStatement` and the
  /// `confirmationPrompt`, or neither.
  ///
  /// [rejectionStatement]: When the user answers "no" to the question defined
  /// in `confirmationPrompt`, Amazon Lex responds with this statement to
  /// acknowledge that the intent was canceled.
  ///
  ///
  ///
  /// You must provide both the `rejectionStatement` and the
  /// `confirmationPrompt`, or neither.
  ///
  /// [followUpPrompt]: Amazon Lex uses this prompt to solicit additional
  /// activity after fulfilling an intent. For example, after the `OrderPizza`
  /// intent is fulfilled, you might prompt the user to order a drink.
  ///
  /// The action that Amazon Lex takes depends on the user's response, as
  /// follows:
  ///
  /// *   If the user says "Yes" it responds with the clarification prompt that
  /// is configured for the bot.
  ///
  /// *   if the user says "Yes" and continues with an utterance that triggers
  /// an intent it starts a conversation for the intent.
  ///
  /// *   If the user says "No" it responds with the rejection statement
  /// configured for the the follow-up prompt.
  ///
  /// *   If it doesn't recognize the utterance it repeats the follow-up prompt
  /// again.
  ///
  ///
  /// The `followUpPrompt` field and the `conclusionStatement` field are
  /// mutually exclusive. You can specify only one.
  ///
  /// [conclusionStatement]:  The statement that you want Amazon Lex to convey
  /// to the user after the intent is successfully fulfilled by the Lambda
  /// function.
  ///
  /// This element is relevant only if you provide a Lambda function in the
  /// `fulfillmentActivity`. If you return the intent to the client application,
  /// you can't specify this element.
  ///
  ///
  ///
  /// The `followUpPrompt` and `conclusionStatement` are mutually exclusive. You
  /// can specify only one.
  ///
  /// [dialogCodeHook]:  Specifies a Lambda function to invoke for each user
  /// input. You can invoke this Lambda function to personalize user
  /// interaction.
  ///
  /// For example, suppose your bot determines that the user is John. Your
  /// Lambda function might retrieve John's information from a backend database
  /// and prepopulate some of the values. For example, if you find that John is
  /// gluten intolerant, you might set the corresponding intent slot,
  /// `GlutenIntolerant`, to true. You might find John's phone number and set
  /// the corresponding session attribute.
  ///
  /// [fulfillmentActivity]: Required. Describes how the intent is fulfilled.
  /// For example, after a user provides all of the information for a pizza
  /// order, `fulfillmentActivity` defines how the bot places an order with a
  /// local pizza store.
  ///
  ///  You might configure Amazon Lex to return all of the intent information to
  /// the client application, or direct it to invoke a Lambda function that can
  /// process the intent (for example, place an order with a pizzeria).
  ///
  /// [parentIntentSignature]: A unique identifier for the built-in intent to
  /// base this intent on. To find the signature for an intent, see [Standard
  /// Built-in
  /// Intents](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents)
  /// in the _Alexa Skills Kit_.
  ///
  /// [checksum]: Identifies a specific revision of the `$LATEST` version.
  ///
  /// When you create a new intent, leave the `checksum` field blank. If you
  /// specify a checksum you get a `BadRequestException` exception.
  ///
  /// When you want to update a intent, set the `checksum` field to the checksum
  /// of the most recent revision of the `$LATEST` version. If you don't specify
  /// the  `checksum` field, or if the checksum does not match the `$LATEST`
  /// version, you get a `PreconditionFailedException` exception.
  Future<PutIntentResponse> putIntent(String name,
      {String description,
      List<Slot> slots,
      List<String> sampleUtterances,
      Prompt confirmationPrompt,
      Statement rejectionStatement,
      FollowUpPrompt followUpPrompt,
      Statement conclusionStatement,
      CodeHook dialogCodeHook,
      FulfillmentActivity fulfillmentActivity,
      String parentIntentSignature,
      String checksum,
      bool createVersion}) async {
    return PutIntentResponse.fromJson({});
  }

  /// Creates a custom slot type or replaces an existing custom slot type.
  ///
  /// To create a custom slot type, specify a name for the slot type and a set
  /// of enumeration values, which are the values that a slot of this type can
  /// assume. For more information, see how-it-works.
  ///
  /// If you specify the name of an existing slot type, the fields in the
  /// request replace the existing values in the `$LATEST` version of the slot
  /// type. Amazon Lex removes the fields that you don't provide in the request.
  /// If you don't specify required fields, Amazon Lex throws an exception. When
  /// you update the `$LATEST` version of a slot type, if a bot uses the
  /// `$LATEST` version of an intent that contains the slot type, the bot's
  /// `status` field is set to `NOT_BUILT`.
  ///
  /// This operation requires permissions for the `lex:PutSlotType` action.
  ///
  /// [name]: The name of the slot type. The name is _not_ case sensitive.
  ///
  /// The name can't match a built-in slot type name, or a built-in slot type
  /// name with "AMAZON." removed. For example, because there is a built-in slot
  /// type called `AMAZON.DATE`, you can't create a custom slot type called
  /// `DATE`.
  ///
  /// For a list of built-in slot types, see [Slot Type
  /// Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference)
  /// in the _Alexa Skills Kit_.
  ///
  /// [description]: A description of the slot type.
  ///
  /// [enumerationValues]: A list of `EnumerationValue` objects that defines the
  /// values that the slot type can take. Each value can have a list of
  /// `synonyms`, which are additional values that help train the machine
  /// learning model about the values that it resolves for a slot.
  ///
  /// When Amazon Lex resolves a slot value, it generates a resolution list that
  /// contains up to five possible values for the slot. If you are using a
  /// Lambda function, this resolution list is passed to the function. If you
  /// are not using a Lambda function you can choose to return the value that
  /// the user entered or the first value in the resolution list as the slot
  /// value. The `valueSelectionStrategy` field indicates the option to use.
  ///
  /// [checksum]: Identifies a specific revision of the `$LATEST` version.
  ///
  /// When you create a new slot type, leave the `checksum` field blank. If you
  /// specify a checksum you get a `BadRequestException` exception.
  ///
  /// When you want to update a slot type, set the `checksum` field to the
  /// checksum of the most recent revision of the `$LATEST` version. If you
  /// don't specify the  `checksum` field, or if the checksum does not match the
  /// `$LATEST` version, you get a `PreconditionFailedException` exception.
  ///
  /// [valueSelectionStrategy]: Determines the slot resolution strategy that
  /// Amazon Lex uses to return slot type values. The field can be set to one of
  /// the following values:
  ///
  /// *    `ORIGINAL_VALUE` \- Returns the value entered by the user, if the
  /// user value is similar to the slot value.
  ///
  /// *    `TOP_RESOLUTION` \- If there is a resolution list for the slot,
  /// return the first value in the resolution list as the slot type value. If
  /// there is no resolution list, null is returned.
  ///
  ///
  /// If you don't specify the `valueSelectionStrategy`, the default is
  /// `ORIGINAL_VALUE`.
  Future<PutSlotTypeResponse> putSlotType(String name,
      {String description,
      List<EnumerationValue> enumerationValues,
      String checksum,
      String valueSelectionStrategy,
      bool createVersion}) async {
    return PutSlotTypeResponse.fromJson({});
  }

  /// Starts a job to import a resource to Amazon Lex.
  ///
  /// [payload]: A zip archive in binary format. The archive should contain one
  /// file, a JSON file containing the resource to import. The resource should
  /// match the type specified in the `resourceType` field.
  ///
  /// [resourceType]: Specifies the type of resource to export. Each resource
  /// also exports any resources that it depends on.
  ///
  /// *   A bot exports dependent intents.
  ///
  /// *   An intent exports dependent slot types.
  ///
  /// [mergeStrategy]: Specifies the action that the `StartImport` operation
  /// should take when there is an existing resource with the same name.
  ///
  /// *   FAIL\_ON\_CONFLICT - The import operation is stopped on the first
  /// conflict between a resource in the import file and an existing resource.
  /// The name of the resource causing the conflict is in the `failureReason`
  /// field of the response to the `GetImport` operation.
  ///
  ///     OVERWRITE_LATEST - The import operation proceeds even if there is a
  /// conflict with an existing resource. The $LASTEST version of the existing
  /// resource is overwritten with the data from the import file.
  Future<StartImportResponse> startImport(
      {@required Uint8List payload,
      @required String resourceType,
      @required String mergeStrategy}) async {
    return StartImportResponse.fromJson({});
  }
}

class BotAliasMetadata {
  /// The name of the bot alias.
  final String name;

  /// A description of the bot alias.
  final String description;

  /// The version of the Amazon Lex bot to which the alias points.
  final String botVersion;

  /// The name of the bot to which the alias points.
  final String botName;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot alias was created.
  final DateTime createdDate;

  /// Checksum of the bot alias.
  final String checksum;

  BotAliasMetadata({
    this.name,
    this.description,
    this.botVersion,
    this.botName,
    this.lastUpdatedDate,
    this.createdDate,
    this.checksum,
  });
  static BotAliasMetadata fromJson(Map<String, dynamic> json) =>
      BotAliasMetadata();
}

class BotChannelAssociation {
  /// The name of the association between the bot and the channel.
  final String name;

  /// A text description of the association you are creating.
  final String description;

  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  final String botAlias;

  /// The name of the Amazon Lex bot to which this association is being made.
  ///
  ///
  ///
  /// Currently, Amazon Lex supports associations with Facebook and Slack, and
  /// Twilio.
  final String botName;

  /// The date that the association between the Amazon Lex bot and the channel
  /// was created.
  final DateTime createdDate;

  /// Specifies the type of association by indicating the type of channel being
  /// established between the Amazon Lex bot and the external messaging
  /// platform.
  final String type;

  /// Provides information necessary to communicate with the messaging platform.
  final Map<String, String> botConfiguration;

  /// The status of the bot channel.
  ///
  /// *    `CREATED` \- The channel has been created and is ready for use.
  ///
  /// *    `IN_PROGRESS` \- Channel creation is in progress.
  ///
  /// *    `FAILED` \- There was an error creating the channel. For information
  /// about the reason for the failure, see the `failureReason` field.
  final String status;

  /// If `status` is `FAILED`, Amazon Lex provides the reason that it failed to
  /// create the association.
  final String failureReason;

  BotChannelAssociation({
    this.name,
    this.description,
    this.botAlias,
    this.botName,
    this.createdDate,
    this.type,
    this.botConfiguration,
    this.status,
    this.failureReason,
  });
  static BotChannelAssociation fromJson(Map<String, dynamic> json) =>
      BotChannelAssociation();
}

class BotMetadata {
  /// The name of the bot.
  final String name;

  /// A description of the bot.
  final String description;

  /// The status of the bot.
  final String status;

  /// The date that the bot was updated. When you create a bot, the creation
  /// date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot was created.
  final DateTime createdDate;

  /// The version of the bot. For a new bot, the version is always `$LATEST`.
  final String version;

  BotMetadata({
    this.name,
    this.description,
    this.status,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
  });
  static BotMetadata fromJson(Map<String, dynamic> json) => BotMetadata();
}

class BuiltinIntentMetadata {
  /// A unique identifier for the built-in intent. To find the signature for an
  /// intent, see [Standard Built-in
  /// Intents](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/standard-intents)
  /// in the _Alexa Skills Kit_.
  final String signature;

  /// A list of identifiers for the locales that the intent supports.
  final List<String> supportedLocales;

  BuiltinIntentMetadata({
    this.signature,
    this.supportedLocales,
  });
  static BuiltinIntentMetadata fromJson(Map<String, dynamic> json) =>
      BuiltinIntentMetadata();
}

class BuiltinIntentSlot {
  /// A list of the slots defined for the intent.
  final String name;

  BuiltinIntentSlot({
    this.name,
  });
  static BuiltinIntentSlot fromJson(Map<String, dynamic> json) =>
      BuiltinIntentSlot();
}

class BuiltinSlotTypeMetadata {
  /// A unique identifier for the built-in slot type. To find the signature for
  /// a slot type, see [Slot Type
  /// Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference)
  /// in the _Alexa Skills Kit_.
  final String signature;

  /// A list of target locales for the slot.
  final List<String> supportedLocales;

  BuiltinSlotTypeMetadata({
    this.signature,
    this.supportedLocales,
  });
  static BuiltinSlotTypeMetadata fromJson(Map<String, dynamic> json) =>
      BuiltinSlotTypeMetadata();
}

class CodeHook {
  /// The Amazon Resource Name (ARN) of the Lambda function.
  final String uri;

  /// The version of the request-response that you want Amazon Lex to use to
  /// invoke your Lambda function. For more information, see using-lambda.
  final String messageVersion;

  CodeHook({
    @required this.uri,
    @required this.messageVersion,
  });
  static CodeHook fromJson(Map<String, dynamic> json) => CodeHook();
}

class CreateBotVersionResponse {
  /// The name of the bot.
  final String name;

  /// A description of the bot.
  final String description;

  /// An array of `Intent` objects. For more information, see PutBot.
  final List<Intent> intents;

  /// The message that Amazon Lex uses when it doesn't understand the user's
  /// request. For more information, see PutBot.
  final Prompt clarificationPrompt;

  /// The message that Amazon Lex uses to abort a conversation. For more
  /// information, see PutBot.
  final Statement abortStatement;

  ///  When you send a request to create or update a bot, Amazon Lex sets the
  /// `status` response element to `BUILDING`. After Amazon Lex builds the bot,
  /// it sets `status` to `READY`. If Amazon Lex can't build the bot, it sets
  /// `status` to `FAILED`. Amazon Lex returns the reason for the failure in the
  /// `failureReason` response element.
  final String status;

  /// If `status` is `FAILED`, Amazon Lex provides the reason that it failed to
  /// build the bot.
  final String failureReason;

  /// The date when the `$LATEST` version of this bot was updated.
  final DateTime lastUpdatedDate;

  /// The date when the bot version was created.
  final DateTime createdDate;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see PutBot.
  final int idleSessionTtlInSeconds;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interactions with
  /// the user.
  final String voiceId;

  /// Checksum identifying the version of the bot that was created.
  final String checksum;

  /// The version of the bot.
  final String version;

  ///  Specifies the target locale for the bot.
  final String locale;

  /// For each Amazon Lex bot created with the Amazon Lex Model Building
  /// Service, you must specify whether your use of Amazon Lex is related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to the Children's
  /// Online Privacy Protection Act (COPPA) by specifying `true` or `false` in
  /// the `childDirected` field. By specifying `true` in the `childDirected`
  /// field, you confirm that your use of Amazon Lex **is** related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to COPPA. By
  /// specifying `false` in the `childDirected` field, you confirm that your use
  /// of Amazon Lex **is not** related to a website, program, or other
  /// application that is directed or targeted, in whole or in part, to children
  /// under age 13 and subject to COPPA. You may not specify a default value for
  /// the `childDirected` field that does not accurately reflect whether your
  /// use of Amazon Lex is related to a website, program, or other application
  /// that is directed or targeted, in whole or in part, to children under age
  /// 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age
  /// 13, you must obtain any required verifiable parental consent under COPPA.
  /// For information regarding the use of Amazon Lex in connection with
  /// websites, programs, or other applications that are directed or targeted,
  /// in whole or in part, to children under age 13, see the [Amazon Lex
  /// FAQ.](https://aws.amazon.com/lex/faqs#data-security)
  final bool childDirected;

  CreateBotVersionResponse({
    this.name,
    this.description,
    this.intents,
    this.clarificationPrompt,
    this.abortStatement,
    this.status,
    this.failureReason,
    this.lastUpdatedDate,
    this.createdDate,
    this.idleSessionTtlInSeconds,
    this.voiceId,
    this.checksum,
    this.version,
    this.locale,
    this.childDirected,
  });
  static CreateBotVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateBotVersionResponse();
}

class CreateIntentVersionResponse {
  /// The name of the intent.
  final String name;

  /// A description of the intent.
  final String description;

  /// An array of slot types that defines the information required to fulfill
  /// the intent.
  final List<Slot> slots;

  /// An array of sample utterances configured for the intent.
  final List<String> sampleUtterances;

  /// If defined, the prompt that Amazon Lex uses to confirm the user's intent
  /// before fulfilling it.
  final Prompt confirmationPrompt;

  /// If the user answers "no" to the question defined in `confirmationPrompt`,
  /// Amazon Lex responds with this statement to acknowledge that the intent was
  /// canceled.
  final Statement rejectionStatement;

  /// If defined, Amazon Lex uses this prompt to solicit additional user
  /// activity after the intent is fulfilled.
  final FollowUpPrompt followUpPrompt;

  /// After the Lambda function specified in the `fulfillmentActivity` field
  /// fulfills the intent, Amazon Lex conveys this statement to the user.
  final Statement conclusionStatement;

  /// If defined, Amazon Lex invokes this Lambda function for each user input.
  final CodeHook dialogCodeHook;

  ///  Describes how the intent is fulfilled.
  final FulfillmentActivity fulfillmentActivity;

  /// A unique identifier for a built-in intent.
  final String parentIntentSignature;

  /// The date that the intent was updated.
  final DateTime lastUpdatedDate;

  /// The date that the intent was created.
  final DateTime createdDate;

  /// The version number assigned to the new version of the intent.
  final String version;

  /// Checksum of the intent version created.
  final String checksum;

  CreateIntentVersionResponse({
    this.name,
    this.description,
    this.slots,
    this.sampleUtterances,
    this.confirmationPrompt,
    this.rejectionStatement,
    this.followUpPrompt,
    this.conclusionStatement,
    this.dialogCodeHook,
    this.fulfillmentActivity,
    this.parentIntentSignature,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
  });
  static CreateIntentVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateIntentVersionResponse();
}

class CreateSlotTypeVersionResponse {
  /// The name of the slot type.
  final String name;

  /// A description of the slot type.
  final String description;

  /// A list of `EnumerationValue` objects that defines the values that the slot
  /// type can take.
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the slot type was created.
  final DateTime createdDate;

  /// The version assigned to the new slot type version.
  final String version;

  /// Checksum of the `$LATEST` version of the slot type.
  final String checksum;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see PutSlotType.
  final String valueSelectionStrategy;

  CreateSlotTypeVersionResponse({
    this.name,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
    this.valueSelectionStrategy,
  });
  static CreateSlotTypeVersionResponse fromJson(Map<String, dynamic> json) =>
      CreateSlotTypeVersionResponse();
}

class EnumerationValue {
  /// The value of the slot type.
  final String value;

  /// Additional values related to the slot type value.
  final List<String> synonyms;

  EnumerationValue({
    @required this.value,
    this.synonyms,
  });
  static EnumerationValue fromJson(Map<String, dynamic> json) =>
      EnumerationValue();
}

class FollowUpPrompt {
  /// Prompts for information from the user.
  final Prompt prompt;

  /// If the user answers "no" to the question defined in the `prompt` field,
  /// Amazon Lex responds with this statement to acknowledge that the intent was
  /// canceled.
  final Statement rejectionStatement;

  FollowUpPrompt({
    @required this.prompt,
    @required this.rejectionStatement,
  });
  static FollowUpPrompt fromJson(Map<String, dynamic> json) => FollowUpPrompt();
}

class FulfillmentActivity {
  ///  How the intent should be fulfilled, either by running a Lambda function
  /// or by returning the slot data to the client application.
  final String type;

  ///  A description of the Lambda function that is run to fulfill the intent.
  final CodeHook codeHook;

  FulfillmentActivity({
    @required this.type,
    this.codeHook,
  });
  static FulfillmentActivity fromJson(Map<String, dynamic> json) =>
      FulfillmentActivity();
}

class GetBotAliasResponse {
  /// The name of the bot alias.
  final String name;

  /// A description of the bot alias.
  final String description;

  /// The version of the bot that the alias points to.
  final String botVersion;

  /// The name of the bot that the alias points to.
  final String botName;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot alias was created.
  final DateTime createdDate;

  /// Checksum of the bot alias.
  final String checksum;

  GetBotAliasResponse({
    this.name,
    this.description,
    this.botVersion,
    this.botName,
    this.lastUpdatedDate,
    this.createdDate,
    this.checksum,
  });
  static GetBotAliasResponse fromJson(Map<String, dynamic> json) =>
      GetBotAliasResponse();
}

class GetBotAliasesResponse {
  /// An array of `BotAliasMetadata` objects, each describing a bot alias.
  final List<BotAliasMetadata> botAliases;

  /// A pagination token for fetching next page of aliases. If the response to
  /// this call is truncated, Amazon Lex returns a pagination token in the
  /// response. To fetch the next page of aliases, specify the pagination token
  /// in the next request.
  final String nextToken;

  GetBotAliasesResponse({
    this.botAliases,
    this.nextToken,
  });
  static GetBotAliasesResponse fromJson(Map<String, dynamic> json) =>
      GetBotAliasesResponse();
}

class GetBotChannelAssociationResponse {
  /// The name of the association between the bot and the channel.
  final String name;

  /// A description of the association between the bot and the channel.
  final String description;

  /// An alias pointing to the specific version of the Amazon Lex bot to which
  /// this association is being made.
  final String botAlias;

  /// The name of the Amazon Lex bot.
  final String botName;

  /// The date that the association between the bot and the channel was created.
  final DateTime createdDate;

  /// The type of the messaging platform.
  final String type;

  /// Provides information that the messaging platform needs to communicate with
  /// the Amazon Lex bot.
  final Map<String, String> botConfiguration;

  /// The status of the bot channel.
  ///
  /// *    `CREATED` \- The channel has been created and is ready for use.
  ///
  /// *    `IN_PROGRESS` \- Channel creation is in progress.
  ///
  /// *    `FAILED` \- There was an error creating the channel. For information
  /// about the reason for the failure, see the `failureReason` field.
  final String status;

  /// If `status` is `FAILED`, Amazon Lex provides the reason that it failed to
  /// create the association.
  final String failureReason;

  GetBotChannelAssociationResponse({
    this.name,
    this.description,
    this.botAlias,
    this.botName,
    this.createdDate,
    this.type,
    this.botConfiguration,
    this.status,
    this.failureReason,
  });
  static GetBotChannelAssociationResponse fromJson(Map<String, dynamic> json) =>
      GetBotChannelAssociationResponse();
}

class GetBotChannelAssociationsResponse {
  /// An array of objects, one for each association, that provides information
  /// about the Amazon Lex bot and its association with the channel.
  final List<BotChannelAssociation> botChannelAssociations;

  /// A pagination token that fetches the next page of associations. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of associations, specify the
  /// pagination token in the next request.
  final String nextToken;

  GetBotChannelAssociationsResponse({
    this.botChannelAssociations,
    this.nextToken,
  });
  static GetBotChannelAssociationsResponse fromJson(
          Map<String, dynamic> json) =>
      GetBotChannelAssociationsResponse();
}

class GetBotResponse {
  /// The name of the bot.
  final String name;

  /// A description of the bot.
  final String description;

  /// An array of `intent` objects. For more information, see PutBot.
  final List<Intent> intents;

  /// The message Amazon Lex uses when it doesn't understand the user's request.
  /// For more information, see PutBot.
  final Prompt clarificationPrompt;

  /// The message that Amazon Lex returns when the user elects to end the
  /// conversation without completing it. For more information, see PutBot.
  final Statement abortStatement;

  /// The status of the bot. If the bot is ready to run, the status is `READY`.
  /// If there was a problem with building the bot, the status is `FAILED` and
  /// the `failureReason` explains why the bot did not build. If the bot was
  /// saved but not built, the status is `NOT BUILT`.
  final String status;

  /// If `status` is `FAILED`, Amazon Lex explains why it failed to build the
  /// bot.
  final String failureReason;

  /// The date that the bot was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot was created.
  final DateTime createdDate;

  /// The maximum time in seconds that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see PutBot.
  final int idleSessionTtlInSeconds;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see PutBot.
  final String voiceId;

  /// Checksum of the bot used to identify a specific revision of the bot's
  /// `$LATEST` version.
  final String checksum;

  /// The version of the bot. For a new bot, the version is always `$LATEST`.
  final String version;

  ///  The target locale for the bot.
  final String locale;

  /// For each Amazon Lex bot created with the Amazon Lex Model Building
  /// Service, you must specify whether your use of Amazon Lex is related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to the Children's
  /// Online Privacy Protection Act (COPPA) by specifying `true` or `false` in
  /// the `childDirected` field. By specifying `true` in the `childDirected`
  /// field, you confirm that your use of Amazon Lex **is** related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to COPPA. By
  /// specifying `false` in the `childDirected` field, you confirm that your use
  /// of Amazon Lex **is not** related to a website, program, or other
  /// application that is directed or targeted, in whole or in part, to children
  /// under age 13 and subject to COPPA. You may not specify a default value for
  /// the `childDirected` field that does not accurately reflect whether your
  /// use of Amazon Lex is related to a website, program, or other application
  /// that is directed or targeted, in whole or in part, to children under age
  /// 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age
  /// 13, you must obtain any required verifiable parental consent under COPPA.
  /// For information regarding the use of Amazon Lex in connection with
  /// websites, programs, or other applications that are directed or targeted,
  /// in whole or in part, to children under age 13, see the [Amazon Lex
  /// FAQ.](https://aws.amazon.com/lex/faqs#data-security)
  final bool childDirected;

  GetBotResponse({
    this.name,
    this.description,
    this.intents,
    this.clarificationPrompt,
    this.abortStatement,
    this.status,
    this.failureReason,
    this.lastUpdatedDate,
    this.createdDate,
    this.idleSessionTtlInSeconds,
    this.voiceId,
    this.checksum,
    this.version,
    this.locale,
    this.childDirected,
  });
  static GetBotResponse fromJson(Map<String, dynamic> json) => GetBotResponse();
}

class GetBotVersionsResponse {
  /// An array of `BotMetadata` objects, one for each numbered version of the
  /// bot plus one for the `$LATEST` version.
  final List<BotMetadata> bots;

  /// A pagination token for fetching the next page of bot versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  final String nextToken;

  GetBotVersionsResponse({
    this.bots,
    this.nextToken,
  });
  static GetBotVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetBotVersionsResponse();
}

class GetBotsResponse {
  /// An array of `botMetadata` objects, with one entry for each bot.
  final List<BotMetadata> bots;

  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of bots.
  final String nextToken;

  GetBotsResponse({
    this.bots,
    this.nextToken,
  });
  static GetBotsResponse fromJson(Map<String, dynamic> json) =>
      GetBotsResponse();
}

class GetBuiltinIntentResponse {
  /// The unique identifier for a built-in intent.
  final String signature;

  /// A list of locales that the intent supports.
  final List<String> supportedLocales;

  /// An array of `BuiltinIntentSlot` objects, one entry for each slot type in
  /// the intent.
  final List<BuiltinIntentSlot> slots;

  GetBuiltinIntentResponse({
    this.signature,
    this.supportedLocales,
    this.slots,
  });
  static GetBuiltinIntentResponse fromJson(Map<String, dynamic> json) =>
      GetBuiltinIntentResponse();
}

class GetBuiltinIntentsResponse {
  /// An array of `builtinIntentMetadata` objects, one for each intent in the
  /// response.
  final List<BuiltinIntentMetadata> intents;

  /// A pagination token that fetches the next page of intents. If the response
  /// to this API call is truncated, Amazon Lex returns a pagination token in
  /// the response. To fetch the next page of intents, specify the pagination
  /// token in the next request.
  final String nextToken;

  GetBuiltinIntentsResponse({
    this.intents,
    this.nextToken,
  });
  static GetBuiltinIntentsResponse fromJson(Map<String, dynamic> json) =>
      GetBuiltinIntentsResponse();
}

class GetBuiltinSlotTypesResponse {
  /// An array of `BuiltInSlotTypeMetadata` objects, one entry for each slot
  /// type returned.
  final List<BuiltinSlotTypeMetadata> slotTypes;

  /// If the response is truncated, the response includes a pagination token
  /// that you can use in your next request to fetch the next page of slot
  /// types.
  final String nextToken;

  GetBuiltinSlotTypesResponse({
    this.slotTypes,
    this.nextToken,
  });
  static GetBuiltinSlotTypesResponse fromJson(Map<String, dynamic> json) =>
      GetBuiltinSlotTypesResponse();
}

class GetExportResponse {
  /// The name of the bot being exported.
  final String name;

  /// The version of the bot being exported.
  final String version;

  /// The type of the exported resource.
  final String resourceType;

  /// The format of the exported data.
  final String exportType;

  /// The status of the export.
  ///
  /// *    `IN_PROGRESS` \- The export is in progress.
  ///
  /// *    `READY` \- The export is complete.
  ///
  /// *    `FAILED` \- The export could not be completed.
  final String exportStatus;

  /// If `status` is `FAILED`, Amazon Lex provides the reason that it failed to
  /// export the resource.
  final String failureReason;

  /// An S3 pre-signed URL that provides the location of the exported resource.
  /// The exported resource is a ZIP archive that contains the exported resource
  /// in JSON format. The structure of the archive may change. Your code should
  /// not rely on the archive structure.
  final String url;

  GetExportResponse({
    this.name,
    this.version,
    this.resourceType,
    this.exportType,
    this.exportStatus,
    this.failureReason,
    this.url,
  });
  static GetExportResponse fromJson(Map<String, dynamic> json) =>
      GetExportResponse();
}

class GetImportResponse {
  /// The name given to the import job.
  final String name;

  /// The type of resource imported.
  final String resourceType;

  /// The action taken when there was a conflict between an existing resource
  /// and a resource in the import file.
  final String mergeStrategy;

  /// The identifier for the specific import job.
  final String importId;

  /// The status of the import job. If the status is `FAILED`, you can get the
  /// reason for the failure from the `failureReason` field.
  final String importStatus;

  /// A string that describes why an import job failed to complete.
  final List<String> failureReason;

  /// A timestamp for the date and time that the import job was created.
  final DateTime createdDate;

  GetImportResponse({
    this.name,
    this.resourceType,
    this.mergeStrategy,
    this.importId,
    this.importStatus,
    this.failureReason,
    this.createdDate,
  });
  static GetImportResponse fromJson(Map<String, dynamic> json) =>
      GetImportResponse();
}

class GetIntentResponse {
  /// The name of the intent.
  final String name;

  /// A description of the intent.
  final String description;

  /// An array of intent slots configured for the intent.
  final List<Slot> slots;

  /// An array of sample utterances configured for the intent.
  final List<String> sampleUtterances;

  /// If defined in the bot, Amazon Lex uses prompt to confirm the intent before
  /// fulfilling the user's request. For more information, see PutIntent.
  final Prompt confirmationPrompt;

  /// If the user answers "no" to the question defined in `confirmationPrompt`,
  /// Amazon Lex responds with this statement to acknowledge that the intent was
  /// canceled.
  final Statement rejectionStatement;

  /// If defined in the bot, Amazon Lex uses this prompt to solicit additional
  /// user activity after the intent is fulfilled. For more information, see
  /// PutIntent.
  final FollowUpPrompt followUpPrompt;

  /// After the Lambda function specified in the `fulfillmentActivity` element
  /// fulfills the intent, Amazon Lex conveys this statement to the user.
  final Statement conclusionStatement;

  /// If defined in the bot, Amazon Amazon Lex invokes this Lambda function for
  /// each user input. For more information, see PutIntent.
  final CodeHook dialogCodeHook;

  /// Describes how the intent is fulfilled. For more information, see
  /// PutIntent.
  final FulfillmentActivity fulfillmentActivity;

  /// A unique identifier for a built-in intent.
  final String parentIntentSignature;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the intent was created.
  final DateTime createdDate;

  /// The version of the intent.
  final String version;

  /// Checksum of the intent.
  final String checksum;

  GetIntentResponse({
    this.name,
    this.description,
    this.slots,
    this.sampleUtterances,
    this.confirmationPrompt,
    this.rejectionStatement,
    this.followUpPrompt,
    this.conclusionStatement,
    this.dialogCodeHook,
    this.fulfillmentActivity,
    this.parentIntentSignature,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
  });
  static GetIntentResponse fromJson(Map<String, dynamic> json) =>
      GetIntentResponse();
}

class GetIntentVersionsResponse {
  /// An array of `IntentMetadata` objects, one for each numbered version of the
  /// intent plus one for the `$LATEST` version.
  final List<IntentMetadata> intents;

  /// A pagination token for fetching the next page of intent versions. If the
  /// response to this call is truncated, Amazon Lex returns a pagination token
  /// in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  final String nextToken;

  GetIntentVersionsResponse({
    this.intents,
    this.nextToken,
  });
  static GetIntentVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetIntentVersionsResponse();
}

class GetIntentsResponse {
  /// An array of `Intent` objects. For more information, see PutBot.
  final List<IntentMetadata> intents;

  /// If the response is truncated, the response includes a pagination token
  /// that you can specify in your next request to fetch the next page of
  /// intents.
  final String nextToken;

  GetIntentsResponse({
    this.intents,
    this.nextToken,
  });
  static GetIntentsResponse fromJson(Map<String, dynamic> json) =>
      GetIntentsResponse();
}

class GetSlotTypeResponse {
  /// The name of the slot type.
  final String name;

  /// A description of the slot type.
  final String description;

  /// A list of `EnumerationValue` objects that defines the values that the slot
  /// type can take.
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last update date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the slot type was created.
  final DateTime createdDate;

  /// The version of the slot type.
  final String version;

  /// Checksum of the `$LATEST` version of the slot type.
  final String checksum;

  /// The strategy that Amazon Lex uses to determine the value of the slot. For
  /// more information, see PutSlotType.
  final String valueSelectionStrategy;

  GetSlotTypeResponse({
    this.name,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
    this.valueSelectionStrategy,
  });
  static GetSlotTypeResponse fromJson(Map<String, dynamic> json) =>
      GetSlotTypeResponse();
}

class GetSlotTypeVersionsResponse {
  /// An array of `SlotTypeMetadata` objects, one for each numbered version of
  /// the slot type plus one for the `$LATEST` version.
  final List<SlotTypeMetadata> slotTypes;

  /// A pagination token for fetching the next page of slot type versions. If
  /// the response to this call is truncated, Amazon Lex returns a pagination
  /// token in the response. To fetch the next page of versions, specify the
  /// pagination token in the next request.
  final String nextToken;

  GetSlotTypeVersionsResponse({
    this.slotTypes,
    this.nextToken,
  });
  static GetSlotTypeVersionsResponse fromJson(Map<String, dynamic> json) =>
      GetSlotTypeVersionsResponse();
}

class GetSlotTypesResponse {
  /// An array of objects, one for each slot type, that provides information
  /// such as the name of the slot type, the version, and a description.
  final List<SlotTypeMetadata> slotTypes;

  /// If the response is truncated, it includes a pagination token that you can
  /// specify in your next request to fetch the next page of slot types.
  final String nextToken;

  GetSlotTypesResponse({
    this.slotTypes,
    this.nextToken,
  });
  static GetSlotTypesResponse fromJson(Map<String, dynamic> json) =>
      GetSlotTypesResponse();
}

class GetUtterancesViewResponse {
  /// The name of the bot for which utterance information was returned.
  final String botName;

  /// An array of UtteranceList objects, each containing a list of UtteranceData
  /// objects describing the utterances that were processed by your bot. The
  /// response contains a maximum of 100 `UtteranceData` objects for each
  /// version.
  final List<UtteranceList> utterances;

  GetUtterancesViewResponse({
    this.botName,
    this.utterances,
  });
  static GetUtterancesViewResponse fromJson(Map<String, dynamic> json) =>
      GetUtterancesViewResponse();
}

class Intent {
  /// The name of the intent.
  final String intentName;

  /// The version of the intent.
  final String intentVersion;

  Intent({
    @required this.intentName,
    @required this.intentVersion,
  });
  static Intent fromJson(Map<String, dynamic> json) => Intent();
}

class IntentMetadata {
  /// The name of the intent.
  final String name;

  /// A description of the intent.
  final String description;

  /// The date that the intent was updated. When you create an intent, the
  /// creation date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the intent was created.
  final DateTime createdDate;

  /// The version of the intent.
  final String version;

  IntentMetadata({
    this.name,
    this.description,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
  });
  static IntentMetadata fromJson(Map<String, dynamic> json) => IntentMetadata();
}

class Message {
  /// The content type of the message string.
  final String contentType;

  /// The text of the message.
  final String content;

  /// Identifies the message group that the message belongs to. When a group is
  /// assigned to a message, Amazon Lex returns one message from each group in
  /// the response.
  final int groupNumber;

  Message({
    @required this.contentType,
    @required this.content,
    this.groupNumber,
  });
  static Message fromJson(Map<String, dynamic> json) => Message();
}

class Prompt {
  /// An array of objects, each of which provides a message string and its type.
  /// You can specify the message string in plain text or in Speech Synthesis
  /// Markup Language (SSML).
  final List<Message> messages;

  /// The number of times to prompt the user for information.
  final int maxAttempts;

  /// A response card. Amazon Lex uses this prompt at runtime, in the `PostText`
  /// API response. It substitutes session attributes and slot values for
  /// placeholders in the response card. For more information, see ex-resp-card.
  final String responseCard;

  Prompt({
    @required this.messages,
    @required this.maxAttempts,
    this.responseCard,
  });
  static Prompt fromJson(Map<String, dynamic> json) => Prompt();
}

class PutBotAliasResponse {
  /// The name of the alias.
  final String name;

  /// A description of the alias.
  final String description;

  /// The version of the bot that the alias points to.
  final String botVersion;

  /// The name of the bot that the alias points to.
  final String botName;

  /// The date that the bot alias was updated. When you create a resource, the
  /// creation date and the last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot alias was created.
  final DateTime createdDate;

  /// The checksum for the current version of the alias.
  final String checksum;

  PutBotAliasResponse({
    this.name,
    this.description,
    this.botVersion,
    this.botName,
    this.lastUpdatedDate,
    this.createdDate,
    this.checksum,
  });
  static PutBotAliasResponse fromJson(Map<String, dynamic> json) =>
      PutBotAliasResponse();
}

class PutBotResponse {
  /// The name of the bot.
  final String name;

  /// A description of the bot.
  final String description;

  /// An array of `Intent` objects. For more information, see PutBot.
  final List<Intent> intents;

  ///  The prompts that Amazon Lex uses when it doesn't understand the user's
  /// intent. For more information, see PutBot.
  final Prompt clarificationPrompt;

  /// The message that Amazon Lex uses to abort a conversation. For more
  /// information, see PutBot.
  final Statement abortStatement;

  ///  When you send a request to create a bot with `processBehavior` set to
  /// `BUILD`, Amazon Lex sets the `status` response element to `BUILDING`.
  /// After Amazon Lex builds the bot, it sets `status` to `READY`. If Amazon
  /// Lex can't build the bot, Amazon Lex sets `status` to `FAILED`. Amazon Lex
  /// returns the reason for the failure in the `failureReason` response
  /// element.
  ///
  /// When you set `processBehavior`to `SAVE`, Amazon Lex sets the status code
  /// to `NOT BUILT`.
  final String status;

  /// If `status` is `FAILED`, Amazon Lex provides the reason that it failed to
  /// build the bot.
  final String failureReason;

  /// The date that the bot was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the bot was created.
  final DateTime createdDate;

  /// The maximum length of time that Amazon Lex retains the data gathered in a
  /// conversation. For more information, see PutBot.
  final int idleSessionTtlInSeconds;

  /// The Amazon Polly voice ID that Amazon Lex uses for voice interaction with
  /// the user. For more information, see PutBot.
  final String voiceId;

  /// Checksum of the bot that you created.
  final String checksum;

  /// The version of the bot. For a new bot, the version is always `$LATEST`.
  final String version;

  ///  The target locale for the bot.
  final String locale;

  /// For each Amazon Lex bot created with the Amazon Lex Model Building
  /// Service, you must specify whether your use of Amazon Lex is related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to the Children's
  /// Online Privacy Protection Act (COPPA) by specifying `true` or `false` in
  /// the `childDirected` field. By specifying `true` in the `childDirected`
  /// field, you confirm that your use of Amazon Lex **is** related to a
  /// website, program, or other application that is directed or targeted, in
  /// whole or in part, to children under age 13 and subject to COPPA. By
  /// specifying `false` in the `childDirected` field, you confirm that your use
  /// of Amazon Lex **is not** related to a website, program, or other
  /// application that is directed or targeted, in whole or in part, to children
  /// under age 13 and subject to COPPA. You may not specify a default value for
  /// the `childDirected` field that does not accurately reflect whether your
  /// use of Amazon Lex is related to a website, program, or other application
  /// that is directed or targeted, in whole or in part, to children under age
  /// 13 and subject to COPPA.
  ///
  /// If your use of Amazon Lex relates to a website, program, or other
  /// application that is directed in whole or in part, to children under age
  /// 13, you must obtain any required verifiable parental consent under COPPA.
  /// For information regarding the use of Amazon Lex in connection with
  /// websites, programs, or other applications that are directed or targeted,
  /// in whole or in part, to children under age 13, see the [Amazon Lex
  /// FAQ.](https://aws.amazon.com/lex/faqs#data-security)
  final bool childDirected;

  final bool createVersion;

  PutBotResponse({
    this.name,
    this.description,
    this.intents,
    this.clarificationPrompt,
    this.abortStatement,
    this.status,
    this.failureReason,
    this.lastUpdatedDate,
    this.createdDate,
    this.idleSessionTtlInSeconds,
    this.voiceId,
    this.checksum,
    this.version,
    this.locale,
    this.childDirected,
    this.createVersion,
  });
  static PutBotResponse fromJson(Map<String, dynamic> json) => PutBotResponse();
}

class PutIntentResponse {
  /// The name of the intent.
  final String name;

  /// A description of the intent.
  final String description;

  /// An array of intent slots that are configured for the intent.
  final List<Slot> slots;

  ///  An array of sample utterances that are configured for the intent.
  final List<String> sampleUtterances;

  /// If defined in the intent, Amazon Lex prompts the user to confirm the
  /// intent before fulfilling it.
  final Prompt confirmationPrompt;

  /// If the user answers "no" to the question defined in `confirmationPrompt`
  /// Amazon Lex responds with this statement to acknowledge that the intent was
  /// canceled.
  final Statement rejectionStatement;

  /// If defined in the intent, Amazon Lex uses this prompt to solicit
  /// additional user activity after the intent is fulfilled.
  final FollowUpPrompt followUpPrompt;

  /// After the Lambda function specified in the`fulfillmentActivity`intent
  /// fulfills the intent, Amazon Lex conveys this statement to the user.
  final Statement conclusionStatement;

  /// If defined in the intent, Amazon Lex invokes this Lambda function for each
  /// user input.
  final CodeHook dialogCodeHook;

  /// If defined in the intent, Amazon Lex invokes this Lambda function to
  /// fulfill the intent after the user provides all of the information required
  /// by the intent.
  final FulfillmentActivity fulfillmentActivity;

  /// A unique identifier for the built-in intent that this intent is based on.
  final String parentIntentSignature;

  /// The date that the intent was updated. When you create a resource, the
  /// creation date and last update dates are the same.
  final DateTime lastUpdatedDate;

  /// The date that the intent was created.
  final DateTime createdDate;

  /// The version of the intent. For a new intent, the version is always
  /// `$LATEST`.
  final String version;

  /// Checksum of the `$LATEST`version of the intent created or updated.
  final String checksum;

  final bool createVersion;

  PutIntentResponse({
    this.name,
    this.description,
    this.slots,
    this.sampleUtterances,
    this.confirmationPrompt,
    this.rejectionStatement,
    this.followUpPrompt,
    this.conclusionStatement,
    this.dialogCodeHook,
    this.fulfillmentActivity,
    this.parentIntentSignature,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
    this.createVersion,
  });
  static PutIntentResponse fromJson(Map<String, dynamic> json) =>
      PutIntentResponse();
}

class PutSlotTypeResponse {
  /// The name of the slot type.
  final String name;

  /// A description of the slot type.
  final String description;

  /// A list of `EnumerationValue` objects that defines the values that the slot
  /// type can take.
  final List<EnumerationValue> enumerationValues;

  /// The date that the slot type was updated. When you create a slot type, the
  /// creation date and last update date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the slot type was created.
  final DateTime createdDate;

  /// The version of the slot type. For a new slot type, the version is always
  /// `$LATEST`.
  final String version;

  /// Checksum of the `$LATEST` version of the slot type.
  final String checksum;

  /// The slot resolution strategy that Amazon Lex uses to determine the value
  /// of the slot. For more information, see PutSlotType.
  final String valueSelectionStrategy;

  final bool createVersion;

  PutSlotTypeResponse({
    this.name,
    this.description,
    this.enumerationValues,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
    this.checksum,
    this.valueSelectionStrategy,
    this.createVersion,
  });
  static PutSlotTypeResponse fromJson(Map<String, dynamic> json) =>
      PutSlotTypeResponse();
}

class Slot {
  /// The name of the slot.
  final String name;

  /// A description of the slot.
  final String description;

  /// Specifies whether the slot is required or optional.
  final String slotConstraint;

  /// The type of the slot, either a custom slot type that you defined or one of
  /// the built-in slot types.
  final String slotType;

  /// The version of the slot type.
  final String slotTypeVersion;

  /// The prompt that Amazon Lex uses to elicit the slot value from the user.
  final Prompt valueElicitationPrompt;

  ///  Directs Lex the order in which to elicit this slot value from the user.
  /// For example, if the intent has two slots with priorities 1 and 2, AWS Lex
  /// first elicits a value for the slot with priority 1.
  ///
  /// If multiple slots share the same priority, the order in which Lex elicits
  /// values is arbitrary.
  final int priority;

  ///  If you know a specific pattern with which users might respond to an
  /// Amazon Lex request for a slot value, you can provide those utterances to
  /// improve accuracy. This is optional. In most cases, Amazon Lex is capable
  /// of understanding user utterances.
  final List<String> sampleUtterances;

  ///  A set of possible responses for the slot type used by text-based clients.
  /// A user chooses an option from the response card, instead of using text to
  /// reply.
  final String responseCard;

  Slot({
    @required this.name,
    this.description,
    @required this.slotConstraint,
    this.slotType,
    this.slotTypeVersion,
    this.valueElicitationPrompt,
    this.priority,
    this.sampleUtterances,
    this.responseCard,
  });
  static Slot fromJson(Map<String, dynamic> json) => Slot();
}

class SlotTypeMetadata {
  /// The name of the slot type.
  final String name;

  /// A description of the slot type.
  final String description;

  /// The date that the slot type was updated. When you create a resource, the
  /// creation date and last updated date are the same.
  final DateTime lastUpdatedDate;

  /// The date that the slot type was created.
  final DateTime createdDate;

  /// The version of the slot type.
  final String version;

  SlotTypeMetadata({
    this.name,
    this.description,
    this.lastUpdatedDate,
    this.createdDate,
    this.version,
  });
  static SlotTypeMetadata fromJson(Map<String, dynamic> json) =>
      SlotTypeMetadata();
}

class StartImportResponse {
  /// The name given to the import job.
  final String name;

  /// The type of resource to import.
  final String resourceType;

  /// The action to take when there is a merge conflict.
  final String mergeStrategy;

  /// The identifier for the specific import job.
  final String importId;

  /// The status of the import job. If the status is `FAILED`, you can get the
  /// reason for the failure using the `GetImport` operation.
  final String importStatus;

  /// A timestamp for the date and time that the import job was requested.
  final DateTime createdDate;

  StartImportResponse({
    this.name,
    this.resourceType,
    this.mergeStrategy,
    this.importId,
    this.importStatus,
    this.createdDate,
  });
  static StartImportResponse fromJson(Map<String, dynamic> json) =>
      StartImportResponse();
}

class Statement {
  /// A collection of message objects.
  final List<Message> messages;

  ///  At runtime, if the client is using the
  /// [PostText](http://docs.aws.amazon.com/lex/latest/dg/API_runtime_PostText.html)
  /// API, Amazon Lex includes the response card in the response. It substitutes
  /// all of the session attributes and slot values for placeholders in the
  /// response card.
  final String responseCard;

  Statement({
    @required this.messages,
    this.responseCard,
  });
  static Statement fromJson(Map<String, dynamic> json) => Statement();
}

class UtteranceData {
  /// The text that was entered by the user or the text representation of an
  /// audio clip.
  final String utteranceString;

  /// The number of times that the utterance was processed.
  final int count;

  /// The total number of individuals that used the utterance.
  final int distinctUsers;

  /// The date that the utterance was first recorded.
  final DateTime firstUtteredDate;

  /// The date that the utterance was last recorded.
  final DateTime lastUtteredDate;

  UtteranceData({
    this.utteranceString,
    this.count,
    this.distinctUsers,
    this.firstUtteredDate,
    this.lastUtteredDate,
  });
  static UtteranceData fromJson(Map<String, dynamic> json) => UtteranceData();
}

class UtteranceList {
  /// The version of the bot that processed the list.
  final String botVersion;

  /// One or more UtteranceData objects that contain information about the
  /// utterances that have been made to a bot. The maximum number of object is
  /// 100.
  final List<UtteranceData> utterances;

  UtteranceList({
    this.botVersion,
    this.utterances,
  });
  static UtteranceList fromJson(Map<String, dynamic> json) => UtteranceList();
}
