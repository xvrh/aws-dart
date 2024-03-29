import 'package:meta/meta.dart';

/// Amazon Managed Blockchain is a fully managed service for creating and
/// managing blockchain networks using open source frameworks. Blockchain allows
/// you to build applications where multiple parties can securely and
/// transparently run transactions and share data without the need for a
/// trusted, central authority. Currently, Managed Blockchain supports the
/// Hyperledger Fabric open source framework.
class ManagedBlockchainApi {
  final _client;
  ManagedBlockchainApi(client)
      : _client =
            client.configured('ManagedBlockchain', serializer: 'rest-json');

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
    var response_ = await _client.send('CreateMember', {
      'ClientRequestToken': clientRequestToken,
      'InvitationId': invitationId,
      'NetworkId': networkId,
      'MemberConfiguration': memberConfiguration,
    });
    return CreateMemberOutput.fromJson(response_);
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
    var response_ = await _client.send('CreateNetwork', {
      'ClientRequestToken': clientRequestToken,
      'Name': name,
      if (description != null) 'Description': description,
      'Framework': framework,
      'FrameworkVersion': frameworkVersion,
      if (frameworkConfiguration != null)
        'FrameworkConfiguration': frameworkConfiguration,
      'VotingPolicy': votingPolicy,
      'MemberConfiguration': memberConfiguration,
    });
    return CreateNetworkOutput.fromJson(response_);
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
    var response_ = await _client.send('CreateNode', {
      'ClientRequestToken': clientRequestToken,
      'NetworkId': networkId,
      'MemberId': memberId,
      'NodeConfiguration': nodeConfiguration,
    });
    return CreateNodeOutput.fromJson(response_);
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
    var response_ = await _client.send('CreateProposal', {
      'ClientRequestToken': clientRequestToken,
      'NetworkId': networkId,
      'MemberId': memberId,
      'Actions': actions,
      if (description != null) 'Description': description,
    });
    return CreateProposalOutput.fromJson(response_);
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
    var response_ = await _client.send('DeleteMember', {
      'NetworkId': networkId,
      'MemberId': memberId,
    });
    return DeleteMemberOutput.fromJson(response_);
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
    var response_ = await _client.send('DeleteNode', {
      'NetworkId': networkId,
      'MemberId': memberId,
      'NodeId': nodeId,
    });
    return DeleteNodeOutput.fromJson(response_);
  }

  /// Returns detailed information about a member.
  ///
  /// [networkId]: The unique identifier of the network to which the member
  /// belongs.
  ///
  /// [memberId]: The unique identifier of the member.
  Future<GetMemberOutput> getMember(
      {@required String networkId, @required String memberId}) async {
    var response_ = await _client.send('GetMember', {
      'NetworkId': networkId,
      'MemberId': memberId,
    });
    return GetMemberOutput.fromJson(response_);
  }

  /// Returns detailed information about a network.
  ///
  /// [networkId]: The unique identifier of the network to get information
  /// about.
  Future<GetNetworkOutput> getNetwork(String networkId) async {
    var response_ = await _client.send('GetNetwork', {
      'NetworkId': networkId,
    });
    return GetNetworkOutput.fromJson(response_);
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
    var response_ = await _client.send('GetNode', {
      'NetworkId': networkId,
      'MemberId': memberId,
      'NodeId': nodeId,
    });
    return GetNodeOutput.fromJson(response_);
  }

  /// Returns detailed information about a proposal.
  ///
  /// [networkId]: The unique identifier of the network for which the proposal
  /// is made.
  ///
  /// [proposalId]: The unique identifier of the proposal.
  Future<GetProposalOutput> getProposal(
      {@required String networkId, @required String proposalId}) async {
    var response_ = await _client.send('GetProposal', {
      'NetworkId': networkId,
      'ProposalId': proposalId,
    });
    return GetProposalOutput.fromJson(response_);
  }

  /// Returns a listing of all invitations made on the specified network.
  ///
  /// [maxResults]: The maximum number of invitations to return.
  ///
  /// [nextToken]: The pagination token that indicates the next set of results
  /// to retrieve.
  Future<ListInvitationsOutput> listInvitations(
      {int maxResults, String nextToken}) async {
    var response_ = await _client.send('ListInvitations', {
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListInvitationsOutput.fromJson(response_);
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
    var response_ = await _client.send('ListMembers', {
      'NetworkId': networkId,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
      if (isOwned != null) 'IsOwned': isOwned,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListMembersOutput.fromJson(response_);
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
    var response_ = await _client.send('ListNetworks', {
      if (name != null) 'Name': name,
      if (framework != null) 'Framework': framework,
      if (status != null) 'Status': status,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListNetworksOutput.fromJson(response_);
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
    var response_ = await _client.send('ListNodes', {
      'NetworkId': networkId,
      'MemberId': memberId,
      if (status != null) 'Status': status,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListNodesOutput.fromJson(response_);
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
    var response_ = await _client.send('ListProposalVotes', {
      'NetworkId': networkId,
      'ProposalId': proposalId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListProposalVotesOutput.fromJson(response_);
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
    var response_ = await _client.send('ListProposals', {
      'NetworkId': networkId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListProposalsOutput.fromJson(response_);
  }

  /// Rejects an invitation to join a network. This action can be called by a
  /// principal in an AWS account that has received an invitation to create a
  /// member and join a network.
  ///
  /// [invitationId]: The unique identifier of the invitation to reject.
  Future<RejectInvitationOutput> rejectInvitation(String invitationId) async {
    var response_ = await _client.send('RejectInvitation', {
      'InvitationId': invitationId,
    });
    return RejectInvitationOutput.fromJson(response_);
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
    var response_ = await _client.send('VoteOnProposal', {
      'NetworkId': networkId,
      'ProposalId': proposalId,
      'VoterMemberId': voterMemberId,
      'Vote': vote,
    });
    return VoteOnProposalOutput.fromJson(response_);
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
      ApprovalThresholdPolicy(
        thresholdPercentage: json.containsKey('ThresholdPercentage')
            ? json['ThresholdPercentage'] as int
            : null,
        proposalDurationInHours: json.containsKey('ProposalDurationInHours')
            ? json['ProposalDurationInHours'] as int
            : null,
        thresholdComparator: json.containsKey('ThresholdComparator')
            ? json['ThresholdComparator'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class CreateMemberOutput {
  /// The unique identifier of the member.
  final String memberId;

  CreateMemberOutput({
    this.memberId,
  });
  static CreateMemberOutput fromJson(Map<String, dynamic> json) =>
      CreateMemberOutput(
        memberId:
            json.containsKey('MemberId') ? json['MemberId'] as String : null,
      );
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
      CreateNetworkOutput(
        networkId:
            json.containsKey('NetworkId') ? json['NetworkId'] as String : null,
        memberId:
            json.containsKey('MemberId') ? json['MemberId'] as String : null,
      );
}

class CreateNodeOutput {
  /// The unique identifier of the node.
  final String nodeId;

  CreateNodeOutput({
    this.nodeId,
  });
  static CreateNodeOutput fromJson(Map<String, dynamic> json) =>
      CreateNodeOutput(
        nodeId: json.containsKey('NodeId') ? json['NodeId'] as String : null,
      );
}

class CreateProposalOutput {
  /// The unique identifier of the proposal.
  final String proposalId;

  CreateProposalOutput({
    this.proposalId,
  });
  static CreateProposalOutput fromJson(Map<String, dynamic> json) =>
      CreateProposalOutput(
        proposalId: json.containsKey('ProposalId')
            ? json['ProposalId'] as String
            : null,
      );
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
  static GetMemberOutput fromJson(Map<String, dynamic> json) => GetMemberOutput(
        member:
            json.containsKey('Member') ? Member.fromJson(json['Member']) : null,
      );
}

class GetNetworkOutput {
  /// An object containing network configuration parameters.
  final Network network;

  GetNetworkOutput({
    this.network,
  });
  static GetNetworkOutput fromJson(Map<String, dynamic> json) =>
      GetNetworkOutput(
        network: json.containsKey('Network')
            ? Network.fromJson(json['Network'])
            : null,
      );
}

class GetNodeOutput {
  /// Properties of the node configuration.
  final Node node;

  GetNodeOutput({
    this.node,
  });
  static GetNodeOutput fromJson(Map<String, dynamic> json) => GetNodeOutput(
        node: json.containsKey('Node') ? Node.fromJson(json['Node']) : null,
      );
}

class GetProposalOutput {
  /// Information about a proposal.
  final Proposal proposal;

  GetProposalOutput({
    this.proposal,
  });
  static GetProposalOutput fromJson(Map<String, dynamic> json) =>
      GetProposalOutput(
        proposal: json.containsKey('Proposal')
            ? Proposal.fromJson(json['Proposal'])
            : null,
      );
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
  static Invitation fromJson(Map<String, dynamic> json) => Invitation(
        invitationId: json.containsKey('InvitationId')
            ? json['InvitationId'] as String
            : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        expirationDate: json.containsKey('ExpirationDate')
            ? DateTime.parse(json['ExpirationDate'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        networkSummary: json.containsKey('NetworkSummary')
            ? NetworkSummary.fromJson(json['NetworkSummary'])
            : null,
      );
}

/// An action to invite a specific AWS account to create a member and join the
/// network. The `InviteAction` is carried out when a `Proposal` is `APPROVED`.
class InviteAction {
  /// The AWS account ID to invite.
  final String principal;

  InviteAction({
    @required this.principal,
  });
  static InviteAction fromJson(Map<String, dynamic> json) => InviteAction(
        principal: json['Principal'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      ListInvitationsOutput(
        invitations: json.containsKey('Invitations')
            ? (json['Invitations'] as List)
                .map((e) => Invitation.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListMembersOutput(
        members: json.containsKey('Members')
            ? (json['Members'] as List)
                .map((e) => MemberSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListNetworksOutput(
        networks: json.containsKey('Networks')
            ? (json['Networks'] as List)
                .map((e) => NetworkSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
  static ListNodesOutput fromJson(Map<String, dynamic> json) => ListNodesOutput(
        nodes: json.containsKey('Nodes')
            ? (json['Nodes'] as List)
                .map((e) => NodeSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListProposalVotesOutput(
        proposalVotes: json.containsKey('ProposalVotes')
            ? (json['ProposalVotes'] as List)
                .map((e) => VoteSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
      ListProposalsOutput(
        proposals: json.containsKey('Proposals')
            ? (json['Proposals'] as List)
                .map((e) => ProposalSummary.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
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
  static Member fromJson(Map<String, dynamic> json) => Member(
        networkId:
            json.containsKey('NetworkId') ? json['NetworkId'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        frameworkAttributes: json.containsKey('FrameworkAttributes')
            ? MemberFrameworkAttributes.fromJson(json['FrameworkAttributes'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      MemberFabricAttributes(
        adminUsername: json.containsKey('AdminUsername')
            ? json['AdminUsername'] as String
            : null,
        caEndpoint: json.containsKey('CaEndpoint')
            ? json['CaEndpoint'] as String
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      MemberFrameworkAttributes(
        fabric: json.containsKey('Fabric')
            ? MemberFabricAttributes.fromJson(json['Fabric'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static MemberSummary fromJson(Map<String, dynamic> json) => MemberSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        isOwned: json.containsKey('IsOwned') ? json['IsOwned'] as bool : null,
      );
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
  static Network fromJson(Map<String, dynamic> json) => Network(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        framework:
            json.containsKey('Framework') ? json['Framework'] as String : null,
        frameworkVersion: json.containsKey('FrameworkVersion')
            ? json['FrameworkVersion'] as String
            : null,
        frameworkAttributes: json.containsKey('FrameworkAttributes')
            ? NetworkFrameworkAttributes.fromJson(json['FrameworkAttributes'])
            : null,
        vpcEndpointServiceName: json.containsKey('VpcEndpointServiceName')
            ? json['VpcEndpointServiceName'] as String
            : null,
        votingPolicy: json.containsKey('VotingPolicy')
            ? VotingPolicy.fromJson(json['VotingPolicy'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
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
      NetworkFabricAttributes(
        orderingServiceEndpoint: json.containsKey('OrderingServiceEndpoint')
            ? json['OrderingServiceEndpoint'] as String
            : null,
        edition: json.containsKey('Edition') ? json['Edition'] as String : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      NetworkFrameworkAttributes(
        fabric: json.containsKey('Fabric')
            ? NetworkFabricAttributes.fromJson(json['Fabric'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static NetworkSummary fromJson(Map<String, dynamic> json) => NetworkSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        framework:
            json.containsKey('Framework') ? json['Framework'] as String : null,
        frameworkVersion: json.containsKey('FrameworkVersion')
            ? json['FrameworkVersion'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
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
  static Node fromJson(Map<String, dynamic> json) => Node(
        networkId:
            json.containsKey('NetworkId') ? json['NetworkId'] as String : null,
        memberId:
            json.containsKey('MemberId') ? json['MemberId'] as String : null,
        id: json.containsKey('Id') ? json['Id'] as String : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        frameworkAttributes: json.containsKey('FrameworkAttributes')
            ? NodeFrameworkAttributes.fromJson(json['FrameworkAttributes'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
      );
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
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
      NodeFabricAttributes(
        peerEndpoint: json.containsKey('PeerEndpoint')
            ? json['PeerEndpoint'] as String
            : null,
        peerEventEndpoint: json.containsKey('PeerEventEndpoint')
            ? json['PeerEventEndpoint'] as String
            : null,
      );
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
      NodeFrameworkAttributes(
        fabric: json.containsKey('Fabric')
            ? NodeFabricAttributes.fromJson(json['Fabric'])
            : null,
      );
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
  static NodeSummary fromJson(Map<String, dynamic> json) => NodeSummary(
        id: json.containsKey('Id') ? json['Id'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        availabilityZone: json.containsKey('AvailabilityZone')
            ? json['AvailabilityZone'] as String
            : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
      );
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
  static Proposal fromJson(Map<String, dynamic> json) => Proposal(
        proposalId: json.containsKey('ProposalId')
            ? json['ProposalId'] as String
            : null,
        networkId:
            json.containsKey('NetworkId') ? json['NetworkId'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        actions: json.containsKey('Actions')
            ? ProposalActions.fromJson(json['Actions'])
            : null,
        proposedByMemberId: json.containsKey('ProposedByMemberId')
            ? json['ProposedByMemberId'] as String
            : null,
        proposedByMemberName: json.containsKey('ProposedByMemberName')
            ? json['ProposedByMemberName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        expirationDate: json.containsKey('ExpirationDate')
            ? DateTime.parse(json['ExpirationDate'])
            : null,
        yesVoteCount: json.containsKey('YesVoteCount')
            ? json['YesVoteCount'] as int
            : null,
        noVoteCount:
            json.containsKey('NoVoteCount') ? json['NoVoteCount'] as int : null,
        outstandingVoteCount: json.containsKey('OutstandingVoteCount')
            ? json['OutstandingVoteCount'] as int
            : null,
      );
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
  static ProposalActions fromJson(Map<String, dynamic> json) => ProposalActions(
        invitations: json.containsKey('Invitations')
            ? (json['Invitations'] as List)
                .map((e) => InviteAction.fromJson(e))
                .toList()
            : null,
        removals: json.containsKey('Removals')
            ? (json['Removals'] as List)
                .map((e) => RemoveAction.fromJson(e))
                .toList()
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static ProposalSummary fromJson(Map<String, dynamic> json) => ProposalSummary(
        proposalId: json.containsKey('ProposalId')
            ? json['ProposalId'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        proposedByMemberId: json.containsKey('ProposedByMemberId')
            ? json['ProposedByMemberId'] as String
            : null,
        proposedByMemberName: json.containsKey('ProposedByMemberName')
            ? json['ProposedByMemberName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationDate: json.containsKey('CreationDate')
            ? DateTime.parse(json['CreationDate'])
            : null,
        expirationDate: json.containsKey('ExpirationDate')
            ? DateTime.parse(json['ExpirationDate'])
            : null,
      );
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
  static RemoveAction fromJson(Map<String, dynamic> json) => RemoveAction(
        memberId: json['MemberId'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
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
  static VoteSummary fromJson(Map<String, dynamic> json) => VoteSummary(
        vote: json.containsKey('Vote') ? json['Vote'] as String : null,
        memberName: json.containsKey('MemberName')
            ? json['MemberName'] as String
            : null,
        memberId:
            json.containsKey('MemberId') ? json['MemberId'] as String : null,
      );
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
  static VotingPolicy fromJson(Map<String, dynamic> json) => VotingPolicy(
        approvalThresholdPolicy: json.containsKey('ApprovalThresholdPolicy')
            ? ApprovalThresholdPolicy.fromJson(json['ApprovalThresholdPolicy'])
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}
