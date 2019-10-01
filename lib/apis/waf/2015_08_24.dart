import 'package:meta/meta.dart';
import 'dart:typed_data';

/// This is the _AWS WAF API Reference_ for using AWS WAF with Amazon
/// CloudFront. The AWS WAF actions and data types listed in the reference are
/// available for protecting Amazon CloudFront distributions. You can use these
/// actions and data types via the endpoint _waf.amazonaws.com_. This guide is
/// for developers who need detailed information about the AWS WAF API actions,
/// data types, and errors. For detailed information about AWS WAF features and
/// an overview of how to use the AWS WAF API, see the
/// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
class WafApi {
  final _client;
  WafApi(client) : _client = client.configured('WAF', serializer: 'json');

  /// Creates a `ByteMatchSet`. You then use UpdateByteMatchSet to identify the
  /// part of a web request that you want AWS WAF to inspect, such as the values
  /// of the `User-Agent` header or the query string. For example, you can
  /// create a `ByteMatchSet` that matches any requests with `User-Agent`
  /// headers that contain the string `BadBot`. You can then configure AWS WAF
  /// to reject those requests.
  ///
  /// To create and configure a `ByteMatchSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateByteMatchSet` request.
  ///
  /// 2.  Submit a `CreateByteMatchSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateByteMatchSet` request.
  ///
  /// 4.  Submit an UpdateByteMatchSet request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value that you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the ByteMatchSet. You can't
  /// change `Name` after you create a `ByteMatchSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateByteMatchSetResponse> createByteMatchSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateByteMatchSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateByteMatchSetResponse.fromJson(response_);
  }

  /// Creates an GeoMatchSet, which you use to specify which web requests you
  /// want to allow or block based on the country that the requests originate
  /// from. For example, if you're receiving a lot of requests from one or more
  /// countries and you want to block the requests, you can create an
  /// `GeoMatchSet` that contains those countries and then configure AWS WAF to
  /// block the requests.
  ///
  /// To create and configure a `GeoMatchSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateGeoMatchSet` request.
  ///
  /// 2.  Submit a `CreateGeoMatchSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateGeoMatchSet request.
  ///
  /// 4.  Submit an `UpdateGeoMatchSetSet` request to specify the countries that
  /// you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the GeoMatchSet. You can't
  /// change `Name` after you create the `GeoMatchSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateGeoMatchSetResponse> createGeoMatchSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateGeoMatchSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateGeoMatchSetResponse.fromJson(response_);
  }

  /// Creates an IPSet, which you use to specify which web requests that you
  /// want to allow or block based on the IP addresses that the requests
  /// originate from. For example, if you're receiving a lot of requests from
  /// one or more individual IP addresses or one or more ranges of IP addresses
  /// and you want to block the requests, you can create an `IPSet` that
  /// contains those IP addresses and then configure AWS WAF to block the
  /// requests.
  ///
  /// To create and configure an `IPSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateIPSet` request.
  ///
  /// 2.  Submit a `CreateIPSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateIPSet request.
  ///
  /// 4.  Submit an `UpdateIPSet` request to specify the IP addresses that you
  /// want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the IPSet. You can't change
  /// `Name` after you create the `IPSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateIPSetResponse> createIPSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateIPSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateIPSetResponse.fromJson(response_);
  }

  /// Creates a RateBasedRule. The `RateBasedRule` contains a `RateLimit`, which
  /// specifies the maximum number of requests that AWS WAF allows from a
  /// specified IP address in a five-minute period. The `RateBasedRule` also
  /// contains the `IPSet` objects, `ByteMatchSet` objects, and other predicates
  /// that identify the requests that you want to count or block if these
  /// requests exceed the `RateLimit`.
  ///
  /// If you add more than one predicate to a `RateBasedRule`, a request not
  /// only must exceed the `RateLimit`, but it also must match all the
  /// specifications to be counted or blocked. For example, suppose you add the
  /// following to a `RateBasedRule`:
  ///
  /// *   An `IPSet` that matches the IP address `192.0.2.44/32`
  ///
  /// *   A `ByteMatchSet` that matches `BadBot` in the `User-Agent` header
  ///
  ///
  /// Further, you specify a `RateLimit` of 15,000.
  ///
  /// You then add the `RateBasedRule` to a `WebACL` and specify that you want
  /// to block requests that meet the conditions in the rule. For a request to
  /// be blocked, it must come from the IP address 192.0.2.44 _and_ the
  /// `User-Agent` header in the request must contain the value `BadBot`.
  /// Further, requests that match these two conditions must be received at a
  /// rate of more than 15,000 requests every five minutes. If both conditions
  /// are met and the rate is exceeded, AWS WAF blocks the requests. If the rate
  /// drops below 15,000 for a five-minute period, AWS WAF no longer blocks the
  /// requests.
  ///
  /// As a second example, suppose you want to limit requests to a particular
  /// page on your site. To do this, you could add the following to a
  /// `RateBasedRule`:
  ///
  /// *   A `ByteMatchSet` with `FieldToMatch` of `URI`
  ///
  /// *   A `PositionalConstraint` of `STARTS_WITH`
  ///
  /// *   A `TargetString` of `login`
  ///
  ///
  /// Further, you specify a `RateLimit` of 15,000.
  ///
  /// By adding this `RateBasedRule` to a `WebACL`, you could limit requests to
  /// your login page without affecting the rest of your site.
  ///
  /// To create and configure a `RateBasedRule`, perform the following steps:
  ///
  /// 1.  Create and update the predicates that you want to include in the rule.
  /// For more information, see CreateByteMatchSet, CreateIPSet, and
  /// CreateSqlInjectionMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateRule` request.
  ///
  /// 3.  Submit a `CreateRateBasedRule` request.
  ///
  /// 4.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateRule request.
  ///
  /// 5.  Submit an `UpdateRateBasedRule` request to specify the predicates that
  /// you want to include in the rule.
  ///
  /// 6.  Create and update a `WebACL` that contains the `RateBasedRule`. For
  /// more information, see CreateWebACL.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the RateBasedRule. You can't
  /// change the name of a `RateBasedRule` after you create it.
  ///
  /// [metricName]: A friendly name or description for the metrics for this
  /// `RateBasedRule`. The name can contain only alphanumeric characters (A-Z,
  /// a-z, 0-9), with maximum length 128 and minimum length one. It can't
  /// contain whitespace or metric names reserved for AWS WAF, including "All"
  /// and "Default_Action." You can't change the name of the metric after you
  /// create the `RateBasedRule`.
  ///
  /// [rateKey]: The field that AWS WAF uses to determine if requests are likely
  /// arriving from a single source and thus subject to rate monitoring. The
  /// only valid value for `RateKey` is `IP`. `IP` indicates that requests that
  /// arrive from the same IP address are subject to the `RateLimit` that is
  /// specified in the `RateBasedRule`.
  ///
  /// [rateLimit]: The maximum number of requests, which have an identical value
  /// in the field that is specified by `RateKey`, allowed in a five-minute
  /// period. If the number of requests exceeds the `RateLimit` and the other
  /// predicates specified in the rule are also met, AWS WAF triggers the action
  /// that is specified for this rule.
  ///
  /// [changeToken]: The `ChangeToken` that you used to submit the
  /// `CreateRateBasedRule` request. You can also use this value to query the
  /// status of the request. For more information, see GetChangeTokenStatus.
  Future<CreateRateBasedRuleResponse> createRateBasedRule(
      {@required String name,
      @required String metricName,
      @required String rateKey,
      @required BigInt rateLimit,
      @required String changeToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateRateBasedRule', {
      'Name': name,
      'MetricName': metricName,
      'RateKey': rateKey,
      'RateLimit': rateLimit,
      'ChangeToken': changeToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateRateBasedRuleResponse.fromJson(response_);
  }

  /// Creates a RegexMatchSet. You then use UpdateRegexMatchSet to identify the
  /// part of a web request that you want AWS WAF to inspect, such as the values
  /// of the `User-Agent` header or the query string. For example, you can
  /// create a `RegexMatchSet` that contains a `RegexMatchTuple` that looks for
  /// any requests with `User-Agent` headers that match a `RegexPatternSet` with
  /// pattern `B[a@]dB[o0]t`. You can then configure AWS WAF to reject those
  /// requests.
  ///
  /// To create and configure a `RegexMatchSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateRegexMatchSet` request.
  ///
  /// 2.  Submit a `CreateRegexMatchSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateRegexMatchSet` request.
  ///
  /// 4.  Submit an UpdateRegexMatchSet request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value, using a `RegexPatternSet`, that you want AWS WAF to
  /// watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the RegexMatchSet. You can't
  /// change `Name` after you create a `RegexMatchSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateRegexMatchSetResponse> createRegexMatchSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateRegexMatchSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateRegexMatchSetResponse.fromJson(response_);
  }

  /// Creates a `RegexPatternSet`. You then use UpdateRegexPatternSet to specify
  /// the regular expression (regex) pattern that you want AWS WAF to search
  /// for, such as `B[a@]dB[o0]t`. You can then configure AWS WAF to reject
  /// those requests.
  ///
  /// To create and configure a `RegexPatternSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateRegexPatternSet` request.
  ///
  /// 2.  Submit a `CreateRegexPatternSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateRegexPatternSet` request.
  ///
  /// 4.  Submit an UpdateRegexPatternSet request to specify the string that you
  /// want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the RegexPatternSet. You can't
  /// change `Name` after you create a `RegexPatternSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateRegexPatternSetResponse> createRegexPatternSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateRegexPatternSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateRegexPatternSetResponse.fromJson(response_);
  }

  /// Creates a `Rule`, which contains the `IPSet` objects, `ByteMatchSet`
  /// objects, and other predicates that identify the requests that you want to
  /// block. If you add more than one predicate to a `Rule`, a request must
  /// match all of the specifications to be allowed or blocked. For example,
  /// suppose that you add the following to a `Rule`:
  ///
  /// *   An `IPSet` that matches the IP address `192.0.2.44/32`
  ///
  /// *   A `ByteMatchSet` that matches `BadBot` in the `User-Agent` header
  ///
  ///
  /// You then add the `Rule` to a `WebACL` and specify that you want to blocks
  /// requests that satisfy the `Rule`. For a request to be blocked, it must
  /// come from the IP address 192.0.2.44 _and_ the `User-Agent` header in the
  /// request must contain the value `BadBot`.
  ///
  /// To create and configure a `Rule`, perform the following steps:
  ///
  /// 1.  Create and update the predicates that you want to include in the
  /// `Rule`. For more information, see CreateByteMatchSet, CreateIPSet, and
  /// CreateSqlInjectionMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateRule` request.
  ///
  /// 3.  Submit a `CreateRule` request.
  ///
  /// 4.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateRule request.
  ///
  /// 5.  Submit an `UpdateRule` request to specify the predicates that you want
  /// to include in the `Rule`.
  ///
  /// 6.  Create and update a `WebACL` that contains the `Rule`. For more
  /// information, see CreateWebACL.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the Rule. You can't change the
  /// name of a `Rule` after you create it.
  ///
  /// [metricName]: A friendly name or description for the metrics for this
  /// `Rule`. The name can contain only alphanumeric characters (A-Z, a-z, 0-9),
  /// with maximum length 128 and minimum length one. It can't contain
  /// whitespace or metric names reserved for AWS WAF, including "All" and
  /// "Default_Action." You can't change the name of the metric after you create
  /// the `Rule`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateRuleResponse> createRule(
      {@required String name,
      @required String metricName,
      @required String changeToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateRule', {
      'Name': name,
      'MetricName': metricName,
      'ChangeToken': changeToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateRuleResponse.fromJson(response_);
  }

  /// Creates a `RuleGroup`. A rule group is a collection of predefined rules
  /// that you add to a web ACL. You use UpdateRuleGroup to add rules to the
  /// rule group.
  ///
  /// Rule groups are subject to the following limits:
  ///
  /// *   Three rule groups per account. You can request an increase to this
  /// limit by contacting customer support.
  ///
  /// *   One rule group per web ACL.
  ///
  /// *   Ten rules per rule group.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the RuleGroup. You can't change
  /// `Name` after you create a `RuleGroup`.
  ///
  /// [metricName]: A friendly name or description for the metrics for this
  /// `RuleGroup`. The name can contain only alphanumeric characters (A-Z, a-z,
  /// 0-9), with maximum length 128 and minimum length one. It can't contain
  /// whitespace or metric names reserved for AWS WAF, including "All" and
  /// "Default_Action." You can't change the name of the metric after you create
  /// the `RuleGroup`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateRuleGroupResponse> createRuleGroup(
      {@required String name,
      @required String metricName,
      @required String changeToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateRuleGroup', {
      'Name': name,
      'MetricName': metricName,
      'ChangeToken': changeToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateRuleGroupResponse.fromJson(response_);
  }

  /// Creates a `SizeConstraintSet`. You then use UpdateSizeConstraintSet to
  /// identify the part of a web request that you want AWS WAF to check for
  /// length, such as the length of the `User-Agent` header or the length of the
  /// query string. For example, you can create a `SizeConstraintSet` that
  /// matches any requests that have a query string that is longer than 100
  /// bytes. You can then configure AWS WAF to reject those requests.
  ///
  /// To create and configure a `SizeConstraintSet`, perform the following
  /// steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateSizeConstraintSet` request.
  ///
  /// 2.  Submit a `CreateSizeConstraintSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateSizeConstraintSet` request.
  ///
  /// 4.  Submit an UpdateSizeConstraintSet request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value that you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the SizeConstraintSet. You can't
  /// change `Name` after you create a `SizeConstraintSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateSizeConstraintSetResponse> createSizeConstraintSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateSizeConstraintSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateSizeConstraintSetResponse.fromJson(response_);
  }

  /// Creates a SqlInjectionMatchSet, which you use to allow, block, or count
  /// requests that contain snippets of SQL code in a specified part of web
  /// requests. AWS WAF searches for character sequences that are likely to be
  /// malicious strings.
  ///
  /// To create and configure a `SqlInjectionMatchSet`, perform the following
  /// steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateSqlInjectionMatchSet` request.
  ///
  /// 2.  Submit a `CreateSqlInjectionMatchSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateSqlInjectionMatchSet request.
  ///
  /// 4.  Submit an UpdateSqlInjectionMatchSet request to specify the parts of
  /// web requests in which you want to allow, block, or count malicious SQL
  /// code.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description for the SqlInjectionMatchSet that
  /// you're creating. You can't change `Name` after you create the
  /// `SqlInjectionMatchSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateSqlInjectionMatchSetResponse> createSqlInjectionMatchSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateSqlInjectionMatchSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateSqlInjectionMatchSetResponse.fromJson(response_);
  }

  /// Creates a `WebACL`, which contains the `Rules` that identify the
  /// CloudFront web requests that you want to allow, block, or count. AWS WAF
  /// evaluates `Rules` in order based on the value of `Priority` for each
  /// `Rule`.
  ///
  /// You also specify a default action, either `ALLOW` or `BLOCK`. If a web
  /// request doesn't match any of the `Rules` in a `WebACL`, AWS WAF responds
  /// to the request with the default action.
  ///
  /// To create and configure a `WebACL`, perform the following steps:
  ///
  /// 1.  Create and update the `ByteMatchSet` objects and other predicates that
  /// you want to include in `Rules`. For more information, see
  /// CreateByteMatchSet, UpdateByteMatchSet, CreateIPSet, UpdateIPSet,
  /// CreateSqlInjectionMatchSet, and UpdateSqlInjectionMatchSet.
  ///
  /// 2.  Create and update the `Rules` that you want to include in the
  /// `WebACL`. For more information, see CreateRule and UpdateRule.
  ///
  /// 3.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateWebACL` request.
  ///
  /// 4.  Submit a `CreateWebACL` request.
  ///
  /// 5.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateWebACL request.
  ///
  /// 6.  Submit an UpdateWebACL request to specify the `Rules` that you want to
  /// include in the `WebACL`, to specify the default action, and to associate
  /// the `WebACL` with a CloudFront distribution.
  ///
  ///
  /// For more information about how to use the AWS WAF API, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description of the WebACL. You can't change
  /// `Name` after you create the `WebACL`.
  ///
  /// [metricName]: A friendly name or description for the metrics for this
  /// `WebACL`.The name can contain only alphanumeric characters (A-Z, a-z,
  /// 0-9), with maximum length 128 and minimum length one. It can't contain
  /// whitespace or metric names reserved for AWS WAF, including "All" and
  /// "Default_Action." You can't change `MetricName` after you create the
  /// `WebACL`.
  ///
  /// [defaultAction]: The action that you want AWS WAF to take when a request
  /// doesn't match the criteria specified in any of the `Rule` objects that are
  /// associated with the `WebACL`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateWebAclResponse> createWebAcl(
      {@required String name,
      @required String metricName,
      @required WafAction defaultAction,
      @required String changeToken,
      List<Tag> tags}) async {
    var response_ = await _client.send('CreateWebACL', {
      'Name': name,
      'MetricName': metricName,
      'DefaultAction': defaultAction,
      'ChangeToken': changeToken,
      if (tags != null) 'Tags': tags,
    });
    return CreateWebAclResponse.fromJson(response_);
  }

  /// Creates an XssMatchSet, which you use to allow, block, or count requests
  /// that contain cross-site scripting attacks in the specified part of web
  /// requests. AWS WAF searches for character sequences that are likely to be
  /// malicious strings.
  ///
  /// To create and configure an `XssMatchSet`, perform the following steps:
  ///
  /// 1.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `CreateXssMatchSet` request.
  ///
  /// 2.  Submit a `CreateXssMatchSet` request.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateXssMatchSet request.
  ///
  /// 4.  Submit an UpdateXssMatchSet request to specify the parts of web
  /// requests in which you want to allow, block, or count cross-site scripting
  /// attacks.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [name]: A friendly name or description for the XssMatchSet that you're
  /// creating. You can't change `Name` after you create the `XssMatchSet`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<CreateXssMatchSetResponse> createXssMatchSet(
      {@required String name, @required String changeToken}) async {
    var response_ = await _client.send('CreateXssMatchSet', {
      'Name': name,
      'ChangeToken': changeToken,
    });
    return CreateXssMatchSetResponse.fromJson(response_);
  }

  /// Permanently deletes a ByteMatchSet. You can't delete a `ByteMatchSet` if
  /// it's still used in any `Rules` or if it still includes any ByteMatchTuple
  /// objects (any filters).
  ///
  /// If you just want to remove a `ByteMatchSet` from a `Rule`, use UpdateRule.
  ///
  /// To permanently delete a `ByteMatchSet`, perform the following steps:
  ///
  /// 1.  Update the `ByteMatchSet` to remove filters, if any. For more
  /// information, see UpdateByteMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteByteMatchSet` request.
  ///
  /// 3.  Submit a `DeleteByteMatchSet` request.
  ///
  /// [byteMatchSetId]: The `ByteMatchSetId` of the ByteMatchSet that you want
  /// to delete. `ByteMatchSetId` is returned by CreateByteMatchSet and by
  /// ListByteMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteByteMatchSetResponse> deleteByteMatchSet(
      {@required String byteMatchSetId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteByteMatchSet', {
      'ByteMatchSetId': byteMatchSetId,
      'ChangeToken': changeToken,
    });
    return DeleteByteMatchSetResponse.fromJson(response_);
  }

  /// Permanently deletes a GeoMatchSet. You can't delete a `GeoMatchSet` if
  /// it's still used in any `Rules` or if it still includes any countries.
  ///
  /// If you just want to remove a `GeoMatchSet` from a `Rule`, use UpdateRule.
  ///
  /// To permanently delete a `GeoMatchSet` from AWS WAF, perform the following
  /// steps:
  ///
  /// 1.  Update the `GeoMatchSet` to remove any countries. For more
  /// information, see UpdateGeoMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteGeoMatchSet` request.
  ///
  /// 3.  Submit a `DeleteGeoMatchSet` request.
  ///
  /// [geoMatchSetId]: The `GeoMatchSetID` of the GeoMatchSet that you want to
  /// delete. `GeoMatchSetId` is returned by CreateGeoMatchSet and by
  /// ListGeoMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteGeoMatchSetResponse> deleteGeoMatchSet(
      {@required String geoMatchSetId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteGeoMatchSet', {
      'GeoMatchSetId': geoMatchSetId,
      'ChangeToken': changeToken,
    });
    return DeleteGeoMatchSetResponse.fromJson(response_);
  }

  /// Permanently deletes an IPSet. You can't delete an `IPSet` if it's still
  /// used in any `Rules` or if it still includes any IP addresses.
  ///
  /// If you just want to remove an `IPSet` from a `Rule`, use UpdateRule.
  ///
  /// To permanently delete an `IPSet` from AWS WAF, perform the following
  /// steps:
  ///
  /// 1.  Update the `IPSet` to remove IP address ranges, if any. For more
  /// information, see UpdateIPSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteIPSet` request.
  ///
  /// 3.  Submit a `DeleteIPSet` request.
  ///
  /// [ipSetId]: The `IPSetId` of the IPSet that you want to delete. `IPSetId`
  /// is returned by CreateIPSet and by ListIPSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteIPSetResponse> deleteIPSet(
      {@required String ipSetId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteIPSet', {
      'IPSetId': ipSetId,
      'ChangeToken': changeToken,
    });
    return DeleteIPSetResponse.fromJson(response_);
  }

  /// Permanently deletes the LoggingConfiguration from the specified web ACL.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the web ACL from which
  /// you want to delete the LoggingConfiguration.
  Future<DeleteLoggingConfigurationResponse> deleteLoggingConfiguration(
      String resourceArn) async {
    var response_ = await _client.send('DeleteLoggingConfiguration', {
      'ResourceArn': resourceArn,
    });
    return DeleteLoggingConfigurationResponse.fromJson(response_);
  }

  /// Permanently deletes an IAM policy from the specified RuleGroup.
  ///
  /// The user making the request must be the owner of the RuleGroup.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the RuleGroup from which
  /// you want to delete the policy.
  ///
  /// The user making the request must be the owner of the RuleGroup.
  Future<DeletePermissionPolicyResponse> deletePermissionPolicy(
      String resourceArn) async {
    var response_ = await _client.send('DeletePermissionPolicy', {
      'ResourceArn': resourceArn,
    });
    return DeletePermissionPolicyResponse.fromJson(response_);
  }

  /// Permanently deletes a RateBasedRule. You can't delete a rule if it's still
  /// used in any `WebACL` objects or if it still includes any predicates, such
  /// as `ByteMatchSet` objects.
  ///
  /// If you just want to remove a rule from a `WebACL`, use UpdateWebACL.
  ///
  /// To permanently delete a `RateBasedRule` from AWS WAF, perform the
  /// following steps:
  ///
  /// 1.  Update the `RateBasedRule` to remove predicates, if any. For more
  /// information, see UpdateRateBasedRule.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteRateBasedRule` request.
  ///
  /// 3.  Submit a `DeleteRateBasedRule` request.
  ///
  /// [ruleId]: The `RuleId` of the RateBasedRule that you want to delete.
  /// `RuleId` is returned by CreateRateBasedRule and by ListRateBasedRules.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteRateBasedRuleResponse> deleteRateBasedRule(
      {@required String ruleId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteRateBasedRule', {
      'RuleId': ruleId,
      'ChangeToken': changeToken,
    });
    return DeleteRateBasedRuleResponse.fromJson(response_);
  }

  /// Permanently deletes a RegexMatchSet. You can't delete a `RegexMatchSet` if
  /// it's still used in any `Rules` or if it still includes any
  /// `RegexMatchTuples` objects (any filters).
  ///
  /// If you just want to remove a `RegexMatchSet` from a `Rule`, use
  /// UpdateRule.
  ///
  /// To permanently delete a `RegexMatchSet`, perform the following steps:
  ///
  /// 1.  Update the `RegexMatchSet` to remove filters, if any. For more
  /// information, see UpdateRegexMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteRegexMatchSet` request.
  ///
  /// 3.  Submit a `DeleteRegexMatchSet` request.
  ///
  /// [regexMatchSetId]: The `RegexMatchSetId` of the RegexMatchSet that you
  /// want to delete. `RegexMatchSetId` is returned by CreateRegexMatchSet and
  /// by ListRegexMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteRegexMatchSetResponse> deleteRegexMatchSet(
      {@required String regexMatchSetId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteRegexMatchSet', {
      'RegexMatchSetId': regexMatchSetId,
      'ChangeToken': changeToken,
    });
    return DeleteRegexMatchSetResponse.fromJson(response_);
  }

  /// Permanently deletes a RegexPatternSet. You can't delete a
  /// `RegexPatternSet` if it's still used in any `RegexMatchSet` or if the
  /// `RegexPatternSet` is not empty.
  ///
  /// [regexPatternSetId]: The `RegexPatternSetId` of the RegexPatternSet that
  /// you want to delete. `RegexPatternSetId` is returned by
  /// CreateRegexPatternSet and by ListRegexPatternSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteRegexPatternSetResponse> deleteRegexPatternSet(
      {@required String regexPatternSetId,
      @required String changeToken}) async {
    var response_ = await _client.send('DeleteRegexPatternSet', {
      'RegexPatternSetId': regexPatternSetId,
      'ChangeToken': changeToken,
    });
    return DeleteRegexPatternSetResponse.fromJson(response_);
  }

  /// Permanently deletes a Rule. You can't delete a `Rule` if it's still used
  /// in any `WebACL` objects or if it still includes any predicates, such as
  /// `ByteMatchSet` objects.
  ///
  /// If you just want to remove a `Rule` from a `WebACL`, use UpdateWebACL.
  ///
  /// To permanently delete a `Rule` from AWS WAF, perform the following steps:
  ///
  /// 1.  Update the `Rule` to remove predicates, if any. For more information,
  /// see UpdateRule.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteRule` request.
  ///
  /// 3.  Submit a `DeleteRule` request.
  ///
  /// [ruleId]: The `RuleId` of the Rule that you want to delete. `RuleId` is
  /// returned by CreateRule and by ListRules.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteRuleResponse> deleteRule(
      {@required String ruleId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteRule', {
      'RuleId': ruleId,
      'ChangeToken': changeToken,
    });
    return DeleteRuleResponse.fromJson(response_);
  }

  /// Permanently deletes a RuleGroup. You can't delete a `RuleGroup` if it's
  /// still used in any `WebACL` objects or if it still includes any rules.
  ///
  /// If you just want to remove a `RuleGroup` from a `WebACL`, use
  /// UpdateWebACL.
  ///
  /// To permanently delete a `RuleGroup` from AWS WAF, perform the following
  /// steps:
  ///
  /// 1.  Update the `RuleGroup` to remove rules, if any. For more information,
  /// see UpdateRuleGroup.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteRuleGroup` request.
  ///
  /// 3.  Submit a `DeleteRuleGroup` request.
  ///
  /// [ruleGroupId]: The `RuleGroupId` of the RuleGroup that you want to delete.
  /// `RuleGroupId` is returned by CreateRuleGroup and by ListRuleGroups.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteRuleGroupResponse> deleteRuleGroup(
      {@required String ruleGroupId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteRuleGroup', {
      'RuleGroupId': ruleGroupId,
      'ChangeToken': changeToken,
    });
    return DeleteRuleGroupResponse.fromJson(response_);
  }

  /// Permanently deletes a SizeConstraintSet. You can't delete a
  /// `SizeConstraintSet` if it's still used in any `Rules` or if it still
  /// includes any SizeConstraint objects (any filters).
  ///
  /// If you just want to remove a `SizeConstraintSet` from a `Rule`, use
  /// UpdateRule.
  ///
  /// To permanently delete a `SizeConstraintSet`, perform the following steps:
  ///
  /// 1.  Update the `SizeConstraintSet` to remove filters, if any. For more
  /// information, see UpdateSizeConstraintSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteSizeConstraintSet` request.
  ///
  /// 3.  Submit a `DeleteSizeConstraintSet` request.
  ///
  /// [sizeConstraintSetId]: The `SizeConstraintSetId` of the SizeConstraintSet
  /// that you want to delete. `SizeConstraintSetId` is returned by
  /// CreateSizeConstraintSet and by ListSizeConstraintSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteSizeConstraintSetResponse> deleteSizeConstraintSet(
      {@required String sizeConstraintSetId,
      @required String changeToken}) async {
    var response_ = await _client.send('DeleteSizeConstraintSet', {
      'SizeConstraintSetId': sizeConstraintSetId,
      'ChangeToken': changeToken,
    });
    return DeleteSizeConstraintSetResponse.fromJson(response_);
  }

  /// Permanently deletes a SqlInjectionMatchSet. You can't delete a
  /// `SqlInjectionMatchSet` if it's still used in any `Rules` or if it still
  /// contains any SqlInjectionMatchTuple objects.
  ///
  /// If you just want to remove a `SqlInjectionMatchSet` from a `Rule`, use
  /// UpdateRule.
  ///
  /// To permanently delete a `SqlInjectionMatchSet` from AWS WAF, perform the
  /// following steps:
  ///
  /// 1.  Update the `SqlInjectionMatchSet` to remove filters, if any. For more
  /// information, see UpdateSqlInjectionMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteSqlInjectionMatchSet` request.
  ///
  /// 3.  Submit a `DeleteSqlInjectionMatchSet` request.
  ///
  /// [sqlInjectionMatchSetId]: The `SqlInjectionMatchSetId` of the
  /// SqlInjectionMatchSet that you want to delete. `SqlInjectionMatchSetId` is
  /// returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteSqlInjectionMatchSetResponse> deleteSqlInjectionMatchSet(
      {@required String sqlInjectionMatchSetId,
      @required String changeToken}) async {
    var response_ = await _client.send('DeleteSqlInjectionMatchSet', {
      'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
      'ChangeToken': changeToken,
    });
    return DeleteSqlInjectionMatchSetResponse.fromJson(response_);
  }

  /// Permanently deletes a WebACL. You can't delete a `WebACL` if it still
  /// contains any `Rules`.
  ///
  /// To delete a `WebACL`, perform the following steps:
  ///
  /// 1.  Update the `WebACL` to remove `Rules`, if any. For more information,
  /// see UpdateWebACL.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteWebACL` request.
  ///
  /// 3.  Submit a `DeleteWebACL` request.
  ///
  /// [webAclId]: The `WebACLId` of the WebACL that you want to delete.
  /// `WebACLId` is returned by CreateWebACL and by ListWebACLs.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteWebAclResponse> deleteWebAcl(
      {@required String webAclId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteWebACL', {
      'WebACLId': webAclId,
      'ChangeToken': changeToken,
    });
    return DeleteWebAclResponse.fromJson(response_);
  }

  /// Permanently deletes an XssMatchSet. You can't delete an `XssMatchSet` if
  /// it's still used in any `Rules` or if it still contains any XssMatchTuple
  /// objects.
  ///
  /// If you just want to remove an `XssMatchSet` from a `Rule`, use UpdateRule.
  ///
  /// To permanently delete an `XssMatchSet` from AWS WAF, perform the following
  /// steps:
  ///
  /// 1.  Update the `XssMatchSet` to remove filters, if any. For more
  /// information, see UpdateXssMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of a `DeleteXssMatchSet` request.
  ///
  /// 3.  Submit a `DeleteXssMatchSet` request.
  ///
  /// [xssMatchSetId]: The `XssMatchSetId` of the XssMatchSet that you want to
  /// delete. `XssMatchSetId` is returned by CreateXssMatchSet and by
  /// ListXssMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<DeleteXssMatchSetResponse> deleteXssMatchSet(
      {@required String xssMatchSetId, @required String changeToken}) async {
    var response_ = await _client.send('DeleteXssMatchSet', {
      'XssMatchSetId': xssMatchSetId,
      'ChangeToken': changeToken,
    });
    return DeleteXssMatchSetResponse.fromJson(response_);
  }

  /// Returns the ByteMatchSet specified by `ByteMatchSetId`.
  ///
  /// [byteMatchSetId]: The `ByteMatchSetId` of the ByteMatchSet that you want
  /// to get. `ByteMatchSetId` is returned by CreateByteMatchSet and by
  /// ListByteMatchSets.
  Future<GetByteMatchSetResponse> getByteMatchSet(String byteMatchSetId) async {
    var response_ = await _client.send('GetByteMatchSet', {
      'ByteMatchSetId': byteMatchSetId,
    });
    return GetByteMatchSetResponse.fromJson(response_);
  }

  /// When you want to create, update, or delete AWS WAF objects, get a change
  /// token and include the change token in the create, update, or delete
  /// request. Change tokens ensure that your application doesn't submit
  /// conflicting requests to AWS WAF.
  ///
  /// Each create, update, or delete request must use a unique change token. If
  /// your application submits a `GetChangeToken` request and then submits a
  /// second `GetChangeToken` request before submitting a create, update, or
  /// delete request, the second `GetChangeToken` request returns the same value
  /// as the first `GetChangeToken` request.
  ///
  /// When you use a change token in a create, update, or delete request, the
  /// status of the change token changes to `PENDING`, which indicates that AWS
  /// WAF is propagating the change to all AWS WAF servers. Use
  /// `GetChangeTokenStatus` to determine the status of your change token.
  Future<GetChangeTokenResponse> getChangeToken() async {
    var response_ = await _client.send('GetChangeToken', {});
    return GetChangeTokenResponse.fromJson(response_);
  }

  /// Returns the status of a `ChangeToken` that you got by calling
  /// GetChangeToken. `ChangeTokenStatus` is one of the following values:
  ///
  /// *    `PROVISIONED`: You requested the change token by calling
  /// `GetChangeToken`, but you haven't used it yet in a call to create, update,
  /// or delete an AWS WAF object.
  ///
  /// *    `PENDING`: AWS WAF is propagating the create, update, or delete
  /// request to all AWS WAF servers.
  ///
  /// *    `INSYNC`: Propagation is complete.
  ///
  /// [changeToken]: The change token for which you want to get the status. This
  /// change token was previously returned in the `GetChangeToken` response.
  Future<GetChangeTokenStatusResponse> getChangeTokenStatus(
      String changeToken) async {
    var response_ = await _client.send('GetChangeTokenStatus', {
      'ChangeToken': changeToken,
    });
    return GetChangeTokenStatusResponse.fromJson(response_);
  }

  /// Returns the GeoMatchSet that is specified by `GeoMatchSetId`.
  ///
  /// [geoMatchSetId]: The `GeoMatchSetId` of the GeoMatchSet that you want to
  /// get. `GeoMatchSetId` is returned by CreateGeoMatchSet and by
  /// ListGeoMatchSets.
  Future<GetGeoMatchSetResponse> getGeoMatchSet(String geoMatchSetId) async {
    var response_ = await _client.send('GetGeoMatchSet', {
      'GeoMatchSetId': geoMatchSetId,
    });
    return GetGeoMatchSetResponse.fromJson(response_);
  }

  /// Returns the IPSet that is specified by `IPSetId`.
  ///
  /// [ipSetId]: The `IPSetId` of the IPSet that you want to get. `IPSetId` is
  /// returned by CreateIPSet and by ListIPSets.
  Future<GetIPSetResponse> getIPSet(String ipSetId) async {
    var response_ = await _client.send('GetIPSet', {
      'IPSetId': ipSetId,
    });
    return GetIPSetResponse.fromJson(response_);
  }

  /// Returns the LoggingConfiguration for the specified web ACL.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the web ACL for which you
  /// want to get the LoggingConfiguration.
  Future<GetLoggingConfigurationResponse> getLoggingConfiguration(
      String resourceArn) async {
    var response_ = await _client.send('GetLoggingConfiguration', {
      'ResourceArn': resourceArn,
    });
    return GetLoggingConfigurationResponse.fromJson(response_);
  }

  /// Returns the IAM policy attached to the RuleGroup.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the RuleGroup for which
  /// you want to get the policy.
  Future<GetPermissionPolicyResponse> getPermissionPolicy(
      String resourceArn) async {
    var response_ = await _client.send('GetPermissionPolicy', {
      'ResourceArn': resourceArn,
    });
    return GetPermissionPolicyResponse.fromJson(response_);
  }

  /// Returns the RateBasedRule that is specified by the `RuleId` that you
  /// included in the `GetRateBasedRule` request.
  ///
  /// [ruleId]: The `RuleId` of the RateBasedRule that you want to get. `RuleId`
  /// is returned by CreateRateBasedRule and by ListRateBasedRules.
  Future<GetRateBasedRuleResponse> getRateBasedRule(String ruleId) async {
    var response_ = await _client.send('GetRateBasedRule', {
      'RuleId': ruleId,
    });
    return GetRateBasedRuleResponse.fromJson(response_);
  }

  /// Returns an array of IP addresses currently being blocked by the
  /// RateBasedRule that is specified by the `RuleId`. The maximum number of
  /// managed keys that will be blocked is 10,000. If more than 10,000 addresses
  /// exceed the rate limit, the 10,000 addresses with the highest rates will be
  /// blocked.
  ///
  /// [ruleId]: The `RuleId` of the RateBasedRule for which you want to get a
  /// list of `ManagedKeys`. `RuleId` is returned by CreateRateBasedRule and by
  /// ListRateBasedRules.
  ///
  /// [nextMarker]: A null value and not currently used. Do not include this in
  /// your request.
  Future<GetRateBasedRuleManagedKeysResponse> getRateBasedRuleManagedKeys(
      String ruleId,
      {String nextMarker}) async {
    var response_ = await _client.send('GetRateBasedRuleManagedKeys', {
      'RuleId': ruleId,
      if (nextMarker != null) 'NextMarker': nextMarker,
    });
    return GetRateBasedRuleManagedKeysResponse.fromJson(response_);
  }

  /// Returns the RegexMatchSet specified by `RegexMatchSetId`.
  ///
  /// [regexMatchSetId]: The `RegexMatchSetId` of the RegexMatchSet that you
  /// want to get. `RegexMatchSetId` is returned by CreateRegexMatchSet and by
  /// ListRegexMatchSets.
  Future<GetRegexMatchSetResponse> getRegexMatchSet(
      String regexMatchSetId) async {
    var response_ = await _client.send('GetRegexMatchSet', {
      'RegexMatchSetId': regexMatchSetId,
    });
    return GetRegexMatchSetResponse.fromJson(response_);
  }

  /// Returns the RegexPatternSet specified by `RegexPatternSetId`.
  ///
  /// [regexPatternSetId]: The `RegexPatternSetId` of the RegexPatternSet that
  /// you want to get. `RegexPatternSetId` is returned by CreateRegexPatternSet
  /// and by ListRegexPatternSets.
  Future<GetRegexPatternSetResponse> getRegexPatternSet(
      String regexPatternSetId) async {
    var response_ = await _client.send('GetRegexPatternSet', {
      'RegexPatternSetId': regexPatternSetId,
    });
    return GetRegexPatternSetResponse.fromJson(response_);
  }

  /// Returns the Rule that is specified by the `RuleId` that you included in
  /// the `GetRule` request.
  ///
  /// [ruleId]: The `RuleId` of the Rule that you want to get. `RuleId` is
  /// returned by CreateRule and by ListRules.
  Future<GetRuleResponse> getRule(String ruleId) async {
    var response_ = await _client.send('GetRule', {
      'RuleId': ruleId,
    });
    return GetRuleResponse.fromJson(response_);
  }

  /// Returns the RuleGroup that is specified by the `RuleGroupId` that you
  /// included in the `GetRuleGroup` request.
  ///
  /// To view the rules in a rule group, use ListActivatedRulesInRuleGroup.
  ///
  /// [ruleGroupId]: The `RuleGroupId` of the RuleGroup that you want to get.
  /// `RuleGroupId` is returned by CreateRuleGroup and by ListRuleGroups.
  Future<GetRuleGroupResponse> getRuleGroup(String ruleGroupId) async {
    var response_ = await _client.send('GetRuleGroup', {
      'RuleGroupId': ruleGroupId,
    });
    return GetRuleGroupResponse.fromJson(response_);
  }

  /// Gets detailed information about a specified number of requests--a
  /// sample--that AWS WAF randomly selects from among the first 5,000 requests
  /// that your AWS resource received during a time range that you choose. You
  /// can specify a sample size of up to 500 requests, and you can specify any
  /// time range in the previous three hours.
  ///
  ///  `GetSampledRequests` returns a time range, which is usually the time
  /// range that you specified. However, if your resource (such as a CloudFront
  /// distribution) received 5,000 requests before the specified time range
  /// elapsed, `GetSampledRequests` returns an updated time range. This new time
  /// range indicates the actual period during which AWS WAF selected the
  /// requests in the sample.
  ///
  /// [webAclId]: The `WebACLId` of the `WebACL` for which you want
  /// `GetSampledRequests` to return a sample of requests.
  ///
  /// [ruleId]:  `RuleId` is one of three values:
  ///
  /// *   The `RuleId` of the `Rule` or the `RuleGroupId` of the `RuleGroup` for
  /// which you want `GetSampledRequests` to return a sample of requests.
  ///
  /// *    `Default_Action`, which causes `GetSampledRequests` to return a
  /// sample of the requests that didn't match any of the rules in the specified
  /// `WebACL`.
  ///
  /// [timeWindow]: The start date and time and the end date and time of the
  /// range for which you want `GetSampledRequests` to return a sample of
  /// requests. Specify the date and time in the following format:
  /// `"2016-09-27T14:50Z"`. You can specify any time range in the previous
  /// three hours.
  ///
  /// [maxItems]: The number of requests that you want AWS WAF to return from
  /// among the first 5,000 requests that your AWS resource received during the
  /// time range. If your resource received fewer requests than the value of
  /// `MaxItems`, `GetSampledRequests` returns information about all of them.
  Future<GetSampledRequestsResponse> getSampledRequests(
      {@required String webAclId,
      @required String ruleId,
      @required TimeWindow timeWindow,
      @required BigInt maxItems}) async {
    var response_ = await _client.send('GetSampledRequests', {
      'WebAclId': webAclId,
      'RuleId': ruleId,
      'TimeWindow': timeWindow,
      'MaxItems': maxItems,
    });
    return GetSampledRequestsResponse.fromJson(response_);
  }

  /// Returns the SizeConstraintSet specified by `SizeConstraintSetId`.
  ///
  /// [sizeConstraintSetId]: The `SizeConstraintSetId` of the SizeConstraintSet
  /// that you want to get. `SizeConstraintSetId` is returned by
  /// CreateSizeConstraintSet and by ListSizeConstraintSets.
  Future<GetSizeConstraintSetResponse> getSizeConstraintSet(
      String sizeConstraintSetId) async {
    var response_ = await _client.send('GetSizeConstraintSet', {
      'SizeConstraintSetId': sizeConstraintSetId,
    });
    return GetSizeConstraintSetResponse.fromJson(response_);
  }

  /// Returns the SqlInjectionMatchSet that is specified by
  /// `SqlInjectionMatchSetId`.
  ///
  /// [sqlInjectionMatchSetId]: The `SqlInjectionMatchSetId` of the
  /// SqlInjectionMatchSet that you want to get. `SqlInjectionMatchSetId` is
  /// returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.
  Future<GetSqlInjectionMatchSetResponse> getSqlInjectionMatchSet(
      String sqlInjectionMatchSetId) async {
    var response_ = await _client.send('GetSqlInjectionMatchSet', {
      'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
    });
    return GetSqlInjectionMatchSetResponse.fromJson(response_);
  }

  /// Returns the WebACL that is specified by `WebACLId`.
  ///
  /// [webAclId]: The `WebACLId` of the WebACL that you want to get. `WebACLId`
  /// is returned by CreateWebACL and by ListWebACLs.
  Future<GetWebAclResponse> getWebAcl(String webAclId) async {
    var response_ = await _client.send('GetWebACL', {
      'WebACLId': webAclId,
    });
    return GetWebAclResponse.fromJson(response_);
  }

  /// Returns the XssMatchSet that is specified by `XssMatchSetId`.
  ///
  /// [xssMatchSetId]: The `XssMatchSetId` of the XssMatchSet that you want to
  /// get. `XssMatchSetId` is returned by CreateXssMatchSet and by
  /// ListXssMatchSets.
  Future<GetXssMatchSetResponse> getXssMatchSet(String xssMatchSetId) async {
    var response_ = await _client.send('GetXssMatchSet', {
      'XssMatchSetId': xssMatchSetId,
    });
    return GetXssMatchSetResponse.fromJson(response_);
  }

  /// Returns an array of ActivatedRule objects.
  ///
  /// [ruleGroupId]: The `RuleGroupId` of the RuleGroup for which you want to
  /// get a list of ActivatedRule objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `ActivatedRules` than the value of `Limit`, AWS WAF returns a `NextMarker`
  /// value in the response that allows you to list another group of
  /// `ActivatedRules`. For the second and subsequent
  /// `ListActivatedRulesInRuleGroup` requests, specify the value of
  /// `NextMarker` from the previous response to get information about another
  /// batch of `ActivatedRules`.
  ///
  /// [limit]: Specifies the number of `ActivatedRules` that you want AWS WAF to
  /// return for this request. If you have more `ActivatedRules` than the number
  /// that you specify for `Limit`, the response includes a `NextMarker` value
  /// that you can use to get another batch of `ActivatedRules`.
  Future<ListActivatedRulesInRuleGroupResponse> listActivatedRulesInRuleGroup(
      {String ruleGroupId, String nextMarker, int limit}) async {
    var response_ = await _client.send('ListActivatedRulesInRuleGroup', {
      if (ruleGroupId != null) 'RuleGroupId': ruleGroupId,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListActivatedRulesInRuleGroupResponse.fromJson(response_);
  }

  /// Returns an array of ByteMatchSetSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `ByteMatchSets` than the value of `Limit`, AWS WAF returns a `NextMarker`
  /// value in the response that allows you to list another group of
  /// `ByteMatchSets`. For the second and subsequent `ListByteMatchSets`
  /// requests, specify the value of `NextMarker` from the previous response to
  /// get information about another batch of `ByteMatchSets`.
  ///
  /// [limit]: Specifies the number of `ByteMatchSet` objects that you want AWS
  /// WAF to return for this request. If you have more `ByteMatchSets` objects
  /// than the number you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of `ByteMatchSet`
  /// objects.
  Future<ListByteMatchSetsResponse> listByteMatchSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListByteMatchSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListByteMatchSetsResponse.fromJson(response_);
  }

  /// Returns an array of GeoMatchSetSummary objects in the response.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `GeoMatchSet`s than the value of `Limit`, AWS WAF returns a `NextMarker`
  /// value in the response that allows you to list another group of
  /// `GeoMatchSet` objects. For the second and subsequent `ListGeoMatchSets`
  /// requests, specify the value of `NextMarker` from the previous response to
  /// get information about another batch of `GeoMatchSet` objects.
  ///
  /// [limit]: Specifies the number of `GeoMatchSet` objects that you want AWS
  /// WAF to return for this request. If you have more `GeoMatchSet` objects
  /// than the number you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of `GeoMatchSet`
  /// objects.
  Future<ListGeoMatchSetsResponse> listGeoMatchSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListGeoMatchSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListGeoMatchSetsResponse.fromJson(response_);
  }

  /// Returns an array of IPSetSummary objects in the response.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `IPSets` than the value of `Limit`, AWS WAF returns a `NextMarker` value
  /// in the response that allows you to list another group of `IPSets`. For the
  /// second and subsequent `ListIPSets` requests, specify the value of
  /// `NextMarker` from the previous response to get information about another
  /// batch of `IPSets`.
  ///
  /// [limit]: Specifies the number of `IPSet` objects that you want AWS WAF to
  /// return for this request. If you have more `IPSet` objects than the number
  /// you specify for `Limit`, the response includes a `NextMarker` value that
  /// you can use to get another batch of `IPSet` objects.
  Future<ListIPSetsResponse> listIPSets({String nextMarker, int limit}) async {
    var response_ = await _client.send('ListIPSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListIPSetsResponse.fromJson(response_);
  }

  /// Returns an array of LoggingConfiguration objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `LoggingConfigurations` than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `LoggingConfigurations`. For the second and subsequent
  /// `ListLoggingConfigurations` requests, specify the value of `NextMarker`
  /// from the previous response to get information about another batch of
  /// `ListLoggingConfigurations`.
  ///
  /// [limit]: Specifies the number of `LoggingConfigurations` that you want AWS
  /// WAF to return for this request. If you have more `LoggingConfigurations`
  /// than the number that you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of
  /// `LoggingConfigurations`.
  Future<ListLoggingConfigurationsResponse> listLoggingConfigurations(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListLoggingConfigurations', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListLoggingConfigurationsResponse.fromJson(response_);
  }

  /// Returns an array of RuleSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more `Rules`
  /// than the value of `Limit`, AWS WAF returns a `NextMarker` value in the
  /// response that allows you to list another group of `Rules`. For the second
  /// and subsequent `ListRateBasedRules` requests, specify the value of
  /// `NextMarker` from the previous response to get information about another
  /// batch of `Rules`.
  ///
  /// [limit]: Specifies the number of `Rules` that you want AWS WAF to return
  /// for this request. If you have more `Rules` than the number that you
  /// specify for `Limit`, the response includes a `NextMarker` value that you
  /// can use to get another batch of `Rules`.
  Future<ListRateBasedRulesResponse> listRateBasedRules(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListRateBasedRules', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListRateBasedRulesResponse.fromJson(response_);
  }

  /// Returns an array of RegexMatchSetSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `RegexMatchSet` objects than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `ByteMatchSets`. For the second and subsequent `ListRegexMatchSets`
  /// requests, specify the value of `NextMarker` from the previous response to
  /// get information about another batch of `RegexMatchSet` objects.
  ///
  /// [limit]: Specifies the number of `RegexMatchSet` objects that you want AWS
  /// WAF to return for this request. If you have more `RegexMatchSet` objects
  /// than the number you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of
  /// `RegexMatchSet` objects.
  Future<ListRegexMatchSetsResponse> listRegexMatchSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListRegexMatchSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListRegexMatchSetsResponse.fromJson(response_);
  }

  /// Returns an array of RegexPatternSetSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `RegexPatternSet` objects than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `RegexPatternSet` objects. For the second and subsequent
  /// `ListRegexPatternSets` requests, specify the value of `NextMarker` from
  /// the previous response to get information about another batch of
  /// `RegexPatternSet` objects.
  ///
  /// [limit]: Specifies the number of `RegexPatternSet` objects that you want
  /// AWS WAF to return for this request. If you have more `RegexPatternSet`
  /// objects than the number you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of
  /// `RegexPatternSet` objects.
  Future<ListRegexPatternSetsResponse> listRegexPatternSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListRegexPatternSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListRegexPatternSetsResponse.fromJson(response_);
  }

  /// Returns an array of RuleGroup objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `RuleGroups` than the value of `Limit`, AWS WAF returns a `NextMarker`
  /// value in the response that allows you to list another group of
  /// `RuleGroups`. For the second and subsequent `ListRuleGroups` requests,
  /// specify the value of `NextMarker` from the previous response to get
  /// information about another batch of `RuleGroups`.
  ///
  /// [limit]: Specifies the number of `RuleGroups` that you want AWS WAF to
  /// return for this request. If you have more `RuleGroups` than the number
  /// that you specify for `Limit`, the response includes a `NextMarker` value
  /// that you can use to get another batch of `RuleGroups`.
  Future<ListRuleGroupsResponse> listRuleGroups(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListRuleGroups', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListRuleGroupsResponse.fromJson(response_);
  }

  /// Returns an array of RuleSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more `Rules`
  /// than the value of `Limit`, AWS WAF returns a `NextMarker` value in the
  /// response that allows you to list another group of `Rules`. For the second
  /// and subsequent `ListRules` requests, specify the value of `NextMarker`
  /// from the previous response to get information about another batch of
  /// `Rules`.
  ///
  /// [limit]: Specifies the number of `Rules` that you want AWS WAF to return
  /// for this request. If you have more `Rules` than the number that you
  /// specify for `Limit`, the response includes a `NextMarker` value that you
  /// can use to get another batch of `Rules`.
  Future<ListRulesResponse> listRules({String nextMarker, int limit}) async {
    var response_ = await _client.send('ListRules', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListRulesResponse.fromJson(response_);
  }

  /// Returns an array of SizeConstraintSetSummary objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `SizeConstraintSets` than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `SizeConstraintSets`. For the second and subsequent
  /// `ListSizeConstraintSets` requests, specify the value of `NextMarker` from
  /// the previous response to get information about another batch of
  /// `SizeConstraintSets`.
  ///
  /// [limit]: Specifies the number of `SizeConstraintSet` objects that you want
  /// AWS WAF to return for this request. If you have more `SizeConstraintSets`
  /// objects than the number you specify for `Limit`, the response includes a
  /// `NextMarker` value that you can use to get another batch of
  /// `SizeConstraintSet` objects.
  Future<ListSizeConstraintSetsResponse> listSizeConstraintSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListSizeConstraintSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListSizeConstraintSetsResponse.fromJson(response_);
  }

  /// Returns an array of SqlInjectionMatchSet objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// SqlInjectionMatchSet objects than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `SqlInjectionMatchSets`. For the second and subsequent
  /// `ListSqlInjectionMatchSets` requests, specify the value of `NextMarker`
  /// from the previous response to get information about another batch of
  /// `SqlInjectionMatchSets`.
  ///
  /// [limit]: Specifies the number of SqlInjectionMatchSet objects that you
  /// want AWS WAF to return for this request. If you have more
  /// `SqlInjectionMatchSet` objects than the number you specify for `Limit`,
  /// the response includes a `NextMarker` value that you can use to get another
  /// batch of `Rules`.
  Future<ListSqlInjectionMatchSetsResponse> listSqlInjectionMatchSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListSqlInjectionMatchSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListSqlInjectionMatchSetsResponse.fromJson(response_);
  }

  /// Returns an array of RuleGroup objects that you are subscribed to.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `ByteMatchSets`subscribed rule groups than the value of `Limit`, AWS WAF
  /// returns a `NextMarker` value in the response that allows you to list
  /// another group of subscribed rule groups. For the second and subsequent
  /// `ListSubscribedRuleGroupsRequest` requests, specify the value of
  /// `NextMarker` from the previous response to get information about another
  /// batch of subscribed rule groups.
  ///
  /// [limit]: Specifies the number of subscribed rule groups that you want AWS
  /// WAF to return for this request. If you have more objects than the number
  /// you specify for `Limit`, the response includes a `NextMarker` value that
  /// you can use to get another batch of objects.
  Future<ListSubscribedRuleGroupsResponse> listSubscribedRuleGroups(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListSubscribedRuleGroups', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListSubscribedRuleGroupsResponse.fromJson(response_);
  }

  Future<ListTagsForResourceResponse> listTagsForResource(String resourceArn,
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListTagsForResource', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
      'ResourceARN': resourceArn,
    });
    return ListTagsForResourceResponse.fromJson(response_);
  }

  /// Returns an array of WebACLSummary objects in the response.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// `WebACL` objects than the number that you specify for `Limit`, AWS WAF
  /// returns a `NextMarker` value in the response that allows you to list
  /// another group of `WebACL` objects. For the second and subsequent
  /// `ListWebACLs` requests, specify the value of `NextMarker` from the
  /// previous response to get information about another batch of `WebACL`
  /// objects.
  ///
  /// [limit]: Specifies the number of `WebACL` objects that you want AWS WAF to
  /// return for this request. If you have more `WebACL` objects than the number
  /// that you specify for `Limit`, the response includes a `NextMarker` value
  /// that you can use to get another batch of `WebACL` objects.
  Future<ListWebACLsResponse> listWebACLs(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListWebACLs', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListWebACLsResponse.fromJson(response_);
  }

  /// Returns an array of XssMatchSet objects.
  ///
  /// [nextMarker]: If you specify a value for `Limit` and you have more
  /// XssMatchSet objects than the value of `Limit`, AWS WAF returns a
  /// `NextMarker` value in the response that allows you to list another group
  /// of `XssMatchSets`. For the second and subsequent `ListXssMatchSets`
  /// requests, specify the value of `NextMarker` from the previous response to
  /// get information about another batch of `XssMatchSets`.
  ///
  /// [limit]: Specifies the number of XssMatchSet objects that you want AWS WAF
  /// to return for this request. If you have more `XssMatchSet` objects than
  /// the number you specify for `Limit`, the response includes a `NextMarker`
  /// value that you can use to get another batch of `Rules`.
  Future<ListXssMatchSetsResponse> listXssMatchSets(
      {String nextMarker, int limit}) async {
    var response_ = await _client.send('ListXssMatchSets', {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (limit != null) 'Limit': limit,
    });
    return ListXssMatchSetsResponse.fromJson(response_);
  }

  /// Associates a LoggingConfiguration with a specified web ACL.
  ///
  /// You can access information about all traffic that AWS WAF inspects using
  /// the following steps:
  ///
  /// 1.  Create an Amazon Kinesis Data Firehose .
  ///
  ///     Create the data firehose with a PUT source and in the region that you
  /// are operating. However, if you are capturing logs for Amazon CloudFront,
  /// always create the firehose in US East (N. Virginia).
  ///
  ///      Do not create the data firehose using a `Kinesis stream` as your
  /// source.
  /// 2.  Associate that firehose to your web ACL using a
  /// `PutLoggingConfiguration` request.
  ///
  ///
  /// When you successfully enable logging using a `PutLoggingConfiguration`
  /// request, AWS WAF will create a service linked role with the necessary
  /// permissions to write logs to the Amazon Kinesis Data Firehose. For more
  /// information, see
  /// [Logging Web ACL Traffic Information](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html)
  /// in the _AWS WAF Developer Guide_.
  ///
  /// [loggingConfiguration]: The Amazon Kinesis Data Firehose that contains the
  /// inspected traffic information, the redacted fields details, and the Amazon
  /// Resource Name (ARN) of the web ACL to monitor.
  Future<PutLoggingConfigurationResponse> putLoggingConfiguration(
      LoggingConfiguration loggingConfiguration) async {
    var response_ = await _client.send('PutLoggingConfiguration', {
      'LoggingConfiguration': loggingConfiguration,
    });
    return PutLoggingConfigurationResponse.fromJson(response_);
  }

  /// Attaches a IAM policy to the specified resource. The only supported use
  /// for this action is to share a RuleGroup across accounts.
  ///
  /// The `PutPermissionPolicy` is subject to the following restrictions:
  ///
  /// *   You can attach only one policy with each `PutPermissionPolicy`
  /// request.
  ///
  /// *   The policy must include an `Effect`, `Action` and `Principal`.
  ///
  /// *    `Effect` must specify `Allow`.
  ///
  /// *   The `Action` in the policy must be `waf:UpdateWebACL`,
  /// `waf-regional:UpdateWebACL`, `waf:GetRuleGroup` and
  /// `waf-regional:GetRuleGroup` . Any extra or wildcard actions in the policy
  /// will be rejected.
  ///
  /// *   The policy cannot include a `Resource` parameter.
  ///
  /// *   The ARN in the request must be a valid WAF RuleGroup ARN and the
  /// RuleGroup must exist in the same region.
  ///
  /// *   The user making the request must be the owner of the RuleGroup.
  ///
  /// *   Your policy must be composed using IAM Policy version 2012-10-17.
  ///
  ///
  /// For more information, see
  /// [IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html).
  ///
  /// An example of a valid policy parameter is shown in the Examples section
  /// below.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the RuleGroup to which
  /// you want to attach the policy.
  ///
  /// [policy]: The policy to attach to the specified RuleGroup.
  Future<PutPermissionPolicyResponse> putPermissionPolicy(
      {@required String resourceArn, @required String policy}) async {
    var response_ = await _client.send('PutPermissionPolicy', {
      'ResourceArn': resourceArn,
      'Policy': policy,
    });
    return PutPermissionPolicyResponse.fromJson(response_);
  }

  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    var response_ = await _client.send('TagResource', {
      'ResourceARN': resourceArn,
      'Tags': tags,
    });
    return TagResourceResponse.fromJson(response_);
  }

  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    var response_ = await _client.send('UntagResource', {
      'ResourceARN': resourceArn,
      'TagKeys': tagKeys,
    });
    return UntagResourceResponse.fromJson(response_);
  }

  /// Inserts or deletes ByteMatchTuple objects (filters) in a ByteMatchSet. For
  /// each `ByteMatchTuple` object, you specify the following values:
  ///
  /// *   Whether to insert or delete the object from the array. If you want to
  /// change a `ByteMatchSetUpdate` object, you delete the existing object and
  /// add a new one.
  ///
  /// *   The part of a web request that you want AWS WAF to inspect, such as a
  /// query string or the value of the `User-Agent` header.
  ///
  /// *   The bytes (typically a string that corresponds with ASCII characters)
  /// that you want AWS WAF to look for. For more information, including how you
  /// specify the values for the AWS WAF API and the AWS CLI or SDKs, see
  /// `TargetString` in the ByteMatchTuple data type.
  ///
  /// *   Where to look, such as at the beginning or the end of a query string.
  ///
  /// *   Whether to perform any conversions on the request, such as converting
  /// it to lowercase, before inspecting it for the specified string.
  ///
  ///
  /// For example, you can add a `ByteMatchSetUpdate` object that matches web
  /// requests in which `User-Agent` headers contain the string `BadBot`. You
  /// can then configure AWS WAF to block those requests.
  ///
  /// To create and configure a `ByteMatchSet`, perform the following steps:
  ///
  /// 1.  Create a `ByteMatchSet.` For more information, see CreateByteMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateByteMatchSet` request.
  ///
  /// 3.  Submit an `UpdateByteMatchSet` request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value that you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [byteMatchSetId]: The `ByteMatchSetId` of the ByteMatchSet that you want
  /// to update. `ByteMatchSetId` is returned by CreateByteMatchSet and by
  /// ListByteMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `ByteMatchSetUpdate` objects that you want to
  /// insert into or delete from a ByteMatchSet. For more information, see the
  /// applicable data types:
  ///
  /// *    ByteMatchSetUpdate: Contains `Action` and `ByteMatchTuple`
  ///
  /// *    ByteMatchTuple: Contains `FieldToMatch`, `PositionalConstraint`,
  /// `TargetString`, and `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  Future<UpdateByteMatchSetResponse> updateByteMatchSet(
      {@required String byteMatchSetId,
      @required String changeToken,
      @required List<ByteMatchSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateByteMatchSet', {
      'ByteMatchSetId': byteMatchSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateByteMatchSetResponse.fromJson(response_);
  }

  /// Inserts or deletes GeoMatchConstraint objects in an `GeoMatchSet`. For
  /// each `GeoMatchConstraint` object, you specify the following values:
  ///
  /// *   Whether to insert or delete the object from the array. If you want to
  /// change an `GeoMatchConstraint` object, you delete the existing object and
  /// add a new one.
  ///
  /// *   The `Type`. The only valid value for `Type` is `Country`.
  ///
  /// *   The `Value`, which is a two character code for the country to add to
  /// the `GeoMatchConstraint` object. Valid codes are listed in
  /// GeoMatchConstraint$Value.
  ///
  ///
  /// To create and configure an `GeoMatchSet`, perform the following steps:
  ///
  /// 1.  Submit a CreateGeoMatchSet request.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateGeoMatchSet request.
  ///
  /// 3.  Submit an `UpdateGeoMatchSet` request to specify the country that you
  /// want AWS WAF to watch for.
  ///
  ///
  /// When you update an `GeoMatchSet`, you specify the country that you want to
  /// add and/or the country that you want to delete. If you want to change a
  /// country, you delete the existing country and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [geoMatchSetId]: The `GeoMatchSetId` of the GeoMatchSet that you want to
  /// update. `GeoMatchSetId` is returned by CreateGeoMatchSet and by
  /// ListGeoMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `GeoMatchSetUpdate` objects that you want to insert
  /// into or delete from an GeoMatchSet. For more information, see the
  /// applicable data types:
  ///
  /// *    GeoMatchSetUpdate: Contains `Action` and `GeoMatchConstraint`
  ///
  /// *    GeoMatchConstraint: Contains `Type` and `Value`
  ///
  ///     You can have only one `Type` and `Value` per `GeoMatchConstraint`. To
  /// add multiple countries, include multiple `GeoMatchSetUpdate` objects in
  /// your request.
  Future<UpdateGeoMatchSetResponse> updateGeoMatchSet(
      {@required String geoMatchSetId,
      @required String changeToken,
      @required List<GeoMatchSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateGeoMatchSet', {
      'GeoMatchSetId': geoMatchSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateGeoMatchSetResponse.fromJson(response_);
  }

  /// Inserts or deletes IPSetDescriptor objects in an `IPSet`. For each
  /// `IPSetDescriptor` object, you specify the following values:
  ///
  /// *   Whether to insert or delete the object from the array. If you want to
  /// change an `IPSetDescriptor` object, you delete the existing object and add
  /// a new one.
  ///
  /// *   The IP address version, `IPv4` or `IPv6`.
  ///
  /// *   The IP address in CIDR notation, for example, `192.0.2.0/24` (for the
  /// range of IP addresses from `192.0.2.0` to `192.0.2.255`) or
  /// `192.0.2.44/32` (for the individual IP address `192.0.2.44`).
  ///
  ///
  /// AWS WAF supports IPv4 address ranges: /8 and any range between /16 through
  /// /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and
  /// /128. For more information about CIDR notation, see the Wikipedia entry
  /// [Classless Inter-Domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  ///
  /// IPv6 addresses can be represented using any of the following formats:
  ///
  /// *   1111:0000:0000:0000:0000:0000:0000:0111/128
  ///
  /// *   1111:0:0:0:0:0:0:0111/128
  ///
  /// *   1111::0111/128
  ///
  /// *   1111::111/128
  ///
  ///
  /// You use an `IPSet` to specify which web requests you want to allow or
  /// block based on the IP addresses that the requests originated from. For
  /// example, if you're receiving a lot of requests from one or a small number
  /// of IP addresses and you want to block the requests, you can create an
  /// `IPSet` that specifies those IP addresses, and then configure AWS WAF to
  /// block the requests.
  ///
  /// To create and configure an `IPSet`, perform the following steps:
  ///
  /// 1.  Submit a CreateIPSet request.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateIPSet request.
  ///
  /// 3.  Submit an `UpdateIPSet` request to specify the IP addresses that you
  /// want AWS WAF to watch for.
  ///
  ///
  /// When you update an `IPSet`, you specify the IP addresses that you want to
  /// add and/or the IP addresses that you want to delete. If you want to change
  /// an IP address, you delete the existing IP address and add the new one.
  ///
  /// You can insert a maximum of 1000 addresses in a single request.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [ipSetId]: The `IPSetId` of the IPSet that you want to update. `IPSetId`
  /// is returned by CreateIPSet and by ListIPSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `IPSetUpdate` objects that you want to insert into
  /// or delete from an IPSet. For more information, see the applicable data
  /// types:
  ///
  /// *    IPSetUpdate: Contains `Action` and `IPSetDescriptor`
  ///
  /// *    IPSetDescriptor: Contains `Type` and `Value`
  ///
  ///
  /// You can insert a maximum of 1000 addresses in a single request.
  Future<UpdateIPSetResponse> updateIPSet(
      {@required String ipSetId,
      @required String changeToken,
      @required List<IPSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateIPSet', {
      'IPSetId': ipSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateIPSetResponse.fromJson(response_);
  }

  /// Inserts or deletes Predicate objects in a rule and updates the `RateLimit`
  /// in the rule.
  ///
  /// Each `Predicate` object identifies a predicate, such as a ByteMatchSet or
  /// an IPSet, that specifies the web requests that you want to block or count.
  /// The `RateLimit` specifies the number of requests every five minutes that
  /// triggers the rule.
  ///
  /// If you add more than one predicate to a `RateBasedRule`, a request must
  /// match all the predicates and exceed the `RateLimit` to be counted or
  /// blocked. For example, suppose you add the following to a `RateBasedRule`:
  ///
  /// *   An `IPSet` that matches the IP address `192.0.2.44/32`
  ///
  /// *   A `ByteMatchSet` that matches `BadBot` in the `User-Agent` header
  ///
  ///
  /// Further, you specify a `RateLimit` of 15,000.
  ///
  /// You then add the `RateBasedRule` to a `WebACL` and specify that you want
  /// to block requests that satisfy the rule. For a request to be blocked, it
  /// must come from the IP address 192.0.2.44 _and_ the `User-Agent` header in
  /// the request must contain the value `BadBot`. Further, requests that match
  /// these two conditions much be received at a rate of more than 15,000 every
  /// five minutes. If the rate drops below this limit, AWS WAF no longer blocks
  /// the requests.
  ///
  /// As a second example, suppose you want to limit requests to a particular
  /// page on your site. To do this, you could add the following to a
  /// `RateBasedRule`:
  ///
  /// *   A `ByteMatchSet` with `FieldToMatch` of `URI`
  ///
  /// *   A `PositionalConstraint` of `STARTS_WITH`
  ///
  /// *   A `TargetString` of `login`
  ///
  ///
  /// Further, you specify a `RateLimit` of 15,000.
  ///
  /// By adding this `RateBasedRule` to a `WebACL`, you could limit requests to
  /// your login page without affecting the rest of your site.
  ///
  /// [ruleId]: The `RuleId` of the `RateBasedRule` that you want to update.
  /// `RuleId` is returned by `CreateRateBasedRule` and by ListRateBasedRules.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `RuleUpdate` objects that you want to insert into
  /// or delete from a RateBasedRule.
  ///
  /// [rateLimit]: The maximum number of requests, which have an identical value
  /// in the field specified by the `RateKey`, allowed in a five-minute period.
  /// If the number of requests exceeds the `RateLimit` and the other predicates
  /// specified in the rule are also met, AWS WAF triggers the action that is
  /// specified for this rule.
  Future<UpdateRateBasedRuleResponse> updateRateBasedRule(
      {@required String ruleId,
      @required String changeToken,
      @required List<RuleUpdate> updates,
      @required BigInt rateLimit}) async {
    var response_ = await _client.send('UpdateRateBasedRule', {
      'RuleId': ruleId,
      'ChangeToken': changeToken,
      'Updates': updates,
      'RateLimit': rateLimit,
    });
    return UpdateRateBasedRuleResponse.fromJson(response_);
  }

  /// Inserts or deletes RegexMatchTuple objects (filters) in a RegexMatchSet.
  /// For each `RegexMatchSetUpdate` object, you specify the following values:
  ///
  /// *   Whether to insert or delete the object from the array. If you want to
  /// change a `RegexMatchSetUpdate` object, you delete the existing object and
  /// add a new one.
  ///
  /// *   The part of a web request that you want AWS WAF to inspectupdate, such
  /// as a query string or the value of the `User-Agent` header.
  ///
  /// *   The identifier of the pattern (a regular expression) that you want AWS
  /// WAF to look for. For more information, see RegexPatternSet.
  ///
  /// *   Whether to perform any conversions on the request, such as converting
  /// it to lowercase, before inspecting it for the specified string.
  ///
  ///
  ///  For example, you can create a `RegexPatternSet` that matches any requests
  /// with `User-Agent` headers that contain the string `B[a@]dB[o0]t`. You can
  /// then configure AWS WAF to reject those requests.
  ///
  /// To create and configure a `RegexMatchSet`, perform the following steps:
  ///
  /// 1.  Create a `RegexMatchSet.` For more information, see
  /// CreateRegexMatchSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateRegexMatchSet` request.
  ///
  /// 3.  Submit an `UpdateRegexMatchSet` request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the identifier of the `RegexPatternSet` that contain the regular
  /// expression patters you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [regexMatchSetId]: The `RegexMatchSetId` of the RegexMatchSet that you
  /// want to update. `RegexMatchSetId` is returned by CreateRegexMatchSet and
  /// by ListRegexMatchSets.
  ///
  /// [updates]: An array of `RegexMatchSetUpdate` objects that you want to
  /// insert into or delete from a RegexMatchSet. For more information, see
  /// RegexMatchTuple.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<UpdateRegexMatchSetResponse> updateRegexMatchSet(
      {@required String regexMatchSetId,
      @required List<RegexMatchSetUpdate> updates,
      @required String changeToken}) async {
    var response_ = await _client.send('UpdateRegexMatchSet', {
      'RegexMatchSetId': regexMatchSetId,
      'Updates': updates,
      'ChangeToken': changeToken,
    });
    return UpdateRegexMatchSetResponse.fromJson(response_);
  }

  /// Inserts or deletes `RegexPatternString` objects in a RegexPatternSet. For
  /// each `RegexPatternString` object, you specify the following values:
  ///
  /// *   Whether to insert or delete the `RegexPatternString`.
  ///
  /// *   The regular expression pattern that you want to insert or delete. For
  /// more information, see RegexPatternSet.
  ///
  ///
  ///  For example, you can create a `RegexPatternString` such as
  /// `B[a@]dB[o0]t`. AWS WAF will match this `RegexPatternString` to:
  ///
  /// *   BadBot
  ///
  /// *   BadB0t
  ///
  /// *   B@dBot
  ///
  /// *   B@dB0t
  ///
  ///
  /// To create and configure a `RegexPatternSet`, perform the following steps:
  ///
  /// 1.  Create a `RegexPatternSet.` For more information, see
  /// CreateRegexPatternSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateRegexPatternSet` request.
  ///
  /// 3.  Submit an `UpdateRegexPatternSet` request to specify the regular
  /// expression pattern that you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [regexPatternSetId]: The `RegexPatternSetId` of the RegexPatternSet that
  /// you want to update. `RegexPatternSetId` is returned by
  /// CreateRegexPatternSet and by ListRegexPatternSets.
  ///
  /// [updates]: An array of `RegexPatternSetUpdate` objects that you want to
  /// insert into or delete from a RegexPatternSet.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<UpdateRegexPatternSetResponse> updateRegexPatternSet(
      {@required String regexPatternSetId,
      @required List<RegexPatternSetUpdate> updates,
      @required String changeToken}) async {
    var response_ = await _client.send('UpdateRegexPatternSet', {
      'RegexPatternSetId': regexPatternSetId,
      'Updates': updates,
      'ChangeToken': changeToken,
    });
    return UpdateRegexPatternSetResponse.fromJson(response_);
  }

  /// Inserts or deletes Predicate objects in a `Rule`. Each `Predicate` object
  /// identifies a predicate, such as a ByteMatchSet or an IPSet, that specifies
  /// the web requests that you want to allow, block, or count. If you add more
  /// than one predicate to a `Rule`, a request must match all of the
  /// specifications to be allowed, blocked, or counted. For example, suppose
  /// that you add the following to a `Rule`:
  ///
  /// *   A `ByteMatchSet` that matches the value `BadBot` in the `User-Agent`
  /// header
  ///
  /// *   An `IPSet` that matches the IP address `192.0.2.44`
  ///
  ///
  /// You then add the `Rule` to a `WebACL` and specify that you want to block
  /// requests that satisfy the `Rule`. For a request to be blocked, the
  /// `User-Agent` header in the request must contain the value `BadBot` _and_
  /// the request must originate from the IP address 192.0.2.44.
  ///
  /// To create and configure a `Rule`, perform the following steps:
  ///
  /// 1.  Create and update the predicates that you want to include in the
  /// `Rule`.
  ///
  /// 2.  Create the `Rule`. See CreateRule.
  ///
  /// 3.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateRule request.
  ///
  /// 4.  Submit an `UpdateRule` request to add predicates to the `Rule`.
  ///
  /// 5.  Create and update a `WebACL` that contains the `Rule`. See
  /// CreateWebACL.
  ///
  ///
  /// If you want to replace one `ByteMatchSet` or `IPSet` with another, you
  /// delete the existing one and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [ruleId]: The `RuleId` of the `Rule` that you want to update. `RuleId` is
  /// returned by `CreateRule` and by ListRules.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `RuleUpdate` objects that you want to insert into
  /// or delete from a Rule. For more information, see the applicable data
  /// types:
  ///
  /// *    RuleUpdate: Contains `Action` and `Predicate`
  ///
  /// *    Predicate: Contains `DataId`, `Negated`, and `Type`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  Future<UpdateRuleResponse> updateRule(
      {@required String ruleId,
      @required String changeToken,
      @required List<RuleUpdate> updates}) async {
    var response_ = await _client.send('UpdateRule', {
      'RuleId': ruleId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateRuleResponse.fromJson(response_);
  }

  /// Inserts or deletes ActivatedRule objects in a `RuleGroup`.
  ///
  /// You can only insert `REGULAR` rules into a rule group.
  ///
  /// You can have a maximum of ten rules per rule group.
  ///
  /// To create and configure a `RuleGroup`, perform the following steps:
  ///
  /// 1.  Create and update the `Rules` that you want to include in the
  /// `RuleGroup`. See CreateRule.
  ///
  /// 2.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateRuleGroup request.
  ///
  /// 3.  Submit an `UpdateRuleGroup` request to add `Rules` to the `RuleGroup`.
  ///
  /// 4.  Create and update a `WebACL` that contains the `RuleGroup`. See
  /// CreateWebACL.
  ///
  ///
  /// If you want to replace one `Rule` with another, you delete the existing
  /// one and add the new one.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [ruleGroupId]: The `RuleGroupId` of the RuleGroup that you want to update.
  /// `RuleGroupId` is returned by CreateRuleGroup and by ListRuleGroups.
  ///
  /// [updates]: An array of `RuleGroupUpdate` objects that you want to insert
  /// into or delete from a RuleGroup.
  ///
  /// You can only insert `REGULAR` rules into a rule group.
  ///
  ///  `ActivatedRule|OverrideAction` applies only when updating or adding a
  /// `RuleGroup` to a `WebACL`. In this case you do not use
  /// `ActivatedRule|Action`. For all other update requests,
  /// `ActivatedRule|Action` is used instead of `ActivatedRule|OverrideAction`.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  Future<UpdateRuleGroupResponse> updateRuleGroup(
      {@required String ruleGroupId,
      @required List<RuleGroupUpdate> updates,
      @required String changeToken}) async {
    var response_ = await _client.send('UpdateRuleGroup', {
      'RuleGroupId': ruleGroupId,
      'Updates': updates,
      'ChangeToken': changeToken,
    });
    return UpdateRuleGroupResponse.fromJson(response_);
  }

  /// Inserts or deletes SizeConstraint objects (filters) in a
  /// SizeConstraintSet. For each `SizeConstraint` object, you specify the
  /// following values:
  ///
  /// *   Whether to insert or delete the object from the array. If you want to
  /// change a `SizeConstraintSetUpdate` object, you delete the existing object
  /// and add a new one.
  ///
  /// *   The part of a web request that you want AWS WAF to evaluate, such as
  /// the length of a query string or the length of the `User-Agent` header.
  ///
  /// *   Whether to perform any transformations on the request, such as
  /// converting it to lowercase, before checking its length. Note that
  /// transformations of the request body are not supported because the AWS
  /// resource forwards only the first `8192` bytes of your request to AWS WAF.
  ///
  ///     You can only specify a single type of TextTransformation.
  ///
  /// *   A `ComparisonOperator` used for evaluating the selected part of the
  /// request against the specified `Size`, such as equals, greater than, less
  /// than, and so on.
  ///
  /// *   The length, in bytes, that you want AWS WAF to watch for in selected
  /// part of the request. The length is computed after applying the
  /// transformation.
  ///
  ///
  /// For example, you can add a `SizeConstraintSetUpdate` object that matches
  /// web requests in which the length of the `User-Agent` header is greater
  /// than 100 bytes. You can then configure AWS WAF to block those requests.
  ///
  /// To create and configure a `SizeConstraintSet`, perform the following
  /// steps:
  ///
  /// 1.  Create a `SizeConstraintSet.` For more information, see
  /// CreateSizeConstraintSet.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an `UpdateSizeConstraintSet` request.
  ///
  /// 3.  Submit an `UpdateSizeConstraintSet` request to specify the part of the
  /// request that you want AWS WAF to inspect (for example, the header or the
  /// URI) and the value that you want AWS WAF to watch for.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [sizeConstraintSetId]: The `SizeConstraintSetId` of the SizeConstraintSet
  /// that you want to update. `SizeConstraintSetId` is returned by
  /// CreateSizeConstraintSet and by ListSizeConstraintSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `SizeConstraintSetUpdate` objects that you want to
  /// insert into or delete from a SizeConstraintSet. For more information, see
  /// the applicable data types:
  ///
  /// *    SizeConstraintSetUpdate: Contains `Action` and `SizeConstraint`
  ///
  /// *    SizeConstraint: Contains `FieldToMatch`, `TextTransformation`,
  /// `ComparisonOperator`, and `Size`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  Future<UpdateSizeConstraintSetResponse> updateSizeConstraintSet(
      {@required String sizeConstraintSetId,
      @required String changeToken,
      @required List<SizeConstraintSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateSizeConstraintSet', {
      'SizeConstraintSetId': sizeConstraintSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateSizeConstraintSetResponse.fromJson(response_);
  }

  /// Inserts or deletes SqlInjectionMatchTuple objects (filters) in a
  /// SqlInjectionMatchSet. For each `SqlInjectionMatchTuple` object, you
  /// specify the following values:
  ///
  /// *    `Action`: Whether to insert the object into or delete the object from
  /// the array. To change a `SqlInjectionMatchTuple`, you delete the existing
  /// object and add a new one.
  ///
  /// *    `FieldToMatch`: The part of web requests that you want AWS WAF to
  /// inspect and, if you want AWS WAF to inspect a header or custom query
  /// parameter, the name of the header or parameter.
  ///
  /// *    `TextTransformation`: Which text transformation, if any, to perform
  /// on the web request before inspecting the request for snippets of malicious
  /// SQL code.
  ///
  ///     You can only specify a single type of TextTransformation.
  ///
  ///
  /// You use `SqlInjectionMatchSet` objects to specify which CloudFront
  /// requests that you want to allow, block, or count. For example, if you're
  /// receiving requests that contain snippets of SQL code in the query string
  /// and you want to block the requests, you can create a
  /// `SqlInjectionMatchSet` with the applicable settings, and then configure
  /// AWS WAF to block the requests.
  ///
  /// To create and configure a `SqlInjectionMatchSet`, perform the following
  /// steps:
  ///
  /// 1.  Submit a CreateSqlInjectionMatchSet request.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateIPSet request.
  ///
  /// 3.  Submit an `UpdateSqlInjectionMatchSet` request to specify the parts of
  /// web requests that you want AWS WAF to inspect for snippets of SQL code.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [sqlInjectionMatchSetId]: The `SqlInjectionMatchSetId` of the
  /// `SqlInjectionMatchSet` that you want to update. `SqlInjectionMatchSetId`
  /// is returned by CreateSqlInjectionMatchSet and by
  /// ListSqlInjectionMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `SqlInjectionMatchSetUpdate` objects that you want
  /// to insert into or delete from a SqlInjectionMatchSet. For more
  /// information, see the applicable data types:
  ///
  /// *    SqlInjectionMatchSetUpdate: Contains `Action` and
  /// `SqlInjectionMatchTuple`
  ///
  /// *    SqlInjectionMatchTuple: Contains `FieldToMatch` and
  /// `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  Future<UpdateSqlInjectionMatchSetResponse> updateSqlInjectionMatchSet(
      {@required String sqlInjectionMatchSetId,
      @required String changeToken,
      @required List<SqlInjectionMatchSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateSqlInjectionMatchSet', {
      'SqlInjectionMatchSetId': sqlInjectionMatchSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateSqlInjectionMatchSetResponse.fromJson(response_);
  }

  /// Inserts or deletes ActivatedRule objects in a `WebACL`. Each `Rule`
  /// identifies web requests that you want to allow, block, or count. When you
  /// update a `WebACL`, you specify the following values:
  ///
  /// *   A default action for the `WebACL`, either `ALLOW` or `BLOCK`. AWS WAF
  /// performs the default action if a request doesn't match the criteria in any
  /// of the `Rules` in a `WebACL`.
  ///
  /// *   The `Rules` that you want to add or delete. If you want to replace one
  /// `Rule` with another, you delete the existing `Rule` and add the new one.
  ///
  /// *   For each `Rule`, whether you want AWS WAF to allow requests, block
  /// requests, or count requests that match the conditions in the `Rule`.
  ///
  /// *   The order in which you want AWS WAF to evaluate the `Rules` in a
  /// `WebACL`. If you add more than one `Rule` to a `WebACL`, AWS WAF evaluates
  /// each request against the `Rules` in order based on the value of
  /// `Priority`. (The `Rule` that has the lowest value for `Priority` is
  /// evaluated first.) When a web request matches all the predicates (such as
  /// `ByteMatchSets` and `IPSets`) in a `Rule`, AWS WAF immediately takes the
  /// corresponding action, allow or block, and doesn't evaluate the request
  /// against the remaining `Rules` in the `WebACL`, if any.
  ///
  ///
  /// To create and configure a `WebACL`, perform the following steps:
  ///
  /// 1.  Create and update the predicates that you want to include in `Rules`.
  /// For more information, see CreateByteMatchSet, UpdateByteMatchSet,
  /// CreateIPSet, UpdateIPSet, CreateSqlInjectionMatchSet, and
  /// UpdateSqlInjectionMatchSet.
  ///
  /// 2.  Create and update the `Rules` that you want to include in the
  /// `WebACL`. For more information, see CreateRule and UpdateRule.
  ///
  /// 3.  Create a `WebACL`. See CreateWebACL.
  ///
  /// 4.  Use `GetChangeToken` to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateWebACL request.
  ///
  /// 5.  Submit an `UpdateWebACL` request to specify the `Rules` that you want
  /// to include in the `WebACL`, to specify the default action, and to
  /// associate the `WebACL` with a CloudFront distribution.
  ///
  ///     The `ActivatedRule` can be a rule group. If you specify a rule group
  /// as your `ActivatedRule`, you can exclude specific rules from that rule
  /// group.
  ///
  ///     If you already have a rule group associated with a web ACL and want to
  /// submit an `UpdateWebACL` request to exclude certain rules from that rule
  /// group, you must first remove the rule group from the web ACL, the
  /// re-insert it again, specifying the excluded rules. For details, see
  /// ActivatedRule$ExcludedRules.
  ///
  ///
  /// Be aware that if you try to add a RATE_BASED rule to a web ACL without
  /// setting the rule type when first creating the rule, the UpdateWebACL
  /// request will fail because the request tries to add a REGULAR rule (the
  /// default rule type) with the specified ID, which does not exist.
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [webAclId]: The `WebACLId` of the WebACL that you want to update.
  /// `WebACLId` is returned by CreateWebACL and by ListWebACLs.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of updates to make to the WebACL.
  ///
  /// An array of `WebACLUpdate` objects that you want to insert into or delete
  /// from a WebACL. For more information, see the applicable data types:
  ///
  /// *    WebACLUpdate: Contains `Action` and `ActivatedRule`
  ///
  /// *    ActivatedRule: Contains `Action`, `OverrideAction`, `Priority`,
  /// `RuleId`, and `Type`. `ActivatedRule|OverrideAction` applies only when
  /// updating or adding a `RuleGroup` to a `WebACL`. In this case, you do not
  /// use `ActivatedRule|Action`. For all other update requests,
  /// `ActivatedRule|Action` is used instead of `ActivatedRule|OverrideAction`.
  ///
  /// *    WafAction: Contains `Type`
  ///
  /// [defaultAction]: A default action for the web ACL, either ALLOW or BLOCK.
  /// AWS WAF performs the default action if a request doesn't match the
  /// criteria in any of the rules in a web ACL.
  Future<UpdateWebAclResponse> updateWebAcl(
      {@required String webAclId,
      @required String changeToken,
      List<WebAclUpdate> updates,
      WafAction defaultAction}) async {
    var response_ = await _client.send('UpdateWebACL', {
      'WebACLId': webAclId,
      'ChangeToken': changeToken,
      if (updates != null) 'Updates': updates,
      if (defaultAction != null) 'DefaultAction': defaultAction,
    });
    return UpdateWebAclResponse.fromJson(response_);
  }

  /// Inserts or deletes XssMatchTuple objects (filters) in an XssMatchSet. For
  /// each `XssMatchTuple` object, you specify the following values:
  ///
  /// *    `Action`: Whether to insert the object into or delete the object from
  /// the array. To change an `XssMatchTuple`, you delete the existing object
  /// and add a new one.
  ///
  /// *    `FieldToMatch`: The part of web requests that you want AWS WAF to
  /// inspect and, if you want AWS WAF to inspect a header or custom query
  /// parameter, the name of the header or parameter.
  ///
  /// *    `TextTransformation`: Which text transformation, if any, to perform
  /// on the web request before inspecting the request for cross-site scripting
  /// attacks.
  ///
  ///     You can only specify a single type of TextTransformation.
  ///
  ///
  /// You use `XssMatchSet` objects to specify which CloudFront requests that
  /// you want to allow, block, or count. For example, if you're receiving
  /// requests that contain cross-site scripting attacks in the request body and
  /// you want to block the requests, you can create an `XssMatchSet` with the
  /// applicable settings, and then configure AWS WAF to block the requests.
  ///
  /// To create and configure an `XssMatchSet`, perform the following steps:
  ///
  /// 1.  Submit a CreateXssMatchSet request.
  ///
  /// 2.  Use GetChangeToken to get the change token that you provide in the
  /// `ChangeToken` parameter of an UpdateIPSet request.
  ///
  /// 3.  Submit an `UpdateXssMatchSet` request to specify the parts of web
  /// requests that you want AWS WAF to inspect for cross-site scripting
  /// attacks.
  ///
  ///
  /// For more information about how to use the AWS WAF API to allow or block
  /// HTTP requests, see the
  /// [AWS WAF Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  ///
  /// [xssMatchSetId]: The `XssMatchSetId` of the `XssMatchSet` that you want to
  /// update. `XssMatchSetId` is returned by CreateXssMatchSet and by
  /// ListXssMatchSets.
  ///
  /// [changeToken]: The value returned by the most recent call to
  /// GetChangeToken.
  ///
  /// [updates]: An array of `XssMatchSetUpdate` objects that you want to insert
  /// into or delete from an XssMatchSet. For more information, see the
  /// applicable data types:
  ///
  /// *    XssMatchSetUpdate: Contains `Action` and `XssMatchTuple`
  ///
  /// *    XssMatchTuple: Contains `FieldToMatch` and `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  Future<UpdateXssMatchSetResponse> updateXssMatchSet(
      {@required String xssMatchSetId,
      @required String changeToken,
      @required List<XssMatchSetUpdate> updates}) async {
    var response_ = await _client.send('UpdateXssMatchSet', {
      'XssMatchSetId': xssMatchSetId,
      'ChangeToken': changeToken,
      'Updates': updates,
    });
    return UpdateXssMatchSetResponse.fromJson(response_);
  }
}

/// The `ActivatedRule` object in an UpdateWebACL request specifies a `Rule`
/// that you want to insert or delete, the priority of the `Rule` in the
/// `WebACL`, and the action that you want AWS WAF to take when a web request
/// matches the `Rule` (`ALLOW`, `BLOCK`, or `COUNT`).
///
/// To specify whether to insert or delete a `Rule`, use the `Action` parameter
/// in the WebACLUpdate data type.
class ActivatedRule {
  /// Specifies the order in which the `Rules` in a `WebACL` are evaluated.
  /// Rules with a lower value for `Priority` are evaluated before `Rules` with
  /// a higher value. The value must be a unique integer. If you add multiple
  /// `Rules` to a `WebACL`, the values don't need to be consecutive.
  final int priority;

  /// The `RuleId` for a `Rule`. You use `RuleId` to get more information about
  /// a `Rule` (see GetRule), update a `Rule` (see UpdateRule), insert a `Rule`
  /// into a `WebACL` or delete a one from a `WebACL` (see UpdateWebACL), or
  /// delete a `Rule` from AWS WAF (see DeleteRule).
  ///
  ///  `RuleId` is returned by CreateRule and by ListRules.
  final String ruleId;

  /// Specifies the action that CloudFront or AWS WAF takes when a web request
  /// matches the conditions in the `Rule`. Valid values for `Action` include
  /// the following:
  ///
  /// *    `ALLOW`: CloudFront responds with the requested object.
  ///
  /// *    `BLOCK`: CloudFront responds with an HTTP 403 (Forbidden) status
  /// code.
  ///
  /// *    `COUNT`: AWS WAF increments a counter of requests that match the
  /// conditions in the rule and then continues to inspect the web request based
  /// on the remaining rules in the web ACL.
  ///
  ///
  ///  `ActivatedRule|OverrideAction` applies only when updating or adding a
  /// `RuleGroup` to a `WebACL`. In this case, you do not use
  /// `ActivatedRule|Action`. For all other update requests,
  /// `ActivatedRule|Action` is used instead of `ActivatedRule|OverrideAction`.
  final WafAction action;

  /// Use the `OverrideAction` to test your `RuleGroup`.
  ///
  /// Any rule in a `RuleGroup` can potentially block a request. If you set the
  /// `OverrideAction` to `None`, the `RuleGroup` will block a request if any
  /// individual rule in the `RuleGroup` matches the request and is configured
  /// to block that request. However if you first want to test the `RuleGroup`,
  /// set the `OverrideAction` to `Count`. The `RuleGroup` will then override
  /// any block action specified by individual rules contained within the group.
  /// Instead of blocking matching requests, those requests will be counted. You
  /// can view a record of counted requests using GetSampledRequests.
  ///
  ///  `ActivatedRule|OverrideAction` applies only when updating or adding a
  /// `RuleGroup` to a `WebACL`. In this case you do not use
  /// `ActivatedRule|Action`. For all other update requests,
  /// `ActivatedRule|Action` is used instead of `ActivatedRule|OverrideAction`.
  final WafOverrideAction overrideAction;

  /// The rule type, either `REGULAR`, as defined by Rule, `RATE_BASED`, as
  /// defined by RateBasedRule, or `GROUP`, as defined by RuleGroup. The default
  /// is REGULAR. Although this field is optional, be aware that if you try to
  /// add a RATE_BASED rule to a web ACL without setting the type, the
  /// UpdateWebACL request will fail because the request tries to add a REGULAR
  /// rule with the specified ID, which does not exist.
  final String type;

  /// An array of rules to exclude from a rule group. This is applicable only
  /// when the `ActivatedRule` refers to a `RuleGroup`.
  ///
  /// Sometimes it is necessary to troubleshoot rule groups that are blocking
  /// traffic unexpectedly (false positives). One troubleshooting technique is
  /// to identify the specific rule within the rule group that is blocking the
  /// legitimate traffic and then disable (exclude) that particular rule. You
  /// can exclude rules from both your own rule groups and AWS Marketplace rule
  /// groups that have been associated with a web ACL.
  ///
  /// Specifying `ExcludedRules` does not remove those rules from the rule
  /// group. Rather, it changes the action for the rules to `COUNT`. Therefore,
  /// requests that match an `ExcludedRule` are counted but not blocked. The
  /// `RuleGroup` owner will receive COUNT metrics for each `ExcludedRule`.
  ///
  /// If you want to exclude rules from a rule group that is already associated
  /// with a web ACL, perform the following steps:
  ///
  /// 1.  Use the AWS WAF logs to identify the IDs of the rules that you want to
  /// exclude. For more information about the logs, see
  /// [Logging Web ACL Traffic Information](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html).
  ///
  /// 2.  Submit an UpdateWebACL request that has two actions:
  ///
  ///     *   The first action deletes the existing rule group from the web ACL.
  /// That is, in the UpdateWebACL request, the first `Updates:Action` should be
  /// `DELETE` and `Updates:ActivatedRule:RuleId` should be the rule group that
  /// contains the rules that you want to exclude.
  ///
  ///     *   The second action inserts the same rule group back in, but
  /// specifying the rules to exclude. That is, the second `Updates:Action`
  /// should be `INSERT`, `Updates:ActivatedRule:RuleId` should be the rule
  /// group that you just removed, and `ExcludedRules` should contain the rules
  /// that you want to exclude.
  final List<ExcludedRule> excludedRules;

  ActivatedRule({
    @required this.priority,
    @required this.ruleId,
    this.action,
    this.overrideAction,
    this.type,
    this.excludedRules,
  });
  static ActivatedRule fromJson(Map<String, dynamic> json) => ActivatedRule(
        priority: json['Priority'] as int,
        ruleId: json['RuleId'] as String,
        action: json.containsKey('Action')
            ? WafAction.fromJson(json['Action'])
            : null,
        overrideAction: json.containsKey('OverrideAction')
            ? WafOverrideAction.fromJson(json['OverrideAction'])
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        excludedRules: json.containsKey('ExcludedRules')
            ? (json['ExcludedRules'] as List)
                .map((e) => ExcludedRule.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// In a GetByteMatchSet request, `ByteMatchSet` is a complex type that contains
/// the `ByteMatchSetId` and `Name` of a `ByteMatchSet`, and the values that you
/// specified when you updated the `ByteMatchSet`.
///
/// A complex type that contains `ByteMatchTuple` objects, which specify the
/// parts of web requests that you want AWS WAF to inspect and the values that
/// you want AWS WAF to search for. If a `ByteMatchSet` contains more than one
/// `ByteMatchTuple` object, a request needs to match the settings in only one
/// `ByteMatchTuple` to be considered a match.
class ByteMatchSet {
  /// The `ByteMatchSetId` for a `ByteMatchSet`. You use `ByteMatchSetId` to get
  /// information about a `ByteMatchSet` (see GetByteMatchSet), update a
  /// `ByteMatchSet` (see UpdateByteMatchSet), insert a `ByteMatchSet` into a
  /// `Rule` or delete one from a `Rule` (see UpdateRule), and delete a
  /// `ByteMatchSet` from AWS WAF (see DeleteByteMatchSet).
  ///
  ///  `ByteMatchSetId` is returned by CreateByteMatchSet and by
  /// ListByteMatchSets.
  final String byteMatchSetId;

  /// A friendly name or description of the ByteMatchSet. You can't change
  /// `Name` after you create a `ByteMatchSet`.
  final String name;

  /// Specifies the bytes (typically a string that corresponds with ASCII
  /// characters) that you want AWS WAF to search for in web requests, the
  /// location in requests that you want AWS WAF to search, and other settings.
  final List<ByteMatchTuple> byteMatchTuples;

  ByteMatchSet({
    @required this.byteMatchSetId,
    this.name,
    @required this.byteMatchTuples,
  });
  static ByteMatchSet fromJson(Map<String, dynamic> json) => ByteMatchSet(
        byteMatchSetId: json['ByteMatchSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        byteMatchTuples: (json['ByteMatchTuples'] as List)
            .map((e) => ByteMatchTuple.fromJson(e))
            .toList(),
      );
}

/// Returned by ListByteMatchSets. Each `ByteMatchSetSummary` object includes
/// the `Name` and `ByteMatchSetId` for one ByteMatchSet.
class ByteMatchSetSummary {
  /// The `ByteMatchSetId` for a `ByteMatchSet`. You use `ByteMatchSetId` to get
  /// information about a `ByteMatchSet`, update a `ByteMatchSet`, remove a
  /// `ByteMatchSet` from a `Rule`, and delete a `ByteMatchSet` from AWS WAF.
  ///
  ///  `ByteMatchSetId` is returned by CreateByteMatchSet and by
  /// ListByteMatchSets.
  final String byteMatchSetId;

  /// A friendly name or description of the ByteMatchSet. You can't change
  /// `Name` after you create a `ByteMatchSet`.
  final String name;

  ByteMatchSetSummary({
    @required this.byteMatchSetId,
    @required this.name,
  });
  static ByteMatchSetSummary fromJson(Map<String, dynamic> json) =>
      ByteMatchSetSummary(
        byteMatchSetId: json['ByteMatchSetId'] as String,
        name: json['Name'] as String,
      );
}

/// In an UpdateByteMatchSet request, `ByteMatchSetUpdate` specifies whether to
/// insert or delete a ByteMatchTuple and includes the settings for the
/// `ByteMatchTuple`.
class ByteMatchSetUpdate {
  /// Specifies whether to insert or delete a ByteMatchTuple.
  final String action;

  /// Information about the part of a web request that you want AWS WAF to
  /// inspect and the value that you want AWS WAF to search for. If you specify
  /// `DELETE` for the value of `Action`, the `ByteMatchTuple` values must
  /// exactly match the values in the `ByteMatchTuple` that you want to delete
  /// from the `ByteMatchSet`.
  final ByteMatchTuple byteMatchTuple;

  ByteMatchSetUpdate({
    @required this.action,
    @required this.byteMatchTuple,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The bytes (typically a string that corresponds with ASCII characters) that
/// you want AWS WAF to search for in web requests, the location in requests
/// that you want AWS WAF to search, and other settings.
class ByteMatchTuple {
  /// The part of a web request that you want AWS WAF to search, such as a
  /// specified header or a query string. For more information, see
  /// FieldToMatch.
  final FieldToMatch fieldToMatch;

  /// The value that you want AWS WAF to search for. AWS WAF searches for the
  /// specified string in the part of web requests that you specified in
  /// `FieldToMatch`. The maximum length of the value is 50 bytes.
  ///
  /// Valid values depend on the values that you specified for `FieldToMatch`:
  ///
  /// *    `HEADER`: The value that you want AWS WAF to search for in the
  /// request header that you specified in FieldToMatch, for example, the value
  /// of the `User-Agent` or `Referer` header.
  ///
  /// *    `METHOD`: The HTTP method, which indicates the type of operation
  /// specified in the request. CloudFront supports the following methods:
  /// `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`, `POST`, and `PUT`.
  ///
  /// *    `QUERY_STRING`: The value that you want AWS WAF to search for in the
  /// query string, which is the part of a URL that appears after a `?`
  /// character.
  ///
  /// *    `URI`: The value that you want AWS WAF to search for in the part of a
  /// URL that identifies a resource, for example, `/images/daily-ad.jpg`.
  ///
  /// *    `BODY`: The part of a request that contains any additional data that
  /// you want to send to your web server as the HTTP request body, such as data
  /// from a form. The request body immediately follows the request headers.
  /// Note that only the first `8192` bytes of the request body are forwarded to
  /// AWS WAF for inspection. To allow or block requests based on the length of
  /// the body, you can create a size constraint set. For more information, see
  /// CreateSizeConstraintSet.
  ///
  /// *    `SINGLE_QUERY_ARG`: The parameter in the query string that you will
  /// inspect, such as _UserName_ or _SalesRegion_. The maximum length for
  /// `SINGLE_QUERY_ARG` is 30 characters.
  ///
  /// *    `ALL_QUERY_ARGS`: Similar to `SINGLE_QUERY_ARG`, but instead of
  /// inspecting a single parameter, AWS WAF inspects all parameters within the
  /// query string for the value or regex pattern that you specify in
  /// `TargetString`.
  ///
  ///
  /// If `TargetString` includes alphabetic characters A-Z and a-z, note that
  /// the value is case sensitive.
  ///
  ///  **If you're using the AWS WAF API**
  ///
  /// Specify a base64-encoded version of the value. The maximum length of the
  /// value before you base64-encode it is 50 bytes.
  ///
  /// For example, suppose the value of `Type` is `HEADER` and the value of
  /// `Data` is `User-Agent`. If you want to search the `User-Agent` header for
  /// the value `BadBot`, you base64-encode `BadBot` using MIME base64-encoding
  /// and include the resulting value, `QmFkQm90`, in the value of
  /// `TargetString`.
  ///
  ///  **If you're using the AWS CLI or one of the AWS SDKs**
  ///
  /// The value that you want AWS WAF to search for. The SDK automatically
  /// base64 encodes the value.
  final Uint8List targetString;

  /// Text transformations eliminate some of the unusual formatting that
  /// attackers use in web requests in an effort to bypass AWS WAF. If you
  /// specify a transformation, AWS WAF performs the transformation on
  /// `TargetString` before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  ///  **CMD_LINE**
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all
  /// of the command, use this option to perform the following transformations:
  ///
  /// *   Delete the following characters:  " ' ^
  ///
  /// *   Delete spaces before the following characters: / (
  ///
  /// *   Replace the following characters with a space: , ;
  ///
  /// *   Replace multiple spaces with one space
  ///
  /// *   Convert uppercase letters (A-Z) to lowercase (a-z)
  ///
  ///
  ///  **COMPRESS_WHITE_SPACE**
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// *   f, formfeed, decimal 12
  ///
  /// *   t, tab, decimal 9
  ///
  /// *   n, newline, decimal 10
  ///
  /// *   r, carriage return, decimal 13
  ///
  /// *   v, vertical tab, decimal 11
  ///
  /// *   non-breaking space, decimal 160
  ///
  ///
  ///  `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
  ///
  ///  **HTML_ENTITY_DECODE**
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. `HTML_ENTITY_DECODE` performs the following operations:
  ///
  /// *   Replaces `(ampersand)quot;` with `"`
  ///
  /// *   Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
  ///
  /// *   Replaces `(ampersand)lt;` with a "less than" symbol
  ///
  /// *   Replaces `(ampersand)gt;` with `>`
  ///
  /// *   Replaces characters that are represented in hexadecimal format,
  /// `(ampersand)#xhhhh;`, with the corresponding characters
  ///
  /// *   Replaces characters that are represented in decimal format,
  /// `(ampersand)#nnnn;`, with the corresponding characters
  ///
  ///
  ///  **LOWERCASE**
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  ///  **URL_DECODE**
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  ///  **NONE**
  ///
  /// Specify `NONE` if you don't want to perform any text transformations.
  final String textTransformation;

  /// Within the portion of a web request that you want to search (for example,
  /// in the query string, if any), specify where you want AWS WAF to search.
  /// Valid values include the following:
  ///
  ///  **CONTAINS**
  ///
  /// The specified part of the web request must include the value of
  /// `TargetString`, but the location doesn't matter.
  ///
  ///  **CONTAINS_WORD**
  ///
  /// The specified part of the web request must include the value of
  /// `TargetString`, and `TargetString` must contain only alphanumeric
  /// characters or underscore (A-Z, a-z, 0-9, or _). In addition,
  /// `TargetString` must be a word, which means one of the following:
  ///
  /// *    `TargetString` exactly matches the value of the specified part of the
  /// web request, such as the value of a header.
  ///
  /// *    `TargetString` is at the beginning of the specified part of the web
  /// request and is followed by a character other than an alphanumeric
  /// character or underscore (_), for example, `BadBot;`.
  ///
  /// *    `TargetString` is at the end of the specified part of the web request
  /// and is preceded by a character other than an alphanumeric character or
  /// underscore (_), for example, `;BadBot`.
  ///
  /// *    `TargetString` is in the middle of the specified part of the web
  /// request and is preceded and followed by characters other than alphanumeric
  /// characters or underscore (_), for example, `-BadBot;`.
  ///
  ///
  ///  **EXACTLY**
  ///
  /// The value of the specified part of the web request must exactly match the
  /// value of `TargetString`.
  ///
  ///  **STARTS_WITH**
  ///
  /// The value of `TargetString` must appear at the beginning of the specified
  /// part of the web request.
  ///
  ///  **ENDS_WITH**
  ///
  /// The value of `TargetString` must appear at the end of the specified part
  /// of the web request.
  final String positionalConstraint;

  ByteMatchTuple({
    @required this.fieldToMatch,
    @required this.targetString,
    @required this.textTransformation,
    @required this.positionalConstraint,
  });
  static ByteMatchTuple fromJson(Map<String, dynamic> json) => ByteMatchTuple(
        fieldToMatch: FieldToMatch.fromJson(json['FieldToMatch']),
        targetString: Uint8List(json['TargetString']),
        textTransformation: json['TextTransformation'] as String,
        positionalConstraint: json['PositionalConstraint'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateByteMatchSetResponse {
  /// A ByteMatchSet that contains no `ByteMatchTuple` objects.
  final ByteMatchSet byteMatchSet;

  /// The `ChangeToken` that you used to submit the `CreateByteMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateByteMatchSetResponse({
    this.byteMatchSet,
    this.changeToken,
  });
  static CreateByteMatchSetResponse fromJson(Map<String, dynamic> json) =>
      CreateByteMatchSetResponse(
        byteMatchSet: json.containsKey('ByteMatchSet')
            ? ByteMatchSet.fromJson(json['ByteMatchSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateGeoMatchSetResponse {
  /// The GeoMatchSet returned in the `CreateGeoMatchSet` response. The
  /// `GeoMatchSet` contains no `GeoMatchConstraints`.
  final GeoMatchSet geoMatchSet;

  /// The `ChangeToken` that you used to submit the `CreateGeoMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateGeoMatchSetResponse({
    this.geoMatchSet,
    this.changeToken,
  });
  static CreateGeoMatchSetResponse fromJson(Map<String, dynamic> json) =>
      CreateGeoMatchSetResponse(
        geoMatchSet: json.containsKey('GeoMatchSet')
            ? GeoMatchSet.fromJson(json['GeoMatchSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateIPSetResponse {
  /// The IPSet returned in the `CreateIPSet` response.
  final IPSet ipSet;

  /// The `ChangeToken` that you used to submit the `CreateIPSet` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateIPSetResponse({
    this.ipSet,
    this.changeToken,
  });
  static CreateIPSetResponse fromJson(Map<String, dynamic> json) =>
      CreateIPSetResponse(
        ipSet: json.containsKey('IPSet') ? IPSet.fromJson(json['IPSet']) : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateRateBasedRuleResponse {
  /// The RateBasedRule that is returned in the `CreateRateBasedRule` response.
  final RateBasedRule rule;

  /// The `ChangeToken` that you used to submit the `CreateRateBasedRule`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateRateBasedRuleResponse({
    this.rule,
    this.changeToken,
  });
  static CreateRateBasedRuleResponse fromJson(Map<String, dynamic> json) =>
      CreateRateBasedRuleResponse(
        rule: json.containsKey('Rule')
            ? RateBasedRule.fromJson(json['Rule'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateRegexMatchSetResponse {
  /// A RegexMatchSet that contains no `RegexMatchTuple` objects.
  final RegexMatchSet regexMatchSet;

  /// The `ChangeToken` that you used to submit the `CreateRegexMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateRegexMatchSetResponse({
    this.regexMatchSet,
    this.changeToken,
  });
  static CreateRegexMatchSetResponse fromJson(Map<String, dynamic> json) =>
      CreateRegexMatchSetResponse(
        regexMatchSet: json.containsKey('RegexMatchSet')
            ? RegexMatchSet.fromJson(json['RegexMatchSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateRegexPatternSetResponse {
  /// A RegexPatternSet that contains no objects.
  final RegexPatternSet regexPatternSet;

  /// The `ChangeToken` that you used to submit the `CreateRegexPatternSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateRegexPatternSetResponse({
    this.regexPatternSet,
    this.changeToken,
  });
  static CreateRegexPatternSetResponse fromJson(Map<String, dynamic> json) =>
      CreateRegexPatternSetResponse(
        regexPatternSet: json.containsKey('RegexPatternSet')
            ? RegexPatternSet.fromJson(json['RegexPatternSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateRuleGroupResponse {
  /// An empty RuleGroup.
  final RuleGroup ruleGroup;

  /// The `ChangeToken` that you used to submit the `CreateRuleGroup` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateRuleGroupResponse({
    this.ruleGroup,
    this.changeToken,
  });
  static CreateRuleGroupResponse fromJson(Map<String, dynamic> json) =>
      CreateRuleGroupResponse(
        ruleGroup: json.containsKey('RuleGroup')
            ? RuleGroup.fromJson(json['RuleGroup'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateRuleResponse {
  /// The Rule returned in the `CreateRule` response.
  final Rule rule;

  /// The `ChangeToken` that you used to submit the `CreateRule` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateRuleResponse({
    this.rule,
    this.changeToken,
  });
  static CreateRuleResponse fromJson(Map<String, dynamic> json) =>
      CreateRuleResponse(
        rule: json.containsKey('Rule') ? Rule.fromJson(json['Rule']) : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateSizeConstraintSetResponse {
  /// A SizeConstraintSet that contains no `SizeConstraint` objects.
  final SizeConstraintSet sizeConstraintSet;

  /// The `ChangeToken` that you used to submit the `CreateSizeConstraintSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateSizeConstraintSetResponse({
    this.sizeConstraintSet,
    this.changeToken,
  });
  static CreateSizeConstraintSetResponse fromJson(Map<String, dynamic> json) =>
      CreateSizeConstraintSetResponse(
        sizeConstraintSet: json.containsKey('SizeConstraintSet')
            ? SizeConstraintSet.fromJson(json['SizeConstraintSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to a `CreateSqlInjectionMatchSet` request.
class CreateSqlInjectionMatchSetResponse {
  /// A SqlInjectionMatchSet.
  final SqlInjectionMatchSet sqlInjectionMatchSet;

  /// The `ChangeToken` that you used to submit the `CreateSqlInjectionMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  CreateSqlInjectionMatchSetResponse({
    this.sqlInjectionMatchSet,
    this.changeToken,
  });
  static CreateSqlInjectionMatchSetResponse fromJson(
          Map<String, dynamic> json) =>
      CreateSqlInjectionMatchSetResponse(
        sqlInjectionMatchSet: json.containsKey('SqlInjectionMatchSet')
            ? SqlInjectionMatchSet.fromJson(json['SqlInjectionMatchSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class CreateWebAclResponse {
  /// The WebACL returned in the `CreateWebACL` response.
  final WebAcl webAcl;

  /// The `ChangeToken` that you used to submit the `CreateWebACL` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateWebAclResponse({
    this.webAcl,
    this.changeToken,
  });
  static CreateWebAclResponse fromJson(Map<String, dynamic> json) =>
      CreateWebAclResponse(
        webAcl:
            json.containsKey('WebACL') ? WebAcl.fromJson(json['WebACL']) : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to a `CreateXssMatchSet` request.
class CreateXssMatchSetResponse {
  /// An XssMatchSet.
  final XssMatchSet xssMatchSet;

  /// The `ChangeToken` that you used to submit the `CreateXssMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  CreateXssMatchSetResponse({
    this.xssMatchSet,
    this.changeToken,
  });
  static CreateXssMatchSetResponse fromJson(Map<String, dynamic> json) =>
      CreateXssMatchSetResponse(
        xssMatchSet: json.containsKey('XssMatchSet')
            ? XssMatchSet.fromJson(json['XssMatchSet'])
            : null,
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteByteMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteByteMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteByteMatchSetResponse({
    this.changeToken,
  });
  static DeleteByteMatchSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteByteMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteGeoMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteGeoMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteGeoMatchSetResponse({
    this.changeToken,
  });
  static DeleteGeoMatchSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteGeoMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteIPSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteIPSet` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteIPSetResponse({
    this.changeToken,
  });
  static DeleteIPSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteIPSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteLoggingConfigurationResponse {
  DeleteLoggingConfigurationResponse();
  static DeleteLoggingConfigurationResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteLoggingConfigurationResponse();
}

class DeletePermissionPolicyResponse {
  DeletePermissionPolicyResponse();
  static DeletePermissionPolicyResponse fromJson(Map<String, dynamic> json) =>
      DeletePermissionPolicyResponse();
}

class DeleteRateBasedRuleResponse {
  /// The `ChangeToken` that you used to submit the `DeleteRateBasedRule`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteRateBasedRuleResponse({
    this.changeToken,
  });
  static DeleteRateBasedRuleResponse fromJson(Map<String, dynamic> json) =>
      DeleteRateBasedRuleResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteRegexMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteRegexMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteRegexMatchSetResponse({
    this.changeToken,
  });
  static DeleteRegexMatchSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteRegexMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteRegexPatternSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteRegexPatternSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteRegexPatternSetResponse({
    this.changeToken,
  });
  static DeleteRegexPatternSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteRegexPatternSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteRuleGroupResponse {
  /// The `ChangeToken` that you used to submit the `DeleteRuleGroup` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteRuleGroupResponse({
    this.changeToken,
  });
  static DeleteRuleGroupResponse fromJson(Map<String, dynamic> json) =>
      DeleteRuleGroupResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteRuleResponse {
  /// The `ChangeToken` that you used to submit the `DeleteRule` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteRuleResponse({
    this.changeToken,
  });
  static DeleteRuleResponse fromJson(Map<String, dynamic> json) =>
      DeleteRuleResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteSizeConstraintSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteSizeConstraintSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteSizeConstraintSetResponse({
    this.changeToken,
  });
  static DeleteSizeConstraintSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteSizeConstraintSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to a request to delete a SqlInjectionMatchSet from AWS WAF.
class DeleteSqlInjectionMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteSqlInjectionMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteSqlInjectionMatchSetResponse({
    this.changeToken,
  });
  static DeleteSqlInjectionMatchSetResponse fromJson(
          Map<String, dynamic> json) =>
      DeleteSqlInjectionMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class DeleteWebAclResponse {
  /// The `ChangeToken` that you used to submit the `DeleteWebACL` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteWebAclResponse({
    this.changeToken,
  });
  static DeleteWebAclResponse fromJson(Map<String, dynamic> json) =>
      DeleteWebAclResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to a request to delete an XssMatchSet from AWS WAF.
class DeleteXssMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `DeleteXssMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  DeleteXssMatchSetResponse({
    this.changeToken,
  });
  static DeleteXssMatchSetResponse fromJson(Map<String, dynamic> json) =>
      DeleteXssMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The rule to exclude from a rule group. This is applicable only when the
/// `ActivatedRule` refers to a `RuleGroup`. The rule must belong to the
/// `RuleGroup` that is specified by the `ActivatedRule`.
class ExcludedRule {
  /// The unique identifier for the rule to exclude from the rule group.
  final String ruleId;

  ExcludedRule({
    @required this.ruleId,
  });
  static ExcludedRule fromJson(Map<String, dynamic> json) => ExcludedRule(
        ruleId: json['RuleId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies where in a web request to look for `TargetString`.
class FieldToMatch {
  /// The part of the web request that you want AWS WAF to search for a
  /// specified string. Parts of a request that you can search include the
  /// following:
  ///
  /// *    `HEADER`: A specified request header, for example, the value of the
  /// `User-Agent` or `Referer` header. If you choose `HEADER` for the type,
  /// specify the name of the header in `Data`.
  ///
  /// *    `METHOD`: The HTTP method, which indicated the type of operation that
  /// the request is asking the origin to perform. Amazon CloudFront supports
  /// the following methods: `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`,
  /// `POST`, and `PUT`.
  ///
  /// *    `QUERY_STRING`: A query string, which is the part of a URL that
  /// appears after a `?` character, if any.
  ///
  /// *    `URI`: The part of a web request that identifies a resource, for
  /// example, `/images/daily-ad.jpg`.
  ///
  /// *    `BODY`: The part of a request that contains any additional data that
  /// you want to send to your web server as the HTTP request body, such as data
  /// from a form. The request body immediately follows the request headers.
  /// Note that only the first `8192` bytes of the request body are forwarded to
  /// AWS WAF for inspection. To allow or block requests based on the length of
  /// the body, you can create a size constraint set. For more information, see
  /// CreateSizeConstraintSet.
  ///
  /// *    `SINGLE_QUERY_ARG`: The parameter in the query string that you will
  /// inspect, such as _UserName_ or _SalesRegion_. The maximum length for
  /// `SINGLE_QUERY_ARG` is 30 characters.
  ///
  /// *    `ALL_QUERY_ARGS`: Similar to `SINGLE_QUERY_ARG`, but rather than
  /// inspecting a single parameter, AWS WAF will inspect all parameters within
  /// the query for the value or regex pattern that you specify in
  /// `TargetString`.
  final String type;

  /// When the value of `Type` is `HEADER`, enter the name of the header that
  /// you want AWS WAF to search, for example, `User-Agent` or `Referer`. The
  /// name of the header is not case sensitive.
  ///
  /// When the value of `Type` is `SINGLE_QUERY_ARG`, enter the name of the
  /// parameter that you want AWS WAF to search, for example, `UserName` or
  /// `SalesRegion`. The parameter name is not case sensitive.
  ///
  /// If the value of `Type` is any other value, omit `Data`.
  final String data;

  FieldToMatch({
    @required this.type,
    this.data,
  });
  static FieldToMatch fromJson(Map<String, dynamic> json) => FieldToMatch(
        type: json['Type'] as String,
        data: json.containsKey('Data') ? json['Data'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The country from which web requests originate that you want AWS WAF to
/// search for.
class GeoMatchConstraint {
  /// The type of geographical area you want AWS WAF to search for. Currently
  /// `Country` is the only valid value.
  final String type;

  /// The country that you want AWS WAF to search for.
  final String value;

  GeoMatchConstraint({
    @required this.type,
    @required this.value,
  });
  static GeoMatchConstraint fromJson(Map<String, dynamic> json) =>
      GeoMatchConstraint(
        type: json['Type'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains one or more countries that AWS WAF will search for.
class GeoMatchSet {
  /// The `GeoMatchSetId` for an `GeoMatchSet`. You use `GeoMatchSetId` to get
  /// information about a `GeoMatchSet` (see GeoMatchSet), update a
  /// `GeoMatchSet` (see UpdateGeoMatchSet), insert a `GeoMatchSet` into a
  /// `Rule` or delete one from a `Rule` (see UpdateRule), and delete a
  /// `GeoMatchSet` from AWS WAF (see DeleteGeoMatchSet).
  ///
  ///  `GeoMatchSetId` is returned by CreateGeoMatchSet and by ListGeoMatchSets.
  final String geoMatchSetId;

  /// A friendly name or description of the GeoMatchSet. You can't change the
  /// name of an `GeoMatchSet` after you create it.
  final String name;

  /// An array of GeoMatchConstraint objects, which contain the country that you
  /// want AWS WAF to search for.
  final List<GeoMatchConstraint> geoMatchConstraints;

  GeoMatchSet({
    @required this.geoMatchSetId,
    this.name,
    @required this.geoMatchConstraints,
  });
  static GeoMatchSet fromJson(Map<String, dynamic> json) => GeoMatchSet(
        geoMatchSetId: json['GeoMatchSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        geoMatchConstraints: (json['GeoMatchConstraints'] as List)
            .map((e) => GeoMatchConstraint.fromJson(e))
            .toList(),
      );
}

/// Contains the identifier and the name of the `GeoMatchSet`.
class GeoMatchSetSummary {
  /// The `GeoMatchSetId` for an GeoMatchSet. You can use `GeoMatchSetId` in a
  /// GetGeoMatchSet request to get detailed information about an GeoMatchSet.
  final String geoMatchSetId;

  /// A friendly name or description of the GeoMatchSet. You can't change the
  /// name of an `GeoMatchSet` after you create it.
  final String name;

  GeoMatchSetSummary({
    @required this.geoMatchSetId,
    @required this.name,
  });
  static GeoMatchSetSummary fromJson(Map<String, dynamic> json) =>
      GeoMatchSetSummary(
        geoMatchSetId: json['GeoMatchSetId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies the type of update to perform to an GeoMatchSet with
/// UpdateGeoMatchSet.
class GeoMatchSetUpdate {
  /// Specifies whether to insert or delete a country with UpdateGeoMatchSet.
  final String action;

  /// The country from which web requests originate that you want AWS WAF to
  /// search for.
  final GeoMatchConstraint geoMatchConstraint;

  GeoMatchSetUpdate({
    @required this.action,
    @required this.geoMatchConstraint,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class GetByteMatchSetResponse {
  /// Information about the ByteMatchSet that you specified in the
  /// `GetByteMatchSet` request. For more information, see the following topics:
  ///
  /// *    ByteMatchSet: Contains `ByteMatchSetId`, `ByteMatchTuples`, and
  /// `Name`
  ///
  /// *    `ByteMatchTuples`: Contains an array of ByteMatchTuple objects. Each
  /// `ByteMatchTuple` object contains FieldToMatch, `PositionalConstraint`,
  /// `TargetString`, and `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  final ByteMatchSet byteMatchSet;

  GetByteMatchSetResponse({
    this.byteMatchSet,
  });
  static GetByteMatchSetResponse fromJson(Map<String, dynamic> json) =>
      GetByteMatchSetResponse(
        byteMatchSet: json.containsKey('ByteMatchSet')
            ? ByteMatchSet.fromJson(json['ByteMatchSet'])
            : null,
      );
}

class GetChangeTokenResponse {
  /// The `ChangeToken` that you used in the request. Use this value in a
  /// `GetChangeTokenStatus` request to get the current status of the request.
  final String changeToken;

  GetChangeTokenResponse({
    this.changeToken,
  });
  static GetChangeTokenResponse fromJson(Map<String, dynamic> json) =>
      GetChangeTokenResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class GetChangeTokenStatusResponse {
  /// The status of the change token.
  final String changeTokenStatus;

  GetChangeTokenStatusResponse({
    this.changeTokenStatus,
  });
  static GetChangeTokenStatusResponse fromJson(Map<String, dynamic> json) =>
      GetChangeTokenStatusResponse(
        changeTokenStatus: json.containsKey('ChangeTokenStatus')
            ? json['ChangeTokenStatus'] as String
            : null,
      );
}

class GetGeoMatchSetResponse {
  /// Information about the GeoMatchSet that you specified in the
  /// `GetGeoMatchSet` request. This includes the `Type`, which for a
  /// `GeoMatchContraint` is always `Country`, as well as the `Value`, which is
  /// the identifier for a specific country.
  final GeoMatchSet geoMatchSet;

  GetGeoMatchSetResponse({
    this.geoMatchSet,
  });
  static GetGeoMatchSetResponse fromJson(Map<String, dynamic> json) =>
      GetGeoMatchSetResponse(
        geoMatchSet: json.containsKey('GeoMatchSet')
            ? GeoMatchSet.fromJson(json['GeoMatchSet'])
            : null,
      );
}

class GetIPSetResponse {
  /// Information about the IPSet that you specified in the `GetIPSet` request.
  /// For more information, see the following topics:
  ///
  /// *    IPSet: Contains `IPSetDescriptors`, `IPSetId`, and `Name`
  ///
  /// *    `IPSetDescriptors`: Contains an array of IPSetDescriptor objects.
  /// Each `IPSetDescriptor` object contains `Type` and `Value`
  final IPSet ipSet;

  GetIPSetResponse({
    this.ipSet,
  });
  static GetIPSetResponse fromJson(Map<String, dynamic> json) =>
      GetIPSetResponse(
        ipSet: json.containsKey('IPSet') ? IPSet.fromJson(json['IPSet']) : null,
      );
}

class GetLoggingConfigurationResponse {
  /// The LoggingConfiguration for the specified web ACL.
  final LoggingConfiguration loggingConfiguration;

  GetLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  static GetLoggingConfigurationResponse fromJson(Map<String, dynamic> json) =>
      GetLoggingConfigurationResponse(
        loggingConfiguration: json.containsKey('LoggingConfiguration')
            ? LoggingConfiguration.fromJson(json['LoggingConfiguration'])
            : null,
      );
}

class GetPermissionPolicyResponse {
  /// The IAM policy attached to the specified RuleGroup.
  final String policy;

  GetPermissionPolicyResponse({
    this.policy,
  });
  static GetPermissionPolicyResponse fromJson(Map<String, dynamic> json) =>
      GetPermissionPolicyResponse(
        policy: json.containsKey('Policy') ? json['Policy'] as String : null,
      );
}

class GetRateBasedRuleManagedKeysResponse {
  /// An array of IP addresses that currently are blocked by the specified
  /// RateBasedRule.
  final List<String> managedKeys;

  /// A null value and not currently used.
  final String nextMarker;

  GetRateBasedRuleManagedKeysResponse({
    this.managedKeys,
    this.nextMarker,
  });
  static GetRateBasedRuleManagedKeysResponse fromJson(
          Map<String, dynamic> json) =>
      GetRateBasedRuleManagedKeysResponse(
        managedKeys: json.containsKey('ManagedKeys')
            ? (json['ManagedKeys'] as List).map((e) => e as String).toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
      );
}

class GetRateBasedRuleResponse {
  /// Information about the RateBasedRule that you specified in the
  /// `GetRateBasedRule` request.
  final RateBasedRule rule;

  GetRateBasedRuleResponse({
    this.rule,
  });
  static GetRateBasedRuleResponse fromJson(Map<String, dynamic> json) =>
      GetRateBasedRuleResponse(
        rule: json.containsKey('Rule')
            ? RateBasedRule.fromJson(json['Rule'])
            : null,
      );
}

class GetRegexMatchSetResponse {
  /// Information about the RegexMatchSet that you specified in the
  /// `GetRegexMatchSet` request. For more information, see RegexMatchTuple.
  final RegexMatchSet regexMatchSet;

  GetRegexMatchSetResponse({
    this.regexMatchSet,
  });
  static GetRegexMatchSetResponse fromJson(Map<String, dynamic> json) =>
      GetRegexMatchSetResponse(
        regexMatchSet: json.containsKey('RegexMatchSet')
            ? RegexMatchSet.fromJson(json['RegexMatchSet'])
            : null,
      );
}

class GetRegexPatternSetResponse {
  /// Information about the RegexPatternSet that you specified in the
  /// `GetRegexPatternSet` request, including the identifier of the pattern set
  /// and the regular expression patterns you want AWS WAF to search for.
  final RegexPatternSet regexPatternSet;

  GetRegexPatternSetResponse({
    this.regexPatternSet,
  });
  static GetRegexPatternSetResponse fromJson(Map<String, dynamic> json) =>
      GetRegexPatternSetResponse(
        regexPatternSet: json.containsKey('RegexPatternSet')
            ? RegexPatternSet.fromJson(json['RegexPatternSet'])
            : null,
      );
}

class GetRuleGroupResponse {
  /// Information about the RuleGroup that you specified in the `GetRuleGroup`
  /// request.
  final RuleGroup ruleGroup;

  GetRuleGroupResponse({
    this.ruleGroup,
  });
  static GetRuleGroupResponse fromJson(Map<String, dynamic> json) =>
      GetRuleGroupResponse(
        ruleGroup: json.containsKey('RuleGroup')
            ? RuleGroup.fromJson(json['RuleGroup'])
            : null,
      );
}

class GetRuleResponse {
  /// Information about the Rule that you specified in the `GetRule` request.
  /// For more information, see the following topics:
  ///
  /// *    Rule: Contains `MetricName`, `Name`, an array of `Predicate` objects,
  /// and `RuleId`
  ///
  /// *    Predicate: Each `Predicate` object contains `DataId`, `Negated`, and
  /// `Type`
  final Rule rule;

  GetRuleResponse({
    this.rule,
  });
  static GetRuleResponse fromJson(Map<String, dynamic> json) => GetRuleResponse(
        rule: json.containsKey('Rule') ? Rule.fromJson(json['Rule']) : null,
      );
}

class GetSampledRequestsResponse {
  /// A complex type that contains detailed information about each of the
  /// requests in the sample.
  final List<SampledHttpRequest> sampledRequests;

  /// The total number of requests from which `GetSampledRequests` got a sample
  /// of `MaxItems` requests. If `PopulationSize` is less than `MaxItems`, the
  /// sample includes every request that your AWS resource received during the
  /// specified time range.
  final BigInt populationSize;

  /// Usually, `TimeWindow` is the time range that you specified in the
  /// `GetSampledRequests` request. However, if your AWS resource received more
  /// than 5,000 requests during the time range that you specified in the
  /// request, `GetSampledRequests` returns the time range for the first 5,000
  /// requests.
  final TimeWindow timeWindow;

  GetSampledRequestsResponse({
    this.sampledRequests,
    this.populationSize,
    this.timeWindow,
  });
  static GetSampledRequestsResponse fromJson(Map<String, dynamic> json) =>
      GetSampledRequestsResponse(
        sampledRequests: json.containsKey('SampledRequests')
            ? (json['SampledRequests'] as List)
                .map((e) => SampledHttpRequest.fromJson(e))
                .toList()
            : null,
        populationSize: json.containsKey('PopulationSize')
            ? BigInt.from(json['PopulationSize'])
            : null,
        timeWindow: json.containsKey('TimeWindow')
            ? TimeWindow.fromJson(json['TimeWindow'])
            : null,
      );
}

class GetSizeConstraintSetResponse {
  /// Information about the SizeConstraintSet that you specified in the
  /// `GetSizeConstraintSet` request. For more information, see the following
  /// topics:
  ///
  /// *    SizeConstraintSet: Contains `SizeConstraintSetId`, `SizeConstraints`,
  /// and `Name`
  ///
  /// *    `SizeConstraints`: Contains an array of SizeConstraint objects. Each
  /// `SizeConstraint` object contains FieldToMatch, `TextTransformation`,
  /// `ComparisonOperator`, and `Size`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  final SizeConstraintSet sizeConstraintSet;

  GetSizeConstraintSetResponse({
    this.sizeConstraintSet,
  });
  static GetSizeConstraintSetResponse fromJson(Map<String, dynamic> json) =>
      GetSizeConstraintSetResponse(
        sizeConstraintSet: json.containsKey('SizeConstraintSet')
            ? SizeConstraintSet.fromJson(json['SizeConstraintSet'])
            : null,
      );
}

/// The response to a GetSqlInjectionMatchSet request.
class GetSqlInjectionMatchSetResponse {
  /// Information about the SqlInjectionMatchSet that you specified in the
  /// `GetSqlInjectionMatchSet` request. For more information, see the following
  /// topics:
  ///
  /// *    SqlInjectionMatchSet: Contains `Name`, `SqlInjectionMatchSetId`, and
  /// an array of `SqlInjectionMatchTuple` objects
  ///
  /// *    SqlInjectionMatchTuple: Each `SqlInjectionMatchTuple` object contains
  /// `FieldToMatch` and `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  final SqlInjectionMatchSet sqlInjectionMatchSet;

  GetSqlInjectionMatchSetResponse({
    this.sqlInjectionMatchSet,
  });
  static GetSqlInjectionMatchSetResponse fromJson(Map<String, dynamic> json) =>
      GetSqlInjectionMatchSetResponse(
        sqlInjectionMatchSet: json.containsKey('SqlInjectionMatchSet')
            ? SqlInjectionMatchSet.fromJson(json['SqlInjectionMatchSet'])
            : null,
      );
}

class GetWebAclResponse {
  /// Information about the WebACL that you specified in the `GetWebACL`
  /// request. For more information, see the following topics:
  ///
  /// *    WebACL: Contains `DefaultAction`, `MetricName`, `Name`, an array of
  /// `Rule` objects, and `WebACLId`
  ///
  /// *    `DefaultAction` (Data type is WafAction): Contains `Type`
  ///
  /// *    `Rules`: Contains an array of `ActivatedRule` objects, which contain
  /// `Action`, `Priority`, and `RuleId`
  ///
  /// *    `Action`: Contains `Type`
  final WebAcl webAcl;

  GetWebAclResponse({
    this.webAcl,
  });
  static GetWebAclResponse fromJson(Map<String, dynamic> json) =>
      GetWebAclResponse(
        webAcl:
            json.containsKey('WebACL') ? WebAcl.fromJson(json['WebACL']) : null,
      );
}

/// The response to a GetXssMatchSet request.
class GetXssMatchSetResponse {
  /// Information about the XssMatchSet that you specified in the
  /// `GetXssMatchSet` request. For more information, see the following topics:
  ///
  /// *    XssMatchSet: Contains `Name`, `XssMatchSetId`, and an array of
  /// `XssMatchTuple` objects
  ///
  /// *    XssMatchTuple: Each `XssMatchTuple` object contains `FieldToMatch`
  /// and `TextTransformation`
  ///
  /// *    FieldToMatch: Contains `Data` and `Type`
  final XssMatchSet xssMatchSet;

  GetXssMatchSetResponse({
    this.xssMatchSet,
  });
  static GetXssMatchSetResponse fromJson(Map<String, dynamic> json) =>
      GetXssMatchSetResponse(
        xssMatchSet: json.containsKey('XssMatchSet')
            ? XssMatchSet.fromJson(json['XssMatchSet'])
            : null,
      );
}

/// The response from a GetSampledRequests request includes an `HTTPHeader`
/// complex type that appears as `Headers` in the response syntax. `HTTPHeader`
/// contains the names and values of all of the headers that appear in one of
/// the web requests that were returned by `GetSampledRequests`.
class HttpHeader {
  /// The name of one of the headers in the sampled web request.
  final String name;

  /// The value of one of the headers in the sampled web request.
  final String value;

  HttpHeader({
    this.name,
    this.value,
  });
  static HttpHeader fromJson(Map<String, dynamic> json) => HttpHeader(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
}

/// The response from a GetSampledRequests request includes an `HTTPRequest`
/// complex type that appears as `Request` in the response syntax. `HTTPRequest`
/// contains information about one of the web requests that were returned by
/// `GetSampledRequests`.
class HttpRequest {
  /// The IP address that the request originated from. If the `WebACL` is
  /// associated with a CloudFront distribution, this is the value of one of the
  /// following fields in CloudFront access logs:
  ///
  /// *    `c-ip`, if the viewer did not use an HTTP proxy or a load balancer to
  /// send the request
  ///
  /// *    `x-forwarded-for`, if the viewer did use an HTTP proxy or a load
  /// balancer to send the request
  final String clientIP;

  /// The two-letter country code for the country that the request originated
  /// from. For a current list of country codes, see the Wikipedia entry
  /// [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2).
  final String country;

  /// The part of a web request that identifies the resource, for example,
  /// `/images/daily-ad.jpg`.
  final String uri;

  /// The HTTP method specified in the sampled web request. CloudFront supports
  /// the following methods: `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`,
  /// `POST`, and `PUT`.
  final String method;

  /// The HTTP version specified in the sampled web request, for example,
  /// `HTTP/1.1`.
  final String httpVersion;

  /// A complex type that contains two values for each header in the sampled web
  /// request: the name of the header and the value of the header.
  final List<HttpHeader> headers;

  HttpRequest({
    this.clientIP,
    this.country,
    this.uri,
    this.method,
    this.httpVersion,
    this.headers,
  });
  static HttpRequest fromJson(Map<String, dynamic> json) => HttpRequest(
        clientIP:
            json.containsKey('ClientIP') ? json['ClientIP'] as String : null,
        country: json.containsKey('Country') ? json['Country'] as String : null,
        uri: json.containsKey('URI') ? json['URI'] as String : null,
        method: json.containsKey('Method') ? json['Method'] as String : null,
        httpVersion: json.containsKey('HTTPVersion')
            ? json['HTTPVersion'] as String
            : null,
        headers: json.containsKey('Headers')
            ? (json['Headers'] as List)
                .map((e) => HttpHeader.fromJson(e))
                .toList()
            : null,
      );
}

/// Contains one or more IP addresses or blocks of IP addresses specified in
/// Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports IPv4
/// address ranges: /8 and any range between /16 through /32. AWS WAF supports
/// IPv6 address ranges: /24, /32, /48, /56, /64, and /128.
///
/// To specify an individual IP address, you specify the four-part IP address
/// followed by a `/32`, for example, 192.0.2.0/31. To block a range of IP
/// addresses, you can specify /8 or any range between /16 through /32 (for
/// IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more information
/// about CIDR notation, see the Wikipedia entry
/// [Classless Inter-Domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
class IPSet {
  /// The `IPSetId` for an `IPSet`. You use `IPSetId` to get information about
  /// an `IPSet` (see GetIPSet), update an `IPSet` (see UpdateIPSet), insert an
  /// `IPSet` into a `Rule` or delete one from a `Rule` (see UpdateRule), and
  /// delete an `IPSet` from AWS WAF (see DeleteIPSet).
  ///
  ///  `IPSetId` is returned by CreateIPSet and by ListIPSets.
  final String ipSetId;

  /// A friendly name or description of the IPSet. You can't change the name of
  /// an `IPSet` after you create it.
  final String name;

  /// The IP address type (`IPV4` or `IPV6`) and the IP address range (in CIDR
  /// notation) that web requests originate from. If the `WebACL` is associated
  /// with a CloudFront distribution and the viewer did not use an HTTP proxy or
  /// a load balancer to send the request, this is the value of the c-ip field
  /// in the CloudFront access logs.
  final List<IPSetDescriptor> ipSetDescriptors;

  IPSet({
    @required this.ipSetId,
    this.name,
    @required this.ipSetDescriptors,
  });
  static IPSet fromJson(Map<String, dynamic> json) => IPSet(
        ipSetId: json['IPSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        ipSetDescriptors: (json['IPSetDescriptors'] as List)
            .map((e) => IPSetDescriptor.fromJson(e))
            .toList(),
      );
}

/// Specifies the IP address type (`IPV4` or `IPV6`) and the IP address range
/// (in CIDR format) that web requests originate from.
class IPSetDescriptor {
  /// Specify `IPV4` or `IPV6`.
  final String type;

  /// Specify an IPv4 address by using CIDR notation. For example:
  ///
  /// *   To configure AWS WAF to allow, block, or count requests that
  /// originated from the IP address 192.0.2.44, specify `192.0.2.44/32`.
  ///
  /// *   To configure AWS WAF to allow, block, or count requests that
  /// originated from IP addresses from 192.0.2.0 to 192.0.2.255, specify
  /// `192.0.2.0/24`.
  ///
  ///
  /// For more information about CIDR notation, see the Wikipedia entry
  /// [Classless Inter-Domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
  ///
  /// Specify an IPv6 address by using CIDR notation. For example:
  ///
  /// *   To configure AWS WAF to allow, block, or count requests that
  /// originated from the IP address 1111:0000:0000:0000:0000:0000:0000:0111,
  /// specify `1111:0000:0000:0000:0000:0000:0000:0111/128`.
  ///
  /// *   To configure AWS WAF to allow, block, or count requests that
  /// originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
  /// 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
  /// `1111:0000:0000:0000:0000:0000:0000:0000/64`.
  final String value;

  IPSetDescriptor({
    @required this.type,
    @required this.value,
  });
  static IPSetDescriptor fromJson(Map<String, dynamic> json) => IPSetDescriptor(
        type: json['Type'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the identifier and the name of the `IPSet`.
class IPSetSummary {
  /// The `IPSetId` for an IPSet. You can use `IPSetId` in a GetIPSet request to
  /// get detailed information about an IPSet.
  final String ipSetId;

  /// A friendly name or description of the IPSet. You can't change the name of
  /// an `IPSet` after you create it.
  final String name;

  IPSetSummary({
    @required this.ipSetId,
    @required this.name,
  });
  static IPSetSummary fromJson(Map<String, dynamic> json) => IPSetSummary(
        ipSetId: json['IPSetId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies the type of update to perform to an IPSet with UpdateIPSet.
class IPSetUpdate {
  /// Specifies whether to insert or delete an IP address with UpdateIPSet.
  final String action;

  /// The IP address type (`IPV4` or `IPV6`) and the IP address range (in CIDR
  /// notation) that web requests originate from.
  final IPSetDescriptor ipSetDescriptor;

  IPSetUpdate({
    @required this.action,
    @required this.ipSetDescriptor,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class ListActivatedRulesInRuleGroupResponse {
  /// If you have more `ActivatedRules` than the number that you specified for
  /// `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `ActivatedRules`, submit another `ListActivatedRulesInRuleGroup`
  /// request, and specify the `NextMarker` value from the response in the
  /// `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of `ActivatedRules` objects.
  final List<ActivatedRule> activatedRules;

  ListActivatedRulesInRuleGroupResponse({
    this.nextMarker,
    this.activatedRules,
  });
  static ListActivatedRulesInRuleGroupResponse fromJson(
          Map<String, dynamic> json) =>
      ListActivatedRulesInRuleGroupResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        activatedRules: json.containsKey('ActivatedRules')
            ? (json['ActivatedRules'] as List)
                .map((e) => ActivatedRule.fromJson(e))
                .toList()
            : null,
      );
}

class ListByteMatchSetsResponse {
  /// If you have more `ByteMatchSet` objects than the number that you specified
  /// for `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `ByteMatchSet` objects, submit another `ListByteMatchSets`
  /// request, and specify the `NextMarker` value from the response in the
  /// `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of ByteMatchSetSummary objects.
  final List<ByteMatchSetSummary> byteMatchSets;

  ListByteMatchSetsResponse({
    this.nextMarker,
    this.byteMatchSets,
  });
  static ListByteMatchSetsResponse fromJson(Map<String, dynamic> json) =>
      ListByteMatchSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        byteMatchSets: json.containsKey('ByteMatchSets')
            ? (json['ByteMatchSets'] as List)
                .map((e) => ByteMatchSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListGeoMatchSetsResponse {
  /// If you have more `GeoMatchSet` objects than the number that you specified
  /// for `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `GeoMatchSet` objects, submit another `ListGeoMatchSets`
  /// request, and specify the `NextMarker` value from the response in the
  /// `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of GeoMatchSetSummary objects.
  final List<GeoMatchSetSummary> geoMatchSets;

  ListGeoMatchSetsResponse({
    this.nextMarker,
    this.geoMatchSets,
  });
  static ListGeoMatchSetsResponse fromJson(Map<String, dynamic> json) =>
      ListGeoMatchSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        geoMatchSets: json.containsKey('GeoMatchSets')
            ? (json['GeoMatchSets'] as List)
                .map((e) => GeoMatchSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListIPSetsResponse {
  /// If you have more `IPSet` objects than the number that you specified for
  /// `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `IPSet` objects, submit another `ListIPSets` request, and
  /// specify the `NextMarker` value from the response in the `NextMarker` value
  /// in the next request.
  final String nextMarker;

  /// An array of IPSetSummary objects.
  final List<IPSetSummary> ipSets;

  ListIPSetsResponse({
    this.nextMarker,
    this.ipSets,
  });
  static ListIPSetsResponse fromJson(Map<String, dynamic> json) =>
      ListIPSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        ipSets: json.containsKey('IPSets')
            ? (json['IPSets'] as List)
                .map((e) => IPSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListLoggingConfigurationsResponse {
  /// An array of LoggingConfiguration objects.
  final List<LoggingConfiguration> loggingConfigurations;

  /// If you have more `LoggingConfigurations` than the number that you
  /// specified for `Limit` in the request, the response includes a `NextMarker`
  /// value. To list more `LoggingConfigurations`, submit another
  /// `ListLoggingConfigurations` request, and specify the `NextMarker` value
  /// from the response in the `NextMarker` value in the next request.
  final String nextMarker;

  ListLoggingConfigurationsResponse({
    this.loggingConfigurations,
    this.nextMarker,
  });
  static ListLoggingConfigurationsResponse fromJson(
          Map<String, dynamic> json) =>
      ListLoggingConfigurationsResponse(
        loggingConfigurations: json.containsKey('LoggingConfigurations')
            ? (json['LoggingConfigurations'] as List)
                .map((e) => LoggingConfiguration.fromJson(e))
                .toList()
            : null,
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
      );
}

class ListRateBasedRulesResponse {
  /// If you have more `Rules` than the number that you specified for `Limit` in
  /// the request, the response includes a `NextMarker` value. To list more
  /// `Rules`, submit another `ListRateBasedRules` request, and specify the
  /// `NextMarker` value from the response in the `NextMarker` value in the next
  /// request.
  final String nextMarker;

  /// An array of RuleSummary objects.
  final List<RuleSummary> rules;

  ListRateBasedRulesResponse({
    this.nextMarker,
    this.rules,
  });
  static ListRateBasedRulesResponse fromJson(Map<String, dynamic> json) =>
      ListRateBasedRulesResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        rules: json.containsKey('Rules')
            ? (json['Rules'] as List)
                .map((e) => RuleSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListRegexMatchSetsResponse {
  /// If you have more `RegexMatchSet` objects than the number that you
  /// specified for `Limit` in the request, the response includes a `NextMarker`
  /// value. To list more `RegexMatchSet` objects, submit another
  /// `ListRegexMatchSets` request, and specify the `NextMarker` value from the
  /// response in the `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of RegexMatchSetSummary objects.
  final List<RegexMatchSetSummary> regexMatchSets;

  ListRegexMatchSetsResponse({
    this.nextMarker,
    this.regexMatchSets,
  });
  static ListRegexMatchSetsResponse fromJson(Map<String, dynamic> json) =>
      ListRegexMatchSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        regexMatchSets: json.containsKey('RegexMatchSets')
            ? (json['RegexMatchSets'] as List)
                .map((e) => RegexMatchSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListRegexPatternSetsResponse {
  /// If you have more `RegexPatternSet` objects than the number that you
  /// specified for `Limit` in the request, the response includes a `NextMarker`
  /// value. To list more `RegexPatternSet` objects, submit another
  /// `ListRegexPatternSets` request, and specify the `NextMarker` value from
  /// the response in the `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of RegexPatternSetSummary objects.
  final List<RegexPatternSetSummary> regexPatternSets;

  ListRegexPatternSetsResponse({
    this.nextMarker,
    this.regexPatternSets,
  });
  static ListRegexPatternSetsResponse fromJson(Map<String, dynamic> json) =>
      ListRegexPatternSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        regexPatternSets: json.containsKey('RegexPatternSets')
            ? (json['RegexPatternSets'] as List)
                .map((e) => RegexPatternSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListRuleGroupsResponse {
  /// If you have more `RuleGroups` than the number that you specified for
  /// `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `RuleGroups`, submit another `ListRuleGroups` request, and
  /// specify the `NextMarker` value from the response in the `NextMarker` value
  /// in the next request.
  final String nextMarker;

  /// An array of RuleGroup objects.
  final List<RuleGroupSummary> ruleGroups;

  ListRuleGroupsResponse({
    this.nextMarker,
    this.ruleGroups,
  });
  static ListRuleGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListRuleGroupsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        ruleGroups: json.containsKey('RuleGroups')
            ? (json['RuleGroups'] as List)
                .map((e) => RuleGroupSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListRulesResponse {
  /// If you have more `Rules` than the number that you specified for `Limit` in
  /// the request, the response includes a `NextMarker` value. To list more
  /// `Rules`, submit another `ListRules` request, and specify the `NextMarker`
  /// value from the response in the `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of RuleSummary objects.
  final List<RuleSummary> rules;

  ListRulesResponse({
    this.nextMarker,
    this.rules,
  });
  static ListRulesResponse fromJson(Map<String, dynamic> json) =>
      ListRulesResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        rules: json.containsKey('Rules')
            ? (json['Rules'] as List)
                .map((e) => RuleSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListSizeConstraintSetsResponse {
  /// If you have more `SizeConstraintSet` objects than the number that you
  /// specified for `Limit` in the request, the response includes a `NextMarker`
  /// value. To list more `SizeConstraintSet` objects, submit another
  /// `ListSizeConstraintSets` request, and specify the `NextMarker` value from
  /// the response in the `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of SizeConstraintSetSummary objects.
  final List<SizeConstraintSetSummary> sizeConstraintSets;

  ListSizeConstraintSetsResponse({
    this.nextMarker,
    this.sizeConstraintSets,
  });
  static ListSizeConstraintSetsResponse fromJson(Map<String, dynamic> json) =>
      ListSizeConstraintSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        sizeConstraintSets: json.containsKey('SizeConstraintSets')
            ? (json['SizeConstraintSets'] as List)
                .map((e) => SizeConstraintSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// The response to a ListSqlInjectionMatchSets request.
class ListSqlInjectionMatchSetsResponse {
  /// If you have more SqlInjectionMatchSet objects than the number that you
  /// specified for `Limit` in the request, the response includes a `NextMarker`
  /// value. To list more `SqlInjectionMatchSet` objects, submit another
  /// `ListSqlInjectionMatchSets` request, and specify the `NextMarker` value
  /// from the response in the `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of SqlInjectionMatchSetSummary objects.
  final List<SqlInjectionMatchSetSummary> sqlInjectionMatchSets;

  ListSqlInjectionMatchSetsResponse({
    this.nextMarker,
    this.sqlInjectionMatchSets,
  });
  static ListSqlInjectionMatchSetsResponse fromJson(
          Map<String, dynamic> json) =>
      ListSqlInjectionMatchSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        sqlInjectionMatchSets: json.containsKey('SqlInjectionMatchSets')
            ? (json['SqlInjectionMatchSets'] as List)
                .map((e) => SqlInjectionMatchSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListSubscribedRuleGroupsResponse {
  /// If you have more objects than the number that you specified for `Limit` in
  /// the request, the response includes a `NextMarker` value. To list more
  /// objects, submit another `ListSubscribedRuleGroups` request, and specify
  /// the `NextMarker` value from the response in the `NextMarker` value in the
  /// next request.
  final String nextMarker;

  /// An array of RuleGroup objects.
  final List<SubscribedRuleGroupSummary> ruleGroups;

  ListSubscribedRuleGroupsResponse({
    this.nextMarker,
    this.ruleGroups,
  });
  static ListSubscribedRuleGroupsResponse fromJson(Map<String, dynamic> json) =>
      ListSubscribedRuleGroupsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        ruleGroups: json.containsKey('RuleGroups')
            ? (json['RuleGroups'] as List)
                .map((e) => SubscribedRuleGroupSummary.fromJson(e))
                .toList()
            : null,
      );
}

class ListTagsForResourceResponse {
  final String nextMarker;

  final TagInfoForResource tagInfoForResource;

  ListTagsForResourceResponse({
    this.nextMarker,
    this.tagInfoForResource,
  });
  static ListTagsForResourceResponse fromJson(Map<String, dynamic> json) =>
      ListTagsForResourceResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        tagInfoForResource: json.containsKey('TagInfoForResource')
            ? TagInfoForResource.fromJson(json['TagInfoForResource'])
            : null,
      );
}

class ListWebACLsResponse {
  /// If you have more `WebACL` objects than the number that you specified for
  /// `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `WebACL` objects, submit another `ListWebACLs` request, and
  /// specify the `NextMarker` value from the response in the `NextMarker` value
  /// in the next request.
  final String nextMarker;

  /// An array of WebACLSummary objects.
  final List<WebAclSummary> webACLs;

  ListWebACLsResponse({
    this.nextMarker,
    this.webACLs,
  });
  static ListWebACLsResponse fromJson(Map<String, dynamic> json) =>
      ListWebACLsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        webACLs: json.containsKey('WebACLs')
            ? (json['WebACLs'] as List)
                .map((e) => WebAclSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// The response to a ListXssMatchSets request.
class ListXssMatchSetsResponse {
  /// If you have more XssMatchSet objects than the number that you specified
  /// for `Limit` in the request, the response includes a `NextMarker` value. To
  /// list more `XssMatchSet` objects, submit another `ListXssMatchSets`
  /// request, and specify the `NextMarker` value from the response in the
  /// `NextMarker` value in the next request.
  final String nextMarker;

  /// An array of XssMatchSetSummary objects.
  final List<XssMatchSetSummary> xssMatchSets;

  ListXssMatchSetsResponse({
    this.nextMarker,
    this.xssMatchSets,
  });
  static ListXssMatchSetsResponse fromJson(Map<String, dynamic> json) =>
      ListXssMatchSetsResponse(
        nextMarker: json.containsKey('NextMarker')
            ? json['NextMarker'] as String
            : null,
        xssMatchSets: json.containsKey('XssMatchSets')
            ? (json['XssMatchSets'] as List)
                .map((e) => XssMatchSetSummary.fromJson(e))
                .toList()
            : null,
      );
}

/// The Amazon Kinesis Data Firehose, `RedactedFields` information, and the web
/// ACL Amazon Resource Name (ARN).
class LoggingConfiguration {
  /// The Amazon Resource Name (ARN) of the web ACL that you want to associate
  /// with `LogDestinationConfigs`.
  final String resourceArn;

  /// An array of Amazon Kinesis Data Firehose ARNs.
  final List<String> logDestinationConfigs;

  /// The parts of the request that you want redacted from the logs. For
  /// example, if you redact the cookie field, the cookie field in the firehose
  /// will be `xxx`.
  final List<FieldToMatch> redactedFields;

  LoggingConfiguration({
    @required this.resourceArn,
    @required this.logDestinationConfigs,
    this.redactedFields,
  });
  static LoggingConfiguration fromJson(Map<String, dynamic> json) =>
      LoggingConfiguration(
        resourceArn: json['ResourceArn'] as String,
        logDestinationConfigs: (json['LogDestinationConfigs'] as List)
            .map((e) => e as String)
            .toList(),
        redactedFields: json.containsKey('RedactedFields')
            ? (json['RedactedFields'] as List)
                .map((e) => FieldToMatch.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the ByteMatchSet, IPSet, SqlInjectionMatchSet, XssMatchSet,
/// RegexMatchSet, GeoMatchSet, and SizeConstraintSet objects that you want to
/// add to a `Rule` and, for each object, indicates whether you want to negate
/// the settings, for example, requests that do NOT originate from the IP
/// address 192.0.2.44.
class Predicate {
  /// Set `Negated` to `False` if you want AWS WAF to allow, block, or count
  /// requests based on the settings in the specified ByteMatchSet, IPSet,
  /// SqlInjectionMatchSet, XssMatchSet, RegexMatchSet, GeoMatchSet, or
  /// SizeConstraintSet. For example, if an `IPSet` includes the IP address
  /// `192.0.2.44`, AWS WAF will allow or block requests based on that IP
  /// address.
  ///
  /// Set `Negated` to `True` if you want AWS WAF to allow or block a request
  /// based on the negation of the settings in the ByteMatchSet, IPSet,
  /// SqlInjectionMatchSet, XssMatchSet, RegexMatchSet, GeoMatchSet, or
  /// SizeConstraintSet. For example, if an `IPSet` includes the IP address
  /// `192.0.2.44`, AWS WAF will allow, block, or count requests based on all IP
  /// addresses _except_ `192.0.2.44`.
  final bool negated;

  /// The type of predicate in a `Rule`, such as `ByteMatch` or `IPSet`.
  final String type;

  /// A unique identifier for a predicate in a `Rule`, such as `ByteMatchSetId`
  /// or `IPSetId`. The ID is returned by the corresponding `Create` or `List`
  /// command.
  final String dataId;

  Predicate({
    @required this.negated,
    @required this.type,
    @required this.dataId,
  });
  static Predicate fromJson(Map<String, dynamic> json) => Predicate(
        negated: json['Negated'] as bool,
        type: json['Type'] as String,
        dataId: json['DataId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class PutLoggingConfigurationResponse {
  /// The LoggingConfiguration that you submitted in the request.
  final LoggingConfiguration loggingConfiguration;

  PutLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  static PutLoggingConfigurationResponse fromJson(Map<String, dynamic> json) =>
      PutLoggingConfigurationResponse(
        loggingConfiguration: json.containsKey('LoggingConfiguration')
            ? LoggingConfiguration.fromJson(json['LoggingConfiguration'])
            : null,
      );
}

class PutPermissionPolicyResponse {
  PutPermissionPolicyResponse();
  static PutPermissionPolicyResponse fromJson(Map<String, dynamic> json) =>
      PutPermissionPolicyResponse();
}

/// A `RateBasedRule` is identical to a regular Rule, with one addition: a
/// `RateBasedRule` counts the number of requests that arrive from a specified
/// IP address every five minutes. For example, based on recent requests that
/// you've seen from an attacker, you might create a `RateBasedRule` that
/// includes the following conditions:
///
/// *   The requests come from 192.0.2.44.
///
/// *   They contain the value `BadBot` in the `User-Agent` header.
///
///
/// In the rule, you also define the rate limit as 15,000.
///
/// Requests that meet both of these conditions and exceed 15,000 requests every
/// five minutes trigger the rule's action (block or count), which is defined in
/// the web ACL.
class RateBasedRule {
  /// A unique identifier for a `RateBasedRule`. You use `RuleId` to get more
  /// information about a `RateBasedRule` (see GetRateBasedRule), update a
  /// `RateBasedRule` (see UpdateRateBasedRule), insert a `RateBasedRule` into a
  /// `WebACL` or delete one from a `WebACL` (see UpdateWebACL), or delete a
  /// `RateBasedRule` from AWS WAF (see DeleteRateBasedRule).
  final String ruleId;

  /// A friendly name or description for a `RateBasedRule`. You can't change the
  /// name of a `RateBasedRule` after you create it.
  final String name;

  /// A friendly name or description for the metrics for a `RateBasedRule`. The
  /// name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action."
  /// You can't change the name of the metric after you create the
  /// `RateBasedRule`.
  final String metricName;

  /// The `Predicates` object contains one `Predicate` element for each
  /// ByteMatchSet, IPSet, or SqlInjectionMatchSet object that you want to
  /// include in a `RateBasedRule`.
  final List<Predicate> matchPredicates;

  /// The field that AWS WAF uses to determine if requests are likely arriving
  /// from single source and thus subject to rate monitoring. The only valid
  /// value for `RateKey` is `IP`. `IP` indicates that requests arriving from
  /// the same IP address are subject to the `RateLimit` that is specified in
  /// the `RateBasedRule`.
  final String rateKey;

  /// The maximum number of requests, which have an identical value in the field
  /// specified by the `RateKey`, allowed in a five-minute period. If the number
  /// of requests exceeds the `RateLimit` and the other predicates specified in
  /// the rule are also met, AWS WAF triggers the action that is specified for
  /// this rule.
  final BigInt rateLimit;

  RateBasedRule({
    @required this.ruleId,
    this.name,
    this.metricName,
    @required this.matchPredicates,
    @required this.rateKey,
    @required this.rateLimit,
  });
  static RateBasedRule fromJson(Map<String, dynamic> json) => RateBasedRule(
        ruleId: json['RuleId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        matchPredicates: (json['MatchPredicates'] as List)
            .map((e) => Predicate.fromJson(e))
            .toList(),
        rateKey: json['RateKey'] as String,
        rateLimit: BigInt.from(json['RateLimit']),
      );
}

/// In a GetRegexMatchSet request, `RegexMatchSet` is a complex type that
/// contains the `RegexMatchSetId` and `Name` of a `RegexMatchSet`, and the
/// values that you specified when you updated the `RegexMatchSet`.
///
///  The values are contained in a `RegexMatchTuple` object, which specify the
/// parts of web requests that you want AWS WAF to inspect and the values that
/// you want AWS WAF to search for. If a `RegexMatchSet` contains more than one
/// `RegexMatchTuple` object, a request needs to match the settings in only one
/// `ByteMatchTuple` to be considered a match.
class RegexMatchSet {
  /// The `RegexMatchSetId` for a `RegexMatchSet`. You use `RegexMatchSetId` to
  /// get information about a `RegexMatchSet` (see GetRegexMatchSet), update a
  /// `RegexMatchSet` (see UpdateRegexMatchSet), insert a `RegexMatchSet` into a
  /// `Rule` or delete one from a `Rule` (see UpdateRule), and delete a
  /// `RegexMatchSet` from AWS WAF (see DeleteRegexMatchSet).
  ///
  ///  `RegexMatchSetId` is returned by CreateRegexMatchSet and by
  /// ListRegexMatchSets.
  final String regexMatchSetId;

  /// A friendly name or description of the RegexMatchSet. You can't change
  /// `Name` after you create a `RegexMatchSet`.
  final String name;

  /// Contains an array of RegexMatchTuple objects. Each `RegexMatchTuple`
  /// object contains:
  ///
  /// *   The part of a web request that you want AWS WAF to inspect, such as a
  /// query string or the value of the `User-Agent` header.
  ///
  /// *   The identifier of the pattern (a regular expression) that you want AWS
  /// WAF to look for. For more information, see RegexPatternSet.
  ///
  /// *   Whether to perform any conversions on the request, such as converting
  /// it to lowercase, before inspecting it for the specified string.
  final List<RegexMatchTuple> regexMatchTuples;

  RegexMatchSet({
    this.regexMatchSetId,
    this.name,
    this.regexMatchTuples,
  });
  static RegexMatchSet fromJson(Map<String, dynamic> json) => RegexMatchSet(
        regexMatchSetId: json.containsKey('RegexMatchSetId')
            ? json['RegexMatchSetId'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        regexMatchTuples: json.containsKey('RegexMatchTuples')
            ? (json['RegexMatchTuples'] as List)
                .map((e) => RegexMatchTuple.fromJson(e))
                .toList()
            : null,
      );
}

/// Returned by ListRegexMatchSets. Each `RegexMatchSetSummary` object includes
/// the `Name` and `RegexMatchSetId` for one RegexMatchSet.
class RegexMatchSetSummary {
  /// The `RegexMatchSetId` for a `RegexMatchSet`. You use `RegexMatchSetId` to
  /// get information about a `RegexMatchSet`, update a `RegexMatchSet`, remove
  /// a `RegexMatchSet` from a `Rule`, and delete a `RegexMatchSet` from AWS
  /// WAF.
  ///
  ///  `RegexMatchSetId` is returned by CreateRegexMatchSet and by
  /// ListRegexMatchSets.
  final String regexMatchSetId;

  /// A friendly name or description of the RegexMatchSet. You can't change
  /// `Name` after you create a `RegexMatchSet`.
  final String name;

  RegexMatchSetSummary({
    @required this.regexMatchSetId,
    @required this.name,
  });
  static RegexMatchSetSummary fromJson(Map<String, dynamic> json) =>
      RegexMatchSetSummary(
        regexMatchSetId: json['RegexMatchSetId'] as String,
        name: json['Name'] as String,
      );
}

/// In an UpdateRegexMatchSet request, `RegexMatchSetUpdate` specifies whether
/// to insert or delete a RegexMatchTuple and includes the settings for the
/// `RegexMatchTuple`.
class RegexMatchSetUpdate {
  /// Specifies whether to insert or delete a RegexMatchTuple.
  final String action;

  /// Information about the part of a web request that you want AWS WAF to
  /// inspect and the identifier of the regular expression (regex) pattern that
  /// you want AWS WAF to search for. If you specify `DELETE` for the value of
  /// `Action`, the `RegexMatchTuple` values must exactly match the values in
  /// the `RegexMatchTuple` that you want to delete from the `RegexMatchSet`.
  final RegexMatchTuple regexMatchTuple;

  RegexMatchSetUpdate({
    @required this.action,
    @required this.regexMatchTuple,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The regular expression pattern that you want AWS WAF to search for in web
/// requests, the location in requests that you want AWS WAF to search, and
/// other settings. Each `RegexMatchTuple` object contains:
///
/// *   The part of a web request that you want AWS WAF to inspect, such as a
/// query string or the value of the `User-Agent` header.
///
/// *   The identifier of the pattern (a regular expression) that you want AWS
/// WAF to look for. For more information, see RegexPatternSet.
///
/// *   Whether to perform any conversions on the request, such as converting it
/// to lowercase, before inspecting it for the specified string.
class RegexMatchTuple {
  /// Specifies where in a web request to look for the `RegexPatternSet`.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that
  /// attackers use in web requests in an effort to bypass AWS WAF. If you
  /// specify a transformation, AWS WAF performs the transformation on
  /// `RegexPatternSet` before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  ///  **CMD_LINE**
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// commandline command and using unusual formatting to disguise some or all
  /// of the command, use this option to perform the following transformations:
  ///
  /// *   Delete the following characters:  " ' ^
  ///
  /// *   Delete spaces before the following characters: / (
  ///
  /// *   Replace the following characters with a space: , ;
  ///
  /// *   Replace multiple spaces with one space
  ///
  /// *   Convert uppercase letters (A-Z) to lowercase (a-z)
  ///
  ///
  ///  **COMPRESS_WHITE_SPACE**
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// *   f, formfeed, decimal 12
  ///
  /// *   t, tab, decimal 9
  ///
  /// *   n, newline, decimal 10
  ///
  /// *   r, carriage return, decimal 13
  ///
  /// *   v, vertical tab, decimal 11
  ///
  /// *   non-breaking space, decimal 160
  ///
  ///
  ///  `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
  ///
  ///  **HTML_ENTITY_DECODE**
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. `HTML_ENTITY_DECODE` performs the following operations:
  ///
  /// *   Replaces `(ampersand)quot;` with `"`
  ///
  /// *   Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
  ///
  /// *   Replaces `(ampersand)lt;` with a "less than" symbol
  ///
  /// *   Replaces `(ampersand)gt;` with `>`
  ///
  /// *   Replaces characters that are represented in hexadecimal format,
  /// `(ampersand)#xhhhh;`, with the corresponding characters
  ///
  /// *   Replaces characters that are represented in decimal format,
  /// `(ampersand)#nnnn;`, with the corresponding characters
  ///
  ///
  ///  **LOWERCASE**
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  ///  **URL_DECODE**
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  ///  **NONE**
  ///
  /// Specify `NONE` if you don't want to perform any text transformations.
  final String textTransformation;

  /// The `RegexPatternSetId` for a `RegexPatternSet`. You use
  /// `RegexPatternSetId` to get information about a `RegexPatternSet` (see
  /// GetRegexPatternSet), update a `RegexPatternSet` (see
  /// UpdateRegexPatternSet), insert a `RegexPatternSet` into a `RegexMatchSet`
  /// or delete one from a `RegexMatchSet` (see UpdateRegexMatchSet), and delete
  /// an `RegexPatternSet` from AWS WAF (see DeleteRegexPatternSet).
  ///
  ///  `RegexPatternSetId` is returned by CreateRegexPatternSet and by
  /// ListRegexPatternSets.
  final String regexPatternSetId;

  RegexMatchTuple({
    @required this.fieldToMatch,
    @required this.textTransformation,
    @required this.regexPatternSetId,
  });
  static RegexMatchTuple fromJson(Map<String, dynamic> json) => RegexMatchTuple(
        fieldToMatch: FieldToMatch.fromJson(json['FieldToMatch']),
        textTransformation: json['TextTransformation'] as String,
        regexPatternSetId: json['RegexPatternSetId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The `RegexPatternSet` specifies the regular expression (regex) pattern that
/// you want AWS WAF to search for, such as `B[a@]dB[o0]t`. You can then
/// configure AWS WAF to reject those requests.
class RegexPatternSet {
  /// The identifier for the `RegexPatternSet`. You use `RegexPatternSetId` to
  /// get information about a `RegexPatternSet`, update a `RegexPatternSet`,
  /// remove a `RegexPatternSet` from a `RegexMatchSet`, and delete a
  /// `RegexPatternSet` from AWS WAF.
  ///
  ///  `RegexMatchSetId` is returned by CreateRegexPatternSet and by
  /// ListRegexPatternSets.
  final String regexPatternSetId;

  /// A friendly name or description of the RegexPatternSet. You can't change
  /// `Name` after you create a `RegexPatternSet`.
  final String name;

  /// Specifies the regular expression (regex) patterns that you want AWS WAF to
  /// search for, such as `B[a@]dB[o0]t`.
  final List<String> regexPatternStrings;

  RegexPatternSet({
    @required this.regexPatternSetId,
    this.name,
    @required this.regexPatternStrings,
  });
  static RegexPatternSet fromJson(Map<String, dynamic> json) => RegexPatternSet(
        regexPatternSetId: json['RegexPatternSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        regexPatternStrings: (json['RegexPatternStrings'] as List)
            .map((e) => e as String)
            .toList(),
      );
}

/// Returned by ListRegexPatternSets. Each `RegexPatternSetSummary` object
/// includes the `Name` and `RegexPatternSetId` for one RegexPatternSet.
class RegexPatternSetSummary {
  /// The `RegexPatternSetId` for a `RegexPatternSet`. You use
  /// `RegexPatternSetId` to get information about a `RegexPatternSet`, update a
  /// `RegexPatternSet`, remove a `RegexPatternSet` from a `RegexMatchSet`, and
  /// delete a `RegexPatternSet` from AWS WAF.
  ///
  ///  `RegexPatternSetId` is returned by CreateRegexPatternSet and by
  /// ListRegexPatternSets.
  final String regexPatternSetId;

  /// A friendly name or description of the RegexPatternSet. You can't change
  /// `Name` after you create a `RegexPatternSet`.
  final String name;

  RegexPatternSetSummary({
    @required this.regexPatternSetId,
    @required this.name,
  });
  static RegexPatternSetSummary fromJson(Map<String, dynamic> json) =>
      RegexPatternSetSummary(
        regexPatternSetId: json['RegexPatternSetId'] as String,
        name: json['Name'] as String,
      );
}

/// In an UpdateRegexPatternSet request, `RegexPatternSetUpdate` specifies
/// whether to insert or delete a `RegexPatternString` and includes the settings
/// for the `RegexPatternString`.
class RegexPatternSetUpdate {
  /// Specifies whether to insert or delete a `RegexPatternString`.
  final String action;

  /// Specifies the regular expression (regex) pattern that you want AWS WAF to
  /// search for, such as `B[a@]dB[o0]t`.
  final String regexPatternString;

  RegexPatternSetUpdate({
    @required this.action,
    @required this.regexPatternString,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A combination of ByteMatchSet, IPSet, and/or SqlInjectionMatchSet objects
/// that identify the web requests that you want to allow, block, or count. For
/// example, you might create a `Rule` that includes the following predicates:
///
/// *   An `IPSet` that causes AWS WAF to search for web requests that originate
/// from the IP address `192.0.2.44`
///
/// *   A `ByteMatchSet` that causes AWS WAF to search for web requests for
/// which the value of the `User-Agent` header is `BadBot`.
///
///
/// To match the settings in this `Rule`, a request must originate from
/// `192.0.2.44` AND include a `User-Agent` header for which the value is
/// `BadBot`.
class Rule {
  /// A unique identifier for a `Rule`. You use `RuleId` to get more information
  /// about a `Rule` (see GetRule), update a `Rule` (see UpdateRule), insert a
  /// `Rule` into a `WebACL` or delete a one from a `WebACL` (see UpdateWebACL),
  /// or delete a `Rule` from AWS WAF (see DeleteRule).
  ///
  ///  `RuleId` is returned by CreateRule and by ListRules.
  final String ruleId;

  /// The friendly name or description for the `Rule`. You can't change the name
  /// of a `Rule` after you create it.
  final String name;

  /// A friendly name or description for the metrics for this `Rule`. The name
  /// can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum
  /// length 128 and minimum length one. It can't contain whitespace or metric
  /// names reserved for AWS WAF, including "All" and "Default_Action." You
  /// can't change `MetricName` after you create the `Rule`.
  final String metricName;

  /// The `Predicates` object contains one `Predicate` element for each
  /// ByteMatchSet, IPSet, or SqlInjectionMatchSet object that you want to
  /// include in a `Rule`.
  final List<Predicate> predicates;

  Rule({
    @required this.ruleId,
    this.name,
    this.metricName,
    @required this.predicates,
  });
  static Rule fromJson(Map<String, dynamic> json) => Rule(
        ruleId: json['RuleId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        predicates: (json['Predicates'] as List)
            .map((e) => Predicate.fromJson(e))
            .toList(),
      );
}

/// A collection of predefined rules that you can add to a web ACL.
///
/// Rule groups are subject to the following limits:
///
/// *   Three rule groups per account. You can request an increase to this limit
/// by contacting customer support.
///
/// *   One rule group per web ACL.
///
/// *   Ten rules per rule group.
class RuleGroup {
  /// A unique identifier for a `RuleGroup`. You use `RuleGroupId` to get more
  /// information about a `RuleGroup` (see GetRuleGroup), update a `RuleGroup`
  /// (see UpdateRuleGroup), insert a `RuleGroup` into a `WebACL` or delete a
  /// one from a `WebACL` (see UpdateWebACL), or delete a `RuleGroup` from AWS
  /// WAF (see DeleteRuleGroup).
  ///
  ///  `RuleGroupId` is returned by CreateRuleGroup and by ListRuleGroups.
  final String ruleGroupId;

  /// The friendly name or description for the `RuleGroup`. You can't change the
  /// name of a `RuleGroup` after you create it.
  final String name;

  /// A friendly name or description for the metrics for this `RuleGroup`. The
  /// name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action."
  /// You can't change the name of the metric after you create the `RuleGroup`.
  final String metricName;

  RuleGroup({
    @required this.ruleGroupId,
    this.name,
    this.metricName,
  });
  static RuleGroup fromJson(Map<String, dynamic> json) => RuleGroup(
        ruleGroupId: json['RuleGroupId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
      );
}

/// Contains the identifier and the friendly name or description of the
/// `RuleGroup`.
class RuleGroupSummary {
  /// A unique identifier for a `RuleGroup`. You use `RuleGroupId` to get more
  /// information about a `RuleGroup` (see GetRuleGroup), update a `RuleGroup`
  /// (see UpdateRuleGroup), insert a `RuleGroup` into a `WebACL` or delete one
  /// from a `WebACL` (see UpdateWebACL), or delete a `RuleGroup` from AWS WAF
  /// (see DeleteRuleGroup).
  ///
  ///  `RuleGroupId` is returned by CreateRuleGroup and by ListRuleGroups.
  final String ruleGroupId;

  /// A friendly name or description of the RuleGroup. You can't change the name
  /// of a `RuleGroup` after you create it.
  final String name;

  RuleGroupSummary({
    @required this.ruleGroupId,
    @required this.name,
  });
  static RuleGroupSummary fromJson(Map<String, dynamic> json) =>
      RuleGroupSummary(
        ruleGroupId: json['RuleGroupId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies an `ActivatedRule` and indicates whether you want to add it to a
/// `RuleGroup` or delete it from a `RuleGroup`.
class RuleGroupUpdate {
  /// Specify `INSERT` to add an `ActivatedRule` to a `RuleGroup`. Use `DELETE`
  /// to remove an `ActivatedRule` from a `RuleGroup`.
  final String action;

  /// The `ActivatedRule` object specifies a `Rule` that you want to insert or
  /// delete, the priority of the `Rule` in the `WebACL`, and the action that
  /// you want AWS WAF to take when a web request matches the `Rule` (`ALLOW`,
  /// `BLOCK`, or `COUNT`).
  final ActivatedRule activatedRule;

  RuleGroupUpdate({
    @required this.action,
    @required this.activatedRule,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the identifier and the friendly name or description of the `Rule`.
class RuleSummary {
  /// A unique identifier for a `Rule`. You use `RuleId` to get more information
  /// about a `Rule` (see GetRule), update a `Rule` (see UpdateRule), insert a
  /// `Rule` into a `WebACL` or delete one from a `WebACL` (see UpdateWebACL),
  /// or delete a `Rule` from AWS WAF (see DeleteRule).
  ///
  ///  `RuleId` is returned by CreateRule and by ListRules.
  final String ruleId;

  /// A friendly name or description of the Rule. You can't change the name of a
  /// `Rule` after you create it.
  final String name;

  RuleSummary({
    @required this.ruleId,
    @required this.name,
  });
  static RuleSummary fromJson(Map<String, dynamic> json) => RuleSummary(
        ruleId: json['RuleId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies a `Predicate` (such as an `IPSet`) and indicates whether you want
/// to add it to a `Rule` or delete it from a `Rule`.
class RuleUpdate {
  /// Specify `INSERT` to add a `Predicate` to a `Rule`. Use `DELETE` to remove
  /// a `Predicate` from a `Rule`.
  final String action;

  /// The ID of the `Predicate` (such as an `IPSet`) that you want to add to a
  /// `Rule`.
  final Predicate predicate;

  RuleUpdate({
    @required this.action,
    @required this.predicate,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The response from a GetSampledRequests request includes a
/// `SampledHTTPRequests` complex type that appears as `SampledRequests` in the
/// response syntax. `SampledHTTPRequests` contains one `SampledHTTPRequest`
/// object for each web request that is returned by `GetSampledRequests`.
class SampledHttpRequest {
  /// A complex type that contains detailed information about the request.
  final HttpRequest request;

  /// A value that indicates how one result in the response relates
  /// proportionally to other results in the response. A result that has a
  /// weight of `2` represents roughly twice as many CloudFront web requests as
  /// a result that has a weight of `1`.
  final BigInt weight;

  /// The time at which AWS WAF received the request from your AWS resource, in
  /// Unix time format (in seconds).
  final DateTime timestamp;

  /// The action for the `Rule` that the request matched: `ALLOW`, `BLOCK`, or
  /// `COUNT`.
  final String action;

  /// This value is returned if the `GetSampledRequests` request specifies the
  /// ID of a `RuleGroup` rather than the ID of an individual rule.
  /// `RuleWithinRuleGroup` is the rule within the specified `RuleGroup` that
  /// matched the request listed in the response.
  final String ruleWithinRuleGroup;

  SampledHttpRequest({
    @required this.request,
    @required this.weight,
    this.timestamp,
    this.action,
    this.ruleWithinRuleGroup,
  });
  static SampledHttpRequest fromJson(Map<String, dynamic> json) =>
      SampledHttpRequest(
        request: HttpRequest.fromJson(json['Request']),
        weight: BigInt.from(json['Weight']),
        timestamp: json.containsKey('Timestamp')
            ? DateTime.parse(json['Timestamp'])
            : null,
        action: json.containsKey('Action') ? json['Action'] as String : null,
        ruleWithinRuleGroup: json.containsKey('RuleWithinRuleGroup')
            ? json['RuleWithinRuleGroup'] as String
            : null,
      );
}

/// Specifies a constraint on the size of a part of the web request. AWS WAF
/// uses the `Size`, `ComparisonOperator`, and `FieldToMatch` to build an
/// expression in the form of "`Size` `ComparisonOperator` size in bytes of
/// `FieldToMatch`". If that expression is true, the `SizeConstraint` is
/// considered to match.
class SizeConstraint {
  /// Specifies where in a web request to look for the size constraint.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that
  /// attackers use in web requests in an effort to bypass AWS WAF. If you
  /// specify a transformation, AWS WAF performs the transformation on
  /// `FieldToMatch` before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  /// Note that if you choose `BODY` for the value of `Type`, you must choose
  /// `NONE` for `TextTransformation` because CloudFront forwards only the first
  /// 8192 bytes for inspection.
  ///
  ///  **NONE**
  ///
  /// Specify `NONE` if you don't want to perform any text transformations.
  ///
  ///  **CMD_LINE**
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all
  /// of the command, use this option to perform the following transformations:
  ///
  /// *   Delete the following characters:  " ' ^
  ///
  /// *   Delete spaces before the following characters: / (
  ///
  /// *   Replace the following characters with a space: , ;
  ///
  /// *   Replace multiple spaces with one space
  ///
  /// *   Convert uppercase letters (A-Z) to lowercase (a-z)
  ///
  ///
  ///  **COMPRESS_WHITE_SPACE**
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// *   f, formfeed, decimal 12
  ///
  /// *   t, tab, decimal 9
  ///
  /// *   n, newline, decimal 10
  ///
  /// *   r, carriage return, decimal 13
  ///
  /// *   v, vertical tab, decimal 11
  ///
  /// *   non-breaking space, decimal 160
  ///
  ///
  ///  `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
  ///
  ///  **HTML_ENTITY_DECODE**
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. `HTML_ENTITY_DECODE` performs the following operations:
  ///
  /// *   Replaces `(ampersand)quot;` with `"`
  ///
  /// *   Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
  ///
  /// *   Replaces `(ampersand)lt;` with a "less than" symbol
  ///
  /// *   Replaces `(ampersand)gt;` with `>`
  ///
  /// *   Replaces characters that are represented in hexadecimal format,
  /// `(ampersand)#xhhhh;`, with the corresponding characters
  ///
  /// *   Replaces characters that are represented in decimal format,
  /// `(ampersand)#nnnn;`, with the corresponding characters
  ///
  ///
  ///  **LOWERCASE**
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  ///  **URL_DECODE**
  ///
  /// Use this option to decode a URL-encoded value.
  final String textTransformation;

  /// The type of comparison you want AWS WAF to perform. AWS WAF uses this in
  /// combination with the provided `Size` and `FieldToMatch` to build an
  /// expression in the form of "`Size` `ComparisonOperator` size in bytes of
  /// `FieldToMatch`". If that expression is true, the `SizeConstraint` is
  /// considered to match.
  ///
  ///  **EQ**: Used to test if the `Size` is equal to the size of the
  /// `FieldToMatch`
  ///
  ///  **NE**: Used to test if the `Size` is not equal to the size of the
  /// `FieldToMatch`
  ///
  ///  **LE**: Used to test if the `Size` is less than or equal to the size of
  /// the `FieldToMatch`
  ///
  ///  **LT**: Used to test if the `Size` is strictly less than the size of the
  /// `FieldToMatch`
  ///
  ///  **GE**: Used to test if the `Size` is greater than or equal to the size
  /// of the `FieldToMatch`
  ///
  ///  **GT**: Used to test if the `Size` is strictly greater than the size of
  /// the `FieldToMatch`
  final String comparisonOperator;

  /// The size in bytes that you want AWS WAF to compare against the size of the
  /// specified `FieldToMatch`. AWS WAF uses this in combination with
  /// `ComparisonOperator` and `FieldToMatch` to build an expression in the form
  /// of "`Size` `ComparisonOperator` size in bytes of `FieldToMatch`". If that
  /// expression is true, the `SizeConstraint` is considered to match.
  ///
  /// Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).
  ///
  /// If you specify `URI` for the value of `Type`, the / in the URI counts as
  /// one character. For example, the URI `/logo.jpg` is nine characters long.
  final BigInt size;

  SizeConstraint({
    @required this.fieldToMatch,
    @required this.textTransformation,
    @required this.comparisonOperator,
    @required this.size,
  });
  static SizeConstraint fromJson(Map<String, dynamic> json) => SizeConstraint(
        fieldToMatch: FieldToMatch.fromJson(json['FieldToMatch']),
        textTransformation: json['TextTransformation'] as String,
        comparisonOperator: json['ComparisonOperator'] as String,
        size: BigInt.from(json['Size']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains `SizeConstraint` objects, which specify the
/// parts of web requests that you want AWS WAF to inspect the size of. If a
/// `SizeConstraintSet` contains more than one `SizeConstraint` object, a
/// request only needs to match one constraint to be considered a match.
class SizeConstraintSet {
  /// A unique identifier for a `SizeConstraintSet`. You use
  /// `SizeConstraintSetId` to get information about a `SizeConstraintSet` (see
  /// GetSizeConstraintSet), update a `SizeConstraintSet` (see
  /// UpdateSizeConstraintSet), insert a `SizeConstraintSet` into a `Rule` or
  /// delete one from a `Rule` (see UpdateRule), and delete a
  /// `SizeConstraintSet` from AWS WAF (see DeleteSizeConstraintSet).
  ///
  ///  `SizeConstraintSetId` is returned by CreateSizeConstraintSet and by
  /// ListSizeConstraintSets.
  final String sizeConstraintSetId;

  /// The name, if any, of the `SizeConstraintSet`.
  final String name;

  /// Specifies the parts of web requests that you want to inspect the size of.
  final List<SizeConstraint> sizeConstraints;

  SizeConstraintSet({
    @required this.sizeConstraintSetId,
    this.name,
    @required this.sizeConstraints,
  });
  static SizeConstraintSet fromJson(Map<String, dynamic> json) =>
      SizeConstraintSet(
        sizeConstraintSetId: json['SizeConstraintSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        sizeConstraints: (json['SizeConstraints'] as List)
            .map((e) => SizeConstraint.fromJson(e))
            .toList(),
      );
}

/// The `Id` and `Name` of a `SizeConstraintSet`.
class SizeConstraintSetSummary {
  /// A unique identifier for a `SizeConstraintSet`. You use
  /// `SizeConstraintSetId` to get information about a `SizeConstraintSet` (see
  /// GetSizeConstraintSet), update a `SizeConstraintSet` (see
  /// UpdateSizeConstraintSet), insert a `SizeConstraintSet` into a `Rule` or
  /// delete one from a `Rule` (see UpdateRule), and delete a
  /// `SizeConstraintSet` from AWS WAF (see DeleteSizeConstraintSet).
  ///
  ///  `SizeConstraintSetId` is returned by CreateSizeConstraintSet and by
  /// ListSizeConstraintSets.
  final String sizeConstraintSetId;

  /// The name of the `SizeConstraintSet`, if any.
  final String name;

  SizeConstraintSetSummary({
    @required this.sizeConstraintSetId,
    @required this.name,
  });
  static SizeConstraintSetSummary fromJson(Map<String, dynamic> json) =>
      SizeConstraintSetSummary(
        sizeConstraintSetId: json['SizeConstraintSetId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies the part of a web request that you want to inspect the size of and
/// indicates whether you want to add the specification to a SizeConstraintSet
/// or delete it from a `SizeConstraintSet`.
class SizeConstraintSetUpdate {
  /// Specify `INSERT` to add a SizeConstraintSetUpdate to a SizeConstraintSet.
  /// Use `DELETE` to remove a `SizeConstraintSetUpdate` from a
  /// `SizeConstraintSet`.
  final String action;

  /// Specifies a constraint on the size of a part of the web request. AWS WAF
  /// uses the `Size`, `ComparisonOperator`, and `FieldToMatch` to build an
  /// expression in the form of "`Size` `ComparisonOperator` size in bytes of
  /// `FieldToMatch`". If that expression is true, the `SizeConstraint` is
  /// considered to match.
  final SizeConstraint sizeConstraint;

  SizeConstraintSetUpdate({
    @required this.action,
    @required this.sizeConstraint,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains `SqlInjectionMatchTuple` objects, which specify
/// the parts of web requests that you want AWS WAF to inspect for snippets of
/// malicious SQL code and, if you want AWS WAF to inspect a header, the name of
/// the header. If a `SqlInjectionMatchSet` contains more than one
/// `SqlInjectionMatchTuple` object, a request needs to include snippets of SQL
/// code in only one of the specified parts of the request to be considered a
/// match.
class SqlInjectionMatchSet {
  /// A unique identifier for a `SqlInjectionMatchSet`. You use
  /// `SqlInjectionMatchSetId` to get information about a `SqlInjectionMatchSet`
  /// (see GetSqlInjectionMatchSet), update a `SqlInjectionMatchSet` (see
  /// UpdateSqlInjectionMatchSet), insert a `SqlInjectionMatchSet` into a `Rule`
  /// or delete one from a `Rule` (see UpdateRule), and delete a
  /// `SqlInjectionMatchSet` from AWS WAF (see DeleteSqlInjectionMatchSet).
  ///
  ///  `SqlInjectionMatchSetId` is returned by CreateSqlInjectionMatchSet and by
  /// ListSqlInjectionMatchSets.
  final String sqlInjectionMatchSetId;

  /// The name, if any, of the `SqlInjectionMatchSet`.
  final String name;

  /// Specifies the parts of web requests that you want to inspect for snippets
  /// of malicious SQL code.
  final List<SqlInjectionMatchTuple> sqlInjectionMatchTuples;

  SqlInjectionMatchSet({
    @required this.sqlInjectionMatchSetId,
    this.name,
    @required this.sqlInjectionMatchTuples,
  });
  static SqlInjectionMatchSet fromJson(Map<String, dynamic> json) =>
      SqlInjectionMatchSet(
        sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        sqlInjectionMatchTuples: (json['SqlInjectionMatchTuples'] as List)
            .map((e) => SqlInjectionMatchTuple.fromJson(e))
            .toList(),
      );
}

/// The `Id` and `Name` of a `SqlInjectionMatchSet`.
class SqlInjectionMatchSetSummary {
  /// A unique identifier for a `SqlInjectionMatchSet`. You use
  /// `SqlInjectionMatchSetId` to get information about a `SqlInjectionMatchSet`
  /// (see GetSqlInjectionMatchSet), update a `SqlInjectionMatchSet` (see
  /// UpdateSqlInjectionMatchSet), insert a `SqlInjectionMatchSet` into a `Rule`
  /// or delete one from a `Rule` (see UpdateRule), and delete a
  /// `SqlInjectionMatchSet` from AWS WAF (see DeleteSqlInjectionMatchSet).
  ///
  ///  `SqlInjectionMatchSetId` is returned by CreateSqlInjectionMatchSet and by
  /// ListSqlInjectionMatchSets.
  final String sqlInjectionMatchSetId;

  /// The name of the `SqlInjectionMatchSet`, if any, specified by `Id`.
  final String name;

  SqlInjectionMatchSetSummary({
    @required this.sqlInjectionMatchSetId,
    @required this.name,
  });
  static SqlInjectionMatchSetSummary fromJson(Map<String, dynamic> json) =>
      SqlInjectionMatchSetSummary(
        sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies the part of a web request that you want to inspect for snippets of
/// malicious SQL code and indicates whether you want to add the specification
/// to a SqlInjectionMatchSet or delete it from a `SqlInjectionMatchSet`.
class SqlInjectionMatchSetUpdate {
  /// Specify `INSERT` to add a SqlInjectionMatchSetUpdate to a
  /// SqlInjectionMatchSet. Use `DELETE` to remove a
  /// `SqlInjectionMatchSetUpdate` from a `SqlInjectionMatchSet`.
  final String action;

  /// Specifies the part of a web request that you want AWS WAF to inspect for
  /// snippets of malicious SQL code and, if you want AWS WAF to inspect a
  /// header, the name of the header.
  final SqlInjectionMatchTuple sqlInjectionMatchTuple;

  SqlInjectionMatchSetUpdate({
    @required this.action,
    @required this.sqlInjectionMatchTuple,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the part of a web request that you want AWS WAF to inspect for
/// snippets of malicious SQL code and, if you want AWS WAF to inspect a header,
/// the name of the header.
class SqlInjectionMatchTuple {
  /// Specifies where in a web request to look for snippets of malicious SQL
  /// code.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that
  /// attackers use in web requests in an effort to bypass AWS WAF. If you
  /// specify a transformation, AWS WAF performs the transformation on
  /// `FieldToMatch` before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  ///  **CMD_LINE**
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all
  /// of the command, use this option to perform the following transformations:
  ///
  /// *   Delete the following characters:  " ' ^
  ///
  /// *   Delete spaces before the following characters: / (
  ///
  /// *   Replace the following characters with a space: , ;
  ///
  /// *   Replace multiple spaces with one space
  ///
  /// *   Convert uppercase letters (A-Z) to lowercase (a-z)
  ///
  ///
  ///  **COMPRESS_WHITE_SPACE**
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// *   f, formfeed, decimal 12
  ///
  /// *   t, tab, decimal 9
  ///
  /// *   n, newline, decimal 10
  ///
  /// *   r, carriage return, decimal 13
  ///
  /// *   v, vertical tab, decimal 11
  ///
  /// *   non-breaking space, decimal 160
  ///
  ///
  ///  `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
  ///
  ///  **HTML_ENTITY_DECODE**
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. `HTML_ENTITY_DECODE` performs the following operations:
  ///
  /// *   Replaces `(ampersand)quot;` with `"`
  ///
  /// *   Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
  ///
  /// *   Replaces `(ampersand)lt;` with a "less than" symbol
  ///
  /// *   Replaces `(ampersand)gt;` with `>`
  ///
  /// *   Replaces characters that are represented in hexadecimal format,
  /// `(ampersand)#xhhhh;`, with the corresponding characters
  ///
  /// *   Replaces characters that are represented in decimal format,
  /// `(ampersand)#nnnn;`, with the corresponding characters
  ///
  ///
  ///  **LOWERCASE**
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  ///  **URL_DECODE**
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  ///  **NONE**
  ///
  /// Specify `NONE` if you don't want to perform any text transformations.
  final String textTransformation;

  SqlInjectionMatchTuple({
    @required this.fieldToMatch,
    @required this.textTransformation,
  });
  static SqlInjectionMatchTuple fromJson(Map<String, dynamic> json) =>
      SqlInjectionMatchTuple(
        fieldToMatch: FieldToMatch.fromJson(json['FieldToMatch']),
        textTransformation: json['TextTransformation'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A summary of the rule groups you are subscribed to.
class SubscribedRuleGroupSummary {
  /// A unique identifier for a `RuleGroup`.
  final String ruleGroupId;

  /// A friendly name or description of the `RuleGroup`. You can't change the
  /// name of a `RuleGroup` after you create it.
  final String name;

  /// A friendly name or description for the metrics for this `RuleGroup`. The
  /// name can contain only alphanumeric characters (A-Z, a-z, 0-9), with
  /// maximum length 128 and minimum length one. It can't contain whitespace or
  /// metric names reserved for AWS WAF, including "All" and "Default_Action."
  /// You can't change the name of the metric after you create the `RuleGroup`.
  final String metricName;

  SubscribedRuleGroupSummary({
    @required this.ruleGroupId,
    @required this.name,
    @required this.metricName,
  });
  static SubscribedRuleGroupSummary fromJson(Map<String, dynamic> json) =>
      SubscribedRuleGroupSummary(
        ruleGroupId: json['RuleGroupId'] as String,
        name: json['Name'] as String,
        metricName: json['MetricName'] as String,
      );
}

class Tag {
  final String key;

  final String value;

  Tag({
    this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag(
        key: json.containsKey('Key') ? json['Key'] as String : null,
        value: json.containsKey('Value') ? json['Value'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class TagInfoForResource {
  final String resourceArn;

  final List<Tag> tagList;

  TagInfoForResource({
    this.resourceArn,
    this.tagList,
  });
  static TagInfoForResource fromJson(Map<String, dynamic> json) =>
      TagInfoForResource(
        resourceArn: json.containsKey('ResourceARN')
            ? json['ResourceARN'] as String
            : null,
        tagList: json.containsKey('TagList')
            ? (json['TagList'] as List).map((e) => Tag.fromJson(e)).toList()
            : null,
      );
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

/// In a GetSampledRequests request, the `StartTime` and `EndTime` objects
/// specify the time range for which you want AWS WAF to return a sample of web
/// requests.
///
/// In a GetSampledRequests response, the `StartTime` and `EndTime` objects
/// specify the time range for which AWS WAF actually returned a sample of web
/// requests. AWS WAF gets the specified number of requests from among the first
/// 5,000 requests that your AWS resource receives during the specified time
/// period. If your resource receives more than 5,000 requests during that
/// period, AWS WAF stops sampling after the 5,000th request. In that case,
/// `EndTime` is the time that AWS WAF received the 5,000th request.
class TimeWindow {
  /// The beginning of the time range from which you want `GetSampledRequests`
  /// to return a sample of the requests that your AWS resource received.
  /// Specify the date and time in the following format: `"2016-09-27T14:50Z"`.
  /// You can specify any time range in the previous three hours.
  final DateTime startTime;

  /// The end of the time range from which you want `GetSampledRequests` to
  /// return a sample of the requests that your AWS resource received. Specify
  /// the date and time in the following format: `"2016-09-27T14:50Z"`. You can
  /// specify any time range in the previous three hours.
  final DateTime endTime;

  TimeWindow({
    @required this.startTime,
    @required this.endTime,
  });
  static TimeWindow fromJson(Map<String, dynamic> json) => TimeWindow(
        startTime: DateTime.parse(json['StartTime']),
        endTime: DateTime.parse(json['EndTime']),
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateByteMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateByteMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateByteMatchSetResponse({
    this.changeToken,
  });
  static UpdateByteMatchSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateByteMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateGeoMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateGeoMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateGeoMatchSetResponse({
    this.changeToken,
  });
  static UpdateGeoMatchSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateGeoMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateIPSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateIPSet` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateIPSetResponse({
    this.changeToken,
  });
  static UpdateIPSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateIPSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateRateBasedRuleResponse {
  /// The `ChangeToken` that you used to submit the `UpdateRateBasedRule`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateRateBasedRuleResponse({
    this.changeToken,
  });
  static UpdateRateBasedRuleResponse fromJson(Map<String, dynamic> json) =>
      UpdateRateBasedRuleResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateRegexMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateRegexMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateRegexMatchSetResponse({
    this.changeToken,
  });
  static UpdateRegexMatchSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateRegexMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateRegexPatternSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateRegexPatternSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateRegexPatternSetResponse({
    this.changeToken,
  });
  static UpdateRegexPatternSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateRegexPatternSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateRuleGroupResponse {
  /// The `ChangeToken` that you used to submit the `UpdateRuleGroup` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateRuleGroupResponse({
    this.changeToken,
  });
  static UpdateRuleGroupResponse fromJson(Map<String, dynamic> json) =>
      UpdateRuleGroupResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateRuleResponse {
  /// The `ChangeToken` that you used to submit the `UpdateRule` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateRuleResponse({
    this.changeToken,
  });
  static UpdateRuleResponse fromJson(Map<String, dynamic> json) =>
      UpdateRuleResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateSizeConstraintSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateSizeConstraintSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateSizeConstraintSetResponse({
    this.changeToken,
  });
  static UpdateSizeConstraintSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateSizeConstraintSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to an UpdateSqlInjectionMatchSets request.
class UpdateSqlInjectionMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateSqlInjectionMatchSet`
  /// request. You can also use this value to query the status of the request.
  /// For more information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateSqlInjectionMatchSetResponse({
    this.changeToken,
  });
  static UpdateSqlInjectionMatchSetResponse fromJson(
          Map<String, dynamic> json) =>
      UpdateSqlInjectionMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

class UpdateWebAclResponse {
  /// The `ChangeToken` that you used to submit the `UpdateWebACL` request. You
  /// can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateWebAclResponse({
    this.changeToken,
  });
  static UpdateWebAclResponse fromJson(Map<String, dynamic> json) =>
      UpdateWebAclResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// The response to an UpdateXssMatchSets request.
class UpdateXssMatchSetResponse {
  /// The `ChangeToken` that you used to submit the `UpdateXssMatchSet` request.
  /// You can also use this value to query the status of the request. For more
  /// information, see GetChangeTokenStatus.
  final String changeToken;

  UpdateXssMatchSetResponse({
    this.changeToken,
  });
  static UpdateXssMatchSetResponse fromJson(Map<String, dynamic> json) =>
      UpdateXssMatchSetResponse(
        changeToken: json.containsKey('ChangeToken')
            ? json['ChangeToken'] as String
            : null,
      );
}

/// For the action that is associated with a rule in a `WebACL`, specifies the
/// action that you want AWS WAF to perform when a web request matches all of
/// the conditions in a rule. For the default action in a `WebACL`, specifies
/// the action that you want AWS WAF to take when a web request doesn't match
/// all of the conditions in any of the rules in a `WebACL`.
class WafAction {
  /// Specifies how you want AWS WAF to respond to requests that match the
  /// settings in a `Rule`. Valid settings include the following:
  ///
  /// *    `ALLOW`: AWS WAF allows requests
  ///
  /// *    `BLOCK`: AWS WAF blocks requests
  ///
  /// *    `COUNT`: AWS WAF increments a counter of the requests that match all
  /// of the conditions in the rule. AWS WAF then continues to inspect the web
  /// request based on the remaining rules in the web ACL. You can't specify
  /// `COUNT` for the default action for a `WebACL`.
  final String type;

  WafAction({
    @required this.type,
  });
  static WafAction fromJson(Map<String, dynamic> json) => WafAction(
        type: json['Type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// The action to take if any rule within the `RuleGroup` matches a request.
class WafOverrideAction {
  ///  `COUNT` overrides the action specified by the individual rule within a
  /// `RuleGroup` . If set to `NONE`, the rule's action will take place.
  final String type;

  WafOverrideAction({
    @required this.type,
  });
  static WafOverrideAction fromJson(Map<String, dynamic> json) =>
      WafOverrideAction(
        type: json['Type'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Contains the `Rules` that identify the requests that you want to allow,
/// block, or count. In a `WebACL`, you also specify a default action (`ALLOW`
/// or `BLOCK`), and the action for each `Rule` that you add to a `WebACL`, for
/// example, block requests from specified IP addresses or block requests from
/// specified referrers. You also associate the `WebACL` with a CloudFront
/// distribution to identify the requests that you want AWS WAF to filter. If
/// you add more than one `Rule` to a `WebACL`, a request needs to match only
/// one of the specifications to be allowed, blocked, or counted. For more
/// information, see UpdateWebACL.
class WebAcl {
  /// A unique identifier for a `WebACL`. You use `WebACLId` to get information
  /// about a `WebACL` (see GetWebACL), update a `WebACL` (see UpdateWebACL),
  /// and delete a `WebACL` from AWS WAF (see DeleteWebACL).
  ///
  ///  `WebACLId` is returned by CreateWebACL and by ListWebACLs.
  final String webAclId;

  /// A friendly name or description of the `WebACL`. You can't change the name
  /// of a `WebACL` after you create it.
  final String name;

  /// A friendly name or description for the metrics for this `WebACL`. The name
  /// can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum
  /// length 128 and minimum length one. It can't contain whitespace or metric
  /// names reserved for AWS WAF, including "All" and "Default_Action." You
  /// can't change `MetricName` after you create the `WebACL`.
  final String metricName;

  /// The action to perform if none of the `Rules` contained in the `WebACL`
  /// match. The action is specified by the WafAction object.
  final WafAction defaultAction;

  /// An array that contains the action for each `Rule` in a `WebACL`, the
  /// priority of the `Rule`, and the ID of the `Rule`.
  final List<ActivatedRule> rules;

  /// Tha Amazon Resource Name (ARN) of the web ACL.
  final String webAclArn;

  WebAcl({
    @required this.webAclId,
    this.name,
    this.metricName,
    @required this.defaultAction,
    @required this.rules,
    this.webAclArn,
  });
  static WebAcl fromJson(Map<String, dynamic> json) => WebAcl(
        webAclId: json['WebACLId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        defaultAction: WafAction.fromJson(json['DefaultAction']),
        rules: (json['Rules'] as List)
            .map((e) => ActivatedRule.fromJson(e))
            .toList(),
        webAclArn:
            json.containsKey('WebACLArn') ? json['WebACLArn'] as String : null,
      );
}

/// Contains the identifier and the name or description of the WebACL.
class WebAclSummary {
  /// A unique identifier for a `WebACL`. You use `WebACLId` to get information
  /// about a `WebACL` (see GetWebACL), update a `WebACL` (see UpdateWebACL),
  /// and delete a `WebACL` from AWS WAF (see DeleteWebACL).
  ///
  ///  `WebACLId` is returned by CreateWebACL and by ListWebACLs.
  final String webAclId;

  /// A friendly name or description of the WebACL. You can't change the name of
  /// a `WebACL` after you create it.
  final String name;

  WebAclSummary({
    @required this.webAclId,
    @required this.name,
  });
  static WebAclSummary fromJson(Map<String, dynamic> json) => WebAclSummary(
        webAclId: json['WebACLId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies whether to insert a `Rule` into or delete a `Rule` from a
/// `WebACL`.
class WebAclUpdate {
  /// Specifies whether to insert a `Rule` into or delete a `Rule` from a
  /// `WebACL`.
  final String action;

  /// The `ActivatedRule` object in an UpdateWebACL request specifies a `Rule`
  /// that you want to insert or delete, the priority of the `Rule` in the
  /// `WebACL`, and the action that you want AWS WAF to take when a web request
  /// matches the `Rule` (`ALLOW`, `BLOCK`, or `COUNT`).
  final ActivatedRule activatedRule;

  WebAclUpdate({
    @required this.action,
    @required this.activatedRule,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A complex type that contains `XssMatchTuple` objects, which specify the
/// parts of web requests that you want AWS WAF to inspect for cross-site
/// scripting attacks and, if you want AWS WAF to inspect a header, the name of
/// the header. If a `XssMatchSet` contains more than one `XssMatchTuple`
/// object, a request needs to include cross-site scripting attacks in only one
/// of the specified parts of the request to be considered a match.
class XssMatchSet {
  /// A unique identifier for an `XssMatchSet`. You use `XssMatchSetId` to get
  /// information about an `XssMatchSet` (see GetXssMatchSet), update an
  /// `XssMatchSet` (see UpdateXssMatchSet), insert an `XssMatchSet` into a
  /// `Rule` or delete one from a `Rule` (see UpdateRule), and delete an
  /// `XssMatchSet` from AWS WAF (see DeleteXssMatchSet).
  ///
  ///  `XssMatchSetId` is returned by CreateXssMatchSet and by ListXssMatchSets.
  final String xssMatchSetId;

  /// The name, if any, of the `XssMatchSet`.
  final String name;

  /// Specifies the parts of web requests that you want to inspect for
  /// cross-site scripting attacks.
  final List<XssMatchTuple> xssMatchTuples;

  XssMatchSet({
    @required this.xssMatchSetId,
    this.name,
    @required this.xssMatchTuples,
  });
  static XssMatchSet fromJson(Map<String, dynamic> json) => XssMatchSet(
        xssMatchSetId: json['XssMatchSetId'] as String,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        xssMatchTuples: (json['XssMatchTuples'] as List)
            .map((e) => XssMatchTuple.fromJson(e))
            .toList(),
      );
}

/// The `Id` and `Name` of an `XssMatchSet`.
class XssMatchSetSummary {
  /// A unique identifier for an `XssMatchSet`. You use `XssMatchSetId` to get
  /// information about a `XssMatchSet` (see GetXssMatchSet), update an
  /// `XssMatchSet` (see UpdateXssMatchSet), insert an `XssMatchSet` into a
  /// `Rule` or delete one from a `Rule` (see UpdateRule), and delete an
  /// `XssMatchSet` from AWS WAF (see DeleteXssMatchSet).
  ///
  ///  `XssMatchSetId` is returned by CreateXssMatchSet and by ListXssMatchSets.
  final String xssMatchSetId;

  /// The name of the `XssMatchSet`, if any, specified by `Id`.
  final String name;

  XssMatchSetSummary({
    @required this.xssMatchSetId,
    @required this.name,
  });
  static XssMatchSetSummary fromJson(Map<String, dynamic> json) =>
      XssMatchSetSummary(
        xssMatchSetId: json['XssMatchSetId'] as String,
        name: json['Name'] as String,
      );
}

/// Specifies the part of a web request that you want to inspect for cross-site
/// scripting attacks and indicates whether you want to add the specification to
/// an XssMatchSet or delete it from an `XssMatchSet`.
class XssMatchSetUpdate {
  /// Specify `INSERT` to add an XssMatchSetUpdate to an XssMatchSet. Use
  /// `DELETE` to remove an `XssMatchSetUpdate` from an `XssMatchSet`.
  final String action;

  /// Specifies the part of a web request that you want AWS WAF to inspect for
  /// cross-site scripting attacks and, if you want AWS WAF to inspect a header,
  /// the name of the header.
  final XssMatchTuple xssMatchTuple;

  XssMatchSetUpdate({
    @required this.action,
    @required this.xssMatchTuple,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Specifies the part of a web request that you want AWS WAF to inspect for
/// cross-site scripting attacks and, if you want AWS WAF to inspect a header,
/// the name of the header.
class XssMatchTuple {
  /// Specifies where in a web request to look for cross-site scripting attacks.
  final FieldToMatch fieldToMatch;

  /// Text transformations eliminate some of the unusual formatting that
  /// attackers use in web requests in an effort to bypass AWS WAF. If you
  /// specify a transformation, AWS WAF performs the transformation on
  /// `FieldToMatch` before inspecting a request for a match.
  ///
  /// You can only specify a single type of TextTransformation.
  ///
  ///  **CMD_LINE**
  ///
  /// When you're concerned that attackers are injecting an operating system
  /// command line command and using unusual formatting to disguise some or all
  /// of the command, use this option to perform the following transformations:
  ///
  /// *   Delete the following characters:  " ' ^
  ///
  /// *   Delete spaces before the following characters: / (
  ///
  /// *   Replace the following characters with a space: , ;
  ///
  /// *   Replace multiple spaces with one space
  ///
  /// *   Convert uppercase letters (A-Z) to lowercase (a-z)
  ///
  ///
  ///  **COMPRESS_WHITE_SPACE**
  ///
  /// Use this option to replace the following characters with a space character
  /// (decimal 32):
  ///
  /// *   f, formfeed, decimal 12
  ///
  /// *   t, tab, decimal 9
  ///
  /// *   n, newline, decimal 10
  ///
  /// *   r, carriage return, decimal 13
  ///
  /// *   v, vertical tab, decimal 11
  ///
  /// *   non-breaking space, decimal 160
  ///
  ///
  ///  `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
  ///
  ///  **HTML_ENTITY_DECODE**
  ///
  /// Use this option to replace HTML-encoded characters with unencoded
  /// characters. `HTML_ENTITY_DECODE` performs the following operations:
  ///
  /// *   Replaces `(ampersand)quot;` with `"`
  ///
  /// *   Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
  ///
  /// *   Replaces `(ampersand)lt;` with a "less than" symbol
  ///
  /// *   Replaces `(ampersand)gt;` with `>`
  ///
  /// *   Replaces characters that are represented in hexadecimal format,
  /// `(ampersand)#xhhhh;`, with the corresponding characters
  ///
  /// *   Replaces characters that are represented in decimal format,
  /// `(ampersand)#nnnn;`, with the corresponding characters
  ///
  ///
  ///  **LOWERCASE**
  ///
  /// Use this option to convert uppercase letters (A-Z) to lowercase (a-z).
  ///
  ///  **URL_DECODE**
  ///
  /// Use this option to decode a URL-encoded value.
  ///
  ///  **NONE**
  ///
  /// Specify `NONE` if you don't want to perform any text transformations.
  final String textTransformation;

  XssMatchTuple({
    @required this.fieldToMatch,
    @required this.textTransformation,
  });
  static XssMatchTuple fromJson(Map<String, dynamic> json) => XssMatchTuple(
        fieldToMatch: FieldToMatch.fromJson(json['FieldToMatch']),
        textTransformation: json['TextTransformation'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
