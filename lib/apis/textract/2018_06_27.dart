import 'package:meta/meta.dart';

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
  /// `KEY\_VALUE\_SET`: a KEY Block object and a VALUE Block object. For
  /// example, _Name: Ana Silva Carolina_ contains a key and value. _Name:_ is
  /// the key. _Ana Silva Carolina_ is the value.
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
  /// For more information, see [Document Text
  /// Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  Future<void> analyzeDocument(
      {@required Document document,
      @required List<String> featureTypes}) async {}

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
  /// For more information, see [Document Text
  /// Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  Future<void> detectDocumentText(Document document) async {}

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
  /// `KEY\_VALUE\_SET`: a KEY Block object and a VALUE Block object. For
  /// example, _Name: Ana Silva Carolina_ contains a key and value. _Name:_ is
  /// the key. _Ana Silva Carolina_ is the value.
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
  /// For more information, see [Document Text
  /// Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  Future<void> getDocumentAnalysis(String jobId,
      {int maxResults, String nextToken}) async {}

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
  /// For more information, see [Document Text
  /// Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  Future<void> getDocumentTextDetection(String jobId,
      {int maxResults, String nextToken}) async {}

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
  /// For more information, see [Document Text
  /// Analysis](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html).
  Future<void> startDocumentAnalysis(
      {@required DocumentLocation documentLocation,
      @required List<String> featureTypes,
      String clientRequestToken,
      String jobTag,
      NotificationChannel notificationChannel}) async {}

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
  /// For more information, see [Document Text
  /// Detection](https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html).
  Future<void> startDocumentTextDetection(DocumentLocation documentLocation,
      {String clientRequestToken,
      String jobTag,
      NotificationChannel notificationChannel}) async {}
}

class AnalyzeDocumentResponse {}

class Block {}

class BoundingBox {}

class DetectDocumentTextResponse {}

class Document {}

class DocumentLocation {}

class DocumentMetadata {}

class Geometry {}

class GetDocumentAnalysisResponse {}

class GetDocumentTextDetectionResponse {}

class NotificationChannel {}

class Point {}

class Relationship {}

class S3Object {}

class StartDocumentAnalysisResponse {}

class StartDocumentTextDetectionResponse {}

class Warning {}
