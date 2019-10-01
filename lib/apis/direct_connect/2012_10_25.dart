import 'package:meta/meta.dart';

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
  Future<void> acceptDirectConnectGatewayAssociationProposal(
      {@required String directConnectGatewayId,
      @required String proposalId,
      @required String associatedGatewayOwnerAccount,
      List<RouteFilterPrefix>
          overrideAllowedPrefixesToDirectConnectGateway}) async {}

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
  Future<void> allocateConnectionOnInterconnect(
      {@required String bandwidth,
      @required String connectionName,
      @required String ownerAccount,
      @required String interconnectId,
      @required int vlan}) async {}

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
  Future<void> allocateHostedConnection(
      {@required String connectionId,
      @required String ownerAccount,
      @required String bandwidth,
      @required String connectionName,
      @required int vlan,
      List<Tag> tags}) async {}

  /// Provisions a private virtual interface to be owned by the specified AWS
  /// account.
  ///
  /// Virtual interfaces created using this action must be confirmed by the
  /// owner using ConfirmPrivateVirtualInterface. Until then, the virtual
  /// interface is in the `Confirming` state and is not available to handle
  /// traffic.
  Future<void> allocatePrivateVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewPrivateVirtualInterfaceAllocation
              newPrivateVirtualInterfaceAllocation}) async {}

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
  Future<void> allocatePublicVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewPublicVirtualInterfaceAllocation
              newPublicVirtualInterfaceAllocation}) async {}

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
  Future<void> allocateTransitVirtualInterface(
      {@required
          String connectionId,
      @required
          String ownerAccount,
      @required
          NewTransitVirtualInterfaceAllocation
              newTransitVirtualInterfaceAllocation}) async {}

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
  Future<void> associateConnectionWithLag(
      {@required String connectionId, @required String lagId}) async {}

  /// Associates a hosted connection and its virtual interfaces with a link
  /// aggregation group (LAG) or interconnect. If the target interconnect or LAG
  /// has an existing hosted connection with a conflicting VLAN number or IP
  /// address, the operation fails. This action temporarily interrupts the
  /// hosted connection's connectivity to AWS as it is being migrated.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  Future<void> associateHostedConnection(
      {@required String connectionId,
      @required String parentConnectionId}) async {}

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
  Future<void> associateVirtualInterface(
      {@required String virtualInterfaceId,
      @required String connectionId}) async {}

  /// Confirms the creation of the specified hosted connection on an
  /// interconnect.
  ///
  /// Upon creation, the hosted connection is initially in the `Ordering` state,
  /// and remains in this state until the owner confirms creation of the hosted
  /// connection.
  Future<void> confirmConnection(String connectionId) async {}

  /// Accepts ownership of a private virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the virtual interface
  /// is created and attached to the specified virtual private gateway or Direct
  /// Connect gateway, and is made available to handle traffic.
  Future<void> confirmPrivateVirtualInterface(String virtualInterfaceId,
      {String virtualGatewayId, String directConnectGatewayId}) async {}

  /// Accepts ownership of a public virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the specified virtual
  /// interface is created and made available to handle traffic.
  Future<void> confirmPublicVirtualInterface(String virtualInterfaceId) async {}

  /// Accepts ownership of a transit virtual interface created by another AWS
  /// account.
  ///
  ///  After the owner of the transit virtual interface makes this call, the
  /// specified transit virtual interface is created and made available to
  /// handle traffic.
  Future<void> confirmTransitVirtualInterface(
      {@required String virtualInterfaceId,
      @required String directConnectGatewayId}) async {}

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
  Future<void> createBgpPeer(
      {String virtualInterfaceId, NewBgpPeer newBgpPeer}) async {}

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
  Future<void> createConnection(
      {@required String location,
      @required String bandwidth,
      @required String connectionName,
      String lagId,
      List<Tag> tags}) async {}

  /// Creates a Direct Connect gateway, which is an intermediate object that
  /// enables you to connect a set of virtual interfaces and virtual private
  /// gateways. A Direct Connect gateway is global and visible in any AWS Region
  /// after it is created. The virtual interfaces and virtual private gateways
  /// that are connected through a Direct Connect gateway can be in different
  /// AWS Regions. This enables you to connect to a VPC in any Region,
  /// regardless of the Region in which the virtual interfaces are located, and
  /// pass traffic between them.
  Future<void> createDirectConnectGateway(String directConnectGatewayName,
      {BigInt amazonSideAsn}) async {}

  /// Creates an association between a Direct Connect gateway and a virtual
  /// private gateway. The virtual private gateway must be attached to a VPC and
  /// must not be associated with another Direct Connect gateway.
  Future<void> createDirectConnectGatewayAssociation(
      String directConnectGatewayId,
      {String gatewayId,
      List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
      String virtualGatewayId}) async {}

  /// Creates a proposal to associate the specified virtual private gateway or
  /// transit gateway with the specified Direct Connect gateway.
  ///
  /// You can only associate a Direct Connect gateway and virtual private
  /// gateway or transit gateway when the account that owns the Direct Connect
  /// gateway and the account that owns the virtual private gateway or transit
  /// gateway have the same AWS Payer ID.
  Future<void> createDirectConnectGatewayAssociationProposal(
      {@required String directConnectGatewayId,
      @required String directConnectGatewayOwnerAccount,
      @required String gatewayId,
      List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
      List<RouteFilterPrefix>
          removeAllowedPrefixesToDirectConnectGateway}) async {}

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
  Future<void> createInterconnect(
      {@required String interconnectName,
      @required String bandwidth,
      @required String location,
      String lagId,
      List<Tag> tags}) async {}

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
  Future<void> createLag(
      {@required int numberOfConnections,
      @required String location,
      @required String connectionsBandwidth,
      @required String lagName,
      String connectionId,
      List<Tag> tags,
      List<Tag> childConnectionTags}) async {}

  /// Creates a private virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A private virtual interface can be
  /// connected to either a Direct Connect gateway or a Virtual Private Gateway
  /// (VGW). Connecting the private virtual interface to a Direct Connect
  /// gateway enables the possibility for connecting to multiple VPCs, including
  /// VPCs in different AWS Regions. Connecting the private virtual interface to
  /// a VGW only provides access to a single VPC within the same Region.
  Future<void> createPrivateVirtualInterface(
      {@required String connectionId,
      @required NewPrivateVirtualInterface newPrivateVirtualInterface}) async {}

  /// Creates a public virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A public virtual interface supports
  /// sending traffic to public services of AWS such as Amazon S3.
  ///
  /// When creating an IPv6 public virtual interface (`addressFamily` is
  /// `ipv6`), leave the `customer` and `amazon` address fields blank to use
  /// auto-assigned IPv6 space. Custom IPv6 addresses are not supported.
  Future<void> createPublicVirtualInterface(
      {@required String connectionId,
      @required NewPublicVirtualInterface newPublicVirtualInterface}) async {}

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
  Future<void> createTransitVirtualInterface(
      {@required String connectionId,
      @required NewTransitVirtualInterface newTransitVirtualInterface}) async {}

  /// Deletes the specified BGP peer on the specified virtual interface with the
  /// specified customer address and ASN.
  ///
  /// You cannot delete the last BGP peer from a virtual interface.
  Future<void> deleteBgpPeer(
      {String virtualInterfaceId,
      int asn,
      String customerAddress,
      String bgpPeerId}) async {}

  /// Deletes the specified connection.
  ///
  /// Deleting a connection only stops the AWS Direct Connect port hour and data
  /// transfer charges. If you are partnering with any third parties to connect
  /// with the AWS Direct Connect location, you must cancel your service with
  /// them separately.
  Future<void> deleteConnection(String connectionId) async {}

  /// Deletes the specified Direct Connect gateway. You must first delete all
  /// virtual interfaces that are attached to the Direct Connect gateway and
  /// disassociate all virtual private gateways that are associated with the
  /// Direct Connect gateway.
  Future<void> deleteDirectConnectGateway(
      String directConnectGatewayId) async {}

  /// Deletes the association between the specified Direct Connect gateway and
  /// virtual private gateway.
  Future<void> deleteDirectConnectGatewayAssociation(
      {String associationId,
      String directConnectGatewayId,
      String virtualGatewayId}) async {}

  /// Deletes the association proposal request between the specified Direct
  /// Connect gateway and virtual private gateway or transit gateway.
  Future<void> deleteDirectConnectGatewayAssociationProposal(
      String proposalId) async {}

  /// Deletes the specified interconnect.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  Future<void> deleteInterconnect(String interconnectId) async {}

  /// Deletes the specified link aggregation group (LAG). You cannot delete a
  /// LAG if it has active virtual interfaces or hosted connections.
  Future<void> deleteLag(String lagId) async {}

  /// Deletes a virtual interface.
  Future<void> deleteVirtualInterface(String virtualInterfaceId) async {}

  /// Deprecated. Use DescribeLoa instead.
  ///
  /// Gets the LOA-CFA for a connection.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that your APN partner or service provider uses when
  /// establishing your cross connect to AWS at the colocation facility. For
  /// more information, see [Requesting Cross Connects at AWS Direct Connect
  /// Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  Future<void> describeConnectionLoa(String connectionId,
      {String providerName, String loaContentType}) async {}

  /// Displays the specified connection or all connections in this Region.
  Future<void> describeConnections({String connectionId}) async {}

  /// Deprecated. Use DescribeHostedConnections instead.
  ///
  /// Lists the connections that have been provisioned on the specified
  /// interconnect.
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  Future<void> describeConnectionsOnInterconnect(String interconnectId) async {}

  /// Describes one or more association proposals for connection between a
  /// virtual private gateway or transit gateway and a Direct Connect gateway.
  Future<void> describeDirectConnectGatewayAssociationProposals(
      {String directConnectGatewayId,
      String proposalId,
      String associatedGatewayId,
      int maxResults,
      String nextToken}) async {}

  /// Lists the associations between your Direct Connect gateways and virtual
  /// private gateways. You must specify a Direct Connect gateway, a virtual
  /// private gateway, or both. If you specify a Direct Connect gateway, the
  /// response contains all virtual private gateways associated with the Direct
  /// Connect gateway. If you specify a virtual private gateway, the response
  /// contains all Direct Connect gateways associated with the virtual private
  /// gateway. If you specify both, the response contains the association
  /// between the Direct Connect gateway and the virtual private gateway.
  Future<void> describeDirectConnectGatewayAssociations(
      {String associationId,
      String associatedGatewayId,
      String directConnectGatewayId,
      int maxResults,
      String nextToken,
      String virtualGatewayId}) async {}

  /// Lists the attachments between your Direct Connect gateways and virtual
  /// interfaces. You must specify a Direct Connect gateway, a virtual
  /// interface, or both. If you specify a Direct Connect gateway, the response
  /// contains all virtual interfaces attached to the Direct Connect gateway. If
  /// you specify a virtual interface, the response contains all Direct Connect
  /// gateways attached to the virtual interface. If you specify both, the
  /// response contains the attachment between the Direct Connect gateway and
  /// the virtual interface.
  Future<void> describeDirectConnectGatewayAttachments(
      {String directConnectGatewayId,
      String virtualInterfaceId,
      int maxResults,
      String nextToken}) async {}

  /// Lists all your Direct Connect gateways or only the specified Direct
  /// Connect gateway. Deleted Direct Connect gateways are not returned.
  Future<void> describeDirectConnectGateways(
      {String directConnectGatewayId,
      int maxResults,
      String nextToken}) async {}

  /// Lists the hosted connections that have been provisioned on the specified
  /// interconnect or link aggregation group (LAG).
  ///
  ///
  ///
  /// Intended for use by AWS Direct Connect Partners only.
  Future<void> describeHostedConnections(String connectionId) async {}

  /// Deprecated. Use DescribeLoa instead.
  ///
  /// Gets the LOA-CFA for the specified interconnect.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see [Requesting Cross Connects
  /// at AWS Direct Connect
  /// Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  Future<void> describeInterconnectLoa(String interconnectId,
      {String providerName, String loaContentType}) async {}

  /// Lists the interconnects owned by the AWS account or only the specified
  /// interconnect.
  Future<void> describeInterconnects({String interconnectId}) async {}

  /// Describes all your link aggregation groups (LAG) or the specified LAG.
  Future<void> describeLags({String lagId}) async {}

  /// Gets the LOA-CFA for a connection, interconnect, or link aggregation group
  /// (LAG).
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see [Requesting Cross Connects
  /// at AWS Direct Connect
  /// Locations](https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html)
  /// in the _AWS Direct Connect User Guide_.
  Future<void> describeLoa(String connectionId,
      {String providerName, String loaContentType}) async {}

  /// Lists the AWS Direct Connect locations in the current AWS Region. These
  /// are the locations that can be selected when calling CreateConnection or
  /// CreateInterconnect.
  Future<void> describeLocations() async {}

  /// Describes the tags associated with the specified AWS Direct Connect
  /// resources.
  Future<void> describeTags(List<String> resourceArns) async {}

  /// Lists the virtual private gateways owned by the AWS account.
  ///
  /// You can create one or more AWS Direct Connect private virtual interfaces
  /// linked to a virtual private gateway.
  Future<void> describeVirtualGateways() async {}

  /// Displays all virtual interfaces for an AWS account. Virtual interfaces
  /// deleted fewer than 15 minutes before you make the request are also
  /// returned. If you specify a connection ID, only the virtual interfaces
  /// associated with the connection are returned. If you specify a virtual
  /// interface ID, then only a single virtual interface is returned.
  ///
  /// A virtual interface (VLAN) transmits the traffic between the AWS Direct
  /// Connect location and the customer network.
  Future<void> describeVirtualInterfaces(
      {String connectionId, String virtualInterfaceId}) async {}

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
  Future<void> disassociateConnectionFromLag(
      {@required String connectionId, @required String lagId}) async {}

  /// Adds the specified tags to the specified AWS Direct Connect resource. Each
  /// resource can have a maximum of 50 tags.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the resource, this action updates its
  /// value.
  Future<void> tagResource(
      {@required String resourceArn, @required List<Tag> tags}) async {}

  /// Removes one or more tags from the specified AWS Direct Connect resource.
  Future<void> untagResource(
      {@required String resourceArn, @required List<String> tagKeys}) async {}

  /// Updates the specified attributes of the Direct Connect gateway
  /// association.
  ///
  /// Add or remove prefixes from the association.
  Future<void> updateDirectConnectGatewayAssociation(
      {String associationId,
      List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
      List<RouteFilterPrefix>
          removeAllowedPrefixesToDirectConnectGateway}) async {}

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
  Future<void> updateLag(String lagId,
      {String lagName, int minimumLinks}) async {}

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
  Future<void> updateVirtualInterfaceAttributes(String virtualInterfaceId,
      {int mtu}) async {}
}

class AcceptDirectConnectGatewayAssociationProposalResult {}

class AllocateTransitVirtualInterfaceResult {}

class AssociatedGateway {}

class BgpPeer {}

class ConfirmConnectionResponse {}

class ConfirmPrivateVirtualInterfaceResponse {}

class ConfirmPublicVirtualInterfaceResponse {}

class ConfirmTransitVirtualInterfaceResponse {}

class Connection {}

class Connections {}

class CreateBgpPeerResponse {}

class CreateDirectConnectGatewayAssociationProposalResult {}

class CreateDirectConnectGatewayAssociationResult {}

class CreateDirectConnectGatewayResult {}

class CreateTransitVirtualInterfaceResult {}

class DeleteBgpPeerResponse {}

class DeleteDirectConnectGatewayAssociationProposalResult {}

class DeleteDirectConnectGatewayAssociationResult {}

class DeleteDirectConnectGatewayResult {}

class DeleteInterconnectResponse {}

class DeleteVirtualInterfaceResponse {}

class DescribeConnectionLoaResponse {}

class DescribeDirectConnectGatewayAssociationProposalsResult {}

class DescribeDirectConnectGatewayAssociationsResult {}

class DescribeDirectConnectGatewayAttachmentsResult {}

class DescribeDirectConnectGatewaysResult {}

class DescribeInterconnectLoaResponse {}

class DescribeTagsResponse {}

class DirectConnectGateway {}

class DirectConnectGatewayAssociation {}

class DirectConnectGatewayAssociationProposal {}

class DirectConnectGatewayAttachment {}

class Interconnect {}

class Interconnects {}

class Lag {}

class Lags {}

class Loa {}

class Location {}

class Locations {}

class NewBgpPeer {}

class NewPrivateVirtualInterface {}

class NewPrivateVirtualInterfaceAllocation {}

class NewPublicVirtualInterface {}

class NewPublicVirtualInterfaceAllocation {}

class NewTransitVirtualInterface {}

class NewTransitVirtualInterfaceAllocation {}

class ResourceTag {}

class RouteFilterPrefix {}

class Tag {}

class TagResourceResponse {}

class UntagResourceResponse {}

class UpdateDirectConnectGatewayAssociationResult {}

class VirtualGateway {}

class VirtualGateways {}

class VirtualInterface {}

class VirtualInterfaces {}
