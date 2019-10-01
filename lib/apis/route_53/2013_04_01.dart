import 'package:meta/meta.dart';

/// Amazon Route 53 is a highly available and scalable Domain Name System (DNS)
/// web service.
class Route53Api {
  /// Associates an Amazon VPC with a private hosted zone.
  ///
  ///  To perform the association, the VPC and the private hosted zone must
  /// already exist. You can't convert a public hosted zone into a private
  /// hosted zone.
  ///
  /// If you want to associate a VPC that was created by using one AWS account
  /// with a private hosted zone that was created by using a different account,
  /// the AWS account that created the private hosted zone must first submit a
  /// `CreateVPCAssociationAuthorization` request. Then the account that created
  /// the VPC must submit an `AssociateVPCWithHostedZone` request.
  Future<void> associateVpcWithHostedZone(
      {@required String hostedZoneId,
      @required Vpc vpc,
      String comment}) async {}

  /// Creates, changes, or deletes a resource record set, which contains
  /// authoritative DNS information for a specified domain name or subdomain
  /// name. For example, you can use `ChangeResourceRecordSets` to create a
  /// resource record set that routes traffic for test.example.com to a web
  /// server that has an IP address of 192.0.2.44.
  ///
  ///  **Change Batches and Transactional Changes**
  ///
  /// The request body must include a document with a
  /// `ChangeResourceRecordSetsRequest` element. The request body contains a
  /// list of change items, known as a change batch. Change batches are
  /// considered transactional changes. When using the Amazon Route 53 API to
  /// change resource record sets, Route 53 either makes all or none of the
  /// changes in a change batch request. This ensures that Route 53 never
  /// partially implements the intended changes to the resource record sets in a
  /// hosted zone.
  ///
  /// For example, a change batch request that deletes the `CNAME` record for
  /// www.example.com and creates an alias resource record set for
  /// www.example.com. Route 53 deletes the first resource record set and
  /// creates the second resource record set in a single operation. If either
  /// the `DELETE` or the `CREATE` action fails, then both changes (plus any
  /// other changes in the batch) fail, and the original `CNAME` record
  /// continues to exist.
  ///
  ///  Due to the nature of transactional changes, you can't delete the same
  /// resource record set more than once in a single change batch. If you
  /// attempt to delete the same change batch more than once, Route 53 returns
  /// an `InvalidChangeBatch` error.
  ///
  ///  **Traffic Flow**
  ///
  /// To create resource record sets for complex routing configurations, use
  /// either the traffic flow visual editor in the Route 53 console or the API
  /// actions for traffic policies and traffic policy instances. Save the
  /// configuration as a traffic policy, then associate the traffic policy with
  /// one or more domain names (such as example.com) or subdomain names (such as
  /// www.example.com), in the same hosted zone or in multiple hosted zones. You
  /// can roll back the updates if the new configuration isn't performing as
  /// expected. For more information, see [Using Traffic Flow to Route DNS
  /// Traffic](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/traffic-flow.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  ///  **Create, Delete, and Upsert**
  ///
  /// Use `ChangeResourceRecordsSetsRequest` to perform the following actions:
  ///
  /// *    `CREATE`: Creates a resource record set that has the specified
  /// values.
  ///
  /// *    `DELETE`: Deletes an existing resource record set that has the
  /// specified values.
  ///
  /// *    `UPSERT`: If a resource record set does not already exist, AWS
  /// creates it. If a resource set does exist, Route 53 updates it with the
  /// values in the request.
  ///
  ///
  ///  **Syntaxes for Creating, Updating, and Deleting Resource Record Sets**
  ///
  /// The syntax for a request depends on the type of resource record set that
  /// you want to create, delete, or update, such as weighted, alias, or
  /// failover. The XML elements in your request must appear in the order listed
  /// in the syntax.
  ///
  /// For an example for each type of resource record set, see "Examples."
  ///
  /// Don't refer to the syntax in the "Parameter Syntax" section, which
  /// includes all of the elements for every kind of resource record set that
  /// you can create, delete, or update by using `ChangeResourceRecordSets`.
  ///
  ///  **Change Propagation to Route 53 DNS Servers**
  ///
  /// When you submit a `ChangeResourceRecordSets` request, Route 53 propagates
  /// your changes to all of the Route 53 authoritative DNS servers. While your
  /// changes are propagating, `GetChange` returns a status of `PENDING`. When
  /// propagation is complete, `GetChange` returns a status of `INSYNC`. Changes
  /// generally propagate to all Route 53 name servers within 60 seconds. For
  /// more information, see
  /// [GetChange](https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetChange.html).
  ///
  ///  **Limits on ChangeResourceRecordSets Requests**
  ///
  /// For information about the limits on a `ChangeResourceRecordSets` request,
  /// see
  /// [Limits](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html)
  /// in the _Amazon Route 53 Developer Guide_.
  Future<void> changeResourceRecordSets(
      {@required String hostedZoneId,
      @required ChangeBatch changeBatch}) async {}

  /// Adds, edits, or deletes tags for a health check or a hosted zone.
  ///
  /// For information about using tags for cost allocation, see [Using Cost
  /// Allocation
  /// Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<void> changeTagsForResource(
      {@required String resourceType,
      @required String resourceId,
      List<Tag> addTags,
      List<String> removeTagKeys}) async {}

  /// Creates a new health check.
  ///
  /// For information about adding health checks to resource record sets, see
  /// [HealthCheckId](https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResourceRecordSet.html#Route53-Type-ResourceRecordSet-HealthCheckId)
  /// in
  /// [ChangeResourceRecordSets](https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html).
  ///
  ///  **ELB Load Balancers**
  ///
  /// If you're registering EC2 instances with an Elastic Load Balancing (ELB)
  /// load balancer, do not create Amazon Route 53 health checks for the EC2
  /// instances. When you register an EC2 instance with a load balancer, you
  /// configure settings for an ELB health check, which performs a similar
  /// function to a Route 53 health check.
  ///
  ///  **Private Hosted Zones**
  ///
  /// You can associate health checks with failover resource record sets in a
  /// private hosted zone. Note the following:
  ///
  /// *   Route 53 health checkers are outside the VPC. To check the health of
  /// an endpoint within a VPC by IP address, you must assign a public IP
  /// address to the instance in the VPC.
  ///
  /// *   You can configure a health checker to check the health of an external
  /// resource that the instance relies on, such as a database server.
  ///
  /// *   You can create a CloudWatch metric, associate an alarm with the
  /// metric, and then create a health check that is based on the state of the
  /// alarm. For example, you might create a CloudWatch metric that checks the
  /// status of the Amazon EC2 `StatusCheckFailed` metric, add an alarm to the
  /// metric, and then create a health check that is based on the state of the
  /// alarm. For information about creating CloudWatch metrics and alarms by
  /// using the CloudWatch console, see the [Amazon CloudWatch User
  /// Guide](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatch.html).
  Future<void> createHealthCheck(
      {@required String callerReference,
      @required HealthCheckConfig healthCheckConfig}) async {}

  /// Creates a new public or private hosted zone. You create records in a
  /// public hosted zone to define how you want to route traffic on the internet
  /// for a domain, such as example.com, and its subdomains (apex.example.com,
  /// acme.example.com). You create records in a private hosted zone to define
  /// how you want to route traffic for a domain and its subdomains within one
  /// or more Amazon Virtual Private Clouds (Amazon VPCs).
  ///
  ///  You can't convert a public hosted zone to a private hosted zone or vice
  /// versa. Instead, you must create a new hosted zone with the same name and
  /// create new resource record sets.
  ///
  /// For more information about charges for hosted zones, see [Amazon Route 53
  /// Pricing](http://aws.amazon.com/route53/pricing/).
  ///
  /// Note the following:
  ///
  /// *   You can't create a hosted zone for a top-level domain (TLD) such as
  /// .com.
  ///
  /// *   For public hosted zones, Amazon Route 53 automatically creates a
  /// default SOA record and four NS records for the zone. For more information
  /// about SOA and NS records, see [NS and SOA Records that Route 53 Creates
  /// for a Hosted
  /// Zone](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/SOA-NSrecords.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  ///     If you want to use the same name servers for multiple public hosted
  /// zones, you can optionally associate a reusable delegation set with the
  /// hosted zone. See the `DelegationSetId` element.
  ///
  /// *   If your domain is registered with a registrar other than Route 53, you
  /// must update the name servers with your registrar to make Route 53 the DNS
  /// service for the domain. For more information, see [Migrating DNS Service
  /// for an Existing Domain to Amazon Route
  /// 53](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/MigratingDNS.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  ///
  /// When you submit a `CreateHostedZone` request, the initial status of the
  /// hosted zone is `PENDING`. For public hosted zones, this means that the NS
  /// and SOA records are not yet available on all Route 53 DNS servers. When
  /// the NS and SOA records are available, the status of the zone changes to
  /// `INSYNC`.
  Future<void> createHostedZone(
      {@required String name,
      Vpc vpc,
      @required String callerReference,
      HostedZoneConfig hostedZoneConfig,
      String delegationSetId}) async {}

  /// Creates a configuration for DNS query logging. After you create a query
  /// logging configuration, Amazon Route 53 begins to publish log data to an
  /// Amazon CloudWatch Logs log group.
  ///
  /// DNS query logs contain information about the queries that Route 53
  /// receives for a specified public hosted zone, such as the following:
  ///
  /// *   Route 53 edge location that responded to the DNS query
  ///
  /// *   Domain or subdomain that was requested
  ///
  /// *   DNS record type, such as A or AAAA
  ///
  /// *   DNS response code, such as `NoError` or `ServFail`
  ///
  ///
  /// Log Group and Resource Policy
  ///
  /// Before you create a query logging configuration, perform the following
  /// operations.
  ///
  ///  If you create a query logging configuration using the Route 53 console,
  /// Route 53 performs these operations automatically.
  ///
  /// 1.  Create a CloudWatch Logs log group, and make note of the ARN, which
  /// you specify when you create a query logging configuration. Note the
  /// following:
  ///
  ///     *   You must create the log group in the us-east-1 region.
  ///
  ///     *   You must use the same AWS account to create the log group and the
  /// hosted zone that you want to configure query logging for.
  ///
  ///     *   When you create log groups for query logging, we recommend that
  /// you use a consistent prefix, for example:
  ///
  ///          `/aws/route53/_hosted zone name_`
  ///
  ///         In the next step, you'll create a resource policy, which controls
  /// access to one or more log groups and the associated AWS resources, such as
  /// Route 53 hosted zones. There's a limit on the number of resource policies
  /// that you can create, so we recommend that you use a consistent prefix so
  /// you can use the same resource policy for all the log groups that you
  /// create for query logging.
  ///
  ///
  /// 2.  Create a CloudWatch Logs resource policy, and give it the permissions
  /// that Route 53 needs to create log streams and to send query logs to log
  /// streams. For the value of `Resource`, specify the ARN for the log group
  /// that you created in the previous step. To use the same resource policy for
  /// all the CloudWatch Logs log groups that you created for query logging
  /// configurations, replace the hosted zone name with `*`, for example:
  ///
  ///      `arn:aws:logs:us-east-1:123412341234:log-group:/aws/route53/*`
  ///
  ///      You can't use the CloudWatch console to create or edit a resource
  /// policy. You must use the CloudWatch API, one of the AWS SDKs, or the AWS
  /// CLI.
  ///
  /// Log Streams and Edge Locations
  ///
  /// When Route 53 finishes creating the configuration for DNS query logging,
  /// it does the following:
  ///
  /// *   Creates a log stream for an edge location the first time that the edge
  /// location responds to DNS queries for the specified hosted zone. That log
  /// stream is used to log all queries that Route 53 responds to for that edge
  /// location.
  ///
  /// *   Begins to send query logs to the applicable log stream.
  ///
  ///
  /// The name of each log stream is in the following format:
  ///
  ///   `_hosted zone ID_/_edge location code_`
  ///
  /// The edge location code is a three-letter code and an arbitrarily assigned
  /// number, for example, DFW3. The three-letter code typically corresponds
  /// with the International Air Transport Association airport code for an
  /// airport near the edge location. (These abbreviations might change in the
  /// future.) For a list of edge locations, see "The Route 53 Global Network"
  /// on the [Route 53 Product Details](http://aws.amazon.com/route53/details/)
  /// page.
  ///
  /// Queries That Are Logged
  ///
  /// Query logs contain only the queries that DNS resolvers forward to Route
  /// 53. If a DNS resolver has already cached the response to a query (such as
  /// the IP address for a load balancer for example.com), the resolver will
  /// continue to return the cached response. It doesn't forward another query
  /// to Route 53 until the TTL for the corresponding resource record set
  /// expires. Depending on how many DNS queries are submitted for a resource
  /// record set, and depending on the TTL for that resource record set, query
  /// logs might contain information about only one query out of every several
  /// thousand queries that are submitted to DNS. For more information about how
  /// DNS works, see [Routing Internet Traffic to Your Website or Web
  /// Application](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-dns-service.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// Log File Format
  ///
  /// For a list of the values in each query log and the format of each value,
  /// see [Logging DNS
  /// Queries](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// Pricing
  ///
  /// For information about charges for query logs, see [Amazon CloudWatch
  /// Pricing](http://aws.amazon.com/cloudwatch/pricing/).
  ///
  /// How to Stop Logging
  ///
  /// If you want Route 53 to stop sending query logs to CloudWatch Logs, delete
  /// the query logging configuration. For more information, see
  /// [DeleteQueryLoggingConfig](https://docs.aws.amazon.com/Route53/latest/APIReference/API_DeleteQueryLoggingConfig.html).
  Future<void> createQueryLoggingConfig(
      {@required String hostedZoneId,
      @required String cloudWatchLogsLogGroupArn}) async {}

  /// Creates a delegation set (a group of four name servers) that can be reused
  /// by multiple hosted zones. If a hosted zoned ID is specified,
  /// `CreateReusableDelegationSet` marks the delegation set associated with
  /// that zone as reusable.
  ///
  ///  You can't associate a reusable delegation set with a private hosted zone.
  ///
  ///
  /// For information about using a reusable delegation set to configure white
  /// label name servers, see [Configuring White Label Name
  /// Servers](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/white-label-name-servers.html).
  ///
  /// The process for migrating existing hosted zones to use a reusable
  /// delegation set is comparable to the process for configuring white label
  /// name servers. You need to perform the following steps:
  ///
  /// 1.  Create a reusable delegation set.
  ///
  /// 2.  Recreate hosted zones, and reduce the TTL to 60 seconds or less.
  ///
  /// 3.  Recreate resource record sets in the new hosted zones.
  ///
  /// 4.  Change the registrar's name servers to use the name servers for the
  /// new hosted zones.
  ///
  /// 5.  Monitor traffic for the website or application.
  ///
  /// 6.  Change TTLs back to their original values.
  ///
  ///
  /// If you want to migrate existing hosted zones to use a reusable delegation
  /// set, the existing hosted zones can't use any of the name servers that are
  /// assigned to the reusable delegation set. If one or more hosted zones do
  /// use one or more name servers that are assigned to the reusable delegation
  /// set, you can do one of the following:
  ///
  /// *   For small numbers of hosted zones—up to a few hundred—it's relatively
  /// easy to create reusable delegation sets until you get one that has four
  /// name servers that don't overlap with any of the name servers in your
  /// hosted zones.
  ///
  /// *   For larger numbers of hosted zones, the easiest solution is to use
  /// more than one reusable delegation set.
  ///
  /// *   For larger numbers of hosted zones, you can also migrate hosted zones
  /// that have overlapping name servers to hosted zones that don't have
  /// overlapping name servers, then migrate the hosted zones again to use the
  /// reusable delegation set.
  Future<void> createReusableDelegationSet(String callerReference,
      {String hostedZoneId}) async {}

  /// Creates a traffic policy, which you use to create multiple DNS resource
  /// record sets for one domain name (such as example.com) or one subdomain
  /// name (such as www.example.com).
  Future<void> createTrafficPolicy(
      {@required String name,
      @required String document,
      String comment}) async {}

  /// Creates resource record sets in a specified hosted zone based on the
  /// settings in a specified traffic policy version. In addition,
  /// `CreateTrafficPolicyInstance` associates the resource record sets with a
  /// specified domain name (such as example.com) or subdomain name (such as
  /// www.example.com). Amazon Route 53 responds to DNS queries for the domain
  /// or subdomain name by using the resource record sets that
  /// `CreateTrafficPolicyInstance` created.
  Future<void> createTrafficPolicyInstance(
      {@required String hostedZoneId,
      @required String name,
      @required BigInt ttl,
      @required String trafficPolicyId,
      @required int trafficPolicyVersion}) async {}

  /// Creates a new version of an existing traffic policy. When you create a new
  /// version of a traffic policy, you specify the ID of the traffic policy that
  /// you want to update and a JSON-formatted document that describes the new
  /// version. You use traffic policies to create multiple DNS resource record
  /// sets for one domain name (such as example.com) or one subdomain name (such
  /// as www.example.com). You can create a maximum of 1000 versions of a
  /// traffic policy. If you reach the limit and need to create another version,
  /// you'll need to start a new traffic policy.
  Future<void> createTrafficPolicyVersion(
      {@required String id, @required String document, String comment}) async {}

  /// Authorizes the AWS account that created a specified VPC to submit an
  /// `AssociateVPCWithHostedZone` request to associate the VPC with a specified
  /// hosted zone that was created by a different account. To submit a
  /// `CreateVPCAssociationAuthorization` request, you must use the account that
  /// created the hosted zone. After you authorize the association, use the
  /// account that created the VPC to submit an `AssociateVPCWithHostedZone`
  /// request.
  ///
  ///
  ///
  /// If you want to associate multiple VPCs that you created by using one
  /// account with a hosted zone that you created by using a different account,
  /// you must submit one authorization request for each VPC.
  Future<void> createVpcAssociationAuthorization(
      {@required String hostedZoneId, @required Vpc vpc}) async {}

  /// Deletes a health check.
  ///
  ///
  ///
  /// Amazon Route 53 does not prevent you from deleting a health check even if
  /// the health check is associated with one or more resource record sets. If
  /// you delete a health check and you don't update the associated resource
  /// record sets, the future status of the health check can't be predicted and
  /// may change. This will affect the routing of DNS queries for your DNS
  /// failover configuration. For more information, see [Replacing and Deleting
  /// Health
  /// Checks](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html#health-checks-deleting.html)
  /// in the _Amazon Route 53 Developer Guide_.
  Future<void> deleteHealthCheck(String healthCheckId) async {}

  /// Deletes a hosted zone.
  ///
  /// If the hosted zone was created by another service, such as AWS Cloud Map,
  /// see [Deleting Public Hosted Zones That Were Created by Another
  /// Service](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DeleteHostedZone.html#delete-public-hosted-zone-created-by-another-service)
  /// in the _Amazon Route 53 Developer Guide_ for information about how to
  /// delete it. (The process is the same for public and private hosted zones
  /// that were created by another service.)
  ///
  /// If you want to keep your domain registration but you want to stop routing
  /// internet traffic to your website or web application, we recommend that you
  /// delete resource record sets in the hosted zone instead of deleting the
  /// hosted zone.
  ///
  ///  If you delete a hosted zone, you can't undelete it. You must create a new
  /// hosted zone and update the name servers for your domain registration,
  /// which can require up to 48 hours to take effect. (If you delegated
  /// responsibility for a subdomain to a hosted zone and you delete the child
  /// hosted zone, you must update the name servers in the parent hosted zone.)
  /// In addition, if you delete a hosted zone, someone could hijack the domain
  /// and route traffic to their own resources using your domain name.
  ///
  /// If you want to avoid the monthly charge for the hosted zone, you can
  /// transfer DNS service for the domain to a free DNS service. When you
  /// transfer DNS service, you have to update the name servers for the domain
  /// registration. If the domain is registered with Route 53, see
  /// [UpdateDomainNameservers](https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainNameservers.html)
  /// for information about how to replace Route 53 name servers with name
  /// servers for the new DNS service. If the domain is registered with another
  /// registrar, use the method provided by the registrar to update name servers
  /// for the domain registration. For more information, perform an internet
  /// search on "free DNS service."
  ///
  /// You can delete a hosted zone only if it contains only the default SOA
  /// record and NS resource record sets. If the hosted zone contains other
  /// resource record sets, you must delete them before you can delete the
  /// hosted zone. If you try to delete a hosted zone that contains other
  /// resource record sets, the request fails, and Route 53 returns a
  /// `HostedZoneNotEmpty` error. For information about deleting records from
  /// your hosted zone, see
  /// [ChangeResourceRecordSets](https://docs.aws.amazon.com/Route53/latest/APIReference/API_ChangeResourceRecordSets.html).
  ///
  /// To verify that the hosted zone has been deleted, do one of the following:
  ///
  /// *   Use the `GetHostedZone` action to request information about the hosted
  /// zone.
  ///
  /// *   Use the `ListHostedZones` action to get a list of the hosted zones
  /// associated with the current AWS account.
  Future<void> deleteHostedZone(String id) async {}

  /// Deletes a configuration for DNS query logging. If you delete a
  /// configuration, Amazon Route 53 stops sending query logs to CloudWatch
  /// Logs. Route 53 doesn't delete any logs that are already in CloudWatch
  /// Logs.
  ///
  /// For more information about DNS query logs, see
  /// [CreateQueryLoggingConfig](https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html).
  Future<void> deleteQueryLoggingConfig(String id) async {}

  /// Deletes a reusable delegation set.
  ///
  ///  You can delete a reusable delegation set only if it isn't associated with
  /// any hosted zones.
  ///
  /// To verify that the reusable delegation set is not associated with any
  /// hosted zones, submit a
  /// [GetReusableDelegationSet](https://docs.aws.amazon.com/Route53/latest/APIReference/API_GetReusableDelegationSet.html)
  /// request and specify the ID of the reusable delegation set that you want to
  /// delete.
  Future<void> deleteReusableDelegationSet(String id) async {}

  /// Deletes a traffic policy.
  Future<void> deleteTrafficPolicy(
      {@required String id, @required int version}) async {}

  /// Deletes a traffic policy instance and all of the resource record sets that
  /// Amazon Route 53 created when you created the instance.
  ///
  ///
  ///
  /// In the Route 53 console, traffic policy instances are known as policy
  /// records.
  Future<void> deleteTrafficPolicyInstance(String id) async {}

  /// Removes authorization to submit an `AssociateVPCWithHostedZone` request to
  /// associate a specified VPC with a hosted zone that was created by a
  /// different account. You must use the account that created the hosted zone
  /// to submit a `DeleteVPCAssociationAuthorization` request.
  ///
  ///
  ///
  /// Sending this request only prevents the AWS account that created the VPC
  /// from associating the VPC with the Amazon Route 53 hosted zone in the
  /// future. If the VPC is already associated with the hosted zone,
  /// `DeleteVPCAssociationAuthorization` won't disassociate the VPC from the
  /// hosted zone. If you want to delete an existing association, use
  /// `DisassociateVPCFromHostedZone`.
  Future<void> deleteVpcAssociationAuthorization(
      {@required String hostedZoneId, @required Vpc vpc}) async {}

  /// Disassociates a VPC from a Amazon Route 53 private hosted zone. Note the
  /// following:
  ///
  /// *   You can't disassociate the last VPC from a private hosted zone.
  ///
  /// *   You can't convert a private hosted zone into a public hosted zone.
  ///
  /// *   You can submit a `DisassociateVPCFromHostedZone` request using either
  /// the account that created the hosted zone or the account that created the
  /// VPC.
  Future<void> disassociateVpcFromHostedZone(
      {@required String hostedZoneId,
      @required Vpc vpc,
      String comment}) async {}

  /// Gets the specified limit for the current account, for example, the maximum
  /// number of health checks that you can create using the account.
  ///
  /// For the default limit, see
  /// [Limits](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html)
  /// in the _Amazon Route 53 Developer Guide_. To request a higher limit, [open
  /// a
  /// case](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-route53).
  ///
  ///
  ///
  /// You can also view account limits in AWS Trusted Advisor. Sign in to the
  /// AWS Management Console and open the Trusted Advisor console at
  /// [https://console.aws.amazon.com/trustedadvisor/](https://console.aws.amazon.com/trustedadvisor).
  /// Then choose **Service limits** in the navigation pane.
  Future<void> getAccountLimit(String type) async {}

  /// Returns the current status of a change batch request. The status is one of
  /// the following values:
  ///
  /// *    `PENDING` indicates that the changes in this request have not
  /// propagated to all Amazon Route 53 DNS servers. This is the initial status
  /// of all change batch requests.
  ///
  /// *    `INSYNC` indicates that the changes have propagated to all Route 53
  /// DNS servers.
  Future<void> getChange(String id) async {}

  ///  `GetCheckerIpRanges` still works, but we recommend that you download
  /// ip-ranges.json, which includes IP address ranges for all AWS services. For
  /// more information, see [IP Address Ranges of Amazon Route 53
  /// Servers](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/route-53-ip-addresses.html)
  /// in the _Amazon Route 53 Developer Guide_.
  Future<void> getCheckerIpRanges() async {}

  /// Gets information about whether a specified geographic location is
  /// supported for Amazon Route 53 geolocation resource record sets.
  ///
  /// Use the following syntax to determine whether a continent is supported for
  /// geolocation:
  ///
  ///  `GET /2013-04-01/geolocation?continentcode=_two-letter abbreviation for a
  /// continent_`
  ///
  /// Use the following syntax to determine whether a country is supported for
  /// geolocation:
  ///
  ///  `GET /2013-04-01/geolocation?countrycode=_two-character country code_`
  ///
  /// Use the following syntax to determine whether a subdivision of a country
  /// is supported for geolocation:
  ///
  ///  `GET /2013-04-01/geolocation?countrycode=_two-character country
  /// code_&subdivisioncode=_subdivision code_`
  Future<void> getGeoLocation(
      {String continentCode,
      String countryCode,
      String subdivisionCode}) async {}

  /// Gets information about a specified health check.
  Future<void> getHealthCheck(String healthCheckId) async {}

  /// Retrieves the number of health checks that are associated with the current
  /// AWS account.
  Future<void> getHealthCheckCount() async {}

  /// Gets the reason that a specified health check failed most recently.
  Future<void> getHealthCheckLastFailureReason(String healthCheckId) async {}

  /// Gets status of a specified health check.
  Future<void> getHealthCheckStatus(String healthCheckId) async {}

  /// Gets information about a specified hosted zone including the four name
  /// servers assigned to the hosted zone.
  Future<void> getHostedZone(String id) async {}

  /// Retrieves the number of hosted zones that are associated with the current
  /// AWS account.
  Future<void> getHostedZoneCount() async {}

  /// Gets the specified limit for a specified hosted zone, for example, the
  /// maximum number of records that you can create in the hosted zone.
  ///
  /// For the default limit, see
  /// [Limits](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html)
  /// in the _Amazon Route 53 Developer Guide_. To request a higher limit, [open
  /// a
  /// case](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-route53).
  Future<void> getHostedZoneLimit(
      {@required String type, @required String hostedZoneId}) async {}

  /// Gets information about a specified configuration for DNS query logging.
  ///
  /// For more information about DNS query logs, see
  /// [CreateQueryLoggingConfig](https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html)
  /// and [Logging DNS
  /// Queries](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html).
  Future<void> getQueryLoggingConfig(String id) async {}

  /// Retrieves information about a specified reusable delegation set, including
  /// the four name servers that are assigned to the delegation set.
  Future<void> getReusableDelegationSet(String id) async {}

  /// Gets the maximum number of hosted zones that you can associate with the
  /// specified reusable delegation set.
  ///
  /// For the default limit, see
  /// [Limits](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html)
  /// in the _Amazon Route 53 Developer Guide_. To request a higher limit, [open
  /// a
  /// case](https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&limitType=service-code-route53).
  Future<void> getReusableDelegationSetLimit(
      {@required String type, @required String delegationSetId}) async {}

  /// Gets information about a specific traffic policy version.
  Future<void> getTrafficPolicy(
      {@required String id, @required int version}) async {}

  /// Gets information about a specified traffic policy instance.
  ///
  ///  After you submit a `CreateTrafficPolicyInstance` or an
  /// `UpdateTrafficPolicyInstance` request, there's a brief delay while Amazon
  /// Route 53 creates the resource record sets that are specified in the
  /// traffic policy definition. For more information, see the `State` response
  /// element.
  ///
  /// In the Route 53 console, traffic policy instances are known as policy
  /// records.
  Future<void> getTrafficPolicyInstance(String id) async {}

  /// Gets the number of traffic policy instances that are associated with the
  /// current AWS account.
  Future<void> getTrafficPolicyInstanceCount() async {}

  /// Retrieves a list of supported geographic locations.
  ///
  /// Countries are listed first, and continents are listed last. If Amazon
  /// Route 53 supports subdivisions for a country (for example, states or
  /// provinces), the subdivisions for that country are listed in alphabetical
  /// order immediately after the corresponding country.
  Future<void> listGeoLocations(
      {String startContinentCode,
      String startCountryCode,
      String startSubdivisionCode,
      String maxItems}) async {}

  /// Retrieve a list of the health checks that are associated with the current
  /// AWS account.
  Future<void> listHealthChecks({String marker, String maxItems}) async {}

  /// Retrieves a list of the public and private hosted zones that are
  /// associated with the current AWS account. The response includes a
  /// `HostedZones` child element for each hosted zone.
  ///
  /// Amazon Route 53 returns a maximum of 100 items in each response. If you
  /// have a lot of hosted zones, you can use the `maxitems` parameter to list
  /// them in groups of up to 100.
  Future<void> listHostedZones(
      {String marker, String maxItems, String delegationSetId}) async {}

  /// Retrieves a list of your hosted zones in lexicographic order. The response
  /// includes a `HostedZones` child element for each hosted zone created by the
  /// current AWS account.
  ///
  ///  `ListHostedZonesByName` sorts hosted zones by name with the labels
  /// reversed. For example:
  ///
  ///  `com.example.www.`
  ///
  /// Note the trailing dot, which can change the sort order in some
  /// circumstances.
  ///
  /// If the domain name includes escape characters or Punycode,
  /// `ListHostedZonesByName` alphabetizes the domain name using the escaped or
  /// Punycoded value, which is the format that Amazon Route 53 saves in its
  /// database. For example, to create a hosted zone for exämple.com, you
  /// specify ex\\344mple.com for the domain name. `ListHostedZonesByName`
  /// alphabetizes it as:
  ///
  ///  `com.ex\\344mple.`
  ///
  /// The labels are reversed and alphabetized using the escaped value. For more
  /// information about valid domain name formats, including internationalized
  /// domain names, see [DNS Domain Name
  /// Format](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html)
  /// in the _Amazon Route 53 Developer Guide_.
  ///
  /// Route 53 returns up to 100 items in each response. If you have a lot of
  /// hosted zones, use the `MaxItems` parameter to list them in groups of up to
  /// 100. The response includes values that help navigate from one group of
  /// `MaxItems` hosted zones to the next:
  ///
  /// *   The `DNSName` and `HostedZoneId` elements in the response contain the
  /// values, if any, specified for the `dnsname` and `hostedzoneid` parameters
  /// in the request that produced the current response.
  ///
  /// *   The `MaxItems` element in the response contains the value, if any,
  /// that you specified for the `maxitems` parameter in the request that
  /// produced the current response.
  ///
  /// *   If the value of `IsTruncated` in the response is true, there are more
  /// hosted zones associated with the current AWS account.
  ///
  ///     If `IsTruncated` is false, this response includes the last hosted zone
  /// that is associated with the current account. The `NextDNSName` element and
  /// `NextHostedZoneId` elements are omitted from the response.
  ///
  /// *   The `NextDNSName` and `NextHostedZoneId` elements in the response
  /// contain the domain name and the hosted zone ID of the next hosted zone
  /// that is associated with the current AWS account. If you want to list more
  /// hosted zones, make another call to `ListHostedZonesByName`, and specify
  /// the value of `NextDNSName` and `NextHostedZoneId` in the `dnsname` and
  /// `hostedzoneid` parameters, respectively.
  Future<void> listHostedZonesByName(
      {String dnsName, String hostedZoneId, String maxItems}) async {}

  /// Lists the configurations for DNS query logging that are associated with
  /// the current AWS account or the configuration that is associated with a
  /// specified hosted zone.
  ///
  /// For more information about DNS query logs, see
  /// [CreateQueryLoggingConfig](https://docs.aws.amazon.com/Route53/latest/APIReference/API_CreateQueryLoggingConfig.html).
  /// Additional information, including the format of DNS query logs, appears in
  /// [Logging DNS
  /// Queries](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html)
  /// in the _Amazon Route 53 Developer Guide_.
  Future<void> listQueryLoggingConfigs(
      {String hostedZoneId, String nextToken, String maxResults}) async {}

  /// Lists the resource record sets in a specified hosted zone.
  ///
  ///  `ListResourceRecordSets` returns up to 100 resource record sets at a time
  /// in ASCII order, beginning at a position specified by the `name` and `type`
  /// elements.
  ///
  ///  **Sort order**
  ///
  ///  `ListResourceRecordSets` sorts results first by DNS name with the labels
  /// reversed, for example:
  ///
  ///  `com.example.www.`
  ///
  /// Note the trailing dot, which can change the sort order when the record
  /// name contains characters that appear before `.` (decimal 46) in the ASCII
  /// table. These characters include the following: `! " # $ % & ' ( ) \* \+ ,
  /// -`
  ///
  /// When multiple records have the same DNS name, `ListResourceRecordSets`
  /// sorts results by the record type.
  ///
  ///  **Specifying where to start listing records**
  ///
  /// You can use the name and type elements to specify the resource record set
  /// that the list begins with:
  ///
  /// If you do not specify Name or Type
  ///
  /// The results begin with the first resource record set that the hosted zone
  /// contains.
  ///
  /// If you specify Name but not Type
  ///
  /// The results begin with the first resource record set in the list whose
  /// name is greater than or equal to `Name`.
  ///
  /// If you specify Type but not Name
  ///
  /// Amazon Route 53 returns the `InvalidInput` error.
  ///
  /// If you specify both Name and Type
  ///
  /// The results begin with the first resource record set in the list whose
  /// name is greater than or equal to `Name`, and whose type is greater than or
  /// equal to `Type`.
  ///
  ///  **Resource record sets that are PENDING**
  ///
  /// This action returns the most current version of the records. This includes
  /// records that are `PENDING`, and that are not yet available on all Route 53
  /// DNS servers.
  ///
  ///  **Changing resource record sets**
  ///
  /// To ensure that you get an accurate listing of the resource record sets for
  /// a hosted zone at a point in time, do not submit a
  /// `ChangeResourceRecordSets` request while you're paging through the results
  /// of a `ListResourceRecordSets` request. If you do, some pages may display
  /// results without the latest changes while other pages display results with
  /// the latest changes.
  ///
  ///  **Displaying the next page of results**
  ///
  /// If a `ListResourceRecordSets` command returns more than one page of
  /// results, the value of `IsTruncated` is `true`. To display the next page of
  /// results, get the values of `NextRecordName`, `NextRecordType`, and
  /// `NextRecordIdentifier` (if any) from the response. Then submit another
  /// `ListResourceRecordSets` request, and specify those values for
  /// `StartRecordName`, `StartRecordType`, and `StartRecordIdentifier`.
  Future<void> listResourceRecordSets(String hostedZoneId,
      {String startRecordName,
      String startRecordType,
      String startRecordIdentifier,
      String maxItems}) async {}

  /// Retrieves a list of the reusable delegation sets that are associated with
  /// the current AWS account.
  Future<void> listReusableDelegationSets(
      {String marker, String maxItems}) async {}

  /// Lists tags for one health check or hosted zone.
  ///
  /// For information about using tags for cost allocation, see [Using Cost
  /// Allocation
  /// Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<void> listTagsForResource(
      {@required String resourceType, @required String resourceId}) async {}

  /// Lists tags for up to 10 health checks or hosted zones.
  ///
  /// For information about using tags for cost allocation, see [Using Cost
  /// Allocation
  /// Tags](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html)
  /// in the _AWS Billing and Cost Management User Guide_.
  Future<void> listTagsForResources(
      {@required String resourceType,
      @required List<String> resourceIds}) async {}

  /// Gets information about the latest version for every traffic policy that is
  /// associated with the current AWS account. Policies are listed in the order
  /// that they were created in.
  Future<void> listTrafficPolicies(
      {String trafficPolicyIdMarker, String maxItems}) async {}

  /// Gets information about the traffic policy instances that you created by
  /// using the current AWS account.
  ///
  ///  After you submit an `UpdateTrafficPolicyInstance` request, there's a
  /// brief delay while Amazon Route 53 creates the resource record sets that
  /// are specified in the traffic policy definition. For more information, see
  /// the `State` response element.
  ///
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the `MaxItems` parameter to
  /// list them in groups of up to 100.
  Future<void> listTrafficPolicyInstances(
      {String hostedZoneIdMarker,
      String trafficPolicyInstanceNameMarker,
      String trafficPolicyInstanceTypeMarker,
      String maxItems}) async {}

  /// Gets information about the traffic policy instances that you created in a
  /// specified hosted zone.
  ///
  ///  After you submit a `CreateTrafficPolicyInstance` or an
  /// `UpdateTrafficPolicyInstance` request, there's a brief delay while Amazon
  /// Route 53 creates the resource record sets that are specified in the
  /// traffic policy definition. For more information, see the `State` response
  /// element.
  ///
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the `MaxItems` parameter to
  /// list them in groups of up to 100.
  Future<void> listTrafficPolicyInstancesByHostedZone(String hostedZoneId,
      {String trafficPolicyInstanceNameMarker,
      String trafficPolicyInstanceTypeMarker,
      String maxItems}) async {}

  /// Gets information about the traffic policy instances that you created by
  /// using a specify traffic policy version.
  ///
  ///  After you submit a `CreateTrafficPolicyInstance` or an
  /// `UpdateTrafficPolicyInstance` request, there's a brief delay while Amazon
  /// Route 53 creates the resource record sets that are specified in the
  /// traffic policy definition. For more information, see the `State` response
  /// element.
  ///
  /// Route 53 returns a maximum of 100 items in each response. If you have a
  /// lot of traffic policy instances, you can use the `MaxItems` parameter to
  /// list them in groups of up to 100.
  Future<void> listTrafficPolicyInstancesByPolicy(
      {@required String trafficPolicyId,
      @required int trafficPolicyVersion,
      String hostedZoneIdMarker,
      String trafficPolicyInstanceNameMarker,
      String trafficPolicyInstanceTypeMarker,
      String maxItems}) async {}

  /// Gets information about all of the versions for a specified traffic policy.
  ///
  /// Traffic policy versions are listed in numerical order by `VersionNumber`.
  Future<void> listTrafficPolicyVersions(String id,
      {String trafficPolicyVersionMarker, String maxItems}) async {}

  /// Gets a list of the VPCs that were created by other accounts and that can
  /// be associated with a specified hosted zone because you've submitted one or
  /// more `CreateVPCAssociationAuthorization` requests.
  ///
  /// The response includes a `VPCs` element with a `VPC` child element for each
  /// VPC that can be associated with the hosted zone.
  Future<void> listVpcAssociationAuthorizations(String hostedZoneId,
      {String nextToken, String maxResults}) async {}

  /// Gets the value that Amazon Route 53 returns in response to a DNS request
  /// for a specified record name and type. You can optionally specify the IP
  /// address of a DNS resolver, an EDNS0 client subnet IP address, and a subnet
  /// mask.
  Future<void> testDnsAnswer(
      {@required String hostedZoneId,
      @required String recordName,
      @required String recordType,
      String resolverIP,
      String edns0ClientSubnetIP,
      String edns0ClientSubnetMask}) async {}

  /// Updates an existing health check. Note that some values can't be updated.
  ///
  /// For more information about updating health checks, see [Creating,
  /// Updating, and Deleting Health
  /// Checks](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-creating-deleting.html)
  /// in the _Amazon Route 53 Developer Guide_.
  Future<void> updateHealthCheck(String healthCheckId,
      {BigInt healthCheckVersion,
      String ipAddress,
      int port,
      String resourcePath,
      String fullyQualifiedDomainName,
      String searchString,
      int failureThreshold,
      bool inverted,
      bool disabled,
      int healthThreshold,
      List<String> childHealthChecks,
      bool enableSni,
      List<String> regions,
      AlarmIdentifier alarmIdentifier,
      String insufficientDataHealthStatus,
      List<String> resetElements}) async {}

  /// Updates the comment for a specified hosted zone.
  Future<void> updateHostedZoneComment(String id, {String comment}) async {}

  /// Updates the comment for a specified traffic policy version.
  Future<void> updateTrafficPolicyComment(
      {@required String id,
      @required int version,
      @required String comment}) async {}

  /// Updates the resource record sets in a specified hosted zone that were
  /// created based on the settings in a specified traffic policy version.
  ///
  /// When you update a traffic policy instance, Amazon Route 53 continues to
  /// respond to DNS queries for the root resource record set name (such as
  /// example.com) while it replaces one group of resource record sets with
  /// another. Route 53 performs the following operations:
  ///
  /// 1.  Route 53 creates a new group of resource record sets based on the
  /// specified traffic policy. This is true regardless of how significant the
  /// differences are between the existing resource record sets and the new
  /// resource record sets.
  ///
  /// 2.  When all of the new resource record sets have been created, Route 53
  /// starts to respond to DNS queries for the root resource record set name
  /// (such as example.com) by using the new resource record sets.
  ///
  /// 3.  Route 53 deletes the old group of resource record sets that are
  /// associated with the root resource record set name.
  Future<void> updateTrafficPolicyInstance(
      {@required String id,
      @required BigInt ttl,
      @required String trafficPolicyId,
      @required int trafficPolicyVersion}) async {}
}

class AccountLimit {}

class AlarmIdentifier {}

class AliasTarget {}

class AssociateVpcWithHostedZoneResponse {}

class Change {}

class ChangeBatch {}

class ChangeInfo {}

class ChangeResourceRecordSetsResponse {}

class ChangeTagsForResourceResponse {}

class CloudWatchAlarmConfiguration {}

class CreateHealthCheckResponse {}

class CreateHostedZoneResponse {}

class CreateQueryLoggingConfigResponse {}

class CreateReusableDelegationSetResponse {}

class CreateTrafficPolicyInstanceResponse {}

class CreateTrafficPolicyResponse {}

class CreateTrafficPolicyVersionResponse {}

class CreateVpcAssociationAuthorizationResponse {}

class DelegationSet {}

class DeleteHealthCheckResponse {}

class DeleteHostedZoneResponse {}

class DeleteQueryLoggingConfigResponse {}

class DeleteReusableDelegationSetResponse {}

class DeleteTrafficPolicyInstanceResponse {}

class DeleteTrafficPolicyResponse {}

class DeleteVpcAssociationAuthorizationResponse {}

class Dimension {}

class DisassociateVpcFromHostedZoneResponse {}

class GeoLocation {}

class GeoLocationDetails {}

class GetAccountLimitResponse {}

class GetChangeResponse {}

class GetCheckerIpRangesResponse {}

class GetGeoLocationResponse {}

class GetHealthCheckCountResponse {}

class GetHealthCheckLastFailureReasonResponse {}

class GetHealthCheckResponse {}

class GetHealthCheckStatusResponse {}

class GetHostedZoneCountResponse {}

class GetHostedZoneLimitResponse {}

class GetHostedZoneResponse {}

class GetQueryLoggingConfigResponse {}

class GetReusableDelegationSetLimitResponse {}

class GetReusableDelegationSetResponse {}

class GetTrafficPolicyInstanceCountResponse {}

class GetTrafficPolicyInstanceResponse {}

class GetTrafficPolicyResponse {}

class HealthCheck {}

class HealthCheckConfig {}

class HealthCheckObservation {}

class HostedZone {}

class HostedZoneConfig {}

class HostedZoneLimit {}

class LinkedService {}

class ListGeoLocationsResponse {}

class ListHealthChecksResponse {}

class ListHostedZonesByNameResponse {}

class ListHostedZonesResponse {}

class ListQueryLoggingConfigsResponse {}

class ListResourceRecordSetsResponse {}

class ListReusableDelegationSetsResponse {}

class ListTagsForResourceResponse {}

class ListTagsForResourcesResponse {}

class ListTrafficPoliciesResponse {}

class ListTrafficPolicyInstancesByHostedZoneResponse {}

class ListTrafficPolicyInstancesByPolicyResponse {}

class ListTrafficPolicyInstancesResponse {}

class ListTrafficPolicyVersionsResponse {}

class ListVpcAssociationAuthorizationsResponse {}

class QueryLoggingConfig {}

class ResourceRecord {}

class ResourceRecordSet {}

class ResourceTagSet {}

class ReusableDelegationSetLimit {}

class StatusReport {}

class Tag {}

class TestDnsAnswerResponse {}

class TrafficPolicy {}

class TrafficPolicyInstance {}

class TrafficPolicySummary {}

class UpdateHealthCheckResponse {}

class UpdateHostedZoneCommentResponse {}

class UpdateTrafficPolicyCommentResponse {}

class UpdateTrafficPolicyInstanceResponse {}

class Vpc {}
