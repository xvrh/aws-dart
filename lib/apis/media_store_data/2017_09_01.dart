import 'package:meta/meta.dart';
import 'dart:typed_data';

/// An AWS Elemental MediaStore asset is an object, similar to an object in the
/// Amazon S3 service. Objects are the fundamental entities that are stored in
/// AWS Elemental MediaStore.
class MediaStoreDataApi {
  final _client;
  MediaStoreDataApi(client)
      : _client = client.configured('MediaStore Data', serializer: 'rest-json');

  /// Deletes an object at the specified path.
  ///
  /// [path]: The path (including the file name) where the object is stored in
  /// the container. Format: <folder name>/<folder name>/<file name>
  Future<DeleteObjectResponse> deleteObject(String path) async {
    var response_ = await _client.send('DeleteObject', {
      'Path': path,
    });
    return DeleteObjectResponse.fromJson(response_);
  }

  /// Gets the headers for an object at the specified path.
  ///
  /// [path]: The path (including the file name) where the object is stored in
  /// the container. Format: <folder name>/<folder name>/<file name>
  Future<DescribeObjectResponse> describeObject(String path) async {
    var response_ = await _client.send('DescribeObject', {
      'Path': path,
    });
    return DescribeObjectResponse.fromJson(response_);
  }

  /// Downloads the object at the specified path. If the object’s upload
  /// availability is set to `streaming`, AWS Elemental MediaStore downloads the
  /// object even if it’s still uploading the object.
  ///
  /// [path]: The path (including the file name) where the object is stored in
  /// the container. Format: <folder name>/<folder name>/<file name>
  ///
  /// For example, to upload the file `mlaw.avi` to the folder path
  /// `premiumcanada` in the container `movies`, enter the path
  /// `premium/canada/mlaw.avi`.
  ///
  /// Do not include the container name in this path.
  ///
  /// If the path includes any folders that don't exist yet, the service creates
  /// them. For example, suppose you have an existing `premium/usa` subfolder.
  /// If you specify `premium/canada`, the service creates a `canada` subfolder
  /// in the `premium` folder. You then have two subfolders, `usa` and `canada`,
  /// in the `premium` folder.
  ///
  /// There is no correlation between the path to the source and the path
  /// (folders) in the container in AWS Elemental MediaStore.
  ///
  /// For more information about folders and how they exist in a container, see
  /// the
  /// [AWS Elemental MediaStore User Guide](http://docs.aws.amazon.com/mediastore/latest/ug/).
  ///
  /// The file name is the name that is assigned to the file that you upload.
  /// The file can have the same name inside and outside of AWS Elemental
  /// MediaStore, or it can have the same name. The file name can include or
  /// omit an extension.
  ///
  /// [range]: The range bytes of an object to retrieve. For more information
  /// about the `Range` header, see
  /// [http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35).
  /// AWS Elemental MediaStore ignores this header for partially uploaded
  /// objects that have streaming upload availability.
  Future<GetObjectResponse> getObject(String path, {String range}) async {
    var response_ = await _client.send('GetObject', {
      'Path': path,
      if (range != null) 'Range': range,
    });
    return GetObjectResponse.fromJson(response_);
  }

  /// Provides a list of metadata entries about folders and objects in the
  /// specified folder.
  ///
  /// [path]: The path in the container from which to retrieve items. Format:
  /// <folder name>/<folder name>/<file name>
  ///
  /// [maxResults]: The maximum number of results to return per API request. For
  /// example, you submit a `ListItems` request with `MaxResults` set at 500.
  /// Although 2,000 items match your request, the service returns no more than
  /// the first 500 items. (The service also returns a `NextToken` value that
  /// you can use to fetch the next batch of results.) The service might return
  /// fewer results than the `MaxResults` value.
  ///
  /// If `MaxResults` is not included in the request, the service defaults to
  /// pagination with a maximum of 1,000 results per page.
  ///
  /// [nextToken]: The token that identifies which batch of results that you
  /// want to see. For example, you submit a `ListItems` request with
  /// `MaxResults` set at 500. The service returns the first batch of results
  /// (up to 500) and a `NextToken` value. To see the next batch of results, you
  /// can submit the `ListItems` request a second time and specify the
  /// `NextToken` value.
  ///
  /// Tokens expire after 15 minutes.
  Future<ListItemsResponse> listItems(
      {String path, int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListItems', {
      if (path != null) 'Path': path,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListItemsResponse.fromJson(response_);
  }

  /// Uploads an object to the specified path. Object sizes are limited to 25 MB
  /// for standard upload availability and 10 MB for streaming upload
  /// availability.
  ///
  /// [body]: The bytes to be stored.
  ///
  /// [path]: The path (including the file name) where the object is stored in
  /// the container. Format: <folder name>/<folder name>/<file name>
  ///
  /// For example, to upload the file `mlaw.avi` to the folder path
  /// `premiumcanada` in the container `movies`, enter the path
  /// `premium/canada/mlaw.avi`.
  ///
  /// Do not include the container name in this path.
  ///
  /// If the path includes any folders that don't exist yet, the service creates
  /// them. For example, suppose you have an existing `premium/usa` subfolder.
  /// If you specify `premium/canada`, the service creates a `canada` subfolder
  /// in the `premium` folder. You then have two subfolders, `usa` and `canada`,
  /// in the `premium` folder.
  ///
  /// There is no correlation between the path to the source and the path
  /// (folders) in the container in AWS Elemental MediaStore.
  ///
  /// For more information about folders and how they exist in a container, see
  /// the
  /// [AWS Elemental MediaStore User Guide](http://docs.aws.amazon.com/mediastore/latest/ug/).
  ///
  /// The file name is the name that is assigned to the file that you upload.
  /// The file can have the same name inside and outside of AWS Elemental
  /// MediaStore, or it can have the same name. The file name can include or
  /// omit an extension.
  ///
  /// [contentType]: The content type of the object.
  ///
  /// [cacheControl]: An optional `CacheControl` header that allows the caller
  /// to control the object's cache behavior. Headers can be passed in as
  /// specified in the HTTP at
  /// [https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9).
  ///
  /// Headers with a custom user-defined value are also accepted.
  ///
  /// [storageClass]: Indicates the storage class of a `Put` request. Defaults
  /// to high-performance temporal storage class, and objects are persisted into
  /// durable storage shortly after being received.
  ///
  /// [uploadAvailability]: Indicates the availability of an object while it is
  /// still uploading. If the value is set to `streaming`, the object is
  /// available for downloading after some initial buffering but before the
  /// object is uploaded completely. If the value is set to `standard`, the
  /// object is available for downloading only when it is uploaded completely.
  /// The default value for this header is `standard`.
  ///
  /// To use this header, you must also set the HTTP `Transfer-Encoding` header
  /// to `chunked`.
  Future<PutObjectResponse> putObject(
      {@required Uint8List body,
      @required String path,
      String contentType,
      String cacheControl,
      String storageClass,
      String uploadAvailability}) async {
    var response_ = await _client.send('PutObject', {
      'Body': body,
      'Path': path,
      if (contentType != null) 'ContentType': contentType,
      if (cacheControl != null) 'CacheControl': cacheControl,
      if (storageClass != null) 'StorageClass': storageClass,
      if (uploadAvailability != null) 'UploadAvailability': uploadAvailability,
    });
    return PutObjectResponse.fromJson(response_);
  }
}

class DeleteObjectResponse {
  DeleteObjectResponse();
  static DeleteObjectResponse fromJson(Map<String, dynamic> json) =>
      DeleteObjectResponse();
}

class DescribeObjectResponse {
  /// The ETag that represents a unique instance of the object.
  final String eTag;

  /// The content type of the object.
  final String contentType;

  /// The length of the object in bytes.
  final BigInt contentLength;

  /// An optional `CacheControl` header that allows the caller to control the
  /// object's cache behavior. Headers can be passed in as specified in the HTTP
  /// at
  /// [https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9).
  ///
  /// Headers with a custom user-defined value are also accepted.
  final String cacheControl;

  /// The date and time that the object was last modified.
  final DateTime lastModified;

  DescribeObjectResponse({
    this.eTag,
    this.contentType,
    this.contentLength,
    this.cacheControl,
    this.lastModified,
  });
  static DescribeObjectResponse fromJson(Map<String, dynamic> json) =>
      DescribeObjectResponse(
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
        cacheControl: json.containsKey('CacheControl')
            ? json['CacheControl'] as String
            : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
      );
}

class GetObjectResponse {
  /// The bytes of the object.
  final Uint8List body;

  /// An optional `CacheControl` header that allows the caller to control the
  /// object's cache behavior. Headers can be passed in as specified in the HTTP
  /// spec at
  /// [https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9).
  ///
  /// Headers with a custom user-defined value are also accepted.
  final String cacheControl;

  /// The range of bytes to retrieve.
  final String contentRange;

  /// The length of the object in bytes.
  final BigInt contentLength;

  /// The content type of the object.
  final String contentType;

  /// The ETag that represents a unique instance of the object.
  final String eTag;

  /// The date and time that the object was last modified.
  final DateTime lastModified;

  /// The HTML status code of the request. Status codes ranging from 200 to 299
  /// indicate success. All other status codes indicate the type of error that
  /// occurred.
  final int statusCode;

  GetObjectResponse({
    this.body,
    this.cacheControl,
    this.contentRange,
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
    @required this.statusCode,
  });
  static GetObjectResponse fromJson(Map<String, dynamic> json) =>
      GetObjectResponse(
        body: json.containsKey('Body') ? Uint8List(json['Body']) : null,
        cacheControl: json.containsKey('CacheControl')
            ? json['CacheControl'] as String
            : null,
        contentRange: json.containsKey('ContentRange')
            ? json['ContentRange'] as String
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        statusCode: json['StatusCode'] as int,
      );
}

/// A metadata entry for a folder or object.
class Item {
  /// The name of the item.
  final String name;

  /// The item type (folder or object).
  final String type;

  /// The ETag that represents a unique instance of the item.
  final String eTag;

  /// The date and time that the item was last modified.
  final DateTime lastModified;

  /// The content type of the item.
  final String contentType;

  /// The length of the item in bytes.
  final BigInt contentLength;

  Item({
    this.name,
    this.type,
    this.eTag,
    this.lastModified,
    this.contentType,
    this.contentLength,
  });
  static Item fromJson(Map<String, dynamic> json) => Item(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        lastModified: json.containsKey('LastModified')
            ? DateTime.parse(json['LastModified'])
            : null,
        contentType: json.containsKey('ContentType')
            ? json['ContentType'] as String
            : null,
        contentLength: json.containsKey('ContentLength')
            ? BigInt.from(json['ContentLength'])
            : null,
      );
}

class ListItemsResponse {
  /// The metadata entries for the folders and objects at the requested path.
  final List<Item> items;

  /// The token that can be used in a request to view the next set of results.
  /// For example, you submit a `ListItems` request that matches 2,000 items
  /// with `MaxResults` set at 500. The service returns the first batch of
  /// results (up to 500) and a `NextToken` value that can be used to fetch the
  /// next batch of results.
  final String nextToken;

  ListItemsResponse({
    this.items,
    this.nextToken,
  });
  static ListItemsResponse fromJson(Map<String, dynamic> json) =>
      ListItemsResponse(
        items: json.containsKey('Items')
            ? (json['Items'] as List).map((e) => Item.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class PutObjectResponse {
  /// The SHA256 digest of the object that is persisted.
  final String contentSha256;

  /// Unique identifier of the object in the container.
  final String eTag;

  /// The storage class where the object was persisted. The class should be
  /// “Temporal”.
  final String storageClass;

  PutObjectResponse({
    this.contentSha256,
    this.eTag,
    this.storageClass,
  });
  static PutObjectResponse fromJson(Map<String, dynamic> json) =>
      PutObjectResponse(
        contentSha256: json.containsKey('ContentSHA256')
            ? json['ContentSHA256'] as String
            : null,
        eTag: json.containsKey('ETag') ? json['ETag'] as String : null,
        storageClass: json.containsKey('StorageClass')
            ? json['StorageClass'] as String
            : null,
      );
}
