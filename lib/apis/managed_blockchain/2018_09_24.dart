import 'package:meta/meta.dart';

/// Amazon Managed Blockchain is a fully managed service for creating and
/// managing blockchain networks using open source frameworks. Blockchain allows
/// you to build applications where multiple parties can securely and
/// transparently run transactions and share data without the need for a
/// trusted, central authority. Currently, Managed Blockchain supports the
/// Hyperledger Fabric open source framework.
class ManagedBlockchainApi {
  /// Creates a member within a Managed Blockchain network.
  ///
  /// [clientRequestToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the operation. An idempotent operation
  /// completes no more than one time. This identifier is required only if you
  /// make a service request directly using an HTTP client. It is generated
  /// automatically if you use an AWS SDK or the AWS CLI.
  ///
  /// [invitationId]: The unique identifier of the invitation that is sent to
  /// the member to join the network.
  ///
  /// [networkId]: The unique identifier of the network in which the member is
  /// created.
  ///
  /// [memberConfiguration]: Member configuration parameters.
  Future<CreateMemberOutput> createMember(
      {@required String clientRequestToken,
      @required String invitationId,
      @required String networkId,
      @required MemberConfiguration memberConfiguration}) async {
    return CreateMemberOutput.fromJson({});
  }

  /// Creates a new blockchain network using Amazon Managed Blockchain.
  ///
  /// [clientRequestToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the operation. An idempotent operation
  /// completes no more than one time. This identifier is required only if you
  /// make a service request directly using an HTTP client. It is generated
  /// automatically if you use an AWS SDK or the AWS CLI.
  ///
  /// [name]: The name of the network.
  ///
  /// [description]: An optional description for the network.
  ///
  /// [framework]: The blockchain framework that the network uses.
  ///
  /// [frameworkVersion]: The version of the blockchain framework that the
  /// network uses.
  ///
  /// [frameworkConfiguration]:  Configuration properties of the blockchain
  /// framework relevant to the network configuration.
  ///
  /// [votingPolicy]:  The voting rules used by the network to determine if a
  /// proposal is approved.
  ///
  /// [memberConfiguration]: Configuration properties for the first member
  /// within the network.
  Future<CreateNetworkOutput> createNetwork(
      {@required String clientRequestToken,
      @required String name,
      String description,
      @required String framework,
      @required String frameworkVersion,
      NetworkFrameworkConfiguration frameworkConfiguration,
      @required VotingPolicy votingPolicy,
      @required MemberConfiguration memberConfiguration}) async {
    return CreateNetworkOutput.fromJson({});
  }

  /// Creates a peer node in a member.
  ///
  /// [clientRequestToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the operation. An idempotent operation
  /// completes no more than one time. This identifier is required only if you
  /// make a service request directly using an HTTP client. It is generated
  /// automatically if you use an AWS SDK or the AWS CLI.
  ///
  /// [networkId]: The unique identifier of the network in which this node runs.
  ///
  /// [memberId]: The unique identifier of the member that owns this node.
  ///
  /// [nodeConfiguration]: The properties of a node configuration.
  Future<CreateNodeOutput> createNode(
      {@required String clientRequestToken,
      @required String networkId,
      @required String memberId,
      @required NodeConfiguration nodeConfiguration}) async {
    return CreateNodeOutput.fromJson({});
  }

  /// Creates a proposal for a change to the network that other members of the
  /// network can vote on, for example, a proposal to add a new member to the
  /// network. Any member can create a proposal.
  ///
  /// [clientRequestToken]: A unique, case-sensitive identifier that you provide
  /// to ensure the idempotency of the operation. An idempotent operation
  /// completes no more than one time. This identifier is required only if you
  /// make a service request directly using an HTTP client. It is generated
  /// automatically if you use an AWS SDK or the AWS CLI.
  ///
  /// [networkId]:  The unique identifier of the network for which the proposal
  /// is made.
  ///
  /// [memberId]: The unique identifier of the member that is creating the
  /// proposal. This identifier is especially useful for identifying the member
  /// making the proposal when multiple members exist in a single AWS account.
  ///
  /// [actions]: The type of actions proposed, such as inviting a member or
  /// removing a member. The types of `Actions` in a proposal are mutually
  /// exclusive. For example, a proposal with `Invitations` actions cannot also
  /// contain `Removals` actions.
  ///
  /// [description]: A description for the proposal that is visible to voting
  /// members, for example, "Proposal to add Example Corp. as member."
  Future<CreateProposalOutput> createProposal(
      {@required String clientRequestToken,
      @required String networkId,
      @required String memberId,
      @required ProposalActions actions,
      String description}) async {
    return CreateProposalOutput.fromJson({});
  }

  /// Deletes a member. Deleting a member removes the member and all associated
  /// resources from the network. `DeleteMember` can only be called for a
  /// specified `MemberId` if the principal performing the action is associated
  /// with the AWS account that owns the member. In all other cases, the
  /// `DeleteMember` action is carried out as the result of an approved proposal
  /// to remove a member. If `MemberId` is the last member in a network
  /// specified by the last AWS account, the network is deleted also.
  ///
  /// [networkId]: The unique identifier of the network from which the member is
  /// removed.
  ///
  /// [memberId]: The unique identifier of the member to remove.
  Future<DeleteMemberOutput> deleteMember(
      {@required String networkId, @required String memberId}) async {
    return DeleteMemberOutput.fromJson({});
  }

  /// Deletes a peer node from a member that your AWS account owns. All data on
  /// the node is lost and cannot be recovered.
  ///
  /// [networkId]: The unique identifier of the network that the node belongs
  /// to.
  ///
  /// [memberId]: The unique identifier of the member that owns this node.
  ///
  /// [nodeId]: The unique identifier of the node.
  Future<DeleteNodeOutput> deleteNode(
      {@required String networkId,
      @required String memberId,
      @required String nodeId}) async {
    return DeleteNodeOutput.fromJson({});
  }

  /// Returns detailed information about a member.
  ///
  /// [networkId]: The unique identifier of the network to which the member
  /// belongs.
  ///
  /// [memberId]: The unique identifier of the member.
  Future<GetMemberOutput> getMember(
      {@required String networkId, @required String memberId}) async {
    return GetMemberOutput.fromJson({});
  }

  /// Returns detailed information about a network.
  ///
  /// [networkId]: The unique identifier of the network to get information
  /// about.
  Future<GetNetworkOutput> getNetwork(String networkId) async {
    return GetNetworkOutput.fromJson({});
  }

  /// Returns detailed information about a peer node.
  ///
  /// [networkId]: The unique identifier of the network to which the node
  /// belongs.
  ///
  /// [memberId]: The unique identifier of the member that owns the node.
  ///
  /// [nodeId]: The unique identifier of the node.
  Future<GetNodeOutput> getNode(
      {@required String networkId,
      @required String memberId,
      @required String nodeId}) async {
    return GetNodeOutput.fromJson({});
  }

  /// Returns detailed information about a proposal.
  ///
  /// [networkId]: The unique identifier of the network for which the proposal
  /// is made.
  ///
  /// [proposalId]: The unique identifier of the proposal.
  Future<GetProposalOutput> getProposal(
      {@required String networkId, @required String proposalId}) async {
    return GetProposalOutput.fromJson({});
  }

  /// Returns a listing of all invitations made on the specified network.
  ///
  /// [maxResults]: The maximum number of invitations to return.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListInvitationsOutput> listInvitations(
      {int maxResults, String nextToken}) async {
    return ListInvitationsOutput.fromJson({});
  }

  /// Returns a listing of the members in a network and properties of their
  /// configurations.
  ///
  /// [networkId]: The unique identifier of the network for which to list
  /// members.
  ///
  /// [name]: The optional name of the member to list.
  ///
  /// [status]: An optional status specifier. If provided, only members
  /// currently in this status are listed.
  ///
  /// [isOwned]: An optional Boolean value. If provided, the request is limited
  /// either to members that the current AWS account owns (`true`) or that other
  /// AWS accounts own (`false`). If omitted, all members are listed.
  ///
  /// [maxResults]: The maximum number of members to return in the request.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListMembersOutput> listMembers(String networkId,
      {String name,
      String status,
      bool isOwned,
      int maxResults,
      String nextToken}) async {
    return ListMembersOutput.fromJson({});
  }

  /// Returns information about the networks in which the current AWS account
  /// has members.
  ///
  /// [name]: The name of the network.
  ///
  /// [framework]: An optional framework specifier. If provided, only networks
  /// of this framework type are listed.
  ///
  /// [status]: An optional status specifier. If provided, only networks
  /// currently in this status are listed.
  ///
  /// [maxResults]: The maximum number of networks to list.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListNetworksOutput> listNetworks(
      {String name,
      String framework,
      String status,
      int maxResults,
      String nextToken}) async {
    return ListNetworksOutput.fromJson({});
  }

  /// Returns information about the nodes within a network.
  ///
  /// [networkId]: The unique identifier of the network for which to list nodes.
  ///
  /// [memberId]: The unique identifier of the member who owns the nodes to
  /// list.
  ///
  /// [status]: An optional status specifier. If provided, only nodes currently
  /// in this status are listed.
  ///
  /// [maxResults]: The maximum number of nodes to list.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListNodesOutput> listNodes(
      {@required String networkId,
      @required String memberId,
      String status,
      int maxResults,
      String nextToken}) async {
    return ListNodesOutput.fromJson({});
  }

  /// Returns the listing of votes for a specified proposal, including the value
  /// of each vote and the unique identifier of the member that cast the vote.
  ///
  /// [networkId]:  The unique identifier of the network.
  ///
  /// [proposalId]:  The unique identifier of the proposal.
  ///
  /// [maxResults]:  The maximum number of votes to return.
  ///
  /// [nextToken]:  The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListProposalVotesOutput> listProposalVotes(
      {@required String networkId,
      @required String proposalId,
      int maxResults,
      String nextToken}) async {
    return ListProposalVotesOutput.fromJson({});
  }

  /// Returns a listing of proposals for the network.
  ///
  /// [networkId]:  The unique identifier of the network.
  ///
  /// [maxResults]:  The maximum number of proposals to return.
  ///
  /// [nextToken]:  The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListProposalsOutput> listProposals(String networkId,
      {int maxResults, String nextToken}) async {
    return ListProposalsOutput.fromJson({});
  }

  /// Rejects an invitation to join a network. This action can be called by a
  /// principal in an AWS account that has received an invitation to create a
  /// member and join a network.
  ///
  /// [invitationId]: The unique identifier of the invitation to reject.
  Future<RejectInvitationOutput> rejectInvitation(String invitationId) async {
    return RejectInvitationOutput.fromJson({});
  }

  /// Casts a vote for a specified `ProposalId` on behalf of a member. The
  /// member to vote as, specified by `VoterMemberId`, must be in the same AWS
  /// account as the principal that calls the action.
  ///
  /// [networkId]:  The unique identifier of the network.
  ///
  /// [proposalId]:  The unique identifier of the proposal.
  ///
  /// [voterMemberId]: The unique identifier of the member casting the vote.
  ///
  /// [vote]:  The value of the vote.
  Future<VoteOnProposalOutput> voteOnProposal(
      {@required String networkId,
      @required String proposalId,
      @required String voterMemberId,
      @required String vote}) async {
    return VoteOnProposalOutput.fromJson({});
  }
}

/// A policy type that defines the voting rules for the network. The rules
/// decide if a proposal is approved. Approval may be based on criteria such as
/// the percentage of `YES` votes and the duration of the proposal. The policy
/// applies to all proposals and is specified when the network is created.
class ApprovalThresholdPolicy {
  /// The percentage of votes among all members that must be `YES` for a
  /// proposal to be approved. For example, a `ThresholdPercentage` value of
  /// `50` indicates 50%. The `ThresholdComparator` determines the precise
  /// comparison. If a `ThresholdPercentage` value of `50` is specified on a
  /// network with 10 members, along with a `ThresholdComparator` value of
  /// `GREATER_THAN`, this indicates that 6 `YES` votes are required for the
  /// proposal to be approved.
  final int thresholdPercentage;

  /// The duration from the time that a proposal is created until it expires. If
  /// members cast neither the required number of `YES` votes to approve the
  /// proposal nor the number of `NO` votes required to reject it before the
  /// duration expires, the proposal is `EXPIRED` and `ProposalActions` are not
  /// carried out.
  final int proposalDurationInHours;

  /// Determines whether the vote percentage must be greater than the
  /// `ThresholdPercentage` or must be greater than or equal to the
  /// `ThreholdPercentage` to be approved.
  final String thresholdComparator;

  ApprovalThresholdPolicy({
    this.thresholdPercentage,
    this.proposalDurationInHours,
    this.thresholdComparator,
  });
  static ApprovalThresholdPolicy fromJson(Map<String, dynamic> json) =>
      ApprovalThresholdPolicy();
}

class CreateMemberOutput {
  /// The unique identifier of the member.
  final String memberId;

  CreateMemberOutput({
    this.memberId,
  });
  static CreateMemberOutput fromJson(Map<String, dynamic> json) =>
      CreateMemberOutput();
}

class CreateNetworkOutput {
  /// The unique identifier for the network.
  final String networkId;

  /// The unique identifier for the first member within the network.
  final String memberId;

  CreateNetworkOutput({
    this.networkId,
    this.memberId,
  });
  static CreateNetworkOutput fromJson(Map<String, dynamic> json) =>
      CreateNetworkOutput();
}

class CreateNodeOutput {
  /// The unique identifier of the node.
  final String nodeId;

  CreateNodeOutput({
    this.nodeId,
  });
  static CreateNodeOutput fromJson(Map<String, dynamic> json) =>
      CreateNodeOutput();
}

class CreateProposalOutput {
  /// The unique identifier of the proposal.
  final String proposalId;

  CreateProposalOutput({
    this.proposalId,
  });
  static CreateProposalOutput fromJson(Map<String, dynamic> json) =>
      CreateProposalOutput();
}

class DeleteMemberOutput {
  DeleteMemberOutput();
  static DeleteMemberOutput fromJson(Map<String, dynamic> json) =>
      DeleteMemberOutput();
}

class DeleteNodeOutput {
  DeleteNodeOutput();
  static DeleteNodeOutput fromJson(Map<String, dynamic> json) =>
      DeleteNodeOutput();
}

class GetMemberOutput {
  /// The properties of a member.
  final Member member;

  GetMemberOutput({
    this.member,
  });
  static GetMemberOutput fromJson(Map<String, dynamic> json) =>
      GetMemberOutput();
}

class GetNetworkOutput {
  /// An object containing network configuration parameters.
  final Network network;

  GetNetworkOutput({
    this.network,
  });
  static GetNetworkOutput fromJson(Map<String, dynamic> json) =>
      GetNetworkOutput();
}

class GetNodeOutput {
  /// Properties of the node configuration.
  final Node node;

  GetNodeOutput({
    this.node,
  });
  static GetNodeOutput fromJson(Map<String, dynamic> json) => GetNodeOutput();
}

class GetProposalOutput {
  /// Information about a proposal.
  final Proposal proposal;

  GetProposalOutput({
    this.proposal,
  });
  static GetProposalOutput fromJson(Map<String, dynamic> json) =>
      GetProposalOutput();
}

/// An invitation to an AWS account to create a member and join the network.
class Invitation {
  /// The unique identifier for the invitation.
  final String invitationId;

  /// The date and time that the invitation was created.
  final DateTime creationDate;

  /// The date and time that the invitation expires. This is the `CreationDate`
  /// plus the `ProposalDurationInHours` that is specified in the
  /// `ProposalThresholdPolicy`. After this date and time, the invitee can no
  /// longer create a member and join the network using this `InvitationId`.
  final DateTime expirationDate;

  /// The status of the invitation:
  ///
  /// *    `PENDING` - The invitee has not created a member to join the network,
  /// and the invitation has not yet expired.
  ///
  /// *    `ACCEPTING` - The invitee has begun creating a member, and creation
  /// has not yet completed.
  ///
  /// *    `ACCEPTED` - The invitee created a member and joined the network
  /// using the `InvitationID`.
  ///
  /// *    `REJECTED` - The invitee rejected the invitation.
  ///
  /// *    `EXPIRED` - The invitee neither created a member nor rejected the
  /// invitation before the `ExpirationDate`.
  final String status;

  final NetworkSummary networkSummary;

  Invitation({
    this.invitationId,
    this.creationDate,
    this.expirationDate,
    this.status,
    this.networkSummary,
  });
  static Invitation fromJson(Map<String, dynamic> json) => Invitation();
}

/// An action to invite a specific AWS account to create a member and join the
/// network. The `InviteAction` is carried out when a `Proposal` is `APPROVED`.
class InviteAction {
  /// The AWS account ID to invite.
  final String principal;

  InviteAction({
    @required this.principal,
  });
  static InviteAction fromJson(Map<String, dynamic> json) => InviteAction();
}

class ListInvitationsOutput {
  /// The invitations for the network.
  final List<Invitation> invitations;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListInvitationsOutput({
    this.invitations,
    this.nextToken,
  });
  static ListInvitationsOutput fromJson(Map<String, dynamic> json) =>
      ListInvitationsOutput();
}

class ListMembersOutput {
  /// An array of `MemberSummary` objects. Each object contains details about a
  /// network member.
  final List<MemberSummary> members;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListMembersOutput({
    this.members,
    this.nextToken,
  });
  static ListMembersOutput fromJson(Map<String, dynamic> json) =>
      ListMembersOutput();
}

class ListNetworksOutput {
  /// An array of `NetworkSummary` objects that contain configuration properties
  /// for each network.
  final List<NetworkSummary> networks;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListNetworksOutput({
    this.networks,
    this.nextToken,
  });
  static ListNetworksOutput fromJson(Map<String, dynamic> json) =>
      ListNetworksOutput();
}

class ListNodesOutput {
  /// An array of `NodeSummary` objects that contain configuration properties
  /// for each node.
  final List<NodeSummary> nodes;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListNodesOutput({
    this.nodes,
    this.nextToken,
  });
  static ListNodesOutput fromJson(Map<String, dynamic> json) =>
      ListNodesOutput();
}

class ListProposalVotesOutput {
  ///  The listing of votes.
  final List<VoteSummary> proposalVotes;

  ///  The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListProposalVotesOutput({
    this.proposalVotes,
    this.nextToken,
  });
  static ListProposalVotesOutput fromJson(Map<String, dynamic> json) =>
      ListProposalVotesOutput();
}

class ListProposalsOutput {
  /// The summary of each proposal made on the network.
  final List<ProposalSummary> proposals;

  /// The pagination token that indicates the next set of results to retrieve.
  final String nextToken;

  ListProposalsOutput({
    this.proposals,
    this.nextToken,
  });
  static ListProposalsOutput fromJson(Map<String, dynamic> json) =>
      ListProposalsOutput();
}

/// Member configuration properties.
class Member {
  /// The unique identifier of the network to which the member belongs.
  final String networkId;

  /// The unique identifier of the member.
  final String id;

  /// The name of the member.
  final String name;

  /// An optional description for the member.
  final String description;

  /// Attributes relevant to a member for the blockchain framework that the
  /// Managed Blockchain network uses.
  final MemberFrameworkAttributes frameworkAttributes;

  /// The status of a member.
  ///
  /// *    `CREATING` - The AWS account is in the process of creating a member.
  ///
  /// *    `AVAILABLE` - The member has been created and can participate in the
  /// network.
  ///
  /// *    `CREATE_FAILED` - The AWS account attempted to create a member and
  /// creation failed.
  ///
  /// *    `DELETING` - The member and all associated resources are in the
  /// process of being deleted. Either the AWS account that owns the member
  /// deleted it, or the member is being deleted as the result of an `APPROVED`
  /// `PROPOSAL` to remove the member.
  ///
  /// *    `DELETED` - The member can no longer participate on the network and
  /// all associated resources are deleted. Either the AWS account that owns the
  /// member deleted it, or the member is being deleted as the result of an
  /// `APPROVED` `PROPOSAL` to remove the member.
  final String status;

  /// The date and time that the member was created.
  final DateTime creationDate;

  Member({
    this.networkId,
    this.id,
    this.name,
    this.description,
    this.frameworkAttributes,
    this.status,
    this.creationDate,
  });
  static Member fromJson(Map<String, dynamic> json) => Member();
}

/// Configuration properties of the member.
class MemberConfiguration {
  /// The name of the member.
  final String name;

  /// An optional description of the member.
  final String description;

  /// Configuration properties of the blockchain framework relevant to the
  /// member.
  final MemberFrameworkConfiguration frameworkConfiguration;

  MemberConfiguration({
    @required this.name,
    this.description,
    @required this.frameworkConfiguration,
  });
}

/// Attributes of Hyperledger Fabric for a member in a Managed Blockchain
/// network using the Hyperledger Fabric framework.
class MemberFabricAttributes {
  /// The user name for the initial administrator user for the member.
  final String adminUsername;

  /// The endpoint used to access the member's certificate authority.
  final String caEndpoint;

  MemberFabricAttributes({
    this.adminUsername,
    this.caEndpoint,
  });
  static MemberFabricAttributes fromJson(Map<String, dynamic> json) =>
      MemberFabricAttributes();
}

/// Configuration properties for Hyperledger Fabric for a member in a Managed
/// Blockchain network using the Hyperledger Fabric framework.
class MemberFabricConfiguration {
  /// The user name for the member's initial administrative user.
  final String adminUsername;

  /// The password for the member's initial administrative user. The
  /// `AdminPassword` must be at least eight characters long and no more than 32
  /// characters. It must contain at least one uppercase letter, one lowercase
  /// letter, and one digit. It cannot have a single quote(‘), double quote(“),
  /// forward slash(/), backward slash(), @, or a space.
  final String adminPassword;

  MemberFabricConfiguration({
    @required this.adminUsername,
    @required this.adminPassword,
  });
}

/// Attributes relevant to a member for the blockchain framework that the
/// Managed Blockchain network uses.
class MemberFrameworkAttributes {
  /// Attributes of Hyperledger Fabric relevant to a member on a Managed
  /// Blockchain network that uses Hyperledger Fabric.
  final MemberFabricAttributes fabric;

  MemberFrameworkAttributes({
    this.fabric,
  });
  static MemberFrameworkAttributes fromJson(Map<String, dynamic> json) =>
      MemberFrameworkAttributes();
}

/// Configuration properties relevant to a member for the blockchain framework
/// that the Managed Blockchain network uses.
class MemberFrameworkConfiguration {
  /// Attributes of Hyperledger Fabric for a member on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  final MemberFabricConfiguration fabric;

  MemberFrameworkConfiguration({
    this.fabric,
  });
}

/// A summary of configuration properties for a member.
class MemberSummary {
  /// The unique identifier of the member.
  final String id;

  /// The name of the member.
  final String name;

  /// An optional description of the member.
  final String description;

  /// The status of the member.
  ///
  /// *    `CREATING` - The AWS account is in the process of creating a member.
  ///
  /// *    `AVAILABLE` - The member has been created and can participate in the
  /// network.
  ///
  /// *    `CREATE_FAILED` - The AWS account attempted to create a member and
  /// creation failed.
  ///
  /// *    `DELETING` - The member and all associated resources are in the
  /// process of being deleted. Either the AWS account that owns the member
  /// deleted it, or the member is being deleted as the result of an `APPROVED`
  /// `PROPOSAL` to remove the member.
  ///
  /// *    `DELETED` - The member can no longer participate on the network and
  /// all associated resources are deleted. Either the AWS account that owns the
  /// member deleted it, or the member is being deleted as the result of an
  /// `APPROVED` `PROPOSAL` to remove the member.
  final String status;

  /// The date and time that the member was created.
  final DateTime creationDate;

  /// An indicator of whether the member is owned by your AWS account or a
  /// different AWS account.
  final bool isOwned;

  MemberSummary({
    this.id,
    this.name,
    this.description,
    this.status,
    this.creationDate,
    this.isOwned,
  });
  static MemberSummary fromJson(Map<String, dynamic> json) => MemberSummary();
}

/// Network configuration properties.
class Network {
  /// The unique identifier of the network.
  final String id;

  /// The name of the network.
  final String name;

  /// Attributes of the blockchain framework for the network.
  final String description;

  /// The blockchain framework that the network uses.
  final String framework;

  /// The version of the blockchain framework that the network uses.
  final String frameworkVersion;

  /// Attributes of the blockchain framework that the network uses.
  final NetworkFrameworkAttributes frameworkAttributes;

  /// The VPC endpoint service name of the VPC endpoint service of the network.
  /// Members use the VPC endpoint service name to create a VPC endpoint to
  /// access network resources.
  final String vpcEndpointServiceName;

  /// The voting rules for the network to decide if a proposal is accepted.
  final VotingPolicy votingPolicy;

  /// The current status of the network.
  final String status;

  /// The date and time that the network was created.
  final DateTime creationDate;

  Network({
    this.id,
    this.name,
    this.description,
    this.framework,
    this.frameworkVersion,
    this.frameworkAttributes,
    this.vpcEndpointServiceName,
    this.votingPolicy,
    this.status,
    this.creationDate,
  });
  static Network fromJson(Map<String, dynamic> json) => Network();
}

/// Attributes of Hyperledger Fabric for a network.
class NetworkFabricAttributes {
  /// The endpoint of the ordering service for the network.
  final String orderingServiceEndpoint;

  /// The edition of Amazon Managed Blockchain that Hyperledger Fabric uses. For
  /// more information, see
  /// [Amazon Managed Blockchain Pricing](https://aws.amazon.com/managed-blockchain/pricing/).
  final String edition;

  NetworkFabricAttributes({
    this.orderingServiceEndpoint,
    this.edition,
  });
  static NetworkFabricAttributes fromJson(Map<String, dynamic> json) =>
      NetworkFabricAttributes();
}

/// Hyperledger Fabric configuration properties for the network.
class NetworkFabricConfiguration {
  /// The edition of Amazon Managed Blockchain that the network uses. For more
  /// information, see
  /// [Amazon Managed Blockchain Pricing](https://aws.amazon.com/managed-blockchain/pricing/).
  final String edition;

  NetworkFabricConfiguration({
    @required this.edition,
  });
}

/// Attributes relevant to the network for the blockchain framework that the
/// network uses.
class NetworkFrameworkAttributes {
  /// Attributes of Hyperledger Fabric for a Managed Blockchain network that
  /// uses Hyperledger Fabric.
  final NetworkFabricAttributes fabric;

  NetworkFrameworkAttributes({
    this.fabric,
  });
  static NetworkFrameworkAttributes fromJson(Map<String, dynamic> json) =>
      NetworkFrameworkAttributes();
}

///  Configuration properties relevant to the network for the blockchain
/// framework that the network uses.
class NetworkFrameworkConfiguration {
  ///  Hyperledger Fabric configuration properties for a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  final NetworkFabricConfiguration fabric;

  NetworkFrameworkConfiguration({
    this.fabric,
  });
}

/// A summary of network configuration properties.
class NetworkSummary {
  /// The unique identifier of the network.
  final String id;

  /// The name of the network.
  final String name;

  /// An optional description of the network.
  final String description;

  /// The blockchain framework that the network uses.
  final String framework;

  /// The version of the blockchain framework that the network uses.
  final String frameworkVersion;

  /// The current status of the network.
  final String status;

  /// The date and time that the network was created.
  final DateTime creationDate;

  NetworkSummary({
    this.id,
    this.name,
    this.description,
    this.framework,
    this.frameworkVersion,
    this.status,
    this.creationDate,
  });
  static NetworkSummary fromJson(Map<String, dynamic> json) => NetworkSummary();
}

/// Configuration properties of a peer node.
class Node {
  /// The unique identifier of the network that the node is in.
  final String networkId;

  /// The unique identifier of the member to which the node belongs.
  final String memberId;

  /// The unique identifier of the node.
  final String id;

  /// The instance type of the node.
  final String instanceType;

  /// The Availability Zone in which the node exists.
  final String availabilityZone;

  /// Attributes of the blockchain framework being used.
  final NodeFrameworkAttributes frameworkAttributes;

  /// The status of the node.
  final String status;

  /// The date and time that the node was created.
  final DateTime creationDate;

  Node({
    this.networkId,
    this.memberId,
    this.id,
    this.instanceType,
    this.availabilityZone,
    this.frameworkAttributes,
    this.status,
    this.creationDate,
  });
  static Node fromJson(Map<String, dynamic> json) => Node();
}

/// Configuration properties of a peer node.
class NodeConfiguration {
  /// The Amazon Managed Blockchain instance type for the node.
  final String instanceType;

  /// The Availability Zone in which the node exists.
  final String availabilityZone;

  NodeConfiguration({
    @required this.instanceType,
    @required this.availabilityZone,
  });
}

/// Attributes of Hyperledger Fabric for a peer node on a Managed Blockchain
/// network that uses Hyperledger Fabric.
class NodeFabricAttributes {
  /// The endpoint that identifies the peer node for all services except peer
  /// channel-based event services.
  final String peerEndpoint;

  /// The endpoint that identifies the peer node for peer channel-based event
  /// services.
  final String peerEventEndpoint;

  NodeFabricAttributes({
    this.peerEndpoint,
    this.peerEventEndpoint,
  });
  static NodeFabricAttributes fromJson(Map<String, dynamic> json) =>
      NodeFabricAttributes();
}

/// Attributes relevant to a peer node on a Managed Blockchain network for the
/// blockchain framework that the network uses.
class NodeFrameworkAttributes {
  /// Attributes of Hyperledger Fabric for a peer node on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  final NodeFabricAttributes fabric;

  NodeFrameworkAttributes({
    this.fabric,
  });
  static NodeFrameworkAttributes fromJson(Map<String, dynamic> json) =>
      NodeFrameworkAttributes();
}

/// A summary of configuration properties for a peer node.
class NodeSummary {
  /// The unique identifier of the node.
  final String id;

  /// The status of the node.
  final String status;

  /// The date and time that the node was created.
  final DateTime creationDate;

  /// The Availability Zone in which the node exists.
  final String availabilityZone;

  /// The EC2 instance type for the node.
  final String instanceType;

  NodeSummary({
    this.id,
    this.status,
    this.creationDate,
    this.availabilityZone,
    this.instanceType,
  });
  static NodeSummary fromJson(Map<String, dynamic> json) => NodeSummary();
}

/// Properties of a proposal on a Managed Blockchain network.
class Proposal {
  /// The unique identifier of the proposal.
  final String proposalId;

  /// The unique identifier of the network for which the proposal is made.
  final String networkId;

  /// The description of the proposal.
  final String description;

  /// The actions to perform on the network if the proposal is `APPROVED`.
  final ProposalActions actions;

  /// The unique identifier of the member that created the proposal.
  final String proposedByMemberId;

  /// The name of the member that created the proposal.
  final String proposedByMemberName;

  /// The status of the proposal. Values are as follows:
  ///
  /// *    `IN_PROGRESS` - The proposal is active and open for member voting.
  ///
  /// *    `APPROVED` - The proposal was approved with sufficient `YES` votes
  /// among members according to the `VotingPolicy` specified for the `Network`.
  /// The specified proposal actions are carried out.
  ///
  /// *    `REJECTED` - The proposal was rejected with insufficient `YES` votes
  /// among members according to the `VotingPolicy` specified for the `Network`.
  /// The specified `ProposalActions` are not carried out.
  ///
  /// *    `EXPIRED` - Members did not cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// `ProposalActions` are not carried out.
  ///
  /// *    `ACTION_FAILED` - One or more of the specified `ProposalActions` in a
  /// proposal that was approved could not be completed because of an error.
  final String status;

  ///  The date and time that the proposal was created.
  final DateTime creationDate;

  ///  The date and time that the proposal expires. This is the `CreationDate`
  /// plus the `ProposalDurationInHours` that is specified in the
  /// `ProposalThresholdPolicy`. After this date and time, if members have not
  /// cast enough votes to determine the outcome according to the voting policy,
  /// the proposal is `EXPIRED` and `Actions` are not carried out.
  final DateTime expirationDate;

  ///  The current total of `YES` votes cast on the proposal by members.
  final int yesVoteCount;

  ///  The current total of `NO` votes cast on the proposal by members.
  final int noVoteCount;

  ///  The number of votes remaining to be cast on the proposal by members. In
  /// other words, the number of members minus the sum of `YES` votes and `NO`
  /// votes.
  final int outstandingVoteCount;

  Proposal({
    this.proposalId,
    this.networkId,
    this.description,
    this.actions,
    this.proposedByMemberId,
    this.proposedByMemberName,
    this.status,
    this.creationDate,
    this.expirationDate,
    this.yesVoteCount,
    this.noVoteCount,
    this.outstandingVoteCount,
  });
  static Proposal fromJson(Map<String, dynamic> json) => Proposal();
}

///  The actions to carry out if a proposal is `APPROVED`.
class ProposalActions {
  ///  The actions to perform for an `APPROVED` proposal to invite an AWS
  /// account to create a member and join the network.
  final List<InviteAction> invitations;

  ///  The actions to perform for an `APPROVED` proposal to remove a member from
  /// the network, which deletes the member and all associated member resources
  /// from the network.
  final List<RemoveAction> removals;

  ProposalActions({
    this.invitations,
    this.removals,
  });
  static ProposalActions fromJson(Map<String, dynamic> json) =>
      ProposalActions();
}

/// Properties of a proposal.
class ProposalSummary {
  ///  The unique identifier of the proposal.
  final String proposalId;

  ///  The description of the proposal.
  final String description;

  ///  The unique identifier of the member that created the proposal.
  final String proposedByMemberId;

  ///  The name of the member that created the proposal.
  final String proposedByMemberName;

  /// The status of the proposal. Values are as follows:
  ///
  /// *    `IN_PROGRESS` - The proposal is active and open for member voting.
  ///
  /// *    `APPROVED` - The proposal was approved with sufficient `YES` votes
  /// among members according to the `VotingPolicy` specified for the `Network`.
  /// The specified proposal actions are carried out.
  ///
  /// *    `REJECTED` - The proposal was rejected with insufficient `YES` votes
  /// among members according to the `VotingPolicy` specified for the `Network`.
  /// The specified `ProposalActions` are not carried out.
  ///
  /// *    `EXPIRED` - Members did not cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// `ProposalActions` are not carried out.
  ///
  /// *    `ACTION_FAILED` - One or more of the specified `ProposalActions` in a
  /// proposal that was approved could not be completed because of an error.
  final String status;

  ///  The date and time that the proposal was created.
  final DateTime creationDate;

  ///  The date and time that the proposal expires. This is the `CreationDate`
  /// plus the `ProposalDurationInHours` that is specified in the
  /// `ProposalThresholdPolicy`. After this date and time, if members have not
  /// cast enough votes to determine the outcome according to the voting policy,
  /// the proposal is `EXPIRED` and `Actions` are not carried out.
  final DateTime expirationDate;

  ProposalSummary({
    this.proposalId,
    this.description,
    this.proposedByMemberId,
    this.proposedByMemberName,
    this.status,
    this.creationDate,
    this.expirationDate,
  });
  static ProposalSummary fromJson(Map<String, dynamic> json) =>
      ProposalSummary();
}

class RejectInvitationOutput {
  RejectInvitationOutput();
  static RejectInvitationOutput fromJson(Map<String, dynamic> json) =>
      RejectInvitationOutput();
}

/// An action to remove a member from a Managed Blockchain network as the result
/// of a removal proposal that is `APPROVED`. The member and all associated
/// resources are deleted from the network.
class RemoveAction {
  /// The unique identifier of the member to remove.
  final String memberId;

  RemoveAction({
    @required this.memberId,
  });
  static RemoveAction fromJson(Map<String, dynamic> json) => RemoveAction();
}

class VoteOnProposalOutput {
  VoteOnProposalOutput();
  static VoteOnProposalOutput fromJson(Map<String, dynamic> json) =>
      VoteOnProposalOutput();
}

///  Properties of an individual vote that a member cast for a proposal.
class VoteSummary {
  ///  The vote value, either `YES` or `NO`.
  final String vote;

  ///  The name of the member that cast the vote.
  final String memberName;

  ///  The unique identifier of the member that cast the vote.
  final String memberId;

  VoteSummary({
    this.vote,
    this.memberName,
    this.memberId,
  });
  static VoteSummary fromJson(Map<String, dynamic> json) => VoteSummary();
}

///  The voting rules for the network to decide if a proposal is accepted
class VotingPolicy {
  /// Defines the rules for the network for voting on proposals, such as the
  /// percentage of `YES` votes required for the proposal to be approved and the
  /// duration of the proposal. The policy applies to all proposals and is
  /// specified when the network is created.
  final ApprovalThresholdPolicy approvalThresholdPolicy;

  VotingPolicy({
    this.approvalThresholdPolicy,
  });
  static VotingPolicy fromJson(Map<String, dynamic> json) => VotingPolicy();
}
