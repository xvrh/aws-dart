import 'package:meta/meta.dart';
import 'dart:typed_data';

/// Amazon GameLift Service
///
///  Amazon GameLift is a managed service for developers who need a scalable,
/// dedicated server solution for their multiplayer games. Use Amazon GameLift
/// for these tasks: (1) set up computing resources and deploy your game
/// servers, (2) run game sessions and get players into games, (3) automatically
/// scale your resources to meet player demand and manage costs, and (4) track
/// in-depth metrics on game server performance and player usage.
///
/// When setting up hosting resources, you can deploy your custom game server or
/// use the Amazon GameLift Realtime Servers. Realtime Servers gives you the
/// ability to quickly stand up lightweight, efficient game servers with the
/// core Amazon GameLift infrastructure already built in.
///
///  **Get Amazon GameLift Tools and Resources**
///
/// This reference guide describes the low-level service API for Amazon GameLift
/// and provides links to language-specific SDK reference topics. See also
/// [Amazon GameLift Tools and
/// Resources](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-components.html).
///
///  **API Summary**
///
/// The Amazon GameLift service API includes two key sets of actions:
///
/// *   Manage game sessions and player access -- Integrate this functionality
/// into game client services in order to create new game sessions, retrieve
/// information on existing game sessions; reserve a player slot in a game
/// session, request matchmaking, etc.
///
/// *   Configure and manage game server resources -- Manage your Amazon
/// GameLift hosting resources, including builds, scripts, fleets, queues, and
/// aliases. Set up matchmakers, configure auto-scaling, retrieve game logs, and
/// get hosting and game metrics.
///
///
///   **[Task-based list of API
/// actions](https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html)**
class GameLiftApi {
  /// Registers a player's acceptance or rejection of a proposed FlexMatch
  /// match. A matchmaking configuration may require player acceptance; if so,
  /// then matches built with that configuration cannot be completed unless all
  /// players accept the proposed match within a specified time limit.
  ///
  /// When FlexMatch builds a match, all the matchmaking tickets involved in the
  /// proposed match are placed into status `REQUIRES_ACCEPTANCE`. This is a
  /// trigger for your game to get acceptance from all players in the ticket.
  /// Acceptances are only valid for tickets when they are in this status; all
  /// other acceptances result in an error.
  ///
  /// To register acceptance, specify the ticket ID, a response, and one or more
  /// players. Once all players have registered acceptance, the matchmaking
  /// tickets advance to status `PLACING`, where a new game session is created
  /// for the match.
  ///
  /// If any player rejects the match, or if acceptances are not received before
  /// a specified timeout, the proposed match is dropped. The matchmaking
  /// tickets are then handled in one of two ways: For tickets where one or more
  /// players rejected the match, the ticket status is returned to `SEARCHING`
  /// to find a new match. For tickets where one or more players failed to
  /// respond, the ticket status is set to `CANCELLED`, and processing is
  /// terminated. A new matchmaking request for these players can be submitted
  /// as needed.
  ///
  ///  **Learn more**
  ///
  ///   [Add FlexMatch to a Game
  /// Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///   [FlexMatch Events
  /// Reference](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-events.html)
  ///
  ///  **Related operations**
  ///
  /// *    StartMatchmaking
  ///
  /// *    DescribeMatchmaking
  ///
  /// *    StopMatchmaking
  ///
  /// *    AcceptMatch
  ///
  /// *    StartMatchBackfill
  Future<void> acceptMatch(
      {@required String ticketId,
      @required List<String> playerIds,
      @required String acceptanceType}) async {}

  /// Creates an alias for a fleet. In most situations, you can use an alias ID
  /// in place of a fleet ID. By using a fleet alias instead of a specific fleet
  /// ID, you can switch gameplay and players to a new fleet without changing
  /// your game client or other game components. For example, for games in
  /// production, using an alias allows you to seamlessly redirect your player
  /// base to a new game server update.
  ///
  /// Amazon GameLift supports two types of routing strategies for aliases:
  /// simple and terminal. A simple alias points to an active fleet. A terminal
  /// alias is used to display messaging or link to a URL instead of routing
  /// players to an active fleet. For example, you might use a terminal alias
  /// when a game version is no longer supported and you want to direct players
  /// to an upgrade site.
  ///
  /// To create a fleet alias, specify an alias name, routing strategy, and
  /// optional description. Each simple alias can point to only one fleet, but a
  /// fleet can have multiple aliases. If successful, a new alias record is
  /// returned, including an alias ID, which you can reference when creating a
  /// game session. You can reassign an alias to another fleet by calling
  /// `UpdateAlias`.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> createAlias(
      {@required String name,
      String description,
      @required RoutingStrategy routingStrategy}) async {}

  /// Creates a new Amazon GameLift build record for your game server binary
  /// files and points to the location of your game server build files in an
  /// Amazon Simple Storage Service (Amazon S3) location.
  ///
  /// Game server binaries must be combined into a `.zip` file for use with
  /// Amazon GameLift.
  ///
  ///  To create new builds quickly and easily, use the AWS CLI command
  /// **[upload-build](https://docs.aws.amazon.com/cli/latest/reference/gamelift/upload-build.html)**
  /// . This helper command uploads your build and creates a new build record in
  /// one step, and automatically handles the necessary permissions.
  ///
  /// The `CreateBuild` operation should be used only when you need to manually
  /// upload your build files, as in the following scenarios:
  ///
  /// *   Store a build file in an Amazon S3 bucket under your own AWS account.
  /// To use this option, you must first give Amazon GameLift access to that
  /// Amazon S3 bucket. To create a new build record using files in your Amazon
  /// S3 bucket, call `CreateBuild` and specify a build name, operating system,
  /// and the storage location of your game build.
  ///
  /// *   Upload a build file directly to Amazon GameLift's Amazon S3 account.
  /// To use this option, you first call `CreateBuild` with a build name and
  /// operating system. This action creates a new build record and returns an
  /// Amazon S3 storage location (bucket and key only) and temporary access
  /// credentials. Use the credentials to manually upload your build file to the
  /// storage location (see the Amazon S3 topic [Uploading
  /// Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadingObjects.html)).
  /// You can upload files to a location only once.
  ///
  ///
  /// If successful, this operation creates a new build record with a unique
  /// build ID and places it in `INITIALIZED` status. You can use DescribeBuild
  /// to check the status of your build. A build must be in `READY` status
  /// before it can be used to create fleets.
  ///
  ///  **Learn more**
  ///
  ///  [Uploading Your
  /// Game](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html)
  ///
  ///   [Create a Build with Files in Amazon
  /// S3](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> createBuild(
      {String name,
      String version,
      S3Location storageLocation,
      String operatingSystem}) async {}

  /// Creates a new fleet to run your game servers. whether they are custom game
  /// builds or Realtime Servers with game-specific script. A fleet is a set of
  /// Amazon Elastic Compute Cloud (Amazon EC2) instances, each of which can
  /// host multiple game sessions. When creating a fleet, you choose the
  /// hardware specifications, set some configuration options, and specify the
  /// game server to deploy on the new fleet.
  ///
  /// To create a new fleet, you must provide the following: (1) a fleet name,
  /// (2) an EC2 instance type and fleet type (spot or on-demand), (3) the build
  /// ID for your game build or script ID if using Realtime Servers, and (4) a
  /// run-time configuration, which determines how game servers will run on each
  /// instance in the fleet.
  ///
  ///  When creating a Realtime Servers fleet, we recommend using a minimal
  /// version of the Realtime script (see this  [working code
  /// example](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-script.html#realtime-script-examples)
  /// ). This will make it much easier to troubleshoot any fleet creation
  /// issues. Once the fleet is active, you can update your Realtime script as
  /// needed.
  ///
  /// If the `CreateFleet` call is successful, Amazon GameLift performs the
  /// following tasks. You can track the process of a fleet by checking the
  /// fleet status or by monitoring fleet creation events:
  ///
  /// *   Creates a fleet record. Status: `NEW`.
  ///
  /// *   Begins writing events to the fleet event log, which can be accessed in
  /// the Amazon GameLift console.
  ///
  ///     Sets the fleet's target capacity to 1 (desired instances), which
  /// triggers Amazon GameLift to start one new EC2 instance.
  ///
  /// *   Downloads the game build or Realtime script to the new instance and
  /// installs it. Statuses: `DOWNLOADING`, `VALIDATING`, `BUILDING`.
  ///
  /// *   Starts launching server processes on the instance. If the fleet is
  /// configured to run multiple server processes per instance, Amazon GameLift
  /// staggers each launch by a few seconds. Status: `ACTIVATING`.
  ///
  /// *   Sets the fleet's status to `ACTIVE` as soon as one server process is
  /// ready to host a game session.
  ///
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html)
  ///
  ///   [Debug Fleet Creation
  /// Issues](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> createFleet(
      {@required String name,
      String description,
      String buildId,
      String scriptId,
      String serverLaunchPath,
      String serverLaunchParameters,
      List<String> logPaths,
      @required String ec2InstanceType,
      List<IpPermission> ec2InboundPermissions,
      String newGameSessionProtectionPolicy,
      RuntimeConfiguration runtimeConfiguration,
      ResourceCreationLimitPolicy resourceCreationLimitPolicy,
      List<String> metricGroups,
      String peerVpcAwsAccountId,
      String peerVpcId,
      String fleetType,
      String instanceRoleArn,
      CertificateConfiguration certificateConfiguration}) async {}

  /// Creates a multiplayer game session for players. This action creates a game
  /// session record and assigns an available server process in the specified
  /// fleet to host the game session. A fleet must have an `ACTIVE` status
  /// before a game session can be created in it.
  ///
  /// To create a game session, specify either fleet ID or alias ID and indicate
  /// a maximum number of players to allow in the game session. You can also
  /// provide a name and game-specific properties for this game session. If
  /// successful, a GameSession object is returned containing the game session
  /// properties and other settings you specified.
  ///
  ///  **Idempotency tokens.** You can add a token that uniquely identifies game
  /// session requests. This is useful for ensuring that game session requests
  /// are idempotent. Multiple requests with the same idempotency token are
  /// processed only once; subsequent requests return the original result. All
  /// response values are the same with the exception of game session status,
  /// which may change.
  ///
  ///  **Resource creation limits.** If you are creating a game session on a
  /// fleet with a resource creation limit policy in force, then you must
  /// specify a creator ID. Without this ID, Amazon GameLift has no way to
  /// evaluate the policy for this new game session request.
  ///
  ///  **Player acceptance policy.** By default, newly created game sessions are
  /// open to new players. You can restrict new player access by using
  /// UpdateGameSession to change the game session's player session creation
  /// policy.
  ///
  ///  **Game session logs.** Logs are retained for all active game sessions for
  /// 14 days. To access the logs, call GetGameSessionLogUrl to download the log
  /// files.
  ///
  ///  _Available in Amazon GameLift Local._
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> createGameSession(int maximumPlayerSessionCount,
      {String fleetId,
      String aliasId,
      String name,
      List<GameProperty> gameProperties,
      String creatorId,
      String gameSessionId,
      String idempotencyToken,
      String gameSessionData}) async {}

  /// Establishes a new queue for processing requests to place new game
  /// sessions. A queue identifies where new game sessions can be hosted -- by
  /// specifying a list of destinations (fleets or aliases) -- and how long
  /// requests can wait in the queue before timing out. You can set up a queue
  /// to try to place game sessions on fleets in multiple regions. To add
  /// placement requests to a queue, call StartGameSessionPlacement and
  /// reference the queue name.
  ///
  ///  **Destination order.** When processing a request for a game session,
  /// Amazon GameLift tries each destination in order until it finds one with
  /// available resources to host the new game session. A queue's default order
  /// is determined by how destinations are listed. The default order is
  /// overridden when a game session placement request provides player latency
  /// information. Player latency information enables Amazon GameLift to
  /// prioritize destinations where players report the lowest average latency,
  /// as a result placing the new game session where the majority of players
  /// will have the best possible gameplay experience.
  ///
  ///  **Player latency policies.** For placement requests containing player
  /// latency information, use player latency policies to protect individual
  /// players from very high latencies. With a latency cap, even when a
  /// destination can deliver a low latency for most players, the game is not
  /// placed where any individual player is reporting latency higher than a
  /// policy's maximum. A queue can have multiple latency policies, which are
  /// enforced consecutively starting with the policy with the lowest latency
  /// cap. Use multiple policies to gradually relax latency controls; for
  /// example, you might set a policy with a low latency cap for the first 60
  /// seconds, a second policy with a higher cap for the next 60 seconds, etc.
  ///
  /// To create a new queue, provide a name, timeout value, a list of
  /// destinations and, if desired, a set of latency policies. If successful, a
  /// new queue object is returned.
  ///
  /// *    CreateGameSessionQueue
  ///
  /// *    DescribeGameSessionQueues
  ///
  /// *    UpdateGameSessionQueue
  ///
  /// *    DeleteGameSessionQueue
  Future<void> createGameSessionQueue(String name,
      {int timeoutInSeconds,
      List<PlayerLatencyPolicy> playerLatencyPolicies,
      List<GameSessionQueueDestination> destinations}) async {}

  /// Defines a new matchmaking configuration for use with FlexMatch. A
  /// matchmaking configuration sets out guidelines for matching players and
  /// getting the matches into games. You can set up multiple matchmaking
  /// configurations to handle the scenarios needed for your game. Each
  /// matchmaking ticket (StartMatchmaking or StartMatchBackfill) specifies a
  /// configuration for the match and provides player attributes to support the
  /// configuration being used.
  ///
  /// To create a matchmaking configuration, at a minimum you must specify the
  /// following: configuration name; a rule set that governs how to evaluate
  /// players and find acceptable matches; a game session queue to use when
  /// placing a new game session for the match; and the maximum time allowed for
  /// a matchmaking attempt.
  ///
  /// There are two ways to track the progress of matchmaking tickets: (1)
  /// polling ticket status with DescribeMatchmaking; or (2) receiving
  /// notifications with Amazon Simple Notification Service (SNS). To use
  /// notifications, you first need to set up an SNS topic to receive the
  /// notifications, and provide the topic ARN in the matchmaking configuration.
  /// Since notifications promise only "best effort" delivery, we recommend
  /// calling `DescribeMatchmaking` if no notifications are received within 30
  /// seconds.
  ///
  ///  **Learn more**
  ///
  ///   [Design a FlexMatch
  /// Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
  ///
  ///   [Setting up Notifications for
  /// Matchmaking](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-notification.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> createMatchmakingConfiguration(
      {@required String name,
      String description,
      @required List<String> gameSessionQueueArns,
      @required int requestTimeoutSeconds,
      int acceptanceTimeoutSeconds,
      @required bool acceptanceRequired,
      @required String ruleSetName,
      String notificationTarget,
      int additionalPlayerCount,
      String customEventData,
      List<GameProperty> gameProperties,
      String gameSessionData,
      String backfillMode}) async {}

  /// Creates a new rule set for FlexMatch matchmaking. A rule set describes the
  /// type of match to create, such as the number and size of teams, and sets
  /// the parameters for acceptable player matches, such as minimum skill level
  /// or character type. A rule set is used by a MatchmakingConfiguration.
  ///
  /// To create a matchmaking rule set, provide unique rule set name and the
  /// rule set body in JSON format. Rule sets must be defined in the same region
  /// as the matchmaking configuration they are used with.
  ///
  /// Since matchmaking rule sets cannot be edited, it is a good idea to check
  /// the rule set syntax using ValidateMatchmakingRuleSet before creating a new
  /// rule set.
  ///
  ///  **Learn more**
  ///
  /// *    [Build a Rule
  /// Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
  ///
  /// *    [Design a
  /// Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
  ///
  /// *    [Matchmaking with
  /// FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-intro.html)
  ///
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> createMatchmakingRuleSet(
      {@required String name, @required String ruleSetBody}) async {}

  /// Reserves an open player slot in an active game session. Before a player
  /// can be added, a game session must have an `ACTIVE` status, have a creation
  /// policy of `ALLOW_ALL`, and have an open player slot. To add a group of
  /// players to a game session, use CreatePlayerSessions. When the player
  /// connects to the game server and references a player session ID, the game
  /// server contacts the Amazon GameLift service to validate the player
  /// reservation and accept the player.
  ///
  /// To create a player session, specify a game session ID, player ID, and
  /// optionally a string of player data. If successful, a slot is reserved in
  /// the game session for the player and a new PlayerSession object is
  /// returned. Player sessions cannot be updated.
  ///
  ///  _Available in Amazon GameLift Local._
  ///
  /// *    CreatePlayerSession
  ///
  /// *    CreatePlayerSessions
  ///
  /// *    DescribePlayerSessions
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> createPlayerSession(
      {@required String gameSessionId,
      @required String playerId,
      String playerData}) async {}

  /// Reserves open slots in a game session for a group of players. Before
  /// players can be added, a game session must have an `ACTIVE` status, have a
  /// creation policy of `ALLOW_ALL`, and have an open player slot. To add a
  /// single player to a game session, use CreatePlayerSession. When a player
  /// connects to the game server and references a player session ID, the game
  /// server contacts the Amazon GameLift service to validate the player
  /// reservation and accept the player.
  ///
  /// To create player sessions, specify a game session ID, a list of player
  /// IDs, and optionally a set of player data strings. If successful, a slot is
  /// reserved in the game session for each player and a set of new
  /// PlayerSession objects is returned. Player sessions cannot be updated.
  ///
  ///  _Available in Amazon GameLift Local._
  ///
  /// *    CreatePlayerSession
  ///
  /// *    CreatePlayerSessions
  ///
  /// *    DescribePlayerSessions
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> createPlayerSessions(
      {@required String gameSessionId,
      @required List<String> playerIds,
      Map<String, String> playerDataMap}) async {}

  /// Creates a new script record for your Realtime Servers script. Realtime
  /// scripts are JavaScript that provide configuration settings and optional
  /// custom game logic for your game. The script is deployed when you create a
  /// Realtime Servers fleet to host your game sessions. Script logic is
  /// executed during an active game session.
  ///
  /// To create a new script record, specify a script name and provide the
  /// script file(s). The script files and all dependencies must be zipped into
  /// a single file. You can pull the zip file from either of these locations:
  ///
  /// *   A locally available directory. Use the _ZipFile_ parameter for this
  /// option.
  ///
  /// *   An Amazon Simple Storage Service (Amazon S3) bucket under your AWS
  /// account. Use the _StorageLocation_ parameter for this option. You'll need
  /// to have an Identity Access Management (IAM) role that allows the Amazon
  /// GameLift service to access your S3 bucket.
  ///
  ///
  /// If the call is successful, a new script record is created with a unique
  /// script ID. If the script file is provided as a local file, the file is
  /// uploaded to an Amazon GameLift-owned S3 bucket and the script record's
  /// storage location reflects this location. If the script file is provided as
  /// an S3 bucket, Amazon GameLift accesses the file at this storage location
  /// as needed for deployment.
  ///
  ///  **Learn more**
  ///
  ///  [Amazon GameLift Realtime
  /// Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///  [Set Up a Role for Amazon GameLift
  /// Access](https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateScript
  ///
  /// *    ListScripts
  ///
  /// *    DescribeScript
  ///
  /// *    UpdateScript
  ///
  /// *    DeleteScript
  Future<void> createScript(
      {String name,
      String version,
      S3Location storageLocation,
      Uint8List zipFile}) async {}

  /// Requests authorization to create or delete a peer connection between the
  /// VPC for your Amazon GameLift fleet and a virtual private cloud (VPC) in
  /// your AWS account. VPC peering enables the game servers on your fleet to
  /// communicate directly with other AWS resources. Once you've received
  /// authorization, call CreateVpcPeeringConnection to establish the peering
  /// connection. For more information, see [VPC Peering with Amazon GameLift
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  ///
  /// You can peer with VPCs that are owned by any AWS account you have access
  /// to, including the account that you use to manage your Amazon GameLift
  /// fleets. You cannot peer with VPCs that are in different regions.
  ///
  /// To request authorization to create a connection, call this operation from
  /// the AWS account with the VPC that you want to peer to your Amazon GameLift
  /// fleet. For example, to enable your game servers to retrieve data from a
  /// DynamoDB table, use the account that manages that DynamoDB resource.
  /// Identify the following values: (1) The ID of the VPC that you want to peer
  /// with, and (2) the ID of the AWS account that you use to manage Amazon
  /// GameLift. If successful, VPC peering is authorized for the specified VPC.
  ///
  /// To request authorization to delete a connection, call this operation from
  /// the AWS account with the VPC that is peered with your Amazon GameLift
  /// fleet. Identify the following values: (1) VPC ID that you want to delete
  /// the peering connection for, and (2) ID of the AWS account that you use to
  /// manage Amazon GameLift.
  ///
  /// The authorization remains valid for 24 hours unless it is canceled by a
  /// call to DeleteVpcPeeringAuthorization. You must create or delete the
  /// peering connection while the authorization is valid.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> createVpcPeeringAuthorization(
      {@required String gameLiftAwsAccountId,
      @required String peerVpcId}) async {}

  /// Establishes a VPC peering connection between a virtual private cloud (VPC)
  /// in an AWS account with the VPC for your Amazon GameLift fleet. VPC peering
  /// enables the game servers on your fleet to communicate directly with other
  /// AWS resources. You can peer with VPCs in any AWS account that you have
  /// access to, including the account that you use to manage your Amazon
  /// GameLift fleets. You cannot peer with VPCs that are in different regions.
  /// For more information, see [VPC Peering with Amazon GameLift
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  ///
  /// Before calling this operation to establish the peering connection, you
  /// first need to call CreateVpcPeeringAuthorization and identify the VPC you
  /// want to peer with. Once the authorization for the specified VPC is issued,
  /// you have 24 hours to establish the connection. These two operations handle
  /// all tasks necessary to peer the two VPCs, including acceptance, updating
  /// routing tables, etc.
  ///
  /// To establish the connection, call this operation from the AWS account that
  /// is used to manage the Amazon GameLift fleets. Identify the following
  /// values: (1) The ID of the fleet you want to be enable a VPC peering
  /// connection for; (2) The AWS account with the VPC that you want to peer
  /// with; and (3) The ID of the VPC you want to peer with. This operation is
  /// asynchronous. If successful, a VpcPeeringConnection request is created.
  /// You can use continuous polling to track the request's status using
  /// DescribeVpcPeeringConnections, or by monitoring fleet events for success
  /// or failure using DescribeFleetEvents.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> createVpcPeeringConnection(
      {@required String fleetId,
      @required String peerVpcAwsAccountId,
      @required String peerVpcId}) async {}

  /// Deletes an alias. This action removes all record of the alias. Game
  /// clients attempting to access a server process using the deleted alias
  /// receive an error. To delete an alias, specify the alias ID to be deleted.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> deleteAlias(String aliasId) async {}

  /// Deletes a build. This action permanently deletes the build record and any
  /// uploaded build files.
  ///
  /// To delete a build, specify its ID. Deleting a build does not affect the
  /// status of any active fleets using the build, but you can no longer create
  /// new fleets with the deleted build.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> deleteBuild(String buildId) async {}

  /// Deletes everything related to a fleet. Before deleting a fleet, you must
  /// set the fleet's desired capacity to zero. See UpdateFleetCapacity.
  ///
  /// If the fleet being deleted has a VPC peering connection, you first need to
  /// get a valid authorization (good for 24 hours) by calling
  /// CreateVpcPeeringAuthorization. You do not need to explicitly delete the
  /// VPC peering connection--this is done as part of the delete fleet process.
  ///
  /// This action removes the fleet's resources and the fleet record. Once a
  /// fleet is deleted, you can no longer use that fleet.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> deleteFleet(String fleetId) async {}

  /// Deletes a game session queue. This action means that any
  /// StartGameSessionPlacement requests that reference this queue will fail. To
  /// delete a queue, specify the queue name.
  ///
  /// *    CreateGameSessionQueue
  ///
  /// *    DescribeGameSessionQueues
  ///
  /// *    UpdateGameSessionQueue
  ///
  /// *    DeleteGameSessionQueue
  Future<void> deleteGameSessionQueue(String name) async {}

  /// Permanently removes a FlexMatch matchmaking configuration. To delete,
  /// specify the configuration name. A matchmaking configuration cannot be
  /// deleted if it is being used in any active matchmaking tickets.
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> deleteMatchmakingConfiguration(String name) async {}

  /// Deletes an existing matchmaking rule set. To delete the rule set, provide
  /// the rule set name. Rule sets cannot be deleted if they are currently being
  /// used by a matchmaking configuration.
  ///
  ///  **Learn more**
  ///
  /// *    [Build a Rule
  /// Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
  ///
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> deleteMatchmakingRuleSet(String name) async {}

  /// Deletes a fleet scaling policy. This action means that the policy is no
  /// longer in force and removes all record of it. To delete a scaling policy,
  /// specify both the scaling policy name and the fleet ID it is associated
  /// with.
  ///
  /// To temporarily suspend scaling policies, call StopFleetActions. This
  /// operation suspends all policies for the fleet.
  ///
  /// *    DescribeFleetCapacity
  ///
  /// *    UpdateFleetCapacity
  ///
  /// *    DescribeEC2InstanceLimits
  ///
  /// *   Manage scaling policies:
  ///
  ///     *    PutScalingPolicy (auto-scaling)
  ///
  ///     *    DescribeScalingPolicies (auto-scaling)
  ///
  ///     *    DeleteScalingPolicy (auto-scaling)
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> deleteScalingPolicy(
      {@required String name, @required String fleetId}) async {}

  /// Deletes a Realtime script. This action permanently deletes the script
  /// record. If script files were uploaded, they are also deleted (files stored
  /// in an S3 bucket are not deleted).
  ///
  /// To delete a script, specify the script ID. Before deleting a script, be
  /// sure to terminate all fleets that are deployed with the script being
  /// deleted. Fleet instances periodically check for script updates, and if the
  /// script record no longer exists, the instance will go into an error state
  /// and be unable to host game sessions.
  ///
  ///  **Learn more**
  ///
  ///  [Amazon GameLift Realtime
  /// Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateScript
  ///
  /// *    ListScripts
  ///
  /// *    DescribeScript
  ///
  /// *    UpdateScript
  ///
  /// *    DeleteScript
  Future<void> deleteScript(String scriptId) async {}

  /// Cancels a pending VPC peering authorization for the specified VPC. If you
  /// need to delete an existing VPC peering connection, call
  /// DeleteVpcPeeringConnection.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> deleteVpcPeeringAuthorization(
      {@required String gameLiftAwsAccountId,
      @required String peerVpcId}) async {}

  /// Removes a VPC peering connection. To delete the connection, you must have
  /// a valid authorization for the VPC peering connection that you want to
  /// delete. You can check for an authorization by calling
  /// DescribeVpcPeeringAuthorizations or request a new one using
  /// CreateVpcPeeringAuthorization.
  ///
  /// Once a valid authorization exists, call this operation from the AWS
  /// account that is used to manage the Amazon GameLift fleets. Identify the
  /// connection to delete by the connection ID and fleet ID. If successful, the
  /// connection is removed.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> deleteVpcPeeringConnection(
      {@required String fleetId,
      @required String vpcPeeringConnectionId}) async {}

  /// Retrieves properties for an alias. This operation returns all alias
  /// metadata and settings. To get an alias's target fleet ID only, use
  /// `ResolveAlias`.
  ///
  /// To get alias properties, specify the alias ID. If successful, the
  /// requested alias record is returned.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> describeAlias(String aliasId) async {}

  /// Retrieves properties for a build. To request a build record, specify a
  /// build ID. If successful, an object containing the build properties is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> describeBuild(String buildId) async {}

  /// Retrieves the following information for the specified EC2 instance type:
  ///
  /// *   maximum number of instances allowed per AWS account (service limit)
  ///
  /// *   current usage level for the AWS account
  ///
  ///
  /// Service limits vary depending on region. Available regions for Amazon
  /// GameLift can be found in the AWS Management Console for Amazon GameLift
  /// (see the drop-down list in the upper right corner).
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeEc2InstanceLimits({String ec2InstanceType}) async {}

  /// Retrieves fleet properties, including metadata, status, and configuration,
  /// for one or more fleets. You can request attributes for all fleets, or
  /// specify a list of one or more fleet IDs. When requesting multiple fleets,
  /// use the pagination parameters to retrieve results as a set of sequential
  /// pages. If successful, a FleetAttributes object is returned for each
  /// requested fleet ID. When specifying a list of fleet IDs, attribute objects
  /// are returned only for fleets that currently exist.
  ///
  ///  Some API actions may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeFleetAttributes(
      {List<String> fleetIds, int limit, String nextToken}) async {}

  /// Retrieves the current status of fleet capacity for one or more fleets.
  /// This information includes the number of instances that have been requested
  /// for the fleet and the number currently active. You can request capacity
  /// for all fleets, or specify a list of one or more fleet IDs. When
  /// requesting multiple fleets, use the pagination parameters to retrieve
  /// results as a set of sequential pages. If successful, a FleetCapacity
  /// object is returned for each requested fleet ID. When specifying a list of
  /// fleet IDs, attribute objects are returned only for fleets that currently
  /// exist.
  ///
  ///  Some API actions may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeFleetCapacity(
      {List<String> fleetIds, int limit, String nextToken}) async {}

  /// Retrieves entries from the specified fleet's event log. You can specify a
  /// time range to limit the result set. Use the pagination parameters to
  /// retrieve results as a set of sequential pages. If successful, a collection
  /// of event log entries matching the request are returned.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeFleetEvents(String fleetId,
      {DateTime startTime,
      DateTime endTime,
      int limit,
      String nextToken}) async {}

  /// Retrieves the inbound connection permissions for a fleet. Connection
  /// permissions include a range of IP addresses and port settings that
  /// incoming traffic can use to access server processes in the fleet. To get a
  /// fleet's inbound connection permissions, specify a fleet ID. If successful,
  /// a collection of IpPermission objects is returned for the requested fleet
  /// ID. If the requested fleet has been deleted, the result set is empty.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeFleetPortSettings(String fleetId) async {}

  /// Retrieves utilization statistics for one or more fleets. You can request
  /// utilization data for all fleets, or specify a list of one or more fleet
  /// IDs. When requesting multiple fleets, use the pagination parameters to
  /// retrieve results as a set of sequential pages. If successful, a
  /// FleetUtilization object is returned for each requested fleet ID. When
  /// specifying a list of fleet IDs, utilization objects are returned only for
  /// fleets that currently exist.
  ///
  ///  Some API actions may limit the number of fleet IDs allowed in one
  /// request. If a request exceeds this limit, the request fails and the error
  /// message includes the maximum allowed.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeFleetUtilization(
      {List<String> fleetIds, int limit, String nextToken}) async {}

  /// Retrieves properties, including the protection policy in force, for one or
  /// more game sessions. This action can be used in several ways: (1) provide a
  /// `GameSessionId` or `GameSessionArn` to request details for a specific game
  /// session; (2) provide either a `FleetId` or an `AliasId` to request
  /// properties for all game sessions running on a fleet.
  ///
  /// To get game session record(s), specify just one of the following: game
  /// session ID, fleet ID, or alias ID. You can filter this request by game
  /// session status. Use the pagination parameters to retrieve results as a set
  /// of sequential pages. If successful, a GameSessionDetail object is returned
  /// for each session matching the request.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> describeGameSessionDetails(
      {String fleetId,
      String gameSessionId,
      String aliasId,
      String statusFilter,
      int limit,
      String nextToken}) async {}

  /// Retrieves properties and current status of a game session placement
  /// request. To get game session placement details, specify the placement ID.
  /// If successful, a GameSessionPlacement object is returned.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> describeGameSessionPlacement(String placementId) async {}

  /// Retrieves the properties for one or more game session queues. When
  /// requesting multiple queues, use the pagination parameters to retrieve
  /// results as a set of sequential pages. If successful, a GameSessionQueue
  /// object is returned for each requested queue. When specifying a list of
  /// queues, objects are returned only for queues that currently exist in the
  /// region.
  ///
  /// *    CreateGameSessionQueue
  ///
  /// *    DescribeGameSessionQueues
  ///
  /// *    UpdateGameSessionQueue
  ///
  /// *    DeleteGameSessionQueue
  Future<void> describeGameSessionQueues(
      {List<String> names, int limit, String nextToken}) async {}

  /// Retrieves a set of one or more game sessions. Request a specific game
  /// session or request all game sessions on a fleet. Alternatively, use
  /// SearchGameSessions to request a set of active game sessions that are
  /// filtered by certain criteria. To retrieve protection policy settings for
  /// game sessions, use DescribeGameSessionDetails.
  ///
  /// To get game sessions, specify one of the following: game session ID, fleet
  /// ID, or alias ID. You can filter this request by game session status. Use
  /// the pagination parameters to retrieve results as a set of sequential
  /// pages. If successful, a GameSession object is returned for each game
  /// session matching the request.
  ///
  ///  _Available in Amazon GameLift Local._
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> describeGameSessions(
      {String fleetId,
      String gameSessionId,
      String aliasId,
      String statusFilter,
      int limit,
      String nextToken}) async {}

  /// Retrieves information about a fleet's instances, including instance IDs.
  /// Use this action to get details on all instances in the fleet or get
  /// details on one specific instance.
  ///
  /// To get a specific instance, specify fleet ID and instance ID. To get all
  /// instances in a fleet, specify a fleet ID only. Use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, an Instance object is returned for each result.
  Future<void> describeInstances(String fleetId,
      {String instanceId, int limit, String nextToken}) async {}

  /// Retrieves one or more matchmaking tickets. Use this operation to retrieve
  /// ticket information, including status and--once a successful match is
  /// made--acquire connection information for the resulting new game session.
  ///
  /// You can use this operation to track the progress of matchmaking requests
  /// (through polling) as an alternative to using event notifications. See more
  /// details on tracking matchmaking requests through polling or notifications
  /// in StartMatchmaking.
  ///
  /// To request matchmaking tickets, provide a list of up to 10 ticket IDs. If
  /// the request is successful, a ticket object is returned for each requested
  /// ID that currently exists.
  ///
  ///  **Learn more**
  ///
  ///   [Add FlexMatch to a Game
  /// Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///   [Set Up FlexMatch Event
  /// Notification](https://docs.aws.amazon.com/gamelift/latest/developerguidematch-notification.html)
  ///
  ///  **Related operations**
  ///
  /// *    StartMatchmaking
  ///
  /// *    DescribeMatchmaking
  ///
  /// *    StopMatchmaking
  ///
  /// *    AcceptMatch
  ///
  /// *    StartMatchBackfill
  Future<void> describeMatchmaking(List<String> ticketIds) async {}

  /// Retrieves the details of FlexMatch matchmaking configurations. With this
  /// operation, you have the following options: (1) retrieve all existing
  /// configurations, (2) provide the names of one or more configurations to
  /// retrieve, or (3) retrieve all configurations that use a specified rule set
  /// name. When requesting multiple items, use the pagination parameters to
  /// retrieve results as a set of sequential pages. If successful, a
  /// configuration is returned for each requested name. When specifying a list
  /// of names, only configurations that currently exist are returned.
  ///
  ///  **Learn more**
  ///
  ///   [Setting Up FlexMatch
  /// Matchmakers](https://docs.aws.amazon.com/gamelift/latest/developerguide/matchmaker-build.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> describeMatchmakingConfigurations(
      {List<String> names,
      String ruleSetName,
      int limit,
      String nextToken}) async {}

  /// Retrieves the details for FlexMatch matchmaking rule sets. You can request
  /// all existing rule sets for the region, or provide a list of one or more
  /// rule set names. When requesting multiple items, use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, a rule set is returned for each requested name.
  ///
  ///  **Learn more**
  ///
  /// *    [Build a Rule
  /// Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
  ///
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> describeMatchmakingRuleSets(
      {List<String> names, int limit, String nextToken}) async {}

  /// Retrieves properties for one or more player sessions. This action can be
  /// used in several ways: (1) provide a `PlayerSessionId` to request
  /// properties for a specific player session; (2) provide a `GameSessionId` to
  /// request properties for all player sessions in the specified game session;
  /// (3) provide a `PlayerId` to request properties for all player sessions of
  /// a specified player.
  ///
  /// To get game session record(s), specify only one of the following: a player
  /// session ID, a game session ID, or a player ID. You can filter this request
  /// by player session status. Use the pagination parameters to retrieve
  /// results as a set of sequential pages. If successful, a PlayerSession
  /// object is returned for each session matching the request.
  ///
  ///  _Available in Amazon GameLift Local._
  ///
  /// *    CreatePlayerSession
  ///
  /// *    CreatePlayerSessions
  ///
  /// *    DescribePlayerSessions
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> describePlayerSessions(
      {String gameSessionId,
      String playerId,
      String playerSessionId,
      String playerSessionStatusFilter,
      int limit,
      String nextToken}) async {}

  /// Retrieves the current run-time configuration for the specified fleet. The
  /// run-time configuration tells Amazon GameLift how to launch server
  /// processes on instances in the fleet.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeRuntimeConfiguration(String fleetId) async {}

  /// Retrieves all scaling policies applied to a fleet.
  ///
  /// To get a fleet's scaling policies, specify the fleet ID. You can filter
  /// this request by policy status, such as to retrieve only active scaling
  /// policies. Use the pagination parameters to retrieve results as a set of
  /// sequential pages. If successful, set of ScalingPolicy objects is returned
  /// for the fleet.
  ///
  /// A fleet may have all of its scaling policies suspended (StopFleetActions).
  /// This action does not affect the status of the scaling policies, which
  /// remains ACTIVE. To see whether a fleet's scaling policies are in force or
  /// suspended, call DescribeFleetAttributes and check the stopped actions.
  ///
  /// *    DescribeFleetCapacity
  ///
  /// *    UpdateFleetCapacity
  ///
  /// *    DescribeEC2InstanceLimits
  ///
  /// *   Manage scaling policies:
  ///
  ///     *    PutScalingPolicy (auto-scaling)
  ///
  ///     *    DescribeScalingPolicies (auto-scaling)
  ///
  ///     *    DeleteScalingPolicy (auto-scaling)
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> describeScalingPolicies(String fleetId,
      {String statusFilter, int limit, String nextToken}) async {}

  /// Retrieves properties for a Realtime script.
  ///
  /// To request a script record, specify the script ID. If successful, an
  /// object containing the script properties is returned.
  ///
  ///  **Learn more**
  ///
  ///  [Amazon GameLift Realtime
  /// Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateScript
  ///
  /// *    ListScripts
  ///
  /// *    DescribeScript
  ///
  /// *    UpdateScript
  ///
  /// *    DeleteScript
  Future<void> describeScript(String scriptId) async {}

  /// Retrieves valid VPC peering authorizations that are pending for the AWS
  /// account. This operation returns all VPC peering authorizations and
  /// requests for peering. This includes those initiated and received by this
  /// account.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> describeVpcPeeringAuthorizations() async {}

  /// Retrieves information on VPC peering connections. Use this operation to
  /// get peering information for all fleets or for one specific fleet ID.
  ///
  /// To retrieve connection information, call this operation from the AWS
  /// account that is used to manage the Amazon GameLift fleets. Specify a fleet
  /// ID or leave the parameter empty to retrieve all connection records. If
  /// successful, the retrieved information includes both active and pending
  /// connections. Active connections identify the IpV4 CIDR block that the VPC
  /// uses to connect.
  ///
  /// *    CreateVpcPeeringAuthorization
  ///
  /// *    DescribeVpcPeeringAuthorizations
  ///
  /// *    DeleteVpcPeeringAuthorization
  ///
  /// *    CreateVpcPeeringConnection
  ///
  /// *    DescribeVpcPeeringConnections
  ///
  /// *    DeleteVpcPeeringConnection
  Future<void> describeVpcPeeringConnections({String fleetId}) async {}

  /// Retrieves the location of stored game session logs for a specified game
  /// session. When a game session is terminated, Amazon GameLift automatically
  /// stores the logs in Amazon S3 and retains them for 14 days. Use this URL to
  /// download the logs.
  ///
  ///  See the [AWS Service
  /// Limits](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_gamelift)
  /// page for maximum log file sizes. Log files that exceed this limit are not
  /// saved.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> getGameSessionLogUrl(String gameSessionId) async {}

  /// Requests remote access to a fleet instance. Remote access is useful for
  /// debugging, gathering benchmarking data, or watching activity in real time.
  ///
  /// Access requires credentials that match the operating system of the
  /// instance. For a Windows instance, Amazon GameLift returns a user name and
  /// password as strings for use with a Windows Remote Desktop client. For a
  /// Linux instance, Amazon GameLift returns a user name and RSA private key,
  /// also as strings, for use with an SSH client. The private key must be saved
  /// in the proper format to a `.pem` file before using. If you're making this
  /// request using the AWS CLI, saving the secret can be handled as part of the
  /// GetInstanceAccess request. (See the example later in this topic). For more
  /// information on remote access, see [Remotely Accessing an
  /// Instance](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html).
  ///
  /// To request access to a specific instance, specify the IDs of both the
  /// instance and the fleet it belongs to. You can retrieve a fleet's instance
  /// IDs by calling DescribeInstances. If successful, an InstanceAccess object
  /// is returned containing the instance's IP address and a set of credentials.
  Future<void> getInstanceAccess(
      {@required String fleetId, @required String instanceId}) async {}

  /// Retrieves all aliases for this AWS account. You can filter the result set
  /// by alias name and/or routing strategy type. Use the pagination parameters
  /// to retrieve results in sequential pages.
  ///
  ///  Returned aliases are not listed in any particular order.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> listAliases(
      {String routingStrategyType,
      String name,
      int limit,
      String nextToken}) async {}

  /// Retrieves build records for all builds associated with the AWS account in
  /// use. You can limit results to builds that are in a specific status by
  /// using the `Status` parameter. Use the pagination parameters to retrieve
  /// results in a set of sequential pages.
  ///
  ///  Build records are not listed in any particular order.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> listBuilds({String status, int limit, String nextToken}) async {}

  /// Retrieves a collection of fleet records for this AWS account. You can
  /// filter the result set to find only those fleets that are deployed with a
  /// specific build or script. Use the pagination parameters to retrieve
  /// results in sequential pages.
  ///
  ///  Fleet records are not listed in a particular order.
  ///
  ///  **Learn more**
  ///
  ///   [Set Up
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> listFleets(
      {String buildId, String scriptId, int limit, String nextToken}) async {}

  /// Retrieves script records for all Realtime scripts that are associated with
  /// the AWS account in use.
  ///
  ///  **Learn more**
  ///
  ///  [Amazon GameLift Realtime
  /// Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateScript
  ///
  /// *    ListScripts
  ///
  /// *    DescribeScript
  ///
  /// *    UpdateScript
  ///
  /// *    DeleteScript
  Future<void> listScripts({int limit, String nextToken}) async {}

  /// Creates or updates a scaling policy for a fleet. Scaling policies are used
  /// to automatically scale a fleet's hosting capacity to meet player demand.
  /// An active scaling policy instructs Amazon GameLift to track a fleet metric
  /// and automatically change the fleet's capacity when a certain threshold is
  /// reached. There are two types of scaling policies: target-based and
  /// rule-based. Use a target-based policy to quickly and efficiently manage
  /// fleet scaling; this option is the most commonly used. Use rule-based
  /// policies when you need to exert fine-grained control over auto-scaling.
  ///
  /// Fleets can have multiple scaling policies of each type in force at the
  /// same time; you can have one target-based policy, one or multiple
  /// rule-based scaling policies, or both. We recommend caution, however,
  /// because multiple auto-scaling policies can have unintended consequences.
  ///
  /// You can temporarily suspend all scaling policies for a fleet by calling
  /// StopFleetActions with the fleet action AUTO_SCALING. To resume scaling
  /// policies, call StartFleetActions with the same fleet action. To stop just
  /// one scaling policy--or to permanently remove it, you must delete the
  /// policy with DeleteScalingPolicy.
  ///
  /// Learn more about how to work with auto-scaling in [Set Up Fleet Automatic
  /// Scaling](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-autoscaling.html).
  ///
  ///  **Target-based policy**
  ///
  /// A target-based policy tracks a single metric:
  /// PercentAvailableGameSessions. This metric tells us how much of a fleet's
  /// hosting capacity is ready to host game sessions but is not currently in
  /// use. This is the fleet's buffer; it measures the additional player demand
  /// that the fleet could handle at current capacity. With a target-based
  /// policy, you set your ideal buffer size and leave it to Amazon GameLift to
  /// take whatever action is needed to maintain that target.
  ///
  /// For example, you might choose to maintain a 10% buffer for a fleet that
  /// has the capacity to host 100 simultaneous game sessions. This policy tells
  /// Amazon GameLift to take action whenever the fleet's available capacity
  /// falls below or rises above 10 game sessions. Amazon GameLift will start
  /// new instances or stop unused instances in order to return to the 10%
  /// buffer.
  ///
  /// To create or update a target-based policy, specify a fleet ID and name,
  /// and set the policy type to "TargetBased". Specify the metric to track
  /// (PercentAvailableGameSessions) and reference a TargetConfiguration object
  /// with your desired buffer value. Exclude all other parameters. On a
  /// successful request, the policy name is returned. The scaling policy is
  /// automatically in force as soon as it's successfully created. If the
  /// fleet's auto-scaling actions are temporarily suspended, the new policy
  /// will be in force once the fleet actions are restarted.
  ///
  ///  **Rule-based policy**
  ///
  /// A rule-based policy tracks specified fleet metric, sets a threshold value,
  /// and specifies the type of action to initiate when triggered. With a
  /// rule-based policy, you can select from several available fleet metrics.
  /// Each policy specifies whether to scale up or scale down (and by how much),
  /// so you need one policy for each type of action.
  ///
  /// For example, a policy may make the following statement: "If the percentage
  /// of idle instances is greater than 20% for more than 15 minutes, then
  /// reduce the fleet capacity by 10%."
  ///
  /// A policy's rule statement has the following structure:
  ///
  /// If `\[MetricName\]` is `\[ComparisonOperator\]` `\[Threshold\]` for
  /// `\[EvaluationPeriods\]` minutes, then `\[ScalingAdjustmentType\]` to/by
  /// `\[ScalingAdjustment\]`.
  ///
  /// To implement the example, the rule statement would look like this:
  ///
  /// If `\[PercentIdleInstances\]` is `\[GreaterThanThreshold\]` `\[20\]` for
  /// `\[15\]` minutes, then `\[PercentChangeInCapacity\]` to/by `\[10\]`.
  ///
  /// To create or update a scaling policy, specify a unique combination of name
  /// and fleet ID, and set the policy type to "RuleBased". Specify the
  /// parameter values for a policy rule statement. On a successful request, the
  /// policy name is returned. Scaling policies are automatically in force as
  /// soon as they're successfully created. If the fleet's auto-scaling actions
  /// are temporarily suspended, the new policy will be in force once the fleet
  /// actions are restarted.
  ///
  /// *    DescribeFleetCapacity
  ///
  /// *    UpdateFleetCapacity
  ///
  /// *    DescribeEC2InstanceLimits
  ///
  /// *   Manage scaling policies:
  ///
  ///     *    PutScalingPolicy (auto-scaling)
  ///
  ///     *    DescribeScalingPolicies (auto-scaling)
  ///
  ///     *    DeleteScalingPolicy (auto-scaling)
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> putScalingPolicy(
      {@required String name,
      @required String fleetId,
      int scalingAdjustment,
      String scalingAdjustmentType,
      double threshold,
      String comparisonOperator,
      int evaluationPeriods,
      @required String metricName,
      String policyType,
      TargetConfiguration targetConfiguration}) async {}

  /// Retrieves a fresh set of credentials for use when uploading a new set of
  /// game build files to Amazon GameLift's Amazon S3. This is done as part of
  /// the build creation process; see CreateBuild.
  ///
  /// To request new credentials, specify the build ID as returned with an
  /// initial `CreateBuild` request. If successful, a new set of credentials are
  /// returned, along with the S3 storage location associated with the build ID.
  ///
  ///  **Learn more**
  ///
  ///  [Uploading Your
  /// Game](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> requestUploadCredentials(String buildId) async {}

  /// Retrieves the fleet ID that a specified alias is currently pointing to.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> resolveAlias(String aliasId) async {}

  /// Retrieves all active game sessions that match a set of search criteria and
  /// sorts them in a specified order. You can search or sort by the following
  /// game session attributes:
  ///
  /// *    **gameSessionId** \-\- Unique identifier for the game session. You
  /// can use either a `GameSessionId` or `GameSessionArn` value.
  ///
  /// *    **gameSessionName** \-\- Name assigned to a game session. This value
  /// is set when requesting a new game session with CreateGameSession or
  /// updating with UpdateGameSession. Game session names do not need to be
  /// unique to a game session.
  ///
  /// *    **gameSessionProperties** \-\- Custom data defined in a game
  /// session's `GameProperty` parameter. `GameProperty` values are stored as
  /// key:value pairs; the filter expression must indicate the key and a string
  /// to search the data values for. For example, to search for game sessions
  /// with custom data containing the key:value pair "gameMode:brawl", specify
  /// the following: `gameSessionProperties.gameMode = "brawl"`. All custom data
  /// values are searched as strings.
  ///
  /// *    **maximumSessions** \-\- Maximum number of player sessions allowed
  /// for a game session. This value is set when requesting a new game session
  /// with CreateGameSession or updating with UpdateGameSession.
  ///
  /// *    **creationTimeMillis** \-\- Value indicating when a game session was
  /// created. It is expressed in Unix time as milliseconds.
  ///
  /// *    **playerSessionCount** \-\- Number of players currently connected to
  /// a game session. This value changes rapidly as players join the session or
  /// drop out.
  ///
  /// *    **hasAvailablePlayerSessions** \-\- Boolean value indicating whether
  /// a game session has reached its maximum number of players. It is highly
  /// recommended that all search requests include this filter attribute to
  /// optimize search performance and return only sessions that players can
  /// join.
  ///
  ///
  ///  Returned values for `playerSessionCount` and `hasAvailablePlayerSessions`
  /// change quickly as players join sessions and others drop out. Results
  /// should be considered a snapshot in time. Be sure to refresh search results
  /// often, and handle sessions that fill up before a player can join.
  ///
  /// To search or sort, specify either a fleet ID or an alias ID, and provide a
  /// search filter expression, a sort expression, or both. If successful, a
  /// collection of GameSession objects matching the request is returned. Use
  /// the pagination parameters to retrieve results as a set of sequential
  /// pages.
  ///
  /// You can search for game sessions one fleet at a time only. To find game
  /// sessions across multiple fleets, you must search each fleet separately and
  /// combine the results. This search feature finds only game sessions that are
  /// in `ACTIVE` status. To locate games in statuses other than active, use
  /// DescribeGameSessionDetails.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> searchGameSessions(
      {String fleetId,
      String aliasId,
      String filterExpression,
      String sortExpression,
      int limit,
      String nextToken}) async {}

  /// Resumes activity on a fleet that was suspended with StopFleetActions.
  /// Currently, this operation is used to restart a fleet's auto-scaling
  /// activity.
  ///
  /// To start fleet actions, specify the fleet ID and the type of actions to
  /// restart. When auto-scaling fleet actions are restarted, Amazon GameLift
  /// once again initiates scaling events as triggered by the fleet's scaling
  /// policies. If actions on the fleet were never stopped, this operation will
  /// have no effect. You can view a fleet's stopped actions using
  /// DescribeFleetAttributes.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> startFleetActions(
      {@required String fleetId, @required List<String> actions}) async {}

  /// Places a request for a new game session in a queue (see
  /// CreateGameSessionQueue). When processing a placement request, Amazon
  /// GameLift searches for available resources on the queue's destinations,
  /// scanning each until it finds resources or the placement request times out.
  ///
  /// A game session placement request can also request player sessions. When a
  /// new game session is successfully created, Amazon GameLift creates a player
  /// session for each player included in the request.
  ///
  /// When placing a game session, by default Amazon GameLift tries each fleet
  /// in the order they are listed in the queue configuration. Ideally, a
  /// queue's destinations are listed in preference order.
  ///
  /// Alternatively, when requesting a game session with players, you can also
  /// provide latency data for each player in relevant regions. Latency data
  /// indicates the performance lag a player experiences when connected to a
  /// fleet in the region. Amazon GameLift uses latency data to reorder the list
  /// of destinations to place the game session in a region with minimal lag. If
  /// latency data is provided for multiple players, Amazon GameLift calculates
  /// each region's average lag for all players and reorders to get the best
  /// game play across all players.
  ///
  /// To place a new game session request, specify the following:
  ///
  /// *   The queue name and a set of game session properties and settings
  ///
  /// *   A unique ID (such as a UUID) for the placement. You use this ID to
  /// track the status of the placement request
  ///
  /// *   (Optional) A set of player data and a unique player ID for each player
  /// that you are joining to the new game session (player data is optional, but
  /// if you include it, you must also provide a unique ID for each player)
  ///
  /// *   Latency data for all players (if you want to optimize game play for
  /// the players)
  ///
  ///
  /// If successful, a new game session placement is created.
  ///
  /// To track the status of a placement request, call
  /// DescribeGameSessionPlacement and check the request's status. If the status
  /// is `FULFILLED`, a new game session has been created and a game session ARN
  /// and region are referenced. If the placement request times out, you can
  /// resubmit the request or retry it with a different queue.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> startGameSessionPlacement(
      {@required String placementId,
      @required String gameSessionQueueName,
      List<GameProperty> gameProperties,
      @required int maximumPlayerSessionCount,
      String gameSessionName,
      List<PlayerLatency> playerLatencies,
      List<DesiredPlayerSession> desiredPlayerSessions,
      String gameSessionData}) async {}

  /// Finds new players to fill open slots in an existing game session. This
  /// operation can be used to add players to matched games that start with
  /// fewer than the maximum number of players or to replace players when they
  /// drop out. By backfilling with the same matchmaker used to create the
  /// original match, you ensure that new players meet the match criteria and
  /// maintain a consistent experience throughout the game session. You can
  /// backfill a match anytime after a game session has been created.
  ///
  /// To request a match backfill, specify a unique ticket ID, the existing game
  /// session's ARN, a matchmaking configuration, and a set of data that
  /// describes all current players in the game session. If successful, a match
  /// backfill ticket is created and returned with status set to QUEUED. The
  /// ticket is placed in the matchmaker's ticket pool and processed. Track the
  /// status of the ticket to respond as needed.
  ///
  /// The process of finding backfill matches is essentially identical to the
  /// initial matchmaking process. The matchmaker searches the pool and groups
  /// tickets together to form potential matches, allowing only one backfill
  /// ticket per potential match. Once the a match is formed, the matchmaker
  /// creates player sessions for the new players. All tickets in the match are
  /// updated with the game session's connection information, and the
  /// GameSession object is updated to include matchmaker data on the new
  /// players. For more detail on how match backfill requests are processed, see
  ///  [How Amazon GameLift FlexMatch
  /// Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html).
  ///
  ///  **Learn more**
  ///
  ///   [Backfill Existing Games with
  /// FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-backfill.html)
  ///
  ///   [How GameLift FlexMatch
  /// Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html)
  ///
  ///  **Related operations**
  ///
  /// *    StartMatchmaking
  ///
  /// *    DescribeMatchmaking
  ///
  /// *    StopMatchmaking
  ///
  /// *    AcceptMatch
  ///
  /// *    StartMatchBackfill
  Future<void> startMatchBackfill(
      {String ticketId,
      @required String configurationName,
      @required String gameSessionArn,
      @required List<Player> players}) async {}

  /// Uses FlexMatch to create a game match for a group of players based on
  /// custom matchmaking rules, and starts a new game for the matched players.
  /// Each matchmaking request specifies the type of match to build (team
  /// configuration, rules for an acceptable match, etc.). The request also
  /// specifies the players to find a match for and where to host the new game
  /// session for optimal performance. A matchmaking request might start with a
  /// single player or a group of players who want to play together. FlexMatch
  /// finds additional players as needed to fill the match. Match type, rules,
  /// and the queue used to place a new game session are defined in a
  /// `MatchmakingConfiguration`.
  ///
  /// To start matchmaking, provide a unique ticket ID, specify a matchmaking
  /// configuration, and include the players to be matched. You must also
  /// include a set of player attributes relevant for the matchmaking
  /// configuration. If successful, a matchmaking ticket is returned with status
  /// set to `QUEUED`. Track the status of the ticket to respond as needed and
  /// acquire game session connection information for successfully completed
  /// matches.
  ///
  ///  **Tracking ticket status** \-\- A couple of options are available for
  /// tracking the status of matchmaking requests:
  ///
  /// *   Polling -- Call `DescribeMatchmaking`. This operation returns the full
  /// ticket object, including current status and (for completed tickets) game
  /// session connection info. We recommend polling no more than once every 10
  /// seconds.
  ///
  /// *   Notifications -- Get event notifications for changes in ticket status
  /// using Amazon Simple Notification Service (SNS). Notifications are easy to
  /// set up (see CreateMatchmakingConfiguration) and typically deliver match
  /// status changes faster and more efficiently than polling. We recommend that
  /// you use polling to back up to notifications (since delivery is not
  /// guaranteed) and call `DescribeMatchmaking` only when notifications are not
  /// received within 30 seconds.
  ///
  ///
  ///  **Processing a matchmaking request** \-\- FlexMatch handles a matchmaking
  /// request as follows:
  ///
  /// 1.  Your client code submits a `StartMatchmaking` request for one or more
  /// players and tracks the status of the request ticket.
  ///
  /// 2.  FlexMatch uses this ticket and others in process to build an
  /// acceptable match. When a potential match is identified, all tickets in the
  /// proposed match are advanced to the next status.
  ///
  /// 3.  If the match requires player acceptance (set in the matchmaking
  /// configuration), the tickets move into status `REQUIRES_ACCEPTANCE`. This
  /// status triggers your client code to solicit acceptance from all players in
  /// every ticket involved in the match, and then call AcceptMatch for each
  /// player. If any player rejects or fails to accept the match before a
  /// specified timeout, the proposed match is dropped (see `AcceptMatch` for
  /// more details).
  ///
  /// 4.  Once a match is proposed and accepted, the matchmaking tickets move
  /// into status `PLACING`. FlexMatch locates resources for a new game session
  /// using the game session queue (set in the matchmaking configuration) and
  /// creates the game session based on the match data.
  ///
  /// 5.  When the match is successfully placed, the matchmaking tickets move
  /// into `COMPLETED` status. Connection information (including game session
  /// endpoint and player session) is added to the matchmaking tickets. Matched
  /// players can use the connection information to join the game.
  ///
  ///
  ///  **Learn more**
  ///
  ///   [Add FlexMatch to a Game
  /// Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///   [Set Up FlexMatch Event
  /// Notification](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-notification.html)
  ///
  ///   [FlexMatch Integration
  /// Roadmap](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-tasks.html)
  ///
  ///   [How GameLift FlexMatch
  /// Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html)
  ///
  ///  **Related operations**
  ///
  /// *    StartMatchmaking
  ///
  /// *    DescribeMatchmaking
  ///
  /// *    StopMatchmaking
  ///
  /// *    AcceptMatch
  ///
  /// *    StartMatchBackfill
  Future<void> startMatchmaking(
      {String ticketId,
      @required String configurationName,
      @required List<Player> players}) async {}

  /// Suspends activity on a fleet. Currently, this operation is used to stop a
  /// fleet's auto-scaling activity. It is used to temporarily stop scaling
  /// events triggered by the fleet's scaling policies. The policies can be
  /// retained and auto-scaling activity can be restarted using
  /// StartFleetActions. You can view a fleet's stopped actions using
  /// DescribeFleetAttributes.
  ///
  /// To stop fleet actions, specify the fleet ID and the type of actions to
  /// suspend. When auto-scaling fleet actions are stopped, Amazon GameLift no
  /// longer initiates scaling events except to maintain the fleet's desired
  /// instances setting (FleetCapacity. Changes to the fleet's capacity must be
  /// done manually using UpdateFleetCapacity.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> stopFleetActions(
      {@required String fleetId, @required List<String> actions}) async {}

  /// Cancels a game session placement that is in `PENDING` status. To stop a
  /// placement, provide the placement ID values. If successful, the placement
  /// is moved to `CANCELLED` status.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> stopGameSessionPlacement(String placementId) async {}

  /// Cancels a matchmaking ticket or match backfill ticket that is currently
  /// being processed. To stop the matchmaking operation, specify the ticket ID.
  /// If successful, work on the ticket is stopped, and the ticket status is
  /// changed to `CANCELLED`.
  ///
  /// This call is also used to turn off automatic backfill for an individual
  /// game session. This is for game sessions that are created with a
  /// matchmaking configuration that has automatic backfill enabled. The ticket
  /// ID is included in the `MatchmakerData` of an updated game session object,
  /// which is provided to the game server.
  ///
  ///  If the action is successful, the service sends back an empty JSON struct
  /// with the HTTP 200 response (not an empty HTTP body).
  ///
  ///  **Learn more**
  ///
  ///   [Add FlexMatch to a Game
  /// Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///  **Related operations**
  ///
  /// *    StartMatchmaking
  ///
  /// *    DescribeMatchmaking
  ///
  /// *    StopMatchmaking
  ///
  /// *    AcceptMatch
  ///
  /// *    StartMatchBackfill
  Future<void> stopMatchmaking(String ticketId) async {}

  /// Updates properties for an alias. To update properties, specify the alias
  /// ID to be updated and provide the information to be changed. To reassign an
  /// alias to another fleet, provide an updated routing strategy. If
  /// successful, the updated alias record is returned.
  ///
  /// *    CreateAlias
  ///
  /// *    ListAliases
  ///
  /// *    DescribeAlias
  ///
  /// *    UpdateAlias
  ///
  /// *    DeleteAlias
  ///
  /// *    ResolveAlias
  Future<void> updateAlias(String aliasId,
      {String name,
      String description,
      RoutingStrategy routingStrategy}) async {}

  /// Updates metadata in a build record, including the build name and version.
  /// To update the metadata, specify the build ID to update and provide the new
  /// values. If successful, a build object containing the updated metadata is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateBuild
  ///
  /// *    ListBuilds
  ///
  /// *    DescribeBuild
  ///
  /// *    UpdateBuild
  ///
  /// *    DeleteBuild
  Future<void> updateBuild(String buildId,
      {String name, String version}) async {}

  /// Updates fleet properties, including name and description, for a fleet. To
  /// update metadata, specify the fleet ID and the property values that you
  /// want to change. If successful, the fleet ID for the updated fleet is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> updateFleetAttributes(String fleetId,
      {String name,
      String description,
      String newGameSessionProtectionPolicy,
      ResourceCreationLimitPolicy resourceCreationLimitPolicy,
      List<String> metricGroups}) async {}

  /// Updates capacity settings for a fleet. Use this action to specify the
  /// number of EC2 instances (hosts) that you want this fleet to contain.
  /// Before calling this action, you may want to call DescribeEC2InstanceLimits
  /// to get the maximum capacity based on the fleet's EC2 instance type.
  ///
  /// Specify minimum and maximum number of instances. Amazon GameLift will not
  /// change fleet capacity to values fall outside of this range. This is
  /// particularly important when using auto-scaling (see PutScalingPolicy) to
  /// allow capacity to adjust based on player demand while imposing limits on
  /// automatic adjustments.
  ///
  /// To update fleet capacity, specify the fleet ID and the number of instances
  /// you want the fleet to host. If successful, Amazon GameLift starts or
  /// terminates instances so that the fleet's active instance count matches the
  /// desired instance count. You can view a fleet's current capacity
  /// information by calling DescribeFleetCapacity. If the desired instance
  /// count is higher than the instance type's limit, the "Limit Exceeded"
  /// exception occurs.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> updateFleetCapacity(String fleetId,
      {int desiredInstances, int minSize, int maxSize}) async {}

  /// Updates port settings for a fleet. To update settings, specify the fleet
  /// ID to be updated and list the permissions you want to update. List the
  /// permissions you want to add in `InboundPermissionAuthorizations`, and
  /// permissions you want to remove in `InboundPermissionRevocations`.
  /// Permissions to be removed must match existing fleet permissions. If
  /// successful, the fleet ID for the updated fleet is returned.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> updateFleetPortSettings(String fleetId,
      {List<IpPermission> inboundPermissionAuthorizations,
      List<IpPermission> inboundPermissionRevocations}) async {}

  /// Updates game session properties. This includes the session name, maximum
  /// player count, protection policy, which controls whether or not an active
  /// game session can be terminated during a scale-down event, and the player
  /// session creation policy, which controls whether or not new players can
  /// join the session. To update a game session, specify the game session ID
  /// and the values you want to change. If successful, an updated GameSession
  /// object is returned.
  ///
  /// *    CreateGameSession
  ///
  /// *    DescribeGameSessions
  ///
  /// *    DescribeGameSessionDetails
  ///
  /// *    SearchGameSessions
  ///
  /// *    UpdateGameSession
  ///
  /// *    GetGameSessionLogUrl
  ///
  /// *   Game session placements
  ///
  ///     *    StartGameSessionPlacement
  ///
  ///     *    DescribeGameSessionPlacement
  ///
  ///     *    StopGameSessionPlacement
  Future<void> updateGameSession(String gameSessionId,
      {int maximumPlayerSessionCount,
      String name,
      String playerSessionCreationPolicy,
      String protectionPolicy}) async {}

  /// Updates settings for a game session queue, which determines how new game
  /// session requests in the queue are processed. To update settings, specify
  /// the queue name to be updated and provide the new settings. When updating
  /// destinations, provide a complete list of destinations.
  ///
  /// *    CreateGameSessionQueue
  ///
  /// *    DescribeGameSessionQueues
  ///
  /// *    UpdateGameSessionQueue
  ///
  /// *    DeleteGameSessionQueue
  Future<void> updateGameSessionQueue(String name,
      {int timeoutInSeconds,
      List<PlayerLatencyPolicy> playerLatencyPolicies,
      List<GameSessionQueueDestination> destinations}) async {}

  /// Updates settings for a FlexMatch matchmaking configuration. These changes
  /// affect all matches and game sessions that are created after the update. To
  /// update settings, specify the configuration name to be updated and provide
  /// the new settings.
  ///
  ///  **Learn more**
  ///
  ///   [Design a FlexMatch
  /// Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> updateMatchmakingConfiguration(String name,
      {String description,
      List<String> gameSessionQueueArns,
      int requestTimeoutSeconds,
      int acceptanceTimeoutSeconds,
      bool acceptanceRequired,
      String ruleSetName,
      String notificationTarget,
      int additionalPlayerCount,
      String customEventData,
      List<GameProperty> gameProperties,
      String gameSessionData,
      String backfillMode}) async {}

  /// Updates the current run-time configuration for the specified fleet, which
  /// tells Amazon GameLift how to launch server processes on instances in the
  /// fleet. You can update a fleet's run-time configuration at any time after
  /// the fleet is created; it does not need to be in an `ACTIVE` status.
  ///
  /// To update run-time configuration, specify the fleet ID and provide a
  /// `RuntimeConfiguration` object with an updated set of server process
  /// configurations.
  ///
  /// Each instance in a Amazon GameLift fleet checks regularly for an updated
  /// run-time configuration and changes how it launches server processes to
  /// comply with the latest version. Existing server processes are not affected
  /// by the update; run-time configuration changes are applied gradually as
  /// existing processes shut down and new processes are launched during Amazon
  /// GameLift's normal process recycling activity.
  ///
  ///  **Learn more**
  ///
  ///   [Working with
  /// Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
  ///
  ///  **Related operations**
  ///
  /// *    CreateFleet
  ///
  /// *    ListFleets
  ///
  /// *    DeleteFleet
  ///
  /// *   Describe fleets:
  ///
  ///     *    DescribeFleetAttributes
  ///
  ///     *    DescribeFleetCapacity
  ///
  ///     *    DescribeFleetPortSettings
  ///
  ///     *    DescribeFleetUtilization
  ///
  ///     *    DescribeRuntimeConfiguration
  ///
  ///     *    DescribeEC2InstanceLimits
  ///
  ///     *    DescribeFleetEvents
  ///
  ///
  /// *   Update fleets:
  ///
  ///     *    UpdateFleetAttributes
  ///
  ///     *    UpdateFleetCapacity
  ///
  ///     *    UpdateFleetPortSettings
  ///
  ///     *    UpdateRuntimeConfiguration
  ///
  ///
  /// *   Manage fleet actions:
  ///
  ///     *    StartFleetActions
  ///
  ///     *    StopFleetActions
  Future<void> updateRuntimeConfiguration(
      {@required String fleetId,
      @required RuntimeConfiguration runtimeConfiguration}) async {}

  /// Updates Realtime script metadata and content.
  ///
  /// To update script metadata, specify the script ID and provide updated name
  /// and/or version values.
  ///
  /// To update script content, provide an updated zip file by pointing to
  /// either a local file or an Amazon S3 bucket location. You can use either
  /// method regardless of how the original script was uploaded. Use the
  /// _Version_ parameter to track updates to the script.
  ///
  /// If the call is successful, the updated metadata is stored in the script
  /// record and a revised script is uploaded to the Amazon GameLift service.
  /// Once the script is updated and acquired by a fleet instance, the new
  /// version is used for all new game sessions.
  ///
  ///  **Learn more**
  ///
  ///  [Amazon GameLift Realtime
  /// Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///  **Related operations**
  ///
  /// *    CreateScript
  ///
  /// *    ListScripts
  ///
  /// *    DescribeScript
  ///
  /// *    UpdateScript
  ///
  /// *    DeleteScript
  Future<void> updateScript(String scriptId,
      {String name,
      String version,
      S3Location storageLocation,
      Uint8List zipFile}) async {}

  /// Validates the syntax of a matchmaking rule or rule set. This operation
  /// checks that the rule set is using syntactically correct JSON and that it
  /// conforms to allowed property expressions. To validate syntax, provide a
  /// rule set JSON string.
  ///
  ///  **Learn more**
  ///
  /// *    [Build a Rule
  /// Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
  ///
  ///
  ///  **Related operations**
  ///
  /// *    CreateMatchmakingConfiguration
  ///
  /// *    DescribeMatchmakingConfigurations
  ///
  /// *    UpdateMatchmakingConfiguration
  ///
  /// *    DeleteMatchmakingConfiguration
  ///
  /// *    CreateMatchmakingRuleSet
  ///
  /// *    DescribeMatchmakingRuleSets
  ///
  /// *    ValidateMatchmakingRuleSet
  ///
  /// *    DeleteMatchmakingRuleSet
  Future<void> validateMatchmakingRuleSet(String ruleSetBody) async {}
}

class AcceptMatchOutput {}

class Alias {}

class AttributeValue {}

class AwsCredentials {}

class Build {}

class CertificateConfiguration {}

class CreateAliasOutput {}

class CreateBuildOutput {}

class CreateFleetOutput {}

class CreateGameSessionOutput {}

class CreateGameSessionQueueOutput {}

class CreateMatchmakingConfigurationOutput {}

class CreateMatchmakingRuleSetOutput {}

class CreatePlayerSessionOutput {}

class CreatePlayerSessionsOutput {}

class CreateScriptOutput {}

class CreateVpcPeeringAuthorizationOutput {}

class CreateVpcPeeringConnectionOutput {}

class DeleteGameSessionQueueOutput {}

class DeleteMatchmakingConfigurationOutput {}

class DeleteMatchmakingRuleSetOutput {}

class DeleteVpcPeeringAuthorizationOutput {}

class DeleteVpcPeeringConnectionOutput {}

class DescribeAliasOutput {}

class DescribeBuildOutput {}

class DescribeEc2InstanceLimitsOutput {}

class DescribeFleetAttributesOutput {}

class DescribeFleetCapacityOutput {}

class DescribeFleetEventsOutput {}

class DescribeFleetPortSettingsOutput {}

class DescribeFleetUtilizationOutput {}

class DescribeGameSessionDetailsOutput {}

class DescribeGameSessionPlacementOutput {}

class DescribeGameSessionQueuesOutput {}

class DescribeGameSessionsOutput {}

class DescribeInstancesOutput {}

class DescribeMatchmakingConfigurationsOutput {}

class DescribeMatchmakingOutput {}

class DescribeMatchmakingRuleSetsOutput {}

class DescribePlayerSessionsOutput {}

class DescribeRuntimeConfigurationOutput {}

class DescribeScalingPoliciesOutput {}

class DescribeScriptOutput {}

class DescribeVpcPeeringAuthorizationsOutput {}

class DescribeVpcPeeringConnectionsOutput {}

class DesiredPlayerSession {}

class Ec2InstanceCounts {}

class Ec2InstanceLimit {}

class Event {}

class FleetAttributes {}

class FleetCapacity {}

class FleetUtilization {}

class GameProperty {}

class GameSession {}

class GameSessionConnectionInfo {}

class GameSessionDetail {}

class GameSessionPlacement {}

class GameSessionQueue {}

class GameSessionQueueDestination {}

class GetGameSessionLogUrlOutput {}

class GetInstanceAccessOutput {}

class Instance {}

class InstanceAccess {}

class InstanceCredentials {}

class IpPermission {}

class ListAliasesOutput {}

class ListBuildsOutput {}

class ListFleetsOutput {}

class ListScriptsOutput {}

class MatchedPlayerSession {}

class MatchmakingConfiguration {}

class MatchmakingRuleSet {}

class MatchmakingTicket {}

class PlacedPlayerSession {}

class Player {}

class PlayerLatency {}

class PlayerLatencyPolicy {}

class PlayerSession {}

class PutScalingPolicyOutput {}

class RequestUploadCredentialsOutput {}

class ResolveAliasOutput {}

class ResourceCreationLimitPolicy {}

class RoutingStrategy {}

class RuntimeConfiguration {}

class S3Location {}

class ScalingPolicy {}

class Script {}

class SearchGameSessionsOutput {}

class ServerProcess {}

class StartFleetActionsOutput {}

class StartGameSessionPlacementOutput {}

class StartMatchBackfillOutput {}

class StartMatchmakingOutput {}

class StopFleetActionsOutput {}

class StopGameSessionPlacementOutput {}

class StopMatchmakingOutput {}

class TargetConfiguration {}

class UpdateAliasOutput {}

class UpdateBuildOutput {}

class UpdateFleetAttributesOutput {}

class UpdateFleetCapacityOutput {}

class UpdateFleetPortSettingsOutput {}

class UpdateGameSessionOutput {}

class UpdateGameSessionQueueOutput {}

class UpdateMatchmakingConfigurationOutput {}

class UpdateRuntimeConfigurationOutput {}

class UpdateScriptOutput {}

class ValidateMatchmakingRuleSetOutput {}

class VpcPeeringAuthorization {}

class VpcPeeringConnection {}

class VpcPeeringConnectionStatus {}
