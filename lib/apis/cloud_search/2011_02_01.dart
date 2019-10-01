import 'package:meta/meta.dart';

/// Amazon CloudSearch Configuration Service
///
/// You use the configuration service to create, configure, and manage search
/// domains. Configuration service requests are submitted using the AWS Query
/// protocol. AWS Query requests are HTTP or HTTPS requests submitted via HTTP
/// GET or POST with a query parameter named Action.
///
/// The endpoint for configuration service requests is region-specific:
/// cloudsearch._region_.amazonaws.com. For example,
/// cloudsearch.us-east-1.amazonaws.com. For a current list of supported regions
/// and endpoints, see [Regions and
/// Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cloudsearch_region).
class CloudSearchApi {
  /// Creates a new search domain.
  Future<void> createDomain(String domainName) async {}

  /// Configures an `IndexField` for the search domain. Used to create new
  /// fields and modify existing ones. If the field exists, the new
  /// configuration replaces the old one. You can configure a maximum of 200
  /// index fields.
  Future<void> defineIndexField(
      {@required String domainName, @required IndexField indexField}) async {}

  /// Configures a `RankExpression` for the search domain. Used to create new
  /// rank expressions and modify existing ones. If the expression exists, the
  /// new configuration replaces the old one. You can configure a maximum of 50
  /// rank expressions.
  Future<void> defineRankExpression(
      {@required String domainName,
      @required NamedRankExpression rankExpression}) async {}

  /// Permanently deletes a search domain and all of its data.
  Future<void> deleteDomain(String domainName) async {}

  /// Removes an `IndexField` from the search domain.
  Future<void> deleteIndexField(
      {@required String domainName, @required String indexFieldName}) async {}

  /// Removes a `RankExpression` from the search domain.
  Future<void> deleteRankExpression(
      {@required String domainName, @required String rankName}) async {}

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeAvailabilityOptions(String domainName) async {}

  /// Gets the default search field configured for the search domain.
  Future<void> describeDefaultSearchField(String domainName) async {}

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default.
  Future<void> describeDomains({List<String> domainNames}) async {}

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. Shows all fields by default.
  Future<void> describeIndexFields(String domainName,
      {List<String> fieldNames}) async {}

  /// Gets the rank expressions configured for the search domain. Can be limited
  /// to specific rank expressions by name. Shows all rank expressions by
  /// default.
  Future<void> describeRankExpressions(String domainName,
      {List<String> rankNames}) async {}

  /// Gets information about the resource-based policies that control access to
  /// the domain's document and search services.
  Future<void> describeServiceAccessPolicies(String domainName) async {}

  /// Gets the stemming dictionary configured for the search domain.
  Future<void> describeStemmingOptions(String domainName) async {}

  /// Gets the stopwords configured for the search domain.
  Future<void> describeStopwordOptions(String domainName) async {}

  /// Gets the synonym dictionary configured for the search domain.
  Future<void> describeSynonymOptions(String domainName) async {}

  /// Tells the search domain to start indexing its documents using the latest
  /// text processing options and `IndexFields`. This operation must be invoked
  /// to make options whose OptionStatus has `OptionState` of
  /// `RequiresIndexDocuments` visible in search results.
  Future<void> indexDocuments(String domainName) async {}

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> updateAvailabilityOptions(
      {@required String domainName, @required bool multiAZ}) async {}

  /// Configures the default search field for the search domain. The default
  /// search field is the text field that is searched when a search request does
  /// not specify which fields to search. By default, it is configured to
  /// include the contents of all of the domain's text fields.
  Future<void> updateDefaultSearchField(
      {@required String domainName,
      @required String defaultSearchField}) async {}

  /// Configures the policies that control access to the domain's document and
  /// search services. The maximum size of an access policy document is 100 KB.
  Future<void> updateServiceAccessPolicies(
      {@required String domainName, @required String accessPolicies}) async {}

  /// Configures a stemming dictionary for the search domain. The stemming
  /// dictionary is used during indexing and when processing search requests.
  /// The maximum size of the stemming dictionary is 500 KB.
  Future<void> updateStemmingOptions(
      {@required String domainName, @required String stems}) async {}

  /// Configures stopwords for the search domain. Stopwords are used during
  /// indexing and when processing search requests. The maximum size of the
  /// stopwords dictionary is 10 KB.
  Future<void> updateStopwordOptions(
      {@required String domainName, @required String stopwords}) async {}

  /// Configures a synonym dictionary for the search domain. The synonym
  /// dictionary is used during indexing to configure mappings for terms that
  /// occur in text fields. The maximum size of the synonym dictionary is 100
  /// KB.
  Future<void> updateSynonymOptions(
      {@required String domainName, @required String synonyms}) async {}
}

class AccessPoliciesStatus {}

class AvailabilityOptionsStatus {}

class CreateDomainResponse {}

class DefaultSearchFieldStatus {}

class DefineIndexFieldResponse {}

class DefineRankExpressionResponse {}

class DeleteDomainResponse {}

class DeleteIndexFieldResponse {}

class DeleteRankExpressionResponse {}

class DescribeAvailabilityOptionsResponse {}

class DescribeDefaultSearchFieldResponse {}

class DescribeDomainsResponse {}

class DescribeIndexFieldsResponse {}

class DescribeRankExpressionsResponse {}

class DescribeServiceAccessPoliciesResponse {}

class DescribeStemmingOptionsResponse {}

class DescribeStopwordOptionsResponse {}

class DescribeSynonymOptionsResponse {}

class DomainStatus {}

class IndexDocumentsResponse {}

class IndexField {}

class IndexFieldStatus {}

class LiteralOptions {}

class NamedRankExpression {}

class OptionStatus {}

class RankExpressionStatus {}

class ServiceEndpoint {}

class SourceAttribute {}

class SourceData {}

class SourceDataMap {}

class SourceDataTrimTitle {}

class StemmingOptionsStatus {}

class StopwordOptionsStatus {}

class SynonymOptionsStatus {}

class TextOptions {}

class UIntOptions {}

class UpdateAvailabilityOptionsResponse {}

class UpdateDefaultSearchFieldResponse {}

class UpdateServiceAccessPoliciesResponse {}

class UpdateStemmingOptionsResponse {}

class UpdateStopwordOptionsResponse {}

class UpdateSynonymOptionsResponse {}
