import 'package:meta/meta.dart';
import 'dart:typed_data';

/// An AWS Elemental MediaStore asset is an object, similar to an object in the
/// Amazon S3 service. Objects are the fundamental entities that are stored in
/// AWS Elemental MediaStore.
class MediaStoreDataApi {
  /// Deletes an object at the specified path.
  Future<void> deleteObject(String path) async {}

  /// Gets the headers for an object at the specified path.
  Future<void> describeObject(String path) async {}

  /// Downloads the object at the specified path. If the object’s upload
  /// availability is set to `streaming`, AWS Elemental MediaStore downloads the
  /// object even if it’s still uploading the object.
  Future<void> getObject(String path, {String range}) async {}

  /// Provides a list of metadata entries about folders and objects in the
  /// specified folder.
  Future<void> listItems(
      {String path, int maxResults, String nextToken}) async {}

  /// Uploads an object to the specified path. Object sizes are limited to 25 MB
  /// for standard upload availability and 10 MB for streaming upload
  /// availability.
  Future<void> putObject(
      {@required Uint8List body,
      @required String path,
      String contentType,
      String cacheControl,
      String storageClass,
      String uploadAvailability}) async {}
}

class DeleteObjectResponse {}

class DescribeObjectResponse {}

class GetObjectResponse {}

class Item {}

class ListItemsResponse {}

class PutObjectResponse {}
