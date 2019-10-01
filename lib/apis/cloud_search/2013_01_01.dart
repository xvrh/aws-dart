import 'package:meta/meta.dart';

/// Amazon CloudSearch Configuration Service
///
/// You use the Amazon CloudSearch configuration service to create, configure,
/// and manage search domains. Configuration service requests are submitted
/// using the AWS Query protocol. AWS Query requests are HTTP or HTTPS requests
/// submitted via HTTP GET or POST with a query parameter named Action.
///
/// The endpoint for configuration service requests is region-specific:
/// cloudsearch._region_.amazonaws.com. For example,
/// cloudsearch.us-east-1.amazonaws.com. For a current list of supported regions
/// and endpoints, see [Regions and
/// Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cloudsearch_region).
class CloudSearchApi {
  /// Indexes the search suggestions. For more information, see [Configuring
  /// Suggesters](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html#configuring-suggesters)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> buildSuggesters(String domainName) async {}

  /// Creates a new search domain. For more information, see [Creating a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> createDomain(String domainName) async {}

  /// Configures an analysis scheme that can be applied to a `text` or
  /// `text-array` field to define language-specific text processing options.
  /// For more information, see [Configuring Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> defineAnalysisScheme(
      {@required String domainName,
      @required AnalysisScheme analysisScheme}) async {}

  /// Configures an `Expression` for the search domain. Used to create new
  /// expressions and modify existing ones. If the expression exists, the new
  /// configuration replaces the old one. For more information, see [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> defineExpression(
      {@required String domainName, @required Expression expression}) async {}

  /// Configures an `IndexField` for the search domain. Used to create new
  /// fields and modify existing ones. You must specify the name of the domain
  /// you are configuring and an index field configuration. The index field
  /// configuration specifies a unique name, the index field type, and the
  /// options you want to configure for the field. The options you can specify
  /// depend on the `IndexFieldType`. If the field exists, the new configuration
  /// replaces the old one. For more information, see [Configuring Index
  /// Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> defineIndexField(
      {@required String domainName, @required IndexField indexField}) async {}

  /// Configures a suggester for a domain. A suggester enables you to display
  /// possible matches before users finish typing their queries. When you
  /// configure a suggester, you must specify the name of the text field you
  /// want to search for possible matches and a unique name for the suggester.
  /// For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> defineSuggester(
      {@required String domainName, @required Suggester suggester}) async {}

  /// Deletes an analysis scheme. For more information, see [Configuring
  /// Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> deleteAnalysisScheme(
      {@required String domainName,
      @required String analysisSchemeName}) async {}

  /// Permanently deletes a search domain and all of its data. Once a domain has
  /// been deleted, it cannot be recovered. For more information, see [Deleting
  /// a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> deleteDomain(String domainName) async {}

  /// Removes an `Expression` from the search domain. For more information, see
  /// [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> deleteExpression(
      {@required String domainName, @required String expressionName}) async {}

  /// Removes an `IndexField` from the search domain. For more information, see
  /// [Configuring Index
  /// Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> deleteIndexField(
      {@required String domainName, @required String indexFieldName}) async {}

  /// Deletes a suggester. For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> deleteSuggester(
      {@required String domainName, @required String suggesterName}) async {}

  /// Gets the analysis schemes configured for a domain. An analysis scheme
  /// defines language-specific text processing options for a `text` field. Can
  /// be limited to specific analysis schemes by name. By default, shows all
  /// analysis schemes and includes any pending changes to the configuration.
  /// Set the `Deployed` option to `true` to show the active configuration and
  /// exclude pending changes. For more information, see [Configuring Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeAnalysisSchemes(String domainName,
      {List<String> analysisSchemeNames, bool deployed}) async {}

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeAvailabilityOptions(String domainName,
      {bool deployed}) async {}

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default. To get the
  /// number of searchable documents in a domain, use the console or submit a
  /// `matchall` request to your domain's search endpoint:
  /// `q=matchall&amp;q.parser=structured&amp;size=0`. For more information, see
  /// [Getting Information about a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeDomains({List<String> domainNames}) async {}

  /// Gets the expressions configured for the search domain. Can be limited to
  /// specific expressions by name. By default, shows all expressions and
  /// includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeExpressions(String domainName,
      {List<String> expressionNames, bool deployed}) async {}

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. By default, shows all fields
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Getting Domain
  /// Information](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeIndexFields(String domainName,
      {List<String> fieldNames, bool deployed}) async {}

  /// Gets the scaling parameters configured for a domain. A domain's scaling
  /// parameters specify the desired search instance type and replication count.
  /// For more information, see [Configuring Scaling
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeScalingParameters(String domainName) async {}

  /// Gets information about the access policies that control access to the
  /// domain's document and search endpoints. By default, shows the
  /// configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see [Configuring Access for a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeServiceAccessPolicies(String domainName,
      {bool deployed}) async {}

  /// Gets the suggesters configured for a domain. A suggester enables you to
  /// display possible matches before users finish typing their queries. Can be
  /// limited to specific suggesters by name. By default, shows all suggesters
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> describeSuggesters(String domainName,
      {List<String> suggesterNames, bool deployed}) async {}

  /// Tells the search domain to start indexing its documents using the latest
  /// indexing options. This operation must be invoked to activate options whose
  /// OptionStatus is `RequiresIndexDocuments`.
  Future<void> indexDocuments(String domainName) async {}

  /// Lists all search domains owned by an account.
  Future<void> listDomainNames() async {}

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> updateAvailabilityOptions(
      {@required String domainName, @required bool multiAZ}) async {}

  /// Configures scaling parameters for a domain. A domain's scaling parameters
  /// specify the desired search instance type and replication count. Amazon
  /// CloudSearch will still automatically scale your domain based on the volume
  /// of data and traffic, but not below the desired instance type and
  /// replication count. If the Multi-AZ option is enabled, these values control
  /// the resources used per Availability Zone. For more information, see
  /// [Configuring Scaling
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<void> updateScalingParameters(
      {@required String domainName,
      @required ScalingParameters scalingParameters}) async {}

  /// Configures the access rules that control access to the domain's document
  /// and search endpoints. For more information, see  [Configuring Access for
  /// an Amazon CloudSearch
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html).
  Future<void> updateServiceAccessPolicies(
      {@required String domainName, @required String accessPolicies}) async {}
}

class AccessPoliciesStatus {}

class AnalysisOptions {}

class AnalysisScheme {}

class AnalysisSchemeStatus {}

class AvailabilityOptionsStatus {}

class BuildSuggestersResponse {}

class CreateDomainResponse {}

class DateArrayOptions {}

class DateOptions {}

class DefineAnalysisSchemeResponse {}

class DefineExpressionResponse {}

class DefineIndexFieldResponse {}

class DefineSuggesterResponse {}

class DeleteAnalysisSchemeResponse {}

class DeleteDomainResponse {}

class DeleteExpressionResponse {}

class DeleteIndexFieldResponse {}

class DeleteSuggesterResponse {}

class DescribeAnalysisSchemesResponse {}

class DescribeAvailabilityOptionsResponse {}

class DescribeDomainsResponse {}

class DescribeExpressionsResponse {}

class DescribeIndexFieldsResponse {}

class DescribeScalingParametersResponse {}

class DescribeServiceAccessPoliciesResponse {}

class DescribeSuggestersResponse {}

class DocumentSuggesterOptions {}

class DomainStatus {}

class DoubleArrayOptions {}

class DoubleOptions {}

class Expression {}

class ExpressionStatus {}

class IndexDocumentsResponse {}

class IndexField {}

class IndexFieldStatus {}

class IntArrayOptions {}

class IntOptions {}

class LatLonOptions {}

class Limits {}

class ListDomainNamesResponse {}

class LiteralArrayOptions {}

class LiteralOptions {}

class OptionStatus {}

class ScalingParameters {}

class ScalingParametersStatus {}

class ServiceEndpoint {}

class Suggester {}

class SuggesterStatus {}

class TextArrayOptions {}

class TextOptions {}

class UpdateAvailabilityOptionsResponse {}

class UpdateScalingParametersResponse {}

class UpdateServiceAccessPoliciesResponse {}
