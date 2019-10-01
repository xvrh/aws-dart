import 'package:meta/meta.dart';

class PersonalizeRuntimeApi {
  /// Re-ranks a list of recommended items for the given user. The first item in
  /// the list is deemed the most likely item to be of interest to the user.
  ///
  ///
  ///
  /// The solution backing the campaign must have been created using a recipe of
  /// type PERSONALIZED_RANKING.
  Future<void> getPersonalizedRanking(
      {@required String campaignArn,
      @required List<String> inputList,
      @required String userId}) async {}

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
  Future<void> getRecommendations(String campaignArn,
      {String itemId, String userId, int numResults}) async {}
}

class GetPersonalizedRankingResponse {}

class GetRecommendationsResponse {}

class PredictedItem {}
