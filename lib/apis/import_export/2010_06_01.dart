import 'package:meta/meta.dart';

/// AWS Import/Export Service AWS Import/Export accelerates transferring large
/// amounts of data between the AWS cloud and portable storage devices that you
/// mail to us. AWS Import/Export transfers data directly onto and off of your
/// storage devices using Amazon's high-speed internal network and bypassing the
/// Internet. For large data sets, AWS Import/Export is often faster than
/// Internet transfer and more cost effective than upgrading your connectivity.
class ImportExportApi {
  /// This operation cancels a specified job. Only the job owner can cancel it.
  /// The operation fails if the job has already started or is complete.
  Future<CancelJobOutput> cancelJob(String jobId, {String apiVersion}) async {
    return CancelJobOutput.fromJson({});
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
    return CreateJobOutput.fromJson({});
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
    return GetShippingLabelOutput.fromJson({});
  }

  /// This operation returns information about a job, including where the job is
  /// in the processing pipeline, the status of the results, and the signature
  /// value associated with the job. You can only return information about jobs
  /// you own.
  Future<GetStatusOutput> getStatus(String jobId, {String apiVersion}) async {
    return GetStatusOutput.fromJson({});
  }

  /// This operation returns the jobs associated with the requester. AWS
  /// Import/Export lists the jobs in reverse chronological order based on the
  /// date of creation. For example if Job Test1 was created 2009Dec30 and Test2
  /// was created 2010Feb05, the ListJobs operation would return Test2 followed
  /// by Test1.
  Future<ListJobsOutput> listJobs(
      {int maxJobs, String marker, String apiVersion}) async {
    return ListJobsOutput.fromJson({});
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
    return UpdateJobOutput.fromJson({});
  }
}

class Artifact {
  final String description;

  final String url;

  Artifact({
    this.description,
    this.url,
  });
  static Artifact fromJson(Map<String, dynamic> json) => Artifact();
}

class CancelJobOutput {
  final bool success;

  CancelJobOutput({
    this.success,
  });
  static CancelJobOutput fromJson(Map<String, dynamic> json) =>
      CancelJobOutput();
}

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
  static CreateJobOutput fromJson(Map<String, dynamic> json) =>
      CreateJobOutput();
}

class GetShippingLabelOutput {
  final String shippingLabelUrl;

  final String warning;

  GetShippingLabelOutput({
    this.shippingLabelUrl,
    this.warning,
  });
  static GetShippingLabelOutput fromJson(Map<String, dynamic> json) =>
      GetShippingLabelOutput();
}

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
  static GetStatusOutput fromJson(Map<String, dynamic> json) =>
      GetStatusOutput();
}

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
  static Job fromJson(Map<String, dynamic> json) => Job();
}

class ListJobsOutput {
  final List<Job> jobs;

  final bool isTruncated;

  ListJobsOutput({
    this.jobs,
    this.isTruncated,
  });
  static ListJobsOutput fromJson(Map<String, dynamic> json) => ListJobsOutput();
}

class UpdateJobOutput {
  final bool success;

  final String warningMessage;

  final List<Artifact> artifactList;

  UpdateJobOutput({
    this.success,
    this.warningMessage,
    this.artifactList,
  });
  static UpdateJobOutput fromJson(Map<String, dynamic> json) =>
      UpdateJobOutput();
}
