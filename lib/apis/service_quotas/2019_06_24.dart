import 'package:meta/meta.dart';

///  Service Quotas is a web service that you can use to manage many of your AWS
/// service quotas. Quotas, also referred to as limits, are the maximum values
/// for a resource, item, or operation. This guide provide descriptions of the
/// Service Quotas actions that you can call from an API. For the Service Quotas
/// user guide, which explains how to use Service Quotas from the console, see
/// [What is Service Quotas](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html).
///
///
///
/// AWS provides SDKs that consist of libraries and sample code for programming
/// languages and platforms (Java, Ruby, .NET, iOS, Android, etc...,). The SDKs
/// provide a convenient way to create programmatic access to Service Quotas and
/// AWS. For information about the AWS SDKs, including how to download and
/// install them, see the
/// [Tools for Amazon Web Services](https://docs.aws.amazon.com/aws.amazon.com/tools)
/// page.
class ServiceQuotasApi {
  final _client;
  ServiceQuotasApi(client)
      : _client = client.configured('Service Quotas', serializer: 'json');

  /// Associates the Service Quotas template with your organization so that when
  /// new accounts are created in your organization, the template submits
  /// increase requests for the specified service quotas. Use the Service Quotas
  /// template to request an increase for any adjustable quota value. After you
  /// define the Service Quotas template, use this operation to associate, or
  /// enable, the template.
  Future<AssociateServiceQuotaTemplateResponse>
      associateServiceQuotaTemplate() async {
    var response_ = await _client.send('AssociateServiceQuotaTemplate', {});
    return AssociateServiceQuotaTemplateResponse.fromJson(response_);
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
    var response_ =
        await _client.send('DeleteServiceQuotaIncreaseRequestFromTemplate', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
      'AwsRegion': awsRegion,
    });
    return DeleteServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
        response_);
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
    var response_ = await _client.send('DisassociateServiceQuotaTemplate', {});
    return DisassociateServiceQuotaTemplateResponse.fromJson(response_);
  }

  /// Retrieves the default service quotas values. The Value returned for each
  /// quota is the AWS default value, even if the quotas have been increased..
  ///
  /// [serviceCode]: Specifies the service that you want to use.
  ///
  /// [quotaCode]: Identifies the service quota you want to select.
  Future<GetAwsDefaultServiceQuotaResponse> getAwsDefaultServiceQuota(
      {@required String serviceCode, @required String quotaCode}) async {
    var response_ = await _client.send('GetAWSDefaultServiceQuota', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
    });
    return GetAwsDefaultServiceQuotaResponse.fromJson(response_);
  }

  /// Retrieves the `ServiceQuotaTemplateAssociationStatus` value from the
  /// service. Use this action to determine if the Service Quota template is
  /// associated, or enabled.
  Future<GetAssociationForServiceQuotaTemplateResponse>
      getAssociationForServiceQuotaTemplate() async {
    var response_ =
        await _client.send('GetAssociationForServiceQuotaTemplate', {});
    return GetAssociationForServiceQuotaTemplateResponse.fromJson(response_);
  }

  /// Retrieves the details for a particular increase request.
  ///
  /// [requestId]: Identifies the quota increase request.
  Future<GetRequestedServiceQuotaChangeResponse> getRequestedServiceQuotaChange(
      String requestId) async {
    var response_ = await _client.send('GetRequestedServiceQuotaChange', {
      'RequestId': requestId,
    });
    return GetRequestedServiceQuotaChangeResponse.fromJson(response_);
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
    var response_ = await _client.send('GetServiceQuota', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
    });
    return GetServiceQuotaResponse.fromJson(response_);
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
    var response_ =
        await _client.send('GetServiceQuotaIncreaseRequestFromTemplate', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
      'AwsRegion': awsRegion,
    });
    return GetServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
        response_);
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
    var response_ = await _client.send('ListAWSDefaultServiceQuotas', {
      'ServiceCode': serviceCode,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListAwsDefaultServiceQuotasResponse.fromJson(response_);
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
    var response_ =
        await _client.send('ListRequestedServiceQuotaChangeHistory', {
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (status != null) 'Status': status,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListRequestedServiceQuotaChangeHistoryResponse.fromJson(response_);
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
    var response_ =
        await _client.send('ListRequestedServiceQuotaChangeHistoryByQuota', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
      if (status != null) 'Status': status,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
        response_);
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
    var response_ =
        await _client.send('ListServiceQuotaIncreaseRequestsInTemplate', {
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
        response_);
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
    var response_ = await _client.send('ListServiceQuotas', {
      'ServiceCode': serviceCode,
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListServiceQuotasResponse.fromJson(response_);
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
    var response_ = await _client.send('ListServices', {
      if (nextToken != null) 'NextToken': nextToken,
      if (maxResults != null) 'MaxResults': maxResults,
    });
    return ListServicesResponse.fromJson(response_);
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
    var response_ =
        await _client.send('PutServiceQuotaIncreaseRequestIntoTemplate', {
      'QuotaCode': quotaCode,
      'ServiceCode': serviceCode,
      'AwsRegion': awsRegion,
      'DesiredValue': desiredValue,
    });
    return PutServiceQuotaIncreaseRequestIntoTemplateResponse.fromJson(
        response_);
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
    var response_ = await _client.send('RequestServiceQuotaIncrease', {
      'ServiceCode': serviceCode,
      'QuotaCode': quotaCode,
      'DesiredValue': desiredValue,
    });
    return RequestServiceQuotaIncreaseResponse.fromJson(response_);
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

/// Returns an error that explains why the action did not succeed.
class ErrorReason {
  /// Service Quotas returns the following error values.
  ///
  ///  `DEPENDENCY_ACCESS_DENIED_ERROR` is returned when the caller does not
  /// have permission to call the service or service quota. To resolve the
  /// error, you need permission to access the service or service quota.
  ///
  ///  `DEPENDENCY_THROTTLING_ERROR` is returned when the service being called
  /// is throttling Service Quotas.
  ///
  ///  `DEPENDENCY_SERVICE_ERROR` is returned when the service being called has
  /// availability issues.
  ///
  ///  `SERVICE_QUOTA_NOT_AVAILABLE_ERROR` is returned when there was an error
  /// in Service Quotas.
  final String errorCode;

  /// The error message that provides more detail.
  final String errorMessage;

  ErrorReason({
    this.errorCode,
    this.errorMessage,
  });
  static ErrorReason fromJson(Map<String, dynamic> json) => ErrorReason(
        errorCode:
            json.containsKey('ErrorCode') ? json['ErrorCode'] as String : null,
        errorMessage: json.containsKey('ErrorMessage')
            ? json['ErrorMessage'] as String
            : null,
      );
}

class GetAwsDefaultServiceQuotaResponse {
  /// Returns the ServiceQuota object which contains all values for a quota.
  final ServiceQuota quota;

  GetAwsDefaultServiceQuotaResponse({
    this.quota,
  });
  static GetAwsDefaultServiceQuotaResponse fromJson(
          Map<String, dynamic> json) =>
      GetAwsDefaultServiceQuotaResponse(
        quota: json.containsKey('Quota')
            ? ServiceQuota.fromJson(json['Quota'])
            : null,
      );
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
      GetAssociationForServiceQuotaTemplateResponse(
        serviceQuotaTemplateAssociationStatus:
            json.containsKey('ServiceQuotaTemplateAssociationStatus')
                ? json['ServiceQuotaTemplateAssociationStatus'] as String
                : null,
      );
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
      GetRequestedServiceQuotaChangeResponse(
        requestedQuota: json.containsKey('RequestedQuota')
            ? RequestedServiceQuotaChange.fromJson(json['RequestedQuota'])
            : null,
      );
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
      GetServiceQuotaIncreaseRequestFromTemplateResponse(
        serviceQuotaIncreaseRequestInTemplate:
            json.containsKey('ServiceQuotaIncreaseRequestInTemplate')
                ? ServiceQuotaIncreaseRequestInTemplate.fromJson(
                    json['ServiceQuotaIncreaseRequestInTemplate'])
                : null,
      );
}

class GetServiceQuotaResponse {
  /// Returns the ServiceQuota object which contains all values for a quota.
  final ServiceQuota quota;

  GetServiceQuotaResponse({
    this.quota,
  });
  static GetServiceQuotaResponse fromJson(Map<String, dynamic> json) =>
      GetServiceQuotaResponse(
        quota: json.containsKey('Quota')
            ? ServiceQuota.fromJson(json['Quota'])
            : null,
      );
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
      ListAwsDefaultServiceQuotasResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        quotas: json.containsKey('Quotas')
            ? (json['Quotas'] as List)
                .map((e) => ServiceQuota.fromJson(e))
                .toList()
            : null,
      );
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
      ListRequestedServiceQuotaChangeHistoryByQuotaResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        requestedQuotas: json.containsKey('RequestedQuotas')
            ? (json['RequestedQuotas'] as List)
                .map((e) => RequestedServiceQuotaChange.fromJson(e))
                .toList()
            : null,
      );
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
      ListRequestedServiceQuotaChangeHistoryResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        requestedQuotas: json.containsKey('RequestedQuotas')
            ? (json['RequestedQuotas'] as List)
                .map((e) => RequestedServiceQuotaChange.fromJson(e))
                .toList()
            : null,
      );
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
      ListServiceQuotaIncreaseRequestsInTemplateResponse(
        serviceQuotaIncreaseRequestInTemplateList: json
                .containsKey('ServiceQuotaIncreaseRequestInTemplateList')
            ? (json['ServiceQuotaIncreaseRequestInTemplateList'] as List)
                .map((e) => ServiceQuotaIncreaseRequestInTemplate.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListServiceQuotasResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        quotas: json.containsKey('Quotas')
            ? (json['Quotas'] as List)
                .map((e) => ServiceQuota.fromJson(e))
                .toList()
            : null,
      );
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
      ListServicesResponse(
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
        services: json.containsKey('Services')
            ? (json['Services'] as List)
                .map((e) => ServiceInfo.fromJson(e))
                .toList()
            : null,
      );
}

/// A structure that uses CloudWatch metrics to gather data about the service
/// quota.
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
  static MetricInfo fromJson(Map<String, dynamic> json) => MetricInfo(
        metricNamespace: json.containsKey('MetricNamespace')
            ? json['MetricNamespace'] as String
            : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        metricDimensions: json.containsKey('MetricDimensions')
            ? (json['MetricDimensions'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        metricStatisticRecommendation:
            json.containsKey('MetricStatisticRecommendation')
                ? json['MetricStatisticRecommendation'] as String
                : null,
      );
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
      PutServiceQuotaIncreaseRequestIntoTemplateResponse(
        serviceQuotaIncreaseRequestInTemplate:
            json.containsKey('ServiceQuotaIncreaseRequestInTemplate')
                ? ServiceQuotaIncreaseRequestInTemplate.fromJson(
                    json['ServiceQuotaIncreaseRequestInTemplate'])
                : null,
      );
}

/// A structure that contains information about the quota period.
class QuotaPeriod {
  /// The value of a period.
  final int periodValue;

  /// The time unit of a period.
  final String periodUnit;

  QuotaPeriod({
    this.periodValue,
    this.periodUnit,
  });
  static QuotaPeriod fromJson(Map<String, dynamic> json) => QuotaPeriod(
        periodValue:
            json.containsKey('PeriodValue') ? json['PeriodValue'] as int : null,
        periodUnit: json.containsKey('PeriodUnit')
            ? json['PeriodUnit'] as String
            : null,
      );
}

class RequestServiceQuotaIncreaseResponse {
  /// Returns a list of service quota requests.
  final RequestedServiceQuotaChange requestedQuota;

  RequestServiceQuotaIncreaseResponse({
    this.requestedQuota,
  });
  static RequestServiceQuotaIncreaseResponse fromJson(
          Map<String, dynamic> json) =>
      RequestServiceQuotaIncreaseResponse(
        requestedQuota: json.containsKey('RequestedQuota')
            ? RequestedServiceQuotaChange.fromJson(json['RequestedQuota'])
            : null,
      );
}

/// A structure that contains information about a requested change for a quota.
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
      RequestedServiceQuotaChange(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        caseId: json.containsKey('CaseId') ? json['CaseId'] as String : null,
        serviceCode: json.containsKey('ServiceCode')
            ? json['ServiceCode'] as String
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
        quotaCode:
            json.containsKey('QuotaCode') ? json['QuotaCode'] as String : null,
        quotaName:
            json.containsKey('QuotaName') ? json['QuotaName'] as String : null,
        desiredValue: json.containsKey('DesiredValue')
            ? json['DesiredValue'] as double
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        created: json.containsKey('Created')
            ? DateTime.parse(json['Created'])
            : null,
        lastUpdated: json.containsKey('LastUpdated')
            ? DateTime.parse(json['LastUpdated'])
            : null,
        requester:
            json.containsKey('Requester') ? json['Requester'] as String : null,
        quotaArn:
            json.containsKey('QuotaArn') ? json['QuotaArn'] as String : null,
        globalQuota: json.containsKey('GlobalQuota')
            ? json['GlobalQuota'] as bool
            : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
      );
}

/// A structure that contains the `ServiceName` and `ServiceCode`. It does not
/// include all details of the service quota. To get those values, use the
/// ListServiceQuotas operation.
class ServiceInfo {
  /// Specifies the service that you want to use.
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  final String serviceName;

  ServiceInfo({
    this.serviceCode,
    this.serviceName,
  });
  static ServiceInfo fromJson(Map<String, dynamic> json) => ServiceInfo(
        serviceCode: json.containsKey('ServiceCode')
            ? json['ServiceCode'] as String
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
      );
}

/// A structure that contains the full set of details that define the service
/// quota.
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
  static ServiceQuota fromJson(Map<String, dynamic> json) => ServiceQuota(
        serviceCode: json.containsKey('ServiceCode')
            ? json['ServiceCode'] as String
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
        quotaArn:
            json.containsKey('QuotaArn') ? json['QuotaArn'] as String : null,
        quotaCode:
            json.containsKey('QuotaCode') ? json['QuotaCode'] as String : null,
        quotaName:
            json.containsKey('QuotaName') ? json['QuotaName'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as double : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
        adjustable:
            json.containsKey('Adjustable') ? json['Adjustable'] as bool : null,
        globalQuota: json.containsKey('GlobalQuota')
            ? json['GlobalQuota'] as bool
            : null,
        usageMetric: json.containsKey('UsageMetric')
            ? MetricInfo.fromJson(json['UsageMetric'])
            : null,
        period: json.containsKey('Period')
            ? QuotaPeriod.fromJson(json['Period'])
            : null,
        errorReason: json.containsKey('ErrorReason')
            ? ErrorReason.fromJson(json['ErrorReason'])
            : null,
      );
}

/// A structure that contains information about one service quota increase
/// request.
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
      ServiceQuotaIncreaseRequestInTemplate(
        serviceCode: json.containsKey('ServiceCode')
            ? json['ServiceCode'] as String
            : null,
        serviceName: json.containsKey('ServiceName')
            ? json['ServiceName'] as String
            : null,
        quotaCode:
            json.containsKey('QuotaCode') ? json['QuotaCode'] as String : null,
        quotaName:
            json.containsKey('QuotaName') ? json['QuotaName'] as String : null,
        desiredValue: json.containsKey('DesiredValue')
            ? json['DesiredValue'] as double
            : null,
        awsRegion:
            json.containsKey('AwsRegion') ? json['AwsRegion'] as String : null,
        unit: json.containsKey('Unit') ? json['Unit'] as String : null,
        globalQuota: json.containsKey('GlobalQuota')
            ? json['GlobalQuota'] as bool
            : null,
      );
}
