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
  Future<void> cancelJob(String jobId, {String apiVersion}) async {}

  /// This operation initiates the process of scheduling an upload or download
  /// of your data. You include in the request a manifest that describes the
  /// data transfer specifics. The response to the request includes a job ID,
  /// which you can use in other operations, a signature that you use to
  /// identify your storage device, and the address where you should ship your
  /// storage device.
  Future<void> createJob(
      {@required String jobType,
      @required String manifest,
      String manifestAddendum,
      @required bool validateOnly,
      String apiVersion}) async {}

  /// This operation generates a pre-paid UPS shipping label that you will use
  /// to ship your device to AWS for processing.
  Future<void> getShippingLabel(List<String> jobIds,
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
      String apiVersion}) async {}

  /// This operation returns information about a job, including where the job is
  /// in the processing pipeline, the status of the results, and the signature
  /// value associated with the job. You can only return information about jobs
  /// you own.
  Future<void> getStatus(String jobId, {String apiVersion}) async {}

  /// This operation returns the jobs associated with the requester. AWS
  /// Import/Export lists the jobs in reverse chronological order based on the
  /// date of creation. For example if Job Test1 was created 2009Dec30 and Test2
  /// was created 2010Feb05, the ListJobs operation would return Test2 followed
  /// by Test1.
  Future<void> listJobs(
      {int maxJobs, String marker, String apiVersion}) async {}

  /// You use this operation to change the parameters specified in the original
  /// manifest file by supplying a new manifest file. The manifest file attached
  /// to this request replaces the original manifest file. You can only use the
  /// operation after a CreateJob request but before the data transfer starts
  /// and you can only use it on jobs you own.
  Future<void> updateJob(
      {@required String jobId,
      @required String manifest,
      @required String jobType,
      @required bool validateOnly,
      String apiVersion}) async {}
}

class Artifact {}

class CancelJobOutput {}

class CreateJobOutput {}

class GetShippingLabelOutput {}

class GetStatusOutput {}

class Job {}

class ListJobsOutput {}

class UpdateJobOutput {}
