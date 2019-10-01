import 'package:meta/meta.dart';
import 'dart:typed_data';

/// This is the Amazon Rekognition API reference.
class RekognitionApi {
  /// Compares a face in the _source_ input image with each of the 100 largest
  /// faces detected in the _target_ input image.
  ///
  ///   If the source image contains multiple faces, the service detects the
  /// largest face and compares it with each face detected in the target image.
  ///
  /// You pass the input and target images either as base64-encoded image bytes
  /// or as references to images in an Amazon S3 bucket. If you use the AWS CLI
  /// to call Amazon Rekognition operations, passing image bytes isn't
  /// supported. The image must be formatted as a PNG or JPEG file.
  ///
  /// In response, the operation returns an array of face matches ordered by
  /// similarity score in descending order. For each face match, the response
  /// provides a bounding box of the face, facial landmarks, pose details
  /// (pitch, role, and yaw), quality (brightness and sharpness), and confidence
  /// value (indicating the level of confidence that the bounding box contains a
  /// face). The response also provides a similarity score, which indicates how
  /// closely the faces match.
  ///
  ///  By default, only faces with a similarity score of greater than or equal
  /// to 80% are returned in the response. You can change this value by
  /// specifying the `SimilarityThreshold` parameter.
  ///
  ///  `CompareFaces` also returns an array of faces that don't match the source
  /// image. For each face, it returns a bounding box, confidence value,
  /// landmarks, pose details, and quality. The response also returns
  /// information about the face in the source image, including the bounding box
  /// of the face and confidence value.
  ///
  /// If the image doesn't contain Exif metadata, `CompareFaces` returns
  /// orientation information for the source and target images. Use these values
  /// to display the images with the correct image orientation.
  ///
  /// If no faces are detected in the source or target images, `CompareFaces`
  /// returns an `InvalidParameterException` error.
  ///
  ///   This is a stateless API operation. That is, data returned by this
  /// operation doesn't persist.
  ///
  /// For an example, see Comparing Faces in Images in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:CompareFaces` action.
  ///
  /// [sourceImage]: The input image as base64-encoded bytes or an S3 object. If
  /// you use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [targetImage]: The target image as base64-encoded bytes or an S3 object.
  /// If you use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [similarityThreshold]: The minimum level of confidence in the face matches
  /// that a match must meet to be included in the `FaceMatches` array.
  Future<CompareFacesResponse> compareFaces(
      {@required Image sourceImage,
      @required Image targetImage,
      double similarityThreshold}) async {
    return CompareFacesResponse.fromJson({});
  }

  /// Creates a collection in an AWS Region. You can add faces to the collection
  /// using the IndexFaces operation.
  ///
  /// For example, you might create collections, one for each of your
  /// application users. A user can then index faces using the `IndexFaces`
  /// operation and persist results in a specific collection. Then, a user can
  /// search the collection for faces in the user-specific container.
  ///
  /// When you create a collection, it is associated with the latest version of
  /// the face model version.
  ///
  ///  Collection names are case-sensitive.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:CreateCollection` action.
  ///
  /// [collectionId]: ID for the collection that you are creating.
  Future<CreateCollectionResponse> createCollection(String collectionId) async {
    return CreateCollectionResponse.fromJson({});
  }

  /// Creates an Amazon Rekognition stream processor that you can use to detect
  /// and recognize faces in a streaming video.
  ///
  /// Amazon Rekognition Video is a consumer of live video from Amazon Kinesis
  /// Video Streams. Amazon Rekognition Video sends analysis results to Amazon
  /// Kinesis Data Streams.
  ///
  /// You provide as input a Kinesis video stream (`Input`) and a Kinesis data
  /// stream (`Output`) stream. You also specify the face recognition criteria
  /// in `Settings`. For example, the collection containing faces that you want
  /// to recognize. Use `Name` to assign an identifier for the stream processor.
  /// You use `Name` to manage the stream processor. For example, you can start
  /// processing the source video by calling StartStreamProcessor with the
  /// `Name` field.
  ///
  /// After you have finished analyzing a streaming video, use
  /// StopStreamProcessor to stop processing. You can delete the stream
  /// processor by calling DeleteStreamProcessor.
  ///
  /// [input]: Kinesis video stream stream that provides the source streaming
  /// video. If you are using the AWS CLI, the parameter name is
  /// `StreamProcessorInput`.
  ///
  /// [output]: Kinesis data stream stream to which Amazon Rekognition Video
  /// puts the analysis results. If you are using the AWS CLI, the parameter
  /// name is `StreamProcessorOutput`.
  ///
  /// [name]: An identifier you assign to the stream processor. You can use
  /// `Name` to manage the stream processor. For example, you can get the
  /// current status of the stream processor by calling DescribeStreamProcessor.
  /// `Name` is idempotent.
  ///
  /// [settings]: Face recognition input parameters to be used by the stream
  /// processor. Includes the collection to use for face recognition and the
  /// face attributes to detect.
  ///
  /// [roleArn]: ARN of the IAM role that allows access to the stream processor.
  Future<CreateStreamProcessorResponse> createStreamProcessor(
      {@required StreamProcessorInput input,
      @required StreamProcessorOutput output,
      @required String name,
      @required StreamProcessorSettings settings,
      @required String roleArn}) async {
    return CreateStreamProcessorResponse.fromJson({});
  }

  /// Deletes the specified collection. Note that this operation removes all
  /// faces in the collection. For an example, see delete-collection-procedure.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:DeleteCollection` action.
  ///
  /// [collectionId]: ID of the collection to delete.
  Future<DeleteCollectionResponse> deleteCollection(String collectionId) async {
    return DeleteCollectionResponse.fromJson({});
  }

  /// Deletes faces from a collection. You specify a collection ID and an array
  /// of face IDs to remove from the collection.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:DeleteFaces` action.
  ///
  /// [collectionId]: Collection from which to remove the specific faces.
  ///
  /// [faceIds]: An array of face IDs to delete.
  Future<DeleteFacesResponse> deleteFaces(
      {@required String collectionId, @required List<String> faceIds}) async {
    return DeleteFacesResponse.fromJson({});
  }

  /// Deletes the stream processor identified by `Name`. You assign the value
  /// for `Name` when you create the stream processor with
  /// CreateStreamProcessor. You might not be able to use the same name for a
  /// stream processor for a few seconds after calling `DeleteStreamProcessor`.
  ///
  /// [name]: The name of the stream processor you want to delete.
  Future<DeleteStreamProcessorResponse> deleteStreamProcessor(
      String name) async {
    return DeleteStreamProcessorResponse.fromJson({});
  }

  /// Describes the specified collection. You can use `DescribeCollection` to
  /// get information, such as the number of faces indexed into a collection and
  /// the version of the model used by the collection for face detection.
  ///
  /// For more information, see Describing a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// [collectionId]: The ID of the collection to describe.
  Future<DescribeCollectionResponse> describeCollection(
      String collectionId) async {
    return DescribeCollectionResponse.fromJson({});
  }

  /// Provides information about a stream processor created by
  /// CreateStreamProcessor. You can get information about the input and output
  /// streams, the input parameters for the face recognition being performed,
  /// and the current status of the stream processor.
  ///
  /// [name]: Name of the stream processor for which you want information.
  Future<DescribeStreamProcessorResponse> describeStreamProcessor(
      String name) async {
    return DescribeStreamProcessorResponse.fromJson({});
  }

  /// Detects faces within an image that is provided as input.
  ///
  ///  `DetectFaces` detects the 100 largest faces in the image. For each face
  /// detected, the operation returns face details. These details include a
  /// bounding box of the face, a confidence value (that the bounding box
  /// contains a face), and a fixed set of attributes such as facial landmarks
  /// (for example, coordinates of eye and mouth), gender, presence of beard,
  /// sunglasses, and so on.
  ///
  /// The face-detection algorithm is most effective on frontal faces. For
  /// non-frontal or obscured faces, the algorithm might not detect the faces or
  /// might detect faces with lower confidence.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the to call
  /// Amazon Rekognition operations, passing image bytes is not supported. The
  /// image must be either a PNG or JPEG formatted file.
  ///
  ///  This is a stateless API operation. That is, the operation does not
  /// persist any data.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:DetectFaces` action.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [attributes]: An array of facial attributes you want to be returned. This
  /// can be the default list of attributes or all attributes. If you don't
  /// specify a value for `Attributes` or if you specify `\["DEFAULT"\]`, the
  /// API returns the following subset of facial attributes: `BoundingBox`,
  /// `Confidence`, `Pose`, `Quality`, and `Landmarks`. If you provide
  /// `\["ALL"\]`, all facial attributes are returned, but the operation takes
  /// longer to complete.
  ///
  /// If you provide both, `\["ALL", "DEFAULT"\]`, the service uses a logical
  /// AND operator to determine which attributes to return (in this case, all
  /// attributes).
  Future<DetectFacesResponse> detectFaces(Image image,
      {List<String> attributes}) async {
    return DetectFacesResponse.fromJson({});
  }

  /// Detects instances of real-world entities within an image (JPEG or PNG)
  /// provided as input. This includes objects like flower, tree, and table;
  /// events like wedding, graduation, and birthday party; and concepts like
  /// landscape, evening, and nature.
  ///
  /// For an example, see Analyzing Images Stored in an Amazon S3 Bucket in the
  /// Amazon Rekognition Developer Guide.
  ///
  ///   `DetectLabels` does not support the detection of activities. However,
  /// activity detection is supported for label detection in videos. For more
  /// information, see StartLabelDetection in the Amazon Rekognition Developer
  /// Guide.
  ///
  /// You pass the input image as base64-encoded image bytes or as a reference
  /// to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, passing image bytes is not supported. The image
  /// must be either a PNG or JPEG formatted file.
  ///
  ///  For each object, scene, and concept the API returns one or more labels.
  /// Each label provides the object name, and the level of confidence that the
  /// image contains the object. For example, suppose the input image has a
  /// lighthouse, the sea, and a rock. The response includes all three labels,
  /// one for each object.
  ///
  ///  `{Name: lighthouse, Confidence: 98.4629}`
  ///
  ///  `{Name: rock,Confidence: 79.2097}`
  ///
  ///   `{Name: sea,Confidence: 75.061}`
  ///
  /// In the preceding example, the operation returns one label for each of the
  /// three objects. The operation can also return multiple labels for the same
  /// object in the image. For example, if the input image shows a flower (for
  /// example, a tulip), the operation might return the following three labels.
  ///
  ///  `{Name: flower,Confidence: 99.0562}`
  ///
  ///  `{Name: plant,Confidence: 99.0562}`
  ///
  ///  `{Name: tulip,Confidence: 99.0562}`
  ///
  /// In this example, the detection algorithm more precisely identifies the
  /// flower as a tulip.
  ///
  /// In response, the API returns an array of labels. In addition, the response
  /// also includes the orientation correction. Optionally, you can specify
  /// `MinConfidence` to control the confidence threshold for the labels
  /// returned. The default is 55%. You can also add the `MaxLabels` parameter
  /// to limit the number of labels returned.
  ///
  ///  If the object detected is a person, the operation doesn't provide the
  /// same facial details that the DetectFaces operation provides.
  ///
  ///  `DetectLabels` returns bounding boxes for instances of common object
  /// labels in an array of Instance objects. An `Instance` object contains a
  /// BoundingBox object, for the location of the label on the image. It also
  /// includes the confidence by which the bounding box was detected.
  ///
  ///  `DetectLabels` also returns a hierarchical taxonomy of detected labels.
  /// For example, a detected car might be assigned the label _car_. The label
  /// _car_ has two parent labels: _Vehicle_ (its parent) and _Transportation_
  /// (its grandparent). The response returns the entire list of ancestors for a
  /// label. Each ancestor is a unique label in the response. In the previous
  /// example, _Car_, _Vehicle_, and _Transportation_ are returned as unique
  /// labels in the response.
  ///
  /// This is a stateless API operation. That is, the operation does not persist
  /// any data.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:DetectLabels` action.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing image bytes
  /// is not supported. Images stored in an S3 Bucket do not need to be
  /// base64-encoded.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [maxLabels]: Maximum number of labels you want the service to return in
  /// the response. The service returns the specified number of highest
  /// confidence labels.
  ///
  /// [minConfidence]: Specifies the minimum confidence level for the labels to
  /// return. Amazon Rekognition doesn't return any labels with confidence lower
  /// than this specified value.
  ///
  /// If `MinConfidence` is not specified, the operation returns labels with a
  /// confidence values greater than or equal to 55 percent.
  Future<DetectLabelsResponse> detectLabels(Image image,
      {int maxLabels, double minConfidence}) async {
    return DetectLabelsResponse.fromJson({});
  }

  /// Detects unsafe content in a specified JPEG or PNG format image. Use
  /// `DetectModerationLabels` to moderate images depending on your
  /// requirements. For example, you might want to filter images that contain
  /// nudity, but not images containing suggestive content.
  ///
  /// To filter images, use the labels returned by `DetectModerationLabels` to
  /// determine which types of content are appropriate.
  ///
  /// For information about moderation labels, see Detecting Unsafe Content in
  /// the Amazon Rekognition Developer Guide.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [minConfidence]: Specifies the minimum confidence level for the labels to
  /// return. Amazon Rekognition doesn't return any labels with a confidence
  /// level lower than this specified value.
  ///
  /// If you don't specify `MinConfidence`, the operation returns labels with
  /// confidence values greater than or equal to 50 percent.
  Future<DetectModerationLabelsResponse> detectModerationLabels(Image image,
      {double minConfidence}) async {
    return DetectModerationLabelsResponse.fromJson({});
  }

  /// Detects text in the input image and converts it into machine-readable
  /// text.
  ///
  /// Pass the input image as base64-encoded image bytes or as a reference to an
  /// image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon
  /// Rekognition operations, you must pass it as a reference to an image in an
  /// Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported.
  /// The image must be either a .png or .jpeg formatted file.
  ///
  /// The `DetectText` operation returns text in an array of TextDetection
  /// elements, `TextDetections`. Each `TextDetection` element provides
  /// information about a single word or line of text that was detected in the
  /// image.
  ///
  /// A word is one or more ISO basic latin script characters that are not
  /// separated by spaces. `DetectText` can detect up to 50 words in an image.
  ///
  /// A line is a string of equally spaced words. A line isn't necessarily a
  /// complete sentence. For example, a driver's license number is detected as a
  /// line. A line ends when there is no aligned text after it. Also, a line
  /// ends when there is a large gap between words, relative to the length of
  /// the words. This means, depending on the gap between words, Amazon
  /// Rekognition may detect multiple lines in text aligned in the same
  /// direction. Periods don't represent the end of a line. If a sentence spans
  /// multiple lines, the `DetectText` operation returns multiple lines.
  ///
  /// To determine whether a `TextDetection` element is a line of text or a
  /// word, use the `TextDetection` object `Type` field.
  ///
  /// To be detected, text must be within +/- 90 degrees orientation of the
  /// horizontal axis.
  ///
  /// For more information, see DetectText in the Amazon Rekognition Developer
  /// Guide.
  ///
  /// [image]: The input image as base64-encoded bytes or an Amazon S3 object.
  /// If you use the AWS CLI to call Amazon Rekognition operations, you can't
  /// pass image bytes.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  Future<DetectTextResponse> detectText(Image image) async {
    return DetectTextResponse.fromJson({});
  }

  /// Gets the name and additional information about a celebrity based on his or
  /// her Amazon Rekognition ID. The additional information is returned as an
  /// array of URLs. If there is no additional information about the celebrity,
  /// this list is empty.
  ///
  /// For more information, see Recognizing Celebrities in an Image in the
  /// Amazon Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:GetCelebrityInfo` action.
  ///
  /// [id]: The ID for the celebrity. You get the celebrity ID from a call to
  /// the RecognizeCelebrities operation, which recognizes celebrities in an
  /// image.
  Future<GetCelebrityInfoResponse> getCelebrityInfo(String id) async {
    return GetCelebrityInfoResponse.fromJson({});
  }

  /// Gets the celebrity recognition results for a Amazon Rekognition Video
  /// analysis started by StartCelebrityRecognition.
  ///
  /// Celebrity recognition in a video is an asynchronous operation. Analysis is
  /// started by a call to StartCelebrityRecognition which returns a job
  /// identifier (`JobId`). When the celebrity recognition operation finishes,
  /// Amazon Rekognition Video publishes a completion status to the Amazon
  /// Simple Notification Service topic registered in the initial call to
  /// `StartCelebrityRecognition`. To get the results of the celebrity
  /// recognition analysis, first check that the status value published to the
  /// Amazon SNS topic is `SUCCEEDED`. If so, call `GetCelebrityDetection` and
  /// pass the job identifier (`JobId`) from the initial call to
  /// `StartCelebrityDetection`.
  ///
  /// For more information, see Working With Stored Videos in the Amazon
  /// Rekognition Developer Guide.
  ///
  ///  `GetCelebrityRecognition` returns detected celebrities and the time(s)
  /// they are detected in an array (`Celebrities`) of CelebrityRecognition
  /// objects. Each `CelebrityRecognition` contains information about the
  /// celebrity in a CelebrityDetail object and the time, `Timestamp`, the
  /// celebrity was detected.
  ///
  ///   `GetCelebrityRecognition` only returns the default facial attributes
  /// (`BoundingBox`, `Confidence`, `Landmarks`, `Pose`, and `Quality`). The
  /// other facial attributes listed in the `Face` object of the following
  /// response syntax are not returned. For more information, see FaceDetail in
  /// the Amazon Rekognition Developer Guide.
  ///
  /// By default, the `Celebrities` array is sorted by time (milliseconds from
  /// the start of the video). You can also sort the array by celebrity by
  /// specifying the value `ID` in the `SortBy` input parameter.
  ///
  /// The `CelebrityDetail` object includes the celebrity identifer and
  /// additional information urls. If you don't store the additional information
  /// urls, you can get them later by calling GetCelebrityInfo with the
  /// celebrity identifer.
  ///
  /// No information is returned for faces not recognized as celebrities.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in `MaxResults`, the value of `NextToken`
  /// in the operation response contains a pagination token for getting the next
  /// set of results. To get the next page of results, call
  /// `GetCelebrityDetection` and populate the `NextToken` request parameter
  /// with the token value returned from the previous call to
  /// `GetCelebrityRecognition`.
  ///
  /// [jobId]: Job identifier for the required celebrity recognition analysis.
  /// You can get the job identifer from a call to `StartCelebrityRecognition`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there is
  /// more recognized celebrities to retrieve), Amazon Rekognition Video returns
  /// a pagination token in the response. You can use this pagination token to
  /// retrieve the next set of celebrities.
  ///
  /// [sortBy]: Sort to use for celebrities returned in `Celebrities` field.
  /// Specify `ID` to sort by the celebrity identifier, specify `TIMESTAMP` to
  /// sort by the time the celebrity was recognized.
  Future<GetCelebrityRecognitionResponse> getCelebrityRecognition(String jobId,
      {int maxResults, String nextToken, String sortBy}) async {
    return GetCelebrityRecognitionResponse.fromJson({});
  }

  /// Gets the unsafe content analysis results for a Amazon Rekognition Video
  /// analysis started by StartContentModeration.
  ///
  /// Unsafe content analysis of a video is an asynchronous operation. You start
  /// analysis by calling StartContentModeration which returns a job identifier
  /// (`JobId`). When analysis finishes, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic
  /// registered in the initial call to `StartContentModeration`. To get the
  /// results of the unsafe content analysis, first check that the status value
  /// published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// `GetContentModeration` and pass the job identifier (`JobId`) from the
  /// initial call to `StartContentModeration`.
  ///
  /// For more information, see Working with Stored Videos in the Amazon
  /// Rekognition Devlopers Guide.
  ///
  ///  `GetContentModeration` returns detected unsafe content labels, and the
  /// time they are detected, in an array, `ModerationLabels`, of
  /// ContentModerationDetection objects.
  ///
  /// By default, the moderated labels are returned sorted by time, in
  /// milliseconds from the start of the video. You can also sort them by
  /// moderated label by specifying `NAME` for the `SortBy` input parameter.
  ///
  /// Since video analysis can return a large number of results, use the
  /// `MaxResults` parameter to limit the number of labels returned in a single
  /// call to `GetContentModeration`. If there are more results than specified
  /// in `MaxResults`, the value of `NextToken` in the operation response
  /// contains a pagination token for getting the next set of results. To get
  /// the next page of results, call `GetContentModeration` and populate the
  /// `NextToken` request parameter with the value of `NextToken` returned from
  /// the previous call to `GetContentModeration`.
  ///
  /// For more information, see Detecting Unsafe Content in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// [jobId]: The identifier for the unsafe content job. Use `JobId` to
  /// identify the job in a subsequent call to `GetContentModeration`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there is
  /// more data to retrieve), Amazon Rekognition returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of unsafe content labels.
  ///
  /// [sortBy]: Sort to use for elements in the `ModerationLabelDetections`
  /// array. Use `TIMESTAMP` to sort array elements by the time labels are
  /// detected. Use `NAME` to alphabetically group elements for a label
  /// together. Within each label group, the array element are sorted by
  /// detection confidence. The default sort is by `TIMESTAMP`.
  Future<GetContentModerationResponse> getContentModeration(String jobId,
      {int maxResults, String nextToken, String sortBy}) async {
    return GetContentModerationResponse.fromJson({});
  }

  /// Gets face detection results for a Amazon Rekognition Video analysis
  /// started by StartFaceDetection.
  ///
  /// Face detection with Amazon Rekognition Video is an asynchronous operation.
  /// You start face detection by calling StartFaceDetection which returns a job
  /// identifier (`JobId`). When the face detection operation finishes, Amazon
  /// Rekognition Video publishes a completion status to the Amazon Simple
  /// Notification Service topic registered in the initial call to
  /// `StartFaceDetection`. To get the results of the face detection operation,
  /// first check that the status value published to the Amazon SNS topic is
  /// `SUCCEEDED`. If so, call GetFaceDetection and pass the job identifier
  /// (`JobId`) from the initial call to `StartFaceDetection`.
  ///
  ///  `GetFaceDetection` returns an array of detected faces (`Faces`) sorted by
  /// the time the faces were detected.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in `MaxResults`, the value of `NextToken`
  /// in the operation response contains a pagination token for getting the next
  /// set of results. To get the next page of results, call `GetFaceDetection`
  /// and populate the `NextToken` request parameter with the token value
  /// returned from the previous call to `GetFaceDetection`.
  ///
  /// [jobId]: Unique identifier for the face detection job. The `JobId` is
  /// returned from `StartFaceDetection`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more faces to retrieve), Amazon Rekognition Video returns a pagination
  /// token in the response. You can use this pagination token to retrieve the
  /// next set of faces.
  Future<GetFaceDetectionResponse> getFaceDetection(String jobId,
      {int maxResults, String nextToken}) async {
    return GetFaceDetectionResponse.fromJson({});
  }

  /// Gets the face search results for Amazon Rekognition Video face search
  /// started by StartFaceSearch. The search returns faces in a collection that
  /// match the faces of persons detected in a video. It also includes the
  /// time(s) that faces are matched in the video.
  ///
  /// Face search in a video is an asynchronous operation. You start face search
  /// by calling to StartFaceSearch which returns a job identifier (`JobId`).
  /// When the search operation finishes, Amazon Rekognition Video publishes a
  /// completion status to the Amazon Simple Notification Service topic
  /// registered in the initial call to `StartFaceSearch`. To get the search
  /// results, first check that the status value published to the Amazon SNS
  /// topic is `SUCCEEDED`. If so, call `GetFaceSearch` and pass the job
  /// identifier (`JobId`) from the initial call to `StartFaceSearch`.
  ///
  /// For more information, see Searching Faces in a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// The search results are retured in an array, `Persons`, of PersonMatch
  /// objects. Each`PersonMatch` element contains details about the matching
  /// faces in the input collection, person information (facial attributes,
  /// bounding boxes, and person identifer) for the matched person, and the time
  /// the person was matched in the video.
  ///
  ///   `GetFaceSearch` only returns the default facial attributes
  /// (`BoundingBox`, `Confidence`, `Landmarks`, `Pose`, and `Quality`). The
  /// other facial attributes listed in the `Face` object of the following
  /// response syntax are not returned. For more information, see FaceDetail in
  /// the Amazon Rekognition Developer Guide.
  ///
  /// By default, the `Persons` array is sorted by the time, in milliseconds
  /// from the start of the video, persons are matched. You can also sort by
  /// persons by specifying `INDEX` for the `SORTBY` input parameter.
  ///
  /// [jobId]: The job identifer for the search request. You get the job
  /// identifier from an initial call to `StartFaceSearch`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there is
  /// more search results to retrieve), Amazon Rekognition Video returns a
  /// pagination token in the response. You can use this pagination token to
  /// retrieve the next set of search results.
  ///
  /// [sortBy]: Sort to use for grouping faces in the response. Use `TIMESTAMP`
  /// to group faces by the time that they are recognized. Use `INDEX` to sort
  /// by recognized faces.
  Future<GetFaceSearchResponse> getFaceSearch(String jobId,
      {int maxResults, String nextToken, String sortBy}) async {
    return GetFaceSearchResponse.fromJson({});
  }

  /// Gets the label detection results of a Amazon Rekognition Video analysis
  /// started by StartLabelDetection.
  ///
  /// The label detection operation is started by a call to StartLabelDetection
  /// which returns a job identifier (`JobId`). When the label detection
  /// operation finishes, Amazon Rekognition publishes a completion status to
  /// the Amazon Simple Notification Service topic registered in the initial
  /// call to `StartlabelDetection`. To get the results of the label detection
  /// operation, first check that the status value published to the Amazon SNS
  /// topic is `SUCCEEDED`. If so, call GetLabelDetection and pass the job
  /// identifier (`JobId`) from the initial call to `StartLabelDetection`.
  ///
  ///  `GetLabelDetection` returns an array of detected labels (`Labels`) sorted
  /// by the time the labels were detected. You can also sort by the label name
  /// by specifying `NAME` for the `SortBy` input parameter.
  ///
  /// The labels returned include the label name, the percentage confidence in
  /// the accuracy of the detected label, and the time the label was detected in
  /// the video.
  ///
  /// The returned labels also include bounding box information for common
  /// objects, a hierarchical taxonomy of detected labels, and the version of
  /// the label model used for detection.
  ///
  /// Use MaxResults parameter to limit the number of labels returned. If there
  /// are more results than specified in `MaxResults`, the value of `NextToken`
  /// in the operation response contains a pagination token for getting the next
  /// set of results. To get the next page of results, call `GetlabelDetection`
  /// and populate the `NextToken` request parameter with the token value
  /// returned from the previous call to `GetLabelDetection`.
  ///
  /// [jobId]: Job identifier for the label detection operation for which you
  /// want results returned. You get the job identifer from an initial call to
  /// `StartlabelDetection`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more labels to retrieve), Amazon Rekognition Video returns a pagination
  /// token in the response. You can use this pagination token to retrieve the
  /// next set of labels.
  ///
  /// [sortBy]: Sort to use for elements in the `Labels` array. Use `TIMESTAMP`
  /// to sort array elements by the time labels are detected. Use `NAME` to
  /// alphabetically group elements for a label together. Within each label
  /// group, the array element are sorted by detection confidence. The default
  /// sort is by `TIMESTAMP`.
  Future<GetLabelDetectionResponse> getLabelDetection(String jobId,
      {int maxResults, String nextToken, String sortBy}) async {
    return GetLabelDetectionResponse.fromJson({});
  }

  /// Gets the path tracking results of a Amazon Rekognition Video analysis
  /// started by StartPersonTracking.
  ///
  /// The person path tracking operation is started by a call to
  /// `StartPersonTracking` which returns a job identifier (`JobId`). When the
  /// operation finishes, Amazon Rekognition Video publishes a completion status
  /// to the Amazon Simple Notification Service topic registered in the initial
  /// call to `StartPersonTracking`.
  ///
  /// To get the results of the person path tracking operation, first check that
  /// the status value published to the Amazon SNS topic is `SUCCEEDED`. If so,
  /// call GetPersonTracking and pass the job identifier (`JobId`) from the
  /// initial call to `StartPersonTracking`.
  ///
  ///  `GetPersonTracking` returns an array, `Persons`, of tracked persons and
  /// the time(s) their paths were tracked in the video.
  ///
  ///   `GetPersonTracking` only returns the default facial attributes
  /// (`BoundingBox`, `Confidence`, `Landmarks`, `Pose`, and `Quality`). The
  /// other facial attributes listed in the `Face` object of the following
  /// response syntax are not returned.
  ///
  /// For more information, see FaceDetail in the Amazon Rekognition Developer
  /// Guide.
  ///
  /// By default, the array is sorted by the time(s) a person's path is tracked
  /// in the video. You can sort by tracked persons by specifying `INDEX` for
  /// the `SortBy` input parameter.
  ///
  /// Use the `MaxResults` parameter to limit the number of items returned. If
  /// there are more results than specified in `MaxResults`, the value of
  /// `NextToken` in the operation response contains a pagination token for
  /// getting the next set of results. To get the next page of results, call
  /// `GetPersonTracking` and populate the `NextToken` request parameter with
  /// the token value returned from the previous call to `GetPersonTracking`.
  ///
  /// [jobId]: The identifier for a job that tracks persons in a video. You get
  /// the `JobId` from a call to `StartPersonTracking`.
  ///
  /// [maxResults]: Maximum number of results to return per paginated call. The
  /// largest value you can specify is 1000. If you specify a value greater than
  /// 1000, a maximum of 1000 results is returned. The default value is 1000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more persons to retrieve), Amazon Rekognition Video returns a pagination
  /// token in the response. You can use this pagination token to retrieve the
  /// next set of persons.
  ///
  /// [sortBy]: Sort to use for elements in the `Persons` array. Use `TIMESTAMP`
  /// to sort array elements by the time persons are detected. Use `INDEX` to
  /// sort by the tracked persons. If you sort by `INDEX`, the array elements
  /// for each person are sorted by detection confidence. The default sort is by
  /// `TIMESTAMP`.
  Future<GetPersonTrackingResponse> getPersonTracking(String jobId,
      {int maxResults, String nextToken, String sortBy}) async {
    return GetPersonTrackingResponse.fromJson({});
  }

  /// Detects faces in the input image and adds them to the specified
  /// collection.
  ///
  /// Amazon Rekognition doesn't save the actual faces that are detected.
  /// Instead, the underlying detection algorithm first detects the faces in the
  /// input image. For each face, the algorithm extracts facial features into a
  /// feature vector, and stores it in the backend database. Amazon Rekognition
  /// uses feature vectors when it performs face match and search operations
  /// using the SearchFaces and SearchFacesByImage operations.
  ///
  /// For more information, see Adding Faces to a Collection in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// To get the number of faces in a collection, call DescribeCollection.
  ///
  /// If you're using version 1.0 of the face detection model, `IndexFaces`
  /// indexes the 15 largest faces in the input image. Later versions of the
  /// face detection model index the 100 largest faces in the input image.
  ///
  /// If you're using version 4 or later of the face model, image orientation
  /// information is not returned in the `OrientationCorrection` field.
  ///
  /// To determine which version of the model you're using, call
  /// DescribeCollection and supply the collection ID. You can also get the
  /// model version from the value of `FaceModelVersion` in the response from
  /// `IndexFaces`
  ///
  /// For more information, see Model Versioning in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// If you provide the optional `ExternalImageID` for the input image you
  /// provided, Amazon Rekognition associates this ID with all faces that it
  /// detects. When you call the ListFaces operation, the response returns the
  /// external ID. You can use this external image ID to create a client-side
  /// index to associate the faces with each image. You can then use the index
  /// to find all faces in an image.
  ///
  /// You can specify the maximum number of faces to index with the `MaxFaces`
  /// input parameter. This is useful when you want to index the largest faces
  /// in an image and don't want to index smaller faces, such as those belonging
  /// to people standing in the background.
  ///
  /// The `QualityFilter` input parameter allows you to filter out detected
  /// faces that don’t meet the required quality bar chosen by Amazon
  /// Rekognition. The quality bar is based on a variety of common use cases. By
  /// default, `IndexFaces` filters detected faces. You can also explicitly
  /// filter detected faces by specifying `AUTO` for the value of
  /// `QualityFilter`. If you do not want to filter detected faces, specify
  /// `NONE`.
  ///
  ///  To use quality filtering, you need a collection associated with version 3
  /// of the face model. To get the version of the face model associated with a
  /// collection, call DescribeCollection.
  ///
  /// Information about faces detected in an image, but not indexed, is returned
  /// in an array of UnindexedFace objects, `UnindexedFaces`. Faces aren't
  /// indexed for reasons such as:
  ///
  /// *   The number of faces detected exceeds the value of the `MaxFaces`
  /// request parameter.
  ///
  /// *   The face is too small compared to the image dimensions.
  ///
  /// *   The face is too blurry.
  ///
  /// *   The image is too dark.
  ///
  /// *   The face has an extreme pose.
  ///
  ///
  /// In response, the `IndexFaces` operation returns an array of metadata for
  /// all detected faces, `FaceRecords`. This includes:
  ///
  /// *   The bounding box, `BoundingBox`, of the detected face.
  ///
  /// *   A confidence value, `Confidence`, which indicates the confidence that
  /// the bounding box contains a face.
  ///
  /// *   A face ID, `FaceId`, assigned by the service for each face that's
  /// detected and stored.
  ///
  /// *   An image ID, `ImageId`, assigned by the service for the input image.
  ///
  ///
  /// If you request all facial attributes (by using the `detectionAttributes`
  /// parameter), Amazon Rekognition returns detailed facial attributes, such as
  /// facial landmarks (for example, location of eye and mouth) and other facial
  /// attributes like gender. If you provide the same image, specify the same
  /// collection, and use the same external ID in the `IndexFaces` operation,
  /// Amazon Rekognition doesn't save duplicate face metadata.
  ///
  /// The input image is passed either as base64-encoded image bytes, or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes isn't supported.
  /// The image must be formatted as a PNG or JPEG file.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:IndexFaces` action.
  ///
  /// [collectionId]: The ID of an existing collection to which you want to add
  /// the faces that are detected in the input images.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes isn't supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [externalImageId]: The ID you want to assign to all the faces detected in
  /// the image.
  ///
  /// [detectionAttributes]: An array of facial attributes that you want to be
  /// returned. This can be the default list of attributes or all attributes. If
  /// you don't specify a value for `Attributes` or if you specify
  /// `\["DEFAULT"\]`, the API returns the following subset of facial
  /// attributes: `BoundingBox`, `Confidence`, `Pose`, `Quality`, and
  /// `Landmarks`. If you provide `\["ALL"\]`, all facial attributes are
  /// returned, but the operation takes longer to complete.
  ///
  /// If you provide both, `\["ALL", "DEFAULT"\]`, the service uses a logical
  /// AND operator to determine which attributes to return (in this case, all
  /// attributes).
  ///
  /// [maxFaces]: The maximum number of faces to index. The value of `MaxFaces`
  /// must be greater than or equal to 1. `IndexFaces` returns no more than 100
  /// detected faces in an image, even if you specify a larger value for
  /// `MaxFaces`.
  ///
  /// If `IndexFaces` detects more faces than the value of `MaxFaces`, the faces
  /// with the lowest quality are filtered out first. If there are still more
  /// faces than the value of `MaxFaces`, the faces with the smallest bounding
  /// boxes are filtered out (up to the number that's needed to satisfy the
  /// value of `MaxFaces`). Information about the unindexed faces is available
  /// in the `UnindexedFaces` array.
  ///
  /// The faces that are returned by `IndexFaces` are sorted by the largest face
  /// bounding box size to the smallest size, in descending order.
  ///
  ///  `MaxFaces` can be used with a collection associated with any version of
  /// the face model.
  ///
  /// [qualityFilter]: A filter that specifies how much filtering is done to
  /// identify faces that are detected with low quality. Filtered faces aren't
  /// indexed. If you specify `AUTO`, filtering prioritizes the identification
  /// of faces that don’t meet the required quality bar chosen by Amazon
  /// Rekognition. The quality bar is based on a variety of common use cases.
  /// Low-quality detections can occur for a number of reasons. Some examples
  /// are an object that's misidentified as a face, a face that's too blurry, or
  /// a face with a pose that's too extreme to use. If you specify `NONE`, no
  /// filtering is performed. The default value is AUTO.
  ///
  /// To use quality filtering, the collection you are using must be associated
  /// with version 3 of the face model.
  Future<IndexFacesResponse> indexFaces(
      {@required String collectionId,
      @required Image image,
      String externalImageId,
      List<String> detectionAttributes,
      int maxFaces,
      String qualityFilter}) async {
    return IndexFacesResponse.fromJson({});
  }

  /// Returns list of collection IDs in your account. If the result is
  /// truncated, the response also provides a `NextToken` that you can use in
  /// the subsequent request to fetch the next set of collection IDs.
  ///
  /// For an example, see Listing Collections in the Amazon Rekognition
  /// Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:ListCollections` action.
  ///
  /// [nextToken]: Pagination token from the previous response.
  ///
  /// [maxResults]: Maximum number of collection IDs to return.
  Future<ListCollectionsResponse> listCollections(
      {String nextToken, int maxResults}) async {
    return ListCollectionsResponse.fromJson({});
  }

  /// Returns metadata for faces in the specified collection. This metadata
  /// includes information such as the bounding box coordinates, the confidence
  /// (that the bounding box contains a face), and face ID. For an example, see
  /// Listing Faces in a Collection in the Amazon Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the `rekognition:ListFaces`
  /// action.
  ///
  /// [collectionId]: ID of the collection from which to list the faces.
  ///
  /// [nextToken]: If the previous response was incomplete (because there is
  /// more data to retrieve), Amazon Rekognition returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of faces.
  ///
  /// [maxResults]: Maximum number of faces to return.
  Future<ListFacesResponse> listFaces(String collectionId,
      {String nextToken, int maxResults}) async {
    return ListFacesResponse.fromJson({});
  }

  /// Gets a list of stream processors that you have created with
  /// CreateStreamProcessor.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more stream processors to retrieve), Amazon Rekognition Video returns a
  /// pagination token in the response. You can use this pagination token to
  /// retrieve the next set of stream processors.
  ///
  /// [maxResults]: Maximum number of stream processors you want Amazon
  /// Rekognition Video to return in the response. The default is 1000.
  Future<ListStreamProcessorsResponse> listStreamProcessors(
      {String nextToken, int maxResults}) async {
    return ListStreamProcessorsResponse.fromJson({});
  }

  /// Returns an array of celebrities recognized in the input image. For more
  /// information, see Recognizing Celebrities in the Amazon Rekognition
  /// Developer Guide.
  ///
  ///  `RecognizeCelebrities` returns the 100 largest faces in the image. It
  /// lists recognized celebrities in the `CelebrityFaces` array and
  /// unrecognized faces in the `UnrecognizedFaces` array.
  /// `RecognizeCelebrities` doesn't return celebrities whose faces aren't among
  /// the largest 100 faces in the image.
  ///
  /// For each celebrity recognized, `RecognizeCelebrities` returns a
  /// `Celebrity` object. The `Celebrity` object contains the celebrity name,
  /// ID, URL links to additional information, match confidence, and a
  /// `ComparedFace` object that you can use to locate the celebrity's face on
  /// the image.
  ///
  /// Amazon Rekognition doesn't retain information about which images a
  /// celebrity has been recognized in. Your application must store this
  /// information and use the `Celebrity` ID property as a unique identifier for
  /// the celebrity. If you don't store the celebrity name or additional
  /// information URLs returned by `RecognizeCelebrities`, you will need the ID
  /// to identify the celebrity in a call to the GetCelebrityInfo operation.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  /// For an example, see Recognizing Celebrities in an Image in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:RecognizeCelebrities` operation.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  Future<RecognizeCelebritiesResponse> recognizeCelebrities(Image image) async {
    return RecognizeCelebritiesResponse.fromJson({});
  }

  /// For a given input face ID, searches for matching faces in the collection
  /// the face belongs to. You get a face ID when you add a face to the
  /// collection using the IndexFaces operation. The operation compares the
  /// features of the input face with faces in the specified collection.
  ///
  ///  You can also search faces without indexing faces by using the
  /// `SearchFacesByImage` operation.
  ///
  ///  The operation response returns an array of faces that match, ordered by
  /// similarity score with the highest similarity first. More specifically, it
  /// is an array of metadata for each face match that is found. Along with the
  /// metadata, the response also includes a `confidence` value for each face
  /// match, indicating the confidence that the specific face matches the input
  /// face.
  ///
  /// For an example, see Searching for a Face Using Its Face ID in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:SearchFaces` action.
  ///
  /// [collectionId]: ID of the collection the face belongs to.
  ///
  /// [faceId]: ID of a face to find matches for in the collection.
  ///
  /// [maxFaces]: Maximum number of faces to return. The operation returns the
  /// maximum number of faces with the highest confidence in the match.
  ///
  /// [faceMatchThreshold]: Optional value specifying the minimum confidence in
  /// the face match to return. For example, don't return any matches where
  /// confidence in matches is less than 70%. The default value is 80%.
  Future<SearchFacesResponse> searchFaces(
      {@required String collectionId,
      @required String faceId,
      int maxFaces,
      double faceMatchThreshold}) async {
    return SearchFacesResponse.fromJson({});
  }

  /// For a given input image, first detects the largest face in the image, and
  /// then searches the specified collection for matching faces. The operation
  /// compares the features of the input face with faces in the specified
  /// collection.
  ///
  ///  To search for all faces in an input image, you might first call the
  /// IndexFaces operation, and then use the face IDs returned in subsequent
  /// calls to the SearchFaces operation.
  ///
  ///  You can also call the `DetectFaces` operation and use the bounding boxes
  /// in the response to make face crops, which then you can pass in to the
  /// `SearchFacesByImage` operation.
  ///
  /// You pass the input image either as base64-encoded image bytes or as a
  /// reference to an image in an Amazon S3 bucket. If you use the AWS CLI to
  /// call Amazon Rekognition operations, passing image bytes is not supported.
  /// The image must be either a PNG or JPEG formatted file.
  ///
  ///  The response returns an array of faces that match, ordered by similarity
  /// score with the highest similarity first. More specifically, it is an array
  /// of metadata for each face match found. Along with the metadata, the
  /// response also includes a `similarity` indicating how similar the face is
  /// to the input face. In the response, the operation also returns the
  /// bounding box (and a confidence level that the bounding box contains a
  /// face) of the face that Amazon Rekognition used for the input image.
  ///
  /// For an example, Searching for a Face Using an Image in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// This operation requires permissions to perform the
  /// `rekognition:SearchFacesByImage` action.
  ///
  /// [collectionId]: ID of the collection to search.
  ///
  /// [image]: The input image as base64-encoded bytes or an S3 object. If you
  /// use the AWS CLI to call Amazon Rekognition operations, passing
  /// base64-encoded image bytes is not supported.
  ///
  /// If you are using an AWS SDK to call Amazon Rekognition, you might not need
  /// to base64-encode image bytes passed using the `Bytes` field. For more
  /// information, see Images in the Amazon Rekognition developer guide.
  ///
  /// [maxFaces]: Maximum number of faces to return. The operation returns the
  /// maximum number of faces with the highest confidence in the match.
  ///
  /// [faceMatchThreshold]: (Optional) Specifies the minimum confidence in the
  /// face match to return. For example, don't return any matches where
  /// confidence in matches is less than 70%. The default value is 80%.
  Future<SearchFacesByImageResponse> searchFacesByImage(
      {@required String collectionId,
      @required Image image,
      int maxFaces,
      double faceMatchThreshold}) async {
    return SearchFacesByImageResponse.fromJson({});
  }

  /// Starts asynchronous recognition of celebrities in a stored video.
  ///
  /// Amazon Rekognition Video can detect celebrities in a video must be stored
  /// in an Amazon S3 bucket. Use Video to specify the bucket name and the
  /// filename of the video. `StartCelebrityRecognition` returns a job
  /// identifier (`JobId`) which you use to get the results of the analysis.
  /// When celebrity recognition analysis is finished, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic that you specify in `NotificationChannel`. To get the results of the
  /// celebrity recognition analysis, first check that the status value
  /// published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// GetCelebrityRecognition and pass the job identifier (`JobId`) from the
  /// initial call to `StartCelebrityRecognition`.
  ///
  /// For more information, see Recognizing Celebrities in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// [video]: The video in which you want to recognize celebrities. The video
  /// must be stored in an Amazon S3 bucket.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartCelebrityRecognition`
  /// requests, the same `JobId` is returned. Use `ClientRequestToken` to
  /// prevent the same job from being accidently started more than once.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN that you want Amazon
  /// Rekognition Video to publish the completion status of the celebrity
  /// recognition analysis to.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartCelebrityRecognitionResponse> startCelebrityRecognition(
      Video video,
      {String clientRequestToken,
      NotificationChannel notificationChannel,
      String jobTag}) async {
    return StartCelebrityRecognitionResponse.fromJson({});
  }

  ///  Starts asynchronous detection of unsafe content in a stored video.
  ///
  /// Amazon Rekognition Video can moderate content in a video stored in an
  /// Amazon S3 bucket. Use Video to specify the bucket name and the filename of
  /// the video. `StartContentModeration` returns a job identifier (`JobId`)
  /// which you use to get the results of the analysis. When unsafe content
  /// analysis is finished, Amazon Rekognition Video publishes a completion
  /// status to the Amazon Simple Notification Service topic that you specify in
  /// `NotificationChannel`.
  ///
  /// To get the results of the unsafe content analysis, first check that the
  /// status value published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// GetContentModeration and pass the job identifier (`JobId`) from the
  /// initial call to `StartContentModeration`.
  ///
  /// For more information, see Detecting Unsafe Content in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// [video]: The video in which you want to detect unsafe content. The video
  /// must be stored in an Amazon S3 bucket.
  ///
  /// [minConfidence]: Specifies the minimum confidence that Amazon Rekognition
  /// must have in order to return a moderated content label. Confidence
  /// represents how certain Amazon Rekognition is that the moderated content is
  /// correctly identified. 0 is the lowest confidence. 100 is the highest
  /// confidence. Amazon Rekognition doesn't return any moderated content labels
  /// with a confidence level lower than this specified value. If you don't
  /// specify `MinConfidence`, `GetContentModeration` returns labels with
  /// confidence values greater than or equal to 50 percent.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartContentModeration` requests,
  /// the same `JobId` is returned. Use `ClientRequestToken` to prevent the same
  /// job from being accidently started more than once.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN that you want Amazon
  /// Rekognition Video to publish the completion status of the unsafe content
  /// analysis to.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartContentModerationResponse> startContentModeration(Video video,
      {double minConfidence,
      String clientRequestToken,
      NotificationChannel notificationChannel,
      String jobTag}) async {
    return StartContentModerationResponse.fromJson({});
  }

  /// Starts asynchronous detection of faces in a stored video.
  ///
  /// Amazon Rekognition Video can detect faces in a video stored in an Amazon
  /// S3 bucket. Use Video to specify the bucket name and the filename of the
  /// video. `StartFaceDetection` returns a job identifier (`JobId`) that you
  /// use to get the results of the operation. When face detection is finished,
  /// Amazon Rekognition Video publishes a completion status to the Amazon
  /// Simple Notification Service topic that you specify in
  /// `NotificationChannel`. To get the results of the face detection operation,
  /// first check that the status value published to the Amazon SNS topic is
  /// `SUCCEEDED`. If so, call GetFaceDetection and pass the job identifier
  /// (`JobId`) from the initial call to `StartFaceDetection`.
  ///
  /// For more information, see Detecting Faces in a Stored Video in the Amazon
  /// Rekognition Developer Guide.
  ///
  /// [video]: The video in which you want to detect faces. The video must be
  /// stored in an Amazon S3 bucket.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartFaceDetection` requests, the
  /// same `JobId` is returned. Use `ClientRequestToken` to prevent the same job
  /// from being accidently started more than once.
  ///
  /// [notificationChannel]: The ARN of the Amazon SNS topic to which you want
  /// Amazon Rekognition Video to publish the completion status of the face
  /// detection operation.
  ///
  /// [faceAttributes]: The face attributes you want returned.
  ///
  ///  `DEFAULT` \- The following subset of facial attributes are returned:
  /// BoundingBox, Confidence, Pose, Quality and Landmarks.
  ///
  ///  `ALL` \- All facial attributes are returned.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartFaceDetectionResponse> startFaceDetection(Video video,
      {String clientRequestToken,
      NotificationChannel notificationChannel,
      String faceAttributes,
      String jobTag}) async {
    return StartFaceDetectionResponse.fromJson({});
  }

  /// Starts the asynchronous search for faces in a collection that match the
  /// faces of persons detected in a stored video.
  ///
  /// The video must be stored in an Amazon S3 bucket. Use Video to specify the
  /// bucket name and the filename of the video. `StartFaceSearch` returns a job
  /// identifier (`JobId`) which you use to get the search results once the
  /// search has completed. When searching is finished, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic that you specify in `NotificationChannel`. To get the search
  /// results, first check that the status value published to the Amazon SNS
  /// topic is `SUCCEEDED`. If so, call GetFaceSearch and pass the job
  /// identifier (`JobId`) from the initial call to `StartFaceSearch`. For more
  /// information, see procedure-person-search-videos.
  ///
  /// [video]: The video you want to search. The video must be stored in an
  /// Amazon S3 bucket.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartFaceSearch` requests, the
  /// same `JobId` is returned. Use `ClientRequestToken` to prevent the same job
  /// from being accidently started more than once.
  ///
  /// [faceMatchThreshold]: The minimum confidence in the person match to
  /// return. For example, don't return any matches where confidence in matches
  /// is less than 70%. The default value is 80%.
  ///
  /// [collectionId]: ID of the collection that contains the faces you want to
  /// search for.
  ///
  /// [notificationChannel]: The ARN of the Amazon SNS topic to which you want
  /// Amazon Rekognition Video to publish the completion status of the search.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartFaceSearchResponse> startFaceSearch(
      {@required Video video,
      String clientRequestToken,
      double faceMatchThreshold,
      @required String collectionId,
      NotificationChannel notificationChannel,
      String jobTag}) async {
    return StartFaceSearchResponse.fromJson({});
  }

  /// Starts asynchronous detection of labels in a stored video.
  ///
  /// Amazon Rekognition Video can detect labels in a video. Labels are
  /// instances of real-world entities. This includes objects like flower, tree,
  /// and table; events like wedding, graduation, and birthday party; concepts
  /// like landscape, evening, and nature; and activities like a person getting
  /// out of a car or a person skiing.
  ///
  /// The video must be stored in an Amazon S3 bucket. Use Video to specify the
  /// bucket name and the filename of the video. `StartLabelDetection` returns a
  /// job identifier (`JobId`) which you use to get the results of the
  /// operation. When label detection is finished, Amazon Rekognition Video
  /// publishes a completion status to the Amazon Simple Notification Service
  /// topic that you specify in `NotificationChannel`.
  ///
  /// To get the results of the label detection operation, first check that the
  /// status value published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// GetLabelDetection and pass the job identifier (`JobId`) from the initial
  /// call to `StartLabelDetection`.
  ///
  /// [video]: The video in which you want to detect labels. The video must be
  /// stored in an Amazon S3 bucket.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartLabelDetection` requests,
  /// the same `JobId` is returned. Use `ClientRequestToken` to prevent the same
  /// job from being accidently started more than once.
  ///
  /// [minConfidence]: Specifies the minimum confidence that Amazon Rekognition
  /// Video must have in order to return a detected label. Confidence represents
  /// how certain Amazon Rekognition is that a label is correctly identified.0
  /// is the lowest confidence. 100 is the highest confidence. Amazon
  /// Rekognition Video doesn't return any labels with a confidence level lower
  /// than this specified value.
  ///
  /// If you don't specify `MinConfidence`, the operation returns labels with
  /// confidence values greater than or equal to 50 percent.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN you want Amazon
  /// Rekognition Video to publish the completion status of the label detection
  /// operation to.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartLabelDetectionResponse> startLabelDetection(Video video,
      {String clientRequestToken,
      double minConfidence,
      NotificationChannel notificationChannel,
      String jobTag}) async {
    return StartLabelDetectionResponse.fromJson({});
  }

  /// Starts the asynchronous tracking of a person's path in a stored video.
  ///
  /// Amazon Rekognition Video can track the path of people in a video stored in
  /// an Amazon S3 bucket. Use Video to specify the bucket name and the filename
  /// of the video. `StartPersonTracking` returns a job identifier (`JobId`)
  /// which you use to get the results of the operation. When label detection is
  /// finished, Amazon Rekognition publishes a completion status to the Amazon
  /// Simple Notification Service topic that you specify in
  /// `NotificationChannel`.
  ///
  /// To get the results of the person detection operation, first check that the
  /// status value published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// GetPersonTracking and pass the job identifier (`JobId`) from the initial
  /// call to `StartPersonTracking`.
  ///
  /// [video]: The video in which you want to detect people. The video must be
  /// stored in an Amazon S3 bucket.
  ///
  /// [clientRequestToken]: Idempotent token used to identify the start request.
  /// If you use the same token with multiple `StartPersonTracking` requests,
  /// the same `JobId` is returned. Use `ClientRequestToken` to prevent the same
  /// job from being accidently started more than once.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN you want Amazon
  /// Rekognition Video to publish the completion status of the people detection
  /// operation to.
  ///
  /// [jobTag]: An identifier you specify that's returned in the completion
  /// notification that's published to your Amazon Simple Notification Service
  /// topic. For example, you can use `JobTag` to group related jobs and
  /// identify them in the completion notification.
  Future<StartPersonTrackingResponse> startPersonTracking(Video video,
      {String clientRequestToken,
      NotificationChannel notificationChannel,
      String jobTag}) async {
    return StartPersonTrackingResponse.fromJson({});
  }

  /// Starts processing a stream processor. You create a stream processor by
  /// calling CreateStreamProcessor. To tell `StartStreamProcessor` which stream
  /// processor to start, use the value of the `Name` field specified in the
  /// call to `CreateStreamProcessor`.
  ///
  /// [name]: The name of the stream processor to start processing.
  Future<StartStreamProcessorResponse> startStreamProcessor(String name) async {
    return StartStreamProcessorResponse.fromJson({});
  }

  /// Stops a running stream processor that was created by
  /// CreateStreamProcessor.
  ///
  /// [name]: The name of a stream processor created by CreateStreamProcessor.
  Future<StopStreamProcessorResponse> stopStreamProcessor(String name) async {
    return StopStreamProcessorResponse.fromJson({});
  }
}

class AgeRange {
  /// The lowest estimated age.
  final int low;

  /// The highest estimated age.
  final int high;

  AgeRange({
    this.low,
    this.high,
  });
  static AgeRange fromJson(Map<String, dynamic> json) => AgeRange();
}

class Beard {
  /// Boolean value that indicates whether the face has beard or not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  Beard({
    this.value,
    this.confidence,
  });
  static Beard fromJson(Map<String, dynamic> json) => Beard();
}

class BoundingBox {
  /// Width of the bounding box as a ratio of the overall image width.
  final double width;

  /// Height of the bounding box as a ratio of the overall image height.
  final double height;

  /// Left coordinate of the bounding box as a ratio of overall image width.
  final double left;

  /// Top coordinate of the bounding box as a ratio of overall image height.
  final double top;

  BoundingBox({
    this.width,
    this.height,
    this.left,
    this.top,
  });
  static BoundingBox fromJson(Map<String, dynamic> json) => BoundingBox();
}

class Celebrity {
  /// An array of URLs pointing to additional information about the celebrity.
  /// If there is no additional information about the celebrity, this list is
  /// empty.
  final List<String> urls;

  /// The name of the celebrity.
  final String name;

  /// A unique identifier for the celebrity.
  final String id;

  /// Provides information about the celebrity's face, such as its location on
  /// the image.
  final ComparedFace face;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  final double matchConfidence;

  Celebrity({
    this.urls,
    this.name,
    this.id,
    this.face,
    this.matchConfidence,
  });
  static Celebrity fromJson(Map<String, dynamic> json) => Celebrity();
}

class CelebrityDetail {
  /// An array of URLs pointing to additional celebrity information.
  final List<String> urls;

  /// The name of the celebrity.
  final String name;

  /// The unique identifier for the celebrity.
  final String id;

  /// The confidence, in percentage, that Amazon Rekognition has that the
  /// recognized face is the celebrity.
  final double confidence;

  /// Bounding box around the body of a celebrity.
  final BoundingBox boundingBox;

  /// Face details for the recognized celebrity.
  final FaceDetail face;

  CelebrityDetail({
    this.urls,
    this.name,
    this.id,
    this.confidence,
    this.boundingBox,
    this.face,
  });
  static CelebrityDetail fromJson(Map<String, dynamic> json) =>
      CelebrityDetail();
}

class CelebrityRecognition {
  /// The time, in milliseconds from the start of the video, that the celebrity
  /// was recognized.
  final BigInt timestamp;

  /// Information about a recognized celebrity.
  final CelebrityDetail celebrity;

  CelebrityRecognition({
    this.timestamp,
    this.celebrity,
  });
  static CelebrityRecognition fromJson(Map<String, dynamic> json) =>
      CelebrityRecognition();
}

class CompareFacesMatch {
  /// Level of confidence that the faces match.
  final double similarity;

  /// Provides face metadata (bounding box and confidence that the bounding box
  /// actually contains a face).
  final ComparedFace face;

  CompareFacesMatch({
    this.similarity,
    this.face,
  });
  static CompareFacesMatch fromJson(Map<String, dynamic> json) =>
      CompareFacesMatch();
}

class CompareFacesResponse {
  /// The face in the source image that was used for comparison.
  final ComparedSourceImageFace sourceImageFace;

  /// An array of faces in the target image that match the source image face.
  /// Each `CompareFacesMatch` object provides the bounding box, the confidence
  /// level that the bounding box contains a face, and the similarity score for
  /// the face in the bounding box and the face in the source image.
  final List<CompareFacesMatch> faceMatches;

  /// An array of faces in the target image that did not match the source image
  /// face.
  final List<ComparedFace> unmatchedFaces;

  /// The value of `SourceImageOrientationCorrection` is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  final String sourceImageOrientationCorrection;

  /// The value of `TargetImageOrientationCorrection` is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  final String targetImageOrientationCorrection;

  CompareFacesResponse({
    this.sourceImageFace,
    this.faceMatches,
    this.unmatchedFaces,
    this.sourceImageOrientationCorrection,
    this.targetImageOrientationCorrection,
  });
  static CompareFacesResponse fromJson(Map<String, dynamic> json) =>
      CompareFacesResponse();
}

class ComparedFace {
  /// Bounding box of the face.
  final BoundingBox boundingBox;

  /// Level of confidence that what the bounding box contains is a face.
  final double confidence;

  /// An array of facial landmarks.
  final List<Landmark> landmarks;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  final Pose pose;

  /// Identifies face image brightness and sharpness.
  final ImageQuality quality;

  ComparedFace({
    this.boundingBox,
    this.confidence,
    this.landmarks,
    this.pose,
    this.quality,
  });
  static ComparedFace fromJson(Map<String, dynamic> json) => ComparedFace();
}

class ComparedSourceImageFace {
  /// Bounding box of the face.
  final BoundingBox boundingBox;

  /// Confidence level that the selected bounding box contains a face.
  final double confidence;

  ComparedSourceImageFace({
    this.boundingBox,
    this.confidence,
  });
  static ComparedSourceImageFace fromJson(Map<String, dynamic> json) =>
      ComparedSourceImageFace();
}

class ContentModerationDetection {
  /// Time, in milliseconds from the beginning of the video, that the unsafe
  /// content label was detected.
  final BigInt timestamp;

  /// The unsafe content label detected by in the stored video.
  final ModerationLabel moderationLabel;

  ContentModerationDetection({
    this.timestamp,
    this.moderationLabel,
  });
  static ContentModerationDetection fromJson(Map<String, dynamic> json) =>
      ContentModerationDetection();
}

class CreateCollectionResponse {
  /// HTTP status code indicating the result of the operation.
  final int statusCode;

  /// Amazon Resource Name (ARN) of the collection. You can use this to manage
  /// permissions on your resources.
  final String collectionArn;

  /// Version number of the face detection model associated with the collection
  /// you are creating.
  final String faceModelVersion;

  CreateCollectionResponse({
    this.statusCode,
    this.collectionArn,
    this.faceModelVersion,
  });
  static CreateCollectionResponse fromJson(Map<String, dynamic> json) =>
      CreateCollectionResponse();
}

class CreateStreamProcessorResponse {
  /// ARN for the newly create stream processor.
  final String streamProcessorArn;

  CreateStreamProcessorResponse({
    this.streamProcessorArn,
  });
  static CreateStreamProcessorResponse fromJson(Map<String, dynamic> json) =>
      CreateStreamProcessorResponse();
}

class DeleteCollectionResponse {
  /// HTTP status code that indicates the result of the operation.
  final int statusCode;

  DeleteCollectionResponse({
    this.statusCode,
  });
  static DeleteCollectionResponse fromJson(Map<String, dynamic> json) =>
      DeleteCollectionResponse();
}

class DeleteFacesResponse {
  /// An array of strings (face IDs) of the faces that were deleted.
  final List<String> deletedFaces;

  DeleteFacesResponse({
    this.deletedFaces,
  });
  static DeleteFacesResponse fromJson(Map<String, dynamic> json) =>
      DeleteFacesResponse();
}

class DeleteStreamProcessorResponse {
  DeleteStreamProcessorResponse();
  static DeleteStreamProcessorResponse fromJson(Map<String, dynamic> json) =>
      DeleteStreamProcessorResponse();
}

class DescribeCollectionResponse {
  /// The number of faces that are indexed into the collection. To index faces
  /// into a collection, use IndexFaces.
  final BigInt faceCount;

  /// The version of the face model that's used by the collection for face
  /// detection.
  ///
  /// For more information, see Model Versioning in the Amazon Rekognition
  /// Developer Guide.
  final String faceModelVersion;

  /// The Amazon Resource Name (ARN) of the collection.
  final String collectionArn;

  /// The number of milliseconds since the Unix epoch time until the creation of
  /// the collection. The Unix epoch time is 00:00:00 Coordinated Universal Time
  /// (UTC), Thursday, 1 January 1970.
  final DateTime creationTimestamp;

  DescribeCollectionResponse({
    this.faceCount,
    this.faceModelVersion,
    this.collectionArn,
    this.creationTimestamp,
  });
  static DescribeCollectionResponse fromJson(Map<String, dynamic> json) =>
      DescribeCollectionResponse();
}

class DescribeStreamProcessorResponse {
  /// Name of the stream processor.
  final String name;

  /// ARN of the stream processor.
  final String streamProcessorArn;

  /// Current status of the stream processor.
  final String status;

  /// Detailed status message about the stream processor.
  final String statusMessage;

  /// Date and time the stream processor was created
  final DateTime creationTimestamp;

  /// The time, in Unix format, the stream processor was last updated. For
  /// example, when the stream processor moves from a running state to a failed
  /// state, or when the user starts or stops the stream processor.
  final DateTime lastUpdateTimestamp;

  /// Kinesis video stream that provides the source streaming video.
  final StreamProcessorInput input;

  /// Kinesis data stream to which Amazon Rekognition Video puts the analysis
  /// results.
  final StreamProcessorOutput output;

  /// ARN of the IAM role that allows access to the stream processor.
  final String roleArn;

  /// Face recognition input parameters that are being used by the stream
  /// processor. Includes the collection to use for face recognition and the
  /// face attributes to detect.
  final StreamProcessorSettings settings;

  DescribeStreamProcessorResponse({
    this.name,
    this.streamProcessorArn,
    this.status,
    this.statusMessage,
    this.creationTimestamp,
    this.lastUpdateTimestamp,
    this.input,
    this.output,
    this.roleArn,
    this.settings,
  });
  static DescribeStreamProcessorResponse fromJson(Map<String, dynamic> json) =>
      DescribeStreamProcessorResponse();
}

class DetectFacesResponse {
  /// Details of each face found in the image.
  final List<FaceDetail> faceDetails;

  /// The value of `OrientationCorrection` is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  final String orientationCorrection;

  DetectFacesResponse({
    this.faceDetails,
    this.orientationCorrection,
  });
  static DetectFacesResponse fromJson(Map<String, dynamic> json) =>
      DetectFacesResponse();
}

class DetectLabelsResponse {
  /// An array of labels for the real-world objects detected.
  final List<Label> labels;

  /// The value of `OrientationCorrection` is always null.
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// file format (Exif) metadata that includes the image's orientation. Amazon
  /// Rekognition uses this orientation information to perform image correction.
  /// The bounding box coordinates are translated to represent object locations
  /// after the orientation information in the Exif metadata is used to correct
  /// the image orientation. Images in .png format don't contain Exif metadata.
  ///
  /// Amazon Rekognition doesn’t perform image correction for images in .png
  /// format and .jpeg images without orientation information in the image Exif
  /// metadata. The bounding box coordinates aren't translated and represent the
  /// object locations before the image is rotated.
  final String orientationCorrection;

  /// Version number of the label detection model that was used to detect
  /// labels.
  final String labelModelVersion;

  DetectLabelsResponse({
    this.labels,
    this.orientationCorrection,
    this.labelModelVersion,
  });
  static DetectLabelsResponse fromJson(Map<String, dynamic> json) =>
      DetectLabelsResponse();
}

class DetectModerationLabelsResponse {
  /// Array of detected Moderation labels and the time, in milliseconds from the
  /// start of the video, they were detected.
  final List<ModerationLabel> moderationLabels;

  /// Version number of the moderation detection model that was used to detect
  /// unsafe content.
  final String moderationModelVersion;

  DetectModerationLabelsResponse({
    this.moderationLabels,
    this.moderationModelVersion,
  });
  static DetectModerationLabelsResponse fromJson(Map<String, dynamic> json) =>
      DetectModerationLabelsResponse();
}

class DetectTextResponse {
  /// An array of text that was detected in the input image.
  final List<TextDetection> textDetections;

  DetectTextResponse({
    this.textDetections,
  });
  static DetectTextResponse fromJson(Map<String, dynamic> json) =>
      DetectTextResponse();
}

class Emotion {
  /// Type of emotion detected.
  final String type;

  /// Level of confidence in the determination.
  final double confidence;

  Emotion({
    this.type,
    this.confidence,
  });
  static Emotion fromJson(Map<String, dynamic> json) => Emotion();
}

class EyeOpen {
  /// Boolean value that indicates whether the eyes on the face are open.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  EyeOpen({
    this.value,
    this.confidence,
  });
  static EyeOpen fromJson(Map<String, dynamic> json) => EyeOpen();
}

class Eyeglasses {
  /// Boolean value that indicates whether the face is wearing eye glasses or
  /// not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  Eyeglasses({
    this.value,
    this.confidence,
  });
  static Eyeglasses fromJson(Map<String, dynamic> json) => Eyeglasses();
}

class Face {
  /// Unique identifier that Amazon Rekognition assigns to the face.
  final String faceId;

  /// Bounding box of the face.
  final BoundingBox boundingBox;

  /// Unique identifier that Amazon Rekognition assigns to the input image.
  final String imageId;

  /// Identifier that you assign to all the faces in the input image.
  final String externalImageId;

  /// Confidence level that the bounding box contains a face (and not a
  /// different object such as a tree).
  final double confidence;

  Face({
    this.faceId,
    this.boundingBox,
    this.imageId,
    this.externalImageId,
    this.confidence,
  });
  static Face fromJson(Map<String, dynamic> json) => Face();
}

class FaceDetail {
  /// Bounding box of the face. Default attribute.
  final BoundingBox boundingBox;

  /// The estimated age range, in years, for the face. Low represents the lowest
  /// estimated age and High represents the highest estimated age.
  final AgeRange ageRange;

  /// Indicates whether or not the face is smiling, and the confidence level in
  /// the determination.
  final Smile smile;

  /// Indicates whether or not the face is wearing eye glasses, and the
  /// confidence level in the determination.
  final Eyeglasses eyeglasses;

  /// Indicates whether or not the face is wearing sunglasses, and the
  /// confidence level in the determination.
  final Sunglasses sunglasses;

  /// Gender of the face and the confidence level in the determination.
  final Gender gender;

  /// Indicates whether or not the face has a beard, and the confidence level in
  /// the determination.
  final Beard beard;

  /// Indicates whether or not the face has a mustache, and the confidence level
  /// in the determination.
  final Mustache mustache;

  /// Indicates whether or not the eyes on the face are open, and the confidence
  /// level in the determination.
  final EyeOpen eyesOpen;

  /// Indicates whether or not the mouth on the face is open, and the confidence
  /// level in the determination.
  final MouthOpen mouthOpen;

  /// The emotions that appear to be expressed on the face, and the confidence
  /// level in the determination. The API is only making a determination of the
  /// physical appearance of a person's face. It is not a determination of the
  /// person’s internal emotional state and should not be used in such a way.
  /// For example, a person pretending to have a sad face might not be sad
  /// emotionally.
  final List<Emotion> emotions;

  /// Indicates the location of landmarks on the face. Default attribute.
  final List<Landmark> landmarks;

  /// Indicates the pose of the face as determined by its pitch, roll, and yaw.
  /// Default attribute.
  final Pose pose;

  /// Identifies image brightness and sharpness. Default attribute.
  final ImageQuality quality;

  /// Confidence level that the bounding box contains a face (and not a
  /// different object such as a tree). Default attribute.
  final double confidence;

  FaceDetail({
    this.boundingBox,
    this.ageRange,
    this.smile,
    this.eyeglasses,
    this.sunglasses,
    this.gender,
    this.beard,
    this.mustache,
    this.eyesOpen,
    this.mouthOpen,
    this.emotions,
    this.landmarks,
    this.pose,
    this.quality,
    this.confidence,
  });
  static FaceDetail fromJson(Map<String, dynamic> json) => FaceDetail();
}

class FaceDetection {
  /// Time, in milliseconds from the start of the video, that the face was
  /// detected.
  final BigInt timestamp;

  /// The face properties for the detected face.
  final FaceDetail face;

  FaceDetection({
    this.timestamp,
    this.face,
  });
  static FaceDetection fromJson(Map<String, dynamic> json) => FaceDetection();
}

class FaceMatch {
  /// Confidence in the match of this face with the input face.
  final double similarity;

  /// Describes the face properties such as the bounding box, face ID, image ID
  /// of the source image, and external image ID that you assigned.
  final Face face;

  FaceMatch({
    this.similarity,
    this.face,
  });
  static FaceMatch fromJson(Map<String, dynamic> json) => FaceMatch();
}

class FaceRecord {
  /// Describes the face properties such as the bounding box, face ID, image ID
  /// of the input image, and external image ID that you assigned.
  final Face face;

  /// Structure containing attributes of the face that the algorithm detected.
  final FaceDetail faceDetail;

  FaceRecord({
    this.face,
    this.faceDetail,
  });
  static FaceRecord fromJson(Map<String, dynamic> json) => FaceRecord();
}

class FaceSearchSettings {
  /// The ID of a collection that contains faces that you want to search for.
  final String collectionId;

  /// Minimum face match confidence score that must be met to return a result
  /// for a recognized face. Default is 70. 0 is the lowest confidence. 100 is
  /// the highest confidence.
  final double faceMatchThreshold;

  FaceSearchSettings({
    this.collectionId,
    this.faceMatchThreshold,
  });
  static FaceSearchSettings fromJson(Map<String, dynamic> json) =>
      FaceSearchSettings();
}

class Gender {
  /// Gender of the face.
  final String value;

  /// Level of confidence in the determination.
  final double confidence;

  Gender({
    this.value,
    this.confidence,
  });
  static Gender fromJson(Map<String, dynamic> json) => Gender();
}

class Geometry {
  /// An axis-aligned coarse representation of the detected text's location on
  /// the image.
  final BoundingBox boundingBox;

  /// Within the bounding box, a fine-grained polygon around the detected text.
  final List<Point> polygon;

  Geometry({
    this.boundingBox,
    this.polygon,
  });
  static Geometry fromJson(Map<String, dynamic> json) => Geometry();
}

class GetCelebrityInfoResponse {
  /// An array of URLs pointing to additional celebrity information.
  final List<String> urls;

  /// The name of the celebrity.
  final String name;

  GetCelebrityInfoResponse({
    this.urls,
    this.name,
  });
  static GetCelebrityInfoResponse fromJson(Map<String, dynamic> json) =>
      GetCelebrityInfoResponse();
}

class GetCelebrityRecognitionResponse {
  /// The current status of the celebrity recognition job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// `Videometadata` is returned in every page of paginated responses from a
  /// Amazon Rekognition Video operation.
  final VideoMetadata videoMetadata;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// celebrities.
  final String nextToken;

  /// Array of celebrities recognized in the video.
  final List<CelebrityRecognition> celebrities;

  GetCelebrityRecognitionResponse({
    this.jobStatus,
    this.statusMessage,
    this.videoMetadata,
    this.nextToken,
    this.celebrities,
  });
  static GetCelebrityRecognitionResponse fromJson(Map<String, dynamic> json) =>
      GetCelebrityRecognitionResponse();
}

class GetContentModerationResponse {
  /// The current status of the unsafe content analysis job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// Information about a video that Amazon Rekognition analyzed.
  /// `Videometadata` is returned in every page of paginated responses from
  /// `GetContentModeration`.
  final VideoMetadata videoMetadata;

  /// The detected unsafe content labels and the time(s) they were detected.
  final List<ContentModerationDetection> moderationLabels;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// unsafe content labels.
  final String nextToken;

  /// Version number of the moderation detection model that was used to detect
  /// unsafe content.
  final String moderationModelVersion;

  GetContentModerationResponse({
    this.jobStatus,
    this.statusMessage,
    this.videoMetadata,
    this.moderationLabels,
    this.nextToken,
    this.moderationModelVersion,
  });
  static GetContentModerationResponse fromJson(Map<String, dynamic> json) =>
      GetContentModerationResponse();
}

class GetFaceDetectionResponse {
  /// The current status of the face detection job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// `Videometadata` is returned in every page of paginated responses from a
  /// Amazon Rekognition video operation.
  final VideoMetadata videoMetadata;

  /// If the response is truncated, Amazon Rekognition returns this token that
  /// you can use in the subsequent request to retrieve the next set of faces.
  final String nextToken;

  /// An array of faces detected in the video. Each element contains a detected
  /// face's details and the time, in milliseconds from the start of the video,
  /// the face was detected.
  final List<FaceDetection> faces;

  GetFaceDetectionResponse({
    this.jobStatus,
    this.statusMessage,
    this.videoMetadata,
    this.nextToken,
    this.faces,
  });
  static GetFaceDetectionResponse fromJson(Map<String, dynamic> json) =>
      GetFaceDetectionResponse();
}

class GetFaceSearchResponse {
  /// The current status of the face search job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// search results.
  final String nextToken;

  /// Information about a video that Amazon Rekognition analyzed.
  /// `Videometadata` is returned in every page of paginated responses from a
  /// Amazon Rekognition Video operation.
  final VideoMetadata videoMetadata;

  /// An array of persons, PersonMatch, in the video whose face(s) match the
  /// face(s) in an Amazon Rekognition collection. It also includes time
  /// information for when persons are matched in the video. You specify the
  /// input collection in an initial call to `StartFaceSearch`. Each `Persons`
  /// element includes a time the person was matched, face match details
  /// (`FaceMatches`) for matching faces in the collection, and person
  /// information (`Person`) for the matched person.
  final List<PersonMatch> persons;

  GetFaceSearchResponse({
    this.jobStatus,
    this.statusMessage,
    this.nextToken,
    this.videoMetadata,
    this.persons,
  });
  static GetFaceSearchResponse fromJson(Map<String, dynamic> json) =>
      GetFaceSearchResponse();
}

class GetLabelDetectionResponse {
  /// The current status of the label detection job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// `Videometadata` is returned in every page of paginated responses from a
  /// Amazon Rekognition video operation.
  final VideoMetadata videoMetadata;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// labels.
  final String nextToken;

  /// An array of labels detected in the video. Each element contains the
  /// detected label and the time, in milliseconds from the start of the video,
  /// that the label was detected.
  final List<LabelDetection> labels;

  /// Version number of the label detection model that was used to detect
  /// labels.
  final String labelModelVersion;

  GetLabelDetectionResponse({
    this.jobStatus,
    this.statusMessage,
    this.videoMetadata,
    this.nextToken,
    this.labels,
    this.labelModelVersion,
  });
  static GetLabelDetectionResponse fromJson(Map<String, dynamic> json) =>
      GetLabelDetectionResponse();
}

class GetPersonTrackingResponse {
  /// The current status of the person tracking job.
  final String jobStatus;

  /// If the job fails, `StatusMessage` provides a descriptive error message.
  final String statusMessage;

  /// Information about a video that Amazon Rekognition Video analyzed.
  /// `Videometadata` is returned in every page of paginated responses from a
  /// Amazon Rekognition Video operation.
  final VideoMetadata videoMetadata;

  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// persons.
  final String nextToken;

  /// An array of the persons detected in the video and the time(s) their path
  /// was tracked throughout the video. An array element will exist for each
  /// time a person's path is tracked.
  final List<PersonDetection> persons;

  GetPersonTrackingResponse({
    this.jobStatus,
    this.statusMessage,
    this.videoMetadata,
    this.nextToken,
    this.persons,
  });
  static GetPersonTrackingResponse fromJson(Map<String, dynamic> json) =>
      GetPersonTrackingResponse();
}

class Image {
  /// Blob of image bytes up to 5 MBs.
  final Uint8List bytes;

  /// Identifies an S3 object as the image source.
  final S3Object s3Object;

  Image({
    this.bytes,
    this.s3Object,
  });
}

class ImageQuality {
  /// Value representing brightness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a brighter face
  /// image.
  final double brightness;

  /// Value representing sharpness of the face. The service returns a value
  /// between 0 and 100 (inclusive). A higher value indicates a sharper face
  /// image.
  final double sharpness;

  ImageQuality({
    this.brightness,
    this.sharpness,
  });
  static ImageQuality fromJson(Map<String, dynamic> json) => ImageQuality();
}

class IndexFacesResponse {
  /// An array of faces detected and added to the collection. For more
  /// information, see Searching Faces in a Collection in the Amazon Rekognition
  /// Developer Guide.
  final List<FaceRecord> faceRecords;

  /// If your collection is associated with a face detection model that's later
  /// than version 3.0, the value of `OrientationCorrection` is always null and
  /// no orientation information is returned.
  ///
  /// If your collection is associated with a face detection model that's
  /// version 3.0 or earlier, the following applies:
  ///
  /// *   If the input image is in .jpeg format, it might contain exchangeable
  /// image file format (Exif) metadata that includes the image's orientation.
  /// Amazon Rekognition uses this orientation information to perform image
  /// correction - the bounding box coordinates are translated to represent
  /// object locations after the orientation information in the Exif metadata is
  /// used to correct the image orientation. Images in .png format don't contain
  /// Exif metadata. The value of `OrientationCorrection` is null.
  ///
  /// *   If the image doesn't contain orientation information in its Exif
  /// metadata, Amazon Rekognition returns an estimated orientation (ROTATE\_0,
  /// ROTATE\_90, ROTATE\_180, ROTATE\_270). Amazon Rekognition doesn’t perform
  /// image correction for images. The bounding box coordinates aren't
  /// translated and represent the object locations before the image is rotated.
  ///
  ///
  /// Bounding box information is returned in the `FaceRecords` array. You can
  /// get the version of the face detection model by calling DescribeCollection.
  final String orientationCorrection;

  /// The version number of the face detection model that's associated with the
  /// input collection (`CollectionId`).
  final String faceModelVersion;

  /// An array of faces that were detected in the image but weren't indexed.
  /// They weren't indexed because the quality filter identified them as low
  /// quality, or the `MaxFaces` request parameter filtered them out. To use the
  /// quality filter, you specify the `QualityFilter` request parameter.
  final List<UnindexedFace> unindexedFaces;

  IndexFacesResponse({
    this.faceRecords,
    this.orientationCorrection,
    this.faceModelVersion,
    this.unindexedFaces,
  });
  static IndexFacesResponse fromJson(Map<String, dynamic> json) =>
      IndexFacesResponse();
}

class Instance {
  /// The position of the label instance on the image.
  final BoundingBox boundingBox;

  /// The confidence that Amazon Rekognition has in the accuracy of the bounding
  /// box.
  final double confidence;

  Instance({
    this.boundingBox,
    this.confidence,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance();
}

class KinesisDataStream {
  /// ARN of the output Amazon Kinesis Data Streams stream.
  final String arn;

  KinesisDataStream({
    this.arn,
  });
  static KinesisDataStream fromJson(Map<String, dynamic> json) =>
      KinesisDataStream();
}

class KinesisVideoStream {
  /// ARN of the Kinesis video stream stream that streams the source video.
  final String arn;

  KinesisVideoStream({
    this.arn,
  });
  static KinesisVideoStream fromJson(Map<String, dynamic> json) =>
      KinesisVideoStream();
}

class Label {
  /// The name (label) of the object or scene.
  final String name;

  /// Level of confidence.
  final double confidence;

  /// If `Label` represents an object, `Instances` contains the bounding boxes
  /// for each instance of the detected object. Bounding boxes are returned for
  /// common object labels such as people, cars, furniture, apparel or pets.
  final List<Instance> instances;

  /// The parent labels for a label. The response includes all ancestor labels.
  final List<Parent> parents;

  Label({
    this.name,
    this.confidence,
    this.instances,
    this.parents,
  });
  static Label fromJson(Map<String, dynamic> json) => Label();
}

class LabelDetection {
  /// Time, in milliseconds from the start of the video, that the label was
  /// detected.
  final BigInt timestamp;

  /// Details about the detected label.
  final Label label;

  LabelDetection({
    this.timestamp,
    this.label,
  });
  static LabelDetection fromJson(Map<String, dynamic> json) => LabelDetection();
}

class Landmark {
  /// Type of landmark.
  final String type;

  /// The x-coordinate from the top left of the landmark expressed as the ratio
  /// of the width of the image. For example, if the image is 700 x 200 and the
  /// x-coordinate of the landmark is at 350 pixels, this value is 0.5.
  final double x;

  /// The y-coordinate from the top left of the landmark expressed as the ratio
  /// of the height of the image. For example, if the image is 700 x 200 and the
  /// y-coordinate of the landmark is at 100 pixels, this value is 0.5.
  final double y;

  Landmark({
    this.type,
    this.x,
    this.y,
  });
  static Landmark fromJson(Map<String, dynamic> json) => Landmark();
}

class ListCollectionsResponse {
  /// An array of collection IDs.
  final List<String> collectionIds;

  /// If the result is truncated, the response provides a `NextToken` that you
  /// can use in the subsequent request to fetch the next set of collection IDs.
  final String nextToken;

  /// Version numbers of the face detection models associated with the
  /// collections in the array `CollectionIds`. For example, the value of
  /// `FaceModelVersions\[2\]` is the version number for the face detection
  /// model used by the collection in `CollectionId\[2\]`.
  final List<String> faceModelVersions;

  ListCollectionsResponse({
    this.collectionIds,
    this.nextToken,
    this.faceModelVersions,
  });
  static ListCollectionsResponse fromJson(Map<String, dynamic> json) =>
      ListCollectionsResponse();
}

class ListFacesResponse {
  /// An array of `Face` objects.
  final List<Face> faces;

  /// If the response is truncated, Amazon Rekognition returns this token that
  /// you can use in the subsequent request to retrieve the next set of faces.
  final String nextToken;

  /// Version number of the face detection model associated with the input
  /// collection (`CollectionId`).
  final String faceModelVersion;

  ListFacesResponse({
    this.faces,
    this.nextToken,
    this.faceModelVersion,
  });
  static ListFacesResponse fromJson(Map<String, dynamic> json) =>
      ListFacesResponse();
}

class ListStreamProcessorsResponse {
  /// If the response is truncated, Amazon Rekognition Video returns this token
  /// that you can use in the subsequent request to retrieve the next set of
  /// stream processors.
  final String nextToken;

  /// List of stream processors that you have created.
  final List<StreamProcessor> streamProcessors;

  ListStreamProcessorsResponse({
    this.nextToken,
    this.streamProcessors,
  });
  static ListStreamProcessorsResponse fromJson(Map<String, dynamic> json) =>
      ListStreamProcessorsResponse();
}

class ModerationLabel {
  /// Specifies the confidence that Amazon Rekognition has that the label has
  /// been correctly identified.
  ///
  /// If you don't specify the `MinConfidence` parameter in the call to
  /// `DetectModerationLabels`, the operation returns labels with a confidence
  /// value greater than or equal to 50 percent.
  final double confidence;

  /// The label name for the type of unsafe content detected in the image.
  final String name;

  /// The name for the parent label. Labels at the top level of the hierarchy
  /// have the parent label `""`.
  final String parentName;

  ModerationLabel({
    this.confidence,
    this.name,
    this.parentName,
  });
  static ModerationLabel fromJson(Map<String, dynamic> json) =>
      ModerationLabel();
}

class MouthOpen {
  /// Boolean value that indicates whether the mouth on the face is open or not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  MouthOpen({
    this.value,
    this.confidence,
  });
  static MouthOpen fromJson(Map<String, dynamic> json) => MouthOpen();
}

class Mustache {
  /// Boolean value that indicates whether the face has mustache or not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  Mustache({
    this.value,
    this.confidence,
  });
  static Mustache fromJson(Map<String, dynamic> json) => Mustache();
}

class NotificationChannel {
  /// The Amazon SNS topic to which Amazon Rekognition to posts the completion
  /// status.
  final String snsTopicArn;

  /// The ARN of an IAM role that gives Amazon Rekognition publishing
  /// permissions to the Amazon SNS topic.
  final String roleArn;

  NotificationChannel({
    @required this.snsTopicArn,
    @required this.roleArn,
  });
}

class Parent {
  /// The name of the parent label.
  final String name;

  Parent({
    this.name,
  });
  static Parent fromJson(Map<String, dynamic> json) => Parent();
}

class PersonDetail {
  /// Identifier for the person detected person within a video. Use to keep
  /// track of the person throughout the video. The identifier is not stored by
  /// Amazon Rekognition.
  final BigInt index;

  /// Bounding box around the detected person.
  final BoundingBox boundingBox;

  /// Face details for the detected person.
  final FaceDetail face;

  PersonDetail({
    this.index,
    this.boundingBox,
    this.face,
  });
  static PersonDetail fromJson(Map<String, dynamic> json) => PersonDetail();
}

class PersonDetection {
  /// The time, in milliseconds from the start of the video, that the person's
  /// path was tracked.
  final BigInt timestamp;

  /// Details about a person whose path was tracked in a video.
  final PersonDetail person;

  PersonDetection({
    this.timestamp,
    this.person,
  });
  static PersonDetection fromJson(Map<String, dynamic> json) =>
      PersonDetection();
}

class PersonMatch {
  /// The time, in milliseconds from the beginning of the video, that the person
  /// was matched in the video.
  final BigInt timestamp;

  /// Information about the matched person.
  final PersonDetail person;

  /// Information about the faces in the input collection that match the face of
  /// a person in the video.
  final List<FaceMatch> faceMatches;

  PersonMatch({
    this.timestamp,
    this.person,
    this.faceMatches,
  });
  static PersonMatch fromJson(Map<String, dynamic> json) => PersonMatch();
}

class Point {
  /// The value of the X coordinate for a point on a `Polygon`.
  final double x;

  /// The value of the Y coordinate for a point on a `Polygon`.
  final double y;

  Point({
    this.x,
    this.y,
  });
  static Point fromJson(Map<String, dynamic> json) => Point();
}

class Pose {
  /// Value representing the face rotation on the roll axis.
  final double roll;

  /// Value representing the face rotation on the yaw axis.
  final double yaw;

  /// Value representing the face rotation on the pitch axis.
  final double pitch;

  Pose({
    this.roll,
    this.yaw,
    this.pitch,
  });
  static Pose fromJson(Map<String, dynamic> json) => Pose();
}

class RecognizeCelebritiesResponse {
  /// Details about each celebrity found in the image. Amazon Rekognition can
  /// detect a maximum of 15 celebrities in an image.
  final List<Celebrity> celebrityFaces;

  /// Details about each unrecognized face in the image.
  final List<ComparedFace> unrecognizedFaces;

  /// The orientation of the input image (counterclockwise direction). If your
  /// application displays the image, you can use this value to correct the
  /// orientation. The bounding box coordinates returned in `CelebrityFaces` and
  /// `UnrecognizedFaces` represent face locations before the image orientation
  /// is corrected.
  ///
  ///
  ///
  /// If the input image is in .jpeg format, it might contain exchangeable image
  /// (Exif) metadata that includes the image's orientation. If so, and the Exif
  /// metadata for the input image populates the orientation field, the value of
  /// `OrientationCorrection` is null. The `CelebrityFaces` and
  /// `UnrecognizedFaces` bounding box coordinates represent face locations
  /// after Exif metadata is used to correct the image orientation. Images in
  /// .png format don't contain Exif metadata.
  final String orientationCorrection;

  RecognizeCelebritiesResponse({
    this.celebrityFaces,
    this.unrecognizedFaces,
    this.orientationCorrection,
  });
  static RecognizeCelebritiesResponse fromJson(Map<String, dynamic> json) =>
      RecognizeCelebritiesResponse();
}

class S3Object {
  /// Name of the S3 bucket.
  final String bucket;

  /// S3 object key name.
  final String name;

  /// If the bucket is versioning enabled, you can specify the object version.
  final String version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });
}

class SearchFacesByImageResponse {
  /// The bounding box around the face in the input image that Amazon
  /// Rekognition used for the search.
  final BoundingBox searchedFaceBoundingBox;

  /// The level of confidence that the `searchedFaceBoundingBox`, contains a
  /// face.
  final double searchedFaceConfidence;

  /// An array of faces that match the input face, along with the confidence in
  /// the match.
  final List<FaceMatch> faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (`CollectionId`).
  final String faceModelVersion;

  SearchFacesByImageResponse({
    this.searchedFaceBoundingBox,
    this.searchedFaceConfidence,
    this.faceMatches,
    this.faceModelVersion,
  });
  static SearchFacesByImageResponse fromJson(Map<String, dynamic> json) =>
      SearchFacesByImageResponse();
}

class SearchFacesResponse {
  /// ID of the face that was searched for matches in a collection.
  final String searchedFaceId;

  /// An array of faces that matched the input face, along with the confidence
  /// in the match.
  final List<FaceMatch> faceMatches;

  /// Version number of the face detection model associated with the input
  /// collection (`CollectionId`).
  final String faceModelVersion;

  SearchFacesResponse({
    this.searchedFaceId,
    this.faceMatches,
    this.faceModelVersion,
  });
  static SearchFacesResponse fromJson(Map<String, dynamic> json) =>
      SearchFacesResponse();
}

class Smile {
  /// Boolean value that indicates whether the face is smiling or not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  Smile({
    this.value,
    this.confidence,
  });
  static Smile fromJson(Map<String, dynamic> json) => Smile();
}

class StartCelebrityRecognitionResponse {
  /// The identifier for the celebrity recognition analysis job. Use `JobId` to
  /// identify the job in a subsequent call to `GetCelebrityRecognition`.
  final String jobId;

  StartCelebrityRecognitionResponse({
    this.jobId,
  });
  static StartCelebrityRecognitionResponse fromJson(
          Map<String, dynamic> json) =>
      StartCelebrityRecognitionResponse();
}

class StartContentModerationResponse {
  /// The identifier for the unsafe content analysis job. Use `JobId` to
  /// identify the job in a subsequent call to `GetContentModeration`.
  final String jobId;

  StartContentModerationResponse({
    this.jobId,
  });
  static StartContentModerationResponse fromJson(Map<String, dynamic> json) =>
      StartContentModerationResponse();
}

class StartFaceDetectionResponse {
  /// The identifier for the face detection job. Use `JobId` to identify the job
  /// in a subsequent call to `GetFaceDetection`.
  final String jobId;

  StartFaceDetectionResponse({
    this.jobId,
  });
  static StartFaceDetectionResponse fromJson(Map<String, dynamic> json) =>
      StartFaceDetectionResponse();
}

class StartFaceSearchResponse {
  /// The identifier for the search job. Use `JobId` to identify the job in a
  /// subsequent call to `GetFaceSearch`.
  final String jobId;

  StartFaceSearchResponse({
    this.jobId,
  });
  static StartFaceSearchResponse fromJson(Map<String, dynamic> json) =>
      StartFaceSearchResponse();
}

class StartLabelDetectionResponse {
  /// The identifier for the label detection job. Use `JobId` to identify the
  /// job in a subsequent call to `GetLabelDetection`.
  final String jobId;

  StartLabelDetectionResponse({
    this.jobId,
  });
  static StartLabelDetectionResponse fromJson(Map<String, dynamic> json) =>
      StartLabelDetectionResponse();
}

class StartPersonTrackingResponse {
  /// The identifier for the person detection job. Use `JobId` to identify the
  /// job in a subsequent call to `GetPersonTracking`.
  final String jobId;

  StartPersonTrackingResponse({
    this.jobId,
  });
  static StartPersonTrackingResponse fromJson(Map<String, dynamic> json) =>
      StartPersonTrackingResponse();
}

class StartStreamProcessorResponse {
  StartStreamProcessorResponse();
  static StartStreamProcessorResponse fromJson(Map<String, dynamic> json) =>
      StartStreamProcessorResponse();
}

class StopStreamProcessorResponse {
  StopStreamProcessorResponse();
  static StopStreamProcessorResponse fromJson(Map<String, dynamic> json) =>
      StopStreamProcessorResponse();
}

class StreamProcessor {
  /// Name of the Amazon Rekognition stream processor.
  final String name;

  /// Current status of the Amazon Rekognition stream processor.
  final String status;

  StreamProcessor({
    this.name,
    this.status,
  });
  static StreamProcessor fromJson(Map<String, dynamic> json) =>
      StreamProcessor();
}

class StreamProcessorInput {
  /// The Kinesis video stream input stream for the source streaming video.
  final KinesisVideoStream kinesisVideoStream;

  StreamProcessorInput({
    this.kinesisVideoStream,
  });
  static StreamProcessorInput fromJson(Map<String, dynamic> json) =>
      StreamProcessorInput();
}

class StreamProcessorOutput {
  /// The Amazon Kinesis Data Streams stream to which the Amazon Rekognition
  /// stream processor streams the analysis results.
  final KinesisDataStream kinesisDataStream;

  StreamProcessorOutput({
    this.kinesisDataStream,
  });
  static StreamProcessorOutput fromJson(Map<String, dynamic> json) =>
      StreamProcessorOutput();
}

class StreamProcessorSettings {
  /// Face search settings to use on a streaming video.
  final FaceSearchSettings faceSearch;

  StreamProcessorSettings({
    this.faceSearch,
  });
  static StreamProcessorSettings fromJson(Map<String, dynamic> json) =>
      StreamProcessorSettings();
}

class Sunglasses {
  /// Boolean value that indicates whether the face is wearing sunglasses or
  /// not.
  final bool value;

  /// Level of confidence in the determination.
  final double confidence;

  Sunglasses({
    this.value,
    this.confidence,
  });
  static Sunglasses fromJson(Map<String, dynamic> json) => Sunglasses();
}

class TextDetection {
  /// The word or line of text recognized by Amazon Rekognition.
  final String detectedText;

  /// The type of text that was detected.
  final String type;

  /// The identifier for the detected text. The identifier is only unique for a
  /// single call to `DetectText`.
  final int id;

  /// The Parent identifier for the detected text identified by the value of
  /// `ID`. If the type of detected text is `LINE`, the value of `ParentId` is
  /// `Null`.
  final int parentId;

  /// The confidence that Amazon Rekognition has in the accuracy of the detected
  /// text and the accuracy of the geometry points around the detected text.
  final double confidence;

  /// The location of the detected text on the image. Includes an axis aligned
  /// coarse bounding box surrounding the text and a finer grain polygon for
  /// more accurate spatial information.
  final Geometry geometry;

  TextDetection({
    this.detectedText,
    this.type,
    this.id,
    this.parentId,
    this.confidence,
    this.geometry,
  });
  static TextDetection fromJson(Map<String, dynamic> json) => TextDetection();
}

class UnindexedFace {
  /// An array of reasons that specify why a face wasn't indexed.
  ///
  /// *   EXTREME_POSE - The face is at a pose that can't be detected. For
  /// example, the head is turned too far away from the camera.
  ///
  /// *   EXCEEDS\_MAX\_FACES - The number of faces detected is already higher
  /// than that specified by the `MaxFaces` input parameter for `IndexFaces`.
  ///
  /// *   LOW_BRIGHTNESS - The image is too dark.
  ///
  /// *   LOW_SHARPNESS - The image is too blurry.
  ///
  /// *   LOW_CONFIDENCE - The face was detected with a low confidence.
  ///
  /// *   SMALL\_BOUNDING\_BOX - The bounding box around the face is too small.
  final List<String> reasons;

  /// The structure that contains attributes of a face that
  /// `IndexFaces`detected, but didn't index.
  final FaceDetail faceDetail;

  UnindexedFace({
    this.reasons,
    this.faceDetail,
  });
  static UnindexedFace fromJson(Map<String, dynamic> json) => UnindexedFace();
}

class Video {
  /// The Amazon S3 bucket name and file name for the video.
  final S3Object s3Object;

  Video({
    this.s3Object,
  });
}

class VideoMetadata {
  /// Type of compression used in the analyzed video.
  final String codec;

  /// Length of the video in milliseconds.
  final BigInt durationMillis;

  /// Format of the analyzed video. Possible values are MP4, MOV and AVI.
  final String format;

  /// Number of frames per second in the video.
  final double frameRate;

  /// Vertical pixel dimension of the video.
  final BigInt frameHeight;

  /// Horizontal pixel dimension of the video.
  final BigInt frameWidth;

  VideoMetadata({
    this.codec,
    this.durationMillis,
    this.format,
    this.frameRate,
    this.frameHeight,
    this.frameWidth,
  });
  static VideoMetadata fromJson(Map<String, dynamic> json) => VideoMetadata();
}
