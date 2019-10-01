import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon Elastic Compute Cloud
///
/// Amazon Elastic Compute Cloud (Amazon EC2) provides secure and resizable
/// computing capacity in the AWS cloud. Using Amazon EC2 eliminates the need to
/// invest in hardware up front, so you can develop and deploy applications
/// faster.
///
/// To learn more, see the following resources:
///
/// *   Amazon EC2: [AmazonEC2 product page](http://aws.amazon.com/ec2), [Amazon
/// EC2 documentation](http://aws.amazon.com/documentation/ec2)
///
/// *   Amazon EBS: [Amazon EBS product page](http://aws.amazon.com/ebs),
/// [Amazon EBS
/// documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)
///
/// *   Amazon VPC: [Amazon VPC product page](http://aws.amazon.com/vpc),
/// [Amazon VPC documentation](http://aws.amazon.com/documentation/vpc)
///
/// *   AWS VPN: [AWS VPN product page](http://aws.amazon.com/vpn), [AWS VPN
/// documentation](http://aws.amazon.com/documentation/vpn)
class Ec2Api {
  /// Accepts the Convertible Reserved Instance exchange quote described in the
  /// GetReservedInstancesExchangeQuote call.
  Future<void> acceptReservedInstancesExchangeQuote(
      List<String> reservedInstanceIds,
      {bool dryRun,
      List<TargetConfigurationRequest> targetConfigurations}) async {}

  /// Accepts a request to attach a VPC to a transit gateway.
  ///
  /// The VPC attachment must be in the `pendingAcceptance` state. Use
  /// DescribeTransitGatewayVpcAttachments to view your pending VPC attachment
  /// requests. Use RejectTransitGatewayVpcAttachment to reject a VPC attachment
  /// request.
  Future<void> acceptTransitGatewayVpcAttachment(
      String transitGatewayAttachmentId,
      {bool dryRun}) async {}

  /// Accepts one or more interface VPC endpoint connection requests to your VPC
  /// endpoint service.
  Future<void> acceptVpcEndpointConnections(
      {bool dryRun,
      @required String serviceId,
      @required List<String> vpcEndpointIds}) async {}

  /// Accept a VPC peering connection request. To accept a request, the VPC
  /// peering connection must be in the `pending-acceptance` state, and you must
  /// be the owner of the peer VPC. Use DescribeVpcPeeringConnections to view
  /// your outstanding VPC peering connection requests.
  ///
  /// For an inter-Region VPC peering connection request, you must accept the
  /// VPC peering connection in the Region of the accepter VPC.
  Future<void> acceptVpcPeeringConnection(
      {bool dryRun, String vpcPeeringConnectionId}) async {}

  /// Advertises an IPv4 address range that is provisioned for use with your AWS
  /// resources through bring your own IP addresses (BYOIP).
  ///
  /// You can perform this operation at most once every 10 seconds, even if you
  /// specify different address ranges each time.
  ///
  /// We recommend that you stop advertising the BYOIP CIDR from other locations
  /// when you advertise it from AWS. To minimize down time, you can configure
  /// your AWS resources to use an address from a BYOIP CIDR before it is
  /// advertised, and then simultaneously stop advertising it from the current
  /// location and start advertising it through AWS.
  ///
  /// It can take a few minutes before traffic to the specified addresses starts
  /// routing to AWS because of BGP propagation delays.
  ///
  /// To stop advertising the BYOIP CIDR, use WithdrawByoipCidr.
  Future<void> advertiseByoipCidr(String cidr, {bool dryRun}) async {}

  /// Allocates an Elastic IP address to your AWS account. After you allocate
  /// the Elastic IP address you can associate it with an instance or network
  /// interface. After you release an Elastic IP address, it is released to the
  /// IP address pool and can be allocated to a different AWS account.
  ///
  /// You can allocate an Elastic IP address from an address pool owned by AWS
  /// or from an address pool created from a public IPv4 address range that you
  /// have brought to AWS for use with your AWS resources using bring your own
  /// IP addresses (BYOIP). For more information, see [Bring Your Own IP
  /// Addresses
  /// (BYOIP)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// \[EC2-VPC\] If you release an Elastic IP address, you might be able to
  /// recover it. You cannot recover an Elastic IP address that you released
  /// after it is allocated to another AWS account. You cannot recover an
  /// Elastic IP address for EC2-Classic. To attempt to recover an Elastic IP
  /// address that you released, specify it in this operation.
  ///
  /// An Elastic IP address is for use either in the EC2-Classic platform or in
  /// a VPC. By default, you can allocate 5 Elastic IP addresses for EC2-Classic
  /// per Region and 5 Elastic IP addresses for EC2-VPC per Region.
  ///
  /// For more information, see [Elastic IP
  /// Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> allocateAddress(
      {String domain,
      String address,
      String publicIpv4Pool,
      bool dryRun}) async {}

  /// Allocates a Dedicated Host to your account. At a minimum, specify the
  /// instance size type, Availability Zone, and quantity of hosts to allocate.
  Future<void> allocateHosts(
      {String autoPlacement,
      @required String availabilityZone,
      String clientToken,
      @required String instanceType,
      @required int quantity,
      List<TagSpecification> tagSpecifications,
      String hostRecovery}) async {}

  /// Applies a security group to the association between the target network and
  /// the Client VPN endpoint. This action replaces the existing security groups
  /// with the specified security groups.
  Future<void> applySecurityGroupsToClientVpnTargetNetwork(
      {@required String clientVpnEndpointId,
      @required String vpcId,
      @required List<String> securityGroupIds,
      bool dryRun}) async {}

  /// Assigns one or more IPv6 addresses to the specified network interface. You
  /// can specify one or more specific IPv6 addresses, or you can specify the
  /// number of IPv6 addresses to be automatically assigned from within the
  /// subnet's IPv6 CIDR block range. You can assign as many IPv6 addresses to a
  /// network interface as you can assign private IPv4 addresses, and the limit
  /// varies per instance type. For information, see [IP Addresses Per Network
  /// Interface Per Instance
  /// Type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> assignIpv6Addresses(String networkInterfaceId,
      {int ipv6AddressCount, List<String> ipv6Addresses}) async {}

  /// Assigns one or more secondary private IP addresses to the specified
  /// network interface.
  ///
  /// You can specify one or more specific secondary IP addresses, or you can
  /// specify the number of secondary IP addresses to be automatically assigned
  /// within the subnet's CIDR block range. The number of secondary IP addresses
  /// that you can assign to an instance varies by instance type. For
  /// information about instance types, see [Instance
  /// Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_. For more information
  /// about Elastic IP addresses, see [Elastic IP
  /// Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// When you move a secondary private IP address to another network interface,
  /// any Elastic IP address that is associated with the IP address is also
  /// moved.
  ///
  /// Remapping an IP address is an asynchronous operation. When you move an IP
  /// address from one network interface to another, check
  /// `network/interfaces/macs/mac/local-ipv4s` in the instance metadata to
  /// confirm that the remapping is complete.
  Future<void> assignPrivateIpAddresses(String networkInterfaceId,
      {bool allowReassignment,
      List<String> privateIpAddresses,
      int secondaryPrivateIpAddressCount}) async {}

  /// Associates an Elastic IP address with an instance or a network interface.
  /// Before you can use an Elastic IP address, you must allocate it to your
  /// account.
  ///
  /// An Elastic IP address is for use in either the EC2-Classic platform or in
  /// a VPC. For more information, see [Elastic IP
  /// Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// \[EC2-Classic, VPC in an EC2-VPC-only account\] If the Elastic IP address
  /// is already associated with a different instance, it is disassociated from
  /// that instance and associated with the specified instance. If you associate
  /// an Elastic IP address with an instance that has an existing Elastic IP
  /// address, the existing address is disassociated from the instance, but
  /// remains allocated to your account.
  ///
  /// \[VPC in an EC2-Classic account\] If you don't specify a private IP
  /// address, the Elastic IP address is associated with the primary IP address.
  /// If the Elastic IP address is already associated with a different instance
  /// or a network interface, you get an error unless you allow reassociation.
  /// You cannot associate an Elastic IP address with an instance or network
  /// interface that has an existing Elastic IP address.
  ///
  ///
  ///
  /// This is an idempotent operation. If you perform the operation more than
  /// once, Amazon EC2 doesn't return an error, and you may be charged for each
  /// time the Elastic IP address is remapped to the same instance. For more
  /// information, see the _Elastic IP Addresses_ section of [Amazon EC2
  /// Pricing](http://aws.amazon.com/ec2/pricing/).
  Future<void> associateAddress(
      {String allocationId,
      String instanceId,
      String publicIp,
      bool allowReassociation,
      bool dryRun,
      String networkInterfaceId,
      String privateIpAddress}) async {}

  /// Associates a target network with a Client VPN endpoint. A target network
  /// is a subnet in a VPC. You can associate multiple subnets from the same VPC
  /// with a Client VPN endpoint. You can associate only one subnet in each
  /// Availability Zone. We recommend that you associate at least two subnets to
  /// provide Availability Zone redundancy.
  Future<void> associateClientVpnTargetNetwork(
      {@required String clientVpnEndpointId,
      @required String subnetId,
      String clientToken,
      bool dryRun}) async {}

  /// Associates a set of DHCP options (that you've previously created) with the
  /// specified VPC, or associates no DHCP options with the VPC.
  ///
  /// After you associate the options with the VPC, any existing instances and
  /// all new instances that you launch in that VPC use the options. You don't
  /// need to restart or relaunch the instances. They automatically pick up the
  /// changes within a few hours, depending on how frequently the instance
  /// renews its DHCP lease. You can explicitly renew the lease using the
  /// operating system on the instance.
  ///
  /// For more information, see [DHCP Options
  /// Sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> associateDhcpOptions(
      {@required String dhcpOptionsId,
      @required String vpcId,
      bool dryRun}) async {}

  /// Associates an IAM instance profile with a running or stopped instance. You
  /// cannot associate more than one IAM instance profile with an instance.
  Future<void> associateIamInstanceProfile(
      {@required IamInstanceProfileSpecification iamInstanceProfile,
      @required String instanceId}) async {}

  /// Associates a subnet with a route table. The subnet and route table must be
  /// in the same VPC. This association causes traffic originating from the
  /// subnet to be routed according to the routes in the route table. The action
  /// returns an association ID, which you need in order to disassociate the
  /// route table from the subnet later. A route table can be associated with
  /// multiple subnets.
  ///
  /// For more information, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> associateRouteTable(
      {bool dryRun,
      @required String routeTableId,
      @required String subnetId}) async {}

  /// Associates a CIDR block with your subnet. You can only associate a single
  /// IPv6 CIDR block with your subnet. An IPv6 CIDR block must have a prefix
  /// length of /64.
  Future<void> associateSubnetCidrBlock(
      {@required String ipv6CidrBlock, @required String subnetId}) async {}

  /// Associates the specified attachment with the specified transit gateway
  /// route table. You can associate only one route table with an attachment.
  Future<void> associateTransitGatewayRouteTable(
      {@required String transitGatewayRouteTableId,
      @required String transitGatewayAttachmentId,
      bool dryRun}) async {}

  /// Associates a CIDR block with your VPC. You can associate a secondary IPv4
  /// CIDR block, or you can associate an Amazon-provided IPv6 CIDR block. The
  /// IPv6 CIDR block size is fixed at /56.
  ///
  /// For more information about associating CIDR blocks with your VPC and
  /// applicable restrictions, see [VPC and Subnet
  /// Sizing](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#VPC_Sizing)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> associateVpcCidrBlock(String vpcId,
      {bool amazonProvidedIpv6CidrBlock, String cidrBlock}) async {}

  /// Links an EC2-Classic instance to a ClassicLink-enabled VPC through one or
  /// more of the VPC's security groups. You cannot link an EC2-Classic instance
  /// to more than one VPC at a time. You can only link an instance that's in
  /// the `running` state. An instance is automatically unlinked from a VPC when
  /// it's stopped - you can link it to the VPC again when you restart it.
  ///
  /// After you've linked an instance, you cannot change the VPC security groups
  /// that are associated with it. To change the security groups, you must first
  /// unlink the instance, and then link it again.
  ///
  /// Linking your instance to a VPC is sometimes referred to as _attaching_
  /// your instance.
  Future<void> attachClassicLinkVpc(
      {bool dryRun,
      @required List<String> groups,
      @required String instanceId,
      @required String vpcId}) async {}

  /// Attaches an internet gateway to a VPC, enabling connectivity between the
  /// internet and the VPC. For more information about your VPC and internet
  /// gateway, see the [Amazon Virtual Private Cloud User
  /// Guide](https://docs.aws.amazon.com/vpc/latest/userguide/).
  Future<void> attachInternetGateway(
      {bool dryRun,
      @required String internetGatewayId,
      @required String vpcId}) async {}

  /// Attaches a network interface to an instance.
  Future<void> attachNetworkInterface(
      {@required int deviceIndex,
      bool dryRun,
      @required String instanceId,
      @required String networkInterfaceId}) async {}

  /// Attaches an EBS volume to a running or stopped instance and exposes it to
  /// the instance with the specified device name.
  ///
  /// Encrypted EBS volumes must be attached to instances that support Amazon
  /// EBS encryption. For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// After you attach an EBS volume, you must make it available. For more
  /// information, see [Making an EBS Volume Available For
  /// Use](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html).
  ///
  /// If a volume has an AWS Marketplace product code:
  ///
  /// *   The volume can be attached only to a stopped instance.
  ///
  /// *   AWS Marketplace product codes are copied from the volume to the
  /// instance.
  ///
  /// *   You must be subscribed to the product.
  ///
  /// *   The instance type and operating system of the instance must support
  /// the product. For example, you can't detach a volume from a Windows
  /// instance and attach it to a Linux instance.
  ///
  ///
  /// For more information, see [Attaching Amazon EBS
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> attachVolume(
      {@required String device,
      @required String instanceId,
      @required String volumeId,
      bool dryRun}) async {}

  /// Attaches a virtual private gateway to a VPC. You can attach one virtual
  /// private gateway to one VPC at a time.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> attachVpnGateway(
      {@required String vpcId,
      @required String vpnGatewayId,
      bool dryRun}) async {}

  /// Adds an ingress authorization rule to a Client VPN endpoint. Ingress
  /// authorization rules act as firewall rules that grant access to networks.
  /// You must configure ingress authorization rules to enable clients to access
  /// resources in AWS or on-premises networks.
  Future<void> authorizeClientVpnIngress(
      {@required String clientVpnEndpointId,
      @required String targetNetworkCidr,
      String accessGroupId,
      bool authorizeAllGroups,
      String description,
      String clientToken,
      bool dryRun}) async {}

  /// \[VPC only\] Adds the specified egress rules to a security group for use
  /// with a VPC.
  ///
  /// An outbound rule permits instances to send traffic to the specified IPv4
  /// or IPv6 CIDR address ranges, or to the instances associated with the
  /// specified destination security groups.
  ///
  /// You specify a protocol for each rule (for example, TCP). For the TCP and
  /// UDP protocols, you must also specify the destination port or port range.
  /// For the ICMP protocol, you must also specify the ICMP type and code. You
  /// can use -1 for the type or code to mean all types or all codes.
  ///
  /// Rule changes are propagated to affected instances as quickly as possible.
  /// However, a small delay might occur.
  ///
  /// For more information about VPC security group limits, see [Amazon VPC
  /// Limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).
  Future<void> authorizeSecurityGroupEgress(String groupId,
      {bool dryRun,
      List<IpPermission> ipPermissions,
      String cidrIp,
      int fromPort,
      String ipProtocol,
      int toPort,
      String sourceSecurityGroupName,
      String sourceSecurityGroupOwnerId}) async {}

  /// Adds the specified ingress rules to a security group.
  ///
  /// An inbound rule permits instances to receive traffic from the specified
  /// IPv4 or IPv6 CIDR address ranges, or from the instances associated with
  /// the specified destination security groups.
  ///
  /// You specify a protocol for each rule (for example, TCP). For TCP and UDP,
  /// you must also specify the destination port or port range. For ICMP/ICMPv6,
  /// you must also specify the ICMP/ICMPv6 type and code. You can use -1 to
  /// mean all types or all codes.
  ///
  /// Rule changes are propagated to instances within the security group as
  /// quickly as possible. However, a small delay might occur.
  ///
  /// For more information about VPC security group limits, see [Amazon VPC
  /// Limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).
  Future<void> authorizeSecurityGroupIngress(
      {String cidrIp,
      int fromPort,
      String groupId,
      String groupName,
      List<IpPermission> ipPermissions,
      String ipProtocol,
      String sourceSecurityGroupName,
      String sourceSecurityGroupOwnerId,
      int toPort,
      bool dryRun}) async {}

  /// Bundles an Amazon instance store-backed Windows instance.
  ///
  /// During bundling, only the root device volume (C:\\) is bundled. Data on
  /// other instance store volumes is not preserved.
  ///
  ///
  ///
  /// This action is not applicable for Linux/Unix instances or Windows
  /// instances that are backed by Amazon EBS.
  Future<void> bundleInstance(
      {@required String instanceId,
      @required Storage storage,
      bool dryRun}) async {}

  /// Cancels a bundling operation for an instance store-backed Windows
  /// instance.
  Future<void> cancelBundleTask(String bundleId, {bool dryRun}) async {}

  /// Cancels the specified Capacity Reservation, releases the reserved
  /// capacity, and changes the Capacity Reservation's state to `cancelled`.
  ///
  /// Instances running in the reserved capacity continue running until you stop
  /// them. Stopped instances that target the Capacity Reservation can no longer
  /// launch. Modify these instances to either target a different Capacity
  /// Reservation, launch On-Demand Instance capacity, or run in any open
  /// Capacity Reservation that has matching attributes and sufficient capacity.
  Future<void> cancelCapacityReservation(String capacityReservationId,
      {bool dryRun}) async {}

  /// Cancels an active conversion task. The task can be the import of an
  /// instance or volume. The action removes all artifacts of the conversion,
  /// including a partially uploaded volume or instance. If the conversion is
  /// complete or is in the process of transferring the final disk image, the
  /// command fails and returns an exception.
  ///
  /// For more information, see [Importing a Virtual Machine Using the Amazon
  /// EC2
  /// CLI](https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html).
  Future<void> cancelConversionTask(String conversionTaskId,
      {bool dryRun, String reasonMessage}) async {}

  /// Cancels an active export task. The request removes all artifacts of the
  /// export, including any partially-created Amazon S3 objects. If the export
  /// task is complete or is in the process of transferring the final disk
  /// image, the command fails and returns an error.
  Future<void> cancelExportTask(String exportTaskId) async {}

  /// Cancels an in-process import virtual machine or import snapshot task.
  Future<void> cancelImportTask(
      {String cancelReason, bool dryRun, String importTaskId}) async {}

  /// Cancels the specified Reserved Instance listing in the Reserved Instance
  /// Marketplace.
  ///
  /// For more information, see [Reserved Instance
  /// Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> cancelReservedInstancesListing(
      String reservedInstancesListingId) async {}

  /// Cancels the specified Spot Fleet requests.
  ///
  /// After you cancel a Spot Fleet request, the Spot Fleet launches no new Spot
  /// Instances. You must specify whether the Spot Fleet should also terminate
  /// its Spot Instances. If you terminate the instances, the Spot Fleet request
  /// enters the `cancelled_terminating` state. Otherwise, the Spot Fleet
  /// request enters the `cancelled_running` state and the instances continue to
  /// run until they are interrupted or you terminate them manually.
  Future<void> cancelSpotFleetRequests(
      {bool dryRun,
      @required List<String> spotFleetRequestIds,
      @required bool terminateInstances}) async {}

  /// Cancels one or more Spot Instance requests.
  ///
  ///
  ///
  /// Canceling a Spot Instance request does not terminate running Spot
  /// Instances associated with the request.
  Future<void> cancelSpotInstanceRequests(List<String> spotInstanceRequestIds,
      {bool dryRun}) async {}

  /// Determines whether a product code is associated with an instance. This
  /// action can only be used by the owner of the product code. It is useful
  /// when a product code owner must verify whether another user's instance is
  /// eligible for support.
  Future<void> confirmProductInstance(
      {@required String instanceId,
      @required String productCode,
      bool dryRun}) async {}

  /// Copies the specified Amazon FPGA Image (AFI) to the current Region.
  Future<void> copyFpgaImage(
      {bool dryRun,
      @required String sourceFpgaImageId,
      String description,
      String name,
      @required String sourceRegion,
      String clientToken}) async {}

  /// Initiates the copy of an AMI from the specified source Region to the
  /// current Region. You specify the destination Region by using its endpoint
  /// when making the request.
  ///
  /// Copies of encrypted backing snapshots for the AMI are encrypted. Copies of
  /// unencrypted backing snapshots remain unencrypted, unless you set
  /// `Encrypted` during the copy operation. You cannot create an unencrypted
  /// copy of an encrypted backing snapshot.
  ///
  /// For more information about the prerequisites and limits when copying an
  /// AMI, see [Copying an
  /// AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> copyImage(
      {String clientToken,
      String description,
      bool encrypted,
      String kmsKeyId,
      @required String name,
      @required String sourceImageId,
      @required String sourceRegion,
      bool dryRun}) async {}

  /// Copies a point-in-time snapshot of an EBS volume and stores it in Amazon
  /// S3. You can copy the snapshot within the same Region or from one Region to
  /// another. You can use the snapshot to create EBS volumes or Amazon Machine
  /// Images (AMIs).
  ///
  /// Copies of encrypted EBS snapshots remain encrypted. Copies of unencrypted
  /// snapshots remain unencrypted, unless you enable encryption for the
  /// snapshot copy operation. By default, encrypted snapshot copies use the
  /// default AWS Key Management Service (AWS KMS) customer master key (CMK);
  /// however, you can specify a different CMK.
  ///
  /// To copy an encrypted snapshot that has been shared from another account,
  /// you must have permissions for the CMK used to encrypt the snapshot.
  ///
  /// Snapshots created by copying another snapshot have an arbitrary volume ID
  /// that should not be used for any purpose.
  ///
  /// For more information, see [Copying an Amazon EBS
  /// Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> copySnapshot(
      {String description,
      String destinationRegion,
      bool encrypted,
      String kmsKeyId,
      String presignedUrl,
      @required String sourceRegion,
      @required String sourceSnapshotId,
      bool dryRun}) async {}

  /// Creates a new Capacity Reservation with the specified attributes.
  ///
  /// Capacity Reservations enable you to reserve capacity for your Amazon EC2
  /// instances in a specific Availability Zone for any duration. This gives you
  /// the flexibility to selectively add capacity reservations and still get the
  /// Regional RI discounts for that usage. By creating Capacity Reservations,
  /// you ensure that you always have access to Amazon EC2 capacity when you
  /// need it, for as long as you need it. For more information, see [Capacity
  /// Reservations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// Your request to create a Capacity Reservation could fail if Amazon EC2
  /// does not have sufficient capacity to fulfill the request. If your request
  /// fails due to Amazon EC2 capacity constraints, either try again at a later
  /// time, try in a different Availability Zone, or request a smaller capacity
  /// reservation. If your application is flexible across instance types and
  /// sizes, try to create a Capacity Reservation with different instance
  /// attributes.
  ///
  /// Your request could also fail if the requested quantity exceeds your
  /// On-Demand Instance limit for the selected instance type. If your request
  /// fails due to limit constraints, increase your On-Demand Instance limit for
  /// the required instance type and try again. For more information about
  /// increasing your instance limits, see [Amazon EC2 Service
  /// Limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createCapacityReservation(
      {String clientToken,
      @required String instanceType,
      @required String instancePlatform,
      String availabilityZone,
      String availabilityZoneId,
      String tenancy,
      @required int instanceCount,
      bool ebsOptimized,
      bool ephemeralStorage,
      DateTime endDate,
      String endDateType,
      String instanceMatchCriteria,
      List<TagSpecification> tagSpecifications,
      bool dryRun}) async {}

  /// Creates a Client VPN endpoint. A Client VPN endpoint is the resource you
  /// create and configure to enable and manage client VPN sessions. It is the
  /// destination endpoint at which all client VPN sessions are terminated.
  Future<void> createClientVpnEndpoint(
      {@required String clientCidrBlock,
      @required String serverCertificateArn,
      @required List<ClientVpnAuthenticationRequest> authenticationOptions,
      @required ConnectionLogOptions connectionLogOptions,
      List<String> dnsServers,
      String transportProtocol,
      String description,
      bool splitTunnel,
      bool dryRun,
      String clientToken,
      List<TagSpecification> tagSpecifications}) async {}

  /// Adds a route to a network to a Client VPN endpoint. Each Client VPN
  /// endpoint has a route table that describes the available destination
  /// network routes. Each route in the route table specifies the path for traﬃc
  /// to speciﬁc resources or networks.
  Future<void> createClientVpnRoute(
      {@required String clientVpnEndpointId,
      @required String destinationCidrBlock,
      @required String targetVpcSubnetId,
      String description,
      String clientToken,
      bool dryRun}) async {}

  /// Provides information to AWS about your VPN customer gateway device. The
  /// customer gateway is the appliance at your end of the VPN connection. (The
  /// device on the AWS side of the VPN connection is the virtual private
  /// gateway.) You must provide the Internet-routable IP address of the
  /// customer gateway's external interface. The IP address must be static and
  /// can be behind a device performing network address translation (NAT).
  ///
  /// For devices that use Border Gateway Protocol (BGP), you can also provide
  /// the device's BGP Autonomous System Number (ASN). You can use an existing
  /// ASN assigned to your network. If you don't have an ASN already, you can
  /// use a private ASN (in the 64512 - 65534 range).
  ///
  ///  Amazon EC2 supports all 2-byte ASN numbers in the range of 1 - 65534,
  /// with the exception of 7224, which is reserved in the `us-east-1` Region,
  /// and 9059, which is reserved in the `eu-west-1` Region.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  ///
  ///
  ///
  /// You cannot create more than one customer gateway with the same VPN type,
  /// IP address, and BGP ASN parameter values. If you run an identical request
  /// more than one time, the first request creates the customer gateway, and
  /// subsequent requests return information about the existing customer
  /// gateway. The subsequent requests do not create new customer gateway
  /// resources.
  Future<void> createCustomerGateway(
      {@required int bgpAsn,
      String publicIp,
      String certificateArn,
      @required String type,
      bool dryRun}) async {}

  /// Creates a default subnet with a size `/20` IPv4 CIDR block in the
  /// specified Availability Zone in your default VPC. You can have only one
  /// default subnet per Availability Zone. For more information, see [Creating
  /// a Default
  /// Subnet](https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html#create-default-subnet)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createDefaultSubnet(String availabilityZone,
      {bool dryRun}) async {}

  /// Creates a default VPC with a size `/16` IPv4 CIDR block and a default
  /// subnet in each Availability Zone. For more information about the
  /// components of a default VPC, see [Default VPC and Default
  /// Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html)
  /// in the _Amazon Virtual Private Cloud User Guide_. You cannot specify the
  /// components of the default VPC yourself.
  ///
  /// If you deleted your previous default VPC, you can create a default VPC.
  /// You cannot have more than one default VPC per Region.
  ///
  /// If your account supports EC2-Classic, you cannot use this action to create
  /// a default VPC in a Region that supports EC2-Classic. If you want a default
  /// VPC in a Region that supports EC2-Classic, see "I really want a default
  /// VPC for my existing EC2 account. Is that possible?" in the [Default VPCs
  /// FAQ](http://aws.amazon.com/vpc/faqs/#Default_VPCs).
  Future<void> createDefaultVpc({bool dryRun}) async {}

  /// Creates a set of DHCP options for your VPC. After creating the set, you
  /// must associate it with the VPC, causing all existing and new instances
  /// that you launch in the VPC to use this set of DHCP options. The following
  /// are the individual DHCP options you can specify. For more information
  /// about the options, see [RFC 2132](http://www.ietf.org/rfc/rfc2132.txt).
  ///
  /// *    `domain-name-servers` \- The IP addresses of up to four domain name
  /// servers, or AmazonProvidedDNS. The default DHCP option set specifies
  /// AmazonProvidedDNS. If specifying more than one domain name server, specify
  /// the IP addresses in a single parameter, separated by commas. To have your
  /// instance receive a custom DNS hostname as specified in `domain-name`, you
  /// must set `domain-name-servers` to a custom DNS server.
  ///
  /// *    `domain-name` \- If you're using AmazonProvidedDNS in `us-east-1`,
  /// specify `ec2.internal`. If you're using AmazonProvidedDNS in another
  /// Region, specify `region.compute.internal` (for example,
  /// `ap-northeast-1.compute.internal`). Otherwise, specify a domain name (for
  /// example, `MyCompany.com`). This value is used to complete unqualified DNS
  /// hostnames. **Important**: Some Linux operating systems accept multiple
  /// domain names separated by spaces. However, Windows and other Linux
  /// operating systems treat the value as a single domain, which results in
  /// unexpected behavior. If your DHCP options set is associated with a VPC
  /// that has instances with multiple operating systems, specify only one
  /// domain name.
  ///
  /// *    `ntp-servers` \- The IP addresses of up to four Network Time Protocol
  /// (NTP) servers.
  ///
  /// *    `netbios-name-servers` \- The IP addresses of up to four NetBIOS name
  /// servers.
  ///
  /// *    `netbios-node-type` \- The NetBIOS node type (1, 2, 4, or 8). We
  /// recommend that you specify 2 (broadcast and multicast are not currently
  /// supported). For more information about these node types, see [RFC
  /// 2132](http://www.ietf.org/rfc/rfc2132.txt).
  ///
  ///
  /// Your VPC automatically starts out with a set of DHCP options that includes
  /// only a DNS server that we provide (AmazonProvidedDNS). If you create a set
  /// of options, and if your VPC has an internet gateway, make sure to set the
  /// `domain-name-servers` option either to `AmazonProvidedDNS` or to a domain
  /// name server of your choice. For more information, see [DHCP Options
  /// Sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createDhcpOptions(List<NewDhcpConfiguration> dhcpConfigurations,
      {bool dryRun}) async {}

  /// \[IPv6 only\] Creates an egress-only internet gateway for your VPC. An
  /// egress-only internet gateway is used to enable outbound communication over
  /// IPv6 from instances in your VPC to the internet, and prevents hosts
  /// outside of your VPC from initiating an IPv6 connection with your instance.
  Future<void> createEgressOnlyInternetGateway(String vpcId,
      {String clientToken, bool dryRun}) async {}

  /// Launches an EC2 Fleet.
  ///
  /// You can create a single EC2 Fleet that includes multiple launch
  /// specifications that vary by instance type, AMI, Availability Zone, or
  /// subnet.
  ///
  /// For more information, see [Launching an EC2
  /// Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createFleet(
      {bool dryRun,
      String clientToken,
      SpotOptionsRequest spotOptions,
      OnDemandOptionsRequest onDemandOptions,
      String excessCapacityTerminationPolicy,
      @required List<FleetLaunchTemplateConfigRequest> launchTemplateConfigs,
      @required TargetCapacitySpecificationRequest targetCapacitySpecification,
      bool terminateInstancesWithExpiration,
      String type,
      DateTime validFrom,
      DateTime validUntil,
      bool replaceUnhealthyInstances,
      List<TagSpecification> tagSpecifications}) async {}

  /// Creates one or more flow logs to capture information about IP traffic for
  /// a specific network interface, subnet, or VPC.
  ///
  /// Flow log data for a monitored network interface is recorded as flow log
  /// records, which are log events consisting of fields that describe the
  /// traffic flow. For more information, see [Flow Log
  /// Records](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html#flow-log-records)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// When publishing to CloudWatch Logs, flow log records are published to a
  /// log group, and each network interface has a unique log stream in the log
  /// group. When publishing to Amazon S3, flow log records for all of the
  /// monitored network interfaces are published to a single log file object
  /// that is stored in the specified bucket.
  ///
  /// For more information, see [VPC Flow
  /// Logs](https://docs.aws.amazon.com/vpc/latest/userguide/flow-logs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createFlowLogs(
      {bool dryRun,
      String clientToken,
      String deliverLogsPermissionArn,
      String logGroupName,
      @required List<String> resourceIds,
      @required String resourceType,
      @required String trafficType,
      String logDestinationType,
      String logDestination,
      String logFormat}) async {}

  /// Creates an Amazon FPGA Image (AFI) from the specified design checkpoint
  /// (DCP).
  ///
  /// The create operation is asynchronous. To verify that the AFI is ready for
  /// use, check the output logs.
  ///
  /// An AFI contains the FPGA bitstream that is ready to download to an FPGA.
  /// You can securely deploy an AFI on multiple FPGA-accelerated instances. For
  /// more information, see the [AWS FPGA Hardware Development
  /// Kit](https://github.com/aws/aws-fpga/).
  Future<void> createFpgaImage(StorageLocation inputStorageLocation,
      {bool dryRun,
      StorageLocation logsStorageLocation,
      String description,
      String name,
      String clientToken}) async {}

  /// Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that
  /// is either running or stopped.
  ///
  /// If you customized your instance with instance store volumes or EBS volumes
  /// in addition to the root device volume, the new AMI contains block device
  /// mapping information for those volumes. When you launch an instance from
  /// this new AMI, the instance automatically launches with those additional
  /// volumes.
  ///
  /// For more information, see [Creating Amazon EBS-Backed Linux
  /// AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami-ebs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createImage(
      {List<BlockDeviceMapping> blockDeviceMappings,
      String description,
      bool dryRun,
      @required String instanceId,
      @required String name,
      bool noReboot}) async {}

  /// Exports a running or stopped instance to an S3 bucket.
  ///
  /// For information about the supported operating systems, image formats, and
  /// known limitations for the types of instances you can export, see
  /// [Exporting an Instance as a VM Using VM
  /// Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport.html)
  /// in the _VM Import/Export User Guide_.
  Future<void> createInstanceExportTask(String instanceId,
      {String description,
      ExportToS3TaskSpecification exportToS3Task,
      String targetEnvironment}) async {}

  /// Creates an internet gateway for use with a VPC. After creating the
  /// internet gateway, you attach it to a VPC using AttachInternetGateway.
  ///
  /// For more information about your VPC and internet gateway, see the [Amazon
  /// Virtual Private Cloud User
  /// Guide](https://docs.aws.amazon.com/vpc/latest/userguide/).
  Future<void> createInternetGateway({bool dryRun}) async {}

  /// Creates a 2048-bit RSA key pair with the specified name. Amazon EC2 stores
  /// the public key and displays the private key for you to save to a file. The
  /// private key is returned as an unencrypted PEM encoded PKCS#1 private key.
  /// If a key with the specified name already exists, Amazon EC2 returns an
  /// error.
  ///
  /// You can have up to five thousand key pairs per Region.
  ///
  /// The key pair returned to you is available only in the Region in which you
  /// create it. If you prefer, you can create your own key pair using a
  /// third-party tool and upload it to any Region using ImportKeyPair.
  ///
  /// For more information, see [Key
  /// Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createKeyPair(String keyName, {bool dryRun}) async {}

  /// Creates a launch template. A launch template contains the parameters to
  /// launch an instance. When you launch an instance using RunInstances, you
  /// can specify a launch template instead of providing the launch parameters
  /// in the request.
  Future<void> createLaunchTemplate(
      {bool dryRun,
      String clientToken,
      @required String launchTemplateName,
      String versionDescription,
      @required RequestLaunchTemplateData launchTemplateData,
      List<TagSpecification> tagSpecifications}) async {}

  /// Creates a new version for a launch template. You can specify an existing
  /// version of launch template from which to base the new version.
  ///
  /// Launch template versions are numbered in the order in which they are
  /// created. You cannot specify, change, or replace the numbering of launch
  /// template versions.
  Future<void> createLaunchTemplateVersion(
      RequestLaunchTemplateData launchTemplateData,
      {bool dryRun,
      String clientToken,
      String launchTemplateId,
      String launchTemplateName,
      String sourceVersion,
      String versionDescription}) async {}

  /// Creates a NAT gateway in the specified public subnet. This action creates
  /// a network interface in the specified subnet with a private IP address from
  /// the IP address range of the subnet. Internet-bound traffic from a private
  /// subnet can be routed to the NAT gateway, therefore enabling instances in
  /// the private subnet to connect to the internet. For more information, see
  /// [NAT
  /// Gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createNatGateway(
      {@required String allocationId,
      String clientToken,
      @required String subnetId}) async {}

  /// Creates a network ACL in a VPC. Network ACLs provide an optional layer of
  /// security (in addition to security groups) for the instances in your VPC.
  ///
  /// For more information, see [Network
  /// ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createNetworkAcl(String vpcId, {bool dryRun}) async {}

  /// Creates an entry (a rule) in a network ACL with the specified rule number.
  /// Each network ACL has a set of numbered ingress rules and a separate set of
  /// numbered egress rules. When determining whether a packet should be allowed
  /// in or out of a subnet associated with the ACL, we process the entries in
  /// the ACL according to the rule numbers, in ascending order. Each network
  /// ACL has a set of ingress rules and a separate set of egress rules.
  ///
  /// We recommend that you leave room between the rule numbers (for example,
  /// 100, 110, 120, ...), and not number them one right after the other (for
  /// example, 101, 102, 103, ...). This makes it easier to add a rule between
  /// existing ones without having to renumber the rules.
  ///
  /// After you add an entry, you can't modify it; you must either replace it,
  /// or create an entry and delete the old one.
  ///
  /// For more information about network ACLs, see [Network
  /// ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createNetworkAclEntry(
      {String cidrBlock,
      bool dryRun,
      @required bool egress,
      IcmpTypeCode icmpTypeCode,
      String ipv6CidrBlock,
      @required String networkAclId,
      PortRange portRange,
      @required String protocol,
      @required String ruleAction,
      @required int ruleNumber}) async {}

  /// Creates a network interface in the specified subnet.
  ///
  /// For more information about network interfaces, see [Elastic Network
  /// Interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createNetworkInterface(String subnetId,
      {String description,
      bool dryRun,
      List<String> groups,
      int ipv6AddressCount,
      List<InstanceIpv6Address> ipv6Addresses,
      String privateIpAddress,
      List<PrivateIpAddressSpecification> privateIpAddresses,
      int secondaryPrivateIpAddressCount,
      String interfaceType}) async {}

  /// Grants an AWS-authorized account permission to attach the specified
  /// network interface to an instance in their account.
  ///
  /// You can grant permission to a single AWS account only, and only one
  /// account at a time.
  Future<void> createNetworkInterfacePermission(
      {@required String networkInterfaceId,
      String awsAccountId,
      String awsService,
      @required String permission,
      bool dryRun}) async {}

  /// Creates a placement group in which to launch instances. The strategy of
  /// the placement group determines how the instances are organized within the
  /// group.
  ///
  /// A `cluster` placement group is a logical grouping of instances within a
  /// single Availability Zone that benefit from low network latency, high
  /// network throughput. A `spread` placement group places instances on
  /// distinct hardware. A `partition` placement group places groups of
  /// instances in different partitions, where instances in one partition do not
  /// share the same hardware with instances in another partition.
  ///
  /// For more information, see [Placement
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createPlacementGroup(
      {bool dryRun,
      String groupName,
      String strategy,
      int partitionCount}) async {}

  /// Creates a listing for Amazon EC2 Standard Reserved Instances to be sold in
  /// the Reserved Instance Marketplace. You can submit one Standard Reserved
  /// Instance listing at a time. To get a list of your Standard Reserved
  /// Instances, you can use the DescribeReservedInstances operation.
  ///
  ///  Only Standard Reserved Instances can be sold in the Reserved Instance
  /// Marketplace. Convertible Reserved Instances cannot be sold.
  ///
  /// The Reserved Instance Marketplace matches sellers who want to resell
  /// Standard Reserved Instance capacity that they no longer need with buyers
  /// who want to purchase additional capacity. Reserved Instances bought and
  /// sold through the Reserved Instance Marketplace work like any other
  /// Reserved Instances.
  ///
  /// To sell your Standard Reserved Instances, you must first register as a
  /// seller in the Reserved Instance Marketplace. After completing the
  /// registration process, you can create a Reserved Instance Marketplace
  /// listing of some or all of your Standard Reserved Instances, and specify
  /// the upfront price to receive for them. Your Standard Reserved Instance
  /// listings then become available for purchase. To view the details of your
  /// Standard Reserved Instance listing, you can use the
  /// DescribeReservedInstancesListings operation.
  ///
  /// For more information, see [Reserved Instance
  /// Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createReservedInstancesListing(
      {@required String clientToken,
      @required int instanceCount,
      @required List<PriceScheduleSpecification> priceSchedules,
      @required String reservedInstancesId}) async {}

  /// Creates a route in a route table within a VPC.
  ///
  /// You must specify one of the following targets: internet gateway or virtual
  /// private gateway, NAT instance, NAT gateway, VPC peering connection,
  /// network interface, or egress-only internet gateway.
  ///
  /// When determining how to route traffic, we use the route with the most
  /// specific match. For example, traffic is destined for the IPv4 address
  /// `192.0.2.3`, and the route table includes the following two IPv4 routes:
  ///
  /// *    `192.0.2.0/24` (goes to some target A)
  ///
  /// *    `192.0.2.0/28` (goes to some target B)
  ///
  ///
  /// Both routes apply to the traffic destined for `192.0.2.3`. However, the
  /// second route in the list covers a smaller number of IP addresses and is
  /// therefore more specific, so we use that route to determine where to target
  /// the traffic.
  ///
  /// For more information about route tables, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createRoute(String routeTableId,
      {String destinationCidrBlock,
      String destinationIpv6CidrBlock,
      bool dryRun,
      String egressOnlyInternetGatewayId,
      String gatewayId,
      String instanceId,
      String natGatewayId,
      String transitGatewayId,
      String networkInterfaceId,
      String vpcPeeringConnectionId}) async {}

  /// Creates a route table for the specified VPC. After you create a route
  /// table, you can add routes and associate the table with a subnet.
  ///
  /// For more information, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createRouteTable(String vpcId, {bool dryRun}) async {}

  /// Creates a security group.
  ///
  /// A security group acts as a virtual firewall for your instance to control
  /// inbound and outbound traffic. For more information, see [Amazon EC2
  /// Security
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_ and [Security Groups for
  /// Your
  /// VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// When you create a security group, you specify a friendly name of your
  /// choice. You can have a security group for use in EC2-Classic with the same
  /// name as a security group for use in a VPC. However, you can't have two
  /// security groups for use in EC2-Classic with the same name or two security
  /// groups for use in a VPC with the same name.
  ///
  /// You have a default security group for use in EC2-Classic and a default
  /// security group for use in your VPC. If you don't specify a security group
  /// when you launch an instance, the instance is launched into the appropriate
  /// default security group. A default security group includes a default rule
  /// that grants instances unrestricted network access to each other.
  ///
  /// You can add or remove rules from your security groups using
  /// AuthorizeSecurityGroupIngress, AuthorizeSecurityGroupEgress,
  /// RevokeSecurityGroupIngress, and RevokeSecurityGroupEgress.
  ///
  /// For more information about VPC security group limits, see [Amazon VPC
  /// Limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html).
  Future<void> createSecurityGroup(
      {@required String description,
      @required String groupName,
      String vpcId,
      bool dryRun}) async {}

  /// Creates a snapshot of an EBS volume and stores it in Amazon S3. You can
  /// use snapshots for backups, to make copies of EBS volumes, and to save data
  /// before shutting down an instance.
  ///
  /// When a snapshot is created, any AWS Marketplace product codes that are
  /// associated with the source volume are propagated to the snapshot.
  ///
  /// You can take a snapshot of an attached volume that is in use. However,
  /// snapshots only capture data that has been written to your EBS volume at
  /// the time the snapshot command is issued; this may exclude any data that
  /// has been cached by any applications or the operating system. If you can
  /// pause any file systems on the volume long enough to take a snapshot, your
  /// snapshot should be complete. However, if you cannot pause all file writes
  /// to the volume, you should unmount the volume from within the instance,
  /// issue the snapshot command, and then remount the volume to ensure a
  /// consistent and complete snapshot. You may remount and use your volume
  /// while the snapshot status is `pending`.
  ///
  /// To create a snapshot for EBS volumes that serve as root devices, you
  /// should stop the instance before taking the snapshot.
  ///
  /// Snapshots that are taken from encrypted volumes are automatically
  /// encrypted. Volumes that are created from encrypted snapshots are also
  /// automatically encrypted. Your encrypted volumes and any associated
  /// snapshots always remain protected.
  ///
  /// You can tag your snapshots during creation. For more information, see
  /// [Tagging Your Amazon EC2
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// For more information, see [Amazon Elastic Block
  /// Store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html)
  /// and [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createSnapshot(String volumeId,
      {String description,
      List<TagSpecification> tagSpecifications,
      bool dryRun}) async {}

  /// Creates crash-consistent snapshots of multiple EBS volumes and stores the
  /// data in S3. Volumes are chosen by specifying an instance. Any attached
  /// volumes will produce one snapshot each that is crash-consistent across the
  /// instance. Boot volumes can be excluded by changing the paramaters.
  Future<void> createSnapshots(InstanceSpecification instanceSpecification,
      {String description,
      List<TagSpecification> tagSpecifications,
      bool dryRun,
      String copyTagsFromSource}) async {}

  /// Creates a data feed for Spot Instances, enabling you to view Spot Instance
  /// usage logs. You can create one data feed per AWS account. For more
  /// information, see [Spot Instance Data
  /// Feed](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  Future<void> createSpotDatafeedSubscription(String bucket,
      {bool dryRun, String prefix}) async {}

  /// Creates a subnet in an existing VPC.
  ///
  /// When you create each subnet, you provide the VPC ID and IPv4 CIDR block
  /// for the subnet. After you create a subnet, you can't change its CIDR
  /// block. The size of the subnet's IPv4 CIDR block can be the same as a VPC's
  /// IPv4 CIDR block, or a subset of a VPC's IPv4 CIDR block. If you create
  /// more than one subnet in a VPC, the subnets' CIDR blocks must not overlap.
  /// The smallest IPv4 subnet (and VPC) you can create uses a /28 netmask (16
  /// IPv4 addresses), and the largest uses a /16 netmask (65,536 IPv4
  /// addresses).
  ///
  /// If you've associated an IPv6 CIDR block with your VPC, you can create a
  /// subnet with an IPv6 CIDR block that uses a /64 prefix length.
  ///
  ///  AWS reserves both the first four and the last IPv4 address in each
  /// subnet's CIDR block. They're not available for use.
  ///
  /// If you add more than one subnet to a VPC, they're set up in a star
  /// topology with a logical router in the middle.
  ///
  /// If you launch an instance in a VPC using an Amazon EBS-backed AMI, the IP
  /// address doesn't change if you stop and restart the instance (unlike a
  /// similar instance launched outside a VPC, which gets a new IP address when
  /// restarted). It's therefore possible to have a subnet with no running
  /// instances (they're all stopped), but no remaining IP addresses available.
  ///
  /// For more information about subnets, see [Your VPC and
  /// Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createSubnet(
      {String availabilityZone,
      String availabilityZoneId,
      @required String cidrBlock,
      String ipv6CidrBlock,
      @required String vpcId,
      bool dryRun}) async {}

  /// Adds or overwrites the specified tags for the specified Amazon EC2
  /// resource or resources. Each resource can have a maximum of 50 tags. Each
  /// tag consists of a key and optional value. Tag keys must be unique per
  /// resource.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_. For more information
  /// about creating IAM policies that control users' access to resources based
  /// on tags, see [Supported Resource-Level Permissions for Amazon EC2 API
  /// Actions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createTags(
      {bool dryRun,
      @required List<String> resources,
      @required List<Tag> tags}) async {}

  /// Creates a Traffic Mirror filter.
  ///
  /// A Traffic Mirror filter is a set of rules that defines the traffic to
  /// mirror.
  ///
  /// By default, no traffic is mirrored. To mirror traffic, use
  /// CreateTrafficMirrorFilterRule to add Traffic Mirror rules to the filter.
  /// The rules you add define what traffic gets mirrored. You can also use
  /// ModifyTrafficMirrorFilterNetworkServices to mirror supported network
  /// services.
  Future<void> createTrafficMirrorFilter(
      {String description,
      List<TagSpecification> tagSpecifications,
      bool dryRun,
      String clientToken}) async {}

  /// Creates a Traffic Mirror rule.
  ///
  /// A Traffic Mirror rule defines the Traffic Mirror source traffic to mirror.
  ///
  /// You need the Traffic Mirror filter ID when you create the rule.
  Future<void> createTrafficMirrorFilterRule(
      {@required String trafficMirrorFilterId,
      @required String trafficDirection,
      @required int ruleNumber,
      @required String ruleAction,
      TrafficMirrorPortRangeRequest destinationPortRange,
      TrafficMirrorPortRangeRequest sourcePortRange,
      int protocol,
      @required String destinationCidrBlock,
      @required String sourceCidrBlock,
      String description,
      bool dryRun,
      String clientToken}) async {}

  /// Creates a Traffic Mirror session.
  ///
  /// A Traffic Mirror session actively copies packets from a Traffic Mirror
  /// source to a Traffic Mirror target. Create a filter, and then assign it to
  /// the session to define a subset of the traffic to mirror, for example all
  /// TCP traffic.
  ///
  /// The Traffic Mirror source and the Traffic Mirror target (monitoring
  /// appliances) can be in the same VPC, or in a different VPC connected via
  /// VPC peering or a transit gateway.
  ///
  /// By default, no traffic is mirrored. Use CreateTrafficMirrorFilter to
  /// create filter rules that specify the traffic to mirror.
  Future<void> createTrafficMirrorSession(
      {@required String networkInterfaceId,
      @required String trafficMirrorTargetId,
      @required String trafficMirrorFilterId,
      int packetLength,
      @required int sessionNumber,
      int virtualNetworkId,
      String description,
      List<TagSpecification> tagSpecifications,
      bool dryRun,
      String clientToken}) async {}

  /// Creates a target for your Traffic Mirror session.
  ///
  /// A Traffic Mirror target is the destination for mirrored traffic. The
  /// Traffic Mirror source and the Traffic Mirror target (monitoring
  /// appliances) can be in the same VPC, or in different VPCs connected via VPC
  /// peering or a transit gateway.
  ///
  /// A Traffic Mirror target can be a network interface, or a Network Load
  /// Balancer.
  ///
  /// To use the target in a Traffic Mirror session, use
  /// CreateTrafficMirrorSession.
  Future<void> createTrafficMirrorTarget(
      {String networkInterfaceId,
      String networkLoadBalancerArn,
      String description,
      List<TagSpecification> tagSpecifications,
      bool dryRun,
      String clientToken}) async {}

  /// Creates a transit gateway.
  ///
  /// You can use a transit gateway to interconnect your virtual private clouds
  /// (VPC) and on-premises networks. After the transit gateway enters the
  /// `available` state, you can attach your VPCs and VPN connections to the
  /// transit gateway.
  ///
  /// To attach your VPCs, use CreateTransitGatewayVpcAttachment.
  ///
  /// To attach a VPN connection, use CreateCustomerGateway to create a customer
  /// gateway and specify the ID of the customer gateway and the ID of the
  /// transit gateway in a call to CreateVpnConnection.
  ///
  /// When you create a transit gateway, we create a default transit gateway
  /// route table and use it as the default association route table and the
  /// default propagation route table. You can use
  /// CreateTransitGatewayRouteTable to create additional transit gateway route
  /// tables. If you disable automatic route propagation, we do not create a
  /// default transit gateway route table. You can use
  /// EnableTransitGatewayRouteTablePropagation to propagate routes from a
  /// resource attachment to a transit gateway route table. If you disable
  /// automatic associations, you can use AssociateTransitGatewayRouteTable to
  /// associate a resource attachment with a transit gateway route table.
  Future<void> createTransitGateway(
      {String description,
      TransitGatewayRequestOptions options,
      List<TagSpecification> tagSpecifications,
      bool dryRun}) async {}

  /// Creates a static route for the specified transit gateway route table.
  Future<void> createTransitGatewayRoute(
      {@required String destinationCidrBlock,
      @required String transitGatewayRouteTableId,
      String transitGatewayAttachmentId,
      bool blackhole,
      bool dryRun}) async {}

  /// Creates a route table for the specified transit gateway.
  Future<void> createTransitGatewayRouteTable(String transitGatewayId,
      {List<TagSpecification> tagSpecifications, bool dryRun}) async {}

  /// Attaches the specified VPC to the specified transit gateway.
  ///
  /// If you attach a VPC with a CIDR range that overlaps the CIDR range of a
  /// VPC that is already attached, the new VPC CIDR range is not propagated to
  /// the default propagation route table.
  ///
  /// To send VPC traffic to an attached transit gateway, add a route to the VPC
  /// route table using CreateRoute.
  Future<void> createTransitGatewayVpcAttachment(
      {@required String transitGatewayId,
      @required String vpcId,
      @required List<String> subnetIds,
      CreateTransitGatewayVpcAttachmentRequestOptions options,
      List<TagSpecification> tagSpecifications,
      bool dryRun}) async {}

  /// Creates an EBS volume that can be attached to an instance in the same
  /// Availability Zone. The volume is created in the regional endpoint that you
  /// send the HTTP request to. For more information see [Regions and
  /// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).
  ///
  /// You can create a new empty volume or restore a volume from an EBS
  /// snapshot. Any AWS Marketplace product codes from the snapshot are
  /// propagated to the volume.
  ///
  /// You can create encrypted volumes. Encrypted volumes must be attached to
  /// instances that support Amazon EBS encryption. Volumes that are created
  /// from encrypted snapshots are also automatically encrypted. For more
  /// information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// You can tag your volumes during creation. For more information, see
  /// [Tagging Your Amazon EC2
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// For more information, see [Creating an Amazon EBS
  /// Volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createVolume(String availabilityZone,
      {bool encrypted,
      int iops,
      String kmsKeyId,
      int size,
      String snapshotId,
      String volumeType,
      bool dryRun,
      List<TagSpecification> tagSpecifications}) async {}

  /// Creates a VPC with the specified IPv4 CIDR block. The smallest VPC you can
  /// create uses a /28 netmask (16 IPv4 addresses), and the largest uses a /16
  /// netmask (65,536 IPv4 addresses). For more information about how large to
  /// make your VPC, see [Your VPC and
  /// Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// You can optionally request an Amazon-provided IPv6 CIDR block for the VPC.
  /// The IPv6 CIDR block uses a /56 prefix length, and is allocated from
  /// Amazon's pool of IPv6 addresses. You cannot choose the IPv6 range for your
  /// VPC.
  ///
  /// By default, each instance you launch in the VPC has the default DHCP
  /// options, which include only a default DNS server that we provide
  /// (AmazonProvidedDNS). For more information, see [DHCP Options
  /// Sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// You can specify the instance tenancy value for the VPC when you create it.
  /// You can't change this value for the VPC after you create it. For more
  /// information, see [Dedicated
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> createVpc(String cidrBlock,
      {bool amazonProvidedIpv6CidrBlock,
      bool dryRun,
      String instanceTenancy}) async {}

  /// Creates a VPC endpoint for a specified service. An endpoint enables you to
  /// create a private connection between your VPC and the service. The service
  /// may be provided by AWS, an AWS Marketplace partner, or another AWS
  /// account. For more information, see [VPC
  /// Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// A `gateway` endpoint serves as a target for a route in your route table
  /// for traffic destined for the AWS service. You can specify an endpoint
  /// policy to attach to the endpoint that will control access to the service
  /// from your VPC. You can also specify the VPC route tables that use the
  /// endpoint.
  ///
  /// An `interface` endpoint is a network interface in your subnet that serves
  /// as an endpoint for communicating with the specified service. You can
  /// specify the subnets in which to create an endpoint, and the security
  /// groups to associate with the endpoint network interface.
  ///
  /// Use DescribeVpcEndpointServices to get a list of supported services.
  Future<void> createVpcEndpoint(
      {bool dryRun,
      String vpcEndpointType,
      @required String vpcId,
      @required String serviceName,
      String policyDocument,
      List<String> routeTableIds,
      List<String> subnetIds,
      List<String> securityGroupIds,
      String clientToken,
      bool privateDnsEnabled}) async {}

  /// Creates a connection notification for a specified VPC endpoint or VPC
  /// endpoint service. A connection notification notifies you of specific
  /// endpoint events. You must create an SNS topic to receive notifications.
  /// For more information, see [Create a
  /// Topic](https://docs.aws.amazon.com/sns/latest/dg/CreateTopic.html) in the
  /// _Amazon Simple Notification Service Developer Guide_.
  ///
  /// You can create a connection notification for interface endpoints only.
  Future<void> createVpcEndpointConnectionNotification(
      {bool dryRun,
      String serviceId,
      String vpcEndpointId,
      @required String connectionNotificationArn,
      @required List<String> connectionEvents,
      String clientToken}) async {}

  /// Creates a VPC endpoint service configuration to which service consumers
  /// (AWS accounts, IAM users, and IAM roles) can connect. Service consumers
  /// can create an interface VPC endpoint to connect to your service.
  ///
  /// To create an endpoint service configuration, you must first create a
  /// Network Load Balancer for your service. For more information, see [VPC
  /// Endpoint
  /// Services](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> createVpcEndpointServiceConfiguration(
      List<String> networkLoadBalancerArns,
      {bool dryRun,
      bool acceptanceRequired,
      String clientToken}) async {}

  /// Requests a VPC peering connection between two VPCs: a requester VPC that
  /// you own and an accepter VPC with which to create the connection. The
  /// accepter VPC can belong to another AWS account and can be in a different
  /// Region to the requester VPC. The requester VPC and accepter VPC cannot
  /// have overlapping CIDR blocks.
  ///
  ///  Limitations and rules apply to a VPC peering connection. For more
  /// information, see the
  /// [limitations](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-basics.html#vpc-peering-limitations)
  /// section in the _VPC Peering Guide_.
  ///
  /// The owner of the accepter VPC must accept the peering request to activate
  /// the peering connection. The VPC peering connection request expires after 7
  /// days, after which it cannot be accepted or rejected.
  ///
  /// If you create a VPC peering connection request between VPCs with
  /// overlapping CIDR blocks, the VPC peering connection has a status of
  /// `failed`.
  Future<void> createVpcPeeringConnection(
      {bool dryRun,
      String peerOwnerId,
      String peerVpcId,
      String vpcId,
      String peerRegion}) async {}

  /// Creates a VPN connection between an existing virtual private gateway and a
  /// VPN customer gateway. The supported connection type is `ipsec.1`.
  ///
  /// The response includes information that you need to give to your network
  /// administrator to configure your customer gateway.
  ///
  ///  We strongly recommend that you use HTTPS when calling this operation
  /// because the response contains sensitive cryptographic information for
  /// configuring your customer gateway.
  ///
  /// If you decide to shut down your VPN connection for any reason and later
  /// create a new VPN connection, you must reconfigure your customer gateway
  /// with the new information returned from this call.
  ///
  /// This is an idempotent operation. If you perform the operation more than
  /// once, Amazon EC2 doesn't return an error.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> createVpnConnection(
      {@required String customerGatewayId,
      @required String type,
      String vpnGatewayId,
      String transitGatewayId,
      bool dryRun,
      VpnConnectionOptionsSpecification options}) async {}

  /// Creates a static route associated with a VPN connection between an
  /// existing virtual private gateway and a VPN customer gateway. The static
  /// route allows traffic to be routed from the virtual private gateway to the
  /// VPN customer gateway.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> createVpnConnectionRoute(
      {@required String destinationCidrBlock,
      @required String vpnConnectionId}) async {}

  /// Creates a virtual private gateway. A virtual private gateway is the
  /// endpoint on the VPC side of your VPN connection. You can create a virtual
  /// private gateway before creating the VPC itself.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> createVpnGateway(String type,
      {String availabilityZone, BigInt amazonSideAsn, bool dryRun}) async {}

  /// Deletes the specified Client VPN endpoint. You must disassociate all
  /// target networks before you can delete a Client VPN endpoint.
  Future<void> deleteClientVpnEndpoint(String clientVpnEndpointId,
      {bool dryRun}) async {}

  /// Deletes a route from a Client VPN endpoint. You can only delete routes
  /// that you manually added using the **CreateClientVpnRoute** action. You
  /// cannot delete routes that were automatically added when associating a
  /// subnet. To remove routes that have been automatically added, disassociate
  /// the target subnet from the Client VPN endpoint.
  Future<void> deleteClientVpnRoute(
      {@required String clientVpnEndpointId,
      String targetVpcSubnetId,
      @required String destinationCidrBlock,
      bool dryRun}) async {}

  /// Deletes the specified customer gateway. You must delete the VPN connection
  /// before you can delete the customer gateway.
  Future<void> deleteCustomerGateway(String customerGatewayId,
      {bool dryRun}) async {}

  /// Deletes the specified set of DHCP options. You must disassociate the set
  /// of DHCP options before you can delete it. You can disassociate the set of
  /// DHCP options by associating either a new set of options or the default set
  /// of options with the VPC.
  Future<void> deleteDhcpOptions(String dhcpOptionsId, {bool dryRun}) async {}

  /// Deletes an egress-only internet gateway.
  Future<void> deleteEgressOnlyInternetGateway(
      String egressOnlyInternetGatewayId,
      {bool dryRun}) async {}

  /// Deletes the specified EC2 Fleet.
  ///
  /// After you delete an EC2 Fleet, it launches no new instances. You must
  /// specify whether an EC2 Fleet should also terminate its instances. If you
  /// terminate the instances, the EC2 Fleet enters the `deleted_terminating`
  /// state. Otherwise, the EC2 Fleet enters the `deleted_running` state, and
  /// the instances continue to run until they are interrupted or you terminate
  /// them manually.
  Future<void> deleteFleets(
      {bool dryRun,
      @required List<String> fleetIds,
      @required bool terminateInstances}) async {}

  /// Deletes one or more flow logs.
  Future<void> deleteFlowLogs(List<String> flowLogIds, {bool dryRun}) async {}

  /// Deletes the specified Amazon FPGA Image (AFI).
  Future<void> deleteFpgaImage(String fpgaImageId, {bool dryRun}) async {}

  /// Deletes the specified internet gateway. You must detach the internet
  /// gateway from the VPC before you can delete it.
  Future<void> deleteInternetGateway(String internetGatewayId,
      {bool dryRun}) async {}

  /// Deletes the specified key pair, by removing the public key from Amazon
  /// EC2.
  Future<void> deleteKeyPair(String keyName, {bool dryRun}) async {}

  /// Deletes a launch template. Deleting a launch template deletes all of its
  /// versions.
  Future<void> deleteLaunchTemplate(
      {bool dryRun,
      String launchTemplateId,
      String launchTemplateName}) async {}

  /// Deletes one or more versions of a launch template. You cannot delete the
  /// default version of a launch template; you must first assign a different
  /// version as the default. If the default version is the only version for the
  /// launch template, you must delete the entire launch template using
  /// DeleteLaunchTemplate.
  Future<void> deleteLaunchTemplateVersions(List<String> versions,
      {bool dryRun,
      String launchTemplateId,
      String launchTemplateName}) async {}

  /// Deletes the specified NAT gateway. Deleting a NAT gateway disassociates
  /// its Elastic IP address, but does not release the address from your
  /// account. Deleting a NAT gateway does not delete any NAT gateway routes in
  /// your route tables.
  Future<void> deleteNatGateway(String natGatewayId) async {}

  /// Deletes the specified network ACL. You can't delete the ACL if it's
  /// associated with any subnets. You can't delete the default network ACL.
  Future<void> deleteNetworkAcl(String networkAclId, {bool dryRun}) async {}

  /// Deletes the specified ingress or egress entry (rule) from the specified
  /// network ACL.
  Future<void> deleteNetworkAclEntry(
      {bool dryRun,
      @required bool egress,
      @required String networkAclId,
      @required int ruleNumber}) async {}

  /// Deletes the specified network interface. You must detach the network
  /// interface before you can delete it.
  Future<void> deleteNetworkInterface(String networkInterfaceId,
      {bool dryRun}) async {}

  /// Deletes a permission for a network interface. By default, you cannot
  /// delete the permission if the account for which you're removing the
  /// permission has attached the network interface to an instance. However, you
  /// can force delete the permission, regardless of any attachment.
  Future<void> deleteNetworkInterfacePermission(
      String networkInterfacePermissionId,
      {bool force,
      bool dryRun}) async {}

  /// Deletes the specified placement group. You must terminate all instances in
  /// the placement group before you can delete the placement group. For more
  /// information, see [Placement
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> deletePlacementGroup(String groupName, {bool dryRun}) async {}

  /// Deletes the specified route from the specified route table.
  Future<void> deleteRoute(String routeTableId,
      {String destinationCidrBlock,
      String destinationIpv6CidrBlock,
      bool dryRun}) async {}

  /// Deletes the specified route table. You must disassociate the route table
  /// from any subnets before you can delete it. You can't delete the main route
  /// table.
  Future<void> deleteRouteTable(String routeTableId, {bool dryRun}) async {}

  /// Deletes a security group.
  ///
  /// If you attempt to delete a security group that is associated with an
  /// instance, or is referenced by another security group, the operation fails
  /// with `InvalidGroup.InUse` in EC2-Classic or `DependencyViolation` in
  /// EC2-VPC.
  Future<void> deleteSecurityGroup(
      {String groupId, String groupName, bool dryRun}) async {}

  /// Deletes the specified snapshot.
  ///
  /// When you make periodic snapshots of a volume, the snapshots are
  /// incremental, and only the blocks on the device that have changed since
  /// your last snapshot are saved in the new snapshot. When you delete a
  /// snapshot, only the data not needed for any other snapshot is removed. So
  /// regardless of which prior snapshots have been deleted, all active
  /// snapshots will have access to all the information needed to restore the
  /// volume.
  ///
  /// You cannot delete a snapshot of the root device of an EBS volume used by a
  /// registered AMI. You must first de-register the AMI before you can delete
  /// the snapshot.
  ///
  /// For more information, see [Deleting an Amazon EBS
  /// Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> deleteSnapshot(String snapshotId, {bool dryRun}) async {}

  /// Deletes the data feed for Spot Instances.
  Future<void> deleteSpotDatafeedSubscription({bool dryRun}) async {}

  /// Deletes the specified subnet. You must terminate all running instances in
  /// the subnet before you can delete the subnet.
  Future<void> deleteSubnet(String subnetId, {bool dryRun}) async {}

  /// Deletes the specified set of tags from the specified set of resources.
  ///
  /// To list the current tags, use DescribeTags. For more information about
  /// tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> deleteTags(List<String> resources,
      {bool dryRun, List<Tag> tags}) async {}

  /// Deletes the specified Traffic Mirror filter.
  ///
  /// You cannot delete a Traffic Mirror filter that is in use by a Traffic
  /// Mirror session.
  Future<void> deleteTrafficMirrorFilter(String trafficMirrorFilterId,
      {bool dryRun}) async {}

  /// Deletes the specified Traffic Mirror rule.
  Future<void> deleteTrafficMirrorFilterRule(String trafficMirrorFilterRuleId,
      {bool dryRun}) async {}

  /// Deletes the specified Traffic Mirror session.
  Future<void> deleteTrafficMirrorSession(String trafficMirrorSessionId,
      {bool dryRun}) async {}

  /// Deletes the specified Traffic Mirror target.
  ///
  /// You cannot delete a Traffic Mirror target that is in use by a Traffic
  /// Mirror session.
  Future<void> deleteTrafficMirrorTarget(String trafficMirrorTargetId,
      {bool dryRun}) async {}

  /// Deletes the specified transit gateway.
  Future<void> deleteTransitGateway(String transitGatewayId,
      {bool dryRun}) async {}

  /// Deletes the specified route from the specified transit gateway route
  /// table.
  Future<void> deleteTransitGatewayRoute(
      {@required String transitGatewayRouteTableId,
      @required String destinationCidrBlock,
      bool dryRun}) async {}

  /// Deletes the specified transit gateway route table. You must disassociate
  /// the route table from any transit gateway route tables before you can
  /// delete it.
  Future<void> deleteTransitGatewayRouteTable(String transitGatewayRouteTableId,
      {bool dryRun}) async {}

  /// Deletes the specified VPC attachment.
  Future<void> deleteTransitGatewayVpcAttachment(
      String transitGatewayAttachmentId,
      {bool dryRun}) async {}

  /// Deletes the specified EBS volume. The volume must be in the `available`
  /// state (not attached to an instance).
  ///
  /// The volume can remain in the `deleting` state for several minutes.
  ///
  /// For more information, see [Deleting an Amazon EBS
  /// Volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> deleteVolume(String volumeId, {bool dryRun}) async {}

  /// Deletes the specified VPC. You must detach or delete all gateways and
  /// resources that are associated with the VPC before you can delete it. For
  /// example, you must terminate all instances running in the VPC, delete all
  /// security groups associated with the VPC (except the default one), delete
  /// all route tables associated with the VPC (except the default one), and so
  /// on.
  Future<void> deleteVpc(String vpcId, {bool dryRun}) async {}

  /// Deletes one or more VPC endpoint connection notifications.
  Future<void> deleteVpcEndpointConnectionNotifications(
      List<String> connectionNotificationIds,
      {bool dryRun}) async {}

  /// Deletes one or more VPC endpoint service configurations in your account.
  /// Before you delete the endpoint service configuration, you must reject any
  /// `Available` or `PendingAcceptance` interface endpoint connections that are
  /// attached to the service.
  Future<void> deleteVpcEndpointServiceConfigurations(List<String> serviceIds,
      {bool dryRun}) async {}

  /// Deletes one or more specified VPC endpoints. Deleting a gateway endpoint
  /// also deletes the endpoint routes in the route tables that were associated
  /// with the endpoint. Deleting an interface endpoint deletes the endpoint
  /// network interfaces.
  Future<void> deleteVpcEndpoints(List<String> vpcEndpointIds,
      {bool dryRun}) async {}

  /// Deletes a VPC peering connection. Either the owner of the requester VPC or
  /// the owner of the accepter VPC can delete the VPC peering connection if
  /// it's in the `active` state. The owner of the requester VPC can delete a
  /// VPC peering connection in the `pending-acceptance` state. You cannot
  /// delete a VPC peering connection that's in the `failed` state.
  Future<void> deleteVpcPeeringConnection(String vpcPeeringConnectionId,
      {bool dryRun}) async {}

  /// Deletes the specified VPN connection.
  ///
  /// If you're deleting the VPC and its associated components, we recommend
  /// that you detach the virtual private gateway from the VPC and delete the
  /// VPC before deleting the VPN connection. If you believe that the tunnel
  /// credentials for your VPN connection have been compromised, you can delete
  /// the VPN connection and create a new one that has new keys, without needing
  /// to delete the VPC or virtual private gateway. If you create a new VPN
  /// connection, you must reconfigure the customer gateway using the new
  /// configuration information returned with the new VPN connection ID.
  Future<void> deleteVpnConnection(String vpnConnectionId,
      {bool dryRun}) async {}

  /// Deletes the specified static route associated with a VPN connection
  /// between an existing virtual private gateway and a VPN customer gateway.
  /// The static route allows traffic to be routed from the virtual private
  /// gateway to the VPN customer gateway.
  Future<void> deleteVpnConnectionRoute(
      {@required String destinationCidrBlock,
      @required String vpnConnectionId}) async {}

  /// Deletes the specified virtual private gateway. We recommend that before
  /// you delete a virtual private gateway, you detach it from the VPC and
  /// delete the VPN connection. Note that you don't need to delete the virtual
  /// private gateway if you plan to delete and recreate the VPN connection
  /// between your VPC and your network.
  Future<void> deleteVpnGateway(String vpnGatewayId, {bool dryRun}) async {}

  /// Releases the specified address range that you provisioned for use with
  /// your AWS resources through bring your own IP addresses (BYOIP) and deletes
  /// the corresponding address pool.
  ///
  /// Before you can release an address range, you must stop advertising it
  /// using WithdrawByoipCidr and you must not have any IP addresses allocated
  /// from its address range.
  Future<void> deprovisionByoipCidr(String cidr, {bool dryRun}) async {}

  /// Deregisters the specified AMI. After you deregister an AMI, it can't be
  /// used to launch new instances; however, it doesn't affect any instances
  /// that you've already launched from the AMI. You'll continue to incur usage
  /// costs for those instances until you terminate them.
  ///
  /// When you deregister an Amazon EBS-backed AMI, it doesn't affect the
  /// snapshot that was created for the root volume of the instance during the
  /// AMI creation process. When you deregister an instance store-backed AMI, it
  /// doesn't affect the files that you uploaded to Amazon S3 when you created
  /// the AMI.
  Future<void> deregisterImage(String imageId, {bool dryRun}) async {}

  /// Describes attributes of your AWS account. The following are the supported
  /// account attributes:
  ///
  /// *    `supported-platforms`: Indicates whether your account can launch
  /// instances into EC2-Classic and EC2-VPC, or only into EC2-VPC.
  ///
  /// *    `default-vpc`: The ID of the default VPC for your account, or `none`.
  ///
  /// *    `max-instances`: The maximum number of On-Demand Instances that you
  /// can run.
  ///
  /// *    `vpc-max-security-groups-per-interface`: The maximum number of
  /// security groups that you can assign to a network interface.
  ///
  /// *    `max-elastic-ips`: The maximum number of Elastic IP addresses that
  /// you can allocate for use with EC2-Classic.
  ///
  /// *    `vpc-max-elastic-ips`: The maximum number of Elastic IP addresses
  /// that you can allocate for use with EC2-VPC.
  Future<void> describeAccountAttributes(
      {List<String> attributeNames, bool dryRun}) async {}

  /// Describes the specified Elastic IP addresses or all of your Elastic IP
  /// addresses.
  ///
  /// An Elastic IP address is for use in either the EC2-Classic platform or in
  /// a VPC. For more information, see [Elastic IP
  /// Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeAddresses(
      {List<Filter> filters,
      List<String> publicIps,
      List<String> allocationIds,
      bool dryRun}) async {}

  /// Describes the longer ID format settings for all resource types in a
  /// specific Region. This request is useful for performing a quick audit to
  /// determine whether a specific Region is fully opted in for longer IDs
  /// (17-character IDs).
  ///
  /// This request only returns information about resource types that support
  /// longer IDs.
  ///
  /// The following resource types support longer IDs: `bundle` |
  /// `conversion-task` | `customer-gateway` | `dhcp-options` |
  /// `elastic-ip-allocation` | `elastic-ip-association` | `export-task` |
  /// `flow-log` | `image` | `import-task` | `instance` | `internet-gateway` |
  /// `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `reservation` |
  /// `route-table` | `route-table-association` | `security-group` | `snapshot`
  /// | `subnet` | `subnet-cidr-block-association` | `volume` | `vpc` |
  /// `vpc-cidr-block-association` | `vpc-endpoint` | `vpc-peering-connection` |
  /// `vpn-connection` | `vpn-gateway`.
  Future<void> describeAggregateIdFormat({bool dryRun}) async {}

  /// Describes the Availability Zones that are available to you. The results
  /// include zones only for the Region you're currently using. If there is an
  /// event impacting an Availability Zone, you can use this request to view the
  /// state and any provided message for that Availability Zone.
  ///
  /// For more information, see [Regions and Availability
  /// Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeAvailabilityZones(
      {List<Filter> filters,
      List<String> zoneNames,
      List<String> zoneIds,
      bool dryRun}) async {}

  /// Describes the specified bundle tasks or all of your bundle tasks.
  ///
  ///
  ///
  /// Completed bundle tasks are listed for only a limited time. If your bundle
  /// task is no longer in the list, you can still register an AMI from it. Just
  /// use `RegisterImage` with the Amazon S3 bucket name and image manifest name
  /// you provided to the bundle task.
  Future<void> describeBundleTasks(
      {List<String> bundleIds, List<Filter> filters, bool dryRun}) async {}

  /// Describes the IP address ranges that were specified in calls to
  /// ProvisionByoipCidr.
  ///
  /// To describe the address pools that were created when you provisioned the
  /// address ranges, use DescribePublicIpv4Pools.
  Future<void> describeByoipCidrs(int maxResults,
      {bool dryRun, String nextToken}) async {}

  /// Describes one or more of your Capacity Reservations. The results describe
  /// only the Capacity Reservations in the AWS Region that you're currently
  /// using.
  Future<void> describeCapacityReservations(
      {List<String> capacityReservationIds,
      String nextToken,
      int maxResults,
      List<Filter> filters,
      bool dryRun}) async {}

  /// Describes one or more of your linked EC2-Classic instances. This request
  /// only returns information about EC2-Classic instances linked to a VPC
  /// through ClassicLink. You cannot use this request to return information
  /// about other instances.
  Future<void> describeClassicLinkInstances(
      {List<Filter> filters,
      bool dryRun,
      List<String> instanceIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the authorization rules for a specified Client VPN endpoint.
  Future<void> describeClientVpnAuthorizationRules(String clientVpnEndpointId,
      {bool dryRun,
      String nextToken,
      List<Filter> filters,
      int maxResults}) async {}

  /// Describes active client connections and connections that have been
  /// terminated within the last 60 minutes for the specified Client VPN
  /// endpoint.
  Future<void> describeClientVpnConnections(String clientVpnEndpointId,
      {List<Filter> filters,
      String nextToken,
      int maxResults,
      bool dryRun}) async {}

  /// Describes one or more Client VPN endpoints in the account.
  Future<void> describeClientVpnEndpoints(
      {List<String> clientVpnEndpointIds,
      int maxResults,
      String nextToken,
      List<Filter> filters,
      bool dryRun}) async {}

  /// Describes the routes for the specified Client VPN endpoint.
  Future<void> describeClientVpnRoutes(String clientVpnEndpointId,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Describes the target networks associated with the specified Client VPN
  /// endpoint.
  Future<void> describeClientVpnTargetNetworks(String clientVpnEndpointId,
      {List<String> associationIds,
      int maxResults,
      String nextToken,
      List<Filter> filters,
      bool dryRun}) async {}

  /// Describes the specified conversion tasks or all your conversion tasks. For
  /// more information, see the [VM Import/Export User
  /// Guide](https://docs.aws.amazon.com/vm-import/latest/userguide/).
  ///
  /// For information about the import manifest referenced by this API action,
  /// see [VM Import
  /// Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).
  Future<void> describeConversionTasks(
      {List<String> conversionTaskIds, bool dryRun}) async {}

  /// Describes one or more of your VPN customer gateways.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> describeCustomerGateways(
      {List<String> customerGatewayIds,
      List<Filter> filters,
      bool dryRun}) async {}

  /// Describes one or more of your DHCP options sets.
  ///
  /// For more information, see [DHCP Options
  /// Sets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_DHCP_Options.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> describeDhcpOptions(
      {List<String> dhcpOptionsIds,
      List<Filter> filters,
      bool dryRun,
      String nextToken,
      int maxResults}) async {}

  /// Describes one or more of your egress-only internet gateways.
  Future<void> describeEgressOnlyInternetGateways(
      {bool dryRun,
      List<String> egressOnlyInternetGatewayIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the Elastic Graphics accelerator associated with your instances.
  /// For more information about Elastic Graphics, see [Amazon Elastic
  /// Graphics](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/elastic-graphics.html).
  Future<void> describeElasticGpus(
      {List<String> elasticGpuIds,
      bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified export image tasks or all your export image tasks.
  Future<void> describeExportImageTasks(
      {bool dryRun,
      List<Filter> filters,
      List<String> exportImageTaskIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified export instance tasks or all your export instance
  /// tasks.
  Future<void> describeExportTasks({List<String> exportTaskIds}) async {}

  /// Describes the events for the specified EC2 Fleet during the specified
  /// time.
  Future<void> describeFleetHistory(
      {bool dryRun,
      String eventType,
      int maxResults,
      String nextToken,
      @required String fleetId,
      @required DateTime startTime}) async {}

  /// Describes the running instances for the specified EC2 Fleet.
  Future<void> describeFleetInstances(String fleetId,
      {bool dryRun,
      int maxResults,
      String nextToken,
      List<Filter> filters}) async {}

  /// Describes the specified EC2 Fleets or all your EC2 Fleets.
  Future<void> describeFleets(
      {bool dryRun,
      int maxResults,
      String nextToken,
      List<String> fleetIds,
      List<Filter> filters}) async {}

  /// Describes one or more flow logs. To view the information in your flow logs
  /// (the log streams for the network interfaces), you must use the CloudWatch
  /// Logs console or the CloudWatch Logs API.
  Future<void> describeFlowLogs(
      {bool dryRun,
      List<Filter> filter,
      List<String> flowLogIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified attribute of the specified Amazon FPGA Image
  /// (AFI).
  Future<void> describeFpgaImageAttribute(
      {bool dryRun,
      @required String fpgaImageId,
      @required String attribute}) async {}

  /// Describes the Amazon FPGA Images (AFIs) available to you. These include
  /// public AFIs, private AFIs that you own, and AFIs owned by other AWS
  /// accounts for which you have load permissions.
  Future<void> describeFpgaImages(
      {bool dryRun,
      List<String> fpgaImageIds,
      List<String> owners,
      List<Filter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Describes the Dedicated Host reservations that are available to purchase.
  ///
  /// The results describe all the Dedicated Host reservation offerings,
  /// including offerings that may not match the instance family and Region of
  /// your Dedicated Hosts. When purchasing an offering, ensure that the
  /// instance family and Region of the offering matches that of the Dedicated
  /// Hosts with which it is to be associated. For more information about
  /// supported instance types, see [Dedicated Hosts
  /// Overview](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeHostReservationOfferings(
      {List<Filter> filter,
      int maxDuration,
      int maxResults,
      int minDuration,
      String nextToken,
      String offeringId}) async {}

  /// Describes reservations that are associated with Dedicated Hosts in your
  /// account.
  Future<void> describeHostReservations(
      {List<Filter> filter,
      List<String> hostReservationIdSet,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified Dedicated Hosts or all your Dedicated Hosts.
  ///
  /// The results describe only the Dedicated Hosts in the Region you're
  /// currently using. All listed instances consume capacity on your Dedicated
  /// Host. Dedicated Hosts that have recently been released are listed with the
  /// state `released`.
  Future<void> describeHosts(
      {List<Filter> filter,
      List<String> hostIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes your IAM instance profile associations.
  Future<void> describeIamInstanceProfileAssociations(
      {List<String> associationIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the ID format settings for your resources on a per-Region basis,
  /// for example, to view which resource types are enabled for longer IDs. This
  /// request only returns information about resource types whose ID formats can
  /// be modified; it does not return information about other resource types.
  ///
  /// The following resource types support longer IDs: `bundle` |
  /// `conversion-task` | `customer-gateway` | `dhcp-options` |
  /// `elastic-ip-allocation` | `elastic-ip-association` | `export-task` |
  /// `flow-log` | `image` | `import-task` | `instance` | `internet-gateway` |
  /// `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `reservation` |
  /// `route-table` | `route-table-association` | `security-group` | `snapshot`
  /// | `subnet` | `subnet-cidr-block-association` | `volume` | `vpc` |
  /// `vpc-cidr-block-association` | `vpc-endpoint` | `vpc-peering-connection` |
  /// `vpn-connection` | `vpn-gateway`.
  ///
  /// These settings apply to the IAM user who makes the request; they do not
  /// apply to the entire AWS account. By default, an IAM user defaults to the
  /// same settings as the root user, unless they explicitly override the
  /// settings by running the ModifyIdFormat command. Resources created with
  /// longer IDs are visible to all IAM users, regardless of these settings and
  /// provided that they have permission to use the relevant `Describe` command
  /// for the resource type.
  Future<void> describeIdFormat({String resource}) async {}

  /// Describes the ID format settings for resources for the specified IAM user,
  /// IAM role, or root user. For example, you can view the resource types that
  /// are enabled for longer IDs. This request only returns information about
  /// resource types whose ID formats can be modified; it does not return
  /// information about other resource types. For more information, see
  /// [Resource
  /// IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// The following resource types support longer IDs: `bundle` |
  /// `conversion-task` | `customer-gateway` | `dhcp-options` |
  /// `elastic-ip-allocation` | `elastic-ip-association` | `export-task` |
  /// `flow-log` | `image` | `import-task` | `instance` | `internet-gateway` |
  /// `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `reservation` |
  /// `route-table` | `route-table-association` | `security-group` | `snapshot`
  /// | `subnet` | `subnet-cidr-block-association` | `volume` | `vpc` |
  /// `vpc-cidr-block-association` | `vpc-endpoint` | `vpc-peering-connection` |
  /// `vpn-connection` | `vpn-gateway`.
  ///
  /// These settings apply to the principal specified in the request. They do
  /// not apply to the principal that makes the request.
  Future<void> describeIdentityIdFormat(String principalArn,
      {String resource}) async {}

  /// Describes the specified attribute of the specified AMI. You can specify
  /// only one attribute at a time.
  Future<void> describeImageAttribute(
      {@required String attribute,
      @required String imageId,
      bool dryRun}) async {}

  /// Describes the specified images (AMIs, AKIs, and ARIs) available to you or
  /// all of the images available to you.
  ///
  /// The images available to you include public images, private images that you
  /// own, and private images owned by other AWS accounts for which you have
  /// explicit launch permissions.
  ///
  /// Recently deregistered images appear in the returned results for a short
  /// interval and then return empty results. After all instances that reference
  /// a deregistered AMI are terminated, specifying the ID of the image results
  /// in an error indicating that the AMI ID cannot be found.
  Future<void> describeImages(
      {List<String> executableUsers,
      List<Filter> filters,
      List<String> imageIds,
      List<String> owners,
      bool dryRun}) async {}

  /// Displays details about an import virtual machine or import snapshot tasks
  /// that are already created.
  Future<void> describeImportImageTasks(
      {bool dryRun,
      List<Filter> filters,
      List<String> importTaskIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes your import snapshot tasks.
  Future<void> describeImportSnapshotTasks(
      {bool dryRun,
      List<Filter> filters,
      List<String> importTaskIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified attribute of the specified instance. You can
  /// specify only one attribute at a time. Valid attribute values are:
  /// `instanceType` | `kernel` | `ramdisk` | `userData` |
  /// `disableApiTermination` | `instanceInitiatedShutdownBehavior` |
  /// `rootDeviceName` | `blockDeviceMapping` | `productCodes` |
  /// `sourceDestCheck` | `groupSet` | `ebsOptimized` | `sriovNetSupport`
  Future<void> describeInstanceAttribute(
      {@required String attribute,
      bool dryRun,
      @required String instanceId}) async {}

  /// Describes the credit option for CPU usage of the specified T2 or T3
  /// instances. The credit options are `standard` and `unlimited`.
  ///
  /// If you do not specify an instance ID, Amazon EC2 returns T2 and T3
  /// instances with the `unlimited` credit option, as well as instances that
  /// were previously configured as T2 or T3 with the `unlimited` credit option.
  /// For example, if you resize a T2 instance, while it is configured as
  /// `unlimited`, to an M4 instance, Amazon EC2 returns the M4 instance.
  ///
  /// If you specify one or more instance IDs, Amazon EC2 returns the credit
  /// option (`standard` or `unlimited`) of those instances. If you specify an
  /// instance ID that is not valid, such as an instance that is not a T2 or T3
  /// instance, an error is returned.
  ///
  /// Recently terminated instances might appear in the returned results. This
  /// interval is usually less than one hour.
  ///
  /// If an Availability Zone is experiencing a service disruption and you
  /// specify instance IDs in the affected zone, or do not specify any instance
  /// IDs at all, the call fails. If you specify only instance IDs in an
  /// unaffected zone, the call works normally.
  ///
  /// For more information, see [Burstable Performance
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeInstanceCreditSpecifications(
      {bool dryRun,
      List<Filter> filters,
      List<String> instanceIds,
      int maxResults,
      String nextToken}) async {}

  /// Describes the status of the specified instances or all of your instances.
  /// By default, only running instances are described, unless you specifically
  /// indicate to return the status of all instances.
  ///
  /// Instance status includes the following components:
  ///
  /// *    **Status checks** \- Amazon EC2 performs status checks on running EC2
  /// instances to identify hardware and software issues. For more information,
  /// see [Status Checks for Your
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html)
  /// and [Troubleshooting Instances with Failed Status
  /// Checks](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstances.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// *    **Scheduled events** \- Amazon EC2 can schedule events (such as
  /// reboot, stop, or terminate) for your instances related to hardware issues,
  /// software updates, or system maintenance. For more information, see
  /// [Scheduled Events for Your
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-instances-status-check_sched.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// *    **Instance state** \- You can manage your instances from the moment
  /// you launch them through their termination. For more information, see
  /// [Instance
  /// Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeInstanceStatus(
      {List<Filter> filters,
      List<String> instanceIds,
      int maxResults,
      String nextToken,
      bool dryRun,
      bool includeAllInstances}) async {}

  /// Describes the specified instances or all of AWS account's instances.
  ///
  /// If you specify one or more instance IDs, Amazon EC2 returns information
  /// for those instances. If you do not specify instance IDs, Amazon EC2
  /// returns information for all relevant instances. If you specify an instance
  /// ID that is not valid, an error is returned. If you specify an instance
  /// that you do not own, it is not included in the returned results.
  ///
  /// Recently terminated instances might appear in the returned results. This
  /// interval is usually less than one hour.
  ///
  /// If you describe instances in the rare case where an Availability Zone is
  /// experiencing a service disruption and you specify instance IDs that are in
  /// the affected zone, or do not specify any instance IDs at all, the call
  /// fails. If you describe instances and specify only instance IDs that are in
  /// an unaffected zone, the call works normally.
  Future<void> describeInstances(
      {List<Filter> filters,
      List<String> instanceIds,
      bool dryRun,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more of your internet gateways.
  Future<void> describeInternetGateways(
      {List<Filter> filters,
      bool dryRun,
      List<String> internetGatewayIds,
      String nextToken,
      int maxResults}) async {}

  /// Describes the specified key pairs or all of your key pairs.
  ///
  /// For more information about key pairs, see [Key
  /// Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeKeyPairs(
      {List<Filter> filters, List<String> keyNames, bool dryRun}) async {}

  /// Describes one or more versions of a specified launch template. You can
  /// describe all versions, individual versions, or a range of versions.
  Future<void> describeLaunchTemplateVersions(
      {bool dryRun,
      String launchTemplateId,
      String launchTemplateName,
      List<String> versions,
      String minVersion,
      String maxVersion,
      String nextToken,
      int maxResults,
      List<Filter> filters}) async {}

  /// Describes one or more launch templates.
  Future<void> describeLaunchTemplates(
      {bool dryRun,
      List<String> launchTemplateIds,
      List<String> launchTemplateNames,
      List<Filter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Describes your Elastic IP addresses that are being moved to the EC2-VPC
  /// platform, or that are being restored to the EC2-Classic platform. This
  /// request does not return information about any other Elastic IP addresses
  /// in your account.
  Future<void> describeMovingAddresses(
      {List<Filter> filters,
      bool dryRun,
      int maxResults,
      String nextToken,
      List<String> publicIps}) async {}

  /// Describes one or more of your NAT gateways.
  Future<void> describeNatGateways(
      {List<Filter> filter,
      int maxResults,
      List<String> natGatewayIds,
      String nextToken}) async {}

  /// Describes one or more of your network ACLs.
  ///
  /// For more information, see [Network
  /// ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  Future<void> describeNetworkAcls(
      {List<Filter> filters,
      bool dryRun,
      List<String> networkAclIds,
      String nextToken,
      int maxResults}) async {}

  /// Describes a network interface attribute. You can specify only one
  /// attribute at a time.
  Future<void> describeNetworkInterfaceAttribute(String networkInterfaceId,
      {String attribute, bool dryRun}) async {}

  /// Describes the permissions for your network interfaces.
  Future<void> describeNetworkInterfacePermissions(
      {List<String> networkInterfacePermissionIds,
      List<Filter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Describes one or more of your network interfaces.
  Future<void> describeNetworkInterfaces(
      {List<Filter> filters,
      bool dryRun,
      List<String> networkInterfaceIds,
      String nextToken,
      int maxResults}) async {}

  /// Describes the specified placement groups or all of your placement groups.
  /// For more information, see [Placement
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describePlacementGroups(
      {List<Filter> filters, bool dryRun, List<String> groupNames}) async {}

  /// Describes available AWS services in a prefix list format, which includes
  /// the prefix list name and prefix list ID of the service and the IP address
  /// range for the service. A prefix list ID is required for creating an
  /// outbound security group rule that allows traffic from a VPC to access an
  /// AWS service through a gateway VPC endpoint. Currently, the services that
  /// support this action are Amazon S3 and Amazon DynamoDB.
  Future<void> describePrefixLists(
      {bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      List<String> prefixListIds}) async {}

  /// Describes the ID format settings for the root user and all IAM roles and
  /// IAM users that have explicitly specified a longer ID (17-character ID)
  /// preference.
  ///
  /// By default, all IAM roles and IAM users default to the same ID settings as
  /// the root user, unless they explicitly override the settings. This request
  /// is useful for identifying those IAM users and IAM roles that have
  /// overridden the default ID settings.
  ///
  /// The following resource types support longer IDs: `bundle` |
  /// `conversion-task` | `customer-gateway` | `dhcp-options` |
  /// `elastic-ip-allocation` | `elastic-ip-association` | `export-task` |
  /// `flow-log` | `image` | `import-task` | `instance` | `internet-gateway` |
  /// `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `reservation` |
  /// `route-table` | `route-table-association` | `security-group` | `snapshot`
  /// | `subnet` | `subnet-cidr-block-association` | `volume` | `vpc` |
  /// `vpc-cidr-block-association` | `vpc-endpoint` | `vpc-peering-connection` |
  /// `vpn-connection` | `vpn-gateway`.
  Future<void> describePrincipalIdFormat(
      {bool dryRun,
      List<String> resources,
      int maxResults,
      String nextToken}) async {}

  /// Describes the specified IPv4 address pools.
  Future<void> describePublicIpv4Pools(
      {List<String> poolIds, String nextToken, int maxResults}) async {}

  /// Describes the Regions that are enabled for your account, or all Regions.
  ///
  /// For a list of the Regions supported by Amazon EC2, see  [Regions and
  /// Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region).
  ///
  /// For information about enabling and disabling Regions for your account, see
  /// [Managing AWS
  /// Regions](https://docs.aws.amazon.com/general/latest/gr/rande-manage.html)
  /// in the _AWS General Reference_.
  Future<void> describeRegions(
      {List<Filter> filters,
      List<String> regionNames,
      bool dryRun,
      bool allRegions}) async {}

  /// Describes one or more of the Reserved Instances that you purchased.
  ///
  /// For more information about Reserved Instances, see [Reserved
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeReservedInstances(
      {List<Filter> filters,
      String offeringClass,
      List<String> reservedInstancesIds,
      bool dryRun,
      String offeringType}) async {}

  /// Describes your account's Reserved Instance listings in the Reserved
  /// Instance Marketplace.
  ///
  /// The Reserved Instance Marketplace matches sellers who want to resell
  /// Reserved Instance capacity that they no longer need with buyers who want
  /// to purchase additional capacity. Reserved Instances bought and sold
  /// through the Reserved Instance Marketplace work like any other Reserved
  /// Instances.
  ///
  /// As a seller, you choose to list some or all of your Reserved Instances,
  /// and you specify the upfront price to receive for them. Your Reserved
  /// Instances are then listed in the Reserved Instance Marketplace and are
  /// available for purchase.
  ///
  /// As a buyer, you specify the configuration of the Reserved Instance to
  /// purchase, and the Marketplace matches what you're searching for with
  /// what's available. The Marketplace first sells the lowest priced Reserved
  /// Instances to you, and continues to sell available Reserved Instance
  /// listings to you until your demand is met. You are charged based on the
  /// total price of all of the listings that you purchase.
  ///
  /// For more information, see [Reserved Instance
  /// Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeReservedInstancesListings(
      {List<Filter> filters,
      String reservedInstancesId,
      String reservedInstancesListingId}) async {}

  /// Describes the modifications made to your Reserved Instances. If no
  /// parameter is specified, information about all your Reserved Instances
  /// modification requests is returned. If a modification ID is specified, only
  /// information about the specific modification is returned.
  ///
  /// For more information, see [Modifying Reserved
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html)
  /// in the Amazon Elastic Compute Cloud User Guide.
  Future<void> describeReservedInstancesModifications(
      {List<Filter> filters,
      List<String> reservedInstancesModificationIds,
      String nextToken}) async {}

  /// Describes Reserved Instance offerings that are available for purchase.
  /// With Reserved Instances, you purchase the right to launch instances for a
  /// period of time. During that time period, you do not receive insufficient
  /// capacity errors, and you pay a lower usage rate than the rate charged for
  /// On-Demand instances for the actual time used.
  ///
  /// If you have listed your own Reserved Instances for sale in the Reserved
  /// Instance Marketplace, they will be excluded from these results. This is to
  /// ensure that you do not purchase your own Reserved Instances.
  ///
  /// For more information, see [Reserved Instance
  /// Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeReservedInstancesOfferings(
      {String availabilityZone,
      List<Filter> filters,
      bool includeMarketplace,
      String instanceType,
      BigInt maxDuration,
      int maxInstanceCount,
      BigInt minDuration,
      String offeringClass,
      String productDescription,
      List<String> reservedInstancesOfferingIds,
      bool dryRun,
      String instanceTenancy,
      int maxResults,
      String nextToken,
      String offeringType}) async {}

  /// Describes one or more of your route tables.
  ///
  /// Each subnet in your VPC must be associated with a route table. If a subnet
  /// is not explicitly associated with any route table, it is implicitly
  /// associated with the main route table. This command does not return the
  /// subnet ID for implicit associations.
  ///
  /// For more information, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> describeRouteTables(
      {List<Filter> filters,
      bool dryRun,
      List<String> routeTableIds,
      String nextToken,
      int maxResults}) async {}

  /// Finds available schedules that meet the specified criteria.
  ///
  /// You can search for an available schedule no more than 3 months in advance.
  /// You must meet the minimum required duration of 1,200 hours per year. For
  /// example, the minimum daily schedule is 4 hours, the minimum weekly
  /// schedule is 24 hours, and the minimum monthly schedule is 100 hours.
  ///
  /// After you find a schedule that meets your needs, call
  /// PurchaseScheduledInstances to purchase Scheduled Instances with that
  /// schedule.
  Future<void> describeScheduledInstanceAvailability(
      {bool dryRun,
      List<Filter> filters,
      @required SlotDateTimeRangeRequest firstSlotStartTimeRange,
      int maxResults,
      int maxSlotDurationInHours,
      int minSlotDurationInHours,
      String nextToken,
      @required ScheduledInstanceRecurrenceRequest recurrence}) async {}

  /// Describes the specified Scheduled Instances or all your Scheduled
  /// Instances.
  Future<void> describeScheduledInstances(
      {bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      List<String> scheduledInstanceIds,
      SlotStartTimeRangeRequest slotStartTimeRange}) async {}

  /// \[VPC only\] Describes the VPCs on the other side of a VPC peering
  /// connection that are referencing the security groups you've specified in
  /// this request.
  Future<void> describeSecurityGroupReferences(List<String> groupId,
      {bool dryRun}) async {}

  /// Describes the specified security groups or all of your security groups.
  ///
  /// A security group is for use with instances either in the EC2-Classic
  /// platform or in a specific VPC. For more information, see [Amazon EC2
  /// Security
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_ and [Security Groups for
  /// Your
  /// VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> describeSecurityGroups(
      {List<Filter> filters,
      List<String> groupIds,
      List<String> groupNames,
      bool dryRun,
      String nextToken,
      int maxResults}) async {}

  /// Describes the specified attribute of the specified snapshot. You can
  /// specify only one attribute at a time.
  ///
  /// For more information about EBS snapshots, see [Amazon EBS
  /// Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeSnapshotAttribute(
      {@required String attribute,
      @required String snapshotId,
      bool dryRun}) async {}

  /// Describes the specified EBS snapshots available to you or all of the EBS
  /// snapshots available to you.
  ///
  /// The snapshots available to you include public snapshots, private snapshots
  /// that you own, and private snapshots owned by other AWS accounts for which
  /// you have explicit create volume permissions.
  ///
  /// The create volume permissions fall into the following categories:
  ///
  /// *    _public_: The owner of the snapshot granted create volume permissions
  /// for the snapshot to the `all` group. All AWS accounts have create volume
  /// permissions for these snapshots.
  ///
  /// *    _explicit_: The owner of the snapshot granted create volume
  /// permissions to a specific AWS account.
  ///
  /// *    _implicit_: An AWS account has implicit create volume permissions for
  /// all snapshots it owns.
  ///
  ///
  /// The list of snapshots returned can be modified by specifying snapshot IDs,
  /// snapshot owners, or AWS accounts with create volume permissions. If no
  /// options are specified, Amazon EC2 returns all snapshots for which you have
  /// create volume permissions.
  ///
  /// If you specify one or more snapshot IDs, only snapshots that have the
  /// specified IDs are returned. If you specify an invalid snapshot ID, an
  /// error is returned. If you specify a snapshot ID for which you do not have
  /// access, it is not included in the returned results.
  ///
  /// If you specify one or more snapshot owners using the `OwnerIds` option,
  /// only snapshots from the specified owners and for which you have access are
  /// returned. The results can include the AWS account IDs of the specified
  /// owners, `amazon` for snapshots owned by Amazon, or `self` for snapshots
  /// that you own.
  ///
  /// If you specify a list of restorable users, only snapshots with create
  /// snapshot permissions for those users are returned. You can specify AWS
  /// account IDs (if you own the snapshots), `self` for snapshots for which you
  /// own or have explicit permissions, or `all` for public snapshots.
  ///
  /// If you are describing a long list of snapshots, you can paginate the
  /// output to make the list more manageable. The `MaxResults` parameter sets
  /// the maximum number of results returned in a single page. If the list of
  /// results exceeds your `MaxResults` value, then that number of results is
  /// returned along with a `NextToken` value that can be passed to a subsequent
  /// `DescribeSnapshots` request to retrieve the remaining results.
  ///
  /// For more information about EBS snapshots, see [Amazon EBS
  /// Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeSnapshots(
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      List<String> ownerIds,
      List<String> restorableByUserIds,
      List<String> snapshotIds,
      bool dryRun}) async {}

  /// Describes the data feed for Spot Instances. For more information, see
  /// [Spot Instance Data
  /// Feed](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-data-feeds.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  Future<void> describeSpotDatafeedSubscription({bool dryRun}) async {}

  /// Describes the running instances for the specified Spot Fleet.
  Future<void> describeSpotFleetInstances(String spotFleetRequestId,
      {bool dryRun, int maxResults, String nextToken}) async {}

  /// Describes the events for the specified Spot Fleet request during the
  /// specified time.
  ///
  /// Spot Fleet events are delayed by up to 30 seconds before they can be
  /// described. This ensures that you can query by the last evaluated time and
  /// not miss a recorded event. Spot Fleet events are available for 48 hours.
  Future<void> describeSpotFleetRequestHistory(
      {bool dryRun,
      String eventType,
      int maxResults,
      String nextToken,
      @required String spotFleetRequestId,
      @required DateTime startTime}) async {}

  /// Describes your Spot Fleet requests.
  ///
  /// Spot Fleet requests are deleted 48 hours after they are canceled and their
  /// instances are terminated.
  Future<void> describeSpotFleetRequests(
      {bool dryRun,
      int maxResults,
      String nextToken,
      List<String> spotFleetRequestIds}) async {}

  /// Describes the specified Spot Instance requests.
  ///
  /// You can use `DescribeSpotInstanceRequests` to find a running Spot Instance
  /// by examining the response. If the status of the Spot Instance is
  /// `fulfilled`, the instance ID appears in the response and contains the
  /// identifier of the instance. Alternatively, you can use DescribeInstances
  /// with a filter to look for instances where the instance lifecycle is
  /// `spot`.
  ///
  /// We recommend that you set `MaxResults` to a value between 5 and 1000 to
  /// limit the number of results returned. This paginates the output, which
  /// makes the list more manageable and returns the results faster. If the list
  /// of results exceeds your `MaxResults` value, then that number of results is
  /// returned along with a `NextToken` value that can be passed to a subsequent
  /// `DescribeSpotInstanceRequests` request to retrieve the remaining results.
  ///
  /// Spot Instance requests are deleted four hours after they are canceled and
  /// their instances are terminated.
  Future<void> describeSpotInstanceRequests(
      {List<Filter> filters,
      bool dryRun,
      List<String> spotInstanceRequestIds,
      String nextToken,
      int maxResults}) async {}

  /// Describes the Spot price history. For more information, see [Spot Instance
  /// Pricing
  /// History](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances-history.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  ///
  /// When you specify a start and end time, this operation returns the prices
  /// of the instance types within the time range that you specified and the
  /// time when the price changed. The price is valid within the time period
  /// that you specified; the response merely indicates the last time that the
  /// price changed.
  Future<void> describeSpotPriceHistory(
      {List<Filter> filters,
      String availabilityZone,
      bool dryRun,
      DateTime endTime,
      List<String> instanceTypes,
      int maxResults,
      String nextToken,
      List<String> productDescriptions,
      DateTime startTime}) async {}

  /// \[VPC only\] Describes the stale security group rules for security groups
  /// in a specified VPC. Rules are stale when they reference a deleted security
  /// group in a peer VPC, or a security group in a peer VPC for which the VPC
  /// peering connection has been deleted.
  Future<void> describeStaleSecurityGroups(String vpcId,
      {bool dryRun, int maxResults, String nextToken}) async {}

  /// Describes one or more of your subnets.
  ///
  /// For more information, see [Your VPC and
  /// Subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> describeSubnets(
      {List<Filter> filters,
      List<String> subnetIds,
      bool dryRun,
      String nextToken,
      int maxResults}) async {}

  /// Describes the specified tags for your EC2 resources.
  ///
  /// For more information about tags, see [Tagging Your
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeTags(
      {bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more Traffic Mirror filters.
  Future<void> describeTrafficMirrorFilters(
      {List<String> trafficMirrorFilterIds,
      bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more Traffic Mirror sessions. By default, all Traffic
  /// Mirror sessions are described. Alternatively, you can filter the results.
  Future<void> describeTrafficMirrorSessions(
      {List<String> trafficMirrorSessionIds,
      bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Information about one or more Traffic Mirror targets.
  Future<void> describeTrafficMirrorTargets(
      {List<String> trafficMirrorTargetIds,
      bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more attachments between resources and transit gateways.
  /// By default, all attachments are described. Alternatively, you can filter
  /// the results by attachment ID, attachment state, resource ID, or resource
  /// owner.
  Future<void> describeTransitGatewayAttachments(
      {List<String> transitGatewayAttachmentIds,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Describes one or more transit gateway route tables. By default, all
  /// transit gateway route tables are described. Alternatively, you can filter
  /// the results.
  Future<void> describeTransitGatewayRouteTables(
      {List<String> transitGatewayRouteTableIds,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Describes one or more VPC attachments. By default, all VPC attachments are
  /// described. Alternatively, you can filter the results.
  Future<void> describeTransitGatewayVpcAttachments(
      {List<String> transitGatewayAttachmentIds,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Describes one or more transit gateways. By default, all transit gateways
  /// are described. Alternatively, you can filter the results.
  Future<void> describeTransitGateways(
      {List<String> transitGatewayIds,
      List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Describes the specified attribute of the specified volume. You can specify
  /// only one attribute at a time.
  ///
  /// For more information about EBS volumes, see [Amazon EBS
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeVolumeAttribute(
      {@required String attribute,
      @required String volumeId,
      bool dryRun}) async {}

  /// Describes the status of the specified volumes. Volume status provides the
  /// result of the checks performed on your volumes to determine events that
  /// can impair the performance of your volumes. The performance of a volume
  /// can be affected if an issue occurs on the volume's underlying host. If the
  /// volume's underlying host experiences a power outage or system issue, after
  /// the system is restored, there could be data inconsistencies on the volume.
  /// Volume events notify you if this occurs. Volume actions notify you if any
  /// action needs to be taken in response to the event.
  ///
  /// The `DescribeVolumeStatus` operation provides the following information
  /// about the specified volumes:
  ///
  ///  _Status_: Reflects the current status of the volume. The possible values
  /// are `ok`, `impaired` , `warning`, or `insufficient-data`. If all checks
  /// pass, the overall status of the volume is `ok`. If the check fails, the
  /// overall status is `impaired`. If the status is `insufficient-data`, then
  /// the checks may still be taking place on your volume at the time. We
  /// recommend that you retry the request. For more information about volume
  /// status, see [Monitoring the Status of Your
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  ///  _Events_: Reflect the cause of a volume status and may require you to
  /// take action. For example, if your volume returns an `impaired` status,
  /// then the volume event might be `potential-data-inconsistency`. This means
  /// that your volume has been affected by an issue with the underlying host,
  /// has all I/O operations disabled, and may have inconsistent data.
  ///
  ///  _Actions_: Reflect the actions you may have to take in response to an
  /// event. For example, if the status of the volume is `impaired` and the
  /// volume event shows `potential-data-inconsistency`, then the action shows
  /// `enable-volume-io`. This means that you may want to enable the I/O
  /// operations for the volume by calling the EnableVolumeIO action and then
  /// check the volume for data consistency.
  ///
  /// Volume status is based on the volume status checks, and does not reflect
  /// the volume state. Therefore, volume status does not indicate volumes in
  /// the `error` state (for example, when a volume is incapable of accepting
  /// I/O.)
  Future<void> describeVolumeStatus(
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      List<String> volumeIds,
      bool dryRun}) async {}

  /// Describes the specified EBS volumes or all of your EBS volumes.
  ///
  /// If you are describing a long list of volumes, you can paginate the output
  /// to make the list more manageable. The `MaxResults` parameter sets the
  /// maximum number of results returned in a single page. If the list of
  /// results exceeds your `MaxResults` value, then that number of results is
  /// returned along with a `NextToken` value that can be passed to a subsequent
  /// `DescribeVolumes` request to retrieve the remaining results.
  ///
  /// For more information about EBS volumes, see [Amazon EBS
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeVolumes(
      {List<Filter> filters,
      List<String> volumeIds,
      bool dryRun,
      int maxResults,
      String nextToken}) async {}

  /// Reports the current modification status of EBS volumes.
  ///
  /// Current-generation EBS volumes support modification of attributes
  /// including type, size, and (for `io1` volumes) IOPS provisioning while
  /// either attached to or detached from an instance. Following an action from
  /// the API or the console to modify a volume, the status of the modification
  /// may be `modifying`, `optimizing`, `completed`, or `failed`. If a volume
  /// has never been modified, then certain elements of the returned
  /// `VolumeModification` objects are null.
  ///
  ///  You can also use CloudWatch Events to check the status of a modification
  /// to an EBS volume. For information about CloudWatch Events, see the [Amazon
  /// CloudWatch Events User
  /// Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/). For
  /// more information, see [Monitoring Volume
  /// Modifications"](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeVolumesModifications(
      {bool dryRun,
      List<String> volumeIds,
      List<Filter> filters,
      String nextToken,
      int maxResults}) async {}

  /// Describes the specified attribute of the specified VPC. You can specify
  /// only one attribute at a time.
  Future<void> describeVpcAttribute(
      {@required String attribute,
      @required String vpcId,
      bool dryRun}) async {}

  /// Describes the ClassicLink status of one or more VPCs.
  Future<void> describeVpcClassicLink(
      {List<Filter> filters, bool dryRun, List<String> vpcIds}) async {}

  /// Describes the ClassicLink DNS support status of one or more VPCs. If
  /// enabled, the DNS hostname of a linked EC2-Classic instance resolves to its
  /// private IP address when addressed from an instance in the VPC to which
  /// it's linked. Similarly, the DNS hostname of an instance in a VPC resolves
  /// to its private IP address when addressed from a linked EC2-Classic
  /// instance. For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> describeVpcClassicLinkDnsSupport(
      {int maxResults, String nextToken, List<String> vpcIds}) async {}

  /// Describes the connection notifications for VPC endpoints and VPC endpoint
  /// services.
  Future<void> describeVpcEndpointConnectionNotifications(
      {bool dryRun,
      String connectionNotificationId,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the VPC endpoint connections to your VPC endpoint services,
  /// including any endpoints that are pending your acceptance.
  Future<void> describeVpcEndpointConnections(
      {bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the VPC endpoint service configurations in your account (your
  /// services).
  Future<void> describeVpcEndpointServiceConfigurations(
      {bool dryRun,
      List<String> serviceIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes the principals (service consumers) that are permitted to
  /// discover your VPC endpoint service.
  Future<void> describeVpcEndpointServicePermissions(String serviceId,
      {bool dryRun,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes available services to which you can create a VPC endpoint.
  Future<void> describeVpcEndpointServices(
      {bool dryRun,
      List<String> serviceNames,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more of your VPC endpoints.
  Future<void> describeVpcEndpoints(
      {bool dryRun,
      List<String> vpcEndpointIds,
      List<Filter> filters,
      int maxResults,
      String nextToken}) async {}

  /// Describes one or more of your VPC peering connections.
  Future<void> describeVpcPeeringConnections(
      {List<Filter> filters,
      bool dryRun,
      List<String> vpcPeeringConnectionIds,
      String nextToken,
      int maxResults}) async {}

  /// Describes one or more of your VPCs.
  Future<void> describeVpcs(
      {List<Filter> filters,
      List<String> vpcIds,
      bool dryRun,
      String nextToken,
      int maxResults}) async {}

  /// Describes one or more of your VPN connections.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> describeVpnConnections(
      {List<Filter> filters,
      List<String> vpnConnectionIds,
      bool dryRun}) async {}

  /// Describes one or more of your virtual private gateways.
  ///
  /// For more information, see [AWS Site-to-Site
  /// VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html) in the
  /// _AWS Site-to-Site VPN User Guide_.
  Future<void> describeVpnGateways(
      {List<Filter> filters, List<String> vpnGatewayIds, bool dryRun}) async {}

  /// Unlinks (detaches) a linked EC2-Classic instance from a VPC. After the
  /// instance has been unlinked, the VPC security groups are no longer
  /// associated with it. An instance is automatically unlinked from a VPC when
  /// it's stopped.
  Future<void> detachClassicLinkVpc(
      {bool dryRun,
      @required String instanceId,
      @required String vpcId}) async {}

  /// Detaches an internet gateway from a VPC, disabling connectivity between
  /// the internet and the VPC. The VPC must not contain any running instances
  /// with Elastic IP addresses or public IPv4 addresses.
  Future<void> detachInternetGateway(
      {bool dryRun,
      @required String internetGatewayId,
      @required String vpcId}) async {}

  /// Detaches a network interface from an instance.
  Future<void> detachNetworkInterface(String attachmentId,
      {bool dryRun, bool force}) async {}

  /// Detaches an EBS volume from an instance. Make sure to unmount any file
  /// systems on the device within your operating system before detaching the
  /// volume. Failure to do so can result in the volume becoming stuck in the
  /// `busy` state while detaching. If this happens, detachment can be delayed
  /// indefinitely until you unmount the volume, force detachment, reboot the
  /// instance, or all three. If an EBS volume is the root device of an
  /// instance, it can't be detached while the instance is running. To detach
  /// the root volume, stop the instance first.
  ///
  /// When a volume with an AWS Marketplace product code is detached from an
  /// instance, the product code is no longer associated with the instance.
  ///
  /// For more information, see [Detaching an Amazon EBS
  /// Volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> detachVolume(String volumeId,
      {String device, bool force, String instanceId, bool dryRun}) async {}

  /// Detaches a virtual private gateway from a VPC. You do this if you're
  /// planning to turn off the VPC and not use it anymore. You can confirm a
  /// virtual private gateway has been completely detached from a VPC by
  /// describing the virtual private gateway (any attachments to the virtual
  /// private gateway are also described).
  ///
  /// You must wait for the attachment's state to switch to `detached` before
  /// you can delete the VPC or attach a different VPC to the virtual private
  /// gateway.
  Future<void> detachVpnGateway(
      {@required String vpcId,
      @required String vpnGatewayId,
      bool dryRun}) async {}

  /// Disables EBS encryption by default for your account in the current Region.
  ///
  /// After you disable encryption by default, you can still create encrypted
  /// volumes by enabling encryption when you create each volume.
  ///
  /// Disabling encryption by default does not change the encryption status of
  /// your existing volumes.
  ///
  /// For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> disableEbsEncryptionByDefault({bool dryRun}) async {}

  /// Disables the specified resource attachment from propagating routes to the
  /// specified propagation route table.
  Future<void> disableTransitGatewayRouteTablePropagation(
      {@required String transitGatewayRouteTableId,
      @required String transitGatewayAttachmentId,
      bool dryRun}) async {}

  /// Disables a virtual private gateway (VGW) from propagating routes to a
  /// specified route table of a VPC.
  Future<void> disableVgwRoutePropagation(
      {@required String gatewayId, @required String routeTableId}) async {}

  /// Disables ClassicLink for a VPC. You cannot disable ClassicLink for a VPC
  /// that has EC2-Classic instances linked to it.
  Future<void> disableVpcClassicLink(String vpcId, {bool dryRun}) async {}

  /// Disables ClassicLink DNS support for a VPC. If disabled, DNS hostnames
  /// resolve to public IP addresses when addressed between a linked EC2-Classic
  /// instance and instances in the VPC to which it's linked. For more
  /// information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> disableVpcClassicLinkDnsSupport({String vpcId}) async {}

  /// Disassociates an Elastic IP address from the instance or network interface
  /// it's associated with.
  ///
  /// An Elastic IP address is for use in either the EC2-Classic platform or in
  /// a VPC. For more information, see [Elastic IP
  /// Addresses](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// This is an idempotent operation. If you perform the operation more than
  /// once, Amazon EC2 doesn't return an error.
  Future<void> disassociateAddress(
      {String associationId, String publicIp, bool dryRun}) async {}

  /// Disassociates a target network from the specified Client VPN endpoint.
  /// When you disassociate the last target network from a Client VPN, the
  /// following happens:
  ///
  /// *   The route that was automatically added for the VPC is deleted
  ///
  /// *   All active client connections are terminated
  ///
  /// *   New client connections are disallowed
  ///
  /// *   The Client VPN endpoint's status changes to `pending-associate`
  Future<void> disassociateClientVpnTargetNetwork(
      {@required String clientVpnEndpointId,
      @required String associationId,
      bool dryRun}) async {}

  /// Disassociates an IAM instance profile from a running or stopped instance.
  ///
  /// Use DescribeIamInstanceProfileAssociations to get the association ID.
  Future<void> disassociateIamInstanceProfile(String associationId) async {}

  /// Disassociates a subnet from a route table.
  ///
  /// After you perform this action, the subnet no longer uses the routes in the
  /// route table. Instead, it uses the routes in the VPC's main route table.
  /// For more information about route tables, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> disassociateRouteTable(String associationId,
      {bool dryRun}) async {}

  /// Disassociates a CIDR block from a subnet. Currently, you can disassociate
  /// an IPv6 CIDR block only. You must detach or delete all gateways and
  /// resources that are associated with the CIDR block before you can
  /// disassociate it.
  Future<void> disassociateSubnetCidrBlock(String associationId) async {}

  /// Disassociates a resource attachment from a transit gateway route table.
  Future<void> disassociateTransitGatewayRouteTable(
      {@required String transitGatewayRouteTableId,
      @required String transitGatewayAttachmentId,
      bool dryRun}) async {}

  /// Disassociates a CIDR block from a VPC. To disassociate the CIDR block, you
  /// must specify its association ID. You can get the association ID by using
  /// DescribeVpcs. You must detach or delete all gateways and resources that
  /// are associated with the CIDR block before you can disassociate it.
  ///
  /// You cannot disassociate the CIDR block with which you originally created
  /// the VPC (the primary CIDR block).
  Future<void> disassociateVpcCidrBlock(String associationId) async {}

  /// Enables EBS encryption by default for your account in the current Region.
  ///
  /// After you enable encryption by default, the EBS volumes that you create
  /// are are always encrypted, either using the default CMK or the CMK that you
  /// specified when you created each volume. For more information, see [Amazon
  /// EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// You can specify the default CMK for encryption by default using
  /// ModifyEbsDefaultKmsKeyId or ResetEbsDefaultKmsKeyId.
  ///
  /// Enabling encryption by default has no effect on the encryption status of
  /// your existing volumes.
  ///
  /// After you enable encryption by default, you can no longer launch instances
  /// using instance types that do not support encryption. For more information,
  /// see [Supported Instance
  /// Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances).
  Future<void> enableEbsEncryptionByDefault({bool dryRun}) async {}

  /// Enables the specified attachment to propagate routes to the specified
  /// propagation route table.
  Future<void> enableTransitGatewayRouteTablePropagation(
      {@required String transitGatewayRouteTableId,
      @required String transitGatewayAttachmentId,
      bool dryRun}) async {}

  /// Enables a virtual private gateway (VGW) to propagate routes to the
  /// specified route table of a VPC.
  Future<void> enableVgwRoutePropagation(
      {@required String gatewayId, @required String routeTableId}) async {}

  /// Enables I/O operations for a volume that had I/O operations disabled
  /// because the data on the volume was potentially inconsistent.
  Future<void> enableVolumeIO(String volumeId, {bool dryRun}) async {}

  /// Enables a VPC for ClassicLink. You can then link EC2-Classic instances to
  /// your ClassicLink-enabled VPC to allow communication over private IP
  /// addresses. You cannot enable your VPC for ClassicLink if any of your VPC
  /// route tables have existing routes for address ranges within the
  /// `10.0.0.0/8` IP address range, excluding local routes for VPCs in the
  /// `10.0.0.0/16` and `10.1.0.0/16` IP address ranges. For more information,
  /// see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> enableVpcClassicLink(String vpcId, {bool dryRun}) async {}

  /// Enables a VPC to support DNS hostname resolution for ClassicLink. If
  /// enabled, the DNS hostname of a linked EC2-Classic instance resolves to its
  /// private IP address when addressed from an instance in the VPC to which
  /// it's linked. Similarly, the DNS hostname of an instance in a VPC resolves
  /// to its private IP address when addressed from a linked EC2-Classic
  /// instance. For more information, see
  /// [ClassicLink](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> enableVpcClassicLinkDnsSupport({String vpcId}) async {}

  /// Downloads the client certificate revocation list for the specified Client
  /// VPN endpoint.
  Future<void> exportClientVpnClientCertificateRevocationList(
      String clientVpnEndpointId,
      {bool dryRun}) async {}

  /// Downloads the contents of the Client VPN endpoint configuration file for
  /// the specified Client VPN endpoint. The Client VPN endpoint configuration
  /// file includes the Client VPN endpoint and certificate information clients
  /// need to establish a connection with the Client VPN endpoint.
  Future<void> exportClientVpnClientConfiguration(String clientVpnEndpointId,
      {bool dryRun}) async {}

  /// Exports an Amazon Machine Image (AMI) to a VM file. For more information,
  /// see [Exporting a VM Directory from an Amazon Machine Image
  /// (AMI)](https://docs.aws.amazon.com/vm-import/latest/userguide/vmexport_image.html)
  /// in the _VM Import/Export User Guide_.
  Future<void> exportImage(
      {String clientToken,
      String description,
      @required String diskImageFormat,
      bool dryRun,
      @required String imageId,
      @required ExportTaskS3LocationRequest s3ExportLocation,
      String roleName}) async {}

  /// Exports routes from the specified transit gateway route table to the
  /// specified S3 bucket. By default, all routes are exported. Alternatively,
  /// you can filter by CIDR range.
  Future<void> exportTransitGatewayRoutes(
      {@required String transitGatewayRouteTableId,
      List<Filter> filters,
      @required String s3Bucket,
      bool dryRun}) async {}

  /// Gets usage information about a Capacity Reservation. If the Capacity
  /// Reservation is shared, it shows usage information for the Capacity
  /// Reservation owner and each AWS account that is currently using the shared
  /// capacity. If the Capacity Reservation is not shared, it shows only the
  /// Capacity Reservation owner's usage.
  Future<void> getCapacityReservationUsage(String capacityReservationId,
      {String nextToken, int maxResults, bool dryRun}) async {}

  /// Gets the console output for the specified instance. For Linux instances,
  /// the instance console output displays the exact console output that would
  /// normally be displayed on a physical monitor attached to a computer. For
  /// Windows instances, the instance console output includes the last three
  /// system event log errors.
  ///
  /// By default, the console output returns buffered information that was
  /// posted shortly after an instance transition state (start, stop, reboot, or
  /// terminate). This information is available for at least one hour after the
  /// most recent post. Only the most recent 64 KB of console output is
  /// available.
  ///
  /// You can optionally retrieve the latest serial console output at any time
  /// during the instance lifecycle. This option is supported on instance types
  /// that use the Nitro hypervisor.
  ///
  /// For more information, see [Instance Console
  /// Output](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html#instance-console-console-output)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> getConsoleOutput(String instanceId,
      {bool dryRun, bool latest}) async {}

  /// Retrieve a JPG-format screenshot of a running instance to help with
  /// troubleshooting.
  ///
  /// The returned content is Base64-encoded.
  Future<void> getConsoleScreenshot(String instanceId,
      {bool dryRun, bool wakeUp}) async {}

  /// Describes the default customer master key (CMK) for EBS encryption by
  /// default for your account in this Region. You can change the default CMK
  /// for encryption by default using ModifyEbsDefaultKmsKeyId or
  /// ResetEbsDefaultKmsKeyId.
  ///
  /// For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> getEbsDefaultKmsKeyId({bool dryRun}) async {}

  /// Describes whether EBS encryption by default is enabled for your account in
  /// the current Region.
  ///
  /// For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> getEbsEncryptionByDefault({bool dryRun}) async {}

  /// Preview a reservation purchase with configurations that match those of
  /// your Dedicated Host. You must have active Dedicated Hosts in your account
  /// before you purchase a reservation.
  ///
  /// This is a preview of the PurchaseHostReservation action and does not
  /// result in the offering being purchased.
  Future<void> getHostReservationPurchasePreview(
      {@required List<String> hostIdSet, @required String offeringId}) async {}

  /// Retrieves the configuration data of the specified instance. You can use
  /// this data to create a launch template.
  Future<void> getLaunchTemplateData(String instanceId, {bool dryRun}) async {}

  /// Retrieves the encrypted administrator password for a running Windows
  /// instance.
  ///
  /// The Windows password is generated at boot by the `EC2Config` service or
  /// `EC2Launch` scripts (Windows Server 2016 and later). This usually only
  /// happens the first time an instance is launched. For more information, see
  /// [EC2Config](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/UsingConfig_WinAMI.html)
  /// and
  /// [EC2Launch](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2launch.html)
  /// in the Amazon Elastic Compute Cloud User Guide.
  ///
  /// For the `EC2Config` service, the password is not generated for rebundled
  /// AMIs unless `Ec2SetPassword` is enabled before bundling.
  ///
  /// The password is encrypted using the key pair that you specified when you
  /// launched the instance. You must provide the corresponding key pair file.
  ///
  /// When you launch an instance, password generation and encryption may take a
  /// few minutes. If you try to retrieve the password before it's available,
  /// the output returns an empty string. We recommend that you wait up to 15
  /// minutes after launching an instance before trying to retrieve the
  /// generated password.
  Future<void> getPasswordData(String instanceId, {bool dryRun}) async {}

  /// Returns a quote and exchange information for exchanging one or more
  /// specified Convertible Reserved Instances for a new Convertible Reserved
  /// Instance. If the exchange cannot be performed, the reason is returned in
  /// the response. Use AcceptReservedInstancesExchangeQuote to perform the
  /// exchange.
  Future<void> getReservedInstancesExchangeQuote(
      List<String> reservedInstanceIds,
      {bool dryRun,
      List<TargetConfigurationRequest> targetConfigurations}) async {}

  /// Lists the route tables to which the specified resource attachment
  /// propagates routes.
  Future<void> getTransitGatewayAttachmentPropagations(
      String transitGatewayAttachmentId,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Gets information about the associations for the specified transit gateway
  /// route table.
  Future<void> getTransitGatewayRouteTableAssociations(
      String transitGatewayRouteTableId,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Gets information about the route table propagations for the specified
  /// transit gateway route table.
  Future<void> getTransitGatewayRouteTablePropagations(
      String transitGatewayRouteTableId,
      {List<Filter> filters,
      int maxResults,
      String nextToken,
      bool dryRun}) async {}

  /// Uploads a client certificate revocation list to the specified Client VPN
  /// endpoint. Uploading a client certificate revocation list overwrites the
  /// existing client certificate revocation list.
  ///
  /// Uploading a client certificate revocation list resets existing client
  /// connections.
  Future<void> importClientVpnClientCertificateRevocationList(
      {@required String clientVpnEndpointId,
      @required String certificateRevocationList,
      bool dryRun}) async {}

  /// Import single or multi-volume disk images or EBS snapshots into an Amazon
  /// Machine Image (AMI). For more information, see [Importing a VM as an Image
  /// Using VM
  /// Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html)
  /// in the _VM Import/Export User Guide_.
  Future<void> importImage(
      {String architecture,
      ClientData clientData,
      String clientToken,
      String description,
      List<ImageDiskContainer> diskContainers,
      bool dryRun,
      bool encrypted,
      String hypervisor,
      String kmsKeyId,
      String licenseType,
      String platform,
      String roleName}) async {}

  /// Creates an import instance task using metadata from the specified disk
  /// image. `ImportInstance` only supports single-volume VMs. To import
  /// multi-volume VMs, use ImportImage. For more information, see [Importing a
  /// Virtual Machine Using the Amazon EC2
  /// CLI](https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/ec2-cli-vmimport-export.html).
  ///
  /// For information about the import manifest referenced by this API action,
  /// see [VM Import
  /// Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).
  Future<void> importInstance(String platform,
      {String description,
      List<DiskImage> diskImages,
      bool dryRun,
      ImportInstanceLaunchSpecification launchSpecification}) async {}

  /// Imports the public key from an RSA key pair that you created with a
  /// third-party tool. Compare this with CreateKeyPair, in which AWS creates
  /// the key pair and gives the keys to you (AWS keeps a copy of the public
  /// key). With ImportKeyPair, you create the key pair and give AWS just the
  /// public key. The private key is never transferred between you and AWS.
  ///
  /// For more information about key pairs, see [Key
  /// Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> importKeyPair(
      {bool dryRun,
      @required String keyName,
      @required Uint8List publicKeyMaterial}) async {}

  /// Imports a disk into an EBS snapshot.
  Future<void> importSnapshot(
      {ClientData clientData,
      String clientToken,
      String description,
      SnapshotDiskContainer diskContainer,
      bool dryRun,
      bool encrypted,
      String kmsKeyId,
      String roleName}) async {}

  /// Creates an import volume task using metadata from the specified disk
  /// image.For more information, see [Importing Disks to Amazon
  /// EBS](https://docs.aws.amazon.com/AWSEC2/latest/CommandLineReference/importing-your-volumes-into-amazon-ebs.html).
  ///
  /// For information about the import manifest referenced by this API action,
  /// see [VM Import
  /// Manifest](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/manifest.html).
  Future<void> importVolume(
      {@required String availabilityZone,
      String description,
      bool dryRun,
      @required DiskImageDetail image,
      @required VolumeDetail volume}) async {}

  /// Modifies a Capacity Reservation's capacity and the conditions under which
  /// it is to be released. You cannot change a Capacity Reservation's instance
  /// type, EBS optimization, instance store settings, platform, Availability
  /// Zone, or instance eligibility. If you need to modify any of these
  /// attributes, we recommend that you cancel the Capacity Reservation, and
  /// then create a new one with the required attributes.
  Future<void> modifyCapacityReservation(String capacityReservationId,
      {int instanceCount,
      DateTime endDate,
      String endDateType,
      bool dryRun}) async {}

  /// Modifies the specified Client VPN endpoint. You can only modify an
  /// endpoint's server certificate information, client connection logging
  /// information, DNS server, and description. Modifying the DNS server resets
  /// existing client connections.
  Future<void> modifyClientVpnEndpoint(String clientVpnEndpointId,
      {String serverCertificateArn,
      ConnectionLogOptions connectionLogOptions,
      DnsServersOptionsModifyStructure dnsServers,
      String description,
      bool splitTunnel,
      bool dryRun}) async {}

  /// Changes the default customer master key (CMK) for EBS encryption by
  /// default for your account in this Region.
  ///
  /// AWS creates a unique AWS managed CMK in each Region for use with
  /// encryption by default. If you change the default CMK to a customer managed
  /// CMK, it is used instead of the AWS managed CMK. To reset the default CMK
  /// to the AWS managed CMK for EBS, use ResetEbsDefaultKmsKeyId.
  ///
  /// If you delete or disable the customer managed CMK that you specified for
  /// use with encryption by default, your instances will fail to launch.
  ///
  /// For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> modifyEbsDefaultKmsKeyId(String kmsKeyId, {bool dryRun}) async {}

  /// Modifies the specified EC2 Fleet.
  ///
  /// You can only modify an EC2 Fleet request of type `maintain`.
  ///
  /// While the EC2 Fleet is being modified, it is in the `modifying` state.
  ///
  /// To scale up your EC2 Fleet, increase its target capacity. The EC2 Fleet
  /// launches the additional Spot Instances according to the allocation
  /// strategy for the EC2 Fleet request. If the allocation strategy is
  /// `lowestPrice`, the EC2 Fleet launches instances using the Spot Instance
  /// pool with the lowest price. If the allocation strategy is `diversified`,
  /// the EC2 Fleet distributes the instances across the Spot Instance pools. If
  /// the allocation strategy is `capacityOptimized`, EC2 Fleet launches
  /// instances from Spot Instance pools with optimal capacity for the number of
  /// instances that are launching.
  ///
  /// To scale down your EC2 Fleet, decrease its target capacity. First, the EC2
  /// Fleet cancels any open requests that exceed the new target capacity. You
  /// can request that the EC2 Fleet terminate Spot Instances until the size of
  /// the fleet no longer exceeds the new target capacity. If the allocation
  /// strategy is `lowestPrice`, the EC2 Fleet terminates the instances with the
  /// highest price per unit. If the allocation strategy is `capacityOptimized`,
  /// the EC2 Fleet terminates the instances in the Spot Instance pools that
  /// have the least available Spot Instance capacity. If the allocation
  /// strategy is `diversified`, the EC2 Fleet terminates instances across the
  /// Spot Instance pools. Alternatively, you can request that the EC2 Fleet
  /// keep the fleet at its current size, but not replace any Spot Instances
  /// that are interrupted or that you terminate manually.
  ///
  /// If you are finished with your EC2 Fleet for now, but will use it again
  /// later, you can set the target capacity to 0.
  Future<void> modifyFleet(
      {bool dryRun,
      String excessCapacityTerminationPolicy,
      @required
          String fleetId,
      @required
          TargetCapacitySpecificationRequest
              targetCapacitySpecification}) async {}

  /// Modifies the specified attribute of the specified Amazon FPGA Image (AFI).
  Future<void> modifyFpgaImageAttribute(String fpgaImageId,
      {bool dryRun,
      String attribute,
      String operationType,
      List<String> userIds,
      List<String> userGroups,
      List<String> productCodes,
      LoadPermissionModifications loadPermission,
      String description,
      String name}) async {}

  /// Modify the auto-placement setting of a Dedicated Host. When auto-placement
  /// is enabled, any instances that you launch with a tenancy of `host` but
  /// without a specific host ID are placed onto any available Dedicated Host in
  /// your account that has auto-placement enabled. When auto-placement is
  /// disabled, you need to provide a host ID to have the instance launch onto a
  /// specific host. If no host ID is provided, the instance is launched onto a
  /// suitable host with auto-placement enabled.
  Future<void> modifyHosts(List<String> hostIds,
      {String autoPlacement, String hostRecovery}) async {}

  /// Modifies the ID format for the specified resource on a per-Region basis.
  /// You can specify that resources should receive longer IDs (17-character
  /// IDs) when they are created.
  ///
  /// This request can only be used to modify longer ID settings for resource
  /// types that are within the opt-in period. Resources currently in their
  /// opt-in period include: `bundle` | `conversion-task` | `customer-gateway` |
  /// `dhcp-options` | `elastic-ip-allocation` | `elastic-ip-association` |
  /// `export-task` | `flow-log` | `image` | `import-task` | `internet-gateway`
  /// | `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `route-table` |
  /// `route-table-association` | `security-group` | `subnet` |
  /// `subnet-cidr-block-association` | `vpc` | `vpc-cidr-block-association` |
  /// `vpc-endpoint` | `vpc-peering-connection` | `vpn-connection` |
  /// `vpn-gateway`.
  ///
  /// This setting applies to the IAM user who makes the request; it does not
  /// apply to the entire AWS account. By default, an IAM user defaults to the
  /// same settings as the root user. If you're using this action as the root
  /// user, then these settings apply to the entire account, unless an IAM user
  /// explicitly overrides these settings for themselves. For more information,
  /// see [Resource
  /// IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// Resources created with longer IDs are visible to all IAM roles and users,
  /// regardless of these settings and provided that they have permission to use
  /// the relevant `Describe` command for the resource type.
  Future<void> modifyIdFormat(
      {@required String resource, @required bool useLongIds}) async {}

  /// Modifies the ID format of a resource for a specified IAM user, IAM role,
  /// or the root user for an account; or all IAM users, IAM roles, and the root
  /// user for an account. You can specify that resources should receive longer
  /// IDs (17-character IDs) when they are created.
  ///
  /// This request can only be used to modify longer ID settings for resource
  /// types that are within the opt-in period. Resources currently in their
  /// opt-in period include: `bundle` | `conversion-task` | `customer-gateway` |
  /// `dhcp-options` | `elastic-ip-allocation` | `elastic-ip-association` |
  /// `export-task` | `flow-log` | `image` | `import-task` | `internet-gateway`
  /// | `network-acl` | `network-acl-association` | `network-interface` |
  /// `network-interface-attachment` | `prefix-list` | `route-table` |
  /// `route-table-association` | `security-group` | `subnet` |
  /// `subnet-cidr-block-association` | `vpc` | `vpc-cidr-block-association` |
  /// `vpc-endpoint` | `vpc-peering-connection` | `vpn-connection` |
  /// `vpn-gateway`.
  ///
  /// For more information, see [Resource
  /// IDs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resource-ids.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// This setting applies to the principal specified in the request; it does
  /// not apply to the principal that makes the request.
  ///
  /// Resources created with longer IDs are visible to all IAM roles and users,
  /// regardless of these settings and provided that they have permission to use
  /// the relevant `Describe` command for the resource type.
  Future<void> modifyIdentityIdFormat(
      {@required String principalArn,
      @required String resource,
      @required bool useLongIds}) async {}

  /// Modifies the specified attribute of the specified AMI. You can specify
  /// only one attribute at a time. You can use the `Attribute` parameter to
  /// specify the attribute or one of the following parameters: `Description`,
  /// `LaunchPermission`, or `ProductCode`.
  ///
  /// AWS Marketplace product codes cannot be modified. Images with an AWS
  /// Marketplace product code cannot be made public.
  ///
  /// To enable the SriovNetSupport enhanced networking attribute of an image,
  /// enable SriovNetSupport on an instance and create an AMI from the instance.
  Future<void> modifyImageAttribute(String imageId,
      {String attribute,
      AttributeValue description,
      LaunchPermissionModifications launchPermission,
      String operationType,
      List<String> productCodes,
      List<String> userGroups,
      List<String> userIds,
      String value,
      bool dryRun}) async {}

  /// Modifies the specified attribute of the specified instance. You can
  /// specify only one attribute at a time.
  ///
  ///  **Note:** Using this action to change the security groups associated with
  /// an elastic network interface (ENI) attached to an instance in a VPC can
  /// result in an error if the instance has more than one ENI. To change the
  /// security groups associated with an ENI attached to an instance that has
  /// multiple ENIs, we recommend that you use the
  /// ModifyNetworkInterfaceAttribute action.
  ///
  /// To modify some attributes, the instance must be stopped. For more
  /// information, see [Modifying Attributes of a Stopped
  /// Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_ChangingAttributesWhileInstanceStopped.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> modifyInstanceAttribute(String instanceId,
      {AttributeBooleanValue sourceDestCheck,
      String attribute,
      List<InstanceBlockDeviceMappingSpecification> blockDeviceMappings,
      AttributeBooleanValue disableApiTermination,
      bool dryRun,
      AttributeBooleanValue ebsOptimized,
      AttributeBooleanValue enaSupport,
      List<String> groups,
      AttributeValue instanceInitiatedShutdownBehavior,
      AttributeValue instanceType,
      AttributeValue kernel,
      AttributeValue ramdisk,
      AttributeValue sriovNetSupport,
      BlobAttributeValue userData,
      String value}) async {}

  /// Modifies the Capacity Reservation settings for a stopped instance. Use
  /// this action to configure an instance to target a specific Capacity
  /// Reservation, run in any `open` Capacity Reservation with matching
  /// attributes, or run On-Demand Instance capacity.
  Future<void> modifyInstanceCapacityReservationAttributes(
      {@required
          String instanceId,
      @required
          CapacityReservationSpecification capacityReservationSpecification,
      bool dryRun}) async {}

  /// Modifies the credit option for CPU usage on a running or stopped T2 or T3
  /// instance. The credit options are `standard` and `unlimited`.
  ///
  /// For more information, see [Burstable Performance
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> modifyInstanceCreditSpecification(
      List<InstanceCreditSpecificationRequest> instanceCreditSpecifications,
      {bool dryRun,
      String clientToken}) async {}

  /// Modifies the start time for a scheduled Amazon EC2 instance event.
  Future<void> modifyInstanceEventStartTime(
      {bool dryRun,
      @required String instanceId,
      @required String instanceEventId,
      @required DateTime notBefore}) async {}

  /// Modifies the placement attributes for a specified instance. You can do the
  /// following:
  ///
  /// *   Modify the affinity between an instance and a [Dedicated
  /// Host](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html).
  /// When affinity is set to `host` and the instance is not associated with a
  /// specific Dedicated Host, the next time the instance is launched, it is
  /// automatically associated with the host on which it lands. If the instance
  /// is restarted or rebooted, this relationship persists.
  ///
  /// *   Change the Dedicated Host with which an instance is associated.
  ///
  /// *   Change the instance tenancy of an instance from `host` to `dedicated`,
  /// or from `dedicated` to `host`.
  ///
  /// *   Move an instance to or from a [placement
  /// group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html).
  ///
  ///
  /// At least one attribute for affinity, host ID, tenancy, or placement group
  /// name must be specified in the request. Affinity and tenancy can be
  /// modified in the same request.
  ///
  /// To modify the host ID, tenancy, placement group, or partition for an
  /// instance, the instance must be in the `stopped` state.
  Future<void> modifyInstancePlacement(String instanceId,
      {String affinity,
      String groupName,
      String hostId,
      String tenancy,
      int partitionNumber}) async {}

  /// Modifies a launch template. You can specify which version of the launch
  /// template to set as the default version. When launching an instance, the
  /// default version applies when a launch template version is not specified.
  Future<void> modifyLaunchTemplate(
      {bool dryRun,
      String clientToken,
      String launchTemplateId,
      String launchTemplateName,
      String defaultVersion}) async {}

  /// Modifies the specified network interface attribute. You can specify only
  /// one attribute at a time. You can use this action to attach and detach
  /// security groups from an existing EC2 instance.
  Future<void> modifyNetworkInterfaceAttribute(String networkInterfaceId,
      {NetworkInterfaceAttachmentChanges attachment,
      AttributeValue description,
      bool dryRun,
      List<String> groups,
      AttributeBooleanValue sourceDestCheck}) async {}

  /// Modifies the Availability Zone, instance count, instance type, or network
  /// platform (EC2-Classic or EC2-VPC) of your Reserved Instances. The Reserved
  /// Instances to be modified must be identical, except for Availability Zone,
  /// network platform, and instance type.
  ///
  /// For more information, see [Modifying Reserved
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html)
  /// in the Amazon Elastic Compute Cloud User Guide.
  Future<void> modifyReservedInstances(
      {@required
          List<String> reservedInstancesIds,
      String clientToken,
      @required
          List<ReservedInstancesConfiguration> targetConfigurations}) async {}

  /// Adds or removes permission settings for the specified snapshot. You may
  /// add or remove specified AWS account IDs from a snapshot's list of create
  /// volume permissions, but you cannot do both in a single operation. If you
  /// need to both add and remove account IDs for a snapshot, you must use
  /// multiple operations. You can make up to 500 modifications to a snapshot in
  /// a single operation.
  ///
  /// Encrypted snapshots and snapshots with AWS Marketplace product codes
  /// cannot be made public. Snapshots encrypted with your default CMK cannot be
  /// shared with other accounts.
  ///
  /// For more information about modifying snapshot permissions, see [Sharing
  /// Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> modifySnapshotAttribute(String snapshotId,
      {String attribute,
      CreateVolumePermissionModifications createVolumePermission,
      List<String> groupNames,
      String operationType,
      List<String> userIds,
      bool dryRun}) async {}

  /// Modifies the specified Spot Fleet request.
  ///
  /// You can only modify a Spot Fleet request of type `maintain`.
  ///
  /// While the Spot Fleet request is being modified, it is in the `modifying`
  /// state.
  ///
  /// To scale up your Spot Fleet, increase its target capacity. The Spot Fleet
  /// launches the additional Spot Instances according to the allocation
  /// strategy for the Spot Fleet request. If the allocation strategy is
  /// `lowestPrice`, the Spot Fleet launches instances using the Spot Instance
  /// pool with the lowest price. If the allocation strategy is `diversified`,
  /// the Spot Fleet distributes the instances across the Spot Instance pools.
  /// If the allocation strategy is `capacityOptimized`, Spot Fleet launches
  /// instances from Spot Instance pools with optimal capacity for the number of
  /// instances that are launching.
  ///
  /// To scale down your Spot Fleet, decrease its target capacity. First, the
  /// Spot Fleet cancels any open requests that exceed the new target capacity.
  /// You can request that the Spot Fleet terminate Spot Instances until the
  /// size of the fleet no longer exceeds the new target capacity. If the
  /// allocation strategy is `lowestPrice`, the Spot Fleet terminates the
  /// instances with the highest price per unit. If the allocation strategy is
  /// `capacityOptimized`, the Spot Fleet terminates the instances in the Spot
  /// Instance pools that have the least available Spot Instance capacity. If
  /// the allocation strategy is `diversified`, the Spot Fleet terminates
  /// instances across the Spot Instance pools. Alternatively, you can request
  /// that the Spot Fleet keep the fleet at its current size, but not replace
  /// any Spot Instances that are interrupted or that you terminate manually.
  ///
  /// If you are finished with your Spot Fleet for now, but will use it again
  /// later, you can set the target capacity to 0.
  Future<void> modifySpotFleetRequest(String spotFleetRequestId,
      {String excessCapacityTerminationPolicy,
      int targetCapacity,
      int onDemandTargetCapacity}) async {}

  /// Modifies a subnet attribute. You can only modify one attribute at a time.
  Future<void> modifySubnetAttribute(String subnetId,
      {AttributeBooleanValue assignIpv6AddressOnCreation,
      AttributeBooleanValue mapPublicIpOnLaunch}) async {}

  /// Allows or restricts mirroring network services.
  ///
  ///  By default, Amazon DNS network services are not eligible for Traffic
  /// Mirror. Use `AddNetworkServices` to add network services to a Traffic
  /// Mirror filter. When a network service is added to the Traffic Mirror
  /// filter, all traffic related to that network service will be mirrored. When
  /// you no longer want to mirror network services, use `RemoveNetworkServices`
  /// to remove the network services from the Traffic Mirror filter.
  ///
  /// FFor information about filter rule properties, see [Network
  /// Services](https://docs.aws.amazon.com/vpc/latest/mirroring/traffic-mirroring-considerations.html#traffic-mirroring-network-services)
  /// in the _Traffic Mirroring User Guide_ .
  Future<void> modifyTrafficMirrorFilterNetworkServices(
      String trafficMirrorFilterId,
      {List<String> addNetworkServices,
      List<String> removeNetworkServices,
      bool dryRun}) async {}

  /// Modifies the specified Traffic Mirror rule.
  ///
  ///  `DestinationCidrBlock` and `SourceCidrBlock` must both be an IPv4 range
  /// or an IPv6 range.
  Future<void> modifyTrafficMirrorFilterRule(String trafficMirrorFilterRuleId,
      {String trafficDirection,
      int ruleNumber,
      String ruleAction,
      TrafficMirrorPortRangeRequest destinationPortRange,
      TrafficMirrorPortRangeRequest sourcePortRange,
      int protocol,
      String destinationCidrBlock,
      String sourceCidrBlock,
      String description,
      List<String> removeFields,
      bool dryRun}) async {}

  /// Modifies a Traffic Mirror session.
  Future<void> modifyTrafficMirrorSession(String trafficMirrorSessionId,
      {String trafficMirrorTargetId,
      String trafficMirrorFilterId,
      int packetLength,
      int sessionNumber,
      int virtualNetworkId,
      String description,
      List<String> removeFields,
      bool dryRun}) async {}

  /// Modifies the specified VPC attachment.
  Future<void> modifyTransitGatewayVpcAttachment(
      String transitGatewayAttachmentId,
      {List<String> addSubnetIds,
      List<String> removeSubnetIds,
      ModifyTransitGatewayVpcAttachmentRequestOptions options,
      bool dryRun}) async {}

  /// You can modify several parameters of an existing EBS volume, including
  /// volume size, volume type, and IOPS capacity. If your EBS volume is
  /// attached to a current-generation EC2 instance type, you may be able to
  /// apply these changes without stopping the instance or detaching the volume
  /// from it. For more information about modifying an EBS volume running Linux,
  /// see [Modifying the Size, IOPS, or Type of an EBS Volume on
  /// Linux](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html).
  /// For more information about modifying an EBS volume running Windows, see
  /// [Modifying the Size, IOPS, or Type of an EBS Volume on
  /// Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html).
  ///
  ///  When you complete a resize operation on your volume, you need to extend
  /// the volume's file-system size to take advantage of the new storage
  /// capacity. For information about extending a Linux file system, see
  /// [Extending a Linux File
  /// System](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux).
  /// For information about extending a Windows file system, see [Extending a
  /// Windows File
  /// System](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html#recognize-expanded-volume-windows).
  ///
  ///  You can use CloudWatch Events to check the status of a modification to an
  /// EBS volume. For information about CloudWatch Events, see the [Amazon
  /// CloudWatch Events User
  /// Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/). You
  /// can also track the status of a modification using
  /// DescribeVolumesModifications. For information about tracking status
  /// changes using either method, see [Monitoring Volume
  /// Modifications](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#monitoring_mods).
  ///
  /// With previous-generation instance types, resizing an EBS volume may
  /// require detaching and reattaching the volume or stopping and restarting
  /// the instance. For more information, see [Modifying the Size, IOPS, or Type
  /// of an EBS Volume on
  /// Linux](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html)
  /// and [Modifying the Size, IOPS, or Type of an EBS Volume on
  /// Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-expand-volume.html).
  ///
  /// If you reach the maximum volume modification rate per volume limit, you
  /// will need to wait at least six hours before applying further modifications
  /// to the affected EBS volume.
  Future<void> modifyVolume(String volumeId,
      {bool dryRun, int size, String volumeType, int iops}) async {}

  /// Modifies a volume attribute.
  ///
  /// By default, all I/O operations for the volume are suspended when the data
  /// on the volume is determined to be potentially inconsistent, to prevent
  /// undetectable, latent data corruption. The I/O access to the volume can be
  /// resumed by first enabling I/O access and then checking the data
  /// consistency on your volume.
  ///
  /// You can change the default behavior to resume I/O operations. We recommend
  /// that you change this only for boot volumes or for volumes that are
  /// stateless or disposable.
  Future<void> modifyVolumeAttribute(String volumeId,
      {AttributeBooleanValue autoEnableIO, bool dryRun}) async {}

  /// Modifies the specified attribute of the specified VPC.
  Future<void> modifyVpcAttribute(String vpcId,
      {AttributeBooleanValue enableDnsHostnames,
      AttributeBooleanValue enableDnsSupport}) async {}

  /// Modifies attributes of a specified VPC endpoint. The attributes that you
  /// can modify depend on the type of VPC endpoint (interface or gateway). For
  /// more information, see [VPC
  /// Endpoints](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-endpoints.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> modifyVpcEndpoint(String vpcEndpointId,
      {bool dryRun,
      bool resetPolicy,
      String policyDocument,
      List<String> addRouteTableIds,
      List<String> removeRouteTableIds,
      List<String> addSubnetIds,
      List<String> removeSubnetIds,
      List<String> addSecurityGroupIds,
      List<String> removeSecurityGroupIds,
      bool privateDnsEnabled}) async {}

  /// Modifies a connection notification for VPC endpoint or VPC endpoint
  /// service. You can change the SNS topic for the notification, or the events
  /// for which to be notified.
  Future<void> modifyVpcEndpointConnectionNotification(
      String connectionNotificationId,
      {bool dryRun,
      String connectionNotificationArn,
      List<String> connectionEvents}) async {}

  /// Modifies the attributes of your VPC endpoint service configuration. You
  /// can change the Network Load Balancers for your service, and you can
  /// specify whether acceptance is required for requests to connect to your
  /// endpoint service through an interface VPC endpoint.
  Future<void> modifyVpcEndpointServiceConfiguration(String serviceId,
      {bool dryRun,
      bool acceptanceRequired,
      List<String> addNetworkLoadBalancerArns,
      List<String> removeNetworkLoadBalancerArns}) async {}

  /// Modifies the permissions for your [VPC endpoint
  /// service](https://docs.aws.amazon.com/vpc/latest/userguide/endpoint-service.html).
  /// You can add or remove permissions for service consumers (IAM users, IAM
  /// roles, and AWS accounts) to connect to your endpoint service.
  ///
  /// If you grant permissions to all principals, the service is public. Any
  /// users who know the name of a public service can send a request to attach
  /// an endpoint. If the service does not require manual approval, attachments
  /// are automatically approved.
  Future<void> modifyVpcEndpointServicePermissions(String serviceId,
      {bool dryRun,
      List<String> addAllowedPrincipals,
      List<String> removeAllowedPrincipals}) async {}

  /// Modifies the VPC peering connection options on one side of a VPC peering
  /// connection. You can do the following:
  ///
  /// *   Enable/disable communication over the peering connection between an
  /// EC2-Classic instance that's linked to your VPC (using ClassicLink) and
  /// instances in the peer VPC.
  ///
  /// *   Enable/disable communication over the peering connection between
  /// instances in your VPC and an EC2-Classic instance that's linked to the
  /// peer VPC.
  ///
  /// *   Enable/disable the ability to resolve public DNS hostnames to private
  /// IP addresses when queried from instances in the peer VPC.
  ///
  ///
  /// If the peered VPCs are in the same AWS account, you can enable DNS
  /// resolution for queries from the local VPC. This ensures that queries from
  /// the local VPC resolve to private IP addresses in the peer VPC. This option
  /// is not available if the peered VPCs are in different AWS accounts or
  /// different Regions. For peered VPCs in different AWS accounts, each AWS
  /// account owner must initiate a separate request to modify the peering
  /// connection options. For inter-region peering connections, you must use the
  /// Region for the requester VPC to modify the requester VPC peering options
  /// and the Region for the accepter VPC to modify the accepter VPC peering
  /// options. To verify which VPCs are the accepter and the requester for a VPC
  /// peering connection, use the DescribeVpcPeeringConnections command.
  Future<void> modifyVpcPeeringConnectionOptions(String vpcPeeringConnectionId,
      {PeeringConnectionOptionsRequest accepterPeeringConnectionOptions,
      bool dryRun,
      PeeringConnectionOptionsRequest
          requesterPeeringConnectionOptions}) async {}

  /// Modifies the instance tenancy attribute of the specified VPC. You can
  /// change the instance tenancy attribute of a VPC to `default` only. You
  /// cannot change the instance tenancy attribute to `dedicated`.
  ///
  /// After you modify the tenancy of the VPC, any new instances that you launch
  /// into the VPC have a tenancy of `default`, unless you specify otherwise
  /// during launch. The tenancy of any existing instances in the VPC is not
  /// affected.
  ///
  /// For more information, see [Dedicated
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> modifyVpcTenancy(
      {@required String vpcId,
      @required String instanceTenancy,
      bool dryRun}) async {}

  /// Modifies the target gateway of an AWS Site-to-Site VPN connection. The
  /// following migration options are available:
  ///
  /// *   An existing virtual private gateway to a new virtual private gateway
  ///
  /// *   An existing virtual private gateway to a transit gateway
  ///
  /// *   An existing transit gateway to a new transit gateway
  ///
  /// *   An existing transit gateway to a virtual private gateway
  ///
  ///
  /// Before you perform the migration to the new gateway, you must configure
  /// the new gateway. Use CreateVpnGateway to create a virtual private gateway,
  /// or CreateTransitGateway to create a transit gateway.
  ///
  /// This step is required when you migrate from a virtual private gateway with
  /// static routes to a transit gateway.
  ///
  /// You must delete the static routes before you migrate to the new gateway.
  ///
  /// Keep a copy of the static route before you delete it. You will need to add
  /// back these routes to the transit gateway after the VPN connection
  /// migration is complete.
  ///
  /// After you migrate to the new gateway, you might need to modify your VPC
  /// route table. Use CreateRoute and DeleteRoute to make the changes described
  /// in [VPN Gateway Target Modification Required VPC Route Table
  /// Updates](https://docs.aws.amazon.com/vpn/latest/s2svpn/modify-vpn-target.html#step-update-routing)
  /// in the _AWS Site-to-Site VPN User Guide_.
  ///
  ///  When the new gateway is a transit gateway, modify the transit gateway
  /// route table to allow traffic between the VPC and the AWS Site-to-Site VPN
  /// connection. Use CreateTransitGatewayRoute to add the routes.
  ///
  ///  If you deleted VPN static routes, you must add the static routes to the
  /// transit gateway route table.
  ///
  /// After you perform this operation, the AWS VPN endpoint's IP addresses on
  /// the AWS side and the tunnel options remain intact. Your s2slong;
  /// connection will be temporarily unavailable for approximately 10 minutes
  /// while we provision the new endpoints
  Future<void> modifyVpnConnection(String vpnConnectionId,
      {String transitGatewayId,
      String customerGatewayId,
      String vpnGatewayId,
      bool dryRun}) async {}

  /// Modifies the VPN tunnel endpoint certificate.
  Future<void> modifyVpnTunnelCertificate(
      {@required String vpnConnectionId,
      @required String vpnTunnelOutsideIpAddress,
      bool dryRun}) async {}

  /// Modifies the options for a VPN tunnel in an AWS Site-to-Site VPN
  /// connection. You can modify multiple options for a tunnel in a single
  /// request, but you can only modify one tunnel at a time. For more
  /// information, see [Site-to-Site VPN Tunnel Options for Your Site-to-Site
  /// VPN
  /// Connection](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPNTunnels.html)
  /// in the _AWS Site-to-Site VPN User Guide_.
  Future<void> modifyVpnTunnelOptions(
      {@required String vpnConnectionId,
      @required String vpnTunnelOutsideIpAddress,
      @required ModifyVpnTunnelOptionsSpecification tunnelOptions,
      bool dryRun}) async {}

  /// Enables detailed monitoring for a running instance. Otherwise, basic
  /// monitoring is enabled. For more information, see [Monitoring Your
  /// Instances and
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// To disable detailed monitoring, see .
  Future<void> monitorInstances(List<String> instanceIds,
      {bool dryRun}) async {}

  /// Moves an Elastic IP address from the EC2-Classic platform to the EC2-VPC
  /// platform. The Elastic IP address must be allocated to your account for
  /// more than 24 hours, and it must not be associated with an instance. After
  /// the Elastic IP address is moved, it is no longer available for use in the
  /// EC2-Classic platform, unless you move it back using the
  /// RestoreAddressToClassic request. You cannot move an Elastic IP address
  /// that was originally allocated for use in the EC2-VPC platform to the
  /// EC2-Classic platform.
  Future<void> moveAddressToVpc(String publicIp, {bool dryRun}) async {}

  /// Provisions an address range for use with your AWS resources through bring
  /// your own IP addresses (BYOIP) and creates a corresponding address pool.
  /// After the address range is provisioned, it is ready to be advertised using
  /// AdvertiseByoipCidr.
  ///
  /// AWS verifies that you own the address range and are authorized to
  /// advertise it. You must ensure that the address range is registered to you
  /// and that you created an RPKI ROA to authorize Amazon ASNs 16509 and 14618
  /// to advertise the address range. For more information, see [Bring Your Own
  /// IP Addresses
  /// (BYOIP)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// Provisioning an address range is an asynchronous operation, so the call
  /// returns immediately, but the address range is not ready to use until its
  /// status changes from `pending-provision` to `provisioned`. To monitor the
  /// status of an address range, use DescribeByoipCidrs. To allocate an Elastic
  /// IP address from your address pool, use AllocateAddress with either the
  /// specific address from the address pool or the ID of the address pool.
  Future<void> provisionByoipCidr(String cidr,
      {CidrAuthorizationContext cidrAuthorizationContext,
      String description,
      bool dryRun}) async {}

  /// Purchase a reservation with configurations that match those of your
  /// Dedicated Host. You must have active Dedicated Hosts in your account
  /// before you purchase a reservation. This action results in the specified
  /// reservation being purchased and charged to your account.
  Future<void> purchaseHostReservation(
      {String clientToken,
      String currencyCode,
      @required List<String> hostIdSet,
      String limitPrice,
      @required String offeringId}) async {}

  /// Purchases a Reserved Instance for use with your account. With Reserved
  /// Instances, you pay a lower hourly rate compared to On-Demand instance
  /// pricing.
  ///
  /// Use DescribeReservedInstancesOfferings to get a list of Reserved Instance
  /// offerings that match your specifications. After you've purchased a
  /// Reserved Instance, you can check for your new Reserved Instance with
  /// DescribeReservedInstances.
  ///
  /// For more information, see [Reserved
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-on-demand-reserved-instances.html)
  /// and [Reserved Instance
  /// Marketplace](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> purchaseReservedInstancesOffering(
      {@required int instanceCount,
      @required String reservedInstancesOfferingId,
      bool dryRun,
      ReservedInstanceLimitPrice limitPrice}) async {}

  /// Purchases the Scheduled Instances with the specified schedule.
  ///
  /// Scheduled Instances enable you to purchase Amazon EC2 compute capacity by
  /// the hour for a one-year term. Before you can purchase a Scheduled
  /// Instance, you must call DescribeScheduledInstanceAvailability to check for
  /// available schedules and obtain a purchase token. After you purchase a
  /// Scheduled Instance, you must call RunScheduledInstances during each
  /// scheduled time period.
  ///
  /// After you purchase a Scheduled Instance, you can't cancel, modify, or
  /// resell your purchase.
  Future<void> purchaseScheduledInstances(
      List<PurchaseRequest> purchaseRequests,
      {String clientToken,
      bool dryRun}) async {}

  /// Requests a reboot of the specified instances. This operation is
  /// asynchronous; it only queues a request to reboot the specified instances.
  /// The operation succeeds if the instances are valid and belong to you.
  /// Requests to reboot terminated instances are ignored.
  ///
  /// If an instance does not cleanly shut down within four minutes, Amazon EC2
  /// performs a hard reboot.
  ///
  /// For more information about troubleshooting, see [Getting Console Output
  /// and Rebooting
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> rebootInstances(List<String> instanceIds, {bool dryRun}) async {}

  /// Registers an AMI. When you're creating an AMI, this is the final step you
  /// must complete before you can launch an instance from the AMI. For more
  /// information about creating AMIs, see [Creating Your Own
  /// AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/creating-an-ami.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  ///  For Amazon EBS-backed instances, CreateImage creates and registers the
  /// AMI in a single request, so you don't have to register the AMI yourself.
  ///
  /// You can also use `RegisterImage` to create an Amazon EBS-backed Linux AMI
  /// from a snapshot of a root device volume. You specify the snapshot using
  /// the block device mapping. For more information, see [Launching a Linux
  /// Instance from a
  /// Backup](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-launch-snapshot.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// You can't register an image where a secondary (non-root) snapshot has AWS
  /// Marketplace product codes.
  ///
  /// Some Linux distributions, such as Red Hat Enterprise Linux (RHEL) and SUSE
  /// Linux Enterprise Server (SLES), use the EC2 billing product code
  /// associated with an AMI to verify the subscription status for package
  /// updates. Creating an AMI from an EBS snapshot does not maintain this
  /// billing code, and instances launched from such an AMI are not able to
  /// connect to package update infrastructure. If you purchase a Reserved
  /// Instance offering for one of these Linux distributions and launch
  /// instances using an AMI that does not contain the required billing code,
  /// your Reserved Instance is not applied to these instances.
  ///
  /// To create an AMI for operating systems that require a billing code, see
  /// CreateImage.
  ///
  /// If needed, you can deregister an AMI at any time. Any modifications you
  /// make to an AMI backed by an instance store volume invalidates its
  /// registration. If you make changes to an image, deregister the previous
  /// image and register the new image.
  Future<void> registerImage(String name,
      {String imageLocation,
      String architecture,
      List<BlockDeviceMapping> blockDeviceMappings,
      String description,
      bool dryRun,
      bool enaSupport,
      String kernelId,
      List<String> billingProducts,
      String ramdiskId,
      String rootDeviceName,
      String sriovNetSupport,
      String virtualizationType}) async {}

  /// Rejects a request to attach a VPC to a transit gateway.
  ///
  /// The VPC attachment must be in the `pendingAcceptance` state. Use
  /// DescribeTransitGatewayVpcAttachments to view your pending VPC attachment
  /// requests. Use AcceptTransitGatewayVpcAttachment to accept a VPC attachment
  /// request.
  Future<void> rejectTransitGatewayVpcAttachment(
      String transitGatewayAttachmentId,
      {bool dryRun}) async {}

  /// Rejects one or more VPC endpoint connection requests to your VPC endpoint
  /// service.
  Future<void> rejectVpcEndpointConnections(
      {bool dryRun,
      @required String serviceId,
      @required List<String> vpcEndpointIds}) async {}

  /// Rejects a VPC peering connection request. The VPC peering connection must
  /// be in the `pending-acceptance` state. Use the
  /// DescribeVpcPeeringConnections request to view your outstanding VPC peering
  /// connection requests. To delete an active VPC peering connection, or to
  /// delete a VPC peering connection request that you initiated, use
  /// DeleteVpcPeeringConnection.
  Future<void> rejectVpcPeeringConnection(String vpcPeeringConnectionId,
      {bool dryRun}) async {}

  /// Releases the specified Elastic IP address.
  ///
  /// \[EC2-Classic, default VPC\] Releasing an Elastic IP address automatically
  /// disassociates it from any instance that it's associated with. To
  /// disassociate an Elastic IP address without releasing it, use
  /// DisassociateAddress.
  ///
  /// \[Nondefault VPC\] You must use DisassociateAddress to disassociate the
  /// Elastic IP address before you can release it. Otherwise, Amazon EC2
  /// returns an error (`InvalidIPAddress.InUse`).
  ///
  /// After releasing an Elastic IP address, it is released to the IP address
  /// pool. Be sure to update your DNS records and any servers or devices that
  /// communicate with the address. If you attempt to release an Elastic IP
  /// address that you already released, you'll get an `AuthFailure` error if
  /// the address is already allocated to another AWS account.
  ///
  /// \[EC2-VPC\] After you release an Elastic IP address for use in a VPC, you
  /// might be able to recover it. For more information, see AllocateAddress.
  Future<void> releaseAddress(
      {String allocationId, String publicIp, bool dryRun}) async {}

  /// When you no longer want to use an On-Demand Dedicated Host it can be
  /// released. On-Demand billing is stopped and the host goes into `released`
  /// state. The host ID of Dedicated Hosts that have been released can no
  /// longer be specified in another request, for example, to modify the host.
  /// You must stop or terminate all instances on a host before it can be
  /// released.
  ///
  /// When Dedicated Hosts are released, it may take some time for them to stop
  /// counting toward your limit and you may receive capacity errors when trying
  /// to allocate new Dedicated Hosts. Wait a few minutes and then try again.
  ///
  /// Released hosts still appear in a DescribeHosts response.
  Future<void> releaseHosts(List<String> hostIds) async {}

  /// Replaces an IAM instance profile for the specified running instance. You
  /// can use this action to change the IAM instance profile that's associated
  /// with an instance without having to disassociate the existing IAM instance
  /// profile first.
  ///
  /// Use DescribeIamInstanceProfileAssociations to get the association ID.
  Future<void> replaceIamInstanceProfileAssociation(
      {@required IamInstanceProfileSpecification iamInstanceProfile,
      @required String associationId}) async {}

  /// Changes which network ACL a subnet is associated with. By default when you
  /// create a subnet, it's automatically associated with the default network
  /// ACL. For more information, see [Network
  /// ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// This is an idempotent operation.
  Future<void> replaceNetworkAclAssociation(
      {@required String associationId,
      bool dryRun,
      @required String networkAclId}) async {}

  /// Replaces an entry (rule) in a network ACL. For more information, see
  /// [Network
  /// ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_ACLs.html) in
  /// the _Amazon Virtual Private Cloud User Guide_.
  Future<void> replaceNetworkAclEntry(
      {String cidrBlock,
      bool dryRun,
      @required bool egress,
      IcmpTypeCode icmpTypeCode,
      String ipv6CidrBlock,
      @required String networkAclId,
      PortRange portRange,
      @required String protocol,
      @required String ruleAction,
      @required int ruleNumber}) async {}

  /// Replaces an existing route within a route table in a VPC. You must provide
  /// only one of the following: internet gateway or virtual private gateway,
  /// NAT instance, NAT gateway, VPC peering connection, network interface, or
  /// egress-only internet gateway.
  ///
  /// For more information, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> replaceRoute(String routeTableId,
      {String destinationCidrBlock,
      String destinationIpv6CidrBlock,
      bool dryRun,
      String egressOnlyInternetGatewayId,
      String gatewayId,
      String instanceId,
      String natGatewayId,
      String transitGatewayId,
      String networkInterfaceId,
      String vpcPeeringConnectionId}) async {}

  /// Changes the route table associated with a given subnet in a VPC. After the
  /// operation completes, the subnet uses the routes in the new route table
  /// it's associated with. For more information about route tables, see [Route
  /// Tables](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  ///
  /// You can also use ReplaceRouteTableAssociation to change which table is the
  /// main route table in the VPC. You just specify the main route table's
  /// association ID and the route table to be the new main route table.
  Future<void> replaceRouteTableAssociation(
      {@required String associationId,
      bool dryRun,
      @required String routeTableId}) async {}

  /// Replaces the specified route in the specified transit gateway route table.
  Future<void> replaceTransitGatewayRoute(
      {@required String destinationCidrBlock,
      @required String transitGatewayRouteTableId,
      String transitGatewayAttachmentId,
      bool blackhole,
      bool dryRun}) async {}

  /// Submits feedback about the status of an instance. The instance must be in
  /// the `running` state. If your experience with the instance differs from the
  /// instance status returned by DescribeInstanceStatus, use
  /// ReportInstanceStatus to report your experience with the instance. Amazon
  /// EC2 collects this information to improve the accuracy of status checks.
  ///
  /// Use of this action does not change the value returned by
  /// DescribeInstanceStatus.
  Future<void> reportInstanceStatus(
      {String description,
      bool dryRun,
      DateTime endTime,
      @required List<String> instances,
      @required List<String> reasonCodes,
      DateTime startTime,
      @required String status}) async {}

  /// Creates a Spot Fleet request.
  ///
  /// The Spot Fleet request specifies the total target capacity and the
  /// On-Demand target capacity. Amazon EC2 calculates the difference between
  /// the total capacity and On-Demand capacity, and launches the difference as
  /// Spot capacity.
  ///
  /// You can submit a single request that includes multiple launch
  /// specifications that vary by instance type, AMI, Availability Zone, or
  /// subnet.
  ///
  /// By default, the Spot Fleet requests Spot Instances in the Spot Instance
  /// pool where the price per unit is the lowest. Each launch specification can
  /// include its own instance weighting that reflects the value of the instance
  /// type to your application workload.
  ///
  /// Alternatively, you can specify that the Spot Fleet distribute the target
  /// capacity across the Spot pools included in its launch specifications. By
  /// ensuring that the Spot Instances in your Spot Fleet are in different Spot
  /// pools, you can improve the availability of your fleet.
  ///
  /// You can specify tags for the Spot Instances. You cannot tag other resource
  /// types in a Spot Fleet request because only the `instance` resource type is
  /// supported.
  ///
  /// For more information, see [Spot Fleet
  /// Requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-requests.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  Future<void> requestSpotFleet(
      SpotFleetRequestConfigData spotFleetRequestConfig,
      {bool dryRun}) async {}

  /// Creates a Spot Instance request.
  ///
  /// For more information, see [Spot Instance
  /// Requests](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html)
  /// in the _Amazon EC2 User Guide for Linux Instances_.
  Future<void> requestSpotInstances(
      {String availabilityZoneGroup,
      int blockDurationMinutes,
      String clientToken,
      bool dryRun,
      int instanceCount,
      String launchGroup,
      RequestSpotLaunchSpecification launchSpecification,
      String spotPrice,
      String type,
      DateTime validFrom,
      DateTime validUntil,
      String instanceInterruptionBehavior}) async {}

  /// Resets the default customer master key (CMK) for EBS encryption for your
  /// account in this Region to the AWS managed CMK for EBS.
  ///
  /// After resetting the default CMK to the AWS managed CMK, you can continue
  /// to encrypt by a customer managed CMK by specifying it when you create the
  /// volume. For more information, see [Amazon EBS
  /// Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> resetEbsDefaultKmsKeyId({bool dryRun}) async {}

  /// Resets the specified attribute of the specified Amazon FPGA Image (AFI) to
  /// its default value. You can only reset the load permission attribute.
  Future<void> resetFpgaImageAttribute(String fpgaImageId,
      {bool dryRun, String attribute}) async {}

  /// Resets an attribute of an AMI to its default value.
  ///
  ///
  ///
  /// The productCodes attribute can't be reset.
  Future<void> resetImageAttribute(
      {@required String attribute,
      @required String imageId,
      bool dryRun}) async {}

  /// Resets an attribute of an instance to its default value. To reset the
  /// `kernel` or `ramdisk`, the instance must be in a stopped state. To reset
  /// the `sourceDestCheck`, the instance can be either running or stopped.
  ///
  /// The `sourceDestCheck` attribute controls whether source/destination
  /// checking is enabled. The default value is `true`, which means checking is
  /// enabled. This value must be `false` for a NAT instance to perform NAT. For
  /// more information, see [NAT
  /// Instances](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_NAT_Instance.html)
  /// in the _Amazon Virtual Private Cloud User Guide_.
  Future<void> resetInstanceAttribute(
      {@required String attribute,
      bool dryRun,
      @required String instanceId}) async {}

  /// Resets a network interface attribute. You can specify only one attribute
  /// at a time.
  Future<void> resetNetworkInterfaceAttribute(String networkInterfaceId,
      {bool dryRun, String sourceDestCheck}) async {}

  /// Resets permission settings for the specified snapshot.
  ///
  /// For more information about modifying snapshot permissions, see [Sharing
  /// Snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> resetSnapshotAttribute(
      {@required String attribute,
      @required String snapshotId,
      bool dryRun}) async {}

  /// Restores an Elastic IP address that was previously moved to the EC2-VPC
  /// platform back to the EC2-Classic platform. You cannot move an Elastic IP
  /// address that was originally allocated for use in EC2-VPC. The Elastic IP
  /// address must not be associated with an instance or network interface.
  Future<void> restoreAddressToClassic(String publicIp, {bool dryRun}) async {}

  /// Removes an ingress authorization rule from a Client VPN endpoint.
  Future<void> revokeClientVpnIngress(
      {@required String clientVpnEndpointId,
      @required String targetNetworkCidr,
      String accessGroupId,
      bool revokeAllGroups,
      bool dryRun}) async {}

  /// \[VPC only\] Removes the specified egress rules from a security group for
  /// EC2-VPC. This action doesn't apply to security groups for use in
  /// EC2-Classic. To remove a rule, the values that you specify (for example,
  /// ports) must match the existing rule's values exactly.
  ///
  /// Each rule consists of the protocol and the IPv4 or IPv6 CIDR range or
  /// source security group. For the TCP and UDP protocols, you must also
  /// specify the destination port or range of ports. For the ICMP protocol, you
  /// must also specify the ICMP type and code. If the security group rule has a
  /// description, you do not have to specify the description to revoke the
  /// rule.
  ///
  /// Rule changes are propagated to instances within the security group as
  /// quickly as possible. However, a small delay might occur.
  Future<void> revokeSecurityGroupEgress(String groupId,
      {bool dryRun,
      List<IpPermission> ipPermissions,
      String cidrIp,
      int fromPort,
      String ipProtocol,
      int toPort,
      String sourceSecurityGroupName,
      String sourceSecurityGroupOwnerId}) async {}

  /// Removes the specified ingress rules from a security group. To remove a
  /// rule, the values that you specify (for example, ports) must match the
  /// existing rule's values exactly.
  ///
  ///  \[EC2-Classic only\] If the values you specify do not match the existing
  /// rule's values, no error is returned. Use DescribeSecurityGroups to verify
  /// that the rule has been removed.
  ///
  /// Each rule consists of the protocol and the CIDR range or source security
  /// group. For the TCP and UDP protocols, you must also specify the
  /// destination port or range of ports. For the ICMP protocol, you must also
  /// specify the ICMP type and code. If the security group rule has a
  /// description, you do not have to specify the description to revoke the
  /// rule.
  ///
  /// Rule changes are propagated to instances within the security group as
  /// quickly as possible. However, a small delay might occur.
  Future<void> revokeSecurityGroupIngress(
      {String cidrIp,
      int fromPort,
      String groupId,
      String groupName,
      List<IpPermission> ipPermissions,
      String ipProtocol,
      String sourceSecurityGroupName,
      String sourceSecurityGroupOwnerId,
      int toPort,
      bool dryRun}) async {}

  /// Launches the specified number of instances using an AMI for which you have
  /// permissions.
  ///
  /// You can specify a number of options, or leave the default options. The
  /// following rules apply:
  ///
  /// *   \[EC2-VPC\] If you don't specify a subnet ID, we choose a default
  /// subnet from your default VPC for you. If you don't have a default VPC, you
  /// must specify a subnet ID in the request.
  ///
  /// *   \[EC2-Classic\] If don't specify an Availability Zone, we choose one
  /// for you.
  ///
  /// *   Some instance types must be launched into a VPC. If you do not have a
  /// default VPC, or if you do not specify a subnet ID, the request fails. For
  /// more information, see [Instance Types Available Only in a
  /// VPC](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-vpc.html#vpc-only-instance-types).
  ///
  /// *   \[EC2-VPC\] All instances have a network interface with a primary
  /// private IPv4 address. If you don't specify this address, we choose one
  /// from the IPv4 range of your subnet.
  ///
  /// *   Not all instance types support IPv6 addresses. For more information,
  /// see [Instance
  /// Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html).
  ///
  /// *   If you don't specify a security group ID, we use the default security
  /// group. For more information, see [Security
  /// Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html).
  ///
  /// *   If any of the AMIs have a product code attached for which the user has
  /// not subscribed, the request fails.
  ///
  ///
  /// You can create a [launch
  /// template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-launch-templates.html),
  /// which is a resource that contains the parameters to launch an instance.
  /// When you launch an instance using RunInstances, you can specify the launch
  /// template instead of specifying the launch parameters.
  ///
  /// To ensure faster instance launches, break up large requests into smaller
  /// batches. For example, create five separate launch requests for 100
  /// instances each instead of one launch request for 500 instances.
  ///
  /// An instance is ready for you to use when it's in the `running` state. You
  /// can check the state of your instance using DescribeInstances. You can tag
  /// instances and EBS volumes during launch, after launch, or both. For more
  /// information, see CreateTags and [Tagging Your Amazon EC2
  /// Resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html).
  ///
  /// Linux instances have access to the public key of the key pair at boot. You
  /// can use this key to provide secure access to the instance. Amazon EC2
  /// public images use this feature to provide secure access without passwords.
  /// For more information, see [Key
  /// Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// For troubleshooting, see [What To Do If An Instance Immediately
  /// Terminates](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_InstanceStraightToTerminated.html),
  /// and [Troubleshooting Connecting to Your
  /// Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> runInstances(
      {List<BlockDeviceMapping> blockDeviceMappings,
      String imageId,
      String instanceType,
      int ipv6AddressCount,
      List<InstanceIpv6Address> ipv6Addresses,
      String kernelId,
      String keyName,
      @required int maxCount,
      @required int minCount,
      RunInstancesMonitoringEnabled monitoring,
      Placement placement,
      String ramdiskId,
      List<String> securityGroupIds,
      List<String> securityGroups,
      String subnetId,
      String userData,
      String additionalInfo,
      String clientToken,
      bool disableApiTermination,
      bool dryRun,
      bool ebsOptimized,
      IamInstanceProfileSpecification iamInstanceProfile,
      String instanceInitiatedShutdownBehavior,
      List<InstanceNetworkInterfaceSpecification> networkInterfaces,
      String privateIpAddress,
      List<ElasticGpuSpecification> elasticGpuSpecification,
      List<ElasticInferenceAccelerator> elasticInferenceAccelerators,
      List<TagSpecification> tagSpecifications,
      LaunchTemplateSpecification launchTemplate,
      InstanceMarketOptionsRequest instanceMarketOptions,
      CreditSpecificationRequest creditSpecification,
      CpuOptionsRequest cpuOptions,
      CapacityReservationSpecification capacityReservationSpecification,
      HibernationOptionsRequest hibernationOptions,
      List<LicenseConfigurationRequest> licenseSpecifications}) async {}

  /// Launches the specified Scheduled Instances.
  ///
  /// Before you can launch a Scheduled Instance, you must purchase it and
  /// obtain an identifier using PurchaseScheduledInstances.
  ///
  /// You must launch a Scheduled Instance during its scheduled time period. You
  /// can't stop or reboot a Scheduled Instance, but you can terminate it as
  /// needed. If you terminate a Scheduled Instance before the current scheduled
  /// time period ends, you can launch it again after a few minutes. For more
  /// information, see [Scheduled
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-scheduled-instances.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> runScheduledInstances(
      {String clientToken,
      bool dryRun,
      int instanceCount,
      @required ScheduledInstancesLaunchSpecification launchSpecification,
      @required String scheduledInstanceId}) async {}

  /// Searches for routes in the specified transit gateway route table.
  Future<void> searchTransitGatewayRoutes(
      {@required String transitGatewayRouteTableId,
      @required List<Filter> filters,
      int maxResults,
      bool dryRun}) async {}

  /// Sends a diagnostic interrupt to the specified Amazon EC2 instance to
  /// trigger a _kernel panic_ (on Linux instances), or a _blue screen_/_stop
  /// error_ (on Windows instances). For instances based on Intel and AMD
  /// processors, the interrupt is received as a _non-maskable interrupt_ (NMI).
  ///
  /// In general, the operating system crashes and reboots when a kernel panic
  /// or stop error is triggered. The operating system can also be configured to
  /// perform diagnostic tasks, such as generating a memory dump file, loading a
  /// secondary kernel, or obtaining a call trace.
  ///
  /// Before sending a diagnostic interrupt to your instance, ensure that its
  /// operating system is configured to perform the required diagnostic tasks.
  ///
  /// For more information about configuring your operating system to generate a
  /// crash dump when a kernel panic or stop error occurs, see [Send a
  /// Diagnostic
  /// Interrupt](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/diagnostic-interrupt.html)
  /// (Linux instances) or [Send a Diagnostic
  /// Interrupt](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/diagnostic-interrupt.html)
  /// (Windows instances).
  Future<void> sendDiagnosticInterrupt(String instanceId,
      {bool dryRun}) async {}

  /// Starts an Amazon EBS-backed instance that you've previously stopped.
  ///
  /// Instances that use Amazon EBS volumes as their root devices can be quickly
  /// stopped and started. When an instance is stopped, the compute resources
  /// are released and you are not billed for instance usage. However, your root
  /// partition Amazon EBS volume remains and continues to persist your data,
  /// and you are charged for Amazon EBS volume usage. You can restart your
  /// instance at any time. Every time you start your Windows instance, Amazon
  /// EC2 charges you for a full instance hour. If you stop and restart your
  /// Windows instance, a new instance hour begins and Amazon EC2 charges you
  /// for another full instance hour even if you are still within the same
  /// 60-minute period when it was stopped. Every time you start your Linux
  /// instance, Amazon EC2 charges a one-minute minimum for instance usage, and
  /// thereafter charges per second for instance usage.
  ///
  /// Before stopping an instance, make sure it is in a state from which it can
  /// be restarted. Stopping an instance does not preserve data stored in RAM.
  ///
  /// Performing this operation on an instance that uses an instance store as
  /// its root device returns an error.
  ///
  /// For more information, see [Stopping
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Stop_Start.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> startInstances(List<String> instanceIds,
      {String additionalInfo, bool dryRun}) async {}

  /// Stops an Amazon EBS-backed instance.
  ///
  /// You can use the Stop action to hibernate an instance if the instance is
  /// [enabled for
  /// hibernation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#enabling-hibernation)
  /// and it meets the [hibernation
  /// prerequisites](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html#hibernating-prerequisites).
  /// For more information, see [Hibernate Your
  /// Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// We don't charge usage for a stopped instance, or data transfer fees;
  /// however, your root partition Amazon EBS volume remains and continues to
  /// persist your data, and you are charged for Amazon EBS volume usage. Every
  /// time you start your Windows instance, Amazon EC2 charges you for a full
  /// instance hour. If you stop and restart your Windows instance, a new
  /// instance hour begins and Amazon EC2 charges you for another full instance
  /// hour even if you are still within the same 60-minute period when it was
  /// stopped. Every time you start your Linux instance, Amazon EC2 charges a
  /// one-minute minimum for instance usage, and thereafter charges per second
  /// for instance usage.
  ///
  /// You can't start, stop, or hibernate Spot Instances, and you can't stop or
  /// hibernate instance store-backed instances. For information about using
  /// hibernation for Spot Instances, see [Hibernating Interrupted Spot
  /// Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html#hibernate-spot-instances)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// When you stop or hibernate an instance, we shut it down. You can restart
  /// your instance at any time. Before stopping or hibernating an instance,
  /// make sure it is in a state from which it can be restarted. Stopping an
  /// instance does not preserve data stored in RAM, but hibernating an instance
  /// does preserve data stored in RAM. If an instance cannot hibernate
  /// successfully, a normal shutdown occurs.
  ///
  /// Stopping and hibernating an instance is different to rebooting or
  /// terminating it. For example, when you stop or hibernate an instance, the
  /// root device and any other devices attached to the instance persist. When
  /// you terminate an instance, the root device and any other devices attached
  /// during the instance launch are automatically deleted. For more information
  /// about the differences between rebooting, stopping, hibernating, and
  /// terminating instances, see [Instance
  /// Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// When you stop an instance, we attempt to shut it down forcibly after a
  /// short while. If your instance appears stuck in the stopping state after a
  /// period of time, there may be an issue with the underlying host computer.
  /// For more information, see [Troubleshooting Stopping Your
  /// Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesStopping.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> stopInstances(List<String> instanceIds,
      {bool hibernate, bool dryRun, bool force}) async {}

  /// Terminates active Client VPN endpoint connections. This action can be used
  /// to terminate a specific client connection, or up to five connections
  /// established by a specific user.
  Future<void> terminateClientVpnConnections(String clientVpnEndpointId,
      {String connectionId, String username, bool dryRun}) async {}

  /// Shuts down the specified instances. This operation is idempotent; if you
  /// terminate an instance more than once, each call succeeds.
  ///
  /// If you specify multiple instances and the request fails (for example,
  /// because of a single incorrect instance ID), none of the instances are
  /// terminated.
  ///
  /// Terminated instances remain visible after termination (for approximately
  /// one hour).
  ///
  /// By default, Amazon EC2 deletes all EBS volumes that were attached when the
  /// instance launched. Volumes attached after instance launch continue
  /// running.
  ///
  /// You can stop, start, and terminate EBS-backed instances. You can only
  /// terminate instance store-backed instances. What happens to an instance
  /// differs if you stop it or terminate it. For example, when you stop an
  /// instance, the root device and any other devices attached to the instance
  /// persist. When you terminate an instance, any attached EBS volumes with the
  /// `DeleteOnTermination` block device mapping parameter set to `true` are
  /// automatically deleted. For more information about the differences between
  /// stopping and terminating instances, see [Instance
  /// Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  ///
  /// For more information about troubleshooting, see [Troubleshooting
  /// Terminating Your
  /// Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesShuttingDown.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> terminateInstances(List<String> instanceIds,
      {bool dryRun}) async {}

  /// Unassigns one or more IPv6 addresses from a network interface.
  Future<void> unassignIpv6Addresses(
      {@required List<String> ipv6Addresses,
      @required String networkInterfaceId}) async {}

  /// Unassigns one or more secondary private IP addresses from a network
  /// interface.
  Future<void> unassignPrivateIpAddresses(
      {@required String networkInterfaceId,
      @required List<String> privateIpAddresses}) async {}

  /// Disables detailed monitoring for a running instance. For more information,
  /// see [Monitoring Your Instances and
  /// Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-cloudwatch.html)
  /// in the _Amazon Elastic Compute Cloud User Guide_.
  Future<void> unmonitorInstances(List<String> instanceIds,
      {bool dryRun}) async {}

  /// \[VPC only\] Updates the description of an egress (outbound) security
  /// group rule. You can replace an existing description, or add a description
  /// to a rule that did not have one previously.
  ///
  /// You specify the description as part of the IP permissions structure. You
  /// can remove a description for a security group rule by omitting the
  /// description parameter in the request.
  Future<void> updateSecurityGroupRuleDescriptionsEgress(
      List<IpPermission> ipPermissions,
      {bool dryRun,
      String groupId,
      String groupName}) async {}

  /// Updates the description of an ingress (inbound) security group rule. You
  /// can replace an existing description, or add a description to a rule that
  /// did not have one previously.
  ///
  /// You specify the description as part of the IP permissions structure. You
  /// can remove a description for a security group rule by omitting the
  /// description parameter in the request.
  Future<void> updateSecurityGroupRuleDescriptionsIngress(
      List<IpPermission> ipPermissions,
      {bool dryRun,
      String groupId,
      String groupName}) async {}

  /// Stops advertising an IPv4 address range that is provisioned as an address
  /// pool.
  ///
  /// You can perform this operation at most once every 10 seconds, even if you
  /// specify different address ranges each time.
  ///
  /// It can take a few minutes before traffic to the specified addresses stops
  /// routing to AWS because of BGP propagation delays.
  Future<void> withdrawByoipCidr(String cidr, {bool dryRun}) async {}
}

class AcceptReservedInstancesExchangeQuoteResult {}

class AcceptTransitGatewayVpcAttachmentResult {}

class AcceptVpcEndpointConnectionsResult {}

class AcceptVpcPeeringConnectionResult {}

class AccountAttribute {}

class AccountAttributeValue {}

class ActiveInstance {}

class Address {}

class AdvertiseByoipCidrResult {}

class AllocateAddressResult {}

class AllocateHostsResult {}

class AllowedPrincipal {}

class ApplySecurityGroupsToClientVpnTargetNetworkResult {}

class AssignIpv6AddressesResult {}

class AssignPrivateIpAddressesResult {}

class AssignedPrivateIpAddress {}

class AssociateAddressResult {}

class AssociateClientVpnTargetNetworkResult {}

class AssociateIamInstanceProfileResult {}

class AssociateRouteTableResult {}

class AssociateSubnetCidrBlockResult {}

class AssociateTransitGatewayRouteTableResult {}

class AssociateVpcCidrBlockResult {}

class AssociatedTargetNetwork {}

class AssociationStatus {}

class AttachClassicLinkVpcResult {}

class AttachNetworkInterfaceResult {}

class AttachVpnGatewayResult {}

class AttributeBooleanValue {}

class AttributeValue {}

class AuthorizationRule {}

class AuthorizeClientVpnIngressResult {}

class AvailabilityZone {}

class AvailabilityZoneMessage {}

class AvailableCapacity {}

class BlobAttributeValue {}

class BlockDeviceMapping {}

class BundleInstanceResult {}

class BundleTask {}

class BundleTaskError {}

class ByoipCidr {}

class CancelBundleTaskResult {}

class CancelCapacityReservationResult {}

class CancelImportTaskResult {}

class CancelReservedInstancesListingResult {}

class CancelSpotFleetRequestsError {}

class CancelSpotFleetRequestsErrorItem {}

class CancelSpotFleetRequestsResponse {}

class CancelSpotFleetRequestsSuccessItem {}

class CancelSpotInstanceRequestsResult {}

class CancelledSpotInstanceRequest {}

class CapacityReservation {}

class CapacityReservationSpecification {}

class CapacityReservationSpecificationResponse {}

class CapacityReservationTarget {}

class CapacityReservationTargetResponse {}

class CertificateAuthentication {}

class CertificateAuthenticationRequest {}

class CidrAuthorizationContext {}

class CidrBlock {}

class ClassicLinkDnsSupport {}

class ClassicLinkInstance {}

class ClassicLoadBalancer {}

class ClassicLoadBalancersConfig {}

class ClientCertificateRevocationListStatus {}

class ClientData {}

class ClientVpnAuthentication {}

class ClientVpnAuthenticationRequest {}

class ClientVpnAuthorizationRuleStatus {}

class ClientVpnConnection {}

class ClientVpnConnectionStatus {}

class ClientVpnEndpoint {}

class ClientVpnEndpointStatus {}

class ClientVpnRoute {}

class ClientVpnRouteStatus {}

class ConfirmProductInstanceResult {}

class ConnectionLogOptions {}

class ConnectionLogResponseOptions {}

class ConnectionNotification {}

class ConversionTask {}

class CopyFpgaImageResult {}

class CopyImageResult {}

class CopySnapshotResult {}

class CpuOptions {}

class CpuOptionsRequest {}

class CreateCapacityReservationResult {}

class CreateClientVpnEndpointResult {}

class CreateClientVpnRouteResult {}

class CreateCustomerGatewayResult {}

class CreateDefaultSubnetResult {}

class CreateDefaultVpcResult {}

class CreateDhcpOptionsResult {}

class CreateEgressOnlyInternetGatewayResult {}

class CreateFleetError {}

class CreateFleetInstance {}

class CreateFleetResult {}

class CreateFlowLogsResult {}

class CreateFpgaImageResult {}

class CreateImageResult {}

class CreateInstanceExportTaskResult {}

class CreateInternetGatewayResult {}

class CreateLaunchTemplateResult {}

class CreateLaunchTemplateVersionResult {}

class CreateNatGatewayResult {}

class CreateNetworkAclResult {}

class CreateNetworkInterfacePermissionResult {}

class CreateNetworkInterfaceResult {}

class CreateReservedInstancesListingResult {}

class CreateRouteResult {}

class CreateRouteTableResult {}

class CreateSecurityGroupResult {}

class CreateSnapshotsResult {}

class CreateSpotDatafeedSubscriptionResult {}

class CreateSubnetResult {}

class CreateTrafficMirrorFilterResult {}

class CreateTrafficMirrorFilterRuleResult {}

class CreateTrafficMirrorSessionResult {}

class CreateTrafficMirrorTargetResult {}

class CreateTransitGatewayResult {}

class CreateTransitGatewayRouteResult {}

class CreateTransitGatewayRouteTableResult {}

class CreateTransitGatewayVpcAttachmentRequestOptions {}

class CreateTransitGatewayVpcAttachmentResult {}

class CreateVolumePermission {}

class CreateVolumePermissionModifications {}

class CreateVpcEndpointConnectionNotificationResult {}

class CreateVpcEndpointResult {}

class CreateVpcEndpointServiceConfigurationResult {}

class CreateVpcPeeringConnectionResult {}

class CreateVpcResult {}

class CreateVpnConnectionResult {}

class CreateVpnGatewayResult {}

class CreditSpecification {}

class CreditSpecificationRequest {}

class CustomerGateway {}

class DeleteClientVpnEndpointResult {}

class DeleteClientVpnRouteResult {}

class DeleteEgressOnlyInternetGatewayResult {}

class DeleteFleetError {}

class DeleteFleetErrorItem {}

class DeleteFleetSuccessItem {}

class DeleteFleetsResult {}

class DeleteFlowLogsResult {}

class DeleteFpgaImageResult {}

class DeleteLaunchTemplateResult {}

class DeleteLaunchTemplateVersionsResponseErrorItem {}

class DeleteLaunchTemplateVersionsResponseSuccessItem {}

class DeleteLaunchTemplateVersionsResult {}

class DeleteNatGatewayResult {}

class DeleteNetworkInterfacePermissionResult {}

class DeleteTrafficMirrorFilterResult {}

class DeleteTrafficMirrorFilterRuleResult {}

class DeleteTrafficMirrorSessionResult {}

class DeleteTrafficMirrorTargetResult {}

class DeleteTransitGatewayResult {}

class DeleteTransitGatewayRouteResult {}

class DeleteTransitGatewayRouteTableResult {}

class DeleteTransitGatewayVpcAttachmentResult {}

class DeleteVpcEndpointConnectionNotificationsResult {}

class DeleteVpcEndpointServiceConfigurationsResult {}

class DeleteVpcEndpointsResult {}

class DeleteVpcPeeringConnectionResult {}

class DeprovisionByoipCidrResult {}

class DescribeAccountAttributesResult {}

class DescribeAddressesResult {}

class DescribeAggregateIdFormatResult {}

class DescribeAvailabilityZonesResult {}

class DescribeBundleTasksResult {}

class DescribeByoipCidrsResult {}

class DescribeCapacityReservationsResult {}

class DescribeClassicLinkInstancesResult {}

class DescribeClientVpnAuthorizationRulesResult {}

class DescribeClientVpnConnectionsResult {}

class DescribeClientVpnEndpointsResult {}

class DescribeClientVpnRoutesResult {}

class DescribeClientVpnTargetNetworksResult {}

class DescribeConversionTasksResult {}

class DescribeCustomerGatewaysResult {}

class DescribeDhcpOptionsResult {}

class DescribeEgressOnlyInternetGatewaysResult {}

class DescribeElasticGpusResult {}

class DescribeExportImageTasksResult {}

class DescribeExportTasksResult {}

class DescribeFleetError {}

class DescribeFleetHistoryResult {}

class DescribeFleetInstancesResult {}

class DescribeFleetsInstances {}

class DescribeFleetsResult {}

class DescribeFlowLogsResult {}

class DescribeFpgaImageAttributeResult {}

class DescribeFpgaImagesResult {}

class DescribeHostReservationOfferingsResult {}

class DescribeHostReservationsResult {}

class DescribeHostsResult {}

class DescribeIamInstanceProfileAssociationsResult {}

class DescribeIdFormatResult {}

class DescribeIdentityIdFormatResult {}

class DescribeImagesResult {}

class DescribeImportImageTasksResult {}

class DescribeImportSnapshotTasksResult {}

class DescribeInstanceCreditSpecificationsResult {}

class DescribeInstanceStatusResult {}

class DescribeInstancesResult {}

class DescribeInternetGatewaysResult {}

class DescribeKeyPairsResult {}

class DescribeLaunchTemplateVersionsResult {}

class DescribeLaunchTemplatesResult {}

class DescribeMovingAddressesResult {}

class DescribeNatGatewaysResult {}

class DescribeNetworkAclsResult {}

class DescribeNetworkInterfaceAttributeResult {}

class DescribeNetworkInterfacePermissionsResult {}

class DescribeNetworkInterfacesResult {}

class DescribePlacementGroupsResult {}

class DescribePrefixListsResult {}

class DescribePrincipalIdFormatResult {}

class DescribePublicIpv4PoolsResult {}

class DescribeRegionsResult {}

class DescribeReservedInstancesListingsResult {}

class DescribeReservedInstancesModificationsResult {}

class DescribeReservedInstancesOfferingsResult {}

class DescribeReservedInstancesResult {}

class DescribeRouteTablesResult {}

class DescribeScheduledInstanceAvailabilityResult {}

class DescribeScheduledInstancesResult {}

class DescribeSecurityGroupReferencesResult {}

class DescribeSecurityGroupsResult {}

class DescribeSnapshotAttributeResult {}

class DescribeSnapshotsResult {}

class DescribeSpotDatafeedSubscriptionResult {}

class DescribeSpotFleetInstancesResponse {}

class DescribeSpotFleetRequestHistoryResponse {}

class DescribeSpotFleetRequestsResponse {}

class DescribeSpotInstanceRequestsResult {}

class DescribeSpotPriceHistoryResult {}

class DescribeStaleSecurityGroupsResult {}

class DescribeSubnetsResult {}

class DescribeTagsResult {}

class DescribeTrafficMirrorFiltersResult {}

class DescribeTrafficMirrorSessionsResult {}

class DescribeTrafficMirrorTargetsResult {}

class DescribeTransitGatewayAttachmentsResult {}

class DescribeTransitGatewayRouteTablesResult {}

class DescribeTransitGatewayVpcAttachmentsResult {}

class DescribeTransitGatewaysResult {}

class DescribeVolumeAttributeResult {}

class DescribeVolumeStatusResult {}

class DescribeVolumesModificationsResult {}

class DescribeVolumesResult {}

class DescribeVpcAttributeResult {}

class DescribeVpcClassicLinkDnsSupportResult {}

class DescribeVpcClassicLinkResult {}

class DescribeVpcEndpointConnectionNotificationsResult {}

class DescribeVpcEndpointConnectionsResult {}

class DescribeVpcEndpointServiceConfigurationsResult {}

class DescribeVpcEndpointServicePermissionsResult {}

class DescribeVpcEndpointServicesResult {}

class DescribeVpcEndpointsResult {}

class DescribeVpcPeeringConnectionsResult {}

class DescribeVpcsResult {}

class DescribeVpnConnectionsResult {}

class DescribeVpnGatewaysResult {}

class DetachClassicLinkVpcResult {}

class DhcpConfiguration {}

class DhcpOptions {}

class DirectoryServiceAuthentication {}

class DirectoryServiceAuthenticationRequest {}

class DisableEbsEncryptionByDefaultResult {}

class DisableTransitGatewayRouteTablePropagationResult {}

class DisableVpcClassicLinkDnsSupportResult {}

class DisableVpcClassicLinkResult {}

class DisassociateClientVpnTargetNetworkResult {}

class DisassociateIamInstanceProfileResult {}

class DisassociateSubnetCidrBlockResult {}

class DisassociateTransitGatewayRouteTableResult {}

class DisassociateVpcCidrBlockResult {}

class DiskImage {}

class DiskImageDescription {}

class DiskImageDetail {}

class DiskImageVolumeDescription {}

class DnsEntry {}

class DnsServersOptionsModifyStructure {}

class EbsBlockDevice {}

class EbsInstanceBlockDevice {}

class EbsInstanceBlockDeviceSpecification {}

class EgressOnlyInternetGateway {}

class ElasticGpuAssociation {}

class ElasticGpuHealth {}

class ElasticGpuSpecification {}

class ElasticGpuSpecificationResponse {}

class ElasticGpus {}

class ElasticInferenceAccelerator {}

class ElasticInferenceAcceleratorAssociation {}

class EnableEbsEncryptionByDefaultResult {}

class EnableTransitGatewayRouteTablePropagationResult {}

class EnableVpcClassicLinkDnsSupportResult {}

class EnableVpcClassicLinkResult {}

class EventInformation {}

class ExportClientVpnClientCertificateRevocationListResult {}

class ExportClientVpnClientConfigurationResult {}

class ExportImageResult {}

class ExportImageTask {}

class ExportTask {}

class ExportTaskS3Location {}

class ExportTaskS3LocationRequest {}

class ExportToS3Task {}

class ExportToS3TaskSpecification {}

class ExportTransitGatewayRoutesResult {}

class Filter {}

class FleetData {}

class FleetLaunchTemplateConfig {}

class FleetLaunchTemplateConfigRequest {}

class FleetLaunchTemplateOverrides {}

class FleetLaunchTemplateOverridesRequest {}

class FleetLaunchTemplateSpecification {}

class FleetLaunchTemplateSpecificationRequest {}

class FlowLog {}

class FpgaImage {}

class FpgaImageAttribute {}

class FpgaImageState {}

class GetCapacityReservationUsageResult {}

class GetConsoleOutputResult {}

class GetConsoleScreenshotResult {}

class GetEbsDefaultKmsKeyIdResult {}

class GetEbsEncryptionByDefaultResult {}

class GetHostReservationPurchasePreviewResult {}

class GetLaunchTemplateDataResult {}

class GetPasswordDataResult {}

class GetReservedInstancesExchangeQuoteResult {}

class GetTransitGatewayAttachmentPropagationsResult {}

class GetTransitGatewayRouteTableAssociationsResult {}

class GetTransitGatewayRouteTablePropagationsResult {}

class GroupIdentifier {}

class HibernationOptions {}

class HibernationOptionsRequest {}

class HistoryRecord {}

class HistoryRecordEntry {}

class Host {}

class HostInstance {}

class HostOffering {}

class HostProperties {}

class HostReservation {}

class IkeVersionsListValue {}

class IkeVersionsRequestListValue {}

class IamInstanceProfile {}

class IamInstanceProfileAssociation {}

class IamInstanceProfileSpecification {}

class IcmpTypeCode {}

class IdFormat {}

class Image {}

class ImageAttribute {}

class ImageDiskContainer {}

class ImportClientVpnClientCertificateRevocationListResult {}

class ImportImageResult {}

class ImportImageTask {}

class ImportInstanceLaunchSpecification {}

class ImportInstanceResult {}

class ImportInstanceTaskDetails {}

class ImportInstanceVolumeDetailItem {}

class ImportKeyPairResult {}

class ImportSnapshotResult {}

class ImportSnapshotTask {}

class ImportVolumeResult {}

class ImportVolumeTaskDetails {}

class Instance {}

class InstanceAttribute {}

class InstanceBlockDeviceMapping {}

class InstanceBlockDeviceMappingSpecification {}

class InstanceCapacity {}

class InstanceCount {}

class InstanceCreditSpecification {}

class InstanceCreditSpecificationRequest {}

class InstanceExportDetails {}

class InstanceIpv6Address {}

class InstanceIpv6AddressRequest {}

class InstanceMarketOptionsRequest {}

class InstanceMonitoring {}

class InstanceNetworkInterface {}

class InstanceNetworkInterfaceAssociation {}

class InstanceNetworkInterfaceAttachment {}

class InstanceNetworkInterfaceSpecification {}

class InstancePrivateIpAddress {}

class InstanceSpecification {}

class InstanceState {}

class InstanceStateChange {}

class InstanceStatus {}

class InstanceStatusDetails {}

class InstanceStatusEvent {}

class InstanceStatusSummary {}

class InstanceUsage {}

class InternetGateway {}

class InternetGatewayAttachment {}

class IpPermission {}

class IpRange {}

class Ipv6CidrBlock {}

class Ipv6Range {}

class KeyPair {}

class KeyPairInfo {}

class LaunchPermission {}

class LaunchPermissionModifications {}

class LaunchSpecification {}

class LaunchTemplate {}

class LaunchTemplateAndOverridesResponse {}

class LaunchTemplateBlockDeviceMapping {}

class LaunchTemplateBlockDeviceMappingRequest {}

class LaunchTemplateCapacityReservationSpecificationRequest {}

class LaunchTemplateCapacityReservationSpecificationResponse {}

class LaunchTemplateConfig {}

class LaunchTemplateCpuOptions {}

class LaunchTemplateCpuOptionsRequest {}

class LaunchTemplateEbsBlockDevice {}

class LaunchTemplateEbsBlockDeviceRequest {}

class LaunchTemplateElasticInferenceAccelerator {}

class LaunchTemplateElasticInferenceAcceleratorResponse {}

class LaunchTemplateHibernationOptions {}

class LaunchTemplateHibernationOptionsRequest {}

class LaunchTemplateIamInstanceProfileSpecification {}

class LaunchTemplateIamInstanceProfileSpecificationRequest {}

class LaunchTemplateInstanceMarketOptions {}

class LaunchTemplateInstanceMarketOptionsRequest {}

class LaunchTemplateInstanceNetworkInterfaceSpecification {}

class LaunchTemplateInstanceNetworkInterfaceSpecificationRequest {}

class LaunchTemplateLicenseConfiguration {}

class LaunchTemplateLicenseConfigurationRequest {}

class LaunchTemplateOverrides {}

class LaunchTemplatePlacement {}

class LaunchTemplatePlacementRequest {}

class LaunchTemplateSpecification {}

class LaunchTemplateSpotMarketOptions {}

class LaunchTemplateSpotMarketOptionsRequest {}

class LaunchTemplateTagSpecification {}

class LaunchTemplateTagSpecificationRequest {}

class LaunchTemplateVersion {}

class LaunchTemplatesMonitoring {}

class LaunchTemplatesMonitoringRequest {}

class LicenseConfiguration {}

class LicenseConfigurationRequest {}

class LoadBalancersConfig {}

class LoadPermission {}

class LoadPermissionModifications {}

class LoadPermissionRequest {}

class ModifyCapacityReservationResult {}

class ModifyClientVpnEndpointResult {}

class ModifyEbsDefaultKmsKeyIdResult {}

class ModifyFleetResult {}

class ModifyFpgaImageAttributeResult {}

class ModifyHostsResult {}

class ModifyInstanceCapacityReservationAttributesResult {}

class ModifyInstanceCreditSpecificationResult {}

class ModifyInstanceEventStartTimeResult {}

class ModifyInstancePlacementResult {}

class ModifyLaunchTemplateResult {}

class ModifyReservedInstancesResult {}

class ModifySpotFleetRequestResponse {}

class ModifyTrafficMirrorFilterNetworkServicesResult {}

class ModifyTrafficMirrorFilterRuleResult {}

class ModifyTrafficMirrorSessionResult {}

class ModifyTransitGatewayVpcAttachmentRequestOptions {}

class ModifyTransitGatewayVpcAttachmentResult {}

class ModifyVolumeResult {}

class ModifyVpcEndpointConnectionNotificationResult {}

class ModifyVpcEndpointResult {}

class ModifyVpcEndpointServiceConfigurationResult {}

class ModifyVpcEndpointServicePermissionsResult {}

class ModifyVpcPeeringConnectionOptionsResult {}

class ModifyVpcTenancyResult {}

class ModifyVpnConnectionResult {}

class ModifyVpnTunnelCertificateResult {}

class ModifyVpnTunnelOptionsResult {}

class ModifyVpnTunnelOptionsSpecification {}

class MonitorInstancesResult {}

class Monitoring {}

class MoveAddressToVpcResult {}

class MovingAddressStatus {}

class NatGateway {}

class NatGatewayAddress {}

class NetworkAcl {}

class NetworkAclAssociation {}

class NetworkAclEntry {}

class NetworkInterface {}

class NetworkInterfaceAssociation {}

class NetworkInterfaceAttachment {}

class NetworkInterfaceAttachmentChanges {}

class NetworkInterfaceIpv6Address {}

class NetworkInterfacePermission {}

class NetworkInterfacePermissionState {}

class NetworkInterfacePrivateIpAddress {}

class NewDhcpConfiguration {}

class OnDemandOptions {}

class OnDemandOptionsRequest {}

class PciId {}

class PeeringConnectionOptions {}

class PeeringConnectionOptionsRequest {}

class Phase1dhGroupNumbersListValue {}

class Phase1dhGroupNumbersRequestListValue {}

class Phase1EncryptionAlgorithmsListValue {}

class Phase1EncryptionAlgorithmsRequestListValue {}

class Phase1IntegrityAlgorithmsListValue {}

class Phase1IntegrityAlgorithmsRequestListValue {}

class Phase2dhGroupNumbersListValue {}

class Phase2dhGroupNumbersRequestListValue {}

class Phase2EncryptionAlgorithmsListValue {}

class Phase2EncryptionAlgorithmsRequestListValue {}

class Phase2IntegrityAlgorithmsListValue {}

class Phase2IntegrityAlgorithmsRequestListValue {}

class Placement {}

class PlacementGroup {}

class PlacementResponse {}

class PortRange {}

class PrefixList {}

class PrefixListId {}

class PriceSchedule {}

class PriceScheduleSpecification {}

class PricingDetail {}

class PrincipalIdFormat {}

class PrivateIpAddressSpecification {}

class ProductCode {}

class PropagatingVgw {}

class ProvisionByoipCidrResult {}

class ProvisionedBandwidth {}

class PublicIpv4Pool {}

class PublicIpv4PoolRange {}

class Purchase {}

class PurchaseHostReservationResult {}

class PurchaseRequest {}

class PurchaseReservedInstancesOfferingResult {}

class PurchaseScheduledInstancesResult {}

class RecurringCharge {}

class Region {}

class RegisterImageResult {}

class RejectTransitGatewayVpcAttachmentResult {}

class RejectVpcEndpointConnectionsResult {}

class RejectVpcPeeringConnectionResult {}

class ReleaseHostsResult {}

class ReplaceIamInstanceProfileAssociationResult {}

class ReplaceNetworkAclAssociationResult {}

class ReplaceRouteTableAssociationResult {}

class ReplaceTransitGatewayRouteResult {}

class RequestLaunchTemplateData {}

class RequestSpotFleetResponse {}

class RequestSpotInstancesResult {}

class RequestSpotLaunchSpecification {}

class Reservation {}

class ReservationValue {}

class ReservedInstanceLimitPrice {}

class ReservedInstanceReservationValue {}

class ReservedInstances {}

class ReservedInstancesConfiguration {}

class ReservedInstancesId {}

class ReservedInstancesListing {}

class ReservedInstancesModification {}

class ReservedInstancesModificationResult {}

class ReservedInstancesOffering {}

class ResetEbsDefaultKmsKeyIdResult {}

class ResetFpgaImageAttributeResult {}

class ResponseError {}

class ResponseLaunchTemplateData {}

class RestoreAddressToClassicResult {}

class RevokeClientVpnIngressResult {}

class Route {}

class RouteTable {}

class RouteTableAssociation {}

class RunInstancesMonitoringEnabled {}

class RunScheduledInstancesResult {}

class S3Storage {}

class ScheduledInstance {}

class ScheduledInstanceAvailability {}

class ScheduledInstanceRecurrence {}

class ScheduledInstanceRecurrenceRequest {}

class ScheduledInstancesBlockDeviceMapping {}

class ScheduledInstancesEbs {}

class ScheduledInstancesIamInstanceProfile {}

class ScheduledInstancesIpv6Address {}

class ScheduledInstancesLaunchSpecification {}

class ScheduledInstancesMonitoring {}

class ScheduledInstancesNetworkInterface {}

class ScheduledInstancesPlacement {}

class ScheduledInstancesPrivateIpAddressConfig {}

class SearchTransitGatewayRoutesResult {}

class SecurityGroup {}

class SecurityGroupIdentifier {}

class SecurityGroupReference {}

class ServiceConfiguration {}

class ServiceDetail {}

class ServiceTypeDetail {}

class SlotDateTimeRangeRequest {}

class SlotStartTimeRangeRequest {}

class Snapshot {}

class SnapshotDetail {}

class SnapshotDiskContainer {}

class SnapshotInfo {}

class SnapshotTaskDetail {}

class SpotDatafeedSubscription {}

class SpotFleetLaunchSpecification {}

class SpotFleetMonitoring {}

class SpotFleetRequestConfig {}

class SpotFleetRequestConfigData {}

class SpotFleetTagSpecification {}

class SpotInstanceRequest {}

class SpotInstanceStateFault {}

class SpotInstanceStatus {}

class SpotMarketOptions {}

class SpotOptions {}

class SpotOptionsRequest {}

class SpotPlacement {}

class SpotPrice {}

class StaleIpPermission {}

class StaleSecurityGroup {}

class StartInstancesResult {}

class StateReason {}

class StopInstancesResult {}

class Storage {}

class StorageLocation {}

class Subnet {}

class SubnetCidrBlockState {}

class SubnetIpv6CidrBlockAssociation {}

class SuccessfulInstanceCreditSpecificationItem {}

class Tag {}

class TagDescription {}

class TagSpecification {}

class TargetCapacitySpecification {}

class TargetCapacitySpecificationRequest {}

class TargetConfiguration {}

class TargetConfigurationRequest {}

class TargetGroup {}

class TargetGroupsConfig {}

class TargetNetwork {}

class TargetReservationValue {}

class TerminateClientVpnConnectionsResult {}

class TerminateConnectionStatus {}

class TerminateInstancesResult {}

class TrafficMirrorFilter {}

class TrafficMirrorFilterRule {}

class TrafficMirrorPortRange {}

class TrafficMirrorPortRangeRequest {}

class TrafficMirrorSession {}

class TrafficMirrorTarget {}

class TransitGateway {}

class TransitGatewayAssociation {}

class TransitGatewayAttachment {}

class TransitGatewayAttachmentAssociation {}

class TransitGatewayAttachmentPropagation {}

class TransitGatewayOptions {}

class TransitGatewayPropagation {}

class TransitGatewayRequestOptions {}

class TransitGatewayRoute {}

class TransitGatewayRouteAttachment {}

class TransitGatewayRouteTable {}

class TransitGatewayRouteTableAssociation {}

class TransitGatewayRouteTablePropagation {}

class TransitGatewayVpcAttachment {}

class TransitGatewayVpcAttachmentOptions {}

class TunnelOption {}

class UnassignIpv6AddressesResult {}

class UnmonitorInstancesResult {}

class UnsuccessfulInstanceCreditSpecificationItem {}

class UnsuccessfulInstanceCreditSpecificationItemError {}

class UnsuccessfulItem {}

class UnsuccessfulItemError {}

class UpdateSecurityGroupRuleDescriptionsEgressResult {}

class UpdateSecurityGroupRuleDescriptionsIngressResult {}

class UserBucket {}

class UserBucketDetails {}

class UserData {}

class UserIdGroupPair {}

class VgwTelemetry {}

class Volume {}

class VolumeAttachment {}

class VolumeDetail {}

class VolumeModification {}

class VolumeStatusAction {}

class VolumeStatusDetails {}

class VolumeStatusEvent {}

class VolumeStatusInfo {}

class VolumeStatusItem {}

class Vpc {}

class VpcAttachment {}

class VpcCidrBlockAssociation {}

class VpcCidrBlockState {}

class VpcClassicLink {}

class VpcEndpoint {}

class VpcEndpointConnection {}

class VpcIpv6CidrBlockAssociation {}

class VpcPeeringConnection {}

class VpcPeeringConnectionOptionsDescription {}

class VpcPeeringConnectionStateReason {}

class VpcPeeringConnectionVpcInfo {}

class VpnConnection {}

class VpnConnectionOptions {}

class VpnConnectionOptionsSpecification {}

class VpnGateway {}

class VpnStaticRoute {}

class VpnTunnelOptionsSpecification {}

class WithdrawByoipCidrResult {}
