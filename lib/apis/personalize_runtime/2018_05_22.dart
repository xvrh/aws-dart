import 'package:meta/meta.dart';

class PersonalizeRuntimeApi {
  /// Re-ranks a list of recommended items for the given user. The first item in
  /// the list is deemed the most likely item to be of interest to the user.
  ///
  ///
  ///
  /// The solution backing the campaign must have been created using a recipe of
  /// type PERSONALIZED_RANKING.
  ///
  /// [campaignArn]: The Amazon Resource Name (ARN) of the campaign to use for
  /// generating the personalized ranking.
  ///
  /// [inputList]: A list of items (itemId's) to rank. If an item was not
  /// included in the training dataset, the item is appended to the end of the
  /// reranked list.
  ///
  /// [userId]: The user for which you want the campaign to provide a
  /// personalized ranking.
  Future<GetPersonalizedRankingResponse> getPersonalizedRanking(
      {@required String campaignArn,
      @required List<String> inputList,
      @required String userId}) async {
    return GetPersonalizedRankingResponse.fromJson({});
  }

  /// Returns a list of recommended items. The required input depends on the
  /// recipe type used to create the solution backing the campaign, as follows:
  ///
  /// *   RELATED_ITEMS - `itemId` required, `userId` not used
  ///
  /// *   USER_PERSONALIZATION - `itemId` optional, `userId` required
  ///
  ///
  ///
  ///
  /// Campaigns that are backed by a solution created using a recipe of type
  /// PERSONALIZED_RANKING use the API.
  ///
  /// [campaignArn]: The Amazon Resource Name (ARN) of the campaign to use for
  /// getting recommendations.
  ///
  /// [itemId]: The item ID to provide recommendations for.
  ///
  /// Required for `RELATED_ITEMS` recipe type.
  ///
  /// [userId]: The user ID to provide recommendations for.
  ///
  /// Required for `USER_PERSONALIZATION` recipe type.
  ///
  /// [numResults]: The number of results to return. The default is 25. The
  /// maximum is 100.
  Future<GetRecommendationsResponse> getRecommendations(String campaignArn,
      {String itemId, String userId, int numResults}) async {
    return GetRecommendationsResponse.fromJson({});
  }
}

class GetPersonalizedRankingResponse {
  /// A list of items in order of most likely interest to the user.
  final List<PredictedItem> personalizedRanking;

  GetPersonalizedRankingResponse({
    this.personalizedRanking,
  });
  static GetPersonalizedRankingResponse fromJson(Map<String, dynamic> json) =>
      GetPersonalizedRankingResponse();
}

class GetRecommendationsResponse {
  /// A list of recommendations.
  final List<PredictedItem> itemList;

  GetRecommendationsResponse({
    this.itemList,
  });
  static GetRecommendationsResponse fromJson(Map<String, dynamic> json) =>
      GetRecommendationsResponse();
}

class PredictedItem {
  /// The recommended item ID.
  final String itemId;

  PredictedItem({
    this.itemId,
  });
  static PredictedItem fromJson(Map<String, dynamic> json) => PredictedItem();
}
