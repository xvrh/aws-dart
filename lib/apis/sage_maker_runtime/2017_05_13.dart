import 'package:meta/meta.dart';
import 'dart:typed_data';

///  The Amazon SageMaker runtime API.
class SageMakerRuntimeApi {
  /// After you deploy a model into production using Amazon SageMaker hosting
  /// services, your client applications use this API to get inferences from the
  /// model hosted at the specified endpoint.
  ///
  /// For an overview of Amazon SageMaker, see [How It
  /// Works](http://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html).
  ///
  /// Amazon SageMaker strips all POST headers except those supported by the
  /// API. Amazon SageMaker might add additional headers. You should not rely on
  /// the behavior of headers outside those enumerated in the request syntax.
  ///
  /// Cals to `InvokeEndpoint` are authenticated by using AWS Signature Version
  /// 4. For information, see [Authenticating Requests (AWS Signature Version
  /// 4)](http://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html)
  /// in the _Amazon S3 API Reference_.
  ///
  ///
  ///
  /// Endpoints are scoped to an individual account, and are not public. The URL
  /// does not contain the account ID, but Amazon SageMaker determines the
  /// account ID from the authentication token that is supplied by the caller.
  Future<void> invokeEndpoint(
      {@required String endpointName,
      @required Uint8List body,
      String contentType,
      String accept,
      String customAttributes}) async {}
}

class InvokeEndpointOutput {}
