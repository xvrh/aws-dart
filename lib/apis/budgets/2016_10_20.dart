import 'package:meta/meta.dart';

/// The AWS Budgets API enables you to use AWS Budgets to plan your service
/// usage, service costs, and instance reservations. The API reference provides
/// descriptions, syntax, and usage examples for each of the actions and data
/// types for AWS Budgets.
///
/// Budgets provide you with a way to see the following information:
///
/// *   How close your plan is to your budgeted amount or to the free tier
/// limits
///
/// *   Your usage-to-date, including how much you've used of your Reserved
/// Instances (RIs)
///
/// *   Your current estimated charges from AWS, and how much your predicted
/// usage will accrue in charges by the end of the month
///
/// *   How much of your budget has been used
///
///
/// AWS updates your budget status several times a day. Budgets track your
/// unblended costs, subscriptions, refunds, and RIs. You can create the
/// following types of budgets:
///
/// *    **Cost budgets** \- Plan how much you want to spend on a service.
///
/// *    **Usage budgets** \- Plan how much you want to use one or more
/// services.
///
/// *    **RI utilization budgets** \- Define a utilization threshold, and
/// receive alerts when your RI usage falls below that threshold. This lets you
/// see if your RIs are unused or under-utilized.
///
/// *    **RI coverage budgets** \- Define a coverage threshold, and receive
/// alerts when the number of your instance hours that are covered by RIs fall
/// below that threshold. This lets you see how much of your instance usage is
/// covered by a reservation.
///
///
/// Service Endpoint
///
/// The AWS Budgets API provides the following endpoint:
///
/// *   https://budgets.amazonaws.com
///
///
/// For information about costs that are associated with the AWS Budgets API,
/// see [AWS Cost Management
/// Pricing](https://aws.amazon.com/aws-cost-management/pricing/).
class BudgetsApi {
  /// Creates a budget and, if included, notifications and subscribers.
  ///
  ///
  ///
  /// Only one of `BudgetLimit` or `PlannedBudgetLimits` can be present in the
  /// syntax at one time. Use the syntax that matches your case. The Request
  /// Syntax section shows the `BudgetLimit` syntax. For `PlannedBudgetLimits`,
  /// see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_CreateBudget.html#API_CreateBudget_Examples)
  /// section.
  Future<void> createBudget(
      {@required String accountId,
      @required Budget budget,
      List<NotificationWithSubscribers> notificationsWithSubscribers}) async {}

  /// Creates a notification. You must create the budget before you create the
  /// associated notification.
  Future<void> createNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required List<Subscriber> subscribers}) async {}

  /// Creates a subscriber. You must create the associated budget and
  /// notification before you create the subscriber.
  Future<void> createSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber subscriber}) async {}

  /// Deletes a budget. You can delete your budget at any time.
  ///
  ///
  ///
  /// Deleting a budget also deletes the notifications and subscribers that are
  /// associated with that budget.
  Future<void> deleteBudget(
      {@required String accountId, @required String budgetName}) async {}

  /// Deletes a notification.
  ///
  ///
  ///
  /// Deleting a notification also deletes the subscribers that are associated
  /// with the notification.
  Future<void> deleteNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification}) async {}

  /// Deletes a subscriber.
  ///
  ///
  ///
  /// Deleting the last subscriber to a notification also deletes the
  /// notification.
  Future<void> deleteSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber subscriber}) async {}

  /// Describes a budget.
  ///
  ///
  ///
  /// The Request Syntax section shows the `BudgetLimit` syntax. For
  /// `PlannedBudgetLimits`, see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples)
  /// section.
  Future<void> describeBudget(
      {@required String accountId, @required String budgetName}) async {}

  /// Describes the history for `DAILY`, `MONTHLY`, and `QUARTERLY` budgets.
  /// Budget history isn't available for `ANNUAL` budgets.
  Future<void> describeBudgetPerformanceHistory(
      {@required String accountId,
      @required String budgetName,
      TimePeriod timePeriod,
      int maxResults,
      String nextToken}) async {}

  /// Lists the budgets that are associated with an account.
  ///
  ///
  ///
  /// The Request Syntax section shows the `BudgetLimit` syntax. For
  /// `PlannedBudgetLimits`, see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples)
  /// section.
  Future<void> describeBudgets(String accountId,
      {int maxResults, String nextToken}) async {}

  /// Lists the notifications that are associated with a budget.
  Future<void> describeNotificationsForBudget(
      {@required String accountId,
      @required String budgetName,
      int maxResults,
      String nextToken}) async {}

  /// Lists the subscribers that are associated with a notification.
  Future<void> describeSubscribersForNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      int maxResults,
      String nextToken}) async {}

  /// Updates a budget. You can change every part of a budget except for the
  /// `budgetName` and the `calculatedSpend`. When you modify a budget, the
  /// `calculatedSpend` drops to zero until AWS has new usage data to use for
  /// forecasting.
  ///
  ///
  ///
  /// Only one of `BudgetLimit` or `PlannedBudgetLimits` can be present in the
  /// syntax at one time. Use the syntax that matches your case. The Request
  /// Syntax section shows the `BudgetLimit` syntax. For `PlannedBudgetLimits`,
  /// see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_UpdateBudget.html#API_UpdateBudget_Examples)
  /// section.
  Future<void> updateBudget(
      {@required String accountId, @required Budget newBudget}) async {}

  /// Updates a notification.
  Future<void> updateNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification oldNotification,
      @required Notification newNotification}) async {}

  /// Updates a subscriber.
  Future<void> updateSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber oldSubscriber,
      @required Subscriber newSubscriber}) async {}
}

class Budget {}

class BudgetPerformanceHistory {}

class BudgetedAndActualAmounts {}

class CalculatedSpend {}

class CostTypes {}

class CreateBudgetResponse {}

class CreateNotificationResponse {}

class CreateSubscriberResponse {}

class DeleteBudgetResponse {}

class DeleteNotificationResponse {}

class DeleteSubscriberResponse {}

class DescribeBudgetPerformanceHistoryResponse {}

class DescribeBudgetResponse {}

class DescribeBudgetsResponse {}

class DescribeNotificationsForBudgetResponse {}

class DescribeSubscribersForNotificationResponse {}

class Notification {}

class NotificationWithSubscribers {}

class Spend {}

class Subscriber {}

class TimePeriod {}

class UpdateBudgetResponse {}

class UpdateNotificationResponse {}

class UpdateSubscriberResponse {}
