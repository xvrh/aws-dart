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
/// [Amazon GameLift Tools and Resources](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-components.html).
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
///
/// **[Task-based list of API actions](https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html)**
class GameLiftApi {
  final _client;
  GameLiftApi(client)
      : _client = client.configured('GameLift', serializer: 'json');

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
  ///
  /// [Add FlexMatch to a Game Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///
  /// [FlexMatch Events Reference](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-events.html)
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
  ///
  /// [ticketId]: Unique identifier for a matchmaking ticket. The ticket must be
  /// in status `REQUIRES_ACCEPTANCE`; otherwise this request will fail.
  ///
  /// [playerIds]: Unique identifier for a player delivering the response. This
  /// parameter can include one or multiple player IDs.
  ///
  /// [acceptanceType]: Player response to the proposed match.
  Future<AcceptMatchOutput> acceptMatch(
      {@required String ticketId,
      @required List<String> playerIds,
      @required String acceptanceType}) async {
    var response_ = await _client.send('AcceptMatch', {
      'TicketId': ticketId,
      'PlayerIds': playerIds,
      'AcceptanceType': acceptanceType,
    });
    return AcceptMatchOutput.fromJson(response_);
  }

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
  ///
  /// [name]: Descriptive label that is associated with an alias. Alias names do
  /// not need to be unique.
  ///
  /// [description]: Human-readable description of an alias.
  ///
  /// [routingStrategy]: Object that specifies the fleet and routing type to use
  /// for the alias.
  Future<CreateAliasOutput> createAlias(
      {@required String name,
      String description,
      @required RoutingStrategy routingStrategy}) async {
    var response_ = await _client.send('CreateAlias', {
      'Name': name,
      if (description != null) 'Description': description,
      'RoutingStrategy': routingStrategy,
    });
    return CreateAliasOutput.fromJson(response_);
  }

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
  /// storage location (see the Amazon S3 topic
  /// [Uploading Objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/UploadingObjects.html)).
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
  ///
  /// [Uploading Your Game](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html)
  ///
  ///
  /// [Create a Build with Files in Amazon S3](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-cli-uploading.html#gamelift-build-cli-uploading-create-build)
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
  ///
  /// [name]: Descriptive label that is associated with a build. Build names do
  /// not need to be unique. You can use UpdateBuild to change this value later.
  ///
  /// [version]: Version that is associated with a build or script. Version
  /// strings do not need to be unique. You can use UpdateBuild to change this
  /// value later.
  ///
  /// [storageLocation]: Information indicating where your game build files are
  /// stored. Use this parameter only when creating a build with files stored in
  /// an Amazon S3 bucket that you own. The storage location must specify an
  /// Amazon S3 bucket name and key, as well as a the ARN for a role that you
  /// set up to allow Amazon GameLift to access your Amazon S3 bucket. The S3
  /// bucket must be in the same region that you want to create a new build in.
  ///
  /// [operatingSystem]: Operating system that the game server binaries are
  /// built to run on. This value determines the type of fleet resources that
  /// you can use for this build. If your game build contains multiple
  /// executables, they all must run on the same operating system. If an
  /// operating system is not specified when creating a build, Amazon GameLift
  /// uses the default value (WINDOWS_2012). This value cannot be changed later.
  Future<CreateBuildOutput> createBuild(
      {String name,
      String version,
      S3Location storageLocation,
      String operatingSystem}) async {
    var response_ = await _client.send('CreateBuild', {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (operatingSystem != null) 'OperatingSystem': operatingSystem,
    });
    return CreateBuildOutput.fromJson(response_);
  }

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
  /// version of the Realtime script (see this
  /// [working code example](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-script.html#realtime-script-examples)
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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html)
  ///
  ///
  /// [Debug Fleet Creation Issues](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html)
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
  ///
  /// [name]: Descriptive label that is associated with a fleet. Fleet names do
  /// not need to be unique.
  ///
  /// [description]: Human-readable description of a fleet.
  ///
  /// [buildId]: Unique identifier for a build to be deployed on the new fleet.
  /// The custom game server build must have been successfully uploaded to
  /// Amazon GameLift and be in a `READY` status. This fleet setting cannot be
  /// changed once the fleet is created.
  ///
  /// [scriptId]: Unique identifier for a Realtime script to be deployed on the
  /// new fleet. The Realtime script must have been successfully uploaded to
  /// Amazon GameLift. This fleet setting cannot be changed once the fleet is
  /// created.
  ///
  /// [serverLaunchPath]: This parameter is no longer used. Instead, specify a
  /// server launch path using the `RuntimeConfiguration` parameter. (Requests
  /// that specify a server launch path and launch parameters instead of a
  /// run-time configuration will continue to work.)
  ///
  /// [serverLaunchParameters]: This parameter is no longer used. Instead,
  /// specify server launch parameters in the `RuntimeConfiguration` parameter.
  /// (Requests that specify a server launch path and launch parameters instead
  /// of a run-time configuration will continue to work.)
  ///
  /// [logPaths]: This parameter is no longer used. Instead, to specify where
  /// Amazon GameLift should store log files once a server process shuts down,
  /// use the Amazon GameLift server API `ProcessReady()` and specify one or
  /// more directory paths in `logParameters`. See more information in the
  /// [Server API Reference](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api-ref.html#gamelift-sdk-server-api-ref-dataypes-process).
  ///
  /// [ec2InstanceType]: Name of an EC2 instance type that is supported in
  /// Amazon GameLift. A fleet instance type determines the computing resources
  /// of each instance in the fleet, including CPU, memory, storage, and
  /// networking capacity. Amazon GameLift supports the following EC2 instance
  /// types. See
  /// [Amazon EC2 Instance Types](http://aws.amazon.com/ec2/instance-types/) for
  /// detailed descriptions.
  ///
  /// [ec2InboundPermissions]: Range of IP addresses and port settings that
  /// permit inbound traffic to access game sessions that running on the fleet.
  /// For fleets using a custom game build, this parameter is required before
  /// game sessions running on the fleet can accept connections. For Realtime
  /// Servers fleets, Amazon GameLift automatically sets TCP and UDP ranges for
  /// use by the Realtime servers. You can specify multiple permission settings
  /// or add more by updating the fleet.
  ///
  /// [newGameSessionProtectionPolicy]: Game session protection policy to apply
  /// to all instances in this fleet. If this parameter is not set, instances in
  /// this fleet default to no protection. You can change a fleet's protection
  /// policy using UpdateFleetAttributes, but this change will only affect
  /// sessions created after the policy change. You can also set protection for
  /// individual instances using UpdateGameSession.
  ///
  /// *    **NoProtection** -- The game session can be terminated during a
  /// scale-down event.
  ///
  /// *    **FullProtection** -- If the game session is in an `ACTIVE` status,
  /// it cannot be terminated during a scale-down event.
  ///
  /// [runtimeConfiguration]: Instructions for launching server processes on
  /// each instance in the fleet. Server processes run either a custom game
  /// build executable or a Realtime Servers script. The run-time configuration
  /// lists the types of server processes to run on an instance and includes the
  /// following configuration settings: the server executable or launch script
  /// file, launch parameters, and the number of processes to run concurrently
  /// on each instance. A CreateFleet request must include a run-time
  /// configuration with at least one server process configuration.
  ///
  /// [resourceCreationLimitPolicy]: Policy that limits the number of game
  /// sessions an individual player can create over a span of time for this
  /// fleet.
  ///
  /// [metricGroups]: Name of an Amazon CloudWatch metric group to add this
  /// fleet to. A metric group aggregates the metrics for all fleets in the
  /// group. Specify an existing metric group name, or provide a new name to
  /// create a new metric group. A fleet can only be included in one metric
  /// group at a time.
  ///
  /// [peerVpcAwsAccountId]: Unique identifier for the AWS account with the VPC
  /// that you want to peer your Amazon GameLift fleet with. You can find your
  /// Account ID in the AWS Management Console under account settings.
  ///
  /// [peerVpcId]: Unique identifier for a VPC with resources to be accessed by
  /// your Amazon GameLift fleet. The VPC must be in the same region where your
  /// fleet is deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  ///
  /// [fleetType]: Indicates whether to use on-demand instances or spot
  /// instances for this fleet. If empty, the default is ON_DEMAND. Both
  /// categories of instances use identical hardware and configurations based on
  /// the instance type selected for this fleet. Learn more about
  /// [On-Demand versus Spot Instances](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot).
  ///
  /// [instanceRoleArn]: Unique identifier for an AWS IAM role that manages
  /// access to your AWS services. With an instance role ARN set, any
  /// application that runs on an instance in this fleet can assume the role,
  /// including install scripts, server processes, daemons (background
  /// processes). Create a role or look up a role's ARN using the
  /// [IAM dashboard](https://console.aws.amazon.com/iam/) in the AWS Management
  /// Console. Learn more about using on-box credentials for your game servers
  /// at
  /// [Access external resources from a game server](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html).
  Future<CreateFleetOutput> createFleet(
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
      CertificateConfiguration certificateConfiguration}) async {
    var response_ = await _client.send('CreateFleet', {
      'Name': name,
      if (description != null) 'Description': description,
      if (buildId != null) 'BuildId': buildId,
      if (scriptId != null) 'ScriptId': scriptId,
      if (serverLaunchPath != null) 'ServerLaunchPath': serverLaunchPath,
      if (serverLaunchParameters != null)
        'ServerLaunchParameters': serverLaunchParameters,
      if (logPaths != null) 'LogPaths': logPaths,
      'EC2InstanceType': ec2InstanceType,
      if (ec2InboundPermissions != null)
        'EC2InboundPermissions': ec2InboundPermissions,
      if (newGameSessionProtectionPolicy != null)
        'NewGameSessionProtectionPolicy': newGameSessionProtectionPolicy,
      if (runtimeConfiguration != null)
        'RuntimeConfiguration': runtimeConfiguration,
      if (resourceCreationLimitPolicy != null)
        'ResourceCreationLimitPolicy': resourceCreationLimitPolicy,
      if (metricGroups != null) 'MetricGroups': metricGroups,
      if (peerVpcAwsAccountId != null)
        'PeerVpcAwsAccountId': peerVpcAwsAccountId,
      if (peerVpcId != null) 'PeerVpcId': peerVpcId,
      if (fleetType != null) 'FleetType': fleetType,
      if (instanceRoleArn != null) 'InstanceRoleArn': instanceRoleArn,
      if (certificateConfiguration != null)
        'CertificateConfiguration': certificateConfiguration,
    });
    return CreateFleetOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet to create a game session in. Each
  /// request must reference either a fleet ID or alias ID, but not both.
  ///
  /// [aliasId]: Unique identifier for an alias associated with the fleet to
  /// create a game session in. Each request must reference either a fleet ID or
  /// alias ID, but not both.
  ///
  /// [maximumPlayerSessionCount]: Maximum number of players that can be
  /// connected simultaneously to the game session.
  ///
  /// [name]: Descriptive label that is associated with a game session. Session
  /// names do not need to be unique.
  ///
  /// [gameProperties]: Set of custom properties for a game session, formatted
  /// as key:value pairs. These properties are passed to a game server process
  /// in the GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  ///
  /// [creatorId]: Unique identifier for a player or entity creating the game
  /// session. This ID is used to enforce a resource protection policy (if one
  /// exists) that limits the number of concurrent active game sessions one
  /// player can have.
  ///
  /// [gameSessionId]:  _This parameter is no longer preferred. Please use
  /// `IdempotencyToken` instead._ Custom string that uniquely identifies a
  /// request for a new game session. Maximum token length is 48 characters. If
  /// provided, this string is included in the new game session's ID. (A game
  /// session ARN has the following format:
  /// `arn:aws:gamelift:<region>::gamesession/<fleet ID>/<custom ID string or
  /// idempotency token>`.)
  ///
  /// [idempotencyToken]: Custom string that uniquely identifies a request for a
  /// new game session. Maximum token length is 48 characters. If provided, this
  /// string is included in the new game session's ID. (A game session ARN has
  /// the following format: `arn:aws:gamelift:<region>::gamesession/<fleet
  /// ID>/<custom ID string or idempotency token>`.) Idempotency tokens remain
  /// in use for 30 days after a game session has ended; game session objects
  /// are retained for this time period and then deleted.
  ///
  /// [gameSessionData]: Set of custom game session properties, formatted as a
  /// single string value. This data is passed to a game server process in the
  /// GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  Future<CreateGameSessionOutput> createGameSession(
      int maximumPlayerSessionCount,
      {String fleetId,
      String aliasId,
      String name,
      List<GameProperty> gameProperties,
      String creatorId,
      String gameSessionId,
      String idempotencyToken,
      String gameSessionData}) async {
    var response_ = await _client.send('CreateGameSession', {
      if (fleetId != null) 'FleetId': fleetId,
      if (aliasId != null) 'AliasId': aliasId,
      'MaximumPlayerSessionCount': maximumPlayerSessionCount,
      if (name != null) 'Name': name,
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (creatorId != null) 'CreatorId': creatorId,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
    });
    return CreateGameSessionOutput.fromJson(response_);
  }

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
  ///
  /// [name]: Descriptive label that is associated with game session queue.
  /// Queue names must be unique within each region.
  ///
  /// [timeoutInSeconds]: Maximum time, in seconds, that a new game session
  /// placement request remains in the queue. When a request exceeds this time,
  /// the game session placement changes to a `TIMED_OUT` status.
  ///
  /// [playerLatencyPolicies]: Collection of latency policies to apply when
  /// processing game sessions placement requests with player latency
  /// information. Multiple policies are evaluated in order of the maximum
  /// latency value, starting with the lowest latency values. With just one
  /// policy, it is enforced at the start of the game session placement for the
  /// duration period. With multiple policies, each policy is enforced
  /// consecutively for its duration period. For example, a queue might enforce
  /// a 60-second policy followed by a 120-second policy, and then no policy for
  /// the remainder of the placement. A player latency policy must set a value
  /// for MaximumIndividualPlayerLatencyMilliseconds; if none is set, this API
  /// requests will fail.
  ///
  /// [destinations]: List of fleets that can be used to fulfill game session
  /// placement requests in the queue. Fleets are identified by either a fleet
  /// ARN or a fleet alias ARN. Destinations are listed in default preference
  /// order.
  Future<CreateGameSessionQueueOutput> createGameSessionQueue(String name,
      {int timeoutInSeconds,
      List<PlayerLatencyPolicy> playerLatencyPolicies,
      List<GameSessionQueueDestination> destinations}) async {
    var response_ = await _client.send('CreateGameSessionQueue', {
      'Name': name,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
      if (playerLatencyPolicies != null)
        'PlayerLatencyPolicies': playerLatencyPolicies,
      if (destinations != null) 'Destinations': destinations,
    });
    return CreateGameSessionQueueOutput.fromJson(response_);
  }

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
  ///
  /// [Design a FlexMatch Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
  ///
  ///
  /// [Setting up Notifications for Matchmaking](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-notification.html)
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
  ///
  /// [name]: Unique identifier for a matchmaking configuration. This name is
  /// used to identify the configuration associated with a matchmaking request
  /// or ticket.
  ///
  /// [description]: Meaningful description of the matchmaking configuration.
  ///
  /// [gameSessionQueueArns]: Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session queue and uniquely identifies it.
  /// Format is `arn:aws:gamelift:<region>:<aws account>:gamesessionqueue/<queue
  /// name>`. These queues are used when placing game sessions for matches that
  /// are created with this matchmaking configuration. Queues can be located in
  /// any region.
  ///
  /// [requestTimeoutSeconds]: Maximum duration, in seconds, that a matchmaking
  /// ticket can remain in process before timing out. Requests that fail due to
  /// timing out can be resubmitted as needed.
  ///
  /// [acceptanceTimeoutSeconds]: Length of time (in seconds) to wait for
  /// players to accept a proposed match. If any player rejects the match or
  /// fails to accept before the timeout, the ticket continues to look for an
  /// acceptable match.
  ///
  /// [acceptanceRequired]: Flag that determines whether a match that was
  /// created with this configuration must be accepted by the matched players.
  /// To require acceptance, set to TRUE.
  ///
  /// [ruleSetName]: Unique identifier for a matchmaking rule set to use with
  /// this configuration. A matchmaking configuration can only use rule sets
  /// that are defined in the same region.
  ///
  /// [notificationTarget]: SNS topic ARN that is set up to receive matchmaking
  /// notifications.
  ///
  /// [additionalPlayerCount]: Number of player slots in a match to keep open
  /// for future players. For example, if the configuration's rule set specifies
  /// a match for a single 12-person team, and the additional player count is
  /// set to 2, only 10 players are selected for the match.
  ///
  /// [customEventData]: Information to be added to all events related to this
  /// matchmaking configuration.
  ///
  /// [gameProperties]: Set of custom properties for a game session, formatted
  /// as key:value pairs. These properties are passed to a game server process
  /// in the GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  ///
  /// [gameSessionData]: Set of custom game session properties, formatted as a
  /// single string value. This data is passed to a game server process in the
  /// GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  ///
  /// [backfillMode]: Method used to backfill game sessions created with this
  /// matchmaking configuration. Specify MANUAL when your game manages backfill
  /// requests manually or does not use the match backfill feature. Specify
  /// AUTOMATIC to have GameLift create a StartMatchBackfill request whenever a
  /// game session has one or more open slots. Learn more about manual and
  /// automatic backfill in
  /// [Backfill Existing Games with FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-backfill.html).
  Future<CreateMatchmakingConfigurationOutput> createMatchmakingConfiguration(
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
      String backfillMode}) async {
    var response_ = await _client.send('CreateMatchmakingConfiguration', {
      'Name': name,
      if (description != null) 'Description': description,
      'GameSessionQueueArns': gameSessionQueueArns,
      'RequestTimeoutSeconds': requestTimeoutSeconds,
      if (acceptanceTimeoutSeconds != null)
        'AcceptanceTimeoutSeconds': acceptanceTimeoutSeconds,
      'AcceptanceRequired': acceptanceRequired,
      'RuleSetName': ruleSetName,
      if (notificationTarget != null) 'NotificationTarget': notificationTarget,
      if (additionalPlayerCount != null)
        'AdditionalPlayerCount': additionalPlayerCount,
      if (customEventData != null) 'CustomEventData': customEventData,
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
      if (backfillMode != null) 'BackfillMode': backfillMode,
    });
    return CreateMatchmakingConfigurationOutput.fromJson(response_);
  }

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
  /// *
  /// [Build a Rule Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
  ///
  /// *
  /// [Design a Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
  ///
  /// *
  /// [Matchmaking with FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-intro.html)
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
  ///
  /// [name]: Unique identifier for a matchmaking rule set. A matchmaking
  /// configuration identifies the rule set it uses by this name value. (Note:
  /// The rule set name is different from the optional "name" field in the rule
  /// set body.)
  ///
  /// [ruleSetBody]: Collection of matchmaking rules, formatted as a JSON
  /// string. Comments are not allowed in JSON, but most elements support a
  /// description field.
  Future<CreateMatchmakingRuleSetOutput> createMatchmakingRuleSet(
      {@required String name, @required String ruleSetBody}) async {
    var response_ = await _client.send('CreateMatchmakingRuleSet', {
      'Name': name,
      'RuleSetBody': ruleSetBody,
    });
    return CreateMatchmakingRuleSetOutput.fromJson(response_);
  }

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
  ///
  /// [gameSessionId]: Unique identifier for the game session to add a player
  /// to.
  ///
  /// [playerId]: Unique identifier for a player. Player IDs are
  /// developer-defined.
  ///
  /// [playerData]: Developer-defined information related to a player. Amazon
  /// GameLift does not use this data, so it can be formatted as needed for use
  /// in the game.
  Future<CreatePlayerSessionOutput> createPlayerSession(
      {@required String gameSessionId,
      @required String playerId,
      String playerData}) async {
    var response_ = await _client.send('CreatePlayerSession', {
      'GameSessionId': gameSessionId,
      'PlayerId': playerId,
      if (playerData != null) 'PlayerData': playerData,
    });
    return CreatePlayerSessionOutput.fromJson(response_);
  }

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
  ///
  /// [gameSessionId]: Unique identifier for the game session to add players to.
  ///
  /// [playerIds]: List of unique identifiers for the players to be added.
  ///
  /// [playerDataMap]: Map of string pairs, each specifying a player ID and a
  /// set of developer-defined information related to the player. Amazon
  /// GameLift does not use this data, so it can be formatted as needed for use
  /// in the game. Player data strings for player IDs not included in the
  /// `PlayerIds` parameter are ignored.
  Future<CreatePlayerSessionsOutput> createPlayerSessions(
      {@required String gameSessionId,
      @required List<String> playerIds,
      Map<String, String> playerDataMap}) async {
    var response_ = await _client.send('CreatePlayerSessions', {
      'GameSessionId': gameSessionId,
      'PlayerIds': playerIds,
      if (playerDataMap != null) 'PlayerDataMap': playerDataMap,
    });
    return CreatePlayerSessionsOutput.fromJson(response_);
  }

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
  ///
  /// [Amazon GameLift Realtime Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
  ///
  ///
  /// [Set Up a Role for Amazon GameLift Access](https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html)
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
  ///
  /// [name]: Descriptive label that is associated with a script. Script names
  /// do not need to be unique. You can use UpdateScript to change this value
  /// later.
  ///
  /// [version]: Version that is associated with a build or script. Version
  /// strings do not need to be unique. You can use UpdateScript to change this
  /// value later.
  ///
  /// [storageLocation]: Location of the Amazon S3 bucket where a zipped file
  /// containing your Realtime scripts is stored. The storage location must
  /// specify the Amazon S3 bucket name, the zip file name (the "key"), and a
  /// role ARN that allows Amazon GameLift to access the Amazon S3 storage
  /// location. The S3 bucket must be in the same region where you want to
  /// create a new script. By default, Amazon GameLift uploads the latest
  /// version of the zip file; if you have S3 object versioning turned on, you
  /// can use the `ObjectVersion` parameter to specify an earlier version.
  ///
  /// [zipFile]: Data object containing your Realtime scripts and dependencies
  /// as a zip file. The zip file can have one or multiple files. Maximum size
  /// of a zip file is 5 MB.
  ///
  /// When using the AWS CLI tool to create a script, this parameter is set to
  /// the zip file name. It must be prepended with the string "fileb://" to
  /// indicate that the file data is a binary object. For example: `--zip-file
  /// fileb://myRealtimeScript.zip`.
  Future<CreateScriptOutput> createScript(
      {String name,
      String version,
      S3Location storageLocation,
      Uint8List zipFile}) async {
    var response_ = await _client.send('CreateScript', {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (zipFile != null) 'ZipFile': zipFile,
    });
    return CreateScriptOutput.fromJson(response_);
  }

  /// Requests authorization to create or delete a peer connection between the
  /// VPC for your Amazon GameLift fleet and a virtual private cloud (VPC) in
  /// your AWS account. VPC peering enables the game servers on your fleet to
  /// communicate directly with other AWS resources. Once you've received
  /// authorization, call CreateVpcPeeringConnection to establish the peering
  /// connection. For more information, see
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
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
  ///
  /// [gameLiftAwsAccountId]: Unique identifier for the AWS account that you use
  /// to manage your Amazon GameLift fleet. You can find your Account ID in the
  /// AWS Management Console under account settings.
  ///
  /// [peerVpcId]: Unique identifier for a VPC with resources to be accessed by
  /// your Amazon GameLift fleet. The VPC must be in the same region where your
  /// fleet is deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  Future<CreateVpcPeeringAuthorizationOutput> createVpcPeeringAuthorization(
      {@required String gameLiftAwsAccountId,
      @required String peerVpcId}) async {
    var response_ = await _client.send('CreateVpcPeeringAuthorization', {
      'GameLiftAwsAccountId': gameLiftAwsAccountId,
      'PeerVpcId': peerVpcId,
    });
    return CreateVpcPeeringAuthorizationOutput.fromJson(response_);
  }

  /// Establishes a VPC peering connection between a virtual private cloud (VPC)
  /// in an AWS account with the VPC for your Amazon GameLift fleet. VPC peering
  /// enables the game servers on your fleet to communicate directly with other
  /// AWS resources. You can peer with VPCs in any AWS account that you have
  /// access to, including the account that you use to manage your Amazon
  /// GameLift fleets. You cannot peer with VPCs that are in different regions.
  /// For more information, see
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet. This tells Amazon GameLift which
  /// GameLift VPC to peer with.
  ///
  /// [peerVpcAwsAccountId]: Unique identifier for the AWS account with the VPC
  /// that you want to peer your Amazon GameLift fleet with. You can find your
  /// Account ID in the AWS Management Console under account settings.
  ///
  /// [peerVpcId]: Unique identifier for a VPC with resources to be accessed by
  /// your Amazon GameLift fleet. The VPC must be in the same region where your
  /// fleet is deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  Future<CreateVpcPeeringConnectionOutput> createVpcPeeringConnection(
      {@required String fleetId,
      @required String peerVpcAwsAccountId,
      @required String peerVpcId}) async {
    var response_ = await _client.send('CreateVpcPeeringConnection', {
      'FleetId': fleetId,
      'PeerVpcAwsAccountId': peerVpcAwsAccountId,
      'PeerVpcId': peerVpcId,
    });
    return CreateVpcPeeringConnectionOutput.fromJson(response_);
  }

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
  ///
  /// [aliasId]: Unique identifier for a fleet alias. Specify the alias you want
  /// to delete.
  Future<void> deleteAlias(String aliasId) async {
    await _client.send('DeleteAlias', {
      'AliasId': aliasId,
    });
  }

  /// Deletes a build. This action permanently deletes the build record and any
  /// uploaded build files.
  ///
  /// To delete a build, specify its ID. Deleting a build does not affect the
  /// status of any active fleets using the build, but you can no longer create
  /// new fleets with the deleted build.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
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
  ///
  /// [buildId]: Unique identifier for a build to delete.
  Future<void> deleteBuild(String buildId) async {
    await _client.send('DeleteBuild', {
      'BuildId': buildId,
    });
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to be deleted.
  Future<void> deleteFleet(String fleetId) async {
    await _client.send('DeleteFleet', {
      'FleetId': fleetId,
    });
  }

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
  ///
  /// [name]: Descriptive label that is associated with game session queue.
  /// Queue names must be unique within each region.
  Future<DeleteGameSessionQueueOutput> deleteGameSessionQueue(
      String name) async {
    var response_ = await _client.send('DeleteGameSessionQueue', {
      'Name': name,
    });
    return DeleteGameSessionQueueOutput.fromJson(response_);
  }

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
  ///
  /// [name]: Unique identifier for a matchmaking configuration
  Future<DeleteMatchmakingConfigurationOutput> deleteMatchmakingConfiguration(
      String name) async {
    var response_ = await _client.send('DeleteMatchmakingConfiguration', {
      'Name': name,
    });
    return DeleteMatchmakingConfigurationOutput.fromJson(response_);
  }

  /// Deletes an existing matchmaking rule set. To delete the rule set, provide
  /// the rule set name. Rule sets cannot be deleted if they are currently being
  /// used by a matchmaking configuration.
  ///
  ///  **Learn more**
  ///
  /// *
  /// [Build a Rule Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
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
  ///
  /// [name]: Unique identifier for a matchmaking rule set to be deleted. (Note:
  /// The rule set name is different from the optional "name" field in the rule
  /// set body.)
  Future<DeleteMatchmakingRuleSetOutput> deleteMatchmakingRuleSet(
      String name) async {
    var response_ = await _client.send('DeleteMatchmakingRuleSet', {
      'Name': name,
    });
    return DeleteMatchmakingRuleSetOutput.fromJson(response_);
  }

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
  ///
  /// [name]: Descriptive label that is associated with a scaling policy. Policy
  /// names do not need to be unique.
  ///
  /// [fleetId]: Unique identifier for a fleet to be deleted.
  Future<void> deleteScalingPolicy(
      {@required String name, @required String fleetId}) async {
    await _client.send('DeleteScalingPolicy', {
      'Name': name,
      'FleetId': fleetId,
    });
  }

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
  ///
  /// [Amazon GameLift Realtime Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
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
  ///
  /// [scriptId]: Unique identifier for a Realtime script to delete.
  Future<void> deleteScript(String scriptId) async {
    await _client.send('DeleteScript', {
      'ScriptId': scriptId,
    });
  }

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
  ///
  /// [gameLiftAwsAccountId]: Unique identifier for the AWS account that you use
  /// to manage your Amazon GameLift fleet. You can find your Account ID in the
  /// AWS Management Console under account settings.
  ///
  /// [peerVpcId]: Unique identifier for a VPC with resources to be accessed by
  /// your Amazon GameLift fleet. The VPC must be in the same region where your
  /// fleet is deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  Future<DeleteVpcPeeringAuthorizationOutput> deleteVpcPeeringAuthorization(
      {@required String gameLiftAwsAccountId,
      @required String peerVpcId}) async {
    var response_ = await _client.send('DeleteVpcPeeringAuthorization', {
      'GameLiftAwsAccountId': gameLiftAwsAccountId,
      'PeerVpcId': peerVpcId,
    });
    return DeleteVpcPeeringAuthorizationOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet. This value must match the fleet
  /// ID referenced in the VPC peering connection record.
  ///
  /// [vpcPeeringConnectionId]: Unique identifier for a VPC peering connection.
  /// This value is included in the VpcPeeringConnection object, which can be
  /// retrieved by calling DescribeVpcPeeringConnections.
  Future<DeleteVpcPeeringConnectionOutput> deleteVpcPeeringConnection(
      {@required String fleetId,
      @required String vpcPeeringConnectionId}) async {
    var response_ = await _client.send('DeleteVpcPeeringConnection', {
      'FleetId': fleetId,
      'VpcPeeringConnectionId': vpcPeeringConnectionId,
    });
    return DeleteVpcPeeringConnectionOutput.fromJson(response_);
  }

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
  ///
  /// [aliasId]: Unique identifier for a fleet alias. Specify the alias you want
  /// to retrieve.
  Future<DescribeAliasOutput> describeAlias(String aliasId) async {
    var response_ = await _client.send('DescribeAlias', {
      'AliasId': aliasId,
    });
    return DescribeAliasOutput.fromJson(response_);
  }

  /// Retrieves properties for a build. To request a build record, specify a
  /// build ID. If successful, an object containing the build properties is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
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
  ///
  /// [buildId]: Unique identifier for a build to retrieve properties for.
  Future<DescribeBuildOutput> describeBuild(String buildId) async {
    var response_ = await _client.send('DescribeBuild', {
      'BuildId': buildId,
    });
    return DescribeBuildOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [ec2InstanceType]: Name of an EC2 instance type that is supported in
  /// Amazon GameLift. A fleet instance type determines the computing resources
  /// of each instance in the fleet, including CPU, memory, storage, and
  /// networking capacity. Amazon GameLift supports the following EC2 instance
  /// types. See
  /// [Amazon EC2 Instance Types](http://aws.amazon.com/ec2/instance-types/) for
  /// detailed descriptions. Leave this parameter blank to retrieve limits for
  /// all types.
  Future<DescribeEc2InstanceLimitsOutput> describeEc2InstanceLimits(
      {String ec2InstanceType}) async {
    var response_ = await _client.send('DescribeEC2InstanceLimits', {
      if (ec2InstanceType != null) 'EC2InstanceType': ec2InstanceType,
    });
    return DescribeEc2InstanceLimitsOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetIds]: Unique identifier for a fleet(s) to retrieve attributes for.
  /// To request attributes for all fleets, leave this parameter empty.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. This parameter is
  /// ignored when the request specifies one or a list of fleet IDs.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value. This parameter is ignored when the request specifies one or a list
  /// of fleet IDs.
  Future<DescribeFleetAttributesOutput> describeFleetAttributes(
      {List<String> fleetIds, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeFleetAttributes', {
      if (fleetIds != null) 'FleetIds': fleetIds,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeFleetAttributesOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetIds]: Unique identifier for a fleet(s) to retrieve capacity
  /// information for. To request capacity information for all fleets, leave
  /// this parameter empty.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. This parameter is
  /// ignored when the request specifies one or a list of fleet IDs.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value. This parameter is ignored when the request specifies one or a list
  /// of fleet IDs.
  Future<DescribeFleetCapacityOutput> describeFleetCapacity(
      {List<String> fleetIds, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeFleetCapacity', {
      if (fleetIds != null) 'FleetIds': fleetIds,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeFleetCapacityOutput.fromJson(response_);
  }

  /// Retrieves entries from the specified fleet's event log. You can specify a
  /// time range to limit the result set. Use the pagination parameters to
  /// retrieve results as a set of sequential pages. If successful, a collection
  /// of event log entries matching the request are returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to get event logs for.
  ///
  /// [startTime]: Earliest date to retrieve event logs for. If no start time is
  /// specified, this call returns entries starting from when the fleet was
  /// created to the specified end time. Format is a number expressed in Unix
  /// time as milliseconds (ex: "1469498468.057").
  ///
  /// [endTime]: Most recent date to retrieve event logs for. If no end time is
  /// specified, this call returns entries from the specified start time up to
  /// the present. Format is a number expressed in Unix time as milliseconds
  /// (ex: "1469498468.057").
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeFleetEventsOutput> describeFleetEvents(String fleetId,
      {DateTime startTime,
      DateTime endTime,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribeFleetEvents', {
      'FleetId': fleetId,
      if (startTime != null) 'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeFleetEventsOutput.fromJson(response_);
  }

  /// Retrieves the inbound connection permissions for a fleet. Connection
  /// permissions include a range of IP addresses and port settings that
  /// incoming traffic can use to access server processes in the fleet. To get a
  /// fleet's inbound connection permissions, specify a fleet ID. If successful,
  /// a collection of IpPermission objects is returned for the requested fleet
  /// ID. If the requested fleet has been deleted, the result set is empty.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to retrieve port settings for.
  Future<DescribeFleetPortSettingsOutput> describeFleetPortSettings(
      String fleetId) async {
    var response_ = await _client.send('DescribeFleetPortSettings', {
      'FleetId': fleetId,
    });
    return DescribeFleetPortSettingsOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetIds]: Unique identifier for a fleet(s) to retrieve utilization data
  /// for. To request utilization data for all fleets, leave this parameter
  /// empty.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. This parameter is
  /// ignored when the request specifies one or a list of fleet IDs.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value. This parameter is ignored when the request specifies one or a list
  /// of fleet IDs.
  Future<DescribeFleetUtilizationOutput> describeFleetUtilization(
      {List<String> fleetIds, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeFleetUtilization', {
      if (fleetIds != null) 'FleetIds': fleetIds,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeFleetUtilizationOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet to retrieve all game sessions
  /// active on the fleet.
  ///
  /// [gameSessionId]: Unique identifier for the game session to retrieve.
  ///
  /// [aliasId]: Unique identifier for an alias associated with the fleet to
  /// retrieve all game sessions for.
  ///
  /// [statusFilter]: Game session status to filter results on. Possible game
  /// session statuses include `ACTIVE`, `TERMINATED`, `ACTIVATING` and
  /// `TERMINATING` (the last two are transitory).
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeGameSessionDetailsOutput> describeGameSessionDetails(
      {String fleetId,
      String gameSessionId,
      String aliasId,
      String statusFilter,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribeGameSessionDetails', {
      if (fleetId != null) 'FleetId': fleetId,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (aliasId != null) 'AliasId': aliasId,
      if (statusFilter != null) 'StatusFilter': statusFilter,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeGameSessionDetailsOutput.fromJson(response_);
  }

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
  ///
  /// [placementId]: Unique identifier for a game session placement to retrieve.
  Future<DescribeGameSessionPlacementOutput> describeGameSessionPlacement(
      String placementId) async {
    var response_ = await _client.send('DescribeGameSessionPlacement', {
      'PlacementId': placementId,
    });
    return DescribeGameSessionPlacementOutput.fromJson(response_);
  }

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
  ///
  /// [names]: List of queue names to retrieve information for. To request
  /// settings for all queues, leave this parameter empty.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeGameSessionQueuesOutput> describeGameSessionQueues(
      {List<String> names, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeGameSessionQueues', {
      if (names != null) 'Names': names,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeGameSessionQueuesOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet to retrieve all game sessions
  /// for.
  ///
  /// [gameSessionId]: Unique identifier for the game session to retrieve. You
  /// can use either a `GameSessionId` or `GameSessionArn` value.
  ///
  /// [aliasId]: Unique identifier for an alias associated with the fleet to
  /// retrieve all game sessions for.
  ///
  /// [statusFilter]: Game session status to filter results on. Possible game
  /// session statuses include `ACTIVE`, `TERMINATED`, `ACTIVATING`, and
  /// `TERMINATING` (the last two are transitory).
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeGameSessionsOutput> describeGameSessions(
      {String fleetId,
      String gameSessionId,
      String aliasId,
      String statusFilter,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribeGameSessions', {
      if (fleetId != null) 'FleetId': fleetId,
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (aliasId != null) 'AliasId': aliasId,
      if (statusFilter != null) 'StatusFilter': statusFilter,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeGameSessionsOutput.fromJson(response_);
  }

  /// Retrieves information about a fleet's instances, including instance IDs.
  /// Use this action to get details on all instances in the fleet or get
  /// details on one specific instance.
  ///
  /// To get a specific instance, specify fleet ID and instance ID. To get all
  /// instances in a fleet, specify a fleet ID only. Use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, an Instance object is returned for each result.
  ///
  /// [fleetId]: Unique identifier for a fleet to retrieve instance information
  /// for.
  ///
  /// [instanceId]: Unique identifier for an instance to retrieve. Specify an
  /// instance ID or leave blank to retrieve all instances in the fleet.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeInstancesOutput> describeInstances(String fleetId,
      {String instanceId, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeInstances', {
      'FleetId': fleetId,
      if (instanceId != null) 'InstanceId': instanceId,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeInstancesOutput.fromJson(response_);
  }

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
  ///
  /// [Add FlexMatch to a Game Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///
  /// [Set Up FlexMatch Event Notification](https://docs.aws.amazon.com/gamelift/latest/developerguidematch-notification.html)
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
  ///
  /// [ticketIds]: Unique identifier for a matchmaking ticket. You can include
  /// up to 10 ID values.
  Future<DescribeMatchmakingOutput> describeMatchmaking(
      List<String> ticketIds) async {
    var response_ = await _client.send('DescribeMatchmaking', {
      'TicketIds': ticketIds,
    });
    return DescribeMatchmakingOutput.fromJson(response_);
  }

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
  ///
  /// [Setting Up FlexMatch Matchmakers](https://docs.aws.amazon.com/gamelift/latest/developerguide/matchmaker-build.html)
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
  ///
  /// [names]: Unique identifier for a matchmaking configuration(s) to retrieve.
  /// To request all existing configurations, leave this parameter empty.
  ///
  /// [ruleSetName]: Unique identifier for a matchmaking rule set. Use this
  /// parameter to retrieve all matchmaking configurations that use this rule
  /// set.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. This parameter is
  /// limited to 10.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeMatchmakingConfigurationsOutput>
      describeMatchmakingConfigurations(
          {List<String> names,
          String ruleSetName,
          int limit,
          String nextToken}) async {
    var response_ = await _client.send('DescribeMatchmakingConfigurations', {
      if (names != null) 'Names': names,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeMatchmakingConfigurationsOutput.fromJson(response_);
  }

  /// Retrieves the details for FlexMatch matchmaking rule sets. You can request
  /// all existing rule sets for the region, or provide a list of one or more
  /// rule set names. When requesting multiple items, use the pagination
  /// parameters to retrieve results as a set of sequential pages. If
  /// successful, a rule set is returned for each requested name.
  ///
  ///  **Learn more**
  ///
  /// *
  /// [Build a Rule Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
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
  ///
  /// [names]: List of one or more matchmaking rule set names to retrieve
  /// details for. (Note: The rule set name is different from the optional
  /// "name" field in the rule set body.)
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeMatchmakingRuleSetsOutput> describeMatchmakingRuleSets(
      {List<String> names, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeMatchmakingRuleSets', {
      if (names != null) 'Names': names,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeMatchmakingRuleSetsOutput.fromJson(response_);
  }

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
  ///
  /// [gameSessionId]: Unique identifier for the game session to retrieve player
  /// sessions for.
  ///
  /// [playerId]: Unique identifier for a player to retrieve player sessions
  /// for.
  ///
  /// [playerSessionId]: Unique identifier for a player session to retrieve.
  ///
  /// [playerSessionStatusFilter]: Player session status to filter results on.
  ///
  /// Possible player session statuses include the following:
  ///
  /// *    **RESERVED** -- The player session request has been received, but the
  /// player has not yet connected to the server process and/or been validated.
  ///
  /// *    **ACTIVE** -- The player has been validated by the server process and
  /// is currently connected.
  ///
  /// *    **COMPLETED** -- The player connection has been dropped.
  ///
  /// *    **TIMEDOUT** -- A player session request was received, but the player
  /// did not connect and/or was not validated within the timeout limit (60
  /// seconds).
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. If a player
  /// session ID is specified, this parameter is ignored.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value. If a player session ID is specified, this parameter is ignored.
  Future<DescribePlayerSessionsOutput> describePlayerSessions(
      {String gameSessionId,
      String playerId,
      String playerSessionId,
      String playerSessionStatusFilter,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('DescribePlayerSessions', {
      if (gameSessionId != null) 'GameSessionId': gameSessionId,
      if (playerId != null) 'PlayerId': playerId,
      if (playerSessionId != null) 'PlayerSessionId': playerSessionId,
      if (playerSessionStatusFilter != null)
        'PlayerSessionStatusFilter': playerSessionStatusFilter,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribePlayerSessionsOutput.fromJson(response_);
  }

  /// Retrieves the current run-time configuration for the specified fleet. The
  /// run-time configuration tells Amazon GameLift how to launch server
  /// processes on instances in the fleet.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to get the run-time configuration
  /// for.
  Future<DescribeRuntimeConfigurationOutput> describeRuntimeConfiguration(
      String fleetId) async {
    var response_ = await _client.send('DescribeRuntimeConfiguration', {
      'FleetId': fleetId,
    });
    return DescribeRuntimeConfigurationOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet to retrieve scaling policies for.
  ///
  /// [statusFilter]: Scaling policy status to filter results on. A scaling
  /// policy is only in force when in an `ACTIVE` status.
  ///
  /// *    **ACTIVE** -- The scaling policy is currently in force.
  ///
  /// *    **UPDATEREQUESTED** -- A request to update the scaling policy has
  /// been received.
  ///
  /// *    **UPDATING** -- A change is being made to the scaling policy.
  ///
  /// *    **DELETEREQUESTED** -- A request to delete the scaling policy has
  /// been received.
  ///
  /// *    **DELETING** -- The scaling policy is being deleted.
  ///
  /// *    **DELETED** -- The scaling policy has been deleted.
  ///
  /// *    **ERROR** -- An error occurred in creating the policy. It should be
  /// removed and recreated.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<DescribeScalingPoliciesOutput> describeScalingPolicies(String fleetId,
      {String statusFilter, int limit, String nextToken}) async {
    var response_ = await _client.send('DescribeScalingPolicies', {
      'FleetId': fleetId,
      if (statusFilter != null) 'StatusFilter': statusFilter,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return DescribeScalingPoliciesOutput.fromJson(response_);
  }

  /// Retrieves properties for a Realtime script.
  ///
  /// To request a script record, specify the script ID. If successful, an
  /// object containing the script properties is returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Amazon GameLift Realtime Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
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
  ///
  /// [scriptId]: Unique identifier for a Realtime script to retrieve properties
  /// for.
  Future<DescribeScriptOutput> describeScript(String scriptId) async {
    var response_ = await _client.send('DescribeScript', {
      'ScriptId': scriptId,
    });
    return DescribeScriptOutput.fromJson(response_);
  }

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
  Future<DescribeVpcPeeringAuthorizationsOutput>
      describeVpcPeeringAuthorizations() async {
    var response_ = await _client.send('DescribeVpcPeeringAuthorizations', {});
    return DescribeVpcPeeringAuthorizationsOutput.fromJson(response_);
  }

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
  ///
  /// [fleetId]: Unique identifier for a fleet.
  Future<DescribeVpcPeeringConnectionsOutput> describeVpcPeeringConnections(
      {String fleetId}) async {
    var response_ = await _client.send('DescribeVpcPeeringConnections', {
      if (fleetId != null) 'FleetId': fleetId,
    });
    return DescribeVpcPeeringConnectionsOutput.fromJson(response_);
  }

  /// Retrieves the location of stored game session logs for a specified game
  /// session. When a game session is terminated, Amazon GameLift automatically
  /// stores the logs in Amazon S3 and retains them for 14 days. Use this URL to
  /// download the logs.
  ///
  ///  See the
  /// [AWS Service Limits](https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_gamelift)
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
  ///
  /// [gameSessionId]: Unique identifier for the game session to get logs for.
  Future<GetGameSessionLogUrlOutput> getGameSessionLogUrl(
      String gameSessionId) async {
    var response_ = await _client.send('GetGameSessionLogUrl', {
      'GameSessionId': gameSessionId,
    });
    return GetGameSessionLogUrlOutput.fromJson(response_);
  }

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
  /// information on remote access, see
  /// [Remotely Accessing an Instance](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-remote-access.html).
  ///
  /// To request access to a specific instance, specify the IDs of both the
  /// instance and the fleet it belongs to. You can retrieve a fleet's instance
  /// IDs by calling DescribeInstances. If successful, an InstanceAccess object
  /// is returned containing the instance's IP address and a set of credentials.
  ///
  /// [fleetId]: Unique identifier for a fleet that contains the instance you
  /// want access to. The fleet can be in any of the following statuses:
  /// `ACTIVATING`, `ACTIVE`, or `ERROR`. Fleets with an `ERROR` status may be
  /// accessible for a short time before they are deleted.
  ///
  /// [instanceId]: Unique identifier for an instance you want to get access to.
  /// You can access an instance in any status.
  Future<GetInstanceAccessOutput> getInstanceAccess(
      {@required String fleetId, @required String instanceId}) async {
    var response_ = await _client.send('GetInstanceAccess', {
      'FleetId': fleetId,
      'InstanceId': instanceId,
    });
    return GetInstanceAccessOutput.fromJson(response_);
  }

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
  ///
  /// [routingStrategyType]: Type of routing to filter results on. Use this
  /// parameter to retrieve only aliases of a certain type. To retrieve all
  /// aliases, leave this parameter empty.
  ///
  /// Possible routing types include the following:
  ///
  /// *    **SIMPLE** -- The alias resolves to one specific fleet. Use this type
  /// when routing to active fleets.
  ///
  /// *    **TERMINAL** -- The alias does not resolve to a fleet but instead can
  /// be used to display a message to the user. A terminal alias throws a
  /// TerminalRoutingStrategyException with the RoutingStrategy message
  /// embedded.
  ///
  /// [name]: Descriptive label that is associated with an alias. Alias names do
  /// not need to be unique.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<ListAliasesOutput> listAliases(
      {String routingStrategyType,
      String name,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('ListAliases', {
      if (routingStrategyType != null)
        'RoutingStrategyType': routingStrategyType,
      if (name != null) 'Name': name,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListAliasesOutput.fromJson(response_);
  }

  /// Retrieves build records for all builds associated with the AWS account in
  /// use. You can limit results to builds that are in a specific status by
  /// using the `Status` parameter. Use the pagination parameters to retrieve
  /// results in a set of sequential pages.
  ///
  ///  Build records are not listed in any particular order.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
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
  ///
  /// [status]: Build status to filter results by. To retrieve all builds, leave
  /// this parameter empty.
  ///
  /// Possible build statuses include the following:
  ///
  /// *    **INITIALIZED** -- A new build has been defined, but no files have
  /// been uploaded. You cannot create fleets for builds that are in this
  /// status. When a build is successfully created, the build status is set to
  /// this value.
  ///
  /// *    **READY** -- The game build has been successfully uploaded. You can
  /// now create new fleets for this build.
  ///
  /// *    **FAILED** -- The game build upload failed. You cannot create new
  /// fleets for this build.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<ListBuildsOutput> listBuilds(
      {String status, int limit, String nextToken}) async {
    var response_ = await _client.send('ListBuilds', {
      if (status != null) 'Status': status,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListBuildsOutput.fromJson(response_);
  }

  /// Retrieves a collection of fleet records for this AWS account. You can
  /// filter the result set to find only those fleets that are deployed with a
  /// specific build or script. Use the pagination parameters to retrieve
  /// results in sequential pages.
  ///
  ///  Fleet records are not listed in a particular order.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Set Up Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [buildId]: Unique identifier for a build to return fleets for. Use this
  /// parameter to return only fleets using the specified build. To retrieve all
  /// fleets, leave this parameter empty.
  ///
  /// [scriptId]: Unique identifier for a Realtime script to return fleets for.
  /// Use this parameter to return only fleets using the specified script. To
  /// retrieve all fleets, leave this parameter empty.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<ListFleetsOutput> listFleets(
      {String buildId, String scriptId, int limit, String nextToken}) async {
    var response_ = await _client.send('ListFleets', {
      if (buildId != null) 'BuildId': buildId,
      if (scriptId != null) 'ScriptId': scriptId,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListFleetsOutput.fromJson(response_);
  }

  /// Retrieves script records for all Realtime scripts that are associated with
  /// the AWS account in use.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Amazon GameLift Realtime Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
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
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<ListScriptsOutput> listScripts({int limit, String nextToken}) async {
    var response_ = await _client.send('ListScripts', {
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return ListScriptsOutput.fromJson(response_);
  }

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
  /// Learn more about how to work with auto-scaling in
  /// [Set Up Fleet Automatic Scaling](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-autoscaling.html).
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
  /// If `[MetricName]` is `[ComparisonOperator]` `[Threshold]` for
  /// `[EvaluationPeriods]` minutes, then `[ScalingAdjustmentType]` to/by
  /// `[ScalingAdjustment]`.
  ///
  /// To implement the example, the rule statement would look like this:
  ///
  /// If `[PercentIdleInstances]` is `[GreaterThanThreshold]` `[20]` for `[15]`
  /// minutes, then `[PercentChangeInCapacity]` to/by `[10]`.
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
  ///
  /// [name]: Descriptive label that is associated with a scaling policy. Policy
  /// names do not need to be unique. A fleet can have only one scaling policy
  /// with the same name.
  ///
  /// [fleetId]: Unique identifier for a fleet to apply this policy to. The
  /// fleet cannot be in any of the following statuses: ERROR or DELETING.
  ///
  /// [scalingAdjustment]: Amount of adjustment to make, based on the scaling
  /// adjustment type.
  ///
  /// [scalingAdjustmentType]: Type of adjustment to make to a fleet's instance
  /// count (see FleetCapacity):
  ///
  /// *    **ChangeInCapacity** -- add (or subtract) the scaling adjustment
  /// value from the current instance count. Positive values scale up while
  /// negative values scale down.
  ///
  /// *    **ExactCapacity** -- set the instance count to the scaling adjustment
  /// value.
  ///
  /// *    **PercentChangeInCapacity** -- increase or reduce the current
  /// instance count by the scaling adjustment, read as a percentage. Positive
  /// values scale up while negative values scale down; for example, a value of
  /// "-10" scales the fleet down by 10%.
  ///
  /// [threshold]: Metric value used to trigger a scaling event.
  ///
  /// [comparisonOperator]: Comparison operator to use when measuring the metric
  /// against the threshold value.
  ///
  /// [evaluationPeriods]: Length of time (in minutes) the metric must be at or
  /// beyond the threshold before a scaling event is triggered.
  ///
  /// [metricName]: Name of the Amazon GameLift-defined metric that is used to
  /// trigger a scaling adjustment. For detailed descriptions of fleet metrics,
  /// see
  /// [Monitor Amazon GameLift with Amazon CloudWatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html).
  ///
  /// *    **ActivatingGameSessions** -- Game sessions in the process of being
  /// created.
  ///
  /// *    **ActiveGameSessions** -- Game sessions that are currently running.
  ///
  /// *    **ActiveInstances** -- Fleet instances that are currently running at
  /// least one game session.
  ///
  /// *    **AvailableGameSessions** -- Additional game sessions that fleet
  /// could host simultaneously, given current capacity.
  ///
  /// *    **AvailablePlayerSessions** -- Empty player slots in currently active
  /// game sessions. This includes game sessions that are not currently
  /// accepting players. Reserved player slots are not included.
  ///
  /// *    **CurrentPlayerSessions** -- Player slots in active game sessions
  /// that are being used by a player or are reserved for a player.
  ///
  /// *    **IdleInstances** -- Active instances that are currently hosting zero
  /// game sessions.
  ///
  /// *    **PercentAvailableGameSessions** -- Unused percentage of the total
  /// number of game sessions that a fleet could host simultaneously, given
  /// current capacity. Use this metric for a target-based scaling policy.
  ///
  /// *    **PercentIdleInstances** -- Percentage of the total number of active
  /// instances that are hosting zero game sessions.
  ///
  /// *    **QueueDepth** -- Pending game session placement requests, in any
  /// queue, where the current fleet is the top-priority destination.
  ///
  /// *    **WaitTime** -- Current wait time for pending game session placement
  /// requests, in any queue, where the current fleet is the top-priority
  /// destination.
  ///
  /// [policyType]: Type of scaling policy to create. For a target-based policy,
  /// set the parameter _MetricName_ to 'PercentAvailableGameSessions' and
  /// specify a _TargetConfiguration_. For a rule-based policy set the following
  /// parameters: _MetricName_, _ComparisonOperator_, _Threshold_,
  /// _EvaluationPeriods_, _ScalingAdjustmentType_, and _ScalingAdjustment_.
  ///
  /// [targetConfiguration]: Object that contains settings for a target-based
  /// scaling policy.
  Future<PutScalingPolicyOutput> putScalingPolicy(
      {@required String name,
      @required String fleetId,
      int scalingAdjustment,
      String scalingAdjustmentType,
      double threshold,
      String comparisonOperator,
      int evaluationPeriods,
      @required String metricName,
      String policyType,
      TargetConfiguration targetConfiguration}) async {
    var response_ = await _client.send('PutScalingPolicy', {
      'Name': name,
      'FleetId': fleetId,
      if (scalingAdjustment != null) 'ScalingAdjustment': scalingAdjustment,
      if (scalingAdjustmentType != null)
        'ScalingAdjustmentType': scalingAdjustmentType,
      if (threshold != null) 'Threshold': threshold,
      if (comparisonOperator != null) 'ComparisonOperator': comparisonOperator,
      if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
      'MetricName': metricName,
      if (policyType != null) 'PolicyType': policyType,
      if (targetConfiguration != null)
        'TargetConfiguration': targetConfiguration,
    });
    return PutScalingPolicyOutput.fromJson(response_);
  }

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
  ///
  /// [Uploading Your Game](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-build-intro.html)
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
  ///
  /// [buildId]: Unique identifier for a build to get credentials for.
  Future<RequestUploadCredentialsOutput> requestUploadCredentials(
      String buildId) async {
    var response_ = await _client.send('RequestUploadCredentials', {
      'BuildId': buildId,
    });
    return RequestUploadCredentialsOutput.fromJson(response_);
  }

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
  ///
  /// [aliasId]: Unique identifier for the alias you want to resolve.
  Future<ResolveAliasOutput> resolveAlias(String aliasId) async {
    var response_ = await _client.send('ResolveAlias', {
      'AliasId': aliasId,
    });
    return ResolveAliasOutput.fromJson(response_);
  }

  /// Retrieves all active game sessions that match a set of search criteria and
  /// sorts them in a specified order. You can search or sort by the following
  /// game session attributes:
  ///
  /// *    **gameSessionId** -- Unique identifier for the game session. You can
  /// use either a `GameSessionId` or `GameSessionArn` value.
  ///
  /// *    **gameSessionName** -- Name assigned to a game session. This value is
  /// set when requesting a new game session with CreateGameSession or updating
  /// with UpdateGameSession. Game session names do not need to be unique to a
  /// game session.
  ///
  /// *    **gameSessionProperties** -- Custom data defined in a game session's
  /// `GameProperty` parameter. `GameProperty` values are stored as key:value
  /// pairs; the filter expression must indicate the key and a string to search
  /// the data values for. For example, to search for game sessions with custom
  /// data containing the key:value pair "gameMode:brawl", specify the
  /// following: `gameSessionProperties.gameMode = "brawl"`. All custom data
  /// values are searched as strings.
  ///
  /// *    **maximumSessions** -- Maximum number of player sessions allowed for
  /// a game session. This value is set when requesting a new game session with
  /// CreateGameSession or updating with UpdateGameSession.
  ///
  /// *    **creationTimeMillis** -- Value indicating when a game session was
  /// created. It is expressed in Unix time as milliseconds.
  ///
  /// *    **playerSessionCount** -- Number of players currently connected to a
  /// game session. This value changes rapidly as players join the session or
  /// drop out.
  ///
  /// *    **hasAvailablePlayerSessions** -- Boolean value indicating whether a
  /// game session has reached its maximum number of players. It is highly
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
  ///
  /// [fleetId]: Unique identifier for a fleet to search for active game
  /// sessions. Each request must reference either a fleet ID or alias ID, but
  /// not both.
  ///
  /// [aliasId]: Unique identifier for an alias associated with the fleet to
  /// search for active game sessions. Each request must reference either a
  /// fleet ID or alias ID, but not both.
  ///
  /// [filterExpression]: String containing the search criteria for the session
  /// search. If no filter expression is included, the request returns results
  /// for all game sessions in the fleet that are in `ACTIVE` status.
  ///
  /// A filter expression can contain one or multiple conditions. Each condition
  /// consists of the following:
  ///
  /// *    **Operand** -- Name of a game session attribute. Valid values are
  /// `gameSessionName`, `gameSessionId`, `gameSessionProperties`,
  /// `maximumSessions`, `creationTimeMillis`, `playerSessionCount`,
  /// `hasAvailablePlayerSessions`.
  ///
  /// *    **Comparator** -- Valid comparators are: `=`, `<>`, `<`, `>`, `<=`,
  /// `>=`.
  ///
  /// *    **Value** -- Value to be searched for. Values may be numbers, boolean
  /// values (true/false) or strings depending on the operand. String values are
  /// case sensitive and must be enclosed in single quotes. Special characters
  /// must be escaped. Boolean and string values can only be used with the
  /// comparators `=` and `<>`. For example, the following filter expression
  /// searches on `gameSessionName`: "`FilterExpression": "gameSessionName =
  /// 'Matt's Awesome Game 1'"`.
  ///
  ///
  /// To chain multiple conditions in a single expression, use the logical
  /// keywords `AND`, `OR`, and `NOT` and parentheses as needed. For example: `x
  /// AND y AND NOT z`, `NOT (x OR y)`.
  ///
  /// Session search evaluates conditions from left to right using the following
  /// precedence rules:
  ///
  /// 1.   `=`, `<>`, `<`, `>`, `<=`, `>=`
  ///
  /// 2.  Parentheses
  ///
  /// 3.  NOT
  ///
  /// 4.  AND
  ///
  /// 5.  OR
  ///
  ///
  /// For example, this filter expression retrieves game sessions hosting at
  /// least ten players that have an open player slot: `"maximumSessions>=10 AND
  /// hasAvailablePlayerSessions=true"`.
  ///
  /// [sortExpression]: Instructions on how to sort the search results. If no
  /// sort expression is included, the request returns results in random order.
  /// A sort expression consists of the following elements:
  ///
  /// *    **Operand** -- Name of a game session attribute. Valid values are
  /// `gameSessionName`, `gameSessionId`, `gameSessionProperties`,
  /// `maximumSessions`, `creationTimeMillis`, `playerSessionCount`,
  /// `hasAvailablePlayerSessions`.
  ///
  /// *    **Order** -- Valid sort orders are `ASC` (ascending) and `DESC`
  /// (descending).
  ///
  ///
  /// For example, this sort expression returns the oldest active sessions
  /// first: `"SortExpression": "creationTimeMillis ASC"`. Results with a null
  /// value for the sort operand are returned at the end of the list.
  ///
  /// [limit]: Maximum number of results to return. Use this parameter with
  /// `NextToken` to get results as a set of sequential pages. The maximum
  /// number of results returned is 20, even if this value is not set or is set
  /// higher than 20.
  ///
  /// [nextToken]: Token that indicates the start of the next sequential page of
  /// results. Use the token that is returned with a previous call to this
  /// action. To start at the beginning of the result set, do not specify a
  /// value.
  Future<SearchGameSessionsOutput> searchGameSessions(
      {String fleetId,
      String aliasId,
      String filterExpression,
      String sortExpression,
      int limit,
      String nextToken}) async {
    var response_ = await _client.send('SearchGameSessions', {
      if (fleetId != null) 'FleetId': fleetId,
      if (aliasId != null) 'AliasId': aliasId,
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (sortExpression != null) 'SortExpression': sortExpression,
      if (limit != null) 'Limit': limit,
      if (nextToken != null) 'NextToken': nextToken,
    });
    return SearchGameSessionsOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet
  ///
  /// [actions]: List of actions to restart on the fleet.
  Future<StartFleetActionsOutput> startFleetActions(
      {@required String fleetId, @required List<String> actions}) async {
    var response_ = await _client.send('StartFleetActions', {
      'FleetId': fleetId,
      'Actions': actions,
    });
    return StartFleetActionsOutput.fromJson(response_);
  }

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
  ///
  /// [placementId]: Unique identifier to assign to the new game session
  /// placement. This value is developer-defined. The value must be unique
  /// across all regions and cannot be reused unless you are resubmitting a
  /// canceled or timed-out placement request.
  ///
  /// [gameSessionQueueName]: Name of the queue to use to place the new game
  /// session.
  ///
  /// [gameProperties]: Set of custom properties for a game session, formatted
  /// as key:value pairs. These properties are passed to a game server process
  /// in the GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  ///
  /// [maximumPlayerSessionCount]: Maximum number of players that can be
  /// connected simultaneously to the game session.
  ///
  /// [gameSessionName]: Descriptive label that is associated with a game
  /// session. Session names do not need to be unique.
  ///
  /// [playerLatencies]: Set of values, expressed in milliseconds, indicating
  /// the amount of latency that a player experiences when connected to AWS
  /// regions. This information is used to try to place the new game session
  /// where it can offer the best possible gameplay experience for the players.
  ///
  /// [desiredPlayerSessions]: Set of information on each player to create a
  /// player session for.
  ///
  /// [gameSessionData]: Set of custom game session properties, formatted as a
  /// single string value. This data is passed to a game server process in the
  /// GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  Future<StartGameSessionPlacementOutput> startGameSessionPlacement(
      {@required String placementId,
      @required String gameSessionQueueName,
      List<GameProperty> gameProperties,
      @required int maximumPlayerSessionCount,
      String gameSessionName,
      List<PlayerLatency> playerLatencies,
      List<DesiredPlayerSession> desiredPlayerSessions,
      String gameSessionData}) async {
    var response_ = await _client.send('StartGameSessionPlacement', {
      'PlacementId': placementId,
      'GameSessionQueueName': gameSessionQueueName,
      if (gameProperties != null) 'GameProperties': gameProperties,
      'MaximumPlayerSessionCount': maximumPlayerSessionCount,
      if (gameSessionName != null) 'GameSessionName': gameSessionName,
      if (playerLatencies != null) 'PlayerLatencies': playerLatencies,
      if (desiredPlayerSessions != null)
        'DesiredPlayerSessions': desiredPlayerSessions,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
    });
    return StartGameSessionPlacementOutput.fromJson(response_);
  }

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
  ///
  /// [How Amazon GameLift FlexMatch Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html).
  ///
  ///  **Learn more**
  ///
  ///
  /// [Backfill Existing Games with FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-backfill.html)
  ///
  ///
  /// [How GameLift FlexMatch Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html)
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
  ///
  /// [ticketId]: Unique identifier for a matchmaking ticket. If no ticket ID is
  /// specified here, Amazon GameLift will generate one in the form of a UUID.
  /// Use this identifier to track the match backfill ticket status and retrieve
  /// match results.
  ///
  /// [configurationName]: Name of the matchmaker to use for this request. The
  /// name of the matchmaker that was used with the original game session is
  /// listed in the GameSession object, `MatchmakerData` property. This property
  /// contains a matchmaking configuration ARN value, which includes the
  /// matchmaker name. (In the ARN value
  /// "arn:aws:gamelift:us-west-2:111122223333:matchmakingconfiguration/MM-4v4",
  /// the matchmaking configuration name is "MM-4v4".) Use only the name for
  /// this parameter.
  ///
  /// [gameSessionArn]: Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session and uniquely identifies it.
  ///
  /// [players]: Match information on all players that are currently assigned to
  /// the game session. This information is used by the matchmaker to find new
  /// players and add them to the existing game.
  ///
  /// *   PlayerID, PlayerAttributes, Team -- This information is maintained in
  /// the GameSession object, `MatchmakerData` property, for all players who are
  /// currently assigned to the game session. The matchmaker data is in JSON
  /// syntax, formatted as a string. For more details, see
  /// [Match Data](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-server.html#match-server-data).
  ///
  /// *   LatencyInMs -- If the matchmaker uses player latency, include a
  /// latency value, in milliseconds, for the region that the game session is
  /// currently in. Do not include latency values for any other region.
  Future<StartMatchBackfillOutput> startMatchBackfill(
      {String ticketId,
      @required String configurationName,
      @required String gameSessionArn,
      @required List<Player> players}) async {
    var response_ = await _client.send('StartMatchBackfill', {
      if (ticketId != null) 'TicketId': ticketId,
      'ConfigurationName': configurationName,
      'GameSessionArn': gameSessionArn,
      'Players': players,
    });
    return StartMatchBackfillOutput.fromJson(response_);
  }

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
  ///  **Tracking ticket status** -- A couple of options are available for
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
  ///  **Processing a matchmaking request** -- FlexMatch handles a matchmaking
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
  ///
  /// [Add FlexMatch to a Game Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
  ///
  ///
  /// [Set Up FlexMatch Event Notification](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-notification.html)
  ///
  ///
  /// [FlexMatch Integration Roadmap](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-tasks.html)
  ///
  ///
  /// [How GameLift FlexMatch Works](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-match.html)
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
  ///
  /// [ticketId]: Unique identifier for a matchmaking ticket. If no ticket ID is
  /// specified here, Amazon GameLift will generate one in the form of a UUID.
  /// Use this identifier to track the matchmaking ticket status and retrieve
  /// match results.
  ///
  /// [configurationName]: Name of the matchmaking configuration to use for this
  /// request. Matchmaking configurations must exist in the same region as this
  /// request.
  ///
  /// [players]: Information on each player to be matched. This information must
  /// include a player ID, and may contain player attributes and latency data to
  /// be used in the matchmaking process. After a successful match, `Player`
  /// objects contain the name of the team the player is assigned to.
  Future<StartMatchmakingOutput> startMatchmaking(
      {String ticketId,
      @required String configurationName,
      @required List<Player> players}) async {
    var response_ = await _client.send('StartMatchmaking', {
      if (ticketId != null) 'TicketId': ticketId,
      'ConfigurationName': configurationName,
      'Players': players,
    });
    return StartMatchmakingOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet
  ///
  /// [actions]: List of actions to suspend on the fleet.
  Future<StopFleetActionsOutput> stopFleetActions(
      {@required String fleetId, @required List<String> actions}) async {
    var response_ = await _client.send('StopFleetActions', {
      'FleetId': fleetId,
      'Actions': actions,
    });
    return StopFleetActionsOutput.fromJson(response_);
  }

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
  ///
  /// [placementId]: Unique identifier for a game session placement to cancel.
  Future<StopGameSessionPlacementOutput> stopGameSessionPlacement(
      String placementId) async {
    var response_ = await _client.send('StopGameSessionPlacement', {
      'PlacementId': placementId,
    });
    return StopGameSessionPlacementOutput.fromJson(response_);
  }

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
  ///
  /// [Add FlexMatch to a Game Client](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-client.html)
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
  ///
  /// [ticketId]: Unique identifier for a matchmaking ticket.
  Future<StopMatchmakingOutput> stopMatchmaking(String ticketId) async {
    var response_ = await _client.send('StopMatchmaking', {
      'TicketId': ticketId,
    });
    return StopMatchmakingOutput.fromJson(response_);
  }

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
  ///
  /// [aliasId]: Unique identifier for a fleet alias. Specify the alias you want
  /// to update.
  ///
  /// [name]: Descriptive label that is associated with an alias. Alias names do
  /// not need to be unique.
  ///
  /// [description]: Human-readable description of an alias.
  ///
  /// [routingStrategy]: Object that specifies the fleet and routing type to use
  /// for the alias.
  Future<UpdateAliasOutput> updateAlias(String aliasId,
      {String name,
      String description,
      RoutingStrategy routingStrategy}) async {
    var response_ = await _client.send('UpdateAlias', {
      'AliasId': aliasId,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
      if (routingStrategy != null) 'RoutingStrategy': routingStrategy,
    });
    return UpdateAliasOutput.fromJson(response_);
  }

  /// Updates metadata in a build record, including the build name and version.
  /// To update the metadata, specify the build ID to update and provide the new
  /// values. If successful, a build object containing the updated metadata is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Builds](https://docs.aws.amazon.com/gamelift/latest/developerguide/build-intro.html)
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
  ///
  /// [buildId]: Unique identifier for a build to update.
  ///
  /// [name]: Descriptive label that is associated with a build. Build names do
  /// not need to be unique.
  ///
  /// [version]: Version that is associated with a build or script. Version
  /// strings do not need to be unique.
  Future<UpdateBuildOutput> updateBuild(String buildId,
      {String name, String version}) async {
    var response_ = await _client.send('UpdateBuild', {
      'BuildId': buildId,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    });
    return UpdateBuildOutput.fromJson(response_);
  }

  /// Updates fleet properties, including name and description, for a fleet. To
  /// update metadata, specify the fleet ID and the property values that you
  /// want to change. If successful, the fleet ID for the updated fleet is
  /// returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to update attribute metadata for.
  ///
  /// [name]: Descriptive label that is associated with a fleet. Fleet names do
  /// not need to be unique.
  ///
  /// [description]: Human-readable description of a fleet.
  ///
  /// [newGameSessionProtectionPolicy]: Game session protection policy to apply
  /// to all new instances created in this fleet. Instances that already exist
  /// are not affected. You can set protection for individual instances using
  /// UpdateGameSession.
  ///
  /// *    **NoProtection** -- The game session can be terminated during a
  /// scale-down event.
  ///
  /// *    **FullProtection** -- If the game session is in an `ACTIVE` status,
  /// it cannot be terminated during a scale-down event.
  ///
  /// [resourceCreationLimitPolicy]: Policy that limits the number of game
  /// sessions an individual player can create over a span of time.
  ///
  /// [metricGroups]: Names of metric groups to include this fleet in. Amazon
  /// CloudWatch uses a fleet metric group is to aggregate metrics from multiple
  /// fleets. Use an existing metric group name to add this fleet to the group.
  /// Or use a new name to create a new metric group. A fleet can only be
  /// included in one metric group at a time.
  Future<UpdateFleetAttributesOutput> updateFleetAttributes(String fleetId,
      {String name,
      String description,
      String newGameSessionProtectionPolicy,
      ResourceCreationLimitPolicy resourceCreationLimitPolicy,
      List<String> metricGroups}) async {
    var response_ = await _client.send('UpdateFleetAttributes', {
      'FleetId': fleetId,
      if (name != null) 'Name': name,
      if (description != null) 'Description': description,
      if (newGameSessionProtectionPolicy != null)
        'NewGameSessionProtectionPolicy': newGameSessionProtectionPolicy,
      if (resourceCreationLimitPolicy != null)
        'ResourceCreationLimitPolicy': resourceCreationLimitPolicy,
      if (metricGroups != null) 'MetricGroups': metricGroups,
    });
    return UpdateFleetAttributesOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to update capacity for.
  ///
  /// [desiredInstances]: Number of EC2 instances you want this fleet to host.
  ///
  /// [minSize]: Minimum value allowed for the fleet's instance count. Default
  /// if not set is 0.
  ///
  /// [maxSize]: Maximum value allowed for the fleet's instance count. Default
  /// if not set is 1.
  Future<UpdateFleetCapacityOutput> updateFleetCapacity(String fleetId,
      {int desiredInstances, int minSize, int maxSize}) async {
    var response_ = await _client.send('UpdateFleetCapacity', {
      'FleetId': fleetId,
      if (desiredInstances != null) 'DesiredInstances': desiredInstances,
      if (minSize != null) 'MinSize': minSize,
      if (maxSize != null) 'MaxSize': maxSize,
    });
    return UpdateFleetCapacityOutput.fromJson(response_);
  }

  /// Updates port settings for a fleet. To update settings, specify the fleet
  /// ID to be updated and list the permissions you want to update. List the
  /// permissions you want to add in `InboundPermissionAuthorizations`, and
  /// permissions you want to remove in `InboundPermissionRevocations`.
  /// Permissions to be removed must match existing fleet permissions. If
  /// successful, the fleet ID for the updated fleet is returned.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to update port settings for.
  ///
  /// [inboundPermissionAuthorizations]: Collection of port settings to be added
  /// to the fleet record.
  ///
  /// [inboundPermissionRevocations]: Collection of port settings to be removed
  /// from the fleet record.
  Future<UpdateFleetPortSettingsOutput> updateFleetPortSettings(String fleetId,
      {List<IpPermission> inboundPermissionAuthorizations,
      List<IpPermission> inboundPermissionRevocations}) async {
    var response_ = await _client.send('UpdateFleetPortSettings', {
      'FleetId': fleetId,
      if (inboundPermissionAuthorizations != null)
        'InboundPermissionAuthorizations': inboundPermissionAuthorizations,
      if (inboundPermissionRevocations != null)
        'InboundPermissionRevocations': inboundPermissionRevocations,
    });
    return UpdateFleetPortSettingsOutput.fromJson(response_);
  }

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
  ///
  /// [gameSessionId]: Unique identifier for the game session to update.
  ///
  /// [maximumPlayerSessionCount]: Maximum number of players that can be
  /// connected simultaneously to the game session.
  ///
  /// [name]: Descriptive label that is associated with a game session. Session
  /// names do not need to be unique.
  ///
  /// [playerSessionCreationPolicy]: Policy determining whether or not the game
  /// session accepts new players.
  ///
  /// [protectionPolicy]: Game session protection policy to apply to this game
  /// session only.
  ///
  /// *    **NoProtection** -- The game session can be terminated during a
  /// scale-down event.
  ///
  /// *    **FullProtection** -- If the game session is in an `ACTIVE` status,
  /// it cannot be terminated during a scale-down event.
  Future<UpdateGameSessionOutput> updateGameSession(String gameSessionId,
      {int maximumPlayerSessionCount,
      String name,
      String playerSessionCreationPolicy,
      String protectionPolicy}) async {
    var response_ = await _client.send('UpdateGameSession', {
      'GameSessionId': gameSessionId,
      if (maximumPlayerSessionCount != null)
        'MaximumPlayerSessionCount': maximumPlayerSessionCount,
      if (name != null) 'Name': name,
      if (playerSessionCreationPolicy != null)
        'PlayerSessionCreationPolicy': playerSessionCreationPolicy,
      if (protectionPolicy != null) 'ProtectionPolicy': protectionPolicy,
    });
    return UpdateGameSessionOutput.fromJson(response_);
  }

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
  ///
  /// [name]: Descriptive label that is associated with game session queue.
  /// Queue names must be unique within each region.
  ///
  /// [timeoutInSeconds]: Maximum time, in seconds, that a new game session
  /// placement request remains in the queue. When a request exceeds this time,
  /// the game session placement changes to a `TIMED_OUT` status.
  ///
  /// [playerLatencyPolicies]: Collection of latency policies to apply when
  /// processing game sessions placement requests with player latency
  /// information. Multiple policies are evaluated in order of the maximum
  /// latency value, starting with the lowest latency values. With just one
  /// policy, it is enforced at the start of the game session placement for the
  /// duration period. With multiple policies, each policy is enforced
  /// consecutively for its duration period. For example, a queue might enforce
  /// a 60-second policy followed by a 120-second policy, and then no policy for
  /// the remainder of the placement. When updating policies, provide a complete
  /// collection of policies.
  ///
  /// [destinations]: List of fleets that can be used to fulfill game session
  /// placement requests in the queue. Fleets are identified by either a fleet
  /// ARN or a fleet alias ARN. Destinations are listed in default preference
  /// order. When updating this list, provide a complete list of destinations.
  Future<UpdateGameSessionQueueOutput> updateGameSessionQueue(String name,
      {int timeoutInSeconds,
      List<PlayerLatencyPolicy> playerLatencyPolicies,
      List<GameSessionQueueDestination> destinations}) async {
    var response_ = await _client.send('UpdateGameSessionQueue', {
      'Name': name,
      if (timeoutInSeconds != null) 'TimeoutInSeconds': timeoutInSeconds,
      if (playerLatencyPolicies != null)
        'PlayerLatencyPolicies': playerLatencyPolicies,
      if (destinations != null) 'Destinations': destinations,
    });
    return UpdateGameSessionQueueOutput.fromJson(response_);
  }

  /// Updates settings for a FlexMatch matchmaking configuration. These changes
  /// affect all matches and game sessions that are created after the update. To
  /// update settings, specify the configuration name to be updated and provide
  /// the new settings.
  ///
  ///  **Learn more**
  ///
  ///
  /// [Design a FlexMatch Matchmaker](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-configuration.html)
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
  ///
  /// [name]: Unique identifier for a matchmaking configuration to update.
  ///
  /// [description]: Descriptive label that is associated with matchmaking
  /// configuration.
  ///
  /// [gameSessionQueueArns]: Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session queue and uniquely identifies it.
  /// Format is `arn:aws:gamelift:<region>:<aws account>:gamesessionqueue/<queue
  /// name>`. These queues are used when placing game sessions for matches that
  /// are created with this matchmaking configuration. Queues can be located in
  /// any region.
  ///
  /// [requestTimeoutSeconds]: Maximum duration, in seconds, that a matchmaking
  /// ticket can remain in process before timing out. Requests that fail due to
  /// timing out can be resubmitted as needed.
  ///
  /// [acceptanceTimeoutSeconds]: Length of time (in seconds) to wait for
  /// players to accept a proposed match. If any player rejects the match or
  /// fails to accept before the timeout, the ticket continues to look for an
  /// acceptable match.
  ///
  /// [acceptanceRequired]: Flag that determines whether a match that was
  /// created with this configuration must be accepted by the matched players.
  /// To require acceptance, set to TRUE.
  ///
  /// [ruleSetName]: Unique identifier for a matchmaking rule set to use with
  /// this configuration. A matchmaking configuration can only use rule sets
  /// that are defined in the same region.
  ///
  /// [notificationTarget]: SNS topic ARN that is set up to receive matchmaking
  /// notifications. See
  /// [Setting up Notifications for Matchmaking](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-notification.html)
  /// for more information.
  ///
  /// [additionalPlayerCount]: Number of player slots in a match to keep open
  /// for future players. For example, if the configuration's rule set specifies
  /// a match for a single 12-person team, and the additional player count is
  /// set to 2, only 10 players are selected for the match.
  ///
  /// [customEventData]: Information to add to all events related to the
  /// matchmaking configuration.
  ///
  /// [gameProperties]: Set of custom properties for a game session, formatted
  /// as key:value pairs. These properties are passed to a game server process
  /// in the GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  ///
  /// [gameSessionData]: Set of custom game session properties, formatted as a
  /// single string value. This data is passed to a game server process in the
  /// GameSession object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  ///
  /// [backfillMode]: Method used to backfill game sessions created with this
  /// matchmaking configuration. Specify MANUAL when your game manages backfill
  /// requests manually or does not use the match backfill feature. Specify
  /// AUTOMATIC to have GameLift create a StartMatchBackfill request whenever a
  /// game session has one or more open slots. Learn more about manual and
  /// automatic backfill in
  /// [Backfill Existing Games with FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-backfill.html).
  Future<UpdateMatchmakingConfigurationOutput> updateMatchmakingConfiguration(
      String name,
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
      String backfillMode}) async {
    var response_ = await _client.send('UpdateMatchmakingConfiguration', {
      'Name': name,
      if (description != null) 'Description': description,
      if (gameSessionQueueArns != null)
        'GameSessionQueueArns': gameSessionQueueArns,
      if (requestTimeoutSeconds != null)
        'RequestTimeoutSeconds': requestTimeoutSeconds,
      if (acceptanceTimeoutSeconds != null)
        'AcceptanceTimeoutSeconds': acceptanceTimeoutSeconds,
      if (acceptanceRequired != null) 'AcceptanceRequired': acceptanceRequired,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
      if (notificationTarget != null) 'NotificationTarget': notificationTarget,
      if (additionalPlayerCount != null)
        'AdditionalPlayerCount': additionalPlayerCount,
      if (customEventData != null) 'CustomEventData': customEventData,
      if (gameProperties != null) 'GameProperties': gameProperties,
      if (gameSessionData != null) 'GameSessionData': gameSessionData,
      if (backfillMode != null) 'BackfillMode': backfillMode,
    });
    return UpdateMatchmakingConfigurationOutput.fromJson(response_);
  }

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
  ///
  /// [Working with Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-intro.html).
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
  ///
  /// [fleetId]: Unique identifier for a fleet to update run-time configuration
  /// for.
  ///
  /// [runtimeConfiguration]: Instructions for launching server processes on
  /// each instance in the fleet. Server processes run either a custom game
  /// build executable or a Realtime Servers script. The run-time configuration
  /// lists the types of server processes to run on an instance and includes the
  /// following configuration settings: the server executable or launch script
  /// file, launch parameters, and the number of processes to run concurrently
  /// on each instance. A CreateFleet request must include a run-time
  /// configuration with at least one server process configuration.
  Future<UpdateRuntimeConfigurationOutput> updateRuntimeConfiguration(
      {@required String fleetId,
      @required RuntimeConfiguration runtimeConfiguration}) async {
    var response_ = await _client.send('UpdateRuntimeConfiguration', {
      'FleetId': fleetId,
      'RuntimeConfiguration': runtimeConfiguration,
    });
    return UpdateRuntimeConfigurationOutput.fromJson(response_);
  }

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
  ///
  /// [Amazon GameLift Realtime Servers](https://docs.aws.amazon.com/gamelift/latest/developerguide/realtime-intro.html)
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
  ///
  /// [scriptId]: Unique identifier for a Realtime script to update.
  ///
  /// [name]: Descriptive label that is associated with a script. Script names
  /// do not need to be unique.
  ///
  /// [version]: Version that is associated with a build or script. Version
  /// strings do not need to be unique.
  ///
  /// [storageLocation]: Location of the Amazon S3 bucket where a zipped file
  /// containing your Realtime scripts is stored. The storage location must
  /// specify the Amazon S3 bucket name, the zip file name (the "key"), and a
  /// role ARN that allows Amazon GameLift to access the Amazon S3 storage
  /// location. The S3 bucket must be in the same region where you want to
  /// create a new script. By default, Amazon GameLift uploads the latest
  /// version of the zip file; if you have S3 object versioning turned on, you
  /// can use the `ObjectVersion` parameter to specify an earlier version.
  ///
  /// [zipFile]: Data object containing your Realtime scripts and dependencies
  /// as a zip file. The zip file can have one or multiple files. Maximum size
  /// of a zip file is 5 MB.
  ///
  /// When using the AWS CLI tool to create a script, this parameter is set to
  /// the zip file name. It must be prepended with the string "fileb://" to
  /// indicate that the file data is a binary object. For example: `--zip-file
  /// fileb://myRealtimeScript.zip`.
  Future<UpdateScriptOutput> updateScript(String scriptId,
      {String name,
      String version,
      S3Location storageLocation,
      Uint8List zipFile}) async {
    var response_ = await _client.send('UpdateScript', {
      'ScriptId': scriptId,
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
      if (storageLocation != null) 'StorageLocation': storageLocation,
      if (zipFile != null) 'ZipFile': zipFile,
    });
    return UpdateScriptOutput.fromJson(response_);
  }

  /// Validates the syntax of a matchmaking rule or rule set. This operation
  /// checks that the rule set is using syntactically correct JSON and that it
  /// conforms to allowed property expressions. To validate syntax, provide a
  /// rule set JSON string.
  ///
  ///  **Learn more**
  ///
  /// *
  /// [Build a Rule Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html)
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
  ///
  /// [ruleSetBody]: Collection of matchmaking rules to validate, formatted as a
  /// JSON string.
  Future<ValidateMatchmakingRuleSetOutput> validateMatchmakingRuleSet(
      String ruleSetBody) async {
    var response_ = await _client.send('ValidateMatchmakingRuleSet', {
      'RuleSetBody': ruleSetBody,
    });
    return ValidateMatchmakingRuleSetOutput.fromJson(response_);
  }
}

class AcceptMatchOutput {
  AcceptMatchOutput();
  static AcceptMatchOutput fromJson(Map<String, dynamic> json) =>
      AcceptMatchOutput();
}

/// Properties describing a fleet alias.
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
class Alias {
  /// Unique identifier for an alias; alias IDs are unique within a region.
  final String aliasId;

  /// Descriptive label that is associated with an alias. Alias names do not
  /// need to be unique.
  final String name;

  /// Unique identifier for an alias; alias ARNs are unique across all regions.
  final String aliasArn;

  /// Human-readable description of an alias.
  final String description;

  /// Alias configuration for the alias, including routing type and settings.
  final RoutingStrategy routingStrategy;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Time stamp indicating when this data object was last modified. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime lastUpdatedTime;

  Alias({
    this.aliasId,
    this.name,
    this.aliasArn,
    this.description,
    this.routingStrategy,
    this.creationTime,
    this.lastUpdatedTime,
  });
  static Alias fromJson(Map<String, dynamic> json) => Alias(
        aliasId: json.containsKey('AliasId') ? json['AliasId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        aliasArn:
            json.containsKey('AliasArn') ? json['AliasArn'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        routingStrategy: json.containsKey('RoutingStrategy')
            ? RoutingStrategy.fromJson(json['RoutingStrategy'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        lastUpdatedTime: json.containsKey('LastUpdatedTime')
            ? DateTime.parse(json['LastUpdatedTime'])
            : null,
      );
}

/// Values for use in Player attribute key:value pairs. This object lets you
/// specify an attribute value using any of the valid data types: string,
/// number, string array, or data map. Each `AttributeValue` object can use only
/// one of the available properties.
class AttributeValue {
  /// For single string values. Maximum string length is 100 characters.
  final String s;

  /// For number values, expressed as double.
  final double n;

  /// For a list of up to 10 strings. Maximum length for each string is 100
  /// characters. Duplicate values are not recognized; all occurrences of the
  /// repeated value after the first of a repeated value are ignored.
  final List<String> sl;

  /// For a map of up to 10 data type:value pairs. Maximum length for each
  /// string value is 100 characters.
  final Map<String, double> sdm;

  AttributeValue({
    this.s,
    this.n,
    this.sl,
    this.sdm,
  });
  static AttributeValue fromJson(Map<String, dynamic> json) => AttributeValue(
        s: json.containsKey('S') ? json['S'] as String : null,
        n: json.containsKey('N') ? json['N'] as double : null,
        sl: json.containsKey('SL')
            ? (json['SL'] as List).map((e) => e as String).toList()
            : null,
        sdm: json.containsKey('SDM')
            ? (json['SDM'] as Map)
                .map((k, v) => MapEntry(k as String, v as double))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Temporary access credentials used for uploading game build files to Amazon
/// GameLift. They are valid for a limited time. If they expire before you
/// upload your game build, get a new set by calling RequestUploadCredentials.
class AwsCredentials {
  /// Temporary key allowing access to the Amazon GameLift S3 account.
  final String accessKeyId;

  /// Temporary secret key allowing access to the Amazon GameLift S3 account.
  final String secretAccessKey;

  /// Token used to associate a specific build ID with the files uploaded using
  /// these credentials.
  final String sessionToken;

  AwsCredentials({
    this.accessKeyId,
    this.secretAccessKey,
    this.sessionToken,
  });
  static AwsCredentials fromJson(Map<String, dynamic> json) => AwsCredentials(
        accessKeyId: json.containsKey('AccessKeyId')
            ? json['AccessKeyId'] as String
            : null,
        secretAccessKey: json.containsKey('SecretAccessKey')
            ? json['SecretAccessKey'] as String
            : null,
        sessionToken: json.containsKey('SessionToken')
            ? json['SessionToken'] as String
            : null,
      );
}

/// Properties describing a custom game build.
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
class Build {
  /// Unique identifier for a build.
  final String buildId;

  /// Descriptive label that is associated with a build. Build names do not need
  /// to be unique. It can be set using CreateBuild or UpdateBuild.
  final String name;

  /// Version that is associated with a build or script. Version strings do not
  /// need to be unique. This value can be set using CreateBuild or UpdateBuild.
  final String version;

  /// Current status of the build.
  ///
  /// Possible build statuses include the following:
  ///
  /// *    **INITIALIZED** -- A new build has been defined, but no files have
  /// been uploaded. You cannot create fleets for builds that are in this
  /// status. When a build is successfully created, the build status is set to
  /// this value.
  ///
  /// *    **READY** -- The game build has been successfully uploaded. You can
  /// now create new fleets for this build.
  ///
  /// *    **FAILED** -- The game build upload failed. You cannot create new
  /// fleets for this build.
  final String status;

  /// File size of the uploaded game build, expressed in bytes. When the build
  /// status is `INITIALIZED`, this value is 0.
  final BigInt sizeOnDisk;

  /// Operating system that the game server binaries are built to run on. This
  /// value determines the type of fleet resources that you can use for this
  /// build.
  final String operatingSystem;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  Build({
    this.buildId,
    this.name,
    this.version,
    this.status,
    this.sizeOnDisk,
    this.operatingSystem,
    this.creationTime,
  });
  static Build fromJson(Map<String, dynamic> json) => Build(
        buildId: json.containsKey('BuildId') ? json['BuildId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        sizeOnDisk: json.containsKey('SizeOnDisk')
            ? BigInt.from(json['SizeOnDisk'])
            : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? json['OperatingSystem'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

class CertificateConfiguration {
  final String certificateType;

  CertificateConfiguration({
    @required this.certificateType,
  });
  static CertificateConfiguration fromJson(Map<String, dynamic> json) =>
      CertificateConfiguration(
        certificateType: json['CertificateType'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the returned data in response to a request action.
class CreateAliasOutput {
  /// Object that describes the newly created alias record.
  final Alias alias;

  CreateAliasOutput({
    this.alias,
  });
  static CreateAliasOutput fromJson(Map<String, dynamic> json) =>
      CreateAliasOutput(
        alias: json.containsKey('Alias') ? Alias.fromJson(json['Alias']) : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateBuildOutput {
  /// The newly created build record, including a unique build ID and status.
  final Build build;

  /// This element is returned only when the operation is called without a
  /// storage location. It contains credentials to use when you are uploading a
  /// build file to an Amazon S3 bucket that is owned by Amazon GameLift.
  /// Credentials have a limited life span. To refresh these credentials, call
  /// RequestUploadCredentials.
  final AwsCredentials uploadCredentials;

  /// Amazon S3 location for your game build file, including bucket name and
  /// key.
  final S3Location storageLocation;

  CreateBuildOutput({
    this.build,
    this.uploadCredentials,
    this.storageLocation,
  });
  static CreateBuildOutput fromJson(Map<String, dynamic> json) =>
      CreateBuildOutput(
        build: json.containsKey('Build') ? Build.fromJson(json['Build']) : null,
        uploadCredentials: json.containsKey('UploadCredentials')
            ? AwsCredentials.fromJson(json['UploadCredentials'])
            : null,
        storageLocation: json.containsKey('StorageLocation')
            ? S3Location.fromJson(json['StorageLocation'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateFleetOutput {
  /// Properties for the newly created fleet.
  final FleetAttributes fleetAttributes;

  CreateFleetOutput({
    this.fleetAttributes,
  });
  static CreateFleetOutput fromJson(Map<String, dynamic> json) =>
      CreateFleetOutput(
        fleetAttributes: json.containsKey('FleetAttributes')
            ? FleetAttributes.fromJson(json['FleetAttributes'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateGameSessionOutput {
  /// Object that describes the newly created game session record.
  final GameSession gameSession;

  CreateGameSessionOutput({
    this.gameSession,
  });
  static CreateGameSessionOutput fromJson(Map<String, dynamic> json) =>
      CreateGameSessionOutput(
        gameSession: json.containsKey('GameSession')
            ? GameSession.fromJson(json['GameSession'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateGameSessionQueueOutput {
  /// Object that describes the newly created game session queue.
  final GameSessionQueue gameSessionQueue;

  CreateGameSessionQueueOutput({
    this.gameSessionQueue,
  });
  static CreateGameSessionQueueOutput fromJson(Map<String, dynamic> json) =>
      CreateGameSessionQueueOutput(
        gameSessionQueue: json.containsKey('GameSessionQueue')
            ? GameSessionQueue.fromJson(json['GameSessionQueue'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateMatchmakingConfigurationOutput {
  /// Object that describes the newly created matchmaking configuration.
  final MatchmakingConfiguration configuration;

  CreateMatchmakingConfigurationOutput({
    this.configuration,
  });
  static CreateMatchmakingConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      CreateMatchmakingConfigurationOutput(
        configuration: json.containsKey('Configuration')
            ? MatchmakingConfiguration.fromJson(json['Configuration'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateMatchmakingRuleSetOutput {
  /// Object that describes the newly created matchmaking rule set.
  final MatchmakingRuleSet ruleSet;

  CreateMatchmakingRuleSetOutput({
    @required this.ruleSet,
  });
  static CreateMatchmakingRuleSetOutput fromJson(Map<String, dynamic> json) =>
      CreateMatchmakingRuleSetOutput(
        ruleSet: MatchmakingRuleSet.fromJson(json['RuleSet']),
      );
}

/// Represents the returned data in response to a request action.
class CreatePlayerSessionOutput {
  /// Object that describes the newly created player session record.
  final PlayerSession playerSession;

  CreatePlayerSessionOutput({
    this.playerSession,
  });
  static CreatePlayerSessionOutput fromJson(Map<String, dynamic> json) =>
      CreatePlayerSessionOutput(
        playerSession: json.containsKey('PlayerSession')
            ? PlayerSession.fromJson(json['PlayerSession'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class CreatePlayerSessionsOutput {
  /// Collection of player session objects created for the added players.
  final List<PlayerSession> playerSessions;

  CreatePlayerSessionsOutput({
    this.playerSessions,
  });
  static CreatePlayerSessionsOutput fromJson(Map<String, dynamic> json) =>
      CreatePlayerSessionsOutput(
        playerSessions: json.containsKey('PlayerSessions')
            ? (json['PlayerSessions'] as List)
                .map((e) => PlayerSession.fromJson(e))
                .toList()
            : null,
      );
}

class CreateScriptOutput {
  /// The newly created script record with a unique script ID. The new script's
  /// storage location reflects an Amazon S3 location: (1) If the script was
  /// uploaded from an S3 bucket under your account, the storage location
  /// reflects the information that was provided in the _CreateScript_ request;
  /// (2) If the script file was uploaded from a local zip file, the storage
  /// location reflects an S3 location controls by the Amazon GameLift service.
  final Script script;

  CreateScriptOutput({
    this.script,
  });
  static CreateScriptOutput fromJson(Map<String, dynamic> json) =>
      CreateScriptOutput(
        script:
            json.containsKey('Script') ? Script.fromJson(json['Script']) : null,
      );
}

/// Represents the returned data in response to a request action.
class CreateVpcPeeringAuthorizationOutput {
  /// Details on the requested VPC peering authorization, including expiration.
  final VpcPeeringAuthorization vpcPeeringAuthorization;

  CreateVpcPeeringAuthorizationOutput({
    this.vpcPeeringAuthorization,
  });
  static CreateVpcPeeringAuthorizationOutput fromJson(
          Map<String, dynamic> json) =>
      CreateVpcPeeringAuthorizationOutput(
        vpcPeeringAuthorization: json.containsKey('VpcPeeringAuthorization')
            ? VpcPeeringAuthorization.fromJson(json['VpcPeeringAuthorization'])
            : null,
      );
}

class CreateVpcPeeringConnectionOutput {
  CreateVpcPeeringConnectionOutput();
  static CreateVpcPeeringConnectionOutput fromJson(Map<String, dynamic> json) =>
      CreateVpcPeeringConnectionOutput();
}

class DeleteGameSessionQueueOutput {
  DeleteGameSessionQueueOutput();
  static DeleteGameSessionQueueOutput fromJson(Map<String, dynamic> json) =>
      DeleteGameSessionQueueOutput();
}

class DeleteMatchmakingConfigurationOutput {
  DeleteMatchmakingConfigurationOutput();
  static DeleteMatchmakingConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      DeleteMatchmakingConfigurationOutput();
}

/// Represents the returned data in response to a request action.
class DeleteMatchmakingRuleSetOutput {
  DeleteMatchmakingRuleSetOutput();
  static DeleteMatchmakingRuleSetOutput fromJson(Map<String, dynamic> json) =>
      DeleteMatchmakingRuleSetOutput();
}

class DeleteVpcPeeringAuthorizationOutput {
  DeleteVpcPeeringAuthorizationOutput();
  static DeleteVpcPeeringAuthorizationOutput fromJson(
          Map<String, dynamic> json) =>
      DeleteVpcPeeringAuthorizationOutput();
}

class DeleteVpcPeeringConnectionOutput {
  DeleteVpcPeeringConnectionOutput();
  static DeleteVpcPeeringConnectionOutput fromJson(Map<String, dynamic> json) =>
      DeleteVpcPeeringConnectionOutput();
}

/// Represents the returned data in response to a request action.
class DescribeAliasOutput {
  /// Object that contains the requested alias.
  final Alias alias;

  DescribeAliasOutput({
    this.alias,
  });
  static DescribeAliasOutput fromJson(Map<String, dynamic> json) =>
      DescribeAliasOutput(
        alias: json.containsKey('Alias') ? Alias.fromJson(json['Alias']) : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeBuildOutput {
  /// Set of properties describing the requested build.
  final Build build;

  DescribeBuildOutput({
    this.build,
  });
  static DescribeBuildOutput fromJson(Map<String, dynamic> json) =>
      DescribeBuildOutput(
        build: json.containsKey('Build') ? Build.fromJson(json['Build']) : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeEc2InstanceLimitsOutput {
  /// Object that contains the maximum number of instances for the specified
  /// instance type.
  final List<Ec2InstanceLimit> ec2InstanceLimits;

  DescribeEc2InstanceLimitsOutput({
    this.ec2InstanceLimits,
  });
  static DescribeEc2InstanceLimitsOutput fromJson(Map<String, dynamic> json) =>
      DescribeEc2InstanceLimitsOutput(
        ec2InstanceLimits: json.containsKey('EC2InstanceLimits')
            ? (json['EC2InstanceLimits'] as List)
                .map((e) => Ec2InstanceLimit.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeFleetAttributesOutput {
  /// Collection of objects containing attribute metadata for each requested
  /// fleet ID.
  final List<FleetAttributes> fleetAttributes;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeFleetAttributesOutput({
    this.fleetAttributes,
    this.nextToken,
  });
  static DescribeFleetAttributesOutput fromJson(Map<String, dynamic> json) =>
      DescribeFleetAttributesOutput(
        fleetAttributes: json.containsKey('FleetAttributes')
            ? (json['FleetAttributes'] as List)
                .map((e) => FleetAttributes.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeFleetCapacityOutput {
  /// Collection of objects containing capacity information for each requested
  /// fleet ID. Leave this parameter empty to retrieve capacity information for
  /// all fleets.
  final List<FleetCapacity> fleetCapacity;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeFleetCapacityOutput({
    this.fleetCapacity,
    this.nextToken,
  });
  static DescribeFleetCapacityOutput fromJson(Map<String, dynamic> json) =>
      DescribeFleetCapacityOutput(
        fleetCapacity: json.containsKey('FleetCapacity')
            ? (json['FleetCapacity'] as List)
                .map((e) => FleetCapacity.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeFleetEventsOutput {
  /// Collection of objects containing event log entries for the specified
  /// fleet.
  final List<Event> events;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeFleetEventsOutput({
    this.events,
    this.nextToken,
  });
  static DescribeFleetEventsOutput fromJson(Map<String, dynamic> json) =>
      DescribeFleetEventsOutput(
        events: json.containsKey('Events')
            ? (json['Events'] as List).map((e) => Event.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeFleetPortSettingsOutput {
  /// Object that contains port settings for the requested fleet ID.
  final List<IpPermission> inboundPermissions;

  DescribeFleetPortSettingsOutput({
    this.inboundPermissions,
  });
  static DescribeFleetPortSettingsOutput fromJson(Map<String, dynamic> json) =>
      DescribeFleetPortSettingsOutput(
        inboundPermissions: json.containsKey('InboundPermissions')
            ? (json['InboundPermissions'] as List)
                .map((e) => IpPermission.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeFleetUtilizationOutput {
  /// Collection of objects containing utilization information for each
  /// requested fleet ID.
  final List<FleetUtilization> fleetUtilization;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeFleetUtilizationOutput({
    this.fleetUtilization,
    this.nextToken,
  });
  static DescribeFleetUtilizationOutput fromJson(Map<String, dynamic> json) =>
      DescribeFleetUtilizationOutput(
        fleetUtilization: json.containsKey('FleetUtilization')
            ? (json['FleetUtilization'] as List)
                .map((e) => FleetUtilization.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeGameSessionDetailsOutput {
  /// Collection of objects containing game session properties and the
  /// protection policy currently in force for each session matching the
  /// request.
  final List<GameSessionDetail> gameSessionDetails;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeGameSessionDetailsOutput({
    this.gameSessionDetails,
    this.nextToken,
  });
  static DescribeGameSessionDetailsOutput fromJson(Map<String, dynamic> json) =>
      DescribeGameSessionDetailsOutput(
        gameSessionDetails: json.containsKey('GameSessionDetails')
            ? (json['GameSessionDetails'] as List)
                .map((e) => GameSessionDetail.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeGameSessionPlacementOutput {
  /// Object that describes the requested game session placement.
  final GameSessionPlacement gameSessionPlacement;

  DescribeGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  static DescribeGameSessionPlacementOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeGameSessionPlacementOutput(
        gameSessionPlacement: json.containsKey('GameSessionPlacement')
            ? GameSessionPlacement.fromJson(json['GameSessionPlacement'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeGameSessionQueuesOutput {
  /// Collection of objects that describes the requested game session queues.
  final List<GameSessionQueue> gameSessionQueues;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeGameSessionQueuesOutput({
    this.gameSessionQueues,
    this.nextToken,
  });
  static DescribeGameSessionQueuesOutput fromJson(Map<String, dynamic> json) =>
      DescribeGameSessionQueuesOutput(
        gameSessionQueues: json.containsKey('GameSessionQueues')
            ? (json['GameSessionQueues'] as List)
                .map((e) => GameSessionQueue.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeGameSessionsOutput {
  /// Collection of objects containing game session properties for each session
  /// matching the request.
  final List<GameSession> gameSessions;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });
  static DescribeGameSessionsOutput fromJson(Map<String, dynamic> json) =>
      DescribeGameSessionsOutput(
        gameSessions: json.containsKey('GameSessions')
            ? (json['GameSessions'] as List)
                .map((e) => GameSession.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeInstancesOutput {
  /// Collection of objects containing properties for each instance returned.
  final List<Instance> instances;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeInstancesOutput({
    this.instances,
    this.nextToken,
  });
  static DescribeInstancesOutput fromJson(Map<String, dynamic> json) =>
      DescribeInstancesOutput(
        instances: json.containsKey('Instances')
            ? (json['Instances'] as List)
                .map((e) => Instance.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeMatchmakingConfigurationsOutput {
  /// Collection of requested matchmaking configuration objects.
  final List<MatchmakingConfiguration> configurations;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeMatchmakingConfigurationsOutput({
    this.configurations,
    this.nextToken,
  });
  static DescribeMatchmakingConfigurationsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeMatchmakingConfigurationsOutput(
        configurations: json.containsKey('Configurations')
            ? (json['Configurations'] as List)
                .map((e) => MatchmakingConfiguration.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeMatchmakingOutput {
  /// Collection of existing matchmaking ticket objects matching the request.
  final List<MatchmakingTicket> ticketList;

  DescribeMatchmakingOutput({
    this.ticketList,
  });
  static DescribeMatchmakingOutput fromJson(Map<String, dynamic> json) =>
      DescribeMatchmakingOutput(
        ticketList: json.containsKey('TicketList')
            ? (json['TicketList'] as List)
                .map((e) => MatchmakingTicket.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeMatchmakingRuleSetsOutput {
  /// Collection of requested matchmaking rule set objects.
  final List<MatchmakingRuleSet> ruleSets;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeMatchmakingRuleSetsOutput({
    @required this.ruleSets,
    this.nextToken,
  });
  static DescribeMatchmakingRuleSetsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeMatchmakingRuleSetsOutput(
        ruleSets: (json['RuleSets'] as List)
            .map((e) => MatchmakingRuleSet.fromJson(e))
            .toList(),
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribePlayerSessionsOutput {
  /// Collection of objects containing properties for each player session that
  /// matches the request.
  final List<PlayerSession> playerSessions;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribePlayerSessionsOutput({
    this.playerSessions,
    this.nextToken,
  });
  static DescribePlayerSessionsOutput fromJson(Map<String, dynamic> json) =>
      DescribePlayerSessionsOutput(
        playerSessions: json.containsKey('PlayerSessions')
            ? (json['PlayerSessions'] as List)
                .map((e) => PlayerSession.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeRuntimeConfigurationOutput {
  /// Instructions describing how server processes should be launched and
  /// maintained on each instance in the fleet.
  final RuntimeConfiguration runtimeConfiguration;

  DescribeRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });
  static DescribeRuntimeConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeRuntimeConfigurationOutput(
        runtimeConfiguration: json.containsKey('RuntimeConfiguration')
            ? RuntimeConfiguration.fromJson(json['RuntimeConfiguration'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeScalingPoliciesOutput {
  /// Collection of objects containing the scaling policies matching the
  /// request.
  final List<ScalingPolicy> scalingPolicies;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  DescribeScalingPoliciesOutput({
    this.scalingPolicies,
    this.nextToken,
  });
  static DescribeScalingPoliciesOutput fromJson(Map<String, dynamic> json) =>
      DescribeScalingPoliciesOutput(
        scalingPolicies: json.containsKey('ScalingPolicies')
            ? (json['ScalingPolicies'] as List)
                .map((e) => ScalingPolicy.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class DescribeScriptOutput {
  /// Set of properties describing the requested script.
  final Script script;

  DescribeScriptOutput({
    this.script,
  });
  static DescribeScriptOutput fromJson(Map<String, dynamic> json) =>
      DescribeScriptOutput(
        script:
            json.containsKey('Script') ? Script.fromJson(json['Script']) : null,
      );
}

class DescribeVpcPeeringAuthorizationsOutput {
  /// Collection of objects that describe all valid VPC peering operations for
  /// the current AWS account.
  final List<VpcPeeringAuthorization> vpcPeeringAuthorizations;

  DescribeVpcPeeringAuthorizationsOutput({
    this.vpcPeeringAuthorizations,
  });
  static DescribeVpcPeeringAuthorizationsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeVpcPeeringAuthorizationsOutput(
        vpcPeeringAuthorizations: json.containsKey('VpcPeeringAuthorizations')
            ? (json['VpcPeeringAuthorizations'] as List)
                .map((e) => VpcPeeringAuthorization.fromJson(e))
                .toList()
            : null,
      );
}

/// Represents the returned data in response to a request action.
class DescribeVpcPeeringConnectionsOutput {
  /// Collection of VPC peering connection records that match the request.
  final List<VpcPeeringConnection> vpcPeeringConnections;

  DescribeVpcPeeringConnectionsOutput({
    this.vpcPeeringConnections,
  });
  static DescribeVpcPeeringConnectionsOutput fromJson(
          Map<String, dynamic> json) =>
      DescribeVpcPeeringConnectionsOutput(
        vpcPeeringConnections: json.containsKey('VpcPeeringConnections')
            ? (json['VpcPeeringConnections'] as List)
                .map((e) => VpcPeeringConnection.fromJson(e))
                .toList()
            : null,
      );
}

/// Player information for use when creating player sessions using a game
/// session placement request with StartGameSessionPlacement.
class DesiredPlayerSession {
  /// Unique identifier for a player to associate with the player session.
  final String playerId;

  /// Developer-defined information related to a player. Amazon GameLift does
  /// not use this data, so it can be formatted as needed for use in the game.
  final String playerData;

  DesiredPlayerSession({
    this.playerId,
    this.playerData,
  });
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Current status of fleet capacity. The number of active instances should
/// match or be in the process of matching the number of desired instances.
/// Pending and terminating counts are non-zero only if fleet capacity is
/// adjusting to an UpdateFleetCapacity request, or if access to resources is
/// temporarily affected.
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
class Ec2InstanceCounts {
  /// Ideal number of active instances in the fleet.
  final int desired;

  /// Minimum value allowed for the fleet's instance count.
  final int minimum;

  /// Maximum value allowed for the fleet's instance count.
  final int maximum;

  /// Number of instances in the fleet that are starting but not yet active.
  final int pending;

  /// Actual number of active instances in the fleet.
  final int active;

  /// Number of active instances in the fleet that are not currently hosting a
  /// game session.
  final int idle;

  /// Number of instances in the fleet that are no longer active but haven't yet
  /// been terminated.
  final int terminating;

  Ec2InstanceCounts({
    this.desired,
    this.minimum,
    this.maximum,
    this.pending,
    this.active,
    this.idle,
    this.terminating,
  });
  static Ec2InstanceCounts fromJson(Map<String, dynamic> json) =>
      Ec2InstanceCounts(
        desired: json.containsKey('DESIRED') ? json['DESIRED'] as int : null,
        minimum: json.containsKey('MINIMUM') ? json['MINIMUM'] as int : null,
        maximum: json.containsKey('MAXIMUM') ? json['MAXIMUM'] as int : null,
        pending: json.containsKey('PENDING') ? json['PENDING'] as int : null,
        active: json.containsKey('ACTIVE') ? json['ACTIVE'] as int : null,
        idle: json.containsKey('IDLE') ? json['IDLE'] as int : null,
        terminating:
            json.containsKey('TERMINATING') ? json['TERMINATING'] as int : null,
      );
}

/// Maximum number of instances allowed based on the Amazon Elastic Compute
/// Cloud (Amazon EC2) instance type. Instance limits can be retrieved by
/// calling DescribeEC2InstanceLimits.
class Ec2InstanceLimit {
  /// Name of an EC2 instance type that is supported in Amazon GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See
  /// [Amazon EC2 Instance Types](http://aws.amazon.com/ec2/instance-types/) for
  /// detailed descriptions.
  final String ec2InstanceType;

  /// Number of instances of the specified type that are currently in use by
  /// this AWS account.
  final int currentInstances;

  /// Number of instances allowed.
  final int instanceLimit;

  Ec2InstanceLimit({
    this.ec2InstanceType,
    this.currentInstances,
    this.instanceLimit,
  });
  static Ec2InstanceLimit fromJson(Map<String, dynamic> json) =>
      Ec2InstanceLimit(
        ec2InstanceType: json.containsKey('EC2InstanceType')
            ? json['EC2InstanceType'] as String
            : null,
        currentInstances: json.containsKey('CurrentInstances')
            ? json['CurrentInstances'] as int
            : null,
        instanceLimit: json.containsKey('InstanceLimit')
            ? json['InstanceLimit'] as int
            : null,
      );
}

/// Log entry describing an event that involves Amazon GameLift resources (such
/// as a fleet). In addition to tracking activity, event codes and messages can
/// provide additional information for troubleshooting and debugging problems.
class Event {
  /// Unique identifier for a fleet event.
  final String eventId;

  /// Unique identifier for an event resource, such as a fleet ID.
  final String resourceId;

  /// Type of event being logged. The following events are currently in use:
  ///
  ///  **Fleet creation events:**
  ///
  /// *   FLEET_CREATED -- A fleet record was successfully created with a status
  /// of `NEW`. Event messaging includes the fleet ID.
  ///
  /// *   FLEET_STATE_DOWNLOADING -- Fleet status changed from `NEW` to
  /// `DOWNLOADING`. The compressed build has started downloading to a fleet
  /// instance for installation.
  ///
  /// *    FLEET_BINARY_DOWNLOAD_FAILED -- The build failed to download to the
  /// fleet instance.
  ///
  /// *   FLEET_CREATION_EXTRACTING_BUILD – The game server build was
  /// successfully downloaded to an instance, and the build files are now being
  /// extracted from the uploaded build and saved to an instance. Failure at
  /// this stage prevents a fleet from moving to `ACTIVE` status. Logs for this
  /// stage display a list of the files that are extracted and saved on the
  /// instance. Access the logs by using the URL in _PreSignedLogUrl_.
  ///
  /// *   FLEET_CREATION_RUNNING_INSTALLER – The game server build files were
  /// successfully extracted, and the Amazon GameLift is now running the build's
  /// install script (if one is included). Failure in this stage prevents a
  /// fleet from moving to `ACTIVE` status. Logs for this stage list the
  /// installation steps and whether or not the install completed successfully.
  /// Access the logs by using the URL in _PreSignedLogUrl_.
  ///
  /// *   FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -- The build process was
  /// successful, and the Amazon GameLift is now verifying that the game server
  /// launch paths, which are specified in the fleet's run-time configuration,
  /// exist. If any listed launch path exists, Amazon GameLift tries to launch a
  /// game server process and waits for the process to report ready. Failures in
  /// this stage prevent a fleet from moving to `ACTIVE` status. Logs for this
  /// stage list the launch paths in the run-time configuration and indicate
  /// whether each is found. Access the logs by using the URL in
  /// _PreSignedLogUrl_.
  ///
  /// *   FLEET_STATE_VALIDATING -- Fleet status changed from `DOWNLOADING` to
  /// `VALIDATING`.
  ///
  /// *    FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -- Validation of the run-time
  /// configuration failed because the executable specified in a launch path
  /// does not exist on the instance.
  ///
  /// *   FLEET_STATE_BUILDING -- Fleet status changed from `VALIDATING` to
  /// `BUILDING`.
  ///
  /// *   FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE -- Validation of the
  /// run-time configuration failed because the executable specified in a launch
  /// path failed to run on the fleet instance.
  ///
  /// *   FLEET_STATE_ACTIVATING -- Fleet status changed from `BUILDING` to
  /// `ACTIVATING`.
  ///
  /// *    FLEET_ACTIVATION_FAILED - The fleet failed to successfully complete
  /// one of the steps in the fleet activation process. This event code
  /// indicates that the game build was successfully downloaded to a fleet
  /// instance, built, and validated, but was not able to start a server
  /// process. A possible reason for failure is that the game server is not
  /// reporting "process ready" to the Amazon GameLift service.
  ///
  /// *   FLEET_STATE_ACTIVE -- The fleet's status changed from `ACTIVATING` to
  /// `ACTIVE`. The fleet is now ready to host game sessions.
  ///
  ///
  ///  **VPC peering events:**
  ///
  /// *   FLEET_VPC_PEERING_SUCCEEDED -- A VPC peering connection has been
  /// established between the VPC for an Amazon GameLift fleet and a VPC in your
  /// AWS account.
  ///
  /// *   FLEET_VPC_PEERING_FAILED -- A requested VPC peering connection has
  /// failed. Event details and status information (see
  /// DescribeVpcPeeringConnections) provide additional detail. A common reason
  /// for peering failure is that the two VPCs have overlapping CIDR blocks of
  /// IPv4 addresses. To resolve this, change the CIDR block for the VPC in your
  /// AWS account. For more information on VPC peering failures, see
  /// [https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html](https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html)
  ///
  /// *   FLEET_VPC_PEERING_DELETED -- A VPC peering connection has been
  /// successfully deleted.
  ///
  ///
  ///  **Spot instance events:**
  ///
  /// *    INSTANCE_INTERRUPTED -- A spot instance was interrupted by EC2 with a
  /// two-minute notification.
  ///
  ///
  ///  **Other fleet events:**
  ///
  /// *   FLEET_SCALING_EVENT -- A change was made to the fleet's capacity
  /// settings (desired instances, minimum/maximum scaling limits). Event
  /// messaging includes the new capacity settings.
  ///
  /// *   FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED -- A change was made
  /// to the fleet's game session protection policy setting. Event messaging
  /// includes both the old and new policy setting.
  ///
  /// *   FLEET_DELETED -- A request to delete a fleet was initiated.
  ///
  /// *    GENERIC_EVENT -- An unspecified event has occurred.
  final String eventCode;

  /// Additional information related to the event.
  final String message;

  /// Time stamp indicating when this event occurred. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  final DateTime eventTime;

  /// Location of stored logs with additional detail that is related to the
  /// event. This is useful for debugging issues. The URL is valid for 15
  /// minutes. You can also access fleet creation logs through the Amazon
  /// GameLift console.
  final String preSignedLogUrl;

  Event({
    this.eventId,
    this.resourceId,
    this.eventCode,
    this.message,
    this.eventTime,
    this.preSignedLogUrl,
  });
  static Event fromJson(Map<String, dynamic> json) => Event(
        eventId: json.containsKey('EventId') ? json['EventId'] as String : null,
        resourceId: json.containsKey('ResourceId')
            ? json['ResourceId'] as String
            : null,
        eventCode:
            json.containsKey('EventCode') ? json['EventCode'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
        eventTime: json.containsKey('EventTime')
            ? DateTime.parse(json['EventTime'])
            : null,
        preSignedLogUrl: json.containsKey('PreSignedLogUrl')
            ? json['PreSignedLogUrl'] as String
            : null,
      );
}

/// General properties describing a fleet.
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
class FleetAttributes {
  /// Unique identifier for a fleet.
  final String fleetId;

  /// Identifier for a fleet that is unique across all regions.
  final String fleetArn;

  /// Indicates whether the fleet uses on-demand or spot instances. A spot
  /// instance in use may be interrupted with a two-minute notification.
  final String fleetType;

  /// EC2 instance type indicating the computing resources of each instance in
  /// the fleet, including CPU, memory, storage, and networking capacity. See
  /// [Amazon EC2 Instance Types](http://aws.amazon.com/ec2/instance-types/) for
  /// detailed descriptions.
  final String instanceType;

  /// Human-readable description of the fleet.
  final String description;

  /// Descriptive label that is associated with a fleet. Fleet names do not need
  /// to be unique.
  final String name;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime terminationTime;

  /// Current status of the fleet.
  ///
  /// Possible fleet statuses include the following:
  ///
  /// *    **NEW** -- A new fleet has been defined and desired instances is set
  /// to 1.
  ///
  /// *    **DOWNLOADING/VALIDATING/BUILDING/ACTIVATING** -- Amazon GameLift is
  /// setting up the new fleet, creating new instances with the game build or
  /// Realtime script and starting server processes.
  ///
  /// *    **ACTIVE** -- Hosts can now accept game sessions.
  ///
  /// *    **ERROR** -- An error occurred when downloading, validating,
  /// building, or activating the fleet.
  ///
  /// *    **DELETING** -- Hosts are responding to a delete fleet request.
  ///
  /// *    **TERMINATED** -- The fleet no longer exists.
  final String status;

  /// Unique identifier for a build.
  final String buildId;

  /// Unique identifier for a Realtime script.
  final String scriptId;

  /// Path to a game server executable in the fleet's build, specified for
  /// fleets created before 2016-08-04 (or AWS SDK v. 0.12.16). Server launch
  /// paths for fleets created after this date are specified in the fleet's
  /// RuntimeConfiguration.
  final String serverLaunchPath;

  /// Game server launch parameters specified for fleets created before
  /// 2016-08-04 (or AWS SDK v. 0.12.16). Server launch parameters for fleets
  /// created after this date are specified in the fleet's RuntimeConfiguration.
  final String serverLaunchParameters;

  /// Location of default log files. When a server process is shut down, Amazon
  /// GameLift captures and stores any log files in this location. These logs
  /// are in addition to game session logs; see more on game session logs in the
  /// [Amazon GameLift Developer Guide](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-api-server-code).
  /// If no default log path for a fleet is specified, Amazon GameLift
  /// automatically uploads logs that are stored on each instance at
  /// `C:gamelogs` (for Windows) or `/local/game/logs` (for Linux). Use the
  /// Amazon GameLift console to access stored logs.
  final List<String> logPaths;

  /// Type of game session protection to set for all new instances started in
  /// the fleet.
  ///
  /// *    **NoProtection** -- The game session can be terminated during a
  /// scale-down event.
  ///
  /// *    **FullProtection** -- If the game session is in an `ACTIVE` status,
  /// it cannot be terminated during a scale-down event.
  final String newGameSessionProtectionPolicy;

  /// Operating system of the fleet's computing resources. A fleet's operating
  /// system depends on the OS specified for the build that is deployed on this
  /// fleet.
  final String operatingSystem;

  /// Fleet policy to limit the number of game sessions an individual player can
  /// create over a span of time.
  final ResourceCreationLimitPolicy resourceCreationLimitPolicy;

  /// Names of metric groups that this fleet is included in. In Amazon
  /// CloudWatch, you can view metrics for an individual fleet or aggregated
  /// metrics for fleets that are in a fleet metric group. A fleet can be
  /// included in only one metric group at a time.
  final List<String> metricGroups;

  /// List of fleet actions that have been suspended using StopFleetActions.
  /// This includes auto-scaling.
  final List<String> stoppedActions;

  /// Unique identifier for an AWS IAM role that manages access to your AWS
  /// services. With an instance role ARN set, any application that runs on an
  /// instance in this fleet can assume the role, including install scripts,
  /// server processes, daemons (background processes). Create a role or look up
  /// a role's ARN using the
  /// [IAM dashboard](https://console.aws.amazon.com/iam/) in the AWS Management
  /// Console. Learn more about using on-box credentials for your game servers
  /// at
  /// [Access external resources from a game server](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html).
  final String instanceRoleArn;

  final CertificateConfiguration certificateConfiguration;

  FleetAttributes({
    this.fleetId,
    this.fleetArn,
    this.fleetType,
    this.instanceType,
    this.description,
    this.name,
    this.creationTime,
    this.terminationTime,
    this.status,
    this.buildId,
    this.scriptId,
    this.serverLaunchPath,
    this.serverLaunchParameters,
    this.logPaths,
    this.newGameSessionProtectionPolicy,
    this.operatingSystem,
    this.resourceCreationLimitPolicy,
    this.metricGroups,
    this.stoppedActions,
    this.instanceRoleArn,
    this.certificateConfiguration,
  });
  static FleetAttributes fromJson(Map<String, dynamic> json) => FleetAttributes(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        fleetArn:
            json.containsKey('FleetArn') ? json['FleetArn'] as String : null,
        fleetType:
            json.containsKey('FleetType') ? json['FleetType'] as String : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        terminationTime: json.containsKey('TerminationTime')
            ? DateTime.parse(json['TerminationTime'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        buildId: json.containsKey('BuildId') ? json['BuildId'] as String : null,
        scriptId:
            json.containsKey('ScriptId') ? json['ScriptId'] as String : null,
        serverLaunchPath: json.containsKey('ServerLaunchPath')
            ? json['ServerLaunchPath'] as String
            : null,
        serverLaunchParameters: json.containsKey('ServerLaunchParameters')
            ? json['ServerLaunchParameters'] as String
            : null,
        logPaths: json.containsKey('LogPaths')
            ? (json['LogPaths'] as List).map((e) => e as String).toList()
            : null,
        newGameSessionProtectionPolicy:
            json.containsKey('NewGameSessionProtectionPolicy')
                ? json['NewGameSessionProtectionPolicy'] as String
                : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? json['OperatingSystem'] as String
            : null,
        resourceCreationLimitPolicy:
            json.containsKey('ResourceCreationLimitPolicy')
                ? ResourceCreationLimitPolicy.fromJson(
                    json['ResourceCreationLimitPolicy'])
                : null,
        metricGroups: json.containsKey('MetricGroups')
            ? (json['MetricGroups'] as List).map((e) => e as String).toList()
            : null,
        stoppedActions: json.containsKey('StoppedActions')
            ? (json['StoppedActions'] as List).map((e) => e as String).toList()
            : null,
        instanceRoleArn: json.containsKey('InstanceRoleArn')
            ? json['InstanceRoleArn'] as String
            : null,
        certificateConfiguration: json.containsKey('CertificateConfiguration')
            ? CertificateConfiguration.fromJson(
                json['CertificateConfiguration'])
            : null,
      );
}

/// Information about the fleet's capacity. Fleet capacity is measured in EC2
/// instances. By default, new fleets have a capacity of one instance, but can
/// be updated as needed. The maximum number of instances for a fleet is
/// determined by the fleet's instance type.
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
class FleetCapacity {
  /// Unique identifier for a fleet.
  final String fleetId;

  /// Name of an EC2 instance type that is supported in Amazon GameLift. A fleet
  /// instance type determines the computing resources of each instance in the
  /// fleet, including CPU, memory, storage, and networking capacity. Amazon
  /// GameLift supports the following EC2 instance types. See
  /// [Amazon EC2 Instance Types](http://aws.amazon.com/ec2/instance-types/) for
  /// detailed descriptions.
  final String instanceType;

  /// Current status of fleet capacity.
  final Ec2InstanceCounts instanceCounts;

  FleetCapacity({
    this.fleetId,
    this.instanceType,
    this.instanceCounts,
  });
  static FleetCapacity fromJson(Map<String, dynamic> json) => FleetCapacity(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        instanceType: json.containsKey('InstanceType')
            ? json['InstanceType'] as String
            : null,
        instanceCounts: json.containsKey('InstanceCounts')
            ? Ec2InstanceCounts.fromJson(json['InstanceCounts'])
            : null,
      );
}

/// Current status of fleet utilization, including the number of game and player
/// sessions being hosted.
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
class FleetUtilization {
  /// Unique identifier for a fleet.
  final String fleetId;

  /// Number of server processes in an `ACTIVE` status currently running across
  /// all instances in the fleet
  final int activeServerProcessCount;

  /// Number of active game sessions currently being hosted on all instances in
  /// the fleet.
  final int activeGameSessionCount;

  /// Number of active player sessions currently being hosted on all instances
  /// in the fleet.
  final int currentPlayerSessionCount;

  /// Maximum players allowed across all game sessions currently being hosted on
  /// all instances in the fleet.
  final int maximumPlayerSessionCount;

  FleetUtilization({
    this.fleetId,
    this.activeServerProcessCount,
    this.activeGameSessionCount,
    this.currentPlayerSessionCount,
    this.maximumPlayerSessionCount,
  });
  static FleetUtilization fromJson(Map<String, dynamic> json) =>
      FleetUtilization(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        activeServerProcessCount: json.containsKey('ActiveServerProcessCount')
            ? json['ActiveServerProcessCount'] as int
            : null,
        activeGameSessionCount: json.containsKey('ActiveGameSessionCount')
            ? json['ActiveGameSessionCount'] as int
            : null,
        currentPlayerSessionCount: json.containsKey('CurrentPlayerSessionCount')
            ? json['CurrentPlayerSessionCount'] as int
            : null,
        maximumPlayerSessionCount: json.containsKey('MaximumPlayerSessionCount')
            ? json['MaximumPlayerSessionCount'] as int
            : null,
      );
}

/// Set of key-value pairs that contain information about a game session. When
/// included in a game session request, these properties communicate details to
/// be used when setting up the new game session, such as to specify a game
/// mode, level, or map. Game properties are passed to the game server process
/// when initiating a new game session; the server process uses the properties
/// as appropriate. For more information, see the
/// [Amazon GameLift Developer Guide](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#gamelift-sdk-client-api-create).
class GameProperty {
  /// Game property identifier.
  final String key;

  /// Game property value.
  final String value;

  GameProperty({
    @required this.key,
    @required this.value,
  });
  static GameProperty fromJson(Map<String, dynamic> json) => GameProperty(
        key: json['Key'] as String,
        value: json['Value'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Properties describing a game session.
///
/// A game session in ACTIVE status can host players. When a game session ends,
/// its status is set to `TERMINATED`.
///
/// Once the session ends, the game session object is retained for 30 days. This
/// means you can reuse idempotency token values after this time. Game session
/// logs are retained for 14 days.
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
class GameSession {
  /// Unique identifier for the game session. A game session ARN has the
  /// following format: `arn:aws:gamelift:<region>::gamesession/<fleet
  /// ID>/<custom ID string or idempotency token>`.
  final String gameSessionId;

  /// Descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  final String name;

  /// Unique identifier for a fleet that the game session is running on.
  final String fleetId;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime terminationTime;

  /// Number of players currently in the game session.
  final int currentPlayerSessionCount;

  /// Maximum number of players that can be connected simultaneously to the game
  /// session.
  final int maximumPlayerSessionCount;

  /// Current status of the game session. A game session must have an `ACTIVE`
  /// status to have player sessions.
  final String status;

  /// Provides additional information about game session status. `INTERRUPTED`
  /// indicates that the game session was hosted on a spot instance that was
  /// reclaimed, causing the active game session to be terminated.
  final String statusReason;

  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the GameSession
  /// object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// You can search for active game sessions based on this custom data with
  /// SearchGameSessions.
  final List<GameProperty> gameProperties;

  /// IP address of the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  final String ipAddress;

  final String dnsName;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  final int port;

  /// Indicates whether or not the game session is accepting new players.
  final String playerSessionCreationPolicy;

  /// Unique identifier for a player. This ID is used to enforce a resource
  /// protection policy (if one exists), that limits the number of game sessions
  /// a player can create.
  final String creatorId;

  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the GameSession object
  /// with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  final String gameSessionData;

  /// Information about the matchmaking process that was used to create the game
  /// session. It is in JSON syntax, formatted as a string. In addition the
  /// matchmaking configuration used, it contains data on all players assigned
  /// to the match, including player attributes and team assignments. For more
  /// details on matchmaker data, see
  /// [Match Data](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-server.html#match-server-data).
  /// Matchmaker data is useful when requesting match backfills, and is updated
  /// whenever new players are added during a successful backfill (see
  /// StartMatchBackfill).
  final String matchmakerData;

  GameSession({
    this.gameSessionId,
    this.name,
    this.fleetId,
    this.creationTime,
    this.terminationTime,
    this.currentPlayerSessionCount,
    this.maximumPlayerSessionCount,
    this.status,
    this.statusReason,
    this.gameProperties,
    this.ipAddress,
    this.dnsName,
    this.port,
    this.playerSessionCreationPolicy,
    this.creatorId,
    this.gameSessionData,
    this.matchmakerData,
  });
  static GameSession fromJson(Map<String, dynamic> json) => GameSession(
        gameSessionId: json.containsKey('GameSessionId')
            ? json['GameSessionId'] as String
            : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        terminationTime: json.containsKey('TerminationTime')
            ? DateTime.parse(json['TerminationTime'])
            : null,
        currentPlayerSessionCount: json.containsKey('CurrentPlayerSessionCount')
            ? json['CurrentPlayerSessionCount'] as int
            : null,
        maximumPlayerSessionCount: json.containsKey('MaximumPlayerSessionCount')
            ? json['MaximumPlayerSessionCount'] as int
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
        gameProperties: json.containsKey('GameProperties')
            ? (json['GameProperties'] as List)
                .map((e) => GameProperty.fromJson(e))
                .toList()
            : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        dnsName: json.containsKey('DnsName') ? json['DnsName'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        playerSessionCreationPolicy:
            json.containsKey('PlayerSessionCreationPolicy')
                ? json['PlayerSessionCreationPolicy'] as String
                : null,
        creatorId:
            json.containsKey('CreatorId') ? json['CreatorId'] as String : null,
        gameSessionData: json.containsKey('GameSessionData')
            ? json['GameSessionData'] as String
            : null,
        matchmakerData: json.containsKey('MatchmakerData')
            ? json['MatchmakerData'] as String
            : null,
      );
}

/// Connection information for the new game session that is created with
/// matchmaking. (with StartMatchmaking). Once a match is set, the FlexMatch
/// engine places the match and creates a new game session for it. This
/// information, including the game session endpoint and player sessions for
/// each player in the original matchmaking request, is added to the
/// MatchmakingTicket, which can be retrieved by calling DescribeMatchmaking.
class GameSessionConnectionInfo {
  /// Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session and uniquely identifies it.
  final String gameSessionArn;

  /// IP address of the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  final String ipAddress;

  final String dnsName;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  final int port;

  /// Collection of player session IDs, one for each player ID that was included
  /// in the original matchmaking request.
  final List<MatchedPlayerSession> matchedPlayerSessions;

  GameSessionConnectionInfo({
    this.gameSessionArn,
    this.ipAddress,
    this.dnsName,
    this.port,
    this.matchedPlayerSessions,
  });
  static GameSessionConnectionInfo fromJson(Map<String, dynamic> json) =>
      GameSessionConnectionInfo(
        gameSessionArn: json.containsKey('GameSessionArn')
            ? json['GameSessionArn'] as String
            : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        dnsName: json.containsKey('DnsName') ? json['DnsName'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        matchedPlayerSessions: json.containsKey('MatchedPlayerSessions')
            ? (json['MatchedPlayerSessions'] as List)
                .map((e) => MatchedPlayerSession.fromJson(e))
                .toList()
            : null,
      );
}

/// A game session's properties plus the protection policy currently in force.
class GameSessionDetail {
  /// Object that describes a game session.
  final GameSession gameSession;

  /// Current status of protection for the game session.
  ///
  /// *    **NoProtection** -- The game session can be terminated during a
  /// scale-down event.
  ///
  /// *    **FullProtection** -- If the game session is in an `ACTIVE` status,
  /// it cannot be terminated during a scale-down event.
  final String protectionPolicy;

  GameSessionDetail({
    this.gameSession,
    this.protectionPolicy,
  });
  static GameSessionDetail fromJson(Map<String, dynamic> json) =>
      GameSessionDetail(
        gameSession: json.containsKey('GameSession')
            ? GameSession.fromJson(json['GameSession'])
            : null,
        protectionPolicy: json.containsKey('ProtectionPolicy')
            ? json['ProtectionPolicy'] as String
            : null,
      );
}

/// Object that describes a StartGameSessionPlacement request. This object
/// includes the full details of the original request plus the current status
/// and start/end time stamps.
///
/// Game session placement-related operations include:
///
/// *    StartGameSessionPlacement
///
/// *    DescribeGameSessionPlacement
///
/// *    StopGameSessionPlacement
class GameSessionPlacement {
  /// Unique identifier for a game session placement.
  final String placementId;

  /// Descriptive label that is associated with game session queue. Queue names
  /// must be unique within each region.
  final String gameSessionQueueName;

  /// Current status of the game session placement request.
  ///
  /// *    **PENDING** -- The placement request is currently in the queue
  /// waiting to be processed.
  ///
  /// *    **FULFILLED** -- A new game session and player sessions (if
  /// requested) have been successfully created. Values for _GameSessionArn_ and
  /// _GameSessionRegion_ are available.
  ///
  /// *    **CANCELLED** -- The placement request was canceled with a call to
  /// StopGameSessionPlacement.
  ///
  /// *    **TIMED_OUT** -- A new game session was not successfully created
  /// before the time limit expired. You can resubmit the placement request as
  /// needed.
  final String status;

  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the GameSession
  /// object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  final List<GameProperty> gameProperties;

  /// Maximum number of players that can be connected simultaneously to the game
  /// session.
  final int maximumPlayerSessionCount;

  /// Descriptive label that is associated with a game session. Session names do
  /// not need to be unique.
  final String gameSessionName;

  /// Unique identifier for the game session. This value is set once the new
  /// game session is placed (placement status is `FULFILLED`).
  final String gameSessionId;

  /// Identifier for the game session created by this placement request. This
  /// value is set once the new game session is placed (placement status is
  /// `FULFILLED`). This identifier is unique across all regions. You can use
  /// this value as a `GameSessionId` value as needed.
  final String gameSessionArn;

  /// Name of the region where the game session created by this placement
  /// request is running. This value is set once the new game session is placed
  /// (placement status is `FULFILLED`).
  final String gameSessionRegion;

  /// Set of values, expressed in milliseconds, indicating the amount of latency
  /// that a player experiences when connected to AWS regions.
  final List<PlayerLatency> playerLatencies;

  /// Time stamp indicating when this request was placed in the queue. Format is
  /// a number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime startTime;

  /// Time stamp indicating when this request was completed, canceled, or timed
  /// out.
  final DateTime endTime;

  /// IP address of the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number. This value is
  /// set once the new game session is placed (placement status is `FULFILLED`).
  final String ipAddress;

  final String dnsName;

  /// Port number for the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number. This value is
  /// set once the new game session is placed (placement status is `FULFILLED`).
  final int port;

  /// Collection of information on player sessions created in response to the
  /// game session placement request. These player sessions are created only
  /// once a new game session is successfully placed (placement status is
  /// `FULFILLED`). This information includes the player ID (as provided in the
  /// placement request) and the corresponding player session ID. Retrieve full
  /// player sessions by calling DescribePlayerSessions with the player session
  /// ID.
  final List<PlacedPlayerSession> placedPlayerSessions;

  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the GameSession object
  /// with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  final String gameSessionData;

  /// Information on the matchmaking process for this game. Data is in JSON
  /// syntax, formatted as a string. It identifies the matchmaking configuration
  /// used to create the match, and contains data on all players assigned to the
  /// match, including player attributes and team assignments. For more details
  /// on matchmaker data, see
  /// [Match Data](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-server.html#match-server-data).
  final String matchmakerData;

  GameSessionPlacement({
    this.placementId,
    this.gameSessionQueueName,
    this.status,
    this.gameProperties,
    this.maximumPlayerSessionCount,
    this.gameSessionName,
    this.gameSessionId,
    this.gameSessionArn,
    this.gameSessionRegion,
    this.playerLatencies,
    this.startTime,
    this.endTime,
    this.ipAddress,
    this.dnsName,
    this.port,
    this.placedPlayerSessions,
    this.gameSessionData,
    this.matchmakerData,
  });
  static GameSessionPlacement fromJson(Map<String, dynamic> json) =>
      GameSessionPlacement(
        placementId: json.containsKey('PlacementId')
            ? json['PlacementId'] as String
            : null,
        gameSessionQueueName: json.containsKey('GameSessionQueueName')
            ? json['GameSessionQueueName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        gameProperties: json.containsKey('GameProperties')
            ? (json['GameProperties'] as List)
                .map((e) => GameProperty.fromJson(e))
                .toList()
            : null,
        maximumPlayerSessionCount: json.containsKey('MaximumPlayerSessionCount')
            ? json['MaximumPlayerSessionCount'] as int
            : null,
        gameSessionName: json.containsKey('GameSessionName')
            ? json['GameSessionName'] as String
            : null,
        gameSessionId: json.containsKey('GameSessionId')
            ? json['GameSessionId'] as String
            : null,
        gameSessionArn: json.containsKey('GameSessionArn')
            ? json['GameSessionArn'] as String
            : null,
        gameSessionRegion: json.containsKey('GameSessionRegion')
            ? json['GameSessionRegion'] as String
            : null,
        playerLatencies: json.containsKey('PlayerLatencies')
            ? (json['PlayerLatencies'] as List)
                .map((e) => PlayerLatency.fromJson(e))
                .toList()
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        dnsName: json.containsKey('DnsName') ? json['DnsName'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        placedPlayerSessions: json.containsKey('PlacedPlayerSessions')
            ? (json['PlacedPlayerSessions'] as List)
                .map((e) => PlacedPlayerSession.fromJson(e))
                .toList()
            : null,
        gameSessionData: json.containsKey('GameSessionData')
            ? json['GameSessionData'] as String
            : null,
        matchmakerData: json.containsKey('MatchmakerData')
            ? json['MatchmakerData'] as String
            : null,
      );
}

/// Configuration of a queue that is used to process game session placement
/// requests. The queue configuration identifies several game features:
///
/// *   The destinations where a new game session can potentially be hosted.
/// Amazon GameLift tries these destinations in an order based on either the
/// queue's default order or player latency information, if provided in a
/// placement request. With latency information, Amazon GameLift can place game
/// sessions where the majority of players are reporting the lowest possible
/// latency.
///
/// *   The length of time that placement requests can wait in the queue before
/// timing out.
///
/// *   A set of optional latency policies that protect individual players from
/// high latencies, preventing game sessions from being placed where any
/// individual player is reporting latency higher than a policy's maximum.
///
///
/// *    CreateGameSessionQueue
///
/// *    DescribeGameSessionQueues
///
/// *    UpdateGameSessionQueue
///
/// *    DeleteGameSessionQueue
class GameSessionQueue {
  /// Descriptive label that is associated with game session queue. Queue names
  /// must be unique within each region.
  final String name;

  /// Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session queue and uniquely identifies it.
  /// Format is `arn:aws:gamelift:<region>:<aws account>:gamesessionqueue/<queue
  /// name>`.
  final String gameSessionQueueArn;

  /// Maximum time, in seconds, that a new game session placement request
  /// remains in the queue. When a request exceeds this time, the game session
  /// placement changes to a `TIMED_OUT` status.
  final int timeoutInSeconds;

  /// Collection of latency policies to apply when processing game sessions
  /// placement requests with player latency information. Multiple policies are
  /// evaluated in order of the maximum latency value, starting with the lowest
  /// latency values. With just one policy, it is enforced at the start of the
  /// game session placement for the duration period. With multiple policies,
  /// each policy is enforced consecutively for its duration period. For
  /// example, a queue might enforce a 60-second policy followed by a 120-second
  /// policy, and then no policy for the remainder of the placement.
  final List<PlayerLatencyPolicy> playerLatencyPolicies;

  /// List of fleets that can be used to fulfill game session placement requests
  /// in the queue. Fleets are identified by either a fleet ARN or a fleet alias
  /// ARN. Destinations are listed in default preference order.
  final List<GameSessionQueueDestination> destinations;

  GameSessionQueue({
    this.name,
    this.gameSessionQueueArn,
    this.timeoutInSeconds,
    this.playerLatencyPolicies,
    this.destinations,
  });
  static GameSessionQueue fromJson(Map<String, dynamic> json) =>
      GameSessionQueue(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        gameSessionQueueArn: json.containsKey('GameSessionQueueArn')
            ? json['GameSessionQueueArn'] as String
            : null,
        timeoutInSeconds: json.containsKey('TimeoutInSeconds')
            ? json['TimeoutInSeconds'] as int
            : null,
        playerLatencyPolicies: json.containsKey('PlayerLatencyPolicies')
            ? (json['PlayerLatencyPolicies'] as List)
                .map((e) => PlayerLatencyPolicy.fromJson(e))
                .toList()
            : null,
        destinations: json.containsKey('Destinations')
            ? (json['Destinations'] as List)
                .map((e) => GameSessionQueueDestination.fromJson(e))
                .toList()
            : null,
      );
}

/// Fleet designated in a game session queue. Requests for new game sessions in
/// the queue are fulfilled by starting a new game session on any destination
/// configured for a queue.
///
/// *    CreateGameSessionQueue
///
/// *    DescribeGameSessionQueues
///
/// *    UpdateGameSessionQueue
///
/// *    DeleteGameSessionQueue
class GameSessionQueueDestination {
  /// Amazon Resource Name (ARN) assigned to fleet or fleet alias. ARNs, which
  /// include a fleet ID or alias ID and a region name, provide a unique
  /// identifier across all regions.
  final String destinationArn;

  GameSessionQueueDestination({
    this.destinationArn,
  });
  static GameSessionQueueDestination fromJson(Map<String, dynamic> json) =>
      GameSessionQueueDestination(
        destinationArn: json.containsKey('DestinationArn')
            ? json['DestinationArn'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the returned data in response to a request action.
class GetGameSessionLogUrlOutput {
  /// Location of the requested game session logs, available for download. This
  /// URL is valid for 15 minutes, after which S3 will reject any download
  /// request using this URL. You can request a new URL any time within the
  /// 14-day period that the logs are retained.
  final String preSignedUrl;

  GetGameSessionLogUrlOutput({
    this.preSignedUrl,
  });
  static GetGameSessionLogUrlOutput fromJson(Map<String, dynamic> json) =>
      GetGameSessionLogUrlOutput(
        preSignedUrl: json.containsKey('PreSignedUrl')
            ? json['PreSignedUrl'] as String
            : null,
      );
}

/// Represents the returned data in response to a request action.
class GetInstanceAccessOutput {
  /// Object that contains connection information for a fleet instance,
  /// including IP address and access credentials.
  final InstanceAccess instanceAccess;

  GetInstanceAccessOutput({
    this.instanceAccess,
  });
  static GetInstanceAccessOutput fromJson(Map<String, dynamic> json) =>
      GetInstanceAccessOutput(
        instanceAccess: json.containsKey('InstanceAccess')
            ? InstanceAccess.fromJson(json['InstanceAccess'])
            : null,
      );
}

/// Properties that describe an instance of a virtual computing resource that
/// hosts one or more game servers. A fleet may contain zero or more instances.
class Instance {
  /// Unique identifier for a fleet that the instance is in.
  final String fleetId;

  /// Unique identifier for an instance.
  final String instanceId;

  /// IP address assigned to the instance.
  final String ipAddress;

  final String dnsName;

  /// Operating system that is running on this instance.
  final String operatingSystem;

  /// EC2 instance type that defines the computing resources of this instance.
  final String type;

  /// Current status of the instance. Possible statuses include the following:
  ///
  /// *    **PENDING** -- The instance is in the process of being created and
  /// launching server processes as defined in the fleet's run-time
  /// configuration.
  ///
  /// *    **ACTIVE** -- The instance has been successfully created and at least
  /// one server process has successfully launched and reported back to Amazon
  /// GameLift that it is ready to host a game session. The instance is now
  /// considered ready to host game sessions.
  ///
  /// *    **TERMINATING** -- The instance is in the process of shutting down.
  /// This may happen to reduce capacity during a scaling down event or to
  /// recycle resources in the event of a problem.
  final String status;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  Instance({
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.dnsName,
    this.operatingSystem,
    this.type,
    this.status,
    this.creationTime,
  });
  static Instance fromJson(Map<String, dynamic> json) => Instance(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        instanceId: json.containsKey('InstanceId')
            ? json['InstanceId'] as String
            : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        dnsName: json.containsKey('DnsName') ? json['DnsName'] as String : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? json['OperatingSystem'] as String
            : null,
        type: json.containsKey('Type') ? json['Type'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// Information required to remotely connect to a fleet instance. Access is
/// requested by calling GetInstanceAccess.
class InstanceAccess {
  /// Unique identifier for a fleet containing the instance being accessed.
  final String fleetId;

  /// Unique identifier for an instance being accessed.
  final String instanceId;

  /// IP address assigned to the instance.
  final String ipAddress;

  /// Operating system that is running on the instance.
  final String operatingSystem;

  /// Credentials required to access the instance.
  final InstanceCredentials credentials;

  InstanceAccess({
    this.fleetId,
    this.instanceId,
    this.ipAddress,
    this.operatingSystem,
    this.credentials,
  });
  static InstanceAccess fromJson(Map<String, dynamic> json) => InstanceAccess(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        instanceId: json.containsKey('InstanceId')
            ? json['InstanceId'] as String
            : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        operatingSystem: json.containsKey('OperatingSystem')
            ? json['OperatingSystem'] as String
            : null,
        credentials: json.containsKey('Credentials')
            ? InstanceCredentials.fromJson(json['Credentials'])
            : null,
      );
}

/// Set of credentials required to remotely access a fleet instance. Access
/// credentials are requested by calling GetInstanceAccess and returned in an
/// InstanceAccess object.
class InstanceCredentials {
  /// User login string.
  final String userName;

  /// Secret string. For Windows instances, the secret is a password for use
  /// with Windows Remote Desktop. For Linux instances, it is a private key
  /// (which must be saved as a `.pem` file) for use with SSH.
  final String secret;

  InstanceCredentials({
    this.userName,
    this.secret,
  });
  static InstanceCredentials fromJson(Map<String, dynamic> json) =>
      InstanceCredentials(
        userName:
            json.containsKey('UserName') ? json['UserName'] as String : null,
        secret: json.containsKey('Secret') ? json['Secret'] as String : null,
      );
}

/// A range of IP addresses and port settings that allow inbound traffic to
/// connect to server processes on an Amazon GameLift. New game sessions that
/// are started on the fleet are assigned an IP address/port number combination,
/// which must fall into the fleet's allowed ranges. For fleets created with a
/// custom game server, the ranges reflect the server's game session
/// assignments. For Realtime Servers fleets, Amazon GameLift automatically
/// opens two port ranges, one for TCP messaging and one for UDP for use by the
/// Realtime servers.
class IpPermission {
  /// Starting value for a range of allowed port numbers.
  final int fromPort;

  /// Ending value for a range of allowed port numbers. Port numbers are
  /// end-inclusive. This value must be higher than `FromPort`.
  final int toPort;

  /// Range of allowed IP addresses. This value must be expressed in CIDR
  /// notation. Example: "`000.000.000.000/[subnet mask]`" or optionally the
  /// shortened version "`0.0.0.0/[subnet mask]`".
  final String ipRange;

  /// Network communication protocol used by the fleet.
  final String protocol;

  IpPermission({
    @required this.fromPort,
    @required this.toPort,
    @required this.ipRange,
    @required this.protocol,
  });
  static IpPermission fromJson(Map<String, dynamic> json) => IpPermission(
        fromPort: json['FromPort'] as int,
        toPort: json['ToPort'] as int,
        ipRange: json['IpRange'] as String,
        protocol: json['Protocol'] as String,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the returned data in response to a request action.
class ListAliasesOutput {
  /// Collection of alias records that match the list request.
  final List<Alias> aliases;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  ListAliasesOutput({
    this.aliases,
    this.nextToken,
  });
  static ListAliasesOutput fromJson(Map<String, dynamic> json) =>
      ListAliasesOutput(
        aliases: json.containsKey('Aliases')
            ? (json['Aliases'] as List).map((e) => Alias.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class ListBuildsOutput {
  /// Collection of build records that match the request.
  final List<Build> builds;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  ListBuildsOutput({
    this.builds,
    this.nextToken,
  });
  static ListBuildsOutput fromJson(Map<String, dynamic> json) =>
      ListBuildsOutput(
        builds: json.containsKey('Builds')
            ? (json['Builds'] as List).map((e) => Build.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class ListFleetsOutput {
  /// Set of fleet IDs matching the list request. You can retrieve additional
  /// information about all returned fleets by passing this result set to a call
  /// to DescribeFleetAttributes, DescribeFleetCapacity, or
  /// DescribeFleetUtilization.
  final List<String> fleetIds;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  ListFleetsOutput({
    this.fleetIds,
    this.nextToken,
  });
  static ListFleetsOutput fromJson(Map<String, dynamic> json) =>
      ListFleetsOutput(
        fleetIds: json.containsKey('FleetIds')
            ? (json['FleetIds'] as List).map((e) => e as String).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

class ListScriptsOutput {
  /// Set of properties describing the requested script.
  final List<Script> scripts;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  ListScriptsOutput({
    this.scripts,
    this.nextToken,
  });
  static ListScriptsOutput fromJson(Map<String, dynamic> json) =>
      ListScriptsOutput(
        scripts: json.containsKey('Scripts')
            ? (json['Scripts'] as List).map((e) => Script.fromJson(e)).toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// Represents a new player session that is created as a result of a successful
/// FlexMatch match. A successful match automatically creates new player
/// sessions for every player ID in the original matchmaking request.
///
/// When players connect to the match's game session, they must include both
/// player ID and player session ID in order to claim their assigned player
/// slot.
class MatchedPlayerSession {
  /// Unique identifier for a player
  final String playerId;

  /// Unique identifier for a player session
  final String playerSessionId;

  MatchedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });
  static MatchedPlayerSession fromJson(Map<String, dynamic> json) =>
      MatchedPlayerSession(
        playerId:
            json.containsKey('PlayerId') ? json['PlayerId'] as String : null,
        playerSessionId: json.containsKey('PlayerSessionId')
            ? json['PlayerSessionId'] as String
            : null,
      );
}

/// Guidelines for use with FlexMatch to match players into games. All
/// matchmaking requests must specify a matchmaking configuration.
class MatchmakingConfiguration {
  /// Unique identifier for a matchmaking configuration. This name is used to
  /// identify the configuration associated with a matchmaking request or
  /// ticket.
  final String name;

  /// Descriptive label that is associated with matchmaking configuration.
  final String description;

  /// Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// that is assigned to a game session queue and uniquely identifies it.
  /// Format is `arn:aws:gamelift:<region>:<aws account>:gamesessionqueue/<queue
  /// name>`. These queues are used when placing game sessions for matches that
  /// are created with this matchmaking configuration. Queues can be located in
  /// any region.
  final List<String> gameSessionQueueArns;

  /// Maximum duration, in seconds, that a matchmaking ticket can remain in
  /// process before timing out. Requests that fail due to timing out can be
  /// resubmitted as needed.
  final int requestTimeoutSeconds;

  /// Length of time (in seconds) to wait for players to accept a proposed
  /// match. If any player rejects the match or fails to accept before the
  /// timeout, the ticket continues to look for an acceptable match.
  final int acceptanceTimeoutSeconds;

  /// Flag that determines whether a match that was created with this
  /// configuration must be accepted by the matched players. To require
  /// acceptance, set to TRUE.
  final bool acceptanceRequired;

  /// Unique identifier for a matchmaking rule set to use with this
  /// configuration. A matchmaking configuration can only use rule sets that are
  /// defined in the same region.
  final String ruleSetName;

  /// SNS topic ARN that is set up to receive matchmaking notifications.
  final String notificationTarget;

  /// Number of player slots in a match to keep open for future players. For
  /// example, if the configuration's rule set specifies a match for a single
  /// 12-person team, and the additional player count is set to 2, only 10
  /// players are selected for the match.
  final int additionalPlayerCount;

  /// Information to attach to all events related to the matchmaking
  /// configuration.
  final String customEventData;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Set of custom properties for a game session, formatted as key:value pairs.
  /// These properties are passed to a game server process in the GameSession
  /// object with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  final List<GameProperty> gameProperties;

  /// Set of custom game session properties, formatted as a single string value.
  /// This data is passed to a game server process in the GameSession object
  /// with a request to start a new game session (see
  /// [Start a Game Session](https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession)).
  /// This information is added to the new GameSession object that is created
  /// for a successful match.
  final String gameSessionData;

  /// Method used to backfill game sessions created with this matchmaking
  /// configuration. MANUAL indicates that the game makes backfill requests or
  /// does not use the match backfill feature. AUTOMATIC indicates that GameLift
  /// creates StartMatchBackfill requests whenever a game session has one or
  /// more open slots. Learn more about manual and automatic backfill in
  /// [Backfill Existing Games with FlexMatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-backfill.html).
  final String backfillMode;

  MatchmakingConfiguration({
    this.name,
    this.description,
    this.gameSessionQueueArns,
    this.requestTimeoutSeconds,
    this.acceptanceTimeoutSeconds,
    this.acceptanceRequired,
    this.ruleSetName,
    this.notificationTarget,
    this.additionalPlayerCount,
    this.customEventData,
    this.creationTime,
    this.gameProperties,
    this.gameSessionData,
    this.backfillMode,
  });
  static MatchmakingConfiguration fromJson(Map<String, dynamic> json) =>
      MatchmakingConfiguration(
        name: json.containsKey('Name') ? json['Name'] as String : null,
        description: json.containsKey('Description')
            ? json['Description'] as String
            : null,
        gameSessionQueueArns: json.containsKey('GameSessionQueueArns')
            ? (json['GameSessionQueueArns'] as List)
                .map((e) => e as String)
                .toList()
            : null,
        requestTimeoutSeconds: json.containsKey('RequestTimeoutSeconds')
            ? json['RequestTimeoutSeconds'] as int
            : null,
        acceptanceTimeoutSeconds: json.containsKey('AcceptanceTimeoutSeconds')
            ? json['AcceptanceTimeoutSeconds'] as int
            : null,
        acceptanceRequired: json.containsKey('AcceptanceRequired')
            ? json['AcceptanceRequired'] as bool
            : null,
        ruleSetName: json.containsKey('RuleSetName')
            ? json['RuleSetName'] as String
            : null,
        notificationTarget: json.containsKey('NotificationTarget')
            ? json['NotificationTarget'] as String
            : null,
        additionalPlayerCount: json.containsKey('AdditionalPlayerCount')
            ? json['AdditionalPlayerCount'] as int
            : null,
        customEventData: json.containsKey('CustomEventData')
            ? json['CustomEventData'] as String
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        gameProperties: json.containsKey('GameProperties')
            ? (json['GameProperties'] as List)
                .map((e) => GameProperty.fromJson(e))
                .toList()
            : null,
        gameSessionData: json.containsKey('GameSessionData')
            ? json['GameSessionData'] as String
            : null,
        backfillMode: json.containsKey('BackfillMode')
            ? json['BackfillMode'] as String
            : null,
      );
}

/// Set of rule statements, used with FlexMatch, that determine how to build
/// your player matches. Each rule set describes a type of group to be created
/// and defines the parameters for acceptable player matches. Rule sets are used
/// in MatchmakingConfiguration objects.
///
/// A rule set may define the following elements for a match. For detailed
/// information and examples showing how to construct a rule set, see
/// [Build a FlexMatch Rule Set](https://docs.aws.amazon.com/gamelift/latest/developerguide/match-rulesets.html).
///
/// *   Teams -- Required. A rule set must define one or multiple teams for the
/// match and set minimum and maximum team sizes. For example, a rule set might
/// describe a 4x4 match that requires all eight slots to be filled.
///
/// *   Player attributes -- Optional. These attributes specify a set of player
/// characteristics to evaluate when looking for a match. Matchmaking requests
/// that use a rule set with player attributes must provide the corresponding
/// attribute values. For example, an attribute might specify a player's skill
/// or level.
///
/// *   Rules -- Optional. Rules define how to evaluate potential players for a
/// match based on player attributes. A rule might specify minimum requirements
/// for individual players, teams, or entire matches. For example, a rule might
/// require each player to meet a certain skill level, each team to have at
/// least one player in a certain role, or the match to have a minimum average
/// skill level. or may describe an entire group--such as all teams must be
/// evenly matched or have at least one player in a certain role.
///
/// *   Expansions -- Optional. Expansions allow you to relax the rules after a
/// period of time when no acceptable matches are found. This feature lets you
/// balance getting players into games in a reasonable amount of time instead of
/// making them wait indefinitely for the best possible match. For example, you
/// might use an expansion to increase the maximum skill variance between
/// players after 30 seconds.
class MatchmakingRuleSet {
  /// Unique identifier for a matchmaking rule set
  final String ruleSetName;

  /// Collection of matchmaking rules, formatted as a JSON string. Comments are
  /// not allowed in JSON, but most elements support a description field.
  final String ruleSetBody;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  MatchmakingRuleSet({
    this.ruleSetName,
    @required this.ruleSetBody,
    this.creationTime,
  });
  static MatchmakingRuleSet fromJson(Map<String, dynamic> json) =>
      MatchmakingRuleSet(
        ruleSetName: json.containsKey('RuleSetName')
            ? json['RuleSetName'] as String
            : null,
        ruleSetBody: json['RuleSetBody'] as String,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
      );
}

/// Ticket generated to track the progress of a matchmaking request. Each ticket
/// is uniquely identified by a ticket ID, supplied by the requester, when
/// creating a matchmaking request with StartMatchmaking. Tickets can be
/// retrieved by calling DescribeMatchmaking with the ticket ID.
class MatchmakingTicket {
  /// Unique identifier for a matchmaking ticket.
  final String ticketId;

  /// Name of the MatchmakingConfiguration that is used with this ticket.
  /// Matchmaking configurations determine how players are grouped into a match
  /// and how a new game session is created for the match.
  final String configurationName;

  /// Current status of the matchmaking request.
  ///
  /// *    **QUEUED** -- The matchmaking request has been received and is
  /// currently waiting to be processed.
  ///
  /// *    **SEARCHING** -- The matchmaking request is currently being
  /// processed.
  ///
  /// *    **REQUIRES_ACCEPTANCE** -- A match has been proposed and the players
  /// must accept the match (see AcceptMatch). This status is used only with
  /// requests that use a matchmaking configuration with a player acceptance
  /// requirement.
  ///
  /// *    **PLACING** -- The FlexMatch engine has matched players and is in the
  /// process of placing a new game session for the match.
  ///
  /// *    **COMPLETED** -- Players have been matched and a game session is
  /// ready to host the players. A ticket in this state contains the necessary
  /// connection information for players.
  ///
  /// *    **FAILED** -- The matchmaking request was not completed.
  ///
  /// *    **CANCELLED** -- The matchmaking request was canceled. This may be
  /// the result of a call to StopMatchmaking or a proposed match that one or
  /// more players failed to accept.
  ///
  /// *    **TIMED_OUT** -- The matchmaking request was not successful within
  /// the duration specified in the matchmaking configuration.
  ///
  ///
  ///
  ///
  /// Matchmaking requests that fail to successfully complete (statuses FAILED,
  /// CANCELLED, TIMED_OUT) can be resubmitted as new requests with new ticket
  /// IDs.
  final String status;

  /// Code to explain the current status. For example, a status reason may
  /// indicate when a ticket has returned to `SEARCHING` status after a proposed
  /// match fails to receive player acceptances.
  final String statusReason;

  /// Additional information about the current status.
  final String statusMessage;

  /// Time stamp indicating when this matchmaking request was received. Format
  /// is a number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime startTime;

  /// Time stamp indicating when this matchmaking request stopped being
  /// processed due to success, failure, or cancellation. Format is a number
  /// expressed in Unix time as milliseconds (for example "1469498468.057").
  final DateTime endTime;

  /// A set of `Player` objects, each representing a player to find matches for.
  /// Players are identified by a unique player ID and may include latency data
  /// for use during matchmaking. If the ticket is in status `COMPLETED`, the
  /// `Player` objects include the team the players were assigned to in the
  /// resulting match.
  final List<Player> players;

  /// Identifier and connection information of the game session created for the
  /// match. This information is added to the ticket only after the matchmaking
  /// request has been successfully completed.
  final GameSessionConnectionInfo gameSessionConnectionInfo;

  /// Average amount of time (in seconds) that players are currently waiting for
  /// a match. If there is not enough recent data, this property may be empty.
  final int estimatedWaitTime;

  MatchmakingTicket({
    this.ticketId,
    this.configurationName,
    this.status,
    this.statusReason,
    this.statusMessage,
    this.startTime,
    this.endTime,
    this.players,
    this.gameSessionConnectionInfo,
    this.estimatedWaitTime,
  });
  static MatchmakingTicket fromJson(Map<String, dynamic> json) =>
      MatchmakingTicket(
        ticketId:
            json.containsKey('TicketId') ? json['TicketId'] as String : null,
        configurationName: json.containsKey('ConfigurationName')
            ? json['ConfigurationName'] as String
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        statusReason: json.containsKey('StatusReason')
            ? json['StatusReason'] as String
            : null,
        statusMessage: json.containsKey('StatusMessage')
            ? json['StatusMessage'] as String
            : null,
        startTime: json.containsKey('StartTime')
            ? DateTime.parse(json['StartTime'])
            : null,
        endTime: json.containsKey('EndTime')
            ? DateTime.parse(json['EndTime'])
            : null,
        players: json.containsKey('Players')
            ? (json['Players'] as List).map((e) => Player.fromJson(e)).toList()
            : null,
        gameSessionConnectionInfo: json.containsKey('GameSessionConnectionInfo')
            ? GameSessionConnectionInfo.fromJson(
                json['GameSessionConnectionInfo'])
            : null,
        estimatedWaitTime: json.containsKey('EstimatedWaitTime')
            ? json['EstimatedWaitTime'] as int
            : null,
      );
}

/// Information about a player session that was created as part of a
/// StartGameSessionPlacement request. This object contains only the player ID
/// and player session ID. To retrieve full details on a player session, call
/// DescribePlayerSessions with the player session ID.
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
class PlacedPlayerSession {
  /// Unique identifier for a player that is associated with this player
  /// session.
  final String playerId;

  /// Unique identifier for a player session.
  final String playerSessionId;

  PlacedPlayerSession({
    this.playerId,
    this.playerSessionId,
  });
  static PlacedPlayerSession fromJson(Map<String, dynamic> json) =>
      PlacedPlayerSession(
        playerId:
            json.containsKey('PlayerId') ? json['PlayerId'] as String : null,
        playerSessionId: json.containsKey('PlayerSessionId')
            ? json['PlayerSessionId'] as String
            : null,
      );
}

/// Represents a player in matchmaking. When starting a matchmaking request, a
/// player has a player ID, attributes, and may have latency data. Team
/// information is added after a match has been successfully completed.
class Player {
  /// Unique identifier for a player
  final String playerId;

  /// Collection of key:value pairs containing player information for use in
  /// matchmaking. Player attribute keys must match the _playerAttributes_ used
  /// in a matchmaking rule set. Example: `"PlayerAttributes": {"skill": {"N":
  /// "23"}, "gameMode": {"S": "deathmatch"}}`.
  final Map<String, AttributeValue> playerAttributes;

  /// Name of the team that the player is assigned to in a match. Team names are
  /// defined in a matchmaking rule set.
  final String team;

  /// Set of values, expressed in milliseconds, indicating the amount of latency
  /// that a player experiences when connected to AWS regions. If this property
  /// is present, FlexMatch considers placing the match only in regions for
  /// which latency is reported.
  ///
  /// If a matchmaker has a rule that evaluates player latency, players must
  /// report latency in order to be matched. If no latency is reported in this
  /// scenario, FlexMatch assumes that no regions are available to the player
  /// and the ticket is not matchable.
  final Map<String, int> latencyInMs;

  Player({
    this.playerId,
    this.playerAttributes,
    this.team,
    this.latencyInMs,
  });
  static Player fromJson(Map<String, dynamic> json) => Player(
        playerId:
            json.containsKey('PlayerId') ? json['PlayerId'] as String : null,
        playerAttributes: json.containsKey('PlayerAttributes')
            ? (json['PlayerAttributes'] as Map).map(
                (k, v) => MapEntry(k as String, AttributeValue.fromJson(v)))
            : null,
        team: json.containsKey('Team') ? json['Team'] as String : null,
        latencyInMs: json.containsKey('LatencyInMs')
            ? (json['LatencyInMs'] as Map)
                .map((k, v) => MapEntry(k as String, v as int))
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Regional latency information for a player, used when requesting a new game
/// session with StartGameSessionPlacement. This value indicates the amount of
/// time lag that exists when the player is connected to a fleet in the
/// specified region. The relative difference between a player's latency values
/// for multiple regions are used to determine which fleets are best suited to
/// place a new game session for the player.
class PlayerLatency {
  /// Unique identifier for a player associated with the latency data.
  final String playerId;

  /// Name of the region that is associated with the latency value.
  final String regionIdentifier;

  /// Amount of time that represents the time lag experienced by the player when
  /// connected to the specified region.
  final double latencyInMilliseconds;

  PlayerLatency({
    this.playerId,
    this.regionIdentifier,
    this.latencyInMilliseconds,
  });
  static PlayerLatency fromJson(Map<String, dynamic> json) => PlayerLatency(
        playerId:
            json.containsKey('PlayerId') ? json['PlayerId'] as String : null,
        regionIdentifier: json.containsKey('RegionIdentifier')
            ? json['RegionIdentifier'] as String
            : null,
        latencyInMilliseconds: json.containsKey('LatencyInMilliseconds')
            ? json['LatencyInMilliseconds'] as double
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Queue setting that determines the highest latency allowed for individual
/// players when placing a game session. When a latency policy is in force, a
/// game session cannot be placed at any destination in a region where a player
/// is reporting latency higher than the cap. Latency policies are only enforced
/// when the placement request contains player latency information.
///
/// *    CreateGameSessionQueue
///
/// *    DescribeGameSessionQueues
///
/// *    UpdateGameSessionQueue
///
/// *    DeleteGameSessionQueue
class PlayerLatencyPolicy {
  /// The maximum latency value that is allowed for any player, in milliseconds.
  /// All policies must have a value set for this property.
  final int maximumIndividualPlayerLatencyMilliseconds;

  /// The length of time, in seconds, that the policy is enforced while placing
  /// a new game session. A null value for this property means that the policy
  /// is enforced until the queue times out.
  final int policyDurationSeconds;

  PlayerLatencyPolicy({
    this.maximumIndividualPlayerLatencyMilliseconds,
    this.policyDurationSeconds,
  });
  static PlayerLatencyPolicy fromJson(Map<String, dynamic> json) =>
      PlayerLatencyPolicy(
        maximumIndividualPlayerLatencyMilliseconds:
            json.containsKey('MaximumIndividualPlayerLatencyMilliseconds')
                ? json['MaximumIndividualPlayerLatencyMilliseconds'] as int
                : null,
        policyDurationSeconds: json.containsKey('PolicyDurationSeconds')
            ? json['PolicyDurationSeconds'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Properties describing a player session. Player session objects are created
/// either by creating a player session for a specific game session, or as part
/// of a game session placement. A player session represents either a player
/// reservation for a game session (status `RESERVED`) or actual player activity
/// in a game session (status `ACTIVE`). A player session object (including
/// player data) is automatically passed to a game session when the player
/// connects to the game session and is validated.
///
/// When a player disconnects, the player session status changes to `COMPLETED`.
/// Once the session ends, the player session object is retained for 30 days and
/// then removed.
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
class PlayerSession {
  /// Unique identifier for a player session.
  final String playerSessionId;

  /// Unique identifier for a player that is associated with this player
  /// session.
  final String playerId;

  /// Unique identifier for the game session that the player session is
  /// connected to.
  final String gameSessionId;

  /// Unique identifier for a fleet that the player's game session is running
  /// on.
  final String fleetId;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Time stamp indicating when this data object was terminated. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime terminationTime;

  /// Current status of the player session.
  ///
  /// Possible player session statuses include the following:
  ///
  /// *    **RESERVED** -- The player session request has been received, but the
  /// player has not yet connected to the server process and/or been validated.
  ///
  /// *    **ACTIVE** -- The player has been validated by the server process and
  /// is currently connected.
  ///
  /// *    **COMPLETED** -- The player connection has been dropped.
  ///
  /// *    **TIMEDOUT** -- A player session request was received, but the player
  /// did not connect and/or was not validated within the timeout limit (60
  /// seconds).
  final String status;

  /// IP address of the game session. To connect to a Amazon GameLift game
  /// server, an app needs both the IP address and port number.
  final String ipAddress;

  final String dnsName;

  /// Port number for the game session. To connect to a Amazon GameLift server
  /// process, an app needs both the IP address and port number.
  final int port;

  /// Developer-defined information related to a player. Amazon GameLift does
  /// not use this data, so it can be formatted as needed for use in the game.
  final String playerData;

  PlayerSession({
    this.playerSessionId,
    this.playerId,
    this.gameSessionId,
    this.fleetId,
    this.creationTime,
    this.terminationTime,
    this.status,
    this.ipAddress,
    this.dnsName,
    this.port,
    this.playerData,
  });
  static PlayerSession fromJson(Map<String, dynamic> json) => PlayerSession(
        playerSessionId: json.containsKey('PlayerSessionId')
            ? json['PlayerSessionId'] as String
            : null,
        playerId:
            json.containsKey('PlayerId') ? json['PlayerId'] as String : null,
        gameSessionId: json.containsKey('GameSessionId')
            ? json['GameSessionId'] as String
            : null,
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        terminationTime: json.containsKey('TerminationTime')
            ? DateTime.parse(json['TerminationTime'])
            : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        ipAddress:
            json.containsKey('IpAddress') ? json['IpAddress'] as String : null,
        dnsName: json.containsKey('DnsName') ? json['DnsName'] as String : null,
        port: json.containsKey('Port') ? json['Port'] as int : null,
        playerData: json.containsKey('PlayerData')
            ? json['PlayerData'] as String
            : null,
      );
}

/// Represents the returned data in response to a request action.
class PutScalingPolicyOutput {
  /// Descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique.
  final String name;

  PutScalingPolicyOutput({
    this.name,
  });
  static PutScalingPolicyOutput fromJson(Map<String, dynamic> json) =>
      PutScalingPolicyOutput(
        name: json.containsKey('Name') ? json['Name'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class RequestUploadCredentialsOutput {
  /// AWS credentials required when uploading a game build to the storage
  /// location. These credentials have a limited lifespan and are valid only for
  /// the build they were issued for.
  final AwsCredentials uploadCredentials;

  /// Amazon S3 path and key, identifying where the game build files are stored.
  final S3Location storageLocation;

  RequestUploadCredentialsOutput({
    this.uploadCredentials,
    this.storageLocation,
  });
  static RequestUploadCredentialsOutput fromJson(Map<String, dynamic> json) =>
      RequestUploadCredentialsOutput(
        uploadCredentials: json.containsKey('UploadCredentials')
            ? AwsCredentials.fromJson(json['UploadCredentials'])
            : null,
        storageLocation: json.containsKey('StorageLocation')
            ? S3Location.fromJson(json['StorageLocation'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class ResolveAliasOutput {
  /// Fleet identifier that is associated with the requested alias.
  final String fleetId;

  ResolveAliasOutput({
    this.fleetId,
  });
  static ResolveAliasOutput fromJson(Map<String, dynamic> json) =>
      ResolveAliasOutput(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
      );
}

/// Policy that limits the number of game sessions a player can create on the
/// same fleet. This optional policy gives game owners control over how players
/// can consume available game server resources. A resource creation policy
/// makes the following statement: "An individual player can create a maximum
/// number of new game sessions within a specified time period".
///
/// The policy is evaluated when a player tries to create a new game session.
/// For example, with a policy of 10 new game sessions and a time period of 60
/// minutes, on receiving a `CreateGameSession` request, Amazon GameLift checks
/// that the player (identified by `CreatorId`) has created fewer than 10 game
/// sessions in the past 60 minutes.
class ResourceCreationLimitPolicy {
  /// Maximum number of game sessions that an individual can create during the
  /// policy period.
  final int newGameSessionsPerCreator;

  /// Time span used in evaluating the resource creation limit policy.
  final int policyPeriodInMinutes;

  ResourceCreationLimitPolicy({
    this.newGameSessionsPerCreator,
    this.policyPeriodInMinutes,
  });
  static ResourceCreationLimitPolicy fromJson(Map<String, dynamic> json) =>
      ResourceCreationLimitPolicy(
        newGameSessionsPerCreator: json.containsKey('NewGameSessionsPerCreator')
            ? json['NewGameSessionsPerCreator'] as int
            : null,
        policyPeriodInMinutes: json.containsKey('PolicyPeriodInMinutes')
            ? json['PolicyPeriodInMinutes'] as int
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Routing configuration for a fleet alias.
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
class RoutingStrategy {
  /// Type of routing strategy.
  ///
  /// Possible routing types include the following:
  ///
  /// *    **SIMPLE** -- The alias resolves to one specific fleet. Use this type
  /// when routing to active fleets.
  ///
  /// *    **TERMINAL** -- The alias does not resolve to a fleet but instead can
  /// be used to display a message to the user. A terminal alias throws a
  /// TerminalRoutingStrategyException with the RoutingStrategy message
  /// embedded.
  final String type;

  /// Unique identifier for a fleet that the alias points to.
  final String fleetId;

  /// Message text to be used with a terminal routing strategy.
  final String message;

  RoutingStrategy({
    this.type,
    this.fleetId,
    this.message,
  });
  static RoutingStrategy fromJson(Map<String, dynamic> json) => RoutingStrategy(
        type: json.containsKey('Type') ? json['Type'] as String : null,
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// A collection of server process configurations that describe what processes
/// to run on each instance in a fleet. Server processes run either a custom
/// game build executable or a Realtime Servers script. Each instance in the
/// fleet starts the specified server processes and continues to start new
/// processes as existing processes end. An instance regularly checks for an
/// updated run-time configuration.
///
/// The run-time configuration enables the instances in a fleet to run multiple
/// processes simultaneously. Learn more about
/// [Running Multiple Processes on a Fleet](https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html)
/// .
///
/// A Amazon GameLift instance is limited to 50 processes running
/// simultaneously. To calculate the total number of processes in a run-time
/// configuration, add the values of the `ConcurrentExecutions` parameter for
/// each ServerProcess object.
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
class RuntimeConfiguration {
  /// Collection of server process configurations that describe which server
  /// processes to run on each instance in a fleet.
  final List<ServerProcess> serverProcesses;

  /// Maximum number of game sessions with status `ACTIVATING` to allow on an
  /// instance simultaneously. This setting limits the amount of instance
  /// resources that can be used for new game activations at any one time.
  final int maxConcurrentGameSessionActivations;

  /// Maximum amount of time (in seconds) that a game session can remain in
  /// status `ACTIVATING`. If the game session is not active before the timeout,
  /// activation is terminated and the game session status is changed to
  /// `TERMINATED`.
  final int gameSessionActivationTimeoutSeconds;

  RuntimeConfiguration({
    this.serverProcesses,
    this.maxConcurrentGameSessionActivations,
    this.gameSessionActivationTimeoutSeconds,
  });
  static RuntimeConfiguration fromJson(Map<String, dynamic> json) =>
      RuntimeConfiguration(
        serverProcesses: json.containsKey('ServerProcesses')
            ? (json['ServerProcesses'] as List)
                .map((e) => ServerProcess.fromJson(e))
                .toList()
            : null,
        maxConcurrentGameSessionActivations:
            json.containsKey('MaxConcurrentGameSessionActivations')
                ? json['MaxConcurrentGameSessionActivations'] as int
                : null,
        gameSessionActivationTimeoutSeconds:
            json.containsKey('GameSessionActivationTimeoutSeconds')
                ? json['GameSessionActivationTimeoutSeconds'] as int
                : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Location in Amazon Simple Storage Service (Amazon S3) where build or script
/// files are stored for access by Amazon GameLift. This location is specified
/// in CreateBuild, CreateScript, and UpdateScript requests.
class S3Location {
  /// Amazon S3 bucket identifier. This is the name of the S3 bucket.
  final String bucket;

  /// Name of the zip file containing the build files or script files.
  final String key;

  /// Amazon Resource Name
  /// ([ARN](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html))
  /// for an IAM role that allows Amazon GameLift to access the S3 bucket.
  final String roleArn;

  /// Version of the file, if object versioning is turned on for the bucket.
  /// Amazon GameLift uses this information when retrieving files from an S3
  /// bucket that you own. Use this parameter to specify a specific version of
  /// the file; if not set, the latest version of the file is retrieved.
  final String objectVersion;

  S3Location({
    this.bucket,
    this.key,
    this.roleArn,
    this.objectVersion,
  });
  static S3Location fromJson(Map<String, dynamic> json) => S3Location(
        bucket: json.containsKey('Bucket') ? json['Bucket'] as String : null,
        key: json.containsKey('Key') ? json['Key'] as String : null,
        roleArn: json.containsKey('RoleArn') ? json['RoleArn'] as String : null,
        objectVersion: json.containsKey('ObjectVersion')
            ? json['ObjectVersion'] as String
            : null,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Rule that controls how a fleet is scaled. Scaling policies are uniquely
/// identified by the combination of name and fleet ID.
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
class ScalingPolicy {
  /// Unique identifier for a fleet that is associated with this scaling policy.
  final String fleetId;

  /// Descriptive label that is associated with a scaling policy. Policy names
  /// do not need to be unique.
  final String name;

  /// Current status of the scaling policy. The scaling policy can be in force
  /// only when in an `ACTIVE` status. Scaling policies can be suspended for
  /// individual fleets (see StopFleetActions; if suspended for a fleet, the
  /// policy status does not change. View a fleet's stopped actions by calling
  /// DescribeFleetCapacity.
  ///
  /// *    **ACTIVE** -- The scaling policy can be used for auto-scaling a
  /// fleet.
  ///
  /// *    **UPDATE_REQUESTED** -- A request to update the scaling policy has
  /// been received.
  ///
  /// *    **UPDATING** -- A change is being made to the scaling policy.
  ///
  /// *    **DELETE_REQUESTED** -- A request to delete the scaling policy has
  /// been received.
  ///
  /// *    **DELETING** -- The scaling policy is being deleted.
  ///
  /// *    **DELETED** -- The scaling policy has been deleted.
  ///
  /// *    **ERROR** -- An error occurred in creating the policy. It should be
  /// removed and recreated.
  final String status;

  /// Amount of adjustment to make, based on the scaling adjustment type.
  final int scalingAdjustment;

  /// Type of adjustment to make to a fleet's instance count (see
  /// FleetCapacity):
  ///
  /// *    **ChangeInCapacity** -- add (or subtract) the scaling adjustment
  /// value from the current instance count. Positive values scale up while
  /// negative values scale down.
  ///
  /// *    **ExactCapacity** -- set the instance count to the scaling adjustment
  /// value.
  ///
  /// *    **PercentChangeInCapacity** -- increase or reduce the current
  /// instance count by the scaling adjustment, read as a percentage. Positive
  /// values scale up while negative values scale down.
  final String scalingAdjustmentType;

  /// Comparison operator to use when measuring a metric against the threshold
  /// value.
  final String comparisonOperator;

  /// Metric value used to trigger a scaling event.
  final double threshold;

  /// Length of time (in minutes) the metric must be at or beyond the threshold
  /// before a scaling event is triggered.
  final int evaluationPeriods;

  /// Name of the Amazon GameLift-defined metric that is used to trigger a
  /// scaling adjustment. For detailed descriptions of fleet metrics, see
  /// [Monitor Amazon GameLift with Amazon CloudWatch](https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html).
  ///
  /// *    **ActivatingGameSessions** -- Game sessions in the process of being
  /// created.
  ///
  /// *    **ActiveGameSessions** -- Game sessions that are currently running.
  ///
  /// *    **ActiveInstances** -- Fleet instances that are currently running at
  /// least one game session.
  ///
  /// *    **AvailableGameSessions** -- Additional game sessions that fleet
  /// could host simultaneously, given current capacity.
  ///
  /// *    **AvailablePlayerSessions** -- Empty player slots in currently active
  /// game sessions. This includes game sessions that are not currently
  /// accepting players. Reserved player slots are not included.
  ///
  /// *    **CurrentPlayerSessions** -- Player slots in active game sessions
  /// that are being used by a player or are reserved for a player.
  ///
  /// *    **IdleInstances** -- Active instances that are currently hosting zero
  /// game sessions.
  ///
  /// *    **PercentAvailableGameSessions** -- Unused percentage of the total
  /// number of game sessions that a fleet could host simultaneously, given
  /// current capacity. Use this metric for a target-based scaling policy.
  ///
  /// *    **PercentIdleInstances** -- Percentage of the total number of active
  /// instances that are hosting zero game sessions.
  ///
  /// *    **QueueDepth** -- Pending game session placement requests, in any
  /// queue, where the current fleet is the top-priority destination.
  ///
  /// *    **WaitTime** -- Current wait time for pending game session placement
  /// requests, in any queue, where the current fleet is the top-priority
  /// destination.
  final String metricName;

  /// Type of scaling policy to create. For a target-based policy, set the
  /// parameter _MetricName_ to 'PercentAvailableGameSessions' and specify a
  /// _TargetConfiguration_. For a rule-based policy set the following
  /// parameters: _MetricName_, _ComparisonOperator_, _Threshold_,
  /// _EvaluationPeriods_, _ScalingAdjustmentType_, and _ScalingAdjustment_.
  final String policyType;

  /// Object that contains settings for a target-based scaling policy.
  final TargetConfiguration targetConfiguration;

  ScalingPolicy({
    this.fleetId,
    this.name,
    this.status,
    this.scalingAdjustment,
    this.scalingAdjustmentType,
    this.comparisonOperator,
    this.threshold,
    this.evaluationPeriods,
    this.metricName,
    this.policyType,
    this.targetConfiguration,
  });
  static ScalingPolicy fromJson(Map<String, dynamic> json) => ScalingPolicy(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        status: json.containsKey('Status') ? json['Status'] as String : null,
        scalingAdjustment: json.containsKey('ScalingAdjustment')
            ? json['ScalingAdjustment'] as int
            : null,
        scalingAdjustmentType: json.containsKey('ScalingAdjustmentType')
            ? json['ScalingAdjustmentType'] as String
            : null,
        comparisonOperator: json.containsKey('ComparisonOperator')
            ? json['ComparisonOperator'] as String
            : null,
        threshold:
            json.containsKey('Threshold') ? json['Threshold'] as double : null,
        evaluationPeriods: json.containsKey('EvaluationPeriods')
            ? json['EvaluationPeriods'] as int
            : null,
        metricName: json.containsKey('MetricName')
            ? json['MetricName'] as String
            : null,
        policyType: json.containsKey('PolicyType')
            ? json['PolicyType'] as String
            : null,
        targetConfiguration: json.containsKey('TargetConfiguration')
            ? TargetConfiguration.fromJson(json['TargetConfiguration'])
            : null,
      );
}

/// Properties describing a Realtime script.
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
class Script {
  /// Unique identifier for a Realtime script
  final String scriptId;

  /// Descriptive label that is associated with a script. Script names do not
  /// need to be unique.
  final String name;

  /// Version that is associated with a build or script. Version strings do not
  /// need to be unique.
  final String version;

  /// File size of the uploaded Realtime script, expressed in bytes. When files
  /// are uploaded from an S3 location, this value remains at "0".
  final BigInt sizeOnDisk;

  /// Time stamp indicating when this data object was created. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  final S3Location storageLocation;

  Script({
    this.scriptId,
    this.name,
    this.version,
    this.sizeOnDisk,
    this.creationTime,
    this.storageLocation,
  });
  static Script fromJson(Map<String, dynamic> json) => Script(
        scriptId:
            json.containsKey('ScriptId') ? json['ScriptId'] as String : null,
        name: json.containsKey('Name') ? json['Name'] as String : null,
        version: json.containsKey('Version') ? json['Version'] as String : null,
        sizeOnDisk: json.containsKey('SizeOnDisk')
            ? BigInt.from(json['SizeOnDisk'])
            : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        storageLocation: json.containsKey('StorageLocation')
            ? S3Location.fromJson(json['StorageLocation'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class SearchGameSessionsOutput {
  /// Collection of objects containing game session properties for each session
  /// matching the request.
  final List<GameSession> gameSessions;

  /// Token that indicates where to resume retrieving results on the next call
  /// to this action. If no token is returned, these results represent the end
  /// of the list.
  final String nextToken;

  SearchGameSessionsOutput({
    this.gameSessions,
    this.nextToken,
  });
  static SearchGameSessionsOutput fromJson(Map<String, dynamic> json) =>
      SearchGameSessionsOutput(
        gameSessions: json.containsKey('GameSessions')
            ? (json['GameSessions'] as List)
                .map((e) => GameSession.fromJson(e))
                .toList()
            : null,
        nextToken:
            json.containsKey('NextToken') ? json['NextToken'] as String : null,
      );
}

/// A set of instructions for launching server processes on each instance in a
/// fleet. Server processes run either a custom game build executable or a
/// Realtime Servers script. Each instruction set identifies the location of the
/// custom game build executable or Realtime launch script, optional launch
/// parameters, and the number of server processes with this configuration to
/// maintain concurrently on the instance. Server process configurations make up
/// a fleet's  `RuntimeConfiguration` .
class ServerProcess {
  /// Location of the server executable in a custom game build or the name of
  /// the Realtime script file that contains the `Init()` function. Game builds
  /// and Realtime scripts are installed on instances at the root:
  ///
  /// *   Windows (for custom game builds only): `C:game`. Example:
  /// "`C:gameMyGameserver.exe`"
  ///
  /// *   Linux: `/local/game`. Examples: "`/local/game/MyGame/server.exe`" or
  /// "`/local/game/MyRealtimeScript.js`"
  final String launchPath;

  /// Optional list of parameters to pass to the server executable or Realtime
  /// script on launch.
  final String parameters;

  /// Number of server processes using this configuration to run concurrently on
  /// an instance.
  final int concurrentExecutions;

  ServerProcess({
    @required this.launchPath,
    this.parameters,
    @required this.concurrentExecutions,
  });
  static ServerProcess fromJson(Map<String, dynamic> json) => ServerProcess(
        launchPath: json['LaunchPath'] as String,
        parameters: json.containsKey('Parameters')
            ? json['Parameters'] as String
            : null,
        concurrentExecutions: json['ConcurrentExecutions'] as int,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

class StartFleetActionsOutput {
  StartFleetActionsOutput();
  static StartFleetActionsOutput fromJson(Map<String, dynamic> json) =>
      StartFleetActionsOutput();
}

/// Represents the returned data in response to a request action.
class StartGameSessionPlacementOutput {
  /// Object that describes the newly created game session placement. This
  /// object includes all the information provided in the request, as well as
  /// start/end time stamps and placement status.
  final GameSessionPlacement gameSessionPlacement;

  StartGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  static StartGameSessionPlacementOutput fromJson(Map<String, dynamic> json) =>
      StartGameSessionPlacementOutput(
        gameSessionPlacement: json.containsKey('GameSessionPlacement')
            ? GameSessionPlacement.fromJson(json['GameSessionPlacement'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class StartMatchBackfillOutput {
  /// Ticket representing the backfill matchmaking request. This object includes
  /// the information in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  final MatchmakingTicket matchmakingTicket;

  StartMatchBackfillOutput({
    this.matchmakingTicket,
  });
  static StartMatchBackfillOutput fromJson(Map<String, dynamic> json) =>
      StartMatchBackfillOutput(
        matchmakingTicket: json.containsKey('MatchmakingTicket')
            ? MatchmakingTicket.fromJson(json['MatchmakingTicket'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class StartMatchmakingOutput {
  /// Ticket representing the matchmaking request. This object include the
  /// information included in the request, ticket status, and match results as
  /// generated during the matchmaking process.
  final MatchmakingTicket matchmakingTicket;

  StartMatchmakingOutput({
    this.matchmakingTicket,
  });
  static StartMatchmakingOutput fromJson(Map<String, dynamic> json) =>
      StartMatchmakingOutput(
        matchmakingTicket: json.containsKey('MatchmakingTicket')
            ? MatchmakingTicket.fromJson(json['MatchmakingTicket'])
            : null,
      );
}

class StopFleetActionsOutput {
  StopFleetActionsOutput();
  static StopFleetActionsOutput fromJson(Map<String, dynamic> json) =>
      StopFleetActionsOutput();
}

/// Represents the returned data in response to a request action.
class StopGameSessionPlacementOutput {
  /// Object that describes the canceled game session placement, with
  /// `CANCELLED` status and an end time stamp.
  final GameSessionPlacement gameSessionPlacement;

  StopGameSessionPlacementOutput({
    this.gameSessionPlacement,
  });
  static StopGameSessionPlacementOutput fromJson(Map<String, dynamic> json) =>
      StopGameSessionPlacementOutput(
        gameSessionPlacement: json.containsKey('GameSessionPlacement')
            ? GameSessionPlacement.fromJson(json['GameSessionPlacement'])
            : null,
      );
}

class StopMatchmakingOutput {
  StopMatchmakingOutput();
  static StopMatchmakingOutput fromJson(Map<String, dynamic> json) =>
      StopMatchmakingOutput();
}

/// Settings for a target-based scaling policy (see ScalingPolicy. A
/// target-based policy tracks a particular fleet metric specifies a target
/// value for the metric. As player usage changes, the policy triggers Amazon
/// GameLift to adjust capacity so that the metric returns to the target value.
/// The target configuration specifies settings as needed for the target based
/// policy, including the target value.
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
class TargetConfiguration {
  /// Desired value to use with a target-based scaling policy. The value must be
  /// relevant for whatever metric the scaling policy is using. For example, in
  /// a policy using the metric PercentAvailableGameSessions, the target value
  /// should be the preferred size of the fleet's buffer (the percent of
  /// capacity that should be idle and ready for new game sessions).
  final double targetValue;

  TargetConfiguration({
    @required this.targetValue,
  });
  static TargetConfiguration fromJson(Map<String, dynamic> json) =>
      TargetConfiguration(
        targetValue: json['TargetValue'] as double,
      );
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

/// Represents the returned data in response to a request action.
class UpdateAliasOutput {
  /// Object that contains the updated alias configuration.
  final Alias alias;

  UpdateAliasOutput({
    this.alias,
  });
  static UpdateAliasOutput fromJson(Map<String, dynamic> json) =>
      UpdateAliasOutput(
        alias: json.containsKey('Alias') ? Alias.fromJson(json['Alias']) : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateBuildOutput {
  /// Object that contains the updated build record.
  final Build build;

  UpdateBuildOutput({
    this.build,
  });
  static UpdateBuildOutput fromJson(Map<String, dynamic> json) =>
      UpdateBuildOutput(
        build: json.containsKey('Build') ? Build.fromJson(json['Build']) : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateFleetAttributesOutput {
  /// Unique identifier for a fleet that was updated.
  final String fleetId;

  UpdateFleetAttributesOutput({
    this.fleetId,
  });
  static UpdateFleetAttributesOutput fromJson(Map<String, dynamic> json) =>
      UpdateFleetAttributesOutput(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateFleetCapacityOutput {
  /// Unique identifier for a fleet that was updated.
  final String fleetId;

  UpdateFleetCapacityOutput({
    this.fleetId,
  });
  static UpdateFleetCapacityOutput fromJson(Map<String, dynamic> json) =>
      UpdateFleetCapacityOutput(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateFleetPortSettingsOutput {
  /// Unique identifier for a fleet that was updated.
  final String fleetId;

  UpdateFleetPortSettingsOutput({
    this.fleetId,
  });
  static UpdateFleetPortSettingsOutput fromJson(Map<String, dynamic> json) =>
      UpdateFleetPortSettingsOutput(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateGameSessionOutput {
  /// Object that contains the updated game session metadata.
  final GameSession gameSession;

  UpdateGameSessionOutput({
    this.gameSession,
  });
  static UpdateGameSessionOutput fromJson(Map<String, dynamic> json) =>
      UpdateGameSessionOutput(
        gameSession: json.containsKey('GameSession')
            ? GameSession.fromJson(json['GameSession'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateGameSessionQueueOutput {
  /// Object that describes the newly updated game session queue.
  final GameSessionQueue gameSessionQueue;

  UpdateGameSessionQueueOutput({
    this.gameSessionQueue,
  });
  static UpdateGameSessionQueueOutput fromJson(Map<String, dynamic> json) =>
      UpdateGameSessionQueueOutput(
        gameSessionQueue: json.containsKey('GameSessionQueue')
            ? GameSessionQueue.fromJson(json['GameSessionQueue'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateMatchmakingConfigurationOutput {
  /// Object that describes the updated matchmaking configuration.
  final MatchmakingConfiguration configuration;

  UpdateMatchmakingConfigurationOutput({
    this.configuration,
  });
  static UpdateMatchmakingConfigurationOutput fromJson(
          Map<String, dynamic> json) =>
      UpdateMatchmakingConfigurationOutput(
        configuration: json.containsKey('Configuration')
            ? MatchmakingConfiguration.fromJson(json['Configuration'])
            : null,
      );
}

/// Represents the returned data in response to a request action.
class UpdateRuntimeConfigurationOutput {
  /// The run-time configuration currently in force. If the update was
  /// successful, this object matches the one in the request.
  final RuntimeConfiguration runtimeConfiguration;

  UpdateRuntimeConfigurationOutput({
    this.runtimeConfiguration,
  });
  static UpdateRuntimeConfigurationOutput fromJson(Map<String, dynamic> json) =>
      UpdateRuntimeConfigurationOutput(
        runtimeConfiguration: json.containsKey('RuntimeConfiguration')
            ? RuntimeConfiguration.fromJson(json['RuntimeConfiguration'])
            : null,
      );
}

class UpdateScriptOutput {
  /// The newly created script record with a unique script ID. The new script's
  /// storage location reflects an Amazon S3 location: (1) If the script was
  /// uploaded from an S3 bucket under your account, the storage location
  /// reflects the information that was provided in the _CreateScript_ request;
  /// (2) If the script file was uploaded from a local zip file, the storage
  /// location reflects an S3 location controls by the Amazon GameLift service.
  final Script script;

  UpdateScriptOutput({
    this.script,
  });
  static UpdateScriptOutput fromJson(Map<String, dynamic> json) =>
      UpdateScriptOutput(
        script:
            json.containsKey('Script') ? Script.fromJson(json['Script']) : null,
      );
}

/// Represents the returned data in response to a request action.
class ValidateMatchmakingRuleSetOutput {
  /// Response indicating whether the rule set is valid.
  final bool valid;

  ValidateMatchmakingRuleSetOutput({
    this.valid,
  });
  static ValidateMatchmakingRuleSetOutput fromJson(Map<String, dynamic> json) =>
      ValidateMatchmakingRuleSetOutput(
        valid: json.containsKey('Valid') ? json['Valid'] as bool : null,
      );
}

/// Represents an authorization for a VPC peering connection between the VPC for
/// an Amazon GameLift fleet and another VPC on an account you have access to.
/// This authorization must exist and be valid for the peering connection to be
/// established. Authorizations are valid for 24 hours after they are issued.
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
class VpcPeeringAuthorization {
  /// Unique identifier for the AWS account that you use to manage your Amazon
  /// GameLift fleet. You can find your Account ID in the AWS Management Console
  /// under account settings.
  final String gameLiftAwsAccountId;

  final String peerVpcAwsAccountId;

  /// Unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same region where your fleet is
  /// deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  final String peerVpcId;

  /// Time stamp indicating when this authorization was issued. Format is a
  /// number expressed in Unix time as milliseconds (for example
  /// "1469498468.057").
  final DateTime creationTime;

  /// Time stamp indicating when this authorization expires (24 hours after
  /// issuance). Format is a number expressed in Unix time as milliseconds (for
  /// example "1469498468.057").
  final DateTime expirationTime;

  VpcPeeringAuthorization({
    this.gameLiftAwsAccountId,
    this.peerVpcAwsAccountId,
    this.peerVpcId,
    this.creationTime,
    this.expirationTime,
  });
  static VpcPeeringAuthorization fromJson(Map<String, dynamic> json) =>
      VpcPeeringAuthorization(
        gameLiftAwsAccountId: json.containsKey('GameLiftAwsAccountId')
            ? json['GameLiftAwsAccountId'] as String
            : null,
        peerVpcAwsAccountId: json.containsKey('PeerVpcAwsAccountId')
            ? json['PeerVpcAwsAccountId'] as String
            : null,
        peerVpcId:
            json.containsKey('PeerVpcId') ? json['PeerVpcId'] as String : null,
        creationTime: json.containsKey('CreationTime')
            ? DateTime.parse(json['CreationTime'])
            : null,
        expirationTime: json.containsKey('ExpirationTime')
            ? DateTime.parse(json['ExpirationTime'])
            : null,
      );
}

/// Represents a peering connection between a VPC on one of your AWS accounts
/// and the VPC for your Amazon GameLift fleets. This record may be for an
/// active peering connection or a pending connection that has not yet been
/// established.
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
class VpcPeeringConnection {
  /// Unique identifier for a fleet. This ID determines the ID of the Amazon
  /// GameLift VPC for your fleet.
  final String fleetId;

  /// CIDR block of IPv4 addresses assigned to the VPC peering connection for
  /// the GameLift VPC. The peered VPC also has an IPv4 CIDR block associated
  /// with it; these blocks cannot overlap or the peering connection cannot be
  /// created.
  final String ipV4CidrBlock;

  /// Unique identifier that is automatically assigned to the connection record.
  /// This ID is referenced in VPC peering connection events, and is used when
  /// deleting a connection with DeleteVpcPeeringConnection.
  final String vpcPeeringConnectionId;

  /// Object that contains status information about the connection. Status
  /// indicates if a connection is pending, successful, or failed.
  final VpcPeeringConnectionStatus status;

  /// Unique identifier for a VPC with resources to be accessed by your Amazon
  /// GameLift fleet. The VPC must be in the same region where your fleet is
  /// deployed. Look up a VPC ID using the
  /// [VPC Dashboard](https://console.aws.amazon.com/vpc/) in the AWS Management
  /// Console. Learn more about VPC peering in
  /// [VPC Peering with Amazon GameLift Fleets](https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html).
  final String peerVpcId;

  /// Unique identifier for the VPC that contains the Amazon GameLift fleet for
  /// this connection. This VPC is managed by Amazon GameLift and does not
  /// appear in your AWS account.
  final String gameLiftVpcId;

  VpcPeeringConnection({
    this.fleetId,
    this.ipV4CidrBlock,
    this.vpcPeeringConnectionId,
    this.status,
    this.peerVpcId,
    this.gameLiftVpcId,
  });
  static VpcPeeringConnection fromJson(Map<String, dynamic> json) =>
      VpcPeeringConnection(
        fleetId: json.containsKey('FleetId') ? json['FleetId'] as String : null,
        ipV4CidrBlock: json.containsKey('IpV4CidrBlock')
            ? json['IpV4CidrBlock'] as String
            : null,
        vpcPeeringConnectionId: json.containsKey('VpcPeeringConnectionId')
            ? json['VpcPeeringConnectionId'] as String
            : null,
        status: json.containsKey('Status')
            ? VpcPeeringConnectionStatus.fromJson(json['Status'])
            : null,
        peerVpcId:
            json.containsKey('PeerVpcId') ? json['PeerVpcId'] as String : null,
        gameLiftVpcId: json.containsKey('GameLiftVpcId')
            ? json['GameLiftVpcId'] as String
            : null,
      );
}

/// Represents status information for a VPC peering connection. Status is
/// associated with a VpcPeeringConnection object. Status codes and messages are
/// provided from EC2 (see
/// [VpcPeeringConnectionStateReason](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_VpcPeeringConnectionStateReason.html)).
/// Connection status information is also communicated as a fleet Event.
class VpcPeeringConnectionStatus {
  /// Code indicating the status of a VPC peering connection.
  final String code;

  /// Additional messaging associated with the connection status.
  final String message;

  VpcPeeringConnectionStatus({
    this.code,
    this.message,
  });
  static VpcPeeringConnectionStatus fromJson(Map<String, dynamic> json) =>
      VpcPeeringConnectionStatus(
        code: json.containsKey('Code') ? json['Code'] as String : null,
        message: json.containsKey('Message') ? json['Message'] as String : null,
      );
}
