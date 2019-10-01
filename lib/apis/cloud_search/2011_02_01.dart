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
/// and endpoints, see
/// [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cloudsearch_region).
class CloudSearchApi {
  final _client;
  CloudSearchApi(client)
      : _client = client.configured('CloudSearch', serializer: 'query');

  /// Creates a new search domain.
  Future<CreateDomainResponse> createDomain(String domainName) async {
    var response_ = await _client.send('CreateDomain', {
      'DomainName': domainName,
    });
    return CreateDomainResponse.fromJson(response_);
  }

  /// Configures an `IndexField` for the search domain. Used to create new
  /// fields and modify existing ones. If the field exists, the new
  /// configuration replaces the old one. You can configure a maximum of 200
  /// index fields.
  Future<DefineIndexFieldResponse> defineIndexField(
      {@required String domainName, @required IndexField indexField}) async {
    var response_ = await _client.send('DefineIndexField', {
      'DomainName': domainName,
      'IndexField': indexField,
    });
    return DefineIndexFieldResponse.fromJson(response_);
  }

  /// Configures a `RankExpression` for the search domain. Used to create new
  /// rank expressions and modify existing ones. If the expression exists, the
  /// new configuration replaces the old one. You can configure a maximum of 50
  /// rank expressions.
  Future<DefineRankExpressionResponse> defineRankExpression(
      {@required String domainName,
      @required NamedRankExpression rankExpression}) async {
    var response_ = await _client.send('DefineRankExpression', {
      'DomainName': domainName,
      'RankExpression': rankExpression,
    });
    return DefineRankExpressionResponse.fromJson(response_);
  }

  /// Permanently deletes a search domain and all of its data.
  Future<DeleteDomainResponse> deleteDomain(String domainName) async {
    var response_ = await _client.send('DeleteDomain', {
      'DomainName': domainName,
    });
    return DeleteDomainResponse.fromJson(response_);
  }

  /// Removes an `IndexField` from the search domain.
  Future<DeleteIndexFieldResponse> deleteIndexField(
      {@required String domainName, @required String indexFieldName}) async {
    var response_ = await _client.send('DeleteIndexField', {
      'DomainName': domainName,
      'IndexFieldName': indexFieldName,
    });
    return DeleteIndexFieldResponse.fromJson(response_);
  }

  /// Removes a `RankExpression` from the search domain.
  ///
  /// [rankName]: The name of the `RankExpression` to delete.
  Future<DeleteRankExpressionResponse> deleteRankExpression(
      {@required String domainName, @required String rankName}) async {
    var response_ = await _client.send('DeleteRankExpression', {
      'DomainName': domainName,
      'RankName': rankName,
    });
    return DeleteRankExpressionResponse.fromJson(response_);
  }

  /// Gets the availability options configured for a domain. By default, shows
  /// the configuration with any pending changes. Set the `Deployed` option to
  /// `true` to show the active configuration and exclude pending changes. For
  /// more information, see
  /// [Configuring Availability Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [domainName]: The name of the domain you want to describe.
  Future<DescribeAvailabilityOptionsResponse> describeAvailabilityOptions(
      String domainName) async {
    var response_ = await _client.send('DescribeAvailabilityOptions', {
      'DomainName': domainName,
    });
    return DescribeAvailabilityOptionsResponse.fromJson(response_);
  }

  /// Gets the default search field configured for the search domain.
  Future<DescribeDefaultSearchFieldResponse> describeDefaultSearchField(
      String domainName) async {
    var response_ = await _client.send('DescribeDefaultSearchField', {
      'DomainName': domainName,
    });
    return DescribeDefaultSearchFieldResponse.fromJson(response_);
  }

  /// Gets information about the search domains owned by this account. Can be
  /// limited to specific domains. Shows all domains by default.
  ///
  /// [domainNames]: Limits the DescribeDomains response to the specified search
  /// domains.
  Future<DescribeDomainsResponse> describeDomains(
      {List<String> domainNames}) async {
    var response_ = await _client.send('DescribeDomains', {
      if (domainNames != null) 'DomainNames': domainNames,
    });
    return DescribeDomainsResponse.fromJson(response_);
  }

  /// Gets information about the index fields configured for the search domain.
  /// Can be limited to specific fields by name. Shows all fields by default.
  ///
  /// [fieldNames]: Limits the `DescribeIndexFields` response to the specified
  /// fields.
  Future<DescribeIndexFieldsResponse> describeIndexFields(String domainName,
      {List<String> fieldNames}) async {
    var response_ = await _client.send('DescribeIndexFields', {
      'DomainName': domainName,
      if (fieldNames != null) 'FieldNames': fieldNames,
    });
    return DescribeIndexFieldsResponse.fromJson(response_);
  }

  /// Gets the rank expressions configured for the search domain. Can be limited
  /// to specific rank expressions by name. Shows all rank expressions by
  /// default.
  ///
  /// [rankNames]: Limits the `DescribeRankExpressions` response to the
  /// specified fields.
  Future<DescribeRankExpressionsResponse> describeRankExpressions(
      String domainName,
      {List<String> rankNames}) async {
    var response_ = await _client.send('DescribeRankExpressions', {
      'DomainName': domainName,
      if (rankNames != null) 'RankNames': rankNames,
    });
    return DescribeRankExpressionsResponse.fromJson(response_);
  }

  /// Gets information about the resource-based policies that control access to
  /// the domain's document and search services.
  Future<DescribeServiceAccessPoliciesResponse> describeServiceAccessPolicies(
      String domainName) async {
    var response_ = await _client.send('DescribeServiceAccessPolicies', {
      'DomainName': domainName,
    });
    return DescribeServiceAccessPoliciesResponse.fromJson(response_);
  }

  /// Gets the stemming dictionary configured for the search domain.
  Future<DescribeStemmingOptionsResponse> describeStemmingOptions(
      String domainName) async {
    var response_ = await _client.send('DescribeStemmingOptions', {
      'DomainName': domainName,
    });
    return DescribeStemmingOptionsResponse.fromJson(response_);
  }

  /// Gets the stopwords configured for the search domain.
  Future<DescribeStopwordOptionsResponse> describeStopwordOptions(
      String domainName) async {
    var response_ = await _client.send('DescribeStopwordOptions', {
      'DomainName': domainName,
    });
    return DescribeStopwordOptionsResponse.fromJson(response_);
  }

  /// Gets the synonym dictionary configured for the search domain.
  Future<DescribeSynonymOptionsResponse> describeSynonymOptions(
      String domainName) async {
    var response_ = await _client.send('DescribeSynonymOptions', {
      'DomainName': domainName,
    });
    return DescribeSynonymOptionsResponse.fromJson(response_);
  }

  /// Tells the search domain to start indexing its documents using the latest
  /// text processing options and `IndexFields`. This operation must be invoked
  /// to make options whose OptionStatus has `OptionState` of
  /// `RequiresIndexDocuments` visible in search results.
  Future<IndexDocumentsResponse> indexDocuments(String domainName) async {
    var response_ = await _client.send('IndexDocuments', {
      'DomainName': domainName,
    });
    return IndexDocumentsResponse.fromJson(response_);
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

  /// Configures the default search field for the search domain. The default
  /// search field is the text field that is searched when a search request does
  /// not specify which fields to search. By default, it is configured to
  /// include the contents of all of the domain's text fields.
  ///
  /// [defaultSearchField]: The text field to search if the search request does
  /// not specify which field to search. The default search field is used when
  /// search terms are specified with the `q` parameter, or if a match
  /// expression specified with the `bq` parameter does not constrain the search
  /// to a particular field. The default is an empty string, which automatically
  /// searches all text fields.
  Future<UpdateDefaultSearchFieldResponse> updateDefaultSearchField(
      {@required String domainName,
      @required String defaultSearchField}) async {
    var response_ = await _client.send('UpdateDefaultSearchField', {
      'DomainName': domainName,
      'DefaultSearchField': defaultSearchField,
    });
    return UpdateDefaultSearchFieldResponse.fromJson(response_);
  }

  /// Configures the policies that control access to the domain's document and
  /// search services. The maximum size of an access policy document is 100 KB.
  Future<UpdateServiceAccessPoliciesResponse> updateServiceAccessPolicies(
      {@required String domainName, @required String accessPolicies}) async {
    var response_ = await _client.send('UpdateServiceAccessPolicies', {
      'DomainName': domainName,
      'AccessPolicies': accessPolicies,
    });
    return UpdateServiceAccessPoliciesResponse.fromJson(response_);
  }

  /// Configures a stemming dictionary for the search domain. The stemming
  /// dictionary is used during indexing and when processing search requests.
  /// The maximum size of the stemming dictionary is 500 KB.
  Future<UpdateStemmingOptionsResponse> updateStemmingOptions(
      {@required String domainName, @required String stems}) async {
    var response_ = await _client.send('UpdateStemmingOptions', {
      'DomainName': domainName,
      'Stems': stems,
    });
    return UpdateStemmingOptionsResponse.fromJson(response_);
  }

  /// Configures stopwords for the search domain. Stopwords are used during
  /// indexing and when processing search requests. The maximum size of the
  /// stopwords dictionary is 10 KB.
  Future<UpdateStopwordOptionsResponse> updateStopwordOptions(
      {@required String domainName, @required String stopwords}) async {
    var response_ = await _client.send('UpdateStopwordOptions', {
      'DomainName': domainName,
      'Stopwords': stopwords,
    });
    return UpdateStopwordOptionsResponse.fromJson(response_);
  }

  /// Configures a synonym dictionary for the search domain. The synonym
  /// dictionary is used during indexing to configure mappings for terms that
  /// occur in text fields. The maximum size of the synonym dictionary is 100
  /// KB.
  Future<UpdateSynonymOptionsResponse> updateSynonymOptions(
      {@required String domainName, @required String synonyms}) async {
    var response_ = await _client.send('UpdateSynonymOptions', {
      'DomainName': domainName,
      'Synonyms': synonyms,
    });
    return UpdateSynonymOptionsResponse.fromJson(response_);
  }
}

/// A `PolicyDocument` that specifies access policies for the search domain's
/// services, and the current status of those policies.
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

/// A response message that contains the status of a newly created domain.
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

/// The value of the `DefaultSearchField` configured for this search domain and
/// its current status.
class DefaultSearchFieldStatus {
  /// The name of the `IndexField` to use as the default search field. The
  /// default is an empty string, which automatically searches all text fields.
  final String options;

  final OptionStatus status;

  DefaultSearchFieldStatus({
    @required this.options,
    @required this.status,
  });
  static DefaultSearchFieldStatus fromJson(Map<String, dynamic> json) =>
      DefaultSearchFieldStatus(
        options: json['Options'] as String,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// A response message that contains the status of an updated index field.
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

/// A response message that contains the status of an updated `RankExpression`.
class DefineRankExpressionResponse {
  final RankExpressionStatus rankExpression;

  DefineRankExpressionResponse({
    @required this.rankExpression,
  });
  static DefineRankExpressionResponse fromJson(Map<String, dynamic> json) =>
      DefineRankExpressionResponse(
        rankExpression: RankExpressionStatus.fromJson(json['RankExpression']),
      );
}

/// A response message that contains the status of a newly deleted domain, or no
/// status if the domain has already been completely deleted.
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

/// A response message that contains the status of a deleted index field.
class DeleteIndexFieldResponse {
  final IndexFieldStatus indexField;

  DeleteIndexFieldResponse({
    @required this.indexField,
  });
  static DeleteIndexFieldResponse fromJson(Map<String, dynamic> json) =>
      DeleteIndexFieldResponse(
        indexField: IndexFieldStatus.fromJson(json['IndexField']),
      );
}

/// A response message that contains the status of a deleted `RankExpression`.
class DeleteRankExpressionResponse {
  final RankExpressionStatus rankExpression;

  DeleteRankExpressionResponse({
    @required this.rankExpression,
  });
  static DeleteRankExpressionResponse fromJson(Map<String, dynamic> json) =>
      DeleteRankExpressionResponse(
        rankExpression: RankExpressionStatus.fromJson(json['RankExpression']),
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

/// A response message that contains the default search field for a search
/// domain.
class DescribeDefaultSearchFieldResponse {
  /// The name of the `IndexField` to use for search requests issued with the
  /// `q` parameter. The default is the empty string, which automatically
  /// searches all text fields.
  final DefaultSearchFieldStatus defaultSearchField;

  DescribeDefaultSearchFieldResponse({
    @required this.defaultSearchField,
  });
  static DescribeDefaultSearchFieldResponse fromJson(
          Map<String, dynamic> json) =>
      DescribeDefaultSearchFieldResponse(
        defaultSearchField:
            DefaultSearchFieldStatus.fromJson(json['DefaultSearchField']),
      );
}

/// A response message that contains the status of one or more domains.
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

/// A response message that contains the index fields for a search domain.
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

/// A response message that contains the rank expressions for a search domain.
class DescribeRankExpressionsResponse {
  /// The rank expressions configured for the domain.
  final List<RankExpressionStatus> rankExpressions;

  DescribeRankExpressionsResponse({
    @required this.rankExpressions,
  });
  static DescribeRankExpressionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeRankExpressionsResponse(
        rankExpressions: (json['RankExpressions'] as List)
            .map((e) => RankExpressionStatus.fromJson(e))
            .toList(),
      );
}

/// A response message that contains the access policies for a domain.
class DescribeServiceAccessPoliciesResponse {
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

/// A response message that contains the stemming options for a search domain.
class DescribeStemmingOptionsResponse {
  final StemmingOptionsStatus stems;

  DescribeStemmingOptionsResponse({
    @required this.stems,
  });
  static DescribeStemmingOptionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeStemmingOptionsResponse(
        stems: StemmingOptionsStatus.fromJson(json['Stems']),
      );
}

/// A response message that contains the stopword options for a search domain.
class DescribeStopwordOptionsResponse {
  final StopwordOptionsStatus stopwords;

  DescribeStopwordOptionsResponse({
    @required this.stopwords,
  });
  static DescribeStopwordOptionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeStopwordOptionsResponse(
        stopwords: StopwordOptionsStatus.fromJson(json['Stopwords']),
      );
}

/// A response message that contains the synonym options for a search domain.
class DescribeSynonymOptionsResponse {
  final SynonymOptionsStatus synonyms;

  DescribeSynonymOptionsResponse({
    @required this.synonyms,
  });
  static DescribeSynonymOptionsResponse fromJson(Map<String, dynamic> json) =>
      DescribeSynonymOptionsResponse(
        synonyms: SynonymOptionsStatus.fromJson(json['Synonyms']),
      );
}

/// The current status of the search domain.
class DomainStatus {
  final String domainId;

  final String domainName;

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

  /// The number of documents that have been submitted to the domain and
  /// indexed.
  final BigInt numSearchableDocs;

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

  /// The instance type (such as search.m1.small) that is being used to process
  /// search requests.
  final String searchInstanceType;

  /// The number of partitions across which the search index is spread.
  final int searchPartitionCount;

  /// The number of search instances that are available to process search
  /// requests.
  final int searchInstanceCount;

  DomainStatus({
    @required this.domainId,
    @required this.domainName,
    this.created,
    this.deleted,
    this.numSearchableDocs,
    this.docService,
    this.searchService,
    @required this.requiresIndexDocuments,
    this.processing,
    this.searchInstanceType,
    this.searchPartitionCount,
    this.searchInstanceCount,
  });
  static DomainStatus fromJson(Map<String, dynamic> json) => DomainStatus(
        domainId: json['DomainId'] as String,
        domainName: json['DomainName'] as String,
        created: json.containsKey('Created') ? json['Created'] as bool : null,
        deleted: json.containsKey('Deleted') ? json['Deleted'] as bool : null,
        numSearchableDocs: json.containsKey('NumSearchableDocs')
            ? BigInt.from(json['NumSearchableDocs'])
            : null,
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
      );
}

/// The result of an `IndexDocuments` action.
class IndexDocumentsResponse {
  /// The names of the fields that are currently being processed due to an
  /// `IndexDocuments` action.
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

/// Defines a field in the index, including its name, type, and the source of
/// its data. The `IndexFieldType` indicates which of the options will be
/// present. It is invalid to specify options for a type other than the
/// `IndexFieldType`.
class IndexField {
  /// The name of a field in the search index. Field names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and
  /// _ (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  final String indexFieldName;

  /// The type of field. Based on this type, exactly one of the UIntOptions,
  /// LiteralOptions or TextOptions must be present.
  final String indexFieldType;

  /// Options for an unsigned integer field. Present if `IndexFieldType`
  /// specifies the field is of type unsigned integer.
  final UIntOptions uIntOptions;

  /// Options for literal field. Present if `IndexFieldType` specifies the field
  /// is of type literal.
  final LiteralOptions literalOptions;

  /// Options for text field. Present if `IndexFieldType` specifies the field is
  /// of type text.
  final TextOptions textOptions;

  /// An optional list of source attributes that provide data for this index
  /// field. If not specified, the data is pulled from a source attribute with
  /// the same name as this `IndexField`. When one or more source attributes are
  /// specified, an optional data transformation can be applied to the source
  /// data when populating the index field. You can configure a maximum of 20
  /// sources for an `IndexField`.
  final List<SourceAttribute> sourceAttributes;

  IndexField({
    @required this.indexFieldName,
    @required this.indexFieldType,
    this.uIntOptions,
    this.literalOptions,
    this.textOptions,
    this.sourceAttributes,
  });
  static IndexField fromJson(Map<String, dynamic> json) => IndexField(
        indexFieldName: json['IndexFieldName'] as String,
        indexFieldType: json['IndexFieldType'] as String,
        uIntOptions: json.containsKey('UIntOptions')
            ? UIntOptions.fromJson(json['UIntOptions'])
            : null,
        literalOptions: json.containsKey('LiteralOptions')
            ? LiteralOptions.fromJson(json['LiteralOptions'])
            : null,
        textOptions: json.containsKey('TextOptions')
            ? TextOptions.fromJson(json['TextOptions'])
            : null,
        sourceAttributes: json.containsKey('SourceAttributes')
            ? (json['SourceAttributes'] as List)
                .map((e) => SourceAttribute.fromJson(e))
                .toList()
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

/// Options that define a literal field in the search index.
class LiteralOptions {
  /// The default value for a literal field. Optional.
  final String defaultValue;

  /// Specifies whether search is enabled for this field. Default: False.
  final bool searchEnabled;

  /// Specifies whether facets are enabled for this field. Default: False.
  final bool facetEnabled;

  /// Specifies whether values of this field can be returned in search results
  /// and used for ranking. Default: False.
  final bool resultEnabled;

  LiteralOptions({
    this.defaultValue,
    this.searchEnabled,
    this.facetEnabled,
    this.resultEnabled,
  });
  static LiteralOptions fromJson(Map<String, dynamic> json) => LiteralOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        searchEnabled: json.containsKey('SearchEnabled')
            ? json['SearchEnabled'] as bool
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        resultEnabled: json.containsKey('ResultEnabled')
            ? json['ResultEnabled'] as bool
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A named expression that can be evaluated at search time and used for ranking
/// or thresholding in a search query.
class NamedRankExpression {
  /// The name of a rank expression. Rank expression names must begin with a
  /// letter and can contain the following characters: a-z (lowercase), 0-9, and
  /// _ (underscore). Uppercase letters and hyphens are not allowed. The names
  /// "body", "docid", and "text_relevance" are reserved and cannot be specified
  /// as field or rank expression names.
  final String rankName;

  /// The expression to evaluate for ranking or thresholding while processing a
  /// search request. The `RankExpression` syntax is based on JavaScript
  /// expressions and supports:
  ///
  /// *   Integer, floating point, hex and octal literals
  /// *   Shortcut evaluation of logical operators such that an expression `a ||
  /// b` evaluates to the value `a`, if `a` is true, without evaluating `b` at
  /// all
  /// *   JavaScript order of precedence for operators
  /// *   Arithmetic operators: `+ - * / %`
  /// *   Boolean operators (including the ternary operator)
  /// *   Bitwise operators
  /// *   Comparison operators
  /// *   Common mathematic functions: `abs ceil erf exp floor lgamma ln log2
  /// log10 max min sqrt pow`
  /// *   Trigonometric library functions: `acosh acos asinh asin atanh atan
  /// cosh cos sinh sin tanh tan`
  /// *   Random generation of a number between 0 and 1: `rand`
  /// *   Current time in epoch: `time`
  /// *   The `min max` functions that operate on a variable argument list
  ///
  /// Intermediate results are calculated as double precision floating point
  /// values. The final return value of a `RankExpression` is automatically
  /// converted from floating point to a 32-bit unsigned integer by rounding to
  /// the nearest integer, with a natural floor of 0 and a ceiling of
  /// max(uint32_t), 4294967295. Mathematical errors such as dividing by 0 will
  /// fail during evaluation and return a value of 0.
  ///
  /// The source data for a `RankExpression` can be the name of an `IndexField`
  /// of type uint, another `RankExpression` or the reserved name
  /// _text_relevance_. The text_relevance source is defined to return an
  /// integer from 0 to 1000 (inclusive) to indicate how relevant a document is
  /// to the search request, taking into account repetition of search terms in
  /// the document and proximity of search terms to each other in each matching
  /// `IndexField` in the document.
  ///
  /// For more information about using rank expressions to customize ranking,
  /// see the Amazon CloudSearch Developer Guide.
  final String rankExpression;

  NamedRankExpression({
    @required this.rankName,
    @required this.rankExpression,
  });
  static NamedRankExpression fromJson(Map<String, dynamic> json) =>
      NamedRankExpression(
        rankName: json['RankName'] as String,
        rankExpression: json['RankExpression'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The status of an option, including when it was last updated and whether it
/// is actively in use for searches.
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
  /// visible in searches until IndexDocuments has been called and indexing is
  /// complete.
  /// *    `Processing`: the option's latest value is not yet visible in all
  /// searches but is in the process of being activated.
  /// *    `Active`: the option's latest value is completely visible. Any
  /// warnings or messages generated during processing are provided in
  /// `Diagnostics`.
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

/// The value of a `RankExpression` and its current status.
class RankExpressionStatus {
  /// The expression that is evaluated for ranking or thresholding while
  /// processing a search request.
  final NamedRankExpression options;

  final OptionStatus status;

  RankExpressionStatus({
    @required this.options,
    @required this.status,
  });
  static RankExpressionStatus fromJson(Map<String, dynamic> json) =>
      RankExpressionStatus(
        options: NamedRankExpression.fromJson(json['Options']),
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The endpoint to which service requests can be submitted, including the
/// actual URL prefix for sending requests and the Amazon Resource Name (ARN) so
/// the endpoint can be referenced in other API calls such as
/// UpdateServiceAccessPolicies.
class ServiceEndpoint {
  final String arn;

  final String endpoint;

  ServiceEndpoint({
    this.arn,
    this.endpoint,
  });
  static ServiceEndpoint fromJson(Map<String, dynamic> json) => ServiceEndpoint(
        arn: json.containsKey('Arn') ? json['Arn'] as String : null,
        endpoint:
            json.containsKey('Endpoint') ? json['Endpoint'] as String : null,
      );
}

/// Identifies the source data for an index field. An optional data
/// transformation can be applied to the source data when populating the index
/// field. By default, the value of the source attribute is copied to the index
/// field.
class SourceAttribute {
  /// Identifies the transformation to apply when copying data from a source
  /// attribute.
  final String sourceDataFunction;

  /// Copies data from a source document attribute to an `IndexField`.
  final SourceData sourceDataCopy;

  /// Trims common title words from a source document attribute when populating
  /// an `IndexField`. This can be used to create an `IndexField` you can use
  /// for sorting.
  final SourceDataTrimTitle sourceDataTrimTitle;

  /// Maps source document attribute values to new values when populating the
  /// `IndexField`.
  final SourceDataMap sourceDataMap;

  SourceAttribute({
    @required this.sourceDataFunction,
    this.sourceDataCopy,
    this.sourceDataTrimTitle,
    this.sourceDataMap,
  });
  static SourceAttribute fromJson(Map<String, dynamic> json) => SourceAttribute(
        sourceDataFunction: json['SourceDataFunction'] as String,
        sourceDataCopy: json.containsKey('SourceDataCopy')
            ? SourceData.fromJson(json['SourceDataCopy'])
            : null,
        sourceDataTrimTitle: json.containsKey('SourceDataTrimTitle')
            ? SourceDataTrimTitle.fromJson(json['SourceDataTrimTitle'])
            : null,
        sourceDataMap: json.containsKey('SourceDataMap')
            ? SourceDataMap.fromJson(json['SourceDataMap'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The source attribute name and an optional default value to use if a document
/// doesn't have an attribute of that name.
class SourceData {
  /// The name of the document source field to add to this `IndexField`.
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String defaultValue;

  SourceData({
    @required this.sourceName,
    this.defaultValue,
  });
  static SourceData fromJson(Map<String, dynamic> json) => SourceData(
        sourceName: json['SourceName'] as String,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies how to map source attribute values to custom values when
/// populating an `IndexField`.
class SourceDataMap {
  /// The name of the document source field to add to this `IndexField`.
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String defaultValue;

  /// A map that translates source field values to custom values.
  final Map<String, String> cases;

  SourceDataMap({
    @required this.sourceName,
    this.defaultValue,
    this.cases,
  });
  static SourceDataMap fromJson(Map<String, dynamic> json) => SourceDataMap(
        sourceName: json['SourceName'] as String,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        cases: json.containsKey('Cases')
            ? (json['Cases'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies how to trim common words from the beginning of a field to enable
/// title sorting by that field.
class SourceDataTrimTitle {
  /// The name of the document source field to add to this `IndexField`.
  final String sourceName;

  /// The default value to use if the source attribute is not specified in a
  /// document. Optional.
  final String defaultValue;

  /// The separator that follows the text to trim.
  final String separator;

  final String language;

  SourceDataTrimTitle({
    @required this.sourceName,
    this.defaultValue,
    this.separator,
    this.language,
  });
  static SourceDataTrimTitle fromJson(Map<String, dynamic> json) =>
      SourceDataTrimTitle(
        sourceName: json['SourceName'] as String,
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        separator:
            json.containsKey('Separator') ? json['Separator'] as String : null,
        language:
            json.containsKey('Language') ? json['Language'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The stemming options configured for this search domain and the current
/// status of those options.
class StemmingOptionsStatus {
  final String options;

  final OptionStatus status;

  StemmingOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static StemmingOptionsStatus fromJson(Map<String, dynamic> json) =>
      StemmingOptionsStatus(
        options: json['Options'] as String,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The stopword options configured for this search domain and the current
/// status of those options.
class StopwordOptionsStatus {
  final String options;

  final OptionStatus status;

  StopwordOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static StopwordOptionsStatus fromJson(Map<String, dynamic> json) =>
      StopwordOptionsStatus(
        options: json['Options'] as String,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// The synonym options configured for this search domain and the current status
/// of those options.
class SynonymOptionsStatus {
  final String options;

  final OptionStatus status;

  SynonymOptionsStatus({
    @required this.options,
    @required this.status,
  });
  static SynonymOptionsStatus fromJson(Map<String, dynamic> json) =>
      SynonymOptionsStatus(
        options: json['Options'] as String,
        status: OptionStatus.fromJson(json['Status']),
      );
}

/// Options that define a text field in the search index.
class TextOptions {
  /// The default value for a text field. Optional.
  final String defaultValue;

  /// Specifies whether facets are enabled for this field. Default: False.
  final bool facetEnabled;

  /// Specifies whether values of this field can be returned in search results
  /// and used for ranking. Default: False.
  final bool resultEnabled;

  /// The text processor to apply to this field. Optional. Possible values:
  ///
  /// *    `cs_text_no_stemming`: turns off stemming for the field.
  ///
  /// Default: none
  final String textProcessor;

  TextOptions({
    this.defaultValue,
    this.facetEnabled,
    this.resultEnabled,
    this.textProcessor,
  });
  static TextOptions fromJson(Map<String, dynamic> json) => TextOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as String
            : null,
        facetEnabled: json.containsKey('FacetEnabled')
            ? json['FacetEnabled'] as bool
            : null,
        resultEnabled: json.containsKey('ResultEnabled')
            ? json['ResultEnabled'] as bool
            : null,
        textProcessor: json.containsKey('TextProcessor')
            ? json['TextProcessor'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Options that define a `uint` field in the search index.
class UIntOptions {
  /// The default value for an unsigned integer field. Optional.
  final int defaultValue;

  UIntOptions({
    this.defaultValue,
  });
  static UIntOptions fromJson(Map<String, dynamic> json) => UIntOptions(
        defaultValue: json.containsKey('DefaultValue')
            ? json['DefaultValue'] as int
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

/// A response message that contains the status of an updated default search
/// field.
class UpdateDefaultSearchFieldResponse {
  final DefaultSearchFieldStatus defaultSearchField;

  UpdateDefaultSearchFieldResponse({
    @required this.defaultSearchField,
  });
  static UpdateDefaultSearchFieldResponse fromJson(Map<String, dynamic> json) =>
      UpdateDefaultSearchFieldResponse(
        defaultSearchField:
            DefaultSearchFieldStatus.fromJson(json['DefaultSearchField']),
      );
}

/// A response message that contains the status of updated access policies.
class UpdateServiceAccessPoliciesResponse {
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

/// A response message that contains the status of updated stemming options.
class UpdateStemmingOptionsResponse {
  final StemmingOptionsStatus stems;

  UpdateStemmingOptionsResponse({
    @required this.stems,
  });
  static UpdateStemmingOptionsResponse fromJson(Map<String, dynamic> json) =>
      UpdateStemmingOptionsResponse(
        stems: StemmingOptionsStatus.fromJson(json['Stems']),
      );
}

/// A response message that contains the status of updated stopword options.
class UpdateStopwordOptionsResponse {
  final StopwordOptionsStatus stopwords;

  UpdateStopwordOptionsResponse({
    @required this.stopwords,
  });
  static UpdateStopwordOptionsResponse fromJson(Map<String, dynamic> json) =>
      UpdateStopwordOptionsResponse(
        stopwords: StopwordOptionsStatus.fromJson(json['Stopwords']),
      );
}

/// A response message that contains the status of updated synonym options.
class UpdateSynonymOptionsResponse {
  final SynonymOptionsStatus synonyms;

  UpdateSynonymOptionsResponse({
    @required this.synonyms,
  });
  static UpdateSynonymOptionsResponse fromJson(Map<String, dynamic> json) =>
      UpdateSynonymOptionsResponse(
        synonyms: SynonymOptionsStatus.fromJson(json['Synonyms']),
      );
}
