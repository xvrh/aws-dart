import 'package:meta/meta.dart';
import 'dart:typed_data';

/// You use the AmazonCloudSearch2013 API to upload documents to a search domain
/// and search those documents.
///
/// The endpoints for submitting `UploadDocuments`, `Search`, and `Suggest`
/// requests are domain-specific. To get the endpoints for your domain, use the
/// Amazon CloudSearch configuration service `DescribeDomains` action. The
/// domain endpoints are also displayed on the domain dashboard in the Amazon
/// CloudSearch console. You submit suggest requests to the search endpoint.
///
/// For more information, see the
/// [Amazon CloudSearch Developer Guide](http://docs.aws.amazon.com/cloudsearch/latest/developerguide).
class CloudSearchDomainApi {
  final _client;
  CloudSearchDomainApi(client)
      : _client =
            client.configured('CloudSearch Domain', serializer: 'rest-json');

  /// Retrieves a list of documents that match the specified search criteria.
  /// How you specify the search criteria depends on which query parser you use.
  /// Amazon CloudSearch supports four query parsers:
  ///
  /// *   `simple`: search all `text` and `text-array` fields for the specified
  /// string. Search for phrases, individual terms, and prefixes.
  /// *   `structured`: search specific fields, construct compound queries using
  /// Boolean operators, and use advanced features such as term boosting and
  /// proximity searching.
  /// *   `lucene`: specify search criteria using the Apache Lucene query parser
  /// syntax.
  /// *   `dismax`: specify search criteria using the simplified subset of the
  /// Apache Lucene query parser syntax defined by the DisMax query parser.
  ///
  /// For more information, see
  /// [Searching Your Data](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// The endpoint for submitting `Search` requests is domain-specific. You
  /// submit search requests to a domain's search endpoint. To get the search
  /// endpoint for your domain, use the Amazon CloudSearch configuration service
  /// `DescribeDomains` action. A domain's endpoints are also displayed on the
  /// domain dashboard in the Amazon CloudSearch console.
  ///
  /// [cursor]: Retrieves a cursor value you can use to page through large
  /// result sets. Use the `size` parameter to control the number of hits to
  /// include in each response. You can specify either the `cursor` or `start`
  /// parameter in a request; they are mutually exclusive. To get the first
  /// cursor, set the cursor value to `initial`. In subsequent requests, specify
  /// the cursor value returned in the hits section of the response.
  ///
  /// For more information, see
  /// [Paginating Results](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/paginating-results.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [expr]: Defines one or more numeric expressions that can be used to sort
  /// results or specify search or filter criteria. You can also specify
  /// expressions as return fields.
  ///
  /// You specify the expressions in JSON using the form
  /// `{"EXPRESSIONNAME":"EXPRESSION"}`. You can define and use multiple
  /// expressions in a search request. For example:
  ///
  ///  `{"expression1":"_score*rating", "expression2":"(1/rank)*year"}`
  ///
  /// For information about the variables, operators, and functions you can use
  /// in expressions, see
  /// [Writing Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html#writing-expressions)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [facet]: Specifies one or more fields for which to get facet information,
  /// and options that control how the facet information is returned. Each
  /// specified field must be facet-enabled in the domain configuration. The
  /// fields and options are specified in JSON using the form
  /// `{"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}`.
  ///
  /// You can specify the following faceting options:
  ///
  /// *   `buckets` specifies an array of the facet values or ranges to count.
  /// Ranges are specified using the same syntax that you use to search for a
  /// range of values. For more information, see
  /// [Searching for a Range of Values](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-ranges.html)
  /// in the _Amazon CloudSearch Developer Guide_. Buckets are returned in the
  /// order they are specified in the request. The `sort` and `size` options are
  /// not valid if you specify `buckets`.
  ///
  /// *   `size` specifies the maximum number of facets to include in the
  /// results. By default, Amazon CloudSearch returns counts for the top 10. The
  /// `size` parameter is only valid when you specify the `sort` option; it
  /// cannot be used in conjunction with `buckets`.
  ///
  /// *   `sort` specifies how you want to sort the facets in the results:
  /// `bucket` or `count`. Specify `bucket` to sort alphabetically or
  /// numerically by facet value (in ascending order). Specify `count` to sort
  /// by the facet counts computed for each facet value (in descending order).
  /// To retrieve facet counts for particular values or ranges of values, use
  /// the `buckets` option instead of `sort`.
  ///
  ///
  /// If no facet options are specified, facet counts are computed for all field
  /// values, the facets are sorted by facet count, and the top 10 facets are
  /// returned in the results.
  ///
  /// To count particular buckets of values, use the `buckets` option. For
  /// example, the following request uses the `buckets` option to calculate and
  /// return facet counts by decade.
  ///
  ///
  /// `{"year":{"buckets":["[1970,1979]","[1980,1989]","[1990,1999]","[2000,2009]","[2010,}"]}}`
  ///
  /// To sort facets by facet count, use the `count` option. For example, the
  /// following request sets the `sort` option to `count` to sort the facet
  /// values by facet count, with the facet values that have the most matching
  /// documents listed first. Setting the `size` option to 3 returns only the
  /// top three facet values.
  ///
  ///  `{"year":{"sort":"count","size":3}}`
  ///
  /// To sort the facets by value, use the `bucket` option. For example, the
  /// following request sets the `sort` option to `bucket` to sort the facet
  /// values numerically by year, with earliest year listed first.
  ///
  ///  `{"year":{"sort":"bucket"}}`
  ///
  /// For more information, see
  /// [Getting and Using Facet Information](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/faceting.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [filterQuery]: Specifies a structured query that filters the results of a
  /// search without affecting how the results are scored and sorted. You use
  /// `filterQuery` in conjunction with the `query` parameter to filter the
  /// documents that match the constraints specified in the `query` parameter.
  /// Specifying a filter controls only which matching documents are included in
  /// the results, it has no effect on how they are scored and sorted. The
  /// `filterQuery` parameter supports the full structured query syntax.
  ///
  /// For more information about using filters, see
  /// [Filtering Matching Documents](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/filtering-results.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [highlight]: Retrieves highlights for matches in the specified `text` or
  /// `text-array` fields. Each specified field must be highlight enabled in the
  /// domain configuration. The fields and options are specified in JSON using
  /// the form
  /// `{"FIELD":{"OPTION":VALUE,"OPTION:"STRING"},"FIELD":{"OPTION":VALUE,"OPTION":"STRING"}}`.
  ///
  /// You can specify the following highlight options:
  ///
  /// *    `format`: specifies the format of the data in the text field: `text`
  /// or `html`. When data is returned as HTML, all non-alphanumeric characters
  /// are encoded. The default is `html`.
  /// *    `max_phrases`: specifies the maximum number of occurrences of the
  /// search term(s) you want to highlight. By default, the first occurrence is
  /// highlighted.
  /// *    `pre_tag`: specifies the string to prepend to an occurrence of a
  /// search term. The default for HTML highlights is `&lt;em&gt;`. The default
  /// for text highlights is `*`.
  /// *    `post_tag`: specifies the string to append to an occurrence of a
  /// search term. The default for HTML highlights is `&lt;/em&gt;`. The default
  /// for text highlights is `*`.
  ///
  /// If no highlight options are specified for a field, the returned field text
  /// is treated as HTML and the first match is highlighted with emphasis tags:
  /// `&lt;em>search-term&lt;/em&gt;`.
  ///
  /// For example, the following request retrieves highlights for the `actors`
  /// and `title` fields.
  ///
  ///  `{ "actors": {}, "title": {"format": "text","max_phrases": 2,"pre_tag":
  /// "**","post_tag": "**"} }`
  ///
  /// [partial]: Enables partial results to be returned if one or more index
  /// partitions are unavailable. When your search index is partitioned across
  /// multiple search instances, by default Amazon CloudSearch only returns
  /// results if every partition can be queried. This means that the failure of
  /// a single search instance can result in 5xx (internal server) errors. When
  /// you enable partial results, Amazon CloudSearch returns whatever results
  /// are available and includes the percentage of documents searched in the
  /// search results (percent-searched). This enables you to more gracefully
  /// degrade your users' search experience. For example, rather than displaying
  /// no results, you could display the partial results and a message indicating
  /// that the results might be incomplete due to a temporary system outage.
  ///
  /// [query]: Specifies the search criteria for the request. How you specify
  /// the search criteria depends on the query parser used for the request and
  /// the parser options specified in the `queryOptions` parameter. By default,
  /// the `simple` query parser is used to process requests. To use the
  /// `structured`, `lucene`, or `dismax` query parser, you must also specify
  /// the `queryParser` parameter.
  ///
  /// For more information about specifying search criteria, see
  /// [Searching Your Data](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [queryOptions]: Configures options for the query parser specified in the
  /// `queryParser` parameter. You specify the options in JSON using the
  /// following form
  /// `{"OPTION1":"VALUE1","OPTION2":VALUE2"..."OPTIONN":"VALUEN"}.`
  ///
  /// The options you can configure vary according to which parser you use:
  ///
  /// *   `defaultOperator`: The default operator used to combine individual
  /// terms in the search string. For example: `defaultOperator: 'or'`. For the
  /// `dismax` parser, you specify a percentage that represents the percentage
  /// of terms in the search string (rounded down) that must match, rather than
  /// a default operator. A value of `0%` is the equivalent to OR, and a value
  /// of `100%` is equivalent to AND. The percentage must be specified as a
  /// value in the range 0-100 followed by the percent (%) symbol. For example,
  /// `defaultOperator: 50%`. Valid values: `and`, `or`, a percentage in the
  /// range 0%-100% (`dismax`). Default: `and` (`simple`, `structured`,
  /// `lucene`) or `100` (`dismax`). Valid for: `simple`, `structured`,
  /// `lucene`, and `dismax`.
  /// *   `fields`: An array of the fields to search when no fields are
  /// specified in a search. If no fields are specified in a search and this
  /// option is not specified, all text and text-array fields are searched. You
  /// can specify a weight for each field to control the relative importance of
  /// each field when Amazon CloudSearch calculates relevance scores. To specify
  /// a field weight, append a caret (`^`) symbol and the weight to the field
  /// name. For example, to boost the importance of the `title` field over the
  /// `description` field you could specify:
  /// `"fields":["title^5","description"]`. Valid values: The name of any
  /// configured field and an optional numeric value greater than zero. Default:
  /// All `text` and `text-array` fields. Valid for: `simple`, `structured`,
  /// `lucene`, and `dismax`.
  /// *   `operators`: An array of the operators or special characters you want
  /// to disable for the simple query parser. If you disable the `and`, `or`, or
  /// `not` operators, the corresponding operators (`+`, `|`, `-`) have no
  /// special meaning and are dropped from the search string. Similarly,
  /// disabling `prefix` disables the wildcard operator (`*`) and disabling
  /// `phrase` disables the ability to search for phrases by enclosing phrases
  /// in double quotes. Disabling precedence disables the ability to control
  /// order of precedence using parentheses. Disabling `near` disables the
  /// ability to use the ~ operator to perform a sloppy phrase search. Disabling
  /// the `fuzzy` operator disables the ability to use the ~ operator to perform
  /// a fuzzy search. `escape` disables the ability to use a backslash (``) to
  /// escape special characters within the search string. Disabling whitespace
  /// is an advanced option that prevents the parser from tokenizing on
  /// whitespace, which can be useful for Vietnamese. (It prevents Vietnamese
  /// words from being split incorrectly.) For example, you could disable all
  /// operators other than the phrase operator to support just simple term and
  /// phrase queries: `"operators":["and","not","or", "prefix"]`. Valid values:
  /// `and`, `escape`, `fuzzy`, `near`, `not`, `or`, `phrase`, `precedence`,
  /// `prefix`, `whitespace`. Default: All operators and special characters are
  /// enabled. Valid for: `simple`.
  /// *   `phraseFields`: An array of the `text` or `text-array` fields you want
  /// to use for phrase searches. When the terms in the search string appear in
  /// close proximity within a field, the field scores higher. You can specify a
  /// weight for each field to boost that score. The `phraseSlop` option
  /// controls how much the matches can deviate from the search string and still
  /// be boosted. To specify a field weight, append a caret (`^`) symbol and the
  /// weight to the field name. For example, to boost phrase matches in the
  /// `title` field over the `abstract` field, you could specify:
  /// `"phraseFields":["title^3", "plot"]` Valid values: The name of any `text`
  /// or `text-array` field and an optional numeric value greater than zero.
  /// Default: No fields. If you don't specify any fields with `phraseFields`,
  /// proximity scoring is disabled even if `phraseSlop` is specified. Valid
  /// for: `dismax`.
  /// *   `phraseSlop`: An integer value that specifies how much matches can
  /// deviate from the search phrase and still be boosted according to the
  /// weights specified in the `phraseFields` option; for example, `phraseSlop:
  /// 2`. You must also specify `phraseFields` to enable proximity scoring.
  /// Valid values: positive integers. Default: 0. Valid for: `dismax`.
  /// *   `explicitPhraseSlop`: An integer value that specifies how much a match
  /// can deviate from the search phrase when the phrase is enclosed in double
  /// quotes in the search string. (Phrases that exceed this proximity distance
  /// are not considered a match.) For example, to specify a slop of three for
  /// dismax phrase queries, you would specify `"explicitPhraseSlop":3`. Valid
  /// values: positive integers. Default: 0. Valid for: `dismax`.
  /// *   `tieBreaker`: When a term in the search string is found in a
  /// document's field, a score is calculated for that field based on how common
  /// the word is in that field compared to other documents. If the term occurs
  /// in multiple fields within a document, by default only the highest scoring
  /// field contributes to the document's overall score. You can specify a
  /// `tieBreaker` value to enable the matches in lower-scoring fields to
  /// contribute to the document's score. That way, if two documents have the
  /// same max field score for a particular term, the score for the document
  /// that has matches in more fields will be higher. The formula for
  /// calculating the score with a tieBreaker is `(max field score) +
  /// (tieBreaker) * (sum of the scores for the rest of the matching fields)`.
  /// Set `tieBreaker` to 0 to disregard all but the highest scoring field (pure
  /// max): `"tieBreaker":0`. Set to 1 to sum the scores from all fields (pure
  /// sum): `"tieBreaker":1`. Valid values: 0.0 to 1.0. Default: 0.0. Valid for:
  /// `dismax`.
  ///
  /// [queryParser]: Specifies which query parser to use to process the request.
  /// If `queryParser` is not specified, Amazon CloudSearch uses the `simple`
  /// query parser.
  ///
  /// Amazon CloudSearch supports four query parsers:
  ///
  /// *    `simple`: perform simple searches of `text` and `text-array` fields.
  /// By default, the `simple` query parser searches all `text` and `text-array`
  /// fields. You can specify which fields to search by with the `queryOptions`
  /// parameter. If you prefix a search term with a plus sign (+) documents must
  /// contain the term to be considered a match. (This is the default, unless
  /// you configure the default operator with the `queryOptions` parameter.) You
  /// can use the `-` (NOT), `|` (OR), and `*` (wildcard) operators to exclude
  /// particular terms, find results that match any of the specified terms, or
  /// search for a prefix. To search for a phrase rather than individual terms,
  /// enclose the phrase in double quotes. For more information, see
  /// [Searching for Text](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-text.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  /// *    `structured`: perform advanced searches by combining multiple
  /// expressions to define the search criteria. You can also search within
  /// particular fields, search for values and ranges of values, and use
  /// advanced options such as term boosting, `matchall`, and `near`. For more
  /// information, see
  /// [Constructing Compound Queries](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/searching-compound-queries.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  /// *    `lucene`: search using the Apache Lucene query parser syntax. For
  /// more information, see
  /// [Apache Lucene Query Parser Syntax](http://lucene.apache.org/core/4_6_0/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package_description).
  /// *    `dismax`: search using the simplified subset of the Apache Lucene
  /// query parser syntax defined by the DisMax query parser. For more
  /// information, see
  /// [DisMax Query Parser Syntax](http://wiki.apache.org/solr/DisMaxQParserPlugin#Query_Syntax).
  ///
  /// [return$]: Specifies the field and expression values to include in the
  /// response. Multiple fields or expressions are specified as a
  /// comma-separated list. By default, a search response includes all return
  /// enabled fields (`_all_fields`). To return only the document IDs for the
  /// matching documents, specify `_no_fields`. To retrieve the relevance score
  /// calculated for each document, specify `_score`.
  ///
  /// [size]: Specifies the maximum number of search hits to include in the
  /// response.
  ///
  /// [sort]: Specifies the fields or custom expressions to use to sort the
  /// search results. Multiple fields or expressions are specified as a
  /// comma-separated list. You must specify the sort direction (`asc` or
  /// `desc`) for each field; for example, `year desc,title asc`. To use a field
  /// to sort results, the field must be sort-enabled in the domain
  /// configuration. Array type fields cannot be used for sorting. If no `sort`
  /// parameter is specified, results are sorted by their default relevance
  /// scores in descending order: `_score desc`. You can also sort by document
  /// ID (`_id asc`) and version (`_version desc`).
  ///
  /// For more information, see
  /// [Sorting Results](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/sorting-results.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [start]: Specifies the offset of the first search hit you want to return.
  /// Note that the result set is zero-based; the first result is at index 0.
  /// You can specify either the `start` or `cursor` parameter in a request,
  /// they are mutually exclusive.
  ///
  /// For more information, see
  /// [Paginating Results](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/paginating-results.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [stats]: Specifies one or more fields for which to get statistics
  /// information. Each specified field must be facet-enabled in the domain
  /// configuration. The fields are specified in JSON using the form:
  ///
  ///  `{"FIELD-A":{},"FIELD-B":{}}`
  ///
  /// There are currently no options supported for statistics.
  Future<SearchResponse> search(String query,
      {String cursor,
      String expr,
      String facet,
      String filterQuery,
      String highlight,
      bool partial,
      String queryOptions,
      String queryParser,
      String return$,
      BigInt size,
      String sort,
      BigInt start,
      String stats}) async {
    var response_ = await _client.send('Search', {
      if (cursor != null) 'cursor': cursor,
      if (expr != null) 'expr': expr,
      if (facet != null) 'facet': facet,
      if (filterQuery != null) 'filterQuery': filterQuery,
      if (highlight != null) 'highlight': highlight,
      if (partial != null) 'partial': partial,
      'query': query,
      if (queryOptions != null) 'queryOptions': queryOptions,
      if (queryParser != null) 'queryParser': queryParser,
      if (return$ != null) 'return': return$,
      if (size != null) 'size': size,
      if (sort != null) 'sort': sort,
      if (start != null) 'start': start,
      if (stats != null) 'stats': stats,
    });
    return SearchResponse.fromJson(response_);
  }

  /// Retrieves autocomplete suggestions for a partial query string. You can use
  /// suggestions enable you to display likely matches before users finish
  /// typing. In Amazon CloudSearch, suggestions are based on the contents of a
  /// particular text field. When you request suggestions, Amazon CloudSearch
  /// finds all of the documents whose values in the suggester field start with
  /// the specified query string. The beginning of the field must match the
  /// query string to be considered a match.
  ///
  /// For more information about configuring suggesters and retrieving
  /// suggestions, see
  /// [Getting Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// The endpoint for submitting `Suggest` requests is domain-specific. You
  /// submit suggest requests to a domain's search endpoint. To get the search
  /// endpoint for your domain, use the Amazon CloudSearch configuration service
  /// `DescribeDomains` action. A domain's endpoints are also displayed on the
  /// domain dashboard in the Amazon CloudSearch console.
  ///
  /// [query]: Specifies the string for which you want to get suggestions.
  ///
  /// [suggester]: Specifies the name of the suggester to use to find suggested
  /// matches.
  ///
  /// [size]: Specifies the maximum number of suggestions to return.
  Future<SuggestResponse> suggest(
      {@required String query, @required String suggester, BigInt size}) async {
    var response_ = await _client.send('Suggest', {
      'query': query,
      'suggester': suggester,
      if (size != null) 'size': size,
    });
    return SuggestResponse.fromJson(response_);
  }

  /// Posts a batch of documents to a search domain for indexing. A document
  /// batch is a collection of add and delete operations that represent the
  /// documents you want to add, update, or delete from your domain. Batches can
  /// be described in either JSON or XML. Each item that you want Amazon
  /// CloudSearch to return as a search result (such as a product) is
  /// represented as a document. Every document has a unique ID and one or more
  /// fields that contain the data that you want to search and return in
  /// results. Individual documents cannot contain more than 1 MB of data. The
  /// entire batch cannot exceed 5 MB. To get the best possible upload
  /// performance, group add and delete operations in batches that are close the
  /// 5 MB limit. Submitting a large volume of single-document batches can
  /// overload a domain's document service.
  ///
  /// The endpoint for submitting `UploadDocuments` requests is domain-specific.
  /// To get the document endpoint for your domain, use the Amazon CloudSearch
  /// configuration service `DescribeDomains` action. A domain's endpoints are
  /// also displayed on the domain dashboard in the Amazon CloudSearch console.
  ///
  /// For more information about formatting your data for Amazon CloudSearch,
  /// see
  /// [Preparing Your Data](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/preparing-data.html)
  /// in the _Amazon CloudSearch Developer Guide_. For more information about
  /// uploading data for indexing, see
  /// [Uploading Data](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/uploading-data.html)
  /// in the _Amazon CloudSearch Developer Guide_.
  ///
  /// [documents]: A batch of documents formatted in JSON or HTML.
  ///
  /// [contentType]: The format of the batch you are uploading. Amazon
  /// CloudSearch supports two document batch formats:
  ///
  /// *   application/json
  /// *   application/xml
  Future<UploadDocumentsResponse> uploadDocuments(
      {@required Uint8List documents, @required String contentType}) async {
    var response_ = await _client.send('UploadDocuments', {
      'documents': documents,
      'contentType': contentType,
    });
    return UploadDocumentsResponse.fromJson(response_);
  }
}

/// A container for facet information.
class Bucket {
  /// The facet value being counted.
  final String value;

  /// The number of hits that contain the facet value in the specified facet
  /// field.
  final BigInt count;

  Bucket({
    this.value,
    this.count,
  });
  static Bucket fromJson(Map<String, dynamic> json) => Bucket(
        value: json.containsKey('value') ? json['value'] as String : null,
        count: json.containsKey('count') ? BigInt.from(json['count']) : null,
      );
}

/// A container for the calculated facet values and counts.
class BucketInfo {
  /// A list of the calculated facet values and counts.
  final List<Bucket> buckets;

  BucketInfo({
    this.buckets,
  });
  static BucketInfo fromJson(Map<String, dynamic> json) => BucketInfo(
        buckets: json.containsKey('buckets')
            ? (json['buckets'] as List).map((e) => Bucket.fromJson(e)).toList()
            : null,
      );
}

/// A warning returned by the document service when an issue is discovered while
/// processing an upload request.
class DocumentServiceWarning {
  /// The description for a warning returned by the document service.
  final String message;

  DocumentServiceWarning({
    this.message,
  });
  static DocumentServiceWarning fromJson(Map<String, dynamic> json) =>
      DocumentServiceWarning(
        message: json.containsKey('message') ? json['message'] as String : null,
      );
}

/// The statistics for a field calculated in the request.
class FieldStats {
  /// The minimum value found in the specified field in the result set.
  ///
  /// If the field is numeric (`int`, `int-array`, `double`, or `double-array`),
  /// `min` is the string representation of a double-precision 64-bit floating
  /// point value. If the field is `date` or `date-array`, `min` is the string
  /// representation of a date with the format specified in
  /// [IETF RFC3339](http://tools.ietf.org/html/rfc3339):
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String min;

  /// The maximum value found in the specified field in the result set.
  ///
  /// If the field is numeric (`int`, `int-array`, `double`, or `double-array`),
  /// `max` is the string representation of a double-precision 64-bit floating
  /// point value. If the field is `date` or `date-array`, `max` is the string
  /// representation of a date with the format specified in
  /// [IETF RFC3339](http://tools.ietf.org/html/rfc3339):
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String max;

  /// The number of documents that contain a value in the specified field in the
  /// result set.
  final BigInt count;

  /// The number of documents that do not contain a value in the specified field
  /// in the result set.
  final BigInt missing;

  /// The sum of the field values across the documents in the result set. `null`
  /// for date fields.
  final double sum;

  /// The sum of all field values in the result set squared.
  final double sumOfSquares;

  /// The average of the values found in the specified field in the result set.
  ///
  /// If the field is numeric (`int`, `int-array`, `double`, or `double-array`),
  /// `mean` is the string representation of a double-precision 64-bit floating
  /// point value. If the field is `date` or `date-array`, `mean` is the string
  /// representation of a date with the format specified in
  /// [IETF RFC3339](http://tools.ietf.org/html/rfc3339):
  /// yyyy-mm-ddTHH:mm:ss.SSSZ.
  final String mean;

  /// The standard deviation of the values in the specified field in the result
  /// set.
  final double stddev;

  FieldStats({
    this.min,
    this.max,
    this.count,
    this.missing,
    this.sum,
    this.sumOfSquares,
    this.mean,
    this.stddev,
  });
  static FieldStats fromJson(Map<String, dynamic> json) => FieldStats(
        min: json.containsKey('min') ? json['min'] as String : null,
        max: json.containsKey('max') ? json['max'] as String : null,
        count: json.containsKey('count') ? BigInt.from(json['count']) : null,
        missing:
            json.containsKey('missing') ? BigInt.from(json['missing']) : null,
        sum: json.containsKey('sum') ? json['sum'] as double : null,
        sumOfSquares: json.containsKey('sumOfSquares')
            ? json['sumOfSquares'] as double
            : null,
        mean: json.containsKey('mean') ? json['mean'] as String : null,
        stddev: json.containsKey('stddev') ? json['stddev'] as double : null,
      );
}

/// Information about a document that matches the search request.
class Hit {
  /// The document ID of a document that matches the search request.
  final String id;

  /// The fields returned from a document that matches the search request.
  final Map<String, List<String>> fields;

  /// The expressions returned from a document that matches the search request.
  final Map<String, String> exprs;

  /// The highlights returned from a document that matches the search request.
  final Map<String, String> highlights;

  Hit({
    this.id,
    this.fields,
    this.exprs,
    this.highlights,
  });
  static Hit fromJson(Map<String, dynamic> json) => Hit(
        id: json.containsKey('id') ? json['id'] as String : null,
        fields: json.containsKey('fields')
            ? (json['fields'] as Map).map((k, v) => MapEntry(
                k as String, (v as List).map((e) => e as String).toList()))
            : null,
        exprs: json.containsKey('exprs')
            ? (json['exprs'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
        highlights: json.containsKey('highlights')
            ? (json['highlights'] as Map)
                .map((k, v) => MapEntry(k as String, v as String))
            : null,
      );
}

/// The collection of documents that match the search request.
class Hits {
  /// The total number of documents that match the search request.
  final BigInt found;

  /// The index of the first matching document.
  final BigInt start;

  /// A cursor that can be used to retrieve the next set of matching documents
  /// when you want to page through a large result set.
  final String cursor;

  /// A document that matches the search request.
  final List<Hit> hit;

  Hits({
    this.found,
    this.start,
    this.cursor,
    this.hit,
  });
  static Hits fromJson(Map<String, dynamic> json) => Hits(
        found: json.containsKey('found') ? BigInt.from(json['found']) : null,
        start: json.containsKey('start') ? BigInt.from(json['start']) : null,
        cursor: json.containsKey('cursor') ? json['cursor'] as String : null,
        hit: json.containsKey('hit')
            ? (json['hit'] as List).map((e) => Hit.fromJson(e)).toList()
            : null,
      );
}

/// The result of a `Search` request. Contains the documents that match the
/// specified search criteria and any requested fields, highlights, and facet
/// information.
class SearchResponse {
  /// The status information returned for the search request.
  final SearchStatus status;

  /// The documents that match the search criteria.
  final Hits hits;

  /// The requested facet information.
  final Map<String, BucketInfo> facets;

  /// The requested field statistics information.
  final Map<String, FieldStats> stats;

  SearchResponse({
    this.status,
    this.hits,
    this.facets,
    this.stats,
  });
  static SearchResponse fromJson(Map<String, dynamic> json) => SearchResponse(
        status: json.containsKey('status')
            ? SearchStatus.fromJson(json['status'])
            : null,
        hits: json.containsKey('hits') ? Hits.fromJson(json['hits']) : null,
        facets: json.containsKey('facets')
            ? (json['facets'] as Map)
                .map((k, v) => MapEntry(k as String, BucketInfo.fromJson(v)))
            : null,
        stats: json.containsKey('stats')
            ? (json['stats'] as Map)
                .map((k, v) => MapEntry(k as String, FieldStats.fromJson(v)))
            : null,
      );
}

/// Contains the resource id (`rid`) and the time it took to process the request
/// (`timems`).
class SearchStatus {
  /// How long it took to process the request, in milliseconds.
  final BigInt timems;

  /// The encrypted resource ID for the request.
  final String rid;

  SearchStatus({
    this.timems,
    this.rid,
  });
  static SearchStatus fromJson(Map<String, dynamic> json) => SearchStatus(
        timems: json.containsKey('timems') ? BigInt.from(json['timems']) : null,
        rid: json.containsKey('rid') ? json['rid'] as String : null,
      );
}

/// Container for the suggestion information returned in a `SuggestResponse`.
class SuggestModel {
  /// The query string specified in the suggest request.
  final String query;

  /// The number of documents that were found to match the query string.
  final BigInt found;

  /// The documents that match the query string.
  final List<SuggestionMatch> suggestions;

  SuggestModel({
    this.query,
    this.found,
    this.suggestions,
  });
  static SuggestModel fromJson(Map<String, dynamic> json) => SuggestModel(
        query: json.containsKey('query') ? json['query'] as String : null,
        found: json.containsKey('found') ? BigInt.from(json['found']) : null,
        suggestions: json.containsKey('suggestions')
            ? (json['suggestions'] as List)
                .map((e) => SuggestionMatch.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains the response to a `Suggest` request.
class SuggestResponse {
  /// The status of a `SuggestRequest`. Contains the resource ID (`rid`) and how
  /// long it took to process the request (`timems`).
  final SuggestStatus status;

  /// Container for the matching search suggestion information.
  final SuggestModel suggest;

  SuggestResponse({
    this.status,
    this.suggest,
  });
  static SuggestResponse fromJson(Map<String, dynamic> json) => SuggestResponse(
        status: json.containsKey('status')
            ? SuggestStatus.fromJson(json['status'])
            : null,
        suggest: json.containsKey('suggest')
            ? SuggestModel.fromJson(json['suggest'])
            : null,
      );
}

/// Contains the resource id (`rid`) and the time it took to process the request
/// (`timems`).
class SuggestStatus {
  /// How long it took to process the request, in milliseconds.
  final BigInt timems;

  /// The encrypted resource ID for the request.
  final String rid;

  SuggestStatus({
    this.timems,
    this.rid,
  });
  static SuggestStatus fromJson(Map<String, dynamic> json) => SuggestStatus(
        timems: json.containsKey('timems') ? BigInt.from(json['timems']) : null,
        rid: json.containsKey('rid') ? json['rid'] as String : null,
      );
}

/// An autocomplete suggestion that matches the query string specified in a
/// `SuggestRequest`.
class SuggestionMatch {
  /// The string that matches the query string specified in the
  /// `SuggestRequest`.
  final String suggestion;

  /// The relevance score of a suggested match.
  final BigInt score;

  /// The document ID of the suggested document.
  final String id;

  SuggestionMatch({
    this.suggestion,
    this.score,
    this.id,
  });
  static SuggestionMatch fromJson(Map<String, dynamic> json) => SuggestionMatch(
        suggestion: json.containsKey('suggestion')
            ? json['suggestion'] as String
            : null,
        score: json.containsKey('score') ? BigInt.from(json['score']) : null,
        id: json.containsKey('id') ? json['id'] as String : null,
      );
}

/// Contains the response to an `UploadDocuments` request.
class UploadDocumentsResponse {
  /// The status of an `UploadDocumentsRequest`.
  final String status;

  /// The number of documents that were added to the search domain.
  final BigInt adds;

  /// The number of documents that were deleted from the search domain.
  final BigInt deletes;

  /// Any warnings returned by the document service about the documents being
  /// uploaded.
  final List<DocumentServiceWarning> warnings;

  UploadDocumentsResponse({
    this.status,
    this.adds,
    this.deletes,
    this.warnings,
  });
  static UploadDocumentsResponse fromJson(Map<String, dynamic> json) =>
      UploadDocumentsResponse(
        status: json.containsKey('status') ? json['status'] as String : null,
        adds: json.containsKey('adds') ? BigInt.from(json['adds']) : null,
        deletes:
            json.containsKey('deletes') ? BigInt.from(json['deletes']) : null,
        warnings: json.containsKey('warnings')
            ? (json['warnings'] as List)
                .map((e) => DocumentServiceWarning.fromJson(e))
                .toList()
            : null,
      );
}
