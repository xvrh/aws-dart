import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Textract detects and analyzes text in documents and converts it into
/// machine-readable text. This is the API reference documentation for Amazon
/// Textract.
class TextractApi {
  /// Analyzes an input document for relationships between detected items.
  ///
  /// The types of information returned are as follows:
  ///
  /// *   Words and lines that are related to nearby lines and words. The
  /// related information is returned in two Block objects each of type
  /// `KEY_VALUE_SET`: a KEY Block object and a VALUE Block object. For example,
  /// _Name: Ana Silva Carolina_ contains a key and value. _Name:_ is the key.
  /// _Ana Silva Carolina_ is the value.
  ///
  /// *   Table and table cell data. A TABLE Block object contains information
  /// about a detected table. A CELL Block object is returned for each cell in a
  /// table.
  ///
  /// *   Selectable elements such as checkboxes and radio buttons. A
  /// SELECTION_ELEMENT Block object contains information about a selectable
  /// element.
  ///
  /// *   Lines and words of text. A LINE Block object contains one or more WORD
  /// Block objects.
  ///
  ///
  /// You can choose which type of analysis to perform by specifying the
  /// `FeatureTypes` list.
  ///
  /// The output is returned in a list of `BLOCK` objects.
  ///
  ///  `AnalyzeDocument` is a synchronous operation. To analyze documents
  /// asynchronously, use StartDocumentAnalysis.
  ///
  /// For more information, see
  /// [Document Text Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  ///
  /// [document]: The input document as base64-encoded bytes or an Amazon S3
  /// object. If you use the AWS CLI to call Amazon Textract operations, you
  /// can't pass image bytes. The document must be an image in JPG or PNG
  /// format.
  ///
  /// If you are using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes passed using the `Bytes` field.
  ///
  /// [featureTypes]: A list of the types of analysis to perform. Add TABLES to
  /// the list to return information about the tables detected in the input
  /// document. Add FORMS to return detected fields and the associated text. To
  /// perform both types of analysis, add TABLES and FORMS to `FeatureTypes`.
  Future<AnalyzeDocumentResponse> analyzeDocument(
      {@required Document document,
      @required List<String> featureTypes}) async {
    return AnalyzeDocumentResponse.fromJson({});
  }

  /// Detects text in the input document. Amazon Textract can detect lines of
  /// text and the words that make up a line of text. The input document must be
  /// an image in JPG or PNG format. `DetectDocumentText` returns the detected
  /// text in an array of Block objects.
  ///
  /// Each document page has as an associated `Block` of type PAGE. Each PAGE
  /// `Block` object is the parent of LINE `Block` objects that represent the
  /// lines of detected text on a page. A LINE `Block` object is a parent for
  /// each word that makes up the line. Words are represented by `Block` objects
  /// of type WORD.
  ///
  ///  `DetectDocumentText` is a synchronous operation. To analyze documents
  /// asynchronously, use StartDocumentTextDetection.
  ///
  /// For more information, see
  /// [Document Text Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  ///
  /// [document]: The input document as base64-encoded bytes or an Amazon S3
  /// object. If you use the AWS CLI to call Amazon Textract operations, you
  /// can't pass image bytes. The document must be an image in JPG or PNG
  /// format.
  ///
  /// If you are using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes passed using the `Bytes` field.
  Future<DetectDocumentTextResponse> detectDocumentText(
      Document document) async {
    return DetectDocumentTextResponse.fromJson({});
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// analyzes text in a document.
  ///
  /// You start asynchronous text analysis by calling StartDocumentAnalysis,
  /// which returns a job identifier (`JobId`). When the text analysis operation
  /// finishes, Amazon Textract publishes a completion status to the Amazon
  /// Simple Notification Service (Amazon SNS) topic that's registered in the
  /// initial call to `StartDocumentAnalysis`. To get the results of the
  /// text-detection operation, first check that the status value published to
  /// the Amazon SNS topic is `SUCCEEDED`. If so, call `GetDocumentAnalysis`,
  /// and pass the job identifier (`JobId`) from the initial call to
  /// `StartDocumentAnalysis`.
  ///
  ///  `GetDocumentAnalysis` returns an array of Block objects. The following
  /// types of information are returned:
  ///
  /// *   Words and lines that are related to nearby lines and words. The
  /// related information is returned in two Block objects each of type
  /// `KEY_VALUE_SET`: a KEY Block object and a VALUE Block object. For example,
  /// _Name: Ana Silva Carolina_ contains a key and value. _Name:_ is the key.
  /// _Ana Silva Carolina_ is the value.
  ///
  /// *   Table and table cell data. A TABLE Block object contains information
  /// about a detected table. A CELL Block object is returned for each cell in a
  /// table.
  ///
  /// *   Selectable elements such as checkboxes and radio buttons. A
  /// SELECTION_ELEMENT Block object contains information about a selectable
  /// element.
  ///
  /// *   Lines and words of text. A LINE Block object contains one or more WORD
  /// Block objects.
  ///
  ///
  /// Use the `MaxResults` parameter to limit the number of blocks returned. If
  /// there are more results than specified in `MaxResults`, the value of
  /// `NextToken` in the operation response contains a pagination token for
  /// getting the next set of results. To get the next page of results, call
  /// `GetDocumentAnalysis`, and populate the `NextToken` request parameter with
  /// the token value that's returned from the previous call to
  /// `GetDocumentAnalysis`.
  ///
  /// For more information, see
  /// [Document Text Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  ///
  /// [jobId]: A unique identifier for the text-detection job. The `JobId` is
  /// returned from `StartDocumentAnalysis`.
  ///
  /// [maxResults]: The maximum number of results to return per paginated call.
  /// The largest value that you can specify is 1,000. If you specify a value
  /// greater than 1,000, a maximum of 1,000 results is returned. The default
  /// value is 1,000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more blocks to retrieve), Amazon Textract returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of blocks.
  Future<GetDocumentAnalysisResponse> getDocumentAnalysis(String jobId,
      {int maxResults, String nextToken}) async {
    return GetDocumentAnalysisResponse.fromJson({});
  }

  /// Gets the results for an Amazon Textract asynchronous operation that
  /// detects text in a document. Amazon Textract can detect lines of text and
  /// the words that make up a line of text.
  ///
  /// You start asynchronous text detection by calling
  /// StartDocumentTextDetection, which returns a job identifier (`JobId`). When
  /// the text detection operation finishes, Amazon Textract publishes a
  /// completion status to the Amazon Simple Notification Service (Amazon SNS)
  /// topic that's registered in the initial call to
  /// `StartDocumentTextDetection`. To get the results of the text-detection
  /// operation, first check that the status value published to the Amazon SNS
  /// topic is `SUCCEEDED`. If so, call `GetDocumentTextDetection`, and pass the
  /// job identifier (`JobId`) from the initial call to
  /// `StartDocumentTextDetection`.
  ///
  ///  `GetDocumentTextDetection` returns an array of Block objects.
  ///
  /// Each document page has as an associated `Block` of type PAGE. Each PAGE
  /// `Block` object is the parent of LINE `Block` objects that represent the
  /// lines of detected text on a page. A LINE `Block` object is a parent for
  /// each word that makes up the line. Words are represented by `Block` objects
  /// of type WORD.
  ///
  /// Use the MaxResults parameter to limit the number of blocks that are
  /// returned. If there are more results than specified in `MaxResults`, the
  /// value of `NextToken` in the operation response contains a pagination token
  /// for getting the next set of results. To get the next page of results, call
  /// `GetDocumentTextDetection`, and populate the `NextToken` request parameter
  /// with the token value that's returned from the previous call to
  /// `GetDocumentTextDetection`.
  ///
  /// For more information, see
  /// [Document Text Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  ///
  /// [jobId]: A unique identifier for the text detection job. The `JobId` is
  /// returned from `StartDocumentTextDetection`.
  ///
  /// [maxResults]: The maximum number of results to return per paginated call.
  /// The largest value you can specify is 1,000. If you specify a value greater
  /// than 1,000, a maximum of 1,000 results is returned. The default value is
  /// 1,000.
  ///
  /// [nextToken]: If the previous response was incomplete (because there are
  /// more blocks to retrieve), Amazon Textract returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of blocks.
  Future<GetDocumentTextDetectionResponse> getDocumentTextDetection(
      String jobId,
      {int maxResults,
      String nextToken}) async {
    return GetDocumentTextDetectionResponse.fromJson({});
  }

  /// Starts asynchronous analysis of an input document for relationships
  /// between detected items such as key and value pairs, tables, and selection
  /// elements.
  ///
  ///  `StartDocumentAnalysis` can analyze text in documents that are in JPG,
  /// PNG, and PDF format. The documents are stored in an Amazon S3 bucket. Use
  /// DocumentLocation to specify the bucket name and file name of the document.
  ///
  ///  `StartDocumentAnalysis` returns a job identifier (`JobId`) that you use
  /// to get the results of the operation. When text analysis is finished,
  /// Amazon Textract publishes a completion status to the Amazon Simple
  /// Notification Service (Amazon SNS) topic that you specify in
  /// `NotificationChannel`. To get the results of the text analysis operation,
  /// first check that the status value published to the Amazon SNS topic is
  /// `SUCCEEDED`. If so, call GetDocumentAnalysis, and pass the job identifier
  /// (`JobId`) from the initial call to `StartDocumentAnalysis`.
  ///
  /// For more information, see
  /// [Document Text Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  ///
  /// [documentLocation]: The location of the document to be processed.
  ///
  /// [featureTypes]: A list of the types of analysis to perform. Add TABLES to
  /// the list to return information about the tables that are detected in the
  /// input document. Add FORMS to return detected fields and the associated
  /// text. To perform both types of analysis, add TABLES and FORMS to
  /// `FeatureTypes`. All selectable elements (`SELECTION_ELEMENT`) that are
  /// detected are returned, whatever the value of `FeatureTypes`.
  ///
  /// [clientRequestToken]: The idempotent token that you use to identify the
  /// start request. If you use the same token with multiple
  /// `StartDocumentAnalysis` requests, the same `JobId` is returned. Use
  /// `ClientRequestToken` to prevent the same job from being accidentally
  /// started more than once.
  ///
  /// [jobTag]: An identifier you specify that's included in the completion
  /// notification that's published to the Amazon SNS topic. For example, you
  /// can use `JobTag` to identify the type of document, such as a tax form or a
  /// receipt, that the completion notification corresponds to.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN that you want Amazon
  /// Textract to publish the completion status of the operation to.
  Future<StartDocumentAnalysisResponse> startDocumentAnalysis(
      {@required DocumentLocation documentLocation,
      @required List<String> featureTypes,
      String clientRequestToken,
      String jobTag,
      NotificationChannel notificationChannel}) async {
    return StartDocumentAnalysisResponse.fromJson({});
  }

  /// Starts the asynchronous detection of text in a document. Amazon Textract
  /// can detect lines of text and the words that make up a line of text.
  ///
  ///  `StartDocumentTextDetection` can analyze text in documents that are in
  /// JPG, PNG, and PDF format. The documents are stored in an Amazon S3 bucket.
  /// Use DocumentLocation to specify the bucket name and file name of the
  /// document.
  ///
  ///  `StartTextDetection` returns a job identifier (`JobId`) that you use to
  /// get the results of the operation. When text detection is finished, Amazon
  /// Textract publishes a completion status to the Amazon Simple Notification
  /// Service (Amazon SNS) topic that you specify in `NotificationChannel`. To
  /// get the results of the text detection operation, first check that the
  /// status value published to the Amazon SNS topic is `SUCCEEDED`. If so, call
  /// GetDocumentTextDetection, and pass the job identifier (`JobId`) from the
  /// initial call to `StartDocumentTextDetection`.
  ///
  /// For more information, see
  /// [Document Text Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  ///
  /// [documentLocation]: The location of the document to be processed.
  ///
  /// [clientRequestToken]: The idempotent token that's used to identify the
  /// start request. If you use the same token with multiple
  /// `StartDocumentTextDetection` requests, the same `JobId` is returned. Use
  /// `ClientRequestToken` to prevent the same job from being accidentally
  /// started more than once.
  ///
  /// [jobTag]: An identifier you specify that's included in the completion
  /// notification that's published to the Amazon SNS topic. For example, you
  /// can use `JobTag` to identify the type of document, such as a tax form or a
  /// receipt, that the completion notification corresponds to.
  ///
  /// [notificationChannel]: The Amazon SNS topic ARN that you want Amazon
  /// Textract to publish the completion status of the operation to.
  Future<StartDocumentTextDetectionResponse> startDocumentTextDetection(
      DocumentLocation documentLocation,
      {String clientRequestToken,
      String jobTag,
      NotificationChannel notificationChannel}) async {
    return StartDocumentTextDetectionResponse.fromJson({});
  }
}

class AnalyzeDocumentResponse {
  /// Metadata about the analyzed document. An example is the number of pages.
  final DocumentMetadata documentMetadata;

  /// The text that's detected and analyzed by `AnalyzeDocument`.
  final List<Block> blocks;

  AnalyzeDocumentResponse({
    this.documentMetadata,
    this.blocks,
  });
  static AnalyzeDocumentResponse fromJson(Map<String, dynamic> json) =>
      AnalyzeDocumentResponse();
}

/// A `Block` represents items that are recognized in a document within a group
/// of pixels close to each other. The information returned in a `Block` depends
/// on the type of operation. In document-text detection (for example
/// DetectDocumentText), you get information about the detected words and lines
/// of text. In text analysis (for example AnalyzeDocument), you can also get
/// information about the fields, tables and selection elements that are
/// detected in the document.
///
/// An array of `Block` objects is returned by both synchronous and asynchronous
/// operations. In synchronous operations, such as DetectDocumentText, the array
/// of `Block` objects is the entire set of results. In asynchronous operations,
/// such as GetDocumentAnalysis, the array is returned over one or more
/// responses.
///
/// For more information, see
/// [How Amazon Textract Works](https://docs.aws.amazon.com/textract/latest/dg/how-it-works.html).
class Block {
  /// The type of text that's recognized in a block. In text-detection
  /// operations, the following types are returned:
  ///
  /// *    _PAGE_ - Contains a list of the LINE Block objects that are detected
  /// on a document page.
  ///
  /// *    _WORD_ - A word detected on a document page. A word is one or more
  /// ISO basic Latin script characters that aren't separated by spaces.
  ///
  /// *    _LINE_ - A string of tab-delimited, contiguous words that's detected
  /// on a document page.
  ///
  ///
  /// In text analysis operations, the following types are returned:
  ///
  /// *    _PAGE_ - Contains a list of child Block objects that are detected on
  /// a document page.
  ///
  /// *    _KEY_VALUE_SET_ - Stores the KEY and VALUE Block objects for a field
  /// that's detected on a document page. Use the `EntityType` field to
  /// determine if a KEY_VALUE_SET object is a KEY Block object or a VALUE Block
  /// object.
  ///
  /// *    _WORD_ - A word detected on a document page. A word is one or more
  /// ISO basic Latin script characters that aren't separated by spaces that's
  /// detected on a document page.
  ///
  /// *    _LINE_ - A string of tab-delimited, contiguous words that's detected
  /// on a document page.
  ///
  /// *    _TABLE_ - A table that's detected on a document page. A table is any
  /// grid-based information with 2 or more rows or columns with a cell span of
  /// 1 row and 1 column each.
  ///
  /// *    _CELL_ - A cell within a detected table. The cell is the parent of
  /// the block that contains the text in the cell.
  ///
  /// *    _SELECTION_ELEMENT_ - A selectable element such as a radio button or
  /// checkbox that's detected on a document page. Use the value of
  /// `SelectionStatus` to determine the status of the selection element.
  final String blockType;

  /// The confidence that Amazon Textract has in the accuracy of the recognized
  /// text and the accuracy of the geometry points around the recognized text.
  final double confidence;

  /// The word or line of text that's recognized by Amazon Textract.
  final String text;

  /// The row in which a table cell is located. The first row position is 1.
  /// `RowIndex` isn't returned by `DetectDocumentText` and
  /// `GetDocumentTextDetection`.
  final int rowIndex;

  /// The column in which a table cell appears. The first column position is 1.
  /// `ColumnIndex` isn't returned by `DetectDocumentText` and
  /// `GetDocumentTextDetection`.
  final int columnIndex;

  /// The number of rows that a table spans. `RowSpan` isn't returned by
  /// `DetectDocumentText` and `GetDocumentTextDetection`.
  final int rowSpan;

  /// The number of columns that a table cell spans. `ColumnSpan` isn't returned
  /// by `DetectDocumentText` and `GetDocumentTextDetection`.
  final int columnSpan;

  /// The location of the recognized text on the image. It includes an
  /// axis-aligned, coarse bounding box that surrounds the text, and a
  /// finer-grain polygon for more accurate spatial information.
  final Geometry geometry;

  /// The identifier for the recognized text. The identifier is only unique for
  /// a single operation.
  final String id;

  /// A list of child blocks of the current block. For example a LINE object has
  /// child blocks for each WORD block that's part of the line of text. There
  /// aren't Relationship objects in the list for relationships that don't
  /// exist, such as when the current block has no child blocks. The list size
  /// can be the following:
  ///
  /// *   0 - The block has no child blocks.
  ///
  /// *   1 - The block has child blocks.
  final List<Relationship> relationships;

  /// The type of entity. The following can be returned:
  ///
  /// *    _KEY_ - An identifier for a field on the document.
  ///
  /// *    _VALUE_ - The field text.
  ///
  ///
  ///  `EntityTypes` isn't returned by `DetectDocumentText` and
  /// `GetDocumentTextDetection`.
  final List<String> entityTypes;

  /// The selection status of a selectable element such as a radio button or
  /// checkbox.
  final String selectionStatus;

  /// The page in which a block was detected. `Page` is returned by asynchronous
  /// operations. Page values greater than 1 are only returned for multi-page
  /// documents that are in PDF format. A scanned image (JPG/PNG), even if it
  /// contains multiple document pages, is always considered to be a single-page
  /// document and the value of `Page` is always 1. Synchronous operations don't
  /// return `Page` as every input document is considered to be a single-page
  /// document.
  final int page;

  Block({
    this.blockType,
    this.confidence,
    this.text,
    this.rowIndex,
    this.columnIndex,
    this.rowSpan,
    this.columnSpan,
    this.geometry,
    this.id,
    this.relationships,
    this.entityTypes,
    this.selectionStatus,
    this.page,
  });
  static Block fromJson(Map<String, dynamic> json) => Block();
}

/// The bounding box around the recognized text, key, value, table or table cell
/// on a document page. The `left` (x-coordinate) and `top` (y-coordinate) are
/// coordinates that represent the top and left sides of the bounding box. Note
/// that the upper-left corner of the image is the origin (0,0).
///
/// The `top` and `left` values returned are ratios of the overall document page
/// size. For example, if the input image is 700 x 200 pixels, and the top-left
/// coordinate of the bounding box is 350 x 50 pixels, the API returns a `left`
/// value of 0.5 (350/700) and a `top` value of 0.25 (50/200).
///
/// The `width` and `height` values represent the dimensions of the bounding box
/// as a ratio of the overall document page dimension. For example, if the
/// document page size is 700 x 200 pixels, and the bounding box width is 70
/// pixels, the width returned is 0.1.
class BoundingBox {
  /// The width of the bounding box as a ratio of the overall document page
  /// width.
  final double width;

  /// The height of the bounding box as a ratio of the overall document page
  /// height.
  final double height;

  /// The left coordinate of the bounding box as a ratio of overall document
  /// page width.
  final double left;

  /// The top coordinate of the bounding box as a ratio of overall document page
  /// height.
  final double top;

  BoundingBox({
    this.width,
    this.height,
    this.left,
    this.top,
  });
  static BoundingBox fromJson(Map<String, dynamic> json) => BoundingBox();
}

class DetectDocumentTextResponse {
  /// Metadata about the document. Contains the number of pages that are
  /// detected in the document.
  final DocumentMetadata documentMetadata;

  /// An array of Block objects containing the text detected in the document.
  final List<Block> blocks;

  DetectDocumentTextResponse({
    this.documentMetadata,
    this.blocks,
  });
  static DetectDocumentTextResponse fromJson(Map<String, dynamic> json) =>
      DetectDocumentTextResponse();
}

/// The input document, either as bytes or as an S3 object.
///
/// You pass image bytes to an Amazon Textract API operation by using the
/// `Bytes` property. For example, you would use the `Bytes` property to pass a
/// document loaded from a local file system. Image bytes passed by using the
/// `Bytes` property must be base64 encoded. Your code might not need to encode
/// document file bytes if you're using an AWS SDK to call Amazon Textract API
/// operations.
///
/// You pass images stored in an S3 bucket to an Amazon Textract API operation
/// by using the `S3Object` property. Documents stored in an S3 bucket don't
/// need to be base64 encoded.
///
/// The AWS Region for the S3 bucket that contains the S3 object must match the
/// AWS Region that you use for Amazon Textract operations.
///
/// If you use the AWS CLI to call Amazon Textract operations, passing image
/// bytes using the Bytes property isn't supported. You must first upload the
/// document to an Amazon S3 bucket, and then call the operation using the
/// S3Object property.
///
/// For Amazon Textract to process an S3 object, the user must have permission
/// to access the S3 object.
class Document {
  /// A blob of base-64 encoded documents bytes. The maximum size of a document
  /// that's provided in a blob of bytes is 5 MB. The document bytes must be in
  /// PNG or JPG format.
  ///
  /// If you are using an AWS SDK to call Amazon Textract, you might not need to
  /// base64-encode image bytes passed using the `Bytes` field.
  final Uint8List bytes;

  /// Identifies an S3 object as the document source. The maximum size of a
  /// document stored in an S3 bucket is 5 MB.
  final S3Object s3Object;

  Document({
    this.bytes,
    this.s3Object,
  });
}

/// The Amazon S3 bucket that contains the document to be processed. It's used
/// by asynchronous operations such as StartDocumentTextDetection.
///
/// The input document can be an image file in JPG or PNG format. It can also be
/// a file in PDF format.
class DocumentLocation {
  /// The Amazon S3 bucket that contains the input document.
  final S3Object s3Object;

  DocumentLocation({
    this.s3Object,
  });
}

/// Information about the input document.
class DocumentMetadata {
  /// The number of pages detected in the document.
  final int pages;

  DocumentMetadata({
    this.pages,
  });
  static DocumentMetadata fromJson(Map<String, dynamic> json) =>
      DocumentMetadata();
}

/// Information about where a recognized text, key, value, table, or table cell
/// is located on a document page.
class Geometry {
  /// An axis-aligned coarse representation of the location of the recognized
  /// text on the document page.
  final BoundingBox boundingBox;

  /// Within the bounding box, a fine-grained polygon around the recognized
  /// text.
  final List<Point> polygon;

  Geometry({
    this.boundingBox,
    this.polygon,
  });
  static Geometry fromJson(Map<String, dynamic> json) => Geometry();
}

class GetDocumentAnalysisResponse {
  /// Information about a document that Amazon Textract processed.
  /// `DocumentMetadata` is returned in every page of paginated responses from
  /// an Amazon Textract video operation.
  final DocumentMetadata documentMetadata;

  /// The current status of the text detection job.
  final String jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of text
  /// detection results.
  final String nextToken;

  /// The results of the text analysis operation.
  final List<Block> blocks;

  /// A list of warnings that occurred during the document analysis operation.
  final List<Warning> warnings;

  /// The current status of an asynchronous document analysis operation.
  final String statusMessage;

  GetDocumentAnalysisResponse({
    this.documentMetadata,
    this.jobStatus,
    this.nextToken,
    this.blocks,
    this.warnings,
    this.statusMessage,
  });
  static GetDocumentAnalysisResponse fromJson(Map<String, dynamic> json) =>
      GetDocumentAnalysisResponse();
}

class GetDocumentTextDetectionResponse {
  /// Information about a document that Amazon Textract processed.
  /// `DocumentMetadata` is returned in every page of paginated responses from
  /// an Amazon Textract video operation.
  final DocumentMetadata documentMetadata;

  /// The current status of the text detection job.
  final String jobStatus;

  /// If the response is truncated, Amazon Textract returns this token. You can
  /// use this token in the subsequent request to retrieve the next set of
  /// text-detection results.
  final String nextToken;

  /// The results of the text-detection operation.
  final List<Block> blocks;

  /// A list of warnings that occurred during the document text-detection
  /// operation.
  final List<Warning> warnings;

  /// The current status of an asynchronous document text-detection operation.
  final String statusMessage;

  GetDocumentTextDetectionResponse({
    this.documentMetadata,
    this.jobStatus,
    this.nextToken,
    this.blocks,
    this.warnings,
    this.statusMessage,
  });
  static GetDocumentTextDetectionResponse fromJson(Map<String, dynamic> json) =>
      GetDocumentTextDetectionResponse();
}

/// The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon
/// Textract publishes the completion status of an asynchronous document
/// operation, such as StartDocumentTextDetection.
class NotificationChannel {
  /// The Amazon SNS topic that Amazon Textract posts the completion status to.
  final String snsTopicArn;

  /// The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract
  /// publishing permissions to the Amazon SNS topic.
  final String roleArn;

  NotificationChannel({
    @required this.snsTopicArn,
    @required this.roleArn,
  });
}

/// The X and Y coordinates of a point on a document page. The X and Y values
/// returned are ratios of the overall document page size. For example, if the
/// input document is 700 x 200 and the operation returns X=0.5 and Y=0.25, then
/// the point is at the (350,50) pixel coordinate on the document page.
///
/// An array of `Point` objects, `Polygon`, is returned by DetectDocumentText.
/// `Polygon` represents a fine-grained polygon around detected text. For more
/// information, see Geometry in the Amazon Textract Developer Guide.
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

/// Information about how blocks are related to each other. A `Block` object
/// contains 0 or more `Relation` objects in a list, `Relationships`. For more
/// information, see Block.
///
/// The `Type` element provides the type of the relationship for all blocks in
/// the `IDs` array.
class Relationship {
  /// The type of relationship that the blocks in the IDs array have with the
  /// current block. The relationship can be `VALUE` or `CHILD`.
  final String type;

  /// An array of IDs for related blocks. You can get the type of the
  /// relationship from the `Type` element.
  final List<String> ids;

  Relationship({
    this.type,
    this.ids,
  });
  static Relationship fromJson(Map<String, dynamic> json) => Relationship();
}

/// The S3 bucket name and file name that identifies the document.
///
/// The AWS Region for the S3 bucket that contains the document must match the
/// Region that you use for Amazon Textract operations.
///
/// For Amazon Textract to process a file in an S3 bucket, the user must have
/// permission to access the S3 bucket and file.
class S3Object {
  /// The name of the S3 bucket.
  final String bucket;

  /// The file name of the input document. It must be an image file (.JPG or
  /// .PNG format). Asynchronous operations also support PDF files.
  final String name;

  /// If the bucket has versioning enabled, you can specify the object version.
  final String version;

  S3Object({
    this.bucket,
    this.name,
    this.version,
  });
}

class StartDocumentAnalysisResponse {
  /// The identifier for the document text detection job. Use `JobId` to
  /// identify the job in a subsequent call to `GetDocumentAnalysis`.
  final String jobId;

  StartDocumentAnalysisResponse({
    this.jobId,
  });
  static StartDocumentAnalysisResponse fromJson(Map<String, dynamic> json) =>
      StartDocumentAnalysisResponse();
}

class StartDocumentTextDetectionResponse {
  /// The identifier for the document text-detection job. Use `JobId` to
  /// identify the job in a subsequent call to `GetDocumentTextDetection`.
  final String jobId;

  StartDocumentTextDetectionResponse({
    this.jobId,
  });
  static StartDocumentTextDetectionResponse fromJson(
          Map<String, dynamic> json) =>
      StartDocumentTextDetectionResponse();
}

/// A warning about an issue that occurred during asynchronous text analysis
/// (StartDocumentAnalysis) or asynchronous document-text detection
/// (StartDocumentTextDetection).
class Warning {
  /// The error code for the warning.
  final String errorCode;

  /// A list of the pages that the warning applies to.
  final List<int> pages;

  Warning({
    this.errorCode,
    this.pages,
  });
  static Warning fromJson(Map<String, dynamic> json) => Warning();
}
