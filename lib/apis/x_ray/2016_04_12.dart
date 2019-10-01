import 'package:meta/meta.dart';

/// AWS X-Ray provides APIs for managing debug traces and retrieving service
/// maps and other data created by processing those traces.
class XRayApi {
  /// Retrieves a list of traces specified by ID. Each trace is a collection of
  /// segment documents that originates from a single request. Use
  /// `GetTraceSummaries` to get a list of trace IDs.
  Future<void> batchGetTraces(List<String> traceIds,
      {String nextToken}) async {}

  /// Creates a group resource with a name and a filter expression.
  Future<void> createGroup(String groupName, {String filterExpression}) async {}

  /// Creates a rule to control sampling behavior for instrumented applications.
  /// Services retrieve rules with GetSamplingRules, and evaluate each rule in
  /// ascending order of _priority_ for each request. If a rule matches, the
  /// service records a trace, borrowing it from the reservoir size. After 10
  /// seconds, the service reports back to X-Ray with GetSamplingTargets to get
  /// updated versions of each in-use rule. The updated rule contains a trace
  /// quota that the service can use instead of borrowing from the reservoir.
  Future<void> createSamplingRule(SamplingRule samplingRule) async {}

  /// Deletes a group resource.
  Future<void> deleteGroup({String groupName, String groupArn}) async {}

  /// Deletes a sampling rule.
  Future<void> deleteSamplingRule({String ruleName, String ruleArn}) async {}

  /// Retrieves the current encryption configuration for X-Ray data.
  Future<void> getEncryptionConfig() async {}

  /// Retrieves group resource details.
  Future<void> getGroup({String groupName, String groupArn}) async {}

  /// Retrieves all active group details.
  Future<void> getGroups({String nextToken}) async {}

  /// Retrieves all sampling rules.
  Future<void> getSamplingRules({String nextToken}) async {}

  /// Retrieves information about recent sampling results for all sampling
  /// rules.
  Future<void> getSamplingStatisticSummaries({String nextToken}) async {}

  /// Requests a sampling quota for rules that the service is using to sample
  /// requests.
  Future<void> getSamplingTargets(
      List<SamplingStatisticsDocument> samplingStatisticsDocuments) async {}

  /// Retrieves a document that describes services that process incoming
  /// requests, and downstream services that they call as a result. Root
  /// services process incoming requests and make calls to downstream services.
  /// Root services are applications that use the AWS X-Ray SDK. Downstream
  /// services can be other applications, AWS resources, HTTP web APIs, or SQL
  /// databases.
  Future<void> getServiceGraph(
      {@required DateTime startTime,
      @required DateTime endTime,
      String groupName,
      String groupArn,
      String nextToken}) async {}

  /// Get an aggregation of service statistics defined by a specific time range.
  Future<void> getTimeSeriesServiceStatistics(
      {@required DateTime startTime,
      @required DateTime endTime,
      String groupName,
      String groupArn,
      String entitySelectorExpression,
      int period,
      String nextToken}) async {}

  /// Retrieves a service graph for one or more specific trace IDs.
  Future<void> getTraceGraph(List<String> traceIds, {String nextToken}) async {}

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
  Future<void> getTraceSummaries(
      {@required DateTime startTime,
      @required DateTime endTime,
      String timeRangeType,
      bool sampling,
      SamplingStrategy samplingStrategy,
      String filterExpression,
      String nextToken}) async {}

  /// Updates the encryption configuration for X-Ray data.
  Future<void> putEncryptionConfig(String type, {String keyId}) async {}

  /// Used by the AWS X-Ray daemon to upload telemetry.
  Future<void> putTelemetryRecords(List<TelemetryRecord> telemetryRecords,
      {String ec2InstanceId, String hostname, String resourceArn}) async {}

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
  Future<void> putTraceSegments(List<String> traceSegmentDocuments) async {}

  /// Updates a group resource.
  Future<void> updateGroup(
      {String groupName, String groupArn, String filterExpression}) async {}

  /// Modifies a sampling rule's configuration.
  Future<void> updateSamplingRule(
      SamplingRuleUpdate samplingRuleUpdate) async {}
}

class Alias {}

class AnnotationValue {}

class AvailabilityZoneDetail {}

class BackendConnectionErrors {}

class BatchGetTracesResult {}

class CreateGroupResult {}

class CreateSamplingRuleResult {}

class DeleteGroupResult {}

class DeleteSamplingRuleResult {}

class Edge {}

class EdgeStatistics {}

class EncryptionConfig {}

class ErrorRootCause {}

class ErrorRootCauseEntity {}

class ErrorRootCauseService {}

class ErrorStatistics {}

class FaultRootCause {}

class FaultRootCauseEntity {}

class FaultRootCauseService {}

class FaultStatistics {}

class GetEncryptionConfigResult {}

class GetGroupResult {}

class GetGroupsResult {}

class GetSamplingRulesResult {}

class GetSamplingStatisticSummariesResult {}

class GetSamplingTargetsResult {}

class GetServiceGraphResult {}

class GetTimeSeriesServiceStatisticsResult {}

class GetTraceGraphResult {}

class GetTraceSummariesResult {}

class Group {}

class GroupSummary {}

class HistogramEntry {}

class Http {}

class InstanceIdDetail {}

class PutEncryptionConfigResult {}

class PutTelemetryRecordsResult {}

class PutTraceSegmentsResult {}

class ResourceArnDetail {}

class ResponseTimeRootCause {}

class ResponseTimeRootCauseEntity {}

class ResponseTimeRootCauseService {}

class RootCauseException {}

class SamplingRule {}

class SamplingRuleRecord {}

class SamplingRuleUpdate {}

class SamplingStatisticSummary {}

class SamplingStatisticsDocument {}

class SamplingStrategy {}

class SamplingTargetDocument {}

class Segment {}

class Service {}

class ServiceId {}

class ServiceStatistics {}

class TelemetryRecord {}

class TimeSeriesServiceStatistics {}

class Trace {}

class TraceSummary {}

class TraceUser {}

class UnprocessedStatistics {}

class UnprocessedTraceSegment {}

class UpdateGroupResult {}

class UpdateSamplingRuleResult {}

class ValueWithServiceIds {}
