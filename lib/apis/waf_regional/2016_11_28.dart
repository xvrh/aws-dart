import 'package:meta/meta.dart';

/// This is the _AWS WAF Regional API Reference_ for using AWS WAF with Elastic
/// Load Balancing (ELB) Application Load Balancers. The AWS WAF actions and
/// data types listed in the reference are available for protecting Application
/// Load Balancers. You can use these actions and data types by means of the
/// endpoints listed in [AWS Regions and
/// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#waf_region).
/// This guide is for developers who need detailed information about the AWS WAF
/// API actions, data types, and errors. For detailed information about AWS WAF
/// features and an overview of how to use the AWS WAF API, see the [AWS WAF
/// Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
class WafRegionalApi {
  /// Associates a web ACL with a resource, either an application load balancer
  /// or Amazon API Gateway stage.
  Future<void> associateWebAcl(
      {@required String webAclId, @required String resourceArn}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createByteMatchSet(
      {@required String name, @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createGeoMatchSet(
      {@required String name, @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createIPSet(
      {@required String name, @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createRateBasedRule(
      {@required String name,
      @required String metricName,
      @required String rateKey,
      @required BigInt rateLimit,
      @required String changeToken,
      List<Tag> tags}) async {}

  /// Creates a RegexMatchSet. You then use UpdateRegexMatchSet to identify the
  /// part of a web request that you want AWS WAF to inspect, such as the values
  /// of the `User-Agent` header or the query string. For example, you can
  /// create a `RegexMatchSet` that contains a `RegexMatchTuple` that looks for
  /// any requests with `User-Agent` headers that match a `RegexPatternSet` with
  /// pattern `B\[a@\]dB\[o0\]t`. You can then configure AWS WAF to reject those
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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createRegexMatchSet(
      {@required String name, @required String changeToken}) async {}

  /// Creates a `RegexPatternSet`. You then use UpdateRegexPatternSet to specify
  /// the regular expression (regex) pattern that you want AWS WAF to search
  /// for, such as `B\[a@\]dB\[o0\]t`. You can then configure AWS WAF to reject
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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createRegexPatternSet(
      {@required String name, @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createRule(
      {@required String name,
      @required String metricName,
      @required String changeToken,
      List<Tag> tags}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createRuleGroup(
      {@required String name,
      @required String metricName,
      @required String changeToken,
      List<Tag> tags}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createSizeConstraintSet(
      {@required String name, @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createSqlInjectionMatchSet(
      {@required String name, @required String changeToken}) async {}

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
  /// For more information about how to use the AWS WAF API, see the [AWS WAF
  /// Developer Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createWebAcl(
      {@required String name,
      @required String metricName,
      @required WafAction defaultAction,
      @required String changeToken,
      List<Tag> tags}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> createXssMatchSet(
      {@required String name, @required String changeToken}) async {}

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
  Future<void> deleteByteMatchSet(
      {@required String byteMatchSetId, @required String changeToken}) async {}

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
  Future<void> deleteGeoMatchSet(
      {@required String geoMatchSetId, @required String changeToken}) async {}

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
  Future<void> deleteIPSet(
      {@required String ipSetId, @required String changeToken}) async {}

  /// Permanently deletes the LoggingConfiguration from the specified web ACL.
  Future<void> deleteLoggingConfiguration(String resourceArn) async {}

  /// Permanently deletes an IAM policy from the specified RuleGroup.
  ///
  /// The user making the request must be the owner of the RuleGroup.
  Future<void> deletePermissionPolicy(String resourceArn) async {}

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
  Future<void> deleteRateBasedRule(
      {@required String ruleId, @required String changeToken}) async {}

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
  Future<void> deleteRegexMatchSet(
      {@required String regexMatchSetId, @required String changeToken}) async {}

  /// Permanently deletes a RegexPatternSet. You can't delete a
  /// `RegexPatternSet` if it's still used in any `RegexMatchSet` or if the
  /// `RegexPatternSet` is not empty.
  Future<void> deleteRegexPatternSet(
      {@required String regexPatternSetId,
      @required String changeToken}) async {}

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
  Future<void> deleteRule(
      {@required String ruleId, @required String changeToken}) async {}

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
  Future<void> deleteRuleGroup(
      {@required String ruleGroupId, @required String changeToken}) async {}

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
  Future<void> deleteSizeConstraintSet(
      {@required String sizeConstraintSetId,
      @required String changeToken}) async {}

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
  Future<void> deleteSqlInjectionMatchSet(
      {@required String sqlInjectionMatchSetId,
      @required String changeToken}) async {}

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
  Future<void> deleteWebAcl(
      {@required String webAclId, @required String changeToken}) async {}

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
  Future<void> deleteXssMatchSet(
      {@required String xssMatchSetId, @required String changeToken}) async {}

  /// Removes a web ACL from the specified resource, either an application load
  /// balancer or Amazon API Gateway stage.
  Future<void> disassociateWebAcl(String resourceArn) async {}

  /// Returns the ByteMatchSet specified by `ByteMatchSetId`.
  Future<void> getByteMatchSet(String byteMatchSetId) async {}

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
  Future<void> getChangeToken() async {}

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
  Future<void> getChangeTokenStatus(String changeToken) async {}

  /// Returns the GeoMatchSet that is specified by `GeoMatchSetId`.
  Future<void> getGeoMatchSet(String geoMatchSetId) async {}

  /// Returns the IPSet that is specified by `IPSetId`.
  Future<void> getIPSet(String ipSetId) async {}

  /// Returns the LoggingConfiguration for the specified web ACL.
  Future<void> getLoggingConfiguration(String resourceArn) async {}

  /// Returns the IAM policy attached to the RuleGroup.
  Future<void> getPermissionPolicy(String resourceArn) async {}

  /// Returns the RateBasedRule that is specified by the `RuleId` that you
  /// included in the `GetRateBasedRule` request.
  Future<void> getRateBasedRule(String ruleId) async {}

  /// Returns an array of IP addresses currently being blocked by the
  /// RateBasedRule that is specified by the `RuleId`. The maximum number of
  /// managed keys that will be blocked is 10,000. If more than 10,000 addresses
  /// exceed the rate limit, the 10,000 addresses with the highest rates will be
  /// blocked.
  Future<void> getRateBasedRuleManagedKeys(String ruleId,
      {String nextMarker}) async {}

  /// Returns the RegexMatchSet specified by `RegexMatchSetId`.
  Future<void> getRegexMatchSet(String regexMatchSetId) async {}

  /// Returns the RegexPatternSet specified by `RegexPatternSetId`.
  Future<void> getRegexPatternSet(String regexPatternSetId) async {}

  /// Returns the Rule that is specified by the `RuleId` that you included in
  /// the `GetRule` request.
  Future<void> getRule(String ruleId) async {}

  /// Returns the RuleGroup that is specified by the `RuleGroupId` that you
  /// included in the `GetRuleGroup` request.
  ///
  /// To view the rules in a rule group, use ListActivatedRulesInRuleGroup.
  Future<void> getRuleGroup(String ruleGroupId) async {}

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
  Future<void> getSampledRequests(
      {@required String webAclId,
      @required String ruleId,
      @required TimeWindow timeWindow,
      @required BigInt maxItems}) async {}

  /// Returns the SizeConstraintSet specified by `SizeConstraintSetId`.
  Future<void> getSizeConstraintSet(String sizeConstraintSetId) async {}

  /// Returns the SqlInjectionMatchSet that is specified by
  /// `SqlInjectionMatchSetId`.
  Future<void> getSqlInjectionMatchSet(String sqlInjectionMatchSetId) async {}

  /// Returns the WebACL that is specified by `WebACLId`.
  Future<void> getWebAcl(String webAclId) async {}

  /// Returns the web ACL for the specified resource, either an application load
  /// balancer or Amazon API Gateway stage.
  Future<void> getWebAclForResource(String resourceArn) async {}

  /// Returns the XssMatchSet that is specified by `XssMatchSetId`.
  Future<void> getXssMatchSet(String xssMatchSetId) async {}

  /// Returns an array of ActivatedRule objects.
  Future<void> listActivatedRulesInRuleGroup(
      {String ruleGroupId, String nextMarker, int limit}) async {}

  /// Returns an array of ByteMatchSetSummary objects.
  Future<void> listByteMatchSets({String nextMarker, int limit}) async {}

  /// Returns an array of GeoMatchSetSummary objects in the response.
  Future<void> listGeoMatchSets({String nextMarker, int limit}) async {}

  /// Returns an array of IPSetSummary objects in the response.
  Future<void> listIPSets({String nextMarker, int limit}) async {}

  /// Returns an array of LoggingConfiguration objects.
  Future<void> listLoggingConfigurations(
      {String nextMarker, int limit}) async {}

  /// Returns an array of RuleSummary objects.
  Future<void> listRateBasedRules({String nextMarker, int limit}) async {}

  /// Returns an array of RegexMatchSetSummary objects.
  Future<void> listRegexMatchSets({String nextMarker, int limit}) async {}

  /// Returns an array of RegexPatternSetSummary objects.
  Future<void> listRegexPatternSets({String nextMarker, int limit}) async {}

  /// Returns an array of resources associated with the specified web ACL.
  Future<void> listResourcesForWebAcl(String webAclId,
      {String resourceType}) async {}

  /// Returns an array of RuleGroup objects.
  Future<void> listRuleGroups({String nextMarker, int limit}) async {}

  /// Returns an array of RuleSummary objects.
  Future<void> listRules({String nextMarker, int limit}) async {}

  /// Returns an array of SizeConstraintSetSummary objects.
  Future<void> listSizeConstraintSets({String nextMarker, int limit}) async {}

  /// Returns an array of SqlInjectionMatchSet objects.
  Future<void> listSqlInjectionMatchSets(
      {String nextMarker, int limit}) async {}

  /// Returns an array of RuleGroup objects that you are subscribed to.
  Future<void> listSubscribedRuleGroups({String nextMarker, int limit}) async {}

  Future<void> listTagsForResource(String resourceArn,
      {String nextMarker, int limit}) async {}

  /// Returns an array of WebACLSummary objects in the response.
  Future<void> listWebACLs({String nextMarker, int limit}) async {}

  /// Returns an array of XssMatchSet objects.
  Future<void> listXssMatchSets({String nextMarker, int limit}) async {}

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
  /// information, see [Logging Web ACL Traffic
  /// Information](https://docs.aws.amazon.com/waf/latest/developerguide/logging.html)
  /// in the _AWS WAF Developer Guide_.
  Future<void> putLoggingConfiguration(
      LoggingConfiguration loggingConfiguration) async {}

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
  /// For more information, see [IAM
  /// Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html).
  ///
  /// An example of a valid policy parameter is shown in the Examples section
  /// below.
  Future<void> putPermissionPolicy(
      {@required String resourceArn, @required String policy}) async {}

  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateByteMatchSet(
      {@required String byteMatchSetId,
      @required String changeToken,
      @required List<ByteMatchSetUpdate> updates}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateGeoMatchSet(
      {@required String geoMatchSetId,
      @required String changeToken,
      @required List<GeoMatchSetUpdate> updates}) async {}

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
  /// [Classless Inter-Domain
  /// Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing).
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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateIPSet(
      {@required String ipSetId,
      @required String changeToken,
      @required List<IPSetUpdate> updates}) async {}

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
  Future<void> updateRateBasedRule(
      {@required String ruleId,
      @required String changeToken,
      @required List<RuleUpdate> updates,
      @required BigInt rateLimit}) async {}

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
  /// with `User-Agent` headers that contain the string `B\[a@\]dB\[o0\]t`. You
  /// can then configure AWS WAF to reject those requests.
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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateRegexMatchSet(
      {@required String regexMatchSetId,
      @required List<RegexMatchSetUpdate> updates,
      @required String changeToken}) async {}

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
  /// `B\[a@\]dB\[o0\]t`. AWS WAF will match this `RegexPatternString` to:
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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateRegexPatternSet(
      {@required String regexPatternSetId,
      @required List<RegexPatternSetUpdate> updates,
      @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateRule(
      {@required String ruleId,
      @required String changeToken,
      @required List<RuleUpdate> updates}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateRuleGroup(
      {@required String ruleGroupId,
      @required List<RuleGroupUpdate> updates,
      @required String changeToken}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateSizeConstraintSet(
      {@required String sizeConstraintSetId,
      @required String changeToken,
      @required List<SizeConstraintSetUpdate> updates}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateSqlInjectionMatchSet(
      {@required String sqlInjectionMatchSetId,
      @required String changeToken,
      @required List<SqlInjectionMatchSetUpdate> updates}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateWebAcl(
      {@required String webAclId,
      @required String changeToken,
      List<WebAclUpdate> updates,
      WafAction defaultAction}) async {}

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
  /// HTTP requests, see the [AWS WAF Developer
  /// Guide](https://docs.aws.amazon.com/waf/latest/developerguide/).
  Future<void> updateXssMatchSet(
      {@required String xssMatchSetId,
      @required String changeToken,
      @required List<XssMatchSetUpdate> updates}) async {}
}

class ActivatedRule {}

class AssociateWebAclResponse {}

class ByteMatchSet {}

class ByteMatchSetSummary {}

class ByteMatchSetUpdate {}

class ByteMatchTuple {}

class CreateByteMatchSetResponse {}

class CreateGeoMatchSetResponse {}

class CreateIPSetResponse {}

class CreateRateBasedRuleResponse {}

class CreateRegexMatchSetResponse {}

class CreateRegexPatternSetResponse {}

class CreateRuleGroupResponse {}

class CreateRuleResponse {}

class CreateSizeConstraintSetResponse {}

class CreateSqlInjectionMatchSetResponse {}

class CreateWebAclResponse {}

class CreateXssMatchSetResponse {}

class DeleteByteMatchSetResponse {}

class DeleteGeoMatchSetResponse {}

class DeleteIPSetResponse {}

class DeleteLoggingConfigurationResponse {}

class DeletePermissionPolicyResponse {}

class DeleteRateBasedRuleResponse {}

class DeleteRegexMatchSetResponse {}

class DeleteRegexPatternSetResponse {}

class DeleteRuleGroupResponse {}

class DeleteRuleResponse {}

class DeleteSizeConstraintSetResponse {}

class DeleteSqlInjectionMatchSetResponse {}

class DeleteWebAclResponse {}

class DeleteXssMatchSetResponse {}

class DisassociateWebAclResponse {}

class ExcludedRule {}

class FieldToMatch {}

class GeoMatchConstraint {}

class GeoMatchSet {}

class GeoMatchSetSummary {}

class GeoMatchSetUpdate {}

class GetByteMatchSetResponse {}

class GetChangeTokenResponse {}

class GetChangeTokenStatusResponse {}

class GetGeoMatchSetResponse {}

class GetIPSetResponse {}

class GetLoggingConfigurationResponse {}

class GetPermissionPolicyResponse {}

class GetRateBasedRuleManagedKeysResponse {}

class GetRateBasedRuleResponse {}

class GetRegexMatchSetResponse {}

class GetRegexPatternSetResponse {}

class GetRuleGroupResponse {}

class GetRuleResponse {}

class GetSampledRequestsResponse {}

class GetSizeConstraintSetResponse {}

class GetSqlInjectionMatchSetResponse {}

class GetWebAclForResourceResponse {}

class GetWebAclResponse {}

class GetXssMatchSetResponse {}

class HttpHeader {}

class HttpRequest {}

class IPSet {}

class IPSetDescriptor {}

class IPSetSummary {}

class IPSetUpdate {}

class ListActivatedRulesInRuleGroupResponse {}

class ListByteMatchSetsResponse {}

class ListGeoMatchSetsResponse {}

class ListIPSetsResponse {}

class ListLoggingConfigurationsResponse {}

class ListRateBasedRulesResponse {}

class ListRegexMatchSetsResponse {}

class ListRegexPatternSetsResponse {}

class ListResourcesForWebAclResponse {}

class ListRuleGroupsResponse {}

class ListRulesResponse {}

class ListSizeConstraintSetsResponse {}

class ListSqlInjectionMatchSetsResponse {}

class ListSubscribedRuleGroupsResponse {}

class ListTagsForResourceResponse {}

class ListWebACLsResponse {}

class ListXssMatchSetsResponse {}

class LoggingConfiguration {}

class Predicate {}

class PutLoggingConfigurationResponse {}

class PutPermissionPolicyResponse {}

class RateBasedRule {}

class RegexMatchSet {}

class RegexMatchSetSummary {}

class RegexMatchSetUpdate {}

class RegexMatchTuple {}

class RegexPatternSet {}

class RegexPatternSetSummary {}

class RegexPatternSetUpdate {}

class Rule {}

class RuleGroup {}

class RuleGroupSummary {}

class RuleGroupUpdate {}

class RuleSummary {}

class RuleUpdate {}

class SampledHttpRequest {}

class SizeConstraint {}

class SizeConstraintSet {}

class SizeConstraintSetSummary {}

class SizeConstraintSetUpdate {}

class SqlInjectionMatchSet {}

class SqlInjectionMatchSetSummary {}

class SqlInjectionMatchSetUpdate {}

class SqlInjectionMatchTuple {}

class SubscribedRuleGroupSummary {}

class Tag {}

class TagInfoForResource {}

class TagResourceResponse {}

class TimeWindow {}

class UntagResourceResponse {}

class UpdateByteMatchSetResponse {}

class UpdateGeoMatchSetResponse {}

class UpdateIPSetResponse {}

class UpdateRateBasedRuleResponse {}

class UpdateRegexMatchSetResponse {}

class UpdateRegexPatternSetResponse {}

class UpdateRuleGroupResponse {}

class UpdateRuleResponse {}

class UpdateSizeConstraintSetResponse {}

class UpdateSqlInjectionMatchSetResponse {}

class UpdateWebAclResponse {}

class UpdateXssMatchSetResponse {}

class WafAction {}

class WafOverrideAction {}

class WebAcl {}

class WebAclSummary {}

class WebAclUpdate {}

class XssMatchSet {}

class XssMatchSetSummary {}

class XssMatchSetUpdate {}

class XssMatchTuple {}
