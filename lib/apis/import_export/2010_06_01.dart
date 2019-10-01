import 'package:meta/meta.dart';

/// AWS Import/Export Service AWS Import/Export accelerates transferring large
/// amounts of data between the AWS cloud and portable storage devices that you
/// mail to us. AWS Import/Export transfers data directly onto and off of your
/// storage devices using Amazon's high-speed internal network and bypassing the
/// Internet. For large data sets, AWS Import/Export is often faster than
/// Internet transfer and more cost effective than upgrading your connectivity.
class ImportExportApi {
  final _client;
  ImportExportApi(client)
      : _client = client.configured('ImportExport', serializer: 'query');

  /// This operation cancels a specified job. Only the job owner can cancel it.
  /// The operation fails if the job has already started or is complete.
  Future<CancelJobOutput> cancelJob(String jobId, {String apiVersion}) async {
    var response_ = await _client.send('CancelJob', {
      'JobId': jobId,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return CancelJobOutput.fromJson(response_);
  }

  /// This operation initiates the process of scheduling an upload or download
  /// of your data. You include in the request a manifest that describes the
  /// data transfer specifics. The response to the request includes a job ID,
  /// which you can use in other operations, a signature that you use to
  /// identify your storage device, and the address where you should ship your
  /// storage device.
  Future<CreateJobOutput> createJob(
      {@required String jobType,
      @required String manifest,
      String manifestAddendum,
      @required bool validateOnly,
      String apiVersion}) async {
    var response_ = await _client.send('CreateJob', {
      'JobType': jobType,
      'Manifest': manifest,
      if (manifestAddendum != null) 'ManifestAddendum': manifestAddendum,
      'ValidateOnly': validateOnly,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return CreateJobOutput.fromJson(response_);
  }

  /// This operation generates a pre-paid UPS shipping label that you will use
  /// to ship your device to AWS for processing.
  Future<GetShippingLabelOutput> getShippingLabel(List<String> jobIds,
      {String name,
      String company,
      String phoneNumber,
      String country,
      String stateOrProvince,
      String city,
      String postalCode,
      String street1,
      String street2,
      String street3,
      String apiVersion}) async {
    var response_ = await _client.send('GetShippingLabel', {
      'jobIds': jobIds,
      if (name != null) 'name': name,
      if (company != null) 'company': company,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (country != null) 'country': country,
      if (stateOrProvince != null) 'stateOrProvince': stateOrProvince,
      if (city != null) 'city': city,
      if (postalCode != null) 'postalCode': postalCode,
      if (street1 != null) 'street1': street1,
      if (street2 != null) 'street2': street2,
      if (street3 != null) 'street3': street3,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return GetShippingLabelOutput.fromJson(response_);
  }

  /// This operation returns information about a job, including where the job is
  /// in the processing pipeline, the status of the results, and the signature
  /// value associated with the job. You can only return information about jobs
  /// you own.
  Future<GetStatusOutput> getStatus(String jobId, {String apiVersion}) async {
    var response_ = await _client.send('GetStatus', {
      'JobId': jobId,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return GetStatusOutput.fromJson(response_);
  }

  /// This operation returns the jobs associated with the requester. AWS
  /// Import/Export lists the jobs in reverse chronological order based on the
  /// date of creation. For example if Job Test1 was created 2009Dec30 and Test2
  /// was created 2010Feb05, the ListJobs operation would return Test2 followed
  /// by Test1.
  Future<ListJobsOutput> listJobs(
      {int maxJobs, String marker, String apiVersion}) async {
    var response_ = await _client.send('ListJobs', {
      if (maxJobs != null) 'MaxJobs': maxJobs,
      if (marker != null) 'Marker': marker,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return ListJobsOutput.fromJson(response_);
  }

  /// You use this operation to change the parameters specified in the original
  /// manifest file by supplying a new manifest file. The manifest file attached
  /// to this request replaces the original manifest file. You can only use the
  /// operation after a CreateJob request but before the data transfer starts
  /// and you can only use it on jobs you own.
  Future<UpdateJobOutput> updateJob(
      {@required String jobId,
      @required String manifest,
      @required String jobType,
      @required bool validateOnly,
      String apiVersion}) async {
    var response_ = await _client.send('UpdateJob', {
      'JobId': jobId,
      'Manifest': manifest,
      'JobType': jobType,
      'ValidateOnly': validateOnly,
      if (apiVersion != null) 'APIVersion': apiVersion,
    });
    return UpdateJobOutput.fromJson(response_);
  }
}

/// A discrete item that contains the description and URL of an artifact (such
/// as a PDF).
class Artifact {
  final String description;

  final String url;

  Artifact({
    this.description,
    this.url,
  });
  static Artifact fromJson(Map<String, dynamic> json) => Artifact(
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        url: json.containsKey('URL') ? json['URL'] as String : null,
      );
}

/// Output structure for the CancelJob operation.
class CancelJobOutput {
  final bool success;

  CancelJobOutput({
    this.success,
  });
  static CancelJobOutput fromJson(Map<String, dynamic> json) => CancelJobOutput(
        success: json.containsKey('Success') ? json['Success'] as bool : null,
      );
}

/// Output structure for the CreateJob operation.
class CreateJobOutput {
  final String jobId;

  final String jobType;

  final String signature;

  final String signatureFileContents;

  final String warningMessage;

  final List<Artifact> artifactList;

  CreateJobOutput({
    this.jobId,
    this.jobType,
    this.signature,
    this.signatureFileContents,
    this.warningMessage,
    this.artifactList,
  });
  static CreateJobOutput fromJson(Map<String, dynamic> json) => CreateJobOutput(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
        signature:
            json.containsKey('Signature') ? json['Signature'] as String : null,
        signatureFileContents: json.containsKey('SignatureFileContents')
            ? json['SignatureFileContents'] as String
            : null,
        warningMessage: json.containsKey('WarningMessage')
            ? json['WarningMessage'] as String
            : null,
        artifactList: json.containsKey('ArtifactList')
            ? (json['ArtifactList'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
      );
}

class GetShippingLabelOutput {
  final String shippingLabelUrl;

  final String warning;

  GetShippingLabelOutput({
    this.shippingLabelUrl,
    this.warning,
  });
  static GetShippingLabelOutput fromJson(Map<String, dynamic> json) =>
      GetShippingLabelOutput(
        shippingLabelUrl: json.containsKey('ShippingLabelURL')
            ? json['ShippingLabelURL'] as String
            : null,
        warning: json.containsKey('Warning') ? json['Warning'] as String : null,
      );
}

/// Output structure for the GetStatus operation.
class GetStatusOutput {
  final String jobId;

  final String jobType;

  final String locationCode;

  final String locationMessage;

  final String progressCode;

  final String progressMessage;

  final String carrier;

  final String trackingNumber;

  final String logBucket;

  final String logKey;

  final int errorCount;

  final String signature;

  final String signatureFileContents;

  final String currentManifest;

  final DateTime creationDate;

  final List<Artifact> artifactList;

  GetStatusOutput({
    this.jobId,
    this.jobType,
    this.locationCode,
    this.locationMessage,
    this.progressCode,
    this.progressMessage,
    this.carrier,
    this.trackingNumber,
    this.logBucket,
    this.logKey,
    this.errorCount,
    this.signature,
    this.signatureFileContents,
    this.currentManifest,
    this.creationDate,
    this.artifactList,
  });
  static GetStatusOutput fromJson(Map<String, dynamic> json) => GetStatusOutput(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
        locationCode: json.containsKey('LocationCode')
            ? json['LocationCode'] as String
            : null,
        locationMessage: json.containsKey('LocationMessage')
            ? json['LocationMessage'] as String
            : null,
        progressCode: json.containsKey('ProgressCode')
            ? json['ProgressCode'] as String
            : null,
        progressMessage: json.containsKey('ProgressMessage')
            ? json['ProgressMessage'] as String
            : null,
        carrier: json.containsKey('Carrier') ? json['Carrier'] as String : null,
        trackingNumber: json.containsKey('TrackingNumber')
            ? json['TrackingNumber'] as String
            : null,
        logBucket:
            json.containsKey('LogBucket') ? json['LogBucket'] as String : null,
        logKey: json.containsKey('LogKey') ? json['LogKey'] as String : null,
        errorCount:
            json.containsKey('ErrorCount') ? json['ErrorCount'] as int : null,
        signature:
            json.containsKey('Signature') ? json['Signature'] as String : null,
        signatureFileContents: json.containsKey('SignatureFileContents')
            ? json['SignatureFileContents'] as String
            : null,
        currentManifest: json.containsKey('CurrentManifest')
            ? json['CurrentManifest'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        artifactList: json.containsKey('ArtifactList')
            ? (json['ArtifactList'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
      );
}

/// Representation of a job returned by the ListJobs operation.
class Job {
  final String jobId;

  final DateTime creationDate;

  final bool isCanceled;

  final String jobType;

  Job({
    this.jobId,
    this.creationDate,
    this.isCanceled,
    this.jobType,
  });
  static Job fromJson(Map<String, dynamic> json) => Job(
        jobId: json.containsKey('JobId') ? json['JobId'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        isCanceled:
            json.containsKey('IsCanceled') ? json['IsCanceled'] as bool : null,
        jobType: json.containsKey('JobType') ? json['JobType'] as String : null,
      );
}

/// Output structure for the ListJobs operation.
class ListJobsOutput {
  final List<Job> jobs;

  final bool isTruncated;

  ListJobsOutput({
    this.jobs,
    this.isTruncated,
  });
  static ListJobsOutput fromJson(Map<String, dynamic> json) => ListJobsOutput(
        jobs: json.containsKey('Jobs')
            ? (json['Jobs'] as List).map((e) => Job.fromJson(e)).toList()
            : null,
        isTruncated: json.containsKey('IsTruncated')
            ? json['IsTruncated'] as bool
            : null,
      );
}

/// Output structure for the UpateJob operation.
class UpdateJobOutput {
  final bool success;

  final String warningMessage;

  final List<Artifact> artifactList;

  UpdateJobOutput({
    this.success,
    this.warningMessage,
    this.artifactList,
  });
  static UpdateJobOutput fromJson(Map<String, dynamic> json) => UpdateJobOutput(
        success: json.containsKey('Success') ? json['Success'] as bool : null,
        warningMessage: json.containsKey('WarningMessage')
            ? json['WarningMessage'] as String
            : null,
        artifactList: json.containsKey('ArtifactList')
            ? (json['ArtifactList'] as List)
                .map((e) => Artifact.fromJson(e))
                .toList()
            : null,
      );
}
