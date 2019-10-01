import 'package:meta/meta.dart';

///  Service Quotas is a web service that you can use to manage many of your AWS
/// service quotas. Quotas, also referred to as limits, are the maximum values
/// for a resource, item, or operation. This guide provide descriptions of the
/// Service Quotas actions that you can call from an API. For the Service Quotas
/// user guide, which explains how to use Service Quotas from the console, see
/// [What is Service
/// Quotas](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html).
///
///
///
/// AWS provides SDKs that consist of libraries and sample code for programming
/// languages and platforms (Java, Ruby, .NET, iOS, Android, etc...,). The SDKs
/// provide a convenient way to create programmatic access to Service Quotas and
/// AWS. For information about the AWS SDKs, including how to download and
/// install them, see the [Tools for Amazon Web
/// Services](https://docs.aws.amazon.com/aws.amazon.com/tools) page.
class ServiceQuotasApi {
  /// Associates the Service Quotas template with your organization so that when
  /// new accounts are created in your organization, the template submits
  /// increase requests for the specified service quotas. Use the Service Quotas
  /// template to request an increase for any adjustable quota value. After you
  /// define the Service Quotas template, use this operation to associate, or
  /// enable, the template.
  Future<AssociateServiceQuotaTemplateResponse>
      associateServiceQuotaTemplate() async {
    return AssociateServiceQuotaTemplateResponse.fromJson({});
  }

  /// Removes a service quota increase request from the Service Quotas template.
  ///
  /// [serviceCode]: Specifies the code for the service that you want to delete.
  ///
  /// [quotaCode]: Specifies the code for the quota that you want to delete.
  ///
  /// [awsRegion]: Specifies the AWS Region for the quota that you want to
  /// delete.
  Future<DeleteServiceQuotaIncreaseRequestFromTemplateResponse>
      deleteServiceQuotaIncreaseRequestFromTemplate(
          {@required String serviceCode,
          @required String quotaCode,
          @required String awsRegion}) async {
    return DeleteServiceQuotaIncreaseRequestFromTemplateResponse.fromJson({});
  }

  /// Disables the Service Quotas template. Once the template is disabled, it
  /// does not request quota increases for new accounts in your organization.
  /// Disabling the quota template does not apply the quota increase requests
  /// from the template.
  ///
  ///  **Related operations**
  ///
  /// *   To enable the quota template, call AssociateServiceQuotaTemplate.
  ///
  /// *   To delete a specific service quota from the template, use
  /// DeleteServiceQuotaIncreaseRequestFromTemplate.
  Future<DisassociateServiceQuotaTemplateResponse>
      disassociateServiceQuotaTemplate() async {
    return DisassociateServiceQuotaTemplateResponse.fromJson({});
  }

  /// Retrieves the default service quotas values. The Value returned for each
  /// quota is the AWS default value, even if the quotas have been increased..
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Identifies the service quota you want to select.
  Future<GetAwsDefaultServiceQuotaResponse> getAwsDefaultServiceQuota(
      {@required String serviceCode, @required String quotaCode}) async {
    return GetAwsDefaultServiceQuotaResponse.fromJson({});
  }

  /// Retrieves the `ServiceQuotaTemplateAssociationStatus` value from the
  /// service. Use this action to determine if the Service Quota template is
  /// associated, or enabled.
  Future<GetAssociationForServiceQuotaTemplateResponse>
      getAssociationForServiceQuotaTemplate() async {
    return GetAssociationForServiceQuotaTemplateResponse.fromJson({});
  }

  /// Retrieves the details for a particular increase request.
  ///
  /// [requestId]: Identifies the quota increase request.
  Future<GetRequestedServiceQuotaChangeResponse> getRequestedServiceQuotaChange(
      String requestId) async {
    return GetRequestedServiceQuotaChangeResponse.fromJson({});
  }

  /// Returns the details for the specified service quota. This operation
  /// provides a different Value than the `GetAWSDefaultServiceQuota` operation.
  /// This operation returns the applied value for each quota.
  /// `GetAWSDefaultServiceQuota` returns the default AWS value for each quota.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Identifies the service quota you want to select.
  Future<GetServiceQuotaResponse> getServiceQuota(
      {@required String serviceCode, @required String quotaCode}) async {
    return GetServiceQuotaResponse.fromJson({});
  }

  /// Returns the details of the service quota increase request in your
  /// template.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Specifies the quota you want.
  ///
  /// [awsRegion]: Specifies the AWS Region for the quota that you want to use.
  Future<GetServiceQuotaIncreaseRequestFromTemplateResponse>
      getServiceQuotaIncreaseRequestFromTemplate(
          {@required String serviceCode,
          @required String quotaCode,
          @required String awsRegion}) async {
    return GetServiceQuotaIncreaseRequestFromTemplateResponse.fromJson({});
  }

  /// Lists all default service quotas for the specified AWS service or all AWS
  /// services. ListAWSDefaultServiceQuotas is similar to ListServiceQuotas
  /// except for the Value object. The Value object returned by
  /// `ListAWSDefaultServiceQuotas` is the default value assigned by AWS. This
  /// request returns a list of all service quotas for the specified service.
  /// The listing of each you'll see the default values are the values that AWS
  /// provides for the quotas.
  ///
  ///
  ///
  /// Always check the `NextToken` response parameter when calling any of the
  /// `List*` operations. These operations can return an unexpected list of
  /// results, even when there are more results available. When this happens,
  /// the `NextToken` response parameter contains a value to pass the next call
  /// to the same API to request the next part of the list.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from. If additional items exist beyond the specified maximum, the
  /// `NextToken` element is present and has a value (isn't null). Include that
  /// value as the `NextToken` request parameter in the call to the operation to
  /// get the next part of the results. You should check `NextToken` after every
  /// operation to ensure that you receive all of the results.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListAwsDefaultServiceQuotasResponse> listAwsDefaultServiceQuotas(
      String serviceCode,
      {String nextToken,
      int maxResults}) async {
    return ListAwsDefaultServiceQuotasResponse.fromJson({});
  }

  /// Requests a list of the changes to quotas for a service.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [status]: Specifies the status value of the quota increase request.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListRequestedServiceQuotaChangeHistoryResponse>
      listRequestedServiceQuotaChangeHistory(
          {String serviceCode,
          String status,
          String nextToken,
          int maxResults}) async {
    return ListRequestedServiceQuotaChangeHistoryResponse.fromJson({});
  }

  /// Requests a list of the changes to specific service quotas. This command
  /// provides additional granularity over the
  /// `ListRequestedServiceQuotaChangeHistory` command. Once a quota change
  /// request has reached `CASE_CLOSED, APPROVED,` or `DENIED`, the history has
  /// been kept for 90 days.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Specifies the service quota that you want to use
  ///
  /// [status]: Specifies the status value of the quota increase request.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListRequestedServiceQuotaChangeHistoryByQuotaResponse>
      listRequestedServiceQuotaChangeHistoryByQuota(
          {@required String serviceCode,
          @required String quotaCode,
          String status,
          String nextToken,
          int maxResults}) async {
    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson({});
  }

  /// Returns a list of the quota increase requests in the template.
  ///
  /// [serviceCode]: The identifier for a service. When performing an operation,
  /// use the `ServiceCode` to specify a particular service.
  ///
  /// [awsRegion]: Specifies the AWS Region for the quota that you want to use.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListServiceQuotaIncreaseRequestsInTemplateResponse>
      listServiceQuotaIncreaseRequestsInTemplate(
          {String serviceCode,
          String awsRegion,
          String nextToken,
          int maxResults}) async {
    return ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson({});
  }

  /// Lists all service quotas for the specified AWS service. This request
  /// returns a list of the service quotas for the specified service. you'll see
  /// the default values are the values that AWS provides for the quotas.
  ///
  ///
  ///
  /// Always check the `NextToken` response parameter when calling any of the
  /// `List*` operations. These operations can return an unexpected list of
  /// results, even when there are more results available. When this happens,
  /// the `NextToken` response parameter contains a value to pass the next call
  /// to the same API to request the next part of the list.
  ///
  /// [serviceCode]: The identifier for a service. When performing an operation,
  /// use the `ServiceCode` to specify a particular service.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListServiceQuotasResponse> listServiceQuotas(String serviceCode,
      {String nextToken, int maxResults}) async {
    return ListServiceQuotasResponse.fromJson({});
  }

  /// Lists the AWS services available in Service Quotas. Not all AWS services
  /// are available in Service Quotas. To list the see the list of the service
  /// quotas for a specific service, use ListServiceQuotas.
  ///
  /// [nextToken]: (Optional) Use this parameter in a request if you receive a
  /// `NextToken` response in a previous request that indicates that there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call's `NextToken` response to indicate where the output should
  /// continue from.
  ///
  /// [maxResults]: (Optional) Limits the number of results that you want to
  /// include in the response. If you don't include this parameter, the response
  /// defaults to a value that's specific to the operation. If additional items
  /// exist beyond the specified maximum, the `NextToken` element is present and
  /// has a value (isn't null). Include that value as the `NextToken` request
  /// parameter in the call to the operation to get the next part of the
  /// results. You should check `NextToken` after every operation to ensure that
  /// you receive all of the results.
  Future<ListServicesResponse> listServices(
      {String nextToken, int maxResults}) async {
    return ListServicesResponse.fromJson({});
  }

  /// Defines and adds a quota to the service quota template. To add a quota to
  /// the template, you must provide the `ServiceCode`, `QuotaCode`,
  /// `AwsRegion`, and `DesiredValue`. Once you add a quota to the template, use
  /// ListServiceQuotaIncreaseRequestsInTemplate to see the list of quotas in
  /// the template.
  ///
  /// [quotaCode]: Specifies the service quota that you want to use.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [awsRegion]: Specifies the AWS Region for the quota.
  ///
  /// [desiredValue]: Specifies the new, increased value for the quota.
  Future<PutServiceQuotaIncreaseRequestIntoTemplateResponse>
      putServiceQuotaIncreaseRequestIntoTemplate(
          {@required String quotaCode,
          @required String serviceCode,
          @required String awsRegion,
          @required double desiredValue}) async {
    return PutServiceQuotaIncreaseRequestIntoTemplateResponse.fromJson({});
  }

  /// Retrieves the details of a service quota increase request. The response to
  /// this command provides the details in the RequestedServiceQuotaChange
  /// object.
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Specifies the service quota that you want to use.
  ///
  /// [desiredValue]: Specifies the value submitted in the service quota
  /// increase request.
  Future<RequestServiceQuotaIncreaseResponse> requestServiceQuotaIncrease(
      {@required String serviceCode,
      @required String quotaCode,
      @required double desiredValue}) async {
    return RequestServiceQuotaIncreaseResponse.fromJson({});
  }
}

class AssociateServiceQuotaTemplateResponse {
  AssociateServiceQuotaTemplateResponse();
  static AssociateServiceQuotaTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      AssociateServiceQuotaTemplateResponse();
}

class DeleteServiceQuotaIncreaseRequestFromTemplateResponse {
  DeleteServiceQuotaIncreaseRequestFromTemplateResponse();
  static DeleteServiceQuotaIncreaseRequestFromTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteServiceQuotaIncreaseRequestFromTemplateResponse();
}

class DisassociateServiceQuotaTemplateResponse {
  DisassociateServiceQuotaTemplateResponse();
  static DisassociateServiceQuotaTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      DisassociateServiceQuotaTemplateResponse();
}

class ErrorReason {
  /// Service Quotas returns the following error values.
  ///
  ///  `DEPENDENCY\_ACCESS\_DENIED_ERROR` is returned when the caller does not
  /// have permission to call the service or service quota. To resolve the
  /// error, you need permission to access the service or service quota.
  ///
  ///  `DEPENDENCY\_THROTTLING\_ERROR` is returned when the service being called
  /// is throttling Service Quotas.
  ///
  ///  `DEPENDENCY\_SERVICE\_ERROR` is returned when the service being called
  /// has availability issues.
  ///
  ///  `SERVICE\_QUOTA\_NOT\_AVAILABLE\_ERROR` is returned when there was an
  /// error in Service Quotas.
  final String errorCode;

  /// The error message that provides more detail.
  final String errorMessage;

  ErrorReason({
    this.errorCode,
    this.errorMessage,
  });
  static ErrorReason fromJson(Map<String, dynamic> json) => ErrorReason();
}

class GetAwsDefaultServiceQuotaResponse {
  /// Returns the ServiceQuota object which contains all values for a quota.
  final ServiceQuota quota;

  GetAwsDefaultServiceQuotaResponse({
    this.quota,
  });
  static GetAwsDefaultServiceQuotaResponse fromJson(
          Map<String, dynamic> json) =>
      GetAwsDefaultServiceQuotaResponse();
}

class GetAssociationForServiceQuotaTemplateResponse {
  /// Specifies whether the template is `ASSOCIATED` or `DISASSOCIATED`. If the
  /// template is `ASSOCIATED`, then it requests service quota increases for all
  /// new accounts created in your organization.
  final String serviceQuotaTemplateAssociationStatus;

  GetAssociationForServiceQuotaTemplateResponse({
    this.serviceQuotaTemplateAssociationStatus,
  });
  static GetAssociationForServiceQuotaTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      GetAssociationForServiceQuotaTemplateResponse();
}

class GetRequestedServiceQuotaChangeResponse {
  /// Returns the `RequestedServiceQuotaChange` object for the specific increase
  /// request.
  final RequestedServiceQuotaChange requestedQuota;

  GetRequestedServiceQuotaChangeResponse({
    this.requestedQuota,
  });
  static GetRequestedServiceQuotaChangeResponse fromJson(
          Map<String, dynamic> json) =>
      GetRequestedServiceQuotaChangeResponse();
}

class GetServiceQuotaIncreaseRequestFromTemplateResponse {
  /// This object contains the details about the quota increase request.
  final ServiceQuotaIncreaseRequestInTemplate
      serviceQuotaIncreaseRequestInTemplate;

  GetServiceQuotaIncreaseRequestFromTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });
  static GetServiceQuotaIncreaseRequestFromTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      GetServiceQuotaIncreaseRequestFromTemplateResponse();
}

class GetServiceQuotaResponse {
  /// Returns the ServiceQuota object which contains all values for a quota.
  final ServiceQuota quota;

  GetServiceQuotaResponse({
    this.quota,
  });
  static GetServiceQuotaResponse fromJson(Map<String, dynamic> json) =>
      GetServiceQuotaResponse();
}

class ListAwsDefaultServiceQuotasResponse {
  /// (Optional) Use this parameter in a request if you receive a `NextToken`
  /// response in a previous request that indicates that there's more output
  /// available. In a subsequent call, set it to the value of the previous
  /// call's `NextToken` response to indicate where the output should continue
  /// from.
  final String nextToken;

  /// A list of the quotas in the account with the AWS default values.
  final List<ServiceQuota> quotas;

  ListAwsDefaultServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });
  static ListAwsDefaultServiceQuotasResponse fromJson(
          Map<String, dynamic> json) =>
      ListAwsDefaultServiceQuotasResponse();
}

class ListRequestedServiceQuotaChangeHistoryByQuotaResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  /// Returns a list of service quota requests.
  final List<RequestedServiceQuotaChange> requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryByQuotaResponse({
    this.nextToken,
    this.requestedQuotas,
  });
  static ListRequestedServiceQuotaChangeHistoryByQuotaResponse fromJson(
          Map<String, dynamic> json) =>
      ListRequestedServiceQuotaChangeHistoryByQuotaResponse();
}

class ListRequestedServiceQuotaChangeHistoryResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  /// Returns a list of service quota requests.
  final List<RequestedServiceQuotaChange> requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryResponse({
    this.nextToken,
    this.requestedQuotas,
  });
  static ListRequestedServiceQuotaChangeHistoryResponse fromJson(
          Map<String, dynamic> json) =>
      ListRequestedServiceQuotaChangeHistoryResponse();
}

class ListServiceQuotaIncreaseRequestsInTemplateResponse {
  /// Returns the list of values of the quota increase request in the template.
  final List<ServiceQuotaIncreaseRequestInTemplate>
      serviceQuotaIncreaseRequestInTemplateList;

  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  ListServiceQuotaIncreaseRequestsInTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplateList,
    this.nextToken,
  });
  static ListServiceQuotaIncreaseRequestsInTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      ListServiceQuotaIncreaseRequestsInTemplateResponse();
}

class ListServiceQuotasResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  /// The response information for a quota lists all attribute information for
  /// the quota.
  final List<ServiceQuota> quotas;

  ListServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });
  static ListServiceQuotasResponse fromJson(Map<String, dynamic> json) =>
      ListServiceQuotasResponse();
}

class ListServicesResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask for
  /// a filtered view of a very long list. Use this value in the `NextToken`
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this
  /// until the `NextToken` response element comes back empty (as `null`).
  final String nextToken;

  /// Returns a list of services.
  final List<ServiceInfo> services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });
  static ListServicesResponse fromJson(Map<String, dynamic> json) =>
      ListServicesResponse();
}

class MetricInfo {
  /// The namespace of the metric. The namespace is a container for CloudWatch
  /// metrics. You can specify a name for the namespace when you create a
  /// metric.
  final String metricNamespace;

  /// The name of the CloudWatch metric that measures usage of a service quota.
  /// This is a required field.
  final String metricName;

  /// A dimension is a name/value pair that is part of the identity of a metric.
  /// Every metric has specific characteristics that describe it, and you can
  /// think of dimensions as categories for those characteristics. These
  /// dimensions are part of the CloudWatch Metric Identity that measures usage
  /// against a particular service quota.
  final Map<String, String> metricDimensions;

  /// Statistics are metric data aggregations over specified periods of time.
  /// This is the recommended statistic to use when comparing usage in the
  /// CloudWatch Metric against your Service Quota.
  final String metricStatisticRecommendation;

  MetricInfo({
    this.metricNamespace,
    this.metricName,
    this.metricDimensions,
    this.metricStatisticRecommendation,
  });
  static MetricInfo fromJson(Map<String, dynamic> json) => MetricInfo();
}

class PutServiceQuotaIncreaseRequestIntoTemplateResponse {
  /// A structure that contains information about one service quota increase
  /// request.
  final ServiceQuotaIncreaseRequestInTemplate
      serviceQuotaIncreaseRequestInTemplate;

  PutServiceQuotaIncreaseRequestIntoTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });
  static PutServiceQuotaIncreaseRequestIntoTemplateResponse fromJson(
          Map<String, dynamic> json) =>
      PutServiceQuotaIncreaseRequestIntoTemplateResponse();
}

class QuotaPeriod {
  /// The value of a period.
  final int periodValue;

  /// The time unit of a period.
  final String periodUnit;

  QuotaPeriod({
    this.periodValue,
    this.periodUnit,
  });
  static QuotaPeriod fromJson(Map<String, dynamic> json) => QuotaPeriod();
}

class RequestServiceQuotaIncreaseResponse {
  /// Returns a list of service quota requests.
  final RequestedServiceQuotaChange requestedQuota;

  RequestServiceQuotaIncreaseResponse({
    this.requestedQuota,
  });
  static RequestServiceQuotaIncreaseResponse fromJson(
          Map<String, dynamic> json) =>
      RequestServiceQuotaIncreaseResponse();
}

class RequestedServiceQuotaChange {
  /// The unique identifier of a requested service quota change.
  final String id;

  /// The case Id for the service quota increase request.
  final String caseId;

  /// Specifies the service that you want to use.
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  final String serviceName;

  /// Specifies the service quota that you want to use.
  final String quotaCode;

  /// Name of the service quota.
  final String quotaName;

  /// New increased value for the service quota.
  final double desiredValue;

  /// State of the service quota increase request.
  final String status;

  /// The date and time when the service quota increase request was received and
  /// the case Id was created.
  final DateTime created;

  /// The date and time of the most recent change in the service quota increase
  /// request.
  final DateTime lastUpdated;

  /// The IAM identity who submitted the service quota increase request.
  final String requester;

  /// The Amazon Resource Name (ARN) of the service quota.
  final String quotaArn;

  /// Identifies if the quota is global.
  final bool globalQuota;

  /// Specifies the unit used for the quota.
  final String unit;

  RequestedServiceQuotaChange({
    this.id,
    this.caseId,
    this.serviceCode,
    this.serviceName,
    this.quotaCode,
    this.quotaName,
    this.desiredValue,
    this.status,
    this.created,
    this.lastUpdated,
    this.requester,
    this.quotaArn,
    this.globalQuota,
    this.unit,
  });
  static RequestedServiceQuotaChange fromJson(Map<String, dynamic> json) =>
      RequestedServiceQuotaChange();
}

class ServiceInfo {
  /// Specifies the service that you want to use.
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  final String serviceName;

  ServiceInfo({
    this.serviceCode,
    this.serviceName,
  });
  static ServiceInfo fromJson(Map<String, dynamic> json) => ServiceInfo();
}

class ServiceQuota {
  /// Specifies the service that you want to use.
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  final String serviceName;

  /// The Amazon Resource Name (ARN) of the service quota.
  final String quotaArn;

  /// The code identifier for the service quota specified.
  final String quotaCode;

  /// The name identifier of the service quota.
  final String quotaName;

  /// The value of service quota.
  final double value;

  /// The unit of measurement for the value of the service quota.
  final String unit;

  /// Specifies if the quota value can be increased.
  final bool adjustable;

  /// Specifies if the quota is global.
  final bool globalQuota;

  /// Specifies the details about the measurement.
  final MetricInfo usageMetric;

  /// Identifies the unit and value of how time is measured.
  final QuotaPeriod period;

  /// Specifies the `ErrorCode` and `ErrorMessage` when success isn't achieved.
  final ErrorReason errorReason;

  ServiceQuota({
    this.serviceCode,
    this.serviceName,
    this.quotaArn,
    this.quotaCode,
    this.quotaName,
    this.value,
    this.unit,
    this.adjustable,
    this.globalQuota,
    this.usageMetric,
    this.period,
    this.errorReason,
  });
  static ServiceQuota fromJson(Map<String, dynamic> json) => ServiceQuota();
}

class ServiceQuotaIncreaseRequestInTemplate {
  /// The code identifier for the AWS service specified in the increase request.
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  final String serviceName;

  /// The code identifier for the service quota specified in the increase
  /// request.
  final String quotaCode;

  /// The name of the service quota in the increase request.
  final String quotaName;

  /// Identifies the new, increased value of the service quota in the increase
  /// request.
  final double desiredValue;

  /// The AWS Region where the increase request occurs.
  final String awsRegion;

  /// The unit of measure for the increase request.
  final String unit;

  /// Specifies if the quota is a global quota.
  final bool globalQuota;

  ServiceQuotaIncreaseRequestInTemplate({
    this.serviceCode,
    this.serviceName,
    this.quotaCode,
    this.quotaName,
    this.desiredValue,
    this.awsRegion,
    this.unit,
    this.globalQuota,
  });
  static ServiceQuotaIncreaseRequestInTemplate fromJson(
          Map<String, dynamic> json) =>
      ServiceQuotaIncreaseRequestInTemplate();
}
