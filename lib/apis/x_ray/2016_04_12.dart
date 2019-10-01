import 'package:meta/meta.dart';

/// AWS X-Ray provides APIs for managing debug traces and retrieving service
/// maps and other data created by processing those traces.
class XRayApi {
  /// Retrieves a list of traces specified by ID. Each trace is a collection of
  /// segment documents that originates from a single request. Use
  /// `GetTraceSummaries` to get a list of trace IDs.
  ///
  /// [traceIds]: Specify the trace IDs of requests for which to retrieve
  /// segments.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<BatchGetTracesResult> batchGetTraces(List<String> traceIds,
      {String nextToken}) async {
    return BatchGetTracesResult.fromJson({});
  }

  /// Creates a group resource with a name and a filter expression.
  ///
  /// [groupName]: The case-sensitive name of the new group. Default is a
  /// reserved name and names must be unique.
  ///
  /// [filterExpression]: The filter expression defining criteria by which to
  /// group traces.
  Future<CreateGroupResult> createGroup(String groupName,
      {String filterExpression}) async {
    return CreateGroupResult.fromJson({});
  }

  /// Creates a rule to control sampling behavior for instrumented applications.
  /// Services retrieve rules with GetSamplingRules, and evaluate each rule in
  /// ascending order of _priority_ for each request. If a rule matches, the
  /// service records a trace, borrowing it from the reservoir size. After 10
  /// seconds, the service reports back to X-Ray with GetSamplingTargets to get
  /// updated versions of each in-use rule. The updated rule contains a trace
  /// quota that the service can use instead of borrowing from the reservoir.
  ///
  /// [samplingRule]: The rule definition.
  Future<CreateSamplingRuleResult> createSamplingRule(
      SamplingRule samplingRule) async {
    return CreateSamplingRuleResult.fromJson({});
  }

  /// Deletes a group resource.
  ///
  /// [groupName]: The case-sensitive name of the group.
  ///
  /// [groupArn]: The ARN of the group that was generated on creation.
  Future<DeleteGroupResult> deleteGroup(
      {String groupName, String groupArn}) async {
    return DeleteGroupResult.fromJson({});
  }

  /// Deletes a sampling rule.
  ///
  /// [ruleName]: The name of the sampling rule. Specify a rule by either name
  /// or ARN, but not both.
  ///
  /// [ruleArn]: The ARN of the sampling rule. Specify a rule by either name or
  /// ARN, but not both.
  Future<DeleteSamplingRuleResult> deleteSamplingRule(
      {String ruleName, String ruleArn}) async {
    return DeleteSamplingRuleResult.fromJson({});
  }

  /// Retrieves the current encryption configuration for X-Ray data.
  Future<GetEncryptionConfigResult> getEncryptionConfig() async {
    return GetEncryptionConfigResult.fromJson({});
  }

  /// Retrieves group resource details.
  ///
  /// [groupName]: The case-sensitive name of the group.
  ///
  /// [groupArn]: The ARN of the group that was generated on creation.
  Future<GetGroupResult> getGroup({String groupName, String groupArn}) async {
    return GetGroupResult.fromJson({});
  }

  /// Retrieves all active group details.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetGroupsResult> getGroups({String nextToken}) async {
    return GetGroupsResult.fromJson({});
  }

  /// Retrieves all sampling rules.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetSamplingRulesResult> getSamplingRules({String nextToken}) async {
    return GetSamplingRulesResult.fromJson({});
  }

  /// Retrieves information about recent sampling results for all sampling
  /// rules.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetSamplingStatisticSummariesResult> getSamplingStatisticSummaries(
      {String nextToken}) async {
    return GetSamplingStatisticSummariesResult.fromJson({});
  }

  /// Requests a sampling quota for rules that the service is using to sample
  /// requests.
  ///
  /// [samplingStatisticsDocuments]: Information about rules that the service is
  /// using to sample requests.
  Future<GetSamplingTargetsResult> getSamplingTargets(
      List<SamplingStatisticsDocument> samplingStatisticsDocuments) async {
    return GetSamplingTargetsResult.fromJson({});
  }

  /// Retrieves a document that describes services that process incoming
  /// requests, and downstream services that they call as a result. Root
  /// services process incoming requests and make calls to downstream services.
  /// Root services are applications that use the AWS X-Ray SDK. Downstream
  /// services can be other applications, AWS resources, HTTP web APIs, or SQL
  /// databases.
  ///
  /// [startTime]: The start of the time frame for which to generate a graph.
  ///
  /// [endTime]: The end of the timeframe for which to generate a graph.
  ///
  /// [groupName]: The name of a group to generate a graph based on.
  ///
  /// [groupArn]: The ARN of a group to generate a graph based on.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetServiceGraphResult> getServiceGraph(
      {@required DateTime startTime,
      @required DateTime endTime,
      String groupName,
      String groupArn,
      String nextToken}) async {
    return GetServiceGraphResult.fromJson({});
  }

  /// Get an aggregation of service statistics defined by a specific time range.
  ///
  /// [startTime]: The start of the time frame for which to aggregate
  /// statistics.
  ///
  /// [endTime]: The end of the time frame for which to aggregate statistics.
  ///
  /// [groupName]: The case-sensitive name of the group for which to pull
  /// statistics from.
  ///
  /// [groupArn]: The ARN of the group for which to pull statistics from.
  ///
  /// [entitySelectorExpression]: A filter expression defining entities that
  /// will be aggregated for statistics. Supports ID, service, and edge
  /// functions. If no selector expression is specified, edge statistics are
  /// returned.
  ///
  /// [period]: Aggregation period in seconds.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetTimeSeriesServiceStatisticsResult> getTimeSeriesServiceStatistics(
      {@required DateTime startTime,
      @required DateTime endTime,
      String groupName,
      String groupArn,
      String entitySelectorExpression,
      int period,
      String nextToken}) async {
    return GetTimeSeriesServiceStatisticsResult.fromJson({});
  }

  /// Retrieves a service graph for one or more specific trace IDs.
  ///
  /// [traceIds]: Trace IDs of requests for which to generate a service graph.
  ///
  /// [nextToken]: Pagination token. Not used.
  Future<GetTraceGraphResult> getTraceGraph(List<String> traceIds,
      {String nextToken}) async {
    return GetTraceGraphResult.fromJson({});
  }

  /// Retrieves IDs and metadata for traces available for a specified time frame
  /// using an optional filter. To get the full traces, pass the trace IDs to
  /// `BatchGetTraces`.
  ///
  /// A filter expression can target traced requests that hit specific service
  /// nodes or edges, have errors, or come from a known user. For example, the
  /// following filter expression targets traces that pass through
  /// `api.example.com`:
  ///
  ///  `service("api.example.com")`
  ///
  /// This filter expression finds traces that have an annotation named
  /// `account` with the value `12345`:
  ///
  ///  `annotation.account = "12345"`
  ///
  /// For a full list of indexed fields and keywords that you can use in filter
  /// expressions, see [Using Filter
  /// Expressions](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-filters.html)
  /// in the _AWS X-Ray Developer Guide_.
  ///
  /// [startTime]: The start of the time frame for which to retrieve traces.
  ///
  /// [endTime]: The end of the time frame for which to retrieve traces.
  ///
  /// [timeRangeType]: A parameter to indicate whether to query trace summaries
  /// by TraceId or Event time.
  ///
  /// [sampling]: Set to `true` to get summaries for only a subset of available
  /// traces.
  ///
  /// [samplingStrategy]: A paramater to indicate whether to enable sampling on
  /// trace summaries. Input parameters are Name and Value.
  ///
  /// [filterExpression]: Specify a filter expression to retrieve trace
  /// summaries for services or requests that meet certain requirements.
  ///
  /// [nextToken]: Specify the pagination token returned by a previous request
  /// to retrieve the next page of results.
  Future<GetTraceSummariesResult> getTraceSummaries(
      {@required DateTime startTime,
      @required DateTime endTime,
      String timeRangeType,
      bool sampling,
      SamplingStrategy samplingStrategy,
      String filterExpression,
      String nextToken}) async {
    return GetTraceSummariesResult.fromJson({});
  }

  /// Updates the encryption configuration for X-Ray data.
  ///
  /// [keyId]: An AWS KMS customer master key (CMK) in one of the following
  /// formats:
  ///
  /// *    **Alias** \- The name of the key. For example, `alias/MyKey`.
  ///
  /// *    **Key ID** \- The KMS key ID of the key. For example,
  /// `ae4aa6d49-a4d8-9df9-a475-4ff6d7898456`.
  ///
  /// *    **ARN** \- The full Amazon Resource Name of the key ID or alias. For
  /// example,
  /// `arn:aws:kms:us-east-2:123456789012:key/ae4aa6d49-a4d8-9df9-a475-4ff6d7898456`.
  /// Use this format to specify a key in a different account.
  ///
  ///
  /// Omit this key if you set `Type` to `NONE`.
  ///
  /// [type]: The type of encryption. Set to `KMS` to use your own key for
  /// encryption. Set to `NONE` for default encryption.
  Future<PutEncryptionConfigResult> putEncryptionConfig(String type,
      {String keyId}) async {
    return PutEncryptionConfigResult.fromJson({});
  }

  /// Used by the AWS X-Ray daemon to upload telemetry.
  ///
  /// [telemetryRecords]:
  ///
  /// [ec2InstanceId]:
  ///
  /// [hostname]:
  ///
  /// [resourceArn]:
  Future<PutTelemetryRecordsResult> putTelemetryRecords(
      List<TelemetryRecord> telemetryRecords,
      {String ec2InstanceId,
      String hostname,
      String resourceArn}) async {
    return PutTelemetryRecordsResult.fromJson({});
  }

  /// Uploads segment documents to AWS X-Ray. The X-Ray SDK generates segment
  /// documents and sends them to the X-Ray daemon, which uploads them in
  /// batches. A segment document can be a completed segment, an in-progress
  /// segment, or an array of subsegments.
  ///
  /// Segments must include the following fields. For the full segment document
  /// schema, see [AWS X-Ray Segment
  /// Documents](https://docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html)
  /// in the _AWS X-Ray Developer Guide_.
  ///
  ///  **Required Segment Document Fields**
  ///
  /// *    `name` \- The name of the service that handled the request.
  ///
  /// *    `id` \- A 64-bit identifier for the segment, unique among segments in
  /// the same trace, in 16 hexadecimal digits.
  ///
  /// *    `trace_id` \- A unique identifier that connects all segments and
  /// subsegments originating from a single client request.
  ///
  /// *    `start_time` \- Time the segment or subsegment was created, in
  /// floating point seconds in epoch time, accurate to milliseconds. For
  /// example, `1480615200.010` or `1.480615200010E9`.
  ///
  /// *    `end_time` \- Time the segment or subsegment was closed. For example,
  /// `1480615200.090` or `1.480615200090E9`. Specify either an `end_time` or
  /// `in_progress`.
  ///
  /// *    `in_progress` \- Set to `true` instead of specifying an `end_time` to
  /// record that a segment has been started, but is not complete. Send an in
  /// progress segment when your application receives a request that will take a
  /// long time to serve, to trace the fact that the request was received. When
  /// the response is sent, send the complete segment to overwrite the
  /// in-progress segment.
  ///
  ///
  /// A `trace_id` consists of three numbers separated by hyphens. For example,
  /// 1-58406520-a006649127e371903a2de979. This includes:
  ///
  ///  **Trace ID Format**
  ///
  /// *   The version number, i.e. `1`.
  ///
  /// *   The time of the original request, in Unix epoch time, in 8 hexadecimal
  /// digits. For example, 10:00AM December 2nd, 2016 PST in epoch time is
  /// `1480615200` seconds, or `58406520` in hexadecimal.
  ///
  /// *   A 96-bit identifier for the trace, globally unique, in 24 hexadecimal
  /// digits.
  ///
  /// [traceSegmentDocuments]: A string containing a JSON document defining one
  /// or more segments or subsegments.
  Future<PutTraceSegmentsResult> putTraceSegments(
      List<String> traceSegmentDocuments) async {
    return PutTraceSegmentsResult.fromJson({});
  }

  /// Updates a group resource.
  ///
  /// [groupName]: The case-sensitive name of the group.
  ///
  /// [groupArn]: The ARN that was generated upon creation.
  ///
  /// [filterExpression]: The updated filter expression defining criteria by
  /// which to group traces.
  Future<UpdateGroupResult> updateGroup(
      {String groupName, String groupArn, String filterExpression}) async {
    return UpdateGroupResult.fromJson({});
  }

  /// Modifies a sampling rule's configuration.
  ///
  /// [samplingRuleUpdate]: The rule and fields to change.
  Future<UpdateSamplingRuleResult> updateSamplingRule(
      SamplingRuleUpdate samplingRuleUpdate) async {
    return UpdateSamplingRuleResult.fromJson({});
  }
}

class Alias {
  /// The canonical name of the alias.
  final String name;

  /// A list of names for the alias, including the canonical name.
  final List<String> names;

  /// The type of the alias.
  final String type;

  Alias({
    this.name,
    this.names,
    this.type,
  });
  static Alias fromJson(Map<String, dynamic> json) => Alias();
}

class AnnotationValue {
  /// Value for a Number annotation.
  final double numberValue;

  /// Value for a Boolean annotation.
  final bool booleanValue;

  /// Value for a String annotation.
  final String stringValue;

  AnnotationValue({
    this.numberValue,
    this.booleanValue,
    this.stringValue,
  });
  static AnnotationValue fromJson(Map<String, dynamic> json) =>
      AnnotationValue();
}

class AvailabilityZoneDetail {
  /// The name of a corresponding availability zone.
  final String name;

  AvailabilityZoneDetail({
    this.name,
  });
  static AvailabilityZoneDetail fromJson(Map<String, dynamic> json) =>
      AvailabilityZoneDetail();
}

class BackendConnectionErrors {
  final int timeoutCount;

  final int connectionRefusedCount;

  final int httpCode4xxCount;

  final int httpCode5xxCount;

  final int unknownHostCount;

  final int otherCount;

  BackendConnectionErrors({
    this.timeoutCount,
    this.connectionRefusedCount,
    this.httpCode4xxCount,
    this.httpCode5xxCount,
    this.unknownHostCount,
    this.otherCount,
  });
}

class BatchGetTracesResult {
  /// Full traces for the specified requests.
  final List<Trace> traces;

  /// Trace IDs of requests that haven't been processed.
  final List<String> unprocessedTraceIds;

  /// Pagination token. Not used.
  final String nextToken;

  BatchGetTracesResult({
    this.traces,
    this.unprocessedTraceIds,
    this.nextToken,
  });
  static BatchGetTracesResult fromJson(Map<String, dynamic> json) =>
      BatchGetTracesResult();
}

class CreateGroupResult {
  /// The group that was created. Contains the name of the group that was
  /// created, the ARN of the group that was generated based on the group name,
  /// and the filter expression that was assigned to the group.
  final Group group;

  CreateGroupResult({
    this.group,
  });
  static CreateGroupResult fromJson(Map<String, dynamic> json) =>
      CreateGroupResult();
}

class CreateSamplingRuleResult {
  /// The saved rule definition and metadata.
  final SamplingRuleRecord samplingRuleRecord;

  CreateSamplingRuleResult({
    this.samplingRuleRecord,
  });
  static CreateSamplingRuleResult fromJson(Map<String, dynamic> json) =>
      CreateSamplingRuleResult();
}

class DeleteGroupResult {
  DeleteGroupResult();
  static DeleteGroupResult fromJson(Map<String, dynamic> json) =>
      DeleteGroupResult();
}

class DeleteSamplingRuleResult {
  /// The deleted rule definition and metadata.
  final SamplingRuleRecord samplingRuleRecord;

  DeleteSamplingRuleResult({
    this.samplingRuleRecord,
  });
  static DeleteSamplingRuleResult fromJson(Map<String, dynamic> json) =>
      DeleteSamplingRuleResult();
}

class Edge {
  /// Identifier of the edge. Unique within a service map.
  final int referenceId;

  /// The start time of the first segment on the edge.
  final DateTime startTime;

  /// The end time of the last segment on the edge.
  final DateTime endTime;

  /// Response statistics for segments on the edge.
  final EdgeStatistics summaryStatistics;

  /// A histogram that maps the spread of client response times on an edge.
  final List<HistogramEntry> responseTimeHistogram;

  /// Aliases for the edge.
  final List<Alias> aliases;

  Edge({
    this.referenceId,
    this.startTime,
    this.endTime,
    this.summaryStatistics,
    this.responseTimeHistogram,
    this.aliases,
  });
  static Edge fromJson(Map<String, dynamic> json) => Edge();
}

class EdgeStatistics {
  /// The number of requests that completed with a 2xx Success status code.
  final BigInt okCount;

  /// Information about requests that failed with a 4xx Client Error status
  /// code.
  final ErrorStatistics errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status
  /// code.
  final FaultStatistics faultStatistics;

  /// The total number of completed requests.
  final BigInt totalCount;

  /// The aggregate response time of completed requests.
  final double totalResponseTime;

  EdgeStatistics({
    this.okCount,
    this.errorStatistics,
    this.faultStatistics,
    this.totalCount,
    this.totalResponseTime,
  });
  static EdgeStatistics fromJson(Map<String, dynamic> json) => EdgeStatistics();
}

class EncryptionConfig {
  /// The ID of the customer master key (CMK) used for encryption, if
  /// applicable.
  final String keyId;

  /// The encryption status. While the status is `UPDATING`, X-Ray may encrypt
  /// data with a combination of the new and old settings.
  final String status;

  /// The type of encryption. Set to `KMS` for encryption with CMKs. Set to
  /// `NONE` for default encryption.
  final String type;

  EncryptionConfig({
    this.keyId,
    this.status,
    this.type,
  });
  static EncryptionConfig fromJson(Map<String, dynamic> json) =>
      EncryptionConfig();
}

class ErrorRootCause {
  /// A list of services corresponding to an error. A service identifies a
  /// segment and it contains a name, account ID, type, and inferred flag.
  final List<ErrorRootCauseService> services;

  ErrorRootCause({
    this.services,
  });
  static ErrorRootCause fromJson(Map<String, dynamic> json) => ErrorRootCause();
}

class ErrorRootCauseEntity {
  /// The name of the entity.
  final String name;

  /// The types and messages of the exceptions.
  final List<RootCauseException> exceptions;

  /// A flag that denotes a remote subsegment.
  final bool remote;

  ErrorRootCauseEntity({
    this.name,
    this.exceptions,
    this.remote,
  });
  static ErrorRootCauseEntity fromJson(Map<String, dynamic> json) =>
      ErrorRootCauseEntity();
}

class ErrorRootCauseService {
  /// The service name.
  final String name;

  /// A collection of associated service names.
  final List<String> names;

  /// The type associated to the service.
  final String type;

  /// The account ID associated to the service.
  final String accountId;

  /// The path of root cause entities found on the service.
  final List<ErrorRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool inferred;

  ErrorRootCauseService({
    this.name,
    this.names,
    this.type,
    this.accountId,
    this.entityPath,
    this.inferred,
  });
  static ErrorRootCauseService fromJson(Map<String, dynamic> json) =>
      ErrorRootCauseService();
}

class ErrorStatistics {
  /// The number of requests that failed with a 419 throttling status code.
  final BigInt throttleCount;

  /// The number of requests that failed with untracked 4xx Client Error status
  /// codes.
  final BigInt otherCount;

  /// The total number of requests that failed with a 4xx Client Error status
  /// code.
  final BigInt totalCount;

  ErrorStatistics({
    this.throttleCount,
    this.otherCount,
    this.totalCount,
  });
  static ErrorStatistics fromJson(Map<String, dynamic> json) =>
      ErrorStatistics();
}

class FaultRootCause {
  /// A list of corresponding services. A service identifies a segment and it
  /// contains a name, account ID, type, and inferred flag.
  final List<FaultRootCauseService> services;

  FaultRootCause({
    this.services,
  });
  static FaultRootCause fromJson(Map<String, dynamic> json) => FaultRootCause();
}

class FaultRootCauseEntity {
  /// The name of the entity.
  final String name;

  /// The types and messages of the exceptions.
  final List<RootCauseException> exceptions;

  /// A flag that denotes a remote subsegment.
  final bool remote;

  FaultRootCauseEntity({
    this.name,
    this.exceptions,
    this.remote,
  });
  static FaultRootCauseEntity fromJson(Map<String, dynamic> json) =>
      FaultRootCauseEntity();
}

class FaultRootCauseService {
  /// The service name.
  final String name;

  /// A collection of associated service names.
  final List<String> names;

  /// The type associated to the service.
  final String type;

  /// The account ID associated to the service.
  final String accountId;

  /// The path of root cause entities found on the service.
  final List<FaultRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool inferred;

  FaultRootCauseService({
    this.name,
    this.names,
    this.type,
    this.accountId,
    this.entityPath,
    this.inferred,
  });
  static FaultRootCauseService fromJson(Map<String, dynamic> json) =>
      FaultRootCauseService();
}

class FaultStatistics {
  /// The number of requests that failed with untracked 5xx Server Error status
  /// codes.
  final BigInt otherCount;

  /// The total number of requests that failed with a 5xx Server Error status
  /// code.
  final BigInt totalCount;

  FaultStatistics({
    this.otherCount,
    this.totalCount,
  });
  static FaultStatistics fromJson(Map<String, dynamic> json) =>
      FaultStatistics();
}

class GetEncryptionConfigResult {
  /// The encryption configuration document.
  final EncryptionConfig encryptionConfig;

  GetEncryptionConfigResult({
    this.encryptionConfig,
  });
  static GetEncryptionConfigResult fromJson(Map<String, dynamic> json) =>
      GetEncryptionConfigResult();
}

class GetGroupResult {
  /// The group that was requested. Contains the name of the group, the ARN of
  /// the group, and the filter expression that assigned to the group.
  final Group group;

  GetGroupResult({
    this.group,
  });
  static GetGroupResult fromJson(Map<String, dynamic> json) => GetGroupResult();
}

class GetGroupsResult {
  /// The collection of all active groups.
  final List<GroupSummary> groups;

  /// Pagination token. Not used.
  final String nextToken;

  GetGroupsResult({
    this.groups,
    this.nextToken,
  });
  static GetGroupsResult fromJson(Map<String, dynamic> json) =>
      GetGroupsResult();
}

class GetSamplingRulesResult {
  /// Rule definitions and metadata.
  final List<SamplingRuleRecord> samplingRuleRecords;

  /// Pagination token. Not used.
  final String nextToken;

  GetSamplingRulesResult({
    this.samplingRuleRecords,
    this.nextToken,
  });
  static GetSamplingRulesResult fromJson(Map<String, dynamic> json) =>
      GetSamplingRulesResult();
}

class GetSamplingStatisticSummariesResult {
  /// Information about the number of requests instrumented for each sampling
  /// rule.
  final List<SamplingStatisticSummary> samplingStatisticSummaries;

  /// Pagination token. Not used.
  final String nextToken;

  GetSamplingStatisticSummariesResult({
    this.samplingStatisticSummaries,
    this.nextToken,
  });
  static GetSamplingStatisticSummariesResult fromJson(
          Map<String, dynamic> json) =>
      GetSamplingStatisticSummariesResult();
}

class GetSamplingTargetsResult {
  /// Updated rules that the service should use to sample requests.
  final List<SamplingTargetDocument> samplingTargetDocuments;

  /// The last time a user changed the sampling rule configuration. If the
  /// sampling rule configuration changed since the service last retrieved it,
  /// the service should call GetSamplingRules to get the latest version.
  final DateTime lastRuleModification;

  /// Information about SamplingStatisticsDocument that X-Ray could not process.
  final List<UnprocessedStatistics> unprocessedStatistics;

  GetSamplingTargetsResult({
    this.samplingTargetDocuments,
    this.lastRuleModification,
    this.unprocessedStatistics,
  });
  static GetSamplingTargetsResult fromJson(Map<String, dynamic> json) =>
      GetSamplingTargetsResult();
}

class GetServiceGraphResult {
  /// The start of the time frame for which the graph was generated.
  final DateTime startTime;

  /// The end of the time frame for which the graph was generated.
  final DateTime endTime;

  /// The services that have processed a traced request during the specified
  /// time frame.
  final List<Service> services;

  /// A flag indicating whether the group's filter expression has been
  /// consistent, or if the returned service graph may show traces from an older
  /// version of the group's filter expression.
  final bool containsOldGroupVersions;

  /// Pagination token. Not used.
  final String nextToken;

  GetServiceGraphResult({
    this.startTime,
    this.endTime,
    this.services,
    this.containsOldGroupVersions,
    this.nextToken,
  });
  static GetServiceGraphResult fromJson(Map<String, dynamic> json) =>
      GetServiceGraphResult();
}

class GetTimeSeriesServiceStatisticsResult {
  /// The collection of statistics.
  final List<TimeSeriesServiceStatistics> timeSeriesServiceStatistics;

  /// A flag indicating whether or not a group's filter expression has been
  /// consistent, or if a returned aggregation may show statistics from an older
  /// version of the group's filter expression.
  final bool containsOldGroupVersions;

  /// Pagination token. Not used.
  final String nextToken;

  GetTimeSeriesServiceStatisticsResult({
    this.timeSeriesServiceStatistics,
    this.containsOldGroupVersions,
    this.nextToken,
  });
  static GetTimeSeriesServiceStatisticsResult fromJson(
          Map<String, dynamic> json) =>
      GetTimeSeriesServiceStatisticsResult();
}

class GetTraceGraphResult {
  /// The services that have processed one of the specified requests.
  final List<Service> services;

  /// Pagination token. Not used.
  final String nextToken;

  GetTraceGraphResult({
    this.services,
    this.nextToken,
  });
  static GetTraceGraphResult fromJson(Map<String, dynamic> json) =>
      GetTraceGraphResult();
}

class GetTraceSummariesResult {
  /// Trace IDs and metadata for traces that were found in the specified time
  /// frame.
  final List<TraceSummary> traceSummaries;

  /// The start time of this page of results.
  final DateTime approximateTime;

  /// The total number of traces processed, including traces that did not match
  /// the specified filter expression.
  final BigInt tracesProcessedCount;

  /// If the requested time frame contained more than one page of results, you
  /// can use this token to retrieve the next page. The first page contains the
  /// most most recent results, closest to the end of the time frame.
  final String nextToken;

  GetTraceSummariesResult({
    this.traceSummaries,
    this.approximateTime,
    this.tracesProcessedCount,
    this.nextToken,
  });
  static GetTraceSummariesResult fromJson(Map<String, dynamic> json) =>
      GetTraceSummariesResult();
}

class Group {
  /// The unique case-sensitive name of the group.
  final String groupName;

  /// The ARN of the group generated based on the GroupName.
  final String groupArn;

  /// The filter expression defining the parameters to include traces.
  final String filterExpression;

  Group({
    this.groupName,
    this.groupArn,
    this.filterExpression,
  });
  static Group fromJson(Map<String, dynamic> json) => Group();
}

class GroupSummary {
  /// The unique case-sensitive name of the group.
  final String groupName;

  /// The ARN of the group generated based on the GroupName.
  final String groupArn;

  /// The filter expression defining the parameters to include traces.
  final String filterExpression;

  GroupSummary({
    this.groupName,
    this.groupArn,
    this.filterExpression,
  });
  static GroupSummary fromJson(Map<String, dynamic> json) => GroupSummary();
}

class HistogramEntry {
  /// The value of the entry.
  final double value;

  /// The prevalence of the entry.
  final int count;

  HistogramEntry({
    this.value,
    this.count,
  });
  static HistogramEntry fromJson(Map<String, dynamic> json) => HistogramEntry();
}

class Http {
  /// The request URL.
  final String httpUrl;

  /// The response status.
  final int httpStatus;

  /// The request method.
  final String httpMethod;

  /// The request's user agent string.
  final String userAgent;

  /// The IP address of the requestor.
  final String clientIp;

  Http({
    this.httpUrl,
    this.httpStatus,
    this.httpMethod,
    this.userAgent,
    this.clientIp,
  });
  static Http fromJson(Map<String, dynamic> json) => Http();
}

class InstanceIdDetail {
  /// The ID of a corresponding EC2 instance.
  final String id;

  InstanceIdDetail({
    this.id,
  });
  static InstanceIdDetail fromJson(Map<String, dynamic> json) =>
      InstanceIdDetail();
}

class PutEncryptionConfigResult {
  /// The new encryption configuration.
  final EncryptionConfig encryptionConfig;

  PutEncryptionConfigResult({
    this.encryptionConfig,
  });
  static PutEncryptionConfigResult fromJson(Map<String, dynamic> json) =>
      PutEncryptionConfigResult();
}

class PutTelemetryRecordsResult {
  PutTelemetryRecordsResult();
  static PutTelemetryRecordsResult fromJson(Map<String, dynamic> json) =>
      PutTelemetryRecordsResult();
}

class PutTraceSegmentsResult {
  /// Segments that failed processing.
  final List<UnprocessedTraceSegment> unprocessedTraceSegments;

  PutTraceSegmentsResult({
    this.unprocessedTraceSegments,
  });
  static PutTraceSegmentsResult fromJson(Map<String, dynamic> json) =>
      PutTraceSegmentsResult();
}

class ResourceArnDetail {
  /// The ARN of a corresponding resource.
  final String arn;

  ResourceArnDetail({
    this.arn,
  });
  static ResourceArnDetail fromJson(Map<String, dynamic> json) =>
      ResourceArnDetail();
}

class ResponseTimeRootCause {
  /// A list of corresponding services. A service identifies a segment and
  /// contains a name, account ID, type, and inferred flag.
  final List<ResponseTimeRootCauseService> services;

  ResponseTimeRootCause({
    this.services,
  });
  static ResponseTimeRootCause fromJson(Map<String, dynamic> json) =>
      ResponseTimeRootCause();
}

class ResponseTimeRootCauseEntity {
  /// The name of the entity.
  final String name;

  /// The types and messages of the exceptions.
  final double coverage;

  /// A flag that denotes a remote subsegment.
  final bool remote;

  ResponseTimeRootCauseEntity({
    this.name,
    this.coverage,
    this.remote,
  });
  static ResponseTimeRootCauseEntity fromJson(Map<String, dynamic> json) =>
      ResponseTimeRootCauseEntity();
}

class ResponseTimeRootCauseService {
  /// The service name.
  final String name;

  /// A collection of associated service names.
  final List<String> names;

  /// The type associated to the service.
  final String type;

  /// The account ID associated to the service.
  final String accountId;

  /// The path of root cause entities found on the service.
  final List<ResponseTimeRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool inferred;

  ResponseTimeRootCauseService({
    this.name,
    this.names,
    this.type,
    this.accountId,
    this.entityPath,
    this.inferred,
  });
  static ResponseTimeRootCauseService fromJson(Map<String, dynamic> json) =>
      ResponseTimeRootCauseService();
}

class RootCauseException {
  /// The name of the exception.
  final String name;

  /// The message of the exception.
  final String message;

  RootCauseException({
    this.name,
    this.message,
  });
  static RootCauseException fromJson(Map<String, dynamic> json) =>
      RootCauseException();
}

class SamplingRule {
  /// The name of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  final String ruleName;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  final String ruleArn;

  /// Matches the ARN of the AWS resource on which the service runs.
  final String resourceArn;

  /// The priority of the sampling rule.
  final int priority;

  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double fixedRate;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services,
  /// but applies to all services using the rule collectively.
  final int reservoirSize;

  /// Matches the `name` that the service uses to identify itself in segments.
  final String serviceName;

  /// Matches the `origin` that the service uses to identify its type in
  /// segments.
  final String serviceType;

  /// Matches the hostname from a request URL.
  final String host;

  /// Matches the HTTP method of a request.
  final String httpMethod;

  /// Matches the path from a request URL.
  final String urlPath;

  /// The version of the sampling rule format (`1`).
  final int version;

  /// Matches attributes derived from the request.
  final Map<String, String> attributes;

  SamplingRule({
    this.ruleName,
    this.ruleArn,
    @required this.resourceArn,
    @required this.priority,
    @required this.fixedRate,
    @required this.reservoirSize,
    @required this.serviceName,
    @required this.serviceType,
    @required this.host,
    @required this.httpMethod,
    @required this.urlPath,
    @required this.version,
    this.attributes,
  });
  static SamplingRule fromJson(Map<String, dynamic> json) => SamplingRule();
}

class SamplingRuleRecord {
  /// The sampling rule.
  final SamplingRule samplingRule;

  /// When the rule was created.
  final DateTime createdAt;

  /// When the rule was last modified.
  final DateTime modifiedAt;

  SamplingRuleRecord({
    this.samplingRule,
    this.createdAt,
    this.modifiedAt,
  });
  static SamplingRuleRecord fromJson(Map<String, dynamic> json) =>
      SamplingRuleRecord();
}

class SamplingRuleUpdate {
  /// The name of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  final String ruleName;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  final String ruleArn;

  /// Matches the ARN of the AWS resource on which the service runs.
  final String resourceArn;

  /// The priority of the sampling rule.
  final int priority;

  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double fixedRate;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services,
  /// but applies to all services using the rule collectively.
  final int reservoirSize;

  /// Matches the hostname from a request URL.
  final String host;

  /// Matches the `name` that the service uses to identify itself in segments.
  final String serviceName;

  /// Matches the `origin` that the service uses to identify its type in
  /// segments.
  final String serviceType;

  /// Matches the HTTP method of a request.
  final String httpMethod;

  /// Matches the path from a request URL.
  final String urlPath;

  /// Matches attributes derived from the request.
  final Map<String, String> attributes;

  SamplingRuleUpdate({
    this.ruleName,
    this.ruleArn,
    this.resourceArn,
    this.priority,
    this.fixedRate,
    this.reservoirSize,
    this.host,
    this.serviceName,
    this.serviceType,
    this.httpMethod,
    this.urlPath,
    this.attributes,
  });
}

class SamplingStatisticSummary {
  /// The name of the sampling rule.
  final String ruleName;

  /// The start time of the reporting window.
  final DateTime timestamp;

  /// The number of requests that matched the rule.
  final int requestCount;

  /// The number of requests recorded with borrowed reservoir quota.
  final int borrowCount;

  /// The number of requests recorded.
  final int sampledCount;

  SamplingStatisticSummary({
    this.ruleName,
    this.timestamp,
    this.requestCount,
    this.borrowCount,
    this.sampledCount,
  });
  static SamplingStatisticSummary fromJson(Map<String, dynamic> json) =>
      SamplingStatisticSummary();
}

class SamplingStatisticsDocument {
  /// The name of the sampling rule.
  final String ruleName;

  /// A unique identifier for the service in hexadecimal.
  final String clientID;

  /// The current time.
  final DateTime timestamp;

  /// The number of requests that matched the rule.
  final int requestCount;

  /// The number of requests recorded.
  final int sampledCount;

  /// The number of requests recorded with borrowed reservoir quota.
  final int borrowCount;

  SamplingStatisticsDocument({
    @required this.ruleName,
    @required this.clientID,
    @required this.timestamp,
    @required this.requestCount,
    @required this.sampledCount,
    this.borrowCount,
  });
}

class SamplingStrategy {
  /// The name of a sampling rule.
  final String name;

  /// The value of a sampling rule.
  final double value;

  SamplingStrategy({
    this.name,
    this.value,
  });
}

class SamplingTargetDocument {
  /// The name of the sampling rule.
  final String ruleName;

  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double fixedRate;

  /// The number of requests per second that X-Ray allocated this service.
  final int reservoirQuota;

  /// When the reservoir quota expires.
  final DateTime reservoirQuotaTtl;

  /// The number of seconds for the service to wait before getting sampling
  /// targets again.
  final int interval;

  SamplingTargetDocument({
    this.ruleName,
    this.fixedRate,
    this.reservoirQuota,
    this.reservoirQuotaTtl,
    this.interval,
  });
  static SamplingTargetDocument fromJson(Map<String, dynamic> json) =>
      SamplingTargetDocument();
}

class Segment {
  /// The segment's ID.
  final String id;

  /// The segment document.
  final String document;

  Segment({
    this.id,
    this.document,
  });
  static Segment fromJson(Map<String, dynamic> json) => Segment();
}

class Service {
  /// Identifier for the service. Unique within the service map.
  final int referenceId;

  /// The canonical name of the service.
  final String name;

  /// A list of names for the service, including the canonical name.
  final List<String> names;

  /// Indicates that the service was the first service to process a request.
  final bool root;

  /// Identifier of the AWS account in which the service runs.
  final String accountId;

  /// The type of service.
  ///
  /// *   AWS Resource - The type of an AWS resource. For example,
  /// `AWS::EC2::Instance` for a application running on Amazon EC2 or
  /// `AWS::DynamoDB::Table` for an Amazon DynamoDB table that the application
  /// used.
  ///
  /// *   AWS Service - The type of an AWS service. For example, `AWS::DynamoDB`
  /// for downstream calls to Amazon DynamoDB that didn't target a specific
  /// table.
  ///
  /// *    `client` \- Represents the clients that sent requests to a root
  /// service.
  ///
  /// *    `remote` \- A downstream service of indeterminate type.
  final String type;

  /// The service's state.
  final String state;

  /// The start time of the first segment that the service generated.
  final DateTime startTime;

  /// The end time of the last segment that the service generated.
  final DateTime endTime;

  /// Connections to downstream services.
  final List<Edge> edges;

  /// Aggregated statistics for the service.
  final ServiceStatistics summaryStatistics;

  /// A histogram that maps the spread of service durations.
  final List<HistogramEntry> durationHistogram;

  /// A histogram that maps the spread of service response times.
  final List<HistogramEntry> responseTimeHistogram;

  Service({
    this.referenceId,
    this.name,
    this.names,
    this.root,
    this.accountId,
    this.type,
    this.state,
    this.startTime,
    this.endTime,
    this.edges,
    this.summaryStatistics,
    this.durationHistogram,
    this.responseTimeHistogram,
  });
  static Service fromJson(Map<String, dynamic> json) => Service();
}

class ServiceId {
  final String name;

  final List<String> names;

  final String accountId;

  final String type;

  ServiceId({
    this.name,
    this.names,
    this.accountId,
    this.type,
  });
  static ServiceId fromJson(Map<String, dynamic> json) => ServiceId();
}

class ServiceStatistics {
  /// The number of requests that completed with a 2xx Success status code.
  final BigInt okCount;

  /// Information about requests that failed with a 4xx Client Error status
  /// code.
  final ErrorStatistics errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status
  /// code.
  final FaultStatistics faultStatistics;

  /// The total number of completed requests.
  final BigInt totalCount;

  /// The aggregate response time of completed requests.
  final double totalResponseTime;

  ServiceStatistics({
    this.okCount,
    this.errorStatistics,
    this.faultStatistics,
    this.totalCount,
    this.totalResponseTime,
  });
  static ServiceStatistics fromJson(Map<String, dynamic> json) =>
      ServiceStatistics();
}

class TelemetryRecord {
  final DateTime timestamp;

  final int segmentsReceivedCount;

  final int segmentsSentCount;

  final int segmentsSpilloverCount;

  final int segmentsRejectedCount;

  final BackendConnectionErrors backendConnectionErrors;

  TelemetryRecord({
    @required this.timestamp,
    this.segmentsReceivedCount,
    this.segmentsSentCount,
    this.segmentsSpilloverCount,
    this.segmentsRejectedCount,
    this.backendConnectionErrors,
  });
}

class TimeSeriesServiceStatistics {
  /// Timestamp of the window for which statistics are aggregated.
  final DateTime timestamp;

  final EdgeStatistics edgeSummaryStatistics;

  final ServiceStatistics serviceSummaryStatistics;

  /// The response time histogram for the selected entities.
  final List<HistogramEntry> responseTimeHistogram;

  TimeSeriesServiceStatistics({
    this.timestamp,
    this.edgeSummaryStatistics,
    this.serviceSummaryStatistics,
    this.responseTimeHistogram,
  });
  static TimeSeriesServiceStatistics fromJson(Map<String, dynamic> json) =>
      TimeSeriesServiceStatistics();
}

class Trace {
  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  final String id;

  /// The length of time in seconds between the start time of the root segment
  /// and the end time of the last segment that completed.
  final double duration;

  /// Segment documents for the segments and subsegments that comprise the
  /// trace.
  final List<Segment> segments;

  Trace({
    this.id,
    this.duration,
    this.segments,
  });
  static Trace fromJson(Map<String, dynamic> json) => Trace();
}

class TraceSummary {
  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  final String id;

  /// The length of time in seconds between the start time of the root segment
  /// and the end time of the last segment that completed.
  final double duration;

  /// The length of time in seconds between the start and end times of the root
  /// segment. If the service performs work asynchronously, the response time
  /// measures the time before the response is sent to the user, while the
  /// duration measures the amount of time before the last traced activity
  /// completes.
  final double responseTime;

  /// One or more of the segment documents has a 500 series error.
  final bool hasFault;

  /// One or more of the segment documents has a 400 series error.
  final bool hasError;

  /// One or more of the segment documents has a 429 throttling error.
  final bool hasThrottle;

  /// One or more of the segment documents is in progress.
  final bool isPartial;

  /// Information about the HTTP request served by the trace.
  final Http http;

  /// Annotations from the trace's segment documents.
  final Map<String, List<ValueWithServiceIds>> annotations;

  /// Users from the trace's segment documents.
  final List<TraceUser> users;

  /// Service IDs from the trace's segment documents.
  final List<ServiceId> serviceIds;

  /// A list of resource ARNs for any resource corresponding to the trace
  /// segments.
  final List<ResourceArnDetail> resourceARNs;

  /// A list of EC2 instance IDs for any instance corresponding to the trace
  /// segments.
  final List<InstanceIdDetail> instanceIds;

  /// A list of availability zones for any zone corresponding to the trace
  /// segments.
  final List<AvailabilityZoneDetail> availabilityZones;

  /// The root of a trace.
  final ServiceId entryPoint;

  /// A collection of FaultRootCause structures corresponding to the the trace
  /// segments.
  final List<FaultRootCause> faultRootCauses;

  /// A collection of ErrorRootCause structures corresponding to the trace
  /// segments.
  final List<ErrorRootCause> errorRootCauses;

  /// A collection of ResponseTimeRootCause structures corresponding to the
  /// trace segments.
  final List<ResponseTimeRootCause> responseTimeRootCauses;

  /// The revision number of a trace.
  final int revision;

  /// The matched time stamp of a defined event.
  final DateTime matchedEventTime;

  TraceSummary({
    this.id,
    this.duration,
    this.responseTime,
    this.hasFault,
    this.hasError,
    this.hasThrottle,
    this.isPartial,
    this.http,
    this.annotations,
    this.users,
    this.serviceIds,
    this.resourceARNs,
    this.instanceIds,
    this.availabilityZones,
    this.entryPoint,
    this.faultRootCauses,
    this.errorRootCauses,
    this.responseTimeRootCauses,
    this.revision,
    this.matchedEventTime,
  });
  static TraceSummary fromJson(Map<String, dynamic> json) => TraceSummary();
}

class TraceUser {
  /// The user's name.
  final String userName;

  /// Services that the user's request hit.
  final List<ServiceId> serviceIds;

  TraceUser({
    this.userName,
    this.serviceIds,
  });
  static TraceUser fromJson(Map<String, dynamic> json) => TraceUser();
}

class UnprocessedStatistics {
  /// The name of the sampling rule.
  final String ruleName;

  /// The error code.
  final String errorCode;

  /// The error message.
  final String message;

  UnprocessedStatistics({
    this.ruleName,
    this.errorCode,
    this.message,
  });
  static UnprocessedStatistics fromJson(Map<String, dynamic> json) =>
      UnprocessedStatistics();
}

class UnprocessedTraceSegment {
  /// The segment's ID.
  final String id;

  /// The error that caused processing to fail.
  final String errorCode;

  /// The error message.
  final String message;

  UnprocessedTraceSegment({
    this.id,
    this.errorCode,
    this.message,
  });
  static UnprocessedTraceSegment fromJson(Map<String, dynamic> json) =>
      UnprocessedTraceSegment();
}

class UpdateGroupResult {
  /// The group that was updated. Contains the name of the group that was
  /// updated, the ARN of the group that was updated, and the updated filter
  /// expression assigned to the group.
  final Group group;

  UpdateGroupResult({
    this.group,
  });
  static UpdateGroupResult fromJson(Map<String, dynamic> json) =>
      UpdateGroupResult();
}

class UpdateSamplingRuleResult {
  /// The updated rule definition and metadata.
  final SamplingRuleRecord samplingRuleRecord;

  UpdateSamplingRuleResult({
    this.samplingRuleRecord,
  });
  static UpdateSamplingRuleResult fromJson(Map<String, dynamic> json) =>
      UpdateSamplingRuleResult();
}

class ValueWithServiceIds {
  /// Values of the annotation.
  final AnnotationValue annotationValue;

  /// Services to which the annotation applies.
  final List<ServiceId> serviceIds;

  ValueWithServiceIds({
    this.annotationValue,
    this.serviceIds,
  });
  static ValueWithServiceIds fromJson(Map<String, dynamic> json) =>
      ValueWithServiceIds();
}
