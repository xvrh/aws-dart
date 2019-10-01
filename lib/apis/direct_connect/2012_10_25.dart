import 'package:meta/meta.dart';
import 'dart:typed_data';

/// AWS Direct Connect links your internal network to an AWS Direct Connect
/// location over a standard Ethernet fiber-optic cable. One end of the cable is
/// connected to your router, the other to an AWS Direct Connect router. With
/// this connection in place, you can create virtual interfaces directly to the
/// AWS cloud (for example, to Amazon EC2 and Amazon S3) and to Amazon VPC,
/// bypassing Internet service providers in your network path. A connection
/// provides access to all AWS Regions except the China (Beijing) and (China)
/// Ningxia Regions. AWS resources in the China Regions can only be accessed
/// through locations associated with those Regions.
class DirectConnectApi {
  /// Accepts a proposal request to attach a virtual private gateway or transit
  /// gateway to a Direct Connect gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [proposalId]: The ID of the request proposal.
  ///
  /// [associatedGatewayOwnerAccount]: The ID of the AWS account that owns the
  /// virtual private gateway or transit gateway.
  ///
  /// [overrideAllowedPrefixesToDirectConnectGateway]: Overrides the Amazon VPC
  /// prefixes advertised to the Direct Connect gateway.
  ///
  /// For information about how to set the prefixes, see
  /// [Allowed Prefixes](https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes)
  /// in the _AWS Direct Connect User Guide_.
  Future<AcceptDirectConnectGatewayAssociationProposalResult>
      acceptDirectConnectGatewayAssociationProposal(
          {@required String directConnectGatewayId,
          @required String proposalId,
          @required String associatedGatewayOwnerAccount,
          List<RouteFilterPrefix>
              overrideAllowedPrefixesToDirectConnectGateway}) async {
    return AcceptDirectConnectGatewayAssociationProposalResult.fromJson({});
  }

  /// Deprecated. Use AllocateHostedConnection instead.
  ///
  /// Creates a hosted connection on an interconnect.
  ///
  /// Allocates a VLAN number and a specified amount of bandwidth for use by a
  /// hosted connection on the specified interconnect.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [bandwidth]: The bandwidth of the connection. The possible values are
  /// 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps,
  /// and 10Gbps. Note that only those AWS Direct Connect Partners who have met
  /// specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or
  /// 10Gbps hosted connection.
  ///
  /// [connectionName]: The name of the provisioned connection.
  ///
  /// [ownerAccount]: The ID of the AWS account of the customer for whom the
  /// connection will be provisioned.
  ///
  /// [interconnectId]: The ID of the interconnect on which the connection will
  /// be provisioned.
  ///
  /// [vlan]: The dedicated VLAN provisioned to the connection.
  Future<Connection> allocateConnectionOnInterconnect(
      {@required String bandwidth,
      @required String connectionName,
      @required String ownerAccount,
      @required String interconnectId,
      @required int vlan}) async {
    return Connection.fromJson({});
  }

  /// Creates a hosted connection on the specified interconnect or a link
  /// aggregation group (LAG) of interconnects.
  ///
  /// Allocates a VLAN number and a specified amount of capacity (bandwidth) for
  /// use by a hosted connection on the specified interconnect or LAG of
  /// interconnects. AWS polices the hosted connection for the specified
  /// capacity and the AWS Direct Connect Partner must also police the hosted
  /// connection for the specified capacity.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [connectionId]: The ID of the interconnect or LAG.
  ///
  /// [ownerAccount]: The ID of the AWS account ID of the customer for the
  /// connection.
  ///
  /// [bandwidth]: The bandwidth of the connection. The possible values are
  /// 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps,
  /// and 10Gbps. Note that only those AWS Direct Connect Partners who have met
  /// specific requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or
  /// 10Gbps hosted connection.
  ///
  /// [connectionName]: The name of the hosted connection.
  ///
  /// [vlan]: The dedicated VLAN provisioned to the hosted connection.
  ///
  /// [tags]: The tags to assign to the hosted connection.
  Future<Connection> allocateHostedConnection(
      {@required String connectionId,
      @required String ownerAccount,
      @required String bandwidth,
      @required String connectionName,
      @required int vlan,
      List<Tag> tags}) async {
    return Connection.fromJson({});
  }

  /// Provisions a private virtual interface to be owned by the specified AWS
  /// account.
  ///
  /// Virtual interfaces created using this action must be confirmed by the
  /// owner using ConfirmPrivateVirtualInterface. Until then, the virtual
  /// interface is in the `Confirming` state and is not available to handle
  /// traffic.
  ///
  /// [connectionId]: The ID of the connection on which the private virtual
  /// interface is provisioned.
  ///
  /// [ownerAccount]: The ID of the AWS account that owns the virtual private
  /// interface.
  ///
  /// [newPrivateVirtualInterfaceAllocation]: Information about the private
  /// virtual interface.
  Future<VirtualInterface> allocatePrivateVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewPrivateVirtualInterfaceAllocation
              newPrivateVirtualInterfaceAllocation}) async {
    return VirtualInterface.fromJson({});
  }

  /// Provisions a public virtual interface to be owned by the specified AWS
  /// account.
  ///
  /// The owner of a connection calls this function to provision a public
  /// virtual interface to be owned by the specified AWS account.
  ///
  /// Virtual interfaces created using this function must be confirmed by the
  /// owner using ConfirmPublicVirtualInterface. Until this step has been
  /// completed, the virtual interface is in the `confirming` state and is not
  /// available to handle traffic.
  ///
  /// When creating an IPv6 public virtual interface, omit the Amazon address
  /// and customer address. IPv6 addresses are automatically assigned from the
  /// Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.
  ///
  /// [connectionId]: The ID of the connection on which the public virtual
  /// interface is provisioned.
  ///
  /// [ownerAccount]: The ID of the AWS account that owns the public virtual
  /// interface.
  ///
  /// [newPublicVirtualInterfaceAllocation]: Information about the public
  /// virtual interface.
  Future<VirtualInterface> allocatePublicVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewPublicVirtualInterfaceAllocation
              newPublicVirtualInterfaceAllocation}) async {
    return VirtualInterface.fromJson({});
  }

  /// Provisions a transit virtual interface to be owned by the specified AWS
  /// account. Use this type of interface to connect a transit gateway to your
  /// Direct Connect gateway.
  ///
  /// The owner of a connection provisions a transit virtual interface to be
  /// owned by the specified AWS account.
  ///
  /// After you create a transit virtual interface, it must be confirmed by the
  /// owner using ConfirmTransitVirtualInterface. Until this step has been
  /// completed, the transit virtual interface is in the `requested` state and
  /// is not available to handle traffic.
  ///
  /// [connectionId]: The ID of the connection on which the transit virtual
  /// interface is provisioned.
  ///
  /// [ownerAccount]: The ID of the AWS account that owns the transit virtual
  /// interface.
  ///
  /// [newTransitVirtualInterfaceAllocation]: Information about the transit
  /// virtual interface.
  Future<AllocateTransitVirtualInterfaceResult> allocateTransitVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewTransitVirtualInterfaceAllocation
              newTransitVirtualInterfaceAllocation}) async {
    return AllocateTransitVirtualInterfaceResult.fromJson({});
  }

  /// Associates an existing connection with a link aggregation group (LAG). The
  /// connection is interrupted and re-established as a member of the LAG
  /// (connectivity to AWS is interrupted). The connection must be hosted on the
  /// same AWS Direct Connect endpoint as the LAG, and its bandwidth must match
  /// the bandwidth for the LAG. You can re-associate a connection that's
  /// currently associated with a different LAG; however, if removing the
  /// connection would cause the original LAG to fall below its setting for
  /// minimum number of operational connections, the request fails.
  ///
  /// Any virtual interfaces that are directly associated with the connection
  /// are automatically re-associated with the LAG. If the connection was
  /// originally associated with a different LAG, the virtual interfaces remain
  /// associated with the original LAG.
  ///
  /// For interconnects, any hosted connections are automatically re-associated
  /// with the LAG. If the interconnect was originally associated with a
  /// different LAG, the hosted connections remain associated with the original
  /// LAG.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [lagId]: The ID of the LAG with which to associate the connection.
  Future<Connection> associateConnectionWithLag(
      {@required String connectionId, @required String lagId}) async {
    return Connection.fromJson({});
  }

  /// Associates a hosted connection and its virtual interfaces with a link
  /// aggregation group (LAG) or interconnect. If the target interconnect or LAG
  /// has an existing hosted connection with a conflicting VLAN number or IP
  /// address, the operation fails. This action temporarily interrupts the
  /// hosted connection's connectivity to AWS as it is being migrated.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [connectionId]: The ID of the hosted connection.
  ///
  /// [parentConnectionId]: The ID of the interconnect or the LAG.
  Future<Connection> associateHostedConnection(
      {@required String connectionId,
      @required String parentConnectionId}) async {
    return Connection.fromJson({});
  }

  /// Associates a virtual interface with a specified link aggregation group
  /// (LAG) or connection. Connectivity to AWS is temporarily interrupted as the
  /// virtual interface is being migrated. If the target connection or LAG has
  /// an associated virtual interface with a conflicting VLAN number or a
  /// conflicting IP address, the operation fails.
  ///
  /// Virtual interfaces associated with a hosted connection cannot be
  /// associated with a LAG; hosted connections must be migrated along with
  /// their virtual interfaces using AssociateHostedConnection.
  ///
  /// To reassociate a virtual interface to a new connection or LAG, the
  /// requester must own either the virtual interface itself or the connection
  /// to which the virtual interface is currently associated. Additionally, the
  /// requester must own the connection or LAG for the association.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [connectionId]: The ID of the LAG or connection.
  Future<VirtualInterface> associateVirtualInterface(
      {@required String virtualInterfaceId,
      @required String connectionId}) async {
    return VirtualInterface.fromJson({});
  }

  /// Confirms the creation of the specified hosted connection on an
  /// interconnect.
  ///
  /// Upon creation, the hosted connection is initially in the `Ordering` state,
  /// and remains in this state until the owner confirms creation of the hosted
  /// connection.
  ///
  /// [connectionId]: The ID of the hosted connection.
  Future<ConfirmConnectionResponse> confirmConnection(
      String connectionId) async {
    return ConfirmConnectionResponse.fromJson({});
  }

  /// Accepts ownership of a private virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the virtual interface
  /// is created and attached to the specified virtual private gateway or Direct
  /// Connect gateway, and is made available to handle traffic.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [virtualGatewayId]: The ID of the virtual private gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  Future<ConfirmPrivateVirtualInterfaceResponse> confirmPrivateVirtualInterface(
      String virtualInterfaceId,
      {String virtualGatewayId,
      String directConnectGatewayId}) async {
    return ConfirmPrivateVirtualInterfaceResponse.fromJson({});
  }

  /// Accepts ownership of a public virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the specified virtual
  /// interface is created and made available to handle traffic.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  Future<ConfirmPublicVirtualInterfaceResponse> confirmPublicVirtualInterface(
      String virtualInterfaceId) async {
    return ConfirmPublicVirtualInterfaceResponse.fromJson({});
  }

  /// Accepts ownership of a transit virtual interface created by another AWS
  /// account.
  ///
  ///  After the owner of the transit virtual interface makes this call, the
  /// specified transit virtual interface is created and made available to
  /// handle traffic.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  Future<ConfirmTransitVirtualInterfaceResponse> confirmTransitVirtualInterface(
      {@required String virtualInterfaceId,
      @required String directConnectGatewayId}) async {
    return ConfirmTransitVirtualInterfaceResponse.fromJson({});
  }

  /// Creates a BGP peer on the specified virtual interface.
  ///
  /// You must create a BGP peer for the corresponding address family
  /// (IPv4/IPv6) in order to access AWS resources that also use that address
  /// family.
  ///
  /// If logical redundancy is not supported by the connection, interconnect, or
  /// LAG, the BGP peer cannot be in the same address family as an existing BGP
  /// peer on the virtual interface.
  ///
  /// When creating a IPv6 BGP peer, omit the Amazon address and customer
  /// address. IPv6 addresses are automatically assigned from the Amazon pool of
  /// IPv6 addresses; you cannot specify custom IPv6 addresses.
  ///
  /// For a public virtual interface, the Autonomous System Number (ASN) must be
  /// private or already whitelisted for the virtual interface.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [newBgpPeer]: Information about the BGP peer.
  Future<CreateBgpPeerResponse> createBgpPeer(
      {String virtualInterfaceId, NewBgpPeer newBgpPeer}) async {
    return CreateBgpPeerResponse.fromJson({});
  }

  /// Creates a connection between a customer network and a specific AWS Direct
  /// Connect location.
  ///
  /// A connection links your internal network to an AWS Direct Connect location
  /// over a standard Ethernet fiber-optic cable. One end of the cable is
  /// connected to your router, the other to an AWS Direct Connect router.
  ///
  /// To find the locations for your Region, use DescribeLocations.
  ///
  /// You can automatically add the new connection to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// connection is allocated on the same AWS Direct Connect endpoint that hosts
  /// the specified LAG. If there are no available ports on the endpoint, the
  /// request fails and no connection is created.
  ///
  /// [location]: The location of the connection.
  ///
  /// [bandwidth]: The bandwidth of the connection.
  ///
  /// [connectionName]: The name of the connection.
  ///
  /// [lagId]: The ID of the LAG.
  ///
  /// [tags]: The tags to assign to the connection.
  Future<Connection> createConnection(
      {@required String location,
      @required String bandwidth,
      @required String connectionName,
      String lagId,
      List<Tag> tags}) async {
    return Connection.fromJson({});
  }

  /// Creates a Direct Connect gateway, which is an intermediate object that
  /// enables you to connect a set of virtual interfaces and virtual private
  /// gateways. A Direct Connect gateway is global and visible in any AWS Region
  /// after it is created. The virtual interfaces and virtual private gateways
  /// that are connected through a Direct Connect gateway can be in different
  /// AWS Regions. This enables you to connect to a VPC in any Region,
  /// regardless of the Region in which the virtual interfaces are located, and
  /// pass traffic between them.
  ///
  /// [directConnectGatewayName]: The name of the Direct Connect gateway.
  ///
  /// [amazonSideAsn]: The autonomous system number (ASN) for Border Gateway
  /// Protocol (BGP) to be configured on the Amazon side of the connection. The
  /// ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to
  /// 4,294,967,294. The default is 64512.
  Future<CreateDirectConnectGatewayResult> createDirectConnectGateway(
      String directConnectGatewayName,
      {BigInt amazonSideAsn}) async {
    return CreateDirectConnectGatewayResult.fromJson({});
  }

  /// Creates an association between a Direct Connect gateway and a virtual
  /// private gateway. The virtual private gateway must be attached to a VPC and
  /// must not be associated with another Direct Connect gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [gatewayId]: The ID of the virtual private gateway or transit gateway.
  ///
  /// [addAllowedPrefixesToDirectConnectGateway]: The Amazon VPC prefixes to
  /// advertise to the Direct Connect gateway
  ///
  /// For information about how to set the prefixes, see
  /// [Allowed Prefixes](https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes)
  /// in the _AWS Direct Connect User Guide_.
  ///
  /// [virtualGatewayId]: The ID of the virtual private gateway.
  Future<CreateDirectConnectGatewayAssociationResult>
      createDirectConnectGatewayAssociation(String directConnectGatewayId,
          {String gatewayId,
          List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
          String virtualGatewayId}) async {
    return CreateDirectConnectGatewayAssociationResult.fromJson({});
  }

  /// Creates a proposal to associate the specified virtual private gateway or
  /// transit gateway with the specified Direct Connect gateway.
  ///
  /// You can only associate a Direct Connect gateway and virtual private
  /// gateway or transit gateway when the account that owns the Direct Connect
  /// gateway and the account that owns the virtual private gateway or transit
  /// gateway have the same AWS Payer ID.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [directConnectGatewayOwnerAccount]: The ID of the AWS account that owns
  /// the Direct Connect gateway.
  ///
  /// [gatewayId]: The ID of the virtual private gateway or transit gateway.
  ///
  /// [addAllowedPrefixesToDirectConnectGateway]: The Amazon VPC prefixes to
  /// advertise to the Direct Connect gateway.
  ///
  /// [removeAllowedPrefixesToDirectConnectGateway]: The Amazon VPC prefixes to
  /// no longer advertise to the Direct Connect gateway.
  Future<CreateDirectConnectGatewayAssociationProposalResult>
      createDirectConnectGatewayAssociationProposal(
          {@required String directConnectGatewayId,
          @required String directConnectGatewayOwnerAccount,
          @required String gatewayId,
          List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
          List<RouteFilterPrefix>
              removeAllowedPrefixesToDirectConnectGateway}) async {
    return CreateDirectConnectGatewayAssociationProposalResult.fromJson({});
  }

  /// Creates an interconnect between an AWS Direct Connect Partner's network
  /// and a specific AWS Direct Connect location.
  ///
  /// An interconnect is a connection that is capable of hosting other
  /// connections. The AWS Direct Connect partner can use an interconnect to
  /// provide AWS Direct Connect hosted connections to customers through their
  /// own network services. Like a standard connection, an interconnect links
  /// the partner's network to an AWS Direct Connect location over a standard
  /// Ethernet fiber-optic cable. One end is connected to the partner's router,
  /// the other to an AWS Direct Connect router.
  ///
  /// You can automatically add the new interconnect to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// interconnect is allocated on the same AWS Direct Connect endpoint that
  /// hosts the specified LAG. If there are no available ports on the endpoint,
  /// the request fails and no interconnect is created.
  ///
  /// For each end customer, the AWS Direct Connect Partner provisions a
  /// connection on their interconnect by calling AllocateHostedConnection. The
  /// end customer can then connect to AWS resources by creating a virtual
  /// interface on their connection, using the VLAN assigned to them by the AWS
  /// Direct Connect Partner.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [interconnectName]: The name of the interconnect.
  ///
  /// [bandwidth]: The port bandwidth, in Gbps. The possible values are 1 and
  /// 10.
  ///
  /// [location]: The location of the interconnect.
  ///
  /// [lagId]: The ID of the LAG.
  ///
  /// [tags]: The tags to assign to the interconnect,
  Future<Interconnect> createInterconnect(
      {@required String interconnectName,
      @required String bandwidth,
      @required String location,
      String lagId,
      List<Tag> tags}) async {
    return Interconnect.fromJson({});
  }

  /// Creates a link aggregation group (LAG) with the specified number of
  /// bundled physical connections between the customer network and a specific
  /// AWS Direct Connect location. A LAG is a logical interface that uses the
  /// Link Aggregation Control Protocol (LACP) to aggregate multiple interfaces,
  /// enabling you to treat them as a single interface.
  ///
  /// All connections in a LAG must use the same bandwidth and must terminate at
  /// the same AWS Direct Connect endpoint.
  ///
  /// You can have up to 10 connections per LAG. Regardless of this limit, if
  /// you request more connections for the LAG than AWS Direct Connect can
  /// allocate on a single endpoint, no LAG is created.
  ///
  /// You can specify an existing physical connection or interconnect to include
  /// in the LAG (which counts towards the total number of connections). Doing
  /// so interrupts the current physical connection or hosted connections, and
  /// re-establishes them as a member of the LAG. The LAG will be created on the
  /// same AWS Direct Connect endpoint to which the connection terminates. Any
  /// virtual interfaces associated with the connection are automatically
  /// disassociated and re-associated with the LAG. The connection ID does not
  /// change.
  ///
  /// If the AWS account used to create a LAG is a registered AWS Direct Connect
  /// Partner, the LAG is automatically enabled to host sub-connections. For a
  /// LAG owned by a partner, any associated virtual interfaces cannot be
  /// directly configured.
  ///
  /// [numberOfConnections]: The number of physical connections initially
  /// provisioned and bundled by the LAG.
  ///
  /// [location]: The location for the LAG.
  ///
  /// [connectionsBandwidth]: The bandwidth of the individual physical
  /// connections bundled by the LAG. The possible values are 50Mbps, 100Mbps,
  /// 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps.
  ///
  /// [lagName]: The name of the LAG.
  ///
  /// [connectionId]: The ID of an existing connection to migrate to the LAG.
  ///
  /// [tags]: The tags to assign to the link aggregation group (LAG).
  ///
  /// [childConnectionTags]: The tags to assign to the child connections of the
  /// LAG. Only newly created child connections as the result of creating a LAG
  /// connection are assigned the provided tags. The tags are not assigned to an
  /// existing connection that is provided via the “connectionId” parameter that
  /// will be migrated to the LAG.
  Future<Lag> createLag(
      {@required int numberOfConnections,
      @required String location,
      @required String connectionsBandwidth,
      @required String lagName,
      String connectionId,
      List<Tag> tags,
      List<Tag> childConnectionTags}) async {
    return Lag.fromJson({});
  }

  /// Creates a private virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A private virtual interface can be
  /// connected to either a Direct Connect gateway or a Virtual Private Gateway
  /// (VGW). Connecting the private virtual interface to a Direct Connect
  /// gateway enables the possibility for connecting to multiple VPCs, including
  /// VPCs in different AWS Regions. Connecting the private virtual interface to
  /// a VGW only provides access to a single VPC within the same Region.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [newPrivateVirtualInterface]: Information about the private virtual
  /// interface.
  Future<VirtualInterface> createPrivateVirtualInterface(
      {@required String connectionId,
      @required NewPrivateVirtualInterface newPrivateVirtualInterface}) async {
    return VirtualInterface.fromJson({});
  }

  /// Creates a public virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A public virtual interface supports
  /// sending traffic to public services of AWS such as Amazon S3.
  ///
  /// When creating an IPv6 public virtual interface (`addressFamily` is
  /// `ipv6`), leave the `customer` and `amazon` address fields blank to use
  /// auto-assigned IPv6 space. Custom IPv6 addresses are not supported.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [newPublicVirtualInterface]: Information about the public virtual
  /// interface.
  Future<VirtualInterface> createPublicVirtualInterface(
      {@required String connectionId,
      @required NewPublicVirtualInterface newPublicVirtualInterface}) async {
    return VirtualInterface.fromJson({});
  }

  /// Creates a transit virtual interface. A transit virtual interface should be
  /// used to access one or more transit gateways associated with Direct Connect
  /// gateways. A transit virtual interface enables the connection of multiple
  /// VPCs attached to a transit gateway to a Direct Connect gateway.
  ///
  ///
  ///
  /// If you associate your transit gateway with one or more Direct Connect
  /// gateways, the Autonomous System Number (ASN) used by the transit gateway
  /// and the Direct Connect gateway must be different. For example, if you use
  /// the default ASN 64512 for both your the transit gateway and Direct Connect
  /// gateway, the association request fails.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [newTransitVirtualInterface]: Information about the transit virtual
  /// interface.
  Future<CreateTransitVirtualInterfaceResult> createTransitVirtualInterface(
      {@required String connectionId,
      @required NewTransitVirtualInterface newTransitVirtualInterface}) async {
    return CreateTransitVirtualInterfaceResult.fromJson({});
  }

  /// Deletes the specified BGP peer on the specified virtual interface with the
  /// specified customer address and ASN.
  ///
  /// You cannot delete the last BGP peer from a virtual interface.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [asn]: The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// [customerAddress]: The IP address assigned to the customer interface.
  ///
  /// [bgpPeerId]: The ID of the BGP peer.
  Future<DeleteBgpPeerResponse> deleteBgpPeer(
      {String virtualInterfaceId,
      int asn,
      String customerAddress,
      String bgpPeerId}) async {
    return DeleteBgpPeerResponse.fromJson({});
  }

  /// Deletes the specified connection.
  ///
  /// Deleting a connection only stops the AWS Direct Connect port hour and data
  /// transfer charges. If you are partnering with any third parties to connect
  /// with the AWS Direct Connect location, you must cancel your service with
  /// them separately.
  ///
  /// [connectionId]: The ID of the connection.
  Future<Connection> deleteConnection(String connectionId) async {
    return Connection.fromJson({});
  }

  /// Deletes the specified Direct Connect gateway. You must first delete all
  /// virtual interfaces that are attached to the Direct Connect gateway and
  /// disassociate all virtual private gateways that are associated with the
  /// Direct Connect gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  Future<DeleteDirectConnectGatewayResult> deleteDirectConnectGateway(
      String directConnectGatewayId) async {
    return DeleteDirectConnectGatewayResult.fromJson({});
  }

  /// Deletes the association between the specified Direct Connect gateway and
  /// virtual private gateway.
  ///
  /// [associationId]: The ID of the Direct Connect gateway association.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [virtualGatewayId]: The ID of the virtual private gateway.
  Future<DeleteDirectConnectGatewayAssociationResult>
      deleteDirectConnectGatewayAssociation(
          {String associationId,
          String directConnectGatewayId,
          String virtualGatewayId}) async {
    return DeleteDirectConnectGatewayAssociationResult.fromJson({});
  }

  /// Deletes the association proposal request between the specified Direct
  /// Connect gateway and virtual private gateway or transit gateway.
  ///
  /// [proposalId]: The ID of the proposal.
  Future<DeleteDirectConnectGatewayAssociationProposalResult>
      deleteDirectConnectGatewayAssociationProposal(String proposalId) async {
    return DeleteDirectConnectGatewayAssociationProposalResult.fromJson({});
  }

  /// Deletes the specified interconnect.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [interconnectId]: The ID of the interconnect.
  Future<DeleteInterconnectResponse> deleteInterconnect(
      String interconnectId) async {
    return DeleteInterconnectResponse.fromJson({});
  }

  /// Deletes the specified link aggregation group (LAG). You cannot delete a
  /// LAG if it has active virtual interfaces or hosted connections.
  ///
  /// [lagId]: The ID of the LAG.
  Future<Lag> deleteLag(String lagId) async {
    return Lag.fromJson({});
  }

  /// Deletes a virtual interface.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  Future<DeleteVirtualInterfaceResponse> deleteVirtualInterface(
      String virtualInterfaceId) async {
    return DeleteVirtualInterfaceResponse.fromJson({});
  }

  /// Deprecated. Use DescribeLoa instead.
  ///
  /// Gets the LOA-CFA for a connection.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that your APN partner or service provider uses when
  /// establishing your cross connect to AWS at the colocation facility. For
  /// more information, see
  /// [Requesting Cross Connects at AWS Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [providerName]: The name of the APN partner or service provider who
  /// establishes connectivity on your behalf. If you specify this parameter,
  /// the LOA-CFA lists the provider name alongside your company name as the
  /// requester of the cross connect.
  ///
  /// [loaContentType]: The standard media type for the LOA-CFA document. The
  /// only supported value is application/pdf.
  Future<DescribeConnectionLoaResponse> describeConnectionLoa(
      String connectionId,
      {String providerName,
      String loaContentType}) async {
    return DescribeConnectionLoaResponse.fromJson({});
  }

  /// Displays the specified connection or all connections in this Region.
  ///
  /// [connectionId]: The ID of the connection.
  Future<Connections> describeConnections({String connectionId}) async {
    return Connections.fromJson({});
  }

  /// Deprecated. Use DescribeHostedConnections instead.
  ///
  /// Lists the connections that have been provisioned on the specified
  /// interconnect.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [interconnectId]: The ID of the interconnect.
  Future<Connections> describeConnectionsOnInterconnect(
      String interconnectId) async {
    return Connections.fromJson({});
  }

  /// Describes one or more association proposals for connection between a
  /// virtual private gateway or transit gateway and a Direct Connect gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [proposalId]: The ID of the proposal.
  ///
  /// [associatedGatewayId]: The ID of the associated gateway.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  ///
  /// If `MaxResults` is given a value larger than 100, only 100 results are
  /// returned.
  ///
  /// [nextToken]: The token for the next page of results.
  Future<DescribeDirectConnectGatewayAssociationProposalsResult>
      describeDirectConnectGatewayAssociationProposals(
          {String directConnectGatewayId,
          String proposalId,
          String associatedGatewayId,
          int maxResults,
          String nextToken}) async {
    return DescribeDirectConnectGatewayAssociationProposalsResult.fromJson({});
  }

  /// Lists the associations between your Direct Connect gateways and virtual
  /// private gateways. You must specify a Direct Connect gateway, a virtual
  /// private gateway, or both. If you specify a Direct Connect gateway, the
  /// response contains all virtual private gateways associated with the Direct
  /// Connect gateway. If you specify a virtual private gateway, the response
  /// contains all Direct Connect gateways associated with the virtual private
  /// gateway. If you specify both, the response contains the association
  /// between the Direct Connect gateway and the virtual private gateway.
  ///
  /// [associationId]: The ID of the Direct Connect gateway association.
  ///
  /// [associatedGatewayId]: The ID of the associated gateway.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  ///
  /// If `MaxResults` is given a value larger than 100, only 100 results are
  /// returned.
  ///
  /// [nextToken]: The token provided in the previous call to retrieve the next
  /// page.
  ///
  /// [virtualGatewayId]: The ID of the virtual private gateway.
  Future<DescribeDirectConnectGatewayAssociationsResult>
      describeDirectConnectGatewayAssociations(
          {String associationId,
          String associatedGatewayId,
          String directConnectGatewayId,
          int maxResults,
          String nextToken,
          String virtualGatewayId}) async {
    return DescribeDirectConnectGatewayAssociationsResult.fromJson({});
  }

  /// Lists the attachments between your Direct Connect gateways and virtual
  /// interfaces. You must specify a Direct Connect gateway, a virtual
  /// interface, or both. If you specify a Direct Connect gateway, the response
  /// contains all virtual interfaces attached to the Direct Connect gateway. If
  /// you specify a virtual interface, the response contains all Direct Connect
  /// gateways attached to the virtual interface. If you specify both, the
  /// response contains the attachment between the Direct Connect gateway and
  /// the virtual interface.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  ///
  /// If `MaxResults` is given a value larger than 100, only 100 results are
  /// returned.
  ///
  /// [nextToken]: The token provided in the previous call to retrieve the next
  /// page.
  Future<DescribeDirectConnectGatewayAttachmentsResult>
      describeDirectConnectGatewayAttachments(
          {String directConnectGatewayId,
          String virtualInterfaceId,
          int maxResults,
          String nextToken}) async {
    return DescribeDirectConnectGatewayAttachmentsResult.fromJson({});
  }

  /// Lists all your Direct Connect gateways or only the specified Direct
  /// Connect gateway. Deleted Direct Connect gateways are not returned.
  ///
  /// [directConnectGatewayId]: The ID of the Direct Connect gateway.
  ///
  /// [maxResults]: The maximum number of results to return with a single call.
  /// To retrieve the remaining results, make another call with the returned
  /// `nextToken` value.
  ///
  /// If `MaxResults` is given a value larger than 100, only 100 results are
  /// returned.
  ///
  /// [nextToken]: The token provided in the previous call to retrieve the next
  /// page.
  Future<DescribeDirectConnectGatewaysResult> describeDirectConnectGateways(
      {String directConnectGatewayId, int maxResults, String nextToken}) async {
    return DescribeDirectConnectGatewaysResult.fromJson({});
  }

  /// Lists the hosted connections that have been provisioned on the specified
  /// interconnect or link aggregation group (LAG).
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  ///
  /// [connectionId]: The ID of the interconnect or LAG.
  Future<Connections> describeHostedConnections(String connectionId) async {
    return Connections.fromJson({});
  }

  /// Deprecated. Use DescribeLoa instead.
  ///
  /// Gets the LOA-CFA for the specified interconnect.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see
  /// [Requesting Cross Connects at AWS Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  ///
  /// [interconnectId]: The ID of the interconnect.
  ///
  /// [providerName]: The name of the service provider who establishes
  /// connectivity on your behalf. If you supply this parameter, the LOA-CFA
  /// lists the provider name alongside your company name as the requester of
  /// the cross connect.
  ///
  /// [loaContentType]: The standard media type for the LOA-CFA document. The
  /// only supported value is application/pdf.
  Future<DescribeInterconnectLoaResponse> describeInterconnectLoa(
      String interconnectId,
      {String providerName,
      String loaContentType}) async {
    return DescribeInterconnectLoaResponse.fromJson({});
  }

  /// Lists the interconnects owned by the AWS account or only the specified
  /// interconnect.
  ///
  /// [interconnectId]: The ID of the interconnect.
  Future<Interconnects> describeInterconnects({String interconnectId}) async {
    return Interconnects.fromJson({});
  }

  /// Describes all your link aggregation groups (LAG) or the specified LAG.
  ///
  /// [lagId]: The ID of the LAG.
  Future<Lags> describeLags({String lagId}) async {
    return Lags.fromJson({});
  }

  /// Gets the LOA-CFA for a connection, interconnect, or link aggregation group
  /// (LAG).
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see
  /// [Requesting Cross Connects at AWS Direct Connect Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  ///
  /// [connectionId]: The ID of a connection, LAG, or interconnect.
  ///
  /// [providerName]: The name of the service provider who establishes
  /// connectivity on your behalf. If you specify this parameter, the LOA-CFA
  /// lists the provider name alongside your company name as the requester of
  /// the cross connect.
  ///
  /// [loaContentType]: The standard media type for the LOA-CFA document. The
  /// only supported value is application/pdf.
  Future<Loa> describeLoa(String connectionId,
      {String providerName, String loaContentType}) async {
    return Loa.fromJson({});
  }

  /// Lists the AWS Direct Connect locations in the current AWS Region. These
  /// are the locations that can be selected when calling CreateConnection or
  /// CreateInterconnect.
  Future<Locations> describeLocations() async {
    return Locations.fromJson({});
  }

  /// Describes the tags associated with the specified AWS Direct Connect
  /// resources.
  ///
  /// [resourceArns]: The Amazon Resource Names (ARNs) of the resources.
  Future<DescribeTagsResponse> describeTags(List<String> resourceArns) async {
    return DescribeTagsResponse.fromJson({});
  }

  /// Lists the virtual private gateways owned by the AWS account.
  ///
  /// You can create one or more AWS Direct Connect private virtual interfaces
  /// linked to a virtual private gateway.
  Future<VirtualGateways> describeVirtualGateways() async {
    return VirtualGateways.fromJson({});
  }

  /// Displays all virtual interfaces for an AWS account. Virtual interfaces
  /// deleted fewer than 15 minutes before you make the request are also
  /// returned. If you specify a connection ID, only the virtual interfaces
  /// associated with the connection are returned. If you specify a virtual
  /// interface ID, then only a single virtual interface is returned.
  ///
  /// A virtual interface (VLAN) transmits the traffic between the AWS Direct
  /// Connect location and the customer network.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [virtualInterfaceId]: The ID of the virtual interface.
  Future<VirtualInterfaces> describeVirtualInterfaces(
      {String connectionId, String virtualInterfaceId}) async {
    return VirtualInterfaces.fromJson({});
  }

  /// Disassociates a connection from a link aggregation group (LAG). The
  /// connection is interrupted and re-established as a standalone connection
  /// (the connection is not deleted; to delete the connection, use the
  /// DeleteConnection request). If the LAG has associated virtual interfaces or
  /// hosted connections, they remain associated with the LAG. A disassociated
  /// connection owned by an AWS Direct Connect Partner is automatically
  /// converted to an interconnect.
  ///
  /// If disassociating the connection would cause the LAG to fall below its
  /// setting for minimum number of operational connections, the request fails,
  /// except when it's the last member of the LAG. If all connections are
  /// disassociated, the LAG continues to exist as an empty LAG with no physical
  /// connections.
  ///
  /// [connectionId]: The ID of the connection.
  ///
  /// [lagId]: The ID of the LAG.
  Future<Connection> disassociateConnectionFromLag(
      {@required String connectionId, @required String lagId}) async {
    return Connection.fromJson({});
  }

  /// Adds the specified tags to the specified AWS Direct Connect resource. Each
  /// resource can have a maximum of 50 tags.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the resource, this action updates its
  /// value.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tags]: The tags to assign.
  Future<TagResourceResponse> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {
    return TagResourceResponse.fromJson({});
  }

  /// Removes one or more tags from the specified AWS Direct Connect resource.
  ///
  /// [resourceArn]: The Amazon Resource Name (ARN) of the resource.
  ///
  /// [tagKeys]: The tag keys of the tags to remove.
  Future<UntagResourceResponse> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {
    return UntagResourceResponse.fromJson({});
  }

  /// Updates the specified attributes of the Direct Connect gateway
  /// association.
  ///
  /// Add or remove prefixes from the association.
  ///
  /// [associationId]: The ID of the Direct Connect gateway association.
  ///
  /// [addAllowedPrefixesToDirectConnectGateway]: The Amazon VPC prefixes to
  /// advertise to the Direct Connect gateway.
  ///
  /// [removeAllowedPrefixesToDirectConnectGateway]: The Amazon VPC prefixes to
  /// no longer advertise to the Direct Connect gateway.
  Future<UpdateDirectConnectGatewayAssociationResult>
      updateDirectConnectGatewayAssociation(
          {String associationId,
          List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
          List<RouteFilterPrefix>
              removeAllowedPrefixesToDirectConnectGateway}) async {
    return UpdateDirectConnectGatewayAssociationResult.fromJson({});
  }

  /// Updates the attributes of the specified link aggregation group (LAG).
  ///
  /// You can update the following attributes:
  ///
  /// *   The name of the LAG.
  ///
  /// *   The value for the minimum number of connections that must be
  /// operational for the LAG itself to be operational.
  ///
  ///
  /// When you create a LAG, the default value for the minimum number of
  /// operational connections is zero (0). If you update this value and the
  /// number of operational connections falls below the specified value, the LAG
  /// automatically goes down to avoid over-utilization of the remaining
  /// connections. Adjust this value with care, as it could force the LAG down
  /// if it is set higher than the current number of operational connections.
  ///
  /// [lagId]: The ID of the LAG.
  ///
  /// [lagName]: The name of the LAG.
  ///
  /// [minimumLinks]: The minimum number of physical connections that must be
  /// operational for the LAG itself to be operational.
  Future<Lag> updateLag(String lagId,
      {String lagName, int minimumLinks}) async {
    return Lag.fromJson({});
  }

  /// Updates the specified attributes of the specified virtual private
  /// interface.
  ///
  /// Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an
  /// update to the underlying physical connection if it wasn't updated to
  /// support jumbo frames. Updating the connection disrupts network
  /// connectivity for all virtual interfaces associated with the connection for
  /// up to 30 seconds. To check whether your connection supports jumbo frames,
  /// call DescribeConnections. To check whether your virtual interface supports
  /// jumbo frames, call DescribeVirtualInterfaces.
  ///
  /// [virtualInterfaceId]: The ID of the virtual private interface.
  ///
  /// [mtu]: The maximum transmission unit (MTU), in bytes. The supported values
  /// are 1500 and 9001. The default value is 1500.
  Future<VirtualInterface> updateVirtualInterfaceAttributes(
      String virtualInterfaceId,
      {int mtu}) async {
    return VirtualInterface.fromJson({});
  }
}

class AcceptDirectConnectGatewayAssociationProposalResult {
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  AcceptDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociation,
  });
  static AcceptDirectConnectGatewayAssociationProposalResult fromJson(
          Map<String, dynamic> json) =>
      AcceptDirectConnectGatewayAssociationProposalResult();
}

class AllocateTransitVirtualInterfaceResult {
  final VirtualInterface virtualInterface;

  AllocateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });
  static AllocateTransitVirtualInterfaceResult fromJson(
          Map<String, dynamic> json) =>
      AllocateTransitVirtualInterfaceResult();
}

/// Information about the associated gateway.
class AssociatedGateway {
  /// The ID of the associated gateway.
  final String id;

  /// The type of associated gateway.
  final String type;

  /// The ID of the AWS account that owns the associated virtual private gateway
  /// or transit gateway.
  final String ownerAccount;

  /// The Region where the associated gateway is located.
  final String region;

  AssociatedGateway({
    this.id,
    this.type,
    this.ownerAccount,
    this.region,
  });
  static AssociatedGateway fromJson(Map<String, dynamic> json) =>
      AssociatedGateway();
}

/// Information about a BGP peer.
class BgpPeer {
  /// The ID of the BGP peer.
  final String bgpPeerId;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The state of the BGP peer. The following are the possible values:
  ///
  /// *    `verifying`: The BGP peering addresses or ASN require validation
  /// before the BGP peer can be created. This state applies only to public
  /// virtual interfaces.
  ///
  /// *    `pending`: The BGP peer is created, and remains in this state until
  /// it is ready to be established.
  ///
  /// *    `available`: The BGP peer is ready to be established.
  ///
  /// *    `deleting`: The BGP peer is being deleted.
  ///
  /// *    `deleted`: The BGP peer is deleted and cannot be established.
  final String bgpPeerState;

  /// The status of the BGP peer. The following are the possible values:
  ///
  /// *    `up`: The BGP peer is established. This state does not indicate the
  /// state of the routing function. Ensure that you are receiving routes over
  /// the BGP session.
  ///
  /// *    `down`: The BGP peer is down.
  ///
  /// *    `unknown`: The BGP peer status is not available.
  final String bgpStatus;

  /// The Direct Connect endpoint on which the BGP peer terminates.
  final String awsDeviceV2;

  BgpPeer({
    this.bgpPeerId,
    this.asn,
    this.authKey,
    this.addressFamily,
    this.amazonAddress,
    this.customerAddress,
    this.bgpPeerState,
    this.bgpStatus,
    this.awsDeviceV2,
  });
  static BgpPeer fromJson(Map<String, dynamic> json) => BgpPeer();
}

class ConfirmConnectionResponse {
  /// The state of the connection. The following are the possible values:
  ///
  /// *    `ordering`: The initial state of a hosted connection provisioned on
  /// an interconnect. The connection stays in the ordering state until the
  /// owner of the hosted connection confirms or declines the connection order.
  ///
  /// *    `requested`: The initial state of a standard connection. The
  /// connection stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  ///
  /// *    `pending`: The connection has been approved and is being initialized.
  ///
  /// *    `available`: The network link is up and the connection is ready for
  /// use.
  ///
  /// *    `down`: The network link is down.
  ///
  /// *    `deleting`: The connection is being deleted.
  ///
  /// *    `deleted`: The connection has been deleted.
  ///
  /// *    `rejected`: A hosted connection in the `ordering` state enters the
  /// `rejected` state if it is deleted by the customer.
  ///
  /// *    `unknown`: The state of the connection is not available.
  final String connectionState;

  ConfirmConnectionResponse({
    this.connectionState,
  });
  static ConfirmConnectionResponse fromJson(Map<String, dynamic> json) =>
      ConfirmConnectionResponse();
}

class ConfirmPrivateVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// *    `confirming`: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  ///
  /// *    `verifying`: This state only applies to public virtual interfaces.
  /// Each public virtual interface needs validation before the virtual
  /// interface can be created.
  ///
  /// *    `pending`: A virtual interface is in this state from the time that it
  /// is created until the virtual interface is ready to forward traffic.
  ///
  /// *    `available`: A virtual interface that is able to forward traffic.
  ///
  /// *    `down`: A virtual interface that is BGP down.
  ///
  /// *    `deleting`: A virtual interface is in this state immediately after
  /// calling DeleteVirtualInterface until it can no longer forward traffic.
  ///
  /// *    `deleted`: A virtual interface that cannot forward traffic.
  ///
  /// *    `rejected`: The virtual interface owner has declined creation of the
  /// virtual interface. If a virtual interface in the `Confirming` state is
  /// deleted by the virtual interface owner, the virtual interface enters the
  /// `Rejected` state.
  ///
  /// *    `unknown`: The state of the virtual interface is not available.
  final String virtualInterfaceState;

  ConfirmPrivateVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  static ConfirmPrivateVirtualInterfaceResponse fromJson(
          Map<String, dynamic> json) =>
      ConfirmPrivateVirtualInterfaceResponse();
}

class ConfirmPublicVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// *    `confirming`: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  ///
  /// *    `verifying`: This state only applies to public virtual interfaces.
  /// Each public virtual interface needs validation before the virtual
  /// interface can be created.
  ///
  /// *    `pending`: A virtual interface is in this state from the time that it
  /// is created until the virtual interface is ready to forward traffic.
  ///
  /// *    `available`: A virtual interface that is able to forward traffic.
  ///
  /// *    `down`: A virtual interface that is BGP down.
  ///
  /// *    `deleting`: A virtual interface is in this state immediately after
  /// calling DeleteVirtualInterface until it can no longer forward traffic.
  ///
  /// *    `deleted`: A virtual interface that cannot forward traffic.
  ///
  /// *    `rejected`: The virtual interface owner has declined creation of the
  /// virtual interface. If a virtual interface in the `Confirming` state is
  /// deleted by the virtual interface owner, the virtual interface enters the
  /// `Rejected` state.
  ///
  /// *    `unknown`: The state of the virtual interface is not available.
  final String virtualInterfaceState;

  ConfirmPublicVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  static ConfirmPublicVirtualInterfaceResponse fromJson(
          Map<String, dynamic> json) =>
      ConfirmPublicVirtualInterfaceResponse();
}

class ConfirmTransitVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// *    `confirming`: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  ///
  /// *    `verifying`: This state only applies to public virtual interfaces.
  /// Each public virtual interface needs validation before the virtual
  /// interface can be created.
  ///
  /// *    `pending`: A virtual interface is in this state from the time that it
  /// is created until the virtual interface is ready to forward traffic.
  ///
  /// *    `available`: A virtual interface that is able to forward traffic.
  ///
  /// *    `down`: A virtual interface that is BGP down.
  ///
  /// *    `deleting`: A virtual interface is in this state immediately after
  /// calling DeleteVirtualInterface until it can no longer forward traffic.
  ///
  /// *    `deleted`: A virtual interface that cannot forward traffic.
  ///
  /// *    `rejected`: The virtual interface owner has declined creation of the
  /// virtual interface. If a virtual interface in the `Confirming` state is
  /// deleted by the virtual interface owner, the virtual interface enters the
  /// `Rejected` state.
  ///
  /// *    `unknown`: The state of the virtual interface is not available.
  final String virtualInterfaceState;

  ConfirmTransitVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  static ConfirmTransitVirtualInterfaceResponse fromJson(
          Map<String, dynamic> json) =>
      ConfirmTransitVirtualInterfaceResponse();
}

/// Information about an AWS Direct Connect connection.
class Connection {
  /// The ID of the AWS account that owns the connection.
  final String ownerAccount;

  /// The ID of the connection.
  final String connectionId;

  /// The name of the connection.
  final String connectionName;

  /// The state of the connection. The following are the possible values:
  ///
  /// *    `ordering`: The initial state of a hosted connection provisioned on
  /// an interconnect. The connection stays in the ordering state until the
  /// owner of the hosted connection confirms or declines the connection order.
  ///
  /// *    `requested`: The initial state of a standard connection. The
  /// connection stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  ///
  /// *    `pending`: The connection has been approved and is being initialized.
  ///
  /// *    `available`: The network link is up and the connection is ready for
  /// use.
  ///
  /// *    `down`: The network link is down.
  ///
  /// *    `deleting`: The connection is being deleted.
  ///
  /// *    `deleted`: The connection has been deleted.
  ///
  /// *    `rejected`: A hosted connection in the `ordering` state enters the
  /// `rejected` state if it is deleted by the customer.
  ///
  /// *    `unknown`: The state of the connection is not available.
  final String connectionState;

  /// The AWS Region where the connection is located.
  final String region;

  /// The location of the connection.
  final String location;

  /// The bandwidth of the connection.
  final String bandwidth;

  /// The ID of the VLAN.
  final int vlan;

  /// The name of the AWS Direct Connect service provider associated with the
  /// connection.
  final String partnerName;

  /// The time of the most recent call to DescribeLoa for this connection.
  final DateTime loaIssueTime;

  /// The ID of the LAG.
  final String lagId;

  /// The Direct Connect endpoint on which the physical connection terminates.
  final String awsDevice;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  final bool jumboFrameCapable;

  /// The Direct Connect endpoint on which the physical connection terminates.
  final String awsDeviceV2;

  /// Indicates whether the connection supports a secondary BGP peer in the same
  /// address family (IPv4/IPv6).
  final String hasLogicalRedundancy;

  /// Any tags assigned to the connection.
  final List<Tag> tags;

  Connection({
    this.ownerAccount,
    this.connectionId,
    this.connectionName,
    this.connectionState,
    this.region,
    this.location,
    this.bandwidth,
    this.vlan,
    this.partnerName,
    this.loaIssueTime,
    this.lagId,
    this.awsDevice,
    this.jumboFrameCapable,
    this.awsDeviceV2,
    this.hasLogicalRedundancy,
    this.tags,
  });
  static Connection fromJson(Map<String, dynamic> json) => Connection();
}

class Connections {
  /// The connections.
  final List<Connection> connections;

  Connections({
    this.connections,
  });
  static Connections fromJson(Map<String, dynamic> json) => Connections();
}

class CreateBgpPeerResponse {
  /// The virtual interface.
  final VirtualInterface virtualInterface;

  CreateBgpPeerResponse({
    this.virtualInterface,
  });
  static CreateBgpPeerResponse fromJson(Map<String, dynamic> json) =>
      CreateBgpPeerResponse();
}

class CreateDirectConnectGatewayAssociationProposalResult {
  /// Information about the Direct Connect gateway proposal.
  final DirectConnectGatewayAssociationProposal
      directConnectGatewayAssociationProposal;

  CreateDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });
  static CreateDirectConnectGatewayAssociationProposalResult fromJson(
          Map<String, dynamic> json) =>
      CreateDirectConnectGatewayAssociationProposalResult();
}

class CreateDirectConnectGatewayAssociationResult {
  /// The association to be created.
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  CreateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  static CreateDirectConnectGatewayAssociationResult fromJson(
          Map<String, dynamic> json) =>
      CreateDirectConnectGatewayAssociationResult();
}

class CreateDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  final DirectConnectGateway directConnectGateway;

  CreateDirectConnectGatewayResult({
    this.directConnectGateway,
  });
  static CreateDirectConnectGatewayResult fromJson(Map<String, dynamic> json) =>
      CreateDirectConnectGatewayResult();
}

class CreateTransitVirtualInterfaceResult {
  final VirtualInterface virtualInterface;

  CreateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });
  static CreateTransitVirtualInterfaceResult fromJson(
          Map<String, dynamic> json) =>
      CreateTransitVirtualInterfaceResult();
}

class DeleteBgpPeerResponse {
  /// The virtual interface.
  final VirtualInterface virtualInterface;

  DeleteBgpPeerResponse({
    this.virtualInterface,
  });
  static DeleteBgpPeerResponse fromJson(Map<String, dynamic> json) =>
      DeleteBgpPeerResponse();
}

class DeleteDirectConnectGatewayAssociationProposalResult {
  /// The ID of the associated gateway.
  final DirectConnectGatewayAssociationProposal
      directConnectGatewayAssociationProposal;

  DeleteDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });
  static DeleteDirectConnectGatewayAssociationProposalResult fromJson(
          Map<String, dynamic> json) =>
      DeleteDirectConnectGatewayAssociationProposalResult();
}

class DeleteDirectConnectGatewayAssociationResult {
  /// Information about the deleted association.
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  DeleteDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  static DeleteDirectConnectGatewayAssociationResult fromJson(
          Map<String, dynamic> json) =>
      DeleteDirectConnectGatewayAssociationResult();
}

class DeleteDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  final DirectConnectGateway directConnectGateway;

  DeleteDirectConnectGatewayResult({
    this.directConnectGateway,
  });
  static DeleteDirectConnectGatewayResult fromJson(Map<String, dynamic> json) =>
      DeleteDirectConnectGatewayResult();
}

class DeleteInterconnectResponse {
  /// The state of the interconnect. The following are the possible values:
  ///
  /// *    `requested`: The initial state of an interconnect. The interconnect
  /// stays in the requested state until the Letter of Authorization (LOA) is
  /// sent to the customer.
  ///
  /// *    `pending`: The interconnect is approved, and is being initialized.
  ///
  /// *    `available`: The network link is up, and the interconnect is ready
  /// for use.
  ///
  /// *    `down`: The network link is down.
  ///
  /// *    `deleting`: The interconnect is being deleted.
  ///
  /// *    `deleted`: The interconnect is deleted.
  ///
  /// *    `unknown`: The state of the interconnect is not available.
  final String interconnectState;

  DeleteInterconnectResponse({
    this.interconnectState,
  });
  static DeleteInterconnectResponse fromJson(Map<String, dynamic> json) =>
      DeleteInterconnectResponse();
}

class DeleteVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// *    `confirming`: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  ///
  /// *    `verifying`: This state only applies to public virtual interfaces.
  /// Each public virtual interface needs validation before the virtual
  /// interface can be created.
  ///
  /// *    `pending`: A virtual interface is in this state from the time that it
  /// is created until the virtual interface is ready to forward traffic.
  ///
  /// *    `available`: A virtual interface that is able to forward traffic.
  ///
  /// *    `down`: A virtual interface that is BGP down.
  ///
  /// *    `deleting`: A virtual interface is in this state immediately after
  /// calling DeleteVirtualInterface until it can no longer forward traffic.
  ///
  /// *    `deleted`: A virtual interface that cannot forward traffic.
  ///
  /// *    `rejected`: The virtual interface owner has declined creation of the
  /// virtual interface. If a virtual interface in the `Confirming` state is
  /// deleted by the virtual interface owner, the virtual interface enters the
  /// `Rejected` state.
  ///
  /// *    `unknown`: The state of the virtual interface is not available.
  final String virtualInterfaceState;

  DeleteVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  static DeleteVirtualInterfaceResponse fromJson(Map<String, dynamic> json) =>
      DeleteVirtualInterfaceResponse();
}

class DescribeConnectionLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  final Loa loa;

  DescribeConnectionLoaResponse({
    this.loa,
  });
  static DescribeConnectionLoaResponse fromJson(Map<String, dynamic> json) =>
      DescribeConnectionLoaResponse();
}

class DescribeDirectConnectGatewayAssociationProposalsResult {
  /// Describes the Direct Connect gateway association proposals.
  final List<DirectConnectGatewayAssociationProposal>
      directConnectGatewayAssociationProposals;

  /// The token to use to retrieve the next page of results. This value is
  /// `null` when there are no more results to return.
  final String nextToken;

  DescribeDirectConnectGatewayAssociationProposalsResult({
    this.directConnectGatewayAssociationProposals,
    this.nextToken,
  });
  static DescribeDirectConnectGatewayAssociationProposalsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDirectConnectGatewayAssociationProposalsResult();
}

class DescribeDirectConnectGatewayAssociationsResult {
  /// Information about the associations.
  final List<DirectConnectGatewayAssociation> directConnectGatewayAssociations;

  /// The token to retrieve the next page.
  final String nextToken;

  DescribeDirectConnectGatewayAssociationsResult({
    this.directConnectGatewayAssociations,
    this.nextToken,
  });
  static DescribeDirectConnectGatewayAssociationsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDirectConnectGatewayAssociationsResult();
}

class DescribeDirectConnectGatewayAttachmentsResult {
  /// The attachments.
  final List<DirectConnectGatewayAttachment> directConnectGatewayAttachments;

  /// The token to retrieve the next page.
  final String nextToken;

  DescribeDirectConnectGatewayAttachmentsResult({
    this.directConnectGatewayAttachments,
    this.nextToken,
  });
  static DescribeDirectConnectGatewayAttachmentsResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDirectConnectGatewayAttachmentsResult();
}

class DescribeDirectConnectGatewaysResult {
  /// The Direct Connect gateways.
  final List<DirectConnectGateway> directConnectGateways;

  /// The token to retrieve the next page.
  final String nextToken;

  DescribeDirectConnectGatewaysResult({
    this.directConnectGateways,
    this.nextToken,
  });
  static DescribeDirectConnectGatewaysResult fromJson(
          Map<String, dynamic> json) =>
      DescribeDirectConnectGatewaysResult();
}

class DescribeInterconnectLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  final Loa loa;

  DescribeInterconnectLoaResponse({
    this.loa,
  });
  static DescribeInterconnectLoaResponse fromJson(Map<String, dynamic> json) =>
      DescribeInterconnectLoaResponse();
}

class DescribeTagsResponse {
  /// Information about the tags.
  final List<ResourceTag> resourceTags;

  DescribeTagsResponse({
    this.resourceTags,
  });
  static DescribeTagsResponse fromJson(Map<String, dynamic> json) =>
      DescribeTagsResponse();
}

/// Information about a Direct Connect gateway, which enables you to connect
/// virtual interfaces and virtual private gateway or transit gateways.
class DirectConnectGateway {
  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// The name of the Direct Connect gateway.
  final String directConnectGatewayName;

  /// The autonomous system number (ASN) for the Amazon side of the connection.
  final BigInt amazonSideAsn;

  /// The ID of the AWS account that owns the Direct Connect gateway.
  final String ownerAccount;

  /// The state of the Direct Connect gateway. The following are the possible
  /// values:
  ///
  /// *    `pending`: The initial state after calling
  /// CreateDirectConnectGateway.
  ///
  /// *    `available`: The Direct Connect gateway is ready for use.
  ///
  /// *    `deleting`: The initial state after calling
  /// DeleteDirectConnectGateway.
  ///
  /// *    `deleted`: The Direct Connect gateway is deleted and cannot pass
  /// traffic.
  final String directConnectGatewayState;

  /// The error message if the state of an object failed to advance.
  final String stateChangeError;

  DirectConnectGateway({
    this.directConnectGatewayId,
    this.directConnectGatewayName,
    this.amazonSideAsn,
    this.ownerAccount,
    this.directConnectGatewayState,
    this.stateChangeError,
  });
  static DirectConnectGateway fromJson(Map<String, dynamic> json) =>
      DirectConnectGateway();
}

/// Information about an association between a Direct Connect gateway and a
/// virtual private gateway or transit gateway.
class DirectConnectGatewayAssociation {
  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// The ID of the AWS account that owns the associated gateway.
  final String directConnectGatewayOwnerAccount;

  /// The state of the association. The following are the possible values:
  ///
  /// *    `associating`: The initial state after calling
  /// CreateDirectConnectGatewayAssociation.
  ///
  /// *    `associated`: The Direct Connect gateway and virtual private gateway
  /// or transit gateway are successfully associated and ready to pass traffic.
  ///
  /// *    `disassociating`: The initial state after calling
  /// DeleteDirectConnectGatewayAssociation.
  ///
  /// *    `disassociated`: The virtual private gateway or transit gateway is
  /// disassociated from the Direct Connect gateway. Traffic flow between the
  /// Direct Connect gateway and virtual private gateway or transit gateway is
  /// stopped.
  final String associationState;

  /// The error message if the state of an object failed to advance.
  final String stateChangeError;

  /// Information about the associated gateway.
  final AssociatedGateway associatedGateway;

  /// The ID of the Direct Connect gateway association.
  final String associationId;

  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  final List<RouteFilterPrefix> allowedPrefixesToDirectConnectGateway;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  final String virtualGatewayId;

  /// The AWS Region where the virtual private gateway is located.
  final String virtualGatewayRegion;

  /// The ID of the AWS account that owns the virtual private gateway.
  final String virtualGatewayOwnerAccount;

  DirectConnectGatewayAssociation({
    this.directConnectGatewayId,
    this.directConnectGatewayOwnerAccount,
    this.associationState,
    this.stateChangeError,
    this.associatedGateway,
    this.associationId,
    this.allowedPrefixesToDirectConnectGateway,
    this.virtualGatewayId,
    this.virtualGatewayRegion,
    this.virtualGatewayOwnerAccount,
  });
  static DirectConnectGatewayAssociation fromJson(Map<String, dynamic> json) =>
      DirectConnectGatewayAssociation();
}

/// Information about the proposal request to attach a virtual private gateway
/// to a Direct Connect gateway.
class DirectConnectGatewayAssociationProposal {
  /// The ID of the association proposal.
  final String proposalId;

  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// The ID of the AWS account that owns the Direct Connect gateway.
  final String directConnectGatewayOwnerAccount;

  /// The state of the proposal. The following are possible values:
  ///
  /// *    `accepted`: The proposal has been accepted. The Direct Connect
  /// gateway association is available to use in this state.
  ///
  /// *    `deleted`: The proposal has been deleted by the owner that made the
  /// proposal. The Direct Connect gateway association cannot be used in this
  /// state.
  ///
  /// *    `requested`: The proposal has been requested. The Direct Connect
  /// gateway association cannot be used in this state.
  final String proposalState;

  /// Information about the associated gateway.
  final AssociatedGateway associatedGateway;

  /// The existing Amazon VPC prefixes advertised to the Direct Connect gateway.
  final List<RouteFilterPrefix> existingAllowedPrefixesToDirectConnectGateway;

  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  final List<RouteFilterPrefix> requestedAllowedPrefixesToDirectConnectGateway;

  DirectConnectGatewayAssociationProposal({
    this.proposalId,
    this.directConnectGatewayId,
    this.directConnectGatewayOwnerAccount,
    this.proposalState,
    this.associatedGateway,
    this.existingAllowedPrefixesToDirectConnectGateway,
    this.requestedAllowedPrefixesToDirectConnectGateway,
  });
  static DirectConnectGatewayAssociationProposal fromJson(
          Map<String, dynamic> json) =>
      DirectConnectGatewayAssociationProposal();
}

/// Information about an attachment between a Direct Connect gateway and a
/// virtual interface.
class DirectConnectGatewayAttachment {
  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// The ID of the virtual interface.
  final String virtualInterfaceId;

  /// The AWS Region where the virtual interface is located.
  final String virtualInterfaceRegion;

  /// The ID of the AWS account that owns the virtual interface.
  final String virtualInterfaceOwnerAccount;

  /// The state of the attachment. The following are the possible values:
  ///
  /// *    `attaching`: The initial state after a virtual interface is created
  /// using the Direct Connect gateway.
  ///
  /// *    `attached`: The Direct Connect gateway and virtual interface are
  /// attached and ready to pass traffic.
  ///
  /// *    `detaching`: The initial state after calling DeleteVirtualInterface.
  ///
  /// *    `detached`: The virtual interface is detached from the Direct Connect
  /// gateway. Traffic flow between the Direct Connect gateway and virtual
  /// interface is stopped.
  final String attachmentState;

  /// The interface type.
  final String attachmentType;

  /// The error message if the state of an object failed to advance.
  final String stateChangeError;

  DirectConnectGatewayAttachment({
    this.directConnectGatewayId,
    this.virtualInterfaceId,
    this.virtualInterfaceRegion,
    this.virtualInterfaceOwnerAccount,
    this.attachmentState,
    this.attachmentType,
    this.stateChangeError,
  });
  static DirectConnectGatewayAttachment fromJson(Map<String, dynamic> json) =>
      DirectConnectGatewayAttachment();
}

/// Information about an interconnect.
class Interconnect {
  /// The ID of the interconnect.
  final String interconnectId;

  /// The name of the interconnect.
  final String interconnectName;

  /// The state of the interconnect. The following are the possible values:
  ///
  /// *    `requested`: The initial state of an interconnect. The interconnect
  /// stays in the requested state until the Letter of Authorization (LOA) is
  /// sent to the customer.
  ///
  /// *    `pending`: The interconnect is approved, and is being initialized.
  ///
  /// *    `available`: The network link is up, and the interconnect is ready
  /// for use.
  ///
  /// *    `down`: The network link is down.
  ///
  /// *    `deleting`: The interconnect is being deleted.
  ///
  /// *    `deleted`: The interconnect is deleted.
  ///
  /// *    `unknown`: The state of the interconnect is not available.
  final String interconnectState;

  /// The AWS Region where the connection is located.
  final String region;

  /// The location of the connection.
  final String location;

  /// The bandwidth of the connection.
  final String bandwidth;

  /// The time of the most recent call to DescribeLoa for this connection.
  final DateTime loaIssueTime;

  /// The ID of the LAG.
  final String lagId;

  /// The Direct Connect endpoint on which the physical connection terminates.
  final String awsDevice;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  final bool jumboFrameCapable;

  /// The Direct Connect endpoint on which the physical connection terminates.
  final String awsDeviceV2;

  /// Indicates whether the interconnect supports a secondary BGP in the same
  /// address family (IPv4/IPv6).
  final String hasLogicalRedundancy;

  /// Any tags assigned to the interconnect.
  final List<Tag> tags;

  Interconnect({
    this.interconnectId,
    this.interconnectName,
    this.interconnectState,
    this.region,
    this.location,
    this.bandwidth,
    this.loaIssueTime,
    this.lagId,
    this.awsDevice,
    this.jumboFrameCapable,
    this.awsDeviceV2,
    this.hasLogicalRedundancy,
    this.tags,
  });
  static Interconnect fromJson(Map<String, dynamic> json) => Interconnect();
}

class Interconnects {
  /// The interconnects.
  final List<Interconnect> interconnects;

  Interconnects({
    this.interconnects,
  });
  static Interconnects fromJson(Map<String, dynamic> json) => Interconnects();
}

/// Information about a link aggregation group (LAG).
class Lag {
  /// The individual bandwidth of the physical connections bundled by the LAG.
  /// The possible values are 1Gbps and 10Gbps.
  final String connectionsBandwidth;

  /// The number of physical connections bundled by the LAG, up to a maximum of
  /// 10.
  final int numberOfConnections;

  /// The ID of the LAG.
  final String lagId;

  /// The ID of the AWS account that owns the LAG.
  final String ownerAccount;

  /// The name of the LAG.
  final String lagName;

  /// The state of the LAG. The following are the possible values:
  ///
  /// *    `requested`: The initial state of a LAG. The LAG stays in the
  /// requested state until the Letter of Authorization (LOA) is available.
  ///
  /// *    `pending`: The LAG has been approved and is being initialized.
  ///
  /// *    `available`: The network link is established and the LAG is ready for
  /// use.
  ///
  /// *    `down`: The network link is down.
  ///
  /// *    `deleting`: The LAG is being deleted.
  ///
  /// *    `deleted`: The LAG is deleted.
  ///
  /// *    `unknown`: The state of the LAG is not available.
  final String lagState;

  /// The location of the LAG.
  final String location;

  /// The AWS Region where the connection is located.
  final String region;

  /// The minimum number of physical connections that must be operational for
  /// the LAG itself to be operational.
  final int minimumLinks;

  /// The AWS Direct Connect endpoint that hosts the LAG.
  final String awsDevice;

  /// The AWS Direct Connect endpoint that hosts the LAG.
  final String awsDeviceV2;

  /// The connections bundled by the LAG.
  final List<Connection> connections;

  /// Indicates whether the LAG can host other connections.
  final bool allowsHostedConnections;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  final bool jumboFrameCapable;

  /// Indicates whether the LAG supports a secondary BGP peer in the same
  /// address family (IPv4/IPv6).
  final String hasLogicalRedundancy;

  /// Any tags assigned to link aggregation group (LAG).
  final List<Tag> tags;

  Lag({
    this.connectionsBandwidth,
    this.numberOfConnections,
    this.lagId,
    this.ownerAccount,
    this.lagName,
    this.lagState,
    this.location,
    this.region,
    this.minimumLinks,
    this.awsDevice,
    this.awsDeviceV2,
    this.connections,
    this.allowsHostedConnections,
    this.jumboFrameCapable,
    this.hasLogicalRedundancy,
    this.tags,
  });
  static Lag fromJson(Map<String, dynamic> json) => Lag();
}

class Lags {
  /// The LAGs.
  final List<Lag> lags;

  Lags({
    this.lags,
  });
  static Lags fromJson(Map<String, dynamic> json) => Lags();
}

/// Information about a Letter of Authorization - Connecting Facility Assignment
/// (LOA-CFA) for a connection.
class Loa {
  /// The binary contents of the LOA-CFA document.
  final Uint8List loaContent;

  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  final String loaContentType;

  Loa({
    this.loaContent,
    this.loaContentType,
  });
  static Loa fromJson(Map<String, dynamic> json) => Loa();
}

/// Information about an AWS Direct Connect location.
class Location {
  /// The code for the location.
  final String locationCode;

  /// The name of the location. This includes the name of the colocation partner
  /// and the physical site of the building.
  final String locationName;

  /// The AWS Region for the location.
  final String region;

  /// The available port speeds for the location.
  final List<String> availablePortSpeeds;

  Location({
    this.locationCode,
    this.locationName,
    this.region,
    this.availablePortSpeeds,
  });
  static Location fromJson(Map<String, dynamic> json) => Location();
}

class Locations {
  /// The locations.
  final List<Location> locations;

  Locations({
    this.locations,
  });
  static Locations fromJson(Map<String, dynamic> json) => Locations();
}

/// Information about a new BGP peer.
class NewBgpPeer {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  NewBgpPeer({
    this.asn,
    this.authKey,
    this.addressFamily,
    this.amazonAddress,
    this.customerAddress,
  });
}

/// Information about a private virtual interface.
class NewPrivateVirtualInterface {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 9001. The default value is 1500.
  final int mtu;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The ID of the virtual private gateway.
  final String virtualGatewayId;

  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// Any tags assigned to the private virtual interface.
  final List<Tag> tags;

  NewPrivateVirtualInterface({
    @required this.virtualInterfaceName,
    @required this.vlan,
    @required this.asn,
    this.mtu,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.virtualGatewayId,
    this.directConnectGatewayId,
    this.tags,
  });
}

/// Information about a private virtual interface to be provisioned on a
/// connection.
class NewPrivateVirtualInterfaceAllocation {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 9001. The default value is 1500.
  final int mtu;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// Any tags assigned to the private virtual interface to be provisioned on a
  /// connection.
  final List<Tag> tags;

  NewPrivateVirtualInterfaceAllocation({
    @required this.virtualInterfaceName,
    @required this.vlan,
    @required this.asn,
    this.mtu,
    this.authKey,
    this.amazonAddress,
    this.addressFamily,
    this.customerAddress,
    this.tags,
  });
}

/// Information about a public virtual interface.
class NewPublicVirtualInterface {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// Any tags assigned to the public virtual interface.
  final List<Tag> tags;

  NewPublicVirtualInterface({
    @required this.virtualInterfaceName,
    @required this.vlan,
    @required this.asn,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.routeFilterPrefixes,
    this.tags,
  });
}

/// Information about a public virtual interface to be provisioned on a
/// connection.
class NewPublicVirtualInterfaceAllocation {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// Any tags assigned to the public virtual interface to be provisioned on a
  /// connection.
  final List<Tag> tags;

  NewPublicVirtualInterfaceAllocation({
    @required this.virtualInterfaceName,
    @required this.vlan,
    @required this.asn,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.routeFilterPrefixes,
    this.tags,
  });
}

/// Information about the transit virtual interface.
class NewTransitVirtualInterface {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 8500. The default value is 1500.
  final int mtu;

  /// The authentication key for BGP configuration.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// Any tags assigned to the transit virtual interface.
  final List<Tag> tags;

  NewTransitVirtualInterface({
    this.virtualInterfaceName,
    this.vlan,
    this.asn,
    this.mtu,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.directConnectGatewayId,
    this.tags,
  });
}

/// Information about a transit virtual interface.
class NewTransitVirtualInterfaceAllocation {
  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 8500. The default value is 1500.
  final int mtu;

  /// The authentication key for BGP configuration.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// Any tags assigned to the transit virtual interface.
  final List<Tag> tags;

  NewTransitVirtualInterfaceAllocation({
    this.virtualInterfaceName,
    this.vlan,
    this.asn,
    this.mtu,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.tags,
  });
}

/// Information about a tag associated with an AWS Direct Connect resource.
class ResourceTag {
  /// The Amazon Resource Name (ARN) of the resource.
  final String resourceArn;

  /// The tags.
  final List<Tag> tags;

  ResourceTag({
    this.resourceArn,
    this.tags,
  });
  static ResourceTag fromJson(Map<String, dynamic> json) => ResourceTag();
}

/// Information about a route filter prefix that a customer can advertise
/// through Border Gateway Protocol (BGP) over a public virtual interface.
class RouteFilterPrefix {
  /// The CIDR block for the advertised route. Separate multiple routes using
  /// commas. An IPv6 CIDR must use /64 or shorter.
  final String cidr;

  RouteFilterPrefix({
    this.cidr,
  });
  static RouteFilterPrefix fromJson(Map<String, dynamic> json) =>
      RouteFilterPrefix();
}

/// Information about a tag.
class Tag {
  /// The key.
  final String key;

  /// The value.
  final String value;

  Tag({
    @required this.key,
    this.value,
  });
  static Tag fromJson(Map<String, dynamic> json) => Tag();
}

class TagResourceResponse {
  TagResourceResponse();
  static TagResourceResponse fromJson(Map<String, dynamic> json) =>
      TagResourceResponse();
}

class UntagResourceResponse {
  UntagResourceResponse();
  static UntagResourceResponse fromJson(Map<String, dynamic> json) =>
      UntagResourceResponse();
}

class UpdateDirectConnectGatewayAssociationResult {
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  UpdateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  static UpdateDirectConnectGatewayAssociationResult fromJson(
          Map<String, dynamic> json) =>
      UpdateDirectConnectGatewayAssociationResult();
}

/// Information about a virtual private gateway for a private virtual interface.
class VirtualGateway {
  /// The ID of the virtual private gateway.
  final String virtualGatewayId;

  /// The state of the virtual private gateway. The following are the possible
  /// values:
  ///
  /// *    `pending`: Initial state after creating the virtual private gateway.
  ///
  /// *    `available`: Ready for use by a private virtual interface.
  ///
  /// *    `deleting`: Initial state after deleting the virtual private gateway.
  ///
  /// *    `deleted`: The virtual private gateway is deleted. The private
  /// virtual interface is unable to send traffic over this gateway.
  final String virtualGatewayState;

  VirtualGateway({
    this.virtualGatewayId,
    this.virtualGatewayState,
  });
  static VirtualGateway fromJson(Map<String, dynamic> json) => VirtualGateway();
}

class VirtualGateways {
  /// The virtual private gateways.
  final List<VirtualGateway> virtualGateways;

  VirtualGateways({
    this.virtualGateways,
  });
  static VirtualGateways fromJson(Map<String, dynamic> json) =>
      VirtualGateways();
}

/// Information about a virtual interface.
class VirtualInterface {
  /// The ID of the AWS account that owns the virtual interface.
  final String ownerAccount;

  /// The ID of the virtual interface.
  final String virtualInterfaceId;

  /// The location of the connection.
  final String location;

  /// The ID of the connection.
  final String connectionId;

  /// The type of virtual interface. The possible values are `private` and
  /// `public`.
  final String virtualInterfaceType;

  /// The name of the virtual interface assigned by the customer network.
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int asn;

  /// The autonomous system number (ASN) for the Amazon side of the connection.
  final BigInt amazonSideAsn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String authKey;

  /// The IP address assigned to the Amazon interface.
  final String amazonAddress;

  /// The IP address assigned to the customer interface.
  final String customerAddress;

  /// The address family for the BGP peer.
  final String addressFamily;

  /// The state of the virtual interface. The following are the possible values:
  ///
  /// *    `confirming`: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  ///
  /// *    `verifying`: This state only applies to public virtual interfaces.
  /// Each public virtual interface needs validation before the virtual
  /// interface can be created.
  ///
  /// *    `pending`: A virtual interface is in this state from the time that it
  /// is created until the virtual interface is ready to forward traffic.
  ///
  /// *    `available`: A virtual interface that is able to forward traffic.
  ///
  /// *    `down`: A virtual interface that is BGP down.
  ///
  /// *    `deleting`: A virtual interface is in this state immediately after
  /// calling DeleteVirtualInterface until it can no longer forward traffic.
  ///
  /// *    `deleted`: A virtual interface that cannot forward traffic.
  ///
  /// *    `rejected`: The virtual interface owner has declined creation of the
  /// virtual interface. If a virtual interface in the `Confirming` state is
  /// deleted by the virtual interface owner, the virtual interface enters the
  /// `Rejected` state.
  ///
  /// *    `unknown`: The state of the virtual interface is not available.
  final String virtualInterfaceState;

  /// The customer router configuration.
  final String customerRouterConfig;

  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 9001. The default value is 1500.
  final int mtu;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  final bool jumboFrameCapable;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  final String virtualGatewayId;

  /// The ID of the Direct Connect gateway.
  final String directConnectGatewayId;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// The BGP peers configured on this virtual interface.
  final List<BgpPeer> bgpPeers;

  /// The AWS Region where the virtual interface is located.
  final String region;

  /// The Direct Connect endpoint on which the virtual interface terminates.
  final String awsDeviceV2;

  /// Any tags assigned to the virtual interface.
  final List<Tag> tags;

  VirtualInterface({
    this.ownerAccount,
    this.virtualInterfaceId,
    this.location,
    this.connectionId,
    this.virtualInterfaceType,
    this.virtualInterfaceName,
    this.vlan,
    this.asn,
    this.amazonSideAsn,
    this.authKey,
    this.amazonAddress,
    this.customerAddress,
    this.addressFamily,
    this.virtualInterfaceState,
    this.customerRouterConfig,
    this.mtu,
    this.jumboFrameCapable,
    this.virtualGatewayId,
    this.directConnectGatewayId,
    this.routeFilterPrefixes,
    this.bgpPeers,
    this.region,
    this.awsDeviceV2,
    this.tags,
  });
  static VirtualInterface fromJson(Map<String, dynamic> json) =>
      VirtualInterface();
}

class VirtualInterfaces {
  /// The virtual interfaces
  final List<VirtualInterface> virtualInterfaces;

  VirtualInterfaces({
    this.virtualInterfaces,
  });
  static VirtualInterfaces fromJson(Map<String, dynamic> json) =>
      VirtualInterfaces();
}
