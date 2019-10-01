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
  Future<BuildSuggestersResponse> buildSuggesters(String domainName) async {
    return BuildSuggestersResponse.fromJson({});
  }

  /// Creates a new search domain. For more information, see [Creating a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: A name for the domain you are creating. Allowed characters
  /// are a-z (lower-case letters), 0-9, and hyphen (-). Domain names must start
  /// with a letter or number and be at least 3 and no more than 28 characters
  /// long.
  Future<CreateDomainResponse> createDomain(String domainName) async {
    return CreateDomainResponse.fromJson({});
  }

  /// Configures an analysis scheme that can be applied to a `text` or
  /// `text-array` field to define language-specific text processing options.
  /// For more information, see [Configuring Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineAnalysisSchemeResponse> defineAnalysisScheme(
      {@required String domainName,
      @required AnalysisScheme analysisScheme}) async {
    return DefineAnalysisSchemeResponse.fromJson({});
  }

  /// Configures an `Expression` for the search domain. Used to create new
  /// expressions and modify existing ones. If the expression exists, the new
  /// configuration replaces the old one. For more information, see [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineExpressionResponse> defineExpression(
      {@required String domainName, @required Expression expression}) async {
    return DefineExpressionResponse.fromJson({});
  }

  /// Configures an `IndexField` for the search domain. Used to create new
  /// fields and modify existing ones. You must specify the name of the domain
  /// you are configuring and an index field configuration. The index field
  /// configuration specifies a unique name, the index field type, and the
  /// options you want to configure for the field. The options you can specify
  /// depend on the `IndexFieldType`. If the field exists, the new configuration
  /// replaces the old one. For more information, see [Configuring Index
  /// Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [indexField]: The index field and field options you want to configure.
  Future<DefineIndexFieldResponse> defineIndexField(
      {@required String domainName, @required IndexField indexField}) async {
    return DefineIndexFieldResponse.fromJson({});
  }

  /// Configures a suggester for a domain. A suggester enables you to display
  /// possible matches before users finish typing their queries. When you
  /// configure a suggester, you must specify the name of the text field you
  /// want to search for possible matches and a unique name for the suggester.
  /// For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineSuggesterResponse> defineSuggester(
      {@required String domainName, @required Suggester suggester}) async {
    return DefineSuggesterResponse.fromJson({});
  }

  /// Deletes an analysis scheme. For more information, see [Configuring
  /// Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [analysisSchemeName]: The name of the analysis scheme you want to delete.
  Future<DeleteAnalysisSchemeResponse> deleteAnalysisScheme(
      {@required String domainName,
      @required String analysisSchemeName}) async {
    return DeleteAnalysisSchemeResponse.fromJson({});
  }

  /// Permanently deletes a search domain and all of its data. Once a domain has
  /// been deleted, it cannot be recovered. For more information, see [Deleting
  /// a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to permanently delete.
  Future<DeleteDomainResponse> deleteDomain(String domainName) async {
    return DeleteDomainResponse.fromJson({});
  }

  /// Removes an `Expression` from the search domain. For more information, see
  /// [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [expressionName]: The name of the `Expression` to delete.
  Future<DeleteExpressionResponse> deleteExpression(
      {@required String domainName, @required String expressionName}) async {
    return DeleteExpressionResponse.fromJson({});
  }

  /// Removes an `IndexField` from the search domain. For more information, see
  /// [Configuring Index
  /// Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [indexFieldName]: The name of the index field your want to remove from the
  /// domain's indexing options.
  Future<DeleteIndexFieldResponse> deleteIndexField(
      {@required String domainName, @required String indexFieldName}) async {
    return DeleteIndexFieldResponse.fromJson({});
  }

  /// Deletes a suggester. For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [suggesterName]: Specifies the name of the suggester you want to delete.
  Future<DeleteSuggesterResponse> deleteSuggester(
      {@required String domainName, @required String suggesterName}) async {
    return DeleteSuggesterResponse.fromJson({});
  }

  /// Gets the analysis schemes configured for a domain. An analysis scheme
  /// defines language-specific text processing options for a `text` field. Can
  /// be limited to specific analysis schemes by name. By default, shows all
  /// analysis schemes and includes any pending changes to the configuration.
  /// Set the `Deployed` option to `true` to show the active configuration and
  /// exclude pending changes. For more information, see [Configuring Analysis
  /// Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [analysisSchemeNames]: The analysis schemes you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeAnalysisSchemesResponse> describeAnalysisSchemes(
      String domainName,
      {List<String> analysisSchemeNames,
      bool deployed}) async {
    return DescribeAnalysisSchemesResponse.fromJson({});
  }

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions(
      String domainName,
      {bool deployed}) async {
    return DescribeAvailabilityOptionsResponse.fromJson({});
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default. To get the
  /// number of searchable documents in a domain, use the console or submit a
  /// `matchall` request to your domain's search endpoint:
  /// `q=matchall&amp;q.parser=structured&amp;size=0`. For more information, see
  /// [Getting Information about a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainNames]: The names of the domains you want to include in the
  /// response.
  Future<DescribeDomainsResponse> describeDomains(
      {List<String> domainNames}) async {
    return DescribeDomainsResponse.fromJson({});
  }

  /// Gets the expressions configured for the search domain. Can be limited to
  /// specific expressions by name. By default, shows all expressions and
  /// includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Configuring
  /// Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [expressionNames]: Limits the `DescribeExpressions` response to the
  /// specified expressions. If not specified, all expressions are shown.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeExpressionsResponse> describeExpressions(String domainName,
      {List<String> expressionNames, bool deployed}) async {
    return DescribeExpressionsResponse.fromJson({});
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. By default, shows all fields
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Getting Domain
  /// Information](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [fieldNames]: A list of the index fields you want to describe. If not
  /// specified, information is returned for all configured index fields.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeIndexFieldsResponse> describeIndexFields(String domainName,
      {List<String> fieldNames, bool deployed}) async {
    return DescribeIndexFieldsResponse.fromJson({});
  }

  /// Gets the scaling parameters configured for a domain. A domain's scaling
  /// parameters specify the desired search instance type and replication count.
  /// For more information, see [Configuring Scaling
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DescribeScalingParametersResponse> describeScalingParameters(
      String domainName) async {
    return DescribeScalingParametersResponse.fromJson({});
  }

  /// Gets information about the access policies that control access to the
  /// domain's document and search endpoints. By default, shows the
  /// configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see [Configuring Access for a Search
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies(
      String domainName,
      {bool deployed}) async {
    return DescribeServiceAccessPoliciesResponse.fromJson({});
  }

  /// Gets the suggesters configured for a domain. A suggester enables you to
  /// display possible matches before users finish typing their queries. Can be
  /// limited to specific suggesters by name. By default, shows all suggesters
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see [Getting Search
  /// Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [suggesterNames]: The suggesters you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeSuggestersResponse> describeSuggesters(String domainName,
      {List<String> suggesterNames, bool deployed}) async {
    return DescribeSuggestersResponse.fromJson({});
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// indexing options. This operation must be invoked to activate options whose
  /// OptionStatus is `RequiresIndexDocuments`.
  Future<IndexDocumentsResponse> indexDocuments(String domainName) async {
    return IndexDocumentsResponse.fromJson({});
  }

  /// Lists all search domains owned by an account.
  Future<ListDomainNamesResponse> listDomainNames() async {
    return ListDomainNamesResponse.fromJson({});
  }

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see [Configuring Availability
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [multiAZ]: You expand an existing search domain to a second Availability
  /// Zone by setting the Multi-AZ option to true. Similarly, you can turn off
  /// the Multi-AZ option to downgrade the domain to a single Availability Zone
  /// by setting the Multi-AZ option to `false`.
  Future<UpdateAvailabilityOptionsResponse> updateAvailabilityOptions(
      {@required String domainName, @required bool multiAZ}) async {
    return UpdateAvailabilityOptionsResponse.fromJson({});
  }

  /// Configures scaling parameters for a domain. A domain's scaling parameters
  /// specify the desired search instance type and replication count. Amazon
  /// CloudSearch will still automatically scale your domain based on the volume
  /// of data and traffic, but not below the desired instance type and
  /// replication count. If the Multi-AZ option is enabled, these values control
  /// the resources used per Availability Zone. For more information, see
  /// [Configuring Scaling
  /// Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<UpdateScalingParametersResponse> updateScalingParameters(
      {@required String domainName,
      @required ScalingParameters scalingParameters}) async {
    return UpdateScalingParametersResponse.fromJson({});
  }

  /// Configures the access rules that control access to the domain's document
  /// and search endpoints. For more information, see  [Configuring Access for
  /// an Amazon CloudSearch
  /// Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html).
  ///
  /// [accessPolicies]: The access rules you want to configure. These rules
  /// replace any existing rules.
  Future<UpdateServiceAccessPoliciesResponse> updateServiceAccessPolicies(
      {@required String domainName, @required String accessPolicies}) async {
    return UpdateServiceAccessPoliciesResponse.fromJson({});
  }
}

class AccessPoliciesStatus {
  final String options;

  final OptionStatus status;

  AccessPoliciesStatus({
    @required this.options,
    @required this.status,
  });
  static AccessPoliciesStatus fromJson(Map<String, dynamic> json) =>
      AccessPoliciesStatus();
}

class AnalysisOptions {
  /// A JSON object that defines synonym groups and aliases. A synonym group is
  /// an array of arrays, where each sub-array is a group of terms where each
  /// term in the group is considered a synonym of every other term in the
  /// group. The aliases value is an object that contains a collection of
  /// string:value pairs where the string specifies a term and the array of
  /// values specifies each of the aliases for that term. An alias is considered
  /// a synonym of the specified term, but the term is not considered a synonym
  /// of the alias. For more information about specifying synonyms, see
  /// [Synonyms](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html#synonyms)
  /// in the _Amazon CloudSearch Developer Guide_.
  final String synonyms;

  /// A JSON array of terms to ignore during indexing and searching. For
  /// example, `\["a", "an", "the", "of"\]`. The stopwords dictionary must
  /// explicitly list each word you want to ignore. Wildcards and regular
  /// expressions are not supported.
  final String stopwords;

  /// A JSON object that contains a collection of string:value pairs that each
  /// map a term to its stem. For example, `{"term1": "stem1", "term2": "stem2",
  /// "term3": "stem3"}`. The stemming dictionary is applied in addition to any
  /// algorithmic stemming. This enables you to override the results of the
  /// algorithmic stemming to correct specific cases of overstemming or
  /// understemming. The maximum size of a stemming dictionary is 500 KB.
  final String stemmingDictionary;

  /// A JSON array that contains a collection of terms, tokens, readings and
  /// part of speech for Japanese Tokenizaiton. The Japanese tokenization
  /// dictionary enables you to override the default tokenization for selected
  /// terms. This is only valid for Japanese language fields.
  final String japaneseTokenizationDictionary;

  /// The level of algorithmic stemming to perform: `none`, `minimal`, `light`,
  /// or `full`. The available levels vary depending on the language. For more
  /// information, see [Language Specific Text Processing
  /// Settings](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/text-processing.html#text-processing-settings)
  /// in the _Amazon CloudSearch Developer Guide_
  final String algorithmicStemming;

  AnalysisOptions({
    this.synonyms,
    this.stopwords,
    this.stemmingDictionary,
    this.japaneseTokenizationDictionary,
    this.algorithmicStemming,
  });
  static AnalysisOptions fromJson(Map<String, dynamic> json) =>
      AnalysisOptions();
}

class AnalysisScheme {
  final String analysisSchemeName;

  final String analysisSchemeLanguage;

  final AnalysisOptions analysisOptions;

  AnalysisScheme({
    @required this.analysisSchemeName,
    @required this.analysisSchemeLanguage,
    this.analysisOptions,
  });
  static AnalysisScheme fromJson(Map<String, dynamic> json) => AnalysisScheme();
}

class AnalysisSchemeStatus {
  final AnalysisScheme options;

  final OptionStatus status;

  AnalysisSchemeStatus({
    @required this.options,
    @required this.status,
  });
  static AnalysisSchemeStatus fromJson(Map<String, dynamic> json) =>
      AnalysisSchemeStatus();
}

class AvailabilityOptionsStatus {
  /// The availability options configured for the domain.
  final bool options;

  final OptionStatus status;

  AvailabilityOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static AvailabilityOptionsStatus fromJson(Map<String, dynamic> json) =>
      AvailabilityOptionsStatus();
}

class BuildSuggestersResponse {
  final List<String> fieldNames;

  BuildSuggestersResponse({
    this.fieldNames,
  });
  static BuildSuggestersResponse fromJson(Map<String, dynamic> json) =>
      BuildSuggestersResponse();
}

class CreateDomainResponse {
  final DomainStatus domainStatus;

  CreateDomainResponse({
    this.domainStatus,
  });
  static CreateDomainResponse fromJson(Map<String, dynamic> json) =>
      CreateDomainResponse();
}

class DateArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  /// A list of source fields to map to the field.
  final String sourceFields;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  DateArrayOptions({
    this.defaultValue,
    this.sourceFields,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
  });
  static DateArrayOptions fromJson(Map<String, dynamic> json) =>
      DateArrayOptions();
}

class DateOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  final String sourceField;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  DateOptions({
    this.defaultValue,
    this.sourceField,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
    this.sortEnabled,
  });
  static DateOptions fromJson(Map<String, dynamic> json) => DateOptions();
}

class DefineAnalysisSchemeResponse {
  final AnalysisSchemeStatus analysisScheme;

  DefineAnalysisSchemeResponse({
    @required this.analysisScheme,
  });
  static DefineAnalysisSchemeResponse fromJson(Map<String, dynamic> json) =>
      DefineAnalysisSchemeResponse();
}

class DefineExpressionResponse {
  final ExpressionStatus expression;

  DefineExpressionResponse({
    @required this.expression,
  });
  static DefineExpressionResponse fromJson(Map<String, dynamic> json) =>
      DefineExpressionResponse();
}

class DefineIndexFieldResponse {
  final IndexFieldStatus indexField;

  DefineIndexFieldResponse({
    @required this.indexField,
  });
  static DefineIndexFieldResponse fromJson(Map<String, dynamic> json) =>
      DefineIndexFieldResponse();
}

class DefineSuggesterResponse {
  final SuggesterStatus suggester;

  DefineSuggesterResponse({
    @required this.suggester,
  });
  static DefineSuggesterResponse fromJson(Map<String, dynamic> json) =>
      DefineSuggesterResponse();
}

class DeleteAnalysisSchemeResponse {
  /// The status of the analysis scheme being deleted.
  final AnalysisSchemeStatus analysisScheme;

  DeleteAnalysisSchemeResponse({
    @required this.analysisScheme,
  });
  static DeleteAnalysisSchemeResponse fromJson(Map<String, dynamic> json) =>
      DeleteAnalysisSchemeResponse();
}

class DeleteDomainResponse {
  final DomainStatus domainStatus;

  DeleteDomainResponse({
    this.domainStatus,
  });
  static DeleteDomainResponse fromJson(Map<String, dynamic> json) =>
      DeleteDomainResponse();
}

class DeleteExpressionResponse {
  /// The status of the expression being deleted.
  final ExpressionStatus expression;

  DeleteExpressionResponse({
    @required this.expression,
  });
  static DeleteExpressionResponse fromJson(Map<String, dynamic> json) =>
      DeleteExpressionResponse();
}

class DeleteIndexFieldResponse {
  /// The status of the index field being deleted.
  final IndexFieldStatus indexField;

  DeleteIndexFieldResponse({
    @required this.indexField,
  });
  static DeleteIndexFieldResponse fromJson(Map<String, dynamic> json) =>
      DeleteIndexFieldResponse();
}

class DeleteSuggesterResponse {
  /// The status of the suggester being deleted.
  final SuggesterStatus suggester;

  DeleteSuggesterResponse({
    @required this.suggester,
  });
  static DeleteSuggesterResponse fromJson(Map<String, dynamic> json) =>
      DeleteSuggesterResponse();
}

class DescribeAnalysisSchemesResponse {
  /// The analysis scheme descriptions.
  final List<AnalysisSchemeStatus> analysisSchemes;

  DescribeAnalysisSchemesResponse({
    @required this.analysisSchemes,
  });
  static DescribeAnalysisSchemesResponse fromJson(Map<String, dynamic> json) =>
      DescribeAnalysisSchemesResponse();
}

class DescribeAvailabilityOptionsResponse {
  /// The availability options configured for the domain. Indicates whether
  /// Multi-AZ is enabled for the domain.
  final AvailabilityOptionsStatus availabilityOptions;

  DescribeAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  static DescribeAvailabilityOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAvailabilityOptionsResponse();
}

class DescribeDomainsResponse {
  final List<DomainStatus> domainStatusList;

  DescribeDomainsResponse({
    @required this.domainStatusList,
  });
  static DescribeDomainsResponse fromJson(Map<String, dynamic> json) =>
      DescribeDomainsResponse();
}

class DescribeExpressionsResponse {
  /// The expressions configured for the domain.
  final List<ExpressionStatus> expressions;

  DescribeExpressionsResponse({
    @required this.expressions,
  });
  static DescribeExpressionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeExpressionsResponse();
}

class DescribeIndexFieldsResponse {
  /// The index fields configured for the domain.
  final List<IndexFieldStatus> indexFields;

  DescribeIndexFieldsResponse({
    @required this.indexFields,
  });
  static DescribeIndexFieldsResponse fromJson(Map<String, dynamic> json) =>
      DescribeIndexFieldsResponse();
}

class DescribeScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  DescribeScalingParametersResponse({
    @required this.scalingParameters,
  });
  static DescribeScalingParametersResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeScalingParametersResponse();
}

class DescribeServiceAccessPoliciesResponse {
  /// The access rules configured for the domain specified in the request.
  final AccessPoliciesStatus accessPolicies;

  DescribeServiceAccessPoliciesResponse({
    @required this.accessPolicies,
  });
  static DescribeServiceAccessPoliciesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeServiceAccessPoliciesResponse();
}

class DescribeSuggestersResponse {
  /// The suggesters configured for the domain specified in the request.
  final List<SuggesterStatus> suggesters;

  DescribeSuggestersResponse({
    @required this.suggesters,
  });
  static DescribeSuggestersResponse fromJson(Map<String, dynamic> json) =>
      DescribeSuggestersResponse();
}

class DocumentSuggesterOptions {
  /// The name of the index field you want to use for suggestions.
  final String sourceField;

  /// The level of fuzziness allowed when suggesting matches for a string:
  /// `none`, `low`, or `high`. With none, the specified string is treated as an
  /// exact prefix. With low, suggestions must differ from the specified string
  /// by no more than one character. With high, suggestions can differ by up to
  /// two characters. The default is none.
  final String fuzzyMatching;

  /// An expression that computes a score for each suggestion to control how
  /// they are sorted. The scores are rounded to the nearest integer, with a
  /// floor of 0 and a ceiling of 2^31-1. A document's relevance score is not
  /// computed for suggestions, so sort expressions cannot reference the
  /// `_score` value. To sort suggestions using a numeric field or existing
  /// expression, simply specify the name of the field or expression. If no
  /// expression is configured for the suggester, the suggestions are sorted
  /// with the closest matches listed first.
  final String sortExpression;

  DocumentSuggesterOptions({
    @required this.sourceField,
    this.fuzzyMatching,
    this.sortExpression,
  });
  static DocumentSuggesterOptions fromJson(Map<String, dynamic> json) =>
      DocumentSuggesterOptions();
}

class DomainStatus {
  final String domainId;

  final String domainName;

  final String arn;

  /// True if the search domain is created. It can take several minutes to
  /// initialize a domain when CreateDomain is called. Newly created search
  /// domains are returned from DescribeDomains with a false value for Created
  /// until domain creation is complete.
  final bool created;

  /// True if the search domain has been deleted. The system must clean up
  /// resources dedicated to the search domain when DeleteDomain is called.
  /// Newly deleted search domains are returned from DescribeDomains with a true
  /// value for IsDeleted for several minutes until resource cleanup is
  /// complete.
  final bool deleted;

  /// The service endpoint for updating documents in a search domain.
  final ServiceEndpoint docService;

  /// The service endpoint for requesting search results from a search domain.
  final ServiceEndpoint searchService;

  /// True if IndexDocuments needs to be called to activate the current domain
  /// configuration.
  final bool requiresIndexDocuments;

  /// True if processing is being done to activate the current domain
  /// configuration.
  final bool processing;

  /// The instance type that is being used to process search requests.
  final String searchInstanceType;

  /// The number of partitions across which the search index is spread.
  final int searchPartitionCount;

  /// The number of search instances that are available to process search
  /// requests.
  final int searchInstanceCount;

  final Limits limits;

  DomainStatus({
    @required this.domainId,
    @required this.domainName,
    this.arn,
    this.created,
    this.deleted,
    this.docService,
    this.searchService,
    @required this.requiresIndexDocuments,
    this.processing,
    this.searchInstanceType,
    this.searchPartitionCount,
    this.searchInstanceCount,
    this.limits,
  });
  static DomainStatus fromJson(Map<String, dynamic> json) => DomainStatus();
}

class DoubleArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final double defaultValue;

  /// A list of source fields to map to the field.
  final String sourceFields;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  DoubleArrayOptions({
    this.defaultValue,
    this.sourceFields,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
  });
  static DoubleArrayOptions fromJson(Map<String, dynamic> json) =>
      DoubleArrayOptions();
}

class DoubleOptions {
  /// A value to use for the field if the field isn't specified for a document.
  /// This can be important if you are using the field in an expression and that
  /// field is not present in every document.
  final double defaultValue;

  /// The name of the source field to map to the field.
  final String sourceField;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  DoubleOptions({
    this.defaultValue,
    this.sourceField,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
    this.sortEnabled,
  });
  static DoubleOptions fromJson(Map<String, dynamic> json) => DoubleOptions();
}

class Expression {
  final String expressionName;

  final String expressionValue;

  Expression({
    @required this.expressionName,
    @required this.expressionValue,
  });
  static Expression fromJson(Map<String, dynamic> json) => Expression();
}

class ExpressionStatus {
  /// The expression that is evaluated for sorting while processing a search
  /// request.
  final Expression options;

  final OptionStatus status;

  ExpressionStatus({
    @required this.options,
    @required this.status,
  });
  static ExpressionStatus fromJson(Map<String, dynamic> json) =>
      ExpressionStatus();
}

class IndexDocumentsResponse {
  /// The names of the fields that are currently being indexed.
  final List<String> fieldNames;

  IndexDocumentsResponse({
    this.fieldNames,
  });
  static IndexDocumentsResponse fromJson(Map<String, dynamic> json) =>
      IndexDocumentsResponse();
}

class IndexField {
  /// A string that represents the name of an index field. CloudSearch supports
  /// regular index fields as well as dynamic fields. A dynamic field's name
  /// defines a pattern that begins or ends with a wildcard. Any document fields
  /// that don't map to a regular index field but do match a dynamic field's
  /// pattern are configured with the dynamic field's indexing options.
  ///
  /// Regular field names begin with a letter and can contain the following
  /// characters: a-z (lowercase), 0-9, and _ (underscore). Dynamic field names
  /// must begin or end with a wildcard (*). The wildcard can also be the only
  /// character in a dynamic field name. Multiple wildcards, and wildcards
  /// embedded within a string are not supported.
  ///
  /// The name `score` is reserved and cannot be used as a field name. To
  /// reference a document's ID, you can use the name `_id`.
  final String indexFieldName;

  final String indexFieldType;

  final IntOptions intOptions;

  final DoubleOptions doubleOptions;

  final LiteralOptions literalOptions;

  final TextOptions textOptions;

  final DateOptions dateOptions;

  final LatLonOptions latLonOptions;

  final IntArrayOptions intArrayOptions;

  final DoubleArrayOptions doubleArrayOptions;

  final LiteralArrayOptions literalArrayOptions;

  final TextArrayOptions textArrayOptions;

  final DateArrayOptions dateArrayOptions;

  IndexField({
    @required this.indexFieldName,
    @required this.indexFieldType,
    this.intOptions,
    this.doubleOptions,
    this.literalOptions,
    this.textOptions,
    this.dateOptions,
    this.latLonOptions,
    this.intArrayOptions,
    this.doubleArrayOptions,
    this.literalArrayOptions,
    this.textArrayOptions,
    this.dateArrayOptions,
  });
  static IndexField fromJson(Map<String, dynamic> json) => IndexField();
}

class IndexFieldStatus {
  final IndexField options;

  final OptionStatus status;

  IndexFieldStatus({
    @required this.options,
    @required this.status,
  });
  static IndexFieldStatus fromJson(Map<String, dynamic> json) =>
      IndexFieldStatus();
}

class IntArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final BigInt defaultValue;

  /// A list of source fields to map to the field.
  final String sourceFields;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  IntArrayOptions({
    this.defaultValue,
    this.sourceFields,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
  });
  static IntArrayOptions fromJson(Map<String, dynamic> json) =>
      IntArrayOptions();
}

class IntOptions {
  /// A value to use for the field if the field isn't specified for a document.
  /// This can be important if you are using the field in an expression and that
  /// field is not present in every document.
  final BigInt defaultValue;

  /// The name of the source field to map to the field.
  final String sourceField;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  IntOptions({
    this.defaultValue,
    this.sourceField,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
    this.sortEnabled,
  });
  static IntOptions fromJson(Map<String, dynamic> json) => IntOptions();
}

class LatLonOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  final String sourceField;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  LatLonOptions({
    this.defaultValue,
    this.sourceField,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
    this.sortEnabled,
  });
  static LatLonOptions fromJson(Map<String, dynamic> json) => LatLonOptions();
}

class Limits {
  final int maximumReplicationCount;

  final int maximumPartitionCount;

  Limits({
    @required this.maximumReplicationCount,
    @required this.maximumPartitionCount,
  });
  static Limits fromJson(Map<String, dynamic> json) => Limits();
}

class ListDomainNamesResponse {
  /// The names of the search domains owned by an account.
  final Map<String, String> domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });
  static ListDomainNamesResponse fromJson(Map<String, dynamic> json) =>
      ListDomainNamesResponse();
}

class LiteralArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  /// A list of source fields to map to the field.
  final String sourceFields;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  LiteralArrayOptions({
    this.defaultValue,
    this.sourceFields,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
  });
  static LiteralArrayOptions fromJson(Map<String, dynamic> json) =>
      LiteralArrayOptions();
}

class LiteralOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  final String sourceField;

  /// Whether facet information can be returned for the field.
  final bool facetEnabled;

  /// Whether the contents of the field are searchable.
  final bool searchEnabled;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  LiteralOptions({
    this.defaultValue,
    this.sourceField,
    this.facetEnabled,
    this.searchEnabled,
    this.returnEnabled,
    this.sortEnabled,
  });
  static LiteralOptions fromJson(Map<String, dynamic> json) => LiteralOptions();
}

class OptionStatus {
  /// A timestamp for when this option was created.
  final DateTime creationDate;

  /// A timestamp for when this option was last updated.
  final DateTime updateDate;

  /// A unique integer that indicates when this option was last updated.
  final int updateVersion;

  /// The state of processing a change to an option. Possible values:
  ///
  /// *    `RequiresIndexDocuments`: the option's latest value will not be
  /// deployed until IndexDocuments has been called and indexing is complete.
  /// *    `Processing`: the option's latest value is in the process of being
  /// activated.
  /// *    `Active`: the option's latest value is completely deployed.
  /// *    `FailedToValidate`: the option value is not compatible with the
  /// domain's data and cannot be used to index the data. You must either modify
  /// the option value or update or remove the incompatible documents.
  final String state;

  /// Indicates that the option will be deleted once processing is complete.
  final bool pendingDeletion;

  OptionStatus({
    @required this.creationDate,
    @required this.updateDate,
    this.updateVersion,
    @required this.state,
    this.pendingDeletion,
  });
  static OptionStatus fromJson(Map<String, dynamic> json) => OptionStatus();
}

class ScalingParameters {
  /// The instance type that you want to preconfigure for your domain. For
  /// example, `search.m1.small`.
  final String desiredInstanceType;

  /// The number of replicas you want to preconfigure for each index partition.
  final int desiredReplicationCount;

  /// The number of partitions you want to preconfigure for your domain. Only
  /// valid when you select `m2.2xlarge` as the desired instance type.
  final int desiredPartitionCount;

  ScalingParameters({
    this.desiredInstanceType,
    this.desiredReplicationCount,
    this.desiredPartitionCount,
  });
  static ScalingParameters fromJson(Map<String, dynamic> json) =>
      ScalingParameters();
}

class ScalingParametersStatus {
  final ScalingParameters options;

  final OptionStatus status;

  ScalingParametersStatus({
    @required this.options,
    @required this.status,
  });
  static ScalingParametersStatus fromJson(Map<String, dynamic> json) =>
      ScalingParametersStatus();
}

class ServiceEndpoint {
  final String endpoint;

  ServiceEndpoint({
    this.endpoint,
  });
  static ServiceEndpoint fromJson(Map<String, dynamic> json) =>
      ServiceEndpoint();
}

class Suggester {
  final String suggesterName;

  final DocumentSuggesterOptions documentSuggesterOptions;

  Suggester({
    @required this.suggesterName,
    @required this.documentSuggesterOptions,
  });
  static Suggester fromJson(Map<String, dynamic> json) => Suggester();
}

class SuggesterStatus {
  final Suggester options;

  final OptionStatus status;

  SuggesterStatus({
    @required this.options,
    @required this.status,
  });
  static SuggesterStatus fromJson(Map<String, dynamic> json) =>
      SuggesterStatus();
}

class TextArrayOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  /// A list of source fields to map to the field.
  final String sourceFields;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether highlights can be returned for the field.
  final bool highlightEnabled;

  /// The name of an analysis scheme for a `text-array` field.
  final String analysisScheme;

  TextArrayOptions({
    this.defaultValue,
    this.sourceFields,
    this.returnEnabled,
    this.highlightEnabled,
    this.analysisScheme,
  });
  static TextArrayOptions fromJson(Map<String, dynamic> json) =>
      TextArrayOptions();
}

class TextOptions {
  /// A value to use for the field if the field isn't specified for a document.
  final String defaultValue;

  final String sourceField;

  /// Whether the contents of the field can be returned in the search results.
  final bool returnEnabled;

  /// Whether the field can be used to sort the search results.
  final bool sortEnabled;

  /// Whether highlights can be returned for the field.
  final bool highlightEnabled;

  /// The name of an analysis scheme for a `text` field.
  final String analysisScheme;

  TextOptions({
    this.defaultValue,
    this.sourceField,
    this.returnEnabled,
    this.sortEnabled,
    this.highlightEnabled,
    this.analysisScheme,
  });
  static TextOptions fromJson(Map<String, dynamic> json) => TextOptions();
}

class UpdateAvailabilityOptionsResponse {
  /// The newly-configured availability options. Indicates whether Multi-AZ is
  /// enabled for the domain.
  final AvailabilityOptionsStatus availabilityOptions;

  UpdateAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  static UpdateAvailabilityOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateAvailabilityOptionsResponse();
}

class UpdateScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  UpdateScalingParametersResponse({
    @required this.scalingParameters,
  });
  static UpdateScalingParametersResponse fromJson(Map<String, dynamic> json) =>
      UpdateScalingParametersResponse();
}

class UpdateServiceAccessPoliciesResponse {
  /// The access rules configured for the domain.
  final AccessPoliciesStatus accessPolicies;

  UpdateServiceAccessPoliciesResponse({
    @required this.accessPolicies,
  });
  static UpdateServiceAccessPoliciesResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateServiceAccessPoliciesResponse();
}
