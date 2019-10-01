import 'package:meta/meta.dart';

/// Amazon Lightsail is the easiest way to get started with AWS for developers
/// who just need virtual private servers. Lightsail includes everything you
/// need to launch your project quickly - a virtual machine, a managed database,
/// SSD-based storage, data transfer, DNS management, and a static IP - for a
/// low, predictable price. You manage those Lightsail servers through the
/// Lightsail console or by using the API or command-line interface (CLI).
///
/// For more information about Lightsail concepts and tasks, see the [Lightsail
/// Dev Guide](https://lightsail.aws.amazon.com/ls/docs/all).
///
/// To use the Lightsail API or the CLI, you will need to use AWS Identity and
/// Access Management (IAM) to generate access keys. For details about how to
/// set this up, see the [Lightsail Dev
/// Guide](http://lightsail.aws.amazon.com/ls/docs/how-to/article/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli).
class LightsailApi {
  /// Allocates a static IP address.
  Future<void> allocateStaticIp(String staticIpName) async {}

  /// Attaches a block storage disk to a running or stopped Lightsail instance
  /// and exposes it to the instance with the specified disk name.
  ///
  /// The `attach disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> attachDisk(
      {@required String diskName,
      @required String instanceName,
      @required String diskPath}) async {}

  /// Attaches one or more Lightsail instances to a load balancer.
  ///
  /// After some time, the instances are attached to the load balancer and the
  /// health check status is available.
  ///
  /// The `attach instances to load balancer` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> attachInstancesToLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> instanceNames}) async {}

  /// Attaches a Transport Layer Security (TLS) certificate to your load
  /// balancer. TLS is just an updated, more secure version of Secure Socket
  /// Layer (SSL).
  ///
  /// Once you create and validate your certificate, you can attach it to your
  /// load balancer. You can also use this API to rotate the certificates on
  /// your account. Use the `AttachLoadBalancerTlsCertificate` operation with
  /// the non-attached certificate, and it will replace the existing one and
  /// become the attached certificate.
  ///
  /// The `attach load balancer tls certificate` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> attachLoadBalancerTlsCertificate(
      {@required String loadBalancerName,
      @required String certificateName}) async {}

  /// Attaches a static IP address to a specific Amazon Lightsail instance.
  Future<void> attachStaticIp(
      {@required String staticIpName, @required String instanceName}) async {}

  /// Closes the public ports on a specific Amazon Lightsail instance.
  ///
  /// The `close instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> closeInstancePublicPorts(
      {@required PortInfo portInfo, @required String instanceName}) async {}

  /// Copies an instance or disk snapshot from one AWS Region to another in
  /// Amazon Lightsail.
  Future<void> copySnapshot(
      {@required String sourceSnapshotName,
      @required String targetSnapshotName,
      @required String sourceRegion}) async {}

  /// Creates an AWS CloudFormation stack, which creates a new Amazon EC2
  /// instance from an exported Amazon Lightsail snapshot. This operation
  /// results in a CloudFormation stack record that can be used to track the AWS
  /// CloudFormation stack created. Use the `get cloud formation stack records`
  /// operation to get a list of the CloudFormation stacks created.
  ///
  ///
  ///
  /// Wait until after your new Amazon EC2 instance is created before running
  /// the `create cloud formation stack` operation again with the same export
  /// snapshot record.
  Future<void> createCloudFormationStack(List<InstanceEntry> instances) async {}

  /// Creates a block storage disk that can be attached to a Lightsail instance
  /// in the same Availability Zone (e.g., `us-east-2a`). The disk is created in
  /// the regional endpoint that you send the HTTP request to. For more
  /// information, see [Regions and Availability Zones in
  /// Lightsail](https://lightsail.aws.amazon.com/ls/docs/overview/article/understanding-regions-and-availability-zones-in-amazon-lightsail).
  ///
  /// The `create disk` operation supports tag-based access control via request
  /// tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createDisk(
      {@required String diskName,
      @required String availabilityZone,
      @required int sizeInGb,
      List<Tag> tags}) async {}

  /// Creates a block storage disk from a disk snapshot that can be attached to
  /// a Lightsail instance in the same Availability Zone (e.g., `us-east-2a`).
  /// The disk is created in the regional endpoint that you send the HTTP
  /// request to. For more information, see [Regions and Availability Zones in
  /// Lightsail](https://lightsail.aws.amazon.com/ls/docs/overview/article/understanding-regions-and-availability-zones-in-amazon-lightsail).
  ///
  /// The `create disk from snapshot` operation supports tag-based access
  /// control via request tags and resource tags applied to the resource
  /// identified by diskSnapshotName. For more information, see the [Lightsail
  /// Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createDiskFromSnapshot(
      {@required String diskName,
      @required String diskSnapshotName,
      @required String availabilityZone,
      @required int sizeInGb,
      List<Tag> tags}) async {}

  /// Creates a snapshot of a block storage disk. You can use snapshots for
  /// backups, to make copies of disks, and to save data before shutting down a
  /// Lightsail instance.
  ///
  /// You can take a snapshot of an attached disk that is in use; however,
  /// snapshots only capture data that has been written to your disk at the time
  /// the snapshot command is issued. This may exclude any data that has been
  /// cached by any applications or the operating system. If you can pause any
  /// file systems on the disk long enough to take a snapshot, your snapshot
  /// should be complete. Nevertheless, if you cannot pause all file writes to
  /// the disk, you should unmount the disk from within the Lightsail instance,
  /// issue the create disk snapshot command, and then remount the disk to
  /// ensure a consistent and complete snapshot. You may remount and use your
  /// disk while the snapshot status is pending.
  ///
  /// You can also use this operation to create a snapshot of an instance's
  /// system volume. You might want to do this, for example, to recover data
  /// from the system volume of a botched instance or to create a backup of the
  /// system volume like you would for a block storage disk. To create a
  /// snapshot of a system volume, just define the `instance name` parameter
  /// when issuing the snapshot command, and a snapshot of the defined
  /// instance's system volume will be created. After the snapshot is available,
  /// you can create a block storage disk from the snapshot and attach it to a
  /// running instance to access the data on the disk.
  ///
  /// The `create disk snapshot` operation supports tag-based access control via
  /// request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createDiskSnapshot(String diskSnapshotName,
      {String diskName, String instanceName, List<Tag> tags}) async {}

  /// Creates a domain resource for the specified domain (e.g., example.com).
  ///
  /// The `create domain` operation supports tag-based access control via
  /// request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createDomain(String domainName, {List<Tag> tags}) async {}

  /// Creates one of the following entry records associated with the domain:
  /// Address (A), canonical name (CNAME), mail exchanger (MX), name server
  /// (NS), start of authority (SOA), service locator (SRV), or text (TXT).
  ///
  /// The `create domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {}

  /// Creates a snapshot of a specific virtual private server, or _instance_.
  /// You can use a snapshot to create a new instance that is based on that
  /// snapshot.
  ///
  /// The `create instance snapshot` operation supports tag-based access control
  /// via request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createInstanceSnapshot(
      {@required String instanceSnapshotName,
      @required String instanceName,
      List<Tag> tags}) async {}

  /// Creates one or more Amazon Lightsail virtual private servers, or
  /// _instances_. Create instances using active blueprints. Inactive blueprints
  /// are listed to support customers with existing instances but are not
  /// necessarily available for launch of new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases. Use the get blueprints operation to return a list of
  /// available blueprints.
  ///
  /// The `create instances` operation supports tag-based access control via
  /// request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createInstances(
      {@required List<String> instanceNames,
      @required String availabilityZone,
      String customImageName,
      @required String blueprintId,
      @required String bundleId,
      String userData,
      String keyPairName,
      List<Tag> tags}) async {}

  /// Uses a specific snapshot as a blueprint for creating one or more new
  /// instances that are based on that identical configuration.
  ///
  /// The `create instances from snapshot` operation supports tag-based access
  /// control via request tags and resource tags applied to the resource
  /// identified by instanceSnapshotName. For more information, see the
  /// [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createInstancesFromSnapshot(
      {@required List<String> instanceNames,
      Map<String, List<DiskMap>> attachedDiskMapping,
      @required String availabilityZone,
      @required String instanceSnapshotName,
      @required String bundleId,
      String userData,
      String keyPairName,
      List<Tag> tags}) async {}

  /// Creates an SSH key pair.
  ///
  /// The `create key pair` operation supports tag-based access control via
  /// request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createKeyPair(String keyPairName, {List<Tag> tags}) async {}

  /// Creates a Lightsail load balancer. To learn more about deciding whether to
  /// load balance your application, see [Configure your Lightsail instances for
  /// load
  /// balancing](https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing).
  /// You can create up to 5 load balancers per AWS Region in your account.
  ///
  /// When you create a load balancer, you can specify a unique name and port
  /// settings. To change additional load balancer settings, use the
  /// `UpdateLoadBalancerAttribute` operation.
  ///
  /// The `create load balancer` operation supports tag-based access control via
  /// request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createLoadBalancer(
      {@required String loadBalancerName,
      @required int instancePort,
      String healthCheckPath,
      String certificateName,
      String certificateDomainName,
      List<String> certificateAlternativeNames,
      List<Tag> tags}) async {}

  /// Creates a Lightsail load balancer TLS certificate.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// The `create load balancer tls certificate` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createLoadBalancerTlsCertificate(
      {@required String loadBalancerName,
      @required String certificateName,
      @required String certificateDomainName,
      List<String> certificateAlternativeNames,
      List<Tag> tags}) async {}

  /// Creates a new database in Amazon Lightsail.
  ///
  /// The `create relational database` operation supports tag-based access
  /// control via request tags. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createRelationalDatabase(
      {@required String relationalDatabaseName,
      String availabilityZone,
      @required String relationalDatabaseBlueprintId,
      @required String relationalDatabaseBundleId,
      @required String masterDatabaseName,
      @required String masterUsername,
      String masterUserPassword,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      bool publiclyAccessible,
      List<Tag> tags}) async {}

  /// Creates a new database from an existing database snapshot in Amazon
  /// Lightsail.
  ///
  /// You can create a new database from a snapshot in if something goes wrong
  /// with your original database, or to change it to a different plan, such as
  /// a high availability or standard plan.
  ///
  /// The `create relational database from snapshot` operation supports
  /// tag-based access control via request tags and resource tags applied to the
  /// resource identified by relationalDatabaseSnapshotName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createRelationalDatabaseFromSnapshot(
      String relationalDatabaseName,
      {String availabilityZone,
      bool publiclyAccessible,
      String relationalDatabaseSnapshotName,
      String relationalDatabaseBundleId,
      String sourceRelationalDatabaseName,
      DateTime restoreTime,
      bool useLatestRestorableTime,
      List<Tag> tags}) async {}

  /// Creates a snapshot of your database in Amazon Lightsail. You can use
  /// snapshots for backups, to make copies of a database, and to save data
  /// before deleting a database.
  ///
  /// The `create relational database snapshot` operation supports tag-based
  /// access control via request tags. For more information, see the [Lightsail
  /// Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> createRelationalDatabaseSnapshot(
      {@required String relationalDatabaseName,
      @required String relationalDatabaseSnapshotName,
      List<Tag> tags}) async {}

  /// Deletes the specified block storage disk. The disk must be in the
  /// `available` state (not attached to a Lightsail instance).
  ///
  ///  The disk may remain in the `deleting` state for several minutes.
  ///
  /// The `delete disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteDisk(String diskName) async {}

  /// Deletes the specified disk snapshot.
  ///
  /// When you make periodic snapshots of a disk, the snapshots are incremental,
  /// and only the blocks on the device that have changed since your last
  /// snapshot are saved in the new snapshot. When you delete a snapshot, only
  /// the data not needed for any other snapshot is removed. So regardless of
  /// which prior snapshots have been deleted, all active snapshots will have
  /// access to all the information needed to restore the disk.
  ///
  /// The `delete disk snapshot` operation supports tag-based access control via
  /// resource tags applied to the resource identified by diskSnapshotName. For
  /// more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteDiskSnapshot(String diskSnapshotName) async {}

  /// Deletes the specified domain recordset and all of its domain records.
  ///
  /// The `delete domain` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteDomain(String domainName) async {}

  /// Deletes a specific domain entry.
  ///
  /// The `delete domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {}

  /// Deletes a specific Amazon Lightsail virtual private server, or _instance_.
  ///
  /// The `delete instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteInstance(String instanceName) async {}

  /// Deletes a specific snapshot of a virtual private server (or _instance_).
  ///
  /// The `delete instance snapshot` operation supports tag-based access control
  /// via resource tags applied to the resource identified by
  /// instanceSnapshotName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteInstanceSnapshot(String instanceSnapshotName) async {}

  /// Deletes a specific SSH key pair.
  ///
  /// The `delete key pair` operation supports tag-based access control via
  /// resource tags applied to the resource identified by keyPairName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteKeyPair(String keyPairName) async {}

  /// Deletes the known host key or certificate used by the Amazon Lightsail
  /// browser-based SSH or RDP clients to authenticate an instance. This
  /// operation enables the Lightsail browser-based SSH or RDP clients to
  /// connect to the instance after a host key mismatch.
  ///
  ///
  ///
  /// Perform this operation only if you were expecting the host key or
  /// certificate mismatch or if you are familiar with the new host key or
  /// certificate on the instance. For more information, see [Troubleshooting
  /// connection issues when using the Amazon Lightsail browser-based SSH or RDP
  /// client](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection).
  Future<void> deleteKnownHostKeys(String instanceName) async {}

  /// Deletes a Lightsail load balancer and all its associated SSL/TLS
  /// certificates. Once the load balancer is deleted, you will need to create a
  /// new load balancer, create a new certificate, and verify domain ownership
  /// again.
  ///
  /// The `delete load balancer` operation supports tag-based access control via
  /// resource tags applied to the resource identified by loadBalancerName. For
  /// more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteLoadBalancer(String loadBalancerName) async {}

  /// Deletes an SSL/TLS certificate associated with a Lightsail load balancer.
  ///
  /// The `delete load balancer tls certificate` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteLoadBalancerTlsCertificate(
      {@required String loadBalancerName,
      @required String certificateName,
      bool force}) async {}

  /// Deletes a database in Amazon Lightsail.
  ///
  /// The `delete relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteRelationalDatabase(String relationalDatabaseName,
      {bool skipFinalSnapshot,
      String finalRelationalDatabaseSnapshotName}) async {}

  /// Deletes a database snapshot in Amazon Lightsail.
  ///
  /// The `delete relational database snapshot` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> deleteRelationalDatabaseSnapshot(
      String relationalDatabaseSnapshotName) async {}

  /// Detaches a stopped block storage disk from a Lightsail instance. Make sure
  /// to unmount any file systems on the device within your operating system
  /// before stopping the instance and detaching the disk.
  ///
  /// The `detach disk` operation supports tag-based access control via resource
  /// tags applied to the resource identified by diskName. For more information,
  /// see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> detachDisk(String diskName) async {}

  /// Detaches the specified instances from a Lightsail load balancer.
  ///
  /// This operation waits until the instances are no longer needed before they
  /// are detached from the load balancer.
  ///
  /// The `detach instances from load balancer` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> detachInstancesFromLoadBalancer(
      {@required String loadBalancerName,
      @required List<String> instanceNames}) async {}

  /// Detaches a static IP from the Amazon Lightsail instance to which it is
  /// attached.
  Future<void> detachStaticIp(String staticIpName) async {}

  /// Downloads the default SSH key pair from the user's account.
  Future<void> downloadDefaultKeyPair() async {}

  /// Exports an Amazon Lightsail instance or block storage disk snapshot to
  /// Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an
  /// export snapshot record that can be used with the `create cloud formation
  /// stack` operation to create new Amazon EC2 instances.
  ///
  /// Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images
  /// (AMIs), and the instance system disk appears as an Amazon Elastic Block
  /// Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as
  /// Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services
  /// Region in Amazon EC2 as the source Lightsail snapshot.
  ///
  /// The `export snapshot` operation supports tag-based access control via
  /// resource tags applied to the resource identified by sourceSnapshotName.
  /// For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  ///
  ///
  ///
  /// Use the `get instance snapshots` or `get disk snapshots` operations to get
  /// a list of snapshots that you can export to Amazon EC2.
  Future<void> exportSnapshot(String sourceSnapshotName) async {}

  /// Returns the names of all active (not deleted) resources.
  Future<void> getActiveNames({String pageToken}) async {}

  /// Returns the list of available instance images, or _blueprints_. You can
  /// use a blueprint to create a new virtual private server already running a
  /// specific operating system, as well as a preinstalled app or development
  /// stack. The software each instance is running depends on the blueprint
  /// image you choose.
  Future<void> getBlueprints({bool includeInactive, String pageToken}) async {}

  /// Returns the list of bundles that are available for purchase. A bundle
  /// describes the specs for your virtual private server (or _instance_).
  Future<void> getBundles({bool includeInactive, String pageToken}) async {}

  /// Returns the CloudFormation stack record created as a result of the `create
  /// cloud formation stack` operation.
  ///
  /// An AWS CloudFormation stack is used to create a new Amazon EC2 instance
  /// from an exported Lightsail snapshot.
  Future<void> getCloudFormationStackRecords({String pageToken}) async {}

  /// Returns information about a specific block storage disk.
  Future<void> getDisk(String diskName) async {}

  /// Returns information about a specific block storage disk snapshot.
  Future<void> getDiskSnapshot(String diskSnapshotName) async {}

  /// Returns information about all block storage disk snapshots in your AWS
  /// account and region.
  ///
  /// If you are describing a long list of disk snapshots, you can paginate the
  /// output to make the list more manageable. You can use the pageToken and
  /// nextPageToken values to retrieve the next items in the list.
  Future<void> getDiskSnapshots({String pageToken}) async {}

  /// Returns information about all block storage disks in your AWS account and
  /// region.
  ///
  /// If you are describing a long list of disks, you can paginate the output to
  /// make the list more manageable. You can use the pageToken and nextPageToken
  /// values to retrieve the next items in the list.
  Future<void> getDisks({String pageToken}) async {}

  /// Returns information about a specific domain recordset.
  Future<void> getDomain(String domainName) async {}

  /// Returns a list of all domains in the user's account.
  Future<void> getDomains({String pageToken}) async {}

  /// Returns the export snapshot record created as a result of the `export
  /// snapshot` operation.
  ///
  /// An export snapshot record can be used to create a new Amazon EC2 instance
  /// and its related resources with the `create cloud formation stack`
  /// operation.
  Future<void> getExportSnapshotRecords({String pageToken}) async {}

  /// Returns information about a specific Amazon Lightsail instance, which is a
  /// virtual private server.
  Future<void> getInstance(String instanceName) async {}

  /// Returns temporary SSH keys you can use to connect to a specific virtual
  /// private server, or _instance_.
  ///
  /// The `get instance access details` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> getInstanceAccessDetails(String instanceName,
      {String protocol}) async {}

  /// Returns the data points for the specified Amazon Lightsail instance
  /// metric, given an instance name.
  Future<void> getInstanceMetricData(
      {@required String instanceName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {}

  /// Returns the port states for a specific virtual private server, or
  /// _instance_.
  Future<void> getInstancePortStates(String instanceName) async {}

  /// Returns information about a specific instance snapshot.
  Future<void> getInstanceSnapshot(String instanceSnapshotName) async {}

  /// Returns all instance snapshots for the user's account.
  Future<void> getInstanceSnapshots({String pageToken}) async {}

  /// Returns the state of a specific instance. Works on one instance at a time.
  Future<void> getInstanceState(String instanceName) async {}

  /// Returns information about all Amazon Lightsail virtual private servers, or
  /// _instances_.
  Future<void> getInstances({String pageToken}) async {}

  /// Returns information about a specific key pair.
  Future<void> getKeyPair(String keyPairName) async {}

  /// Returns information about all key pairs in the user's account.
  Future<void> getKeyPairs({String pageToken}) async {}

  /// Returns information about the specified Lightsail load balancer.
  Future<void> getLoadBalancer(String loadBalancerName) async {}

  /// Returns information about health metrics for your Lightsail load balancer.
  Future<void> getLoadBalancerMetricData(
      {@required String loadBalancerName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {}

  /// Returns information about the TLS certificates that are associated with
  /// the specified Lightsail load balancer.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// You can have a maximum of 2 certificates associated with a Lightsail load
  /// balancer. One is active and the other is inactive.
  Future<void> getLoadBalancerTlsCertificates(String loadBalancerName) async {}

  /// Returns information about all load balancers in an account.
  ///
  /// If you are describing a long list of load balancers, you can paginate the
  /// output to make the list more manageable. You can use the pageToken and
  /// nextPageToken values to retrieve the next items in the list.
  Future<void> getLoadBalancers({String pageToken}) async {}

  /// Returns information about a specific operation. Operations include events
  /// such as when you create an instance, allocate a static IP, attach a static
  /// IP, and so on.
  Future<void> getOperation(String operationId) async {}

  /// Returns information about all operations.
  ///
  /// Results are returned from oldest to newest, up to a maximum of 200.
  /// Results can be paged by making each subsequent call to `GetOperations` use
  /// the maximum (last) `statusChangedAt` value from the previous request.
  Future<void> getOperations({String pageToken}) async {}

  /// Gets operations for a specific resource (e.g., an instance or a static
  /// IP).
  Future<void> getOperationsForResource(String resourceName,
      {String pageToken}) async {}

  /// Returns a list of all valid regions for Amazon Lightsail. Use the `include
  /// availability zones` parameter to also return the Availability Zones in a
  /// region.
  Future<void> getRegions(
      {bool includeAvailabilityZones,
      bool includeRelationalDatabaseAvailabilityZones}) async {}

  /// Returns information about a specific database in Amazon Lightsail.
  Future<void> getRelationalDatabase(String relationalDatabaseName) async {}

  /// Returns a list of available database blueprints in Amazon Lightsail. A
  /// blueprint describes the major engine version of a database.
  ///
  /// You can use a blueprint ID to create a new database that runs a specific
  /// database engine.
  Future<void> getRelationalDatabaseBlueprints({String pageToken}) async {}

  /// Returns the list of bundles that are available in Amazon Lightsail. A
  /// bundle describes the performance specifications for a database.
  ///
  /// You can use a bundle ID to create a new database with explicit performance
  /// specifications.
  Future<void> getRelationalDatabaseBundles({String pageToken}) async {}

  /// Returns a list of events for a specific database in Amazon Lightsail.
  Future<void> getRelationalDatabaseEvents(String relationalDatabaseName,
      {int durationInMinutes, String pageToken}) async {}

  /// Returns a list of log events for a database in Amazon Lightsail.
  Future<void> getRelationalDatabaseLogEvents(
      {@required String relationalDatabaseName,
      @required String logStreamName,
      DateTime startTime,
      DateTime endTime,
      bool startFromHead,
      String pageToken}) async {}

  /// Returns a list of available log streams for a specific database in Amazon
  /// Lightsail.
  Future<void> getRelationalDatabaseLogStreams(
      String relationalDatabaseName) async {}

  /// Returns the current, previous, or pending versions of the master user
  /// password for a Lightsail database.
  ///
  /// The `asdf` operation GetRelationalDatabaseMasterUserPassword supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by relationalDatabaseName.
  Future<void> getRelationalDatabaseMasterUserPassword(
      String relationalDatabaseName,
      {String passwordVersion}) async {}

  /// Returns the data points of the specified metric for a database in Amazon
  /// Lightsail.
  Future<void> getRelationalDatabaseMetricData(
      {@required String relationalDatabaseName,
      @required String metricName,
      @required int period,
      @required DateTime startTime,
      @required DateTime endTime,
      @required String unit,
      @required List<String> statistics}) async {}

  /// Returns all of the runtime parameters offered by the underlying database
  /// software, or engine, for a specific database in Amazon Lightsail.
  ///
  /// In addition to the parameter names and values, this operation returns
  /// other information about each parameter. This information includes whether
  /// changes require a reboot, whether the parameter is modifiable, the allowed
  /// values, and the data types.
  Future<void> getRelationalDatabaseParameters(String relationalDatabaseName,
      {String pageToken}) async {}

  /// Returns information about a specific database snapshot in Amazon
  /// Lightsail.
  Future<void> getRelationalDatabaseSnapshot(
      String relationalDatabaseSnapshotName) async {}

  /// Returns information about all of your database snapshots in Amazon
  /// Lightsail.
  Future<void> getRelationalDatabaseSnapshots({String pageToken}) async {}

  /// Returns information about all of your databases in Amazon Lightsail.
  Future<void> getRelationalDatabases({String pageToken}) async {}

  /// Returns information about a specific static IP.
  Future<void> getStaticIp(String staticIpName) async {}

  /// Returns information about all static IPs in the user's account.
  Future<void> getStaticIps({String pageToken}) async {}

  /// Imports a public SSH key from a specific key pair.
  Future<void> importKeyPair(
      {@required String keyPairName, @required String publicKeyBase64}) async {}

  /// Returns a Boolean value indicating whether your Lightsail VPC is peered.
  Future<void> isVpcPeered() async {}

  /// Adds public ports to an Amazon Lightsail instance.
  ///
  /// The `open instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> openInstancePublicPorts(
      {@required PortInfo portInfo, @required String instanceName}) async {}

  /// Tries to peer the Lightsail VPC with the user's default VPC.
  Future<void> peerVpc() async {}

  /// Sets the specified open ports for an Amazon Lightsail instance, and closes
  /// all ports for every protocol not included in the current request.
  ///
  /// The `put instance public ports` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// instanceName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> putInstancePublicPorts(
      {@required List<PortInfo> portInfos,
      @required String instanceName}) async {}

  /// Restarts a specific instance.
  ///
  /// The `reboot instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> rebootInstance(String instanceName) async {}

  /// Restarts a specific database in Amazon Lightsail.
  ///
  /// The `reboot relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> rebootRelationalDatabase(String relationalDatabaseName) async {}

  /// Deletes a specific static IP from your account.
  Future<void> releaseStaticIp(String staticIpName) async {}

  /// Starts a specific Amazon Lightsail instance from a stopped state. To
  /// restart an instance, use the `reboot instance` operation.
  ///
  ///  When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip).
  ///
  ///
  /// The `start instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> startInstance(String instanceName) async {}

  /// Starts a specific database from a stopped state in Amazon Lightsail. To
  /// restart a database, use the `reboot relational database` operation.
  ///
  /// The `start relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> startRelationalDatabase(String relationalDatabaseName) async {}

  /// Stops a specific Amazon Lightsail instance that is currently running.
  ///
  ///  When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip).
  ///
  ///
  /// The `stop instance` operation supports tag-based access control via
  /// resource tags applied to the resource identified by instanceName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> stopInstance(String instanceName, {bool force}) async {}

  /// Stops a specific database that is currently running in Amazon Lightsail.
  ///
  /// The `stop relational database` operation supports tag-based access control
  /// via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> stopRelationalDatabase(String relationalDatabaseName,
      {String relationalDatabaseSnapshotName}) async {}

  /// Adds one or more tags to the specified Amazon Lightsail resource. Each
  /// resource can have a maximum of 50 tags. Each tag consists of a key and an
  /// optional value. Tag keys must be unique per resource. For more information
  /// about tags, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags).
  ///
  /// The `tag resource` operation supports tag-based access control via request
  /// tags and resource tags applied to the resource identified by resourceName.
  /// For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> tagResource(
      {@required String resourceName, @required List<Tag> tags}) async {}

  /// Attempts to unpeer the Lightsail VPC from the user's default VPC.
  Future<void> unpeerVpc() async {}

  /// Deletes the specified set of tag keys and their values from the specified
  /// Amazon Lightsail resource.
  ///
  /// The `untag resource` operation supports tag-based access control via
  /// request tags and resource tags applied to the resource identified by
  /// resourceName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> untagResource(
      {@required String resourceName, @required List<String> tagKeys}) async {}

  /// Updates a domain recordset after it is created.
  ///
  /// The `update domain entry` operation supports tag-based access control via
  /// resource tags applied to the resource identified by domainName. For more
  /// information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> updateDomainEntry(
      {@required String domainName, @required DomainEntry domainEntry}) async {}

  /// Updates the specified attribute for a load balancer. You can only update
  /// one attribute at a time.
  ///
  /// The `update load balancer attribute` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// loadBalancerName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> updateLoadBalancerAttribute(
      {@required String loadBalancerName,
      @required String attributeName,
      @required String attributeValue}) async {}

  /// Allows the update of one or more attributes of a database in Amazon
  /// Lightsail.
  ///
  /// Updates are applied immediately, or in cases where the updates could
  /// result in an outage, are applied during the database's predefined
  /// maintenance window.
  ///
  /// The `update relational database` operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> updateRelationalDatabase(String relationalDatabaseName,
      {String masterUserPassword,
      bool rotateMasterUserPassword,
      String preferredBackupWindow,
      String preferredMaintenanceWindow,
      bool enableBackupRetention,
      bool disableBackupRetention,
      bool publiclyAccessible,
      bool applyImmediately}) async {}

  /// Allows the update of one or more parameters of a database in Amazon
  /// Lightsail.
  ///
  /// Parameter updates don't cause outages; therefore, their application is not
  /// subject to the preferred maintenance window. However, there are two ways
  /// in which paramater updates are applied: `dynamic` or `pending-reboot`.
  /// Parameters marked with a `dynamic` apply type are applied immediately.
  /// Parameters marked with a `pending-reboot` apply type are applied only
  /// after the database is rebooted using the `reboot relational database`
  /// operation.
  ///
  /// The `update relational database parameters` operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the [Lightsail Dev
  /// Guide](https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags).
  Future<void> updateRelationalDatabaseParameters(
      {@required String relationalDatabaseName,
      @required List<RelationalDatabaseParameter> parameters}) async {}
}

class AllocateStaticIpResult {}

class AttachDiskResult {}

class AttachInstancesToLoadBalancerResult {}

class AttachLoadBalancerTlsCertificateResult {}

class AttachStaticIpResult {}

class AvailabilityZone {}

class Blueprint {}

class Bundle {}

class CloseInstancePublicPortsResult {}

class CloudFormationStackRecord {}

class CloudFormationStackRecordSourceInfo {}

class CopySnapshotResult {}

class CreateCloudFormationStackResult {}

class CreateDiskFromSnapshotResult {}

class CreateDiskResult {}

class CreateDiskSnapshotResult {}

class CreateDomainEntryResult {}

class CreateDomainResult {}

class CreateInstanceSnapshotResult {}

class CreateInstancesFromSnapshotResult {}

class CreateInstancesResult {}

class CreateKeyPairResult {}

class CreateLoadBalancerResult {}

class CreateLoadBalancerTlsCertificateResult {}

class CreateRelationalDatabaseFromSnapshotResult {}

class CreateRelationalDatabaseResult {}

class CreateRelationalDatabaseSnapshotResult {}

class DeleteDiskResult {}

class DeleteDiskSnapshotResult {}

class DeleteDomainEntryResult {}

class DeleteDomainResult {}

class DeleteInstanceResult {}

class DeleteInstanceSnapshotResult {}

class DeleteKeyPairResult {}

class DeleteKnownHostKeysResult {}

class DeleteLoadBalancerResult {}

class DeleteLoadBalancerTlsCertificateResult {}

class DeleteRelationalDatabaseResult {}

class DeleteRelationalDatabaseSnapshotResult {}

class DestinationInfo {}

class DetachDiskResult {}

class DetachInstancesFromLoadBalancerResult {}

class DetachStaticIpResult {}

class Disk {}

class DiskInfo {}

class DiskMap {}

class DiskSnapshot {}

class DiskSnapshotInfo {}

class Domain {}

class DomainEntry {}

class DownloadDefaultKeyPairResult {}

class ExportSnapshotRecord {}

class ExportSnapshotRecordSourceInfo {}

class ExportSnapshotResult {}

class GetActiveNamesResult {}

class GetBlueprintsResult {}

class GetBundlesResult {}

class GetCloudFormationStackRecordsResult {}

class GetDiskResult {}

class GetDiskSnapshotResult {}

class GetDiskSnapshotsResult {}

class GetDisksResult {}

class GetDomainResult {}

class GetDomainsResult {}

class GetExportSnapshotRecordsResult {}

class GetInstanceAccessDetailsResult {}

class GetInstanceMetricDataResult {}

class GetInstancePortStatesResult {}

class GetInstanceResult {}

class GetInstanceSnapshotResult {}

class GetInstanceSnapshotsResult {}

class GetInstanceStateResult {}

class GetInstancesResult {}

class GetKeyPairResult {}

class GetKeyPairsResult {}

class GetLoadBalancerMetricDataResult {}

class GetLoadBalancerResult {}

class GetLoadBalancerTlsCertificatesResult {}

class GetLoadBalancersResult {}

class GetOperationResult {}

class GetOperationsForResourceResult {}

class GetOperationsResult {}

class GetRegionsResult {}

class GetRelationalDatabaseBlueprintsResult {}

class GetRelationalDatabaseBundlesResult {}

class GetRelationalDatabaseEventsResult {}

class GetRelationalDatabaseLogEventsResult {}

class GetRelationalDatabaseLogStreamsResult {}

class GetRelationalDatabaseMasterUserPasswordResult {}

class GetRelationalDatabaseMetricDataResult {}

class GetRelationalDatabaseParametersResult {}

class GetRelationalDatabaseResult {}

class GetRelationalDatabaseSnapshotResult {}

class GetRelationalDatabaseSnapshotsResult {}

class GetRelationalDatabasesResult {}

class GetStaticIpResult {}

class GetStaticIpsResult {}

class HostKeyAttributes {}

class ImportKeyPairResult {}

class Instance {}

class InstanceAccessDetails {}

class InstanceEntry {}

class InstanceHardware {}

class InstanceHealthSummary {}

class InstanceNetworking {}

class InstancePortInfo {}

class InstancePortState {}

class InstanceSnapshot {}

class InstanceSnapshotInfo {}

class InstanceState {}

class IsVpcPeeredResult {}

class KeyPair {}

class LoadBalancer {}

class LoadBalancerTlsCertificate {}

class LoadBalancerTlsCertificateDomainValidationOption {}

class LoadBalancerTlsCertificateDomainValidationRecord {}

class LoadBalancerTlsCertificateRenewalSummary {}

class LoadBalancerTlsCertificateSummary {}

class LogEvent {}

class MetricDatapoint {}

class MonthlyTransfer {}

class OpenInstancePublicPortsResult {}

class Operation {}

class PasswordData {}

class PeerVpcResult {}

class PendingMaintenanceAction {}

class PendingModifiedRelationalDatabaseValues {}

class PortInfo {}

class PutInstancePublicPortsResult {}

class RebootInstanceResult {}

class RebootRelationalDatabaseResult {}

class Region {}

class RelationalDatabase {}

class RelationalDatabaseBlueprint {}

class RelationalDatabaseBundle {}

class RelationalDatabaseEndpoint {}

class RelationalDatabaseEvent {}

class RelationalDatabaseHardware {}

class RelationalDatabaseParameter {}

class RelationalDatabaseSnapshot {}

class ReleaseStaticIpResult {}

class ResourceLocation {}

class StartInstanceResult {}

class StartRelationalDatabaseResult {}

class StaticIp {}

class StopInstanceResult {}

class StopRelationalDatabaseResult {}

class Tag {}

class TagResourceResult {}

class UnpeerVpcResult {}

class UntagResourceResult {}

class UpdateDomainEntryResult {}

class UpdateLoadBalancerAttributeResult {}

class UpdateRelationalDatabaseParametersResult {}

class UpdateRelationalDatabaseResult {}
