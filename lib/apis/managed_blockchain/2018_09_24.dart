import 'package:meta/meta.dart';

/// Amazon Managed Blockchain is a fully managed service for creating and
/// managing blockchain networks using open source frameworks. Blockchain allows
/// you to build applications where multiple parties can securely and
/// transparently run transactions and share data without the need for a
/// trusted, central authority. Currently, Managed Blockchain supports the
/// Hyperledger Fabric open source framework.
class ManagedBlockchainApi {
  /// Creates a member within a Managed Blockchain network.
  Future<void> createMember(
      {@required String clientRequestToken,
      @required String invitationId,
      @required String networkId,
      @required MemberConfiguration memberConfiguration}) async {}

  /// Creates a new blockchain network using Amazon Managed Blockchain.
  Future<void> createNetwork(
      {@required String clientRequestToken,
      @required String name,
      String description,
      @required String framework,
      @required String frameworkVersion,
      NetworkFrameworkConfiguration frameworkConfiguration,
      @required VotingPolicy votingPolicy,
      @required MemberConfiguration memberConfiguration}) async {}

  /// Creates a peer node in a member.
  Future<void> createNode(
      {@required String clientRequestToken,
      @required String networkId,
      @required String memberId,
      @required NodeConfiguration nodeConfiguration}) async {}

  /// Creates a proposal for a change to the network that other members of the
  /// network can vote on, for example, a proposal to add a new member to the
  /// network. Any member can create a proposal.
  Future<void> createProposal(
      {@required String clientRequestToken,
      @required String networkId,
      @required String memberId,
      @required ProposalActions actions,
      String description}) async {}

  /// Deletes a member. Deleting a member removes the member and all associated
  /// resources from the network. `DeleteMember` can only be called for a
  /// specified `MemberId` if the principal performing the action is associated
  /// with the AWS account that owns the member. In all other cases, the
  /// `DeleteMember` action is carried out as the result of an approved proposal
  /// to remove a member. If `MemberId` is the last member in a network
  /// specified by the last AWS account, the network is deleted also.
  Future<void> deleteMember(
      {@required String networkId, @required String memberId}) async {}

  /// Deletes a peer node from a member that your AWS account owns. All data on
  /// the node is lost and cannot be recovered.
  Future<void> deleteNode(
      {@required String networkId,
      @required String memberId,
      @required String nodeId}) async {}

  /// Returns detailed information about a member.
  Future<void> getMember(
      {@required String networkId, @required String memberId}) async {}

  /// Returns detailed information about a network.
  Future<void> getNetwork(String networkId) async {}

  /// Returns detailed information about a peer node.
  Future<void> getNode(
      {@required String networkId,
      @required String memberId,
      @required String nodeId}) async {}

  /// Returns detailed information about a proposal.
  Future<void> getProposal(
      {@required String networkId, @required String proposalId}) async {}

  /// Returns a listing of all invitations made on the specified network.
  Future<void> listInvitations({int maxResults, String nextToken}) async {}

  /// Returns a listing of the members in a network and properties of their
  /// configurations.
  Future<void> listMembers(String networkId,
      {String name,
      String status,
      bool isOwned,
      int maxResults,
      String nextToken}) async {}

  /// Returns information about the networks in which the current AWS account
  /// has members.
  Future<void> listNetworks(
      {String name,
      String framework,
      String status,
      int maxResults,
      String nextToken}) async {}

  /// Returns information about the nodes within a network.
  Future<void> listNodes(
      {@required String networkId,
      @required String memberId,
      String status,
      int maxResults,
      String nextToken}) async {}

  /// Returns the listing of votes for a specified proposal, including the value
  /// of each vote and the unique identifier of the member that cast the vote.
  Future<void> listProposalVotes(
      {@required String networkId,
      @required String proposalId,
      int maxResults,
      String nextToken}) async {}

  /// Returns a listing of proposals for the network.
  Future<void> listProposals(String networkId,
      {int maxResults, String nextToken}) async {}

  /// Rejects an invitation to join a network. This action can be called by a
  /// principal in an AWS account that has received an invitation to create a
  /// member and join a network.
  Future<void> rejectInvitation(String invitationId) async {}

  /// Casts a vote for a specified `ProposalId` on behalf of a member. The
  /// member to vote as, specified by `VoterMemberId`, must be in the same AWS
  /// account as the principal that calls the action.
  Future<void> voteOnProposal(
      {@required String networkId,
      @required String proposalId,
      @required String voterMemberId,
      @required String vote}) async {}
}

class ApprovalThresholdPolicy {}

class CreateMemberOutput {}

class CreateNetworkOutput {}

class CreateNodeOutput {}

class CreateProposalOutput {}

class DeleteMemberOutput {}

class DeleteNodeOutput {}

class GetMemberOutput {}

class GetNetworkOutput {}

class GetNodeOutput {}

class GetProposalOutput {}

class Invitation {}

class InviteAction {}

class ListInvitationsOutput {}

class ListMembersOutput {}

class ListNetworksOutput {}

class ListNodesOutput {}

class ListProposalVotesOutput {}

class ListProposalsOutput {}

class Member {}

class MemberConfiguration {}

class MemberFabricAttributes {}

class MemberFabricConfiguration {}

class MemberFrameworkAttributes {}

class MemberFrameworkConfiguration {}

class MemberSummary {}

class Network {}

class NetworkFabricAttributes {}

class NetworkFabricConfiguration {}

class NetworkFrameworkAttributes {}

class NetworkFrameworkConfiguration {}

class NetworkSummary {}

class Node {}

class NodeConfiguration {}

class NodeFabricAttributes {}

class NodeFrameworkAttributes {}

class NodeSummary {}

class Proposal {}

class ProposalActions {}

class ProposalSummary {}

class RejectInvitationOutput {}

class RemoveAction {}

class VoteOnProposalOutput {}

class VoteSummary {}

class VotingPolicy {}
