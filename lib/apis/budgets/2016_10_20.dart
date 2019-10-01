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
/// *    **Cost budgets** - Plan how much you want to spend on a service.
///
/// *    **Usage budgets** - Plan how much you want to use one or more services.
///
/// *    **RI utilization budgets** - Define a utilization threshold, and
/// receive alerts when your RI usage falls below that threshold. This lets you
/// see if your RIs are unused or under-utilized.
///
/// *    **RI coverage budgets** - Define a coverage threshold, and receive
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
/// see
/// [AWS Cost Management Pricing](https://aws.amazon.com/aws-cost-management/pricing/).
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
  ///
  /// [accountId]: The `accountId` that is associated with the budget.
  ///
  /// [budget]: The budget object that you want to create.
  ///
  /// [notificationsWithSubscribers]: A notification that you want to associate
  /// with a budget. A budget can have up to five notifications, and each
  /// notification can have one SNS subscriber and up to 10 email subscribers.
  /// If you include notifications and subscribers in your `CreateBudget` call,
  /// AWS creates the notifications and subscribers for you.
  Future<CreateBudgetResponse> createBudget(
      {@required String accountId,
      @required Budget budget,
      List<NotificationWithSubscribers> notificationsWithSubscribers}) async {
    return CreateBudgetResponse.fromJson({});
  }

  /// Creates a notification. You must create the budget before you create the
  /// associated notification.
  ///
  /// [accountId]: The `accountId` that is associated with the budget that you
  /// want to create a notification for.
  ///
  /// [budgetName]: The name of the budget that you want AWS to notify you
  /// about. Budget names must be unique within an account.
  ///
  /// [notification]: The notification that you want to create.
  ///
  /// [subscribers]: A list of subscribers that you want to associate with the
  /// notification. Each notification can have one SNS subscriber and up to 10
  /// email subscribers.
  Future<CreateNotificationResponse> createNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required List<Subscriber> subscribers}) async {
    return CreateNotificationResponse.fromJson({});
  }

  /// Creates a subscriber. You must create the associated budget and
  /// notification before you create the subscriber.
  ///
  /// [accountId]: The `accountId` that is associated with the budget that you
  /// want to create a subscriber for.
  ///
  /// [budgetName]: The name of the budget that you want to subscribe to. Budget
  /// names must be unique within an account.
  ///
  /// [notification]: The notification that you want to create a subscriber for.
  ///
  /// [subscriber]: The subscriber that you want to associate with a budget
  /// notification.
  Future<CreateSubscriberResponse> createSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber subscriber}) async {
    return CreateSubscriberResponse.fromJson({});
  }

  /// Deletes a budget. You can delete your budget at any time.
  ///
  ///
  ///
  /// Deleting a budget also deletes the notifications and subscribers that are
  /// associated with that budget.
  ///
  /// [accountId]: The `accountId` that is associated with the budget that you
  /// want to delete.
  ///
  /// [budgetName]: The name of the budget that you want to delete.
  Future<DeleteBudgetResponse> deleteBudget(
      {@required String accountId, @required String budgetName}) async {
    return DeleteBudgetResponse.fromJson({});
  }

  /// Deletes a notification.
  ///
  ///
  ///
  /// Deleting a notification also deletes the subscribers that are associated
  /// with the notification.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// notification you want to delete.
  ///
  /// [budgetName]: The name of the budget whose notification you want to
  /// delete.
  ///
  /// [notification]: The notification that you want to delete.
  Future<DeleteNotificationResponse> deleteNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification}) async {
    return DeleteNotificationResponse.fromJson({});
  }

  /// Deletes a subscriber.
  ///
  ///
  ///
  /// Deleting the last subscriber to a notification also deletes the
  /// notification.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// subscriber you want to delete.
  ///
  /// [budgetName]: The name of the budget whose subscriber you want to delete.
  ///
  /// [notification]: The notification whose subscriber you want to delete.
  ///
  /// [subscriber]: The subscriber that you want to delete.
  Future<DeleteSubscriberResponse> deleteSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber subscriber}) async {
    return DeleteSubscriberResponse.fromJson({});
  }

  /// Describes a budget.
  ///
  ///
  ///
  /// The Request Syntax section shows the `BudgetLimit` syntax. For
  /// `PlannedBudgetLimits`, see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudget.html#API_DescribeBudget_Examples)
  /// section.
  ///
  /// [accountId]: The `accountId` that is associated with the budget that you
  /// want a description of.
  ///
  /// [budgetName]: The name of the budget that you want a description of.
  Future<DescribeBudgetResponse> describeBudget(
      {@required String accountId, @required String budgetName}) async {
    return DescribeBudgetResponse.fromJson({});
  }

  /// Describes the history for `DAILY`, `MONTHLY`, and `QUARTERLY` budgets.
  /// Budget history isn't available for `ANNUAL` budgets.
  ///
  /// [timePeriod]: Retrieves how often the budget went into an `ALARM` state
  /// for the specified time period.
  Future<DescribeBudgetPerformanceHistoryResponse>
      describeBudgetPerformanceHistory(
          {@required String accountId,
          @required String budgetName,
          TimePeriod timePeriod,
          int maxResults,
          String nextToken}) async {
    return DescribeBudgetPerformanceHistoryResponse.fromJson({});
  }

  /// Lists the budgets that are associated with an account.
  ///
  ///
  ///
  /// The Request Syntax section shows the `BudgetLimit` syntax. For
  /// `PlannedBudgetLimits`, see the
  /// [Examples](https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_budgets_DescribeBudgets.html#API_DescribeBudgets_Examples)
  /// section.
  ///
  /// [accountId]: The `accountId` that is associated with the budgets that you
  /// want descriptions of.
  ///
  /// [maxResults]: An optional integer that represents how many entries a
  /// paginated response contains. The maximum is 100.
  ///
  /// [nextToken]: The pagination token that you include in your request to
  /// indicate the next set of results that you want to retrieve.
  Future<DescribeBudgetsResponse> describeBudgets(String accountId,
      {int maxResults, String nextToken}) async {
    return DescribeBudgetsResponse.fromJson({});
  }

  /// Lists the notifications that are associated with a budget.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// notifications you want descriptions of.
  ///
  /// [budgetName]: The name of the budget whose notifications you want
  /// descriptions of.
  ///
  /// [maxResults]: An optional integer that represents how many entries a
  /// paginated response contains. The maximum is 100.
  ///
  /// [nextToken]: The pagination token that you include in your request to
  /// indicate the next set of results that you want to retrieve.
  Future<DescribeNotificationsForBudgetResponse> describeNotificationsForBudget(
      {@required String accountId,
      @required String budgetName,
      int maxResults,
      String nextToken}) async {
    return DescribeNotificationsForBudgetResponse.fromJson({});
  }

  /// Lists the subscribers that are associated with a notification.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// subscribers you want descriptions of.
  ///
  /// [budgetName]: The name of the budget whose subscribers you want
  /// descriptions of.
  ///
  /// [notification]: The notification whose subscribers you want to list.
  ///
  /// [maxResults]: An optional integer that represents how many entries a
  /// paginated response contains. The maximum is 100.
  ///
  /// [nextToken]: The pagination token that you include in your request to
  /// indicate the next set of results that you want to retrieve.
  Future<DescribeSubscribersForNotificationResponse>
      describeSubscribersForNotification(
          {@required String accountId,
          @required String budgetName,
          @required Notification notification,
          int maxResults,
          String nextToken}) async {
    return DescribeSubscribersForNotificationResponse.fromJson({});
  }

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
  ///
  /// [accountId]: The `accountId` that is associated with the budget that you
  /// want to update.
  ///
  /// [newBudget]: The budget that you want to update your budget to.
  Future<UpdateBudgetResponse> updateBudget(
      {@required String accountId, @required Budget newBudget}) async {
    return UpdateBudgetResponse.fromJson({});
  }

  /// Updates a notification.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// notification you want to update.
  ///
  /// [budgetName]: The name of the budget whose notification you want to
  /// update.
  ///
  /// [oldNotification]: The previous notification that is associated with a
  /// budget.
  ///
  /// [newNotification]: The updated notification to be associated with a
  /// budget.
  Future<UpdateNotificationResponse> updateNotification(
      {@required String accountId,
      @required String budgetName,
      @required Notification oldNotification,
      @required Notification newNotification}) async {
    return UpdateNotificationResponse.fromJson({});
  }

  /// Updates a subscriber.
  ///
  /// [accountId]: The `accountId` that is associated with the budget whose
  /// subscriber you want to update.
  ///
  /// [budgetName]: The name of the budget whose subscriber you want to update.
  ///
  /// [notification]: The notification whose subscriber you want to update.
  ///
  /// [oldSubscriber]: The previous subscriber that is associated with a budget
  /// notification.
  ///
  /// [newSubscriber]: The updated subscriber that is associated with a budget
  /// notification.
  Future<UpdateSubscriberResponse> updateSubscriber(
      {@required String accountId,
      @required String budgetName,
      @required Notification notification,
      @required Subscriber oldSubscriber,
      @required Subscriber newSubscriber}) async {
    return UpdateSubscriberResponse.fromJson({});
  }
}

/// Represents the output of the `CreateBudget` operation. The content consists
/// of the detailed metadata and data file information, and the current status
/// of the `budget` object.
///
/// This is the ARN pattern for a budget:
///
///  `arn:aws:budgetservice::AccountId:budget/budgetName`
class Budget {
  /// The name of a budget. The name must be unique within an account. The `:`
  /// and `` characters aren't allowed in `BudgetName`.
  final String budgetName;

  /// The total amount of cost, usage, RI utilization, or RI coverage that you
  /// want to track with your budget.
  ///
  ///  `BudgetLimit` is required for cost or usage budgets, but optional for RI
  /// utilization or coverage budgets. RI utilization or coverage budgets
  /// default to `100`, which is the only valid value for RI utilization or
  /// coverage budgets. You can't use `BudgetLimit` with `PlannedBudgetLimits`
  /// for `CreateBudget` and `UpdateBudget` actions.
  final Spend budgetLimit;

  /// A map containing multiple `BudgetLimit`, including current or future
  /// limits.
  ///
  ///  `PlannedBudgetLimits` is available for cost or usage budget and supports
  /// monthly and quarterly `TimeUnit`.
  ///
  /// For monthly budgets, provide 12 months of `PlannedBudgetLimits` values.
  /// This must start from the current month and include the next 11 months. The
  /// `key` is the start of the month, `UTC` in epoch seconds.
  ///
  /// For quarterly budgets, provide 4 quarters of `PlannedBudgetLimits` value
  /// entries in standard calendar quarter increments. This must start from the
  /// current quarter and include the next 3 quarters. The `key` is the start of
  /// the quarter, `UTC` in epoch seconds.
  ///
  /// If the planned budget expires before 12 months for monthly or 4 quarters
  /// for quarterly, provide the `PlannedBudgetLimits` values only for the
  /// remaining periods.
  ///
  /// If the budget begins at a date in the future, provide
  /// `PlannedBudgetLimits` values from the start date of the budget.
  ///
  /// After all of the `BudgetLimit` values in `PlannedBudgetLimits` are used,
  /// the budget continues to use the last limit as the `BudgetLimit`. At that
  /// point, the planned budget provides the same experience as a fixed budget.
  ///
  ///  `DescribeBudget` and `DescribeBudgets` response along with
  /// `PlannedBudgetLimits` will also contain `BudgetLimit` representing the
  /// current month or quarter limit present in `PlannedBudgetLimits`. This only
  /// applies to budgets created with `PlannedBudgetLimits`. Budgets created
  /// without `PlannedBudgetLimits` will only contain `BudgetLimit`, and no
  /// `PlannedBudgetLimits`.
  final Map<String, Spend> plannedBudgetLimits;

  /// The cost filters, such as service or tag, that are applied to a budget.
  ///
  /// AWS Budgets supports the following services as a filter for RI budgets:
  ///
  /// *   Amazon Elastic Compute Cloud - Compute
  ///
  /// *   Amazon Redshift
  ///
  /// *   Amazon Relational Database Service
  ///
  /// *   Amazon ElastiCache
  ///
  /// *   Amazon Elasticsearch Service
  final Map<String, List<String>> costFilters;

  /// The types of costs that are included in this `COST` budget.
  ///
  ///  `USAGE`, `RI_UTILIZATION`, and `RI_COVERAGE` budgets do not have
  /// `CostTypes`.
  final CostTypes costTypes;

  /// The length of time until a budget resets the actual and forecasted spend.
  /// `DAILY` is available only for `RI_UTILIZATION` and `RI_COVERAGE` budgets.
  final String timeUnit;

  /// The period of time that is covered by a budget. The period has a start
  /// date and an end date. The start date must come before the end date. The
  /// end date must come before `06/15/87 00:00 UTC`.
  ///
  /// If you create your budget and don't specify a start date, AWS defaults to
  /// the start of your chosen time period (DAILY, MONTHLY, QUARTERLY, or
  /// ANNUALLY). For example, if you created your budget on January 24, 2018,
  /// chose `DAILY`, and didn't set a start date, AWS set your start date to
  /// `01/24/18 00:00 UTC`. If you chose `MONTHLY`, AWS set your start date to
  /// `01/01/18 00:00 UTC`. If you didn't specify an end date, AWS set your end
  /// date to `06/15/87 00:00 UTC`. The defaults are the same for the AWS
  /// Billing and Cost Management console and the API.
  ///
  /// You can change either date with the `UpdateBudget` operation.
  ///
  /// After the end date, AWS deletes the budget and all associated
  /// notifications and subscribers.
  final TimePeriod timePeriod;

  /// The actual and forecasted cost or usage that the budget tracks.
  final CalculatedSpend calculatedSpend;

  /// Whether this budget tracks costs, usage, RI utilization, or RI coverage.
  final String budgetType;

  /// The last time that you updated this budget.
  final DateTime lastUpdatedTime;

  Budget({
    @required this.budgetName,
    this.budgetLimit,
    this.plannedBudgetLimits,
    this.costFilters,
    this.costTypes,
    @required this.timeUnit,
    this.timePeriod,
    this.calculatedSpend,
    @required this.budgetType,
    this.lastUpdatedTime,
  });
  static Budget fromJson(Map<String, dynamic> json) => Budget();
}

/// A history of the state of a budget at the end of the budget's specified time
/// period.
class BudgetPerformanceHistory {
  final String budgetName;

  final String budgetType;

  /// The history of the cost filters for a budget during the specified time
  /// period.
  final Map<String, List<String>> costFilters;

  /// The history of the cost types for a budget during the specified time
  /// period.
  final CostTypes costTypes;

  final String timeUnit;

  /// A list of amounts of cost or usage that you created budgets for, compared
  /// to your actual costs or usage.
  final List<BudgetedAndActualAmounts> budgetedAndActualAmountsList;

  BudgetPerformanceHistory({
    this.budgetName,
    this.budgetType,
    this.costFilters,
    this.costTypes,
    this.timeUnit,
    this.budgetedAndActualAmountsList,
  });
  static BudgetPerformanceHistory fromJson(Map<String, dynamic> json) =>
      BudgetPerformanceHistory();
}

/// The amount of cost or usage that you created the budget for, compared to
/// your actual costs or usage.
class BudgetedAndActualAmounts {
  /// The amount of cost or usage that you created the budget for.
  final Spend budgetedAmount;

  /// Your actual costs or usage for a budget period.
  final Spend actualAmount;

  /// The time period covered by this budget comparison.
  final TimePeriod timePeriod;

  BudgetedAndActualAmounts({
    this.budgetedAmount,
    this.actualAmount,
    this.timePeriod,
  });
  static BudgetedAndActualAmounts fromJson(Map<String, dynamic> json) =>
      BudgetedAndActualAmounts();
}

/// The spend objects that are associated with this budget. The `actualSpend`
/// tracks how much you've used, cost, usage, or RI units, and the
/// `forecastedSpend` tracks how much you are predicted to spend if your current
/// usage remains steady.
///
/// For example, if it is the 20th of the month and you have spent `50` dollars
/// on Amazon EC2, your `actualSpend` is `50 USD`, and your `forecastedSpend` is
/// `75 USD`.
class CalculatedSpend {
  /// The amount of cost, usage, or RI units that you have used.
  final Spend actualSpend;

  /// The amount of cost, usage, or RI units that you are forecasted to use.
  final Spend forecastedSpend;

  CalculatedSpend({
    @required this.actualSpend,
    this.forecastedSpend,
  });
  static CalculatedSpend fromJson(Map<String, dynamic> json) =>
      CalculatedSpend();
}

/// The types of cost that are included in a `COST` budget, such as tax and
/// subscriptions.
///
///  `USAGE`, `RI_UTILIZATION`, and `RI_COVERAGE` budgets do not have
/// `CostTypes`.
class CostTypes {
  /// Specifies whether a budget includes taxes.
  ///
  /// The default value is `true`.
  final bool includeTax;

  /// Specifies whether a budget includes subscriptions.
  ///
  /// The default value is `true`.
  final bool includeSubscription;

  /// Specifies whether a budget uses a blended rate.
  ///
  /// The default value is `false`.
  final bool useBlended;

  /// Specifies whether a budget includes refunds.
  ///
  /// The default value is `true`.
  final bool includeRefund;

  /// Specifies whether a budget includes credits.
  ///
  /// The default value is `true`.
  final bool includeCredit;

  /// Specifies whether a budget includes upfront RI costs.
  ///
  /// The default value is `true`.
  final bool includeUpfront;

  /// Specifies whether a budget includes recurring fees such as monthly RI
  /// fees.
  ///
  /// The default value is `true`.
  final bool includeRecurring;

  /// Specifies whether a budget includes non-RI subscription costs.
  ///
  /// The default value is `true`.
  final bool includeOtherSubscription;

  /// Specifies whether a budget includes support subscription fees.
  ///
  /// The default value is `true`.
  final bool includeSupport;

  /// Specifies whether a budget includes discounts.
  ///
  /// The default value is `true`.
  final bool includeDiscount;

  /// Specifies whether a budget uses the amortized rate.
  ///
  /// The default value is `false`.
  final bool useAmortized;

  CostTypes({
    this.includeTax,
    this.includeSubscription,
    this.useBlended,
    this.includeRefund,
    this.includeCredit,
    this.includeUpfront,
    this.includeRecurring,
    this.includeOtherSubscription,
    this.includeSupport,
    this.includeDiscount,
    this.useAmortized,
  });
  static CostTypes fromJson(Map<String, dynamic> json) => CostTypes();
}

///  Response of CreateBudget
class CreateBudgetResponse {
  CreateBudgetResponse();
  static CreateBudgetResponse fromJson(Map<String, dynamic> json) =>
      CreateBudgetResponse();
}

///  Response of CreateNotification
class CreateNotificationResponse {
  CreateNotificationResponse();
  static CreateNotificationResponse fromJson(Map<String, dynamic> json) =>
      CreateNotificationResponse();
}

///  Response of CreateSubscriber
class CreateSubscriberResponse {
  CreateSubscriberResponse();
  static CreateSubscriberResponse fromJson(Map<String, dynamic> json) =>
      CreateSubscriberResponse();
}

///  Response of DeleteBudget
class DeleteBudgetResponse {
  DeleteBudgetResponse();
  static DeleteBudgetResponse fromJson(Map<String, dynamic> json) =>
      DeleteBudgetResponse();
}

///  Response of DeleteNotification
class DeleteNotificationResponse {
  DeleteNotificationResponse();
  static DeleteNotificationResponse fromJson(Map<String, dynamic> json) =>
      DeleteNotificationResponse();
}

///  Response of DeleteSubscriber
class DeleteSubscriberResponse {
  DeleteSubscriberResponse();
  static DeleteSubscriberResponse fromJson(Map<String, dynamic> json) =>
      DeleteSubscriberResponse();
}

class DescribeBudgetPerformanceHistoryResponse {
  /// The history of how often the budget has gone into an `ALARM` state.
  ///
  /// For `DAILY` budgets, the history saves the state of the budget for the
  /// last 60 days. For `MONTHLY` budgets, the history saves the state of the
  /// budget for the current month plus the last 12 months. For `QUARTERLY`
  /// budgets, the history saves the state of the budget for the last four
  /// quarters.
  final BudgetPerformanceHistory budgetPerformanceHistory;

  final String nextToken;

  DescribeBudgetPerformanceHistoryResponse({
    this.budgetPerformanceHistory,
    this.nextToken,
  });
  static DescribeBudgetPerformanceHistoryResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeBudgetPerformanceHistoryResponse();
}

///  Response of DescribeBudget
class DescribeBudgetResponse {
  /// The description of the budget.
  final Budget budget;

  DescribeBudgetResponse({
    this.budget,
  });
  static DescribeBudgetResponse fromJson(Map<String, dynamic> json) =>
      DescribeBudgetResponse();
}

///  Response of DescribeBudgets
class DescribeBudgetsResponse {
  /// A list of budgets.
  final List<Budget> budgets;

  /// The pagination token in the service response that indicates the next set
  /// of results that you can retrieve.
  final String nextToken;

  DescribeBudgetsResponse({
    this.budgets,
    this.nextToken,
  });
  static DescribeBudgetsResponse fromJson(Map<String, dynamic> json) =>
      DescribeBudgetsResponse();
}

///  Response of GetNotificationsForBudget
class DescribeNotificationsForBudgetResponse {
  /// A list of notifications that are associated with a budget.
  final List<Notification> notifications;

  /// The pagination token in the service response that indicates the next set
  /// of results that you can retrieve.
  final String nextToken;

  DescribeNotificationsForBudgetResponse({
    this.notifications,
    this.nextToken,
  });
  static DescribeNotificationsForBudgetResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeNotificationsForBudgetResponse();
}

///  Response of DescribeSubscribersForNotification
class DescribeSubscribersForNotificationResponse {
  /// A list of subscribers that are associated with a notification.
  final List<Subscriber> subscribers;

  /// The pagination token in the service response that indicates the next set
  /// of results that you can retrieve.
  final String nextToken;

  DescribeSubscribersForNotificationResponse({
    this.subscribers,
    this.nextToken,
  });
  static DescribeSubscribersForNotificationResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeSubscribersForNotificationResponse();
}

/// A notification that is associated with a budget. A budget can have up to
/// five notifications.
///
/// Each notification must have at least one subscriber. A notification can have
/// one SNS subscriber and up to 10 email subscribers, for a total of 11
/// subscribers.
///
/// For example, if you have a budget for 200 dollars and you want to be
/// notified when you go over 160 dollars, create a notification with the
/// following parameters:
///
/// *   A notificationType of `ACTUAL`
///
/// *   A `thresholdType` of `PERCENTAGE`
///
/// *   A `comparisonOperator` of `GREATER_THAN`
///
/// *   A notification `threshold` of `80`
class Notification {
  /// Whether the notification is for how much you have spent (`ACTUAL`) or for
  /// how much you're forecasted to spend (`FORECASTED`).
  final String notificationType;

  /// The comparison that is used for this notification.
  final String comparisonOperator;

  /// The threshold that is associated with a notification. Thresholds are
  /// always a percentage.
  final double threshold;

  /// The type of threshold for a notification. For `ABSOLUTE_VALUE` thresholds,
  /// AWS notifies you when you go over or are forecasted to go over your total
  /// cost threshold. For `PERCENTAGE` thresholds, AWS notifies you when you go
  /// over or are forecasted to go over a certain percentage of your forecasted
  /// spend. For example, if you have a budget for 200 dollars and you have a
  /// `PERCENTAGE` threshold of 80%, AWS notifies you when you go over 160
  /// dollars.
  final String thresholdType;

  /// Whether this notification is in alarm. If a budget notification is in the
  /// `ALARM` state, you have passed the set threshold for the budget.
  final String notificationState;

  Notification({
    @required this.notificationType,
    @required this.comparisonOperator,
    @required this.threshold,
    this.thresholdType,
    this.notificationState,
  });
  static Notification fromJson(Map<String, dynamic> json) => Notification();
}

/// A notification with subscribers. A notification can have one SNS subscriber
/// and up to 10 email subscribers, for a total of 11 subscribers.
class NotificationWithSubscribers {
  /// The notification that is associated with a budget.
  final Notification notification;

  /// A list of subscribers who are subscribed to this notification.
  final List<Subscriber> subscribers;

  NotificationWithSubscribers({
    @required this.notification,
    @required this.subscribers,
  });
}

/// The amount of cost or usage that is measured for a budget.
///
/// For example, a `Spend` for `3 GB` of S3 usage would have the following
/// parameters:
///
/// *   An `Amount` of `3`
///
/// *   A `unit` of `GB`
class Spend {
  /// The cost or usage amount that is associated with a budget forecast, actual
  /// spend, or budget threshold.
  final String amount;

  /// The unit of measurement that is used for the budget forecast, actual
  /// spend, or budget threshold, such as dollars or GB.
  final String unit;

  Spend({
    @required this.amount,
    @required this.unit,
  });
  static Spend fromJson(Map<String, dynamic> json) => Spend();
}

/// The subscriber to a budget notification. The subscriber consists of a
/// subscription type and either an Amazon SNS topic or an email address.
///
/// For example, an email subscriber would have the following parameters:
///
/// *   A `subscriptionType` of `EMAIL`
///
/// *   An `address` of `example@example.com`
class Subscriber {
  /// The type of notification that AWS sends to a subscriber.
  final String subscriptionType;

  /// The address that AWS sends budget notifications to, either an SNS topic or
  /// an email.
  ///
  /// AWS validates the address for a `CreateSubscriber` request with the `.*`
  /// regex.
  final String address;

  Subscriber({
    @required this.subscriptionType,
    @required this.address,
  });
  static Subscriber fromJson(Map<String, dynamic> json) => Subscriber();
}

/// The period of time that is covered by a budget. The period has a start date
/// and an end date. The start date must come before the end date. There are no
/// restrictions on the end date.
class TimePeriod {
  /// The start date for a budget. If you created your budget and didn't specify
  /// a start date, AWS defaults to the start of your chosen time period (DAILY,
  /// MONTHLY, QUARTERLY, or ANNUALLY). For example, if you created your budget
  /// on January 24, 2018, chose `DAILY`, and didn't set a start date, AWS set
  /// your start date to `01/24/18 00:00 UTC`. If you chose `MONTHLY`, AWS set
  /// your start date to `01/01/18 00:00 UTC`. The defaults are the same for the
  /// AWS Billing and Cost Management console and the API.
  ///
  /// You can change your start date with the `UpdateBudget` operation.
  final DateTime start;

  /// The end date for a budget. If you didn't specify an end date, AWS set your
  /// end date to `06/15/87 00:00 UTC`. The defaults are the same for the AWS
  /// Billing and Cost Management console and the API.
  ///
  /// After the end date, AWS deletes the budget and all associated
  /// notifications and subscribers. You can change your end date with the
  /// `UpdateBudget` operation.
  final DateTime end;

  TimePeriod({
    this.start,
    this.end,
  });
  static TimePeriod fromJson(Map<String, dynamic> json) => TimePeriod();
}

///  Response of UpdateBudget
class UpdateBudgetResponse {
  UpdateBudgetResponse();
  static UpdateBudgetResponse fromJson(Map<String, dynamic> json) =>
      UpdateBudgetResponse();
}

///  Response of UpdateNotification
class UpdateNotificationResponse {
  UpdateNotificationResponse();
  static UpdateNotificationResponse fromJson(Map<String, dynamic> json) =>
      UpdateNotificationResponse();
}

///  Response of UpdateSubscriber
class UpdateSubscriberResponse {
  UpdateSubscriberResponse();
  static UpdateSubscriberResponse fromJson(Map<String, dynamic> json) =>
      UpdateSubscriberResponse();
}
