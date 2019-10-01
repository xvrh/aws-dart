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
/// and endpoints, see
/// [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cloudsearch_region).
class CloudSearchApi {
  final _client;
  CloudSearchApi(client)
      : _client = client.configured('CloudSearch', serializer: 'query');

  /// Indexes the search suggestions. For more information, see
  /// [Configuring Suggesters](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html#configuring-suggesters)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<BuildSuggestersResponse> buildSuggesters(String domainName) async {
    var response_ = await _client.send('BuildSuggesters', {
      'DomainName': domainName,
    });
    return BuildSuggestersResponse.fromJson(response_);
  }

  /// Creates a new search domain. For more information, see
  /// [Creating a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: A name for the domain you are creating. Allowed characters
  /// are a-z (lower-case letters), 0-9, and hyphen (-). Domain names must start
  /// with a letter or number and be at least 3 and no more than 28 characters
  /// long.
  Future<CreateDomainResponse> createDomain(String domainName) async {
    var response_ = await _client.send('CreateDomain', {
      'DomainName': domainName,
    });
    return CreateDomainResponse.fromJson(response_);
  }

  /// Configures an analysis scheme that can be applied to a `text` or
  /// `text-array` field to define language-specific text processing options.
  /// For more information, see
  /// [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineAnalysisSchemeResponse> defineAnalysisScheme(
      {@required String domainName,
      @required AnalysisScheme analysisScheme}) async {
    var response_ = await _client.send('DefineAnalysisScheme', {
      'DomainName': domainName,
      'AnalysisScheme': analysisScheme,
    });
    return DefineAnalysisSchemeResponse.fromJson(response_);
  }

  /// Configures an `Expression` for the search domain. Used to create new
  /// expressions and modify existing ones. If the expression exists, the new
  /// configuration replaces the old one. For more information, see
  /// [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineExpressionResponse> defineExpression(
      {@required String domainName, @required Expression expression}) async {
    var response_ = await _client.send('DefineExpression', {
      'DomainName': domainName,
      'Expression': expression,
    });
    return DefineExpressionResponse.fromJson(response_);
  }

  /// Configures an `IndexField` for the search domain. Used to create new
  /// fields and modify existing ones. You must specify the name of the domain
  /// you are configuring and an index field configuration. The index field
  /// configuration specifies a unique name, the index field type, and the
  /// options you want to configure for the field. The options you can specify
  /// depend on the `IndexFieldType`. If the field exists, the new configuration
  /// replaces the old one. For more information, see
  /// [Configuring Index Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [indexField]: The index field and field options you want to configure.
  Future<DefineIndexFieldResponse> defineIndexField(
      {@required String domainName, @required IndexField indexField}) async {
    var response_ = await _client.send('DefineIndexField', {
      'DomainName': domainName,
      'IndexField': indexField,
    });
    return DefineIndexFieldResponse.fromJson(response_);
  }

  /// Configures a suggester for a domain. A suggester enables you to display
  /// possible matches before users finish typing their queries. When you
  /// configure a suggester, you must specify the name of the text field you
  /// want to search for possible matches and a unique name for the suggester.
  /// For more information, see
  /// [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DefineSuggesterResponse> defineSuggester(
      {@required String domainName, @required Suggester suggester}) async {
    var response_ = await _client.send('DefineSuggester', {
      'DomainName': domainName,
      'Suggester': suggester,
    });
    return DefineSuggesterResponse.fromJson(response_);
  }

  /// Deletes an analysis scheme. For more information, see
  /// [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [analysisSchemeName]: The name of the analysis scheme you want to delete.
  Future<DeleteAnalysisSchemeResponse> deleteAnalysisScheme(
      {@required String domainName,
      @required String analysisSchemeName}) async {
    var response_ = await _client.send('DeleteAnalysisScheme', {
      'DomainName': domainName,
      'AnalysisSchemeName': analysisSchemeName,
    });
    return DeleteAnalysisSchemeResponse.fromJson(response_);
  }

  /// Permanently deletes a search domain and all of its data. Once a domain has
  /// been deleted, it cannot be recovered. For more information, see
  /// [Deleting a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to permanently delete.
  Future<DeleteDomainResponse> deleteDomain(String domainName) async {
    var response_ = await _client.send('DeleteDomain', {
      'DomainName': domainName,
    });
    return DeleteDomainResponse.fromJson(response_);
  }

  /// Removes an `Expression` from the search domain. For more information, see
  /// [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [expressionName]: The name of the `Expression` to delete.
  Future<DeleteExpressionResponse> deleteExpression(
      {@required String domainName, @required String expressionName}) async {
    var response_ = await _client.send('DeleteExpression', {
      'DomainName': domainName,
      'ExpressionName': expressionName,
    });
    return DeleteExpressionResponse.fromJson(response_);
  }

  /// Removes an `IndexField` from the search domain. For more information, see
  /// [Configuring Index Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [indexFieldName]: The name of the index field your want to remove from the
  /// domain's indexing options.
  Future<DeleteIndexFieldResponse> deleteIndexField(
      {@required String domainName, @required String indexFieldName}) async {
    var response_ = await _client.send('DeleteIndexField', {
      'DomainName': domainName,
      'IndexFieldName': indexFieldName,
    });
    return DeleteIndexFieldResponse.fromJson(response_);
  }

  /// Deletes a suggester. For more information, see
  /// [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [suggesterName]: Specifies the name of the suggester you want to delete.
  Future<DeleteSuggesterResponse> deleteSuggester(
      {@required String domainName, @required String suggesterName}) async {
    var response_ = await _client.send('DeleteSuggester', {
      'DomainName': domainName,
      'SuggesterName': suggesterName,
    });
    return DeleteSuggesterResponse.fromJson(response_);
  }

  /// Gets the analysis schemes configured for a domain. An analysis scheme
  /// defines language-specific text processing options for a `text` field. Can
  /// be limited to specific analysis schemes by name. By default, shows all
  /// analysis schemes and includes any pending changes to the configuration.
  /// Set the `Deployed` option to `true` to show the active configuration and
  /// exclude pending changes. For more information, see
  /// [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html)
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
    var response_ = await _client.send('DescribeAnalysisSchemes', {
      'DomainName': domainName,
      if (analysisSchemeNames != null)
        'AnalysisSchemeNames': analysisSchemeNames,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeAnalysisSchemesResponse.fromJson(response_);
  }

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see
  /// [Configuring Availability Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions(
      String domainName,
      {bool deployed}) async {
    var response_ = await _client.send('DescribeAvailabilityOptions', {
      'DomainName': domainName,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeAvailabilityOptionsResponse.fromJson(response_);
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default. To get the
  /// number of searchable documents in a domain, use the console or submit a
  /// `matchall` request to your domain's search endpoint:
  /// `q=matchall&amp;q.parser=structured&amp;size=0`. For more information, see
  /// [Getting Information about a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainNames]: The names of the domains you want to include in the
  /// response.
  Future<DescribeDomainsResponse> describeDomains(
      {List<String> domainNames}) async {
    var response_ = await _client.send('DescribeDomains', {
      if (domainNames != null) 'DomainNames': domainNames,
    });
    return DescribeDomainsResponse.fromJson(response_);
  }

  /// Gets the expressions configured for the search domain. Can be limited to
  /// specific expressions by name. By default, shows all expressions and
  /// includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see
  /// [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html)
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
    var response_ = await _client.send('DescribeExpressions', {
      'DomainName': domainName,
      if (expressionNames != null) 'ExpressionNames': expressionNames,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeExpressionsResponse.fromJson(response_);
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. By default, shows all fields
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see
  /// [Getting Domain Information](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html)
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
    var response_ = await _client.send('DescribeIndexFields', {
      'DomainName': domainName,
      if (fieldNames != null) 'FieldNames': fieldNames,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeIndexFieldsResponse.fromJson(response_);
  }

  /// Gets the scaling parameters configured for a domain. A domain's scaling
  /// parameters specify the desired search instance type and replication count.
  /// For more information, see
  /// [Configuring Scaling Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<DescribeScalingParametersResponse> describeScalingParameters(
      String domainName) async {
    var response_ = await _client.send('DescribeScalingParameters', {
      'DomainName': domainName,
    });
    return DescribeScalingParametersResponse.fromJson(response_);
  }

  /// Gets information about the access policies that control access to the
  /// domain's document and search endpoints. By default, shows the
  /// configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see
  /// [Configuring Access for a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  ///
  /// [deployed]: Whether to display the deployed configuration (`true`) or
  /// include any pending changes (`false`). Defaults to `false`.
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies(
      String domainName,
      {bool deployed}) async {
    var response_ = await _client.send('DescribeServiceAccessPolicies', {
      'DomainName': domainName,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeServiceAccessPoliciesResponse.fromJson(response_);
  }

  /// Gets the suggesters configured for a domain. A suggester enables you to
  /// display possible matches before users finish typing their queries. Can be
  /// limited to specific suggesters by name. By default, shows all suggesters
  /// and includes any pending changes to the configuration. Set the `Deployed`
  /// option to `true` to show the active configuration and exclude pending
  /// changes. For more information, see
  /// [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
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
    var response_ = await _client.send('DescribeSuggesters', {
      'DomainName': domainName,
      if (suggesterNames != null) 'SuggesterNames': suggesterNames,
      if (deployed != null) 'Deployed': deployed,
    });
    return DescribeSuggestersResponse.fromJson(response_);
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// indexing options. This operation must be invoked to activate options whose
  /// OptionStatus is `RequiresIndexDocuments`.
  Future<IndexDocumentsResponse> indexDocuments(String domainName) async {
    var response_ = await _client.send('IndexDocuments', {
      'DomainName': domainName,
    });
    return IndexDocumentsResponse.fromJson(response_);
  }

  /// Lists all search domains owned by an account.
  Future<ListDomainNamesResponse> listDomainNames() async {
    var response_ = await _client.send('ListDomainNames', {});
    return ListDomainNamesResponse.fromJson(response_);
  }

  /// Configures the availability options for a domain. Enabling the Multi-AZ
  /// option expands an Amazon CloudSearch domain to an additional Availability
  /// Zone in the same Region to increase fault tolerance in the event of a
  /// service disruption. Changes to the Multi-AZ option can take about half an
  /// hour to become active. For more information, see
  /// [Configuring Availability Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [multiAZ]: You expand an existing search domain to a second Availability
  /// Zone by setting the Multi-AZ option to true. Similarly, you can turn off
  /// the Multi-AZ option to downgrade the domain to a single Availability Zone
  /// by setting the Multi-AZ option to `false`.
  Future<UpdateAvailabilityOptionsResponse> updateAvailabilityOptions(
      {@required String domainName, @required bool multiAZ}) async {
    var response_ = await _client.send('UpdateAvailabilityOptions', {
      'DomainName': domainName,
      'MultiAZ': multiAZ,
    });
    return UpdateAvailabilityOptionsResponse.fromJson(response_);
  }

  /// Configures scaling parameters for a domain. A domain's scaling parameters
  /// specify the desired search instance type and replication count. Amazon
  /// CloudSearch will still automatically scale your domain based on the volume
  /// of data and traffic, but not below the desired instance type and
  /// replication count. If the Multi-AZ option is enabled, these values control
  /// the resources used per Availability Zone. For more information, see
  /// [Configuring Scaling Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  Future<UpdateScalingParametersResponse> updateScalingParameters(
      {@required String domainName,
      @required ScalingParameters scalingParameters}) async {
    var response_ = await _client.send('UpdateScalingParameters', {
      'DomainName': domainName,
      'ScalingParameters': scalingParameters,
    });
    return UpdateScalingParametersResponse.fromJson(response_);
  }

  /// Configures the access rules that control access to the domain's document
  /// and search endpoints. For more information, see
  /// [Configuring Access for an Amazon CloudSearch Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html).
  ///
  /// [accessPolicies]: The access rules you want to configure. These rules
  /// replace any existing rules.
  Future<UpdateServiceAccessPoliciesResponse> updateServiceAccessPolicies(
      {@required String domainName, @required String accessPolicies}) async {
    var response_ = await _client.send('UpdateServiceAccessPolicies', {
      'DomainName': domainName,
      'AccessPolicies': accessPolicies,
    });
    return UpdateServiceAccessPoliciesResponse.fromJson(response_);
  }
}

/// The configured access rules for the domain's document and search endpoints,
/// and the current status of those rules.
class AccessPoliciesStatus {
  final String options;

  final OptionStatus status;

  AccessPoliciesStatus({
    @required this.options,
    @required this.status,
  });
  static AccessPoliciesStatus fromJson(Map<String, dynamic> json) =>
      AccessPoliciesStatus(
        options: json['Options'] as String,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// Synonyms, stopwords, and stemming options for an analysis scheme. Includes
/// tokenization dictionary for Japanese.
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
  /// example, `["a", "an", "the", "of"]`. The stopwords dictionary must
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
  /// information, see
  /// [Language Specific Text Processing Settings](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/text-processing.html#text-processing-settings)
  /// in the _Amazon CloudSearch Developer Guide_
  final String algorithmicStemming;

  AnalysisOptions({
    this.synonyms,
    this.stopwords,
    this.stemmingDictionary,
    this.japaneseTokenizationDictionary,
    this.algorithmicStemming,
  });
  static AnalysisOptions fromJson(Map<String, dynamic> json) => AnalysisOptions(
        synonyms:
            json.containsKey('Synonyms') ? json['Synonyms'] as String : null,
        stopwords:
            json.containsKey('Stopwords') ? json['Stopwords'] as String : null,
        stemmingDictionary: json.containsKey('StemmingDictionary')
            ? json['StemmingDictionary'] as String
            : null,
        japaneseTokenizationDictionary:
            json.containsKey('JapaneseTokenizationDictionary')
                ? json['JapaneseTokenizationDictionary'] as String
                : null,
        algorithmicStemming: json.containsKey('AlgorithmicStemming')
            ? json['AlgorithmicStemming'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Configuration information for an analysis scheme. Each analysis scheme has a
/// unique name and specifies the language of the text to be processed. The
/// following options can be configured for an analysis scheme: `Synonyms`,
/// `Stopwords`, `StemmingDictionary`, `JapaneseTokenizationDictionary` and
/// `AlgorithmicStemming`.
class AnalysisScheme {
  final String analysisSchemeName;

  final String analysisSchemeLanguage;

  final AnalysisOptions analysisOptions;

  AnalysisScheme({
    @required this.analysisSchemeName,
    @required this.analysisSchemeLanguage,
    this.analysisOptions,
  });
  static AnalysisScheme fromJson(Map<String, dynamic> json) => AnalysisScheme(
        analysisSchemeName: json['AnalysisSchemeName'] as String,
        analysisSchemeLanguage: json['AnalysisSchemeLanguage'] as String,
        analysisOptions: json.containsKey('AnalysisOptions')
            ? AnalysisOptions.fromJson(json['AnalysisOptions'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The status and configuration of an `AnalysisScheme`.
class AnalysisSchemeStatus {
  final AnalysisScheme options;

  final OptionStatus status;

  AnalysisSchemeStatus({
    @required this.options,
    @required this.status,
  });
  static AnalysisSchemeStatus fromJson(Map<String, dynamic> json) =>
      AnalysisSchemeStatus(
        options: AnalysisScheme.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The status and configuration of the domain's availability options.
class AvailabilityOptionsStatus {
  /// The availability options configured for the domain.
  final bool options;

  final OptionStatus status;

  AvailabilityOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static AvailabilityOptionsStatus fromJson(Map<String, dynamic> json) =>
      AvailabilityOptionsStatus(
        options: json['Options'] as bool,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The result of a `BuildSuggester` request. Contains a list of the fields used
/// for suggestions.
class BuildSuggestersResponse {
  final List<String> fieldNames;

  BuildSuggestersResponse({
    this.fieldNames,
  });
  static BuildSuggestersResponse fromJson(Map<String, dynamic> json) =>
      BuildSuggestersResponse(
        fieldNames: json.containsKey('FieldNames')
            ? (json['FieldNames'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// The result of a `CreateDomainRequest`. Contains the status of a newly
/// created domain.
class CreateDomainResponse {
  final DomainStatus domainStatus;

  CreateDomainResponse({
    this.domainStatus,
  });
  static CreateDomainResponse fromJson(Map<String, dynamic> json) =>
      CreateDomainResponse(
        domainStatus: json.containsKey('DomainStatus')
            ? DomainStatus.fromJson(json['DomainStatus'])
            : null,
      );
}

/// Options for a field that contains an array of dates. Present if
/// `IndexFieldType` specifies the field is of type `date-array`. All options
/// are enabled by default.
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
      DateArrayOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceFields: json.containsKey('SourceFields')
            ? json['SourceFields'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for a date field. Dates and times are specified in UTC (Coordinated
/// Universal Time) according to IETF RFC3339: yyyy-mm-ddT00:00:00Z. Present if
/// `IndexFieldType` specifies the field is of type `date`. All options are
/// enabled by default.
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
  static DateOptions fromJson(Map<String, dynamic> json) => DateOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The result of a `DefineAnalysisScheme` request. Contains the status of the
/// newly-configured analysis scheme.
class DefineAnalysisSchemeResponse {
  final AnalysisSchemeStatus analysisScheme;

  DefineAnalysisSchemeResponse({
    @required this.analysisScheme,
  });
  static DefineAnalysisSchemeResponse fromJson(Map<String, dynamic> json) =>
      DefineAnalysisSchemeResponse(
        analysisScheme: AnalysisSchemeStatus.fromJson(json['AnalysisScheme']),
      );
}

/// The result of a `DefineExpression` request. Contains the status of the
/// newly-configured expression.
class DefineExpressionResponse {
  final ExpressionStatus expression;

  DefineExpressionResponse({
    @required this.expression,
  });
  static DefineExpressionResponse fromJson(Map<String, dynamic> json) =>
      DefineExpressionResponse(
        expression: ExpressionStatus.fromJson(json['Expression']),
      );
}

/// The result of a `DefineIndexField` request. Contains the status of the
/// newly-configured index field.
class DefineIndexFieldResponse {
  final IndexFieldStatus indexField;

  DefineIndexFieldResponse({
    @required this.indexField,
  });
  static DefineIndexFieldResponse fromJson(Map<String, dynamic> json) =>
      DefineIndexFieldResponse(
        indexField: IndexFieldStatus.fromJson(json['IndexField']),
      );
}

/// The result of a `DefineSuggester` request. Contains the status of the
/// newly-configured suggester.
class DefineSuggesterResponse {
  final SuggesterStatus suggester;

  DefineSuggesterResponse({
    @required this.suggester,
  });
  static DefineSuggesterResponse fromJson(Map<String, dynamic> json) =>
      DefineSuggesterResponse(
        suggester: SuggesterStatus.fromJson(json['Suggester']),
      );
}

/// The result of a `DeleteAnalysisScheme` request. Contains the status of the
/// deleted analysis scheme.
class DeleteAnalysisSchemeResponse {
  /// The status of the analysis scheme being deleted.
  final AnalysisSchemeStatus analysisScheme;

  DeleteAnalysisSchemeResponse({
    @required this.analysisScheme,
  });
  static DeleteAnalysisSchemeResponse fromJson(Map<String, dynamic> json) =>
      DeleteAnalysisSchemeResponse(
        analysisScheme: AnalysisSchemeStatus.fromJson(json['AnalysisScheme']),
      );
}

/// The result of a `DeleteDomain` request. Contains the status of a newly
/// deleted domain, or no status if the domain has already been completely
/// deleted.
class DeleteDomainResponse {
  final DomainStatus domainStatus;

  DeleteDomainResponse({
    this.domainStatus,
  });
  static DeleteDomainResponse fromJson(Map<String, dynamic> json) =>
      DeleteDomainResponse(
        domainStatus: json.containsKey('DomainStatus')
            ? DomainStatus.fromJson(json['DomainStatus'])
            : null,
      );
}

/// The result of a `DeleteExpression` request. Specifies the expression being
/// deleted.
class DeleteExpressionResponse {
  /// The status of the expression being deleted.
  final ExpressionStatus expression;

  DeleteExpressionResponse({
    @required this.expression,
  });
  static DeleteExpressionResponse fromJson(Map<String, dynamic> json) =>
      DeleteExpressionResponse(
        expression: ExpressionStatus.fromJson(json['Expression']),
      );
}

/// The result of a `DeleteIndexField` request.
class DeleteIndexFieldResponse {
  /// The status of the index field being deleted.
  final IndexFieldStatus indexField;

  DeleteIndexFieldResponse({
    @required this.indexField,
  });
  static DeleteIndexFieldResponse fromJson(Map<String, dynamic> json) =>
      DeleteIndexFieldResponse(
        indexField: IndexFieldStatus.fromJson(json['IndexField']),
      );
}

/// The result of a `DeleteSuggester` request. Contains the status of the
/// deleted suggester.
class DeleteSuggesterResponse {
  /// The status of the suggester being deleted.
  final SuggesterStatus suggester;

  DeleteSuggesterResponse({
    @required this.suggester,
  });
  static DeleteSuggesterResponse fromJson(Map<String, dynamic> json) =>
      DeleteSuggesterResponse(
        suggester: SuggesterStatus.fromJson(json['Suggester']),
      );
}

/// The result of a `DescribeAnalysisSchemes` request. Contains the analysis
/// schemes configured for the domain specified in the request.
class DescribeAnalysisSchemesResponse {
  /// The analysis scheme descriptions.
  final List<AnalysisSchemeStatus> analysisSchemes;

  DescribeAnalysisSchemesResponse({
    @required this.analysisSchemes,
  });
  static DescribeAnalysisSchemesResponse fromJson(Map<String, dynamic> json) =>
      DescribeAnalysisSchemesResponse(
        analysisSchemes: (json['AnalysisSchemes'] as List)
            .map((e) => AnalysisSchemeStatus.fromJson(e))
            .toList(),
      );
}

/// The result of a `DescribeAvailabilityOptions` request. Indicates whether or
/// not the Multi-AZ option is enabled for the domain specified in the request.
class DescribeAvailabilityOptionsResponse {
  /// The availability options configured for the domain. Indicates whether
  /// Multi-AZ is enabled for the domain.
  final AvailabilityOptionsStatus availabilityOptions;

  DescribeAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  static DescribeAvailabilityOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeAvailabilityOptionsResponse(
        availabilityOptions: json.containsKey('AvailabilityOptions')
            ? AvailabilityOptionsStatus.fromJson(json['AvailabilityOptions'])
            : null,
      );
}

/// The result of a `DescribeDomains` request. Contains the status of the
/// domains specified in the request or all domains owned by the account.
class DescribeDomainsResponse {
  final List<DomainStatus> domainStatusList;

  DescribeDomainsResponse({
    @required this.domainStatusList,
  });
  static DescribeDomainsResponse fromJson(Map<String, dynamic> json) =>
      DescribeDomainsResponse(
        domainStatusList: (json['DomainStatusList'] as List)
            .map((e) => DomainStatus.fromJson(e))
            .toList(),
      );
}

/// The result of a `DescribeExpressions` request. Contains the expressions
/// configured for the domain specified in the request.
class DescribeExpressionsResponse {
  /// The expressions configured for the domain.
  final List<ExpressionStatus> expressions;

  DescribeExpressionsResponse({
    @required this.expressions,
  });
  static DescribeExpressionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeExpressionsResponse(
        expressions: (json['Expressions'] as List)
            .map((e) => ExpressionStatus.fromJson(e))
            .toList(),
      );
}

/// The result of a `DescribeIndexFields` request. Contains the index fields
/// configured for the domain specified in the request.
class DescribeIndexFieldsResponse {
  /// The index fields configured for the domain.
  final List<IndexFieldStatus> indexFields;

  DescribeIndexFieldsResponse({
    @required this.indexFields,
  });
  static DescribeIndexFieldsResponse fromJson(Map<String, dynamic> json) =>
      DescribeIndexFieldsResponse(
        indexFields: (json['IndexFields'] as List)
            .map((e) => IndexFieldStatus.fromJson(e))
            .toList(),
      );
}

/// The result of a `DescribeScalingParameters` request. Contains the scaling
/// parameters configured for the domain specified in the request.
class DescribeScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  DescribeScalingParametersResponse({
    @required this.scalingParameters,
  });
  static DescribeScalingParametersResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeScalingParametersResponse(
        scalingParameters:
            ScalingParametersStatus.fromJson(json['ScalingParameters']),
      );
}

/// The result of a `DescribeServiceAccessPolicies` request.
class DescribeServiceAccessPoliciesResponse {
  /// The access rules configured for the domain specified in the request.
  final AccessPoliciesStatus accessPolicies;

  DescribeServiceAccessPoliciesResponse({
    @required this.accessPolicies,
  });
  static DescribeServiceAccessPoliciesResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeServiceAccessPoliciesResponse(
        accessPolicies: AccessPoliciesStatus.fromJson(json['AccessPolicies']),
      );
}

/// The result of a `DescribeSuggesters` request.
class DescribeSuggestersResponse {
  /// The suggesters configured for the domain specified in the request.
  final List<SuggesterStatus> suggesters;

  DescribeSuggestersResponse({
    @required this.suggesters,
  });
  static DescribeSuggestersResponse fromJson(Map<String, dynamic> json) =>
      DescribeSuggestersResponse(
        suggesters: (json['Suggesters'] as List)
            .map((e) => SuggesterStatus.fromJson(e))
            .toList(),
      );
}

/// Options for a search suggester.
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
      DocumentSuggesterOptions(
        sourceField: json['SourceField'] as String,
        fuzzyMatching: json.containsKey('FuzzyMatching')
            ? json['FuzzyMatching'] as String
            : null,
        sortExpression: json.containsKey('SortExpression')
            ? json['SortExpression'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The current status of the search domain.
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
  static DomainStatus fromJson(Map<String, dynamic> json) => DomainStatus(
        domainId: json['DomainId'] as String,
        domainName: json['DomainName'] as String,
        arn: json.containsKey('ARN') ? json['ARN'] as String : null,
        created: json.containsKey('Created') ? json['Created'] as bool : null,
        deleted: json.containsKey('Deleted') ? json['Deleted'] as bool : null,
        docService: json.containsKey('DocService')
            ? ServiceEndpoint.fromJson(json['DocService'])
            : null,
        searchService: json.containsKey('SearchService')
            ? ServiceEndpoint.fromJson(json['SearchService'])
            : null,
        requiresIndexDocuments: json['RequiresIndexDocuments'] as bool,
        processing:
            json.containsKey('Processing') ? json['Processing'] as bool : null,
        searchInstanceType: json.containsKey('SearchInstanceType')
            ? json['SearchInstanceType'] as String
            : null,
        searchPartitionCount: json.containsKey('SearchPartitionCount')
            ? json['SearchPartitionCount'] as int
            : null,
        searchInstanceCount: json.containsKey('SearchInstanceCount')
            ? json['SearchInstanceCount'] as int
            : null,
        limits:
            json.containsKey('Limits') ? Limits.fromJson(json['Limits']) : null,
      );
}

/// Options for a field that contains an array of double-precision 64-bit
/// floating point values. Present if `IndexFieldType` specifies the field is of
/// type `double-array`. All options are enabled by default.
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
      DoubleArrayOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as double
            : null,
        sourceFields: json.containsKey('SourceFields')
            ? json['SourceFields'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for a double-precision 64-bit floating point field. Present if
/// `IndexFieldType` specifies the field is of type `double`. All options are
/// enabled by default.
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
  static DoubleOptions fromJson(Map<String, dynamic> json) => DoubleOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as double
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A named expression that can be evaluated at search time. Can be used to sort
/// the search results, define other expressions, or return computed information
/// in the search results.
class Expression {
  final String expressionName;

  final String expressionValue;

  Expression({
    @required this.expressionName,
    @required this.expressionValue,
  });
  static Expression fromJson(Map<String, dynamic> json) => Expression(
        expressionName: json['ExpressionName'] as String,
        expressionValue: json['ExpressionValue'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The value of an `Expression` and its current status.
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
      ExpressionStatus(
        options: Expression.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The result of an `IndexDocuments` request. Contains the status of the
/// indexing operation, including the fields being indexed.
class IndexDocumentsResponse {
  /// The names of the fields that are currently being indexed.
  final List<String> fieldNames;

  IndexDocumentsResponse({
    this.fieldNames,
  });
  static IndexDocumentsResponse fromJson(Map<String, dynamic> json) =>
      IndexDocumentsResponse(
        fieldNames: json.containsKey('FieldNames')
            ? (json['FieldNames'] as List).map((e) => e as String).toList()
            : null,
      );
}

/// Configuration information for a field in the index, including its name,
/// type, and options. The supported options depend on the `IndexFieldType`.
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
  static IndexField fromJson(Map<String, dynamic> json) => IndexField(
        indexFieldName: json['IndexFieldName'] as String,
        indexFieldType: json['IndexFieldType'] as String,
        intOptions: json.containsKey('IntOptions')
            ? IntOptions.fromJson(json['IntOptions'])
            : null,
        doubleOptions: json.containsKey('DoubleOptions')
            ? DoubleOptions.fromJson(json['DoubleOptions'])
            : null,
        literalOptions: json.containsKey('LiteralOptions')
            ? LiteralOptions.fromJson(json['LiteralOptions'])
            : null,
        textOptions: json.containsKey('TextOptions')
            ? TextOptions.fromJson(json['TextOptions'])
            : null,
        dateOptions: json.containsKey('DateOptions')
            ? DateOptions.fromJson(json['DateOptions'])
            : null,
        latLonOptions: json.containsKey('LatLonOptions')
            ? LatLonOptions.fromJson(json['LatLonOptions'])
            : null,
        intArrayOptions: json.containsKey('IntArrayOptions')
            ? IntArrayOptions.fromJson(json['IntArrayOptions'])
            : null,
        doubleArrayOptions: json.containsKey('DoubleArrayOptions')
            ? DoubleArrayOptions.fromJson(json['DoubleArrayOptions'])
            : null,
        literalArrayOptions: json.containsKey('LiteralArrayOptions')
            ? LiteralArrayOptions.fromJson(json['LiteralArrayOptions'])
            : null,
        textArrayOptions: json.containsKey('TextArrayOptions')
            ? TextArrayOptions.fromJson(json['TextArrayOptions'])
            : null,
        dateArrayOptions: json.containsKey('DateArrayOptions')
            ? DateArrayOptions.fromJson(json['DateArrayOptions'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The value of an `IndexField` and its current status.
class IndexFieldStatus {
  final IndexField options;

  final OptionStatus status;

  IndexFieldStatus({
    @required this.options,
    @required this.status,
  });
  static IndexFieldStatus fromJson(Map<String, dynamic> json) =>
      IndexFieldStatus(
        options: IndexField.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// Options for a field that contains an array of 64-bit signed integers.
/// Present if `IndexFieldType` specifies the field is of type `int-array`. All
/// options are enabled by default.
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
  static IntArrayOptions fromJson(Map<String, dynamic> json) => IntArrayOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? BigInt.from(json['DefaultValue'])
            : null,
        sourceFields: json.containsKey('SourceFields')
            ? json['SourceFields'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for a 64-bit signed integer field. Present if `IndexFieldType`
/// specifies the field is of type `int`. All options are enabled by default.
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
  static IntOptions fromJson(Map<String, dynamic> json) => IntOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? BigInt.from(json['DefaultValue'])
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for a latlon field. A latlon field contains a location stored as a
/// latitude and longitude value pair. Present if `IndexFieldType` specifies the
/// field is of type `latlon`. All options are enabled by default.
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
  static LatLonOptions fromJson(Map<String, dynamic> json) => LatLonOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class Limits {
  final int maximumReplicationCount;

  final int maximumPartitionCount;

  Limits({
    @required this.maximumReplicationCount,
    @required this.maximumPartitionCount,
  });
  static Limits fromJson(Map<String, dynamic> json) => Limits(
        maximumReplicationCount: json['MaximumReplicationCount'] as int,
        maximumPartitionCount: json['MaximumPartitionCount'] as int,
      );
}

/// The result of a `ListDomainNames` request. Contains a list of the domains
/// owned by an account.
class ListDomainNamesResponse {
  /// The names of the search domains owned by an account.
  final Map<String, String> domainNames;

  ListDomainNamesResponse({
    this.domainNames,
  });
  static ListDomainNamesResponse fromJson(Map<String, dynamic> json) =>
      ListDomainNamesResponse(
        domainNames: json.containsKey('DomainNames')
            ? (json['DomainNames'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// Options for a field that contains an array of literal strings. Present if
/// `IndexFieldType` specifies the field is of type `literal-array`. All options
/// are enabled by default.
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
      LiteralArrayOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceFields: json.containsKey('SourceFields')
            ? json['SourceFields'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for literal field. Present if `IndexFieldType` specifies the field
/// is of type `literal`. All options are enabled by default.
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
  static LiteralOptions fromJson(Map<String, dynamic> json) => LiteralOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The status of domain configuration option.
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
  static OptionStatus fromJson(Map<String, dynamic> json) => OptionStatus(
        creationDate: DateTime.parse(json['CreationDate']),
        updateDate: DateTime.parse(json['UpdateDate']),
        updateVersion: json.containsKey('UpdateVersion')
            ? json['UpdateVersion'] as int
            : null,
        state: json['State'] as String,
        pendingDeletion: json.containsKey('PendingDeletion')
            ? json['PendingDeletion'] as bool
            : null,
      );
}

/// The desired instance type and desired number of replicas of each index
/// partition.
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
      ScalingParameters(
        desiredInstanceType: json.containsKey('DesiredInstanceType')
            ? json['DesiredInstanceType'] as String
            : null,
        desiredReplicationCount: json.containsKey('DesiredReplicationCount')
            ? json['DesiredReplicationCount'] as int
            : null,
        desiredPartitionCount: json.containsKey('DesiredPartitionCount')
            ? json['DesiredPartitionCount'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The status and configuration of a search domain's scaling parameters.
class ScalingParametersStatus {
  final ScalingParameters options;

  final OptionStatus status;

  ScalingParametersStatus({
    @required this.options,
    @required this.status,
  });
  static ScalingParametersStatus fromJson(Map<String, dynamic> json) =>
      ScalingParametersStatus(
        options: ScalingParameters.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The endpoint to which service requests can be submitted.
class ServiceEndpoint {
  final String endpoint;

  ServiceEndpoint({
    this.endpoint,
  });
  static ServiceEndpoint fromJson(Map<String, dynamic> json) => ServiceEndpoint(
        endpoint:
            json.containsKey('Endpoint') ? json['Endpoint'] as String : null,
      );
}

/// Configuration information for a search suggester. Each suggester has a
/// unique name and specifies the text field you want to use for suggestions.
/// The following options can be configured for a suggester: `FuzzyMatching`,
/// `SortExpression`.
class Suggester {
  final String suggesterName;

  final DocumentSuggesterOptions documentSuggesterOptions;

  Suggester({
    @required this.suggesterName,
    @required this.documentSuggesterOptions,
  });
  static Suggester fromJson(Map<String, dynamic> json) => Suggester(
        suggesterName: json['SuggesterName'] as String,
        documentSuggesterOptions:
            DocumentSuggesterOptions.fromJson(json['DocumentSuggesterOptions']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The value of a `Suggester` and its current status.
class SuggesterStatus {
  final Suggester options;

  final OptionStatus status;

  SuggesterStatus({
    @required this.options,
    @required this.status,
  });
  static SuggesterStatus fromJson(Map<String, dynamic> json) => SuggesterStatus(
        options: Suggester.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// Options for a field that contains an array of text strings. Present if
/// `IndexFieldType` specifies the field is of type `text-array`. A `text-array`
/// field is always searchable. All options are enabled by default.
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
      TextArrayOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceFields: json.containsKey('SourceFields')
            ? json['SourceFields'] as String
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        highlightEnabled: json.containsKey('HighlightEnabled')
            ? json['HighlightEnabled'] as bool
            : null,
        analysisScheme: json.containsKey('AnalysisScheme')
            ? json['AnalysisScheme'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options for text field. Present if `IndexFieldType` specifies the field is
/// of type `text`. A `text` field is always searchable. All options are enabled
/// by default.
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
  static TextOptions fromJson(Map<String, dynamic> json) => TextOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        sourceField: json.containsKey('SourceField')
            ? json['SourceField'] as String
            : null,
        returnEnabled: json.containsKey('ReturnEnabled')
            ? json['ReturnEnabled'] as bool
            : null,
        sortEnabled: json.containsKey('SortEnabled')
            ? json['SortEnabled'] as bool
            : null,
        highlightEnabled: json.containsKey('HighlightEnabled')
            ? json['HighlightEnabled'] as bool
            : null,
        analysisScheme: json.containsKey('AnalysisScheme')
            ? json['AnalysisScheme'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The result of a `UpdateAvailabilityOptions` request. Contains the status of
/// the domain's availability options.
class UpdateAvailabilityOptionsResponse {
  /// The newly-configured availability options. Indicates whether Multi-AZ is
  /// enabled for the domain.
  final AvailabilityOptionsStatus availabilityOptions;

  UpdateAvailabilityOptionsResponse({
    this.availabilityOptions,
  });
  static UpdateAvailabilityOptionsResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateAvailabilityOptionsResponse(
        availabilityOptions: json.containsKey('AvailabilityOptions')
            ? AvailabilityOptionsStatus.fromJson(json['AvailabilityOptions'])
            : null,
      );
}

/// The result of a `UpdateScalingParameters` request. Contains the status of
/// the newly-configured scaling parameters.
class UpdateScalingParametersResponse {
  final ScalingParametersStatus scalingParameters;

  UpdateScalingParametersResponse({
    @required this.scalingParameters,
  });
  static UpdateScalingParametersResponse fromJson(Map<String, dynamic> json) =>
      UpdateScalingParametersResponse(
        scalingParameters:
            ScalingParametersStatus.fromJson(json['ScalingParameters']),
      );
}

/// The result of an `UpdateServiceAccessPolicies` request. Contains the new
/// access policies.
class UpdateServiceAccessPoliciesResponse {
  /// The access rules configured for the domain.
  final AccessPoliciesStatus accessPolicies;

  UpdateServiceAccessPoliciesResponse({
    @required this.accessPolicies,
  });
  static UpdateServiceAccessPoliciesResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateServiceAccessPoliciesResponse(
        accessPolicies: AccessPoliciesStatus.fromJson(json['AccessPolicies']),
      );
}
