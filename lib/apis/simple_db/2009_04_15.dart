import 'package:meta/meta.dart';

/// Amazon SimpleDB is a web service providing the core database functions of
/// data indexing and querying in the cloud. By offloading the time and effort
/// associated with building and operating a web-scale database, SimpleDB
/// provides developers the freedom to focus on application development.
///
///  A traditional, clustered relational database requires a sizable upfront
/// capital outlay, is complex to design, and often requires extensive and
/// repetitive database administration. Amazon SimpleDB is dramatically simpler,
/// requiring no schema, automatically indexing your data and providing a simple
/// API for storage and access. This approach eliminates the administrative
/// burden of data modeling, index maintenance, and performance tuning.
/// Developers gain access to this functionality within Amazon's proven
/// computing environment, are able to scale instantly, and pay only for what
/// they use.
///
///  Visit [http://aws.amazon.com/simpledb/](http://aws.amazon.com/simpledb/)
/// for more information.
class SimpleDBApi {
  ///  Performs multiple DeleteAttributes operations in a single call, which
  /// reduces round trips and latencies. This enables Amazon SimpleDB to
  /// optimize requests, which generally yields better throughput.
  ///
  ///   If you specify BatchDeleteAttributes without attributes or values, all
  /// the attributes for the item are deleted.
  ///
  ///  BatchDeleteAttributes is an idempotent operation; running it multiple
  /// times on the same item or attribute doesn't result in an error.
  ///
  ///  The BatchDeleteAttributes operation succeeds or fails in its entirety.
  /// There are no partial deletes. You can execute multiple
  /// BatchDeleteAttributes operations and other operations in parallel.
  /// However, large numbers of concurrent BatchDeleteAttributes calls can
  /// result in Service Unavailable (503) responses.
  ///
  ///  This operation is vulnerable to exceeding the maximum URL size when
  /// making a REST request using the HTTP GET method.
  ///
  ///  This operation does not support conditions using Expected.X.Name,
  /// Expected.X.Value, or Expected.X.Exists.
  ///
  ///  The following limitations are enforced for this operation:
  ///
  /// *   1 MB request size
  /// *   25 item limit per BatchDeleteAttributes operation
  ///
  /// [domainName]: The name of the domain in which the attributes are being
  /// deleted.
  ///
  /// [items]: A list of items on which to perform the operation.
  Future<void> batchDeleteAttributes(
      {@required String domainName,
      @required List<DeletableItem> items}) async {}

  ///  The `BatchPutAttributes` operation creates or replaces attributes within
  /// one or more items. By using this operation, the client can perform
  /// multiple PutAttribute operation with a single call. This helps yield
  /// savings in round trips and latencies, enabling Amazon SimpleDB to optimize
  /// requests and generally produce better throughput.
  ///
  ///  The client may specify the item name with the `Item.X.ItemName`
  /// parameter. The client may specify new attributes using a combination of
  /// the `Item.X.Attribute.Y.Name` and `Item.X.Attribute.Y.Value` parameters.
  /// The client may specify the first attribute for the first item using the
  /// parameters `Item.0.Attribute.0.Name` and `Item.0.Attribute.0.Value`, and
  /// for the second attribute for the first item by the parameters
  /// `Item.0.Attribute.1.Name` and `Item.0.Attribute.1.Value`, and so on.
  ///
  ///  Attributes are uniquely identified within an item by their name/value
  /// combination. For example, a single item can have the attributes `{
  /// "first_name", "first_value" }` and `{ "first_name", "second_value" }`.
  /// However, it cannot have two attribute instances where both the
  /// `Item.X.Attribute.Y.Name` and `Item.X.Attribute.Y.Value` are the same.
  ///
  ///  Optionally, the requester can supply the `Replace` parameter for each
  /// individual value. Setting this value to `true` will cause the new
  /// attribute values to replace the existing attribute values. For example, if
  /// an item `I` has the attributes `{ 'a', '1' }, { 'b', '2'}` and `{ 'b', '3'
  /// }` and the requester does a BatchPutAttributes of `{'I', 'b', '4' }` with
  /// the Replace parameter set to true, the final attributes of the item will
  /// be `{ 'a', '1' }` and `{ 'b', '4' }`, replacing the previous values of the
  /// 'b' attribute with the new value.
  ///
  ///   You cannot specify an empty string as an item or as an attribute name.
  /// The `BatchPutAttributes` operation succeeds or fails in its entirety.
  /// There are no partial puts.   This operation is vulnerable to exceeding the
  /// maximum URL size when making a REST request using the HTTP GET method.
  /// This operation does not support conditions using `Expected.X.Name`,
  /// `Expected.X.Value`, or `Expected.X.Exists`.
  ///
  ///  You can execute multiple `BatchPutAttributes` operations and other
  /// operations in parallel. However, large numbers of concurrent
  /// `BatchPutAttributes` calls can result in Service Unavailable (503)
  /// responses.
  ///
  ///  The following limitations are enforced for this operation:
  ///
  /// *   256 attribute name-value pairs per item
  /// *   1 MB request size
  /// *   1 billion attributes per domain
  /// *   10 GB of total user data storage per domain
  /// *   25 item limit per `BatchPutAttributes` operation
  ///
  /// [domainName]: The name of the domain in which the attributes are being
  /// stored.
  ///
  /// [items]: A list of items on which to perform the operation.
  Future<void> batchPutAttributes(
      {@required String domainName,
      @required List<ReplaceableItem> items}) async {}

  ///  The `CreateDomain` operation creates a new domain. The domain name should
  /// be unique among the domains associated with the Access Key ID provided in
  /// the request. The `CreateDomain` operation may take 10 or more seconds to
  /// complete.
  ///
  ///   CreateDomain is an idempotent operation; running it multiple times using
  /// the same domain name will not result in an error response.
  ///
  ///  The client can create up to 100 domains per account.
  ///
  ///  If the client requires additional domains, go to
  /// [http://aws.amazon.com/contact-us/simpledb-limit-request/](http://aws.amazon.com/contact-us/simpledb-limit-request/).
  ///
  /// [domainName]: The name of the domain to create. The name can range between
  /// 3 and 255 characters and can contain the following characters: a-z, A-Z,
  /// 0-9, '_', '-', and '.'.
  Future<void> createDomain(String domainName) async {}

  ///  Deletes one or more attributes associated with an item. If all attributes
  /// of the item are deleted, the item is deleted.
  ///
  ///   If `DeleteAttributes` is called without being passed any attributes or
  /// values specified, all the attributes for the item are deleted.
  ///
  ///  `DeleteAttributes` is an idempotent operation; running it multiple times
  /// on the same item or attribute does not result in an error response.
  ///
  ///  Because Amazon SimpleDB makes multiple copies of item data and uses an
  /// eventual consistency update model, performing a GetAttributes or Select
  /// operation (read) immediately after a `DeleteAttributes` or PutAttributes
  /// operation (write) might not return updated item data.
  ///
  /// [domainName]: The name of the domain in which to perform the operation.
  ///
  /// [itemName]: The name of the item. Similar to rows on a spreadsheet, items
  /// represent individual objects that contain one or more value-attribute
  /// pairs.
  ///
  /// [attributes]: A list of Attributes. Similar to columns on a spreadsheet,
  /// attributes represent categories of data that can be assigned to items.
  ///
  /// [expected]: The update condition which, if specified, determines whether
  /// the specified attributes will be deleted or not. The update condition must
  /// be satisfied in order for this request to be processed and the attributes
  /// to be deleted.
  Future<void> deleteAttributes(
      {@required String domainName,
      @required String itemName,
      List<DeletableAttribute> attributes,
      UpdateCondition expected}) async {}

  ///  The `DeleteDomain` operation deletes a domain. Any items (and their
  /// attributes) in the domain are deleted as well. The `DeleteDomain`
  /// operation might take 10 or more seconds to complete.
  ///
  ///   Running `DeleteDomain` on a domain that does not exist or running the
  /// function multiple times using the same domain name will not result in an
  /// error response.
  ///
  /// [domainName]: The name of the domain to delete.
  Future<void> deleteDomain(String domainName) async {}

  ///  Returns information about the domain, including when the domain was
  /// created, the number of items and attributes in the domain, and the size of
  /// the attribute names and values.
  ///
  /// [domainName]: The name of the domain for which to display the metadata of.
  Future<DomainMetadataResult> domainMetadata(String domainName) async {
    return DomainMetadataResult.fromJson({});
  }

  ///  Returns all of the attributes associated with the specified item.
  /// Optionally, the attributes returned can be limited to one or more
  /// attributes by specifying an attribute name parameter.
  ///
  ///  If the item does not exist on the replica that was accessed for this
  /// operation, an empty set is returned. The system does not return an error
  /// as it cannot guarantee the item does not exist on other replicas.
  ///
  ///   If GetAttributes is called without being passed any attribute names, all
  /// the attributes for the item are returned.
  ///
  /// [domainName]: The name of the domain in which to perform the operation.
  ///
  /// [itemName]: The name of the item.
  ///
  /// [attributeNames]: The names of the attributes.
  ///
  /// [consistentRead]: Determines whether or not strong consistency should be
  /// enforced when data is read from SimpleDB. If `true`, any data previously
  /// written to SimpleDB will be returned. Otherwise, results will be
  /// consistent eventually, and the client may not see data that was written
  /// immediately before your read.
  Future<GetAttributesResult> getAttributes(
      {@required String domainName,
      @required String itemName,
      List<String> attributeNames,
      bool consistentRead}) async {
    return GetAttributesResult.fromJson({});
  }

  ///  The `ListDomains` operation lists all domains associated with the Access
  /// Key ID. It returns domain names up to the limit set by
  /// [MaxNumberOfDomains](#MaxNumberOfDomains). A [NextToken](#NextToken) is
  /// returned if there are more than `MaxNumberOfDomains` domains. Calling
  /// `ListDomains` successive times with the `NextToken` provided by the
  /// operation returns up to `MaxNumberOfDomains` more domain names with each
  /// successive operation call.
  ///
  /// [maxNumberOfDomains]: The maximum number of domain names you want
  /// returned. The range is 1 to 100. The default setting is 100.
  ///
  /// [nextToken]: A string informing Amazon SimpleDB where to start the next
  /// list of domain names.
  Future<ListDomainsResult> listDomains(
      {int maxNumberOfDomains, String nextToken}) async {
    return ListDomainsResult.fromJson({});
  }

  ///  The PutAttributes operation creates or replaces attributes in an item.
  /// The client may specify new attributes using a combination of the
  /// `Attribute.X.Name` and `Attribute.X.Value` parameters. The client
  /// specifies the first attribute by the parameters `Attribute.0.Name` and
  /// `Attribute.0.Value`, the second attribute by the parameters
  /// `Attribute.1.Name` and `Attribute.1.Value`, and so on.
  ///
  ///  Attributes are uniquely identified in an item by their name/value
  /// combination. For example, a single item can have the attributes `{
  /// "first_name", "first_value" }` and `{ "first_name", second_value" }`.
  /// However, it cannot have two attribute instances where both the
  /// `Attribute.X.Name` and `Attribute.X.Value` are the same.
  ///
  ///  Optionally, the requestor can supply the `Replace` parameter for each
  /// individual attribute. Setting this value to `true` causes the new
  /// attribute value to replace the existing attribute value(s). For example,
  /// if an item has the attributes `{ 'a', '1' }`, `{ 'b', '2'}` and `{ 'b',
  /// '3' }` and the requestor calls `PutAttributes` using the attributes `{
  /// 'b', '4' }` with the `Replace` parameter set to true, the final attributes
  /// of the item are changed to `{ 'a', '1' }` and `{ 'b', '4' }`, which
  /// replaces the previous values of the 'b' attribute with the new value.
  ///
  ///   Using `PutAttributes` to replace attribute values that do not exist will
  /// not result in an error response.
  ///
  ///  You cannot specify an empty string as an attribute name.
  ///
  ///  Because Amazon SimpleDB makes multiple copies of client data and uses an
  /// eventual consistency update model, an immediate GetAttributes or Select
  /// operation (read) immediately after a PutAttributes or DeleteAttributes
  /// operation (write) might not return the updated data.
  ///
  ///  The following limitations are enforced for this operation:
  ///
  /// *   256 total attribute name-value pairs per item
  /// *   One billion attributes per domain
  /// *   10 GB of total user data storage per domain
  ///
  /// [domainName]: The name of the domain in which to perform the operation.
  ///
  /// [itemName]: The name of the item.
  ///
  /// [attributes]: The list of attributes.
  ///
  /// [expected]: The update condition which, if specified, determines whether
  /// the specified attributes will be updated or not. The update condition must
  /// be satisfied in order for this request to be processed and the attributes
  /// to be updated.
  Future<void> putAttributes(
      {@required String domainName,
      @required String itemName,
      @required List<ReplaceableAttribute> attributes,
      UpdateCondition expected}) async {}

  ///  The `Select` operation returns a set of attributes for `ItemNames` that
  /// match the select expression. `Select` is similar to the standard SQL
  /// SELECT statement.
  ///
  ///  The total size of the response cannot exceed 1 MB in total size. Amazon
  /// SimpleDB automatically adjusts the number of items returned per page to
  /// enforce this limit. For example, if the client asks to retrieve 2500
  /// items, but each individual item is 10 kB in size, the system returns 100
  /// items and an appropriate `NextToken` so the client can access the next
  /// page of results.
  ///
  ///  For information on how to construct select expressions, see Using Select
  /// to Create Amazon SimpleDB Queries in the Developer Guide.
  ///
  /// [selectExpression]: The expression used to query the domain.
  ///
  /// [nextToken]: A string informing Amazon SimpleDB where to start the next
  /// list of `ItemNames`.
  ///
  /// [consistentRead]: Determines whether or not strong consistency should be
  /// enforced when data is read from SimpleDB. If `true`, any data previously
  /// written to SimpleDB will be returned. Otherwise, results will be
  /// consistent eventually, and the client may not see data that was written
  /// immediately before your read.
  Future<SelectResult> select(String selectExpression,
      {String nextToken, bool consistentRead}) async {
    return SelectResult.fromJson({});
  }
}

class Attribute {
  /// The name of the attribute.
  final String name;

  final String alternateNameEncoding;

  /// The value of the attribute.
  final String value;

  final String alternateValueEncoding;

  Attribute({
    @required this.name,
    this.alternateNameEncoding,
    @required this.value,
    this.alternateValueEncoding,
  });
  static Attribute fromJson(Map<String, dynamic> json) => Attribute();
}

class DeletableAttribute {
  /// The name of the attribute.
  final String name;

  /// The value of the attribute.
  final String value;

  DeletableAttribute({
    @required this.name,
    this.value,
  });
}

class DeletableItem {
  final String name;

  final List<DeletableAttribute> attributes;

  DeletableItem({
    @required this.name,
    this.attributes,
  });
}

class DomainMetadataResult {
  /// The number of all items in the domain.
  final int itemCount;

  /// The total size of all item names in the domain, in bytes.
  final BigInt itemNamesSizeBytes;

  /// The number of unique attribute names in the domain.
  final int attributeNameCount;

  /// The total size of all unique attribute names in the domain, in bytes.
  final BigInt attributeNamesSizeBytes;

  /// The number of all attribute name/value pairs in the domain.
  final int attributeValueCount;

  /// The total size of all attribute values in the domain, in bytes.
  final BigInt attributeValuesSizeBytes;

  /// The data and time when metadata was calculated, in Epoch (UNIX) seconds.
  final int timestamp;

  DomainMetadataResult({
    this.itemCount,
    this.itemNamesSizeBytes,
    this.attributeNameCount,
    this.attributeNamesSizeBytes,
    this.attributeValueCount,
    this.attributeValuesSizeBytes,
    this.timestamp,
  });
  static DomainMetadataResult fromJson(Map<String, dynamic> json) =>
      DomainMetadataResult();
}

class GetAttributesResult {
  /// The list of attributes returned by the operation.
  final List<Attribute> attributes;

  GetAttributesResult({
    this.attributes,
  });
  static GetAttributesResult fromJson(Map<String, dynamic> json) =>
      GetAttributesResult();
}

class Item {
  /// The name of the item.
  final String name;

  final String alternateNameEncoding;

  /// A list of attributes.
  final List<Attribute> attributes;

  Item({
    @required this.name,
    this.alternateNameEncoding,
    @required this.attributes,
  });
  static Item fromJson(Map<String, dynamic> json) => Item();
}

class ListDomainsResult {
  /// A list of domain names that match the expression.
  final List<String> domainNames;

  /// An opaque token indicating that there are more domains than the specified
  /// `MaxNumberOfDomains` still available.
  final String nextToken;

  ListDomainsResult({
    this.domainNames,
    this.nextToken,
  });
  static ListDomainsResult fromJson(Map<String, dynamic> json) =>
      ListDomainsResult();
}

class ReplaceableAttribute {
  /// The name of the replaceable attribute.
  final String name;

  /// The value of the replaceable attribute.
  final String value;

  /// A flag specifying whether or not to replace the attribute/value pair or to
  /// add a new attribute/value pair. The default setting is `false`.
  final bool replace;

  ReplaceableAttribute({
    @required this.name,
    @required this.value,
    this.replace,
  });
}

class ReplaceableItem {
  /// The name of the replaceable item.
  final String name;

  /// The list of attributes for a replaceable item.
  final List<ReplaceableAttribute> attributes;

  ReplaceableItem({
    @required this.name,
    @required this.attributes,
  });
}

class SelectResult {
  /// A list of items that match the select expression.
  final List<Item> items;

  /// An opaque token indicating that more items than `MaxNumberOfItems` were
  /// matched, the response size exceeded 1 megabyte, or the execution time
  /// exceeded 5 seconds.
  final String nextToken;

  SelectResult({
    this.items,
    this.nextToken,
  });
  static SelectResult fromJson(Map<String, dynamic> json) => SelectResult();
}

///  Specifies the conditions under which data should be updated. If an update
/// condition is specified for a request, the data will only be updated if the
/// condition is satisfied. For example, if an attribute with a specific name
/// and value exists, or if a specific attribute doesn't exist.
class UpdateCondition {
  /// The name of the attribute involved in the condition.
  final String name;

  /// The value of an attribute. This value can only be specified when the
  /// `Exists` parameter is equal to `true`.
  final String value;

  /// A value specifying whether or not the specified attribute must exist with
  /// the specified value in order for the update condition to be satisfied.
  /// Specify `true` if the attribute must exist for the update condition to be
  /// satisfied. Specify `false` if the attribute should not exist in order for
  /// the update condition to be satisfied.
  final bool exists;

  UpdateCondition({
    this.name,
    this.value,
    this.exists,
  });
}
